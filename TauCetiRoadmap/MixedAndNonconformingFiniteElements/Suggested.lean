module

public import Mathlib
public import TauCeti.Analysis.PDE.DirichletProblem
public import TauCeti.Analysis.PDE.Ellipticity.Basic
public import TauCeti.Analysis.Sobolev.W1p.Restriction
public import TauCeti.Analysis.Sobolev.W1p.Zero
public import TauCeti.Analysis.Sobolev.Wkp.Restriction
public import TauCeti.Analysis.Sobolev.LipschitzDomain.Basic
public import TauCeti.Analysis.Sobolev.WeakDeriv.Divergence

/-!
# Mixed and nonconforming finite elements: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions): bilinear forms are bundled as `A : V →L[ℝ] StrongDual ℝ V` and
`B : V →L[ℝ] StrongDual ℝ Q`, so `A u v` is `a(u, v)` and `B v q` is `b(v, q)`; the transpose
`q ↦ b(·, q)` is `B.flip`. Inf-sup and coercivity constants are explicit positive reals with an
inequality, never an infimum of a ratio. A polynomial vector field is
`Fin d → MvPolynomial (Fin d) ℝ`; a broken (piecewise) object on a mesh is a family indexed by
the cells. Face integrals use the Euclidean Hausdorff measure `μHE[d - 1]`, which agrees with
surface measure on a facet.

Local copies, verbatim, each with a docstring naming its owner: from
GalerkinMethodsAndLagrangeFiniteElements, `E`, `evalₗ`, `polynomialsDegLE`, `toOrderL` and
`seminorm` (its Conventions, which copy them from SobolevPolynomialApproximation), `cellDiam`,
`cellInball`, `cellOpen` (its §2.1), `SimplicialMesh` with `domain`, `domainOpens`, `meshSize`
and `cellOpen_le_domainOpens`, and `IsShapeRegular` (its §2.2), `lagrangeSpace`,
`lagrangeSubmoduleW1p` and `lagrangeSubmoduleW1p0` (its §§4.1–4.2) and `HasAdjointH2Regularity`
(its §6.3); from IncompressibleFluids §1.1, `HasWeakDivergenceOn`.

Statements of the README without a Lean name are stated in prose there: coercivity on the
discrete kernel and Fortin's criterion for `b` (2.1), the exact discrete divergence of the mixed
method (6.3), the Taylor–Hood and MINI error estimates (7.2), and the inf-sup condition from a
bounded cochain projection (8.1). The Euler identity of 4.1 closes by unfolding and Mathlib's
`MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` and is proved here.

The Mathlib and Tau Ceti declarations the README names are pinned by the `#check` lines at the end
of the file.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.MixedAndNonconformingFiniteElements

open TauCeti TauCeti.PDE MeasureTheory Set Metric Filter TopologicalSpace
open scoped ENNReal NNReal Topology InnerProductSpace Distributions

/-! ## Local copies -/

/-- Euclidean space `ℝⁿ`. Local copy of `E` of GalerkinMethodsAndLagrangeFiniteElements,
Conventions. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- Evaluation of a real polynomial in `n` variables as a function on `E n`. Local copy of
`evalₗ` of GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def evalₗ (n : ℕ) : MvPolynomial (Fin n) ℝ →ₗ[ℝ] (E n → ℝ) where
  toFun q x := MvPolynomial.eval (fun i => x i) q
  map_add' q r := by ext x; simp
  map_smul' c q := by ext x; simp

/-- The polynomial functions of total degree at most `m` on `E n`. Local copy of
`polynomialsDegLE` of GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def polynomialsDegLE (n m : ℕ) : Submodule ℝ (E n → ℝ) :=
  (MvPolynomial.restrictTotalDegree (Fin n) ℝ m).map (evalₗ n)

section SobolevCopies

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- The embedding `W^{k,p}(Ω) → W^{j,p}(Ω)` for `j ≤ k`. Local copy of `toOrderL` of
GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def toOrderL {j k : ℕ} (h : j ≤ k) : Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j :=
  Nat.leRec (motive := fun k _ => Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j)
    (ContinuousLinearMap.id ℝ _) (fun k _ ih => ih.comp (Wkp.lowerOrderL k)) h

/-- The Sobolev seminorm `|u|_{W^{j,p}(Ω)}` of `u ∈ W^{k,p}(Ω)`, `j ≤ k`. Local copy of
`seminorm` of GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def seminorm (k : ℕ) : (j : ℕ) → j ≤ k → Wkp volume Ω p k → ℝ
  | 0, _, u => ‖Wkp.value k u‖
  | j + 1, h, u => ‖Wkp.iteratedGradient j (toOrderL h u)‖

end SobolevCopies

section Simplex

variable {d : ℕ}

/-- The diameter `h_K` of a simplex. Local copy of `cellDiam` of
GalerkinMethodsAndLagrangeFiniteElements, §2.1. -/
def cellDiam (K : Affine.Simplex ℝ (E d) d) : ℝ := diam K.closedInterior

/-- The diameter `ρ_K = 2 r_K` of the inscribed ball of a simplex. Local copy of `cellInball` of
GalerkinMethodsAndLagrangeFiniteElements, §2.1. -/
def cellInball [NeZero d] (K : Affine.Simplex ℝ (E d) d) : ℝ := 2 * K.inradius

/-- The open cell `int K`, as an open set. Local copy of `cellOpen` of
GalerkinMethodsAndLagrangeFiniteElements, §2.1. -/
def cellOpen (K : Affine.Simplex ℝ (E d) d) : Opens (E d) :=
  ⟨interior K.closedInterior, isOpen_interior⟩

end Simplex

section Mesh

/-- A conforming simplicial mesh of a polyhedral domain in `E d`: finitely many `d`-simplices
with pairwise disjoint interiors, any two of which meet in the convex hull of common vertices.
Local copy of `SimplicialMesh` of GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
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

/-- The closed region `Ω̄ = ⋃ K` covered by a mesh. Local copy of `SimplicialMesh.domain` of
GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
def domain (M : SimplicialMesh d) : Set (E d) := ⋃ i, (M.cell i).closedInterior

/-- The open domain `Ω = int ⋃ K` of a mesh. Local copy of `SimplicialMesh.domainOpens` of
GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
def domainOpens (M : SimplicialMesh d) : Opens (E d) := ⟨interior M.domain, isOpen_interior⟩

/-- The mesh size `h = max_K h_K` (zero for the empty mesh). Local copy of
`SimplicialMesh.meshSize` of GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
def meshSize (M : SimplicialMesh d) : ℝ := ⨆ i, cellDiam (M.cell i)

/-- A cell's interior lies in the interior of the mesh domain. Local copy of
`SimplicialMesh.cellOpen_le_domainOpens` of GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
theorem cellOpen_le_domainOpens (M : SimplicialMesh d) (i : Fin M.numCells) :
    cellOpen (M.cell i) ≤ M.domainOpens :=
  interior_mono (subset_iUnion (fun j => (M.cell j).closedInterior) i)

end SimplicialMesh

/-- A family of meshes is shape regular with constant `σ`: `h_K ≤ σ ρ_K` for every cell. Local
copy of `IsShapeRegular` of GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
def IsShapeRegular [NeZero d] (T : ℕ → SimplicialMesh d) (σ : ℝ) : Prop :=
  ∀ n i, cellDiam ((T n).cell i) ≤ σ * cellInball ((T n).cell i)

end Mesh

section LagrangeSpace

variable {d : ℕ}

/-- The continuous piecewise polynomials of degree `k` on a mesh, extended by zero. Local copy
of `lagrangeSpace` of GalerkinMethodsAndLagrangeFiniteElements, §4.1. -/
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

/-- The Sobolev functions on `Ω` represented by a Lagrange finite element function. Local copy
of `lagrangeSubmoduleW1p` of GalerkinMethodsAndLagrangeFiniteElements, §4.2. -/
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

/-- The Lagrange finite element functions in `W^{1,p}_0(Ω)`. Local copy of
`lagrangeSubmoduleW1p0` of GalerkinMethodsAndLagrangeFiniteElements, §4.2. -/
def lagrangeSubmoduleW1p0 (Ω : Opens (E d)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : SimplicialMesh d)
    (k : ℕ) : Submodule ℝ (W1p0 volume Ω p) :=
  (lagrangeSubmoduleW1p Ω p M k).comap (W1p0 volume Ω p).subtype

