module

public import Mathlib
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Singular.Relative
public import TauCeti.Topology.CWComplex.Classical.FiniteCWType

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs. The headlines are the cup-length bound
for categorical covers; Poincaré duality by cap with a fundamental class and its twisted,
boundary and compact-triad Poincaré–Lefschetz forms; the bundle formula for the Euler
characteristic; homological Whitehead; finite CW type of compact smooth manifolds and the
homology-sphere recognition corollary; CW type of mapping spaces from compact sources; the
nerve model of K(G,1); rectification of a proper homotopy inverse to a proper strong
deformation retraction; absolute Hurewicz in every universe and relative Hurewicz for a simply
connected subspace; proper Whitehead; the Künneth, Wang, Cartan–Leray and Serre spectral
sequences; the topological restriction-tower comparisons; ordinary representability with the
EM loop comparison; and relative obstruction theory.

Results that Tau Ceti proves at the revision the README's supplier contracts are read at are
consumed there and not restated here: Brouwer's fixed-point theorem, the chain transfer of a
finite covering, Lusternik–Schnirelmann categorical covers and their count, ordinary Whitehead
and spaces of CW type, the Euler characteristic of spaces of finite CW type with its homotopy
invariance, product, covering and Mayer–Vietoris formulas, the field and hereditary-ring
Künneth theorems, the universal coefficient sequence, based pairs with their relative homotopy
groups and Hurewicz maps, and proper homotopy equivalences. The statements below use only
declarations present in the Tau Ceti this file is built against, so the cup-length bound is
stated for every categorical cover rather than through the native count, and spaces of CW type
are given by an explicit Hausdorff CW model and a homotopy equivalence to it.

Not stated, with the missing carriers: relative Hurewicz for a simply connected subspace and the
universe-general absolute Hurewicz theorem need based pairs (`TauCeti.BasedTopPair`), relative
homotopy groups (`TauCeti.RelHomotopyGroup`) and the Hurewicz maps
(`TauCeti.RelHomotopyGroup.hurewicz`, `HomotopyGroup.hurewicz`), which the Tau Ceti revision
this file is built against lacks (it has no `TauCeti.AlgebraicTopology.Homotopy` modules); at
the revision the README's supplier contracts are read at they exist, and both theorems are
statable on them. The twisted, boundary and
compact-triad duality forms need the homological orientation local system as a local
coefficient system, direct local-system cochains, relative fundamental classes of manifolds with
boundary and the local-coefficient cap operation. The Künneth spectral sequence and the Wang,
Cartan–Leray and Serre sequences need their canonical chain maps and abutment filtrations. The
topological Milnor comparison needs the skeletal restriction-tower adapter and its limit
comparison; the generic tower algebra is Tau Ceti's. The normalized representability and
EM-loop headlines need the supplier's functorial normalized EM family and its universal class.
The obstruction extension criteria need the cellular obstruction and difference cochains with
their transport. Proper Whitehead needs the supported cellular/singular comparison. Of the
smooth-manifold CW-type headlines, the boundary-pair and marked-point forms need a homotopy
equivalence of pairs, and the countable locally finite CW type of a noncompact manifold needs a
local-finiteness predicate on CW models. These constructions remain README targets, not
admitted data here.
-/

public section

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory CategoryTheory.Limits ContinuousMap Topology

universe u v

noncomputable section

/-! ## Layer 6: the LS bound and manifold duality -/

/-- Singular cohomology with coefficients in the ring itself. -/
noncomputable abbrev singularCohomology (R : Type u) [CommRing R]
    (X : TopCat.{u}) (n : ℕ) : ModuleCat.{u} R :=
  X.singularCohomology (ModuleCat.of R R) R (ModuleCat.of R R) n

