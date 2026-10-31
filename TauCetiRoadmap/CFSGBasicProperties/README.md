# Roadmap: finiteness and simplicity of the groups on the CFSG list

The [CFSGStatement roadmap](../CFSGStatement/README.md) constructs a group
`CFSGIndex.Group` for every entry on its list and states that every finite simple group is
isomorphic to one of them. This roadmap proves the complementary, concrete assertion: **every
group on that list is finite and simple**. The endpoint is the pair of theorems

```lean
theorem CFSGIndex.finite (i : CFSGIndex) : Finite i.Group
theorem CFSGIndex.isSimpleGroup (i : CFSGIndex) : IsSimpleGroup i.Group
```

Here `i.Group` is *exactly* the carrier defined by CFSGStatement: `Multiplicative (ZMod p)`,
Mathlib's alternating group, the derived central quotient of the Steinberg fixed points, or the
group of the recorded sporadic presentation. An isomorphic group constructed for a proof must be
connected back to that carrier by a proved `MulEquiv`. Neither the validity proof in a Lie index
nor the word “sporadic” supplies a finiteness or simplicity hypothesis.

The endpoint says every **listed** group has the two properties. It does not prove
`ClassificationStatement`, which says every finite simple group **occurs** on the list. It also
does not assert pairwise nonisomorphism or a unique index for each group.

The sporadic lane also develops the Monster's complete conjugacy structure in P2M:
actual representative words, centralizers, power and fusion data, and the count 194 for both
classes and irreducible complex characters. It reuses native conjugacy and character theory;
no proof of the classification proposition or prior verification of the full Monster character
table is a prerequisite. The companion prototype displays selected P0/P2M interfaces only;
the full programme below remains definitive.

The intended Tau Ceti home is `TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/` for
family results, with reusable presentation, group-action, finite-field, and Tits-system theorems
in their existing mathematical homes. The final assembly imports the family theorems; it does not
recompute their proofs by unfolding the four-way index.

## Starting points and ownership

- CFSGStatement owns `CFSGIndex`, its validity ranges, its seventeen Lie-type constructors,
  `ValidLieTypeIndex.Group`, `SporadicName.presentation`, and `SporadicName.Group`. Every
  Lie-type branch is the derived central quotient of the fixed points of its actual Steinberg
  endomorphism `d.steinberg` on `d.AmbientGroup`. CFSGStatement L0 designates each family's
  carrier: classical matrix groups and explicit spin, weight-module or short-root carriers
  are admissible alongside the pinned construction. These carriers are not definitionally
  the pinned Chevalley--Demazure points. L5 owns their root-subgroup-preserving comparison
  with those points, intertwining the actual Steinberg maps. Consume that comparison when
  transporting a theorem proved on the pinned carrier; a direct proof on the designated
  explicit carrier does not wait for L5. CFSGStatement separately owns L4, identifying the
  Suzuki branch with Mathlib's `suzukiGroup`; it can transport results but is not a prerequisite
  for the basic-property theorems.
