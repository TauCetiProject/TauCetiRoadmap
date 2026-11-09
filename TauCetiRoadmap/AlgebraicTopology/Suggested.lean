module

public import Mathlib
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.Cohomology.HomotopyInvariance
public import TauCeti.AlgebraicTopology.Cohomology.IntegralCup
public import TauCeti.AlgebraicTopology.Cohomology.Kronecker
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Absolute
public import TauCeti.AlgebraicTopology.Homotopy.Relative.Hurewicz
public import TauCeti.AlgebraicTopology.SerreClass.PowerTorsion
public import TauCeti.AlgebraicTopology.SerreClass.Torsion
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.Topology.CWComplex.Classical.FiniteCWType
public import TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace
public import TauCeti.Topology.Homotopy.HomotopyGroup.WeakHomotopyEquivalence
public import TauCeti.Topology.Homotopy.LusternikSchnirelmann

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished
roadmap is tested against them: the right adjoint of the inclusion of compactly generated
spaces (Stage 4.5); Poincaré duality by cap product with the pinned fundamental class of a compact
oriented manifold (Stage 6.4); the multiplicativity of the Euler characteristic in a fibre bundle
(Stage 7.2); the relative Hurewicz isomorphism for a simply connected subspace (Stage 8.4);
homological Whitehead (Stage 8.5); the finite CW type of compact smooth manifolds (Stage 8.7);
the existence of the coefficient-functorial family of CW Eilenberg–MacLane spaces and of the
Dold–Kan models (Stage 8.8c); Hurewicz modulo the torsion class and modulo the class of groups
annihilated by a power of `d` (Stage 8.8d); ordinary cohomology representability with its
normalized universal class (Stage 8.10); the loop comparison `K(A, n) → ΩK(A, n + 1)` in positive
degrees (Stage 8.11b); and the cup-length lower bound for the Lusternik–Schnirelmann category (the
categorical-cover supplement of Stage 6.2).

Headline theorems that are theorems of the pinned Tau Ceti, and therefore not stated here: van
Kampen for the fundamental groupoid (`TauCeti.FundamentalGroupoid.isColimitCechCocone`), excision
and Mayer–Vietoris (`TopPair.isIso_singularHomologyMap_excisionMap_compl`,
`TopCat.mayerVietoris_exact₁`), the cellular comparison in every dimension
(`TauCeti.cellularSingularHomologyIsoUniv`), the degree-one Hurewicz isomorphism
(`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`), the absolute Hurewicz theorem
(`HomotopyGroup.hurewiczAddEquiv`), the relative Hurewicz isomorphism for two highly connected
spaces (`TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup`),
Whitehead's theorem for spaces of CW type
(`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`), CW approximation of a path-connected
space (`TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`), the invariance of singular
homology under weak homotopy equivalences
(`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`), cellular approximation
(`TauCeti.exists_isCellular_homotopicRel`),
the Künneth theorem over a field and with projective homology
(`TopCat.isIso_singularHomologyKunneth_of_projective_homology`), the transfer of a finite covering
(`IsCoveringMap.singularTransfer`), the spectral sequence of a filtered space
(`TauCeti.filteredSpaceSpectralSequence`), the fundamental class of a compact oriented manifold
(`TauCeti.HomologicalOrientation.fundamentalClass`), the Euler characteristic of a space of finite
CW type (`TauCeti.eulerChar`) with its product, finite-cover and open Mayer–Vietoris laws
(`TauCeti.eulerChar_prod`, `TauCeti.eulerChar_eq_mul_of_isCoveringMap`,
`TauCeti.eulerChar_union_add_eulerChar_inter`), Brouwer's fixed-point theorem
(`TauCeti.brouwerFixedPoint_compactConvex`), the categorical covers and the unnormalized
Lusternik–Schnirelmann count (`TauCeti.LSCategoricalCover`, `TauCeti.lsCategoryCount`), and
simple connectivity at infinity (`TauCeti.SimplyConnectedAtInfinity`).

