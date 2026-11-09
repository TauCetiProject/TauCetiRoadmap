module

public import Mathlib
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
public import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
public import TauCeti.AlgebraicTopology.Cohomology.Cup
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Basic
public import TauCeti.AlgebraicTopology.Homotopy.Relative.Hurewicz
public import TauCeti.AlgebraicTopology.Singular.Relative
public import TauCeti.Topology.CWComplex.Classical.CWType
public import TauCeti.Topology.CWComplex.Classical.FiniteCWType
public import TauCeti.Topology.Homotopy.LusternikSchnirelmann

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs. The headlines are the cup-length bound
for the Lusternik–Schnirelmann count; Poincaré duality by cap with a fundamental class and its
twisted, boundary and compact-triad Poincaré–Lefschetz forms; the product-ball intersection
theorem (§6.6); the bundle formula for the Euler characteristic; absolute Hurewicz in every
universe and relative Hurewicz for a simply connected subspace; homological Whitehead for
spaces of CW type; proper Whitehead; finite CW type of compact smooth manifolds and the
homology-sphere recognition corollary; CW type of mapping spaces from compact sources; the
nerve model of K(G,1); rectification of a proper homotopy inverse to a proper strong
deformation retraction; the Künneth and Cartan–Leray spectral sequences; the topological
restriction-tower comparisons; ordinary representability with the EM loop comparison;
relative obstruction theory; the transverse circle classifying map of an integral degree-one
class (§8.13); and the non-freeness of `C_p × C_p` actions on spheres (§8.15).

Results that Tau Ceti proves are consumed through the README's supplier contracts and not
restated here: Brouwer's fixed-point theorem, the chain transfer of a finite covering,
Lusternik–Schnirelmann categorical covers and their count, the Wang sequence of a mapping torus
of a homeomorphism, the homology of tori as exterior powers, the ordered Čech double complex of
an open cover with its quasi-isomorphism to singular chains and its spectral sequence, the
coefficient Bockstein, the laws of the constant-coefficient cup and cap products, ordinary
Whitehead and spaces of CW type, the Euler characteristic of spaces of finite CW type with its
homotopy invariance, product, covering and Mayer–Vietoris formulas, the field and
hereditary-ring Künneth theorems, the universal coefficient sequence, based pairs with their
relative homotopy groups and Hurewicz maps, absolute Hurewicz for spaces in `Type`, relative
Hurewicz when the subspace and the space are both highly connected, the local homology system
of a manifold, which is a local coefficient system, and proper homotopy equivalences.

Not stated, with the missing carriers. The twisted, boundary and compact-triad duality forms
need direct local-system cochains (the pinned twisted cochains are Hom of twisted chains, which
computes cochains of the dual system), the local-coefficient cap product and relative
fundamental classes of manifolds with boundary; the pinned fundamental classes are those of
boundaryless manifolds. The Künneth spectral sequence over a general ring needs the filtration
of the tensor product of chain complexes whose second page is `Tor`, and the Cartan–Leray
spectral sequence needs the double complex of the deck action with its group-homology second
page; neither pinned library has them. The topological Milnor comparison needs the skeletal
restriction tower of cohomology modules of a CW complex and its limit comparison; the generic
tower algebra is Tau Ceti's. The normalized representability and EM-loop headlines need the
supplier's functorial normalized K(A,n) family and its universal class; the pins have only
K(G,1) spaces. The obstruction extension criteria need the cellular obstruction and difference
cochains with their transport. Proper Whitehead needs compactly supported singular cohomology
with pullback along proper maps, the carrier of its hypothesis, which neither pinned library
has. Of the smooth-manifold CW-type headlines, the boundary-pair and marked-point forms need a
homotopy equivalence of pairs, and the countable locally finite CW type of a noncompact
manifold needs a local-finiteness predicate on CW models. These constructions remain README
targets, not admitted data here.
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

/-- The cup length bounds the unnormalized Lusternik–Schnirelmann count: on a nonempty space
`X`, over every commutative coefficient ring `R` (the zero ring included),
`lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ`. Equivalently, every cover of `X` by
`n` open sets, each with nullhomotopic inclusion into `X`, has `n > lsCupLength X R`. -/
theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ := by
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

/-- **Product-ball intersection** (§6.6). Continuous fillings `f : D_p → D_p × D_q` and
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

/-! ## Layer 7: Euler characteristic -/

/-- The Euler characteristic is multiplicative in fibre bundles: for a fibre bundle with base `B`
and fibre `F` of finite CW type, the alternating sum of the dimensions of the singular homology
of the total space over any field `k` is `χ(B)·χ(F)`, with no hypothesis on the monodromy
(Klein–Malkiewich–Ramzi, *On the multiplicativity of the Euler characteristic*, pp.1–2, and
Theorem A, p.2, for finitely dominated fibre and base); the route is the Serre spectral
sequence of the bundle projection. -/
theorem finsum_finrank_singularHomology_fiberBundle (k : Type u) [Field k]
    {B F : Type u} [TopologicalSpace B] [TopologicalSpace F] (E : B → Type u)
    [TopologicalSpace (Bundle.TotalSpace F E)] [∀ b, TopologicalSpace (E b)] [FiberBundle F E]
    [TauCeti.FiniteCWType B] [TauCeti.FiniteCWType F] :
    ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * (Module.finrank k
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} k) i).obj
        (ModuleCat.of k k)).obj (TopCat.of (Bundle.TotalSpace F E))) : ℤ) =
      TauCeti.eulerChar B * TauCeti.eulerChar F := by
  sorry

/-! ## Layer 8: Hurewicz, Whitehead, CW type, classifying spaces and proper deformation -/

