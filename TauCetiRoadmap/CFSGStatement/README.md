# Roadmap: stating the classification of finite simple groups

**Summary.** Build a uniform classification proposition whose Lie-type branches are the
fixed-derived-central quotients of the simply connected Chevalley–Demazure groups, and prove
that these branches agree with the explicit represented models. The inputs are the native CFSG
indices and sporadic presentations, the canonical group construction of ReductiveGroups, and
the point-group interfaces of ChevalleyGroups. The substantial results are compatibility of
Steinberg maps with character pullback, the root/torus/Steinberg comparisons for every represented
model, the induced candidate-group comparisons, the Suzuki comparison, and equivalence with the
represented-model classification proposition. The endpoint is a definition of CFSG, not its proof.

## Scope and ownership

This roadmap owns the indexed specialization of the canonical group and its endomorphisms, the
comparison with each explicit family model, and assembly of the canonical classification
proposition. The comparisons identify independently defined objects. Neither defining a canonical
Steinberg map by conjugating a model map nor choosing a group from a classification theorem is a
construction of the requested object. Standard algebraic closures and quotient types are allowed.

The following work is already in the pinned libraries and is consumed rather than replanned:

- Mathlib's finite fields, algebraic closures, cyclic and alternating groups, free and presented
  groups, equalizers, commutator subgroups and central quotients.
- Tau Ceti's prime-power and valid-family indices, numbered diagram and length permutations,
  exceptional exponents, root-datum Steinberg maps and their power laws.
- The represented ambient groups and their root subgroups and Steinberg maps for all seventeen
  Lie-type constructors, including the spin, tripled D₄, minuscule, doubled E₆ and short-root models.
- The generic fixed-point and derived-central-quotient constructions and their transport APIs.
- The presentation language, its semantics theorem, all twenty-six sporadic presentations, and
  the represented-model `TauCeti.ClassificationStatement` with its universe transport.
- The generated Suzuki group and its equivalence with the represented Suzuki candidate.

The [root-systems roadmap](../RepresentationTheory/RootSystems/README.md), Layer 6, owns numbered
integral root data. [ReductiveGroups](../ReductiveGroups/README.md), Layer 9A and 9B, owns the
integral constructor, base change and generic represented carriers.
[ChevalleyGroups](../ChevalleyGroups/README.md), C2–C7, owns the canonical point interface,
endomorphisms, specialization equality and realization comparison theorem. These constructions
are supplied once; this roadmap specializes them to the indexed CFSG models.

Finiteness, simplicity, order formulas and recognition belong to
[CFSGBasicProperties](../CFSGBasicProperties/README.md), F0–F1, T1–T3 and P1–P2.
Classification of arbitrary Steinberg endomorphisms, Weyl correction, and completeness of diagram
conjugacy representatives are outside this statement-construction roadmap; an extension in that
direction is CFSGStatement, Part II. No result here depends on such a classification.
The index uses preferred representatives without asserting uniqueness of isomorphism types.

## Conventions

A Lie-type parameter d is a `TauCeti.ValidLieTypeIndex`, with underlying valid Dynkin type t,
prime characteristic p, and q = pᵉ with e > 0. Its field K is
`TauCeti.ValidLieTypeIndex.Closure`, the algebraic closure of `ZMod p`. Thus q ≥ 2;
there is no rank-zero, characteristic-one or q = 1 branch. Candidate groups live in `Type`;
the quantified group in the classification proposition may live in `Type u` for any universe u.
A validity proof restricts parameters; it asserts neither finiteness nor simplicity.

Number simple roots by `Fin t.rank` in Bourbaki order: printed node i + 1 has index i.
All roots and coroots use `TauCeti.DynkinType.simplyConnectedRootDatum`; positive and negative
simple root parameters are part of the pinning. In type B₂ the first simple root is long;
in G₂ the second is long; in F₄ the first two are long. Root subgroup parameters are additive,
expressed with `Multiplicative K` in the native group-homomorphism APIs.

The q in ²Aₙ(q), ²Dₙ(q), ²E₆(q) and ³D₄(q) is the small-field parameter: the graph factor has
order two or three and the corresponding iterate of the Steinberg map is q²- or q³-Frobenius.
For the half-Frobenius families q = p²ᵐ⁺¹, with m ≥ 1; the separate Tits index has p = 2,
m = 0 and q = 2. The native validity predicate keeps the small-field exclusions and duplicate
representative choices; it is used unchanged.

