import Mathlib
import TauCeti.AlgebraicTopology.Cellular.Comparison
import TauCeti.AlgebraicTopology.Cohomology.Cap.Basic
import TauCeti.AlgebraicTopology.Cohomology.Cup
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
import TauCeti.Topology.Homotopy.HomotopyGroup.Map

/-!
# Algebraic topology of spaces and manifolds: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned Mathlib and Tau Ceti APIs. The headlines are cellular comparison,
transfer, Wang and Künneth, Cartan–Leray and Serre convergence, local orientation and
Poincaré–Lefschetz duality, Euler characteristic, Hurewicz and Whitehead, countable
derived limits and Milnor sequences, ordinary representability and obstruction theory,
Brouwer, proper deformation retraction, finite CW type of compact smooth manifolds and the
homology-sphere recognition corollary, and the LS cup-length bound.

Of the duality headlines, the closed-manifold form with coefficients in a commutative
ring in which `2 = 0` is stated below through the native cap product. The twisted,
boundary and oriented-integral forms cannot yet be stated on their intended objects:
the homological orientation local system, supported fundamental classes, direct
local-system cochains and relative twisted cap operation are missing. Absolute
Hurewicz lacks a Hurewicz map from the native cubical homotopy groups to singular
homology (no Hurewicz module at the pins), and an abstract isomorphism would be a
stand-in, so it is not stated. Relative Hurewicz lacks relative homotopy-group carriers
and their canonical Hurewicz map. The algebraic Milnor sequence for a countable tower
of chain complexes lacks a native limit complex and derived inverse limit of a tower
of complexes; only its module-level kernel/cokernel description of `lim`/`lim¹` is
stated (`towerDifference`). The normalized representability and EM-loop headlines lack
the supplier's functorial normalized EM family and its universal class. The obstruction
extension criteria lack the cellular obstruction and difference constructions with
their transport. The integer-graded Milnor comparison lacks the skeletal
restriction/cohomology comparison and its derived-limit cone. Proper Whitehead lacks
the supported cellular/singular comparison. Of the smooth-manifold CW-type headlines,
the compact closed and compact-with-boundary finite-CW-type statements and the
homology-sphere recognition corollary are stated below (`FiniteCWTypeModel`); the
boundary-pair form and the marked-point form lack a native homotopy equivalence of
pairs, and the countable locally finite CW type of a noncompact manifold lacks a
local-finiteness predicate on CW models. These constructions remain README
targets, not admitted data here.

The README also specifies the full naturality and filtration conclusions of Wang,
Künneth, Cartan–Leray and Serre. Their canonical chain maps and abutment filtrations
are not supplied by the pins. The transfer existence statement below uses actual
singular complexes; it does not introduce a putative chosen transfer. The native
ordinary pair, excision, Mayer–Vietoris, van Kampen and finite-dimensional cellular
comparisons are supplier contracts in the README.
-/

namespace TauCetiRoadmap.AlgebraicTopology

open CategoryTheory CategoryTheory.Limits ContinuousMap Topology

universe u v

noncomputable section

/-! ## Layer 2: relative homology and Brouwer -/

