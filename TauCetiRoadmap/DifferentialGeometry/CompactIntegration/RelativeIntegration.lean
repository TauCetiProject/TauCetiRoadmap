import TauCetiRoadmap.DifferentialGeometry.SuggestedRelative
import TauCetiRoadmap.DifferentialGeometry.CompactIntegration.Interface
import TauCetiRoadmap.AlgebraicTopology.ChartSimplexLocalImage

/-!
DG 9.3 relative formula module. The record
below carries an actual smooth relative cycle and pins its singular image to the converted compact
fundamental class. The chain-integral equality to `integralTopForm` remains a separate typed
target; it is not inferred from de Rham evaluation alone.
-/

noncomputable section
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 800000
open CategoryTheory
open scoped ContDiff Manifold

namespace TauCetiRoadmap.DifferentialGeometry.CompactIntegration

open TauCetiRoadmap.DifferentialGeometry
open TauCetiRoadmap.AlgebraicTopology

variable (q : ℕ) (M : Type) [TopologicalSpace M]
  [T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M]
  [ChartedSpace (EuclideanSpace ℝ (Fin (q + 1))) M]
  [IsManifold (EuclideanModel (q + 1)) 1 M] [IsManifold (EuclideanModel (q + 1)) ∞ M]
  [BoundarylessManifold (EuclideanModel (q + 1)) M]

/-- Native smooth-chain representative of the compact-support class. The chain is a cycle modulo
the actual open submanifold and its image in relative singular homology is exactly the converted
compact class. It is independent of the form to be integrated. -/
structure SmoothCompactFundamentalRepresentative
    (W : TopologicalSpace.Opens M)
    (K : Set M) (hK : IsCompact K) (hKW : Kᶜ = (W : Set M))
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (c : CompactFundamentalClass (q + 1) M K hK o) where
  chain : SmoothSimplex (EuclideanModel (q + 1)) M (q + 1) →₀ ℝ
  boundary : SmoothSimplex (EuclideanModel (q + 1)) W q →₀ ℝ
  boundary_identity : smoothBoundary (EuclideanModel (q + 1)) M q chain =
    (smoothChainMap (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : W => (x : M)) contMDiff_subtype_val).f q boundary
  relative_image : smoothRelativeHomologyClass (EuclideanModel (q + 1)) W (q + 1)
      (smoothRelativeCycleOfBoundary (EuclideanModel (q + 1)) W q
        chain boundary boundary_identity) =
    ((openManifoldPair W).twistedHomologyConstantIso
        (ModuleCat.of ℝ ℝ) (q + 1)).hom
      (by
        have hp : TopPair.ofSubset (X := TopCat.of M) Kᶜ = openManifoldPair W := by
          rw [hKW, openManifoldPair]
        exact hp ▸ c.realClass)

/-- Smooth relative representatives exist by the relative smoothing comparison and cycle-class
surjectivity. This target is independent of all forms and integration identities. -/
theorem smoothCompactFundamentalRepresentative_exists
    (W : TopologicalSpace.Opens M) (K : Set M) (hK : IsCompact K)
    (hKW : Kᶜ = (W : Set M))
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (c : CompactFundamentalClass (q + 1) M K hK o) :
    Nonempty (SmoothCompactFundamentalRepresentative (q := q) (M := M) W K hK hKW o c) := by
  sorry

/-- The strict interior of the full-dimensional simplex; all barycentric coordinates, including
`1-Σxᵢ`, are positive. -/
def fullSimplexInterior (m : ℕ) : Set (fullSimplex m) :=
  {t | (∀ i, 0 < (t : EuclideanSpace ℝ (Fin m)) i) ∧
    (∑ i, (t : EuclideanSpace ℝ (Fin m)) i) < 1}

/-- Geometric partition data only: a finite decomposition by compactly supported smooth forms,
open complements, and chart-simplex routes. Pairing and integration conclusions are separate
lemmas below, not fields that could be assumed by a constructed certificate. -/
structure CompactIntegrationPartition
    (W : TopologicalSpace.Opens M)
    (hK : IsCompact ((W : Set M)ᶜ))
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (c : CompactFundamentalClass (q + 1) M ((W : Set M)ᶜ) hK o)
    (α : SmoothForm (EuclideanModel (q + 1)) M ℝ (q + 1))
    (hW : mpullbackₗ (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : W => (x : M)) contMDiff_subtype_val (q + 1) α = 0) where
  n : ℕ
  part : Fin n → SmoothForm (EuclideanModel (q + 1)) M ℝ (q + 1)
  partition_sum : (∑ i, part i) = α
  part_smooth : ∀ i, IsSmoothForm (EuclideanModel (q + 1)) 0
    (part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))
  support : Fin n → Set M
  support_eq_tsupport : ∀ i,
    support i = (part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)).tsupport
  support_compact : ∀ i, IsCompact (support i)
  support_in_global : ∀ i, support i ⊆ ((W : Set M)ᶜ)
  localOpen : Fin n → TopologicalSpace.Opens M
  localOpen_eq : ∀ i, (localOpen i : Set M) = (support i)ᶜ
  global_open_in_local : ∀ i, (W : Set M) ⊆ (localOpen i : Set M)
  chart_route : ∀ i, ∃ (x : M) (w : ChartSimplexWitness (q + 1) M x)
      (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
      (ho : Quotient.mk _ l = o)
      (route : ChartSimplexIntegrationRoute (q + 1) M x w l),
    (part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)).tsupport ⊆
      Set.range route.simplex.1 ∧
    support i ⊆ Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1)
  part_vanishes_local : ∀ i,
    mpullbackₗ (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : localOpen i => (x : M)) contMDiff_subtype_val (q + 1) (part i) = 0
  part_vanishes_global : ∀ i,
    mpullbackₗ (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : W => (x : M)) contMDiff_subtype_val (q + 1) (part i) = 0

/-- The partition's open complement has exactly the declared compact support. -/
theorem localOpen_compl_eq_support
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :
    ((P.localOpen i : Set M)ᶜ) = P.support i := by
  ext x
  change x ∉ (P.localOpen i : Set M) ↔ x ∈ P.support i
  rw [P.localOpen_eq i]
  simp

/-- The piece class is AT6.3's existing orientation-selected compact-support datum on the
actual complement of the local open. -/
noncomputable def pieceCompactClass
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :=
  orientedCompactClass (q + 1) M (P.support i) (P.support_compact i) o

/-- P3: enlarge from the piece support to the global support. The pair map is
`(M,M\global) → (M,M\piece)`, so it carries the global class to the piece class. -/
theorem compactIntegrationPartition_P3_integral
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :
    (constantSystemHomologyMap
      (supportEnlargementMap (M := TopCat.of M) (P.support i) ((W : Set M)ᶜ)
        (P.support_in_global i)) (ModuleCat.of ℤ ℤ) (q + 1)).hom c.integralClass =
      (pieceCompactClass q M P i).fundamentalClass := by
  exact compactFundamentalClass_enlarge (q + 1) M (P.support i) ((W : Set M)ᶜ)
    (P.support_compact i) hK (P.support_in_global i) o (pieceCompactClass q M P i) c

