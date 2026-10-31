# Roadmap: modular characters and blocks of finite groups

Develop modular representation theory of finite groups through Brauer characters,
decomposition and Cartan matrices, blocks and defect groups, and Brauer's three
main theorems. Expose ordinary-character and principal-block interfaces for
finite-group theory, including block-section orthogonality. The coefficient
characteristic `p` may divide `|G|` throughout.

Suggested homes: `TauCeti/RepresentationTheory/Modular/` and
`TauCeti/RepresentationTheory/Block/`. The module theory is primary; complex
characters describe it through proved comparisons.

## Starting points and ownership

- Mathlib supplies `MonoidAlgebra`, `Representation`, `FDRep`, modules, tensor
  products, finite-dimensional algebras, Jacobson radicals, projective modules,
  local rings, discrete valuation rings, completions and ideal quotients. Reuse
  `IsIdempotentElem`, `CompleteOrthogonalIdempotents`,
  `exists_isIdempotentElem_eq_of_ker_isNilpotent` and
  `CompleteOrthogonalIdempotents.of_ker_isNilpotent`. Lifting through the maximal
  ideal of a complete DVR is a separate completeness argument in M1, not an
  application of a nilpotent-kernel theorem to a nonnilpotent ideal.
- [SemisimpleAlgebras](../SemisimpleAlgebras/README.md) owns the simple-module
  dictionary and the structure of finite-dimensional algebras modulo their
  radicals. Reuse those APIs. `k[G]` itself need not be semisimple here.
- [QuiverRepresentations](../QuiverRepresentations/README.md), Layer 3,
  owns radical powers, composition multiplicities, semiperfectness, projective
  covers, indecomposable projectives and the composition-factor `cartanMatrix`.
  M0 and M3 consume these for `k[G]`; the native projective-cover and
  Cartan APIs listed below supply the implemented foundation.
- [ModularInduction](../ModularInduction/README.md), Layers 0–3, owns the group-algebra specialization of exact
  `G₀`, its simple-class basis, induction, restriction and the reduction
  of permutation lattices. M2 constructs the decomposition map for all stable
  lattices and proves compatibility with that existing reduction. Do not define
  a second Grothendieck group. [GrothendieckEulerForms](../../GrothendieckEulerForms/README.md)
  owns exact `K₀`, split `K₀` of projectives, the Cartan map and the
  projective/simple pairing.
