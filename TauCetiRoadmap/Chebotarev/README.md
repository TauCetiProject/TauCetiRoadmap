# Roadmap: the Chebotarev density theorem

Let `L/K` be a finite Galois extension of number fields, `G = Gal(L/K)`, and `C ⊆ G` a
conjugacy class. Mathlib has arithmetic Frobenius elements (`arithFrobAt`), the Dedekind zeta
function and its residue at `s = 1`, ideal-counting asymptotics, and Dirichlet's theorem on
primes in arithmetic progressions. It has **no density theory for prime ideals at all**: no
Dirichlet density, no `L`-series indexed by ideals, no Frobenius class function, and no
Tauberian theorem. We build all of that here, and use it to reach Chebotarev in two forms.

The first is the **Dirichlet-density form**: the set of primes `𝔭` of `K` unramified in `L`
with `Frob 𝔭 = C` has Dirichlet density `|C| / |G|`.

The second is the **prime-number-theorem form**:

```text
ϑ_C(x) := ∑_{N𝔭 ≤ x, 𝔭 unramified, Frob 𝔭 = C} log N𝔭  ~  (|C| / |G|) · x
```

and hence

```text
π_C(x) := #{𝔭 : N𝔭 ≤ x, 𝔭 unramified, Frob 𝔭 = C}  ~  (|C| / |G|) · Li(x),
```

where `Li(x) = ∫_2^x dt / log t`. Only the behaviour as `x → ∞` is used, so the lower limit `2`
avoids the singularity at `1`; this is a choice of normalisation, pinned below.

Along the way the roadmap builds three things that are worth more than the headline: a general
theory of Dirichlet density for sets of prime ideals, weighted Euler products over the ideals of
a number field (the missing ideal-indexed analogue of `Mathlib/NumberTheory/EulerProduct/`),
and a reusable Wiener–Ikehara Tauberian theorem stated in Mathlib's `LSeries` vocabulary.

Suggested homes in Tau Ceti:

```text
TauCeti/NumberTheory/NumberField/FrobeniusClass.lean
TauCeti/NumberTheory/NumberField/PrimeIdealDensity.lean
TauCeti/NumberTheory/LSeries/IdealEulerProduct.lean
TauCeti/NumberTheory/LSeries/GaloisCharacter.lean
TauCeti/NumberTheory/Tauberian/WienerIkehara.lean
TauCeti/NumberTheory/Chebotarev/
```

The accompanying [`Suggested.lean`](Suggested.lean) records representative signatures; this
markdown document is the specification.

## Standing hypotheses and conventions

Decide these once, here, or implementors will make incompatible choices.

1. **Frobenius is arithmetic Frobenius.** At an unramified prime it acts on the residue field by
   `x ↦ x ^ N𝔭`. This is Mathlib's `IsArithFrobAt` and we adopt it unchanged. Any comparison
   with a source using geometric Frobenius must insert the inverse explicitly.

2. **Prime ideals are nonzero.** Every prime set and prime sum here carries the nonzero
   condition. Do not rely on `Ideal.IsPrime` alone: `⊥` is prime in a domain.

3. **Finite dimensionality is explicit.** A Galois extension here carries `[FiniteDimensional K L]`
   alongside `[IsGalois K L]`. Do not use `[IsGalois K L]` as a substitute for finiteness.

4. **Conjugacy classes are the public object.** The Frobenius class function is valued in
   `ConjClasses Gal(L/K)`, and the headline theorems are stated for a `C : ConjClasses Gal(L/K)`.
   An element-valued Frobenius is used only when the Galois group is commutative
   (`[IsMulCommutative Gal(L/K)]`), where `ConjClasses.mkEquiv` identifies the two.

5. **The class function is total, and its default value is never used bare.** `frobeniusClass K L 𝔭`
   is defined for every ideal `𝔭`, with a junk value off the nonzero-unramified-prime locus, in
   the style of `Ideal.ramificationIdxIn`. Every theorem about it carries hypotheses placing `𝔭`
   in that locus.

