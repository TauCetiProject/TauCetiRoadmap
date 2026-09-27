# Roadmap: the Chebotarev density theorem

Let `L/K` be a finite Galois extension of number fields, with Galois group `G`, and let `C` be
a conjugacy class in `G`. The Chebotarev density theorem says that the unramified primes of `K`
whose arithmetic Frobenius class is `C` have both Dirichlet density and natural density

```text
#C / #G.
```

This roadmap builds both statements, together with the prime-counting theorem

```text
π_C(x) ~ (#C / #G) Li(x),
```

by the cyclotomic-crossing route: first cyclotomic extensions, then abelian extensions, and
finally arbitrary finite Galois extensions through the fixed field of a cyclic subgroup. The
route avoids Artin L-functions, Brauer induction, and global reciprocity. It does not avoid the
analytic work: continuation of the relevant cyclotomic character series, nonvanishing on the
line `Re s = 1`, and a Tauberian passage to prime counting are explicit milestones.

Suggested home: `TauCeti/NumberTheory/Chebotarev/`, with files grouped as `FrobeniusPrimes/`,
`Cyclotomic/`, `Crossing/`, `FixedField/`, `Density/`, and `PrimeCounting/`. The public theorems
live in the namespace `NumberField.Chebotarev`.

[`Suggested.lean`](Suggested.lean) pins representative declaration shapes. It is not exhaustive;
this document is the specification. Dated prior-art, source-revision, licence, and coordination
records are maintained privately and are not prerequisites.

The existing Dirichlet-density development in AINTLIB is prior art for the analytic formulation,
and Mathlib's theorem on Dirichlet primes in arithmetic progressions supplies the rational
specialization. This roadmap records those public source relationships here while keeping its
detailed migration ledger private.

## Scope

### In scope

- powers of conjugacy classes and the Frobenius-prime set attached to a class;
- the finite exceptional set of ramified primes;
- the cyclotomic Frobenius formula and the character family it defines;
- continuation and line-one nonvanishing for the character series needed by the cyclotomic case;
- the auxiliary-prime theorem, cyclotomic crossing, and the exact crossing constants;
- the fixed-field fibre count for a general conjugacy class;
- Dirichlet-density Chebotarev over an arbitrary number field;
- the Frobenius von Mangoldt coefficient, `ψ_C`, `ϑ_C`, and `π_C`;
- the weighted transfer package: the exact residue-degree-one contraction, and the separate
  estimates for higher residue degree, for ramified primes, and for prime powers beyond the first;
- the prime-number-theorem form and natural-density Chebotarev;
- splitting-completely and arithmetic-progression specializations.

### Out of scope

- a second Frobenius element, Frobenius predicate, Artin symbol, or ideal Artin map;
- generic ideal Dirichlet series, Euler products, density calculus, Abel or Perron summation,
  Landau's theorem, or Wiener–Ikehara;
- the ray class group, ray class characters, or a general Hecke-character carrier;
- general Dedekind, Hecke, Grossencharacter, or Artin L-functions;
- global or local reciprocity and class fields;
- zero-free regions, explicit formulae, numerical constants, or effective Chebotarev bounds.

The first three exclusions are ownership boundaries, not omissions. They are supplied by the
roadmaps named below. A theorem here imports their declarations and never rebuilds them under a
Chebotarev-specific spelling.

## Dependencies and exact contracts

Every dependency points to an earlier roadmap. A prerequisite below means a named declaration,
an earlier milestone here, or a Mathlib declaration; an external repository is never a
prerequisite.

### Number Field Arithmetic

This roadmap consumes the finite-level arithmetic Frobenius class and its tower laws.

| Declaration | Contract used here |
| --- | --- |
| `artinSymbol` | For a nonzero prime `𝔭` of `𝓞 K`, maximal and unramified in finite Galois `L/K`, the conjugacy class in `L ≃ₐ[K] L` represented by every Mathlib arithmetic Frobenius at a prime above `𝔭`. The unramifiedness proof is an argument; there is no value at a ramified prime. |
| `artinSymbol_map_restrictNormalHom` | Restriction to a normal intermediate extension maps the Artin class upstairs to the Artin class downstairs. |
| `exists_isArithFrobAt_pow_inertiaDeg` | Prime-relative tower formula: at one prime `Q` over `𝔓` over `𝔭`, an arithmetic Frobenius `σ` at `Q/𝔭` has `σ ^ f(𝔓/𝔭)` as the restriction of an arithmetic Frobenius at `Q/𝔓`. |
| `idealsAway`, `artinHomAway`, `artinHomAway_apply_prime` | Used only for comparisons with the ideal Artin map; no carrier or reciprocity theorem is reconstructed here. |

The theorem `exists_isArithFrobAt_pow_inertiaDeg` is used only with its unramified and
prime-relative hypotheses. An arbitrary representative of a conjugacy class need not stabilize
a fixed prime in a nonnormal intermediate extension, so no class-level shortcut replaces it.

### Arithmetic Dirichlet Series

This roadmap consumes the analytic carriers and generic theorems under their canonical names.

| Declaration | Contract used here |
| --- | --- |
| `primeIdealZetaSum` | The sum over a set of `HeightOneSpectrum (𝓞 K)`, hence over a subtype of nonzero prime ideals rather than over arbitrary ideals. |
| `HasDirichletDensity`, `IsLowerDirichletDensityBound`, `IsUpperDirichletDensityBound` | Density is normalized by the all-prime sum. The epsilon-style lower and upper declarations are bounds, not junk-valued density functions. |
| `hasDirichletDensity_of_symmDiff_finite`, `hasDirichletDensity_of_squeeze` | Finite exceptional sets may be discarded, and lower bounds for a finite partition can be squeezed to exact densities. |
| `hasDirichletDensity_contraction` | Transfer between prime sets in `E` and `K`, including the residue-degree-one and constant-fibre hypotheses that identify norms. |
| `MultiplicativeIdealWeight`, `normCoeff`, `regroupByNorm`, `EulerProductData` | The generic ideal weight, norm regrouping, and Euler-product/logarithmic-derivative infrastructure. |
| `abelSummation`, `landau`, `wienerIkehara` | The generic summation, positivity, nonvanishing, and Tauberian theorems, including summability and a separately named continuous boundary function. |
| `primeTheta`, `primeCount`, `primePsi`, `primeVonMangoldtCoeff` | The canonical prime-weight, prime-count and prime-power carriers. Chebotarev defines only their Frobenius-restricted specializations, and compares against these for the discard estimates of 11.3. |
| `standardPrimePowerRemoval`, `HasNegligibleHigherPrimePowers` | The generic `ψ - ϑ = o(x)` estimate for the all-prime set, which 11.3(1) dominates the Frobenius tail by. |
| `primeTheta_asymptotic_of_primePsi`, `primeCount_asymptotic_of_primeTheta` | The generic `ψ → ϑ → π` transfers used verbatim in Layer 13. |

