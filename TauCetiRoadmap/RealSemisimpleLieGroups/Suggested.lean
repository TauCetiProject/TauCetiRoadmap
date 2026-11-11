module

public import Mathlib
public import TauCeti.Algebra.Lie.Symplectic.Killing
public import TauCeti.Geometry.Lie.Tangent.LeftInvariantDerivation
public import TauCeti.Geometry.Lie.Exponential.Basic
public import TauCeti.Geometry.Lie.Adjoint.Derivation
public import TauCeti.Geometry.Manifold.Riemannian.Isometry.Basic
public import TauCeti.GroupTheory.TitsSystem.Parabolic.Basic

/-!
# Real semisimple Lie groups, parabolic subgroups and symmetric spaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Stated here: the Cartan-involution predicate on a real Lie algebra and its eigenspaces (§0.1),
the symplectic instance already in Tau Ceti (§0.4), maximal abelian subspaces of `𝔭`, restricted
root spaces and restricted roots (§1.1), the restricted root pairing (§1.2), the real rank of a
real semisimple Lie algebra with its independence of choices and its examples (§1.3, §1.4), the
real rank of a Lie group and the compactness criterion (§2.1), the nonnegative-eigenvalue
parabolic subalgebra of an element and the dynamical parabolic subset of a Lie group (§4.4), the
Riemannian symmetric-space predicate (§5.1), and the displacement injectivity radius of a group
acting on a metric space (§5.6).

Not stated here, and why:

* everything that takes a LieGroups Layer 9 `CartanInvolution` or `IwasawaData` as input
  (Layers 2–4 beyond the real rank, the minimal parabolic interface of §3.1, the Tits system of
  §3.3): those structures live in the LieGroups roadmap's `Suggested.lean`, not in Tau Ceti, so
  they cannot be imported here;
* the conjugacy of Cartan involutions (§0.2) and of hyperbolic elements (§2.4): the pins have no
  inner automorphism group `Int(𝔤₀)` of a real Lie algebra;
* the symmetric space `G ⧸ K` as a Riemannian manifold (§5.2–§5.5): the pins have no smooth
  structure on `G ⧸ K` (SmoothBundlesConnections B1.4 is its supplier).
-/

@[expose] public section

noncomputable section

open LieAlgebra Module Set Bundle
open scoped Manifold ContDiff ENNReal

namespace TauCetiRoadmap.RealSemisimpleLieGroups

/-! ## Layer 0: Cartan involutions -/

section CartanInvolution

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L] [FiniteDimensional ℝ L]

/-- **§0.1.** A Cartan involution of a real semisimple Lie algebra: an involutive Lie algebra
automorphism `θ` for which `B_θ(X, Y) = -B(X, θ Y)` is positive definite, `B` the Killing form.
-/
def IsCartanInvolution (θ : L ≃ₗ⁅ℝ⁆ L) : Prop :=
  (∀ x, θ (θ x) = x) ∧ ∀ x : L, x ≠ 0 → 0 < -(killingForm ℝ L x (θ x))

/-- **§0.1.** The reductive form: an involutive automorphism whose restriction to the derived
algebra satisfies the Cartan positivity; on the centre it is an arbitrary involution. -/
def IsReductiveCartanInvolution (θ : L ≃ₗ⁅ℝ⁆ L) : Prop :=
  (∀ x, θ (θ x) = x) ∧
    ∀ x ∈ derivedSeries ℝ L 1, x ≠ 0 → 0 < -(killingForm ℝ L x (θ x))

/-- The `+1`-eigenspace `𝔨` of `θ`. -/
def cartanK (θ : L ≃ₗ⁅ℝ⁆ L) : Submodule ℝ L :=
  LinearMap.ker ((θ : L →ₗ[ℝ] L) - LinearMap.id)

/-- The `-1`-eigenspace `𝔭` of `θ`. -/
def cartanP (θ : L ≃ₗ⁅ℝ⁆ L) : Submodule ℝ L :=
  LinearMap.ker ((θ : L →ₗ[ℝ] L) + LinearMap.id)

