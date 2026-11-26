# Roadmap: theta series of lattices

**Summary.** The theta series of a positive definite lattice is the generating function of its
representation numbers, and the theorem that makes it useful is that it is a modular form. This
roadmap builds that bridge for a full lattice `L` in a finite-dimensional real inner product space
`E` of dimension `n`, with dual lattice `L^∨`. The lattice is *even* when every squared norm `‖v‖²`,
`v ∈ L`, is an even integer; an even lattice is integral, its discriminant group `L^∨ / L` is
finite of order `det L`, and its *level* `N` is the least positive integer with `N ‖x‖² / 2 ∈ ℤ`
for every `x ∈ L^∨`. The theta series is `Θ_L(τ) = ∑_{v ∈ L} exp(π i ‖v‖² τ)` on the upper
half-plane, and each class `γ + L` of `L^∨ / L` has its coset series
`θ_{γ+L}(τ) = ∑_{v ∈ L} exp(π i ‖γ + v‖² τ)`. The analytic engine is Poisson summation over a
lattice, in every dimension. Wherever an automorphy factor appears the rank is even, `n = 2k`, so
that the weight `k` is an integer.

The headline theorems are these. **Level one:** if `L` is even and unimodular, then `8 ∣ n` and
`Θ_L` is a modular form of weight `n/2` for `SL(2, ℤ)`; in rank `8` it is `E₄`, so `E₈` has
`240 σ₃(m)` vectors of squared norm `2m`, and the Leech lattice has theta series `E₄³ - 720Δ`,
whence its `196560` vectors of squared norm `4`. **Hecke–Schoeneberg:** if `L` is even of rank
`2k` and level `N`, then `Θ_L` is a modular form of weight `k` on `Γ₀(N)` with the quadratic
character `χ_L(d) = (D_L / d)`, the Kronecker symbol of the signed discriminant
`D_L = (-1)^k det L`; that is, `Θ_L((aτ + b)/(cτ + d)) = χ_L(d) (cτ + d)^k Θ_L(τ)` for every matrix
of `Γ₀(N)`. Under the same hypotheses every coset series `θ_{γ+L}` is a modular form of weight `k`
on the principal congruence subgroup `Γ(N)`. The arithmetic behind both is a reciprocity law for
the Gauss sums `G_L(a, c) = ∑_{y ∈ L/cL} e(a ‖y‖² / (2c))`, `e(x) = exp(2πix)`, which exchanges `a`
and `c` and passes to `L^∨`; it gives Milgram's formula `∑_{γ ∈ L^∨/L} e(‖γ‖²/2) = (det L)^{1/2} i^k`,
the evaluation `G_L(a, c) = c^k (det L)^{1/2} i^k (D_L / a)` for odd positive `a` prime to `c` with
`N ∣ c`, and the fact that the conductor of `(D_L / ·)` divides `N`. Applied to the root lattices
`A₂` and `D₄`, the number of vectors of squared norm `2m`, `m ≥ 1`, is `6 ∑_{d ∣ m} (-3 / d)` in
`A₂` and `24` times the sum of the odd divisors of `m` in `D₄`.

The real lattice model of this roadmap is compared with Tau Ceti's rational lattices, built to the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md), and their
discriminant forms are read across that comparison. The
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md) owns the arithmetic
of the rational lattice (Milgram's theorem at every signature, the rank-16 pair `E₈ ⊕ E₈`, `D₁₆⁺`
and their non-isometry). The [modular-forms roadmap](../ModularForms/README.md) supplies the
character spaces, the Sturm bound, the Fricke operators and the character Eisenstein series against
which `Θ_{A₂}` is identified. Downstream, the [L-functions roadmap](../LFunctions/README.md) and
[lattice packings and perfect forms](../LatticePackingsAndPerfectForms/README.md) use lattice Poisson
summation, and the latter, with [quaternion arithmetic](../QuaternionArithmetic/README.md), uses the
Hecke–Schoeneberg theorem.

Layer 1 proves Poisson summation over a full lattice; Layer 2 builds the real lattice model and its
arithmetic invariants, with the comparison to rational lattices and the Kronecker symbol; Layer 3
defines the theta series and their `q`-expansions; Layer 4 proves the translation and inversion
laws, and Layer 5 the level-one theorem; Layer 6 treats the Gauss sums, from reciprocity to the
nebentypus; Layer 7 proves the Hecke–Schoeneberg theorem, the modularity of the coset series and the
Fricke identities; Layer 8 identifies the classical theta series; Layer 9 treats the theta series
of a lattice in a complex Hermitian space in a Hermitian matrix variable, with its inversion law.

## How to read the build

Each layer is a list of numbered sections `### k.n`, each stating its targets in prose with their
hypotheses, the source at the claim where one is cited, a *Needs:* line and, where they earn their
place, Checks. Section numbers are fixed: §k.n is the `n`-th item of Layer `k`. Where the pinned Tau
Ceti has the declarations that realise an item, the item ends with a line *In Tau Ceti:* naming
them. Each item also has a lettered id `kX`, `X` the `n`-th letter of the alphabet, which stands in
parentheses at the end of its heading (§2.3 is 2C, §7.5 is 7E); other roadmaps cite items by these
ids.

Other roadmaps also cite targets by Lean names that this roadmap does not declare
(*poissonSummation*, *dual_dual*, *kroneckerChar*, …). Each name below stands for its section, whose
*In Tau Ceti:* line, or `Suggested.lean` for a target the pinned Tau Ceti does not prove, gives the
declaration.

| § | Cited names |
|---|---|
| 1.1 | *poissonSummation*, *poissonSummation_neg*, *poissonSummation_of_even* |
| 1.2 | *stdLattice*, *poissonSummation_stdLattice*, *dual_stdLattice* |
| 1.3 | *fourierIntegral_comp_equiv* |
| 1.4 | *mapEquiv*, *dual_mapEquiv*, *covolume_mapEquiv* |
| 1.5 | *summable_poisson_left*, *summable_poisson_right* |
| 1.6 | *gaussian*, *gaussian_apply*, *fourier_gaussian*, *fourier_gaussian_of_even* |
| 2.1 | *dual*, *dual_dual*, *IsIntegral*, *IsEven*, *IsUnimodular* |
| 2.2 | *scale* and its lemmas |
| 2.3 | *det*, *covolume_dual*, *discGroup*, *isUnimodular_iff_covolume_eq_one* |
| 2.4 | *ratModel*, *discGroupEquiv*, *RealSpace*, *realModel*, *nonempty_isometry_of_realModel* |
| 2.5 | *level* and its lemmas |
| 2.7 | *shell*, *repNum*, *cosetShell*, *cosetRepNum* |
| 2.8 | *kroneckerSym*, *kroneckerChar*, *signedDisc* |
| 3.1 | *thetaSeries*, *thetaCoset* |
| 3.2 | *thetaCosetClass*, *thetaSeries_dual_eq_sum* |
| 3.3 | *hasSum_thetaSeries*, *hasSum_thetaCoset*, *qExpansion_thetaSeries_coeff* |
| 3.4 | *thetaSeries_scale*, *thetaSeries_orthSum* |
| 3.5 | *thetaSeries_int*, *thetaSeries_stdLattice* |
| 4.2 | *thetaSeries_neg_inv* |
| 4.3 | *thetaCoset_neg_inv*, *pairingChar*, *thetaCosetClass_neg_inv* |
| 5.1 | *eight_dvd_finrank_of_even_unimodular* |
| 5.2 | *thetaForm*, *coe_thetaForm* |
| 5.4 | *existsUnique_finsupp_thetaForm* |
| 6.1 | *cSub*, *gaussTerm*, *gaussSum*, *gaussSumTwisted*, *gaussSum_one_one*, *gaussSum_add_two_mul*, *gaussSumTwisted_eq_zero*, *gaussSumTwisted_eq_of_mem*, *aSubDual*, *dualGaussTerm* |
| 6.2 | *gaussSum_reciprocity*, *tendsto_pow_mul_thetaCoset*, *tendsto_pow_im_mul_thetaSeries* |
| 6.3 | *milgram*, *eight_dvd_finrank_of_even_unimodular'*, *even_of_level_dvd_two* |
| 6.4 | *sum_dualGaussTerm_eq* |
| 6.5 | *gaussSum_eq* |
| 6.6 | *conductor_kroneckerChar_signedDisc_dvd_level*, *discChar*, *exists_odd_natCast_eq_units* |
| 7.2 | *thetaSeries_smul_eq_tsum* |
| 7.4 | *thetaFormOfLevel*, *thetaFormOfLevel_mem_modFormCharSpace* |
| 7.6 | *thetaSeries_slash_frickeGL*, *smul_thetaSeries_slash_frickeGL*, *qExpansion_thetaFormOfLevel_coeff_zero* |
| 8.1 | *thetaForm_eq_E₄*, *coe_thetaForm_rank_16*, *thetaForm_rank_16_eq* |
| 8.2 | *repNum_rank_eight*, *repNum_two_rank_eight*, *thetaForm_realModel_typeE₈RootLattice_eq_E₄* |
| 8.3 | *thetaForm_rank_24* |
| 8.4 | *coe_thetaForm_rank_24_rootless*, *repNum_rank_24_rootless*, *repNum_four_rank_24_rootless* |
| 8.5 | *thetaSeries_realModel_eq_of_rank_sixteen*, *thetaSeries_realModel_eq_and_not_isometric*, *exists_thetaSeries_eq_not_isometric* |

Layers 1 and 2 are independent of each other. Layer 3 rests on both; Layer 4 on Layers 1 and 3;
Layer 5 on Layer 4; Layer 6 on Layers 2 and 4, and not on Layer 5; Layer 7 on Layers 4 and 6;
Layer 8 on Layer 5, and for §8.6 on Layer 7; Layer 9 on Layers 1 and 2 and §3.1, and on §4.2 only
for its Examples. Nothing in Layers 1–7 mentions dimension `8`, `16` or
`24`, and no lattice is constructed here: `E₈`, the rank-16 pair, the Leech lattice, `A₂` and `D₄`
are Tau Ceti's and enter at Layer 8 and in the Examples. Each *Needs:* line lists what its statement
and its route use, item by item, so that a target proved by another route is not blocked behind an
unrelated one. `Suggested.lean` states the headline theorems of Layers 6–8 that the pinned Tau Ceti
does not prove.

## Conventions

1. **The ambient space and the carrier.** `E` is a finite-dimensional real inner product space
   (`[NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]`), with
   `[MeasurableSpace E] [BorelSpace E]` wherever `volume`, a covolume or a Fourier transform
   occurs, so that `volume` is the Haar measure normalised by orthonormal bases. A lattice is
   `L : Submodule ℤ E` with `[DiscreteTopology L] [IsZLattice ℝ L]`, and its rank is
   `Module.finrank ℝ E`, equal to `Module.finrank ℤ L`. Mathlib's full-lattice API (bases,
   covolume, discreteness, the summability estimates) is used throughout, and the lattice vocabulary
   of Layer 2 is the `ZLattice` namespace of Tau Ceti; there is no private finite free model. This
   is not the carrier `TauCeti.IntegralLattice` of rational lattices (a `ℤ`-submodule of a rational
   vector space with a rational bilinear form): the theta series is a sum of `exp(π i ‖v‖² τ)` over
   `L`, so it needs a real norm, and Poisson summation needs the Haar measure of `E` and the covolume
   of `L`. The comparison of the two models (§2.4), the rational model `ZLattice.ratModel` of an
   integral lattice and the real model `TauCeti.IntegralLattice.realModel` of a positive definite
   rational lattice, is the only place they meet; discriminant-form theory is read across it and
   never reproved in `E`.
2. **Positive definiteness is structural.** The form is the inner product of `E`, so no `PosDef`
   hypothesis appears anywhere. This is the deliberate difference from the rational carrier, where
   definiteness is a predicate because indefinite and degenerate lattices are objects of the same
   type. Indefinite lattices have no convergent theta series and are not in scope.
3. **Integral, even, unimodular.** `ZLattice.IsIntegral L` is `L ≤ L^∨` (equivalently
   `⟪x, y⟫ ∈ ℤ` for all `x, y ∈ L`, `ZLattice.isIntegral_iff`); `ZLattice.IsEven L` is
   `∀ x ∈ L, ∃ m : ℤ, ‖x‖ ^ 2 = 2 * m`; `ZLattice.IsUnimodular L` is `L = L^∨`. Evenness implies
   integrality (`ZLattice.IsEven.isIntegral`); integrality does not imply evenness (`ℤ ⊆ ℝ`). For an
   integral lattice, unimodularity is equivalent to covolume one, to determinant one and to a trivial
   discriminant group; these are theorems (§2.3), not alternative definitions.
4. **The dual lattice** is `L^∨ = ZLattice.dual L`, Mathlib's
   `LinearMap.BilinForm.dualSubmodule (innerₗ E) L` (`ZLattice.dual_def`). There is no second
   dual-lattice notion.
5. **Determinant and discriminant group.** `ZLattice.det L = (ZLattice.covolume L) ^ 2`; never call
   the covolume the determinant. The discriminant group `ZLattice.DiscriminantGroup L` is
   `L^∨ ⧸ (L ∩ L^∨)`, which is `L^∨ ⧸ L` when `L` is integral. The type exists for every lattice, but
   every statement about it carries `IsIntegral L` or `IsEven L`. ⚠ Without integrality the quotient
   need not be finite: `L = 2^{1/4} ℤ ⊆ ℝ` has `L^∨ = 2^{-1/4} ℤ` and `L ∩ L^∨ = 0`, since `√2` is
   irrational, so the quotient is `ℤ`. For integral `L`, `det L = |L^∨ / L|`, a positive integer
   (`ZLattice.IsIntegral.det_eq_card_discriminantGroup`), equal to `det Gram(b)` for any `ℤ`-basis
   `b` (`ZLattice.det_eq_det_gram`); the statements of Layers 6–8 write it as
   `Nat.card (DiscriminantGroup L)`, which needs no measure.
6. **Discriminant forms** are Tau Ceti's: the pairing `b_L` with values in `ℚ/ℤ` is
   `TauCeti.IntegralLattice.discriminantPairing` and, for even `L` only, the quadratic form
   `q_L(x + L) = ‖x‖²/2 mod ℤ` in the **half-norm** convention is
   `TauCeti.IntegralLattice.discriminantQuadraticMap`, both on the rational model; values quoted from
   Nikulin's full-norm `ℚ/2ℤ` convention are halved. Throughout, `e(x) = exp(2πix)`. As a complex
   number, `e(q_L(γ)) = exp(π i ‖γ‖²)` is computed on a representative `γ ∈ L^∨`, independent of it
   when `L` is even (`ZLattice.IsEven.cexp_pi_mul_I_mul_norm_add_sq`), and
   `e(b_L(γ, δ)) = exp(2 π i ⟪γ, δ⟫)` is `ZLattice.IsIntegral.discriminantPairingChar`, which needs
   only integrality.
7. **The level.** `ZLattice.level L` is the least `N > 0` with `N ‖x‖² / 2 ∈ ℤ` for every
   `x ∈ L^∨`. The definition is the unguarded infimum, so it has a value on every lattice (`2` on the
   odd lattice `ℤ`), and nothing relies on that value: every statement about the level carries
   `IsEven L` (or `IsIntegral L`). ⚠ The level is neither the exponent of `L^∨ / L` nor `det L`; both
   agree with it in small examples and neither does in general. It controls the dual inclusion
   `N L^∨ ⊆ L` (`ZLattice.level_nsmul_mem`), whence `det L ∣ N^n`.
8. **Scaling is not an invariance.** For a real `c ≠ 0`, `c • L` is the pointwise image; its dual is
   `c⁻¹ • L^∨`, its determinant `c^{2n} det L`, and `Θ_{c • L}(τ) = Θ_L(c² τ)`. None of integral,
   even, unimodular is preserved by a general scaling: `c • L` is integral exactly when
   `c² ⟪x, y⟫ ∈ ℤ` for all `x, y ∈ L`, and in positive rank a unimodular lattice scaled by `|c| ≠ 1`
   is never unimodular. The scalings that occur are by `√m` for a positive integer `m`: `√m • L` is
   integral when `L` is, even when `L` is even or `m` is even (and `L` integral), and
   `det(√m • L) = m^n det L`, so `√2 • E₈` is even and not unimodular. Scaling down can create
   unimodularity: `(1/√2) • (√2 ℤ) = ℤ`. A negative scalar gives the same lattice. Strict statements
   need positive rank: in the zero-dimensional space the zero lattice is even and unimodular, fixed by every
   scaling, with `Θ_0 = 1`, `det 0 = 1` and `level 0 = 1`.
9. **The theta series and its `q`-parameter.** `ZLattice.thetaSeries L τ` is
   `∑' v : L, exp(π * I * ‖v‖ ^ 2 * τ)` and `ZLattice.thetaCoset L γ τ` is
   `∑' v : L, exp(π * I * ‖γ + v‖ ^ 2 * τ)`, for `τ : ℍ` and `γ : E`. ⚠ The exponent is
   `π i ‖v‖² τ`, not `2 π i ‖v‖² τ`: with `q = exp(2πiτ)` and `L` even,
   `Θ_L = ∑_{m ≥ 0} r_L(2m) q^m` with `r_L(t)` the number of `v ∈ L` with `‖v‖² = t`
   (`ZLattice.representationNumber`), and the level-one series match `E₄` and `Δ` on the nose.
10. **Coset representation numbers and the `q_N`-support.** `r_{γ+L}(t)` is the number of `v ∈ L`
    with `‖γ + v‖² = t` (`ZLattice.cosetRepresentationNumber`). For `L` even of level `N`,
    `γ ∈ L^∨` and `q_N = exp(2πiτ/N)`, `θ_{γ+L} = ∑_{m ≥ 0} r_{γ+L}(2m/N) q_N^m`, and every exponent
    with a nonzero coefficient satisfies `m ≡ N q_L(γ) (mod N)`, the residue of the integer
    `N ‖γ‖²/2`. ⚠ `q_L(γ)` fixes a congruence class of exponents, not the first exponent, which is
    `N/2` times the least squared norm in `γ + L`. The support congruence is what boundedness at every
    cusp is read off from (§7.4).
11. **The theta series of the dual.** For integral `L`, `Θ_{L^∨} = ∑_{γ ∈ L^∨/L} θ_{γ+L}`, a finite
    sum, and `θ_{0+L} = Θ_L`. ⚠ Integrality is needed: for `L = ½ ℤ`, `L^∨ = 2ℤ ⊆ L`, the quotient
    `L^∨ ⧸ (L ∩ L^∨)` is trivial, and the unguarded identity would read `Θ_{2ℤ} = Θ_{½ℤ}`, false at
    `τ = i`. The coset series satisfy `θ_{-γ} = θ_γ`, so the family `(θ_γ)_{γ ∈ L^∨/L}` is not
    linearly independent; no statement about matrices acting on `ℂ[L^∨/L]` is read off identities
    between theta functions.
12. **Two names, one object.** `ZLattice.thetaSeries L : ℍ → ℂ` is the function. A bundled modular
    form is a separate declaration whose coercion is that function: at level one the theta form of
    §5.2 (`ZLattice.thetaForm`, with `ZLattice.coe_thetaForm`), at general level the form of §7.4.
    Analytic facts are stated about the function and membership facts about the bundled form; the
    transformation laws are not restated on the bare function once the bundled form exists.
13. **The slash action and the modular group** are Mathlib's: `SlashAction`, `ModularGroup.S`,
    `ModularGroup.T`, `CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0`,
    `CongruenceSubgroup.Gamma1`, modular forms on the images under
    `Matrix.SpecialLinearGroup.mapGL ℝ`, and the right-action law
    `f ∣[k] (A * B) = (f ∣[k] A) ∣[k] B`; `−I` acts in weight `k` by `(-1)^k`
    (`ModularForm.slash_neg_one`). For `A ∈ SL(2, ℤ)` the entries are `A 0 0 = a`, `A 0 1 = b`,
    `A 1 0 = c`, `A 1 1 = d`. Spaces with nebentypus are Tau Ceti's `modFormCharSpace k χ`, the joint
    diamond eigenspace in the modular forms of weight `k` on `Γ₁(N)`, with `χ : (ZMod N)ˣ →* ℂˣ`;
    the classical transformation law is reached through `mem_modFormCharSpace_iff_nebentypus`. There
    is no separate type of modular forms with character.
14. **Gauss sums of a lattice.** For `L` even, `a : ℤ` and `c : ℕ`, `G_L(a, c)` is
    `ZLattice.gaussSum L hL a c`, the sum over the classes of `L ⧸ cL` (with `cL` the lattice
    `(c : ℝ) • L` read in `L`, a quotient of order `c^n`) of `e(a ‖y‖² / (2c))`; for `m ∈ L^∨` the
    twisted sum `G_L(a, c; m)` of `e(a ‖y‖²/(2c) + ⟪y, m⟫/c)` is `ZLattice.gaussSumTwisted`; and for
    `t : ℤ` the dual-side sum `∑_{y ∈ L^∨/aL} e(t ‖y‖² / (2a))` over the `a^n det L` classes of
    `L^∨ ⧸ aL` is `ZLattice.dualGaussSum L hL t a`. ⚠ The summands (`ZLattice.gaussTerm`,
    `ZLattice.dualGaussTerm`) are defined on the quotients, and their descent is false without
    evenness and without `m ∈ L^∨`, so both are arguments of the summand. On `L = ℤ` with
    `a = c = 1`, `m = 0`, the representatives `0` and `1` of the one class give `1` and `-1`; on
    `L = √2 ℤ` with `a = c = 1` and `m = 1/(2√2) ∉ L^∨`, the representatives `0` and `√2` give `1`
    and `-1`. The same holds for `e(q_L)` on `L^∨ / L` (on `ℤ`, `0` and `1` give `1` and `-1`) and
    for the dual-side summand. The pairing character `e(⟪γ, δ⟫)` alone needs no hypothesis, since
    `L` pairs integrally with `L^∨`; Tau Ceti states it for integral `L`.
