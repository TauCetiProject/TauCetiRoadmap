module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
public import TauCeti.AlgebraicTopology.Cohomology.Kronecker
public import TauCeti.AlgebraicTopology.Cohomology.HomotopyInvariance
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Twisted.Relative
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.Cellular.Comparison
public import TauCeti.AlgebraicTopology.Cellular.Coproduct
public import TauCeti.AlgebraicTopology.FundamentalGroupoid.Cech.Colimit
public import TauCeti.AlgebraicTopology.Singular.Excision
public import TauCeti.AlgebraicTopology.Singular.MayerVietoris.Basic
public import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
public import TauCeti.AlgebraicTopology.Singular.Sphere
public import TauCeti.AlgebraicTopology.Singular.DiskSphere
public import TauCeti.AlgebraicTopology.Singular.EilenbergZilber
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.Singular
public import TauCeti.Topology.Homotopy.HomotopyGroup.Map
public import TauCeti.Topology.Homotopy.HomotopyGroup.Product
public import TauCeti.Topology.Homotopy.Extension.CWComplex
public import TauCeti.Topology.Homotopy.Extension.DeformationRetract
public import TauCeti.Topology.Homotopy.Extension.MappingCylinder

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that are statable on native carriers, each with
`sorry`, together with the simple definitions they need: the compact-support theorem for
locally represented top sections (Stage 6.3) and Poincaré duality with `ℤ/2` coefficients
(Stage 6.4), the cellular connectivity range (Stage 8.1), finite CW type of compact manifolds and
homotopy invariance of the cellular Euler characteristic (Stages 7 and 8.7), Hurewicz in degree
one and in higher degrees (Stage 8.3), Whitehead and homological Whitehead (Stage 8.5), the
`lim¹` vanishing of surjective towers (Stage 6.0), the `K(π, 1)` property of the bar model
(Stage 8.8a), representability of `H^n(-; A)` by every `K(A, n)` model (Stage 8.10), the pair
quotient comparisons, relative CW pushouts and cofibration extensions (Stage 4.5), Brouwer
(Stage 2.7), proper homotopy rectification (Stage 8.5) and Lusternik–Schnirelmann category and
cup length (the categorical supplement after Stage 6.2).

Headline theorems not statable at the pins, and what each lacks:

* the Serre spectral sequence with its monodromy local system (Stage 5.5): the spectral sequence
  of a Serre fibration and its fibre-transport system are constructions of the roadmap;
* the transfer of a finite cover with `p_* ∘ transfer = d` and the deck-sum formula, and the
  Cartan–Leray spectral sequence of a regular cover (Stage 5.3): transfer is a chain map the
  roadmap builds, and the deck chain complex in `Rep R G` is its construction;
* the cellular–singular chain comparison in arbitrary dimension (Stage 4.2): the chain map is
  data built on the roadmap's cellular representatives;
* integral and twisted Poincaré–Lefschetz duality and the twisted relative fundamental class
  (Stages 6.3–6.4): the homological orientation local system is a construction of the roadmap;
* relative homotopy groups, their exact sequence and relative Hurewicz (Stages 8.1 and 8.4): the
  pinned libraries have no relative homotopy groups;
* the Hurewicz map itself and Hurewicz modulo a Serre class (Stages 8.3 and 8.8d): the map is
  built from the cube-to-sphere quotient and the sphere's reference class, and a
  `C`-isomorphism statement is a statement about that map;
* the relative obstruction class with local coefficients (Stage 8.9): the pinned libraries have
  no action of `π₁` on `π_n`, so the coefficient system of the obstruction cochain cannot be
  written;
* the functorial abelian family `K(A, n)` with its normalized identifications (Stage 8.8c) and
  the ordinary EM loop comparison and cohomology suspension (Stage 8.11): they are data.

The `#check` lines record native declarations that the stages consume.
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits
open scoped ContDiff Manifold Topology TensorProduct Simplicial

noncomputable section

#check HomotopyGroup.prodEquiv
#check HomotopyGroup.prodMulEquiv
#check TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction
#check TauCeti.MappingCylinder.homotopyEquiv
#check TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl

universe u v

abbrev SingularChains (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) : ChainComplex (ModuleCat.{u} R) ℕ :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).obj X

abbrev SingularHomology (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj M).obj X

/-! ## Existing anchors -/

/-- Relative topology uses Mathlib's category of embedded topological pairs. -/
example {X : TopCat} (A : Set X) : TopPair :=
  TopPair.ofSubset A

/-- Ordinary singular chains remain the absolute chain functor used by the relative theory. -/
noncomputable example (R : Type u) [CommRing R] :
    ModuleCat.{u} R ⥤ TopCat.{u} ⥤ ChainComplex (ModuleCat.{u} R) ℕ :=
  AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)

/-- Cellular chains are built from Mathlib's actual cells, not from a record of cell counts. -/
example {X : Type*} [TopologicalSpace X] (C : Set X) [CWComplex C] (n : ℕ) : Type _ :=
  Topology.CWComplex.cell C n

/-! ## Relative chains and homology -/

/-- The relative singular-chain functor. The implementation factors through `SSetPair`. -/
noncomputable abbrev relativeSingularChainComplex (R : Type*) [CommRing R] :
    ModuleCat.{u} R ⥤ TopPair.{u} ⥤ ChainComplex (ModuleCat.{u} R) ℕ :=
  TopPair.singularChainComplexFunctor (ModuleCat.{u} R)

/-- Relative singular homology, functorial in its coefficient module and in maps of pairs. -/
noncomputable def relativeSingularHomology (R : Type*) [CommRing R] (n : ℕ) :
    ModuleCat.{u} R ⥤ TopPair.{u} ⥤ ModuleCat.{u} R :=
  relativeSingularChainComplex R ⋙
    (Functor.whiskeringRight _ _ _).obj
      (HomologicalComplex.homologyFunctor (ModuleCat.{u} R) (ComplexShape.down ℕ) n)

/-- The native chain-level sequence retains the actual relative-chain quotient map. -/
noncomputable abbrev relativeChainShortComplex (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) :
    ShortComplex (ChainComplex (ModuleCat.{u} R) ℕ) :=
  X.singularChainComplexShortComplex M

/-- Exactness is already proved by the native relative-chain construction. -/
theorem relativeChainShortComplex_shortExact (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) :
    (relativeChainShortComplex R M X).ShortExact :=
  X.shortExact_singularChainComplexShortComplex M

/-! ## Groupoid van Kampen -/

/-- The native Čech diagram uses nonempty finite intersections in `Grpd`. -/
noncomputable abbrev cechFundamentalGroupoidDiagram {X : TopCat.{u}} {ι : Type u}
    (U : ι → TopologicalSpace.Opens X) :=
  TauCeti.FundamentalGroupoid.cechDiagram U

noncomputable abbrev cechFundamentalGroupoidCocone {X : TopCat.{u}} {ι : Type u}
    (U : ι → TopologicalSpace.Opens X) :=
  TauCeti.FundamentalGroupoid.cechCocone U

/-- Van Kampen is already implemented; further targets consume this colimit. -/
noncomputable def fundamentalGroupoid_openCover_isColimit {X : TopCat.{u}} {ι : Type u}
    (U : ι → TopologicalSpace.Opens X) (hU : TopologicalSpace.IsOpenCover U) :
    IsColimit (cechFundamentalGroupoidCocone U) :=
  TauCeti.FundamentalGroupoid.isColimitCechCocone (U := U) hU

/-! ## Excision and Mayer--Vietoris -/

/-- Native excision supplies the actual pair inclusion and its homology isomorphism. -/
example (R : Type u) [CommRing R] (N : ModuleCat.{u} R) {X : TopCat.{u}}
    (A Z : Set X) (h : closure Z ⊆ interior A) (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (TopPair.excisionMap Zᶜ A) N n) :=
  TopPair.isIso_singularHomologyMap_excisionMap_compl N A Z h n

/-- The native connecting morphism includes the small-chain comparison. -/
noncomputable abbrev mayerVietorisConnecting (R : Type u) [CommRing R]
    (N : ModuleCat.{u} R) {X : TopCat.{u}} (U V : Set X)
    (hU : IsOpen U) (hV : IsOpen V) (hUV : U ∪ V = Set.univ)
    (n m : ℕ) (h : m + 1 = n) :=
  TopCat.mayerVietorisδ N hU hV hUV n m h

/-! ## Cellular comparison -/

/-- The existing cellular carrier includes relative skeleta and triple differentials. -/
noncomputable abbrev cellularChainComplex (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)] :
    ChainComplex (ModuleCat.{u} R) ℕ :=
  TauCeti.cellularChainComplex (Set.univ : Set X) (ModuleCat.of R R)

/-- The finite-dimensional comparison is native, with exact module coproducts. -/
noncomputable example (R : Type u) [CommRing R] (X : Type u)
    [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)]
    [Topology.RelCWComplex.FiniteDimensional (Set.univ : Set X)] (n : ℕ) :
    (cellularChainComplex R X).homology n ≅
      (TauCeti.complexBasePair (Set.univ : Set X)).singularHomology (ModuleCat.of R R) n :=
  TauCeti.cellularSingularHomologyIso (Set.univ : Set X) (ModuleCat.of R R) n

