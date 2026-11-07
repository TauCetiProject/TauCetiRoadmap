module

public import Mathlib

/-!
# Complex manifolds, Dolbeault theory, and Kähler geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. Finite-rank Runge approximation uses
native open sets, connected components and holomorphic functions. The mixed smooth/holomorphic parameter
solver uses native manifold and derivative carriers.
Weierstrass preparation and division use native analytic germs at the origin of
`ℂⁿ × ℂ`. Noetherianity and unique factorization use the native holomorphic stalk. Its
small-manifold universe matches the native sheaf with scalar ring ℂ.

The other headline theorems require the following constructions, which are not
available at the pins with the geometric comparisons required by the README:

* Layer 1: Newlander–Nirenberg needs the Nijenhuis tensor and the comparison between
  a complex atlas and its induced smooth almost-complex structure.
* Layer 2: Dolbeault–Grothendieck exactness and the Dolbeault/sheaf comparison need
  the manifold type-form bundles, their differential, and the holomorphic-form sheaf.
* Layer 3: the analytic Nullstellensatz and Hartogs extension across an analytic subset
  of dimension at most `n − 2` on a manifold need reduced analytic subsets, their dimension
  and their zero-locus carrier. Oka coherence of the stalks and Cartan coherence of ideal
  sheaves need the sheaf of relations of finitely many sections and its finite
  generation over a neighbourhood: the native stalks and germ maps exist, but a
  relation module over them is only a long ad hoc encoding, so coherence is not
  stated.
* Layer 4: Chern uniqueness, Koszul–Malgrange and the flat holomorphic/smooth/local-system
  equivalences need holomorphic bundle and connection carriers, their section sheaves,
  and componentwise locally finite-rank assembly.
* Layer 5: geometric Sobolev completeness, smooth Laplace-type regularity and the H²
  realization need the density bundle, LF bundle tests, bundle distributions, and
  actual atlas localization/reconstruction maps. The de Rham and Dolbeault Hodge
  theorems and Serre duality additionally need manifold form complexes, Hodge star,
  geometric adjoints and their cohomology comparisons. The finite-regularity planar
  comparisons require this same rough-form star and codifferential; coefficient
  formulas alone do not state those comparisons.
* Layer 6: Kähler identities, the ∂∂̄ lemma, Hodge decomposition, Hard Lefschetz and
  Hodge–Riemann need the Kähler metric, type-form and cohomological Lefschetz operators.
  Analytic-cycle integration and integral fundamental classes need reduced analytic
  subsets, their regular-locus manifolds and the integration/homology comparison.
* Layer 7: projective, torus and Hopf cohomology need the corresponding constructed
  complex atlases, holomorphic line bundles and Dolbeault complexes.
* Layer 8: Nomizu/Sakane and the Iwasawa comparison need the nilmanifold quotient and
  invariant-to-global form maps; Frölicher convergence and Kähler degeneration need
  the geometric Dolbeault double complex and its column filtration.

No surrogate theorem is asserted for any of these missing constructions.
-/

@[expose] public section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff Topology

/-! ## Layer 2: Dolbeault calculus and the local lemmas -/

/-- On a Runge compact subset of an open plane domain, approximation can be chosen
as a finite linear combination of fixed point evaluations with holomorphic output
functions. A single compact collar controls the error uniformly over all input
functions, and is chosen before the error tolerance. -/
theorem finite_rank_runge_approximation
    (Ω K U : Set ℂ) (hΩ : IsOpen Ω) (hK : IsCompact K) (hKΩ : K ⊆ Ω)
    (hU : IsOpen U) (hKU : K ⊆ U)
    (hRunge : ∀ z ∈ Ω \ K,
      ¬ (IsCompact (closure (connectedComponentIn (Ω \ K) z)) ∧
        closure (connectedComponentIn (Ω \ K) z) ⊆ Ω)) :
    ∃ L : Set ℂ, IsCompact L ∧ K ⊆ interior L ∧ L ⊆ U ∩ Ω ∧
      ∀ ε : ℝ, 0 < ε →
        ∃ (N : ℕ) (ζ : Fin N → ℂ) (g : Fin N → ℂ → ℂ),
          (∀ j, ζ j ∈ interior L) ∧
          (∀ j, DifferentiableOn ℂ (g j) Ω) ∧
          ∀ f : ℂ → ℂ, DifferentiableOn ℂ f U →
            ∀ B : ℝ, 0 ≤ B → (∀ w ∈ L, ‖f w‖ ≤ B) →
              ∀ z ∈ K, ‖f z - ∑ j, f (ζ j) * g j z‖ ≤ ε * B := by
  sorry