In particular, this roadmap does not define `HasDirichletDensity`. If Mathlib supplies the
canonical predicate before implementation begins, Arithmetic Dirichlet Series performs that
migration and this roadmap changes only an import.

### Global Number Fields

Cyclotomic continuation comes after, and consumes, the ray-class arithmetic developed there.

| Declaration | Contract used here |
| --- | --- |
| `Modulus`, `RayClassGroup`, `RayClassCharacter` | The modulus, finite ray class group, and its character type. |
| `idealClass`, `idealClass_mul`, `idealClass_surjective` | The class of an integral ideal prime to the finite part of a modulus, with multiplicativity and surjectivity. |
| `classMap`, `classMap_idealClass` | Change of modulus, used to compare cyclotomic conductors. |
| `rayClassIdealCount` | For every class, the number of integral ideals of norm at most `x` in that class has the common main term and a uniform power-saving remainder sufficient for Abel summation. |
| `rayClassCharacter_partialSums` | A nontrivial ray class character has the cancellation bound obtained from `rayClassIdealCount`. |

The last two names are load-bearing exports: total ideal counting alone does not continue a
nontrivial character series across `Re s = 1`. The proof must count in individual ray classes and
use cancellation. This is why `GlobalNumberFields → Chebotarev` is a genuine dependency.

### Mathlib

The development uses Mathlib's `IsArithFrobAt` and `arithFrobAt`, `ConjClasses`, cyclotomic
extensions, the Galois correspondence, ideals in Dedekind domains, `LSeries`, Dirichlet characters,
and the rational theorem on primes in arithmetic progressions. Tau Ceti packages missing global
statements, but does not fork Mathlib's vocabulary.

Layer 7 in particular rests on two Mathlib declarations by name, and neither is rebuilt here:

| Declaration | Contract used here |
| --- | --- |
| `Nat.exists_prime_gt_modEq_one` | Arbitrarily large primes congruent to `1` modulo any nonzero level. This is the whole of the congruence half of the auxiliary-prime theorem. |
| `IsCyclotomicExtension.autEquivPow` | Given `Irreducible (Polynomial.cyclotomic q K)`, the isomorphism `Gal(K(ζ_q)/K) ≃ (ZMod q)ˣ`. Consuming it keeps the irreducibility hypothesis visible in the type, so no crossing argument can assume the order `q - 1` without supplying it. |

## Pinned conventions

| Subject | Convention |
| --- | --- |
| Frobenius | Arithmetic Frobenius: on a residue field of cardinality `q`, it acts by `x ↦ x^q`. The geometric convention appears only in explicitly named translation lemmas. |
| Public Frobenius object | A conjugacy class, namely the consumed `artinSymbol`. A chosen element is used only after abelianity makes the class a singleton or inside a proof with membership in the class recorded. |
| Shrinking the top field | For `K ⊆ M ⊆ L` with `M/K` normal, restriction sends `Frob_{L/K}(Q)` to `Frob_{M/K}(Q ∩ 𝓞 M)` with **no power and no inverse**. This is `artinSymbol_map_restrictNormalHom`. |
| Raising the base field | For `K ⊆ M ⊆ L` with `L/M` Galois, `Frob_{L/M}(Q) = Frob_{L/K}(Q)^{f(𝔓/𝔭)}` where `𝔓 = Q ∩ 𝓞 M`. The exponent is a **power**, the residue degree of the intermediate prime over the base, never an inverse. This is `exists_isArithFrobAt_pow_inertiaDeg`. |
| Character expansion | For abelian `G` and `σ, g ∈ G`, the indicator is `1_{g = σ} = (1/#G) ∑_χ χ(σ)⁻¹ χ(g)`. The inverse sits on the **tag** `σ`, not on the Frobenius argument `g`; the coefficient of `Λ` at `𝔭^m` is `χ(Frob 𝔭)^m = χ(Frob(𝔭)^m)`. |
| Weighted transfer | Weighted sums cross between number fields only through `ϑ`, at residue degree one, where `𝔑_{E/ℚ}𝔓 = 𝔑_{K/ℚ}𝔭`. Prime powers `m ≥ 2` are removed on both sides before the crossing, never carried through it. |
| Ramified primes | The Artin symbol takes an unramifiedness proof. `frobeniusPrimeSet K L C` consists of primes for which such a proof exists and the resulting class is `C`; it never evaluates a total function at a ramified prime. |
| Prime carrier | `HeightOneSpectrum (𝓞 K)`, equivalently the subtype of nonzero prime ideals in the Dedekind domain `𝓞 K`. No counting or density statement uses `Set (Ideal (𝓞 K))`. |
| Dirichlet density | The ratio `P_S(s) / P_all(s)` as `s → 1⁺`. The equivalence with division by `log((s-1)⁻¹)` follows from the Euler product and bounded higher-prime-power contribution. It does not follow from the zeta residue alone. |
| Natural density | The ratio of the number of primes in the set of norm at most `x` to the number of all primes of norm at most `x`. It is proved separately; Dirichlet density does not imply it. |
| Frobenius powers | `C ^ j` is the conjugacy class of `σ ^ j` for `σ ∈ C`. This is well defined because powering commutes with conjugation. |
| Von Mangoldt fibre | A prime-power term `𝔭^j` contributes to class `C` exactly when `Frob(𝔭)^j ∈ C`. Testing only `Frob(𝔭) ∈ C` is wrong. |
| Crossing limits | For a fixed auxiliary prime, first take the analytic or counting limit in `x`; only then let the auxiliary level tend to infinity. |
| Effectivity | Every asymptotic and density statement is qualitative. No error term is part of the theorem. |

