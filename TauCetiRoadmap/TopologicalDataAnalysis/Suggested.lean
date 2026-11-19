module

public import Mathlib
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
public import TauCeti.AlgebraicTopology.SimplicialComplex.ChainComplex
public import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.Basic
public import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.CWComplex.OrderedChainComplex
public import TauCeti.AlgebraicTopology.Singular.Cech.OrderedQuasiIso
public import TauCeti.AlgebraicTopology.Singular.Cech.Map
public import TauCeti.AlgebraicTopology.Singular.Contractible
public import TauCeti.Algebra.Homology.EulerCharacteristic.ChainComplex
public import TauCeti.Topology.Order.Sublevel
public import TauCeti.Geometry.Manifold.Morse.Deformation
public import TauCeti.Geometry.Manifold.Morse.RelCWComplex
public import TauCeti.Geometry.Manifold.Morse.Index
public import TauCeti.Geometry.Manifold.Morse.CriticalPoints
public import TauCeti.RepresentationTheory.Quiver.FiniteRepType.Correspondence
public import TauCeti.RingTheory.KrullSchmidt.Uniqueness

/-!
# Topological data analysis: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here:

* 4.1, naturality of the comparison: a compatibility of Tau Ceti's
  `TauCeti.orderedSimplicialHomologyIsoSingularHomology` with the maps induced by a subcomplex,
  whose Lean form is fixed by the Tau Ceti interface for maps of realizations;
* 4.3, independence of the reduction: a restatement of `low_eq_iff_cornerRank`, which already
  expresses every low through `D` alone;
* 5.3, the volume bound for submanifolds: it needs the `d`-dimensional Hausdorff measure
  normalised to agree with Lebesgue measure for the Euclidean metric; Mathlib's `μH[d]` agrees
  with it only for the sup metric on `Fin d → ℝ`;
* 6.4, intrinsic Čech stability: it needs the intrinsic Čech complex, with centres in the
  space, which nothing else here uses;
* 8.3, the uniform strong law and the central limit theorem for landscapes: weak convergence in
  `ℓ^∞([0, T])` and Donsker classes are MathematicalStatisticsAsymptotic's (§§3.1, 3.4) and are
  not in the pinned Mathlib or Tau Ceti;
* 8.4, rates for Rips diagrams: a composition of `bottleneckDist_ripsModule_le_ghDist`,
  `GromovHausdorff.ghDist_le_hausdorffDist` and `lintegral_hausdorffDist_le`.

The first and third bullets of 3.4 (bar endpoints are critical values; the strong Morse
inequalities) are consequences of `encard_criticalPoints_index_eq` and its route.

