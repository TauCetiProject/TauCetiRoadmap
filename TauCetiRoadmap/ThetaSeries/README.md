# Roadmap: theta series of lattices

**Summary.** The theta series of a positive definite lattice is the generating function of its
representation numbers, and the theorem that makes it useful is that it is a modular form. This
roadmap concerns a full lattice `L` in a finite-dimensional real inner product space `E` of
dimension `n`, with dual lattice `L^∨`. The lattice is *even* when every squared norm `‖v‖²`,
`v ∈ L`, is an even integer; an even lattice is integral, its discriminant group `L^∨ / L` is
finite of order `det L`, and its *level* `N` is the least positive integer with `N ‖x‖² / 2 ∈ ℤ`
for every `x ∈ L^∨`. The theta series is `Θ_L(τ) = ∑_{v ∈ L} exp(π i ‖v‖² τ)` on the upper
half-plane, and each class `γ + L` of `L^∨ / L` has its coset series
`θ_{γ+L}(τ) = ∑_{v ∈ L} exp(π i ‖γ + v‖² τ)`. Wherever an automorphy factor appears the rank is
even, `n = 2k`, so that the weight `k` is an integer.

The headline theorems are these. **Hecke–Schoeneberg:** if `L` is even of rank `2k` and level `N`,
then `Θ_L` is a modular form of weight `k` on `Γ₀(N)` with the quadratic character
`χ_L(d) = (D_L / d)`, the Kronecker symbol of the signed discriminant `D_L = (-1)^k det L`; that is,
`Θ_L((aτ + b)/(cτ + d)) = χ_L(d) (cτ + d)^k Θ_L(τ)` for every matrix of `Γ₀(N)`. Under the same
hypotheses every coset series `θ_{γ+L}` is a modular form of weight `k` on the principal congruence
subgroup `Γ(N)`. The arithmetic behind both is a reciprocity law for the Gauss sums
`G_L(a, c) = ∑_{y ∈ L/cL} e(a ‖y‖² / (2c))`, `e(x) = exp(2πix)`, which exchanges `a` and `c` and
passes to `L^∨`; it gives Milgram's formula `∑_{γ ∈ L^∨/L} e(‖γ‖²/2) = (det L)^{1/2} i^k`, the
evaluation `G_L(a, c) = c^k (det L)^{1/2} i^k (D_L / a)` for odd positive `a` prime to `c` with
`N ∣ c`, and
the fact that the conductor of `(D_L / ·)` divides `N`. Applied to the root lattices `A₂` and `D₄`,
the number of vectors of squared norm `2m`, `m ≥ 1`, is `6 ∑_{d ∣ m} (-3 / d)` in `A₂` and `24`
times the sum of the odd divisors of `m` in `D₄`.