## The build, in fourteen layers

### Layer 1: consumed Frobenius classes and powers of conjugacy classes

Define the power operation on conjugacy classes of a monoid and prove its membership,
composition, identity, and functoriality API. In particular,

```text
τ ∈ C.pow j  ↔  ∃ σ ∈ C, σ^j = τ.
```

For finite Galois `L/K`, use `artinSymbol` directly. Prove closed transport lemmas from
`artinSymbol_map_restrictNormalHom` and `exists_isArithFrobAt_pow_inertiaDeg`; these lemmas contain
no `sorry` once the supplier is imported. Prove that the class at a split-completely prime is the
identity and that the class cardinal is invariant under the chosen representative.

The layer introduces no Frobenius predicate or Frobenius-class carrier.

### Layer 2: Frobenius prime sets and finite exceptional sets

Define

```text
frobeniusPrimeSet K L C : Set (HeightOneSpectrum (𝓞 K))
```

by the dependent condition that there exists an unramifiedness proof `hur` with
`artinSymbol 𝔭.asIdeal hur = C`. Prove proof-independence, equivariance under isomorphisms of
extensions, disjointness for distinct classes, and that the union over all classes is exactly the
set of unramified primes.

Construct the finite set `ramifiedPrimes K L` and prove that its complement is the union above.
The finite symmetric-difference theorem from Arithmetic Dirichlet Series then allows all later
density and counting statements to discard it explicitly.

### Layer 3: prime sums and density normalization

Specialize `primeIdealZetaSum` to `frobeniusPrimeSet`. Prove the dictionary between:

1. the ratio to the all-prime sum;
2. the logarithmic normalization by `log((s-1)⁻¹)`;
3. insertion or deletion of the finite ramified set.

The denominator theorem must use the ideal Euler product and the convergence of the contribution
from prime powers `j ≥ 2`. The residue statement for Dedekind zeta by itself is insufficient.
State upper- and lower-density versions because the crossing argument first produces a lower bound,
not an exact limit.

### Layer 4: cyclotomic Galois characters

Let `F/K` be generated by `m`-th roots of unity. Prove that for `𝔭 ∤ m` the arithmetic Frobenius
sends `ζ_m` to `ζ_m ^ 𝔑𝔭`; over `ℚ` this corresponds to `𝔑𝔭 mod m`, not its inverse. Deduce that
`Gal(F/K)` is abelian and identify the conductor modulus through Global Number Fields.

For each character `χ : Gal(F/K) →* ℂˣ`, define the canonical ideal weight
`cyclotomicCharacterWeight χ`. It is `χ(Frob 𝔭)` at unramified primes and zero at ramified primes.
Prove its Euler product and character-orthogonality identities. A weight specified only away from
ramification is not enough: its values at the bad primes would remain unconstrained.

### Layer 5: ray-class counting and continuation

Factor `cyclotomicCharacterWeight χ` through a consumed `RayClassCharacter`. Apply
`rayClassIdealCount` class by class and `rayClassCharacter_partialSums` to show:

- the nontrivial character partial sums have cancellation;
- the associated Dirichlet series continues through a neighborhood of `Re s = 1`;
- the trivial character has the single pole inherited from the all-ideal series;
- every nontrivial series is nonzero at `s = 1`, using the standard positive combination and
  the exact Euler-product logarithm supplied by Arithmetic Dirichlet Series.

The continuation is named `cyclotomicCharacterSeriesC`, agrees with the original series on
`Re s > 1`, and exports `analyticAt_one` and `ne_zero_at_one` theorems. These are specialized
Chebotarev inputs, not a general Hecke L-function theory.

### Layer 6: cyclotomic Dirichlet density

Use character orthogonality and Layer 5 to show that every element `σ` of `Gal(F/K)` has

```text
HasDirichletDensity (frobeniusPrimeSet K F [σ]) (1 / #Gal(F/K)).
```

Name the density theorem for a cyclotomic fibre and prove the specialization to primes
`p ≡ a (mod m)` over `ℚ`, under a public corollary such as
`hasDirichletDensity_primesCongruent`. The specialization must send arithmetic Frobenius to `a`,
not `a⁻¹`, and should be proved by comparison with Mathlib's Dirichlet-primes-in-AP theorem rather
than by duplicating that development.

### Layer 7: the auxiliary prime and the crossing data

**7.1 The auxiliary-prime theorem.** The choice of auxiliary prime is one named theorem,
`exists_auxiliaryPrime`, and its conclusion carries every condition later layers use. Given a
number field `K`, a finite Galois extension `L/K`, a level `n ≠ 0` and a bound `N`, it produces a
rational prime `q` with

- `N < q`, which is what "sufficiently large" means and is how the finite exceptional sets of
  Layers 2, 3 and 5 are avoided;
- `q ≡ 1 (mod n)` and `n ∣ q - 1`, used with `n = f^r` in Layer 9;
- `q` unramified in `K` and `q` unramified in `L`;
- `Irreducible (Polynomial.cyclotomic q K)`, which is 7.2 below and is the form of
  `K ∩ ℚ(ζ_q) = ℚ` that needs no ambient field.

The infinitude of primes congruent to `1` modulo `n` above any bound is Mathlib's
`Nat.exists_prime_gt_modEq_one`; the primes ramifying in `L` are finite in number, so enlarging
`N` past the largest of them discharges the ramification conditions, and 7.2 turns the one for
`K` into the last conjunct. The theorem states all of them as conclusions rather than leaving the
caller to compute a bound and re-derive the consequences.

**7.2 Unramifiedness, not the intersection, is what gives the full cyclotomic degree.** From
`q` unramified in `K` prove, in this order:

1. `ℚ(ζ_q)/ℚ` is totally ramified at `q`, so every subfield of `ℚ(ζ_q)` other than `ℚ` is ramified
   at `q`;