/-- **Absolute Hurewicz in every universe.** If `πₖ(X, x)` is trivial for every `k < n + 2`,
then the Hurewicz map `πₙ₊₂(X, x) → Hₙ₊₂(X; ℤ)`, sending a class to the image of the cube
generator, is bijective (Hatcher, Theorem 4.32, p.366). The space lives in an arbitrary universe
`u`, and `ℤ` is lifted to it; Tau Ceti's `HomotopyGroup.bijective_hurewicz` is the case of
spaces in `Type`. -/
theorem hurewicz_bijective {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ)
    (hX : ∀ k < n + 2, Subsingleton (HomotopyGroup (Fin k) X x)) :
    Function.Bijective fun a : HomotopyGroup (Fin (n + 2)) X x ↦
      (HomotopyGroup.hurewicz (ModuleCat.of ℤ (ULift.{u} ℤ)) (n + 1) a).hom 1 := by
  sorry

/-- **Relative Hurewicz for a simply connected subspace.** Let `(X, A, a₀)` be a based pair,
in any universe, with `A` simply connected, every point of `X` joined by a path to a point of
`A` (every path component of `X` meets `A`), and `π_{k+1}(X, A, a₀)` trivial for `k < n + 1`.
Then the relative Hurewicz map `πₙ₊₂(X, A, a₀) → Hₙ₊₂(X, A; ℤ)` is bijective (Hatcher,
Theorem 4.32, p.366). `TauCeti.RelHomotopyGroup (Fin k) X` is `π_{k+1}(X, A, a₀)`. Nothing is
assumed of `πₖ(A)` for `k ≥ 2` or of `πₖ(X)`: for `(D³, S²)` with `n = 1` the map is
`π₃(D³, S²) ≅ π₂(S²) = ℤ → H₃(D³, S²) = ℤ`, outside Tau Ceti's
`TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup`. -/
theorem relativeHurewicz_bijective (X : TauCeti.BasedTopPair.{u}) (n : ℕ)
    [SimplyConnectedSpace X.pair.snd]
    (h₀ : ∀ y : X.pair.fst, ∃ a : X.pair.snd, Joined y (X.pair.map a))
    (h : ∀ k < n + 1, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) X)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 1)) X ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ (ULift.{u} ℤ)) (n + 1) a).hom 1 := by
  sorry

/-- **Homological Whitehead.** A map between simply connected spaces of CW type (Tau Ceti's
`TauCeti.CWType`) which induces isomorphisms on integral singular homology in every degree is
the forward map of a homotopy equivalence (Hatcher, Corollary 4.33, p.367). No CW structure is
assumed on `X` or `Y`; a Hausdorff CW complex has CW type. -/
theorem homologicalWhitehead {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y] [TauCeti.CWType X] [TauCeti.CWType Y]
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

/-- A simply connected space of CW type (Tau Ceti's `TauCeti.CWType`) whose integral singular
homology vanishes in every degree other than `0` and `n` and is `ℤ` in degree `n ≥ 2` is
homotopy equivalent to the standard sphere `Sⁿ`: Hurewicz gives a map `Sⁿ → X` inducing an
isomorphism on homology (Hatcher, Theorem 4.32, p.366) and homological Whitehead makes it a
homotopy equivalence (Hatcher, Corollary 4.33, p.367). -/
theorem nonempty_homotopyEquiv_sphere_of_homologySphere (n : ℕ) (hn : 2 ≤ n)
    (X : Type u) [TopologicalSpace X] [SimplyConnectedSpace X] [TauCeti.CWType X]
    (hvanish : ∀ k : ℕ, k ≠ 0 → k ≠ n →
      IsZero (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) k).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of X)))
    (htop : Nonempty ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of X)) ≅ ModuleCat.of ℤ (ULift.{u} ℤ))) :
    Nonempty (X ≃ₕ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) := by
  sorry

/-- A compact Hausdorff source and a target of CW type have a mapping space of CW
type, Tau Ceti's `TauCeti.CWType` for the compact-open topology on `C(X, Y)` (Milnor,
Theorem 3, p.276); no metrizability of the source is assumed. Milnor's statement carries no
separation axiom on the compact source, but the function-space steps of its proof (continuity
of evaluation, the exponential law for homotopies into the mapping space) are available for
compact Hausdorff sources; the Hausdorff hypothesis on `X` is kept for that reason. No
separation axiom is needed on `Y`: postcomposition with the equivalence to a CW model `Z` in a
Hausdorff space and with its homotopies, transported through the exponential law for the
compact Hausdorff source, makes `C(X, Y)` homotopy equivalent to `C(X, Z)`. The route makes the
maps from `X` into the metric realization of a simplicial model a metric absolute
neighbourhood retract, which is dominated by a CW complex. -/
theorem finiteSourceMappingCWType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [CompactSpace X] [T2Space X] [TauCeti.CWType Y] :
    TauCeti.CWType C(X, Y) := by
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

/-! ## Layer 8: smooth representatives and acceptance applications -/

open scoped ContDiff Manifold in
/-- **Transverse circle classifying map** (§8.13). On a compact boundaryless smooth
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

/-- **Non-freeness of `C_p × C_p` on spheres** (§8.15; Hatcher, Section 4.2, Exercise 28,
p. 391). For every prime `p` and every `n ≥ 0`, no continuous action of `C_p × C_p`, the
multiplicative wrapper of `ZMod p × ZMod p`, on the unit sphere of
`EuclideanSpace ℝ (Fin (n + 1))` is free: some nonidentity element fixes a point. For a finite
group, continuity of each translation is continuity of the action for the discrete topology. No
linearity, smoothness or cellularity of the action is assumed, and `S⁰` is included. -/
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
