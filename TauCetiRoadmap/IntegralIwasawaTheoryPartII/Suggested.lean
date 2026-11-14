module

public import Mathlib

/-!
# IntegralIwasawaTheoryPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs whenever their
carriers are available.

Stated here: Spiess's edge isomorphism in group homology (README §0.7), the homological
input of the all-prime lower bound. Its carriers are Mathlib's `groupHomology`,
`Rep.res` and the coinflation transformation `groupHomology.coinfNatTrans`.

None of the following headlines is statable at these pins:

* The Gross–Stark leading-term theorem of Dasgupta–Kakde–Ventullo for every prime `p`
  (README §5.6), and its rank-zero case (§5.5), lack the Deligne–Ribet `p`-adic
  `L`-function `L_p(χω, s)` of a totally odd character of a totally real field and the
  Iwasawa logarithm on finite extensions of `ℚ_p` normalized by `log_p(p) = 0`, through
  which Gross's regulator is defined. The complex side exists at the pins: Tau Ceti's
  `TauCeti.LFunctions.heckeLFunctionC` is the presented meromorphic continuation of the
  Hecke `L`-series of a ray class character of any number field (zero when no
  continuation exists). Its functional equation, the nonvanishing `L(χ, 0) ≠ 0` and the
  identification of a Galois character with a ray class character are the LFunctions and
  ClassFieldTheory targets the README consumes, and none of them supplies `L_p(χω, s)`.
* The all-prime lower bound `ord_{s=0} L_p(χω, s) ≥ r` (§0.8) lacks `L_p(χω, s)` and the
  integral Sczech–Eisenstein cocycle with its measures.
* The exact-order criterion `ord_{s=0} L_p(χω, s) = r ↔ R_p(χ) ≠ 0` and its rank-one case
  (§§5.7–5.8) lack `L_p(χω, s)` and the Iwasawa logarithm.
* The cohomological formula for the regulator, `L_alg(χ) = R_p(χ)` (§1.9), lacks the
  Iwasawa logarithm on finite extensions of `ℚ_p`. Its Galois-side carriers exist at the
  pins: Tau Ceti's continuous `H¹`, the absolute local Artin map, the maps
  `TauCeti.absoluteGaloisGroupMap` of absolute Galois groups along embeddings of separable
  closures (the decomposition maps `G_{F_𝔮} → G_F`) and the inertia subgroup
  `TauCeti.inertiaSubgroup` of a nonarchimedean local field.
* Ventullo's constant-term-one family (§2.3), the normalized cuspidal projection of the
  semi-cusp family (§2.6) and the identifications of the localized Hecke image with the
  three Artin algebras (§§3.8–3.10) lack Λ-adic ordinary Hilbert modular forms and their
  Hecke algebras.

The elementary determinant, power-series and quotient-algebra formulas used in these
constructions are targets and Checks in README.md. They do not replace any of these
headline theorems here.
-/

public section

universe u

namespace TauCetiRoadmap.IntegralIwasawaTheoryPartII

open CategoryTheory

/-! ## Layer 0: arithmetic data, the regulator and the lower bound -/

/-- **Spiess's edge isomorphism.** Let `k` be a commutative ring, `G` a group, `S` a normal
subgroup of `G` and `A` a `k`-linear representation of `G` whose restriction to `S` has vanishing
group homology in every positive degree (for instance, `A` free or projective as a `k[S]`-module).
Then for every `n` the coinflation map `Hₙ(G, A) ⟶ Hₙ(G ⧸ S, A_S)`, induced by the quotient maps
`G →* G ⧸ S` and `A → A_S`, is an isomorphism. This is the degenerate case of the
Hochschild–Serre spectral sequence; README §0.7 applies it to `G = E₊ × T` and `S = T` free
abelian of finite rank acting freely on a function space (Charollois–Dasgupta, Theorem 5.1,
after Spiess; Brown, *Cohomology of Groups*, Chapter VII §6). -/
theorem isIso_coinfNatTrans_app_of_isZero_groupHomology_res {k G : Type u} [CommRing k]
    [Group G] (S : Subgroup G) [S.Normal] (A : Rep.{u} k G)
    (hA : ∀ q : ℕ, 0 < q → Limits.IsZero (groupHomology (Rep.res S.subtype A) q)) (n : ℕ) :
    IsIso ((groupHomology.coinfNatTrans k S n).app A) := by
  sorry

end TauCetiRoadmap.IntegralIwasawaTheoryPartII