2. hence `K ∩ ℚ(ζ_q) = ℚ`, because a subfield of `K` ramified at `q` would force `q` to ramify in
   `K`;
3. hence `Irreducible (Polynomial.cyclotomic q K)`, so `[K(ζ_q) : K] = q - 1` and the cyclotomic
   character `Gal(K(ζ_q)/K) ≃ (ZMod q)ˣ` is an isomorphism onto the full unit group, in
   particular cyclic of order `q - 1`.

⚠ `L ∩ K(ζ_q) = K` gives **none** of this. That intersection constrains `L`, whereas
`[K(ζ_q) : K]` is a proper divisor of `q - 1` exactly when `K ∩ ℚ(ζ_q) ≠ ℚ`. Witness:
`K = ℚ(√5)`, `L = K(√2)`, `q = 5`. The subfields of `L` are `ℚ`, `ℚ(√2)`, `ℚ(√5)`, `ℚ(√10)` and
`L`; those of `K(ζ_5) = ℚ(ζ_5)` are `ℚ`, `ℚ(√5)` and `ℚ(ζ_5)`; so `L ∩ K(ζ_5) = ℚ(√5) = K`, while
`[K(ζ_5) : K] = 2`, not `4`. Here `5` ramifies in `K`, which is exactly what 7.1 excludes. Losing
the full degree also loses `f^r ∣ #Gal(K(ζ_q)/K)`, so the tagged elements of Layer 9 need not
exist at all: this is a defect in the proof, not in its presentation.

**7.3 The other intersection is then a theorem, not a hypothesis.** With `q` unramified in `L`,
prove `L ∩ K(ζ_q) = K`: by 7.2 the extension `K(ζ_q)/K` is totally ramified at every prime above
`q`, and so is every subextension of it, while `L/K` is unramified there. An extension of `K` that
is both totally ramified and unramified at a prime above `q` is trivial. This is the only use of
"unramified in `L`" beyond "unramified in `K`".

**7.4 The compositum.** Construct `M = L·K(ζ_q)`. From 7.3 and linear disjointness
(`cyclotomicCrossing_linearDisjoint`) prove the restriction isomorphism

```text
Gal(M/K) ≃ Gal(L/K) × Gal(K(ζ_q)/K),
```

and its Frobenius compatibility: `Frob_{M/K}(𝔭)` restricts to `Frob_{L/K}(𝔭)` and to
`Frob_{K(ζ_q)/K}(𝔭)` with no power taken, since both `L` and `K(ζ_q)` are normal over `K`. Prove
that a prime unramified in `M` is unramified in both factors, and that the primes ramified in `M`
but not in `L` all lie above `q`, hence form a finite set.

**7.5 Why the tagged fixed fields are cyclotomic.** Write `G = Gal(L/K)`, `H_q = Gal(K(ζ_q)/K)`.
For `σ ∈ G` of order `f` and `τ ∈ H_q` with `f ∣ orderOf τ`, put `Z = ⟨(σ,τ)⟩ ≤ G × H_q` and
`E_τ = M^Z`. Prove

```text
Z ⊓ (G × 1) = 1,
```

which is exactly where `f ∣ orderOf τ` is used: `(σ,τ)^k ∈ G × 1` forces `orderOf τ ∣ k`, hence
`f ∣ k`, hence `σ^k = 1`. Since `Gal(M/K(ζ_q)) = G × 1`, this says `E_τ · K(ζ_q) = M`, so
`M = E_τ(ζ_q)` is a cyclotomic extension of `E_τ` and Layer 6 applies over `E_τ`. Its group is
`Z`, cyclic of order `orderOf τ`.

Prove pairwise disjointness of the tagged Frobenius fibres for distinct `τ` — immediate, since
they are the fibres of distinct elements of the abelian group `Gal(M/K)` — and the contraction
hypotheses for `M/E_τ`, in particular that the contracted primes of `E_τ` are those of residue
degree one over `K`.

### Layer 8: the cyclic fixed-field fibre

**8.1 The two restriction laws, and which one takes a power.** Both are consumed from Number Field
Arithmetic and both must stay visible wherever a Frobenius crosses a tower.

- *Shrinking the top field.* For `K ⊆ M ⊆ L` with `M/K` normal, `Frob_{L/K}(Q)|_M` is
  `Frob_{M/K}(Q ∩ 𝓞 M)`. No power, no inverse: both sides act on their residue fields by
  `x ↦ x^{𝔑𝔭}` with the same base `𝔭`.
- *Raising the base field.* For `K ⊆ M ⊆ L` with `L/M` Galois,
  `Frob_{L/M}(Q) = Frob_{L/K}(Q)^{f(𝔓/𝔭)}` with `𝔓 = Q ∩ 𝓞 M`. Here the exponent is the residue
  degree of the intermediate prime over the base, and it is a **power**, never an inverse: the
  residue field of `𝔓` has `𝔑𝔭^{f(𝔓/𝔭)}` elements.

Worked example, to be discharged as a named regression: `K = ℚ`, `L = ℚ(ζ_7)` with
`G = Gal(L/ℚ) ≅ (ZMod 7)ˣ`, `M = ℚ(√-7)` the quadratic subfield, and `p = 3`. Arithmetic Frobenius
at `3` is `σ_3 : ζ_7 ↦ ζ_7^3`, of order `6` because `3` is a primitive root modulo `7`. Restricting
to the normal subextension `M` gives the nontrivial element of `Gal(M/ℚ)`, unpowered, so `3` is
inert in `M` and `f(𝔭_3/3) = 2`. Raising the base to `M` gives
`Frob_{L/M}(Q) = σ_3^{f(𝔭_3/3)} = σ_3^2 = σ_2 : ζ_7 ↦ ζ_7^2`, which generates
`Gal(L/M) = {σ_1, σ_2, σ_4}` and has order `3 = f(Q/𝔭_3)`. Reading the exponent as an inverse
would give `σ_3^{-1} = σ_5`, which does not even lie in `Gal(L/M)`; reading it as no power at all
would give `σ_3`, which also does not lie in `Gal(L/M)`. Both errors are detected by this example.