/-- **§0.1.** The Cartan decomposition `𝔤₀ = 𝔨 ⊕ 𝔭`. -/
theorem isCompl_cartanK_cartanP {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : ∀ x, θ (θ x) = x) :
    IsCompl (cartanK θ) (cartanP θ) := sorry

/-- **§0.1.** `[𝔭, 𝔭] ⊆ 𝔨`. -/
theorem lie_mem_cartanK_of_mem_cartanP {θ : L ≃ₗ⁅ℝ⁆ L} {x y : L}
    (hx : x ∈ cartanP θ) (hy : y ∈ cartanP θ) : ⁅x, y⁆ ∈ cartanK θ := sorry

/-- **§0.1.** The Killing form is positive definite on `𝔭` and negative definite on `𝔨`. -/
theorem killingForm_pos_of_mem_cartanP {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : IsCartanInvolution θ) {x : L}
    (hx : x ∈ cartanP θ) (hx0 : x ≠ 0) : 0 < killingForm ℝ L x x := sorry

/-- **§0.3.** A real semisimple Lie algebra is compact (negative definite Killing form) exactly
when the identity is a Cartan involution, exactly when `𝔭 = 0` for some (any) Cartan
involution. -/
theorem isCartanInvolution_refl_iff :
    IsCartanInvolution (LieEquiv.refl : L ≃ₗ⁅ℝ⁆ L) ↔
      ∀ x : L, x ≠ 0 → killingForm ℝ L x x < 0 := sorry

end CartanInvolution

/-- **§0.4.** The symplectic Cartan involution `X ↦ -Xᵀ` already in Tau Ceti is a Cartan
involution of `𝔰𝔭(2n, ℝ)`. -/
theorem isCartanInvolution_symplectic (l : Type*) [Fintype l] [DecidableEq l] :
    IsCartanInvolution (LieAlgebra.Symplectic.cartanInvolution l ℝ) := sorry

/-! ## Layer 1: restricted roots and real rank -/

section RestrictedRoots

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L] [FiniteDimensional ℝ L]

/-- **§1.1.** A maximal abelian subspace of `𝔭`: maximal under inclusion among the subspaces of
`𝔭` on which the bracket vanishes. -/
def IsMaximalAbelianInP (θ : L ≃ₗ⁅ℝ⁆ L) (𝔞 : Submodule ℝ L) : Prop :=
  Maximal (fun 𝔟 : Submodule ℝ L ↦ 𝔟 ≤ cartanP θ ∧ ∀ x ∈ 𝔟, ∀ y ∈ 𝔟, ⁅x, y⁆ = 0) 𝔞

/-- **§1.1.** The restricted root space `𝔤_λ = {X | [H, X] = λ(H) X for all H ∈ 𝔞}`. -/
def restrictedRootSpace (𝔞 : Submodule ℝ L) (μ : Module.Dual ℝ 𝔞) : Submodule ℝ L :=
  ⨅ H : 𝔞, Module.End.eigenspace (ad ℝ L (H : L)) (μ H)

/-- **§1.1.** The restricted roots: the nonzero `λ ∈ 𝔞*` with `𝔤_λ ≠ 0`. -/
def restrictedRoots (𝔞 : Submodule ℝ L) : Set (Module.Dual ℝ 𝔞) :=
  {μ | μ ≠ 0 ∧ restrictedRootSpace 𝔞 μ ≠ ⊥}

/-- **§1.1.** The restricted root space decomposition: `𝔤₀` is the direct sum of `𝔤_0` and the
`𝔤_λ`, `λ ∈ Σ`, and `Σ` is finite. -/
theorem iSupIndep_restrictedRootSpace {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : IsCartanInvolution θ)
    {𝔞 : Submodule ℝ L} (h𝔞 : IsMaximalAbelianInP θ 𝔞) :
    (restrictedRoots 𝔞).Finite ∧
      iSupIndep (fun μ : ({0} ∪ restrictedRoots 𝔞 : Set (Module.Dual ℝ 𝔞)) ↦
        restrictedRootSpace 𝔞 (μ : Module.Dual ℝ 𝔞)) ∧
      ⨆ μ : ({0} ∪ restrictedRoots 𝔞 : Set (Module.Dual ℝ 𝔞)),
        restrictedRootSpace 𝔞 (μ : Module.Dual ℝ 𝔞) = ⊤ := sorry