end LagrangeSpace

section RegularityCopy

variable {d : ℕ} [NeZero d]

/-- The `H²` regularity of the adjoint problem with constant `Creg`: for every `g ∈ L²(Ω)` the
weak solution `z ∈ H¹₀(Ω)` of `-div(Aᵀ∇z) = g` lies in `H²(Ω)` with `|z|_{H²} ≤ Creg ‖g‖`. Local
copy of `HasAdjointH2Regularity` of GalerkinMethodsAndLagrangeFiniteElements, §6.3. -/
def HasAdjointH2Regularity (Ω : Opens (E d)) (A : E d → Matrix (Fin d) (Fin d) ℝ)
    (Creg : ℝ) : Prop :=
  ∀ g : Lp ℝ 2 (volume.restrict (Ω : Set (E d))), ∃ z : W1p0 volume Ω 2,
    IsWeakSolutionDirichlet (fun x => (A x).transpose) 0 0 g z ∧
      ∃ w : Wkp volume Ω 2 2, Wkp.firstOrder 1 w = (z : W1p volume Ω 2) ∧
        seminorm 2 2 le_rfl w ≤ Creg * ‖g‖

end RegularityCopy

section IncompressibleFluidsCopy

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **Weak divergence**. A locally integrable vector field `u` has weak divergence `g` on the
open set `Ω` when `∫ ⟪u, ∇φ⟫ = −∫ φ g` for every scalar test function `φ` on `Ω`. Local copy of
`HasWeakDivergenceOn` of IncompressibleFluids, §1.1. -/
def HasWeakDivergenceOn (Ω : Opens E) (u : E → E) (g : E → ℝ) : Prop :=
  LocallyIntegrableOn u Ω volume ∧ LocallyIntegrableOn g Ω volume ∧
    ∀ φ : 𝓓(Ω, ℝ), ∫ x, ⟪u x, gradient (φ : E → ℝ) x⟫_ℝ = -∫ x, (φ : E → ℝ) x * g x

end IncompressibleFluidsCopy

/-! ## Layer 1: saddle point problems -/

section Saddle

variable {V Q : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup Q] [NormedSpace ℝ Q]

/-- `(u, p)` solves the saddle point problem `a(u, v) + b(v, p) = f(v)` for all `v` and
`b(u, q) = g(q)` for all `q`. -/
def IsMixedSolution (A : V →L[ℝ] StrongDual ℝ V) (B : V →L[ℝ] StrongDual ℝ Q)
    (f : StrongDual ℝ V) (g : StrongDual ℝ Q) (u : V) (p : Q) : Prop :=
  (∀ v, A u v + B v p = f v) ∧ ∀ q, B u q = g q

/-- **Lifting** (README 1.1): under the inf-sup condition with constant `β`, every `g ∈ Q'` is
`B u` for some `u` with `β ‖u‖ ≤ ‖g‖`. -/
theorem exists_lift_of_infSup [CompleteSpace V] [CompleteSpace Q]
    (hV : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hQ : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ Q))
    (B : V →L[ℝ] StrongDual ℝ Q) {β : ℝ} (hβ : 0 < β) (hB : ∀ q, β * ‖q‖ ≤ ‖B.flip q‖)
    (g : StrongDual ℝ Q) : ∃ u, B u = g ∧ β * ‖u‖ ≤ ‖g‖ := sorry

/-- **The Babuška–Brezzi theorem** (README 1.1): the saddle point problem is uniquely solvable for
all data iff `a` satisfies both conditions of the Banach–Nečas–Babuška theorem on `ker B` and
`b` satisfies the inf-sup condition. -/
theorem existsUnique_mixedSolution_iff [CompleteSpace V] [CompleteSpace Q]
    (hV : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hQ : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ Q))
    (A : V →L[ℝ] StrongDual ℝ V) (B : V →L[ℝ] StrongDual ℝ Q) :
    (∀ f g, ∃! up : V × Q, IsMixedSolution A B f g up.1 up.2) ↔
      ((∃ α > (0 : ℝ), ∀ v : LinearMap.ker B.toLinearMap,
          α * ‖v‖ ≤ ‖(A v).comp (LinearMap.ker B.toLinearMap).subtypeL‖) ∧
        ∀ w : LinearMap.ker B.toLinearMap,
          (∀ v : LinearMap.ker B.toLinearMap, A v (w : V) = 0) → w = 0) ∧
      ∃ β > (0 : ℝ), ∀ q, β * ‖q‖ ≤ ‖B.flip q‖ := sorry

/-- Coercivity of `a` on `ker B` and the inf-sup condition on `b` give unique solvability
(README 1.1). -/
theorem existsUnique_mixedSolution_of_infSup [CompleteSpace V] [CompleteSpace Q]
    (hV : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hQ : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ Q))
    (A : V →L[ℝ] StrongDual ℝ V) (B : V →L[ℝ] StrongDual ℝ Q) {α β : ℝ} (hα : 0 < α)
    (hβ : 0 < β) (hA : ∀ v ∈ LinearMap.ker B.toLinearMap, α * ‖v‖ ^ 2 ≤ A v v)
    (hB : ∀ q, β * ‖q‖ ≤ ‖B.flip q‖) (f : StrongDual ℝ V) (g : StrongDual ℝ Q) :
    ∃! up : V × Q, IsMixedSolution A B f g up.1 up.2 := sorry

/-- **A priori bounds** (README 1.2). -/
theorem norm_le_of_isMixedSolution [CompleteSpace V] [CompleteSpace Q]
    (hV : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hQ : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ Q))
    (A : V →L[ℝ] StrongDual ℝ V) (B : V →L[ℝ] StrongDual ℝ Q) {α β : ℝ} (hα : 0 < α)
    (hβ : 0 < β)
    (hA : ∀ v : LinearMap.ker B.toLinearMap,
      α * ‖v‖ ≤ ‖(A v).comp (LinearMap.ker B.toLinearMap).subtypeL‖)
    (hB : ∀ q, β * ‖q‖ ≤ ‖B.flip q‖) {f : StrongDual ℝ V} {g : StrongDual ℝ Q} {u : V} {p : Q}
    (h : IsMixedSolution A B f g u p) :
    ‖u‖ ≤ ‖f‖ / α + (1 + ‖A‖ / α) * ‖g‖ / β ∧
      ‖p‖ ≤ (1 + ‖A‖ / α) * ‖f‖ / β + ‖A‖ / β ^ 2 * (1 + ‖A‖ / α) * ‖g‖ := sorry

end Saddle

/-! ## Layer 2: mixed Galerkin approximation -/

section MixedGalerkin

variable {V Q : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup Q] [NormedSpace ℝ Q]

/-- The discrete kernel `K_h = {v ∈ V_h | b(v, q) = 0 for all q ∈ Q_h}`. -/
def discreteKernel (B : V →L[ℝ] StrongDual ℝ Q) (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q) :
    Submodule ℝ V :=
  Vh ⊓ ⨅ q : Qh, LinearMap.ker (B.flip (q : Q)).toLinearMap

/-- `(uh, ph) ∈ V_h × Q_h` solves the discrete saddle point problem. -/
def IsDiscreteMixedSolution (A : V →L[ℝ] StrongDual ℝ V) (B : V →L[ℝ] StrongDual ℝ Q)
    (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q) (f : StrongDual ℝ V) (g : StrongDual ℝ Q)
    (uh : V) (ph : Q) : Prop :=
  uh ∈ Vh ∧ ph ∈ Qh ∧ (∀ v ∈ Vh, A uh v + B v ph = f v) ∧ ∀ q ∈ Qh, B uh q = g q

/-- **Discrete well-posedness** (README 2.1): for finite-dimensional `V_h`, `Q_h`, the discrete
problem is uniquely solvable for all data iff `a` satisfies the inf-sup condition on `K_h` and
`b` the discrete inf-sup condition on `V_h × Q_h`. -/
theorem existsUnique_isDiscreteMixedSolution_iff (A : V →L[ℝ] StrongDual ℝ V)
    (B : V →L[ℝ] StrongDual ℝ Q) (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q)
    [FiniteDimensional ℝ Vh] [FiniteDimensional ℝ Qh] :
    (∀ f g, ∃! up : V × Q, IsDiscreteMixedSolution A B Vh Qh f g up.1 up.2) ↔
      (∃ αh > (0 : ℝ), ∀ v : discreteKernel B Vh Qh,
          αh * ‖v‖ ≤ ‖(A v).comp (discreteKernel B Vh Qh).subtypeL‖) ∧
        ∃ βh > (0 : ℝ), ∀ q : Qh, βh * ‖q‖ ≤ ‖(B.flip q).comp Vh.subtypeL‖ := sorry

