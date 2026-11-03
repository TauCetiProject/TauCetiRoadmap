import Mathlib
import TauCeti.AlgebraicTopology.Singular.Empty
import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
import TauCeti.AlgebraicTopology.Cohomology.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cup
import TauCeti.AlgebraicTopology.Cellular.Comparison
import TauCeti.Topology.Homotopy.HomotopyGroup.Map
import TauCeti.Topology.Homotopy.HomotopyGroup.Product
import TauCeti.Topology.Homotopy.HomotopyGroup.FundamentalGroupAction
import TauCeti.Topology.Homotopy.Extension.DeformationRetract
import TauCeti.Topology.Homotopy.Extension.MappingCylinder

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them. Every target, API list and Check lives in the README.

Stated here: the finite-dimensional Brouwer fixed-point theorem (Stage 2.7); the
arbitrary-dimensional cellular comparison, the pair/quotient comparison and the two closed
cofibration extension theorems (Stage 4); transfer for finite covers and the deck-sum formula
for regular covers (Stage 5); the compact-support existence and uniqueness lemma with local
coefficients, Poincaré duality for a closed manifold with a fundamental class, the
Lusternik–Schnirelmann cup-length bound and the product-ball intersection theorem (Stage 6);
homotopy invariance of the finite CW Euler characteristic and finite CW type of compact
smooth manifolds (Stage 7); relative CW connectivity, Whitehead, homological Whitehead, the
nerve `K(G,1)`, the proper deformation retraction theorem, mapping-space CW type, the
transverse codimension-one classifying map and the non-freeness of `C_p × C_p` on spheres
(Stage 8).

Not statable at the pins, and therefore stated nowhere in this file:
the Cartan–Leray and Serre spectral sequences and the Wang sequence (no spectral-sequence
carrier and no monodromy local-system carrier on the pinned singular chains); Künneth with
its `Tor` term (no canonical cross-product chain map on the pinned chains); the
local-coefficient Poincaré–Lefschetz dualities and their boundary form (no homological
orientation local system and no twisted cap product at the pins; only the untwisted closed
form with a fundamental-class datum is stated); absolute Hurewicz (no Hurewicz map from the
native cubical homotopy groups to singular homology); relative Hurewicz (no relative
homotopy-group carrier); the Milnor `lim¹` sequence for skeletal restriction towers (no
skeletal cohomology restriction-tower adapter); ordinary representability and the ordinary
Eilenberg–MacLane loop comparison (no functorial normalized Eilenberg–MacLane family with
its universal class); the obstruction and difference cochain criteria (no cellular
obstruction cochain construction). The Stage 2.5 and 4.4 reference classes, sphere and
disk homeomorphisms, the relative CW pushout, relative cylinder and kified product CW
structures are constructions, not theorems: they remain README targets.
-/

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits
open scoped Topology

noncomputable section

#check HomotopyGroup.prodEquiv
#check HomotopyGroup.prodMulEquiv
#check TauCeti.map_fundamentalGroup_smul
#check isQuotientCoveringMap_iff_isCoveringMap_and
#check TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction
#check TauCeti.MappingCylinder.homotopyEquiv
#check TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl

universe u v

/-- Singular chains of a space with coefficients in a module `M`, the native absolute chain
functor applied to `M` and then to the space. -/
abbrev singularChains (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : TopCat.{u}) : ChainComplex (ModuleCat.{u} R) ℕ :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).obj X

/-- Singular homology with coefficients in the ring itself. -/
abbrev singularHomology (R : Type u) [CommRing R] (X : TopCat.{u}) (n : ℕ) :
    ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj (ModuleCat.of R R)).obj X

/-- Singular cohomology with coefficients in the ring itself. -/
abbrev singularCohomology (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) n

/-! ## Stage 2.7: Brouwer -/

/-- **Brouwer fixed point** (Stage 2.7). Every continuous self-map of a nonempty compact
convex subset `C` of a finite-dimensional real normed space has a fixed point. No
full-dimensionality of `C` is assumed; `C` may be a point. -/
theorem brouwerFixedPoint_compactConvex {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (C : Set E) (hne : C.Nonempty)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C) (f : ContinuousMap C C) :
    ∃ x : C, Function.IsFixedPt f x := by
  sorry

/-- **Brouwer in a finite-dimensional subspace** (Stage 2.7). The ambient real normed space may
be infinite-dimensional: a nonempty compact convex set contained in a finite-dimensional
submodule `V` has the fixed-point property. Finite convex hulls lie in the span of their
vertices. -/
theorem brouwerFixedPoint_compactConvex_finiteSpan {E : Type u} [NormedAddCommGroup E]
    [NormedSpace ℝ E] (C : Set E) (hne : C.Nonempty)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C)
    (V : Submodule ℝ E) [FiniteDimensional ℝ V] (hCV : C ⊆ (V : Set E))
    (f : ContinuousMap C C) : ∃ x : C, Function.IsFixedPt f x := by
  sorry

