module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.Empty
public import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
public import TauCeti.AlgebraicTopology.Singular.Twisted.Functoriality
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.FundamentalGroup.TopologicalMonoid
public import TauCeti.Topology.Homotopy.HomotopyGroup.Product
public import TauCeti.Topology.Homotopy.HomotopyGroup.FundamentalGroupAction
public import TauCeti.Topology.Homotopy.Extension.DeformationRetract
public import TauCeti.Topology.Homotopy.Extension.MappingCylinder
public import TauCeti.Topology.CWComplex.Classical.FiniteCWType
public import TauCeti.Topology.Category.TopPair

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them. Every target, API list and Check lives in the README.

Stated here: the pair/quotient comparison and the homotopy-inverse extension theorem for
closed cofibered pairs (Stage 4); the compact-support existence and uniqueness lemma with
local coefficients, Poincaré duality for a closed manifold with a fundamental class, the
Lusternik–Schnirelmann cup-length bound and the product-ball intersection theorem (Stage 6);
finite CW type of compact smooth manifolds, stated on Tau Ceti's predicate
`TauCeti.FiniteCWType` (Stage 8.7); homological Whitehead, the nerve `K(G,1)`, the proper
deformation retraction theorem, mapping-space CW type, the transverse codimension-one
classifying map and the non-freeness of `C_p × C_p` on spheres (Stage 8). The cup-length
bound, the proper deformation retraction theorem and mapping-space CW type are stated on the
defining conditions of Tau Ceti's `TauCeti.LSCategoricalCover`,
`ContinuousMap.HasProperHomotopyInverse` and `TauCeti.CWType`, with the cover, the inverse
with its two homotopies, and the CW model named as binders.

Not stated, because Tau Ceti proves them at the revision the README Inventory names:
commutativity of the fundamental group of a space with a continuous unital multiplication
(Stage 1 item 6; `FundamentalGroup.instCommGroup`); the Brouwer fixed-point theorem for nonempty compact convex
sets in a finite-dimensional space or subspace (Stage 2.7;
`TauCeti.brouwerFixedPoint_compactConvex`, `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`);
the cellular comparison for relative CW complexes of arbitrary dimension (Stage 4.3;
`TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape`);
the cylinder on a closed cofibration (Stage 4.5;
`TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`); the transfer of a
covering map with finite fibres and the deck-sum formula (Stage 5.3;
`IsCoveringMap.singularTransfer_comp_chainComplexMap`,
`IsQuotientCoveringMap.chainComplexMap_comp_singularTransfer`); the Euler characteristic of a
space of finite CW type, its independence of the finite CW model and its homotopy invariance
(Stage 7; `TauCeti.eulerChar`, `TauCeti.eulerChar_eq_cwEulerChar`,
`ContinuousMap.HomotopyEquiv.eulerChar_eq`); the connectivity of a relative CW complex whose
cells have dimension at least `λ` (Stage 8.1; `TauCeti.injective_homotopyGroupMap_of_isEmpty_cell`,
`TauCeti.surjective_homotopyGroupMap_of_isEmpty_cell`); absolute Hurewicz for spaces in `Type`
(Stage 8.3; `HomotopyGroup.bijective_hurewicz`); Whitehead's theorem for spaces of CW type
(Stage 8.5; `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`).

Relative Hurewicz in the generality of Stage 8.4 (`X` path connected, `A` simply connected,
`π_i(X, A)` trivial for `1 ≤ i < n`, degree `n ≥ 2`; Hatcher, Theorem 4.37, p. 371) is statable
at the Tau Ceti revision the README Inventory names, and it is the one such headline this file
does not state: its module, `TauCeti.AlgebraicTopology.Homotopy.Relative.Hurewicz`, is absent
from the Tau Ceti revision this file is elaborated against. Its statement is Stage 8.4's:
bijectivity of `TauCeti.RelHomotopyGroup.hurewicz` out of
`TauCeti.RelHomotopyGroup (Fin (n − 1))` of the based pair, under `PathConnectedSpace X`,
`SimplyConnectedSpace A` and the vanishing of `TauCeti.RelHomotopyGroup (Fin k)` for `k ≤ n − 2`.