Headline theorems that are not statable at the pins, stated in `README.md` only, and what each
lacks: the cellular comparison with module-valued local coefficients (Stage 4.3; no twisted
cellular chain complex), the Serre spectral sequences with their monodromy local systems and the
multiplicative structure (Stage 5.5; the pinned fibre local system is for Hurewicz fibrations on
cubical chains, and the identification of the second page with twisted cellular homology has no
carrier), the Cartan–Leray spectral sequence (Stage 5.3; no double complex of a regular cover
in the pinned representation category), the Künneth spectral sequence over a general ring
(Stage 5.1; a spectral sequence is data, and neither pin has a spectral object of a pair of spaces
whose second page is identified with the `Tor` groups of their homologies, so only the weaker
existence of some spectral sequence could be written), the twisted relative fundamental class of
a manifold with boundary and the Poincaré–Lefschetz and triad dualities with local coefficients
(Stages 6.3–6.4; no orientation local system across a boundary and no twisted fundamental class
at the pin), the torsion linking pairing (Stage 6.5; the pairing is a construction, the
composite of a Bockstein, Poincaré duality and the universal-coefficient `Ext` term, and its
nonsingularity is a property of that map, which no pinned declaration defines), the proper
Whitehead theorem (Stage 8.5; no compactly supported cohomology at the pin), the relative
obstruction cochain with local coefficients and its extension criteria (Stage 8.9; the cochain is
a construction, carried as a README target with its signature), the cohomology suspension
(Stage 8.11b; the suspension map is a construction, the connecting map of the cone pair
transported to the suspension, and neither pin has the cone or the reduced suspension of a
topological space), and the normalized nerve-model comparison with the pinned classifying spaces
(Stage 8.8b; its normalization runs through Stage 8.8a's identification of `π₁` of the realized
nerve of `SingleObj π` with `π`, a construction absent from the pins).
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits
open scoped ContDiff Manifold MonoidalCategory

universe u

noncomputable section

/-! ## Stage 4.5: the compactly generated coreflection -/

/-- **The inclusion of compactly generated spaces has a right adjoint** (Stage 4.5): Mathlib's
fully faithful inclusion `CompactlyGenerated.compactlyGeneratedToTop` of the `u`-compactly
generated spaces into `TopCat.{u}` is a left adjoint. Its right adjoint is the coreflection
`k` that puts `TopologicalSpace.compactlyGenerated` on a space, whose counit `k X → X` is the
continuous identity; this is the interface consumed by the kified CW product of Stage 4.5 and by
Stages 8.10–8.11. -/
theorem compactlyGeneratedToTop_isLeftAdjoint :
    CompactlyGenerated.compactlyGeneratedToTop.{u, u}.IsLeftAdjoint := by
  sorry

/-! ## Stage 6: Poincaré duality -/

/-- Mathlib's `MonoidalLinear ℤ` instance on `ModuleCat ℤ` is stated for its `ℤ`-linear
structure as a category of modules, while instance search finds the `ℤ`-linear structure of a
preadditive category; the pinned `TauCeti.AlgebraicTopology.Cohomology.IntegralCup` declares
this same local instance to state the integral cup product, and the integral cap product below
needs it in the same way. -/
local instance : MonoidalLinear ℤ (ModuleCat.{0} ℤ) where
  whiskerLeft_smul X _ _ r f := whiskerLeft_zsmul r X f
  smul_whiskerRight r _ _ f X := zsmul_whiskerRight r f X

