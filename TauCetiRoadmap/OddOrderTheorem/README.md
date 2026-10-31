# Roadmap: the Feit–Thompson odd order theorem

Prove that every finite group of odd order is solvable, through a reusable
development of local analysis, Dade isometries and coherent character families.
The public endpoint is

```lean
theorem isSolvable_of_odd_natCard (G : Type*) [Group G] [Finite G]
    (hG : Odd (Nat.card G)) : Group.IsSolvable G
```

The proof programme follows Bender–Glauberman's *Local Analysis for the Odd Order
Theorem* and Part I of Peterfalvi's *Character Theory for the Odd Order Theorem*.
The local and character-theoretic constructions are library results with their
own APIs. The final solvability theorem must have no hypothesis asserting a
local structure theorem, a coherence theorem, or the nonexistence of a minimal
counterexample.

Suggested homes: `TauCeti/GroupTheory/OddOrder/` for local analysis,
`TauCeti/RepresentationTheory/CharacterTable/Dade/` for the general character
theory, and `TauCeti/GroupTheory/OddOrder.lean` for the public endpoint.

## Foundations and ownership

- Mathlib supplies finite groups, Sylow theory, solvability, nilpotence,
  subnormality, commutators, group actions, finite fields, field norms and
  semidirect products. Use their native types and predicates.
