module

public import Mathlib
public import TauCeti.Geometry.Lie.Tangent.LeftInvariantDerivation
public import TauCeti.Geometry.Lie.Exponential.Basic
public import TauCeti.Geometry.Lie.Adjoint.Derivation
public import TauCeti.Geometry.Lie.Subgroup.LieAlgebra
public import TauCeti.GroupTheory.TitsSystem.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Jacobi.Comparison

/-!
# Real semisimple Lie groups, parabolic subgroups and symmetric spaces: target signatures

This file is not the roadmap; the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need.

Stated here: the conjugacy of Cartan involutions under inner automorphisms (§0.2) and of
hyperbolic elements into the closed chamber (§2.4), for the Lie algebra of a Lie group, where
`Ad(lieExp Z) = e^{ad Z}` and, for connected groups, `Ad(G) = Int(𝔤₀)`; the restricted root pairing
of a Cartan involution (§1.2); the real rank of a real semisimple Lie algebra, its independence of
choices and the compactness criterion (§1.3), and its group form (§2.1); Cartan's fixed-point
theorem on a Hadamard manifold (§5.4); and, for connected groups with semisimple Lie algebra and
finite centre, the Bruhat decomposition as a Tits system (§3.3), the dynamical description of
parabolic subgroups (§4.4), the existence and conjugacy of maximal compact subgroups, and the
bijection between maximal compact subgroups and Cartan involutions (§5.4).

Headline theorems of the README that are not statable at the pins, and what each lacks:

* the identification of the restricted Weyl group `N_K(𝔞)/Z_K(𝔞)` with the Weyl group of the
  restricted root system (§2.3): the restricted root pairing exists here only inside the statement
  `exists_restrictedRootPairing`, and a definition of it would be data with a `sorry` body;
* the Langlands decompositions `M × A × N ≅ P` and `M_{Π'} × A_{Π'} × N_{Π'} ≅ Q` (§3.1,
  §4.3): they are diffeomorphisms of closed subgroups, and the pins give a closed subgroup only the
  predicate `TauCeti.Lie.IsEmbeddedLieSubgroup`, not a manifold structure;
* the comparison of parabolic subgroups with algebraic `ℝ`-parabolic subgroups (§4.5) and the
  conjugacy of maximal `ℝ`-split tori (§2.4): the pins have no Lie group structure on the real
  points of an algebraic group;
* the Cartan involutions of a real form of a complex reductive group (§2.5): the pins have no
  antiholomorphic automorphisms of a complex Lie group;
* the geometry of the symmetric space `G ⧸ K` (§5.2, §5.3, §5.5, §5.6), complex hyperbolic space
  included (§5.7): the pins have no smooth structure on `G ⧸ K`.
-/

@[expose] public section

noncomputable section

open LieAlgebra Module Set Bundle CovariantDerivative
open scoped Manifold ContDiff

namespace TauCetiRoadmap.RealSemisimpleLieGroups

/-! ## Layer 0: Cartan involutions -/

section CartanInvolution

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L]

/-- **§0.1.** A Cartan involution of a real semisimple Lie algebra: an involutive Lie algebra
automorphism `θ` for which `B_θ(X, Y) = -B(X, θ Y)` is positive definite, `B` the Killing form.
A real Lie algebra that has one is semisimple, since `B` is then nondegenerate. -/
def IsCartanInvolution (θ : L ≃ₗ⁅ℝ⁆ L) : Prop :=
  (∀ x, θ (θ x) = x) ∧ ∀ x : L, x ≠ 0 → 0 < -(killingForm ℝ L x (θ x))

/-- **§0.1.** The `-1`-eigenspace `𝔭` of `θ`. -/
def cartanP (θ : L ≃ₗ⁅ℝ⁆ L) : Submodule ℝ L :=
  LinearMap.ker ((θ : L →ₗ[ℝ] L) + LinearMap.id)

end CartanInvolution