theorem compactIntegrationPartition_P3_real
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :
    (constantSystemHomologyMap
      (supportEnlargementMap (M := TopCat.of M) (P.support i) ((W : Set M)ᶜ)
        (P.support_in_global i)) (ModuleCat.of ℝ ℝ) (q + 1)).hom c.realClass =
      (CompactFundamentalClass.realClass (hK := P.support_compact i) (c := pieceCompactClass q M P i)) := by
  exact compactFundamentalClass_real_enlarge (q + 1) M (P.support i) ((W : Set M)ᶜ)
    (P.support_compact i) hK (P.support_in_global i) o (pieceCompactClass q M P i) c

/-- Zero forms integrate to zero on every finite smooth chain. This is the single
chain-linearity target used by both relative-evaluation steps below. -/
theorem chainIntegral_zero_form
    {E H M : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I 1 M]
    (n : ℕ) (c : SmoothSimplex I M n →₀ ℝ) :
    chainIntegral (I := I) (M := M) (p := n) c
      ((0 : SmoothForm I M ℝ n) : RoughForm I M ℝ n) = 0 := by
  exact TauCetiRoadmap.DifferentialGeometry.chainIntegral_zero c

/-- Typed pullback-vanishing adapter for the β=0 evaluation formula. This is proved from the
partition certificate's local vanishing field and keeps the degree-q zero-form hypothesis explicit. -/
theorem compactIntegrationPartition_piece_hβ
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :
    mpullbackₗ (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : P.localOpen i => (x : M)) contMDiff_subtype_val (q + 1) (P.part i) =
    mextDerivₗ (EuclideanModel (q + 1)) (P.localOpen i) q 0 := by
  simpa using P.part_vanishes_local i

/-- P4a: apply the positive-degree relative evaluation theorem with β=0 to the smooth relative
representative of the AT-selected support class. This isolates the de Rham/Kronecker step from
local chart normalization and change of variables. -/
theorem compactIntegrationPartition_P4_relative_evaluation
    (P : CompactIntegrationPartition q M W hK o c α hW)
    (i : Fin P.n)
    (hKi : IsCompact ((P.localOpen i : Set M)ᶜ))
    (r : SmoothCompactFundamentalRepresentative (q := q) (M := M)
      (P.localOpen i) (P.support i) (P.support_compact i)
      (by exact (P.localOpen_eq i).symm) o (pieceCompactClass q M P i)) :
    relativeKronecker (P.localOpen i) (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
          (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i)) (P.part_vanishes_local i)))
      (((openManifoldPair (P.localOpen i)).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (P.support i)ᶜ =
              openManifoldPair (P.localOpen i) := by
            simpa [openManifoldPair, P.localOpen_eq i]
          exact hp ▸ (CompactFundamentalClass.realClass (hK := P.support_compact i) (c := pieceCompactClass q M P i)))) =
      chainIntegral r.chain (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) := by
  rw [relativeDeRhamClassOfVanishing_succ]
  rw [← r.relative_image]
  have hβ := compactIntegrationPartition_piece_hβ q M P i
  have hEval := relativeDeRhamHom_eval_pair (EuclideanModel (q + 1))
    (P.localOpen i) q (P.part i) 0 (euclideanTopForm_closed (q + 1) M (P.part i)) hβ
    r.chain r.boundary r.boundary_identity
  have hzero := chainIntegral_zero_form (I := EuclideanModel (q + 1))
    (M := P.localOpen i) q r.boundary
  rw [hzero] at hEval
  simpa [relativeDeRhamPairClass] using hEval

/-- Every face of this exact route avoids the compact support. This is the geometric consequence
of strict-interior support: every simplex face has at least one zero barycentric coordinate, so it
cannot meet the range of `fullSimplexInterior`. -/
theorem compactRepresentative_route_faces_in_localOpen
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (x : M) (w : ChartSimplexWitness (q + 1) M x)
    (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (route : ChartSimplexIntegrationRoute (q + 1) M x w l)
    (hsupport : P.support i ⊆
      Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1)) :
    ∀ j : Fin (q + 2), Set.range (route.simplex.face j).1 ⊆ (P.localOpen i : Set M) := by
  have hdisj (j : Fin (q + 2)) :
      Disjoint (Set.range (route.simplex.face j).1)
        (Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1)) := by
    rw [Set.disjoint_left]
    intro y hyFace hyInterior
    rcases hyFace with ⟨t, ht⟩
    rcases hyInterior with ⟨u, hu⟩
    have hparam : simplexFace q j t = u.1 := route.simplex_injective (by
      calc
        route.simplex.1 (simplexFace q j t) = (route.simplex.face j).1 t := rfl
        _ = y := ht
        _ = route.simplex.1 u.1 := hu.symm)
    have hzero := fullSimplexEquivStdSimplex_simplexFace_self j t
    rw [hparam] at hzero
    have hpositive : 0 < (fullSimplexEquivStdSimplex (q + 1) u.1).weights j := by
      cases j using Fin.cases with
      | zero =>
          rw [fullSimplexEquivStdSimplex_weights_zero]
          exact sub_pos.mpr u.2.2
      | succ k =>
          rw [fullSimplexEquivStdSimplex_weights_succ]
          exact u.2.1 k
    rw [hzero] at hpositive
    norm_num at hpositive
  intro j y hy
  rw [P.localOpen_eq i]
  simp only [Set.mem_compl_iff]
  intro hySupport
  obtain ⟨t, ht⟩ := hsupport hySupport
  exact (Set.disjoint_left.mp (hdisj j)) hy ⟨t, ht⟩

/-- Every support point has a unique strict-interior parameter under the selected route.
Existence is the certificate's interior-support containment; uniqueness uses the route's actual
injectivity field. -/
theorem compactRepresentative_route_recenter_unique
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (x : M) (w : ChartSimplexWitness (q + 1) M x)
    (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (route : ChartSimplexIntegrationRoute (q + 1) M x w l)
    (hsupport : P.support i ⊆
      Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1))
    (y : M) (hy : y ∈ P.support i) :
    ∃! t : fullSimplexInterior (q + 1), route.simplex.1 t.1 = y := by
  obtain ⟨t, ht⟩ := hsupport hy
  refine ⟨t, ht, ?_⟩
  intro t' ht'
  apply Subtype.ext
  apply route.simplex_injective
  exact ht'.trans ht.symm