/-! ## Finite covers and deck actions -/

/-- A finite cover of constant degree. General finite covers are handled componentwise. -/
structure FiniteCover (E B : TopCat.{u}) where
  p : E ⟶ B
  isCoveringMap : IsCoveringMap p
  degree : ℕ
  finite_fiber : ∀ b : B, Finite {e : E // p e = b}
  fiber_card : ∀ b : B, Nat.card {e : E // p e = b} = degree

/-- A surjective regular cover datum. Simple transitivity alone does not imply surjectivity. -/
structure RegularDeckAction {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] where
  pSurjective : Function.Surjective P.p
  deck : G →* Homeomorph E E
  commutes : ∀ g x, P.p (deck g x) = P.p x
  simplyTransitive : ∀ {x y : E}, P.p x = P.p y → ∃! g, deck g x = y

/-- Use the native action induced by the homeomorphism-valued homomorphism. -/
abbrev RegularDeckAction.mulAction {E B : TopCat.{u}} {P : FiniteCover E B}
    {G : Type u} [Group G] (D : RegularDeckAction P G) : MulAction G E :=
  MulAction.compHom E D.deck

/-- The native quotient-cover vocabulary includes the actual surjectivity proof. The action
on `E` is any action agreeing with the deck homomorphism, for example `D.mulAction`. -/
theorem RegularDeckAction.isQuotientCoveringMap {E B : TopCat.{u}}
    {P : FiniteCover E B} {G : Type u} [Group G] [MulAction G E] (D : RegularDeckAction P G)
    (hD : ∀ (g : G) (x : E), g • x = D.deck g x) :
    IsQuotientCoveringMap P.p G := by
  sorry

/-- The left deck action on the actual constant-coefficient singular complex. -/
noncomputable abbrev regularDeckChainMap (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) (g : G) :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map
    (TopCat.ofHom ⟨D.deck g, (D.deck g).continuous_toFun⟩)

/-- The coefficient action is g ↦ (D.deck g)_*, with no extra inversion. -/
noncomputable def coverHomologyAction (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) (q : ℕ) :
    Representation R G ((SingularChains R M E).homology q) where
  toFun g := ((HomologicalComplex.homologyFunctor (ModuleCat.{u} R)
    (ComplexShape.down ℕ) q).map (regularDeckChainMap R M P G D g)).hom
  map_one' := by
    have hdeck : (TopCat.ofHom ⟨D.deck (1 : G), (D.deck (1 : G)).continuous_toFun⟩ :
        E ⟶ E) = 𝟙 E := by
      ext x
      simp
    simp only [regularDeckChainMap, hdeck, CategoryTheory.Functor.map_id,
      ModuleCat.hom_id]
    rfl
  map_mul' g h := by
    have hdeck : (TopCat.ofHom ⟨D.deck (g * h), (D.deck (g * h)).continuous_toFun⟩ :
        E ⟶ E) =
        TopCat.ofHom ⟨D.deck h, (D.deck h).continuous_toFun⟩ ≫
          TopCat.ofHom ⟨D.deck g, (D.deck g).continuous_toFun⟩ := by
      ext x
      simp
    simp only [regularDeckChainMap, hdeck, CategoryTheory.Functor.map_comp, ModuleCat.hom_comp]
    rfl

/-- A transparent native Rep, replacing the former private GroupModule wrapper. -/
noncomputable abbrev coverHomologyRep (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) (q : ℕ) : Rep.{u} R G :=
  Rep.of (coverHomologyAction R M P G D q)

/-- The native Alexander–Whitney/shuffle equivalence supplies the constant-coefficient
product maps; local coefficients and Kunneth are extensions of this interface. -/
noncomputable abbrev nativeEilenbergZilber (R : Type u) [CommRing R]
    (X Y : TopCat.{u}) :=
  TopCat.eilenbergZilberHomotopyEquiv X Y (ModuleCat.of R R) (ModuleCat.of R R)

/-! ## Local coefficients, cap products, and duality -/

abbrev LocalCoefficientSystem (R : Type u) [CommRing R] (X : TopCat.{u}) :=
  TauCeti.LocalCoefficientSystem.{u, u, u} R X

noncomputable abbrev twistedSingularChainComplex (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) :
    ChainComplex (ModuleCat.{u} R) ℕ := L.twistedChainComplex

/-- Native Hom-of-twisted-chains cochains compute the dual-system convention. -/
noncomputable abbrev dualSystemRelativeCochainComplex (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) :
    CochainComplex (ModuleCat.{u} R) ℕ :=
  P.twistedCochainComplex L R (ModuleCat.of R R)

noncomputable abbrev singularCohomology (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) n

/-- Cap product with the Alexander--Whitney sign convention.  With natural-number grading the
complementary-degree hypothesis prevents truncated subtraction from pretending that a negative
target degree is degree zero. -/
noncomputable def capProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ)
    (hpq : p ≤ q) :
    singularCohomology R X p ⟶
      ModuleCat.of R (SingularHomology R (ModuleCat.of R R) X q →ₗ[R]
        SingularHomology R (ModuleCat.of R R) X (q - p)) :=
  ModuleCat.ofHom ((ModuleCat.homLinearEquiv (S := R)).toLinearMap.comp
    (X.singularCap R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom
      p (q - p) q (Nat.add_sub_of_le hpq)))

/-- Native cup product with the same Alexander–Whitney pairing and degree pin. -/
noncomputable def cupProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ) :
    singularCohomology R X p →ₗ[R] singularCohomology R X q →ₗ[R]
      singularCohomology R X (p + q) :=
  X.singularCup R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
    (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q (p + q) rfl

/-- The pair `(X, X \ {x})` used to define local homology. -/
noncomputable def puncturedPair (X : TopCat.{u}) (x : X) : TopPair.{u} :=
  TopPair.ofSubset ({x}ᶜ : Set X)

/-- Relative twisted chains use the coefficient system on the ambient space.
Coefficients are at the first vertex; the zeroth face transports along its first edge. -/
noncomputable abbrev twistedRelativeSingularChainComplex (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) :
    ChainComplex (ModuleCat.{u} R) ℕ := P.twistedChainComplex L

noncomputable abbrev twistedRelativeHomology (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ) : ModuleCat.{u} R :=
  (twistedRelativeSingularChainComplex R P L).homology n

/-- Forget the coefficient ring through the native exact restriction-of-scalars functor. -/
noncomputable abbrev restrictCoefficientSystem (R : Type) [CommRing R] (X : TopCat)
    (L : LocalCoefficientSystem R X) : LocalCoefficientSystem ℤ X :=
  L ⋙ ModuleCat.restrictScalars (Int.castRingHom R)

/-- Actual inclusion from a pair to the pair punctured at a point outside its subspace. -/
noncomputable def relativeLocalPairMap (P : TopPair.{u}) (x : P.fst)
    (hx : x ∉ Set.range (P.map : P.snd → P.fst)) : P ⟶ puncturedPair P.fst x :=
  TopPair.ofHom (𝟙 P.fst)
    (TopCat.ofHom ⟨fun a => ⟨P.map a, by
      change P.map a ≠ x
      intro h
      exact hx ⟨a, h⟩⟩,
      P.map.hom.continuous.subtype_mk _⟩)

/-- The local image is native homology functoriality, with the identity-pullback comparison. -/
noncomputable def twistedRelativeLocalMap (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ) (x : P.fst)
    (hx : x ∉ Set.range (P.map : P.snd → P.fst)) :
    twistedRelativeHomology R P L n ⟶
      twistedRelativeHomology R (puncturedPair P.fst x) L n :=
  P.twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso P.fst).app L).inv n ≫
    TopPair.twistedHomologyMap (relativeLocalPairMap P x hx) L n

/-- A relative class with specified local normalization. AT6.3 constructs the canonical
local generators for the orientation system; no arbitrary pair receives an existence theorem. -/
structure RelativeTwistedClassDatum (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ)
    (localGenerator : ∀ x : P.fst, x ∉ Set.range (P.map : P.snd → P.fst) →
      twistedRelativeHomology R (puncturedPair P.fst x) L n) where
  fundamentalClass : twistedRelativeHomology R P L n
  local_eq : ∀ x hx, twistedRelativeLocalMap R P L n x hx fundamentalClass =
    localGenerator x hx

/-- The interior set and its openness are native Mathlib declarations. -/
example (m : ℕ) {H M : Type} [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin m)) H)
    [ChartedSpace H M] [IsManifold I ∞ M] : IsOpen (I.interior M) :=
  I.isOpen_interior (M := M) (n := ∞) (by simp)

/-- Actual pair inclusion from support on B to support at x∈B. -/
noncomputable def supportLocalPairMap (X : TopCat.{u}) (B : Set X) (x : X) (hx : x ∈ B) :
    TopPair.ofSubset Bᶜ ⟶ puncturedPair X x :=
  TopPair.ofHom (𝟙 X)
    (TopCat.ofHom ⟨fun y => ⟨y.val, fun h => y.prop (h.symm ▸ hx)⟩,
      continuous_subtype_val.subtype_mk _⟩)

