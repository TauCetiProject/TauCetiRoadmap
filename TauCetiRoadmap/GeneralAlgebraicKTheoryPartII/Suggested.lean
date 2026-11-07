module

import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.WeakHomotopyEquivalence
import TauCeti.Topology.PathSpace.Moore

/-!
# General algebraic K-theory, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It records the roadmap's
headline theorems against the pinned APIs, as suggested forms rather than an
exhaustive checklist. The James reduced product of §4.30b, its word filtration,
functoriality and universal property, and the James theorem are stated below over
Mathlib's classical CW complexes, Tau Ceti's Moore loop space and Tau Ceti's weak
homotopy equivalences; the reduced suspension enters through a quotient map that
presents it. The other headline theorems are not statable at the pins: the
required spectral and enhanced categorical carriers are absent. The precise missing
carriers are listed below.

- James–Hopf maps and the one-suspension James splitting: lack smash powers and reduced suspensions of pointed spaces.
- Stable James splitting: lacks suspension spectra of spaces and free E-one ring spectra.
- K-theory localization for compact kernels: lacks enhanced stable categories and their K spectrum.
- Connective plus comparison: lacks connective ring spectra, GL spaces, plus and K.
- Additive Morita and projective K comparison: lacks additive infinity categories and spectral modules.
- A-theory comparison: lacks spherical loop-group rings and retractive-space K.
- Restricted truncating excision and quantitative truncation: lacks ring spectra, localizing invariants and K.
- Nonpositive connective-ring comparison: lacks spectral rings and integer-graded K.
- Stable envelope comparison and bounded-heart fiber: lacks additive spectral presheaves and K.
- Theorem of the heart and regular spectral localization: lacks enhanced hearts, perfect modules and K spectra.
- Bousfield–Kuhn comparison: lacks telescopes, spectrum localization and periodic functors.
- Telescopic Tate vanishing and finite blueshift: lacks coherent Tate spectra and chromatic localization.
- Hahn acyclicity and the Tate-height converse: lacks H-infinity and E-infinity ring spectra and chromatic height.
- Continuous big Witt action and Weibel NK localization: lacks NK groups in all integer degrees.
- Acyclic categorical K vanishing and Mitchell vanishing: lacks enhanced K spectra and telescopic localizations.
- Theorem A, both forms: lacks ring-spectral K and finite chromatic localization.
- High-height connective-cover and cyclotomic-trace comparison: lacks K, TC and T(n) localization.
- CMNN finite-sphere vanishing: lacks finite-local sphere and its K spectrum.
- Two-height purity and its optimality: lacks telescopic K functor on E-one ring spectra.
- Theorem B, Lubin–Tate lower bound and corrected redshift: lacks spectral rings, K and chromatic height.
- Chromatic graded-piece redshift: lacks chromatic towers of spectral rings and K.
- K preserves nice maps and iterated finite-p comparison: lacks multiplicative K iteration and telescopic localization.
- Morava, Brown–Peterson, truncated-sphere and A-theory applications: lacks coefficient ring spectra, A and K.
- Rational-transfer cobar descent, Galois descent and Lubin–Tate transfer: lacks linear motives, spectral cobar towers and K transfer.
- ko/tmf algebra purity and supersingular K descent: lacks ko/tmf spectra, K and coherent fixed points.
- Height-one truncation, excision, cdh descent and polynomial/KH comparison: lacks K(1)-local K and enhanced scheme K/KH.
- Height-one TC obstruction and category-colimit counterexample: lacks TC of rings and enhanced categories.
- Chromatic additive-to-stable K comparison: lacks additive K, stable K and chromatic localization.
- Sifted-colimit preservation and cyclic TC/K assembly: lacks ring-spectral K/TC and coherent orbit diagrams.
- Hopkins–Mahowald and James-filtered Thom comparisons and acyclicity: lacks units of spectral rings, E-two Thom spectra, their coherent multiplicative colimits and the spectral Adams/Margolis comparisons.
- Uniform height locality and elliptic chromatic comparison: lacks chromatic localization of oriented spectral rings and elliptic spectral sheaves.
- Lubin–Tate covers, chromatic field maps and ordinary-homology unit detection: lacks Lubin–Tate rings of perfect algebras, chromatic E-infinity fields, H-infinity rings and spectral ordinary homology.
- Even equivariant Morava free-complex construction: lacks Morava spectra, semilinear modules and spectral coinduction.