/-- On any open plane domain, a jointly smooth scalar right-hand side with smooth
manifold parameters and holomorphic parameters in an arbitrary finite-dimensional
open complex domain admits a jointly smooth solution of the Wirtinger equation,
holomorphic in those same complex parameters. No compact support is assumed. -/
theorem mixed_parameter_solver
    {EP HP P E : Type*}
    [NormedAddCommGroup EP] [NormedSpace ℝ EP] [FiniteDimensional ℝ EP]
    [TopologicalSpace HP] (I : ModelWithCorners ℝ EP HP) [I.Boundaryless]
    [TopologicalSpace P] [ChartedSpace HP P] [IsManifold I ∞ P]
    [T2Space P] [SecondCountableTopology P]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (Q : Set E) (Ω : Set ℂ) (hQ : IsOpen Q) (hΩ : IsOpen Ω)
    (f : (P × E) × ℂ → ℂ)
    (hf : ContMDiffOn ((I.prod 𝓘(ℝ, E)).prod 𝓘(ℝ, ℂ)) 𝓘(ℝ, ℂ) ∞ f
      ((Set.univ ×ˢ Q) ×ˢ Ω))
    (hfhol : ∀ p z, z ∈ Ω → DifferentiableOn ℂ (fun q => f ((p, q), z)) Q) :
    ∃ u : (P × E) × ℂ → ℂ,
      ContMDiffOn ((I.prod 𝓘(ℝ, E)).prod 𝓘(ℝ, ℂ)) 𝓘(ℝ, ℂ) ∞ u
        ((Set.univ ×ˢ Q) ×ˢ Ω) ∧
      (∀ p z, z ∈ Ω → DifferentiableOn ℂ (fun q => u ((p, q), z)) Q) ∧
      (∀ p q, q ∈ Q → ∀ z, z ∈ Ω →
        (fderiv ℝ (fun w => u ((p, q), w)) z 1 +
          Complex.I * fderiv ℝ (fun w => u ((p, q), w)) z Complex.I) / 2 =
            f ((p, q), z)) := by
  sorry

/-! ## Layer 3: analytic germs and subvarieties -/

/-- **The Weierstrass preparation theorem** (Demailly II, (2.1), p. 80). Let `f` be holomorphic
near `0` in `ℂⁿ × ℂ` and let `w ↦ f(0, w)` vanish to order exactly `d` at `0`. Then near `0`,
`f = u · (wᵈ + a_(d−1)(z) w^(d−1) + ⋯ + a₀(z))` with `u` a holomorphic unit at `0` and
holomorphic coefficients `a_i` vanishing at `0`. For `d = 0` the polynomial is `1` and `u = f`;
for `n = 0` the coefficients are the zero germs. -/
theorem weierstrass_preparation {n d : ℕ} {f : (Fin n → ℂ) × ℂ → ℂ} (hf : AnalyticAt ℂ f 0)
    (hlow : ∀ i < d, iteratedDeriv i (fun w ↦ f (0, w)) 0 = 0)
    (hd : iteratedDeriv d (fun w ↦ f (0, w)) 0 ≠ 0) :
    ∃ (u : (Fin n → ℂ) × ℂ → ℂ) (a : Fin d → (Fin n → ℂ) → ℂ),
      AnalyticAt ℂ u 0 ∧ u 0 ≠ 0 ∧ (∀ i, AnalyticAt ℂ (a i) 0 ∧ a i 0 = 0) ∧
        ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
          f zw = u zw * (zw.2 ^ d + ∑ i : Fin d, a i zw.1 * zw.2 ^ (i : ℕ)) := by
  sorry

/-- **Uniqueness in Weierstrass preparation** (Demailly II, (2.1) with the uniqueness clause of
(2.3), p. 80): two factorizations of the same germ as a holomorphic unit times a Weierstrass
polynomial of degree `d` have the same unit germ and the same coefficient germs. Writing
`f = u · P` with `P = w^d + Σ a_i w^i` gives `w^d = u⁻¹ · f − Σ a_i w^i`, a division of `w^d` by
`f` with remainder of degree below `d`, so the uniqueness of division fixes `u⁻¹` and the `a_i`. -/
theorem weierstrass_preparation_unique {n d : ℕ} {f u u' : (Fin n → ℂ) × ℂ → ℂ}
    {a a' : Fin d → (Fin n → ℂ) → ℂ}
    (hu : AnalyticAt ℂ u 0) (hu0 : u 0 ≠ 0) (ha : ∀ i, AnalyticAt ℂ (a i) 0 ∧ a i 0 = 0)
    (hf : ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
      f zw = u zw * (zw.2 ^ d + ∑ i : Fin d, a i zw.1 * zw.2 ^ (i : ℕ)))
    (hu' : AnalyticAt ℂ u' 0) (hu0' : u' 0 ≠ 0)
    (ha' : ∀ i, AnalyticAt ℂ (a' i) 0 ∧ a' i 0 = 0)
    (hf' : ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
      f zw = u' zw * (zw.2 ^ d + ∑ i : Fin d, a' i zw.1 * zw.2 ^ (i : ℕ))) :
    u =ᶠ[𝓝 0] u' ∧ ∀ i, a i =ᶠ[𝓝 0] a' i := by
  sorry

/-- **The Weierstrass division theorem** (Demailly II, (2.3)–(2.4), p. 80), for germs. Let `g`
be holomorphic near `0` in `ℂⁿ × ℂ` with `w ↦ g(0, w)` vanishing to order exactly `d` at `0`.
Every germ `f` holomorphic at `0` is `f = g q + r_0(z) + r_1(z) w + ⋯ + r_(d−1)(z) w^(d−1)` near
`0` with `q` and the `r_i` holomorphic at `0`, and the germs of `q` and of the `r_i` are unique.
For `d = 0` the remainder is empty and `q = f / g`; for `n = 0` the remainder is the Taylor
polynomial of `f` of degree below `d`. -/
theorem weierstrass_division {n d : ℕ} {g f : (Fin n → ℂ) × ℂ → ℂ} (hg : AnalyticAt ℂ g 0)
    (hlow : ∀ i < d, iteratedDeriv i (fun w ↦ g (0, w)) 0 = 0)
    (hd : iteratedDeriv d (fun w ↦ g (0, w)) 0 ≠ 0) (hf : AnalyticAt ℂ f 0) :
    ∃ (q : (Fin n → ℂ) × ℂ → ℂ) (r : Fin d → (Fin n → ℂ) → ℂ),
      AnalyticAt ℂ q 0 ∧ (∀ i, AnalyticAt ℂ (r i) 0) ∧
      (∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
        f zw = g zw * q zw + ∑ i : Fin d, r i zw.1 * zw.2 ^ (i : ℕ)) ∧
      ∀ (q' : (Fin n → ℂ) × ℂ → ℂ) (r' : Fin d → (Fin n → ℂ) → ℂ),
        AnalyticAt ℂ q' 0 → (∀ i, AnalyticAt ℂ (r' i) 0) →
        (∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
          f zw = g zw * q' zw + ∑ i : Fin d, r' i zw.1 * zw.2 ^ (i : ℕ)) →
        q' =ᶠ[𝓝 0] q ∧ ∀ i, r' i =ᶠ[𝓝 0] r i := by
  sorry

/-- The holomorphic stalk at a point of a finite-dimensional complex manifold is
Noetherian (Demailly II, Theorem 2.7). The native complex smooth sheaf is the
holomorphic sheaf by finite-dimensional complex analyticity. -/
theorem holomorphicStalk_noetherian
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] (x : M) :
    IsNoetherianRing ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) := by
  sorry

/-- The holomorphic stalk is an integral domain with unique factorization,
including dimension zero (Demailly II, Theorem 2.10). -/
theorem holomorphicStalk_factorial
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] (x : M) :
    IsDomain ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) ∧
      UniqueFactorizationMonoid
        ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) := by
  sorry

end TauCetiRoadmap.ComplexKahlerGeometry