/-- **Error bounds for mixed Galerkin approximation** (README 2.2), general case
`c_h = ‖B‖ / α_h`: for every `vh ∈ Z_h` and `qh ∈ Q_h`. -/
theorem norm_sub_le_of_isDiscreteMixedSolution (A : V →L[ℝ] StrongDual ℝ V)
    (B : V →L[ℝ] StrongDual ℝ Q) (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q) {αh βh : ℝ}
    (hαh : 0 < αh) (hβh : 0 < βh)
    (hA : ∀ v : discreteKernel B Vh Qh,
      αh * ‖v‖ ≤ ‖(A v).comp (discreteKernel B Vh Qh).subtypeL‖)
    (hB : ∀ q : Qh, βh * ‖q‖ ≤ ‖(B.flip q).comp Vh.subtypeL‖)
    {f : StrongDual ℝ V} {g : StrongDual ℝ Q} {u uh : V} {p ph : Q}
    (hu : IsMixedSolution A B f g u p) (huh : IsDiscreteMixedSolution A B Vh Qh f g uh ph)
    {vh : V} (hvh : vh ∈ Vh) (hZ : ∀ q ∈ Qh, B vh q = B u q) {qh : Q} (hqh : qh ∈ Qh) :
    ‖u - uh‖ ≤ (1 + ‖A‖ / αh) * ‖u - vh‖ + ‖B‖ / αh * ‖p - qh‖ ∧
      ‖p - ph‖ ≤ (1 + ‖A‖ / αh) * ‖A‖ / βh * ‖u - vh‖ +
        (1 + ‖B‖ / βh + ‖B‖ / αh * ‖A‖ / βh) * ‖p - qh‖ := sorry

/-- **Error bounds for a conforming discrete kernel** (README 2.2): if `K_h ⊆ ker B` the pressure
best-approximation term drops out of the velocity bound (`c_h = 0`). -/
theorem norm_sub_le_of_isDiscreteMixedSolution_of_le_ker (A : V →L[ℝ] StrongDual ℝ V)
    (B : V →L[ℝ] StrongDual ℝ Q) (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q)
    (hker : discreteKernel B Vh Qh ≤ LinearMap.ker B.toLinearMap) {αh βh : ℝ} (hαh : 0 < αh)
    (hβh : 0 < βh)
    (hA : ∀ v : discreteKernel B Vh Qh,
      αh * ‖v‖ ≤ ‖(A v).comp (discreteKernel B Vh Qh).subtypeL‖)
    (hB : ∀ q : Qh, βh * ‖q‖ ≤ ‖(B.flip q).comp Vh.subtypeL‖)
    {f : StrongDual ℝ V} {g : StrongDual ℝ Q} {u uh : V} {p ph : Q}
    (hu : IsMixedSolution A B f g u p) (huh : IsDiscreteMixedSolution A B Vh Qh f g uh ph)
    {vh : V} (hvh : vh ∈ Vh) (hZ : ∀ q ∈ Qh, B vh q = B u q) {qh : Q} (hqh : qh ∈ Qh) :
    ‖u - uh‖ ≤ (1 + ‖A‖ / αh) * ‖u - vh‖ ∧
      ‖p - ph‖ ≤ (1 + ‖A‖ / αh) * ‖A‖ / βh * ‖u - vh‖ + (1 + ‖B‖ / βh) * ‖p - qh‖ := sorry

/-- **Best approximation under the discrete constraint** (README 2.2): for every `wh ∈ V_h` some
`vh ∈ Z_h` satisfies `‖u - vh‖ ≤ (1 + ‖B‖ / β_h) ‖u - wh‖`. -/
theorem exists_mem_discreteConstraint_norm_sub_le (B : V →L[ℝ] StrongDual ℝ Q)
    (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q) [FiniteDimensional ℝ Vh] [FiniteDimensional ℝ Qh]
    {βh : ℝ} (hβh : 0 < βh) (hB : ∀ q : Qh, βh * ‖q‖ ≤ ‖(B.flip q).comp Vh.subtypeL‖) (u : V)
    {wh : V} (hwh : wh ∈ Vh) :
    ∃ vh ∈ Vh, (∀ q ∈ Qh, B vh q = B u q) ∧ ‖u - vh‖ ≤ (1 + ‖B‖ / βh) * ‖u - wh‖ := sorry

/-- **Quasi-optimality under uniform inf-sup constants** (README 2.3). -/
theorem exists_mixed_quasi_optimal_constant (A : V →L[ℝ] StrongDual ℝ V)
    (B : V →L[ℝ] StrongDual ℝ Q) {α₀ β₀ : ℝ} (hα₀ : 0 < α₀) (hβ₀ : 0 < β₀) :
    ∃ C ≥ (0 : ℝ), ∀ (Vh : Submodule ℝ V) (Qh : Submodule ℝ Q),
      FiniteDimensional ℝ Vh → FiniteDimensional ℝ Qh →
      (∀ v : discreteKernel B Vh Qh,
        α₀ * ‖v‖ ≤ ‖(A v).comp (discreteKernel B Vh Qh).subtypeL‖) →
      (∀ q : Qh, β₀ * ‖q‖ ≤ ‖(B.flip q).comp Vh.subtypeL‖) →
      ∀ {f g u uh p ph}, IsMixedSolution A B f g u p →
        IsDiscreteMixedSolution A B Vh Qh f g uh ph →
        ‖u - uh‖ + ‖p - ph‖ ≤ C * (infDist u (Vh : Set V) + infDist p (Qh : Set Q)) := sorry

end MixedGalerkin

/-! ## Layer 3: linear-quadratic optimal control -/

section OptimalControl

variable {H U Y Z : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [NormedAddCommGroup U] [InnerProductSpace ℝ U] [CompleteSpace U]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y] [CompleteSpace Y]
  [NormedAddCommGroup Z] [NormedSpace ℝ Z] [CompleteSpace Z]

/-- The linear-quadratic cost `J(y, u) = ½ ‖Q y - q_d‖² + (α/2) ‖u‖²`. -/
def lqCost (Qo : Y →L[ℝ] H) (qd : H) (α : ℝ) (x : Y × U) : ℝ :=
  ‖Qo x.1 - qd‖ ^ 2 / 2 + α / 2 * ‖x.2‖ ^ 2

/-- The feasible set `{(y, u) ∈ Y_ad × U_ad | A y + B u = g}`. -/
def lqFeasible (A : Y ≃L[ℝ] Z) (B : U →L[ℝ] Z) (g : Z) (Yad : Set Y) (Uad : Set U) :
    Set (Y × U) :=
  {x | x.1 ∈ Yad ∧ x.2 ∈ Uad ∧ A x.1 + B x.2 = g}

/-- **Existence and uniqueness of optimal controls** (README 3.1). -/
theorem exists_isMinOn_lqCost (A : Y ≃L[ℝ] Z) (B : U →L[ℝ] Z) (Qo : Y →L[ℝ] H) (qd : H) (g : Z)
    {α : ℝ} (hα : 0 ≤ α) {Yad : Set Y} {Uad : Set U} (hUc : Convex ℝ Uad) (hUcl : IsClosed Uad)
    (hUb : α = 0 → Bornology.IsBounded Uad) (hYc : Convex ℝ Yad) (hYcl : IsClosed Yad)
    (hne : (lqFeasible A B g Yad Uad).Nonempty) :
    (∃ x ∈ lqFeasible A B g Yad Uad, IsMinOn (lqCost Qo qd α) (lqFeasible A B g Yad Uad) x) ∧
      (0 < α → ∀ x ∈ lqFeasible A B g Yad Uad, ∀ x' ∈ lqFeasible A B g Yad Uad,
        IsMinOn (lqCost Qo qd α) (lqFeasible A B g Yad Uad) x →
        IsMinOn (lqCost Qo qd α) (lqFeasible A B g Yad Uad) x' → x = x') := sorry

