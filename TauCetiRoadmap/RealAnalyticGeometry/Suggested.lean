import Mathlib
import TauCeti.Analysis.Analytic.Submanifold.Basic
import TauCeti.Geometry.Manifold.Complex.LeviForm
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function
import TauCeti.Geometry.RealAnalytic.Semianalytic.Basic
import TauCeti.Geometry.RealAnalytic.Semianalytic.Manifold
import TauCeti.Geometry.RealAnalytic.Semianalytic.PartiallySemialgebraic
import TauCeti.LinearAlgebra.Projectivization.AffineChart

/-!
# Real-analytic geometry and semianalytic triangulation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`, which is the definitive
specification; this file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti APIs, each with `sorry`, and is read as suggested forms, never as an exhaustive checklist.

Stated here:

* Łojasiewicz's triangulation theorem in affine space (Theorem 1, README §2.0h),
  `exists_affine_semianalytic_triangulation`;
* the bounded semialgebraic triangulation theorem (Theorem 3, README §2.1),
  `bounded_semialgebraic_analytic_triangulation`, with the structure
  `FiniteCompatibleAnalyticTriangulation` it produces;
* the real multiprojective triangulation theorem (Theorem 4, README §2.1b),
  `exists_multiprojective_semialgebraic_triangulation`, with the semialgebraic subsets and maps of
  README §2.1a (`IsMultiprojectiveSemialgebraic`, `IsMultiprojectiveSemialgebraicOn`) and the
  standard product charts read through Tau Ceti's `Projectivization.affineChart`
  (`multiprojectiveChart`, `multiprojectiveChartSymm`), on Mathlib's quotient topology;
* the Stein criterion (README §3.1), `isStein_of_strictlyPlurisubharmonic_exhaustion`, with the
  Stein predicate `IsStein` of README Convention 8 and the `holomorphicHull` it uses;
* Grauert's proper real-analytic embedding theorem (README §4.2),
  `grauert_proper_real_analytic_embedding`, with the structure `ProperRealAnalyticEmbedding`;
* Łojasiewicz's manifold theorem (Theorem 2, README §5.2),
  `exists_manifold_semianalytic_triangulation`, with the chartwise analytic submanifolds and maps of
  README §0.2 (`ChartwiseRealAnalyticSubmanifold`, `AnalyticOnSubmanifoldInto`,
  `ChartwiseAnalyticOn`) and property (A) for maps into a manifold (`HasManifoldPropertyA`).

Not statable at the pins:

* The Stein property of the strictly plurisubharmonic tube around a real-analytic manifold in its
  complexification (README §§3.0–3.1): there is no complexification of a real-analytic manifold (a
  complex manifold with an antiholomorphic involution whose fixed locus is the given manifold).
* Hörmander's weighted `L²` estimate for `∂̄` on complete Kähler manifolds (README §3.1): there are
  no square-integrable bundle-valued `(n, k)`-forms on a Kähler manifold, no curvature operator
  `[iΘ(E) + i∂∂̄φ, Λ]` and no maximal `∂̄` with its Hilbert adjoint.
* Cartan's theorems A and B on Stein manifolds (README §3.2): there is no coherent analytic sheaf,
  the coherence predicate over the holomorphic structure sheaf and its module calculus being
  README §3.2, item 0.
-/

noncomputable section
open scoped ContDiff Manifold

namespace TauCetiRoadmap.RealAnalyticGeometry

/-- Real affine coordinates `ℝⁿ`, the coordinate space on which the analytic-submanifold,
semianalytic and semialgebraic carriers of Tau Ceti are stated. -/
abbrev RealCoordinates (n : ℕ) := Fin n → ℝ

/-! ## Layer 0: real-analytic germs and chartwise submanifolds -/