/-! ## Stage 4: cellular comparison, pair quotients and closed cofibrations -/

/-- **Arbitrary-dimensional cellular comparison** (Stage 4.3). For every relative CW complex
`(X, D)` with Hausdorff `X`, no finite-dimensionality assumed, inclusion of the
`(n+1)`-skeleton induces an isomorphism on relative singular homology in degree `n`
(Hatcher, Lemma 2.34(c), p. 137). The pinned
`TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex` proves this under
`FiniteDimensional`; the content here is the removal of that hypothesis. Composed with the
native cellular-homology identification `TauCeti.cellularHomologyIso` of the `(n+1)`-skeleton
pair, this is the comparison of cellular with singular homology in every degree, extending the
pinned finite-dimensional `TauCeti.cellularSingularHomologyIso`. Module coefficients have exact
coproducts. -/
theorem isIso_singularHomologyMap_skeletonBasePairToComplex_arbitraryDimension
    (X : Type u) [TopologicalSpace X] [T2Space X] (D : Set X)
    [RelCWComplex (Set.univ : Set X) D] (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (n : ℕ) :
    IsIso ((TauCeti.skeletonBasePair (D := D) (Set.univ : Set X) (n + 1)).singularHomologyMap
      (TauCeti.skeletonBasePairToComplex (D := D) (Set.univ : Set X) (n + 1)) M n) := by
  sorry

/-- The subspace `B` together with a separately added point: the locus collapsed to form the
pointed quotient `X/B`, so that `X/∅` is `X` with a disjoint basepoint. -/
def ordinaryCofiberSupport {X : Type u} (B : Set X) : Set (X ⊕ PUnit) :=
  {p | p.elim (fun x => x ∈ B) (fun _ => True)}

/-- The equivalence relation identifying all points of the collapsed locus. -/
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

/-- The pointed quotient `X/B` with the quotient topology; it is `X₊` when `B` is empty. -/
def ordinaryPairQuotient (X : Type u) [TopologicalSpace X] (B : Set X) : TopCat.{u} :=
  TopCat.of (Quotient (ordinaryCofiberSetoid B))

/-- The basepoint of the pointed quotient: the class of the added point. -/
def ordinaryPairQuotientPoint (X : Type u) [TopologicalSpace X] (B : Set X) :
    ordinaryPairQuotient X B := Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)

/-- The collapse map `X → X/B`. -/
def ordinaryPairQuotientMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopCat.of X ⟶ ordinaryPairQuotient X B :=
  TopCat.ofHom ⟨fun x => Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x), by
    let : Setoid (X ⊕ PUnit.{u + 1}) := ordinaryCofiberSetoid B
    exact continuous_quotient_mk'.comp continuous_inl⟩

/-- The collapse as a map of pairs `(X, B) → (X/B, {basepoint})`. -/
def ordinaryPairQuotientPairMap (X : Type u) [TopologicalSpace X] (B : Set X) :
    TopPair.ofSubset (X := TopCat.of X) B ⟶
      TopPair.ofSubset (X := ordinaryPairQuotient X B) {ordinaryPairQuotientPoint X B} :=
  TopPair.ofSubsetMap (ordinaryPairQuotientMap X B) (by
    intro x hx
    change Quotient.mk (ordinaryCofiberSetoid B) (Sum.inl x) =
      Quotient.mk (ordinaryCofiberSetoid B) (Sum.inr PUnit.unit)
    exact Quotient.sound (Or.inr ⟨hx, trivial⟩))

