import Mathlib
import TauCeti.NumberTheory.HeckeRing.Associativity

/-!
# Local factors of twists and types: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. One of them is
statable at the pins and is stated here: the Satake bound for bounded spherical functions of
`GL_n(K)` (3.4 (i)). The others are not, and each is listed below with the carriers it lacks.

The spherical Hecke ring of `GL_n(K)`, for a nonarchimedean local field `K`, is Mathlib's Hecke
coset ring `HeckeRing` of the Hecke triple formed by `GL_n(K)` and its subgroup `GL_n(𝒪_K)`, with
the ring structure of Tau Ceti and the degree `HeckeCoset.degree`, the number of cosets `gK₀` in
`K₀gK₀`. The basis element `[K₀gK₀]` corresponds to the characteristic function of `K₀gK₀` in the
convolution algebra `ℋ(GL_n(K), K₀)` normalised by `vol K₀ = 1`, so a ring homomorphism from the
Hecke ring with integer coefficients to `ℂ` is a character of `ℋ(GL_n(K), K₀)`. The Hecke-triple
condition holds for every compact open subgroup; it enters the statement as an instance hypothesis.

The other headlines are statements about smooth complex representations of `GL_n(F)`, or of an
unramified unitary group, over a nonarchimedean local field `F`: irreducible, generic,
supercuspidal, square-integrable and unitary representations, their Whittaker models, their
Rankin–Selberg factors and their Satake parameters (SmoothRepresentationsOfLocalGroups Layers
SR.0–SR.5, AutomorphicLFunctionsAndLocalFactors Layer AL.3). Neither Mathlib nor Tau Ceti has
these carriers at the pins. Mathlib has `Representation`, the groups `Matrix.GeneralLinearGroup`
over a field, the class `IsNonarchimedeanLocalField`, the Hecke coset ring `HeckeRing`, and
`MulChar`, `AddChar` and `gaussSum`; it has no smooth or admissible representations of a locally
profinite group and no parabolic induction or Jacquet module. Tau Ceti has the ring structure of
`HeckeRing`, the local reciprocity map `TauCeti.ClassFieldTheory.artinMap`, the Satake parameters
`HeckeRing.GL2.Newform.satakeParameters` of classical newforms, and the finite-order characters
`TauCeti.LFunctions.PrimitiveRayClassCharacter`, and none of the representation theory of `p`-adic
groups.

* The local converse theorem (6.4): for `n ≥ 2`, two irreducible generic representations of
  `GL_n(F)` with the same central character whose `γ`-factors of pairs agree with those of every
  irreducible supercuspidal representation of `GL_r(F)`, `1 ≤ r ≤ ⌊n/2⌋`, are isomorphic. It
  lacks smooth irreducible, generic and supercuspidal representations of `GL_n(F)`, their central
  characters, Whittaker models, and the Rankin–Selberg factor `γ(s, π × τ, ψ)`.
* The uniqueness of local Langlands correspondences (6.5): for `F/ℚ_p` finite there is at most one
  family of bijections from irreducible smooth representations of `GL_n(F)` to Frobenius-semisimple
  Weil–Deligne representations that is reciprocity in rank one and respects supercuspidality,
  central characters, the segment rule and the `ε`-factors of pairs. It lacks, besides the
  carriers of 6.4, Weil–Deligne representations of the Weil group of `F` with their Frobenius
  semisimplicity, segments and the representations `L(Δ)`, and the Langlands–Deligne local
  constants of Weil representations; the reciprocity map of Tau Ceti is there, but a statement in
  rank one alone is property 1 of the definition, not the theorem.
* The exponent bound (6.3): the real exponents `α_i` of an irreducible unitary generic
  representation `δ₁ν^{α₁} × ⋯ × δ_rν^{α_r}` of `GL_n(F)`, with `δ_i` unitary square-integrable,
  satisfy `|α_i| < 1/2`. It lacks, besides the carriers of 6.4, unitary and square-integrable
  representations, normalised parabolic induction and the Rankin–Selberg factor
  `L(s, δ × δ^∨)`. For `n = 1` it says only that a unitary character has exponent `0`.
* The Satake bound for the unramified unitary group (3.4 (ii)) and the absolute convergence of
  7.2 (iii): a character of the spherical Hecke algebra of the unitary group `G_n` with a bounded
  spherical function has base-change parameter of absolute values between `Q^{−(n−1)/2}` and
  `Q^{(n−1)/2}`, and the partial standard `L`-function of an automorphic representation of a
  unitary group occurring in `L²`, twisted by a unitary Hecke character, converges absolutely and
  is nonzero for `Re z > (n + 1)/2`. The first lacks the Satake transform and the base-change
  parameter of the unitary group (SmoothRepresentationsOfLocalGroups §SR.4.4): for `GL_n` the
  Satake parameter is characterised below by the eigenvalues of the operators `T_r`, and the
  unitary group has no such characterisation at the pins. The second lacks, besides these,
  automorphic representations of unitary groups, unitary Hecke characters of infinite order and
  the doubling standard `L`-function. The local bound 7.2 (i) for `GL_n` is `satake_bound_gl`
  applied to the eigencharacter of a spherical vector of a unitary representation, and lacks only
  unitary smooth representations.