/-- **The optimality system** (README 3.2): an optimal pair without state constraints has an
adjoint state `p ∈ Z'` with `A* p = -Q* (Q ȳ - q_d)` and the variational inequality. -/
theorem exists_adjointState_of_isMinOn (A : Y ≃L[ℝ] Z) (B : U →L[ℝ] Z) (Qo : Y →L[ℝ] H)
    (qd : H) (g : Z) (α : ℝ) {Uad : Set U} (hUc : Convex ℝ Uad) {x : Y × U}
    (hx : x ∈ lqFeasible A B g univ Uad)
    (hmin : IsMinOn (lqCost Qo qd α) (lqFeasible A B g univ Uad) x) :
    ∃ p : StrongDual ℝ Z, (∀ v : Y, p (A v) = -⟪Qo x.1 - qd, Qo v⟫_ℝ) ∧
      ∀ u ∈ Uad, 0 ≤ α * ⟪x.2, u - x.2⟫_ℝ + p (B (u - x.2)) := sorry

/-- **Sufficiency of the optimality system** (README 3.2). -/
theorem isMinOn_of_adjointState (A : Y ≃L[ℝ] Z) (B : U →L[ℝ] Z) (Qo : Y →L[ℝ] H) (qd : H) (g : Z)
    {α : ℝ} (hα : 0 ≤ α) {Uad : Set U} {x : Y × U} (hx : x ∈ lqFeasible A B g univ Uad)
    (p : StrongDual ℝ Z) (hadj : ∀ v : Y, p (A v) = -⟪Qo x.1 - qd, Qo v⟫_ℝ)
    (hvi : ∀ u ∈ Uad, 0 ≤ α * ⟪x.2, u - x.2⟫_ℝ + p (B (u - x.2))) :
    IsMinOn (lqCost Qo qd α) (lqFeasible A B g univ Uad) x := sorry

/-- **Box constraints** (README 3.3): in `L²`, the variational inequality with gradient
`α ū + w` over `{a ≤ u ≤ b}` is the pointwise projection `ū = min(max(a, -w/α), b)`. -/
theorem variationalInequality_box_iff {X : Type*} [MeasurableSpace X] (μ : Measure X)
    {a b : Lp ℝ 2 μ} (hab : a ≤ b) {α : ℝ} (hα : 0 < α) (ub w : Lp ℝ 2 μ) :
    ((a ≤ ub ∧ ub ≤ b) ∧ ∀ u, a ≤ u → u ≤ b → 0 ≤ ⟪α • ub + w, u - ub⟫_ℝ) ↔
      ub = b ⊓ (a ⊔ (-α⁻¹) • w) := sorry

end OptimalControl

/-! ## Layer 4: polynomial vector fields, Raviart–Thomas and Nédélec spaces -/

section PolynomialFields

variable {d : ℕ}

/-- A polynomial vector field on `E d`: one real polynomial per component. -/
abbrev PolyField (d : ℕ) := Fin d → MvPolynomial (Fin d) ℝ

/-- The vector fields with components of total degree at most `k`, `P_k^d`. -/
def polyFieldsDegLE (d k : ℕ) : Submodule ℝ (PolyField d) :=
  Submodule.pi univ fun _ => MvPolynomial.restrictTotalDegree (Fin d) ℝ k

/-- The divergence `∑ᵢ ∂ᵢ vᵢ` of a polynomial vector field. -/
def polyDiv (d : ℕ) : PolyField d →ₗ[ℝ] MvPolynomial (Fin d) ℝ :=
  ∑ i : Fin d, (MvPolynomial.pderiv i).toLinearMap ∘ₗ LinearMap.proj i

/-- The gradient `(∂ᵢ q)ᵢ` of a polynomial. -/
def polyGrad (d : ℕ) : MvPolynomial (Fin d) ℝ →ₗ[ℝ] PolyField d :=
  LinearMap.pi fun i => (MvPolynomial.pderiv i).toLinearMap

/-- The field `x q` for a polynomial `q`. -/
def xMul (d : ℕ) : MvPolynomial (Fin d) ℝ →ₗ[ℝ] PolyField d :=
  LinearMap.pi fun i => LinearMap.mulLeft ℝ (MvPolynomial.X i)

/-- The polynomial `x · v = ∑ᵢ xᵢ vᵢ`. -/
def xDot (d : ℕ) : PolyField d →ₗ[ℝ] MvPolynomial (Fin d) ℝ :=
  ∑ i : Fin d, LinearMap.mulLeft ℝ (MvPolynomial.X i) ∘ₗ LinearMap.proj i

/-- The Raviart–Thomas space `RT_k = P_k^d ⊕ x P̃_k`, with `P̃_k` the homogeneous polynomials of
degree `k`. -/
def raviartThomas (d k : ℕ) : Submodule ℝ (PolyField d) :=
  polyFieldsDegLE d k ⊔ (MvPolynomial.homogeneousSubmodule (Fin d) ℝ k).map (xMul d)

/-- **Divergence of `x q`** (README 4.1): `div (x q) = (k + d) q` for `q` homogeneous of degree
`k`. -/
theorem polyDiv_xMul_of_isHomogeneous {q : MvPolynomial (Fin d) ℝ} {k : ℕ}
    (hq : q.IsHomogeneous k) : polyDiv d (xMul d q) = ((k + d : ℕ) : ℝ) • q := by
  have h := hq.sum_X_mul_pderiv
  simp only [polyDiv, xMul, LinearMap.coe_sum, Finset.sum_apply, LinearMap.comp_apply,
    LinearMap.proj_apply, LinearMap.pi_apply, LinearMap.mulLeft_apply,
    Derivation.coeFn_coe, MvPolynomial.pderiv_mul, MvPolynomial.pderiv_X_self, one_mul,
    Finset.sum_add_distrib, h]
  rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, Nat.cast_add, add_smul,
    Nat.cast_smul_eq_nsmul, Nat.cast_smul_eq_nsmul, add_comm]

/-- **Dimension of the Raviart–Thomas space** (README 4.1). -/
theorem finrank_raviartThomas [NeZero d] (k : ℕ) :
    Module.finrank ℝ (raviartThomas d k) =
      d * (k + d).choose d + (k + d - 1).choose (d - 1) := sorry

/-- **Divergence on `RT_k`** (README 4.1): the divergence maps `RT_k` onto `P_k`, and a
divergence-free field of `RT_k` lies in `P_k^d`. -/
theorem map_polyDiv_raviartThomas (k : ℕ) :
    (raviartThomas d k).map (polyDiv d) = MvPolynomial.restrictTotalDegree (Fin d) ℝ k ∧
      ∀ v ∈ raviartThomas d k, polyDiv d v = 0 → v ∈ polyFieldsDegLE d k := sorry

/-- The normal component `∑ₗ nₗ vₗ(x)` of a polynomial field at `x`. -/
def normalComp (v : PolyField d) (n x : E d) : ℝ := ∑ l, n l * evalₗ d (v l) x

/-- **Normal traces** (README 4.1): on every affine hyperplane `⟪n, x⟫ = c`, the normal
component of a field of `RT_k` agrees with a polynomial of degree at most `k`. -/
theorem exists_normalComp_eq_of_mem_raviartThomas {k : ℕ} {v : PolyField d}
    (hv : v ∈ raviartThomas d k) (n : E d) (c : ℝ) :
    ∃ r ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k,
      ∀ x : E d, ⟪n, x⟫_ℝ = c → normalComp v n x = evalₗ d r x := sorry

/-- The facet of a simplex opposite vertex `a`. -/
def facet (K : Affine.Simplex ℝ (E d) d) (a : Fin (d + 1)) : Set (E d) :=
  convexHull ℝ (K.points '' {a}ᶜ)

/-- The outward unit normal of the facet opposite vertex `a`. -/
def facetNormal [NeZero d] (K : Affine.Simplex ℝ (E d) d) (a : Fin (d + 1)) : E d :=
  (K.height a)⁻¹ • (K.altitudeFoot a -ᵥ K.points a)

/-- The diameter `h_F` of the facet opposite vertex `a`. -/
def facetDiam (K : Affine.Simplex ℝ (E d) d) (a : Fin (d + 1)) : ℝ := diam (facet K a)