/-- The supported class maps locally by native pair functoriality. -/
noncomputable def twistedSupportLocalMap (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ)
    (B : Set X) (x : X) (hx : x ∈ B) :
    twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n ⟶
      twistedRelativeHomology R (puncturedPair X x) L n :=
  (TopPair.ofSubset Bᶜ).twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso X).app L).inv n ≫
    TopPair.twistedHomologyMap (supportLocalPairMap X B x hx) L n

/-- The ball-local section condition has content in the functor encoding: local point
classes must be induced by one supported relative class on each neighborhood. On a manifold
these open neighborhoods may be refined to coordinate balls. -/
structure LocallyRepresentedTopSection (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ) (V : Set X) where
  localValue : ∀ x : X, x ∈ V →
    twistedRelativeHomology R (puncturedPair X x) L n
  locally_represented : ∀ x : X, x ∈ V →
    ∃ B : Set X, ∃ hBV : B ⊆ V, IsOpen B ∧ x ∈ B ∧
      ∃ c : twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n,
        ∀ y : X, ∀ hy : y ∈ B,
          twistedSupportLocalMap R X L n B y hy c = localValue y (hBV hy)

/-- Actual pair inclusion induced by an embedding at a puncture. -/
noncomputable def embeddingLocalPairMap {U M : TopCat} (f : U ⟶ M)
    (hf : Function.Injective f) (x : U) : puncturedPair U x ⟶ puncturedPair M (f x) :=
  TopPair.ofSubsetMap (B := ({x}ᶜ : Set U)) (B' := ({f x}ᶜ : Set M)) f
    (fun _ hy h => hy (hf h))

/-- Integral local excision map for an open embedding, with the native constant pullback. -/
noncomputable def embeddingIntegralLocalMap {U M : TopCat} (f : U ⟶ M)
    (hf : Function.Injective f) (x : U) (n : ℕ) :
    twistedRelativeHomology ℤ (puncturedPair U x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor U).obj (ModuleCat.of ℤ ℤ)) n ⟶
    twistedRelativeHomology ℤ (puncturedPair M (f x))
      ((TauCeti.LocalCoefficientSystem.constantFunctor M).obj (ModuleCat.of ℤ ℤ)) n :=
  (puncturedPair U x).twistedHomologyCoefficientMap
    (TauCeti.LocalCoefficientSystem.pullbackConstantIso f.hom (ModuleCat.of ℤ ℤ)).inv n ≫
    TopPair.twistedHomologyMap (embeddingLocalPairMap f hf x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor M).obj (ModuleCat.of ℤ ℤ)) n

/-- Twisted homology supported in `K`: the relative group of the pair `(X, X \ K)`. -/
noncomputable abbrev supportedTwistedHomology (R : Type u) [CommRing R] (X : TopCat.{u})
    (L : LocalCoefficientSystem R X) (n : ℕ) (K : Set X) : ModuleCat.{u} R :=
  twistedRelativeHomology R (TopPair.ofSubset Kᶜ) L n

/-- Existence half of the compact-support theorem of Stage 6.3: a locally represented top
section on an open `V` is the family of local images of one class supported in a compact
`K ⊆ V`. -/
theorem compactSupportTopClass_exists (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K V : Set (TopCat.of M))
    (hK : IsCompact K) (hV : IsOpen V) (hKV : K ⊆ V)
    (s : LocallyRepresentedTopSection R (TopCat.of M) L m V) :
    ∃ c : supportedTwistedHomology R (TopCat.of M) L m K,
      ∀ x : TopCat.of M, ∀ hx : x ∈ K,
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c = s.localValue x (hKV hx) := by
  sorry

/-- Uniqueness half: in the top degree a class supported in a compact `K` is determined by its
local images at the points of `K`. -/
theorem compactSupportTopClass_unique (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K : Set (TopCat.of M)) (hK : IsCompact K)
    (c c' : supportedTwistedHomology R (TopCat.of M) L m K)
    (h : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap R (TopCat.of M) L m K x hx c =
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c') :
    c = c' := by
  sorry

/-- Local orientation data: a global class whose image generates every local top homology
module. The maps are induced by `(X, ∅) ⟶ (X, X \ {x})`. -/
structure FundamentalClassDatum (R : Type u) [CommRing R] (X : TopCat.{u}) (n : ℕ) where
  fundamentalClass : ((relativeSingularHomology R n).obj (ModuleCat.of R R)).obj
    (TopPair.incl.obj X)
  spans : ∀ x : X,
    Submodule.span R
      {((relativeSingularHomology R n).obj (ModuleCat.of R R)).map
        (TopPair.j (puncturedPair X x)) fundamentalClass} = ⊤

/-- Stage 6.4 with `ℤ/2` coefficients, where every manifold is orientable: a closed
topological `n`-manifold has a class `c ∈ H_n(M; ℤ/2)` such that capping with `c` is an
isomorphism `H^p(M; ℤ/2) ≅ H_(n-p)(M; ℤ/2)` for every `p ≤ n`. The class is the fundamental
class of Stage 6.3; the integral and twisted forms need the orientation local system, which is
data and is not stated here. -/
theorem poincareDuality_zmodTwo (n : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] :
    ∃ c : SingularHomology (ZMod 2) (ModuleCat.of (ZMod 2) (ZMod 2)) (TopCat.of M) n,
      ∀ (p : ℕ) (hp : p ≤ n),
        Function.Bijective (fun a : singularCohomology (ZMod 2) (TopCat.of M) p =>
          (capProduct (ZMod 2) (TopCat.of M) p n hp).hom a c) := by
  sorry

/-! ## Relative CW connectivity -/

/-- Cellular approximation gives the exact isomorphism range, including components,
for an inclusion whose relative cells have dimension at least `cellLowerBound`. -/
theorem relativeCWConnectivityOfCellDimension
    (X : Type u) [TopologicalSpace X] [T2Space X] (A : Set X)
    [Topology.RelCWComplex (Set.univ : Set X) A]
    (a : A) (cellLowerBound : ℕ) (hLowerBound : 2 ≤ cellLowerBound)
    (hcells : ∀ n : ℕ, n < cellLowerBound → IsEmpty
      (Topology.RelCWComplex.cell (Set.univ : Set X) n))
    (q : ℕ) (hq : q + 1 < cellLowerBound) :
    Function.Bijective
      (HomotopyGroup.map (⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)) rfl :
        HomotopyGroup (Fin q) A a → HomotopyGroup (Fin q) X a.val) := by
  sorry

/-- The endpoint of the cellular connectivity range is surjective. -/
theorem relativeCWConnectivityOfCellDimension_surjective
    (X : Type u) [TopologicalSpace X] [T2Space X] (A : Set X)
    [Topology.RelCWComplex (Set.univ : Set X) A]
    (a : A) (cellLowerBound : ℕ) (hLowerBound : 1 ≤ cellLowerBound)
    (hcells : ∀ n : ℕ, n < cellLowerBound → IsEmpty
      (Topology.RelCWComplex.cell (Set.univ : Set X) n)) :
    Function.Surjective
      (HomotopyGroup.map (⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)) rfl :
        HomotopyGroup (Fin (cellLowerBound - 1)) A a → HomotopyGroup (Fin (cellLowerBound - 1)) X a.val) := by
  sorry

/-- A commuting based-pair square whose two components induce bijections on
all π_q at the chosen basepoint transports the exact cellular range. -/
theorem relativeCWConnectivityOfCellDimension_transport
    (X : Type u) (Y : Type v) [TopologicalSpace X] [T2Space X] [TopologicalSpace Y]
    (A : Set X) (B : Set Y) [Topology.RelCWComplex (Set.univ : Set X) A]
    (a : A) (cellLowerBound : ℕ) (hLowerBound : 1 ≤ cellLowerBound)
    (hcells : ∀ n : ℕ, n < cellLowerBound → IsEmpty
      (Topology.RelCWComplex.cell (Set.univ : Set X) n))
    (f : C(A, B)) (g : C(X, Y))
    (hsquare : ∀ x : A, g x.val = (f x).val)
    (hA : ∀ q : ℕ, Function.Bijective
      (HomotopyGroup.map f rfl :
        HomotopyGroup (Fin q) A a → HomotopyGroup (Fin q) B (f a)))
    (hX : ∀ q : ℕ, Function.Bijective
      (HomotopyGroup.map g (hsquare a) :
        HomotopyGroup (Fin q) X a.val → HomotopyGroup (Fin q) Y (f a).val)) :
    (∀ q : ℕ, q + 1 < cellLowerBound → Function.Bijective
      (HomotopyGroup.map (⟨Subtype.val, continuous_subtype_val⟩ : C(B, Y)) rfl :
        HomotopyGroup (Fin q) B (f a) → HomotopyGroup (Fin q) Y (f a).val)) ∧
    Function.Surjective
      (HomotopyGroup.map (⟨Subtype.val, continuous_subtype_val⟩ : C(B, Y)) rfl :
        HomotopyGroup (Fin (cellLowerBound - 1)) B (f a) →
          HomotopyGroup (Fin (cellLowerBound - 1)) Y (f a).val) := by
  sorry

/-! ## Based pairs for relative homotopy -/