**8.2 The fibre count.** For arbitrary finite Galois `L/K`, choose `σ ∈ C`, put `f = orderOf σ`,
and let `E = L^⟨σ⟩`. Prove that `L/E` is cyclic with generator the restriction of `σ`, and that for
`𝔭` unramified in `L` and `Q` above `𝔭` with `𝔓 = Q ∩ 𝓞 E`, the residue degree `f(𝔓/𝔭)` is the
least `n ≥ 1` with `Frob_{L/K}(Q)^n ∈ ⟨σ⟩`. In particular `f(𝔓/𝔭) = 1` holds exactly when
`Frob_{L/K}(Q) ∈ ⟨σ⟩`, and then 8.1 gives `Frob_{L/E}(𝔓) = Frob_{L/K}(Q)` on the nose.

Each prime `𝔭` of `K` in the class `C` has exactly

```text
#G / (#C * f) = #Centralizer_G(σ) / f
```

primes `𝔓` of `E` of residue degree one over `K` whose relative Frobenius in `L/E` is `σ`; every
such `𝔓` lies above a prime in `C`. Prove `#C * f ∣ #G` as a separate statement, so the quotient is
exact rather than a truncated natural-number division. The relative class is `σ`, not the identity.
Test the theorem when `L/K` is cyclic and `σ ≠ 1` generates `G`: then `E = K`, the required fibre
has one member, and the split-completely fibre has none.

**8.3 The exceptional set for the contraction.** The finite set discarded on the `E` side is the
set of primes of `E` lying above `ramifiedPrimes K L`, not the set of primes of `E` that ramify in
`L`. ⚠ The second is strictly smaller and the contraction is false with it: a prime `𝔓` can be
unramified in `L/E` while `𝔭` ramifies in `L/K`, and then `𝔓` carries a relative Artin symbol
while `𝔭` carries no absolute one, so `𝔓` belongs to the relative fibre and lies above no member of
`frobeniusPrimeSet K L C`. Witness: `K = ℚ`, `L = ℚ(∛2, ζ_3)` with `G ≅ S₃`, `σ = (1 2)` so that
`E = ℚ(∛2)`, and `p = 2`. The inertia group at a prime `Q` above `2` is `⟨(1 2 3)⟩ = Gal(L/ℚ(ζ_3))`,
so `e(Q/2) = 3`, `e(Q/𝔓) = #(⟨(1 2 3)⟩ ⊓ ⟨(1 2)⟩) = 1` and `e(𝔓/2) = 3`.

### Layer 9: abelian Chebotarev

Write

```text
H_{q,f} = {τ ∈ H_q | f ∣ orderOf τ}.
```

By 7.2, `H_q` is cyclic of order `q - 1` and `f^r ∣ q - 1`; both facts come from the auxiliary-prime
theorem, and neither is available from `L ∩ K(ζ_q) = K`.

Layer 6 over each fixed field `E_τ` gives the fibre of `(σ,τ)` in `M/E_τ` density `1/orderOf τ`,
and the Layer 8 contraction with fibre size `#G · #H_q / orderOf τ` turns it into the tagged
fibre density `1/(#G · #H_q)` over `K`. Their disjoint union therefore gives the lower bound

```text
c_q = #H_{q,f} / (#G * #H_q).
```

Prove the exact cyclic-group count: for `H` cyclic of order `h` and `f ∣ h`,

```text
#{τ ∈ H | f ∣ orderOf τ} = h * ∏_{p ∣ f} (1 - p^{-(v_p(h) - v_p(f) + 1)}),
```

because `f ∣ orderOf τ` says exactly that `p^{v_p(h) - v_p(f) + 1} ∤ k` for every `p ∣ f`, where
`τ` corresponds to `k` modulo `h`. Then prove the uniform size inequality that makes the level
matter: if `f^r ∣ h` with `r ≥ 1` then every factor is at least `1 - 2^{-r}`, so

```text
c_q ≥ (1 - 2^{-r})^{#f.primeFactors} / #G,
```

and the right-hand side tends to `1/#G` as `r → ∞`. This is the only size inequality separating
the group-theoretic fibres, and it is what the congruence `q ≡ 1 (mod f^r)` is for.

One chosen generator supplies only `1/(#G(q-1))`, which tends to zero; the union over all of
`H_{q,f}` is load-bearing. Finally use the density squeeze across all elements of the abelian
Galois group.

### Layer 10: Dirichlet-density Chebotarev

Apply abelian Chebotarev to `L/E`, where the relevant relative fibre has density `1/f`, and
contract using the exact fibre size from Layer 8. The result is the named theorem

```text
hasDirichletDensity_frobeniusPrimeSet
```

with value `#C/#G` over every number field `K`.

Derive, rather than reprove, the density of split-completely primes, the non-Galois statement via
a Galois closure, infinitude of every Frobenius class, and the rational arithmetic-progression
case. State invariance under finite symmetric difference as a corollary.

### Layer 11: the Frobenius von Mangoldt coefficient and its summatory functions

**11.1 The coefficient.** For a conjugacy class `C`, define the nonnegative coefficient

```text
Λ_C(n) = ∑_{𝔑𝔭^j = n, j ≥ 1, (artinSymbol 𝔭)^j = C} log 𝔑𝔭.
```

The equality means the power of the conjugacy class from Layer 1. At a ramified prime there is no
term. Prove nonnegativity and summability on `Re s > 1`.

The mandatory regression test is cyclic of degree four. If `G = ⟨g⟩ ≅ C₄` and a prime has
Frobenius `g`, its square term contributes to the `g²` fibre because `g² ∈ [g²]`. A definition
testing only the unpowered Frobenius omits that term and cannot satisfy the logarithmic-derivative
identity.

**11.2 The two summatory functions.** Define, on the canonical prime subtype,

```text
ψ_C(x) = ∑_{n ≤ x} Λ_C(n),
ϑ_C(x) = ∑_{𝔑𝔭 ≤ x, artinSymbol 𝔭 = C} log 𝔑𝔭.
```