The conventions of the README are used throughout. Coefficients are a field `𝕜 : Type`. A
persistence module is a functor from `ℝ`, a preorder category, to `ModuleCat 𝕜`. The homology of
a filtration of a space is singular homology (Mathlib's `singularHomologyFunctor`) of the
filtered subspaces; simplicial filtrations are filtrations of the realization of the full simplex
on their vertex type. Diagrams are multiplicity functions on the open half-plane `b < d` of
`EReal × EReal`, and every distance between diagrams or modules takes values in `ℝ≥0∞`. The
Vietoris–Rips parameter is half the diameter bound.

No definition here is owned by a roadmap on main; the Wasserstein distance between measures is
Tau Ceti's `TauCeti.wassersteinEDist`. The implementation namespace of the README is `TauCeti`;
the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open CategoryTheory Limits MeasureTheory ProbabilityTheory Filter Set Topology Metric
open AlgebraicTopology
open scoped ENNReal NNReal ContDiff Manifold

namespace TauCetiRoadmap.TopologicalDataAnalysis

attribute [local instance] Classical.propDecidable

/-! ## Layer 1: persistence modules, intervals and diagrams -/

section Modules

variable (𝕜 : Type) [Field 𝕜]

/-- A persistence module over `ℝ`: a functor from the real line, as a preorder category, to
vector spaces over `𝕜`. -/
abbrev PersistenceModule := ℝ ⥤ ModuleCat.{0} 𝕜

variable {𝕜}

/-- Pointwise finite dimension. -/
def IsPFD (V : PersistenceModule 𝕜) : Prop :=
  ∀ t, FiniteDimensional 𝕜 (V.obj t)

/-- The rank invariant `r(s, t) = rank (V_s → V_t)` in `ℕ∞`, and `0` when `t < s`. -/
def rankInv (V : PersistenceModule 𝕜) (s t : ℝ) : ℕ∞ :=
  if h : s ≤ t then Cardinal.toENat (Module.rank 𝕜 (LinearMap.range (V.map (homOfLE h)).hom))
  else 0

/-- `q`-tameness: every structure map across a positive gap has finite rank. -/
def IsQTame (V : PersistenceModule 𝕜) : Prop :=
  ∀ s t, s < t → rankInv V s t < ⊤

variable (𝕜)

/-- The interval module of an order-connected set `I`: the space at `t` is `𝕜` (as functions on a
one-point type) when `t ∈ I` and `0` otherwise; the maps are identities inside `I`. -/
def intervalModule (I : Set ℝ) (hI : I.OrdConnected) : PersistenceModule 𝕜 where
  obj t := ModuleCat.of 𝕜 ({_u : Unit // t ∈ I} → 𝕜)
  map {s _} _ := ModuleCat.ofHom
    { toFun := fun g _ => if hs : s ∈ I then g ⟨(), hs⟩ else 0
      map_add' := by
        intro g g'; funext h
        by_cases hs : s ∈ I <;> simp [hs]
      map_smul' := by
        intro c g; funext h
        by_cases hs : s ∈ I <;> simp [hs] }
  map_id t := by
    apply ModuleCat.hom_ext; apply LinearMap.ext; intro g; funext h
    simp [h.2]
  map_comp {s t u} f g := by
    apply ModuleCat.hom_ext; apply LinearMap.ext; intro x; funext h
    by_cases hs : s ∈ I
    · have ht : t ∈ I := hI.out hs h.2 ⟨leOfHom f, leOfHom g⟩
      simp [hs, ht]
    · simp [hs]

variable {𝕜}

/-- An interval decomposition: an isomorphism with a coproduct of interval modules. -/
structure IntervalDecomposition (V : PersistenceModule 𝕜) where
  /-- The index type of the summands. -/
  ι : Type
  /-- The intervals. -/
  I : ι → Set ℝ
  nonempty : ∀ j, (I j).Nonempty
  ordConnected : ∀ j, (I j).OrdConnected
  /-- The decomposition isomorphism. -/
  iso : V ≅ ∐ fun j => intervalModule 𝕜 (I j) (ordConnected j)

/-- Finite type: pointwise finite-dimensional, and the structure map `V_s → V_t` is an
isomorphism whenever `(s, t]` contains no point of a finite set of critical values. -/
def IsFiniteType (V : PersistenceModule 𝕜) : Prop :=
  IsPFD V ∧ ∃ A : Finset ℝ, ∀ s t (h : s ≤ t), (∀ a ∈ A, a ∉ Set.Ioc s t) →
    IsIso (V.map (homOfLE h))

/-- The lower endpoint of a set of reals, in `EReal`. -/
def lowerEnd (I : Set ℝ) : EReal := sInf ((fun x : ℝ => (x : EReal)) '' I)

/-- The upper endpoint of a set of reals, in `EReal`. -/
def upperEnd (I : Set ℝ) : EReal := sSup ((fun x : ℝ => (x : EReal)) '' I)

/-- The open half-plane above the diagonal in the extended plane. -/
def OffDiag : Type := {p : EReal × EReal // p.1 < p.2}

/-- A persistence diagram: a multiplicity function on the off-diagonal points. -/
def Diagram : Type := OffDiag → ℕ∞

/-- The points of a diagram, each repeated according to its multiplicity. -/
def Diagram.Pt (D : Diagram) : Type := {x : OffDiag × ℕ // (x.2 : ℕ∞) < D x.1}

/-- The rank invariant extended to `EReal` arguments, with the module taken to be zero at `⊥`
and at `⊤`: the value is `0` when an argument is infinite, and `rankInv` at real arguments. -/
def rankE (V : PersistenceModule 𝕜) (s t : EReal) : ℕ∞ :=
  if s = ⊥ ∨ s = ⊤ ∨ t = ⊥ ∨ t = ⊤ then 0 else rankInv V s.toReal t.toReal

/-- The diagram of a persistence module: the multiplicity of `(p, q)` is the infimum of the
rectangle measures `r(b, c) - r(a, c) - r(b, d) + r(a, d)` over rectangles `[a, b] × [c, d]`
with `p` and `q` in their interiors (relative to `⊥` and `⊤`) and `b < c`. -/
def rankDiagram (V : PersistenceModule 𝕜) : Diagram := fun x =>
  ⨅ (a : EReal) (b : EReal) (c : EReal) (d : EReal)
    (_ : a ≤ x.1.1 ∧ (a < x.1.1 ∨ x.1.1 = ⊥)) (_ : x.1.1 < b) (_ : b < c) (_ : c < x.1.2)
    (_ : x.1.2 ≤ d ∧ (x.1.2 < d ∨ x.1.2 = ⊤)),
    (rankE V b c + rankE V a d) - (rankE V a c + rankE V b d)

/-- **Rank invariant of a decomposition**: `r(s, t)` counts the intervals containing `s` and
`t`. -/
theorem rankInv_eq_encard_of_decomposition (V : PersistenceModule 𝕜)
    (D : IntervalDecomposition V) {s t : ℝ} (hst : s ≤ t) :
    rankInv V s t = {j | s ∈ D.I j ∧ t ∈ D.I j}.encard := by
  sorry

/-- **Decomposition of modules of finite type** into finitely many intervals, each of the form
`[a, a')`, `[a, ∞)`, `(-∞, a')` or `ℝ` with endpoints in a set `A` of critical values as in
`IsFiniteType`. -/
theorem exists_intervalDecomposition_of_isFiniteType (V : PersistenceModule 𝕜) (hV : IsPFD V)
    (A : Finset ℝ) (hA : ∀ s t (h : s ≤ t), (∀ a ∈ A, a ∉ Set.Ioc s t) →
      IsIso (V.map (homOfLE h))) :
    ∃ D : IntervalDecomposition V, Finite D.ι ∧ ∀ j,
      (∃ a ∈ A, ∃ a' ∈ A, a < a' ∧ D.I j = Set.Ico a a') ∨ (∃ a ∈ A, D.I j = Set.Ici a) ∨
        (∃ a' ∈ A, D.I j = Set.Iio a') ∨ D.I j = Set.univ := by
  sorry

/-- **Crawley-Boevey's theorem**: a pointwise finite-dimensional module is a direct sum of
interval modules. -/
theorem exists_intervalDecomposition_of_isPFD (V : PersistenceModule 𝕜) (hV : IsPFD V) :
    Nonempty (IntervalDecomposition V) := by
  sorry

/-- **Uniqueness of the barcode**: two interval decompositions of a pointwise
finite-dimensional module have the same intervals with the same multiplicities. -/
theorem IntervalDecomposition.exists_equiv {V : PersistenceModule 𝕜} (hV : IsPFD V)
    (D D' : IntervalDecomposition V) : ∃ e : D.ι ≃ D'.ι, ∀ j, D'.I (e j) = D.I j := by
  sorry

/-- **The diagram of a decomposition** counts the intervals with the given endpoints. -/
theorem rankDiagram_eq_encard_of_decomposition {V : PersistenceModule 𝕜} (hV : IsPFD V)
    (D : IntervalDecomposition V) (x : OffDiag) :
    rankDiagram V x = {j | lowerEnd (D.I j) = x.1.1 ∧ upperEnd (D.I j) = x.1.2}.encard := by
  sorry

end Modules

/-! ## Layer 2: distances between diagrams and between modules -/

section Distances

variable {𝕜 : Type} [Field 𝕜]

/-- The distance between extended reals: `0` on equal arguments, `⊤` if one is infinite and they
differ, and `|a - b|` otherwise. -/
def eRealDist (a b : EReal) : ℝ≥0∞ :=
  if a = b then 0
  else if a = ⊤ ∨ a = ⊥ ∨ b = ⊤ ∨ b = ⊥ then ⊤ else ENNReal.ofReal |a.toReal - b.toReal|

/-- The `ℓ^∞` distance between off-diagonal points. -/
def pointDist (p q : OffDiag) : ℝ≥0∞ := max (eRealDist p.1.1 q.1.1) (eRealDist p.1.2 q.1.2)

/-- The `ℓ^∞` distance to the diagonal, `(d - b) / 2`, and `⊤` for an infinite coordinate. -/
def diagDist (p : OffDiag) : ℝ≥0∞ :=
  if p.1.1 = ⊥ ∨ p.1.2 = ⊤ then ⊤ else ENNReal.ofReal ((p.1.2.toReal - p.1.1.toReal) / 2)

/-- A partial matching between the points of two diagrams. -/
structure Matching (D E : Diagram) where
  /-- The matched points of `D`. -/
  dom : Set D.Pt
  /-- The matched points of `E`. -/
  cod : Set E.Pt
  /-- The matching. -/
  toEquiv : dom ≃ cod

/-- The bottleneck cost of a matching: the largest matched distance or unmatched distance to the
diagonal. -/
def Matching.cost {D E : Diagram} (M : Matching D E) : ℝ≥0∞ :=
  max (⨆ x : M.dom, pointDist x.1.1.1 (M.toEquiv x).1.1.1)
    (max (⨆ (x : D.Pt) (_ : x ∉ M.dom), diagDist x.1.1)
      (⨆ (y : E.Pt) (_ : y ∉ M.cod), diagDist y.1.1))

/-- The `q`-cost of a matching: the `ℓ^q` norm of the matched and unmatched distances. -/
def Matching.qCost {D E : Diagram} (M : Matching D E) (q : ℝ) : ℝ≥0∞ :=
  ((∑' x : M.dom, pointDist x.1.1.1 (M.toEquiv x).1.1.1 ^ q) +
    (∑' x : {x : D.Pt // x ∉ M.dom}, diagDist x.1.1.1 ^ q) +
      (∑' y : {y : E.Pt // y ∉ M.cod}, diagDist y.1.1.1 ^ q)) ^ (1 / q)

/-- The bottleneck distance. -/
def bottleneckDist (D E : Diagram) : ℝ≥0∞ := ⨅ M : Matching D E, M.cost

/-- The `q`-Wasserstein distance between diagrams. -/
def wassersteinDist (q : ℝ) (D E : Diagram) : ℝ≥0∞ := ⨅ M : Matching D E, M.qCost q

/-- An `ε`-interleaving of two persistence modules, stated pointwise. -/
def IsInterleaved (V W : PersistenceModule 𝕜) (ε : ℝ≥0) : Prop :=
  ∃ (φ : ∀ t : ℝ, V.obj t ⟶ W.obj (t + ε)) (ψ : ∀ t : ℝ, W.obj t ⟶ V.obj (t + ε)),
    (∀ s t (h : s ≤ t), V.map (homOfLE h) ≫ φ t =
      φ s ≫ W.map (homOfLE (by linarith : s + (ε : ℝ) ≤ t + ε))) ∧
    (∀ s t (h : s ≤ t), W.map (homOfLE h) ≫ ψ t =
      ψ s ≫ V.map (homOfLE (by linarith : s + (ε : ℝ) ≤ t + ε))) ∧
    (∀ t, φ t ≫ ψ (t + ε) =
      V.map (homOfLE (by have := ε.2; linarith : t ≤ t + ε + ε))) ∧
    (∀ t, ψ t ≫ φ (t + ε) =
      W.map (homOfLE (by have := ε.2; linarith : t ≤ t + ε + ε)))

/-- The interleaving distance, `⊤` when no interleaving exists. -/
def interleavingDist (V W : PersistenceModule 𝕜) : ℝ≥0∞ :=
  ⨅ (ε : ℝ≥0) (_ : IsInterleaved V W ε), (ε : ℝ≥0∞)

/-- **Triangle inequality** for the bottleneck distance. -/
theorem bottleneckDist_triangle (D E F : Diagram) :
    bottleneckDist D F ≤ bottleneckDist D E + bottleneckDist E F := by
  sorry

/-- The bottleneck distance is at most every `q`-Wasserstein distance with `1 ≤ q`. -/
theorem bottleneckDist_le_wassersteinDist {q : ℝ} (hq : 1 ≤ q) (D E : Diagram) :
    bottleneckDist D E ≤ wassersteinDist q D E := by
  sorry

/-- **Triangle inequality** for the `q`-Wasserstein distance, `1 ≤ q`. -/
theorem wassersteinDist_triangle {q : ℝ} (hq : 1 ≤ q) (D E F : Diagram) :
    wassersteinDist q D F ≤ wassersteinDist q D E + wassersteinDist q E F := by
  sorry

/-- **The isometry theorem** for `q`-tame modules. -/
theorem interleavingDist_eq_bottleneckDist {V W : PersistenceModule 𝕜} (hV : IsQTame V)
    (hW : IsQTame W) : interleavingDist V W = bottleneckDist (rankDiagram V) (rankDiagram W) := by
  sorry

/-- **Persistence beyond the error scale**: a bottleneck bound between finite diagrams is
attained by a matching that matches every point farther than the bound from the diagonal. -/
theorem exists_matching_of_bottleneckDist_le {D E : Diagram} [Finite D.Pt] [Finite E.Pt]
    {η : ℝ≥0∞} (h : bottleneckDist D E ≤ η) :
    ∃ M : Matching D E, M.cost ≤ η ∧ (∀ y : E.Pt, η < diagDist y.1.1 → y ∈ M.cod) ∧
      ∀ x : D.Pt, η < diagDist x.1.1 → x ∈ M.dom := by
  sorry

end Distances

/-! ## Layer 3: filtrations of spaces and sublevel persistence -/

section Sublevel

variable (𝕜 : Type) [Field 𝕜]

/-- Subsets of a space, as a category under inclusion, mapped to spaces. -/
def setFunctor (X : TopCat.{0}) : Set X ⥤ TopCat.{0} where
  obj s := TopCat.of s
  map {s t} h := TopCat.ofHom ⟨Set.inclusion (leOfHom h), continuous_inclusion (leOfHom h)⟩

/-- Degree-`p` singular homology of a monotone family of subspaces. -/
def setFiltrationModule (X : TopCat.{0}) (F : ℝ → Set X) (hF : Monotone F) (p : ℕ) :
    PersistenceModule 𝕜 :=
  hF.functor ⋙ setFunctor X ⋙ (singularHomologyFunctor (ModuleCat.{0} 𝕜) p).obj (ModuleCat.of 𝕜 𝕜)

/-- Sublevel persistence `t ↦ H_p({f ≤ t})`. -/
def sublevelModule (X : TopCat.{0}) (f : X → ℝ) (p : ℕ) : PersistenceModule 𝕜 :=
  setFiltrationModule 𝕜 X (fun t => {x | f x ≤ t}) (fun _ _ h _ hx => le_trans hx h) p

/-- Offset persistence: sublevel persistence of the distance function `x ↦ infDist x A`. -/
def offsetModule {E : Type} [PseudoMetricSpace E] (A : Set E) (p : ℕ) : PersistenceModule 𝕜 :=
  sublevelModule 𝕜 (TopCat.of E) (fun x => infDist x A) p

variable {𝕜}

/-- A homological critical value of `f`: across every sufficiently small window
`[a - ε, a + ε]` the inclusion fails to be an isomorphism in some degree. -/
def IsHomCriticalValue (X : TopCat.{0}) (f : X → ℝ) (a : ℝ) : Prop :=
  ∃ ε₀ > 0, ∀ ε : ℝ, ∀ hε : 0 < ε, ε < ε₀ → ∃ p : ℕ, ¬ IsIso ((sublevelModule 𝕜 X f p).map
    (homOfLE (by linarith : a - ε ≤ a + ε)))

variable (𝕜) in
/-- A tame function: finitely many homological critical values and finite-dimensional homology
of every sublevel set. -/
def IsTameFunction (X : TopCat.{0}) (f : X → ℝ) : Prop :=
  {a | IsHomCriticalValue (𝕜 := 𝕜) X f a}.Finite ∧ ∀ p, IsPFD (sublevelModule 𝕜 X f p)

/-- **Sublevel interleaving**: uniformly close functions have interleaved sublevel modules. -/
theorem isInterleaved_sublevelModule (X : TopCat.{0}) (f g : X → ℝ) (δ : ℝ≥0)
    (hfg : ∀ x, |f x - g x| ≤ δ) (p : ℕ) :
    IsInterleaved (sublevelModule 𝕜 X f p) (sublevelModule 𝕜 X g p) δ := by
  sorry

/-- **Bottleneck stability for tame functions.** -/
theorem bottleneckDist_sublevelModule_le (X : TopCat.{0}) (f g : X → ℝ)
    (hf : IsTameFunction 𝕜 X f) (hg : IsTameFunction 𝕜 X g) {δ : ℝ}
    (hfg : ∀ x, |f x - g x| ≤ δ) (p : ℕ) :
    bottleneckDist (rankDiagram (sublevelModule 𝕜 X f p)) (rankDiagram (sublevelModule 𝕜 X g p))
      ≤ ENNReal.ofReal δ := by
  sorry

/-- **Confidence sets for diagrams** from a uniform band. This is 3.2 composed with monotonicity
of the measure; it is stated as the form in which confidence sets are used. -/
theorem measure_bottleneckDist_le {Ω : Type} [MeasurableSpace Ω] (P : Measure Ω)
    (X : TopCat.{0}) (f : X → ℝ) (fhat : Ω → X → ℝ) (hf : IsTameFunction 𝕜 X f)
    (hfhat : ∀ w, IsTameFunction 𝕜 X (fhat w)) (r : ℝ) (p : ℕ) :
    P {w | ∀ x, |fhat w x - f x| ≤ r} ≤
      P {w | bottleneckDist (rankDiagram (sublevelModule 𝕜 X (fhat w) p))
        (rankDiagram (sublevelModule 𝕜 X f p)) ≤ ENNReal.ofReal r} := by
  sorry

/-- **Critical points of a Morse function count bars**: on a closed manifold, for a Morse
function with distinct critical values, the critical points of index `q` are as many as the
degree-`q` bars plus the finite degree-`(q - 1)` bars, and the infinite degree-`q` bars are as
many as the dimension of `H_q(M)`. -/
theorem encard_criticalPoints_index_eq {n : ℕ} {M : Type} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] [CompactSpace M]
    {f : M → ℝ} (hf : TauCeti.IsMorse (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) f)
    (hinj : Set.InjOn f
      (TauCeti.criticalPoints (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) f))
    (q : ℕ) :
    {x | x ∈ TauCeti.criticalPoints (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) f ∧
        TauCeti.manifoldMorseIndex (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) f x =
          q}.encard =
      (∑' x : OffDiag, rankDiagram (sublevelModule 𝕜 (TopCat.of M) f q) x) +
        (if q = 0 then 0 else ∑' x : {x : OffDiag // x.1.2 ≠ ⊤},
          rankDiagram (sublevelModule 𝕜 (TopCat.of M) f (q - 1)) x.1) ∧
    ∑' x : {x : OffDiag // x.1.2 = ⊤}, rankDiagram (sublevelModule 𝕜 (TopCat.of M) f q) x.1 =
      Cardinal.toENat (Module.rank 𝕜
        (((singularHomologyFunctor (ModuleCat.{0} 𝕜) q).obj (ModuleCat.of 𝕜 𝕜)).obj
          (TopCat.of M))) := by
  sorry

end Sublevel

/-! ## Layer 4: simplicial filtrations and the persistence algorithm -/

section Simplicial

variable {𝕜 : Type} [Field 𝕜] {ι : Type}

/-- The full simplex on `ι`: every nonempty finite set is a face. -/
def fullComplex (ι : Type) : AbstractSimplicialComplex ι where
  faces := {σ | σ.Nonempty}
  isRelLowerSet_faces := fun _ hσ => ⟨hσ, fun _ _ hτ => hτ⟩
  singleton_mem v := Finset.singleton_nonempty v

/-- The points of the realization of the full simplex lying in a face of `L`. -/
def facePoints (L : PreAbstractSimplicialComplex ι) :
    Set (AbstractSimplicialComplex.Realization (fullComplex ι)) :=
  {x | ∃ σ ∈ L.faces,
    (x : ι →₀ ℝ) ∈ convexHull ℝ ((σ.image fun v => Finsupp.single v (1 : ℝ)) : Set (ι →₀ ℝ))}

variable (𝕜) in
/-- Degree-`p` homology of a monotone family of complexes, through their realizations. -/
def complexFiltrationModule (L : ℝ → PreAbstractSimplicialComplex ι) (hL : Monotone L) (p : ℕ) :
    PersistenceModule 𝕜 :=
  setFiltrationModule 𝕜 (TopCat.of (AbstractSimplicialComplex.Realization (fullComplex ι)))
    (fun t => facePoints (L t)) (fun _ _ h _ ⟨σ, hσ, hx⟩ => ⟨σ, hL h hσ, hx⟩) p

/-- A monotone function on the faces of `K`: faces never exceed their cofaces. -/
def IsMonotoneOn (K : PreAbstractSimplicialComplex ι) (f : Finset ι → ℝ) : Prop :=
  ∀ σ ∈ K.faces, ∀ τ : Finset ι, τ.Nonempty → τ ⊆ σ → f τ ≤ f σ

/-- The sublevel complex `{σ ∈ K | f σ ≤ t}` of a monotone function. -/
def sublevelComplex (K : PreAbstractSimplicialComplex ι) (f : Finset ι → ℝ)
    (hf : IsMonotoneOn K f) (t : ℝ) : PreAbstractSimplicialComplex ι where
  faces := {σ | σ ∈ K.faces ∧ f σ ≤ t}
  isRelLowerSet_faces := fun σ hσ =>
    ⟨(K.isRelLowerSet_faces hσ.1).1, fun τ hτσ hτ =>
      ⟨(K.isRelLowerSet_faces hσ.1).2 hτσ hτ, (hf σ hσ.1 τ hτ hτσ).trans hσ.2⟩⟩

variable (𝕜) in
/-- Sublevel persistence of a monotone function on a complex. -/
def simplicialModule (K : PreAbstractSimplicialComplex ι) (f : Finset ι → ℝ)
    (hf : IsMonotoneOn K f) (p : ℕ) : PersistenceModule 𝕜 :=
  complexFiltrationModule 𝕜 (sublevelComplex K f hf)
    (fun _ _ h _ hσ => ⟨hσ.1, hσ.2.trans h⟩) p

/-- The Euler characteristic `Σ (-1)^dim σ` of a complex (with finitely many faces). -/
def eulerChar (K : PreAbstractSimplicialComplex ι) : ℤ :=
  ∑ᶠ σ ∈ K.faces, (-1 : ℤ) ^ (σ.card + 1)

variable (𝕜) in
/-- The `p`-th Betti number over `𝕜`, from the ordered simplicial chain complex. -/
def betti [LinearOrder ι] (K : AbstractSimplicialComplex ι) (p : ℕ) : ℕ :=
  Module.finrank 𝕜 ((TauCeti.orderedSimplicialChainComplex K 𝕜).homology p)

/-- **The Euler–Poincaré formula.** -/
theorem eulerChar_eq_sum_betti [LinearOrder ι] (K : AbstractSimplicialComplex ι)
    (hK : K.faces.Finite) (N : ℕ) (hN : ∀ σ ∈ K.faces, σ.card ≤ N) :
    eulerChar K.toPreAbstractSimplicialComplex =
      ∑ p ∈ Finset.range N, (-1 : ℤ) ^ p * (betti 𝕜 K p : ℤ) := by
  sorry

/-- **Positive and negative simplices**: adding one `(p + 1)`-simplex either raises `β_{p+1}` by
one or lowers `β_p` by one, and changes no other Betti number. -/
theorem betti_insert_face [LinearOrder ι] (K L : AbstractSimplicialComplex ι)
    (hK : K.faces.Finite) (σ : Finset ι) (hσK : σ ∉ K.faces)
    (hL : L.faces = insert σ K.faces) (p : ℕ) (hσ : σ.card = p + 2) :
    (betti 𝕜 L (p + 1) = betti 𝕜 K (p + 1) + 1 ∧ ∀ q ≠ p + 1, betti 𝕜 L q = betti 𝕜 K q) ∨
      (betti 𝕜 L p + 1 = betti 𝕜 K p ∧ ∀ q ≠ p, betti 𝕜 L q = betti 𝕜 K q) := by
  sorry

variable (𝕜) in
/-- The signed boundary matrix of a simplexwise order `σ` of faces: the entry `(i, j)` is the
incidence sign `(-1)^k` when `σ i` is `σ j` with its `k`-th vertex deleted. -/
def boundaryMatrix [LinearOrder ι] {m : ℕ} (σ : Fin m → Finset ι) : Matrix (Fin m) (Fin m) 𝕜 :=
  fun i j => if σ i ⊆ σ j ∧ (σ i).card + 1 = (σ j).card then
    ∑ v ∈ σ j \ σ i, (-1 : 𝕜) ^ ((σ j).filter (· < v)).card else 0

/-- The lowest nonzero row of column `j`, or `⊥` for a zero column. -/
def low {m : ℕ} (R : Matrix (Fin m) (Fin m) 𝕜) (j : Fin m) : WithBot (Fin m) :=
  (Finset.univ.filter fun i => R i j ≠ 0).max

/-- A reduced matrix: distinct nonzero columns have distinct lows. -/
def IsReduced {m : ℕ} (R : Matrix (Fin m) (Fin m) 𝕜) : Prop :=
  ∀ j k, j ≠ k → low R j ≠ ⊥ → low R j ≠ low R k

/-- The rank of the lower-left block: rows `≥ i`, columns `< j`. -/
def cornerRank {m : ℕ} (D : Matrix (Fin m) (Fin m) 𝕜) (i j : ℕ) : ℕ :=
  Matrix.rank (D.submatrix (Subtype.val : {a : Fin m // i ≤ a.val} → Fin m)
    (Subtype.val : {b : Fin m // b.val < j} → Fin m))

/-- **The pairing lemma**: for a reduction `R = D V` with `V` invertible upper triangular, the
lows of `R` are determined by ranks of lower-left blocks of `D`. -/
theorem low_eq_iff_cornerRank {m : ℕ} (D V R : Matrix (Fin m) (Fin m) 𝕜) (hRDV : R = D * V)
    (hV : V.BlockTriangular id) (hVd : ∀ i, V i i ≠ 0) (hR : IsReduced R) (i j : Fin m) :
    low R j = i ↔
      (cornerRank D i (j + 1) : ℤ) - cornerRank D (i + 1) (j + 1) + cornerRank D (i + 1) j
        - cornerRank D i j = 1 := by
  sorry

/-- **Correctness of the persistence algorithm**: the rank of `H_p(K_s) → H_p(K_t)` counts the
positive `p`-simplices entering by `s` whose partner enters after `t`. -/
theorem rankInv_simplicialModule_eq_card [LinearOrder ι] {m : ℕ}
    (K : PreAbstractSimplicialComplex ι) (f : Finset ι → ℝ) (hf : IsMonotoneOn K f)
    (σ : Fin m → Finset ι) (hσi : Function.Injective σ) (hσK : Set.range σ = K.faces)
    (hord : ∀ i j, i ≤ j → f (σ i) ≤ f (σ j)) (hface : ∀ i j, σ i ⊂ σ j → i < j)
    (V R : Matrix (Fin m) (Fin m) 𝕜) (hRDV : R = boundaryMatrix 𝕜 σ * V)
    (hV : V.BlockTriangular id) (hVd : ∀ i, V i i ≠ 0) (hR : IsReduced R)
    (p : ℕ) {s t : ℝ} (hst : s ≤ t) :
    rankInv (simplicialModule 𝕜 K f hf p) s t =
      ((Finset.univ.filter fun i : Fin m => (σ i).card = p + 1 ∧ low R i = ⊥ ∧
        f (σ i) ≤ s ∧ ∀ j, low R j = (i : WithBot (Fin m)) → t < f (σ j)).card : ℕ∞) := by
  sorry

/-- **Bottleneck stability for filtrations** of a finite complex. -/
theorem bottleneckDist_simplicialModule_le (K : PreAbstractSimplicialComplex ι)
    (hK : K.faces.Finite) (f g : Finset ι → ℝ) (hf : IsMonotoneOn K f) (hg : IsMonotoneOn K g)
    (p : ℕ) :
    bottleneckDist (rankDiagram (simplicialModule 𝕜 K f hf p))
      (rankDiagram (simplicialModule 𝕜 K g hg p)) ≤
      ⨆ σ ∈ K.faces, ENNReal.ofReal |f σ - g σ| := by
  sorry

/-- **Wasserstein stability for filtrations** (Skraba–Turner). -/
theorem wassersteinDist_simplicialModule_le (K : PreAbstractSimplicialComplex ι)
    (hK : K.faces.Finite) (f g : Finset ι → ℝ) (hf : IsMonotoneOn K f) (hg : IsMonotoneOn K g)
    {q : ℝ} (hq : 1 ≤ q) (p : ℕ) :
    wassersteinDist q (rankDiagram (simplicialModule 𝕜 K f hf p))
      (rankDiagram (simplicialModule 𝕜 K g hg p)) ≤
      (∑' σ : K.faces, ENNReal.ofReal |f σ - g σ| ^ q) ^ (1 / q) := by
  sorry

end Simplicial

/-! ## Layer 5: distance functions and the geometry of offsets -/

section Offsets

variable {𝕜 : Type} [Field 𝕜]

/-- The nearest points of `K` to `x`. -/
def nearestPoints {E : Type} [PseudoMetricSpace E] (K : Set E) (x : E) : Set E :=
  {y | y ∈ K ∧ dist x y = infDist x K}

/-- A critical point of the distance function: a point outside `K` in the convex hull of its
nearest points. -/
def IsDistCritical {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℝ E] (K : Set E) (x : E) :
    Prop :=
  x ∉ K ∧ x ∈ convexHull ℝ (nearestPoints K x)

/-- The weak feature size: the infimum of the critical values of the distance function, `⊤`
without critical points. -/
def wfs {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℝ E] (K : Set E) : ℝ≥0∞ :=
  ⨅ (x : E) (_ : IsDistCritical K x), ENNReal.ofReal (infDist x K)

/-- The reach: the supremum of the radii `r` such that every point at distance less than `r`
has a unique nearest point. -/
def reach {E : Type} [PseudoMetricSpace E] (K : Set E) : ℝ≥0∞ :=
  ⨆ (r : ℝ≥0) (_ : ∀ x, infDist x K < r → ∃! y, y ∈ nearestPoints K x), (r : ℝ≥0∞)

/-- A correspondence between two spaces: a relation projecting onto both factors. -/
def IsCorrespondence {X Y : Type} (C : Set (X × Y)) : Prop :=
  (∀ x, ∃ y, (x, y) ∈ C) ∧ ∀ y, ∃ x, (x, y) ∈ C

/-- The distortion of a relation. -/
def distortion {X Y : Type} [PseudoMetricSpace X] [PseudoMetricSpace Y] (C : Set (X × Y)) :
    ℝ≥0∞ :=
  ⨆ (u : X × Y) (_ : u ∈ C) (v : X × Y) (_ : v ∈ C),
    ENNReal.ofReal |dist u.1 v.1 - dist u.2 v.2|

/-- **Distance functions and the Hausdorff distance.** -/
theorem iSup_abs_infDist_sub_eq_hausdorffDist {E : Type} [PseudoMetricSpace E] {A B : Set E}
    (hA : IsCompact A) (hB : IsCompact B) (hA' : A.Nonempty) (hB' : B.Nonempty) :
    ⨆ x, |infDist x A - infDist x B| = hausdorffDist A B := by
  sorry

/-- **Offsets are `q`-tame and stable** under Hausdorff perturbation. -/
theorem bottleneckDist_offsetModule_le {D : ℕ} {A B : Set (EuclideanSpace ℝ (Fin D))}
    (hA : IsCompact A) (hB : IsCompact B) (hA' : A.Nonempty) (hB' : B.Nonempty) (p : ℕ) :
    IsQTame (offsetModule 𝕜 A p) ∧
      bottleneckDist (rankDiagram (offsetModule 𝕜 A p)) (rankDiagram (offsetModule 𝕜 B p)) ≤
        ENNReal.ofReal (hausdorffDist A B) := by
  sorry

/-- **The reach bounds the weak feature size** from below. -/
theorem reach_le_wfs {D : ℕ} {K : Set (EuclideanSpace ℝ (Fin D))} (hK : IsCompact K)
    (hK' : K.Nonempty) : reach K ≤ wfs K := by
  sorry

/-- **The isotopy lemma**: without critical values in `[a, b]` the offsets have the same
homology. -/
theorem isIso_offsetModule_map_of_noCritical {D : ℕ} {K : Set (EuclideanSpace ℝ (Fin D))}
    (hK : IsCompact K) (hK' : K.Nonempty) {a b : ℝ} (ha : 0 < a) (hab : a ≤ b)
    (hcrit : ∀ x, IsDistCritical K x → infDist x K ∉ Set.Icc a b) (p : ℕ) :
    IsIso ((offsetModule 𝕜 K p).map (homOfLE hab)) := by
  sorry

/-- **Offsets below the reach**: from `K` itself up to any radius below the reach, the offsets
have the homology of `K`. -/
theorem isIso_offsetModule_map_of_lt_reach {D : ℕ} {K : Set (EuclideanSpace ℝ (Fin D))}
    (hK : IsCompact K) (hK' : K.Nonempty) {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b)
    (hb : ENNReal.ofReal b < reach K) (p : ℕ) :
    IsIso ((offsetModule 𝕜 K p).map (homOfLE hab)) := by
  sorry

/-- **The Gromov–Hausdorff distance by correspondences.** -/
theorem ghDist_eq_iInf_distortion (X Y : Type) [MetricSpace X] [CompactSpace X] [Nonempty X]
    [MetricSpace Y] [CompactSpace Y] [Nonempty Y] :
    ENNReal.ofReal (GromovHausdorff.ghDist X Y) =
      (⨅ (C : Set (X × Y)) (_ : IsCorrespondence C), distortion C) / 2 := by
  sorry

end Offsets

/-! ## Layer 6: Čech and Vietoris–Rips complexes and the nerve -/

section Complexes

variable {𝕜 : Type} [Field 𝕜] {ι : Type}

/-- The Vietoris–Rips complex of a family of points: faces of diameter at most `2 r`. -/
def ripsComplex {E : Type} [PseudoMetricSpace E] (x : ι → E) (r : ℝ) :
    PreAbstractSimplicialComplex ι where
  faces := {σ | σ.Nonempty ∧ ∀ a ∈ σ, ∀ b ∈ σ, dist (x a) (x b) ≤ 2 * r}
  isRelLowerSet_faces := fun _ hσ =>
    ⟨hσ.1, fun _ hτσ hτ => ⟨hτ, fun a ha b hb => hσ.2 a (hτσ ha) b (hτσ hb)⟩⟩

/-- The (ambient) Čech complex: faces whose closed balls of radius `r` meet. -/
def cechComplex {E : Type} [PseudoMetricSpace E] (x : ι → E) (r : ℝ) :
    PreAbstractSimplicialComplex ι where
  faces := {σ | σ.Nonempty ∧ ∃ z, ∀ a ∈ σ, dist (x a) z ≤ r}
  isRelLowerSet_faces := fun _ hσ =>
    ⟨hσ.1, fun _ hτσ hτ => ⟨hτ, hσ.2.imp fun _ hz a ha => hz a (hτσ ha)⟩⟩

variable (𝕜) in
/-- Rips persistence of a family of points. -/
def ripsModule {E : Type} [PseudoMetricSpace E] (x : ι → E) (p : ℕ) : PersistenceModule 𝕜 :=
  complexFiltrationModule 𝕜 (ripsComplex x)
    (fun _ _ h _ hσ => ⟨hσ.1, fun a ha b hb => (hσ.2 a ha b hb).trans (by linarith)⟩) p

variable (𝕜) in
/-- Čech persistence of a family of points. -/
def cechModule {E : Type} [PseudoMetricSpace E] (x : ι → E) (p : ℕ) : PersistenceModule 𝕜 :=
  complexFiltrationModule 𝕜 (cechComplex x)
    (fun _ _ h _ hσ => ⟨hσ.1, hσ.2.imp fun _ hz a ha => (hz a ha).trans h⟩) p

/-- The nerve of a family of nonempty sets. -/
def nerveComplex {X : Type} (U : ι → Set X) (hU : ∀ i, (U i).Nonempty) :
    AbstractSimplicialComplex ι where
  faces := {σ | σ.Nonempty ∧ (⋂ i ∈ σ, U i).Nonempty}
  isRelLowerSet_faces := fun _ hσ =>
    ⟨hσ.1, fun _ hτσ hτ => ⟨hτ, hσ.2.mono (Set.biInter_subset_biInter_left hτσ)⟩⟩
  singleton_mem v := ⟨Finset.singleton_nonempty v, by simpa using hU v⟩

/-- **Čech and Rips complexes interleave** in every metric space. -/
theorem cechComplex_le_ripsComplex_le {E : Type} [PseudoMetricSpace E] (x : ι → E) (r : ℝ) :
    cechComplex x r ≤ ripsComplex x r ∧ ripsComplex x r ≤ cechComplex x (2 * r) := by
  sorry

/-- **The Vietoris–Rips lemma** in Euclidean space. -/
theorem ripsComplex_le_cechComplex_sqrt_two {E : Type} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] (x : ι → E) (r : ℝ) :
    ripsComplex x r ≤ cechComplex x (Real.sqrt 2 * r) := by
  sorry

/-- **The nerve lemma** for finite open covers with contractible finite intersections. -/
theorem nonempty_iso_homology_nerveComplex [LinearOrder ι] [Finite ι] (X : TopCat.{0})
    (U : ι → Set X) (hUo : ∀ i, IsOpen (U i)) (hU : ∀ i, (U i).Nonempty)
    (hc : ∀ σ : Finset ι, σ.Nonempty → (⋂ i ∈ σ, U i).Nonempty →
      ContractibleSpace (⋂ i ∈ σ, U i)) (p : ℕ) :
    Nonempty ((TauCeti.orderedSimplicialChainComplex (nerveComplex U hU) 𝕜).homology p ≅
      ((singularHomologyFunctor (ModuleCat.{0} 𝕜) p).obj (ModuleCat.of 𝕜 𝕜)).obj
        (TopCat.of (⋃ i, U i))) := by
  sorry

/-- **Čech persistence is offset persistence** for finite nonempty point sets in Euclidean
space. -/
theorem nonempty_iso_cechModule_offsetModule [Finite ι] [Nonempty ι] {D : ℕ}
    (x : ι → EuclideanSpace ℝ (Fin D)) (p : ℕ) :
    Nonempty (cechModule 𝕜 x p ≅ offsetModule 𝕜 (Set.range x) p) := by
  sorry

/-- **Gromov–Hausdorff stability of Rips persistence.** -/
theorem bottleneckDist_ripsModule_le_ghDist (X Y : Type) [MetricSpace X] [CompactSpace X]
    [Nonempty X] [MetricSpace Y] [CompactSpace Y] [Nonempty Y] (p : ℕ) :
    IsQTame (ripsModule 𝕜 (id : X → X) p) ∧
      bottleneckDist (rankDiagram (ripsModule 𝕜 (id : X → X) p))
        (rankDiagram (ripsModule 𝕜 (id : Y → Y) p)) ≤
        ENNReal.ofReal (GromovHausdorff.ghDist X Y) := by
  sorry

/-- A minimum spanning tree of a finite metric space. -/
def IsMinSpanningTree {X : Type} [PseudoMetricSpace X] (T : SimpleGraph X) : Prop :=
  T.IsTree ∧ ∀ T' : SimpleGraph X, T'.IsTree →
    ∑ᶠ e ∈ T.edgeSet, Sym2.lift ⟨fun a b => dist a b, fun a b => dist_comm a b⟩ e ≤
      ∑ᶠ e ∈ T'.edgeSet, Sym2.lift ⟨fun a b => dist a b, fun a b => dist_comm a b⟩ e

/-- **Zero-dimensional persistence is single linkage**: the number of Rips components at scale
`r` is one more than the number of minimum-spanning-tree edges longer than `2 r`. -/
theorem rankInv_ripsModule_zero_eq {X : Type} [MetricSpace X] [Finite X] [Nonempty X]
    (T : SimpleGraph X) (hT : IsMinSpanningTree T) {r : ℝ} (hr : 0 ≤ r) :
    rankInv (ripsModule 𝕜 (id : X → X) 0) r r =
      {e ∈ T.edgeSet | 2 * r < Sym2.lift ⟨fun a b => dist a b, fun a b => dist_comm a b⟩ e}.encard
        + 1 := by
  sorry

end Complexes

/-! ## Layer 7: homology inference -/

section Inference

variable {𝕜 : Type} [Field 𝕜] {ι : Type}

/-- **The Niyogi–Smale–Weinberger theorem** for a noiseless sample of a compact submanifold. The
condition `2 ε < r < √(3/5) τ` implies `ε < √(3/20) τ`. -/
theorem exists_deformationRetraction_offset {D d : ℕ} {N : Type} [TopologicalSpace N]
    [ChartedSpace (EuclideanSpace ℝ (Fin d)) N] [IsManifold (modelWithCornersSelf ℝ
      (EuclideanSpace ℝ (Fin d))) ∞ N] [CompactSpace N] {j : N → EuclideanSpace ℝ (Fin D)}
    (hj : Manifold.IsSmoothEmbedding (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin d)))
      (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin D))) ∞ j)
    {τ : ℝ} (hτ : 0 < τ) (hreach : ENNReal.ofReal τ ≤ reach (Set.range j))
    (P : Finset (EuclideanSpace ℝ (Fin D))) (hP : P.Nonempty)
    (hPM : (P : Set (EuclideanSpace ℝ (Fin D))) ⊆ Set.range j) {ε : ℝ}
    (hε : hausdorffDist (P : Set (EuclideanSpace ℝ (Fin D))) (Set.range j) ≤ ε)
    {r : ℝ} (hr : r ∈ Set.Ioo (2 * ε) (Real.sqrt (3 / 5) * τ)) :
    ∃ hM : Set.range j ⊆ cthickening r (P : Set (EuclideanSpace ℝ (Fin D))),
      ∃ ρ : C(cthickening r (P : Set (EuclideanSpace ℝ (Fin D))), Set.range j),
        (∀ x, ρ (Set.inclusion hM x) = x) ∧
        (ContinuousMap.id _).HomotopicRel ((ContinuousMap.inclusion hM).comp ρ)
          (Set.range (Set.inclusion hM)) := by
  sorry

/-- **Homology inference under positive weak feature size** (Chazal–Lieutier). -/
theorem nonempty_range_offsetModule_equiv {D : ℕ} {K P : Set (EuclideanSpace ℝ (Fin D))}
    (hK : IsCompact K) (hK' : K.Nonempty) (hP : P.Finite) (hP' : P.Nonempty) {ε i j r : ℝ}
    (hε : hausdorffDist K P ≤ ε) (hεi : ε < i) (hij : i + 2 * ε ≤ j)
    (hj : ENNReal.ofReal (j + ε) < wfs K) (hr : 0 < r) (hrw : ENNReal.ofReal r < wfs K) (p : ℕ) :
    Nonempty (LinearMap.range ((offsetModule 𝕜 P p).map
      (homOfLE (by have := hausdorffDist_nonneg.trans hε; linarith : i ≤ j))).hom ≃ₗ[𝕜] (offsetModule 𝕜 K p).obj r) := by
  sorry

/-- **Rips inference under positive weak feature size.** -/
theorem nonempty_range_ripsModule_equiv [Finite ι] [Nonempty ι] {D : ℕ}
    {K : Set (EuclideanSpace ℝ (Fin D))} (hK : IsCompact K) (hK' : K.Nonempty)
    (x : ι → EuclideanSpace ℝ (Fin D)) {ε a b r : ℝ}
    (hε : hausdorffDist K (Set.range x) ≤ ε) (hεa : ε < a) (hab : 2 * a + 2 * ε ≤ b)
    (hb : ENNReal.ofReal (2 * b + ε) < wfs K) (hr : 0 < r) (hrw : ENNReal.ofReal r < wfs K)
    (p : ℕ) :
    Nonempty (LinearMap.range ((ripsModule 𝕜 x p).map
      (homOfLE (by have := hausdorffDist_nonneg.trans hε; linarith : a ≤ b))).hom ≃ₗ[𝕜]
        (offsetModule 𝕜 K p).obj r) := by
  sorry

/-- **Rips pairs below the reach**: the rank of `H_p(Rips(α)) → H_p(Rips(2α))` is the dimension
of `H_p(K)`. -/
theorem rankInv_ripsModule_eq_of_reach [Finite ι] [Nonempty ι] {D : ℕ}
    {K : Set (EuclideanSpace ℝ (Fin D))} (hK : IsCompact K) (hK' : K.Nonempty)
    (x : ι → EuclideanSpace ℝ (Fin D)) {ε α τ : ℝ} (hε : hausdorffDist K (Set.range x) ≤ ε)
    (hτ : ENNReal.ofReal τ ≤ reach K) (hεα : (2 + Real.sqrt 2) * ε ≤ α)
    (hατ : 2 * Real.sqrt 2 * α + ε < τ) (p : ℕ) :
    rankInv (ripsModule 𝕜 x p) α (2 * α) =
      Cardinal.toENat (Module.rank 𝕜 ((offsetModule 𝕜 K p).obj 0)) := by
  sorry

end Inference

/-! ## Layer 8: statistics of diagrams and distance functions -/

section Statistics

variable {E : Type} [MetricSpace E] [MeasurableSpace E] [BorelSpace E]

/-- The smallest radius of a closed ball about `x` of mass at least `u`, `⊤` if none. -/
def massRadius (μ : Measure E) (x : E) (u : ℝ≥0∞) : ℝ≥0∞ :=
  ⨅ (r : ℝ≥0) (_ : u ≤ μ (closedBall x r)), (r : ℝ≥0∞)

/-- The distance to a measure at mass `m`: the root mean square of the mass radii over
`u ∈ (0, m]`. -/
def dtm (μ : Measure E) (m : ℝ) (x : E) : ℝ≥0∞ :=
  ((ENNReal.ofReal m)⁻¹ * ∫⁻ u in Set.Ioc (0 : ℝ) m, massRadius μ x (ENNReal.ofReal u) ^ 2)
    ^ (1 / 2 : ℝ)

/-- The `i`-th smallest distance from `x` to the points of a sample (from `0`). -/
def kNNDist {n : ℕ} (X : Fin n → E) (x : E) (i : ℕ) : ℝ :=
  (Multiset.sort (Finset.univ.val.map fun j => dist x (X j))).getD i 0

/-- The tent function of a bar. -/
def tent (p : ℝ × ℝ) (t : ℝ) : ℝ := max 0 (min (t - p.1) (p.2 - t))

/-- The `k`-th landscape function (from `0`): the `k`-th largest tent value. -/
def landscape (D : Multiset (ℝ × ℝ)) (k : ℕ) (t : ℝ) : ℝ :=
  (Multiset.sort (D.map fun p => tent p t)).reverse.getD k 0

/-- The diagram of a finite multiset of real bars; bars with `d ≤ b` are dropped. -/
def Diagram.ofMultiset (D : Multiset (ℝ × ℝ)) : Diagram := fun x =>
  ((D.filter fun q => ((q.1 : EReal), (q.2 : EReal)) = x.1).card : ℕ∞)

/-- **Stability of the distance to a measure** in `W₂`. -/
theorem dtm_le_add_wassersteinEDist (μ ν : Measure E) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] {m : ℝ} (hm : 0 < m) (hm1 : m ≤ 1) (x : E) :
    dtm μ m x ≤ dtm ν m x + (ENNReal.ofReal m) ^ (-(1 / 2 : ℝ)) * TauCeti.wassersteinEDist 2 μ ν := by
  sorry

/-- **The distance to a measure is `1`-Lipschitz.** -/
theorem dtm_le_add_edist (μ : Measure E) [IsProbabilityMeasure μ] {m : ℝ} (hm : 0 < m)
    (hm1 : m ≤ 1) (x y : E) : dtm μ m x ≤ dtm μ m y + edist x y := by
  sorry

/-- **The empirical distance to a measure** is the root mean square of the `k` nearest-neighbour
distances. -/
theorem dtm_empirical_sq {n k : ℕ} (X : Fin n → E) (hk : 1 ≤ k) (hkn : k ≤ n) (x : E) :
    dtm ((n : ℝ≥0∞)⁻¹ • ∑ i, Measure.dirac (X i)) (k / n) x ^ (2 : ℝ) =
      ENNReal.ofReal ((1 / k) * ∑ i ∈ Finset.range k, kNNDist X x i ^ 2) := by
  sorry

/-- **Landscape stability.** -/
theorem abs_landscape_sub_le (D D' : Multiset (ℝ × ℝ)) (k : ℕ) (t : ℝ) :
    ENNReal.ofReal |landscape D k t - landscape D' k t| ≤
      bottleneckDist (Diagram.ofMultiset D) (Diagram.ofMultiset D') := by
  sorry

/-- **Landscapes are `1`-Lipschitz and bounded** by half the longest bar. -/
theorem landscape_lipschitz_bounded (D : Multiset (ℝ × ℝ)) (k : ℕ) (s t : ℝ) {c : ℝ}
    (hc : 0 ≤ c) (hD : ∀ p ∈ D, p.2 - p.1 ≤ 2 * c) :
    |landscape D k t - landscape D k s| ≤ |t - s| ∧ 0 ≤ landscape D k t ∧
      landscape D k t ≤ c := by
  sorry

/-- **The sampling bound** for an `(a, b)`-standard law with compact support `S`. -/
theorem measure_hausdorffDist_gt_le (μ : Measure E) [IsProbabilityMeasure μ] {S : Set E}
    (hS : IsCompact S) (hμS : μ Sᶜ = 0) {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hstd : ∀ x ∈ S, ∀ r > 0, ENNReal.ofReal (min 1 (a * r ^ b)) ≤ μ (closedBall x r))
    {ε : ℝ} (hε : 0 < ε) (n : ℕ) :
    Measure.pi (fun _ : Fin n => μ) {X | ε < hausdorffDist (Set.range X) S} ≤
      ENNReal.ofReal (max 1 (4 ^ b / (a * ε ^ b)) *
        Real.exp (-(n * min 1 (a * ε ^ b / 2 ^ b)))) := by
  sorry

/-- **The rate of the Hausdorff estimator** of the support of an `(a, b)`-standard law. -/
theorem lintegral_hausdorffDist_le {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∃ C > 0, ∀ (E : Type) [MetricSpace E] [MeasurableSpace E] [BorelSpace E]
      (μ : Measure E) [IsProbabilityMeasure μ] (S : Set E), IsCompact S → μ Sᶜ = 0 →
      (∀ x ∈ S, ∀ r > 0, ENNReal.ofReal (min 1 (a * r ^ b)) ≤ μ (closedBall x r)) →
      ∀ n : ℕ, 2 ≤ n →
        ∫⁻ X, ENNReal.ofReal (hausdorffDist (Set.range X) S) ∂Measure.pi (fun _ : Fin n => μ) ≤
          ENNReal.ofReal (C * (Real.log n / n) ^ (1 / b)) := by
  sorry

end Statistics

-- Supplier declarations and other names that the README cites.

#check @Monotone.functor
#check @AlgebraicTopology.singularHomologyFunctor
#check @ModuleCat
#check @Module.rank
#check @Cardinal.toENat
#check @Preorder.smallCategory
#check @AbstractSimplicialComplex
#check @PreAbstractSimplicialComplex
#check @Metric.hausdorffDist
#check @Metric.infDist
#check @Metric.cthickening
#check @Metric.infDist_le_infDist_add_hausdorffDist
#check @Metric.hausdorffDist_le_of_infDist
#check @GromovHausdorff.ghDist
#check @GromovHausdorff.ghDist_le_hausdorffDist
#check @Matrix.rank
#check @Matrix.BlockTriangular
#check @SimpleGraph.IsTree
#check @Manifold.IsSmoothEmbedding
#check @MeasureTheory.Measure.support
#check @MeasureTheory.Measure.pi
#check @TauCeti.wassersteinEDist
#check @TauCeti.orderedSimplicialChainComplex
#check @AbstractSimplicialComplex.Realization
#check @TauCeti.quasiIso_cechTotalAugmentation
#check @TauCeti.isZero_singularHomologyFunctor_of_contractibleSpace
#check @ModuleCat.finrank_singularHomology_of_contractibleSpace
#check @ChainComplex.eulerChar_eq_homologyEulerChar
#check @TauCeti.sublevelInclusion
#check @TauCeti.exists_sublevelHomotopyEquiv
#check @TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation
#check @TauCeti.IsMorse
#check @TauCeti.criticalPoints
#check @TauCeti.manifoldMorseIndex
#check @TauCeti.gabrielIndecomposableEquivPositiveRoot
#check @TauCeti.exists_equiv_linearEquiv_of_isLocalRing_end
#check @TopCat
#check @ENNReal.Lp_add_le
#check @TauCeti.orderedSimplicialHomologyIsoSingularHomology
#check @TauCeti.cellularChainComplexRealizationIso
#check @MeasureTheory.Measure.hausdorffMeasure
#check @MeasureTheory.hausdorffMeasure_pi_real
#check @TauCeti.cechSingularChainsMap
#check @convexHull
#check @EReal.toReal

end TauCetiRoadmap.TopologicalDataAnalysis