- [CharacterTheory](../CharacterTheory/README.md) owns ordinary characters,
  the complex pairing, central characters, primitive central idempotents over
  algebraically closed fields and cyclotomic values. M4 supplies their
  descent to the non-closed split field `K`. Consume the native
  [`CharacterTable` library](https://github.com/TauCetiProject/TauCeti/tree/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/RepresentationTheory/CharacterTable).
  [InductionRestriction](../InductionRestriction/README.md) owns ordinary
  induction, Mackey and Clifford theory. Its Layer 6 owns ordinary Brauer
  induction from elementary subgroups, an input to M2's surjectivity proof.
  M3–M5 prove the modular comparisons.
- LocalFiniteGroupTheory [#1634](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1634),
  L1–L3, owns `p`-cores and coprime local-group theory. M0–M7 require only
  Mathlib's Sylow and group-action theory; the normal-`p`-subgroup and core
  applications in M8 consume that proposal's cores.

- Consume native `TauCeti.IsPrimitiveIdempotent` and
  `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` in
  [`Idempotents/Primitive`](https://github.com/TauCetiProject/TauCeti/tree/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/RingTheory/Idempotents/Primitive).
  Consume `TauCeti.IsProjectiveCover`, `exists_isProjectiveCover_of_finite`,
  `exists_isProjectiveCover_of_isSimpleModule` and
  `Ideal.nonempty_linearEquiv_of_quotient_smul_top` for covers and lifts;
  `TauCeti.cartanMap`, `TauCeti.cartanMatrix`, `projectiveSimplePairing` and
  `projectiveSimplePairing_isPerfPair` for their numerical interfaces.
  For group-algebra exact K₀ use `ExactK0 (finiteModulesExactStructure k[G])`,
  `resK0`, `indK0`, `groupAlgebraBaseChangeK0` and `reductionK0`.
  Ordinary Brauer induction is already exported as
  `ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`.

This roadmap owns the general theory below, not classification of simple groups,
Feit–Thompson, Glauberman's Z* theorem, cyclic-defect Brauer trees, or conjectures
about blocks. Z* may consume M5–M8 without being a prerequisite of any layer.

## Coefficients and conventions

Fix a finite group `G`, a prime `p`, the exponent `e` of `G` and the prime-to-`p` part
`e'` of `e`. A `p`-regular element satisfies `Nat.Coprime p (orderOf g)`.
Write every element uniquely as `g_p * g_{p'}`, with commuting factors of
`p`-power and prime-to-`p` order; build this decomposition in M0.

Use a fixed `p`-modular system `(K,O,k)` as a parameter: `O` is a DVR
with maximal ideal `m = IsLocalRing.maximalIdeal O`,
`IsAdicComplete m O`, `IsFractionRing O K`, `CharZero K`, and
`k = IsLocalRing.ResidueField O` of characteristic `p` and finite cardinality.
Require `K` to contain a primitive `e`-th root and fix the prime-to-`p`
root-lifting comparison below. All subgroups, centralizers and quotients of
`G` use this same system and the same lifting maps; their exponents divide
`e`. Never choose a new place independently when restricting or inflating.
M2 constructs the comparison for a change of modular system.

M1 constructs one such system from
`F := ℚ⟮TauCeti.Cyclotomic.complexRoot e⟯`, with its inclusion in `ℂ`:
choose a finite place over `p`, let `K` be its adic completion and `O` its
valuation ring, and take the residue field as `k`. Prove that it is isomorphic
to `𝔽_p(ζ_{e'})`; this notation denotes the field generated by the reduced
primitive root, not a second independently chosen coefficient field.
M1 proves `K` splits all subgroups of `G`; M2 first constructs Brauer
characters over an algebraic closure and then proves residue splitting.

The map `F→K` is the canonical completion embedding. The prime-to-`p` roots
are units in `O`, and reduction bijects the `e'`-th roots with those in `k`.
The Brauer character is the sum of their unique lifts, read through `F⊆ℂ`;
it is not a trace in `k` cast to `ℂ`. No embedding of the residue field into
characteristic zero is introduced. Universal comparisons with other splitting
fields use a common algebraically closed overfield and M2's scalar-extension
and descent comparisons.

For decomposition numbers use rows indexed by ordinary irreducibles and columns
by simple `k[G]`-modules. Thus `D = (d_{χφ})`, `C = DᵀD`, and the character of
the projective cover of the simple indexed by `φ` is `∑χ d_{χφ} χ`.
Pin the native Cartan orientation: `C i j = [P j : S i] : ℤ`,
where `P j` is the projective cover of the modular simple `S j`. This is
`TauCeti.cartanMatrix P S …`; convert to natural composition multiplicities
explicitly, and compare with QuiverRepresentations' transposed convention.
Use the native bilinear character pairing; on characters complex conjugation
is given by evaluation at the inverse group element. A modular block is a primitive central
idempotent of `k[G]`, not a Wedderburn matrix factor of a semisimple algebra.

## Milestone graph

| Layer | Inputs | Deliverable |
| --- | --- | --- |
| M0 | finite groups, QuiverRepresentations Layer 3 | element sections and the central block algebra API |
| M1 | M0, DVR completions, CharacterTheory §4.5 | modular systems, characteristic-zero splitting and integral lifting |
| M2 | M0–M1, exact `G₀`, InductionRestriction Layer 6 | Brauer characters, residue splitting and the decomposition map |
| M3 | M2, QuiverRepresentations Layer 3, projective `K₀` | projective-character lifting, Brauer reciprocity and Cartan comparisons |
| M4 | M0–M3, ordinary central characters | ordinary, integral and modular blocks and their comparison |
| M5 | M2–M4 | generalized decomposition numbers and section orthogonality |
| M6 | M0, M4 | Brauer homomorphisms, pairs and defect groups |
| M7 | M5–M6 | Brauer's three main theorems |
| M8 | M4–M7; local cores for the core applications | principal blocks, normal subgroups and finite-group exports |

### M0: the algebra and the element decomposition

Construct the commuting `p`-part and `p'`-part of every element. Prove uniqueness,
power, conjugation, subgroup, quotient and homomorphism formulas, and partition
`G` into sections by the conjugacy class of its `p`-part. Supply the corresponding
centralizer class parametrizations and section cardinalities.

Consume radical filtrations, composition multiplicities and the noncentral
primitive-idempotent API from QuiverRepresentations Layer 3. Establish
the Artinian centre instance, and apply the native complete primitive
idempotent decomposition there. Prove uniqueness up to reindexing, rather
than rebuilding primitive idempotents or the existence theorem. Construct block ideals as algebras
with unit the idempotent, module block projections, and the product equivalence
between the algebra and its blocks. Give equivalence and scalar-extension
transport with explicit preservation hypotheses; primitive idempotents need
not remain primitive under an arbitrary scalar extension.

### M1: modular systems and integral lattices

Construct the canonical example using a finite place of
`F := ℚ⟮TauCeti.Cyclotomic.complexRoot e⟯` over `p`, and prove the
parameterized statements under the stated common-system hypotheses. Take its adic completion `K`
and `O = adicCompletionIntegers`, using Mathlib's DVR instance in
`NumberTheory/NumberField/Completion/FinitePlace`. Prove the residue field is
`𝔽_p(ζ_{e'})` and construct the residue and fraction-field maps. Consume
CharacterTheory §4.5's Brauer splitting-field theorem to show `K` splits all
subgroups, since it contains the `e`-th roots of unity. Build the completion
and field adapters required for this application. Prove the prime-to-`p`
roots-of-unity lifting bijection and its product and power laws. Residue-field
splitting is proved in M2, not assumed here.

Every finite-dimensional `K[G]`-module has a `G`-stable `O`-lattice, free of the
correct rank. Construct one by summing translates of a lattice; prove finiteness,
torsion-freeness and fullness. Reduction of two such lattices has the same exact
`G₀(k[G])` class. Establish additivity, tensor compatibility, restriction,
induction and conjugation. Prove idempotent and projective-module lifting over
the complete order `O[G]`, including uniqueness of central idempotent lifts.

### M2: Brauer characters and decomposition

First work over an algebraic closure `k̄` of the residue field. Define the
Brauer character of a finite-dimensional `k̄[G]`-module on the `p`-regular
elements by the lift in the conventions; all needed eigenvalues already lie
in `k` because it contains the `e'`-th roots of unity. Prove conjugacy invariance,
additivity on exact sequences, tensor multiplication, duality, inflation,
restriction and induced-character formulas, with the domain restrictions visible.
Before using ordinary restrictions, prove that reducing a stable lattice gives
`χ|_{p-reg} = φ` for its Brauer character `φ`, by the roots-of-unity
comparison of M1. Relate ordinary complex models to `K`-models through their
common cyclotomic realization; M1 realizes elementary-subgroup characters
over `K` as well.
Prove independence of simple Brauer characters, that they form a complex basis
of class functions on the `p`-regular classes, and that their number is the
number of those classes. Prove a semisimple modular representation is determined
by its Brauer character; this does not assert that arbitrary extensions split.

Now prove `k` splits every subgroup of `G`. Use the finite-dimensional
semisimple quotient of `k[G]`, Wedderburn's theorem for finite division rings,
and the Brauer-character independence above: all prime-to-`p` eigenvalues
are in `k`, so every simple `k̄[G]`-module has invariant Brauer character under
the residue-field Galois group and descends to `k`. Prove the finite-field
descent and endomorphism-ring comparisons needed for this step. Identify the
simple-class bases and Brauer characters over `k` and `k̄` before using the
splitting assertion in lattice lifting.

Construct the surjective decomposition map from ordinary representation classes
to exact `G₀(k[G])` through lattice reduction, with its comparison to scalar
extension to `k̄`. Prove
surjectivity using ordinary Brauer induction from InductionRestriction Layer 6:
reduce to elementary subgroups, establish the elementary-group lifting results,
and use M1's induction-compatible reduction. These lifting results are targets
here, not assumptions. For an elementary group `E = C × Q`, with `C` cyclic
of order prime to the prime defining the group `Q`, its Sylow `p`-subgroup
is normal. Simple modules kill that subgroup and inflate from a `p'`-quotient;
M1's idempotent lifting lifts modules of that semisimple quotient. Reduce the
ordinary Brauer-induction identity for the trivial class and apply the
projection formula to an arbitrary modular class. The elementary lifts then
give integral surjectivity. Its character form is
`χ|_{p-reg} = ∑φ d_{χφ} φ` with unique nonnegative integer coefficients.
Prove compatibility with the native `G₀` operations and transport between
splitting modular systems.

For other splitting fields, prove that scalar extension preserves the simple basis and
compare the maps in a common algebraically closed overfield; do not assume a chosen
embedding between unrelated coefficient fields.

### M3: projective modules, reciprocity and the Cartan matrix

Consume the projective covers, their uniqueness and their classification by
simple heads from QuiverRepresentations Layer 3. Lift these projectives to
`O[G]`, extend to `K`, and define their ordinary characters.
Prove they vanish on `p`-singular elements. Prove Brauer reciprocity with the
orientation fixed above, `TauCeti.cartanMatrix P S … = DᵀD`, nonsingularity of that matrix, and the
duality between irreducible Brauer characters and projective characters under
the `p`-regular character pairing. Relate these statements to the native
projective/simple pairing and Cartan map, including the identification of bases.

### M4: blocks in the three coefficient rings

First construct ordinary primitive central idempotents over split `K`:
define the character formula over the cyclotomic field `F`, map it into
`K[G]`, and prove idempotence, orthogonality and completeness by comparison
in an algebraic closure with native `Representation.primitiveCentralIdempotent`.
This supplies the non-algebraically-closed-field comparison needed here.

Prove that reduction bijects the central primitive idempotents of `O[G]` and
`k[G]`. Their images in split `K[G]` are sums of ordinary primitive central
idempotents, defining the partition of ordinary irreducibles into `p`-blocks.
Prove agreement with equality of reduced ordinary central characters on
integral class sums. The finite classes of ordinary irreducibles, the modular
simple modules and the idempotents must be linked by proved bijections.

Prove `D` and `C` decompose by blocks, the ordinary and modular block-projection
formulas, and transport under conjugation and group isomorphism. Define the
principal block by its action on the trivial module and prove its uniqueness;
equivalently its idempotent has augmentation one. Do not define it by the
property of being a correspondent of a principal block elsewhere.

### M5: sections and generalized decomposition numbers

For a `p`-element `x` and a commuting `p`-regular `u`, define and prove
`χ(xu) = ∑φ d^x_{χφ} φ(u)`, with `φ` ranging over the irreducible Brauer
characters of `C_G(x)`. These generalized coefficients are cyclotomic integers,
not necessarily nonnegative integers. Prove their section orthogonality,
the class-algebra coefficient formulas, and the corresponding
integral change-of-basis statements.

Export block-section orthogonality: if the `p`-parts of `g` and `h` are not
conjugate, then for each ordinary `p`-block `B`,
`∑χ∈B χ(g) * conjugate(χ(h)) = 0`. Also export the full column-orthogonality
formulas within one section summed over all of `Irr(G)`, with centralizer
factors stated explicitly. For cross-section block orthogonality, use the
`p`-local integrality of the block idempotent and the trace of a local
idempotent matrix commuting with the two-sided class permutation. Develop
that trace/integrality lemma here. The block-restricted within-section
Cartan formula belongs after the second main theorem in M7.
Construct all comparison maps to the native ordinary character table.

### M6: Brauer maps and defect

Construct relative traces `Tr_Q^P : (k[G])^Q → (k[G])^P`, their
transitivity, conjugation, Mackey and product formulas, and their image
ideals `(k[G])^P_Q`. For a `p`-subgroup `P`, construct
`Br_P : (k[G])^P → k[C_G(P)]` by discarding coefficients outside `C_G(P)`.
Prove it is a unital algebra homomorphism: the multiplicativity proof must use
`P`-orbits and characteristic `p`. The coefficient projection on all of `k[G]`
is only linear, and must not be declared multiplicative there. Prove its
conjugation, subgroup and iterated-projection formulas.

Prove `ker Br_P = ∑_{Q<P} (k[G])^P_Q`, using traces from proper
subgroups of `P`. Prove Rosenberg's lemma for a primitive idempotent
lying in a sum of ideals: it belongs to one summand.

Define a Brauer pair `(P,b)` for a block `B` by the nonzero overlap of `Br_P(B)`
with the block idempotent `b` of `k[C_G(P)]`. Define and prove the inclusion
relation on such pairs, uniqueness of the pair below a given pair at each
subgroup, existence of maximal pairs, conjugacy of maximal pairs,
and the resulting defect groups. Prove agreement with the central-character
definition of defect. Establish defect-zero character/projectivity criteria
and that the principal block has Sylow `p`-subgroups as defect groups. Prove
that normal `p`-subgroups are contained in every defect group, in particular
the central subgroup `⟨x⟩` in the centralizer of a `p`-element `x`.
Prove the trace characterization of defect: `e_B` belongs to the global
relative-trace ideal for a defect group `D`, minimal up to conjugacy.
Develop the Brauer isomorphism between the corresponding relative-trace
parts of the centres of `k[G]` and `k[N_G(D)]`, with its primitive-idempotent
comparison; M7 consumes this to construct the first correspondence.

### M7: Brauer's main theorems

First construct central-character block induction `b↦b^G` for a block `b`
of `H` with defect group `D_b` and `C_G(D_b)≤H`; prove its uniqueness and
its compatibility with Brauer maps. In particular, for `Q=⟨x⟩` and `b` a
block of `C_G(Q)`, prove
`Br_Q(e_B)e_b≠0 ↔ b^G=B`, equivalently
`Br_Q(e_B)=∑_{b^G=B}e_b`. Use the central-character identity
`λ_{b^G}=λ_b∘Br_Q` on `Z(k[G])`.

Prove the first main theorem: for a `p`-subgroup `D` and
`N_G(D) ≤ H ≤ G`, Brauer correspondence bijects the blocks with defect group
`D` of `H` and of `G`. Construct correspondence from M6's pairs, prove
uniqueness and the inverse laws, and include the transport when replacing a
defect group by a conjugate.

Prove the second main theorem as the following compatibility. If `x` is a
`p`-element, `χ` belongs to the ordinary block `B` of `G`, and `φ` belongs to
the block `b` of `C_G(x)`, then `d^x_{χφ} ≠ 0` implies
`Br_{⟨x⟩}(e_B) * e_b ≠ 0`. Thus `(⟨x⟩,b)` is a Brauer pair for `B`, and
the generalized coefficient vanishes when this overlap is zero. With the
block-induction construction above, express the same theorem as
`d^x_{χφ} ≠ 0 → χ ∈ b^G`. Its domain condition follows since a defect group
`D_b` of `b` contains `⟨x⟩`, so `C_G(D_b) ≤ C_G(x)`. This is an actual
compatibility between M5's numbers and M6's independently constructed pairs.

Prove the third main theorem in the general block-induction form: if `b` is a
block of `H` with defect group `D` and `D*C_G(D) ≤ H`, its induced block `b^G`
is defined, and it is principal exactly when `b` is principal.
Export the local principal-block form for every `p`-subgroup `P` and
`P*C_G(P) ≤ H ≤ N_G(P)`: a block of `H` corresponds to `B₀(G)` under the
Brauer projections exactly when it is `B₀(H)`. State this relation as nonzero
overlap in the shared centralizer algebra, independently of a choice of defect
group for that particular block.

### M8: finite-group interfaces and examples

For a normal `p`-subgroup `N`, prove that `N` acts trivially on every simple
`k[G]`-module and identify the simple modules and Brauer characters with those
of `G/N` by inflation. Describe the image of each block idempotent under
`k[G] → k[G/N]` as a sum of quotient block idempotents, and prove the resulting
partition of quotient blocks. It need not be a bijection of blocks: the two
blocks of `𝔽₃[S₃/C₃]` belong to the image of the single block of `𝔽₃[S₃]`.

For a normal `p'`-subgroup `N`, construct the averaging central idempotent
`e_N = |N|⁻¹ ∑n∈N n` and the algebra equivalence `k[G]e_N ≃ k[G/N]`.
Prove the ordinary and Brauer character inflation laws and the corresponding
block bijection for blocks covering the trivial character of `N`, including
the principal block. Develop the covering relation and its conjugation and
restriction formulas for the other `G`-orbits of irreducible characters of `N`.

Prove that the intersection of the kernels of the ordinary irreducibles in
the principal `p`-block is `O_{p'}(G)`. Use the cores of LocalFiniteGroupTheory
L1 and give this as a subgroup equality, not just a statement about chosen
character rows. Expose the section, principal-block and kernel theorems for
`p = 2` to Z*, keeping its fusion argument outside this roadmap.

For Brauer characters, prove the required containment: every simple module in
the principal block is trivial on `O_{p'}(G)`, so its Brauer character has
value its degree on every element of this subgroup. This follows from the
normal-`p'`-subgroup inflation theorem above. It is not the ordinary-character
kernel equality: normal `p`-subgroups are also invisible to simple modular
representations. Z* consumes this containment for involution centralizers.

Compute the decomposition and Cartan matrices and identify the actual blocks
for `C_p` in characteristic `p`, for a cyclic group of order prime to `p`, and
for `S₃` at `p = 2` and `p = 3`. For `C_p`, there is one simple module, one
block and Cartan entry `p`; its regular module is not semisimple. For `S₃` at
`p = 2`, verify the defect-zero degree-two ordinary character and the principal
block containing the trivial and sign characters. Check all matrix orientation,
block projection and principal-kernel formulas on these examples.
At `p = 3`, with ordinary rows ordered trivial, sign, standard and modular
columns trivial, sign, check `D = [[1,0],[0,1],[1,1]]` and
`C = [[2,1],[1,2]]`; all three ordinary characters are in one block.

## References and provenance

- J.-P. Serre, *Linear Representations of Finite Groups*, Part III.
- J. L. Alperin, *Local Representation Theory*, Cambridge Studies in Advanced
  Mathematics 11, 1986.
- G. Navarro, *Characters and Blocks of Finite Groups*, LMS Lecture Note Series
  250, 1998, Chapters 2–6.
- J. M. Martínez's [block theory course notes](https://www.uv.es/jomimar8/pdfs/course%20notes.pdf),
  especially the explicit block-induction and principal-block formulations.
- Axiom's [third main theorem](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BrauerThirdMainTheorem.lean)
  and [section orthogonality](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BlockSectionOrthogonality.lean)
  are secondary proof sources. Their ordinary character and block definitions
  need comparison to native interfaces; their existence does not discharge
  M0–M8. Coordinate with the authors before adapting their code.
