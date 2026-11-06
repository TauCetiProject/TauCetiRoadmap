# Cluster algebras

Build a reusable theory of classical and quantum cluster algebras: normalized
Fomin–Zelevinsky seeds, compatible quantum seeds, the Fock–Goncharov lattice
formalism and cluster varieties, the Laurent phenomenon, finite-type classification,
double Bruhat cells,
Laurent positivity, and sign-coherence. The algebraic and geometric definitions must
be connected by constructions and comparison theorems, with their full hypotheses.
Suggested homes are `TauCeti/Algebra/Cluster/` and `TauCeti/AlgebraicGeometry/Cluster/`.
Selected Lean interfaces are given in [Suggested.lean](Suggested.lean);
this README is the definitive mathematical specification.

Use faithful Laurent charts in a common ambient division ring as the algebraic
interface; the classical case uses a commutative field. Separate
exchange data, their realization by charts, and the choice of coefficient ring.
The tree presentation, normalized FZ tuples, and lattice seed coordinates are connected to
these objects by equivalences and transport theorems. References specify mathematical
results and proof ingredients; their historical encodings do not prescribe the API.

| Layer | Delivers | Depends on |
|---|---|---|
| 0 | Coefficients, based quantum tori, Laurent charts and local algebra | Mathlib; shared twisted algebra |
| 1 | Exchange frames, polynomial mutation, classical and quantum seeds and algebras | 0 |
| 2 | Common polynomial upper bounds; quantum and classical Laurentness; separation | 0–1 |
| 3 | Lattice formalism, cluster varieties, matrix and tropical realizations | 0–2; toric carriers and scheme gluing |
| 4 | Classical upper-bound structure and acyclic presentations | 0–2 |
| 5 | Finite-type classification and root parametrizations | 0–2; RootSystems |
| 6 | Cluster scattering, Laurent positivity and sign-coherence | 0–3; ScatteringDiagrams |
| 7 | Double Bruhat cells and their upper cluster algebras | 0–4; ReductiveGroups |

## Scope and dependency boundaries

The finite-rank FZ theory has arbitrary coefficient semifields and integer
skew-symmetrizable exchange matrices. Geometric type allows any frozen index set,
with finitely supported frozen columns; the classical finite-word Laurent theorem
also extends to locally finite mutable index sets. Include disconnected, degenerate
and zero exchange matrices, and rank zero. Allow any specified subset of frozen
variables to be inverted; write the coefficient ring in each theorem. The integral
theory has coefficient realizations over arbitrary domains, with the exchange
nonvanishing conditions of §§1.2–1.4.
Cluster schemes use integral domains: `𝒳` has no characteristic restriction, while
`𝒜` uses §1.4's nonvanishing condition. Regular toric charts work over every
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
compatibility weights w. Its local constructions use a faithful chart into a
possibly noncommutative division R-algebra, which forces R to be a domain.
No factoriality assumption is needed. Full column rank supplies upper-bound
invariance; Laurentness itself follows without it by a central principal lift.
The weights w may vanish and are separate from the matrix's positive symmetrizer.
This includes ordinary quantum seeds and classical geometric seeds.
The exchange polynomials are monic with constant coefficient one, and their
positive degrees divide their extended columns. Mutation reverses the selected
polynomial. For a zero column require `H_k(1)≠0`; this condition is preserved
by mutation. Reciprocal fixed polynomials and binary exchange are instances.
Section 2.6 constructs their quantum and classical algebras and comparison maps.
The central-factor calculation is in a pair Laurent ring in which all other
coordinates, including the frozen ones, are units. Layers 3–7 concern ordinary cluster seeds;
generalized coefficient-semifield separation is outside this roadmap.