/-- The pointwise product `v · w` of two polynomial fields at `x`. -/
def fieldDot (v w : PolyField d) (x : E d) : ℝ := ∑ l, evalₗ d (v l) x * evalₗ d (w l) x

/-- **Unisolvence of the Raviart–Thomas degrees of freedom** (README 4.2): a field of `RT_k`
whose normal moments against `P_k` on every facet and whose moments against `P_{k-1}^d` on the
cell vanish is zero. -/
theorem eq_zero_of_raviartThomas_moments [NeZero d] (K : Affine.Simplex ℝ (E d) d) {k : ℕ}
    {v : PolyField d} (hv : v ∈ raviartThomas d k)
    (hF : ∀ a, ∀ q ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k,
      ∫ x in facet K a, normalComp v (facetNormal K a) x * evalₗ d q x ∂μHE[d - 1] = 0)
    (hK : ∀ w : PolyField d, (∀ l, (w l).totalDegree < k) →
      ∫ x in K.closedInterior, fieldDot v w x = 0) : v = 0 := sorry

/-- **The canonical Raviart–Thomas interpolant commutes with the divergence** (README 4.2): for
a `C¹` field `u`, some `v ∈ RT_k` has the same degrees of freedom as `u` on `K`, and then
`div v` is the `L²(K)` projection of `div u` onto `P_k`. -/
theorem exists_raviartThomas_interpolant [NeZero d] (K : Affine.Simplex ℝ (E d) d) (k : ℕ)
    {u : E d → E d} (hu : ContDiff ℝ 1 u) :
    ∃ v ∈ raviartThomas d k,
      (∀ a, ∀ q ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k,
        ∫ x in facet K a, normalComp v (facetNormal K a) x * evalₗ d q x ∂μHE[d - 1] =
          ∫ x in facet K a, ⟪u x, facetNormal K a⟫_ℝ * evalₗ d q x ∂μHE[d - 1]) ∧
      (∀ w : PolyField d, (∀ l, (w l).totalDegree < k) →
        ∫ x in K.closedInterior, fieldDot v w x =
          ∫ x in K.closedInterior, ∑ l, u x l * evalₗ d (w l) x) ∧
      ∀ q ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k,
        ∫ x in K.closedInterior, evalₗ d (polyDiv d v) x * evalₗ d q x =
          ∫ x in K.closedInterior, LinearMap.trace ℝ (E d) (fderiv ℝ u x) * evalₗ d q x :=
  sorry

/-- The curl of a polynomial vector field in three variables. -/
def polyCurl : PolyField 3 →ₗ[ℝ] PolyField 3 :=
  LinearMap.pi fun i =>
    (MvPolynomial.pderiv (i + 1)).toLinearMap ∘ₗ LinearMap.proj (i + 2) -
      (MvPolynomial.pderiv (i + 2)).toLinearMap ∘ₗ LinearMap.proj (i + 1)

/-- The Nédélec space of the first kind `N_k = P_k^3 ⊕ S_{k+1}`, with `S_{k+1}` the homogeneous
fields `q` of degree `k + 1` with `x · q = 0`. -/
def nedelec (k : ℕ) : Submodule ℝ (PolyField 3) :=
  polyFieldsDegLE 3 k ⊔
    ((Submodule.pi univ fun _ => MvPolynomial.homogeneousSubmodule (Fin 3) ℝ (k + 1)) ⊓
      LinearMap.ker (xDot 3))

/-- **Dimension of the Nédélec space** (README 4.3). -/
theorem finrank_nedelec (k : ℕ) :
    Module.finrank ℝ (nedelec k) = (k + 1) * (k + 3) * (k + 4) / 2 := sorry

/-- **Exactness of the polynomial de Rham complex** (README 4.3): in three variables,
`P_{k+1} → N_k → RT_k → P_k → 0` under gradient, curl and divergence is exact, and the kernel
of the gradient on `P_{k+1}` is the constants. -/
theorem polynomial_deRham_exact (k : ℕ) :
    (MvPolynomial.restrictTotalDegree (Fin 3) ℝ (k + 1)).map (polyGrad 3) =
        nedelec k ⊓ LinearMap.ker polyCurl ∧
      (nedelec k).map polyCurl = raviartThomas 3 k ⊓ LinearMap.ker (polyDiv 3) ∧
      (raviartThomas 3 k).map (polyDiv 3) = MvPolynomial.restrictTotalDegree (Fin 3) ℝ k ∧
      MvPolynomial.restrictTotalDegree (Fin 3) ℝ (k + 1) ⊓ LinearMap.ker (polyGrad 3) =
        MvPolynomial.restrictTotalDegree (Fin 3) ℝ 0 := sorry

end PolynomialFields

/-! ## Layer 5: the symmetric interior penalty method -/

section SIPG

variable {d : ℕ} [NeZero d]

open Classical in
/-- The cell across the facet of cell `i` opposite its vertex `a`, if that facet is interior. -/
def SimplicialMesh.neighbor (M : SimplicialMesh d) (i : Fin M.numCells) (a : Fin (d + 1)) :
    Option (Fin M.numCells) :=
  if h : ∃ j, j ≠ i ∧ facet (M.cell i) a ⊆ (M.cell j).closedInterior then some h.choose
  else none

/-- The broken polynomials of degree at most `k`: one polynomial per cell. -/
def brokenPoly (M : SimplicialMesh d) (k : ℕ) :
    Submodule ℝ (Fin M.numCells → MvPolynomial (Fin d) ℝ) :=
  Submodule.pi univ fun _ => MvPolynomial.restrictTotalDegree (Fin d) ℝ k

/-- The weight of an oriented facet `(i, a)`: `1/2` on an interior facet, which is seen from both
of its cells, and `1` on a boundary facet. -/
def faceWeight (M : SimplicialMesh d) (i : Fin M.numCells) (a : Fin (d + 1)) : ℝ :=
  if (M.neighbor i a).isSome then 1 / 2 else 1

/-- The jump `[u] = u_i - u_j` across the facet `(i, a)`, oriented by the outward normal of cell
`i`; on a boundary facet it is the trace `u_i`. -/
def jumpPoly (M : SimplicialMesh d) (u : Fin M.numCells → MvPolynomial (Fin d) ℝ)
    (i : Fin M.numCells) (a : Fin (d + 1)) : MvPolynomial (Fin d) ℝ :=
  u i - (M.neighbor i a).elim 0 u

/-- The average `{∇u · n}` of the normal derivative on the facet `(i, a)`, with `n` the outward
normal of cell `i`; on a boundary facet it is the one-sided value. -/
def avgNormalDeriv (M : SimplicialMesh d) (u : Fin M.numCells → MvPolynomial (Fin d) ℝ)
    (i : Fin M.numCells) (a : Fin (d + 1)) : MvPolynomial (Fin d) ℝ :=
  faceWeight M i a • ∑ l, MvPolynomial.C (facetNormal (M.cell i) a l) *
    MvPolynomial.pderiv l (u i + (M.neighbor i a).elim 0 u)

/-- The symmetric interior penalty form with penalty parameter `η₀`. -/
def sipgForm (M : SimplicialMesh d) (η₀ : ℝ) (u v : Fin M.numCells → MvPolynomial (Fin d) ℝ) :
    ℝ :=
  (∑ i, ∫ x in (M.cell i).closedInterior, fieldDot (polyGrad d (u i)) (polyGrad d (v i)) x) +
    ∑ i, ∑ a, faceWeight M i a * ∫ x in facet (M.cell i) a,
      (-(evalₗ d (avgNormalDeriv M u i a) x * evalₗ d (jumpPoly M v i a) x) -
        evalₗ d (avgNormalDeriv M v i a) x * evalₗ d (jumpPoly M u i a) x +
        η₀ / facetDiam (M.cell i) a * evalₗ d (jumpPoly M u i a) x *
          evalₗ d (jumpPoly M v i a) x) ∂μHE[d - 1]

/-- The square of the discrete energy norm `∑_K ‖∇v‖²_K + ∑_F h_F⁻¹ ‖[v]‖²_F`. -/
def sipgNormSq (M : SimplicialMesh d) (v : Fin M.numCells → MvPolynomial (Fin d) ℝ) : ℝ :=
  (∑ i, ∫ x in (M.cell i).closedInterior, fieldDot (polyGrad d (v i)) (polyGrad d (v i)) x) +
    ∑ i, ∑ a, faceWeight M i a * (facetDiam (M.cell i) a)⁻¹ *
      ∫ x in facet (M.cell i) a, evalₗ d (jumpPoly M v i a) x ^ 2 ∂μHE[d - 1]