15. **The nebentypus.** For `L` even of rank `2k`, the signed discriminant is
    `D_L = (-1)^k det L`; it is `≡ 0` or `1 (mod 4)` (§2.8), so `(D_L / ·)` is the Kronecker
    character `TauCeti.kroneckerChar ℂ D_L` at modulus `|D_L|`. The nebentypus `χ_L` (`nebentypus`,
    §6.6) is the character at modulus `N` induced from its primitive character, which is legitimate
    because the conductor divides `N`, a theorem (§6.6) and not a convention. Both faces are kept:
    `χ_L` as a Dirichlet character, and its unit homomorphism `MulChar.toUnitHom` for
    `modFormCharSpace`.
16. **Isometry** means a `LinearIsometryEquiv` `e : F ≃ₗᵢ[ℝ] E` of the ambient spaces; invariance
    statements are made for the pulled-back lattice `ZLattice.comap ℝ L e.toLinearEquiv.toLinearMap`,
    never against a bare additive or module equivalence.
17. **Orthogonal direct sums** are `ZLattice.orthSum L M` inside `WithLp 2 (E × F)`, with the product
    inner product. Fixed once: `Θ_{L ⊕ M} = Θ_L Θ_M` (§3.4), `det(L ⊕ M) = det L det M`,
    `level(L ⊕ M) = lcm(level L, level M)` (§2.5), `A_{L⊕M} ≅ A_L × A_M` as finite quadratic modules
    (§2.9), and integrality, evenness and unimodularity are each preserved by orthogonal sum and by
    isometry (§2.1).
18. **Rank and weight.** Layers 1–3 hold in arbitrary rank. Wherever an automorphy factor appears,
    `n = 2k` with `k : ℕ`, so the factor is `(τ/i)^k = (-i)^k τ^k`, an integer power;
    `Complex.cpow` occurs only in the general-rank Fourier transform of the Gaussian (§1.6). A
    lattice of odd rank has a theta series of half-integral weight, which needs the metaplectic group
    and a branch of `√τ`; half-integral weight is out of scope. Mathlib's odd-rank law
    `jacobiTheta_S_smul` is consumed only through its square (§4.4), and the rank-one
    Landsberg–Schaar identity is not a target: its square at rank two is a Check of §6.2.
19. **Files.** The targets belong beside Tau Ceti's existing files: lattice Poisson summation in
    `TauCeti/Analysis/Fourier/` and `TauCeti/Analysis/Distribution/SchwartzSpace/`, the real lattice
    model and lattice Gauss sums in `TauCeti/Algebra/Module/ZLattice/`, the Kronecker symbol in
    `TauCeti/NumberTheory/LegendreSymbol/`, theta series, their modularity and Hermitian theta
    series in `TauCeti/NumberTheory/ModularForms/ThetaSeries/`.

## Layer 1: Poisson summation for a lattice

The analytic engine. Mathlib has Poisson summation for `ℤ ⊆ ℝ` only, and every transformation law
below is an instance of the lattice theorem. It is stated for a general `E` and general `n` from the
outset: a dimension-`8` or dimension-`24` version would be useless to the other, and the
sphere-packing formalization shows the cost of the specialized form (*Provenance*). It needs the dual
lattice of Convention 4 and nothing else of Layer 2, and can proceed beside it.

### 1.1 Poisson summation over a full lattice (1A)

For a full lattice `L` in `E`, a Schwartz function `f : 𝓢(E, ℂ)` and `v : E`, prove

```text
∑' ℓ : L, f (v + ℓ) = (covol L)⁻¹ * ∑' m : L^∨, 𝓕 f m * e(⟪v, m⟫)
```

with `𝓕` Mathlib's Fourier transform, `𝓕 f (ξ) = ∫ f(x) e(-⟪x, ξ⟫) dx`, and both families summable
(§1.5). ⚠ The sign convention is fixed by `𝓕`, not by the literature. With Mathlib's `𝓕` the
character is `e(+⟪v, m⟫)`. Reindexing the dual sum by `m ↦ -m` reflects the transform as well as
the character: it gives `∑_m 𝓕f(-m) e(-⟪v, m⟫)`, which is the minus-phase sum
`∑_m 𝓕f(m) e(-⟪v, m⟫)` of sources with the opposite convention only when `𝓕f(-m) = 𝓕f(m)`, that
is for even `f`; for a general Schwartz `f` that minus-phase sum is `covol L` times the lattice sum
at `-v`, not at `v`. State the `+` version as the theorem and record two corollaries, so that no
downstream proof guesses:

```text
∑' ℓ : L, f (v + ℓ) = (covol L)⁻¹ * ∑' m : L^∨, 𝓕 f (-m) * e(-⟪v, m⟫)
∑' ℓ : L, f (v + ℓ) = (covol L)⁻¹ * ∑' m : L^∨, 𝓕 f m * e(-⟪v, m⟫)
```

the first, the reflected form, for every `f`, and the second, the minus-phase form, under the
explicit hypothesis `∀ x, f (-x) = f x`. The Gaussian of §1.6 is even, so on the uses of §§4.2–4.3
all three agree; the distinction matters only for a general `f`. *Route:* carry `L` to the lattice
of an orthonormal basis by a linear automorphism (§1.4) and transport the base case §1.2 through the
change of variables §1.3.

*Needs:* §§1.2–1.5; Mathlib `SchwartzMap`, the Fourier transform on an inner product space,
`ZLattice.covolume`, `LinearMap.BilinForm.dualSubmodule`.

*In Tau Ceti:* `SchwartzMap.tsum_eq_tsum_dual_fourier`, `SchwartzMap.tsum_eq_tsum_dual_fourier_neg`,
`SchwartzMap.tsum_eq_tsum_dual_fourier_of_even`.

### 1.2 The lattice of an orthonormal basis (1B)

For an orthonormal basis `o` of `E`, the lattice `ℤo` spanned by `o` (in coordinates,
`ℤ^n ⊆ EuclideanSpace ℝ (Fin n)`) is its own dual, has covolume `1`, and satisfies Poisson summation
with constant `1`: `∑' ℓ : ℤo, f(v + ℓ) = ∑' m : ℤo, 𝓕 f m · e(⟪v, m⟫)` for every Schwartz `f` and
`v : E`. Prove also, as separate targets: that fixing one factor of a Schwartz function on a product
`P × E` gives a Schwartz function on `E`, each of whose seminorms is bounded by the same seminorm of
the original function, uniformly in the frozen variable; and that the lattice sum
`∑_ℓ ‖f(v + ℓ)‖` of a Schwartz function converges absolutely, so that a sum over `ℤ^n` may be
computed coordinate by coordinate. ⚠ The reduction from a general `L` to `ℤo` is by change of
variables (§§1.3–1.4), not by induction on `n`: an inductive proof over general lattices would need
a Schwartz structure on partial sums that nothing supplies.

*Route:* the periodization `x ↦ ∑_ℓ f(x + ℓ)` is continuous and `ℤo`-periodic, its Fourier
coefficients on the torus `(ℝ/ℤ)^n` are the values of `𝓕 f` at the points of `ℤo`, and these are
summable, so its multivariate Fourier series converges to it; the one-dimensional case is Mathlib's
`Real.tsum_eq_tsum_fourier`. A coordinate-by-coordinate route through `n` applications of that
theorem needs partial Fourier transforms, which are AnalyticNumberTheoryPartII §5.3g's
(*Scope and ownership*).

*Needs:* Mathlib `OrthonormalBasis`, `SchwartzMap`, `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`,
`Real.tsum_eq_tsum_fourier`.

*In Tau Ceti:* `SchwartzMap.tsum_eq_tsum_fourier_span_orthonormalBasis`,
`ZLattice.dual_span_orthonormalBasis`, `SchwartzMap.sliceRightCLM`,
`SchwartzMap.seminorm_sliceRightCLM_le`, `ZLattice.summable_norm_poisson_left`.

### 1.3 Fourier change of variables (1C)

For a continuous linear automorphism `A : E ≃L[ℝ] E` of a finite-dimensional real inner product
space, prove `𝓕 (f ∘ A) = |det A|⁻¹ • (𝓕 f) ∘ (A⁻¹)ᵀ`, where `(A⁻¹)ᵀ` is the adjoint of the inverse
(`ContinuousLinearMap.adjoint`). Mathlib has the isometry case; the general one follows from the
change-of-variables formula for `volume` under a linear map. Passing between `E` and
`EuclideanSpace ℝ (Fin n)` is the isometry case, so automorphisms of one space suffice.

*Needs:* Mathlib `ContinuousLinearMap.adjoint`, `LinearMap.det`, the Fourier transform, the
change of variables for Haar measure under a linear map.

*In Tau Ceti:* `ContinuousLinearEquiv.fourier_comp`.

### 1.4 Dual-lattice transport (1D)

For `A : E ≃L[ℝ] E` and a full lattice `L`, prove that `A L` is a full lattice,
`(A L)^∨ = (A⁻¹)ᵀ L^∨` and `covol (A L) = |det A| · covol L`; and that for every orthonormal basis
`o` there is an automorphism `A` with `A(ℤo) = L`, `(A⁻¹)ᵀ(ℤo) = L^∨` and `|det A| = covol L`
(take the `A` carrying `o` to a `ℤ`-basis of `L`). Together with §§1.2 and 1.3 this assembles into
§1.1, `|det A| = covol L` supplying the constant.

*Needs:* §1.2 (the dual of `ℤo`); Mathlib `ZLattice.comap`, `ZLattice.covolume`,
`ContinuousLinearMap.adjoint`.

*In Tau Ceti:* `ZLattice.dual_comap_continuousLinearEquiv`,
`ZLattice.covolume_comap_continuousLinearEquiv`, `ZLattice.exists_comap_span_orthonormalBasis_eq`.

### 1.5 Summability (1E)

For a Schwartz function `f` and `v : E`, prove that both sides of §1.1 are absolutely summable on
their own: `ℓ ↦ f(v + ℓ)` over `L` and `m ↦ 𝓕 f m · e(⟪v, m⟫)` over `L^∨`, from Mathlib's decay
estimate `ZLattice.summable_norm_rpow` and the Schwartz seminorm bounds. Downstream proofs need the
summability statements on their own, not only inside the equality.

*Needs:* Mathlib `ZLattice.summable_norm_rpow`, `SchwartzMap`; that `𝓕 f` is again Schwartz.

*In Tau Ceti:* `ZLattice.summable_poisson_left`, `ZLattice.summable_poisson_right`,
`ZLattice.summable_norm_poisson_left`.

### 1.6 Gaussians (1F)

Prove that `x ↦ exp(π i τ ‖x‖²)` is a Schwartz function for `Im τ > 0`, that its translates are
Schwartz, and, from Mathlib's Fourier transform of the Gaussian on an inner product space, that for
`Im τ > 0`

```text
𝓕 (x ↦ exp(π i τ ‖x‖²)) (y) = (τ/i)^(-n/2) * exp(π i (-1/τ) ‖y‖²)
```

with `Complex.cpow` (the one place it appears, and not a modularity statement), and at even rank
`n = 2k` the form `((-i)^k τ^k)⁻¹ * exp(π i (-1/τ) ‖y‖²)` with an integer power; the latter is the
shape Layer 4 consumes.

*Needs:* Mathlib `fourier_gaussian_innerProductSpace`, `SchwartzMap.compSubConstCLM` (translates).

**Checks.**
- At `τ = i` the function `exp(-π ‖x‖²)` is its own Fourier transform, since `(i/i)^(-n/2) = 1` and
  `-1/i = i`. With the exponent doubled to `2 π i ‖x‖² τ` it would not be: at `τ = i` the function
  `exp(-2π ‖x‖²)` has transform `2^(-n/2) exp(-π ‖ξ‖²/2)`.

*In Tau Ceti:* `TauCeti.gaussianSchwartzMap` (at `b = -π i τ`), `TauCeti.gaussianSchwartzMap_apply`,
`TauCeti.fourier_cexp_pi_mul_I_mul_norm_sq_mul`,
`TauCeti.fourier_cexp_pi_mul_I_mul_norm_sq_mul_of_finrank_eq`.

### Examples

- For `E = ℝ` and `L = ℤ`, §1.1 is Mathlib's Poisson summation `Real.tsum_eq_tsum_fourier`.
- Applied to the Gaussian of §1.6 at `v = 0`, §1.1 is the inversion law of §4.2; at a general `v`
  it is §4.3.

### Dependencies

Mathlib only: Schwartz functions, the Fourier transform, Poisson summation on `ℝ`, Fourier series
on the torus, full lattices and their covolume, the dual submodule of a bilinear form. No other layer
of this roadmap.

## Layer 2: the real lattice model, the bridge, and the arithmetic invariants

Everything downstream reads its hypotheses from this layer. Rank is arbitrary throughout the layer.

### 2.1 Predicates and their equivalences (2A)

Define integrality, evenness and unimodularity as in Convention 3. Prove: evenness implies
integrality, by polarization; integrality is equivalent to `L ≤ L^∨` and to `⟪x, y⟫ ∈ ℤ` for all
`x, y ∈ L`; `L^∨` is again a full lattice, as an instance, so that no downstream statement carries
it as a side condition; `(L^∨)^∨ = L`; and each predicate is invariant under isometry, and holds for
an orthogonal sum `L ⊕ M` exactly when it holds for `L` and for `M`.

*Needs:* Mathlib `LinearMap.BilinForm.dualSubmodule`, `innerₗ`, `IsZLattice`; Tau Ceti
`ZLattice.orthSum`.

**Checks.**
- `ℤ ⊆ ℝ` is integral and unimodular but not even (`‖1‖² = 1`); `√2 ℤ` is even, with dual
  `(1/√2) ℤ ≠ √2 ℤ`, so not unimodular.

*In Tau Ceti:* `ZLattice.dual`, `ZLattice.dual_dual`, `ZLattice.IsIntegral`, `ZLattice.IsEven`,
`ZLattice.IsUnimodular`, `ZLattice.IsEven.isIntegral`, `ZLattice.isIntegral_iff_le_dual`,
`ZLattice.isIntegral_iff`, `ZLattice.isEven_iff`, `ZLattice.isUnimodular_iff_eq_dual`,
`ZLattice.isEven_comap_iff`, `ZLattice.isIntegral_comap_iff`, `ZLattice.isUnimodular_comap_iff`,
`ZLattice.isIntegral_orthSum_iff`, `ZLattice.isEven_orthSum_iff`, `ZLattice.isUnimodular_orthSum_iff`.

### 2.2 Scaling (2B)

For a real `c > 0`, prove that `c • L` is a full lattice, `(c • L)^∨ = c⁻¹ • L^∨`,
`covol (c • L) = c^n covol L`, `det (c • L) = c^{2n} det L`, and `(-c) • L = c • L`. Prove the
exact criteria: `c • L` is integral if and only if `c² ⟪x, y⟫ ∈ ℤ` for all `x, y ∈ L`, and even if
and only if `c² ‖x‖² ∈ 2ℤ` for all `x ∈ L`. For a positive integer `m`: `√m • L` is integral when
`L` is; `√m • L` is even when `L` is even, or when `m` is even and `L` is integral; and
`det (√m • L) = m^n det L`. In positive rank (`Nontrivial E`): for integral `L` and `m > 1`, the
lattice `√m • L` is never unimodular (its determinant is `m^n det L ≥ m^n > 1`), so that in
particular `√2 • E₈` is even and integral and not unimodular; and for unimodular `L` and
`0 < c ≠ 1`, `c • L` is not unimodular (`det = c^{2n} ≠ 1`). ⚠ Both need `Nontrivial E`: in the
zero-dimensional space the zero lattice is even, unimodular, and fixed by every scaling, with
`det = m^0 · 1 = 1`. ⚠ There is no invariance under scaling for any of the three predicates, and
none is stated or used; scaling down can create unimodularity (`(1/√2) • (√2 ℤ) = ℤ`).

*Needs:* §§2.1, 2.3; Mathlib pointwise scalar multiplication of submodules, `ZLattice.covolume`.

*In Tau Ceti:* `ZLattice.dual_smul`, `ZLattice.covolume_smul`, `ZLattice.det_smul`,
`Submodule.neg_smul_eq_smul`, `ZLattice.isIntegral_smul_iff`, `ZLattice.isEven_smul_iff`,
`ZLattice.IsIntegral.sqrt_smul`, `ZLattice.IsEven.sqrt_smul`, `ZLattice.IsIntegral.isEven_sqrt_smul`,
`ZLattice.det_sqrt_smul`, `ZLattice.IsIntegral.not_isUnimodular_sqrt_smul`,
`ZLattice.IsIntegral.not_isUnimodular_smul`, `ZLattice.IsUnimodular.not_isUnimodular_smul`.

### 2.3 Covolume, determinant, index (2C)

Prove `covol L^∨ = (covol L)⁻¹`; that for integral `L` the determinant `det L = (covol L)²` is a
positive integer; that for integral `L` the discriminant group `L^∨ ⧸ L` is finite of order
`det L = [L^∨ : L]` (⚠ both need integrality; Convention 5); and that `det L = det Gram(b)` for any
`ℤ`-basis `b`, by consuming Mathlib's `ZLattice.covolume_eq_det` rather than reproving a
determinant–index formula. Deduce the forms of unimodularity: for integral `L`,
`L = L^∨ ⟺ covol L = 1 ⟺ det L = 1 ⟺ L^∨/L` is trivial. ⚠ This equivalence is what lets a consumer
holding the sphere-packing predicate `covol L = 1` reach `L = L^∨`; it is stated in that direction
explicitly.

*Needs:* §2.1; Mathlib `ZLattice.covolume`, `ZLattice.covolume_eq_det`, the covolume and relative
index of a sublattice.

**Checks.**
- `√2 ℤ²` has covolume `2`, determinant `4`, and `L^∨/L = ((1/√2)ℤ / √2ℤ)² ≅ (ℤ/2)²` of order `4`;
  `A₂` has determinant `3` and `L^∨/L ≅ ℤ/3`. The covolume is not the determinant.

*In Tau Ceti:* `ZLattice.covolume_dual`, `ZLattice.det`, `ZLattice.det_def`,
`ZLattice.DiscriminantGroup`, `ZLattice.IsIntegral.det_eq_card_discriminantGroup`,
`ZLattice.IsIntegral.one_le_det`, `ZLattice.IsIntegral.finite_discriminantGroup`,
`ZLattice.IsIntegral.det_eq_relIndex`, `ZLattice.det_eq_det_gram`,
`ZLattice.IsIntegral.det_toMatrix_integralForm`, `ZLattice.IsIntegral.isUnimodular_iff_det_eq_one`,
`ZLattice.IsIntegral.isUnimodular_iff_covolume_eq_one`,
`ZLattice.IsIntegral.isUnimodular_iff_subsingleton_discriminantGroup`.

### 2.4 The bridge to the rational model (2D)

For an integral `L ⊆ E`, the integer-valued form `⟪·,·⟫ : L × L → ℤ` is a symmetric bilinear form
over `ℤ`, and Tau Ceti's rationalization `TauCeti.IntegralLattice.ofIntegralForm` turns it into a
rational lattice on `ℚ ⊗[ℤ] L` whose carrier is the image of `L`: the rational model `ratModel L`.
Prove it nondegenerate and positive definite, even and unimodular exactly when `L` is, and that its
dual, discriminant group, discriminant pairing and, when `L` is even, discriminant quadratic map
correspond, under the evident map `ℚ ⊗[ℤ] L → E`, to `L^∨`, `L^∨/L`, `⟪·,·⟫ mod ℤ` and
`‖·‖²/2 mod ℤ` computed in `E`; in particular an equivalence of `L^∨/L` with the discriminant group
of the rational model carrying the pairing and, for even `L`, the quadratic form. Prove the converse
construction, the real model `realModel M` of a positive definite rational lattice `M` (extend
scalars to `ℝ` and take the inner product induced by the form), that the two constructions are
mutually inverse up to isometry, and that a real linear isometry carrying `realModel M` onto
`realModel M'` induces an isometry of the rational lattices `M` and `M'`, so that non-isometry
proved on the rational side transfers to the real model (§8.5). Prove that the invariants agree:
rank; the determinant and the discriminant with `det`; evenness; unimodularity; the order of the
discriminant group; shells with `vectorsOfNorm` (§2.7); and the level with the level of the
rational model, which for even `L` is the order of its discriminant quadratic map (§2.5). ⚠ This is
the only place the two models are compared. After it, discriminant-form facts are quoted across it
and never reproved in `E`.

*Needs:* §§2.1, 2.3; Tau Ceti `TauCeti.IntegralLattice` with its dual, discriminant group,
discriminant pairing, discriminant quadratic map, determinant, discriminant, level and
`vectorsOfNorm`, `TauCeti.IntegralLattice.ofIntegralForm`.

*In Tau Ceti:* `ZLattice.ratModel`, `ZLattice.isPosDef_ratModel`, `ZLattice.instIsNondegenerateRatModel`,
`ZLattice.isEven_ratModel_iff`, `ZLattice.isUnimodular_ratModel_iff`, `ZLattice.ratModelDualEquiv`,
`ZLattice.ratModelDiscriminantGroupEquiv`,
`ZLattice.discriminantPairing_ratModelDiscriminantGroupEquiv_mk_eq_coe_iff`,
`ZLattice.discriminantQuadraticMap_ratModelDiscriminantGroupEquiv_mk_eq_coe_iff`,
`ZLattice.determinant_ratModel`, `ZLattice.discriminant_ratModel`, `ZLattice.finrank_ratModel`,
`ZLattice.level_ratModel`, `ZLattice.ncard_vectorsOfNorm_ratModel`,
`TauCeti.IntegralLattice.realModel`, `TauCeti.IntegralLattice.RealModelSpace`,
`TauCeti.IntegralLattice.isIntegral_realModel`, `TauCeti.IntegralLattice.isEven_realModel_iff`,
`TauCeti.IntegralLattice.isUnimodular_realModel_iff`,
`TauCeti.IntegralLattice.ratModelRealModelIsometry`, `ZLattice.realModelRatModelIsometry`,
`TauCeti.IntegralLattice.Isometry.ofRealModel`, `TauCeti.IntegralLattice.map_realModel_ne_realModel`,
`TauCeti.IntegralLattice.det_realModel`, `TauCeti.IntegralLattice.natCard_discriminantGroup_realModel`,
`TauCeti.IntegralLattice.level_realModel`, `TauCeti.IntegralLattice.representationNumber_realModel`.