/-- A topological pair with the point in the subspace required by relative homotopy. Relative
homology continues to use the unbased `TopPair` above. -/
structure BasedTopPair where
  pair : TopPair.{u}
  basepoint : pair.snd

namespace BasedTopPair

/-- A map of based pairs is a map of the underlying pairs whose subspace component preserves the
chosen point. This is the map carrier for relative homotopy functoriality. -/
structure Hom (X Y : BasedTopPair.{u}) where
  toTopPairHom : X.pair ⟶ Y.pair
  map_basepoint : TopPair.Hom.snd toTopPairHom X.basepoint = Y.basepoint

end BasedTopPair

/-- Explicit NDR data for an embedded pair. -/
structure NDRPairData (X : TopPair.{u}) where
  u : C(X.fst, unitInterval)
  H : C(unitInterval × X.fst, X.fst)
  zero_set : ∀ x, u x = 0 ↔ x ∈ Set.range X.map
  at_zero : ∀ x, H (0, x) = x
  fixed : ∀ (t : unitInterval) (a : X.snd), H (t, X.map a) = X.map a
  at_one : ∀ x, u x < 1 → H (1, x) ∈ Set.range X.map

/-! ## Finite CW Euler characteristic -/

/-- A concrete finite CW model for a space. Its topology, Hausdorff and CW witnesses belong
to the model carrier; the original space is connected by an actual homotopy equivalence.
Hausdorffness is a model witness, not a consequence of that equivalence. -/
structure FiniteCWTypeModel (M : Type u) [TopologicalSpace M] where
  X : Type u
  topology : TopologicalSpace X
  hausdorff : letI := topology; T2Space X
  cw : letI := topology; CWComplex (Set.univ : Set X)
  finite : letI := topology; letI := cw; CWComplex.Finite (Set.univ : Set X)
  homotopyEquiv : letI := topology; M ≃ₕ X

/-- A compact Hausdorff second-countable smooth manifold has a concrete finite CW model
(Stage 8.7, through GeometricTopology's smooth triangulation). Consumers take a model from this
existence statement and evaluate `FiniteCWTypeModel.eulerCharacteristic` on it. -/
theorem compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    Nonempty (FiniteCWTypeModel M) := by
  sorry

/-- Euler characteristic of a chosen finite CW structure. The roadmap proves that this agrees
with alternating homology rank and is invariant under homotopy equivalence
for Hausdorff CW carriers. The numerical definition itself remains more general. -/
noncomputable def finiteCWEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)] : ℤ :=
  ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * Nat.card (Topology.RelCWComplex.cell (Set.univ : Set X) i)

/-- Install the chosen model's actual Hausdorff and CW witnesses before taking its count. -/
noncomputable def FiniteCWTypeModel.eulerCharacteristic
    {M : Type u} [TopologicalSpace M] (m : FiniteCWTypeModel M) : ℤ := by
  letI := m.topology
  letI := m.hausdorff
  letI := m.cw
  letI := m.finite
  exact finiteCWEulerCharacteristic m.X

/-- The same installed model witnesses satisfy the native cellular Euler comparison. -/
example (k : Type u) [Field k] {M : Type u} [TopologicalSpace M]
    (m : FiniteCWTypeModel M) :
    letI := m.topology
    letI := m.hausdorff
    letI := m.cw
    letI := m.finite
    (cellularChainComplex k m.X).eulerChar = m.eulerCharacteristic := by
  let := m.topology
  let := m.hausdorff
  let := m.cw
  let := m.finite
  simpa [FiniteCWTypeModel.eulerCharacteristic, cellularChainComplex,
    finiteCWEulerCharacteristic, TauCeti.cwEulerChar_def] using
    (TauCeti.eulerChar_cellularChainComplex (Set.univ : Set m.X) (ModuleCat.of k k))

/-- The space-level cell count is the native cellular-complex Euler characteristic. -/
example (k : Type u) [Field k] (X : Type u) [TopologicalSpace X] [T2Space X]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)] :
    (cellularChainComplex k X).eulerChar = finiteCWEulerCharacteristic X := by
  simpa [cellularChainComplex, finiteCWEulerCharacteristic, TauCeti.cwEulerChar_def] using
    (TauCeti.eulerChar_cellularChainComplex (Set.univ : Set X) (ModuleCat.of k k))

theorem finiteCWEulerCharacteristic_eq_of_homotopyEquiv
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)]
    [CWComplex (Set.univ : Set Y)] [CWComplex.Finite (Set.univ : Set Y)]
    (_e : X ≃ₕ Y) :
    finiteCWEulerCharacteristic X = finiteCWEulerCharacteristic Y := by
  sorry

/-- Integral singular homology in the universe of the model's carrier. -/
abbrev ordinaryIntegralHomology (X : TopCat.{u}) (n : ℕ) :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
    (ModuleCat.of ℤ (ULift.{u} ℤ))).obj X

/-! ## Absolute Hurewicz and Whitehead

The Hurewicz map of Stage 8.3 is built from the cube-to-sphere quotient and the sphere's
reference class, which are data; the two Hurewicz statements below therefore assert the
existence of the isomorphism on native homotopy groups and native singular homology, and the
README pins it to the Hurewicz map.
-/

/-- Stage 8.3 in degree one: for a path-connected space the abelianized fundamental group is
isomorphic to integral `H₁`. -/
theorem hurewicz_degreeOne {X : Type u} [TopologicalSpace X] [PathConnectedSpace X] (x : X) :
    Nonempty (Additive (Abelianization (FundamentalGroup X x)) ≃+
      ordinaryIntegralHomology (TopCat.of X) 1) := by
  sorry

/-- Stage 8.3 in higher degrees: if `π_k(X) = 0` for `0 < k < n + 2` on a path-connected `X`,
then reduced integral homology vanishes below `n + 2` and `π_(n+2)(X) ≅ H_(n+2)(X; ℤ)`. -/
theorem hurewicz_connected {X : Type u} [TopologicalSpace X] [PathConnectedSpace X] (x : X)
    (n : ℕ) (hX : ∀ k : ℕ, 0 < k → k < n + 2 → Subsingleton (HomotopyGroup (Fin k) X x)) :
    (∀ k : ℕ, 0 < k → k < n + 2 →
      Subsingleton (ordinaryIntegralHomology (TopCat.of X) k)) ∧
    Nonempty (Additive (HomotopyGroup (Fin (n + 2)) X x) ≃+
      ordinaryIntegralHomology (TopCat.of X) (n + 2)) := by
  sorry

/-- Stage 8.5: Whitehead's theorem for Hausdorff CW complexes. A map that hits every path
component and induces bijections on every homotopy group at every basepoint, including `π₀`
as `HomotopyGroup (Fin 0)`, is a homotopy equivalence. -/
theorem whitehead {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y] [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)]
    (f : C(X, Y)) (hf₀ : ∀ y : Y, ∃ x : X, Joined (f x) y)
    (hf : ∀ (n : ℕ) (x : X), Function.Bijective
      (HomotopyGroup.map f rfl : HomotopyGroup (Fin n) X x → HomotopyGroup (Fin n) Y (f x))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-! ## Homological Whitehead -/

/-- A map between simply connected CW complexes which induces isomorphisms on integral singular
homology is itself the forward map of a homotopy equivalence. -/
theorem homologicalWhitehead
    {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y]
    [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)]
    (f : C(X, Y))
    (_hf : ∀ n : ℕ,
      IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ ℤ)).map (TopCat.ofHom f))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-! ## Stage 6.0: countable inverse-system algebra -/

section CountableTowers

variable {R : Type u} [CommRing R]

/-- The canonical product difference; inverse limits are its kernel. -/
def towerDifference (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) :
    ((n : ℕ) → T.obj (Opposite.op n)) →ₗ[R] ((n : ℕ) → T.obj (Opposite.op n)) where
  toFun x n := x n -
    (T.map (homOfLE (Nat.le_succ n)).op).hom (x (n + 1))
  map_add' x y := by
    ext n
    simp only [Pi.add_apply, map_add]
    abel
  map_smul' r x := by
    ext n
    simp only [Pi.smul_apply, map_smul, smul_sub, RingHom.id_apply]

/-- First derived inverse limit for a countable module tower, as an actual quotient module. -/
abbrev countableLimOne (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) :=
  ((n : ℕ) → T.obj (Opposite.op n)) ⧸ LinearMap.range (towerDifference T)

theorem towerDifference_surjective (T : ℕᵒᵖ ⥤ ModuleCat.{u} R)
    (hT : ∀ n : ℕ, Function.Surjective
      (T.map (homOfLE (Nat.le_succ n)).op).hom) :
    Function.Surjective (towerDifference T) := by
  sorry

end CountableTowers

/-! ## Selected Stage 8: classifying spaces, Eilenberg–MacLane models and representability

The functorial abelian family `K(A, n)` is this roadmap's Stage 8.8c target: the bar model of
8.8a in degree one and the Dold–Kan realizations `|Γ(A[n])|` above. `OrdinaryEMModel` records
the normalized data any model carries, and `NormalizedAbelianEMFamily` the coefficient-natural
family; the constructor itself is data and is not stated here.
-/