/-- The discrete trace inequality for gradients of `P_k` with constant `c` on every facet of a
mesh: `h_F ‖∇v · n‖²_F ≤ c² ‖∇v‖²_K`. -/
def HasGradTrace (M : SimplicialMesh d) (k : ℕ) (c : ℝ) : Prop :=
  ∀ i a, ∀ q ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k,
    facetDiam (M.cell i) a *
        ∫ x in facet (M.cell i) a, normalComp (polyGrad d q) (facetNormal (M.cell i) a) x ^ 2
          ∂μHE[d - 1] ≤
      c ^ 2 * ∫ x in (M.cell i).closedInterior, fieldDot (polyGrad d q) (polyGrad d q) x

/-- **Coercivity of the SIPG form** (README 5.1). -/
theorem sipgForm_coercive (hd : 2 ≤ d) (M : SimplicialMesh d) {k : ℕ} {c η₀ : ℝ}
    (htr : HasGradTrace M k c) (hη : (d + 1) * c ^ 2 < η₀) {v : Fin M.numCells → _}
    (hv : v ∈ brokenPoly M k) :
    (η₀ - (d + 1) * c ^ 2) / (1 + η₀) * sipgNormSq M v ≤ sipgForm M η₀ v v := sorry

/-- `uh` is the SIPG approximation of degree `k` of `-Δu = f` with zero boundary values. -/
def IsSipgSolution (M : SimplicialMesh d) (k : ℕ) (η₀ : ℝ) (f : E d → ℝ)
    (uh : Fin M.numCells → MvPolynomial (Fin d) ℝ) : Prop :=
  uh ∈ brokenPoly M k ∧ ∀ v ∈ brokenPoly M k,
    sipgForm M η₀ uh v = ∑ i, ∫ x in (M.cell i).closedInterior, f x * evalₗ d (v i) x

/-- **Well-posedness of the SIPG method** (README 5.1), for `f` integrable on every cell. -/
theorem existsUnique_isSipgSolution (hd : 2 ≤ d) (M : SimplicialMesh d) {k : ℕ} {c η₀ : ℝ}
    (htr : HasGradTrace M k c) (hη : (d + 1) * c ^ 2 < η₀) {f : E d → ℝ}
    (hf : ∀ i, IntegrableOn f (M.cell i).closedInterior) :
    ∃! uh, IsSipgSolution M k η₀ f uh := sorry

/-- The squared SIPG energy error `∑_K ‖∇(u - u_h)‖²_K + ∑_F h_F⁻¹ ‖[u_h]‖²_F` of `u ∈ H¹₀(Ω)`. -/
def sipgErrorSq {Ω : Opens (E d)} (M : SimplicialMesh d) (u : W1p volume Ω 2)
    (uh : Fin M.numCells → MvPolynomial (Fin d) ℝ) : ℝ :=
  (∑ i, ∫ x in (M.cell i).closedInterior,
      ∑ l, (W1p.gradient u x l - evalₗ d (MvPolynomial.pderiv l (uh i)) x) ^ 2) +
    ∑ i, ∑ a, faceWeight M i a * (facetDiam (M.cell i) a)⁻¹ *
      ∫ x in facet (M.cell i) a, evalₗ d (jumpPoly M uh i a) x ^ 2 ∂μHE[d - 1]

/-- **Energy error estimate for SIPG** (README 5.2): for `η₀` above a threshold depending on the
shape-regularity constant. -/
theorem exists_sipg_energy_rate (hd : 2 ≤ d) {Ω : Opens (E d)} {σ : ℝ} {k s : ℕ} (hs : 1 ≤ s)
    (hsk : s ≤ k) (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω)
    (hσ : IsShapeRegular T σ) :
    ∃ η : ℝ, ∀ η₀, η < η₀ → ∃ C : ℝ, 0 ≤ C ∧
      ∀ {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2}
        (w : Wkp volume Ω 2 (s + 1)), Wkp.firstOrder s w = (u : W1p volume Ω 2) →
        IsWeakSolutionDirichlet (fun _ => 1) 0 0 f u → ∀ n uh, IsSipgSolution (T n) k η₀ f uh →
        √(sipgErrorSq (T n) (u : W1p volume Ω 2) uh) ≤
          C * (T n).meshSize ^ s * seminorm (s + 1) (s + 1) le_rfl w := sorry

/-- **`L²` error estimate for SIPG** (README 5.2) under `H²` regularity of the Dirichlet
Laplacian. -/
theorem exists_sipg_L2_rate (hd : 2 ≤ d) {Ω : Opens (E d)} {σ Creg : ℝ} {k s : ℕ} (hs : 1 ≤ s)
    (hsk : s ≤ k) (hreg : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ) :
    ∃ η : ℝ, ∀ η₀, η < η₀ → ∃ C : ℝ, 0 ≤ C ∧
      ∀ {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2}
        (w : Wkp volume Ω 2 (s + 1)), Wkp.firstOrder s w = (u : W1p volume Ω 2) →
        IsWeakSolutionDirichlet (fun _ => 1) 0 0 f u → ∀ n uh, IsSipgSolution (T n) k η₀ f uh →
        √(∑ i, ∫ x in ((T n).cell i).closedInterior,
            (W1p.value (u : W1p volume Ω 2) x - evalₗ d (uh i) x) ^ 2) ≤
          C * (T n).meshSize ^ (s + 1) * seminorm (s + 1) (s + 1) le_rfl w := sorry

end SIPG

/-! ## Layer 6: `H(div)` and mixed methods for the Poisson problem -/

section Hdiv

variable {d : ℕ} [NeZero d]

/-- The global Raviart–Thomas space: one field of `RT_k` per cell, with continuous normal
components across interior facets. -/
def rtFamilies (M : SimplicialMesh d) (k : ℕ) : Submodule ℝ (Fin M.numCells → PolyField d) where
  carrier := {v | (∀ i, v i ∈ raviartThomas d k) ∧ ∀ i a j, M.neighbor i a = some j →
    ∀ x ∈ facet (M.cell i) a,
      normalComp (v i) (facetNormal (M.cell i) a) x = normalComp (v j) (facetNormal (M.cell i) a) x}
  zero_mem' := ⟨fun _ => zero_mem _, fun _ _ _ _ _ _ => by simp [normalComp]⟩
  add_mem' := by
    rintro v w ⟨hv, hvn⟩ ⟨hw, hwn⟩
    refine ⟨fun i => add_mem (hv i) (hw i), fun i a j hj x hx => ?_⟩
    have h1 := hvn i a j hj x hx
    have h2 := hwn i a j hj x hx
    simp only [normalComp, Pi.add_apply, map_add, mul_add, Finset.sum_add_distrib] at h1 h2 ⊢
    rw [h1, h2]
  smul_mem' := by
    rintro c v ⟨hv, hvn⟩
    refine ⟨fun i => Submodule.smul_mem _ c (hv i), fun i a j hj x hx => ?_⟩
    have h1 := hvn i a j hj x hx
    simp only [normalComp, Pi.smul_apply, map_smul, smul_eq_mul] at h1 ⊢
    simp only [mul_left_comm _ c, ← Finset.mul_sum, h1]

/-- **The global Raviart–Thomas space is `H(div)`-conforming** (README 6.1): a field that equals
a member of `rtFamilies` on every open cell has the broken divergence as weak divergence. -/
theorem hasWeakDivergenceOn_of_mem_rtFamilies (M : SimplicialMesh d) {k : ℕ}
    {v : Fin M.numCells → PolyField d} (hv : v ∈ rtFamilies M k) {g : E d → E d} {h : E d → ℝ}
    (hg : ∀ i, ∀ x ∈ cellOpen (M.cell i), ∀ l, g x l = evalₗ d (v i l) x)
    (hh : ∀ i, ∀ x ∈ cellOpen (M.cell i), h x = evalₗ d (polyDiv d (v i)) x) :
    HasWeakDivergenceOn M.domainOpens g h := sorry

