module

import Mathlib

/-!
# Igusa varieties and torsion concentration, Part II: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems that can be stated against the pinned Mathlib and Tau Ceti, each with `sorry`.

The roadmap's end theorems are those of Caraiani–Scholze, *On the generic part of the cohomology
of compact unitary Shimura varieties* (Ann. of Math. 186 (2017)). Most of them are not statable at
the pins:

* Galois representations attached to torsion Hecke eigensystems (CS17 Theorem 6.3.1(1)), middle
  degree concentration of the generic part (Theorem 6.3.1(2)), the main theorem (Theorem 1.1), and
  its integral and twisted-coefficient forms (Remarks 1.3 and 1.7.1) (README Layer 11). They need
  compact unitary PEL Shimura varieties `S_K` over the reflex field, their étale cohomology with
  torsion coefficients, and the action of the abstract spherical Hecke algebra `𝕋^S` on it. None
  of these carriers exists in Mathlib or Tau Ceti at the pins.
* Genericity forces the `μ`-ordinary Newton stratum (CS17 Theorem 5.5.7, Corollary 5.6.3), the
  Igusa trace identities and spectral expansions (Theorem 5.3.2, Lemma 5.5.1, Proposition 5.6.1,
  Corollary 5.6.2) (README Layers 9–10). They need Mantovan's Igusa varieties, the Kottwitz
  set `B(G, μ⁻¹)` of a reductive group over `ℚ_p`, Grothendieck groups of admissible
  representations of `J_b(ℚ_p)` and of adelic groups, and base change to `GL_n`. These are absent.
* The auxiliary-pair condition (README §8.7), which needs the signature of a compact unitary
  PEL datum and the sets `S_i` of complex embeddings attached to `ι_p : ℚ̄_p ≅ ℂ` and to a place
  `u` of the imaginary quadratic subfield above `p`. The PEL datum is absent, and this file does
  not encode it ad hoc.

What is statable is the arithmetic input that turns the hypotheses of Theorem 1.1 into the
auxiliary-prime hypothesis of Theorem 6.3.1(2): existence of infinitely many decomposed generic
primes in the strong sense of CS17 Definition 1.9 (README §8.8, CS17 Remarks 6.3.2–6.3.3). A
continuous representation `Gal(F̄/F) → GL_n(𝔽̄_ℓ)` has finite image in some `GL_n(k)` with `k`
finite and factors through `Gal(L/F)` for a finite Galois extension `L/F`. The statements below
are made for such finite Galois realizations, which loses no generality.
-/

open Polynomial NumberField

namespace TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII

/-! ## Layer 8: Compact unitary PEL data, Hecke algebras and duality -/

/-- Strong decomposed genericity at a prime `v` of `𝓞 F` (Caraiani–Scholze, CS17 Definition 1.9 and
Definition 6.2.1) for a representation `r : Gal(L/F) → GL_n(k)` with `k` finite of characteristic
`ℓ`. The prime `v` is maximal and does not lie over `ℓ`. For every prime `Q` of `𝓞 L` above `v`,
inertia at `Q` acts trivially. Every arithmetic Frobenius `σ` at `Q` has characteristic polynomial
`∏ (X − α_i)` over `k̄`, with `α_i / α_j ∉ {1, q_v}` for `i ≠ j`, where `q_v = #(𝓞 F / v)`. The
condition is symmetric in ordered pairs, so geometric Frobenius gives the same predicate. -/
def IsStrongGenericAt {F L k : Type*} [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}
    (r : (L ≃ₐ[F] L) →* Matrix.GeneralLinearGroup (Fin n) k) (v : Ideal (𝓞 F)) : Prop :=
  v.IsMaximal ∧ ((ringChar k : ℕ) : 𝓞 F) ∉ v ∧
  ∀ (Q : Ideal (𝓞 L)), Q.IsPrime → Q.LiesOver v →
    (∀ σ ∈ Q.inertia (L ≃ₐ[F] L), r σ = 1) ∧
    ∀ σ : L ≃ₐ[F] L, IsArithFrobAt (𝓞 F) σ Q →
      ∃ α : Fin n → (AlgebraicClosure k)ˣ,
        ((r σ).val.map (algebraMap k (AlgebraicClosure k))).charpoly =
          ∏ i, (X - C (α i : AlgebraicClosure k)) ∧
        ∀ i j, i ≠ j →
          (α i : AlgebraicClosure k) / (α j : AlgebraicClosure k) ≠ 1 ∧
          (α i : AlgebraicClosure k) / (α j : AlgebraicClosure k) ≠
            (Nat.card (𝓞 F ⧸ v) : AlgebraicClosure k)