section CartanConjugacy

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type*} [TopologicalSpace G] [ChartedSpace H G] [Group G]
  [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

attribute [local instance] LieGroup.minSmoothness_of_isRCLikeNormedField

/-- **§0.2.** Conjugacy of Cartan involutions: any two Cartan involutions `θ, θ'` of a real
semisimple Lie algebra satisfy `θ' = e^{ad Z} θ e^{−ad Z}` for some `Z ∈ 𝔭_θ`. Stated for the Lie
algebra of a Lie group `G`, where `e^{ad Z} = Ad(lieExp Z)`; every real semisimple Lie algebra is
one (`Int(𝔤₀)`). -/
theorem exists_conj_cartanInvolution [IsSemisimple ℝ (LeftInvariantDerivation I G)]
    {θ θ' : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G}
    (hθ : IsCartanInvolution θ) (hθ' : IsCartanInvolution θ') :
    ∃ Z ∈ cartanP θ, ∀ Y, θ' (TauCeti.Lie.Ad (I := I) (lieExp Z) Y) =
      TauCeti.Lie.Ad (I := I) (lieExp Z) (θ Y) := sorry

end CartanConjugacy

/-! ## Layer 1: restricted roots and real rank -/

section RestrictedRoots

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L]

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

/-- **§1.2, §3.1.** The sum `𝔫 = ⊕_{λ ∈ Σ⁺} 𝔤_λ` of the restricted root spaces of the positive
system `Σ⁺ = {λ ∈ Σ | λ(H₀) > 0}` cut out by `H₀ ∈ 𝔞`. -/
def positiveRestrictedRootSpace (𝔞 : Submodule ℝ L) (H₀ : 𝔞) : Submodule ℝ L :=
  ⨆ (μ ∈ restrictedRoots 𝔞) (_ : 0 < μ H₀), restrictedRootSpace 𝔞 μ

/-- **§1.2.** The restricted roots of a Cartan involution of a real semisimple Lie algebra form a
crystallographic root system, possibly nonreduced, for the evaluation pairing of `𝔞*` with `𝔞`:
LieGroups Layer 9's restricted root system, packaged as a Mathlib `RootPairing` indexed by `Σ`. -/
theorem exists_restrictedRootPairing [FiniteDimensional ℝ L] [IsSemisimple ℝ L]
    {θ : L ≃ₗ⁅ℝ⁆ L} (hθ : IsCartanInvolution θ) {𝔞 : Submodule ℝ L}
    (h𝔞 : IsMaximalAbelianInP θ 𝔞) :
    ∃ P : RootPairing (restrictedRoots 𝔞) ℝ (Module.Dual ℝ 𝔞) 𝔞,
      (∀ (f : Module.Dual ℝ 𝔞) (x : 𝔞), P.toLinearMap f x = f x) ∧
      (∀ i, P.root i = (i : Module.Dual ℝ 𝔞)) ∧ P.IsCrystallographic ∧ P.IsRootSystem := sorry

variable (L) in
/-- **§1.3.** The real rank of a real semisimple Lie algebra: the dimension of a maximal abelian
subspace of `𝔭` for a Cartan involution. Written as a supremum so that it is a definition
without choices; `finrank_eq_realRank` says every choice attains it. A real Lie algebra that is
not semisimple has no Cartan involution, so the supremum is empty and the value is `0`; the real
rank of a reductive algebra is read from a reductive Cartan involution instead (README §1.3). -/
def realRank : ℕ :=
  sSup {n | ∃ θ : L ≃ₗ⁅ℝ⁆ L, IsCartanInvolution θ ∧
    ∃ 𝔞 : Submodule ℝ L, IsMaximalAbelianInP θ 𝔞 ∧ finrank ℝ 𝔞 = n}

/-- **§1.3.** Independence of choices: every Cartan involution and every maximal abelian
subspace of its `𝔭` give the real rank. -/
theorem finrank_eq_realRank [FiniteDimensional ℝ L] [IsSemisimple ℝ L] {θ : L ≃ₗ⁅ℝ⁆ L}
    (hθ : IsCartanInvolution θ) {𝔞 : Submodule ℝ L} (h𝔞 : IsMaximalAbelianInP θ 𝔞) :
    finrank ℝ 𝔞 = realRank L := sorry

/-- **§1.3.** Real rank zero characterizes the compact real semisimple Lie algebras, those with
negative definite Killing form. -/
theorem realRank_eq_zero_iff [FiniteDimensional ℝ L] [IsSemisimple ℝ L] :
    realRank L = 0 ↔ ∀ x : L, x ≠ 0 → killingForm ℝ L x x < 0 := sorry

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
/-- **§2.1.** The real rank of a Lie group with semisimple Lie algebra is the real rank of its
Lie algebra (`0` when the Lie algebra is not semisimple). -/
abbrev groupRealRank : ℕ := realRank (LeftInvariantDerivation I G)

/-- **§2.1.** A connected Lie group with semisimple Lie algebra has real rank zero exactly
when it is compact. Infinite centre is allowed: the forward direction consumes LieGroups
Layer 7's compactness of the simply connected integration of a compact semisimple algebra. -/
theorem groupRealRank_eq_zero_iff_compactSpace [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)] :
    groupRealRank I G = 0 ↔ CompactSpace G := sorry