theorem simplicialRealizationT2 (K : SSet.{u}) : T2Space (SSet.toTop.obj K) := by
  sorry

/-- The single generic bar/nerve realization for discrete groups. -/
abbrev groupClassifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  SSet.toTop.obj (CategoryTheory.nerve (SingleObj G))

/-- The unique bar vertex, with its realization inclusion. -/
noncomputable def groupClassifyingSpaceBasepoint (G : Type u) [Group G] :
    groupClassifyingSpace G :=
  (SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (CategoryTheory.nerveEquiv.symm (SingleObj.star G))))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

theorem groupClassifyingSpace_isEMOne (G : Type u) [Group G] :
    TauCeti.IsEilenbergMacLaneSpaceOne G (groupClassifyingSpace G)
      (groupClassifyingSpaceBasepoint G) := by
  sorry

/-- The data of a `K(A, n)` model: a path-connected Hausdorff CW space with a normalized
identification of `π_n` with `A`. Vanishing is for every other positive degree, with no
finite-dimension condition. -/
structure OrdinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] where
  space : TopCat.{u}
  point : space
  hausdorff : T2Space space
  cw : CWComplex (Set.univ : Set space)
  connected : PathConnectedSpace space
  homotopyIdentification : HomotopyGroup (Fin n) space point ≃* Multiplicative A
  vanishing : ∀ j : ℕ, 0 < j → j ≠ n →
    Subsingleton (HomotopyGroup (Fin j) space point)

/-- The coefficient-natural shape of Stage 8.8c's family: its spaces are the bar model in
degree one and the Dold–Kan realizations in higher degree, and this structure records the
normalized maps induced by homomorphisms `A ⟶ A'`. -/
structure NormalizedAbelianEMFamily where
  model : ∀ (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n], OrdinaryEMModel A n
  map : ∀ {A A' : AddCommGrpCat.{u}} (_f : A ⟶ A') (n : ℕ) [NeZero n],
    (model A n).space ⟶ (model A' n).space
  map_point : ∀ {A A' : AddCommGrpCat.{u}} (f : A ⟶ A') (n : ℕ) [NeZero n],
    map f n (model A n).point = (model A' n).point
  map_id : ∀ (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n], map (𝟙 A) n = 𝟙 _
  map_comp : ∀ {A A' A'' : AddCommGrpCat.{u}} (f : A ⟶ A') (g : A' ⟶ A'')
    (n : ℕ) [NeZero n], map (f ≫ g) n = map f n ≫ map g n
  normalized_naturality : ∀ {A A' : AddCommGrpCat.{u}} (f : A ⟶ A') (n : ℕ) [NeZero n]
    (p : HomotopyGroup (Fin n) (model A n).space (model A n).point),
    (model A' n).homotopyIdentification
      (HomotopyGroup.map (map f n).hom (map_point f n) p) =
      Multiplicative.ofAdd (f.hom (Multiplicative.toAdd ((model A n).homotopyIdentification p)))

/-- Consume the model and normalized maps from the shared family. -/
abbrev ordinaryEMModelFromFamily (F : NormalizedAbelianEMFamily.{u})
    (A : AddCommGrpCat.{u}) (n : ℕ) [NeZero n] : OrdinaryEMModel A n := F.model A n

/-- The actual higher simplicial model, using the native single-degree complex and Γ. -/
abbrev ordinaryDoldKanSimplicialModel (A : AddCommGrpCat.{u}) (n : ℕ) : SSet.{u} :=
  (CategoryTheory.Abelian.DoldKan.Γ.obj
    ((HomologicalComplex.single AddCommGrpCat (ComplexShape.down ℕ) n).obj A)) ⋙
      forget AddCommGrpCat

/-- The actual normalized n-simplex labelled a: inverse native counit, then
inclusion of the normalized Moore subobject into the simplicial n-chains. -/
noncomputable def ordinaryDoldKanLabeledSimplex (A : AddCommGrpCat.{u})
    (n : ℕ) (a : A) : (ordinaryDoldKanSimplicialModel A n) _⦋n⦌ :=
  let L := (HomologicalComplex.single AddCommGrpCat (ComplexShape.down ℕ) n).obj A
  let G := CategoryTheory.Abelian.DoldKan.Γ.obj L
  let a' := (HomologicalComplex.singleObjXSelf (ComplexShape.down ℕ) n A).inv.hom a
  let z := ((CategoryTheory.Abelian.DoldKan.equivalence.counitIso.app L).inv.f n).hom a'
  (AlgebraicTopology.NormalizedMooreComplex.objX G n).arrow.hom z

/-- Actual realized zero vertex of the simplicial abelian model. -/
noncomputable def ordinaryDoldKanBasepoint (A : AddCommGrpCat.{u}) (n : ℕ) :
    SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n) :=
  SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (0 : (ordinaryDoldKanSimplicialModel A n) _⦋0⦌))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

/-- The lifted unit sphere, the sphere carrier of Stage 4.4. -/
abbrev homotopySphere (n : ℕ) : TopCat.{u} :=
  TopCat.of (ULift.{u} (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1))

/-- The positive first-coordinate pole. -/
noncomputable def homotopySpherePole (n : ℕ) :
    Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 :=
  ⟨PiLp.single 2 0 (1 : ℝ), by simp⟩

/-- The actual cube/boundary pair, lifted to the coefficient universe. -/
abbrev coordinateCubePair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := TopCat.of (ULift.{u} (Fin n → unitInterval)))
    {t | t.down ∈ Cube.boundary (Fin n)}

/-- The ordered standard simplex relative to its actual boundary faces. -/
abbrev coordinateSimplexPair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := TopCat.of (ULift.{u} (Convexity.StdSimplex ℝ (Fin (n + 1)))))
    {t | ∃ i, t.down.weights i = 0}

noncomputable def coordinateSimplexIdentityChain (n : ℕ) :
    ((coordinateSimplexPair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).X n :=
  ((coordinateSimplexPair n).singularChainComplexπ (ModuleCat.of ℤ (ULift.{u} ℤ))).f n
    (((TopCat.toSSet.obj (coordinateSimplexPair n).fst).ιChainComplex
      (R := ModuleCat.of ℤ (ULift.{u} ℤ))
      (((coordinateSimplexPair n).fst.toSSetObjEquiv (Opposite.op ⦋n⦌)).symm
        ⟨ULift.up, by fun_prop⟩)).hom (ULift.up 1))

theorem coordinateSimplexIdentityChain_cycle (n : ℕ) :
    (((coordinateSimplexPair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).d n ((ComplexShape.down ℕ).next n)).hom
      (coordinateSimplexIdentityChain n) = 0 := by sorry

noncomputable def coordinateSimplexIdentityClass (n : ℕ) :
    (coordinateSimplexPair.{u} n).singularHomology (C := ModuleCat.{u} ℤ)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  let K := (coordinateSimplexPair.{u} n).singularChainComplex (ModuleCat.of ℤ (ULift.{u} ℤ))
  K.homologyπ n (K.cyclesMk (coordinateSimplexIdentityChain n) ((ComplexShape.down ℕ).next n)
    (by rfl) (coordinateSimplexIdentityChain_cycle n))

abbrev homotopySpherePolePair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := homotopySphere.{u} n) {ULift.up (homotopySpherePole n)}

/-- Homotopy classes use the native continuous-map homotopy equivalence relation. -/
def continuousHomotopySetoid (X Y : TopCat.{u}) : Setoid C(X, Y) where
  r := ContinuousMap.Homotopic
  iseqv := ContinuousMap.Homotopic.equivalence

abbrev continuousHomotopyClasses (X Y : TopCat.{u}) :=
  Quotient (continuousHomotopySetoid X Y)

/-- Pullback of a fixed class `ι` along homotopy classes of maps into `K`, descended by the
native homotopy invariance of singular cohomology. -/
noncomputable def ordinaryEMPullback (A : Type u) [AddCommGroup A] (n : ℕ) (K : TopCat.{u})
    (ι : K.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n)
    (X : TopCat.{u}) :
    continuousHomotopyClasses X K →
      X.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n :=
  Quotient.lift (fun f => TopCat.singularCohomologyMap (TopCat.ofHom f) n ι) (by
      intro f g h
      obtain ⟨H⟩ := h
      have heq := TopCat.Homotopy.congr_singularCohomologyMap
        (f := TopCat.ofHom f) (g := TopCat.ofHom g) H
        (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n
      exact congrArg (fun q => q.hom ι) heq)

/-- Stage 8.10: every `K(A, n)` model represents `H^n(-; A)` on arbitrary Hausdorff CW
complexes, of any dimension and with any number of components. The README's universal class
`ordinaryEMUniversalClass` is normalized through the Hurewicz map, which is not native at the
pins; the existence of a representing class is the statable content. -/
theorem ordinaryEMRepresentability (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n]
    (K : OrdinaryEMModel A n) :
    ∃ ι : K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n,
      ∀ (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)],
        Function.Bijective (ordinaryEMPullback A n K.space ι X) := by
  sorry

/-! ### Stage 4.4 carrier and Stage 4.5 ordinary pair comparisons -/

/-- Collapse the given subspace together with a separately added basepoint. -/
def ordinaryCofiberSupport {X : Type u} (B : Set X) : Set (X ⊕ PUnit) :=
  {p | p.elim (fun x => x ∈ B) (fun _ => True)}

def ordinaryCofiberSetoid {X : Type u} (B : Set X) : Setoid (X ⊕ PUnit) where
  r x y := x = y ∨ (x ∈ ordinaryCofiberSupport B ∧ y ∈ ordinaryCofiberSupport B)
  iseqv := by
    constructor
    · intro x
      exact Or.inl rfl
    · intro x y h
      rcases h with h | ⟨hx, hy⟩
      · exact Or.inl h.symm
      · exact Or.inr ⟨hy, hx⟩
    · intro x y z hxy hyz
      rcases hxy with rfl | ⟨hx, hy⟩
      · exact hyz
      · rcases hyz with rfl | ⟨_, hz⟩
        · exact Or.inr ⟨hx, hy⟩
        · exact Or.inr ⟨hx, hz⟩

/-- Native pointed pushout carrier, including X₊ when B is empty. -/
def ordinaryPairQuotient (X : Type u) [TopologicalSpace X] (B : Set X) : TopCat.{u} :=
  TopCat.of (Quotient (ordinaryCofiberSetoid B))

def ordinaryPairQuotientPoint (X : Type u) [TopologicalSpace X] (B : Set X) :
    ordinaryPairQuotient X B := Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)