### 2.5 The level (2E)

Define the level as in Convention 7. For integral `L`, prove `0 < level L` and that the three
characterizations agree: the least `N > 0` with `N ‖x‖²/2 ∈ ℤ` for every `x ∈ L^∨`; the level of
the rational model (§2.4), which for even `L` is the order of its discriminant quadratic map; and
the least `N > 0` for which `N · Gram(b)⁻¹` is an even integral matrix, for any `ℤ`-basis `b`. For
even `L`, prove `level L = 1` exactly when `L` is unimodular. Prove that the level is invariant
under isometry,
that `level (L ⊕ M) = lcm (level L, level M)`, that the exponent of `L^∨/L` divides `level L`, that
`level L` divides `2 det L`, that `N L^∨ ⊆ L` for `N = level L`, and hence `det L ∣ N^n`; and that
every prime dividing `det L` divides `N`.

*Needs:* §§2.3, 2.4; Mathlib `Matrix`, `AddMonoid.exponent`.

**Checks.**
- `√2 ℤ²`: the class of `(1/√2, 0)` has `‖x‖²/2 = 1/4`, so the level is `4`, while `L^∨/L ≅ (ℤ/2)²`
  has exponent `2`. `A₂ ⊕ A₂` has determinant `9` and level `3`. The level is neither the exponent
  nor the determinant.

*In Tau Ceti:* `ZLattice.level`, `ZLattice.level_dvd_iff`, `ZLattice.IsIntegral.level_pos`,
`ZLattice.level_ratModel`, `TauCeti.IntegralLattice.IsEven.level_dvd_iff`,
`ZLattice.level_dvd_iff_gram`, `ZLattice.isLeast_level`, `ZLattice.IsEven.level_eq_one_iff`,
`ZLattice.level_comap`, `ZLattice.level_orthSum`, `ZLattice.exponent_discriminantGroup_dvd_level`,
`ZLattice.level_dvd_two_mul_card_discriminantGroup`, `ZLattice.level_nsmul_mem`,
`ZLattice.card_discriminantGroup_dvd_level_pow`, `ZLattice.prime_dvd_level`.

### 2.6 The Fricke partner (2F)

For even `L` of level `N`, prove that `√N • L^∨` is again an even lattice, with
`det (√N • L^∨) = N^n / det L`, and that its level divides `N`. Prove the exact value: with `c_L`
the content of `L`, the greatest common divisor of the half-norms `‖x‖²/2` over `x ∈ L`,
`level (√N • L^∨) = N / gcd(N, c_L)`; in particular the level is `N` exactly when `N` is prime to
`c_L`, that is, when no prime dividing `N` divides every half-norm of `L`. ⚠ `level (√N • L^∨) = N`
is false in general: `√2 • E₈` is even of level `2`, and `√2 • (√2 • E₈)^∨ = E₈` has level `1`.

*Needs:* §§2.2, 2.5.

**Checks.**
- `√2 • E₈`: level `2`, content `2` (the half-norms of `√2 • E₈` are the squared norms of `E₈`), so
  the Fricke partner has level `2 / gcd(2, 2) = 1`; it is `E₈`.

*In Tau Ceti:* `ZLattice.isEven_sqrt_level_smul_dual`, `ZLattice.IsIntegral.det_sqrt_level_smul_dual`,
`ZLattice.content`, `ZLattice.IsEven.level_sqrt_level_smul_dual`,
`ZLattice.IsEven.level_sqrt_level_smul_dual_dvd`,
`ZLattice.IsEven.level_sqrt_level_smul_dual_eq_level_iff`,
`TauCeti.IntegralLattice.level_sqrt_two_smul_realModel_typeE₈RootLattice`,
`TauCeti.IntegralLattice.level_sqrt_level_smul_dual_sqrt_two_smul_realModel_typeE₈RootLattice`.

### 2.7 Shells and representation numbers (2G)

Define the shell `{v ∈ L | ‖v‖² = t}` and the representation number `r_L(t)`, its cardinality, and
for `γ : E` the coset shell `{v ∈ L | ‖γ + v‖² = t}` with cardinality `r_{γ+L}(t)`. Prove each shell
and each coset shell finite (from discreteness and boundedness), `r_L(0) = 1`, `r_L` invariant under
isometry, and the polynomial bound `r_L(t) = O(t^{n/2})` as `t → ∞`, needed for the `q`-expansion
estimates. Prove that for even `L` the shells are empty unless `t ∈ 2ℕ`, and for integral `L`
unless `t ∈ ℕ`; and that for even `L` of level `N` and `γ ∈ L^∨` the coset shell at `t` is empty
unless `N t / 2` is a natural number congruent to `N q_L(γ)` modulo `N` (indeed unless
`t ∈ ‖γ‖² + 2ℤ`). **Convolution.** For even `L` and `M` and `m : ℕ`,
`r_{L⊕M}(2m) = ∑_{i ≤ m} r_L(2i) r_M(2(m - i))`, a finite sum; for general lattices the same
identity holds as a sum over the finite set of squared norms `s ≤ t` represented by `L`:
`r_{L⊕M}(t) = ∑_s r_L(s) r_M(t - s)`. ⚠ There is no sum over all real `s`. ⚠ The shell is a `Set`
with a finiteness theorem, not a `Finset` behind a decidability instance: the sets are not decidable
and the finiteness is the content. For integral `L` the shells are the sets `vectorsOfNorm` of the
rational model (§2.4) read in `E`, not a second notion; that they give the `q`-expansion
coefficients of `Θ_L` is §3.3.

*Needs:* §§2.1, 2.4, 2.5; Mathlib discreteness of full lattices and `Asymptotics.IsBigO`.

*In Tau Ceti:* `ZLattice.shell`, `ZLattice.representationNumber`, `ZLattice.cosetShell`,
`ZLattice.cosetRepresentationNumber`, `ZLattice.finite_shell`, `ZLattice.finite_cosetShell`,
`ZLattice.representationNumber_zero`, `ZLattice.representationNumber_comap`,
`ZLattice.representationNumber_isBigO`, `ZLattice.IsEven.shell_eq_empty`,
`ZLattice.IsIntegral.shell_eq_empty`, `ZLattice.IsEven.cosetShell_eq_empty`,
`ZLattice.IsEven.cosetRepresentationNumber_div_eq_zero_of_not_modEq`,
`ZLattice.IsEven.representationNumber_orthSum`, `ZLattice.representationNumber_orthSum`,
`ZLattice.representedNormsLE`, `ZLattice.shell_eq_image_vectorsOfNorm_ratModel`.

### 2.8 The Kronecker symbol (2H)

Mathlib has `jacobiSym` for odd denominators only. Define the Kronecker symbol `(a / b)` for all
integers `a`, `b`, extending it with the standard values at `2`, `-1` and `0`: `(a / 2)` is `0`
for even `a`, `1` for `a ≡ ±1 (mod 8)` and `-1` for `a ≡ ±3 (mod 8)`; `(a / -1)` is `-1` for
`a < 0` and `1` otherwise; `(a / 0)` is `1` for `a = ±1` and `0` otherwise. ⚠ The last is not
`jacobiSym a 0 = 1`; the two symbols agree on odd positive denominators only. Prove:
multiplicativity in the second argument over nonzero factors, as in Mathlib's `jacobiSym.mul_right'`,
and without any restriction on the factors when the numerator is not `-1`; agreement with
`jacobiSym` and `legendreSym` where those are defined; and, for `D ≡ 0, 1 (mod 4)`, `D ≠ 0`, that
`(D / ·)` is periodic modulo `|D|` and multiplicative without restriction (such `D` is never `-1`),
so that it defines the Kronecker character `(D / ·)`, a quadratic Dirichlet character modulo `|D|`
with value `sign D` at `-1`. Prove that for an even lattice of rank `2k`, `D_L = (-1)^k det L`
satisfies `D_L ≡ 0` or `1 (mod 4)`. ⚠ Nothing in this layer produces a character modulo the level;
that needs the conductor theorem of §6.6, and `χ_L` is defined there.

*Needs:* §2.3; Mathlib `jacobiSym`, `legendreSym`, `ZMod.χ₈`, `DirichletCharacter`.

**Checks.**
- `(2 / 0) = 0`, while `jacobiSym 2 0 = 1`: the Kronecker symbol is not `jacobiSym` extended
  verbatim, and agreement holds at odd positive denominators only.
- `(-1 / 0) = 1` and `(-1 / 3) = -1`, while `(-1 / 0 · 3) = (-1 / 0) = 1`: multiplicativity in the
  denominator needs nonzero factors or a numerator other than `-1`.
- `(5 / 2) = -1`, since `5 ≡ -3 (mod 8)`; the character `(-4 / ·)` modulo `4` has value `-1` at `-1`,
  which is `sign(-4)`.

*In Tau Ceti:* `TauCeti.kroneckerSym`, `TauCeti.kroneckerSym_eq_jacobiSym`,
`TauCeti.kroneckerSym_eq_legendreSym`, `TauCeti.kroneckerSym_two_right`,
`TauCeti.kroneckerSym_neg_one_right`, `TauCeti.kroneckerSym_zero_right`,
`TauCeti.kroneckerSym_mul_right`, `TauCeti.kroneckerSym_mul_right_of_ne_neg_one`,
`TauCeti.kroneckerSym_mod_right'`, `TauCeti.kroneckerChar`, `TauCeti.kroneckerChar_intCast`,
`TauCeti.kroneckerChar_isQuadratic`, `TauCeti.kroneckerChar_neg_one`,
`ZLattice.IsEven.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one`.

### 2.9 The discriminant group of an orthogonal sum (2I)

For full lattices `L ⊆ E` and `M ⊆ F`, the dual of the orthogonal sum is the orthogonal sum of the
duals (`ZLattice.dual_orthSum`). Prove that the induced map is an additive equivalence

```text
DiscriminantGroup (orthSum L M) ≃+ DiscriminantGroup L × DiscriminantGroup M,
```

sending the class of `(x, y)`, `x ∈ L^∨`, `y ∈ M^∨`, to the pair of classes, with no integrality
hypothesis; that for integral `L` and `M` it carries the pairing character of `L ⊕ M` to the product
of the two pairing characters, `e(⟪(x, y), (x', y')⟫) = e(⟪x, x'⟫) e(⟪y, y'⟫)`; and that for even
`L` and `M` it carries `e(q_{L⊕M})` to the product `e(q_L) e(q_M)`, since
`‖(x, y)‖²/2 = ‖x‖²/2 + ‖y‖²/2`. Read through the comparison of the two models, this is the isometry
of discriminant quadratic modules of an orthogonal sum of rational lattices (the completed
integral-lattices roadmap, Layer 3).

*Needs:* Tau Ceti `ZLattice.dual_orthSum`, `ZLattice.orthSum`, `ZLattice.mem_orthSum`,
`ZLattice.DiscriminantGroup`, `ZLattice.IsIntegral.discriminantPairingChar`; Mathlib
`WithLp.prod_norm_sq_eq_of_L2`; for the comparison, Tau Ceti
`TauCeti.IntegralLattice.discriminantQuadraticIsometryOrthogonalSum`.

**Checks.**
- `√2 ℤ² = √2 ℤ ⊕ √2 ℤ`: each summand has `L^∨/L ≅ ℤ/2` with `q = 1/4` on the generator, so the
  sum has `(ℤ/2)²` with `q = 0, 1/4, 1/4, 1/2`, and the Milgram sum `2i` of §6.3 is the product
  `(1 + i)²` of the summands' sums `1 + e(1/4)`.
- `A₂ ⊕ A₂` has `L^∨/L ≅ (ℤ/3)²` and Milgram sum `(i√3)² = -3`, the product of the summands' sums;
  without additivity of `q` the product formula for these sums fails.

### Examples

- **Through the comparison of the two models.** For the real model of the rank-one lattice `⟨2m⟩`
  (squared norm `2m` on a generator `x`), `L^∨/L` is cyclic of order `2m`, generated by the class of
  `x/(2m)`, with `q_L = 1/(4m) mod 1`, the value of Tau Ceti's
  `TauCeti.IntegralLattice.discriminantQuadraticMap_rankOneClass` read through §2.4; for the real
  model of `A_n`, `L^∨/L` is cyclic of order `n + 1`, generated by the class of the first
  fundamental weight, with `q_L = n/(2(n + 1))`, the value of
  `TauCeti.IntegralLattice.discriminantQuadraticMap_typeAFundamentalWeightClass`.
- **Levels, determinants and signed discriminants.** `level(E₈) = 1`; `A₂` has level `3`,
  determinant `3` and `D = -3`; `D₄` has level `2`, determinant `4` and `D = 4`; `√2 ℤ²` has level
  `4`, determinant `4` and `D = -4`. The Fricke test: `level(√2 • E₈) = 2` and
  `level(√2 • (√2 • E₈)^∨) = 1` (§2.6).
  *In Tau Ceti:* `TauCeti.IntegralLattice.level_realModel_typeARootLattice_two`, `TauCeti.IntegralLattice.natCard_discriminantGroup_realModel_typeARootLattice_two`, `TauCeti.IntegralLattice.level_realModel_checkerboardLattice_four`, `TauCeti.IntegralLattice.natCard_discriminantGroup_realModel_checkerboardLattice_four`, `TauCeti.IntegralLattice.level_sqrt_two_smul_realModel_typeE₈RootLattice`, `TauCeti.IntegralLattice.level_sqrt_level_smul_dual_sqrt_two_smul_realModel_typeE₈RootLattice`.
- `D₄ ⊕ D₄` has discriminant group `(ℤ/2)⁴`, the pairs of classes of the two summands. Since `q` is
  `1/2` on each nonzero class of `D₄`, `q` on the sum is `1/2` on the `6` pairs with exactly one
  nonzero entry and `0` on the origin and on the `9` pairs of two nonzero classes; `e(q)` sums to
  `10 - 6 = 4 = √16 · i⁴`, consistent with §6.3 in rank `8`.

### Dependencies

Mathlib: full lattices, their covolume and the dual submodule; `jacobiSym`, `legendreSym` and
Dirichlet characters for §2.8. Tau Ceti's rational lattices (`TauCeti.IntegralLattice` with its
dual, discriminant group and forms, `TauCeti.IntegralLattice.ofIntegralForm`, `vectorsOfNorm`, the
rank-one and root lattices) for §2.4 and the Examples, and its orthogonal sums of real lattices.
Independent of Layer 1.

## Layer 3: the theta series

Rank is arbitrary throughout this layer.

### 3.1 Definitions and convergence (3A)

Define the theta series `Θ_L` and the coset series `θ_{γ+L}`, for `γ : E`, as in Convention 9 (the
hypothesis `γ ∈ L^∨` enters only where a statement needs it). Prove summability for every `τ ∈ ℍ`
with the explicit bound `‖exp(π i ‖v‖² τ)‖ = exp(-π ‖v‖² Im τ)`, local uniform convergence on `ℍ`,
and hence holomorphy: both differentiability on the upper half-plane as a subset of `ℂ` and
`MDifferentiable` in the charts of `ℍ`, since the bundled modular forms need the latter and every
analytic argument wants the former.

*Needs:* §1.5 or Mathlib `ZLattice.summable_norm_rpow` for the decay; Mathlib
`HasSumLocallyUniformly`, `UpperHalfPlane`.

*In Tau Ceti:* `ZLattice.thetaSeries`, `ZLattice.thetaCoset`, `ZLattice.summable_thetaSeries`,
`ZLattice.summable_thetaCoset`, `Complex.norm_exp_pi_mul_I_mul_ofReal_mul`,
`ZLattice.hasSumLocallyUniformly_thetaSeries`, `ZLattice.hasSumLocallyUniformly_thetaCoset`,
`ZLattice.differentiableOn_thetaSeries`, `ZLattice.mdifferentiable_thetaSeries`,
`ZLattice.mdifferentiable_thetaCoset`.

### 3.2 Well-definedness on the discriminant group (3B)

Prove that `θ_{γ+L}` depends only on the class `γ + L`, and package the induced map from `L^∨/L` to
functions on `ℍ` (this descent needs no hypothesis, since it quotients by elements of `L`); prove
`θ_{0+L} = Θ_L`, `θ_{-γ} = θ_γ`, and, for integral `L`, `Θ_{L^∨} = ∑_{γ ∈ L^∨/L} θ_{γ+L}`, a finite
sum (`L^∨/L` is finite by §2.3 under that hypothesis, and the identity is false without it,
Convention 11). ⚠ `θ_{-γ} = θ_γ` is recorded prominently: the family `(θ_γ)_{γ ∈ L^∨/L}` is not
linearly independent, and more relations come from every isometry of `L`; no statement about
matrices acting on `ℂ[L^∨/L]` can be read off identities between theta functions, and this roadmap
never does so.

*Needs:* §§2.3, 3.1.

*In Tau Ceti:* `ZLattice.thetaCoset_add_mem`, `ZLattice.thetaCoset_eq_of_sub_mem`,
`ZLattice.thetaCosetClass`, `ZLattice.thetaCosetClass_mk`, `ZLattice.thetaCosetClass_zero`,
`ZLattice.thetaCoset_neg`, `ZLattice.thetaCosetClass_neg`, `ZLattice.IsIntegral.thetaSeries_dual_eq_sum`.

### 3.3 The `q`-expansions (3C)

For even `L`, prove `Θ_L(τ) = ∑_{m ≥ 0} r_L(2m) q^m` with `q = exp(2πiτ)`, as a convergent sum, and
identify the `m`-th coefficient of the `q`-expansion of period `1` of `Θ_L` with `r_L(2m)` through the
uniqueness of `q`-expansion coefficients. For integral `L`, the same with period `2`:
`Θ_L(τ) = ∑_{m ≥ 0} r_L(m) exp(πiτ)^m`, the shape of `jacobiTheta_T_sq_smul`. For even `L` of level
`N` and `γ ∈ L^∨`, prove `θ_{γ+L}(τ) = ∑_{m ≥ 0} r_{γ+L}(2m/N) q_N^m` with `q_N = exp(2πiτ/N)` and
that the coefficient vanishes unless `m ≡ N q_L(γ) (mod N)` (§2.7). Prove that `Θ_L` and every
`θ_{γ+L}` are bounded at `i∞`, that the constant term of `Θ_L` is `1`, and that `Θ_L(iy) > 0` for
`y > 0` (indeed `Θ_L(iy)` is real and at least `1`): the positivity is the nonvanishing witness that
the rank argument of §5.1 needs.

*Needs:* §§2.7, 3.1; Mathlib `qExpansion`, `Function.Periodic.qParam`, `IsBoundedAtImInfty`.

*In Tau Ceti:* `ZLattice.IsEven.hasSum_thetaSeries_qParam`, `ZLattice.IsEven.qExpansion_thetaSeries_coeff`,
`ZLattice.IsIntegral.hasSum_thetaSeries_qParam_two`, `ZLattice.IsIntegral.qExpansion_two_thetaSeries_coeff`,
`ZLattice.IsEven.hasSum_thetaCoset_qParam`, `ZLattice.IsEven.qExpansion_thetaCoset_coeff`,
`ZLattice.IsEven.qExpansion_thetaCoset_coeff_eq_zero`, `ZLattice.isBoundedAtImInfty_thetaSeries`,
`ZLattice.isBoundedAtImInfty_thetaCoset`, `ZLattice.IsEven.qExpansion_thetaSeries_coeff_zero`,
`ZLattice.valueAtInfty_thetaSeries`, `ZLattice.thetaCoset_eq_ofReal_of_re_eq_zero`,
`ZLattice.one_le_re_thetaSeries`, `ZLattice.thetaSeries_ne_zero_of_re_eq_zero`,
`ZLattice.re_thetaCoset_pos`.

### 3.4 Functoriality (3D)

For a linear isometry `e : F ≃ₗᵢ[ℝ] E`, prove that the theta series of the pulled-back lattice
`e⁻¹ L` is `Θ_L` and that `θ_{γ + e⁻¹L} = θ_{eγ + L}` for `γ ∈ F`; and for a real `c > 0`, prove
`Θ_{c • L}(τ) = Θ_L(c² τ)` and `θ_{cγ + c•L}(τ) = θ_{γ+L}(c² τ)`.

*In Tau Ceti:* `ZLattice.thetaSeries_comap`, `ZLattice.thetaCoset_comap`, `ZLattice.thetaSeries_smul`,
`ZLattice.thetaCoset_smul`.

For full lattices `L ⊆ E` and `M ⊆ F` and their orthogonal sum `ZLattice.orthSum L M` in
`WithLp 2 (E × F)`, prove that for every `τ ∈ ℍ`

```text
Θ_{L ⊕ M}(τ) = Θ_L(τ) * Θ_M(τ),
θ_{(γ, δ) + (L ⊕ M)}(τ) = θ_{γ+L}(τ) * θ_{δ+M}(τ)     for γ ∈ E, δ ∈ F,
```

with no integrality hypothesis, by reindexing along `L ⊕ M ≃ L × M` and multiplying two absolutely
convergent series (Ebeling, Ch. 2). Together with invariance under isometry and under scaling, each
of these is a reindexing proved once and used by the worked examples and by §5.3.

*Needs:* §3.1; Tau Ceti `ZLattice.orthSum`, `ZLattice.orthSumEquivProd`, `ZLattice.mem_orthSum`, the
instances making `ZLattice.orthSum L M` a full lattice, `ZLattice.summable_thetaSeries`,
`ZLattice.summable_thetaCoset`; Mathlib `WithLp.prod_norm_sq_eq_of_L2`,
`tsum_mul_tsum_of_summable_norm`, `ZLattice.comap`.

**Checks.**
- For `L = M = ℤ ⊆ ℝ`, the coefficient of `exp(π i τ)` in `Θ_ℤ(τ)²` is `2 · 1 + 1 · 2 = 4`, the
  number of vectors of norm `1` in `ℤ ⊕ ℤ`. Were `E × F` given the sup norm, the four vectors
  `(±1, ±1)` would also have norm `1`, the count would be `8`, and the product formula would fail:
  the orthogonal sum must carry the `L²` norm.