6. **Unramifiedness is spelled `Ideal.ramificationIdxIn 𝔭 (𝓞 L) = 1`.** This is Mathlib's
   vocabulary for "`𝔭` is unramified in `L`" in the Galois setting, where all the ramification
   indices above `𝔭` agree. Prove its equivalence with `Algebra.IsUnramifiedAt (𝓞 K) 𝔓` for the
   primes `𝔓` above `𝔭` (Mathlib's `Algebra.isUnramifiedAt_iff_of_isDedekindDomain`), and use
   whichever is convenient thereafter.

7. **Dirichlet density is defined by the ratio.** For a set `S` of nonzero primes of `𝓞 K` put
   `P_S(s) = ∑_{𝔭 ∈ S} N𝔭^{-s}` for real `s > 1`. Then `HasDirichletDensity S δ` means
   `P_S(s) / P_all(s) → δ` as `s → 1⁺`. The normalisation by `log(1/(s-1))` is proved
   equivalent in Layer 1; it is a theorem, not a second definition.

8. **The Frobenius von Mangoldt coefficient detects `Frob 𝔭 ^ j`, not `Frob 𝔭`.** For
   `σ ∈ G` (or a class `C`),

   ```text
   Λ_{L/K,σ}(n) = ∑_{𝔭, j ≥ 1 : N𝔭^j = n, Frob 𝔭 ^ j = σ} log N𝔭.
   ```

   This is forced by the Euler product, and the condition `Frob 𝔭 = σ` in its place does **not**
   produce the logarithmic derivative below. Layer 9 pins this with an explicit `j = 2` test.

9. **The regularised principal logarithmic derivative carries this sign.** If `L₁` has a simple
   pole at `s = 1` then `L₁'(s)/L₁(s) ~ -1/(s-1)`, so the function that extends continuously to
   `Re s ≥ 1` is

   ```text
   -L₁'(s)/L₁(s) - 1/(s-1).
   ```

   Nonprincipal characters need no correction term.

10. **Cyclotomic conductors are normalised internally.** If `m ≡ 2 (mod 4)` then `K(μ_m) = K(μ_{m/2})`.
    Every public cyclotomic theorem is stated for all positive `m`; replacing `m` by its
    normalised conductor is an internal lemma, never a hypothesis on the user.

11. **`Li` is the offset logarithmic integral** `∫_2^x dt / log t`. Prove `Li(x) ~ x / log x` so
    that either normalisation of the `π_C` asymptotic is available.

## What Mathlib already has (consume)

- **Arithmetic Frobenius:** `Mathlib/RingTheory/Frobenius.lean` — `AlgHom.IsArithFrobAt`,
  `IsArithFrobAt`, existence (`IsArithFrobAt.exists_of_isInvariant`), uniqueness at an
  unramified prime (`AlgHom.IsArithFrobAt.eq_of_isUnramifiedAt`), conjugation
  (`IsArithFrobAt.conj`), the chosen element `arithFrobAt` and the conjugacy of the choices
  over a fixed prime (`isConj_arithFrobAt`), and the roots-of-unity formula
  `AlgHom.IsArithFrobAt.apply_of_pow_eq_one` (`φ ζ = ζ ^ q`), which is the cyclotomic Frobenius
  formula in disguise.
- **The Galois action in the AKLB setting:** `IsIntegralClosure.MulSemiringAction`,
  `Algebra.isInvariant_of_isGalois`, and `IsGaloisGroup` /
  `IsGaloisGroup.of_isFractionRing` (`Mathlib/FieldTheory/Galois/IsGaloisGroup.lean`), which
  bundles the `SMulCommClass` and `Algebra.IsInvariant` needed to apply `arithFrobAt` to
  `𝓞 L`.
- **Ramification and inertia:** `Mathlib/NumberTheory/RamificationInertia/*` —
  `Ideal.ramificationIdxIn`, `Ideal.inertiaDegIn`,
  `Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn` (the Galois `r·e·f = [L:K]`),
  transitivity of the Galois action on `Ideal.primesOver`
  (`Ideal.exists_smul_eq_of_isGaloisGroup`), the decomposition and inertia groups and their
  fixed fields (`HilbertTheory.lean`), and `Algebra.isUnramifiedAt_iff_of_isDedekindDomain`.
- **Ideal norms and counting:** `Ideal.absNorm` and its multiplicativity,
  `Ideal.finite_setOf_absNorm_le`, and the asymptotics in
  `Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean`
  (`NumberField.Ideal.tendsto_norm_le_div_atTop`, its unnormalised form
  `NumberField.Ideal.tendsto_norm_le_div_atTop₀`, and the refinement by ideal class
  `NumberField.Ideal.tendsto_norm_le_and_mk_eq_div_atTop`).
- **The Dedekind zeta function:** `NumberField.dedekindZeta`, `NumberField.dedekindZeta_residue`,
  and the class number formula `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`. Note that
  Mathlib defines `dedekindZeta` as the `LSeries` of `n ↦ #{I : absNorm I = n}`; regrouping an
  ideal sum by its norm is therefore the standard bridge to `LSeries`, and Layer 1 makes that
  bridge a reusable theorem rather than an inlined step.
- **`LSeries`:** `Mathlib/NumberTheory/LSeries/*` — `LSeries`, `LSeries.term`, `LSeriesSummable`,
  `LSeriesHasSum`, `abscissaOfAbsConv`, termwise differentiation (`Deriv.lean`), and
  `SumCoeff.lean` (relating coefficient sums to the behaviour of the series at `s = 1`).
- **Euler products over `ℕ`:** `Mathlib/NumberTheory/EulerProduct/Basic.lean`
  (`EulerProduct.eulerProduct`, `EulerProduct.eulerProduct_hasProd`, and
  `EulerProduct.eulerProduct_completely_multiplicative`).
  These are `ℕ`-indexed; Layer 2 supplies the ideal-indexed version by regrouping.
- **Non-vanishing on `Re s = 1`:** `Mathlib/NumberTheory/LSeries/Nonvanishing.lean`,
  `DirichletCharacter.LFunction_ne_zero_of_re_eq_one`. Its de la Vallée Poussin argument, and
  the positivity input `3 + 4cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0`, are the model for Layer 8.
- **Dirichlet's theorem on primes in arithmetic progressions:**
  `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` —
  `Nat.infinite_setOf_prime_and_eq_mod` and `Nat.forall_exists_prime_gt_and_eq_mod`. Layer 5
  consumes this to choose admissible moduli. **This is not circular:** Mathlib proves it from
  Dirichlet `L`-functions over `ℚ`, independently of anything here.
- **Chebyshev functions and von Mangoldt:** `Mathlib/NumberTheory/Chebyshev.lean`
  (`Chebyshev.psi`, `Chebyshev.theta`) and
  `Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean`. These are the `ℚ` case and the
  models for the ideal-theoretic versions.
- **Abel summation:** `Mathlib/NumberTheory/AbelSummation.lean`.
- **Analysis for the Tauberian layer:** the Fourier transform and its inversion, interval
  integration, `MeasureTheory`, bounded variation (`Mathlib/Analysis/BoundedVariation.lean`),
  and `Mathlib/Analysis/Asymptotics/*`.
- **Finite abelian character duality:** `Mathlib/GroupTheory/FiniteAbelian/Duality.lean`
  (`monoidHom_mulEquiv_of_hasEnoughRootsOfUnity`, `card_monoidHom_of_hasEnoughRootsOfUnity`, and
  the separation property `exists_apply_ne_one_of_hasEnoughRootsOfUnity`). The orthogonality
  *sums* are in Mathlib only for Dirichlet characters
  (`Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean`); Layer 2 restates them for a
  finite abelian group and rederives the Dirichlet case from that.
- **Cyclotomic extensions:** `Mathlib/NumberTheory/Cyclotomic/*`, including the Galois group
  `IsCyclotomicExtension.autEquivPow` and the ramification behaviour of `ℚ(μ_m)`.

Tau Ceti already contains material this roadmap uses:

- `TauCeti/NumberTheory/EffectiveBounds/IdealCount.lean` (`TauCeti.NumberField.card_ideal_absNorm_le`),
  an explicit elementary bound on the number of ideals of bounded norm;
- `TauCeti/NumberTheory/DedekindDomain/RamificationInertia.lean` and
  `TauCeti/NumberTheory/NumberField/SplitsCompletely.lean`, criteria for a prime to split
  completely in a Galois extension, which Layer 6 specialises to the identity class.

## What is missing (build here)

Everything in Layers 0–13 except what is listed above. In particular Mathlib has no Frobenius
**class** function for a number field extension, no Dirichlet density, no ideal-indexed
`L`-series or Euler products, no Galois-character `L`-functions, no Wiener–Ikehara theorem, no
prime-ideal theorem, and no Chebotarev.

Two small gaps are worth naming precisely, because an implementor will hit them immediately:

- **The AKLB instances are not global.** Applying `arithFrobAt` to `𝓞 L` currently requires
  introducing `IsIntegralClosure.MulSemiringAction (𝓞 K) K L (𝓞 L)`,
  `IsGaloisGroup.of_isFractionRing`, and the `SMulCommClass` it carries, by hand at every use
  site. Layer 0 provides these once, as instances on `𝓞 K → 𝓞 L` for number fields, so that
  downstream statements are free of the plumbing.
- **`ConjClasses` is not a monoid.** `ConjClasses α` carries only `One`, so `C ^ j` does not
  typecheck, yet the von Mangoldt coefficient of convention 8 needs exactly that. Layer 0
  supplies the `j`-th power of a conjugacy class (well defined because `IsConj` is preserved by
  taking powers) together with its compatibility with `ConjClasses.mk`. State it for a general
  monoid `α`, not for Galois groups: it is Mathlib-shaped material and belongs in the general
  namespace.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's types expressible,
state its milestones in `Suggested.lean` with `sorry`.

### Layer 0: Frobenius classes in towers of number fields

References: Sharifi §§2.6, 7.2; Stevenhagen–Lenstra §3 and Appendix.

**Instances and the class function.** Provide the AKLB instances named above. Then define
`frobeniusClass K L 𝔭 : ConjClasses Gal(L/K)` for every `𝔭 : Ideal (𝓞 K)`, as the class of
`arithFrobAt (𝓞 K) Gal(L/K) 𝔓` for a prime `𝔓` of `𝓞 L` above `𝔭` (junk value elsewhere,
per convention 5). Also define the set of unramified primes with a given class.

**Theorems.**

- Well-definedness: for every prime `𝔓` of `𝓞 L` above a nonzero prime `𝔭`,
  `frobeniusClass K L 𝔭 = ConjClasses.mk (arithFrobAt (𝓞 K) Gal(L/K) 𝔓)`. This is the
  workhorse; it is what lets every later proof choose its own `𝔓`. It follows from
  `isConj_arithFrobAt`.
- At an unramified `𝔭`, the Frobenius at `𝔓` is the *unique* element of `Gal(L/K)` acting as
  `x ↦ x ^ N𝔭` on `𝓞 L / 𝔓` (from `AlgHom.IsArithFrobAt.eq_of_isUnramifiedAt`), and it
  generates the decomposition group; its order is the inertia degree `f(𝔓|𝔭)`.
- `𝔭` splits completely in `L` iff `frobeniusClass K L 𝔭 = 1`, for unramified `𝔭`. Connect this
  to `TauCeti/NumberTheory/NumberField/SplitsCompletely.lean`.
- Compatibility with a tower `M/L/K`, both `M/K → L/K` by restriction (for `L/K` Galois) and
  `M/L` versus `M/K` for the primes of `L`.
- Compatibility with an isomorphism of extensions: an isomorphism `L ≃ L'` over an isomorphism
  `K ≃ K'` carries Frobenius classes to Frobenius classes.
- The cyclotomic formula: if `μ_m ⊆ L` and `N𝔭` is coprime to `m`, then every element of
  `frobeniusClass K L 𝔭` sends `ζ ↦ ζ ^ N𝔭` for every `m`-th root of unity `ζ`. Consume
  `AlgHom.IsArithFrobAt.apply_of_pow_eq_one`.
- The set of primes of `K` ramified in `L` is finite, and so is the set of primes whose norm is
  not coprime to a fixed positive integer.
- The `j`-th power of a conjugacy class, and `(frobeniusClass K L 𝔭) ^ j` as the Frobenius class
  in the sense of convention 8.
- Restate the Galois `r·e·f = [L:K]` relation
  (`Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn`) in the number-field
  vocabulary used later, including the unramified specialisation `r · f = [L:K]`.

### Layer 1: prime-ideal density and counting functions

References: Sharifi §§7.1.12–7.1.14.

**Definitions.** `primeDirichletSum S s = ∑_{𝔭 ∈ S} (N𝔭 : ℝ)^{-s}` for a set `S` of primes of
`𝓞 K`; `HasDirichletDensity S δ` per convention 7; the upper and lower Dirichlet densities
using `limsup` and `liminf`; and the counting functions

```text
π_S(x) = #{𝔭 ∈ S : N𝔭 ≤ x},   ϑ_S(x) = ∑_{𝔭 ∈ S, N𝔭 ≤ x} log N𝔭.
```

**Theorems.** The complete basic API, not merely what the headline needs:

- absolute convergence and monotonicity of `P_S(s)` for `s > 1`, and `P_S ≤ P_T` for `S ⊆ T`;
- a finite set of primes has Dirichlet density `0`;
- invariance of every density under finite symmetric difference;
- additivity over finite pairwise-disjoint unions, and monotonicity of upper and lower density;
- upper density equals lower density iff the density exists, with the common value;
- **regrouping by norm:** a sum over ideals (or over prime powers) of a function of the ideal
  equals the `LSeries` of the function `n ↦ ∑_{N𝔞 = n} …`. This is the bridge to Mathlib's
  `ℕ`-indexed `LSeries` and `EulerProduct`, and it is used in Layers 2, 8 and 9;
- finiteness of the sets of ideals and of prime ideals of bounded norm (`Ideal.finite_setOf_absNorm_le`);
- `#{𝔞 : N𝔞 ≤ x} = O_K(x)`, from `NumberField.Ideal.tendsto_norm_le_div_atTop`;
- the contribution of a fixed finite set of primes to `ϑ_S(x)` is bounded, and finite changes to
  `S` do not affect a `ϑ`- or `π`-asymptotic;
- `P_all(s) = log(1/(s-1)) + O_K(1)` as `s → 1⁺`, from the Dedekind zeta residue, and the
  consequent equivalence of the two normalisations of Dirichlet density (convention 7);
- the prime ideals of residue degree at least `2` over `ℚ` contribute a `P`-sum bounded as
  `s → 1⁺`, and a `ϑ`-contribution `O_K(√x log x)`. Both are used repeatedly, so prove them once
  here in the sharpest form the ideal count gives.

### Layer 2: weighted Euler products over ideals, and Galois characters

References: Sharifi §§7.1.15–7.1.19.

**Weighted ideal Euler products.** Let `w` be a completely multiplicative function on the nonzero
ideals of `𝓞 K` with `w(1) = 1` and `‖w 𝔞‖ ≤ 1`. For `Re s > 1`:

```text
∑_{𝔞 ≠ 0} w(𝔞) N𝔞^{-s}  =  ∏_𝔭 (1 - w(𝔭) N𝔭^{-s})⁻¹.
```

Build the API: absolute convergence of both sides; invariance under reindexing by prime
factorisation; local uniform convergence on `Re s ≥ 1 + ε`; termwise differentiation; nonvanishing
of the product on `Re s > 1`; and the logarithmic-derivative formula

```text
-L_w'(s)/L_w(s) = ∑_𝔭 ∑_{j ≥ 1} w(𝔭)^j (log N𝔭) N𝔭^{-js}.
```

Prove these by regrouping by norm (Layer 1) and consuming `EulerProduct.eulerProduct`, rather than
redeveloping the convergence theory. Specialise to `w = 1` to identify `NumberField.dedekindZeta`
with the ideal series and give it its Euler product — a result Mathlib does not have and which is
of independent use. This layer is general number-field `L`-series infrastructure and does **not**
live in the Chebotarev namespace.

**Galois characters.** For `L/K` abelian with group `G`, let `Ĝ = Hom(G, ℂˣ)` and extend
`χ ∈ Ĝ` to ideals by `χ(𝔭) = χ(Frob 𝔭)` at unramified `𝔭` and `χ(𝔭) = 0` at ramified `𝔭`,
multiplicatively. Prove:

- complete multiplicativity and `‖χ(𝔞)‖ ≤ 1`;
- the ideal-series and Euler-product descriptions of `L(χ, s)` on `Re s > 1`;
- at every unramified prime of `K`, the local factor of `ζ_L` factors as the product of the local
  `χ`-factors over `χ ∈ Ĝ`;
- the global factorisation, **with its ramified correction**:

  ```text
  ζ_L(s) = (∏_{χ ∈ Ĝ} L(χ, s)) · R_{L/K}(s)   for Re s > 1,
  ```

  where `R_{L/K}(s) = ∏_{𝔓 : 𝔓 ∩ 𝓞 K ramified in L} (1 - N𝔓^{-s})⁻¹` is a finite Euler product,
  analytic and nonvanishing on `Re s > 0`, with bounded logarithm near `s = 1`. The correction
  is required, not bookkeeping: because `χ` was defined to vanish at ramified primes, the
  factorisation is false without it;
- row and column orthogonality for `Ĝ`.

### Layer 3: cyclotomic Chebotarev, Dirichlet-density form

References: Sharifi §7.2.1; Stevenhagen–Lenstra, Appendix (cyclotomic step).

Let `L = K(μ_m)`, working internally with the normalised conductor (convention 10).

**Analytic input at `s = 1`.** For a nontrivial Galois character `χ`, prove that `L(χ, s)`
continues analytically to `Re s > 1 - 1/[K:ℚ]` and that `L(χ, 1) ≠ 0`. The continuation comes from
the ideal-counting estimate of Layer 1 applied to the partial sums of the coefficients; the
non-vanishing comes from the factorisation of Layer 2 together with the simple pole of `ζ_L`.

**Frobenius fibres.** For `σ ∈ G`,

```text
∑_{𝔭 unramified, Frob 𝔭 = σ} N𝔭^{-s} = (1/|G| + o(1)) · log(1/(s-1))   as s → 1⁺,
```

by the cyclotomic Frobenius formula, character orthogonality, and boundedness of the nontrivial
factors near `s = 1`. Conclude that every Frobenius fibre has Dirichlet density `1/|G|`.

### Layer 4: fixed-field transfer for Dirichlet density

References: Sharifi Theorem 7.2.2 Step 1; Stevenhagen–Lenstra, Appendix.

Let `σ ∈ G`, `H = ⟨σ⟩`, `E = L^H`, `C = [σ]`. Keep the algebraic prime counting separate from the
density argument, so Layer 10 can reuse the former verbatim.

**Algebraic counting.** For unramified `𝔭` of `K` with `frobeniusClass K L 𝔭 = C`:

- the Frobenius elements at the primes of `L` above `𝔭` are equidistributed over `C`;
- the number of primes of `L` above `𝔭` with Frobenius exactly `σ` is `|G| / (|H| · |C|)`;
- the number of primes `𝔮` of `E` above `𝔭` of relative residue degree `1` with
  `frobeniusClass E L 𝔮 = σ` is `|C_G(σ)| / |H|`, and each satisfies `N𝔮 = N𝔭`;
- Frobenius is compatible with the tower `L/E/K`.

Prove these by the orbit-counting argument: primes of `L` above `𝔭` are a transitive
`G`-set with stabiliser the decomposition group, and the `x` with `x⁻¹ (Frob 𝔭) x = σ` form a
coset of `C_G(σ)`, which is stable under right multiplication by `H` because `H` centralises `σ`.

**Density transfer.** Primes of `E` of relative residue degree at least `2` contribute a
Dirichlet series bounded as `s → 1⁺` (Layer 1). Deduce

```text
δ_K(C) = (|H| · |C| / |G|) · δ_E(σ).
```

### Layer 5: abelian Chebotarev by cyclotomic crossing

References: Sharifi Theorem 7.2.2 Step 2; Stevenhagen–Lenstra, Appendix.

Let `L/K` be abelian with group `G`. Separate the field-theoretic crossing data from the density
argument, so that Layer 11 reuses the data.

**Crossing data.** For an admissible modulus `m`, put `M = L(μ_m)` and `H = Gal(K(μ_m)/K)`.
Construct:

- the linear disjointness giving `Gal(M/K) ≃ G × H`, and the two projections;
- for `σ ∈ G` and suitable `τ ∈ H`, the fixed field `F = M^⟨(σ,τ)⟩`, and the theorem `M = F(μ_m)`;
- the prime sets with `M/K`-Frobenius `(σ, τ)`: pairwise disjoint, and contained in the
  `L/K`-Frobenius fibre of `σ`;
- the existence of arbitrarily large admissible prime moduli, consuming Mathlib's Dirichlet
  theorem (`Nat.forall_exists_prime_gt_and_eq_mod`). Handle `m ≡ 2 (mod 4)` explicitly.

**Density argument.** With `H_n = {τ ∈ H : |G| ∣ ord τ}`, use Layers 3 and 4 to get

```text
lower density of S_σ  ≥  |H_n| / (|G| · |H|).
```

Prove that admissible moduli can be chosen with `|H_n| / |H| → 1`. Since the Frobenius fibres
partition the unramified primes and there are `|G|` of them, every fibre has density `1/|G|`.

### Layer 6: the Dirichlet-density theorem

For arbitrary `L/K` and `C = [σ]`, apply Layer 5 to the cyclic extension `L / L^⟨σ⟩` and then the
transfer of Layer 4. Prove:

- `chebotarev_density`: `HasDirichletDensity (frobeniusPrimeSet K L C) (|C| / |G|)`;
- the abelian specialisation, stated for an element rather than a class;
- each Frobenius class contains infinitely many primes;
- the completely split primes have density `1 / [L:K]`;
- invariance under isomorphism of extensions;
- Dirichlet's theorem on primes in arithmetic progressions, recovered as the `K = ℚ`,
  `L = ℚ(μ_m)` corollary. This duplicates Mathlib's theorem deliberately, as a consistency check
  on the whole development; it is not the source used in Layer 5.

### Layer 7: Wiener–Ikehara

Reference: Korevaar, *Tauberian Theory*, Chapter III; the Wiener–Ikehara chapter of the PNT+
blueprint.

Let `a : ℕ → ℝ` be nonnegative with `∑ a(n) n^{-s}` absolutely convergent for `Re s > 1`. If for
some `A ≥ 0` the function `F(s) - A/(s-1)` extends continuously to the closed half-plane
`Re s ≥ 1`, then `∑_{n ≤ x} a(n) ~ A x`.

State it in Mathlib's vocabulary — `LSeries`, `LSeriesSummable`, `ContinuousOn`, `Set.EqOn`,
`Tendsto` — and do not introduce parallel notions.

**Required proof**, each step a named theorem:

1. the two Fourier identities converting a smoothed coefficient sum into an integral of the
   Dirichlet series;
2. decay estimates for Fourier transforms of functions of bounded variation, by integration by
   parts;
3. the smoothed upper and lower Tauberian inequalities;
4. the interval form of Wiener–Ikehara;
5. the bootstrap deriving a Chebyshev-type bound from nonnegativity plus the boundary
   continuation;
6. removal of the separate Chebyshev hypothesis;
7. the discrete theorem above.

Every theorem in the dependency cone of the public statement is proved without `sorry`.

### Layer 8: cyclotomic `L`-functions on the line `Re s = 1`

This strengthens Layer 3's analytic input exactly as far as Wiener–Ikehara needs, and no further:
the functional equation is not used anywhere in this roadmap.

**The principal factor.** For the principal Galois character,

```text
L₁(s) = ζ_K(s) · ∏_{𝔭 ramified} (1 - N𝔭^{-s})   for Re s > 1.
```

Using the ideal-counting asymptotic, construct a meromorphic continuation to
`Re s > 1 - 1/[K:ℚ]` with a single simple pole at `s = 1`; equivalently an analytic `H₁` on that
half-plane with `L₁(s) = κ/(s-1) + H₁(s)` and `κ > 0`.

**Non-vanishing on the boundary.** Every cyclotomic Galois-character `L`-function is nonzero on
`Re s = 1`, away from the pole of the principal factor. At `s = 1` this is Layer 3. At `s = 1 + it`
with `t ≠ 0`, adapt Mathlib's de la Vallée Poussin argument for
`DirichletCharacter.LFunction_ne_zero_of_re_eq_one`, using
`3 + 4cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0` on the product of `L₁(σ)`, `L_χ(σ + it)` and
`L_{χ²}(σ + 2it)` as `σ → 1⁺`. State the argument for the ideal Euler products of Layer 2, so it
applies to any finite-order ideal character with the same continuation.

**Logarithmic derivatives.** With the logarithmic derivative spelled `deriv L / L`, prove that
`-L_χ'/L_χ` extends continuously to `Re s ≥ 1` for nonprincipal `χ`; that
`-L₁'/L₁ - 1/(s-1)` does so for the principal character (convention 9); and that on `Re s > 1`
both agree with the Euler series of Layer 2.

### Layer 9: the cyclotomic prime number theorem

Let `L/K` be cyclotomic with group `G`, and `σ ∈ G`.

**Coefficients.** Define `Λ_{L/K,σ}` per convention 8 and prove: the defining sum is finite;
the coefficient is nonnegative; it is bounded by the unrestricted number-field von Mangoldt
coefficient; its Dirichlet series converges absolutely on `Re s > 1`; and the character identity

```text
∑_{n ≥ 1} Λ_{L/K,σ}(n) n^{-s} = -(1/|G|) ∑_{χ ∈ Ĝ} χ(σ)⁻¹ L_χ'(s) / L_χ(s).
```

**Tauberian conclusion.** By Layer 8, the left-hand side minus `(1/|G|)·1/(s-1)` extends
continuously to `Re s ≥ 1`. Apply Layer 7 to get `∑_{n ≤ x} Λ_{L/K,σ}(n) ~ x/|G|`.

**Removing higher prime powers.** Prove

```text
0 ≤ ∑_{n ≤ x} Λ_{L/K,σ}(n) - ϑ_σ(x) ≤ O_K(√x (log x)²),
```

using only the Layer 1 ideal count: for `j ≥ 2`, `N𝔭^j ≤ x` forces `N𝔭 ≤ √x`, and only
`O(log x)` exponents occur. Conclude `ϑ_σ(x) ~ x/|G|`. Taking `L = K` gives the **prime ideal
theorem** `ϑ_K(x) ~ x`.

### Layer 10: fixed-field transfer for `ϑ`

Return to `H = ⟨σ⟩`, `E = L^H`, `C = [σ]`, and let `ϑ_{E,σ}` count the primes of `E` whose
Frobenius in `L/E` is `σ`.

Every prime `𝔭` of `K` with class `C` carries exactly `r_σ = |C_G(σ)| / |H|` primes `𝔮` of `E` of
relative residue degree `1` with Frobenius `σ`, each with `N𝔮 = N𝔭` (Layer 4, unchanged). The
primes of `E` of relative degree at least `2` contribute `O_{L/K}(√x log x)` to `ϑ_{E,σ}(x)`
(Layer 1). Hence

```text
ϑ_{E,σ}(x) = (|C_G(σ)| / |H|) · ϑ_{K,C}(x) + o(x),
```

so `ϑ_{E,σ}(x) ~ x/|H|` gives `ϑ_{K,C}(x) ~ x/|C_G(σ)| = (|C|/|G|) x`.

### Layer 11: the abelian prime number theorem

Let `L/K` be abelian, reusing the crossing data of Layer 5. For each admissible modulus and each
`τ ∈ H_n`: the relevant fixed-field extension is cyclotomic, Layer 9 gives its `ϑ`-asymptotic, and
Layer 10 transfers it to the `(σ,τ)`-fibre over `K`. These fibres are pairwise disjoint inside the
`σ`-fibre, so

```text
liminf_{x→∞} ϑ_σ(x)/x ≥ |H_n| / (|G| · |H|),
```

and choosing moduli with `|H_n|/|H| → 1` gives `liminf ϑ_σ(x)/x ≥ 1/|G|`. The unramified fibres
partition all but finitely many primes, and the prime ideal theorem of Layer 9 makes the sum of
their `ϑ`-functions `x + o(x)`; with `|G|` fibres the lower bounds force `ϑ_σ(x) ~ x/|G|` for
every `σ`.

### Layer 12: the general prime-number-theorem form

For `C = [σ]`, the extension `L / L^⟨σ⟩` is cyclic, so Layer 11 applies; Layer 10 then gives

```text
ϑ_C(x) ~ (|C|/|G|) x.
```

Prove the same for a finite union of conjugacy classes by disjoint additivity, and record the
completely split case `C = 1` separately, since that is the form most often cited.

### Layer 13: prime counting and natural density

Develop an Abel-summation theorem for a locally finite family of objects with integer norm and
nonnegative weight, on top of `Mathlib/NumberTheory/AbelSummation.lean`, and apply it to prime
ideals to prove

```text
ϑ_S(x) ~ δ x   ⟹   π_S(x) ~ δ Li(x) ~ δ x / log x.
```

The pieces: the exact partial-summation identity; `Li(x) ~ x / log x`; control of the integral of
the error `ϑ_S(x) - δx = o(x)`; and the statement for both real and natural-number cutoffs.

Applying this to Layer 12 gives `π_C(x) ~ (|C|/|G|) Li(x)`. Finally define the natural density of
a set of primes by `π_S(x)/π_K(x) → δ` and prove that every Frobenius class has natural density
`|C|/|G|`, and that natural density implies Dirichlet density (so Layer 6 is subsumed, which is
itself a check on both).

---

## Scope boundary

In scope: everything in Layers 0–13, including the general theories of Dirichlet density,
ideal Euler products, and Wiener–Ikehara that they rest on.

Out of scope, and belonging to other roadmaps: an explicit error term in Chebotarev and the
Lagarias–Odlyzko effective theorem; zero-free regions for Hecke and Artin `L`-functions;
GRH-conditional bounds and the least prime in a Frobenius class; general Hecke characters and
Hecke `L`-functions; Artin `L`-functions and Brauer induction; the functional equation of the
Dedekind zeta function; infinite Galois extensions; and global function fields. The phrase
*prime-number-theorem form* here always means the asymptotic `π_C(x) ~ (|C|/|G|) Li(x)`, never an
effective estimate with a specified error term.

**On the choice of route.** A direct proof via Hecke characters, Artin `L`-functions and Brauer
induction is standard, and would be a fine roadmap; it is a different one, because it needs four
large theories none of which is otherwise required here. The cyclotomic route above needs only
one-dimensional `L`-functions and the two algebraic reductions of Layers 4 and 5, and those same
reductions serve both the density and the prime-counting forms.

## Worked examples (acceptance criteria)

These keep the definitions honest; each is a target.

- **Trivial extension.** `L = K` in Layer 9 gives the prime ideal theorem `ϑ_K(x) ~ x`, and
  Layer 13 gives `π_K(x) ~ Li(x)`.
- **Cyclotomic over `ℚ`.** `K = ℚ`, `L = ℚ(μ_m)`: Layer 13 gives the prime number theorem in
  arithmetic progressions, `π(x; m, a) ~ Li(x)/φ(m)` for `gcd(a, m) = 1`.
- **The identity class.** `C = 1` counts the completely split primes, with coefficient
  `1/[L:K]`.
- **Summation over classes.** Summing the `ϑ_C`-asymptotics of Layer 12 over all conjugacy
  classes of `G` recovers the prime ideal theorem. This is the sharpest single check that no
  normalisation has drifted.
- **The `j = 2` prime-power test.** The convention only bites when some element is a proper
  square, so a quadratic extension cannot detect it: there `Frob 𝔭 ^ 2 = 1` always. Take `L/K`
  cyclic of degree `4`, `G = ⟨g⟩`, and `σ = g²`. A prime with `Frob 𝔭 = g` satisfies
  `Frob 𝔭 ^ 2 = σ` and `Frob 𝔭 ≠ σ`, so it contributes `log N𝔭` to `Λ_{L/K,σ}(N𝔭²)` under
  convention 8 and nothing under the variant with `Frob 𝔭 = σ`. Check that the character
  identity of Layer 9 holds for convention 8 and fails for the variant.
- **The principal sign.** For `K = ℚ` and the principal character, check that
  `-L₁'/L₁ - 1/(s-1)` (and not `-L₁'/L₁ + 1/(s-1)`) is the combination that extends continuously
  to `Re s ≥ 1`, against Mathlib's Riemann zeta.
- **Non-vacuity.** For `K = ℚ`, `L = ℚ(i)`, compute `frobeniusClass ℚ L (p)` for `p` an odd prime
  as the nontrivial element iff `p ≡ 3 (mod 4)`, tying Layer 0 to quadratic reciprocity.

## Ordering — the dependency graph

```text
Layer 0 → Layer 1 → Layer 2 → Layer 3
                 ↘ Layer 4
Layers 3, 4 → Layer 5 → Layer 6  (with Layer 4)

Layer 7                          (independent of Layers 0-6)
Layers 1-3 → Layer 8
Layers 0-2, 7, 8 → Layer 9
Layers 1, 4 → Layer 10
Layers 5, 9, 10 → Layer 11
Layers 10, 11 → Layer 12
Layers 1, 12 → Layer 13
```

Layer 7 has no dependency on the algebraic layers and can be built first, in parallel, or last.

## Provenance

This section is secondary to the specification above: it records where related material exists,
so that work is not duplicated and credit is given. None of it is prescriptive, and no file
listed here should be treated as fixing the design.

A `sorry`-free formalisation of the Dirichlet-density form (Layers 0–6) exists, by Chris
Birkbeck, Riccardo Brasca and Xavier Roblot, in the `Chebotarev` project of AINTLIB and on the
`development` branch of `CBirkbeck/chebotarev-density`, the latter with a blueprint and
dependency graph. Layers 0–6 may be discharged by adapting it; doing so requires the authors'
agreement and conformance to its licence, and the result must meet this roadmap on its own terms
rather than canonising the existing file structure. In particular the existing development
predates Mathlib's `arithFrobAt`, and Layer 0 here is specified against Mathlib's API, not
against a private notion of Frobenius.

AINTLIB's `DedekindResidue` project contains a `sorry`-free development of the meromorphic
continuation and functional equation of the Dedekind zeta function with Euler-product and
explicit-formula infrastructure. This roadmap does not import that theory — it needs only
half-plane continuation — but its Euler-product differentiation lemmas may shorten Layers 2
and 8.

PNT+ (`PrimeNumberTheoremAnd`) contains a nearly complete Wiener–Ikehara development, whose
public statement has the right shape for Layer 7, together with the prime-power removal and
prime-counting arguments that model Layers 9 and 13. Its Tauberian dependency cone still contains
`sorry`, in the Fourier-decay lemmas; Layer 7 is therefore a target of this roadmap and a
migration source, not an available prerequisite.

## References

- R. Sharifi, *Algebraic Number Theory*, §§7.1–7.2. The primary source for Layers 1–6.
- P. Stevenhagen and H. W. Lenstra, Jr., *Chebotarëv and his density theorem*, Math.
  Intelligencer **18** (1996), no. 2, 26–37. The cyclotomic-crossing argument of Layer 5.
- J. Neukirch, *Algebraic Number Theory*, Chapter VII.
- H. Davenport, *Multiplicative Number Theory*, for the de la Vallée Poussin non-vanishing
  argument adapted in Layer 8.
- J. Korevaar, *Tauberian Theory: A Century of Developments*, Chapter III, for Wiener–Ikehara.
- J. C. Lagarias and A. M. Odlyzko, *Effective versions of the Chebotarev density theorem*, in
  *Algebraic Number Fields* (Durham, 1975), Academic Press, 1977, 409–464. The effective theorem,
  which is outside this scope.
