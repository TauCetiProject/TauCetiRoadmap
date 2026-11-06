import Mathlib
import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
import TauCeti.AlgebraicTopology.Cohomology.Kronecker
import TauCeti.AlgebraicTopology.Cohomology.HomotopyInvariance
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
import TauCeti.AlgebraicTopology.Cohomology.Basic
import TauCeti.AlgebraicTopology.Cohomology.Twisted.Relative
import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cup
import TauCeti.AlgebraicTopology.Cellular.Comparison
import TauCeti.AlgebraicTopology.Cellular.Coproduct
import TauCeti.AlgebraicTopology.FundamentalGroupoid.Cech.Colimit
import TauCeti.AlgebraicTopology.Singular.Excision
import TauCeti.AlgebraicTopology.Singular.MayerVietoris.Basic
import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
import TauCeti.AlgebraicTopology.Singular.Sphere
import TauCeti.AlgebraicTopology.Singular.DiskSphere
import TauCeti.AlgebraicTopology.Singular.EilenbergZilber
import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.Singular
import TauCeti.Topology.Homotopy.HomotopyGroup.Map
import TauCeti.Topology.Homotopy.HomotopyGroup.Product
import TauCeti.Topology.Homotopy.Extension.CWComplex
import TauCeti.Topology.Homotopy.Extension.DeformationRetract
import TauCeti.Topology.Homotopy.Extension.MappingCylinder
import TauCeti.AlgebraicTopology.Singular.Empty
import TauCeti.AlgebraicTopology.Singular.Twisted.ConstantNaturality
import TauCetiRoadmap.DifferentialGeometry.Suggested

/-!
# Algebraic topology of spaces and manifolds: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below suggest Lean forms for load-bearing interfaces in Mathlib's
vocabulary; proving them does not by itself finish a stage or the roadmap.
-/

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

private abbrev SingularChains (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) : ChainComplex (ModuleCat.{u} R) ℕ :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).obj X

private abbrev SingularHomology (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
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

/-- The quotient of absolute chains on `X` by absolute chains on `A`. -/
noncomputable def relativeChainQuotient (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) : ChainComplex (ModuleCat.{u} R) ℕ :=
  cokernel (((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map X.map)

/-- The `SSetPair` construction is naturally the quotient `C_*(X) / C_*(A)`. -/
noncomputable def relativeSingularChainComplexIsoQuotient (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) (X : TopPair.{u}) :
    (((relativeSingularChainComplex R).obj M).obj X) ≅ relativeChainQuotient R M X :=
  (X.isColimitCokernelCoforkSingularChainComplex M).coconePointUniqueUpToIso
    (colimit.isColimit _)

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

/-- A chosen representative on the native complex; naturality is only up to chain homotopy. -/
noncomputable def cellularToSingular (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)] :
    cellularChainComplex R X ⟶ SingularChains R (ModuleCat.of R R) (TopCat.of X) := by
  sorry

theorem cellularToSingular_quasiIso (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] [CWComplex (Set.univ : Set X)] :
    QuasiIso (cellularToSingular R X) := by
  sorry

/-! ## Finite covers, transfer, and Cartan--Leray -/

/-- A finite cover of constant degree. General finite covers are handled componentwise. -/
structure FiniteCover (E B : TopCat.{u}) where
  p : E ⟶ B
  isCoveringMap : IsCoveringMap p
  degree : ℕ
  finite_fiber : ∀ b : B, Finite {e : E // p e = b}
  fiber_card : ∀ b : B, Nat.card {e : E // p e = b} = degree

noncomputable def finiteCoverTransfer (R : Type u) [CommRing R] :
    ∀ (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B),
      SingularChains R M B ⟶ SingularChains R M E := by
  sorry

theorem finiteCover_transfer_push (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (D : FiniteCover E B) :
    finiteCoverTransfer R M D ≫
      ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map D.p =
        D.degree • 𝟙 _ := by
  sorry

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

/-- The native quotient-cover vocabulary includes the actual surjectivity proof. -/
theorem RegularDeckAction.isQuotientCoveringMap {E B : TopCat.{u}}
    {P : FiniteCover E B} {G : Type u} [Group G] (D : RegularDeckAction P G) :
    letI := D.mulAction
    IsQuotientCoveringMap P.p G := by
  sorry

theorem finiteCover_push_transfer_regular (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] [Fintype G] (D : RegularDeckAction P G) :
    ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map P.p ≫
      finiteCoverTransfer R M P =
        ∑ g : G,
            ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map
            (TopCat.ofHom ⟨D.deck g, (D.deck g).continuous_toFun⟩) := by
  sorry

/-- The left deck action on the actual constant-coefficient singular complex. -/
noncomputable abbrev regularDeckChainMap (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) (g : G) :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map
    (TopCat.ofHom ⟨D.deck g, (D.deck g).continuous_toFun⟩)

/-- Bundle that deck action in the native representation category degree by degree. -/
noncomputable def regularDeckSingularComplex (R : Type u) [CommRing R] :
    ∀ (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
      (G : Type u) [Group G] (D : RegularDeckAction P G),
      ChainComplex (Rep.{u} R G) ℕ := by
  sorry

noncomputable def regularDeckSingularComplexForgetIso (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) :
    ((forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).mapHomologicalComplex
      (ComplexShape.down ℕ)).obj (regularDeckSingularComplex R M P G D) ≅
      SingularChains R M E := by
  sorry

/-- The forgetful comparison identifies the coefficient action with deck pushforward. -/
theorem regularDeckSingularComplex_action (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) (q : ℕ) (g : G) :
    ModuleCat.ofHom (((regularDeckSingularComplex R M P G D).X q).ρ g) ≫
      (regularDeckSingularComplexForgetIso R M P G D).hom.f q =
        (regularDeckSingularComplexForgetIso R M P G D).hom.f q ≫
          (regularDeckChainMap R M P G D g).f q := by
  sorry

/-- Quotient chains compute B because D.pSurjective is part of the input. -/
noncomputable def regularCoverCoinvariantsChainsIso (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) :
    ((Rep.coinvariantsFunctor R G).mapHomologicalComplex (ComplexShape.down ℕ)).obj
      (regularDeckSingularComplex R M P G D) ≅ SingularChains R M B := by
  sorry

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

noncomputable def cartanLeraySpectralSequence (R : Type u) [CommRing R] :
    ∀ (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
      (G : Type u) [Group G] [Fintype G] (D : RegularDeckAction P G),
      SpectralSequence (ModuleCat.{u} R)
        (fun r ↦ ComplexShape.spectralSequenceNat ⟨-r, r - 1⟩) 2 := by
  sorry

noncomputable def cartanLerayE2Iso (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] [Fintype G] (D : RegularDeckAction P G) (p q : ℕ) :
    ((cartanLeraySpectralSequence R M P G D).page 2).X ⟨p, q⟩ ≅
      _root_.groupHomology (coverHomologyRep R M P G D q) p := by
  sorry

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

/-- Scalar restriction commutes with relative twisted chains, sending every relative
simplex with coefficient ℓ to that same simplex with coefficient ℓ. -/
noncomputable def twistedRestrictScalarsChainIso (R : Type) [CommRing R]
    (P : TopPair) (L : LocalCoefficientSystem R P.fst) :
    P.twistedChainComplex (restrictCoefficientSystem R P.fst L) ≅
      ((ModuleCat.restrictScalars (Int.castRingHom R)).mapHomologicalComplex
        (ComplexShape.down ℕ)).obj (P.twistedChainComplex L) := by
  sorry

/-- This generator identity fixes the scalar-comparison map, including its sign. -/
theorem twistedRestrictScalarsChainIso_simplex (R : Type) [CommRing R]
    (P : TopPair) (L : LocalCoefficientSystem R P.fst) (k : ℕ)
    (σ : (TopCat.toSSet.obj P.fst).obj (Opposite.op (SimplexCategory.mk k)))
    (ℓ : L.obj (TauCeti.LocalCoefficientSystem.initialVertex σ)) :
    (twistedRestrictScalarsChainIso R P L).hom.f k
      ((P.twistedChainComplexπ (restrictCoefficientSystem R P.fst L)).f k
        ((restrictCoefficientSystem R P.fst L).ιTwistedChainComplex k σ ℓ)) =
      (P.twistedChainComplexπ L).f k (L.ιTwistedChainComplex k σ ℓ) := by
  sorry

/-- Homology comparison is induced by the normalized chain isomorphism and the native
exact-functor homology comparison, rather than a separately chosen fibre isomorphism. -/
noncomputable def twistedRestrictScalarsHomologyIso (R : Type) [CommRing R]
    (P : TopPair) (L : LocalCoefficientSystem R P.fst) (n : ℕ) :
    twistedRelativeHomology ℤ P (restrictCoefficientSystem R P.fst L) n ≅
      (ModuleCat.restrictScalars (Int.castRingHom R)).obj
        (twistedRelativeHomology R P L n) :=
  HomologicalComplex.homologyMapIso (twistedRestrictScalarsChainIso R P L) n ≪≫
    ((P.twistedChainComplex L).sc n).mapHomologyIso
      (ModuleCat.restrictScalars (Int.castRingHom R))

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

/-! ### Fresh-copy Euclidean rechart of an arbitrary model interior

The interior is carried by a fresh type indexed by the linear reparameterization `e`.
Its preferred charts are `e ∘ I ∘ chartAt`; the original manifold retains its charted-space
instance.
-/

namespace FreshInteriorRechart

abbrev EuclideanModel (m : ℕ) := modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))

structure Carrier {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) where
  point : I.interior M

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
variable [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
variable (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
variable (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))

local notation "C" => Carrier (E := E) (H := H) (M := M) I m e

instance carrierTopologicalSpace : TopologicalSpace C :=
  TopologicalSpace.induced (fun x => x.point) inferInstance

noncomputable def carrierEquivInterior : C ≃ I.interior M :=
  Equiv.mk (fun x => x.point) (fun x => ⟨x⟩)
    (by intro x; cases x; rfl) (by intro x; rfl)

/-- The carrier is homeomorphic to the actual interior subtype, without a boundaryless
hypothesis. -/
noncomputable def carrierHomeomorphInterior : C ≃ₜ I.interior M where
  toEquiv := carrierEquivInterior I m e
  continuous_toFun := continuous_induced_dom
  continuous_invFun := continuous_induced_rng.mpr continuous_id

instance carrierT2Space [T2Space M] : T2Space C := by
  let : T2Space (I.interior M) := inferInstance
  exact (carrierHomeomorphInterior I m e).symm.t2Space

instance carrierSecondCountable [SecondCountableTopology M] : SecondCountableTopology C := by
  let : SecondCountableTopology (I.interior M) := inferInstance
  exact (carrierHomeomorphInterior I m e).secondCountableTopology

/-- Preferred charts on the fresh carrier. The exact coordinate formula is recorded in
`chartAt_apply`; the geometric construction is the restriction of the original extended chart to
the open interior, followed by the linear homeomorphism `e`. -/
noncomputable def chartAt [IsManifold I ∞ M] :
    (x : C) → OpenPartialHomeomorph C (EuclideanSpace ℝ (Fin m)) := by
  sorry

theorem chartAt_mem_source (x : C) :
    x ∈ (chartAt I m e x).source := by
  sorry

/-- Exact arbitrary-point chart formula, including the chosen reparameterization `e`. -/
theorem chartAt_apply (x y : C)
    (hy : y ∈ (chartAt I m e x).source) :
    chartAt I m e x y = e (I ((_root_.chartAt H (x.point : M)) (y.point : M))) := by
  sorry

@[instance_reducible]
noncomputable def chartedSpace :
    ChartedSpace (EuclideanSpace ℝ (Fin m)) C where
  atlas := Set.range (chartAt I m e)
  chartAt := chartAt I m e
  mem_chart_source := chartAt_mem_source I m e
  chart_mem_atlas := fun _ => Set.mem_range_self _

theorem isManifold :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C :=
      chartedSpace I m e
    IsManifold (EuclideanModel m) ∞ C := by
  sorry

/-- The inclusion of the recharted interior carrier into the original manifold is smooth for
every model with corners, including manifolds with boundary. -/
theorem valContMDiff :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := chartedSpace I m e
    letI : IsManifold (EuclideanModel m) ∞ C := isManifold I m e
    ContMDiff (EuclideanModel m) I ∞ (fun x : C => (x.point : M)) := by
  sorry

/-- At each point of the interior carrier, inclusion into the original manifold is a local
diffeomorphism. The source is boundaryless Euclidean space; the target point is interior even
when the ambient manifold itself has boundary. The coordinate derivative is `e.symm`, since the
carrier chart is `e ∘ I ∘ chartAt`. -/
theorem isLocalDiffeomorph_val (x : C) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := chartedSpace I m e
    letI : IsManifold (EuclideanModel m) ∞ C := isManifold I m e
    IsLocalDiffeomorphAt (EuclideanModel m) I ∞ (fun y : C => (y.point : M)) x := by
  sorry

/-- The derivative of the carrier inclusion, expressed in the tangent models, is the inverse
linear reparameterization. This is the precise chart formula used by the inverse-function
theorem above. -/
theorem mfderiv_val (x : C) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := chartedSpace I m e
    letI : IsManifold (EuclideanModel m) ∞ C := isManifold I m e
    mfderiv (EuclideanModel m) I (fun y : C => (y.point : M)) x =
      (e.symm : EuclideanSpace ℝ (Fin m) →L[ℝ] E) := by
  sorry

/-- Since the target Euclidean model is `modelWithCornersSelf`, boundarylessness follows from
Mathlib's native `ModelWithCorners.Boundaryless` instance, independently of whether `M` has
boundary. -/
theorem boundaryless :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C :=
      chartedSpace I m e
    BoundarylessManifold (EuclideanModel m) C := by
  dsimp [EuclideanModel]
  infer_instance

noncomputable def carrierHomeomorphOriginal [BoundarylessManifold I M] :
    C ≃ₜ M := by
  sorry

theorem carrierHomeomorphOriginal_apply [BoundarylessManifold I M] (x : C) :
    carrierHomeomorphOriginal I m e x = (x.point : M) := by
  sorry

noncomputable instance carrierSigmaCompact [SigmaCompactSpace M] : SigmaCompactSpace C := by
  have : SecondCountableTopology H := I.secondCountableTopology
  have : SecondCountableTopology M := ChartedSpace.secondCountable_of_sigmaCompact H M
  have : LocallyCompactSpace E := inferInstance
  have : LocallyCompactSpace H := I.locallyCompactSpace
  have : LocallyCompactSpace M := ChartedSpace.locallyCompactSpace H M
  have : LocallyCompactSpace (I.interior M) :=
    (I.isOpen_interior (M := M) (n := ∞) (by simp)).locallyCompactSpace
  have : LocallyCompactSpace C :=
    (carrierHomeomorphInterior I m e).locallyCompactSpace_iff.mpr inferInstance
  infer_instance

end FreshInteriorRechart

/-- Boundaryless orientation system; the README additionally specifies the collar extension
for half-space models and comparison with the smooth tangent orientation. -/
noncomputable def orientationLocalSystem (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] :
    LocalCoefficientSystem ℤ (TopCat.of M) where
  obj := fun x => twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x.as)
    ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
      (ModuleCat.of ℤ ℤ)) m
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

/-- The orientation fibre is integral local top homology, not a separately chosen sign module. -/
noncomputable def orientationLocalSystemFiberIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] (x : M) :
    (orientationLocalSystem m M).obj ⟨x⟩ ≅
      twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
        ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
          (ModuleCat.of ℤ ℤ)) m := Iso.refl _

/-- The square orientation pairing is natural in paths, not merely a fibrewise choice.
`orientationFiberSquareIso_self` pins its o⊗o normalization. Since each fibre
is free of rank one over ℤ, this normalization makes the pairing unique and
compatible with orientation transport. -/
noncomputable def orientationFiberSquareIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] (x : M) :
    ((orientationLocalSystem m M).obj ⟨x⟩) ⊗[ℤ]
      ((orientationLocalSystem m M).obj ⟨x⟩) ≃ₗ[ℤ] ℤ := by
  sorry

/-- Canonical normalization: any integral orientation generator paired with itself is 1. -/
theorem orientationFiberSquareIso_self (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (x : M) (o : (orientationLocalSystem m M).obj ⟨x⟩)
    (_ho : Submodule.span ℤ {o} = ⊤) :
    orientationFiberSquareIso m M x (o ⊗ₜ[ℤ] o) = 1 := by
  sorry

/-- Actual pair inclusion from support on B to support at x∈B. -/
noncomputable def supportLocalPairMap (X : TopCat.{u}) (B : Set X) (x : X) (hx : x ∈ B) :
    TopPair.ofSubset Bᶜ ⟶ puncturedPair X x :=
  TopPair.ofSubsetMap (𝟙 X) (fun y hy => by
    change y ≠ x
    intro h
    exact hy (h.symm ▸ hx))

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

/-- Top local homology is a path-transport functor on a boundaryless manifold.
The construction uses excision on coordinate balls, not arbitrary spaces. -/
noncomputable def localTopHomologySystem (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) :
    LocalCoefficientSystem R (TopCat.of M) where
  obj := fun x => twistedRelativeHomology R (puncturedPair (TopCat.of M) x.as) L m
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

/-- The transport functor's fibre is actual twisted local homology. -/
noncomputable def localTopHomologyFiberIso (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M) :
    (localTopHomologySystem R m M L).obj ⟨x⟩ ≅
      twistedRelativeHomology R (puncturedPair (TopCat.of M) x) L m := Iso.refl _

/-- The orientation twist puts the coefficient factor first, so R acts on it.
Its path maps are tensor products of coefficient and orientation transport. -/
noncomputable def orientationTensorLocalSystem (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) :
    LocalCoefficientSystem R (TopCat.of M) where
  obj := fun x => ModuleCat.of R ((L.obj x) ⊗[ℤ] ((orientationLocalSystem m M).obj x))
  map := fun p => ModuleCat.ofHom
    (TensorProduct.AlgebraTensorModule.map (L.map p).hom
      ((orientationLocalSystem m M).map p).hom)
  map_id := by sorry
  map_comp := by sorry

noncomputable def orientationTensorFiberIso (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M) :
    (orientationTensorLocalSystem R m M L).obj ⟨x⟩ ≅
      ModuleCat.of R ((L.obj ⟨x⟩) ⊗[ℤ] ((orientationLocalSystem m M).obj ⟨x⟩)) := Iso.refl _

/-- Natural comparison of functors, with the normalization theorem below fixing its sign. -/
noncomputable def localTopOrientationTensorNatIso (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) :
    localTopHomologySystem R m M L ≅ orientationTensorLocalSystem R m M L := by
  sorry

/-- Excision transport inside an open B preserves the local images of one class supported
on B. This ties path transport directly to the actual supported-relative homology maps. -/
theorem localTopHomologySystem_transport_supported (R : Type) [CommRing R]
    (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (B : TopologicalSpace.Opens (TopCat.of M)) (x y : B)
    (p : (⟨x⟩ : FundamentalGroupoid B) ⟶ ⟨y⟩)
    (c : twistedRelativeHomology R (TopPair.ofSubset ((B : Set (TopCat.of M))ᶜ)) L m) :
    (localTopHomologySystem R m M L).map
      ((FundamentalGroupoid.map
        (⟨Subtype.val, continuous_subtype_val⟩ : C(B, TopCat.of M))).map p)
      (twistedSupportLocalMap R (TopCat.of M) L m (B : Set (TopCat.of M)) x.val x.property c) =
      twistedSupportLocalMap R (TopCat.of M) L m (B : Set (TopCat.of M)) y.val y.property c := by
  sorry

/-- Multiply an integral relative cycle by a fibre coefficient, using transport from x
on a coordinate ball and excision. This is the coefficient-extension construction [c·ℓ]. -/
noncomputable def localCoefficientExtensionClass (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M) :
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) → (ℓ : L.obj ⟨x⟩) →
    twistedRelativeHomology R (puncturedPair (TopCat.of M) x) L m := by
  sorry

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

/-- The open-excision restriction pin applies to every coordinate ball with its boundaryless
atlas, viewed as an open embedding U→M; both carriers use explicit manifold instances. -/
theorem localCoefficientExtensionClass_open (R : Type) [CommRing R] (m : ℕ) (U M : Type)
    [TopologicalSpace U] [T2Space U] [SecondCountableTopology U]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) U]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ U]
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (f : TopCat.of U ⟶ TopCat.of M) (hf : Function.Injective f) (_ho : IsOpenMap f)
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : U)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of U) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of U)).obj
        (ModuleCat.of ℤ ℤ)) m) (ℓ : L.obj ⟨f x⟩) :
    localCoefficientExtensionClass R m M L (f x)
      (embeddingIntegralLocalMap f hf x m c) ℓ =
      TopPair.twistedHomologyMap (embeddingLocalPairMap f hf x) L m
        (localCoefficientExtensionClass R m U
          ((TauCeti.LocalCoefficientSystem.pullback f.hom).obj L) x c ℓ) := by
  sorry

/-- For every R, a trivialization after scalar restriction pins extension by the actual
integral coefficient homology map. The scalar comparison is fixed on chain generators. -/
theorem localCoefficientExtensionClass_trivialized_R (R : Type) [CommRing R]
    (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (N : ModuleCat ℤ)
    (τ : ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj N) ≅
      restrictCoefficientSystem R (TopCat.of M) L)
    (x : M) (ℓ : N)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) :
    (twistedRestrictScalarsHomologyIso R (puncturedPair (TopCat.of M) x) L m).inv
      (localCoefficientExtensionClass R m M L x c (τ.hom.app ⟨x⟩ ℓ)) =
      (puncturedPair (TopCat.of M) x).twistedHomologyCoefficientMap
        (((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).map
          (ModuleCat.ofHom (LinearMap.toSpanSingleton ℤ N ℓ))) ≫ τ.hom) m c := by
  sorry