- For `L = M = E₈`, the coefficient of `q` in `Θ_{E₈}² = E₄²` is `2 · 240 = 480`, the number of
  vectors of norm `2` in `E₈ ⊕ E₈`, in agreement with `r_L(2m) = 480 σ₇(m)` at `m = 1` for every even
  unimodular lattice of rank `16` (Tau Ceti
  `ZLattice.IsEven.representationNumber_two_mul_of_finrank_eq_sixteen`).
- For `√2 ℤ`, scaling gives `Θ_{√2 ℤ}(τ) = Θ_ℤ(2τ)`, which is `jacobiTheta(2τ)` (§3.5); the factor
  is `c² = 2`, not `c = √2`.

### 3.5 The rank-one comparison (3E)

Prove `Θ_ℤ = jacobiTheta` for `ℤ = span ℤ {1} ⊆ ℝ`, hence `Θ_{√2 ℤ}(τ) = jacobiTheta(2τ)`, and that the
`q`-expansions agree termwise with `hasSum_nat_jacobiTheta`: the coefficient of `exp(πiτ)^m` in
`Θ_ℤ` is `1` at `m = 0`, `2` at a nonzero square and `0` otherwise. For the lattice `ℤo` of an
orthonormal basis of an `n`-dimensional space, `Θ_{ℤo} = jacobiTheta^n`. ⚠ This is an acceptance test
for the conventions, not a curiosity: if it fails, the exponent or the norm convention is wrong, and
it is far cheaper to discover that here than inside a `Γ₀(N)` computation. It compares functions
and `q`-expansions only; the inversion law of `jacobiTheta` is a half-integral-weight statement and
is not reproduced (§4.4).

*Needs:* §§3.1, 3.3; Mathlib `jacobiTheta`, `hasSum_nat_jacobiTheta`.

*In Tau Ceti:* `ZLattice.thetaSeries_span_one`, `ZLattice.thetaSeries_sqrt_two_smul_span_one`,
`ZLattice.qExpansion_two_thetaSeries_span_one_coeff`, `ZLattice.hasSum_thetaSeries_span_one_qParam`,
`ZLattice.thetaSeries_span_orthonormalBasis`.

### Examples

- `ℤ ⊕ ℤ` is isometric to `ℤ²`, and the product formula gives `Θ_{ℤ²} = jacobiTheta²`, matching
  §3.5 at `n = 2`.
- `√2 ℤ ⊕ √2 ℤ = √2 ℤ²` has `Θ(τ) = jacobiTheta(2τ)²`, from §3.5.
- For `E₈` the coefficients of `Θ` are `1, 240, 2160, 6720, …` (§8.2), the numbers of vectors of
  squared norm `0, 2, 4, 6`.

### Dependencies

Layers 1 and 2 (§2.3 for the finiteness of `L^∨/L` in §3.2, §2.7 for the coefficients of §3.3).
Mathlib: `jacobiTheta`, `qExpansion`, the upper half-plane. Tau Ceti's orthogonal sums for §3.4.

## Layer 4: the two transformation laws

From here on the rank is even, `n = 2k`, wherever an automorphy factor appears.

### 4.1 Translation (4A)

For even `L` and `γ ∈ L^∨`, prove `θ_{γ+L}(τ + 1) = e(q_L(γ)) θ_{γ+L}(τ)`, where
`e(q_L(γ)) = exp(π i ‖γ‖²)` is well defined on `L^∨/L` precisely because `L` is even. In particular
`Θ_L(τ + 1) = Θ_L(τ)`, that is `Θ_L ∣[k] T = Θ_L`, for even `L`; for integral `L`,
`Θ_L(τ + 2) = Θ_L(τ)`. Iterating `N = level L` times gives
`θ_{γ+L}(τ + N) = e(N q_L(γ)) θ_{γ+L}(τ) = θ_{γ+L}(τ)`, since `N ‖γ‖²/2 ∈ ℤ` for `γ ∈ L^∨` is the
definition of the level: every coset series is invariant under `T^N`, the translation inside `Γ(N)`
that §7.5 uses. ⚠ Evenness is exactly what the period-`1` statement needs, and integrality is not
enough (`jacobiTheta` has period `2`); the hypothesis is not weakened. Rank is arbitrary in this
item.

*Needs:* §§2.5, 3.1; Mathlib `ModularGroup.T` and the slash action.

**Checks.**
- `ℤ` is integral and not even, and `Θ_ℤ(τ + 1) = ∑_n (-1)^n exp(πin²τ)` differs from `Θ_ℤ(τ)` by
  `4 exp(πiτ) + 4 exp(9πiτ) + …`: period `1` needs evenness.
- `A₂` and `γ` of order `3` in `L^∨/L`: `‖γ‖²/2 ≡ 1/3`, so `θ_γ(τ + 1) = e(1/3) θ_γ(τ)`, and
  `θ_γ(τ + 3) = θ_γ(τ)` at the level `3`.

*In Tau Ceti:* `ZLattice.IsEven.thetaCoset_one_vadd`, `ZLattice.IsEven.thetaSeries_one_vadd`,
`ZLattice.IsEven.thetaSeries_slash_T`, `ZLattice.IsIntegral.thetaSeries_two_vadd`,
`ZLattice.IsEven.thetaCoset_slash_T_zpow_eq_self`, `ZLattice.IsEven.cexp_pi_mul_I_mul_norm_add_sq`.

### 4.2 Inversion, scalar form (4B)

For a full lattice `L` of rank `2k` (no integrality needed) and `τ ∈ ℍ`, prove

```text
Θ_L(-1/τ) = (covol L)⁻¹ * (-i)^k * τ^k * Θ_{L^∨}(τ)
```

by §1.1 applied to the Gaussian of §1.6 at `v = 0`. In slash form,
`Θ_L ∣[k] S = (-i)^k (covol L)⁻¹ Θ_{L^∨}`.

*Needs:* §§1.1, 1.6, 3.1; Mathlib `ModularGroup.S` and the slash action.

**Checks.**
- `ℤ²` (`covol = 1`, `k = 1`): `Θ_{ℤ²}(-1/τ) = -iτ Θ_{ℤ²}(τ) = (τ/i) Θ_{ℤ²}(τ)`. For `√2 ℤ²`,
  `covol = 2` and `L^∨ = (1/√2) ℤ²`, so `Θ_L(-1/τ) = (τ/(2i)) Θ_{L^∨}(τ)`: the factor is
  `(covol L)⁻¹`, not `covol L`.

*In Tau Ceti:* `ZLattice.thetaSeries_S_smul`, `ZLattice.thetaSeries_slash_S`.

### 4.3 Inversion at a general translate, and the vector-valued law (4C)

For a full lattice `L` of rank `2k`, `v : E` and `τ ∈ ℍ`, prove

```text
θ_{v+L}(-1/τ) = (covol L)⁻¹ * (-i)^k * τ^k * ∑' m : L^∨, e(⟪v, m⟫) * exp(π i ‖m‖² τ)
```

which is §1.1 at the Gaussian translated by `v`; this general-`v` form is what the coset splitting
of §7.2 consumes, so it is stated before specialising. For integral `L` and `γ ∈ L^∨` the sum over
`L^∨` breaks into cosets and the character descends to `L^∨/L`, giving

```text
θ_{γ+L}(-1/τ) = (covol L)⁻¹ * (-i)^k * τ^k * ∑_{δ ∈ L^∨/L} e(b_L(γ, δ)) * θ_{δ+L}(τ)
```

a sum over the finite discriminant group. Record `(covol L)⁻¹ = (det L)^{-1/2} = |L^∨/L|^{-1/2}` as a
rewriting lemma, since the literature states the coefficient in the last form. Since
`θ_{-δ} = θ_δ`, the characters `e(b_L(γ, δ))` and `e(-b_L(γ, δ))` are interchangeable here, and the
stated form is the one Poisson summation produces.

*Needs:* §§1.1, 1.6, 2.3, 3.2; Tau Ceti `ZLattice.IsIntegral.discriminantPairingChar`.

*In Tau Ceti:* `ZLattice.thetaCoset_S_smul`, `ZLattice.IsIntegral.thetaCoset_S_smul`,
`ZLattice.IsIntegral.thetaCoset_slash_S`, `ZLattice.inv_covolume_eq_inv_sqrt_det`,
`ZLattice.IsIntegral.inv_covolume_eq_inv_sqrt_card_discriminantGroup`,
`ZLattice.IsIntegral.sum_discriminantPairingChar_neg`.

### 4.4 Consistency checks (4D)

Prove the following consistency statements rather than assume them. The vector-valued law of §4.3
at `γ = 0`, compared with §4.2, returns `Θ_{L^∨} = ∑_{γ ∈ L^∨/L} θ_{γ+L}` for integral `L`. The
inversion law applied twice, with `covol L^∨ = (covol L)⁻¹` and `(L^∨)^∨ = L`, gives
`Θ_L ∣[k] S² = (-i)^{2k} Θ_L = (-1)^k Θ_L`, which is exactly the action of `S² = -I` in weight `k`,
so the two computations agree. ⚠ The scalar is `(-1)^k`, not `1`: `-I` acts trivially only in even
weight, and the rank-two lattice `ℤ²` has weight `1`, where it acts by `-1`. The rank-two case
`L = ℤ²` gives `Θ_{ℤ²}(-1/τ) = (τ/i) Θ_{ℤ²}(τ)`, which by §3.5 (`Θ_{ℤ²} = jacobiTheta²`) is the square
of Mathlib's `jacobiTheta_S_smul`. ⚠ This is the in-scope form of the comparison with Mathlib's
inversion law: the rank-one law itself carries `(-iτ)^{1/2}` and is not a target.

*Needs:* §§2.3, 3.2, 3.5, 4.2, 4.3; Mathlib `jacobiTheta_S_smul`, `ModularForm.slash_neg_one`.

*In Tau Ceti:* `ZLattice.thetaSeries_slash_S_slash_S`, `ZLattice.thetaSeries_span_orthonormalBasis_S_smul`,
`jacobiTheta_S_smul_sq`, `ZLattice.IsIntegral.thetaSeries_dual_eq_sum`.

### Examples

- `ℤ²`: `Θ_{ℤ²} ∣[1] S² = -Θ_{ℤ²}`, the action of `-I` in weight `1`.
- `E₈` (even unimodular, `covol = 1`, `k = 4`): `Θ ∣[4] S = (-i)^4 Θ = Θ` and `Θ ∣[4] T = Θ`, the
  two invariances that §5.2 assembles.

### Dependencies

Layers 1 (§§1.1, 1.6) and 3; §§2.3 and 2.5. Tau Ceti's discriminant pairing, through §2.4, for the
character `e(b_L)` of the vector-valued law. Mathlib: the modular group and the slash action.

## Layer 5: level one — even unimodular lattices

### 5.1 The rank is divisible by `8` (5A)

For `L` even and unimodular of rank `n`, prove `8 ∣ n`. Route of record, elementary and
self-contained at this layer: replacing `L` by `L ⊕ L` or `L ⊕ L ⊕ L ⊕ L` (again even unimodular,
§2.1) reduces to `n ≡ 4 (mod 8)`, where §4.2 gives `Θ ∣[k] S = (-i)^k Θ = -Θ` and §4.1 gives
`Θ ∣[k] T = Θ`, so `Θ ∣[k] (ST)³ = -Θ`; but `(ST)³ = S² = -I` acts by `(-1)^k = 1`, `k = n/2` being
even there, whence `Θ = 0`, contradicting `Θ(i) ≠ 0` (§3.3). ⚠ The reduction is what keeps this
inside even rank: for odd `n`, `4n` is even and `≡ 4 (mod 8)`, so no half-integral-weight theta
series is ever formed. §6.3 reproves this in one line from Milgram's formula; both proofs are wanted,
and the elementary one is not superseded.

*Needs:* §§2.1, 2.3, 3.3, 4.1, 4.2.

**Checks.**
- `A₂` and `D₄` are even of rank `2` and `4`, with determinants `3` and `4`: neither is unimodular,
  so unimodularity and not evenness alone forces `8 ∣ n`; `E₈` attains rank `8`.

*In Tau Ceti:* `ZLattice.IsEven.eight_dvd_finrank`.

### 5.2 The level-one theorem (5B)

For `L` even and unimodular of rank `n = 2k`, prove `Θ_L ∣[k] A = Θ_L` for every `A ∈ SL(2, ℤ)`, and
that `Θ_L` is the underlying function of a modular form of weight `k` for `SL(2, ℤ)`, the theta form
of `L` (Serre, Ch. VII §6). The proof is Mathlib's level-one generation lemma (invariance under `S`
and `T` gives invariance under `SL(2, ℤ)`) applied to §§4.1–4.2, with `L^∨ = L` and `covol L = 1`
collapsing the `S`-factor to `(-i)^k = 1` by `8 ∣ n`; holomorphy and boundedness at the cusp come
from Layer 3. It is built the way Mathlib builds `CuspForm.discriminant`.

*Needs:* §§2.3, 3.1, 3.3, 4.1, 4.2, 5.1; Mathlib `SlashInvariantForm.slash_action_generators_SL2Z`,
`ModularForm`.

*In Tau Ceti:* `ZLattice.thetaForm`, `ZLattice.coe_thetaForm`, `ZLattice.IsEven.thetaSeries_slash_S`.

### 5.3 The basic API of the bundled form (5C)

Let `L` be even and unimodular of rank `2k`, with theta form `ZLattice.thetaForm hL hU hk` of §5.2, a
modular form of weight `k` for `SL(2, ℤ)` whose coercion is `Θ_L` (`ZLattice.coe_thetaForm`). The API
that the identifications of Layer 8 consume:

- the `m`-th coefficient of the `q`-expansion of period `1` of the theta form is `r_L(2m)` for every
  `m ≥ 0`, so its constant coefficient is `r_L(0) = 1` and it is not zero;
- for a linear isometry `e : F ≃ₗᵢ[ℝ] E`, the theta form of the pulled-back lattice is that of `L`;
- for `M ⊆ F` even and unimodular of rank `2l`, the theta form of `L ⊕ M` (even and unimodular of
  rank `2(k + l)`) is the product, by `ModularForm.mul`, of the theta forms of `L` and `M`, as modular
  forms of weight `k + l` (Serre, Ch. VII §6).

*In Tau Ceti:* (the first two, read through `ZLattice.coe_thetaForm`) `ZLattice.IsEven.qExpansion_thetaSeries_coeff`, `ZLattice.representationNumber_zero`, `ZLattice.thetaSeries_comap`.

*Needs:* §§3.3, 3.4, 5.2; Tau Ceti `ZLattice.thetaForm`, `ZLattice.coe_thetaForm`,
`ZLattice.isEven_orthSum_iff`, `ZLattice.isUnimodular_orthSum_iff`; Mathlib `ModularForm.mul`.

**Checks.**
- For `E₈ ⊕ E₈`, the product of two copies of the theta form of `E₈`, which is `E₄`, is `E₄ · E₄`
  in weight `8`; its coefficient of `q` is `480 = r_{E₈⊕E₈}(2)`. Adding ranks instead of weights
  would put the product in weight `16`, where `E₄²` does not live.
- The constant coefficient of the theta form is `r_L(0) = 1`; so it is not zero, and it is not a
  cusp form. In rank zero the theta form is the constant `1` of weight `0`.

### 5.4 The structural corollary (5D)

Prove that the theta series of an even unimodular lattice of rank `2k` is
`∑_{4a + 12b = k} c_{a,b} E₄^a Δ^b` for a unique family of coefficients `c_{a,b}`, which are
rational. *Route:* by Tau Ceti's description of the level-one graded ring as freely generated by
`E₄` and `E₆` (`mvPolynomialEquivModularForms`), the weights divisible by `4` are spanned by the
monomials `E₄^a E₆^b` with `b` even, and `E₆² = E₄³ - 1728 Δ`; so the modular forms of level one and
weight divisible by `4` form the ring `ℂ[E₄, Δ]`, and `4 ∣ k` by §5.1. This is the general statement
of which the identifications of Layer 8 are instances, proved here and not one lattice at a time.

*Needs:* §§5.1, 5.2; Tau Ceti `mvPolynomialEquivModularForms`; Mathlib `ModularForm.E₄`,
`ModularForm.E₆`, `CuspForm.discriminant`.

*In Tau Ceti:* `ZLattice.IsEven.existsUnique_finsupp_thetaSeries_eq_E₄_discriminant`.

### Examples

