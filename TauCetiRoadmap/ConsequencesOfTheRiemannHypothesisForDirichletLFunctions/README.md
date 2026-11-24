# Roadmap: consequences of the Riemann hypothesis for Dirichlet L-functions

**Summary.** The roadmap
[GeneralizedRiemannHypothesisFromWindowBounds](../RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/README.md)
of the family [RiemannHypothesisForDirichletLFunctions](../RiemannHypothesisForDirichletLFunctions/README.md)
proves the generalized Riemann hypothesis for every Dirichlet L-function: for every modulus
`N ≥ 1`, every Dirichlet character `χ` modulo `N` and every `s` with `Re s > 1/2`, `L(s, χ) ≠ 0`
unless `χ` is principal and `s = 1`; in particular it proves the Riemann hypothesis for `ζ`. Its
headline theorems, which state this through meromorphic orders, for `ζ`, and in the forms through
values and on the critical strip, are *the main theorems* (Conventions). Theorems of many other
roadmaps assume one of them, or a statement that follows from them; this roadmap states those
theorems with that assumption removed. It
begins with three statements that the main theorems give for further L-functions: the hypothesis
for the completed L-functions of primitive Dirichlet characters, the extended Riemann hypothesis for
the Dedekind zeta function of every number field abelian over `ℚ`, and the Riemann hypothesis for
every Hecke character of such a field whose class field is abelian over `ℚ`.

Each target is a statement of another roadmap, the *conditional theorem* named in its heading,
with the hypotheses that the main theorems give removed and every other hypothesis kept and named.
Its `*Origin:*` label names the published source of the conditional theorem, and its `*Needs:*`
line names the main theorems and the conditional theorem. None of these statements is a statement
of the formal proof that GeneralizedRiemannHypothesisFromWindowBounds cites for its main theorems:
each is drawn here from the main theorems through the conditional theorem that it cites, and no
section carries a label on the method of the formal proof.

Layer 0 states the hypothesis for the completed L-functions of primitive Dirichlet characters, for
the Dedekind zeta functions of abelian fields, for the Hecke characters of abelian extensions of `ℚ`
and for the norm-composed characters, and the hypotheses and records that other roadmaps write in
their own predicates: exceptional zeros and the size of the Riesz remainder, the Riemann hypothesis
up to a height, Platt's and Lu–Zaman–Zhao's records, and the mod-eight zero clause. Layer 1 concerns
the zeros and values of `ζ` and of L-functions: growth on vertical lines, the argument on the
critical line, the zero count of `ζ`, explicit zero-free regions and zero densities, the numerical
Landau–Siegel gap, and Li and Weil positivity. Layer 2 concerns the counting of primes: von Koch's
bounds and their explicit forms from the Riemann hypothesis, from verified heights and from
zero-free regions and densities, Ramanujan's inequality, Mertens sums, the Mertens function, and
primes in short intervals. Layer 3 concerns primes in progressions, the least prime in a
progression, least character values and primitive roots, and Layer 4 number fields: class numbers,
quadratic zero gaps, effective Chebotarev theorems, the prime ideal theorem, generators of the class
group and residues of Dedekind zeta functions. Where another roadmap obtains explicit bounds from an
unconditional general estimate, this roadmap derives them instead from the bounds that the Riemann
hypothesis gives.

The roadmap feeds [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md),
[ExplicitZetaBounds](../ExplicitZetaBounds/README.md),
[ExplicitPrimeCounting](../ExplicitPrimeCounting/README.md) and the other roadmaps whose
statements assume the Riemann hypothesis for Dirichlet L-functions.

## Conventions

- **The main theorems.** GeneralizedRiemannHypothesisFromWindowBounds §5.1:
  `χ.GeneralizedRiemannHypothesis` for every `N` with `NeZero N` and every
  `χ : DirichletCharacter ℂ N`. GeneralizedRiemannHypothesisFromWindowBounds §5.2:
  `RiemannHypothesis`. GeneralizedRiemannHypothesisFromWindowBounds §5.3: for every `N ≥ 1` and
  `χ : DirichletCharacter ℂ N`, the hypothesis for `χ`, for `χ⁻¹` and for `χ.primitiveCharacter`;
  `χ.LFunction s ≠ 0` if `1/2 < Re s` and (`χ ≠ 1` or `s ≠ 1`); `Re s = 1/2` if `0 < Re s < 1`
  and `χ.LFunction s = 0`, imprimitive characters included; `riemannZeta s ≠ 0` whenever
  `1/2 < Re s`, and every zero of `riemannZeta` with `0 < Re s < 1` has `Re s = 1/2`. These are cited
  with the name of their roadmap; a section number written without `§` and without the name of a
  roadmap is a section of this roadmap.
- **Zeros.** A zero of `f` at `ρ` is a point of positive meromorphic order,
  `0 < meromorphicOrderAt f ρ`. `ZeroFreeRightOf σ f` is RiemannHypothesisStatementsAndConsequences
  §9.2's predicate: `meromorphicOrderAt f s ≤ 0` for every `s` with `Re s > σ`; poles are allowed.
- **Characters.** `K` is a number field. A *character* of `K` is a primitive finite-order
  ray-class character, a term `ψ : PrimitiveRayClassCharacter K` (LFunctions Layer 5), and
  `L(s, ψ)` is its continued L-function `heckeLFunctionC ψ.character`. The trivial character
  `1 : PrimitiveRayClassCharacter K` has L-function `dedekindZetaC K`, written `ζ_K`. A primitive
  Dirichlet character is a term of `PrimitiveDirichletCharacter`
  (RiemannHypothesisStatementsAndConsequences §10.3), and
  *PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter*
  (RiemannHypothesisStatementsAndConsequences §11.1) is the
  equivalence with the characters of `ℚ`, under which the L-functions agree.
- **Characters of a Galois group.** For a finite abelian extension `L/K` of number fields let
  `𝔣 = abelianConductor K L` and `Φ_{L/K} = rayClassArtinMap 𝔣 _ : RayClassGroup 𝔣 →* Gal(L/K)`,
  the ray-class Artin map at the conductor (ClassFieldTheory Layer 12: surjective, with the
  splitting law `rayClassArtinMap_idealClass`), a reciprocity dictionary in the sense of
  ZerosOfLFunctions §8.8. For a character `φ : Gal(L/K) →* ℂˣ` write
  `φ̃ = PrimitiveRayClassCharacter.of (φ.comp Φ_{L/K})`, a character of `K`. Two dictionaries
  induce the same primitive characters (RiemannHypothesisStatementsAndConsequences §8.8,
  *PrimitiveRayClassCharacter.of_comp_dictionary_eq*), so `φ̃` may be computed from any of them. At
  a prime `𝔭 ∤ 𝔣` it takes the value `φ(Frob_𝔭)` (the splitting law, `Gal(L/K)` being abelian),
  which is the value there of the character that AnalyticNumberTheoryPartI §2.18a attaches to `φ`
  by global reciprocity.
- **Prime sums.** `Λ_K` is the ideal von Mangoldt function (Tau Ceti
  `TauCeti.IdealArithmeticFunction.vonMangoldt`, as in LFunctions Layer 8) and
  `ψ_K = TauCeti.primePsi K Set.univ`, `ψ_K(x) = Σ_{𝔑𝔞 ≤ x} Λ_K(𝔞)`; over `ℚ` it is
  `Chebyshev.psi`.
- **The remainder `G_ψ`.** `G_ψ` = *PrimitiveRayClassCharacter.rieszRemainder* `ψ`, the Riesz
  remainder of RiemannHypothesisStatementsAndConsequences §8.4a(b): the Riesz sum `rieszSum` of
  RiemannHypothesisStatementsAndConsequences §8.4a(a) of the coefficients of
  `−L′/L(·, ψ)`, plus `y · (L′/L)(1, ψ)` for `ψ ≠ 1`, and minus `y log y` plus
  `(1 + EK(K)) y` for `ψ = 1`, where `EK(K)` is the Euler–Kronecker constant
  *NumberField.eulerKroneckerConstant* `K` and `EK(ℚ) = γ`. It is complex-valued. For a primitive
  Dirichlet character `κ`, `G_κ` denotes `PrimitiveDirichletCharacter.rieszRemainder κ`, which is
  the remainder of the character of `ℚ` attached to `κ` (RiemannHypothesisStatementsAndConsequences
  §8.4a(b)).
- **The hypotheses.** The predicates are those of RiemannHypothesisStatementsAndConsequences §§9.3–9.5:
  `χ.GeneralizedRiemannHypothesis` for `χ : DirichletCharacter ℂ N` with `[NeZero N]`
  (`ZeroFreeRightOf (1/2) χ.LFunction`); *NumberField.ExtendedRiemannHypothesis* `K`
  (`ZeroFreeRightOf (1/2) (dedekindZetaC K)`); `χ.GeneralizedRiemannHypothesis` for
  `χ : RayClassCharacter 𝔪`, read for a character `ψ` of `K` on `ψ.character`; and
  `d.GeneralizedRiemannHypothesis` for a record `d`. There is no predicate for a family of
  characters, for a modulus or for all characters: such statements carry their quantifiers.

**Removed and kept hypotheses.** Each target below is a statement of another roadmap with the
hypotheses that the main theorems and 0.1–0.3 give removed. Every other hypothesis of the statement
stays and is named, except where the conclusion of the cited statement follows from the main
theorems alone: a zero-free region inside `Re s > 1/2`, a count of zeros right of `1/2` bounded by a
nonnegative quantity, a statement about real zeros right of `1/2` (1.4(a)–(b), the zero inputs of
2.4, 2.9 and 3.2). Such a statement is given with no hypothesis, its records included. Where the
cited statement is an unconditional estimate whose proof weighs every zero, an explicit formula
smoothed with split heights or a positivity criterion for primes in a short interval, the target
states its instances, the bounds that the cited roadmap quotes, as consequences of the bounds of
2.3 and 2.8 with the finite records those need, and not the estimate itself (2.4, 2.5, 2.9); in the
same way 3.3 derives the cyclotomic least-prime bound from its headline, with the headline's
records. The statements are those of the cited sections, with the removed hypotheses read in the
predicates of RiemannHypothesisStatementsAndConsequences §§9.2–9.5;
GeneralizedRiemannHypothesisFromWindowBounds §5.1, and 0.2, 0.3, 0.5 and 4.5 here, name the
predicates in which the cited roadmaps write them. Each hypothesis list after "given" below is the
cited statement's own hypothesis list with the removed hypotheses taken out, together with every
named proposition that the cited statement's route uses and its list does not name; such an
addition says where the route uses it. Where the cited roadmap states the implication from the
hypothesis to one of its own records (ExplicitZetaBounds §0.2 for `DirichletGRHUpTo`), the route
inserts the main theorems and 0.1–0.3 into that implication; where the cited section states no such
implication, the route derives the statement here from that section's definitions and the main
theorems (0.7, 0.8, 1.3 through 1.2, 1.5).

**Bounded heights, regions and densities.** 0.6 gives `RiemannHypothesisUpTo H` and `GRH*(q, H)` at
every height `H` and modulus `q`, 0.7 the records `PlattRecord` and `LuZamanZhaoRecord`, and 1.4 the
zero-free regions and zero-density bounds of ExplicitZetaBounds Layers 7–8 and those of `ζ` at the
parameters stated in 1.4(d). Every statement of ExplicitZetaBounds and of ExplicitPrimeCounting that
takes such hypotheses therefore holds with them removed. The targets 0.6, 0.7, 1.3–1.5, 2.2–2.6,
2.8, 2.9, 3.2 and 3.3 name the statements whose discharge removes more than a bounded-height
hypothesis, and those that other targets use or that other roadmaps quote; the others, among them
ExplicitPrimeCounting §§2.1, 3.2, 3.3, 3.7, 3.8, 4.2, 4.3, 5.3, 6.4 and 7.4, lose those hypotheses
by 0.6, 0.7 and 1.4 alone and keep every other, together with the named propositions that their
routes use besides their lists (such as Rosser's zero count and the reciprocal-zero records,
below). Two general theorems of ExplicitPrimeCounting are not discharged here: the smoothed
explicit formula with split heights of its §3.1(c), and the positivity criterion of its §7.3; their
instances are the statements of 2.4 and 2.9. A statement of ExplicitPrimeCounting whose route takes
as input one of the bounds that 2.4 proves directly, such as `trudgian_interval` of its §7.4, which
takes Trudgian's `|θ(t) − t| ≤ 0.0045 t/log² t` for `t ≥ e³⁵`, holds with that input taken from
2.4, under the hypotheses listed there, in place of *FaberKadiriTable*.

**The truncated explicit formula.** The truncated explicit formula of ExplicitPrimeCounting §2.1
and its *DudekExplicitFormula* bound the short sums of `Λ` by the Brun–Titchmarsh inequality of
that roadmap's §0.1, which is proved under `MVDiagonalFiniteRange` and `BrunTitchmarshFiniteRange`:
below, *the Brun–Titchmarsh ranges*. The formula's Dudek shape (error `2 x log² x/T` for `x ≥ e⁴⁰`
and `max(51, log x) < T < (√x − 2)/2`) is the row `(40, 1/2, 0.48, 6.431)` of its table proposition
*CullyHugillJohnstonTable*: below, *the Dudek row*. A statement below whose route uses the formula
is given the Brun–Titchmarsh ranges, the rows of that table it uses, and Rosser's zero count
(below), through which the formula's contour argument counts the zeros near the truncation height.

**Counting zeros.** Three inputs on the counting of zeros recur, and each is named once here.

- *Rosser's zero count* is the pair of records `ZetaZeroFreeUpTo 14` (no zero of `ζ` with
  `0 < Re s < 1` and `|Im s| ≤ 14`) and `ZetaArgumentBoundUpTo 6800000 2` of ExplicitZetaBounds
  §0.4, under which its §5.2 states Rosser's bound
  `|N(T) − M(T)| ≤ 0.137 log T + 0.443 log log T + 1.588` for every `T ≥ 2`
  (`zetaZeroCountBound_rosser_of_recorded`, ExplicitPrimeCounting's *ZeroCountBound*
  `0.137 0.443 1.588 0 2`); from `T = 1467` on it states the bound with no record. The zero count
  that ExplicitPrimeCounting's routes take from `gap:explicit-zero-count-error` is this bound from
  `T = 2`, and the lemmas of its §§2.1 and 3.1 that bound sums over the ordinates assume the count
  from `T = 2`. A statement below whose route uses that count is given Rosser's zero count, unless
  the route takes the count below the height `10⁹` from `ZetaZeroCountLowRange` instead (Lee–Nosal's
  bounds and Chirre–Helfgott's, which carry that record).
- *The reciprocal-zero records* are `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange` and
  *ZetaZeroReciprocalLowRange*, the finite record
  `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π)` for every real `T` with `4πe ≤ T ≤ 200` (the left side is
  constant between consecutive ordinates and the right side increases, so it is this inequality at
  `T = 4πe` and at the `74` ordinates in `(4πe, 200]`). Under them Johnston–Yang's two-sided bound
  of ExplicitPrimeCounting §2.1,
  `(1/4π) log²(T/2π) − 0.9321 ≤ ∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π)` for `T ≥ 4πe`, holds. Write
  `N = M + Q`: `ZetaZeroCountLowRange` gives `|Q(t)| ≤ 0.28 log t` on `[2π, 10⁹]`, and Rosser's
  bound, which ExplicitZetaBounds §5.2 states from `1467` with no record, gives it above `10⁹`
  (`0.137 log t + 0.443 log log t + 1.588 ≤ 0.28 log t` there). Since `dM(t) = (1/2π) log(t/2π) dt`,
  Stieltjes integration of `1/t` over `(U, V]`, `2π ≤ U ≤ V`, gives
  `∑_{U < γ ≤ V} 1/γ = (1/4π)(log²(V/2π) − log²(U/2π)) + Q(V)/V − Q(U)/U + ∫_U^V Q(t) t⁻² dt`,
  and the last three terms have absolute value at most `0.28 (2 log U + 1)/U`. Lower side: the record
  at `2π` gives `N(2π) ≤ −1/8 + 0.28 log 2π < 1`, so `N(2π) = 0`, `Q(2π) = 1/8`, and for `T ≥ 4πe`
  the error from `U = 2π` is at least `−1/(16π) − 0.28 log T/T − 0.28 (1 + log 2π)/(2π) ≥ −0.1754`.
  Upper side: `ZetaZeroReciprocalSum` lies below `(1/4π) log²(10⁷/2π) = 16.2278074617` by
  `m₇ = 0.0171594248`; for `200 ≤ T ≤ 10⁷` the identity on `(T, 10⁷]` gives
  `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π) − m₇ + 0.28 (2 log T + 1)/T`, and
  `0.28 (2 log T + 1)/T ≤ 0.0162353 < m₇` for `T ≥ 200`; for `T > 10⁷` the identity on `(10⁷, T]`
  costs at most `0.28 (2 log 10⁷ + 1)/10⁷ < 10⁻⁶`; on `[4πe, 200]` it is *ZetaZeroReciprocalLowRange*.
  The first two records alone do not give the upper side on that range (a Check of 2.4). The bound
  is the one behind the term `s₁` of §3.1(d) and behind Broadbent–Kadiri–Lumley–Ng–Wilk's (A.10); a
  statement whose route bounds `s₁` that way is given these three records.
- *The Dirichlet zero counts* are, for a primitive character of conductor `k > 1`, the count of
  ExplicitZetaBounds §5.3, given *BennettMartinOBryantRechnitzerRecord*, and, for the trivial
  character, of conductor `1`, Rosser's zero count. A route that sums a zero count over all the
  characters modulo `q` takes the first for each nonprincipal character, through its primitive
  character (in `0 < Re s < 1` an imprimitive character has the zeros of its primitive character,
  the Euler factors at the primes dividing `q` vanishing only on `Re s = 0`: ExplicitZetaBounds
  §0.2), and the second for the principal character, whose zeros in `0 < Re s < 1` are those of
  `ζ`. §5.3 is stated for `k > 1` only: at `k = 1` and `T = 15` its formula would give
  `ℓ = log(17/2π) = 0.995 ≤ 1.567`, hence no zero, while `ζ` has the two zeros `1/2 ± 14.1347…i`.

**The remaining hypotheses of ExplicitPrimeCounting §3.7.** ExplicitPrimeCounting §3.7 has many
hypotheses, and several statements below take them. After 0.6 and 1.4 those that remain are the
zero count, which is Rosser's zero count (it contains the absence of zeros with `0 < Re s < 1` and
`|Im s| ≤ 14` that §3.7 lists), `ZetaZeroCubeSum`, *BKLNWPsiTable*, *BKLNWThetaTables*,
`ButheVerified` and *BKLNWRange*, and, for the rows `b ≥ 2500` of *BKLNWPsiTable*, which use the
truncated explicit formula and bound the term `s₁` of §3.1(d) through Johnston–Yang's bound, the
Dudek row, the Brun–Titchmarsh ranges and the reciprocal-zero records: below, *the remaining
hypotheses of §3.7*. §3.7 proves *PsiThetaUpper* `(1 + 1.93378·10⁻⁸, 1.04320, e⁴⁰)` under them, so a
statement given "*PsiThetaUpper* or the remaining hypotheses of §3.7" holds under either of the two.

**Conditional statements that are the main theorems.** Some conditional statements of other
roadmaps are the main theorems themselves, or 0.2, and have no further target here: the hypothesis
for every Dirichlet character (AnalyticNumberTheoryPartI §1.6) is
GeneralizedRiemannHypothesisFromWindowBounds §5.1; the extended Riemann hypothesis for every field
abelian over `ℚ` and for the cyclotomic fields (AnalyticNumberTheoryPartI §2.42;
ClassicalArithmeticCompletion §5.0 for Dedekind zeta functions) is 0.2; the Dirichlet parts of
QuasiRiemannHypothesis §§10.7 and 11.1 at the exponent `1/2` are
GeneralizedRiemannHypothesisFromWindowBounds §5.1 and the strip form of its §5.3.

**Hypotheses that stay.** No target removes a hypothesis that the main theorems and 0.1–0.3 do not
give: the Riemann hypothesis of a field not abelian over `ℚ`, of a Hecke character not of the form
of 0.3, or of an Artin, automorphic or Rankin–Selberg L-function; nonvanishing at the central point;
simplicity of zeros; the Dedekind conjecture. At the nine quadratic fields with `d_F ≤ 13`, where
GeneralizedRiemannHypothesisFromWindowBounds §5.3 reduces the gap hypothesis of 4.2 to
`L(1/2, χ_F) ≠ 0`, 4.2 takes in its place the finite record *SmallQuadraticCentralValues* that it
states. A finite computational record is removed only where what it supplies to the cited
statement follows from the main theorems together with the hypotheses that the statement keeps: in
the statements of 1.4(a)–(b); with the regions and densities that the statements of 2.4 and 3.2
take from ExplicitZetaBounds, whose records (`BrentPlattTrudgianRecord`, `HiaryRecord` and the
others that ExplicitZetaBounds lists with each region and density) go with the object they serve;
*PlattCentralRecord* in 3.2, whose only role there is to exclude an exceptional zero;
*JohnstonTable* in 2.3, whose only role is to carry Johnston's bounds beyond the range in which
ExplicitPrimeCounting §2.3 proves sharper ones at a fixed verified height, a range that
GeneralizedRiemannHypothesisFromWindowBounds §5.2, through 0.6, makes unbounded; and the table
propositions and the records on low zeros and on zero counts of the statements that 2.4, 2.5 and
2.9 prove from the bounds of 2.3 and 2.8 (among them *FaberKadiriTable*, *KadiriLumleyTable*,
*CullyHugillLeeTable*, *RamareSaouterTable*, *DusartThesisTable*, *PlattTrudgianTable*,
*OdlyzkoZeroSums*, *LMFDBZeroSums*, *RosserSchoenfeldLowZeros* and *VanDeLuneZeroCount*, as those
statements list them in ExplicitPrimeCounting), which are given the records of 2.3 and 2.8 instead,
with the finite ranges named with each. The records behind a zero count stay with the zero count,
and wherever a statement rests on a record in any other way, the record stays.

## Layer 0: the hypothesis for further L-functions, and the hypotheses and records of other roadmaps

### 0.1 Completed L-functions (ZerosOfLFunctions §9.1)

*Origin:* published: Davenport (2000), chapters 9 and 12, the completed L-function of a primitive
Dirichlet character, its functional equation and its zeros, in the form of ZerosOfLFunctions §9.1,
with its hypothesis supplied by the main theorems.

`re_eq_half_of_meromorphicOrderAt_completedLFunction_pos`: for a primitive
Dirichlet character `χ`, `(dirichletData χ hχ).GeneralizedRiemannHypothesis`: every
point of positive order of its completed function, which has the divisor of Mathlib's
`DirichletCharacter.completedLFunction χ`, has real part `1/2`. And
`riemannZetaData.GeneralizedRiemannHypothesis`.

Route: ZerosOfLFunctions §9.1, from its (iii) to its (i), with
GeneralizedRiemannHypothesisFromWindowBounds §5.1 for `χ`, (i) being the hypothesis of the record
`dirichletData χ hχ` (LFunctions Layer 4), whose completed function
`q^(s/2) · DirichletCharacter.completedLFunction χ s` has the divisor of
`DirichletCharacter.completedLFunction χ` (ZerosOfLFunctions §§6.4a, 9.1), by the divisor form of
RiemannHypothesisStatementsAndConsequences §9.3; GeneralizedRiemannHypothesisFromWindowBounds §5.2
and the `ζ` bridge of RiemannHypothesisStatementsAndConsequences §9.3.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2; ZerosOfLFunctions §§6.4a, 9.1;
RiemannHypothesisStatementsAndConsequences §9.3; LFunctions Layer 4.

### 0.2 Dedekind zeta functions of abelian fields (AnalyticNumberTheoryPartI §2.42)

*Origin:* published: Heilbronn (1967), the factorization of the Dedekind zeta function of an
abelian field into L-functions of characters, in the form of AnalyticNumberTheoryPartI §2.42 (the
extended Riemann hypothesis of an abelian field is the Riemann hypothesis together with the
hypothesis for the nontrivial Dirichlet characters of the factorization), with its hypothesis
supplied by the main theorems.

`meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois`: for every number field `K` with
`IsAbelianGalois ℚ K`, *NumberField.ExtendedRiemannHypothesis* `K`. In particular
*NumberField.ExtendedRiemannHypothesis* `(CyclotomicField q ℚ)` for every `q ≥ 1`.
The theorem gives ERH(`K`) of AnalyticNumberTheoryPartI §2.42, which ExplicitNumberFields writes
`DedekindERH K`, and `DedekindERH K` of ClassicalArithmeticCompletion §5.0: both are the strip form
of RiemannHypothesisStatementsAndConsequences §9.5 for `dedekindZetaC K`.

Route: by Kronecker–Weber (ClassFieldTheory Layer 13, `kroneckerWeber`) `K` embeds in `ℚ(ζ_f)` for
some `f ≥ 1`, and AnalyticNumberTheoryPartI §2.42 for that `f` (its abelian equivalence of ERH(`K`)
with `RiemannHypothesis` and `DirichletGRH χ` for the nontrivial characters `χ` of the product
`ζ_K = ∏_χ L(s, χ*)`) gives ERH(`K`) from GeneralizedRiemannHypothesisFromWindowBounds §5.2 and from
GeneralizedRiemannHypothesisFromWindowBounds §5.1 in the form `DirichletGRH χ`; the strip form of
RiemannHypothesisStatementsAndConsequences §9.5 turns it into
*NumberField.ExtendedRiemannHypothesis* `K`. The cyclotomic case is the
case `K = ℚ(ζ_q)`, `f = q`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2; AnalyticNumberTheoryPartI §§1.6,
2.42; RiemannHypothesisStatementsAndConsequences §§9.4, 9.5; ClassFieldTheory Layer 13.

**Checks.**

- `K = ℚ(i)`: `ζ_K = ζ · L(·, χ₋₄)`; the theorem is GeneralizedRiemannHypothesisFromWindowBounds
  §5.2 together with GeneralizedRiemannHypothesisFromWindowBounds §5.1 at `χ₋₄`.
- For a non-Galois cubic field `K` the factorization of `ζ_K` involves the Artin L-function of a
  two-dimensional representation, which is not a Dirichlet L-function: no target here gives
  *NumberField.ExtendedRiemannHypothesis* `K`.

### 0.3 Hecke characters of abelian extensions of `ℚ` (QuasiRiemannHypothesis §§5.4, 5.4a)

*Origin:* published: Heilbronn (1967), the zeta function of an abelian extension as a product of
L-functions of characters, and Milne (2020), chapter V, the Artin map of `ℚ(ζ_m)/ℚ` and its
behaviour under the norm, in the form of QuasiRiemannHypothesis §§5.4 and 5.4a; the transfer to these
characters is derived here from them and from the main theorems.

`meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois`: let `K ⊆ L` be
number fields with `L/ℚ` abelian, so that `L/K` is abelian, let `φ : Gal(L/K) →* ℂˣ`
and let `φ̃ = PrimitiveRayClassCharacter.of (φ.comp Φ_{L/K})` (Conventions). Then
`φ̃.character.GeneralizedRiemannHypothesis`. This gives GRH(`φ̃`) of AnalyticNumberTheoryPartI §2.42,
the strip form of the same hypothesis (RiemannHypothesisStatementsAndConsequences §9.5).

- *The norm-composed characters.* `K` is abelian over `ℚ`, being contained in `L`. As `L` and `φ`
  vary, the characters `φ̃` of `K` so obtained are exactly the primitive characters inducing the
  norm-composed characters `χ ∘ N_{K/ℚ}` of QuasiRiemannHypothesis §5.4, the
  ray-class characters `𝔞 ↦ χ(N_{K/ℚ} 𝔞)` of the modulus `m𝒪_K` times the real places, `χ` a
  Dirichlet character modulo `m`, `m ≥ 1` (QuasiRiemannHypothesis §5.4a).

Route: `K` is abelian over `ℚ`, and by QuasiRiemannHypothesis §5.4a
`φ̃ = PrimitiveRayClassCharacter.of (χ ∘ N_{K/ℚ})` for a Dirichlet character `χ` modulo some `m ≥ 1`;
by the presented-and-primitive clause of QuasiRiemannHypothesis §1.1 (at `σ = 1/2 ≥ 0`) it suffices
that `heckeLFunctionC (χ ∘ N_{K/ℚ})` be zero-free right of `1/2`. The base-change factorization of
QuasiRiemannHypothesis §5.4, `L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)` as germs at every point, `S`
the primes dividing `m d_K`, gives it. On the right each `L^S(s, χψ)` is the Dirichlet L-function of
`χψ`, zero-free right of `1/2` by GeneralizedRiemannHypothesisFromWindowBounds §5.1, times its Euler
factors `1 − χψ(p) p^{−s}` at the primes of `S`, analytic and nonzero on `Re s > 0`; so each factor,
and the finite product, is zero-free right of `1/2` (QuasiRiemannHypothesis §1.1, the clause on
products and on factors analytic and nonzero). On the left `L^S_K(s, χ ∘ N)` is
`heckeLFunctionC (χ ∘ N_{K/ℚ})` times its Euler factors at the primes of `S` not dividing `m`, again
analytic and nonzero on `Re s > 0`, and the germ clause of QuasiRiemannHypothesis §1.1 transfers the
zero-freeness. The conclusion is `φ̃.character.GeneralizedRiemannHypothesis` by
RiemannHypothesisStatementsAndConsequences §9.5.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1; QuasiRiemannHypothesis §§1.1, 5.4,
5.4a; RiemannHypothesisStatementsAndConsequences §9.5; for the definition of `φ̃` (Conventions),
ClassFieldTheory Layer 12, ZerosOfLFunctions §8.8 and RiemannHypothesisStatementsAndConsequences
§8.8; for the Checks also
GeneralizedRiemannHypothesisFromWindowBounds §5.2, RiemannHypothesisStatementsAndConsequences §11.1,
ClassFieldTheory C.6, Layers 12, 13, LFunctions Layer 5 (`PrimitiveRayClassCharacter.of_induced`)
and Tau Ceti `TauCeti.GlobalNumberFields.RayClassCharacter.induced`,
`TauCeti.GlobalNumberFields.RayClassGroup.hom_ext`.

**Checks.**

- `K = L = ℚ`: `Gal(L/K)` is trivial, `φ = 1` and `φ̃ = 1`, whose L-function is `dedekindZetaC ℚ`;
  the theorem is GeneralizedRiemannHypothesisFromWindowBounds §5.2, read through
  RiemannHypothesisStatementsAndConsequences §9.5's rational bullet.
- `K = ℚ`, `L ⊆ ℚ(ζ_q)` the field cut out by a primitive Dirichlet character `κ` modulo `q` (the
  fixed field of the kernel of `κ` on `Gal(ℚ(ζ_q)/ℚ) ≅ (ℤ/q)ˣ`), `φ` the character of `Gal(L/ℚ)`
  that `κ` induces: at a prime `p ∤ q`, `φ̃(p) = φ(Frob_p) = κ(p)`, the Frobenius of `p` acting by
  `ζ_q ↦ ζ_q^p` (ClassFieldTheory C.6). The modulus `(q)∞` is admissible for `ℚ(ζ_q)`, hence for
  `L`, so the conductor of `L` divides it (ClassFieldTheory Layers 12–13,
  `isAdmissibleModulus_iff_abelianConductor_dvd`). Induced to `(q)∞`, `φ.comp Φ_{L/ℚ}` and the
  character `(ratDirichletEquiv q _).symm κ` agree on the class of every prime `p ∤ q`, hence on
  the class of every integral ideal prime to `q`, a product of such primes, so the two are equal
  (`RayClassGroup.hom_ext`) and
  `PrimitiveRayClassCharacter.of_induced` makes `φ̃` the image of `κ` under
  *toPrimitiveRayClassCharacter* (RiemannHypothesisStatementsAndConsequences §11.1, by the
  definition of the equivalence); the theorem is GeneralizedRiemannHypothesisFromWindowBounds §5.1
  for `κ`, read through RiemannHypothesisStatementsAndConsequences §9.5's rational bullet.
- `K = ℚ(i)`, `L = ℚ(i, √−3)`, `φ` the nontrivial character of `Gal(L/K)`: `φ̃` is the character
  `(·/3) ∘ N` of modulus `(3)`, of order `2`, and the theorem applies.
- `K = ℚ(√−3)` and a ray-class character of order `3` whose class field is not abelian over `ℚ`
  (a cubic residue character): it is not of the form `φ̃` for an `L` abelian over `ℚ`, and no target
  here gives its Riemann hypothesis.

### 0.4 Norm-composed characters (QuasiRiemannHypothesis §5.4)

*Origin:* published: Heilbronn (1967), the zeta function of an abelian extension as a product of
L-functions of characters, in the form of the base-change factorization of QuasiRiemannHypothesis
§5.4; the transfer to these characters is derived here from them and from the main theorems.

For every number field `K` abelian over `ℚ` and every
Dirichlet character `χ`, `heckeLFunctionC (χ ∘ N_{K/ℚ})` is zero-free right of `1/2`, where
`χ ∘ N_{K/ℚ}` is the norm-composed character of QuasiRiemannHypothesis §5.4.

Route: the factorization step of the route of 0.3, which proves this for every `χ`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1 (through 0.3); 0.3;
QuasiRiemannHypothesis §5.4.

### 0.5 First consequences (RiemannHypothesisStatementsAndConsequences §§9.3, 9.6)

*Origin:* published: the absence of an exceptional zero under a zero-free half-plane and the
hypothesis for the records (RiemannHypothesisStatementsAndConsequences §§9.3, 9.6), with its
hypothesis supplied by the main theorems; the square-root bound for the Riesz remainder (§9.6(c)) is
adapted from Ingham (1932), as GeneralizedRiemannHypothesisFromWindowBounds §3.2 says of its form for
families.

Let `ψ` be the character of `ℚ` attached to a primitive Dirichlet character, or the trivial
character or a character `φ̃` of 0.3 of a field `K` abelian over `ℚ`.

- (a) no real `β` satisfies *IsExceptionalZero* `ψ β` (ZerosOfLFunctions
  §6.3); at `ℚ` the exceptional branch of `dirichletLFunction_zeroFreeRegion` occurs for no
  Dirichlet character, primitive or not.
- (b) there is `C_ψ` with `‖rieszRemainder ψ y‖ ≤ C_ψ √y` for every
  `y ≥ 2`, and the same for `PrimitiveDirichletCharacter.rieszRemainder`.
- (c) `(dedekindZetaData K).GeneralizedRiemannHypothesis` for every `K` abelian over `ℚ`;
  `(heckeData ψ).GeneralizedRiemannHypothesis` for every
  `ψ` above. With `riemannZetaData` and `dirichletData χ hχ` for primitive `χ` (0.1):
  `zeroCount d.completed univ R = 0` for each of these four records
  `d` and every bounded `R` disjoint from the line `Re s = 1/2`. The hypotheses of
  `dedekindZetaData K` and `heckeData ψ` are *GRH* of ZerosOfLFunctions Layer 9 for these records
  (every point of positive divisor of the completed function has real part `1/2`), by the divisor
  form of RiemannHypothesisStatementsAndConsequences §9.3.