The ordinary quasicategory, Karoubi, exact-structure and triangulated t-structure
APIs do not supply stable infinity categories, spectra, spectral rings or K/TC.
Their elementary consequences are supplier facts, rather than acceptance
statements for telescopic purity. No replacement carriers or assumed predicates
are introduced here.
-/

namespace TauCetiRoadmap.GeneralAlgebraicKTheoryPartII

open Topology unitInterval
open scoped NNReal

/-! ## The James reduced product (§4.30b) -/

section James

variable (X : Type*) [TopologicalSpace X] (x₀ : X)

/-- The words in the points of `X` in which the base point `x₀` does not occur. Under
concatenation they form the underlying monoid of the James reduced product. -/
def jamesSubmonoid : Submonoid (FreeMonoid X) where
  carrier := {w | x₀ ∉ FreeMonoid.toList w}
  mul_mem' {a b} ha hb := by
    change x₀ ∉ FreeMonoid.toList (a * b)
    rw [FreeMonoid.toList_mul, List.mem_append, not_or]
    exact ⟨ha, hb⟩
  one_mem' := by simp

/-- The James reduced product `J(X)` of a pointed space `(X, x₀)`: the free monoid on the points
of `X` in which `x₀` is the unit, realized by the words in which `x₀` does not occur. -/
def JamesReducedProduct : Type _ := jamesSubmonoid X x₀

namespace JamesReducedProduct

instance : Monoid (JamesReducedProduct X x₀) := inferInstanceAs (Monoid (jamesSubmonoid X x₀))

/-- The word underlying a point of `J(X)`. -/
def toFreeMonoid : JamesReducedProduct X x₀ →* FreeMonoid X := (jamesSubmonoid X x₀).subtype

open Classical in
/-- Deletion of every letter equal to the base point. -/
noncomputable def reduce : FreeMonoid X →* JamesReducedProduct X x₀ :=
  FreeMonoid.lift fun x =>
    if h : x = x₀ then 1 else (⟨FreeMonoid.of x, by simpa [jamesSubmonoid] using Ne.symm h⟩ :
      jamesSubmonoid X x₀)

/-- The point of `J(X)` represented by a tuple `(x₁, …, xₙ)` of points of `X`. -/
noncomputable def mk (p : Σ n, Fin n → X) : JamesReducedProduct X x₀ :=
  reduce X x₀ (FreeMonoid.ofList (List.ofFn p.2))

/-- `J(X)` carries the quotient topology from the disjoint union of the finite powers of `X`. -/
noncomputable instance : TopologicalSpace (JamesReducedProduct X x₀) :=
  TopologicalSpace.coinduced (mk X x₀) inferInstance

/-- The inclusion of `X` into `J(X)` as the words of length at most one. -/
noncomputable def ι : C(X, JamesReducedProduct X x₀) where
  toFun x := mk X x₀ ⟨1, fun _ => x⟩
  continuous_toFun := by
    have h : Continuous (mk X x₀) := continuous_coinduced_rng
    exact h.comp (continuous_sigmaMk.comp (continuous_pi fun _ => continuous_id))

/-- The stage `J_r(X)` of the word-length filtration: the words of length at most `r`. -/
def filtration (r : ℕ) : Set (JamesReducedProduct X x₀) :=
  {w | (FreeMonoid.toList (toFreeMonoid X x₀ w)).length ≤ r}

variable {X x₀}

/-- The monoid map `J(X) → J(Y)` induced by a pointed map, applied letter by letter. -/
noncomputable def map {Y : Type*} [TopologicalSpace Y] {y₀ : Y} (f : C(X, Y)) (_hf : f x₀ = y₀) :
    JamesReducedProduct X x₀ →* JamesReducedProduct Y y₀ :=
  (FreeMonoid.lift fun x => reduce Y y₀ (FreeMonoid.of (f x))).comp (toFreeMonoid X x₀)