/-- **Poincaré duality** (Stage 6.4, empty boundary; Hatcher, Theorem 3.30): for a compact
Hausdorff topological manifold `M` modelled on a real vector space `E` of dimension `n`, with a
homological orientation `o` in degree `n`, cap product with the pinned fundamental class
`o.fundamentalClass hn` is a bijection `Hᵖ(M; ℤ) → H_q(M; ℤ)` whenever `p + q = n`. Integral
cohomology is the pinned `TopCat.integralCohomology` (chains with coefficients in `ULift ℤ`,
cochains with values in `ℤ`), and the cap product is the pinned `TopCat.singularCap` along the
pinned diagonal `TauCeti.integralCoeffComul` of the chain coefficients and the action of `ℤ` on
`ULift ℤ`, so the sign convention is the pinned Alexander–Whitney one. Compactness is needed: for
`M = ℝ` the cohomology `H⁰` is `ℤ` while `H₁` vanishes. -/
theorem bijective_singularCap_fundamentalClass
    {M E : Type} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] [ChartedSpace E M]
    {n : ℕ} (o : TauCeti.HomologicalOrientation M E n) (hn : Module.finrank ℝ E = n)
    (p q : ℕ) (h : p + q = n) :
    Function.Bijective fun c : (TopCat.of M).integralCohomology p =>
      ((TopCat.of M).singularCap ℤ TauCeti.integralCoeffComul
        (λ_ (ModuleCat.of ℤ (ULift.{0} ℤ))).hom p q n h c).hom (o.fundamentalClass hn) := by
  sorry

/-! ## Stage 7: the Euler characteristic of a fibre bundle -/

/-- **Multiplicativity of the Euler characteristic in a fibre bundle** (Stage 7.2): for a fibre
bundle with fibre `F` over `B`, with `B`, `F` and the total space of finite CW type, the pinned
Euler characteristic of the total space is the product of those of the base and of the fibre.
The route is the homological Serre spectral sequence of Stage 5.5 with field coefficients, with
the monodromy local system kept: the Euler characteristic of a finite complex with coefficients in
a local system of rank `r` is `r` times its Euler characteristic. The Hopf fibration
`S¹ → S³ → S²` gives `0 = 2 · 0`; no trivial-monodromy hypothesis is made. -/
theorem eulerChar_totalSpace (B F : Type u) (E : B → Type u) [TopologicalSpace B]
    [TopologicalSpace F] [∀ b, TopologicalSpace (E b)] [TopologicalSpace (Bundle.TotalSpace F E)]
    [FiberBundle F E] [TauCeti.FiniteCWType B] [TauCeti.FiniteCWType F]
    [TauCeti.FiniteCWType (Bundle.TotalSpace F E)] :
    TauCeti.eulerChar (Bundle.TotalSpace F E) = TauCeti.eulerChar B * TauCeti.eulerChar F := by
  sorry

/-! ## Stage 6.2 supplement: the cup-length bound for the Lusternik–Schnirelmann category -/

/-- A nonzero product of `r` positive-degree classes of the singular cohomology ring of `X` with
coefficients in `R`, built with the pinned cup product `TopCat.singularCup` along the unitors of
`R`; the proposition records the number `r` of factors and the class. -/
inductive LSPositiveCupProduct (X : TopCat.{u}) (R : Type u) [CommRing R] :
    ℕ → (Σ d : ℕ, X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) d) → Prop where
  | single (d : ℕ) (hd : 0 < d) (a : X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) d) :
      LSPositiveCupProduct X R 1 ⟨d, a⟩
  | mul {r p q : ℕ} (a : X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) p)
      (b : X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) q)
      (ha : LSPositiveCupProduct X R r ⟨p, a⟩) (hq : 0 < q) :
      LSPositiveCupProduct X R (r + 1)
        ⟨p + q, X.singularCup R (λ_ (ModuleCat.of R R)).inv (λ_ (ModuleCat.of R R)).hom p q
          (p + q) rfl a b⟩

/-- The cup length of `X` over `R`: the supremum in `ℕ∞` of the numbers of factors of nonzero
products of positive-degree classes, `0` when every positive-degree class vanishes. -/
def lsCupLength (X : TopCat.{u}) (R : Type u) [CommRing R] : ℕ∞ :=
  sSup {m : ℕ∞ | ∃ r : ℕ, m = (r : ℕ∞) ∧
    ∃ d : ℕ, ∃ a : X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) d,
      a ≠ 0 ∧ LSPositiveCupProduct X R r ⟨d, a⟩}