Composition acts rightmost first. A character map is pullback, χ ↦ χ ∘ F, so composition reverses
order on characters. If γ sends a simple node by σ, its character action is the inverse datum
automorphism. Exceptional root-parameter exponents are 1 on long roots and p on short roots;
these are indexed on the source root, not on the character-pullback target. In type A, with
J the antidiagonal matrix whose entries alternate 1, −1, the graph map is g ↦ Jg⁻ᵀJ⁻¹ and its
differential is X ↦ −JXᵀJ⁻¹.

**Checks.**

- In D₄, σ = (0 2 3) sends node 0 to 2 and fixes node 1; its pullback sends the simple-root
  character α₀ to α₃. At q = 2 the character Steinberg map sends α₀ to 2α₃ and its cube to
  8α₀. Using σ rather than σ⁻¹ would give 2α₂.
- For B₂, the exceptional parameter exponents at nodes 0, 1 are (1, 2), with products
  1·2 = 2·1 = 2 on applying the length swap twice. The B₂-to-C₂ symplectic adapter is also
  the node swap, but it preserves length: B₂ node 0 and C₂ node 1 are both long.
- Over 𝔽₅, take J = [[0,1],[−1,0]], H = diag(1,−1) and E = E₁₂. Then J² = −I,
  J⁻¹ = −J, and g(X) = −JXᵀJ⁻¹ gives g(H) = H, g(E) = E and
  g([H,E]) = [g(H),g(E)] = 2E. Omitting the inverse gives 3E on the first side and 2E
  on the second. In dimension three the same convention has J² = I, so that dimension
  alone would not detect the defect.

## Exact supplier contracts

### From Mathlib

Consume `ZMod`, `GaloisField`, `AlgebraicClosure`, `Multiplicative`, `alternatingGroup`,
`FreeGroup`, `PresentedGroup`, `MonoidHom.eqLocus`, `commutator`, `Subgroup.center` and group
quotients. The relevant files are `Mathlib/FieldTheory/Finite/GaloisField.lean`,
`Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean`,
`Mathlib/GroupTheory/SpecificGroups/Alternating.lean`, `Mathlib/GroupTheory/PresentedGroup.lean`,
`Mathlib/Algebra/Group/Subgroup/Ker.lean`, `Mathlib/GroupTheory/Commutator/Basic.lean`,
`Mathlib/GroupTheory/Subgroup/Center.lean` and `Mathlib/GroupTheory/QuotientGroup/Defs.lean`.
`Finite` and `IsSimpleGroup` are hypotheses on the group being classified, never hypotheses
inserted into the definition of a candidate.

### From Tau Ceti

All paths below are relative to the Tau Ceti repository.

- `TauCeti/GroupTheory/SpecificGroups/CFSG/Index.lean`: `TauCeti.PrimePower`,
  `TauCeti.LieTypeIndex.Valid`, `TauCeti.ValidLieTypeIndex`, `TauCeti.GraphTwistedIndex`,
  `TauCeti.SuzukiReeIndex`, `TauCeti.SporadicName` and `TauCeti.CFSGIndex`. Consume their field
  orders, characteristics, ranks and validity projections without a second parameter table.
  `TauCeti/GroupTheory/SpecificGroups/CFSG/Closure.lean` supplies
  `TauCeti.ValidLieTypeIndex.Closure` and its field and characteristic instances.
- `TauCeti/GroupTheory/SpecificGroups/CFSG/GraphTwisted.lean` and
  `TauCeti/GroupTheory/SpecificGroups/CFSG/SuzukiRee.lean` supply
  `TauCeti.GraphTwistedIndex.diagramPerm`, `TauCeti.SuzukiReeIndex.lengthPerm` and
  `TauCeti.SuzukiReeIndex.exponent` with the Cartan-matrix, length and exponent equations.
  `TauCeti/GroupTheory/SpecificGroups/CFSG/RootDatumAutomorphism.lean` supplies
  `TauCeti.GraphTwistedIndex.diagramPerm_mem_diagramSymmetry` and
  `TauCeti.GraphTwistedIndex.datumGraphAut`.