/-- Coefficient multiplication is R-linear in the fibre coefficient. -/
theorem localCoefficientExtensionClass_smul (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) (r : R) (ℓ : L.obj ⟨x⟩) :
    localCoefficientExtensionClass R m M L x c (r • ℓ) =
      r • localCoefficientExtensionClass R m M L x c ℓ := by
  sorry

/-- Orientation and coefficient transport determine the transport of extension classes. -/
theorem localCoefficientExtensionClass_transport (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x y : M)
    (p : (⟨x⟩ : FundamentalGroupoid M) ⟶ ⟨y⟩)
    (o : (orientationLocalSystem m M).obj ⟨x⟩) (ℓ : L.obj ⟨x⟩) :
    (localTopHomologySystem R m M L).map p
      (localCoefficientExtensionClass R m M L x o ℓ) =
      localCoefficientExtensionClass R m M L y
        ((orientationLocalSystem m M).map p o) (L.map p ℓ) := by
  sorry

/-- On a trivialized ball, extension is the native coefficient homology map for
z ↦ z·ℓ. Taking M to be that ball expresses the transport-trivialization pin. -/
theorem localCoefficientExtensionClass_trivialized (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem ℤ (TopCat.of M)) (N : ModuleCat ℤ)
    (τ : ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj N) ≅ L)
    (x : M) (ℓ : N)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) :
    localCoefficientExtensionClass ℤ m M L x c (τ.hom.app ⟨x⟩ ℓ) =
      (puncturedPair (TopCat.of M) x).twistedHomologyCoefficientMap
        (((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).map
          (ModuleCat.ofHom (LinearMap.toSpanSingleton ℤ N ℓ))) ≫ τ.hom) m c := by
  sorry

/-- The unit pin excludes a sign change in the integral coefficient-extension map. -/
theorem localCoefficientExtensionClass_constant_one (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (x : M)
    (c : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) :
    localCoefficientExtensionClass ℤ m M
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) x c (1 : ℤ) = c := by
  sorry