`ϑ_C` is exactly the `j = 1` part of `ψ_C`, so `0 ≤ ψ_C(x) - ϑ_C(x)`. Both are needed here, not
only in Layer 13: the crossing between number fields is legitimate for `ϑ` and is not legitimate
for `ψ`.

**11.3 The four discard estimates.** Each is a separate named theorem, because each has a
different reason and a different rate. Together they are what makes the weighted transfer of Layer
12 an argument rather than a restatement of the prime-set crossing.

1. *Prime powers `j ≥ 2`.* Bound `ψ_C(x) - ϑ_C(x)` termwise by the all-prime tail
   `primePsi K univ x - primeTheta K univ x`, which Arithmetic Dirichlet Series proves is `o(x)`
   in `standardPrimePowerRemoval`. The bound is termwise and does not need any property of `C`.
2. *Residue degree above one.* The primes `𝔭` of a number field with `f(𝔭/p) ≥ 2` satisfy
   `𝔑𝔭 = p^{f} ≤ x` with `f ≥ 2`, hence `p ≤ √x`, so there are `O(√x)` of them below `x` and their
   weighted sum is `O(√x log x) = o(x)`. This is the estimate a contraction between two number
   fields needs, because `𝔑_{E/ℚ}𝔓 = (𝔑_{K/ℚ}𝔭)^{f(𝔓/𝔭)}` and a term of `ϑ` moves to a different
   value of `n` unless `f(𝔓/𝔭) = 1`. Note `f(𝔓/𝔭) ≥ 2` forces `f(𝔓/p) ≥ 2`, so the absolute
   statement covers the relative one.
3. *A finite set of primes.* For a finite `T`, `∑_{𝔭 ∈ T} ∑_{𝔑𝔭^j ≤ x} log 𝔑𝔭 ≤ #T · log x`, so a
   finite set contributes `O(log x)`. This covers `ramifiedPrimes K L`, the primes of `E` above
   `ramifiedPrimes K L` from 8.3, and the primes ramified in the compositum `M` of 7.4 but not in
   `L`, which all lie above the auxiliary prime `q`.
4. *The total discarded error.* State once, as a single theorem, that the sum of 1–3 is `o(x)`,
   and use that theorem at each crossing rather than reassembling the three estimates.

**11.4 Character orthogonality in the cyclotomic case.** For abelian `Gal(F/K)` the indicator of
`σ` expands as

```text
1_{g = σ} = (1/#Gal(F/K)) ∑_χ χ(σ)⁻¹ χ(g),
```

with the inverse on the tag `σ`. Substituting `g = Frob(𝔭)^m` and using
`χ(Frob(𝔭)^m) = χ(Frob 𝔭)^m` gives, for `Re s > 1`,

```text
∑_{𝔭 unramified, m ≥ 1} 1_{Frob(𝔭)^m = σ} (log 𝔑𝔭) 𝔑𝔭^{-ms}
  = (1/#Gal(F/K)) ∑_χ χ(σ)⁻¹ (-L_χ'(s)/L_χ(s)),
```

where `L_χ` is the series of `cyclotomicCharacterWeight χ` from Layer 4, whose Euler product omits
the ramified primes. This identity is a theorem about the canonical coefficient, never a hypothesis
on an arbitrary sequence, and it is the only place the character expansion is used: the roadmap
never forms an Artin L-function of a higher-dimensional representation. ⚠ Writing `χ(σ)` in place
of `χ(σ)⁻¹`, or `χ(Frob 𝔭)⁻¹` in place of `χ(Frob 𝔭)`, replaces the fibre of `σ` by the fibre of
`σ⁻¹`; over `ℚ(ζ_5)` that swaps the classes of `p ≡ 2` and `p ≡ 3 (mod 5)`, which the Layer 14
agreement theorem detects.

### Layer 12: the weighted transfer package and the Tauberian theorem

**12.1 The regularized boundary function.** Let `L_1` be the series of the trivial character, that
is the Dedekind zeta function of `K` with the Euler factors at the ramified primes deleted. Prove
that the deleted factors are finite and nonzero at `s = 1`, so `L_1` inherits the simple pole with
the same residue; this is the ramified Euler correction, and it is a theorem, not a remark. Define
the regularization

```text
G_1(s) = -L_1'(s)/L_1(s) - 1/(s-1)
```

and prove it extends continuously to `Re s ≥ 1`. For nontrivial `χ`, Layer 5 gives `L_χ` analytic
and nonvanishing at `s = 1`, so `-L_χ'/L_χ` is already continuous there. Combining with 11.4 gives
exactly the `PrimeBoundaryRemainder`-shaped data — an `F` on `Re s > 1`, a continuous `G` on
`Re s ≥ 1`, and `G = F - κ/(s-1)` — with `κ = 1/#Gal(F/K)`.

**12.2 The cyclotomic weighted theorem.** Apply the consumed `wienerIkehara` to the nonnegative
sequence `Λ_σ` only, never to the signed or complex coefficient `χ(𝔞)Λ(𝔞)`, and obtain

```text
ψ_σ(x) / x → 1 / #Gal(F/K)
```

for cyclotomic `F/K`. Summing this over all of `Gal(F/K)` for a single cyclotomic `F/K`, and
removing the primes ramified in `F` by 11.3(3), gives

```text
ψ_K(x) / x → 1.
```

That is the form the squeeze of 12.4 consumes. It is a corollary of 12.2, obtained by adding
`#Gal(F/K)` limits that 12.2 has already proved separately; nothing further is assumed, and in
particular no boundary package for the Dedekind zeta function is imported. The trivial-character
analytic input it rests on is the one Layer 5 already owns.

**12.3 The exact residue-degree-one contraction.** Let `E = L^⟨σ⟩` as in Layer 8 and let `C` be
the class of `σ`. Discard from both sides the finite sets of 11.3(3), and prove the **exact**
identity

```text
∑_{𝔑_E 𝔓 ≤ x, f(𝔓/𝔭) = 1, Frob_{L/E}(𝔓) = σ} log 𝔑_E 𝔓
  = (#G / (#C * f)) * ϑ_C(x).
```