/-- **§1.2.** The restricted roots form a crystallographic root pairing for the evaluation pairing
of `𝔞*` with `𝔞`, possibly nonreduced, which is a root system (its roots span `𝔞*`) for
semisimple `𝔤₀`. -/
theorem exists_restrictedRootPairing [IsSemisimple ℝ L] {θ : L ≃ₗ⁅ℝ⁆ L}
    (hθ : IsCartanInvolution θ) {𝔞 : Submodule ℝ L} (h𝔞 : IsMaximalAbelianInP θ 𝔞) :
    ∃ P : RootPairing (restrictedRoots 𝔞) ℝ (Module.Dual ℝ 𝔞) 𝔞,
      (∀ (f : Module.Dual ℝ 𝔞) (x : 𝔞), P.toLinearMap f x = f x) ∧
      (∀ i, P.root i = (i : Module.Dual ℝ 𝔞)) ∧ P.IsCrystallographic ∧ P.IsRootSystem := sorry

/-- **§1.2.** The only multiples of a restricted root that are restricted roots are
`±1/2`, `±1` and `±2` times it. -/
theorem restrictedRoots_smul_mem {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : IsCartanInvolution θ)
    {𝔞 : Submodule ℝ L} (h𝔞 : IsMaximalAbelianInP θ 𝔞) {α : Module.Dual ℝ 𝔞}
    (hα : α ∈ restrictedRoots 𝔞) {c : ℝ} (hc : c • α ∈ restrictedRoots 𝔞) :
    c ∈ ({-2, -1, -1/2, 1/2, 1, 2} : Set ℝ) := sorry

variable (L) in
/-- **§1.3, Annals #1.** The real rank of a real Lie algebra: the dimension of a maximal abelian
subspace of `𝔭` for a Cartan involution. Written as a supremum so that it is a definition
without choices; `finrank_eq_realRank` says every choice attains it. -/
def realRank : ℕ :=
  sSup {n | ∃ θ : L ≃ₗ⁅ℝ⁆ L, IsCartanInvolution θ ∧
    ∃ 𝔞 : Submodule ℝ L, IsMaximalAbelianInP θ 𝔞 ∧ finrank ℝ 𝔞 = n}

/-- **§1.3.** Independence of choices: every Cartan involution and every maximal abelian
subspace of its `𝔭` give the real rank. -/
theorem finrank_eq_realRank [IsSemisimple ℝ L] {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : IsCartanInvolution θ)
    {𝔞 : Submodule ℝ L} (h𝔞 : IsMaximalAbelianInP θ 𝔞) :
    finrank ℝ 𝔞 = realRank L := sorry

/-- **§1.3.** Real rank zero characterizes compact real semisimple Lie algebras. -/
theorem realRank_eq_zero_iff [IsSemisimple ℝ L] :
    realRank L = 0 ↔ ∀ x : L, x ≠ 0 → killingForm ℝ L x x < 0 := sorry

/-- **§1.4.** `rank_ℝ 𝔰𝔩(n, ℝ) = n - 1`. -/
theorem realRank_sl (n : ℕ) :
    realRank (LieAlgebra.SpecialLinear.sl (Fin n) ℝ) = n - 1 := sorry

/-- **§1.4.** `rank_ℝ 𝔰𝔭(2n, ℝ) = n`. -/
theorem realRank_sp (n : ℕ) :
    realRank (LieAlgebra.Symplectic.sp (Fin n) ℝ) = n := sorry

end RestrictedRoots

/-! ## Layer 2: real rank of a Lie group -/

section Group

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type*} [TopologicalSpace G] [ChartedSpace H G] [Group G]
  [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

attribute [local instance] LieGroup.minSmoothness_of_isRCLikeNormedField

local instance : FiniteDimensional ℝ (LeftInvariantDerivation I G) :=
  finiteDimensional_leftInvariantDerivation BoundarylessManifold.isInteriorPoint

variable (I G) in
/-- **§2.1, Annals #1.** The real rank of a Lie group is the real rank of its Lie algebra. -/
abbrev groupRealRank : ℕ := realRank (LeftInvariantDerivation I G)

/-- **§2.1.** A connected Lie group with semisimple Lie algebra has real rank zero exactly
when it is compact. Infinite centre is allowed: the forward direction consumes LieGroups
Layer 7's compactness of the simply connected integration of a compact semisimple algebra. -/
theorem groupRealRank_eq_zero_iff_compactSpace [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)] :
    groupRealRank I G = 0 ↔ CompactSpace G := sorry