- `TauCeti/GroupTheory/SpecificGroups/CFSG/Datum/Steinberg.lean` supplies
  `TauCeti.GraphTwistedIndex.datumSteinberg` and `TauCeti.SuzukiReeIndex.datumSteinberg`.
  `TauCeti/GroupTheory/SpecificGroups/CFSG/Datum/Assembly.lean` supplies
  `TauCeti.ValidLieTypeIndex.datumSteinberg` and
  `TauCeti.ValidLieTypeIndex.exists_pow_datumSteinberg_eq_smulId`; the latter retains positive
  iterate and characteristic-power exponents. Its weight map is the character map to be matched.
- `TauCeti/GroupTheory/SpecificGroups/CFSG/Assembly/AmbientGroup.lean` supplies
  `TauCeti.ValidLieTypeIndex.AmbientGroup` and `TauCeti.ValidLieTypeIndex.simpleRootSubgroup`;
  `TauCeti/GroupTheory/SpecificGroups/CFSG/Assembly/LieType.lean` supplies
  `TauCeti.ValidLieTypeIndex.steinberg`, `TauCeti.ValidLieTypeIndex.FixedPoints` and
  `TauCeti.ValidLieTypeIndex.Group`. These are represented-model inputs to the comparisons.
- `TauCeti/GroupTheory/FixedSubgroup.lean`: `TauCeti.fixedSubgroup` and
  `TauCeti.fixedSubgroupCongr`. The definition is the equalizer with the identity; it requires
  only a group and an endomorphism and includes no finiteness or simplicity condition.
  `TauCeti/GroupTheory/FixedPointCandidate.lean`: `TauCeti.FixedPointCandidate` and
  `TauCeti.FixedPointCandidate.congr`, the latter requiring an equivalence intertwining the
  two endomorphisms. Its quotient is by the centre of the derived subgroup of the fixed group.
- `TauCeti/GroupTheory/Presentation/Relator.lean`: `TauCeti.Relator.toWord_toFreeGroup`.
  `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.lean`:
  `TauCeti.SporadicName.presentation`, `TauCeti.presentation_matchesMetadata` and
  `TauCeti.SporadicName.Group`. The dispatcher supplies actual presentation data in all 26 cases;
  the metadata theorem checks counts, not recognition of the presented groups.
- `TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Generated.lean`: `TauCeti.suzukiGroup`.
  `TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Generation.lean`:
  `TauCeti.SuzukiLieIndex.suzukiGroupEquivFixedPoints`.
  `TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Candidate.lean`:
  `TauCeti.SuzukiLieIndex.groupEquivSuzukiGroup`. Both equivalences take a valid Suzuki index,
  hence m ≥ 1, and compare the explicit symplectic model with the generated subgroup over
  `GaloisField 2 (2 * m + 1)`.
- `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean` supplies
  `TauCeti.CFSGIndex.Group`, `TauCeti.ClassificationStatement` and
  `TauCeti.classificationStatement_of_zero`. The proposition uses represented Lie-type models.
  `TauCeti/GroupTheory/SimpleGroupUniverse.lean` supplies
  `TauCeti.exists_mulEquiv_of_forall_finite_isSimpleGroup_zero` for any candidate family in `Type`.

### From TauCetiRoadmap.RootSystems

Consume Layer 6 of `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`: the numbered
simply connected integral datum, base, simple-root indices and long-root predicate. The native
names are `TauCeti.DynkinType.simplyConnectedRootDatum`,
`TauCeti.DynkinType.simplyConnectedBase` and `TauCeti.DynkinType.IsLongSimpleRoot`.

### From TauCetiRoadmap.ReductiveGroups

Consume Layer 9B's named items “The Chevalley–Demazure construction,” “Base change,” “Root
subgroup maps,” “Points over an algebraically closed field,” “The isomorphism theorem for pinned
groups,” “Special isogenies in characteristics two and three,” and “Explicit carriers with
numbered symmetries.” Layer 9A supplies their integral and admissible-lattice inputs. In particular,
the short-root G₂ and F₄ carriers and their special isogenies are supplied over 𝔽₃ and 𝔽₂,
respectively. These are full constructions, not existence witnesses extracted by choice.

### From TauCetiRoadmap.ChevalleyGroups

Consume C2's simply connected point group and numbered root and torus maps, on the specialization
of the ReductiveGroups constructor. Consume C4, “Points,” for equality of base change with the
closed subgroup scheme generated by the reduced root subgroups and the actual weight-lattice
torus, for a Chevalley datum and every field. Flatness alone is not this equality.