/-- **A bounded commuting projection onto the Raviart–Thomas space** (README 6.2): uniformly
`L²`-bounded projections `J_h` onto the global `RT_k` with `div J_h σ` the broken `L²`
projection of `div σ` onto `P_k`. -/
theorem exists_boundedCommutingProjection_div {Ω : Opens (E d)} {σ : ℝ} (k : ℕ)
    (hΩ : (Ω : Set (E d)).IsLipschitzDomain (E (d - 1)))
    (hb : Bornology.IsBounded (Ω : Set (E d))) (T : ℕ → SimplicialMesh d)
    (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ n, ∃ J : Lp (E d) 2 (volume.restrict (Ω : Set (E d))) →L[ℝ]
        Lp (E d) 2 (volume.restrict (Ω : Set (E d))), ‖J‖ ≤ C ∧
      (∀ τ, ∃ v ∈ rtFamilies (T n) k, (∀ i, ∀ᵐ x ∂volume.restrict (cellOpen ((T n).cell i)),
          ∀ l, J τ x l = evalₗ d (v i l) x) ∧
        ∀ h : E d → ℝ, HasWeakDivergenceOn Ω τ h → MemLp h 2 (volume.restrict (Ω : Set (E d))) →
          ∀ i, ∀ q ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k,
          ∫ x in ((T n).cell i).closedInterior, evalₗ d (polyDiv d (v i)) x * evalₗ d q x =
            ∫ x in ((T n).cell i).closedInterior, h x * evalₗ d q x) ∧
      ∀ τ, ∀ v ∈ rtFamilies (T n) k, (∀ i, ∀ᵐ x ∂volume.restrict (cellOpen ((T n).cell i)),
          ∀ l, τ x l = evalₗ d (v i l) x) → J τ = τ := sorry

/-- **Uniform discrete inf-sup condition for `RT_k × P_k`** (README 6.2), in lifting form: every
broken polynomial `q` is matched by a field `v` of the global `RT_k` with `‖v‖_{H(div)} ≤ ‖q‖`
and `β ‖q‖² ≤ ∫ (div v) q`. -/
theorem exists_raviartThomas_infSup {Ω : Opens (E d)} {σ : ℝ} (k : ℕ)
    (hΩ : (Ω : Set (E d)).IsLipschitzDomain (E (d - 1)))
    (hb : Bornology.IsBounded (Ω : Set (E d))) (T : ℕ → SimplicialMesh d)
    (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ) :
    ∃ β > (0 : ℝ), ∀ n, ∀ q ∈ brokenPoly (T n) k, ∃ v ∈ rtFamilies (T n) k,
      (∑ i, ∫ x in ((T n).cell i).closedInterior,
          (fieldDot (v i) (v i) x + evalₗ d (polyDiv d (v i)) x ^ 2)) ≤
        ∑ i, ∫ x in ((T n).cell i).closedInterior, evalₗ d (q i) x ^ 2 ∧
      β * ∑ i, ∫ x in ((T n).cell i).closedInterior, evalₗ d (q i) x ^ 2 ≤
        ∑ i, ∫ x in ((T n).cell i).closedInterior,
          evalₗ d (polyDiv d (v i)) x * evalₗ d (q i) x := sorry

/-- `(σh, ph)` is the mixed approximation by `RT_k × P_k` of `σ + 𝒟∇p = 0`, `div σ = g` with
`p = 0` on the boundary, written with the compliance `C = 𝒟⁻¹`. -/
def IsMixedPoissonSolution (M : SimplicialMesh d) (k : ℕ) (Cm : E d → Matrix (Fin d) (Fin d) ℝ)
    (g : E d → ℝ) (σh : Fin M.numCells → PolyField d)
    (ph : Fin M.numCells → MvPolynomial (Fin d) ℝ) : Prop :=
  σh ∈ rtFamilies M k ∧ ph ∈ brokenPoly M k ∧
    (∀ τ ∈ rtFamilies M k, ∑ i, ∫ x in (M.cell i).closedInterior,
        ((∑ l, ∑ m, Cm x l m * evalₗ d (σh i m) x * evalₗ d (τ i l) x) -
          evalₗ d (polyDiv d (τ i)) x * evalₗ d (ph i) x) = 0) ∧
    ∀ q ∈ brokenPoly M k, ∑ i, ∫ x in (M.cell i).closedInterior,
      evalₗ d (polyDiv d (σh i)) x * evalₗ d (q i) x =
        ∑ i, ∫ x in (M.cell i).closedInterior, g x * evalₗ d (q i) x

/-- **Error estimates for the Raviart–Thomas mixed method** (README 6.3), for `1 ≤ r ≤ k + 1`. -/
theorem exists_mixedPoisson_rate {Ω : Opens (E d)} {σ lam Lam : ℝ} {k r : ℕ} (hr : 1 ≤ r)
    (hrk : r ≤ k + 1) (hΩ : (Ω : Set (E d)).IsLipschitzDomain (E (d - 1)))
    (hb : Bornology.IsBounded (Ω : Set (E d))) {Cm : E d → Matrix (Fin d) (Fin d) ℝ}
    (hC : UniformlyEllipticOn (Ω : Set (E d)) Cm lam Lam)
    (hCm : AEStronglyMeasurable Cm (volume.restrict (Ω : Set (E d))))
    (hCs : ∀ x, (Cm x).transpose = Cm x) (T : ℕ → SimplicialMesh d)
    (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ {s : Lp (E d) 2 (volume.restrict (Ω : Set (E d)))}
      {p g : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))}, HasWeakDivergenceOn Ω s g →
      (∀ (τ : Lp (E d) 2 (volume.restrict (Ω : Set (E d)))) (h : E d → ℝ),
        HasWeakDivergenceOn Ω τ h → MemLp h 2 (volume.restrict (Ω : Set (E d))) →
        ∫ x in (Ω : Set (E d)), ((∑ l, ∑ m, Cm x l m * s x m * τ x l) - h x * p x) = 0) →
      ∀ (sr : Fin d → Wkp volume Ω 2 r) (gr pr : Wkp volume Ω 2 r),
      (∀ l, ⇑(Wkp.value r (sr l)) =ᵐ[volume.restrict (Ω : Set (E d))] fun x => s x l) →
      Wkp.value r gr = g → Wkp.value r pr = p →
      ∀ n σh ph, IsMixedPoissonSolution (T n) k Cm g σh ph →
        √(∑ i, ∫ x in ((T n).cell i).closedInterior,
            ∑ l, (s x l - evalₗ d (σh i l) x) ^ 2) ≤
          C * (T n).meshSize ^ r * ∑ l, seminorm r r le_rfl (sr l) ∧
        √(∑ i, ∫ x in ((T n).cell i).closedInterior,
            (g x - evalₗ d (polyDiv d (σh i)) x) ^ 2) ≤
          C * (T n).meshSize ^ r * seminorm r r le_rfl gr ∧
        √(∑ i, ∫ x in ((T n).cell i).closedInterior, (p x - evalₗ d (ph i) x) ^ 2) ≤
          C * (T n).meshSize ^ r * (∑ l, seminorm r r le_rfl (sr l) + seminorm r r le_rfl pr) :=
  sorry

end Hdiv

/-! ## Layer 7: stable pairs for the Stokes problem -/

section Stokes

variable {d : ℕ} [NeZero d]