/-- **Chartwise analytic submanifolds** (README §0.2). With a fixed continuous real-linear
equivalence `e : E ≃L[ℝ] ℝⁿ`, a subset `S` of a manifold `M` modelled on `I` is a `d`-dimensional
analytic submanifold of `M` when it is nonempty and, for each `x ∈ S`, the image of `S` under the
extended chart at `x` followed by `e` meets some open `U ⊆ ℝⁿ`, containing the image of `x` and
contained in the image of the chart's target, in a `d`-dimensional analytic submanifold of `ℝⁿ`.
For `M = ℝⁿ` with its identity chart it is `TauCeti.IsAnalyticSubmanifold d S`. -/
def ChartwiseRealAnalyticSubmanifold {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M] (I : ModelWithCorners ℝ E H)
    {n : ℕ} (e : E ≃L[ℝ] RealCoordinates n) (d : ℕ) (S : Set M) : Prop :=
  S.Nonempty ∧ ∀ x ∈ S, ∃ U : Set (RealCoordinates n), IsOpen U ∧ e (extChartAt I x x) ∈ U ∧
    U ⊆ e '' (extChartAt I x).target ∧
    TauCeti.IsAnalyticSubmanifold d (U ∩ e '' (extChartAt I x '' (S ∩ (extChartAt I x).source)))

/-- **Analytic maps into a manifold** (README §0.2). A map `f : ℝᴺ → M` is analytic on `T ⊆ ℝᴺ` in
dimension `d` when each `p ∈ T` has an open neighbourhood `V` such that `f` maps `V ∩ T` into the
source of the extended chart at `f p`, and the expression of `f` in that chart, followed by `e`, is
analytic on `V ∩ T` in the sense of `TauCeti.AnalyticOnSubmanifold`. -/
def AnalyticOnSubmanifoldInto {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M] (I : ModelWithCorners ℝ E H)
    {n N : ℕ} (e : E ≃L[ℝ] RealCoordinates n) (d : ℕ) (f : RealCoordinates N → M)
    (T : Set (RealCoordinates N)) : Prop :=
  ∀ p ∈ T, ∃ V : Set (RealCoordinates N), IsOpen V ∧ p ∈ V ∧
    Set.MapsTo f (V ∩ T) (extChartAt I (f p)).source ∧
    TauCeti.AnalyticOnSubmanifold d (fun q => e (extChartAt I (f p) (f q))) (V ∩ T)

/-- **Analytic maps out of a subset of a manifold** (README §0.2). A map `g : M → ℝᴺ` is analytic
on `S ⊆ M` in dimension `d` when, for each `x ∈ S`, its expression through the inverses of `e` and
of the extended chart at `x` is analytic, in the sense of `TauCeti.AnalyticOnSubmanifold`, on the
chart image of `S` intersected with some open `U ⊆ ℝⁿ` containing the image of `x` and contained in
the image of the chart's target. -/
def ChartwiseAnalyticOn {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M] (I : ModelWithCorners ℝ E H)
    {n N : ℕ} (e : E ≃L[ℝ] RealCoordinates n) (d : ℕ) (g : M → RealCoordinates N) (S : Set M) :
    Prop :=
  ∀ x ∈ S, ∃ U : Set (RealCoordinates n), IsOpen U ∧ e (extChartAt I x x) ∈ U ∧
    U ⊆ e '' (extChartAt I x).target ∧
    TauCeti.AnalyticOnSubmanifold d (fun v => g ((extChartAt I x).symm (e.symm v)))
      (U ∩ e '' (extChartAt I x '' (S ∩ (extChartAt I x).source)))

/-! ## Layer 2: Łojasiewicz's theorem in affine space and the semialgebraic theorems -/

/-- **Łojasiewicz's triangulation theorem in affine space** (Łojasiewicz 1964, §3, Theorem 1,
printed p. 463), in affine coordinates `ℝⁿ`. For a locally finite family `B` of semianalytic
subsets of `ℝⁿ` there are a locally finite simplicial complex `K` in `ℝⁿ` with `|K| = ℝⁿ` and a
homeomorphism `τ` of `ℝⁿ` with property (A), that is, its graph `{(y, x) | y = τ x}`, with base
the target and fibre the source, is partially semialgebraic, such that `τ` maps every open simplex
(the intrinsic interior of a face) analytically isomorphically onto an analytic submanifold of the
same dimension, contained in or disjoint from each `B ν`. -/
theorem exists_affine_semianalytic_triangulation {n : ℕ} {ι : Type*}
    (B : ι → Set (RealCoordinates n)) (hB : ∀ ν, TauCeti.IsSemianalytic (B ν))
    (hlf : LocallyFinite B) :
    ∃ (K : Geometry.SimplicialComplex ℝ (RealCoordinates n))
      (τ : RealCoordinates n ≃ₜ RealCoordinates n),
      K.space = Set.univ ∧
      LocallyFinite (fun s : K.faces => convexHull ℝ (s : Set (RealCoordinates n))) ∧
      TauCeti.IsPartiallySemialgebraic {p : RealCoordinates n × (Fin n → ℝ) | p.1 = τ p.2} ∧
      ∀ s ∈ K.faces,
        TauCeti.IsAnalyticSubmanifold (s.card - 1)
            (τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))) ∧
          TauCeti.AnalyticOnSubmanifold (s.card - 1) τ
            (intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))) ∧
          TauCeti.AnalyticOnSubmanifold (s.card - 1) τ.symm
            (τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))) ∧
          ∀ ν, τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ B ν ∨
            τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ (B ν)ᶜ := by
  sorry