/-- A rational prime `p` splits completely in `F` and `r` is strongly decomposed generic at every
prime of `𝓞 F` above `p` (the hypothesis of the second assertion of CS17 Theorem 1.1, README
§11.7(2)). Complete splitting is expressed by `[F : ℚ]` distinct primes of `𝓞 F` above `p`.
Strong genericity at a prime above `p` excludes `p = ℓ`. -/
def IsCompletelySplitStrongGenericPrime {F L k : Type*} [Field F] [NumberField F] [Field L]
    [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}
    (r : (L ≃ₐ[F] L) →* Matrix.GeneralLinearGroup (Fin n) k) (p : ℕ) : Prop :=
  p.Prime ∧
  (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 F)).ncard = Module.finrank ℚ F ∧
  ∀ v : Ideal (𝓞 F), v.IsMaximal → (p : 𝓞 F) ∈ v → IsStrongGenericAt r v

/-- Auxiliary primes from one completely split generic prime (README §8.8(a); CS17 Remark 6.3.2,
p. 758). If one rational prime splits completely in `F` with `r` strongly decomposed generic at
every prime above it, there are infinitely many such primes. In particular they can be chosen
outside any finite set of primes. The route is Chebotarev's theorem in the Galois closure over
`ℚ` of the compositum of the field cut out by `r` and `ℚ(ζ_ℓ)` (Tau Ceti
`NumberField.Chebotarev.infinite_frobeniusPrimeSet`). -/
theorem infinite_setOf_isCompletelySplitStrongGenericPrime {F L k : Type*} [Field F]
    [NumberField F] [Field L] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k]
    {n : ℕ} (r : (L ≃ₐ[F] L) →* Matrix.GeneralLinearGroup (Fin n) k)
    (h : ∃ p₀ : ℕ, IsCompletelySplitStrongGenericPrime r p₀) :
    {p : ℕ | IsCompletelySplitStrongGenericPrime r p}.Infinite := sorry

/-- Degree-one generic places from one generic place (README §8.8(b); CS17 Remark 6.3.3 and
footnote 33, p. 758). If `r` is strongly decomposed generic at one prime `v₀` of `𝓞 F`, of any
residue degree, then it is strongly decomposed generic at infinitely many primes `v` of `𝓞 F` of
absolute residue degree one, that is, with `#(𝓞 F / v)` prime. The route is Chebotarev's theorem
in `Gal(L_r(ζ_ℓ)/F)`, for `L_r` the field cut out by `r`, applied to the Frobenius class of `v₀`:
the Frobenius class fixes `r(Frob_v)` up to conjugacy and `q_v` modulo `ℓ`,
and only degree-one places contribute to the Dirichlet density (Tau Ceti
`NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` and
`TauCeti.hasDirichletDensity_inter_compl_higherDegreePrimes_iff`). -/
theorem infinite_setOf_isStrongGenericAt_degree_one {F L k : Type*} [Field F] [NumberField F]
    [Field L] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}
    (r : (L ≃ₐ[F] L) →* Matrix.GeneralLinearGroup (Fin n) k)
    (h : ∃ v₀ : Ideal (𝓞 F), IsStrongGenericAt r v₀) :
    {v : Ideal (𝓞 F) | (Nat.card (𝓞 F ⧸ v)).Prime ∧ IsStrongGenericAt r v}.Infinite := sorry

end TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII
