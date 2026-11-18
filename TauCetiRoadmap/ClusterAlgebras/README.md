# Roadmap: cluster algebras

**Summary.** Build a reusable theory of classical and quantum cluster algebras: normalized
Fomin–Zelevinsky seeds, compatible quantum seeds, the Fock–Goncharov lattice
formalism and cluster varieties, the Laurent phenomenon, finite-type classification,
double Bruhat cells,
Laurent positivity, and sign-coherence. The algebraic and geometric definitions must
be connected by constructions and comparison theorems, with their full hypotheses.
Suggested homes are `TauCeti/Algebra/Cluster/` and `TauCeti/AlgebraicGeometry/Cluster/`.
Selected Lean target signatures are given in [Suggested.lean](Suggested.lean);
this README is the definitive mathematical specification.

Use faithful based charts as the algebraic interface: a chart is the family of
normalized monomials of a based torus in an ambient algebra. One seed
definition serves binary and polynomial exchange in commutative and quantum
ambient algebras: a coefficient system says where the coefficients of the
exchange polynomials live and how the polynomials are normalized, and a seed
adds a compatible form and a chart over a commutative semiring with a unit
parameter. A direction is mutable when its exchange element is a unit
of the ambient algebra. Classical charts are constructed by regular localization
in a common total quotient semiring; quantum charts take values in a division
ring. Separate exchange data, their realization by charts, and the choice of
coefficient ring.
The tree presentation, normalized FZ tuples, and lattice seed coordinates are connected to
these objects by equivalences and transport theorems. References specify mathematical
results and proof ingredients; their historical encodings do not prescribe the API.

## Scope and ownership

The finite-rank FZ theory has arbitrary coefficient semifields and integer
skew-symmetrizable exchange matrices. Geometric type allows any frozen index set,
with finitely supported frozen columns; the classical finite-word Laurent theorem
also extends to locally finite mutable index sets. Include disconnected, degenerate
and zero exchange matrices, and rank zero. Allow any specified subset of frozen
variables to be inverted; write the coefficient ring in each theorem. The integral
theory has coefficient realizations over commutative rings, including rings with
zero divisors, under the exchange-regularity conditions of §§1.2–1.4.
Seeds, mutation, reachable charts, cluster algebras and upper algebras have
one definition (§§1.2–1.3) over a commutative semiring with a unit parameter,
for ordinary and polynomial exchange in commutative and quantum ambient
algebras. In the regular classical model a direction is mutable exactly when
its exchange numerator is regular. Mutation is total for the ordinary positive
universal models, the admitted ordinary and polynomial ring realizations and
the admissible division-ring realizations. Laurentness is a theorem about these algebras: L8 treats the
ordinary ring realizations, P3 treats polynomial ring realizations, and
Layer 5 gives the ordinary positive semiring statement.
Include mutation on coefficient-semifield-valued points and invariance of the
subtraction-free function semifield (§1.2 and L7a).
Cluster schemes are constructed from finite mutable families in lattice data,
allowing dependencies, repetitions and failure to span. They use integral domains:
`𝒳` has no characteristic restriction, while `𝒜` uses §3.3's nonvanishing
condition, equivalent to §1.4's for adapted basis presentations. Regular toric charts work over every
commutative ring. Scattering is constructed over `ℚ`; positivity is an integral
statement about finite Laurent expansions before scalar change. The
double-Bruhat-cell target is for pinned split connected simply connected semisimple
groups over arbitrary characteristic-zero fields.
Quantum theory has finite total rank, geometric coefficients and integral compatible
pairs over `Z_v=ℤ[v,v⁻¹]`, where `v=q^{1/2}` is an indeterminate. Include arbitrary
skew-symmetrizable mutable blocks admitting such a pair, including principal
extensions of singular and zero matrices. Compatibility forces the extended matrix
to have full column rank; it imposes no full-rank condition on the mutable block.
Allow specified frozen variables to remain noninvertible in the cluster algebra.
The quantum targets are seeds, mutation, Laurentness, bar and grading interfaces,
and realization in other algebras. Monoidal categorification, KLR algebras,
arbitrary multivariate exchange systems, quantum positivity, quantum double-cell coordinate
theorems, and canonical bases are outside this roadmap. General special-fiber
isomorphisms, quantum Frobenius and root-of-unity representation theory are also
outside its scope. Mutation, Laurentness and the support description of the center
allow finite-order parameters.
The common Laurent theory uses a commutative scalar ring R, a unit `u∈Rˣ`,
an extended exchange matrix B̃, and an alternating form Λ with diagonal
compatibility weights w. Its Q1–Q3 proof uses a faithful chart into a possibly noncommutative
division R-algebra, which forces R to be a domain. Classical polynomial
seeds over a domain are its instances at `u=1`, `Λ=0`, `w=0`, and P3
transports its finite polynomial Laurent representatives to the admitted
commutative rings.
No factoriality assumption is needed. Full column rank supplies upper-bound
invariance; Laurentness itself follows without it by a central principal lift.
The weights w may vanish and are separate from the matrix's positive symmetrizer.
This includes ordinary quantum seeds and classical geometric seeds.
The exchange polynomials have unit endpoint coefficients, and their positive
degrees divide their extended columns. Mutation reverses the selected
polynomial and dilates the others by the propagation law of §1.2; with
endpoint coefficients one the others are fixed. Normalized coefficients are
another coefficient system, defined in every degree and gauge equivalent to
this one; the separation, finite-type and positivity theorems concern their
binomial case. On zero columns `H_k(1)` must be a unit of the ambient algebra:
`H_k(1)≠0` in a division ring, and `IsRegular (H_k(1))` in the regular
classical model over a ring. This condition is preserved by mutation.
Reciprocal fixed polynomials and binary exchange are instances.
Section 2.6 constructs their quantum and classical algebras and comparison maps.
The central-factor calculation is in a pair Laurent ring in which all other
coordinates, including the frozen ones, are units. Layers 3–6 concern ordinary cluster seeds;
generalized coefficient-semifield separation is outside this roadmap.

### Boundary with QuantumGroups

[QuantumGroups](../QuantumGroups/README.md)'s rank-one PBW development owns
σ-derivation extensions. The present roadmap uses neither these extensions nor
quantum-group presentations, representations or Hopf structure: its skew Laurent
and skew polynomial rings are subrings of a division ring generated by a
coefficient subring and normalizing elements.

## Conventions

The algebraic formulas use FZ's column exchange convention and tropical minimum.
Layer 3 uses ScatteringDiagrams §4.2's `SkewLatticeDatum` and `AdaptedBasis`, with
the derived form `β(n,n')={n',n}`. Thus `p₁*(n)={n,−}=β(−,n)` on `N°` for `n∈N_uf`.
The geometric tropical maps use maximum. Construct Layer 3's matrix realization
and min/max tropicalization maps and prove their mutation laws.
Brackets of derivations are the ordinary commutators `[D,E]=D∘E−E∘D`; for a
Poisson bracket `[−,−]_P`, use left Hamiltonians `H_f=[f,−]_P`.

Use `OreLocalization` for the skew fields of fractions of the based tori.
Commutative one-exchange statements use regular localization of Laurent semirings.
The skew one-exchange, patching and replacement statements concern subrings of a
fixed division ring. For a commutative ring `A` the total quotient `T(A)` is
Mathlib's total fraction ring `FractionRing A`; use `FractionRing` and
`IsFractionRing` for rings. `T` is a new construction only for semirings.
The common scalar ring acts centrally; the ambient division ring need not be
commutative. Ordinary quantum algebras are `Z_v`-algebras. Quasi-commuting frozen
generators are coordinates, not central scalars.
The integral quantum form `Λ` is specified on the quantum torus's exponent lattice;
Layer 3's rational form `β` is defined on `N`.

## Exact supplier contracts

### From Mathlib

Use `Matrix`, `Basis`, `Module.Dual`, `MvPolynomial`, `MonoidAlgebra`,
`AddMonoidAlgebra`, `FractionRing`, `IsFractionRing`, `Subalgebra`, `Subring`,
`Localization` and `IsLocalization` for their existing mathematical meanings.
Multivariable Laurent rings are group algebras of exponent lattices. The one-variable
comparison uses `LaurentPolynomial`. Use `OreLocalization` for noncommutative fractions
and `RootPairing`, `RootPairing.Base` and its integer Cartan matrix for root systems.

### From Tau Ceti

The `laurentEval` and `laurentEvalEquiv` declarations
in `TauCeti.Algebra.Polynomial.Laurent.Basic` supply one-variable evaluation at a unit
for §§0.2 and 0.5. Use `TauCeti.DynkinType`, `DynkinType.Valid` and
`TauCeti.IsFiniteType` for Cartan type in Layer 4.

Use `TauCeti.twistedMonoidAlgebra` in
[`TauCeti.Algebra.MonoidAlgebra.Twisted.Basic`](https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean)
for the based torus of §0.4 over a commutative semiring. The namespace
`TauCeti.TwistedMonoidAlgebra` supplies `basis`, `of_mul_of`, `isUnit_of`,
`lift` for the chart map and `monoidAlgebraEquiv` for the trivial factor set.

### From TauCetiRoadmap.ScatteringDiagrams

[ScatteringDiagrams](../ScatteringDiagrams/README.md) §4.3 supplies the coefficient
and lattice maps for the full `QuantumMonoidAlgebra`. The scattering roadmap also
supplies completed wall groups, consistent completion, broken lines, theta transport
and wall positivity.
Consume §0.8's finite expansion and recursion, §§3.3–3.4's ordinary and
relative abelian completions, §§4.2–4.4, 5.1–5.6 and 7.1–7.7 at their
stated hypotheses. This roadmap owns seed mutation invariance, the cluster chambers,
and the theta/cluster comparison.
Cluster positivity consumes the scattering theorems with their seed-free hypotheses.

### From TauCetiRoadmap.RootSystems

[RootSystems](../RepresentationTheory/RootSystems/README.md), Layers 1–3, owns the
general root-system/Weyl-group comparison, the Coxeter geometric sign and faithfulness
theorems, and the base-independent form of the classification. The classification of
based Cartan matrices, the Dynkin carriers and `TauCeti.IsFiniteType` are existing
Tau Ceti material. Layer 4 here owns almost-positive roots, cluster compatibility and
the classification of mutation classes; it consumes the existing root and Dynkin carriers.

### From TauCetiRoadmap.ReductiveGroups

[ReductiveGroups](../ReductiveGroups/README.md), Layers 7, 7C, 8 and 10, supplies
opposite Borels, actual root subgroups, Bruhat coordinates and rational highest-weight
representations and root-coordinate constructions. Layer 8 supplies the split
root-datum classification and comparison with pinned rational models.
Layer 6 here constructs double cells, generalized minors and their cluster charts.

### From TauCetiRoadmap.SchemeAndStackFoundations

[SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md), Layer 0,
supplies scheme gluing, dimension theory and §0.6's `coherent_hartogs` for
restriction away from a closed subset under the depth hypothesis.

### From TauCetiRoadmap.AnalyticToricGeometry

[AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md), Layer 0, owns the
lattice, cone and dual-semigroup carriers and their complex affine toric schemes.
Section 3.3 extends the regular-cone chart and face-localization API to the
commutative ground ring used here; §5.3 consumes its rational instance.
The complex scheme construction is not a general scalar-ring supplier.

## How to read the build

| Layer | Delivers | Depends on |
|---|---|---|
| 0 | Coefficients, based quantum tori, Laurent charts and local algebra | Mathlib, Tau Ceti and ScatteringDiagrams §4.3 |
| 1 | Coefficient systems, exchange data, seeds and their mutation, regular and division-ring realizations, algebras | 0 |
| 2 | Common polynomial upper bounds; quantum and classical Laurentness; separation; Starfish | 0–1; SchemeAndStackFoundations §0.6 |
| 3 | Lattice formalism, cluster varieties, matrix and tropical realizations | 0–2; toric carriers and scheme gluing |
| 4 | Finite-type classification and root parametrizations | 0–2; RootSystems |
| 5 | Cluster scattering, Laurent positivity and sign-coherence | 0–3; ScatteringDiagrams |
| 6 | Double Bruhat cells and their upper cluster algebras | 0–2; ReductiveGroups |

| Shared material | Single home | Consumers |
|---|---|---|
| Twisted lattice algebra and monomial basis | Tau Ceti | Based tori and quantum charts |
| Coefficient and lattice maps of twisted lattice algebras | ScatteringDiagrams §4.3 | Based tori and quantum charts |
| Embedded skew Laurent normal forms, chart change and denominator patching | Seed-free algebra, §§0.4–0.5 | Polynomial mutation and Q1; commutative one-exchange statements |
| Support, separated scalar factors and flat simultaneous divisibility | Seed-free algebra, §0.6 | Commuting Q2 and classical divisibility statements |
| Finite ordered polynomial replacement | Seed-free algebra, §0.7 | Interacting Q2, binary and commutative replacement |
| Exchange matrices, column independence and equivariant mutation words | §§1.1–1.3 | Classical, quantum, polynomial and lattice realizations |
| Coefficient systems, exchange data, seeds, mutation, gauge equivalence, total classes and algebras | §§1.2–1.3 | Normalized, binary and polynomial seeds in regular and division-ring realizations |
| Polynomial exchange data and mutation | §1.5, P1 | Classical regular polynomial seeds, binary seeds and column-compatible quantum frames |
| Local comparisons and the common Laurent theorem | Q1–Q3 | Classical L5, quantum Laurentness, polynomial algebras and realizations |
| Positive evaluation, frozen orders and normalized coefficient separation | L6–L7 | General classical Laurentness L8, recurrence specialization |
| Upper bounds under local divisibility and their classical instances | §2.1, Q2–Q3 | Rank-deficient upper bounds and double Bruhat cells |
| Regularity from finite Laurent chart families | §2.7, using Hartogs | Classical algebra realizations and double Bruhat cells |

Construct polynomial mutation P1 before Q1–Q3. Prove Q1–Q3 over every domain
and scalar unit, using local divisibility for upper-bound invariance, with full
column rank as a sufficient condition, and the
central principal lift for the rank-free Laurent corollary. Obtain ordinary quantum Laurentness by `R=Z_v`,
`u=v`, `w=d` and binary exchange. Obtain classical principal Laurentness L5
directly by `R=ℤ`, `u=1`, `Λ=0`, `w=0`; L6–L7 then give L8 for arbitrary
coefficient semifields. The map `v↦1` compares quantum and classical Laurent
representatives and generated algebras; L5–L8 do not use it as a proof of
Laurentness. Neither common Q1–Q3 nor quantum Laurentness imports classical
Laurentness, separation, scattering or categorification.

An abstract pattern theorem may take local comparisons as hypotheses;
every seed instance constructs them from its exchange data. Seed data
contain neither Laurentness, upper-bound invariance nor mutated-chart
faithfulness. A seed carries its state, with the matrix, positive symmetrizer
and exchange polynomials, an alternating form, compatibility weights and a
faithful based chart. Its one-step relation includes that the exchange
element is a unit of the ambient algebra: regularity of the exchange
numerator in the regular classical model, and nonvanishing in a division
ring. The new chart and all local comparisons are constructed from these inputs.

Each carrier comes with the extensionality, reindexing, evaluation and compatibility
lemmas used in its consuming layers. The examples specify checks of the interfaces
and conventions. The statements in each layer give the general hypotheses.

## Layer 0: coefficient and ambient algebra

### 0.1 Coefficient semifields

A coefficient semifield is a commutative group `P` with an associative
commutative addition `⊕` over which multiplication distributes. Construct
`⊕`-preserving group homomorphisms, indexed products and the one-element object.
Use this same algebraic structure for coordinate values; the word coefficient
specifies its role in a seed, not an additional axiom.

A semiring is zero-sum-free when `a+b=0 ↔ a=0 ∧ b=0`. Develop this as a
property of the given addition and zero, independently of its multiplication.
Prove closure under products, subsemirings, monoid semirings, polynomial
semirings and localization at regular elements. For a zero-sum-free semifield
`S`, addition restricts to `Sˣ`. Construct its coefficient-semifield structure
and the semiring equivalence `WithZero (Sˣ)≃+*S`. Conversely, adjoining zero
to `P` gives a zero-sum-free semifield `P₀=WithZero P`, with an
addition-preserving group equivalence `P≃P₀ˣ`. Extension by zero and
restriction to units identify their homomorphisms and respect identity,
composition and both comparison equivalences. The induced structures use
the given operations, so the comparisons do not require changing instances
at each use. Zero-sum-freeness alone does not make a semiring's units
addition-closed; for example `1+1` is not a unit in `ℕ`.

Let `R` be a commutative semiring and `G≤Rˣ` a subgroup closed under addition
in `R`. Construct the induced coefficient-semifield structure on `G`.
For nontrivial `R`, give the subsemiring `{0}∪image(G)` its semifield structure
and identify it with `WithZero G`. Semiring maps carrying `G` into another such subgroup
induce coefficient-semifield maps. Construct these induced algebraic structures
and prove compatibility of the inclusions and comparison maps with the operations.