/-- The stages of the word-length filtration are closed when the base point is closed. -/
theorem isClosed_filtration [T1Space X] (r : ℕ) : IsClosed (filtration X x₀ r) := sorry

/-- The stage `J₀(X)` is the unit. -/
theorem filtration_zero : filtration X x₀ 0 = {1} := sorry

/-- The stage `J₁(X)` is the image of `X`. -/
theorem range_ι : Set.range (ι X x₀) = filtration X x₀ 1 := sorry

/-- The universal property of `J(X)`: a pointed map from `X` to a topological monoid sending
the base point to the unit extends uniquely to a continuous monoid map out of `J(X)`. -/
theorem existsUnique_lift {M : Type*} [TopologicalSpace M] [Monoid M] [ContinuousMul M]
    (f : C(X, M)) (hf : f x₀ = 1) :
    ∃! φ : JamesReducedProduct X x₀ →* M, Continuous φ ∧ ∀ x, φ (ι X x₀ x) = f x := sorry

/-- For a compact Hausdorff space `X`, the James reduced product is a topological monoid. -/
theorem continuousMul [CompactSpace X] [T2Space X] :
    ContinuousMul (JamesReducedProduct X x₀) := sorry

/-- A pointed map induces a continuous map of James reduced products. -/
theorem continuous_map {Y : Type*} [TopologicalSpace Y] {y₀ : Y} (f : C(X, Y))
    (hf : f x₀ = y₀) : Continuous (map f hf) := sorry

/-- The induced map extends the given pointed map on the words of length one. -/
theorem map_ι {Y : Type*} [TopologicalSpace Y] {y₀ : Y} (f : C(X, Y)) (hf : f x₀ = y₀)
    (x : X) : map f hf (ι X x₀ x) = ι Y y₀ (f x) := sorry

/-- **The James theorem.** Let `W` be a connected CW complex with countably many cells whose base
point `w₀` is a `0`-cell. Let `q : W × I → Y` present `Y` as the reduced suspension of
`(W, w₀)`: a quotient map identifying exactly the points of `W × {0, 1} ∪ {w₀} × I`. Let
`d : W → ℝ≥0` vanish exactly at `w₀`. Then the continuous monoid map from `J(W)` to the Moore
loops of `Y` that sends a letter `w` to the loop `s ↦ q (w, s / d w)` of length `d w` is a weak
homotopy equivalence. -/
theorem exists_jamesMap_isWeakHomotopyEquivalence {W : Type*} [TopologicalSpace W] [T2Space W]
    [Topology.CWComplex (Set.univ : Set W)]
    [Countable (Σ n, Topology.CWComplex.cell (Set.univ : Set W) n)] [ConnectedSpace W] (w₀ : W)
    (hw₀ : ∃ i : Topology.CWComplex.cell (Set.univ : Set W) 0, Topology.CWComplex.map 0 i 0 = w₀)
    {Y : Type*} [TopologicalSpace Y] (q : C(W × I, Y)) (hq : IsQuotientMap q)
    (hq_eq : ∀ a b : W × I, q a = q b ↔
      a = b ∨ ((a.2 = 0 ∨ a.2 = 1 ∨ a.1 = w₀) ∧ (b.2 = 0 ∨ b.2 = 1 ∨ b.1 = w₀)))
    (d : C(W, ℝ≥0)) (hd : ∀ w, d w = 0 ↔ w = w₀) :
    ∃ φ : JamesReducedProduct W w₀ →* TauCeti.MooreLoopSpace Y (q (w₀, 0)),
      ∃ hφ : Continuous φ,
        (∀ w, (φ (ι W w₀ w)).toMoorePath.length = d w ∧
          ∀ s : ℝ≥0, (φ (ι W w₀ w)).toMoorePath s =
            q (w, Set.projIcc 0 1 zero_le_one ((s : ℝ) / (d w : ℝ)))) ∧
        (⟨φ, hφ⟩ : C(JamesReducedProduct W w₀,
          TauCeti.MooreLoopSpace Y (q (w₀, 0)))).IsWeakHomotopyEquivalence := sorry

end JamesReducedProduct

end James

end TauCetiRoadmap.GeneralAlgebraicKTheoryPartII
