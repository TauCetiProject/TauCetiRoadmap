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
  `ValidLieTypeIndex.Group`, `SporadicName.presentation`, and `SporadicName.Group`. This roadmap
  proves properties directly for the explicit Lie carriers in those definitions. CFSGStatement
  separately owns L4 and L5, which identify them with pinned Chevalley–Demazure points and
  intertwine their Steinberg maps. Those identifications can transport reusable results, but
  they are not prerequisites for the basic-property theorems.
- The [ReductiveGroups roadmap](../ReductiveGroups/README.md) owns general Borel, root-datum,
  Bruhat, and pinned group-scheme theory (Layers 7–9). The present roadmap owns the finite-field
  descent of a Steinberg map, the BN-pair and root-group calculus on its **finite fixed points**,
  and the resulting simplicity theorem. Existing `TauCeti.TitsSystem` and its Bruhat-cell API are
  the starting interface; extend them for the general group-theoretic theorems below. The
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
| F1: all Lie-type groups finite | F0, CFSGStatement L1–L3 | `Finite d.FixedPoints` and `Finite d.Group` for each of the seventeen constructors |
| T0: abstract simplicity machinery | `TauCeti.TitsSystem`, Mathlib group actions | a normal-subgroup/simplicity criterion for a split BN-pair with root groups |
| T1: fixed-point root calculus | T0, ReductiveGroups Layers 7–9, CFSGStatement L1–L3 | ambient generation, Steinberg descent, BN-pairs, and root relations for the ordinary and graph-twisted families |
| T2: ordinary and graph-twisted simplicity | T1, F1 | `IsSimpleGroup d.Group` on those thirteen constructors, including valid small fields |
| P0: presentation and action certificate tools | Mathlib presentations, CFSGStatement S0 | sound finite-index, normal-form, finite-action, and normal-closure certificate checkers |
| T3: Suzuki, Ree, and Tits simplicity | T0, F1, P0, CFSGStatement L2–L3 | `IsSimpleGroup d.Group` on all four half-Frobenius constructors |
| P1: externally constructed sporadics | P0, CFSGStatement S1 | proved recognition and basic properties for the fourteen names with existing Lean permutation models |
| P2: remaining sporadics | P0, P1, CFSGStatement S1, AlgebraicCodingTheory Golay code | explicit finite models, recognition, and simplicity for the other twelve presented groups |
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
faithfully represented carrier or follow from a proved generation theorem.

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

Build the **full** root-group calculus on CFSGStatement's explicit ambient carriers and their
Steinberg fixed points. Positive simple root subgroups already named there are only the entry
point: supply negative simple and all real-root subgroups, their finite-field parameter groups, Weyl
representatives, torus normalization, Chevalley commutator relations, and the rank-one and
rank-two relations needed for Bruhat decomposition. Prove that these root groups and the torus
generate the **whole explicit ambient carrier**, with a Bruhat decomposition and distinct cells;
relations checked only on a named subgroup do not suffice. Show that the Steinberg map permutes
the ambient root data and preserves this decomposition. Prove fixed-point Bruhat descent,
including the factorization of invariant cells and the generation of the finite fixed-point
group by the resulting twisted root groups and torus. Establish the needed fixed-point
factorization either by a Lang–Steinberg theorem with its hypotheses checked on the explicit
carrier or by direct matrix-coordinate arguments. The L5 identification may shorten a proof
only after its Steinberg compatibility has been established.

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

For each name, construct a concrete realization independently of its presentation, prove that
realization finite, check the exact presentation-to-realization map, certify a finite upper
bound for its presented group, and prove simplicity of the realization by an action or
normal-closure argument. A finite upper
bound on a presentation alone does not supply a nontrivial simple target. Use P0's compressed
certificate interfaces for large groups. For `J4`, certify the involution-centralizer order
and its index `3,980,549,947` cited in the Tau Ceti presentation file through a compressed
double-coset or subgroup-tower certificate; an explicit table with one row per coset is not
the intended Lean artifact. The `Fi24Prime` proof must certify the index-two
Reidemeister–Schreier passage used by its presentation.

For `Co1`, construct the Leech lattice from the Golay-code input of
[AlgebraicCodingTheory](../AlgebraicCodingTheory/README.md), prove its lattice and automorphism
properties needed to obtain the concrete quotient of its automorphism group by `{±1}`.
Prove finiteness through its faithful action on the finite set of minimal vectors, and
identify that quotient with the `Co1` presentation. This is an upstream dependency of the
next construction. For `M`, construct the Griess algebra and the group generated by the
`2^{1+24}_+.Co1` action and
triality automorphism. Formalize a finite, kernel-checked axis-orbit and stabilizer
certificate that proves its order, following
[Höhn–Seysen](https://arxiv.org/abs/2508.01037); the mere fact that it acts on a
finite-dimensional algebra does not prove the group is finite. Prove Monster simplicity by
formalizing the local normal-subgroup argument of Höhn–Seysen, which uses its visible
`2^{1+24}_+.Co1` subgroup and triality. Construct `B` as the quotient of the centralizer of a
`2A` involution by the involution it generates, certify its order by the corresponding
baby-axis calculation, and give an independent simplicity proof for that quotient using P0's
normal-closure or action criterion. Finally verify the `Y₄₄₃` and `Y₄₃₃` relators on the
constructed generators and certify
upper bounds for the two **presented** groups by compressed subgroup and transitive-extension
arguments. Comparing those bounds with the concrete model orders gives the required
`MulEquiv`s. The Coxeter shapes and the relator maps alone prove neither finiteness nor
recognition. Group-specific constructions and certificates live in these twelve cases, while
their soundness theorems and group-action criteria live in P0.

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
- [Höhn–Seysen, *The Order of the Monster Finite Simple Group*](https://arxiv.org/abs/2508.01037)
  for the Griess-algebra construction, Monster and Baby Monster order arguments, and
  accompanying axis-orbit certificate data.
- [FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean) for independent
  formal permutation models of the fourteen P1 groups; its results require a proved
  presentation equivalence before they apply to Tau Ceti's carriers.