/-- A finite affine triangulation of `⋃ i, closure (B i)` with the conditions of the bounded
theorem: a finite simplicial complex in `ℝⁿ`, a homeomorphism from its support onto the union of
the closures whose graph is semialgebraic, analytic isomorphisms of the open simplices onto
analytic submanifolds of the same dimension, and compatibility with every `B i`. The total maps
`forward` and `inverse` extend the homeomorphism and its inverse so that the graph and
submanifold APIs apply; their values off the support and off the union are unrestricted. -/
structure FiniteCompatibleAnalyticTriangulation {n k : ℕ}
    (B : Fin k → Set (RealCoordinates n)) where
  /-- The simplicial complex, in the original coordinates. -/
  complex : Geometry.SimplicialComplex ℝ (RealCoordinates n)
  /-- The complex is finite. -/
  finite_faces : complex.faces.Finite
  /-- The triangulating homeomorphism from the support onto the union of the closures. -/
  homeomorph : complex.space ≃ₜ (⋃ i, closure (B i))
  /-- A total extension of the homeomorphism. -/
  forward : RealCoordinates n → RealCoordinates n
  /-- A total extension of its inverse. -/
  inverse : RealCoordinates n → RealCoordinates n
  /-- `forward` agrees with the homeomorphism on the support. -/
  forward_agrees : ∀ x : complex.space, forward x = (homeomorph x).val
  /-- `inverse` agrees with the inverse homeomorphism on the union of the closures. -/
  inverse_agrees : ∀ y : (⋃ i, closure (B i)), inverse y = (homeomorph.symm y).val
  /-- The homeomorphism has semialgebraic graph over the support. -/
  semialgebraic : TauCeti.IsSemialgebraicOn forward complex.space
  /-- Each open simplex and its image are analytic submanifolds of dimension `card s - 1`, and the
  homeomorphism and its inverse are analytic on them. -/
  analytic_simplex : ∀ s ∈ complex.faces,
    let U := intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))
    TauCeti.IsAnalyticSubmanifold (s.card - 1) U ∧
      TauCeti.IsAnalyticSubmanifold (s.card - 1) (forward '' U) ∧
      TauCeti.AnalyticOnSubmanifold (s.card - 1) forward U ∧
      TauCeti.AnalyticOnSubmanifold (s.card - 1) inverse (forward '' U)
  /-- The image of each open simplex lies in `B i` or in its complement. -/
  compatible : ∀ s ∈ complex.faces, ∀ i,
    forward '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ B i ∨
      forward '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ (B i)ᶜ

/-- **The bounded semialgebraic triangulation theorem** (Łojasiewicz 1964, §3, Theorem 3, printed
p. 464). For finitely many bounded semialgebraic subsets `B i` of `ℝⁿ`, not necessarily closed,
the union of their closures has a finite triangulation by a complex in `ℝⁿ` itself, through a
homeomorphism with semialgebraic graph that is an analytic isomorphism on every open simplex and is
compatible with every `B i`. -/
theorem bounded_semialgebraic_analytic_triangulation {n k : ℕ}
    (B : Fin k → Set (RealCoordinates n))
    (hB : ∀ i, TauCeti.IsSemialgebraic (B i))
    (hb : ∀ i, Bornology.IsBounded (B i)) :
    Nonempty (FiniteCompatibleAnalyticTriangulation B) := by
  sorry

/-- The finite product `∏ i, ℝP^(n i)` of real projective spaces, each factor Mathlib's
projectivization of `ℝ^(n i + 1)` with its quotient topology, and the product with the product
topology. -/
abbrev Multiprojective {m : ℕ} (n : Fin m → ℕ) : Type :=
  (i : Fin m) → Projectivization ℝ (Fin (n i + 1) → ℝ)