- The [Chevalley groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1d6918b25647df1f606ccae78241fc75527d50ee/TauCetiRoadmap/ChevalleyGroups/README.md) owns the theory of the ambient
  group: root subgroups for every root, the commutator formula, the Bruhat decomposition and Tits
  system of the group over a field, its centre, Steinberg's presentation, generation of the points
  over an algebraically closed field by root subgroups, and the Frobenius, graph, and exceptional
  endomorphisms with their action on root subgroups (C2 to C5 there). Apply these results to
  their actual carrier: on a different designated explicit carrier, either transport the
  needed root calculus through a proved compatible equivalence or establish it directly as
  part of T1/T3 below. L0's numbered simple-root data alone do not supply this full theory. The
  [ReductiveGroups roadmap](../ReductiveGroups/README.md) owns abstract Borel, root-datum, and
  Bruhat theory. The present roadmap owns the remaining structure theory of **finite fixed points**: the
  finite-field descent of a Steinberg map, the twisted root groups, the BN-pair of the fixed-point
  group, and the resulting simplicity theorem. Existing `TauCeti.TitsSystem` and its Bruhat-cell
  API are the starting interface; extend them for the general group-theoretic theorems below. The
  [Mathlib BN-pair work](https://github.com/leanprover-community/mathlib4/pull/40363) informs
  names and structure, while Tau Ceti supplies what the endpoint needs regardless of its timing.
- [Rank24LatticeConstructions, Layer 6][rank24] owns the canonical Construction-B-and-odd-shift
  Leech lattice, its rational form and coordinate/congruence API. Consume that lattice; this
  roadmap owns its sporadic automorphism groups and their representation comparisons, not a
  second Leech construction. [AlgebraicCodingTheory](../../Completed/AlgebraicCodingTheory/README.md)
  supplies the chosen Golay code and code theory, and excludes the Mathieu identification.
- [SporadicOrders, O0–O2][sporadic-orders] owns the ten canonical ATLAS permutation models
  listed in P1, their orders and presentation surjections, using the Hex permutation-group
  kernel checker. This roadmap owns their presentation upper bounds, recognition and
  simplicity, and the four additional P1 models. Consume that checker for finite permutation
  order/membership certificates; its certificates do not bound abstract presented groups.
- [CertifiedPermutationComputation, §§2.1–2.2][certified-perm] owns the shared signed-word,
  orbit-witness and primitivity interfaces. Reuse or prove adapters between those formats,
  Mathlib actions and Hex certificates. Its Jordan recognition or randomized-search results
  are not sporadic simplicity theorems and are not prerequisites for this programme.
- Mathlib supplies prime-order cyclic groups, simplicity of alternating groups,
  and `MulAction.IwasawaStructure.isSimpleGroup`. Native
  [`BasicProperties/Elementary`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/Elementary.lean)
  already specializes finiteness and simplicity to the exact elementary CFSG carriers.
- Consume `ValidLieTypeIndex.finite_fixedPoints` and `ValidLieTypeIndex.finite` from
  [`BasicProperties/LieTypeFinite`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/LieTypeFinite.lean).
  F0–F1 below record the native fixed-point and branch-iterate APIs; they are
  existing inputs, not prerequisites awaiting a new finiteness proof.

Every proof of `IsSimpleGroup` must also establish the candidate is nontrivial. A proof that a
quotient is simple because an assumed target is simple, or that a presentation is finite because
the source calls it a finite group, does not discharge an item.

## Milestone graph

| Item | Depends on | Deliverable |
| --- | --- | --- |
| E0: elementary branches (native) | BasicProperties/Elementary | consume exact cyclic/alternating finiteness and simplicity |
| F0: fixed-point criterion (native) | FixedSubgroup/MatrixCoordinates, FixedPointCandidate | consume finite-coordinate and transport APIs |
| F1: Lie-type finiteness (native) | BasicProperties/LieTypeFinite, Assembly/LieType | consume designated-carrier finiteness and branch iterate formulas |
| T0: abstract simplicity machinery | `TauCeti.TitsSystem`, Mathlib group actions | a normal-subgroup/simplicity criterion for a split BN-pair with root groups |
| T1: fixed-point root calculus | T0, actual-carrier ambient calculus or compatible transport of Chevalley groups C2–C5, CFSGStatement L1–L3 | Steinberg descent, twisted root groups, BN-pairs, and root relations on the fixed points of the ordinary and graph-twisted families |
| T2: ordinary and graph-twisted simplicity | T1, native LieTypeFinite | `IsSimpleGroup d.Group` on those thirteen constructors, including valid small fields |
| P0: presentation and action certificate tools | native presentations and Schreier API, CFSGStatement S0, shared Hex/word/orbit interfaces | sound finite-index, normal-form, finite-action, and normal-closure certificate checkers |
| T3: Suzuki, Ree, and Tits simplicity | T0, native LieTypeFinite, P0, actual-carrier ambient calculus or compatible transport of Chevalley groups C2–C5, CFSGStatement L2–L3 | `IsSimpleGroup d.Group` on all four half-Frobenius constructors |
| P1: externally constructed sporadics | P0, CFSGStatement S1, SporadicOrders O0–O2 for ten canonical models | proved recognition and basic properties for the fourteen names with existing Lean permutation models |
| P2: remaining sporadics | P0, P1, T1–T3 as used by local groups, CFSGStatement S1, Rank24LatticeConstructions Layer 6, Golay code | explicit finite models, recognition, and simplicity for the other twelve presented groups |
| P2M: Monster conjugacy structure | P0 conjugacy tools; P2 Monster model, local subgroups and recognition; native character theory | explicit complete class representatives, centralizers and power/fusion data for the exact Monster carrier; 194 classes and irreducible complex characters |
| A0: assembly | native Elementary and LieTypeFinite, T2, T3, P1, P2 | the two uniform `CFSGIndex` theorems above |

The rows are mathematical dependencies, not a requirement for one PR per row. The finite-field,
Lie-structure, and sporadic lanes can progress independently once their listed inputs exist.

## E0: cyclic and alternating branches

Consume `CFSGIndex.finite_cyclic`, `CFSGIndex.isSimpleGroup_cyclic` and
`CFSGIndex.isSimpleGroup_alternating` from `BasicProperties/Elementary`.
Finiteness of the alternating carrier is already inferred from Mathlib.
These are statements about the exact indexed types; no new model is required.

## F0–F1: native finiteness and realization comparisons

**F0 is implemented.** Consume
[`FixedSubgroup/MatrixCoordinates`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/FixedSubgroup/MatrixCoordinates.lean):
`TauCeti.finite_fixedSubgroup_of_iterate_apply_eq_pow`,
`TauCeti.finite_fixedSubgroup_of_iterate_eq_iterate`,
`Subgroup.finite_fixedSubgroup_of_iterate_eq_iterate`, and
`Representation.finite_fixedSubgroup_of_iterate_apply_eq_pow`.
For an injective map into a finite matrix type over an integral domain,
these theorems bound fixed-point coordinates by roots of `X^m-X` when an
iterate acts by `x ↦ x^m`, `m > 1`. They need neither a characteristic
hypothesis nor a positive iterate number. Consume `fixedSubgroupCongr`,
`FixedPointCandidate.congr` and `finiteFixedPointCandidate` for intertwining
transport and the derived central quotient.

**F1 is implemented for every designated carrier.** Consume
`ValidLieTypeIndex.finite_fixedPoints` and `ValidLieTypeIndex.finite`, including
the Tits group and every retained small parameter. Branch iterate formulas are
already supplied by `steinberg_steinberg_of_usesHalfFrobenius` and
`iterate_steinberg_twistOrder_of_not_usesHalfFrobenius` in
[`Assembly/LieType`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/SpecificGroups/CFSG/Assembly/LieType.lean),
together with the constructor Frobenius formulas and `card_fixedField`.
T2, T3 and A0 consume these results directly.

When T1 or T3 uses a different realization to establish root calculus or
simplicity, that consuming milestone owns the needed comparison. For another
algebraic-closure ambient with endomorphism `F'`, prove an intertwining
`MulEquiv e` with `e (d.steinberg g) = F' (e g)`. Any new coordinate argument
concerns `F'` on its own realization. For a finite-field model, compare it
with the actual fixed points and then identify derived subgroups and centres
to reach `d.Group`. Native `TypeALieIndex.specialLinearEquivFixedPoints` in
[`BasicProperties/TypeA`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/TypeA.lean)
and `TypeCLieIndex.symplecticEquivFixedPoints` in
[`BasicProperties/TypeC`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/TypeC.lean),
with `DerivedCentralQuotient.congr`, provide existing patterns. Match ranks
and validity ranges explicitly. CFSGStatement L5 is needed only when using
its pinned-carrier comparison; designated-carrier finiteness itself needs no
new comparison.

## T0: a reusable simplicity criterion

Consume native `TauCeti.TitsSystem.bruhatCell_injective`, `disjoint_bruhatCell_iff`, and
`existsUnique_mem_bruhatCell` from `TitsSystem/Bruhat/Uniqueness`; distinct generic Bruhat
cells are already supplied. Consume native `TauCeti.TitsSystem.standardParabolicOrderIso`
from [Parabolic/Classification](https://github.com/TauCetiProject/TauCeti/blob/a9d0ba7b634affde557687933f3cb3c9b266c29d/TauCeti/GroupTheory/TitsSystem/Parabolic/Classification.lean)
for standard-parabolic classification. Extend the remaining Coxeter/split-structure
API needed here: specify `U ≤ B`, its normality and solvability, the complement `B ∩ N`, and
the product and intersection equations of a split BN-pair.
Prove the Tits normal-subgroup criterion in the following form. Put
`Z = ⋂_{h : H} hBh⁻¹` and let `H⁺` be the normal closure in `H` of `U`.
If the Coxeter graph is connected and nonempty, `Z ∩ U = 1`, and `H⁺` is
perfect, then `Z ∩ H⁺` is its centre and `H⁺ / (Z ∩ H⁺)` is simple whenever nontrivial.
Prove the normal-subgroup theorem behind this criterion, not merely its final typeclass
instance. Supply transport across an isomorphism and a bridge from this quotient to
`DerivedCentralQuotient H` whenever `H⁺ = [H,H]`. The application milestones must prove
the hypotheses and this equality (or a direct quotient equivalence) for their fixed-point
groups; a bare BN-pair on a larger group does not establish the desired type's simplicity.
This is the split-BN-pair criterion in
[Conrad's Tits-system notes](https://math.stanford.edu/~conrad/249BW16Page/handouts/titssystem.pdf),
Theorem 2.4.

Also provide the group-action route where it is shorter. Connect a faithful quasiprimitive
action and conjugate commuting root subgroups to Mathlib's
`MulAction.IwasawaStructure.isSimpleGroup`, with lemmas for passing to derived subgroups and
central quotients. This is particularly useful for rank-one and small-field calculations.
Neither criterion should require a separate order formula for the whole group.

## T1–T2: ordinary and graph-twisted groups

Use the full ambient root-group calculus on the actual designated carrier: root subgroups
for every root, Weyl representatives, the torus, the commutator formula, the Bruhat
decomposition with distinct cells, a Tits system, and generation by root subgroups, together
with the signed action of Frobenius and graph automorphisms on those root subgroups. These
are C2 to C5 of the Chevalley groups roadmap on its carrier. Consume them through a proved
root-subgroup-compatible `MulEquiv` intertwining the independently defined Steinberg maps,
or construct and prove the needed calculus directly on the family's designated explicit
carrier here. L0 to L3 acceptance supplies the carrier and its named simple-root equations,
not an unproved full root family, Bruhat decomposition or BN-pair on it. The direct route
does not wait for L5, and still proves all the listed ambient statements it uses.
Build on that calculus the theory of the **Steinberg fixed points**: the finite-field root groups, the fact that the Steinberg map permutes the ambient root
subgroups and preserves the Bruhat decomposition, fixed-point Bruhat descent including the
factorization of invariant cells, and the generation of the finite fixed-point group by the
resulting twisted root groups and torus. Establish the needed fixed-point factorization by direct
root-subgroup arguments on that carrier, which need no Lang–Steinberg theorem: Steinberg,
*Lectures on Chevalley Groups*, Chapter 11, Theorem 33, derives the Bruhat decomposition of the
fixed points from the uniqueness in the ambient one. First construct a named
`fixedWeylRepresentative` for every Weyl element invariant under the induced Steinberg action:
an actual normalizer element over the algebraic closure, representing that Weyl element and
fixed by the Steinberg map. Solve the required torus correction and prove existence; an
arbitrary lift need not be fixed. Prove stability of the corresponding unipotent coordinate
subgroup and equivariance of its unique `u n_w b` factorization before deducing the fixed-point
Bruhat cells. These are explicit direct root/torus arguments, not a blanket Lang–Steinberg
assumption or a consequence of cell-index uniqueness alone.

For an ordinary group, take the finite-field root groups fixed by Frobenius. For a graph-twisted
group, fold root orbits under the diagram–field map and prove the corresponding twisted root
group relations. In both cases construct a split `TitsSystem` on the appropriate fixed-point
group, prove its Weyl group and Bruhat cells agree with the root construction, and verify every
hypothesis of T0. Prove that its root-generated subgroup is `[H,H]`, or give an explicit
equivalence between T0's quotient and `DerivedCentralQuotient H`. Establish nontriviality and
perfectness; identify the centre of `[H,H]` rather than silently replacing it by the centre of
`H`.

The validity predicate handles the index range, not these proofs. The local calculations must
cover field orders two and three at **arbitrary allowed rank**, as well as the infinite
large-field ranges. State a lemma for each family with exactly its `LieTypeIndex.Valid`
hypothesis; where a uniform commutator argument needs more field elements, prove the remaining
small-field cases by explicit rank-one/rank-two or group-action arguments. In particular the
retained cases include higher-rank groups over `𝔽₂`, `G₂(3)`, and `F₄(2)`; exclusions such as
`A₁(2)`, `A₁(3)`, and `B₂(2)` are not proof cases. Conclude
`IsSimpleGroup (d.Group)` on all thirteen ordinary or graph-twisted constructors.

## T3: Suzuki, Ree, and Tits groups

The exceptional isogenies exchange root lengths, so the ordinary fixed-root construction
cannot simply be specialized to these branches. Build their finite twisted root groups,
opposite groups, Weyl representatives, and Bruhat cells from the already defined
half-Frobenius maps on the actual designated Suzuki, Ree and Tits carriers. Apply the same
carrier/Steinberg intertwining rule as in F1/T1 before consuming pinned ambient results;
otherwise prove the needed ambient root and Bruhat statements on these explicit carriers.
Prove generation, the local commutator relations, nontriviality and
perfectness, and discharge T0 or Mathlib's Iwasawa criterion for `suzuki m`, `reeG2 m`, and
`reeF4 m` for **every** `m ≥ 1`. For a T0 proof, establish the same `H⁺`-to-`[H,H]`
bridge as in T2.

Treat `.tits` at field order two as its own proof case. The split BN-pair on the full
`²F₄(2)` fixed-point group does **not** give the required T0 bridge: its root-generated
subgroup is the full group, whereas the candidate is the derived central quotient. Construct
a concrete finite model of the latter using the
[ATLAS 1600-point representation](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/TF42G1-p1600B0)
of `²F₄(2)'`. First prove that the ambient root relations give a complete presentation and
that the commutator subgroup has index two. Derive its presentation by
Reidemeister–Schreier rewriting, identify its central quotient, and prove a Tietze equivalence with the
[ATLAS Tits presentation](https://brauer.maths.qmul.ac.uk/Atlas/v3/exc/TF42/).
Give the root/Schreier-to-ATLAS generator dictionary: words for the ATLAS generators in the
rewritten root generators, inverse words modulo the central quotient, the relator checks,
and both composite identities. Match those specified generators to the 1600-point action.
Use P0's finite-index and action certificates to compare the presentation's upper bound with
the order of the generated permutation group, giving a `MulEquiv` from the **exact**
`DerivedCentralQuotient`. Certify that model's order and simplicity by a normal-closure or
primitive-action certificate. A general theorem requiring larger field order does not cover
this entry. Conclude the four
constructor-specific theorems and then `ValidLieTypeIndex.isSimpleGroup` by cases.

## P0: proof-producing tools for presented groups

`SporadicName.Group` is `PresentedGroup` on the exact relator set of
`SporadicName.presentation`. A finite list of relators does not imply a finite group. Build
reusable, kernel-checked interfaces for:

1. **Maps and rewriting.** Evaluate presentation words in an arbitrary target group; derive a
   homomorphism from a proof that each relator evaluates to one; prove sound Tietze and
   Reidemeister–Schreier transformations beyond the native index-two interface, including
   induced equivalences and subgroup identifications. Consume
   `IsSchreierIndexTwoSource.mulEquivKerParityHom`, `.mulEquivCommutator`, and
   `GroupPresentation.mulEquivCommutator` for involutory sources satisfying their even-relator
   and abelianization/parity hypotheses; this does not cover arbitrary rewriting. Certificates
   may be generated externally, but Lean checks every word equality and relation used.
2. **Finite upper bounds.** Verify finite coset tables, subgroup towers, or finite normal-form
   systems. The soundness theorem must yield a finite index or a finite spanning set of words
   for the *actual presented group*. A surjective map **from** it onto a known finite group
   gives only a lower bound and is not a finiteness proof. Keep compressed straight-line words
   and subgroup-chain certificates as data so large cases need not list all elements.
3. **Finite lower bounds and recognition.** Verify generator images in a concrete finite
   permutation, matrix, or other finite group; prove generation of that model and compare its
   order with the certified upper bound. Package the resulting `MulEquiv` back to
   `P.Group`. Develop order and kernel lemmas so recognition does not depend on an unproved
   database label.
4. **Simplicity certificates.** Reuse Mathlib's Iwasawa criterion when a faithful primitive
   action and abelian local subgroups exist. Supply verified stabilizer chains, transitivity,
   primitivity/maximality, perfectness, and normal-closure lemmas needed for that criterion.
   Also prove a reusable finite-group criterion: if certified conjugacy-class representatives
   cover every element of prime order and each representative normally generates the group,
   then the group is simple, once nontriviality is known. The proof uses Cauchy's theorem on
   any nontrivial normal subgroup. Group-specific certificates must verify both coverage and
   normal generation. Executing Magma, GAP, or a script is a way to *produce* a certificate,
   not a proof of its soundness or of its contents.

5. **Complete conjugacy data.** Consume native `TauCeti.ClassData`, whose actual representative
   list, pairwise nonconjugacy proof and coverage proof already give numbered classes, the
   conjugacy criterion, and `numClasses_eq_card_conjClasses`. Do not create a second
   conjugacy-class certificate carrier. Extend the presentation/action tools with sound
   compressed proofs of centralizer orders and pairwise nonconjugacy. For a finite group and
   a pairwise nonconjugate list, prove the useful exhaustion criterion: if the sum of the
   actual centralizer indices of its representatives is the group order, their classes cover
   the group. Derive it from orbit-stabilizer, disjointness and finite cardinalities; certify
   the group order and each centralizer separately before applying it. Construct native
   `ClassData` from these proofs and prove transport of its representative list across a
   `MulEquiv`, agreeing with native `MulEquiv.conjClassesEquiv`. Supply representative,
   class-size, inverse and power-map comparison lemmas. Counts attached to unverified rows,
   or a class-data structure whose coverage field is assumed rather than proved, do not
   certify a named example. The existing prime-order coverage in the simplicity checker is
   weaker than a complete conjugacy classification and must not be reused as one.

At the shared permutation interface retain Mathlib's `(σ * τ) x = σ (τ x)` convention.
Use the signed-word left fold `acc * letter`; prove the source right-action/left-to-right
dictionary, including inverse and conjugation conventions, rather than silently reusing a
source word. Reuse Hex stabilizer-chain cardinality/membership soundness and the shared
orbit/primitivity word witnesses. Additional matrix-local and presented-group normal-form,
coset, Tietze and normal-generation checkers live here with explicit soundness proofs; a
finite-image chain is not a presentation upper-bound certificate. No randomized complexity
programme or Jordan theorem is required for these deterministic mathematical certificates.

The verifier library should prove round-trip and transport lemmas for presentations, relator
maps, quotient maps, and the actual actions used, agreeing with those shared interfaces. Avoid a private “sporadic certificate” axiom or a tactic whose
kernel-visible result omits the mathematical check.

## P1–P2: every sporadic presentation

For each name `s`, prove `Finite s.Group` and `IsSimpleGroup s.Group` for the *transcribed*
presentation, and prove its standard [ATLAS](https://brauer.maths.qmul.ac.uk/Atlas/v3/spor/)
order as an additional check on the presentation and recognition map. State the finite-order
theorem by `Nat.card`; the order is not a constructor field or an assumption. Record an explicit
certificate or a proved structural argument for each name in its own module, then assemble the
uniform results by cases on `SporadicName`.

P1 covers the fourteen names `M11`, `M12`, `M22`, `M23`, `M24`, `J1`, `J2`, `HS`,
`McL`, `Co2`, `Co3`, `Suz`, `Fi22`, and `He`. Split its model ownership as follows.

- For `M11 M12 M22 M23 M24 J1 J2 HS McL Co3`, consume the **canonical** named ATLAS
  permutation carriers, orders and presentation-surjection/generation maps from
  [SporadicOrders O1/O2][sporadic-orders]. Prove the additional upper bounds on the exact
  presented groups and turn those particular surjections into `MulEquiv`s. Do not redefine
  the ten carriers from a second set of ported generators.
- For `Co2 Suz Fi22 He`, this roadmap owns the remaining permutation-model definitions,
  orders, presentation maps/upper bounds and recognition. Select the defining permutation
  data and constructive proofs of [FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean),
  with the source commit and numbering recorded in each module. Follow the
  [porting and licence rules](../../README.md#porting-existing-work).
- For all fourteen, port or rebuild the external constructive simplicity proof and supply
  an explicit carrier equivalence to the selected canonical model. When its generators or
  action differ, give forward and recovery words and the equivariant action comparison;
  equal orders or a shared group name are insufficient. Transport simplicity only after
  recognition. These inputs do not identify Golay automorphisms or Leech stabilizers without
  the action-specific P2-L comparisons below.

P2 covers the other twelve names, with the same `Finite`, `Nat.card`, and `IsSimpleGroup`
deliverables: `J3`, `J4`, `Ru`, `ONan`, `Co1`, `Fi23`, `Fi24Prime`, `HN`, `Ly`, `Th`, `B`, and `M`.

For each name, construct a finite realization independently of its presentation, check the
exact presentation-to-realization map, certify an upper bound for the presented group,
and prove simplicity of the realization. Use P0's checked certificate interfaces, with
compressed words and local structures for the large cases.

| P2 item | Depends on | Deliverable |
| --- | --- | --- |
| P2-N: nine presentation models | P0, P1, T1–T3 | the nine construction, recognition, and simplicity certificates below |
| P2-L: Leech and Conway bridges | P0, P1 Mathieu/Co2 models, Rank24LatticeConstructions Layer 6, canonical Golay code | identified code and lattice actions, Co1 recognition, mod-two module and Co2 stabilizer |
| P2-G: local Monster representations | P2-L | the specified local subgroups, their common representation, and triality |
| P2-M: Monster and Baby Monster models | P2-G | finite models, actual axis stabilizers, orders, and simplicity |
| P2-D: central-extension theorem | P2-M | no perfect central double cover of the constructed Monster |
| P2-R: Monster and Baby Monster recognition | P0, P2-M, P2-D | equivalences from the two exact Tau Ceti presentations |

### P2-N: construction and recognition of the other nine sporadics

For each row, let `P` be the **exact** Tau Ceti presentation named below and let `G` be the
subgroup generated by the selected finite permutations or matrices. Prove an explicit `P.Group
≃* G`, then transport finiteness, order, and simplicity. Representation data define finite
candidates; their ATLAS names do not prove their orders or identify the abstract presentations.
[C][src-c], [A][src-a]

The construction has four separately checked parts:

1. Pin the representation files, their field and multiplication convention. Supply a word for
   every presentation generator in the model generators and words recovering the model
   generators. Check every recorded relator. This gives a surjection `P.Group → G`.
2. Bound a **word-defined subgroup of `P.Group`** by a proved finite presentation or normal
   form. Certify its index using deductions from the original relators. A permutation action
   satisfying the relators does not certify this index: its point stabilizer may contain an
   unaccounted kernel.
3. Prove the model order independently with checked stabilizer chains or finite local structures
   and orbit counts. Match this lower bound with the presentation upper bound.
4. Prove nontriviality and the selected simplicity certificate described below. None of these
   steps assumes CFSG or a database simplicity assertion.

| Carrier and exact presentation | Concrete finite realization and presentation bridge | Presentation upper-bound target |
| --- | --- | --- |
| **J3**, `j3Presentation`, eight relators on `a,b` | Generate `G ≤ Sym(6156)` with [J3G1-p6156B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/J3G1-p6156B0) standard permutations. Map the recorded `a,b` directly to these generators, checking the eight words in ATLAS `J3G1-P1.M`, including its source commutator convention. [J3][src-j3] | Put `K = ⟨ab⟩ ≤ P`. The recorded relation gives `\|K\| ≤ 19`. Check the published enumeration over **these exact words** with index at most **2,643,840**. Thus `\|P\| ≤ 50,232,960`. The 6,156-point model order is an independent stabilizer-chain certificate. This selects a documented bounded enumeration, without needing an unproved presentation of a maximal subgroup. [J3][src-j3] |
| **J4**, `j4Presentation`, twelve relators on `x,y,t` | Generate `G ≤ GL(112,2)` with [J4G1-f2r112B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/J4G1-f2r112B0), convert its type-I pair to the source's type-II triple, and certify both directions of generation. Identify the subgroup on the source words `M2` below with `C_G(t)`. [J4][src-j4] | Bound the corresponding subgroup `H ≤ P` by **21,799,895,040**, using its `2^(1+12)·3·M22·2` structure, then prove `[P:H] ≤ 3,980,549,947`. The selected architecture is the source's involution-centralizer double-coset argument. Its required compressed transition certificate is specified below; its concrete double-coset data remain a separate construction target. [J4][src-j4] |
| **Ru**, `ruPresentation`, twelve relators on `u,v,t` | Generate `G ≤ Sym(4060)` with [RuG1-p4060B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/RuG1-p4060B0). Supply the dictionary from Soicher's `u,v,t` to the standard pair, checking the exact `tcenum` words and implicit relations `v²=t²=1`. Use Bradley–Curtis–Malik's symmetric construction for the dictionary and subgroup presentation; prove the Tietze bridge to the exact artifact. [Ru][src-ru] | Use the subgroup specified in the artifact's third field, on `t,u,w` with `w` decoded below. Prove its order at most **35,942,400**, through a complete presentation of **the full `²F₄(2)`**, and certify index at most **4,060**. Derive all subgroup relators from the twelve Tau Ceti relators; do not replace `²F₄(2)` by its index-two Tits subgroup. The subgroup presentation and exact dictionary are construction targets. [Ru][src-ru], [A][src-a] |
| **O’Nan**, `onanPresentation`, 29 relators on `a,…,g` | Generate `G ≤ Sym(122760)` with [ONG1-p122760aB0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/ONG1-p122760aB0). Construct seven words giving the GPL diagram generators, and recovery words for the standard pair. Check the Coxeter path `a3b3c8d3e3f` and all eight additional relations, including GPL's equality convention. [ON][src-on] | Put `H = ⟨a,b,c,d,e,f⟩ ≤ P`. Certify index at most **122,760** and derive a finite presentation bounding `H` by `L₃(7):2`, of order **3,753,792**. The bare six-generator Coxeter subpresentation does not supply this bound: the target includes all additional subgroup relators deduced using `g`. Include the subgroup-presentation derivation in this milestone. [ON][src-on] |
| **Fi23**, `fi23Presentation`, 57 relators on `a,…,j` | Generate `G ≤ Sym(31671)` with [F23G1-p31671B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/F23G1-p31671B0). Construct the ten GPL involutions as words in the standard pair and recovery words. Check the Coxeter diagram and both appended words `(dcbdefdhi)^10`, `(abcdefh)^9`. [F23][src-f23] | Put `H = ⟨a,…,i⟩ ≤ P`; certify index at most **31,671**. Prove `\|H\| ≤ 129,123,503,308,800` from a complete presentation of the **double cover `2·Fi22`**, with a central subgroup of order at most two and quotient of order at most `\|Fi22\|`. A simplicity/order theorem for `Fi22` alone is insufficient. Construct the central word, prove centrality and its square relation, and prove the quotient-presentation bridge. [F23][src-f23] |
| **Fi24′**, `fi24PrimePresentation`, eleven Schreier generators and 136 relators | Select `Q ≤ Sym(306936)` from the **parent** representation [F24d2G1-p306936B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/F24d2G1-p306936B0); set `G = [Q,Q]`. Construct the twelve parent involutions as words in its standard pair and prove generation. Recognize the 80-relator parent `P₀ = Fi24AutomorphismGroup` first. Transport commutator subgroups through `P₀ ≃* Q` and reuse `fi24PrimeGroupMulEquivCommutator`; retain `al`. [F24][src-f24], [C][src-c] | In `P₀`, use `M = ⟨a,b,c,d,e,f,g,h,i,j,l⟩`, index at most **306,936**. Prove `\|M\| ≤ 2\|Fi23\|` by the `Fi23 × C₂` decomposition described below. Then `\|P₀\| ≤ 2\|Fi24′\|`. Certify the model's parent order and derived index two; parity is already the commutator kernel of the abstract parent. This follows the subgroup named in Kim–Michler Lemma 6.2(a), rather than assuming faithfulness from `CosetAction`. [F24][src-f24] |
| **HN**, `hnPresentation`, corrected nineteen relators on `a,b,c,d,t` | Generate `G ≤ GL(133,5)` with [HNG1-f5r133B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/HNG1-f5r133B0). Build the Bray–Curtis five-generator tuple in this model and recovery words. Check the **first** `HNpb.m` presentation, retaining `(ad)²`, the corrected twelfth relator. [HN][src-hn] | Put `H = ⟨a,b,c,d⟩ ≤ P`. Prove `\|H\| ≤ 177,408,000` through the `2·HS:2` presentation and central-extension argument in Bray–Curtis §§3–5. Certify `[P:H] ≤ 1,539,000` using the corrected five-generator presentation. Their published enumeration requires fewer than two million live cosets. Bound the central `C₂`, the `HS` quotient, and the outer factor separately; P1's `HS` theorem does not give the double cover automatically. [HN][src-hn] |
| **Ly**, `Lyons.presentation`, Havas–Sims six-generator, 53-relator presentation | Generate `G ≤ GL(111,5)` with [LyG1-f5r111B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/LyG1-f5r111B0). Supply the Havas–Sims `a,b,c,d,e,z` as words in the model and recovery words. Certify auxiliary-word substitutions against relations (14.1)–(14.86), retaining `e` and the exact 53 surviving relators. [Ly][src-ly] | Put `H = ⟨a,b,c,d⟩ ≤ P`. Prove `\|H\| ≤ \|G₂(5)\| = 5,859,000,000` from the source's `z`-free presentation, then check index at most **8,835,156**. Prove `\|⟨a,b,c⟩\| ≤ 1,500,000` and its stated index **3,906** in `H`; these give the required upper bound for `H`. Identify `H` with the independently constructed `G₂(5)` model. The exact local-order derivation and matrix dictionary are construction targets. [Ly][src-ly] |
| **Th**, `Thompson.presentation`, eight generators and 39 relators in six source blocks | Generate `G ≤ GL(248,2)` with [ThG1-f2r248B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/ThG1-f2r248B0). Construct the Havas–Soicher–Wilson eight-generator tuple by §4 and certify recovery of the standard pair. Check every equation, commutator and conjugation in source blocks (1)–(6). [Th][src-th] | Let `U=⟨a,b,c,d,e⟩`, `D=⟨U,s⟩`, `H=⟨D,t⟩`. Prove `\|U\| ≤ 12,096`, `[D:U] ≤ 17,472`, `[H:D] ≤ 3`, hence `\|H\| ≤ 634,023,936`. The source's exact global target is `[P:H] ≤ 143,127,000`. Its §5 supplies a successful explicit enumeration; a compact checked replay/normal-form representation of that computation is a separate target, without an assertion that a small certificate exists. [Th][src-th] |

#### Centralizer and parent-group certificates

For J4, use the source's exact subgroup words, evaluated both in `P` and in the matrix candidate:

```text
q = yxy (xy⁻¹)² (xy)³
H = ⟨t, x, q, t^(xyxy⁻¹xy), t^(xyxy⁻¹)⟩.
```

First prove `H ≤ C_P(t)`. Give an order bound through a normal subgroup `E` of order at most
`2^13`, with extraspecial commutator form, and quotient of order at most `3·|M22|·2`; give the
word maps and collection rules for the central triple cover and outer involution. Independently,
in the matrix candidate, prove `t ≠ 1`, the corresponding subgroup has order **21,799,895,040**,
and equals `C_G(t)`. A group of the expected shape elsewhere does not identify this centralizer.
[J4][src-j4]

The double-coset certificate must provide representatives `wᵢ`, intersections `H ∩ wᵢ⁻¹Hwᵢ`,
their indices in `H`, and a rewrite for multiplication by each of `x,y,t` on each parametrized
coset block. Every rewrite is justified from the twelve defining relations and the subgroup
normal forms. Closure and inclusion of the identity must imply that the blocks cover **all words
in `P`**, with total number of right cosets at most **3,980,549,947**. Counting double cosets in
the matrix image proves only a lower-bound model fact. Construct the double-coset
representatives and transition data, and prove the checker sound from the exact presentation.

For Ru, the third `tcenum` field is `t,u,((uvu)-tuvuvtv[t,u]2vtv)2`. Decode it with the pinned parser, producing

```text
w = ((uvu)⁻¹ t u v u v t v [t,u]² v t v)²,
H = ⟨t,u,w⟩,       [t,u] = t⁻¹u⁻¹tu.
```

These are subgroup generators, not extra relators. Prove the dictionary between this `H` and the
`²F₄(2)` subgroup in the symmetric construction before using the index 4,060. [Ru][src-ru]

For Fi24, `l` commutes with each of `a,…,j`, and `l=(abcdefh)^9`. Set `A=al, B=bl, …, J=jl`.
Construct a surjection from the **exact Fi23 presentation** to `⟨A,…,J⟩`: check every relation,
particularly `(ABCDEFH)^9=1`. To obtain the remaining relation `(DCBDEFDHI)^10=1`, derive
`(dcbdefdhi)^10=1` from the Fi24 parent relators; it is not among those relators literally.
Prove that `M=⟨A,…,J,l⟩`, `l²=1`, and `l` centralizes `⟨A,…,J⟩`. This yields `|M|≤2|Fi23|`.
Certify the index 306,936 using all eighty parent relators, including the order-seventeen word.
[F23][src-f23], [F24][src-f24]

The derived-carrier comparison uses the existing maps on `ab,ac,…,ak,al`, not a new presentation
that silently eliminates `al`. Prove the model parity map corresponds to the abstract parity
map, and identify its kernel with `[Q,Q]`. The required order is
**1,255,205,709,190,661,721,292,800**. [F24][src-f24]

#### Simplicity certificates and local data

Select P0's **prime-order normal-generation criterion** for all nine finite candidates. Supply,
for each prime `p` dividing the certified order, a word-generated subgroup `Sₚ ≤ G` with a
checked normal form and order exactly `p^vₚ(|G|)`. Sylow conjugacy then reduces coverage to
elements of order `p` inside these local subgroups. Partition those elements into explicitly
parametrized local families and give conjugating words taking each family to named prime-order
representatives. No ATLAS class label is accepted as a coverage proof.

For every representative `r`, express every model generator as a product of conjugates of `r`
and `r⁻¹`, checked in the finite model. These words certify that its normal closure is `G`.
Together with nontriviality and Sylow coverage they prove simplicity. The local collection
rules, coverage families, fusion words, and normal-generation words are distinct deliverables;
merely running a simplicity command supplies none of them.

| Candidate | Required Sylow primes | Local inputs to connect to the construction |
| --- | --- | --- |
| J3 | 2, 3, 5, 17, 19 | 6,156-point stabilizer chain; the source's explicit `C_G(a)` words and its `2^(1+4):A5` structure can supply the Sylow-2 data. [J3][src-j3] |
| J4 | 2, 3, 5, 7, 11, 23, 29, 31, 37, 43 | The certified `C_G(t)` supplies Sylow-2 data; supply the missing prime-local groups, fusion and normal-generation certificates in the 112-dimensional model. [J4][src-j4], [A][src-a] |
| Ru | 2, 3, 5, 7, 13, 29 | The identified full `²F₄(2)` point stabilizer, rank-three suborbits `1,1755,2304`, and the remaining prime-local subgroups. Primitivity of this action alone is not the selected simplicity proof. [Ru][src-ru], [A][src-a] |
| O’Nan | 2, 3, 5, 7, 11, 19, 31 | The identified `L₃(7):2` point stabilizer and suborbits `1,5586,6384,52136,58653`; certify additional Sylow groups where its order lacks the full prime part. [ON][src-on] |
| Fi23 | 2, 3, 5, 7, 11, 13, 17, 23 | The actual `2·Fi22` stabilizer, rank-three suborbits `1,3510,28160`, and Sylow groups of the full model. [F23][src-f23] |
| Fi24′ | 2, 3, 5, 7, 11, 13, 17, 23, 29 | Perform coverage and normal generation in `[Q,Q]`, with conjugators in that subgroup; use the actual Fi23 stabilizer in its 306,936-point action. Parent-group fusion alone does not prove conjugacy inside the derived group. [F24][src-f24] |
| HN | 2, 3, 5, 7, 11, 19 | The identified `2·HS:2` subgroup and the source's `A12=⟨a,b,d,d^(cbc),t⟩`, with certified embeddings into the chosen matrix model. [HN][src-hn] |
| Ly | 2, 3, 5, 7, 11, 31, 37, 67 | The actual `G₂(5)` subgroup, plus Sylow and fusion data for prime parts not contained there. [Ly][src-ly], [A][src-a] |
| Th | 2, 3, 5, 7, 13, 19, 31 | The source's `³D₄(2):3`, and `C_G(a)=⟨a,c,d,e,s,t,u⟩` of shape `2^(1+8)·A9`; its local proof includes the index 61,440 over `⟨d,e,s,t⟩≅L₂(8):3`. [Th][src-th] |

The prime sets above specify the scope of the local certificates, not completed class or
normal-generation data. For large matrix candidates, construct these certificates through the
named local groups and compressed words; do not enumerate the ambient finite group.

### P2-L–P2-R: Conway, Monster, and Baby Monster

**P2-L: connect the Golay, Mathieu, and Conway actions.** Fix the extended binary Golay
code `C` supplied by Layer 5 of
[AlgebraicCodingTheory](../../Completed/AlgebraicCodingTheory/README.md), including its coordinate
numbering. Prove an explicit equivalence between the P1 `M24` model and the full permutation
automorphism group of `C`, compatible with their actions on the 24 coordinates. If the
construction uses another Golay matrix, supply the coordinate permutation identifying the
two codes. The coding roadmap explicitly excludes this Mathieu identification; neither its
code construction nor P1's abstract order theorem supplies it.

Consume the canonical Leech lattice `Λ` of [Rank24LatticeConstructions Layer 6][rank24],
on `Ω = Fin 12 ⊕ Fin 12`, with rational form `B(x,y) = (∑ i, x_i y_i)/2` and
`Λ = K.ofIsotropicSubgroup(H_s)` from Construction B and its odd shift. Use its rank,
positive-definiteness, evenness, unimodularity, minimum and congruence API. In particular,
do not substitute the rootful Golay Construction-A lattice. For the Conway/Griess coordinates,
construct the explicit coordinate equivalence and form-preserving comparison, including the
normalization factor; a different displayed norm requires its proved scaling dictionary. Classify **all** minimal vectors from this actual congruence model. In its raw integer
coordinates `x_i=a_i/2`, of norm `∑a_i²/8`, construct the three exhaustive families:
two coordinates `±4`; octad-supported eight coordinates `±2` with the sum congruence;
and one coordinate `±3` with the others `±1`, parametrized by a Golay word and a
distinguished coordinate. Prove their disjoint counts `1104`, `97152`, `98304`, hence
196560 minimal vectors. The code's weight/rank theorems supply the octad and codeword
counts; the vector classification and sign/congruence checks belong here, not to the
minimum-norm theorem alone. Prove the antipodal involution has no fixed point and its
pair set has cardinality 98280 before using that permutation degree or any orbit count.
Prove the minimal vectors span the rational ambient space, so that their faithful
permutation action proves the lattice isometry group `Co0 := Aut(Λ)` finite. Construct
`Co1 := Co0 / {±1}` and deduce its finiteness by quotient finiteness. The action on
minimal **vectors** is the Co0 action; `−1` negates those vectors, so it does not descend to
Co1. Construct the Co1 action on antipodal pairs and prove its kernel statement separately.
Give the Conway generators of Co0, prove they generate the full lattice-isometry group by
the lattice/minimal-vector reduction, and compute its order using that actual action.

For Co1 recognition, select the Praeger–Soicher/GPL `Co1.1` eight-involution presentation
used by native `co1Presentation`, retaining its nine additional relations and alphabetical
renaming. Construct its generator dictionary with the antipodal-pair action of degree 98280.
Build a word-defined subgroup of the abstract presentation mapping onto the specified Co2
point stabilizer, derive a surjection from the **exact** recognized Co2 presentation onto
that subgroup, and certify a complete right-coset/normal-form cover of index at most 98280.
This bounds its order by `|Co2|`; the independent lattice orbit/stabilizer calculation gives
the matching lower bound for Co1. Neither the finite-image stabilizer nor its order alone
proves those abstract subgroup relations or the coset cover. Construct the subgroup words,
relation deductions and all coset transitions as P0-checked certificates. Prove Co1
simplicity by P0's prime-order normal-generation criterion, using local Sylow normal forms
for primes `2,3,5,7,11,13,23`, complete prime-element coverage/fusion words, and witnesses
normally generating every canonical model generator. Then transport to the exact presentation. Define the induced action on `V := Λ/2Λ`; prove the required kernel,
faithfulness, and irreducibility statements for this action over `F₂`. For a specified short
vector class `λ ∈ V` of type 2 in the Höhn–Seysen conventions, identify
`Stab_Co1(λ)` with the P1 `Co2` model by an explicit
`MulEquiv`. Construct the equivariant bijection from antipodal pairs of minimal vectors
to type-2 classes in `Λ/2Λ`, sending `{v,−v}` to `v + 2Λ`. Prove independence of sign,
injectivity using the minimum-norm bound, and surjectivity from the definition of type 2.
Match the Co0 quotient action with the mod-two Co1 action under this bijection, and identify
its actual stabilizers. An unrelated permutation group of the same order does not provide
that interface.

**P2-G: construct the local representations used by the Monster.** Follow
[Höhn–Seysen, v1, §2.1](https://arxiv.org/html/2508.01037v1#S2.SS1) and its Conway
construction to realize `G := Gx0` of shape `2^{1+24}_+.Co1` and `N := N0` of shape
`2^{2+11+22}.(M24 × S3)` on the same rational Griess algebra. Specify their embeddings,
their intersection `Nx0` of shape `2^{1+24+11}.M24`, and triality `τ`, with
`N = ⟨Nx0, τ⟩`. Prove the extraspecial structure of `Q := Qx0`, identify its central
involution `z`, and give an equivariant identification `Q/⟨z⟩ ≃ Λ/2Λ` for the actual
`Co1` action from P2-L. Connect the code action to the Parker-loop and `M24` actions used
in these representations, rather than importing a second, unidentified Mathieu model.

Assign the representation and character calculations consumed by §2.1 to this milestone.
In particular, prove the fixed-space statement in Lemma 2.1, including the restriction of
the 300-dimensional symmetric-square representation to the identified `Co2`, with
constituent dimensions `1, 1, 23, 275`. Höhn–Seysen assumes Conway/Leech theory and
character information for `Co1`, `Co2`, and `M24`; those are prerequisites to formalize for
these representations, not consequences of P1's order and simplicity theorems.

**P2-M: count the constructed Monster through its actual stabilizers.** Define
`M_alg := ⟨G, τ⟩`. Prove the axis–involution correspondence of §2.1 and
`C_M_alg(z) = G` (Theorem 2.9). Choose the paper's short involution `β⁺`, put
`β⁻ := β⁺ z`, and let `v⁺, v⁻` be their axes. The counting interface is

```text
X⁺ = orbit M_alg v⁺
K  = Stab_M_alg(v⁺) = C_M_alg(β⁺)
X⁻ = orbit K v⁻
S  = Stab_M_alg(v⁺, v⁻).
```

Prove `S = C_G(β⁺)` using `β⁺β⁻ = z` and `C_M_alg(z) = G`. Prove that its map to
`Stab_Co1(λ)` is surjective with kernel `C_Q(β⁺)` of order `2^24`. This identifies the
actual two-axis stabilizer of shape `2^{1+23}.Co2` and gives
`|S| = 2^24 · |Co2|` using the P2-L equivalence. The kernel here is not the extraspecial
group `Q` of order `2^25`.

Formalize the orbit certificates of §§3–4 and Appendix D: representative words, stabilizer
generators, complete subgroup-orbit decompositions, and the triality transitions in Tables
2 and 4. Prove the soundness of the action calculations and exhaustive coverage of both
`X⁺` and the full `K`-orbit `X⁻`. For the latter, justify the passage from the local
`H := K ∩ G` and triality calculations to the full stabilizer action; closure under a
subgroup's generators alone does not prove this coverage. Justify any modular arithmetic
used to certify equalities in the rational representation. Prove finiteness of `X⁺`, `X⁻`,
and `S` first. Use the actual orbit/fibre equivalences to deduce `Finite K` from finite
`X⁻` and `S`, then `Finite M_alg` from finite `X⁺` and `K`; neither application assumes
that the group being proved finite is already finite. Only afterwards take cardinalities
in these two equivalences to obtain

```text
|M_alg| = |X⁺| · |X⁻| · |S|.
```

Prove Monster simplicity through Lemmas 5.3–5.5 and Theorem 5.6. This includes the full
normal-subgroup list `1, ⟨z⟩, Q, G` for `G`, using its extraspecial subgroup and the
faithful irreducible `Co1` action on `Λ/2Λ`, and the explicit triality calculations that
exclude each proper possibility for a normal subgroup's intersection with `G`.

Define `B_alg := K/⟨β⁺⟩` and obtain its finiteness and order
`|B_alg| = |X⁻| · |S| / 2` as in Corollary 5.2. Use P0's prime-order normal-generation criterion separately for this quotient: construct
its Sylow normal forms for primes `2,3,5,7,11,13,17,19,23,31,41,47`, certify coverage of
their prime-order elements up to quotient conjugacy, and give normal-generation words for
each resulting representative and every quotient generator. Prove nontriviality and the
quotient word-evaluation/central-kernel comparisons before applying that criterion. The Monster simplicity
theorem and the Baby Monster order calculation do not discharge this target.

**P2-D: prove the central-extension prerequisite.** Select the recorded Ivanov
presentation route, with the no-proper-double-cover hypothesis attributed to Griess in
[Breuer–Magaard–Wilson, v2, §3.1](https://arxiv.org/html/1902.07758v2). Prove this
hypothesis for `M_alg` after P2-M and before Baby Monster presentation recognition.
An explicit sufficient target is that no perfect group admits a surjection onto `M_alg`
with central kernel of order two. This excludes a proper covering group, while allowing
the split extension `C2 × M_alg`. Formalize the required part of Griess's
*The Schur multipliers of the known finite simple groups, III* directly for this `M_alg`,
carrying its concrete local-subgroup and construction hypotheses. Any comparison with
Griess's construction must be proved from those earlier P2-L/G/M identifications,
independently of P2-R, the `Y₄₄₃` recognition theorem and `ClassificationStatement`.
Do not identify the two Monsters by the presentation theorem whose proof is being supplied.
Computing the entire Schur multiplier is not a separate endpoint. Order and simplicity of
`M_alg` alone do not imply this prerequisite.

**P2-R: identify the exact two presentations.** Formalize the recorded presentation
theorems, including their structural hypotheses and the maps to `M_alg` and `B_alg`.
Construct the intermediate group `BiM := (M_alg × M_alg) ⋊ C₂` from the already
constructed Monster, with the nontrivial `C₂` element swapping the two factors. Give the
two factor inclusions, the projection onto `C₂` with its kernel, the swap element and its
square/conjugation equations, and generation by those factors and the swap. This carrier
does not depend on presentation recognition.

For the Baby Monster select the `Y₅₅₅` presentation used in Ivanov's *Presenting the Baby
Monster*, as invoked by Breuer–Magaard–Wilson §2. Transcribe its exact numbered generators
and full source relator family, including the additional spider relation and any other
relations actually required in that chosen source. Do not infer a presentation from the
Coxeter diagram alone or add deflation relations from a different construction. Give the
source-to-Lean numbering and generator dictionaries, check all relations and generation,
and prove the resulting presented group is `MulEquiv` to this actual `BiM`. Then formalize
the precise deduction of the `Y₄₃₃` central extension/quotient used below, with its actual
subgroup maps and kernels and the independently proved P2-D hypothesis, before concluding
Baby Monster presentation recognition. Neither this intermediate carrier nor its
presentation theorem may be assumed through P2-R's final recognition conclusion.
For the Monster use
Ivanov's *Y-groups via Transitive Extension*, especially Lemma 3.2 and §3.9, carrying its
transitive-extension and subgroup-identification arguments as proof obligations.
These presentation-identification theorems must supply the upper bounds for the
presented groups; checking relators in the constructed models supplies only maps out of
them.

Account for the quotient conventions in the actual Lean definitions:

- `TauCeti.Sporadic.Monster.presentation` has the `Y₄₄₃` Coxeter relators followed by
  `spiderRelator = (a b₁ c₁ a b₂ c₂ a b₃ c₃)^10` and
  `centralInvolutionRelator = (a b₃ c₃ d₃ b₁ c₁ b₂)^9`, Ivanov's `f₃₁₂`.
  Identify the Coxeter-plus-spider group with `M_alg × C2`, prove that `f₃₁₂` kills its
  central factor, and identify the full 80-relator quotient with `M_alg`.
- `TauCeti.Sporadic.BabyMonster.presentation` has the `Y₄₃₃` Coxeter relators followed by
  `spiderRelator = (t₅ t₄ t₃ t₅ t₆ t₇ t₅ t₉ t₁₀)^10`,
  `extraRelatorOne = (t₅ t₄ t₃ t₆ t₇ t₈ t₉)^9`, and
  `extraRelatorTwo = (t₅ t₄ t₃ t₆ t₉ t₁₀ t₁₁)^9`.
  Identify the Coxeter-plus-spider group `2 × 2·B` with `C2 × K`, including the
  identification of the cover with this constructed centralizer. Prove that the normal
  closure of the two extra relators is exactly the kernel of the map to
  `K/⟨β⁺⟩ = B_alg`, so that the full 69-relator presentation gives `B_alg`.

Give the numbered-generator dictionaries, verify generation, and transport the resulting
`MulEquiv`s to the exact `SporadicName.Group` carriers. The existing
`mulEquivPresentedGroupCoxeterAppend` declarations only identify the presentations with
the corresponding Coxeter quotients; they do not recognize a finite simple group.
Group-specific constructions and certificates live in P2, while their reusable soundness
theorems and group-action criteria live in P0.

For the involution-class input to P2M, select the finite local route of Höhn–Seysen
Appendix E: prove the odd-index reduction from `M_alg` to `Gx0`, construct exhaustive local
involution families in `Gx0`, and certify their fusion to `β⁺` or `z` by actual conjugating
words. Prove those two representatives nonconjugate using their actual representation
invariants. Supply the required Co1/local character facts from P2-L/G. The published
computation is input to a soundness proof and checked certificate, not an imported theorem;
do not use its alternative Monster-character-table calculation or require identification
with the full Griess/VOA automorphism group. This places the two-involution proof after the
order/local-action constructions and before the complete 194-class analysis.

## P2M: the Monster's conjugacy classes and character count

Build the conjugacy structure of the concrete Monster from P2 and transport it across P2's
proved recognition `MulEquiv` to **exactly** `SporadicName.M.Group`. Construct an explicit finite
list of representative words in the recorded generators, evaluate those words in the actual
model and presented group, and prove pairwise nonconjugacy and completeness. Deliver native
`TauCeti.ClassData` with this very list, its label/representative round trips and the criterion
that two elements have the same label exactly when they are conjugate. Prove each
representative's element order, the order and stated structure of its actual centralizer, and
its inverse and power-class labels. Check the subgroup-fusion maps used to identify the rows.
The final class equivalence must send a label to the class of its specified representative;
a bare equivalence chosen from the desired cardinality is not the construction.

The group-specific proof must build all its inputs. In particular establish that there are
exactly two classes of involutions, with actual representatives and the two nonconjugacy and
coverage assertions. Identify their actual centralizers: the central extension of the Baby
Monster in the `2A` case, with the involution as its kernel, and the
`2^{1+24}_+.Co1` local group in the `2B` case, with proved maps, kernels and quotients rather
than an abstract group-shape label. These use the P2 Baby Monster quotient and Conway/Griess
constructions; prove the required local group and character-table facts for those actual
subgroups, or connect them by proved isomorphisms to their existing constructions. Construct
the degree-196883 complex representation from the Griess module, identifying its fixed line
and the complementary or quotient module in dimension 196884, and prove the resulting
representation is irreducible independently of the Monster's full character table. Record
which representation values, local centralizer calculations and fusion tests separate each
remaining pair of candidate classes. These are explicit construction and theorem targets,
not opaque hypothesis fields for a conditional Monster-count theorem.

Follow the class-verification argument of [Breuer, Magaard and Wilson, *Verification of the
conjugacy classes and ordinary character table of the Monster*, §2 and §4.9 Proposition1](https://arxiv.org/html/2412.12182v1).
Supply its individual local subgroup/table and representation prerequisites before the class
count. In particular distinguish classes meeting the involution centralizers from the
odd-order analysis and prove exhaustion over **all** element orders. Where the argument uses
a power map or fusion test, prove its value on the actual elements; matching names in a
printed table is not a fusion proof. P0's mass-exhaustion criterion is available when the
independently certified group and centralizer orders give the complete class-size sum.
Do not treat the finite axis-orbit certificate that gives the group order as a conjugacy
classification of its elements.

Prove that the resulting actual representative list has length 194 and deduce
`Nat.card (ConjClasses SporadicName.M.Group) = 194` using native `ClassData` soundness. Then
consume native `TauCeti.card_irreducibleCharacters` over `ℂ` to deduce that the Monster has
194 irreducible complex characters and that its ordinary character table has 194 rows and
columns. The generic theorem requires a finite group, an algebraically closed field and
invertible group order; P2 supplies finiteness and `ℂ` supplies the field conditions. Do not
assume a complete 194-column character table to prove its own number of classes: the class
verification precedes the final full-table verification. This milestone does not require
that full table's construction as a prerequisite and does not duplicate CharacterTheory's
generic irreducible/class-count theorem.

Prove the class-count and group-order statements separately. The exact ATLAS order belongs
to P2's recognized group; neither that order, simplicity, nor `ClassificationStatement` alone
supplies the class-count theorem.

## A0: assemble the list properties

Prove `CFSGIndex.finite` and `CFSGIndex.isSimpleGroup` by the four constructors, invoking E0,
native Lie-type finiteness and the T2/T3 simplicity results, and the P1/P2 sporadic results. Check a test theorem for
one cyclic, one alternating, one ordinary Lie, one graph-twisted, each of Suzuki/Ree/Tits, and
one P1 and one P2 sporadic entry; these are checks of the dispatcher, not replacements for
the uniform proofs. Audit the endpoint's axioms and confirm that no case uses
`ClassificationStatement` or assumes the corresponding basic property.

## Existing formalizations and model comparisons

The following are secondary proof sources for the specified endpoints. They do
not change the ownership or the exact-carrier requirements above. Coordinate
with the authors before adapting code, and express reusable lemmas through
native presentation, character, action and Tits-system interfaces.

- Axiom's [sporadic converse theorem](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Milestones/FAM_sporadic_converse.lean)
  proves finiteness and simplicity of each exact `TauCeti.SporadicName.Group`
  at Tau Ceti revision `6e0c6acab5f4c6f42e5f5bab9bd5e4e84f74c380`.
  Its presentation/model comparisons are proof sources for P1–P2; compare
  current relators and generators before transport. Its
  [Monster simplicity proof](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Milestones/FAM_M_simplicity.lean)
  uses Feit–Thompson through the odd-order local bounds in
  [`Monster/Existence/StdOdd/Seven`](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Monster/Existence/StdOdd/Seven.lean).
  This source is not an alternative completion criterion: P2's selected
  construction and recognition routes remain required, including P2-M's
  `M_alg`, `Gx0`, `K` and `B_alg` consumed by P2M. FT-dependent proof
  fragments must be replaced within those routes; importing the source's
  final Monster theorem does not discharge them. This roadmap acquires no
  new Feit–Thompson prerequisite from citing that source.
- Its [finite simple Lie models](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Milestones/CAT_native_realization.lean)
  and [`LieType/Catalog`](https://github.com/AxiomMath/CFSG/tree/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/LieType/Catalog)
  supply material for T1–T3. The models in
  [`Blueprint/Catalog`](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Blueprint/Catalog.lean)
  are finite-field adjoint quotients, twisted derived central quotients, and
  Ree/Suzuki matrix groups. Compare `d.Group` with the model by a proved
  `MulEquiv`; a finite-field model need not have an ambient Steinberg map.
  The comparison includes fixed-field descent, identification of the derived
  subgroup with the appropriate root-generated group, and matching centres.
  These are T1–T3 structure theorems, not consequences of finiteness alone.
  Match `StatedLieAdmissible` with `LieTypeIndex.Valid`, including Tits versus
  `²F₄(2)'` and the lower bound on the Suzuki parameter.
- Ordinary character theory, including Burnside, Frobenius kernels,
  irreducible expansions and Frobenius–Schur theory, is supplied by the native
  `RepresentationTheory/CharacterTable` and `RepresentationTheory/FrobeniusGroup/Basic`
  libraries. Compare a source's private character objects with these once.

## References

- R. W. Carter, *Simple Groups of Lie Type*, particularly the root-group, BN-pair, and
  simplicity arguments; R. Steinberg, *Endomorphisms of Linear Algebraic Groups*, for the
  Steinberg fixed-point constructions.
- J. Tits, the simplicity criterion for groups with a BN-pair; see also
  [Conrad's notes on Tits systems and root groups](https://math.stanford.edu/~conrad/249BW16Page/handouts/roottits.pdf)
  for the group-theoretic interface.
- [ATLAS of Finite Group Representations](https://brauer.maths.qmul.ac.uk/Atlas/v3/)
  for named sporadic groups, presentations, finite representations, and orders.
- [Höhn–Seysen, *The Order of the Monster Finite Simple Group*](https://arxiv.org/abs/2508.01037)
  for the Griess-algebra construction, Monster and Baby Monster order arguments, and
  accompanying axis-orbit certificate data.
- [Breuer, Magaard and Wilson, *Verification of the conjugacy classes and ordinary character
  table of the Monster*, arXiv:2412.12182v1](https://arxiv.org/html/2412.12182v1),
  particularly §2 and §4.9 Proposition1, for the local prerequisites and the complete
  class-verification route; its full character-table verification follows the class count.
- [Breuer–Magaard–Wilson, *Verification of the ordinary character table of the Baby
  Monster*, arXiv:1902.07758v2](https://arxiv.org/abs/1902.07758v2), §§2–3.1 for the
  presentation and its dependency on the Monster's having no proper double cover.
- [Ivanov, *Presenting the Baby Monster*, J. Algebra 163 (1994), 88–108](https://doi.org/10.1006/jabr.1994.1005),
  for the Baby Monster presentation theorem.
- [Ivanov, *Y-groups via Transitive Extension*, J. Algebra 218 (1999), 412–435](https://doi.org/10.1006/jabr.1999.7882),
  especially the definition on p. 413, Lemma 3.2, and §3.9, for the Monster
  Coxeter-plus-spider group and its central quotient.
- Griess, *The Schur multipliers of the known finite simple groups, III*, Proceedings of
  the Rutgers Group Theory Year, 1983–1984 (1985), 69–80, for the central-extension
  prerequisite cited by Breuer–Magaard–Wilson.
- [FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean) for independent
  formal permutation models of the fourteen P1 groups; its results require a proved
  presentation equivalence before they apply to Tau Ceti's carriers.

The source labels in P2-N refer to these presentations and construction arguments:

- [C][src-c]: the exact Tau Ceti sporadic dispatcher and its imported presentations at
  revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; [A][src-a]: the ATLAS representation
  catalogue. Each selected model is linked directly in the construction table.
- [J3][src-j3] and [J4][src-j4]: the ATLAS Magma presentation artifacts, including their
  subgroup words and index targets. For the J4 construction, see Bolt–Bray–Curtis,
  [*Symmetric presentation of the Janko group J4*](https://doi.org/10.1112/jlms/jdm086), §5.
- [Ru][src-ru]: Soicher's pinned `tcenum` input. Its word conventions are defined by the
  [parser at the same
revision](https://raw.githubusercontent.com/lhsoicher/tcenum/fb9dd89130fca8ad7dc4a92537c96ce7b30b62f1/src/tcfrontend.c).
  The construction source is Bradley–Curtis–Malik,
  [*Symmetric generation of the Rudvalis group*](https://doi.org/10.1112/jlms/jdq039).
- [ON][src-on] and [F23][src-f23]: records `GPLTable.ON.1` and `GPLTable.Fi23.1` of
  Lindenbergh's Group Presentations Library, following Praeger–Soicher,
  [*Low Rank Representations and Graphs for Sporadic Groups*, Chapter 4](https://doi.org/10.1017/CBO9780511526039.005).
- [F24][src-f24]: Kim–Michler, *Construction of Fischer's sporadic group Fi24′ inside
  GL8671(13)*, Lemma 6.2(a)–(c) and Theorem 6.3 for the parent presentation and its
  permutation action. P2-N assigns the presentation-kernel and stabilizer-order proofs
  needed to certify that action.
- [HN][src-hn]: Bray–Curtis, *The construction of the Harada–Norton group*, §§3–5;
  use the first constructor in [the corrected `HNpb.m`](https://webspace.maths.qmul.ac.uk/j.n.bray/Papers/HN/HNpb.m)
  and the [author's errata](https://webspace.maths.qmul.ac.uk/j.n.bray/Papers/HN/HN.html).
- [Ly][src-ly]: Havas–Sims, *A presentation for the Lyons simple group*, §14.2,
  relations (14.1)–(14.86), and §14.4 for the enumeration on the six retained generators.
- [Th][src-th]: Havas–Soicher–Wilson, *A presentation for the Thompson sporadic simple
  group*, Theorem 3.1 for the relators and subgroup tower, §4 for matrix generators,
  and §5 for the global enumeration.

[src-c]: https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.lean
[src-a]: https://brauer.maths.qmul.ac.uk/Atlas/v3/
[src-j3]: https://brauer.maths.qmul.ac.uk/Atlas/spor/J3/mag/J3G1-P1.M
[src-j4]: https://brauer.maths.qmul.ac.uk/Atlas/spor/J4/mag/J4G2-P1.M
[src-ru]: https://raw.githubusercontent.com/lhsoicher/tcenum/fb9dd89130fca8ad7dc4a92537c96ce7b30b62f1/presentations/Ru
[src-on]: https://doris.tudelft.nl/~rlindenbergh/GPL/gpl.g
[src-f23]: https://doris.tudelft.nl/~rlindenbergh/GPL/gpl.g
[src-f24]: https://arxiv.org/abs/0906.1064
[src-hn]: https://webspace.maths.qmul.ac.uk/j.n.bray/Papers/HN/HNpap.pdf
[src-ly]: https://doi.org/10.1007/978-3-0348-8716-8_14
[src-th]: https://webspace.maths.qmul.ac.uk/r.a.wilson/pubs_files/Thpres2web.pdf

[rank24]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/a838aeb54c36525aca3cef75e2ba490c13eaa6c0/TauCetiRoadmap/Rank24LatticeConstructions/README.md#layer-6-the-leech-lattice-by-construction-b-and-an-odd-shift
[sporadic-orders]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/64862692c543bd22f7e6d7e20d5f44a4be9e8add/TauCetiRoadmap/SporadicOrders/README.md
[certified-perm]: https://github.com/vincentqb/TauCetiRoadmap/blob/6a9ba06f2adc96eaad00849da88b225eb21c1d33/TauCetiRoadmap/CertifiedPermutationComputation/README.md