- [ScatteringDiagrams](https://github.com/yuma-mizuno/TauCetiRoadmap/blob/1d7fe41f7c2797e342095a59ac26938784a8f454/TauCetiRoadmap/ScatteringDiagrams/README.md) owns completed
  wall groups, consistent completion, broken lines, theta transport and wall positivity.
  Consume §§3.4, 4.2–4.4, 5.1–5.7 and 7.1–7.7 at their stated hypotheses. This roadmap
  owns seed mutation invariance, the cluster chambers, and the theta/cluster comparison.
  Cluster positivity consumes these scattering theorems; their construction must not
  assume cluster Laurentness or positivity. The seed-free twisted algebra in §4.3 is
  shared infrastructure described below, not a dependency on wall completion.
- [RootSystems](../RepresentationTheory/RootSystems/README.md), Layers 1–6, owns
  finite root systems, Weyl/Coxeter comparisons and Cartan–Killing classification.
  Layer 5 here owns almost-positive roots, cluster compatibility and the classification
  of mutation classes; it consumes the existing root and Dynkin carriers.
- [ReductiveGroups](../ReductiveGroups/README.md), Layers 7, 7C, 8 and 10, supplies
  opposite Borels, actual root subgroups, Bruhat coordinates and rational highest-weight
  representations and root-coordinate constructions. Layer 8 supplies the split
  root-datum classification and comparison with pinned rational models.
  Layer 7 here constructs double cells, generalized minors and their cluster charts.
- [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md), Layer 0,
  supplies scheme gluing, dimension theory and §0.6's normal Hartogs extension.
  [SchubertGeometry](../SchubertGeometry/README.md) owns flag/Schubert section theory;
  use its existing comparisons when expressing minors as sections, without duplicating it.
- [AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md), Layer 0, owns the
  lattice, cone and dual-semigroup carriers and their complex affine toric schemes.
  Section 3.3 extends the regular-cone chart and face-localization API to the
  commutative ground ring used here; §6.3 consumes its rational instance.
  The complex scheme construction is not a general scalar-ring supplier.

- [InductionRestriction](../RepresentationTheory/InductionRestriction/README.md),
  Layer 7's twisted group algebra, owns the normalized-cocycle carrier and its
  universal property. Instantiate `TauCeti.twistedMonoidAlgebra` for the lattice
  cocycle in §0.4. Use this same instance for ScatteringDiagrams §4.3's
  `QuantumMonoidAlgebra`, with its monomial basis, coefficient maps and lattice maps.
- [QuantumGroups](../QuantumGroups/README.md)'s rank-one PBW development owns
  σ-derivation extensions. The present roadmap uses neither these extensions nor
  quantum-group presentations, representations or Hopf structure: its skew Laurent
  and skew polynomial rings are subrings of a division ring generated by a
  coefficient subring and normalizing elements.

## Ownership and proof dependencies

| Shared material | Single home | Consumers |
|---|---|---|
| Twisted algebra, basis and coefficient/lattice maps | Existing twisted monoid algebra; §0.4 instances | Based tori, quantum charts, scattering coefficients |
| Embedded skew Laurent normal forms, chart change and denominator patching | Seed-free algebra, §§0.4–0.5 | Polynomial mutation and Q1; commutative one-exchange statements |
| Support, separated scalar factors and flat simultaneous divisibility | Seed-free algebra, §0.6 | Commuting Q2 and classical divisibility statements |
| Finite ordered polynomial replacement | Seed-free algebra, §0.7 | Interacting Q2, binary and commutative replacement |
| Exchange matrices, column independence and equivariant mutation words | §§1.1–1.3 | Classical, quantum, polynomial and lattice realizations |
| Column-compatible frames and polynomial mutation | §1.5, P1 | Binary mutation, classical unit-parameter frames, ordinary quantum seeds |
| Local comparisons and the common Laurent theorem | Q1–Q3 | Classical L5, quantum Laurentness, polynomial algebras and realizations |
| Positive evaluation, frozen orders and normalized coefficient separation | L6–L7 | General classical Laurentness L8, recurrence specialization |
| Classical upper bounds under local divisibility and acyclic presentations | Layer 4 | Rank-deficient structural cases and double Bruhat cells |

Construct polynomial mutation P1 before Q1–Q3. Prove Q1–Q3 over every domain
and scalar unit, using full column rank for upper-bound invariance and the
central principal lift for the rank-free Laurent corollary. Obtain ordinary quantum Laurentness by `R=Z_v`,
`u=v`, `w=d` and binary exchange. Obtain classical principal Laurentness L5
directly by `R=ℤ`, `u=1`, `Λ=0`, `w=0`; L6–L7 then give L8 for arbitrary
coefficient semifields. The map `v↦1` compares quantum and classical Laurent
representatives and generated algebras; L5–L8 do not use it as a proof of
Laurentness. Neither common Q1–Q3 nor quantum Laurentness imports classical
Laurentness, separation, scattering or categorification.

Layer 4 proves additional equalities of commutative subrings. Its full-rank
instances use the same unit-parameter Q1–Q3, while its statements with explicit
principal-ideal intersection premises also cover rank-deficient seeds. They are not inputs to
L5–L8. An abstract pattern theorem may take local comparisons as hypotheses;
every seed instance must construct them from its exchange data. Seed data
contain neither Laurentness, upper-bound invariance, mutated-chart faithfulness
nor an unspecified local-comparison theorem. The complete seed contract is the
matrix, positive symmetrizer, alternating form, diagonal weights, their
compatibility, normalized scalar polynomials, zero-column nonvanishing and the
initial faithful chart specified in §1.5. Column independence is a separate
upper-bound hypothesis, derived automatically in the positive quantum sector.

## Library interfaces and conventions

Use `Matrix`, `Basis`, `Module.Dual`, `MvPolynomial`, `MonoidAlgebra`,
`AddMonoidAlgebra`, `FractionRing`, `IsFractionRing`, `Subalgebra`, `Subring`,
`Localization` and `IsLocalization` for their existing mathematical meanings.
Multivariable Laurent rings are group algebras of exponent lattices; the one-variable
comparison uses `LaurentPolynomial`. Tau Ceti's `laurentEval` and
`laurentEvalEquiv` in `TauCeti.Algebra.Polynomial.Laurent.Basic` supply evaluation at
a unit. They do not themselves provide the multivariable cluster-field construction.
For roots use `RootPairing`, `RootPairing.Base` and its integer Cartan matrix;
for types use `TauCeti.DynkinType`, `DynkinType.Valid` and `TauCeti.IsFiniteType`.
Extend these APIs where required instead of declaring parallel carriers.

The algebraic formulas use FZ's column exchange convention and tropical minimum.
Layer 3 uses ScatteringDiagrams §4.2's `SkewLatticeDatum` and `AdaptedBasis`, with
the derived form `β(n,n')={n',n}`. Thus `p₁*(n)={n,−}=β(−,n)` on `N°` for `n∈N_uf`.
The geometric tropical maps use maximum. Construct Layer 3's matrix realization
and min/max tropicalization maps and prove their mutation laws.
Brackets of derivations are the ordinary commutators `[D,E]=D∘E−E∘D`; for a
Poisson bracket `[−,−]_P`, use left Hamiltonians `H_f=[f,−]_P`.
Declaration names are illustrative; the mathematical statements specify the targets.

Use `OreLocalization` and the existing twisted monoid algebra for the noncommutative
foundations. One-exchange, patching and replacement statements concern subrings of a
fixed division ring, not an abstract skew-polynomial carrier. `FractionRing` and
`IsFractionRing` apply only to the commutative specialization.
The common scalar ring acts centrally; the ambient division ring need not be
commutative. Ordinary quantum algebras are `Z_v`-algebras. Quasi-commuting frozen
generators are coordinates, not central scalars.
The integral quantum form `Λ` is specified on the quantum torus's exponent lattice;
Layer 3's rational form `β` is defined on `N`.


## Layer 0: coefficient and ambient algebra

**0.1 Coefficient semifields.** A coefficient semifield is a commutative group `P` with an
associative commutative `⊕` over which multiplication distributes; there is no
additive-zero requirement (unlike `Semifield`). Construct `⊕`-preserving group
homomorphisms, indexed products, the one-element object, and `Fˣ` for a `Semifield F`
where nonzero elements have nonzero sums. Prove
[`IsMulTorsionFree P`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Monoid.html#IsMulTorsionFree)
and `IsDomain ℤ[P]`
for `ℤ[P]=MonoidAlgebra ℤ P`; construct `FractionRing ℤ[P]` and the injective
`P →* ℤ[P]ˣ`.

For a type `J`, `Trop(J)` is `Multiplicative (J →₀ ℤ)` with `⊕` the componentwise
minimum and generators `z_j`. Construct evaluations `Trop(J) →* Q`, `z_j ↦ q_j`, into
commutative groups, isomorphisms along `J ≃ J'`, and for finite `J` exponents in `J → ℤ`.
`Qsf(K)` is the set of `p/q ∈ FractionRing (MvPolynomial K ℤ)` with `p,q ≠ 0` having
`ℕ`-coefficients, with variables `u_i`; prove it closed under products, inverses and
`+`, so it is a coefficient semifield with `⊕=+`. For `y : K → P` construct the unique
`⊕`-preserving homomorphism `Qsf(K) → P`, `u_i ↦ y_i`; it sends every such `p/q` to
`p(y)/q(y)` computed with `⊕`.

**0.2 Laurent and rational-function models.** For a commutative ring `R` and a type `K`,
`L(R,K) = AddMonoidAlgebra R (K →₀ ℤ)`, with coefficients, support and monomial `Basis`.
Prove that `MvPolynomial K R → L(R,K)` is injective and is the localization at the
variables (`IsLocalization`), `IsDomain` for a domain `R`, reindexing along `K ≃ K'`, and,
for a commutative `R`-algebra `A`, the unique `L(R,K) →ₐ[R] A` with `X_i ↦ x_i` for
`x : K → Aˣ`. Construct coefficient maps along `R →+* R'`, injective along injective maps,
with identity, composition and reindexing laws, and `IsLocalization` of `L(R',K)` over
`L(R,K)` when `R'` localizes `R`. For any `K`, a domain `R` and a field `F`, a Laurent
chart is an injective `L(R,K) →ₐ[R] F`. Prove that charts correspond to `x : K → Fˣ`
algebraically independent over `R`, and those whose image generates `F` as a field to
transcendence bases generating `F` with the image of `R`; for these construct
`IsFractionRing L(R,K) F` and `IsFractionRing (MvPolynomial K R) F`, with model
`FractionRing (MvPolynomial K R)`. Public results hold for every generating chart and
transport along `F ≃ₐ[R] F'`.

**0.3 Expansions and coefficient rings.** `L_{R,t}` is the range of a chart `t`.
Construct the inverse `exp_t : L_{R,t} ≃ₐ[R] L(R,K)`, finitely supported coefficients,
and compatibility with coefficient inclusions, reindexing and `F ≃ₐ[R] F'`. For
generating `t,t'`, the transition automorphism of `FractionRing L(R,K)` sends `exp_t f`
to `exp_{t'} f` for `f ∈ L_{R,t} ⊓ L_{R,t'}`; it need not preserve `L(R,K)`.
For `R=ℤ[P]`, `f ∈ L(ℤ[P],K)` (or `exp_t f`) is positive when its coefficients lie in
`ℕ[P]`, equivalently lies in the image `ℕ[P][X_i^{±1}]` of
`AddMonoidAlgebra (MonoidAlgebra ℕ P) (K →₀ ℤ)`, a `Subsemiring`.
For any commutative ring C, any `J` and `S⊆J`, construct
`C_S=C[z_j:j∈J][z_s⁻¹:s∈S] ⊆ C[Trop(J)]` as a localization of
`MvPolynomial J C`, with C-basis the finitely supported `z^a` satisfying
`a_j≥0` for `j∉S`. Prove `C_∅≃MvPolynomial J C`, `C_J=C[Trop(J)]`, and
that `C_T` localizes `C_S` at `z_t` (`t∈T\S`) for `S⊆T`, compatibly with
all coefficient maps. Write `R_S` for `C=ℤ`; retain `C_S` for general scalars.

**Checks.** `Trop(Empty)` is the one-element object; `z^{(-1,2)}∈Trop(Fin 2)` evaluates
to `q_0⁻¹q_1²`. `(u_0²+u_0u_1)/(u_0+u_1)∈Qsf(Fin 2)` evaluates to `y_0` in every `P`. The
canonical chart of `L(ℤ,Fin 2)` keeps monomials `ℤ`-linearly independent.
`Qsf(Empty)` is the positive rational semifield, not `Trop(Empty)`.
For `J={1,2}` and `S={1}`, `z_1⁻¹z_2²∈R_S` but `z_2⁻¹∉R_S`; the latter enters after
localizing at `z_2`. Evaluation `L(ℤ,Unit)→ℤ` at `X=1` exists, while `X↦2`
does not extend to that Laurent ring because 2 is not a unit of ℤ.

**0.4 Based quantum tori and Ore realizations.** For a commutative ring `R`, a unit
`u∈Rˣ`, a finite free lattice `L` and an integral alternating form `Λ`, let `T(R,u,Λ)` be
the existing twisted monoid algebra of `Multiplicative L` for the cocycle `u^{Λ(a,b)}`, so
`X^a X^b=u^{Λ(a,b)}X^{a+b}`. Prove inverse monomials, coefficient extraction, finite
support, lattice reindexing, coefficient change along ring maps preserving the unit with
identity and composition laws, and the identification with the lattice group algebra when
`u=1` or `Λ=0`, including evaluation and coefficient extraction. ScatteringDiagrams §4.3's
parameter `q_sc` is `u`; quantum cluster notation takes `u=v` and `q_cl=v²`, so
`X_i X_j=v^{2Λ_ij}X_j X_i` in the same based quantum torus.

For a basis of `L`, construct the quantum polynomial and mixed Laurent subalgebras by
support, with monomial bases and localization at selected monomials. Universal
property: for `S` a subset of the basis, an `R`-algebra `A` and `U_i∈A` with
`U_iU_j=u^{2Λ_ij}U_jU_i` and `U_s` a unit for `s∈S`, there is a unique `R`-algebra map
from the subalgebra with exponents `a_i≥0` (`i∉S`) sending `X_i` to `U_i`. For any total
order on the basis it sends `X^a` to `u^{-Σ_{i<j}a_i a_j Λ_ij}∏_iU_i^{a_i}`, the product
taken in that order; the result is independent of the order.

Derive
[`UniqueSums`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/UniqueProds/Basic.html#UniqueSums)
for the finite free lattice L and prove `T(R,u,Λ)` is a domain when R is a domain.
Over a field it
satisfies the left and right Ore conditions; prove them (they may then be registered as
instances) rather than assuming them as instance arguments.
Construct its skew field of fractions with `OreLocalization`, using
`OreLocalization.oreDiv_eq_iff`, `OreLocalization.numeratorHom_inj`, the existing
division-ring instance and `OreLocalization.universalHom` with its uniqueness
theorem. Prove the quantum-torus Ore hypotheses and the coefficient, lattice and
chart comparisons needed below; for a domain `R`, coefficient change embeds `T(R,u,Λ)` in
the skew field of fractions of `T(FractionRing R,u,Λ)`. A quantum chart is an injective
`R`-algebra map of `T(R,u,Λ)` into a division ring; it is generating when its image
generates that ring. Generating charts determine their ambient division ring up to
unique isomorphism. The Laurent theorems of Layers 1–2 use only injectivity of charts.

**0.5 One-exchange algebra.** In a division ring, let `C` be a subring, write `C⟨…⟩` for
the subring generated by `C` and the listed elements, `C[p^{±1}]=C⟨p,p⁻¹⟩` and `C[p]=C⟨p⟩`
for nonzero `p`, and let `x≠0` normalize `C` (`xCx⁻¹=C`) with powers left linearly
independent over `C`. Coefficients stay on the left throughout. For a nonzero `E∈C`
normalizing `C`, with `σ(c)=xcx⁻¹`, `P_0=1` and `P_{r+1}=P_rσ^{-r}(E)`, the element
`y=Ex⁻¹` satisfies:
- `y` normalizes `C`, its powers are left independent over `C`, and `y^r=P_r x^{-r}`;
- `Σ_m c_m x^m∈C[y^{±1}]` if and only if `c_{-r}∈C P_r` for all `r>0`;
- `C[x^{±1}]∩C[y^{±1}]=C⟨x,y⟩`, with unique normal forms `c_0+Σ_{r>0}(c_r x^r+c'_r y^r)`.
These criteria and normal forms are proved; membership in the intersection is not
assumed. In the commutative case this is `D[x^{±1}]∩D[(E/x)^{±1}]=D[x,E/x]`; U1 and Q1
are instances. Also prove, for `z` normalizing `C`:
- *patching*: for a subring H of any ring, finite `a_l,u_l∈H` with
  `Σ_l a_lu_l=1` and `f a_l∈H` give `f∈H`. Give the left-sided form through
  the opposite ring. The two-denominator form with `a_1=a^r`, `a_2=b^s` and
  the comaximal-localization intersection theorem are instances;
- *unit constant terms*: the elements `c(1+zw)` with `c∈Cˣ`, `w∈C[z]` are closed under
  products and under conjugation by any `g` normalizing `C` with `gzg⁻¹∈zC`, and each
  has a right inverse modulo `z^sC[z]` for every `s`.
U2b and Q2's interacting intersection are instances.

Prove a seed-free change-of-chart theorem for R-algebra maps
`χ:T(R,u,Λ)→D` and `χ':T(R,u,Λ')→D` on `ℤ^I`. Let k be a coordinate;
the maps agree off k and the forms agree on the other-coordinate lattice. Assume the first map is injective, its k-coordinate is x, and the
second sends its k-coordinate to `y=Ex⁻¹` with nonzero E in the common
other-coordinate ring C, normalizing C. Then the second map is injective by the
one-variable independence above. The division subrings generated by the two
charts are equal. Apply this theorem when constructing a mutated chart, rather
than putting faithfulness of that chart among the seed's inputs.

**0.6 Support and central divisibility.** For a twisted lattice algebra over a domain
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
Neither a Bézout hypothesis nor a noncommutative UFD is used.

Prove the shared scalar-divisibility statement for a flat module M over a
commutative ring R: `(p)∩(q)=(pq)` implies `pM∩qM=(pq)M`, where `pM` is the
image of scalar multiplication by p. Give the elementwise and submodule forms,
and apply it to flat R-algebras, including noncommutative algebras with their
central structure maps. The free-over-center argument above is an instance.


**0.7 Finite polynomial replacement.** Let D be a division ring, C a subring,
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
`φ=m₁n₁⁻¹`, `n₀=n₁`, `m₀=m₁` gives binary replacement; use it for U2c and
ordinary quantum Q2.

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

**Checks for §§0.4–0.7.**
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

## Layer 1: classical and quantum seeds and mutation

**1.1 Exchange matrices.** A symmetrizer of `B : Matrix K K ℤ` is `s : K → ℤ` with
`s_i>0` and `s_i b_ij = -s_j b_ji`. An exchange matrix is `B` with a symmetrizer as
data; `μ_k` acts on `B` alone. Write `[a]_+ = max(a,0)`. For `k∈K`, define

$$
b'_{ij}=\begin{cases}-b_{ij}&i=k\text{ or }j=k,\\
b_{ij}+[b_{ik}]_+[b_{kj}]_+-[-b_{ik}]_+[-b_{kj}]_+&\text{otherwise}.\end{cases}
$$

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

Use the general column API for matrices over a field: independence of the
columns is equivalent to full column rank when K is finite. Prove that
rescaling columns by nonzero scalars preserves independence, and use the
invertible factors E and F to preserve rational column independence under
mutation. For divisible integral columns, dividing each column by a positive
integer preserves this independence.

**1.2 Seeds and their realizations.** Fix finite `K`, a coefficient semifield `P` and a
field `F` with `Algebra ℤ[P] F`; `P` acts on `F` through `P →* ℤ[P]ˣ`. A `Y`-seed is
`(y,B)`, `y : K → P`, `B` an exchange matrix. A seed in `F` is a `Y`-seed with a Laurent
chart `L(ℤ[P],K) → F` whose image generates `F` as a field; `x_i` is the image of `X_i`.
Construct the inverse equivalences with FZ tuples `(x,y,B)`, `x` a transcendence basis
over `ℤ[P]` generating `F` with `ℤ[P]`. Mutation `μ_k` is `B ↦ μ_kB`, `x'_i=x_i`
(`i≠k`), and

$$
x'_k=\frac{y_k\prod_i x_i^{[b_{ik}]_+}+\prod_i x_i^{[-b_{ik}]_+}}
{(y_k\oplus1)x_k},\qquad
y'_j=\begin{cases}y_k^{-1}&j=k,\\
y_jy_k^{[b_{kj}]_+}(y_k\oplus1)^{-b_{kj}}&j\ne k.\end{cases}
$$

Prove the numerator nonzero, `x'` a transcendence basis generating `F`, `μ_k`
involutive on seeds and `Y`-seeds, and that forgetting the chart commutes with `μ_k`.
Reindexing along `e : K ≃ K'` acts on `y`, `B` and the chart together; prove
`μ_{e k}(e·Σ)=e·μ_kΣ`. Seeds `Σ`, `e·Σ` with `e : Equiv.Perm K` are equivalent.

Also construct coefficient realizations over a domain C: a group homomorphism
`φ:P→Cˣ`, the same Y-seed `(y,B)`, and a generating chart `L(C,K)→F`.
Apply φ to the group elements in the normalized exchange formula; its
normalizer is `φ(y_k⊕1)`, not `φ(y_k)+1`. Require
`φ(y_k)+1≠0` only when the mutable column `b_{•k}` is zero.
Prove this initial condition is mutation invariant: a zero column stays zero,
its coefficient only inverts, and all other exchange numerators have two
distinct mutable monomials with unit coefficients. Construct mutation,
involutivity and word transport over C. L8 compares these realizations with
the universal integral pattern, including noninjective coefficient maps.

**1.3 Patterns and algebras.** For involutions `μ_k` (`k∈K`) of any type, a word
`w : List K` acts by `μ_{[k₁,…,k_m]}=μ_{k_m}∘⋯∘μ_{k₁}`; prove the concatenation law,
cancellation of adjacent equal letters, and inversion by the reversed word.
For involutive actions μ on V and ν on W and a map `f:V→W` satisfying
`f(μ_k(s))=ν_k(f(s))`, prove `f(μ_w(s))=ν_w(f(s))` for every word, with identity
and composition laws. Use this single transport theorem for matrices,
`Y`-seeds, polynomial frames, quantum seeds and classical realizations;
`μ_wΣ₀` is reachable from `Σ₀`.
Reduced words, adjacent when one extends the other by a letter, form a
`SimpleGraph.IsTree` with one edge of each label at each vertex (two vertices if
`|K|=1`, one if `K` is empty). The exchange graph has the reachable seeds modulo
equivalence as vertices, distinct classes adjacent when related by one mutation. Both
graphs are comparisons; patterns are defined by words.

For a subring `R⊆ℤ[P]`, `L_{R,t}` is the range of `t`'s chart on `L(R,K)`, `A_R` the
`R`-subalgebra of `F` generated by all reachable `x_{i;t}`, and `U_R=⨅_t L_{R,t}` over
reachable `t`; `A,U,L_t` mean `R=ℤ[P]`. Cluster monomials are `∏_i x_{i;t}^{a_i}`,
`a : K → ℕ`; their multiples by `P` form a separate set. Prove these objects unchanged
under replacing `Σ₀` by a reachable or reindexed seed, and transported by `F ≃ₐ[ℤ[P]] F'`.
For `R⊆R'` construct the inclusions of `L_{R,t}`, `A_R`, `U_R`. `A_R≤U_R` is a separate
theorem for each `R`, in no definition and not deduced from the exchange coefficients
lying in `R`.
For §1.2's domain realizations, repeat these constructions for subrings
`R⊆C`, writing `A_C`, `U_C` for the full coefficient ring and transporting
them along ambient C-algebra isomorphisms.

**1.4 Geometric coefficients.** For any `J` and `P=Trop(J)`, construct inverse
bijections between `Y`-seeds `(y,B)` and extended matrices `B̃` with principal block
`B` and finitely supported frozen columns `K→(J→₀ℤ)`, by
`y_k=∏_j z_j^{b_jk}`, and between their seeds in `F`. Products use finite supports.
For finite J this is §1.1's extended-matrix carrier. Prove that they
intertwine `μ_k(y,B)` with `μ_kB̃` and give the exchange relation
`x_kx'_k=∏_{i∈I}a_i^{[b_ik]_+}+∏_{i∈I}a_i^{[-b_ik]_+}`, `a_i=x_i` (`i∈K`), `a_i=z_i`
(`i∈J`). Apply §1.3 to each `R_S` (§0.3). For `S⊆T⊆J`, prove that `A_{R_T}` is the
localization of `A_{R_S}` at the `z_t`, `t∈T\S`; no such statement for `U` is
asserted. Every comparison of `L_{R,t}`, `A_R`, `U_R` keeps `R` explicit.

For a domain C, a geometric seed over C in a field F is B̃ with a generating
chart `L(C[Trop(J)],K)→F`, subject to
`(2:C)≠0` or every mutable column of the full extended matrix being nonzero.
Prove that this is exactly the nonvanishing condition for its binary exchanges
and is mutation invariant. Use distinct monomial support for nonzero columns;
a zero column has exchange numerator 2. Construct the new generating chart
and involutivity, using §1.2's coefficient realization with base ring `C_J`.
Define `L_{C_S,t}`, `A_{C_S}`, `U_{C_S}` using §0.3; write `𝕜_S` when C is a
field 𝕜. All fields of characteristic other than 2 are included, and fields
of characteristic 2 are included when the extended columns are nonzero.

For finite K and arbitrary J, let J₀ be the finite union of initial frozen
column supports. Prove that rows outside J₀ stay zero under every word.
Reduce the finite-rank constructions to `K⊔J₀`; adjoining the remaining
frozen coordinates is a free mixed Laurent extension with coefficientwise
expansion maps. No unrestricted base-change/intersection interchange is used.

**Checks.** For `K` empty, `A=U=⊥`. For `K=Unit`, `B=0`: the one-element `P` gives
`xx'=2`; `P=Trop(Unit)`, `y=z` gives `xx'=1+z`. For `K=Unit`, `J=Fin 2`, `B̃` the column
`(0,1,1)`: `xx'=1+z_0z_1`.

**1.5 Column compatibility, polynomial frames and quantum seeds.** Let B̃ be
§1.1's extended matrix with positive symmetrizer d, and let Λ be an alternating
integer form on `ℤ^I`. For `w:K→ℤ`, define column compatibility by
`B̃ᵀΛ=(diag(w) 0)` in the mutable/frozen presentation, or entrywise by
`Σ_i b_ik Λ_il=w_k` when `l=row k` and zero otherwise. The weights w may be
zero or negative. Prove `w_i b_ij=−w_j b_ji`. Matrix and form mutation are
`B̃'=E_ε B̃ F_ε`, `Λ'=E_εᵀΛE_ε`. Prove independence from ε, preservation of
alternation and column compatibility with the same w, and involutivity.
The positive symmetrizer d remains the matrix's symmetrizer throughout.

For a commutative ring R, a unit `u∈Rˣ` and a division R-algebra D, define a
based exchange frame by B̃, Λ, w, column
compatibility and an injective `R`-algebra chart `T(R,u,Λ)→D`. Its normalized
monomials M and coordinate units come from this chart. Prove extensionality,
reindexing along equivalences commuting with row, and transport along injective
ambient R-algebra maps. Construct coefficient and lattice maps on the tori;
transport a frame when a compatible faithful target realization is supplied.
Chart generation of the entire ambient division ring is not required.

**P1 — polynomial mutation.** Add central scalar polynomials
`H_k(T)=Σ_{l=0}^{r_k}h_{k,l}T^l∈R[T]`, monic with constant coefficient one,
`r_k>0`, such that `r_k` divides every entry of column k. Put
`β_k=b_{•k}/r_k`. Require `H_k(1)≠0` whenever column k is zero.
Prove that a column is zero after any mutation if and only if the same
column was zero before it; for these columns reversal preserves `H_k(1)`.
Define mutation by the matrix and form mutations above,
`H'_k(T)=T^{r_k}H_k(T⁻¹)`, `H'_j=H_j` for `j≠k`, and

$$
X'_k=\sum_{l=0}^{r_k}h_{k,l}
 M(-e_k+l[\beta_k]_++(r_k-l)[-\beta_k]_+),
\qquad X'_a=X_a\quad(a\ne\operatorname{row}(k)).
$$

Prove preservation of column divisibility and degrees, nonvanishing of the
exchange sum, quasi-commutation for Λ', faithfulness of the new chart using
§0.5's change-of-chart theorem, equality of the generated division subrings,
and involutivity including coefficient reversal. Mutated-chart faithfulness
is an output. Establish reindexing, ambient transport and whole-word laws.
On the opposite algebra use `B̃↦−B̃`, `Λ↦−Λ` and `H_j↦H_j^rev` in every direction;
prove preservation of w and commutation with mutation. Coefficient transport
maps H coefficientwise and sends the scalar unit u to its image.
For a nonzero column the exchange monomials are distinct; for a zero column
the formula is `X'_k=H_k(1)X_k⁻¹`. These prove nonvanishing without a rank
assumption. Coefficient changes yielding a new frame must retain this
zero-column condition; injectivity of the scalar map is not otherwise needed
for finite representatives.

Define binary mutation by the degree-one instance `H_k=1+T`. Prove its displayed
two-monomial formula and derive its changed-chart, involutivity and whole-word
laws from P1. Construct comparison maps with the independently defined
classical mutation formulas and the following ordinary quantum seed sector.

An ordinary compatible pair has `w=d`; this is the positive compatibility
condition `B̃ᵀΛ=(D_d 0)`. Derive rational column independence from it, rather
than adding independence as a new quantum seed hypothesis. More generally,
a positive diagonal in this equation symmetrizes the mutable block and forces
full column rank. An ordinary quantum seed is such a pair with a faithful
`T(Z_v,v,Λ)→D` chart. It is the `R=Z_v`, `u=v`, `w=d`, `H_k=1+T` sector of P1,
so its mutation satisfies
`X'_k=M(-e_k+[b_{•k}]_+)+M(-e_k+[-b_{•k}]_+)` with no separate chart construction.

Construct the bijection between faithful quantum charts and maps
`M:ℤ^I→D` with `M(0)=1`, `M(a)M(b)=v^{Λ(a,b)}M(a+b)` and
`Z_v`-independent values. For a fixed initial based torus and its fraction
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

**1.6 Algebras and realization interfaces.** For a polynomial frame over R,
define `A_{R,u,S}` as the R-subalgebra generated by all reachable mutable
coordinates, all initial frozen coordinates and the inverses of those indexed
by `S⊆J`. Define `T_t` as the range of the full based-torus chart, and
`U_{R,u}=⋂_t T_t`. Thus every `T_t` inverts all frozen coordinates, while A
inverts only S. Give re-rooting, reindexing and ambient transport laws and
the degree-one comparisons. No Laurent property is part of these definitions.

For an ordinary quantum seed in D, write `A_{v,S}` and `U_v` for these
algebras, with reachable variables `X_{k;t}` and frozen `X_j=M(e_j)`.
Frozen variables need not be central. Quantum cluster monomials are `M_t(a)`, the image
of `X^a` under `t`'s chart, with `a_k≥0` (`k∈K`), `a_j≥0` (`j∈J∖S`). Prove these objects
invariant under re-rooting and reindexing, and transport them along `Z_v`-algebra
isomorphisms `D≃D'`.

A polynomial seed realization in an R-algebra A is an injective R-algebra map
to A from the quantum polynomial subalgebra of `T(R,u,Λ)` (§0.4), equivalently
`Y : I → A` with `Y_iY_j=u^{2Λ_ij}Y_jY_i` and R-independent normalized monomials
`Y^a`, `a∈ℕ^I`. Prove generator extensionality and transport along injective maps
`A→A'`. For injective `ι : A → D` into a division ring, construct
the induced quantum chart; a mutation at `k` in `A` is `Y'_k∈A` with `ι(Y'_k)=X'_k`,
which the mutated seed in `D` does not provide. If `ι(A)` contains every `X_{k;t}` of
the induced seed (all reachable `t`), construct the injective `A_{R,u,∅}→A` inverting
`ι`; membership of the one-step variables `X'_k` alone is not assumed to imply this.

## Layer 2: shared Laurent proof and classical specialization

There are two public statements, with one proof chain. For a compatible quantum
seed, every reachable variable lies in every integral quantum chart `T_t`.
For a classical seed over an arbitrary coefficient semifield P, every reachable
variable lies in every `L_{ℤ[P],t}`, with no full-rank or coprimality premise on
that seed. Both use §1.5's polynomial construction and the common theorem below: ordinary quantum
seeds have `R=Z_v`, `u=v`, `w=d`, while full-rank classical seeds have `u=1`,
`Λ=0`, `w=0`. The classical statement for arbitrary P uses a principal lift and
normalized coefficient specialization. The `v=1` theorem separately compares
the quantum and classical representatives. Neither statement uses positivity
of Laurent coefficients, sign-coherence or the classical structural results of Layer 4.

| Milestone | Output | Uses |
|---|---|---|
| P1 | Polynomial mutation and faithful changed charts | §§0.4–0.5, §1.1, §1.5 |
| Q1 | One-exchange normal forms, central products and divisibility over R | §0.5, P1 |
| P2 / Q2 | Polynomial two-direction intersections and constructed finite replacement | Q1, §§0.6–0.7; independence for commuting pairs |
| Q3 | Full-rank upper-bound invariance; rank-free Laurent expansions by a central lift | Q2, shared intersection/word API |
| L5 | Classical principal Laurentness at unit parameter; quantum comparison via `v=1` | Common Q3, principal full-rank seed; quantum Q3 for comparison |
| L6 | Frozen orders, polynomial expansions and principal degrees | L5, support/positive evaluation |
| L7 | Normalized specialization and separation | Seed identities, L5–L6 |
| L8 | Arbitrary-semifield Laurentness and expansion maps | L7 |
| Q4 | Bar, gradings, frozen localization and algebra realizations | Q1–Q3, §1.6 |

### 2.1 Common polynomial upper bounds and Laurent expansions

Use a polynomial frame from P1 over a commutative ring R, with arbitrary unit u
and form weights w. Faithfulness makes R a domain. Q1 and interacting Q2
use only this data; commuting Q2 also uses independence of the two columns.
No scalar factoriality or infinite-order condition on u is required.
Write `α_k=−e_k+[−b_{•k}]_+`. Define the integer
`ν_k=Λ(β_k,e_k)` and prove `r_kν_k=w_k`, hence `r_k∣w_k`. No nonvanishing
or positivity of ν or w is required. For an ordinary quantum seed this is
`ν_k=d_k/r_k`; for the zero-form classical frame it is zero.

**Q1 — one exchange.** Let C be the image of the torus on the coordinates other
than k. Construct §0.5's exchange data with `x=X_k`, `y=X'_k`, `E=X'_kX_k∈C`.
Prove

$$
X'_k=H_k(u^{\nu_k}M(\beta_k))M(\alpha_k),\qquad
P_{k,n}=\prod_{h=1}^n H_k(u^{(2h-1)\nu_k}M(\beta_k)),\qquad
(X'_k)^n=P_{k,n}M(\alpha_k)^n.
$$

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

$$
(T_s\cap T_{\mu_i(s)})\cap(T_s\cap T_{\mu_j(s)})
=H_{ij}=C\langle X_i,X'_i,X_j,X''_j\rangle,
$$

where `X''_j` is the j-coordinate of `μ_jμ_i(s)`.

For this equality in the commuting case `b_ij=0`, assume columns i,j are
rationally independent and prove `X''_j=X'_j`. The divided columns β_i,β_j
are independent and belong to the pair lattice of exponents vanishing at i,j;
they pair trivially with this lattice. Use the central sublattice
`N=ℤβ_i⊕ℤβ_j`, so `R[N]≃R[S^{±1},T^{±1}]`. Represent each required
`P_{i,n}`, `P_{j,m}` as a scalar polynomial with constant coefficient one
and unit leading coefficient on its respective cyclic direction.
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
term with `n_l=0` has monomial-unit coefficient n₀; its mutated term is
`(x*)^Nm₀`. Put `φ=m₀n₀⁻¹∈C` and let g_l be the z-constant coefficient of
`(x*)^{n_l}x^{n_l}`. Prove all of §0.7's finite premises, including
`(x*)^{n_l}x^{n_l}−g_l∈zC[z]` and
`d_l=g_l x^{−n_l}φx^{n_l}c_l`, from matrix mutation, column compatibility
and the actual coefficients of H. Construct them at both s and μ_i(s), then
apply finite replacement and §0.5's unit-constant-term patching. Negative
interaction is transported through P1's opposite algebra and coefficient
reversal. The binary replacement is the degree-one instance. No local
comparison or coprimality conclusion is a field of the seed.

**Q3 — the common global theorem.** First prove the order-theoretic statement.
For a complete lattice A, any index set K, involutions μ_k on V and `L:V→A`,
put `UB(s)=L_s∧⋀_k L_{μ_k(s)}`. Local inclusions
`L_s∧L_{μ_i(s)}∧L_{μ_j(s)}≤L_{μ_jμ_i(s)}` for `i≠j` imply invariance of UB,
and hence `UB(s)=⋀_{ω:List K}L_{μ_ω(s)}`. This statement needs no finite-rank
or ring hypothesis.

For subrings T_s of a ring D and generators `g_{s,a}` indexed by an arbitrary
set I, prove that invariance of UB, `g_{s,a}∈T_s` and
`g_{μ_k(s),a}∈T_s` imply `g_{μ_ω(s),a}∈T_{μ_p(s)}` for all words p,ω and
all a. Apply this theorem to P1 with full column rank, with Q2 giving the three-chart equalities
and the finite polynomial formula giving one-step membership. The resulting
common Laurent theorem is

$$
\forall p,\omega\in\operatorname{List}(K),\ \forall a\in I,\qquad
X_{a;\mu_\omega(s)}\in T_{\mu_p(s)}.
$$

Construct the unique finite R-linear representative in each chart, proving
evaluation, re-rooting, reindexing and ambient transport laws. Derive
`A_{R,u,S}⊆U_{R,u}=UB(s)` for every frozen inverse set S. These upper-chart
rings invert all frozen coordinates; frozen coordinates and their inverses are
unchanged along mutation words. Use the same Q1–Q3 for all polynomial
degrees, including the binary, ordinary quantum and unit-parameter classical
instances; a binary global theorem is not an input to the polynomial proof.

**Rank-free Laurent corollary.** For every P1 frame, add K central frozen
coordinates t with
`B̃_aug=(B̃;D_r)`, `Λ_aug=Λ⊕0`, `D_r=diag(r_k)`, and the same w, degrees
and polynomials. Prove compatibility, column divisibility and full column
rank; realize this lifted frame in the canonical fraction division ring of
its torus (§0.4). After every mutation, the added directions remain central,
the original blocks are the original mutated matrix and form, and specialization
`t_k↦1` on finite Laurent representatives recovers the original coordinate word.
Prove the last assertion inductively from the ordered exchange identities:
the already identified current coordinate is nonzero by P1, so it can be
cancelled in the original division ring. No map of ambient fraction rings is used.
Thus every P1 frame has unique finite Laurent expansions and `A_{R,u,S}⊆U_{R,u}`.
This lift does not assert `U=UB` for a rank-deficient frame. More generally,
the abstract upper-bound theorem applies whenever the required simultaneous
divisibility for commuting directions is proved at every reachable seed.

**Checks.** At `u=1`, zero Λ and w, verify the classical exchange formula
and all-word statement over ℤ using independent initial coordinates. In rank
two use `B=((0,3),(−3,0))`, matrix symmetrizer `(1,1)`, degrees `(3,3)` and
`H_1=H_2=1+2T+T³`. This zero-form case must not require degrees to divide
the matrix symmetrizer; prove that the same matrix with this symmetrizer has
no integral positive compatible form. For the ordinary quantum rank-one pair `Λ=((0,−1),(1,0))`, `B̃=(0,1)ᵀ`, check
`X_1X'_1=1+v⁻¹X_2`, `X'_1X_1=1+vX_2` and
`(X'_1)²=(1+vX_2)(1+v³X_2)X_1⁻²` by degree one of the displayed products.
For the principal pair of the zero matrix on `Fin 2` with symmetrizer `(1,1)`,
check commuting Q2: `H_12` contains `X'_1X'_2` and excludes
`X_1⁻¹X_2⁻¹(1+v⁻¹X_3)`. For the principal pairs of `B=±((0,b),(−c,0))`,
`(b,c)=(1,1),(1,2),(2,1),(1,3),(3,1)`, check the constructed replacement
premises. For empty K and `J=Fin 1`, compute `A_{v,∅}=Z_v[X_1]` and
`A_{v,J}=U_v=Z_v[X_1^{±1}]`.
For `B=0` in rank two over ℤ, `H_1=H_2=1+T`, the rank-free Laurent
corollary applies, but `2/(xy)` lies in the initial UB and not in the chart
`ℤ[(2/x)^{±1},(2/y)^{±1}]`; hence `UB≠U`. Over `𝔽₂` the same zero-column
data fail P1, whereas a principal frozen block makes both exchanges nonzero.
For `H=1−2T+T²`, a zero column is excluded even in characteristic zero.
The matrix `((0,1,−1),(−1,0,1),(1,−1,0))` has pairwise independent columns,
but after mutation at 1 its commuting columns 2 and 3 are opposite.
Thus initial pairwise independence cannot replace the full-rank sufficient
condition for upper-bound invariance without an orbitwise argument.
Sources for the ordinary quantum sector: BZ §5, Lemmas 5.4–5.6,
Proposition 5.7, Lemma 5.8 and Corollary 5.2. Section 2.6 states the precise
polynomial source models and their relation to this common construction.

### 2.2 Classical instances, quantum comparison and frozen orders

**L5 — direct classical principal Laurentness.** For any admitted finite
classical geometric seed, construct a faithful frame over its original scalar
ring C with `u=1`, `Λ=0`, `w=0` and its original positive matrix symmetrizer.
Use an injective coefficient embedding `C→𝕜` and initial coordinates
algebraically independent over the field 𝕜 to prove faithfulness of the chart.
The embeddings `C→𝕜→F` agree with the given scalar map. No positive compatible
form is needed. Prove equality of every coordinate word and fully inverted
chart ring with §1.4's `L_{C_J,t}`, using §1.3's word transport. The rank-free
Q3 corollary gives Laurentness; full column rank additionally gives `U=UB`.
Identify `T(C,1,Λ)` with `C[ℤ^I]` basiswise. In that fixed Laurent ring, prove
that the unique representatives depend only on the coefficients, matrix,
exchange polynomials and initial values; coordinate words and chart rings
are also independent of the chosen unit-parameter form realization.

For any exchange matrix B₀ on K, its principal extension `(B₀;Id)` has
independent columns. Apply common Q3 to the zero-form frame over ℤ. Construct
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
For an ordinary quantum seed and an independently defined classical geometric
pattern with the same initial matrix, let `ε:ℤ[ℤ^I]→F` evaluate the initial
classical coordinates in a field F. If exchanged classical coordinates remain
nonzero along all mutation words, prove `ε(sp(f_{a,ω}))=x_{a;ω}` for every
word ω and coordinate a, where f is the unique integral quantum Laurent
representative supplied by Q3. Derive this nonvanishing from algebraic
independence of the initial classical coordinates. The comparison follows
mutation words and uses finite Laurent representatives, without extending sp
to the ambient division ring or taking specialization of chart intersections.

Compare §1.5's principal quantum pair with the zero-form principal pattern
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

For every integral geometric pattern in `F` (§1.4, coefficient group `Trop(J)` over `ℤ`), identify `F` with
`FractionRing (MvPolynomial (K⊔J) ℤ)` by the isomorphism of §0.2 (with L5's regrouping)
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

$$
F_{k;t'}F_{k;t}
=u^{[c_{k;t}]_+}\prod_i F_{i;t}^{[b_{ik;t}]_+}
+u^{[-c_{k;t}]_+}\prod_i F_{i;t}^{[-b_{ik;t}]_+},
\qquad F_{j;t'}=F_{j;t}\ (j\ne k).
$$

Deduce that `F_{k;t}` divides the right side in `ℤ[u_i]`; divisibility is not a premise of
the construction of `F`. Grade `ℤ[u_i^{±1}][x_i^{±1}]` by `ℤ^K` with `deg x_i=e_i`,
`deg u_j=-B₀e_j`. Define `G_t` by `G₀=Id` and, for `t'=μ_k(t)`,
`g'_k=-g_k+G_t[b_{•k;t}]_+-B₀[c_{k;t}]_+`, other columns unchanged, where `b_{•k;t}` is
the `k`th column of the mutable block `B_t`. Prove `G_tB_t=B₀C_t`, that `X_{j;t}` is
homogeneous of degree the `j`th column `g_{j;t}` of `G_t` (its `g`-vector), and
`X_{j;t}(x,u)=x^{g_{j;t}}F_{j;t}(û)` with `û_j=u_j∏_i x_i^{(B₀)_ij}`. These grading
results consume L5–L6a and are not inputs to the `X`-form of L7b's separation theorem or
to L8.

### 2.3 Normalized specialization and the general Laurent theorem

**L7a — domains of evaluation.** For a coefficient semifield `P` and any `K`, construct
`Pos(P,K)`, the ratios `a/b` of nonzero `a,b∈ℕ[P][x_i:i∈K]` in `FractionRing L(ℤ[P],K)`,
as a coefficient semifield with `⊕=+`; prove closure and nonvanishing. It contains the
images of `P` and all monomials `x^a`, `a:K→₀ℤ`; transport it along Laurent charts into
`F`. For a field `F` and a coefficient semifield `𝒮⊆Fˣ` with `⊕=+`, define
subtraction-free evaluation of `Qsf(ι)` at `a:ι→𝒮` followed by inclusion into `F`,
distinct from semifield evaluation into `P`. For `y:K→P` construct the group homomorphism
`Multiplicative (K→₀ℤ)→P`, `u_i↦y_i`, and the ring map `ℤ[u_i^{±1}]→ℤ[P]`; neither is a
semifield map from `Trop(K)`.

Prove *positive_rational_laurent_specialization*: if `φ∈Qsf(ι)` lies in `L(ℤ,ι)`, then
for every `a:ι→𝒮` the Laurent evaluation of `φ` at `a` equals its subtraction-free
evaluation and is nonzero. Injectivity of the substitution and a ring map from the
rational-function field are not assumed. The case `𝒮=Pos(P,K)`, `a_i=y_i` gives
substitution `u_i↦y_i`; L6b's comparison is the case `𝒮=Qsf(K)`.

**L7b — the normalization identity.** Fix `B₀` on `K`; let `Y_{j;t}∈Qsf(K)` be the
`Y`-pattern with initial coefficients `u`. Prove that for every `P` and `y:K→P`,
`Y_{j;t}|_P(y)` is the `Y`-pattern of `(y,B₀)` in `P`. For a seed pattern in `F` with
initial `(x,y,B₀)` put `ŷ_{j;t}=y_{j;t}∏_i x_{i;t}^{b_{ij;t}}`; prove, from seed
identities only, that `ŷ` obeys §1.2's `Y`-mutation with `⊕` replaced by `+`, and that
`ŷ_{j;t}` is the evaluation of `Y_{j;t}` at `(ŷ_{i;0})_i` in `Pos(P,K)`.

Let `h_{k;t}∈ℤ^K` be the exponent vector of `(1⊕Y_{k;t})|_{Trop(K)}(u)∈Trop(K)`. With
`û_j=u_j∏_i x_i^{(B₀)_ij}`, prove in `Qsf(K⊔K)` and `Qsf(K)`, for the subtraction-free
representatives of `X` and `F`:

$$
X_{k;t'}X_{k;t}=
\frac{1+Y_{k;t}(\widehat u)}{u^{h_{k;t}}}
\prod_i X_{i;t}^{[-b_{ik;t}]_+},\qquad
F_{k;t'}F_{k;t}=
\frac{1+Y_{k;t}(u)}{u^{h_{k;t}}}
\prod_i F_{i;t}^{[-b_{ik;t}]_+}.
$$

For a seed pattern in `F` over any `P` with initial `(x,y,B₀)`, let `N_{j;t}∈F` be the
Laurent evaluation of `X_{j;t}` at `x_i↦x_i`, `u_i↦y_i`, and `D_{j;t}=F_{j;t}|_P(y)∈P`.
Prove the separation theorem `x_{j;t}=N_{j;t}/D_{j;t}` for every reachable `t` and `j∈K`,
without a Laurent theorem for this pattern, positivity of `F_{j;t}` or signs of
`c`-vectors. With L6b's grading identity, prove

$$
x_{j;t}=x^{g_{j;t}}\,
\frac{F_{j;t}|_F(\widehat y_1,\ldots,\widehat y_n)}
{F_{j;t}|_P(y_1,\ldots,y_n)}.
$$

**L8 — public theorem and its maps.** For every coefficient semifield `P` and seed `s` in
`F` over `ℤ[P]`, prove `x_{j;t}∈L_{ℤ[P],s}` for every reachable `t` and `j∈K`, from L5
and L7b. The expansion is §0.3's *exp*; prove that `exp_s(x_{j;t})` is `D_{j;t}⁻¹` times
the image of `X_{j;t}` under `u_i↦y_i`. Prove `x_{j;u}∈L_{ℤ[P],t}` for all reachable
`t,u`, hence `A⊆U`, and construct for each reachable `t` the injective algebra map
`A→ₐ[ℤ[P]]L(ℤ[P],K)` restricting `exp_t`, with coefficient extraction and finite support.
Prove that evaluation after expansion is the inclusion into `F`, and commutation with
reindexing, re-rooting and isomorphisms of ambient realizations.
For a coefficient-semifield homomorphism `φ:P→Q` and seeds `s` over `P` and `s_Q` over
`Q` with the same `B₀` and initial coefficients `φ∘y`, construct the ring homomorphism
`A_P→A_Q` restricting the composite of `exp_s`, the coefficient map `L(ℤ[φ],K)` and the
chart of `s_Q`. Prove that it sends each `x_{j;t}` to the corresponding variable of `s_Q`,
identity and composition laws, commutation with expansion in every reachable chart, and
independence of the chart used to construct it.

For a coefficient realization `φ:P→Cˣ` of §1.2, apply the ring map
`ℤ[P]→C` to these finite expansions. Prove inductively, using the already
constructed nonzero exchanges over C, that they represent the realized
variables in every chart. Thus `A_C⊆U_C`; construct the induced surjection
`C⊗_{ℤ[P]}A_P→A_C` and its coordinate, expansion and composition laws.
Neither a subtraction-free evaluation on C nor a map from the universal
rational-function field is used. Injectivity of this surjection is not asserted.

For geometric type, L8 and L6a give `exp_t(x_{j;u})∈ℤ[z_j][x_i^{±1}]` for reachable
`t,u`, hence `A_{R_S}⊆U_{R_S}` for every `S⊆J` (§0.3). For every domain C
satisfying §1.4's nonvanishing condition, prove that its expansions are the
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
The same reduction transports §6.2's integral positivity. Finite-type
classification, finite lattice geometry and the quantum core retain finite rank.

**Acceptance checks.** For L8 use the rank-two zero matrix, whose coefficient-free
exchange polynomials are both `2`, and `P=Multiplicative ℚ` (elements `w^a`, `a∈ℚ`, with
`w^a⊕w^b=w^{min(a,b)}`), a divisible, non-free group distinct from `Trop(J)`: for
`y=(w^{1/2},w^{-1/3})` the four clusters are `{x_1,x_2}`, `{x'_1,x_2}`, `{x_1,x'_2}`,
`{x'_1,x'_2}` with `x'_1=(1+w^{1/2})x_1⁻¹` and `x'_2=(1+w^{1/3})x_2⁻¹`. Rank zero
gives `A=U=ℤ[P]`; rank one gives `xx'=2` coefficient-free and `xx'=1+u` with
principal coefficients. For coefficient-free `A₂`, recover exactly
`x₁,x₂,(1+x₂)/x₁,(1+x₁+x₂)/(x₁x₂),(1+x₁)/x₂`. Normalization and separation: FZ IV, §3, §6.
Over `𝔽₂`, zero mutable B with principal frozen block Id has nonzero exchanges
`xx'=1+z`; removing that frozen block gives the forbidden `xx'=0`.
For `P=Trop(Unit)`, `φ(z)=−1` over ℚ and zero B, the coefficient-realization
condition fails. For an infinite frozen set with only one nonzero frozen row,
every variable depends on that row alone. For the locally finite `A_∞` path,
a finite mutation word reduces to its finite active vertices and their boundary.

### 2.4 Somos-4 as a consumer of the Laurent theorem

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
`0<a_n`. Prove that every `b:ℕ→ℚ` with `b₀=b₁=b₂=b₃=1` and
`b_{n+4}b_n=b_{n+1}b_{n+3}+b_{n+2}²` equals `a`, so each `b_n` is a positive integer.

Check `a₀,…,a₈=1,1,1,1,2,3,7,23,59`. Verify that the transitive proof dependencies of
the integrality theorem include L8, L5 and, through L5, Q3's upper-bound invariance.

### 2.5 Quantum structure and algebraic consumers

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
`Z_v` bar is the instance `σ(v)=v⁻¹`; finite order of u alone does not
supply a scalar involution.

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

Checks: for `K` empty and `J=Fin 1`, `Y_1=t` is a polynomial seed
realization in `A=Z_v[t]` inducing `A_{v,∅}≃A`, and `t` is not a unit of `A`.
Over `𝔽₇` with `u=2` and `Λ(e_1,e_2)=1`, the parameter has order 3 and the Q1 product
`(1+2T)(1+T)(1+4T)=1+T³` is nonzero. Mutation and Laurentness apply, but
there is no field automorphism sending 2 to its inverse 4, so the bar premise fails.
Sources: BZ §§3–6.


### 2.6 Polynomial algebras, principal lifts and classical comparisons

**P3 — polynomial sectors and their API.** Instantiate P1 and common Q1–Q3
with `R=Z_v`, `u=v`, `w=d`. An ordinary-compatible polynomial quantum seed
has no extra column-independence input: derive it from the positive
compatibility condition. Its scalar coefficients `h_{k,l}∈Z_v` are central,
with endpoint coefficients one; they need not be positive, reciprocal or
fixed by `v↦v⁻¹`. Derive `r_k∣d_k` from `r_kν_k=w_k`.

Construct the mutation and whole-word comparisons with the common frames,
the unique finite quantum expansions, `A_{v,S}⊆U_v=UB_v(s)`, and the degree-one
identification with ordinary quantum seeds and their algebras. Reindex
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

For the classical polynomial sector use the same P1 and Q3 at `u=1`,
`Λ=0`, `w=0` over any coefficient domain C. Construct the faithful frame
from independent coordinates, requiring `H_k(1)≠0` for zero columns.
Identify its mutation words with the commutative polynomial formula, including
coefficient reversal. Q3's central lift gives Laurentness without full rank;
full rank additionally gives `U=UB`. This direct classical statement has no
positive quantum form or quantum-specialization hypothesis. Generalized coefficient-
semifield separation remains outside the scope specified above.

For a mutable matrix B with positive symmetrizer d and degrees r dividing its
columns, suppose also `r_k∣d_k`. Construct the degree-compatible principal
extension with frozen block `D_r=diag(r_k)`. Put `D_d=diag(d_k)`,
`V=diag(d_k/r_k)` and

$$
\widetilde B_{\rm pr}=\begin{pmatrix}B\\D_r\end{pmatrix},\qquad
\Lambda_{\rm pr}=\begin{pmatrix}0&-V\\V&D_r^{-1}B^TV\end{pmatrix}.
$$

Here the lower-right block has entries `b_ji(d_j/r_j)/r_i`; the displayed
inverse denotes these exact integer divisions. Prove integrality, alternation,
`B̃_prᵀΛ_pr=(D_d 0)` and column divisibility. Apply P1 to the entire
extended seed along mutation words, retaining the degrees; the frozen block
is `D_r` at the initial seed and subsequently mutates. The classical
principal construction uses the same initial extended matrix with zero Λ and w.
Give both faithful canonical realizations using §0.4 and prove their degree-one
comparisons with the principal constructions of §1.5 and L5. Use this
construction when degrees exceed one; the frozen identity block does not
satisfy column divisibility for such degrees.

Construct `v=1` on unique finite quantum representatives and prove that they
evaluate to the classical polynomial coordinates with coefficients
`h_{k,l}(1)` after every word. Derive preservation of algebraic independence
for this classical exchange construction, so nonvanishing of its denominators
is a theorem for independent initial coordinates. Construct the surjection
`A_{v,S}→A_{R_S}` and the induced special-fiber map as in §2.2. This is a
comparison between the two instances of the common proof; it does not supply
a second proof of their Laurent property.

**Checks.** In the faithful generic torus `M(a,b)M(c,d)=v^{ad-bc}M(a+c,b+d)`,
take `B=((0,2),(-2,0))`, `r=(2,2)`, `s=(2,2)` and `H_1=H_2=1+T+T²`.
Put `x=M(1,0)`, `y=M(0,1)`,
`x*=M(-1,0)+M(-1,1)+M(-1,2)`,
`y*=M(0,-1)+M(1,-1)+M(2,-1)`, and
`y**=(1+v⁻¹x*+v⁻²(x*)²)y⁻¹`. Verify the seed formula for all three,
`xy≠yx`, the finite replacement premises and `y**∈Z_v⟨x*,y*,y⟩`.
Use the common frame over `Z_v[a,b]` for the symbolic-coefficient variants
`1+aT+T²`, `1+bT+T²`, with a,b independent central scalars. Check both signs
of B and the degree-one instance of Q2. Check rank zero and one
separately. Add a nonreciprocal cubic, for example `1+2T+T³`, and check that
mutation reverses its coefficients and mutation twice restores the seed. Its
all-word Laurent and classical specialization statements must use the public
theorems. A fixed nonreciprocal polynomial rule must fail the corresponding
negative control. Explicitly, at `u=1`, `B=((0,3),(−3,0))` and
`H=1+2T+T³`, mutation at the first coordinate gives
`x'=(y³+2y²+1)/x`. Reusing H unchanged after flipping the column gives
`x''=x(y³+2y+1)/(y³+2y²+1)`, which is not Laurent; reversal gives `x''=x`.
Compare every central coefficient and monomial under `v=1`.

Endpoint normalization is essential for this mutation rule. Over ℚ with
`B=((0,1),(−1,0))`, zero form, `H_1=1+T`, `H_2=1+2T`, the word `1,2,1`
gives `x'''=1/y+x(y+2)/(y(y+1))`, which is not Laurent. Thus even unit
endpoints cannot replace the two endpoints equal to 1 while merely reversing
the selected polynomial and leaving the others unchanged.

Sources: Bai–Chen–Ding–Xu, *Generalized quantum cluster algebras: the Laurent
phenomenon and upper bounds*, §2, Lemma 4.1, Propositions 4.2, 4.6–4.7 and
Theorem 4.9, for the reciprocal fixed-polynomial model. Nakanishi–Rupel,
[Companion cluster algebras to a generalized cluster algebra](https://arxiv.org/html/1504.06758),
§3, for reversal mutation without reciprocity in the classical theory. Rupel,
[Rank two non-commutative Laurent phenomenon and pseudo-positivity](https://www.numdam.org/item/10.5802/alco.81.pdf),
§5, Theorem 5.1 (pp. 1266–1267), treats nonreciprocal quantum exchange in rank two.
The nonreciprocal quantum construction and its local comparisons are targets
here, not claims attributed to BCDX. Their Theorem 3.1 proves Laurentness by
another argument; it does not supply the central-factor proof required here.
Their polynomial-center coprimality condition and the pair Laurent-ring
condition used here must be distinguished.

## Layer 3: lattice formalism and cluster varieties

Use ScatteringDiagrams §4.2's lattice datum and adapted basis for lattice seeds.

**3.1 Lattice data.** A `SkewLatticeDatum` consists of a finite free lattice `N`,
a saturated sublattice `N_uf`, a skew form `{−,−}:N×N→ℚ` and a finite-index
sublattice `N°`, with `{N_uf,N°}⊆ℤ` and `{N,N_uf∩N°}⊆ℤ`. A seed is an `AdaptedBasis`:
a basis `(e_i)_{i∈I}` of `N` whose subfamily over `I_uf⊆I` is a basis of `N_uf`, and
integers `d_i>0` with `(d_ie_i)` a basis of `N°`.
Put `M=Hom(N,ℤ)`, `M°=Hom(N°,ℤ)`, `f_i=d_i⁻¹e_i*` (dual to `(d_ie_i)`),
`ε_ij={e_i,e_j}d_j`; prove `ε_ij∈ℤ` unless `i,j∉I_uf`. For `k∈I_uf` define the positive
and negative mutations `μ_k^±`: `e'_k=-e_k`, `e'_i=e_i+[±ε_ik]_+e_k` (`i≠k`). Prove that
they give seeds of the same fixed data and are mutually inverse, and that `μ_k^+μ_k^+(s)`
is the image of `s` under the fixed-data automorphism `e_i↦e_i+ε_ike_k` (`i≠k`),
`e_k↦e_k`.

**3.2 Matrix and coefficient transport.** Let *latticeToFZ*`(s)` be the extended matrix
with rows `I`, columns `I_uf`, `B̃_ik=ε_ki={e_k,d_ie_i}=β(d_ie_i,e_k)`.
Prove that `s_k=L/d_k` (`k∈I_uf`), `L=lcm(d_k:k∈I_uf)`, is a symmetrizer of its
mutable block, that every
symmetrizer `(s_k)` of it has `s_kd_k` constant on each connected component (edges
`b_ij≠0`), and that *latticeToFZ* is invariant under fixed-data automorphisms, so
`latticeToFZ(μ_k^+μ_k^+(s))=latticeToFZ(s)`. For an extended matrix `B̃` with symmetrizer
`(s_k)` and `L=lcm(s_k)`, construct *fzToLattice* on `ℤ^I`: `d_k=L/s_k` (mutable `k`),
`d_j=1` (frozen `j`), `{e_k,e_i}=B̃_ik/d_i` for mutable `k`, skewness, and zero
frozen–frozen form. Prove 3.1 for it and, when `K` is nonempty, that its mutable
weights have gcd `1`; use `lcm ∅=1` for rank zero, with no gcd-one claim for the
empty family. For
fixed data and a positive integer `g` dividing every `d_i` (`i∈I`), put
`N°_g={n∈N:g n∈N°}`. Prove that `(N°,d_i,{−,−})↦(N°_g,d_i/g,g{−,−})`
again satisfies §3.1 and preserves `ε`; its basis of `N°_g` is `(d_i e_i/g)`.
Multiplication by g identifies `N°_g` with `N°`; construct the induced dual-lattice
isomorphism and prove that it carries the respective dual bases to one another.
Prove *latticeToFZ_fzToLattice*
(`latticeToFZ∘fzToLattice=id`), compatibility with reindexing, and, for every word `w`
of signed mutations of a fixed-data seed, `latticeToFZ(μ_w s)=μ_w(latticeToFZ s)` with
equal geometric coefficient patterns (§1.4). Prove that a seed identifies its fixed data
with the free model on `ℤ^I`; the frozen–frozen form and frozen weights are data of the
lattice seed, not functions of `B̃`.

**3.3 Torus mutation and gluing.** For a domain C let
`A_s=Spec C[M°]`, `X_s=Spec C[N]`, `A_i=z^{f_i}`, `X_i=z^{e_i}`, and
`p₁*:N_uf→M°`, `p₁*(n)={n,−}|_{N°}=β(−,n)|_{N°}`. With `s'=μ_k^+(s)`,
construct `μ_k` as rational maps
`A_s⇢A_{s'}`, `X_s⇢X_{s'}` and as isomorphisms `D(1+z^{p₁*(e_k)})≅D(1+z^{p₁*(e'_k)})`
and `D(1+X_k)≅D(1+X'_k)`, with pullbacks below. For A assume §1.4's
nonvanishing condition on *latticeToFZ*`(s)`; for X no characteristic
restriction is required. The displayed localized isomorphisms themselves
exist over any commutative ring, but may then have empty domains.

$$
\mu_k^*A'_k=A_k^{-1}\left(\prod_i A_i^{[\varepsilon_{ki}]_+}
+\prod_i A_i^{[-\varepsilon_{ki}]_+}\right),\qquad \mu_k^*A'_i=A_i\ (i\ne k),
$$

$$
\mu_k^*X'_k=X_k^{-1},\qquad
\mu_k^*X'_i=X_iX_k^{[\varepsilon_{ik}]_+}(1+X_k)^{-\varepsilon_{ik}}\ (i\ne k).
$$

For *latticeToFZ*`(s)`, the first is §1.4's exchange relation (frozen `A_j` as `z_j`)
and the second, for `i∈I_uf`, §1.2's `y`-mutation with `y_i=X_i` and `+` for `⊕`.
Prove composition and cocycle laws along mutation words. Index charts by the rooted
`|I_uf|`-regular tree, glue each pair along the largest opens where the composite
transition and its inverse are regular, and construct the schemes `𝒜`, `𝒳` with chart
inclusions and re-rooting isomorphisms, not required affine or separated. Prove
`Γ(𝒜,𝒪)=⋂_t C[M°]_t` in the common field `FractionRing C[M°]`, which is
`U_{C_J}` (§1.4) for *latticeToFZ*`(s)`, with `A_j` as `z_j`.
Construct `C⊗_ℤA_{R_J}→Γ(𝒜,𝒪)` by L8 (`J=I∖I_uf`);
`C⊗_ℤU_{R_J}≅Γ(𝒜,𝒪)` is not assumed. The intersection argument uses
integral charts and dense exchange opens, not normality or Noetherianity of C.
The maps `p*:N→M°` with `p*(n)(n°)={n,n°}` whenever `n∈N_uf` or `n°∈N_uf∩N°`
(GHKK, (A.2)) form a nonempty torsor under `Hom(N/N_uf,(N_uf∩N°)^⊥)`, `^⊥` the
annihilator in `M°`. For each such `p*`, kept as data, construct `p:𝒜→𝒳` with torus
pullback `z^n↦z^{p*(n)}`, and prove `μ_k∘p=p∘μ_k` on every chart.

For the partial compactification used in §6.3, extend the shared regular-cone
chart API to any commutative ring R. If a cone in a lattice L is generated by a subset of a lattice
basis, its dual semigroup consists of the characters nonnegative on those
generators. Construct its chart `Spec R[σ^∨∩L*]`, identify it with
`𝔸_R^r×(𝔾_{m,R})^{rank(L)−r}`, and construct face inclusions as localizations at
the corresponding coordinate monomials. Prove compatibility with lattice
isomorphisms, face composition and arbitrary scalar change: for `R→R'`, construct
`R'⊗_R R[σ^∨∩L*]≃ₐ[R']R'[σ^∨∩L*]` and its scheme base-change
comparison, commuting with the face maps. Reuse the native
`TauCeti.MonoidAlgebra.isLocalization_away_mapDomainRingHom` and
`MonoidAlgebra.scalarTensorEquiv`/`MonoidAlgebra.tensorAlgEquiv` for the
algebraic maps, together with §§0.2–0.3, the existing cone and dual-semigroup
carriers, and scheme gluing. At `R=ℂ`, identify
these constructions with AnalyticToricGeometry Layer 0's affine toric charts
and face maps. This supplies the toric charts, not the cluster-specific
extension of transition maps, which is proved in §6.3.

**3.4 Principal and tropical comparisons.** Construct the principal extension
`Ñ=N⊕M°`, `Ñ_uf=N_uf⊕0`, `Ñ°=N°⊕M`, `{(n,m),(n',m')}={n,n'}+⟨n,m'⟩−⟨n',m⟩`
(`⟨−,−⟩` the `ℚ`-valued pairing of `N`, `M°`), seed `(e_i,0),(0,f_i)`, weights `d_i`
on both copies. Prove that its *latticeToFZ* is *latticeToFZ*`(s)` with a new
frozen row `(δ_ik)_{k∈I_uf}` for each `i∈I`. Construct `𝒜_prin` (its `𝒜`), the
projection `𝒜_prin→Spec C[N]` induced by `N⊆M°⊕N=Hom(Ñ°,ℤ)`, and prove that its fiber
over `1` is `𝒜` under the original datum's §1.4 nonvanishing condition.
The principal extension itself has nonzero extended columns in every characteristic.
Its `p₁*` is injective on `Ñ_uf`; no injectivity of the original `p₁*`
is required. Zero rows of ε remain allowed whenever §1.4's nonvanishing
condition holds.

On the full principal character lattice `M̃°=M°⊕N`, define the rational alternating
form `λ((m,a),(m',a'))=⟨a,m'⟩−⟨a',m⟩−β(a,a')`. Over a commutative `ℚ`-algebra R,
give `R[M̃°]` the monomial Poisson bracket `[z^u,z^v]_P=λ(u,v)z^{u+v}`.
For `n,n'∈N_uf`, put `r(n)=(p₁*(n),n)` and prove
`λ(r(n),(m,a))=⟨n,m⟩`, `λ(r(n),r(n'))=β(n,n')`.
For `n,n'∈(Σ_{i∈I_uf}ℕe_i)∖{0}`, restrict `H_{z^{r(n)}}` to
`R[M°][t_i:i∈I_uf]` via `z^{(m,a)}=z^m t^a` and extend continuously to its
`t`-adic completion. Prove this is ScatteringDiagrams §4.2's `D_n`, with
`[D_n,D_{n'}]=β(n,n')D_{n+n'}`; these Hamiltonian derivations annihilate every `t_i`.

For `min` and for `max` on `ℤ`, construct the tropical points of `𝒜` and `𝒳` (charts
`N°`, resp. `M`) from the universal integral subtraction-free transitions,
before scalar change or reduction. Prove that *minMaxNegation* `x↦−x` is a
semifield isomorphism `(ℤ,max,+)≅(ℤ,min,+)` intertwining the two tropicalizations of
every subtraction-free function (§0.1), hence of every transition. Define
`T_k:M°→M°`, `T_k(m)=m+[⟨d_ke_k,m⟩]_+p₁*(e_k)` (GHKK's `max` convention), and prove
`T_k(Σm_jf_j)=Σm'_jf'_j` in the bases of `s` and `μ_k^+(s)`, with `m'_k=−m_k`,
`m'_j=m_j+[ε_kj]_+[m_k]_+−[−ε_kj]_+[−m_k]_+`. The commuting squares are: lattice,
`latticeToFZ(μ_k^±s)=μ_k(latticeToFZ s)` (§3.2); coordinate, the formula for `T_k` just
given; tropical, *minMaxNegation* composed with the `max`-tropicalized transition equals
the `min`-tropicalized transition composed with *minMaxNegation*. Transport Laurent
expansions (§0.3, L8) and positivity (§0.3) along them. For `c`- and `g`-vectors (L5,
L6b), *fzToLattice* sends `c_{j;t}` to `Σ_i(c_{j;t})_ie_i∈N` and `g_{j;t}` to
`Σ_i(g_{j;t})_if_i∈M°`; §6.3 states its lattice results through these maps.
`N°`, `M`, `M°` and the `min`/`max` tropical points are distinct types.

**Checks.** For `B=((0,1),(−2,0))`, symmetrizer `(2,1)`, weights `(1,2)` and
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
over `𝔽₂` this overlap is empty, so the fiber exists as a scheme but is
not the excluded common-function-field A pattern. For X, `1+X_k≠0` in
every characteristic. Over `𝔽₂`, the nonzero column `(0,2)ᵀ` has exchange
factor `1+z²=(1+z)²≠0`; exponent labels are not reduced modulo the characteristic.
Sources: GHKK, §1.3, §2 and Appendices A–B.

## Layer 4: upper bounds and acyclic cluster algebras

The intersection statements use a coefficient domain R and a faithful
classical chart. For the mutation and acyclic upper-bound results, require
the two normalized coefficient factors of each exchange to be units of R.
This includes every admitted normalized coefficient realization `C,φ`, every
`ℤ[P]`, and geometric patterns over `C_J`; inactive frozen variables may
remain noninvertible. The standard-monomial basis and lower-bound presentation
also hold over every `C_S`. Full column rank is one sufficient way to construct
the local divisibility premises below; explicit local premises also cover
rank-deficient seeds. The full-rank instances agree with L5's zero-form
Q1–Q3, and the other instances use §§0.5–0.7 and the same Q3 pattern theorem.
These structural statements are not inputs to L5–L8.

### 4.1 Classical finite upper bounds

**U1 — one exchange.** Instantiate §0.5 with the identity automorphism. Its unique
expansion and coefficient-divisibility criterion apply over any commutative domain.
For `E=2` over ℤ, `2x⁻¹` belongs to the intersection but `x⁻¹` does not.

**U2a — two commuting directions.** Let D be a commutative domain, x,y
algebraically independent over D, and E,F nonzero elements of D. Assume
`(E)∩(F)=(EF)` as ideals of D. Prove
`(E^r)∩(F^s)=(E^r F^s)` for all `r,s≥0`: the initial equality makes F
a non-zero-divisor modulo E, and cancellation in D extends this first to
powers of E and then to powers of F. For `x*=E/x`, `y*=F/y`, deduce
`D[x,x*,y^{±1}]∩D[x^{±1},y,y*]=D[x,x*,y,y*]` by comparing Laurent
coefficients. The all-powers ideal equality is also necessary for this
four-generator identity. In a gcd domain, relatively prime E,F imply
the premise; factoriality is only a sufficient instance.

**U2b — two interacting directions.** For a subring `D` of a field, nonzero `x,y`,
`a,b,d∈D`, `f∈Dˣ`, `c≥0`, `e>0`, `x*=(ay^c+b)/x` and `y*=(dx^e+f)/y`,
`D[x,x*,y^{±1}]∩D[x^{±1},y,y*]=D[x,x*,y,y*]`, with no coprimality premise; for
`H=D[x,x*,y,y*]` the two intersected rings are `D[x,x*,y^{±1}]=H[y⁻¹]` and
`D[x^{±1},y,y*]=H[x⁻¹]`. U2a's ideal-intersection condition is not a Bézout identity.

**U2c — replacement after mutation.** With U2b's data, `c>0`, and `g,h∈Dˣ` with
`fh=dgb^e`, `D[x,x*,y,y*]=D[x,x*,y,(g(x*)^e+h)/y]`.
For `y**=(g(x*)^e+h)/y`, use the polynomial
`Δ=((ay^c+b)^e−b^e)/y∈D[y]` to prove both inclusions through
`y**=(g/f)(x*)^e y*−(gd/f)Δ` and
`y*=(d/h)x^e y**−(dg/h)Δ`. These identities also cover `x*=0`.

Instances: for an admitted geometric seed over `R=C_J` (§1.4) and mutable `i≠j`, put
`D=R[x_l^{±1}:l≠i,j]`, `x=x_i`, `y=x_j`, `x*=x'_i`, `y*=x'_j`, and `B̃'=μ_i(B̃)`. If
`b_ij=0`, then `x*=E_i/x`, `y*=E_j/y` with `E_i,E_j∈D`, U2a applies under its
principal-ideal condition in D, and the `j`-variable of `μ_jμ_i(s)` is `x'_j`. If `b_ij≠0`, put
`e=|b_ij|`, `c=|b_ji|`, `σ=sign(b_ij)`; then `a,b,d,f,g,h` are the monomials in the
`a_l` (`l≠i,j`, §1.4) with exponents `[-σb_li]_+`, `[σb_li]_+`, `[σb_lj]_+`,
`[-σb_lj]_+`, `[-σb'_lj]_+`, `[σb'_lj]_+`, the `j`-variable of `μ_jμ_i(s)` is
`(g(x*)^e+h)/y`, and `σ(b'_lj−b_lj)=e[σb_li]_+` gives `fh=dgb^e`, so U2b and U2c apply.

**U3 — invariant upper bounds.** For an admitted unit-coefficient classical
pattern over a domain R, put `UB(s)=L_s∩⋂_{i∈K}L_{μ_i(s)}` and
`D_ij=R[x_l^{±1}:l≠i,j]`. For a commuting pair `b_ij=0`, its exchange
polynomials E_i,E_j belong to D_ij. Use the premise
`(E_i)∩(E_j)=(E_i E_j)` in D_ij. Prove *upperBound_mutation*:
`UB(s)=UB(μ_k(s))` if this premise holds at s for every `j≠k` with
`b_kj=0`. Those pairs have the same E_k,E_j and D_kj after mutation at k,
so the reverse inclusion uses the same premise. Interacting pairs use
U2b–U2c and the coefficient-mutation identity, first for the displayed
geometric coefficients and then for normalized coefficient factors.
If the premise holds at every reachable seed for every commuting pair,
apply Q3's order-theoretic theorem to obtain `UB(s)=U` for all s.

Retain the usual *coprime* (pairwise relatively prime exchange polynomials)
and *totally coprime* (at every seed) formulations as sufficient instances
when relative primality gives this principal-ideal equality. This applies
to factorial coefficient rings and to `ℤ[P]` for arbitrary P: all data and
divisibility witnesses use a finitely generated torsion-free subgroup, and
the larger group ring is free over that subgroup ring by coset representatives.
Prove polynomial-to-Laurent descent of these relative-primality conditions.
No unique factorization of the whole `ℤ[P]` is assumed. Layer 7 uses these
upper bounds; L8 does not.

**U4 — full rank as a sufficient condition.** Over a domain C with active
frozen variables inverted, write each geometric exchange as a monomial
unit times `1+X^{b_i}` in the fully inverted Laurent ring. If columns i,j
are rationally independent and `b_ij=0`, take `N=ℤ b_i⊕ℤ b_j` in the pair
lattice. In `C[N]` the two factors are `1+S` and `1+T`. Powers of the
second have unit leading coefficient as polynomials in T even modulo a
power of the first, so their principal ideals intersect in their product.
Transfer this equality to the pair Laurent ring using its free module
structure over `C[N]` (§0.6). This gives U3's premise without factoriality.
The support argument also gives the usual relative-primality statement
and polynomial descent. Full column rank and its mutation invariance
therefore imply `UB(s)=U` at every seed and supply the acyclic upper-bound
hypothesis below. These charts agree with L5's frames. No positive compatible
form is needed.

**Checks.** For U2a with `D=ℤ[u,w]`, `E=1+u`, `F=1+w`: `(1+u)(1+w)x⁻¹y⁻¹=x*y*` lies
in the intersection, and `(1+u)x⁻¹y⁻¹` lies in `D[x,x*,y^{±1}]` but not in
`D[x^{±1},y,y*]`. For `E=F=2` over `ℤ`, `2/(xy)` lies in both left-hand rings of U2a but
not in `ℤ[x,x*,y,y*]`. For U2b–U2c over `ℤ` with all units `1`, `c=1` and `e=1,2,3`,
`(g(x*)^e+h)/y` is `x*y*−1`, `(x*)²y*−y−2`, `(x*)³y*−y²−3y−3`. For mutable block `0`
in rank two and one frozen row `(1,1)`, `E₁=E₂=1+z`: not coprime.
Over `D=ℤ[√−5]`, `E=2` and `F=1+√−5` have no common nonunit divisor,
but `6∈(E)∩(F)` and `6∉(EF)`. Thus relative primality alone over a
general domain cannot replace the ideal condition in U2a or U3.

The condition `c>0` in U2c is essential even when every scalar coefficient is
one. At `c=0`, `e=1`, one has `x*=2/x`, `y*=(x+1)/y` and `fh=dgb^e=1`.
In `ℤ[x^{±1},y^{±1}]`, specialization `x↦−1` sends
`ℤ[x,x*,y,y*]` into `ℤ[y]`, but sends `(x*+1)/y` to `−y⁻¹`.
Thus U2b still applies while U2c's replacement fails at this boundary.

Check the frozen-inversion boundary explicitly. Over `ℤ[z]` with independent
x,y and extended matrix `((0,1),(−1,0),(1,−1))`, put
`x'=(y+z)/x`, `y'=(x+z)/y` and `h=(x+y+z)/(xy)`.
Then `h=(1+x')/y=(1+y')/x` belongs to the initial chart and both adjacent
charts, while `zh=x'y'−1`. It does not belong to `ℤ[z,x,x',y,y']`:
evaluating z at zero in the finite Laurent ring sends its four coordinate
generators to elements of nonnegative total x,y-degree, but sends h to
`x⁻¹+y⁻¹` of degree −1. Here h is the variable after mutations 1,2, so
`h∈A∩UB` but `h∉LB`. Thus the four-generator intersection and the equalities
of LB with A or UB are not automatic with noninverted active frozen variables.
The acyclic standard-monomial basis and presentation of LB remain valid over
this coefficient ring, as does L8's polynomial-frozen Laurent theorem.

### 4.2 Acyclic presentations

Put `LB(s)=R[x_i,x'_i:i∈K]`, with x'_i the adjacent variable. Call s
acyclic if its mutable graph (`i→j` when `b_ij>0`) has no directed cycle.
For an acyclic geometric seed over any admitted domain C and any frozen
inverse set S, take `R=C_S`. Prove that the standard monomials (no factor
`x_i x'_i`) form an R-basis of LB and that
`R[X_i,X'_i:i∈K]/(X_iX'_i−E_i(X))→LB(s)` is an isomorphism.
The same assertion holds for normalized coefficient realizations over C.
Use an acyclic ordering and the triangular map from standard monomials to
their first Laurent monomials. The leading coefficients are nonzero;
they need not be units. This proof permits noninverted frozen variables
and admitted positive characteristic.

Next assume the exchange coefficient factors are units in R. If s is
acyclic and its initial commuting exchange pairs satisfy U3's ideal
condition, prove `LB(s)=UB(s)`. In the induction of BFZ III §6, the extra
divisibility is the saturation in Lemma 6.7: for `b_1j=0`, cancel E_1
modulo powers of E_j using U2a. Freezing preserves the pair rings; when a
deleted variable is absent from both exchanges, descend the condition
from its Laurent extension. With L8, `LB⊆A⊆U⊆UB` gives
`LB=A=U=UB`. A coprime seed over the coefficient rings specified in U3,
or a full-column-rank geometric seed, supplies the required condition.
No total-coprimality or factoriality premise is needed here.

Finally, for an admitted normalized pattern with coefficient factors
units in R, prove `LB(s)=A_R` for acyclic s without any coprimality
assumption. Apply the preceding acyclic result to a principal lift.
L7's normalized specialization sends each initial adjacent principal
variable to a unit multiple of the corresponding adjacent variable and
divides a general principal variable only by a coefficient unit. Thus
its polynomial expression in initial and adjacent variables specializes
into LB. Apply the finite coefficient realization from L8 for `C,φ`.
Geometric patterns with all active frozen variables inverted are instances.
The proof order is basis/presentation, the acyclic upper-bound result,
then this principal-lift corollary.

Deduce `LB=A=U` for these acyclic unit-coefficient patterns without a
coprimality condition. Induct on the number of mutable vertices. At a
nonisolated source k, write `x_k x'_k=u+vM` with u,v coefficient units
and M a nonconstant monomial in its mutable neighbors. Then `(x_k,M)=A`.
Using `LB=A`, identify freezing k or all its neighbors with
`A[x_k⁻¹]` or `A[M⁻¹]`; both frozen patterns are acyclic of smaller
mutable rank. Every element of U lies in their upper algebras, hence in
these two localizations by induction. Comaximal patching gives `U⊆A`.
For an isolated k, its exchange is a fixed nonzero `E∈R`. Intersect the
other charts coefficientwise in x_k and then apply U1:
`U=U_rest[x_k^{±1}]∩U_rest[(E/x_k)^{±1}]=U_rest[x_k,E/x_k]`.
The induction starts with no mutable variables. The local ideal condition
is needed only to append `UB(s)` to `LB=A=U`, not for that equality itself.

The same patching gives the locally acyclic corollary. Suppose freezing
sets S_a in reachable seeds s_a produces admitted acyclic unit-coefficient
patterns with actual localization equalities `A_a=A[d_a⁻¹]`, where
`d_a=∏_{i∈S_a}x_{i;s_a}`, and
the d_a generate the unit ideal of A. Then `U⊆U_a=A_a` for every a,
so `A=U`; an arbitrary family reduces to a finite unit-ideal witness.
The localization equalities are hypotheses to prove, not consequences of
freezing alone. This is the freezing-and-cover argument of Muller, §§3–4,
extended here to the admitted coefficient domains.

**Checks.** For `B=0` in rank two, principal coefficients give full column rank. For
`xx'=1+z₁z₂`, `U=R[x,x']≅R[X,X']/(XX'−1−z₁z₂)` with basis `x^a` (`a≥0`), `x'^b` (`b>0`).
For coefficient-free `B=0` in rank two over ℤ, `LB=A`, but the initial
upper bound contains `2/(xy)`, which the chart after mutations 1,2 excludes.
Hence acyclicity alone does not give `UB=U`.
Sources: BFZ III, §1 and proofs in §§3–7; Muller, §§3–4 and Theorem 2.

## Layer 5: finite type and almost-positive roots

Inputs are §§1.1–1.3, L8 and the named RootSystems interfaces. Construct
§5.2's root compatibility for a given finite root system and §5.1's diagram
reduction before using them in the finite-type classification and denominator
correspondence; neither construction assumes that final classification.
The algebraic classification and denominator correspondence also hold for
every admitted coefficient realization `φ:P→Cˣ` over a domain C. Prove
preservation of the denominator terms below; do not infer distinctness of
specialized variables from a possibly noninjective coefficient map.

**5.1 Classification.** For an exchange matrix `B : Matrix K K ℤ` let `[B]` be the set of
all `μ_w(B)`, `w` a mutation word. A pattern is of finite type if it has finitely many
cluster variables; `B` is of finite mutation type if `[B]` is finite. The Cartan
companion `A(B)` has `a_ii=2`, `a_ij=-|b_ij|` (`i≠j`); prove `D_s A(B)` symmetric for each
symmetrizer `D_s` of `B`. Call `B` bipartite if `b_ijb_ik≥0` for all `i,j,k`. For every
coefficient semifield `P` and `y : K→P`, and for each admitted domain
realization of this pattern, prove the equivalence of:

1. The cluster algebra with initial matrix `B` is of finite type.
2. Some `B'∈[B]` has `IsFiniteType (A(B'))`.
3. Every `B'∈[B]` satisfies `|b'_ij b'_ji|≤3` for all `i≠j`.

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

**5.2 Root combinatorics.** Let `Φ` be a finite crystallographic root system with
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

A bipartite seed for `Φ` has a bipartite exchange matrix `B°` (§5.1) with `A(B°)=A`. The
denominator vector `d(x)∈ℤ^I` of `0≠x∈L_{R,0}` (`R=ℤ[P]` or an admitted C)
is the unique d with `x=N/∏x_i^{d_i}`, `N∈R[x_i]` divisible by no x_i.
For every coefficient semifield P and bipartite initial seed, and each admitted
domain realization, prove there is a unique bijection `α↦x[α]` from `Φ_{≥-1}` to the cluster
variables with `d(x[α])_i=[α:α_i]`; it has `x[-α_i]=x_i` and maps maximal compatible sets
bijectively to clusters. Deduce that there are `rank(Φ)+|Φ_{>0}|` cluster variables and
finitely many seeds.

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

**Checks.** Types `A₂`, `B₂` and `G₂` have respectively 5, 6 and 8 variables;
type `A₁×A₁` has four. Construct the polygon-diagonal model for `A_n`, including
compatibility as noncrossing and mutation as a flip. The rank-two matrix
`((0,2),(-2,0))` has finite matrix mutation class but infinitely many cluster variables.
Sources: FZ II, Theorems 1.4–1.9, §5 (5.3)–(5.4) and Lemma 5.2,
and §§3, 7–10; RootSystems, Layers 1–6.

## Layer 6: scattering, positivity and sign-coherence

**6.1 The cluster scattering input.** For a Layer 3 lattice seed `s` (FZ seeds via
*fzToLattice*), instantiate ScatteringDiagrams §4.2 over `ℚ`, tracking integral
coefficient subsemirings, with §3.4's faithful Hamiltonian realization on `ℚ[M°]⟦t_i⟧`,
`q^n=z^{p₁*(n)}t^n`, and incoming walls `(e_i^⊥,1+q^{e_i})`, `i∈I_uf`; call the
completion `𝔇_s`. Prove `κ(e_i)=d_i` and instantiate §4.2's *principalGradingDictionary*
and *principalProjectionComparison*. Uses: ScatteringDiagrams §3.4 uniqueness and §7.2
ordinary binomial positivity. Construct the map from this principal action to the
diagram of §3.4's principal extension (`t_i` ↦ `e_i` in the `N` summand of
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

For a reachable principal seed t, use a labelled character lattice `M̃_t°`
and put `C̃(t)={Σ_α a_α f̃_α^t:a_α≥0 for α∈I_uf}`, with every frozen
exponent unrestricted. Let `τ̃_{s,t}` be the composite of the full principal
piecewise-linear maps, using inverse maps on reversed paths, and set
`C̃_t^+=τ̃_{s,t}^{-1}(C̃(t))`. Prove that its restriction extends to an
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
Prove the cluster-path transports rational; by §1.4's exchange nonvanishing,
their needed denominators remain nonzero at `t_i=1`. Restrict to these
overlap localizations and descend to that fiber. This gives
`ψ_t:A_t≃T_t^scat`, `ψ_t^*(z^m)=z^{ℓ_t(m)}` and
`ψ_r^*∘W_{t→r}=μ_{r→t}^*∘ψ_t^*`, where `W` denotes this descended
transport; extend the comparison to §3.3's maximal regular overlaps.
No evaluation `t_i=1` on a formal completion or its fraction field is used.

Prove that the cones `C_t^+` and their faces form the cluster fan, with
common lineality `N_uf^⊥` and simplicial quotient cones. Rank zero has the
whole character space as lineality. Not every scattering chamber is asserted
to be a cluster chamber. The principal fan is its inverse image under π.
Sources for the fan: GHKK Lemma 2.10 and Theorem 2.13.

**6.2 Cluster monomials and positivity.** For a seed-t monomial
`c_t=∏_i(A_i^t)^{a_i}`, with mutable exponents nonnegative and frozen exponents
arbitrary integers, construct its principal lift `c̃_t` by the same word and
exponents on the original-coordinate variables of §3.4's principal extension.
Let `ã_t` be its character in that principal seed chart and set
`m̃=ℓ̃_t⁻¹(ã_t)`. Prove that `m̃∈C̃_t^+` and that `ϑ_{Q̃,m̃}`, with generic
endpoint in the initial chamber, equals the initial expansion of `c̃_t`
(GHKK Theorem 4.9 and Proposition B.11).
Use the principal cylinder comparison `z^{(m,n)}↦z^m t^n`, initially in
shifted modules over `ℚ[M°][t_j^{±1}:j∈I∖I_uf]⟦t_i:i∈I_uf⟧`
(ScatteringDiagrams §5.1); the shift allows negative mutable components of n.
By L8 and L6a the result lies in `ℤ[t_i:i∈I_uf][M°]⊆ℚ[M°]⟦t_i⟧`.
Added principal variables indexed by original frozen vertices do not occur:
their zero rows in the initial extended matrix stay zero under mutation.
Identify the result with Layer 2's unique
finite expansion, with all coefficient and chart maps specified. Specialize
`t_i=1` only on this polynomial subring. The reduction of the full label m̃
to a g-vector is proved in §6.3, not used to define this comparison.
Theorems:

- for every integral geometric pattern (any `B̃`, including singular `B` and zero rows) and
  reachable `s,t`, the expansion of `x_{j;t}` in chart `s` lies in `ℕ[z_f][x_{i;s}^{±1}]`
  (with L6a), and in `ℕ[z_f][z_r^{-1}:r∈S][x_{i;s}^{±1}]` in each `R_S`;
- for every coefficient semifield `P`, it lies in `ℕ[P][x_{i;s}^{±1}]` (with L7), i.e.
  every §0.3 coefficient function is positive;
- the same for cluster monomials and under L7a's `u_i↦y_i` and L8's `A_P→A_Q`.

For the admissible domain realizations of §§1.2–1.4, transport these finite
integral expansions through L8's coefficient maps. Positivity means that the
universal coefficients lie in `ℕ[P]`; no order or characteristic-zero
structure on the target domain is required or asserted. The scattering and
Lie-action construction remains over ℚ, and is not reduced by a nonexistent
map `ℚ→C` in positive characteristic. Tropical labels and integer C/G data
are attached to the universal integral pattern before coefficient reduction.

**6.3 Sign-coherence.** `C_t` and `G_t` are the FZ matrices of L5 and L6b. Construct the
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
For §6.2's lifted monomial of degree `g(c_t)`, prove `m̃=(g(c_t),0)` by its
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
  and no column of `C_t` is zero; under *fzToLattice* (`d_i=L/s_i`) and §3.4's maps
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

**Checks.** Compute the `A₂` chamber fan and principal `C,G,F` data around its pentagon.
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
Sources: GHKK, Theorems 1.24, 4.9–4.10, Corollary 5.5 and Theorem 5.11;
NZ, Theorem 1.2, Proposition 1.3 and (2.7).

## Layer 7: double Bruhat cells

**7.1 Geometric input and minors.** Let `G` be a pinned split connected simply connected
semisimple group over a characteristic-zero field 𝕜, `T⊂B_+` its split maximal
torus and `B_-` the opposite Borel.
For `u,v∈W` construct the locally closed subscheme `G^{u,v}=(B_+uB_+)∩(B_-vB_-)` of `G`
as a scheme intersection, with its function field; prove it smooth, irreducible, of
dimension `rank(G)+ℓ(u)+ℓ(v)`. Construct the double-word factorization charts and their
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
`ζ^{u,v}:G^{u,v}→G^{u⁻¹,v⁻¹}` (its Definition 1.5) as a biregular isomorphism with
inverse `ζ^{u⁻¹,v⁻¹}` and its pullback on coordinate rings. Other isogeny types are out
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

**7.2 The BFZ seed.** For every double reduced word `i` for `(u,v)`, use negative
letters for `u`, positive letters for `v`, and prepend the indices `-r,…,-1` as in BFZ.
The successor `k⁺` is the next occurrence of the same absolute simple index; the mutable
positions are the positive positions with a successor in the word. Implement `B̃(i)` of
BFZ §2.2, Definition 2.3 and Remark 2.4, and the minors `Δ(k;i)` of §2.3,
(2.9)–(2.11), with index conversions. Prove `B̃(i)` skew-symmetrizable of full column
rank, and that the frozen minors are units on `G^{u,v}`. Construct the field isomorphism
sending each initial variable `x_k` to `Δ(k;i)`. For every mutable `k` and every Cartan
type, prove the exchange relation as an identity of regular functions, that `x'_k` is
regular, and that the cluster of `μ_k` gives a chart of `G^{u,v}`.

**7.3 Coordinate ring identification.** Prove that the initial and adjacent charts cover
an open subset of `G^{u,v}` with complement of codimension at least two, and, by
SchemeAndStackFoundations §0.6 (Hartogs), that `Γ(G^{u,v},O)` is the intersection of
these Laurent rings. With U3–U4 construct `U_𝕜(B̃(i)) ≃ₐ[𝕜] Γ(G^{u,v},O)` sending each
`x_k` to `Δ(k;i)`, where `U_𝕜` and `A_𝕜` are §1.4's `U_{𝕜_J}` and `A_{𝕜_J}`.
If the pattern of `B̃(i)` contains an acyclic seed, prove
§4.2's hypotheses for it and deduce `A_𝕜(B̃(i))=U_𝕜(B̃(i))≃ₐ[𝕜]Γ(G^{u,v},O)`. For double
reduced words `i,i'` of `(u,v)` construct the composite `U_𝕜(B̃(i))≃U_𝕜(B̃(i'))` through
`Γ(G^{u,v},O)`, without assuming the seeds mutation equivalent.
For field extension, first identify U with the finite upper bound and then
use flatness for that finite intersection; prove compatibility of the
coordinate-ring isomorphism with field extension. A product with a split
torus is obtained by adjoining its character Laurent algebra as frozen
coordinates, with the corresponding tensor-product comparison.

**Checks.** For `SL₂`, `G^{s,s}` consists of matrices `(a b; c d)` with `bc≠0` and
`ad-bc=1`. Identify its coordinate ring with
`𝕜[b^{±1},c^{±1},a,d]/(ad-1-bc)`; `a,d` are exchanged and `b,c` are frozen.
For `SL₃` and `(u,v)=(w₀,w₀)`, reproduce BFZ's matrix, eight initial minors,
four mutable positions and four adjacent exchanges in Example 2.11.
Sources: FZ, *Double Bruhat cells and total positivity*; BFZ III, §2, especially
Theorem 2.10, Lemmas 2.12–2.13 and Corollary 2.17.

## Completion criteria

Every carrier has the extensionality, reindexing, evaluation and compatibility lemmas its
consumers here use; definition-only files do not finish a layer. The Laurent theorem and
finite-type classification hold for arbitrary coefficient semifields and all admitted
domain realizations. Arbitrary frozen sets use finite column support; locally finite
infinite mutable rank has the stated finite-word Laurent and positivity corollaries.
Geometric constructions and integral positivity keep their stated scope. The Laurent theorem gives
finite expansions with uniqueness and coefficient transport laws, via the common
polynomial Q1–Q3: use `ℤ[v,v⁻¹]` and the positive compatible form for quantum
seeds, and the integral unit-parameter zero-form principal seed for L5, then
L6–L8 for every `P`. Transitively, L8 and Somos-4 integrality depend on this same
common Q3 through the direct classical L5 instance, without the `v=1` comparison.
Q1–Q3 do not depend on L5–L8, Layer 4,
positivity or categorification. U1–U4 are delivered for their own consumers.
There is one polynomial mutation and Laurent construction, using P1, Q1–Q3
and §§0.5–0.7. Ordinary binary formulas, their power and divisibility criteria,
and the classical and quantum public Laurent statements are derived instances.
Its representatives equal the public expansion maps' values. Every common
seed hypothesis is stated in §1.5; rank is absent from seed data and from the
Laurent theorem. Full column rank, derived in the positive quantum sector,
is a sufficient upper-bound hypothesis. The central principal lift proves
rank-free Laurentness, using only finite representative specialization and
nonzero exchanges. No factoriality assumption enters common Q1–Q3.
The targets use neither unique factorization of `ℤ[P]` nor
Laurentness stored in seed data. Polynomial, partially inverted and inverted frozen
coefficient rings instantiate the same definitions over every commutative base ring,
with proved localization maps; faithful field realizations use domains and the
explicit zero-column nonvanishing condition. Acyclic lower-bound bases and
presentations permit every frozen inverse set. With unit exchange coefficients,
acyclic `LB=A=U` needs no coprimality; the local principal-ideal conditions supply
the further equality with UB. Generic bar and realization transports state their
scalar-involution hypotheses; finite-order parameters are included in mutation,
Laurentness and the center description.
The FZ/lattice comparison maps carry whole patterns, not only exchange matrices.
Layer 6 proves mutation invariance, theta identification and the passage from formal
positive series to finite Laurent coefficients. Layer 7 gives an isomorphism of actual
algebras with checked generator images, not a structure with the coordinate-ring
theorem as a field.
Q4 gives algebraic realizations with noninvertible frozen generators, normalization, bar
and grading transports, and proved Ore localization maps. No ambient fraction-field
specialization, general special-fiber isomorphism, or commutation of base change with an
infinite intersection is assumed. Finite examples check formulas and conventions; they
do not replace the all-rank results.

For §2.6, the degree-one comparison preserves mutation words, charts,
representatives and generated algebras. The unit-parameter classical frame
keeps the original matrix symmetrizer and scalar ring, with zero form and form
weights. Its coordinate and chart comparisons are equivariant along every word.
The polynomial local comparisons construct their
premises from seed data and use §0.7. Commuting Q2 proves central-factor
principal-ideal intersections by separated variables and a unit leading
coefficient, then transfers simultaneous divisibility by flatness before
applying the Q3 pattern theorem. Toric charts and their scalar change use any
commutative ring, A/X common-field gluings use their stated domain hypotheses,
and the formal scattering/Lie construction stays over ℚ before integral
finite outputs are transported. No finite check substitutes for these all-rank targets.

## References

- **FZ I:** Fomin–Zelevinsky, [*Cluster algebras I: Foundations*](https://arxiv.org/abs/math/0104151),
  §§2–3, especially Theorem 3.1 for the general Laurent statement.
- **FZ II:** Fomin–Zelevinsky, [*Cluster algebras II: Finite type classification*](https://arxiv.org/abs/math/0208229),
  §1.3–1.5, §3, §5 (5.3)–(5.4) and Lemma 5.2 for denominator constants,
  §§7–10 and Proposition 11.2 for polynomial frozen coefficients.
- **FZ IV:** Fomin–Zelevinsky, [*Cluster algebras IV: Coefficients*](https://arxiv.org/abs/math/0602259),
  Definitions 2.1–2.4, Theorems 3.5 and 3.7, and Corollary 6.3.
- **NZ:** Nakanishi–Zelevinsky, [*On tropical dualities in cluster algebras*](https://arxiv.org/abs/1101.3736),
  version 3, Theorem 1.2, Proposition 1.3 and (2.7); the sign-coherence premise
  is proved in §6.3 before these recurrences are used.
- **GHKK:** Gross–Hacking–Keel–Kontsevich,
  [*Canonical bases for cluster algebras*](https://arxiv.org/abs/1411.1394), version 2,
  §1.3 (PDF pp. 29–34), §4 (pp. 45–50), §5 (pp. 50–57),
  Appendix A (pp. 111–113) and Appendix B (pp. 113–118).
- **BFZ III:** Berenstein–Fomin–Zelevinsky,
  [*Cluster algebras III: Upper bounds and double Bruhat cells*](https://arxiv.org/abs/math/0305434),
  §§1–7; the upper-bound proof is on PDF pp. 24–28, and Theorem 2.10 and its
  geometric input are on pp. 15–18 of version 3.
- **Muller:** Greg Muller, [*A=U for Locally Acyclic Cluster Algebras*](https://arxiv.org/abs/1308.1141),
  version 4, SIGMA 10 (2014), 094; §§3–4 and Theorem 2 for freezing,
  covers and acyclic `A=U` without a coprimality assumption. The proof here
  explicitly extends the coefficient domain beyond the paper's `ℤ[P]`.
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