/-- Once every route face is known to land in the open subtype, the finite face sum factors
through the actual smooth-chain map of that subtype. This algebraic factorization is a separate
target from the strict-interior geometric exclusion above. -/
theorem compactRepresentative_route_boundary_factor
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (x : M) (w : ChartSimplexWitness (q + 1) M x)
    (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (route : ChartSimplexIntegrationRoute (q + 1) M x w l)
    (hfaces : ∀ j : Fin (q + 2),
      Set.range (route.simplex.face j).1 ⊆ (P.localOpen i : Set M)) :
    ∃ b : SmoothSimplex (EuclideanModel (q + 1)) (P.localOpen i) q →₀ ℝ,
      smoothBoundary (EuclideanModel (q + 1)) M q
          (Finsupp.single route.simplex (1 : ℝ)) =
        (smoothChainMap (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
          (f := fun y : P.localOpen i => (y : M)) contMDiff_subtype_val).f q b := by
  sorry

/-- The complement pair has no subspace point over K. -/
theorem supportComplement_not_subspace
    (W : TopologicalSpace.Opens M) (K : Set M) (hKW : (W : Set M)ᶜ = K)
    (y : M) (hy : y ∈ K) :
    y ∉ Set.range ((openManifoldPair W).map : (openManifoldPair W).snd → M) := by
  intro h
  rcases h with ⟨u, hu⟩
  have huK : (openManifoldPair W).map u ∈ K := hu ▸ hy
  change u.val ∈ K at huK
  have huNotW : u.val ∉ (W : Set M) := by
    intro huW
    have huComp : u.val ∈ (W : Set M)ᶜ := hKW.symm ▸ huK
    exact huComp huW
  exact huNotW u.property

/-- The actual singular relative-local restriction in the ordinary real chain carrier. Its source
and target are the native open-pair and punctured-pair homologies. -/
noncomputable def smoothRelativeLocalMap
    (W : TopologicalSpace.Opens M) (K : Set M) (hKW : (W : Set M)ᶜ = K)
    (n : ℕ) (y : M) (hy : y ∈ K) :
    (((openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ)).homology n) →ₗ[ℝ]
      ((puncturedPair (TopCat.of M) y).singularChainComplex (ModuleCat.of ℝ ℝ)).homology n :=
  (TopPair.singularHomologyMap (C := ModuleCat.{0} ℝ)
    (relativeLocalPairMap (openManifoldPair W) y
      (supportComplement_not_subspace M W K hKW y hy)) (ModuleCat.of ℝ ℝ) n).hom

/-- The smooth-to-AT comparison is the inverse of AT's actual constant-system homology
isomorphism. This is a carrier adapter, not a second homology construction. -/
noncomputable def smoothRelativeToAT
    (W : TopologicalSpace.Opens M) (n : ℕ) :
    (((openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ)).homology n) →ₗ[ℝ]
      (twistedRelativeHomology ℝ (openManifoldPair W) (ConstantRealSystem M) n) :=
  (((openManifoldPair W).twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) n).inv).hom

/-- Locality of the constant-system adapter is an explicit comparison target. It identifies the
ordinary singular restriction above with AT's twisted support-local map after using the actual
constant-system isomorphism on the punctured pair. -/
theorem smoothRelativeToAT_local_naturality
    (W : TopologicalSpace.Opens M) (K : Set M) (hKW : (W : Set M)ᶜ = K)
    (n : ℕ) (y : M) (hy : y ∈ K)
    (z : (((openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ)).homology n)) :
    smoothRelativeLocalMap M W K hKW n y hy z =
      ((puncturedPair (TopCat.of M) y).twistedHomologyConstantIso
        (ModuleCat.of ℝ ℝ) n).hom
        ((twistedRelativeLocalMap ℝ (openManifoldPair W) (ConstantRealSystem M) n y
          (supportComplement_not_subspace M W K hKW y hy)).hom
          (smoothRelativeToAT M W n z)) := by
  sorry

/-- In the actual top degree `m = dim M`, AT6.3's uniqueness theorem implies injectivity of
the support-local maps. The zero section is locally represented by the zero class on each open
neighborhood, so a class whose every support-local image is zero must be that unique class.
There is deliberately no all-degrees version: local homology outside top degree does not classify
arbitrary relative homology classes. -/
theorem twistedSupportClass_eq_of_all_local_images_topDegree
    (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (K : Set M) (hK : IsCompact K)
    (z z' : twistedRelativeHomology ℝ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
      (ConstantRealSystem M) m)
    (hloc : ∀ y : M, ∀ hy : y ∈ K,
      (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m K y hy).hom z =
      (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m K y hy).hom z') :
    z = z' := by
  let V : Set (TopCat.of M) := Set.univ
  let s : LocallyRepresentedTopSection ℝ (TopCat.of M) (ConstantRealSystem M) m V := {
    localValue := fun _ _ => 0
    locally_represented := by
      intro x hx
      refine ⟨Set.univ, Set.subset_univ _, isOpen_univ, Set.mem_univ x, 0, ?_⟩
      intro y hy
      simp [twistedSupportLocalMap]
  }
  obtain ⟨c, hc, huniq⟩ := compactSupportTopClass_existsUnique ℝ m M
    (ConstantRealSystem M) K Set.univ hK isOpen_univ (Set.subset_univ K) s
  have hd : z - z' = c := by
    apply huniq (z - z')
    intro y hy
    have hlocalZero :
        (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M)
          m K y hy).hom (z - z') = 0 := by
      rw [map_sub, hloc y hy]
      simp
    simpa [s] using hlocalZero
  have hzero : (0 : twistedRelativeHomology ℝ
      (TopPair.ofSubset (X := TopCat.of M) Kᶜ) (ConstantRealSystem M) m) = c := by
    apply huniq 0
    intro y hy
    simp [s]
  have hdiff : z - z' = 0 := hd.trans hzero.symm
  exact sub_eq_zero.mp hdiff

/-- The canonical comparison from an open subspace pair to the pair for its double
complement. The ambient map is the identity and the subspace map is the induced subtype map. -/
noncomputable def openComplementPairIso
    (M : Type) [TopologicalSpace M] (W : TopologicalSpace.Opens M) :
    openManifoldPair W ≅ TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) := by
  let P := openManifoldPair W
  let K : Set M := (W : Set M)ᶜ
  have hcc : Kᶜ = (W : Set M) := compl_compl (W : Set M)
  let f : P ⟶ TopPair.ofSubset (X := TopCat.of M) Kᶜ :=
    TopPair.ofSubsetMap (𝟙 (TopCat.of M)) (by
      intro x hx
      rw [hcc]
      exact hx)
  have hfst : TopPair.Hom.fst f = 𝟙 (TopCat.of M) := by
    apply TopCat.ext
    intro x
    change (𝟙 (TopCat.of M)) x = (𝟙 (TopCat.of M)) x
    rfl
  have hf : IsIso f := by
    letI : IsIso (TopPair.Hom.fst f) := by
      rw [hfst]
      exact ⟨𝟙 _, by cat_disch, by cat_disch⟩
    apply TopPair.isIso_of_isIso_fst_of_surjective_snd
    intro y
    exact ⟨⟨y.1, hcc ▸ y.2⟩, rfl⟩
  exact asIso f

/-- Exact local square required to apply the compact-support uniqueness theorem after the
`W = (Wᶜ)ᶜ` pair-carrier conversion. This records the coefficient pullback along the identity
pair map instead of silently identifying it with the constant system. -/
theorem openComplementPair_supportLocalMap_naturality
    (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [SigmaCompactSpace M]
    (W : TopologicalSpace.Opens M)
    (y : M) (hy : y ∈ (W : Set M)ᶜ)
    (u : twistedRelativeHomology ℝ (openManifoldPair W) (ConstantRealSystem M) m) :
    (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m
      ((W : Set M)ᶜ) y hy).hom
        ((constantSystemHomologyMap (openComplementPairIso M W).hom
          (ModuleCat.of ℝ ℝ) m).hom u) =
      (twistedRelativeLocalMap ℝ (openManifoldPair W) (ConstantRealSystem M) m y
        (supportComplement_not_subspace M W ((W : Set M)ᶜ) rfl y hy)).hom u := by
  sorry

/-- Pair-isomorphism invariance for relative twisted homology with its induced coefficient
pullback. This exact injectivity target is consumed by the smooth-to-AT top-degree proof below. -/
theorem twistedHomologyMap_injective_of_pairIso
    {P Q : TopPair} (e : P ≅ Q) (R : Type) [CommRing R]
    (L : LocalCoefficientSystem R Q.fst) (m : ℕ) :
    Function.Injective ((TopPair.twistedHomologyMap e.hom L m).hom) := by
  sorry

/-- Smooth relative-class injectivity is stated only in the dimension-matched top degree. The
smooth-to-AT local comparison is a separate explicit square above; this interface does not claim
an all-degrees classification by local homology. -/
theorem smoothRelativeClass_eq_of_all_local_images_via_AT_compact_uniqueness
    (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M]
    [SigmaCompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))) ∞ M]
    (W : TopologicalSpace.Opens M) (K : Set M) (hKW : (W : Set M)ᶜ = K)
    (hK : IsCompact K)
    (z z' : (((openManifoldPair W).singularChainComplex (ModuleCat.of ℝ ℝ)).homology m))
    (hloc : ∀ y : M, ∀ hy : y ∈ K,
      smoothRelativeLocalMap M W K hKW m y hy z =
      smoothRelativeLocalMap M W K hKW m y hy z') : z = z' := by
  cases hKW
  let P := openManifoldPair W
  let K' : Set M := (W : Set M)ᶜ
  let e := openComplementPairIso M W
  let f := e.hom
  let eP := P.twistedHomologyConstantIso (ModuleCat.of ℝ ℝ) m
  let zAT := smoothRelativeToAT (M := M) W m z
  let z'AT := smoothRelativeToAT (M := M) W m z'
  let push := (constantSystemHomologyMap f (ModuleCat.of ℝ ℝ) m).hom
  have hmap_local (u : twistedRelativeHomology ℝ P (ConstantRealSystem M) m)
      (y : M) (hy : y ∈ K') :
      (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m K' y hy).hom
        (push u) =
      (twistedRelativeLocalMap ℝ P (ConstantRealSystem M) m y
        (supportComplement_not_subspace M W K' rfl y hy)).hom u := by
    simpa [f, e, K'] using openComplementPair_supportLocalMap_naturality m M W y hy u
  have htw : ∀ y : M, ∀ hy : y ∈ (W : Set M)ᶜ,
      (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m (W : Set M)ᶜ y hy).hom
        (push zAT) =
      (twistedSupportLocalMap ℝ (TopCat.of M) (ConstantRealSystem M) m (W : Set M)ᶜ y hy).hom
        (push z'AT) := by
    intro y hy
    have h := hloc y hy
    rw [smoothRelativeToAT_local_naturality (M := M) W (W : Set M)ᶜ rfl m y hy z,
      smoothRelativeToAT_local_naturality (M := M) W (W : Set M)ᶜ rfl m y hy z'] at h
    let eQ := (puncturedPair (TopCat.of M) y).twistedHomologyConstantIso
      (ModuleCat.of ℝ ℝ) m
    have ha := hmap_local zAT y hy
    have hb := hmap_local z'AT y hy
    rw [ha, hb]
    calc
      _ = eQ.inv.hom (eQ.hom.hom
          ((twistedRelativeLocalMap ℝ P (ConstantRealSystem M) m y
            (supportComplement_not_subspace M W K' rfl y hy)).hom zAT)) := by
            exact (Iso.hom_inv_id_apply eQ _).symm
      _ = eQ.inv.hom (eQ.hom.hom
          ((twistedRelativeLocalMap ℝ P (ConstantRealSystem M) m y
            (supportComplement_not_subspace M W K' rfl y hy)).hom z'AT)) := by
            exact congrArg eQ.inv.hom h
      _ = _ := by exact Iso.hom_inv_id_apply eQ _
  have hat : push zAT = push z'AT := by
    apply twistedSupportClass_eq_of_all_local_images_topDegree m M (W : Set M)ᶜ hK
    intro y hy
    exact htw y hy
  have hpush_injective : Function.Injective push := by
    let coeffIso := TauCeti.LocalCoefficientSystem.pullbackConstantIso
      (TopPair.Hom.fst f).hom (ModuleCat.of ℝ ℝ)
    have hcoeff : Function.Injective
        (P.twistedHomologyCoefficientMap coeffIso.inv m).hom := by
      have hcomp : P.twistedHomologyCoefficientMap coeffIso.inv m ≫
          P.twistedHomologyCoefficientMap coeffIso.hom m = 𝟙 _ := by
        rw [← P.twistedHomologyCoefficientMap_comp
          ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).obj
            (ModuleCat.of ℝ ℝ)) coeffIso.inv coeffIso.hom m]
        simp
        rfl
      intro a b hab
      have ha : (P.twistedHomologyCoefficientMap coeffIso.hom m).hom
          ((P.twistedHomologyCoefficientMap coeffIso.inv m).hom a) = a := by
        have h := congrArg (fun g => g.hom a) hcomp
        simpa using h
      have hb : (P.twistedHomologyCoefficientMap coeffIso.hom m).hom
          ((P.twistedHomologyCoefficientMap coeffIso.inv m).hom b) = b := by
        have h := congrArg (fun g => g.hom b) hcomp
        simpa using h
      exact ha.symm.trans ((congrArg (P.twistedHomologyCoefficientMap coeffIso.hom m).hom hab).trans hb)
    have hpair := twistedHomologyMap_injective_of_pairIso e (R := ℝ)
      (ConstantRealSystem M) m
    intro a b hab
    apply hcoeff
    apply hpair
    exact hab
  have hat' : zAT = z'AT := hpush_injective hat
  have hAT : smoothRelativeToAT (M := M) W m z = smoothRelativeToAT (M := M) W m z' := by
    simpa [zAT, z'AT] using hat'
  change eP.inv.hom z = eP.inv.hom z' at hAT
  have h := congrArg eP.hom.hom hAT
  exact (Iso.inv_hom_id_apply eP z).symm.trans h |>.trans (Iso.inv_hom_id_apply eP z')

/-- At every point of the compact support, the route simplex has the signed AT point-generator
image. The statement includes the actual integer-to-real coefficient map before the constant
system comparison; no integer class is silently identified with a real class. -/
theorem compactRepresentative_route_local_image
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (x : M) (w : ChartSimplexWitness (q + 1) M x)
    (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (ho : Quotient.mk _ l = o)
    (route : ChartSimplexIntegrationRoute (q + 1) M x w l)
    (b : SmoothSimplex (EuclideanModel (q + 1)) (P.localOpen i) q →₀ ℝ)
    (hb : smoothBoundary (EuclideanModel (q + 1)) M q
          (Finsupp.single route.simplex (1 : ℝ)) =
        (smoothChainMap (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
          (f := fun y : P.localOpen i => (y : M)) contMDiff_subtype_val).f q b)
    (hsupport : P.support i ⊆
      Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1)) :
    ∀ (y : M) (hy : y ∈ P.support i),
      smoothRelativeLocalMap M (P.localOpen i) (P.support i)
        (by rw [P.localOpen_eq i]; simp) (q + 1) y hy
        ((((modelOrientationSign (q + 1) l *
          (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x⟩ : ℤ) : ℤ) : ℝ) •
          smoothRelativeHomologyClass (EuclideanModel (q + 1))
          (P.localOpen i) (q + 1)
          (smoothRelativeCycleOfBoundary (EuclideanModel (q + 1)) (P.localOpen i) q
            (Finsupp.single route.simplex 1) b hb))) =
      (restrictedConstantHomologyIso (puncturedPair (TopCat.of M) y) (q + 1)).hom
        (integerToRealLocalHomologyMap (q + 1) M y
          (orientedLocalGenerator (q + 1) M o y)) := by
  have hpositive : P.support i ⊆
      TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplexInteriorImage
        (q + 1) M x x (mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x) w := by
    intro z hz
    rcases hsupport hz with ⟨t, ht⟩
    -- Convert strict positivity in `fullSimplexInterior` to positive barycentric weights.
    sorry
  have hchart : ∀ z : M, z ∈ P.support i →
      z ∈ (chartAt (EuclideanSpace ℝ (Fin (q + 1))) x).source := by
    intro z hz
    exact TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplexInteriorImage_subset_chartSource
        (q + 1) M x x
        (mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x) w (hpositive hz)
  intro y hy
  have hychart := hchart y hy
  let wy := Classical.choice
    (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplex_exists
      (q + 1) M x y hychart)
  have hAT := TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplexSupportClass_signed_local_image_pointGenerator
      (q + 1) M o l ho x x
      (mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x) w
      (P.support i) hpositive y hy hychart wy
  have hDGComparison
      (hAT : (twistedSupportLocalMap ℤ (TopCat.of M)
          (TauCetiRoadmap.AlgebraicTopology.OrientationComparison.IntegralSystem M)
          (q + 1) (P.support i) y hy).hom
          ((TauCetiRoadmap.AlgebraicTopology.OrientationComparison.rawChartCoefficient_at
            (q + 1) M l x x
            (mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x) : ℤ) •
            TauCetiRoadmap.AlgebraicTopology.OrientationComparison.chartSimplexSupportClass
              (q + 1) M x x
              (mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x) w
              (P.support i) hpositive) =
          TauCetiRoadmap.AlgebraicTopology.OrientationComparison.pointGenerator
            (q + 1) M o y) :
      smoothRelativeLocalMap M (P.localOpen i) (P.support i)
        (by rw [P.localOpen_eq i]; simp) (q + 1) y hy
        ((((modelOrientationSign (q + 1) l *
          (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x⟩ : ℤ) : ℤ) : ℝ) •
          smoothRelativeHomologyClass (EuclideanModel (q + 1))
          (P.localOpen i) (q + 1)
          (smoothRelativeCycleOfBoundary (EuclideanModel (q + 1)) (P.localOpen i) q
            (Finsupp.single route.simplex 1) b hb))) =
      (restrictedConstantHomologyIso (puncturedPair (TopCat.of M) y) (q + 1)).hom
        (integerToRealLocalHomologyMap (q + 1) M y
          (orientedLocalGenerator (q + 1) M o y)) := by
    -- AT has already proved the chart/tangent normalization as a point-generator statement.
    -- This remaining comparison is the smooth-relative/singular map and integer-to-real
    -- coefficient transport into DG's chosen local-generator carrier.
    sorry
  exact hDGComparison hAT

/-- The representative has the point-generator local image because its singular image is the
AT-selected compact class (`r.relative_image`), transported through the same constant-system
and real-coefficient maps. This is kept separate from the chart-simplex local normalization. -/
theorem compactRepresentative_representative_local_image
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (r : SmoothCompactFundamentalRepresentative (q := q) (M := M)
      (P.localOpen i) (P.support i) (P.support_compact i)
      (P.localOpen_eq i).symm o (pieceCompactClass q M P i)) :
    ∀ (y : M) (hy : y ∈ P.support i),
      smoothRelativeLocalMap M (P.localOpen i) (P.support i)
        (by rw [P.localOpen_eq i]; simp) (q + 1) y hy
        (smoothRelativeHomologyClass (EuclideanModel (q + 1))
          (P.localOpen i) (q + 1)
          (smoothRelativeCycleOfBoundary (EuclideanModel (q + 1)) (P.localOpen i) q
            r.chain r.boundary r.boundary_identity)) =
      (restrictedConstantHomologyIso (puncturedPair (TopCat.of M) y) (q + 1)).hom
        (integerToRealLocalHomologyMap (q + 1) M y
          (orientedLocalGenerator (q + 1) M o y)) := by
  sorry

/-- The final class equality is now derived by the separate route-local formula, representative
local formula, and compact-support local-image injectivity target. -/
theorem compactRepresentative_chart_simplex_relative_class
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (x : M) (w : ChartSimplexWitness (q + 1) M x)
    (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (ho : Quotient.mk _ l = o)
    (route : ChartSimplexIntegrationRoute (q + 1) M x w l)
    (hsupport : P.support i ⊆
      Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1))
    (r : SmoothCompactFundamentalRepresentative (q := q) (M := M)
      (P.localOpen i) (P.support i) (P.support_compact i)
      (P.localOpen_eq i).symm o (pieceCompactClass q M P i)) :
    ∃ b : SmoothSimplex (EuclideanModel (q + 1)) (P.localOpen i) q →₀ ℝ,
      ∃ hb : smoothBoundary (EuclideanModel (q + 1)) M q
          (Finsupp.single route.simplex (1 : ℝ)) =
        (smoothChainMap (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
          (f := fun y : P.localOpen i => (y : M)) contMDiff_subtype_val).f q b,
      smoothRelativeHomologyClass (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
        (smoothRelativeCycleOfBoundary (EuclideanModel (q + 1)) (P.localOpen i) q
          r.chain r.boundary r.boundary_identity) =
      (((modelOrientationSign (q + 1) l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x⟩ : ℤ) : ℤ) : ℝ) •
        smoothRelativeHomologyClass (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
          (smoothRelativeCycleOfBoundary (EuclideanModel (q + 1)) (P.localOpen i) q
            (Finsupp.single route.simplex 1) b hb)) := by
  have hfaces := compactRepresentative_route_faces_in_localOpen q M P i x w l route hsupport
  obtain ⟨b, hb⟩ := compactRepresentative_route_boundary_factor q M P i x w l route hfaces
  refine ⟨b, hb, ?_⟩
  apply smoothRelativeClass_eq_of_all_local_images_via_AT_compact_uniqueness
    (q + 1) M (P.localOpen i) (P.support i)
    (by rw [P.localOpen_eq i]; simp) (P.support_compact i)
  intro y hy
  exact (compactRepresentative_representative_local_image q M P i r y hy).trans
    (compactRepresentative_route_local_image q M P i x w l ho route b hb hsupport y hy).symm

/-- P4's remaining class comparison is evaluated using the actual relative de Rham/Kronecker
law. Once the relative smooth-cycle class above is identified, the two β=0 evaluation equations
give the chain-integral identity; no independent pairing assertion is admitted here. -/
theorem compactRepresentative_chart_pairing
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n)
    (x : M) (w : ChartSimplexWitness (q + 1) M x)
    (l : OrientationLift (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (ho : Quotient.mk _ l = o)
    (route : ChartSimplexIntegrationRoute (q + 1) M x w l)
    (hsupport : P.support i ⊆
      Set.range (fun t : fullSimplexInterior (q + 1) => route.simplex.1 t.1))
    (hKi : IsCompact ((P.localOpen i : Set M)ᶜ))
    (r : SmoothCompactFundamentalRepresentative (q := q) (M := M)
      (P.localOpen i) (P.support i) (P.support_compact i)
      (P.localOpen_eq i).symm o (pieceCompactClass q M P i)) :
    chainIntegral r.chain (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) =
      ((modelOrientationSign (q + 1) l *
        ((l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x⟩ : ℤ) : ℝ)) *
        chainIntegral (Finsupp.single route.simplex 1)
          (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))) := by
  obtain ⟨b, hb, hclass⟩ := compactRepresentative_chart_simplex_relative_class
    q M P i x w l ho route hsupport r
  have hr := compactIntegrationPartition_P4_relative_evaluation q M P i hKi r
  rw [← r.relative_image] at hr
  have hβ := compactIntegrationPartition_piece_hβ q M P i
  have hs := relativeDeRhamHom_eval_pair (EuclideanModel (q + 1))
    (P.localOpen i) q (P.part i) 0
    (euclideanTopForm_closed (q + 1) M (P.part i)) hβ
    (Finsupp.single route.simplex (1 : ℝ)) b hb
  have hzero := chainIntegral_zero_form (I := EuclideanModel (q + 1))
    (M := P.localOpen i) q b
  rw [hzero] at hs
  -- The remaining transformations are linearity of the native Kronecker map and the two
  -- evaluation equations. They are kept as the proof steps rather than a second admitted theorem.
  rw [relativeDeRhamClassOfVanishing_succ] at hr
  simp at hs
  rw [hclass] at hr
  rw [map_smul] at hr
  rw [hs] at hr
  simpa [mul_comm] using hr.symm

/-- P4b applies the route's one-chart change-of-variables law after the relative representative
has been compared with the chart simplex. Thus the proof pipeline explicitly uses the chosen
support chart, its strict-interior support, and its orientation-matched one-chart integral. -/
theorem compactIntegrationPartition_P4_chart_integral
    (P : CompactIntegrationPartition q M W hK o c α hW)
    (i : Fin P.n)
    (hKi : IsCompact ((P.localOpen i : Set M)ᶜ))
    (r : SmoothCompactFundamentalRepresentative (q := q) (M := M)
      (P.localOpen i) (P.support i) (P.support_compact i)
      (P.localOpen_eq i).symm o (pieceCompactClass q M P i)) :
    chainIntegral r.chain (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) =
      integralTopForm o (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) := by
  rcases P.chart_route i with ⟨x, w, l, ho, route, htsupp, hinside⟩
  have hcompact : IsCompact (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)).tsupport := by
    rw [← P.support_eq_tsupport i]
    exact P.support_compact i
  have hroute := route.oneChartIntegral (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))
    (P.part_smooth i) hcompact htsupp
  have horient : integralTopForm o (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) =
      integralTopForm (Quotient.mk _ l)
        (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :=
    (congrArg (fun oo => integralTopForm oo
      (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))) ho).symm
  calc
    _ = ((modelOrientationSign (q + 1) l *
        ((l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin (q + 1))) x⟩ : ℤ) : ℝ)) *
        chainIntegral (Finsupp.single route.simplex 1)
          (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))) :=
      compactRepresentative_chart_pairing q M P i x w l ho route hinside hKi r
    _ = integralTopForm o (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :=
      hroute.symm.trans horient

/-- P4 is now composed from relative evaluation at β=0 and the separately stated
chart-class/one-chart integral target. -/
theorem compactIntegrationPartition_P4_local_chart_evaluation
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :
    relativeKronecker (P.localOpen i) (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
          (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i)) (P.part_vanishes_local i)))
      (((openManifoldPair (P.localOpen i)).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (P.support i)ᶜ =
              openManifoldPair (P.localOpen i) := by
            simpa [openManifoldPair, P.localOpen_eq i]
          exact hp ▸ (CompactFundamentalClass.realClass (hK := P.support_compact i) (c := pieceCompactClass q M P i)))) =
      integralTopForm o (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) := by
  have hKi : IsCompact ((P.localOpen i : Set M)ᶜ) := by
    simpa [P.localOpen_eq i] using P.support_compact i
  obtain ⟨r⟩ := smoothCompactFundamentalRepresentative_exists
    (q := q) (M := M) (P.localOpen i) (P.support i) (P.support_compact i)
    (by exact (P.localOpen_eq i).symm) o (pieceCompactClass q M P i)
  exact (compactIntegrationPartition_P4_relative_evaluation q M P i hKi r).trans
    (compactIntegrationPartition_P4_chart_integral q M P i hKi r)

/-- P5: naturality of the relative pairing for the support-enlargement pair map. -/
theorem compactIntegrationPartition_P5_naturality
    (P : CompactIntegrationPartition q M W hK o c α hW) (i : Fin P.n) :
    relativeKronecker W (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) W (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) W (q + 1)
          (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i)) (P.part_vanishes_global i)))
      (((openManifoldPair W).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
              openManifoldPair W := by simp [openManifoldPair]
          exact hp ▸ c.realClass)) =
    relativeKronecker (P.localOpen i) (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
          (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i)) (P.part_vanishes_local i)))
      (((openManifoldPair (P.localOpen i)).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (P.support i)ᶜ =
              openManifoldPair (P.localOpen i) := by
            simpa [openManifoldPair, P.localOpen_eq i]
          exact hp ▸ (CompactFundamentalClass.realClass (hK := P.support_compact i) (c := pieceCompactClass q M P i)))) := by
  sorry

/-- P6: linearity of the actual relative Kronecker pairing. -/
theorem compactIntegrationPartition_P6_additivity
    (P : CompactIntegrationPartition q M W hK o c α hW) :
    relativeKronecker W (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) W (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) W (q + 1)
          α (euclideanTopForm_closed (q + 1) M α) hW))
      (((openManifoldPair W).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
              openManifoldPair W := by simp [openManifoldPair]
          exact hp ▸ c.realClass)) =
    ∑ i, relativeKronecker W (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) W (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) W (q + 1)
          (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i)) (P.part_vanishes_global i)))
      (((openManifoldPair W).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
              openManifoldPair W := by simp [openManifoldPair]
          exact hp ▸ c.realClass)) := by
  sorry

/-- Integration is linear on the compactly supported smooth-form submodule. The additive law is
DG 5.2's `integralTopForm_add`; compact support and smoothness are supplied by the submodule
carrier, rather than by a choice of fundamental-chain representatives. -/
noncomputable def compactlySupportedIntegralLinear
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1))) :
    compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1) →ₗ[ℝ] ℝ where
  toFun φ := integralTopForm o (φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))
  map_add' := by
    intro φ ψ
    have hφinf : IsSmoothForm (EuclideanModel (q + 1)) ∞
        (φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :=
      (mem_smoothForms (I := EuclideanModel (q + 1)) (M := M) (F := ℝ)
        (k := q + 1)).mp φ.val.property
    have hψinf : IsSmoothForm (EuclideanModel (q + 1)) ∞
        (ψ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :=
      (mem_smoothForms (I := EuclideanModel (q + 1)) (M := M) (F := ℝ)
        (k := q + 1)).mp ψ.val.property
    have hφ0 : IsSmoothForm (EuclideanModel (q + 1)) 0
        (φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :=
      hφinf.of_le (by simp)
    have hψ0 : IsSmoothForm (EuclideanModel (q + 1)) 0
        (ψ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) :=
      hψinf.of_le (by simp)
    have hφc : IsCompact
        (φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)).tsupport :=
      (mem_compactlySupportedForms.mp φ.property)
    have hψc : IsCompact
        (ψ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)).tsupport :=
      (mem_compactlySupportedForms.mp ψ.property)
    change integralTopForm o
        ((φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) +
          (ψ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))) = _
    exact integralTopForm_add o hφ0 hψ0 hφc hψc
  map_smul' := by
    intro c φ
    change integralTopForm o
        (c • (φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))) = _
    simpa using integralTopForm_smul o c
      (φ.val : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1))