/-- Finite-dimensional Brouwer on the actual compact convex subtype. -/
theorem brouwerFixedPoint_compactConvex {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (C : Set E) (hne : C.Nonempty)
    (hcompact : IsCompact C) (hconvex : Convex ℝ C) (f : ContinuousMap C C) :
    ∃ x : C, Function.IsFixedPt f x := by
  sorry

/-! ## Layer 4: arbitrary-dimensional cellular comparison -/

/-- Cellular homology agrees with relative singular homology in every degree,
without a finite-dimensional restriction on the relative CW complex. -/
theorem cellularSingularComparison (R : Type u) [CommRing R]
    (X : Type u) [TopologicalSpace X] [T2Space X] (A : Set X)
    [RelCWComplex (Set.univ : Set X) A] (M : ModuleCat.{u} R) (n : ℕ) :
    Nonempty ((TauCeti.cellularChainComplex (Set.univ : Set X) M).homology n ≅
      (TauCeti.complexBasePair (Set.univ : Set X)).singularHomology M n) := by
  sorry

/-! ## Layer 5: finite-cover transfer -/

open scoped Simplicial in
/-- A finite constant-degree covering admits a chain transfer whose composite
with projection is the degree times the identity, over every commutative ring.
On each simplex it is exactly the sum over all lifts; naturality is specified in README.md. -/
theorem finiteCoverTransfer_exists (R : Type u) [CommRing R] (M : ModuleCat.{u} R)
    {E B : TopCat.{u}} (p : E ⟶ B) (hp : IsCoveringMap p) (d : ℕ)
    (hfinite : ∀ b : B, Finite {e : E // p e = b})
    (hcard : ∀ b : B, Nat.card {e : E // p e = b} = d) :
    ∃ t : ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).obj B ⟶
      ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).obj E,
      t ≫ ((AlgebraicTopology.singularChainComplexFunctor (ModuleCat.{u} R)).obj M).map p =
        d • 𝟙 _ ∧
      ∀ (n : ℕ) (σ : (TopCat.toSSet.obj B) _⦋n⦌),
        (TopCat.toSSet.obj B).ιChainComplex (R := M) σ ≫ t.f n =
          ∑ᶠ τ : {τ : (TopCat.toSSet.obj E) _⦋n⦌ //
            (TopCat.toSSet.map p).app _ τ = σ},
            (TopCat.toSSet.obj E).ιChainComplex (R := M) τ.val := by
  sorry

/-! ## Layer 6: countable towers and the LS bound -/

/-- The canonical product difference; inverse limits are its kernel. -/
def towerDifference {R : Type u} [CommRing R] (T : ℕᵒᵖ ⥤ ModuleCat.{u} R) :
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

/-- A countable tower with surjective bonding maps has vanishing first derived limit,
expressed as surjectivity of its product difference map. -/
theorem towerDifference_surjective {R : Type u} [CommRing R] (T : ℕᵒᵖ ⥤ ModuleCat.{u} R)
    (hT : ∀ n : ℕ, Function.Surjective
      (T.map (homOfLE (Nat.le_succ n)).op).hom) :
    Function.Surjective (towerDifference T) := by
  sorry

/-- The Mittag–Leffler stabilization of images suffices for vanishing of the
first derived inverse limit of a countable module tower. -/
theorem towerDifference_surjective_of_mittagLeffler {R : Type u} [CommRing R]
    (T : ℕᵒᵖ ⥤ ModuleCat.{u} R)
    (hT : ∀ n : ℕ, ∃ m : ℕ, ∃ hnm : n ≤ m, ∀ k : ℕ, ∀ hmk : m ≤ k,
      LinearMap.range (T.map (homOfLE (hnm.trans hmk)).op).hom =
        LinearMap.range (T.map (homOfLE hnm).op).hom) :
    Function.Surjective (towerDifference T) := by
  sorry

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

/-- Every nonzero positive-degree cup product forces one more categorical open
in a cover of a nonempty space; the coefficient ring may be the zero ring. -/
theorem lsCupLength_add_one_le_categoryCount (X : TopCat.{u}) [Nonempty X]
    (R : Type u) [CommRing R] :
    lsCupLength X R + 1 ≤ lsCategoryCount X Set.univ := by
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

/-- Euler characteristic of a chosen finite CW structure. The roadmap proves that this agrees
with alternating homology rank and is invariant under homotopy equivalence
for Hausdorff CW carriers. The numerical definition itself remains more general. -/
noncomputable def finiteCWEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)] : ℤ :=
  ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * Nat.card (Topology.RelCWComplex.cell (Set.univ : Set X) i)

/-- Finite Hausdorff CW complexes related by a homotopy equivalence have equal Euler characteristics. -/
theorem finiteCWEulerCharacteristic_eq_of_homotopyEquiv
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)]
    [CWComplex (Set.univ : Set Y)] [CWComplex.Finite (Set.univ : Set Y)]
    (_e : X ≃ₕ Y) :
    finiteCWEulerCharacteristic X = finiteCWEulerCharacteristic Y := by
  sorry

/-- Euler characteristic is multiplicative for products of finite Hausdorff CW complexes. -/
theorem finiteCWEulerCharacteristic_product {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)]
    [CWComplex (Set.univ : Set Y)] [CWComplex.Finite (Set.univ : Set Y)]
    [CWComplex (Set.univ : Set (X × Y))] [CWComplex.Finite (Set.univ : Set (X × Y))] :
    finiteCWEulerCharacteristic (X × Y) =
      finiteCWEulerCharacteristic X * finiteCWEulerCharacteristic Y := by
  sorry