/-- **Pair/quotient comparison** (Stage 4.5). For a relative CW complex `(X, B)` with
Hausdorff `X`, the collapse induces `H_n(X, B; M) ≅ H_n(X/B, {∗}; M)` in every degree, the
right side being reduced homology of the pointed quotient realized as the pair relative to its
basepoint (Hatcher, Proposition 2.22, p. 124, for good pairs). -/
theorem ordinaryPairQuotientComparison (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    (X : Type u) [TopologicalSpace X] [T2Space X] (B : Set X)
    [RelCWComplex (Set.univ : Set X) B] (n : ℕ) :
    IsIso (TopPair.singularHomologyMap (ordinaryPairQuotientPairMap X B) M n) := by
  sorry

/-- **Cylinder-boundary cofibration** (Stage 4.5). If a closed subspace `A ⊆ X` has the
homotopy extension property, then so does `({0,1} × X) ∪ (I × A)` in `I × X`; the native
cylinder has the interval coordinate first. -/
theorem closedCofibrationCylinderHomotopyExtension
    {X : Type u} [TopologicalSpace X] (A : Set X) (hAc : IsClosed A)
    (hA : TauCeti.HasHomotopyExtensionProperty A) :
    TauCeti.HasHomotopyExtensionProperty
      ((({0, 1} : Set unitInterval).prod (Set.univ : Set X)) ∪
        (Set.univ : Set unitInterval).prod A) := by
  sorry

/-- **Homotopy inverses of pair equivalences** (Stage 4.5). For closed cofibered pairs `(X, A)`
and `(X', A')`, a homotopy equivalence `e : X ≃ X'` restricting to a homotopy equivalence
`e₀ : A ≃ A'`, and prescribed one-sided inverse data `g₀`, `H₀` on the subspaces, there is a
homotopy inverse `g` of `e` extending `g₀` with a left-inverse homotopy extending `H₀`
(Brown, *Topology and Groupoids*, 7.4.2 and its Addendum, pp. 285–286, with the prescribed
one-sided homotopy obtained through Vogt's strong homotopy equivalence and the cylinder
cofibration; Hatcher, Proposition 0.19, p. 16, is the case `e₀ = id`). -/
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

/-! ## Stage 5: transfer for finite covers -/

/-- A finite covering map of constant degree. General finite covers are handled componentwise. -/
structure FiniteCover (E B : TopCat.{u}) where
  p : E ⟶ B
  isCoveringMap : IsCoveringMap p
  degree : ℕ
  finite_fiber : ∀ b : B, Finite {e : E // p e = b}
  fiber_card : ∀ b : B, Nat.card {e : E // p e = b} = degree

open scoped Simplicial in
/-- **Transfer** (Stage 5.4; Hatcher, Section 3.G, p. 321). A finite cover of constant degree
`d` has a chain map `t : C_*(B; M) → C_*(E; M)` sending each singular simplex of `B` to the
sum of its `d` lifts, and `p_* ∘ t = d · id` on chains; the induced maps on homology satisfy the
same identity, for every coefficient module over every commutative ring, including degree
`0` (where the empty cover gives `t = 0`). -/
theorem finiteCover_transfer_exists (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    {E B : TopCat.{u}} (P : FiniteCover E B) :
    ∃ t : singularChains R M B ⟶ singularChains R M E,
      t ≫ ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map P.p =
        P.degree • 𝟙 (singularChains R M B) ∧
      ∀ (n : ℕ) (σ : (TopCat.toSSet.obj B) _⦋n⦌),
        (TopCat.toSSet.obj B).ιChainComplex (R := M) σ ≫ t.f n =
          ∑ᶠ τ : {τ : (TopCat.toSSet.obj E) _⦋n⦌ // (TopCat.toSSet.map P.p).app _ τ = σ},
            (TopCat.toSSet.obj E).ιChainComplex (R := M) τ.val := by
  sorry

/-- A surjective regular cover datum: a group of deck homeomorphisms over `p` acting simply
transitively on every fibre. Simple transitivity alone does not imply surjectivity. -/
structure RegularDeckAction {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] where
  pSurjective : Function.Surjective P.p
  deck : G →* Homeomorph E E
  commutes : ∀ g x, P.p (deck g x) = P.p x
  simplyTransitive : ∀ {x y : E}, P.p x = P.p y → ∃! g, deck g x = y

/-- The chain map induced by the deck transformation `g`. -/
abbrev regularDeckChainMap (R : Type u) [CommRing R]
    (M : ModuleCat.{u} R) {E B : TopCat.{u}} (P : FiniteCover E B)
    (G : Type u) [Group G] (D : RegularDeckAction P G) (g : G) :=
  ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map
    (TopCat.ofHom ⟨D.deck g, (D.deck g).continuous_toFun⟩)

open scoped Simplicial in
/-- **Deck-sum formula** (Stage 5.4; Hatcher, Section 3.G, p. 321). For a regular cover with
finite deck group `G`, any chain map sending each simplex of `B` to the sum of its lifts
satisfies `t ∘ p_* = Σ_{g ∈ G} g_*` on the chains of `E`: the lifts of `p ∘ τ` are exactly the
deck translates of `τ`, each once. -/
theorem regularCover_push_transfer (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    {E B : TopCat.{u}} (P : FiniteCover E B) (G : Type u) [Group G] [Fintype G]
    (D : RegularDeckAction P G)
    (t : singularChains R M B ⟶ singularChains R M E)
    (ht : ∀ (n : ℕ) (σ : (TopCat.toSSet.obj B) _⦋n⦌),
      (TopCat.toSSet.obj B).ιChainComplex (R := M) σ ≫ t.f n =
        ∑ᶠ τ : {τ : (TopCat.toSSet.obj E) _⦋n⦌ // (TopCat.toSSet.map P.p).app _ τ = σ},
          (TopCat.toSSet.obj E).ιChainComplex (R := M) τ.val) :
    ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map P.p ≫ t =
      ∑ g : G, regularDeckChainMap R M P G D g := by
  sorry

/-! ## Stage 6: local coefficients, duality, cup length and the product-ball theorem -/

/-- Tau Ceti's local coefficient systems on a space, with all universes equal. -/
abbrev LocalCoefficientSystem (R : Type u) [CommRing R] (X : TopCat.{u}) :=
  TauCeti.LocalCoefficientSystem.{u, u, u} R X

/-- The pair `(X, X ∖ {x})` whose relative homology is the local homology at `x`. -/
def puncturedPair (X : TopCat.{u}) (x : X) : TopPair.{u} :=
  TopPair.ofSubset ({x}ᶜ : Set X)

/-- Twisted relative homology of a pair with coefficients in a local system on the ambient
space; coefficients sit at the first vertex and the zeroth face transports along the first
edge. -/
abbrev twistedRelativeHomology (R : Type u) [CommRing R]
    (P : TopPair.{u}) (L : LocalCoefficientSystem R P.fst) (n : ℕ) : ModuleCat.{u} R :=
  (P.twistedChainComplex L).homology n

/-- The pair inclusion from `(X, X ∖ B)` to `(X, X ∖ {x})` for `x ∈ B`. -/
def supportLocalPairMap (X : TopCat.{u}) (B : Set X) (x : X) (hx : x ∈ B) :
    TopPair.ofSubset Bᶜ ⟶ puncturedPair X x :=
  TopPair.ofSubsetMap (𝟙 X) (fun y hy => by
    change y ≠ x
    intro h
    exact hy (h.symm ▸ hx))

/-- The map from classes supported on `B` to the local homology at a point of `B`, by pair
functoriality of twisted homology along `supportLocalPairMap`. -/
def twistedSupportLocalMap (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ)
    (B : Set X) (x : X) (hx : x ∈ B) :
    twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n ⟶
      twistedRelativeHomology R (puncturedPair X x) L n :=
  (TopPair.ofSubset Bᶜ).twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.pullbackIdIso X).app L).inv n ≫
    TopPair.twistedHomologyMap (supportLocalPairMap X B x hx) L n

/-- A locally represented section of local top homology over `V`: a choice of local class at
every point of `V` such that every point has an open neighbourhood `B ⊆ V` on which all the
local classes are the images of one class supported on `B`. On a manifold such neighbourhoods
may be refined to coordinate balls. -/
structure LocallyRepresentedTopSection (R : Type u) [CommRing R]
    (X : TopCat.{u}) (L : LocalCoefficientSystem R X) (n : ℕ) (V : Set X) where
  localValue : ∀ x : X, x ∈ V →
    twistedRelativeHomology R (puncturedPair X x) L n
  locally_represented : ∀ x : X, ∀ _hx : x ∈ V,
    ∃ B : Set X, ∃ hBV : B ⊆ V, IsOpen B ∧ x ∈ B ∧
      ∃ c : twistedRelativeHomology R (TopPair.ofSubset Bᶜ) L n,
        ∀ y : X, ∀ hy : y ∈ B,
          twistedSupportLocalMap R X L n B y hy c = localValue y (hBV hy)

open scoped ContDiff in
/-- **Compact-support classes** (Stage 6.3; Hatcher, Lemma 3.27(a), p. 236, with local
coefficients). On a smooth `m`-manifold `M` (Hausdorff, second countable, boundaryless
Euclidean model), a locally represented section of local top homology over an open `V`
containing a compact `K` is induced by exactly one class in `H_m(M, M ∖ K; L)`. -/
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

/-- The map from absolute homology to the local homology at `x`, induced by the pair map
`(X, ∅) → (X, X ∖ {x})` through the native identification of absolute with
empty-subspace relative homology. -/
def localHomologyMap (R : Type u) [CommRing R] (X : TopCat.{u}) (x : X) (n : ℕ) :
    singularHomology R X n ⟶
      (puncturedPair X x).singularHomology (C := ModuleCat.{u} R) (ModuleCat.of R R) n :=
  (TopPair.singularHomologyInclIso (ModuleCat.{u} R) (ModuleCat.of R R) n).hom.app X ≫
    TopPair.singularHomologyMap (TopPair.j (puncturedPair X x)) (ModuleCat.of R R) n

/-- A fundamental class with coefficients in `R`: a class in `H_n(X; R)` whose image in every
local homology module `H_n(X, X ∖ {x}; R)` generates it (Hatcher, p. 236). On a closed
`n`-manifold such a class exists exactly when the manifold is `R`-orientable, and for `2 = 0`
in `R` always. -/
structure FundamentalClassDatum (R : Type u) [CommRing R] (X : TopCat.{u}) (n : ℕ) where
  fundamentalClass : singularHomology R X n
  spans : ∀ x : X,
    Submodule.span R {(localHomologyMap R X x n).hom fundamentalClass} = ⊤

/-- Cap product with the Alexander–Whitney sign convention, with the ring multiplication as
pairing. With natural-number grading the complementary-degree hypothesis prevents truncated
subtraction from pretending that a negative target degree is degree zero. -/
def capProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ) (hpq : p ≤ q) :
    singularCohomology R X p →ₗ[R]
      (singularHomology R X q ⟶ singularHomology R X (q - p)) :=
  X.singularCap R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
    (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p (q - p) q (Nat.add_sub_of_le hpq)

/-- Native cup product with the same Alexander–Whitney pairing and degree pin. -/
def cupProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ) :
    singularCohomology R X p →ₗ[R] singularCohomology R X q →ₗ[R]
      singularCohomology R X (p + q) :=
  X.singularCup R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
    (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q (p + q) rfl

/-- **Poincaré duality** (Stage 6.4; Hatcher, Theorem 3.30, p. 241). For a compact Hausdorff
topological `n`-manifold `M` and a fundamental class `μ ∈ H_n(M; R)`, capping with `μ` is a
bijection `H^p(M; R) → H_{n−p}(M; R)` for every `p ≤ n`. The local images of `μ` define the
`R`-orientation; connectedness is not needed. -/
theorem poincareDuality_of_fundamentalClass (n : ℕ) (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [T2Space M] [CompactSpace M]
    (R : Type u) [CommRing R] (μ : FundamentalClassDatum R (TopCat.of M) n)
    (p : ℕ) (hp : p ≤ n) :
    Function.Bijective (fun a : singularCohomology R (TopCat.of M) p =>
      (capProduct R (TopCat.of M) p n hp a).hom μ.fundamentalClass) := by
  sorry

/-- An open categorical cover of `A` in `X` by `n` opens, each nullhomotopic in `X`. -/
structure LSCategoricalCover (X : Type u) [TopologicalSpace X]
    (A : Set X) (n : ℕ) where
  opens : Fin n → TopologicalSpace.Opens X
  categorical : ∀ i,
    (⟨Subtype.val, continuous_subtype_val⟩ : C({x : X // x ∈ opens i}, X)).Nullhomotopic
  covers : ∀ x ∈ A, ∃ i, x ∈ opens i

/-- The unnormalized Lusternik–Schnirelmann category of `A` in `X`: the least number of opens
in a categorical cover, `⊤` when none is finite. -/
def lsCategoryCount (X : Type u) [TopologicalSpace X]
    (A : Set X) : ENat :=
  sInf {m : ENat | ∃ n : ℕ, m = (n : ENat) ∧ Nonempty (LSCategoricalCover X A n)}

/-- The normalized category of a nonempty space, one less than the unnormalized count. -/
def normalizedLSCategory (X : Type u) [TopologicalSpace X]
    [Nonempty X] : ENat := lsCategoryCount X Set.univ - 1

/-- A cup product of `r` positive-degree classes, formed with the native cup product. -/
inductive LSPositiveCupProduct (X : TopCat.{u}) (R : Type u) [CommRing R] :
    ℕ → (Σ d : ℕ, singularCohomology R X d) → Prop where
  | single (d : ℕ) (hd : 0 < d) (a : singularCohomology R X d) :
      LSPositiveCupProduct X R 1 ⟨d, a⟩
  | mul {r p q : ℕ} (a : singularCohomology R X p) (b : singularCohomology R X q)
      (ha : LSPositiveCupProduct X R r ⟨p, a⟩) (hq : 0 < q) :
      LSPositiveCupProduct X R (r + 1) ⟨p + q, cupProduct R X p q a b⟩

/-- The cup length: the supremum of the lengths of nonzero products of positive-degree
classes, `0` when there is none. -/
def lsCupLength (X : TopCat.{u}) (R : Type u) [CommRing R] : ENat :=
  sSup {m : ENat | ∃ r : ℕ, m = (r : ENat) ∧
    ∃ d : ℕ, ∃ a : singularCohomology R X d,
      a ≠ 0 ∧ LSPositiveCupProduct X R r ⟨d, a⟩}

/-- **Cup-length bound** (Stage 6, categorical-cover supplement). On a nonempty space, every
nonzero product of `r` positive-degree classes forces at least `r + 1` opens in any
categorical cover; the coefficient ring may be the zero ring. -/
theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ lsCategoryCount X Set.univ := by
  sorry

/-- **Product-ball intersection** (Stage 6.5). Continuous fillings `f : D_p → D_p × D_q` and
`g : D_q → D_p × D_q` of the two coordinate factors, with `f x = (x, 0)` on the unit sphere of
`D_p` and `g y = (0, y)` on the unit sphere of `D_q`, have a common image point. The balls are the
native closed unit balls of `EuclideanSpace ℝ (Fin p)` and `EuclideanSpace ℝ (Fin q)`; for `p = 0`
or `q = 0` the ball is a point with empty sphere, and these cases are included. No smoothness,
injectivity or transversality is assumed: the proof is the relative-homology coefficient
`(−1)^q · d_f · d_g` of the README, here with `d_f = d_g = 1`. -/
theorem productBallImages_intersect {p q : ℕ}
    (f : C(Metric.closedBall (0 : EuclideanSpace ℝ (Fin p)) 1,
      Metric.closedBall (0 : EuclideanSpace ℝ (Fin p)) 1 ×
        Metric.closedBall (0 : EuclideanSpace ℝ (Fin q)) 1))
    (g : C(Metric.closedBall (0 : EuclideanSpace ℝ (Fin q)) 1,
      Metric.closedBall (0 : EuclideanSpace ℝ (Fin p)) 1 ×
        Metric.closedBall (0 : EuclideanSpace ℝ (Fin q)) 1))
    (hf : ∀ x : Metric.closedBall (0 : EuclideanSpace ℝ (Fin p)) 1,
      ‖(x : EuclideanSpace ℝ (Fin p))‖ = 1 → f x = (x, ⟨0, by simp⟩))
    (hg : ∀ y : Metric.closedBall (0 : EuclideanSpace ℝ (Fin q)) 1,
      ‖(y : EuclideanSpace ℝ (Fin q))‖ = 1 → g y = (⟨0, by simp⟩, y)) :
    ∃ (x : Metric.closedBall (0 : EuclideanSpace ℝ (Fin p)) 1)
      (y : Metric.closedBall (0 : EuclideanSpace ℝ (Fin q)) 1), f x = g y := by
  sorry

/-! ## Stage 7: Euler characteristic and finite CW type -/

/-- Euler characteristic of a chosen finite CW structure: the alternating sum of the numbers
of cells. The roadmap proves that it equals the alternating sum of homology ranks and is
invariant under homotopy equivalence for Hausdorff CW carriers. -/
def finiteCWEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)] : ℤ :=
  ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * Nat.card (Topology.RelCWComplex.cell (Set.univ : Set X) i)

/-- **Homotopy invariance of the Euler characteristic** (Stage 7). Finite Hausdorff CW
complexes related by a homotopy equivalence have equal Euler characteristics
(Hatcher, Theorem 2.44, p. 146, with homology invariance). -/
theorem finiteCWEulerCharacteristic_eq_of_homotopyEquiv
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)]
    [CWComplex (Set.univ : Set Y)] [CWComplex.Finite (Set.univ : Set Y)]
    (_e : X ≃ₕ Y) :
    finiteCWEulerCharacteristic X = finiteCWEulerCharacteristic Y := by
  sorry

/-- A CW-type witness: a Hausdorff CW model with a homotopy equivalence to it. The topology,
Hausdorff and CW witnesses belong to the model carrier; Hausdorffness is a model witness, not
a consequence of the equivalence. -/
structure CWTypeModel (M : Type u) [TopologicalSpace M] where
  X : Type u
  topology : TopologicalSpace X
  hausdorff : letI := topology; T2Space X
  cw : letI := topology; CWComplex (Set.univ : Set X)
  homotopyEquiv : letI := topology; M ≃ₕ X

/-- A finite CW-type witness: a Hausdorff finite CW model with a homotopy equivalence to it. -/
structure FiniteCWTypeModel (M : Type u) [TopologicalSpace M] where
  X : Type u
  topology : TopologicalSpace X
  hausdorff : letI := topology; T2Space X
  cw : letI := topology; CWComplex (Set.univ : Set X)
  finite : letI := topology; letI := cw; CWComplex.Finite (Set.univ : Set X)
  homotopyEquiv : letI := topology; M ≃ₕ X

open scoped ContDiff in
/-- **Finite CW type of compact manifolds** (Stage 8.7). A compact Hausdorff second-countable
smooth boundaryless manifold with Euclidean model has a finite Hausdorff CW model: the smooth
triangulation of GeometricTopology is finite by compactness, and its realization
homeomorphism is the model equivalence. -/
theorem compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    Nonempty (FiniteCWTypeModel M) := by
  sorry

/-! ## Stage 8: connectivity, Whitehead, classifying spaces, proper deformation and
mapping spaces -/

/-- **Relative CW connectivity** (Stage 8.1). For a relative CW complex `(X, A)` with Hausdorff
`X` whose relative cells all have dimension at least `λ`, the inclusion induces
bijections `π_q(A, a) → π_q(X, a)` for `q + 1 < λ` at every `a ∈ A`, by cellular
approximation (Hatcher, Theorem 4.8, p. 349, and Corollary 4.12). No lower bound on `λ` is
assumed: for `λ ≤ 1` no `q` satisfies `q + 1 < λ` and the statement is empty. -/
theorem relativeCWConnectivityOfCellDimension
    (X : Type u) [TopologicalSpace X] [T2Space X] (A : Set X)
    [Topology.RelCWComplex (Set.univ : Set X) A]
    (a : A) (cellLowerBound : ℕ)
    (hcells : ∀ n : ℕ, n < cellLowerBound → IsEmpty
      (Topology.RelCWComplex.cell (Set.univ : Set X) n))
    (q : ℕ) (hq : q + 1 < cellLowerBound) :
    Function.Bijective
      (HomotopyGroup.map (⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)) rfl :
        HomotopyGroup (Fin q) A a → HomotopyGroup (Fin q) X a.val) := by
  sorry

/-- **Whitehead** (Stage 8.5; Hatcher, Theorem 4.5, p. 346). A map between Hausdorff CW
complexes that is bijective on path components and induces bijections on every homotopy
group at every basepoint is the forward map of a homotopy equivalence. Components are
compared with `Joined`; empty complexes are included. -/
theorem whitehead_homotopyEquiv
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)]
    (f : C(X, Y))
    (hsurj : ∀ y : Y, ∃ x : X, Joined (f x) y)
    (hinj : ∀ x x' : X, Joined (f x) (f x') → Joined x x')
    (hπ : ∀ (x : X) (n : ℕ), 0 < n → Function.Bijective
      (HomotopyGroup.map f rfl :
        HomotopyGroup (Fin n) X x → HomotopyGroup (Fin n) Y (f x))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-- **Homological Whitehead** (Stage 8.6; Hatcher, Corollary 4.33, p. 367). A map between
simply connected Hausdorff CW complexes inducing isomorphisms on integral singular homology
in every degree is the forward map of a homotopy equivalence. -/
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

/-- The bar/nerve classifying space of a discrete group: the realization of the nerve of the
one-object category of `G`. -/
abbrev groupClassifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  SSet.toTop.obj (CategoryTheory.nerve (SingleObj G))

open scoped Simplicial in
/-- The unique bar vertex, with its realization inclusion. -/
def groupClassifyingSpaceBasepoint (G : Type u) [Group G] :
    groupClassifyingSpace G :=
  (SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (CategoryTheory.nerveEquiv.symm (SingleObj.star G))))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

/-- **The nerve is a `K(G,1)`** (Stage 8.8; Hatcher, Example 1B.7, p. 89). The realization of
the nerve of a discrete group `G`, nonabelian included, is aspherical with fundamental group
`G` at the bar vertex. -/
theorem groupClassifyingSpace_isEMOne (G : Type u) [Group G] :
    TauCeti.IsEilenbergMacLaneSpaceOne G (groupClassifyingSpace G)
      (groupClassifyingSpaceBasepoint G) := by
  sorry

/-- A proper homotopy inverse: a proper map with a proper inverse and jointly proper
homotopies on `I × X` and `I × Y`. The ordinary homotopy-equivalence carrier is native. -/
def HasProperHomotopyInverse {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : Prop :=
  IsProperMap f ∧ ∃ g : C(Y, X), IsProperMap g ∧
    ∃ H : ContinuousMap.Homotopy (g.comp f) (ContinuousMap.id X),
    ∃ K : ContinuousMap.Homotopy (f.comp g) (ContinuousMap.id Y),
      IsProperMap H ∧ IsProperMap K

/-- The proper homotopy extension property of a subspace: a proper map on `X` and a jointly
proper homotopy of its restriction to `A` extend to a jointly proper homotopy on the whole
cylinder. Stage 8.5 proves it for strongly locally finite CW pairs and their product pairs. -/
def HasProperHomotopyExtensionProperty {X : Type u} [TopologicalSpace X]
    (A : Set X) : Prop :=
  ∀ (Y : Type u) [TopologicalSpace Y],
    ∀ (f : C(X, Y)), IsProperMap f →
    ∀ (H : C(unitInterval × A, Y)), IsProperMap H →
      (∀ a : A, H (0, a) = f (a : X)) →
      ∃ K : C(unitInterval × X, Y), IsProperMap K ∧
        (∀ x : X, K (0, x) = f x) ∧
        (∀ (t : unitInterval) (a : A), K (t, (a : X)) = H (t, a))

/-- Simple connectivity at infinity by compact exhaustion: every compact `K` lies in a compact
`L` such that every loop outside `L` is nullhomotopic outside `K`. The circle is Mathlib's
additive circle of period one; the predicate is shared with GeometricTopology and
FourManifolds. -/
def SimplyConnectedAtInfinity (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ K : Set X, IsCompact K → ∃ L : Set X, IsCompact L ∧ K ⊆ L ∧
    ∀ f : C(AddCircle (1 : ℝ), X), (∀ z, f z ∉ L) →
      ∃ p : X, p ∉ K ∧
        ∃ H : ContinuousMap.Homotopy f (ContinuousMap.const (AddCircle (1 : ℝ)) p),
          ∀ z : unitInterval × AddCircle (1 : ℝ), H z ∉ K

/-- **Proper strong deformation retraction** (Stage 8.5). On a locally compact Hausdorff space,
a subspace with the proper homotopy extension property whose inclusion has a proper homotopy
inverse is a proper strong deformation retract: there is a proper retraction and a jointly
proper homotopy from the identity to it, stationary on the subspace. -/
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

/-- **Mapping-space CW type** (Stage 8.11a; Milnor 1959, Theorem 3). For a compact Hausdorff
source `X` and a Hausdorff target `Y` of CW type, the mapping space `C(X, Y)` with the
compact-open topology has CW type. Compactness of `X` is what the exponential law and the
continuity of evaluation need; a finite CW complex is a compact Hausdorff source. -/
theorem finiteSourceMappingCWType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [CompactSpace X] [T2Space X] [T2Space Y]
    (modelY : CWTypeModel Y) : Nonempty (CWTypeModel C(X, Y)) := by
  sorry

open scoped ContDiff Manifold in
/-- **Transverse circle classifying map** (Stage 8.13). On a compact boundaryless smooth
manifold `M` (Hausdorff, second countable, any finite-dimensional real model `I`), every
integral degree-one class `a` is the pullback of a generator of `H¹(Circle; ℤ)` along a smooth
map `f : M → Circle` whose derivative is surjective at every point of `f⁻¹(1)`: `1` is a regular
value and `f⁻¹(1)` is the embedded codimension-one representative of the Poincaré dual of `a`.
The generator is quantified; the README fixes the one given by the positive loop
`t ↦ exp(2πit)`, and either generator is carried to the other by complex conjugation. -/
theorem exists_transverse_circle_classifying_map
    {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] [TopologicalSpace M] (I : ModelWithCorners ℝ E H) [ChartedSpace H M]
    [IsManifold I ∞ M] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M]
    (b : Module.Basis (Fin 1) ℤ (singularCohomology ℤ (TopCat.of Circle) 1))
    (a : singularCohomology ℤ (TopCat.of M) 1) :
    ∃ f : C^∞⟮I, M; 𝓡 1, Circle⟯,
      (TopCat.singularCohomologyMap (R := ModuleCat.of ℤ ℤ) (k := ℤ) (M := ModuleCat.of ℤ ℤ)
        (TopCat.ofHom ⟨f, f.contMDiff.continuous⟩) 1) (b 0) = a ∧
      ∀ x : M, f x = 1 → Function.Surjective (mfderiv I (𝓡 1) f x) := by
  sorry

/-- **Smith-type non-freeness** (Stage 8.15; Hatcher, Section 4.2, Exercise 28, p. 391). For
every prime `p` and every `n ≥ 0`, no continuous action of `C_p × C_p`, the multiplicative
wrapper of `ZMod p × ZMod p`, on the unit sphere of `EuclideanSpace ℝ (Fin (n + 1))` is free:
some nonidentity element fixes a point. For a finite group, continuity of each translation is
continuity of the action for the discrete topology. No linearity, smoothness or cellularity of
the action is assumed, and `S⁰` is included. -/
theorem elementaryAbelianPair_sphere_action_has_stabilizer (p n : ℕ) (hp : p.Prime)
    [MulAction (Multiplicative (ZMod p × ZMod p))
      ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)]
    (hcont : ∀ g : Multiplicative (ZMod p × ZMod p),
      Continuous fun x : ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) => g • x) :
    ∃ g : Multiplicative (ZMod p × ZMod p), g ≠ 1 ∧
      ∃ x : ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1), g • x = x := by
  sorry

end

end TauCetiRoadmap.AlgebraicTopology
