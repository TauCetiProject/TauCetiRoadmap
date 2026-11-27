module

public import Mathlib
public import TauCeti.Analysis.PDE.DirichletProblem
public import TauCeti.Analysis.PDE.Ellipticity.Basic
public import TauCeti.Analysis.Sobolev.W1p.Restriction
public import TauCeti.Analysis.Sobolev.W1p.Zero
public import TauCeti.Analysis.Sobolev.Wkp.Restriction

/-!
# Galerkin methods and Lagrange finite elements: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions): the ambient space is `E d = EuclideanSpace ℝ (Fin d)` with
Lebesgue measure `volume`; bilinear forms are bundled as `A : V →L[ℝ] StrongDual ℝ W`, so `A v w`
is `a(v, w)`, and the restriction of `A v` to a test space `Y` is `(A v).comp Y.subtypeL`;
inf-sup and coercivity constants are explicit positive reals with an inequality, never an
infimum; best approximation is `Metric.infDist u X`. `cellDiam K` is the diameter `h_K` of a cell
and `cellInball K = 2 * K.inradius` is the diameter `ρ_K` of its inscribed ball, so shape
regularity reads `h_K ≤ σ ρ_K`. The Sobolev spaces are Tau Ceti's `W1p`, `W1p0` and `Wkp`.

Five definitions are local copies of SobolevPolynomialApproximation, verbatim: `E` (its
Conventions), `evalₗ` and `polynomialsDegLE` (its §1.2), `toOrderL` and `seminorm` (its §1.3).

Seven declarations carry proofs: `norm_le_of_infSup`, `infSup_of_coercive`,
`infSup_restrict_of_coercive`, `galerkin_orthogonality`, `dof_shapeFunction` and
`localInterpolant_inclusion` are headlines that close by unfolding and are proved sanity checks;
`cellOpen_le_domainOpens` is a supporting step, not a target.

Bold headlines of the README not stated here: the stability of the Scott–Zhang operator and its
`p = ∞` form (5.2), and the converse of the boundary characterization of 4.2, which are stated in
prose.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.GalerkinMethodsAndLagrangeFiniteElements

open TauCeti TauCeti.PDE MeasureTheory Set Metric Filter TopologicalSpace
open scoped ENNReal NNReal Topology InnerProductSpace

/-! ## Local copies -/

/-- Euclidean space `ℝⁿ`. Local copy of `E` of SobolevPolynomialApproximation, Conventions. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- Evaluation of a real polynomial in `n` variables as a function on `E n`. Local copy of
`evalₗ` of SobolevPolynomialApproximation, §1.2. -/
def evalₗ (n : ℕ) : MvPolynomial (Fin n) ℝ →ₗ[ℝ] (E n → ℝ) where
  toFun q x := MvPolynomial.eval (fun i => x i) q
  map_add' q r := by ext x; simp
  map_smul' c q := by ext x; simp

/-- The polynomial functions of total degree at most `m` on `E n`. Local copy of
`polynomialsDegLE` of SobolevPolynomialApproximation, §1.2. -/
def polynomialsDegLE (n m : ℕ) : Submodule ℝ (E n → ℝ) :=
  (MvPolynomial.restrictTotalDegree (Fin n) ℝ m).map (evalₗ n)

section SobolevCopies

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- The embedding `W^{k,p}(Ω) → W^{j,p}(Ω)` for `j ≤ k`. Local copy of `toOrderL` of
SobolevPolynomialApproximation, §1.3. -/
def toOrderL {j k : ℕ} (h : j ≤ k) : Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j :=
  Nat.leRec (motive := fun k _ => Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j)
    (ContinuousLinearMap.id ℝ _) (fun k _ ih => ih.comp (Wkp.lowerOrderL k)) h

/-- The Sobolev seminorm `|u|_{W^{j,p}(Ω)}` of `u ∈ W^{k,p}(Ω)`, `j ≤ k`. Local copy of
`seminorm` of SobolevPolynomialApproximation, §1.3. -/
def seminorm (k : ℕ) : (j : ℕ) → j ≤ k → Wkp volume Ω p k → ℝ
  | 0, _, u => ‖Wkp.value k u‖
  | j + 1, h, u => ‖Wkp.iteratedGradient j (toOrderL h u)‖

end SobolevCopies

/-! ## Layer 1: abstract Galerkin theory -/

section Abstract

variable {V W : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W]

/-- **Banach–Nečas–Babuška** (README 1.1): for `V` Banach and `W` reflexive, `A` is bijective
iff it satisfies the inf-sup condition and its adjoint is injective. -/
theorem bijective_iff_infSup [CompleteSpace V] [CompleteSpace W] (A : V →L[ℝ] StrongDual ℝ W)
    (hW : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ W)) :
    Function.Bijective A ↔
      (∃ α > (0 : ℝ), ∀ v, α * ‖v‖ ≤ ‖A v‖) ∧ ∀ w, (∀ v, A v w = 0) → w = 0 := sorry

/-- The a priori bound `‖u‖ ≤ ‖ℓ‖ / α` under the inf-sup condition (README 1.1). -/
theorem norm_le_of_infSup (A : V →L[ℝ] StrongDual ℝ W) {α : ℝ} (hα : 0 < α)
    (hA : ∀ v, α * ‖v‖ ≤ ‖A v‖) {u : V} {ℓ : StrongDual ℝ W} (hu : A u = ℓ) :
    ‖u‖ ≤ ‖ℓ‖ / α := by
  rw [le_div_iff₀ hα, mul_comm, ← hu]
  exact hA u

/-- A coercive form satisfies both conditions of `bijective_iff_infSup` with the same constant
(README 1.1). -/
theorem infSup_of_coercive (B : V →L[ℝ] V →L[ℝ] ℝ) {α : ℝ} (hα : 0 < α)
    (hB : ∀ v, α * ‖v‖ ^ 2 ≤ B v v) :
    (∀ v, α * ‖v‖ ≤ ‖B v‖) ∧ ∀ w, (∀ v, B v w = 0) → w = 0 := by
  refine ⟨fun v => ?_, fun w hw => ?_⟩
  · rcases (norm_nonneg v).eq_or_lt with h0 | hpos
    · rw [← h0, mul_zero]; exact norm_nonneg _
    · have h1 : α * ‖v‖ ^ 2 ≤ ‖B v‖ * ‖v‖ :=
        (hB v).trans ((le_abs_self _).trans (by simpa using (B v).le_opNorm v))
      nlinarith
  · have := hB w
    rw [hw w] at this
    have h2 : ‖w‖ ^ 2 ≤ 0 := by nlinarith
    exact norm_eq_zero.mp (by nlinarith [norm_nonneg w])

