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

The intended Tau Ceti home is `TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/` for
family results, with reusable presentation, group-action, finite-field, and Tits-system theorems
in their existing mathematical homes. The final assembly imports the family theorems; it does not
recompute their proofs by unfolding the four-way index.

## Starting points and ownership

- CFSGStatement owns `CFSGIndex`, its validity ranges, its seventeen Lie-type constructors,
  `ValidLieTypeIndex.Group`, `SporadicName.presentation`, and `SporadicName.Group`. Every
  Lie-type branch there is the derived central quotient of the fixed points of a Steinberg map on
  one ambient group, the simply connected Chevalley group `ChevalleyGroup d.dynkinType _ d.Closure`
  of its Dynkin type; there is no family-specific carrier to prove anything on. CFSGStatement
  separately owns L4, which identifies the Suzuki branch with Mathlib's `suzukiGroup`; it can
  transport results, but it is not a prerequisite for the basic-property theorems.
- The [Chevalley groups roadmap](../ChevalleyGroups/README.md) owns the theory of the ambient
  group: root subgroups for every root, the commutator formula, the Bruhat decomposition and Tits
  system of the group over a field, its centre, Steinberg's presentation, generation of the points
  over an algebraically closed field by root subgroups, and the Frobenius, graph, and exceptional
  endomorphisms with their action on root subgroups (C2 to C5 there). The
  [ReductiveGroups roadmap](../ReductiveGroups/README.md) owns abstract Borel, root-datum, and
  Bruhat theory. The present roadmap owns everything about **finite fixed points**: the
  finite-field descent of a Steinberg map, the twisted root groups, the BN-pair of the fixed-point
  group, and the resulting simplicity theorem. Existing `TauCeti.TitsSystem` and its Bruhat-cell
  API are the starting interface; extend them for the general group-theoretic theorems below. The
  [Mathlib BN-pair work](https://github.com/leanprover-community/mathlib4/pull/40363) informs
  names and structure, while Tau Ceti supplies what the endpoint needs regardless of its timing.
- Mathlib supplies the prime-order cyclic group theory, the simplicity of alternating groups of
  degree at least five, and `MulAction.IwasawaStructure.isSimpleGroup`. Reuse those results and
  prove the small transport lemmas needed by the exact CFSGStatement carriers.
- The existing finite-field and matrix-coordinate lemmas in the CFSG files, including the
  `fixedField` and Suzuki descent results, are inputs. Their existence alone does not make an
  algebraic-closure-valued point group finite.

Every proof of `IsSimpleGroup` must also establish the candidate is nontrivial. A proof that a
quotient is simple because an assumed target is simple, or that a presentation is finite because
the source calls it a finite group, does not discharge an item.

## Milestone graph

| Item | Depends on | Deliverable |
| --- | --- | --- |
| E0: elementary branches | CFSGStatement, Mathlib | `Finite` and `IsSimpleGroup` for every cyclic and alternating index |
| F0: finite fixed-point criterion | Mathlib finite fields and matrices | a reusable theorem bounding Steinberg fixed points by finite matrix coordinates |
| F1: all Lie-type groups finite | F0, Chevalley groups C4, CFSGStatement L1–L3 | `Finite d.FixedPoints` and `Finite d.Group` for each of the seventeen constructors |
| T0: abstract simplicity machinery | `TauCeti.TitsSystem`, Mathlib group actions | a normal-subgroup/simplicity criterion for a split BN-pair with root groups |
| T1: fixed-point root calculus | T0, Chevalley groups C2–C5, CFSGStatement L1–L3 | Steinberg descent, twisted root groups, BN-pairs, and root relations on the fixed points of the ordinary and graph-twisted families |
| T2: ordinary and graph-twisted simplicity | T1, F1 | `IsSimpleGroup d.Group` on those thirteen constructors, including valid small fields |
| P0: presentation and action certificate tools | Mathlib presentations, CFSGStatement S0 | sound finite-index, normal-form, finite-action, and normal-closure certificate checkers |
| T3: Suzuki, Ree, and Tits simplicity | T0, F1, P0, Chevalley groups C2–C5, CFSGStatement L2–L3 | `IsSimpleGroup d.Group` on all four half-Frobenius constructors |
| P1: externally constructed sporadics | P0, CFSGStatement S1 | proved recognition and basic properties for the fourteen names with existing Lean permutation models |
| P2: remaining sporadics | P0, P1, T1–T3, CFSGStatement S1, AlgebraicCodingTheory Golay code | explicit finite models, recognition, and simplicity for the other twelve presented groups |
| A0: assembly | E0, F1, T2, T3, P1, P2 | the two uniform `CFSGIndex` theorems above |

The rows are mathematical dependencies, not a requirement for one PR per row. The finite-field,
Lie-structure, and sporadic lanes can progress independently once their listed inputs exist.

## E0: cyclic and alternating branches

For `.cyclic p hp`, prove finiteness of `Multiplicative (ZMod p)` and simplicity from `hp` using
Mathlib's prime-cardinality criterion. For `.alternating n hn`, prove finiteness of
`alternatingGroup (Fin n)` and use Mathlib's general `n ≥ 5` simplicity theorem. State the
results for those exact types, not for a separately named cyclic or alternating group.

## F0–F1: finiteness of the Lie-type candidates

Prove a general **finite-coordinate fixed-point criterion**. Let a group embed faithfully in a
finite matrix type over a field of characteristic `p`, and let `F` be an endomorphism. If some
positive iterate `F^r` acts on every matrix coordinate by `x ↦ x^(p^e)` with `e > 0`, then
`fixedSubgroup F` is finite: its entries lie among the roots of `X^(p^e) - X`. Package the
result for a faithful finite-dimensional representation, for subgroups of `GL`, and for transport
across an intertwining `MulEquiv`. Give the induced `Finite` instances for a subgroup's derived
subgroup and its quotient by its centre. The latter transport is general group theory, not a
Lie-specific calculation.

For each of the nine ordinary families (`A`, `B`, `C`, `D`, `E6`, `E7`, `E8`, `F4`, `G2`), prove
the required coordinate formula for the CFSGStatement Steinberg map. For the four graph-twisted
families (`twistedA`, `twistedD`, `twistedE6`, `trialityD4`), prove that the finite-order graph
part commutes with Frobenius and that a positive iterate has the coordinate formula. For
`suzuki`, `reeG2`, `reeF4`, and `tits`, use the proved square of the half-Frobenius Steinberg
map, then verify the coordinate formula for the corresponding field Frobenius. Proving the
formula merely on the named simple root subgroups is insufficient: it must hold on the whole
faithfully represented carrier or follow from a proved generation theorem, such as generation by
root subgroups over an algebraically closed field (C4 of the Chevalley groups roadmap).

Apply F0 to each branch to obtain `Finite d.FixedPoints` and `Finite d.Group`, and assemble
`ValidLieTypeIndex.finite` by cases. This includes the Tits group and every small parameter
retained by `LieTypeIndex.Valid`. Record the field size and the positive iterate in branch lemmas
for use by the simplicity proofs without unfolding the entire dispatcher.

## T0: a reusable simplicity criterion

Extend `TauCeti.TitsSystem` with distinct Bruhat cells, its Coxeter graph, standard parabolics,
and a split structure: a solvable normal subgroup `U` of `B`, with `B = U · (B ∩ N)`.
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

The ambient root-group calculus is consumed, not rebuilt: the root subgroups for every root, Weyl
representatives, the torus, the commutator formula, the Bruhat decomposition with distinct cells,
the Tits system, and generation of the ambient group by root subgroups are C2 to C4 of the
Chevalley groups roadmap, and the action of the Frobenius and graph automorphisms on every root
subgroup, with its signs, is C5 there. Build on them the calculus of the **Steinberg fixed
points**: the finite-field root groups, the fact that the Steinberg map permutes the ambient root
subgroups and preserves the Bruhat decomposition, fixed-point Bruhat descent including the
factorization of invariant cells, and the generation of the finite fixed-point group by the
resulting twisted root groups and torus. Establish the needed fixed-point factorization by direct
root-subgroup arguments on the Chevalley group, which need no Lang–Steinberg theorem: Steinberg,
*Lectures on Chevalley Groups*, Chapter 11, Theorem 33, derives the Bruhat decomposition of the
fixed points from the uniqueness in the ambient one. First construct Steinberg-fixed
representatives of the invariant Weyl-group elements in the ambient normalizer. Prove their
existence before using uniqueness of the ambient Bruhat factors to descend the corresponding
cells; an invariant Weyl-group element alone does not supply a fixed representative.

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
half-Frobenius maps. Prove generation, the local commutator relations, nontriviality and
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
Give the generator dictionary explicitly: express the ATLAS generators as words in the
rewritten root generators and give inverse words modulo the central quotient, checking the
relators and both composites. The induced equivalence must identify the specified generators
of the 1600-point action with those words.
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
   Reidemeister–Schreier transformations, including the induced equivalence or subgroup
   identification. Certificates may be generated externally, but Lean checks every word equality
   and every relation used.
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

The verifier library should prove round-trip and transport lemmas for presentations, relator
maps, quotient maps, and actions. Avoid a private “sporadic certificate” axiom or a tactic whose
kernel-visible result omits the mathematical check.

## P1–P2: every sporadic presentation

For each name `s`, prove `Finite s.Group` and `IsSimpleGroup s.Group` for the *transcribed*
presentation, and prove its standard [ATLAS](https://brauer.maths.qmul.ac.uk/Atlas/v3/spor/)
order as an additional check on the presentation and recognition map. State the finite-order
theorem by `Nat.card`; the order is not a constructor field or an assumption. Record an explicit
certificate or a proved structural argument for each name in its own module, then assemble the
uniform results by cases on `SporadicName`.

P1 covers the fourteen names for which
[FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean) gives a Lean
permutation construction with proved order and simplicity: `M11`, `M12`, `M22`, `M23`, `M24`,
`J1`, `J2`, `HS`, `McL`, `Co2`, `Co3`, `Suz`, `Fi22`, and `He`.

For each, prove that the Tau Ceti relators hold of the model's specified generators and that
these generate it, then prove the **upper bound** needed to turn the induced surjection into a
`MulEquiv`. Its published simplicity theorem can then be transported to
`SporadicName.Group`. Coordinate with that project's author and follow the repository's
[porting and licence rules](../../CONTRIBUTING.md#porting-existing-work); citing an external
theorem or importing an unlicensed copy is not a substitute for a Tau Ceti proof.

P2 covers the other twelve names, with the same `Finite`, `Nat.card`, and `IsSimpleGroup`
deliverables: `J3`, `J4`, `Ru`, `ONan`, `Co1`, `Fi23`, `Fi24Prime`, `HN`, `Ly`, `Th`, `B`, and `M`.

For each name, construct a finite realization independently of its presentation, check the
exact presentation-to-realization map, certify an upper bound for the presented group,
and prove simplicity of the realization. Use P0's checked certificate interfaces, with
compressed words and local structures for the large cases.

| P2 item | Depends on | Deliverable |
| --- | --- | --- |
| P2-N: nine presentation models | P0, P1, T1–T3 | the nine construction, recognition, and simplicity certificates below |
| P2-L: Leech and Conway bridges | P0, P1's Mathieu and Co2 models, AlgebraicCodingTheory Golay code | identified code and lattice actions, Co1 recognition, mod-two module and Co2 stabilizer |
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
[AlgebraicCodingTheory](../AlgebraicCodingTheory/README.md), including its coordinate
numbering. Prove an explicit equivalence between the P1 `M24` model and the full permutation
automorphism group of `C`, compatible with their actions on the 24 coordinates. If the
construction uses another Golay matrix, supply the coordinate permutation identifying the
two codes. The coding roadmap explicitly excludes this Mathieu identification; neither its
code construction nor P1's abstract order theorem supplies it.

Construct the Leech lattice `Λ` from this code with the coordinate and action conventions
needed below. Prove that its minimal vectors form a finite spanning set, so that their
faithful permutation action proves the lattice isometry group `Co0 := Aut(Λ)` finite. Construct
`Co1 := Co0 / {±1}`, prove its simplicity, and identify it with the exact `Co1`
presentation. Define the induced action on `V := Λ/2Λ`; prove the required kernel,
faithfulness, and irreducibility statements for this action over `F₂`. For a specified short
vector class `λ ∈ V` of type 2 in the Höhn–Seysen conventions, identify
`Stab_Co1(λ)` with the P1 `Co2` model by an explicit
`MulEquiv`. Connect this stabilizer to the corresponding lattice-vector action; an
unrelated permutation group of the same order does not provide that interface.

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
and `S` before applying the two successive orbit–stabilizer arguments to obtain finiteness
and then

```text
|M_alg| = |X⁺| · |X⁻| · |S|.
```

Prove Monster simplicity through Lemmas 5.3–5.5 and Theorem 5.6. This includes the full
normal-subgroup list `1, ⟨z⟩, Q, G` for `G`, using its extraspecial subgroup and the
faithful irreducible `Co1` action on `Λ/2Λ`, and the explicit triality calculations that
exclude each proper possibility for a normal subgroup's intersection with `G`.

Define `B_alg := K/⟨β⁺⟩` and obtain its finiteness and order
`|B_alg| = |X⁻| · |S| / 2` as in Corollary 5.2. Supply the separate P0 simplicity
argument for this quotient, including the action data or prime-order coverage and normal
generation certificates required by the selected criterion. The Monster simplicity
theorem and the Baby Monster order calculation do not discharge this target.

**P2-D: prove the central-extension prerequisite.** Select the recorded Ivanov
presentation route, with the no-proper-double-cover hypothesis attributed to Griess in
[Breuer–Magaard–Wilson, v2, §3.1](https://arxiv.org/pdf/1902.07758v2). Prove this
hypothesis for `M_alg` after P2-M and before Baby Monster presentation recognition.
An explicit sufficient target is that no perfect group admits a surjection onto `M_alg`
with central kernel of order two. This excludes a proper covering group, while allowing
the split extension `C2 × M_alg`. Formalize the required part of Griess's
*The Schur multipliers of the known finite simple groups, III* and any identification
needed to apply it to this construction. Computing the entire Schur multiplier is not a
separate endpoint. Order and simplicity of `M_alg` do not imply this prerequisite.

**P2-R: identify the exact two presentations.** Formalize the recorded presentation
theorems, including their structural hypotheses and the maps to `M_alg` and `B_alg`.
For the Baby Monster this includes the `Y₅₅₅`/BiMonster implication used by Ivanov,
described in Breuer–Magaard–Wilson §2, and the P2-D hypothesis. For the Monster use
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

## A0: assemble the list properties

Prove `CFSGIndex.finite` and `CFSGIndex.isSimpleGroup` by the four constructors, invoking E0,
the uniform F1/T2/T3 Lie-type results, and the P1/P2 sporadic results. Check a test theorem for
one cyclic, one alternating, one ordinary Lie, one graph-twisted, each of Suzuki/Ree/Tits, and
one P1 and one P2 sporadic entry; these are checks of the dispatcher, not replacements for
the uniform proofs. Audit the endpoint's axioms and confirm that no case uses
`ClassificationStatement` or assumes the corresponding basic property.

## References

- R. W. Carter, *Simple Groups of Lie Type*, particularly the root-group, BN-pair, and
  simplicity arguments; R. Steinberg, *Endomorphisms of Linear Algebraic Groups*, for the
  Steinberg fixed-point constructions.
- J. Tits, the simplicity criterion for groups with a BN-pair; see also
  [Conrad's notes on Tits systems and root groups](https://math.stanford.edu/~conrad/249BW16Page/handouts/roottits.pdf)
  for the group-theoretic interface.
- [ATLAS of Finite Group Representations](https://brauer.maths.qmul.ac.uk/Atlas/v3/)
  for named sporadic groups, presentations, finite representations, and orders.
- [Höhn–Seysen, *The Order of the Monster Finite Simple Group*, arXiv:2508.01037v1](https://arxiv.org/abs/2508.01037v1),
  §2.1 for the representation prerequisites and centralizers, §§3–4 and Appendix D for
  axis certificates, and §5 for the order and Monster simplicity arguments.
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
  revision `63586b16b2162abb3cc45001102481d8b9f86cad`; [A][src-a]: the ATLAS representation
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

[src-c]: https://github.com/TauCetiProject/TauCeti/blob/63586b16b2162abb3cc45001102481d8b9f86cad/TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.lean
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