Route: (a) is §9.6(a) at `σ = 1/2 < 3/4`, and (b) is §9.6(c) at `σ = 1/2`, their hypothesis given by
GeneralizedRiemannHypothesisFromWindowBounds §5.1 (through RiemannHypothesisStatementsAndConsequences
§9.5's rational bullet), 0.2 and 0.3; (c) is 0.1 and RiemannHypothesisStatementsAndConsequences
§9.5's record clause with 0.2 and 0.3, and the zero count is the Check of
RiemannHypothesisStatementsAndConsequences §9.6.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1; 0.1, 0.2, 0.3; ZerosOfLFunctions §6.3 and
RiemannHypothesisStatementsAndConsequences §§9.3, 9.5, 9.6.

### 0.6 Bounded-height hypotheses (ExplicitZetaBounds §§0.2, 0.4; ExplicitPrimeCounting §1.2)

*Origin:* published: the Riemann hypothesis up to a height, as ExplicitZetaBounds §§0.2, 0.4 and
ExplicitPrimeCounting §1.2 take it from the recorded verifications, with its hypothesis supplied by
the main theorems at every height.

`RiemannHypothesisUpTo H` for every real `H`; `DirichletGRHUpTo q H` for every `q ≥ 1` and every
real `H`. Hence `GRH*(q, H)` of
ExplicitPrimeCounting §1.2 for every `q` and `H`, and the four recorded verifications of §0.4,
`RiemannHypothesisUpTo` at `545 439 823`, `10⁹`, `30 610 046 000` and `3 000 175 332 800`.

Route: §0.2's law `(∀ H, RH(H)) ↔ RiemannHypothesis` with GeneralizedRiemannHypothesisFromWindowBounds
§5.2; §0.2's implication from the hypothesis for every primitive character modulo `q` to
`DirichletGRHUpTo q H` with GeneralizedRiemannHypothesisFromWindowBounds §5.1; the passage to
imprimitive characters of ExplicitZetaBounds §0.2 for `GRH*`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2; ExplicitZetaBounds §§0.2, 0.4;
ExplicitPrimeCounting §1.2.

### 0.7 Platt's and Lu–Zaman–Zhao's records (ExplicitZetaBounds §§0.4b, 9.3)

*Origin:* published: the verifications of Platt (2016) and of Lu, Zaman and Zhao (2026) and the
lemma of Hoffstein (1980/81) (ExplicitZetaBounds §§0.4b, 9.3), with its hypothesis supplied by the
main theorems; the records are derived here as cases of the main theorems, and Hoffstein's lemma
then bounds `L(1, χ)` from below at every conductor.

`PlattRecord`. `LuZamanZhaoRecord`: for every `q ≤ 10¹⁰`, every
nonprincipal quadratic `χ` modulo `q` and every real `σ ≥ 1 − 1/(5 log q)`, `L(σ, χ) ≠ 0`.
`PlattCentralRecord` and the other records of §0.4b (values, ordinates, `L(1, χ)` tables) are not
given. Lu–Zaman–Zhao's lower bound `L(1, χ) ≥ 1/(8 log q)` holds
for every primitive quadratic `χ ≠ 1` modulo `q`, of every conductor `q`, given
`LuZamanZhaoLOneRecord` alone (ExplicitZetaBounds §9.3 states it for `q ≤ 10¹⁰`, given also
`LuZamanZhaoRecord`).

Route: `PlattRecord` is `DirichletGRHUpTo q (plattHeight q)` for every `2 ≤ q ≤ 400 000`
(ExplicitZetaBounds §§0.3, 0.4b), an instance of 0.6. `LuZamanZhaoRecord` asks `L(σ, χ) ≠ 0` for
every quadratic character `χ`, nonprincipal by the convention of ExplicitZetaBounds, of modulus
`q ≤ 10¹⁰` and every real `σ ≥ 1 − 1/(5 log q)` (§0.4b): such a character has modulus `q ≥ 3`,
where `1 − 1/(5 log q) ≥ 1 − 1/(5 log 3) = 0.8180 > 1/2`, and the value form of
GeneralizedRiemannHypothesisFromWindowBounds §5.3 applies. For the lower bound:
`LuZamanZhaoLOneRecord` is the range `q ≤ 10⁶`; above it, Hoffstein's lemma of §9.3 (for `χ` real
primitive of conductor `q > 10⁶` with `L(σ, χ) ≠ 0` for every real `σ > 1 − 1/(11.657 log q)`,
`L(1, χ) > 1.507/(11.657 log q)`) has its hypothesis by GeneralizedRiemannHypothesisFromWindowBounds
§5.3, since `χ ≠ 1` and `1 − 1/(11.657 log q) > 1/2`, and `1.507/11.657 = 0.12928 > 1/8`. The cap
`q ≤ 10¹⁰` of §9.3 comes only from `LuZamanZhaoRecord`, which gives Hoffstein's hypothesis there.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.3; 0.6; ExplicitZetaBounds §§0.3, 0.4b, 9.3
(with Hoffstein's lemma).

**Checks.**

- The record concerns nonprincipal characters: for a principal `χ` at `σ = 1` its condition would
  read Mathlib's value of `χ.LFunction` at its pole, which no theorem here addresses.

### 0.8 The mod-eight zero clause (AnalyticNumberTheoryPartI §0.16; ErdosProgressionPowers §0.9)

*Origin:* published: the theorems of AnalyticNumberTheoryPartI §0.16 and ErdosProgressionPowers
§0.9 that assume `ModEightFiniteInput`, a verification of the zeros of the L-functions modulo `8` up
to a height, with its hypothesis supplied by the main theorems.

Every zero of `L(s, χ)` with `0 < Re s < 1` and `|Im s| ≤ 10000`, for every
Dirichlet character `χ` modulo `8`, has `Re s = 1/2`; this is the zero clause of
`ModEightFiniteInput`. Hence `thetaAP_eight_interval_ge` holds under the theta clause of
`ModEightFiniteInput` alone. ErdosProgressionPowers §0.9 carries its own copy of
`ModEightFiniteInput`, with the same two clauses; with its zero clause supplied, the following
hold with `ModEightFiniteInput` replaced by its theta clause, their other hypotheses remaining:
the Case-I projection of its §2.3, one of the
primitive characters of the squareclasses of `λ`, `−λ`, `2λ`, `−2λ` has absolute prime-weighted
sum over `(k/2, k]` at least `(1 − 3·0.002811) k/8` and odd conductor `≠ 1`, and the Case-II
projection of its §2.6, the same for the
squareclasses of `ω t v`, `ω ∈ {±1, ±2}`, where `λ = 2t²` and `1 − λ = 2v²` as in its §2.4, with
odd conductor dividing its deletion level `M_a` and `≠ 1`, through which the input enters; and its
headline theorems `character_family`, `effective_prime_bound` and `fixed_length_finiteness`, the
three that carry it.

Route: the zero clause is the strip form of GeneralizedRiemannHypothesisFromWindowBounds §5.3
(`re_eq_half_of_LFunction_eq_zero`) at each of the four Dirichlet characters modulo `8`, imprimitive
ones included; it holds at every height, so in particular for `|Im s| ≤ 10000`.
ErdosProgressionPowers §0.9 defines its copy by the statement of AnalyticNumberTheoryPartI §0.16.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.3; AnalyticNumberTheoryPartI §0.16;
ErdosProgressionPowers §§0.9, 2.3, 2.6.

### Examples

For `K = ℚ(i)`, `ζ_K = ζ · L(·, χ₋₄)`, and 0.2 is GeneralizedRiemannHypothesisFromWindowBounds §5.2
together with GeneralizedRiemannHypothesisFromWindowBounds §5.1 at `χ₋₄`. For `K = ℚ(i)`,
`L = ℚ(i, √−3)` and the nontrivial character `φ` of `Gal(L/K)`, `φ̃` is `(·/3) ∘ N`, of modulus
`(3)` (0.3). For a principal character at `σ = 1` the condition of `LuZamanZhaoRecord` would read
Mathlib's value at the pole, which is why that record concerns nonprincipal characters only (0.7).

### Dependencies

GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3; RiemannHypothesisStatementsAndConsequences
§§8.4a, 8.8, 9.3–9.6, 10.3, 11.1; AnalyticNumberTheoryPartI §§0.16, 1.6, 2.18a, 2.42;
ZerosOfLFunctions §§6.3, 6.4a, 8.8, 9.1 and Layer 9; QuasiRiemannHypothesis §§1.1, 5.4, 5.4a;
ClassFieldTheory C.6, Layers 12 and 13; LFunctions Layers 4 and 5; ExplicitZetaBounds §§0.2–0.4b,
9.3; ExplicitPrimeCounting §1.2; ErdosProgressionPowers §§0.9, 2.3, 2.6; Tau Ceti's ray-class
characters and their induction.

## Layer 1: growth, argument and zeros of `ζ` and of L-functions

### 1.1 Growth on vertical lines (RiemannHypothesisStatementsAndConsequences §9.7)

*Origin:* published: the bounds of Littlewood (1928) and of Lindelöf under the Riemann hypothesis
(RiemannHypothesisStatementsAndConsequences §9.7), with its hypothesis supplied by the main
theorems.

- (i) For every `δ > 0` and `ε > 0` there is `C` with
  `‖ζ(σ + it)‖ ≤ C |t|^ε` and `‖ζ(σ + it)‖⁻¹ ≤ C |t|^ε` for
  `σ ≥ 1/2 + δ` and `|t| ≥ 2`; and, for every L-function `L` of 0.5, with `𝔮` its analytic
  conductor and `C` depending only on the degree, `δ` and `ε`,
  `‖L(σ + it)‖ ≤ C 𝔮(σ + it)^ε` and
  `‖L(σ + it)‖⁻¹ ≤ C 𝔮(σ + it)^ε` on `σ ≥ 1/2 + δ` at every height that §9.7 calls admissible
  (every `t` for an entire `L`, `|t| ≥ 2` for a Dedekind zeta function).
- (ii) `log |ζ(1/2 + it)| ≤ C log |t|/log log |t|` for
  `|t| ≥ 16`; Lindelöf's bound: for every `ε > 0`,
  `‖ζ(σ + it)‖ ≤ C_ε |t|^ε` for `σ ≥ 1/2` and `|t| ≥ 2`;
  for a primitive `χ ≠ 1` modulo `q`, with an
  absolute `C`, `log |L(1/2 + it, χ)| ≤ C log(q(|t| + 3))/log log(q(|t| + 3))`; and Littlewood's
  bounds: for `q ≥ 3`,
  `(C log log q)⁻¹ ≤ |L(1, χ)| ≤ C log log q` and `|L′/L(1, χ)| ≤ C log log q`. The bounds
  (a)–(d) of §9.7(ii) at `σ₀ = 1/2` hold for the L-functions of 0.5, (c) being Lindelöf's
  bound.

Route: §9.7 at `σ₀ = 1/2`, with its hypothesis given by GeneralizedRiemannHypothesisFromWindowBounds
§5.2 and §5.1 (through RiemannHypothesisStatementsAndConsequences §9.5's rational bullet), 0.2 and
0.3.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2; 0.2, 0.3;
RiemannHypothesisStatementsAndConsequences §§9.5, 9.7.

### 1.2 The argument on the critical line (RiemannHypothesisStatementsAndConsequences §9.8)

*Origin:* published: the bounds for the argument under the Riemann hypothesis
(RiemannHypothesisStatementsAndConsequences §9.8), with its hypothesis supplied by the main
theorems.

There is `C` with `|S(T)| ≤ C log T/log log T` for every `T ≥ 16`
that is not an ordinate; and §9.8(ii) at `σ₀ = 1/2`, the
bound `C log 𝔮/log log 𝔮` for the variation of the argument along `[2 + it, 1/2 + it]`, holds for
every L-function of 0.5, with its conditions (`𝔮 ≥ 16`, `L(1/2 + it) ≠ 0`, `t` admissible).

Route: §9.8(i) with GeneralizedRiemannHypothesisFromWindowBounds §5.2; §9.8(ii) at `σ₀ = 1/2` with
GeneralizedRiemannHypothesisFromWindowBounds §5.1 (through RiemannHypothesisStatementsAndConsequences
§9.5's rational bullet), 0.2, 0.3.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2; 0.2, 0.3;
RiemannHypothesisStatementsAndConsequences §9.8.

### 1.3 The zero count of `ζ` (ExplicitZetaBounds §2.9)

*Origin:* published: the relation `N(T) = ϑ(T)/π + 1 + S(T)` of ExplicitZetaBounds §2.9 with the
bound for `S(T)` under the Riemann hypothesis of RiemannHypothesisStatementsAndConsequences §9.8,
with its hypothesis supplied by the main theorems; the bound is derived here through 1.2.

There is `C` with
`|N(T) − (T/2π) log(T/(2πe)) − 7/8| ≤ C log T/log log T` for every `T ≥ 16`.

Route: by ExplicitZetaBounds §2.9, `N(T) = ϑ(T)/π + 1 + S(T)` for `T > 0` not an ordinate, at an
ordinate `N(T) − ϑ(T)/π − 1` is the limit of `S` from the right, and
`7/8 < ϑ(T)/π + 1 − (T/2π) log(T/(2πe)) < 7/8 + 1/(40T)` for `T ≥ e`. 1.2 bounds `|S(T)|` by
`C log T/log log T` off the ordinates; the ordinates are discrete and `log T/log log T` is
continuous on `T ≥ 16`, so the limit from the right obeys the same bound. The statement follows
with the constant `C + 1`, since `1/(40T) < log T/log log T` for `T ≥ 16`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2 (through 1.2); 1.2; ExplicitZetaBounds
§2.9.

### 1.4 Zero-free regions, zero densities and `1/ζ` near the line one (ExplicitZetaBounds §§7.2–7.6, 7.10, 8.1, 8.3–8.5)

*Origin:* published: the explicit zero-free regions and zero-density bounds of Ford (2002), Kadiri
(2002, 2005, 2013, 2018), McCurley (1984) and the others that ExplicitZetaBounds §§7.2–7.6, 8.1
and 8.3–8.5 state, and the bounds for `1/ζ` near the line one of its §7.10, with its hypothesis
supplied by the main theorems; the regions and densities are immediate from the main theorems.

- (a) With no hypothesis: Ford's regions of §7.2, that is the exact
  region for `t ≥ 5.45·10⁸`, with `log 3` or with `log 0.618` in `J`,
  the narrower region, for `t ≥ 1.88·10¹⁴` with `log 3` and
  for `|t| ≥ 3` with `log 0.618` and the classical form
  `σ ≥ 1 − 1/(8.464 log |t|)` for `|t| ≥ 3`; `riemannZeta_ne_zero_classical` (§7.3) and the
  instances of the classical region stated in §7.3, each a case of the first statement of (d);
  `riemannZeta_ne_zero_littlewood` (§7.4);
  `LFunction_zeroFree_mcCurley` and `LFunction_ne_zero_kadiri` (§7.5), and the regions stated there
  of Kadiri's thesis, of Thorner–Zaman's Theorem 2.6
  and of Lu–Zaman–Zhao's Corollary 1.2; and `riemannZeta_ne_zero_vinogradovKorobov` (§7.6).
- (b) With no hypothesis: `zetaZeroCountRight_le_kadiri` (§8.1); the two bounds of §8.3,
  the form with `log(1 + C₁ …)` and
  the power form, at every verification height `H₀` and
  at every choice of the parameters of §8.3 with `σ ≤ 1`, where `C₁ > 0` and `C₂ > 0` (Checks), and
  their instance `zetaZeroDensityCount_nine_tenths_lt`; `primitiveLZeroCount_le_thornerZaman`
  (§8.4); and `zetaZeroDensityCount_le_bellotti` (§8.5).
- (c) The four statements of §7.10 with their bounded-height hypotheses removed, their other
  records remaining: `inv_norm_riemannZeta_one_add_le` without `RiemannHypothesisUpTo 30610046000`,
  given `BrentPlattTrudgianRecord`, `HiaryRecord`, `PatelRecord`, `YangRecord` and
  `HiaryLeongYangRecord`; and, without `RiemannHypothesisUpTo 3000175332800`, Leong's three
  bounds, each given `BrentPlattTrudgianRecord` and *LeongRecord*:
  `1/|ζ(1 + it)| ≤ 29.388 log t` for `t ≥ 2`,
  `1/|ζ(σ + it)| ≤ 30.812 log t` for `σ ≥ 1`, `t ≥ 13` and
  `7.59·10³¹ log t` on `σ ≥ 1 − 1/(5.56 log t)`,
  `t ≥ 13`; Lee–Leong's bound
  (`1237 (log t)^{11/12}` on `σ ≥ 1 − 1/(5.56 log t)`, `t ≥ 3 000 175 332 800`), given
  `BrentPlattTrudgianRecord`; and Lee–Leong's bound below that height
  (`29.388 t^{4.964} log t` on `σ ≥ 3/4`, `14 ≤ t ≤ 3 000 175 332 800 − 1/2`), given
  `BrentPlattTrudgianRecord` and *LeongRecord*.
- (d) Regions and densities at their parameters.
  `ClassicalZeroFreeRegion R t₀` (§7.3a) for all reals
  `R > 0` and `t₀ > e^{2/R}`; so the classical-shape region (`|t| ≥ 2`,
  `σ ≥ 1 − 1/(R log |t|)`) holds when `R log 2 > 2`, and the region of
  ExplicitPrimeCounting §3.1(a) (`|t| ≥ 2π`) when `R log 2π > 2` (and, with the absence of zeros
  up to height `14`, when `R log 14 > 2`: 2.4(a)).
  `ζ` has no zero with `|t| ≥ 21` and
  `σ ≥ 1 − 1/(R log(|t|/17))` when `R log(21/17) > 2`, that is `R > 9.4648…`.
  The region hypothesis of ExplicitPrimeCounting §3.1(d) holds for real `H` and `ν : ℝ → ℝ` with
  `ν(t) < 1/2` for every `t ≥ H`: `ζ` has no zero with `|γ| ≥ H` and `β ≥ 1 − ν(|γ|)`.
  `N(σ, T) = 0` for `σ > 1/2` and
  `N°(σ, T) = 0` for `σ ≥ 1/2`, at every `T`; so every bound `N(σ, T) ≤ B(T)` with `σ > 1/2`, or
  `N°(σ, T) ≤ B(T)` with `σ ≥ 1/2`, holds at every `T` with `B(T) ≥ 0`; and
  *ZetaZeroDensityBound* `T₀ S c₁ c₂ p q` (§8.3a) holds whenever
  `T₀ ≥ 1`, `S ⊆ [1/2, ∞)` and `c₁ ≥ 0`, `c₂ ≥ 0` on `S`.

Route: (a) every region named lies in `Re s > 1/2`: the least real part of its boundary is
`1 − 1/(5.558691 log 2) ≈ 0.74` for `riemannZeta_ne_zero_classical`, `0.89246` for Ford's region at
`|t| = 3` (his other forms have width `1 − σ` below `0.06`), above `0.98` for §7.4, above `0.96` for
§7.6 and above `0.71` for the regions of §7.5, and the instances of §7.3 are stated at heights
where their boundaries lie right of `1/2`; so GeneralizedRiemannHypothesisFromWindowBounds §5.3 (and
its §5.1 for every character modulo `q`, the principal ones through `ζ`, read through orders) leaves
no zero there, and the clauses on an exceptional zero are vacuous. (b) every count is of zeros with
real part above `17/20`, `9/10`, `1/2 + d/log H₀`, `39/40` or `0.9927`, hence `0` by (d), while each
right side is nonnegative: for §8.1 and §8.4–8.5 at the stated constants (for §8.4 the factor
`min(1, (1 − β₁(Q)) log Q)` is nonnegative since `β₁(Q) ≤ 1`), and for §8.3 because `C₁ > 0`,
`C₂ > 0` for `σ ≤ 1`, `d > 0` and `T > H`, so that `log(1 + C₁ …/(T − H)) > 0`. (c) 0.6. (d) at those
parameters the region lies in `Re s > 1/2`: `t₀ > e^{2/R} > 1` gives `R log |t| ≥ R log t₀ > 2` for
`|t| ≥ t₀`, `R log(|t|/17) ≥ R log(21/17) > 2` and `1 − ν > 1/2`; `ζ` has no zero on `Re s ≥ 1`
(Mathlib `riemannZeta_ne_zero_of_one_le_re`), its trivial zeros are real, below the heights
`t₀ > 1`, `21`, and have `Re s < 0 < 1 − ν`, and GeneralizedRiemannHypothesisFromWindowBounds §5.3
leaves none in `1/2 < Re s < 1`; the counts are of zeros with `β > 1/2`, of which
GeneralizedRiemannHypothesisFromWindowBounds §5.3 leaves none. At `R log t₀ ≤ 2`, `t₀ > 1`, the
region of the first item meets the line `Re s = 1/2`, and the absence of a zero there is a record
(ExplicitZetaBounds §0.4's `ZetaZeroFreeUpTo`), not a consequence of
GeneralizedRiemannHypothesisFromWindowBounds §5.3.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.3; 0.6; ExplicitZetaBounds §§7.2–7.6,
7.3a, 7.10, 8.1, 8.3, 8.3a, 8.4, 8.5; ExplicitPrimeCounting §3.1(d) (its region hypothesis); Mathlib
`riemannZeta_ne_zero_of_one_le_re`.

**Checks.**

- The sign of `t₀` (negative control): with Mathlib's `Real.log`, `R log t₀ > 2` alone admits
  `t₀ < 0`; at `R = 0.7`, `t₀ = −20` it reads `0.7 log 20 = 2.097 > 2`, the predicate then speaks
  of every zero, and at `1/2 + 14.1347…i` its boundary is `1 − 1/(0.7 · log 14.1347) = 0.4606`, so
  *ClassicalZeroFreeRegion* `0.7 (−20)` is false under GeneralizedRiemannHypothesisFromWindowBounds
  §5.3. The condition `t₀ > e^{2/R}` (`e^{2/0.7} = 17.4`) excludes it.
- The closed forms of §8.3 (the source's (4.72)–(4.73)): `C₁` is a product of positive factors,
  and `C₂ = C₇(η, H)(μ − σ + d/log H₀) + C₈(k, μ)` with `C₇ > 0`, `C₈ > 0` and `μ > 1`, so `C₂ > 0`
  for every `σ ≤ 1`. At the parameters of the source's Table 1 (`H₀ = 3.0610046·10¹⁰`,
  `H = H₀ − 1`, `η = 0.25618`, `k = 1`, `μ = 1.245`): `C₇ = 17.7457` and `C₈ = 0.3181`, and at
  `σ = 9/10`, `d = 0.334`, `C₂ = 6.686` and `C₂/(2πd) = 3.186`, the constant of
  `zetaZeroDensityCount_nine_tenths_lt`, with `C₁ = 2πd · 11.499 = 24.13`. There `C₂` vanishes at
  `σ = 1.2768` and is `−12.83` at `σ = 2` (negative control): beyond `σ ≈ 1.28` the right side of
  §8.3 is no longer nonnegative by its shape, while `N°(σ, T) = 0`; the source's theorem is for
  `σ ≤ 1`.

### 1.5 The numerical Landau–Siegel gap (ExplicitZetaBounds §7.9)

*Origin:* published: the numerical Landau–Siegel gap *HasLandauSiegelGap* of ExplicitZetaBounds
§7.9, with its hypothesis supplied by the main theorems; the gap `(log 3)/2` is derived here: under
the main theorems a real zero of a real character can only be at `1/2`.

*HasLandauSiegelGap* `c ∞` for every `c ≤ (log 3)/2`; in particular its
instances `(1/5) 10¹⁰` and `(3.0·10⁻³) ∞` hold without `LuZamanZhaoRecord`.
This makes the constant of AnalyticNumberTheoryPartI §0.34 (`landau_siegel_exclusion`) explicit:
`c_LS = (log 3)/2`. *HasLandauSiegelGap* is *RealZeroGap* of ExplicitPrimeCounting §1.7, so the
premise *RealZeroGap* `c ∞` of its §6.7(a) holds with `c = (log 3)/2 > 1/6.50 > 1/9.645908801`, for
the regions of Kadiri and of McCurley (3.2 shows directly that no modulus is exceptional for
either).

Route: let `χ` be a primitive real nonprincipal character of conductor `q ≥ 3`. By the strip form
of GeneralizedRiemannHypothesisFromWindowBounds §5.3 a real zero `β ∈ (0, 1)` of `L(s, χ)` is `1/2`,
so `(1 − β) log q = (log q)/2 ≥ (log 3)/2`: this is *HasLandauSiegelGap* `((log 3)/2) ∞` as
ExplicitZetaBounds §7.9 defines it, and §7.9's antitonicity in both arguments gives the rest.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.3; ExplicitZetaBounds §7.9.

**Checks.**

- GeneralizedRiemannHypothesisFromWindowBounds §5.1 gives no `c > (log 3)/2`: it allows a real zero
  at `1/2` of the character of conductor `3`, which *HasLandauSiegelGap* `c ∞` with such `c`
  excludes. Excluding central zeros needs a further input, such as `PlattCentralRecord`, which the
  Riemann hypothesis does not give.

### 1.6 Li and Weil positivity (WeilPositivityAndLiCriterion §§3.2, 4.2, 5.2)

*Origin:* published: the criterion of Li (1997) and the positivity criterion of Weil (1952) in the
direction from the Riemann hypothesis (WeilPositivityAndLiCriterion §§3.2, 4.2, 5.2), with its
hypothesis supplied by the main theorems; the strict positivity of the Weil form is proved here by
counting zeros.

`0 < liCoeff n` for every `n ≥ 1`; every Li Gram matrix of
§4.2 is positive definite; `0 < Re (weilForm g g)` for every nonzero test function
`g` of §5.2.

Route: GeneralizedRiemannHypothesisFromWindowBounds §5.2 in `liCoeff_pos_of_riemannHypothesis` and
`liGramMatrix_posDef_of_riemannHypothesis`. The positivity of the Weil form is proved here. By
GeneralizedRiemannHypothesisFromWindowBounds §5.2 every `ρ` with `zetaZeroMult ρ ≠ 0` has
`Re ρ = 1/2` (WeilPositivityAndLiCriterion §1.1, the bridge), so `1 − conj ρ = ρ` and the summable
family of §5.1 has the terms `zetaZeroMult ρ |ĝ(ρ)|² ≥ 0`; `Re (weilForm g g)` is at least each of
them, and it suffices to find one zero `ρ` with `ĝ(ρ) ≠ 0`. Let `g ≠ 0` vanish off
`[a, b] ⊂ (0, ∞)` and `A = max(|log a|, |log b|)`.

- `ĝ` is entire, `|ĝ(s)| ≤ ‖g‖₁ e^{A(|s| + 1)}`, and `ĝ` is not identically `0`: its values
  `ĝ(n + 1) = ∫ tⁿ g(t) dt`, `n ∈ ℕ`, cannot all vanish, since then `∫ p g = 0` for every
  polynomial `p`, and polynomials approximating `conj g` uniformly on `[a, b]` (Mathlib
  `polynomialFunctions_closure_eq_top`, for the real and imaginary parts) give `∫ |g|² = 0`.
- Fix `s₀` with `ĝ(s₀) ≠ 0`. Jensen's inequality (Mathlib `AnalyticOnNhd.sum_divisor_le`, on the
  discs about `s₀` of radii `R` and `eR`) bounds the number of zeros of `ĝ` in `|s − s₀| ≤ R`,
  counted with multiplicity, by `A(eR + |s₀| + 1) + C₀`, `C₀` independent of `R`: it is `O(R)`.
- The multiplicities of the zeros of `ζ` are small. Let `ρ = 1/2 + iγ` be a zero with `γ ≥ 17`; by
  GeneralizedRiemannHypothesisFromWindowBounds §5.2 it is the only zero of ordinate `γ`, so for
  `0 < η < 1` its multiplicity is at most `N(γ) − N(γ − η)`. 1.3 at `γ` and at `γ − η` bounds this
  by the increase of `(T/2π) log(T/(2πe))` over `[γ − η, γ]` plus `2C log γ/log log γ`,
  `log T/log log T` being increasing on `T ≥ 16`; as `η → 0`,
  `zetaZeroMult ρ ≤ 2C log γ/log log γ`.
- So the zeros with `17 < γ ≤ T`, counted without multiplicity, number at least
  `(N(T) − N(17)) log log T/(2C log T)`, which by 1.3 is at least `c T log log T` for large `T`,
  with some `c > 0`. They lie in the disc `|s − s₀| ≤ T + |s₀| + 1`. If `ĝ` vanished at all of them
  it would have at least `c T log log T` zeros there, against the bound `O(T)` of the second item.
  So `ĝ(ρ) ≠ 0` at some zero `ρ`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; 1.3; WeilPositivityAndLiCriterion §§1.1,
3.2, 4.2, 5.1, 5.2; Mathlib `polynomialFunctions_closure_eq_top`, `AnalyticOnNhd.sum_divisor_le`.

**Checks.**

- The multiplicity bound is what the count needs, since `ĝ` vanishes at a zero of every
  multiplicity as soon as it vanishes there once: the points `1/2 ± in`, `n ≥ 1`, taken with
  multiplicity `⌊log(n + 1)⌋`, number `≍ R log R` with multiplicity in the disc of radius `R`
  about `1/2`, and all of them are zeros of `sinh(π(s − 1/2))`, an entire function with
  `|f(s)| ≤ e^{π|s − 1/2|}`, which has `O(R)` zeros there. The comparison of a count with
  multiplicity against the `O(R)` zeros of an entire function of exponential type therefore proves
  nothing; counted without multiplicity those points number `≍ R`, and so do the zeros.

### Examples

With Mathlib's `Real.log`, *ClassicalZeroFreeRegion* `0.7 (−20)` speaks of every zero and is false
under GeneralizedRiemannHypothesisFromWindowBounds §5.3, its boundary at `1/2 + 14.1347…i` being
`0.4606`; the range `t₀ > e^{2/R}` of 1.4(d) excludes it. The main theorems allow a real zero at
`1/2` of the character of conductor `3`, so they give no Landau–Siegel gap above `(log 3)/2` (1.5).
The points `1/2 ± in` with
multiplicity `⌊log(n + 1)⌋` are zeros of `sinh(π(s − 1/2))`, which is why 1.6 counts the zeros of
`ζ` without multiplicity.

### Dependencies

GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3; 0.2, 0.3, 0.5, 0.6;
RiemannHypothesisStatementsAndConsequences §§9.5, 9.7, 9.8; ExplicitZetaBounds §§0.4, 2.9, 7.2–7.6,
7.3a, 7.9, 7.10, 8.1, 8.3, 8.3a, 8.4, 8.5; ExplicitPrimeCounting §§1.7, 3.1, 6.7;
AnalyticNumberTheoryPartI §0.34; WeilPositivityAndLiCriterion; Mathlib's
`riemannZeta_ne_zero_of_one_le_re`, Weierstrass approximation and Jensen's inequality.

## Layer 2: prime counts, Mertens sums and short intervals

### 2.1 Prime counts (RiemannHypothesisStatementsAndConsequences §9.9)

*Origin:* published: von Koch's theorem and its analogues for progressions, abelian fields and
Frobenius classes under a zero-free half-plane (RiemannHypothesisStatementsAndConsequences §9.9),
with its hypothesis supplied by the main theorems.

- `ψ(x) − x = O(√x log² x)`; `θ(x) − x = O(√x log² x)`; and `π(x) − Li x = O(√x log x)` (von Koch).
  The first strengthens AnalyticNumberTheoryPartI §1.9(i) (`psi_sub_self_isBigO_of_riemannHypothesis`,
  `ψ(x) − x = O_ε(x^{1/2+ε})` under `RiemannHypothesis`), whose conclusion therefore holds with no
  hypothesis.
- For every `q ≥ 1`, the primes in a reduced class modulo
  `q` number `Li x/φ(q) + O_q(√x log x)`.
- For `K` abelian over `ℚ`: `ψ_K(x) = x + O_K(√x log² x)`, and `π_K(x) = Li x + O_K(√x log x)`.
- For `L/K` with `L/ℚ` abelian and a reciprocity dictionary `Φ` at a modulus (ZerosOfLFunctions
  §8.8): `frobeniusPsi C x = (#C/#G) x + O(√x log² x)`,
  and `frobeniusPrimeCount C x = (#C/#G) Li x + O(√x log x)`. This sharpens ZerosOfLFunctions §8.8
  for these `L/K`, whose *exceptionalChebotarevTerm* vanishes by 0.5(a).

Route: §9.9 at `σ = 1/2`: (i) with GeneralizedRiemannHypothesisFromWindowBounds §5.2 at `ℚ` and 0.2
for `K`; its rational case at `(q)∞` with GeneralizedRiemannHypothesisFromWindowBounds §5.1; (iii)
with 0.3, the primitive character of each `ψ ∘ Φ` being the `ψ̃` of 0.3, since it does not
depend on the dictionary (RiemannHypothesisStatementsAndConsequences §8.8,
*PrimitiveRayClassCharacter.of_comp_dictionary_eq*),
through §9.5's presented-versus-primitive clause.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2; 0.2, 0.3; ZerosOfLFunctions §8.8;
RiemannHypothesisStatementsAndConsequences §§8.8, 9.5, 9.9.

### 2.2 Bounds under the Riemann hypothesis (ExplicitPrimeCounting §2.2)

*Origin:* published: the explicit bounds of Schoenfeld (1976) for `ψ`, `θ` and `π` under the
Riemann hypothesis, and those of Lee and Nosal (2026) (ExplicitPrimeCounting §2.2), with its
hypothesis supplied by the main theorems.

- The bounds of `schoenfeld_of_riemannHypothesis`, each given `ButheVerified`,
  `Schoenfeld1976Range` and Rosser's zero count (for `x > 10¹⁹` the route bounds the sum over the
  zeros by the explicit partial sums of `∑ 1/γ` of ExplicitPrimeCounting §2.1, which take the zero
  count from `T = 2` and the absence of zeros below height `2`), with
  `A(x) = √x log² x/(8π)`: `|ψ(x) − x| < A(x)` for `x > 73.2`; `ψ(x) − x > −A(x)` for
  `x > 59`; `|θ(x) − x| < A(x)` for `x > 599`;
  `θ(x) − x < A(x)` for `x > 0`; `|ψ(x) − x|`, `|θ(x) − x| < (1/8π) √x (log x − 2) log x` for
  `x > 23·10⁸`; `|π(x) − li x| < √x log x/(8π)` for
  `x > 2657`; and `π(x) − li x < √x log x/(8π)` for
  `x > 3/2`.
- Lee–Nosal's bounds, each given `ButheVerified`, `LeeNosalRange`, `ZetaZeroReciprocalSum`,
  `ZetaZeroCountLowRange`, `HiaryRecord`, `PatelRecord` and `YangRecord`:
  `|ψ(x) − x| ≤ √x log x (log x − log log x)/(8π)` for `x ≥ 101` and
  Lee–Nosal's Theorem 1.1, for `x ≥ 11`; and
  the `θ` bound of `leeNosal_theta_of_riemannHypothesis` for
  `x ≥ 2657`, given the same and *PsiThetaUpper*. Their route takes the zero count below `10⁹`
  from `ZetaZeroCountLowRange`, and above it from Rosser's bound, which ExplicitZetaBounds §5.2
  states there with no record, and from Bellotti–Wong's, given the three records of the list; so
  Rosser's zero count is not among their hypotheses.

Route: GeneralizedRiemannHypothesisFromWindowBounds §5.2.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; ExplicitPrimeCounting §2.2;
ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero count).

### 2.3 Bounds from verified heights (ExplicitPrimeCounting §§2.3, 2.6)

*Origin:* published: the bounds of Büthe (2016) and of Johnston (2022) from the Riemann hypothesis
verified up to a height, and the general theorem of ExplicitPrimeCounting §2.6
(ExplicitPrimeCounting §§2.3, 2.6), with its hypothesis supplied by the main theorems at every
height.

Write *JohnstonInitialRanges* for the proposition that `|ψ(x) − x| < √x log² x` for `3 ≤ x ≤ 59`,
`|θ(x) − x| < √x log² x` for `3 ≤ x ≤ 599`, `|π*(x) − li x| < √x log x` for `2 ≤ x < 97`, and
`|π(x) − li x| < √x log x` for `2 ≤ x ≤ 2657`: the four inequalities of Johnston's Theorem 4.1 at
the constant `a = 1` on the ranges below those of the four bounds of §2.3, a finite record
(Checks).

- The four bounds of §2.3 hold for every `x` in their ranges, each given `ButheVerified`,
  `Buthe2016Range` and Rosser's zero count, through which the route of §2.3 counts the zeros for
  `x ≥ 10¹⁹` (`buthe_of_riemannHypothesisUpTo` and `johnston_of_riemannHypothesisUpTo` give
  the same four): `|ψ(x) − x| ≤ √x log² x/(8π)` for `x > 59`,
  `|θ(x) − x| ≤ √x log² x/(8π)` for `x > 599`,
  `|π*(x) − li x| ≤ √x log x/(8π)` for `x ≥ 97` and
  `|π(x) − li x| ≤ √x log x/(8π)` for `x > 2657`.
- Büthe's general theorem of §2.3 without `RH(c/ε)`, at all its
  parameters; and its table rows (*Buthe2016Table1*,
  *Buthe2016Table2*), each given its table proposition, without the height `RH(T)` of the row.
- Johnston's Theorem 4.1 for every real `a ≥ 1`, in particular at every row `(a, K)` of
  *JohnstonTable* (`a = 1, 10, …, 10⁷`), and every `x` in its ranges, each given `ButheVerified`,
  `Buthe2016Range` and Rosser's zero count, the hypotheses of the four bounds above, and
  *JohnstonInitialRanges*, through which the route covers the ranges below those of the four
  bounds, and without the table proposition:
  `|ψ(x) − x| < a √x log² x`, `x ≥ 3`,
  `|θ(x) − x| < a √x log² x`, `x ≥ 3`,
  `|π*(x) − li x| < a √x log x`, `x ≥ 2` and
  `|π(x) − li x| < a √x log x`, `x ≥ 2`.
- The general theorem of §2.6 at every `T ≥ 10⁷` without `RH(T)`, given `ZetaZeroCountLowRange`,
  through which its route bounds the zero count below `10⁹`: its
  bound for `ψ` and its bound for
  `∑_{n ≤ x} Λ(n)/n − log x + γ`; and its instance
  `|ψ(x) − x| ≤ (π/(3·10¹²)) x + 113.67 √x` for `x ≥ 1`, given `ZetaZeroCountLowRange` and
  `ButheVerified`, which its route uses on `11 < x ≤ 10¹⁹`.

Route: 0.6 gives `RiemannHypothesisUpTo T` for every `T`, so Büthe's criterion
`4.92 √(x/log x) ≤ T`, Johnston's criteria and the heights of the rows are met at every `x`. For
Johnston's statements: on the ranges of the four bounds above (`x > 59`, `x > 599`, `x ≥ 97`,
`x > 2657`) those bounds, since `√x log² x` and `√x log x` are positive there and
`1/(8π) < 1 ≤ a`; below them *JohnstonInitialRanges*, since `1 ≤ a`. So the iteration that
*JohnstonTable* asserts beyond the range of the four bounds at a fixed height is not used.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2 (through 0.6); 0.6; ExplicitPrimeCounting
§§1.3, 2.3, 2.6; ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero count); Mathlib `Chebyshev.psi`,
`Chebyshev.theta`.