/-- P7: finite additivity of integration for the smooth partition decomposition. The proof uses
only the finite partition identity and linearity on compactly supported smooth forms; it does not
pass through chart-simplex representatives, local homology, or smoothing comparison. -/
theorem compactIntegrationPartition_P7_integral_additivity
    (P : CompactIntegrationPartition q M W hK o c α hW) :
    integralTopForm o α =
      ∑ i, integralTopForm o (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) := by
  classical
  let L := compactlySupportedIntegralLinear q M o
  have hpart : ∀ i : Fin P.n,
      P.part i ∈ compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1) := by
    intro i
    apply (mem_compactlySupportedForms).2
    simpa [P.support_eq_tsupport] using P.support_compact i
  have hsum : α ∈ compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1) := by
    rw [← P.partition_sum]
    exact Submodule.sum_mem _ (fun i _ => hpart i)
  have hsubtype :
      (⟨α, hsum⟩ : compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1)) =
        ∑ i, (⟨P.part i, hpart i⟩ :
          compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1)) := by
    apply Subtype.ext
    simpa using P.partition_sum.symm
  calc
    integralTopForm o α = L ⟨α, hsum⟩ := rfl
    _ = L (∑ i, (⟨P.part i, hpart i⟩ :
          compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1))) := by rw [hsubtype]
    _ = ∑ i, L ⟨P.part i, hpart i⟩ :=
      map_sum L (fun i => (⟨P.part i, hpart i⟩ :
        compactlySupportedForms (EuclideanModel (q + 1)) M (q + 1))) Finset.univ
    _ = ∑ i, integralTopForm o
          (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) := by rfl