/-- **§2.4.** Hyperbolic elements: for a connected Lie group with semisimple Lie algebra, a Cartan
involution `θ`, a maximal abelian `𝔞 ⊆ 𝔭` and a regular `H₀ ∈ 𝔞`, every hyperbolic `X` (`ad X`
diagonalizable over `ℝ`) is `Ad(G)`-conjugate to exactly one element of the closed chamber
`{Y ∈ 𝔞 | λ(Y) ≥ 0 whenever λ(H₀) > 0}`. Here `Ad(G) = Int(𝔤₀)` because `G` is connected
(Kostant, *On convexity, the Weyl group and the Iwasawa decomposition*, Proposition 2.4). -/
theorem existsUnique_ad_mem_closedChamber [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)]
    {θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G}
    (hθ : IsCartanInvolution θ) {𝔞 : Submodule ℝ (LeftInvariantDerivation I G)}
    (h𝔞 : IsMaximalAbelianInP θ 𝔞) {H₀ : 𝔞} (hH₀ : ∀ μ ∈ restrictedRoots 𝔞, μ H₀ ≠ 0)
    {X : LeftInvariantDerivation I G}
    (hX : ⨆ c : ℝ, Module.End.eigenspace (ad ℝ (LeftInvariantDerivation I G) X) c = ⊤) :
    ∃! Y : 𝔞, (∀ μ ∈ restrictedRoots 𝔞, 0 < μ H₀ → 0 ≤ μ Y) ∧
      ∃ g : G, TauCeti.Lie.Ad (I := I) g X = Y := sorry

/-! ## Layer 3: the Bruhat decomposition -/

/-- **§3.3.** The Bruhat decomposition as a Tits system. Let `G` be connected with semisimple Lie
algebra and finite centre, `θ` a Cartan involution of its Lie algebra, `𝔞` a maximal abelian
subspace of `𝔭` and `H₀ ∈ 𝔞` regular. The normalizer in `G` of `𝔫 = ⊕_{λ(H₀) > 0} 𝔤_λ`, which is
the minimal parabolic subgroup `MAN`, and the normalizer of `𝔞` are the subgroups `B` and `N` of
a Tits system on `G`. -/
theorem exists_titsSystem [ConnectedSpace G] [IsSemisimple ℝ (LeftInvariantDerivation I G)]
    [Finite (Subgroup.center G)]
    {θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G}
    (hθ : IsCartanInvolution θ) {𝔞 : Submodule ℝ (LeftInvariantDerivation I G)}
    (h𝔞 : IsMaximalAbelianInP θ 𝔞) {H₀ : 𝔞} (hH₀ : ∀ μ ∈ restrictedRoots 𝔞, μ H₀ ≠ 0) :
    ∃ T : TauCeti.TitsSystem G,
      (∀ g : G, g ∈ T.subgroupB ↔ ∀ Y ∈ positiveRestrictedRootSpace 𝔞 H₀,
        TauCeti.Lie.Ad (I := I) g Y ∈ positiveRestrictedRootSpace 𝔞 H₀) ∧
      (∀ g : G, g ∈ T.subgroupN ↔ ∀ Y ∈ 𝔞, TauCeti.Lie.Ad (I := I) g Y ∈ 𝔞) := sorry

/-! ## Layer 4: the dynamical description of parabolic subgroups -/

/-- **§4.4.** The dynamical parabolic subset of `X ∈ 𝔤`: the `g` whose conjugates
`exp(-tX) g exp(tX)`, `t ≥ 0`, stay in a compact set. -/
def dynamicalParabolic (X : LeftInvariantDerivation I G) : Set G :=
  {g | IsCompact (closure (range fun t : Ici (0 : ℝ) ↦
    lieExp ((-(t : ℝ)) • X) * g * lieExp ((t : ℝ) • X)))}

/-- **§4.4.** The sum of the eigenspaces of `ad X` with nonnegative eigenvalue. For `X` in the
closed positive chamber it is the standard parabolic subalgebra `𝔮_{Π'}`, `Π'` the simple
roots vanishing on `X`. -/
def nonnegEigenSubmodule {L : Type*} [LieRing L] [LieAlgebra ℝ L] (X : L) : Submodule ℝ L :=
  ⨆ (c : ℝ) (_ : 0 ≤ c), Module.End.eigenspace (ad ℝ L X) c

