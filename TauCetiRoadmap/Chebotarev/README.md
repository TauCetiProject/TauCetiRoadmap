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
- cyclotomic crossing and the exact auxiliary-prime constants;
- the fixed-field fibre count for a general conjugacy class;
- Dirichlet-density Chebotarev over an arbitrary number field;
- the Frobenius von Mangoldt coefficient, `ψ_C`, `ϑ_C`, and `π_C`;
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
| `primeTheta`, `primeCount` | The canonical prime-weight and prime-count carriers. Chebotarev defines only their Frobenius-restricted specializations. |

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

## Pinned conventions

| Subject | Convention |
| --- | --- |
| Frobenius | Arithmetic Frobenius: on a residue field of cardinality `q`, it acts by `x ↦ x^q`. The geometric convention appears only in explicitly named translation lemmas. |
| Public Frobenius object | A conjugacy class, namely the consumed `artinSymbol`. A chosen element is used only after abelianity makes the class a singleton or inside a proof with membership in the class recorded. |
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

### Layer 7: auxiliary-prime crossing data

For finite abelian `L/K`, `σ ∈ Gal(L/K)` of order `f`, and level `r`, choose a rational prime `q`
outside a finite exceptional set with `q ≡ 1 (mod f^r)`, such that

```text
L ∩ K(ζ_q) = K
```

and `Gal(K(ζ_q)/K)` is cyclic of order `q-1`. Construct the compositum and prove the restriction
isomorphism

```text
Gal(L K(ζ_q)/K) ≃ Gal(L/K) × Gal(K(ζ_q)/K),
```

together with its Frobenius compatibility from the consumed restriction theorem.

For each `τ` whose order is divisible by `f`, take the fixed field of `⟨(σ,τ)⟩`; its extension to
the compositum is cyclotomic. Prove pairwise disjointness of the tagged Frobenius fibres and the
contraction hypotheses, including residue degree one.

### Layer 8: abelian Chebotarev

Write `H_q = Gal(K(ζ_q)/K)` and

```text
H_{q,f} = {τ ∈ H_q | f ∣ orderOf τ}.
```

Layer 6 over each fixed field gives one tagged fibre density `1/(#G * #H_q)`. Their disjoint union
therefore gives the lower bound

```text
c_q = #H_{q,f} / (#G * #H_q).
```

Prove the exact cyclic-group count and that `c_q → 1/#G` as the auxiliary level grows. One chosen
generator supplies only `1/(#G(q-1))`, which tends to zero; the union over all of `H_{q,f}` is
load-bearing. Finally use the density squeeze across all elements of the abelian Galois group.

### Layer 9: the cyclic fixed-field fibre

For arbitrary finite Galois `L/K`, choose `σ ∈ C`, put `f = orderOf σ`, and let
`E = L^⟨σ⟩`. Prove that `L/E` is cyclic with generator the restriction of `σ`. Compare relative
and absolute Frobenius through the prime-relative tower theorem.

Each prime `𝔭` of `K` in the class `C` has exactly

```text
#G / (#C * f) = #Centralizer_G(σ) / f
```

primes `𝔓` of `E` of residue degree one over `K` whose relative Frobenius in `L/E` is `σ`; every
such `𝔓` lies above a prime in `C`. The relative class is `σ`, not the identity. Test the theorem
when `L/K` is cyclic and `σ ≠ 1` generates `G`: then `E = K`, the required fibre has one member,
and the split-completely fibre has none.

### Layer 10: Dirichlet-density Chebotarev

Apply abelian Chebotarev to `L/E`, where the relevant relative fibre has density `1/f`, and
contract using the exact fibre size from Layer 9. The result is the named theorem

```text
hasDirichletDensity_frobeniusPrimeSet
```

with value `#C/#G` over every number field `K`.

Derive, rather than reprove, the density of split-completely primes, the non-Galois statement via
a Galois closure, infinitude of every Frobenius class, and the rational arithmetic-progression
case. State invariance under finite symmetric difference as a corollary.

### Layer 11: the Frobenius von Mangoldt coefficient

For a conjugacy class `C`, define the nonnegative coefficient

```text
Λ_C(n) = ∑_{𝔑𝔭^j = n, j ≥ 1, (artinSymbol 𝔭)^j = C} log 𝔑𝔭.
```

The equality means the power of the conjugacy class from Layer 1. At a ramified prime there is no
term. Prove nonnegativity, summability on `Re s > 1`, and the character-orthogonality identity in
the cyclotomic case. This identity is a theorem about the canonical coefficient, never a hypothesis
on an arbitrary sequence.