- LocalFiniteGroupTheory [#1634](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1634),
  L1–L7, owns normal prime-set cores, Hall subgroups, Fitting subgroups, coprime
  action, extraspecial groups, replacement, normal complements, ZJ, Thompson's
  fixed-point-free automorphism theorem and solvable signalizer functors.
  Prove the odd-order-specific local theorems here using those exports. Keep
  the solvability hypotheses in coprime-action applications; the proper
  subgroups in F0 supply them without using the odd order theorem itself.
- [CharacterTheory](../RepresentationTheory/CharacterTheory/README.md) and
  [InductionRestriction](../RepresentationTheory/InductionRestriction/README.md)
  own ordinary characters, virtual characters, induction, Mackey, Clifford,
  cyclotomic arithmetic, Frobenius groups and their ordinary character theory.
  Consume the native APIs, including Burnside's `pᵃqᵇ` theorem and the
  norm-one virtual-character theorem. Ordinary character theory is not
  redeveloped in a proof-specific namespace.
- [FiniteGroupExtensionSplitting](../FiniteGroupExtensionSplitting/README.md),
  S0–S3, owns the Gaschütz complement criterion. F1 consumes it where an
  abelian normal subgroup must split after restriction to a Sylow subgroup.
- The finite-field arguments here own norm fibres and the comparison theorem
  in F5. Their exponent and field-order arithmetic use Mathlib's finite-field
  and norm APIs; this roadmap has no primitive-divisor prerequisite.

There is no dependency on CFSG, classification of minimal simple groups,
Glauberman's Z* theorem, or modular block theory. This roadmap does not include
Peterfalvi's Part II on rank-one groups. Its elementary and local prerequisites
are supplied above or explicitly constructed in F0–F5.

## Conventions

Use `[Group G] [Finite G]` and `Nat.card G`. A **minimal odd simple group** here
means a nonabelian simple finite group of odd order all of whose proper
subgroups are solvable. This is a concrete conjunction, not a class providing
any of the conclusions to be proved. F0 constructs such a group from a
counterexample by minimal order.

Use native `TauCeti.ClassFunction ℂ G`, its character pairing and native
virtual characters. The normalized Hermitian expression agrees with the
bilinear pairing on virtual characters by evaluating the second character at
inverse group elements; provide that comparison once. For a character family
`S` of `L`, write `R(S) = ℤ[S]` and `CF(L,A)` for class functions supported
on `A`. A **coherent extension** of the Dade map means an isometry
`R(S) → ℤ[Irr G]` agreeing with that map on `R(S) ∩ CF(L,A)`.
When this intersection is described using degree zero, explicitly prove that
every degree-zero element of `R(S)` vanishes off `A`; the two domains are
not equal for an arbitrary family.

For a maximal subgroup `M`, define `σ(M)` to consist of primes `p ∣ |M|`
for which `N_G(P) ≤ M` for a Sylow `p`-subgroup `P` of `M`. Prove independence
of the Sylow choice. Write `M_σ = O_{σ(M)}(M)`. All cores, Fitting subgroups
and subgroup centers use the shared local-theory objects, mapped into `G`
through the subgroup inclusion when needed.

The local types I–V and their supporting configurations are specified in F3
below, matching Peterfalvi Part I §8. Their fields are the displayed subgroup,
order, rank, centralizer and action conditions; none is an unspecified
proposition standing for an expected structure theorem.

## Milestone graph

| Layer | Inputs | Deliverable |
| --- | --- | --- |
| F0 | Mathlib solvability and finite groups | minimal-counterexample reduction and its API |
| F1 | local finite-group theory, extension splitting | solvable odd-order local tools and low-rank prime-length theory |
| F2 | native ordinary characters and explicit centralizer-complement data | general Dade isometry and coherence library |
| F3 | F0–F1, the group-theoretic support API of F2 | transitivity, uniqueness, prime-length and maximal-subgroup types |
| F4 | F2–F3 | character analysis of the five types and paired maximal subgroups |
| F5 | F4, finite fields and arithmetic | finite-field comparison and the final contradiction |
| F6 | F0, F3–F5 | unconditional odd-order solvability and public corollaries |

### F0: minimal counterexamples

Prove that a nonsolvable finite group of odd order has a section of minimal
order that is nonabelian simple and has only solvable proper subgroups.
Supply preservation of odd order by subgroups, quotients and sections, strict
cardinality inequalities, and the extension step for solvability.
Prove the equivalence between the public endpoint and nonexistence of minimal
odd simple groups, without assuming either direction in the local analysis.

For a minimal odd simple group, prove trivial center, perfection, properness
of centralizers of nonidentity elements, self-normalization of maximal
subgroups, and existence of maximal overgroups for proper subgroups. Expose
the induced solvability instances on proper subgroups. The trivial group and
abelian simple groups must be discharged before using nonabelian simplicity.

### F1: odd-order local tools

Develop the `p`-length-at-most-one condition for a finite solvable group as
normality of a Sylow `p`-subgroup of `H/O_{p'}(H)`. Prove its invariance under
isomorphism, passage to subgroups and quotients, and its normal-complement
formulations. Build the chief-factor and faithful-module arguments used in
Bender–Glauberman's prime-length and uniqueness analysis. In particular:

- For a finite solvable group of odd order with `p`-rank at most two, prove
  `p`-length at most one. The unrestricted proper-subgroup theorem belongs
  to F3c, after the large-rank core theory it needs.
- Prove the quadratic-action criterion giving `p`-stability for solvable
  odd-order groups. Use LocalFiniteGroupTheory L5's definition, not an
  assumption of that property. Build the necessary faithful chief-factor
  representations and coprime fixed-space and extraspecial-module estimates.
- If `Y = J ⋊ A` is solvable of odd order with `(|J|,|A|)=1`, `A₀ ≤ A`
  has prime order, and every Sylow subgroup of `C_J(A₀)` is cyclic, prove
  `[J,A]` has `p`-length at most one for every prime `p`.

LocalFiniteGroupTheory L3 supplies Thompson's `A × B` lemma and generation
by centralizers; L4 supplies the replacement theorems; L5 supplies ZJ and
normal-complement criteria. F1 owns the solvable odd-order linear-action
criteria just listed, which are not supplied by merely naming those results.

### F2: Dade isometries and coherent families

Develop Peterfalvi Part I §§1–6 on native class functions and virtual
characters. For the Dade data use a subgroup `L ≤ G`, an `L`-invariant subset
`A ⊆ L \ {1}`, fusion in `A` controlled by `L`, and normal subgroups
`H_a ⊴ C_G(a)` such that
`C_G(a) = H_a ⋊ C_L(a)` and
`gcd(|H_a|, |C_L(b)|) = 1` for `a,b ∈ A`.
Prove the fusion and disjointness properties of the conjugacy saturations of
the cosets `a H_a`. Define the extension of a class function supported on `A`
by its value at the representative `a` of such a coset, and zero outside that
saturation. Prove it is well-defined, linear, support-preserving and an
isometry. Its integral domain is `ℤ[Irr L] ∩ CF(L,A)` and its integral image
lies in `ℤ[Irr G]`. Its image functions are supported on `⋃_{a∈A}(aH_a)^G`.
Prove `H_a` is the unique normal Hall complement to `C_L(a)` in `C_G(a)`;
the extension is independent of choices in that complement and of packet
representatives.
For arbitrary supported class functions this is the normalized Hermitian
isometry. On virtual characters compare it with the native bilinear pairing
by evaluating the second character at inverse group elements.

Consume the elementary character statements of §1 from CharacterTheory where
available and prove the remaining restriction, degree and low-norm character
lemmas here with explicit statements. Prove the general T.I.-subset
isometry of §3, its cyclic-subgroup specializations and its relation to ordinary
induction. In the general Dade theorem, prove that when every `H_a = 1`,
the Dade map equals ordinary induction on the supported domain. This
comparison applies to arbitrary T.I. subsets whose element centralizers
are contained in their normalizer, without cyclic-factor or odd-order
hypotheses. Develop the integral-span and degree-zero-subspace APIs, coherent
extension and restriction, signed irreducible images, conjugate pairs,
uniqueness on the supported domain, and gluing of compatible coherent
families on the intersection domain specified in the conventions. Prove the
degree-zero support hypothesis for each family used in F4. Prove the extension
criteria and inequalities of §§5–6, including
the subcoherence estimates used by the five-type analysis. Each inequality
must carry its numerical hypotheses explicitly. No target asserts coherence
of an arbitrary family without the stated group and degree conditions.
Implement the generic §1–§6 exports without importing F0, F3–F6 or any final
odd-order theorem. Other finite-group developments, including the
Brauer–Suzuki proof, consume the general Dade/induction comparison directly;
they need not invoke the cyclic-factor or coherence theorems.

### F3: maximal subgroups and local structure

Develop the following sublayers of the Bender–Glauberman analysis and its
Peterfalvi §8 formulation. Their order separates definitions and low-rank
arguments from conclusions needing the large-rank structure.

#### F3a: prime sets and core-family support

For a finite group `X`, define `α(X) = {p prime | m_p(X) ≥ 3}`. A `p`-group
is **narrow** if its `p`-rank is at most two or it has an elementary abelian
subgroup of order `p²` maximal among elementary abelian subgroups. Define
`β(X)` as the prime divisors whose Sylow subgroups are not narrow. Define
`X_α = O_{α(X)}(X)` and `X_β = O_{β(X)}(X)` using the shared prime-set core.
Prove their intrinsic and ambient-subgroup transport, normality and maximality
APIs, and `β(X) ⊆ α(X)`.

For a maximal `M` in the ambient minimal odd simple group, define the three
sets outside `σ(M)` by

- `τ₁(M)`: `m_p(M)=1` and `p ∤ |M'|`;
- `τ₂(M)`: `m_p(M)=2`;
- `τ₃(M)`: `m_p(M)=1` and `p ∣ |M'|`.

In each case require `p` prime dividing `|M|`. Define `κ(M)` by primes
outside `σ(M)` with cyclic Sylow subgroup containing a nonidentity element
centralizing a nonidentity element of `M_σ`. Define the `σ`-support as the
union of `M_σ \ {1}` over maximal `M`, the supporting maximal subgroups of
`x` as `{M maximal | x ∈ M_σ}`, and the multiplicity as that finite set's
cardinality. Prove conjugation, support and counting formulas before using
these objects to define signalizers or Dade packets.

#### F3b: transitivity and uniqueness

Prove the following Thompson transitivity statement in a minimal odd simple
group. Let `P` be Sylow `p`, and `A ≤ P` be normal in `P`, abelian,
self-centralizing in `P`, with `m_p(A) ≥ 3`. For `q ≠ p`, the maximal
`A`-normalized `q`-subgroups are conjugate by `O_{p'}(C_G(A))`.
Here maximality is among all `q`-subgroups normalized by `A`. Construct the
normal self-centralizing abelian subgroups of Sylow groups needed to apply
this result, using F1, L3's `A × B` lemma and L4's replacement theorems.

Deduce uniqueness of the maximal overgroup of every elementary abelian
subgroup of rank at least three, and prove the rank-two centralizer and
normalizer alternatives used when a rank-three subgroup is absent. Build
the relevant constrained-centralizer core and generation lemmas in this
sublayer, with their actual normality and coprimality hypotheses.

#### F3c: Hall cores and the general prime-length theorem

For every maximal `M`, prove `α(M) ⊆ σ(M)`, that `M_α` is a normal Hall
`α(M)`-subgroup, that `M_α ≤ M'`, and that no prime of `σ(M)` divides
`|M:M'|`. Prove the cyclic-Sylow centralizer criteria for primes outside
`σ(M)` and the comparison of `β` for `M` and `G` at a `σ`-prime. In
particular `M_β ≤ M_α ≤ M_σ`, with the normality and transport from F3a.

Now prove every proper subgroup has `p`-length at most one for every prime:
use F1 for rank at most two, and the normal Hall `α`-core, its derived
containment, the outside-`σ` centralizer criterion and F1's coprime-action
prime-length theorem for the remaining case. This statement is not used as
an assumption in F3a–F3b.

Prove each maximal `M` has a nontrivial normal Hall `σ`-core, fusion control
on the relevant core elements, and the normalizer/centralizer formulas
needed for Dade data. Prove the separation theorems for nonconjugate maxima
and the `σ`-support multiplicity/signalizer identities. Outside `σ(M)`, prove
the `τ` sets partition the remaining prime divisors and construct a complement
`E = E₁E₂E₃` to `M_σ`, with `E_i` Hall for `τ_i(M)`. Give its order,
intersection, action and conjugation formulas.

#### F3d: the five types and the supporting pair

Write `H(M)` for the product of the normal Sylow subgroups of `M`, and
`F(M)` for its Fitting subgroup. Prove `H(M)` is characteristic and nilpotent.
Say `M` has **Frobenius-type data with complement E** when
`1 < H(M) < M`, `M = H(M) ⋊ E`, there is an abelian normal `E₁ ⊴ E`
containing `C_E(h)` for every nonidentity `h ∈ H(M)`, and some subgroup
`E₀ ≤ E` has the same exponent as `E` and acts fixed-point-freely on `H(M)`.
This is weaker than asserting that `E` itself acts fixed-point-freely.

For nontrivial cyclic subgroups `W₁,W₂`, define a **P-configuration**
`(M,E,W₁,W₂)` by the following full data:

- `M < G`, `W₁` is Hall in `M`, and `M = M' ⋊ W₁`;
- `E` is nilpotent and normalized by `W₁`, and `M' = H(M) ⋊ E`;
- `H(M)` is not cyclic, `M'' ≤ F(M) ≤ M'`, and `F(M)=H(M)C_M(H(M))`;
- `W₂ ≤ H(M) ∩ M''` and `C_{M'}(w)=W₂` for `w ∈ W₁ \ {1}`;
- `W = W₁ × W₂` is the internal direct product, and
  `W \ (W₁ ∪ W₂)` is a T.I. subset with exact normalizer `W`.

For a set `D`, T.I. with exact normalizer `N` means `D` is nonempty,
`1 ∉ D`, it is invariant under `N`, and it has disjoint conjugates under
every element outside `N`. Define the
types of a proper subgroup as follows:

| Type | Defining data |
| --- | --- |
| I | Frobenius-type data with complement `E`, and either `H(M)\{1}` is T.I. with normalizer `M`, or `H(M)` is abelian with maximum elementary abelian rank two, or `exp(E) ∣ r-1` for every prime `r ∣ |H(M)|` and `O_{r'}(H(M))` is cyclic for at least one such `r` |
| II | a P-configuration with `|W₁|` prime and `F(M)\{1}` T.I. with normalizer `M`; `E ≠ 1` is abelian, `N_G(E) ⊈ M`, and `M'` has Frobenius-type data with complement `E` and `H(M')=H(M)` |
| III | a P-configuration with `|W₁|` prime and `F(M)\{1}` T.I. with normalizer `M`; `E ≠ 1` is abelian and `N_G(E) ≤ M` |
| IV | the same P-configuration and T.I. conditions as III; `E` is nonabelian and `N_G(E) ≤ M` |
| V | a P-configuration with `E=1`, and either `H(M)\{1}` is T.I. with normalizer `M`, or for some prime `r ∣ |H(M)|`, `O_{r'}(H(M))` is cyclic and `|W₁| ∣ r-1`, or for some prime `r ∣ |H(M)|`, `O_{r'}(H(M))` is cyclic, `|O_r(H(M))|=r³` and `|W₁| ∣ r+1` |

Prove the exhaustive, mutually exclusive five-type theorem for maximal
subgroups. Prove its alternative: either every maximum is type I or there
exist distinct maxima `S,T` of types II–V and nontrivial cyclic `W₁,W₂`
such that `W=W₁×W₂` is cyclic, `S=S'⋊W₁`, `T=T'⋊W₂`,
`S∩T=W`, `W\(W₁∪W₂)` is T.I. with normalizer `W`, at least one of
`S,T` is type II, and every non-type-I maximum is conjugate to `S` or `T`.
F3 constructs this supporting pair. F4 supplies its character-theoretic
properties and the compatible P-configuration witnesses.

### F4: the character analysis

Develop the arguments of Peterfalvi Part I §§7 and 9–13 in these sublayers:

- **F4a, local character families (§§7, 9–11).** Construct induced families
  from `Irr(H(M))\{1}` and the relevant normal subgroups of `M'`. Use
  Clifford theory to identify their distinct constituents and multiplicities;
  do not assume induction is irreducible. Prove their Dade data from F3,
  the degree-zero support hypothesis, integrality and the coherence or
  noncoherence conclusion with the full type hypotheses above. Establish
  the support separation, Frobenius partner and degree inequalities used
  for types II–V. The ordinary irreducible basis, degree divisibility and
  norm-one classification are consumed from Tau Ceti.
- **F4b, type-I Frobenius theorem (§12).** For every type-I maximal `M`,
  prove there is a nontrivial complement `E` with `M=H(M)⋊E` such that
  every nonidentity `e∈E` fixes only the identity of `H(M)`. This strengthens
  F3d's Frobenius-type data and is not true by definition of type I.
- **F4c, exclusion of the all-type-I case (§12).** Prove the concrete
  endpoint `∃ M maximal, ¬ TypeI(M)`. Construct the type-I Dade families
  and their supports, prove the counting and orthogonality identities, and
  derive a contradiction from `∀ M maximal, TypeI(M)`. This establishes
  the premise selecting the supporting-pair alternative of F3d.
- **F4d, reciprocal supporting maxima (§13).** For the pair of F3d, construct
  nilpotent subgroups `U,V` such that `(S,U,W₁,W₂)` and `(T,V,W₂,W₁)`
  are P-configurations. Prove `(|W₁|,|W₂|)=1`, so their nontrivial orders
  are unequal. Orient them by `|W₁|<|W₂|` and prove both maxima are type
  II, together with the character-degree inequalities and field-model
  conditions used in F5. Prove these identifications and inequalities from
  the constructed families; none is an arbitrary field of a pair structure.

### F5: finite-field comparison and contradiction

Prove the finite-field configuration theorem used for the final comparison,
in the form of Bender–Glauberman Appendix C. Let `p,q` be primes,
`F = 𝔽_{p^q}`, `P = (F,+)`, and `U` the norm-one subgroup of `Fˣ` over `𝔽_p`.
Assume `gcd((p^q-1)/(p-1), p-1) = 1`. In a finite ambient group suppose
`P ⋊ U` embeds with `U` acting by multiplication. Let `P₀` be the embedded
additive prime field. If an abelian `p'`-subgroup `Q` and `y ∈ Q` satisfy
`P₀ ≤ N_G(Q)` and `P₀^y ≤ N_G(U)`, prove `p ≤ q`.
Build the norm-fibre, field-automorphism and word identities this proof needs;
none of these conclusions is supplied as a configuration field.

Apply the theorem and the character inequalities to the two orientations of
the supporting pair from F4, obtaining the contradiction of Peterfalvi §14.
Prove the pair's primes, orders, coprimality, faithful linear realizations and
normalizer conditions before instantiating the finite-field theorem. This
layer owns all arithmetic and finite-field comparison lemmas not already
provided by the dependencies.

### F6: assembly and reusable consequences

Deduce nonexistence of a minimal odd simple group and apply F0 to prove the
public endpoint at arbitrary universes. Export the equivalent assertion that
every finite nonabelian simple group has even order. Expose solvability of
odd-order subgroups and quotients through the standard solvability instances.
Keep F1's local tools, F2's Dade/coherence library and F5's finite-field
comparison theorem accessible without importing the final assembly.

## Checks

Give examples for the trivial group, an odd cyclic group, and the nonabelian
group `C₇ ⋊ C₃` with its explicit order-three action. Check the Dade isometry
on a Frobenius kernel with cyclic complement and its difference of two
characters. Verify the zero-degree domain and sign convention. Audit the
endpoint's hypotheses and axioms: none of the F1–F5 targets may survive as an
assumption of F6, and CFSG or Z* must not enter the import dependency graph.

## References and provenance

- W. Feit and J. G. Thompson, *Solvability of groups of odd order*, Pacific
  Journal of Mathematics 13 (1963), 775–1029.
- H. Bender and G. Glauberman, *Local Analysis for the Odd Order Theorem*,
  LMS Lecture Note Series 188, Cambridge University Press, 1994, including
  Appendix C's finite-field comparison theorem.
- T. Peterfalvi, *Character Theory for the Odd Order Theorem*, LMS Lecture
  Note Series 272, Cambridge University Press, 2000, Part I §§1–14. Its
  [contents and introduction](https://api.pageplace.de/preview/DT0400.9781107109018_A23760141/preview-9781107109018_A23760141.pdf)
  specify the Dade, coherence, five-type and final-comparison route.
- [Mathematical Components odd-order development](https://github.com/math-comp/odd-order)
  provides an independently organized formal proof and its supporting group
  theory. Its representations and finite-group types require mathematical
  comparison to Lean's native objects.
- Axiom's [unconditional theorem](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/FeitThompson/OddOrderTheorem.lean),
  [local analysis](https://github.com/AxiomMath/CFSG/tree/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/FeitThompson/Local),
  [character theory](https://github.com/AxiomMath/CFSG/tree/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/FeitThompson/Representations)
  and [finite-field comparison](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/FeitThompson/OddOrder/AppendixCPrimeComparison.lean)
  are secondary proof sources. Coordinate before adapting code. The
  mathematics above, rather than that source's proof-specific proposition
  packages, determines the scope and the public interfaces.