- For `E₈` (real model of Tau Ceti's `typeE₈RootLattice`), the coefficients of the theta form are
  `1, 240, 2160, 6720, …`, those of `E₄`.
- For `E₈ ⊕ E₈`, §5.4 with `k = 8` has the single monomial `E₄²`, since `4a + 12b = 8` forces
  `(a, b) = (2, 0)`; in rank `24`, `k = 12` allows `E₄³` and `Δ`.

### Dependencies

Layers 3 and 4, and §§2.1, 2.3 for §5.1; §3.4 for §5.3. Mathlib: the level-one generation lemma,
`E₄`, `E₆`, `Δ`. Tau Ceti: the level-one graded ring, for §5.4.

## Layer 6: Gauss sums of a lattice

The arithmetic input to the general-level theorem, isolated so that Layer 7 is an assembly.
Throughout, `L` is even of rank `n = 2k`, `N` is its level and `D_L = (-1)^k det L`. The route of
record is analytic: the one identity that needs analysis is the reciprocity law, proved from the
inversion law by the asymptotics of theta series; everything else is finite algebra at an odd
modulus. Nothing here classifies finite quadratic modules or uses Jordan splittings, and nothing
touches the prime `2` beyond the residue of `D_L` modulo `4` and `8`.

### 6.1 The Gauss sums and their elementary properties (6A)

Define `G_L(a, c)` and the twisted sums `G_L(a, c; m)`, `m ∈ L^∨`, as in Convention 14, on the
finite quotient `L ⧸ cL` of order `c^n`, with the evenness of `L` and the membership `m ∈ L^∨` as
arguments of the summand, so that its descent to the quotient is a theorem with true hypotheses;
and the dual-side sums over `L^∨ ⧸ aL` likewise. Prove: invariance under isometry; multiplicativity
under orthogonal sum; that `G_L(a, c)` depends on `a` only modulo `c` (in particular
`G_L(a + 2ct, c) = G_L(a, c)`); `G_L(a, 1) = 1`; and the two facts the coset splitting of Layer 7
needs, for `N ∣ c`:

- **vanishing**: `G_L(a, c; m) = 0` unless `m ∈ L`, because shifting `y ↦ y + cw` for `w ∈ L^∨`
  (legitimate since `c L^∨ ⊆ L`) multiplies the sum by `e(⟪w, m⟫)`, and `⟪w, m⟫ ∈ ℤ` for all
  `w ∈ L^∨` says exactly `m ∈ L`;
- **completing the square**: for `m ∈ L` and `ad ≡ 1 (mod c)`,
  `G_L(a, c; m) = e(-a d² ‖m‖²/(2c)) · G_L(a, c)`.

*Needs:* §§2.1, 2.5, 4.1 (the descent of `e(q_L)`); Tau Ceti `ZLattice.orthSum`.

**Checks.**
- `L = √2 ℤ²`, `c = 2`: `G_L(1, 2) = (1 + e(1/2))² = 0`, and `G_L(3, 2) = G_L(1, 2)` as `3 ≡ 1 (mod 2)`.
- `L = ℤ` is not even, and the summand `e(‖y‖²/2)` on `ℤ/ℤ` takes the values `1` and `-1` on the
  representatives `0` and `1`: without evenness there is no Gauss sum to define.

*In Tau Ceti:* `ZLattice.card_quotient_smul_submoduleOf`, `ZLattice.gaussTerm`, `ZLattice.gaussSum`,
`ZLattice.gaussSumTwisted`, `ZLattice.dualGaussTerm`, `ZLattice.dualGaussSum`, `ZLattice.gaussSum_comap`,
`ZLattice.gaussSumTwisted_comap`, `ZLattice.gaussSum_orthSum`, `ZLattice.gaussSumTwisted_orthSum`,
`ZLattice.gaussSum_eq_of_modEq`, `ZLattice.gaussSum_one`, `ZLattice.gaussSumTwisted_eq_zero`,
`ZLattice.gaussSumTwisted_eq_of_mem`.

### 6.2 Reciprocity (6B)

For positive integers `a` and `c`, prove

```text
G_L(a, c) = (c/a)^k * (det L)^{-1/2} * e(n/8) * ∑_{y ∈ L^∨ / aL} e(-c ‖y‖² / (2a)),
```

where `e(n/8) = i^k`, `det L = |L^∨ / L|`, and the sum on the right, over the `a^n det L` classes of
`L^∨ ⧸ aL`, is well defined because `L` is even. In Lean this is `gaussSum_eq_mul_dualGaussSum`,
with the right-hand sum `ZLattice.dualGaussSum L hL (-c) a` (Milnor–Husemoller, Appendix 4, for the
theta-asymptotic method; Turaev (1998), §1.3, for the reciprocity of the Gauss sums attached to a
tensor product of bilinear lattices, of which this is the case of `ℤ` with the form `c x y` tensored
with `L` with the form `a ⟪·, ·⟫`, pairing `L / cL` against `L^∨ / aL`).

*Route of record.* Compute the limit `lim_{t → 0⁺} t^k Θ_L(a/c + it)` in two ways. ⚠ The asymptotic
is additive, a leading term plus `o(t^{-k})`, not `G_L(a, c) · (…) · (1 + o(1))`: the Gauss sum can
vanish while the theta series does not.

- *The intermediate target.* For a full lattice `L` of rank `2k` and any `v : E`,
  `ε^k θ_{v+L}(ε) → i^k (covol L)⁻¹` as `ε → 0` in `ℍ` along any path with
  `Im(-1/ε) = Im ε / |ε|² → ∞`. This is §4.3 read at `τ = -1/ε`:
  `θ_{v+L}(ε) = (covol L)⁻¹ (-i)^k (-1/ε)^k ∑_{m ∈ L^∨} e(⟪v, m⟫) exp(π i ‖m‖² (-1/ε))`, and the sum
  tends to its `m = 0` term because `Im(-1/ε) → ∞`. ⚠ The real part of `ε` varies along the paths
  used below, so this is stated for complex `ε`, not for `ε = it`.
  *In Tau Ceti:* `ZLattice.tendsto_pow_mul_thetaCoset_comap_S`.
- *The direct side.* For `a ∈ ℤ` and `c ≥ 1`, `t^k Θ_L(a/c + it) → G_L(a, c) / (c^{2k} covol L)` as
  `t → 0⁺`. Split `L` into its classes `y + cL`: since `L` is even,
  `exp(π i ‖y + cℓ‖² a/c) = e(a ‖y‖²/(2c))` for `ℓ ∈ L`, so
  `Θ_L(a/c + it) = ∑_{y ∈ L/cL} e(a ‖y‖²/(2c)) θ^{(cL)}_y(it)`, where `θ^{(cL)}_y` is the coset series
  of the lattice `cL`; the intermediate target at `ε = it` gives
  `t^k θ^{(cL)}_y(it) → (covol cL)⁻¹ = c^{-2k} (covol L)⁻¹`.
  *In Tau Ceti:* `ZLattice.IsEven.thetaSeries_vadd_eq_sum`, `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_vadd_comap_S`, `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT`.
- *The other side.* Put `z = a/c + it` and apply the scalar inversion law in the form
  `Θ_L(z) = (covol L)⁻¹ (-i)^k (-1/z)^k Θ_{L^∨}(-1/z)`. As `t → 0⁺`,
  `-1/z = (-ca + i c² t)/(a² + c² t²) → -c/a`; write `-1/z = -c/a + ε` with
  `ε = c³t²/(a(a² + c²t²)) + i c²t/(a² + c²t²)`, so `ε → 0` with `Im(-1/ε) ~ a²/(c² t) → ∞`. Split
  `L^∨` into its classes `y + aL`: since `L` is even and `⟪y, ℓ⟫ ∈ ℤ`,
  `exp(π i ‖y + aℓ‖² (-c/a)) = e(-c ‖y‖²/(2a))`, so
  `Θ_{L^∨}(-c/a + ε) = ∑_{y ∈ L^∨/aL} e(-c ‖y‖²/(2a)) θ^{(aL)}_y(ε)`, and the intermediate target
  along this path gives `ε^k θ^{(aL)}_y(ε) → i^k (covol aL)⁻¹ = i^k a^{-2k} (covol L)⁻¹`. Multiplying
  by `t^k` and passing to the limit, with `(-1/z)^k → (-c/a)^k` and `t^k ε^{-k} → (a²/(i c²))^k`,
  gives the displayed identity after `(covol L)⁻¹ = (det L)^{-1/2}` and `i^k = e(n/8)`.

⚠ The inversion law is the only transformation used; there is no "matrix carrying `∞` to `a/c`"
before Layer 7, and none is needed. This asymptotic argument is the only analytic input to Layers 6
and 7.

*Needs:* §§4.2, 4.3, 6.1; Tau Ceti `ZLattice.gaussSum`, `ZLattice.dualGaussSum`,
`ZLattice.thetaSeries_S_smul`, `ZLattice.thetaCoset_S_smul`,
`ZLattice.tendsto_pow_mul_thetaCoset_comap_S`, `ZLattice.IsEven.thetaSeries_vadd_eq_sum`,
`ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT`, `ZLattice.covolume_smul`,
`ZLattice.IsIntegral.inv_covolume_eq_inv_sqrt_card_discriminantGroup`,
`ZLattice.IsIntegral.card_quotient_smul_submoduleOf_dual`; Mathlib limits along filters.

**Checks.**
- `L = √2 ℤ²` (`k = 1`, `det L = 4`), `a = 1`, `c = 2`: `G_L(1, 2) = (1 - 1)² = 0`, and the right side
  is `(2/1) · ½ · i · ∑_{u, v mod 2} e(-(u² + v²)/2) = i (1 - 1 - 1 + 1) = 0`; yet
  `Θ_L(1/2 + it) = (∑_r (-1)^r e^{-2πtr²})² > 0`, positive by one-dimensional Poisson summation. This
  is why the asymptotic is additive.
- `L = √2 ℤ²`, `a = 3`, `c = 1`: `G_L(3, 1) = 1`, and the dual-side sum over `L^∨ / 3L`, the pairs
  `(u, v) mod 6` with `y = (u, v)/√2`, is `(∑_{u mod 6} e(-u²/12))² = (√3 (1 - i))² = -6i`, so the
  right side is `(1/3) · ½ · i · (-6i) = 1`. With `+c` in place of `-c` the dual-side sum is `6i` and
  the right side `-1`: the sign on the dual side is not a convention.
- For `L = √2 ℤ²` the identity is the square of the Landsberg–Schaar identity
  `∑_{y mod c} e(a y²/c) = √(c/(2a)) e(1/8) ∑_{y mod 2a} e(-c y²/(4a))`: both Gauss sums of `L` are
  squares of rank-one sums, and `e(1/8)² = i`.
- `L = A₂` (`det L = 3`), `a = c = 1`: `1 = (1/√3) · i · (1 + 2e(-1/3)) = (1/√3) · i · (-i√3)`.
- Pairs that are not coprime. `L = √2 ℤ²`, `a = c = 2`: `G_L(2, 2) = (∑_{u mod 2} e(u²))² = 4`, and
  the dual-side sum over the `16` classes `y = (u, v)/√2`, `u, v mod 4`, is
  `(∑_{u mod 4} e(-u²/4))² = (2 - 2i)² = -8i`, so the right side is `1 · ½ · i · (-8i) = 4`.
  `L = A₂`, `a = c = 3`: every summand of `G_L(3, 3)` is `e(‖y‖²/2) = 1`, so
  `G_L(3, 3) = 9 = 3² G_L(1, 1)`; the dual-side summand depends only on the class of `y` in
  `L^∨/L`, so the sum over the `27` classes of `L^∨/3L` is `9 (1 + 2e(-1/3)) = -9i√3`, and the right
  side is `(1/√3) · i · (-9i√3) = 9`. A sum over the `3` classes of `L^∨/L` in place of `L^∨/3L`
  would give `1`.

### 6.3 Milgram's formula (6C)

Prove, for `L` even of rank `2k`,

```text
∑_{γ ∈ L^∨/L} e(q_L(γ)) = |L^∨/L|^{1/2} * e(n/8),
```

with `e(q_L(γ)) = exp(π i ‖γ‖²)` on any representative and `e(n/8) = i^k`. In Lean this is
`sum_cexp_norm_sq_discriminantGroup` (Milnor–Husemoller, Appendix 4). *Route of record:* the case
`a = c = 1` of §6.2, which reads `1 = (det L)^{-1/2} e(n/8) ∑_{γ} e(-q_L(γ))`, followed by complex
conjugation of both sides. ⚠ Not the substitution `y ↦ -y`, which changes nothing since
`q_L(-y) = q_L(y)`. This is Milgram's formula at positive definite signature only, by theta
asymptotics; at every signature it is the integral quadratic forms and lattices roadmap's, proved
there arithmetically, and the comparison of the two models identifies the two statements without
either being derived from the other.

Deduce two corollaries. An even unimodular lattice has rank divisible by `8`: `|L^∨/L| = 1` forces
`e(n/8) = 1` for even `n`, and for odd `n` the formula applied to `L ⊕ L`, of rank `2n`, gives
`4 ∣ n` and contradicts oddness; this is a second proof of §5.1 beside the elementary one by the
`S`- and `T`-laws, and both are wanted. And `k` is even (equivalently `4 ∣ n`) whenever `N ∣ 2`,
since then every `e(q_L(γ))` is `±1` while `|L^∨/L|^{1/2} i^k` is real only for even `k`. The
latter is what lets `−I`, which lies in `Γ(N)` exactly when `N ∣ 2`, act trivially on the coset
series in §7.5.

*In Tau Ceti:* (the corollaries) `ZLattice.IsEven.eight_dvd_finrank`, `ZLattice.IsEven.even_of_level_dvd_two`, `ZLattice.IsEven.four_dvd_finrank_of_level_dvd_two`.

*Needs:* §6.2; Tau Ceti `ZLattice.gaussSum_one`, `ZLattice.dualGaussSum`,
`ZLattice.IsEven.cexp_pi_mul_I_mul_norm_add_sq`, `ZLattice.IsIntegral.finite_discriminantGroup`.

**Checks.**
- `A₂`: `L^∨/L ≅ ℤ/3` with `q` of a generator `1/3`, so the sum is `1 + 2e(1/3) = i√3 = √3 · i¹`. The
  substitution `y ↦ -y` in place of conjugation would leave `1 + 2e(-1/3) = -i√3`, the wrong sign.
- `D₄`: `L^∨/L ≅ (ℤ/2)²` with the three nonzero classes of `q = 1/2`, so the sum is `1 - 3 = -2`,
  which is `√4 · i²`.
- `√2 ℤ²`: the four classes have `q = 0, 1/4, 1/4, 1/2`, and `1 + 2i - 1 = 2i = √4 · i`.
- `E₈`: `1 = i⁴`. Read through the comparison of the two models, the formula agrees with Tau Ceti's
  Milgram's theorem at signature `(n, 0)`, `sign q_L = n mod 8`.

### 6.4 Evaluation at an odd modulus (6D)

For `a` odd and positive, `c` positive and prime to `a`, and `N ∣ c` (so that `a` is prime to `N` as
well), prove that the sum on the right of §6.2 collapses:

```text
∑_{y ∈ L^∨ / aL} e(-c ‖y‖² / (2a)) = det L * (D_L / a) * a^k
```

with `(D_L / a)` the Jacobi symbol; the same holds with `-c` replaced by any multiple `t` of `N` prime
to `a`. ⚠ Coprimality of `a` with `N` alone is not enough: for `L = √2 ℤ²` (`k = 1`, `N = 4`,
`det L = 4`, `D_L = -4`) with `a = 3` and `c = 12`, every summand is `e(-(u² + v²)) = 1` on the `36`
classes `y = (u, v)/√2`, `u, v mod 6`, so the left side is `36`, while `4 · (-4/3) · 3 = -12`; the
hypothesis that fails is `gcd(a, c) = 1`, which makes `c/N` a unit modulo `a`.

*Route:* the summand is invariant under `y ↦ y + aw` for `w ∈ L^∨` (from `N ∣ c` and
`N L^∨ ⊆ L`), so the sum is `det L` times the sum over `L^∨ ⧸ aL^∨ ≅ (ℤ/a)^n` of `e(Q(y)/a)` for the
integral quadratic form `Q = -(c/N) · (N ‖·‖²/2)` on `L^∨`, which is unimodular modulo `a` because
`a` is prime to `c` and to `N`. Such a Gauss sum is multiplicative over the prime factorisation of
`a`, reduces from `p^e` to `p^{e-2}` for `e ≥ 2`, and over `ZMod p` is evaluated by diagonalising `Q`
and using `∑_x e(u x²/p) = (u/p) g_p` with `g_p² = (-1/p) p` (Mathlib's `gaussSum_sq`); no sign of
`g_p` is ever needed, and the determinant of `Q` differs from `det L` by a square modulo `a`. ⚠ The
sign `(-1)^k` in `(D_L / a)` comes from `g_p²` alone and not from comparing determinants (second
Check). Step by step, the restriction to `a` prime to the level is what keeps the form unimodular
modulo `a` and Jordan theory out of the proof.

*Needs:* §§2.3, 2.5, 6.1; Mathlib `jacobiSym`, `gaussSum`, `gaussSum_sq`, the quadratic character of
`ZMod p`, the diagonalisation of quadratic forms over a field of characteristic `≠ 2`.

**Checks.**
- `L = √2 ℤ²`, `a = 3`, `c = 4`: the sum over the `36` classes `y = (u, v)/√2`, `u, v mod 6`, is
  `(∑_{u mod 6} e(-u²/3))² = (2 + 4e(-1/3))² = (-2i√3)² = -12`, and the right side is
  `4 · (-4/3) · 3 = -12`.
- `L = √2 ℤ²`, `a = 3`, `c = 4`: the Gram matrix `2I` of `L` and the Gram matrix `-2I` of
  `-c ⟪·, ·⟫` on `L^∨` in the dual basis both have determinant `4`; their ratio `1` is a square
  modulo `3` while `-1` is not, so the sign `(-1)^k` in `(D_L / a)` does not come from comparing
  these determinants: it comes from the square `g_p² = (-1/p) p` of the rank-one Gauss sum.

*In Tau Ceti:* `ZLattice.IsEven.dualGaussSum_eq_jacobiSym`.

### 6.5 The closed form (6E)

For `a` odd and positive, `c` positive and prime to `a`, and `N ∣ c`, prove

```text
G_L(a, c) = c^k * (det L)^{1/2} * e(n/8) * (D_L / a),
```

with `(D_L / a)` the Jacobi symbol. In Lean this is `gaussSum_eq_sqrt_card_mul_jacobiSym` (Ogg,
Ch. VI; Iwaniec, Ch. 10; Ebeling, Ch. 3). *Route:* §6.2, with the dual-side sum evaluated at the odd
modulus `a` by §6.4, with `t = -c` a multiple of the level prime to `a`. ⚠ Coprimality of `a` with
`N` alone is not enough: the hypothesis `gcd(a, c) = 1` is what makes `c/N` a unit modulo `a`.

*Needs:* §§6.2, 6.4; Tau Ceti `ZLattice.IsEven.dualGaussSum_eq_jacobiSym`; Mathlib `jacobiSym`.

**Checks.**
- `√2 ℤ²` (`N = 4`, `D_L = -4`): `G(1, 4) = (∑_{u mod 4} e(u²/4))² = (2 + 2i)² = 8i = 4 · 2 · i · 1`,
  and `G(3, 4) = (2 - 2i)² = -8i = 4 · 2 · i · (-4/3)`, with `(-4/3) = -1`.
- `√2 ℤ²`, `a = 1`, `c = 2`, where `N ∤ c`: `G(1, 2) = 0`, while the formula would give `4i`.
- `√2 ℤ²`, `a = 3`, `c = 12`, where `N ∣ c` but `gcd(a, c) = 3`: `G(3, 12) = (3(2 + 2i))² = 72i`,
  while the formula would give `12 · 2 · i · (-1) = -24i`.

### 6.6 The conductor theorem and the nebentypus (6F)

Prove that the conductor of the Kronecker character `(D_L / ·)` of modulus `|D_L|` divides `N`; in
Lean this is `conductor_kroneckerChar_dvd_level` (Ebeling, Ch. 3). *Route:* by Tau Ceti's
`TauCeti.conductor_kroneckerChar_dvd_iff`, it suffices that `(D_L / a) = 1` for every odd `a` prime
to `D_L` with `a ≡ 1 (mod N)`. Such an `a` is prime to `N`, so §6.5 at `c = N` gives
`G_L(a, N) = N^k (det L)^{1/2} i^k (D_L / a)`, while `G_L(a, N) = G_L(1, N)` because the Gauss sum
depends on `a` only modulo `N` (§6.1) and `G_L(1, N)` is the same expression with `(D_L / 1) = 1`.
⚠ The descent to the level is a statement about unit groups: `|D_L|` need not divide `N` (for `D₄`,
`|D_L| = 4` and `N = 2`), so `(D_L / ·)` is not a character modulo `N` until its conductor is known to
divide `N`, and the kernel that matters is that of the reduction of units; Tau Ceti's criterion
packages exactly this, through odd positive representatives of unit classes
(`ZMod.exists_odd_unitOfCoprime_eq`). Equivalently, the Kronecker character pulled up to modulus
`lcm(|D_L|, N)` factors through `N` (Mathlib's `DirichletCharacter.factorsThrough_iff_ker_unitsMap`,
`DirichletCharacter.mem_conductorSet_iff_conductor_dvd`, `DirichletCharacter.conductor_changeLevel`).
Nothing before this section produces a character modulo `N`, and the passage to modulus `N` is
this lattice theorem, not Mathlib's `DirichletCharacter.conductor_dvd_level`.

Define the nebentypus `nebentypus hL hk : DirichletCharacter ℂ (level L)`, written `χ_L`: the
primitive character attached to `(D_L / ·)`, induced to modulus `N` by
`DirichletCharacter.changeLevel` along the conductor theorem. Its API:

- for every integer `a` prime to `N`, `χ_L(a) = (D_L / a)` (Kronecker symbol); such an `a` is prime
  to `D_L`, since every prime dividing `det L` divides `N`;
- `χ_L` is quadratic;
- `χ_L(-1) = (-1)^k`, the parity the modular-forms character spaces demand in weight `k`;
- `χ_L` is trivial when `D_L` is a square, in particular when `L` is unimodular (then `N = 1`);
- its unit-homomorphism face is `MulChar.toUnitHom χ_L : (ZMod N)ˣ →* ℂˣ`.

*Needs:* §§2.5, 2.8, 6.1, 6.5; Tau Ceti `TauCeti.kroneckerChar`, `TauCeti.conductor_kroneckerChar_dvd_iff`,
`TauCeti.kroneckerSym_eq_jacobiSym`, `TauCeti.kroneckerChar_intCast`,
`TauCeti.kroneckerChar_isQuadratic`, `TauCeti.kroneckerChar_neg_one`,
`ZLattice.gaussSum_eq_of_modEq`,
`ZLattice.IsEven.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one`,
`ZLattice.card_discriminantGroup_dvd_level_pow`, `ZLattice.IsIntegral.level_pos`,
`ZLattice.prime_dvd_level`; Mathlib `DirichletCharacter.changeLevel`,
`DirichletCharacter.primitiveCharacter`, `DirichletCharacter.conductor`, `MulChar.toUnitHom`.

**Checks.**
- `A₂` (`k = 1`, `det L = 3`, `N = 3`): `D_L = -3`, the conductor is `3 = N`, and `χ_{A₂} = (-3 / ·)`
  with `χ_{A₂}(-1) = -1 = (-1)^1`. The unsigned symbol `(3 / ·)` would be even, and it differs at
  `a = 7`: `(-3/7) = 1`, `(3/7) = -1`.
- `D₄` (`k = 2`, `det L = 4`, `N = 2`): `D_L = 4`, a square, so `χ_{D₄}` is trivial.
- `√2 ℤ²` (`k = 1`, `det L = 4`, `N = 4`): `D_L = -4`, of conductor `4 = N`; `χ_L(3) = -1`.
- `E₈`: `N = 1`, `D_L = 1`, and `χ_L` is the trivial character modulo `1`.

### Examples

- For `A₂ ⊕ A₂` (`k = 2`, `det = 9`, `N = 3`), `D = 9` is a square, so the character is trivial,
  Milgram's sum is `(i√3)² = -3 = √9 · i²`, and §6.5 holds at `a ∈ {1, 5, 7}`, `c ∈ {3, 6}`.
- The off-hypothesis evaluations of §§6.4–6.5 at `√2 ℤ²` record why each hypothesis is there.

### Dependencies

Layer 4 (§§4.2, 4.3) and the asymptotics of §6.2 for reciprocity; Layer 2 (§§2.3, 2.5, 2.8) for
the arithmetic; Mathlib's `gaussSum`, `jacobiSym` and Dirichlet characters for the evaluation and the
conductor theorem. Independent of Layer 5. Within the layer, §6.2 rests on §6.1, §6.3 on §6.2,
§6.5 on §§6.2 and 6.4, and §6.6 on §6.5.

## Layer 7: general level — the Hecke–Schoeneberg theorem

The summit. The route of record is Schoeneberg's coset splitting (Schoeneberg, Ch. IX): it needs no
group presentation and no representation, and it delivers the statement for the coset series by the
same computation. `L` is even of rank `2k` and level `N` throughout.

### 7.1 Reduction to `c > 0` and `a` odd and positive (7A)

Prove the two reductions that the transformation laws below rest on.

- *In `Γ₀(N)`.* Let `A = !![a, b; c, d] ∈ Γ₀(N)`. If `c = 0`, then `a = d = ε ∈ {±1}` and
  `A = εI · T^{εb}`, a signed power of `T` (⚠ not `±T^b`: for `ε = -1` the exponent is `-b`). If
  `c ≠ 0`, replace `A` by `-A` to make `c > 0`, and then by `T^j A = !![a + jc, b + jd; c, d]`, which
  has the same `c` and `d` and lies in `Γ₀(N)`, with `j ≥ 0` large enough that `a + jc > 0` and of
  the parity that makes `a + jc` odd: if `c` is odd, `j ≡ a + 1 (mod 2)`; if `c` is even, `a` is
  already odd because `ad - bc = 1`, and every `j` serves. ⚠ §6.5 needs `a` odd **and** positive,
  with `gcd(a, c) = 1` from `ad - bc = 1`; the same `T^j` that fixes the parity fixes the sign.
- *In `Γ(N)`.* The reductions above do not transfer: `−I ∉ Γ(N)` for `N > 2`, an unrestricted `T^j`
  leaves `Γ(N)`, and `a ≡ 1 (mod N)` gives neither oddness nor positivity. Let
  `A = !![a, b; c, d] ∈ Γ(N)`. If `c < 0`, replace `A` by `A⁻¹ = !![d, -b; -c, a] ∈ Γ(N)`; invariance
  under `A⁻¹` gives invariance under `A` by the right-action law. If `c > 0`, left-multiply by
  `T^{jN} ∈ Γ(N)`, replacing `a` by `a + jNc`, with `j` chosen so that this is positive and odd: by
  the parity of `j` if `Nc` is odd, and automatically if `Nc` is even, since then `c` is even and so
  `a` is odd. If `c = 0`, then `A = εI · T^{εb}` with `N ∣ b`, and `ε = -1` requires
  `-1 ≡ 1 (mod N)`, that is `N ∣ 2`.

*Needs:* Mathlib `Matrix.SpecialLinearGroup`, `ModularGroup.T`, `CongruenceSubgroup.Gamma0`,
`CongruenceSubgroup.Gamma`.

**Checks.**
- `!![-2, -3; 3, 4] ∈ Γ(3)` has `a = -2`, negative and even; `T³ · !![-2, -3; 3, 4] = !![7, 9; 3, 4]`
  lies in `Γ(3)` with `a = 7`, while `T · !![-2, -3; 3, 4] = !![1, 1; 3, 4]` does not lie in `Γ(3)`.
- `!![-1, b; 0, -1] = (−I) · T^{-b}`, not `(−I) · T^{b}`.

### 7.2 The coset splitting (7B)

For `A = !![a, b; c, d] ∈ SL(2, ℤ)` with `c > 0` and every even `L` of rank `2k`, with no level
condition, prove

```text
Θ_L(Aτ) = (covol L)⁻¹ * ((cτ + d)/(ic))^k * ∑_{m ∈ L^∨} G_L(a, c; m) * e(d ‖m‖²/(2c)) * exp(π i ‖m‖² τ)
```

as an absolutely convergent sum; and, for `N ∣ c`, its collapse
`Θ_L ∣[k] A = (-i)^k c^{-k} (covol L)⁻¹ G_L(a, c) Θ_L`: by §6.1 every `m ∉ L` drops out, completing
the square evaluates the rest, and `e((d - a d²) ‖m‖²/(2c)) = e(-b d ‖m‖²/2) = 1` for `m ∈ L`.
*Route:* `Aτ = a/c - 1/(c(cτ + d))`; split `L` into its classes `y + cL` and apply §4.3 at `v = y/c`
and `σ = (cτ + d)/c` to each class.

*Needs:* §§4.3, 6.1; Mathlib the slash action.

**Checks.**
- `A = S` (`a = d = 0`, `c = 1`): `G_L(0, 1; m) = 1` for every `m ∈ L^∨`, and the identity is the
  inversion law of §4.2, `Θ_L(-1/τ) = (covol L)⁻¹ (τ/i)^k Θ_{L^∨}(τ)`.

*In Tau Ceti:* `ZLattice.IsEven.thetaSeries_smul_eq_tsum_gaussSumTwisted`, `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul`.

### 7.3 The Hecke–Schoeneberg theorem (7C)

Prove that for every `A = !![a, b; c, d] ∈ Γ₀(N)`,

```text
Θ_L ∣[k] A = χ_L(d) * Θ_L,
```

with `χ_L` the nebentypus of §6.6. In Lean this is `thetaSeries_slash_of_mem_Gamma0` (Schoeneberg,
Ch. IX; Ebeling, Ch. 3; Ogg, Ch. VI). *Route:* by §7.1 reduce to `c > 0` and `a` odd and positive:
`T^j` acts trivially on `Θ_L` (§4.1), and `εI` acts by `ε^k = χ_L(ε)` (the parity of §6.6), which
also settles `c = 0` together with `T^{εb}`. For `c > 0` and `N ∣ c`, the coset splitting of §7.2
gives `Θ_L ∣[k] A = (-i)^k c^{-k} (covol L)⁻¹ G_L(a, c) Θ_L`, and §6.5 turns the constant into
`(D_L / a) = χ_L(a) = χ_L(d)`, since `ad ≡ 1 (mod N)` and `χ_L` is quadratic. The level-one theorem is
the case `N = 1`.

*Needs:* §§4.1, 6.5, 6.6, 7.1, 7.2; Tau Ceti `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul`,
`ZLattice.IsEven.thetaSeries_slash_T`,
`ZLattice.IsIntegral.inv_covolume_eq_inv_sqrt_card_discriminantGroup`; Mathlib
`ModularForm.slash_neg_one` and the slash action.

**Checks.**
- `A₂` (`N = 3`, `k = 1`) and `A = !![2, 1; 3, 2]`: `χ_{A₂}(2) = (-3/2) = -1`, so
  `Θ_{A₂} ∣[1] A = -Θ_{A₂}`; with the trivial character the sign would be `+`.
- `√2 ℤ²` (`N = 4`) and `A = !![3, 2; 4, 3]`: `χ_L(3) = (-4/3) = -1`, so `Θ ∣[1] A = -Θ`.
- `D₄` (`N = 2`, `D = 4`): the character is trivial, so `Θ_{D₄}` is invariant under `Γ₀(2)` in
  weight `2`, for instance under `!![1, 0; 2, 1]` and `!![3, 1; 2, 1]`.
- `A = −I`: `Θ_L ∣[k] (−I) = (-1)^k Θ_L`, and `χ_L(-1) = (-1)^k`; for `A₂` both are `-1`.

### 7.4 The theta series as a modular form with character (7D)

Prove that for every `A ∈ SL(2, ℤ)` the slashes `Θ_L ∣[k] A` and `θ_{γ+L} ∣[k] A`, `γ ∈ L^∨`, are
bounded at `i∞`: for `c > 0`, §7.2 writes `Θ_L ∣[k] A` as a finite combination of the coset series
`θ_{m+L}`, `m ∈ L^∨/L`, each of which has a `q_N`-expansion supported in nonnegative exponents
(§3.3), and the coset series behave alike; so `Θ_L` and every `θ_{γ+L}` are bounded in weight `k` at
every cusp.

*In Tau Ceti:* (boundedness at every cusp) `ZLattice.IsEven.isBoundedAt_thetaSeries`, `ZLattice.IsEven.isBoundedAt_thetaCoset`, `ZLattice.IsEven.isBoundedAtImInfty_thetaCoset_slash`.

Prove that `Θ_L` is the underlying function of a modular form of weight `k` on `Γ₁(N)` lying in
`modFormCharSpace k (MulChar.toUnitHom χ_L)`; in Lean this is
`exists_modularForm_coe_eq_thetaSeries` (Ebeling, Ch. 3; Miyake, §4.9). Define the bundled form
itself, the theta form of level `N`, with coercion `Θ_L`: holomorphy is §3.1, boundedness at every
cusp is the statement above, and invariance under `Γ₁(N)` is §7.3 with `χ_L(d) = 1` for
`d ≡ 1 (mod N)`. Prove that the `Γ₀(N)` spelling of §7.3 and the character-space spelling are
equivalent through `mem_modFormCharSpace_iff_nebentypus`, and that for `N = 1` the theta form of
level `1` is the theta form of §5.2 read on `Γ₁(1)`.

*Needs:* §§3.1, 3.3, 5.2, 7.2, 7.3; Tau Ceti `ZLattice.mdifferentiable_thetaSeries`,
`ZLattice.IsEven.isBoundedAt_thetaSeries`, `modFormCharSpace`,
`mem_modFormCharSpace_iff_nebentypus`, `ZLattice.thetaForm`; Mathlib `ModularForm`.

**Checks.**
- `A₂`: the diamond operator `⟨2⟩` acts on the theta form of level `3` by `χ_{A₂}(2) = -1`, and the
  parity `χ(-1) = (-1)^k` that a nonzero form of weight `1` requires (Tau Ceti
  `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`) holds for `(-3 / ·)`; it would fail for the
  unsigned `(3 / ·)`.
- `E₈`: `N = 1`, the character is trivial, and the theta form of level `1` is `E₄`.

### 7.5 The coset series on `Γ(N)` (7E)

Prove that for every `γ ∈ L^∨` and every `A ∈ Γ(N)`, `θ_{γ+L} ∣[k] A = θ_{γ+L}`, and that each
`θ_{γ+L}` is the underlying function of a modular form of weight `k` on `Γ(N)`; in Lean these are
`thetaCoset_slash_of_mem_Gamma` and `exists_modularForm_coe_eq_thetaCoset` (Schoeneberg, Ch. IX;
Ebeling, Ch. 3). *Route:* the `Γ(N)` reduction of §7.1, with `T^{jN}` fixing every coset series by the
period-`N` law of §4.1. If `c = 0`, `T^{εb}` fixes `θ_γ` and `εI` acts by `ε^k`, where `ε = -1` occurs
only for `N ∣ 2`, and then `k` is even (§6.3). ⚠ That corollary of Milgram's formula is
load-bearing: `−I` acts in weight `k` by `(-1)^k`, so for `N ∣ 2` the claim `θ_γ ∣[k] (−I) = θ_γ` is
the evenness of `k`, and nothing in the splitting supplies it. With `c > 0` and `a` odd and positive,
split the coset `γ + L` modulo `cL` and apply the inversion law at the translates, as in the coset
splitting of §7.2; the coefficients are the Gauss sums over translates `ZLattice.cosetGaussSum`, which
vanish unless `aγ + m ∈ L` (`ZLattice.cosetGaussSum_eq_zero`). For `A ∈ Γ(N)`, `a ≡ 1 (mod N)` and
`Nγ ∈ L` make the surviving class that of `-γ`, so `θ_γ ∣[k] A` is a multiple of `θ_{-γ} = θ_γ`;
completing the square (`ZLattice.cosetGaussSum_eq_of_mem`) and §6.5 show that the multiple is `1`.
Boundedness at every cusp is §7.4. This is the statement that a route through the Weil
representation would deliver as its congruence-kernel theorem; here it is the coset version of §7.3.

*Needs:* §§4.1, 4.3, 6.3, 6.5, 7.1, 7.4; Tau Ceti `ZLattice.cosetGaussSum`, `ZLattice.cosetGaussSum_eq_zero`,
`ZLattice.cosetGaussSum_eq_of_mem`, `ZLattice.thetaCoset_S_smul`, `ZLattice.thetaCoset_neg`,
`ZLattice.IsEven.thetaCoset_slash_T_zpow_eq_self`, `ZLattice.IsEven.even_of_level_dvd_two`,
`ZLattice.IsEven.isBoundedAt_thetaCoset`, `ZLattice.mdifferentiable_thetaCoset`; Mathlib
`ModularForm.slash_neg_one`, `CongruenceSubgroup.Gamma`.

**Checks.**
- `A₂` (`N = 3`) and `γ` of order `3` in `L^∨/L`: `θ_γ(τ + 1) = e(1/3) θ_γ(τ)` (§4.1), so `θ_γ` is
  not invariant under `T ∈ Γ₁(3)`; `T³ ∈ Γ(3)` fixes it, and so do `!![1, 0; 3, 1]` and
  `!![-2, -3; 3, 4]`. A version of the theorem on `Γ₁(N)` would be false.
- `D₄` (`N = 2`, `k = 2`): `−I ∈ Γ(2)` acts trivially, as it must.
- `√2 ℤ²` (`N = 4`, `k = 1`): `−I ∉ Γ(4)`; on `Γ(2)`, `−I` would act on `θ_γ` by `-1`.

### 7.6 Consequences (7F)

**The Fricke identities.** The Fricke matrix `W_N = !![0, -1; N, 0]` exchanges `Θ_L` and
`Θ_{√N • L^∨}`, by §4.2 at `Nτ` and §3.4, and the constant depends on the normalization, which is
pinned here once. With `W_N` Tau Ceti's `TauCeti.frickeGL ℝ N`, acting through Mathlib's slash,
which carries the factor `|det A|^{k-1}`, prove that the raw slash is

```text
Θ_L ∣[k] W_N = (-i)^k * N^{k-1} * (det L)^{-1/2} * Θ_{√N • L^∨}
```

and that the normalized operator `𝒲_N = (√N)^{2-k} • (· ∣[k] W_N)` of the modular-forms roadmap's
Layer 6 gives

```text
𝒲_N Θ_L = (-i)^k * N^{k/2} * (det L)^{-1/2} * Θ_{√N • L^∨} .
```

Both are stated, the first against `frickeGL` directly and the second as the explicit scalar
multiple `(√N)^{2-k} • (Θ_L ∣[k] W_N)`, which is what `𝒲_N` evaluates to; there is no third
normalization. Both hold for every full lattice of rank `2k` and every `N > 0`; at `N = level L` the
lattice `√N • L^∨` is the even Fricke partner of §2.6. ⚠ `𝒲_N² = (-1)^k`, so "involution" is an
even-weight statement, and even rank does not make the weight even: `A₂` has `k = 1`.

*In Tau Ceti:* `ZLattice.thetaSeries_slash_frickeGL`, `ZLattice.atkinLehnerNormalizer_smul_thetaSeries_slash_frickeGL`, `ZLattice.thetaSeries_sqrt_smul_dual_slash_frickeGL`.

**The constant term and the diamond operators.** Prove that the theta form of level `N` of §7.4 is
not a cusp form, its value at `i∞` being the constant term `1` of `Θ_L` (§3.3), and that every
diamond operator `⟨d⟩` acts on it by `χ_L(d)`, which is the content of membership in the character
space (`diamondOp_apply_of_mem_modFormCharSpace` applied to §7.4).

*In Tau Ceti:* (the constant term) `ZLattice.valueAtInfty_thetaSeries`, `ZLattice.IsEven.qExpansion_thetaSeries_coeff_zero`.

*Needs:* §§2.6, 3.3, 3.4, 4.2, 7.4; Tau Ceti `TauCeti.frickeGL`, `TauCeti.atkinLehnerNormalizer`,
`ZLattice.valueAtInfty_thetaSeries`, `diamondOp_apply_of_mem_modFormCharSpace`; for the Checks,
`ZLattice.valueAtInfty_thetaCoset`.

**Checks.**
- For `γ ∉ L` the coset series `θ_{γ+L}` vanishes at `i∞` (Tau Ceti `ZLattice.valueAtInfty_thetaCoset`),
  while `Θ_L = θ_{0+L}` has value `r_L(0) = 1` there: the statement is about the class of `0`, and it
  would be false for the other coset series.
- For `A₂`, `⟨2⟩` acts on the theta form of level `3` by `χ_{A₂}(2) = -1`; for `D₄` every `⟨d⟩` acts
  trivially, so its theta form of level `2` lies in the trivial-character space, the forms on `Γ₀(2)`.
- For `√2 • E₈` (`N = 2`), the Fricke partner `√2 • (√2 • E₈)^∨ = E₈` has level `1`: its level
  divides `N` and need not equal it.

### Examples

- `Θ_{A₂} ∈ M₁(Γ₀(3), (-3/·))`, `Θ_{D₄} ∈ M₂(Γ₀(2))` with trivial character, and
  `Θ_{√2ℤ²} ∈ M₁(Γ₀(4), (-4/·))`, with the level, determinant and character computed from the
  lattice (Layer 2, Examples) rather than quoted.

### Dependencies

Layers 4 and 6 (§§6.1, 6.3, 6.5, 6.6); §§3.3 and 7.2 for boundedness at the cusps; §§2.6, 3.4 and 4.2
for the Fricke identities. Tau Ceti: the Gauss sums over translates, the character spaces and
diamond operators, the Fricke matrix and its normalizer. Mathlib: the modular group, its congruence
subgroups and the slash action.

## Layer 8: identification of the classical theta series

### 8.1 Even unimodular lattices of rank `8` and `16` (8A)

Prove that for every even unimodular `L` of rank `8`, `Θ_L = E₄`, and for every one of rank `16`,
`Θ_L = E₄² = E₈`, the Eisenstein series of weight `8`. *Route:* `dim M_4(SL(2,ℤ)) = 1` (Mathlib's
level-one dimension formula), and the level-one Sturm bound at weight `4` is `⌊4/12⌋ = 0`, so a
weight-`4` form is determined by its constant term alone; likewise at weight `8`. ⚠ No representation
number is an input to either identity; both follow from `r_L(0) = 1`.

*Needs:* §§5.2, 5.3; Mathlib `ModularForm.dimension_level_one`, `ModularForm.E₄`, `ModularForm.E`.

*In Tau Ceti:* `ZLattice.IsEven.thetaForm_eq_E₄`, `ZLattice.IsEven.thetaSeries_eq_E₄`,
`ZLattice.IsEven.thetaForm_eq_E₄_mul_E₄`, `ZLattice.IsEven.thetaSeries_eq_E₄_sq`,
`ZLattice.IsEven.thetaForm_eq_E_eight`.

### 8.2 `E₈` (8B)

Prove that for every even unimodular `L` of rank `8`, and in particular for `E₈`,
`r_L(2m) = 240 σ₃(m)` for `m ≥ 1`, from §8.1 and the `q`-expansion of `E₄` with
`bernoulli 4 = -1/30`; in particular the kissing number `r_{E₈}(2) = 240` is a corollary, not a
hypothesis. The lattice `E₈` is the real model (§2.4) of Tau Ceti's `typeE₈RootLattice`, whose
positive definiteness, evenness and unimodularity are exactly the hypotheses of §8.1 after the
comparison, so `Θ_{E₈} = E₄`. The sphere-packing project's `E8Lattice` is a second model of the same
lattice (*Provenance*); §2.3's `covol L = 1 ⟺ L = L^∨` and Mathlib's `ZLattice.covolume_eq_det`
connect its unimodularity to this roadmap's hypotheses, so that its facts can be consumed as well.

*Needs:* §§2.4, 8.1; Tau Ceti `TauCeti.IntegralLattice.typeE₈RootLattice`,
`TauCeti.IntegralLattice.isPosDef_typeE₈RootLattice`, `TauCeti.IntegralLattice.isEven_typeE₈RootLattice`,
`TauCeti.IntegralLattice.isUnimodular_typeE₈RootLattice`; Mathlib the `q`-expansion of
`ModularForm.E`.

*In Tau Ceti:* `ZLattice.IsEven.representationNumber_two_mul_of_finrank_eq_eight`, `ZLattice.IsEven.representationNumber_two_of_finrank_eq_eight`, `ZLattice.IsEven.thetaSeries_eq_E₄`, `TauCeti.IntegralLattice.isEven_realModel_iff`, `TauCeti.IntegralLattice.isUnimodular_realModel_iff`.

### 8.3 Even unimodular lattices of rank `24` (8C)

`dim M_12(SL(2,ℤ)) = 2` with basis `E₄³, Δ`, and the Sturm bound at weight `12` is `1`, so a
weight-`12` form is determined by its first two coefficients. Prove that for every even unimodular
`L` of rank `24`

```text
Θ_L = E₄³ + (r_L(2) - 720) * Δ
```

since `E₄³` has `q`-coefficient `720` and `Δ` has `q`-coefficient `1`; equivalently
`Θ_L = E₁₂ + (r_L(2) - 65520/691) Δ`, so that `r_L(2m) = (65520/691) σ₁₁(m) + (r_L(2) - 65520/691) τ(m)`
for `m ≥ 1`, with `τ` the Ramanujan function; and, comparing coefficients of `q²`,
`r_L(4) + 24 r_L(2) = 196560`. This general form is proved first; the Leech identity is its rootless
case.

*Needs:* §§5.2, 5.4; Mathlib `ModularForm.E`, `CuspForm.discriminant`, `ModularForm.dimension_level_one`.

*In Tau Ceti:* `ZLattice.IsEven.thetaForm_eq_E₄_cube_add_smul_discriminant`, `ZLattice.IsEven.thetaSeries_eq_E₄_cube_add_mul_discriminant`, `ZLattice.IsEven.thetaSeries_eq_E_twelve_add_mul_discriminant`, `ZLattice.IsEven.representationNumber_two_mul_of_finrank_eq_twenty_four`, `ZLattice.IsEven.representationNumber_four_add_twenty_four_mul`.

### 8.4 The Leech lattice (8D)

Let `Λ` be the real model of Tau Ceti's Leech lattice `TauCeti.leechLattice`, even and unimodular of
rank `24` with no vector of squared norm `2`. Prove `Θ_Λ = E₄³ - 720 Δ`, from §8.3 and `r_Λ(2) = 0`;
the equivalent Eisenstein form `Θ_Λ = E₁₂ - (65520/691) Δ`; and
`r_Λ(2m) = (65520/691) (σ₁₁(m) - τ(m))` for `m ≥ 1`, with `τ` the Ramanujan function (the
`q`-expansion coefficients of `Δ`). In particular the Leech kissing number `r_Λ(4) = 196560` is a
corollary. ⚠ `196560` is an output of this roadmap, not an input: it does not appear as a hypothesis
anywhere, and a proof that computes it by counting has not discharged this target. The
sphere-packing project's Leech lattice is a second model of the same lattice (*Provenance*).

*Needs:* §§2.4, 8.3; Tau Ceti `TauCeti.leechLattice`, `TauCeti.isPosDef_leechLattice`.

*In Tau Ceti:* `TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant`, `TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E_twelve_sub_mul_discriminant`, `TauCeti.IntegralLattice.representationNumber_leechLattice_two_mul`, `ZLattice.IsEven.representationNumber_four_of_rootless`.

### 8.5 The rank-16 pair (8E)

`E₈ ⊕ E₈` and `D₁₆⁺` are both even unimodular of rank `16`, so both have theta series `E₄²` by
§8.1; they are not isometric, so the theta series does not determine the lattice. Both lattices and
their non-isometry are the [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)'s
6D, which constructs them (`E₈²` as the orthogonal sum, `D₁₆⁺` by the even-overlattice gluing along
the spinor class of `D₁₆`, as Tau Ceti glues `checkerboardPlusLattice 8`), proves them even
unimodular of rank `16` and in one genus, and separates them by their root systems; Tau Ceti has them
as `e8PowLattice 2` and `checkerboardPlusLattice 16`. They reach this roadmap through the converse
direction of §2.4: the real model of each lattice, and the transfer statement of §2.4, which turns
the non-isometry into the absence of a real linear isometry of ambient spaces carrying one real
model onto the other. Prove the theta identity `Θ_{E₈ ⊕ E₈} = Θ_{D₁₆⁺} = E₄²` and the statement that
the theta series does not determine the lattice: there are even unimodular lattices `L ⊆ E` and
`M ⊆ F` with `Θ_L = Θ_M` and no linear isometry `E → F` carrying `L` onto `M`. ⚠ Keep the two halves
apart. Equality of theta series is §8.1's and says nothing about isometry; the non-isometry is the
rational lattices' and is not reproved here, whether by a root-sublattice index, by a vector count
(both lattices have `480` vectors of norm `2`, so the count separates nothing), or by any other
route, and neither lattice is given a second construction here. Stating only the first invites the
reader to conclude the second.

*Needs:* §§2.4, 8.1; Tau Ceti `TauCeti.IntegralLattice.e8PowLattice`,
`TauCeti.IntegralLattice.checkerboardPlusLattice`,
`TauCeti.IntegralLattice.isEmpty_isometry_e8PowLattice_checkerboardPlusLattice`,
`TauCeti.IntegralLattice.map_realModel_ne_realModel`.

*In Tau Ceti:* `TauCeti.IntegralLattice.thetaSeries_realModel_eq_E₄_sq`, `TauCeti.IntegralLattice.thetaSeries_realModel_e8PowLattice_two`, `TauCeti.IntegralLattice.thetaSeries_realModel_checkerboardPlusLattice_sixteen`, `TauCeti.IntegralLattice.not_forall_exists_map_eq_of_thetaSeries_eq`.

### 8.6 The root lattices `A₂` and `D₄` (8F)

Let `A₂` and `D₄` be the real models of Tau Ceti's `typeARootLattice 2` and `checkerboardLattice 4`:
even lattices of rank `2` and `4`, levels `3` and `2`, determinants `3` and `4`, so `D = -3` and
`D = 4`. Prove (Conway–Sloane, Ch. 2 §2.3):

- `Θ_{A₂} ∈ M₁(Γ₀(3), (-3/·))` and `Θ_{D₄} ∈ M₂(Γ₀(2))`, as instances of §§7.3–7.4 with the level,
  determinant and character computed from the lattices;
- `Θ_{A₂} = 1 + 6 ∑_{m ≥ 1} (∑_{d ∣ m} (-3/d)) q^m`, the weight-one Eisenstein series with character
  `E₁^{ψ,φ}` with `ψ = 1`, `φ = (-3/·)` at level `3`, normalised to constant term `1`;
- `Θ_{D₄} = 2E₂(2τ) - E₂(τ) = 1 + 24 ∑_{m ≥ 1} (∑_{d ∣ m, d odd} d) q^m`, the negative of Tau Ceti's
  corrected weight-two series `E₂(τ) - 2E₂(2τ)` at `t = 2`;
- consequently, for `m ≥ 1`, `r_{A₂}(2m) = 6 ∑_{d ∣ m} (-3/d)` and `r_{D₄}(2m) = 24` times the sum of
  the odd divisors of `m`; in Lean these are `representationNumber_realModel_typeARootLattice_two`
  and `representationNumber_realModel_checkerboardLattice_four`.

Uniqueness is the Sturm bound, not a dimension formula: Tau Ceti's `ModularForm.eq_of_sturm_bound`
identifies two forms on `Γ` that agree up to the coefficient `⌊k [SL₂(ℤ) : Γ] / 12⌋`, and with
`[SL₂(ℤ) : Γ₀(2)] = 3` (`CongruenceSubgroup.Gamma0_prime_index`) and `[SL₂(ℤ) : Γ₁(3)] = 8` both
bounds are `⌊6/12⌋ = ⌊8/12⌋ = 0`, so each identification is the equality of two constant terms, both
`1`. ⚠ Weight `1` is exceptional in dimension theory, and no weight-one dimension formula is invoked:
the `A₂` argument is the Sturm bound on `Γ₁(3)` as stated.

*Needs:* §§7.3, 7.4; Tau Ceti `TauCeti.IntegralLattice.typeARootLattice`,
`TauCeti.IntegralLattice.checkerboardLattice`, `TauCeti.IntegralLattice.realModel`,
`TauCeti.IntegralLattice.level_realModel_typeARootLattice_two`,
`TauCeti.IntegralLattice.natCard_discriminantGroup_realModel_typeARootLattice_two`,
`TauCeti.IntegralLattice.level_realModel_checkerboardLattice_four`,
`TauCeti.IntegralLattice.natCard_discriminantGroup_realModel_checkerboardLattice_four`,
`TauCeti.EisensteinSeries.charE1MF`, `TauCeti.EisensteinSeries.charE1MF_mem_modFormCharSpace`,
`TauCeti.EisensteinSeries.qExpansion_charE1MF_coeff`,
`TauCeti.EisensteinSeries.correctedE2`, `TauCeti.EisensteinSeries.qExpansion_coeff_correctedE2`,
`ModularForm.eq_of_sturm_bound`, `CongruenceSubgroup.Gamma0_prime_index`,
`ZLattice.IsEven.qExpansion_thetaSeries_coeff`; or ModularForms §0.1 for the weight-one series in
its positive-coefficient normalisation.

**Checks.**
- `r_{A₂}(2), r_{A₂}(4), r_{A₂}(6), r_{A₂}(8) = 6, 0, 6, 6`: there is no vector of norm `4` in `A₂`
  (`a² + ab + b² = 2` has no solution), while `6 σ₀(2) = 12`; the character `(-3/·)` is what kills it.
- `r_{D₄}(2), r_{D₄}(4), r_{D₄}(6) = 24, 24, 96`: the norm-`4` vectors are the `8` of shape
  `(±2, 0, 0, 0)` and the `16` of shape `(±1, ±1, ±1, ±1)`; the formula `24 σ₁(m)` would give `72`
  at `m = 2`.
- The weight-one series with `ψ = 1`, `φ = (-3/·)` has constant term `1/6` and first coefficient `1`
  in the positive-coefficient normalisation (ModularForms §0.1), so six times it has constant term
  `1` and `q`-coefficient `6 = r_{A₂}(2)`.
- `E₂(τ) - 2E₂(2τ)` has first coefficients `-1, -24, -24`, so its negative starts
  `1 + 24q + 24q²`, matching `r_{D₄}(2) = r_{D₄}(4) = 24`.

### Examples

- `E₈`: the coefficients `240 σ₃(m)` are `240, 2160, 6720` at `m = 1, 2, 3`.
- The Leech lattice: `r_Λ(4) = (65520/691)(σ₁₁(2) - τ(2)) = (65520/691) · 2073 = 196560` and
  `r_Λ(6) = (65520/691) · (177148 - 252) = 16773120`.
- `E₈ ⊕ E₈ ⊕ E₈` is even unimodular of rank `24` with `r(2) = 720`, so §8.3 gives `Θ = E₄³`, as the
  product formula of §3.4 does.

### Dependencies

Layer 5 (§§5.2–5.4) for §§8.1–8.5, with §2.4 and Tau Ceti's `E₈`, Leech lattice and rank-16 pair for
the lattices; Layer 7 (§§7.3, 7.4), the Sturm bound, the weight-one Eisenstein series with character
and the corrected weight-two series for §8.6. No dimension formula beyond Mathlib's level-one one is
consumed; ModularForms §0.1 for the normalised weight-one series, where it is used.

## Layer 9: Hermitian theta series

Theta series of a lattice in a complex space with a positive definite Hermitian form, in a Hermitian
matrix variable of degree `s`, and their inversion law, which is Layer 1 applied to the lattice
`L^s`. The real rank is even automatically, `2r` for a complex space of dimension `r`, so the
automorphy factor is the integer power `det(Z/i)^r` and no branch of the determinant is chosen.
The layer needs Layers 1 and 2 and §3.1 (for the convergence bounds of §9.1), and Layer 4 only for
its Examples.

**Setting.** `W` is a complex vector space of finite dimension `r` with a positive definite
Hermitian form `h`, conjugate-linear in the first variable. Regard `W` as a real inner product
space of dimension `2r` with `⟪x, y⟫_ℝ = 2 Re h(x, y)`, so that `‖x‖² = 2 h(x, x)`, and let `L` be a
full-rank `ℤ`-lattice in it; `L^∨` and `ZLattice.covolume L` are the dual lattice and the covolume
for this real inner product, as in the conventions. As a type, `W` is a complex inner product
space whose inner product is `2h`, made a real inner product space by
`InnerProductSpace.rclikeToReal ℂ W`, whose inner product is the real part `2 Re h`; with `h`
itself as the complex inner product, that real part would be `Re h`. ⚠ The real form is `2 Re h`,
not `Re h`: the factor is the trace from `ℂ` to `ℝ`, and it is what makes the case `s = 1` the
theta series of Layer 3 (Examples below). For `s ≥ 1`,
`ℋ_s = {Z ∈ M_s(ℂ) : (Z - Z^*)/2i positive definite}` is the Hermitian half-space of degree `s`
(`ℋ_1 = ℍ`), and for `X = (x_1, …, x_s) ∈ W^s` the Gram matrix is `T_X = (h(x_i, x_j))_{i,j}`, a
positive semidefinite Hermitian matrix. `W^s` is the orthogonal sum
`PiLp 2 (fun _ : Fin s ↦ W)` and `L^s` the product lattice in it; prove `(L^s)^∨ = (L^∨)^s` and
`ZLattice.covolume (L^s) = (ZLattice.covolume L)^s`. An `O_K`-lattice in a positive definite
Hermitian space over an imaginary quadratic field `K`, embedded in `W` by a complex embedding of
`K`, is a lattice `L` of this kind.

### 9.1 Definition and convergence (9A)

For `Z ∈ ℋ_s`, put `Θ_L^{(s)}(Z) = ∑' X : L^s, e(tr(T_X Z))`. Prove absolute and locally uniform
convergence on `ℋ_s`, and holomorphy. With `Y = (Z - Z^*)/2i`,
`|e(tr(T_X Z))| = exp(-2π tr(T_X Y))`, and `tr(T_X Y)` is a positive definite quadratic form in
`X ∈ W^s`, so the bounds of §3.1 apply to the lattice `L^s`.

*Needs:* §3.1 (its bounds, for the lattice `L^s`); the Setting.

### 9.2 Inversion (9B)

For `Z ∈ ℋ_s`, `Θ_L^{(s)}(-Z^{-1}) = (ZLattice.covolume L)^{-s} * det(Z/i)^r * Θ_{L^∨}^{(s)}(Z)`
(Cohen–Resnikoff, formula (3), p. 330, in another normalisation: for a positive Hermitian matrix
`H` in `r` variables and a lattice `𝔏` in `ℂ^{r×s}` they put
`Θ_𝔏(Z, H) = (vol 𝔏)^{1/2} ∑_{N ∈ 𝔏} exp(π i tr(Z N^* H N))`, with `vol` the Lebesgue covolume,
and prove `Θ_𝔏̂(-Z^{-1}, H^{-1}) = det(-iZ)^r det(H)^s Θ_𝔏(Z, H)` for the dual lattice `𝔏̂` of
the pairing `Re tr(M^* N)`, by Poisson summation after Resnikoff, Theorem 2.2. For `𝔏 = L^s` and
`H` twice the Gram matrix of `h` this is the displayed law: the covolume of `𝔏` for `2 Re h` is
`det(H)^s vol 𝔏`, and `(L^∨)^s = H^{-1} 𝔏̂`.)

*Route:* §1.1 at `v = 0` for the lattice `L^s` in the orthogonal sum `W^s` of the Setting, whose
dual is `(L^∨)^s` and whose covolume is `(covolume L)^s`, applied to the Hermitian Gaussian
`X ↦ e(tr(T_X Z))`, which is a Schwartz function and even. Its Fourier transform is
`det(Z/i)^{-r}` times the Hermitian Gaussian of `-Z^{-1}`: for `Z = iY`, diagonalize `Y` by a
unitary matrix, a change of variables that is an isometry of `W^s` and splits the Gaussian into
`s` Gaussians of §1.6 on `W`; for general `Z ∈ ℋ_s`, by the identity theorem. Prove that
`Z ↦ -Z^{-1}` maps `ℋ_s` to itself, that `det(Z/i) ≠ 0` on `ℋ_s`, and that two holomorphic
functions on `ℋ_s` which agree on `{iY : Y positive definite}` are equal.

*Needs:* §§1.1, 1.5, 1.6, 2.1, 2.3 and 9.1; the Setting (the dual and the covolume of `L^s`).

### Examples

- `s = 1`: `T_x = h(x, x) = ‖x‖²/2`, so `Θ_L^{(1)}(z) = ∑' x : L, exp(π i ‖x‖² z) = thetaSeries L z`
  (§3.1) for `L` in the real inner product space `(W, 2 Re h)`, and §9.2 is §4.2 at rank `2r`, with
  `k = r`.
- `W = ℂ` carrying the doubled inner product `2x̄y`, so `h(x, y) = x̄y` (on Mathlib's `ℂ`, whose
  real inner product is `Re(x̄y)`, `ℤ[i]` is its own dual with covolume `1`), `L = ℤ[i]`, `s = 1`:
  `Θ_L(z) = (∑_{m ∈ ℤ} e(m² z))²`; `L^∨ = ½ℤ[i]` and `covolume L = 2`, so at `z = i` §9.2 reads
  `Θ_L(i) = Θ_{L^∨}(i)/2`, the square of Jacobi's `∑_m e^{-2πm²} = 2^{-1/2} ∑_m e^{-πm²/2}`.

### Dependencies

Layer 1 (§§1.1, 1.5, 1.6), Layer 2 (§§2.1, 2.3), Layer 3 (§3.1) and the orthogonal sums of
Convention 17; Layer 4 (§4.2) for the Examples only.

## Worked examples

Each is the general theorem instantiated, with every hypothesis discharged from the lattice's own
construction; entering a `q`-expansion by hand discharges nothing.

- **Convention checks.** `Θ_ℤ = jacobiTheta` (§3.5), so the exponent and norm conventions are the
  standard ones; `Θ_{ℤ²}(-1/τ) = (τ/i) Θ_{ℤ²}(τ)`, the square of Mathlib's `jacobiTheta_S_smul`
  (§4.4); and `Θ_{ℤ²} ∣[1] S² = -Θ_{ℤ²}`: the inversion law applied twice gives `(-i)^{2k} = (-1)^k`,
  which is the action of `S² = −I` in weight `k`, not `1`.
- **Consistency of the inversion laws.** The vector-valued inversion law at `γ = 0`, compared with
  the scalar one, returns `Θ_{L^∨} = ∑_{γ ∈ L^∨/L} θ_{γ+L}` for integral `L` (§4.4).
- **Gauss sums.** The square of the Landsberg–Schaar identity as the case `L = √2 ℤ²` of §6.2, and
  `∑_{γ ∈ ℤ/3} e(γ²/3) = i√3` as Milgram's formula for `A₂` (§6.3).
- **Level one.** `Θ_{E₈} = E₄`, `r_{E₈}(2) = 240`, `r_{E₈}(2m) = 240 σ₃(m)` (§8.2);
  `Θ_Λ = E₄³ - 720 Δ = E₁₂ - (65520/691) Δ`, `r_Λ(4) = 196560` and
  `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))` (§8.4); `Θ_{E₈⊕E₈} = Θ_{D₁₆⁺} = E₄²` for the two lattices of
  §8.5, hence the theta series does not determine the lattice, the non-isometry being the input and
  not re-derived.
- **General level.** `Θ_{A₂} ∈ M₁(Γ₀(3), (-3/·))` and `Θ_{D₄} ∈ M₂(Γ₀(2))`, and their identification
  with Eisenstein series (§8.6). Weight `1` at `A₂` is admissible because nothing here needs a
  dimension formula to state modularity.
- **The Fricke involution.** The Fricke matrix `W_N = !![0, -1; N, 0]` (Tau Ceti's `TauCeti.frickeGL`)
  exchanges `Θ_L` and `Θ_{√N • L^∨}` (§7.6); the raw operator `TauCeti.frickeOperator` squares to
  `TauCeti.frickeScalar N k = (-1)^k N^{k-2}` (`TauCeti.frickeOperator_frickeOperator_apply`), so the
  normalised operator `(√N)^{2-k} (· ∣[k] W_N)` squares to `(-1)^k`: it is an
  involution in even weight only, and even rank does not give even weight (`A₂` has `k = 1`). For
  `√2 • E₈` (`N = 2`), the Fricke partner `√2 • (√2 • E₈)^∨ = E₈` has level `1`: its level divides
  `N` and need not equal it.

**Boundary and off-hypothesis checks.** Each records an interface decision by the example that
forces it.

- The zero lattice in the zero-dimensional space: `Θ_0 = 1`, `det 0 = 1`, `level 0 = 1`, and every
  scaling fixes it, so it stays unimodular — which is why the strict scaling statements of §2.2 carry
  `Nontrivial E`.
- `L = 2^{1/4} ℤ`: `L ∩ L^∨ = 0`, so `L^∨ ⧸ (L ∩ L^∨)` is infinite — which is why finiteness of the
  discriminant group and of `L^∨ ⧸ aL`, and `D_L ≠ 0`, carry integrality.
- `L = ½ ℤ`: `L^∨ = 2ℤ ⊂ L` and `Θ_{2ℤ}(i) ≠ Θ_{½ℤ}(i)` — which is why the dual decomposition of §3.2
  carries integrality.
- `L = ℤ`, `a = c = 1`, `m = 0`; `L = √2 ℤ`, `m = 1/(2√2)`; `e(q_L)` on `ℤ`: the representatives of
  one class give `1` and `-1` — which is why evenness and `m ∈ L^∨` are arguments of the summands.
- `L = √2 ℤ²`, `a = 3`, `c = 12`: the dual-side sum `∑_{y ∈ L^∨/3L} e(-12 ‖y‖²/6)` has every summand
  `e(-(u² + v²)) = 1` on the `36` classes `y = (u, v)/√2`, `u, v mod 6`, so it is `36`, not
  `det L · (D_L/3) · 3 = -12` — which is why the evaluation at an odd modulus (§6.4) carries
  `gcd(a, c) = 1`.
- `L = √2 ℤ²`, `a = 1`, `c = 2`: `G_L(1, 2) = 0` and `Θ_L(1/2 + it) > 0` — which is why the
  asymptotic of §6.2 is additive.
- `L = ℤ²`: `Θ ∣[1] S² = -Θ` — the central element acts by `(-1)^k`, and the double inversion of §4.4
  carries that scalar.
- `L = √2 ℤ²`, `a = 3`, `c = 4`: the Gram matrix `2I` of `L` and the Gram matrix `-2I` of
  `-c ⟪·, ·⟫` on `L^∨` in the dual basis both have determinant `4`; their ratio `1` is a square
  modulo `3` while `-1` is not, so the sign `(-1)^k` in `(D_L / a)` does not come from comparing
  these determinants: it comes from the square `g_p² = (-1/p) p` of the rank-one Gauss sum (§6.4).
- `!![-2, -3; 3, 4] ∈ Γ(3)` and `T³` times it — which is why §7.1 arranges the sign of `a` as well as
  its parity, by `T^{jN}` inside `Γ(N)`.
- `D₄`: level `2`, so `−I ∈ Γ(2)`, and weight `2`, so `−I` acts trivially — the instance of the
  corollary of §6.3 that §7.5 rests on.
- `√2 • E₈` has level `2` and `√2 • (√2 • E₈)^∨ = E₈` has level `1` (§2.6).

## Downstream consumers

- [L-functions](../LFunctions/README.md) consumes lattice Poisson summation, its two summability
  halves, the Gaussian and its Fourier transform, the dual lattice, biduality and the covolume of the
  dual (§§1.1, 1.5, 1.6, 2.1, 2.3), applied in a Euclidean model of its mixed space reached by a
  continuous real linear equivalence.
- [Lattice packings and perfect forms](../LatticePackingsAndPerfectForms/README.md) consumes Layer 1
  (Poisson summation and dual covolumes) and Layer 7 (§7.3 with §7.4).
- [Quaternion arithmetic](../QuaternionArithmetic/README.md) consumes Layer 7.
- [Hypergeometric motives](../HypergeometricMotives/README.md) consumes the Kronecker symbol and
  character of §2.8.
- [CFSG basic properties](../CFSGBasicProperties/README.md) cites the Leech identity of §8.4.

## Provenance

This section is secondary and not prescriptive. The dimension-8 and dimension-24 lattices, and a
dimension-24 instance of lattice Poisson summation, of the theta series and of its inversion law,
exist in the sphere-packing formalization
([github.com/math-inc/Sphere-Packing-Lean](https://github.com/math-inc/Sphere-Packing-Lean),
Apache-2.0), which builds on the EPFL project of Hariharan, Viazovska, Birkbeck, Lee, Ma and Mehta
([github.com/thefundamentaltheor3m/Sphere-Packing-Lean](https://github.com/thefundamentaltheor3m/Sphere-Packing-Lean)).
**Coordinate with its authors and obtain their agreement before porting any of it**, and discuss the
plan on the Lean Zulip; the licence permitting reuse is not on its own a reason to reuse. Everything
there is hard-wired to `EuclideanSpace ℝ (Fin 24)` or `EuclideanSpace ℝ (Fin 8)` and is generalized,
not copied; its ad hoc predicates `EvenNormSq`, `Integral`, `Rootless`, `Unimodular` correspond to
the `ZLattice` predicates of §2.1, with comparison lemmas so that its `E₈` and Leech facts can be
consumed.

| Existing | Counterpart |
|---|---|
| `SpherePacking/Dim8/E8/Basic.lean`, `.../Packing.lean`: `Submodule.E8`, `E8Lattice`, `E8_integral`, `E8_integral_self`, `E8Matrix_unimodular` | a second model of `E₈`, beside the real model of Tau Ceti's `typeE₈RootLattice` (§8.2); `covolume = 1 ↔ L = L^∨` for integral `L` (§2.3) and Mathlib's `ZLattice.covolume_eq_det` connect `E8Matrix_unimodular` to `ZLattice.IsUnimodular`; comparison lemmas only |
| `SpherePacking/Dim24/LeechLattice/*`: `LeechLattice`, `leech_covolume`, `leech_norm_lower_bound`, `IsZLattice` instance | a second model of the Leech lattice, beside the real model of Tau Ceti's `TauCeti.leechLattice` (§8.4) |
| `.../Uniqueness/LatticeInvariants.lean`: `EvenNormSq`, `Integral`, `Rootless`, `Unimodular`, `leech_evenNormSq`, `leech_rootless`, `leech_unimodular` | the `ZLattice` predicates (§2.1), plus comparison lemmas |
| `SpherePacking/CohnElkies/PoissonSummation*`: `SchwartzMap.poissonSummation_lattice` | lattice Poisson summation in general dimension (§1.1) |
| `.../Classify/EvenUnimodular/ThetaAnalytic.lean`, `ThetaSeries.lean`: `thetaSeries`, `thetaShell`, `thetaCoeff`, `summable_thetaTerm`, `thetaSeries_add_one_of_even` | the theta series, shells and translation law in general rank (§§2.7, 3.1, 3.3, 4.1) |
| `.../Classify/EvenUnimodular/ThetaTransform.lean`: `thetaSeries_transform_S` | the inversion law in general rank, with the general-translate and vector-valued forms (§§4.2–4.3) |
| `.../Classify/EvenUnimodular/{Discrete,FiniteShells,MinNorm,FundamentalDomain}.lean` | finiteness of shells in general rank (§2.7) |

Nothing in the sphere-packing project states that a theta series is a modular form. The
discriminant-form vocabulary is Tau Ceti's, built to the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md); the modular-form
vocabulary is the [modular-forms roadmap](../ModularForms/README.md)'s; and the rank-16 pair is the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)'s.

## Scope and ownership

**This roadmap owns** Poisson summation over a full lattice in a finite-dimensional real inner
product space, with its summability and Gaussian corollaries, and the dual lattice with biduality
and the covolume of the dual (Layer 1, §§2.1, 2.3): anyone who needs Poisson summation on a lattice
takes it, and those lemmas, from here. It owns the real lattice model, the comparison with rational
lattices and the arithmetic invariants: integrality, evenness, unimodularity, scaling, the
determinant and discriminant group, the level, the Fricke partner, shells and representation
numbers, the Kronecker symbol and character, and the discriminant group of an orthogonal sum
(Layer 2); the theta series and coset series with convergence, `q`-expansions and functoriality
(Layer 3); the translation and inversion laws, scalar and vector-valued (Layer 4); the level-one
theorem with `8 ∣ n` and the structure of the level-one theta forms (Layer 5); Gauss-sum
reciprocity, Milgram's formula at positive definite signature by theta asymptotics, the evaluation
at an odd modulus, the closed form of the Gauss sum, the conductor theorem and the nebentypus `χ_L`
(Layer 6); the reductions of §7.1, the coset splitting, the Hecke–Schoeneberg theorem, the theta
series as a modular form with character, the coset series on `Γ(N)`, the Fricke identities and their
consequences (Layer 7); the identifications of Layer 8: even unimodular lattices of rank `8`,
`16` and `24`, `E₈`, the Leech lattice, the theta identity of the rank-16 pair with the statement
that the theta series does not determine the lattice, and `A₂` and `D₄`; and the Hermitian theta
series `Θ_L^{(s)}` of degree `s` of a lattice in a finite-dimensional complex space with a positive
definite Hermitian form, on the Hermitian half-space `ℋ_s`, with its convergence and its inversion
law under `Z ↦ -Z^{-1}` (Layer 9). Where Tau Ceti realises an
item, the item names the declarations. This roadmap constructs no lattice, and states no Hecke
theory, dimension formula or newform theory of its own.

**Owned elsewhere.**

- *The arithmetic of the rational lattice*: the carrier `TauCeti.IntegralLattice` and its dual,
  discriminant group and discriminant forms, finite bilinear and quadratic modules, overlattices and
  isotropic subgroups, the rank-one and ADE lattices with `D₈⁺ ≅ E₈`, and the rationalization
  `TauCeti.IntegralLattice.ofIntegralForm` behind the rational model are Tau Ceti's, built to the
  [completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md). Jordan
  splittings, the genus, the Gauss-sum invariant `sign q ∈ ℤ/8` of a finite quadratic module,
  Milgram's theorem at every signature, Nikulin's theory, the classification of unimodular lattices
  in low rank and the rank-16 pair `E₈ ⊕ E₈`, `D₁₆⁺` with its non-isometry are the
  [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)'s; §8.5 consumes its
  6D. §6.3 is the positive definite instance of Milgram's theorem by theta asymptotics, kept because
  §§6.2–6.6 and §7.5 rest on its method and because it gives an independent route to `8 ∣ n`; it
  differs from that roadmap's statement in signature (positive definite only) and in route. That
  roadmap states no theta series and records the same boundary from its side (its Layer 8); the
  completed integral-lattices roadmap excludes theta series and modular forms from its scope, and
  the comparison lemmas it admits between a positive definite rational lattice extended to `ℝ` and
  its algebraic carrier are exactly §2.4.
- *Modular forms*: character spaces and their parity, diamond operators, the Fricke and Atkin–Lehner
  operators, the Sturm bound, the level-one graded ring, Eisenstein series with character, the
  corrected weight-two series and every dimension formula are the
  [modular-forms roadmap](../ModularForms/README.md)'s or Tau Ceti's; nothing here consumes a
  dimension formula beyond Mathlib's level-one one. The weight-one and weight-two character
  Eisenstein series in their positive-coefficient normalisation are its §0.1.
- *The number-field theta function and its Mellin transform* (the Gaussian theta of an ideal lattice
  in the mixed space, its transformation with level and epsilon, the completed zeta and Hecke
  `L`-functions) are the [L-functions roadmap](../LFunctions/README.md)'s; this roadmap owns nothing
  specific to a number field. A consumer whose model is not an inner product space — Mathlib's
  `NumberField.mixedEmbedding.mixedSpace` carries a product sup norm — applies lattice Poisson
  summation in a Euclidean model reached by a continuous real linear equivalence, carrying with it
  the quadratic form, the dual pairing, the normalization of the measure and the comparison of
  covolumes by the Jacobian. It is not a linear isometry: in `ℝ²` with the sup norm,
  `‖e₁ + e₂‖² + ‖e₁ - e₂‖² = 2 ≠ 4 = 2‖e₁‖² + 2‖e₂‖²` fails the parallelogram law. That transport is
  the consumer's, and Layer 1 is not weakened to avoid it.
- *Partial Fourier transforms*: for a finite-dimensional real space split into two orthogonal
  summands, the partial Fourier transform in one summand preserves Schwartz space, sends `f₁ ⊗ f₂`
  to `f₁ ⊗ f̂₂`, commutes with the partial transform in the other summand and composes with it to
  the full transform. These are
  [analytic number theory, Part II](../AnalyticNumberTheoryPartII/README.md) §5.3g's, stated there
  at every place of a number field for every nondegenerate pairing. At a real place, with the inner
  product as the pairing and `ψ_ℝ(x) = e(x)`, the self-dual measure is the Haar measure normalised
  by orthonormal bases and §5.3g's transform of `f` is `ξ ↦ 𝓕 f(-ξ)` in Mathlib's normalisation. No
  statement here uses them: §1.2 is proved from the Fourier series of the periodization on the
  torus, and only the coordinate-by-coordinate route to it would use them.
- *Not targets of this roadmap*: the Weil representation of `SL(2, ℤ)` on `ℂ[L^∨/L]` and the
  presentation `SL(2, ℤ) ≅ ⟨S, T | S⁴ = 1, (ST)³ = S²⟩`, neither needed here (the vector-valued
  inversion law of §4.3 and §7.5 are proved directly; a development of the Weil representation needs
  the Gauss-sum invariant of a finite quadratic module for its `S`-matrix and the local formulas of
  Scheithauer and Strömberg, and would consume Layer 6); theta series with spherical coefficients,
  Siegel and Jacobi theta series, Hermitian theta series beyond the definition and inversion law of
  Layer 9, the Siegel–Weil formula, sphere packing, the classification or uniqueness of any lattice,
  and the construction of Niemeier lattices; half-integral weight.

## Exact supplier contracts

### From Mathlib

- `IsZLattice`, `ZLattice.covolume` with `ZLattice.covolume_eq_det`, `ZLattice.summable_norm_rpow`,
  `ZLattice.comap` (`Mathlib/Algebra/Module/ZLattice/`): full lattices, their covolume, their pullback
  along a linear equivalence and the decay estimates.
- `LinearMap.BilinForm.dualSubmodule` and `innerₗ`: the dual lattice of record.
- `SchwartzMap` with `SchwartzMap.compSubConstCLM` (translation), the Fourier transform `𝓕` on a
  finite-dimensional inner product space with kernel `e(-⟪x, ξ⟫)`, `fourier_gaussian_innerProductSpace`,
  `Real.tsum_eq_tsum_fourier` (Poisson summation on `ℝ`),
  `UnitAddTorus.hasSum_mFourier_series_apply_of_summable` (Fourier series on the torus),
  `ContinuousLinearMap.adjoint`.
- `WithLp.prod_norm_sq_eq_of_L2` (`‖x‖² = ‖x.1‖² + ‖x.2‖²` on `WithLp 2 (E × F)`) and
  `tsum_mul_tsum_of_summable_norm`, for §3.4.
- Modular forms: `ModularForm`, `CuspForm`, `SlashAction` with the right-action law,
  `ModularForm.slash_neg_one` (`−I` acts by `(-1)^k`), `ModularForm.mul`, `ModularGroup.S`,
  `ModularGroup.T`, `SlashInvariantForm.slash_action_generators_SL2Z` (invariance under `S` and `T`
  gives invariance under `SL(2, ℤ)`), `CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0`,
  `CongruenceSubgroup.Gamma1`, `Matrix.SpecialLinearGroup.mapGL`, `UpperHalfPlane.qExpansion`;
  `ModularForm.E` with `ModularForm.E₄`, `ModularForm.E₆`, `CuspForm.discriminant` and
  `ModularForm.discriminant`; `ModularForm.dimension_level_one`; `jacobiTheta`, `jacobiTheta_S_smul`,
  `jacobiTheta_T_sq_smul`, `hasSum_nat_jacobiTheta`.
- Arithmetic: `jacobiSym` (for odd denominators) with `jacobiSym.mul_right'`, `legendreSym`,
  `ZMod.χ₈`, `gaussSum`, `gaussSum_sq`, `gaussSum_mul_gaussSum_eq_card`; `DirichletCharacter`,
  `DirichletCharacter.changeLevel`, `DirichletCharacter.FactorsThrough`,
  `DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `DirichletCharacter.conductor`,
  `DirichletCharacter.mem_conductorSet_iff_conductor_dvd`, `DirichletCharacter.conductor_changeLevel`,
  `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.conductor_dvd_level`, `ZMod.unitsMap`,
  `MulChar.toUnitHom`.

### From Tau Ceti

Paths are under `TauCeti/`. The declarations realising this roadmap's own items are named on the
*In Tau Ceti:* lines of the layers above. Besides them, this roadmap consumes the following, each
proved at the pin.

- *Rational lattices* (`LinearAlgebra/IntegralLattice/`): the carrier `TauCeti.IntegralLattice` with
  its dual, discriminant group, `TauCeti.IntegralLattice.discriminantPairing`,
  `TauCeti.IntegralLattice.discriminantQuadraticMap`, determinant, discriminant, level and
  `vectorsOfNorm` (Conventions 5–7, §2.4); `TauCeti.IntegralLattice.ofIntegralForm` (the
  rationalization of an integral form on a finite free `ℤ`-module, §2.4);
  `TauCeti.IntegralLattice.discriminantQuadraticIsometryOrthogonalSum` (§2.9);
  `TauCeti.IntegralLattice.discriminantQuadraticMap_rankOneClass` and
  `TauCeti.IntegralLattice.discriminantQuadraticMap_typeAFundamentalWeightClass` (Layer 2,
  Examples).
- *Lattices* (`LinearAlgebra/IntegralLattice/RootLattice/`, `Rank24/Leech/`, `PosDef/`):
  `TauCeti.IntegralLattice.typeARootLattice`, `TauCeti.IntegralLattice.checkerboardLattice` with
  `TauCeti.IntegralLattice.isPosDef_typeARootLattice` and
  `TauCeti.IntegralLattice.isPosDef_checkerboardLattice`; `TauCeti.IntegralLattice.typeE₈RootLattice`
  with `TauCeti.IntegralLattice.isPosDef_typeE₈RootLattice`,
  `TauCeti.IntegralLattice.isEven_typeE₈RootLattice` and
  `TauCeti.IntegralLattice.isUnimodular_typeE₈RootLattice`; `TauCeti.leechLattice` with
  `TauCeti.isPosDef_leechLattice`; `TauCeti.IntegralLattice.e8PowLattice` and
  `TauCeti.IntegralLattice.checkerboardPlusLattice`, with the non-isometry
  `TauCeti.IntegralLattice.isEmpty_isometry_e8PowLattice_checkerboardPlusLattice` (§8.5).
- *Orthogonal sums of real lattices* (`Algebra/Module/ZLattice/OrthSum.lean`): `ZLattice.orthSum`,
  `ZLattice.orthSumEquivProd`, `ZLattice.mem_orthSum`, `ZLattice.dual_orthSum`, with the instances
  making `ZLattice.orthSum L M` a full lattice (Convention 17).
- *Gauss sums over translates* (`Algebra/Module/ZLattice/CosetGaussSum.lean`):
  `ZLattice.cosetGaussSum`, `ZLattice.cosetGaussSum_eq_zero`, `ZLattice.cosetGaussSum_eq_of_mem`
  (for even `L`, `γ, m ∈ L^∨`: the sum of `e((a ‖γ + y‖²/2 + ⟪γ + y, m⟫)/c)` over `y ∈ L/cL`
  vanishes unless `aγ + m ∈ L` when `N ∣ c`, and otherwise is an explicit phase times `G_L(a, c)`
  when `ad ≡ 1 (mod c)`), for §7.5; `ZLattice.IsIntegral.card_quotient_smul_submoduleOf_dual`
  (`|L^∨ ⧸ cL| = c^n |L^∨/L|` for integral `L`), for §6.2.
- *Kronecker characters and conductors* (`NumberTheory/LegendreSymbol/KroneckerSymbol.lean`,
  `NumberTheory/DirichletCharacter/Basic.lean`, `Data/ZMod/Units.lean`):
  `TauCeti.conductor_kroneckerChar_dvd_iff` (when `2 ≠ 0` in the coefficient ring, the conductor of
  `(D / ·)` divides `N` exactly when `(D / a) = 1` for every odd natural `a` prime to `D` with
  `a ≡ 1 (mod N)`), `DirichletCharacter.conductor_dvd_iff_forall_odd`,
  `ZMod.exists_odd_unitOfCoprime_eq` (every unit class has an odd representative), for §6.6.
- *Modular forms* (`NumberTheory/ModularForms/`): `modFormCharSpace`,
  `mem_modFormCharSpace_iff_nebentypus`, `diamondOp_apply_of_mem_modFormCharSpace`
  (`DiamondOperators.lean`; Convention 13); `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`
  (`Parity.lean`; a nonzero character space of weight `k` has `χ(-1) = (-1)^k`);
  `ModularForm.eq_of_sturm_bound` (`SturmBound.lean`; two forms of weight `k` on a finite-index
  `Γ` agreeing in their coefficients up to `⌊k [SL₂(ℤ) : Γ] / 12⌋` are equal);
  `CongruenceSubgroup.Gamma0_prime_index` (`CongruenceSubgroups/Basic.lean`; index `p + 1`);
  `mvPolynomialEquivModularForms` (`LevelOne/GradedRing.lean`; the level-one graded ring is the
  polynomial ring on `E₄` and `E₆`), for §5.4; `TauCeti.frickeGL`, `TauCeti.frickeOperator`,
  `TauCeti.frickeScalar`, `TauCeti.frickeOperator_frickeOperator_apply` (`Fricke/`; the Fricke
  matrix `!![0, -1; N, 0]` and the raw operator, whose square is `(-1)^k N^{k-2}`) and
  `TauCeti.atkinLehnerNormalizer` (`AtkinLehner/Normalizer.lean`; the constant `(√N)^{2-k}`), for
  §7.6; `TauCeti.EisensteinSeries.charE1MF`, `TauCeti.EisensteinSeries.charE1MF_mem_modFormCharSpace`,
  `TauCeti.EisensteinSeries.qExpansion_charE1MF_coeff`
  (`EisensteinSeries/WeightOne/`; the weight-one Eisenstein series `E₁^{ψ,φ}` on `Γ₁(N)` for
  characters `ψ`, `φ` of moduli `u`, `v` with `uv ∣ N`, in `M₁(N, ψφ)`, with its coefficients when
  `ψ(-1) φ(-1) = -1`); `TauCeti.EisensteinSeries.correctedE2`,
  `TauCeti.EisensteinSeries.qExpansion_coeff_correctedE2` (`EisensteinSeries/WeightTwo/Basic.lean`;
  `E₂(τ) - t E₂(tτ)` on `Γ₀(t)`, with constant term `1 - t` and `n`-th coefficient
  `-24(σ₁(n) - t σ₁(n/t))`, the last term present only when `t ∣ n`), for §8.6.

### From TauCetiRoadmap.ModularForms

§0.1: the weight-one Eisenstein series with characters `ψ`, `φ` (primitive, `ψ(-1) φ(-1) = -1`) in
the positive-coefficient normalisation `a(n) = ∑_{d ∣ n} ψ(n/d) φ(d)` for `n ≥ 1`, with constant term
`-(1_{ψ=1} B_{1,φ} + 1_{φ=1} B_{1,ψ})/2`, and its membership in the character space. Consumed only
by §8.6, where Tau Ceti's `TauCeti.EisensteinSeries.charE1MF` with its coefficients serves equally.

## References

- J.-P. Serre, *A Course in Arithmetic*, GTM 7 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-1-4684-9884-4). Ch. VII §6 is the level-one theorem: the theta
  series of an even unimodular lattice is a modular form of weight `n/2`, with the `8 ∣ n` argument
  by passing to `L ⊕ L` and `L^{⊕4}` used in §5.1; §3 is the structure of `M_*(SL(2,ℤ))`.
- W. Ebeling, *Lattices and Codes*, 3rd ed. (Springer, 2013),
  [DOI](https://doi.org/10.1007/978-3-658-00360-9). Ch. 2 for theta series, Poisson summation and
  the transformation formula; Ch. 3 for the Hecke–Schoeneberg theory (attributed there to Hecke and
  Schoeneberg, following Ogg and Schoeneberg): for an even lattice `Λ` of level `ℓ` and dimension
  `n = 2k`, `θ_Λ ∈ M_k(Γ₀(ℓ), χ_Λ)` with `χ_Λ(·) = ((-1)^k det Λ / ·)`, proved by the coset splitting
  and Gauss sums of Layers 6 and 7. Ch. 3 also has the `E₈`, `E₈ ⊕ E₈` and `D₁₆⁺` calculations of
  Layer 8.
- A. Ogg, *Modular Forms and Dirichlet Series* (Benjamin, 1969), Ch. VI — the source Ebeling follows
  for the general-level transformation formula and the Gauss-sum evaluation.
- B. Schoeneberg, *Elliptic Modular Functions: An Introduction*, Grundlehren 203 (Springer, 1974),
  [DOI](https://doi.org/10.1007/978-3-642-65663-7). Ch. IX is the coset-splitting proof, via the
  decomposition of a `Γ₀(N)` matrix in `SL(2, ℝ)`, that is Layer 7's route of record.
- H. Iwaniec, *Topics in Classical Automorphic Forms*, GSM 17 (AMS, 1997),
  [DOI](https://doi.org/10.1090/gsm/017), Ch. 10 — theta functions attached to quadratic forms, the
  general transformation formula, and the Gauss sums, in the form closest to the Layer-6 computation.
- D. M. Cohen and H. L. Resnikoff, "Hermitian quadratic forms and Hermitian modular forms",
  *Pacific J. Math.* **76** (1978), 329–337, [msp](https://msp.org/pjm/1978/76-2/p05.xhtml).
  Formulas (2)–(4), p. 330: the theta function of a positive Hermitian form in `r` variables and a
  lattice in `ℂ^{r×s}`, on the Hermitian half-space of degree `s`, and its functional equation
  under `Z ↦ -Z^{-1}`, proved by Poisson summation — Layer 9.
- H. L. Resnikoff, "Theta functions for Jordan algebras", *Invent. Math.* **31** (1975), 87–104.
  Theorem 2.2, the Poisson summation step that Cohen and Resnikoff cite for §9.2.
- J. Milnor and D. Husemoller, *Symmetric Bilinear Forms*, Ergebnisse 73 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-3-642-88330-9). Appendix 4 is Gauss sums and Milgram's formula,
  `∑_γ e(q(γ)) = |A|^{1/2} e(σ/8)`, proved by the theta-asymptotic method of Layer 6.
- V. Turaev, "Reciprocity for Gauss sums on finite abelian groups", *Math. Proc. Cambridge Philos.
  Soc.* **124** (1998), [DOI](https://doi.org/10.1017/S0305004198002655) — §1.3 is the reciprocity
  law for the Gauss sums attached to a tensor product of bilinear lattices; the lattice statement of
  §6.2 is the case of `ℤ` with the form `c x y` tensored with `L` with the form `a ⟪·, ·⟫`, pairing
  `L ⧸ cL` against `L^∨ ⧸ aL`; its rank-one case is the classical Landsberg–Schaar identity, tested
  here through its square at rank two.
- T. Miyake, *Modular Forms* (Springer, 1989), [DOI](https://doi.org/10.1007/3-540-29593-3), §4.9 —
  theta series with spherical coefficients and their nebentypus; the numbering the modular-forms
  roadmap follows elsewhere. ⚠ The spherical-coefficient generality is not a target here.
- J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed. (Springer, 1999),
  [DOI](https://doi.org/10.1007/978-1-4757-6568-7). Ch. 2 §2.3 for theta series and the `E₈`, `A₂`,
  `D₄` expansions; Ch. 4 §11 for the Leech lattice theta series `Θ_Λ = E₁₂ - (65520/691) Δ` and the
  formula `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))`; Ch. 7 for the even unimodular theta series as
  polynomials in `E₄` and `Δ`.
- V. V. Nikulin, "Integral symmetric bilinear forms and some of their applications", *Math.
  USSR-Izv.* **14** (1980), [MathNet](https://www.mathnet.ru/eng/im1677),
  [DOI](https://doi.org/10.1070/IM1980v014n01ABEH001060). §1.1 and §1.4 — cited here only through the
  [completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md), and in its
  half-norm translation.
- N. R. Scheithauer, "The Weil representation of `SL₂(ℤ)` and some applications", *Int. Math. Res.
  Not.* **2009**, [DOI](https://doi.org/10.1093/imrn/rnn128), and F. Strömberg, "Weil
  representations associated with finite quadratic modules", *Math. Z.* **275** (2013),
  [DOI](https://doi.org/10.1007/s00209-013-1188-z) — the Weil representation, which this roadmap
  does not build; cited to fix what a development of it would need (*Scope and ownership*).
- H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, "The sphere packing problem in
  dimension 24", *Ann. of Math.* **185** (2017), [arXiv:1603.06518](https://arxiv.org/abs/1603.06518)
  — the source of the Leech lattice of the sphere-packing formalization (*Provenance*).