/-- Local chart-pairing and support-naturality obligations construct the certificate; this
statement does not assume the global pairing/integral identity. -/
theorem compactIntegrationPartition_exists
    (W : TopologicalSpace.Opens M)
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (hK : IsCompact ((W : Set M)ᶜ))
    (c : CompactFundamentalClass (q + 1) M ((W : Set M)ᶜ) hK o)
    (α : SmoothForm (EuclideanModel (q + 1)) M ℝ (q + 1))
    (hW : mpullbackₗ (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : W => (x : M)) contMDiff_subtype_val (q + 1) α = 0) :
    Nonempty (CompactIntegrationPartition q M W hK o c α hW) := by
  sorry

/-- The global equation is now derived by finite additivity from genuinely chart-supported
pieces. The certificate records local fundamental classes and relative-pair naturality, never a
sum decomposition of the real representative chain. -/
theorem relativeFundamentalIntegration
    (W : TopologicalSpace.Opens M)
    (o : Manifold.Orientation (EuclideanModel (q + 1)) M (Fin (q + 1)))
    (hK : IsCompact ((W : Set M)ᶜ))
    (c : CompactFundamentalClass (q + 1) M ((W : Set M)ᶜ) hK o)
    (α : SmoothForm (EuclideanModel (q + 1)) M ℝ (q + 1))
    (hW : mpullbackₗ (I := EuclideanModel (q + 1)) (I' := EuclideanModel (q + 1))
      (f := fun x : W => (x : M)) contMDiff_subtype_val (q + 1) α = 0) :
    relativeKronecker W (q + 1)
      (relativeDeRhamHom (EuclideanModel (q + 1)) W (q + 1)
        (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) W (q + 1) α
          (euclideanTopForm_closed (q + 1) M α) hW))
      (((openManifoldPair W).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) (q + 1)).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
              openManifoldPair W := by simp [openManifoldPair]
          exact hp ▸ c.realClass)) = integralTopForm o α := by
  obtain ⟨P⟩ := compactIntegrationPartition_exists q M W o hK c α hW
  calc
    _ = ∑ i, relativeKronecker W (q + 1)
        (relativeDeRhamHom (EuclideanModel (q + 1)) W (q + 1)
          (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) W (q + 1)
            (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i)) (P.part_vanishes_global i)))
        (((openManifoldPair W).twistedHomologyConstantIso
            (ModuleCat.of ℝ ℝ) (q + 1)).hom
          (by
            have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
                openManifoldPair W := by simp [openManifoldPair]
            exact hp ▸ c.realClass)) := compactIntegrationPartition_P6_additivity q M P
    _ = ∑ i, relativeKronecker (P.localOpen i) (q + 1)
        (relativeDeRhamHom (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
          (relativeDeRhamClassOfVanishing (EuclideanModel (q + 1)) (P.localOpen i) (q + 1)
            (P.part i) (euclideanTopForm_closed (q + 1) M (P.part i))
            (P.part_vanishes_local i)))
        (((openManifoldPair (P.localOpen i)).twistedHomologyConstantIso
            (ModuleCat.of ℝ ℝ) (q + 1)).hom
          (by
            have hp : TopPair.ofSubset (X := TopCat.of M) (P.support i)ᶜ =
                openManifoldPair (P.localOpen i) := by
              simpa [openManifoldPair, P.localOpen_eq i]
            exact hp ▸ (CompactFundamentalClass.realClass (hK := P.support_compact i) (c := pieceCompactClass q M P i)))) := by
      exact Finset.sum_congr rfl (fun i _ => compactIntegrationPartition_P5_naturality q M P i)
    _ = ∑ i, integralTopForm o (P.part i : RoughForm (EuclideanModel (q + 1)) M ℝ (q + 1)) := by
      exact Finset.sum_congr rfl (fun i _ => compactIntegrationPartition_P4_local_chart_evaluation q M P i)
    _ = integralTopForm o α := (compactIntegrationPartition_P7_integral_additivity q M P).symm

/-- The dimension-zero representative is stated separately: there is no degree `−1`
boundary term, and the native degree-zero relative evaluation law is used. -/
structure SmoothCompactZeroRepresentative
    (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (EuclideanModel 0) 1 M] [IsManifold (EuclideanModel 0) ∞ M]
    [BoundarylessManifold (EuclideanModel 0) M]
    (W : TopologicalSpace.Opens M)
    (hK : IsCompact ((W : Set M)ᶜ))
    (o : Manifold.Orientation (EuclideanModel 0) M (Fin 0))
    (c : CompactFundamentalClass 0 M ((W : Set M)ᶜ) hK o) where
  chain : SmoothSimplex (EuclideanModel 0) M 0 →₀ ℝ
  relative_image : smoothRelativeHomologyClass (EuclideanModel 0) W 0
      (smoothRelativeZeroCycle (EuclideanModel 0) W chain) =
    ((openManifoldPair W).twistedHomologyConstantIso
        (ModuleCat.of ℝ ℝ) 0).hom
      (by
        have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
            openManifoldPair W := by
          simp [openManifoldPair]
        exact hp ▸ c.realClass)


/-- Existence of the smooth relative zero-cycle representing the actual compact class. -/
theorem smoothCompactZeroRepresentative_exists
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (EuclideanModel 0) 1 M] [IsManifold (EuclideanModel 0) ∞ M]
    [BoundarylessManifold (EuclideanModel 0) M]
    (W : TopologicalSpace.Opens M)
    (o : Manifold.Orientation (EuclideanModel 0) M (Fin 0))
    (hK : IsCompact ((W : Set M)ᶜ))
    (c : CompactFundamentalClass 0 M ((W : Set M)ᶜ) hK o) :
    Nonempty (SmoothCompactZeroRepresentative M W hK o c) := by
  sorry