/-- **Discrete well-posedness** (README 1.2): the restricted problem is bijective iff the
dimensions agree and the discrete inf-sup condition holds. -/
theorem bijective_restrict_iff (A : V →L[ℝ] StrongDual ℝ W) (X : Submodule ℝ V)
    (Y : Submodule ℝ W) [FiniteDimensional ℝ X] [FiniteDimensional ℝ Y] :
    Function.Bijective (fun v : X ↦ (A v).comp Y.subtypeL) ↔
      Module.finrank ℝ X = Module.finrank ℝ Y ∧
        ∃ α > (0 : ℝ), ∀ v : X, α * ‖v‖ ≤ ‖(A v).comp Y.subtypeL‖ := sorry

/-- Coercivity passes to every subspace with the same constant (README 1.2). -/
theorem infSup_restrict_of_coercive (B : V →L[ℝ] V →L[ℝ] ℝ) (X : Submodule ℝ V) {α : ℝ}
    (hB : ∀ v, α * ‖v‖ ^ 2 ≤ B v v) :
    ∀ v : X, α * ‖v‖ ≤ ‖(B v).comp X.subtypeL‖ := by
  intro v
  set R : StrongDual ℝ X := (B v).comp X.subtypeL
  have hR : 0 ≤ ‖R‖ := norm_nonneg R
  rcases (norm_nonneg v).eq_or_lt with h0 | hpos
  · rw [← h0, mul_zero]; exact hR
  · have hv : B v v = R v := rfl
    have h1 : α * ‖v‖ ^ 2 ≤ ‖R‖ * ‖v‖ :=
      ((hB v).trans_eq hv).trans ((le_abs_self _).trans (R.le_opNorm v))
    nlinarith

/-- **Fortin's criterion** (README 1.2): a Fortin operator with `γ ‖P w‖ ≤ ‖w‖` gives the
discrete inf-sup constant `γ α`. -/
theorem infSup_restrict_of_fortin (A : V →L[ℝ] StrongDual ℝ W) (X : Submodule ℝ V)
    (Y : Submodule ℝ W) (P : W → Y) {α γ : ℝ} (hα : 0 < α)
    (hA : ∀ v, α * ‖v‖ ≤ ‖A v‖) (hP : ∀ w, γ * ‖P w‖ ≤ ‖w‖)
    (hfortin : ∀ (v : X) (w : W), A v (P w) = A v w) :
    ∀ v : X, γ * α * ‖v‖ ≤ ‖(A v).comp Y.subtypeL‖ := sorry