/-- **§4.4.** The dynamical description of parabolic subgroups. Let `G` be connected with
semisimple Lie algebra and finite centre, and `X` hyperbolic (`ad X` diagonalizable over `ℝ`).
Then `dynamicalParabolic X` is a closed subgroup whose Lie algebra is `nonnegEigenSubmodule X`,
and it is parabolic: it contains the minimal parabolic subgroup `N_G(𝔫)` of some Cartan involution,
maximal abelian `𝔞 ⊆ 𝔭` and regular `H₀ ∈ 𝔞`. -/
theorem dynamicalParabolic_isClosed_lie [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)] [Finite (Subgroup.center G)]
    {X : LeftInvariantDerivation I G}
    (hX : ⨆ c : ℝ, Module.End.eigenspace (ad ℝ (LeftInvariantDerivation I G) X) c = ⊤) :
    ∃ Q : Subgroup G, (Q : Set G) = dynamicalParabolic X ∧ IsClosed (Q : Set G) ∧
      (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) Q).toSubmodule = nonnegEigenSubmodule X ∧
      ∃ θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G,
        IsCartanInvolution θ ∧ ∃ 𝔞 : Submodule ℝ (LeftInvariantDerivation I G),
          IsMaximalAbelianInP θ 𝔞 ∧ ∃ H₀ : 𝔞, (∀ μ ∈ restrictedRoots 𝔞, μ H₀ ≠ 0) ∧
            ∀ g : G, (∀ Y ∈ positiveRestrictedRootSpace 𝔞 H₀,
              TauCeti.Lie.Ad (I := I) g Y ∈ positiveRestrictedRootSpace 𝔞 H₀) → g ∈ Q := sorry

end Group

/-! ## Layer 5: Cartan's fixed-point theorem and maximal compact subgroups -/

section CartanFixedPoint

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

/-- **§5.4.** Cartan's fixed-point theorem: a compact group acting continuously by isometries on
a Hadamard manifold (complete, simply connected, sectional curvature `≤ 0`, distance the
Riemannian distance) has a fixed point. -/
theorem exists_forall_smul_eq_of_sectionalCurvature_nonpos [I.Boundaryless]
    [IsRiemannianManifold I M] [CompleteSpace M] [SimplyConnectedSpace M]
    (hK : ∀ (x : M) (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      (leviCivitaConnection I M).sectionalCurvature (isMetricCompatible_leviCivitaConnection I)
        x u v ≤ 0)
    {Λ : Type*} [Group Λ] [TopologicalSpace Λ] [IsTopologicalGroup Λ] [CompactSpace Λ]
    [MulAction Λ M]
    [ContinuousSMul Λ M] [IsIsometricSMul Λ M] :
    ∃ x : M, ∀ l : Λ, l • x = x := sorry

end CartanFixedPoint

section MaximalCompact

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type*} [TopologicalSpace G] [ChartedSpace H G] [Group G]
  [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

attribute [local instance] LieGroup.minSmoothness_of_isRCLikeNormedField

local instance : FiniteDimensional ℝ (LeftInvariantDerivation I G) :=
  finiteDimensional_leftInvariantDerivation BoundarylessManifold.isInteriorPoint

/-- **§5.4.** Maximal compact subgroups of a connected Lie group with semisimple Lie algebra and
finite centre: one exists, and every compact subgroup lies in a conjugate of any given maximal
compact subgroup; in particular any two maximal compact subgroups are conjugate. -/
theorem exists_maximal_isCompact_and_le_conj [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)] [Finite (Subgroup.center G)] :
    (∃ K : Subgroup G, Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K) ∧
      ∀ K : Subgroup G, Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K →
        ∀ C : Subgroup G, IsCompact (C : Set G) →
          ∃ g : G, C ≤ K.map (MulAut.conj g).toMonoidHom := sorry

/-- **§5.4.** Maximal compact subgroups and Cartan involutions. For a connected Lie group with
semisimple Lie algebra and finite centre, `θ ↦ K_θ` is a bijection from the Cartan involutions
onto the maximal compact subgroups: the Lie algebra of each maximal compact subgroup is the
`+1`-eigenspace `𝔨` of exactly one Cartan involution, and the `𝔨` of each Cartan involution is the
Lie algebra of exactly one maximal compact subgroup. -/
theorem existsUnique_isCartanInvolution_lie_eq [ConnectedSpace G]
    [IsSemisimple ℝ (LeftInvariantDerivation I G)] [Finite (Subgroup.center G)] :
    (∀ K : Subgroup G, Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K →
      ∃! θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G,
        IsCartanInvolution θ ∧ (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule =
          LinearMap.ker ((θ : LeftInvariantDerivation I G →ₗ[ℝ] LeftInvariantDerivation I G) -
            LinearMap.id)) ∧
    ∀ θ : LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ LeftInvariantDerivation I G, IsCartanInvolution θ →
      ∃! K : Subgroup G, Maximal (fun K : Subgroup G ↦ IsCompact (K : Set G)) K ∧
        (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule =
          LinearMap.ker ((θ : LeftInvariantDerivation I G →ₗ[ℝ] LeftInvariantDerivation I G) -
            LinearMap.id) := sorry

end MaximalCompact

end TauCetiRoadmap.RealSemisimpleLieGroups