/-- **Semialgebraic subsets of a multiprojective space** (README §2.1a): `S` is semialgebraic when
its preimage under the product of the quotient maps from nonzero vectors is semialgebraic in the
flattened homogeneous coordinates `(Σ i, Fin (n i + 1)) → ℝ`. -/
def IsMultiprojectiveSemialgebraic {m : ℕ} {n : Fin m → ℕ} (S : Set (Multiprojective n)) : Prop :=
  TauCeti.IsSemialgebraic {v : ((i : Fin m) × Fin (n i + 1)) → ℝ |
    ∃ h : ∀ i, (fun j => v ⟨i, j⟩) ≠ 0,
      (fun i => Projectivization.mk ℝ (fun j => v ⟨i, j⟩) (h i)) ∈ S}

/-- **Semialgebraic maps into a multiprojective space** (README §2.1a): `f` is semialgebraic on
`D ⊆ ℝᴺ` when its graph over `D`, a subset of the mixed space `ℝᴺ × ∏ i, ℝP^(n i)`, has
semialgebraic preimage under the quotient maps on the second factor, in the coordinates indexed by
`Fin N ⊕ (Σ i, Fin (n i + 1))`. -/
def IsMultiprojectiveSemialgebraicOn {N m : ℕ} {n : Fin m → ℕ}
    (f : RealCoordinates N → Multiprojective n) (D : Set (RealCoordinates N)) : Prop :=
  TauCeti.IsSemialgebraic {w : (Fin N ⊕ (i : Fin m) × Fin (n i + 1)) → ℝ |
    (fun k => w (Sum.inl k)) ∈ D ∧ ∃ h : ∀ i, (fun j => w (Sum.inr ⟨i, j⟩)) ≠ 0,
      f (fun k => w (Sum.inl k)) =
        fun i => Projectivization.mk ℝ (fun j => w (Sum.inr ⟨i, j⟩)) (h i)}

/-- The standard product affine chart of `∏ i, ℝP^(n i)` for the choice `I` of a homogeneous
coordinate in each factor: the product of the charts `Projectivization.affineChart (I i)`, which
send `[v]` to the ratios `v (Fin.succAbove (I i) j) / v (I i)`, flattened by `finSigmaFinEquiv` to
`ℝ^(∑ i, n i)`. It is meaningful on the product of the affine opens
`Projectivization.affineOpen (I i)`. -/
def multiprojectiveChart {m : ℕ} {n : Fin m → ℕ} (I : (i : Fin m) → Fin (n i + 1))
    (p : Multiprojective n) : RealCoordinates (∑ i, n i) :=
  fun k => Projectivization.affineChart (I (finSigmaFinEquiv.symm k).1)
    (p (finSigmaFinEquiv.symm k).1) (finSigmaFinEquiv.symm k).2

/-- The inverse of `multiprojectiveChart I`: the point whose `i`-th factor is
`[Fin.insertNth (I i) 1 zᵢ]`, where `zᵢ` is the `i`-th block of `z`. -/
def multiprojectiveChartSymm {m : ℕ} {n : Fin m → ℕ} (I : (i : Fin m) → Fin (n i + 1))
    (z : RealCoordinates (∑ i, n i)) : Multiprojective n :=
  fun i => (Projectivization.affineChart (I i)).symm (fun j => z (finSigmaFinEquiv ⟨i, j⟩))