/-- Separate zero-dimensional chain-integral theorem; the relative 0-cycle has no boundary
correction term. -/
theorem chainIntegral_compactZeroRepresentative
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (EuclideanModel 0) 1 M] [IsManifold (EuclideanModel 0) ∞ M]
    [BoundarylessManifold (EuclideanModel 0) M]
    (W : TopologicalSpace.Opens M)
    (o : Manifold.Orientation (EuclideanModel 0) M (Fin 0))
    (hK : IsCompact ((W : Set M)ᶜ))
    (c : CompactFundamentalClass 0 M ((W : Set M)ᶜ) hK o)
    (r : SmoothCompactZeroRepresentative M W hK o c)
    (α : SmoothForm (EuclideanModel 0) M ℝ 0)
    (hα : α ∈ closedForms (EuclideanModel 0) M 0)
    (hW : mpullbackₗ (I := EuclideanModel 0) (I' := EuclideanModel 0)
      (f := fun x : W => (x : M)) contMDiff_subtype_val 0 α = 0) :
    integralTopForm o α = chainIntegral r.chain (α : RoughForm (EuclideanModel 0) M ℝ 0) := by
  sorry

/-- Zero-dimensional relative integration, including positive-point normalization through the
chosen compact class and the actual degree-zero evaluation map. -/
theorem relativeFundamentalIntegration_zero
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (EuclideanModel 0) 1 M] [IsManifold (EuclideanModel 0) ∞ M]
    [BoundarylessManifold (EuclideanModel 0) M]
    (W : TopologicalSpace.Opens M)
    (o : Manifold.Orientation (EuclideanModel 0) M (Fin 0))
    (hK : IsCompact ((W : Set M)ᶜ))
    (c : CompactFundamentalClass 0 M ((W : Set M)ᶜ) hK o)
    (α : SmoothForm (EuclideanModel 0) M ℝ 0)
    (hW : mpullbackₗ (I := EuclideanModel 0) (I' := EuclideanModel 0)
      (f := fun x : W => (x : M)) contMDiff_subtype_val 0 α = 0)
    :
    relativeKronecker W 0
      (relativeDeRhamHom (EuclideanModel 0) W 0
        (relativeDeRhamClassOfVanishing (EuclideanModel 0) W 0 α
          (euclideanTopForm_closed 0 M α) hW))
      (((openManifoldPair W).twistedHomologyConstantIso
          (ModuleCat.of ℝ ℝ) 0).hom
        (by
          have hp : TopPair.ofSubset (X := TopCat.of M) (((W : Set M)ᶜ)ᶜ) =
              openManifoldPair W := by
            simp [openManifoldPair]
          exact hp ▸ c.realClass)) =
      integralTopForm o α := by
  have hα : α ∈ closedForms (EuclideanModel 0) M 0 := euclideanTopForm_closed 0 M α
  obtain ⟨r⟩ := smoothCompactZeroRepresentative_exists
    (M := M) (W := W) o hK c
  rw [← r.relative_image]
  exact (relativeDeRhamHom_eval_zero (EuclideanModel 0) W α hα hW r.chain).trans
    (chainIntegral_compactZeroRepresentative (M := M) (W := W) o hK c r α hα hW).symm

end TauCetiRoadmap.DifferentialGeometry.CompactIntegration

end