/-- A finite covering of constant degree multiplies finite-CW Euler characteristic by that degree. -/
theorem finiteCWEulerCharacteristic_cover {E B : Type u}
    [TopologicalSpace E] [TopologicalSpace B] [T2Space E] [T2Space B]
    [CWComplex (Set.univ : Set E)] [CWComplex.Finite (Set.univ : Set E)]
    [CWComplex (Set.univ : Set B)] [CWComplex.Finite (Set.univ : Set B)]
    (p : C(E, B)) (hp : IsCoveringMap p) (d : ℕ)
    (hfinite : ∀ b : B, Finite {e : E // p e = b})
    (hcard : ∀ b : B, Nat.card {e : E // p e = b} = d) :
    finiteCWEulerCharacteristic E = d * finiteCWEulerCharacteristic B := by
  sorry

/-! ## Layer 8: Whitehead, classifying spaces and proper deformation -/

/-- A CW-type witness contains an actual Hausdorff CW model and a homotopy equivalence. -/
structure CWTypeModel (X : Type u) [TopologicalSpace X] where
  carrier : Type u
  topology : TopologicalSpace carrier
  hausdorff : @T2Space carrier topology
  cw : @CWComplex carrier topology Set.univ
  equivalence : @ContinuousMap.HomotopyEquiv X carrier _ topology

/-- Ordinary Whitehead for the specified map, including components and every basepoint. -/
theorem ordinaryWhitehead {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex (Set.univ : Set Y)] (f : C(X, Y))
    (hcomponents : Function.Bijective (ZerothHomotopy.lift
      (fun x => ZerothHomotopy.mk (f x)) (fun {_ _} p => ZerothHomotopy.sound (p.map f.continuous))))
    (hpositive : ∀ (x : X) (n : ℕ), 0 < n → Function.Bijective
      (HomotopyGroup.map f rfl : HomotopyGroup (Fin n) X x →
        HomotopyGroup (Fin n) Y (f x))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-- Whitehead transports to CW type using actual models, without a CW instance on X or Y. -/
theorem ordinaryWhitehead_cwType {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (modelX : CWTypeModel X) (modelY : CWTypeModel Y) (f : C(X, Y))
    (hcomponents : Function.Bijective (ZerothHomotopy.lift
      (fun x => ZerothHomotopy.mk (f x)) (fun {_ _} p => ZerothHomotopy.sound (p.map f.continuous))))
    (hpositive : ∀ (x : X) (n : ℕ), 0 < n → Function.Bijective
      (HomotopyGroup.map f rfl : HomotopyGroup (Fin n) X x →
        HomotopyGroup (Fin n) Y (f x))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

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

/-- Homological Whitehead for simply connected spaces with actual Hausdorff CW models. -/
theorem homologicalWhitehead_cwType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    [SimplyConnectedSpace X] [SimplyConnectedSpace Y]
    (modelX : CWTypeModel X) (modelY : CWTypeModel Y) (f : C(X, Y))
    (hf : ∀ n : ℕ, IsIso (((AlgebraicTopology.singularHomologyFunctor
      (ModuleCat.{u} ℤ) n).obj (ModuleCat.of ℤ (ULift.{u} ℤ))).map (TopCat.ofHom f))) :
    ∃ e : X ≃ₕ Y, e.toFun = f := by
  sorry

/-- A finite-CW-type witness: a Hausdorff finite CW model together with a homotopy
equivalence to it. -/
structure FiniteCWTypeModel (X : Type u) [TopologicalSpace X] extends CWTypeModel X where
  finite : letI := topology; letI := cw; CWComplex.Finite (Set.univ : Set carrier)

open scoped ContDiff Manifold in
/-- A compact Hausdorff second-countable smooth manifold without boundary (Euclidean model)
has finite CW type: GeometricTopology's smooth triangulation (Whitehead) is finite by
compactness and its realization homeomorphism is the model equivalence. -/
theorem compactManifoldFiniteCWType (n : ℕ) (M : Type u) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M] :
    Nonempty (FiniteCWTypeModel M) := by
  sorry

open scoped ContDiff Manifold in
/-- A compact Hausdorff second-countable smooth manifold with boundary (half-space model)
has finite CW type, by the same finite smooth triangulation. -/
theorem compactManifoldWithBoundaryFiniteCWType (n : ℕ) [NeZero n] (M : Type u)
    [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M] :
    Nonempty (FiniteCWTypeModel M) := by
  sorry

/-- A simply connected space of CW type whose integral singular homology vanishes in every
degree other than `0` and `n` and is `ℤ` in degree `n ≥ 2` is homotopy equivalent to the
standard sphere `Sⁿ`: Hurewicz gives a map `Sⁿ → X` inducing an isomorphism on homology
(Hatcher, Theorem 4.32, p.366) and homological Whitehead makes it a homotopy equivalence
(Hatcher, Corollary 4.33, p.367). -/
theorem simplyConnectedHomologySphere_homotopyEquiv_sphere (n : ℕ) (hn : 2 ≤ n)
    (X : Type u) [TopologicalSpace X] [SimplyConnectedSpace X] (model : CWTypeModel X)
    (hvanish : ∀ k : ℕ, k ≠ 0 → k ≠ n →
      IsZero (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) k).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of X)))
    (htop : Nonempty ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of X)) ≅ ModuleCat.of ℤ (ULift.{u} ℤ))) :
    Nonempty (X ≃ₕ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) := by
  sorry

/-- A compact Hausdorff source and a Hausdorff target of CW type have a mapping
space of CW type (Milnor, Theorem 3, p.276); the topology is compact-open. Milnor's
statement carries no separation axiom on the compact source, but the function-space
steps of its proof (continuity of evaluation, the exponential law for homotopies into
the mapping space) are available for compact Hausdorff sources; the Hausdorff
hypothesis on `X` is kept for that reason. -/
theorem finiteSourceMappingCWType {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y] [CompactSpace X] [T2Space X] [T2Space Y]
    (modelY : CWTypeModel Y) : Nonempty (CWTypeModel C(X, Y)) := by
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

/-- A proper inverse includes joint proper homotopies on `I × X` and `I × Y`.
The ordinary homotopy-equivalence carrier is native; no second homotopy type is defined. -/
def HasProperHomotopyInverse {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : Prop :=
  IsProperMap f ∧ ∃ g : C(Y, X), IsProperMap g ∧
    ∃ H : ContinuousMap.Homotopy (g.comp f) (ContinuousMap.id X),
    ∃ K : ContinuousMap.Homotopy (f.comp g) (ContinuousMap.id Y),
      IsProperMap H ∧ IsProperMap K

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

end

end TauCetiRoadmap.AlgebraicTopology