/-- **The real multiprojective triangulation theorem** (Łojasiewicz 1964, §3, Theorem 4, printed
p. 464). For finitely many semialgebraic subsets `B j` of a finite product `M` of real projective
spaces there are a finite simplicial complex `K` in some `ℝᴺ` and a homeomorphism `τ : |K| → M`
onto `M`, with semialgebraic graph, compatible with every `B j`, such that for every open simplex
`σ` of dimension `d` and every standard product chart, on each nonempty part `W` of `σ` mapped into
the chart's domain, the chart expression of `τ` is an analytic isomorphism of `W` onto a
`d`-dimensional analytic submanifold. The total maps `f` and `g` extend `τ` and its inverse. -/
theorem exists_multiprojective_semialgebraic_triangulation {m k : ℕ} {n : Fin m → ℕ}
    (B : Fin k → Set (Multiprojective n)) (hB : ∀ j, IsMultiprojectiveSemialgebraic (B j)) :
    ∃ (N : ℕ) (K : Geometry.SimplicialComplex ℝ (RealCoordinates N))
      (τ : K.space ≃ₜ Multiprojective n) (f : RealCoordinates N → Multiprojective n)
      (g : Multiprojective n → RealCoordinates N),
      K.faces.Finite ∧ (∀ x : K.space, f x = τ x) ∧
      (∀ y, g y = (τ.symm y : RealCoordinates N)) ∧
      IsMultiprojectiveSemialgebraicOn f K.space ∧
      ∀ s ∈ K.faces,
        let σ := intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates N)))
        (∀ j, f '' σ ⊆ B j ∨ f '' σ ⊆ (B j)ᶜ) ∧
          ∀ I : (i : Fin m) → Fin (n i + 1),
            let W := σ ∩ f ⁻¹' {p | ∀ i, p i ∈ Projectivization.affineOpen (I i)}
            W.Nonempty →
              TauCeti.IsAnalyticSubmanifold (s.card - 1) (multiprojectiveChart I '' (f '' W)) ∧
                TauCeti.AnalyticOnSubmanifold (s.card - 1) (multiprojectiveChart I ∘ f) W ∧
                TauCeti.AnalyticOnSubmanifold (s.card - 1) (g ∘ multiprojectiveChartSymm I)
                  (multiprojectiveChart I '' (f '' W)) := by
  sorry

/-! ## Layer 3: complexification, Stein theory and coherent sheaves -/

/-- The holomorphic hull of a set `K` in a complex manifold `X` modelled on `E`: the points `x` such
that every global holomorphic function `f` satisfies `‖f x‖ ≤ ‖f y‖` for some `y ∈ K`. For compact
nonempty `K` this is the condition `|f(x)| ≤ sup_K |f|`. -/
def holomorphicHull {E X : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [TopologicalSpace X]
    [ChartedSpace E X] (K : Set X) : Set X :=
  {x | ∀ f : X → ℂ, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ) f → ∃ y ∈ K, ‖f x‖ ≤ ‖f y‖}

/-- **Stein manifolds** (README Convention 8 and §3.0). A complex manifold `X` modelled on `E` is
Stein when it is holomorphically convex (the holomorphic hull of every compact set is compact),
global holomorphic functions separate its points, and at every point finitely many global
holomorphic functions have jointly injective differential, so that their differentials span the
cotangent space. -/
def IsStein (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] (X : Type*) [TopologicalSpace X]
    [ChartedSpace E X] : Prop :=
  (∀ K : Set X, IsCompact K → IsCompact (holomorphicHull (E := E) K)) ∧
    (∀ x y : X, x ≠ y → ∃ f : X → ℂ, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ) f ∧ f x ≠ f y) ∧
    ∀ x : X, ∃ (r : ℕ) (f : Fin r → X → ℂ), (∀ i, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ) (f i)) ∧
      Function.Injective fun v : E => fun i => mfderiv 𝓘(ℂ, E) 𝓘(ℂ) (f i) x v

/-- **The Stein criterion** (README §3.1; Grauert 1958, the Levi problem). A Hausdorff,
second-countable complex manifold carrying a smooth exhaustion `q` (every sublevel set `{q ≤ c}` is
compact) that is strictly plurisubharmonic at every point is Stein. -/
theorem isStein_of_strictlyPlurisubharmonic_exhaustion {E X : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] [FiniteDimensional ℂ E] [TopologicalSpace X] [T2Space X]
    [SecondCountableTopology X] [ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X] (q : X → ℝ)
    (hq : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ q) (hexh : ∀ c : ℝ, IsCompact {x | q x ≤ c})
    (hpsh : ∀ x, TauCeti.IsManifoldStrictlyPlurisubharmonicAt E q x) : IsStein E X := by
  sorry

/-! ## Layer 4: Grauert's proper real-analytic embedding -/

/-- A regular proper analytic embedding of a finite-dimensional real-analytic manifold into
`ℝᴺ`: a closed embedding whose expression in every extended chart is analytic with injective
differential. Closed embeddings are proper maps (`Topology.IsClosedEmbedding.isProperMap`). -/
structure ProperRealAnalyticEmbedding
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ω M]
    (N : ℕ) where
  /-- The embedding. -/
  toFun : M → RealCoordinates N
  /-- It is a closed embedding. -/
  closedEmbedding : Topology.IsClosedEmbedding toFun
  /-- It is analytic in every extended chart. -/
  analytic_chart : ∀ x : M,
    AnalyticAt ℝ (fun y : E => toFun ((extChartAt I x).symm y)) (extChartAt I x x)
  /-- Its differential in every extended chart is injective. -/
  regular_chart : ∀ x : M,
    Function.Injective
      (fderiv ℝ (fun y : E => toFun ((extChartAt I x).symm y)) (extChartAt I x x))