The mandatory regression test is cyclic of degree four. If `G = ⟨g⟩ ≅ C₄` and a prime has
Frobenius `g`, its square term contributes to the `g²` fibre because `g² ∈ [g²]`. A definition
testing only the unpowered Frobenius omits that term and cannot satisfy the logarithmic-derivative
identity.

### Layer 12: the Tauberian weighted-prime theorem

For a cyclotomic fibre, combine the identity of Layer 11 with Layer 5's boundary continuation.
The trivial character supplies the pole with residue `1/#G`; the nontrivial characters supply
continuous boundary terms. Apply the consumed `wienerIkehara` only to the nonnegative sequence
`Λ_C`, never to the signed or complex coefficient `χ(𝔞)Λ(𝔞)`.

Define

```text
ψ_C(x) = ∑_{n ≤ x} Λ_C(n)
```

and prove `ψ_C(x) / x → #C/#G` first for a cyclotomic extension. Repeat the crossing argument with
weighted asymptotics, taking the `x`-limit before the auxiliary-level limit, and then apply the
fixed-field contraction to obtain the theorem for a general conjugacy class.

### Layer 13: `ϑ_C` and `π_C`

Define on the canonical prime subtype

```text
ϑ_C(x) = ∑_{𝔑𝔭 ≤ x, Frob(𝔭) ∈ C} log 𝔑𝔭,
π_C(x) = #{𝔭 | 𝔑𝔭 ≤ x and Frob(𝔭) ∈ C}.
```

Bound the contribution of powers `j ≥ 2` by the generic prime-power estimates to obtain
`ϑ_C(x) / x → #C/#G`. Apply Abel summation to prove

```text
π_C(x) / (x / log x) → #C/#G
```

and the equivalent logarithmic-integral form. Do not hide the residue-degree-above-one terms;
prove once that they are lower order before contracting counts between number fields.

### Layer 14: natural density and consistency theorems

Combine Layer 13 with the all-prime theorem from Arithmetic Dirichlet Series to prove

```text
hasNaturalDensity_frobeniusPrimeSet
```

with value `#C/#G`. This is not derived from Layer 10: Dirichlet density alone does not imply
natural density.

Finish with named agreement theorems for:

- `K = ℚ`, `L = ℚ(ζ₅)`, where a class has density `1/4` and Frobenius sends `ζ₅ ↦ ζ₅^p`;
- the identity class, giving the split-completely density `1/#G`;
- cyclic degree four, verifying the `Frob^j` von Mangoldt filter;
- the cyclic-generator fixed-field case of Layer 9;
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
   inverse.
5. **Ramification.** No junk Artin class is assigned at a ramified prime.
6. **Power in `Λ_C`.** The degree-four test must show that a `𝔭²` term can lie in the `g²` fibre
   even when `Frob(𝔭)` lies in the `g` fibre.
7. **Abelianity.** One-dimensional characters separate elements only in an abelian group. An
   `S₃` test prevents applying the cyclotomic orthogonality formula to a general Galois group.
8. **Crossing constant.** For `C₄` and `f = 2`, three elements have order divisible by `2`; a
   formula returning one has retained only a generator.
9. **Fixed field.** In the cyclic-generator test the relative Frobenius is `σ`, not `1`.
10. **Two limits.** The auxiliary prime is fixed while the `x`-asymptotic is taken.

## Interfaces supplied to other roadmaps

The Zeros of L-functions roadmap consumes the exact Frobenius prime set and the qualitative
counting endpoint before adding effective refinements. Other arithmetic projects may consume:

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

These names are the public boundary. A consumer does not reconstruct a Frobenius set from an
arbitrary predicate and does not choose a representative of a conjugacy class.

## Ordering and parallelism

Layers 1--3 can begin once Number Field Arithmetic and Arithmetic Dirichlet Series fix their
contracts. Layers 4--6 require Global Number Fields. Layer 7 can be developed in parallel with
the analytic part of Layers 4--6 after the Frobenius restriction law is available. Layers 8--10
form the density spine. Layers 11--14 form the counting spine and may reuse the crossing and
fixed-field combinatorics, but not the conclusion that Dirichlet density implies natural density.

## References

- J. Neukirch, *Algebraic Number Theory*, Chapter VII, especially §§6--8 and §13.
- J. S. Milne, *Class Field Theory*, version 4.03, Chapter VI §§3--4 and Chapter VIII §7.
- R. Sharifi, *Algebraic Number Theory*, Theorem 7.2.2.
- H. W. Lenstra Jr. and P. Stevenhagen, “Chebotarëv and his density theorem,” *Math. Intelligencer*
  18 (1996), 26--37.
- S. Lang, *Algebraic Number Theory*, Chapter XV, for the Tauberian and prime-ideal arguments.
- J.-P. Serre, *Local Fields*, for arithmetic/geometric Frobenius conventions.