/-- **The cup-length lower bound** (the categorical-cover supplement of Stage 6.2): on a nonempty
space, the cup length plus one is at most the pinned unnormalized Lusternik–Schnirelmann count
`TauCeti.lsCategoryCount X Set.univ`. A class restricts to zero on a categorical open by homotopy
invariance and the vanishing of positive-degree cohomology of a point, so a product of `r`
positive-degree classes lifts to `H^*(X, U₁ ∪ ⋯ ∪ U_r; R)`, which vanishes when the `r` opens
cover `X`. On the torus `S¹ × S¹` with `R = ℤ` the bound reads `2 + 1 ≤ 3`. -/
theorem lsCupLength_add_one_le_lsCategoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ := by
  sorry

/-! ## Stage 8.4: the relative Hurewicz isomorphism for a simply connected subspace -/

/-- **The relative Hurewicz theorem** (Stage 8.4; Hatcher, Theorem 4.37): for a subspace `B` of
`Y` with `b ∈ B`, if every point of `Y` is joined by a path to `B`, `B` is simply connected and
the relative homotopy sets `π_{k+1}(Y, B, b)` vanish for `k + 1 < n + 2`, then the pinned
relative Hurewicz homomorphism `π_{n+2}(Y, B, b) → H_{n+2}(Y, B; ℤ)` is bijective. The pinned
`TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` proves this when `B`
and `Y` are both `(n + 1)`-connected; the headline needs only `π₁(B) = 0` beyond the connectivity
of the pair. Simple connectivity of `B` cannot be dropped: for `Y = S¹ ∨ S²`, `B = S¹` and
`n = 0` the pair is `1`-connected, but `π₂(Y, B) ≅ π₂(S¹ ∨ S²) ≅ ℤ[t, t⁻¹]` (the second homotopy
group of the universal cover, a line with a sphere at each integer), `H₂(Y, B; ℤ) ≅ ℤ`, and the
Hurewicz map is the augmentation, which is not injective. -/
theorem bijective_relativeHurewicz_of_simplyConnected {Y : TopCat.{0}} {B : Set Y} (b : B)
    (n : ℕ) (h₀ : ∀ y : Y, ∃ a ∈ B, Joined y a)
    (hB : ∀ k < 2, Subsingleton (HomotopyGroup (Fin k) B b))
    (h : ∀ k : ℕ, k + 1 < n + 2 →
      Subsingleton (TauCeti.RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)) :
    Function.Bijective
      (TauCeti.RelHomotopyGroup.hurewiczIntHom ⟨TopPair.ofSubset B, b⟩ n) := by
  sorry

/-! ## Stage 8.5: homological Whitehead -/