/-- **Converse of Fortin's criterion** (README 1.2): a discrete inf-sup condition with
constant `α` yields a linear idempotent Fortin operator with `γ = α / ‖A‖`. -/
theorem exists_fortin_of_infSup {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (A : V →L[ℝ] StrongDual ℝ H) (X : Submodule ℝ V) (Y : Submodule ℝ H)
    [FiniteDimensional ℝ X] [FiniteDimensional ℝ Y] {α : ℝ} (hα : 0 < α)
    (hstab : ∀ v : X, α * ‖v‖ ≤ ‖(A v).comp Y.subtypeL‖) :
    ∃ P : H →L[ℝ] Y, (∀ w, P (P w : H) = P w) ∧ (∀ (v : X) (w : H), A v (P w) = A v w) ∧
      ∀ w, α / ‖A‖ * ‖P w‖ ≤ ‖w‖ := sorry

/-- **Galerkin orthogonality** (README 1.3). -/
theorem galerkin_orthogonality (A : V →L[ℝ] StrongDual ℝ W) (X : Submodule ℝ V)
    (Y : Submodule ℝ W) {u : V} {uh : X} {ℓ : StrongDual ℝ W} (hu : A u = ℓ)
    (huh : ∀ w : Y, A uh w = ℓ w) : ∀ w : Y, A (u - uh) w = 0 := by
  intro w
  rw [map_sub, sub_apply, hu, huh, sub_self]

/-- **Babuška's quasi-optimality** (README 1.3) with constant `1 + ‖A‖ / α`. -/
theorem norm_sub_le_of_infSup (A : V →L[ℝ] StrongDual ℝ W) (X : Submodule ℝ V)
    (Y : Submodule ℝ W) {α : ℝ} (hα : 0 < α)
    (hstab : ∀ v : X, α * ‖v‖ ≤ ‖(A v).comp Y.subtypeL‖) {u : V} {uh : X}
    (horth : ∀ w : Y, A (u - uh) w = 0) :
    ‖u - uh‖ ≤ (1 + ‖A‖ / α) * infDist u (X : Set V) := sorry

/-- **Xu–Zikatanov** (README 1.3): on a Hilbert trial space with equal dimensions and
`X ≠ ⊥` the constant improves to `‖A‖ / α`. -/
theorem norm_sub_le_of_infSup_of_hilbert {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] (A : H →L[ℝ] StrongDual ℝ W)
    (X : Submodule ℝ H) (Y : Submodule ℝ W) [FiniteDimensional ℝ X] [FiniteDimensional ℝ Y]
    (hdim : Module.finrank ℝ X = Module.finrank ℝ Y) (hX : X ≠ ⊥) {α : ℝ} (hα : 0 < α)
    (hstab : ∀ v : X, α * ‖v‖ ≤ ‖(A v).comp Y.subtypeL‖) {u : H} {uh : X}
    (horth : ∀ w : Y, A (u - uh) w = 0) :
    ‖u - uh‖ ≤ ‖A‖ / α * infDist u (X : Set H) := sorry

/-- **Céa's lemma** (README 1.3). -/
theorem norm_sub_le_of_coercive (B : V →L[ℝ] V →L[ℝ] ℝ) (X : Submodule ℝ V) {α : ℝ}
    (hα : 0 < α) (hB : ∀ v, α * ‖v‖ ^ 2 ≤ B v v) {u : V} {uh : X}
    (horth : ∀ w : X, B (u - uh) w = 0) :
    ‖u - uh‖ ≤ ‖B‖ / α * infDist u (X : Set V) := sorry

/-- **Céa's lemma for a symmetric form** (README 1.3), constant `√(‖B‖ / α)`. -/
theorem norm_sub_le_of_coercive_of_symm (B : V →L[ℝ] V →L[ℝ] ℝ) (X : Submodule ℝ V) {α : ℝ}
    (hα : 0 < α) (hB : ∀ v, α * ‖v‖ ^ 2 ≤ B v v) (hsymm : ∀ v w, B v w = B w v) {u : V}
    {uh : X} (horth : ∀ w : X, B (u - uh) w = 0) :
    ‖u - uh‖ ≤ √(‖B‖ / α) * infDist u (X : Set V) := sorry

/-- **First Strang lemma** (README 1.4), pointwise in the comparison function `v`. -/
theorem norm_sub_le_strang_first (A : V →L[ℝ] StrongDual ℝ W) (X : Submodule ℝ V)
    (Y : Submodule ℝ W) (Ah : X →L[ℝ] StrongDual ℝ Y) {α : ℝ} (hα : 0 < α)
    (hstab : ∀ v : X, α * ‖v‖ ≤ ‖Ah v‖) {u : V} {uh : X} {ℓ : StrongDual ℝ W}
    {ℓh : StrongDual ℝ Y} (hu : A u = ℓ) (huh : Ah uh = ℓh) (v : X) :
    ‖u - uh‖ ≤ (1 + ‖A‖ / α) * ‖u - v‖ +
      ‖ℓh - ℓ.comp Y.subtypeL + (A v).comp Y.subtypeL - Ah v‖ / α := sorry

/-- **Second Strang lemma** (README 1.4): nonconforming `Xh` in an ambient space `Z`. -/
theorem norm_sub_le_strang_second {Z : Type*} [NormedAddCommGroup Z] [NormedSpace ℝ Z]
    (Xh : Submodule ℝ Z) (Ah : Z →L[ℝ] StrongDual ℝ W) {α : ℝ} (hα : 0 < α)
    (hstab : ∀ v : Xh, α * ‖v‖ ≤ ‖Ah v‖) (u : Z) {uh : Xh} {ℓh : StrongDual ℝ W}
    (huh : Ah uh = ℓh) :
    ‖u - uh‖ ≤ (1 + ‖Ah‖ / α) * infDist u (Xh : Set Z) + ‖ℓh - Ah u‖ / α := sorry

/-- **Strang's lemma in the energy inner product** (README 1.4). -/
theorem norm_sub_le_strang_energy {Z : Type*} [NormedAddCommGroup Z] [InnerProductSpace ℝ Z]
    (Xh : Submodule ℝ Z) [FiniteDimensional ℝ Xh] (u : Z) (uh : Xh) :
    ‖u - uh‖ ≤ infDist u (Xh : Set Z) + ‖(innerSL ℝ (u - uh)).comp Xh.subtypeL‖ := sorry

/-- **Abstract Aubin–Nitsche lemma** (README 1.4). -/
theorem norm_le_of_dualApproximation {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] (A : V →L[ℝ] StrongDual ℝ V) (J : V →L[ℝ] H) (X : Submodule ℝ V)
    {e : V} (horth : ∀ v : X, A e v = 0) {δ : ℝ} (hδ : 0 ≤ δ)
    (hdual : ∀ g : H, ∃ z : V, (∀ v, A v z = ⟪J v, g⟫_ℝ) ∧ ∃ w : X, ‖z - w‖ ≤ δ * ‖g‖) :
    ‖J e‖ ≤ ‖A‖ * δ * ‖e‖ := sorry

end Abstract

/-! ## Layer 2: simplices and meshes -/

section Simplex

variable {d : ℕ}

/-- The reference simplex `{x | 0 ≤ xᵢ, ∑ xᵢ ≤ 1}` of `E d`. -/
def refSimplex (d : ℕ) : Set (E d) := {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i ≤ 1}

/-- The linear part `x ↦ ∑ xᵢ (vᵢ₊₁ - v₀)` of the cell map of a simplex. -/
def cellLinear (K : Affine.Simplex ℝ (E d) d) : E d →ₗ[ℝ] E d where
  toFun x := ∑ i : Fin d, x i • (K.points i.succ - K.points 0)
  map_add' x y := by simp [add_smul, Finset.sum_add_distrib]
  map_smul' c x := by simp [Finset.smul_sum, smul_smul]

/-- The affine cell map `F_K x = v₀ + ∑ xᵢ (vᵢ₊₁ - v₀)` from the reference simplex onto `K`. -/
def cellMap (K : Affine.Simplex ℝ (E d) d) : E d →ᵃ[ℝ] E d :=
  (cellLinear K).toAffineMap + AffineMap.const ℝ (E d) (K.points 0)

/-- The diameter `h_K` of a simplex. -/
def cellDiam (K : Affine.Simplex ℝ (E d) d) : ℝ := diam K.closedInterior

/-- The diameter `ρ_K = 2 r_K` of the inscribed ball of a simplex. -/
def cellInball [NeZero d] (K : Affine.Simplex ℝ (E d) d) : ℝ := 2 * K.inradius

/-- The open cell `int K`, as an open set. -/
def cellOpen (K : Affine.Simplex ℝ (E d) d) : Opens (E d) :=
  ⟨interior K.closedInterior, isOpen_interior⟩

/-- The cell map carries the reference simplex onto the closed cell (README 2.1). -/
theorem cellMap_image_refSimplex (K : Affine.Simplex ℝ (E d) d) :
    cellMap K '' refSimplex d = K.closedInterior := sorry

/-- The cell map of a nondegenerate simplex is bijective (README 2.1). -/
theorem cellMap_bijective (K : Affine.Simplex ℝ (E d) d) : Function.Bijective (cellMap K) :=
  sorry

/-- `0 < ρ_K ≤ h_K` (README 2.1). -/
theorem cellInball_le_cellDiam [NeZero d] (K : Affine.Simplex ℝ (E d) d) :
    0 < cellInball K ∧ cellInball K ≤ cellDiam K := sorry

/-- The cell contains its inscribed ball and is star-shaped with respect to every point of it,
the hypothesis of the Bramble–Hilbert lemma (README 2.1). -/
theorem ball_subset_and_starConvex [NeZero d] (K : Affine.Simplex ℝ (E d) d) :
    ball K.incenter K.inradius ⊆ K.closedInterior ∧
      ∀ y ∈ ball K.incenter K.inradius, StarConvex ℝ y K.closedInterior := sorry

/-- The topological interior of a closed cell is its open simplex (README 2.1). -/
theorem interior_closedInterior [NeZero d] (K : Affine.Simplex ℝ (E d) d) :
    interior K.closedInterior = K.interior := sorry

end Simplex

section Mesh

/-- A conforming simplicial mesh of a polyhedral domain in `E d`: finitely many `d`-simplices
with pairwise disjoint interiors, any two of which meet in the convex hull of common vertices. -/
structure SimplicialMesh (d : ℕ) where
  /-- The number of cells. -/
  numCells : ℕ
  /-- The cells. -/
  cell : Fin numCells → Affine.Simplex ℝ (E d) d
  /-- Distinct cells have disjoint interiors. -/
  disjoint_interior : Pairwise fun i j => Disjoint (cell i).interior (cell j).interior
  /-- Two cells meet in the convex hull of a set of common vertices. -/
  conforming : ∀ i j, ∃ s : Set (Fin (d + 1)), (cell i).points '' s ⊆ range (cell j).points ∧
    (cell i).closedInterior ∩ (cell j).closedInterior = convexHull ℝ ((cell i).points '' s)

variable {d : ℕ}

namespace SimplicialMesh

/-- The closed region `Ω̄ = ⋃ K` covered by a mesh. -/
def domain (M : SimplicialMesh d) : Set (E d) := ⋃ i, (M.cell i).closedInterior

/-- The open domain `Ω = int ⋃ K` of a mesh. -/
def domainOpens (M : SimplicialMesh d) : Opens (E d) := ⟨interior M.domain, isOpen_interior⟩

/-- The mesh size `h = max_K h_K` (zero for the empty mesh). -/
def meshSize (M : SimplicialMesh d) : ℝ := ⨆ i, cellDiam (M.cell i)

/-- A cell's interior lies in the interior of the mesh domain (supporting step). -/
theorem cellOpen_le_domainOpens (M : SimplicialMesh d) (i : Fin M.numCells) :
    cellOpen (M.cell i) ≤ M.domainOpens :=
  interior_mono (subset_iUnion (fun j => (M.cell j).closedInterior) i)

end SimplicialMesh

/-- Cells `i` and `j` of a mesh share a facet: `d` vertices of cell `i` are vertices of cell `j`. -/
def SimplicialMesh.SharesFacet (M : SimplicialMesh d) (i j : Fin M.numCells) : Prop :=
  ∃ s : Finset (Fin (d + 1)), s.card = d ∧ (M.cell i).points '' ↑s ⊆ range (M.cell j).points

/-- The cells containing any point `x` are connected through facets containing `x`. This excludes
pinched vertex stars such as two triangles meeting only at a vertex. -/
def SimplicialMesh.HasConnectedStars (M : SimplicialMesh d) : Prop :=
  ∀ x : E d, ∀ i j, x ∈ (M.cell i).closedInterior → x ∈ (M.cell j).closedInterior →
    Relation.ReflTransGen (fun a b => M.SharesFacet a b ∧ x ∈ (M.cell a).closedInterior ∧
      x ∈ (M.cell b).closedInterior) i j

/-- A family of meshes is shape regular with constant `σ`: `h_K ≤ σ ρ_K` for every cell. -/
def IsShapeRegular [NeZero d] (T : ℕ → SimplicialMesh d) (σ : ℝ) : Prop :=
  ∀ n i, cellDiam ((T n).cell i) ≤ σ * cellInball ((T n).cell i)

/-- A family of meshes is quasi-uniform with constant `τ`: `h ≤ τ h_K` for every cell. -/
def IsQuasiUniform (T : ℕ → SimplicialMesh d) (τ : ℝ) : Prop :=
  ∀ n i, (T n).meshSize ≤ τ * cellDiam ((T n).cell i)

/-- Under shape regularity, a point lies in a bounded number of cells (README 2.2). -/
theorem card_cells_meeting_le [NeZero d] (σ : ℝ) : ∃ N : ℕ, ∀ M : SimplicialMesh d,
    (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) → ∀ x : E d,
      {i | x ∈ (M.cell i).closedInterior}.ncard ≤ N := sorry

/-- **Neighbouring cells** (README 2.2): for `d ≥ 2` and connected vertex stars, shape
regularity gives local quasi-uniformity. In `d = 1` every mesh is shape regular and neighbouring
cells can have any ratio of lengths. -/
theorem exists_cellDiam_le_of_meet [NeZero d] (hd : 2 ≤ d) (σ : ℝ) :
    ∃ κ : ℝ, ∀ M : SimplicialMesh d,
    (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) → M.HasConnectedStars → ∀ i j,
      ((M.cell i).closedInterior ∩ (M.cell j).closedInterior).Nonempty →
        cellDiam (M.cell i) ≤ κ * cellDiam (M.cell j) := sorry

end Mesh

/-! ## Layer 3: Ciarlet finite elements -/

section Ciarlet

variable {d : ℕ}

/-- A Ciarlet finite element: a cell `K`, a space `P` of shape functions inside a space `D` of
functions on which the degrees of freedom `dof i` act. Unisolvence is a separate predicate. -/
structure CiarletElement (d : ℕ) (ι : Type*) where
  /-- The cell. -/
  K : Set (E d)
  /-- The shape functions. -/
  P : Submodule ℝ (E d → ℝ)
  /-- The domain of the degrees of freedom. -/
  D : Submodule ℝ (E d → ℝ)
  /-- Shape functions lie in the domain of the degrees of freedom. -/
  P_le_D : P ≤ D
  /-- The degrees of freedom. -/
  dof : ι → D →ₗ[ℝ] ℝ

variable {ι : Type*}

namespace CiarletElement

/-- The degrees of freedom of a shape function, as a vector. -/
def evalDof (Φ : CiarletElement d ι) : Φ.P →ₗ[ℝ] (ι → ℝ) :=
  LinearMap.pi fun i => (Φ.dof i).comp (Submodule.inclusion Φ.P_le_D)

/-- Unisolvence: a shape function is determined by its degrees of freedom, and every vector of
values is attained. -/
def IsUnisolvent (Φ : CiarletElement d ι) : Prop := Function.Bijective Φ.evalDof

/-- The nodal basis: the shape function with `dof j = δᵢⱼ`. -/
def shapeFunction [DecidableEq ι] (Φ : CiarletElement d ι) (h : Φ.IsUnisolvent) (i : ι) : Φ.P :=
  (LinearEquiv.ofBijective Φ.evalDof h).symm (Pi.single i 1)

/-- The local interpolant `I_K v ∈ P` with the same degrees of freedom as `v ∈ D`. -/
def localInterpolant (Φ : CiarletElement d ι) (h : Φ.IsUnisolvent) : Φ.D →ₗ[ℝ] Φ.P :=
  (LinearEquiv.ofBijective Φ.evalDof h).symm.toLinearMap ∘ₗ LinearMap.pi Φ.dof

/-- **Unisolvence by counting** (README 3.1). -/
theorem isUnisolvent_iff [Fintype ι] (Φ : CiarletElement d ι) :
    Φ.IsUnisolvent ↔
      Fintype.card ι = Module.finrank ℝ Φ.P ∧ Function.Injective Φ.evalDof := sorry

/-- The shape functions are dual to the degrees of freedom (README 3.1). -/
theorem dof_shapeFunction [DecidableEq ι] (Φ : CiarletElement d ι) (h : Φ.IsUnisolvent)
    (i j : ι) :
    Φ.dof j (Submodule.inclusion Φ.P_le_D (Φ.shapeFunction h i)) =
      (Pi.single i (1 : ℝ) : ι → ℝ) j := by
  have := LinearEquiv.apply_ofBijective_symm_apply Φ.evalDof (h := h) (Pi.single i (1 : ℝ))
  exact congrFun this j

/-- The local interpolant is the identity on `P` (README 3.1). -/
theorem localInterpolant_inclusion (Φ : CiarletElement d ι) (h : Φ.IsUnisolvent) (q : Φ.P) :
    Φ.localInterpolant h (Submodule.inclusion Φ.P_le_D q) = q :=
  (LinearEquiv.ofBijective Φ.evalDof h).symm_apply_apply q

end CiarletElement

/-- The multi-indices `α ∈ ℕ^{d+1}` with `|α| = k`, the barycentric labels of the Lagrange
nodes of degree `k`. -/
abbrev LatticeIndex (d k : ℕ) := ↥(Finset.Nat.antidiagonalTuple (d + 1) k)

/-- The Lagrange node `a_α = ∑ᵢ (αᵢ/k) vᵢ` of a simplex (`k ≥ 1`; at `k = 0` it is the origin). -/
def node (K : Affine.Simplex ℝ (E d) d) (k : ℕ) (α : LatticeIndex d k) : E d :=
  ∑ i, ((α.1 i : ℝ) / k) • K.points i

/-- The Lagrange element of degree `k` on a simplex: `P = ℙ_k`, the degrees of freedom are the
point evaluations at the nodes. -/
def lagrangeElement (K : Affine.Simplex ℝ (E d) d) (k : ℕ) :
    CiarletElement d (LatticeIndex d k) where
  K := K.closedInterior
  P := polynomialsDegLE d k
  D := ⊤
  P_le_D := le_top
  dof α := (LinearMap.proj (R := ℝ) (φ := fun _ : E d => ℝ) (node K k α)).comp (⊤ : Submodule ℝ
    (E d → ℝ)).subtype

/-- `q` is the Lagrange interpolant of degree `k` of `f` on `K`. -/
def IsLagrangeInterpolant (K : Affine.Simplex ℝ (E d) d) (k : ℕ) (f q : E d → ℝ) : Prop :=
  q ∈ polynomialsDegLE d k ∧ ∀ α, q (node K k α) = f (node K k α)

/-- **Unisolvence of the Lagrange element** (README 3.2), for every degree `k`. -/
theorem isUnisolvent_lagrangeElement (K : Affine.Simplex ℝ (E d) d) (k : ℕ) :
    (lagrangeElement K k).IsUnisolvent := sorry

/-- Existence and uniqueness of the local Lagrange interpolant (README 3.2). -/
theorem existsUnique_isLagrangeInterpolant (K : Affine.Simplex ℝ (E d) d) (k : ℕ)
    (f : E d → ℝ) : ∃! q, IsLagrangeInterpolant K k f q := sorry

/-- The Lagrange nodes are carried by affine maps (README 3.2). -/
theorem node_map (K : Affine.Simplex ℝ (E d) d) {k : ℕ} (hk : 1 ≤ k) (A : E d →ᵃ[ℝ] E d)
    (hA : Function.Injective A) (α : LatticeIndex d k) :
    node (K.map A hA) k α = A (node K k α) := sorry

/-- **Affine equivalence** of Lagrange interpolation (README 3.2). -/
theorem isLagrangeInterpolant_map_iff (K : Affine.Simplex ℝ (E d) d) {k : ℕ} (hk : 1 ≤ k)
    (A : E d →ᵃ[ℝ] E d) (hA : Function.Injective A) (f q : E d → ℝ) :
    IsLagrangeInterpolant (K.map A hA) k f q ↔ IsLagrangeInterpolant K k (f ∘ A) (q ∘ A) :=
  sorry

/-- **Face unisolvence** (README 3.2): a polynomial vanishing at the nodes of a face vanishes on
the face. -/
theorem eqOn_zero_of_face (K : Affine.Simplex ℝ (E d) d) {k : ℕ} (hk : 1 ≤ k)
    {q : E d → ℝ} (hq : q ∈ polynomialsDegLE d k) (i : Fin (d + 1))
    (hnode : ∀ α : LatticeIndex d k, α.1 i = 0 → q (node K k α) = 0) :
    EqOn q 0 (convexHull ℝ (K.points '' {i}ᶜ)) := sorry

end Ciarlet

/-! ## Layer 4: Lagrange finite element spaces -/

section LagrangeSpace

variable {d : ℕ}

/-- The continuous piecewise polynomials of degree `k` on a mesh, extended by zero. -/
def lagrangeSpace (M : SimplicialMesh d) (k : ℕ) : Submodule ℝ (E d → ℝ) where
  carrier := {v | (∀ x ∉ M.domain, v x = 0) ∧ ContinuousOn v M.domain ∧
    ∀ i, ∃ q ∈ polynomialsDegLE d k, EqOn v q (M.cell i).closedInterior}
  zero_mem' := ⟨fun _ _ => rfl, continuousOn_const, fun _ => ⟨0, zero_mem _, fun _ _ => rfl⟩⟩
  add_mem' := by
    rintro v w ⟨hv0, hvc, hvq⟩ ⟨hw0, hwc, hwq⟩
    refine ⟨fun x hx => by simp [hv0 x hx, hw0 x hx], hvc.add hwc, fun i => ?_⟩
    obtain ⟨q, hq, hvq⟩ := hvq i
    obtain ⟨r, hr, hwr⟩ := hwq i
    exact ⟨q + r, add_mem hq hr, fun x hx => by simp [hvq hx, hwr hx]⟩
  smul_mem' := by
    rintro c v ⟨hv0, hvc, hvq⟩
    refine ⟨fun x hx => by simp [hv0 x hx], hvc.const_smul c, fun i => ?_⟩
    obtain ⟨q, hq, hvq⟩ := hvq i
    exact ⟨c • q, Submodule.smul_mem _ c hq, fun x hx => by simp [hvq hx]⟩

/-- The global Lagrange nodes of degree `k` of a mesh. -/
def globalNodes (M : SimplicialMesh d) (k : ℕ) : Set (E d) :=
  ⋃ i, range (node (M.cell i) k)

/-- The Sobolev functions on `Ω` represented by a Lagrange finite element function. -/
def lagrangeSubmoduleW1p (Ω : Opens (E d)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : SimplicialMesh d)
    (k : ℕ) : Submodule ℝ (W1p volume Ω p) where
  carrier := {u | ∃ v ∈ lagrangeSpace M k, ⇑(W1p.value u) =ᵐ[volume.restrict (Ω : Set (E d))] v}
  zero_mem' := ⟨0, zero_mem _, by
    simpa only [← W1p.valueL_apply, map_zero] using
      Lp.coeFn_zero ℝ p (volume.restrict (Ω : Set (E d)))⟩
  add_mem' := by
    rintro u w ⟨v, hv, huv⟩ ⟨v', hv', hwv⟩
    exact ⟨v + v', add_mem hv hv', (W1p.value_add_ae u w).trans (huv.add hwv)⟩
  smul_mem' := by
    rintro c u ⟨v, hv, huv⟩
    exact ⟨c • v, Submodule.smul_mem _ c hv,
      (W1p.value_smul_ae c u).trans (huv.const_smul c)⟩

/-- The Lagrange finite element functions in `W^{1,p}_0(Ω)`. -/
def lagrangeSubmoduleW1p0 (Ω : Opens (E d)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : SimplicialMesh d)
    (k : ℕ) : Submodule ℝ (W1p0 volume Ω p) :=
  (lagrangeSubmoduleW1p Ω p M k).comap (W1p0 volume Ω p).subtype

variable {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- The Lagrange space of a mesh is finite-dimensional (README 4.1). -/
theorem finiteDimensional_lagrangeSpace (M : SimplicialMesh d) (k : ℕ) :
    FiniteDimensional ℝ (lagrangeSpace M k) := sorry

/-- **Global unisolvence** (README 4.1): evaluation at the global nodes is a bijection. -/
theorem bijective_eval_globalNodes (M : SimplicialMesh d) {k : ℕ} (hk : 1 ≤ k) :
    Function.Bijective fun (v : lagrangeSpace M k) (x : globalNodes M k) => (v : E d → ℝ) x :=
  sorry

/-- **`H¹`-conformity** (README 4.2): a Lagrange function lies in `W^{1,p}(Ω)`. -/
theorem exists_W1p_of_mem_lagrangeSpace (M : SimplicialMesh d) {k : ℕ} {v : E d → ℝ}
    (hv : v ∈ lagrangeSpace M k) :
    ∃ u : W1p volume M.domainOpens p,
      ⇑(W1p.value u) =ᵐ[volume.restrict (M.domainOpens : Set (E d))] v :=
  sorry

/-- A Lagrange function vanishing on `∂Ω` lies in `W^{1,p}_0(Ω)`, `p < ∞` (README 4.2). -/
theorem exists_W1p0_of_mem_lagrangeSpace (M : SimplicialMesh d) {k : ℕ} (hp : p ≠ ⊤)
    {v : E d → ℝ} (hv : v ∈ lagrangeSpace M k) (hbdry : ∀ x ∈ frontier M.domain, v x = 0) :
    ∃ u : W1p0 volume M.domainOpens p,
      ⇑(W1p.value (u : W1p volume M.domainOpens p)) =ᵐ[volume.restrict
        (M.domainOpens : Set (E d))] v :=
  sorry

/-- Integrals over the domain split over the cells (README 4.2). In `d = 0` a mesh may repeat
its one-point cell, hence `[NeZero d]`. -/
theorem lintegral_domain_eq_sum [NeZero d] (M : SimplicialMesh d) (f : E d → ℝ≥0∞) :
    ∫⁻ x in M.domain, f x = ∑ i, ∫⁻ x in (M.cell i).closedInterior, f x := sorry

end LagrangeSpace

/-! ## Layer 5: interpolation and inverse estimates -/

section Interpolation

variable {d : ℕ} [NeZero d] {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- **Local interpolation error** (README 5.1), uniform over shape-regular cells. -/
theorem exists_lagrangeInterpolation_error_le (σ : ℝ) {k r m : ℕ} (hk : 1 ≤ k) (hrk : r ≤ k + 1)
    (hm : m ≤ r) (hsob : (d : ℝ≥0∞) < r * p ∨ (p = 1 ∧ d ≤ r)) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ K : Affine.Simplex ℝ (E d) d, cellDiam K ≤ σ * cellInball K →
      ∀ (u : Wkp volume (cellOpen K) p r) (f q : E d → ℝ), ContinuousOn f K.closedInterior →
        ⇑(Wkp.value r u) =ᵐ[volume.restrict (cellOpen K : Set (E d))] f →
        IsLagrangeInterpolant K k f q →
        ∃ e : Wkp volume (cellOpen K) p r,
          ⇑(Wkp.value r e) =ᵐ[volume.restrict (cellOpen K : Set (E d))] f - q ∧
          seminorm r m hm e ≤ C * cellDiam K ^ (r - m) * seminorm r r le_rfl u := sorry

/-- **Global interpolation error** (README 5.1), cell by cell: on each cell `f - v` is the value
of a `W^{r,p}` function of the open cell. (A continuous piecewise polynomial is not in
`W^{2,p}(Ω)`, so no single `e` on `Ω` exists for `r ≥ 2`.) -/
theorem exists_globalInterpolation_error_le (σ : ℝ) {k r m : ℕ} (hk : 1 ≤ k)
    (hrk : r ≤ k + 1) (hm : m ≤ r) (hsob : (d : ℝ≥0∞) < r * p ∨ (p = 1 ∧ d ≤ r)) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ M : SimplicialMesh d,
      (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) →
      ∀ (u : Wkp volume M.domainOpens p r) (f v : E d → ℝ), ContinuousOn f M.domain →
        ⇑(Wkp.value r u) =ᵐ[volume.restrict (M.domainOpens : Set (E d))] f →
        v ∈ lagrangeSpace M k → (∀ x ∈ globalNodes M k, v x = f x) →
        ∀ i, ∃ e : Wkp volume (cellOpen (M.cell i)) p r,
          ⇑(Wkp.value r e) =ᵐ[volume.restrict (cellOpen (M.cell i) : Set (E d))] f - v ∧
          seminorm r m hm e ≤ C * cellDiam (M.cell i) ^ (r - m) *
            seminorm r r le_rfl (Wkp.restrictL (M.cellOpen_le_domainOpens i) r u) := sorry

/-- **The Scott–Zhang operator** (README 5.2). -/
theorem exists_scottZhang (hp : p ≠ ⊤) (σ : ℝ) {k s : ℕ} (hk : 1 ≤ k) (hs : s ≤ k) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ M : SimplicialMesh d,
      (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) →
      M.HasConnectedStars →
      ∃ I : W1p volume M.domainOpens p →L[ℝ] W1p volume M.domainOpens p,
        (∀ u, I u ∈ lagrangeSubmoduleW1p M.domainOpens p M k) ∧
        (∀ u ∈ lagrangeSubmoduleW1p M.domainOpens p M k, I u = u) ∧
        (∀ u ∈ W1p0 volume M.domainOpens p, I u ∈ W1p0 volume M.domainOpens p) ∧
        ∀ u : Wkp volume M.domainOpens p (s + 1),
          (∑ i, ‖W1p.value (W1p.restrictL (M.cellOpen_le_domainOpens i)
              (Wkp.firstOrder s u - I (Wkp.firstOrder s u)))‖ ^ p.toReal ≤
            C * ∑ i, (cellDiam (M.cell i) ^ (s + 1) * seminorm (s + 1) (s + 1) le_rfl
              (Wkp.restrictL (M.cellOpen_le_domainOpens i) (s + 1) u)) ^ p.toReal) ∧
          (∑ i, ‖W1p.gradient (W1p.restrictL (M.cellOpen_le_domainOpens i)
              (Wkp.firstOrder s u - I (Wkp.firstOrder s u)))‖ ^ p.toReal ≤
            C * ∑ i, (cellDiam (M.cell i) ^ s * seminorm (s + 1) (s + 1) le_rfl
              (Wkp.restrictL (M.cellOpen_le_domainOpens i) (s + 1) u)) ^ p.toReal) := sorry

/-- **Local inverse estimate** (README 5.3). -/
theorem exists_inverse_estimate (σ : ℝ) {k l m : ℕ} (hml : m ≤ l) {p q : ℝ≥0∞} (hp : 1 ≤ p)
    (hq : 1 ≤ q) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ K : Affine.Simplex ℝ (E d) d, cellDiam K ≤ σ * cellInball K →
      ∀ v ∈ polynomialsDegLE d k,
        eLpNorm (fun x => ‖iteratedFDeriv ℝ l v x‖) q (volume.restrict K.closedInterior) ≤
          ENNReal.ofReal (C * cellDiam K ^ ((m : ℝ) - l + d * (q⁻¹.toReal - p⁻¹.toReal))) *
            eLpNorm (fun x => ‖iteratedFDeriv ℝ m v x‖) p (volume.restrict K.closedInterior) :=
  sorry

/-- **Discrete trace inequality** (README 5.3). -/
theorem exists_discrete_trace (σ : ℝ) (k : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ K : Affine.Simplex ℝ (E d) d, cellDiam K ≤ σ * cellInball K →
      ∀ v ∈ polynomialsDegLE d k, ∀ i : Fin (d + 1),
        eLpNorm v 2 ((Measure.hausdorffMeasure ((d : ℝ) - 1)).restrict
            (convexHull ℝ (K.points '' {i}ᶜ))) ≤
          ENNReal.ofReal (C * cellDiam K ^ (-(1 / 2 : ℝ))) *
            eLpNorm v 2 (volume.restrict K.closedInterior) := sorry

/-- **Global inverse estimate** on quasi-uniform meshes (README 5.3). -/
theorem exists_global_inverse_estimate (σ τ : ℝ) (k : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ℕ → SimplicialMesh d, IsShapeRegular T σ → IsQuasiUniform T τ →
      ∀ n, ∀ u ∈ lagrangeSubmoduleW1p (T n).domainOpens p (T n) k,
        ‖W1p.gradient u‖ ≤ C * (T n).meshSize⁻¹ * ‖W1p.value u‖ := sorry

end Interpolation

/-! ## Layer 6: the Galerkin method for a second-order elliptic problem -/

section ErrorEstimates

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)} {A : E d → Matrix (Fin d) (Fin d) ℝ}

/-- `uh` solves the Galerkin problem for `-div(A∇u) = f`, `u = 0` on `∂Ω`, in `Vh ⊆ H¹₀(Ω)`. -/
def IsGalerkinSolution (A : E d → Matrix (Fin d) (Fin d) ℝ)
    (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (Vh : Submodule ℝ (W1p0 volume Ω 2))
    (uh : W1p0 volume Ω 2) : Prop :=
  uh ∈ Vh ∧ ∀ v ∈ Vh, energyFormH1 A 0 0 (uh : W1p volume Ω 2) (v : W1p volume Ω 2) =
    dirichletForcing f v

/-- Existence and uniqueness of the Galerkin solution (README 6.1). -/
theorem existsUnique_isGalerkinSolution {lam Lam : ℝ}
    (hA : UniformlyEllipticOn (Ω : Set (E d)) A lam Lam)
    (hAm : AEStronglyMeasurable A (volume.restrict (Ω : Set (E d))))
    (Vh : Submodule ℝ (W1p0 volume Ω 2))
    [FiniteDimensional ℝ Vh] (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) :
    ∃! uh, IsGalerkinSolution A f Vh uh := sorry

/-- **Céa's lemma in the energy seminorm** (README 6.1), constant `Λ / λ`. -/
theorem norm_gradient_sub_le_cea {lam Lam : ℝ}
    (hA : UniformlyEllipticOn (Ω : Set (E d)) A lam Lam)
    (hAm : AEStronglyMeasurable A (volume.restrict (Ω : Set (E d))))
    {Vh : Submodule ℝ (W1p0 volume Ω 2)} {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))}
    {u uh : W1p0 volume Ω 2} (hu : IsWeakSolutionDirichlet A 0 0 f u)
    (huh : IsGalerkinSolution A f Vh uh) (v : W1p0 volume Ω 2) (hv : v ∈ Vh) :
    ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ ≤
      Lam / lam * ‖W1p.gradient ((u : W1p volume Ω 2) - (v : W1p volume Ω 2))‖ := sorry

/-- **Convergence** of the Lagrange Galerkin method as `h → 0` (README 6.2). -/
theorem tendsto_galerkin {lam Lam σ : ℝ} {k : ℕ} (hk : 1 ≤ k)
    (hA : UniformlyEllipticOn (Ω : Set (E d)) A lam Lam)
    (hAm : AEStronglyMeasurable A (volume.restrict (Ω : Set (E d))))
    (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ)
    (hh : Tendsto (fun n => (T n).meshSize) atTop (𝓝 0))
    {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2}
    (hu : IsWeakSolutionDirichlet A 0 0 f u) {uh : ℕ → W1p0 volume Ω 2}
    (huh : ∀ n, IsGalerkinSolution A f (lagrangeSubmoduleW1p0 Ω 2 (T n) k) (uh n)) :
    Tendsto (fun n => ‖W1p.gradient ((u : W1p volume Ω 2) - (uh n : W1p volume Ω 2))‖) atTop
      (𝓝 0) := sorry

/-- **Energy-norm rate** `h^s` for `u ∈ H^{s+1}(Ω)`, `1 ≤ s ≤ k` (README 6.2). -/
theorem exists_galerkin_rate {lam Lam σ : ℝ} {k s : ℕ} (hs : 1 ≤ s) (hsk : s ≤ k)
    (hA : UniformlyEllipticOn (Ω : Set (E d)) A lam Lam)
    (hAm : AEStronglyMeasurable A (volume.restrict (Ω : Set (E d)))) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ℕ → SimplicialMesh d, (∀ n, (T n).domainOpens = Ω) →
      IsShapeRegular T σ → (∀ n, (T n).HasConnectedStars) →
      ∀ {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2}
        (w : Wkp volume Ω 2 (s + 1)), Wkp.firstOrder s w = (u : W1p volume Ω 2) →
        IsWeakSolutionDirichlet A 0 0 f u → ∀ n (uh : W1p0 volume Ω 2),
          IsGalerkinSolution A f (lagrangeSubmoduleW1p0 Ω 2 (T n) k) uh →
          ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ ≤
            C * (T n).meshSize ^ s * seminorm (s + 1) (s + 1) le_rfl w := sorry

/-- The `H²` regularity of the adjoint problem with constant `Creg`: for every `g ∈ L²(Ω)` the
weak solution `z ∈ H¹₀(Ω)` of `-div(Aᵀ∇z) = g` lies in `H²(Ω)` with `|z|_{H²} ≤ Creg ‖g‖`. -/
def HasAdjointH2Regularity (Ω : Opens (E d)) (A : E d → Matrix (Fin d) (Fin d) ℝ)
    (Creg : ℝ) : Prop :=
  ∀ g : Lp ℝ 2 (volume.restrict (Ω : Set (E d))), ∃ z : W1p0 volume Ω 2,
    IsWeakSolutionDirichlet (fun x => (A x).transpose) 0 0 g z ∧
      ∃ w : Wkp volume Ω 2 2, Wkp.firstOrder 1 w = (z : W1p volume Ω 2) ∧
        seminorm 2 2 le_rfl w ≤ Creg * ‖g‖

/-- **Aubin–Nitsche** (README 6.3) under adjoint `H²` regularity. -/
theorem exists_aubinNitsche {lam Lam σ Creg : ℝ} {k : ℕ} (hk : 1 ≤ k)
    (hA : UniformlyEllipticOn (Ω : Set (E d)) A lam Lam)
    (hAm : AEStronglyMeasurable A (volume.restrict (Ω : Set (E d))))
    (hreg : HasAdjointH2Regularity Ω A Creg) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ℕ → SimplicialMesh d, (∀ n, (T n).domainOpens = Ω) →
      IsShapeRegular T σ → (∀ n, (T n).HasConnectedStars) →
      ∀ {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2},
        IsWeakSolutionDirichlet A 0 0 f u → ∀ n (uh : W1p0 volume Ω 2),
          IsGalerkinSolution A f (lagrangeSubmoduleW1p0 Ω 2 (T n) k) uh →
          ‖W1p.value ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ ≤
            C * (T n).meshSize *
              ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ := sorry

/-- **`L²` rate** `h^{s+1}` (README 6.3). -/
theorem exists_galerkin_L2_rate {lam Lam σ Creg : ℝ} {k s : ℕ} (hs : 1 ≤ s) (hsk : s ≤ k)
    (hA : UniformlyEllipticOn (Ω : Set (E d)) A lam Lam)
    (hAm : AEStronglyMeasurable A (volume.restrict (Ω : Set (E d))))
    (hreg : HasAdjointH2Regularity Ω A Creg) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ℕ → SimplicialMesh d, (∀ n, (T n).domainOpens = Ω) →
      IsShapeRegular T σ → (∀ n, (T n).HasConnectedStars) →
      ∀ {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2}
        (w : Wkp volume Ω 2 (s + 1)), Wkp.firstOrder s w = (u : W1p volume Ω 2) →
        IsWeakSolutionDirichlet A 0 0 f u → ∀ n (uh : W1p0 volume Ω 2),
          IsGalerkinSolution A f (lagrangeSubmoduleW1p0 Ω 2 (T n) k) uh →
          ‖W1p.value ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ ≤
            C * (T n).meshSize ^ (s + 1) * seminorm (s + 1) (s + 1) le_rfl w := sorry

end ErrorEstimates

/-! ## Supplier declarations named in the README -/

#check @IsCoercive
#check @IsCoercive.continuousLinearEquivOfBilin
#check @NormedSpace.inclusionInDoubleDual
#check @Metric.infDist
#check @innerSL
#check @convexHull
#check @Affine.Simplex.closedInterior
#check @Affine.Simplex.interior
#check @Affine.Simplex.incenter
#check @Affine.Simplex.inradius
#check @Affine.Simplex.map
#check @Finset.Nat.antidiagonalTuple
#check @MvPolynomial.restrictTotalDegree
#check @LinearEquiv.ofBijective
#check @MeasureTheory.Measure.hausdorffMeasure
#check @iteratedFDeriv
#check @MeasureTheory.eLpNorm
#check @TauCeti.W1p
#check @TauCeti.W1p0
#check @TauCeti.Wkp
#check @TauCeti.W1p.value
#check @TauCeti.W1p.gradient
#check @TauCeti.W1p.value_add_ae
#check @TauCeti.W1p.restrictL
#check @TauCeti.Wkp.value
#check @TauCeti.Wkp.firstOrder
#check @TauCeti.Wkp.lowerOrderL
#check @TauCeti.Wkp.iteratedGradient
#check @TauCeti.Wkp.restrictL
#check @TauCeti.PDE.energyFormH1
#check @TauCeti.PDE.energyFormH1L0
#check @TauCeti.PDE.dirichletForcing
#check @TauCeti.PDE.IsWeakSolutionDirichlet
#check @TauCeti.PDE.existsUnique_isWeakSolutionDirichlet
#check @TauCeti.PDE.UniformlyEllipticOn

end TauCetiRoadmap.GalerkinMethodsAndLagrangeFiniteElements