The roadmap sits on Tau Ceti's real lattice model and its theory of theta series: Poisson summation
over a lattice, the translation and inversion laws, the `q`-expansions, the level-one theorem for
even unimodular lattices, and the identification of the theta series of even unimodular lattices of
rank 8, 16 and 24, of `E₈` and of the Leech lattice. The
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md) owns the arithmetic
of the rational lattice (discriminant forms, Milgram's theorem at every signature, the rank-16 pair),
which reaches the real model through Tau Ceti's comparison of the two models. The
[modular-forms roadmap](../ModularForms/README.md) owns the character Eisenstein series against which
`Θ_{A₂}` is identified. Downstream, the [L-functions roadmap](../LFunctions/README.md) and
[lattice packings and perfect forms](../LatticePackingsAndPerfectForms/README.md) use lattice Poisson
summation, and the latter, with [quaternion arithmetic](../QuaternionArithmetic/README.md), uses the
Hecke–Schoeneberg theorem.

The layers below are numbered once and for all; other roadmaps cite them by these numbers or by the
earlier lettered labels, which *How to read the build* maps to them, and a number whose material is
not a target here has no section below. Layer 2 keeps the discriminant group of an orthogonal sum;
Layer 3 the theta series of an orthogonal sum; Layer 5 the basic API of the level-one theta form;
Layer 6 the Gauss sums: reciprocity, Milgram's formula, the closed form, the conductor theorem and
the nebentypus; Layer 7 the Hecke–Schoeneberg theorem, the theta series as a modular form with
character, and the coset series on `Γ(N)`; Layer 8 the identification of `Θ_{A₂}` and `Θ_{D₄}`.
Layers 1 and 4 have no sections here.

## How to read the build

Each layer is a list of numbered sections `### k.n`, each stating its targets in prose with their
hypotheses, the source at the claim, a *Needs:* line and, where they earn their place, Checks.
Section numbers are fixed: §k.n is the `n`-th item of Layer `k`, and a citation of a number that
does not appear below (all of Layer 1 and of Layer 4, §§2.1–2.8, 3.1–3.3, 3.5, 5.1, 5.2, 5.4,
6.1, 6.4, 7.2, 8.1–8.5) resolves to what the table in *Scope and ownership* lists under that
number: the Tau Ceti declarations that carry it, or the roadmap that owns it. The earlier
lettered label `kX` is §k.n, with `n` the position of the letter `X` in the alphabet:

| Earlier lettered labels | Present sections |
|---|---|
| 1A, 1B, 1C, 1D, 1E, 1F | §§1.1–1.6, in that order |
| 2A, 2B, 2C, 2D, 2E, 2F, 2G, 2H | §§2.1–2.8, in that order |
| 3A, 3B, 3C, 3D, 3E | §§3.1–3.5, in that order |
| 4A, 4B, 4C, 4D | §§4.1–4.4, in that order |
| 5A, 5B, 5C, 5D | §§5.1–5.4, in that order |
| 6A, 6B, 6C, 6D, 6E, 6F | §§6.1–6.6, in that order |
| 7A, 7B, 7C, 7D, 7E, 7F | §§7.1–7.6, in that order |
| 8A, 8B, 8C, 8D, 8E | §§8.1–8.5, in that order |

The dependency order is Layer 2; Layer 3; Layer 5 (on §3.4); Layer 6; Layer 7 (on Layer 6);
Layer 8 (on Layer 7). Nothing in Layers 1–7 mentions dimension `8`, `16` or `24`, and no lattice is
constructed here: `E₈`, the rank-16 pair, the Leech lattice, `A₂` and `D₄` are Tau Ceti's and enter
at Layer 8. Each *Needs:* line lists what its statement and its route use, item by item, so that a
target proved by another route is not blocked behind an unrelated one. `Suggested.lean` states the
headline theorems of Layers 6–8 against the pinned libraries.

## Conventions

1. **The ambient space and the carrier.** `E` is a finite-dimensional real inner product space
   (`[NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]`), with
   `[MeasurableSpace E] [BorelSpace E]` wherever `volume`, a covolume or a Fourier transform
   occurs, so that `volume` is the Haar measure normalised by orthonormal bases. A lattice is
   `L : Submodule ℤ E` with `[DiscreteTopology L] [IsZLattice ℝ L]`, and its rank is
   `Module.finrank ℝ E`, equal to `Module.finrank ℤ L`. The lattice vocabulary is Tau Ceti's
   `ZLattice` namespace; there is no private finite free model. This is not the carrier
   `TauCeti.IntegralLattice` of rational lattices (a `ℤ`-submodule of a rational vector space with a
   rational bilinear form): the theta series is a sum of `exp(π i ‖v‖² τ)` over `L`, so it needs a real norm, and Poisson summation needs the Haar
   measure of `E` and the covolume of `L`. Tau Ceti's comparison of the two models, the rational
   model `ZLattice.ratModel` of an integral lattice and the real model
   `TauCeti.IntegralLattice.realModel` of a positive definite rational lattice, is the only place
   they meet; discriminant-form theory is read across it and never reproved in `E`.
2. **Positive definiteness is structural.** The form is the inner product of `E`, so no `PosDef`
   hypothesis appears anywhere. Indefinite lattices have no convergent theta series and are not in
   scope.
3. **Integral, even, unimodular.** `ZLattice.IsIntegral L` is `L ≤ L^∨` (equivalently
   `⟪x, y⟫ ∈ ℤ` for all `x, y ∈ L`, `ZLattice.isIntegral_iff`); `ZLattice.IsEven L` is
   `∀ x ∈ L, ∃ m : ℤ, ‖x‖ ^ 2 = 2 * m`; `ZLattice.IsUnimodular L` is `L = L^∨`. Evenness implies
   integrality (`ZLattice.IsEven.isIntegral`); integrality does not imply evenness (`ℤ ⊆ ℝ`). For an
   integral lattice, unimodularity is equivalent to covolume one, to determinant one and to a trivial
   discriminant group; these are theorems, not alternative definitions.
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
    `N/2` times the least squared norm in `γ + L`.
11. **The theta series of the dual.** For integral `L`, `Θ_{L^∨} = ∑_{γ ∈ L^∨/L} θ_{γ+L}`, a finite
    sum, and `θ_{0+L} = Θ_L`. ⚠ Integrality is needed: for `L = ½ ℤ`, `L^∨ = 2ℤ ⊆ L`, the quotient
    `L^∨ ⧸ (L ∩ L^∨)` is trivial, and the unguarded identity would read `Θ_{2ℤ} = Θ_{½ℤ}`, false at
    `τ = i`. The coset series satisfy `θ_{-γ} = θ_γ`, so the family `(θ_γ)_{γ ∈ L^∨/L}` is not
    linearly independent; no statement about matrices acting on `ℂ[L^∨/L]` is read off identities
    between theta functions.
12. **Two names, one object.** `ZLattice.thetaSeries L : ℍ → ℂ` is the function. A bundled modular
    form is a separate declaration whose coercion is that function: at level one Tau Ceti's
    `ZLattice.thetaForm` (with `ZLattice.coe_thetaForm`), at general level the form of §7.4. Analytic
    facts are stated about the function and membership facts about the bundled form; the
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
    `D_L = (-1)^k det L`; it is `≡ 0` or `1 (mod 4)`
    (`ZLattice.IsEven.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one`), so `(D_L / ·)` is
    Tau Ceti's Kronecker character `TauCeti.kroneckerChar ℂ D_L` at modulus `|D_L|`. The nebentypus
    `χ_L` (`nebentypus`, §6.6) is the character at modulus `N` induced from its primitive character,
    which is legitimate because the conductor divides `N`, a theorem (§6.6) and not a convention. Both
    faces are kept: `χ_L` as a Dirichlet character, and its unit homomorphism `MulChar.toUnitHom`
    for `modFormCharSpace`.
16. **Isometry** means a `LinearIsometryEquiv` `e : F ≃ₗᵢ[ℝ] E` of the ambient spaces; invariance
    statements are made for the pulled-back lattice `ZLattice.comap ℝ L e.toLinearEquiv.toLinearMap`,
    never against a bare additive or module equivalence.
17. **Orthogonal direct sums** are `ZLattice.orthSum L M` inside `WithLp 2 (E × F)`, with the product
    inner product. Fixed once: `Θ_{L ⊕ M} = Θ_L Θ_M` (§3.4), `det(L ⊕ M) = det L det M`,
    `level(L ⊕ M) = lcm(level L, level M)`, `A_{L⊕M} ≅ A_L × A_M` as finite quadratic modules (§2.9),
    and integrality, evenness and unimodularity are each preserved by orthogonal sum and by
    isometry.
18. **Rank and weight.** Wherever an automorphy factor appears, `n = 2k` with `k : ℕ`, so the factor
    is `(τ/i)^k = (-i)^k τ^k`, an integer power; `Complex.cpow` occurs only in the general-rank
    Fourier transform of the Gaussian. A lattice of odd rank has a theta series of half-integral
    weight, which needs the metaplectic group and a branch of `√τ`; half-integral weight is out of
    scope. Mathlib's odd-rank law `jacobiTheta_S_smul` is consumed only through its square, and the
    rank-one Landsberg–Schaar identity is not a target: its square at rank two is a Check of §6.2.
19. **Files.** The targets of Layers 2, 3 and 5–8 belong beside Tau Ceti's existing files: the
    discriminant group of an orthogonal sum and lattice Gauss sums in
    `TauCeti/Algebra/Module/ZLattice/`, theta series and their modularity in
    `TauCeti/NumberTheory/ModularForms/ThetaSeries/`.

## Layer 2: the real lattice model, the bridge, and the arithmetic invariants

### 2.9 The discriminant group of an orthogonal sum

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

- `D₄ ⊕ D₄` has discriminant group `(ℤ/2)⁴`, the pairs of classes of the two summands. Since `q` is
  `1/2` on each nonzero class of `D₄`, `q` on the sum is `1/2` on the `6` pairs with exactly one
  nonzero entry and `0` on the origin and on the `9` pairs of two nonzero classes; `e(q)` sums to
  `10 - 6 = 4 = √16 · i⁴`, consistent with §6.3 in rank `8`.

### Dependencies

Tau Ceti: the real lattice model, orthogonal sums, the dual of an orthogonal sum. No other layer of
this roadmap.

## Layer 3: the theta series

### 3.4 Functoriality under orthogonal sums

For full lattices `L ⊆ E` and `M ⊆ F` and their orthogonal sum `ZLattice.orthSum L M` in
`WithLp 2 (E × F)`, prove that for every `τ ∈ ℍ`

```text
Θ_{L ⊕ M}(τ) = Θ_L(τ) * Θ_M(τ),
θ_{(γ, δ) + (L ⊕ M)}(τ) = θ_{γ+L}(τ) * θ_{δ+M}(τ)     for γ ∈ E, δ ∈ F,
```

with no integrality hypothesis, by reindexing along `L ⊕ M ≃ L × M` and multiplying two absolutely
convergent series (Ebeling, Ch. 2). Together with invariance under isometry and under scaling, each
of these is a reindexing proved once and used by the worked examples and by §5.3.

*Needs:* Tau Ceti `ZLattice.orthSum`, `ZLattice.orthSumEquivProd`, `ZLattice.mem_orthSum`, the
instances making `ZLattice.orthSum L M` a full lattice, `ZLattice.summable_thetaSeries`,
`ZLattice.summable_thetaCoset`; Mathlib `WithLp.prod_norm_sq_eq_of_L2`,
`tsum_mul_tsum_of_summable_norm`.

**Checks.**
- For `L = M = ℤ ⊆ ℝ`, the coefficient of `exp(π i τ)` in `Θ_ℤ(τ)²` is `2 · 1 + 1 · 2 = 4`, the
  number of vectors of norm `1` in `ℤ ⊕ ℤ`. Were `E × F` given the sup norm, the four vectors
  `(±1, ±1)` would also have norm `1`, the count would be `8`, and the product formula would fail:
  the orthogonal sum must carry the `L²` norm.
- For `L = M = E₈`, the coefficient of `q` in `Θ_{E₈}² = E₄²` is `2 · 240 = 480`, the number of
  vectors of norm `2` in `E₈ ⊕ E₈`, in agreement with `r_L(2m) = 480 σ₇(m)` at `m = 1` for every even
  unimodular lattice of rank `16` (Tau Ceti
  `ZLattice.IsEven.representationNumber_two_mul_of_finrank_eq_sixteen`).

### Examples

- `ℤ ⊕ ℤ` is isometric to `ℤ²`, and the product formula gives `Θ_{ℤ²} = jacobiTheta²`, matching Tau
  Ceti's `ZLattice.thetaSeries_span_orthonormalBasis`.
- `√2 ℤ ⊕ √2 ℤ = √2 ℤ²` has `Θ(τ) = jacobiTheta(2τ)²`, from Tau Ceti's
  `ZLattice.thetaSeries_sqrt_two_smul_span_one`.

### Dependencies

Tau Ceti: the real lattice model, orthogonal sums and the theta series with their summability.
No other layer of this roadmap.

## Layer 5: level one — even unimodular lattices

### 5.3 The basic API of the bundled form

Let `L` be even and unimodular of rank `2k`, and let `ZLattice.thetaForm hL hU hk`, a modular form of
weight `k` for `SL(2, ℤ)`, be its bundled theta series, whose coercion is `Θ_L`
(`ZLattice.coe_thetaForm`). Prove that for `M ⊆ F` even and unimodular of rank `2l`, the bundled
form of `L ⊕ M` (even and unimodular of rank `2(k + l)`) is the product, by `ModularForm.mul`, of
the bundled forms of `L` and `M`, as modular forms of weight `k + l` (Serre, Ch. VII §6).

The rest of the API that the identifications of Layer 8 consume is Tau Ceti's statements about
`Θ_L` read through `ZLattice.coe_thetaForm`: the `m`-th coefficient of `qExpansion 1` of the bundled
form is `r_L(2m)` for every `m ≥ 0` (`ZLattice.IsEven.qExpansion_thetaSeries_coeff`), so its
constant coefficient is `r_L(0) = 1` (`ZLattice.representationNumber_zero`) and it is not zero; and
for `e : F ≃ₗᵢ[ℝ] E` the bundled form of the pulled-back lattice is that of `L`
(`ZLattice.thetaSeries_comap`).

*Needs:* §3.4; Tau Ceti `ZLattice.thetaForm`, `ZLattice.coe_thetaForm`,
`ZLattice.isEven_orthSum_iff`, `ZLattice.isUnimodular_orthSum_iff`; Mathlib `ModularForm.mul`.

**Checks.**
- For `E₈ ⊕ E₈`, the product of two copies of the bundled form of `E₈`, which is `E₄`, is `E₄ · E₄`
  in weight `8`; its coefficient of `q` is `480 = r_{E₈⊕E₈}(2)`. Adding ranks instead of weights
  would put the product in weight `16`, where `E₄²` does not live.
- The constant coefficient of the bundled form is `r_L(0) = 1`; so it is not zero, and it is not a
  cusp form. In rank zero the bundled form is the constant `1` of weight `0`.

### Examples

- For `E₈` (real model of Tau Ceti's `typeE₈RootLattice`), the coefficients are `1, 240, 2160,
  6720, …`, those of `E₄`.

### Dependencies

§3.4. Tau Ceti: the level-one theta form and the `q`-expansion of `Θ_L`. Mathlib: products of
modular forms and `q`-expansions.

## Layer 6: Gauss sums of a lattice

The arithmetic input to the general-level theorem, isolated so that Layer 7 is an assembly.
Throughout, `L` is even of rank `n = 2k`, `N` is its level and `D_L = (-1)^k det L`. The route of
record is analytic: the one identity that needs analysis is the reciprocity law, proved from the
inversion law by the asymptotics of theta series; everything else is finite algebra at an odd
modulus. Nothing here classifies finite quadratic modules or uses Jordan splittings.

### 6.2 Reciprocity

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

- *The direct side.* Splitting `L` into its classes `y + cL`, the limit is
  `G_L(a, c) / (c^{2k} covol L)` (Tau Ceti `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT`,
  through `ZLattice.IsEven.thetaSeries_vadd_eq_sum`).
- *The other side.* Put `z = a/c + it` and apply the scalar inversion law in the form
  `Θ_L(z) = (covol L)⁻¹ (-i)^k (-1/z)^k Θ_{L^∨}(-1/z)`. As `t → 0⁺`,
  `-1/z = (-ca + i c² t)/(a² + c² t²) → -c/a`; write `-1/z = -c/a + ε` with
  `ε = c³t²/(a(a² + c²t²)) + i c²t/(a² + c²t²)`, so `ε → 0` with `Im(-1/ε) ~ a²/(c² t) → ∞`. Split
  `L^∨` into its classes `y + aL`: since `L` is even and `⟪y, ℓ⟫ ∈ ℤ`,
  `exp(π i ‖y + aℓ‖² (-c/a)) = e(-c ‖y‖²/(2a))`, so
  `Θ_{L^∨}(-c/a + ε) = ∑_{y ∈ L^∨/aL} e(-c ‖y‖²/(2a)) θ^{(aL)}_y(ε)`, where `θ^{(aL)}_y` is the
  coset series of the lattice `aL`. The asymptotic at the cusp `0`,
  `ε^k θ_{v + aL}(ε) → i^k (covol aL)⁻¹ = i^k a^{-2k} (covol L)⁻¹` along any path with
  `Im(-1/ε) → ∞` (Tau Ceti `ZLattice.tendsto_pow_mul_thetaCoset_comap_S`; ⚠ the real part of `ε`
  varies, so this is the form for complex `ε`), applies along this path. Multiplying by `t^k` and
  passing to the limit, with `(-1/z)^k → (-c/a)^k` and `t^k ε^{-k} → (a²/(i c²))^k`, gives the
  displayed identity after `(covol L)⁻¹ = (det L)^{-1/2}` and `i^k = e(n/8)`.

⚠ The inversion law is the only transformation used; there is no "matrix carrying `∞` to `a/c`"
before Layer 7, and none is needed. This asymptotic argument is the only analytic input to Layers 6
and 7.

*Needs:* Tau Ceti `ZLattice.gaussSum`, `ZLattice.dualGaussSum`, `ZLattice.thetaSeries_S_smul`,
`ZLattice.thetaCoset_S_smul`, `ZLattice.tendsto_pow_mul_thetaCoset_comap_S`,
`ZLattice.IsEven.thetaSeries_vadd_eq_sum`, `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT`,
`ZLattice.covolume_smul`, `ZLattice.IsIntegral.inv_covolume_eq_inv_sqrt_card_discriminantGroup`,
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

### 6.3 Milgram's formula

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
either being derived from the other. Two corollaries follow, whose statements are Tau Ceti's
(*Scope and ownership*): an even unimodular lattice has rank divisible by `8` (`|L^∨/L| = 1` forces
`e(n/8) = 1` for even `n`; for odd `n`, apply the formula to `L ⊕ L`, of rank `2n`, to get `4 ∣ n`),
which is a second proof beside the elementary one by the `S`- and `T`-laws, and both are wanted; and
`k` is even whenever `N ∣ 2`, since then every `e(q_L(γ))` is `±1` while `|L^∨/L|^{1/2} i^k` is real
only for even `k`. The latter is what lets `−I`, which lies in `Γ(N)` exactly when `N ∣ 2`, act
trivially on the coset series in §7.5.

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

### 6.5 The closed form

For `a` odd and positive, `c` positive and prime to `a`, and `N ∣ c`, prove

```text
G_L(a, c) = c^k * (det L)^{1/2} * e(n/8) * (D_L / a),
```

with `(D_L / a)` the Jacobi symbol. In Lean this is `gaussSum_eq_sqrt_card_mul_jacobiSym` (Ogg,
Ch. VI; Iwaniec, Ch. 10; Ebeling, Ch. 3). *Route:* §6.2, with the dual-side sum evaluated at the odd
modulus `a` as `det L · (D_L / a) · a^k` (Tau Ceti `ZLattice.IsEven.dualGaussSum_eq_jacobiSym`, with
`t = -c` a multiple of the level prime to `a`). ⚠ Coprimality of `a` with `N` alone is not enough:
the hypothesis `gcd(a, c) = 1` is what makes `c/N` a unit modulo `a`.

*Needs:* §6.2; Tau Ceti `ZLattice.IsEven.dualGaussSum_eq_jacobiSym`; Mathlib `jacobiSym`.

**Checks.**
- `√2 ℤ²` (`N = 4`, `D_L = -4`): `G(1, 4) = (∑_{u mod 4} e(u²/4))² = (2 + 2i)² = 8i = 4 · 2 · i · 1`,
  and `G(3, 4) = (2 - 2i)² = -8i = 4 · 2 · i · (-4/3)`, with `(-4/3) = -1`.
- `√2 ℤ²`, `a = 1`, `c = 2`, where `N ∤ c`: `G(1, 2) = 0`, while the formula would give `4i`.
- `√2 ℤ²`, `a = 3`, `c = 12`, where `N ∣ c` but `gcd(a, c) = 3`: `G(3, 12) = (3(2 + 2i))² = 72i`,
  while the formula would give `12 · 2 · i · (-1) = -24i`.

### 6.6 The conductor theorem and the nebentypus

Prove that the conductor of the Kronecker character `(D_L / ·)` of modulus `|D_L|` divides `N`; in
Lean this is `conductor_kroneckerChar_dvd_level` (Ebeling, Ch. 3). *Route:* by Tau Ceti's
`TauCeti.conductor_kroneckerChar_dvd_iff`, it suffices that `(D_L / a) = 1` for every odd `a` prime
to `D_L` with `a ≡ 1 (mod N)`. Such an `a` is prime to `N`, so §6.5 at `c = N` gives
`G_L(a, N) = N^k (det L)^{1/2} i^k (D_L / a)`, while `G_L(a, N) = G_L(1, N)` because the Gauss sum
depends on `a` only modulo `N` (`ZLattice.gaussSum_eq_of_modEq`) and `G_L(1, N)` is the same
expression with `(D_L / 1) = 1`. ⚠ The descent to the level is a statement about unit groups:
`|D_L|` need not divide `N` (for `D₄`, `|D_L| = 4` and `N = 2`), so `(D_L / ·)` is not a character
modulo `N` until its conductor is known to divide `N`, and the kernel that matters is that of the
reduction of units; Tau Ceti's criterion
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

*Needs:* §6.5; Tau Ceti `TauCeti.kroneckerChar`, `TauCeti.conductor_kroneckerChar_dvd_iff`,
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
- The off-hypothesis evaluations of §6.5 at `√2 ℤ²` record why each hypothesis is there.

### Dependencies

Layer 6 rests on Tau Ceti's Gauss sums, inversion law and asymptotics (*Exact supplier contracts*)
and on no earlier layer of this roadmap; within it, §6.3 and §6.5 rest on §6.2, and §6.6 on §6.5.

## Layer 7: general level — the Hecke–Schoeneberg theorem

The route of record is Schoeneberg's coset splitting (Schoeneberg, Ch. IX): it needs no group
presentation and no representation, and it delivers the statement for the coset series by the same
computation. `L` is even of rank `2k` and level `N` throughout.

### 7.1 Reduction to `c > 0` and `a` odd and positive

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

### 7.3 The Hecke–Schoeneberg theorem

Prove that for every `A = !![a, b; c, d] ∈ Γ₀(N)`,

```text
Θ_L ∣[k] A = χ_L(d) * Θ_L,
```

with `χ_L` the nebentypus of §6.6. In Lean this is `thetaSeries_slash_of_mem_Gamma0` (Schoeneberg,
Ch. IX; Ebeling, Ch. 3; Ogg, Ch. VI). *Route:* by §7.1 reduce to `c > 0` and `a` odd and positive:
`T^j` acts trivially on `Θ_L` (Tau Ceti `ZLattice.IsEven.thetaSeries_slash_T`), and `εI` acts by
`ε^k = χ_L(ε)` (the parity of §6.6), which also settles `c = 0` together with `T^{εb}`. For `c > 0`
and `N ∣ c`, Tau Ceti's coset splitting gives
`Θ_L ∣[k] A = (-i)^k c^{-k} (covol L)⁻¹ G_L(a, c) Θ_L`
(`ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul`), and §6.5 turns the constant into
`(D_L / a) = χ_L(a) = χ_L(d)`, since `ad ≡ 1 (mod N)` and `χ_L` is quadratic. The level-one theorem is
the case `N = 1`.

*Needs:* §6.5, §6.6, §7.1; Tau Ceti `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul`,
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

### 7.4 The theta series as a modular form with character

Prove that `Θ_L` is the underlying function of a modular form of weight `k` on `Γ₁(N)` lying in
`modFormCharSpace k (MulChar.toUnitHom χ_L)`; in Lean this is
`exists_modularForm_coe_eq_thetaSeries` (Ebeling, Ch. 3; Miyake, §4.9). Define the bundled form
itself, the theta form of level `N`, with coercion `Θ_L`: holomorphy is
`ZLattice.mdifferentiable_thetaSeries`, boundedness at every cusp is
`ZLattice.IsEven.isBoundedAt_thetaSeries` (each slash of `Θ_L` is a finite combination of coset
series, each with a `q_N`-expansion in nonnegative exponents), and invariance under `Γ₁(N)` is §7.3
with `χ_L(d) = 1` for `d ≡ 1 (mod N)`. Prove that the `Γ₀(N)` spelling of §7.3 and the
character-space spelling are equivalent through `mem_modFormCharSpace_iff_nebentypus`, and that for
`N = 1` the theta form of level `1` is `ZLattice.thetaForm` read on `Γ₁(1)`.

*Needs:* §7.3; Tau Ceti `ZLattice.mdifferentiable_thetaSeries`,
`ZLattice.IsEven.isBoundedAt_thetaSeries`, `modFormCharSpace`,
`mem_modFormCharSpace_iff_nebentypus`, `ZLattice.thetaForm`; Mathlib `ModularForm`.

**Checks.**
- `A₂`: the diamond operator `⟨2⟩` acts on the theta form of level `3` by `χ_{A₂}(2) = -1`, and the
  parity `χ(-1) = (-1)^k` that a nonzero form of weight `1` requires (Tau Ceti
  `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`) holds for `(-3 / ·)`; it would fail for the
  unsigned `(3 / ·)`.
- `E₈`: `N = 1`, the character is trivial, and the theta form of level `1` is `E₄`.

### 7.5 The coset series on `Γ(N)`

Prove that for every `γ ∈ L^∨` and every `A ∈ Γ(N)`, `θ_{γ+L} ∣[k] A = θ_{γ+L}`, and that each
`θ_{γ+L}` is the underlying function of a modular form of weight `k` on `Γ(N)`; in Lean these are
`thetaCoset_slash_of_mem_Gamma` and `exists_modularForm_coe_eq_thetaCoset` (Schoeneberg, Ch. IX;
Ebeling, Ch. 3). *Route:* the `Γ(N)` reduction of §7.1, with `T^{jN}` fixing every coset series by the
period-`N` law (Tau Ceti `ZLattice.IsEven.thetaCoset_slash_T_zpow_eq_self`). If `c = 0`, `T^{εb}`
fixes `θ_γ` and `εI` acts by `ε^k`, where `ε = -1` occurs only for `N ∣ 2`, and then `k` is even
(Tau Ceti `ZLattice.IsEven.even_of_level_dvd_two`). ⚠ That corollary of Milgram's formula is
load-bearing: `−I` acts in weight `k` by `(-1)^k`, so for `N ∣ 2` the claim `θ_γ ∣[k] (−I) = θ_γ` is
the evenness of `k`, and nothing in the splitting supplies it. With `c > 0` and `a` odd and positive,
split the coset `γ + L` modulo `cL` and apply the inversion law at the translates, as in Tau Ceti's
coset splitting of `Θ_L`; the coefficients are the Gauss sums over translates
`ZLattice.cosetGaussSum`, which vanish unless `aγ + m ∈ L` (`ZLattice.cosetGaussSum_eq_zero`). For
`A ∈ Γ(N)`, `a ≡ 1 (mod N)` and `Nγ ∈ L` make the surviving class that of `-γ`, so `θ_γ ∣[k] A` is a
multiple of `θ_{-γ} = θ_γ`; completing the square (`ZLattice.cosetGaussSum_eq_of_mem`) and §6.5 show
that the multiple is `1`. Boundedness at every cusp is `ZLattice.IsEven.isBoundedAt_thetaCoset`. This
is the statement that a route through the Weil representation would deliver as its
congruence-kernel theorem; here it is the coset version of §7.3.

*Needs:* §6.5, §7.1; Tau Ceti `ZLattice.cosetGaussSum`, `ZLattice.cosetGaussSum_eq_zero`,
`ZLattice.cosetGaussSum_eq_of_mem`, `ZLattice.thetaCoset_S_smul`, `ZLattice.thetaCoset_neg`,
`ZLattice.IsEven.thetaCoset_slash_T_zpow_eq_self`, `ZLattice.IsEven.even_of_level_dvd_two`,
`ZLattice.IsEven.isBoundedAt_thetaCoset`, `ZLattice.mdifferentiable_thetaCoset`; Mathlib
`ModularForm.slash_neg_one`, `CongruenceSubgroup.Gamma`.

**Checks.**
- `A₂` (`N = 3`) and `γ` of order `3` in `L^∨/L`: `θ_γ(τ + 1) = e(1/3) θ_γ(τ)` (Tau Ceti
  `ZLattice.IsEven.thetaCoset_one_vadd`), so `θ_γ` is not invariant under `T ∈ Γ₁(3)`; `T³ ∈ Γ(3)`
  fixes it, and so do `!![1, 0; 3, 1]` and `!![-2, -3; 3, 4]`. A version of the theorem on `Γ₁(N)`
  would be false.
- `D₄` (`N = 2`, `k = 2`): `−I ∈ Γ(2)` acts trivially, as it must.
- `√2 ℤ²` (`N = 4`, `k = 1`): `−I ∉ Γ(4)`; on `Γ(2)`, `−I` would act on `θ_γ` by `-1`.

### 7.6 Consequences

Prove that the theta form of level `N` of §7.4 is not a cusp form, its value at `i∞` being `1`
(Tau Ceti `ZLattice.valueAtInfty_thetaSeries`), and that every diamond operator `⟨d⟩` acts on it by
`χ_L(d)` (`diamondOp_apply_of_mem_modFormCharSpace` applied to §7.4).

*Needs:* §7.4; Tau Ceti `ZLattice.valueAtInfty_thetaSeries`,
`diamondOp_apply_of_mem_modFormCharSpace`; for the Checks, `ZLattice.valueAtInfty_thetaCoset`.

**Checks.**
- For `γ ∉ L` the coset series `θ_{γ+L}` vanishes at `i∞` (Tau Ceti `ZLattice.valueAtInfty_thetaCoset`),
  while `Θ_L = θ_{0+L}` has value `r_L(0) = 1` there: the statement is about the class of `0`, and it
  would be false for the other coset series.
- For `A₂`, `⟨2⟩` acts on the theta form of level `3` by `χ_{A₂}(2) = -1`; for `D₄` every `⟨d⟩` acts
  trivially, so its theta form of level `2` lies in the trivial-character space, the forms on `Γ₀(2)`.

### Examples

- `Θ_{A₂} ∈ M₁(Γ₀(3), (-3/·))`, `Θ_{D₄} ∈ M₂(Γ₀(2))` with trivial character, and
  `Θ_{√2ℤ²} ∈ M₁(Γ₀(4), (-4/·))`, with the level, determinant and character computed from the
  lattice (Tau Ceti `TauCeti.IntegralLattice.level_realModel_typeARootLattice_two` and its companions)
  rather than quoted.

### Dependencies

Layer 6 (§§6.5, 6.6). Tau Ceti: the coset splitting, the translation law, boundedness at the cusps,
the Gauss sums over translates, the character spaces. Mathlib: the modular group, its congruence
subgroups and the slash action.

## Layer 8: identification of the classical theta series

### 8.6 The root lattices `A₂` and `D₄`

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

- `E₈`, the real model of Tau Ceti's `typeE₈RootLattice` (even and unimodular through
  `TauCeti.IntegralLattice.isEven_realModel_iff` and `TauCeti.IntegralLattice.isUnimodular_realModel_iff`):
  `Θ_{E₈} = E₄` by `ZLattice.IsEven.thetaSeries_eq_E₄`, so `r_{E₈}(2m) = 240 σ₃(m)` for `m ≥ 1`; the
  kissing number `240` is an output, not an input.
- The Leech lattice `Λ`, the real model of Tau Ceti's `TauCeti.leechLattice`:
  `Θ_Λ = E₄³ - 720 Δ = E₁₂ - (65520/691) Δ` and `r_Λ(2m) = (65520/691)(σ₁₁(m) - τ(m))` with `τ` the
  Ramanujan function; the kissing number `r_Λ(4) = 196560` is an output and appears in no hypothesis.
- `E₈ ⊕ E₈` and `D₁₆⁺` both have theta series `E₄²` and are not isometric: the theta series does not
  determine the lattice. Equality of theta series is a statement about rank-16 even unimodular
  lattices and says nothing about isometry; the non-isometry is the rational lattices', and a count
  of norm-`2` vectors separates nothing (both have `480`).

### Dependencies

Layer 7. Tau Ceti: the root lattices and their real models, the weight-one Eisenstein series with
character, the corrected weight-two series, the Sturm bound. ModularForms §0.1 for the normalised
weight-one series, where it is used.

## Worked examples

Each is the general theorem instantiated, with every hypothesis discharged from the lattice's own
construction; entering a `q`-expansion by hand discharges nothing.

- **Convention checks.** `Θ_ℤ = jacobiTheta` (Tau Ceti `ZLattice.thetaSeries_span_one`), so the
  exponent and norm conventions are the standard ones; `Θ_{ℤ²}(-1/τ) = (τ/i) Θ_{ℤ²}(τ)`, the square of
  Mathlib's `jacobiTheta_S_smul` (`jacobiTheta_S_smul_sq`); and `Θ_{ℤ²} ∣[1] S² = -Θ_{ℤ²}`: the inversion
  law applied twice gives `(-i)^{2k} = (-1)^k`, which is the action of `S² = −I` in weight `k`, not
  `1`.
- **Consistency of the inversion laws.** The vector-valued inversion law at `γ = 0`, summed against
  the trivial character, returns `Θ_{L^∨} = ∑_{γ ∈ L^∨/L} θ_{γ+L}` for integral `L`.
- **Gauss sums.** The square of the Landsberg–Schaar identity as the case `L = √2 ℤ²` of §6.2, and
  `∑_{γ ∈ ℤ/3} e(γ²/3) = i√3` as Milgram's formula for `A₂` (§6.3).
- **Level one.** `Θ_{E₈} = E₄`, `r_{E₈}(2) = 240`, `r_{E₈}(2m) = 240 σ₃(m)`; the Leech identities;
  `Θ_{E₈⊕E₈} = Θ_{D₁₆⁺} = E₄²` (Layer 8, Examples).
- **General level.** `Θ_{A₂} ∈ M₁(Γ₀(3), (-3/·))` and `Θ_{D₄} ∈ M₂(Γ₀(2))`, and their identification
  with Eisenstein series (§8.6). Weight `1` at `A₂` is admissible because nothing here needs a
  dimension formula to state modularity.
- **Through the comparison of the two models.** For the real model of the rank-one lattice `⟨2m⟩`
  (squared norm `2m` on a generator `x`), `L^∨/L` is cyclic of order `2m`, generated by the class of
  `x/(2m)`, with `q_L = 1/(4m) mod 1`, the value of Tau Ceti's
  `TauCeti.IntegralLattice.discriminantQuadraticMap_rankOneClass` read through the comparison; for
  the real model of `A_n`, `L^∨/L` is cyclic of order `n + 1`, generated by the class of the first
  fundamental weight, with `q_L = n/(2(n + 1))`, the value of
  `TauCeti.IntegralLattice.discriminantQuadraticMap_typeAFundamentalWeightClass`. For `A₂` the level
  is `3`, the determinant `3` and `D = -3`; for `D₄`, `2`, `4` and `4`; for `√2 ℤ²`, `4`, `4` and
  `-4`; and `level(E₈) = 1`.
- **The Fricke involution.** The Fricke matrix `W_N = !![0, -1; N, 0]` (Tau Ceti's `TauCeti.frickeGL`)
  exchanges `Θ_L` and `Θ_{√N • L^∨}`; the raw operator `TauCeti.frickeOperator` squares to
  `TauCeti.frickeScalar N k = (-1)^k N^{k-2}` (`TauCeti.frickeOperator_frickeOperator_apply`), so the
  normalised operator `(√N)^{2-k} (· ∣[k] W_N)` squares to `(-1)^k`: it is an
  involution in even weight only, and even rank does not give even weight (`A₂` has `k = 1`). For
  `√2 • E₈` (`N = 2`), the Fricke partner `√2 • (√2 • E₈)^∨ = E₈` has level `1`: its level divides
  `N` and need not equal it.

**Boundary and off-hypothesis checks.** Each records an interface decision by the example that
forces it.

- The zero lattice in the zero-dimensional space: `Θ_0 = 1`, `det 0 = 1`, `level 0 = 1`, and every
  scaling fixes it, so it stays unimodular — which is why strict scaling statements carry
  `Nontrivial E`.
- `L = 2^{1/4} ℤ`: `L ∩ L^∨ = 0`, so `L^∨ ⧸ (L ∩ L^∨)` is infinite — which is why finiteness of the
  discriminant group and of `L^∨ ⧸ aL`, and `D_L ≠ 0`, carry integrality.
- `L = ½ ℤ`: `L^∨ = 2ℤ ⊂ L` and `Θ_{2ℤ}(i) ≠ Θ_{½ℤ}(i)` — which is why the dual decomposition carries
  integrality.
- `L = ℤ`, `a = c = 1`, `m = 0`; `L = √2 ℤ`, `m = 1/(2√2)`; `e(q_L)` on `ℤ`: the representatives of
  one class give `1` and `-1` — which is why evenness and `m ∈ L^∨` are arguments of the summands.
- `L = √2 ℤ²`, `a = 3`, `c = 12`: the dual-side sum `∑_{y ∈ L^∨/3L} e(-12 ‖y‖²/6)` has every summand
  `e(-(u² + v²)) = 1` on the `36` classes `y = (u, v)/√2`, `u, v mod 6`, so it is `36`, not
  `det L · (D_L/3) · 3 = -12` — which is why the evaluation at an odd modulus carries `gcd(a, c) = 1`.
- `L = √2 ℤ²`, `a = 1`, `c = 2`: `G_L(1, 2) = 0` and `Θ_L(1/2 + it) > 0` — which is why the
  asymptotic of §6.2 is additive.
- `L = ℤ²`: `Θ ∣[1] S² = -Θ` — the central element acts by `(-1)^k`.
- `L = √2 ℤ²`, `a = 3`, `c = 4`: the Gram matrix `2I` of `L` and the Gram matrix `-2I` of
  `-c ⟪·, ·⟫` on `L^∨` in the dual basis both have determinant `4`; their ratio `1` is a square
  modulo `3` while `-1` is not, so the sign `(-1)^k` in `(D_L / a)` does not come from comparing
  these determinants: it comes from the square `g_p² = (-1/p) p` of the rank-one Gauss sum.
- `!![-2, -3; 3, 4] ∈ Γ(3)` and `T³` times it — which is why §7.1 arranges the sign of `a` as well as
  its parity, by `T^{jN}` inside `Γ(N)`.
- `D₄`: level `2`, so `−I ∈ Γ(2)`, and weight `2`, so `−I` acts trivially — the instance of the
  corollary of §6.3 that §7.5 rests on.
- `√2 • E₈` has level `2` and `√2 • (√2 • E₈)^∨ = E₈` has level `1`.

## Downstream consumers

- [L-functions](../LFunctions/README.md) consumes lattice Poisson summation, its two summability
  halves, the Gaussian and its Fourier transform, the dual lattice, biduality and the covolume of the
  dual (former §§1.1, 1.5, 1.6, 2.1, 2.3), applied in a Euclidean model of its mixed space reached by
  a continuous real linear equivalence; these resolve to the Tau Ceti declarations in *Scope and
  ownership*.
- [Lattice packings and perfect forms](../LatticePackingsAndPerfectForms/README.md) consumes former
  Layer 1 (Poisson summation and dual covolumes, now Tau Ceti declarations listed in *Scope and
  ownership*) and Layer 7 (§7.3 with §7.4).
- [Quaternion arithmetic](../QuaternionArithmetic/README.md) consumes Layer 7.
- [Hypergeometric motives](../HypergeometricMotives/README.md) consumes the Kronecker symbol and
  character of former §2.8, Tau Ceti's `TauCeti.kroneckerSym` and `TauCeti.kroneckerChar`.
- [CFSG basic properties](../CFSGBasicProperties/README.md) cites the Leech identity of former §8.4,
  Tau Ceti's `TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant`.

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
the `ZLattice` predicates, with comparison lemmas so that its `E₈` and Leech facts can be consumed.

| Existing | Counterpart |
|---|---|
| `SpherePacking/Dim8/E8/Basic.lean`, `.../Packing.lean`: `Submodule.E8`, `E8Lattice`, `E8_integral`, `E8_integral_self`, `E8Matrix_unimodular` | a second model of `E₈`, beside the real model of Tau Ceti's `typeE₈RootLattice`; `covolume = 1 ↔ L = L^∨` for integral `L` and Mathlib's `ZLattice.covolume_eq_det` connect `E8Matrix_unimodular` to `ZLattice.IsUnimodular`; comparison lemmas only |
| `SpherePacking/Dim24/LeechLattice/*`: `LeechLattice`, `leech_covolume`, `leech_norm_lower_bound`, `IsZLattice` instance | a second model of the Leech lattice, beside the real model of Tau Ceti's `TauCeti.leechLattice` |
| `.../Uniqueness/LatticeInvariants.lean`: `EvenNormSq`, `Integral`, `Rootless`, `Unimodular`, `leech_evenNormSq`, `leech_rootless`, `leech_unimodular` | the `ZLattice` predicates, plus comparison lemmas |
| `SpherePacking/CohnElkies/PoissonSummation*`: `SchwartzMap.poissonSummation_lattice` | lattice Poisson summation in general dimension (former §1.1) |
| `.../Classify/EvenUnimodular/ThetaAnalytic.lean`, `ThetaSeries.lean`: `thetaSeries`, `thetaShell`, `thetaCoeff`, `summable_thetaTerm`, `thetaSeries_add_one_of_even` | the theta series, shells and translation law in general rank (former Layers 2 and 3, §4.1) |
| `.../Classify/EvenUnimodular/ThetaTransform.lean`: `thetaSeries_transform_S` | the inversion law in general rank, with the general-translate and vector-valued forms (former §§4.2–4.3) |
| `.../Classify/EvenUnimodular/{Discrete,FiniteShells,MinNorm,FundamentalDomain}.lean` | finiteness of shells in general rank (former §2.7) |

Nothing in the sphere-packing project states that a theta series is a modular form. The
discriminant-form vocabulary is Tau Ceti's, built to the
[completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md); the modular-form
vocabulary is the [modular-forms roadmap](../ModularForms/README.md)'s; and the rank-16 pair is the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)'s.

## Scope and ownership

**This roadmap owns** the discriminant group of an orthogonal sum on the real model (§2.9); the theta
series of an orthogonal sum (§3.4); the product formula for the level-one theta form (§5.3);
Gauss-sum reciprocity, Milgram's formula at positive definite signature by theta asymptotics, the
closed form of the Gauss sum, the conductor theorem and the nebentypus `χ_L` (§§6.2, 6.3, 6.5, 6.6);
the reductions of §7.1, the Hecke–Schoeneberg theorem, the theta series as a modular form with
character, the coset series on `Γ(N)` and their consequences (§§7.3–7.6); and the identification of
`Θ_{A₂}` and `Θ_{D₄}` (§8.6). This roadmap constructs no lattice, and states no Hecke theory,
dimension formula or newform theory of its own.

**Already in the library.** The other sections of this roadmap's numbering are proved in Tau Ceti at
the pin (paths under `TauCeti/`); citations of them resolve as follows. Former Lean names of this
roadmap are in italics.

| Former § | Content | Tau Ceti declarations |
|---|---|---|
| 1.1 | Poisson summation over a full lattice, its reflected form for every `f`, its minus-phase form for even `f` (*poissonSummation*, *poissonSummation_neg*, *poissonSummation_of_even*) | `SchwartzMap.tsum_eq_tsum_dual_fourier`, `SchwartzMap.tsum_eq_tsum_dual_fourier_neg`, `SchwartzMap.tsum_eq_tsum_dual_fourier_of_even` (`Analysis/Fourier/PoissonSummation.lean`) |
| 1.2 | Poisson summation over the lattice of an orthonormal basis (`ℤⁿ`), self-duality of that lattice, slices of Schwartz functions, absolute summability of lattice sums (*stdLattice*, *poissonSummation_stdLattice*, *dual_stdLattice*) | `SchwartzMap.tsum_eq_tsum_fourier_span_orthonormalBasis`, `ZLattice.dual_span_orthonormalBasis`, `SchwartzMap.sliceRightCLM`, `SchwartzMap.seminorm_sliceRightCLM_le`, `ZLattice.summable_norm_poisson_left`; the partial Fourier transforms are AnalyticNumberTheoryPartII §5.3g's (*Owned elsewhere*, below) |
| 1.3 | Fourier transform under a linear automorphism (*fourierIntegral_comp_equiv*) | `ContinuousLinearEquiv.fourier_comp` (`Analysis/Fourier/ChangeOfVariables.lean`) |
| 1.4 | dual lattice and covolume under a linear automorphism; every full lattice is the image of `ℤⁿ` with `|det A| = covol L` (*mapEquiv*, *dual_mapEquiv*, *covolume_mapEquiv*) | `ZLattice.dual_comap_continuousLinearEquiv`, `ZLattice.covolume_comap_continuousLinearEquiv`, `ZLattice.exists_comap_span_orthonormalBasis_eq` |
| 1.5 | summability of both sides (*summable_poisson_left*, *summable_poisson_right*) | `ZLattice.summable_poisson_left`, `ZLattice.summable_poisson_right` (`Analysis/Distribution/SchwartzSpace/ZLattice.lean`) |
| 1.6 | the Gaussian as a Schwartz function, its translates, its Fourier transform at every rank and at even rank (*gaussian*, *gaussian_apply*, *fourier_gaussian*, *fourier_gaussian_of_even*) | `TauCeti.gaussianSchwartzMap` (at `b = -π i τ`), `TauCeti.gaussianSchwartzMap_apply`, Mathlib's `SchwartzMap.compSubConstCLM`, `TauCeti.fourier_cexp_pi_mul_I_mul_norm_sq_mul`, `TauCeti.fourier_cexp_pi_mul_I_mul_norm_sq_mul_of_finrank_eq` |
| 2.1 | integral, even, unimodular; evenness implies integrality; integrality is `L ≤ L^∨`; `L^∨` is a full lattice; biduality; invariance under isometry and orthogonal sums (*dual*, *dual_dual*, *IsIntegral*, *IsEven*, *IsUnimodular*) | `ZLattice.dual`, `ZLattice.dual_dual`, `ZLattice.IsIntegral`, `ZLattice.IsEven`, `ZLattice.IsUnimodular`, `ZLattice.IsEven.isIntegral`, `ZLattice.isIntegral_iff_le_dual`, `ZLattice.isIntegral_iff`, `ZLattice.isEven_iff`, `ZLattice.isUnimodular_iff_eq_dual`, `ZLattice.isEven_comap_iff`, `ZLattice.isIntegral_comap_iff`, `ZLattice.isUnimodular_comap_iff`, `ZLattice.isIntegral_orthSum_iff`, `ZLattice.isEven_orthSum_iff`, `ZLattice.isUnimodular_orthSum_iff` |
| 2.2 | scaling: full rank, dual, covolume, determinant, `(-c) • L = c • L`, the integrality criterion, `√m`-scalings, non-unimodularity in positive rank (*scale* and its lemmas) | the instances on `c • L`, `ZLattice.dual_smul`, `ZLattice.covolume_smul`, `ZLattice.det_smul`, `Submodule.neg_smul_eq_smul`, `ZLattice.isIntegral_smul_iff`, `ZLattice.isEven_smul_iff`, `ZLattice.IsIntegral.sqrt_smul`, `ZLattice.IsEven.sqrt_smul`, `ZLattice.IsIntegral.isEven_sqrt_smul`, `ZLattice.det_sqrt_smul`, `ZLattice.IsIntegral.not_isUnimodular_sqrt_smul`, `ZLattice.IsIntegral.not_isUnimodular_smul`, `ZLattice.IsUnimodular.not_isUnimodular_smul` |
| 2.3 | covolume of the dual; `det L` a positive integer, the order of `L^∨/L`, the index `[L^∨ : L]`, the Gram determinant; the forms of unimodularity (*det*, *covolume_dual*, *discGroup*, *isUnimodular_iff_covolume_eq_one*) | `ZLattice.covolume_dual`, `ZLattice.det`, `ZLattice.det_def`, `ZLattice.DiscriminantGroup`, `ZLattice.IsIntegral.det_eq_card_discriminantGroup`, `ZLattice.IsIntegral.one_le_det`, `ZLattice.IsIntegral.finite_discriminantGroup`, `ZLattice.IsIntegral.det_eq_relIndex`, `ZLattice.det_eq_det_gram`, `ZLattice.IsIntegral.det_toMatrix_integralForm`, `ZLattice.IsIntegral.isUnimodular_iff_det_eq_one`, `ZLattice.IsIntegral.isUnimodular_iff_covolume_eq_one`, `ZLattice.IsIntegral.isUnimodular_iff_subsingleton_discriminantGroup` |
| 2.4 | the comparison with the rational model in both directions: rational model, positive definiteness, nondegeneracy, evenness and unimodularity, dual and discriminant group with pairing and quadratic form, determinant, rank, shells, level; real model, mutual inverses up to isometry, transfer of non-isometry (*ratModel*, *discGroupEquiv*, *RealSpace*, *realModel*, *nonempty_isometry_of_realModel*) | `ZLattice.ratModel`, `ZLattice.isPosDef_ratModel`, `ZLattice.instIsNondegenerateRatModel`, `ZLattice.isEven_ratModel_iff`, `ZLattice.isUnimodular_ratModel_iff`, `ZLattice.ratModelDualEquiv`, `ZLattice.ratModelDiscriminantGroupEquiv`, `ZLattice.discriminantPairing_ratModelDiscriminantGroupEquiv_mk_eq_coe_iff`, `ZLattice.discriminantQuadraticMap_ratModelDiscriminantGroupEquiv_mk_eq_coe_iff`, `ZLattice.determinant_ratModel`, `ZLattice.discriminant_ratModel`, `ZLattice.finrank_ratModel`, `ZLattice.level_ratModel`, `ZLattice.ncard_vectorsOfNorm_ratModel`; `TauCeti.IntegralLattice.realModel`, `TauCeti.IntegralLattice.RealModelSpace`, `TauCeti.IntegralLattice.isIntegral_realModel`, `TauCeti.IntegralLattice.isEven_realModel_iff`, `TauCeti.IntegralLattice.isUnimodular_realModel_iff`, `TauCeti.IntegralLattice.ratModelRealModelIsometry`, `ZLattice.realModelRatModelIsometry`, `TauCeti.IntegralLattice.Isometry.ofRealModel`, `TauCeti.IntegralLattice.map_realModel_ne_realModel`, `TauCeti.IntegralLattice.det_realModel`, `TauCeti.IntegralLattice.natCard_discriminantGroup_realModel`, `TauCeti.IntegralLattice.level_realModel`, `TauCeti.IntegralLattice.representationNumber_realModel` |
| 2.5 | the level: positivity, its three characterizations, `level = 1` iff unimodular, isometry, `lcm` on orthogonal sums, exponent and order of `L^∨/L`, `N L^∨ ⊆ L`, primes of `det L` (*level* and its lemmas) | `ZLattice.level`, `ZLattice.level_dvd_iff`, `ZLattice.IsIntegral.level_pos`, `ZLattice.level_ratModel`, `ZLattice.level_dvd_iff_gram`, `ZLattice.isLeast_level`, `ZLattice.IsEven.level_eq_one_iff`, `ZLattice.level_comap`, `ZLattice.level_orthSum`, `ZLattice.exponent_discriminantGroup_dvd_level`, `ZLattice.level_dvd_two_mul_card_discriminantGroup`, `ZLattice.level_nsmul_mem`, `ZLattice.card_discriminantGroup_dvd_level_pow`, `ZLattice.prime_dvd_level` |
| 2.6 | the Fricke partner `√N • L^∨`: even, determinant `N^n / det L`, level `N / gcd(N, c_L)` with `c_L` the content, the counterexample `√2 • E₈` | `ZLattice.isEven_sqrt_level_smul_dual`, `ZLattice.IsIntegral.det_sqrt_level_smul_dual`, `ZLattice.content`, `ZLattice.IsEven.level_sqrt_level_smul_dual`, `ZLattice.IsEven.level_sqrt_level_smul_dual_dvd`, `ZLattice.IsEven.level_sqrt_level_smul_dual_eq_level_iff`, `TauCeti.IntegralLattice.level_sqrt_level_smul_dual_sqrt_two_smul_realModel_typeE₈RootLattice` |
| 2.7 | shells and representation numbers, coset shells, finiteness, `r_L(0) = 1`, isometry, the polynomial bound, parity and support conditions, the convolution identities, agreement with `vectorsOfNorm` (*shell*, *repNum*, *cosetShell*, *cosetRepNum*) | `ZLattice.shell`, `ZLattice.representationNumber`, `ZLattice.cosetShell`, `ZLattice.cosetRepresentationNumber`, `ZLattice.finite_shell`, `ZLattice.finite_cosetShell`, `ZLattice.representationNumber_zero`, `ZLattice.representationNumber_comap`, `ZLattice.representationNumber_isBigO`, `ZLattice.IsEven.shell_eq_empty`, `ZLattice.IsIntegral.shell_eq_empty`, `ZLattice.IsEven.cosetShell_eq_empty`, `ZLattice.IsEven.cosetRepresentationNumber_div_eq_zero_of_not_modEq`, `ZLattice.IsEven.representationNumber_orthSum`, `ZLattice.representationNumber_orthSum`, `ZLattice.representedNormsLE`, `ZLattice.shell_eq_image_vectorsOfNorm_ratModel` |
| 2.8 | the Kronecker symbol and character; `D_L ≡ 0, 1 (mod 4)` (*kroneckerSym*, *kroneckerChar*, *signedDisc*) | `TauCeti.kroneckerSym` with `TauCeti.kroneckerSym_eq_jacobiSym`, `TauCeti.kroneckerSym_eq_legendreSym`, `TauCeti.kroneckerSym_two_right`, `TauCeti.kroneckerSym_neg_one_right`, `TauCeti.kroneckerSym_zero_right`, `TauCeti.kroneckerSym_mul_right`, `TauCeti.kroneckerSym_mul_right_of_ne_neg_one`, `TauCeti.kroneckerSym_mod_right'`; `TauCeti.kroneckerChar` with `TauCeti.kroneckerChar_intCast`, `TauCeti.kroneckerChar_isQuadratic`, `TauCeti.kroneckerChar_neg_one`; `ZLattice.IsEven.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one`; odd representatives of unit classes (*exists_odd_natCast_eq_units*) `ZMod.exists_odd_unitOfCoprime_eq`, used by `DirichletCharacter.conductor_dvd_iff_forall_odd` |
| 3.1 | the theta series and coset series, summability with the explicit bound, local uniform convergence, holomorphy (*thetaSeries*, *thetaCoset*) | `ZLattice.thetaSeries`, `ZLattice.thetaCoset`, `ZLattice.summable_thetaSeries`, `ZLattice.summable_thetaCoset`, `Complex.norm_exp_pi_mul_I_mul_ofReal_mul`, `ZLattice.hasSumLocallyUniformly_thetaSeries`, `ZLattice.hasSumLocallyUniformly_thetaCoset`, `ZLattice.differentiableOn_thetaSeries`, `ZLattice.mdifferentiable_thetaSeries`, `ZLattice.mdifferentiable_thetaCoset` |
| 3.2 | descent to `L^∨/L`, `θ_{0+L} = Θ_L`, `θ_{-γ} = θ_γ`, the dual decomposition for integral `L` (*thetaCosetClass*, *thetaSeries_dual_eq_sum*) | `ZLattice.thetaCoset_add_mem`, `ZLattice.thetaCoset_eq_of_sub_mem`, `ZLattice.thetaCosetClass`, `ZLattice.thetaCosetClass_mk`, `ZLattice.thetaCosetClass_zero`, `ZLattice.thetaCoset_neg`, `ZLattice.thetaCosetClass_neg`, `ZLattice.IsIntegral.thetaSeries_dual_eq_sum` |
| 3.3 | `q`- and `q_N`-expansions, period `2` for integral `L`, support of the coset coefficients, boundedness at `i∞`, constant term `1`, positivity on the imaginary axis (*hasSum_thetaSeries*, *hasSum_thetaCoset*, *qExpansion_thetaSeries_coeff*) | `ZLattice.IsEven.hasSum_thetaSeries_qParam`, `ZLattice.IsEven.qExpansion_thetaSeries_coeff`, `ZLattice.IsIntegral.hasSum_thetaSeries_qParam_two`, `ZLattice.IsIntegral.qExpansion_two_thetaSeries_coeff`, `ZLattice.IsEven.hasSum_thetaCoset_qParam`, `ZLattice.IsEven.qExpansion_thetaCoset_coeff`, `ZLattice.IsEven.qExpansion_thetaCoset_coeff_eq_zero`, `ZLattice.isBoundedAtImInfty_thetaSeries`, `ZLattice.isBoundedAtImInfty_thetaCoset`, `ZLattice.IsEven.qExpansion_thetaSeries_coeff_zero`, `ZLattice.one_le_re_thetaSeries`, `ZLattice.re_thetaCoset_pos` |
| 3.4, in part | invariance under isometry and scaling (*thetaSeries_scale*) | `ZLattice.thetaSeries_comap`, `ZLattice.thetaCoset_comap`, `ZLattice.thetaSeries_smul`, `ZLattice.thetaCoset_smul`; orthogonal sums are §3.4 above |
| 3.5 | the rank-one comparison with `jacobiTheta` and `q`-expansions; rank `n` (*thetaSeries_int*, *thetaSeries_stdLattice*) | `ZLattice.thetaSeries_span_one`, `ZLattice.thetaSeries_sqrt_two_smul_span_one`, `ZLattice.qExpansion_two_thetaSeries_span_one_coeff`, `ZLattice.hasSum_thetaSeries_span_one_qParam`, `ZLattice.thetaSeries_span_orthonormalBasis` |
| 4.1 | translation: `θ_γ(τ + 1) = e(q_L(γ)) θ_γ(τ)` for even `L`, period `1` of `Θ_L`, period `2` for integral `L`, invariance of the coset series under `T^N` | `ZLattice.IsEven.thetaCoset_one_vadd`, `ZLattice.IsEven.thetaSeries_one_vadd`, `ZLattice.IsEven.thetaSeries_slash_T`, `ZLattice.IsIntegral.thetaSeries_two_vadd`, `ZLattice.IsEven.thetaCoset_slash_T_zpow_eq_self`, `ZLattice.IsEven.cexp_pi_mul_I_mul_norm_add_sq` |
| 4.2 | inversion, scalar form (*thetaSeries_neg_inv*) | `ZLattice.thetaSeries_S_smul`, `ZLattice.thetaSeries_slash_S` |
| 4.3 | inversion at a general translate and the vector-valued law; `(covol L)⁻¹ = (det L)^{-1/2} = |L^∨/L|^{-1/2}` (*thetaCoset_neg_inv*, *pairingChar*, *thetaCosetClass_neg_inv*) | `ZLattice.thetaCoset_S_smul`, `ZLattice.IsIntegral.thetaCoset_S_smul`, `ZLattice.IsIntegral.thetaCoset_slash_S`, `ZLattice.IsIntegral.discriminantPairingChar`, `ZLattice.inv_covolume_eq_inv_sqrt_det`, `ZLattice.IsIntegral.inv_covolume_eq_inv_sqrt_card_discriminantGroup`, and the interchangeability of `e(b_L(γ, δ))` and `e(-b_L(γ, δ))` in the law, `ZLattice.IsIntegral.sum_discriminantPairingChar_neg` |
| 4.4 | the double inversion `(-1)^k`, the rank-two comparison with `jacobiTheta_S_smul` | `ZLattice.thetaSeries_slash_S_slash_S`, `ZLattice.thetaSeries_span_orthonormalBasis_S_smul`, `jacobiTheta_S_smul_sq` |
| 5.1 | `8 ∣ n` for even unimodular `L` (*eight_dvd_finrank_of_even_unimodular*) | `ZLattice.IsEven.eight_dvd_finrank` |
| 5.2 | the level-one theorem and the bundled form (*thetaForm*, *coe_thetaForm*) | `ZLattice.thetaForm`, `ZLattice.coe_thetaForm`, `ZLattice.IsEven.thetaSeries_slash_S` |
| 5.4 | `Θ_L` a unique combination of `E₄^a Δ^b`, `4a + 12b = k`, with rational coefficients (*existsUnique_finsupp_thetaForm*) | `ZLattice.IsEven.existsUnique_finsupp_thetaSeries_eq_E₄_discriminant` |
| 6.1 | the Gauss sums and their elementary properties: isometry, orthogonal sums, dependence on `a` modulo `c`, `G_L(a, 1) = 1`, vanishing off `L` for `N ∣ c`, completing the square (*cSub*, *gaussTerm*, *gaussSum*, *gaussSumTwisted*, *gaussSum_one_one*, *gaussSum_add_two_mul*, *gaussSumTwisted_eq_zero*, *gaussSumTwisted_eq_of_mem*, *aSubDual*, *dualGaussTerm*) | `ZLattice.card_quotient_smul_submoduleOf` (`|L ⧸ cL| = c^n`), `ZLattice.gaussTerm`, `ZLattice.gaussSum`, `ZLattice.gaussSumTwisted`, `ZLattice.dualGaussTerm`, `ZLattice.dualGaussSum`, `ZLattice.gaussSum_comap`, `ZLattice.gaussSumTwisted_comap`, `ZLattice.gaussSum_orthSum`, `ZLattice.gaussSumTwisted_orthSum`, `ZLattice.gaussSum_eq_of_modEq`, `ZLattice.gaussSum_one`, `ZLattice.gaussSumTwisted_eq_zero`, `ZLattice.gaussSumTwisted_eq_of_mem` |
| 6.2, in part | the intermediate asymptotic at the cusp `0` and the direct side (*tendsto_pow_mul_thetaCoset*, *tendsto_pow_im_mul_thetaSeries*) | `ZLattice.tendsto_pow_mul_thetaCoset_comap_S`, `ZLattice.IsEven.thetaSeries_vadd_eq_sum`, `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_vadd_comap_S`, `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT`; reciprocity is §6.2 above |
| 6.3, in part | `8 ∣ n` from Milgram's formula, and `k` even when `N ∣ 2` (*eight_dvd_finrank_of_even_unimodular'*, *even_of_level_dvd_two*) | `ZLattice.IsEven.eight_dvd_finrank`, `ZLattice.IsEven.even_of_level_dvd_two`, `ZLattice.IsEven.four_dvd_finrank_of_level_dvd_two`; Milgram's formula is §6.3 above |
| 6.4 | evaluation of the dual-side sum at an odd modulus (*sum_dualGaussTerm_eq*) | `ZLattice.IsEven.dualGaussSum_eq_jacobiSym` |
| 7.2 | the coset splitting of `Θ_L(Aτ)` for `c > 0`, and its collapse for `N ∣ c` (*thetaSeries_smul_eq_tsum*) | `ZLattice.IsEven.thetaSeries_smul_eq_tsum_gaussSumTwisted`, `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul` |
| 7.4, in part | boundedness at every cusp | `ZLattice.IsEven.isBoundedAt_thetaSeries`, `ZLattice.IsEven.isBoundedAt_thetaCoset`, `ZLattice.IsEven.isBoundedAtImInfty_thetaCoset_slash` |
| 7.6, in part | the Fricke identities, raw and normalised by `(√N)^{2-k}` (*thetaSeries_slash_frickeGL*, *smul_thetaSeries_slash_frickeGL*); constant term `1` (*qExpansion_thetaFormOfLevel_coeff_zero*) | `ZLattice.thetaSeries_slash_frickeGL`, `ZLattice.atkinLehnerNormalizer_smul_thetaSeries_slash_frickeGL`, `ZLattice.thetaSeries_sqrt_smul_dual_slash_frickeGL` (for every `N > 0`, against `TauCeti.frickeGL`, with `TauCeti.atkinLehnerNormalizer N k = (√N)^{2-k}`), `ZLattice.IsEven.qExpansion_thetaSeries_coeff_zero` |
| 8.1 | even unimodular of rank `8` and `16`: `Θ_L = E₄` and `E₄²` (*thetaForm_eq_E₄*, *coe_thetaForm_rank_16*, *thetaForm_rank_16_eq*) | `ZLattice.IsEven.thetaForm_eq_E₄`, `ZLattice.IsEven.thetaSeries_eq_E₄`, `ZLattice.IsEven.thetaForm_eq_E₄_mul_E₄`, `ZLattice.IsEven.thetaSeries_eq_E₄_sq`, `ZLattice.IsEven.thetaForm_eq_E_eight` |
| 8.2 | `r_L(2m) = 240 σ₃(m)` in rank `8`, the kissing number `240`, `E₈` (*repNum_rank_eight*, *repNum_two_rank_eight*, *thetaForm_realModel_typeE₈RootLattice_eq_E₄*) | `ZLattice.IsEven.representationNumber_two_mul_of_finrank_eq_eight`, `ZLattice.IsEven.representationNumber_two_of_finrank_eq_eight`, with `TauCeti.IntegralLattice.typeE₈RootLattice` (Layer 8, Examples) |
| 8.3 | even unimodular of rank `24`: `Θ_L = E₄³ + (r_L(2) - 720) Δ` (*thetaForm_rank_24*) | `ZLattice.IsEven.thetaForm_eq_E₄_cube_add_smul_discriminant`, `ZLattice.IsEven.thetaSeries_eq_E₄_cube_add_mul_discriminant`, `ZLattice.IsEven.representationNumber_four_add_twenty_four_mul` |
| 8.4 | the Leech lattice: `Θ_Λ = E₄³ - 720 Δ = E₁₂ - (65520/691) Δ`, `r_Λ(2m)`, `r_Λ(4) = 196560` (*coe_thetaForm_rank_24_rootless*, *repNum_rank_24_rootless*, *repNum_four_rank_24_rootless*) | `TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E₄_cube_sub_mul_discriminant`, `TauCeti.IntegralLattice.thetaSeries_realModel_leechLattice_eq_E_twelve_sub_mul_discriminant`, `TauCeti.IntegralLattice.representationNumber_leechLattice_two_mul`, `ZLattice.IsEven.thetaSeries_eq_E_twelve_add_mul_discriminant`, `ZLattice.IsEven.representationNumber_two_mul_of_finrank_eq_twenty_four`, `ZLattice.IsEven.representationNumber_four_of_rootless` (rootless rank 24), on `TauCeti.leechLattice` |
| 8.5 | the rank-16 pair: `Θ_{E₈⊕E₈} = Θ_{D₁₆⁺} = E₄²`, not isometric; the theta series does not determine the lattice (*thetaSeries_realModel_eq_of_rank_sixteen*, *thetaSeries_realModel_eq_and_not_isometric*, *exists_thetaSeries_eq_not_isometric*) | `TauCeti.IntegralLattice.thetaSeries_realModel_eq_E₄_sq`, `TauCeti.IntegralLattice.thetaSeries_realModel_e8PowLattice_two`, `TauCeti.IntegralLattice.thetaSeries_realModel_checkerboardPlusLattice_sixteen`, `TauCeti.IntegralLattice.not_forall_exists_map_eq_of_thetaSeries_eq`, with the non-isometry `TauCeti.IntegralLattice.isEmpty_isometry_e8PowLattice_checkerboardPlusLattice` |

Former Lean names of the sections stated above: *thetaSeries_orthSum* is §3.4; *gaussSum_reciprocity*
is §6.2 (`gaussSum_eq_mul_dualGaussSum`); *milgram* is §6.3 (`sum_cexp_norm_sq_discriminantGroup`);
*gaussSum_eq* is §6.5 (`gaussSum_eq_sqrt_card_mul_jacobiSym`);
*conductor_kroneckerChar_signedDisc_dvd_level* is §6.6 (`conductor_kroneckerChar_dvd_level`);
*discChar* is the nebentypus `nebentypus` of §6.6; and *thetaFormOfLevel* with
*thetaFormOfLevel_mem_modFormCharSpace* is §7.4 (`exists_modularForm_coe_eq_thetaSeries`).

**Owned elsewhere.**

- *The arithmetic of the rational lattice*: the carrier `TauCeti.IntegralLattice` and its dual,
  discriminant group and discriminant forms, finite bilinear and quadratic modules, overlattices and
  isotropic subgroups, the rank-one and ADE lattices with `D₈⁺ ≅ E₈`, and the rationalization
  `TauCeti.IntegralLattice.ofIntegralForm` behind the rational model are Tau Ceti's, built to the
  [completed integral-lattices roadmap](../../Completed/IntegralLattices/README.md). Jordan
  splittings, the genus, the Gauss-sum invariant `sign q ∈ ℤ/8` of a finite quadratic module,
  Milgram's theorem at every signature, Nikulin's theory, the classification of unimodular lattices
  in low rank and the rank-16 pair `E₈ ⊕ E₈`, `D₁₆⁺` with its non-isometry are the
  [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md)'s. §6.3 is the
  positive definite instance of Milgram's theorem by theta asymptotics, kept because §§6.2–6.6 and
  §7.5 rest on its method and because it gives an independent route to `8 ∣ n`; it differs from that
  roadmap's statement in signature (positive definite only) and in route. That roadmap states no
  theta series and records the same boundary from its side (its Layer 8); the completed
  integral-lattices roadmap excludes theta series and modular forms from its scope.
- *Modular forms*: character spaces and their parity, diamond operators, the Fricke and Atkin–Lehner
  operators, the Sturm bound, the level-one graded ring, Eisenstein series with character, the
  corrected weight-two series and every dimension formula are the
  [modular-forms roadmap](../ModularForms/README.md)'s or Tau Ceti's; nothing here consumes a
  dimension formula. The weight-one and weight-two character Eisenstein series in their
  positive-coefficient normalisation are its §0.1.
- *The number-field theta function and its Mellin transform* (the Gaussian theta of an ideal lattice
  in the mixed space, its transformation with level and epsilon, the completed zeta and Hecke
  `L`-functions) are the [L-functions roadmap](../LFunctions/README.md)'s. A consumer whose model is
  not an inner product space — Mathlib's `NumberField.mixedEmbedding.mixedSpace` carries a product
  sup norm — applies lattice Poisson summation in a Euclidean model reached by a continuous real
  linear equivalence, carrying with it the quadratic form, the dual pairing, the normalization of the
  measure and the comparison of covolumes by the Jacobian. It is not a linear isometry: in `ℝ²` with
  the sup norm, `‖e₁ + e₂‖² + ‖e₁ - e₂‖² = 2 ≠ 4 = 2‖e₁‖² + 2‖e₂‖²` fails the parallelogram law. That
  transport is the consumer's.
- *Partial Fourier transforms*: for a finite-dimensional real space split into two orthogonal
  summands, the partial Fourier transform in one summand preserves Schwartz space, sends `f₁ ⊗ f₂`
  to `f₁ ⊗ f̂₂`, commutes with the partial transform in the other summand and composes with it to
  the full transform. These are
  [analytic number theory, Part II](../AnalyticNumberTheoryPartII/README.md) §5.3g's, stated there
  at every place of a number field for every nondegenerate pairing. At a real place, with the inner
  product as the pairing and `ψ_ℝ(x) = e(x)`, the self-dual measure is the Haar measure normalised
  by orthonormal bases and §5.3g's transform of `f` is `ξ ↦ 𝓕 f(-ξ)` in Mathlib's normalisation. No
  layer here uses them: Tau Ceti proves Poisson summation over a lattice from the Fourier series of
  the periodization on the torus and a linear change of variables.
- *Not targets of this roadmap*: the Weil representation of `SL(2, ℤ)` on `ℂ[L^∨/L]` and the
  presentation `SL(2, ℤ) ≅ ⟨S, T | S⁴ = 1, (ST)³ = S²⟩`, neither needed here (the vector-valued
  inversion law and §7.5 are proved directly; a development of the Weil representation needs the
  Gauss-sum invariant of a finite quadratic module for its `S`-matrix and the local formulas of
  Scheithauer and Strömberg, and would consume Layer 6); theta series with spherical coefficients,
  Siegel and Jacobi theta series, the Siegel–Weil formula, sphere packing, the classification or
  uniqueness of any lattice, and the construction of Niemeier lattices; half-integral weight.

## Exact supplier contracts

### From Mathlib

- `IsZLattice`, `ZLattice.covolume` with `ZLattice.covolume_eq_det`, `ZLattice.summable_norm_rpow`
  (`Mathlib/Algebra/Module/ZLattice/`): full lattices, their covolume and the decay estimates.
- `LinearMap.BilinForm.dualSubmodule` and `innerₗ`: the dual lattice of record.
- `SchwartzMap` with `SchwartzMap.compSubConstCLM` (translation), the Fourier transform `𝓕` on a
  finite-dimensional inner product space with kernel `e(-⟪x, ξ⟫)`, `fourier_gaussian_innerProductSpace`,
  `Real.tsum_eq_tsum_fourier` (Poisson summation on `ℝ`).
- `WithLp.prod_norm_sq_eq_of_L2` (`‖x‖² = ‖x.1‖² + ‖x.2‖²` on `WithLp 2 (E × F)`) and
  `tsum_mul_tsum_of_summable_norm`, for §3.4.
- Modular forms: `ModularForm`, `CuspForm`, `SlashAction` with the right-action law,
  `ModularForm.slash_neg_one` (`−I` acts by `(-1)^k`), `ModularForm.mul`, `ModularGroup.S`,
  `ModularGroup.T`, `CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0`,
  `CongruenceSubgroup.Gamma1`, `Matrix.SpecialLinearGroup.mapGL`, `UpperHalfPlane.qExpansion`;
  `ModularForm.E` with `ModularForm.E₄`, `ModularForm.E₆`, `CuspForm.discriminant` and
  `ModularForm.discriminant`; `jacobiTheta`, `jacobiTheta_S_smul`, `jacobiTheta_T_sq_smul`,
  `hasSum_nat_jacobiTheta`.
- Arithmetic: `jacobiSym` (for odd denominators), `legendreSym`, `gaussSum`, `gaussSum_sq`,
  `gaussSum_mul_gaussSum_eq_card`; `DirichletCharacter`, `DirichletCharacter.changeLevel`,
  `DirichletCharacter.FactorsThrough`, `DirichletCharacter.factorsThrough_iff_ker_unitsMap`,
  `DirichletCharacter.conductor`, `DirichletCharacter.mem_conductorSet_iff_conductor_dvd`,
  `DirichletCharacter.conductor_changeLevel`, `DirichletCharacter.primitiveCharacter`,
  `DirichletCharacter.conductor_dvd_level`, `ZMod.unitsMap`, `MulChar.toUnitHom`.

### From Tau Ceti

Paths are under `TauCeti/`. Every declaration below is proved at the pin; the table in *Scope and
ownership* lists the ones that carry former sections, with their statements.

- *The real lattice model* (`Algebra/Module/ZLattice/`): `ZLattice.dual` (`Dual.lean`; Mathlib's dual
  submodule for `innerₗ`, a full lattice when `L` is, with `ZLattice.dual_dual`);
  `ZLattice.IsIntegral`, `ZLattice.IsEven`, `ZLattice.IsUnimodular` (`Integral.lean`; Convention 3);
  `ZLattice.det`, `ZLattice.DiscriminantGroup` (`Determinant.lean`; Convention 5, with
  `ZLattice.IsIntegral.det_eq_card_discriminantGroup`, `ZLattice.IsIntegral.finite_discriminantGroup`,
  `ZLattice.IsIntegral.inv_covolume_eq_inv_sqrt_card_discriminantGroup`,
  `ZLattice.IsIntegral.card_quotient_smul_submoduleOf_dual` (`|L^∨ ⧸ cL| = c^n |L^∨/L|` for integral
  `L`) and `ZLattice.IsEven.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one` (for even `L`
  of rank `2k`, `(-1)^k |L^∨/L| ≡ 0, 1 (mod 4)`)); `ZLattice.level` (`Level.lean`; Convention 7, with
  `ZLattice.IsIntegral.level_pos` (`0 < N` for integral `L`), `ZLattice.level_nsmul_mem`,
  `ZLattice.card_discriminantGroup_dvd_level_pow` (`|L^∨/L| ∣ N^n`) and `ZLattice.prime_dvd_level`
  (every prime dividing `|L^∨/L|` divides `N`)); `ZLattice.orthSum`, `ZLattice.orthSumEquivProd`,
  `ZLattice.mem_orthSum` (`OrthSum.lean`; Convention 17); `ZLattice.representationNumber`
  (`Shell.lean`; the number of `v ∈ L` with `‖v‖² = t`, finite for a discrete `L`).
- *Comparison of the two models* (`Algebra/Module/ZLattice/RationalModel.lean`, `RealModel.lean`):
  `ZLattice.ratModel` (for integral `L`, a positive definite nondegenerate rational lattice whose
  dual, discriminant group, pairing and half-norm quadratic form are those of `L`) and
  `TauCeti.IntegralLattice.realModel` (for a positive definite rational lattice `M`, a full integral
  lattice in `M.RealModelSpace hM`, even or unimodular exactly when `M` is, with the same level and
  discriminant group), with the other declarations of row 2.4.
- *Theta series* (`NumberTheory/ModularForms/ThetaSeries/`): `ZLattice.thetaSeries`,
  `ZLattice.thetaCoset` (`Basic.lean`; Convention 9, summable and holomorphic on `ℍ` for a discrete
  `L` in a finite-dimensional `E`); `ZLattice.thetaSeries_S_smul`, `ZLattice.thetaCoset_S_smul`
  (`Inversion.lean`; for `L` of rank `2k` and `τ ∈ ℍ`,
  `Θ_L(-1/τ) = (covol L)⁻¹ (-i)^k τ^k Θ_{L^∨}(τ)`, and at a translate `v`,
  `θ_{v+L}(-1/τ) = (covol L)⁻¹ (-i)^k τ^k ∑_{m ∈ L^∨} e(⟪v, m⟫) exp(π i ‖m‖² τ)`);
  `ZLattice.IsEven.thetaSeries_slash_T`, `ZLattice.IsEven.thetaCoset_one_vadd`,
  `ZLattice.IsEven.thetaCoset_slash_T_zpow_eq_self` (`Translation.lean`; for even `L` and `γ ∈ L^∨`,
  `Θ_L ∣ T = Θ_L`, `θ_γ(τ + 1) = e(q_L(γ)) θ_γ(τ)`, and `θ_γ ∣ T^M = θ_γ` whenever `M ‖γ‖² ∈ 2ℤ`);
  `ZLattice.tendsto_pow_mul_thetaCoset_comap_S`, `ZLattice.IsEven.thetaSeries_vadd_eq_sum`,
  `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT` (`Asymptotics.lean`; for `L` of rank `2k`,
  `ε^k θ_{v+L}(ε) → i^k (covol L)⁻¹` as `Im(-1/ε) → ∞`; for even `L`, `a ∈ ℤ`, `c ≥ 1`,
  `t^k Θ_L(a/c + it) → G_L(a, c)/(c^{2k} covol L)` as `t → 0⁺`);
  `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul` (`CosetSplitting.lean`; for even `L` of rank
  `2k` and `A ∈ SL(2, ℤ)` with `A 1 0 = c > 0` and `N ∣ c`,
  `Θ_L ∣[k] A = (-i)^k c^{-k} (covol L)⁻¹ G_L(a, c) Θ_L`);
  `ZLattice.IsEven.isBoundedAt_thetaSeries`, `ZLattice.IsEven.isBoundedAt_thetaCoset`
  (`BoundedAtCusp.lean`; for even `L` of rank `2k` and `γ ∈ L^∨`, bounded in weight `k` at every
  cusp of `SL(2, ℤ)`); `ZLattice.valueAtInfty_thetaSeries` (`Cusp.lean`; the value at `i∞` is `1`);
  `ZLattice.thetaForm`, `ZLattice.coe_thetaForm` (`LevelOne.lean`; for even unimodular `L` of rank
  `2k`, a modular form of weight `k` for `SL(2, ℤ)` with coercion `Θ_L`);
  `ZLattice.IsEven.qExpansion_thetaSeries_coeff` (`QExpansion.lean`; for even `L`, the `m`-th
  coefficient of `qExpansion 1 Θ_L` is `r_L(2m)`).
- *Gauss sums* (`Algebra/Module/ZLattice/GaussSum.lean`, `CosetGaussSum.lean`): `ZLattice.gaussSum`,
  `ZLattice.gaussSumTwisted`, `ZLattice.dualGaussSum`, `ZLattice.gaussTerm`, `ZLattice.dualGaussTerm`
  (Convention 14); `ZLattice.gaussSum_eq_of_modEq` (`G_L(a, c)` depends on `a` modulo `c`);
  `ZLattice.gaussSum_one` (`G_L(a, 1) = 1`); `ZLattice.IsEven.dualGaussSum_eq_jacobiSym` (for even
  `L` of rank `2k`, odd `a`, and `t` a multiple of the level prime to `a`,
  `∑_{y ∈ L^∨/aL} e(t ‖y‖²/(2a)) = |L^∨/L| · ((-1)^k |L^∨/L| / a) · a^k`, Jacobi symbol);
  `ZLattice.cosetGaussSum`, `ZLattice.cosetGaussSum_eq_zero`, `ZLattice.cosetGaussSum_eq_of_mem`
  (for even `L`, `γ, m ∈ L^∨`: the sum of `e((a ‖γ + y‖²/2 + ⟪γ + y, m⟫)/c)` over `y ∈ L/cL`
  vanishes unless `aγ + m ∈ L` when `N ∣ c`, and otherwise is an explicit phase times `G_L(a, c)`
  when `ad ≡ 1 (mod c)`).
- *Milgram and parity* (`Algebra/Module/ZLattice/Milgram.lean`,
  `NumberTheory/ModularForms/ThetaSeries/LevelOne.lean`): `ZLattice.IsEven.even_of_level_dvd_two`
  (for even `L` of rank `2k` and level dividing `2`, `k` is even);
  `ZLattice.IsEven.eight_dvd_finrank`.
- *Kronecker symbol* (`NumberTheory/LegendreSymbol/KroneckerSymbol.lean`): `TauCeti.kroneckerSym`,
  `TauCeti.kroneckerSym_eq_jacobiSym` (agreement at odd positive denominators),
  `TauCeti.kroneckerChar` (for `D ≡ 0, 1 (mod 4)`, `D ≠ 0`, the character `(D / ·)` of modulus `|D|`
  with values in any commutative ring), `TauCeti.kroneckerChar_intCast`,
  `TauCeti.kroneckerChar_isQuadratic`, `TauCeti.kroneckerChar_neg_one` (value `sign D` at `-1`),
  `TauCeti.conductor_kroneckerChar_dvd_iff` (when `2 ≠ 0` in the coefficient ring, the conductor
  divides `N` exactly when `(D / a) = 1` for every odd natural `a` prime to `D` with `a ≡ 1 (mod N)`).
- *Modular forms* (`NumberTheory/ModularForms/`): `modFormCharSpace`,
  `mem_modFormCharSpace_iff_nebentypus`, `diamondOp_apply_of_mem_modFormCharSpace`
  (`DiamondOperators.lean`; Convention 13); `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`
  (`Parity.lean`; a nonzero character space of weight `k` has `χ(-1) = (-1)^k`);
  `ModularForm.eq_of_sturm_bound` (`SturmBound.lean`; two forms of weight `k` on a finite-index
  `Γ` agreeing in their coefficients up to `⌊k [SL₂(ℤ) : Γ] / 12⌋` are equal);
  `CongruenceSubgroup.Gamma0_prime_index` (`CongruenceSubgroups/Basic.lean`; index `p + 1`);
  `TauCeti.EisensteinSeries.charE1MF`, `TauCeti.EisensteinSeries.charE1MF_mem_modFormCharSpace`,
  `TauCeti.EisensteinSeries.qExpansion_charE1MF_coeff`
  (`EisensteinSeries/WeightOne/`; the weight-one Eisenstein series `E₁^{ψ,φ}` on `Γ₁(N)` for
  characters `ψ`, `φ` of moduli `u`, `v` with `uv ∣ N`, in `M₁(N, ψφ)`, with its coefficients when
  `ψ(-1) φ(-1) = -1`); `TauCeti.EisensteinSeries.correctedE2`,
  `TauCeti.EisensteinSeries.qExpansion_coeff_correctedE2` (`EisensteinSeries/WeightTwo/Basic.lean`;
  `E₂(τ) - t E₂(tτ)` on `Γ₀(t)`, with constant term `1 - t` and `n`-th coefficient
  `-24(σ₁(n) - t σ₁(n/t))`, the last term present only when `t ∣ n`).
- *Root lattices* (`LinearAlgebra/IntegralLattice/RootLattice/`, `Algebra/Module/ZLattice/RootLattice.lean`):
  `TauCeti.IntegralLattice.typeARootLattice`, `TauCeti.IntegralLattice.checkerboardLattice` with
  `TauCeti.IntegralLattice.isPosDef_typeARootLattice` and
  `TauCeti.IntegralLattice.isPosDef_checkerboardLattice`, and the levels and discriminant-group
  orders of the real models of `A₂` and `D₄` (`3, 3` and `2, 4`).

### From TauCetiRoadmap.ModularForms

§0.1: the weight-one Eisenstein series with characters `ψ`, `φ` (primitive, `ψ(-1) φ(-1) = -1`) in
the positive-coefficient normalisation `a(n) = ∑_{d ∣ n} ψ(n/d) φ(d)` for `n ≥ 1`, with constant term
`-(1_{ψ=1} B_{1,φ} + 1_{φ=1} B_{1,ψ})/2`, and its membership in the character space. Consumed only
by §8.6, where Tau Ceti's `TauCeti.EisensteinSeries.charE1MF` with its coefficients serves equally.

## References

- J.-P. Serre, *A Course in Arithmetic*, GTM 7 (Springer, 1973),
  [DOI](https://doi.org/10.1007/978-1-4684-9884-4). Ch. VII §6 is the level-one theorem: the theta
  series of an even unimodular lattice is a modular form of weight `n/2`, with the `8 ∣ n` argument
  by passing to `L ⊕ L` and `L^{⊕4}`; §3 is the structure of `M_*(SL(2,ℤ))`.
- W. Ebeling, *Lattices and Codes*, 3rd ed. (Springer, 2013),
  [DOI](https://doi.org/10.1007/978-3-658-00360-9). Ch. 2 for theta series, Poisson summation and
  the transformation formula; Ch. 3 for the Hecke–Schoeneberg theory (attributed there to Hecke and
  Schoeneberg, following Ogg and Schoeneberg): for an even lattice `Λ` of level `ℓ` and dimension
  `n = 2k`, `θ_Λ ∈ M_k(Γ₀(ℓ), χ_Λ)` with `χ_Λ(·) = ((-1)^k det Λ / ·)`, proved by the coset splitting
  and Gauss sums of Layers 6 and 7. Ch. 3 also has the `E₈`, `E₈ ⊕ E₈` and `D₁₆⁺` calculations.
- A. Ogg, *Modular Forms and Dirichlet Series* (Benjamin, 1969), Ch. VI — the source Ebeling follows
  for the general-level transformation formula and the Gauss-sum evaluation.
- B. Schoeneberg, *Elliptic Modular Functions: An Introduction*, Grundlehren 203 (Springer, 1974),
  [DOI](https://doi.org/10.1007/978-3-642-65663-7). Ch. IX is the coset-splitting proof that Layer 7
  follows, via the decomposition of a `Γ₀(N)` matrix in `SL(2, ℝ)`.
- H. Iwaniec, *Topics in Classical Automorphic Forms*, GSM 17 (AMS, 1997),
  [DOI](https://doi.org/10.1090/gsm/017), Ch. 10 — theta functions attached to quadratic forms, the
  general transformation formula, and the Gauss sums, in the form closest to the Layer-6 computation.
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