There is no error term: for `f(𝔓/𝔭) = 1` the norms agree, `𝔑_E 𝔓 = 𝔑_K 𝔭`, so the two sides have
the same summands with the same weights, and the multiplicity is Layer 8's fibre count. Adding
11.3(2) on the `E` side turns the left-hand side into `ϑ_σ^{L/E}(x) + o(x)`, and 11.3(1) on both
sides turns `ϑ` into `ψ`:

```text
ψ_σ^{L/E}(x) = (#G / (#C * f)) * ψ_C^{L/K}(x) + o(x).
```

⚠ This is not a corollary of the prime-set crossing of Layers 7–10. That crossing compares sets of
unramified primes, whereas `ψ` counts prime powers weighted by `log 𝔑𝔭`, and both the norm and the
Frobenius change under extension and contraction. The fibre count of Layer 8 counts primes with
residue degree one and relative Frobenius `σ`; the corresponding count at exponent `m` is

```text
#{𝔓 | f(𝔓/𝔭) = 1 and Frob_{L/E}(𝔓)^m = σ}
  = #{w ∈ artinSymbol 𝔭 ⊓ ⟨σ⟩ | w^m = σ} * #G / (#(artinSymbol 𝔭) * orderOf σ),
```

which for `m ≥ 2` is supported on the classes `[w]` with `w^m = σ`, and those are in general not
`C`. In a cyclic extension of degree five with `G = ⟨g⟩` and `σ = g`, a prime with Frobenius `g³`
contributes its square term to the fibre of `g`, because `(g³)² = g`. A transfer performed on `ψ`
would therefore have to track every such class at once. The transfer goes through `ϑ` instead,
with the `m ≥ 2` terms removed on both sides first.

**12.4 The weighted crossing.** With `M`, `H_q` and `E_τ` as in Layer 7, apply 12.2 over `E_τ` and
12.3 to `M/E_τ` to get `ψ_{(σ,τ)}^{M/K}(x)/x → 1/(#G · #H_q)` for each tagged `τ`. Because
restriction `Gal(M/K) → Gal(L/K)` is a homomorphism carrying `Frob_{M/K}(𝔭)` to `Frob_{L/K}(𝔭)`
unpowered, every prime-power term counted by `ψ_{(σ,τ)}^{M/K}` is counted by `ψ_σ^{L/K}`, and the
terms for distinct `τ` are disjoint. Hence

```text
liminf_x ψ_σ^{L/K}(x)/x ≥ c_q
```

for each auxiliary prime, with `c_q` the constant of Layer 9. Take the `x`-limit first and only
then let the level `r` grow, so that `liminf ≥ 1/#G`. Close with `∑_{σ ∈ G} ψ_σ^{L/K}(x) = ψ_K(x) +
O(log x)` and the `ψ_K(x) ~ x` of 12.2: the `#G` liminf bounds sum to `1`, so each is an exact
limit `1/#G`. This squeeze replaces the density squeeze of Layer 9, which is unavailable here
because `HasDirichletDensity` normalizes by the all-prime sum and `ψ` does not.

**12.5 The general theorem.** Apply 12.4 to the abelian extension `L/E` of Layer 8 and contract
with 12.3 to obtain

```text
ψ_C(x) / x → #C/#G
```

for an arbitrary finite Galois `L/K` and conjugacy class `C`.

### Layer 13: `ϑ_C` and `π_C`

From 11.3(1) and Layer 12, `ϑ_C(x)/x → #C/#G`. Define on the canonical prime subtype

```text
π_C(x) = #{𝔭 | 𝔑𝔭 ≤ x and artinSymbol 𝔭 = C}
```

and apply Abel summation to prove

```text
π_C(x) / (x / log x) → #C/#G
```

and the equivalent logarithmic-integral form. Both steps are the consumed
`primeTheta_asymptotic_of_primePsi` and `primeCount_asymptotic_of_primeTheta` specialized to the
Frobenius fibre; do not restate them. Do not hide the residue-degree-above-one terms: 11.3(2) is
proved once and cited wherever counts are contracted between number fields.

### Layer 14: natural density and consistency theorems

`HasNaturalDensity` is normalized by the all-prime count, so the denominator is the prime ideal
theorem for `K`. Obtain it by pushing the `ψ_K(x) ~ x` of 12.2 through the same consumed pair
`primeTheta_asymptotic_of_primePsi` and `primeCount_asymptotic_of_primeTheta` used in Layer 13.
Arithmetic Dirichlet Series states its own prime ideal theorem only conditionally on a boundary
package; that package is not imported, and the denominator here comes from 12.2. Combine it with
Layer 13 to prove

```text
hasNaturalDensity_frobeniusPrimeSet
```

with value `#C/#G`. This is not derived from Layer 10: Dirichlet density alone does not imply
natural density.

Finish with named agreement theorems for:

- `K = ℚ`, `L = ℚ(ζ₅)`, where a class has density `1/4` and Frobenius sends `ζ₅ ↦ ζ₅^p`;
- the identity class, giving the split-completely density `1/#G`;
- cyclic degree four, verifying the `Frob^j` von Mangoldt filter;
- the cyclic-generator fixed-field case of Layer 8;
- deletion of the finite ramified set;
- compatibility of the Dirichlet-density and natural-density results.

## Acceptance tests and nearby false statements

The following are part of the roadmap, not commentary for implementors.

1. **Density denominator.** The public density predicate is the ratio to the all-prime sum. A
   second predicate normalized by `log((s-1)⁻¹)` is rejected; the equivalence is a theorem after
   the Euler product and higher-prime-power bound exist.
2. **Ray-class cancellation.** Total ideal counting cannot continue a nontrivial character series.
   The proof must use counts in individual ray classes and character cancellation.
3. **Prime carrier.** A value of type `Ideal (𝓞 K)` is not accepted by the public density or
   counting API unless accompanied by the subtype proof that it is nonzero and prime.
4. **Frobenius orientation.** Over `ℚ(ζ₅)`, arithmetic Frobenius corresponds to `p mod 5`, not its
   inverse. In the character expansion the inverse sits on the tag: `∑_χ χ(σ)⁻¹ χ(Frob 𝔭)`.