/-- Native cup product with the same Alexander–Whitney pairing and degree pin. -/
noncomputable def cupProduct (R : Type u) [CommRing R] (X : TopCat.{u}) (p q : ℕ) :
    singularCohomology R X p →ₗ[R] singularCohomology R X q →ₗ[R]
      singularCohomology R X (p + q) :=
  X.singularCup R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
    (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q (p + q) rfl

/-- A finite positive-degree cup product, using that actual native operation. -/
inductive LSPositiveCupProduct (X : TopCat.{u}) (R : Type u) [CommRing R] :
    ℕ → (Σ d : ℕ, singularCohomology R X d) → Prop where
  | single (d : ℕ) (hd : 0 < d) (a : singularCohomology R X d) :
      LSPositiveCupProduct X R 1 ⟨d, a⟩
  | mul {r p q : ℕ} (a : singularCohomology R X p) (b : singularCohomology R X q)
      (ha : LSPositiveCupProduct X R r ⟨p, a⟩) (hq : 0 < q) :
      LSPositiveCupProduct X R (r + 1) ⟨p + q, cupProduct R X p q a b⟩

/-- Supremum of lengths of nonzero products of positive-degree classes. -/
noncomputable def lsCupLength (X : TopCat.{u}) (R : Type u) [CommRing R] : ℕ∞ :=
  sSup {m : ℕ∞ | ∃ r : ℕ, m = (r : ℕ∞) ∧
    ∃ d : ℕ, ∃ a : singularCohomology R X d,
      a ≠ 0 ∧ LSPositiveCupProduct X R r ⟨d, a⟩}

/-- A cover of a nonempty space by `n` open sets, each with nullhomotopic inclusion into the
space, has more members than the cup length, over every commutative coefficient ring (the zero
ring included). Taking the infimum over such covers bounds the unnormalized
Lusternik–Schnirelmann count: `lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ`. -/
theorem lsCupLength_add_one_le_of_categoricalCover (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] (n : ℕ) (U : Fin n → TopologicalSpace.Opens X)
    (hcover : ∀ x : X, ∃ i, x ∈ U i)
    (hnull : ∀ i,
      (⟨Subtype.val, continuous_subtype_val⟩ : C({x : X // x ∈ U i}, X)).Nullhomotopic) :
    lsCupLength X R + 1 ≤ n := by
  sorry

/-- A fundamental class of a space `M` of dimension `n` with coefficients in a commutative ring
`R` (Hatcher, p.236): a class `μ ∈ Hₙ(M;R)` whose image in the local homology `Hₙ(M, M ∖ {x}; R)`
generates that `R`-module at every point `x`. -/
def IsFundamentalClass (n : ℕ) (M : Type u) [TopologicalSpace M] (R : Type u) [CommRing R]
    (μ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj
      (ModuleCat.of R R)).obj (TopCat.of M)) : Prop :=
  ∀ x : M, Submodule.span R
    {(TopPair.singularHomologyπ (TopPair.ofSubset ({x}ᶜ : Set (TopCat.of M)))
      (ModuleCat.of R R) n).hom μ} = ⊤

/-- Poincaré duality for a compact Hausdorff topological `n`-manifold `M` with a fundamental
class `μ` over a commutative ring `R`: capping with `μ` is bijective `H^p(M;R) → H_q(M;R)`
whenever `p + q = n` (Hatcher, Theorem 3.30, p.241). The cap is the native `TopCat.singularCap`
with the ring multiplication as pairing, the same data as `cupProduct`. -/
theorem poincareDuality_of_isFundamentalClass (n : ℕ) (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [T2Space M] [CompactSpace M]
    (R : Type u) [CommRing R]
    (μ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj
      (ModuleCat.of R R)).obj (TopCat.of M))
    (hμ : IsFundamentalClass n M R μ) (p q : ℕ) (h : p + q = n) :
    Function.Bijective
      (fun a : singularCohomology R (TopCat.of M) p =>
        ((TopCat.of M).singularCap R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
          (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q n h a).hom μ) := by
  sorry

/-- Poincaré duality for a compact connected Hausdorff topological `n`-manifold with
coefficients in a commutative ring `R` in which `2 = 0`: every manifold is `R`-orientable
for such `R` (Hatcher, p.235), so there is a fundamental class `μ` in `H_n(M;R)` such that
capping with `μ` is bijective `H^p(M;R) → H_q(M;R)` whenever `p + q = n` (Hatcher,
Theorem 3.30, p.241). The cap is the native `TopCat.singularCap` with the ring
multiplication as pairing, the same data as `cupProduct`. -/
theorem poincareDuality_twoTorsionCoefficients (n : ℕ) (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [T2Space M] [CompactSpace M]
    [ConnectedSpace M] (R : Type u) [CommRing R] (h2 : (2 : R) = 0) :
    ∃ μ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} R) n).obj
        (ModuleCat.of R R)).obj (TopCat.of M),
      ∀ (p q : ℕ) (h : p + q = n),
        Function.Bijective
          (fun a : singularCohomology R (TopCat.of M) p =>
            ((TopCat.of M).singularCap R (MonoidalCategory.leftUnitor (ModuleCat.of R R)).inv
              (MonoidalCategory.leftUnitor (ModuleCat.of R R)).hom p q n h a).hom μ) := by
  sorry

/-! ## Layer 7: Euler characteristic -/

/-- The Euler characteristic is multiplicative in fibre bundles: for a fibre bundle with base `B`
and fibre `F` of finite CW type, the alternating sum of the dimensions of the singular homology
of the total space over any field `k` is `χ(B)·χ(F)`, with no hypothesis on the monodromy; the
route is the Serre spectral sequence of the bundle projection. -/
theorem finsum_finrank_singularHomology_fiberBundle (k : Type u) [Field k]
    {B F : Type u} [TopologicalSpace B] [TopologicalSpace F] (E : B → Type u)
    [TopologicalSpace (Bundle.TotalSpace F E)] [∀ b, TopologicalSpace (E b)] [FiberBundle F E]
    [TauCeti.FiniteCWType B] [TauCeti.FiniteCWType F] :
    ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * (Module.finrank k
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} k) i).obj
        (ModuleCat.of k k)).obj (TopCat.of (Bundle.TotalSpace F E))) : ℤ) =
      TauCeti.eulerChar B * TauCeti.eulerChar F := by
  sorry