For a commutative semiring `A`, let `Reg(A)` be the submonoid of regular
elements: `a` is regular when multiplication by `a` is injective. Construct
`T(A)=Reg(A)⁻¹A` with its canonical embedding of `A`, using Mathlib's `IsRegular`,
`Localization` and `IsLocalization`. A semiring map `f:A→B` extends uniquely
to `T(A)→B` exactly when it sends every regular element to a unit.
Prove uniqueness, identity and composition laws under this explicit condition;
an arbitrary coefficient map need not extend. If `A` is nontrivial and every nonzero
element is regular, prove that `Reg(A)=A∖{0}` and this localization is a
semifield. For a regular element `e`, construct
`T(A[e⁻¹])≃+*T(A)` commuting with the base maps and evaluation. For a
commutative ring `A`, `isRegular_iff_mem_nonZeroDivisors` gives `Reg(A)=A⁰`,
so `T(A)` is Mathlib's total fraction ring `FractionRing A`; `T` is a new
construction only for semirings. Follow the
regular-element terminology of Mathlib's
[localization discussion](https://github.com/leanprover-community/mathlib4/issues/22997).

For every coefficient semifield `P`, prove
[`IsMulTorsionFree P`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Monoid.html#IsMulTorsionFree)
and `UniqueProds P`, hence `IsDomain ℕ[P]` and `IsDomain ℤ[P]` for `ℤ[P]=MonoidAlgebra ℤ P`; construct
`FractionRing ℤ[P]` and the injective `P →* ℤ[P]ˣ`.

For a lattice-ordered additive commutative group `L`, construct its min
tropicalization with addition `a⊕b=a⊓b` and multiplication `a⊙b=a+b`.
Adjoining one global `∞` gives a zero-sum-free semifield. Construct the max
version using `⊔` and one global `−∞`, with negation identifying the two.
Construct these lattice-ordered tropical structures in Tau Ceti. In the
linearly ordered case, give semiring equivalences with Mathlib's
`MinTropical`/`MaxTropical`, preserving the exponent maps and zero adjunction.
Prove functoriality for additive maps preserving the relevant lattice operation;
monotonicity alone is insufficient for a partially ordered source.
For `L=J→₀Γ` with `Γ` linearly ordered, use the existing pointwise lattice
structure on `Finsupp`. The resulting units identify with
`Multiplicative (J→₀Γ)` and have componentwise minimum as auxiliary addition.
Prove compatibility with reindexing and order-preserving additive maps of `Γ`.
For `Γ=ℤ`, write `Trop(J)` and let `z_j` be its generators. Construct the group
evaluations `Trop(J)→*Q`, `z_j↦q_j`, into commutative groups, and for finite `J`
the comparison with exponents in `J→ℤ`. FZ coefficients use minimum;
§3.4's geometric tropicalization uses maximum.

Define `Qsf₀(K)=T(ℕ[u_i:i∈K])` and `Qsf(K)=Qsf₀(K)ˣ` using the same
regular-localization and unit-group constructions. Its denominators are exactly
the nonzero polynomials. Prove that the coefficientwise embedding in
`ℤ[u_i:i∈K]` induces an embedding of `Qsf₀(K)` in
`FractionRing (MvPolynomial K ℤ)`, identifying `Qsf(K)` with ratios of nonzero
natural-coefficient polynomials. For every `y:K→P`, construct the unique
`⊕`-preserving homomorphism `Qsf(K)→P` sending `u_i↦y_i`: evaluation in `P₀`
sends every nonzero polynomial to a unit, so extends through the localization.
Prove naturality and compatibility with reindexing. Equivalently, for every
zero-sum-free semifield `S` and `y:K→Sˣ`, there is a unique semiring map
`Qsf₀(K)→S` with these variable values; restriction to units is the preceding
coefficient-semifield map. Prove the two constructions agree.

**Checks.**

- `Trop(Empty)` has one element, while `Qsf(Empty)` consists of positive rationals;
  adjoining zero gives the Boolean semifield and `ℚ≥0`, respectively.
- Positive rational pairs form an addition-closed subgroup of `(ℚ×ℚ)ˣ`.
- Zero adjunction and restriction to units preserve auxiliary addition on both round trips.
- `ℕ` is zero-sum-free but its units are not addition-closed; a nontrivial ring is not zero-sum-free.
- Localizing at regular elements preserves injectivity even when the coefficient ring has zero divisors.
- In `Trop({1,2})`, `z₁ ⊕ z₂ = 1` and `z₁⁻¹z₂²` evaluates to `q₁⁻¹q₂²` under the group evaluation.
- Reindexing `Trop({1,2})` by the transposition sends `z₁⁻¹z₂²` to `z₁²z₂⁻¹`.
- In `Qsf({1,2})`, `(u₁²+u₁u₂)/(u₁+u₂)` evaluates to `y₁` under every coefficient semifield homomorphism.
- In the same `Qsf({1,2})`, `(u₁+u₂)⁻¹` evaluated at `(z₁,z₂)` in `Trop({1,2})` is one.

*Needs:* Mathlib commutative (semi)rings, `Units`, `WithZero`, monoid algebras,
multivariable polynomials, `Localization`, `IsLocalization` and fraction rings.
The linearly ordered comparison uses
`MinTropical`/`MaxTropical`.
FZ IV §2, Definitions 2.1–2.2, gives the universal and tropical models.

### 0.2 Laurent and rational-function models

For a commutative semiring `R` and a type `K`,
`L(R,K)` (`LaurentRing`) is `AddMonoidAlgebra R (K →₀ ℤ)`, with coefficients,
support and monomial `Basis`.
Prove that `MvPolynomial K R → L(R,K)` is injective and is the localization at the
variables (`IsLocalization`), `IsDomain` for an additively cancellative domain semiring `R`,
reindexing along `K ≃ K'`, and,
for a commutative `R`-algebra `A`, the unique `L(R,K) →ₐ[R] A` with `X_i ↦ x_i` for
`x : K → Aˣ`. Construct coefficient maps along `R →+* R'`, injective along injective maps,
with identity, composition and reindexing laws, and `IsLocalization` of `L(R',K)` over
`L(R,K)` when `R'` localizes `R`. A Laurent chart in a
commutative `R`-algebra `B` is an injective `L(R,K)→ₐ[R]B`.
Its coordinate map evaluates the basis monomials `X_i`, which are units.
Construct the canonical chart in `T(L(R,K))`. A generating regular chart
(`Seed.IsGenerating`, for the chart of a seed over a commutative ring)
includes an equivalence `T(L(R,K))≃ₐ[R]B` extending this chart; §0.5 constructs
these after regular exchanges. Prove coefficient, reindexing and chart-composition
laws without assuming that `B` is a field.
For a domain ring `R` and a field `F`, prove that charts correspond to
`x : K → Fˣ` algebraically independent over `R`, and those
whose image generates `F` as a field to
transcendence bases generating `F` with the image of `R`; for these construct
`IsFractionRing L(R,K) F` and `IsFractionRing (MvPolynomial K R) F`, with model
`FractionRing (MvPolynomial K R)`. Public results hold for every generating chart and
transport along `F ≃ₐ[R] F'`.

For a coefficient semifield `P`, define
`Pos₀(P,K)=T(ℕ[P][x_i:i∈K])` and `Pos(P,K)=Pos₀(P,K)ˣ`.
The coefficients in `ℕ[P]` use the multiplicative group of `P` and formal
addition. Its embedding in the domain `ℤ[P]` makes every nonzero polynomial
regular. Construct the zero-sum-free semifield structure on `Pos₀(P,K)`
and its embedding in `FractionRing L(ℤ[P],K)`; its units are the ratios
of nonzero natural-coefficient polynomials. Construct
`Pos₀(P,K)≃ₐ[ℕ[P]]T(L(ℕ[P],K))`, commuting with coefficients and
variables. For the one-element `P`, identify it with `Qsf₀(K)`.

For any coefficient semifield `Q`, group map `φ:P→Q` and `a:K→Q`,
construct the unique semiring map `Pos₀(P,K)→Q₀` extending polynomial
evaluation. Every nonzero polynomial evaluates to a unit, so this is
the localization lift of §0.1. Its restriction `Pos(P,K)→Q` preserves
auxiliary addition. Prove naturality, reindexing and finite-support laws.
An addition-closed subgroup `Q≤Rˣ` gives evaluation in the ambient
commutative semiring `R` by composition with its inclusion.

**Checks.**

- For an empty index set, the Laurent algebra is the scalar ring.
- In the standard two-variable chart over ℤ, the Laurent monomials remain linearly independent.
- Evaluation at `X=1` defines a Laurent algebra map over ℤ with kernel containing `X−1`.
  Evaluation at `X=2` cannot take values in ℤ, since it must also evaluate `X⁻¹`.
- Sending `X↦t` into `ℚ(t,s)` gives a faithful Laurent chart over ℤ that generates
  the proper subfield `ℚ(t)`.
- Sending `X↦t` into `ℚ(t)` gives a generating chart whose image is
  `ℤ[t^{±1}]` and whose fraction field is `ℚ(t)`.

*Needs:* Mathlib monoid algebras, multivariable polynomials, localization and algebraic
independence; Tau Ceti one-variable Laurent evaluation.

### 0.3 Expansions and coefficient rings

For a Laurent chart over a commutative semiring R, `L_{R,t}` is its range.
Construct the inverse `laurentExpansion_t : L_{R,t} ≃ₐ[R] L(R,K)`, finitely supported coefficients,
and compatibility with coefficient inclusions, reindexing and `F ≃ₐ[R] F'`. For
generating regular `t,t'`, the transition automorphism of `T(L(R,K))` sends `laurentExpansion_t f`
to `laurentExpansion_{t'} f` for `f ∈ L_{R,t} ⊓ L_{R,t'}`; it need not preserve `L(R,K)`.
For a domain ring, identify this with the corresponding fraction-field transition.
For `R=ℤ[P]`, `f ∈ L(ℤ[P],K)` (or `laurentExpansion_t f`) is positive when its coefficients lie in
`ℕ[P]`, equivalently lies in the image `ℕ[P][X_i^{±1}]` of
`AddMonoidAlgebra (MonoidAlgebra ℕ P) (K →₀ ℤ)`, a `Subsemiring`.
For any commutative semiring C, any `J` and `S⊆J`, construct
`C_S=C[z_j:j∈J][z_s⁻¹:s∈S] ⊆ C[Trop(J)]` as a localization of
`MvPolynomial J C`, with C-basis the finitely supported `z^a` satisfying
`a_j≥0` for `j∉S`. Prove `C_∅≃MvPolynomial J C`, `C_J=C[Trop(J)]`, and
that `C_T` localizes `C_S` at `z_t` (`t∈T\S`) for `S⊆T`, compatibly with
all coefficient maps. Write `R_S` for `C=ℤ`; retain `C_S` for general scalars.

**Checks.**

- For `S={1}⊆J={1,2}`, the monomial `z₁⁻¹z₂²` belongs to `R_S`, while `z₂⁻¹` first enters on inverting `z₂`.
- For the rank-one chart change `x'=2/x`, the Laurent polynomial `x` in the old chart has
  coefficient `2` at exponent `−1` in the new chart.
- With trivial coefficients, `1+x⁻¹` is positive and `1−x⁻¹` fails the coefficient test.

*Needs:* §§0.1–0.2 for coefficient semifields, Laurent charts, and their evaluation and coefficient
maps.

### 0.4 Based quantum tori and Ore realizations

Let `R` be a commutative semiring, `u∈Rˣ` a unit, `L` a finite free lattice
and `Λ:L×L→ℤ` an alternating bilinear form. Bilinearity and `Λ(0,a)=Λ(a,0)=0`
give a normalized factor set `α(a,b)=u^{Λ(a,b)}` on `Multiplicative L`.
Define `T(R,u,Λ)` as `TauCeti.twistedMonoidAlgebra` for this factor set.
Write `X^a` for its basis monomial at `a∈L`.
The multiplication rule
`X^a X^b=u^{Λ(a,b)}X^{a+b}` gives inverse monomial `X^{-a}` and the untwisted
product at `u=1`. For `Λ=0` use `TwistedMonoidAlgebra.monoidAlgebraEquiv`.
Quantum cluster notation takes `u=v` and `q_cl=v²`, so
`X_i X_j=v^{2Λ_ij}X_j X_i`.

Over a commutative ring, let `z^a` denote the basis monomial of the full
`QuantumMonoidAlgebra` of ScatteringDiagrams §4.3 with `q=u` and `β=Λ`.
The positive degree datum can be `(L,{0},0)` for this use of the full algebra.
The unit and multiplication rules for `z^a` give an `R`-algebra map from
`T(R,u,Λ)` by `TwistedMonoidAlgebra.lift` of `a↦z^a`. Prove that it is an
isomorphism since it sends the basis `X^a` to the basis `z^a`. Transport
§4.3's coefficient and lattice maps along this isomorphism at their source and target.

For a basis of `L`, construct the quantum polynomial and mixed Laurent subalgebras by
support, with monomial bases and localization at selected monomials. Universal
property: for `S` a subset of the basis, an `R`-algebra `A` and `U_i∈A` with
`U_iU_j=u^{2Λ_ij}U_jU_i` and `U_s` a unit for `s∈S`, there is a unique `R`-algebra map
from the subalgebra with exponents `a_i≥0` (`i∉S`) sending `X_i` to `U_i`. For any total
order on the basis it sends `X^a` to `u^{-Σ_{i<j}a_i a_j Λ_ij}∏_iU_i^{a_i}`, the product
taken in that order; the result is independent of the order.

For the fraction constructions assume `R` is a commutative ring. Derive
[`UniqueSums`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/UniqueProds/Basic.html#UniqueSums)
for the finite free lattice L and prove `T(R,u,Λ)` is a domain when R is a domain.
Over a field it
satisfies the left and right Ore conditions; prove them (they may then be registered as
instances) rather than assuming them as instance arguments.
Construct its skew field of fractions with `OreLocalization`, using
`OreLocalization.oreDiv_eq_iff`, `OreLocalization.numeratorHom_inj`, the existing
division-ring instance and `OreLocalization.universalHom` with its uniqueness
theorem. Prove the coefficient, lattice and chart comparisons for these fraction
constructions. For a domain `R`, coefficient change embeds `T(R,u,Λ)` in
the skew field of fractions of `T(FractionRing R,u,Λ)`. A quantum chart is an injective
`R`-algebra map of `T(R,u,Λ)` into a division ring; it is generating when its image
generates that ring. Generating charts determine their ambient division ring up to
unique isomorphism. The Laurent theorems of Layers 1–2 use only injectivity of charts.

Seeds use the following presentation of charts by normalized monomials. Let R
be a commutative semiring, `u∈Rˣ`, I a finite type, Λ an integer alternating
form on `ℤ^I` and B an R-algebra, not necessarily commutative. A based chart
(`BasedChart`) for `(R,u,Λ)` in B is a family `M:ℤ^I→Bˣ` with `M(0)=1`,
`M(a)M(b)=u^{Λ(a,b)}M(a+b)`, where `Λ(a,b)=Σ_{i,j}a_iΛ_ij b_j`
(`formPairing`), and R-linearly independent values: finite
R-combinations of the `M(a)` have unique coefficients. Its coordinates
(`BasedChart.coordinate`) are `X_i=M(e_i)`, and its chart map
(`BasedChart.eval`) sends a finitely supported family f to `Σ_a f_aM(a)`.
Let `χ:T(R,u,Λ)→ₐ[R]B` be `TwistedMonoidAlgebra.lift` applied to the
monomial family. The chart map on coefficient families is the composition
of the inverse basis representation (`TwistedMonoidAlgebra.basis` with
`repr.symm`), `f↦Σ_a f_aX^a`, with the underlying linear map of `χ`.
Here the basis index `Multiplicative (ℤ^I)` is identified with `ℤ^I`.
Prove that the chart map is injective and that the
ordered-product formula determines a based chart from its coordinates.
Transport based charts along reindexing and injective R-algebra maps of B.
Prove that `M(a)=χ(X^a)` gives a bijection from injective
R-algebra maps `χ:T(R,u,Λ)→B` to based charts; quantum charts are those with
B a division ring. For `u=1`, `Λ=0` and commutative B, prove that
`M(a)=c(X^a)` is a bijection from §0.2's Laurent charts c of `L(R,I)` to based charts.

**Checks.**

- For `Λ(e₁,e₂)=1` and `S={1}`, the mixed algebra contains `X₁⁻¹` and `X₂`
  while `X₂⁻¹` fails the support condition. Its normalized monomial at
  `−e₁+2e₂` is `u²X₁⁻¹X₂²`.
- At `u=1` the same mixed algebra is `R[X₁^{±1},X₂]`, even for `Λ≠0`.
- In the skew field of fractions of the rank-two torus, verify that the nonzero element `1+X₁`
  becomes a unit while `X₂(1+X₁)=(1+u⁻²X₁)X₂`.

*Needs:* Mathlib lattice, monomial support and Ore localization APIs, Tau Ceti's
twisted monoid algebra and ScatteringDiagrams §4.3 for the coefficient and lattice maps.

### 0.5 One-exchange algebra

Let `C` be a subsemiring of a semiring `B`, and let `x∈Bˣ` normalize C,
so conjugation by x induces an automorphism `σ` of C. Assume finite
Laurent expansions in x have unique left coefficients in C. Write
`C⟨…⟩` for the subsemiring generated by C and the listed elements,
`C[p^{±1}]=C⟨p,p⁻¹⟩` for a unit p, and `C[p]=C⟨p⟩`.
When C is a subring of a ring, these are subrings.

Let `E∈C` be a unit in B that normalizes C, and put `y=Ex⁻¹`,
`P_0=1`, `P_{r+1}=P_rσ^{-r}(E)`. Prove:

- y normalizes C, Laurent expansions in y have unique left coefficients,
  and `y^r=P_r x^{-r}`;
- `Σ_m c_m x^m∈C[y^{±1}]` if and only if `c_{-r}∈C P_r` for every `r>0`;
- `C[x^{±1}]∩C[y^{±1}]=C⟨x,y⟩`, with unique finite normal forms
  `c_0+Σ_{r>0}(c_r x^r+c'_r y^r)`.

For a commutative semiring C and a regular `E∈C`, construct this exchange
in `B=C[E⁻¹][x^{±1}]`. Regular localization gives the injective coefficient
map and the faithful x-chart; the theorem gives the faithful y-chart.
Here `P_r=E^r`, and exchanging x and y is an involutive
`C[E⁻¹]`-algebra automorphism. Construct the induced equivalence
`T(C[Y^{±1}])≃ₐ[C]T(C[X^{±1}])`, characterized by `Y↦EX⁻¹`,
using the localization comparisons of §§0.1–0.2. For a semiring map
`f:C→S`, a unit `a∈Sˣ`, and `f(E)` a unit, evaluation `x↦a` on B
restricts on the y-chart to `y↦f(E)a⁻¹`. Prove this on every Laurent
polynomial, compatibly with composition of coefficient maps and with
any extension of evaluation to the total quotient semirings.

For `C=L(R,I∖{k})`, construct the resulting automorphism of
`T(L(R,I))`, fixing the other coordinates. Transport it to every
generating regular chart, with uniqueness, inverse and reindexing laws.
For a commutative domain, identify these constructions with the same
exchange in its rational-function field.

For the quantum realization, take B to be a division ring, C a subring,
and x and E nonzero normalizing elements. For R-algebra maps
`χ:T(R,u,Λ)→B` and `χ':T(R,u,Λ')→B` on `ℤ^I`, suppose the maps
agree off k and the forms agree on the other-coordinate lattice.
If χ is faithful and χ' sends the kth coordinate to `Ex⁻¹`, where
`x=χ(X_k)` and E belongs to and normalizes the common other-coordinate
ring C, prove that χ' is faithful and the two charts generate the same
division subring. Thus both realizations construct the new chart from
the exchange data. Their coefficient criterion and normal forms give Q1.
See BFZ III, Lemmas 4.1–4.2, for the commutative case and BZ,
Lemmas 5.5–5.6, for quantum exchange.

Give the form of this theorem for based charts, which §1.2 uses in every
ambient algebra. Let R be a commutative semiring, M a based chart for
`(R,u,Λ)` in an R-algebra B (§0.4) and k an index. Let C be the R-span of
the `M(a)` with `a_k=0` and put `x=M(e_k)`; independence of M gives unique
left coefficients in C for Laurent expansions in x. Let `y∈Bˣ` and an
additive map λ on the exponents with `a_k=0` satisfy `yx∈C` and
`yM(a)=u^{2λ(a)}M(a)y`. Prove that `E=yx` is a unit of B normalizing C, and
that the family `M'(a)=u^{−a_kλ(a°)}y^{a_k}M(a°)`, `a°=a−a_ke_k`, is
R-linearly independent. It is the based chart for the
alternating form that agrees with Λ on the exponents with `a_k=0` and has
`Λ'(e_k,a°)=λ(a°)`. For a division ring B this is the preceding statement.

For the interacting intersections of Q2, prove the following ring statements:

- *patching*: for a subring H of any ring, finite `a_l,u_l∈H` with
  `Σ_l a_lu_l=1` and `f a_l∈H` give `f∈H`. Give the left-sided form through
  the opposite ring. The two-denominator form with `a_1=a^r`, `a_2=b^s`
  gives the comaximal-localization intersection theorem;
- *unit constant terms*: for C a subring of a division ring and z a
  nonzero element normalizing C, the elements `c(1+zw)` with `c∈Cˣ`,
  `w∈C[z]` are closed under products and conjugation by any g normalizing
  C with `gzg⁻¹∈zC`. Each has a right inverse modulo `z^sC[z]` for every s.

**Checks.**

- For the exchange `y=2/x` over ℤ, `2x⁻¹` and `4x⁻²` belong to the intersection and `x⁻¹` and `2x⁻²` fail the coefficient test.
- When `xz=v²zx` and `y=(1+z)x⁻¹`, the coefficient of `x⁻²` in `y²` is `(1+z)(1+v⁻²z)`.
- For `w=1`, the finite geometric series `1−z+z²` is a right inverse of `1+z` modulo `z³C[z]`.

*Needs:* §§0.1–0.2 for regular localization and Laurent charts; §0.4 for based tori;
Mathlib subsemirings, subrings and opposite rings.

### 0.6 Support and central divisibility

For a twisted lattice algebra over a domain
and an integer weight `w`, the least and greatest homogeneous parts of nonzero elements
are nonzero and multiplicative, so `lo_w`, `hi_w` and `width_w=hi_w-lo_w` are additive;
the ordinary Laurent ring is the trivial-twist case. In an ordinary lattice Laurent ring
over a domain, let nonzero P,Q have supports in `ℤa`, respectively `ℤb`, for
linearly independent a,b. Prove that P and Q are relatively prime if P has a unit
coefficient; use width to make every common divisor a single monomial, and its
divisibility into the unit coefficient to make it a unit. In particular,
`1+cX^a` and `1+dX^b` are relatively prime for units `c,d` and rationally
independent `a,b`, and so are `∏_r(1+c_rX^a)` and
`∏_s(1+d_sX^b)` for units `c_r,d_s`;
prove polynomial descent for polynomials with no variable factor.

For every commutative ring R and `f∈R[S^{±1}]`,
`g∈R[T^{±1}]` whose highest nonzero coefficient is a unit, prove
`(f)∩(g)=(fg)` in `R[S^{±1},T^{±1}]`. Indeed multiplication by g is
injective on `(R[S^{±1}]/(f))[T^{±1}]`, by its unit leading coefficient.
Apply the same argument to all powers and products of such one-variable
polynomials. This works even when the quotient by f has zero divisors.

For a commutative domain D and nonzero E,F, prove that
`(E)∩(F)=(EF)` implies `(E^r)∩(F^s)=(E^r F^s)` for all `r,s≥0`.
Use this with the flat-module transport below for powers of exchange factors.

For a sublattice `N` with `Λ(N,L)=0`, `T=T(R,u,Λ)` is free over the central subalgebra
`R[N]`, and `Tf∩Tg=T(fg)` for relatively prime `f,g∈R[N]` in a decomposition monoid.
For factorial R and finite-rank free N, prove that `R[N]` is factorial, including
`Z_v[N]` and `ℤ[N]`; these are sufficient criteria for general factors, not
hypotheses of Q2's separated-polynomial argument.
For a domain R, put `L_u={a∈L:∀b∈L,u^{2Λ(a,b)}=1}`. Prove that the center
is the span of `X^a` for `a∈L_u`, with the restricted twisted multiplication.
A chosen basis of L_u gives an equivalence with an ordinary lattice Laurent
algebra; it need not preserve normalized monomials. If no nonzero power of
`u²` is 1, then `L_u=rad Λ` and the canonical center is `R[rad Λ]`.
See BZ, Proposition 11.2, for the center and the intersection of principal central
ideals at the generic quantum parameter.
Neither a Bézout hypothesis nor a noncommutative UFD is used.

Prove the shared scalar-divisibility statement for a flat module M over a
commutative ring R: `(p)∩(q)=(pq)` implies `pM∩qM=(pq)M`, where `pM` is the
image of scalar multiplication by p. Give the elementwise and submodule forms,
and apply it to flat R-algebras, including noncommutative algebras with their
central structure maps. The free-over-center argument above is an instance.

**Checks.**

- In the ordinary two-variable Laurent ring, `1+a` and `1+b` are relatively prime but generate a
  proper ideal, as evaluation at `a=b=−1` shows.
- Over `𝔽₂`, `1+T` remains regular modulo `1+S²` despite the nonreduced quotient.
- At `u=−1` all monomials are central, and for `Λ(e₁,e₂)=1` the normalized product `X₁X₂=−X^{e₁+e₂}` still records the twist.

*Needs:* §0.4 for twisted support and central monomials; Mathlib ideals, relative primality and flat
modules.

### 0.7 Finite polynomial replacement

Let D be a division ring, C a subring,
and x,z nonzero elements normalizing C. Let x*,z*,z** lie in D, let A be a finite
index set, `N∈ℕ`, `n:A→ℕ` with `n_a≤N`, and `c_a∈C`, `d_a,g_a∈D`. Let `φ∈C`, `n₀,m₀∈D`
satisfy `φn₀=m₀`. Suppose the actual exchange identities and defects are

```
z* · z = n₀ + Σ_a x^{n_a} c_a,
z** · z = (x*)^N m₀ + Σ_a (x*)^{N-n_a} d_a,
(x*)^{n_a}x^{n_a} - g_a ∈ z C[z],
d_a = g_a x^{-n_a} φ x^{n_a} c_a.
```

Here `C[z]` and its left coefficients have §0.5's meaning; `z C[z]` is the image
of left multiplication by z. Construct the correction and prove

```
z** = (x*)^N φ z* - Σ_a (x*)^{N-n_a}
       ((x*)^{n_a}x^{n_a}-g_a) x^{-n_a}φx^{n_a}c_a z⁻¹,
z** ∈ C⟨x*,z*,z⟩.
```

Give reindexing and zero-term insertion/removal laws. Prove the scalar, singleton
and finite-sum cases from this same identity. The singleton case with `n_a=N=r`,
`φ=m₁n₁⁻¹`, `n₀=n₁`, `m₀=m₁` gives binary replacement for the classical and
quantum instances of Q2, as in BFZ III, Lemma 4.6, and BZ, Lemma 5.8.

For a commutative coefficient ring R, construct
`D_{P,n}(T)=(P(T)^n-P(0)^n)/T` by shifting coefficients, proving
`T D_{P,n}=P^n-P(0)^n`, coefficient change and evaluation laws. For `P,Q∈R[T]`,
`e≥natDegree Q`, a ring map `f:R→F` into a field and nonzero x,y with
`xz=P_f(y)`, `yw=Q_f(x)`, apply the finite replacement with `n₀=m₀=0`, `φ=1`,
`n_a=a`, `c_a=f(Q.coeff a)`, `g_a=f(P(0))^a` on the support of Q. Prove
`(Σ_a f(Q.coeff a)f(P(0))^a z^{e-a})/y∈H` for every subring H containing
`f(R),y,z,w`. This is a commutative instance of the division-ring replacement,
not a commutativity assumption on the quantum ambient ring. Polynomial and quantum
seed instances construct all displayed identities from their exchange data;
no seed stores these local conclusions or Laurent membership as fields.

**Checks.**

- With an empty index set, `N=0` and `φ=n₀=m₀=1`, the correction vanishes and `z**=z*=z⁻¹`.
- For `x*=(1+z)/x` and `z*=(1+x)/z`, verify `(1+x*)/z=x*z*−1`.
- With `z*=(1+x+x²)/z` instead, verify `(1+x*+(x*)²)/z=(x*)²z*−x*−z−2`.

*Needs:* §0.5 for embedded skew polynomial rings and left coefficients; Mathlib polynomial
coefficients and evaluation.

### Examples

Use the rank-two determinant lattice to compare the ordinary Laurent chart, the based quantum torus, and the one-exchange normal forms of §§0.2, 0.4 and 0.5.

- For `Λ(e_1,e_2)=1`, `xy=uX^{e_1+e_2}`, `yx=u⁻¹X^{e_1+e_2}` and
  `X^{e_1+e_2}=u⁻¹xy=u yx`. At `u=1` the torus is commutative even though Λ
  is nonzero; in rank zero it is R.
- In the generic skew field with `xz=v²zx`, take `C=ℚ(v)[z^{±1}]`,
  `E=1+z` and `y=Ex⁻¹`. Then `y²=(1+z)(1+v⁻²z)x⁻²`, not `E²x⁻²`.
  In the commutative case `C=ℤ`, `E=2`, the coefficients required for
  `x⁻¹,x⁻²` are respectively divisible by 2 and 4: `2x⁻¹,4x⁻²` belong to
  the intersection, while `x⁻¹,2x⁻²` do not.
- In `ℤ[a^{±1},b^{±1}]`, `1+a` and `1+b` are relatively prime but do not
  generate the unit ideal, as evaluation at `a=b=−1` shows. Replacing
  `1+b` by `1+a³` gives the nonunit common divisor `1+a`. In §0.6's center
  statement, `u=1` and a nonzero form give the whole commutative torus as
  center, so the infinite-order hypothesis cannot be omitted there.
- The separated-factor intersection holds over the nonfactorial domain
  `ℤ[√−5]`. Over `𝔽₂`, `f=1+S²` gives a nonreduced quotient, but
  `g=1+T` is still regular modulo f. Without the unit-leading-coefficient
  condition, `f=g=2` over `ℤ/4ℤ` gives `(f)∩(g)=(2)≠(fg)=0`.
  At `u=−1`, `Λ(e_1,e_2)=1`, every monomial is central but
  `X^{e_1}X^{e_2}=−X^{e_1+e_2}`; the center is not basiswise the untwisted ring.
- In §0.7, an empty sum with `N=0`, `φ=1`, `n₀=m₀=1` gives `z**=z*=z⁻¹`.
  For independent x,z over ℚ and `x*=(1+z)/x`, the singleton exchange
  `z*=(1+x)/z` gives `(1+x*)/z=x*z*−1`. The two-term exchange
  `z*=(1+x+x²)/z` gives `((x*)²+x*+1)/z=(x*)²z*−x*−z−2`.
  At `x=z=1` these two identities have values 3 and 7 respectively.

### Dependencies

Mathlib supplies the algebraic carriers. Tau Ceti supplies the twisted monoid algebra
for the quantum torus. ScatteringDiagrams §4.3 supplies its coefficient and lattice maps.

## Layer 1: classical and quantum seeds and mutation

### 1.1 Exchange matrices

A symmetrizer of `B : Matrix K K ℤ` is `s : K → ℤ` with
`s_i>0` and `s_i b_ij = -s_j b_ji`. An exchange matrix (`ExchangeMatrix`) is `B` with a symmetrizer as
data. The raw matrix mutation `matrixMutation` acts on `B` alone. Write `[a]_+ = max(a,0)`. For `k∈K`, define

```
b'_{ij} = −b_{ij}   if i = k or j = k,
b'_{ij} = b_{ij} + [b_{ik}]_+[b_{kj}]_+ − [−b_{ik}]_+[−b_{kj}]_+  otherwise.
```

For finite I,K, an extended matrix is `B̃ : Matrix I K ℤ` with a mutable
embedding `row:K↪I`, whose principal block `B̃(row i,j)` is an exchange matrix.
Matrix mutation uses the same formula on all rows. Let J be the complement of
the mutable image and give the presentation `I≃K⊔J`, with row as the mutable
inclusion. Prove transport along equivalences commuting with row. In the
formulas below a mutable index in I means its image under row. Prove `μ_kμ_k=id`, that
symmetrizers of `B` symmetrize `μ_kB`, zero diagonal, and commutation of `μ_k` with the
principal block, reindexing along `K≃K'`, `J≃J'`, and `fromBlocks B₁ 0 0 B₂`. For `B̃`
with skew-symmetric principal block, `q_ik=[b_ik]_+`, `q_ki=[-b_ik]_+` (`i∈I`, `k∈K`),
`q_jj'=0` (`j,j'∈J`) is a bijection onto ice quivers `q : I → I → ℕ` with frozen
vertices `J`, `q_ii=0`, `q_ij q_ji=0` and no arrows between frozen vertices; prove it
intertwines `μ_k` with ice-quiver mutation at mutable `k` (add `q_ik q_kj` arrows `i→j`,
reverse arrows at `k`, cancel 2-cycles, delete arrows between frozen vertices).

For `b_kk=0` and `ε∈{1,-1}`, prove `μ_k(B̃)=E_ε B̃ F_ε`, where `E_ε : Matrix I I ℤ` is
the identity except in column `k`, with `(E_ε)_kk=-1`, `(E_ε)_ik=[-ε b_ik]_+` for `i≠k`,
and `F_ε : Matrix K K ℤ` is the identity except in row `k`, with `(F_ε)_kk=-1`,
`(F_ε)_kj=[ε b_kj]_+` for `j≠k`. Prove `E_ε²=1`, `F_ε²=1`, `rank_ℚ μ_k(B̃)=rank_ℚ B̃`,
and reindexing laws. The classical and quantum layers share this factorization.
Write `matrixMutationWord` for the iteration of matrix mutation in word order.

Let Λ be an alternating integer form on `ℤ^I`. For `w:K→ℤ`, define column
compatibility (`ColumnCompatible`) by `B̃ᵀΛ=(diag(w) 0)` in the mutable/frozen
presentation, or entrywise by `Σ_i b_ik Λ_il=w_k` when `l=row k` and zero
otherwise. The weights w are determined by B̃ and Λ; they may be zero or
negative. Alternation of `B̃ᵀΛB̃=diag(w)B` gives `w_i b_ij=−w_j b_ji`.
Form mutation (`formMutation`) is `Λ'=E_εᵀΛE_ε`, with `B̃'=E_ε B̃ F_ε`.
Prove independence from ε, preservation of alternation and column
compatibility with the same w, and involutivity. For compatibility, use the
weight identity together with the opposite signs of nonzero `b_ik,b_ki` to
obtain `w_i[−ε b_ik]_+=w_k[ε b_ki]_+`. The positive symmetrizer d remains the
matrix's symmetrizer throughout (BZ, Definition 3.1 and Propositions 3.3, 3.4
and 3.6, for `w=d>0`). A column with nonzero weight is nonzero. The zero form
is compatible with every matrix, with zero weights.

Use the general column API for matrices over a field: independence of the
columns is equivalent to full column rank when K is finite. Prove that
rescaling columns by nonzero scalars preserves independence, and use the
invertible factors E and F to preserve rational column independence under
mutation. For divisible integral columns, dividing each column by a positive
integer preserves this independence.

**Checks.**

- For `B=((0,1),(−2,0))`, the symmetrizer `(2,1)` works for both `B` and `μ₁(B)=−B`.
- For the rank-one extended column `(0,1)ᵀ`, the frozen row changes sign and the rational column rank stays one.
- For the quiver `1→2→3`, mutation at 2 adds `1→3` and reverses the two arrows incident to 2.

*Needs:* Mathlib matrices, finite products, linear independence and equivalences.

### 1.2 Seeds and their realizations

A Y-seed is `(y,B)`, with `y:K→P` in a coefficient semifield P and B
an exchange matrix on K. Its mutation is given by the Y-formulas below.

**Coefficient systems.** An exchange polynomial (`ExchangePolynomial`) over a
commutative monoid with zero 𝕂 is a specified degree `r>0` with coefficients
`h_0,…,h_r∈𝕂` whose endpoints `h_0,h_r` are units. Write
`H(T)=Σ_l h_lT^l`. Its reversal (`ExchangePolynomial.reverse`) is
`T^rH(T⁻¹)`; for units κ and e its dilation (`ExchangePolynomial.dilate`) is
`H(κT)`, with coefficients `κ^lh_l`, and its multiple
(`ExchangePolynomial.scale`) is `eH`. These operations use only the
multiplication of 𝕂. The binary polynomial (`ExchangePolynomial.binary`) is
`1+T`.

A coefficient system (`CoefficientSystem`) over a commutative semiring R
consists of such a 𝕂, a map `φ:𝕂→R` preserving 0, 1 and products, and a
normalizer ν assigning a unit `ν(H)∈𝕂ˣ` to every exchange polynomial H over
𝕂, such that

- `ν(H^rev)=ν(H)` for the reversal `H^rev` of H;
- `ν(ν(H')H)·ν(H')=ν(H)` for all H and H'.

The system says where the coefficients live, how they act as scalars, and
how exchange polynomials are normalized. The map φ need not be additive or
injective. Put `N(H)=ν(H)H` (`CoefficientSystem.normalize`), and call H
normalized when `ν(H)=1`. Prove that
N is idempotent, that reversal preserves normalized polynomials, that ν is
homogeneous of degree −1 for the subgroup `G_ν≤𝕂ˣ` generated by its values,
and that the normalized polynomials are a reversal-stable set of
representatives for the scaling action of `G_ν`; conversely such a subgroup
and set of representatives determine ν. The scalar system (`CoefficientSystem.trivial`) of R has `𝕂=R`,
`φ=id` and `ν=1`. A map of coefficient systems over R is a map `ψ:𝕂→𝕂'`
preserving 0, 1 and products with `φ'∘ψ=φ` and `ν'(ψH)=ψ(ν(H))`; prove its
identity and composition laws. This roadmap uses the scalar system, for
polynomial mutation (§1.5), and the normalized system of a coefficient
semifield below.

**Exchange data.** Fix a finite type I, a type K and an embedding
`row:K↪I`. Exchange data (`ExchangeData`) over 𝕂 consist of an extended
exchange matrix B̃ and exchange polynomials `H_k`, `k∈K`, over 𝕂 whose
degrees `r_k` divide every entry of column k. Put `β_k=b_{•k}/r_k`
(`ExchangeData.dividedColumn`), `β_kj=b_kj/r_j` and
`κ_{kj}=h_{k,r_k}^{[β_kj]_+}h_{k,0}^{−[−β_kj]_+}∈𝕂ˣ`
(`ExchangePolynomial.dilationFactor`).
Mutation at k has three steps: mutate B̃ by §1.1 and reverse `H_k`; dilate
every other polynomial to `H_j(κ_{kj}T)`; normalize it, so
`H'_j=N(H_j(κ_{kj}T))` (`ExchangeData.mutatedPolynomial`). The dilation is the propagation law of exchange
patterns: mutation at k dilates every other exchange polynomial by a unit
determined by the endpoint coefficients of `H_k` (FZ I, Definition 2.1,
axiom (2.7), for binomials; Chekhov–Shapiro, (2.5)). It prescribes `H'_j` up
to a unit, and the normalizer chooses the unit. Prove preservation of
degrees, column divisibility and unit endpoints; that the reversal of `H_k`
with the entry `−β_kj` has dilation factor `κ_{kj}⁻¹`; that data all of
whose polynomials are normalized (`ExchangeData.IsNormalized`) stay so; and that mutation is an
involution on normalized data. Prove reindexing laws and that maps of
coefficient systems commute with mutation.

Write `H_k(1)=Σ_lφ(h_{k,l})∈R` (`ExchangeData.valueAtOne`). In `D_k=L(R,I∖{row(k)})`, the exchange
numerator of normalized data d is

```
m_{k,±} = ∏_{i≠row(k)} X_i^{[±β_ik]_+},
E_k = Σ_{l=0}^{r_k} φ(h_{k,l}) m_{k,+}^l m_{k,−}^{r_k−l}.
```

Prove `E_k(μ_k(d))=E_k(d)`.

**Seeds.** Let `u∈Rˣ` and let B be an R-algebra, not necessarily commutative.
A seed (`Seed`) of a coefficient system over `(R,u)` in B consists of
normalized exchange data d, called its state, an alternating integer form Λ
on `ℤ^I`, weights w satisfying §1.1's column compatibility with the matrix
of d, and a based chart M for `(R,u,Λ)` in B (§0.4). Its exchange element
(`Seed.exchangeElement`) at k, with the exponents
`ExchangeData.exchangeExponent`, is

```
X'_k = Σ_{l=0}^{r_k} φ(h_{k,l}) M(−e_k + l[β_k]_+ + (r_k−l)[−β_k]_+).
```

Mutation at k (`Seed.IsMutation`) is defined when `X'_k` is a unit of B. The
new seed has state `μ_k(d)`, form `Λ'` of §1.1, the same weights, and the
based chart with coordinate `X'_k` at `row(k)` and all other coordinates
unchanged (`Seed.mutatedMonomial`):

```
M'(a) = u^{−Λ'(a_k e_k, a°)} (X'_k)^{a_k} M(a°),    a° = a − a_k e_k.
```

Prove quasi-commutation of the new coordinates for `Λ'` from column
compatibility and faithfulness of the new chart from §0.5; neither is seed
data. These data then form a seed, the only one carrying them
(`Seed.existsUnique_isMutation`). Prove that the exchange element of the new seed at k is `X_k`, so the
reverse exchange is defined and recovers the seed. Prove extensionality,
reindexing along equivalences commuting with row, transport along injective
R-algebra maps of B, and transport along maps of coefficient systems, which
preserve exchange elements, mutation, reachability and the algebras of §1.3.
At `u=1` the chart conditions do not involve Λ; the classical realizations
use `Λ=0` and `w=0`.

For a nonzero column the exchange summands have distinct exponents. For a zero
column, `X'_k=H_k(1)X_k⁻¹`. A seed is admissible (`Seed.Admissible`) when
`H_k(1)` is a unit of B for every zero column k. Prove that mutation
preserves admissibility: a column is zero after a mutation exactly when it was
zero before, its polynomial is then reversed or unchanged, and reversal
preserves `H_k(1)`. A class of seeds is total when every
exchange element of its members is a unit and it is closed under mutation;
§1.3's word action is defined on total classes.

**Gauge.** Two seeds over `(R,u)` in B, possibly of different coefficient
systems over R, with the same extended matrix and form are gauge equivalent
when there are units `c_i∈Rˣ`, `i∈I`, and
`e_k∈Rˣ`, `k∈K`, with `M̃(a)=c^aM(a)` and
`φ̃(H̃_k)(T)=e_k·φ(H_k)(c^{−β_k}T)`, where `c^a=∏_ic_i^{a_i}` and `φ(H)` is
the polynomial over R with coefficients `φ(h_l)`.
Prove that then `X̃'_k=e_kc_k⁻¹c^{r_k[−β_k]_+}X'_k`, so a direction is mutable
for one seed exactly when it is for the other, and that the mutated seeds
are gauge equivalent; this uses only the propagation law, with any two
normalizers. Hence the two patterns correspond along every mutation path,
admissibility is gauge invariant, and the chart rings, cluster algebras,
upper cluster algebras and upper bounds over R coincide (§1.3). Over a
subsemiring of scalars that does not contain the gauge units these algebras
can differ. Every seed is gauge equivalent, with `c=1` and `e=1`, to the seed
of the scalar system with the same chart and the polynomials `φ(H_k)`;
thus the pattern of every coefficient system follows
a pattern of the scalar system. The correspondence follows paths; it is not
a bijection of seeds or of cluster variables. Periodicity of a pattern and
finiteness of its set of cluster variables depend on the normalizer: they are
theorems for the normalized system below and can fail for the scalar system.

**Division-ring realizations.** Let R be a commutative ring and B a division
R-algebra D. A based chart in D makes R a domain. Units of D are its nonzero
elements, so admissibility is `H_k(1)≠0` on zero columns. Prove that the
admissible seeds of every coefficient system form a total class, for every unit u and every
compatible form: for a nonzero column the exchange monomials are distinct and
R-independent, and one of them has a unit coefficient. No rank assumption is
used, and the chart need not generate D.

**The regular classical model.** Let C be a commutative semiring and take
`u=1`, `Λ=0`, `w=0`. A generating regular chart of `L(C,I)` in a commutative
C-semialgebra F (§0.2) gives a based chart; a regular seed is a seed with
such a chart. The initial regular seeds are in `T(L(C,I))` with its canonical
chart. For a regular seed, prove that `X'_k` is a unit of F exactly when
`E_k` is regular in `D_k`, and that the mutated seed is regular: its chart is
the transport of §0.5's automorphism of `T(L(C,I))` with
`X_k↦E_kX_k⁻¹`, and the chart equivalence preserves the coefficient map.
The condition is on the formal exchange numerator, not on the value of a
coordinate at a particular point. Over a commutative ring C, prove that `E_k`
is regular for every nonzero column, using a unit endpoint coefficient and a
monomial order, without assuming C is a domain; for a zero column it is
regular exactly when `H_k(1)` is regular. Thus admissibility of a regular
seed over a ring is `IsRegular (H_k(1))` on zero columns, and the admissible
regular seeds form a total class. These are the admitted ring realizations of
Layers 2–5; an admitted domain realization has C a domain. For a domain C the ambient is the usual
rational-function field, a division-ring realization, and admissibility is
the nonvanishing formulation. Over a general commutative semiring each
exchange retains the regularity of its numerator as its condition.

**Normalized coefficients.** Fix a coefficient semifield `P`, a commutative
semiring `C` and a group map `φ:P→Cˣ`. The normalized system has
`𝕂=P₀=P∪{0}` (§0.1), the extension of φ by zero as its scalar map, and
`ν(H)=(⊕_lh_l)⁻¹`, the inverse of the auxiliary sum of the coefficients; the
sum is a unit because the endpoints are. Prove the two normalizer
conditions; here ν is homogeneous for all units of `P₀`. The normalized
polynomials are those with `⊕_lh_l=1` (FZ I, Definition 5.3, in degree one;
Nakanishi, (2.14)). In degree one they are the binomials
`(y⊕1)⁻¹(1+yT)`, `y∈P`, so normalized binomial data are the pairs of an
extended exchange matrix `B̃` and coefficients `y:K→P`. Prove that their
mutation is matrix mutation with Y-mutation using the principal block:
`y_k↦y_k⁻¹` reverses `H_k`, and for `j≠k` the dilation factor is
`κ_{kj}=y_k^{[b_kj]_+}(y_k⊕1)^{−b_kj}`. A normalized seed is a seed of this
system with binomial data; its exchange numerators are

```
E_k = φ(y_k ⊕_P 1)⁻¹ (φ(y_k) ∏_{i≠row(k)} X_i^{[b̃_ik]_+} + ∏_{i≠row(k)} X_i^{[−b̃_ik]_+}) ∈ D_k.
```

The normalizer is formed in P before φ is applied. Since φ need not preserve
addition or be injective, the coefficients y cannot be recovered from the
scalar polynomials; this is why the coefficients live in `P₀` and not in C.
The regular normalized seeds are the regular seeds with coefficients in P.
Prove totality of mutation for the universal positive models and for the
ring realizations specified below. Taking `I=K` and `row=id` gives seeds
with coefficient semifield `P`. For the one-element semifield the normalized
binomial is `1+T`, and the map to the scalar system identifies its seeds
with the binary seeds of §1.4. In degrees `r_k>1` the same system gives
normalized polynomial seeds, the Chekhov–Shapiro seeds with Nakanishi's
normalization. Their Laurentness follows from Layer 2 by gauge equivalence;
the separation, finite-type and positivity theorems of this roadmap concern
normalized seeds.

For the canonical coefficient maps into `ℕ[P]ˣ` and `ℤ[P]ˣ`, every exchange
polynomial is nonzero and regular. The former gives the positive pattern
in `Pos₀(P,I)` through §0.2's chart equivalence; the latter has a fraction
field as its total quotient ambient. For `I=K` over `ℤ[P]`, identify
these regular seeds with FZ tuples `(x,y,B)`, where
`x` is a transcendence basis over `ℤ[P]` generating the ambient field.
The coordinate formula for their mutation is

```
x'_k = (y_k ∏_i x_i^{[b_ik]_+} + ∏_i x_i^{[−b_ik]_+}) / ((y_k ⊕ 1)x_k),
y'_k = y_k⁻¹,
y'_j = y_j y_k^{[b_kj]_+}(y_k ⊕ 1)^{−b_kj}   if j ≠ k.
```

The other coordinates are fixed. Prove that the tuple identification
intertwines mutation and that forgetting the chart gives Y-mutation.
Reindexing acts on the extended matrix, coefficients and chart together;
prove its commutation with mutation. In the square presentation, seeds
related by a simultaneous permutation of `K` are equivalent.

For a commutative ring C and `φ:P→Cˣ`, the regular model gives the
regularity of the exchange polynomial: it is automatic for a nonzero extended
column, and for a zero column it is equivalent to `IsRegular (φ(y_k)+1)`,
since `H_k(1)=φ(y_k⊕1)⁻¹(1+φ(y_k))` and the normalizer `φ(y_k⊕1)` is a unit.
This admissibility condition is mutation invariant: a zero column stays zero
and its coefficient only inverts. Construct mutation, involutivity and word
transport over C on the admissible regular seeds. L8 compares these realizations with
the universal integral pattern, including noninjective coefficient maps.
In finite geometric type (§1.4), the binary coordinate formula is a theorem
about this same mutation. Its iteration acts on the whole seed, including
the extended matrix and generating chart.

For coefficient semifields `P,Q`, a group homomorphism `φ:P→Q`, a Y-seed
`(y,B)` over `P` and `x:K→Q`, define

```
x'_k = (φ(y_k) ∏_i x_i^{[b_ik]_+} ⊕_Q ∏_i x_i^{[−b_ik]_+}) / (φ(y_k ⊕_P 1) x_k),
x'_i = x_i   if i ≠ k.
```

Together with Y-mutation in `P`, this gives a bijection between the copies of
`Q^K` at `(y,B)` and `μ_k(y,B)`. Prove that its inverse is mutation at the latter
seed, and prove the word, reindexing and naturality laws. Only multiplicativity
of `φ` is assumed. For an addition-closed subgroup `Q≤Rˣ` of a commutative
semiring, prove that inclusion in `R` identifies this formula with ordinary
addition and inversion of units. For an addition-preserving group map
`j:Q→Frac(C)ˣ` compatible with a domain realization, prove that evaluation
commutes with mutation; the existence of such a map forces `CharZero C`.
Extend the statements to locally finite skew-symmetrizable exchange matrices
by finite-support reduction for each finite mutation word.

**Checks.**

- For the trivial coefficient semifield and a zero matrix in rank one over ℚ, the coordinate change is `x↦2/x`.
- For `P=Trop({z})` and `y=z⁻¹`, the normalizer before realization is `y⊕1=z⁻¹`. If the realization
  sends `z↦2` over ℚ, its value is `1/2`.
- For the same trivial coefficient zero column in characteristic two, the admissibility condition fails.
- In `S=ℚ≥0`, take `P=Trop({z})`, `y=z`, `φ(z)=2` and `B=0`. Then `x'=3/x`;
  after Y-mutation the normalizer is `1/2`, so the inverse is again `x=3/x'`.
- Over `C=ℚ`, `φ(z)=−2` with the same zero column is admissible and gives `x'=−1/x`;
  it does not preserve positive rational points. For `K=Empty`, positive mutation-word transport is the identity.
- Over `ℤ/6ℤ`, a nonzero exchange column still gives a regular two-monomial exchange polynomial;
  the coefficient-free zero column is inadmissible because `2` is not regular.
- Over the Boolean semiring, `(1+T)(1+T²)=(1+T)(1+T+T²)` with distinct second factors;
  nonzero exchange polynomials need not be regular in a general semiring.
- For binary data over ℤ at `u=1` with rank-one zero matrix, the identity chart of
  `ℤ[x^{±1}]` in itself has exchange element `2x⁻¹`, which is not a unit there; the same
  chart in `ℚ(x)` has it as a unit, and the mutated coordinate is `2/x`.
- For binary data with `B̃=(0,1)ᵀ`, `Λ=((0,−1),(1,0))` and weight one, the exchange
  element is `M(−e₁)+M(−e₁+e₂)`, the mutated form is `−Λ` and the weight stays one.
- For `H=1+T+T²` on a zero column over `𝔽₃`, `H(1)=0`, so the seed is not admissible
  in any division ring.
- Over ℚ in rank one with zero matrix, the seeds with `H=1+2T` and `H=(1+2T)/3` on the
  same chart are gauge equivalent with `c=1`, `e=1/3`; their mutated coordinates are
  `3/x` and `1/x`.
- In type `A₂` over ℚ at `u=1`, five alternating mutations in the scalar system return
  the two coordinates interchanged when `H_1=H_2=1+T`, and interchanged and multiplied by 6
  when `H_1=1+2T`, `H_2=1+3T`. For the semifield of positive rationals with its usual
  addition, the normalized seeds with `H_1=(1+2T)/3`, `H_2=(1+3T)/4` return interchanged
  after five mutations.
- For `𝕂=ℚ_{≥0}` under multiplication, the normalizers `ν=1` and `ν(H)=(Σ_lh_l)⁻¹`
  satisfy both conditions. `ν(H)=h_0⁻¹` fails the first: the reversal
  `2+T` of `1+2T` is not normalized. `ν=2` fails the second and is not idempotent.
- In the normalized system of the positive rationals with `B=((0,2),(−1,0))`, degrees
  `(1,2)`, `H_1=(1+2T)/3` and `H_2=(1+4T+3T²)/8`, six alternating mutations starting at 1
  return the seed.
- For `H=1+2T` on a rank-one zero column over ℚ, reversal gives `H'=2+T` and `x''=x`.
  Rescaling the reversal to `H'=1+T/2` gives `x''=x/2`.

*Needs:* §§0.1–0.5 for coefficient evaluations, regular and based charts and the
one-exchange theorem; §1.1 for exchange matrices, forms and column compatibility.

### 1.3 Patterns and algebras

For the partial mutations of §1.2, an admissible word includes the proof
that the exchange element is a unit at each successive seed. Prove
composition of paths, reversal, cancellation of adjacent equal directions and
reindexing. The reachable-seed relation (`Seed.Reachable`) is the reflexive
transitive closure of these one-step exchanges (`Seed.Step`), for every
coefficient system, parameter and ambient algebra.
The pattern of a seed is the family of its reachable seeds; its cluster
variables (`Seed.clusterVariables`) are their mutable coordinates.
A map intertwining admissible steps transports admissible paths; prove its
identity and composition laws.

On a total class of seeds (§1.2), the mutations are involutions and every
`w:List K` acts by `μ_[k₁,…,k_m]=μ_k_m∘⋯∘μ_k₁`. Prove concatenation and
reversal laws, that a seed is reachable from a member exactly when it is the
value of a word, and word transport for maps intertwining the individual
mutations. Use this theorem for matrices, Y-seeds, exchange data, the admitted
regular seeds, division-ring seeds and their comparisons.

For these total patterns, reduced words form a mutation tree with one edge
of each label at each vertex: two vertices for `|K|=1` and one for empty K.
Define the exchange graph as the reachable seeds modulo simultaneous
relabeling, with distinct classes adjacent when represented by one mutation.
Prove that word evaluation realizes it as the simple graph quotient of
the mutation tree. For partial patterns use the admissible paths and their
endpoint quotient; no regularity of an unadmitted exchange is assumed.

For a seed s of any coefficient system over `(R,u)` in B, let `J=I∖row(K)` (`Frozen`) and choose
`S⊆J`. The frozen coordinates `z_j` are independent of the reachable seed;
for `u≠1` they need not be central. Define the following R-subalgebras of B,
using the reachable seeds t of s:

- the chart ring `L_{S,t}` (`Seed.chartAlgebra`), generated by all coordinates
  of t and the inverses of its mutable coordinates and of the `z_s`, `s∈S`;
- the cluster algebra `A_S`, generated by the mutable
  coordinates of all reachable seeds, all `z_j`, and `z_s⁻¹` for `s∈S`;
- the upper cluster algebra `U_S=⨅_t L_{S,t}`;
- the upper bound `UB_S(s)` (`Seed.upperBound`), the intersection of `L_{S,s}`
  with the `L_{S,t}` of the one-step mutations t of s.

Prove that `L_{S,t}` is the R-span of the normalized monomials `M_t(a)` with
`a_j≥0` for `j∈J∖S`; for `S=J` it is the full chart range. In a commutative
ambient at `u=1` with scalars C, let `C_S` be the C-subalgebra generated
by all `z_j` and by `z_s⁻¹` for `s∈S`, and write
`L_{C_S,t}=C_S[x_{k;t}^{±1}:k∈K]`,
`A_{C_S}=C_S[x_{k;t}:k∈K, t reachable]` and `U_{C_S}=⨅_t L_{C_S,t}`
for these algebras; `L_{C_S,t}` is the image of the corresponding mixed
Laurent semiring of §0.3. For `I=K`, write `L_{C,t}`, `A_C`, `U_C`.
All these algebras use the same reachable-seed relation.
For `S⊆T⊆J`, prove that `A_{C_T}` localizes `A_{C_S}` at the unchanged
frozen coordinates indexed by `T∖S`, with identity and composition laws.
No corresponding localization or base-change identity for upper algebras is assumed.
Prove re-rooting, reindexing and ambient-isomorphism laws. Laurent membership
of every reachable mutable coordinate in every `L_{C_S,t}` implies `A_{C_S}≤U_{C_S}`; this is a
theorem premise, not part of the definition. For `C=ℕ[P]`, it is the positive
Laurent statement of Layer 5. For the admitted ring realizations it follows from L8 for ordinary seeds
and P3 for polynomial seeds, without a positivity hypothesis.
Do not identify the upper algebra over `ℤ[P]` with the additive group completion
or scalar extension of the upper semialgebra over `ℕ[P]`.

For a coefficient subsemiring `R⊆C`, use the same reachable seeds and
take the generated R-subalgebras, with the same choice of frozen inverses.
Prove compatibility with coefficient inclusions `R⊆R'`, re-rooting,
reindexing and ambient C-algebra isomorphisms. When `I=K`, this gives
`L_{R,t}`, `A_R` and `U_R`; in the integral universal pattern, `A,U,L_t`
mean `R=ℤ[P]`. The inclusion `A_R≤U_R` is a separate theorem for each R.
Cluster monomials are `∏_i x_{i;t}^{a_i}`, `a:K→ℕ`; their multiples by P
form a separate set. Prove the same transport laws for these sets.

**Checks.**

- In rank zero there is one vertex of the mutation tree and no cluster variables.
- In rank one the reduced words are the empty word and the one-letter word. The double letter acts as the identity.
- In coefficient-free type `A₂`, the labelled mutation tree is infinite and its exchange graph
  modulo simultaneous relabeling is a pentagon.

*Needs:* §1.2 for involutive seed mutation; Mathlib words, simple graphs, subalgebras and
intersections.

### 1.4 Geometric coefficients

For any `J` and `P=Trop(J)`, construct inverse
bijections between `Y`-seeds `(y,B)` and extended matrices `B̃` with principal block
`B` and finitely supported frozen columns `K→(J→₀ℤ)`, by
`y_k=∏_j z_j^{b_jk}`, and between their seeds in `F`. Products use finite supports.
For finite J this is §1.1's extended-matrix carrier. Prove that they
intertwine `μ_k(y,B)` with `μ_kB̃` and give the exchange relation
`x_kx'_k=∏_{i∈I}a_i^{[b_ik]_+}+∏_{i∈I}a_i^{[-b_ik]_+}`, `a_i=x_i` (`i∈K`), `a_i=z_i`
(`i∈J`) (FZ IV, Definition 2.12 and (2.13)–(2.15)).
Apply §1.3 to each `R_S` (§0.3), including its frozen-localization
construction. Every comparison of `L_{R,t}`, `A_R`, `U_R` keeps `R` explicit.

Binary data (`ExchangeData.IsBinary`) have `H_k=1+T` in every direction. In the scalar system they are
closed under mutation, and a binary seed is a seed of the scalar system with
binary data. Construct the map from the normalized system of the one-element
coefficient semifield to the scalar system;
by §1.2 its seeds are the binary seeds, with the same exchange elements,
mutation and algebras. For a commutative semiring C, take the regular binary
seeds with frozen set J. The regrouping
`L(C,K⊔J)≃L(C[Trop(J)],K)` identifies its chart and mutation with the
normalized tropical-coefficient presentation above. Its exchange at k is
defined when its two-monomial numerator is regular. Over a commutative ring C,
all directions are regular exactly when
`IsRegular (2:C)` holds or every mutable column of the full extended matrix is nonzero.
Prove that this is exactly the regularity condition for its binary exchanges
and is mutation invariant. Use distinct monomial support for nonzero columns;
a zero column has exchange numerator 2. Construct the new generating chart
and involutivity, using §1.2's coefficient realization with base ring `C_J`.
Define `L_{C_S,t}`, `A_{C_S}`, `U_{C_S}` using §0.3; write `𝕜_S` when C is a
field 𝕜. All fields of characteristic other than 2 are included, and fields
of characteristic 2 are included when the extended columns are nonzero.
For domains, recover the field-valued charts and the nonvanishing formulation.

For finite K and arbitrary J, let J₀ be the finite union of initial frozen
column supports. Prove that rows outside J₀ stay zero under every word.
Reduce the finite-rank constructions to `K⊔J₀`; adjoining the remaining
frozen coordinates is a free mixed Laurent extension with coefficientwise
expansion maps. No unrestricted base-change/intersection interchange is used.

**Checks.**

- For `K` and `J` empty, `A=U=⊥`.
- For `K=Unit`, `B=0` and the trivial coefficient semifield over ℤ, `xx'=2`.
- For a rank-one extended column `(0,1)ᵀ`, the coefficient is `z` and `xx'=1+z`.
- For `K=Unit`, `J=Fin 2` and extended column `(0,1,1)ᵀ`, `xx'=1+z_0z_1`.
- In characteristic two, the extended column `(0,2)ᵀ` gives `xx'=1+z²≠0`, whereas a zero extended column gives zero.
- An initially zero frozen row stays zero and contributes an independent polynomial or Laurent
  variable according to whether it is inverted.

*Needs:* §§0.1–0.3 for tropical coefficients and mixed Laurent rings; §§1.1–1.3 for matrix mutation,
realizations and word transport.

### 1.5 Polynomial exchange, quantum frames and ordinary quantum seeds

**P1 — polynomial mutation.** Polynomial mutation is the mutation of the
scalar system of a commutative semiring R (§1.2). Its states are exchange
data over R: an extended exchange matrix B̃, positive degrees r_k dividing
their respective columns, and exchange polynomials
`H_k(T)=Σ_{l=0}^{r_k}h_{k,l}T^l` with unit endpoints `h_{k,0},h_{k,r_k}`.
Put `β_k=b_{•k}/r_k`. Mutation mutates B̃ by §1.1, reverses
`H'_k(T)=T^{r_k}H_k(T⁻¹)`, and dilates `H'_j(T)=H_j(κ_{kj}T)` for `j≠k`,
with §1.2's `κ_{kj}` and no normalization. A column is zero after a
mutation exactly when that column was zero before it; reversal preserves
H_k(1), and the polynomial of a zero column other than k is unchanged. The
states with endpoint coefficients one, `h_{k,0}=h_{k,r_k}=1`, are closed
under mutation; on them `κ=1` and `H'_j=H_j`. A polynomial seed over
`(R,u)` in an R-algebra B is a seed of the scalar system, with the exchange
element, mutation, admissibility, gauge and total classes of §1.2.

Prove the endpoint reduction. Let an endpoint-one state have a frozen block
`D_r=diag(r_k)` in added coordinates `t_k`, with form `Λ⊕0`. The `t_k` are
central, so its seeds are seeds over `R[t_k^{±1}]` on the index set I, with
exchange polynomials `t^{r_k[−γ_k]_+}H_k(t^{γ_k}T)`, where `γ_k` is the
`t`-part of `β_k`. Prove that this pattern over `R[t_k^{±1}]` is gauge
equivalent to the pattern of the scalar system with initial polynomials
`H_k(t_kT)`. Thus leading coefficients `t_k^{r_k}` arise from
endpoint-one states with central frozen coordinates.

For the classical realization take §1.2's regular seeds: `u=1`, `Λ=0`,
`w=0` and a generating regular chart of `L(R,I)`. A direction is mutable
exactly when the numerator `E_k` of §1.2 is regular in `D_k`, and then
`x'_k=E_k(x)/x_k`, with all other coordinates fixed. The selected
column changes sign and H_k reverses, so the reverse numerator equals E_k
in the common other-coordinate Laurent semiring. Reachability consists of
finite paths of these regular exchanges. Over a commutative ring R the
admitted seeds are the admissible regular seeds, with `IsRegular (H_k(1))`
on zero columns and total mutation. For arbitrary commutative semirings
retain the regularity condition on E_k.
Coefficient maps act on H coefficientwise; transport finite exchange
identities along paths whose target numerators are regular. Evaluation into
another semiring is defined on each overlap when its denominators map to units.

For the quantum realization, take R to be a commutative ring, `u∈Rˣ`,
and a division R-algebra D. A based exchange frame, or polynomial frame, is an
admissible polynomial seed over `(R,u)` in D: it consists of B̃, Λ, w with
column compatibility, polynomials with `H_k(1)≠0` for zero columns, and a
faithful chart `T(R,u,Λ)→D` presented by its normalized monomials M.
Its mutation is that of §1.2:

```
X'_k = Σ_{l=0}^{r_k} h_{k,l} M(−e_k + l[β_k]_+ + (r_k−l)[−β_k]_+),
X'_a = X_a   if a ≠ row(k).
```

By §1.2 the frames form a total class, without a rank assumption. Prove
equality of the generated division subrings and the whole-word laws.
On the opposite algebra use `B̃↦−B̃`, `Λ↦−Λ` and
`H_j↦H_j^rev` in every direction; prove preservation of w and compatibility
with mutation. Coefficient transport maps H coefficientwise and sends u to
its image.

For a commutative domain R, the regular polynomial seeds are polynomial
frames at `u=1`, `Λ=0`, `w=0` in the field `T(L(R,I))`, by the same
definition, with the same mutation and words. A faithful realization in a
larger field is obtained by inclusion of this generated field; prove that
its coordinates, mutations and §1.3 algebras are the images of those in the
generated field. No positive compatible quantum form is involved.

Degree one, `H_k=1+T`, gives binary mutation: the binary seeds of §1.4 are
the polynomial seeds with these polynomials, with the same reachable charts,
coefficient rings and frozen inverse choices. The normalized seeds of §1.2
belong to another coefficient system, with the same exchange and chart
construction, and are gauge equivalent to polynomial seeds. In the quantum
realization, degree one gives the ordinary seed sector below.

An ordinary compatible pair has `w=d`; this is the positive compatibility
condition `B̃ᵀΛ=(D_d 0)`. Derive rational column independence from it, rather
than adding independence as a new quantum seed hypothesis. More generally,
a positive diagonal in this equation symmetrizes the mutable block and forces
full column rank. An ordinary quantum seed is a binary
seed of the scalar system over `(Z_v,v)` in a division ring D with `w=d`; its
positive weights make it admissible. It is the `R=Z_v`, `u=v`, `w=d`,
`H_k=1+T` sector of P1, so its mutation satisfies
`X'_k=M(-e_k+[b_{•k}]_+)+M(-e_k+[-b_{•k}]_+)` with no separate chart construction.

By §0.4 its chart is a family `M:ℤ^I→D` with `M(0)=1`,
`M(a)M(b)=v^{Λ(a,b)}M(a+b)` and `Z_v`-independent values, equivalently an
injective `T(Z_v,v,Λ)→D`. For a fixed initial based torus and its fraction
division ring, BZ toric frames are the generating charts whose forms are
obtained from the initial form by an integral lattice isomorphism: prove the
equivalence using the induced fraction-ring automorphism (BZ Definition 4.3).
Every faithful chart generates such a fraction division subring inside D;
its inclusion into D need not be surjective. Mutation preserves that subring
and gives the usual BZ mutation there.
For example, `Z_v[X^{±1}]→ℚ(v)(x,t)`, `X↦x`, is faithful but generates
only `ℚ(v)(x)`; it is not a BZ toric frame in `ℚ(v)(x,t)`.
Construct `T(Z_v,v,Λ)≃T(Z_v,v,−Λ)` semilinear along `v↦v⁻¹` and
`T(Z_v,v,Λ)ᵐᵒᵖ≃ₐ[Z_v]T(Z_v,v,−Λ)`, fixing each normalized basis monomial.
With `B̃↦−B̃` these preserve the positive diagonal d, commute with binary
mutation and exchange its two summands. The target scalar structure is twisted
by `v↦v⁻¹`, respectively the target is `Dᵐᵒᵖ`.

For any exchange matrix B with positive symmetrizer d, construct the principal
pair `B̃_pr=(B;Id)`, `Λ_pr=((0,−D_d),(D_d,BᵀD_d))`. Prove alternation and
`B̃_prᵀΛ_pr=(D_d 0)`, including singular B, `B=0` and empty K. This supplies
the principal quantum comparison in §2.2; the classical principal construction
uses the zero form directly.

**Checks.**

- For `B=0` of rank one, the principal column `(0,1)ᵀ` and `Λ=((0,−1),(1,0))` give compatibility weight one.
- For `u=1` and `Λ=0`, any compatible weight is zero, including for a rank-deficient matrix.
- A zero column with `H(T)=1−2T+T²` fails the nonvanishing condition even in characteristic zero.
- Over `ℤ/6ℤ`, a nonzero polynomial exchange column is regular by its endpoint coefficient;
  a zero column with `H=1+T` is inadmissible, while `H=1+3T+T²` is admissible since `H(1)=5`.
- For `B=((0,1),(−1,0))` over ℚ at `u=1` with `H_1=1+T` and `H_2=1+2T`, mutation at 1
  leaves `H_2`, and the following mutation at 2 replaces `H_1` by `1+2T`.
- For `B=((0,1),(−1,0))` over ℤ with `H_1=H_2=1+T`, the scalar system gives the five
  cluster variables `x₁,x₂,(1+x₂)/x₁,(1+x₁+x₂)/(x₁x₂),(1+x₁)/x₂`.
- Over ℚ with a zero matrix in rank one and `H=1+T`, the regular seed in `ℚ(x)` and the
  polynomial frame at `u=1`, `Λ=0` in `ℚ(x)` are the same seed, with `x'=2/x`.

*Needs:* §§0.1–0.5 for regular and quantum charts and chart replacement;
§§1.1–1.4 for matrices, forms, seeds, coefficient systems and geometric comparisons.

### 1.6 Algebras and realization interfaces

For a polynomial seed over `(R,u)` in B, §1.3 gives the chart rings
`L_{S,t}` and the algebras `A_{R,u,S}`, `U_{R,u,S}` and `UB_{R,u,S}(s)`,
with only S inverted among the frozen coordinates. Let `T_t=L_{J,t}` be the
full based-torus chart range and write `U_{R,u}=U_{R,u,J}=⋂_t T_t`, in which
every frozen coordinate is inverted. At `u=1` in a commutative ambient these
are the classical `A_{R,S}` and `U_{R,S}`, by the same definition and the
same mutation paths. For ordinary quantum seeds with `S=J`, these are BZ's
algebras (Definition 4.12 and (5.2)–(5.3)).

Prove re-rooting, reindexing and ambient transport. In degree one these are
the algebras of binary and ordinary seeds, with the same reachable chart sets. Laurent membership is a theorem about
these algebras, not part of their definitions.

For an ordinary quantum seed in D, write `A_{v,S}` and `U_v` for these
algebras, with reachable variables `X_{k;t}` and frozen `X_j=M(e_j)`.
Frozen variables need not be central. Quantum cluster monomials are `M_t(a)`, the image
of `X^a` under `t`'s chart, with `a_k≥0` (`k∈K`), `a_j≥0` (`j∈J∖S`). Prove these objects
invariant under re-rooting and reindexing, and transport them along `Z_v`-algebra
isomorphisms `D≃D'`.

For a quantum polynomial frame, a polynomial coordinate realization in an
R-algebra A is an injective map from the quantum polynomial subalgebra of
`T(R,u,Λ)` into A. Equivalently its coordinates satisfy
`Y_iY_j=u^{2Λ_ij}Y_jY_i` and have R-independent normalized monomials.
Prove generator extensionality and transport along injective maps `A→A'`.
An embedding `A→D` into a division ring induces the corresponding quantum chart.

For either classical or quantum P1, let B be its specified ambient algebra
and `ι:A→B` an injective R-algebra map containing the initial coordinates.
A realization of a mutated coordinate in A is an element whose image is
that coordinate of the constructed seed in B. If every reachable mutable
coordinate and every selected frozen inverse lies in the image of ι,
construct the injective realization of the generated cluster algebra in A,
with generator, word and composition laws. Membership of only the initial
one-step replacements is insufficient for this all-word conclusion.

**Checks.**

- With no mutable labels and one frozen label, `A_{v,∅}=U_{Z_v,v,∅}=Z_v[X]` while `A_{v,J}=U_v=Z_v[X^{±1}]`.
- For a rank-two torus with `Λ(e₁,e₂)=1`, a frozen coordinate can quasi-commute with a mutable one with factor `v²`.
- Sending a polynomial generator to `t` in `Z_v[t]` gives a faithful realization; sending it to `1` loses monomial independence.

*Needs:* §0.4 for quantum polynomial subalgebras; §1.3 for reachable-state
algebras and frozen inverse choices; §1.5 for polynomial mutation and realization comparisons.

### Examples

Carry the principal rank-one column `(0,1)ᵀ` through the seed definition and its mutation for binary data, at `u=1`, `Λ=0` and at `u=v`, `Λ=((0,−1),(1,0))`. Compare the two chart maps under `v↦1`.

### Dependencies

Layer 0 supplies coefficient rings, charts, the torus and exchange normal forms.

## Layer 2: upper bounds and the Laurent phenomenon

There are two public Laurent statements, with one proof chain. For an ordinary quantum
seed, every reachable variable lies in every integral quantum chart `T_t`.
For a regular normalized seed over `ℤ[P]`, with P an arbitrary
coefficient semifield, every reachable variable lies in every `L_{ℤ[P],t}`,
with no full-rank or coprimality premise on that seed. Both follow from the
common theorem below for polynomial frames, the admissible seeds of the
scalar system in a division ring (§1.5): ordinary quantum seeds are its
instances with `R=Z_v`, `u=v`, `w=d` and binary data, and admitted domain
realizations by binary seeds are its instances with `u=1`, `Λ=0`, `w=0`.
Seeds of every other coefficient system reach it by §1.2's gauge
equivalence. The classical statement for arbitrary P uses a principal lift and
normalized coefficient specialization. The `v=1` theorem separately compares
the quantum and classical representatives. Neither statement uses positivity
of Laurent coefficients or sign-coherence.

| Milestone | Output | Uses |
|---|---|---|
| P1 | Coefficient systems and polynomial mutation; seed mutation with faithful changed charts and total classes | §§0.4–0.5, §§1.1–1.2, §1.5 |
| Q1 | One-exchange normal forms, central products and divisibility over R | §0.5, P1 |
| P2 / Q2 | Local intersections under divisibility; independent-column and classical ideal criteria | Q1, §§0.6–0.7 |
| Q3 | Upper-bound invariance under local divisibility; rank-free Laurent expansions by a central lift | Q2, shared intersection/word API |
| L5 | Classical principal Laurentness at unit parameter; quantum comparison via `v=1` | Common Q3, principal full-rank seed; quantum Q3 for comparison |
| L6 | Frozen orders, polynomial expansions and principal degrees | L5, support/positive evaluation |
| L7 | Normalized specialization and separation | Seed identities, L5–L6 |
| L8 | Arbitrary-semifield Laurentness and expansion maps | L7 |
| Q4 | Bar, gradings, frozen localization and algebra realizations | Q1–Q3, §1.6 |
| Starfish | Realization from initial and adjacent Laurent charts | §§1.3–1.4, L8 for `A_C`, SchemeAndStackFoundations §0.6 |

### 2.1 Polynomial upper bounds and Laurent expansions

Use the total class of polynomial frames of §1.5: the admissible seeds of the
scalar system of a commutative ring R in a division R-algebra D, with
arbitrary unit u and weights w. Faithfulness makes R a domain, and every
mutation word is defined on a frame (§§1.2–1.3). Write `μ_k(s)` for its
mutations, `M_s` for its normalized monomials and `T_s=L_{J,s}` for its full
chart range, the R-span of the `M_s(a)` (§1.3). Q1 and interacting Q2
use only this data; commuting Q2 uses the local divisibility condition below,
for which independence of the two columns is sufficient.
No scalar factoriality or infinite-order condition on u is required.
Write `α_k=−e_k+[−b_{•k}]_+`. Define the integer
`ν_k=Λ(β_k,e_k)` and prove `r_kν_k=w_k`, hence `r_k∣w_k`. No nonvanishing
or positivity of ν or w is required. For an ordinary quantum seed this is
`ν_k=d_k/r_k`; for `Λ=0` it is zero.

**Q1 — one exchange.** Let C be the R-span of the `M_s(a)` with `a_k=0`, the
chart range of the coordinates other than k. The mutated chart of §1.2 is
§0.5's exchange with `x=X_k`, `y=X'_k`, `E=X'_kX_k∈C` and
`λ(a)=Λ'(e_k,a)`. Prove

```
X'_k = H_k(u^{ν_k} M(β_k)) M(α_k),
P_{k,n} = ∏_{h=1}^n H_k(u^{(2h−1)ν_k} M(β_k)),
(X'_k)^n = P_{k,n} M(α_k)^n.
```

Relate these central products to §0.5's ordered products by
`P_n=P_{k,n}M(α_k)^nX_k^n`. For any set S of coordinates excluding k and
containing the support of its column, let `C_S` be generated by R and
`X_a^{±1}` for `a∈S`. Prove that `P_{k,n}∈C_S`, that it is central there,
and that `M(α_k)^nX_k^n` is a unit of `C_S`. Deduce the normal forms and the
coefficient criterion: `Σ_m c_mX_k^m`, `c_m∈C_S`, belongs to the two chart
rings' intersection exactly when `c_{−n}∈C_SP_{k,n}` for all `n>0`.
In particular `T_s∩T_{μ_k(s)}=C⟨X_k,X'_k⟩`. Binary power formulas,
centrality and coefficient criteria are instances of these polynomial results.

**P2 / Q2 — two directions.** For distinct mutable i,j, let C be the chart of
all other coordinates and `H_ij=C⟨X_i,X'_i,X_j,X'_j⟩`. Prove

```
(T_s ∩ T_{μ_i(s)}) ∩ (T_s ∩ T_{μ_j(s)})
  = H_{ij} = C⟨X_i, X'_i, X_j, X''_j⟩,
```

where `X''_j` is the j-coordinate of `μ_jμ_i(s)`.

For the commuting case `b_ij=0`, prove `X''_j=X'_j` and that Q1's power products
`P_{i,r}`, `P_{j,s}` are central in C. Prove the equality under the local
divisibility hypothesis
`C P_{i,r}∩C P_{j,s}=C(P_{i,r}P_{j,s})` for every `r,s>0`,
where `C P={cP:c∈C}`. Reconstruct the intersection from Q1's coefficient criteria.

If columns i,j are rationally independent, establish this local hypothesis as
follows. The divided columns β_i,β_j
are independent and belong to the pair lattice of exponents vanishing at i,j;
they pair trivially with this lattice. Use the central sublattice
`N=ℤβ_i⊕ℤβ_j`, so `R[N]≃R[S^{±1},T^{±1}]`. Represent each required
`P_{i,n}`, `P_{j,m}` as a scalar polynomial with unit constant and leading
coefficients on its respective cyclic direction.
Apply §0.6's separated-factor ideal intersection, then simultaneous divisibility
in the pair torus using its free, hence flat, `R[N]`-module structure. Reconstruct
the four-generator intersection using Q1. This uses a specified central
sublattice, not a description of the entire center or an infinite-order
hypothesis on u. Retain the central-divisibility theorem with explicit
`IsRelPrime` hypotheses for other scalar factors.

If `b_ij>0`, put `x=X_i`, `x*=X'_i`, `z=X_j`, `z*=X'_j`, `z**=X''_j`,
`N=|b_ij|`. Let n_l be the i-exponent of the lth summand of `z* · z`;
the corresponding exponent in `z** · z` is `N−n_l`. Express these summands as
`x^{n_l}c_l` and `(x*)^{N−n_l}d_l` with coefficients on the right. The unique
term with `n_l=0` has unit coefficient n₀; its mutated term is
`(x*)^Nm₀`. Put `φ=m₀n₀⁻¹∈C` and let g_l be the z-constant coefficient of
`(x*)^{n_l}x^{n_l}`. Prove all of §0.7's finite premises, including
`(x*)^{n_l}x^{n_l}−g_l∈zC[z]` and
`d_l=g_l x^{−n_l}φx^{n_l}c_l`, from matrix mutation, column compatibility
and the actual coefficients of H. Here `g_l` is `h_{i,r_i}^{n_l}` times a
monomial unit, and the identity for `d_l` is the dilation law
`H'_j(T)=H_j(κ_{ij}T)` of the scalar system; with endpoint coefficients one
it is equality of the coefficients. Construct them at both s and μ_i(s), then
apply finite replacement and §0.5's unit-constant-term patching. Negative
interaction is transported through P1's opposite algebra and coefficient
reversal. The binary replacement is the degree-one instance. No local
comparison or coprimality conclusion is a field of the seed.

**Q3 — upper-bound invariance and the Laurent phenomenon.** First prove the order-theoretic statement.
For a complete lattice A, any index set K, involutions μ_k on V and `L:V→A`,
put `UB(s)=L_s∧⋀_k L_{μ_k(s)}`. Local inclusions
`L_s∧L_{μ_i(s)}∧L_{μ_j(s)}≤L_{μ_jμ_i(s)}` for `i≠j` imply invariance of UB,
and hence `UB(s)=⋀_{ω:List K}L_{μ_ω(s)}`. This statement needs no finite-rank
or ring hypothesis.

For subrings T_s of a ring D and generators `g_{s,a}` indexed by an arbitrary
set I, prove that invariance of UB, `g_{s,a}∈T_s` and
`g_{μ_k(s),a}∈T_s` imply `g_{μ_ω(s),a}∈T_{μ_p(s)}` for all words p,ω and
all a. Apply this theorem to the total class of polynomial frames, with its
mutations `μ_k`, `L_s=T_s` and `g_{s,a}=X_{a;s}`, whenever Q2's local
divisibility condition holds for every commuting pair at every reachable
seed. Q2 gives the three-chart equalities, and the finite polynomial formula
gives one-step membership. Here `UB(s)` is §1.3's `UB_J(s)`, and
`⋀_ω T_{μ_ω(s)}=U_{R,u}` because the reachable seeds are the values of words.
Full column rank supplies these hypotheses by Q2 and §1.1's rank invariance.
The signature `Seed.upperBound_eq_of_reachable` states invariance of
`Seed.upperBound` at every reachable seed under the full-column-rank
hypothesis. For a binary seed over ℤ at `u=1` in a field, with all frozen
coordinates inverted, `Seed.chartAlgebra` is the Laurent ring of the chart
and `Seed.upperBound` is BFZ's upper bound (BFZ III, Definition 1.1).
In this case the invariance statement gives BFZ III, Corollary 1.9.
The resulting common Laurent theorem is

```
X_{a;μ_ω(s)} ∈ T_{μ_p(s)}   for all p, ω ∈ List(K) and a ∈ I.
```

Construct the unique finite R-linear representative in each chart, proving
evaluation, re-rooting, reindexing and ambient transport laws. Derive
`A_{R,u,S}⊆U_{R,u}=UB(s)` for every frozen inverse set S. These upper-chart
rings invert all frozen coordinates; frozen coordinates and their inverses are
unchanged along mutation words. Use the same Q1–Q3 for all polynomial
degrees, including the binary, ordinary quantum and unit-parameter classical
instances; a binary global theorem is not an input to the polynomial proof.
By §1.2's gauge equivalence the conclusions hold for the admissible seeds of
every coefficient system over R in D, with the same chart rings over R:
Q1–Q3 are proved once, for the scalar system.

**Rank-free Laurent corollary.** For every P1 frame, add K central frozen
coordinates t with
`B̃_aug=(B̃;D_r)`, `Λ_aug=Λ⊕0`, `D_r=diag(r_k)`, and the same w, degrees
and polynomials. Prove compatibility, column divisibility and full column
rank; the lifted data have no zero column, so with the canonical chart in
the fraction division ring of their torus (§0.4) they form a frame.
After every mutation, the added directions remain central,
the original blocks are the original mutated matrix and form, and specialization
`t_k↦1` on finite Laurent representatives recovers the original coordinate word.
Prove the last assertion inductively from the ordered exchange identities:
the already identified current coordinate is a unit of the original division
ring by §1.2's total class, so it can be cancelled there. No map of ambient
fraction rings is used.
Thus every P1 frame has unique finite Laurent expansions and `A_{R,u,S}⊆U_{R,u}`
(`Seed.exists_laurentExpansion`).
This lift does not assert `U=UB` for a rank-deficient frame. More generally,
the abstract upper-bound theorem applies whenever the required simultaneous
divisibility for commuting directions is proved at every reachable seed.

**Classical ideal criterion.** Take an admitted domain realization by
normalized seeds over R (§1.2). Both of its exchange coefficients,
`φ(y_k)φ(y_k⊕1)⁻¹` and `φ(y_k⊕1)⁻¹`, are units of R. Put `D_ij=R[x_l^{±1}:l≠i,j]` and, for a commuting pair `b_ij=0`, let E_i,E_j
be its exchange polynomials in D_ij. Prove the classical local intersections by
instantiating §§0.5–0.7: the condition `(E_i)∩(E_j)=(E_i E_j)` supplies all
power-divisibility conditions by §0.6, while interacting directions use finite
replacement and the normalized coefficient-mutation identity. Apply the same
Q3 pattern theorem to prove `UB(s)=UB(μ_k(s))` when this ideal condition holds
at s for all commuting pairs involving k, and `UB(s)=U` when it holds at every
reachable seed. These assertions allow rank-deficient exchange matrices.

Include coprime and totally coprime exchange polynomials as sufficient instances
where relative primality implies the ideal condition. This includes factorial
coefficient rings and `ℤ[P]`: reduce the finite coefficient data and divisibility
witnesses to a finitely generated torsion-free subgroup and use freeness of the
larger group ring over its subgroup ring. Prove polynomial-to-Laurent descent of
these conditions. For binary seeds with active frozen variables inverted,
the full-column-rank corollary is the `u=1`, `Λ=0`, `w=0` instance of
Q1–Q3. Sources: BFZ III, §1 and its upper-bound proofs.

For the rank-two comparison with `B=((0,3),(−3,0))` and `d=(1,1)`, distinguish
the unit-parameter zero-form frame from the ordinary-compatible sector of §1.5.
For `Λ=((0,λ),(−λ,0))`, one has `BᵀΛ=3λ·Id`, so the ordinary condition
`w=d` would require `λ=1/3`. The choice `λ=1` instead gives positive weights
`w=(3,3)`.

**Checks.**

- For the rank-two matrix above with `u=1`, `Λ=0`, `w=0`, and
  `H_1=H_2=1+2T+T³`, the degree-three data satisfy P1, and the exchange at 1 is
  `x'_1=(x_2³+2x_2²+1)/x_1`.
- For the ordinary quantum rank-one pair `Λ=((0,−1),(1,0))`, `B̃=(0,1)ᵀ`,
  `X_1X'_1=1+v⁻¹X_2`, `X'_1X_1=1+vX_2` and
  `(X'_1)²=(1+vX_2)(1+v³X_2)X_1⁻²`.
- For the principal pair of the zero matrix on `Fin 2` with symmetrizer `(1,1)`,
  the commuting intersection `H_12` contains `X'_1X'_2` and excludes
  `X_1⁻¹X_2⁻¹(1+v⁻¹X_3)`.
- For the principal pairs of `B=±((0,b),(−c,0))` with
  `(b,c)=(1,1),(1,2),(2,1),(1,3),(3,1)`, the interacting replacement
  premises of Q2 hold.
- For empty `K` and `J=Fin 1`, `A_{v,∅}=Z_v[X_1]` and
  `A_{v,J}=U_v=Z_v[X_1^{±1}]`.
- For `B=0` in rank two over ℤ and `H_1=H_2=1+T`, the element `2/(xy)`
  belongs to the initial upper bound and fails membership in
  `ℤ[(2/x)^{±1},(2/y)^{±1}]`.
- Over `𝔽₂`, the same zero-column seed is not admissible because `H_k(1)=0`.
  A principal frozen block makes both exchange elements nonzero.
- For `H=1−2T+T²`, `H(1)=0` excludes a zero column even in characteristic zero.
- The columns of `((0,1,−1),(−1,0,1),(1,−1,0))` are pairwise independent.
  After mutation at 1, the commuting columns 2 and 3 are opposite.
- Over `D=ℤ[u,w]` with `x*=(1+u)/x` and `y*=(1+w)/y`, the element
  `(1+u)(1+w)x⁻¹y⁻¹=x*y*` lies in `D[x,x*,y,y*]` and
  `(1+u)x⁻¹y⁻¹` fails membership.
- Over `D=ℤ[√−5]`, `E=2` and `F=1+√−5` have no common nonunit divisor,
  while `6∈(E)∩(F)` and `6∉(EF)`.
- Over `ℤ[z]` with extended matrix `((0,1),(−1,0),(1,−1))`, put
  `x'=(y+z)/x`, `y'=(x+z)/y` and `h=(x+y+z)/(xy)`. Then
  `h=(1+x')/y=(1+y')/x` and `zh=x'y'−1`. The element `h` lies in the
  initial and adjacent Laurent charts and fails membership in `ℤ[z,x,x',y,y']`.
  At `z=0` its total `x,y` degree is `−1`, whereas the specialized generators
  have nonnegative total degree.

Sources for the ordinary quantum sector: BZ §5, Lemmas 5.4–5.6,
Proposition 5.7, Lemma 5.8 and Corollary 5.2. Section 2.6 states the precise
polynomial source models and their relation to this common construction.

*Needs:* §§0.5–0.7 for one-exchange normal forms, simultaneous divisibility and replacement; §§1.1
and 1.3–1.6 for rank, mutation words and chart rings.

### 2.2 Principal coefficients and quantum-to-classical comparison

**L5 — classical Laurentness with principal coefficients.** An admitted domain
realization by binary seeds over C is a seed in the field `T(L(C,I))` with
`u=1`, `Λ=0`, `w=0` and its original positive matrix symmetrizer. By §§1.4
and 1.5 it is a polynomial frame, with the same coordinate
words and with `T_t` equal to §1.4's `L_{C_J,t}`; no second chart
construction, comparison or positive compatible form is involved. The
rank-free Q3 corollary gives Laurentness; full column rank additionally gives
`U=UB`. Its finite representatives are elements of `L(C,I)` through §0.4's
identification of Laurent charts with based charts. Prove that they depend
only on the coefficients, matrix, exchange polynomials and initial values:
at `u=1` the coordinate words and chart rings of a seed are independent of
the form it carries. For a faithful chart in a larger field use §1.5's
inclusion of the generated field. Commutative rings that are not domains are
reached by the specializations of L8 and P3.

For any exchange matrix B₀ on K, its principal extension `(B₀;Id)` (`principalExtension`) has
independent columns. Apply common Q3 to the regular binary seed over ℤ with
this extended matrix. Construct
the regrouping `L(R,K⊔J)≃ₐ[R]L(L(R,J),K)` and obtain the unique expansion
`X_{j;t}(x,u)∈ℤ[u_i^{±1}][x_i^{±1}]`. Prove that §1.4's transport identifies
this geometric pattern with the normalized pattern over `Trop(K)` with initial
coefficients u. L6–L8 consume this direct classical instance of Q3. Define
`C_t` as the frozen block of the mutated principal matrix and `c_{j;t}` as
its jth column. No sign-coherence, invertibility of C_t or constant-term
property of F-polynomials is used here.

**Quantum-to-classical comparison.** For a finite free lattice L and an
integral alternating form Λ, construct `sp:T(Z_v,v,Λ)→ℤ[L]` by coefficient
change `v↦1` and the basis-preserving identification `T(ℤ,1,Λ)≃ℤ[L]`.
Prove `sp(cX^a)=c(1)X^a`, surjectivity and `ker sp=(v−1)T(Z_v,v,Λ)`.
For an ordinary quantum seed s, let s₁ be a binary seed over
`(ℤ,1)` in a field F with the same initial matrix, and let `ε:ℤ[ℤ^I]→F` be
its chart map. The positive weights of s exclude zero columns, so s₁ is
admissible and all its mutation words are defined (§1.2). Prove
`ε(sp(f_{a,ω}))=x_{a;ω}` for every word ω and coordinate a, where f is the
unique integral quantum Laurent representative supplied by Q3 and `x_{a;ω}`
is the coordinate of `μ_ω(s₁)`; the induction cancels the current
coordinate, a unit of F. The comparison follows
mutation words and uses finite Laurent representatives, without extending sp
to the ambient division ring or taking specialization of chart intersections.

Compare §1.5's principal quantum pair with the regular principal seed
above, identifying its specialized representative with the already constructed
classical one. For `S⊆J`, restrict the comparison to a surjective ring map
`A_{v,S}→A_{R_S}` carrying each reachable variable and chosen frozen inverse
to its classical counterpart. Construct the induced map
`A_{v,S}/(v−1)A_{v,S}→A_{R_S}`. Special-fiber injectivity and saturation are
outside the targets; GLS treats such isomorphisms under additional hypotheses.

**L6a — order and subtraction-free expressions.** For any type `ι`, use §0.1's
semifield `Qsf(ι)` and its evaluations. For a domain `R`, any type `ι` and `f∈ι`, let
`lo_f` be §0.6's least degree on nonzero elements of `L(R,ι)` for the weight `e_f^*`.
Define `ord_f(A/B)=lo_f(A)-lo_f(B)` on nonzero elements of its fraction field; prove
independence of the presentation, `ord_f(gh)=ord_f g+ord_f h`, `ord_f(g⁻¹)=-ord_f g` and
`ord_f=lo_f` on `L(R,ι)`. For nonzero `A,B∈Qsf(ι)`, in the same field by §0.2, prove
`ord_f(A+B)=min(ord_f A,ord_f B)`.

For every regular binary seed over `ℤ` in `F` (§1.4, coefficient group `Trop(J)`), identify `F` with
`FractionRing (MvPolynomial (K⊔J) ℤ)` by its generating chart (§0.2, with L5's regrouping),
sending the variables to the initial `x_i` and `z_j`, and represent each `x_{j;t}` by the
element of `Qsf(K⊔J)` obtained by applying the exchange formula along its word, and prove
`ord_f(x_{j;t})=0` for every `f∈J`, reachable `t` and `j∈K`, without assuming Laurentness.
Prove that the regrouping identifies `L(MvPolynomial J R,K)` with the elements of
`L(R,K⊔J)` whose support has nonnegative `J`-coordinates; hence a variable whose initial
expansion is Laurent lies in `ℤ[z_j][x_i^{±1}]`. This polynomiality statement takes
Laurentness as a hypothesis, supplied by L5 for principal patterns (L6b) and by L8 for all
geometric ones.

**L6b — principal polynomials and degrees.** Prove `X_{j;t}∈ℤ[u_i][x_i^{±1}]`. Define
`F_{j;t}∈ℤ[u_i]` as the image of `X_{j;t}` under the algebra map `x_i↦1`, and
`F^+_{j;t}∈Qsf(K)` as the semifield evaluation at `x_i↦1` of the representative of
`X_{j;t}` in `Qsf(K⊔K)`. Prove that `F^+_{j;t}` maps to `F_{j;t}`, so `F_{j;t}≠0`;
semifield evaluations `F_{j;t}|_P` are those of `F^+_{j;t}` and presuppose no
nonnegativity of coefficients. Prove `F_{j;0}=1` and, for `t'=μ_k(t)` with entrywise
positive parts,

```
F_{k;t'} F_{k;t} = u^{[c_{k;t}]_+} ∏_i F_{i;t}^{[b_{ik;t}]_+}
                + u^{[−c_{k;t}]_+} ∏_i F_{i;t}^{[−b_{ik;t}]_+},
F_{j;t'} = F_{j;t}   if j ≠ k.
```

Deduce that `F_{k;t}` divides the right side in `ℤ[u_i]`; divisibility is not a premise of
the construction of `F`. Grade `ℤ[u_i^{±1}][x_i^{±1}]` by `ℤ^K` with `deg x_i=e_i`,
`deg u_j=-B₀e_j`. Define `G_t` by `G₀=Id` and, for `t'=μ_k(t)`,
`g'_k=-g_k+G_t[b_{•k;t}]_+-B₀[c_{k;t}]_+`, other columns unchanged, where `b_{•k;t}` is
the `k`th column of the mutable block `B_t`. Prove `G_tB_t=B₀C_t`, that `X_{j;t}` is
homogeneous of degree the `j`th column `g_{j;t}` of `G_t` (its `g`-vector), and
`X_{j;t}(x,u)=x^{g_{j;t}}F_{j;t}(û)` with `û_j=u_j∏_i x_i^{(B₀)_ij}`. These grading
results consume L5–L6a and are not inputs to the `X`-form of L7b's separation theorem or
to L8 (FZ IV, Propositions 3.6, 5.1, 6.1 and 6.6, and Corollary 6.3).

**Checks.**

- For `B₀=0` in rank one, the principal extension is the column `(0,1)ᵀ` and the new `c`-vector is `−1`.
- In the same seed `F_{1;t'}=1+u₁` and `g_{1;t'}=−1` after the mutation.
- For the principal quantum chart, setting `v=1` in the finite exchange representative gives `x₁'=(1+u₁)/x₁`.

*Needs:* §§0.1–0.4 for subtraction-free expressions, chart support and coefficient change; §§1.3–1.5
for principal seeds and word transport; §2.1 (Q3) for integral representatives.

### 2.3 Separation formulas and arbitrary coefficients

**L7a — evaluation under mutation.** Apply §0.2's universal evaluation
`Pos₀(P,K)→Q₀` to §1.2's positive seed pattern. Prove that its restriction
to each one-exchange algebra is §0.5's evaluation. It therefore intertwines
chart mutation with mutation of `Q`-valued coordinates, for one step and
for every finite word.

Use the positive regular charts first, and compare them with the universal
integral charts through the embedding in the fraction field. Write
`χ_s` for its inclusion of `Pos(P,K)` into `Fˣ`. For reachable seeds `s,t`, prove

```
χ_s(Pos(P,K)) = χ_t(Pos(P,K)).
```

Construct the induced coefficient-semifield equivalences and prove their
composition laws and compatibility with evaluation and §1.2's mutation on
`Q`-valued points. The exchange and inverse exchange give the two inclusions.

For a field `F` and an addition-closed subgroup `𝒮≤Fˣ`, specialize this evaluation
to `Qsf(ι)` at `a:ι→𝒮`. For `y:K→P`, also construct the group homomorphism
`Multiplicative (K→₀ℤ)→P`, `u_i↦y_i`, and the ring map `ℤ[u_i^{±1}]→ℤ[P]`;
these need not preserve tropical addition.

Prove *positive_rational_laurent_specialization*: for a commutative ring `R`,
an addition-closed `G≤Rˣ`, and `f∈Qsf(ι)∩L(ℤ,ι)`, Laurent evaluation at
`a:ι→G` equals subtraction-free evaluation followed by inclusion in `R`.
Its value is a unit, and is nonzero if `R` is nontrivial. No injectivity of
substitution or map from the rational-function field is assumed. The case
`𝒮=Pos(P,K)`, `a_i=y_i` gives substitution `u_i↦y_i`; L6b uses `𝒮=Qsf(K)`.

**L7b — the normalization identity.** Fix `B₀` on `K`; let `Y_{j;t}∈Qsf(K)` be the
`Y`-pattern with initial coefficients `u`. Prove that for every `P` and `y:K→P`,
`Y_{j;t}|_P(y)` is the `Y`-pattern of `(y,B₀)` in `P`. For a regular normalized seed
in `F` over `ℤ[P]` with initial `(x,y,B₀)` put `ŷ_{j;t}=y_{j;t}∏_i x_{i;t}^{b_{ij;t}}`; prove, from seed
identities only, that `ŷ` obeys §1.2's `Y`-mutation with `⊕` replaced by `+`, and that
`ŷ_{j;t}` is the evaluation of `Y_{j;t}` at `(ŷ_{i;0})_i` in `Pos(P,K)`.

Let `h_{k;t}∈ℤ^K` be the exponent vector of `(1⊕Y_{k;t})|_{Trop(K)}(u)∈Trop(K)`. With
`û_j=u_j∏_i x_i^{(B₀)_ij}`, prove in `Qsf(K⊔K)` and `Qsf(K)`, for the subtraction-free
representatives of `X` and `F`:

```
X_{k;t'} X_{k;t} = ((1 + Y_{k;t}(û)) / u^{h_{k;t}}) ∏_i X_{i;t}^{[−b_{ik;t}]_+},
F_{k;t'} F_{k;t} = ((1 + Y_{k;t}(u)) / u^{h_{k;t}}) ∏_i F_{i;t}^{[−b_{ik;t}]_+}.
```

For such a seed in `F` over any `P` with initial `(x,y,B₀)`, let `N_{j;t}∈F` be the
Laurent evaluation of `X_{j;t}` at `x_i↦x_i`, `u_i↦y_i`, and `D_{j;t}=F_{j;t}|_P(y)∈P`.
Prove the separation theorem `x_{j;t}=N_{j;t}/D_{j;t}` for every reachable `t` and `j∈K`,
without a Laurent theorem for this pattern, positivity of `F_{j;t}` or signs of
`c`-vectors. With L6b's grading identity, prove

```
x_{j;t} = x^{g_{j;t}} · F_{j;t}|_F(ŷ₁, …, ŷₙ) / F_{j;t}|_P(y₁, …, yₙ).
```

The finite geometric-type signature `exists_laurentExpansion` gives the
expansion with nonnegative frozen exponents (L8 and L6a), for a binary seed
over ℤ with a faithful chart in a field; it reduces to the regular seed in
the generated field by §1.5.

**L8 — Laurent expansions over coefficient semifields.** For every coefficient semifield `P` and regular
normalized seed `s` in `F` over `ℤ[P]`, prove `x_{j;t}∈L_{ℤ[P],s}` for every reachable `t` and `j∈K`, from L5
and L7b. The membership also follows from Q3 by §1.2's gauge equivalence of the normalized system with the
scalar system of `ℤ[P]`, whose gauge units lie in P (FZ I, Theorem 3.1); the same argument gives it for
normalized polynomial seeds of every degree. The expansion is §0.3's `laurentExpansion`; prove that `laurentExpansion_s(x_{j;t})` is `D_{j;t}⁻¹` times
the image of `X_{j;t}` under `u_i↦y_i`. Prove `x_{j;u}∈L_{ℤ[P],t}` for all reachable
`t,u`, hence `A⊆U`, and construct for each reachable `t` the injective algebra map
`A→ₐ[ℤ[P]]L(ℤ[P],K)` restricting `laurentExpansion_t`, with coefficient extraction and finite support.
Prove that evaluation after expansion is the inclusion into `F`, and commutation with
reindexing, re-rooting and isomorphisms of ambient realizations.
For a coefficient-semifield homomorphism `φ:P→Q` and seeds `s` over `P` and `s_Q` over
`Q` with the same `B₀` and initial coefficients `φ∘y`, construct the ring homomorphism
`A_P→A_Q` restricting the composite of `laurentExpansion_s`, the coefficient map `L(ℤ[φ],K)` and the
chart of `s_Q`. Prove that it sends each `x_{j;t}` to the corresponding variable of `s_Q`,
identity and composition laws, commutation with expansion in every reachable chart, and
independence of the chart used to construct it.

For an admitted ring realization by normalized seeds with `φ:P→Cˣ`
(§1.2), apply the ring map `ℤ[P]→C` to these finite expansions. Prove
inductively, using the mutations of its total class over C, that they
represent the realized variables in every chart. Thus `A_C⊆U_C`; construct the induced surjection
`C⊗_{ℤ[P]}A_P→A_C` and its coordinate, expansion and composition laws.
Neither a subtraction-free evaluation on C nor a map from the universal
rational-function field is used. Injectivity of this surjection is not asserted.

For geometric type, L8 and L6a give `laurentExpansion_t(x_{j;u})∈ℤ[z_j][x_i^{±1}]` for reachable
`t,u`, hence `A_{R_S}⊆U_{R_S}` for every `S⊆J` (§0.3). For every admitted ring
realization by binary seeds over C, which is §1.4's regularity condition,
prove that its expansions are the
coefficientwise images of these integral expansions; hence they lie in
`C[z_j][x_i^{±1}]` and in each `C_S[x_i^{±1}]`, with `A_{C_S}⊆U_{C_S}`.
This includes arbitrary J by the finite-support reduction of §1.4.
Base change of U is not identified with the specialized upper cluster algebra.

**Locally finite classical patterns.** Extend the classical finite-word
Laurent theorem to any mutable index set K with a positive integer
symmetrizer and a matrix whose columns have finite support. Prove mutation
preserves this condition; all exchange products and Laurent exponents have
finite support. For any finite words being compared, take the finite set K₀
of their letters and the variables in question, and freeze `K∖K₀` using
`P×Trop(K∖K₀)`. The union of initial column supports toward K₀ is finite,
and rows outside it stay zero toward K₀. Apply finite-rank L8 and its
coefficient-realization maps, then undo the freezing. Prove that the result is
independent of the chosen finite enlargement and compatible with re-rooting.
The same reduction transports §5.2's integral positivity. Finite-type
classification, finite lattice geometry and the quantum core retain finite rank.

See FZ IV, Proposition 3.9 and (3.12)–(3.13) for the `Y` and `ŷ` patterns,
Proposition 3.12 and (3.17) for the normalization identities, Theorem 3.7
for the separation formula and Corollary 6.3 for its `g`-vector form.

**Checks.**

- For the rank-two zero matrix, take the divisible coefficient semifield
  `P=Multiplicative ℚ` with elements `w^a` and `w^a⊕w^b=w^{min(a,b)}`.
  With `y=(w^{1/2},w^{-1/3})`, the four clusters choose independently
  `x_i` or `x'_i` for each direction, with `x'_1=(1+w^{1/2})x_1⁻¹` and
  `x'_2=(1+w^{1/3})x_2⁻¹`.
- In rank zero, `A=U=ℤ[P]`.
- In rank one with `B₀=0`, the normalized exchange gives
  `x'=(1+y)/((1⊕y)x)`. This gives `xx'=2` with trivial coefficients and
  `xx'=1+u` with principal coefficients.
- For `y=z⁻¹∈Trop({z})`, the previous expression is `(1+z)/x`, with no negative frozen exponent.
- Coefficient-free `A₂` has the variables
  `x₁,x₂,(1+x₂)/x₁,(1+x₁+x₂)/(x₁x₂),(1+x₁)/x₂`.
- Over `𝔽₂`, the rank-one zero matrix with a principal frozen row gives the
  nonzero exchange numerator `1+z`. Removing the row gives zero.
- For `P=Trop(Unit)`, `φ(z)=−1` over ℚ and zero `B`, the numerator
  `1+φ(z)` vanishes, so the realization condition fails.
- With an infinite frozen set and a single initially nonzero frozen row,
  every mutable coordinate has an expansion using only that frozen variable.
- For the locally finite `A_∞` path on ℤ, the word `[0,1]` uses only the
  initial coordinates at `−1,0,1,2` for its updated mutable coordinates.
- The rational Laurent representative `(u₁²+u₁u₂)/(u₁+u₂)` specializes to `1` at `u₁=u₂=1`.
- For trivial coefficients in rank one, `x'=2/x` and `x=2/x'` generate the same
  positive function semifield. For `P=Trop({z})`, `y=z`, the same check is
  `x'=(1+[z])/x`; `[z]` remains a formal coefficient.
- With `K=Empty`, `Pos(P,K)` is the units of the nonzero localization of `ℕ[P]`.
  For trivial `P` this is the positive rationals, although `P` itself has one element.

*Needs:* §§0.1–0.3 for positive evaluation and Laurent rings; §§1.2–1.4 for seed identities and
realizations; §2.2 (L5–L6) for principal representatives and degrees.

### 2.4 Integrality of the Somos-4 sequence

Define `a:ℕ→ℚ` by `a₀=a₁=a₂=a₃=1` and `a_{n+4}=(a_{n+1}a_{n+3}+a_{n+2}²)/a_n`; prove
`0<a_n` for all `n`. Take the coefficient-free seed (one-element `P`) in
`FractionRing (MvPolynomial (Fin 4) ℤ)` with its variables as chart, symmetrizer `d_i=1`
and initial exchange matrix, in the column convention,

```text
 0  -1   2  -1
 1   0  -3   2
-2   3   0  -1
 1  -2   1   0
```

Mutate successively at `k_n=n mod 4`. Prove that after `n` mutations the `(i,j)` entry is
the initial `(i-n,j-n)` entry, indices modulo 4; that column `k_n` has `-2` at `k_{n+2}`,
`1` at `k_{n+1}` and `k_{n+3}`, and `0` at `k_n`; and that the `n`th exchange relation is
`x_{k_n}x'_{k_n}=x_{k_{n+1}}x_{k_{n+3}}+x_{k_{n+2}}²`. Prove that after `n` mutations the
L6a representative in `Qsf(Fin 4)` of the variable at `k_{n+r}` (`0≤r<4`) evaluates to
`a_{n+r}` at `x_i=1` in the semifield `{q∈ℚ:q>0}`.

With L8 and *positive_rational_laurent_specialization* (`𝒮={q∈ℚ:q>0}`), prove that `a_n`
is the image of the L8 expansion under `L(ℤ,Fin 4)→ℤ`, `x_i↦1`; deduce `a_n∈ℤ` and
`0<a_n`. In `somos4_exists_pos_nat`, prove that every `b:ℕ→ℚ` with `b₀=b₁=b₂=b₃=1` and
`b_{n+4}b_n=b_{n+1}b_{n+3}+b_{n+2}²` equals `a`, so each `b_n` is a positive integer.

See Fomin–Zelevinsky, *The Laurent phenomenon*, Theorem 1.8 and Example 3.3,
for the recurrence and its Laurent phenomenon.

**Checks.**

- The initial four values are all one. The first exchange has numerator two and gives `a₄=2`.
- After mutation at 0, the matrix is the cyclic translate of the initial matrix, and the next column
  has the two positive entries separated by the negative entry `−2`.
- The next four values are `a₅=3`, `a₆=7`, `a₇=23` and `a₈=59`.

*Needs:* §§1.1 and 1.3 for mutation words; §2.2 (L6a) for subtraction-free representatives; §2.3
(L7a and L8) for specialization and integral expansions.

### 2.5 Bar involutions, gradings and frozen localization

**Q4 — bar, grading and frozen localization.** Let R have an involutive ring
automorphism σ with `σ(u^{Λ(a,b)})=u^{−Λ(a,b)}` for all a,b; the condition
`σ(u)=u⁻¹` is sufficient. Prove that form mutation preserves this condition.
On `T(R,u,Λ)` define
`bar(Σ_a r_aX^a)=Σ_a σ(r_a)X^a`; prove `bar(fg)=bar(g)bar(f)` and
involutivity. For P1 with σ-fixed coefficients of every H, prove the bars
transported through adjacent charts agree on their intersection (Q1).
They give one bar on `U_{R,u}`, preserving each `A_{R,u,S}` and fixing
normalized cluster monomials. Without the fixed-coefficient hypothesis,
construct the corresponding transport to the σ(H) pattern. The usual
`Z_v` bar is the instance `σ(v)=v⁻¹` (BZ, (6.2) and Proposition 6.2).
The scalar involution is part of the input, including at finite order.

For an additive commutative group `H`, an `H`-grading of a binary frame is an additive
`deg:ℤ^I→H` with `deg(b_{•k})=0` for mutable `k`; it grades `T_s` with scalars in degree zero. Put
`deg'(e_k)=-deg(e_k)+Σ_i[b_ik]_+deg(e_i)`, `deg'(e_i)=deg(e_i)` for `i≠k`; prove that
`deg'` is an `H`-grading of `μ_k(s)`, that `X'_k` is homogeneous of degree `deg'(e_k)`,
and that every reachable cluster variable is homogeneous. One degree-mutation lemma on
extended matrices serves this grading and L6b's classical grading.

For every P1 frame, prove that each frozen `X_j` quasi-commutes with every reachable variable,
`X_jX_{i;t}=u^{2(Λ_t)_{ji}}X_{i;t}X_j`. For `S⊆J`, prove that the submonoid of `A_{R,u,∅}`
generated by the `X_s`, `s∈S`, is a left and right Ore set, and construct an isomorphism
of its `OreLocalization` with `A_{R,u,S}` over `A_{R,u,∅}`, compatible with `A_{R,u,S}⊆A_{R,u,S'}`
for `S⊆S'`. This does not make frozen-variable substitutions into quantum seed maps.

For a polynomial seed realization `ι` (§1.6) in an R-algebra A, construct the images
of normalized monomials and coefficient extraction on the image of `ι`; prove that `ι` is
graded when `A` is `H`-graded with each `ι(X_i)` of degree `deg(e_i)`, and intertwines bar
with any σ-semilinear anti-involution of A fixing each `ι(X_i)`.

**Checks.**

- For the rank-one principal pair, the degree assignment `deg(e₁)=1`, `deg(e₂)=0` gives degree `−1` to `X₁'`.
- With no mutable coordinates, the realization `Y_1=t` in `Z_v[t]` identifies
  `A_{v,∅}` with `Z_v[t]`. Inverting `t` gives `Z_v[t^{±1}]`.
- Over `𝔽₇` with `u=2` and `Λ(e_1,e_2)=1`, the parameter has order three and
  the Q1 product is `(1+2T)(1+T)(1+4T)=1+T³`. The bar premise fails because
  no field automorphism sends `2` to `4`.

*Needs:* §§0.4 and 1.5–1.6 for quantum charts, polynomial mutation and realizations; §2.1 (Q1–Q3)
for chart overlaps and Laurentness.

### 2.6 Polynomial algebras, principal lifts and classical comparisons

**P3 — polynomial cluster algebras.** Instantiate P1 and common Q1–Q3
with `R=Z_v`, `u=v`, `w=d`. An ordinary-compatible polynomial quantum seed
has no extra column-independence input: derive it from the positive
compatibility condition. Its scalar coefficients `h_{k,l}∈Z_v` are central,
with unit endpoint coefficients; they need not be positive, reciprocal or
fixed by `v↦v⁻¹`. Derive `r_k∣d_k` from `r_kν_k=w_k`.

These seeds are polynomial frames by definition, so Q1–Q3 give the unique
finite quantum expansions and `A_{v,S}⊆U_v=UB_v(s)`; in degree one with
binary data they are the ordinary quantum seeds, with their
algebras. Reindex
polynomial data, coordinates, forms, weights and mutable embeddings together;
prove identity, composition, mutation and whole-word laws. Construct transport
along injective ambient algebra maps and the corresponding coefficient and
lattice maps on finite representatives. These maps are not obtained by
commuting scalar extension with intersections. Extend Q4's normalization and
bar transports: `v↦v⁻¹` changes H coefficientwise to `H_k(T)|_{v↦v⁻¹}`;
bar-fixed polynomials give an involution of the same cluster algebra.
For an abelian grading group G with scalars in degree zero, let `g_a∈G`
satisfy `Σ_a β_{a,k}g_a=0` for every mutable k. Define
`g'_k=−g_k+Σ_a[−b_ak]_+g_a`, `g'_a=g_a` for `a≠k`. Prove preservation of
the divided-column condition and homogeneity of every exchange summand,
coordinate word and Laurent representative. For `D_r=diag(r_k)`, use
`E_εβ'=β(D_rF_εD_r⁻¹)`; its right factor is integral by column divisibility.
In degree one this recovers Q4.

Classical polynomial seeds over a commutative domain R are polynomial frames
at `u=1`, `Λ=0`, `w=0` (§1.5), so Q3 gives Laurentness without a rank
condition. Full column rank additionally gives `U_{R,J}=UB_{R,J}`. This is
the same theorem as for the quantum realization, independently of any
positive quantum form or specialization of a quantum parameter.

For a commutative ring C, let a regular polynomial seed be admissible:
`IsRegular (H_k(1))` on zero columns. Construct the universal
polynomial coefficient ring `R_univ=ℤ[t_{k,l}:0≤l≤r_k][t_{k,0}⁻¹,t_{k,r_k}⁻¹]`,
with independent coefficients and inverted endpoints, and its map
`t_{k,l}↦h_{k,l}` into C. Apply the domain theorem to its canonical seed.
Prove that finite Laurent representatives specialize, after every word,
to the already constructed regular C-seed. This gives `A_{C,S}⊆U_{C,S}`
for every frozen inverse set S (`Seed.exists_laurentExpansion_of_isGenerating`).
To retain nonnegative frozen exponents,
apply the frozen-order argument of L6a to the universal polynomial
exchanges: their endpoint terms give frozen order zero. Descend this
support statement coefficientwise to C. No positivity theorem for general
polynomial cluster algebras is assumed here.

Construct the resulting surjection
`C⊗_{R_univ}A_{R_univ,S}→A_{C,S}`, with coordinate, reversal, word,
reindexing and expansion laws. Compare it in degree one with L8 and §1.4.
The comparison concerns finite Laurent representatives and the generated
algebras; scalar extension of upper algebras is not identified with `U_{C,S}`.
For semirings, P1 and §1.6 define the polynomial patterns and their algebras
along regular paths; the Laurent theorem here concerns the admitted ring
realizations. Generalized coefficient-semifield separation remains outside
the scope specified above.

For a mutable matrix B with positive symmetrizer d and degrees r dividing its
columns, suppose also `r_k∣d_k`. Construct the degree-compatible principal
extension with frozen block `D_r=diag(r_k)`. Put `D_d=diag(d_k)`,
`V=diag(d_k/r_k)` and

```
B̃_pr = ( B  ),     Λ_pr = ( 0   −V         ).
       ( D_r )            ( V    D_r⁻¹ Bᵀ V )
```

Here the lower-right block has entries `b_ji(d_j/r_j)/r_i`; the displayed
inverse denotes these exact integer divisions. Prove integrality, alternation,
`B̃_prᵀΛ_pr=(D_d 0)` and column divisibility. Apply P1 to the entire
extended seed along mutation words, retaining the degrees; the frozen block
is `D_r` at the initial seed and subsequently mutates. The classical
principal construction uses the same initial extended matrix with zero Λ and w.
Give the classical canonical realization using §0.2 and the quantum one
using §0.4, and prove their degree-one
comparisons with the principal constructions of §1.5 and L5. Use this
construction when degrees exceed one; the frozen identity block does not
satisfy column divisibility for such degrees.

Construct `v=1` on unique finite quantum representatives. Let s₁ be a
polynomial seed over `(ℤ,1)` in a field with the same matrix and the
polynomials with coefficients `h_{k,l}(1)`; positive weights exclude zero
columns, so s₁ is admissible and all its words are defined (§1.2). Prove
that the specialized representatives evaluate to the coordinates of s₁ after
every word, as in §2.2. Construct the surjection
`A_{v,S}→A_{R_S}` and the induced special-fiber map as in §2.2. This is a
comparison between the two instances of the common proof; it does not supply
a second proof of their Laurent property.

**Checks.**

- In the generic torus `M(a,b)M(c,d)=v^{ad-bc}M(a+c,b+d)`, take
  `B=((0,2),(−2,0))`, `r=(2,2)`, `w=d=(2,2)` and `H_1=H_2=1+T+T²`.
  With `x=M(1,0)` and `y=M(0,1)`, one has `xy=v²yx`. The initial exchanges
  are `x*=M(−1,0)+M(−1,1)+M(−1,2)` and
  `y*=M(0,−1)+M(1,−1)+M(2,−1)`. The exchange at 2 after mutating at 1 is
  `y**=(1+v⁻¹x*+v⁻²(x*)²)y⁻¹` and belongs to `Z_v⟨x*,y*,y⟩` by finite
  replacement.
- For the two signs of the same matrix, with the corresponding compatible forms
  and `H_1=1+aT+T²`, `H_2=1+bT+T²` over `Z_v[a,b]`, the interacting
  replacement premises hold with independent central `a,b`. At `v=1`, the
  coefficient map keeps `a,b` and sends `M(i,j)` to `x^i y^j`.
- For degree one with `H_k=1+T`, the powers and local intersections of Q2
  agree with those for binary exchange; P3's ring specialization agrees with L8.
- With no mutable variables and one frozen variable z, at every unit parameter
  `U_{R,u,∅}=R[z]` and `U_{R,u}=U_{R,u,J}=R[z^{±1}]`.
- With both index sets empty, the generated algebra and upper algebra are both
  `Z_v`.
- In rank one with `B̃=(0,2)ᵀ`, `Λ=((0,−1),(1,0))` and `H=1+T+T²` of
  degree two, the new coordinate is
  `M(−e₁)+M(−e₁+e₂)+M(−e₁+2e₂)`.
- At `u=1` with `B=((0,3),(−3,0))` and `H=1+2T+T³` in direction 1,
  `x'=(y³+2y²+1)/x` and the reversed polynomial is `1+2T²+T³`.
  A second mutation with that reversal gives `x''=x`. Keeping `H` fixed gives
  `x''=x(y³+2y+1)/(y³+2y²+1)`, which is not Laurent.
- Over ℚ with `B=((0,1),(−1,0))`, zero form, `H_1=1+T` and `H_2=1+2T`,
  the second polynomial has a leading unit different from one. Keeping `H_1`
  fixed along the word `[1,2,1]` violates the dilation law and gives
  `x'''=1/y+x(y+2)/(y(y+1))`, which is not Laurent. Polynomial mutation has
  `H_1=1+2T` at the last step and gives `x'''=(1+2x)/y`.

Sources: Bai–Chen–Ding–Xu, *Generalized quantum cluster algebras: the Laurent
phenomenon and upper bounds*, §2, Lemma 4.1, Propositions 4.2, 4.6–4.7 and
Theorem 4.9, for the reciprocal fixed-polynomial model. Nakanishi–Rupel,
[Companion cluster algebras to a generalized cluster algebra](https://arxiv.org/html/1504.06758),
§3, for reversal mutation without reciprocity in the classical theory.
Chekhov–Shapiro, (2.5) and Theorem 2.5, and Nakanishi, (2.5)–(2.6) and (2.10),
for the propagation law of the coefficients, with coefficients in a semifield. Rupel,
[Rank two non-commutative Laurent phenomenon and pseudo-positivity](https://www.numdam.org/item/10.5802/alco.81.pdf),
§5, Theorem 5.1 (pp. 1266–1267), treats nonreciprocal quantum exchange in rank two.
The nonreciprocal quantum construction and its local comparisons are targets
here, not claims attributed to BCDX. Their Theorem 3.1 proves Laurentness by
another argument; it does not supply the central-factor proof required here.
Their polynomial-center coprimality condition and the pair Laurent-ring
condition used here must be distinguished.

*Needs:* §§0.1–0.7 for regular localization, coefficient maps and local algebra;
§§1.1 and 1.4–1.6 for matrices, polynomial seeds and their algebras; §2.1
(Q1–Q3) for domain Laurentness; L6a for frozen orders and finite representatives.

### 2.7 Starfish lemma and classical algebra realizations

**Finite Laurent families.** Let `X` be an integral locally Noetherian scheme,
`R=Γ(X,O_X)` its ring of global functions, `F=K(X)` its function field and `C⊆R`
a coefficient subring. Take a nonempty finite family of coordinate lists, indexed
by `t`, with nonzero entries `x_{t,i}∈R`. Put `a_t=∏_i x_{t,i}` and
`L_t=C[x_{t,i}^{±1}:i]` inside `F`. Write
`X_{a_t}` for the open where `a_t` is a unit and `W=⋃_t X_{a_t}`.
Each `x_{t,i}` is a unit on `X_{a_t}`, so `L_t` lies in the image of its section
ring. If `depth O_{X,p}≥2` for every `p∈X∖W`, apply SchemeAndStackFoundations
§0.6's `coherent_hartogs` to the structure sheaf (Stacks, Lemma 31.5.11 (0E9I)).
Compare sections inside `F` to obtain
`⋂_t L_t ⊆ ⋂_t Γ(X_{a_t},O_X) = R`. If each `L_t` is the image of
`Γ(X_{a_t},O_X)` in `F`, this gives `⋂_t L_t=R`. For `X=Spec R`, use the
principal-open localization comparison to identify each `Γ(X_{a_t},O_X)`
with `R[a_t⁻¹]` inside `Frac(R)`.

**Starfish.** Let `R` be a Noetherian domain and `C⊆R` a coefficient ring.
Take a seed of a coefficient system over C at `u=1` in `Frac(R)`
whose initial exchange elements are units; an admitted domain realization
(§§1.2–1.4) gives one by transporting its chart along a
coefficient-compatible field embedding. Assume
the initial mutable coordinates `x_i` and their respective one-step replacements
`x'_i` belong to `R`. For geometric type with a chosen frozen inverse set `S`,
take `C` to be the image of the corresponding ring of §0.3, so the frozen
coordinates lie in `R` and those indexed by `S` are units there. Form
`UB_C(s)` by Q3's upper-bound construction with the Laurent rings over `C`.

For the initial chart take `a_init=∏_i x_i`, and for each adjacent chart take
`a_k=x'_k∏_{i≠k}x_i`.
Prove that the complement of their principal opens is the union of the
`V(x_i,x_j)` for `i≠j` and the `V(x_i,x'_i)`, where `V(f,g)` is the common zero
locus. Thus the opens cover all height-one points exactly when no height-one
prime contains both members of any of those pairs. In an `S₂` domain this
condition puts the complement in codimension at least two and implies the depth
bound. Obtain the normal Noetherian case by Serre's criterion. The signature
`upperBound_le_of_starfish` states the `S₂` case on the realized coordinates.
FWZ, Proposition 6.4.1 and Remark 6.4.4, give the classical Starfish inclusions
for the cluster and upper cluster algebras over a normal Noetherian ℂ-algebra.

Under the depth hypothesis for this star of charts, obtain `UB_C(s)⊆R` by the
finite-family theorem and `U_C⊆R` since every chart in the star is reachable.
Apply L8 over `C` to get `A_C⊆R`. These inclusions restrict the ambient
embedding to injective `C`-algebra maps into `R`. A `C`-algebra generating
family of `R` in the image gives the reverse inclusion for the corresponding
algebra.

**Checks.**

- For a field `𝕜`, take `R=𝕜[x,y]`, `z=xy−1` and `C=𝕜[z]`. The exchange
  `xx'=1+z` gives `x'=y`. The opens `D(x)` and `D(y)` miss only the origin,
  and the generators `x,y` give `A_C=U_C=R` in every characteristic.
- In rank zero with `R=𝕜[z]`, the initial product is `1` and `C=𝕜[z]` is
  admissible. The choice `C=𝕜[z^{±1}]` fails the coefficient inclusion.
- With `char(𝕜)≠2`, take `x'=2/x`, `C=𝕜` and
  `R=𝕜[x^{±1},(1+x)⁻¹]`. The star covers `Spec R`, while the upper bound
  `𝕜[x^{±1}]` is strictly contained in `R`.

*Needs:* §§1.2–1.4 for coefficient realizations and chart rings, §2.1 for the upper-bound
construction, §2.3 (L8) for `A_C⊆U_C`, and SchemeAndStackFoundations §0.6 for Hartogs.

### Examples

Use the Somos-4 computation in §2.4 to check the chain from polynomial upper bounds through the integral Laurent representative to evaluation at one.

### Dependencies

Layers 0–1 supply local intersections, matrix rank and polynomial mutation. The milestone table
orders their use in the upper-bound, Laurent and specialization proofs. The binary data of §1.4 and
the unit-parameter instances of §1.5 make ordinary quantum and classical seeds instances of the common
polynomial exchange and Laurent theorems; §2.6 adds the `v=1` comparison of their representatives. SchemeAndStackFoundations
§0.6 supplies Hartogs for the finite chart realization in §2.7.

## Layer 3: lattice formalism and cluster varieties

Use ScatteringDiagrams §4.2's lattice datum. Define mutation and gluing for finite
indexed families of mutable vectors; use adapted bases for coordinate presentations.

### 3.1 Lattice data and mutable families

A `SkewLatticeDatum` consists of a finite
free lattice `N`, a saturated sublattice `N_uf`, a skew form `{−,−}:N×N→ℚ` and a
finite-index sublattice `N°`, with `{N_uf,N°}⊆ℤ` and `{N,N_uf∩N°}⊆ℤ`. Put
`M=Hom(N,ℤ)`, `M°=Hom(N°,ℤ)` and `p₁*(n)={n,−}|_{N°}` for `n∈N_uf`.
A lattice seed is a finite indexed family `e:K→N_uf` with integers `d_k>0`
such that `d_ke_k∈N°`. Allow dependent, nonspanning and repeated vectors.
Define `ε_ij={e_i,e_j}d_j` for mutable indices; prove these numbers integral.
For `k∈K`, define signed mutation by
`e'_k=−e_k`, `e'_i=e_i+[±ε_ik]_+e_k` (`i≠k`), keeping the weights
(GHK, (2.3)–(2.4), for the positive sign; §3.5 gives the reference).
Prove preservation of the lattice conditions, that positive and negative mutations
are mutually inverse, and that positive mutation twice is the image of the family
under the fixed-data automorphism `n↦n+{n,e_k}d_ke_k`.
Seed isomorphisms are isomorphisms of lattice data with a relabeling carrying the
mutable family and its weights to their counterparts.

An adapted basis presentation adds a basis `(e_i)_{i∈I}` of `N`, a subset
`I_uf⊆I` identified with K whose vectors form a basis of `N_uf`, and positive
weights extending `(d_k)` such that `(d_i e_i)` is a basis of `N°`.
Use ScatteringDiagrams §4.2's `AdaptedBasis` for this presentation.
Define `f_i=d_i⁻¹e_i*`, dual to `(d_i e_i)`, and extend
`ε_ij={e_i,e_j}d_j` to all indices; prove integrality unless both indices are
frozen. Extend signed mutation to the full basis by the same formula and prove
that forgetting its frozen part commutes with mutation.

**Checks.**

- The repeated family `e₁=e₂=(1,0)` in the determinant lattice `ℤ²` is allowed and mutation at 1 gives `(−e₁,e₂)`.
- For the determinant basis `e₁,e₂` and unit weights, positive mutation at 1 sends `e₂` to `e₂`, and
  positive mutation a second time sends `e₂` to `e₂−e₁`.
- For `N°=ℤe₁⊕2ℤe₂` and weights `(1,2)`, the adapted dual basis is `e₁*,e₂*/2`.

*Needs:* ScatteringDiagrams §4.2 for the shared lattice datum and adapted basis; Mathlib finite free
lattices, duals and pairings.

### 3.2 Matrix and coefficient transport

For an adapted basis presentation s, let
`latticeToFZ(s)` be the extended matrix
with rows `I`, columns `I_uf`, `B̃_ik=ε_ki={e_k,d_ie_i}=β(d_ie_i,e_k)`;
with the symmetrizer below it is the matrix of binary exchange data (§1.4).
Prove that `s_k=L/d_k` (`k∈I_uf`), `L=lcm(d_k:k∈I_uf)`, is a symmetrizer of its
mutable block, that every
symmetrizer `(s_k)` of it has `s_kd_k` constant on each connected component (edges
`b_ij≠0`), and that `latticeToFZ` is invariant under fixed-data automorphisms, so
`latticeToFZ(μ_k^+μ_k^+(s))=latticeToFZ(s)`. For an extended matrix `B̃` with symmetrizer
`(s_k)` and `L=lcm(s_k)`, construct `fzToLattice` on `ℤ^I`: `d_k=L/s_k` (mutable `k`),
`d_j=1` (frozen `j`), `{e_k,e_i}=B̃_ik/d_i` for mutable `k`, skewness, and zero
frozen–frozen form. Prove 3.1 for it and, when `K` is nonempty, that its mutable
weights have gcd `1`; use `lcm ∅=1` for rank zero, with no gcd-one claim for the
empty family. For
fixed data and a positive integer `g` dividing every `d_i` (`i∈I`), put
`N°_g={n∈N:g n∈N°}`. Prove that `(N°,d_i,{−,−})↦(N°_g,d_i/g,g{−,−})`
again satisfies §3.1 and preserves `ε`; its basis of `N°_g` is `(d_i e_i/g)`.
Multiplication by g identifies `N°_g` with `N°`; construct the induced dual-lattice
isomorphism and prove that it carries the respective dual bases to one another.
Prove `latticeToFZ_fzToLattice`
(`latticeToFZ∘fzToLattice=id`), compatibility with reindexing, and, for every word `w`
of signed mutations of a fixed-data seed, `latticeToFZ(μ_w s)=μ_w(latticeToFZ s)` as
binary exchange data, with equal geometric coefficient patterns (§1.4). Prove that a seed identifies its fixed data
with the free model on `ℤ^I`; the frozen–frozen form and frozen weights are data of the
lattice seed, not functions of `B̃`.

**Checks.**

- With `B=((0,1),(−2,0))` and symmetrizer `(2,1)`, the inverse construction has weights `(1,2)` and yields `ε=Bᵀ`.
- For `N°=2ℤe`, `d=2` and zero form, normalization by 2 sends `N°` to `ℤe` and the dual basis `e*/2` to `e*`.
- For an empty mutable family, the least common multiple is one and the normalized matrix has no columns.

*Needs:* §3.1 for lattice seeds and signed mutation; §§1.1 and 1.4 for matrix mutation and geometric
coefficients.

### 3.3 Torus mutation and gluing

For a domain C and a lattice seed s, set
`A_s=Spec C[M°]`, `X_s=Spec C[N]`. With `s'=μ_k^+(s)`, construct rational maps
`μ_k:A_s⇢A_{s'}`, `μ_k:X_s⇢X_{s'}` by

```
μ_k* z^m = z^m (1 + z^{p₁*(e_k)})^{−⟨d_k e_k,m⟩},
μ_k* z^n = z^n (1 + z^{e_k})^{−d_k{n,e_k}}.
```

Here `m∈M°`, `n∈N`, and the pairing is evaluated on `d_ke_k∈N°`.
For `e_k=0` both maps are the identity. Otherwise the X exchange factor is
nonzero in every characteristic; for A require `1+z^{p₁*(e_k)}≠0`.
Construct the localized isomorphisms
`D(1+z^{p₁*(e_k)})≅D(1+z^{p₁*(e'_k)})` and
`D(1+z^{e_k})≅D(1+z^{e'_k})`.
These localized isomorphisms exist over any commutative ring, with possibly empty
domains. In an adapted basis presentation the A nonvanishing condition for all
directions is admissibility of the regular binary seed of `latticeToFZ(s)`
over C (§§1.2 and 1.4): a zero column gives the exchange factor 2.

For an adapted basis presentation, put `A_i=z^{f_i}`, `X_i=z^{e_i}` and prove
that the character formulas give

```
μ_k* A'_k = A_k⁻¹ (∏_i A_i^{[ε_{ki}]_+} + ∏_i A_i^{[−ε_{ki}]_+}),
μ_k* A'_i = A_i   if i ≠ k,
```

```
μ_k* X'_k = X_k⁻¹,
μ_k* X'_i = X_i X_k^{[ε_{ik}]_+} (1 + X_k)^{−ε_{ik}}   if i ≠ k.
```

For `latticeToFZ(s)`, the first is §1.4's exchange relation (frozen `A_j` as `z_j`)
and the second, for `i∈I_uf`, §1.2's `y`-mutation with `y_i=X_i` and `+` for `⊕`.
Under the A condition, the coordinates `A_i=z^{f_i}` in `FractionRing C[M°]`
are a generating regular chart, so they form an admitted domain realization
by binary seeds with matrix `latticeToFZ(s)`; prove that `μ_k` on the
A-tori is its seed mutation (§1.2) and that words of positive mutations are
its mutation words.
Construct the torus maps of seed isomorphisms and prove the composition laws for
seed transformations. In a mutation class of finite lattice seeds, define the
seed transformation groupoid `𝒢`: arrows are composites of mutations and seed
isomorphisms, with parallel composites identified when their rational maps agree
on both A- and X-tori over ℚ. Retain seeds as objects and seed isomorphisms as
arrows. Prove that these universal coordinate identities descend to every
admitted domain realization.

Fix an initial seed `s₀`. Use the coslice category `s₀ ↓ 𝒢` of marked seeds:
its objects are `t=(s,g)` with `g:s₀→s`. Let `A_t`, `X_t` be copies of the tori of s,
marked in the initial function fields by g.
The transition from `(s,g)` to `(r,h)` is `h∘g⁻¹`. Prove the cocycle laws and glue
along the largest opens where each transition and its inverse are regular.
Construct the schemes `𝒜`, `𝒳` with chart inclusions, not required affine or
separated. For each arrow `a:s₀→s₁`, construct the change-of-initial-seed
isomorphisms induced by `g↦g∘a⁻¹` and prove their composition laws.
Prove
`Γ(𝒜,𝒪)=⋂_t C[M°]_t` over these marked charts in the common field
`FractionRing C[M°]`. For an adapted basis presentation, identify this intersection
with `U_{C_J}` (§1.3) of the binary seed above, with `A_j` as `z_j`, and
construct `C⊗_ℤA_{R_J}→Γ(𝒜,𝒪)` by L8 (`J=I∖I_uf`);
`C⊗_ℤU_{R_J}≅Γ(𝒜,𝒪)` is not assumed. The intersection argument uses
integral charts and dense transition domains, not normality or Noetherianity of C.
The maps `p*:N→M°` with `p*(n)(n°)={n,n°}` whenever `n∈N_uf` or `n°∈N_uf∩N°`
(GHKK, (A.2)) form a nonempty torsor under `Hom(N/N_uf,(N_uf∩N°)^⊥)`, `^⊥` the
annihilator in `M°`. For each such `p*`, kept as data, construct `p:𝒜→𝒳` with torus
pullback `z^n↦z^{p*(n)}`, and prove `μ_k∘p=p∘μ_k` on every chart.

For the partial compactification used in §5.3, extend the shared regular-cone
chart API to any commutative ring R. If a cone in a lattice L is generated by a subset of a lattice
basis, its dual semigroup consists of the characters nonnegative on those
generators. Construct its chart `Spec R[σ^∨∩L*]`, identify it with
`𝔸_R^r×(𝔾_{m,R})^{rank(L)−r}`, and construct face inclusions as localizations at
the corresponding coordinate monomials. Prove compatibility with lattice
isomorphisms, face composition and arbitrary scalar change: for `R→R'`, construct
`R'⊗_R R[σ^∨∩L*]≃ₐ[R']R'[σ^∨∩L*]` and its scheme base-change
comparison, commuting with the face maps. Reuse the native
`TauCeti.MonoidAlgebra.isLocalization_away_mapDomainRingHom` and
`MonoidAlgebra.scalarTensorEquiv` for the
algebraic maps, together with §§0.2–0.3, the existing cone and dual-semigroup
carriers, and scheme gluing.

**Checks.**

- The regular cone generated by the first vector of `ℤ²` gives `Spec R[t,z^{±1}]`, and the zero face
  inverts `t`, also for `R=ℤ/4ℤ`.
- With zero form in rank one the two A charts glue over `D(2)` over ℤ, with empty overlap over `𝔽₂`.
- For the nonzero extended column `(0,2)ᵀ` over `𝔽₂`, the exchange factor is `(1+z)²≠0`.

*Needs:* §§3.1–3.2 for lattice and matrix mutation; §§1.2–1.4 for binary seeds, their admissibility
and algebras;
AnalyticToricGeometry Layer 0 for cones and dual semigroups; SchemeAndStackFoundations Layer 0 for
scheme gluing.

### 3.4 Principal and tropical comparisons

For a lattice seed, construct the
principal extension
`Ñ=N⊕M°`, `Ñ_uf=N_uf⊕0`, `Ñ°=N°⊕M`, `{(n,m),(n',m')}={n,n'}+⟨n,m'⟩−⟨n',m⟩`
(`⟨−,−⟩` the `ℚ`-valued pairing of `N`, `M°`), with mutable family `(e_k,0)`
and weights `d_k` (GHKK, Appendix B, for an adapted basis). Construct `𝒜_prin`, the projection
`𝒜_prin→Spec C[N]` induced by `0⊕N⊆M°⊕N=Hom(Ñ°,ℤ)`, and identify its fiber
over 1 with `𝒜` under §3.3's A nonvanishing condition (GHKK, Proposition B.2(1),
for an adapted basis). Prove that the principal `p₁*`
is injective on `Ñ_uf`; no injectivity of the original `p₁*` is required.
Its exchange factors for nonzero mutable vectors are nonconstant and nonzero in
every characteristic; zero mutable vectors give identity mutations.

For an adapted basis presentation, add the full principal basis
`(e_i,0),(0,f_i)` with weights `d_i` on both copies. Prove that its `latticeToFZ`
is `latticeToFZ(s)` with a new frozen row `(δ_ik)_{k∈I_uf}` for each `i∈I`.
Use adapted basis presentations in the following coordinate and scattering
comparisons. Zero rows of ε remain allowed whenever §3.3's A condition holds;
the principal seed has no zero column and is admissible over every domain.

On the full principal character lattice `M̃°=M°⊕N`, define the rational alternating
form `λ((m,a),(m',a'))=⟨a,m'⟩−⟨a',m⟩−β(a,a')`. Over a commutative `ℚ`-algebra R,
give `R[M̃°]` the monomial Poisson bracket `[z^u,z^v]_P=λ(u,v)z^{u+v}`.
For `n,n'∈N_uf`, put `r(n)=(p₁*(n),n)` and prove
`λ(r(n),(m,a))=⟨n,m⟩`, `λ(r(n),r(n'))=β(n,n')`.
For `n,n'∈(Σ_{i∈I_uf}ℕe_i)∖{0}`, restrict `H_{z^{r(n)}}` to
`R[M°][t_i:i∈I_uf]` via `z^{(m,a)}=z^m t^a` and extend continuously to its
`t`-adic completion. Prove this is ScatteringDiagrams §4.2's `D_n`, with
`[D_n,D_{n'}]=β(n,n')D_{n+n'}`; these Hamiltonian derivations annihilate every `t_i`.

For an adapted basis, identify the positive functions on the universal
geometric-type `𝒜` chart with `Pos(Trop(J),K)`, `J=I∖I_uf`, and prove that
§3.2's comparison intertwines L7a's mutation equivalences. For every coefficient
semifield `Q`, construct the `Q`-valued `𝒜` and `𝒳` atlases by evaluating their
subtraction-free transitions; prove compatibility with mutation and reindexing.

For `min` and for `max` on `ℤ`, construct the tropical points of `𝒜` and `𝒳` (charts
`N°`, resp. `M`) from the universal integral subtraction-free transitions,
before scalar change or reduction. Prove that *minMaxNegation* `x↦−x` is a
semifield isomorphism `(ℤ,max,+)≅(ℤ,min,+)` intertwining the two tropicalizations of
every subtraction-free function (§0.1), hence of every transition. Define
`T_k:M°→M°`, `T_k(m)=m+[⟨d_ke_k,m⟩]_+p₁*(e_k)` in the `max` convention
(GHKK, (1.23) and Proposition 2.4), and prove
`T_k(Σm_jf_j)=Σm'_jf'_j` in the bases of `s` and `μ_k^+(s)`, with `m'_k=−m_k`,
`m'_j=m_j+[ε_kj]_+[m_k]_+−[−ε_kj]_+[−m_k]_+`. The commuting squares are: lattice,
`latticeToFZ(μ_k^±s)=μ_k(latticeToFZ s)` (§3.2); coordinate, the formula for `T_k` just
given; tropical, *minMaxNegation* composed with the `max`-tropicalized transition equals
the `min`-tropicalized transition composed with *minMaxNegation*. Transport Laurent
expansions (§0.3, L8) and positivity (§0.3) along them. For `c`- and `g`-vectors (L5,
L6b), `fzToLattice` sends `c_{j;t}` to `Σ_i(c_{j;t})_ie_i∈N` and `g_{j;t}` to
`Σ_i(g_{j;t})_if_i∈M°`; §5.3 states its lattice results through these maps.
`N°`, `M`, `M°` and the `min`/`max` tropical points are distinct types.

**Checks.**

- For the rank-one zero form, the principal exchange is `A₁A₁'=1+t`, which specializes to `2` at `t=1`.
- In the same principal lattice the Hamiltonian gives `D_{e₁}(z^{e₁*})=z^{e₁*}t` and annihilates `t`.
- For `B=((0,1),(−2,0))` with weights `(1,2)`, `T₁(f₁)=f₁−2f₂` and `T₁(−f₁)=−f₁`. Negation
  identifies these with the corresponding minimum-convention transitions.

*Needs:* §§3.1–3.3 for lattices, principal blocks and gluing; §0.1 for tropical evaluation;
§1.2 and §2.3 (L7a) for positive points and positive function transitions; §2.2
(L5–L6) and §2.3 (L8) for principal vectors and expansions; ScatteringDiagrams §4.2 for the
derivations.

### 3.5 Comparison of seed presentations

Given an adapted basis presentation,
evaluate mutation words as lattice-seed transformations and compare the resulting
mutation-tree atlas with §3.3's marked atlas. Prove that their glued schemes are
canonically isomorphic, compatibly with chart maps and changes of initial seed.

Realize the mutation charts in the initial function field and prove that
`latticeToFZ` identifies them with the pattern of §3.3's binary seed (§1.4):
the realized charts are the charts of its reachable seeds. Identify the graph
of these realized seeds modulo mutable relabeling with §1.3's exchange graph.

Sources: GHKK, §1.3, §2 and Appendices A–B, especially Remark B.8; GHK,
[Birational geometry of cluster algebras](https://arxiv.org/abs/1309.2573),
§2, (2.5)–(2.6); Fock–Goncharov,
[Cluster ensembles, quantization and the dilogarithm](https://www.numdam.org/item/10.24033/asens.2112.pdf),
§§1.2.5–1.2.6.

**Checks.**

- For an empty mutable set both atlases are the initial torus.
- For the rank-one column `(0,1)ᵀ`, the transition between the two charts in both presentations is `x↦(1+z)/x` with `z` fixed.
- For coefficient-free `A₂`, compare the realized charts after words `[1,2]` and `[2,1,2]` by
  interchanging the two mutable labels.

*Needs:* §§3.1–3.3 for lattice mutation and its charts; §§1.3–1.4 for the mutation tree, exchange
graph and geometric realizations.

### Examples

Use the skew-symmetrizable rank-two example below to compare the lattice, coordinate and tropical presentations.

On `N=N°=N_uf=ℤ²` with the determinant form, take two mutable
labels with `e₁=e₂=(1,0)` and `d₁=d₂=1`. Construct the mutation maps without
choosing a basis presentation; mutation at the first label gives
`e'₁=(−1,0)`, `e'₂=(1,0)`. This family neither is independent nor spans N.

For `B=((0,1),(−2,0))`, symmetrizer `(2,1)`, weights `(1,2)` and
`{e₁,e₂}=−1`, `β(e₁,e₂)=1`: `ε=Bᵀ`, `f₂=e₂*/2`,
`latticeToFZ(μ_k^±s)=μ_k(B)` (`k=1,2`),
`T₁(f₁)=f₁−2f₂`, `T₁(−f₁)=−f₁`, and `T₁^min(∓f₁)=−T₁(±f₁)` for
`T₁^min(m)=m+min(⟨d₁e₁,m⟩,0)p₁*(e₁)`. For `N=N_uf=ℤe₁`, `d₁=1`, zero form, the principal
extension has `B̃=(0,1)ᵀ` and `A₁A'₁=1+t`, `t=z^{(0,e₁)}`, becoming `A₁A'₁=2` at `t=1`.
Here `λ((0,e₁),(e₁*,0))=1`, so `D_{e₁}(z^{e₁*})=z^{e₁*}t` even though `β=0`.
The rank-zero construction has `lcm ∅=1` and `gcd ∅=0`. For
`N=N_uf=ℤe`, `N°=2ℤe`, `d=2`, zero form and `g=2`, normalization gives
`N°_g=ℤe`, `d'=1` and sends the old dual basis `e*/2` to `e*`.
For the cone generated by the first vector of `ℤ²`, the chart is
`Spec R[t,z^{±1}]`; its zero face is `Spec R[t^{±1},z^{±1}]`, including
`R=ℤ/4ℤ`. Over ℤ, the zero-form rank-one A charts glue over D(2);
over `𝔽₂` this overlap is empty: the fiber exists as a scheme, but the
rank-one zero-column binary seed over `𝔽₂` is not admissible, and its
exchange element `2x⁻¹=0` gives no mutation in a common function field. For X, `1+X_k≠0` in
every characteristic. Over `𝔽₂`, the nonzero column `(0,2)ᵀ` has exchange
factor `1+z²=(1+z)²≠0`; exponent labels are not reduced modulo the characteristic.

### Dependencies

Layers 0–2 supply the coefficient, mutation and Laurent APIs. ScatteringDiagrams §4.2 supplies the
lattice carriers and derivations. AnalyticToricGeometry Layer 0 supplies cones and dual semigroups.
SchemeAndStackFoundations Layer 0 supplies scheme gluing.

## Layer 4: finite type and almost-positive roots

Inputs are §§1.1–1.3, L8 and the named RootSystems interfaces. Construct
§4.2's root compatibility for a given finite root system and §4.1's diagram
reduction before using them in the finite-type classification and denominator
correspondence; neither construction assumes that final classification.
The algebraic classification and denominator correspondence also hold for
every admitted domain realization by normalized seeds, with `φ:P→Cˣ`
(§1.2). Prove
preservation of the denominator terms below; do not infer distinctness of
specialized variables from a possibly noninjective coefficient map.

### 4.1 Classification

For an exchange matrix `B : Matrix K K ℤ` let `[B]` be the set of
all `μ_w(B)`, `w` a mutation word. A seed is of finite type if its pattern has finitely many
cluster variables (§1.3); `B` is of finite mutation type if `[B]` is finite. The Cartan
companion `A(B)` (`cartanCompanion`) has `a_ii=2`, `a_ij=-|b_ij|` (`i≠j`); prove `D_s A(B)` symmetric for each
symmetrizer `D_s` of `B`. Call `B` bipartite if `b_ijb_ik≥0` for all `i,j,k`. For every
coefficient semifield `P` and `y : K→P`, for the regular normalized seed over
`ℤ[P]` with initial state `(y,B)` and for each admitted domain realization with this
initial state, prove the equivalence of:

1. The seed is of finite type.
2. Some `B'∈[B]` has `IsFiniteType (A(B'))`.
3. Every `B'∈[B]` satisfies `|b'_ij b'_ji|≤3` for all `i≠j`.

(FZ II, Theorems 1.4, 1.5 and 1.8.)

The geometric-type signature `finite_clusterVariables_iff` states 1 ⇔ 2 for a binary seed
over ℤ with frozen rows and a faithful chart in a field, using its principal block.
The matrix signature `exists_isFiniteType_iff_forall_le_three` states 2 ⇔ 3.

For connected `B` (the graph of `b_ij≠0` is connected) of finite type prove that a unique
`t` with `DynkinType.Valid t` has some `B'∈[B]` with `A(B')` equal, after some
`K≃Fin t.rank`, to `(DynkinType.cartanMatrix t)ᵀ`, FZ II's Cartan matrix of type `t` (so
`Bₙ≠Cₙ`); every valid `t` occurs, and two such classes agree up to simultaneous reindexing
exactly when their types agree. Every finite-type `B` is, after reindexing, block diagonal
with connected blocks, and the multiset of their types determines `[B]` up to reindexing.
Build the weighted diagram `Γ(B)` (an edge `i→j` of weight `|b_ij b_ji|` when `b_ij>0`),
diagram mutation with `Γ(μ_k B)=μ_k Γ(B)`, and FZ II Theorems 7.1 and 8.6, where 2-finite
means condition 3 (for diagrams: all weights in the mutation class are at most 3): every
connected 2-finite diagram is mutation equivalent to an orientation of a Dynkin diagram,
all orientations of one Dynkin diagram are mutation equivalent, and every 2-finite `B` is
mutation equivalent to a bipartite matrix. RootSystems' classification does not supply
these targets.

**Checks.**

- The zero rank-two matrix has Cartan companion `diag(2,2)` and finite type `A₁×A₁`.
- For `B=((0,1),(−3,0))` the entry product has absolute value three and the type is `G₂`.
- For `B=((0,2),(−2,0))` the mutation class is finite but the entry product is four and the cluster-variable set is infinite.

*Needs:* §§1.1–1.4 for matrices, seeds and their patterns; §2.3 (L8) and the rank-two denominator
calculation of §4.2 for the implication from finite type to 2-finiteness; native Cartan type and
RootSystems Layers 1–3 for root-system and Weyl-group conventions.

### 4.2 Root combinatorics

Let `Φ` be a finite crystallographic root system with
`RootPairing.Base`, simple roots `α_i` (`i∈I`), Cartan matrix `A` in FZ II's convention
`s_i(α_j)=α_j-a_ijα_i`, i.e. `a_ij=⟨α_j,α_i^∨⟩`; prove that `A` is the transpose of
`RootPairing.Base.cartanMatrix` and, for `Φ` of type `t` with simple roots numbered as in
`t`, of `DynkinType.cartanMatrix t`; both have `(i,j)` entry `⟨α_i,α_j^∨⟩` (Bourbaki). Let
`[β:α_i]` be the coefficient of `α_i` in `β`. Put `Φ_{≥-1}=Φ_{>0}∪{-α_i}`. For a
bipartition `I=I_+⊔I_-` of the Coxeter graph define `τ_ε` on `Φ_{≥-1}` by `τ_ε(-α_i)=-α_i`
for `i∈I_{-ε}` and `τ_ε(α)=(∏_{i∈I_ε}s_i)(α)` otherwise. Prove that exactly one `ℕ`-valued
`(α||β)` on `Φ_{≥-1}²` satisfies `(-α_i||β)=max([β:α_i],0)` and `(τ_εα||τ_εβ)=(α||β)` for
`ε=±`; that `(α||β)=0 ↔ (β||α)=0` (compatibility); and that for every maximal compatible
set `C` and `α∈C` exactly one `α'≠α` makes `C\{α}∪{α'}` maximal compatible. Construct the
cluster complex on `Φ_{≥-1}`, its facets and its exchange graph.

A bipartite seed for `Φ` has a bipartite exchange matrix `B°` (§4.1) with `A(B°)=A`. The
denominator vector `d(x)∈ℤ^I` of `0≠x∈L_{R,0}` (`R=ℤ[P]` or an admitted C)
is the unique d with `x=N/∏x_i^{d_i}`, `N∈R[x_i]` divisible by no x_i.
For every coefficient semifield P and bipartite initial regular normalized seed,
and each admitted domain realization, prove there is a unique bijection `α↦x[α]` from `Φ_{≥-1}` to the cluster
variables with `d(x[α])_i=[α:α_i]`; it has `x[-α_i]=x_i` and maps maximal compatible sets
bijectively to clusters. Deduce that there are `rank(Φ)+|Φ_{>0}|` cluster variables and
finitely many seeds. For a binary seed over ℤ in a field, `ncard_clusterVariables`
states the count when the Cartan companion of the principal block is the Cartan
matrix `A` of a finite reduced crystallographic root system (FZ II, Theorems 1.4
and 1.9). Use §4.1 to reach a bipartite seed and §1.3 to re-root the pattern there.

For a connected finite-type component of rank at least two, strengthen the
bipartite expansion to `x[α]=P_α/x^α` with `P_α(0)∈P` for every positive
root. In FZ II (5.3)–(5.4), the simple-root case has constant coefficient
`r∈P`. In the induction, γ is nonzero positive, so the next constant is
`q·∏_{i≠j}P_{τ(-α_i)}(0)^{-a_ij}/P_{τ(-α_j)}(0)∈P`.
Lemma 5.2 applies over any domain. After φ this constant remains a unit,
so the exact denominator vector and the root bijection persist. An A₁
component instead has its nonzero exchange constant by the admissibility
condition `φ(y_k)+1≠0`.

For the converse, a matrix failing 2-finiteness has a reachable rank-two
restriction with `bc≥4`. Freeze the other variables. In the forward
rank-two sequence write `x_m=P_m/x^{d_m}`. The integer recurrence gives
distinct positive denominator vectors, and the exchange recurrence gives
`P_{m+1}(0)=p_m P_m(0)^{a_m}/P_{m−1}(0)`, with p_m a coefficient unit
and a_m alternating between b and c. L8 and Lemma 5.2 give a polynomial
numerator with this unit constant. Thus the denominators stay distinct
in every admitted domain realization. This argument does not assume
characteristic zero or an injective coefficient map.

Sources: FZ II, Theorems 1.4–1.9, §5 (5.3)–(5.4) and Lemma 5.2,
and §§3, 7–10; RootSystems, Layers 1–3.

**Checks.**

- In `A₂`, `−α₁` and `α₂` are compatible, while `−α₁` and `α₁+α₂` have compatibility degree one.
- The denominator vector of the initial variable `x_i` is `−e_i`; its exchange at the bipartite
  initial seed has denominator vector `e_i`.
- The types `A₂`, `B₂` and `G₂` have 5, 6 and 8 almost-positive roots respectively.

*Needs:* §§1.1–1.3 and §4.1 for the definition of a bipartite seed and the diagram reduction; §2.3
(L8) for Laurent numerators; RootSystems Layers 1–3 and the native Cartan and Dynkin APIs for the
root data.

### Examples

Use the pentagon in type `A₂` to compare the mutation class, denominator vectors and almost-positive-root complex.

Types `A₂`, `B₂` and `G₂` have respectively 5, 6 and 8 variables;
type `A₁×A₁` has four. Construct the polygon-diagonal model for `A_n`, including
compatibility as noncrossing and mutation as a flip. The rank-two matrix
`((0,2),(-2,0))` has finite matrix mutation class but infinitely many cluster variables.

### Dependencies

Layers 1–2 supply mutation and Laurent expansion. RootSystems Layers 1–3 and the native Tau Ceti
Cartan APIs supply the root-system input.

## Layer 5: scattering, positivity and sign-coherence

### 5.1 Cluster scattering diagrams

For a Layer 3 adapted basis presentation `s`
(FZ seeds via `fzToLattice`), instantiate ScatteringDiagrams §4.2 over `ℚ`, tracking integral
coefficient subsemirings, with §3.4's faithful Hamiltonian realization on `ℚ[M°]⟦t_i⟧`,
`q^n=z^{p₁*(n)}t^n`, and incoming walls `(e_i^⊥,1+q^{e_i})`, `i∈I_uf`; call the
completion `𝔇_s`. Prove `κ(e_i)=d_i` and instantiate §4.2's *principalGradingDictionary*
and *principalProjectionComparison*. Construct the completion by ScatteringDiagrams
§3.3's *exists_outgoingCompletion* and identify its class by §3.4's uniqueness;
§7.2 supplies ordinary binomial wall positivity. Construct the map from this
principal action to the diagram of §3.4's principal extension
(`t_i` ↦ `e_i` in the `N` summand of
`Hom(Ñ°,ℤ)=M°⊕N`), proving it intertwines walls and wall crossings; it is not an
identification. These statements include zero rows of `ε` and noninjective
`p₁*:N_uf→M°`, also where GHKK assumes otherwise.

Write `M̃°=M°⊕N` for the full principal character lattice. Extend the
principal cylinders to `M̃°_ℝ` and call their completion `𝔇̃_s`; its wall
monomials are `z^{(p₁*(n),n)}`. Prove by the cylinder comparison and uniqueness
that this is the scattering diagram of §3.4's full principal seed. Apply
mutation invariance first here, where `p̃₁*` is injective: construct `T̃_k`
on wall supports and labels, with crossing signs and primitive normals, and
prove `T̃_k(𝔇̃_s)∼𝔇_{μ_k^+(s̃)}` (GHKK Theorem 1.24). Compare the two
sides of the mutation wall through ScatteringDiagrams §4.4's slab
localizations at each finite order. In the projected description, transport
the coefficient lattice, monomials and wall labels from this mutated full
principal seed, as well as projecting supports by `T_k`.
No mutation map between unchanged `t`-adic completions is asserted.

*Proof route.* Work order by order on common polyhedral refinements. Apply
ScatteringDiagrams §3.4's `outgoingCompletion_unique` to an auxiliary abelian
Lie algebra concentrated in one positive degree: a closed outgoing
homogeneous cochain then vanishes. Combine this with §1.4's sweep identity
to compare diagrams at their first differing degree and establish the
candidate's consistency.

At the mutation wall, use the relative filtration omitting the mutation
direction, retaining fine homogeneous degrees and geometric directions.
The same comparison and §4.4's localized slab-conjugation formulas give
the relative completion and its comparison with the ordinary completion.
Compare the filtrations through finite Lie algebra quotients and inverse
limits (§§0.3, 0.5 and 0.7), then identify the incoming walls and signed
path products (GHKK Theorem 1.28, Appendix C.2 and Theorem 1.24).

For theta functions, use §§5.3–5.5's finite-family, relative-probe and gluing
theorems, and §5.6's monomial comparison. Transport broken lines by the
linear parts of `T̃_k` and compare their crossing terms at the mutation
wall, preserving incoming data and weights. For `p∈M̃°` and generic Q,
let `S_{k,σ}` be the linear part on Q's side. The finite weighted sums give
`ϑ^{μ_k^+(s̃)}_{T̃_k(Q),T̃_k(p)}=S_{k,σ}(ϑ^{s̃}_{Q,p})`
(GHKK Proposition 3.6); §5.6's `theta_presentationInvariant` passes between
equivalent consistent representatives.

For a reachable principal seed t, use a labelled character lattice `M̃_t°`
and put `C̃(t)={Σ_α a_α f̃_α^t:a_α≥0 for α∈I_uf}`, with every frozen
exponent unrestricted. Let `τ̃_{s,t}` be the composite of the full principal
piecewise-linear maps, using inverse maps on reversed paths, and set
`C̃_t^+=τ̃_{s,t}^{-1}(C̃(t))`. Prove that, for a suitable equivalent representative
of `𝔇̃_s`, these cones are closures of scattering chambers and mutation corresponds
to adjacency across a facet (GHKK Construction 1.30 and Lemma 2.10).
Prove that the restriction of `τ̃_{s,t}` to `C̃_t^+` extends to an
integral lattice isomorphism `ℓ̃_t:M̃_s°≃M̃_t°`. Construct the monomial torus
isomorphism `ψ̃_t:A_t^prin≃T̃_t^scat`, with scattering character lattice
`M̃_s°` and `ψ̃_t^*(z^m̃)=z^{ℓ̃_t(m̃)}`. For expression transport
`W̃_{t→r}` from scattering chamber t to r, prove
`ψ̃_r^*∘W̃_{t→r}=μ̃_{r→t}^*∘ψ̃_t^*` on rational-function fields and
overlap localizations (GHKK Proposition 4.3 and Theorem 4.4).

Projection `π:M̃°→M°` commutes with these piecewise-linear maps. For the
original seed define `C(t)={Σ_i a_i f_i^t:a_i≥0 for i∈I_uf}`,
`C_t^+=τ_{s,t}^{-1}(C(t))`, where `τ_{s,t}` is §3.4's composite with
inverses on reversed paths. Prove `C̃_t^+=π^{-1}(C_t^+)` and that `ℓ̃_t`
induces the linear extension `ℓ_t:M_s°≃M_t°` of `τ_{s,t}|_{C_t^+}`.
The full principal monomial maps respect the coefficient-torus projection.
Prove the cluster-path transports rational. The binary seed of
`latticeToFZ(s)` over ℚ is admissible (§§1.2 and 1.4), so its exchange
elements are units and the needed denominators remain nonzero at `t_i=1`. Restrict to these
overlap localizations and descend to that fiber. This gives
`ψ_t:A_t≃T_t^scat`, `ψ_t^*(z^m)=z^{ℓ_t(m)}` and
`ψ_r^*∘W_{t→r}=μ_{r→t}^*∘ψ_t^*`, where `W` denotes this descended
transport; extend the comparison to §3.3's maximal regular overlaps.
No evaluation `t_i=1` on a formal completion or its fraction field is used.
Glue these chart comparisons to identify §3.3's cluster A-schemes with the
schemes obtained by gluing the selected scattering-chamber tori by wall crossing.

Prove that the cones `C_t^+` and their faces form the Fock–Goncharov cluster fan,
with common lineality `N_uf^⊥` and simplicial quotient cones.
The principal fan is its inverse image under π.
Sources for the chamber and fan comparisons: GHKK Construction 1.30,
Lemma 2.10 and Theorem 2.13.

**Checks.**

- The coefficient-free rank-one zero matrix has the two half-lines as chambers. Use the principal
  lift to distinguish the wall action from its specialized action.
- For type `A₂`, compare the path products around the pentagon after principal projection and normalization.
- For `B=((0,1),(−2,0))`, verify that the two simple incoming walls use the distinct adapted weights `(1,2)`.

*Needs:* §§3.1–3.4 for adapted bases, seed mutation and principal lattices; ScatteringDiagrams §1.4
for the sweep, §§3.3–3.4 for `exists_outgoingCompletion` and `outgoingCompletion_unique`, §§4.2–4.4
for the lattice dictionary, wall action and slab, §§5.1–5.6 for theta transport and presentation
invariance, and §7.2 for binomial wall positivity.

### 5.2 Cluster monomials and positivity

The finite geometric-type signature `exists_nonneg_laurentExpansion` states
positivity and nonnegative frozen exponents for a single reachable coordinate
of a binary seed over ℤ with a faithful chart in a field.

For a seed-t monomial
`c_t=∏_i(A_i^t)^{a_i}`, with mutable exponents nonnegative and frozen exponents
arbitrary integers, construct its principal lift `c̃_t` by the same word and
exponents on the original-coordinate variables of §3.4's principal extension.
Let `ã_t` be its character in that principal seed chart and set
`m̃=ℓ̃_t⁻¹(ã_t)`. Prove that `m̃∈C̃_t^+` and that `ϑ_{Q̃,m̃}`, with generic
endpoint in the initial chamber, equals the initial expansion of `c̃_t`
(GHKK Theorem 4.9 and Proposition B.11).
For the full initial label `m̃=(m,a)`, prove that multiplication by the
invariant coefficient monomial `t^a` intertwines the shifted coefficient
modules and their propagation maps. Projection and backward lifting of the
forgotten velocities then extend ScatteringDiagrams §5.6's
*cylinderBrokenLineLift* from initial exponent `(m,0)` to `(m,a)`.
Use its *principalTheta_eq_projectedMonomialSum* for the cylinder comparison
`z^{(m,n)}↦z^m t^n`: group the finitely many contributions to each projected
component by §0.8's finite component expansion, retaining zero projected
shifts as coefficient changes. Work initially in
shifted modules over `ℚ[M°][t_j^{±1}:j∈I∖I_uf]⟦t_i:i∈I_uf⟧`
(ScatteringDiagrams §5.1); the shift allows negative mutable components of n.
By L8 and L6a the result lies in `ℤ[t_i:i∈I_uf][M°]⊆ℚ[M°]⟦t_i⟧`.
Added principal variables indexed by original frozen vertices do not occur:
their zero rows in the initial extended matrix stay zero under mutation.
Apply ScatteringDiagrams §7.7's *theta_coefficients_nonnegative* to §7.2's
ordinary binomial positive representative in the standard principal monomial
presentation. Its weighted cylinder comparison gives §5.4's same positive
section in the projected coefficients. Identify the result with Layer 2's unique
finite expansion, with all coefficient and chart maps specified. Specialize
`t_i=1` only on this polynomial subring. The reduction of the full label m̃
to a g-vector is proved in §5.3, not used to define this comparison.
Theorems:

- for every regular binary seed over ℤ (any `B̃`, including singular `B` and zero rows) and
  reachable `s,t`, the expansion of `x_{j;t}` in chart `s` lies in `ℕ[z_f][x_{i;s}^{±1}]`
  (with L6a), and in `ℕ[z_f][z_r^{-1}:r∈S][x_{i;s}^{±1}]` in each `R_S`;
- for every coefficient semifield `P` and regular normalized seed over `ℤ[P]`,
  it lies in `ℕ[P][x_{i;s}^{±1}]` (with L7), i.e.
  every §0.3 coefficient function is positive;
- the same for cluster monomials and under L7a's `u_i↦y_i` and L8's `A_P→A_Q`.

For the admitted domain realizations of §§1.2–1.4, transport these finite
integral expansions through L8's coefficient maps. Positivity means that the
universal coefficients lie in `ℕ[P]`; no order or characteristic-zero
structure on the target domain is required or asserted. The scattering and
Lie-action construction remains over ℚ, and is not reduced by a nonexistent
map `ℚ→C` in positive characteristic. Tropical labels and integer C/G data
are attached to the universal integral pattern before coefficient reduction.

**Checks.**

- An initial cluster monomial has a one-term expansion in its own chart with coefficient one.
- For the principal rank-one seed, the first mutation has two terms `x₁⁻¹` and `u₁x₁⁻¹`, each of coefficient one.
- In coefficient-free type `A₂`, the two successive mutations at 1 then 2 give `x₂'=(1+x₁+x₂)/(x₁x₂)`.

*Needs:* §§3.4 and 5.1 for principal charts and cluster chambers; §2.3 (L8) for finite expansions;
ScatteringDiagrams §0.8 for finite component expansion, §5.1 for theta transport, §5.6 for
`cylinderBrokenLineLift` and `principalTheta_eq_projectedMonomialSum`, and §§7.2 and 7.7 for
positive wall actions and `theta_coefficients_nonnegative`.

### 5.3 Sign-coherence

The signature `cVector_signCoherent` states sign-coherence of the columns
of the frozen block of the mutated principal extension.

`C_t` and `G_t` are the FZ matrices of L5 and L6b. Construct the
principal partial compactification relative to a fixed initial lattice seed `s`:
start with the cone spanned by `(0,e_i*)` in `Ñ°=N°⊕M`, for the second copy of `I`,
transport its fan by geometric tropicalization of the chart transitions, and use
§3.3's regular-cone charts and face localizations to glue the toric charts
(GHKK Construction 5.1, Construction B.9 and Remark B.10).
Construct its morphism to `𝔸^I` extending §3.4's coefficient-torus projection.
Prove that the zero fiber is the initial torus and that adjacent mutations are
isomorphisms on its neighborhoods (GHKK Lemma 5.2 and Corollary 5.3).
Identify the two coefficient monomials
`u^{[c_{k;t}]_+}`, `u^{[-c_{k;t}]_+}` of each principal exchange relation and prove one is
`1`, without assuming sign-coherence.

Extend L6b's degree calculation to geometric extended matrices, with
`deg z^m=m` and `deg t_k=−p₁*(e_k)` in `ℤ[t_k:k∈I_uf][M°]`.
For §5.2's lifted monomial of degree `g(c_t)`, prove `m̃=(g(c_t),0)` by its
torus character on the zero fiber (GHKK Proposition 5.7 and Corollary 5.9).
This gives the reduced-label theta comparison. With original frozen variables,
the mutable g-vectors generate the chamber modulo its frozen lineality.
For a mutable matrix B₀ and its principal pattern, these are L6b's g-vectors.
Theorems, for every
skew-symmetrizable `B₀` and every mutation word:

- each column of `C_t` is entrywise `≥0` or entrywise `≤0`;
- the `g`-vectors `g_{i;t}`, via the principal grading, are the integral generators of
  `C_t^+`, and each row of `G_t` is entrywise `≥0` or `≤0`;
- `G_tᵀD_sC_t=D_s` for the FZ symmetrizer `D_s=diag(s_i)`; hence `det C_t, det G_t=±1`
  and no column of `C_t` is zero; under `fzToLattice` (`d_i=L/s_i`) and §3.4's maps
  this is `⟨d_ic_{i;t},g_{j;t}⟩=δ_ij` between `N` and `M°`;
- every `F_{j;t}` has constant term `1`, and, with `ε` the sign of `c_{k;t}`,
  `F_{k;t'}F_{k;t}=u^{|c_{k;t}|}∏_iF_{i;t}^{[εb_{ik;t}]_+}+∏_iF_{i;t}^{[-εb_{ik;t}]_+}`,
  as a consequence of column sign-coherence and the nonzero c-columns.

For the duality statement, use L6b's `G_tB_t=B₀C_t` to derive the signed matrix recurrences
`C_{t'}=C_tF_ε`, `G_{t'}=G_tE_ε`, using §1.1's mutable factors and a sign
with `εc_{k;t}≥0`. Their determinants are −1 and
`E_εᵀD_sF_ε=D_s`; induction gives unimodularity and `G_tᵀD_sC_t=D_s`.
This is the route of NZ Theorem 1.2, Proposition 1.3 and (2.7), with its
sign-coherence hypothesis discharged here. Since no c-column is zero,
exactly one of the two coefficient monomials is 1 and the other vanishes at
u=0. Evaluating L6b's recurrence at u=0 and starting from `F_{j;0}=1`
then proves the constant-term assertion by induction.

Sources: GHKK, Theorems 1.24, 4.9–4.10, Corollary 5.5 and Theorem 5.11;
NZ, Theorem 1.2, Proposition 1.3 and (2.7).

**Checks.**

- At the initial principal seed, the `C` and `G` matrices are identities.
- For the first mutation in rank one, both matrices have sole entry `−1`.
- For `B=((0,1),(−2,0))`, mutation at 1 gives `C'=((−1,1),(0,1))` and `G'=((−1,0),(2,1))`. Verify `G'ᵀ diag(2,1) C'=diag(2,1)`.

*Needs:* §§3.3–3.4 and 5.1–5.2 for tropical transport, cone charts and chambers; §2.2 (L5–L6b) for
principal coefficients and degrees; AnalyticToricGeometry Layer 0 for the rational cone and
dual-semigroup carriers.

### Examples

Trace the principal type `A₂` pattern through the cluster chambers, theta expansions and sign-coherent columns.

Compute the `A₂` chamber fan and principal `C,G,F` data around its pentagon.
For `B=((0,1),(-1,0))` and word `1,2,1,2`, the lattice dual basis is
`f_1^t=−f_2`, `f_2^t=f_1−f_2`, while the g-vectors are `−f_2,f_1` and the
principal cluster is `((1+u_2x_1)/x_2,x_1)`. The theta label `f_1` is
transported by ℓ_t to `f_2^t`, giving x_1. The untransported character f_1
after `u_1=u_2=1` would instead give `x_1x_2/(1+x_1)`, whose value at
`x_1=x_2=1` is 1/2 rather than 1.
For `B=((0,1),(-2,0))`, mutation in direction 1 has `g=(-1,2)` for the new variable;
check row sign-coherence and `GᵀD_sC=D_s` with `D_s=diag(2,1)`.
Zero-form rank one (`N=N_uf=ℤe₁`, `d₁=1`) has initial wall `(e₁^⊥,1+t_1)` and exchange
`xx'=1+t_1`; after one mutation `C=(−1)`, `G=(−1)` and `F=1+u`, although its skew form
is zero. Its original coefficient-free exchange is `xx'=2`, obtained at
`t_1=1` on the finite expression; the original-lattice map `T_k=id` does
not remove the auxiliary coefficient from `1+t_1`.

### Dependencies

Layers 0–3 supply integral Laurent expansions and the adapted lattice and chart comparisons.
ScatteringDiagrams §§0.8, 1.4, 3.3–3.4, 4.2–4.4, 5.1–5.6 and 7.1–7.7 supply completion, wall actions
and theta results. AnalyticToricGeometry Layer 0 supplies the cone and dual-semigroup carriers.

## Layer 6: double Bruhat cells

### 6.1 Double Bruhat cells and generalized minors

Let `G` be a pinned split connected simply connected
semisimple group over a characteristic-zero field 𝕜, `T⊂B_+` its split maximal
torus and `B_-` the opposite Borel.
For `u,v∈W` construct the locally closed subscheme `G^{u,v}=(B_+uB_+)∩(B_-vB_-)` of `G`
as a scheme intersection, with its function field; prove it smooth, irreducible, of
dimension `rank(G)+ℓ(u)+ℓ(v)` (FZ, *Double Bruhat cells and total positivity*,
Theorem 1.1, over ℂ). Construct the double-word factorization charts and their
rational inverses. Uses ReductiveGroups Layers 7 and 7C.

For each fundamental weight `ω_i` (a character of `T`) construct
`Δ_{ω_i,ω_i}` as a matrix coefficient of the rational highest-weight representation of
ReductiveGroups Layer 10, equal to `ω_i(h)` on `U_-TU_+`. With pinned Weyl representatives
put `Δ_{uω_i,vω_i}(g)=Δ_{ω_i,ω_i}(ū⁻¹gv̄)`; prove it regular, dependent only on `uω_i`
and `vω_i`, and for `SL_n` equal to the minor with rows `u([1,i])` and columns `v([1,i])`.
Prove the rank-two identities of FZ, *Double Bruhat cells*, Theorem 1.16 (with their
transposed companions), the `G₂` identities of Berenstein–Zelevinsky,
*Total positivity in Schubert varieties*, (4.8)–(4.11), and FZ's mixed-minor
identity, Theorem 1.17. Construct the twist map
`ζ^{u,v}:G^{u,v}→G^{u⁻¹,v⁻¹}` as a biregular isomorphism with inverse
`ζ^{u⁻¹,v⁻¹}` and its pullback on coordinate rings (FZ, *Double Bruhat cells and
total positivity*, Definition 1.5 and Theorem 1.6, over ℂ). Other isogeny types are out
of scope.

Use ReductiveGroups Layer 8's split root-datum classification to identify G
with the scalar extension of its pinned rational model. Construct these
objects over that model and prove their naturality under characteristic-zero
field extension. Use the algebraic
root-coordinate and highest-weight constructions of the suppliers; complex
topology is not an input. If using the complex BFZ proof, descend the algebraic
chart isomorphisms and codimension bounds to ℚ by faithful flatness, then
extend to 𝕜. No embedding `𝕜→ℂ` is assumed. An all-characteristic statement
would additionally require the minor-chart and codimension bounds in special
fibers; it is not obtained by reducing the complex coordinate-ring isomorphism.

**Checks.**

- In `SL₂`, the identity double cell is the diagonal torus.
- The double cell `G^{s,s}` in `SL₂` is defined by `bc≠0` in matrix coordinates `(a b; c d)`.
- For the defining representation of `SL₂`, the highest-weight minor on the big cell is the top-left entry `a`.

*Needs:* ReductiveGroups Layers 7, 7C, 8 and 10 for opposite Borels, root coordinates, split root
data and highest-weight representations.

### 6.2 The BFZ seed

For every double reduced word `i` for `(u,v)`, use negative
letters for `u`, positive letters for `v`, and prepend the indices `-r,…,-1` as in BFZ.
The successor `k⁺` is the next occurrence of the same absolute simple index; the mutable
positions are the positive positions with a successor in the word. Implement `B̃(i)` of
BFZ §2.2, Definition 2.3 and Remark 2.4, and the minors `Δ(k;i)` of §2.3,
(2.9)–(2.11), with index conversions. Prove that `B̃(i)` has full column rank and its
principal part is skew-symmetrizable (BFZ III, Proposition 2.6). Prove that the frozen
minors are units on `G^{u,v}` and construct the field isomorphism sending each initial
variable `x_k` to `Δ(k;i)` (BFZ III, Lemma 2.12(1)–(2), over ℂ). This is a generating
regular chart in the function field of `G^{u,v}`; the BFZ seed is the resulting
regular binary seed over 𝕜 with matrix `B̃(i)` (§1.4). It is admissible,
so all its mutation words are defined (§1.2). For every
mutable `k` and every Cartan type, prove the exchange relation as an identity
of regular functions for the mutated seed, that `x'_k` is regular, and that the cluster of `μ_k` gives a chart of `G^{u,v}`
(BFZ III, Lemma 2.12(3)–(4), for regularity and the chart over ℂ).

**Checks.**

- For the identity double word in `SL₂`, the sole initial minor is frozen.
- For the double word `(−1,1)` in `SL₂`, there is one mutable variable and two frozen ones.
- In this rank-one seed the determinantal identity `ad=1+bc` is the exchange, with `a,d` the two adjacent mutable minors.

*Needs:* §6.1 for generalized minors and factorization charts; §§1.1–1.4 for extended matrices,
regular binary seeds and their mutation; BFZ III §2 for the signed-word formulas.

### 6.3 Coordinate ring identification

For the initial and adjacent charts of §6.2, show that each Laurent ring over
`𝕜_J` is the ring of functions on the open where the images of its mutable
coordinates are nonvanishing. The frozen minors are units on `G^{u,v}`. Prove that
the complement of the union of these opens has codimension at least two.
Smoothness gives the depth hypothesis of §2.7, whose finite-family equality
identifies `Γ(G^{u,v},O)` with the upper bound `UB_J` of the BFZ seed (§1.3).
Apply §2.1's full-column-rank upper-bound corollary to construct
`U_𝕜(B̃(i)) ≃ₐ[𝕜] Γ(G^{u,v},O)` sending each `x_k` to `Δ(k;i)`, where `U_𝕜`
is the upper cluster algebra `U_{𝕜_J}` of the BFZ seed.
For double reduced words `i,i'` of `(u,v)` construct the composite
`U_𝕜(B̃(i))≃U_𝕜(B̃(i'))` through
`Γ(G^{u,v},O)`, without assuming the seeds mutation equivalent.
For field extension, first identify U with the finite upper bound and then
use flatness for that finite intersection; prove compatibility of the
coordinate-ring isomorphism with field extension. A product with a split
torus is obtained by adjoining its character Laurent algebra as frozen
coordinates, with the corresponding tensor-product comparison.

Sources: FZ, *Double Bruhat cells and total positivity*; BFZ III, §2, especially
Theorem 2.10 and Lemmas 2.12–2.13.

**Checks.**

- For `SL₂` and `(s,s)`, the two charts invert `a` and `d` respectively, and both invert `b,c`.
- Their complement is cut out by `a=d=0` and `bc=−1`, of codimension two in the cell.
- In the resulting coordinate ring `𝕜[a,b^{±1},c^{±1},d]/(ad−bc−1)`, extension of the ground field
  changes the scalars and keeps the minor generators.

*Needs:* §6.2 for the BFZ seed and adjacent charts, §2.7 for the finite Laurent chart
intersection, and §2.1 for the full-column-rank upper-bound theorem.

### Examples

Use `SL₂` and `G^{s,s}` to compare minors, the BFZ seed and the two-chart description of its coordinate ring.

For `SL₂`, `G^{s,s}` consists of matrices `(a b; c d)` with `bc≠0` and
`ad-bc=1`. Identify its coordinate ring with
`𝕜[b^{±1},c^{±1},a,d]/(ad-1-bc)`; `a,d` are exchanged and `b,c` are frozen.
For `SL₃` and `(u,v)=(w₀,w₀)`, reproduce BFZ's matrix, eight initial minors,
four mutable positions and four adjacent exchanges in Example 2.11.

### Dependencies

ReductiveGroups Layers 7, 7C, 8 and 10 supply the group theory and highest-weight representations.
Layers 1–2 supply binary seeds and their patterns, the finite chart intersection and the full-rank
upper-bound theorem.

## Downstream consumers

None.

## References

- **FZ I:** Fomin–Zelevinsky, [*Cluster algebras I: Foundations*](https://arxiv.org/abs/math/0104151),
  §§2–3, especially Theorem 3.1 for the general Laurent statement.
- **FZ II:** Fomin–Zelevinsky, [*Cluster algebras II: Finite type classification*](https://arxiv.org/abs/math/0208229),
  §1.3–1.5, §3, §5 (5.3)–(5.4) and Lemma 5.2 for denominator constants,
  §§7–10 and Proposition 11.2 for polynomial frozen coefficients.
- **FZ IV:** Fomin–Zelevinsky, [*Cluster algebras IV: Coefficients*](https://arxiv.org/abs/math/0602259),
  Definitions 2.1–2.4, Theorems 3.5 and 3.7, and Corollary 6.3.
- Fomin–Zelevinsky, [*The Laurent phenomenon*](https://arxiv.org/abs/math/0104241),
  Theorem 1.8 and Example 3.3 for the Somos-4 recurrence.
- **FWZ:** Fomin–Williams–Zelevinsky, [*Introduction to Cluster Algebras*, Chapter 6](https://people.math.harvard.edu/~williams/papers/chapter6.pdf),
  §6.4, especially Proposition 6.4.1 and Remarks 6.4.4–6.4.5 for Starfish and the coefficient conventions.
- **NZ:** Nakanishi–Zelevinsky, [*On tropical dualities in cluster algebras*](https://arxiv.org/abs/1101.3736),
  version 3, Theorem 1.2, Proposition 1.3 and (2.7); the sign-coherence premise
  is proved in §5.3 before these recurrences are used.
- **GHKK:** Gross–Hacking–Keel–Kontsevich,
  [*Canonical bases for cluster algebras*](https://arxiv.org/abs/1411.1394), version 2,
  §1.3 (PDF pp. 29–34), §4 (pp. 45–50), §5 (pp. 50–57),
  Appendix A (pp. 111–113) and Appendix B (pp. 113–118).
- **BFZ III:** Berenstein–Fomin–Zelevinsky,
  [*Cluster algebras III: Upper bounds and double Bruhat cells*](https://arxiv.org/abs/math/0305434),
  §§1–7; the upper-bound proof is on PDF pp. 24–28, and Theorem 2.10 and its
  geometric input are on pp. 15–18 of version 3.
- Fomin–Zelevinsky, [*Double Bruhat cells and total positivity*](https://arxiv.org/abs/math/9802056),
  the factorization, twist and generalized-minor constructions used by BFZ.
- Berenstein–Zelevinsky, [*Total positivity in Schubert varieties*](https://ems.press/content/serial-article-files/42750?nt=1),
  §4, (4.8)–(4.11), and Corollary 6.6 for the rank-two minor identities,
  including type `G₂`.
- **BZ:** Berenstein–Zelevinsky, [*Quantum cluster algebras*](https://arxiv.org/abs/math/0404446),
  §§3–4 for compatible pairs and mutation, §5 for integral upper bounds and Laurentness,
  §6 for bar operations, and §11 for Ore fractions and central divisibility.
- **GLS:** Geiss–Leclerc–Schröer,
  [*Quantum cluster algebras and their specializations*](https://arxiv.org/abs/1807.09826),
  for the distinction between variable specialization and algebra special-fiber
  isomorphisms.
- **BCDX:** Bai–Chen–Ding–Xu, [*Generalized quantum cluster algebras: the Laurent
  phenomenon and upper bounds*](https://arxiv.org/abs/2203.06928),
  Definition 2.3, Theorems 3.1 and 4.9 and the local algebra of §4.
- **Chekhov–Shapiro:** [*Teichmüller spaces of Riemann surfaces with orbifold points of
  arbitrary order and cluster variables*](https://arxiv.org/abs/1111.3963),
  §2.1, (2.4)–(2.5) and Theorem 2.5.
- **Nakanishi:** [*Structure of seeds in generalized cluster algebras*](https://arxiv.org/abs/1409.5967),
  Definition 2.2, (2.5)–(2.6), and (2.10)–(2.14).