/-- The Sobolev functions on `Ω` represented by a member of a space `S` of functions. The proofs
are those of `lagrangeSubmoduleW1p` of GalerkinMethodsAndLagrangeFiniteElements, §4.2. -/
def submoduleW1pOf (Ω : Opens (E d)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (S : Submodule ℝ (E d → ℝ)) :
    Submodule ℝ (W1p volume Ω p) where
  carrier := {u | ∃ v ∈ S, ⇑(W1p.value u) =ᵐ[volume.restrict (Ω : Set (E d))] v}
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

/-- The cell bubbles: functions zero off the mesh domain that agree on each closed cell with a
polynomial of degree at most `d + 1` vanishing on the facets of that cell. -/
def bubbleSpace (M : SimplicialMesh d) : Submodule ℝ (E d → ℝ) where
  carrier := {v | (∀ x ∉ M.domain, v x = 0) ∧ ∀ i, ∃ q ∈ polynomialsDegLE d (d + 1),
    EqOn v q (M.cell i).closedInterior ∧ ∀ a, EqOn q 0 (facet (M.cell i) a)}
  zero_mem' := ⟨fun _ _ => rfl, fun _ => ⟨0, zero_mem _, fun _ _ => rfl, fun _ _ _ => rfl⟩⟩
  add_mem' := by
    rintro v w ⟨hv0, hvq⟩ ⟨hw0, hwq⟩
    refine ⟨fun x hx => by simp [hv0 x hx, hw0 x hx], fun i => ?_⟩
    obtain ⟨q, hq, hvq, hq0⟩ := hvq i
    obtain ⟨r, hr, hwr, hr0⟩ := hwq i
    exact ⟨q + r, add_mem hq hr, fun x hx => by simp [hvq hx, hwr hx],
      fun a x hx => by simp [hq0 a hx, hr0 a hx]⟩
  smul_mem' := by
    rintro c v ⟨hv0, hvq⟩
    refine ⟨fun x hx => by simp [hv0 x hx], fun i => ?_⟩
    obtain ⟨q, hq, hvq, hq0⟩ := hvq i
    exact ⟨c • q, Submodule.smul_mem _ c hq, fun x hx => by simp [hvq hx],
      fun a x hx => by simp [hq0 a hx]⟩

/-- The divergence `∑ₗ ∂ₗ vₗ` of a field with components in `H¹(Ω)`. -/
def w1pDiv {Ω : Opens (E d)} (v : Fin d → W1p volume Ω 2) (x : E d) : ℝ :=
  ∑ l, W1p.gradient (v l) x l

/-- **The divergence is onto the mean-zero functions** (README 7.1): on a bounded connected
Lipschitz domain, every `q ∈ L²₀(Ω)` is the divergence of a field in `H¹₀(Ω)^d` with
`β |v|_{H¹} ≤ ‖q‖`. -/
theorem exists_divergence_rightInverse {Ω : Opens (E d)}
    (hΩ : (Ω : Set (E d)).IsLipschitzDomain (E (d - 1)))
    (hb : Bornology.IsBounded (Ω : Set (E d))) (hc : IsConnected (Ω : Set (E d))) :
    ∃ β > (0 : ℝ), ∀ q : Lp ℝ 2 (volume.restrict (Ω : Set (E d))),
      ∫ x in (Ω : Set (E d)), q x = 0 → ∃ v : Fin d → W1p0 volume Ω 2,
        w1pDiv (fun l => (v l : W1p volume Ω 2)) =ᵐ[volume.restrict (Ω : Set (E d))] q ∧
        β * √(∑ l, ‖W1p.gradient (v l : W1p volume Ω 2)‖ ^ 2) ≤ ‖q‖ := sorry

/-- The uniform discrete inf-sup condition for a velocity space `Vh` (each component in it) and
the mean-zero members of a pressure space `Qh`, in lifting form. -/
def IsUniformStokesStable (Ω : Opens (E d)) (Vh : ℕ → Submodule ℝ (W1p0 volume Ω 2))
    (Qh : ℕ → Submodule ℝ (W1p volume Ω 2)) : Prop :=
  ∃ β > (0 : ℝ), ∀ n, ∀ q ∈ Qh n, ∫ x in (Ω : Set (E d)), W1p.value q x = 0 →
    ∃ v : Fin d → W1p0 volume Ω 2, (∀ l, v l ∈ Vh n) ∧
      √(∑ l, ‖W1p.gradient (v l : W1p volume Ω 2)‖ ^ 2) ≤ ‖W1p.value q‖ ∧
      β * ‖W1p.value q‖ ^ 2 ≤
        ∫ x in (Ω : Set (E d)), w1pDiv (fun l => (v l : W1p volume Ω 2)) x * W1p.value q x

/-- **The MINI element is uniformly stable** (README 7.2): velocities `P₁` plus cell bubbles,
pressures continuous `P₁`. -/
theorem isUniformStokesStable_mini (hd : 2 ≤ d) {Ω : Opens (E d)} {σ : ℝ}
    (hΩ : (Ω : Set (E d)).IsLipschitzDomain (E (d - 1)))
    (hb : Bornology.IsBounded (Ω : Set (E d))) (hc : IsConnected (Ω : Set (E d)))
    (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ) :
    IsUniformStokesStable Ω
      (fun n => (submoduleW1pOf Ω 2 (lagrangeSpace (T n) 1 ⊔ bubbleSpace (T n))).comap
        (W1p0 volume Ω 2).subtype)
      (fun n => lagrangeSubmoduleW1p Ω 2 (T n) 1) := sorry

/-- **The Taylor–Hood element is uniformly stable** (README 7.2) in two and three dimensions when
the edges of each cell that do not lie in the boundary span the space. -/
theorem isUniformStokesStable_taylorHood (hd : d = 2 ∨ d = 3) {Ω : Opens (E d)} {σ : ℝ}
    (hΩ : (Ω : Set (E d)).IsLipschitzDomain (E (d - 1)))
    (hb : Bornology.IsBounded (Ω : Set (E d))) (hc : IsConnected (Ω : Set (E d)))
    (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ)
    (hedge : ∀ n i, Submodule.span ℝ {w | ∃ a b, ¬ segment ℝ (((T n).cell i).points a)
        (((T n).cell i).points b) ⊆ frontier (Ω : Set (E d)) ∧
          w = ((T n).cell i).points a - ((T n).cell i).points b} = ⊤) :
    IsUniformStokesStable Ω (fun n => lagrangeSubmoduleW1p0 Ω 2 (T n) 2)
      (fun n => lagrangeSubmoduleW1p Ω 2 (T n) 1) := sorry

end Stokes

/-! ## Layer 8: subcomplexes and the discrete Poincaré inequality -/

section FEEC

/-- **The discrete Poincaré inequality** (README 8.1): a subcomplex with a cochain projection
`π₀` that is bounded on `V₀` and commutes with `d` inherits the Poincaré constant `c_P` up to
the factor `‖π₀‖`. -/
theorem norm_le_of_cochainProjection {V₀ V₁ : Type*} [NormedAddCommGroup V₀]
    [InnerProductSpace ℝ V₀] [CompleteSpace V₀] [NormedAddCommGroup V₁] [InnerProductSpace ℝ V₁]
    (d : V₀ →L[ℝ] V₁) {cP : ℝ} (hP : ∀ z ∈ (LinearMap.ker d.toLinearMap)ᗮ, ‖z‖ ≤ cP * ‖d z‖)
    (Vh₀ : Submodule ℝ V₀) (Vh₁ : Submodule ℝ V₁) (hd : ∀ v ∈ Vh₀, d v ∈ Vh₁)
    (π₀ : V₀ →L[ℝ] V₀) (π₁ : V₁ →L[ℝ] V₁) (hπ₀ : ∀ v, π₀ v ∈ Vh₀) (hπ₁ : ∀ w ∈ Vh₁, π₁ w = w)
    (hcomm : d ∘L π₀ = π₁ ∘L d) {v : V₀} (hv : v ∈ Vh₀)
    (hperp : ∀ z ∈ Vh₀, d z = 0 → ⟪v, z⟫_ℝ = 0) : ‖v‖ ≤ cP * ‖π₀‖ * ‖d v‖ := sorry

end FEEC

#check @NormedSpace.inclusionInDoubleDual
#check @ContinuousLinearMap.flip
#check @Metric.infDist
#check @MeasureTheory.Measure.euclideanHausdorffMeasure
#check @Affine.Simplex.altitudeFoot
#check @Affine.Simplex.height
#check @MvPolynomial.restrictTotalDegree
#check @MvPolynomial.homogeneousSubmodule
#check @MvPolynomial.pderiv
#check @MvPolynomial.IsHomogeneous
#check @MvPolynomial.IsHomogeneous.sum_X_mul_pderiv
#check @TauCeti.HasWeakFDerivOn.integral_inner_gradient_eq_neg_integral_smul_trace
#check @Set.IsLipschitzDomain
#check @TauCeti.W1p
#check @TauCeti.W1p0
#check @TauCeti.Wkp
#check @TauCeti.W1p.value
#check @TauCeti.W1p.gradient
#check @TauCeti.Wkp.value
#check @TauCeti.Wkp.firstOrder
#check @TauCeti.PDE.IsWeakSolutionDirichlet
#check @TauCeti.PDE.UniformlyEllipticOn

end TauCetiRoadmap.MixedAndNonconformingFiniteElements