Epsilon factors of characters of local fields and Gauss sums of finite fields are not headlines
of this roadmap: Tate's local constants and the Gauss sums are AutomorphicLFunctionsAndLocalFactors
Layer AL.1, and the rank-one cases of the headlines above are either part of a definition (6.5,
property 1) or trivial (6.3). The Hecke eigenvalue bound 3.1 is a statement about a locally
profinite group, a compact open subgroup and a vector with a bounded coefficient; its part (a) is
an estimate that follows in one line from its hypotheses, a step of the route to 3.4 and not a
headline, and it is not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LocalFactorsOfTwistsAndTypes

open ValuativeRel

/-! ## Layer 3: Spherical functions, Satake parameters and Hecke bounds -/

/-- The maximal compact subgroup `GL_n(𝒪_K)` of `GL_n(K)`: the image of the invertible matrices
over the valuation ring `𝒪_K` of `K`. -/
noncomputable def integralGL (K : Type*) [Field K] [ValuativeRel K] (n : ℕ) :
    Subgroup (GL (Fin n) K) :=
  (Matrix.GeneralLinearGroup.map (algebraMap 𝒪[K] K)).range

/-- The Hecke operator `T_r = [K₀ diag(ϖ, …, ϖ, 1, …, 1) K₀]` of the spherical Hecke ring of
`GL_n(K)`, `K₀ = GL_n(𝒪_K)`, with `r` entries `ϖ` (for `r ≥ n` all entries are `ϖ`); its double
coset does not depend on the uniformiser `ϖ`. -/
noncomputable def heckeT {K : Type*} [Field K] [ValuativeRel K] (n : ℕ) (ϖ : K) (hϖ : ϖ ≠ 0)
    (r : ℕ) : HeckeRing (⊤ : Submonoid (GL (Fin n) K)) (integralGL K n) ℤ :=
  HeckeCosetModule.single ℤ
    (HeckeCoset.mk _ _
      ⟨Matrix.GeneralLinearGroup.mkOfDetNeZero
        (Matrix.diagonal fun i : Fin n => if (i : ℕ) < r then ϖ else 1)
        (by
          rw [Matrix.det_diagonal]
          exact Finset.prod_ne_zero_iff.mpr fun i _ => by split_ifs <;> simp [hϖ]),
        trivial⟩) 1

/-- The spherical function `ω_θ(g) = θ([K₀gK₀]) / #(K₀gK₀/K₀)` of a character `θ` of the
spherical Hecke ring of `GL_n(K)`, `K₀ = GL_n(𝒪_K)` (README 3.1 (b)). -/
noncomputable def sphericalFunction {K : Type*} [Field K] [ValuativeRel K] {n : ℕ}
    [IsHeckeTriple (⊤ : Submonoid (GL (Fin n) K)) (integralGL K n) (integralGL K n)]
    (θ : HeckeRing (⊤ : Submonoid (GL (Fin n) K)) (integralGL K n) ℤ →+* ℂ)
    (g : GL (Fin n) K) : ℂ :=
  θ (HeckeCosetModule.single ℤ (HeckeCoset.mk _ _ ⟨g, trivial⟩) 1) /
    ((HeckeCoset.mk (integralGL K n) (integralGL K n)
      (⟨g, trivial⟩ : (⊤ : Submonoid (GL (Fin n) K)))).degree : ℂ)

/-- **Satake bound for `GL_n`** (README 3.4 (i)). Let `K` be a nonarchimedean local field with
residue cardinality `Q` and `θ` a character of the spherical Hecke ring of `GL_n(K)` whose
spherical function is bounded. If `α ∈ ℂⁿ` is its Satake parameter, characterised by the
eigenvalues `θ(T_r) = Q^{r(n−r)/2} e_r(α)`, `0 ≤ r ≤ n`, of the generators of
SmoothRepresentationsOfLocalGroups §SR.4.3 *gln-generators*, then
`Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}` for every `i`. -/
theorem satake_bound_gl {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ)
    [IsHeckeTriple (⊤ : Submonoid (GL (Fin n) K)) (integralGL K n) (integralGL K n)]
    (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (θ : HeckeRing (⊤ : Submonoid (GL (Fin n) K)) (integralGL K n) ℤ →+* ℂ)
    (hθ : BddAbove (Set.range fun g => ‖sphericalFunction θ g‖))
    (α : Fin n → ℂ)
    (hα : ∀ r ≤ n, θ (heckeT n (ϖ : K) (by simpa using hϖ.ne_zero) r) =
      ((Nat.card 𝓀[K] : ℝ) ^ ((r * (n - r) : ℝ) / 2) : ℝ) *
        (Finset.univ.powersetCard r).sum fun s => ∏ i ∈ s, α i)
    (i : Fin n) :
    (Nat.card 𝓀[K] : ℝ) ^ (-((n : ℝ) - 1) / 2) ≤ ‖α i‖ ∧
      ‖α i‖ ≤ (Nat.card 𝓀[K] : ℝ) ^ (((n : ℝ) - 1) / 2) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.LocalFactorsOfTwistsAndTypes