Consume C5's field Frobenius, pinned graph automorphisms, exceptional point isogenies, character-map
predicate and composition law, and determination by positive and negative simple root subgroups
in the simply connected case. Consume C6's comparison for Chevalley data with the same type and
weight lattice, matching roots and torus, including the SL and Sp comparisons. Consume C7's
agreement of the exceptional scheme morphism with the point isogeny. A comparison uses the actual
lattice of the represented datum; a faithful torus requires the full weight lattice.

## How to read the build

Layer 1 specializes the canonical point carrier. Layer 2 selects its independently defined
Steinberg maps and proves their character compatibility. Layer 3 compares every represented
model with that carrier. Layer 4 applies the native fixed-group and quotient functor to these
comparisons; Layer 5 identifies the canonical Suzuki branch. Layer 6 assembles the canonical
classification proposition and proves equivalence with the represented one. These are the
headline results recorded in `Suggested.lean`; its docstring identifies the canonical carriers
and interfaces that prevent their statements at the pins.

## Layer 1: the indexed canonical ambient group

### 1.1 Canonical points and pinning

For each valid d, define the canonical ambient group Gᶜ_d as the K-points of the simply connected
Chevalley–Demazure group of t, using ChevalleyGroups C2. This is one specialization of the shared
constructor. Write xᶜ_±i for its supplied positive and negative simple root maps from the additive
group of K, and Tᶜ for its supplied torus map from (Fin t.rank → Kˣ). Keep the all-root maps of C2 in scope;
these use the supplied root enumeration, not another copy of the datum. The maps have targets Gᶜ_d.

The basic API is the specialization of C2 and C4:

- Each root map sends 0 to 1, addition to multiplication and negation to inversion; it is
  injective, and agrees with the all-root map at the numbered simple root or its negative.
- The torus map is an injective group homomorphism; for every torus parameter s and root α,
  conjugation sends xᶜ_α(u) to xᶜ_α(α(s)u).
- Over K the positive and negative simple root subgroups generate Gᶜ_d. Hence equality of
  homomorphisms out of Gᶜ_d can be tested on both signs of the simple roots.

*Needs:* native valid indices and closures; RootSystems Layer 6; ChevalleyGroups C2 and C4.

**Checks.**

- In A₁, x₊(2)x₊(3) = x₊(0) = I over 𝔽₅; a multiplicative rather than additive parameter
  would give x₊(1), a different matrix.
- In SL₂(𝔽₅), diag(2,3) conjugates x₊(1) to x₊(4). The root character is s², not s:
  2² = 4 while 2 ≠ 4.
- The same root matrices inside SL₂(𝔽₅) × C₂ generate a subgroup of order 120 rather than
  240. Thus an extra inert factor cannot satisfy the generation requirement, even though it
  satisfies every displayed root equation.

### Examples

For d = A₁(7), Gᶜ_d is SL₂ over the algebraic closure of 𝔽₇. For untwisted and graph-twisted
D₄ with the same p, the ambient canonical group is the same; only the selected map differs.
Rank 0 never reaches this definition because the valid index subtype excludes it.

### Dependencies

RootSystems Layer 6 and ChevalleyGroups C2, C4, using ReductiveGroups 9B's constructor and base
change; the native index and closure modules. No represented-model comparison is needed here.

## Layer 2: the indexed Steinberg maps and character actions

### 2.1 Ordinary and graph-twisted maps

For a `TauCeti.GraphTwistedIndex` d, define Fᶜ_d on Gᶜ_d as γ_σ ∘ Frob_q, where σ is the native
diagram permutation and γ_σ is ChevalleyGroups C5's pinned automorphism. On untwisted branches
σ is the identity. The permutations are the A-chain reversal, D-fork swap, E₆ swaps (0 5)(2 4),
and D₄ cycle (0 2 3), respectively. Define neither a second permutation table nor a new datum map.

The specialization API and character-compatibility target are:

- For every positive or negative simple root and u ∈ K,
  Fᶜ_d(xᶜ_±i(u)) = xᶜ_±σ(i)(u^q). Frobenius raises the parameter to q on every root.
  General-root graph formulas retain C5's signs, rather than imposing sign 1 everywhere.
- The graph factor commutes with Frobenius. With r the native twist order, r = 1, 2 or 3,
  the r-th iterate of Fᶜ_d is qʳ-Frobenius.
- Prove that the character pullback of Fᶜ_d is the weight map of
  `TauCeti.GraphTwistedIndex.datumSteinberg`, namely q times the inverse datum graph action.
  In C5's character-map predicate use Tᶜ explicitly. Derive this from C5's character equations
  for the two factors and its contravariant composition law, not from an arbitrary abstract
  endomorphism of torus points.

*Needs:* Layer 1; native diagram symmetry membership and datum Steinberg map; ChevalleyGroups C5,
“Field maps,” “Graph automorphisms” and “Character maps are data.”

**Checks.**

- In A₂ with q = 2, the graph swap sends node 0 to 1 and two iterates send x₀(u) to x₀(u⁴).
  In 𝔽₄ with u² = u + 1, u⁴ = u but u² ≠ u, distinguishing one iterate from two.
- In D₄ with q = 2, the successive source nodes 0, 2, 3 return to 0 and exponents 2, 4, 8
  give F³(x₀(u)) = x₀(u⁸). On characters, the successive nodes are 0, 3, 2, 0 instead.
- The A₁ signed-antidiagonal computation in Conventions has g(H) = H, g(E) = E and both
  bracket values 2E over 𝔽₅. This is the differential of the group map with J⁻¹; a final J
  would make those bracket values 3E and 2E.

### 2.2 Half-Frobenius maps

For a `TauCeti.SuzukiReeIndex` d, let τ be the exceptional point isogeny of ChevalleyGroups C5
for (B₂,2), (G₂,3) or (F₄,2), with its specified simple-root normalization. Define Fᶜ_d = τ²ᵐ⁺¹;
for the Tits index set m = 0. The mathematical identification of these odd powers with the
Suzuki–Ree construction uses Radu, arXiv:2108.06291v2, §2.2, printed p. 4, with C₂ transported
to the B₂ numbering (ree2021 line 133). The m = 0 Tits specialization is the native index's
separate convention; no simplicity theorem is inferred from that passage.

The API and character-compatibility target are:

- On both signs of a simple root, τ sends xᶜ_i(u) to xᶜ_λ(i)(u^aᵢ), where λ is the native
  length permutation and aᵢ is 1 for long roots and p for short roots. Consume τ² = Frob_p
  with this normalization; the square law by itself does not specify the map.
- Iterating gives Fᶜ_d(xᶜ_i(u)) = xᶜ_λ(i)(u^(pᵐ aᵢ)) and (Fᶜ_d)² = Frob_q, with
  q = p²ᵐ⁺¹. These equations include both signs of the simple roots.
- Prove that the character pullback of Fᶜ_d is the weight map of
  `TauCeti.SuzukiReeIndex.datumSteinberg`, using C5's character compatibility for τ and
  composition. The uniform character-compatibility theorem uses
  `TauCeti.ValidLieTypeIndex.datumSteinberg` on both branches.

*Needs:* Layer 1; native exceptional exponents, length permutations and datum Steinberg maps;
ChevalleyGroups C5, “Exceptional isogenies” and the character composition law.

**Checks.**

- At m = 1 in B₂, the source exponents are (2,4) and their products under the swap are
  8,8, giving q = 8. Using τ ∘ Frob_q would give exponents (8,16) and square exponent 128.
- At m = 1 in G₂, the source exponents are (9,3), whose products are 27,27. At m = 0
  in F₄ they are (1,1,2,2), paired by reversal to products 2,2,2,2.
- In 𝔽₈, for s of order seven, the B₂ torus equation requires a_short = 2a_long. The
  reversed assignment (2,1) instead forces s⁻¹ = s⁻⁴; their exponents modulo seven are
  6 and 3, unequal. Testing only 𝔽₂, where the only unit is 1, would miss this error.

### Examples

The native index selects particular diagram permutations. In D₄ the raw symmetry (0 2) is not
literally the selected fork swap (2 3); conjugating by (0 3) gives (2 3). Likewise (0 2 3) and
(0 3 2) are distinct permutations conjugate by (2 3). These finite permutation identities do
not assert a classification of arbitrary Steinberg maps or change the selected indices.

### Dependencies

Layer 1; ChevalleyGroups C5; the native graph, exceptional and datum modules. C7 is needed for
comparison with scheme morphisms in Layer 3, not for the definition of these point maps.

## Layer 3: comparison with every represented model

### 3.1 Root, torus and Steinberg compatibility