Not statable at the pins, and therefore stated nowhere in this file:
the Cartan–Leray spectral sequence (its `E²` term is group homology of the deck
representation, which needs the double complex of the deck action, a Stage 5.3 construction
absent at the pins; the pinned `TauCeti.filteredSpaceSpectralSequence` filters a space by
subspaces, and the Serre spectral sequences that Stage 5.5 applies are DGFloer Layer 1
item 2's); the Wang sequence of the mapping torus of an arbitrary continuous self-map and
its local-coefficient form (the pinned `TauCeti.MappingTorus` is the mapping torus of a
homeomorphism, whose Wang sequence is Tau Ceti's); the Künneth spectral sequence over a
general commutative ring and the local-coefficient Künneth theorems (no Künneth double
complex and no twisted cross product at the pins; the projective, field and hereditary-ring
Künneth theorems on the pinned cross product `TopCat.singularHomologyCross` are Tau Ceti's);
the local-coefficient Poincaré–Lefschetz dualities and their boundary form (no twisted cap
product at the pins; only the untwisted closed form with a fundamental-class datum is
stated); ordinary representability and the ordinary Eilenberg–MacLane loop comparison (no
functorial normalized Eilenberg–MacLane family with its universal class; the pinned
Eilenberg–MacLane predicate is the degree-one `TauCeti.IsEilenbergMacLaneSpaceOne`); the
obstruction and difference cochain criteria (no cellular obstruction cochain construction).
The Stage 2.5 and 4.4 reference classes, sphere and disk homeomorphisms, the relative CW
pushout, relative cylinder and kified product CW structures are constructions, not theorems:
they remain README targets.
-/

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory ContinuousMap Topology
open CategoryTheory.Limits
open scoped Topology

@[expose] public noncomputable section

#check HomotopyGroup.prodEquiv
#check HomotopyGroup.prodMulEquiv
#check TauCeti.map_fundamentalGroup_smul
#check isQuotientCoveringMap_iff_isCoveringMap_and
#check TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction
#check TauCeti.MappingCylinder.homotopyEquiv
#check TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl
#check FundamentalGroup.instCommGroup
#check FundamentalGroup.cast_map_prod_mul

universe u v

/-- Singular homology with coefficients in the ring itself. -/
abbrev singularHomology (R : Type u) [CommRing R] (X : TopCat.{u}) (n : ℕ) :
    ModuleCat.{u} R :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj (ModuleCat.of R R)).obj X

/-- Singular cohomology with coefficients in the ring itself. -/
abbrev singularCohomology (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) n

/-! ## Stage 4: pair quotients and closed cofibrations -/

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

/-- **Homotopy inverses of pair equivalences** (Stage 4.5). For closed cofibered pairs `(X, A)`
and `(X', A')`, a homotopy equivalence `e : X ≃ X'` restricting to a homotopy equivalence
`e₀ : A ≃ A'`, and prescribed one-sided inverse data `g₀`, `H₀` on the subspaces, there is a
homotopy inverse `g` of `e` extending `g₀` with a left-inverse homotopy extending `H₀`
(Brown, *Topology and Groupoids*, 7.4.2 and its Addendum, pp. 285–286, with the prescribed
one-sided homotopy obtained through Vogt's strong homotopy equivalence and Tau Ceti's cylinder
cofibration `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`; Hatcher,
Proposition 0.19, p. 16, is the case `e₀ = id`). -/
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
    (((TauCeti.LocalCoefficientSystem.pullbackIdIso X).app L).inv ≫
      eqToHom (show (TauCeti.LocalCoefficientSystem.pullback (ContinuousMap.id X)).obj L =
          (TauCeti.LocalCoefficientSystem.pullback
            (TopPair.Hom.fst (supportLocalPairMap X B x hx)).hom).obj L by
        have h : TopPair.Hom.fst (supportLocalPairMap X B x hx) = 𝟙 X := by
          ext y
          exact TopPair.ofSubsetMap_fst_apply _ _ y
        rw [h]; rfl)) n ≫
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

/-- **Compact-support classes** (Stage 6.3; Hatcher, Lemma 3.27(a), p. 236, with local
coefficients). On a Hausdorff topological `m`-manifold `M` (charted on
`EuclideanSpace ℝ (Fin m)`; no smooth structure and no second countability, so the long line
is included), a locally represented section of local top homology over an open `V`
containing a compact `K` is induced by exactly one class in `H_m(M, M ∖ K; L)`. For constant
coefficients this is Tau Ceti's `TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact`;
the content here is the local coefficient system. -/
theorem compactSupportTopClass_existsUnique (R : Type) [CommRing R] (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
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
    eqToHom (TopPair.singularHomologyFunctor_obj _ (ModuleCat.of R R) n) ≫
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
nonzero product of `r` positive-degree classes forces at least `r + 1` opens in any open cover
of `X` whose members have nullhomotopic inclusions into `X`; the coefficient ring may be the
zero ring. The cover data are the fields of Tau Ceti's `TauCeti.LSCategoricalCover X univ n`,
so the bound for every such cover is `lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X univ`. -/
theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] (n : ℕ) (U : Fin n → TopologicalSpace.Opens X)
    (hcover : ∀ x : X, ∃ i, x ∈ U i)
    (hnull : ∀ i,
      (⟨Subtype.val, continuous_subtype_val⟩ : C({x : X // x ∈ U i}, X)).Nullhomotopic) :
    lsCupLength X R + 1 ≤ n := by
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

/-! ## Stage 8.7: finite CW type of compact manifolds -/

open scoped ContDiff in
/-- **Finite CW type of compact manifolds** (Stage 8.7). A compact Hausdorff second-countable
smooth boundaryless manifold with Euclidean model has finite CW type in the sense of Tau
Ceti's predicate `TauCeti.FiniteCWType`: it is homotopy equivalent to a finite CW complex in
a Hausdorff space. The route needs only the triangulation: GeometricTopology's smooth
triangulation makes `M` triangulable, and Tau Ceti's `TauCeti.IsTriangulable.finiteCWType`
gives finite CW type for every compact triangulable space. -/
theorem compactManifoldFiniteCWType (n : ℕ)
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] :
    TauCeti.FiniteCWType M := by
  sorry

/-! ## Stage 8: homological Whitehead, classifying spaces, proper deformation and
mapping spaces -/

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

/-- **Proper strong deformation retraction** (Stage 8.5). On a locally compact Hausdorff space,
a subspace with the proper homotopy extension property whose inclusion has a proper homotopy
inverse is a proper strong deformation retract: there is a proper retraction and a jointly
proper homotopy from the identity to it, stationary on the subspace. The hypotheses `hincl`
through `hK` are the conditions of Tau Ceti's `ContinuousMap.HasProperHomotopyInverse` for the
inclusion, with the inverse `g` and the homotopies `H : g ∘ ι ≃ id_A` and `K : ι ∘ g ≃ id_X`
named; properness of `H` and `K` is properness of the maps `I × A → A` and `I × X → X`, not
of their time slices. -/
theorem properStrongDeformationRetract_of_inverse
    {X : Type u} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    (A : Set X) (hA : HasProperHomotopyExtensionProperty A)
    (hincl : IsProperMap (⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)))
    (g : C(X, A)) (hg : IsProperMap g)
    (H : ContinuousMap.Homotopy (g.comp ⟨Subtype.val, continuous_subtype_val⟩)
      (ContinuousMap.id A))
    (K : ContinuousMap.Homotopy
      ((⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)).comp g) (ContinuousMap.id X))
    (hH : IsProperMap H) (hK : IsProperMap K) :
    ∃ r : C(X, A), IsProperMap r ∧ (∀ a : A, r (a : X) = a) ∧
      ∃ D : (ContinuousMap.id X).HomotopyRel
        ((⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)).comp r) A,
        IsProperMap D := by
  sorry

/-- **Mapping-space CW type** (Stage 8.11a; Milnor 1959, Theorem 3). For a compact Hausdorff
source `X` and a Hausdorff target `Y` homotopy equivalent to a CW complex `C` in a Hausdorff
space `Z`, the mapping space `C(X, Y)` with the compact-open topology is homotopy equivalent to
a CW complex in a Hausdorff space of the same universe. Hypothesis and conclusion are the
defining condition of Tau Ceti's `TauCeti.CWType`, the hypothesis with its model named.
Compactness of `X` is what the exponential law and the continuity of evaluation need; a finite
CW complex is a compact Hausdorff source. -/
theorem finiteSourceMappingCWType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [CompactSpace X] [T2Space X] [T2Space Y]
    (Z : Type u) [TopologicalSpace Z] [T2Space Z] (C : Set Z) [CWComplex C] (e : Y ≃ₕ C) :
    ∃ (Z' : Type u) (_ : TopologicalSpace Z') (_ : T2Space Z') (C' : Set Z') (_ : CWComplex C'),
      Nonempty (C(X, Y) ≃ₕ C') := by
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