/-- The actual collapse from X. -/
def ordinaryPairQuotientMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopCat.of X ⟶ ordinaryPairQuotient X B :=
  TopCat.ofHom ⟨fun x => Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x), by
    let : Setoid (X ⊕ PUnit.{u + 1}) := ordinaryCofiberSetoid B
    exact continuous_quotient_mk'.comp continuous_inl⟩

/-- The reduced pair uses the same collapse and its added point. -/
def ordinaryPairQuotientPairMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopPair.ofSubset (X := TopCat.of X) B ⟶
      TopPair.ofSubset (X := ordinaryPairQuotient X B) {ordinaryPairQuotientPoint X B} :=
  TopPair.ofSubsetMap (ordinaryPairQuotientMap X B) (by
    intro x hx
    change Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x) = Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)
    exact Quotient.sound (Or.inr ⟨hx, trivial⟩))

/-- CW-pair specialization of the definitive closed cofibration/NDR quotient comparison.
The target is reduced homology, realized natively as the pair relative to its basepoint. -/
theorem ordinaryPairQuotientComparison (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (ordinaryPairQuotientPairMap X B) M n) := by
  sorry

/-- Cohomology uses the actual contravariant native pair map. -/
theorem ordinaryPairQuotientCohomologyComparison (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularCohomologyMap (R := ModuleCat.of R R) (k := R) (M := M)
      (ordinaryPairQuotientPairMap X B) n) := by
  sorry

end

universe u

/-! ### Stage 2.5: the coordinate sup-ball and its boundary pair -/

abbrev coordinateSupBall (n : ℕ) : TopCat.{u} :=
  TopCat.of (ULift.{u} (Metric.closedBall (0 : Fin n → ℝ) 1))

abbrev coordinateSupBallPair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := coordinateSupBall.{u} n) {x | ‖(x.down : Fin n → ℝ)‖ = 1}

/-! ### Stage 4.4: based disk, cube, smash and suspension quotients -/

/-- The actual image of Mathlib's disk-boundary inclusion; empty for n=0. -/
noncomputable def diskBoundarySubset (n : ℕ) : Set (TopCat.disk.{u} n) :=
  Set.range (TopCat.diskBoundaryInclusion n)

noncomputable abbrev basedDiskQuotient (n : ℕ) : TopCat.{u} :=
  ordinaryPairQuotient (TopCat.disk.{u} n) (diskBoundarySubset n)

abbrev basedCubeQuotient (n : ℕ) : TopCat.{u} :=
  ordinaryPairQuotient (coordinateCubePair.{u} n).fst
    {t | t.down ∈ Cube.boundary (Fin n)}

/-- Bare pointed smash quotient. Categorical and homology adapters consume this carrier. -/
def basedSmashCarrier (X Y : TopCat.{u}) (x : X) (y : Y) : TopCat.{u} :=
  ordinaryPairQuotient (X × Y) {p | p.1 = x ∨ p.2 = y}

def basedSmashQuotientMap (X Y : TopCat.{u}) (x : X) (y : Y) :
    TopCat.of (X × Y) ⟶ basedSmashCarrier X Y x y :=
  ordinaryPairQuotientMap (X × Y) {p | p.1 = x ∨ p.2 = y}

/-- Right reduced suspension: original coordinates first, interval last. -/
def reducedSuspensionCarrier (X : TopCat.{u}) (x : X) : TopCat.{u} :=
  ordinaryPairQuotient (X × unitInterval) {p | p.1 = x ∨ p.2 = 0 ∨ p.2 = 1}

noncomputable abbrev sphereSmashQuotientMap (m n : ℕ) :=
  basedSmashQuotientMap (homotopySphere.{u} m) (homotopySphere.{u} n)
    (ULift.up (homotopySpherePole m)) (ULift.up (homotopySpherePole n))

/-- The boundary carrier is definitionally Mathlib's lifted metric sphere. -/
noncomputable def diskBoundarySphereHomeomorph (n : ℕ) :
    TopCat.diskBoundary.{u} (n + 1) ≃ₜ homotopySphere.{u} n := Homeomorph.refl _

/-! ### Stage 8.11b: the two-step cone quotient uses the same interval-last suspension carrier -/

def ordinaryConeCarrier (X : TopCat.{u}) : TopCat.{u} :=
  ordinaryPairQuotient (X × unitInterval) {p | p.2 = 0}

def ordinaryConeQuotientMap (X : TopCat.{u}) :
    TopCat.of (X × unitInterval) ⟶ ordinaryConeCarrier X :=
  ordinaryPairQuotientMap (X × unitInterval) {p | p.2 = 0}

def ordinaryConeBase (X : TopCat.{u}) (x : X) : ordinaryConeCarrier X :=
  ordinaryConeQuotientMap X (x, 1)

def ordinaryUnreducedSuspensionCarrier (X : TopCat.{u}) : TopCat.{u} :=
  ordinaryPairQuotient (ordinaryConeCarrier X) (Set.range (ordinaryConeBase X))

def ordinarySuspensionQuotientMap (X : TopCat.{u}) :
    TopCat.of (X × unitInterval) ⟶ ordinaryUnreducedSuspensionCarrier X :=
  ordinaryConeQuotientMap X ≫
    ordinaryPairQuotientMap (ordinaryConeCarrier X) (Set.range (ordinaryConeBase X))

def ordinaryBasepointMeridian (X : TopCat.{u}) (x : X) (t : unitInterval) :
    ordinaryUnreducedSuspensionCarrier X := ordinarySuspensionQuotientMap X (x, t)

def ordinaryTwoStepReducedSuspensionCarrier (X : TopCat.{u}) (x : X) : TopCat.{u} :=
  ordinaryPairQuotient (ordinaryUnreducedSuspensionCarrier X)
    (Set.range (ordinaryBasepointMeridian X x))

def ordinaryTwoStepSuspensionQuotientMap (X : TopCat.{u}) (x : X) :
    TopCat.of (X × unitInterval) ⟶ ordinaryTwoStepReducedSuspensionCarrier X x :=
  ordinarySuspensionQuotientMap X ≫
    ordinaryPairQuotientMap (ordinaryUnreducedSuspensionCarrier X)
      (Set.range (ordinaryBasepointMeridian X x))

/-! ### Stage 2.7: finite-dimensional Brouwer fixed point -/

/-- Native disk inclusion cannot have a continuous retraction, including n=0. -/
theorem noRetraction_diskBoundary (n : ℕ) :
    ¬ ∃ r : TopCat.disk.{u} n ⟶ TopCat.diskBoundary.{u} n,
      TopCat.diskBoundaryInclusion n ≫ r = 𝟙 (TopCat.diskBoundary.{u} n) := by
  sorry

theorem brouwerFixedPoint_topCatDisk (n : ℕ)
    (f : TopCat.disk.{u} n ⟶ TopCat.disk.{u} n) :
    ∃ x : TopCat.disk.{u} n, Function.IsFixedPt f x := by
  sorry

section BrouwerFixedPoint
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E]

/-- Finite-dimensional Brouwer on the actual compact convex subtype. -/
theorem brouwerFixedPoint_compactConvex (C : Set E) (hne : C.Nonempty)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C) (f : ContinuousMap C C) :
    ∃ x : C, Function.IsFixedPt f x := by
  sorry

/-- The operator-theory adapter requires continuity only on C. -/
theorem brouwerFixedPoint_compactConvex_continuousOn (C : Set E) (hne : C.Nonempty)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C) (f : E → E)
    (hf : ContinuousOn f C) (hmaps : Set.MapsTo f C C) :
    ∃ x ∈ C, Function.IsFixedPt f x := by
  sorry