**Checks.**

- The initial ranges are needed (negative control): the four bounds of §2.3 start at `59`, `599`,
  `97` and `2657`, while Johnston's statements start at `3` and `2`; and *JohnstonInitialRanges*
  is at the constant of the smallest row only: at `x = 3`, `|ψ(3) − 3| = 3 − log 6 = 1.2082`
  against `√3 log² 3 = 2.0905`, so the constant `1/2` in place of `1` would fail there.
- *JohnstonInitialRanges* holds. The four step functions jump only at integers, `x` and `li x`
  increase, and `√x log² x` and `√x log x` increase on `x ≥ 2`, so on a piece `[j/16, (j + 1)/16)`
  meeting a range the inequality follows from a comparison at the two ends of the piece; the
  largest ratio of the left side to the right is then `0.6082` for `ψ` and `θ` (on
  `[49/16, 25/8)`) and `0.6301` for `π*` and `π` (on `[47/16, 3)`). Unit pieces do not suffice:
  on `[3, 4)`, `ψ = log 6`, and `|log 6 − 4| = 2.2082` exceeds `√3 log² 3`.

### 2.4 Bounds for `ψ`, `θ` and `π` from zero-free regions and densities (ExplicitPrimeCounting §§3.1, 3.4, 3.6)

*Origin:* published: the explicit bounds for `ψ`, `θ` and `π` from zero-free regions and zero
densities of Faber and Kadiri (2015), Trudgian (2016), Mossinghoff and Trudgian (2015), Platt and
Trudgian (2021), Fiori, Kadiri and Swidinsky (2023), Johnston and Yang (2023) and Fiori–Jaskari
(ExplicitPrimeCounting §§3.1, 3.4, 3.6), with its hypothesis supplied by the main theorems; the
bounds that ExplicitPrimeCounting §3.4 obtains from its §3.1(c) are derived here from those that
the Riemann hypothesis gives (2.3).

- The general forms (a), (b) and (d) of §3.1 hold with their bounded-height hypotheses removed,
  every other hypothesis remaining; the zero-free region and the zero density they take are
  parameters with their hypotheses, which remain in general and are dropped too at the parameters
  stated (the smoothed form (c) of §3.1 is not stated here; its instances are the bounds of the
  third item):
  - (a) `dusart_of_zeroFreeRegion` without its region hypothesis
    `ClassicalZeroFreeRegion R (2π)`, for every `R` with `R log 14 > 2` (`R > 0.7578…`), given
    Rosser's zero count, which contains the absence of zeros with `0 < Re s < 1` and
    `|Im s| ≤ 14` that the statement names and through which its route counts the zeros from the
    height `T₀ = 9.6769…` of `M(T₀) = 0 = N(T₀)` on (ExplicitPrimeCounting §3.1(a), Rosser's
    bound), and `ZetaZeroCubeSum`, which bounds the sums `S₁ + S₂` over all the zeros.
  - (b) §3.1(b) without `RH(A)`, `N(A) = M(A)`
    remaining; without the Rosser–Schoenfeld-shape region as well when `R log(21/17) > 2`.
  - (d) §3.1(d) in each of its published forms, without `RH(H)`; without
    the region hypothesis as well when `ν(t) < 1/2` for every `t ≥ H`, and without the density
    hypothesis as well when `D ≥ 0` on `[H, ∞)`. In the forms whose term `s₁` is bounded by
    Johnston–Yang's bound for `∑_{0 < γ ≤ T} 1/γ` (the statement of (d) itself, and the forms of
    Johnston–Yang, Platt–Trudgian and Broadbent–Kadiri–Lumley–Ng–Wilk), the truncation height
    satisfies `T ≥ 4πe`, added to the hypotheses, and the reciprocal-zero records are given: that
    bound holds for `T ≥ 4πe` only, ExplicitPrimeCounting §3.1(d) asks `H ≥ 4πe` and nothing of
    `T`, and for `T ≤ H` its `s₁ = x^{−1/2} (1/2π) log²(T/2π)` uses the bound at `T` (Checks).
    Fiori–Kadiri–Swidinsky's form bounds the low zeros through `B₁` of §2.1 and
    *FioriKadiriSwidinskyZeroSums*, which it takes as hypotheses, with its zero count.
- The two zero inputs of §3.4 that are densities hold: *FioriKadiriSwidinskyDensity*, at every row
  of its tables and in both its forms; and
  *JohnstonYangDensityTable*, at every row and between consecutive
  rows.
- The bounds that ExplicitPrimeCounting §3.4 obtains from §3.1(c) and *FaberKadiriTable* hold,
  each given exactly the hypotheses listed with it. Here `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}` with
  `X = √(log x/6.455)`, `ε_MT(x) = √(8/(17π)) Y^{1/2} e^{−Y}` with `Y = √(log x/6.315)`, and
  *Büthe's hypotheses* are `ButheVerified`, `Buthe2016Range` and Rosser's zero count, under which
  2.3 states the four bounds of ExplicitPrimeCounting §2.3.
  - Faber–Kadiri's Corollary 1.2: `|ψ(x) − x| ≤ 5.3688·10⁻⁴ x` for
    every `x ≥ e²⁰`, given Büthe's hypotheses.
  - Trudgian's bounds (Theorems 1–2 and Lemma 1), each given Büthe's hypotheses, and the first
    three also *TrudgianRange*: `|θ(x) − x| ≤ x ε₀(x)` for `x ≥ 149`;
    `|ψ(x) − x| ≤ x ε₀(x)` for `x ≥ 23`;
    `|π(x) − li x| ≤ 0.2795 x (log x)^{−3/4} exp(−√(log x/6.455))` for `x ≥ 229`; and
    `|θ(x) − x| ≤ 0.0045 x/log² x` for `x ≥ e³⁵`.
  - Mossinghoff–Trudgian's bound: `|θ(x) − x| ≤ x ε_MT(x)`
    for `x ≥ 149`, given Büthe's hypotheses and *MossinghoffTrudgianRange*.
- The other named instances hold with their bounded-height hypotheses, the two density inputs above,
  and the zero-free regions and zero-density bounds that they take from ExplicitZetaBounds Layers
  7–8, with the records under which that roadmap states those regions and densities, removed. Each
  is given exactly the hypotheses listed with it.
  - Platt–Trudgian's bounds (§3.4), each given Rosser's zero count (its zero-count error),
    *PsiThetaUpper* or the remaining hypotheses of §3.7, the Dudek row and the Brun–Titchmarsh
    ranges (for the truncated explicit formula in its Dudek shape), the reciprocal-zero records
    (for the term `s₁` of §3.1(d)), and *PlattTrudgianTable*:
    at each row `(X, A, B, C, ε₀)`,
    `|ψ(x) − x| ≤ A (log x/R)^B exp(−C √(log x/R)) x` and
    `|ψ(x) − x| ≤ ε₀ x` for `log x ≥ X`; the first with `A + 0.1`
    for `θ`; and `|π(x) − li x| ≤ 235 x (log x)^{0.52} exp(−0.8 √log x)` for `log x ≥ 2000`.
  - Fiori–Kadiri–Swidinsky's bounds (§3.4), each given *the remaining hypotheses of
    FioriKadiriSwidinskyPsiRow*: Rosser's zero count (their zero count, and the count from `T = 2`
    that the bound `B₁` of §2.1 assumes), *PsiThetaUpper* or the remaining hypotheses of §3.7, the
    Dudek row and the Brun–Titchmarsh ranges (for the truncated explicit formula in its Dudek
    shape), *FioriKadiriSwidinskyZeroSums* (for the term `ε₂` of their form of §3.1(d), the zeros
    with `β < 0.9`), *FioriKadiriSwidinskyPsiRow* and `ButheVerified`.
    `|ψ(x) − x| ≤ 9.22022 x (log x)^{3/2} exp(−0.8476836 √log x)` for `x ≥ 2`;
    `|ψ(x) − x| ≤ 4.9678·10⁻¹⁵ x`
    for `log x ≥ 3000`; and `|π(x) − Li x| ≤ 9.2211 x √(log x) exp(−0.84768363 √log x)` for `x ≥ 2`.
  - Johnston–Yang's bounds (§3.4, Theorem 1.1 and Corollaries 1.2–1.3), each given Rosser's zero
    count (its zero-count error), *JohnstonYangExplicitFormula*, *JohnstonYangTable*, the
    reciprocal-zero records (for the term `s₁` of §3.1(d) at the rows), the remaining hypotheses
    of *FioriKadiriSwidinskyPsiRow*, `ButheVerified` and *JohnstonYangRange*:
    `|ψ(x) − x| ≤ 9.39 x (log x)^{1.515} exp(−0.8274 √log x)` for
    `x ≥ 2`; at each row, `|ψ(x) − x| ≤ A x (log x)^B
    exp(−C √log x)` and `≤ ε₀ x` for `log x ≥ X`; the rows for `θ`
    with `A + 0.01`; and `|π(x) − li x| ≤ 9.59 x (log x)^{0.515} exp(−0.8274 √log x)` for `x ≥ 2`.
  - Johnston–Yang's Vinogradov–Korobov bounds (§3.6, Theorem 1.4), each given Rosser's zero count
    (its zero-count error, and the count of the bounds of §2.3), *JohnstonYangExplicitFormula*,
    *JohnstonYangVKRow*, *JohnstonYangTable*, the reciprocal-zero records (for the term `s₁` of
    §3.1(d)), the remaining hypotheses of *FioriKadiriSwidinskyPsiRow*, *PsiThetaUpper* or the
    remaining hypotheses of §3.7, *BKLNWPsiTable*, `ButheVerified`, `Buthe2016Range` (for the
    bounds of §2.3, which its route uses from `59` on and which are `Buthe2016Range` below `5000`)
    and *JohnstonYangRange*,
    with `E(x) = exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})`:
    `|ψ(x) − x| ≤ 0.026 x (log x)^{1.801} E(x)`
    for `x ≥ 23`; `|θ(x) − x| ≤ 0.027 x (log x)^{1.801} E(x)` for `x ≥ 59`; and
    `|π(x) − li x| ≤ 0.028 x (log x)^{0.801} E(x)` for `x ≥ 71`.
  - §3.6, Fiori–Jaskari's Theorem 1.1: without
    `RH(3 000 175 332 800)`; without its Vinogradov–Korobov-type region as well when the width `ν`
    of that region has `ν(t) < 1/2` on its range of heights, and without its zero-density input as
    well when that input bounds `N(σ, T)` with `σ > 1/2`, or `N°(σ, T)` with `σ ≥ 1/2`, by a
    quantity nonnegative on its range; otherwise those inputs remain. ExplicitPrimeCounting takes
    both with the paper's constants as parameters and does not display them.

Route: 0.6 for the heights. For the general forms: (a) a zero of `ζ` with `|t| ≥ 2π` lies in the
open strip (none has `Re s ≥ 1`, and the trivial zeros are real), so by the absence of zeros up to
height `14`, which remains (in Rosser's zero count), it has `|t| > 14`, and by
GeneralizedRiemannHypothesisFromWindowBounds §5.3 its real part is `1/2 < 1 − 1/(R log |t|)`, since
`R log |t| > R log 14 > 2`; (b) and (d) are 1.4(d) at the parameters stated: the region of (b) has
the Rosser–Schoenfeld shape, that of (d) is given by `ν`, and the density of (d) bounds
`N°(σ, t)` with `σ > 1/2`, which 1.4(d) makes `0`. In (d) the term `s₁` is Johnston–Yang's bound of
ExplicitPrimeCounting §2.1, under the reciprocal-zero records, at `T` when `T ≤ H` and at `H` and
`T` when `T > H`; both heights are at least `4πe`. The two density inputs bound `N°(σ, T)` at
`σ ≥ 0.6` and at `σ ≥ 0.98`, which 1.4(d) makes `0`, by right sides that are nonnegative: in each
form and at each row the constants (`c̃₁`, `c̃₂`; `C₁`, `C₂`, `c₁`, `c₂`, `d`; `C₁`, `C₂`) are
positive, as Kadiri–Lumley–Ng's closed forms are (1.4's Checks; among them `(3.7669, 5.2954)`,
`(12.0272, 2.9717)`, `(25.3876, 6.0986, 0.336)`, `(16.281, 2.231)` and `(17.418, 2.069)`),
`T ≥ 3·10¹²` and, in the logarithmic form, `T − H > 0`. For the other instances: their regions are
the classical shape with the constants `5.573412` and `5.5666305` (`R log 2 > 2`), the region `ν₂`
(`ν₂ ≤ 0.085`) and the regions of Ford and of Vinogradov–Korobov, all inside `Re s > 1/2` (1.4(a),
(d)); the densities of ExplicitZetaBounds §8.3 at the parameters the rows use hold with no
hypothesis by 1.4(b), and the two density inputs hold as above. The records under which
ExplicitZetaBounds states those regions and densities (`BrentPlattTrudgianRecord`, `HiaryRecord`)
go with them; the records behind a zero count stay with it.

Route of the bounds of Faber–Kadiri, Trudgian and Mossinghoff–Trudgian: three ranges, joined at
`10¹⁹` and at the ends of the finite ranges.

- On `x ≤ 10¹⁹`, `ButheVerified`: `|ψ(x) − x| ≤ 0.94 √x` for `11 < x ≤ 10¹⁹`;
  `0.05 √x < x − θ(x) ≤ 1.95 √x` for `1427 ≤ x ≤ 10¹⁹`, so `|θ(x) − x| ≤ 1.95 √x` there; and
  `0 < li x − π(x) ≤ (√x/log x)(1.95 + 3.9/log x + 19.5/log² x)` for `2 ≤ x ≤ 10¹⁹`. Each of these
  is below the bound it serves from the left end of its range: `5.3688·10⁻⁴ x` from `x = 3.07·10⁶`
  (at `e²⁰` the quotient of the bound by `0.94 √x` is `12.58`); `x ε₀(x)` for `ψ` from `x = 35.08`
  (quotient `1.012` at `36`); `x ε₀(x)` and `x ε_MT(x)` for `θ` from `1427` (quotients `2.673` and
  `2.657`); Trudgian's bound for `π` from `x = 359.3` (quotient `1.001` at `360`); and
  `0.0045 x/log² x` from `e³⁵` (quotient `75.0`). Each quotient increases with `x`: in `L = log x`
  the logarithmic derivative of `√x ε₀(x)` is `1/2 − (1 − 1/(2X))/(12.91 X) ≥ 1/2 − 1/25.82`
  (the maximum of `(1 − 1/(2X))/X` is `1/2`, at `X = 1`), the same with `12.63` for `ε_MT`, that of
  `√x L^{1/4} e^{−√(L/6.455)}` is `1/2 + 1/(4L) − 1/(2 √(6.455 L)) > 0`, the denominator
  `1.95 + 3.9/L + 19.5/L²` decreasing, and that of `√x/L²` is `1/2 − 2/L > 0` for `L ≥ 35`.
- Below those left ends, *TrudgianRange* (`ψ` on `[23, 36]`, `θ` on `[149, 1427]`, `π` on
  `[229, 360]`) and *MossinghoffTrudgianRange* (`θ` on `[149, 1427]`).
- Beyond `10¹⁹`, 2.3: `|ψ(x) − x|, |θ(x) − x| ≤ √x log² x/(8π)` and
  `|π(x) − li x| ≤ √x log x/(8π)`. The quotient of each bound by these is, at `x = 10¹⁹`, `22 293`
  (Faber–Kadiri), `1.92·10⁶` (Trudgian, `ψ` and `θ`), `1.88·10⁶` (Mossinghoff–Trudgian),
  `2.21·10⁶` (Trudgian, `π`) and `97.6` (`0.0045 x/log² x`), and it increases with `x`: the
  logarithmic derivatives in `L` are those above less `2/L`, positive for `L ≥ 43`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.3; 0.6, 1.4, 2.3; ExplicitPrimeCounting
§§1.1, 1.3 (`ButheVerified`, *TrudgianRange*, *MossinghoffTrudgianRange*), 2.1, 3.1, 3.4, 3.6;
ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero count).

**Checks.**

- The range `T ≥ 4πe` of (d) (negative control): take `H = 100`, `T* = T = 14.14`, `x = 10`,
  `σ = 3/4`, `ν = 0.1` and `D = 0`. Under GeneralizedRiemannHypothesisFromWindowBounds §5.3 the
  region and the density hypotheses hold, and only the first pair of zeros has `|γ| ≤ 14.14`; with
  `ψ(10) = log 2520 = 7.832014` and `2 Re(10^ρ/ρ) = 0.411001` at `ρ = 1/2 + 14.134725…i`, the
  truncated formula holds with `ε₁ = 0.176`: `|ψ(10) − 10 + 0.411001| = 1.756985 ≤ 1.76`. Since
  `T ≤ H`, `s₂ = 0` and the conclusion would read
  `|ψ(10) − 10| = 2.167986 ≤ 1.76 + (√10/2π) log²(14.14/2π) = 2.091132`, which is false; the range
  `T ≥ 4πe` excludes this choice. Johnston–Yang's upper bound fails there:
  `1/14.134725 = 0.070748` against `(1/4π) log²(14.14/2π) = 0.052357`. At `T = 4πe = 34.1589` it
  holds (`0.221530 ≤ 0.228129`, the five zeros below that height).
- The record *ZetaZeroReciprocalLowRange* is needed besides the other two reciprocal-zero records
  (negative control): move the sixth and seventh positive ordinates of `ζ`, `37.586178` and
  `40.918719`, to `36.5` and `42.466882` (the second chosen so that `∑ 1/(1/4 + γ²)` is unchanged),
  with their conjugates. The count changes only on `[36.5, 37.586)` and `[40.919, 42.467)`, where it
  is `6` and stays within `0.28 log t` of `M`; the sum up to `10⁷` decreases by `0.000099`; but the
  sum up to `T = 36.5` becomes `0.248927 > (1/4π) log²(36.5/2π) = 0.246341`. The third record fails
  for this set at `T = 36.5` and excludes it. For the zeros of `ζ` the record holds with margin at
  least `0.00104` (at the eighth ordinate `43.327`), and the first two records alone give the upper
  side from `T = 188` on.
- The range of (a) (negative control): at `R = 0.7`, `R log 14 = 1.847 < 2`, and
  `ClassicalZeroFreeRegion 0.7 (2π)` contains `1/2 + 14.1347…i` (its boundary there is
  `1 − 1/(0.7 log 14.1347) = 0.4606`), so it is false under
  GeneralizedRiemannHypothesisFromWindowBounds §5.3 and (a) keeps it as a hypothesis.
- The hypotheses cannot be dropped at every parameter. In (d) take `D ≡ −M` with `M > 0`, which is
  continuous and nondecreasing: the hypothesis `N°(σ, t) ≤ D(t)` is false, while the single-term
  form gives `s₂ = 2 D(T)/T < 0` and `s₁ + s₂ + ε₁ < 0` for large `M`, a false bound. The range
  `D ≥ 0` excludes it.
- The finite ranges are needed (negative control): the bounds fail just below their thresholds,
  as `x → 23⁻`, where `23 − ψ(x) → 3.7343` against `23 ε₀(23) = 3.7016`, and as `x → 149⁻` for
  Mossinghoff–Trudgian's, where `149 − θ(x) → 22.3564` against `149 ε_MT(149) = 22.3395`; and
  `ButheVerified` reaches Trudgian's `ψ` bound only from `x = 35.072` and his `π` bound only from
  `359.29`. At `e²⁰` the bound `√x log² x/(8π)` of 2.3 gives `7.2256·10⁻⁴ x`, above
  `5.3688·10⁻⁴ x`, so Faber–Kadiri's bound needs `ButheVerified` up to `e²¹`.
- Numerical test of the four bounds that start below `10⁷`, against `ψ`, `θ`, `π` and `li` on both
  sides of every jump up to `10⁷`, each quotient of the left side by the right taken at its own
  argument (between two jumps the quotient first decreases and then increases, so its supremum
  there is its value at one end or its limit at the other): the suprema are `0.839888` (Trudgian,
  `ψ`, as `x → 29⁻`), `0.879691` (Trudgian, `θ`, as `x → 223⁻`), `0.883754`
  (Mossinghoff–Trudgian, as `x → 223⁻`) and `0.869237` (Trudgian, `π`, as `x → 233⁻`), each a
  limit from the left and not attained.
- At `R = 9.645908801` the Rosser–Schoenfeld-shape region is inside `Re s > 1/2`
  (`R log(21/17) = 2.0383 > 2`); at `R = 6.455` the same shape, which starts at `|t| = 21`, would
  contain the zero `1/2 + 21.022…i` of `ζ`, which is why (b) has the range `R > 9.4648…`; Trudgian's
  region with that constant starts at `|t| = 24` and lies right of `1/2`.

### 2.5 Ramanujan's inequality and Axler's bound (ExplicitPrimeCounting §3.5)

*Origin:* published: the theorem of Dudek and Platt (2015) on Ramanujan's inequality and the
bounds of Axler (2024) for `π(x)` (ExplicitPrimeCounting §3.5), with its hypothesis supplied by
the main theorems; the bounds through `P₄` and Ramanujan's inequality beyond `e³⁹¹⁵` are derived
here from the bounds that the Riemann hypothesis gives (2.3).

- Dudek–Platt's `ramanujan_largest_counterexample` without `RiemannHypothesis`:
  `π(n)² < (e n/log n) π(n/e)` fails at `n = 38 358 837 682` and holds at every integer
  `n > 38 358 837 682`, given `ButheVerified`, `Schoenfeld1976Range`, `DudekPlattRange` and
  Rosser's zero count, which Schoenfeld's bounds of 2.2, used in its route, take.
- Axler's `axler_primeCounting_upper` without `RiemannHypothesisUpTo 3000175332800`: for every
  `x ≥ 48`,
  `π(x) < x/(log x − 1 − 1/log x − 3.024334/log² x − 12.975666/log³ x − 71.048668/log⁴ x
  − 461.364417856444/log⁵ x − 4331.1/log⁶ x)`, given its `θ`-input
  (`|θ(t) − t| < 0.024334 t/log³ t` for `t ≥ 1 757 126 630 797`), `ButheVerified`,
  `Buthe2016Range`, Rosser's zero count (these three for Johnston's range of §2.3, 2.3) and
  `AxlerPrimeCountingUpperRange`.