/-! ## Layer 8: Whitehead, classifying spaces and proper deformation -/

/-- A map between simply connected CW complexes which induces isomorphisms on integral singular
homology is itself the forward map of a homotopy equivalence. -/
theorem homologicalWhitehead
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y]
    [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)]
    (f : C(X, Y))
    (_hf : ∀ n : ℕ,
      IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).map (TopCat.ofHom f))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-- Homological Whitehead for simply connected spaces of CW type: `X` and `Y` are homotopy
equivalent to CW complexes `C ⊆ K` and `D ⊆ L` in Hausdorff spaces of the same universe, the
shape of Tau Ceti's `TauCeti.CWType`, and no CW structure is assumed on `X` or `Y`. -/
theorem homologicalWhitehead_cwType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y]
    {K L : Type u} [TopologicalSpace K] [TopologicalSpace L] [T2Space K] [T2Space L]
    (C : Set K) (D : Set L) [CWComplex C] [CWComplex D] (eX : X ≃ₕ C) (eY : Y ≃ₕ D)
    (f : C(X, Y))
    (hf : ∀ n : ℕ, IsIso (((AlgebraicTopology.singularHomologyFunctor
      (ModuleCat.{u} ℤ) n).obj (ModuleCat.of ℤ (ULift.{u} ℤ))).map (TopCat.ofHom f))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

open scoped ContDiff Manifold in
/-- A compact Hausdorff second-countable smooth manifold without boundary (Euclidean model)
has finite CW type: GeometricTopology's smooth triangulation (Whitehead) is finite by
compactness and its realization homeomorphism is the model equivalence. -/
theorem compactManifoldFiniteCWType (n : ℕ) (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M] :
    TauCeti.FiniteCWType M := by
  sorry

open scoped ContDiff Manifold in
/-- A compact Hausdorff second-countable smooth manifold with boundary (half-space model)
has finite CW type, by the same finite smooth triangulation. -/
theorem compactManifoldWithBoundaryFiniteCWType (n : ℕ) [NeZero n] (M : Type u)
    [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M] :
    TauCeti.FiniteCWType M := by
  sorry

/-- A simply connected space of CW type whose integral singular homology vanishes in every
degree other than `0` and `n` and is `ℤ` in degree `n ≥ 2` is homotopy equivalent to the
standard sphere `Sⁿ`: Hurewicz gives a map `Sⁿ → X` inducing an isomorphism on homology
(Hatcher, Theorem 4.32, p.366) and homological Whitehead makes it a homotopy equivalence
(Hatcher, Corollary 4.33, p.367). CW type is an explicit CW model `C ⊆ K` with a homotopy
equivalence `X ≃ₕ C`. -/
theorem nonempty_homotopyEquiv_sphere_of_homologySphere (n : ℕ) (hn : 2 ≤ n)
    (X : Type u) [TopologicalSpace X] [SimplyConnectedSpace X]
    {K : Type u} [TopologicalSpace K] [T2Space K] (C : Set K) [CWComplex C] (e : X ≃ₕ C)
    (hvanish : ∀ k : ℕ, k ≠ 0 → k ≠ n →
      IsZero (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) k).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of X)))
    (htop : Nonempty ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of X)) ≅ ModuleCat.of ℤ (ULift.{u} ℤ))) :
    Nonempty (X ≃ₕ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) := by
  sorry