/-- The radius-zero ball is retained; a negative-radius ball would be empty. -/
theorem brouwerFixedPoint_closedBall (a : E) (r : ℝ) (hr : 0 ≤ r)
    (f : ContinuousMap (Metric.closedBall a r) (Metric.closedBall a r)) :
    ∃ x : Metric.closedBall a r, Function.IsFixedPt f x := by
  sorry

/-- Exact continuous-function adapter to Mathlib PR36770's closed-ball hypothesis. -/
theorem brouwerFixedPoint_unitClosedBall_continuous
    (f : Metric.closedBall (0 : E) 1 → Metric.closedBall (0 : E) 1)
    (hf : Continuous f) : ∃ x, Function.IsFixedPt f x := by
  sorry

/-- Radial transport takes place in the affine direction, including lower-dimensional C. -/
noncomputable def compactConvexRadialReach (C : Set E) (c : E)
    (u : (affineSpan ℝ C).direction) : ℝ :=
  sSup (Set.ofPred fun t : ℝ => 0 ≤ t ∧ c + t • (u : E) ∈ C)

theorem compactConvexRadialReach_pos (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (c : E) (hc : c ∈ intrinsicInterior ℝ C)
    (u : (affineSpan ℝ C).direction) (hu : ‖u‖ = 1) :
    0 < compactConvexRadialReach C c u := by
  sorry

theorem compactConvexRadialReach_mem (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (c : E) (hc : c ∈ intrinsicInterior ℝ C)
    (u : (affineSpan ℝ C).direction) (hu : ‖u‖ = 1) :
    c + compactConvexRadialReach C c u • (u : E) ∈ C := by
  sorry

theorem continuousOn_compactConvexRadialReach (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (c : E) (hc : c ∈ intrinsicInterior ℝ C) :
    ContinuousOn (compactConvexRadialReach C c)
      (Metric.sphere (0 : (affineSpan ℝ C).direction) 1) := by
  sorry

end BrouwerFixedPoint

section FiniteSpanBrouwer

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Finite convex-hull approximations may live in an infinite-dimensional ambient space. -/
theorem brouwerFixedPoint_compactConvex_finiteSpan (C : Set E) (hne : C.Nonempty)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (V : Submodule ℝ E) [FiniteDimensional ℝ V] (hCV : C ⊆ (V : Set E))
    (f : ContinuousMap C C) : ∃ x : C, Function.IsFixedPt f x := by
  sorry

end FiniteSpanBrouwer

section RelativeCWPushouts

variable {Y Z : Type u} [TopologicalSpace Y] [TopologicalSpace Z]
    [T2Space Y] [T2Space Z] (B : Set Y)

/-- The actual inclusion and attachment morphisms determine a native TopCat pushout. -/
abbrev relativeCWPushoutInclusion : TopCat.of B ⟶ TopCat.of Y :=
  TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩

/-- The carrier is the categorical pushout in TopCat, with its actual quotient topology. -/
noncomputable abbrev relativeCWPushoutCarrier (a : C(B, Z)) : TopCat.{u} :=
  pushout (relativeCWPushoutInclusion B) (TopCat.ofHom a)

/-- Disk-by-disk separation retains Hausdorffness of the actual quotient pushout. -/
theorem relativeCWPushout_t2Space [RelCWComplex (Set.univ : Set Y) B]
    (a : C(B, Z)) :
    T2Space (relativeCWPushoutCarrier B a) := by
  sorry

/-- The original base has its actual subspace topology and is closed in the attachment. -/
theorem relativeCWPushout_base_isClosedEmbedding
    [RelCWComplex (Set.univ : Set Y) B] (a : C(B, Z)) :
    IsClosedEmbedding
      (pushout.inr (relativeCWPushoutInclusion B) (TopCat.ofHom a)) := by
  sorry

/-- Closed-cofibration HEP retains prescribed data on both endpoints and on A.
The native cylinder coordinate order is interval first. -/
theorem closedCofibrationCylinderHomotopyExtension
    {X : Type u} [TopologicalSpace X] (A : Set X) (hAc : IsClosed A)
    (hA : TauCeti.HasHomotopyExtensionProperty A) :
    TauCeti.HasHomotopyExtensionProperty
      ((({0, 1} : Set unitInterval).prod (Set.univ : Set X)) ∪
        (Set.univ : Set unitInterval).prod A) := by
  sorry

/-- Prescribed one-sided inverse data extend for equivalences of cofibered pairs.
The forward map and its restriction are both equivalences; no arbitrary second
inverse homotopy is prescribed. -/
theorem homotopyInversePairExtension_left
    {X X' : Type u} [TopologicalSpace X] [TopologicalSpace X']
    (A : Set X) (A' : Set X')
    (hAc : IsClosed A) (hAc' : IsClosed A')
    (hA : TauCeti.HasHomotopyExtensionProperty A)
    (hA' : TauCeti.HasHomotopyExtensionProperty A')
    (e : ContinuousMap.HomotopyEquiv X X')
    (e₀ : ContinuousMap.HomotopyEquiv A A')
    (he : ∀ a : A, e (a : X) = (e₀ a : X'))
    (g₀ : C(A', A))
    (H₀ : ContinuousMap.Homotopy (g₀.comp e₀.toFun) (ContinuousMap.id A)) :
    ∃ (g : C(X', X))
      (H : ContinuousMap.Homotopy (g.comp e.toFun) (ContinuousMap.id X)),
      (∀ a' : A', g (a' : X') = (g₀ a' : X)) ∧
      (∀ (t : unitInterval) (a : A), H (t, (a : X)) = (H₀ (t, a) : X)) ∧
      (e.toFun.comp g).Homotopic (ContinuousMap.id X') := by
  sorry

/-- Stage 4.5: a homotopy equivalence of Hausdorff CW complexes that sends a chosen 0-cell
basepoint to a chosen 0-cell basepoint has a based homotopy inverse, with unit and counit
homotopies relative to the basepoints. -/
theorem basedHomotopyInverseOfEquivalence {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)]
    (e : ContinuousMap.HomotopyEquiv X Y) (x₀ : X) (y₀ : Y)
    (hx₀ : ∃ i : Topology.RelCWComplex.cell (Set.univ : Set X) 0,
      x₀ ∈ Topology.RelCWComplex.openCell (C := (Set.univ : Set X)) 0 i)
    (hy₀ : ∃ i : Topology.RelCWComplex.cell (Set.univ : Set Y) 0,
      y₀ ∈ Topology.RelCWComplex.openCell (C := (Set.univ : Set Y)) 0 i)
    (he : e.toFun x₀ = y₀) :
    ∃ g : C(Y, X), g y₀ = x₀ ∧
      (g.comp e.toFun).HomotopicRel (ContinuousMap.id X) {x₀} ∧
      (e.toFun.comp g).HomotopicRel (ContinuousMap.id Y) {y₀} := by
  sorry

end RelativeCWPushouts

/-! ## Proper homotopy comparison -/

/-- A proper inverse includes joint proper homotopies on `I × X` and `I × Y`.
The ordinary homotopy-equivalence carrier is native; no second homotopy type is defined. -/
def HasProperHomotopyInverse {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : Prop :=
  IsProperMap f ∧ ∃ g : C(Y, X), IsProperMap g ∧
    ∃ H : ContinuousMap.Homotopy (g.comp f) (ContinuousMap.id X),
    ∃ K : ContinuousMap.Homotopy (f.comp g) (ContinuousMap.id Y),
      IsProperMap H ∧ IsProperMap K

/-- Forgetting the proper controls gives exactly Mathlib's ordinary equivalence. -/
theorem HasProperHomotopyInverse.exists_homotopyEquiv
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {f : C(X, Y)} (h : HasProperHomotopyInverse f) :
    ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f := by
  rcases h with ⟨_, g, _, H, K, _, _⟩
  exact ⟨{ toFun := f, invFun := g, left_inv := ⟨H⟩, right_inv := ⟨K⟩ }, rfl⟩

/-- Proper extension retains a jointly proper map on the entire cylinder.
Stage 8.5 proves this for strongly locally finite CW pairs and their product pairs. -/
def HasProperHomotopyExtensionProperty {X : Type u} [TopologicalSpace X]
    (A : Set X) : Prop :=
  ∀ (Y : Type u) [TopologicalSpace Y],
    ∀ (f : C(X, Y)), IsProperMap f →
    ∀ (H : C(unitInterval × A, Y)), IsProperMap H →
      (∀ a : A, H (0, a) = f (a : X)) →
      ∃ K : C(unitInterval × X, Y), IsProperMap K ∧
        (∀ x : X, K (0, x) = f x) ∧
        (∀ (t : unitInterval) (a : A), K (t, (a : X)) = H (t, a))

/-- The compact-exhaustion loop condition is shared by AT, GT and Four.
The circle is Mathlib's actual additive circle with period one. -/
def SimplyConnectedAtInfinity (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ K : Set X, IsCompact K → ∃ L : Set X, IsCompact L ∧ K ⊆ L ∧
    ∀ f : C(AddCircle (1 : ℝ), X), (∀ z, f z ∉ L) →
      ∃ p : X, p ∉ K ∧
        ∃ H : ContinuousMap.Homotopy f (ContinuousMap.const (AddCircle (1 : ℝ)) p),
          ∀ z : unitInterval × AddCircle (1 : ℝ), H z ∉ K

/-- Proper extension for a closed pair also supplies the full cylinder-boundary
pair. The spelling agrees with the ordinary native HEP companion. -/
theorem HasProperHomotopyExtensionProperty.cylinderBoundary
    {X : Type u} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    {A : Set X} (hA : HasProperHomotopyExtensionProperty A) (hAc : IsClosed A) :
    HasProperHomotopyExtensionProperty
      ((({0, 1} : Set unitInterval).prod (Set.univ : Set X)) ∪
        (Set.univ : Set unitInterval).prod A) := by
  sorry

/-- The proper inverse is rectified using proper extension and its cylinder
corollary. Closedness follows from properness of the inclusion. -/
theorem properStrongDeformationRetract_of_inverse
    {X : Type u} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    (A : Set X) (hA : HasProperHomotopyExtensionProperty A)
    (hInverse : HasProperHomotopyInverse
      (⟨Subtype.val, continuous_subtype_val⟩ : C(A, X))) :
    ∃ r : C(X, A), IsProperMap r ∧ (∀ a : A, r (a : X) = a) ∧
      ∃ H : (ContinuousMap.id X).HomotopyRel
        ((⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)).comp r) A,
        IsProperMap H := by
  sorry

end TauCetiRoadmap.AlgebraicTopology

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits
universe u

/-! Suggested categorical covers and counting invariants for the foundational
Lusternik–Schnirelmann category and cup-length theory. -/

/-- Actual open categorical cover of A in X; the contractions are native. -/
structure LSCategoricalCover (X : Type u) [TopologicalSpace X]
    (A : Set X) (n : ℕ) where
  opens : Fin n → TopologicalSpace.Opens X
  categorical : ∀ i,
    (⟨Subtype.val, continuous_subtype_val⟩ : C({x : X // x ∈ opens i}, X)).Nullhomotopic
  covers : ∀ x ∈ A, ∃ i, x ∈ opens i

/-- Unnormalized ambient category; no finite witness gives infinity. -/
noncomputable def lsCategoryCount (X : Type u) [TopologicalSpace X]
    (A : Set X) : ℕ∞ :=
  sInf {m : ℕ∞ | ∃ n : ℕ, m = (n : ℕ∞) ∧ Nonempty (LSCategoricalCover X A n)}

/-- The literal zero-index categorical cover of an empty subset; X may be empty. -/
def lsCategoricalCoverEmpty (X : Type u) [TopologicalSpace X] :
    LSCategoricalCover X ∅ 0 where
  opens := Fin.elim0
  categorical := by
    intro i
    exact Fin.elim0 i
  covers := by
    intro x hx
    exact (Set.notMem_empty x hx).elim

/-- The empty-set count follows directly from the ENat infimum, without an LS admission. -/
theorem lsCategoryCount_empty (X : Type u) [TopologicalSpace X] :
    lsCategoryCount X ∅ = 0 := by
  apply le_antisymm
  · exact sInf_le ⟨0, rfl, ⟨lsCategoricalCoverEmpty X⟩⟩
  · exact bot_le

/-- Normalized convention is only used when a point exists. -/
noncomputable def normalizedLSCategory (X : Type u) [TopologicalSpace X]
    [Nonempty X] : ℕ∞ := lsCategoryCount X Set.univ - 1

theorem lsCategoryCount_le_iff {X : Type u} [TopologicalSpace X]
    (A : Set X) (n : ℕ) :
    lsCategoryCount X A ≤ (n : ℕ∞) ↔
      ∃ m : ℕ, m ≤ n ∧ Nonempty (LSCategoricalCover X A m) := by
  sorry

theorem lsCategoryCount_eq_zero_iff {X : Type u} [TopologicalSpace X]
    (A : Set X) : lsCategoryCount X A = 0 ↔ A = ∅ := by
  sorry

theorem lsCategoryCount_mono {X : Type u} [TopologicalSpace X]
    {A B : Set X} (h : A ⊆ B) : lsCategoryCount X A ≤ lsCategoryCount X B := by
  sorry

theorem lsCategoryCount_union_le {X : Type u} [TopologicalSpace X]
    (A B : Set X) :
    lsCategoryCount X (A ∪ B) ≤ lsCategoryCount X A + lsCategoryCount X B := by
  sorry

theorem lsCategoryCount_le_of_homotopic_id {X : Type u} [TopologicalSpace X]
    (g : C(X, X)) (hg : g.Homotopic (ContinuousMap.id X))
    (A B : Set X) (hAB : Set.MapsTo g A B) :
    lsCategoryCount X A ≤ lsCategoryCount X B := by
  sorry

theorem lsCategoryCount_homotopyEquiv {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] (e : ContinuousMap.HomotopyEquiv X Y) :
    lsCategoryCount X Set.univ = lsCategoryCount Y Set.univ := by
  sorry

theorem lsCategoryCount_discrete {X : Type u} [TopologicalSpace X]
    [DiscreteTopology X] (A : Set X) : lsCategoryCount X A = A.encard := by
  sorry

theorem lsCategoryCount_contractible {X : Type u} [TopologicalSpace X]
    [Nonempty X] [ContractibleSpace X] : lsCategoryCount X Set.univ = 1 := by
  sorry

theorem lsCategoryCount_lt_top_of_compact {X : Type u} [TopologicalSpace X]
    [CompactSpace X] (hLC : LocallyContractibleSpace X) :
    lsCategoryCount X Set.univ < ⊤ := by
  sorry

theorem lsCategoryCount_eq_normalized_add_one {X : Type u}
    [TopologicalSpace X] [Nonempty X] :
    lsCategoryCount X Set.univ = normalizedLSCategory X + 1 := by
  sorry

theorem lsCategoryCount_sigma {J : Type u} [Fintype J]
    (X : J → Type u) [∀ j, TopologicalSpace (X j)] :
    lsCategoryCount (Σ j, X j) Set.univ = ∑ j, lsCategoryCount (X j) Set.univ := by
  sorry

/-- Direct native chain contraction of a point, with arbitrary commutative coefficients. -/
noncomputable def pointSingularChainHomotopyEquiv (R : Type u) [CommRing R] :
    HomotopyEquiv
      (((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj
        (ModuleCat.of R R)).obj (TopCat.of PUnit.{u + 1}))
      ((ChainComplex.single₀ (ModuleCat.{u} R)).obj (ModuleCat.of R R)) :=
  (HomotopyEquiv.ofIso
    (AlgebraicTopology.singularChainComplexFunctorIsoOfTotallyDisconnectedSpace
      (ModuleCat.{u} R) (ModuleCat.of R R) (TopCat.of PUnit.{u + 1}))).trans
    ((ChainComplex.alternatingConstHomotopyEquiv _).trans
      (HomotopyEquiv.ofIso ((ChainComplex.single₀ (ModuleCat.{u} R)).mapIso
        (coproductUniqueIso (fun _ : PUnit.{u + 1} => ModuleCat.of R R)))))

/-- Hom/linear-Yoneda dualization of the explicit point contraction; no UCT hypothesis. -/
theorem isZero_singularCohomology_point (R : Type u) [CommRing R]
    (d : ℕ) (hd : 0 < d) :
    IsZero (singularCohomology R (TopCat.of PUnit.{u + 1}) d) := by
  sorry

/-- Restriction kills positive-degree classes on an ambient categorical open. -/
theorem lsCohomology_restrict_eq_zero (X : TopCat.{u}) (R : Type u) [CommRing R]
    (U : TopologicalSpace.Opens X)
    (hU : (⟨Subtype.val, continuous_subtype_val⟩ :
      C({x : X // x ∈ U}, X)).Nullhomotopic)
    (d : ℕ) (hd : 0 < d) (a : singularCohomology R X d) :
    TopCat.singularCohomologyMap
      (TopCat.ofHom (⟨Subtype.val, continuous_subtype_val⟩ :
        C({x : X // x ∈ U}, X))) d a = 0 := by
  sorry

/-- A finite positive-degree cup product, using that actual native operation. -/
inductive LSPositiveCupProduct (X : TopCat.{u}) (R : Type u) [CommRing R] :
    ℕ → (Σ d : ℕ, singularCohomology R X d) → Prop where
  | single (d : ℕ) (hd : 0 < d) (a : singularCohomology R X d) :
      LSPositiveCupProduct X R 1 ⟨d, a⟩
  | mul {r p q : ℕ} (a : singularCohomology R X p) (b : singularCohomology R X q)
      (ha : LSPositiveCupProduct X R r ⟨p, a⟩) (hq : 0 < q) :
      LSPositiveCupProduct X R (r + 1) ⟨p + q, cupProduct R X p q a b⟩

noncomputable def lsCupLength (X : TopCat.{u}) (R : Type u) [CommRing R] : ℕ∞ :=
  sSup {m : ℕ∞ | ∃ r : ℕ, m = (r : ℕ∞) ∧
    ∃ d : ℕ, ∃ a : singularCohomology R X d,
      a ≠ 0 ∧ LSPositiveCupProduct X R r ⟨d, a⟩}

theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ lsCategoryCount X Set.univ := by
  sorry

end TauCetiRoadmap.AlgebraicTopology