- Axler's other three bounds of §3.5, without the same height, each given the same `θ`-bound,
  the remaining hypotheses of §3.7
  (Rosser's zero count among them, which Johnston's range uses as well), `ButheVerified`,
  `Buthe2016Range` and *Axler2024Range*:
  `π(x) > x/(log x − 1 − 1/log x − 2.975666/log² x − 13.024334/log³ x − 70.951332/log⁴ x
  − 460.634397856444/log⁵ x − 3444.031844143556/log⁶ x)` for `x ≥ 1 751 189 194 177`;
  `π(x) > x/(log x − 1 − 1/log x − 3/log² x)` for `x ≥ 65 405 887`; and
  `π(x) < x/(log x − 1 − 1/log x − 3/log² x − 70.935/log³ x)`
  for `x ≥ 29.53`.
- With `P₄(x) = x ∑_{k=0}^{4} k!/log^{k+1} x`, each given Büthe's hypotheses (2.4):
  `π(x) − P₄(x) > −1194 x/log⁶ x` for every
  `x > e³⁹¹⁴`; `π(x) − P₄(x) < 1426 x/log⁶ x` for
  every `x > e³⁹¹⁴`; and `π(x)² < (ex/log x) π(x/e)` for every
  `x > e³⁹¹⁵`.

Route: GeneralizedRiemannHypothesisFromWindowBounds §5.2; 0.6; 2.3. In ExplicitPrimeCounting §3.5,
"the tables of §3.7" are all the hypotheses of §3.7, and "Johnston's range" is
`johnston_of_riemannHypothesisUpTo` at `T = 3 000 175 332 800`, whose hypotheses besides the heights
are `ButheVerified` and `Buthe2016Range`, its route taking Rosser's zero count as well (2.3); 0.6
and 1.4 remove the rest. The five-term bounds come from 2.3's `|π(x) − li x| ≤ √x log x/(8π)`
(`x > 2657`) and the expansion of `li`: five integrations by parts give
`li x − P₄(x) = 120 ∫₂ˣ dt/log⁶ t + li 2 − P₄(2)`, with `li 2 − P₄(2) = −369.9942…`; and
`∫₂ˣ dt/log⁶ t ≤ x/log⁶ x + 6 ∫₂ˣ dt/log⁷ t`, where, split at `√x`,
`∫₂ˣ dt/log⁷ t ≤ √x/log⁷ 2 + 2⁷ x/log⁷ x`. So, with `L = log x`,
`−369.995 − √x L/(8π) ≤ π(x) − P₄(x) ≤ 120 (1 + 768/L) x/L⁶ + 720 √x/log⁷ 2 + √x L/(8π)`; for
`L ≥ 3914` the coefficient `120 (1 + 768/L)` is at most `143.55`, and each term in `√x` is below
`e^{−1898} x/L⁶`, so `π(x) − P₄(x)` lies in `(−1194 x/L⁶, 1426 x/L⁶)`. Ramanujan's inequality is
then ExplicitPrimeCounting §3.5's criterion at `x_a = e³⁹¹⁴` with `M = 1426` and `m = −1194`,
whose condition `ε_M(x) − ε′_m(x) < log x` holds for `x > e³⁹¹⁵` (the difference is `3914.50` at
`e³⁹¹⁵` and decreases).

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; 0.6, 2.2, 2.3; ExplicitPrimeCounting
§§0.3a, 3.5.

### 2.6 Mertens sums (ExplicitPrimeCounting §4.7)

*Origin:* published: the explicit forms of Mertens' theorems under the Riemann hypothesis
(ExplicitPrimeCounting §4.7), with its hypothesis supplied by the main theorems.

`|Σ_{p ≤ x} (log p)/p − log x − E| ≤ 3 log² x/(8π√x)` for
`x ≥ 43.1`; `|Σ_{p ≤ x} 1/p − log log x − B| ≤ 3 log x/(8π√x)` for
`x ≥ 24.4`; each given `ButheVerified`, *LeeNosalMertensRange*, `ZetaZeroReciprocalSum`,
*PsiThetaUpper* or the remaining hypotheses of §3.7, `ZetaZeroCountLowRange`, `HiaryRecord`,
`PatelRecord` and `YangRecord`.

Route: GeneralizedRiemannHypothesisFromWindowBounds §5.2.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; ExplicitPrimeCounting §4.7.

### 2.7 The Mertens function and Mertens' product (ExplicitMultiplicativeFunctions §§0.7, 1.9, 8.1)

*Origin:* published: Lee–Leong's bound for the Mertens function, Leong's bounds for `1/ζ` from a
verified height, and Mertens' product under the Riemann hypothesis (ExplicitMultiplicativeFunctions
§§0.7, 1.9, 8.1), with its hypothesis supplied by the main theorems.

- The part `RH(T)` of clause (a) of *ZetaResidueSumVerified*
  `T S Z` holds, so that clause holds exactly when the zeros up to height `T` are simple.
- Lee–Leong's bound of §1.9,
  `|M(x)| < 33.56 x (log x) exp(−√(log x/5.56))` for `x ≥ e^{4589.20}`,
  Leong's bound (a) and
  Leong's bound (b), `1/|ζ(σ + it)| ≤ 1719 log t`, hold
  with `RH(H₀)` removed, given `BrentPlattTrudgianRecord`, `LeongRecord` and
  *ZetaReciprocalSegmentVerified* `(3/4) 14 16`, as each statement uses them.
- Mertens' product in its form under the Riemann hypothesis (§8.1),
  `e^{−ε_RH(x)} < e^γ (log x) ∏_{p ≤ x} (1 − 1/p) < e^{ε_RH(x) + 1/(x − 1)}` and its reciprocal
  form for every real `x ≥ 24.4`, `ε_RH(x) = 3 log x/(8π √x)`, given the estimate of
  ExplicitPrimeCounting §4.7, which 2.6 supplies with its records.

Route: 0.6 for `RH(T)` and `RH(H₀)`; GeneralizedRiemannHypothesisFromWindowBounds §5.2 for
ExplicitMultiplicativeFunctions §8.1.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; 0.6, 2.6; ExplicitMultiplicativeFunctions
§§0.7, 1.9, 8.1.

### 2.8 Short intervals under the Riemann hypothesis (ExplicitPrimeCounting §2.5)

*Origin:* published: primes in short intervals under the Riemann hypothesis, the theorems of
Schoenfeld (1976), Dudek (2015), Ramaré and Saouter (2003) and Carneiro, Milinovich and
Soundararajan (2019) (ExplicitPrimeCounting §2.5), with its hypothesis supplied by the main
theorems.

Schoenfeld's corollary (`(x − √x log² x/(4π), x]` contains a
prime for every `x > 599`), given `ButheVerified`, `Schoenfeld1976Range` and Rosser's zero count,
the hypotheses of 2.2 for the bounds from which it follows; Dudek's
theorem (`(x − (4/π) √x log x, x]` for every `x ≥ 2`) and Ramaré–Saouter's interval
(`(x − (8/5) √x log x, x]` for every `x ≥ 2`), given
`PrimeGapLogSquareVerified` and Rosser's zero count, the explicit zero count of Dudek's route
(ExplicitPrimeCounting §2.5 takes it from `gap:explicit-zero-count-error`); and
Carneiro–Milinovich–Soundararajan's theorem, given
`PrimeGapLogSquareVerified`, the Brun–Titchmarsh ranges, through which its route bounds the prime
powers and the edges of the smoothed interval, and Rosser's zero count, from which it takes the
count of zeros for every height `T ≥ e`.

Route: GeneralizedRiemannHypothesisFromWindowBounds §5.2, and 2.2 for Schoenfeld's corollary.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; 2.2; ExplicitPrimeCounting §2.5;
ExplicitZetaBounds §§0.4, 5.2 (Rosser's zero count).

### 2.9 Short intervals containing a prime (ExplicitPrimeCounting §§7.1–7.3, 7.5)

*Origin:* published: the short intervals containing a prime of Schoenfeld (1976), Ramaré and
Saouter (2003), Kadiri and Lumley (2014), Cully-Hugill and Lee (2022), Dudek (2016), Cully-Hugill
(2023) and Cully-Hugill–Johnston (ExplicitPrimeCounting §§7.1–7.3, 7.5), with its hypothesis
supplied by the main theorems; the intervals are derived here from the intervals of Dudek (2015) and
of Carneiro, Milinovich and Soundararajan (2019) under the Riemann hypothesis (2.8).

Every statement below except the zero inputs of §7.5 is given *Dudek's hypotheses*,
`PrimeGapLogSquareVerified` and Rosser's zero count, under which 2.8 states Dudek's theorem (for
every `y ≥ 2`, `(y − (4/π) √y log y, y]` contains a prime), and the further hypotheses listed with
it.

- §7.1. `(x, x + x/16597)` contains a prime for every `x > 2 010 759.9`,
  given Dudek's hypotheses and `Schoenfeld1976Range`.
- §7.2. For each of Ramaré–Saouter's three rows, the
  interval `(x(1 − Δ⁻¹), x]` contains a prime for every `x > 10 726 905 041` at `Δ = 28 314 000`,
  every `x ≥ e⁵³` at `Δ = 204 879 661` and every `x ≥ e⁶⁰` at `Δ = 14 500 755 538`; given Dudek's
  hypotheses, and for the first row also *RamareSaouterGapRange*: `p⁺ − p < 360` for consecutive
  primes `p < p⁺` with `10 726 905 041 ≤ p < 1.6·10¹⁰`.
- §7.3, Kadiri–Lumley's rows. For every row `(x₀, Δ)`
  of Kadiri–Lumley's table (`x₀` from `4·10¹⁸` to `e¹⁵⁰`; among them `(4·10¹⁸, 36 082 898)`,
  `(e⁵⁹, 1 946 282 821)` and `(e⁶⁰, 1 966 196 911)`) and every `x ≥ x₀`, `(x(1 − Δ⁻¹), x)` contains
  a prime; given Dudek's hypotheses.
- §7.3, Cully-Hugill–Lee's rows. For every row `(x₀, Δ)` of
  Cully-Hugill–Lee's table (`log x₀` from `log(4·10¹⁸)` to `600`; among them
  `(4·10¹⁸, 3.90970·10⁷)`, `(e⁶⁰, 7.69184·10¹⁰)` and `(e⁶⁰⁰, 2.51949·10¹¹)`) and every `x ≥ x₀`,
  `(x(1 − Δ⁻¹), x]` contains a prime; given Dudek's hypotheses and the Brun–Titchmarsh ranges, the
  hypotheses of Carneiro–Milinovich–Soundararajan's theorem (2.8).
- §7.5, the zero inputs. *CullyHugillDensity* holds; and
  *RamareRevisedDensity* holds.
- §7.5, primes between powers. For every real `x ≥ 1`,
  `(x, x + 3x^{2/3}]` contains a prime; for all reals `c ≥ 3`,
  `θ ≥ 2/3` and `x ≥ 1`, `(x, x + c x^θ]` contains a prime, among them Cully-Hugill–Johnston's
  interval `(x, x + 140 x^{139/140}]`; and for every integer
  `k ≥ 3` and every integer `n ≥ 1` there is a prime `p` with `n^k < p < (n + 1)^k`, among them the
  primes between consecutive cubes (Dudek's and Cully-Hugill's theorems, which ExplicitPrimeCounting
  states for `n ≥ exp(exp(33.219))` and `n ≥ exp(exp(32.892))`), between consecutive `155`-th powers
  (Cully-Hugill's) and between consecutive `140`-th powers (Cully-Hugill–Johnston's). Each is given
  Dudek's hypotheses.

Route: each interval statement is an inclusion into the interval of Dudek's theorem (2.8), or of
Carneiro–Milinovich–Soundararajan's for Cully-Hugill–Lee's rows, for large `x`, and a bound for the
gaps between consecutive primes for small `x`. Write `p` for the largest prime `≤ x` and `p⁺` for
the next; a prime lies in `(x, x + h)` as soon as `p⁺ − p < h`, since `p⁺ − x ≤ p⁺ − p`, and in
`(x(1 − Δ⁻¹), x]` as soon as `Δ (p⁺ − p) ≤ p⁺`, since `x < p⁺`. The comparisons with the
intervals of 2.8 are monotone (`log x/√x` and `log² x/x` decrease for `x > e²`), so each is checked
at the left end of its range.

- Schoenfeld's interval: `Schoenfeld1976Range` for `2 010 759.9 < x ≤ 10⁸`; for
  `10⁸ ≤ x ≤ 4·10¹⁸`, `PrimeGapLogSquareVerified` gives `p⁺ − p < log² p ≤ log² x < x/16597`
  (`339.3 < 6025` at `10⁸`); for `x ≥ 4·10¹⁸`, Dudek's theorem at `y = x(1 + 1/16598)` puts a prime
  in `(x, y] ⊂ (x, x + x/16597)`, since `(4/π) √y log y ≤ x/16598` (`1.091·10¹¹ ≤ 2.410·10¹⁴` at
  `4·10¹⁸`).
- Ramaré–Saouter's rows: Dudek's theorem at `x` itself gives a prime in
  `(x − (4/π) √x log x, x] ⊂ (x(1 − Δ⁻¹), x]` as soon as `(4/π) Δ log x/√x ≤ 1`: for the second and
  third rows at every `x ≥ x₀` (the left side is `0.0428` and `0.1037` at `x₀`), and for the first
  from `x = 4·10¹⁸` (`0.7721`). For the first row on `10 726 905 041 < x < 4·10¹⁸`: `p` is at least
  `10 726 905 041`, a prime; for `p < 1.6·10¹⁰`, *RamareSaouterGapRange* gives `p⁺ − p < 360` and
  `360 Δ = 1.0193·10¹⁰ < p⁺`; for `1.6·10¹⁰ ≤ p < 4·10¹⁸`, `PrimeGapLogSquareVerified` gives
  `p⁺ − p < log² p ≤ p/Δ`, since `p/log² p` increases and is `2.898·10⁷ > Δ` at `1.6·10¹⁰`.
- Kadiri–Lumley's rows: 2.8 at `x − 1/2 ≥ 2` gives a prime in `(x − 1/2 − (4/π) √x log x, x − 1/2]`,
  which lies inside `(x(1 − Δ⁻¹), x)` when `1/(2x) + (4/π) log x/√x ≤ 1/Δ`; the left side decreases
  for `x > e²`, and at each row's `x₀` it is below `1/Δ` (Checks).
- Cully-Hugill–Lee's rows: Carneiro–Milinovich–Soundararajan's theorem at `y = x(1 − Δ⁻¹) + 1`
  puts a prime in `[y, y + (22/25) √y log y]`, which lies in `(x(1 − Δ⁻¹), x]` when
  `1 + (22/25) √x log x ≤ x/Δ`, that is `Δ ((22/25) log x/√x + 1/x) ≤ 1`; the left side decreases,
  and at the rows' `x₀` it is at most `0.73684`, at `x₀ = 4·10¹⁸`.
- `(x, x + 3x^{2/3}]`: for `1 ≤ x < 11`, the primes `2, 3, 5, 7, 11, 13` (the next prime after `x`
  is within `0.365 · 3x^{2/3}` of `x`, the largest quotient being at `x = 7`); for
  `11 ≤ x < 4·10¹⁸`, `PrimeGapLogSquareVerified` gives `p⁺ − p < log² p ≤ log² x < 3x^{2/3}`, since
  `3 e^{2L/3}/L² ≥ 3e²/9 = 2.46` for every `L > 0`; for `x ≥ 4·10¹⁸`, Dudek's theorem at
  `y = x + 3x^{2/3} ≤ 2x` puts a prime in `(x, y]`, since `(4/π) √y log y ≤ 3x^{2/3}`: the quotient
  of the left side by the right is at most `(4/(3π)) √2 (log 2 + L) e^{−L/6}`, decreasing for
  `L > 6`, and `0.021` at `L = log(4·10¹⁸)` (the inclusion holds from `x = 3257`). The general
  form: `c x^θ ≥ 3x^{2/3}` for `x ≥ 1`, `c ≥ 3`, `θ ≥ 2/3`. The powers: at `x = n^k`,
  `(n + 1)^k ≥ n^k + k n^{k−1} + 1` for `k ≥ 2`, and `k n^{k−1} ≥ 3 n^{2k/3}` for `k ≥ 3`, `n ≥ 1`
  (`log(k/3) + (k/3 − 1) log n ≥ 0`), so `(n^k, n^k + 3 n^{2k/3}] ⊂ (n^k, (n + 1)^k)`.
- The zero inputs of §7.5 bound `N°(σ, T)` at `σ ≥ 0.6` and at `σ ≥ 0.52`, which 1.4(d) makes `0`,
  by right sides that are positive (`17.418`, `5.272`; `965`, `51.5`; `T ≥ 2000`).

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3 (through 1.4 and 2.8); 1.4, 2.8;
ExplicitPrimeCounting §§1.3 (`Schoenfeld1976Range`), 1.4 (`PrimeGapLogSquareVerified`), 7.1, 7.2,
7.3, 7.5.

**Checks.**

- The rows of Kadiri–Lumley from 2.8: `1/(2x₀) + (4/π) log x₀/√x₀` against `1/Δ` is
  `2.726822·10⁻⁸ < 2.771396·10⁻⁸` at `x₀ = 4·10¹⁸` (margin `1.6 %`), `2.517951·10⁻⁸ < 2.580382·10⁻⁸`
  at `e⁴³`, and the margin grows along the table, to `98.6 %` at `e⁶⁰`.