For every valid index d, construct an equivalence e_d from the represented ambient group
`TauCeti.ValidLieTypeIndex.AmbientGroup` to Gᶜ_d, over the same K. Prove its root and torus
compatibility, then its intertwining equation with the independently defined Layer 2 map:

- For each positive and negative simple root and every u ∈ K,
  e_d(x_model,±i(u)) = xᶜ_±i(u), after the explicit B₂-to-C₂ adapter where necessary.
- For every s : Fin t.rank → Kˣ, e_d(T_model(s)) = Tᶜ(s), using the full weight lattice
  and the same fundamental-weight coordinates on both sides.
- For every g in the model, e_d(F_model(g)) = Fᶜ_d(e_d(g)). The inverse equivalence satisfies
  the reverse root, torus and intertwining equations. Two equivalences satisfying the root
  equations are equal by simple-root generation.

The route is to instantiate ChevalleyGroups C6 on the model's Chevalley datum and full weight
lattice, use C4 for specialization of generated schemes, and use C5 to identify the maps from
their simple-root values. For the exceptional model maps use C7 to identify the algebraic
isogeny with C5's point map. This is a comparison of actual carriers, not an abstract existence
of a group with the same root system. Each row below is a required instance:

| Indexed families | Represented model to compare | Required identification |
| --- | --- | --- |
| A, ²A | Standard SL | Defining representation; signed-antidiagonal graph map |
| B, including rank two | Full-weight type-B spin model | Full character lattice, all characteristics |
| C | Standard Sp | Symplectic root numbering |
| D, ²D | Full-weight type-D spin model | Full character lattice and fork swap |
| ³D₄ | Tripled module 8ᵥ ⊕ 8ₛ ⊕ 8꜀ | Triality cycles all three summands |
| E₆ | 27-dimensional minuscule model | Full weight lattice |
| ²E₆ | Doubled 27 + 27-dimensional model | Numbered graph symmetry |
| E₇ | 56-dimensional minuscule model | Full weight lattice |
| E₈, F₄, G₂ | Adjoint Geck model | Root lattice equals weight lattice |
| Suzuki | Rank-two standard symplectic model | B₂-to-C₂ node adapter and special isogeny |
| Ree G₂ | Short-root model of dimension 7 over 𝔽₃ | Specialization and exceptional isogeny |
| Ree F₄, Tits | Short-root model of dimension 26 over 𝔽₂ | Specialization and exceptional isogeny |

For the short-root rows, apply C4's specialization equality only after supplying a Chevalley
datum with its integral admissible lattice and actual weight torus. Identify its base change
with the subgroup scheme generated over the prime field by the reduced roots and torus, then
apply C6 over K. A proof that the integral coordinate algebra is flat does not replace this
step. The two-dimensional zero-weight space of the F₄ module retains the supplier's chosen
basis and root normalizations throughout the comparison.

*Needs:* Layers 1–2; the native model assembly and its family root, torus and Steinberg maps;
ReductiveGroups 9A and 9B's explicit carriers; ChevalleyGroups C4 “Points,” C5, C6 and C7.

**Checks.**

- In rank-two symplectic coordinates the adapter sends B₂ node 0 to C₂ node 1 and back
  to 0. Both roots are long, with exceptional exponent 1; the identity adapter would pair
  exponents 1 and 2 and fail the intertwining equation on an element of 𝔽₄ outside 𝔽₂.
- For D₄ the three eight-dimensional summands give dimension 24. Triality cycles them;
  the two spin summands alone have dimension 16 and are not stable under that cycle. The
  full tripled datum, not an unmarked 8-dimensional orthogonal image, is the comparison input.
- In A₁ the root lattice has index 2 in the weight lattice. The adjoint map SL₂(𝔽₅) →
  PGL₂(𝔽₅) kills −I, whose two diagonal entries are 4, so it cannot be the required
  equivalence. In characteristic two μ₂ has only one field-valued point but has the
  nontrivial point 1 + ε over 𝔽₂[ε]/(ε²), since (1 + ε)² = 1; checking only field-valued
  points would not certify a simply connected group-scheme model.

### Examples

The canonical B₂ carrier receives comparisons both from the type-B spin model and from the
rank-two symplectic Suzuki model. Their relationship is the composite of these proved
comparisons. On a simple root it sends x_i(u) to x_i(u), so at u = 0 both composites give 1
and at u = 1 both give the same nonidentity root element. This does not replace either input
by a definitionally equal type.

