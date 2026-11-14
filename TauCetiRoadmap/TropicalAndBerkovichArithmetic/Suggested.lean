import Mathlib

/-!
# TropicalAndBerkovichArithmetic: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. Layer 0's native noncomplete spectrum
comparison, compactness extension, nonemptiness extension, general Banach unit
criterion, idempotent classification and absolute-value field classification are
statable here. The complete bounded-spectrum core is imported in the README
from AdicSpacesPartIII, rather than restated as a separate headline here.

The remaining headlines are not statable at the pins: the uniform Gelfand
representation needs completed residue fields; contractive spectral colimits
need the specified seminormed Banach-ring category; analytification and its GAGA,
hybrid and adic comparisons need analytic spaces and their coherent sheaves;
semistable reduction and skeleta need rank-one formal models and their metric
realizations; metric-graph and metrized-complex Riemann–Roch need all-point metric
graph divisors and residue-curve complexes; extended tropicalization needs
toric analytifications and extended tropical spaces; tropical multiplicities,
pushforward and faithful domination need valued initial degenerations and analytic
toric embeddings; mixed measures, local heights and admissible corrections need model
metrics and measure-valued graph potentials; Tate/Schottky uniformization and the
Jacobian comparison need analytic quotients and Raynaud covers; BC–abelian
comparison needs analytic paths, forms and their integration. No substitute
carriers or predicates for these missing objects are introduced.
-/

noncomputable section

namespace TauCetiRoadmap.TropicalAndBerkovichArithmetic

/-! ## Layer 0: Berkovich spectra and analytic comparison -/

/-- The native noncomplete presentation by normalized multiplicative seminorms
pointwise dominated by the specified, possibly nonmultiplicative, ring norm. -/
def Spectrum (A : Type*) [NormedCommRing A] :=
  {p : MulRingSeminorm A // ∀ a, p a ≤ ‖a‖}

namespace Spectrum

/-- The value of a spectrum point on a ring element. -/
abbrev eval {A : Type*} [NormedCommRing A] (x : Spectrum A) (a : A) : ℝ := x.val a

/-- Pointwise convergence tests evaluations at every ring element. -/
instance topology (A : Type*) [NormedCommRing A] : TopologicalSpace (Spectrum A) :=
  TopologicalSpace.induced (fun x : Spectrum A => x.eval) inferInstance

/-- Restriction to a normed ring from its completion is a homeomorphism of
spectra, preserving each evaluation (Scholze, Definition 2.13, p. 10). -/
theorem completion_comparison (A : Type*) [NormedCommRing A] :
    ∃ e : Spectrum (UniformSpace.Completion A) ≃ₜ Spectrum A,
      ∀ (x : Spectrum (UniformSpace.Completion A)) (a : A),
        (e x).eval a = x.eval (a : UniformSpace.Completion A) := sorry

/-- Compactness extends from the complete supplier spectrum to arbitrary native
normed commutative rings, including an empty spectrum. -/
theorem compactSpace (A : Type*) [NormedCommRing A] :
    CompactSpace (Spectrum A) := sorry

/-- Norm one at the unit ensures nonemptiness without completeness
(Scholze, Theorem 2.14; the README also states the seminormed version). -/
theorem nonempty (A : Type*) [NormedCommRing A] [NormOneClass A] :
    Nonempty (Spectrum A) := sorry

/-- In a complete normalized normed ring, including the zero ring, positivity
at every spectral point detects units (Berkovich, Corollary 1.2.4). -/
theorem isUnit_iff (A : Type*) [NormedCommRing A] [CompleteSpace A]
    (h_one : ‖(1 : A)‖ ≤ 1) (a : A) :
    IsUnit a ↔ ∀ x : Spectrum A, 0 < x.eval a := sorry

/-- Every clopen spectral subset is the value-one locus of a unique idempotent
in the complete normalized normed ring (Scholze, Theorem 2.18). -/
theorem existsUnique_idempotent_of_isClopen (A : Type*) [NormedCommRing A]
    [CompleteSpace A] (h_one : ‖(1 : A)‖ ≤ 1)
    (U : Set (Spectrum A)) (hU : IsClopen U) :
    ∃! e : A, e * e = e ∧ ∀ x : Spectrum A, x ∈ U ↔ x.eval e = 1 := sorry

end Spectrum

/-- An archimedean complete absolute-valued field is the real or complex field
with a unique power of its ordinary norm (Scholze, Theorem 2.12). -/
theorem archimedean_field_classification (K : Type*) [NormedField K] [CompleteSpace K]
    (h_two : 1 < ‖(2 : K)‖) :
    ∃! α : ℝ, 0 < α ∧ α ≤ 1 ∧
      ((∃ e : K ≃+* ℝ, ∀ x : K, ‖x‖ = ‖e x‖ ^ α) ∨
       (∃ e : K ≃+* ℂ, ∀ x : K, ‖x‖ = ‖e x‖ ^ α)) := sorry

end TauCetiRoadmap.TropicalAndBerkovichArithmetic