- Carneiro–Milinovich–Soundararajan's interval is needed at the first rows of Cully-Hugill–Lee
  (negative control for Dudek's): there `Δ ((4/π) log x₀/√x₀ + 1/(2x₀))` is `1.0661` at
  `x₀ = 4·10¹⁸` and `1.0529` at `e⁴³`, above `1`; it is below `1` from the row `e⁴⁶` on (`0.9853`).
- The first row of Ramaré–Saouter needs a record of the gaps near `x₀` (negative control): at
  `x₀ = 10 726 905 041`, `(4/π) Δ log x₀/√x₀ = 8039`, and `log² x₀ = 533.4` exceeds
  `x₀/Δ = 378.9`, so neither Dudek's theorem nor `PrimeGapLogSquareVerified` reaches it; and the
  gap of `382` from the prime `10 726 904 659` to `x₀` exceeds `x₀/Δ`, which is why the row starts
  at `x₀`. *RamareSaouterGapRange* holds: a sieve of `[10 726 905 041, 16 000 002 001]`
  (`226 229 823` primes; the right end is a prime, and the first prime above `1.6·10¹⁰` is
  `16 000 000 039`) finds no gap of `360` or more.
- The finite range of `(x, x + 3x^{2/3}]` is needed (negative control for Dudek's theorem alone):
  at `x = 1000`, `y = 1300` and `(4/π) √y log y = 329 > 300 = 3x^{2/3}`. Numerical test: every gap
  after a prime `p ≤ 10⁷` is at most `0.365 · 3p^{2/3}`, and a sieve finds a prime between `n³` and
  `(n + 1)³` for every `n ≤ 214`.

### Examples

Johnston's inequality at `x = 3` reads `|ψ(3) − 3| = 1.2082 < 2.0905` (2.3). A gap of `382`
precedes the first row of Ramaré–Saouter, which is why that row starts at `10 726 905 041` (2.9).

### Dependencies

GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3; 0.2, 0.3, 0.5, 0.6; 1.4;
RiemannHypothesisStatementsAndConsequences §§8.8, 9.5, 9.9; ZerosOfLFunctions §8.8;
AnalyticNumberTheoryPartI §1.9; ExplicitZetaBounds §§0.4, 5.2; ExplicitPrimeCounting;
ExplicitMultiplicativeFunctions; Mathlib's Chebyshev functions.

## Layer 3: primes in progressions and character values

### 3.1 Primes in progressions: the error term (AnalyticNumberTheoryPartI §1.9(ii))

*Origin:* published: the prime number theorem in progressions with error `O(√x log² x)` under the
Riemann hypothesis for the characters of the modulus (RiemannHypothesisStatementsAndConsequences
§9.9(ii); AnalyticNumberTheoryPartI §1.9(ii)), with its hypothesis supplied by the main theorems.

`psiAP_isBigO`: for every `q ≥ 1` and `a` prime to `q`, `ψ(x; a, q) − x/φ(q) = O(√x log² x)`,
the implied constant depending on `q`. Hence the conclusion of AnalyticNumberTheoryPartI §1.9(ii),
`ψ(x; a, q) − x/φ(q) = O_{q,ε}(x^{1/2+ε})` for every `ε > 0` (`psiAP_isBigO_of_dirichletGRH`), holds
with no hypothesis.

Route: RiemannHypothesisStatementsAndConsequences §9.9(ii) at the modulus `(q)∞` and `σ = 1/2`, in
its rational case for the primes in a reduced class modulo `q`, whose hypothesis for every Dirichlet
character modulo `q` is GeneralizedRiemannHypothesisFromWindowBounds §5.1 (through
RiemannHypothesisStatementsAndConsequences §9.5's rational bullet), as in 2.1. The weaker form
follows from `log² x ≤ C_ε x^ε` for `x ≥ 2`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1; RiemannHypothesisStatementsAndConsequences
§§9.5, 9.9; AnalyticNumberTheoryPartI §1.9.

### 3.2 Primes in progressions: explicit bounds (ExplicitPrimeCounting §§6.1, 6.3, 6.6)

*Origin:* published: the explicit prime number theorems in progressions of Ramaré and Rumely
(1996), Dusart (2002), McCurley (1984), Bennett, Martin, O'Bryant and Rechnitzer (2018) and Kadiri
(2008) (ExplicitPrimeCounting §§6.1, 6.3, 6.6), with its hypothesis supplied by the main
theorems: the verification heights, the regions and the absence of exceptional moduli.

- §6.1. *RamareRumelyRegion* `q H C` for every `q ≥ 1`, `H ≥ 1000` and
  `0 < C ≤ 32π`. The general theorem in the shape of Ramaré–Rumely
  and Dusart for every `q > 1`, `H > 1000` and `9.14 ≤ C₁(q) ≤ 32π`, without `GRH*(q, H)` and
  *RamareRumelyRegion* `q H C₁(q)`, given the Dirichlet zero counts (Conventions).
  No modulus `q ≥ 2` is exceptional in McCurley's sense, so
  the theorem in McCurley's shape holds for every `q > 10^b` without
  the hypothesis that `q` is not exceptional and without its region and the records with it, given
  the Dirichlet zero counts and *McCurleyTable*. The route of both shapes
  (`gap:dirichlet-zero-count-error` for the counts) sums a zero count over all the characters
  modulo `q`, the principal one included, whose zeros in `0 < Re s < 1` are those of `ζ`: the
  Dirichlet zero counts, ExplicitZetaBounds §5.3 given *BennettMartinOBryantRechnitzerRecord* for
  the others and Rosser's zero count for it. GeneralizedRiemannHypothesisFromWindowBounds §5.1
  places the zeros and does not count them.
- §6.1, the tabulated rows. The rows `(k, ε, x₀)` of Ramaré–Rumely's Table 1 (among them
  `(1, 0.000213, 10¹⁰)` and `(8, 0.002811, 10¹⁰)`) and of Dusart's table are not instances of the
  general shape: at `x₀ = 10¹⁰`, `X = √(log x₀/9.645908801) = 1.5450`, below the threshold
  `X₄ ≥ 10` of the shape; the row `k = 1` lies outside its `q > 1`; and at the row
  `(8, 0.002811, 10¹⁰)` the error function of the shape, even at its most favourable constant
  `C₁ = 32π`, is `ε(X) = 0.11219`, against the row's `0.002811/φ(8) = 0.00070275`. So the table
  propositions *RamareRumelyTable1* and *Dusart2002Table* of ExplicitPrimeCounting §6.1, which
  compare the rows with that error function, do not give them. Write *RamareRumelyRows* for the
  proposition that for each row `(k, ε, x₀)` of those two tables and every unit `a` modulo `k`, if
  `GRH*(k, H)` holds for every `H`, then `|ψ(y; k, a) − y/φ(k)| ≤ ε x/φ(k)` and
  `|θ(y; k, a) − y/φ(k)| ≤ ε x/φ(k)` for every `x ≥ x₀` and every `y` with `1 ≤ y ≤ x` (a supremum
  over `y`, which need not be attained: Checks): the rows as their sources
  obtain them, by a finite-height smoothed estimate evaluated at each row from the zeros up to the
  verified height and the region for the modulus, both of which the premise contains (the region
  as in the route below). Given *RamareRumelyRows*, every
  row holds, for every unit `a` modulo `k` and every `x ≥ x₀`.
- §6.3. The three bounds of Bennett, Martin, O'Bryant and Rechnitzer hold for every `q ≥ 3` and
  every unit `a` modulo `q`, with `c₀(q)`, `x₀(q)` as there: for `ψ`,
  for `θ` and for `π` against
  `Li x/φ(q)`, each without `GRH*(q, 10⁸/q)`, *PlattRecord*, *PlattCentralRecord*, the regions for
  the high zeros with their records and the exceptional clause, and each given the Dirichlet zero
  counts (`gap:dirichlet-zero-count-error` for the nonprincipal characters, Rosser's zero count for
  the principal one, of conductor `1`) and *BMORTables*.
- §6.6. No modulus is exceptional in Kadiri's sense;
  the zero input *LiuWangFourZeros* holds. Kadiri's existence theorem for every `q ≥ 3`, given the
  Dirichlet zero counts (its route counts
  the zeros of every `L(s, χ)` modulo `q`, the principal character included); and
  its quantitative instances for every
  `q ≥ max(q₀, 8·10⁹)`, given the same and *Kadiri2008Table*; both without
  `RiemannHypothesisUpTo 3000175332800`, *PlattRecord*, the regions of ExplicitZetaBounds §7.5 with
  their records, *LiuWangFourZeros* and the exclusion of exceptional moduli.

Route: 0.6 for `GRH*`, 0.7 for *PlattRecord*, 1.4 for the regions. *RamareRumelyRegion* `q H C`
holds by GeneralizedRiemannHypothesisFromWindowBounds §5.1: every zero with `0 < β < 1` has
`β = 1/2`, and `1/2 ≥ 1/(R log(q|γ|/C))` because `q|γ|/C ≥ 1000/(32π) > e^{2/R}`. An exceptional
modulus needs a real zero `β` of a real character modulo `q` with `β > 1 − 1/(9.645908801 log q)`,
which is at least `0.8504` for `q ≥ 2`, in McCurley's sense, and a zero of some `L(s, χ)` modulo
`q ≥ 3` with real part at least `1 − 1/(6.50 log 3) = 0.85996…`, so above `0.85`, in Kadiri's;
GeneralizedRiemannHypothesisFromWindowBounds §5.1 excludes both, the principal characters through
`ζ` (at `q = 1` McCurley's boundary `1 − 1/(R log 1)` is undefined, and the statement is for
`q ≥ 2`). The zeros that *LiuWangFourZeros* counts have real part at least
`1 − 1/(3.82 log x) > 0.98` for `x ≥ 8·10⁹`, so GeneralizedRiemannHypothesisFromWindowBounds §5.1
leaves none. The exceptional clause of §6.3 enters only for `q > 10⁵`, as the bound
`β ≤ 1 − 40/(√q log² q)` for a real zero `β ∈ (0, 1)` of a quadratic character modulo `q`: by
GeneralizedRiemannHypothesisFromWindowBounds §5.1 such a zero is `1/2`, and `40/(√q log² q) < 1/2`
for `q > 10⁵` (at `q = 10⁵` it is `9.5·10⁻⁴`, and it decreases). *PlattCentralRecord* serves §6.3
only to exclude that zero for `10⁵ < q ≤ 400 000`, which the same inequality does. The tabulated
rows: 0.6 gives `GRH*(k, H)` for every `H`, the premise of *RamareRumelyRows*.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.3; 0.6, 0.7, 1.4; ExplicitPrimeCounting
§§1.2, 6.1, 6.3, 6.6; ExplicitZetaBounds §0.2 (the passage to imprimitive characters), §5.3 (the
count for conductors `k > 1`, given *BennettMartinOBryantRechnitzerRecord*), §§0.4, 5.2 (Rosser's
zero count, for the conductor `1`).

**Checks.**

- The principal characters need the count for `ζ`: §5.3 is stated for conductors `k > 1`, and at
  `k = 1`, `T = 15` its formula would give `ℓ = log(17/2π) = 0.995 ≤ 1.567` and so no zero with
  `|γ| ≤ 15`, while `ζ` has two.
- The rows are not instances of the general shape (negative control): with
  `X = √(log 10¹⁰/9.645908801) = 1.54503` and the largest admissible `C₁ = 32π`, its error at `q = 8`
  is `3 √(8/(4 · 32π)) X^{1/2} e^{−X} = 0.11219`, `160` times the row's `0.00070275`.
- The rows bound a supremum, not a maximum (negative control for the reading with `max`): at
  `k = 1` and `x = p` prime with `θ(y) < y` on `[1, p]` (`ButheVerified` gives this for
  `p ≤ 10¹⁹`), `y − θ(y)` increases on each interval between consecutive primes and drops by
  `log q` at each prime `q`, so `sup_{1 ≤ y ≤ p} |θ(y) − y|` is a left limit at a prime and no `y`
  attains it; at `p = 10 007` it is `162.4755`, the left limit at `8597`, where the value is
  `153.4163`. The inequality for every `y ≤ x` is the same as the bound for the supremum.

### 3.3 The least prime in a progression (ExplicitPrimeCounting §6.5)

*Origin:* published: the least prime in a progression under the Riemann hypothesis for the
characters of the modulus (ExplicitPrimeCounting §6.5), with its hypothesis supplied by the main
theorems; the bound of Bach and Sorenson (1996) at the cyclotomic fields is derived here from its
headline.

For every `q > 3` and every unit `a` modulo `q`, given
`LamzouriLiSoundararajanRange` and the Dirichlet zero counts (Conventions:
*BennettMartinOBryantRechnitzerRecord* and Rosser's zero count), there is a prime `p ≡ a (mod q)`
with `p ≤ (φ(q) log q)²`. For every `q ≥ 2` and every
unit `m` modulo `q`, a prime `p ≡ m (mod q)` with `p < 2 (q log q)²`, given the same, through which
§6.5's route for `q > 3` passes. Bach–Sorenson's
bound at the cyclotomic fields, for every `q ≥ 1` and every unit `m` modulo `q` a prime
`p ≡ m (mod q)` with `p ≤ (4 log |disc ℚ(ζ_q)| + 2.5 φ(q) + 5)²`, given the same.

Route: §6.5's hypothesis, `χ.GeneralizedRiemannHypothesis` for every `χ : DirichletCharacter ℂ q`,
is GeneralizedRiemannHypothesisFromWindowBounds §5.1. The route of the headline for `q > 20 000`
sums a zero count over all the characters modulo `q` (the `gap:dirichlet-zero-count-error` of
§6.5; for `3 < q ≤ 20 000` the headline is `LamzouriLiSoundararajanRange`). The principal
character modulo `q` occurs in each sum and has the zeros of `ζ` in `0 < Re s < 1`; its conductor
is `1`, which ExplicitZetaBounds §5.3 excludes, so its term is bounded by Rosser's zero count, with
`N(T) = 0` below `14` and Rosser's bound from `T = 2` (ExplicitZetaBounds §5.2), and the term of
each nonprincipal character by §5.3 at the conductor `k > 1` of its primitive character, given
*BennettMartinOBryantRechnitzerRecord*. GeneralizedRiemannHypothesisFromWindowBounds §5.1 places the
zeros on the line and does not count them, so the records stay, as in 3.2. The cyclotomic bound is
a consequence of the headline, with no Chebotarev statement for `ℚ(ζ_q)`: for `q > 3`, §6.5's bound
`log |disc ℚ(ζ_q)| ≥ (φ(q)/2) log(q/2)` gives
`4 log |disc ℚ(ζ_q)| + 2.5 φ(q) + 5 ≥ φ(q)(2 log q − 2 log 2 + 2.5) + 5 > φ(q) log q`, so the
headline's `(φ(q) log q)²` is below the bound; for `q ≤ 3` directly: at `q = 1` and `q = 2`,
`ℚ(ζ_q) = ℚ`, the bound is `7.5² = 56.25` and `2`, respectively `3`, serves; at `q = 3` it is
`(4 log 3 + 10)² = 207.2`, and `7` and `2` serve.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1; ExplicitPrimeCounting §6.5 (the
headline, Bach–Sorenson's form, and the size of the cyclotomic discriminant); ExplicitZetaBounds
§0.2 (the passage to imprimitive characters), §5.3 (the count for conductors `k > 1`, given
*BennettMartinOBryantRechnitzerRecord*), §§0.4, 5.2 (Rosser's zero count, for the principal
characters).

**Checks.**

- The principal character cannot be counted by §5.3 (negative control): at conductor `1` and
  `T = 15` its formula gives `ℓ = log(17/2π) = 0.99534 ≤ 1.567`, that is no zero with
  `|γ| ≤ 15`, while `ζ` has the two zeros `1/2 ± 14.134725…i`. Rosser's bound is consistent with
  them: `N(15) = 1`, `M(15) = (15/2π) log(15/2πe) + 7/8 = 0.5651`, and `|1 − M(15)| = 0.4349` is
  below its right side `2.4003`.
- Bach–Sorenson's Chebotarev bound read at `E = ℚ(ζ_q)` does not by itself give a prime in the
  class (negative control): for `q = 6`, `ℚ(ζ_6) = ℚ(ζ_3)`, the prime `2` is unramified and its
  Frobenius is the class `5` of `(ℤ/6)^×` (`2 ≡ 5 (mod 3)`), while `2 ≢ 5 (mod 6)`; the same
  happens at every `q = 2r` with `r > 1` odd (the odd class `m ≡ 2 (mod r)`: `7` at `q = 10`, `9`
  at `q = 14`). Their theorem also asks `E ≠ ℚ`, which excludes `q = 1, 2`. The route above uses
  neither.
- Numerical test: for every `q ≤ 1000` and every unit class modulo `q`, the least prime of the
  class is at most `0.0534` times the cyclotomic bound (the largest quotient is `3/56.25`, at
  `q = 2`), and for `3 < q ≤ 1000` at most `0.651` times `(φ(q) log q)²` (at `q = 4`).

### 3.4 Least character values (QuasiRiemannHypothesis §§11.2, 11.3; SieveMethodsAndPrimePatterns §2.9)

*Origin:* published: the bounds `O((log q)²)` for the least character values and for the least
quadratic nonresidue under the Riemann hypothesis, and their Hecke analogue (QuasiRiemannHypothesis
§§11.2, 11.3; SieveMethodsAndPrimePatterns §2.9), with its hypothesis supplied by the main theorems.

There is an absolute `C` such that every nonprincipal Dirichlet
character `χ` modulo `q ≥ 2` has *leastNonOne* `χ ≤ C (log q)²`; hence
`SieveApplications.leastNonresidue p ≤ C (log p)²` for every odd
prime `p`. The Hecke analogue of §11.2 at `θ = 1/2`, for
every field `K` abelian over `ℚ`, every modulus `𝔪` of `K` and every nontrivial
`η : RayClassCharacter 𝔪` whose primitive character is a `φ̃` of 0.3: some nonzero prime ideal `𝔭`
with `η(𝔭) ∉ {0, 1}` has `N𝔭 ≤ C_K (log N𝔪₀ + 2)²`, `𝔪₀` the finite part of `𝔪`.
The bound for `leastNonresidue` implies that for each `ε > 0` only finitely many odd primes `p`
have `leastNonresidue p > p^ε`, and with it `SieveApplications.linnik_exceptional` of
SieveMethodsAndPrimePatterns §2.9: for each `ε > 0` there is `C_ε` such that for every `N ≥ 2` at
most `C_ε` odd primes `p ≤ N` have `leastNonresidue p > N^ε`.

Route: §11.2 at `θ = 1/2` with GeneralizedRiemannHypothesisFromWindowBounds §5.1, and with 0.3 for
the Hecke analogue; the least nonresidue as in §11.3 with the exponent `1/(1 − θ) = 2`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1; 0.3; QuasiRiemannHypothesis §§11.2,
11.3; SieveMethodsAndPrimePatterns §2.9.

### 3.5 Primitive roots (ExplicitNumberFields §6.4)

*Origin:* published: the explicit bounds for the least primitive root under the Riemann hypothesis,
and Grosswald's conjecture under it (ExplicitNumberFields §6.4), with its hypothesis supplied by the
main theorems.

For every prime `p ≥ 10⁹`,
`ĝ(p) ≤ ((8/5)(2^{ω(p−1)} − 1) log p)²`; the sieved bound of
§6.4 for every prime `p`; and Grosswald's conjecture, each given *GrosswaldFiniteRange*,
*GrosswaldPrimeFiniteRange*, *GrosswaldSieveVerification* and *PrimorialTableVerified* `26`:
`ĝ(p) < √p − 2` for every prime `p > 2791`, and
`g(p) < √p − 2` for every prime `p > 409`.

Route: the hypothesis of §6.4, `GRHMod p` (§0.5), is given by
GeneralizedRiemannHypothesisFromWindowBounds §5.1, which gives `DirichletGRH χ` for every
`χ : DirichletCharacter ℂ p`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1; ExplicitNumberFields §§0.5, 6.4.

### Examples

Rosser's bound is consistent with the two zeros `1/2 ± 14.134725…i` of `ζ`: `N(15) = 1` and
`M(15) = 0.5651` (3.3). At `q = 8` and `x₀ = 10¹⁰` the error of the general shape of Ramaré–Rumely,
even at `C₁ = 32π`, is `0.11219`, `160` times the row's `0.00070275`, so the tabulated rows are
stated as *RamareRumelyRows* (3.2). For `q = 6` the prime `2` has Frobenius `5` in `ℚ(ζ_6)` while
`2 ≢ 5 (mod 6)`, which is why the cyclotomic bound of 3.3 is drawn from the headline and not from
Bach–Sorenson's Chebotarev bound.

### Dependencies

GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.3; 0.3, 0.6, 0.7; 1.4; 2.1;
RiemannHypothesisStatementsAndConsequences §§9.5, 9.9; AnalyticNumberTheoryPartI §1.9;
ExplicitZetaBounds §§0.2, 0.4, 5.2, 5.3, 7.5; ExplicitPrimeCounting §§1.2, 6.1, 6.3, 6.5, 6.6;
QuasiRiemannHypothesis §§11.2, 11.3; SieveMethodsAndPrimePatterns §2.9; ExplicitNumberFields §§0.5,
6.4.

## Layer 4: number fields

### 4.1 Littlewood's class-number bound (RiemannHypothesisStatementsAndConsequences §9.7)

*Origin:* published: the lower bound of Littlewood (1928) for `L(1, χ)` under the Riemann
hypothesis (RiemannHypothesisStatementsAndConsequences §9.7) and the class number formula, with its
hypothesis supplied by the main theorems; the class-number bound is derived here from them.

There is an absolute `c > 0` with
`h(D) ≥ c √|D|/log log |D|` for every fundamental discriminant `D < −4`, `h(D)` the class number of
the imaginary quadratic field of discriminant `D`. It is the lower bound for `L(1, χ)` of
Littlewood's bounds in 1.1(ii) read through the class number formula. The bound implies
ImaginaryQuadraticClassNumber H2.4 (`imaginary_classNumber_lower_bound`, `h(D) ≥ C_ε |D|^{1/2−ε}`).

Route: let `K` be the imaginary quadratic field of discriminant `D` and `χ_D` its quadratic
character, primitive of conductor `|D| ≥ 7` (Tau Ceti
`TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantCharCast`), hence nontrivial. As
`D ≠ −3, −4`, `K` has two units and `h(D) = √|D| L(1, χ_D)/π` (Tau Ceti
`TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne`), so `L(1, χ_D) = π h(D)/√|D| > 0`.
Littlewood's lower bound of 1.1(ii) at `q = |D| ≥ 3` gives `L(1, χ_D) ≥ (C log log |D|)⁻¹`, hence the
bound with `c = 1/(πC)`.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.1 (through 1.1); 1.1;
RiemannHypothesisStatementsAndConsequences §9.7 (through 1.1); Tau Ceti
`TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne`,
`TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantCharCast`.

### 4.2 Quadratic zero gaps and small fields (ExplicitNumberFields §0.5)

*Origin:* published: the quadratic zero-gap hypotheses of ExplicitNumberFields §0.5 and the bounds
that its §§4.7 and 4.9 state under them, with its hypothesis supplied by the main theorems; the
gaps are derived here: under the main theorems a real zero of the zeta function of a quadratic
field can only be at `1/2`, and the finite record *SmallQuadraticCentralValues* excludes it at the
nine fields with `d_F ≤ 13`.

Write *SmallQuadraticCentralValues* for the proposition that `L(1/2, χ_F) ≠ 0` at the nine
quadratic fields `F` with `d_F ≤ 13`, of discriminants `−3, −4, 5, −7, 8, −8, −11, 12, 13`, `χ_F`
the primitive real character of conductor `d_F`, a finite record (Checks).

With no hypothesis: *UniformQuadraticZeroGap* `c` for every `0 < c ≤ (log 3)/2`, and the condition
of *QuadraticRealZeroGap* `c` and of *ImaginaryQuadraticRealZeroGap* `c` at every quadratic field
`F` with `c √d_F ≥ 2`. Given *SmallQuadraticCentralValues*: that condition, for every `c > 0`, at
the nine fields with `d_F ≤ 13`; and *QuadraticRealZeroGap* `c`, hence
*ImaginaryQuadraticRealZeroGap* `c`, for every `c ≥ 2/√15`, among them `c = π/6`. Hence, without
the gap hypothesis: given *SmallQuadraticCentralValues*, the bound of ExplicitNumberFields §4.7,
`κ_K > (1/c₄) min(1/(starkAlpha K · log d_K), 1/(c₈ d_K^{1/n}))` for `n ≥ 3` at every
`c₈ ≥ 2/√15`, and its consequence at `c₈ = π/6`,
`κ_K > 0.0014480/(n · t_K · d_K^{1/n})` for `n ≥ 3`; with no hypothesis,
§4.7's instance under the uniform gap,
`κ_K > (1/c₄) min(1/(starkAlpha K · log d_K), e c₀/(2 d_K^{1/n}))` for `n ≥ 3` at every
`0 < c₀ ≤ (log 3)/2`, and §4.9's two real-zero bounds at every `0 < c₀ ≤ 1/4`,
`(1 − β) log d_K ≥ c₀` for `K/ℚ` Galois of degree
`n ≥ 2` and `(1 − β) log d_K ≥ c₀/m_N` for `K` of degree `n ≥ 2` with
normal closure of degree `m_N`. The clause of
*DGLSWSmallFieldGRH* for the fields abelian over `ℚ`: no such `K` with `n = 2` and
`d_K ≤ 400 000`, with `n = 3` and `d_K ≤ 239`, or with `n = 4` and `d_K ≤ 320` has a zero `β + iγ`
of `ζ_K` with `β > 1/2` and `|γ| ≤ 1`; this is its whole quadratic part.

Route: for a quadratic field `F`, `ζ_F = ζ · L(·, χ_F)` and `ζ` has no zero in `(0, 1)`
(ExplicitZetaBounds §0.3, its case `q = 1`), so by GeneralizedRiemannHypothesisFromWindowBounds §5.3
a real zero `β ∈ (0, 1)` of `ζ_F` is `1/2`, and it is one exactly when `L(1/2, χ_F) = 0`; then
`(1 − β) log d_F = (log d_F)/2 ≥ (log 3)/2`, and `β ≤ 1 − 1/(c √d_F)` exactly when `c √d_F ≥ 2`,
which holds for every `d_F ≥ 15` when `c ≥ 2/√15`. At the nine fields with `d_F ≤ 13`
*SmallQuadraticCentralValues* leaves no real zero in `(0, 1)`, so the condition holds there at every
`c > 0`; the next field, `d_F = 15`, is why the range of the gap *QuadraticRealZeroGap* `c` stops at
`2/√15` (`π/6 = 0.5236 ≥ 2/√15 = 0.5164`). The bound at `c₈ = π/6` is §4.7's derivation of
that consequence from the clause at `c₈ = π/6`. *DGLSWSmallFieldGRH* asks for no zero with
`β > 1/2`, which 0.2 gives for every abelian field, and every quadratic field is abelian.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.3; 0.2; ExplicitNumberFields §§0.5, 4.7,
4.9; ExplicitZetaBounds §0.3 (the negativity of `ζ` on `(0, 1)`).

**Checks.**

- *SmallQuadraticCentralValues* holds. For a nonprincipal `χ` the series `∑ χ(n) n^{−1/2}`
  converges to `L(1/2, χ)`, the sums of `χ` over intervals being bounded. With `q = d_F` and
  `M = 1000 q`, `q` divides `M` and `χ_F` sums to `0` over a period, so by Abel summation the tail
  beyond `M` is at most `B_q (M + 1)^{−1/2}`, `B_q` the largest `|∑_{n ≤ j} χ_F(n)|` for `j ≤ q`
  (`1, 1, 1, 2, 1, 2, 3, 1, 2` in the order of the discriminants above). The partial sums to `M`
  less these tails give the lower bounds `0.4565`, `0.6439`, `0.2176`, `1.1107`, `0.3625`,
  `1.0668`, `0.9534`, `0.4894` and `0.4220`, all positive. The record is the case of these nine
  characters of `PlattCentralRecord` (ExplicitZetaBounds §0.4b), which asks the same of every
  primitive character of conductor up to `2·10⁶`.
- The nine fields are needed for *QuadraticRealZeroGap* `(π/6)` (negative control): at `d_F ≤ 13`,
  `(π/6) √d_F ≤ (π/6) √13 = 1.888 < 2`, so a central zero would violate the condition there, and
  GeneralizedRiemannHypothesisFromWindowBounds §5.3 does not exclude one; three of them (`−3`, `−4`,
  `5`) are already zero-free on `(0, 1)` by ExplicitNumberFields' Checks of §0.5, the other six only
  by *SmallQuadraticCentralValues*.
- The lower end `2/√15` of the range of *QuadraticRealZeroGap* `c` is where these inputs stop: at
  `c < 2/√15` the
  condition at `ℚ(√−15)` asks `L(1/2, χ₋₁₅) ≠ 0`, which neither
  GeneralizedRiemannHypothesisFromWindowBounds §5.3 nor *SmallQuadraticCentralValues* provides.

### 4.3 The effective Chebotarev theorem for abelian fields (AnalyticNumberTheoryPartI §2.49)

*Origin:* published: the effective Chebotarev theorem under the extended Riemann hypothesis, with
the least prime of a Frobenius class (AnalyticNumberTheoryPartI §2.49), with its hypothesis supplied
by the main theorems.

For every finite Galois extension `L/F` with `L` abelian over `ℚ` and `n = [L:ℚ] > 1`, with
`D = |disc L|`, and every conjugacy class `C` of `Gal(L/F)`:
the error of §2.49(ii) is `O(x^{1/2} log(D x^n))` for
`x ≫ (log D)²`; and some unramified
degree-one prime of `F` with Frobenius class `C` has norm `≪ (log D)²` (§2.49(iii)).

Route: §2.49(ii)–(iii) with their hypothesis ERH(`L`) by 0.2.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2 (through 0.2); 0.2;
AnalyticNumberTheoryPartI §2.49.

**Checks.**

- `L = F = ℚ` is excluded by `n > 1`: there `D = 1` and `(log D)² = 0`; the degree-one field is
  §2.49's rational case, written with `max(1, log D)²`.

### 4.4 Abelian fields (ClassicalArithmeticCompletion §5.16a)

*Origin:* published: the explicit prime ideal theorem and the approximation of the residue of the
Dedekind zeta function under the extended Riemann hypothesis (ClassicalArithmeticCompletion
§5.16a), with its hypothesis supplied by the main theorems.

For every `K` abelian over `ℚ`, with `n = [K:ℚ]` and `Δ_K = |d_K|`:
`|ψ_K(x) − x| ≤ √x((log x/(2π) + 2) log Δ_K + (log² x/(8π) + 2) n)`
for every `x ≥ 100` (§5.16a(i)); and `|log κ_K − S_K(T)| ≤ ε_K(T)` for every `T ≥ 100` (§5.16a(ii)).

Route: §5.16a(i)–(ii) with `DedekindERH K` (§5.0) by 0.2 and `RiemannHypothesis`
by GeneralizedRiemannHypothesisFromWindowBounds §5.2.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; 0.2; ClassicalArithmeticCompletion
§5.16a.

### 4.5 Fields whose Hilbert class field is abelian over `ℚ` (ClassicalArithmeticCompletion §§5.0, 5.1b, 5.1c)

*Origin:* published: the bound `12 (log Δ_K)²` for the norms of prime ideals generating the class
group under the Riemann hypothesis, and the factor-base criterion (ClassicalArithmeticCompletion
§§5.0, 5.1b, 5.1c), with its hypothesis supplied by the main theorems for the fields whose Hilbert
class field is abelian over `ℚ`.

Let `K` be a number field whose Hilbert class field `H` is abelian over `ℚ`.
`χ.GeneralizedRiemannHypothesis` for every
`χ : RayClassCharacter (Modulus.one K)`, so for every character of `Cl(K)` read through
`TauCeti.GlobalNumberFields.oneEquivClassGroup` (§5.0); and
*NumberField.ExtendedRiemannHypothesis* `K`. Hence every nontrivial
character `χ` of `Cl(K)` has `χ([P]) ≠ 1` for some prime `P` with `N(P) ≤ 12 (log Δ_K)²`, and
`IsFactorBaseBound K (12 (log Δ_K)²)` (§5.1b); and the
factor-base criterion of §5.1c holds without its premise.

Route: `H = hilbertClassField K` is `rayClassField (Modulus.one K)`, for which `Modulus.one K` is
admissible (`isAdmissibleModulus_rayClassField`); so `abelianConductor K H` divides `Modulus.one K`
(`isAdmissibleModulus_iff_abelianConductor_dvd`) and equals it
(`TauCeti.GlobalNumberFields.Modulus.eq_one_of_dvd_one`). The map `Φ_{H/K}` of the Conventions is
therefore the ray-class Artin map at `Modulus.one K`, which is
`rayClassArtinEquiv (Modulus.one K) : RayClassGroup (Modulus.one K) ≃* Gal(H/K)`
(`rayClassArtinEquiv_apply`); on the class group it is `hilbertClassArtinEquiv K`
(`hilbertClassArtinEquiv_oneEquivClassGroup`) (ClassFieldTheory Layers 12–13). For
`χ : RayClassCharacter (Modulus.one K)` put `φ = χ.comp (rayClassArtinEquiv (Modulus.one K)).symm`;
then `χ = φ.comp Φ_{H/K}`, so `PrimitiveRayClassCharacter.of χ` is the `φ̃` of 0.3 for `L = H`,
with no comparison of dictionaries. 0.3 gives its hypothesis, and
RiemannHypothesisStatementsAndConsequences §9.5's
presented-versus-primitive clause gives `χ.GeneralizedRiemannHypothesis`. `K ⊆ H` is abelian over
`ℚ`, so 0.2 gives the hypothesis for `ζ_K`. These are the premises of §§5.1b and 5.1c, which §5.0
writes as `HeckeGRH χ` for the characters `χ` of `Cl(K)` and `DedekindERH K`, each the strip form
of the hypothesis here (RiemannHypothesisStatementsAndConsequences §9.5).

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2 (through 0.2, 0.3); 0.2, 0.3;
ClassFieldTheory Layers 12–13 (`abelianConductor`,
`isAdmissibleModulus_iff_abelianConductor_dvd`, `rayClassField`, `isAdmissibleModulus_rayClassField`,
`rayClassArtinEquiv`, `rayClassArtinEquiv_apply`, `hilbertClassField`, `hilbertClassArtinEquiv`,
`hilbertClassArtinEquiv_oneEquivClassGroup`); RiemannHypothesisStatementsAndConsequences §9.5;
ClassicalArithmeticCompletion §§5.0, 5.1b, 5.1c; Tau Ceti
`TauCeti.GlobalNumberFields.oneEquivClassGroup`,
`TauCeti.GlobalNumberFields.Modulus.eq_one_of_dvd_one`.

**Checks.**

- `K = ℚ(√−5)`: `h = 2` and `H = ℚ(√−5, i)`, abelian over `ℚ`; the theorem applies.
- `K = ℚ(√−23)`: `h = 3` and `H` has Galois group `S₃` over `ℚ`; the theorem does not apply, and
  the class-group characters of order `3` have L-functions that are not Dirichlet L-functions.

### 4.6 Residues and Mertens sums (ExplicitNumberFields §§3.5, 3.6)

*Origin:* published: the estimate of Schoenfeld (1976) for the sum of the reciprocals of the primes
under the Riemann hypothesis, the Mertens lemma and the two-sided bound for `κ_K` of Garcia and Lee
(2022), the explicit Duke short-sum theorem and the von Mangoldt–log sum (ExplicitNumberFields
§§3.5, 3.6), with its hypothesis supplied by the main theorems.

Write `M` for the Meissel–Mertens constant `TauCeti.LFunctions.mertensConstant ℚ` (the constant `B`
of ExplicitPrimeCounting §4.7); *SchoenfeldMertensSmallRange* for the proposition that
`|Σ_{p ≤ x} 1/p − log log x − M| < (3 log x + 4)/(8π√x)` for every real `x` with `13.5 ≤ x < 24.4`;
and *the Mertens hypotheses* for *GarciaLeeMertensSmallRange*, *SchoenfeldMertensSmallRange* and
the hypotheses under which 2.6 states its bound for `Σ_{p ≤ x} 1/p` (`ButheVerified`,
*LeeNosalMertensRange*, `ZetaZeroReciprocalSum`, *PsiThetaUpper* or the remaining hypotheses of
§3.7, `ZetaZeroCountLowRange`, `HiaryRecord`, `PatelRecord` and `YangRecord`).

- Schoenfeld's estimate
  `|Σ_{p ≤ x} 1/p − log log x − M| < (3 log x + 4)/(8π√x)` for every real `x ≥ 13.5`, given
  *SchoenfeldMertensSmallRange* and the hypotheses under which 2.6 states its bound for
  `Σ_{p ≤ x} 1/p`.
- Garcia–Lee's Mertens lemma (§3.5), given the Mertens
  hypotheses.
- The explicit Duke short-sum theorem (§3.5), given the Mertens hypotheses,
  for the record of every primitive Dirichlet character of conductor at least `3` (nontrivial, so
  its completion is entire) and for the quotient record `𝒬_K` of every `K` abelian over `ℚ` with
  `n ≥ 2`, whose *GRH* (ZerosOfLFunctions Layer 9) §3.5 derives from `DedekindERH K` (the
  Dedekind conjecture
  holding for Galois `K`).
- The von Mangoldt–log sum of §3.6, given
  *GGLMPsiSmallRange*, `ButheVerified`, `Schoenfeld1976Range` and Rosser's zero count (the
  hypotheses of Schoenfeld's `ψ` bound, 2.2, from which its route proceeds for `x ≥ 73.2`).
- Garcia–Lee's two-sided bound for `κ_K` (§3.6), for every
  `K` abelian over `ℚ` with `n ≥ 2`, given the Mertens hypotheses.

Route: GeneralizedRiemannHypothesisFromWindowBounds §5.2 for `RiemannHypothesis`; 0.1 for the
Dirichlet records, read as their *GRH* through the divisor form of
RiemannHypothesisStatementsAndConsequences §9.3; for abelian `K`, `DedekindERH K` by 0.2 and
*DedekindConjecture* `K` because `K` is Galois (ExplicitNumberFields §0.5). Schoenfeld's estimate:
for `x ≥ 24.4`, 2.6 bounds the left side by `3 log x/(8π√x)`, which is less than
`(3 log x + 4)/(8π√x)`; on `[13.5, 24.4)` it is *SchoenfeldMertensSmallRange*. ExplicitNumberFields
§3.5 proves Garcia–Lee's Mertens lemma, the bound `(3 log x + 4)/(8π√x) + 5/x²` for every
`x ≥ 1.048`, from Schoenfeld's estimate for `x ≥ 13.5` and *GarciaLeeMertensSmallRange* below
`13.5`; with the estimate proved here that route gives the lemma under the Mertens hypotheses. The
short-sum theorem uses the lemma in its route, and Garcia–Lee's two-sided bound uses the short-sum
theorem at `𝒬_K` and the lemma at `(log d_K)^{1/2}`; the von Mangoldt–log sum uses neither.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §5.2; 0.1, 0.2, 2.2, 2.6; ExplicitNumberFields
§§0.5, 3.5, 3.6; RiemannHypothesisStatementsAndConsequences §9.3; Tau Ceti
`TauCeti.LFunctions.mertensConstant`.

**Checks.**

- *SchoenfeldMertensSmallRange* is a computation with the primes up to `23`. Between consecutive
  primes the left side, `Σ_{p ≤ x} 1/p − log log x − M`, is positive and falls at the rate
  `1/(x log x)`, faster than the bound, whose derivative is `(2 − 3 log x)/(16π x^{3/2})`; so the
  proposition is the four inequalities at `x = 13.5, 17, 19, 23`: `0.125980 < 0.127871`,
  `0.099937 < 0.120624`, `0.114062 < 0.117145` and `0.094672 < 0.111227` (`M = 0.2614972…`). Just
  below `24.4` the left side is `0.076002`.
- The interval is needed: 2.6's bound `3 log x/(8π√x)` does not hold below `24.4`; at `x = 23`
  the left side is `0.094672` and `3 log 23/(8π√23) = 0.078041`.

### 4.7 Chebotarev and the least prime ideal (ExplicitNumberFields §§7.2, 7.4)

*Origin:* published: the explicit Chebotarev theorem of Grenié and Molteni (2019) and the least
prime ideal of Bach and Sorenson (1996) under the Riemann hypothesis (ExplicitNumberFields §§7.2,
7.4), with its hypothesis supplied by the main theorems for the extensions inside fields abelian
over `ℚ`.

For every Galois extension `L/K` with `L` abelian over `ℚ`, each given *GrenieMolteniSmallCases*,
`ButheVerified`, `Schoenfeld1976Range`, `Buthe2016Range` and Rosser's zero count (the last, with
the first two, for Schoenfeld's `ψ` bound of 2.2, which the route of §7.2 takes at `L = ℚ` for
`x > 73.2`): Grenié–Molteni's bound for `ψ_C` (§7.2, Theorem 1.1); its corollary for `π_C`
(Corollary 1.2); and the
prime ideal theorem of §7.2's case `L = K` for every `x ≥ 1` (4.4 has it for `x ≥ 100`), for `K`
abelian over `ℚ`. And, for `L ≠ ℚ`,
Bach–Sorenson's prime `𝔭` of `K` with Frobenius class `C`,
unramified in `L`, of rational prime norm `N𝔭 ≤ (4 log d_L + 2.5 n_L + 5)²` (§7.4).

Route: §§7.2 and 7.4 with `DedekindERH L` by 0.2. §7.4 states its
hypothesis as *GRH* (ZerosOfLFunctions Layer 9) for the Hecke L-functions; read as the
hypothesis for the Hecke characters of the abelian extensions `L/E`, `K ⊆ E ⊆ L`, that the
argument uses, it is 0.3 for each `L/E`, `L` being abelian over `ℚ`. Either reading is covered.

*Needs:* GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2 (through 0.2, 0.3, 2.2); 0.2, 0.3,
2.2; ExplicitNumberFields §§7.2, 7.4.

### Examples

The computed lower bounds for `L(1/2, χ_F)` at the nine quadratic fields with `d_F ≤ 13` are
positive, the least being `0.2176`, at the discriminant `5` (4.2). Schoenfeld's small range of 4.6
is the four inequalities at `x = 13.5, 17, 19, 23`. For `K = ℚ(√−5)` the Hilbert class field
`ℚ(√−5, i)` is abelian over `ℚ` and 4.5 applies; for `K = ℚ(√−23)` it has Galois group `S₃` over
`ℚ` and 4.5 does not apply.

### Dependencies

GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3; 0.1, 0.2, 0.3; 1.1; 2.2, 2.6;
RiemannHypothesisStatementsAndConsequences §§9.3, 9.5, 9.7; ZerosOfLFunctions Layer 9;
AnalyticNumberTheoryPartI §2.49; ClassicalArithmeticCompletion §§5.0, 5.1b, 5.1c, 5.16a;
ExplicitNumberFields §§0.5, 3.5, 3.6, 4.7, 4.9, 7.2, 7.4; ExplicitZetaBounds §§0.3, 0.4b;
ExplicitPrimeCounting §4.7; ClassFieldTheory Layers 12 and 13; Tau Ceti's class-group
equivalence, moduli, Mertens constant and class number formula of imaginary quadratic fields.

## Scope and ownership

The main theorems are proved in GeneralizedRiemannHypothesisFromWindowBounds, and the conditional
theorems are stated in the roadmaps named in the headings. This roadmap joins the two: each target
is a conditional theorem with the hypotheses that the main theorems give removed.

### Owned here

- the unconditional statements of Layer 0: the hypothesis for the completed L-functions of
  primitive Dirichlet characters, the extended Riemann hypothesis for fields abelian over `ℚ`, the
  Riemann hypothesis for the Hecke characters of 0.3 and for the norm-composed characters, and the
  hypotheses and records of other roadmaps that the main theorems give;
- the statements of Layers 1–4, including Schoenfeld's Mertens estimate from `13.5`, given the
  finite range *SchoenfeldMertensSmallRange*, which 4.6 states as a hypothesis; the records
  *JohnstonInitialRanges*, the initial ranges of Johnston's bounds at the constant `1`, and
  *SmallQuadraticCentralValues*, the nonvanishing of `L(1/2, χ_F)` at the nine quadratic fields with
  `d_F ≤ 13`, which 2.3 and 4.2 state and take as hypotheses; the record
  *ZetaZeroReciprocalLowRange*, which the Conventions state and the statements take as a
  hypothesis; the proposition *RamareRumelyRows*, in which 3.2 states the tabulated rows of
  Ramaré–Rumely and Dusart as a hypothesis; the record *RamareSaouterGapRange*, which 2.9 states
  and takes as a hypothesis; and the derivations of the instances of the general
  estimates of ExplicitPrimeCounting §§3.1(c) and 7.3, and of its intervals of §§7.1, 7.2 and 7.5,
  from the bounds of 2.3 and 2.8 (2.4, 2.5, 2.9), and of the cyclotomic least-prime bound
  from the headline of 3.3.

### Consumed, not redefined

- the main theorems: GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3;
- `ZeroFreeRightOf` and the Riemann-hypothesis predicates of records, of Dirichlet characters, of
  Dedekind zeta functions and of ray-class characters, with their equivalent forms:
  RiemannHypothesisStatementsAndConsequences §§9.2–9.5; for one character the Riesz remainder:
  RiemannHypothesisStatementsAndConsequences §8.4a; the bound under a zero-free half-plane and the
  other consequences: RiemannHypothesisStatementsAndConsequences §§9.6–9.9;
- the continued Dedekind zeta and Hecke L-functions, primitive ray-class characters and the
  Dirichlet records: LFunctions Layers 3–8; the bundled primitive Dirichlet characters and the
  rational dictionary: RiemannHypothesisStatementsAndConsequences §§10.3, 11.1; for a primitive
  Dirichlet character, the equivalence of the hypothesis on its completed function with
  zero-freeness of its L-function right of `1/2`: ZerosOfLFunctions §9.1;
- the one-dimensional comparison of Artin and Hecke characters: AnalyticNumberTheoryPartI §2.18a;
  the factorization of the Dedekind zeta function of a field abelian over `ℚ` into Dirichlet
  L-functions: AnalyticNumberTheoryPartI §2.42; the reciprocity dictionary: ZerosOfLFunctions §8.8;
  the independence of its primitive characters: RiemannHypothesisStatementsAndConsequences §8.8;
  the Frobenius normalization, the ray-class Artin map at the conductor, Kronecker–Weber and the
  Hilbert class field: ClassFieldTheory C.6, Layers 12–13; the norm-composed characters with their
  base-change factorization, the characters of abelian extensions of `ℚ` as norm-composed
  characters, and the clauses of `ZeroFreeRightOf` on germs, products and presented characters:
  QuasiRiemannHypothesis §§1.1, 5.4, 5.4a;
- the negativity of `ζ` on `(0, 1)`: ExplicitZetaBounds §0.3, its case `q = 1`;
- the statements that the targets cite, in their form under the hypothesis that the main theorems
  prove: the roadmap named in each heading.

### Not owned here

- the main theorems and their proof: GeneralizedRiemannHypothesisFromWindowBounds, from whose
  §§5.1–5.3 this roadmap cites them;
- the Riemann hypothesis for Dedekind zeta functions of fields not abelian over `ℚ`, for
  ray-class characters not of the form of 0.3, and for Artin, automorphic and Rankin–Selberg
  L-functions: no roadmap here proves them, and no target removes them;
- nonvanishing at the central point, simplicity of zeros, the Dedekind conjecture and every
  numerical record; so the explicit zero count of
  ExplicitZetaBounds §5.3, whose only hypothesis
  is such a record, Rosser's bound for `N(T)` below the height `1467` (its records
  `ZetaZeroFreeUpTo 14` and `ZetaArgumentBoundUpTo 6800000 2`), the reciprocal-zero records, the
  smoothed approximation of `log κ_K` and the bounds of
  Garcia–Grenié–Lee–Molteni and Palojärvi–Simonič (ExplicitNumberFields §3.6), which need
  `ζ_K(1/2) ≠ 0`, and the theta clause of `ModEightFiniteInput`, are not proved here and keep
  their hypotheses;
- the equivalence between the extended Riemann hypothesis of a field abelian over `ℚ` and the
  hypothesis for the Dirichlet characters of its zeta function (AnalyticNumberTheoryPartI §2.42),
  the equivalence between the hypothesis on the completed and on the uncompleted L-function of a
  primitive Dirichlet character (ZerosOfLFunctions §9.1), and the base-change factorization of the
  norm-composed characters with the identification of the characters of abelian extensions of `ℚ`
  as norm-composed characters (QuasiRiemannHypothesis §§5.4, 5.4a): this roadmap applies them in
  0.1, 0.2 and 0.3;
- the general unconditional estimates of ExplicitPrimeCounting from which its instances come, the
  explicit formula smoothed with split heights of its §3.1(c) and the positivity criterion for
  primes in short intervals of its §7.3, with the table propositions that evaluate them: this
  roadmap states the instances by other routes and does not state the estimates.

## Exact supplier contracts

### From Mathlib

- `RiemannHypothesis`, `riemannZeta`, `riemannZeta_ne_zero_of_one_le_re` (1.4);
- `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction` (0.1),
  `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.IsPrimitive`;
- `meromorphicOrderAt`; `Chebyshev.psi`, `Chebyshev.theta` (2.3); `MulChar.IsQuadratic`;
  `CyclotomicField`, `IsAbelianGalois` (0.2);
- `polynomialFunctions_closure_eq_top` (Weierstrass approximation on `[a, b]`) and
  `AnalyticOnNhd.sum_divisor_le` (Jensen's inequality: the zeros, with multiplicity, of a function
  analytic on a closed disc, bounded by `M ≥ 1` on its boundary and nonzero at its centre) (1.6).

### From Tau Ceti

- `TauCeti.primePsi`, `TauCeti.IdealArithmeticFunction.vonMangoldt` (Conventions, 2.1, 4.4);
- `TauCeti.GlobalNumberFields.RayClassCharacter.induced` (the pullback of a ray-class character
  of modulus `𝔪` to a multiple `𝔫` of `𝔪` along the transition map
  `RayClassGroup 𝔫 → RayClassGroup 𝔪`, evaluated by `RayClassCharacter.induced_apply`) and
  `TauCeti.GlobalNumberFields.RayClassGroup.hom_ext` (two homomorphisms out of `RayClassGroup 𝔪`
  whose composites with `idealClass 𝔪` agree, that is which agree on the classes of all integral
  ideals prime to `𝔪`, are equal) (the Checks of 0.3);
- `TauCeti.GlobalNumberFields.oneEquivClassGroup` and
  `TauCeti.GlobalNumberFields.Modulus.eq_one_of_dvd_one` (4.5);
- `TauCeti.LFunctions.mertensConstant` (the Mertens constant of a number field; over `ℚ` the
  Meissel–Mertens constant) (4.6);
- `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne` (the class number formula
  `h = √|D| L(1, χ_D)/π` of an imaginary quadratic field of discriminant `D ≠ −3, −4`) and
  `TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantCharCast` (`χ_D` is primitive of
  conductor `|D|`) (4.1).

### From GeneralizedRiemannHypothesisFromWindowBounds, a sub-roadmap of RiemannHypothesisForDirichletLFunctions

- §5.1: `meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`, that is
  `χ.GeneralizedRiemannHypothesis` for every `N` with `NeZero N` and every
  `χ : DirichletCharacter ℂ N`, with the forms in which other roadmaps write it: `DirichletGRH χ`
  and `GRH` of AnalyticNumberTheoryPartI §1.6 and `GRHMod q` of ExplicitNumberFields §0.5 (0.1–0.3,
  0.5, 0.6, 1.1, 1.2, 1.4, 1.5, 2.1, 3.1–3.5, and through 0.2, 0.3, 1.1 and 1.4 in the sections
  that cite those).
- §5.2: `riemannHypothesis` (0.1, 0.2, 0.6, 1.1, 1.2, 1.6, 2.1, 2.2, 2.5–2.8, 4.4, 4.6, and
  through 0.2, 0.6, 1.2 and 2.2 in the sections that cite those).
- §5.3: the value and strip forms, `LFunction_ne_zero_of_one_half_lt_re`,
  `re_eq_half_of_LFunction_eq_zero` and `riemannZeta_ne_zero_of_one_half_lt_re`, with the strip form
  of `riemannZeta` (0.7, 0.8, 1.4, 1.5, 2.4, 3.2, 4.2, and through 1.4 in 2.9).

### From TauCetiRoadmap.ZerosOfLFunctions

- §6.3: *IsExceptionalZero* (for 0.5); §6.4a: the completed function
  `q^(s/2) · χ.completedLFunction s` of the record of a primitive `χ` (for 0.1); §8.8: the
  reciprocity dictionary (Conventions, for 0.3 and 2.1); Layer 9: *GRH* for the records (0.5, 4.6,
  4.7); §9.1: for a primitive Dirichlet character, the equivalence of the hypothesis on Mathlib's
  completed function with zero-freeness of its L-function right of `1/2` (0.1).

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of RiemannHypothesisForDirichletLFunctions

- §8.4a (b): *PrimitiveRayClassCharacter.rieszRemainder* `ψ` and
  `PrimitiveDirichletCharacter.rieszRemainder`, their agreement over `ℚ` (Conventions, 0.5).
- §8.8: *PrimitiveRayClassCharacter.of_comp_dictionary_eq*, the independence of the primitive
  characters `PrimitiveRayClassCharacter.of (ψ ∘ Φ)` from the dictionary (Conventions, for 0.3 and
  2.1).
- §9.2: `ZeroFreeRightOf`.
- §9.3: *AnalyticLFunctionData.GeneralizedRiemannHypothesis*, the `ζ` bridge
  (`riemannZetaData.GeneralizedRiemannHypothesis ↔ RiemannHypothesis`), the divisor form (0.1,
  0.5, 4.6).
- §9.4: `DirichletCharacter.GeneralizedRiemannHypothesis` (Conventions, 0.2).
- §9.5: *NumberField.ExtendedRiemannHypothesis*, *RayClassCharacter.GeneralizedRiemannHypothesis*;
  the strip forms (0.2, 0.3, 4.5); presented and primitive (2.1, 4.5); the records (0.5); the
  rational bullet (0.5, 1.1, 1.2, 3.1).
- §9.6: (a) exceptional zeros, (c) the remainder under a zero-free half-plane, the Check on zero
  counts (0.5).
- §§9.7, 9.8: discharged in 1.1, 1.2, and through 1.1 the lower bound for `L(1, χ)` in 4.1. §9.9:
  the conditional prime counts, discharged in 2.1, and at the modulus `(q)∞` for `ψ(x; a, q)` in
  3.1.
- §10.3: `PrimitiveDirichletCharacter` (Conventions).
- §11.1: *PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter* (Conventions, 0.5).

### From TauCetiRoadmap.LFunctions

- Layer 3: `dedekindZetaC K`.
- Layer 4: the record `dirichletData χ hχ`, with its meromorphic continuation and functional
  equation (0.1).
- Layer 5: `PrimitiveRayClassCharacter K`, `PrimitiveRayClassCharacter.of`,
  `PrimitiveRayClassCharacter.of_induced` (a character and the character it induces at a multiple
  of its modulus have the same primitive character; the Checks of 0.3), `heckeLFunctionC`.
- Layer 8: the ideal von Mangoldt function (Conventions).

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.18a: the one-dimensional comparison: the Artin L-function of a character `φ` is the
  L-function of the Hecke character attached to `φ` by reciprocity, with value `φ(Frob_𝔭)` at the
  unramified primes `𝔭` (Conventions).
- §2.42: for `K ⊆ ℚ(ζ_f)` abelian, `ζ_K = ∏_χ L(s, χ*)` as meromorphic functions over the
  characters modulo `f` trivial on the subgroup fixing `K`, and the equivalence of
  ERH(`K`), every zero of `ζ_K` with `0 < Re s < 1` on `Re s = 1/2`, with `RiemannHypothesis` and
  `DirichletGRH χ` for the nontrivial ones (for 0.2).
- §1.6: `DirichletGRH χ` (for 0.2, through the equivalence of §2.42).
- §0.34: `landau_siegel_exclusion`, whose constant 1.5 makes explicit.
- §§0.16, 1.9(i), 1.9(ii), 2.49: discharged in 0.8, 2.1, 3.1 and 4.3.

### From TauCetiRoadmap.ClassFieldTheory

- C.6: arithmetic Frobenius; the Artin symbol of `(ℓ)` on `ℚ(ζ_m)` sends `ζ_m` to `ζ_m^ℓ` (the
  Checks of 0.3).
- Layer 12: `abelianConductor`, `isAdmissibleModulus_abelianConductor`,
  `isAdmissibleModulus_iff_abelianConductor_dvd`, `rayClassArtinMap` with
  `rayClassArtinMap_surjective` and the splitting law `rayClassArtinMap_idealClass` (Conventions,
  0.3, 4.5).
- Layer 13: `kroneckerWeber` (for 0.2); `rayClassField`, `isAdmissibleModulus_rayClassField`,
  `rayClassArtinEquiv`, `rayClassArtinEquiv_apply`, `hilbertClassField K`, `hilbertClassArtinEquiv`,
  `hilbertClassArtinEquiv_oneEquivClassGroup` (for 4.5).

### From TauCetiRoadmap.ExplicitZetaBounds

- §0.3, its case `q = 1`: `riemannZeta s < 0` for real `0 < s < 1`, with no
  record (for 4.2).
- §§0.2, 0.4, 0.4b, 2.9, 7.2–7.6, 7.9, 7.10, 8.1, 8.3–8.5, 9.3: the statements discharged in
  0.6, 0.7 and 1.3–1.5; §0.2's law `(∀ H, GRH(q, H)) ↔ DirichletGRH χ` for every primitive `χ`
  modulo `q` (0.6); the definitions of `PlattRecord` through `plattHeight` (§§0.3, 0.4b), of
  `LuZamanZhaoRecord` (§0.4b, a quadratic character being nonprincipal) and of
  *HasLandauSiegelGap* with its antitonicity (§7.9), from which 0.7 and 1.5 derive them;
  §2.9's relation `N(T) = ϑ(T)/π + 1 + S(T)` and its bracket for `ϑ` (1.3); and Hoffstein's
  lemma of §9.3 (for 0.7).
- §7.3a: *ClassicalZeroFreeRegion*; §8.3a: *ZetaZeroDensityBound* (1.4(d)).
- §0.4, the records `ZetaZeroFreeUpTo 14` and `ZetaArgumentBoundUpTo 6800000 2`, and §5.2, Rosser's
  bound `|N(T) − M(T)| ≤ 0.137 log T + 0.443 log log T + 1.588` for every `T ≥ 2` under them
  (`zetaZeroCountBound_rosser_of_recorded`) and for `T ≥ 1467` with no record: *Rosser's zero
  count* of the Conventions, carried by the statements of 2.2–2.5, 2.8, 2.9, 3.2, 3.3, 4.6 and 4.7
  whose routes count the zeros of `ζ` at low heights; and Rosser's bound from `1467` with no
  record, which with `ZetaZeroCountLowRange` gives the count in the reciprocal-zero records' route.
- §0.2, the passage to imprimitive characters (an imprimitive character has the zeros of its
  primitive character in `0 < Re s < 1`), and §5.3, the explicit zero count for primitive
  Dirichlet L-functions of conductor `k > 1`, given *BennettMartinOBryantRechnitzerRecord*: with
  Rosser's zero count for the conductor `1`, *the Dirichlet zero counts* that the routes of 3.2
  and 3.3 sum over the characters modulo `q`, which those statements carry.

### From TauCetiRoadmap.ExplicitPrimeCounting

- §1.2 (`GRH*`), §§2.2, 2.3, 2.5, 2.6, 3.1, 3.4–3.6, 4.7, 6.1, 6.3, 6.5, 6.6, 7.1–7.3, 7.5: the
  statements and the zero inputs discharged in 0.6, 2.2–2.6, 2.8, 2.9, 3.2 and 3.3; §3.7: its
  hypotheses and its discharge of *PsiThetaUpper* (Conventions); §§1.7, 6.7(a): *RealZeroGap* and
  the premise discharged in 1.5.
- The named propositions that the routes of those statements use besides their lists
  (Conventions): §0.1, `MVDiagonalFiniteRange` and `BrunTitchmarshFiniteRange`, under which
  `brun_titchmarsh` is proved; §1.1, *FioriKadiriSwidinskyZeroSums*, and `ZetaZeroReciprocalSum`
  and `ZetaZeroCountLowRange`, which with *ZetaZeroReciprocalLowRange* (stated in the Conventions)
  are *the reciprocal-zero records* of §2.1's two-sided bound for
  `∑_{0 < γ ≤ T} 1/γ` (`T ≥ 4πe`), which bounds the term `s₁` of §3.1(d); §2.1, that bound, whose
  finite-height part the Conventions derive from the three records; §1.3, `ButheVerified` and
  `Buthe2016Range`; §2.1, *CullyHugillJohnstonTable* at its row `(40, 1/2, 0.48, 6.431)`; §3.1,
  *ZeroCountBound* at Rosser's triple `0.137 0.443 1.588 0 2`, the bound that Rosser's zero count
  gives.
- §2.3, the four bounds of Büthe and Johnston, from which 2.3 derives Johnston's Theorem 4.1 at
  every `a ≥ 1`, with the record *JohnstonInitialRanges* of its initial ranges, without
  *JohnstonTable*; §6.1, the rows
  of *RamareRumelyTable1* and *Dusart2002Table*, which 3.2 states as *RamareRumelyRows*, the
  implication from `GRH*(k, H)` for every `H` to each row, and not through the general shape.
- §§3.4, 7.1–7.3, 7.5: the statements of 2.4's third item and of 2.9, as statements (their
  bounds, intervals, rows and thresholds); 2.4 and 2.9 prove them from 2.3 and 2.8 and use
  neither the general estimates of §§3.1(c) and 7.3 nor *FaberKadiriTable*, *KadiriLumleyTable*,
  *CullyHugillLeeTable*, *RamareSaouterTable* or *DusartThesisTable*. §1.3: *TrudgianRange*,
  *MossinghoffTrudgianRange* and `Schoenfeld1976Range` (its interval of Theorem 12 on
  `2 010 759.9 < x ≤ 10⁸`); §1.4: `PrimeGapLogSquareVerified`. §3.5: the criterion for Ramanujan's
  inequality from two-sided five-term bounds (2.5). §6.5: the size of the cyclotomic discriminant,
  `log |disc ℚ(ζ_q)| ≥ (φ(q)/2) log(q/2)` for every `q ≥ 1` (3.3).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

- §§5.0, 5.1b, 5.1c, 5.16a: the statements discharged in 4.4, 4.5, and the predicates
  `DedekindERH K` and `HeckeGRH χ` of §5.0 in which they are stated.

### From TauCetiRoadmap.ErdosProgressionPowers

- §0.9: its copy of `ModEightFiniteInput`; §§2.3, 2.6 and the headline theorems
  `character_family`, `effective_prime_bound`, `fixed_length_finiteness`, which carry it (0.8).

### From TauCetiRoadmap.QuasiRiemannHypothesis

- §1.1: the clauses of `ZeroFreeRightOf` on germs, on products and factors analytic and nonzero,
  and on a ray-class character and its primitive character (0.3).
- §5.4: the norm-composed character `χ ∘ N_{K/ℚ}` and the base-change factorization
  `L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)` (0.3, 0.4).
- §5.4a: for `K` abelian over `ℚ`, the characters `φ̃` of the abelian extensions `L/K` with `L/ℚ`
  abelian are exactly the primitive characters of the norm-composed characters of `K` (0.3).
- §§11.2, 11.3: discharged in 3.4.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §2.9: `SieveApplications.leastNonresidue` and `SieveApplications.linnik_exceptional` (3.4).

### From TauCetiRoadmap.ExplicitNumberFields

- §§0.5 (`GRHMod`, *QuadraticRealZeroGap*, *ImaginaryQuadraticRealZeroGap*,
  *UniformQuadraticZeroGap*, the Dedekind conjecture for Galois fields), 3.5, 3.6, 4.7, 4.9, 6.4,
  7.2, 7.4, and *DGLSWSmallFieldGRH* of its list of computational hypotheses before §0.1: the
  statements discharged in 3.5, 4.2, 4.6 and 4.7; of 4.7 also its consequence at `c₈ = π/6`,
  `κ_K > 0.0014480/(n · t_K · d_K^{1/n})` (4.2).
- §3.5: the route of Garcia–Lee's Mertens lemma from Schoenfeld's estimate for `x ≥ 13.5` and
  *GarciaLeeMertensSmallRange* below; 4.6 supplies the estimate.

### From TauCetiRoadmap.ExplicitMultiplicativeFunctions

- §§0.7, 1.9, 8.1: discharged in 2.7.

### From TauCetiRoadmap.WeilPositivityAndLiCriterion

- §§3.2, 4.2: `liCoeff_pos_of_riemannHypothesis`, `liGramMatrix_posDef_of_riemannHypothesis`,
  discharged in 1.6.
- §§1.1, 5.1, 5.2: `zetaZeroMult` and the bridge between `RiemannHypothesis` and the zeros (its
  §1.1); the test functions, `ĝ = mellin g`, `weilForm` and the summability of its family (its
  §5.1); the statement of `weilForm_pos_of_riemannHypothesis` (its §5.2), which 1.6 proves with a
  route of its own.

## References

- H. Davenport, *Multiplicative Number Theory*, third edition, revised by H. L. Montgomery,
  Graduate Texts in Mathematics 74 (2000), chapter 9: the functional equation of `L(s, χ)` for
  primitive `χ` and the completed function; chapter 12: the zeros of the completed function (0.1).
- H. Heilbronn, *Zeta-functions and L-functions*, in J. W. S. Cassels and A. Fröhlich (eds.),
  *Algebraic Number Theory*, Academic Press (1967), chapter VIII, 204–230: the factorization of the
  Dedekind zeta function of an abelian extension into Hecke L-functions (0.2, 0.3, 0.4, through
  AnalyticNumberTheoryPartI §2.42 and QuasiRiemannHypothesis §5.4).
- J. S. Milne, *Class Field Theory*, v4.03 (2020), chapter V: the Artin map of `ℚ(ζ_m)/ℚ` and its
  behaviour under the norm (Example 3.2 and Proposition 3.3, p. 157) (0.3, through
  QuasiRiemannHypothesis §5.4a).
- A. E. Ingham, *The Distribution of Prime Numbers*, Cambridge Tracts in Mathematics and
  Mathematical Physics 30 (1932), chapters III–IV: the bound for `ψ(x) − x` under a zero-free
  half-plane, which GeneralizedRiemannHypothesisFromWindowBounds §3.2 adapts to the remainder of a
  weighted family of characters (0.5).
- David Platt, *Numerical computations concerning the GRH*, Mathematics of Computation 85 (2016);
  doi:10.1090/mcom/3077, arXiv:1305.3087v1, Theorem 7.1: the verification behind `PlattRecord`
  (0.7, through ExplicitZetaBounds §0.4b).
- Rick F. Lu, Asif Zaman and Haonan Zhao, *Numerical computations concerning Landau-Siegel zeros*
  (2026); doi:10.1090/mcom/4268, arXiv:2602.03626v2, Theorem 1.1 and Corollary 1.3: the
  verification behind `LuZamanZhaoRecord` and the lower bound `L(1, χ) ≥ 1/(8 log q)` (0.7, through
  ExplicitZetaBounds §§0.4b, 9.3).
- J. Hoffstein, *On the Siegel–Tatuzawa theorem*, Acta Arithmetica 38 (1980/81), 167–174;
  doi:10.4064/aa-38-2-167-174, Lemma 1, as Lu, Zaman and Zhao quote it: the lower bound for
  `L(1, χ)` of a real primitive character from a zero-free interval (0.7, through ExplicitZetaBounds
  §9.3).
- J. E. Littlewood, *On the class-number of the corpus `P(√−k)`*, Proc. London Math. Soc. (2) 27
  (1928): the bounds `(C log log q)⁻¹ ≪ L(1, χ) ≪ log log q` under the Riemann hypothesis for `χ`
  (1.1, 4.1, through RiemannHypothesisStatementsAndConsequences §9.7(ii)(d)).
- Kevin Ford, *Zero-free regions for the Riemann zeta function*, in *Number Theory for the
  Millenium* (Urbana, IL, 2000) (M. A. Bennett, B. C. Berndt, N. Boston, H. G. Diamond,
  A. J. Hildebrand and W. Phillip, eds), vol. II (2002), 25–56; arXiv:1910.08205v5, Theorems 3 and
  5: the regions of ExplicitZetaBounds §§7.2 and 7.6 (1.4).
- H. Kadiri, *Une région explicite sans zéros pour les fonctions L de Dirichlet*, thèse de doctorat
  (2002), Théorème 11.1: the region for the product of the L-functions modulo `q` of
  ExplicitZetaBounds §7.5 (1.4).
- Habiba Kadiri, *Une region explicite sans zero pour la fonction Zeta de Riemann*, Acta Arith. 117
  (2005), no. 4, 303–339; doi:10.4064/aa117-4-1, arXiv:math/0401238v1, Théorème 1.1: the classical
  region with `R₀ = 5.69693` stated in ExplicitZetaBounds §7.3 (1.4).
- Habiba Kadiri, *A zero density result for the Riemann zeta function*, Acta Arith. 160 (2013),
  185–200; arXiv:1401.4781v1, Theorem 1.1 and Table 1: the density bound of ExplicitZetaBounds §8.1
  (1.4).
- Habiba Kadiri, *An explicit zero-free region for the Dirichlet L-functions*, Mathematika 64
  (2018), no. 2, 445–474; arXiv:math/0510570v2, Theorem 1.1: the region `LFunction_ne_zero_kadiri`
  of ExplicitZetaBounds §7.5 (1.4).
- K. S. McCurley, *Explicit zero-free regions for Dirichlet L-functions*, Journal of Number Theory
  19 (1984), 7–32; doi:10.1016/0022-314X(84)90089-1, Theorem 1: the region
  `LFunction_zeroFree_mcCurley` of ExplicitZetaBounds §7.5 (1.4).
- Xian-Jin Li, *The positivity of a sequence of numbers and the Riemann hypothesis*, J. Number
  Theory 65 (1997): Li's criterion (1.6, through WeilPositivityAndLiCriterion §3.2).
- A. Weil (1952): the positivity criterion (1.6, through WeilPositivityAndLiCriterion §5.2).
- L. Schoenfeld, *Sharper bounds for the Chebyshev functions θ(x) and ψ(x). II*, Math. Comp. 30
  (1976): Theorem 10 and Corollary 1, the bounds for `ψ`, `θ` and `π` under the Riemann hypothesis
  (2.2, through ExplicitPrimeCounting §2.2), and the short interval that follows from them (2.8,
  through ExplicitPrimeCounting §2.5); Theorem 12, the interval `(x, x + x/16597)` (2.9, through
  ExplicitPrimeCounting §7.1); Corollary 2, the estimate for the sum of the reciprocals of the
  primes (4.6, through ExplicitNumberFields §3.5).
- E. S. Lee and P. Nosal, *Sharper bounds for the error in the prime number theorem assuming the
  Riemann Hypothesis*, J. Number Theory 283 (2026), arXiv 2312.05628, Theorems 1.1 and 1.2: the
  bounds for `ψ` and `θ` under the Riemann hypothesis (2.2, through ExplicitPrimeCounting §2.2).
- J. Büthe, *Estimating π(x) and related functions under partial RH assumptions*, Math. Comp. 85
  (2016), Theorem 2: the bounds from the Riemann hypothesis verified up to a height (2.3, through
  ExplicitPrimeCounting §2.3).
- D. R. Johnston, *Improving bounds on prime counting functions by partial verification of the
  Riemann hypothesis*, Ramanujan J. 59 (2022), arXiv 2109.02249, Theorems 3.2 and 4.1: the same
  bounds under a weaker condition on the height, and weaker bounds on a wider range (2.3, through
  ExplicitPrimeCounting §2.3).
- L. Faber and H. Kadiri, *New bounds for ψ(x)*, Math. Comp. 84 (2015), with its corrigendum, Math.
  Comp. 87 (2018), Corollary 1.2: the bound `|ψ(x) − x| ≤ 5.3688·10⁻⁴ x` for `x ≥ e²⁰` (2.4,
  through ExplicitPrimeCounting §3.4).
- T. Trudgian, *Updating the error term in the prime number theorem*, Ramanujan J. 39 (2016),
  Theorems 1 and 2 and Lemma 1: the bounds for `ψ`, `θ` and `π` and the region behind them (2.4,
  through ExplicitPrimeCounting §3.4).
- M. J. Mossinghoff and T. S. Trudgian, *Nonnegative trigonometric polynomials and a zero-free
  region for the Riemann zeta-function*, J. Number Theory 157 (2015), 329–349, arXiv 1410.3926v1,
  §7, Corollary 1: the bound for `θ` (2.4, through ExplicitPrimeCounting §3.4).
- D. Platt and T. Trudgian, *The error term in the prime number theorem*, Math. Comp. 90 (2021),
  Theorem 1 and Corollary 1: the bounds for `ψ`, `θ` and `π` at the rows of *PlattTrudgianTable*
  (2.4, through ExplicitPrimeCounting §3.4).
- A. Fiori, H. Kadiri and J. Swidinsky, *Sharper bounds for the error term in the prime number
  theorem*, Res. Number Theory 9 (2023), article 63, arXiv 2206.12557: the bound for `π` (2.4,
  through ExplicitPrimeCounting §3.4).
- A. Fiori, H. Kadiri and J. Swidinsky, *Sharper bounds for the Chebyshev function ψ(x)*, J. Math.
  Anal. Appl. 527 (2023) 127426, arXiv 2204.02588: the bounds for `ψ` and the density
  *FioriKadiriSwidinskyDensity* (2.4, through ExplicitPrimeCounting §3.4).
- D. R. Johnston and A. Yang, *Some explicit estimates for the error term in the prime number
  theorem*, J. Math. Anal. Appl. 527 (2023), Theorem 1.1, Corollaries 1.2–1.3 and Theorem 1.4: the
  bounds for `ψ`, `θ` and `π` from the classical and the Vinogradov–Korobov regions (2.4, through
  ExplicitPrimeCounting §§3.4, 3.6).
- A. W. Dudek and D. J. Platt, *On solving a curious inequality of Ramanujan*, Exp. Math. 24 (2015),
  Theorem 1.3 and Lemma 2.1: Ramanujan's inequality under the Riemann hypothesis and the criterion
  behind it (2.5, through ExplicitPrimeCounting §3.5).
- C. Axler, *Effective estimates for some functions defined over primes*, Integers 24 (2024), A34,
  arXiv 2203.05917: the bounds for `π(x)` (2.5, through ExplicitPrimeCounting §3.5).
- A. W. Dudek, *On the Riemann hypothesis and the difference between primes*, Int. J. Number
  Theory 11 (2015), Theorem 2: the interval `(x − (4/π) √x log x, x]` under the Riemann hypothesis
  (2.8, through ExplicitPrimeCounting §2.5; 2.9).
- O. Ramaré and Y. Saouter, *Short effective intervals containing primes*, J. Number Theory 98
  (2003): the interval `(x − (8/5) √x log x, x]` under the Riemann hypothesis (2.8, through
  ExplicitPrimeCounting §2.5) and the intervals of ExplicitPrimeCounting §7.2 (2.9).
- E. Carneiro, M. B. Milinovich and K. Soundararajan, *Fourier optimization and prime gaps*,
  Comment. Math. Helv. 94 (2019), Theorem 5: the interval `[x, x + (22/25) √x log x]` under the
  Riemann hypothesis (2.8, through ExplicitPrimeCounting §2.5; 2.9).
- H. Kadiri and A. Lumley, *Short effective intervals containing primes*, Integers 14 (2014)
  (arXiv:1407.7902), Table 2: the rows of 2.9 §7.3.
- M. Cully-Hugill and E. S. Lee, *Explicit interval estimates for prime numbers*, Math. Comp. 91
  (2022), with its corrigendum (2024), Table 2: the rows of 2.9 §7.3.
- A. W. Dudek, *An explicit result for primes between cubes*, Funct. Approx. 55 (2016), Theorem
  1.1: primes between consecutive cubes (2.9, through ExplicitPrimeCounting §7.5).
- M. Cully-Hugill, *Primes between consecutive powers*, J. Number Theory 247 (2023), arXiv
  2107.14468, Theorem 1: primes between consecutive cubes and between consecutive `155`-th powers,
  and the density *CullyHugillDensity* (2.9, through ExplicitPrimeCounting §7.5).
- O. Ramaré and R. Rumely, *Primes in arithmetic progressions*, Math. Comp. 65 (1996), Theorem 1 and
  Table 1: the general theorem for a modulus and its tabulated rows (3.2, through
  ExplicitPrimeCounting §6.1).
- P. Dusart, *Estimates of θ(x; k, l) for large values of x*, Math. Comp. 71 (2002), Theorem 5 and
  its table: the general theorem for a modulus at his constant `C₁(q)`, and its rows (3.2, through
  ExplicitPrimeCounting §6.1).
- K. S. McCurley, *Explicit estimates for the error term in the prime number theorem for arithmetic
  progressions*, Math. Comp. 42 (1984), Theorems 1.1 and 1.2 and Table 1: the theorem in McCurley's
  shape (3.2, through ExplicitPrimeCounting §6.1).
- M. A. Bennett, G. Martin, K. O'Bryant and A. Rechnitzer, *Explicit bounds for primes in arithmetic
  progressions*, Illinois J. Math. 62 (2018): the bounds for `ψ`, `θ` and `π` in progressions (3.2,
  through ExplicitPrimeCounting §6.3).
- H. Kadiri, *Short effective intervals containing primes in arithmetic progressions and the seven
  cubes problem*, Math. Comp. 77 (2008): the exceptional moduli in her sense, the existence theorem
  and its quantitative instances (3.2, through ExplicitPrimeCounting §6.6).
- E. Bach and J. Sorenson, *Explicit bounds for primes in residue classes*, Math. Comp. 65 (1996):
  the cyclotomic bound of 3.3 and its Check; the least prime ideal with a given Frobenius class
  (4.7, through ExplicitNumberFields §7.4).
- S. R. Garcia and E. S. Lee, *Explicit estimates for Artin L-functions: Duke's short-sum theorem
  and Dedekind zeta residues*, J. Number Theory 237 (2022), Lemma 3, Theorem 1 and Corollary 2: the
  Mertens lemma, the explicit Duke short-sum theorem and the two-sided bound for `κ_K` (4.6,
  through ExplicitNumberFields §§3.5, 3.6).
- L. Grenié and G. Molteni, *An explicit Chebotarev density theorem under GRH*, J. Number Theory 200
  (2019) 441–485, arXiv:1709.07609, Theorem 1.1 and Corollary 1.2: the bounds for `ψ_C` and `π_C`
  (4.7, through ExplicitNumberFields §7.2).