/-- **Grauert's embedding theorem** (Grauert 1958), in the fixed target dimension `4n + 2`: every
Hausdorff, second-countable real-analytic manifold of dimension `n` without boundary has a regular
proper analytic embedding into `ℝ^(4n+2)`. The proof handles noncompact manifolds through the
Stein tube of the complexification and a proper holomorphic embedding into `ℂ^(2n+1)`. -/
theorem grauert_proper_real_analytic_embedding
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
    [IsManifold I ω M] [SecondCountableTopology M]
    (n : ℕ) [Fact (Module.finrank ℝ E = n)] :
    Nonempty (ProperRealAnalyticEmbedding (M := M) (I := I) (4 * n + 2)) := by
  sorry

/-! ## Layer 5: manifold triangulation and transport -/

/-- **Property (A) for maps into a manifold** (README §5.2; Łojasiewicz 1964, §3, printed p. 463).
A map `τ` from `D ⊆ ℝᴺ` to a manifold `M` has property (A) when, for every `y : M`, its graph over
the source of the extended chart at `y`, read in that chart followed by `e` in the target factor, is
partially semialgebraic over the chart image of `y`, with base the target and fibre `ℝᴺ`. -/
def HasManifoldPropertyA {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M] (I : ModelWithCorners ℝ E H)
    {n N : ℕ} (e : E ≃L[ℝ] RealCoordinates n) (τ : RealCoordinates N → M)
    (D : Set (RealCoordinates N)) : Prop :=
  ∀ y : M, TauCeti.PartiallySemialgebraicAt
    {p : RealCoordinates n × RealCoordinates N |
      p.2 ∈ D ∧ τ p.2 ∈ (extChartAt I y).source ∧ p.1 = e (extChartAt I y (τ p.2))}
    (e (extChartAt I y y))

/-- **Łojasiewicz's triangulation theorem on a manifold** (Łojasiewicz 1964, §3, Theorem 2, printed
p. 464). For a locally finite family `B` of semianalytic subsets of a nonempty Hausdorff,
second-countable real-analytic manifold `M` there are a locally finite simplicial complex `K` in
some `ℝᴺ` and a homeomorphism `τ : |K| → M` with property (A) such that `τ` maps every open simplex
analytically isomorphically onto an analytic submanifold of `M` of the same dimension, contained in
or disjoint from each `B ν`; everything on `M` is read through the extended charts followed by `e`.
The total maps `f` and `g` extend `τ` and its inverse; `M` is nonempty so that `f` exists. -/
theorem exists_manifold_semianalytic_triangulation
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [Nonempty M]
    [ChartedSpace H M] [IsManifold I ω M]
    {n : ℕ} (e : E ≃L[ℝ] RealCoordinates n) {ι : Type*} (B : ι → Set M)
    (hB : ∀ ν, TauCeti.IsMSemianalytic I (B ν)) (hlf : LocallyFinite B) :
    ∃ (N : ℕ) (K : Geometry.SimplicialComplex ℝ (RealCoordinates N)) (τ : K.space ≃ₜ M)
      (f : RealCoordinates N → M) (g : M → RealCoordinates N),
      (∀ x : K.space, f x = τ x) ∧ (∀ y : M, g y = (τ.symm y : RealCoordinates N)) ∧
      LocallyFinite (fun s : K.faces => convexHull ℝ (s : Set (RealCoordinates N))) ∧
      HasManifoldPropertyA I e f K.space ∧
      ∀ s ∈ K.faces,
        let σ := intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates N)))
        ChartwiseRealAnalyticSubmanifold I e (s.card - 1) (f '' σ) ∧
          AnalyticOnSubmanifoldInto I e (s.card - 1) f σ ∧
          ChartwiseAnalyticOn I e (s.card - 1) g (f '' σ) ∧
          ∀ ν, f '' σ ⊆ B ν ∨ f '' σ ⊆ (B ν)ᶜ := by
  sorry

end TauCetiRoadmap.RealAnalyticGeometry