/-- Extension is bilinear over ℤ in the integral class and the coefficient. -/
theorem localCoefficientExtensionClass_add (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (c c' : twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m) (ℓ ℓ' : L.obj ⟨x⟩) :
    (localCoefficientExtensionClass R m M L x (c + c') ℓ =
      localCoefficientExtensionClass R m M L x c ℓ +
        localCoefficientExtensionClass R m M L x c' ℓ) ∧
    (localCoefficientExtensionClass R m M L x c (ℓ + ℓ') =
      localCoefficientExtensionClass R m M L x c ℓ +
        localCoefficientExtensionClass R m M L x c ℓ') := by
  sorry

/-- The comparison sends the actual coefficient-extension class to its elementary tensor.
Negating the natural comparison violates this normalization. -/
theorem localTopOrientationTensorNatIso_coefficientExtension (R : Type) [CommRing R]
    (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (x : M)
    (o : (orientationLocalSystem m M).obj ⟨x⟩) (ℓ : L.obj ⟨x⟩) :
    (orientationTensorFiberIso R m M L x).hom
      ((localTopOrientationTensorNatIso R m M L).hom.app ⟨x⟩
        ((localTopHomologyFiberIso R m M L x).inv
          (localCoefficientExtensionClass R m M L x
            ((orientationLocalSystemFiberIso m M x).hom o) ℓ))) = ℓ ⊗ₜ[ℤ] o := by
  sorry

/-- Integral fibre form of the same normalized comparison, with coefficients first. -/
noncomputable def localTopOrientationTensorIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem ℤ (TopCat.of M)) (x : M) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x) L m ≃ₗ[ℤ]
      (L.obj ⟨x⟩) ⊗[ℤ] ((orientationLocalSystem m M).obj ⟨x⟩) :=
  by sorry

/-- The integral fibre equivalence has the same coefficient-extension normalization as
its natural functor form, with the coefficient factor first. -/
theorem localTopOrientationTensorIso_coefficientExtension (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem ℤ (TopCat.of M)) (x : M)
    (o : (orientationLocalSystem m M).obj ⟨x⟩) (ℓ : L.obj ⟨x⟩) :
    localTopOrientationTensorIso m M L x
      (localCoefficientExtensionClass ℤ m M L x
        ((orientationLocalSystemFiberIso m M x).hom o) ℓ) = ℓ ⊗ₜ[ℤ] o := by
  sorry

set_option maxHeartbeats 800000 in
/-- The compact-support existence and uniqueness theorem consumes the actual local section. -/
theorem compactSupportTopClass_existsUnique (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (L : LocalCoefficientSystem R (TopCat.of M)) (K V : Set (TopCat.of M))
    (_hK : IsCompact K) (_hV : IsOpen V) (hKV : K ⊆ V)
    (s : LocallyRepresentedTopSection R (TopCat.of M) L m V) :
    ∃! c : twistedRelativeHomology R (TopPair.ofSubset Kᶜ) L m,
      ∀ x : TopCat.of M, ∀ hx : x ∈ K,
        twistedSupportLocalMap R (TopCat.of M) L m K x hx c =
          s.localValue x (hKV hx) := by
  sorry

/-- Canonical square-normalized local image, defined as the preimage of 1.
No orientation generator is selected. -/
noncomputable def canonicalTwistedLocalGenerator (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] (x : M) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      (orientationLocalSystem m M) m :=
  (localTopOrientationTensorIso m M (orientationLocalSystem m M) x).symm
    ((orientationFiberSquareIso m M x).symm 1)

/-- The canonical local images satisfy the actual neighborhood-section condition. -/
noncomputable def canonicalTwistedTopSection (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M] :
    LocallyRepresentedTopSection ℤ (TopCat.of M) (orientationLocalSystem m M) m Set.univ where
  localValue := fun x _ => canonicalTwistedLocalGenerator m M x
  locally_represented := by sorry

/-- Local orientation data: a global class whose image generates every local top homology
module. The maps are induced by `(X, ∅) ⟶ (X, X \ {x})`. -/
structure FundamentalClassDatum (R : Type u) [CommRing R] (X : TopCat.{u}) (n : ℕ) where
  fundamentalClass : ((relativeSingularHomology R n).obj (ModuleCat.of R R)).obj
    (TopPair.incl.obj X)
  spans : ∀ x : X,
    Submodule.span R
      {((relativeSingularHomology R n).obj (ModuleCat.of R R)).map
        (TopPair.j (puncturedPair X x)) fundamentalClass} = ⊤

noncomputable def poincareDualityMap (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n p : ℕ) (_hp : p ≤ n) :
    (c : FundamentalClassDatum R X n) →
      singularCohomology R X p ⟶ SingularHomology R (ModuleCat.of R R) X (n - p) := by
  sorry

/-- Compact Hausdorff second-countable manifolds with a fundamental class satisfy duality. The
orientation-local-system version precedes this constant-coefficient corollary in the roadmap. -/
theorem poincareDualityMap_isIso (R : Type u) [CommRing R] (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M]
    (p : ℕ) (hp : p ≤ n) (c : FundamentalClassDatum R (TopCat.of M) n) :
    IsIso (poincareDualityMap R (TopCat.of M) n p hp c) := by
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

/-! ## Relative Hurewicz -/

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

/-- Relative homotopy in degrees at least two is group-valued. In particular, the degree-two
group is not assumed commutative. The implementation uses the same based-cube model as Mathlib's
`HomotopyGroup`. -/
noncomputable def relativeHomotopyGroup :
    (n : ℕ) → (hn : 2 ≤ n) → (X : BasedTopPair.{u}) → GrpCat.{u} := by
  sorry

/-- A basepoint-preserving map of pairs induces the relative homotopy homomorphism. -/
noncomputable def BasedTopPair.Hom.relativeHomotopyMap {X Y : BasedTopPair.{u}} :
    (f : X.Hom Y) → (n : ℕ) → (hn : 2 ≤ n) →
      relativeHomotopyGroup n hn X ⟶ relativeHomotopyGroup n hn Y := by
  sorry

/-- The based homotopy group of the subspace, used as the target of the relative boundary map. -/
noncomputable def basedSubspaceHomotopyGroup :
    (n : ℕ) → (hn : 1 ≤ n) → (X : BasedTopPair.{u}) → GrpCat.{u} := by
  sorry

/-- The boundary of a relative cube lands in the subspace at its stored basepoint. -/
noncomputable def relativeHomotopyBoundary (n : ℕ) (hn : 2 ≤ n)
    (X : BasedTopPair.{u}) :
    relativeHomotopyGroup n hn X ⟶ basedSubspaceHomotopyGroup (n - 1) (by omega) X := by
  sorry

/-- Changing the chosen subspace point along a path gives the standard relative-homotopy
basepoint-change isomorphism. -/
noncomputable def relativeHomotopyChangeBasepoint :
    (n : ℕ) → (hn : 2 ≤ n) → (X : BasedTopPair.{u}) →
      (a : X.pair.snd) → (path : Path X.basepoint a) →
      relativeHomotopyGroup n hn X ≅
        relativeHomotopyGroup n hn { pair := X.pair, basepoint := a } := by
  sorry

/-- The integral module attached to the abelianization of the relative homotopy group. This is
the natural source of Hurewicz before any commutativity theorem. -/
noncomputable def relativeHomotopyAbelianization :
    (n : ℕ) → (hn : 2 ≤ n) → (X : BasedTopPair.{u}) → ModuleCat.{u} ℤ := by
  sorry

/-- The quotient map from relative homotopy to its abelianization, displayed on underlying
carriers so that the general group-valued source is not silently strengthened. -/
noncomputable def relativeHomotopyToAbelianization (n : ℕ) (hn : 2 ≤ n)
    (X : BasedTopPair.{u}) :
    relativeHomotopyGroup n hn X → relativeHomotopyAbelianization n hn X := by
  sorry

/-- From degree three onward, relative homotopy itself has its canonical integral-module
structure. -/
noncomputable def relativeHomotopyModule :
    (n : ℕ) → (hn : 3 ≤ n) → (X : BasedTopPair.{u}) → ModuleCat.{u} ℤ := by
  sorry

/-- In the stable relative range, the module carrier agrees with the abelianization carrier. -/
noncomputable def relativeHomotopyModuleIsoAbelianization (n : ℕ) (hn : 3 ≤ n)
    (X : BasedTopPair.{u}) :
    relativeHomotopyModule n hn X ≅ relativeHomotopyAbelianization n (by omega) X := by
  sorry

/-- Relative Hurewicz is defined on the abelianization of a based pair in every degree at least
two. Its homology target forgets only the basepoint, not the underlying pair. -/
noncomputable def relativeHurewicz (n : ℕ) (hn : 2 ≤ n) (X : BasedTopPair.{u}) :
    relativeHomotopyAbelianization n hn X ⟶
      (relativeSingularHomology ℤ n).obj (ModuleCat.of ℤ (ULift.{u} ℤ)) |>.obj X.pair := by
  sorry

/-- At degree two, simple connectivity and relative one-connectivity force the generally
nonabelian relative group to be abelian. -/
theorem relativeHomotopyGroup_two_commutative (X : BasedTopPair.{u})
    (_hNDR : NDRPairData X.pair)
    [SimplyConnectedSpace X.pair.fst] [SimplyConnectedSpace X.pair.snd] :
    ∀ a b : relativeHomotopyGroup 2 (Nat.le_refl 2) X, a * b = b * a := by
  sorry

/-- Consequently the quotient to the degree-two abelianization is bijective; commutativity is a
theorem under the Hurewicz hypotheses, not part of the general carrier. -/
theorem relativeHomotopyToAbelianization_two_bijective (X : BasedTopPair.{u})
    (_hNDR : NDRPairData X.pair)
    [SimplyConnectedSpace X.pair.fst] [SimplyConnectedSpace X.pair.snd] :
    Function.Bijective (relativeHomotopyToAbelianization 2 (by omega) X) := by
  sorry

theorem relativeHurewicz_isIso (n : ℕ) (hn : 2 ≤ n) (X : BasedTopPair.{u})
    (_hNDR : NDRPairData X.pair)
    [SimplyConnectedSpace X.pair.fst] [SimplyConnectedSpace X.pair.snd]
    (_hvanish : ∀ i (hi : 2 ≤ i), i < n →
      Subsingleton (relativeHomotopyGroup i hi X)) :
    IsIso (relativeHurewicz n hn X) := by
  sorry

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

/-- A compact Hausdorff second-countable smooth manifold has a concrete finite CW model. -/
noncomputable def compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    FiniteCWTypeModel M := by
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

/-! ## Selected Stage 8: ordinary classifying spaces and obstruction maps

The abelian model is supplied by DGFloer; `OrdinaryEMModel` records the input to the
comparison theorems, and is not another constructor. The simply connected obstruction
signatures below are an advisory specialization of the definitive local-system scope.
-/

/-- Stage 4.7 supplies the single CW structure for geometric realizations. -/
@[instance_reducible] noncomputable def simplicialRealizationCW (K : SSet.{u}) :
    CWComplex (Set.univ : Set (SSet.toTop.obj K)) := by
  sorry

theorem simplicialRealizationT2 (K : SSet.{u}) : T2Space (SSet.toTop.obj K) := by
  sorry

/-- The cell indices are the actual nondegenerate simplices. -/
noncomputable def simplicialRealizationCellEquiv (K : SSet.{u}) (n : ℕ) :
    letI := simplicialRealizationCW K
    Topology.RelCWComplex.cell (Set.univ : Set (SSet.toTop.obj K)) n ≃
      {x : K _⦋n⦌ // x ∈ K.nonDegenerate n} := by
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

/-- The realized nerve edge has a concrete underlying map, using the native
Δ[1]≅I with weights (1-t,t); only its endpoint proofs are proposed targets. -/
noncomputable def groupClassifyingSpaceEdge (G : Type u) [Group G] (g : G) :
    Path (groupClassifyingSpaceBasepoint G) (groupClassifyingSpaceBasepoint G) where
  toFun t :=
    SSet.toTop.map (SSet.yonedaEquiv.symm
      (CategoryTheory.ComposableArrows.mk₁
        (show SingleObj.star G ⟶ SingleObj.star G from g)))
      (SSet.stdSimplex.toTopObjIsoI.inv (ULift.up t))
  continuous_toFun := by fun_prop
  source' := by sorry
  target' := by sorry

noncomputable def groupClassifyingSpaceFundamentalGroup (G : Type u) [Group G] :
    FundamentalGroup (groupClassifyingSpace G) (groupClassifyingSpaceBasepoint G) ≃* G := by
  sorry

theorem groupClassifyingSpaceFundamentalGroup_edge (G : Type u) [Group G] (g : G) :
    groupClassifyingSpaceFundamentalGroup G
      (FundamentalGroup.fromPath ⟦groupClassifyingSpaceEdge G g⟧) = g := by
  sorry

/-- Input supplied by the shared abelian constructors, with a chosen normalized identification.
Vanishing is for every other positive degree, with no finite-dimension condition. -/
structure OrdinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] where
  space : TopCat.{u}
  point : space
  hausdorff : T2Space space
  cw : CWComplex (Set.univ : Set space)
  connected : PathConnectedSpace space
  homotopyIdentification : HomotopyGroup (Fin n) space point ≃* Multiplicative A
  vanishing : ∀ j : ℕ, 0 < j → j ≠ n →
    Subsingleton (HomotopyGroup (Fin j) space point)

/-- Coefficient-functorial supplier input. The definitive DGFloer constructor pins its
spaces to bar in degree one and Dold–Kan in higher degree; this interface records its
normalized maps without adding a constructor in AT. -/
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

/-- The single family supplied by the degree-one bar and higher Dold–Kan constructors. -/
noncomputable def ordinaryEilenbergMacLaneFamily : NormalizedAbelianEMFamily.{u} := by
  sorry

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

theorem ordinaryEilenbergMacLaneFamily_one_space (A : AddCommGrpCat.{u}) :
    (ordinaryEilenbergMacLaneFamily.model A 1).space =
      groupClassifyingSpace (Multiplicative A) := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_one_point (A : AddCommGrpCat.{u}) :
    eqToHom (ordinaryEilenbergMacLaneFamily_one_space A)
      (ordinaryEilenbergMacLaneFamily.model A 1).point =
        groupClassifyingSpaceBasepoint (Multiplicative A) := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_one_identification (A : AddCommGrpCat.{u})
    (p : HomotopyGroup (Fin 1) (ordinaryEilenbergMacLaneFamily.model A 1).space
      (ordinaryEilenbergMacLaneFamily.model A 1).point) :
    groupClassifyingSpaceFundamentalGroup (Multiplicative A)
      (HomotopyGroup.pi1MulEquivFundamentalGroup
        (HomotopyGroup.map (eqToHom (ordinaryEilenbergMacLaneFamily_one_space A)).hom
          (ordinaryEilenbergMacLaneFamily_one_point A) p)) =
      (ordinaryEilenbergMacLaneFamily.model A 1).homotopyIdentification p := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_higher_space (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (hn : 2 ≤ n) :
    (ordinaryEilenbergMacLaneFamily.model A n).space =
      SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n) := by
  sorry

theorem ordinaryEilenbergMacLaneFamily_higher_point (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (hn : 2 ≤ n) :
    eqToHom (ordinaryEilenbergMacLaneFamily_higher_space A n hn).symm
      (ordinaryDoldKanBasepoint A n) = (ordinaryEilenbergMacLaneFamily.model A n).point := by
  sorry

/-- Integral singular homology in the universe of the model's carrier. -/
abbrev ordinaryIntegralHomology (X : TopCat.{u}) (n : ℕ) :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
    (ModuleCat.of ℤ (ULift.{u} ℤ))).obj X

/-- The sphere carrier used by the normalized cubical representative comparison. -/
abbrev homotopySphere (n : ℕ) : TopCat.{u} :=
  TopCat.of (ULift.{u} (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1))

/-- The positive first-coordinate pole. -/
noncomputable def homotopySpherePole (n : ℕ) :
    Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 :=
  ⟨PiLp.single 2 0 (1 : ℝ), by simp⟩

/-- Stage 4.4's positive-dimensional quotient map, consumed by Stage 8.6. -/
noncomputable def cubicalSphereQuotient (n : ℕ) [NeZero n] :
    C((Fin n → unitInterval), Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) := by
  sorry

theorem cubicalSphereQuotient_boundary (n : ℕ) [NeZero n]
    (t : Fin n → unitInterval) (ht : t ∈ Cube.boundary (Fin n)) :
    cubicalSphereQuotient n t = homotopySpherePole n := by
  sorry

theorem cubicalSphereQuotient_isQuotientMap (n : ℕ) [NeZero n] :
    Topology.IsQuotientMap (cubicalSphereQuotient n) := by
  sorry

theorem cubicalSphereQuotient_eq_iff (n : ℕ) [NeZero n]
    (t s : Fin n → unitInterval) :
    cubicalSphereQuotient n t = cubicalSphereQuotient n s ↔
      t = s ∨ (t ∈ Cube.boundary (Fin n) ∧ s ∈ Cube.boundary (Fin n)) := by
  sorry

/-- The actual cube/boundary pair, lifted to the coefficient universe. -/
abbrev coordinateCubePair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := TopCat.of (ULift.{u} (Fin n → unitInterval)))
    {t | t.down ∈ Cube.boundary (Fin n)}

/-- The monotone simplex with vertices 0, e_(p0), e_(p0)+e_(p1), …, 1. -/
noncomputable def coordinateCubeSimplex (n : ℕ) :
    (p : Equiv.Perm (Fin n)) →
      C(Convexity.StdSimplex ℝ (Fin (n + 1)), (coordinateCubePair.{u} n).fst) := by
  sorry

/-- Barycentric coordinates determine the simplex, so its orientation cannot be reversed. -/
theorem coordinateCubeSimplex_coordinate (n : ℕ) (p : Equiv.Perm (Fin n))
    (t : Convexity.StdSimplex ℝ (Fin (n + 1))) (j : Fin n) :
    (((coordinateCubeSimplex.{u} n p t).down j) : ℝ) =
      ∑ k : Fin (n + 1), if (p⁻¹ j).val < k.val then t.weights k else 0 := by
  sorry

/-- The signed canonical triangulation, equivalently the ordered shuffle of n interval chains.
For n=1 this is t↦t with coefficient +1, whose boundary is [1]-[0]. -/
noncomputable def coordinateCubeReferenceChain (n : ℕ) :
    ((coordinateCubePair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).X n :=
  ((coordinateCubePair n).singularChainComplexπ (ModuleCat.of ℤ (ULift.{u} ℤ))).f n
    (∑ p : Equiv.Perm (Fin n),
      ((TopCat.toSSet.obj (coordinateCubePair n).fst).ιChainComplex
        (R := ModuleCat.of ℤ (ULift.{u} ℤ))
        (((coordinateCubePair n).fst.toSSetObjEquiv (Opposite.op ⦋n⦌)).symm
          (coordinateCubeSimplex n p))).hom (ULift.up (Equiv.Perm.sign p : ℤ)))

theorem coordinateCubeReferenceChain_cycle (n : ℕ) :
    (((coordinateCubePair.{u} n).singularChainComplex
      (ModuleCat.of ℤ (ULift.{u} ℤ))).d n ((ComplexShape.down ℕ).next n)).hom
      (coordinateCubeReferenceChain n) = 0 := by
  sorry

/-- The reference class is the homology class of the actual signed chain above. -/
noncomputable def coordinateCubeReferenceClass (n : ℕ) :
    (coordinateCubePair.{u} n).singularHomology (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  let K := (coordinateCubePair.{u} n).singularChainComplex
    (ModuleCat.of ℤ (ULift.{u} ℤ))
  K.homologyπ n (K.cyclesMk (coordinateCubeReferenceChain n) ((ComplexShape.down ℕ).next n)
    (by rfl) (coordinateCubeReferenceChain_cycle n))

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

/-- Honest orientation-preserving pair comparison; its homology value below fixes +1. -/
noncomputable def coordinateCubeSimplexOrientationComparison (n : ℕ) :
    coordinateCubePair.{u} n ⟶ coordinateSimplexPair.{u} n := by sorry

theorem coordinateCubeSimplexOrientationComparison_reference (n : ℕ) :
    (TopPair.singularHomologyMap (C := ModuleCat.{u} ℤ)
      (coordinateCubeSimplexOrientationComparison n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom (coordinateCubeReferenceClass n) =
      coordinateSimplexIdentityClass n := by sorry

/-- Actual realization of the counit-labelled simplex, precomposed with the
+1 cube-to-ordered-simplex comparison; only the boundary proof is a target. -/
noncomputable def ordinaryDoldKanLabeledCubicalLoop (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (a : A) :
    GenLoop (Fin n) (SSet.toTop.obj (ordinaryDoldKanSimplicialModel A n))
      (ordinaryDoldKanBasepoint A n) :=
  ⟨⟨fun t =>
      SSet.toTop.map (SSet.yonedaEquiv.symm (ordinaryDoldKanLabeledSimplex A n a))
        ((SSet.toTopSimplex.app ⦋n⦌).inv
          (TopPair.Hom.fst (coordinateCubeSimplexOrientationComparison.{u} n) (ULift.up t))),
      by
        exact (SSet.toTop.map (SSet.yonedaEquiv.symm
          (ordinaryDoldKanLabeledSimplex A n a))).hom.continuous.comp
          ((SSet.toTopSimplex.app ⦋n⦌).inv.hom.continuous.comp
            ((TopPair.Hom.fst (coordinateCubeSimplexOrientationComparison.{u} n)).hom.continuous.comp
              continuous_uliftUp))⟩, by sorry⟩

/-- The family identification is fixed on actual generators, not merely on its space. -/
theorem ordinaryEilenbergMacLaneFamily_higher_identification (A : AddCommGrpCat.{u})
    (n : ℕ) [NeZero n] (hn : 2 ≤ n) (a : A) :
    (ordinaryEilenbergMacLaneFamily.model A n).homotopyIdentification
      (HomotopyGroup.map (eqToHom (ordinaryEilenbergMacLaneFamily_higher_space A n hn).symm).hom
        (ordinaryEilenbergMacLaneFamily_higher_point A n hn)
        ⟦ordinaryDoldKanLabeledCubicalLoop A n a⟧) = Multiplicative.ofAdd a := by sorry

abbrev homotopySpherePolePair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := homotopySphere.{u} n) {ULift.up (homotopySpherePole n)}

/-- Actual pair collapse map to the sphere relative to the collapsed pole. -/
noncomputable def cubicalSpherePairMap (n : ℕ) [NeZero n] :
    coordinateCubePair.{u} n ⟶ homotopySpherePolePair.{u} n :=
  TopPair.ofSubsetMap
    (TopCat.ofHom ⟨fun t => ULift.up (cubicalSphereQuotient n t.down), by fun_prop⟩)
    (by
      intro t ht
      change ULift.up (cubicalSphereQuotient n t.down) = ULift.up (homotopySpherePole n)
      exact congrArg ULift.up (cubicalSphereQuotient_boundary n t.down ht))

/-- Native absolute-to-relative map for the standard sphere and its pole. -/
noncomputable def homotopySphereAbsoluteToRelative (n : ℕ) :
    ordinaryIntegralHomology (homotopySphere.{u} n) n ⟶
      (homotopySpherePolePair.{u} n).singularHomology (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (TopPair.singularHomologyInclIso (ModuleCat.{u} ℤ)
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom.app (homotopySphere n) ≫
      TopPair.singularHomologyMap
        (TopPair.j (homotopySpherePolePair n)) (ModuleCat.of ℤ (ULift.{u} ℤ)) n

/-- Descend the actual native generalized loop through the pinned cube quotient. -/
noncomputable def cubicalSphereRepresentative (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) :
    (g : GenLoop (Fin n) X x) → homotopySphere n ⟶ TopCat.of X := by
  sorry

theorem cubicalSphereRepresentative_quotient (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) (g : GenLoop (Fin n) X x)
    (t : Fin n → unitInterval) :
    cubicalSphereRepresentative n X x g (ULift.up (cubicalSphereQuotient n t)) = g.1 t := by
  sorry

/-- The outward-first sphere class fixed by the actual positive local chart below.
Stage 6 compares its canonical fundamental class with this earlier reference. -/
noncomputable def sphereFundamentalGenerator (n : ℕ) [NeZero n] :
    ordinaryIntegralHomology (homotopySphere n) n := by
  sorry

/-- A fixed positively oriented chart cube in the positive hemisphere. Its coordinates
are pinned below, so it independently fixes the outward-first local orientation. -/
noncomputable def spherePositiveCubeMap (n : ℕ) :
    (coordinateCubePair.{u} n).fst ⟶ homotopySphere.{u} n := by
  sorry

theorem spherePositiveCubeMap_tail (n : ℕ) (t : (coordinateCubePair.{u} n).fst)
    (j : Fin n) :
    (spherePositiveCubeMap n t).down.1 j.succ =
      ((t.down j : ℝ) - 1 / 2) / (n + 1) := by
  sorry

theorem spherePositiveCubeMap_head (n : ℕ) (t : (coordinateCubePair.{u} n).fst) :
    (spherePositiveCubeMap n t).down.1 0 =
      Real.sqrt (1 - ∑ j : Fin n, (((t.down j : ℝ) - 1 / 2) / (n + 1)) ^ 2) := by
  sorry

theorem spherePositiveCubeMap_boundary (n : ℕ) (t : (coordinateCubePair.{u} n).fst)
    (ht : t.down ∈ Cube.boundary (Fin n)) :
    spherePositiveCubeMap n t ≠ ULift.up (homotopySpherePole n) := by
  sorry

/-- The actual map of pairs induced by that positive chart cube. -/
noncomputable def spherePositiveCubePairMap (n : ℕ) :
    coordinateCubePair.{u} n ⟶
      puncturedPair (homotopySphere.{u} n) (ULift.up (homotopySpherePole n)) :=
  TopPair.ofSubsetMap (spherePositiveCubeMap n) (by
    intro t ht
    exact spherePositiveCubeMap_boundary n t ht)

noncomputable def homotopySphereAbsoluteToLocal (n : ℕ) :
    ordinaryIntegralHomology (homotopySphere.{u} n) n ⟶
      (puncturedPair (homotopySphere.{u} n) (ULift.up (homotopySpherePole n))).singularHomology
        (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (TopPair.singularHomologyInclIso (ModuleCat.{u} ℤ)
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom.app (homotopySphere n) ≫
      TopPair.singularHomologyMap
        (TopPair.j (puncturedPair (homotopySphere n) (ULift.up (homotopySpherePole n))))
        (ModuleCat.of ℤ (ULift.{u} ℤ)) n

/-- Local value +1 in the fixed positive chart independently pins the sphere class. -/
theorem sphereFundamentalGenerator_positiveLocal (n : ℕ) [NeZero n] :
    homotopySphereAbsoluteToLocal n (sphereFundamentalGenerator n) =
      ((coordinateCubePair.{u} n).singularHomologyMap (spherePositiveCubePairMap n)
        (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateCubeReferenceClass n) := by
  sorry

/-- The general Stage 8.3 Hurewicz map, including the abelianization map in degree one. -/
noncomputable def absoluteHurewicz (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) :
    HomotopyGroup (Fin n) X x →* Multiplicative (ordinaryIntegralHomology (TopCat.of X) n) := by
  sorry

/-- The defining formula uses the actual sphere map induced by a native cubical representative. -/
theorem absoluteHurewicz_genLoop (n : ℕ) [NeZero n]
    (X : Type u) [TopologicalSpace X] (x : X) (g : GenLoop (Fin n) X x) :
    Multiplicative.toAdd (absoluteHurewicz n X x ⟦g⟧) =
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).map (cubicalSphereRepresentative n X x g))
          (sphereFundamentalGenerator n) := by
  sorry

/-- Specialization of the general normalized Hurewicz map; no second EM-specific map. -/
abbrev ordinaryEMHurewiczMap (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) :=
  absoluteHurewicz n K.space K.point

/-- Hurewicz identification, normalized by the model's distinguished homotopy group. -/
noncomputable def ordinaryEMHurewiczIdentification (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] :
    (K : OrdinaryEMModel A n) →
      ordinaryIntegralHomology K.space n ≅ ModuleCat.of ℤ A := by
  sorry

theorem ordinaryEMHurewiczIdentification_onHomotopy (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n)
    (p : HomotopyGroup (Fin n) K.space K.point) :
    (ordinaryEMHurewiczIdentification A n K).hom
      (Multiplicative.toAdd (ordinaryEMHurewiczMap A n K p)) =
        Multiplicative.toAdd (K.homotopyIdentification p) := by
  sorry

/-- The identity universal class, with normalization fixed by the actual Hurewicz map. -/
noncomputable def ordinaryEMUniversalClass (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] :
    (K : OrdinaryEMModel A n) →
      K.space.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ
        (ModuleCat.of ℤ A) n := by
  sorry

theorem ordinaryEMUniversalClass_kronecker (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) :
    K.space.singularKronecker ℤ n (ordinaryEMUniversalClass A n K) =
      (ordinaryEMHurewiczIdentification A n K).hom := by
  sorry

/-- Homotopy classes use the native continuous-map homotopy equivalence relation. -/
def continuousHomotopySetoid (X Y : TopCat.{u}) : Setoid C(X, Y) where
  r := ContinuousMap.Homotopic
  iseqv := ContinuousMap.Homotopic.equivalence

abbrev continuousHomotopyClasses (X Y : TopCat.{u}) :=
  Quotient (continuousHomotopySetoid X Y)

/-- The representing map is actual native cohomological pullback, descended along homotopy. -/
noncomputable def ordinaryEMPullback (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n) (X : TopCat.{u}) :
    continuousHomotopyClasses X K.space →
      X.singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n :=
  Quotient.lift (fun f => TopCat.singularCohomologyMap (TopCat.ofHom f) n
    (ordinaryEMUniversalClass A n K)) (by
      intro f g h
      obtain ⟨H⟩ := h
      have heq := TopCat.Homotopy.congr_singularCohomologyMap
        (f := TopCat.ofHom f) (g := TopCat.ofHom g) H
        (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ (ModuleCat.of ℤ A) n
      exact congrArg (fun q => q.hom (ordinaryEMUniversalClass A n K)) heq)

/-- Arbitrary CW complexes, with arbitrary components and dimensions. This theorem is
proved by cellular cocycle realization and the relative-cylinder weak topology. -/
theorem ordinaryEMRepresentability (A : Type u) [AddCommGroup A]
    (n : ℕ) [NeZero n] (K : OrdinaryEMModel A n)
    (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)] :
    Function.Bijective (ordinaryEMPullback A n K X) := by
  sorry

/-- Relative cylinder with the actual product topology; interval coordinate is last. -/
@[instance_reducible] noncomputable def relativeCylinderCW (X : Type u) [TopologicalSpace X] [T2Space X]
    (B : Set X) [RelCWComplex (Set.univ : Set X) B] :
    RelCWComplex (Set.univ : Set (X × unitInterval))
      {p | p.1 ∈ B ∨ p.2 = 0 ∨ p.2 = 1} := by
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

section SimplyConnectedObstructions

variable (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
  [RelCWComplex (Set.univ : Set X) B]
  (Y : Type u) [TopologicalSpace Y] [SimplyConnectedSpace Y] (y : Y)
  (n : ℕ) [Nontrivial (Fin n)]

/-- Constant-coefficient specialization: cochains are Hom of integral cellular chains into
πₙ(Y), not the dual of πₙ(Y)-valued cellular chains. -/
abbrev relativeObstructionCochainComplex :=
  (TauCeti.cellularChainComplex (D := B) (Set.univ : Set X)
    (ModuleCat.of ℤ (ULift.{u} ℤ))).linearYonedaObj ℤ
      (ModuleCat.of ℤ (Additive (HomotopyGroup (Fin n) Y y)))

/-- The cochain evaluates a characteristic-map boundary after its basepoint transport. -/
noncomputable def relativeObstructionCochain :
    (f : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) →
    (relativeObstructionCochainComplex X B Y y n).X (n + 1) := by
  sorry

theorem relativeObstructionCochain_isCocycle
    (f : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    (relativeObstructionCochainComplex X B Y y n).d (n + 1) (n + 2)
      (relativeObstructionCochain X B Y y n f) = 0 := by
  sorry

/-- Extension of the fixed map is controlled by the zero cochain, rather than zero class. -/
theorem relativeObstructionCochain_zero_iff_extension
    (f : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    relativeObstructionCochain X B Y y n f = 0 ↔
      ∃ g : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) (n + 1)).fst ⟶
        TopCat.of Y,
        TopPair.Hom.fst (TauCeti.skeletonBasePairToSucc (D := B) (Set.univ : Set X) n) ≫
          g = f := by
  sorry

/-- The actual disk-gluing difference cochain of two maps agreeing on the preceding
skeleton, with the orientation used by the subsequent coboundary theorem. -/
noncomputable def relativeDifferenceCochain :
    (f₀ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) →
    (agree :
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₁ =
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₀) →
    (relativeObstructionCochainComplex X B Y y n).X n := by
  sorry

/-- The difference sign is pinned at the cochain level. -/
theorem relativeDifferenceCochain_coboundary
    (f₀ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y)
    (agree :
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₁ =
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₀) :
    (relativeObstructionCochainComplex X B Y y n).d n (n + 1)
      (relativeDifferenceCochain X B Y y n f₀ f₁ agree) =
        relativeObstructionCochain X B Y y n f₁ -
          relativeObstructionCochain X B Y y n f₀ := by
  sorry

/-- Realize the prescribed cochain itself, including cocycles with zero coboundary,
while fixing the preceding skeleton and base. -/
theorem relativeDifferenceCochain_realize
    (f₀ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y)
    (d : (relativeObstructionCochainComplex X B Y y n).X n) :
    ∃ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y,
      ∃ agree :
        TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
          (Nat.sub_le n 1)) ≫ f₁ =
        TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
          (Nat.sub_le n 1)) ≫ f₀,
        relativeDifferenceCochain X B Y y n f₀ f₁ agree = d := by
  sorry

/-- A cocycle represents zero exactly when it is a coboundary. This criterion permits
changing the n-skeleton, and the agreement retains the base and preceding skeleton. -/
theorem relativeObstructionClass_zero_iff_adjusted_extension
    (f₀ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y) :
    (∃ d : (relativeObstructionCochainComplex X B Y y n).X n,
      (relativeObstructionCochainComplex X B Y y n).d n (n + 1) d =
        relativeObstructionCochain X B Y y n f₀) ↔
    ∃ f₁ : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) n).fst ⟶ TopCat.of Y,
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₁ =
      TopPair.Hom.fst (TauCeti.skeletonBasePairInclusion (D := B) (Set.univ : Set X)
        (Nat.sub_le n 1)) ≫ f₀ ∧
      ∃ g : (TauCeti.skeletonBasePair (D := B) (Set.univ : Set X) (n + 1)).fst ⟶
        TopCat.of Y,
        TopPair.Hom.fst (TauCeti.skeletonBasePairToSucc (D := B) (Set.univ : Set X) n) ≫
          g = f₁ := by
  sorry

end SimplyConnectedObstructions

end

universe u

/-! ### Stage 2.5: the single coordinate cube, sup-ball and round-disk maps -/

abbrev coordinateSupBall (n : ℕ) : TopCat.{u} :=
  TopCat.of (ULift.{u} (Metric.closedBall (0 : Fin n → ℝ) 1))

abbrev coordinateSupBallPair (n : ℕ) : TopPair.{u} :=
  TopPair.ofSubset (X := coordinateSupBall.{u} n) {x | ‖(x.down : Fin n → ℝ)‖ = 1}

noncomputable def coordinateCubeSupBallHomeomorph (n : ℕ) :
    (coordinateCubePair.{u} n).fst ≃ₜ coordinateSupBall.{u} n := by
  sorry

theorem coordinateCubeSupBallHomeomorph_apply (n : ℕ)
    (t : (coordinateCubePair.{u} n).fst) (j : Fin n) :
    ((coordinateCubeSupBallHomeomorph n t).down : Fin n → ℝ) j =
      2 * (t.down j : ℝ) - 1 := by
  sorry

noncomputable def supBallEuclideanDiskHomeomorph (n : ℕ) :
    coordinateSupBall.{u} n ≃ₜ TopCat.disk.{u} n := by
  sorry

theorem supBallEuclideanDiskHomeomorph_apply (n : ℕ) (x : coordinateSupBall.{u} n) :
    ((supBallEuclideanDiskHomeomorph n x).down : EuclideanSpace ℝ (Fin n)) =
      if (x.down : Fin n → ℝ) = 0 then 0
      else (‖(x.down : Fin n → ℝ)‖ / ‖WithLp.toLp 2 (x.down : Fin n → ℝ)‖) •
        WithLp.toLp 2 (x.down : Fin n → ℝ) := by
  sorry

theorem coordinateCubeSupBallHomeomorph_boundary (n : ℕ)
    (t : (coordinateCubePair.{u} n).fst) :
    ‖((coordinateCubeSupBallHomeomorph n t).down : Fin n → ℝ)‖ = 1 ↔
      t.down ∈ Cube.boundary (Fin n) := by
  sorry

theorem supBallEuclideanDiskHomeomorph_boundary (n : ℕ) (x : coordinateSupBall.{u} n) :
    supBallEuclideanDiskHomeomorph n x ∈ Set.range (TopCat.diskBoundaryInclusion n) ↔
      ‖(x.down : Fin n → ℝ)‖ = 1 := by
  sorry

noncomputable def coordinateCubeSupBallPairMap (n : ℕ) :
    coordinateCubePair.{u} n ⟶ coordinateSupBallPair.{u} n :=
  TopPair.ofSubsetMap
    (TopCat.ofHom ⟨coordinateCubeSupBallHomeomorph n, (coordinateCubeSupBallHomeomorph n).continuous⟩)
    (by
      intro t ht
      exact (coordinateCubeSupBallHomeomorph_boundary n t).2 ht)

theorem coordinateCubeSupBallPairMap_apply (n : ℕ) (t : (coordinateCubePair.{u} n).fst) :
    TopPair.Hom.fst (coordinateCubeSupBallPairMap n) t =
      coordinateCubeSupBallHomeomorph n t := rfl

noncomputable def supBallEuclideanDiskPairMap (n : ℕ) :
    coordinateSupBallPair.{u} n ⟶ TauCeti.diskBoundaryPair.{u} n := by
  sorry

theorem supBallEuclideanDiskPairMap_apply (n : ℕ) (x : coordinateSupBall.{u} n) :
    TopPair.Hom.fst (supBallEuclideanDiskPairMap n) x =
      supBallEuclideanDiskHomeomorph n x := by
  sorry

noncomputable def coordinateSupBallReferenceClass (n : ℕ) :
    (coordinateSupBallPair.{u} n).singularHomology (C := ModuleCat.{u} ℤ)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (TopPair.singularHomologyMap (coordinateCubeSupBallPairMap n)
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateCubeReferenceClass n)

noncomputable def coordinateEuclideanDiskReferenceClass (n : ℕ) :
    (TauCeti.diskBoundaryPair.{u} n).singularHomology (C := ModuleCat.{u} ℤ)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (TopPair.singularHomologyMap (supBallEuclideanDiskPairMap n)
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateSupBallReferenceClass n)


/-- Defined directly from the existing native disk isomorphism, before any sphere quotient. -/
noncomputable def coordinateDiskNativeComparisonCoefficient (n : ℕ) : ℤ :=
  ((TauCeti.singularHomologyDiskBoundaryPairIso
    (ModuleCat.of ℤ (ULift.{u} ℤ)) n).hom (coordinateEuclideanDiskReferenceClass n)).down

theorem coordinateDiskNativeComparisonCoefficient_isUnit (n : ℕ) :
    IsUnit (coordinateDiskNativeComparisonCoefficient n) := by
  sorry

theorem coordinateDiskNativeComparisonCoefficient_zero :
    coordinateDiskNativeComparisonCoefficient.{u} 0 = 1 := by
  sorry

/-! ### Stage 4.4: chosen based disk, smash and suspension sphere homeomorphisms -/

/-- The actual image of Mathlib's disk-boundary inclusion; empty for n=0. -/
noncomputable def diskBoundarySubset (n : ℕ) : Set (TopCat.disk.{u} n) :=
  Set.range (TopCat.diskBoundaryInclusion n)

noncomputable abbrev basedDiskQuotient (n : ℕ) : TopCat.{u} :=
  ordinaryPairQuotient (TopCat.disk.{u} n) (diskBoundarySubset n)

abbrev basedCubeQuotient (n : ℕ) : TopCat.{u} :=
  ordinaryPairQuotient (coordinateCubePair.{u} n).fst
    {t | t.down ∈ Cube.boundary (Fin n)}

/-- Coordinate order, followed by the orientation-preserving sup-ball/Euclidean radial map. -/
noncomputable def coordinateCubeDiskHomeomorph (n : ℕ) :
    (coordinateCubePair.{u} n).fst ≃ₜ TopCat.disk.{u} n :=
  (coordinateCubeSupBallHomeomorph n).trans (supBallEuclideanDiskHomeomorph n)

theorem coordinateCubeDiskHomeomorph_boundary (n : ℕ)
    (t : (coordinateCubePair.{u} n).fst) :
    coordinateCubeDiskHomeomorph n t ∈ diskBoundarySubset n ↔
      t.down ∈ Cube.boundary (Fin n) := by
  sorry

noncomputable def diskQuotientSphereHomeomorph (n : ℕ) :
    basedDiskQuotient.{u} n ≃ₜ homotopySphere.{u} n := by
  sorry

noncomputable def coordinateCubeQuotientSphereHomeomorph (n : ℕ) :
    basedCubeQuotient.{u} n ≃ₜ homotopySphere.{u} n := by
  sorry

theorem diskQuotientSphereHomeomorph_point (n : ℕ) :
    diskQuotientSphereHomeomorph n
      (ordinaryPairQuotientPoint (TopCat.disk.{u} n) (diskBoundarySubset n)) =
      ULift.up (homotopySpherePole n) := by
  sorry

theorem coordinateCubeQuotientSphereHomeomorph_point (n : ℕ) :
    coordinateCubeQuotientSphereHomeomorph n
      (ordinaryPairQuotientPoint (coordinateCubePair.{u} n).fst
        {t | t.down ∈ Cube.boundary (Fin n)}) = ULift.up (homotopySpherePole n) := by
  sorry

/-- The disk point is the nonbasepoint of S⁰; the added point is the positive pole. -/
theorem diskQuotientSphereHomeomorph_zero (x : TopCat.disk.{u} 0) :
    diskQuotientSphereHomeomorph 0
      ((ordinaryPairQuotientMap (TopCat.disk.{u} 0) (diskBoundarySubset 0)) x) =
        ULift.up (-homotopySpherePole 0) := by
  sorry

/-- The new all-degree homeomorphism agrees with the existing positive-degree quotient. -/
theorem coordinateCubeQuotientSphereHomeomorph_positive (n : ℕ) [NeZero n]
    (t : (coordinateCubePair.{u} n).fst) :
    coordinateCubeQuotientSphereHomeomorph n
      ((ordinaryPairQuotientMap (coordinateCubePair.{u} n).fst
        {t | t.down ∈ Cube.boundary (Fin n)}) t) =
      ULift.up (cubicalSphereQuotient n t.down) := by
  sorry

theorem coordinateCubeDiskQuotient_commutes (n : ℕ)
    (t : (coordinateCubePair.{u} n).fst) :
    diskQuotientSphereHomeomorph n
      ((ordinaryPairQuotientMap (TopCat.disk.{u} n) (diskBoundarySubset n))
        (coordinateCubeDiskHomeomorph n t)) =
      coordinateCubeQuotientSphereHomeomorph n
        ((ordinaryPairQuotientMap (coordinateCubePair.{u} n).fst
          {t | t.down ∈ Cube.boundary (Fin n)}) t) := by
  sorry

/-- Bare pointed smash quotient. Categorical and homology adapters consume this carrier. -/
def basedSmashCarrier (X Y : TopCat.{u}) (x : X) (y : Y) : TopCat.{u} :=
  ordinaryPairQuotient (X × Y) {p | p.1 = x ∨ p.2 = y}

def basedSmashQuotientMap (X Y : TopCat.{u}) (x : X) (y : Y) :
    TopCat.of (X × Y) ⟶ basedSmashCarrier X Y x y :=
  ordinaryPairQuotientMap (X × Y) {p | p.1 = x ∨ p.2 = y}

/-- Right reduced suspension: original coordinates first, interval last. -/
def reducedSuspensionCarrier (X : TopCat.{u}) (x : X) : TopCat.{u} :=
  ordinaryPairQuotient (X × unitInterval) {p | p.1 = x ∨ p.2 = 0 ∨ p.2 = 1}

noncomputable def sphereSmashHomeomorph (m n : ℕ) :
    basedSmashCarrier (homotopySphere.{u} m) (homotopySphere.{u} n)
      (ULift.up (homotopySpherePole m)) (ULift.up (homotopySpherePole n)) ≃ₜ
      homotopySphere.{u} (m + n) := by
  sorry

noncomputable def reducedSuspensionSphereHomeomorph (n : ℕ) :
    reducedSuspensionCarrier (homotopySphere.{u} n)
      (ULift.up (homotopySpherePole n)) ≃ₜ homotopySphere.{u} (n + 1) := by
  sorry

theorem sphereSmashHomeomorph_point (m n : ℕ) :
    sphereSmashHomeomorph m n
      (ordinaryPairQuotientPoint (homotopySphere.{u} m × homotopySphere.{u} n)
        {p | p.1 = ULift.up (homotopySpherePole m) ∨
          p.2 = ULift.up (homotopySpherePole n)}) =
      ULift.up (homotopySpherePole (m + n)) := by
  sorry

theorem reducedSuspensionSphereHomeomorph_point (n : ℕ) :
    reducedSuspensionSphereHomeomorph n
      (ordinaryPairQuotientPoint (homotopySphere.{u} n × unitInterval)
        {p | p.1 = ULift.up (homotopySpherePole n) ∨ p.2 = 0 ∨ p.2 = 1}) =
      ULift.up (homotopySpherePole (n + 1)) := by
  sorry

/-- All-degree cube pair map through the same quotient and chosen homeomorphism. -/
noncomputable def basedCubeSpherePairMap (n : ℕ) :
    coordinateCubePair.{u} n ⟶ homotopySpherePolePair.{u} n :=
  TopPair.ofSubsetMap
    (ordinaryPairQuotientMap (coordinateCubePair.{u} n).fst
      {t | t.down ∈ Cube.boundary (Fin n)} ≫
        (TopCat.isoOfHomeo (coordinateCubeQuotientSphereHomeomorph n)).hom) (by
    sorry)

/-- Normalized independently: positive local chart for n>0; [-p]-[p] for n=0. -/
noncomputable def basedSphereReferenceGenerator (n : ℕ) :
    (homotopySpherePolePair.{u} n).singularHomology
      (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n := by
  sorry

theorem basedSphereReferenceGenerator_positive (n : ℕ) [NeZero n] :
    basedSphereReferenceGenerator n =
      homotopySphereAbsoluteToRelative n (sphereFundamentalGenerator n) := by
  sorry

theorem basedSphereReferenceGenerator_zero :
    basedSphereReferenceGenerator.{u} 0 =
      homotopySphereAbsoluteToRelative 0
        ((TauCeti.singularHomology₀Section (ModuleCat.of ℤ (ULift.{u} ℤ))
          (X := homotopySphere.{u} 0) (ULift.up (-homotopySpherePole 0))) (ULift.up (1 : ℤ)) -
        (TauCeti.singularHomology₀Section (ModuleCat.of ℤ (ULift.{u} ℤ))
          (X := homotopySphere.{u} 0) (ULift.up (homotopySpherePole 0))) (ULift.up (1 : ℤ))) := by
  sorry

theorem basedCubeSpherePairMap_referenceClass (n : ℕ) :
    ((coordinateCubePair.{u} n).singularHomologyMap (basedCubeSpherePairMap n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateCubeReferenceClass n) =
      basedSphereReferenceGenerator n := by
  sorry

/-- Concatenate cube coordinates, map each block to its sphere, and collapse their wedge. -/
noncomputable def sphereSmashCubePairMap (m n : ℕ) :
    coordinateCubePair.{u} (m + n) ⟶ homotopySpherePolePair.{u} (m + n) := by
  sorry

/-- The formula is pinned, not an unspecified map with a generator equation. -/
theorem sphereSmashCubePairMap_apply (m n : ℕ)
    (t : (coordinateCubePair.{u} (m + n)).fst) :
    TopPair.Hom.fst (sphereSmashCubePairMap m n) t =
      sphereSmashHomeomorph m n
        (basedSmashQuotientMap (homotopySphere.{u} m) (homotopySphere.{u} n)
          (ULift.up (homotopySpherePole m)) (ULift.up (homotopySpherePole n))
          (TopPair.Hom.fst (basedCubeSpherePairMap m) (ULift.up (fun j => t.down (Fin.castAdd n j))),
           TopPair.Hom.fst (basedCubeSpherePairMap n) (ULift.up (fun j => t.down (Fin.natAdd m j))))) := by
  sorry



noncomputable def reducedSuspensionSphereCubePairMap (n : ℕ) :
    coordinateCubePair.{u} (n + 1) ⟶ homotopySpherePolePair.{u} (n + 1) := by
  sorry

theorem reducedSuspensionSphereCubePairMap_apply (n : ℕ)
    (t : (coordinateCubePair.{u} (n + 1)).fst) :
    TopPair.Hom.fst (reducedSuspensionSphereCubePairMap n) t =
      reducedSuspensionSphereHomeomorph n
        ((ordinaryPairQuotientMap (homotopySphere.{u} n × unitInterval)
          {p | p.1 = ULift.up (homotopySpherePole n) ∨ p.2 = 0 ∨ p.2 = 1})
          (TopPair.Hom.fst (basedCubeSpherePairMap n)
            (ULift.up (fun j => t.down (Fin.castSucc j))), t.down (Fin.last n))) := by
  sorry



/-- Surjectivity of the cube representatives makes the smash homeomorphism unique. -/
theorem sphereSmashCubePairMap_eq (m n : ℕ) :
    sphereSmashCubePairMap.{u} m n = basedCubeSpherePairMap.{u} (m + n) := by
  sorry

theorem sphereSmashHomeomorph_referenceClass (m n : ℕ) :
    ((coordinateCubePair.{u} (m + n)).singularHomologyMap (sphereSmashCubePairMap m n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) (m + n)) (coordinateCubeReferenceClass (m + n)) =
      basedSphereReferenceGenerator (m + n) := by
  rw [sphereSmashCubePairMap_eq]
  exact basedCubeSpherePairMap_referenceClass _

/-- The right suspension is the same chosen next-dimensional cube quotient. -/
theorem reducedSuspensionSphereCubePairMap_eq (n : ℕ) :
    reducedSuspensionSphereCubePairMap.{u} n = basedCubeSpherePairMap.{u} (n + 1) := by
  sorry

theorem reducedSuspensionSphereHomeomorph_referenceClass (n : ℕ) :
    ((coordinateCubePair.{u} (n + 1)).singularHomologyMap
      (reducedSuspensionSphereCubePairMap n) (ModuleCat.of ℤ (ULift.{u} ℤ)) (n + 1))
      (coordinateCubeReferenceClass (n + 1)) = basedSphereReferenceGenerator (n + 1) := by
  rw [reducedSuspensionSphereCubePairMap_eq]
  exact basedCubeSpherePairMap_referenceClass _

noncomputable abbrev sphereSmashQuotientMap (m n : ℕ) :=
  basedSmashQuotientMap (homotopySphere.{u} m) (homotopySphere.{u} n)
    (ULift.up (homotopySpherePole m)) (ULift.up (homotopySpherePole n))

theorem sphereSmashHomeomorph_assoc (ℓ m n : ℕ)
    (x : homotopySphere.{u} ℓ) (y : homotopySphere.{u} m) (z : homotopySphere.{u} n) :
    (eqToHom (congrArg homotopySphere (Nat.add_assoc ℓ m n)))
      (sphereSmashHomeomorph (ℓ + m) n
        (sphereSmashQuotientMap (ℓ + m) n
          (sphereSmashHomeomorph ℓ m (sphereSmashQuotientMap ℓ m (x, y)), z))) =
      sphereSmashHomeomorph ℓ (m + n)
        (sphereSmashQuotientMap ℓ (m + n)
          (x, sphereSmashHomeomorph m n (sphereSmashQuotientMap m n (y, z)))) := by
  sorry

theorem sphereSmashHomeomorph_unit_left (n : ℕ) (x : homotopySphere.{u} n) :
    (eqToHom (congrArg homotopySphere (Nat.zero_add n)))
      (sphereSmashHomeomorph 0 n
        (sphereSmashQuotientMap 0 n (ULift.up (-homotopySpherePole 0), x))) = x := by
  sorry

theorem sphereSmashHomeomorph_unit_right (n : ℕ) (x : homotopySphere.{u} n) :
    (eqToHom (congrArg homotopySphere (Nat.add_zero n)))
      (sphereSmashHomeomorph n 0
        (sphereSmashQuotientMap n 0 (x, ULift.up (-homotopySpherePole 0)))) = x := by
  sorry

theorem reducedSuspensionSphereHomeomorph_smash (n : ℕ)
    (x : homotopySphere.{u} n) (t : unitInterval) :
    reducedSuspensionSphereHomeomorph n
      ((ordinaryPairQuotientMap (homotopySphere.{u} n × unitInterval)
        {p | p.1 = ULift.up (homotopySpherePole n) ∨ p.2 = 0 ∨ p.2 = 1}) (x, t)) =
      sphereSmashHomeomorph n 1
        (sphereSmashQuotientMap n 1
          (x, TopPair.Hom.fst (basedCubeSpherePairMap 1) (ULift.up (fun _ => t)))) := by
  sorry

noncomputable def sphereFactorInterchangePairMap (m n : ℕ) :
    homotopySpherePolePair.{u} (m + n) ⟶ homotopySpherePolePair.{u} (n + m) := by
  sorry

theorem sphereFactorInterchangePairMap_apply (m n : ℕ)
    (x : homotopySphere.{u} m) (y : homotopySphere.{u} n) :
    TopPair.Hom.fst (sphereFactorInterchangePairMap m n)
      (sphereSmashHomeomorph m n (sphereSmashQuotientMap m n (x, y))) =
      sphereSmashHomeomorph n m (sphereSmashQuotientMap n m (y, x)) := by
  sorry

theorem sphereFactorInterchangePairMap_referenceClass (m n : ℕ) :
    (TopPair.singularHomologyMap (sphereFactorInterchangePairMap m n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) (m + n)) (basedSphereReferenceGenerator (m + n)) =
      (eqToHom (congrArg (fun d => (homotopySpherePolePair.{u} (n + m)).singularHomology
        (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) d) (Nat.add_comm n m)))
        (((-1 : ℤ) ^ (m * n)) • basedSphereReferenceGenerator (n + m)) := by
  sorry

/-- The quotient disk map has a separately stated reference-class comparison. -/
noncomputable def basedDiskSpherePairMap (n : ℕ) :
    TauCeti.diskBoundaryPair.{u} n ⟶ homotopySpherePolePair.{u} n := by
  sorry

theorem basedDiskSpherePairMap_apply (n : ℕ) (x : TopCat.disk.{u} n) :
    TopPair.Hom.fst (basedDiskSpherePairMap n) x =
      diskQuotientSphereHomeomorph n
        ((ordinaryPairQuotientMap (TopCat.disk.{u} n) (diskBoundarySubset n)) x) := by
  sorry

theorem diskQuotientSphereHomeomorph_referenceClass (n : ℕ) :
    (TopPair.singularHomologyMap (basedDiskSpherePairMap n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateEuclideanDiskReferenceClass n) =
      basedSphereReferenceGenerator n := by
  sorry

/-- The boundary carrier is definitionally Mathlib's lifted metric sphere. -/
noncomputable def diskBoundarySphereHomeomorph (n : ℕ) :
    TopCat.diskBoundary.{u} (n + 1) ≃ₜ homotopySphere.{u} n := Homeomorph.refl _

/-- Native singular-homology/pole-pair comparison for the same sphere carrier. -/
noncomputable def diskBoundaryHomologyToRelative (n : ℕ) :
    (TopCat.toSSet.obj (TopCat.diskBoundary.{u} (n + 1))).homology
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n ⟶
    (homotopySpherePolePair.{u} n).singularHomology
      (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
      (ModuleCat.of ℤ (ULift.{u} ℤ))).map
        (TopCat.ofHom ⟨diskBoundarySphereHomeomorph n,
          (diskBoundarySphereHomeomorph n).continuous⟩)) ≫
    homotopySphereAbsoluteToRelative n

/-- Take the actual native pair boundary of the coordinate-oriented round-disk class. -/
noncomputable def diskBoundaryReferenceRadial (n : ℕ) :
    (homotopySpherePolePair.{u} n).singularHomology
      (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  diskBoundaryHomologyToRelative n
    (((TauCeti.diskBoundaryPair.{u} (n + 1)).singularHomologyδ
      (ModuleCat.of ℤ (ULift.{u} ℤ)) (n + 1) n) (coordinateEuclideanDiskReferenceClass (n + 1)))

theorem diskBoundaryReference_radial_pos (n : ℕ) [NeZero n] :
    diskBoundaryReferenceRadial.{u} n = basedSphereReferenceGenerator n := by
  sorry

theorem diskBoundaryReference_radial_zero :
    diskBoundaryReferenceRadial.{u} 0 = -basedSphereReferenceGenerator.{u} 0 := by
  sorry

/-- Actual native generator, included into absolute homology and then into the pole pair. -/
noncomputable def nativeSphereGeneratorToPolePair (n : ℕ) :
    (homotopySpherePolePair.{u} n).singularHomology
      (C := ModuleCat.{u} ℤ) (ModuleCat.of ℤ (ULift.{u} ℤ)) n :=
  homotopySphereAbsoluteToRelative n
    (((TauCeti.reducedSingularHomologyι (ModuleCat.of ℤ (ULift.{u} ℤ)) n).app
      (homotopySphere.{u} n))
        ((TauCeti.reducedSingularHomologyTopCatSphereIso
          (ModuleCat.of ℤ (ULift.{u} ℤ)) n).inv (ULift.up 1)))

theorem nativeSphereReferenceComparison_existsUnit (n : ℕ) :
    ∃ ε : ℤˣ, basedSphereReferenceGenerator.{u} n =
      (ε : ℤ) • nativeSphereGeneratorToPolePair n := by
  sorry

noncomputable def nativeSphereReferenceComparisonUnit (n : ℕ) : ℤˣ :=
  Classical.choose (nativeSphereReferenceComparison_existsUnit.{u} n)

theorem nativeSphereReferenceComparisonUnit_referenceClass (n : ℕ) :
    basedSphereReferenceGenerator.{u} n =
      (nativeSphereReferenceComparisonUnit.{u} n : ℤ) • nativeSphereGeneratorToPolePair n :=
  Classical.choose_spec (nativeSphereReferenceComparison_existsUnit n)

/-- The actual native zero-sphere pole, transported back through the native coordinate isometry. -/
noncomputable def nativeSphereZeroPole : homotopySphere.{u} 0 := by
  let e := TauCeti.diskBoundaryHomeomorph.{u} 1
  haveI : Nonempty _ := ⟨e (ULift.up (homotopySpherePole 0))⟩
  exact e.symm (Classical.arbitrary _)

theorem nativeSphereReferenceComparisonUnit_zero_eq_one_iff :
    nativeSphereReferenceComparisonUnit.{u} 0 = 1 ↔
      nativeSphereZeroPole.{u} = ULift.up (homotopySpherePole 0) := by
  sorry

theorem coordinateDiskNativeComparisonCoefficient_succ (n : ℕ) :
    coordinateDiskNativeComparisonCoefficient.{u} (n + 1) =
      (if n = 0 then -1 else 1) * (nativeSphereReferenceComparisonUnit.{u} n : ℤ) := by
  sorry

/-! Raw quotient-to-kification comparisons use only §3A.1; §3A.2 later supplies convenient adapters. -/

noncomputable def compactBasedSmashCarrierComparison
    (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
    (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
    (X Y : TopCat.{u}) [CompactSpace X] [CompactSpace Y] [T2Space X] [T2Space Y]
    (x : X) (y : Y) :
    basedSmashCarrier X Y x y ≃ₜ k.obj (basedSmashCarrier X Y x y) := by
  sorry

theorem compactBasedSmashCarrierComparison_counit
    (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
    (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
    (X Y : TopCat.{u}) [CompactSpace X] [CompactSpace Y] [T2Space X] [T2Space Y]
    (x : X) (y : Y) (z : basedSmashCarrier X Y x y) :
    (hk.counit.app (basedSmashCarrier X Y x y))
      (compactBasedSmashCarrierComparison k hk X Y x y z) = z := by
  sorry

noncomputable def compactReducedSuspensionCarrierComparison
    (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
    (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
    (X : TopCat.{u}) [CompactSpace X] [T2Space X] (x : X) :
    reducedSuspensionCarrier X x ≃ₜ k.obj (reducedSuspensionCarrier X x) := by
  sorry

theorem compactReducedSuspensionCarrierComparison_counit
    (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
    (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
    (X : TopCat.{u}) [CompactSpace X] [T2Space X] (x : X)
    (z : reducedSuspensionCarrier X x) :
    (hk.counit.app (reducedSuspensionCarrier X x))
      (compactReducedSuspensionCarrierComparison k hk X x z) = z := by
  sorry

/-- The CW quotient is compactly generated even when X is not compact. -/
noncomputable def cwReducedSuspensionKelleyComparison
    (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
    (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
    (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)] (x : X) :
    reducedSuspensionCarrier X x ≃ₜ k.obj (reducedSuspensionCarrier X x) := by
  sorry

theorem cwReducedSuspensionKelleyComparison_counit
    (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
    (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
    (X : TopCat.{u}) [T2Space X] [CWComplex (Set.univ : Set X)] (x : X)
    (z : reducedSuspensionCarrier X x) :
    (hk.counit.app (reducedSuspensionCarrier X x))
      (cwReducedSuspensionKelleyComparison k hk X x z) = z := by
  sorry

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

noncomputable def reducedSuspensionTwoStepHomeomorph (X : TopCat.{u}) (x : X) :
    ordinaryTwoStepReducedSuspensionCarrier X x ≃ₜ reducedSuspensionCarrier X x := by
  sorry

theorem reducedSuspensionTwoStepHomeomorph_apply (X : TopCat.{u}) (x z : X)
    (t : unitInterval) :
    reducedSuspensionTwoStepHomeomorph X x (ordinaryTwoStepSuspensionQuotientMap X x (z, t)) =
      (ordinaryPairQuotientMap (X × unitInterval)
        {p | p.1 = x ∨ p.2 = 0 ∨ p.2 = 1}) (z, t) := by
  sorry

theorem reducedSuspensionTwoStepHomeomorph_point (X : TopCat.{u}) (x : X) :
    reducedSuspensionTwoStepHomeomorph X x
      (ordinaryPairQuotientPoint (ordinaryUnreducedSuspensionCarrier X)
        (Set.range (ordinaryBasepointMeridian X x))) =
      ordinaryPairQuotientPoint (X × unitInterval) {p | p.1 = x ∨ p.2 = 0 ∨ p.2 = 1} := by
  sorry

/-- The all-degree quotient map specializes to the existing positive-degree map. -/
theorem basedCubeSpherePairMap_positive (n : ℕ) [NeZero n] :
    basedCubeSpherePairMap.{u} n = cubicalSpherePairMap.{u} n := by
  sorry

/-- Compatibility alias derived from Stage4.4's single all-degree reference comparison. -/
theorem cubicalSphereQuotient_referenceClass (n : ℕ) [NeZero n] :
    ((coordinateCubePair.{u} n).singularHomologyMap (cubicalSpherePairMap n)
      (ModuleCat.of ℤ (ULift.{u} ℤ)) n) (coordinateCubeReferenceClass n) =
        homotopySphereAbsoluteToRelative n (sphereFundamentalGenerator n) := by
  have h := basedCubeSpherePairMap_referenceClass.{u} n
  rw [basedCubeSpherePairMap_positive, basedSphereReferenceGenerator_positive] at h
  exact h

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

/-- Explicit coordinate choice pins the radial map to the actual lifted native disk. -/
noncomputable def normedUnitBallTopCatDiskHomeomorph {k : ℕ} :
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin k)) →
      Metric.closedBall (0 : E) 1 ≃ₜ TopCat.disk.{u} k := by
  sorry

theorem normedUnitBallTopCatDiskHomeomorph_apply {k : ℕ}
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin k))
    (x : Metric.closedBall (0 : E) 1) :
    ((normedUnitBallTopCatDiskHomeomorph e x).down : EuclideanSpace ℝ (Fin k)) =
      (‖(x : E)‖ / ‖e x‖) • e x := by
  sorry

theorem normedUnitBallTopCatDiskHomeomorph_symm_apply {k : ℕ}
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin k)) (y : TopCat.disk.{u} k) :
    ((normedUnitBallTopCatDiskHomeomorph e).symm y : E) =
      (‖(y.down : EuclideanSpace ℝ (Fin k))‖ / ‖e.symm y.down‖) • e.symm y.down := by
  sorry

theorem normedUnitBallTopCatDiskHomeomorph_zero {k : ℕ}
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin k)) :
    normedUnitBallTopCatDiskHomeomorph e (⟨0, by simp⟩ : Metric.closedBall (0 : E) 1) =
      ULift.up ⟨0, by simp⟩ := by
  sorry

theorem normedUnitBallTopCatDiskHomeomorph_norm {k : ℕ}
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin k))
    (x : Metric.closedBall (0 : E) 1) :
    ‖((normedUnitBallTopCatDiskHomeomorph e x).down : EuclideanSpace ℝ (Fin k))‖ =
      ‖(x : E)‖ := by
  sorry

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

noncomputable def compactConvexClosedBallHomeomorph (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C) :
    (c : E) → (hc : c ∈ intrinsicInterior ℝ C) →
      Metric.closedBall (0 : (affineSpan ℝ C).direction) 1 ≃ₜ C := by
  sorry

/-- Unit direction and radial parameter fix the homeomorphism, rather than a choice. -/
theorem compactConvexClosedBallHomeomorph_ray (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (c : E) (hc : c ∈ intrinsicInterior ℝ C)
    (u : (affineSpan ℝ C).direction) (hu : ‖u‖ = 1)
    (t : ℝ) (ht : t ∈ Set.Icc (0 : ℝ) 1)
    (htu : t • u ∈ Metric.closedBall (0 : (affineSpan ℝ C).direction) 1) :
    (compactConvexClosedBallHomeomorph C hcompact hconvex c hc ⟨t • u, htu⟩ : E) =
      c + (t * compactConvexRadialReach C c u) • (u : E) := by
  sorry

/-- The chosen radial map preserves the center. -/
theorem compactConvexClosedBallHomeomorph_zero (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (c : E) (hc : c ∈ intrinsicInterior ℝ C) :
    (compactConvexClosedBallHomeomorph C hcompact hconvex c hc
      (⟨0, by simp⟩ : Metric.closedBall (0 : (affineSpan ℝ C).direction) 1) : E) = c := by
  sorry

theorem compactConvexClosedBallHomeomorph_boundary (C : Set E)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (c : E) (hc : c ∈ intrinsicInterior ℝ C)
    (v : Metric.closedBall (0 : (affineSpan ℝ C).direction) 1) :
    (compactConvexClosedBallHomeomorph C hcompact hconvex c hc v : E) ∈
      intrinsicFrontier ℝ C ↔ ‖(v : (affineSpan ℝ C).direction)‖ = 1 := by
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

/-- Relative cells are retained after changing the base by the attachment. -/
@[instance_reducible]
noncomputable def relativeCWPushout [RelCWComplex (Set.univ : Set Y) B]
    (a : C(B, Z)) :
    RelCWComplex
      (Set.univ : Set (relativeCWPushoutCarrier B a))
      (Set.range (fun z : Z =>
        (pushout.inr (relativeCWPushoutInclusion B) (TopCat.ofHom a)) z)) := by
  sorry

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

/-- Exact relative-cell indexing, using the constructed pushout CW data. -/
noncomputable def relativeCWPushout_cell [h : RelCWComplex (Set.univ : Set Y) B]
    (a : C(B, Z)) (n : ℕ) :
    letI := relativeCWPushout B a
    Topology.RelCWComplex.cell
      (D := Set.range (fun z : Z =>
        (pushout.inr (relativeCWPushoutInclusion B) (TopCat.ofHom a)) z))
      (Set.univ : Set (relativeCWPushoutCarrier B a)) n ≃ h.cell n := by
  sorry

/-- The pushout characteristic map is the original map followed by the actual quotient map. -/
theorem relativeCWPushout_characteristicMap [h : RelCWComplex (Set.univ : Set Y) B]
    (a : C(B, Z)) (n : ℕ) (i : h.cell n) (v : Fin n → ℝ)
    (hv : v ∈ Metric.closedBall (0 : Fin n → ℝ) 1) :
    letI := relativeCWPushout B a
    Topology.RelCWComplex.map
      (C := (Set.univ : Set (relativeCWPushoutCarrier B a)))
      (D := Set.range (fun z : Z =>
        (pushout.inr (relativeCWPushoutInclusion B) (TopCat.ofHom a)) z))
      n ((relativeCWPushout_cell B a n).symm i) v =
      (pushout.inl (relativeCWPushoutInclusion B) (TopCat.ofHom a)) (h.map n i v) := by
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

namespace TauCetiRoadmap.AlgebraicTopology

/-! ## Orientation comparison, compact classes, boundary carriers and topological groups

The sections below prototype the AT 6.3 orientation comparison consumed by DG 9.3, the integer
laws for compactly supported orientation classes, the general-model and boundary carriers, and
the fundamental group of a topological group. Each section keeps its own namespace, so the
declaration names cited in `README.md` are unchanged. -/

noncomputable section
universe u v w
open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.DifferentialGeometry

section OrientationComparison

/-!
AT 6.3 orientation comparison consumed by DG 9.3. The point class below is the image of the
actual AT ordered-simplex identity class. The oriented chart-overlap formula is derived from an
unsigned local-homology chart-change target; the local-section proof uses the chart-localization
results below. No class-valued choice is an input.
-/

namespace OrientationComparison

abbrev Model (m : ℕ) := modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))
abbrev IntegralSystem (M : Type) [TopologicalSpace M] :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj (ModuleCat.of ℤ ℤ)
abbrev LocalHomology (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    (x : M) := twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      (IntegralSystem M) m

noncomputable def orderedVertex (m : ℕ) (j : Fin (m + 1)) : EuclideanSpace ℝ (Fin m) :=
  Fin.cases (-∑ i : Fin m, EuclideanSpace.basisFun (Fin m) ℝ i)
    (fun i : Fin m => EuclideanSpace.basisFun (Fin m) ℝ i) j
noncomputable def orderedVector (m : ℕ)
    (t : Convexity.StdSimplex ℝ (Fin (m + 1))) : EuclideanSpace ℝ (Fin m) :=
  t.weights.sum (fun j a => a • orderedVertex m j)
def orderedEdgeMatrix (m : ℕ) : Matrix (Fin m) (Fin m) ℝ :=
  fun i j => if i = j then 2 else 1
theorem orderedEdgeMatrix_det (m : ℕ) : (orderedEdgeMatrix m).det = (m + 1 : ℝ) := by
  sorry
theorem orderedVector_coordinates (m : ℕ) (x : fullSimplex m) (i : Fin m) :
    (orderedVector m (fullSimplexEquivStdSimplex m x)) i =
      (orderedVertex m ⟨0, Nat.zero_lt_succ m⟩) i +
        ∑ j : Fin m, orderedEdgeMatrix m i j * (x : EuclideanSpace ℝ (Fin m)) j := by
  sorry

/-- A concrete simplex based at an arbitrary chart anchor `a` and a point `y` in that chart.
Its relative-pair map lands in the punctured fibre at `y`; the chart transition law below compares
classes in this one fixed fibre. -/
structure ChartSimplexAt (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) where
  radius : ℝ
  radius_pos : 0 < radius
  chartTarget : ∀ t : Convexity.StdSimplex ℝ (Fin (m + 1)),
    extChartAt (Model m) a y + radius • orderedVector m t ∈
      (chartAt (EuclideanSpace ℝ (Fin m)) a).target
  map : (coordinateSimplexPair m).fst ⟶ TopCat.of M
  map_formula : ∀ t : ULift (Convexity.StdSimplex ℝ (Fin (m + 1))),
    map t = (chartAt (EuclideanSpace ℝ (Fin m)) a).symm
      (extChartAt (Model m) a y + radius • orderedVector m t.down)
  boundary_avoids_point : ∀ t : (coordinateSimplexPair m).snd, map t.1 ≠ y

abbrev ChartSimplex (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M) :=
  ChartSimplexAt m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x)

theorem chartSimplex_exists (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) :
    Nonempty (ChartSimplexAt m M a y hy) := by
  sorry
noncomputable def chartSimplexPairMapAt (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : coordinateSimplexPair m ⟶ puncturedPair (TopCat.of M) y :=
  TopPair.ofSubsetMap w.map (by
    intro t ht
    change w.map t ≠ y
    exact w.boundary_avoids_point ⟨t, ht⟩)

/-- The chart class is the image of AT's ordered-simplex identity class in the local-homology
fibre over the displayed point. -/
noncomputable def orderedChartImageAt (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : LocalHomology m M y := by
  let P := puncturedPair (TopCat.of M) y
  let sourceClass := (P.twistedHomologyConstantIso (ModuleCat.of ℤ (ULift.{0} ℤ)) m).inv
    ((TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
      (chartSimplexPairMapAt m M a y hy w) (ModuleCat.of ℤ (ULift.{0} ℤ)) m).hom
        (coordinateSimplexIdentityClass.{0} m))
  exact (P.twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).map
      (ModuleCat.ofHom ULift.moduleEquiv.toLinearMap)) m).hom sourceClass

theorem chartSimplexWitness_exists (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M) :
    Nonempty (ChartSimplex m M x) :=
  chartSimplex_exists m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x)

noncomputable def chartSimplexPairMap (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M)
    (w : ChartSimplex m M x) : coordinateSimplexPair m ⟶ puncturedPair (TopCat.of M) x :=
  chartSimplexPairMapAt m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x) w

abbrev orderedChartImage (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M)
    (w : ChartSimplex m M x) : LocalHomology m M x :=
  orderedChartImageAt m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x) w

noncomputable def modelOrientationSign (m : ℕ) {M : Type} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) : ℤ := by
  classical
  exact if l.modelOrientation = (EuclideanSpace.basisFun (Fin m) ℝ).toBasis.orientation
    then 1 else -1

/-- Flipping the model orientation flips the scalar which compares it with the standard basis. -/
theorem modelOrientationSign_flip (m : ℕ) {M : Type} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) :
    modelOrientationSign m { l with modelOrientation := -l.modelOrientation } =
      -modelOrientationSign m l := by
  classical
  let b := (EuclideanSpace.basisFun (Fin m) ℝ).toBasis.orientation
  have hflip : -b ≠ b := (Module.Ray.ne_neg_self b).symm
  by_cases hb : l.modelOrientation = b
  · simp [modelOrientationSign, b, hb, hflip]
  · have hneg : l.modelOrientation = -b :=
      (Module.Basis.orientation_ne_iff_eq_neg (EuclideanSpace.basisFun (Fin m) ℝ).toBasis
        l.modelOrientation).mp hb
    unfold modelOrientationSign
    rw [hneg]
    rw [show - -b = b from neg_neg b]
    simp [b, hflip]

/-- Signed coefficient at any point of a chart source, with the point distinct from the
chart anchor in the interface. Transition Jacobians are used only to compare two charts. -/
noncomputable def rawChartCoefficient_at (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) : ℤ :=
  modelOrientationSign m l * (l.sign a ⟨y, hy⟩ : ℤ)

/-- The diagonal coefficient used in the selected point generator is this same chart value. -/
theorem rawChartCoefficient_at_self (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) (x : M) :
    rawChartCoefficient_at m M l x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x) =
      modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := rfl

/-- Simultaneously changing the model orientation and the chart sign leaves the raw coefficient
unchanged at every point of the chart source, not only at the chart anchor.
-/
theorem orientationCoefficient_raw_relation_at (m : ℕ) (M : Type)
    [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (h : l' = l ∨
      (l'.modelOrientation = -l.modelOrientation ∧
        l'.sign = fun a y ↦ -l.sign a y)) :
    rawChartCoefficient_at m M l' a y hy = rawChartCoefficient_at m M l a y hy := by
  rcases h with h | ⟨hmodel, hsign⟩
  · simp [rawChartCoefficient_at, h]
  · have hmodelSign : modelOrientationSign m l' = -modelOrientationSign m l := by
      let b := (EuclideanSpace.basisFun (Fin m) ℝ).toBasis.orientation
      have hflip : -b ≠ b := (Module.Ray.ne_neg_self b).symm
      by_cases hb : l.modelOrientation = b
      · simp [modelOrientationSign, b, hmodel, hb, hflip]
      · have hneg : l.modelOrientation = -b :=
          (Module.Basis.orientation_ne_iff_eq_neg (EuclideanSpace.basisFun (Fin m) ℝ).toBasis
            l.modelOrientation).mp hb
        unfold modelOrientationSign
        rw [hmodel, hneg]
        rw [show - -b = b from neg_neg b]
        simp [b, hflip]
    have hchartSign :
        (l'.sign a ⟨y, hy⟩ : ℤ) = -(l.sign a ⟨y, hy⟩ : ℤ) := by
      rw [hsign]
      simp
    simp only [rawChartCoefficient_at]
    rw [hmodelSign, hchartSign]
    ring


theorem orientationCoefficient_raw_relation (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (h : l' = l ∨
      (l'.modelOrientation = -l.modelOrientation ∧ l'.sign = fun a y ↦ -l.sign a y)) :
    modelOrientationSign m l' *
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) =
      modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := by
  rcases h with h | ⟨hmodel, hsign⟩
  · simp [h]
  · have hmodelSign : modelOrientationSign m l' = -modelOrientationSign m l := by
      have h1 : modelOrientationSign m l' =
          modelOrientationSign m { l with modelOrientation := -l.modelOrientation } := by
        unfold modelOrientationSign
        rw [hmodel]
      exact h1.trans (modelOrientationSign_flip m l)
    have hchartSign :
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) =
          - (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := by
      rw [hsign]
      simp
    rw [hmodelSign, hchartSign]
    ring

/-- Raw coefficient invariance under the orientation-lift relation. This is proved before
quotient descent and does not depend on any formula for the descended point generator. -/
theorem orientationCoefficient_lift_independent (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (h : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l =
      Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l') :
    modelOrientationSign m l' *
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) =
      modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := by
  exact orientationCoefficient_raw_relation m M l l' x (Quotient.exact h)

/-- Fixed-witness chart classes respect the raw lift relation, before choosing a quotient
representative. Witness independence remains the separate geometric target below. -/
theorem rawChartGenerator_lift_independent (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (w : ChartSimplex m M x)
    (h : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l =
      Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l') :
    (modelOrientationSign m l' *
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w =
      (modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w := by
  exact congrArg (fun a : ℤ => a • orderedChartImage m M x w)
    (orientationCoefficient_lift_independent m M l l' x h)

/-- The orientation-lift quotient and the chart Jacobian both enter the coefficient. -/
noncomputable def pointGenerator (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (x : M) : LocalHomology m M x := by
  let l := Quotient.out o
  let w := Classical.choice (chartSimplex_exists m M x x
    (mem_chart_source (EuclideanSpace ℝ (Fin m)) x))
  exact (modelOrientationSign m l *
    (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x w


/-- Raw representative formula for the chosen quotient representative. `pointGenerator` is
literally the signed image of AT's ordered-simplex identity class through the chart selected at
`x`; this formula is definitional and does not follow merely from quotient congruence. -/
theorem pointGenerator_raw_representative (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (x : M) :
    pointGenerator m M o x =
      ((modelOrientationSign m (Quotient.out o) *
        ((Quotient.out o).sign x
          ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) : ℤ) •
        orderedChartImage m M x (Classical.choice (chartSimplexWitness_exists m M x))) := rfl


/-- The actual raw chart-transition Jacobian law used in the overlap comparison. Its direction
matches `OrientationLift.sign_mul_sign`: chart `a'` after the inverse of chart `a`, differentiated
at the coordinate `extChartAt I a y`. Thus the transition determinant is the cocycle that cancels
the two chart signs; this is not inferred from an informal orientation convention. -/
theorem chart_transition_determinant_sign (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [FiniteDimensional ℝ (EuclideanSpace ℝ (Fin m))]
    (l : OrientationLift (Model m) M (Fin m)) (a a' y : M)
    (ha : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (ha' : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a').source) :
    ((l.sign a ⟨y, ha⟩ * l.sign a' ⟨y, ha'⟩ : ℤˣ) : ℤ) =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt (Model m) a' ∘ (extChartAt (Model m) a).symm)
          (Set.range (Model m)) (extChartAt (Model m) a y) :
            EuclideanSpace ℝ (Fin m) →ₗ[ℝ] EuclideanSpace ℝ (Fin m))) : ℤ) :=
  l.sign_mul_sign a a' y ha ha'

/-- Unsigned chart-change law in a single local-homology fibre. No orientation is chosen:
changing the chart multiplies the ordered-simplex class by the sign of the transition Jacobian. -/
theorem orderedChartImageAt_chartChange (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a a' y : M)
    (ha : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (ha' : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a').source)
    (w : ChartSimplexAt m M a y ha) (w' : ChartSimplexAt m M a' y ha') :
    orderedChartImageAt m M a y ha w =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt (Model m) a' ∘ (extChartAt (Model m) a).symm)
          (Set.range (Model m)) (extChartAt (Model m) a y) :
            EuclideanSpace ℝ (Fin m) →ₗ[ℝ] EuclideanSpace ℝ (Fin m))) : ℤ) •
        orderedChartImageAt m M a' y ha' w' := by
  sorry

/-- The two-anchor overlap law for a chosen orientation is derived from the unsigned law
and the chart-sign cocycle. The only geometric input is `orderedChartImageAt_chartChange`. -/
theorem chart_overlap_generator (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (a a' y : M)
    (ha : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (ha' : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a').source)
    (w : ChartSimplexAt m M a y ha) (w' : ChartSimplexAt m M a' y ha') :
    (modelOrientationSign m (Quotient.out o) *
      ((Quotient.out o).sign a ⟨y, ha⟩ : ℤ)) • orderedChartImageAt m M a y ha w =
    (modelOrientationSign m (Quotient.out o) *
      ((Quotient.out o).sign a' ⟨y, ha'⟩ : ℤ)) • orderedChartImageAt m M a' y ha' w' := by
  let l := Quotient.out o
  let u : ℤ := (l.sign a ⟨y, ha⟩ : ℤ)
  let v : ℤ := (l.sign a' ⟨y, ha'⟩ : ℤ)
  let d : ℤ := SignType.sign (LinearMap.det
    (fderivWithin ℝ (extChartAt (Model m) a' ∘ (extChartAt (Model m) a).symm)
      (Set.range (Model m)) (extChartAt (Model m) a y) :
        EuclideanSpace ℝ (Fin m) →ₗ[ℝ] EuclideanSpace ℝ (Fin m)))
  let c : ℤ := modelOrientationSign m l * u
  let c' : ℤ := modelOrientationSign m l * v
  have hdet : u * v = d := by
    simpa [u, v, d, l] using chart_transition_determinant_sign m M l a a' y ha ha'
  have hu : u * u = 1 := by
    dsimp [u]
    rcases Int.units_eq_one_or (l.sign a ⟨y, ha⟩) with h | h <;> simp [h]
  have hcoef : c * d = c' := by
    dsimp [c, c']
    calc
      (modelOrientationSign m l * u) * d =
          modelOrientationSign m l * (u * (u * v)) := by rw [hdet]; ring
      _ = modelOrientationSign m l * v := by
        rw [show u * (u * v) = (u * u) * v by ring, hu]
        ring
  rw [orderedChartImageAt_chartChange m M a a' y ha ha' w w']
  change c • (d • orderedChartImageAt m M a' y ha' w') =
    c' • orderedChartImageAt m M a' y ha' w'
  calc
    c • (d • orderedChartImageAt m M a' y ha' w') =
        (c * d) • orderedChartImageAt m M a' y ha' w' := by
          simpa using (smul_smul c d (orderedChartImageAt m M a' y ha' w'))
    _ = c' • orderedChartImageAt m M a' y ha' w' := by rw [hcoef]

theorem pointGenerator_chartWitness_independent (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (x : M) (w w' : ChartSimplex m M x) :
    (modelOrientationSign m l *
      (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w =
    (modelOrientationSign m l *
      (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w' := by
  sorry

theorem pointGenerator_chartFormula (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (x : M) (w : ChartSimplex m M x) :
    pointGenerator m M (Quotient.mk _ l) x =
      (modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
          orderedChartImage m M x w := by
  let l₀ := Quotient.out (Quotient.mk
    (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l)
  have hout : Quotient.mk
      (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l₀ =
      Quotient.mk _ l := Quotient.out_eq _
  have hc := orientationCoefficient_lift_independent m M l₀ l x hout
  change (modelOrientationSign m l₀ *
      (l₀.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x (Classical.choice (chartSimplexWitness_exists m M x)) = _
  rw [← hc]
  exact pointGenerator_chartWitness_independent m M l x
    (Classical.choice (chartSimplexWitness_exists m M x)) w

/-- The oriented point generator at an arbitrary point equals the signed chart class from
any anchor chart containing that point and any representative of the orientation quotient. -/
theorem pointGenerator_eq_rawChartCoefficient_at (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m))
    (l : OrientationLift (Model m) M (Fin m))
    (hl : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l = o)
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    pointGenerator m M o y =
      (rawChartCoefficient_at m M l a y hy : ℤ) • orderedChartImageAt m M a y hy w := by
  classical
  let q := Quotient.out o
  let hq : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) q =
      Quotient.mk _ l := (Quotient.out_eq o).trans hl.symm
  have hrel := Quotient.exact hq
  have hrawY := orientationCoefficient_raw_relation_at m M q l y y
    (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) hrel
  have hrawA := orientationCoefficient_raw_relation_at m M q l a y hy hrel
  let wy := Classical.choice (chartSimplexWitness_exists m M y)
  have hoverlap := chart_overlap_generator m M o y a y
    (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) hy wy w
  have hformula := pointGenerator_chartFormula m M q y wy
  have hout := Quotient.out_eq o
  calc
    pointGenerator m M o y = pointGenerator m M (Quotient.mk _ q) y := by
      exact congrArg (fun z => pointGenerator m M z y) hout.symm
    _ = (rawChartCoefficient_at m M q y y
        (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) : ℤ) •
          orderedChartImageAt m M y y (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) wy := by
      simpa [rawChartCoefficient_at, q] using hformula
    _ = (rawChartCoefficient_at m M l y y
        (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) : ℤ) •
          orderedChartImageAt m M y y (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) wy := by
      rw [hrawY]
    _ = (rawChartCoefficient_at m M l a y hy : ℤ) • orderedChartImageAt m M a y hy w := by
      have hoverlapRaw :
          rawChartCoefficient_at m M q y y
              (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) •
                orderedChartImageAt m M y y
                  (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) wy =
          rawChartCoefficient_at m M q a y hy • orderedChartImageAt m M a y hy w := by
        simpa [rawChartCoefficient_at] using hoverlap
      rw [← hrawY, ← hrawA] at hoverlapRaw
      exact hoverlapRaw

/-- Zero-dimensional signed point normalization in an arbitrary chart: the local generator is
exactly the chart's raw orientation coefficient times the image of its coordinate 0-simplex.
This records the sign and the local point class; it does not identify `H₀` with a global finite
sum of point classes. -/
theorem pointGenerator_zero (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (Model 0) ∞ M] [BoundarylessManifold (Model 0) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin 0)) a).source)
    (w : ChartSimplexAt 0 M a y hy) :
    pointGenerator 0 M o y =
      (rawChartCoefficient_at 0 M (Quotient.out o) a y hy : ℤ) •
        orderedChartImageAt 0 M a y hy w := by
  exact pointGenerator_eq_rawChartCoefficient_at 0 M o (Quotient.out o)
    (Quotient.out_eq o) a y hy w

/-- The dimension-zero orientation sign compares the orientation at a point with the orientation
of the canonical empty basis of `EuclideanSpace ℝ (Fin 0)`. This is the shared meaning of the
`ε_o(x)` appearing in the DG 9.3 zero-dimensional formula. -/
noncomputable def orientationSignAt (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (x : M) : ℤˣ := by
  classical
  exact if orientationAt o x = (EuclideanSpace.basisFun (Fin 0) ℝ).toBasis.orientation
    then 1 else -1

/-- For the chart centered at `x`, the raw chart coefficient in dimension zero is precisely the
orientation relative to the empty ordered basis. -/
theorem orientationSignAt_eq_rawChartCoefficient (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M] [IsManifold (Model 0) ∞ M]
    [BoundarylessManifold (Model 0) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (x : M) :
    (orientationSignAt M o x : ℤ) =
      rawChartCoefficient_at 0 M (Quotient.out o) x x
        (mem_chart_source (EuclideanSpace ℝ (Fin 0)) x) := by
  sorry

/-- The ordered coordinate 0-simplex is the unsigned positive point class. Its value is
independent of the simplex witness (the coordinate domain is the singleton `EuclideanSpace ℝ
(Fin 0)`). -/
theorem orderedChartImageAt_zero_witness_independent (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M] [IsManifold (Model 0) ∞ M]
    [BoundarylessManifold (Model 0) M]
    (x : M) (w w' : ChartSimplex 0 M x) :
    orderedChartImage 0 M x w = orderedChartImage 0 M x w' := by
  sorry

/-- The selected local generator is the empty-basis sign times the positive coordinate point
class. This is the dimension-zero specialization consumed by integration. -/
theorem pointGenerator_zero_orientationAt (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (Model 0) ∞ M] [BoundarylessManifold (Model 0) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (x : M) (w : ChartSimplex 0 M x) :
    pointGenerator 0 M o x =
      (orientationSignAt M o x : ℤ) • orderedChartImage 0 M x w := by
  sorry

/-- Congruence for already equal orientation quotient classes; raw invariance is proved above. -/
theorem pointGenerator_quotient_congr (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (h : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l =
      Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l') :
    pointGenerator m M (Quotient.mk _ l) x = pointGenerator m M (Quotient.mk _ l') x := by
  exact congrArg (fun o => pointGenerator m M o x) h

/-- Reversing the chosen tangent orientation negates its normalized integral point generator.
This is the scalar sign calculation on one chart witness, before any integration comparison. -/
theorem pointGenerator_neg (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (x : M) :
    pointGenerator m M o.neg x = -pointGenerator m M o x := by
  classical
  let l := Quotient.out o
  let w := Classical.choice (chartSimplexWitness_exists m M x)
  have ho : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l = o :=
    Quotient.out_eq o
  have hneg : o.neg = Quotient.mk _ { l with modelOrientation := -l.modelOrientation } := by
    rw [← ho]
    rfl
  have hout : Quotient.mk
      (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m))
      (Quotient.out o.neg) =
      Quotient.mk _ { l with modelOrientation := -l.modelOrientation } :=
    (Quotient.out_eq o.neg).trans hneg
  have hc := orientationCoefficient_lift_independent m M (Quotient.out o.neg)
    { l with modelOrientation := -l.modelOrientation } x hout
  change (modelOrientationSign m (Quotient.out o.neg) *
      ((Quotient.out o.neg).sign x
        ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x w =
    -((modelOrientationSign m l *
      (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x w)
  rw [← hc, modelOrientationSign_flip]
  simp only [neg_mul, neg_zsmul]

/-! AT-owned chart-local support constructions. Kept in this module so the selected section
can consume the actual signed local-image theorem without an import cycle. -/
abbrev StdSimplexInterior (m : ℕ) :=
  {t : Convexity.StdSimplex ℝ (Fin (m + 1)) | ∀ i, 0 < t.weights i}

def chartSimplexInteriorImage (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : Set M :=
  Set.range fun t : StdSimplexInterior m => w.map (ULift.up t.1)

theorem chartSimplexAt_map_injective (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : Function.Injective w.map := by
  sorry

theorem chartSimplexAt_boundary_disjoint_interiorImage (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    Disjoint (Set.range fun t : (coordinateSimplexPair m).snd => w.map t.1)
      (chartSimplexInteriorImage m M a y hy w) := by
  sorry

theorem chartSimplexInteriorImage_subset_chartSource (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    chartSimplexInteriorImage m M a y hy w ⊆
      (chartAt (EuclideanSpace ℝ (Fin m)) a).source := by
  sorry

/-- Continuous chart signs are constant on a connected subset of one chart source. This is the
local-constancy step: the codomain `ℤˣ` has its discrete topology and the source sign is the
`OrientationLift.continuous_sign` field.
-/
theorem chartSign_constant_on_connected (m : ℕ) (M : Type)
    [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) (a : M) (S : Set M)
    (hS : IsConnected S)
    (hsource : S ⊆ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) :
    ∀ x (hx : x ∈ S) y (hy : y ∈ S),
      l.sign a ⟨x, hsource hx⟩ = l.sign a ⟨y, hsource hy⟩ := by
  sorry

theorem chartSimplexAt_anchor_mem_interiorImage (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    y ∈ chartSimplexInteriorImage m M a y hy w := by
  sorry

/-- The pair map is induced by the actual chart simplex.  The support hypothesis places the
support in the positive-weight simplex image; injectivity separates it from every boundary face.
-/
noncomputable def chartSimplexSupportPairMap (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w) :
    coordinateSimplexPair m ⟶ TopPair.ofSubset (X := TopCat.of M) Sᶜ := by
  refine TopPair.ofSubsetMap w.map ?_
  intro z hz
  change w.map z ∈ Sᶜ
  intro hnot
  have hboundary : w.map z ∈ Set.range fun t : (coordinateSimplexPair m).snd => w.map t.1 :=
    ⟨⟨z, hz⟩, rfl⟩
  have hinterior := hS hnot
  exact (Set.disjoint_left.mp (chartSimplexAt_boundary_disjoint_interiorImage
    m M a y hy w) hboundary hinterior)

/-- The support class is the image of AT's ordered identity class.  The two coefficient changes
are explicit: the relative constant-system isomorphism and the constant-functor map induced by
`ULift.moduleEquiv`.
-/
noncomputable def chartSimplexSupportClass (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w) :
    twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Sᶜ)
      (IntegralSystem M) m := by
  let P := TopPair.ofSubset (X := TopCat.of M) Sᶜ
  let c := (P.twistedHomologyConstantIso (ModuleCat.of ℤ (ULift.{0} ℤ)) m).inv
    ((TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
      (chartSimplexSupportPairMap m M a y hy w S hS)
      (ModuleCat.of ℤ (ULift.{0} ℤ)) m).hom (coordinateSimplexIdentityClass.{0} m))
  exact (P.twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).map
      (ModuleCat.ofHom ULift.moduleEquiv.toLinearMap)) m).hom c

/-- The geometric local-image theorem is unsigned: localizing the image of the ordered simplex
identity class gives the recentered ordered-simplex class, with no orientation lift in the
statement. This avoids making an orientation-independent class depend on `l`.
-/
theorem chartSimplexSupportClass_local_image (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w)
    (x : M) (hx : x ∈ S)
    (hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w' : ChartSimplexAt m M a x hxchart) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom
        (chartSimplexSupportClass m M a y hy w S hS) =
      orderedChartImageAt m M a x hxchart w' := by
  sorry

/-- Scalar compatibility of the native support-local homology map. -/
theorem twistedSupportLocalMap_smul (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    (S : Set M) (x : M) (hx : x ∈ S)
    (c : ℤ)
    (z : twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Sᶜ)
      (IntegralSystem M) m) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom (c • z) =
      c • (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom z := by
  exact map_zsmul _ c z

/- The positive-weight simplex is connected, and its chart image remains connected. This is the
topological input that turns local constancy of the ±1 chart sign into constancy on the whole
simplex image.
-/
theorem chartSimplexInteriorImage_isConnected (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    IsConnected (chartSimplexInteriorImage m M a y hy w) := by
  sorry

/-- The positive-weight simplex image is open in the manifold. The proof is the image of
the open standard simplex under the chart diffeomorphism and the nondegenerate affine simplex map. -/
theorem chartSimplexInteriorImage_isOpen (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : IsOpen (chartSimplexInteriorImage m M a y hy w) := by
  sorry

theorem rawChartCoefficient_at_constant_on_chartSimplexInterior (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    ∀ x ∈ chartSimplexInteriorImage m M a y hy w,
      ∀ hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source,
        rawChartCoefficient_at m M l a x hxchart = rawChartCoefficient_at m M l a y hy := by
  have hconn := chartSimplexInteriorImage_isConnected m M a y hy w
  have hsource := chartSimplexInteriorImage_subset_chartSource m M a y hy w
  have hcenter := chartSimplexAt_anchor_mem_interiorImage m M a y hy w
  intro x hx hxchart
  have hsign := chartSign_constant_on_connected m M l a
    (chartSimplexInteriorImage m M a y hy w) hconn hsource x hx y hcenter
  have hsignZ : (l.sign a ⟨x, hxchart⟩ : ℤ) = (l.sign a ⟨y, hy⟩ : ℤ) :=
    congrArg (fun s : ℤˣ => (s : ℤ)) hsign
  simp only [rawChartCoefficient_at]
  rw [hsignZ]

/-- Multiply the unsigned support class by its raw coefficient at the original chart center.
Connected-image constancy identifies this scalar with the coefficient at each support point.
-/
theorem chartSimplexSupportClass_signed_local_image (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w)
    (x : M) (hx : x ∈ S)
    (hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w' : ChartSimplexAt m M a x hxchart) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom
        ((rawChartCoefficient_at m M l a y hy : ℤ) •
          chartSimplexSupportClass m M a y hy w S hS) =
      (rawChartCoefficient_at m M l a x hxchart : ℤ) •
        orderedChartImageAt m M a x hxchart w' := by
  rw [twistedSupportLocalMap_smul m M S x hx
    (rawChartCoefficient_at m M l a y hy : ℤ)
    (chartSimplexSupportClass m M a y hy w S hS)]
  rw [chartSimplexSupportClass_local_image m M a y hy w S hS x hx hxchart w']
  rw [rawChartCoefficient_at_constant_on_chartSimplexInterior
    m M l a y hy w x (hS hx) hxchart]

/-- A signed chart-support class represents the selected point generator at every point of
its support, using the arbitrary-anchor and arbitrary-lift chart formula. -/
theorem chartSimplexSupportClass_signed_local_image_pointGenerator
    (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m))
    (l : OrientationLift (Model m) M (Fin m))
    (hl : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l = o)
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w)
    (x : M) (hx : x ∈ S)
    (hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w' : ChartSimplexAt m M a x hxchart) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom
        ((rawChartCoefficient_at m M l a y hy : ℤ) •
          chartSimplexSupportClass m M a y hy w S hS) = pointGenerator m M o x := by
  rw [chartSimplexSupportClass_signed_local_image m M l a y hy w S hS x hx hxchart w']
  exact (pointGenerator_eq_rawChartCoefficient_at m M o l hl a x hxchart w').symm


/-- The orientation-selected section uses AT's existing section carrier and compact-support class
factory. Its local-representation proof is an explicit chart-overlap target below. -/
noncomputable def chosenSection (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) :
    LocallyRepresentedTopSection ℤ (TopCat.of M) (IntegralSystem M) m Set.univ where
  localValue := fun x _ => pointGenerator m M o x
  locally_represented := by
    intro x hx
    let hxchart := mem_chart_source (EuclideanSpace ℝ (Fin m)) x
    let w := Classical.choice (chartSimplexWitness_exists m M x)
    let U := chartSimplexInteriorImage m M x x hxchart w
    have hopen : IsOpen U := chartSimplexInteriorImage_isOpen m M x x hxchart w
    have hcenter : x ∈ U := chartSimplexAt_anchor_mem_interiorImage m M x x hxchart w
    refine ⟨U, Set.subset_univ U, hopen, hcenter, ?_⟩
    let l := Quotient.out o
    let c := (rawChartCoefficient_at m M l x x hxchart : ℤ) •
      chartSimplexSupportClass m M x x hxchart w U (Set.Subset.rfl)
    refine ⟨c, ?_⟩
    intro y hy
    have hychart := chartSimplexInteriorImage_subset_chartSource m M x x hxchart w hy
    let wy := Classical.choice (chartSimplex_exists m M x y hychart)
    have hlocal := chartSimplexSupportClass_signed_local_image_pointGenerator
      m M o l (Quotient.out_eq o) x x hxchart w U (Set.Subset.rfl) y hy hychart wy
    simpa [c, l, rawChartCoefficient_at] using hlocal

/-- The unique AT compact-support class selected by `chosenSection`. This is the AT 6.3
factory, not a second DG class carrier. -/
noncomputable def chosenCompactClass (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set (TopCat.of M)) (hK : IsCompact K) (o : Manifold.Orientation (Model m) M (Fin m)) :
    twistedRelativeHomology ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m :=
  Classical.choose (compactSupportTopClass_existsUnique ℤ m (TopCat.of M)
    (IntegralSystem M) K Set.univ hK isOpen_univ (Set.subset_univ K)
    (chosenSection m M o)).exists

theorem chosenCompactClass_local (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set (TopCat.of M)) (hK : IsCompact K) (o : Manifold.Orientation (Model m) M (Fin m))
    (x : TopCat.of M) (hx : x ∈ K) :
    twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx
      (chosenCompactClass m M K hK o) = pointGenerator m M o x := by
  have hspec := Classical.choose_spec
    (compactSupportTopClass_existsUnique ℤ m M (IntegralSystem M) K Set.univ hK
      isOpen_univ (Set.subset_univ K) (chosenSection m M o)).exists
  simpa [chosenCompactClass, chosenSection, pointGenerator, twistedSupportLocalMap,
    twistedRelativeLocalMap] using hspec x hx


theorem chosenCompactClass_unique (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation (Model m) M (Fin m))
    (d : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => pointGenerator m M o x)) :
    d.fundamentalClass = chosenCompactClass m M K hK o := by
  let hfac := compactSupportTopClass_existsUnique ℤ m M (IntegralSystem M) K Set.univ hK
    isOpen_univ (Set.subset_univ K) (chosenSection m M o)
  have hd : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx
        d.fundamentalClass = pointGenerator m M o x := by
    intro x hx
    have hlocal :
        twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx =
        twistedRelativeLocalMap ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
          (IntegralSystem M) m x (by
            intro h
            rcases h with ⟨y, hy⟩
            have hmem : y.val ∈ K := by
              change (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K
              rw [hy]
              exact hx
            exact y.property hmem) := rfl
    rw [hlocal]
    exact d.local_eq x (by
      intro h
      rcases h with ⟨y, hy⟩
      have hmem : y.val ∈ K := by
        change (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K
        rw [hy]
        exact hx
      exact y.property hmem)
  have hc : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx
        (chosenCompactClass m M K hK o) = pointGenerator m M o x :=
    chosenCompactClass_local m M K hK o
  exact ExistsUnique.unique hfac (y₁ := d.fundamentalClass)
    (y₂ := chosenCompactClass m M K hK o) hd hc


/-- The selected class is packaged in the existing AT local-normalization carrier. Its local
normalization is the AT compact-support factory output; the support-map/relative-map identity is
proved by the pair definitions. -/
noncomputable def chosenCompactDatum (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set M) (hK : IsCompact K) (o : Manifold.Orientation (Model m) M (Fin m)) :
    RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
      (IntegralSystem M) m (fun x _ => pointGenerator m M o x) := by
  refine ⟨chosenCompactClass m M K hK o, ?_⟩
  intro x hx
  have hxK : x ∈ K := by
    by_contra hKx
    apply hx
    exact ⟨⟨x, hKx⟩, rfl⟩
  have hlocal :
      twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hxK =
        twistedRelativeLocalMap ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
          (IntegralSystem M) m x (by
            intro h
            rcases h with ⟨y, hy⟩
            have hmem : y.val ∈ K := by
              change (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K
              rw [hy]
              exact hxK
            exact y.property hmem) := rfl
  rw [← hlocal]
  exact chosenCompactClass_local m M K hK o x hxK


end OrientationComparison

end OrientationComparison

section CompactOrientationLaws

/-!
AT-owned pure integer/local/class laws for compactly supported orientation classes.
This module depends on AT's orientation comparison and relative-class carriers only.  It does
not import the DG compact-integration interface; smooth forms and real coefficient maps remain
in DG.  Excision and geometric naturality statements below are explicit implementation targets.
-/

namespace CompactOrientationLaws

abbrev Model (m : ℕ) := modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))
abbrev IntegralSystem (M : Type) [TopologicalSpace M] :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj (ModuleCat.of ℤ ℤ)
abbrev RelativeHomology (m : ℕ) (M : Type) [TopologicalSpace M] (K : Set M) :=
  twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
    (IntegralSystem M) m
abbrev LocalHomology (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] (x : M) :=
  twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x) (IntegralSystem M) m
abbrev ManifoldOrientation (m : ℕ) (M : Type) [TopologicalSpace M] [ChartedSpace
    (EuclideanSpace ℝ (Fin m)) M] := Manifold.Orientation (Model m) M (Fin m)
abbrev PointGenerator (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] :=
  TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator m M

/-- Coefficient-correct homology map for a map of pairs with constant coefficients. -/
noncomputable def constantSystemHomologyMap {R : Type u} [Ring R] {P Q : TopPair.{v}}
    (f : P ⟶ Q) (V : ModuleCat.{max v w} R) (m : ℕ) :
    P.twistedHomology ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).obj V) m ⟶
      Q.twistedHomology ((TauCeti.LocalCoefficientSystem.constantFunctor Q.fst).obj V) m := by
  let e := TauCeti.LocalCoefficientSystem.pullbackConstantIso (TopPair.Hom.fst f).hom V
  exact P.twistedHomologyCoefficientMap e.inv m ≫
    TopPair.twistedHomologyMap f
      ((TauCeti.LocalCoefficientSystem.constantFunctor Q.fst).obj V) m

/-- Pair map in the direction induced by support inclusion K ⊆ K'. -/
noncomputable def supportEnlargementPairMap {M : Type} [TopologicalSpace M]
    (K K' : Set M) (hKK' : K ⊆ K') :
    TopPair.ofSubset (X := TopCat.of M) K'ᶜ ⟶ TopPair.ofSubset (X := TopCat.of M) Kᶜ :=
  TopPair.ofSubsetMap (𝟙 (TopCat.of M)) (by
    intro x hx
    change x ∉ K
    intro hxK
    exact hx (hKK' hxK))

/-- Constant-integral homology map induced by enlargement of support. -/
noncomputable def supportEnlargementHomologyMap (m : ℕ) (M : Type)
    [TopologicalSpace M] (K K' : Set M) (hKK' : K ⊆ K') :
    RelativeHomology m M K' ⟶ RelativeHomology m M K :=
  constantSystemHomologyMap (supportEnlargementPairMap (M := M) K K' hKK')
    (ModuleCat.of ℤ ℤ) m

/-- Pair map for support transported along an open embedding. -/
noncomputable def supportOpenEmbeddingPairMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M) :
    TopPair.ofSubset (X := TopCat.of M) Kᶜ ⟶
      TopPair.ofSubset (X := TopCat.of N) (f '' K)ᶜ :=
  TopPair.ofSubsetMap (TopCat.ofHom ⟨f, hf.continuous⟩) (by
    intro x hx
    change f x ∉ f '' K
    intro h
    rcases h with ⟨y, hy, hxy⟩
    exact hx (hf.toIsEmbedding.injective hxy ▸ hy))

/-- Integral homology map on the support-pair open embedding, including constant-system pullback. -/
noncomputable def supportOpenEmbeddingHomologyMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M) (m : ℕ) :
    RelativeHomology m M K ⟶ RelativeHomology m N (f '' K) :=
  constantSystemHomologyMap (supportOpenEmbeddingPairMap f hf K) (ModuleCat.of ℤ ℤ) m

/-- Integral local-homology map for an open embedding, using AT's native canonical
constant-system pullback comparison. -/
noncomputable def localOpenEmbeddingHomologyMap {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    (m : ℕ) [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [IsManifold (Model m) ∞ N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (x : M) :
    LocalHomology m M x ⟶ LocalHomology m N (f x) :=
  AlgebraicTopology.embeddingIntegralLocalMap
    (TopCat.ofHom ⟨f, hf.continuous⟩) hf.toIsEmbedding.injective x m

/-- Local point generator is natural under an orientation-preserving open embedding.
The tangent map and orientation transport are explicit hypotheses; the proof is an AT chart
comparison target, independent of integration. -/
theorem pointGenerator_openEmbedding_natural {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    (m : ℕ) [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    [IsManifold (Model m) ∞ N] [BoundarylessManifold (Model m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (Model m) x ≃ₗ[ℝ] TangentSpace (Model m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (Model m) (Model m) f x)
    (oM : ManifoldOrientation m M) (oN : ManifoldOrientation m N)
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (x : M) :
    (localOpenEmbeddingHomologyMap m f hf x).hom (PointGenerator m M oM x) =
      PointGenerator m N oN (f x) := by
  sorry

/-- Uniqueness of the AT selected compact class among relative classes with the same normalized
local images. -/
theorem chosenCompactClass_unique (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : ManifoldOrientation m M)
    (d : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x)) :
    d.fundamentalClass = OrientationComparison.chosenCompactClass m M K hK o := by
  exact OrientationComparison.chosenCompactClass_unique m M K hK o d

/-- Canonical compact-support class selected by AT's locally represented orientation section. -/
noncomputable abbrev chosenCompactClass := OrientationComparison.chosenCompactClass
noncomputable abbrev chosenCompactDatum := OrientationComparison.chosenCompactDatum

/-- Two class data with the same prescribed normalized local images are equal. -/
theorem relativeClass_unique (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : ManifoldOrientation m M)
    (a b : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x))
    : a = b := by
  have ha := OrientationComparison.chosenCompactClass_unique m M K hK o a
  have hb := OrientationComparison.chosenCompactClass_unique m M K hK o b
  have hab : a.fundamentalClass = b.fundamentalClass := ha.trans hb.symm
  cases a with
  | mk ac al =>
    cases b with
    | mk bc bl =>
      simp_all

/-- Compatibility of two normalized relative class data with support enlargement. -/
theorem relativeClass_enlarge (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K K' : Set (TopCat.of M))
    (hK : IsCompact K) (hK' : IsCompact K') (hKK' : K ⊆ K') (o : ManifoldOrientation m M)
    (c : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x))
    (c' : RelativeTwistedClassDatum ℤ (TopPair.ofSubset K'ᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M o x)) :
    (supportEnlargementHomologyMap m M K K' hKK').hom c'.fundamentalClass =
      c.fundamentalClass := by
  sorry

/-- Naturality of arbitrary normalized compact-support class data for an oriented open embedding. -/
theorem relativeClass_openEmbedding_natural (m : ℕ) {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [IsManifold (Model m) ∞ N]
    [BoundarylessManifold (Model m) M] [BoundarylessManifold (Model m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (Model m) x ≃ₗ[ℝ] TangentSpace (Model m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (Model m) (Model m) f x)
    (oM : ManifoldOrientation m M) (oN : ManifoldOrientation m N)
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (K : Set M) (hK : IsCompact K) (hK' : IsCompact (f '' K))
    (c : RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ) (IntegralSystem M) m
      (fun x _ => PointGenerator m M oM x))
    (c' : RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of N) (f '' K)ᶜ) (IntegralSystem N) m
      (fun x _ => PointGenerator m N oN x)) :
    (supportOpenEmbeddingHomologyMap f hf K m).hom c.fundamentalClass =
      c'.fundamentalClass := by
  sorry

/-- Negation law for the chosen integral compact class, derived from point-generator negation
and uniqueness of the normalized class. -/
theorem chosenCompactClass_orientation_neg (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K : Set M) (hK : IsCompact K)
    (o : ManifoldOrientation m M) :
    (chosenCompactDatum m M K hK o.neg).fundamentalClass =
      -(chosenCompactDatum m M K hK o).fundamentalClass := by
  sorry

/-- Compact-class compatibility with the actual support-enlargement homology map. -/
theorem chosenCompactClass_enlarge (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K K' : Set M)
    (hK : IsCompact K) (hK' : IsCompact K') (hKK' : K ⊆ K') (o : ManifoldOrientation m M) :
    (supportEnlargementHomologyMap m M K K' hKK').hom
      (chosenCompactDatum m M K' hK' o).fundamentalClass =
      (chosenCompactDatum m M K hK o).fundamentalClass := by
  sorry

/-- Compact-class naturality for an oriented open embedding. -/
theorem chosenCompactClass_openEmbedding_natural (m : ℕ) {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space M] [T2Space N]
    [SecondCountableTopology M] [SecondCountableTopology N]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]
    [IsManifold (Model m) ∞ M] [IsManifold (Model m) ∞ N]
    [BoundarylessManifold (Model m) M] [BoundarylessManifold (Model m) N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f)
    (d : ∀ x, TangentSpace (Model m) x ≃ₗ[ℝ] TangentSpace (Model m) (f x))
    (hd : ∀ x, (d x).toLinearMap = mfderiv (Model m) (Model m) f x)
    (oM : ManifoldOrientation m M) (oN : ManifoldOrientation m N)
    (hori : ∀ x, Orientation.map (Fin m) (d x) (orientationAt oM x) = orientationAt oN (f x))
    (K : Set M) (hK : IsCompact K) (hK' : IsCompact (f '' K)) :
    (supportOpenEmbeddingHomologyMap f hf K m).hom
      (chosenCompactDatum m M K hK oM).fundamentalClass =
      (chosenCompactDatum m N (f '' K) hK' oN).fundamentalClass := by
  sorry

/-- The canonical component map for two support subsets is the pair of the two actual
support-enlargement maps. -/
noncomputable def disjointSupportComponentMap (m : ℕ) (M : Type)
    [TopologicalSpace M] (K₁ K₂ : Set M) :
    RelativeHomology m M (K₁ ∪ K₂) →ₗ[ℤ]
      (RelativeHomology m M K₁ × RelativeHomology m M K₂) := by
  let f₁ := supportEnlargementHomologyMap m M K₁ (K₁ ∪ K₂) (by intro x hx; exact Or.inl hx)
  let f₂ := supportEnlargementHomologyMap m M K₂ (K₁ ∪ K₂) (by intro x hx; exact Or.inr hx)
  refine { toFun := fun x => (f₁.hom x, f₂.hom x), map_add' := ?_, map_smul' := ?_ }
  · intro x y
    ext <;> simp
  · intro z x
    ext
    · simp only [Prod.smul_fst, RingHom.id_apply]
      rw [← int_smul_eq_zsmul (inferInstance : Module ℤ (RelativeHomology m M K₁)) z (f₁.hom x)]
      exact f₁.hom.map_smul z x
    · simp only [Prod.smul_snd, RingHom.id_apply]
      rw [← int_smul_eq_zsmul (inferInstance : Module ℤ (RelativeHomology m M K₂)) z (f₂.hom x)]
      exact f₂.hom.map_smul z x

/-- Excision for compact disjoint supports. The inverse is an implementation target based on
AT's excision theorem; the forward map is specified as the actual component map, not arbitrary
isomorphic data. -/
noncomputable def disjointSupportExcisionIso (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] (K₁ K₂ : Set M)
    (hK₁ : IsCompact K₁) (hK₂ : IsCompact K₂) (hdisj : Disjoint K₁ K₂) :
    RelativeHomology m M (K₁ ∪ K₂) ≃ₗ[ℤ]
      (RelativeHomology m M K₁ × RelativeHomology m M K₂) := by
  refine LinearEquiv.ofBijective (disjointSupportComponentMap m M K₁ K₂) ?_
  sorry

/-- The selected compact class decomposes under compact-disjoint-support excision. -/
theorem disjointComponentFundamentalClass_additivity (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M] (K₁ K₂ : Set M)
    (h₁ : IsCompact K₁) (h₂ : IsCompact K₂) (hdisj : Disjoint K₁ K₂)
    (o : ManifoldOrientation m M) :
    disjointSupportExcisionIso m M K₁ K₂ h₁ h₂ hdisj
      (chosenCompactClass m M (K₁ ∪ K₂) (h₁.union h₂) o) =
      (chosenCompactClass m M K₁ h₁ o, chosenCompactClass m M K₂ h₂ o) := by
  sorry

end CompactOrientationLaws

end CompactOrientationLaws

section GeneralModelOrientation

/-!
AT6.3 orientation-selected general-model classes. The ordinary integer classes exported below
are images of OrientationComparison's selected point generators and compact-support class on a
fresh Euclidean carrier. No Euclidean `ChartedSpace` instance is installed on the original `M`.
-/

open Limits

namespace GeneralModelOrientation

variable {E H M : Type}
variable [normedAddE : NormedAddCommGroup E] [normedSpaceE : NormedSpace ℝ E]
variable [finiteDimE : FiniteDimensional ℝ E]
variable [topologyH : TopologicalSpace H] [topologyM : TopologicalSpace M]
variable [t2M : T2Space M] [secondCountableM : SecondCountableTopology M]
variable (I : ModelWithCorners ℝ E H)
variable [chartedM : ChartedSpace H M] [smoothM : IsManifold I ∞ M]
variable [boundarylessM : BoundarylessManifold I M]

include finiteDimE t2M secondCountableM smoothM boundarylessM I

abbrev EuclideanModel (m : ℕ) :=
  modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))

/-- The rechart choice indexes a new type, so instance search never sees two Euclidean atlases
on one underlying manifold. -/
abbrev RechartedInterior (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :=
  @FreshInteriorRechart.Carrier E H M normedAddE normedSpaceE topologyH topologyM I chartedM m e

@[instance_reducible]
noncomputable def rechartedInteriorChartedSpace (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    ChartedSpace (EuclideanSpace ℝ (Fin m)) (RechartedInterior (I := I) (M := M) m e) :=
  FreshInteriorRechart.chartedSpace I m e

noncomputable instance rechartedInteriorChartedSpaceInstance (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    ChartedSpace (EuclideanSpace ℝ (Fin m)) (RechartedInterior (I := I) (M := M) m e) :=
  rechartedInteriorChartedSpace I m e

omit t2M secondCountableM boundarylessM in
/-- The preferred chart on the boundaryless orientation carrier is the same reparameterized
interior chart used by `FreshInteriorRechart`: apply the original model map and then `e`. -/
theorem rechartedInteriorChartAt_formula (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (x y : RechartedInterior (I := I) (M := M) m e)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) x).source) :
    chartAt (EuclideanSpace ℝ (Fin m)) x y =
      e (I ((chartAt H (x.point : M)) (y.point : M))) := by
  exact FreshInteriorRechart.chartAt_apply I m e x y hy

omit t2M secondCountableM boundarylessM in
theorem rechartedInteriorIsManifold (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
      (RechartedInterior (I := I) (M := M) m e) := rechartedInteriorChartedSpace I m e
    IsManifold (EuclideanModel m) ∞ (RechartedInterior (I := I) (M := M) m e) := by
  exact FreshInteriorRechart.isManifold I m e

noncomputable instance rechartedInteriorIsManifoldInstance (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    IsManifold (EuclideanModel m) ∞ (RechartedInterior (I := I) (M := M) m e) := by
  let : ChartedSpace (EuclideanSpace ℝ (Fin m))
    (RechartedInterior (I := I) (M := M) m e) := rechartedInteriorChartedSpace I m e
  exact rechartedInteriorIsManifold I m e

instance rechartedInteriorBoundaryless (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
      (RechartedInterior (I := I) (M := M) m e) := rechartedInteriorChartedSpace I m e
    BoundarylessManifold (EuclideanModel m) (RechartedInterior (I := I) (M := M) m e) := by
  exact FreshInteriorRechart.boundaryless I m e

/-- Topological carrier equivalence. Its pointwise law pins it to the original subtype value. -/
noncomputable def carrierHomeomorph (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    RechartedInterior (I := I) (M := M) m e ≃ₜ M :=
  FreshInteriorRechart.carrierHomeomorphOriginal I m e

omit t2M secondCountableM in
theorem carrierHomeomorph_apply (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (x : RechartedInterior (I := I) (M := M) m e) :
    carrierHomeomorph I m e x = (x.point : M) := by
  exact FreshInteriorRechart.carrierHomeomorphOriginal_apply I m e x

/-- Smooth carrier equivalence: Euclidean rechart on the domain, original model `I` on `M`. -/
noncomputable def carrierValDiffeomorph (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    Diffeomorph (EuclideanModel m) I
      (RechartedInterior (I := I) (M := M) m e) M ∞ := by
  let _ := finiteDimE
  let _ := t2M
  let _ := secondCountableM
  let _ := smoothM
  let _ := boundarylessM
  sorry

theorem carrierValDiffeomorph_toHomeomorph (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    (carrierValDiffeomorph (I := I) (M := M) m e).toHomeomorph =
      carrierHomeomorph (I := I) (M := M) m e := by
  sorry

/-- Pull back the given orientation through the derivative of the carrier diffeomorphism. -/
noncomputable def carrierOrientation (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) :
    Manifold.Orientation (EuclideanModel m) (RechartedInterior (I := I) (M := M) m e)
      (Fin m) := by
  let C := RechartedInterior (I := I) (M := M) m e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C :=
    rechartedInteriorChartedSpace I m e
  letI : IsManifold (EuclideanModel m) ∞ C :=
    rechartedInteriorIsManifold I m e
  let hf : IsLocalDiffeomorph (EuclideanModel m) I ∞
      (fun y : C => (y.point : M)) :=
    fun y => FreshInteriorRechart.isLocalDiffeomorph_val I m e y
  exact Manifold.Orientation.pullback hf (by norm_num) o

/-- Exact tangent-orientation comparison used to select the Euclidean-carrier generator. -/
theorem carrierOrientationAt_spec (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m))
    (x : RechartedInterior (I := I) (M := M) m e) :
    Orientation.map (Fin m)
      ((carrierValDiffeomorph I m e).mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv
      (orientationAt (carrierOrientation I m e o) x) =
        orientationAt o ((carrierValDiffeomorph I m e) x) := by
  sorry

noncomputable def carrierToOriginal (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    TopCat.of (RechartedInterior (I := I) (M := M) m e) ⟶ TopCat.of M :=
  TopCat.ofHom ⟨fun x => carrierHomeomorph I m e x,
    (carrierHomeomorph I m e).continuous⟩

abbrev IntegralSystem (X : TopCat) : TauCeti.LocalCoefficientSystem ℤ X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj (ModuleCat.of ℤ ℤ)

noncomputable def carrierSupport (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) : Set (TopCat.of (RechartedInterior (I := I) (M := M) m e)) :=
  {y | carrierHomeomorph I m e y ∈ K}

noncomputable def carrierSupportPairMap (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) (K : Set (TopCat.of M)) :
    TopPair.ofSubset (carrierSupport I m e K)ᶜ ⟶ TopPair.ofSubset Kᶜ :=
  TopPair.ofSubsetMap (carrierToOriginal I m e) (by
    intro y hy
    change carrierHomeomorph I m e y ∉ K
    simpa [carrierSupport] using hy)

/-- Ordinary integer local generator on `M`, obtained from AT's orientation-selected generator
on the Euclidean carrier and the explicit native constant-system pullback isomorphism. -/
noncomputable def pointGenerator (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) (x : TopCat.of M) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x) (IntegralSystem (TopCat.of M)) m := by
  have hx : carrierHomeomorph I m e ((carrierHomeomorph I m e).symm x) = x :=
    (carrierHomeomorph I m e).apply_symm_apply x
  rw [← hx]
  exact TauCetiRoadmap.AlgebraicTopology.embeddingIntegralLocalMap
    (carrierToOriginal I m e)
    (carrierHomeomorph I m e).injective ((carrierHomeomorph I m e).symm x) m
    (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator m
      (RechartedInterior (I := I) (M := M) m e) (carrierOrientation I m e o)
      ((carrierHomeomorph I m e).symm x))

/-- Lift the carrier's selected section through the actual carrier map and constant pullback
comparison. The carrier section is exactly AT6.3's `chosenSection`. -/
noncomputable def chosenSection (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) :
    LocallyRepresentedTopSection ℤ (TopCat.of M) (IntegralSystem (TopCat.of M)) m Set.univ where
  localValue := fun x _ => pointGenerator I m e o x
  locally_represented := by
    intro x hx
    let C := RechartedInterior (I := I) (M := M) m e
    let : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := rechartedInteriorChartedSpace I m e
    let : IsManifold (EuclideanModel m) ∞ C := rechartedInteriorIsManifold I m e
    let : BoundarylessManifold (EuclideanModel m) C := rechartedInteriorBoundaryless I m e
    let S := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenSection
      m C (carrierOrientation I m e o)
    obtain ⟨B, hBU, hBopen, hxB, c, hc⟩ := S.locally_represented
      ((carrierHomeomorph I m e).symm x) (Set.mem_univ _)
    -- Transport this AT witness across the carrier homeomorphism, using the exact pointwise
    -- carrier law and the two pair-map naturality squares to identify its local generator.
    sorry

/-- Actual ordinary integral class on the original pair `(M, M \ K)`. It is the image of
OrientationComparison's chosen compact class on the fresh carrier, after the explicit constant
system pullback isomorphism. No compactness of `M` is assumed. -/
noncomputable def compactSupportFundamentalClass (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m)) :
    twistedRelativeHomology ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem (TopCat.of M)) m := by
  let C : Type := RechartedInterior (I := I) (M := M) m e
  let P := carrierSupportPairMap I m e K
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C := rechartedInteriorChartedSpace I m e
  letI : IsManifold (EuclideanModel m) ∞ C := rechartedInteriorIsManifold I m e
  letI : BoundarylessManifold (EuclideanModel m) C := rechartedInteriorBoundaryless I m e
  let hK' : IsCompact (carrierSupport I m e K) := by
    -- Pullback along the carrier homeomorphism preserves compactness.
    sorry
  exact
    (TauCetiRoadmap.AlgebraicTopology.CompactOrientationLaws.constantSystemHomologyMap
      P (ModuleCat.of ℤ ℤ) m)
      (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chosenCompactClass m C
        (carrierSupport I m e K) hK' (carrierOrientation I m e o))

/-- The support-class image on `M` is normalized by the exported point generator. This is the
local-image theorem needed by DG integration, not a separate assumed normalization field. -/
theorem compactSupportFundamentalClass_local (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m))
    (x : TopCat.of M) (hx : x ∈ K) :
    twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem (TopCat.of M)) m K x hx
      (compactSupportFundamentalClass I m e K hK o) = pointGenerator I m e o x := by
  -- Reduce to `OrientationComparison.chosenCompactClass_local` on the carrier, then use
  -- naturality of the support-pair maps and the constant coefficient pullback isomorphisms.
  sorry

/-- Class-level rechart independence for one fixed tangent orientation `o`; the result compares
ordinary integer classes in the same relative group on the original manifold. Its proof uses the
carrier-change homeomorphism and the local-image theorem above. -/
theorem compactSupportFundamentalClass_rechart_independent (m : ℕ)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m)) :
    compactSupportFundamentalClass I m e K hK o =
      compactSupportFundamentalClass I m e' K hK o := by
  -- Uniqueness in the AT compact-support factory follows from equality of the local generators.
  sorry

/-- The selected local generator itself is independent of the Euclidean rechart. Both sides
land in the same ordinary integer local-homology group of the original manifold. -/
theorem pointGenerator_rechart_independent (m : ℕ)
    (e e' : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (o : Manifold.Orientation I M (Fin m)) (x : TopCat.of M) :
    pointGenerator I m e o x = pointGenerator I m e' o x := by
  -- Compare the carrier local classes through the pointwise carrier homeomorphism law and
  -- the selected tangent-orientation derivative comparison.
  sorry

/-- AT local-normalization datum on the original support pair. Its local equations are the
support-local theorem above, rewritten through the native pair-local map. -/
noncomputable def chosenCompactDatum (m : ℕ)
    (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation I M (Fin m)) :
    RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem (TopCat.of M)) m
      (fun x _ => pointGenerator I m e o x) where
  fundamentalClass := compactSupportFundamentalClass I m e K hK o
  local_eq := by
    intro x hx
    have hmem : x ∈ K := by
      -- The complement pair's subspace is exactly the points outside K.
      sorry
    have hlocal := compactSupportFundamentalClass_local I m e K hK o x hmem
    -- Identify RelativeTwistedClassDatum.local_eq's native pair map with
    -- twistedSupportLocalMap via the support inclusion and identity-coefficient square.
    sorry

omit finiteDimE t2M secondCountableM smoothM boundarylessM

end GeneralModelOrientation

end GeneralModelOrientation

section BoundaryInteriorComparison

/-!
**This section is not the roadmap and is not exhaustive.** These are suggested Lean declarations;
the README is the definitive specification. Honest admitted targets remain below.

AT-owned boundary-interior comparisons.  The recharted carrier is the actual interior of a
possibly-boundary manifold, so local constructions are transported by its open inclusion rather
than by a false homeomorphism from the whole carrier to the ambient manifold.
-/

namespace BoundaryInteriorComparison

/-- The fresh rechart carrier includes as an open embedding into the original manifold, also when
that manifold has boundary. The range is exactly `I.interior M`. -/
theorem FreshInteriorRechart.val_isOpenEmbedding
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    Topology.IsOpenEmbedding
      (fun x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M)
        I m e => (x.point : M)) := by
  let U : TopologicalSpace.Opens M := ⟨I.interior M, I.isOpen_interior (M := M) (n := ∞) (by simp)⟩
  have hsub : Topology.IsOpenEmbedding (Subtype.val : U → M) := U.isOpenEmbedding'
  let hhomeo := TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.carrierHomeomorphInterior
    (I := I) (M := M) m e
  have hcomp := hsub.comp hhomeo.isOpenEmbedding
  have hfun : (fun x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier
      (E := E) (H := H) (M := M) I m e => (x.point : M)) =
      (Subtype.val ∘ hhomeo) := by
    funext x
    change (x.point : M) = ((hhomeo x : I.interior M) : M)
    rfl
  convert hcomp using 1

/-- Global local-diffeomorphism certificate for the interior inclusion, made from the pointwise
inverse-function statement in the fresh rechart. -/
theorem FreshInteriorRechart.val_isLocalDiffeomorph
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    letI : ChartedSpace (EuclideanSpace ℝ (Fin m))
      (TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier
        (E := E) (H := H) (M := M) I m e) :=
      TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.chartedSpace I m e
    letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞
      (TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier
        (E := E) (H := H) (M := M) I m e) :=
      TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isManifold I m e
    IsLocalDiffeomorph (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) I ∞
      (fun x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M)
        I m e => (x.point : M)) := by
  exact fun x => TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isLocalDiffeomorph_val
    I m e x

/-- The constant-integral local class on a boundary-manifold carrier, transported to the ambient
manifold by the genuine open inclusion. The source orientation is pulled back from `o` by the
local diffeomorphism `val`; no whole-carrier/ambient homeomorphism is used. -/
noncomputable def pointGeneratorOnAmbient
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    [T2Space M] [SecondCountableTopology M]
    (o : Manifold.Orientation I M (Fin m))
    (x : TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M) I m e) :
    twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) (x.point : M))
      ((TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj
        (ModuleCat.of ℤ ℤ)) m := by
  let C := TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.Carrier (E := E) (H := H) (M := M) I m e
  letI : TopologicalSpace C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.carrierTopologicalSpace I m e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin m)) C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.chartedSpace I m e
  letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isManifold I m e
  letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) C :=
    TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.boundaryless I m e
  letI : T2Space C := inferInstance
  letI : SecondCountableTopology C := inferInstance
  let f : C → M := fun y => y.point
  let hf : IsLocalDiffeomorph (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) I ∞ f :=
    fun y => TauCetiRoadmap.AlgebraicTopology.FreshInteriorRechart.isLocalDiffeomorph_val
      I m e y
  let oC := Manifold.Orientation.pullback hf (by norm_num) o
  exact embeddingIntegralLocalMap (TopCat.ofHom ⟨f, (BoundaryInteriorComparison.FreshInteriorRechart.val_isOpenEmbedding I m e).continuous⟩)
    (BoundaryInteriorComparison.FreshInteriorRechart.val_isOpenEmbedding I m e).toIsEmbedding.injective x m
      (OrientationComparison.pointGenerator m C oC x)

/-- The local integral map of a generic T2 open embedding is an isomorphism by local excision;
there is no charted-space or boundaryless hypothesis on the target. -/
theorem isIso_embeddingIntegralLocalMap
    {M N : Type} [TopologicalSpace M] [TopologicalSpace N]
    [T2Space M] [T2Space N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (x : M) (m : ℕ) :
    IsIso (embeddingIntegralLocalMap (TopCat.ofHom ⟨f, hf.continuous⟩)
      hf.toIsEmbedding.injective x m) := by
  sorry

/-- Compact-support excision for a generic T2 open embedding. Compactness makes the support closed,
so excision identifies the ambient relative pair with the one inside the open image. -/
theorem isIso_supportOpenEmbeddingHomologyMap
    {M N : Type} [TopologicalSpace M] [TopologicalSpace N]
    [T2Space M] [T2Space N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M)
    (hK : IsCompact K) (m : ℕ) :
    IsIso (CompactOrientationLaws.supportOpenEmbeddingHomologyMap f hf K m) := by
  sorry

/-- Twisted relative map on the support pair of an open embedding, with the source coefficient
system exactly the categorical pullback of the target local system. -/
noncomputable def supportOpenEmbeddingTwistedHomologyMap
    {R : Type u} [Ring R] {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M)
    (L : TauCeti.LocalCoefficientSystem R (TopCat.of N)) (m : ℕ) :
    (TopPair.ofSubset (X := TopCat.of M) Kᶜ).twistedHomology
      ((TauCeti.LocalCoefficientSystem.pullback
        (TopPair.Hom.fst (CompactOrientationLaws.supportOpenEmbeddingPairMap f hf K)).hom).obj L) m ⟶
      (TopPair.ofSubset (X := TopCat.of N) (f '' K)ᶜ).twistedHomology L m :=
  TopPair.twistedHomologyMap
    (CompactOrientationLaws.supportOpenEmbeddingPairMap f hf K) L m

end BoundaryInteriorComparison

/- Public spelling on the fresh carrier API for its inclusion into the ambient manifold. -/
namespace FreshInteriorRechart

theorem val_isOpenEmbedding
    {E H : Type u} {M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m)) :
    Topology.IsOpenEmbedding
      (fun x : Carrier (E := E) (H := H) (M := M) I m e => (x.point : M)) :=
  TauCetiRoadmap.AlgebraicTopology.BoundaryInteriorComparison.FreshInteriorRechart.val_isOpenEmbedding
    I m e

end FreshInteriorRechart

end BoundaryInteriorComparison

section BoundaryCarrierOrientation

/-!
**This section is not the roadmap and is not exhaustive.** These are suggested Lean declarations;
the README is the definitive specification. Honest admitted targets remain below.

AT boundary orientation prototype: define the boundary orientation local system on the actual half-space
ambient carrier by transport along the fundamental-groupoid equivalence induced by its interior
inclusion. The equivalence data and resulting natural comparison are explicit admitted geometry
targets, not Prop fields or an independent sign-system placeholder.
-/

namespace BoundaryCarrierOrientation

/-- The fresh Euclidean rechart of the interior of an `(n+1)`-dimensional half-space-model
manifold. -/
abbrev InteriorCarrier (n : ℕ) [NeZero (n + 1)] (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M] :=
  FreshInteriorRechart.Carrier
    (E := EuclideanSpace ℝ (Fin (n + 1)))
    (H := EuclideanHalfSpace (n + 1)) (M := M)
    (modelWithCornersEuclideanHalfSpace (n + 1)) (n + 1)
    (ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1))) )

/-- The actual topological inclusion of the freshly recharted interior. -/
noncomputable def interiorInclusion (n : ℕ) [NeZero (n + 1)] (M : Type)
    [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    C(InteriorCarrier n M, M) := by
  let I := modelWithCornersEuclideanHalfSpace (n + 1)
  let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
  letI : TopologicalSpace (InteriorCarrier n M) :=
    FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
  exact ⟨fun x => x.point, (FreshInteriorRechart.val_isOpenEmbedding I (n + 1) e).continuous⟩

/-- The groupoid functor is definitionally induced by the actual interior inclusion. The remaining
quasi-inverse and equivalence laws are the geometric interior-push target. -/
noncomputable def interiorFundamentalGroupoidEquivalence (n : ℕ) [NeZero (n + 1)]
    (M : Type) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    CategoryTheory.Equivalence
      (FundamentalGroupoid (TopCat.of (InteriorCarrier n M)))
      (FundamentalGroupoid (TopCat.of M)) where
  functor := FundamentalGroupoid.map (interiorInclusion n M)
  inverse := by
    sorry
  unitIso := by
    sorry
  counitIso := by
    sorry
  functor_unitIso_comp := by
    sorry

/-- Integral top local homology on the boundaryless fresh interior carrier, transported to the
ambient half-space manifold by the inverse of its interior-inclusion groupoid equivalence. Thus
boundary points receive fibres by inward transport rather than by their vanishing ambient local
homology. -/
noncomputable def halfSpaceOrientationLocalSystem (n : ℕ) [NeZero (n + 1)]
    (M : Type) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    TauCeti.LocalCoefficientSystem ℤ (TopCat.of M) := by
  let I := modelWithCornersEuclideanHalfSpace (n + 1)
  let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
  let C := InteriorCarrier n M
  letI : TopologicalSpace C := FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) C :=
    FreshInteriorRechart.chartedSpace I (n + 1) e
  letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) ∞ C :=
    FreshInteriorRechart.isManifold I (n + 1) e
  letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) C :=
    FreshInteriorRechart.boundaryless I (n + 1) e
  letI : T2Space C := inferInstance
  letI : SecondCountableTopology C := inferInstance
  exact (interiorFundamentalGroupoidEquivalence n M).inverse ⋙
    TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C

/-- The restriction comparison `κ` is the unit isomorphism of the actual groupoid equivalence,
whiskered by the fresh-carrier integral orientation system. -/
noncomputable def halfSpaceOrientationLocalSystem_restrictInteriorIso
    (n : ℕ) [NeZero (n + 1)] (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace (n + 1)) ∞ M]
    [T2Space M] [SecondCountableTopology M] :
    let I := modelWithCornersEuclideanHalfSpace (n + 1)
    let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
    let C := InteriorCarrier n M
    letI : TopologicalSpace C := FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
    letI : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) C :=
      FreshInteriorRechart.chartedSpace I (n + 1) e
    letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) ∞ C :=
      FreshInteriorRechart.isManifold I (n + 1) e
    letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) C :=
      FreshInteriorRechart.boundaryless I (n + 1) e
    letI : T2Space C := inferInstance
    letI : SecondCountableTopology C := inferInstance
    (TauCeti.LocalCoefficientSystem.pullback
      (interiorInclusion n M)).obj (halfSpaceOrientationLocalSystem n M) ≅
      TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C := by
  let I := modelWithCornersEuclideanHalfSpace (n + 1)
  let e := ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin (n + 1)))
  let C := InteriorCarrier n M
  letI : TopologicalSpace C := FreshInteriorRechart.carrierTopologicalSpace I (n + 1) e
  letI : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) C :=
    FreshInteriorRechart.chartedSpace I (n + 1) e
  letI : IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) ∞ C :=
    FreshInteriorRechart.isManifold I (n + 1) e
  letI : BoundarylessManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin (n + 1)))) C :=
    FreshInteriorRechart.boundaryless I (n + 1) e
  letI : T2Space C := inferInstance
  letI : SecondCountableTopology C := inferInstance
  let G := interiorFundamentalGroupoidEquivalence n M
  change (G.functor ⋙ (G.inverse ⋙
    TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C)) ≅ _
  exact (Functor.associator G.functor G.inverse
    (TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C)).symm ≪≫
      Functor.isoWhiskerRight G.unitIso.symm
        (TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C) ≪≫
      Functor.leftUnitor
        (TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem (n + 1) C)

/-- Twisted support-pair map for every native local system is an isomorphism when `f` is an open
embedding and `K` is compact. The target Hausdorff hypothesis also makes the open source Hausdorff
through the embedding. -/
theorem isIso_supportOpenEmbeddingTwistedHomologyMap
    {R : Type u} [Ring R] {M N : Type}
    [TopologicalSpace M] [TopologicalSpace N] [T2Space N]
    (f : M → N) (hf : Topology.IsOpenEmbedding f) (K : Set M)
    (hK : IsCompact K)
    (L : TauCeti.LocalCoefficientSystem R (TopCat.of N)) (m : ℕ) :
    IsIso (BoundaryInteriorComparison.supportOpenEmbeddingTwistedHomologyMap f hf K L m) := by
  sorry

/-- On a boundaryless target, the open-interior local generator agrees with the
ordinary general-model construction transported by the whole-carrier homeomorphism. -/
theorem pointGeneratorOnAmbient_eq_generalModel
    {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] [TopologicalSpace M]
    (I : ModelWithCorners ℝ E H) [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M]
    (m : ℕ) (e : E ≃L[ℝ] EuclideanSpace ℝ (Fin m))
    [BoundarylessManifold I M]
    (o : Manifold.Orientation I M (Fin m))
    (x : FreshInteriorRechart.Carrier (E := E) (H := H) (M := M) I m e) :
    BoundaryInteriorComparison.pointGeneratorOnAmbient I m e o x =
      GeneralModelOrientation.pointGenerator I m e o x.point := by
  sorry

end BoundaryCarrierOrientation

end BoundaryCarrierOrientation

section TopologicalGroupFundamentalGroup

/-! Suggested forms accompany the definitive roadmap prose; they are not an
exhaustive checklist. The constructions below use the native path quotient and
its existing group multiplication, whose order is reversed path composition. -/

namespace TopologicalGroupFundamentalGroup

variable {G : Type*} [TopologicalSpace G] [MulOneClass G] [ContinuousMul G]

/-- The native fundamental-group map induced by continuous multiplication. -/
def multiplicationMap : FundamentalGroup (G × G) (1, 1) →* FundamentalGroup G 1 :=
  FundamentalGroup.mapOfEq ⟨fun x => x.1 * x.2, continuous_mul⟩ (one_mul 1)

/-- Pointwise multiplication on actual homotopy classes of based loops. At this pin Mathlib's
`FundamentalGroup` is the vertex group of the fundamental groupoid, so the loop classes are
accessed through `FundamentalGroup.toPath` and `FundamentalGroup.fromPath`. -/
def pointwise (p q : FundamentalGroup G 1) : FundamentalGroup G 1 :=
  multiplicationMap (FundamentalGroup.fromPath (Path.Homotopic.prod p.toPath q.toPath))

theorem pointwise_one_left (p : FundamentalGroup G 1) : pointwise 1 p = p := by
  obtain ⟨p⟩ := p
  induction p using Path.Homotopic.Quotient.ind with
  | mk p =>
    unfold pointwise multiplicationMap
    rw [FundamentalGroup.mapOfEq_apply]
    congr 1
    change (Path.Homotopic.Quotient.map (Path.Homotopic.prod
      (Path.Homotopic.Quotient.mk (Path.refl (1 : G))) (Path.Homotopic.Quotient.mk p)) _).cast _ _ =
      Path.Homotopic.Quotient.mk p
    rw [Path.Homotopic.prod_lift, ← Path.Homotopic.Quotient.mk_map,
      ← Path.Homotopic.Quotient.mk_cast]
    apply congrArg Path.Homotopic.Quotient.mk
    ext t
    exact one_mul (p t)

theorem pointwise_one_right (p : FundamentalGroup G 1) : pointwise p 1 = p := by
  obtain ⟨p⟩ := p
  induction p using Path.Homotopic.Quotient.ind with
  | mk p =>
    unfold pointwise multiplicationMap
    rw [FundamentalGroup.mapOfEq_apply]
    congr 1
    change (Path.Homotopic.Quotient.map (Path.Homotopic.prod
      (Path.Homotopic.Quotient.mk p) (Path.Homotopic.Quotient.mk (Path.refl (1 : G)))) _).cast _ _ =
      Path.Homotopic.Quotient.mk p
    rw [Path.Homotopic.prod_lift, ← Path.Homotopic.Quotient.mk_map,
      ← Path.Homotopic.Quotient.mk_cast]
    apply congrArg Path.Homotopic.Quotient.mk
    ext t
    exact mul_one (p t)

/-- Interchange uses only product paths and functoriality of the native map. -/
theorem pointwise_interchange (a b c d : FundamentalGroup G 1) :
    pointwise (a * b) (c * d) = pointwise a c * pointwise b d := by
  unfold pointwise
  rw [← map_mul]
  apply congrArg multiplicationMap
  change FundamentalGroup.fromPath (Path.Homotopic.prod (b.toPath.trans a.toPath)
      (d.toPath.trans c.toPath)) =
    FundamentalGroup.fromPath ((Path.Homotopic.prod b.toPath d.toPath).trans
      (Path.Homotopic.prod a.toPath c.toPath))
  exact congrArg FundamentalGroup.fromPath
    (Path.Homotopic.comp_prod_eq_prod_comp b.toPath d.toPath a.toPath c.toPath).symm

/-- The group already carried by the native fundamental group is commutative.
No connectedness, manifold, local-contractibility or covering hypothesis is used. -/
abbrev commGroup : CommGroup (FundamentalGroup G 1) :=
  EckmannHilton.commGroup
    (EckmannHilton.IsUnital.mk
      { left_id := pointwise_one_left, right_id := pointwise_one_right })
    pointwise_interchange

/-- The commutative refinement keeps the native group structure definitionally. -/
theorem commGroup_toGroup : (commGroup (G := G)).toGroup =
    (inferInstance : Group (FundamentalGroup G 1)) := rfl

theorem fundamentalGroup_mul_comm (a b : FundamentalGroup G 1) : a * b = b * a :=
  (commGroup (G := G)).mul_comm a b

/-- The pointwise operation agrees with the existing fundamental-group product. -/
theorem pointwise_eq_mul (a b : FundamentalGroup G 1) : pointwise a b = a * b :=
  congrFun (congrFun
    (EckmannHilton.mul
      (EckmannHilton.IsUnital.mk
        { left_id := pointwise_one_left, right_id := pointwise_one_right })
      EckmannHilton.MulOneClass.isUnital pointwise_interchange) a) b

/-- Naturality retains the actual continuous multiplicative map. -/
theorem mapOfEq_pointwise {H : Type*} [TopologicalSpace H] [MulOneClass H]
    [ContinuousMul H] (f : G →* H) (hf : Continuous f)
    (a b : FundamentalGroup G 1) :
    FundamentalGroup.mapOfEq ⟨f, hf⟩ f.map_one (pointwise a b) =
      pointwise (FundamentalGroup.mapOfEq ⟨f, hf⟩ f.map_one a)
        (FundamentalGroup.mapOfEq ⟨f, hf⟩ f.map_one b) := by
  rw [pointwise_eq_mul, pointwise_eq_mul, map_mul]

end TopologicalGroupFundamentalGroup

end TopologicalGroupFundamentalGroup

end

end TauCetiRoadmap.AlgebraicTopology