/-- A compact Hausdorff source and a target of CW type have a mapping space of CW
type (Milnor, Theorem 3, p.276); the topology is compact-open. Milnor's statement
carries no separation axiom on the compact source, but the function-space steps of
its proof (continuity of evaluation, the exponential law for homotopies into the
mapping space) are available for compact Hausdorff sources; the Hausdorff hypothesis
on `X` is kept for that reason. No separation axiom is needed on `Y`: the model's
carrier is a Hausdorff CW complex `C`, and postcomposition with the model equivalence
and its homotopies, transported through the exponential law for the compact Hausdorff
source, makes `C(X, Y)` homotopy equivalent to `C(X, C)`. The conclusion is CW type in the
shape of Tau Ceti's `TauCeti.CWType`. -/
theorem finiteSourceMappingCWType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [CompactSpace X] [T2Space X]
    {K : Type u} [TopologicalSpace K] [T2Space K] (C : Set K) [CWComplex C] (e : Y ≃ₕ C) :
    ∃ (L : Type u) (_ : TopologicalSpace L) (_ : T2Space L) (D : Set L) (_ : CWComplex D),
      Nonempty (C(X, Y) ≃ₕ D) := by
  sorry

open scoped Simplicial in
/-- The single generic bar/nerve realization for discrete groups. -/
abbrev groupClassifyingSpace (G : Type u) [Group G] : TopCat.{u} :=
  SSet.toTop.obj (CategoryTheory.nerve (SingleObj G))

open scoped Simplicial in
/-- The unique bar vertex, with its realization inclusion. -/
noncomputable def groupClassifyingSpaceBasepoint (G : Type u) [Group G] :
    groupClassifyingSpace G :=
  (SSet.toTop.map (SSet.const (X := SSet.stdSimplex.obj ⦋0⦌)
    (CategoryTheory.nerveEquiv.symm (SingleObj.star G))))
      ((SSet.toTopSimplex.app ⦋0⦌).inv
        (default : SimplexCategory.toTop.obj ⦋0⦌))

/-- The nerve realization of a discrete group is a K(G,1), including nonabelian G. -/
theorem groupClassifyingSpace_isEMOne (G : Type u) [Group G] :
    TauCeti.IsEilenbergMacLaneSpaceOne G (groupClassifyingSpace G)
      (groupClassifyingSpaceBasepoint G) := by
  sorry

/-- Proper extension retains a jointly proper map on the entire cylinder.
Layer 8.5 proves this for strongly locally finite CW pairs and their product pairs. -/
def HasProperHomotopyExtensionProperty {X : Type u} [TopologicalSpace X]
    (A : Set X) : Prop :=
  ∀ (Y : Type u) [TopologicalSpace Y],
    ∀ (f : C(X, Y)), IsProperMap f →
    ∀ (H : C(unitInterval × A, Y)), IsProperMap H →
      (∀ a : A, H (0, a) = f (a : X)) →
      ∃ K : C(unitInterval × X, Y), IsProperMap K ∧
        (∀ x : X, K (0, x) = f x) ∧
        (∀ (t : unitInterval) (a : A), K (t, (a : X)) = H (t, a))

/-- A proper homotopy inverse of a subspace inclusion is rectified to a proper strong
deformation retraction, using proper extension and its cylinder corollary. The hypotheses
spell out that the inclusion `A ↪ X` is proper with proper homotopy inverse `g` and jointly
proper homotopies `H : g ∘ incl ≃ id` on `I × A` and `K : incl ∘ g ≃ id` on `I × X`, the data
of Tau Ceti's `ContinuousMap.HasProperHomotopyInverse`. Closedness of `A` follows from
properness of the inclusion. -/
theorem properStrongDeformationRetract_of_inverse
    {X : Type u} [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    (A : Set X) (hA : HasProperHomotopyExtensionProperty A)
    (hincl : IsProperMap (Subtype.val : A → X)) (g : C(X, A)) (hg : IsProperMap g)
    (H : ContinuousMap.Homotopy (g.comp ⟨Subtype.val, continuous_subtype_val⟩)
      (ContinuousMap.id A))
    (K : ContinuousMap.Homotopy
      ((⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)).comp g) (ContinuousMap.id X))
    (hH : IsProperMap H) (hK : IsProperMap K) :
    ∃ r : C(X, A), IsProperMap r ∧ (∀ a : A, r (a : X) = a) ∧
      ∃ H : (ContinuousMap.id X).HomotopyRel
        ((⟨Subtype.val, continuous_subtype_val⟩ : C(A, X)).comp r) A,
        IsProperMap H := by
  sorry

end

end TauCetiRoadmap.AlgebraicTopology
