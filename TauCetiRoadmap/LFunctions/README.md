# Roadmap: L-functions — completions and functional equations

**Summary.** This roadmap develops the analytic theory of the L-functions of a number field `K`:
the Dedekind zeta function `ζ_K`, the partial zeta functions of ray classes, Dirichlet
L-functions, the Hecke L-functions of finite-order ray class characters, and the L-functions of
algebraic Hecke characters (Grossencharacters of Weil's type `A₀`). Each is continued to the whole
plane as one named function, completed by its conductor power and gamma factors, and given its
functional equation by Hecke's method: Poisson summation on the Minkowski space of `K`, a theta
series with one parameter per infinite place averaged over a fundamental domain for the units, and
Mellin's principle. Throughout, `K` has `r₁` real and `r₂` complex places, discriminant `d_K`,
class number `h`, regulator `R` and `w` roots of unity.

The headline theorems are these.

- `ζ_K` continues to `ℂ` with a single pole, simple, at `s = 1`, of residue
  `2^r₁ (2π)^r₂ h R / (w √|d_K|)`. The completed function
  `Λ_K(s) = |d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ_K(s)` satisfies `Λ_K(1 − s) = Λ_K(s)`, and `ζ_K`
  has a zero of order `r₁ + r₂ − 1` at `s = 0` with leading coefficient `−hR/w`.
- If `χ ≠ 1` is a primitive ray class character whose conductor has finite part `𝔣₀`, its completed
  L-function, with conductor `|d_K| N𝔣₀`, is entire and satisfies `Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)` with
  `|W(χ)| = 1`. The completed L-function of the unitary part of every algebraic Hecke character
  has the same form of functional equation. The full completion `Λ(χ, s)` of a character of shift
  `σ`, the unitary completion at `s − σ`, has its critical line at `Re s = 1/2 + σ` and satisfies
  `Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)` off the poles, which carries that line to the critical line
  `Re s = 1/2 − σ` of the inverse character.
- If `χ` is a nontrivial primitive finite-order Hecke character, `L(s, χ) ≠ 0` for `Re s ≥ 1`.
  If the unitary part of an algebraic Hecke character is not a norm twist, its L-function has no
  zero on `Re s = 1 + σ`, and the logarithmic derivative of its unitary L-function extends
  continuously to `Re s ≥ 1`.
- Mertens' product holds over `K`: `∏_{N𝔭 ≤ x} (1 − N𝔭⁻¹)⁻¹ ~ e^γ κ_K log x`, with `γ` Euler's
  constant and `κ_K` the residue of `ζ_K` at `s = 1`.

Along the way `ζ_K` factors as `ζ(s) L(s, χ_D)` for a quadratic field and as a product of
primitive Dirichlet L-functions for a cyclotomic field.

The completed L-function record, the canonical continuation, Mellin's principle with a level,
Poisson summation on the mixed space, the unit fundamental domains, the partial zeta series of ray
classes and the presented Hecke L-functions are in the Tau Ceti library, which also realizes the
completed roadmaps ArithmeticDirichletSeries (ideal weights, Euler products, Abel summation,
Landau's theorem, the prime ideal theorem) and GlobalNumberFields (moduli, ray class groups and
characters with their conductors, ideles, infinity types, Hecke characters); this roadmap builds
the continuations and functional equations on them. ZerosOfLFunctions consumes its completed cards, continuations and the
nonvanishing on `Re s = 1`. ThetaSeries owns the theta series on the upper half-plane, which
Hecke's method does not need.

Layer 0 adds an average-coefficient-growth predicate to the record. Layer 1 builds the Gaussians
with one parameter per infinite place, the theta series of a lattice with its transformation law,
and the volume of a unit fundamental domain. Layer 2 continues the partial zeta functions of ray
classes, Layer 3 continues and completes `ζ_K`, and Layer 4 factors it for quadratic and
cyclotomic fields. Layer 5 completes the L-functions of primitive ray class characters, with
Gauss sums and root numbers. Layer 6 presents algebraic Hecke characters and builds their theta
kernels. Layer 7 proves the nonvanishing on the line `Re s = 1`, and Layer 8 compares the cards and
proves Mertens' product.

## How to read the build

Layer 0 is a predicate on Tau Ceti's record. Layer 1 needs only Mathlib and Tau Ceti. Layer 3
consumes Layers 1 and 2 and proves the continuation of `ζ_K` and of the partial zeta functions of
the ideal classes. Layers 5 and 6 are built together: the definitions of Layer 5, its
Gauss sums (§5.3) and the card `heckeData` (§5.4) come first; Layer 6 uses only them, with Layers
0, 1 and 3; and the continuation of the presented series (§5.1), the orthogonality on the
continued functions (§5.2) and the continuation and functional equation of the completed
L-function (§5.4) of a finite-order Hecke character are the finite-order case of the
Grossencharacter kernel (§§6.9–6.10). The continuation to the whole plane of the partial zeta
functions of an arbitrary modulus, which §2.1 states, comes from Tau Ceti's orthogonality of the
series and the continuation of §5.1. Layer 7 uses the continuations of Layers 3, 5
and 6, and Layer 8 the cards of Layers 3 to 6. Each *Needs:* line lists what its statement and its
route use, so that a target proved another way is not blocked behind an unrelated one.

The roadmap-level dependencies are

```text
ArithmeticDirichletSeries ─┐
GlobalNumberFields ────────┴──> LFunctions ──> ZerosOfLFunctions
```

Both suppliers are completed roadmaps whose declarations are in Tau Ceti at the pin, and neither
consumes anything from here. Arithmetic Dirichlet Series states its prime ideal theorem
conditionally on a boundary record that Tau Ceti provides; this roadmap consumes that record and
compares its series with `dedekindZetaC` (§7.5), so the arrow into `LFunctions` stays the only one
between them. Chebotarev consumes the same two suppliers and is not a dependency of this roadmap.

## Conventions

1. **Number fields and moduli.** `K` is a field with `[NumberField K]`, `n = [K:ℚ]`, `r₁` and `r₂`
   are Mathlib's `nrRealPlaces K` and `nrComplexPlaces K`, `r = r₁ + r₂`, `h`, `R` and `w` are
   Mathlib's `NumberField.classNumber K`, `NumberField.Units.regulator K` and
   `NumberField.Units.torsionOrder K`. A modulus is Tau Ceti's
   `TauCeti.GlobalNumberFields.Modulus K`, `𝔪 = 𝔪₀ 𝔪∞` with finite part `𝔪₀` and a set `𝔪∞` of
   real places; Hecke characters are Tau Ceti's `TauCeti.GlobalNumberFields.HeckeCharacter K`. For
   a fractional ideal `I`, `σ(I)` is Mathlib's lattice `NumberField.mixedEmbedding.idealLattice K I`
   in the mixed space `mixedSpace K = ℝ^r₁ × ℂ^r₂`.
2. **Normalization.** The analytic normalization reflects `s ↦ 1 − s`; an arithmetic card of
   weight `w` reflects `s ↦ w + 1 − s`. Tau Ceti's `TauCeti.LFunctions.NormalizationTranslation`
   passes between them: coefficients `a(n) / n^(w/2)`, gamma shifts moved by `+w/2`, completed
   function `N^(−w/4) Λ(s + w/2)`.
3. **Completion.** The conductor factor `N^(s/2)` is part of the completed function, so the
   functional equation carries no extra conductor constant. The degree of a card is
   `#gammaR + 2 #gammaC`; it is not inferred from coefficients or from Dirichlet agreement.
4. **Dual.** The dual card has conjugate coefficients and gamma shifts, the conjugate root number,
   the reflected completed function `s ↦ conj Λ(conj s)` and the conjugated polar divisor (Tau
   Ceti's `AnalyticLFunctionData.dual`). The root number of the inverse character is the inverse
   root number, `W(χ⁻¹) = W(χ)⁻¹`; for a unitary character this is also `conj W(χ)`.
5. **Continuation.** Every continued L-function is `TauCeti.meromorphicContinuation σ f`: the
   function in Mathlib's meromorphic normal form on all of `ℂ` (`MeromorphicNFOn`: equal to its
   limit at a removable point and `0` at a pole) that agrees with the Dirichlet series `f` on
   `Re s > σ`, and `0` if there is none. Two such functions that agree on an open half-plane agree
   everywhere, so the continuation is one function; the continuation theorem of each L-function
   says that the first case occurs.
6. **Poles and global identities.** `polarOrder p = n` records an exact pole of order `n`. Every
   identity between two continued functions — a factorization, a functional equation, an
   imprimitive comparison — is stated on a right half-plane, promoted by uniqueness of meromorphic
   continuation (Tau Ceti's `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`) to an equality
   of germs at every point, and stated pointwise only away from the polar loci. An unrestricted
   equality of total representatives is never asserted: Mathlib's value at a pole is junk, and
   `1/(1 − s)` at `s = 1` is `0`.
7. **Ray-class coefficients.** Every ray-class coefficient carries coprimality to the finite part
   of the modulus, so every such series misses the Euler factors at the primes dividing `𝔪₀`.
   Their product `∏_{𝔭 ∣ 𝔪₀} (1 − N𝔭^(−s))` is Tau Ceti's
   `TauCeti.LFunctions.finiteEulerCorrection 𝔪 s`, a product over `𝔪.support`; it is `1` only for
   a trivial finite part, and it is the single name for these factors wherever they recur.
8. **Primitive scope.** A primitive conductor, root number, completion, Gauss sum or card takes
   Tau Ceti's `TauCeti.LFunctions.PrimitiveRayClassCharacter`, which carries the conductor, a
   character at that modulus and its primitivity together. A presentation modulus is never stored
   as an arithmetic conductor, and a character never carries two conductors. An imprimitive series
   is the presented series with a finite Euler-factor correction to the primitive one; it has no
   second completed card.
9. **Grossencharacter presentation.** The idele class character is the primary object; the
   weight, the infinity type and the modulus condition are equations in it, so a presentation is
   determined by its Hecke character. The analytic card is that of the unitary part. A datum fixed
   by an existence-and-uniqueness theorem — the inverse presentation, the presentation of a ray
   class character, the presentation at the conductor, a residue character — is passed to a
   statement as an argument with its characterizing property.
10. **Hecke shift.** "The shift" `σ` is the ideal-side `idealShift`, with `χ = χ_u N^σ` on ideals:
    at a prime idele `χ(π_𝔭) = χ_u(𝔭) N𝔭^σ`. The full completion is the unitary completion
    recentred at `s − σ`. It is the **negative** of the supplier's `HeckeCharacter.shift`, which is
    fixed idelically by `‖χ y‖ = ‖y‖^(HeckeCharacter.shift)` (Tau Ceti's
    `HeckeCharacter.norm_apply_eq_rpow_shift`): `N^m` is the idele class character `‖·‖^(−m)`, of
    supplier shift `−m` and ideal-side shift `m`.
11. **Archimedean sign.** `infinityType` is the idelic archimedean exponent `n`; on a principal
    ideal `(a)` with `a ≡ 1 mod* 𝔪` the finite value is the **inverse** of the archimedean value:
    `χ_u((a)) N(a)^σ · ∏_τ τ(a)^(n_τ) = 1` (Neukirch VII (6.13)). Hecke's classical infinity type
    is `−n`, and the harmonic polynomial of the theta kernel puts the conjugate coordinate at a
    complex place of positive angular frequency.
12. **Conductor of a presentation.** `Grossencharacter.primitiveConductor` has finite part the
    supplier's `HeckeCharacter.finiteConductor` of the primary object, and infinite part the real
    places at which the parity of the archimedean restriction differs from the parity of the
    algebraic exponent: exactly the real places every presentation must contain. At a real place
    this is the presentation conductor, not the ramification conductor: `N^m = ‖·‖^(−m)` over `ℚ`
    with `m` odd is unramified at `∞` (its archimedean component `|x|^(−m)` is trivial on `±1`),
    yet `∞` divides its conductor, because its algebraic exponent is odd. For a finite-order
    character the algebraic exponent is `0` and the two notions agree. Everything that depends on
    ramification alone — the theta constant, the scale of the kernel and the conductor
    `|d_K| N(𝔣₀)` of the card — reads the finite conductor `𝔣₀`.
13. **Fourier analysis on the mixed space.** The additive character is Mathlib's
    `Real.fourierChar`, `𝐞 x = exp(2πi x)`; the pairing is the Euclidean
    `TauCeti.NumberField.mixedEmbedding.mixedInner`, in which a complex coordinate counts once, not
    the trace form; the measure is `volume`, self-dual for that pairing; the sign is Mathlib's,
    `𝐞(−⟨x, y⟩)`. Tau Ceti's `mixedFourier` is the transform built from these choices, and every
    normalization below follows from them.
14. **Archimedean parameters and measures.** A parameter is a point `y` of Mathlib's
    `mixedEmbedding.realSpace K`, one real number per infinite place; its norm is Tau Ceti's
    `archNorm y = ∏_w y_w^(mult w)`, a complex place counting twice. The multiplicative measure is
    the product `∏_w dy_w / y_w` over places. Neukirch's canonical measure carries `e_𝔭 = 2` at a
    complex place and is `2^r₂` times it, so his `vol(F) = 2^(r−1) R` reads `2^(r−1) R / 2^r₂`
    here; the compensating `2^r₂` sits in the Mellin kernel, and the constant term of the kernel is
    his `2^(r−1) R / w` in both normalizations.
15. **Mellin transform.** Mathlib's `mellin f s = ∫_0^∞ t^(s−1) f(t) dt`, so Neukirch's (1.4)
    `L(f, s) = ∫ (f(t) − f(∞)) t^s dt/t` is `mellin (f − f(∞)) s`. Mellin's principle is Mathlib's
    `WeakFEPair`, reached through Tau Ceti's `TauCeti.FEPairWithLevel`. The completed partial zeta
    function at `s` is the Mellin transform of its kernel minus its constant term at `s/2`
    (Neukirch (5.5)); the unitary completion of a Grossencharacter at `s` is the transform of its
    kernel at `(s + Tr p / n)/2` (Neukirch (8.3)). No kernel is left to an existential.

## Layer 0: completed L-function data

The completed L-function record, its degree and gamma factor, the card of a Dirichlet series, the
dual card, the predicates of Dirichlet agreement, meromorphic continuation and functional
equation, the comparison off the zeroth coefficient, the arithmetic record and the normalization
translation are Tau Ceti's (supplier contracts). This layer adds the coefficient condition that
the zeros roadmap consumes.

### 0.1 Average coefficient growth

Define the average-coefficient-growth predicate on an analytic card `d`: for every `ε > 0`,
`∑_{1 ≤ n ≤ x} |a_n| = O(x^(1+ε))` as `x → ∞`, where `a = d.coeff`. The zeroth coefficient,
which `LSeries` does not read, plays no part.

- If `d` satisfies the predicate, its coefficients are `LSeriesSummable` on `Re s > 1`, and for
  every `δ > 0` the L-series of `d` is bounded on `Re s ≥ 1 + δ` by a constant depending on `δ`
  (partial summation).
- The predicate holds for `d` exactly when it holds for the dual card `d.dual`, since
  `|conj a_n| = |a_n|`, and it is invariant under Tau Ceti's `AnalyticLFunctionData.EqOffZero`.
- It holds for Tau Ceti's `riemannZetaData` and `dirichletData`, whose coefficients have absolute
  value at most `1`, and for the cards `dedekindZetaData`, `heckeData` and `grossencharacterData`
  of Layers 3, 5 and 6, whose `n`-th coefficient is at most the number of integral ideals of norm
  `n` in absolute value, so that the partial sums are at most the ideal count `O(x)` of Tau Ceti's
  `TauCeti.isBigO_card_idealsLE_sub`.

*Needs:* Tau Ceti `TauCeti.LFunctions.AnalyticLFunctionData`, `AnalyticLFunctionData.dual`,
`AnalyticLFunctionData.EqOffZero`, `TauCeti.isBigO_card_idealsLE_sub`; Mathlib `LSeriesSummable`,
`LSeries`.

**Checks.**

- The coefficients `a_n = 1` of `riemannZetaData` have partial sums `⌊x⌋ ≤ x`, so the predicate
  holds with room `x^ε` to spare.
- The coefficients `a_n = n` for `n` a power of `2` and `0` otherwise satisfy the predicate, since
  `∑_{2^k ≤ x} 2^k < 2x`, although `|a_n| = n` along the powers of two: the predicate is an
  average, and a pointwise bound `|a_n| = O(n^ε)` would reject this sequence.
- The coefficients `a_n = n^(1/2)` fail it: `∑_{n ≤ x} n^(1/2) ~ (2/3) x^(3/2)`, which is not
  `O(x^(1+ε))` for `ε < 1/2`; their L-series diverges at `s = 3/2`.

### Examples

These examples exercise Tau Ceti's record in this roadmap's conventions.

- `riemannZetaData`: coefficients `1`, conductor `1`, one real gamma shift `0`, no complex shift,
  degree `1`, root number `1`, completed function Mathlib's `completedRiemannZeta`, and simple
  poles at `0` and `1`; its dual is itself.
- The discriminant form `Δ`, of weight `12`, has arithmetic weight `w = 11`: its completed function
  `Γ_ℂ(s) L(Δ, s)` is symmetric under `s ↦ 12 − s = w + 1 − s`, and its arithmetic complex gamma
  shift is `0`. Its analytic translation has complex shift `+11/2`, not `−11/2`, and is symmetric
  under `s ↦ 1 − s`; the factor `N^(−w/4)` is `1` at conductor `N = 1`.
- The translation of weight `0` is the identity, as an equality of cards and not only off the
  zeroth coefficient (Tau Ceti's `NormalizationTranslation.analytic_eq_of_weight_zero`).
- A non-real Dirichlet character has a genuinely distinct dual card: the dual of the card of `χ`
  is the card of `χ⁻¹` (Tau Ceti's `dirichletData_dual`).
- A card of weight `0` whose completed function is identically `0` and whose polar divisor is
  supported at `0` alone satisfies the root-number and value clauses of the functional equation
  and has no functional equation, because its polar divisor is not symmetric under
  `s ↦ 1 − conj s`. This is why the equivalence of the two functional equations
  (`NormalizationTranslation.hasFunctionalEquation_iff`) translates all three clauses, the
  reflection of the polar divisor `polarOrder s = polarOrder (w + 1 − conj s)` among them.

### Dependencies

Tau Ceti's completed L-function record and its predicates; Mathlib `LSeries`. No earlier layer.

## Layer 1: the mixed-space specialization of Poisson summation, and theta

The Euclidean pairing of the mixed space, its Fourier transform, the dual of a lattice, Poisson
summation over a lattice of the mixed space, the comparison of the Euclidean dual of an ideal
lattice with its trace dual, Mellin's principle with a level, the unit action on the parameters,
the norm-one hypersurface and the unit fundamental domains are Tau Ceti's (supplier contracts).
This layer builds what Hecke's method adds to them (Neukirch VII §§3 and 5): the Gaussians, the
theta series of a lattice with one parameter per infinite place and its transformation law, and
the Haar measures of the parameter space with the volume of a unit fundamental domain.

A Gaussian with one parameter `t`, Mellin-transformed in `t`, gives the Epstein zeta function of
the lattice `σ(𝔞)` — a sum over lattice points, `∑_{x ≠ 0} Q(x)^(−s)` — and not the partial zeta
function, a sum over ideals, that is over lattice points modulo the unit group. In positive unit
rank the lattice-point sum `∑_{a ∈ 𝔞, a ≠ 0} N((a))^(−s)` is not even summable, since every ideal
is hit by infinitely many units; the two constructions coincide only when the unit group is
finite (§3.1). Hecke's method therefore needs a Gaussian with one positive parameter per infinite
place, on which the units act, and a fundamental domain for that action.

### 1.1 The Gaussian on the imaginary axis

Define `mixedGaussian K t x = exp(−π t ⟨x, x⟩)` for `t > 0`, the Gaussian of the Euclidean pairing
`mixedInner`. It is Mathlib's Gaussian `exp(−π ‖x‖²)` of the Euclidean model
`NumberField.mixedEmbedding.euclidean.mixedSpace K`, scaled by `t` and read through Mathlib's
`euclidean.toMixed`, which carries the inner product to `mixedInner` (Tau Ceti's
`mixedInner_toMixed`). Prove its self-duality
`mixedFourier K (mixedGaussian K t) = t^(−n/2) mixedGaussian K t⁻¹`, which is Mathlib's
`fourier_gaussian_innerProductSpace` read through Tau Ceti's `mixedFourier_toMixed`, and the
transformation of the theta series of an ideal lattice at one parameter,
`∑_{x ∈ σ(I)} mixedGaussian K t x = covol(σ(I))⁻¹ t^(−n/2) ∑_{y ∈ σ(I)^∨} mixedGaussian K t⁻¹ y`,
which is Tau Ceti's Poisson summation `tsum_idealLattice_eq_tsum_mixedDual_mixedFourier` applied
to it (Neukirch VII (3.6) on the imaginary axis). Both are conjuncts of the normalization theorem
`gaussianTheta_mellin_normalization` (§3.7). Hecke's method uses only this ray `τ = i t` of the
Gaussian; the holomorphic theta function on the upper half-plane, its cosets and its
transformation laws are ThetaSeries's and are not used here.

*Needs:* Tau Ceti `mixedInner`, `mixedFourier`, `mixedFourier_toMixed`, `mixedInner_toMixed`,
`mixedDual`, `tsum_idealLattice_eq_tsum_mixedDual_mixedFourier`; Mathlib `euclidean.toMixed`,
`euclidean.volumePreserving_toMixed`, `fourier_gaussian_innerProductSpace`.

**Checks.**

- Over `ℚ`, `σ(ℤ) = ℤ` is self-dual of covolume `1`, `n = 1`, and the transformation is Jacobi's
  `θ(t) = t^(−1/2) θ(1/t)` for `θ(t) = ∑_{m ∈ ℤ} e^(−π t m²)`.
- Over `ℚ(i)`, `σ(ℤ[i])` has covolume `1 · 2^(−1) · √4 = 1` and is self-dual for `mixedInner`
  (`Re((a + bi)(c − di)) = ac + bd`), the sum is `θ(t)²`, and the factor is `t^(−1)`, the square of
  Jacobi's; the trace dual `(1/2) ℤ[i]` in place of the Euclidean dual would change the right-hand
  side.

### 1.2 The theta series of a lattice with one parameter per infinite place

Define the Gaussian `archGaussian K y x = exp(−π ∑_w y_w |x_w|²)` with one positive parameter per
infinite place, a complex coordinate counted once, and the theta series
`latticeTheta K L y = ∑_{ξ ∈ L} archGaussian K y ξ` of a lattice `L` of the mixed space (Neukirch
VII §5).

- `archGaussian_unit_smul`: the Gaussian at `u • x` is the Gaussian at `x` with the parameter moved
  by Tau Ceti's `unitScale u`, `y_w ↦ |u|_w² y_w` (Neukirch's `|ε|² y`); `|u|²` and not `|u|`
  because the Gaussian is quadratic.
- `mixedFourier_archGaussian`: for positive `y`, the Fourier transform of `archGaussian K y` is
  `N(y)^(−1/2)` times `archGaussian K y⁻¹`, Mathlib's self-duality of `exp(−π ‖x‖²)` after the
  coordinatewise change of variable `x ↦ √y • x`, whose Jacobian is `N(y)^(1/2)` because a complex
  coordinate is two real ones.
- `summable_archGaussian`: for a full lattice `L` and positive `y` the theta series converges
  absolutely; this licenses every exchange of the sum with an integral in Layer 3.
- `latticeTheta_unitScale`: the theta series of an ideal lattice is invariant under the unit action
  on the parameters, by reindexing the lattice by `u`. This is the one place the unit group enters,
  and it is what a constant parameter cannot see.
- `latticeTheta_inv`: for a full lattice `L` and positive `y`,
  `θ_L(y) = covol(L)⁻¹ N(y)^(−1/2) θ_{L^∨}(y⁻¹)`, the dual being the Euclidean dual `mixedDual K L`
  (Neukirch VII (3.6) on the imaginary axis). It is Tau Ceti's Poisson summation over `L`,
  `tsum_eq_tsum_mixedDual_mixedFourier`, applied to `archGaussian K y` with
  `mixedFourier_archGaussian`.

*Needs:* §1.1; Tau Ceti `mixedFourier`, `mixedDual`, `tsum_eq_tsum_mixedDual_mixedFourier`,
`TauCeti.LFunctions.unitScale`, `TauCeti.LFunctions.archNorm`; Mathlib
`mixedEmbedding.realSpace`, `mixedEmbedding.normAtPlace`, `fourier_gaussian_innerProductSpace`.

**Checks.**

- At a constant parameter `y_w = t` the multi-parameter Gaussian is `mixedGaussian K t`, and
  `latticeTheta_inv` reduces to the one-parameter transformation of §1.1 with
  `N(y)^(−1/2) = t^(−n/2)`; a norm that counted a complex place once would give `t^(−(r₁+r₂)/2)`,
  which over `ℚ(i)` is `t^(−1/2)` instead of the correct `t^(−1)`.
- Over a real quadratic field with fundamental unit `ε > 1`, whose conjugate has absolute value
  `ε⁻¹`, `unitScale ε` sends `(y₁, y₂)` to `(ε² y₁, ε⁻² y₂)`: it preserves `N(y) = y₁ y₂` and moves
  a constant parameter off the diagonal, while `latticeTheta` of `σ(𝓞_K)` takes the same value at
  both points.

### 1.3 Haar measures on the parameter space and the volume of a unit fundamental domain

Define the multiplicative Haar measure `archHaar K`, `dy/y = ∏_w dy_w / y_w` on the positive
parameters, and the Haar measure `multHaar`, `dt/t` on `(0, ∞)`. Define Neukirch's `d*x` on the
norm-one hypersurface `S = normOneSurface K` (Tau Ceti's) as `surfaceHaar K`: since
`∫_1^e dt/t = 1`, the mass of `A ⊆ S` is the `dy/y`-mass of the parameters with surface part
(Tau Ceti's `surfacePart`) in `A` and norm in `[1, e]`. Prove `archHaar_eq_map`: `dy/y` is the
image of `d*x × dt/t` under `(x, t) ↦ surfaceScale x t = x t^(1/n)`, the decomposition
`R_+^* = S × ℝ_+^*` of Neukirch VII §5. Prove Neukirch's (5.6) in this normalization,
`surfaceHaar_of_isUnitFundamentalDomain`: every fundamental domain `D` for the unit action on `S`
(Tau Ceti's `IsUnitFundamentalDomain`, bounded by definition) has `d*x`-volume
`2^(r−1) R / 2^r₂`, with `R` Mathlib's regulator. The `2^(r−1)` is the index of `2 log|𝔬ˣ|` in
`log|𝔬ˣ|` up to the `1/n` of the scaling direction, cancelled by the `n` of the last row of
Neukirch's determinant: it is where the action by `|ε|²` rather than `|ε|` enters.

*Needs:* Tau Ceti `normOneSurface`, `surfaceScale`, `surfacePart`, `archNorm`, `unitScale`,
`IsUnitFundamentalDomain`, `unitFundamentalDomain`; Mathlib `NumberField.Units.regulator`,
`mixedEmbedding.fundamentalCone`. It needs nothing from §§1.1–1.2.

**Checks.**

- Over `ℚ`, one real place: `archHaar` is `dt/t` on `(0, ∞)` and gives `[1, e]` mass `1`; `S` is the
  point `{1}` and `surfaceHaar` gives it mass `1 = 2^(r−1) R / 2^r₂` (`r = 1`, `R = 1`, `r₂ = 0`).
- Over `ℚ(i)`, one complex place: `archHaar` gives `{1 ≤ y ≤ e}` mass `1`, where Neukirch's canonical
  measure, with `e_𝔭 = 2`, gives `2`; the shell `1 ≤ N(y) = y² ≤ e` is `[1, e^(1/2)]`, of mass
  `1/2`, so `S = {1}` has `surfaceHaar` mass `1/2 = 2^(r−1) R / 2^r₂` (`r = 1`, `r₂ = 1`), and `1` in
  Neukirch's normalization.
- Over a real quadratic field with fundamental unit `ε`: in the coordinates
  `y₁ = e^u t^(1/2)`, `y₂ = e^(−u) t^(1/2)` the measure `dy/y` is `du dt/t`, the units act by
  `u ↦ u + 2 log ε`, and a unit fundamental domain on the hyperbola `y₁ y₂ = 1` has `surfaceHaar`
  mass `2 log ε = 2^(r−1) R` (`r = 2`, `R = log ε`). A definition through the one-parameter
  Gaussian cannot see this, since its `S` would be a point.

### Examples

These examples exercise Tau Ceti's mixed-space conventions and its Mellin principle with a level.

- Over `ℚ(i)`, with its one complex place: `mixedInner σ(1) σ(1) = 1`, where the trace form gives
  `Tr(1 · 1) = 2`; `mixedInner σ(i) σ(i) = Re(i · conj i) = 1`, where the trace form gives
  `Tr(i · i) = −2`, so the trace form is not positive at a complex place and cannot carry a
  Gaussian; and `mixedInner σ(1+i) σ(1+i) = |1+i|² = 2`, where a metric counting each complex place
  twice, as Neukirch's canonical one does, gives `4`. Over `ℚ` the two agree, `mixedInner x y = x y`,
  so only a field with a complex place separates them.
- The comparison map between the trace dual and the Euclidean dual of an ideal lattice is the
  identity on real coordinates and `z ↦ 2 conj z` on complex coordinates (Tau Ceti's
  `traceToEuclidean`); one complex coordinate has real determinant `−4`, and the global absolute
  determinant is `4^r₂` (`abs_det_traceToEuclidean`). The covolume of `σ(I)` is Mathlib's
  `N(I) 2^(−r₂) √|d_K|`, which is `1` for the ring of integers of `ℚ(i)`.
- The Dedekind kernel of `ℚ`, `f = g = θ(iu)/2` with `θ(iu) = ∑_{m ∈ ℤ} e^(−π u m²)`, is a pair at
  level `1`, weight `1/2`, `ε = 1` and constants `f₀ = g₀ = 1/2`: the transport to Mathlib's pair is
  the identity, `Λ(s/2)` is `completedRiemannZeta s`, and the residues `−1/2` at `0` and `1/2` at
  `1/2` become `−1` at `s = 0` and `1` at `s = 1`.
- The same pair at level `N`, `f(t) = θ(it)/2` and `g(t) = N^(1/2) θ(iNt)/2`, satisfies the law
  `f(1/(N t)) = t^(1/2) g(t)`, and the transport returns `g(x/N) = N^(1/2) θ(ix)/2` with
  `ε N^(−1/2)`, Mathlib's level-one pair; a transport that rescaled `g(x)` to `g(N x)` would produce
  `θ(iN²x)` and fail the law for `N ≠ 1`.
- The positive weight and the nonzero `ε` of Tau Ceti's carrier cannot be dropped: with `ε = 0` the
  pair `f ≡ 0`, `g ≡ 1` on `(0, ∞)` satisfies the law while its reverse reads `1 = 0`, and with
  `k = 0` the pair `f = g ≡ 1` satisfies it while its residues `−1` and `1` sit at the same point.

### Dependencies

Tau Ceti: the mixed-space pairing, Fourier transform, dual and Poisson summation
(`TauCeti.NumberField.mixedEmbedding`), the unit action, norm-one hypersurface, surface coordinates
and unit fundamental domains (`TauCeti.LFunctions`). Mathlib:
`NumberField.mixedEmbedding.euclidean.mixedSpace` with `euclidean.toMixed` and
`euclidean.volumePreserving_toMixed`, `fourier_gaussian_innerProductSpace`,
`mixedEmbedding.covolume_idealLattice`, `fundamentalCone`, `NumberField.Units.regulator`. Layer 0 is
not needed.

## Layer 2: partial zeta functions

For a modulus `𝔪` and a ray class `c`, the indicator `TauCeti.LFunctions.rayClassCoeff 𝔪 c` is `1`
exactly at the nonzero integral ideals prime to `𝔪₀` whose ray class is `c`, the class being read
off the supplier's prime-to carrier `integralIdealsPrimeTo 𝔪`, so that no junk class is available
at a bad ideal; it is a general ideal arithmetic function and not a weight, since the indicator of
a nontrivial class is not completely multiplicative. Tau Ceti proves that its norm-regrouped
series converges on `Re s > 1`, that the series of the classes sum to
`ζ_K(s) · finiteEulerCorrection 𝔪 s`, that each series minus `κ_𝔪/(s − 1)` is holomorphic on
`Re s > 1 − 1/n`, by Abel summation from the uniform ray class count, and that
`(s − 1) ζ(s, c) → κ_𝔪` as `s → 1⁺`, with `κ_𝔪` the supplier's `rayClassIdealMainTerm 𝔪`
(supplier contracts). This layer names the continued function and states these facts for it.

### 2.1 The continued partial zeta function

Define `partialZeta K 𝔪 c` as `TauCeti.meromorphicContinuation 1` of the norm-regrouped series of
`rayClassCoeff 𝔪 c`. Prove:

- `partialZeta_eq_lSeries`: on `Re s > 1`, `partialZeta K 𝔪 c` is the series. This is the
  statement that the series continues to a meromorphic function on the whole plane.
- `sum_partialZeta`: on `Re s > 1`,
  `∑_{c ∈ Cl_𝔪} ζ(s, c) = ζ_K(s) ∏_{𝔭 ∣ 𝔪₀} (1 − N𝔭^(−s)) = dedekindZeta K s · finiteEulerCorrection 𝔪 s`.
  ⚠ The sum over ray classes is not `ζ_K`: summing the class indicators gives the indicator of the
  ideals prime to `𝔪₀`, and a modulus with one prime in its support already breaks the equality.
- `sum_partialZeta_one`: for the trivial modulus the correction is the empty product and the
  partial zeta functions of the ideal classes sum to `ζ_K` on `Re s > 1`.
- `tendsto_sub_one_mul_partialZeta`: `(s − 1) ζ(s, c)` tends to
  `κ_K · finiteEulerCorrection 𝔪 1 / #Cl_𝔪` as `s → 1` in `ℂ`, `s ≠ 1`, with `κ_K` Mathlib's
  `dedekindZeta_residue K`: every ray class has the same simple pole. This constant is the
  supplier's `rayClassIdealMainTerm 𝔪`, whose closed form the supplier proves
  (`ofReal_rayClassIdealMainTerm`); the analytic residue is that constant, not a second one. ⚠
  `κ_K / #Cl_𝔪` is wrong for a nontrivial finite part.

*Route.* On `Re s > 1` the first theorem reduces the second and third to Tau Ceti's
`sum_LSeries_rayClassCoeff` and `sum_LSeries_rayClassCoeff_one`, and the residue at `s = 1` is
Tau Ceti's continuation of the series minus its pole to `Re s > 1 − 1/n`, which contains a
neighbourhood of `1`. The continuation to the plane is §3.4 for the trivial modulus
(`completedPartialZeta_eq_partialZeta`), and for an arbitrary modulus the orthogonality relation
`#Cl_𝔪 · ζ(s, c) = ∑_χ χ(c)⁻¹ L(s, χ)` of Tau Ceti's `sum_inv_mul_LSeries_toUnitaryIdealWeight`
together with the continuation of the presented Hecke L-functions (§5.1).
*Needs:* Tau Ceti `rayClassCoeff`, `finiteEulerCorrection`, `LSeriesSummable_rayClassCoeff`,
`sum_LSeries_rayClassCoeff`, `sum_LSeries_rayClassCoeff_one`,
`exists_differentiableOn_eq_LSeries_rayClassCoeff_sub`, `ofReal_rayClassIdealMainTerm`,
`TauCeti.meromorphicContinuation`, `meromorphicContinuation_eqOn`; for the continuation to the
plane §3.4 (trivial modulus) or Tau Ceti `sum_inv_mul_LSeries_toUnitaryIdealWeight` with §5.1
(any modulus); Mathlib `dedekindZeta`, `dedekindZeta_residue`.

**Checks.**

- Over `ℚ` at `ratModulus 4 = (4)·∞`, the ray class group is `(ℤ/4)ˣ`: two classes, with
  `ζ(s, [1]) + ζ(s, [3]) = ζ(s)(1 − 2^(−s))`, and each partial zeta function has residue
  `κ_ℚ (1 − 1/2) / 2 = 1/4` at `s = 1`, the density of the integers `≡ 1 mod 4`; the formula
  `κ_ℚ / #Cl_𝔪` gives the wrong value `1/2`.
- Over `ℚ` at `ratFiniteModulus 5 = (5)`, the ray class group is `(ℤ/5)ˣ/{±1}`: two classes, each
  of residue `(1 − 1/5)/2 = 2/5`.
- Over `ℚ(√−5)` at the trivial modulus: two ideal classes, whose partial zeta functions sum to
  `ζ_K`, each of residue `κ_K / 2 = π/(2√5)`, since `κ_K = 2π · 2 · 1 / (2 √20) = π/√5`.

### 2.2 Change of modulus and the class-group case

Prove compatibility with change of modulus: for `𝔪 ∣ 𝔫` and a ray class `c` of `𝔪`, the partial
zeta functions of the classes `c'` of `𝔫` with `classMap h c' = c` (the supplier's transition map
`RayClassGroup 𝔫 →* RayClassGroup 𝔪`) sum to the series of `c` over the ideals prime to `𝔫₀`,
`∑_{𝔞 ∈ c, (𝔞, 𝔫₀) = 1} N𝔞^(−s)`, on `Re s > 1`, so that their sum is the canonical continuation
of that series; when `𝔪` and `𝔫` have the same support this is `ζ(s, c)`. Prove independence of
representatives: the partial zeta function of the class of a nonzero integral ideal prime to `𝔪`
depends only on its ray class, so any representative may be used. The class-group case is the trivial modulus, where the classes are
the ideal classes, the correction is the empty product and `sum_partialZeta_one` applies. No
generic ideal series or Euler product is introduced in this layer.
*Needs:* §2.1; Tau Ceti `classMap`, `idealClass`, `integralIdealsPrimeTo`, `support_one`.

**Checks.**

- Over `ℚ` with `𝔪 = ratFiniteModulus 5` and `𝔫 = ratFiniteModulus 10`, the ray class groups are
  `(ℤ/5)ˣ/{±1}` and `(ℤ/10)ˣ/{±1}`, both of order `2`, and the class `{±1}` of `𝔪` lies under the
  one class `{±1 mod 10}` of `𝔫`. Its partial zeta function is `∑ n^(−s)` over the positive
  `n ≡ ±1 mod 10`, the odd `n ≡ ±1 mod 5`; this is not `ζ(s, [1]_𝔪)`, which also counts
  `n = 4, 6, 14, 16, …`, because the prime `2`, which divides `𝔫₀` and not `𝔪₀`, is deleted.

### Examples

These examples exercise the supplier's class indicator over `ℚ`, where the ray class group of
`ratModulus n` is `(ℤ/n)ˣ` through the positive generator (the supplier's `ratModulusEquivZMod`).

- At the trivial modulus there is one class, and the indicator is `1` at every nonzero ideal.
- At `ratModulus 4`, the indicator of the class of `3` is `1` at `(3)` and `(7)` and `0` at `(5)`
  and at `(2)`, which is not prime to `4`; reading the class off the generator `−3 ≡ 1` would put
  `(3)` in the trivial class.
- At `ratFiniteModulus 5`, whose ray class group is `(ℤ/5)ˣ/{±1}`, the indicator of the trivial
  class is `1` at `(4)` and `(9)`, since `4 ≡ 9 ≡ −1`; a definition that forgot the sign quotient
  gives `0` there.

### Dependencies

Tau Ceti: the class indicators and their series, `finiteEulerCorrection`, `rayClassIdealMainTerm`
with `ofReal_rayClassIdealMainTerm`, `classMap`, `idealClass`, `integralIdealsPrimeTo`,
`TauCeti.meromorphicContinuation`. Mathlib: `dedekindZeta`, `dedekindZeta_residue`. No earlier
layer for the half-plane statements; the continuation to the plane is §3.4 or §5.1, as above.

## Layer 3: Dedekind zeta

This layer constructs the completed partial zeta functions of the ideal classes from the theta
series of Layer 1 (Neukirch VII (5.3)–(5.11)), and the continued and completed Dedekind zeta
functions as their sum over the classes.

### 3.1 The unit quotient: the Epstein regression

Define `epsteinZeta K I s`, the sum of `mixedInner(x, x)^(−s)` over the nonzero points `x` of
`σ(I)`: a sum over lattice points. Prove `radialMellin_eq_epsteinZeta`: for `Re s > n/2` the
Mellin transform of the one-parameter theta series of `σ(I)` minus its constant term `1` is
`π^(−s) Γ(s)` times `epsteinZeta K I s`. The constant is subtracted from the theta series, not from
each term, since `∑ (e^(−π t Q(x)) − 1)` does not converge. Prove
`not_summable_absNorm_of_rank_pos`: in positive unit rank, `∑_{a ∈ 𝔞, a ≠ 0} N((a))^(−s)` is not
summable for any `s`, every nonzero ideal of the class being hit by infinitely many lattice
points, one per unit modulo torsion. So the one-parameter theta series supplies the Dedekind zeta
function of no field of positive unit rank (Neukirch VII (5.3)–(5.4)).
*Needs:* §1.1; Mathlib `mellin`, `Complex.Gamma`, `NumberField.Units.rank`.

**Checks.**

- Over `ℚ` at `s = 1` the right side of `radialMellin_eq_epsteinZeta` is
  `π⁻¹ ∑_{m ≠ 0} m⁻² = π⁻¹ · 2 · π²/6 = π/3`.
- Over `ℚ(i)` each nonzero ideal of `ℤ[i]` is hit by `w = 4` lattice points and `mixedInner` of `σ(α)`
  with itself is `N(α)`, so `epsteinZeta K ℤ[i] s = 4 ζ_{ℚ(i)}(s)`: the lattice-point sum is `w`
  times the ideal sum exactly when the unit group is finite.

### 3.2 Completed partial zeta functions of a fractional ideal

Define `idealUnit K 𝔞 h`, a nonzero integral ideal as a unit of the fractional ideals, and the
predicate `IsClassRepresentatives K 𝔪 rep`: `rep c` is a nonzero integral ideal prime to `𝔪` of
class `c`, for every class `c` of `Cl_K`. Define the completed partial zeta function
`completedPartialZeta K I`, Neukirch's `Z(𝔎, s) = |d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ(𝔎, s)` for `𝔎`
the class of `I⁻¹`, as the canonical continuation from `Re s > 1` of that product with `ζ(𝔎, s)`
the sum of `N𝔟^(−s)` over the nonzero integral ideals `𝔟` with `𝔟 I` principal (Neukirch VII (5.4),
(5.9)). Prove:

- `completedPartialZeta_eq_tsum`: on `Re s > 1` it is that product, the continuation existing by
  §3.4.
- `completedPartialZeta_eq_tsum_fundamentalCone`: on `Re s > 1` it is
  `|d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ N(I)^s / w` times the sum of `|N(x)|^(−s)` over the nonzero points
  of `σ(I)` in Mathlib's fundamental cone: by (5.3) the integral ideals of the class of `I⁻¹` are
  the `a I⁻¹` for `a ∈ I ∖ 0` modulo units, and Mathlib has that bijection through its fundamental
  cone (`fundamentalCone.idealSetEquiv`, `card_isPrincipal_norm_eq_mul_torsion`), each ideal being
  hit `w` times.
- `completedPartialZeta_eq_partialZeta`: on `Re s > 1` it is the completion of Layer 2's partial
  zeta function of the class `c` of the trivial modulus consisting of the ideals `𝔟` with `𝔟 I`
  principal.
- `completedDedekindZeta_eq_sum_completedPartialZeta`: on `Re s > 1`, the completed Dedekind zeta
  function is the sum of `completedPartialZeta K (idealUnit K (rep c) _)` over the ideal classes,
  for any system of class representatives `rep`.
- The completed partial zeta function depends only on the ideal class of `I`: for `x ∈ Kˣ`,
  `completedPartialZeta K (x I) = completedPartialZeta K I`.

*Needs:* §2.1 (`partialZeta`); Mathlib `fundamentalCone.idealSetEquiv`,
`card_isPrincipal_norm_eq_mul_torsion`, `FractionalIdeal.absNorm`, `Gammaℝ`, `Gammaℂ`;
`TauCeti.meromorphicContinuation`.

### 3.3 Unfolding and the Mellin kernel

Define `unitCone K D`, the positive parameters whose surface part lies in `D` (the cone `D × ℝ_+^*`
in the coordinates of Tau Ceti's `surfaceScale`), the constant
`mellinConstant K = 2^(r−1) R / w`, and the Mellin kernel `mellinKernel K D L u`, Neukirch's
`f_D(L, u) = (2^r₂ / w) ∫_D θ_L(x (u/V_L²)^(1/n)) d*x` with `V_L` the covolume of `L`: the theta series
averaged over the fundamental domain at norm `u/V_L²` (Neukirch VII (5.5)). The constants: `2^r₂`
from the Euclidean normalization of the complex coordinates — the gamma integral of
`e^(−π y |z|²)` against `y^(2s) dy/y` is `2^(2s−1) Γ_ℂ(2s) |z|^(−4s)` — `1/w` from the torsion, the
kernel of `u ↦ |u|²`, and the covolume `V_𝔞 = N(𝔞) 2^(−r₂) √|d_K|`, whose square rescales the
parameter so that `|d_K|^(s/2)` and the `N(𝔞)^s` of (5.4) both come out. Prove:

- `summable_integral_unitCone`: for a unit fundamental domain `D` and real `σ > 1`, the integrals
  over the cone of the Gaussians at the nonzero points of `σ(I)` against `N(y)^(σ/2) dy/y` are
  summable: each unit orbit contributes one gamma integral and `∑_𝔟 N𝔟^(−σ)` converges. Over all
  of `R_+^*` the same sum diverges as soon as the unit group is infinite, which is the Epstein
  regression seen from the integral side.
- `completedPartialZeta_eq_integral_unitCone`: on `Re s > 1`, `Z(𝔎, s)` is `2^r₂ / w` times the
  integral over the cone of the theta series of `σ(I)` at the rescaled parameter minus `1`, against
  `N(y)^(s/2) dy/y`: (5.5) before the Mellin substitution.
- `completedPartialZeta_eq_mellin`: on `Re s > 1`,
  `Z(𝔎, s) = ∫_0^∞ (f_D(σ(I), u) − a₀) u^(s/2) du/u`, Mathlib's `mellin` at `s/2`, with
  `a₀ = mellinConstant K` the same for every fundamental domain.
- `continuousOn_mellinKernel`: the kernel of every full lattice is continuous on `(0, ∞)`, because
  `D` is bounded in `S`, so the parameters stay in a compact subset of the open orthant.
- `mellinKernel_sub_const_isBigO` and `mellinKernel_tendsto`: the kernel is `a₀ + O(e^(−c u^(1/n)))`
  at `∞` for some `c > 0`, and tends to `a₀` (Neukirch VII (5.8)).
- `mellinKernel_inv`: for every full lattice `L` and `u > 0`, `f_D(L, 1/u) = u^(1/2) f_{D⁻¹}(L^∨, u)`,
  from `latticeTheta_inv` and the substitution `x ↦ x⁻¹` on `S`, which preserves `d*x` and carries
  `D` to `D⁻¹`; the covolumes `V_L V_{L^∨} = 1` make the two rescalings match (Neukirch VII (5.8)).
- `mellinKernel_dualIdealLattice`: the Euclidean dual of `σ(I)` is the trace dual `σ((I𝔡)⁻¹)`
  moved by Tau Ceti's `traceToEuclidean` (`mixedDual_idealLattice`), which on the parameters is the
  translation by the point `traceShift K = m² / N(m²)^(1/n)` of `S` (`m_w = mult w`,
  `N(m²) = 16^r₂`), so the kernel of the dual lattice is the kernel of `σ(dualUnit K I)` for the
  translated domain; `dualUnit K I` is `(I𝔡)⁻¹`, Mathlib's `FractionalIdeal.dual`, and the
  covolumes `V_{(I𝔡)⁻¹} = V_I⁻¹ 4^(−r₂)` absorb the `16^r₂`.

*Needs:* §§1.2–1.3, §3.2; Tau Ceti `mixedDual`, `mixedDual_idealLattice`,
`covolume_idealLattice_dual`, `covolume_mixedDual`, `IsUnitFundamentalDomain` with its `inv` and
`mul`, `surfaceScale`, `surfacePart`; Mathlib `mixedEmbedding.covolume_idealLattice`, `mellin`,
`FractionalIdeal.dual`.

**Checks.**

- `mellinConstant ℚ = 2^0 · 1 / 2 = 1/2`, the constant term of the kernel `θ(iu)/2` of `ζ`;
  `mellinConstant ℚ(i) = 2^0 · 1 / 4 = 1/4`; over a real quadratic field, `w = 2` and `r = 2`, so
  `mellinConstant K = 2 R / 2 = R`.
- The kernel's constant term is `(2^r₂ / w) vol(D)`, which by §1.3 is `2^(r−1) R / w` for every
  fundamental domain: over `ℚ(i)`, `(2/4) · (1/2) = 1/4`; a kernel without the factor `2^r₂` would
  give `1/8`.

### 3.4 Mellin's principle and the functional equation of the partial zeta functions

Define `dedekindFEPair K hD I`, the instance of Tau Ceti's `FEPairWithLevel` with `f` and `g` the
kernels of `σ(I)` over `D` and of its Euclidean dual over `D⁻¹` on `(0, ∞)`, level `1`, weight
`1/2`, `ε = 1` and both constants `a₀`; each hypothesis of the pair is discharged from a named
property of the kernel (local integrability from `continuousOn_mellinKernel`, the law from
`mellinKernel_inv`, the rapid decay from `mellinKernel_sub_const_isBigO` through Tau Ceti's
`isBigO_rpow_of_isBigO_exp_neg`). Prove `dedekindFEPair_completed`: its `Λ` at `s/2` is
`completedPartialZeta K I s` on `Re s > 1`, by Mathlib's `hasMellin`. Then prove, for every
fractional ideal `I`:

- `meromorphic_completedPartialZeta` and `analyticAt_completedPartialZeta`: `Z(I, ·)` is meromorphic
  on `ℂ` and analytic off `{0, 1}`. The first holds for every canonical continuation, which is in
  meromorphic normal form; the content of the continuation is `completedPartialZeta_eq_tsum`,
  which with `completedPartialZeta_eq_partialZeta` continues the partial zeta functions of the
  trivial modulus (§2.1).
- `completedPartialZeta_one_sub`: `Z(I, 1 − s) = Z((I𝔡)⁻¹, s)` for `s ∉ {0, 1}`, and
  `completedPartialZeta_one_sub_eventuallyEq`: the same as germs at every point (Neukirch VII
  (5.9), `𝔎𝔎' = [𝔡]`), from Tau Ceti's `FEPairWithLevel.Λ_eq` and `Λ_eventuallyEq` with
  `mellinKernel_dualIdealLattice` on the `g` side.
- `tendsto_sub_one_mul_completedPartialZeta`: the residue of `Z(I, ·)` at `s = 1` is
  `2 a₀ = 2^r R / w`, from Mathlib's residue at `k = 1/2` (`Λ_residue_k`) in the variable `s/2`.

*Needs:* §3.3; Tau Ceti `TauCeti.FEPairWithLevel` with `Λ_eq`, `Λ_eventuallyEq`, `hasMellin`,
`Λ_residue_k`, `differentiableAt_Λ`, `TauCeti.isBigO_rpow_of_isBigO_exp_neg`; Mathlib
`WeakFEPair.hasMellin`.

**Checks.**

- Over `ℚ` the residue is `2 · 1/2 = 1`, the residue of `completedRiemannZeta` at `1`; over `ℚ(i)`
  it is `2 · 1/4 = 1/2`; over a real quadratic field it is `2R` for every class.

### 3.5 The continued Dedekind zeta function and its completion

Define `dedekindZetaC K`, the canonical continuation of Mathlib's `dedekindZeta K` from `Re s > 1`,
and `completedDedekindZeta K`, the continuation of `|d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ_K(s)`.
Prove:

- `dedekindZetaC_eq` and `completedDedekindZeta_eq`: agreement with Mathlib's `dedekindZeta` and
  with the completed product on `Re s > 1`. These carry the content of the continuation;
  `meromorphic_dedekindZetaC` and `meromorphic_completedDedekindZeta` below hold for every
  canonical continuation, which is in meromorphic normal form.
- `meromorphic_dedekindZetaC`, `analyticAt_dedekindZetaC` off `s = 1`, and
  `meromorphicOrderAt_dedekindZetaC_one`: a simple pole at `1` and analyticity everywhere else.
- `tendsto_sub_one_mul_dedekindZetaC`: the analytic class number formula
  `Res_(s=1) ζ_K = 2^r₁ (2π)^r₂ h R / (w √|d_K|)` for the named continuation, the constant being
  Mathlib's `dedekindZeta_residue K`, so that its compatibility with Mathlib's one-sided residue
  theorem `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` is the agreement on `Re s > 1`.
- `meromorphic_completedDedekindZeta`, `meromorphicOrderAt_completedDedekindZeta_zero`,
  `meromorphicOrderAt_completedDedekindZeta_one`, `analyticAt_completedDedekindZeta`: simple
  poles of the completed function at `0` and `1` and analyticity elsewhere.
- `tendsto_sub_one_mul_completedDedekindZeta` and `tendsto_mul_completedDedekindZeta_zero`: the
  residues `|d_K|^(1/2) Γ_ℝ(1)^r₁ Γ_ℂ(1)^r₂ κ_K` at `1` and its negative at `0`; by the class number
  formula with `Γ_ℝ(1) = 1` and `Γ_ℂ(1) = 1/π` this is `2^(r₁+r₂) h R / w`, the sum over the `h`
  classes of the residues of §3.4.
- `completedDedekindZeta_one_sub`: `Λ_K(1 − s) = Λ_K(s)` for `s ∉ {0, 1}`; the germ form at every
  point follows from Tau Ceti's `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.
- Uniqueness among continuations with the stated regularity is Tau Ceti's
  `TauCeti.eq_of_meromorphic_of_eqOn_halfPlane`, which compares values where both sides are
  analytic, with `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane` for germs. Every global
  identity of Layers 4 to 6 is stated through these two.
- `dedekindZetaData K`: the card with coefficients the number of integral ideals of each norm,
  conductor `|d_K|`, `r₁` real and `r₂` complex gamma shifts `0`, degree `n`, root number `1`,
  completed function `completedDedekindZeta K` and simple poles at `0` and `1`. It has Dirichlet
  agreement, and `dedekindZetaData_hasContinuation` and `dedekindZetaData_hasFunctionalEquation`
  give the other two predicates.

The downstream contracts include `analyticAt_dedekindZetaC`,
`meromorphicOrderAt_dedekindZetaC_one`, `tendsto_sub_one_mul_dedekindZetaC`, Tau Ceti's
`TauCeti.eq_of_meromorphic_of_eqOn_halfPlane`, the completed-zeta pole and regularity theorems,
and `tendsto_mul_completedDedekindZeta_zero`. Special-value statements use the named continued
functions, never the junk values of raw Dirichlet series outside convergence.
*Needs:* §§3.2–3.4; Tau Ceti `TauCeti.meromorphicContinuation`,
`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`,
`TauCeti.eq_of_meromorphic_of_eqOn_halfPlane`, `AnalyticLFunctionData` with its predicates;
Mathlib `dedekindZeta`, `dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

**Checks.**

- Over `ℚ(i)`, the residue of `completedDedekindZeta` at `1` is `2^(r₁+r₂) h R / w = 2/4 = 1/2`,
  equal to `√4 · Γ_ℂ(1) · Res ζ_K = 2 · (1/π) · (π/4)`; a formula with `w = 2` gives `1`.
- `dedekindZetaData ℚ` has degree `1`, conductor `1`, one real gamma shift `0`; over `ℚ(i)` it has
  degree `2` from one complex gamma factor, and its coefficient at `5` is `2`, the two primes of
  norm `5`.

### 3.6 The behaviour at s = 0

Prove `dedekindZetaC_leading_zero` (Neukirch VII (5.11)): `dedekindZetaC K` has a zero of order
exactly the unit rank `r₁ + r₂ − 1` at `0`, and `ζ_K(s) / s^(r₁+r₂−1) → −h R / w` as `s → 0`,
`s ≠ 0`, with Mathlib's `NumberField.classNumber`, `NumberField.Units.regulator` and
`NumberField.Units.torsionOrder`. It follows from the functional equation and the residue
`2^(r₁+r₂) h R / w` of the completed function at `s = 1`, since `Γ_ℝ(s)^r₁` has a pole of order `r₁`
at `0` and `Γ_ℂ(s)^r₂` one of order `r₂`.
*Needs:* §3.5 (`completedDedekindZeta_one_sub`, `tendsto_sub_one_mul_completedDedekindZeta`);
Mathlib `Gammaℝ`, `Gammaℂ`, `NumberField.classNumber`, `NumberField.Units.regulator`,
`NumberField.Units.torsionOrder`, `NumberField.Units.rank`.

**Checks.**

- Over `ℚ`, `r = 0`, `h = R = 1`, `w = 2`: the order at `0` is `0` and the value is `ζ(0) = −1/2`;
  the sign `+hR/w` would give `+1/2`.
- Over `ℚ(i)`, unit rank `0`, `w = 4`: the value is `ζ(0) L(0, χ₋₄) = (−1/2)(1/2) = −1/4`, which a
  formula with `w = 2`, counting only `±1`, misses by a factor two.
- Over a real quadratic field, unit rank `1`, `w = 2`: a simple zero with derivative `−h log ε / 2`;
  the quadratic factorization gives `ζ(0) L′(0, χ_d)` with `L(0, χ_d) = 0` for the even character
  `χ_d`, so an order read off `r₁ + r₂` instead of `r₁ + r₂ − 1` is wrong already here.

### 3.7 The normalization theorem

The functional equation depends on the additive character, the self-dual measure, the Fourier
sign, the discriminant factor, the factor `2` inside `Γ_ℂ(s) = 2 (2π)^(−s) Γ(s)`, and the
archimedean shifts. Scattered remarks about those choices do not prevent a factor-of-two or an
inverse-discriminant error, so they are collected into the single theorem
`gaussianTheta_mellin_normalization`: the Gaussian is self-dual for `mixedFourier` with the factor
`t^(−n/2)`; the theta series of an ideal lattice transforms with that factor and the covolume (both
of §1.1); every completed partial zeta function is the Mellin transform at `s/2` of the named
kernel `mellinKernel` minus its constant term `mellinConstant`, for every fundamental domain
(Neukirch (5.5)) — not of an unnamed theta function, which would hide the unit quotient; and the
completed zeta function carries exactly `|d_K|^(s/2)`, `Γ_ℝ(s)^r₁` and `Γ_ℂ(s)^r₂`.
*Needs:* §§1.1, 3.3, 3.5 (`completedPartialZeta_eq_mellin`, `completedDedekindZeta_eq`).

**Checks.**

- Over `ℚ(i)`, `|d| = 4` and `r₂ = 1`, so `4^(s/2) Γ_ℂ(s) ζ_{ℚ(i)}(s) = 2 π^(−s) Γ(s) ζ(s) L(s, χ₋₄)`
  on `Re s > 1`, by Legendre's duplication `Γ_ℝ(s) Γ_ℝ(s + 1) = Γ_ℂ(s)` against the quadratic
  factorization. Dropping the factor `2` in `Γ_ℂ`, or writing the conductor power as `|d|^(−s/2)`,
  changes this constant, and the rational case sees neither error.

### Examples

- `K = ℚ`: `completedDedekindZeta ℚ` is Mathlib's `completedRiemannZeta` off the poles at `0` and
  `1`, with residue `1` at `1` and `−1` at `0`; this fixes the real gamma factor and conductor one.
  The kernel's constant term is `1/2`.
- `K = ℚ(i)`: the constant `2 π^(−s) Γ(s)` of §3.7 and the residue `1/2` of §3.5; the kernel's
  constant term is `2^(r−1) R / w = 1/4` (`w = 4`).
- `K` real quadratic, the unit-quotient example. Both fields above have a finite unit group and a
  fundamental domain that is a point; a real quadratic field has unit rank one, `w = 2` and
  regulator `log ε`, so the fundamental domain is one period of the hyperbola `y₁ y₂ = 1` under
  `y ↦ |ε|² y`, of volume `2R`, the kernel's constant term is `R`, and every partial zeta function
  has residue `2R` at `s = 1`, summing over the `h` classes to the residue `2hR` of
  `completedDedekindZeta`; `ζ_K` has a simple zero at `0` (§3.6). ⚠ A construction that
  Mellin-transforms the one-parameter theta series passes the first two examples and fails this
  one, because its lattice-point sum is not summable in positive unit rank
  (`not_summable_absNorm_of_rank_pos`).

### Dependencies

Layer 1: `mixedGaussian`, `archGaussian`, `latticeTheta`, `latticeTheta_inv`,
`latticeTheta_unitScale`, `surfaceHaar`, `surfaceHaar_of_isUnitFundamentalDomain`. Layer 2:
`partialZeta`. Tau Ceti: `TauCeti.FEPairWithLevel`, `mixedDual` with `mixedDual_idealLattice`,
`IsUnitFundamentalDomain`, `normOneSurface`, `surfaceScale`, `surfacePart`, `unitScale`,
`archNorm`, the uniqueness theorems for meromorphic continuation, `AnalyticLFunctionData`.
Mathlib: `dedekindZeta`, `dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`,
`fundamentalCone.idealSetEquiv`, `NumberField.classNumber`, `NumberField.Units.regulator`,
`NumberField.Units.torsionOrder`, `NumberField.Units.rank`.

## Layer 4: Dirichlet L-functions and factorizations

The analytic card of a primitive Dirichlet character is Tau Ceti's `dirichletData`, which keeps
Mathlib's continued function: conductor `N`, one real gamma shift equal to the parity, Mathlib's
Gauss-sum root number, and the completed function `N^(s/2)` times Mathlib's
`DirichletCharacter.completedLFunction`, with its three predicates (supplier contracts). This
layer factors `ζ_K` for quadratic and cyclotomic fields at the level of continued functions.

At the continued-function level these are identities of meromorphic functions, not of total
representatives. Both sides have a simple pole at `s = 1` — the trivial character contributes
`riemannZeta` — and Mathlib's value there is junk, so each factorization is stated on `Re s > 1`,
as an equality of germs at every point, and pointwise away from `s = 1`. The germ statement is
what uniqueness of meromorphic continuation produces from the first, and the pointwise statement is
read off it where both sides are analytic.

### 4.1 The quadratic factorization

Prove `dedekindZetaC_quadratic`: for a quadratic field `F` there is a primitive Dirichlet
character `χ` such that `dedekindZetaC F = ζ · L(χ)` on `Re s > 1`, as germs at every point, and
pointwise for `s ≠ 1`. Tau Ceti's `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`
gives the half-plane identity for Mathlib's `dedekindZeta`, with `χ` the quadratic character of
the discriminant.
*Needs:* §3.5 (`dedekindZetaC`, `dedekindZetaC_eq`, `meromorphic_dedekindZetaC`); Tau Ceti
`TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`,
`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`; Mathlib `riemannZeta`,
`DirichletCharacter.LFunction`.

**Checks.**

- `ℚ(i)` with `χ₄`: at the ramified prime `2` the left side has the one factor `(1 − 2^(−s))⁻¹`,
  `ζ` supplies it and `L(χ₄)` has factor `1`; at `p = 5` the two primes of norm `5` give
  `(1 − 5^(−s))⁻²`, and at `p = 3` the one prime of norm `9` gives `(1 − 9^(−s))⁻¹`, matching
  `(1 − 3^(−s))⁻¹ (1 + 3^(−s))⁻¹`.

### 4.2 The cyclotomic factorizations

Prove `dedekindZetaC_cyclotomic`: for the cyclotomic field `F = ℚ(ζ_n)` and, for each Dirichlet
character `χ` modulo `n`, a primitive character `χ'` of level `m_χ ∣ n` inducing it, `dedekindZetaC F`
is the product of the `L(χ')` on `Re s > 1` (Washington, Theorem 4.3, for the field of a group of
Dirichlet characters), as germs, and pointwise for `s ≠ 1`; this primitive form has no correction
factor. Prove `dedekindZetaC_cyclotomic_imprimitive`: with the level
characters `χ` themselves the missing Euler factors occur with the inverse correction forced by
`L(χ, s) = L(χ', s) ∏_{p ∣ n, p ∤ m_χ} (1 − χ'(p) p^(−s))`, so `dedekindZetaC F` times
`∏_χ ∏_{p ∣ n, p ∤ m_χ} (1 − χ'(p) p^(−s))` is `∏_χ L(χ, s)`, on `Re s > 1` and as germs.
*Needs:* §3.5; Tau Ceti `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`; Mathlib
`DirichletCharacter.LFunction`, `DirichletCharacter.changeLevel`, `IsCyclotomicExtension`, and the
decomposition of rational primes in cyclotomic fields.

**Checks.**

- The characters modulo `4` with `ℚ(i)`: the trivial character of level `4` has
  `L = ζ(s)(1 − 2^(−s))`, so the imprimitive form multiplies `ζ_{ℚ(i)}` by `1 − 2^(−s)`; the
  correction placed on the other side, or with the inverse factor, is off by `(1 − 2^(−s))²`.
- `ℚ(ζ₅)`, primitive form: the trivial character has conductor `1` and the other three have
  conductor `5`; the totally ramified prime `5` contributes `(1 − 5^(−s))⁻¹` on the left, supplied
  by `ζ` alone, the three nontrivial L-functions having factor `1` there.

### Examples

- `ζ_{ℚ(i)}(s) = ζ(s) L(s, χ₋₄)`, including the ramified prime `2`.
- The primitive character `χ₄` modulo `4` is odd: Tau Ceti's card has one real gamma shift `1`,
  conductor `4`, Gauss sum `i − (−i) = 2i` and root number `2i/(i √4) = 1`; a card with shift `0`,
  ignoring the parity, would fail Dirichlet agreement, since Mathlib's completed function carries
  `Γ_ℝ(s + 1)`.
- The quadratic character modulo `5` is even: shift `0`, Gauss sum `√5`, root number `1`. Mathlib's
  `Λ_M(χ, 1 − s) = 5^(s − 1/2) Λ_M(χ, s)` is symmetric only after the factor `5^(s/2)`, so a card
  that omitted the conductor power would fail the functional equation. As a ray class character it
  is the unique nontrivial character of the ray class group of Tau Ceti's `ratFiniteModulus 5`,
  which is `(ℤ/5)ˣ/{±1}`, of order `2`; a definition that forgot the sign quotient would see the
  four characters of `(ℤ/5)ˣ`, two of them odd.
- The trivial character modulo `1` has conductor `1`, shift `0`, root number `1`, completed function
  `completedRiemannZeta` and simple poles at `0` and `1`: its card is `riemannZetaData` (Tau Ceti's
  `dirichletData_modOne`); a card without the poles at `N = 1` would fail the continuation
  predicate.

### Dependencies

Tau Ceti: `dirichletData` and its predicates, `dedekindZeta_eq_riemannZeta_mul_LFunction`, the
uniqueness theorems for meromorphic continuation. Mathlib: `DirichletCharacter.LFunction`,
`DirichletCharacter.completedLFunction`, `DirichletCharacter.changeLevel`, `riemannZeta`,
`IsCyclotomicExtension`. Layer 3: `dedekindZetaC` and its continuation. Layer 0 is not needed.

## Layer 5: finite-order Hecke L-functions

For a ray class character `χ` of a modulus `𝔪`, Tau Ceti supplies the unitary ideal weight
`RayClassCharacter.toUnitaryIdealWeight χ` — the character of the ray class at an ideal prime to
`𝔪₀`, read through the prime-to carrier, and `0` elsewhere — and the presented L-function
`TauCeti.LFunctions.heckeLFunctionC χ`, the canonical continuation of its norm-regrouped series
from `Re s > 1`. It also supplies the primitive carrier `PrimitiveRayClassCharacter`, built from the
supplier's conductor and its universal property (`PrimitiveRayClassCharacter.of`, the inverse at
the same conductor); the Euler factors `RayClassCharacter.eulerCorrection χ 𝔫` deleted by
presenting `χ` at a larger modulus `𝔫`,
`∏_{𝔭 ∣ 𝔫₀, 𝔭 ∤ 𝔪₀} (1 − χ([𝔭]) N𝔭^(−s))`, read through the weight so that no junk class is read
at a bad prime, and equal to `finiteEulerCorrection` for the trivial character; the comparisons of
a presented series with an induced one and with the primitive one, on `Re s > 1` and as germs;
the cancellation of a nontrivial character, which continues its series to `Re s > 1 − 1/n`, a
half-plane containing `Re s = 1`; and the orthogonality relation for the series (supplier
contracts). The presented series depends on the presentation, the primes dividing `𝔪₀` being
omitted; the completion, Gauss sum, root number and card take the primitive carrier.

### 5.1 The presented series on the plane

Prove `heckeLFunctionC_eq`: on `Re s > 1`, `heckeLFunctionC χ` is the norm-regrouped series of
`χ.toUnitaryIdealWeight`, with the supplier's Euler product there. This is the statement that the
presented series continues to a meromorphic function on the plane.
*Route.* By Tau Ceti's `heckeLFunctionC_eq_primitive` the presented series is the primitive
series times the entire factor `eulerCorrection`, and the primitive series is the completed
function of §5.4 divided by its conductor power and gamma factor, which are meromorphic.
*Needs:* §5.4 (`completedHeckeLFunction`, `heckeData` with its continuation); Tau Ceti
`heckeLFunctionC`, `RayClassCharacter.toUnitaryIdealWeight`, `heckeLFunctionC_eq_primitive`,
`differentiable_eulerCorrection`, `meromorphicContinuation_eqOn`, `EulerProductData`.

**Checks.**

- The odd character mod `4∞` of `ℚ`: the weight is `χ₄(n)` at `(n)` prime to `2` by the supplier's
  `ratDirichletEquiv_absNorm`, so `−1` at `(3)` and `1` at `(5)`, and `0` at `(2)`; the series is
  `L(s, χ₄)`.
- The trivial character at `ratModulus 4`: the weight is `0` at `(2)` and `1` at every odd ideal, so
  the series is `ζ(s)(1 − 2^(−s))`, not `ζ(s)`.
- The trivial character at `Modulus.one K`: the series is `dedekindZetaC K` on `Re s > 1`; at a
  modulus with a prime `𝔭` in its support the weight is `0` at `𝔭` and the series loses exactly the
  Euler factor at `𝔭`.

### 5.2 Orthogonality

Prove `partialZeta_eq_sum_heckeLFunctionC`, the orthogonality reconstruction that recovers each
partial zeta function from the character L-functions:
`#Cl_𝔪 · ζ(s, c) = ∑_χ conj(χ(c)) L(s, χ)` on `Re s > 1`, the sum over the characters of the finite
abelian group `Cl_𝔪`. ⚠ Both sides run over the ideals prime to the modulus, so no Euler
correction appears; the correction appears only when the principal-character term is rewritten as
`ζ_K`.
*Needs:* §2.1 (`partialZeta_eq_lSeries`), §5.1 (`heckeLFunctionC_eq`); Tau Ceti
`sum_inv_mul_LSeries_toUnitaryIdealWeight`, `finite_rayClassGroup`.

**Checks.**

- Over `ℚ` at `ratModulus 4`, with `χ₀` trivial and `χ₄` odd: `2 ζ(s, [1]) = ζ(s)(1 − 2^(−s)) + L(s, χ₄)`
  and `2 ζ(s, [3]) = ζ(s)(1 − 2^(−s)) − L(s, χ₄)`; the principal term carries the factor
  `1 − 2^(−s)`, not `ζ(s)` alone.

### 5.3 Gauss sums

Define `gaussSum K ψ ρ y`, Neukirch's `τ_𝔪(χ_f, y) = ∑_{x mod 𝔪₀, (x, 𝔪₀) = 1} χ_f(x) e^(2πi Tr(xy))`
(Neukirch VII (6.3)), for a primitive ray class character `ψ` of conductor `𝔪`, a character `ρ` of
the residue ring `𝓞/𝔪₀` (Mathlib's `MulChar`) and `y ∈ K`: a finite sum over the residue units,
the character read on the residue class itself and only the trace needing a representative. The
theorems below take for `ρ` the **residue character of `ψ`**: for `a` prime to `𝔪₀`,
`ρ(a mod 𝔪₀) = ψ([(a)]) ∏_{w ∈ 𝔪∞} sgn(w(a))`. It is Hecke's residue character `χ_f` of the
finite-order presentation of `ψ` (§6.7, `existsUnique_residueCharacter`), whose archimedean value at
`a` is that product of signs. ⚠ It is not the coefficient of the presented series at a
representative: that coefficient is `0` at the element `0`, which may represent the one residue
class at conductor one, where (6.4) at `a = 0` would then read `1 = 0`. Prove:

- `gaussSum_eq_sum`: for `y ∈ 𝔪₀⁻¹𝔡⁻¹` — the dual of `𝔪₀`, on which `Tr(xy) mod ℤ` depends only on
  `x mod 𝔪₀` — any system of representatives gives the sum.
- `gaussSum_mul` (Neukirch (6.4), first half): for `y ∈ 𝔪₀⁻¹𝔡⁻¹` and every `a ∈ 𝓞`,
  `τ(ρ, a y) = conj(ρ(a)) τ(ρ, y)`. Reindexing by `x ↦ x a⁻¹` produces the **inverse** value,
  Mathlib's `gaussSum_mulShift_eq` convention, and the equation covers the vanishing case
  `(a, 𝔪₀) ≠ 1`, where `a` is not a unit mod `𝔪₀` and `ρ` vanishes, by primitivity.
- `norm_gaussSum` (Neukirch (6.4), second half): `|τ(ρ, y)| = √N(𝔪₀)` when moreover the integral
  ideal `y 𝔪₀ 𝔡` is prime to `𝔪₀`.
- `gaussSum_of_finitePart_eq_top`: at conductor one the residue ring has one element, a unit where
  every character is `1`, and the Gauss sum is `1` at every `y ∈ 𝔡⁻¹`.

The root number is pinned by the transformation law of the kernel (§6.8), of which Neukirch's
`W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f)/√N(𝔪)` (VII (8.5), his `τ(χ_f)` being the Gauss sum of
(7.4) in ideal-number normalization) is the evaluation.
*Needs:* Tau Ceti `PrimitiveRayClassCharacter`, `idealClass`; Mathlib `MulChar`, `Algebra.trace`,
`FractionalIdeal.dual`, `differentIdeal`, `gaussSum_mulShift_eq`. It needs nothing from the
kernel.

**Checks.**

- Conductor one: the residue ring has one element and the Gauss sum is `1`; a sum read through the
  coefficient at the representative `0` gives `0`.
- The odd character mod `4∞`, `y = 1/4`: `τ = χ₄(1) e^(2πi/4) + χ₄(3) e^(6πi/4) = i − (−i) = 2i`, of
  absolute value `2 = √4`, with `y 𝔪₀ 𝔡 = (1)` prime to `4`; here `ρ(3) = ψ([(3)]) sgn(3) = χ₄(3) = −1`.
- The even character mod `5`, `y = 1/5`: `τ = √5`, and at `a = 2`, `τ(ρ, 2/5) = conj(ρ(2)) τ = −√5`.
  The conjugation is invisible for a quadratic character: an even primitive character of order `3`
  modulo `7` with `ρ(3) = ω` has `τ(ρ, 3/7) = ω⁻¹ τ(ρ, 1/7)`.
- Without the domain hypothesis the vanishing case is false: over `ℚ` with the even character mod
  `5`, `a = 5` and `y = 1/25 ∉ (1/5)ℤ` would force `τ(ρ, 1/5) = 0`, against `|τ(ρ, 1/5)| = √5`.

### 5.4 The completed L-function and its functional equation

Define the analytic card `heckeData K ψ` of a primitive ray class character `ψ` of conductor `𝔣`:
the card of Tau Ceti's `AnalyticLFunctionData.ofSeries` with coefficients the norm-regrouped
weight, conductor `|d_K| N(𝔣₀)`, one real gamma shift per real place equal to the parity there of
the Hecke character `HeckeCharacter.ofRayClassCharacter`, one complex gamma shift `0` per complex
place, and simple poles at `0` and `1` exactly for the trivial character. Its completed function
is `completedHeckeLFunction K ψ` and its root number `heckeRootNumber K ψ`. The card has absolute
degree `n`, from its `r₁` real and `r₂` complex gamma factors; keep this distinct from the
relative degree one of a character of `K`, a different invariant. Prove:

- `differentiable_completedHeckeLFunction`: for `ψ` nontrivial the completed function is entire.
- `norm_heckeRootNumber`: `|W(ψ)| = 1`.
- `completedHeckeLFunction_one_sub`: for `ψ` nontrivial,
  `Λ(ψ, s) = W(ψ) Λ(ψ⁻¹, 1 − s)` at every `s`, `ψ⁻¹` the inverse primitive character (Hecke,
  *Eine neue Art von Zetafunktionen II*, §6, (45), p. 35; Neukirch VII (8.5)).
- `completedHeckeLFunction_one_sub_eventuallyEq`: the same as germs at every point, for every `ψ`;
  this covers the trivial primitive character, whose completed function is `completedDedekindZeta`
  with its two poles.
- `exists_mellin_completedHeckeLFunction`: on `Re s > 1` the completed function is a Mellin
  integral `∫_0^∞ θ(t) t^s dt/t`. The witness is not left to the existential: it is
  `θ(t) = 2 t^(Tr p / n) (F(t²) − a₀)` with `F` the total kernel of the finite-order presentation
  (`completedHeckeLFunction_eq_mellin`, §6.10); the existential is kept because the zeros roadmap
  consumes it by name.

Zero-distribution consumers use these named theorems rather than recover them from the
construction.
*Needs:* §5.3; Layer 0 (`AnalyticLFunctionData.ofSeries` and its predicates); for the
continuation, the root number and the functional equation, §§6.9–6.10
(`grossencharacterFEPair`, `completedHeckeLFunction_eq_mellin`); Tau Ceti
`PrimitiveRayClassCharacter`, `HeckeCharacter.ofRayClassCharacter`.

**Checks.**

- The card of the odd character mod `4∞`: conductor `|d_ℚ| · 4 = 4`, one real gamma shift `1`, root
  number `1`, the fields of Tau Ceti's `dirichletData` for `χ₄`.
- Over `ℚ(i)` every card has one complex gamma factor and degree `2`, where the relative degree of
  a character is `1`.
- The trivial character presented at `ratModulus 4` has primitive character the trivial character
  of conductor `Modulus.one ℚ`, and its completed function is `completedRiemannZeta` off the
  poles; a card read at the presentation modulus would record `(4)·∞`, conductor `4` and the gamma
  shift of an odd character.

### Examples

These examples exercise the supplier's primitive carrier and Euler corrections together with the
cards of this layer.

- The trivial character presented at `ratModulus 4` is imprimitive, its conductor is
  `Modulus.one ℚ` (the supplier's `conductor_one`), and its presented series is `ζ(s)(1 − 2^(−s))`:
  the correction to the primitive series `dedekindZetaC` is `finiteEulerCorrection`, the product of
  Layer 2, not a second notion, and it has no card with the presentation modulus as conductor.
- The odd character mod `4∞` is primitive of conductor `ratModulus 4`, the real place included (the
  supplier's `conductor_finitePart_eq_span` and `conductor_infinitePart_eq_empty_iff_even`); its card
  has conductor `4`, real gamma shift `1` and root number `1`, and `L(1, χ₄) = π/4`.
- The even character `χ` mod `5` presented at `ratFiniteModulus 10` has conductor
  `ratFiniteModulus 5`, without the real place, since the conductor divides the presentation (the
  supplier's `conductor_dvd_iff`), and its presented series differs from the primitive one by
  `eulerCorrection = 1 − χ(2) 2^(−s) = 1 + 2^(−s)`, since `2` is not a square mod `5`; a correction
  read with the presented character, which vanishes at `2`, would be `1`. Presented at
  `ratFiniteModulus 15` the correction is `1 − χ(3) 3^(−s) = 1 + 3^(−s)`, and the prime `5` dividing
  the conductor contributes nothing.
- The inverse of the order-three character modulo `7` is its conjugate, of the same conductor; the
  inverse of a quadratic character is itself.

### Dependencies

Tau Ceti: `RayClassCharacter.toUnitaryIdealWeight`, `heckeLFunctionC` with its comparisons,
`PrimitiveRayClassCharacter`, `RayClassCharacter.eulerCorrection`, the orthogonality of the
series, `hasCancellation_toUnitaryIdealWeight` with `continuedLFunctionOfWeight`,
`AnalyticLFunctionData.ofSeries`, the supplier's conductor declarations, `ratModulus`,
`ratFiniteModulus`, `ratDirichletEquiv`. Mathlib: `MulChar`, `Algebra.trace`,
`gaussSum_mulShift_eq`. Layer 0 (`ofSeries`), Layer 2 (`partialZeta`), Layer 3 (`dedekindZetaC`),
and, for the continuation and functional equation of §§5.1 and 5.4 only, the kernel of Layer 6
(§§6.9–6.10).

## Layer 6: Grossencharacters

This layer presents the algebraic Hecke characters — Weil's type `A₀`, the idele class characters
whose archimedean part has integral exponents — at a modulus, and builds their theta kernels and
completed L-functions (Neukirch VII (6.1)–(6.4), (6.13)–(6.14), (7.4)–(7.8), (8.2)–(8.6)). It
consumes Tau Ceti's `HeckeCharacter K` with its shift, unitary part and infinity type, and the
idelic vocabulary that pins a character's finite behaviour: the idele group, the archimedean
coordinates, the congruence subgroups and the local components `HeckeCharacter.finiteComponent`.

### 6.1 Presentations of algebraic Hecke characters

Define a presentation `Grossencharacter K 𝔪` at the modulus `𝔪` of an algebraic Hecke character,
with the idele class character `toHeckeCharacter` as its primary object; every other field is
pinned to it by an equation:

- `unitaryWeight`, a unitary ideal weight, is the ideal weight induced by the unitary part: at a
  prime `𝔭 ∤ 𝔪₀` it is the supplier's local component `unitaryPart.finiteComponent 𝔭` at any
  uniformizer of `K_𝔭`, which is the supplier's `unitaryPart.idealCharacter` at `𝔭` by
  `idealCharacter_apply_prime`, and it vanishes at the ideals not prime to `𝔪`. Complete
  multiplicativity fixes it everywhere else, so it is the supplier's ideal character of the unitary
  part, extended by zero at the primes of `𝔪`. The value does not depend on the uniformizer: two
  differ by a unit at `𝔭`, on which a character presented at `𝔪` is trivial.
- `infinityType`, an algebraic infinity type `(K →+* ℂ) → ℤ`, is the archimedean restriction: it
  agrees with the supplier's `HeckeCharacter.infinityType` on the identity component, through the
  supplier's `ContinuousInfinityType.AgreesOnIdentityComponent` — exactly a witness of
  `HeckeCharacter.IsAlgebraic` — and on the nose at the real places outside `𝔪`, where no sign twist
  is presented.
- `𝔪` is a modulus of definition: the character is trivial on the finite part of
  `ideleCongruenceSubgroup 𝔪`, the ideles of that subgroup with all archimedean coordinates `1`.
  ⚠ Not on the whole subgroup, which contains the archimedean identity components and would force
  finite order.

The real shift is not a field: `Grossencharacter.idealShift` is the negative of the supplier's
`HeckeCharacter.shift` of the primary object (Convention 10). There is no finite-character field.
Prove `Grossencharacter.ext`: a presentation is determined by its Hecke character, the weight being
forced by its two pins through complete multiplicativity and the infinity type by
`infinityType_eq` and the supplier's `AlgebraicInfinityType.toContinuous_injective`. Prove
`exists_inverse`: the inverse presentation exists, with the inverse Hecke character, the conjugate
unitary weight and the negated infinity type. If `χ = χ_u N^σ` then `χ⁻¹ = conj(χ_u) N^(−σ)`, of
shift `−σ`; the functional equation reflects against the inverse, not simply the conjugate. Prove
`exists_ofRayClassCharacter`: a ray class character `η` of `𝔪` has a presentation whose three pins
are the supplier's `HeckeCharacter.ofRayClassCharacter`, the ray class weight
`η.toUnitaryIdealWeight` and the zero infinity type. By `Grossencharacter.ext` both presentations
are unique, and the inverse of the inverse is the original presentation.
*Needs:* Tau Ceti `HeckeCharacter`, `HeckeCharacter.unitaryPart`, `HeckeCharacter.finiteComponent`,
`HeckeCharacter.idealCharacter_apply_prime`, `HeckeCharacter.infinityType`,
`ContinuousInfinityType.AgreesOnIdentityComponent`, `AlgebraicInfinityType.toContinuous`,
`AlgebraicInfinityType.toContinuous_injective`, `ideleCongruenceSubgroup`,
`HeckeCharacter.ofRayClassCharacter`, `UnitaryIdealWeight`.

**Checks.**

- The presentation of the trivial character of `Modulus.one K` has the trivial Hecke character,
  weight `1` on nonzero ideals, infinity type `0` and shift `0`.
- The presentation of `‖·‖^(−m)` over `ℚ` (§6.3) has supplier shift `−m`, ideal-side shift `m`, and
  L-function `ζ(s − m)`; with the supplier's shift in the prime-idele equation, `χ(π_p) = p^m` would
  force `χ_u(p) = p^(2m)`, which is not unitary.
- The angular characters of `ℚ(i)` (§7.4) have exponents `−2k` and `2k`, so for `k ≠ 0` they are of
  infinite order and have no ray-class presentation.
- Non-example: the supplier's `normCharacter K t` with `t ≠ 0` is not algebraic
  (`not_isAlgebraic_normCharacter`), so it has no presentation; an interface that accepted it would
  need the real frequency `t` in its gamma shifts.

### 6.2 Finite-order presentations

Prove `exists_rayClassCharacter_of_isFiniteOrder`: a presentation at `𝔪` of a finite-order Hecke
character is the presentation of a ray class character of `𝔪`; the finite pin makes the character
trivial on the finite congruence subgroup, and finite order together with the real-place pin makes
it trivial on the archimedean part, so it factors through the ray class group. Then the weight is
the ray class weight (`unitaryWeight_eq_rayClassIdealWeight`), the infinity type is zero
(`infinityType_eq_zero_of_isFiniteOrder`, from the supplier's `exists_finiteOrderInfinityType`),
and the shift is zero (`idealShift_eq_zero_of_isFiniteOrder` and, for a presentation of a ray class
character, `ofRayClassCharacter_idealShift`, both closed by the supplier's
`isFiniteOrder_iff_exists_rayClassCharacter` and `shift_ofRayClassCharacter`). Prove
`lFunctionC_ofRayClassCharacter`: the presentation of a ray class character `η` has the ray class
L-function `heckeLFunctionC η` of Layer 5, on `Re s > 1` and as germs. ⚠ An infinite-order
character has no ray-class presentation at any modulus: the angular characters of `ℚ(i)` are
unramified and nontrivial, and the only ray class character of the trivial modulus of `ℚ(i)` is
trivial.
*Needs:* §6.1, §6.5 (`lFunctionC`); Tau Ceti `HeckeCharacter.IsFiniteOrder`,
`HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter`,
`HeckeCharacter.shift_ofRayClassCharacter`, `HeckeCharacter.ofRayClassCharacter_apply`,
`exists_finiteOrderInfinityType`, `HeckeCharacter.toUnitaryIdealWeightAt`, `heckeLFunctionC`.

### 6.3 The sign of the shift, and the norm powers of ℚ

The supplier fixes its shift idelically by `|χ| = ‖·‖^shift` (Tau Ceti's
`HeckeCharacter.norm_apply_eq_rpow_shift`, with `shift_normPow`). This roadmap's L-functions are
written in the ideal-side convention `χ = χ_u N^σ`, fixed at a prime idele by
`toHeckeCharacter_primeIdele`: at a uniformizer `π_v` of `K_v`, `v ∤ 𝔪₀`, the local component of
the primary object is `χ(π_v) = χ_u(𝔭) N𝔭^σ` with `σ = idealShift`. Since `‖π_v‖ = N𝔭⁻¹`, that
`σ` is the **negative** of the supplier's shift. Every formula with `s − σ` — the coefficients
`lFunctionC_eq`, the recentering in `completed`, the polar divisors of `completed_one_sub` — reads
the ideal-side shift; the inverse presentation has ideal-side shift `−σ` and the angular characters
have `0`. ⚠ The supplier's shift in its place makes the prime-idele equation false at once: `‖·‖`
over `ℚ` has shift `1` and trivial unitary part, and the equation would read `1/p = p`.

The integral norm powers of `ℚ` are presented at the modulus `∞`: `exists_ratNormPow` gives a
presentation of the idele class character `‖·‖^(−m)`, whose value at a prime idele at `p` is
`p^m`; the theorems take any such presentation, which is unique by `Grossencharacter.ext`. Prove
that its supplier shift is `−m` (`ratNormPow_shift`), its ideal-side shift is `m`
(`ratNormPow_idealShift`), and its L-function is `ζ(s − m)` on `Re s > 1 + m`
(`lFunctionC_ratNormPow`). ⚠ The real place is needed when `m` is odd: the archimedean restriction
`|x|^(−m)` is even while the algebraic exponent `−m` is odd, so the real-place pin fails at the
trivial modulus.
*Needs:* §6.1; Tau Ceti `HeckeCharacter.shift`, `HeckeCharacter.norm_apply_eq_rpow_shift`,
`shift_normPow`, `HeckeCharacter.finiteComponent`, `narrowModulus`, `ideleNorm`;
Mathlib `riemannZeta`.

### 6.4 Hecke's unit relation

Prove `compatibility`, Hecke's unit relation as a theorem with the sign the primary object forces:
for `a ∈ 𝓞_K` generating `x ∈ Kˣ` with `x ≡ 1 mod* 𝔪` — the supplier's `IsCongrOne`, positivity at
the real places of `𝔪` included — the full weight `χ_u((a)) N(a)^σ` is the **inverse** of the
archimedean value `∏_τ τ(a)^(n_τ)`:

```text
χ_u((a)) · N(a)^σ · ∏_τ τ(a)^(n_τ) = 1        (compatibility),
```

and `compatibility_inv` solves it for the finite value. It follows from triviality on the
principal idele of `a`: its finite coordinates evaluate, by the prime-idele equation and the
modulus pin, to `χ_u((a)) N(a)^σ`, its archimedean coordinates, by the two archimedean pins, to
`∏_τ τ(a)^(n_τ)`, and the product is `1`. This is Neukirch VII (6.13): the archimedean component of
the idele class character is `b ↦ b⁻¹` against Hecke's `χ_∞`, so Hecke's classical infinity type is
`−n` and his `χ((a)) = χ_f(a) χ_∞(a)` reads `χ_u((a)) N(a)^σ = ∏_τ τ(a)^(−n_τ)` on `a ≡ 1 mod* 𝔪`.
⚠ The relation holds only for `a ≡ 1 mod* 𝔪`: for other `a` the two sides differ by the finite
character of `(𝓞/𝔪₀)ˣ × {±1}^𝔪∞` that the relation determines, and a relation quantified over all
`a` leaves only the unramified characters. Keep unitary and full weights separate: a law mixing a
unitary ideal factor with a nonunitary archimedean factor is false when the shift is nonzero.
*Needs:* §§6.1, 6.3 (`toHeckeCharacter_primeIdele`); Tau Ceti `IsCongrOne`,
`idealCharacter_apply_toPrincipalIdeal`.

**Checks.**

- ⚠ The law with `∏_τ τ(a)^(n_τ)` on the right is false for every nonreal angular character,
  already at shift zero: over `ℚ(i)`, for `(α) ↦ (α/ᾱ)^(2k)` and `a = 2 + i`, the finite value is
  `((2 + i)/(2 − i))^(2k) = ((3 + 4i)/5)^(2k)` and the archimedean value is
  `(2 + i)^(−2k) (2 − i)^(2k) = ((3 + 4i)/5)^(−2k)`, unequal for `k ≠ 0` since `(3 + 4i)/5` is not a
  root of unity. A real-valued or finite-order example cannot see the inversion, because for those
  the two laws coincide.

### 6.5 The presented L-function and the conductor

Define `lFunctionC K χ`, the continuation from `Re s > 1 + σ` of the norm-regrouped series of the
unitary weight at `s − σ`. Prove `lFunctionC_eq`: on that half-plane it is
`∑ χ_u(𝔞) N𝔞^(σ − s)` over the ideals prime to `𝔪`, with the supplier's Euler factors at `s − σ`;
and `meromorphic_lFunctionC`, which holds for every canonical continuation (the content is
`lFunctionC_eq`). Define the conductor `primitiveConductor K χ` (Convention 12): finite
part the supplier's `HeckeCharacter.finiteConductor` of the primary object, `∏_v v^(a_v)` with
`a_v` the least `n` for which the local component is trivial on the `n`-th unit group, and infinite
part the real places at which the parity of the archimedean restriction differs from that of the
algebraic exponent. Prove its universal property `primitiveConductor_dvd_iff`: a modulus `𝔫`
presents the same Hecke character exactly when the conductor divides `𝔫` (the finite half is the
supplier's `pow_dvd_finiteConductor_iff`, the infinite half the real-place pin), with
`primitiveConductor_dvd` and `primitiveConductor_congr`: the conductor is a function of the Hecke
character alone. Prove `lFunctionC_eq_primitive`: for the presentation `χ₀` of the same Hecke
character at the conductor, the presented series is the primitive series times
`∏_{𝔭 ∣ 𝔪₀, 𝔭 ∤ 𝔣₀} (1 − χ₀,u(𝔭) N𝔭^(σ − s))`, on the half-plane and as germs.
*Needs:* §6.1; Tau Ceti `TauCeti.meromorphicContinuation`, `normCoeff`, `EulerProductData`,
`HeckeCharacter.finiteConductor`, `HeckeCharacter.pow_dvd_finiteConductor_iff`,
`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`; for the continuation, §6.9.

### 6.6 The analytic card and the completions

Define the analytic card `grossencharacterData K χ`, the card of the **unitary part** at the
conductor, pinned field by field: coefficients the norm-regrouped primitive unitary weight — the
supplier's `HeckeCharacter.idealCharacter` of the unitary part on the ideals prime to the finite
conductor `𝔣₀`, extended by `0` — conductor `|d_K| N(𝔣₀)`, one real gamma shift per real place
equal to the parity of the archimedean restriction there (⚠ not the parity of the algebraic
exponent, which `N^m` with `m` odd distinguishes), one complex gamma shift `|n_σ − n_σ̄|/2` per
complex place, and simple poles at `0` and `1` exactly when the unitary part is trivial. Its
completed function and root number are those of Tau Ceti's `AnalyticLFunctionData.ofSeries`, and
they define `unitaryCompletion K χ` and `rootNumber K χ`. Define the full completion `completed K χ`
by recentering, `Λ(χ, s) = Λ_unit(χ, s − σ)`: with primitive conductor `A`, its conductor power is
`A^((s−σ)/2)` and its gamma factor is evaluated at `s − σ`. Prove:

- `grossencharacterData_conductor`: the conductor is `|d_K|` times the norm of the finite part of
  `primitiveConductor K χ`.
- `grossencharacterData_congr`, `unitaryCompletion_congr`, `rootNumber_congr`: the card, the unitary
  completion and the root number are functions of the Hecke character alone; `lFunctionC` is not,
  by `lFunctionC_eq_primitive`.
- `grossencharacterData_hasDirichletAgreement`.
- `norm_rootNumber`: `|W(χ)| = 1`; `rootNumber_inv`: the presentation of the inverse Hecke
  character has root number `W(χ)⁻¹`, which for the unitary part is `conj W(χ)`; applied twice it
  returns `W(χ)`.

⚠ The full completion is not the completed function of an analytic card when the shift is
nonzero: its critical line is `Re s = 1/2 + σ`, and its equation (`completed_one_sub`, §6.9)
relates `Λ(χ, s)` to `Λ(χ⁻¹, 1 − s)`, the full completion of the inverse, whose shift is `−σ` and
whose critical line is `Re s = 1/2 − σ`.
*Needs:* §§6.1, 6.5; Layer 0 (`AnalyticLFunctionData.ofSeries`, `HasDirichletAgreement`); Tau Ceti
`HeckeCharacter.idealCharacter`, `HeckeCharacter.finiteConductor`, `ContinuousInfinityType`; for
`norm_rootNumber` and `rootNumber_inv`, §6.9.

### 6.7 The finite character, the residue character and the harmonic polynomial

Derive Hecke's finite character from the primary object instead of storing it (Neukirch VII
(6.1)–(6.4)). Define the full archimedean value `archimedeanValue K χ x`: the algebraic
`∏_τ τ(x)^(n_τ)` times, at each real place, the sign `sgn(τ_w x)^(ε_w − n_w)` by which the actual
parity `ε_w` of the archimedean restriction differs from the parity of the algebraic exponent,
trivial outside `𝔪∞` by the real-place pin (`archimedeanValue_eq_of_isCongrOne`: on `a ≡ 1 mod* 𝔪`
it is the algebraic value). Define `finiteCharacter K χ a = χ_u((a)) N(a)^σ · χ_∞(a)` for `a ∈ 𝓞`,
with `χ_∞` that full archimedean value. ⚠ The algebraic exponents alone miss the sign: the odd
character mod `4∞` of `ℚ` has exponent `0` and parity `1`, so its finite character must be `−1` at
`−1`; built without the sign it would be even, the unit compensation would read `−1 = 1`, and the
odd theta series would vanish by pairing `a` with `−a`. Prove:

- `finiteCharacter_eq_one_of_isCongrOne` (by `compatibility`), `finiteCharacter_mul`, and
  `finiteCharacter_eq_zero_iff`: it vanishes exactly off the elements prime to `𝔪₀`.
- `existsUnique_residueCharacter`: there is exactly one character `ρ` of the residue ring `𝓞/𝔪₀`
  (Mathlib's `MulChar`) agreeing with `finiteCharacter` at every nonzero element: Hecke's residue
  character `χ_f` of `(𝓞/𝔪₀)ˣ`. With `finiteCharacter_residue`: on nonzero elements the
  coefficient depends only on the residue mod `𝔪₀`, because the signs are exactly what
  `archimedeanValue` strips. ⚠ Keep the two apart: the coefficient is `0` at the element `0`, since
  `(0)` is not prime to `𝔪`, the value the twisted theta series needs; at conductor one the residue
  ring has one element, a unit, where the residue character is `1`, so the coefficient does not
  descend through `0`. Conductor-one characters, the trivial one and the Dedekind zeta function
  among them, stay in the programme.
- `finiteCharacter_unit`: on a unit the finite character is the full archimedean value, Neukirch's
  `χ_f(ε) χ_∞(ε) = 1`.
- `existsUnique_finiteCharacterK`: the finite character extends uniquely and multiplicatively to
  the fractions prime to `𝔪₀`, Neukirch's `K^(𝔪)`, the supplier's `primeToSubgroup 𝔪`, and by zero
  to the rest of `Kˣ`.

Read the harmonic polynomial `N(a^p)` off the infinity type of the unitary part with the sign of
the unit relation (Neukirch VII §7): `harmonicFactor K χ x` is `x^(ε_w)` at a real place and, at a
complex place of angular frequency `k_w = n_τ − n_τ̄`, the monomial `conj(z)^(k_w)` for `k_w ≥ 0` and
`z^(−k_w)` for `k_w < 0`, with per-place degree `P_w = harmonicExponent K χ w` and total degree
`Tr p = harmonicDegree K χ`, the same for the inverse presentation (`harmonicDegree_inverse`).
Prove `finiteCharacter_mul_harmonicFactor_unit`: `χ_f(u) N(u^p) = ∏_w |u_w|^(P_w)` on a unit, the
sign of `u_w^(ε_w)` at a real place being cancelled by the sign in `archimedeanValue`. Prove
Hecke's lemma `mixedFourier_harmonicFactor_mul_archGaussian`: the polynomial times the Gaussian is
a Fourier eigenfunction up to `(−i)^(Tr p)` and the weights `y_w^(−P_w)` (Neukirch VII (3.5)–(3.6) at
`z = i y`).
*Needs:* §§6.1, 6.4; Layer 1 (`archGaussian`, `mixedFourier_archGaussian`); Tau Ceti
`mixedFourier`, `primeToSubgroup`, `IsCongrOne`; Mathlib `MulChar`, `Ideal.Quotient.mk`.

**Checks.**

- The odd character mod `4∞` of `ℚ`: `χ_f(−1) = −1`, `χ_f(3) = −1`, `χ_f(5) = 1`, `χ_f(2) = 0`; its
  residue character on `ℤ/4` is `χ₄`; its polynomial is `x` at the real place, `−1` at `−1`, of
  degree `1`, and `χ_f(−1)` times it is `1`; built from the algebraic exponents alone, `χ_f(−1)`
  would be `1`.
- The trivial character of `ℚ` at conductor one: `χ_f(0) = 0` and `χ_f(1) = 1`, while the residue
  character of the one-element ring `ℤ/ℤ` is `1`; a residue character defined through the
  representative `0` would be `0`.
- `‖·‖^(−m)` over `ℚ`, `m` odd: the algebraic exponent is `−m`, the archimedean restriction is even,
  so `χ_f(n) = |n|^m n^(−m) sgn(n) = 1` at every nonzero integer, and the polynomial is constant;
  with the supplier's shift in place of `σ` it would be `|n|^(−2m)`.
- The angular character of `ℚ(i)` with `k > 0`: the one complex place has angular frequency `±4k`,
  the polynomial is `conj(z)^(4k)` or `z^(4k)`, of degree `4k`; a factor read off the sum of the two
  exponents has degree `0`.

### 6.8 The twisted theta series and the Mellin kernel

Define the archimedean weight `archWeight K χ y = N(y^(p/2)) = ∏_w y_w^(P_w/2)`, the theta constant
`heckeEpsilon K χ` — `1` exactly when the finite conductor `𝔣₀` is `1` and `Tr p = 0`, the residue
character at the class of `0` times the polynomial at `0` — and the twisted theta series
`heckeTheta K χ 𝔞 y = ε(χ) + ∑_{a ∈ 𝔞} χ_f(a) N(a^p) e^(−π ∑_w y_w |a_w|²)` over a nonzero integral
ideal `𝔞` (Neukirch's `θ^p(𝔎, χ_f, z)` of VII §7 at `z = i y`). ⚠ The constant reads the finite
conductor, not the whole `primitiveConductor`: a real place divides the latter whenever the parity
of the archimedean restriction differs from that of the algebraic exponent, which happens for the
odd norm powers of `ℚ`, unramified at `∞`, with a constant polynomial. Prove
`archWeight_mul_heckeTheta_unitScale` (Neukirch (8.2)): the weighted theta series is invariant under
the unit action, because `χ_f(u) N(u^p) = ∏_w |u_w|^(P_w)` on a unit.

Define the scale `heckeScale K χ I = V_I² N(𝔣₀)` and the Mellin kernel (Neukirch (8.3))
`heckeMellinKernel K D χ 𝔞 h u`, the product of
`(2^r₂/w) · 2^(−(∑_{w complex} P_w)/2) · λ_𝔞^(−Tr p / 2n)` with `∫_D N(x^(p/2)) θ_χ(𝔞, x (u/λ_𝔞)^(1/n)) d*x`,
`λ_𝔞` the scale of `𝔞`. The constants come from the gamma integral of the weighted Gaussian at a
complex place, `2^(2s + P/2 − 1) Γ_ℂ(2s + P/2) |z|^(−4s − P)`, whose `|z|^(−P)` cancels the `|a_w|^(P_w)`
of `χ_f(a) N(a^p) = χ_u((a)) ∏_w |a_w|^(P_w)`; that cancellation is why the gamma shifts of the card
are `ε_w` and `|k_w|/2`. Prove `heckeMellinKernel_one`: the kernel of the trivial character is the
Dedekind kernel `mellinKernel`. Define the per-class completion `unitaryPartialCompletion K χ 𝔞`,
Neukirch's `Λ(𝔎, χ, s)` (VII §8) for the unitary weight of the presentation, with the conductor
power and gamma factor of the card (`unitaryPartialCompletion_eq_tsum` on `Re s > 1`), the total
kernel `heckeMellinTotal`, the sum over a system of class representatives prime to the conductor
of `χ_u(rep c)⁻¹` times the kernels, and its constant term `heckeMellinConstant`,
`ε(χ) a₀ ∑_c χ_u(rep c)⁻¹`, which vanishes unless `χ_u` is trivial. Prove:

- `unitaryPartialCompletion_eq_mellin` (Neukirch (8.3)): for `𝔞` prime to the conductor and
  `Re s > 1`, `Λ(𝔎, χ_u, s) = χ_u(𝔞)⁻¹ ∫_0^∞ (f_D(χ, 𝔞, u) − ε(χ) a₀) u^((s + Tr p/n)/2) du/u`; the
  Mellin variable is shifted by `Tr p / n` because the weight `N(y^(p/2))` is `N(x^(p/2)) t^(Tr p / 2n)`
  in the coordinates of `surfaceScale`.
- `heckeMellinTotal_congr`: the total kernel does not depend on the representatives; replacing `𝔞`
  by `c 𝔞` multiplies the kernel by `χ_u((c))` and the class factor by its inverse.
- `unitaryCompletion_eq_sum` and `unitaryCompletion_eq_mellin`: for a presentation at its conductor
  (`primitiveConductor K χ = 𝔪`) and `Re s > 1`, the unitary completion is the sum of the per-class
  completions and `Λ(χ_u, s) = ∫_0^∞ (F_D(χ, u) − a₀(χ)) u^((s + Tr p/n)/2) du/u`. Every Hecke
  character has such a presentation (`primitiveConductor_dvd_iff`), and `unitaryCompletion_congr`
  carries the identity to every other presentation.
- `continuousOn_heckeMellinTotal` and `heckeMellinTotal_sub_const_isBigO`: the total kernel is
  continuous on `(0, ∞)` and exponentially close to its constant term (Neukirch (8.4)).
- `heckeMellinTotal_inv` (Neukirch (8.4)): for a presentation `χ` at its conductor and the
  presentation `ψ` of the inverse Hecke character,
  `F_D(χ, 1/u) = W(χ) u^(1/2 + Tr p/n) F_{D⁻¹}(χ⁻¹, u)`, from Hecke's lemma and the theta
  transformation (7.7) with its Gauss sum (§5.3). The constant is the root number: this law pins
  `rootNumber`, and Neukirch's closed form of (8.5) is its evaluation. ⚠ The right side is the
  inverse character, which for a unitary character is the conjugate.

*Needs:* §§6.6–6.7; §5.3 (`gaussSum`, `gaussSum_mul`, `norm_gaussSum`) for `heckeMellinTotal_inv`;
Layer 1 (`archGaussian`, `latticeTheta_inv`, `surfaceHaar`, `surfaceHaar_of_isUnitFundamentalDomain`),
Layer 3 (`mellinKernel`, `mellinConstant`, `idealUnit`, `IsClassRepresentatives`); Tau Ceti
`unitScale`, `surfaceScale`, `IsUnitFundamentalDomain`; Mathlib
`mixedEmbedding.covolume_idealLattice`, `mellin`.

**Checks.**

- The trivial character of `ℚ`, `𝔞 = ℤ`: `ε = 1` and `χ_f(0) = 0`, so
  `θ_χ(ℤ, y) = ∑_{m ∈ ℤ} e^(−π y m²)`, Jacobi's `θ(iy)`, and the kernel is the Dedekind kernel of `ζ`.
- The odd character mod `4∞`: `ε = 0` and the series is `2 ∑_{m ≥ 1} χ₄(m) m e^(−π y m²)`; the even
  character mod `5`: `ε = 0` and the series is `2 ∑_{m ≥ 1} χ₅(m) e^(−π y m²)`, where a constant read
  off the polynomial alone would add `1`.
- The scale of the odd character mod `4∞` at `𝔞 = ℤ` is `1 · 4 = 4`, which puts `4^(s/2)` into the
  completion, and the constant term `ε(χ) a₀` of its kernel is `0`, so its completed L-function has
  no pole.
- `‖·‖^(−m)` over `ℚ`, `m` odd: `𝔣₀ = ⊤`, so `ε = 1` and the scale is `1`, although `∞` divides the
  presentation conductor; a constant read off `primitiveConductor` gives `0`.
- Over `ℚ(i)`, `𝔞 = ℤ[i]` and an unramified character: Mathlib's covolume
  `N(𝔞) 2^(−r₂) √|d_K| = 1 · 1/2 · 2 = 1`, so the scale is `1`, where the covolume of Neukirch's
  normalization, `√|d_K| = 2`, would give `4`.

### 6.9 Continuation and functional equation of the card

Define `grossencharacterFEPair`, the instance of Tau Ceti's `FEPairWithLevel` for a presentation
`χ` at its conductor and the presentation `ψ` of the inverse Hecke character: `f = F_D(χ, ·)` and
`g = F_{D⁻¹}(ψ, ·)` on `(0, ∞)`, level `1`, weight `1/2 + Tr p/n`, `ε = W(χ)`, each hypothesis of the
pair discharged from a named property of the kernel (local integrability from
`continuousOn_heckeMellinTotal`, the law from `heckeMellinTotal_inv`, the rapid decay from
`heckeMellinTotal_sub_const_isBigO`, `ε ≠ 0` from `norm_rootNumber`). Prove
`grossencharacterFEPair_completed`: its `Λ` at `(s + Tr p/n)/2` is the unitary completion at `s`
on `Re s > 1` — Mathlib's `hasMellin` when `Tr p = 0`, and its strong-pair form when `Tr p > 0`,
where both constants vanish. Prove `grossencharacterData_hasContinuation` and
`grossencharacterData_hasFunctionalEquation`, and the completed functional equation
`completed_one_sub`: `Λ(χ, s) = W(χ) Λ(ψ, 1 − s)` at every `s` at which the polar divisors of the
two unitary cards, read at `s − σ`, vanish, with `completed_one_sub_eventuallyEq` its germ form at
every point (for the unitary part, Hecke, *Eine neue Art von Zetafunktionen II*, §6, (45), p. 35;
Neukirch VII (8.5)). The integral norm powers show why the hypotheses are needed:
`Λ(N^m, s) = Λ_K(s − m)` has poles at `m` and `1 + m`.
*Needs:* §6.8; Tau Ceti `TauCeti.FEPairWithLevel` with `Λ_eq`, `Λ_eventuallyEq`,
`TauCeti.isBigO_rpow_of_isBigO_exp_neg`; Mathlib `WeakFEPair.hasMellin`, `IsStrongFEPair.hasMellin`.

### 6.10 The finite-order case

Prove `completedHeckeLFunction_eq_mellin`: for a primitive ray class character `ψ` and the
presentation `χ` of its Hecke character at the conductor (§6.1), which has trivial angular
frequencies and `Tr p` the number of odd real places, `completedHeckeLFunction ψ` is the Mellin
transform at `(s + Tr p/n)/2` of `heckeMellinTotal` of `χ` minus its constant term, on `Re s > 1`.
This is how §5.4 is continued and given its functional equation.
*Needs:* §§6.8–6.9; §5.4 (`heckeData`, `completedHeckeLFunction`).

### Examples

- The norm power `N^m` over `ℚ` has one real gamma shift `−m` in its full completion and `0` in its
  unitary card; over `ℚ(i)` it has one complex gamma shift `−m` in its full completion, not `−2m`.
- The odd character mod `4∞` and the even character mod `5` agree field by field with Layer 5
  (`grossencharacterData_ofRayClassCharacter`, §8.1).
- The principal character's canonical primitive card is `dedekindZetaData`, while its presented
  series retains the deleted Euler factors.
- At a real place the gamma shift is the parity of the unitary part, which for `N^m` with `m` odd is
  `0` while the algebraic exponent is odd.
- Hecke's angular characters of `ℚ(i)`, `𝔞 = (α) ↦ (α/|α|)^(4k) = (α/ᾱ)^(2k)` (§7.4), are the
  infinite-order case. Their idelic archimedean component is the inverse, `z ↦ (z/|z|)^(−4k)`, so
  the algebraic infinity type has exponent `−2k` at the embedding through which the ideal value is
  read and `2k` at its conjugate; the two exponents **sum** to zero — the character is unitary and
  its shift vanishes — and **differ** by `4k`. Their card has no real gamma factor, one complex
  gamma factor shifted by `2|k|`, conductor `4`, degree two, and, for `k ≠ 0`, no pole. ⚠ The shift
  is `2|k|`, half the angular frequency: an interface that stores only a weight, or that adds the
  conjugate exponents, records `0` for every `k` and cannot tell these characters from the trivial
  one. This is the acceptance test that a finite character family cannot supply.
- The nonreal sign test: at `a = 2 + i` the finite value `((3 + 4i)/5)^(2k)` of the angular character
  is not real and is the inverse, not the equal, of the archimedean value (§6.4).
- The real sign test: for the odd character mod `4∞` at the unit `−1`, `χ_f(−1) = −1`, the harmonic
  polynomial is `−1`, their product is `1`, and the theta kernel over `ℤ` is Riemann's odd theta
  function `2 ∑ χ₄(m) m e^(−π y m²)`; a finite character built from the algebraic exponents alone
  fails it.
- The conductor-one residue test: for the trivial character of `ℚ` at conductor one the coefficient
  `finiteCharacter` is `0` at `0` and `1` at `1`, the two have the same residue in `𝓞/𝓞`, and the
  residue character is `1` there; a descent of the coefficient to the residue ring that includes `0`
  fails it.
- The theta-constant test: for odd `m` the presentation of `‖·‖^(−m)` at `∞` has presentation
  conductor `∞` — the parity mismatch, although `‖·‖^(−m)` is unramified at `∞` — but finite
  conductor `⊤`, a constant polynomial, and finite character `1` at every nonzero integer, so
  `ε = 1`, its theta series is Jacobi's `θ(iy)` with the constant term, its kernel is the Riemann
  kernel `mellinKernel`, and its constant is `1/2`. An `ε` read off the whole conductor fails it —
  the total kernel becomes `(θ(iu) − 1)/2`, against theta inversion — and so does the supplier's
  shift in place of the ideal-side one, under which the finite character is `|n|^(−2m)`.

### Dependencies

Tau Ceti: `HeckeCharacter` with `shift`, `unitaryPart`, `infinityType`, `finiteConductor`,
`finiteComponent`, `idealCharacter`, `ofRayClassCharacter` and
`isFiniteOrder_iff_exists_rayClassCharacter`; `ContinuousInfinityType`, `AlgebraicInfinityType` with
`toContinuous`, `ideleCongruenceSubgroup`, `IsCongrOne`, `primeToSubgroup`, `ideleNorm`,
`narrowModulus`; `UnitaryIdealWeight`, `normCoeff`, `EulerProductData`; `TauCeti.FEPairWithLevel`,
`AnalyticLFunctionData.ofSeries`. Layer 0 (the card), Layer 1 (`archGaussian`, the unit
fundamental domains and their volume), Layer 3 (`mellinKernel`, `mellinConstant`, `idealUnit`,
`IsClassRepresentatives`), Layer 5 (`heckeLFunctionC` of the supplier, `gaussSum`, `heckeData`).

## Layer 7: intrinsic nonvanishing

A theorem that one named character L-function is nonzero on `Re s = 1` belongs here because it is
part of that function's basic analytic theory. Uniform zero-free regions, zero counting, and
consequences extracted from zeros belong downstream. The `3-4-1` positivity, the generic
nonvanishing criterion built on it, the nonvanishing on `Re s ≥ 1` of the continued L-function of
a weight with cancellation, and Landau's theorem are Tau Ceti's (supplier contracts).

### 7.1 Nonvanishing of finite-order Hecke L-functions

Prove `heckeLFunction_ne_zero_of_one_le_re`: for a nontrivial primitive ray class character `χ`,
`L(s, χ) ≠ 0` for `Re s ≥ 1`. The weight `χ.toUnitaryIdealWeight` has cancellation (Tau Ceti's
`hasCancellation_toUnitaryIdealWeight`), so the supplier's `continuedLFunctionOfWeight` of it is
holomorphic on `Re s > 1 − 1/n`; it agrees with the series on `Re s > 1`, hence with the normal
form `heckeLFunctionC χ` of §5.1 on `Re s > 1 − 1/n`. Its nonvanishing on `Re s ≥ 1` is Tau Ceti's
`continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` when `χ² ≠ 1`, the square of the weight
being then the weight of the nontrivial character `χ²`, and
`continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` off `s = 1` when `χ² = 1`. What remains
is the exceptional quadratic case `χ² = 1`, `s = 1`: Landau's argument (§7.3, the supplier's
`TauCeti.LSeries.landau`) with the continuation of §§5.1 and 5.4. Mathlib proves the case of
Dirichlet L-functions (`DirichletCharacter.LFunction_ne_zero_of_one_le_re`) by the same case
analysis, closing its quadratic case by the positivity of an entire L-series with nonnegative
coefficients (Loeffler–Stoll, §6, p. 54).
*Needs:* §§5.1, 5.4 (`heckeLFunctionC_eq`, `differentiable_completedHeckeLFunction`), §3.5; Tau Ceti
`hasCancellation_toUnitaryIdealWeight`, `continuedLFunctionOfWeight` with
`continuedLFunctionOfWeight_eq_LSeries` and `differentiableOn_continuedLFunctionOfWeight`,
`continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq`,
`continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq`, `TauCeti.LSeries.landau`,
`RayClassCharacter.toUnitaryIdealWeight`, `EulerProductData`.

**Checks.**

- `L(1, χ₄) = π/4 ≠ 0`: `χ₄` has order two, so this is the exceptional quadratic case, closed by
  Landau's argument and not by the `3-4-1` bound, whose orders at `t = 0` are `−3 + 4 − 1 = 0`.

### 7.2 The cancellation packages

The two hypothesis packages keep their assumptions visible rather than hiding them in a
specialization. The single-character package `UnitaryCancelling` treats one possibly
infinite-order unitary weight `χ`: it excludes pure norm twists (the supplier's
`IsNormTwistOnGood`), requires cancellation (the supplier's `HasCancellation`) of `χ`, of its
conjugate and of every imaginary norm twist `imaginaryNormTwist K χ t = χ N^(it)` (the supplier's
`UnitaryIdealWeight.normTwist` at `z = −it`), and allows the square of each twist either to be a
norm twist or to cancel. The finite-family package, stated in prose and used through
`UnitaryCancelling` member by member, is indexed by a finite commutative group of characters,
closed under products and conjugation, and requires cancellation of every norm twist of each
**nontrivial** member; its identity law applies only to good ideals, where good explicitly
includes `I ≠ ⊥`. Requiring the square always to cancel incorrectly excludes quadratic characters;
requiring the trivial member's nonzero norm twists to cancel makes the finite-family package
uninhabitable.
*Needs:* Tau Ceti `HasCancellation`, `UnitaryIdealWeight.normTwist`, `UnitaryIdealWeight.conj`,
`MultiplicativeIdealWeight.IsNormTwistOnGood`.

**Checks.**

- The weight of `χ₄` over `ℚ`: it cancels, every norm twist of it cancels, and its square is the
  trivial weight on good ideals, a norm twist, so it satisfies `UnitaryCancelling` through the
  square-twist alternative; a package requiring the square to cancel rejects it.
- The trivial weight, and every `N^(it)`, is a pure norm twist and is excluded: its series is a
  translate of `ζ_K` with a pole on `Re s = 1`, so no cancellation premise can hold for it.
- The two characters modulo `4`, as a finite family: the trivial member's twists are not required
  to cancel (its partial sums grow like `x/2`), and its identity law holds at odd ideals only,
  where good includes `I ≠ ⊥`; requiring `1` at the ideal `(2)` fails, since the weight is `0` there.

### 7.3 Nonvanishing for Grossencharacters

Keep nonvanishing in meromorphic-order form at poles. Prove
`meromorphicOrderAt_dedekindZetaC_one_add`: `dedekindZetaC K` has order `0` at `1 + it` for
`t ≠ 0` (its order at `1` is `−1`, §3.5). Prove `Grossencharacter.unitaryCancelling`: for every
presentation whose unitary weight is not a pure norm twist on its good ideals, the premise
`UnitaryCancelling` holds, constructed rather than assumed. Prove
`Grossencharacter.meromorphicOrderAt_lFunctionC`: under that premise `lFunctionC` has order `0` at
`1 + σ + it` for every real `t`; the Grossencharacter boundary is `Re s = 1 + σ`, reduced to the
unitary statement by recentering. For a unitary part that is not a norm twist the order statement
also follows, by partial summation, from Hecke's prime ideal theorem with remainder,
`∑_{N𝔭 < x} λ(𝔭) = O(x e^(−c √log x))` for every nonprincipal Größencharakter `λ` (*Eine neue Art
von Zetafunktionen II*, §7, (46), p. 35); the route below does not pass through it.

*Route of `Grossencharacter.unitaryCancelling`.* Write `χ_u` for the unitary weight; the field
`not_normTwist` is the hypothesis.

- Cancellation of `χ_u`. Split on the angular frequencies `k_w` of the infinity type at the
  complex places, not on the order of the Hecke character. If every `k_w` is zero, the unitary
  part `χ.toHeckeCharacter.unitaryPart` is trivial on the archimedean identity component, where
  only the angular characters `(z/|z|)^(k_w)` survive the removal of the shift, and on the ideles
  of `ideleCongruenceSubgroup 𝔪` with archimedean coordinates `1`, by the modulus pin and because
  their norm is `1`. So it is trivial on the ray subgroup of the modulus `𝔪⁺` with the finite part
  of `𝔪` and every real place, and is the pullback of a ray class character `η` of `𝔪⁺` (Tau
  Ceti's `HeckeCharacter.mem_range_ofRayClassCharacter_iff`). Then `χ_u = η.toUnitaryIdealWeight`:
  both vanish on the ideals not prime to `𝔪₀`, and at a prime `𝔭 ∤ 𝔪₀` both are the unitary part
  at a uniformizer of `K_𝔭` (the pin `unitaryWeight_apply` and the supplier's
  `HeckeCharacter.ofRayClassCharacter_apply`). `η ≠ 1` because `χ_u` is not a norm twist, and Tau
  Ceti's `RayClassCharacter.hasCancellation_toUnitaryIdealWeight` applies. A split on the order
  of the Hecke character, or a character `η` of `𝔪` itself, would miss `χ₄ N` over `ℚ`, on ideals
  `(n) ↦ χ₄(n) n`: it is presented at `(4)` (its archimedean component `x ↦ x⁻¹` has the parity
  of its exponent `−1`), has infinite order since `|χ((3))| = 3` and no complex place, and its
  unitary part `χ₄` is a character of the ray class group of `(4)·∞` but not of that of `(4)`,
  which is trivial. Otherwise some `k_w ≠ 0`, and the bound comes from a weighted lattice-point
  count. For `𝔞` integral and prime to `𝔪`, each nonzero integral ideal prime to `𝔪` in the class
  of `𝔞⁻¹` is `a𝔞⁻¹` for exactly `w` points `a ∈ 𝔞` of Mathlib's fundamental cone
  (`fundamentalCone.idealSetEquiv`), and by the unit relation (§6.4) `χ_u(a𝔞⁻¹)` is `χ_u(𝔞)⁻¹` times
  the residue character (§6.7) at `a mod 𝔪₀` times a function of `a` homogeneous of degree `0`: a
  character of frequency `k_w` in the angle of `a_w` at each complex place, times signs at the real
  places. Count the points of each coset of `σ(𝔞𝔪₀)` with this weight by the cell argument of Tau
  Ceti's lattice count (`TauCeti.abs_ncard_inter_mul_sub_measureReal_le`, with the Lipschitz
  frontier `fundamentalCone.isLipschitzParametrizable_frontier_normLeOne`), one dyadic shell of the
  norm at a time, on which the weight is Lipschitz with constant inversely proportional to the
  shell's radius: the weighted count up to norm `x` is `x` times the integral of the weight over the
  norm-at-most-one part of the cone plus `O(x^(1 − 1/n))`, the errors of the shells forming a
  geometric series for `n ≥ 2`. The cone is stable under rotating the complex coordinates, so the
  integral vanishes.
- `cancellation_conj`: Tau Ceti's `hasCancellation_conj_iff`.
- `cancellation_normTwist`: for `n ≥ 2`, Tau Ceti's `HasCancellation.normTwist`. Over `ℚ` the
  unitary part of an algebraic Hecke character is a Dirichlet character and the bound required is
  `O(1)`: the partial sums `S(u)` of `χ_u` are periodic, and Abel summation
  (`idealSummatory_mul_eq_sub_integral_mul`) gives
  `∑_{n ≤ x} χ_u(n) n^(it) = S(x) x^(it) − it ∫_1^x S(u) u^(it − 1) du`, bounded in `x` because
  `S` minus its mean over a period has a bounded primitive and the mean contributes a constant
  times `(x^(it) − 1)/(it)`.
- `square_twist`: `(χ_u N^(it))² = χ_u² N^(2it)`, where `χ_u²` is the unitary weight of the square
  presentation (the square Hecke character, the squared weight, the doubled infinity type). If
  `χ_u²` is trivial on good ideals the first alternative holds with `u = 2t`. Otherwise `χ_u²` is
  not a norm twist on its good ideals — the unitary weight of an algebraic Hecke character agrees
  with `N^(iu)` at almost all primes only for `u = 0`, the supplier's `normCharacter K t` being
  algebraic only for `t = 0` (`not_isAlgebraic_normCharacter`) — and the three items above give
  the second alternative.

*Route of the nonvanishing.* Under the premise, near `Re s = 1` the recentred `lFunctionC` is the
supplier's `continuedLFunctionOfWeight χ_u` (§7.5), and its nonvanishing at `1 + it` is Tau Ceti's
`continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` when `χ_u²` cancels and
`continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` for `t ≠ 0` when `χ_u²` is trivial on
good ideals; by the remark in the last item above no other square occurs for a Grossencharacter.
For `t = 0` and `χ_u²` trivial on good ideals the `3-4-1` bound excludes nothing (the orders are
`−3 + 4 − 1 = 0`): this is the exceptional quadratic case, proved by Landau's argument. There
every `k_w` vanishes, since the square presentation has the frequencies `2k_w` and a nonzero one
would make `χ_u²` cancel by the weighted count, which Tau Ceti's
`not_hasCancellation_of_isTrivialOnGood` excludes. So `χ_u = η.toUnitaryIdealWeight` for the
nontrivial ray class character `η` of `𝔪⁺` of the first item of the route above, and
`L(s, χ_u) = heckeLFunctionC η` continues to an entire function (§§5.1 and 5.4, Neukirch
VII (8.5)); if `L(1, χ_u) = 0` then `ζ_K(s) L(s, χ_u)` is entire. Its Dirichlet coefficient at `𝔠`
is `∑_{𝔞𝔟 = 𝔠} χ_u(𝔟)`, which is multiplicative and equal at `𝔭^k` to `k + 1`, to `1` or `0` by the
parity of `k`, or to `1`, according as `χ_u(𝔭)` is `1`, `−1` or `0`; so it is nonnegative and at
least `1` at every square ideal. By Landau's theorem the series then converges at every real `s`,
and for real `s > 1/2` it is at least `ζ_K(2s)`, which tends to infinity as `s → 1/2⁺`, against the
continuity of the entire function at `1/2`. A cancellation hypothesis alone does not supply this
step: it continues the series of a weight only to `Re s > 1 − 1/n`, which for `n ≥ 2` does not
contain `s = 1/2`.
*Needs:* §3.5 (`dedekindZetaC` and its pole), §5.1 (`heckeLFunctionC_eq`), §5.4
(`differentiable_completedHeckeLFunction`), §6.1 (the pins of `Grossencharacter`), §6.4
(`compatibility`), §6.5 (`lFunctionC_eq`), §6.7 (`existsUnique_residueCharacter`), §7.2; Tau Ceti
`HeckeCharacter.unitaryPart`, `ideleCongruenceSubgroup`,
`HeckeCharacter.mem_range_ofRayClassCharacter_iff`, `HeckeCharacter.ofRayClassCharacter_apply`,
`RayClassCharacter.toUnitaryIdealWeight`, `heckeLFunctionC`,
`RayClassCharacter.hasCancellation_toUnitaryIdealWeight`, `not_hasCancellation_of_isTrivialOnGood`,
`hasCancellation_conj_iff`, `HasCancellation.normTwist`, `idealSummatory_mul_eq_sub_integral_mul`,
`TauCeti.abs_ncard_inter_mul_sub_measureReal_le`,
`fundamentalCone.isLipschitzParametrizable_frontier_normLeOne`, `not_isAlgebraic_normCharacter`,
`continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq`,
`continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq`, `TauCeti.LSeries.landau`; Mathlib
`fundamentalCone.idealSetEquiv`.

### 7.4 Hecke's angular characters

Prove `exists_angularGrossencharacter`: over `ℚ(i)` (a field `F` with
`IsCyclotomicExtension {4} ℚ F`), for each `k` there is a presentation at the trivial modulus whose
algebraic infinity type has exponent `−2k` at an embedding `τ` and whose ideal-side values are
`χ_u((α)) = (τ α / conj (τ α))^(2k)`. The weight on every ideal is fixed because `ℤ[i]` is
principal; the unit relation then fixes the exponent `2k` at `conj τ` and the shift `0`, and the
presentation is unique by `Grossencharacter.ext`. For any such presentation prove
`angularGrossencharacter_infinityType` (complex exponent `0`, angular frequency `±4k`, shift `0`),
`angularGrossencharacterData` (for `k ≠ 0`: no real gamma factor, one complex gamma shift `2|k|`,
conductor `4`, degree `2`, no pole) and `angularGrossencharacter_not_isNormTwist` (for `k ≠ 0` the
weight is not a norm twist). The last is the exception clause of `Grossencharacter.unitaryCancelling`,
so by §7.3 the L-functions of the angular characters with `k ≠ 0` have no zero on `Re s = 1`,
unconditionally. Over an imaginary quadratic field Hecke's characters are `(μ/|μ|)^(g a)`, `g` the
number of units `≡ 1 mod 𝔣`, with gamma factor `Γ(s + |g a|/2)` (*Eine neue Art von
Zetafunktionen II*, §9, p. 44); over `ℚ(i)` at `𝔣 = 1`, `g = 4` and `a = k` give `(α/ᾱ)^(2k)` and
the shift `2|k|`.
*Needs:* §§6.1, 6.4, 6.6, 7.3; Mathlib `IsCyclotomicExtension`.

**Checks.**

- `k ≠ 0` is essential: the angular character with `k = 0` is trivial, its L-function is
  `ζ_{ℚ(i)}`, and it has a pole at `s = 1`.

### 7.5 Boundary data for prime distribution

Export the boundary data that a prime-distribution argument takes from an L-function, and stop
there. Prove `Grossencharacter.exists_continuousOn_logDeriv`: for a presentation whose unitary
weight `χ_u` is not a pure imaginary norm twist on its good ideals, the logarithmic derivative of
the continued L-function `continuedLFunctionOfWeight χ_u` of the supplier extends continuously to
`Re s ≥ 1` with no residue. By partial summation the datum also follows from Hecke's prime ideal
theorem with remainder for a nonprincipal Größencharakter (*Eine neue Art von Zetafunktionen II*,
§7, (46), p. 35). *Route:* on `Re s > 1` the continued L-function of `χ_u` is
`lFunctionC χ (s + σ)`, by `lFunctionC_eq` and the supplier's `continuedLFunctionOfWeight_eq_LSeries`;
it is holomorphic on `Re s ≥ 1` under the premise of `Grossencharacter.unitaryCancelling` (the
supplier's `differentiableAt_continuedLFunctionOfWeight`), and zero-free there by
`Grossencharacter.meromorphicOrderAt_lFunctionC`, including the exceptional quadratic case, the
finitely many deleted Euler factors being nonzero on `Re s ≥ 1`; the quotient `−L′/L` is then
continuous on the closed half-plane. The theorem is not stated for an arbitrary unitary weight
satisfying `UnitaryCancelling`: the ideal Liouville weight `λ_K(𝔭) = −1` of a field of degree
`n ≥ 3` has series `ζ_K(2s)/ζ_K(s)`, with a simple zero at `1`, and nothing in that package excludes
it — under the Riemann hypothesis for `ζ_K` its partial sums are `O(x^(1/2 + ε))` for every `ε > 0`,
inside the bound `O(x^(1 − 1/n))` of `HasCancellation`, and every other field of the package then
follows.

For the trivial weight the record with residue `1`, `PrimeBoundaryRemainder K Set.univ 1`, is Tau
Ceti's `TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, the datum on which the supplier's prime
ideal theorem is conditional. Consume it, and prove only `primeIdealVonMangoldtBoundary_series_eq`:
its series is the logarithmic derivative of `dedekindZetaC` on `Re s > 1`, through
`dedekindZetaC_eventuallyEq` (the named continuation is Mathlib's `dedekindZeta` near every point
of `Re s > 1`).

⚠ Hecke's angular equidistribution of Gaussian primes is **not** proved here. It is a
prime-distribution theorem: beyond the exports above it needs a Tauberian step and Fourier analysis
on the angular character group, neither of which this roadmap owns. What this roadmap owes such an
argument is the analytic input, and that input is named. This layer proves no zero-free region, no
zero counting and no explicit formula.
*Needs:* §§6.5, 7.3, §3.5 (`dedekindZetaC_eq`); Tau Ceti `continuedLFunctionOfWeight`,
`continuedLFunctionOfWeight_eq_LSeries`, `differentiableAt_continuedLFunctionOfWeight`,
`primeIdealVonMangoldtBoundary`, `primeIdealVonMangoldtBoundary_series`, `PrimeBoundaryRemainder`.

### Examples

- `dedekindZetaC ℚ = ζ` has order `−1` at `1` and order `0` at `1 + it` for `t ≠ 0`.
- `L(1, χ₄) = π/4 ≠ 0`: `χ₄` has order two, so this is the exceptional quadratic case.
- The angular characters of `ℚ(i)` with `k ≠ 0` are not norm twists, so their L-functions have no
  zero on `Re s = 1`.

### Dependencies

Tau Ceti: the `3-4-1` combination and criterion, `TauCeti.LSeries.landau`, `HasCancellation`
with `hasCancellation_conj_iff`, `HasCancellation.normTwist` and
`not_hasCancellation_of_isTrivialOnGood`, `HeckeCharacter.unitaryPart` with
`HeckeCharacter.mem_range_ofRayClassCharacter_iff`, `hasCancellation_toUnitaryIdealWeight`,
`continuedLFunctionOfWeight` with `continuedLFunctionOfWeight_eq_LSeries`,
`differentiableAt_continuedLFunctionOfWeight`,
`continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` and
`continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq`, the lattice count
`abs_ncard_inter_mul_sub_measureReal_le`, `IsNormTwistOnGood`, `UnitaryIdealWeight.normTwist`,
`UnitaryIdealWeight.conj`, `PrimeBoundaryRemainder`, `primeIdealVonMangoldtBoundary`. Layer 3
(`dedekindZetaC`), Layer 5 (continuation of a nontrivial finite-order character), Layer 6
(`Grossencharacter`, `lFunctionC`, the angular presentations).

## Layer 8: interoperability and examples

### 8.1 Comparison cards

Supply named comparison cards for Riemann zeta (Tau Ceti's `riemannZetaData`), Dedekind zeta
(`dedekindZetaData`), primitive Dirichlet characters (Tau Ceti's `dirichletData`), primitive ray
class characters (`heckeData`), and Grossencharacters (`grossencharacterData`, the card of the unitary
part), and compare them field by field, so that conductors, gamma factors, root numbers,
completions, polar divisors and positive-index coefficients are checked together. Between cards
built by canonical continuation the comparison is Tau Ceti's `AnalyticLFunctionData.EqOffZero`:
prove `grossencharacterData_ofRayClassCharacter`, that the card of the presentation of a primitive
ray class character at its conductor and `heckeData` agree off the zeroth coefficient; and that
over `ℚ` the card `heckeData` of the ray class character attached to a nontrivial primitive
Dirichlet character `χ` (through the supplier's `ratDirichletEquiv`) and `dirichletData χ` agree off
the zeroth coefficient, both completed functions being entire. Against a card whose completed
function is one of Mathlib's — `riemannZetaData`, `dirichletData` at conductor one — the completed
functions agree off the polar divisor, where Mathlib's values are junk and the canonical
continuation is `0`, and the other fields agree.
*Needs:* §§3.5, 5.4, 6.6, 6.9; Tau Ceti `AnalyticLFunctionData.EqOffZero`, `riemannZetaData`,
`dirichletData`, `ratDirichletEquiv`, `ratDirichletEquiv_absNorm`.

**Checks.**

- `dedekindZetaData ℚ` and `riemannZetaData`: one ideal of each norm `n ≥ 1`, conductor `1`, one real
  shift `0`, root number `1`, poles at `0` and `1`; the completed functions agree off `0` and `1`,
  where Mathlib's `completedRiemannZeta` takes the junk value `Λ₀(0) − 1` at `0` while the
  canonical continuation is `0`, so the cards are not equal and the comparison is stated off the
  poles. Over `ℚ(i)` the coefficient at `5` is `2`, the two primes of norm `5`, where a card with
  coefficients `1` would give `1`.
- `heckeData` of the odd character mod `4∞` and `dirichletData` of `χ₄`: conductor `4`, shift `1`,
  root number `1`, and the same entire completed function; a ray-class card that forgot the real
  place in the conductor would have shift `0`.
- `grossencharacterData` of the presentation of `‖·‖^(−m)` over `ℚ` and `riemannZetaData`: the unitary
  part is trivial, so conductor `1` and real shift `0`, even for `m` odd; a card reading the parity of
  the algebraic exponent would have shift `1`.

### 8.2 Mertens' product over a number field

Prove `tendsto_prod_one_sub_inv_absNorm_div_log`: as `x → ∞`,
`∏_{N𝔭 ≤ x} (1 − N𝔭⁻¹)⁻¹ = e^γ κ_K log x · (1 + o(1))`, the product over the nonzero prime ideals of
`𝓞_K` of norm at most `x`, `γ` Euler's constant (Mathlib's `Real.eulerMascheroniConstant`) and
`κ_K = Res_(s=1) ζ_K(s)` the residue of `tendsto_sub_one_mul_dedekindZetaC` (Rosen's theorem, in the
form of Lebacque, *Generalised Mertens and Brauer–Siegel theorems*, Theorem 5 (NF), with
`γ_K = γ + log κ_K`). Route, after Rosen and Lebacque §4.1:

1. Mertens' first theorem for `K`, `∑_{N𝔭 ≤ x} log N𝔭 / N𝔭 = log x + O(1)`, is Tau Ceti's
   `TauCeti.LFunctions.isBigO_primeSummatory_log_absNorm_div_sub_log`, proved by evaluating
   `∑_{N𝔞 ≤ x} log N𝔞` twice from the ideal count `TauCeti.isBigO_card_idealsLE_sub` and the
   Chebyshev bound `ψ_K(x) = O(x)` of `TauCeti.primeIdealTheorem`.
2. Partial summation of step 1 gives `∑_{N𝔭 ≤ x} 1/N𝔭 = log log x + B_K + ε_K(x)` with `ε_K(x) → 0`
   (Lebacque, Proposition 2): Tau Ceti's `tendsto_primeSummatory_inv_absNorm_sub_log_log`, with
   `B_K = mertensConstant K`.
3. `B_K = γ + log κ_K + ∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)`: as `δ → 0⁺`, partial summation of step 2 gives
   `∑_𝔭 N𝔭^(−1−δ) = B_K − γ − log δ + o(1)`, while the Euler product of `ζ_K` and the residue give
   `log ζ_K(1 + δ) = −log δ + log κ_K + o(1)`; the difference
   `∑_𝔭 N𝔭^(−1−δ) − log ζ_K(1 + δ)` of the two left sides tends to
   `∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)` by dominated convergence against `∑_𝔭 N𝔭⁻²` (Lebacque,
   Proposition 3).
4. Subtracting, `∑_{N𝔭 ≤ x} log (1 − N𝔭⁻¹)⁻¹ = log log x + γ + log κ_K + o(1)`, the tail
   `∑_{N𝔭 > x} |log(1 − N𝔭⁻¹) + N𝔭⁻¹|` being at most `∑_{N𝔭 > x} N𝔭⁻² → 0`; exponentiate.

*Needs:* §3.5 (`tendsto_sub_one_mul_dedekindZetaC`); Tau Ceti
`isBigO_primeSummatory_log_absNorm_div_sub_log`, `tendsto_primeSummatory_inv_absNorm_sub_log_log`,
`mertensConstant`, `idealSummatory_mul_eq_sub_integral_mul`, `EulerProductData`; Mathlib
`dedekindZeta_residue`, `dedekindZeta_residue_pos`, `Real.eulerMascheroniConstant`.

**Checks.**

- Over `ℚ` it is Mertens' third theorem, `∏_{p ≤ x} (1 − 1/p)⁻¹ ~ e^γ log x`, with `κ_ℚ = 1`; a
  statement that drops `e^γ` (the naive `log x`) fails it, since `e^γ ≈ 1.781`.
- Over `K = ℚ(√−5)`, `h = 2`, `w = 2`, `|d_K| = 20`, `r₁ = 0`, `r₂ = 1`, `R = 1`, so
  `κ_K = 2^r₁ (2π)^r₂ h R/(w √|d_K|) = 4π/(2 √20) = π/√5 ≈ 1.405`; omitting the residue passes the
  rational test and is false here.
- Over `ℚ(i)`, `κ = 2π/(4 · 2) = π/4`, and the product runs over prime ideals, not rational primes:
  it is `(1 − 1/2)⁻¹ · ∏_{p ≡ 1 (4), p ≤ x} (1 − 1/p)⁻² · ∏_{p ≡ 3 (4), p² ≤ x} (1 − 1/p²)⁻¹`, the
  ramified `(1 + i)` of norm `2` once, two primes of norm `p` for `p ≡ 1 mod 4` and one of norm `p²`
  for `p ≡ 3 mod 4`. This is `∏_{p ≤ x} (1 − 1/p)⁻¹ (1 − χ₄(p)/p)⁻¹` up to a factor tending to `1`,
  so it is `~ e^γ L(1, χ₄) log x = e^γ (π/4) log x`, agreeing with `κ = π/4`; a product indexed by
  norms without multiplicity gives a different constant.
- The direction of the product: `∏ (1 − N𝔭⁻¹)` without the inverse tends to `0` like
  `e^(−γ) / (κ_K log x)`, Lebacque's form of (NF); the ratio in the statement would then tend to `0`,
  not `1`.

### Examples

Each example exercises a convention invisible in the easiest case.

- An odd real gamma factor, over `ℚ`: the card of the odd character mod `4∞` has real shift `1`
  (§8.1); the even character mod `5` has shift `0`.
- A complex-place multiplicity, over `ℚ(i)`: every card has one complex gamma factor and degree
  `2`, and `dedekindZetaData` has coefficient `2` at `5`.
- A nontrivial dual: the dual of the card of the order-three character modulo `7` is the card of
  its inverse, the conjugate character, with the conjugate root number.
- An imprimitive Euler factor, over the real quadratic field `ℚ(√5)`: `2` is inert (`x² − x − 1` is
  irreducible mod `2`), so the prime above `2` has norm `4`, and the presented series of the trivial
  character at the modulus `(2)` is `ζ_K(s)(1 − 4^(−s))`, whose card would be wrong; the primitive
  card is `dedekindZetaData`, with two real gamma factors and conductor `5`.

### Dependencies

Layers 0 and 3 to 6 (the cards). Tau Ceti: `riemannZetaData`, `dirichletData`,
`AnalyticLFunctionData.EqOffZero`, Mertens' first and second theorems for `K` with
`mertensConstant`, `isBigO_card_idealsLE_sub`, `primeIdealTheorem`,
`idealSummatory_mul_eq_sub_integral_mul`, `EulerProductData`. Mathlib: `riemannZeta`,
`completedRiemannZeta`, `dedekindZeta_residue`, `dedekindZeta_residue_pos`,
`Real.eulerMascheroniConstant`. Lebacque, Theorem 5 (NF) and Propositions 2–3.

## Downstream consumers

### Zeros of L-functions

The zeros roadmap consumes exact declarations and no prose-level promise: from Tau Ceti, the record
`TauCeti.LFunctions.AnalyticLFunctionData` with `AnalyticLFunctionData.dual`,
`AnalyticLFunctionData.HasDirichletAgreement`, `AnalyticLFunctionData.HasMeromorphicContinuation`,
`AnalyticLFunctionData.HasFunctionalEquation`, `NormalizationTranslation`, `riemannZetaData`,
`dirichletData` and `heckeLFunctionC`; from this roadmap, the average-coefficient-growth predicate
(§0.1), `dedekindZetaC`, `completedDedekindZeta`, `dedekindZetaData`, `completedHeckeLFunction`,
`heckeData` and `grossencharacterData`, with the continuation, functional-equation and nonvanishing
theorems named in Layers 3, 5 and 7. For every continued function, regularity away from its named
polar divisor is exported as `AnalyticAt` or `AnalyticOnNhd`, not merely by an inequality for
`meromorphicOrderAt`, which depends only on a punctured germ and does not constrain the total
representative's value.

### Prime distribution

A prime-distribution consumer — the `ψ → ϑ → π` transfer of Arithmetic Dirichlet Series, or a
Frobenius count in Chebotarev — takes its analytic input as named declarations: Tau Ceti's
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, the record `PrimeBoundaryRemainder K Set.univ 1`
on which the supplier's `primeIdealTheorem_of_boundary` is conditional (residue `1` from the simple
pole of `ζ_K`, and a continuous remainder across `Re s = 1` that exists because `ζ_K` has no zero
there); `primeIdealVonMangoldtBoundary_series_eq`, which identifies its series with the logarithmic
derivative of `dedekindZetaC` on `Re s > 1`; and `Grossencharacter.exists_continuousOn_logDeriv`, the
twisted counterpart this roadmap supplies. Hecke's angular equidistribution of Gaussian primes is a
consumer of the last together with `angularGrossencharacterData`.

## Scope and ownership

**This roadmap owns** the average-coefficient-growth predicate (§0.1); the Gaussians with one
parameter per infinite place, the theta series of a lattice of the mixed space with its
transformation law, and the Haar measures of the parameter space with Neukirch's (5.6) (§§1.1–1.3);
the continued partial zeta functions of ray classes and their compatibility with change of modulus
(§§2.1–2.2); the Epstein regression, the completed partial zeta functions, their Mellin kernel and
functional equation, the continuation, residues, functional equation and value at `0` of `ζ_K`, and
the normalization theorem (§§3.1–3.7); the quadratic and cyclotomic factorizations of the continued
`ζ_K` (§§4.1–4.2); the continuation of the presented Hecke L-functions, the orthogonality on the
continued functions, Gauss sums, and the completed L-function, root number and functional
equation of a primitive ray class character (§§5.1–5.4); the presentations of algebraic Hecke
characters, their L-functions, conductors, cards, finite and residue characters, harmonic
polynomials, theta kernels, completions and functional equations (§§6.1–6.10); the nonvanishing on
`Re s = 1` and the boundary data (§§7.1–7.5); the comparison cards and Mertens' product (§§8.1–8.2).

**Already in the Tau Ceti library and consumed here.** The following targets of this plan are
proved at the pin and are used by name (supplier contracts):

- *Layer 0*: the completed L-function record with its degree, gamma factor and the card of a
  Dirichlet series (`AnalyticLFunctionData`, `AnalyticLFunctionData.ofSeries`); the dual card with
  involutivity, degree preservation, gamma-factor conjugation and the transport of the three
  predicates; Dirichlet agreement, meromorphic continuation and the functional equation with its
  germ form; `AnalyticLFunctionData.EqOffZero`; the arithmetic record and the normalization
  translation with its existence, uniqueness, degree invariance, weight-zero identity and the
  equivalence of the two functional equations; `riemannZetaData` with its three predicates; the
  canonical continuation `TauCeti.meromorphicContinuation`.
- *Layer 1*: the pairing `mixedInner` and its transport `mixedInner_toMixed`, the bilinear form, the
  Fourier transform `mixedFourier` and `mixedFourier_toMixed`, the dual `mixedDual` with discreteness,
  full rank, biduality and covolume, Poisson summation over a lattice and over an ideal lattice, the
  trace-to-Euclidean map with its determinant, the comparison of the Euclidean dual of an ideal
  lattice with its trace dual and the covolume of the trace dual; the norm `archNorm`, the unit action
  `unitScale` with norm preservation and kernel the torsion, the norm-one hypersurface, the surface
  coordinates, unit fundamental domains with Mathlib's cone as one and their stability under
  inversion and translation; Mellin's principle with a level `TauCeti.FEPairWithLevel` with its
  transport, completed function, dual identity `toWeakFEPair_symm_Λ` and functional equation
  `Λ_eq`, `Λ_eventuallyEq`; Neukirch's decay to Mathlib's, `TauCeti.isBigO_rpow_of_isBigO_exp_neg`.
  Three Layer 1 names that other roadmaps cite resolve to these declarations: the dual ideal
  lattice `dualIdealLattice K I` is now Tau Ceti's `mixedDual K (mixedEmbedding.idealLattice K I)`,
  its trace-dual comparison `coe_dualIdealLattice` is now `mixedDual_idealLattice`, and its
  covolume `covolume_dualIdealLattice` is now `covolume_mixedDual` at the ideal lattice.
- *Layer 2*: the class indicator `rayClassCoeff`, the finite Euler correction, the convergence of the
  partial zeta series, their sum over the classes, their continuation minus the pole to
  `Re s > 1 − 1/n`, and the common one-sided residue.
- *Layer 3*: uniqueness of meromorphic continuation in both forms,
  `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane` and
  `TauCeti.eq_of_meromorphic_of_eqOn_halfPlane`.
- *Layer 4*: the cards `dirichletData` of primitive Dirichlet characters with exact conductor,
  parity-dependent gamma shift, Gauss-sum root number, continuation and functional equation; the
  quadratic factorization of Mathlib's `dedekindZeta` on `Re s > 1`.
- *Layer 5*: the ray class weight `RayClassCharacter.toUnitaryIdealWeight` and its value at an ideal
  prime to the modulus; `PrimitiveRayClassCharacter` with `of` and the inverse; the presented
  L-function `heckeLFunctionC`; `RayClassCharacter.eulerCorrection` with `eulerCorrection_one`; the
  induced and primitive comparisons `heckeLFunctionC_induced` and `heckeLFunctionC_eq_primitive` on
  the half-plane and as germs; the continuation of a nontrivial character to `Re s > 1 − 1/n`; the
  orthogonality of the series.
- *Layer 7*: the `3-4-1` inequality `3 + 4 cos θ + cos 2θ ≥ 0`, as
  `TauCeti.LSeries.threeFourOneCombination_nonneg` on the closed unit disk, the nonvanishing
  criterion built on it, and the nonvanishing on `Re s ≥ 1` of the continued L-function of a weight
  with cancellation whose square cancels, and off `s = 1` of one whose square is trivial on good
  ideals.
- *Layer 8*: the von Mangoldt series of `ζ_K`, `∑ Λ(𝔞) N𝔞^(−s) = −ζ_K′(s)/ζ_K(s)` on `Re s > 1`
  with its summability (`TauCeti.hasSum_idealTerm_vonMangoldt`, and
  `LSeries_primeVonMangoldtCoeff_univ_eq_deriv_dedekindZeta_div` for the supplier's coefficient
  carrier), and the nonnegativity of its coefficients (`IdealArithmeticFunction.vonMangoldt_re_nonneg`,
  `IdealArithmeticFunction.vonMangoldt_im`), both for Mathlib's `dedekindZeta` and hence for
  `dedekindZetaC` on `Re s > 1` by `dedekindZetaC_eq`; Mertens' first and second theorems for `K`,
  steps 1 and 2 of §8.2.

**Owned elsewhere.**

- Generic ideal-series operations, Euler-product calculus, norm regrouping, logarithmic
  derivatives, density predicates, Abel and Perron summation, Landau's theorem and Wiener–Ikehara:
  ArithmeticDirichletSeries, realized in Tau Ceti.
- Moduli, ray classes, adeles, ideles, Hecke-character carriers, the conductor of a ray class
  character with its universal property, and the conductor and finite components of a Hecke
  character: GlobalNumberFields, realized in Tau Ceti. This roadmap plans nothing about the
  ray-class conductor; the ray class count `rayClassIdealCount` is arithmetic input to Chebotarev,
  not to this roadmap.
- Poisson summation for a lattice in a real inner product space, the Fourier transform of a
  Gaussian on such a space, the dual-lattice, covolume, biduality and scaling lemmas, the theta
  series of a lattice and of its cosets on the upper half-plane, the `T`- and `S`-transformation
  laws, Gauss sums of a lattice and every modularity statement: ThetaSeries. Hecke's method needs
  the Gaussian only on the imaginary axis, and at the pins Mathlib's
  `SchwartzMap.tsum_eq_tsum_dual_fourier` and `fourier_gaussian_innerProductSpace` with Tau Ceti's
  mixed-space transport supply what this roadmap uses.
- Frobenius and Artin-symbol carriers: NumberFieldArithmetic. Frobenius prime sets, cyclotomic
  crossing, fixed-field fibres, Chebotarev density, Frobenius von Mangoldt weights and qualitative
  Chebotarev prime counting: Chebotarev.
- Prime counting itself — the `ψ`, `ϑ` and `π` transfer, the prime ideal theorem, and any
  equidistribution statement about prime ideals — is drawn by a consumer of the boundary data of
  §7.5 (ArithmeticDirichletSeries owns the transfer, Chebotarev the Frobenius counting). Mertens'
  product (§8.2) uses the prime ideal theorem only for the Chebyshev bound `ψ_K(x) = O(x)`.
- Zero distributions, zero-free regions, zero counting, the explicit formula and effective
  estimates: ZerosOfLFunctions.
- Artin reciprocity and class fields: ClassFieldTheory.
- Artin representations, their local reciprocal polynomials and conductors, Artin L-functions,
  Brauer induction and Artin formalism: AnalyticNumberTheoryPartI §2.18a, with the Artin conductors
  in its §2.2a.
- The L-functions of Hecke characters that are not algebraic — an infinity type with a real
  frequency `|x_w|^(i q_w)`, such as Hecke's unitary characters `|x₁|^(iλ) |x₂|^(−iλ)` of a real
  quadratic field, `λ ∈ (π / log ε) ℤ` — whose theta kernel carries the weights `|x_w|^(i q_w)` and
  whose gamma shifts become `ε_w + i q_w` and `|k_w|/2 + i q_w` (Neukirch VII (8.5) at the
  supplier's `ContinuousInfinityType`): AnalyticNumberTheoryPartI §2.3a, for every continuous
  unitary idele class character. This roadmap stops at integral infinity types; the imaginary norm
  twists `N^(it)` of an algebraic character enter Layer 7 through the weight, not as
  Grossencharacters, and the finite-order characters of Layer 5 have only the supplier's
  `FiniteOrderInfinityType` signs.
- Not covered by this roadmap: local epsilon factors and the adelic proof of the functional
  equation (Tate's thesis).

The absence of zero-distribution targets is intentional: a theorem that one named character
L-function is nonzero on `Re s = 1` belongs here, while uniform zero-free regions, zero counting and
consequences extracted from zeros belong downstream.

## Exact supplier contracts

### From Mathlib

- `riemannZeta`, `completedRiemannZeta` (`Λ = Λ₀ − 1/s − 1/(1 − s)`, with junk values at `0` and
  `1`), `Gammaℝ`, `Gammaℂ`, `Complex.Gamma`, `LSeries`, `LSeriesSummable`, `mellin` with
  `mellin_comp_mul_right` (`Mathlib/Analysis/MellinTransform.lean`), `MeromorphicNFOn`,
  `Meromorphic`, `meromorphicOrderAt`, `AnalyticAt`, `AnalyticOnNhd`.
- Mellin's principle `WeakFEPair` and `IsStrongFEPair` with `WeakFEPair.Λ`, `hasMellin`,
  `functional_equation`, `Λ_residue_zero`, `Λ_residue_k` and `differentiableAt_Λ`
  (`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean`); `isLittleO_exp_neg_mul_rpow_atTop`. They
  are consumed through Tau Ceti's level transport; no second Mellin theory is developed.
- `dedekindZeta`, `dedekindZeta_residue` (the constant `2^r₁ (2π)^r₂ h R / (w √|d_K|)`),
  `dedekindZeta_residue_pos`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (the one-sided
  residue) (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean`).
- `NumberField.classNumber`, `NumberField.Units.regulator`, `NumberField.Units.torsionOrder`,
  `NumberField.Units.rank`, `nrRealPlaces`, `nrComplexPlaces`, `NumberField.discr`.
- The mixed space `NumberField.mixedEmbedding.mixedSpace`, `realSpace`, `normAtPlace`,
  `idealLattice` with `covolume_idealLattice` (`N(I) 2^(−r₂) √|d_K|`), the Euclidean model
  `euclidean.mixedSpace` with `euclidean.toMixed` and `euclidean.volumePreserving_toMixed`,
  `ZLattice.covolume` with `ZLattice.covolume_comap`, the fundamental cone `fundamentalCone` with
  `fundamentalCone.isBounded_normLeOne`, `fundamentalCone.idealSetEquiv` and
  `card_isPrincipal_norm_eq_mul_torsion`.
- Poisson summation for a lattice, `SchwartzMap.tsum_eq_tsum_dual_fourier`, and the Fourier
  transform of the Gaussian `fourier_gaussian_innerProductSpace`; `Real.fourierChar`,
  `VectorFourier.fourierIntegral`, `LinearMap.BilinForm.dualSubmodule`.
- `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction`,
  `DirichletCharacter.rootNumber`, `DirichletCharacter.changeLevel`, `DirichletCharacter.IsPrimitive`,
  the functional equation `completedLFunction_one_sub` (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`),
  `gaussSum` and `gaussSum_mulShift_eq` (`Mathlib/NumberTheory/GaussSum.lean`), `MulChar`.
- `IsCyclotomicExtension`, `Algebra.trace`, `FractionalIdeal.dual`, `FractionalIdeal.absNorm`,
  `differentIdeal`, `Ideal.absNorm`, `Real.eulerMascheroniConstant`.

### From Tau Ceti

Paths are under `TauCeti/`. All the declarations below are proved at the pin.

- *Continuation* (`Analysis/Meromorphic/Continuation.lean`): `TauCeti.meromorphicContinuation`,
  the meromorphic normal form on `ℂ` agreeing with `f` on `Re s > σ`, and `0` when none exists;
  `meromorphicNFOn_meromorphicContinuation`, `meromorphicContinuation_eqOn` (agreement once a
  continuation exists), `meromorphicContinuation_eq`; and the uniqueness theorems
  `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane` (two meromorphic functions agreeing on a
  right half-plane have the same punctured germ at every point) and
  `TauCeti.eq_of_meromorphic_of_eqOn_halfPlane` (and the same value at every point where both are
  analytic).
- *The completed record* (`NumberTheory/LFunctions/Data/`): `TauCeti.LFunctions.AnalyticLFunctionData`
  (coefficients, conductor, real and complex gamma shifts, root number, completed function, polar
  divisor), `degree`, `gammaFactor`, `dual` with `dual_dual`, `degree_dual`, `gammaFactor_dual`;
  `HasDirichletAgreement`, `HasMeromorphicContinuation`, `HasFunctionalEquation` (unit root number,
  polar divisor symmetric under `s ↦ 1 − conj s`, `Λ(s) = ε Λ^∨(1 − s)` off both polar loci) with
  `HasDirichletAgreement.dual`, `HasMeromorphicContinuation.dual`, `HasFunctionalEquation.dual` and
  `HasFunctionalEquation.eventuallyEq`; `ofSeries` (completed function the canonical continuation of
  `N^(s/2) γ(s) L(s)` from `Re s > 1`, root number `Λ(2) / conj Λ(−1)`) with `ofSeries_eq`;
  `EqOffZero` (`Data/Comparison.lean`); `ArithmeticLFunctionData`, `NormalizationTranslation` with
  `NormalizationTranslation.of`, `existsUnique`, `analytic_degree`, `analytic_eq_of_weight_zero`
  and `hasFunctionalEquation_iff` (`Data/Normalization.lean`); `riemannZetaData` with its three
  predicates (`Data/RiemannZeta.lean`).
- *Mellin's principle with a level* (`NumberTheory/LSeries/FEPairWithLevel.lean`):
  `TauCeti.FEPairWithLevel` — `f`, `g` locally integrable on `(0, ∞)` and `0` on `t ≤ 0`, equal to
  constants at `∞` up to `O(t^r)` for every `r`, weight `k > 0`, `ε ≠ 0`, level `N > 0`, law
  `f(1/(N t)) = ε t^k g(t)` — with `toWeakFEPair` (`g ↦ g(·/N)`, `ε ↦ ε N^(−k)`), `Λ`, `hasMellin`,
  `differentiableAt_Λ`, `Λ_residue_zero`, `Λ_residue_k`, `toWeakFEPair_symm_Λ`, `Λ_eq`
  (`Λ(f, s) = ε N^(−s) Λ(g, k − s)` off `{0, k}`) and `Λ_eventuallyEq`; and
  `TauCeti.isBigO_rpow_of_isBigO_exp_neg` (`Analysis/SpecialFunctions/Exp/StretchedDecay.lean`).
- *The mixed space* (`NumberTheory/NumberField/CanonicalEmbedding/PoissonSummation.lean`,
  `…/TraceDual.lean`), in `TauCeti.NumberField.mixedEmbedding`: `mixedInner`, `mixedInner_toMixed`,
  `mixedInnerBilin`, `mixedFourier` (character `Real.fourierChar`, pairing `mixedInner`, measure
  `volume`, Mathlib's sign), `mixedFourier_toMixed`, `mixedDual` with its discreteness and full-rank
  instances, `mem_mixedDual`, `mixedDual_mixedDual`, `covolume_mixedDual`,
  `tsum_eq_tsum_mixedDual_mixedFourier` (Poisson summation over a full lattice),
  `tsum_idealLattice_eq_tsum_mixedDual_mixedFourier`; `traceToEuclidean` (identity on real
  coordinates, `z ↦ 2 conj z` on complex ones), `det_traceToEuclidean`, `abs_det_traceToEuclidean`,
  `mixedDual_idealLattice` (the Euclidean dual of `σ(I)` is `traceToEuclidean` of the trace dual),
  `covolume_idealLattice_dual`.
- *Parameters and unit fundamental domains* (`NumberTheory/LFunctions/Theta/UnitFundamentalDomain.lean`,
  `…/SurfaceCoordinates.lean`), in `TauCeti.LFunctions`: `unitScale` (`y_w ↦ |u|_w² y_w`),
  `archNorm`, `archNorm_unitScale`, `unitScale_eq_self_iff`, `normOneSurface`,
  `IsUnitFundamentalDomain` (bounded, measurable, meeting every orbit, stabilizer the torsion),
  `unitFundamentalDomain`, `isUnitFundamentalDomain_unitFundamentalDomain`,
  `IsUnitFundamentalDomain.inv`, `IsUnitFundamentalDomain.mul`, `surfaceScale`, `surfacePart`.
- *Ray classes and partial zeta series* (`NumberTheory/LFunctions/DedekindZeta/PartialZeta.lean`):
  `rayClassCoeff`, `finiteEulerCorrection`, `ofReal_rayClassIdealMainTerm`,
  `LSeriesSummable_rayClassCoeff`, `sum_LSeries_rayClassCoeff`, `sum_LSeries_rayClassCoeff_one`,
  `sum_LSeries_rayClassCoeff_eq_dedekindZeta_iff`,
  `exists_differentiableOn_eq_LSeries_rayClassCoeff_sub`, `tendsto_sub_one_mul_LSeries_rayClassCoeff`.
- *Dirichlet cards* (`NumberTheory/LFunctions/Dirichlet/Basic.lean`): `dirichletData` with
  `dirichletData_hasDirichletAgreement`, `dirichletData_hasMeromorphicContinuation`,
  `dirichletData_hasFunctionalEquation`, `dirichletData_modOne`, `dirichletData_dual`; and the
  quadratic factorization `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`
  (`NumberTheory/NumberField/Quadratic/DedekindZeta.lean`).
- *Hecke L-functions* (`NumberTheory/LFunctions/Hecke/`): `heckeLFunctionC`,
  `meromorphicNFOn_heckeLFunctionC`, `heckeLFunctionC_induced`, `heckeLFunctionC_induced_eventuallyEq`,
  `heckeLFunctionC_eq_primitive`, `heckeLFunctionC_eventuallyEq_primitive`;
  `PrimitiveRayClassCharacter` with `of`, `conductor_of`, `induced_character_of`, its `One` and
  `InvolutiveInv` instances, `conductor_inv`, `character_inv`;
  `RayClassCharacter.eulerCorrection` with `differentiable_eulerCorrection`, `eulerCorrection_one`,
  `eulerCorrection_ne_zero`; `sum_inv_mul_LSeries_toUnitaryIdealWeight` (orthogonality of the
  series).
- *Prime ideals* (`NumberTheory/LFunctions/PrimeIdealBoundary.lean`, `…/Mertens.lean`):
  `primeIdealVonMangoldtBoundary`, `primeIdealVonMangoldtBoundary_series`,
  `isBigO_primeSummatory_log_absNorm_div_sub_log`, `mertensConstant`,
  `tendsto_primeSummatory_inv_absNorm_sub_log_log`.
- *Arithmetic Dirichlet series* (`NumberTheory/ArithmeticDirichletSeries/`), in `TauCeti`:
  `IdealArithmeticFunction`, `MultiplicativeIdealWeight` with `IsNormTwistOnGood` and
  `IsTrivialOnGood`, `UnitaryIdealWeight` with `normTwist` and `conj`, `normCoeff`, `regroupByNorm`,
  `EulerProductData`, `HasCancellation`, `not_hasCancellation_of_isTrivialOnGood`,
  `continuedLFunctionOfWeight` with `continuedLFunctionOfWeight_eq_LSeries`,
  `differentiableOn_continuedLFunctionOfWeight` and
  `differentiableAt_continuedLFunctionOfWeight`, `hasCancellation_conj_iff`,
  `HasCancellation.normTwist` (for `[K:ℚ] > 1`), `UnitaryIdealWeight.ne_zero_of_eqOn_LSeries` (the
  `3-4-1` criterion for weights), `continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq`,
  `continuedLFunctionOfWeight_ne_zero_of_isNormTwistOnGood_sq` and
  `continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` (nonvanishing on `Re s ≥ 1`,
  `…/Cancellation/Nonvanishing.lean`), `idealSummatory_mul_eq_sub_integral_mul` (Abel summation),
  `PrimeBoundaryRemainder`, `primeVonMangoldtCoeff`, `primeIdealTheorem_of_boundary`,
  `primeIdealTheorem`, `hasSum_idealTerm_vonMangoldt`,
  `LSeries_primeVonMangoldtCoeff_univ_eq_deriv_dedekindZeta_div`,
  `IdealArithmeticFunction.vonMangoldt_re_nonneg`, `IdealArithmeticFunction.vonMangoldt_im`; and
  `TauCeti.isBigO_card_idealsLE_sub` (`NumberTheory/NumberField/DedekindZeta.lean`: the ideal count
  `κ_K x + O(x^(1 − 1/n))`).
- *Geometry of numbers* (`NumberTheory/GeometryOfNumbers/LatticePointCount.lean`,
  `NumberTheory/NumberField/CanonicalEmbedding/NormLeOneLipschitz.lean`):
  `TauCeti.abs_ncard_inter_mul_sub_measureReal_le` (the lattice points of a bounded set against its
  volume, up to the lattice points of its thickened frontier) and
  `NumberField.mixedEmbedding.fundamentalCone.isLipschitzParametrizable_frontier_normLeOne`.
- *L-series positivity* (`NumberTheory/LSeries/`), in `TauCeti.LSeries`:
  `threeFourOneCombination_nonneg` (`0 ≤ 3 + 4 Re z + Re z²` for `‖z‖ ≤ 1`),
  `ne_zero_of_threeFourOne` (the generic `3-4-1` nonvanishing criterion), `landau` (a Dirichlet
  series with nonnegative coefficients has no analytic continuation across its abscissa of
  absolute convergence).
- *Global number fields* (`NumberTheory/NumberField/Global/`), in `TauCeti.GlobalNumberFields`:
  `Modulus` with `support`, `IsCoprimeTo`, `mem_support_iff`, `support_one`, `Modulus.one` and
  divisibility; `RayClassGroup`, `finite_rayClassGroup`, `integralIdealsPrimeTo`, `idealClass`,
  `idealsPrimeTo`, `classMap` (the transition map for `𝔪 ∣ 𝔫`), `rayClassIdealMainTerm` with
  `rayClassIdealMainTerm_eq`, `isBigO_rayClassIdealCountingFunction_sub`; `IsCongrOne`,
  `primeToSubgroup`, `narrowModulus`, `ratModulus`, `ratFiniteModulus`, `ratModulusEquivZMod`;
  `RayClassCharacter` with `induced`, `IsPrimitive`, `conductor`, `primitiveCharacter`,
  `conductor_dvd_iff`, `induced_primitiveCharacter`, `isPrimitive_iff_conductor_eq`,
  `isPrimitive_primitiveCharacter`, `conductor_one`, `conductor_inv`, `toUnitaryIdealWeight`,
  `val_toUnitaryIdealWeight`, `toMultiplicativeIdealWeight_apply_of_isPrimeTo`, `onIdeals_apply`,
  `hasCancellation_toUnitaryIdealWeight`, `rayClassCharacter_partialSums`; `ratDirichletEquiv`,
  `ratDirichletEquiv_absNorm`, `conductor_finitePart_eq_span`,
  `conductor_infinitePart_eq_empty_iff_even`; `HeckeCharacter` with `ofRayClassCharacter`,
  `ofRayClassCharacter_apply`, `mem_range_ofRayClassCharacter_iff`, `shift` (`|χ| = ‖·‖^shift`),
  `norm_apply_eq_rpow_shift`, `normPow`, `shift_normPow`, `unitaryPart`, `infinityType`,
  `IsFiniteOrder`, `isFiniteOrder_iff_exists_rayClassCharacter`, `shift_ofRayClassCharacter`,
  `conductor` (finite order), `finiteConductor` with `finiteConductor_ne_bot`,
  `pow_dvd_finiteConductor_iff` and `finitePart_conductor`, `finiteComponent`, `idealCharacter` with
  `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal` and
  `idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`, `toUnitaryIdealWeightAt`,
  `IsAlgebraic`, `normCharacter` with `not_isAlgebraic_normCharacter`,
  `exists_finiteOrderInfinityType`; `ContinuousInfinityType` (with `realParity`, `complexExponent`,
  `complexAngularFrequency`) and `ContinuousInfinityType.AgreesOnIdentityComponent`,
  `AlgebraicInfinityType` (`(K →+* ℂ) → ℤ`) with `toContinuous` and `toContinuous_injective`,
  `FiniteOrderInfinityType`; `ideleCongruenceSubgroup`, `ideleInfiniteCoord`, `ideleNorm`, and
  Mathlib's `NumberField.IdeleGroup (𝓞 K) K` as the idele group. The idelic names are what pin a
  presentation to its Hecke character: no idele, prime idele or congruence subgroup is constructed
  here, and reciprocity and class fields are not used to restate a Hecke character.

## References

- J. Neukirch, *Algebraic Number Theory*, Chapters VI and VII. Chapter VII is cited by number:
  (1.4) the Mellin principle; (3.6) the theta transformation; (5.3)–(5.9) the unit quotient, the
  fundamental domain and its volume, the Mellin kernel, its transformation law and the functional
  equation of the partial zeta functions; (5.11) the order and leading coefficient of `ζ_K` at
  `s = 0`; (6.1)–(6.4) Größencharaktere, the finite character and the Gauss sum; (6.13)–(6.14) the
  correspondence with idele class characters and the sign of the archimedean component;
  (7.4)–(7.8) the theta series with a harmonic polynomial and its transformation; (8.2)–(8.6) the
  Hecke L-series as a Mellin transform, its transformation law, root number and functional
  equation.
- P. Lebacque, *Generalised Mertens and Brauer–Siegel theorems*, Acta Arith. 130 (2007)
  (arXiv:math/0703570), Theorem 5 (NF), and Propositions 2 and 3 of §4.1 (arXiv version,
  pp. 8–9): Mertens' product over a number field and the expansion of `∑ 1/N𝔭`, due to M. Rosen,
  *A generalization of Mertens' theorem*, J. Ramanujan Math. Soc. 14 (1999).
- D. Loeffler and M. Stoll, *Formalizing zeta and L-functions in Lean*, Annals of Formalized
  Mathematics 1 (2025), 43–56 (arXiv:2503.00959), §6, p. 54: the nonvanishing of Dirichlet
  L-functions on `Re s ≥ 1` in Mathlib.
- E. Hecke, *Eine neue Art von Zetafunktionen und ihre Beziehungen zur Verteilung der
  Primzahlen (Zweite Mitteilung)*, Math. Z. 6 (1920), 11–51: §6, (45), p. 35, the functional
  equation of the L-function of a Größencharakter with a primitive residue class character; §7,
  (46), p. 35, the prime ideal theorem with remainder for every nonprincipal Größencharakter; §9,
  p. 44, the characters of an imaginary quadratic field and their gamma factor.
- L. C. Washington, *Introduction to Cyclotomic Fields*, 2nd ed., Theorem 4.3: the Dedekind zeta
  function of the field of a group of Dirichlet characters is the product of their L-functions.