### Dependencies

Layers 1–2; all model rows above; ChevalleyGroups C4–C7 and ReductiveGroups 9A–9B.
The generic realization and specialization theorems remain with their suppliers.

## Layer 4: canonical candidates and transport

### 4.1 Indexed fixed-derived-central quotient

For every valid d, define Hᶜ_d by applying `TauCeti.fixedSubgroup` to Fᶜ_d and define C_d by
applying `TauCeti.FixedPointCandidate` to Fᶜ_d. Thus C_d = [Hᶜ_d,Hᶜ_d]/Z([Hᶜ_d,Hᶜ_d]).
The centre is taken inside the derived subgroup, not inside the ambient group or the fixed group.

The specialization API is:

- Membership in Hᶜ_d means Fᶜ_d(g) = g, with the inherited group structure and injective
  inclusion Hᶜ_d → Gᶜ_d.
- The derived subgroup maps onto C_d by the quotient homomorphism, whose kernel is exactly
  its own centre. The construction supplies a group without adding finiteness or simplicity.
- Apply `TauCeti.fixedSubgroupCongr` and `TauCeti.FixedPointCandidate.congr` to e_d and the
  Layer 3 intertwining equation. Obtain equivalences from the represented fixed group to Hᶜ_d
  and from `TauCeti.ValidLieTypeIndex.Group` to C_d, with value equations on representatives
  and inverses. In particular, quotient transport is tied to the specific e_d.

*Needs:* Layers 1–2 for the definitions; Layer 3 for the comparisons; native fixed-subgroup
and fixed-point-candidate transport. The transport laws are consumed, not proved anew.

**Checks.**

- For the identity endomorphism of S₃ the fixed group has order 6, its derived subgroup
  has order 3 and its centre has order 3, so the candidate has order 1. Quotienting by
  Z(S₃), of order 1, instead would give order 3.
- For the identity of Q₈ the fixed group has order 8, its derived subgroup is {±1} of
  order 2 and the candidate again has order 1. The full central quotient Q₈/Z(Q₈) has
  order 4 and is not the defined object.
- For the trivial endomorphism of S₃, the fixed group, its derived subgroup and its
  candidate all have order 1. For the identity on C₅ the fixed group has order 5 but
  both the derived subgroup and candidate have order 1; abelian fixed groups need not
  survive this construction.

### Examples

The identity equivalence on S₃ induces the identity on six fixed elements and the sole
candidate element. Conjugation by a transposition preserves its three-element derived subgroup
and again induces the identity on the singleton quotient. The Tits index uses the same recipe
with q = 2 and Fᶜ = τ; its separate name does not alter the order of the two operations.

### Dependencies

Layers 1–3 and the native fixed-group and quotient modules. No theorem that an indexed
candidate is finite, perfect or simple is required to define it or transport it.

## Layer 5: the canonical Suzuki comparison

### 5.1 Comparison with the generated group

For every m ≥ 1, let d be the Suzuki index with q = 2²ᵐ⁺¹. Construct an equivalence
C_d ≃* `TauCeti.suzukiGroup m`, with the subgroup on the right regarded as a group. Compose
the inverse of Layer 4's comparison with
`TauCeti.SuzukiLieIndex.groupEquivSuzukiGroup`, retaining the native scalar-extension and
coordinate-change value equations. On a quotient class represented by a fixed model element,
this composite returns exactly its native generated-group preimage. The inverse takes a
generated element through the native embedding and then through the canonical comparison.

*Needs:* Layer 4 for the Suzuki index; the native Suzuki candidate equivalence and its value
lemmas in `TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Candidate.lean`, declarations
`TauCeti.SuzukiLieIndex.groupEquivSuzukiGroup_mk` and
`TauCeti.SuzukiLieIndex.groupEquivSuzukiGroup_symm_apply`.

**Checks.**

- At m = 1 the two constructions have q = 8, and their matrix coefficient field has
  2³ = 8 elements, not 2⁷ = 128 or 2⁶ = 64.
- At m = 2 they have q = 32 and source-root exponents (4,8), whose products are 32,32.
  This checks the field and half-Frobenius parameters independently of the minimal case.
- At m = 0 the field order is 2 and the native Suzuki validity predicate is false, so this
  comparison has no input. The separate Tits index is valid with q = 2 and type F₄,
  not B₂; it cannot accidentally select the Suzuki equivalence.