/-- **Homological Whitehead** (Stage 8.5; Hatcher, Corollary 4.33): a map between simply
connected spaces inducing isomorphisms on integral singular homology in every degree is a weak
homotopy equivalence. For spaces of CW type the pinned Whitehead theorem
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` then makes it the forward map of a
homotopy equivalence. The route is the mapping cylinder and the relative Hurewicz theorem of
Stage 8.4 applied to the pair `(M_f, X)`, whose subspace `X` is simply connected. Simple
connectivity cannot be dropped: collapsing the complement of an open ball in the Poincaré
homology sphere `P` gives a degree-one map `P → S³`, an isomorphism on integral homology in every
degree, which is not a weak equivalence since `π₁(P)` is the binary icosahedral group of order
`120`; Hatcher, Example 4.35, gives an inclusion `S¹ ↪ (S¹ ∨ Sⁿ) ∪ eⁿ⁺¹` with the same
property. -/
theorem isWeakHomotopyEquivalence_of_isIso_singularHomologyMap
    {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y] (f : C(X, Y))
    (_hf : ∀ n : ℕ,
      IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ ℤ)).map (TopCat.ofHom f))) :
    f.IsWeakHomotopyEquivalence := by
  sorry

/-! ## Stage 8.7: finite CW type of compact smooth manifolds -/

/-- **Compact smooth manifolds have finite CW type** (Stage 8.7, boundaryless case): a compact
Hausdorff smooth manifold modelled on `EuclideanSpace ℝ (Fin n)` is homotopy equivalent to a
finite CW complex, through GeometricTopology's smooth triangulation and the pinned
`TauCeti.IsTriangulable.finiteCWType`. -/
theorem finiteCWType_of_compactSpace_of_isManifold (n : ℕ) (M : Type u) [TopologicalSpace M]
    [T2Space M] [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (𝓡 n) ∞ M] : TauCeti.FiniteCWType M := by
  sorry

/-- **Compact smooth manifolds with boundary have finite CW type** (Stage 8.7, half-space model):
the same statement for a compact Hausdorff smooth manifold with boundary modelled on
`EuclideanHalfSpace n`. -/
theorem finiteCWType_of_compactSpace_of_isManifold_halfSpace (n : ℕ) [NeZero n] (M : Type u)
    [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace (EuclideanHalfSpace n) M]
    [IsManifold (𝓡∂ n) ∞ M] : TauCeti.FiniteCWType M := by
  sorry

/-! ## Stage 8.8c: Eilenberg–MacLane spaces -/

/-- A CW Eilenberg–MacLane space `K(A, n)` for an abelian group `A` and `n ≥ 1`: a path-connected
Hausdorff CW complex with a chosen identification of `πₙ` with `A` and all other positive homotopy
groups trivial. The models of Stage 8.8c, and the inputs of representability (Stage 8.10), are of
this form. -/
structure OrdinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] where
  /-- The underlying space. -/
  space : TopCat.{u}
  /-- The base point. -/
  point : space
  /-- The space is Hausdorff. -/
  hausdorff : T2Space space
  /-- The space is a CW complex. -/
  cw : CWComplex (Set.univ : Set space)
  /-- The space is path-connected. -/
  connected : PathConnectedSpace space
  /-- The chosen identification of `πₙ` with `A`. -/
  homotopyIdentification : HomotopyGroup (Fin n) space point ≃* Multiplicative A
  /-- Every other positive homotopy group vanishes. -/
  vanishing : ∀ j : ℕ, 0 < j → j ≠ n → Subsingleton (HomotopyGroup (Fin j) space point)

/-- A coefficient-functorial family of Eilenberg–MacLane models: a model `K(A, n)` for every
abelian group `A` and `n ≥ 1`, with pointed maps induced by homomorphisms, functorial, and
inducing the given homomorphism on `πₙ` through the chosen identifications. -/
structure NormalizedAbelianEMFamily where
  /-- The model for each abelian group and degree. -/
  model : ∀ (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n], OrdinaryEMModel A n
  /-- The map induced by a homomorphism of coefficients. -/
  map : ∀ {A A' : AddCommGrpCat.{u}} (_f : A ⟶ A') (n : ℕ) [NeZero n],
    (model A n).space ⟶ (model A' n).space
  /-- The induced maps are pointed. -/
  map_point : ∀ {A A' : AddCommGrpCat.{u}} (f : A ⟶ A') (n : ℕ) [NeZero n],
    map f n (model A n).point = (model A' n).point
  /-- The identity induces the identity. -/
  map_id : ∀ (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n], map (𝟙 A) n = 𝟙 _
  /-- Composition is respected. -/
  map_comp : ∀ {A A' A'' : AddCommGrpCat.{u}} (f : A ⟶ A') (g : A' ⟶ A'')
    (n : ℕ) [NeZero n], map (f ≫ g) n = map f n ≫ map g n
  /-- Under the chosen identifications the induced map on `πₙ` is the given homomorphism. -/
  normalized_naturality : ∀ {A A' : AddCommGrpCat.{u}} (f : A ⟶ A') (n : ℕ) [NeZero n]
    (p : HomotopyGroup (Fin n) (model A n).space (model A n).point),
    (model A' n).homotopyIdentification
      (HomotopyGroup.map (map f n).hom (map_point f n) p) =
      Multiplicative.ofAdd (f.hom (Multiplicative.toAdd ((model A n).homotopyIdentification p)))

/-- **The coefficient-functorial family of Eilenberg–MacLane models** (Stage 8.8c; for the
existence of each model, Hatcher's construction of `K(G, n)` in Section 4.2 from Corollary 1.28,
Example 4.29 and Example 4.16): there is a family of models, a
`K(A, n)` of the form above for every abelian group `A` and `n ≥ 1`, natural in the coefficient
group and inducing the given homomorphisms on `πₙ`. The roadmap's family takes the bar model in
degree one and the realizations of the Dold–Kan simplicial abelian groups in higher degrees. -/
theorem nonempty_normalizedAbelianEMFamily : Nonempty NormalizedAbelianEMFamily.{u} := by
  sorry

/-- The simplicial set underlying the Dold–Kan simplicial abelian group `Γ(A[n])` of the chain
complex concentrated in degree `n` with value `A`. -/
abbrev ordinaryDoldKanSimplicialModel (A : AddCommGrpCat.{u}) (n : ℕ) : SSet.{u} :=
  (CategoryTheory.Abelian.DoldKan.Γ.obj
    ((HomologicalComplex.single AddCommGrpCat (ComplexShape.down ℕ) n).obj A)) ⋙
      forget AddCommGrpCat

/-- The realized zero vertex of the Dold–Kan model, its base point. -/
def ordinaryDoldKanBasepoint (A : AddCommGrpCat.{u}) (n : ℕ) :
    SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n) :=
  SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj (SimplexCategory.mk 0))
    (0 : (ordinaryDoldKanSimplicialModel A n).obj (Opposite.op (SimplexCategory.mk 0))))
      ((SSet.toTopSimplex.app (SimplexCategory.mk 0)).inv
        (default : SimplexCategory.toTop.obj (SimplexCategory.mk 0)))

/-- **The Dold–Kan realization is a `K(A, n + 2)`** (Stage 8.8c): the geometric realization of
`Γ(A[n + 2])`, based at its zero vertex, is homeomorphic through a based homeomorphism to a CW
Eilenberg–MacLane model. The route is Stage 8.2's Kan comparison for simplicial groups and the
realization-unit theorem, with the degree-`(n + 2)` homotopy group read off the Moore complex
through the pinned Dold–Kan counit, and Stage 4.7's CW structure on realizations. -/
theorem exists_ordinaryEMModel_iso_doldKanRealization (A : AddCommGrpCat.{u}) (n : ℕ) :
    ∃ (K : OrdinaryEMModel A (n + 2))
      (e : K.space ≅ SSet.toTop.obj (ordinaryDoldKanSimplicialModel A (n + 2))),
      e.hom K.point = ordinaryDoldKanBasepoint A (n + 2) := by
  sorry

/-! ## Stage 8.8d: Hurewicz modulo a Serre class -/

/-- The Hurewicz homomorphism with integer coefficients `π_{n+1}(X, x) → H_{n+1}(X; ℤ)`, the
pinned `HomotopyGroup.hurewiczHom` evaluated at `1 : ℤ`. -/
def hurewiczInt (X : Type) [TopologicalSpace X] (x : X) (n : ℕ) :
    Additive (HomotopyGroup (Fin (n + 1)) X x) →+
      ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) (n + 1)).obj
        (ModuleCat.of ℤ ℤ)).obj (TopCat.of X) where
  toFun a := (HomotopyGroup.hurewiczHom (ModuleCat.of ℤ ℤ) n a).hom 1
  map_zero' := by simp
  map_add' a b := by simp

/-- A homomorphism of abelian groups is a `C`-isomorphism when its kernel and its cokernel belong
to the class `C` (Serre). -/
def IsSerreIso (C : ObjectProperty AddCommGrpCat.{0}) {A B : Type} [AddCommGroup A]
    [AddCommGroup B] (f : A →+ B) : Prop :=
  C (AddCommGrpCat.of f.ker) ∧ C (AddCommGrpCat.of (B ⧸ f.range))

/-- A homomorphism of abelian groups is a `C`-epimorphism when its cokernel belongs to `C`. -/
def IsSerreEpi (C : ObjectProperty AddCommGrpCat.{0}) {A B : Type} [AddCommGroup A]
    [AddCommGroup B] (f : A →+ B) : Prop :=
  C (AddCommGrpCat.of (B ⧸ f.range))

/-- **Hurewicz modulo the torsion class** (Stage 8.8d; Serre 1953, Theorem 1): for a
simply connected space `X` whose homotopy groups `π_i(X)` are torsion for `2 ≤ i < n + 2`, the
integral homology `H_i(X; ℤ)` is torsion for `0 < i < n + 2`, the Hurewicz homomorphism in degree
`n + 2` is a torsion-isomorphism and the one in degree `n + 3` is a torsion-epimorphism. For
`n = 0` the hypothesis is empty and the statement is the integral Hurewicz theorem with its
surjectivity in degree three. -/
theorem hurewicz_mod_isTorsion (X : Type) [TopologicalSpace X] (x : X)
    [SimplyConnectedSpace X] (n : ℕ)
    (_hπ : ∀ j : ℕ, j + 2 < n + 2 →
      AddCommGrpCat.isTorsion.{0} (AddCommGrpCat.of (Additive (HomotopyGroup (Fin (j + 2)) X x)))) :
    (∀ i : ℕ, 0 < i → i < n + 2 →
      AddCommGrpCat.isTorsion.{0} (AddCommGrpCat.of
        (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) i).obj
          (ModuleCat.of ℤ ℤ)).obj (TopCat.of X)))) ∧
    IsSerreIso AddCommGrpCat.isTorsion.{0} (hurewiczInt X x (n + 1)) ∧
    IsSerreEpi AddCommGrpCat.isTorsion.{0} (hurewiczInt X x (n + 2)) := by
  sorry

/-- **Hurewicz modulo the class of groups annihilated by a power of `d`** (Stage 8.8d; Serre
1953, Theorem 1, for the class `isKilledBySomePower d`): the same statement for the
pinned Serre class of abelian groups annihilated by some power of `d ≥ 1`. The route differs from
the torsion class at the `K(A, 1)` axiom, which uses Prüfer's decomposition of a bounded abelian
group and the Künneth theorem on finite sums rather than transfer alone. -/
theorem hurewicz_mod_isKilledBySomePower (d : ℕ) (_hd : 0 < d) (X : Type) [TopologicalSpace X]
    (x : X) [SimplyConnectedSpace X] (n : ℕ)
    (_hπ : ∀ j : ℕ, j + 2 < n + 2 →
      (AddCommGrpCat.isKilledBySomePower.{0} d)
        (AddCommGrpCat.of (Additive (HomotopyGroup (Fin (j + 2)) X x)))) :
    (∀ i : ℕ, 0 < i → i < n + 2 →
      (AddCommGrpCat.isKilledBySomePower.{0} d) (AddCommGrpCat.of
        (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) i).obj
          (ModuleCat.of ℤ ℤ)).obj (TopCat.of X)))) ∧
    IsSerreIso (AddCommGrpCat.isKilledBySomePower.{0} d) (hurewiczInt X x (n + 1)) ∧
    IsSerreEpi (AddCommGrpCat.isKilledBySomePower.{0} d) (hurewiczInt X x (n + 2)) := by
  sorry

/-! ## Stage 8.10: ordinary cohomology representability -/

/-- Homotopy classes of continuous maps, for Mathlib's homotopy relation. -/
def continuousHomotopySetoid (X Y : TopCat.{u}) : Setoid C(X, Y) where
  r := ContinuousMap.Homotopic
  iseqv := ContinuousMap.Homotopic.equivalence

/-- The set of homotopy classes of continuous maps `X → Y`. -/
abbrev continuousHomotopyClasses (X Y : TopCat.{u}) :=
  Quotient (continuousHomotopySetoid X Y)

/-- Pulling back a fixed class `ι ∈ Hⁿ(K; A)` along maps `X → K`, descended to homotopy classes
by the pinned homotopy invariance of singular cohomology. -/
def ordinaryEMPullback (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n]
    (K : OrdinaryEMModel A n) (X : TopCat.{u})
    (ι : K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n) :
    continuousHomotopyClasses X K.space →
      X.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n :=
  Quotient.lift (fun f => TopCat.singularCohomologyMap (TopCat.ofHom f) n ι) (by
    intro f g h
    obtain ⟨H⟩ := h
    have heq := TopCat.Homotopy.congr_singularCohomologyMap
      (f := TopCat.ofHom f) (g := TopCat.ofHom g) H
      (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n
    exact congrArg (fun q => q.hom ι) heq)

/-- **Ordinary cohomology representability** (Stage 8.10; Hatcher, Theorem 4.57): on a CW
Eilenberg–MacLane model `K` of type `(A, m + 1)` there is a universal class
`ι ∈ H^{m+1}(K; A)`, normalized so that its Kronecker evaluation on the Hurewicz image of a
class `p ∈ π_{m+1}(K)` is the chosen identification of `p` in `A`, such that pulling `ι` back is a
bijection from homotopy classes of maps `X → K` to `H^{m+1}(X; A)` for every Hausdorff CW complex
`X`, of arbitrary dimension and with any number of components. The normalization determines `ι`:
in degree `m + 1 ≥ 1` the Kronecker map `H^{m+1}(K; A) → Hom(H_{m+1}(K; ℤ), A)` is bijective,
since `H_m(K; ℤ)` is free, and the Hurewicz map is onto `H_{m+1}(K; ℤ)`. No finite-CW hypothesis
is made, so no phantom-map issue is suppressed. -/
theorem exists_universalClass_ordinaryEMPullback_bijective (A : Type u) [AddCommGroup A]
    (m : ℕ) (K : OrdinaryEMModel A (m + 1)) :
    ∃ ι : K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) (m + 1),
      (∀ p : HomotopyGroup (Fin (m + 1)) K.space K.point,
        (K.space.singularKronecker ℤ (m + 1) ι).hom
          ((HomotopyGroup.hurewiczHom (ModuleCat.of ℤ (ULift.{u} ℤ)) m
            (Additive.ofMul p)).hom (ULift.up 1)) =
          Multiplicative.toAdd (K.homotopyIdentification p)) ∧
      ∀ (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)],
        Function.Bijective (ordinaryEMPullback A (m + 1) K X ι) := by
  sorry

/-! ## Stage 8.11b: the ordinary Eilenberg–MacLane loop comparison -/

/-- **The loop comparison** (Stage 8.11b): for CW Eilenberg–MacLane models `K` of type
`(A, m + 1)` and `K'` of type `(A, m + 2)` there is a pointed map `f` from `K` to Mathlib's loop
space `Ω K'`, based at the constant loop, which is a weak homotopy equivalence and induces the
identity of `A` through the chosen identifications and the pinned shift
`HomotopyGroup.pathLoopSpaceMulEquiv : π_{m+1}(Ω K') ≃* π_{m+2}(K')`. The loop space of `K'` is
path-connected since `π₁(K') = 0`, and its homotopy groups at the constant loop are those of `K'`
shifted down by one, so it is a `K(A, m + 1)` of the homotopy type of a CW complex by Milnor's
theorem; the map is built on a presentation model by Hatcher, Lemma 4.31, and transported to `K`
by Whitehead's theorem. Two pointed maps with the same effect on `π_{m+1}` are pointed homotopic,
so the comparison is natural in `A` up to pointed homotopy. -/
theorem exists_ordinaryEMModel_loopComparison (A : Type u) [AddCommGroup A] (m : ℕ)
    (K : OrdinaryEMModel A (m + 1)) (K' : OrdinaryEMModel A (m + 2)) :
    ∃ (f : C(K.space, LoopSpace K'.space K'.point)) (hf : f K.point = Path.refl K'.point),
      f.IsWeakHomotopyEquivalence ∧
      ∀ p : HomotopyGroup (Fin (m + 1)) K.space K.point,
        K'.homotopyIdentification
            (HomotopyGroup.pathLoopSpaceMulEquiv m (HomotopyGroup.map f hf p)) =
          K.homotopyIdentification p := by
  sorry

end

end TauCetiRoadmap.AlgebraicTopology