5. **Ramification.** No junk Artin class is assigned at a ramified prime.
6. **Power in `Λ_C`.** The degree-four test must show that a `𝔭²` term can lie in the `g²` fibre
   even when `Frob(𝔭)` lies in the `g` fibre.
7. **Abelianity.** One-dimensional characters separate elements only in an abelian group. An
   `S₃` test prevents applying the cyclotomic orthogonality formula to a general Galois group.
8. **Crossing constant.** For `C₄` and `f = 2`, three elements have order divisible by `2`; a
   formula returning one has retained only a generator.
9. **Fixed field.** In the cyclic-generator test the relative Frobenius is `σ`, not `1`.
10. **Two limits.** The auxiliary prime is fixed while the `x`-asymptotic is taken.
11. **Auxiliary-prime degree.** `L ∩ K(ζ_q) = K` does not give `[K(ζ_q) : K] = q - 1`. The
    accepted input is that `q` is unramified in `L`; a construction that derives the degree from
    the intersection alone is rejected. The witness is `K = ℚ(√5)`, `L = K(√2)`, `q = 5`, where the
    intersection is `K` and the degree is `2`.
12. **Tower exponent.** Raising the base field raises Frobenius to the power `f(𝔓/𝔭)`; shrinking
    the top field along a normal subextension takes no power at all. The `ℚ(ζ_7) ⊃ ℚ(√-7) ⊃ ℚ`
    example at `p = 3` rejects both the unpowered reading and the inverse reading.
13. **Contraction exceptional set.** The primes discarded on the fixed-field side are those lying
    above `ramifiedPrimes K L`. Discarding only the primes of `E` that ramify in `L` is rejected;
    the `S₃` witness of 8.3 lies in the difference.
14. **Weighted crossing.** The asymptotic for `ψ_C` is not a corollary of the prime-set crossing.
    An implementation must exhibit the five estimates of 11.3 and 12.3 separately; a proof that
    transfers `ψ` directly, without removing prime powers `j ≥ 2` on both sides, is rejected
    because the `m`-th power fibre count is not a constant multiple of the indicator of `C`.

## Interfaces supplied to other roadmaps

These names are the public boundary. A consumer does not reconstruct a Frobenius set from an
arbitrary predicate and does not choose a representative of a conjugacy class.

```text
ConjClasses.pow
frobeniusPrimeSet
ramifiedPrimes
cyclotomicCharacterWeight
hasDirichletDensity_cyclotomicFrobenius
hasDirichletDensity_abelianFrobenius
hasDirichletDensity_frobeniusPrimeSet
frobeniusVonMangoldtCoeff
frobeniusPsi
frobeniusTheta
frobeniusPrimeCount
tendsto_frobeniusPrimeCount
hasNaturalDensity_frobeniusPrimeSet
```

### The boundary with Zeros of L-functions

Every statement in this roadmap is qualitative, and that is the whole of the division of labour
with the Zeros of L-functions roadmap. Zeros of L-functions layer 8.7 owns the effective theory: it
consumes the carriers `frobeniusPrimeSet`, `frobeniusVonMangoldtCoeff`, `frobeniusPsi`,
`frobeniusTheta` and `frobeniusPrimeCount` from the list above and states its error terms directly
on them, together with the named exceptional-zero contribution. It also rederives
`tendsto_frobeniusPrimeCount` and `hasNaturalDensity_frobeniusPrimeSet` by discarding its error
term, as consistency theorems.

The consequences for this roadmap are exact:

- no declaration here takes an error term, a zero-free region, or an implied constant as an
  argument, and none is stated with an `O` or `o` term in its conclusion except the internal
  discard estimates of 11.3, which are `o(x)` statements about terms being thrown away;
- no declaration here is a weakened version of one there, and no name is reserved for a later
  effective strengthening;
- the analytic input used here stops at continuation to a neighbourhood of `Re s = 1` and
  nonvanishing on that line, both owned by Layer 5. Zero-free regions of positive width are not
  proved, assumed, or named here.

Consumers wanting an error term go to Zeros of L-functions; consumers wanting the asymptotic go to
`tendsto_frobeniusPrimeCount` here. There is no third form.

## Ordering and parallelism

Layers 1--3 can begin once Number Field Arithmetic and Arithmetic Dirichlet Series fix their
contracts. Layers 4--6 require Global Number Fields. Layers 7 and 8 are independent of the
analytic work: 7.1--7.3 need only Mathlib's cyclotomic and ramification theory, while 7.4--7.5 and
all of Layer 8 need the two Frobenius restriction laws, so both layers can be developed in
parallel with Layers 4--6. Layer 8 comes before Layer 9 because its fibre count is what turns a
relative density over a fixed field into a density over `K`, and that is exactly what Layer 9 does
with the tagged fibres of the crossing. Layers 9 and 10 form the density spine.

Layers 11--14 form the counting spine. 11.3 is independent of everything else here and can be
proved as soon as Layer 2's exceptional set exists; doing it early is worthwhile, because 12.3 and
12.4 both consume it, and it is the part of the weighted argument that the prime-set crossing does
not supply. The counting spine reuses the crossing and fixed-field combinatorics of Layers 7--9 but
not the conclusion of Layer 10: Dirichlet density does not imply natural density.

## References

- J. Neukirch, *Algebraic Number Theory*, Chapter VII, especially §§6--8 and §13.
- J. S. Milne, *Class Field Theory*, version 4.03, Chapter VI §§3--4 and Chapter VIII §7.
- R. Sharifi, *Algebraic Number Theory*, Theorem 7.2.2.
- H. W. Lenstra Jr. and P. Stevenhagen, “Chebotarëv and his density theorem,” *Math. Intelligencer*
  18 (1996), 26--37.
- S. Lang, *Algebraic Number Theory*, Chapter XV, for the Tauberian and prime-ideal arguments, and
  Chapter I §5 for the residue degree of a prime under a subgroup of the Galois group, used in 8.2.
- J.-P. Serre, *Local Fields*, for arithmetic/geometric Frobenius conventions.
- L. Washington, *Introduction to Cyclotomic Fields*, Chapter 2, for total ramification of `ℚ(ζ_q)`
  at `q` and the resulting subfield ramification used in 7.2.