### Examples

At m = 1, the unitriangular generator with both parameters zero is I. Its native embedding,
canonical image and quotient image are all the identity, and the comparison returns I. A
nonzero root parameter must retain the Layer 3 node adapter; the value law is stronger than
an unmarked existence of an isomorphism between the two groups.

### Dependencies

Layer 4 for the canonical Suzuki candidate and the native Suzuki generation and candidate
modules. No external construction is required as a library dependency.

## Layer 6: the canonical classification proposition

### 6.1 Assembly and comparison of statements

Define a canonical candidate family C on `TauCeti.CFSGIndex`: on cyclic and alternating indices
use `Multiplicative (ZMod p)` and `alternatingGroup (Fin n)`; on a Lie-type index use Layer 4's
C_d; on a sporadic name s use `TauCeti.SporadicName.Group s`. Define the canonical classification
proposition in universe u to say: for every G : Type u with group, finiteness and simplicity
instances, there is an index i and a nonempty type of multiplicative equivalences G ≃* C(i).
This is a proposition definition; its proof is outside this roadmap.

The assembly API and final comparison theorem are:

- The family has a dependent group instance and the four stated branch equations. Its input
  contains the prime, degree and valid-index evidence; it never assigns a dummy group to
  invalid data. Sporadic data and their source metadata are consumed unchanged.
- Construct, for each i, an equivalence from `TauCeti.CFSGIndex.Group i` to C(i), using Layer 4
  on the Lie branch and identity equivalences on the other three branches.
- Prove, for every universe u, that the canonical proposition is equivalent to
  `TauCeti.ClassificationStatement`. Transport a witness by composing with the indexed
  equivalence, and use its inverse for the reverse implication. Apply the native generic
  universe-transport theorem to C to obtain the implication from universe zero to u.

*Needs:* Layer 4; the native index, sporadic presentation dispatcher and represented
classification family; native simple-group universe transport. Layer 5 is a separate comparison
and is not needed to define the proposition.

**Checks.**

- At the cyclic index p = 2 the unchanged branch has order 2; at the alternating index
  n = 5 it has order 5!/2 = 60. The identity comparisons preserve each element, and no
  Lie-type construction is used for either branch.
- A group with one element is not simple in Mathlib's sense, which includes nontriviality.
  A copy of C₂ in a larger universe still has two elements; transport through a two-element
  type preserves the prime-order classification witness rather than restricting u to zero.
- A two-entry family containing C₂ and C₃ has the same image of isomorphism types after
  swapping the entries: its orders remain the set {2,3}. Replacing C₃ by C₂ changes that
  image to {2}. Thus the existential proposition cannot validate the names of sporadic
  presentations or replace the source-to-word provenance attached to the native data.

### Examples

For every i the composite of its comparison and inverse is the identity on the represented
candidate, and the reverse composite is the identity on C(i). This gives both directions of
the proposition comparison without proving either proposition. No uniqueness quantifier or
candidate finiteness/simplicity premise is inserted into the statement.

### Dependencies

Layer 4, native sporadic data and classification assembly, and native universe transport.
There is no dependency on classification of Steinberg maps or on downstream simple-group theory.

## Downstream consumers

CFSGBasicProperties F0–F1 and T1–T3 can transport statements about the represented fixed groups
through Layer 4. Its P1–P2 sporadic work uses the same native presentations. Consumers of CFSG
may assume the canonical proposition and use Layer 6 to obtain the represented proposition,
or conversely; neither direction proves CFSG. Comparisons of other realizations must retain
root, torus and endomorphism compatibility when those structures matter.

## References

- A.-C. Radu, *On the cohomology of the Ree groups and kernels of exceptional isogenies*,
  [arXiv:2108.06291v2](https://arxiv.org/abs/2108.06291v2), §2.2, printed p. 4
  (ree2021 line 133), for the half-Frobenius and odd-power construction.
- The exact native module/declaration locators and roadmap section contracts above specify
  the numbered root data, model realizations, presentation data and transport results consumed
  here. Literature identifications of individual sporadic presentations are part of their
  supplied provenance, not consequences of the classification proposition.
- [FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean), an independent
  permutation-group formalization, is a potential source of comparisons for the named groups
  it constructs. Coordinate with its author before integrating code, as required by the
  repository's contribution rules; it is not a dependency of these target signatures.