/-- **§4.4.** The dynamical parabolic subset of `X ∈ 𝔤`: the `g` whose conjugates
`exp(-tX) g exp(tX)`, `t ≥ 0`, stay in a compact set. -/
def dynamicalParabolic (X : LeftInvariantDerivation I G) : Set G :=
  {g | IsCompact (closure (range fun t : Ici (0 : ℝ) ↦
    lieExp ((-(t : ℝ)) • X) * g * lieExp ((t : ℝ) • X)))}

/-- **§4.4.** The dynamical parabolic subset is a subgroup, for every `X`. Closedness, and its
identification with a parabolic subgroup, hold for hyperbolic `X` in a real reductive group and
are stated in the README. -/
theorem exists_subgroup_eq_dynamicalParabolic (X : LeftInvariantDerivation I G) :
    ∃ Q : Subgroup G, (Q : Set G) = dynamicalParabolic X := sorry

end Group

/-! ## Layer 4: the nonnegative-eigenvalue parabolic subalgebra -/

section ParabolicSubalgebra

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L] [FiniteDimensional ℝ L]

/-- **§4.4.** The sum of the eigenspaces of `ad X` with nonnegative eigenvalue. For `X` in the
closed positive chamber it is the standard parabolic subalgebra `𝔮_{Π'}`, `Π'` the simple
roots vanishing on `X`. -/
def nonnegEigenSubmodule (X : L) : Submodule ℝ L :=
  ⨆ (c : ℝ) (_ : 0 ≤ c), Module.End.eigenspace (ad ℝ L X) c

/-- **§4.4.** For `X ∈ 𝔭` the nonnegative-eigenvalue space is a Lie subalgebra. -/
theorem lie_mem_nonnegEigenSubmodule {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : IsCartanInvolution θ) {X : L}
    (hX : X ∈ cartanP θ) {y z : L} (hy : y ∈ nonnegEigenSubmodule X)
    (hz : z ∈ nonnegEigenSubmodule X) : ⁅y, z⁆ ∈ nonnegEigenSubmodule X := sorry

end ParabolicSubalgebra

/-! ## Layer 5: symmetric spaces -/

section SymmetricSpace

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

/-- **§5.1.** A Riemannian globally symmetric space: every point is an isolated fixed point of
an involutive Riemannian isometry whose differential there is `-1`. Connectedness is imposed
separately where it is used. -/
def IsRiemannianSymmetricSpace : Prop :=
  ∀ p : M, ∃ s : TauCeti.RiemannianIsometry I I M M,
    s p = p ∧ (∀ x, s (s x) = x) ∧ ∀ v : TangentSpace I p, mfderiv I I s p v = -v

end SymmetricSpace

section Displacement

variable {X : Type*} [PseudoEMetricSpace X] {Λ : Type*} [Group Λ] [MulAction Λ X]

/-- **§5.6, Annals #62.5(c).** The injectivity radius at `x` of the quotient by `Λ`, defined by
displacement: half the infimum of `d(x, γ x)` over `γ ≠ 1`, and `∞` for trivial `Λ`. -/
def displacementInjRad (x : X) : ℝ≥0∞ :=
  (⨅ (γ : Λ) (_ : γ ≠ 1), edist x (γ • x)) / 2

/-- **§5.6.** For an isometric action the displacement radius is constant on orbits, so it is a
function on the quotient. -/
theorem displacementInjRad_smul [IsIsometricSMul Λ X] (γ : Λ) (x : X) :
    displacementInjRad (Λ := Λ) (γ • x) = displacementInjRad (Λ := Λ) x := sorry

end Displacement

end TauCetiRoadmap.RealSemisimpleLieGroups
