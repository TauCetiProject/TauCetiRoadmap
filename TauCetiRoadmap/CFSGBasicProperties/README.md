# Roadmap: finiteness and simplicity of the groups on the CFSG list

**Summary.** The classification of finite simple groups lists the cyclic groups of prime order,
the alternating groups of degree at least five, the groups of Lie type and twenty-six sporadic
groups. [CFSGStatement](../CFSGStatement/README.md) turns that list into data: an index type whose
entries carry explicit groups, and a proposition saying that every finite simple group is
isomorphic to one of them. This roadmap proves the other, concrete half: every group on the list is
finite and simple. The groups are taken exactly as the index defines them: `ℤ/p` written
multiplicatively; the alternating group on `n ≥ 5` letters; for a Lie-type index, with ambient
matrix group `G` over the algebraic closure of `𝔽_p` and Steinberg endomorphism `F`, the derived
subgroup of the fixed-point group `G^F` modulo its own centre; and for a sporadic name, the group
presented by the generators and relators recorded for it.

The headline theorems are these.

- For every index `i` of the classification list, the group attached to `i` is finite and simple.
- For every valid Lie-type index (ordinary, graph-twisted, Suzuki, Ree, and the Tits group, at every
  field size the index admits), the group `[G^F, G^F] / Z([G^F, G^F])` is finite and simple.
- For each of the twenty-six sporadic names, the presented group is finite, simple, and of the order
  listed in the ATLAS. The upper bound on its order is proved from the presentation itself; a group
  that merely satisfies the relators bounds it only from below.
- The presented Monster has exactly two conjugacy classes of involutions, whose centralizers have
  orders `2·|B|` and `2²⁵·|Co₁|`; it has an irreducible complex representation of degree 196883; it
  has exactly 194 conjugacy classes, hence exactly 194 irreducible complex characters.

The roadmap proves neither the classification itself nor that the listed groups are pairwise
nonisomorphic.

CFSGStatement supplies the index, the carriers and the comparison of the explicit ambient matrix
groups with the Chevalley–Demazure points. [ChevalleyGroups](../ChevalleyGroups/README.md)
supplies root subgroups, the commutator formula, the Bruhat decomposition and the Frobenius, graph
and exceptional endomorphisms of those points. [SporadicOrders](../SporadicOrders/README.md)
supplies ten permutation models of sporadic groups, their orders and surjections onto them from
the presented groups. The Leech lattice of
[Rank24LatticeConstructions](../Rank24LatticeConstructions/README.md) and the extended Golay code
of [AlgebraicCodingTheory](../../Completed/AlgebraicCodingTheory/README.md) are the inputs to the
Conway groups and the Monster. From the Tau Ceti library come the cyclic and alternating cases,
the finiteness of every Lie-type group, Tits's simplicity criterion for split BN-pairs, Iwasawa's
criterion for central quotients, and the simplicity of the type-`A` and Suzuki families.

Layer 1 sets up split Tits systems; Layers 2 and 3 build the root calculus of the Steinberg fixed
points and prove the ordinary and graph-twisted groups simple. Layer 4 proves the soundness
theorems for bounding, recognizing and proving simple presented groups. Layer 5 treats the Ree and
Tits groups. Layers 6 to 10 treat the sporadic groups: fourteen with existing permutation models,
nine more by permutation or matrix models, the Conway groups through the Leech lattice, and the
Monster and Baby Monster through the Griess algebra. Layer 11 classifies the conjugacy classes of
the Monster, and Layer 12 assembles the list.

## Conventions

1. **Exact carriers.** The group attached to an index is `TauCeti.CFSGIndex.Group`, and every
   theorem is about that type: `Multiplicative (ZMod p)` for a prime `p`, Mathlib's
   `alternatingGroup (Fin n)` for `n ≥ 5`, `TauCeti.ValidLieTypeIndex.Group` for a Lie-type index,
   and `TauCeti.SporadicName.Group`, the `PresentedGroup` of the recorded relator set, for a
   sporadic name. A group built for a proof (a finite matrix group, a permutation group, a quotient)
   reaches the indexed group only through a proved `MulEquiv`. Equal orders or a shared name do not
   identify two groups: `A₈` and `L₃(4)` both have order 20160 and are not isomorphic.
2. **Lie-type notation.** For `d : TauCeti.ValidLieTypeIndex` write `p` for its characteristic,
   `q` for its field order, `K` for the algebraic closure of `𝔽_p`, `G = d.AmbientGroup` for its
   designated ambient group, `F = d.steinberg` for its Steinberg endomorphism, `Frob_q` for the
   entrywise `q`-power map `d.frobenius`, and `H = d.FixedPoints = fixedSubgroup F`. Then
   `d.Group = DerivedCentralQuotient H = [H, H] / Z([H, H])`; the centre is taken inside `[H, H]`,
   never inside `H` or `G`. The designated ambient groups are Tau Ceti's explicit carriers: classical
   matrix groups and explicit spin, weight-module and short-root carriers. They are not
   definitionally the Chevalley–Demazure points `Gᶜ_d` of CFSGStatement Layer 1; the comparison of
   the two, matching root subgroups and intertwining the Steinberg maps, is CFSGStatement §3.1, and
   its effect on the fixed points and candidate groups is CFSGStatement §4.1.
3. **Families.** The thirteen *ordinary and graph-twisted* constructors are the nine untwisted
   families `A, B, C, D, E₆, E₇, E₈, F₄, G₂` and the four graph-twisted families `²A, ²D, ²E₆,
   ³D₄`. The four *half-Frobenius* constructors are Suzuki `²B₂(2^(2m+1))`, Ree `²G₂(3^(2m+1))`,
   Ree `²F₄(2^(2m+1))` for `m ≥ 1`, and the Tits index, which is `²F₄(2)` with `q = 2`.
4. **What validity gives.** The validity predicate `TauCeti.LieTypeIndex.Valid` restricts parameters
   (ranks, small fields, duplicate representatives). Neither it nor the word "sporadic" supplies a
   finiteness or simplicity hypothesis. The excluded cases, such as `A₁(2)`, `A₁(3)` and `B₂(2)`, are
   not proof cases; every retained case is, including the small fields.
5. **Simplicity includes nontriviality.** Every proof of `IsSimpleGroup` establishes that the group
   is nontrivial. No proof deduces that a quotient is simple because an assumed target is simple,
   that a presented group is finite because a source calls it finite, or uses
   `TauCeti.ClassificationStatement`.
6. **Orders.** Orders are `Nat.card`. An order is a theorem about the carrier, never a constructor
   field or an assumption.
7. **Permutations and words.** Permutation products follow Mathlib, `(σ * τ) x = σ (τ x)`. A signed
   word is evaluated by the left fold `acc * letter`. Conjugation by a word `w` is `w⁻¹ x w`, as in
   Tau Ceti's `TauCeti.Relator.conj`, and the literature's commutator is `[t, u] = t⁻¹ u⁻¹ t u`.
   Sources that compose left to right (GAP, Magma, the ATLAS, `tcenum`) are read through a proved
   dictionary covering products, inverses and conjugation, never by reusing a source word
   silently.
8. **Certificates.** A certificate is finite data (words, straight-line programs, coset tables,
   stabilizer chains, conjugating words) consumed by a soundness theorem of Layer 4; every word
   equality and relation it uses is checked in Lean. Running GAP, Magma or a script is a way to
   produce a certificate, not a proof of its soundness or of its contents. No axiom, and no tactic
   whose kernel-checked result omits the mathematical check, replaces a soundness theorem. No
   randomized algorithm and no Jordan-type recognition theorem is part of any proof here.
9. **Bounds.** A homomorphism from a presented group onto a finite group bounds the presented group
   from below. Finiteness of a presented group needs an upper bound proved from its relators: a
   finite index of a subgroup of bounded order, or a finite spanning set of words.
10. **Milestone labels.** Other roadmaps cite this one by the labels E0, F0, F1, T0–T3, P0–P2, P2M
    and A0. The layer headings below carry the labels T0 to A0; E0, F0 and F1 are the cyclic and
    alternating branches, the finite-coordinate fixed-point criterion and the finiteness of the
    Lie-type groups, recorded under Scope and ownership.
11. **Homes.** Family results live under `TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/`;
    reusable presentation, group-action, finite-field and Tits-system theorems live in their
    mathematical homes. The final assembly imports the family theorems and does not reprove them by
    unfolding the four-way index. All carriers live in `Type`.

## Layer 1: split Tits systems (T0)

Tau Ceti carries Tits systems (`TauCeti.TitsSystem`), their Bruhat decomposition with distinct
cells, the classification of the subgroups containing `B` by the standard parabolics, and Tits's
simplicity criterion for the normal closure of a solvable subgroup `U` normalized by `B`. This
layer adds the split structure that the fixed-point groups of Layers 2, 3 and 5 carry, so that the
criterion can be applied to them. The
[Mathlib BN-pair work](https://github.com/leanprover-community/mathlib4/pull/40363) informs names and
structure; this layer builds what the roadmap needs regardless of its timing.

### 1.1 Split Tits systems

Define a *split Tits system* on a group `G` as a Tits system `(B, N, S)` on `G` together with a
subgroup `U` such that `U ≤ B`, `U` is normal in `B`, `U` is solvable, `B = U · (B ∩ N)` and
`U ∩ (B ∩ N) = 1`. This is the split BN-pair of the literature, with `B ∩ N` the complement of the
normal subgroup `U` in `B` (Carter, *Simple Groups of Lie Type*). Write `Z = ⋂_{g ∈ G} g B g⁻¹`
and `H⁺` for the normal closure of `U` in `G`.

- A split Tits system satisfies the hypotheses of Tau Ceti's criterion: `B` normalizes `U`, and
  `B ≤ U ⊔ (B ∩ N)`.
- **Transport.** Along a `MulEquiv` `e : G' ≃* G`, a split Tits system on `G` pulls back to one on
  `G'` whose `B`, `N` and `U` are the preimages, with the same Weyl group and simple reflections;
  irreducibility of the Weyl group is preserved.
- **Simplicity.** For a split Tits system with irreducible Weyl group, if `Z ∩ U = 1`, `H⁺ = [G, G]`
  and `[G, G]` is perfect, then the centre of `[G, G]` is `Z ∩ [G, G]`, and
  `DerivedCentralQuotient G` is simple as soon as it is nontrivial; it is nontrivial when `U ≠ 1`.
- **Isomorphism invariance of the conclusion.** If `G' ≃* G`, then
  `DerivedCentralQuotient G' ≃* DerivedCentralQuotient G`, so simplicity of either is simplicity of
  the other.

The simplicity statement is the split-BN-pair criterion of Conrad's notes on Tits systems,
Theorem 2.4. Neither this criterion nor the group-action criterion of Iwasawa uses an order formula
for the whole group. *Route.* The simplicity statement is Tau Ceti's
`TauCeti.TitsSystem.isSimpleGroup_derivedCentralQuotient` with its centre identification
`TauCeti.TitsSystem.center_normalClosure_eq_normalCore_subgroupOf` and its nontriviality statement
`TauCeti.TitsSystem.nontrivial_quotient_normalCore_subgroupOf`, applied to the split data; transport
is `TauCeti.TitsSystem.comap` along `e` with `TauCeti.TitsSystem.IsIrreducible.of_mulEquiv`, and
the quotient comparison is `TauCeti.DerivedCentralQuotient.congr`. *Needs:* Tau Ceti
`TauCeti.TitsSystem`, `TauCeti.TitsSystem.comap`, `TauCeti.TitsSystem.IsIrreducible.of_mulEquiv`,
`TauCeti.TitsSystem.isSimpleGroup_derivedCentralQuotient`,
`TauCeti.TitsSystem.center_normalClosure_eq_normalCore_subgroupOf`,
`TauCeti.TitsSystem.nontrivial_quotient_normalCore_subgroupOf`,
`TauCeti.DerivedCentralQuotient.congr`; Mathlib `IsSolvable`, `Subgroup.normalClosure`.

**Checks.**
- In `SL₂(𝔽₅)` take `B` the upper triangular matrices (order 20), `N` the monomial matrices, and
  `U` the upper unitriangular matrices (order 5). Then `B ∩ N` is the diagonal torus of order 4,
  `B = U · (B ∩ N)` and `U ∩ (B ∩ N) = 1`. Taking `U = B` instead violates the intersection
  equation, since `B ∩ (B ∩ N)` has order 4; it also gives `Z ∩ U = {±1} ≠ 1`.
- `SL₂(𝔽₃)` with the same choices is split, with `|B| = 6`, `|U| = 3`, `B ∩ N = {±1}`,
  `Z = {±1}` and `Z ∩ U = 1`; the normal closure of `U` is all of `SL₂(𝔽₃)`, of order 24. That
  group is not perfect (its derived subgroup is the quaternion group of order 8), and its quotient
  by `Z` is `PSL₂(3) ≅ A₄`, which is not simple. A form of the simplicity statement without the
  perfectness hypothesis would be false here.

### Examples

`SL_n(k)` over a field, with `B` the upper triangular matrices, `N` the monomial matrices and `U`
the upper unitriangular matrices, is split with irreducible Weyl group `S_n`. The Suzuki group
`Sz(q)`, of order `q²(q² + 1)(q − 1)`, with `B` the stabilizer of a point in its doubly transitive
action on `q² + 1` points, `U` the normal Sylow 2-subgroup of `B`, of order `q²`, and `B ∩ N` cyclic
of order `q − 1`, is split of rank one.

### Dependencies

Tau Ceti's Tits-system library (`TauCeti/GroupTheory/TitsSystem/`) and
`TauCeti.DerivedCentralQuotient`. No other layer and no other roadmap.

## Layer 2: root calculus on the Steinberg fixed points (T1)

This layer builds, for the thirteen ordinary and graph-twisted constructors, the structure theory
of the finite fixed-point group `H = G^F`: twisted root groups, a split Tits system on `H`, and the
comparison of `H` with the finite matrix groups by which some families are studied. The ambient
theory it starts from belongs to ChevalleyGroups (on the canonical points) and to
ReductiveGroups Layer 7 (Borel subgroups, root data and the Bruhat decomposition of a connected
reductive group); the theory of the finite fixed points belongs here.

### 2.1 The ambient root calculus on the designated carrier

For each of the thirteen constructors, establish on the designated carrier `G = d.AmbientGroup`
over `K`: root subgroups `x_α : K → G` (additive parameter) for every root `α`, Weyl
representatives, the torus, the Chevalley commutator formula, the Bruhat decomposition with
distinct cells, a Tits system, generation of `G` by the root subgroups, and the action of
`Frob_q` and of the graph automorphisms on the root subgroups, with its signs. These are
ChevalleyGroups C2 to C5 on the canonical carrier. Either transport them to `G` through a proved
`MulEquiv` that matches root subgroups and intertwines the two independently defined Steinberg
maps, for which CFSGStatement §3.1 supplies the comparison `e_d`, or construct and prove the
statements directly on `G`. The direct route does not wait for CFSGStatement Layer 3, and proves
every listed statement it uses. The numbered simple-root subgroups of the carrier
(`TauCeti.ValidLieTypeIndex.simpleRootSubgroup`) do not by themselves supply the full root family,
the Bruhat decomposition or a Tits system.
*Needs:* Tau Ceti `TauCeti.ValidLieTypeIndex.AmbientGroup`, `TauCeti.ValidLieTypeIndex.steinberg`,
`TauCeti.ValidLieTypeIndex.frobenius`, `TauCeti.ValidLieTypeIndex.simpleRootSubgroup`; for the
transport route ChevalleyGroups C2–C5 and CFSGStatement §3.1.

**Checks.**
- In `SL₃(K)` with `x₁₂(a) = 1 + a E₁₂` and `x₂₃(b) = 1 + b E₂₃`, the commutator
  `x₁₂(a) x₂₃(b) x₁₂(a)⁻¹ x₂₃(b)⁻¹` is `1 + ab E₁₃ = x₁₃(ab)`, while `x₁₂(a)` and `x₁₃(b)` commute
  because `α₁ + (α₁ + α₂)` is not a root.
- In type `A₂` the graph map is `g ↦ J g⁻ᵀ J⁻¹` with `J` antidiagonal with entries `1, −1, 1`; it
  sends `x₁₂(u)` to `x₂₃(u)`. With the plain antidiagonal matrix (all entries `1`) it sends
  `x₁₂(u)` to `x₂₃(−u)`; both maps are involutions, so the sign is invisible on the square and must
  be fixed by the convention.

### 2.2 The Steinberg map on root subgroups, and fixed Weyl representatives

Prove that `F` permutes the ambient root subgroups, `F(x_α(u)) = x_{ρ(α)}(ε_α u^{q_α})` for the
permutation `ρ` of the roots induced by the graph part of `F`, signs `ε_α` and field powers `q_α`;
that `F` preserves `B`, the torus `T` and its normalizer `N`, induces an automorphism of the Weyl
group `W` permuting the simple reflections, and permutes the Bruhat cells,
`F(BwB) = B F(w) B`. Then construct, for every Weyl element `w` invariant under the induced action,
a *fixed Weyl representative*: an element of `N` over `K` that represents `w` and is fixed by `F`.
Solve the required torus correction explicitly and prove existence; an arbitrary lift of `w` need
not be fixed. *Needs:* §2.1.

**Checks.**
- In `SL₂(K)` with `F = Frob_q`, the lift `[[0, c], [−c⁻¹, 0]]` of the nontrivial Weyl element is
  `F`-fixed exactly when `c^q = c`, that is `c ∈ 𝔽_q`; a lift with `c ∉ 𝔽_q` represents the same
  Weyl element and is not fixed.

### 2.3 The fixed-point Bruhat decomposition

For `F`-invariant `w`, let `U_w` be the subgroup generated by the root subgroups of the positive
roots that `w⁻¹` sends to negative roots. Prove that `U_w` is `F`-stable, that the unique
factorization `g = u n_w b` (`u ∈ U_w`, `n_w` the fixed Weyl representative, `b ∈ B`) of an element
of `BwB` is `F`-equivariant, and deduce `(BwB)^F = U_w^F n_w B^F` and the disjoint decomposition
`H = ⨆_{w ∈ W^F} B^F n_w B^F`, where `W^F` is the group of `F`-invariant Weyl elements. The route
is the direct root-subgroup argument from the uniqueness in the ambient decomposition (Steinberg,
*Lectures on Chevalley Groups*, Chapter 11, Theorem 33); it needs no Lang–Steinberg theorem, and
it is not a consequence of the uniqueness of cell indices alone. *Needs:* §§2.1–2.2.

**Checks.**
- For `SL₂(𝔽_q)`, `|B^F| = q(q − 1)` and `|B^F n B^F| = q²(q − 1)`, summing to `q(q² − 1)`; at
  `q = 3` this is `6 + 18 = 24`. Counting `B^F n B^F` as `|B^F|²` would give `6 + 36`, more than
  the group.

### 2.4 Twisted root groups

For an ordinary constructor the finite root groups are `x_α(𝔽_q)`, with the commutator formula
restricted to `𝔽_q`. For a graph-twisted constructor, take the orbits of the diagram–field map on
the roots; for each orbit, the `F`-fixed points of the group generated by its root subgroups form a
twisted root group. Prove the twisted root-group relations (the rank-one shapes over `𝔽_q`,
`𝔽_{q²}` and `𝔽_{q³}`, and the shape of `SU₃` for orbits of type `A₂`), and prove that `H` is
generated by the twisted root groups and the torus `T^F`. *Needs:* §§2.1–2.3.

**Checks.**
- For `²A₂(q)` the orbit `{α₁, α₂, α₁ + α₂}` gives a nonabelian twisted root group of order `q³`,
  a Sylow `p`-subgroup of `SU₃(q)`; at `q = 3` this is `27`, the full `3`-part of
  `|SU₃(3)| = 6048 = 2⁵·3³·7`. Folding only the simple roots would give order `q² = 9`.

### 2.5 The split Tits system on the fixed points

Construct on `H` a split Tits system (§1.1) with `B_H = B^F`, `N_H = N^F` and `U_H = U^F`; prove that
its Weyl group is `W^F`, with the reflections of the `F`-orbits of simple roots as simple
reflections, that its Bruhat cells are those of §2.3, that its Weyl group is irreducible, and that
`Z_H ∩ U_H = 1` for `Z_H = ⋂_{h ∈ H} h B_H h⁻¹`. *Needs:* §§1.1, 2.3–2.4.

### 2.6 Comparisons with other realizations

When a simplicity proof of Layer 3 or Layer 5 works in another realization, the consuming proof
supplies the comparison. For another algebraic-closure ambient group with endomorphism `F'`, prove a
`MulEquiv` `e` with `e (F g) = F' (e g)`; any new coordinate argument concerns `F'` on its own
realization. For a finite-field model (`SL_n(𝔽_q)`, `Sp_{2n}(𝔽_q)`, `SU_n(q)`, an orthogonal group),
prove a `MulEquiv` with `H`, then identify the derived subgroups and centres, through
`TauCeti.DerivedCentralQuotient.congr`, to reach `d.Group`, matching ranks and validity ranges
explicitly. Tau Ceti's `TauCeti.TypeALieIndex.specialLinearEquivFixedPoints`,
`TauCeti.TypeCLieIndex.symplecticEquivFixedPoints`,
`TauCeti.TypeB2LieIndex.symplecticEquivFixedPoints` and
`TauCeti.TypeALieIndex.specialUnitaryEquivFixedPoints` are comparisons of this kind. CFSGStatement
§3.1 is needed only by a proof that passes through the canonical carrier; finiteness on the
designated carrier needs no comparison. *Needs:* Tau Ceti `TauCeti.fixedSubgroupCongr`,
`TauCeti.FixedPointCandidate.congr`, `TauCeti.DerivedCentralQuotient.congr`.

### Examples

For `A₁(q)` the fixed points are `SL₂(𝔽_q)`, the twisted root groups are the two unitriangular
groups of order `q`, and the split Tits system is the one of the Checks of §1.1. For `²A₂(q)` the
fixed points are `SU₃(q)` and the Weyl group `W^F` has order 2.

### Dependencies

Layer 1; Tau Ceti's designated carriers and Steinberg maps; ChevalleyGroups C2–C5 and
CFSGStatement §3.1 on the transport route of §2.1.

## Layer 3: simplicity of the ordinary and graph-twisted groups (T2)

### 3.1 The hypotheses of the criterion on the fixed points

For each of the thirteen constructors, prove that the normal closure in `H` of `U_H` is `[H, H]`, or
give an explicit `MulEquiv` between `H⁺ / (Z_H ∩ H⁺)` and `DerivedCentralQuotient H`; prove that
`[H, H]` is perfect and that `U_H ≠ 1`; and identify the centre of `[H, H]` as `Z_H ∩ [H, H]`,
rather than replacing it by the centre of `H`. A Tits system on a larger group does not establish
these facts for `H`. *Needs:* §§1.1, 2.4–2.5.

### 3.2 Small fields

The validity predicate fixes the parameter range; the proofs must cover it. Prove, for each family,
a lemma whose only hypothesis on the parameters is exactly its `TauCeti.LieTypeIndex.Valid`
hypothesis. The local calculations cover field orders 2 and 3 at every allowed rank as well as the
large fields. Where a uniform commutator argument needs more field elements, prove the remaining
small-field cases by explicit rank-one or rank-two calculations or by a group-action argument. The
retained cases include the higher-rank groups over `𝔽₂`, `G₂(3)` and `F₄(2)`. *Needs:* §3.1.

**Checks.**
- The excluded index `A₁(2)` has `H = SL₂(𝔽₂) ≅ S₃`, whose derived subgroup is cyclic of order 3
  and equal to its own centre, so the candidate is trivial; the excluded `A₁(3)` has
  `[H, H] = Q₈` with centre `{±1}`, so the candidate is the Klein four-group. A family lemma
  without the validity hypothesis would assert that these are simple.
- The retained `A₁(7)`: `SL₂(𝔽₇)` is perfect of order 336 with centre of order 2, so the candidate
  has order 168.

### 3.3 Simplicity

Prove `IsSimpleGroup d.Group` for every valid index of each of the thirteen ordinary and
graph-twisted constructors. The type-`A` constructor is Tau Ceti's
`TauCeti.ValidLieTypeIndex.isSimpleGroup_A`. *Route.* Apply §1.1 to the split Tits system of §2.5
with §3.1, or, where it is shorter, Iwasawa's criterion for central quotients
(`MulAction.IwasawaStructure.isSimpleGroup_derivedCentralQuotient`, with the structure built from a
commutative root subgroup and its conjugates by `MulAction.IwasawaStructure.ofConj`) on a
finite-field model of §2.6: the projective symplectic group for `B₂`
(`TauCeti.TypeB2LieIndex.projectiveSymplecticEquivGroup`, with `Sp₄(𝔽_q)` perfect by
`TauCeti.TypeB2LieIndex.commutator_symplectic_eq_top`), the symplectic groups for `C`, the special
unitary groups for `²A`. *Needs:* §§1.1, 2.5, 2.6, 3.1, 3.2; Tau Ceti
`TauCeti.ValidLieTypeIndex.isSimpleGroup_A`, `MulAction.IwasawaStructure.ofConj`,
`MulAction.IwasawaStructure.isSimpleGroup_derivedCentralQuotient`.

### Examples

`A₁(7)` gives `PSL₂(7)` of order 168; `²A₂(3)` gives `U₃(3)` of order 6048, with `SU₃(3)` perfect
and centre of order `gcd(3, 4) = 1`; `F₄(2)` and `G₂(3)` are retained small-field cases.

### Dependencies

Layers 1–2; Tau Ceti's type-`A` theorem, Iwasawa criterion and finite-field comparisons.

## Layer 4: proof-producing tools for presented groups (P0)

`TauCeti.SporadicName.Group` is the `PresentedGroup` on the exact relator set of
`TauCeti.SporadicName.presentation`, and a finite list of relators does not make a group finite.
This layer proves the reusable soundness theorems by which the sporadic layers bound, recognize and
prove simple their presented groups. Group-specific certificates live in Layers 5 to 11; their
soundness theorems and group-action criteria live here.

### 4.1 Maps and rewriting

Words of a presentation are evaluated in an arbitrary group, and an assignment on which every
relator evaluates to `1` gives a homomorphism out of the presented group (Mathlib
`PresentedGroup.toGroup` with Tau Ceti `TauCeti.GroupPresentation.mem_relatorSet_iff`). Prove:

- **Presentation dictionaries.** Given presentations `P` and `Q`, words for the generators of each in
  the generators of the other, checks that the relators of each hold at those words, and checks
  that the two composites fix every generator, the induced homomorphisms are inverse
  `MulEquiv`s.
- **Reidemeister–Schreier rewriting for an arbitrary Schreier transversal.** For a subgroup `L` of
  the free group on `α` containing the normal closure of the relators, and a Schreier transversal
  `T` of `L` (a prefix-closed set of reduced words, one in each right coset), the nontrivial Schreier
  generators `t a (t a)‾⁻¹` form a free basis of `L`. With
  `PresentedGroup.subgroupPresentationEquiv`, this gives the rewritten presentation of the image
  of `L` in the presented group, with its rewriting map and its value on generators.
- **Straight-line words.** A word given by a straight-line program (a sequence of products and
  inverses of earlier entries) evaluates to the value of its expansion, in every group and along
  every homomorphism; large certificates store words in this form.
- **Transport.** Presentations, relator maps and quotient maps transport along `MulEquiv`s, and the
  actions used along equivariant bijections, with round-trip lemmas for every dictionary.

Generator elimination is Tau Ceti's `PresentedGroup.eliminateGenerators`, and the index-two
rewriting for involutory sources is `TauCeti.IsSchreierIndexTwoSource.mulEquivKerParityHom`,
`TauCeti.IsSchreierIndexTwoSource.mulEquivCommutator` and
`TauCeti.GroupPresentation.mulEquivCommutator` under their even-relator and abelianization
hypotheses. *Needs:* Mathlib `PresentedGroup.toGroup`, `PresentedGroup.toGroup.unique`; Tau Ceti
`TauCeti.GroupPresentation.mem_relatorSet_iff`, `PresentedGroup.subgroupPresentationEquiv`,
`PresentedGroup.eliminateGenerators`.

### 4.2 Finite upper bounds

Prove the soundness theorems for upper bounds on the presented group itself.

- **Coset covers.** Let `L` be the subgroup of `P.Group` generated by given words. If words
  `w₁ = 1, w₂, …, w_n` are such that for every `i` and every generator or inverse generator `x` there
  is `j` with `w_i x w_j⁻¹ ∈ L` in `P.Group`, each membership witnessed by an explicit word in the
  generators of `L` equal to it in `P.Group`, then the cosets `L w_i` cover `P.Group`, so
  `[P.Group : L] ≤ n`. A closed and consistent coset table whose entries are justified by such
  deductions from the relators is an instance.
- **Normal forms.** If a finite set of words containing `1` is closed, in `P.Group`, under right
  multiplication by every generator and inverse generator, then `|P.Group|` is at most its size.
- **Towers.** `|P.Group| ≤ [P.Group : L] · |L|`, and a surjection onto `L` from a group of order at
  most `b` gives `|L| ≤ b`; iterating along a chain of word-defined subgroups bounds `|P.Group|`.

A permutation action on which the relators hold does not certify an index: its point stabilizer may
contain an unaccounted kernel. *Needs:* §4.1; Mathlib `Subgroup.index`, `Nat.card`.

**Checks.**
- `⟨a | ⟩` is infinite and surjects onto every cyclic group, so a surjection onto a finite group
  bounds nothing from above.
- For `⟨a, b | a², b³, (ab)²⟩` the six words `1, b, b², a, ab, ab²` are closed under right
  multiplication by `a` and `b` (using `ba = ab²`, `b²a = ab`, `aba = b²` and `ab²a = b`), so the
  group has order at most 6; the assignment `a ↦ (1 2)`, `b ↦ (1 2 3)` satisfies the relators,
  since `(1 2)(1 2 3) = (2 3)` in Mathlib's convention, and generates `S₃`, so the group is `S₃`.

### 4.3 Lower bounds and recognition

Prove: if generator images in a finite group `M` satisfy the relators of `P` and generate `M`, the
induced homomorphism `P.Group → M` is surjective; if moreover `|P.Group| ≤ |M|` by §4.2, it is a
`MulEquiv`. Prove the order and kernel lemmas used with word-defined subgroups: if `[P.Group : L] ≤
n`, `|L| ≤ m` and `|M| = n m`, the surjection is injective. Package the resulting `MulEquiv` into
`P.Group`, so that recognition never depends on a database label. *Needs:* §4.2.

### 4.4 Permutation-group and simplicity certificates

Prove the soundness of the stabilizer-chain certificates for finite permutation groups, as
applications of SporadicOrders Layer 0: a stabilizer-chain certificate on a generating list yields
the order of the generated group (the order formula of SporadicOrders §0.1, with basic orbits by
§0.2), and a sifting certificate yields membership of a given permutation (the criterion along a
base of §0.3). Prove the action lemmas that the simplicity criteria need for concrete groups:
transitivity from orbit witnesses (a signed word carrying a base point to each point, with an
adapter to Mathlib's `MulAction.orbit`), primitivity from maximality of a point stabilizer (Mathlib
`MulAction.isCoatom_stabilizer_iff_preprimitive`) or from another proved block criterion, and
perfectness from expressions of the generators as products of commutators. No checker library is a
supplier, and a finite-image chain is not an upper-bound certificate for a presented group.

These feed two simplicity criteria. Mathlib's Iwasawa criterion
`MulAction.IwasawaStructure.isSimpleGroup` applies to a nontrivial perfect group with a faithful
quasiprimitive action and commutative subgroups attached to its points. The prime-order normal-generation criterion
is Tau Ceti's: a nontrivial finite group in which every element of prime order is conjugate to an
element that normally generates the group is simple
(`IsMulTorsion.isSimpleGroup_of_isConj_of_normalClosure_eq_top`, since a nontrivial normal subgroup
contains an element of prime order), in its Sylow-local form
`TauCeti.isSimpleGroup_of_card_eq_of_normalClosure_eq_top_of_isConj`, with normal generation
certified by `TauCeti.NormalClosureProgram.normalClosure_eq_top_of_check`. A group-specific
certificate proves both the coverage and the normal generation. *Needs:* SporadicOrders §§0.1–0.3;
Mathlib `MulAction.orbit`, `MulAction.stabilizer`, `MulAction.isCoatom_stabilizer_iff_preprimitive`,
`MulAction.IwasawaStructure.isSimpleGroup`; Tau Ceti
`IsMulTorsion.isSimpleGroup_of_isConj_of_normalClosure_eq_top`,
`TauCeti.isSimpleGroup_of_card_eq_of_normalClosure_eq_top_of_isConj`,
`TauCeti.NormalClosureProgram`.

**Checks.**
- In Mathlib's convention `(1 2)(1 2 3) = (2 3)`, while composing left to right gives `(1 3)`; a
  source word read without the dictionary of Conventions item 7 evaluates to a different
  permutation.
- In `A₅` the elements of order 5 form two conjugacy classes, those of `(1 2 3 4 5)` and of its
  square `(1 3 5 2 4)`, so a coverage list with one representative per element order misses a
  class. The list `(1 2)(3 4)`, `(1 2 3)`, `(1 2 3 4 5)`, `(1 3 5 2 4)` covers every element of prime
  order. In `A₄` the normal closure of `(1 2)(3 4)` is the Klein four-group, so a normal-generation
  certificate for it cannot exist.

### 4.5 Complete conjugacy data

Conjugacy data are Tau Ceti's `TauCeti.ClassData`: an actual list of representatives with a proof
of pairwise nonconjugacy and a proof of coverage. The mass criterion
`List.sum_index_centralizer_eq_card_iff` (a pairwise nonconjugate list of a finite group meets every
class exactly when its centralizer indices sum to the group order) builds class data by
`TauCeti.ClassData.ofSumIndexCentralizer`, and `TauCeti.ClassData.map` transports it along a
`MulEquiv`, agreeing with `MulEquiv.conjClassesEquiv`, with the representatives, classes and class
sizes, inverse classes and power classes compared by `TauCeti.ClassData.rep_map`,
`TauCeti.ClassData.classOf_map`, `TauCeti.ClassData.classFinset_map`,
`TauCeti.ClassData.index_map_inv` and `TauCeti.ClassData.index_map_pow`. Prove the remaining
soundness theorems: compressed proofs of centralizer orders (a word-generated subgroup of the
centralizer of certified order, together with a certified lower bound on the size of the class) and
of pairwise nonconjugacy (a class invariant, such as element order, a power map or a representation
value, that separates the two elements). Certify the group order and each centralizer order
separately before applying the mass criterion. A class-data structure whose coverage is assumed, or
a coverage of the prime-order elements only, is not a complete conjugacy classification. *Needs:* §4.2; Tau Ceti `TauCeti.ClassData`,
`TauCeti.ClassData.ofSumIndexCentralizer`, `TauCeti.ClassData.map`,
`List.sum_index_centralizer_eq_card_iff`.

**Checks.**
- In `S₃` the representatives `1, (1 2), (1 2 3)` have centralizer indices `1, 3, 2`, summing to
  `6 = |S₃|`; the list `1, (1 2)` sums to `4 < 6` and misses the class of 3-cycles.

### Examples

The presentation `⟨a, b | a², b³, (ab)²⟩` of the Checks of §4.2 is recognized as `S₃` by §§4.2–4.3,
and `S₃`'s class data come from §4.5. For `A₅`, the four representatives of the Checks of §4.4,
each with a word expressing the generators `(1 2 3)` and `(3 4 5)` through its conjugates, certify
simplicity by the prime-order criterion.

### Dependencies

SporadicOrders Layer 0; Mathlib's presented groups and group actions; Tau Ceti's presentation,
normal-generation, simplicity-certificate and class-data libraries.

## Layer 5: Suzuki, Ree and Tits groups, and the Lie-type endpoint (T3)

The exceptional isogenies exchange root lengths, so the ordinary fixed-root construction of Layer 2
does not specialize to these branches. The Suzuki branch is Tau Ceti's
`TauCeti.ValidLieTypeIndex.isSimpleGroup_suzuki`; this layer treats Ree and Tits.

### 5.1 The Ree groups

For `²G₂(3^(2m+1))` and `²F₄(2^(2m+1))` with every `m ≥ 1`, build from the half-Frobenius maps
on the designated short-root carriers (Tau Ceti's Steinberg maps) the finite twisted root groups, the opposite
groups, the Weyl representatives and the Bruhat cells. Apply the carrier comparison rule of §§2.1
and 2.6 before consuming ambient results proved on the canonical carrier; otherwise prove the
needed ambient root and Bruhat statements on these carriers. Prove generation, the local commutator
relations, nontriviality and perfectness, and conclude `IsSimpleGroup d.Group` by §1.1 (with the
bridge from `H⁺` to `[H, H]` of §3.1) or by Iwasawa's criterion. *Needs:* §§1.1, 2.1, 2.6, 3.1;
Tau Ceti `TauCeti.ValidLieTypeIndex.steinberg_steinberg_of_usesHalfFrobenius`; ChevalleyGroups
C2–C5 and CFSGStatement §3.1 on the transport route.

**Checks.**
- At `m = 1`, `|²G₂(27)| = 27³ (27³ + 1)(27 − 1) = 10073444472` and
  `|²F₄(8)| = 8¹² (8⁶ + 1)(8⁴ − 1)(8³ + 1)(8 − 1) = 264905352699586176614400`.
- At `m = 0`, `²G₂(3) ≅ PΓL₂(8)` has order 1512 and is not perfect: its derived subgroup `L₂(8)`
  has index 3, so the perfectness step fails there. The index excludes `m = 0`; the group `L₂(8)` is
  on the list as `A₁(8)`.

### 5.2 The Tits group

Treat `.tits` at field order 2 as its own case: no general theorem requiring a larger field covers
it. The split Tits system on the full fixed-point group `²F₄(2)` does not give the bridge of §3.1:
its root-generated subgroup is the whole group, whereas the candidate is the derived central
quotient `²F₄(2)′`, of index 2. Construct a finite model of the derived central quotient using the
[ATLAS 1600-point representation](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/TF42G1-p1600B0)
of `²F₄(2)′`. First prove that the ambient root relations give a complete presentation of `²F₄(2)`
and that its commutator subgroup has index two. Derive the presentation of the commutator subgroup
by Reidemeister–Schreier rewriting (§4.1), identify its central quotient, and prove a Tietze
equivalence with the [ATLAS Tits presentation](https://brauer.maths.qmul.ac.uk/Atlas/v3/exc/TF42/).
Give the dictionary between the rewritten root generators and the ATLAS generators: words for the
ATLAS generators in the rewritten generators, inverse words modulo the central quotient, the
relator checks, and both composite identities. Match those generators to the 1600-point action.
Compare the presentation's upper bound with the order of the generated permutation group by §§4.2
and 4.4, giving a `MulEquiv` from the exact `DerivedCentralQuotient`. Prove the model's order and
simplicity by a normal-closure or primitive-action certificate (§4.4). *Needs:* §§4.1–4.5; Tau Ceti
`TauCeti.ValidLieTypeIndex.Group`, `TauCeti.DerivedCentralQuotient`.

**Checks.**
- `|²F₄(2)| = 2¹² (2⁶ + 1)(2⁴ − 1)(2³ + 1)(2 − 1) = 35942400`, twice
  `|²F₄(2)′| = 17971200`, and `17971200 / 1600 = 11232 = |L₃(3):2|`, the order of a point
  stabilizer of the 1600-point action. A candidate taken as the root-generated subgroup modulo its
  centre would have order 35942400 and is not simple.

### 5.3 The Lie-type endpoint

Prove `validLieTypeIndex_isSimpleGroup`: for every `d : TauCeti.ValidLieTypeIndex`,
`IsSimpleGroup d.Group`, by cases on the constructor from §3.3 (ordinary and graph-twisted), Tau
Ceti's Suzuki theorem, §5.1 (Ree) and §5.2 (Tits). Its finiteness companion
`validLieTypeIndex_finite`, `Finite d.Group` for every valid index including the Tits group and
every retained small parameter, is Tau Ceti's `TauCeti.ValidLieTypeIndex.finite`, through the
finite-coordinate fixed-point criterion and the iterate formulas `F² = Frob_q` (half-Frobenius) and
`F^t = Frob_q^t` with `t` the twist order (ordinary and graph-twisted). *Needs:* §§3.3, 5.1, 5.2;
Tau Ceti `TauCeti.ValidLieTypeIndex.isSimpleGroup_suzuki`, `TauCeti.ValidLieTypeIndex.finite`.

### Examples

`Sz(8)` (order 29120), `²G₂(27)`, `²F₄(8)` and the Tits group `²F₄(2)′` are the smallest cases of
the four half-Frobenius constructors.

### Dependencies

Layers 1–4; Tau Ceti's Suzuki theorem and Lie-type finiteness.

## Layer 6: the fourteen sporadic groups with existing permutation models (P1)

### 6.1 The order table

Define `sporadicOrder : TauCeti.SporadicName → ℕ` as the table of the twenty-six orders listed in
the [ATLAS of Finite Group Representations](https://brauer.maths.qmul.ac.uk/Atlas/v3/spor/). For
each name `s` the targets are `Finite s.Group`, `IsSimpleGroup s.Group` and
`Nat.card s.Group = sporadicOrder s` for the transcribed presentation; the order is a check on the
presentation and on the recognition map. Each name's certificate or structural argument lives in
its own module, and the uniform theorems are assembled by cases in §10.5. *Needs:* Tau Ceti
`TauCeti.SporadicName`.

**Checks.**
- Each entry equals its prime factorization: `|M₁₁| = 2⁴·3²·5·11 = 7920`,
  `|J₄| = 2²¹·3³·5·7·11³·23·29·31·37·43`, `|B| = 2⁴¹·3¹³·5⁶·7²·11·13·17·19·23·31·47` and
  `|M| = 2⁴⁶·3²⁰·5⁹·7⁶·11²·13³·17·19·23·29·31·41·47·59·71`; `41` divides `|M|` and not `|B|`.
- The entry for `Fi24Prime` is `|Fi₂₄′| = 1255205709190661721292800`, half the order of the full
  Fischer group `Fi₂₄`, which is the presented parent group of §7.7.

### 6.2 The ten names with SporadicOrders models

For `M11 M12 M22 M23 M24 J1 J2 HS McL Co3`, consume the canonical ATLAS permutation carriers, their
orders and the surjections from the presented groups of SporadicOrders Layers 1–2. Prove the upper
bounds on the exact presented groups (§4.2) and turn those surjections into `MulEquiv`s (§4.3). The
ten carriers are not redefined from a second set of generators. *Needs:* §§4.2–4.3; SporadicOrders
§§1.1–1.2, 2.2.

### 6.3 The four further models

For `Co2 Suz Fi22 He`, define the permutation models, prove their orders, the presentation maps, the
upper bounds and the recognition. Select the defining permutation data and the constructive proofs
of [FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean), recording the source
commit and numbering in each module, under the
[porting and licence rules](../../README.md#porting-existing-work). *Needs:* §§4.2–4.5.

### 6.4 Simplicity of the fourteen

For all fourteen names, port or rebuild an external constructive simplicity proof and supply an
explicit carrier equivalence to the selected model. When the generators or the action differ, give
forward and recovery words and the equivariant comparison of the actions; equal orders or a shared
group name are insufficient. Transport simplicity only after recognition. These inputs do not
identify Golay automorphisms or Leech stabilizers; those comparisons are §§8.1 and 8.4. *Needs:*
§§4.4, 6.2–6.3.

### Examples

`M₁₁`: the presented group maps onto the 11-point model of order 7920 by SporadicOrders §2.2; an
upper bound `|P| ≤ 7920` from §4.2 makes that map a `MulEquiv`, and the model's simplicity transfers.

### Dependencies

Layer 4; SporadicOrders Layers 1–2; FiniteSimpleGroups as a cited source.

## Layer 7: nine sporadic groups by permutation and matrix models (P2-N)

### 7.1 The construction scheme

For each of `J3 J4 Ru ONan Fi23 Fi24Prime HN Ly Th`, let `P` be the exact Tau Ceti presentation named
in its section and `G` the subgroup generated by the selected finite permutations or matrices. Prove
an explicit `P.Group ≃* G` and transport finiteness, order and simplicity. Representation data
define finite candidates; their ATLAS names do not prove their orders or identify the abstract
presentations ([C][src-c], [A][src-a]). Each construction has four separately checked parts.

1. Pin the representation files, their field and their multiplication convention. Supply a word for
   every presentation generator in the model generators and words recovering the model generators.
   Check every recorded relator. This gives a surjection `P.Group → G`.
2. Bound a word-defined subgroup of `P.Group` by a proved finite presentation or normal form, and
   certify its index by deductions from the original relators (§4.2).
3. Prove the model order independently, by stabilizer chains or finite local structures and orbit
   counts (§4.4), and match this lower bound with the presentation upper bound (§4.3).
4. Prove nontriviality and the simplicity certificate of §7.11. None of these steps assumes CFSG or
   a database simplicity assertion.

*Needs:* Layer 4.

### 7.2 J3

`P = TauCeti.Sporadic.j3Presentation`, eight relators on `a, b`. Generate `G ≤ Sym(6156)` with the
standard permutations of
[J3G1-p6156B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/J3G1-p6156B0), mapping the recorded
`a, b` to them and checking the eight words of ATLAS `J3G1-P1.M`, including its commutator
convention. Put `K = ⟨ab⟩ ≤ P`; the recorded relation gives `|K| ≤ 19`. Check the published
enumeration over these exact words with index at most 2,643,840, so `|P| ≤ 50,232,960`; the model
order is an independent stabilizer-chain certificate. This uses a documented bounded enumeration and
no unproved presentation of a maximal subgroup ([J3][src-j3]). *Needs:* §7.1.

**Checks.**
- `19 · 2643840 = 50232960 = |J₃|`.

### 7.3 J4

`P = TauCeti.Sporadic.j4Presentation`, twelve relators on `x, y, t`. Generate `G ≤ GL(112, 2)` with
[J4G1-f2r112B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/J4G1-f2r112B0), convert its type-I
pair to the source's type-II triple, and certify generation in both directions. The upper bound
follows the source's involution-centralizer double-coset argument ([J4][src-j4]).

Evaluate the source's subgroup words both in `P` and in `G`:

```text
q = yxy (xy⁻¹)² (xy)³
H = ⟨t, x, q, t^(xyxy⁻¹xy), t^(xyxy⁻¹)⟩.
```

First prove `H ≤ C_P(t)`. Bound `|H| ≤ 21,799,895,040` through its `2^(1+12)·3·M22·2` structure: a
normal subgroup `E` of order at most `2^13` with extraspecial commutator form and quotient of order
at most `3·|M22|·2`, with the word maps and collection rules for the central triple cover and the
outer involution. Independently, in `G`, prove `t ≠ 1`, that the corresponding subgroup has order
exactly 21,799,895,040, and that it equals `C_G(t)`; a group of the expected shape elsewhere does not
identify this centralizer.

Then prove `[P : H] ≤ 3,980,549,947` by a double-coset cover: representatives `wᵢ`, the
intersections `H ∩ wᵢ⁻¹ H wᵢ`, their indices in `H`, and a rewrite for multiplication by each of
`x, y, t` on each parametrized block of cosets, each rewrite justified from the twelve relators and
the subgroup normal forms. Closure and inclusion of the identity imply that the blocks cover all of
`P`, with at most 3,980,549,947 right cosets. Counting double cosets in the matrix image proves only
a lower bound. Construct the representatives and transition data and prove the cover sound from the
exact presentation (Bolt–Bray–Curtis, §5). *Needs:* §§4.1–4.3, 7.1.

**Checks.**
- `2¹³ · 3 · 443520 · 2 = 21799895040` and `21799895040 · 3980549947 = |J₄|`.

### 7.4 Ru

`P = TauCeti.Sporadic.ruPresentation`, twelve relators on `u, v, t`. Generate `G ≤ Sym(4060)` with
[RuG1-p4060B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/RuG1-p4060B0), and supply the
dictionary from Soicher's `u, v, t` to the standard pair, checking the exact `tcenum` words and the
implicit relations `v² = t² = 1`. Use the symmetric construction of Bradley–Curtis–Malik for the
dictionary and the subgroup presentation, and prove the Tietze bridge to the exact artifact.

The third `tcenum` field is `t,u,((uvu)-tuvuvtv[t,u]2vtv)2`; decoded with the pinned parser, it gives
the subgroup generators (not extra relators)

```text
w = ((uvu)⁻¹ t u v u v t v [t,u]² v t v)²,
H = ⟨t,u,w⟩,       [t,u] = t⁻¹u⁻¹tu.
```

Prove `|H| ≤ 35,942,400` through a complete presentation of the full `²F₄(2)`, every subgroup relator
derived from the twelve relators of `P`, and certify `[P : H] ≤ 4,060`; the index-two Tits subgroup
does not replace `²F₄(2)`. Prove the dictionary between this `H` and the `²F₄(2)` subgroup of the
symmetric construction before using the index ([Ru][src-ru], [A][src-a]). *Needs:* §§4.1–4.3, 7.1.

**Checks.**
- `35942400 · 4060 = 145926144000 = |Ru|`; with the Tits subgroup's order 17971200 the product is
  half of `|Ru|`, below the model's order.

### 7.5 O’Nan

`P = TauCeti.Sporadic.onanPresentation`, 29 relators on `a, …, g`. Generate `G ≤ Sym(122760)` with
[ONG1-p122760aB0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/ONG1-p122760aB0); construct seven
words giving the diagram generators of the Group Presentations Library and recovery words for the
standard pair, and check the Coxeter path `a3b3c8d3e3f` and all eight additional relations,
including that library's equality convention. Put `H = ⟨a, b, c, d, e, f⟩ ≤ P`; certify index at
most 122,760 and derive a finite presentation bounding `H` by `L₃(7):2`, of order 3,753,792. The bare
six-generator Coxeter subpresentation does not give this bound: the derivation includes the
additional subgroup relators deduced using `g` ([ON][src-on]). *Needs:* §§4.1–4.3, 7.1.

**Checks.**
- `|L₃(7)| = 7³(7² − 1)(7³ − 1)/3 = 1876896`, so `|L₃(7):2| = 3753792`, and
  `3753792 · 122760 = 460815505920 = |O’N|`.

### 7.6 Fi23

`P = TauCeti.Sporadic.fi23Presentation`, 57 relators on `a, …, j`. Generate `G ≤ Sym(31671)` with
[F23G1-p31671B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/F23G1-p31671B0); construct the ten
involutions of the Group Presentations Library as words in the standard pair and recovery words, and
check the Coxeter diagram and both appended words `(dcbdefdhi)^10` and `(abcdefh)^9`. Put
`H = ⟨a, …, i⟩ ≤ P` and certify index at most 31,671. Prove `|H| ≤ 129,123,503,308,800` from a
complete presentation of the double cover `2·Fi22`: construct the central word, prove that it is
central with square `1`, and prove the bridge to a presentation of the quotient of order at most
`|Fi22|`. An order or simplicity theorem for `Fi22` alone does not bound `H` ([F23][src-f23]).
*Needs:* §§4.1–4.3, 6.3, 7.1.

**Checks.**
- `2 · |Fi₂₂| = 129123503308800` and `129123503308800 · 31671 = |Fi₂₃|`; bounding `H` by `|Fi₂₂|`
  would give half of `|Fi₂₃|`, below the model's order.

### 7.7 Fi24′

`P = TauCeti.Sporadic.fi24PrimePresentation`, eleven Schreier generators and 136 relators, which Tau
Ceti identifies with the commutator subgroup of the 80-relator parent
`P₀ = TauCeti.Sporadic.Fi24AutomorphismGroup` by
`TauCeti.Sporadic.fi24PrimeGroupMulEquivCommutator`. Select `Q ≤ Sym(306936)` from the parent
representation
[F24d2G1-p306936B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/permrep/F24d2G1-p306936B0) and set
`G = [Q, Q]`. Construct the twelve parent involutions as words in its standard pair and prove
generation. Recognize `P₀ ≃* Q` first, then transport commutator subgroups through it, retaining
the generator `al`.

In `P₀`, `l` commutes with each of `a, …, j`, and `l = (abcdefh)^9`. Set `A = al, B = bl, …, J = jl`.
Construct a surjection from the exact Fi23 presentation onto `⟨A, …, J⟩`, checking every relation,
in particular `(ABCDEFH)^9 = 1`; the relation `(DCBDEFDHI)^10 = 1` needs `(dcbdefdhi)^10 = 1`, which
is derived from the parent relators and is not literally among them. Prove that
`M = ⟨A, …, J, l⟩ = ⟨a, b, c, d, e, f, g, h, i, j, l⟩`, that `l² = 1` and that `l` centralizes
`⟨A, …, J⟩`, so `|M| ≤ 2|Fi23|`. Certify `[P₀ : M] ≤ 306,936` using all eighty parent relators,
including the order-seventeen word, so `|P₀| ≤ 2|Fi24′|`; this is the subgroup of Kim–Michler,
Lemma 6.2(a), and no faithfulness of a coset action is assumed. Certify the model's parent order and
its derived subgroup of index two; parity is the commutator kernel of the abstract parent. The
comparison of the derived carriers uses the existing maps on `ab, ac, …, ak, al`, not a new
presentation that eliminates `al`: prove that the model's parity map corresponds to the abstract
parity map and identify its kernel with `[Q, Q]`. The order of `G` is
1,255,205,709,190,661,721,292,800 ([F24][src-f24], [F23][src-f23], [C][src-c]). *Needs:* §§4.1–4.3,
7.1, 7.6; Tau Ceti `TauCeti.Sporadic.Fi24AutomorphismGroup`,
`TauCeti.Sporadic.fi24PrimeGroupMulEquivCommutator`.

**Checks.**
- `2 · |Fi₂₃| · 306936 = 2 · |Fi₂₄′|`, the order of the parent `Fi₂₄`.

### 7.8 HN

`P = TauCeti.Sporadic.hnPresentation`, the corrected nineteen relators on `a, b, c, d, t`. Generate
`G ≤ GL(133, 5)` with [HNG1-f5r133B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/HNG1-f5r133B0),
build the five-generator tuple of Bray–Curtis in this model and recovery words, and check the first
presentation of `HNpb.m`, retaining `(ad)²`, the corrected twelfth relator. Put
`H = ⟨a, b, c, d⟩ ≤ P`. Prove `|H| ≤ 177,408,000` through the `2·HS:2` presentation and the
central-extension argument of Bray–Curtis §§3–5, bounding the central `C₂`, the `HS` quotient and the
outer factor separately; the `HS` theorem of §6.4 does not give the double cover. Certify
`[P : H] ≤ 1,539,000` with the corrected five-generator presentation; the published enumeration needs
fewer than two million live cosets ([HN][src-hn]). *Needs:* §§4.1–4.3, 6.4, 7.1.

**Checks.**
- `4 · |HS| = 177408000` and `177408000 · 1539000 = 273030912000000 = |HN|`.

### 7.9 Ly

`P = TauCeti.Sporadic.Lyons.presentation`, the Havas–Sims six-generator presentation with 53
relators. Generate `G ≤ GL(111, 5)` with
[LyG1-f5r111B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/LyG1-f5r111B0); supply the
Havas–Sims `a, b, c, d, e, z` as words in the model and recovery words, and certify the
auxiliary-word substitutions against relations (14.1)–(14.86), retaining `e` and the exact 53
surviving relators. Put `H = ⟨a, b, c, d⟩ ≤ P`. Prove `|⟨a, b, c⟩| ≤ 1,500,000` and its index at most
3,906 in `H`, hence `|H| ≤ |G₂(5)| = 5,859,000,000` from the source's `z`-free presentation, and identify
`H` with an independently constructed `G₂(5)` model; then check `[P : H] ≤ 8,835,156`
([Ly][src-ly]). *Needs:* §§4.1–4.3, 7.1.

**Checks.**
- `1500000 · 3906 = 5859000000 = 5⁶(5⁶ − 1)(5² − 1) = |G₂(5)|` and
  `5859000000 · 8835156 = 51765179004000000 = |Ly|`.

### 7.10 Th

`P = TauCeti.Sporadic.Thompson.presentation`, eight generators and 39 relators in six source blocks.
Generate `G ≤ GL(248, 2)` with
[ThG1-f2r248B0](https://brauer.maths.qmul.ac.uk/Atlas/v3/matrep/ThG1-f2r248B0); construct the
eight-generator tuple of Havas–Soicher–Wilson by their §4 and certify recovery of the standard pair;
check every equation, commutator and conjugation of source blocks (1)–(6). Let
`U = ⟨a, b, c, d, e⟩`, `D = ⟨U, s⟩`, `H = ⟨D, t⟩`. Prove `|U| ≤ 12,096`, `[D : U] ≤ 17,472` and
`[H : D] ≤ 3`, hence `|H| ≤ 634,023,936`. Prove `[P : H] ≤ 143,127,000`, the source's global target;
its §5 records a successful explicit enumeration, and the proof needs a checked representation of
that enumeration in the sense of §4.2, whatever its size ([Th][src-th]). *Needs:* §§4.1–4.3, 7.1.

**Checks.**
- `12096 · 17472 · 3 = 634023936 = 3 · |³D₄(2)|` and `634023936 · 143127000 = |Th|`.

### 7.11 Simplicity certificates and local data

Use the prime-order normal-generation criterion of §4.4 for all nine candidates. For each prime `p`
dividing the certified order, supply a word-generated subgroup `S_p ≤ G` with a checked normal form
and order exactly `p^{v_p(|G|)}`; Sylow conjugacy then reduces coverage to the elements of order `p`
in these subgroups. Partition those elements into explicitly parametrized local families and give
conjugating words taking each family to named prime-order representatives; no ATLAS class label is a
coverage proof. For every representative `r`, express every model generator as a product of
conjugates of `r` and `r⁻¹`, checked in the model; these words certify that the normal closure of
`r` is `G`. The local collection rules, coverage families, fusion words and normal-generation words
are separate deliverables; running a simplicity command supplies none of them. For the large matrix
candidates, build these certificates through the named local groups and compressed words, never by
enumerating the group.

| Candidate | Sylow primes | Local inputs connected to the construction |
| --- | --- | --- |
| J3 | 2, 3, 5, 17, 19 | The 6,156-point stabilizer chain; the source's explicit `C_G(a)` words and its `2^(1+4):A5` structure can supply the Sylow-2 data. [J3][src-j3] |
| J4 | 2, 3, 5, 7, 11, 23, 29, 31, 37, 43 | The certified `C_G(t)` of §7.3 supplies the Sylow-2 data; the other prime-local groups, fusion and normal-generation certificates are built in the 112-dimensional model. [J4][src-j4], [A][src-a] |
| Ru | 2, 3, 5, 7, 13, 29 | The identified full `²F₄(2)` point stabilizer, the rank-three suborbits `1, 1755, 2304`, and the remaining prime-local subgroups; primitivity of this action alone is not the simplicity proof. [Ru][src-ru], [A][src-a] |
| O’Nan | 2, 3, 5, 7, 11, 19, 31 | The identified `L₃(7):2` point stabilizer and suborbits `1, 5586, 6384, 52136, 58653`; additional Sylow groups where its order lacks the full prime part. [ON][src-on] |
| Fi23 | 2, 3, 5, 7, 11, 13, 17, 23 | The actual `2·Fi22` stabilizer, rank-three suborbits `1, 3510, 28160`, and Sylow groups of the full model. [F23][src-f23] |
| Fi24′ | 2, 3, 5, 7, 11, 13, 17, 23, 29 | Coverage and normal generation in `[Q, Q]`, with conjugators in that subgroup; the actual Fi23 stabilizer in the 306,936-point action. Fusion in the parent alone does not prove conjugacy in the derived group. [F24][src-f24] |
| HN | 2, 3, 5, 7, 11, 19 | The identified `2·HS:2` subgroup and the source's `A12 = ⟨a, b, d, d^(cbc), t⟩`, with certified embeddings into the matrix model. [HN][src-hn] |
| Ly | 2, 3, 5, 7, 11, 31, 37, 67 | The actual `G₂(5)` subgroup, with Sylow and fusion data for the prime parts it does not contain. [Ly][src-ly], [A][src-a] |
| Th | 2, 3, 5, 7, 13, 19, 31 | The source's `³D₄(2):3`, and `C_G(a) = ⟨a, c, d, e, s, t, u⟩` of shape `2^(1+8)·A9`, whose local proof includes the index 61,440 over `⟨d, e, s, t⟩ ≅ L₂(8):3`. [Th][src-th] |

The prime sets fix the scope of the local certificates; the class and normal-generation data are
constructed here. *Needs:* §4.4; §§7.2–7.10.

**Checks.**
- Each prime set is exactly the set of prime divisors of the corresponding order in §6.1; for
  instance `|J₃| = 2⁷·3⁵·5·17·19`. A set omitting a prime divisor leaves its prime-order
  elements uncovered.

### Examples

For `J3` the four parts are: the eight relators checked on the two 6156-point permutations, the
bound `|P| ≤ 19 · 2643840`, the stabilizer-chain order `50232960` of the model, and the local
certificates for the primes `2, 3, 5, 17, 19`.

### Dependencies

Layer 4; Layer 6 for `Fi22` and `HS` inputs (§§7.6, 7.8).

## Layer 8: Golay code, Leech lattice and the Conway groups (P2-L)

### 8.1 The Golay code and M24

Fix the extended binary Golay code `C` of AlgebraicCodingTheory Layer 5, with its coordinate
numbering. Prove an explicit equivalence between the `M24` model of §6.2 and the full permutation
automorphism group of `C`, compatible with their actions on the 24 coordinates; if the construction
uses another Golay matrix, supply the coordinate permutation identifying the two codes. Neither the
code construction nor the abstract order theorem of §6.2 supplies this identification.
*Needs:* §6.2; AlgebraicCodingTheory Layer 5.

### 8.2 Minimal vectors of the Leech lattice, Co0 and Co1

Consume the Leech lattice `Λ` of Rank24LatticeConstructions Layer 6, on `Ω = Fin 24` with rational
form `B(x, y) = (∑ i, x_i y_i)/2` and `Λ = K.ofIsotropicSubgroup(H_s)` from Construction B and its odd
shift, with its rank, positive-definiteness, evenness, unimodularity, minimum and congruence model;
the rootful Golay Construction-A lattice is not a substitute. For the Conway and Griess coordinates,
construct the explicit coordinate equivalence and the form-preserving comparison, including the
normalization factor; a different displayed norm needs its proved scaling dictionary.

Classify all minimal vectors in the congruence model. In the raw integer coordinates `x_i = a_i/2`,
of norm `∑ a_i²/8`, construct the three exhaustive families: two coordinates `±4`; eight coordinates
`±2` on an octad, with the sum congruence; and one coordinate `±3` with the others `±1`, parametrized
by a Golay word and a distinguished coordinate. Prove their disjoint counts 1104, 97152 and 98304,
hence 196560 minimal vectors. The count alone also follows from the theta identity
`Θ_Λ = E₄³ − 720Δ` (ThetaSeries Layer 8, item 8D); the explicit families with their sign and
congruence data are what the action of `Co0` needs, and they are owned here with the count they give.
The weight and rank theorems of the code supply the octad and codeword counts; the classification
of the vectors and its sign and congruence checks are not part of the minimum-norm theorem of
Rank24LatticeConstructions.

Prove that the antipodal involution `v ↦ −v` has no fixed minimal vector and that the set of
antipodal pairs has 98280 elements, before that degree or any orbit count is used. Prove that the
minimal vectors span the rational ambient space, so the faithful permutation action of the isometry group `Co0 := Aut(Λ)` on them proves `Co0` finite.
Construct `Co1 := Co0 / {±1}` and deduce its finiteness. The action on minimal vectors is the action
of `Co0`; `−1` negates them, so it does not descend to `Co1`. Construct the action of `Co1` on
antipodal pairs and prove its kernel statement. Give the Conway generators of `Co0`, prove that they
generate the full isometry group by the lattice and minimal-vector reduction, and compute its order
through that action. *Needs:* Rank24LatticeConstructions Layer 6; AlgebraicCodingTheory Layer 5.

**Checks.**
- The three families have raw squared norms `16 + 16`, `8 · 4` and `9 + 23 · 1`, all `32`, that is
  lattice norm 4. Their counts are `4 · C(24, 2) = 1104`, `759 · 2⁷ = 97152` (an even number of minus
  signs on an octad) and `24 · 2¹² = 98304`, with sum 196560 and 98280 antipodal pairs.

### 8.3 Recognition and simplicity of Co1

Select the eight-involution presentation `Co1.1` of Praeger–Soicher and the Group Presentations
Library used by Tau Ceti's `TauCeti.Sporadic.co1Presentation`, with its nine additional relations and
its alphabetical renaming. Construct its generator dictionary with the action on the 98280 antipodal
pairs. Build a word-defined subgroup of the abstract presentation mapping onto the point stabilizer
`Co2`, derive a surjection from the exact recognized `Co2` presentation (§6.4) onto that subgroup,
and certify a complete right-coset or normal-form cover of index at most 98280; this bounds the
presented group by `|Co1|`, and the orbit–stabilizer calculation in the lattice gives the matching
lower bound. Neither the finite-image stabilizer nor its order proves those abstract subgroup
relations or the coset cover; the subgroup words, relation deductions and coset transitions are
certificates in the sense of §4.2. Prove simplicity of `Co1` by the prime-order normal-generation
criterion of §4.4, with local Sylow normal forms for the primes `2, 3, 5, 7, 11, 13, 23`, complete
coverage and fusion words for the prime-order elements, and witnesses normally generating every
model generator; then transport to the exact presentation. *Needs:* §§4.2–4.4, 6.4, 8.2.

**Checks.**
- `|Co₁| / |Co₂| = 98280`, the number of antipodal pairs of minimal vectors.

### 8.4 The mod-two Leech lattice and the Co2 stabilizer

Define the induced action of `Co1` on `V := Λ/2Λ` and prove its kernel, faithfulness and
irreducibility statements over `𝔽₂`. For a specified short vector class `λ ∈ V` of type 2, in the
conventions of Höhn–Seysen, identify `Stab_Co1(λ)` with the `Co2` model of §6.3 by an explicit
`MulEquiv`. Construct the equivariant bijection from antipodal pairs of minimal vectors to the type-2
classes in `Λ/2Λ`, sending `{v, −v}` to `v + 2Λ`: prove independence of the sign, injectivity from the
minimum-norm bound, and surjectivity from the definition of type 2. Match the quotient action of
`Co0` with the mod-two action of `Co1` under this bijection and identify its stabilizers. A
permutation group of the same order does not provide this interface. *Needs:* §§6.4, 8.2–8.3.

### Examples

The vector `(4, 4, 0, …, 0)/2` (raw coordinates `a = (4, 4, 0, …, 0)`) is a minimal vector of the
first family; its class in `Λ/2Λ` has type 2 and stabilizer `Co2` in `Co1`.

### Dependencies

Layers 4 and 6; Rank24LatticeConstructions Layer 6; AlgebraicCodingTheory Layer 5.

## Layer 9: the Monster and the Baby Monster from the Griess algebra (P2-G, P2-M, P2-D)

### 9.1 The local representations

Follow [Höhn–Seysen, v1, §2.1](https://arxiv.org/html/2508.01037v1#S2.SS1) and its Conway
construction to realize `G₀ := Gx0` of shape `2^{1+24}_+.Co1` and `N := N0` of shape
`2^{2+11+22}.(M24 × S3)` on the same rational Griess algebra. Specify their embeddings, their
intersection `Nx0` of shape `2^{1+24+11}.M24` and the triality element `τ`, with `N = ⟨Nx0, τ⟩`.
Prove the extraspecial structure of `Q := Qx0`, identify its central involution `z`, and give an
equivariant identification `Q/⟨z⟩ ≃ Λ/2Λ` for the action of `Co1` of §8.4. Connect the code action
to the Parker-loop and `M24` actions of these representations, rather than importing a second,
unidentified Mathieu model.

The representation and character calculations consumed by §2.1 of Höhn–Seysen belong here; in
particular prove the fixed-space statement of its Lemma 2.1, including the restriction of the
300-dimensional symmetric-square representation to the identified `Co2`, with constituent
dimensions `1, 1, 23, 275`. Höhn–Seysen assume Conway–Leech theory and character information for
`Co1`, `Co2` and `M24`; these are proved here for those representations and are not consequences of
the order and simplicity theorems of Layer 6. *Needs:* §§8.1–8.4.

**Checks.**
- `1 + 1 + 23 + 275 = 300`, and the summands of the Griess algebra under `G₀` have dimensions
  300, 98280 (one for each antipodal pair of minimal vectors) and `24 · 2¹² = 98304`, with sum
  196884; indexing the middle summand by the 196560 minimal vectors instead of their pairs would
  overcount.

### 9.2 The order of the constructed Monster

Define `M_alg := ⟨G₀, τ⟩`. Prove the axis–involution correspondence of §2.1 of Höhn–Seysen and
`C_{M_alg}(z) = G₀` (their Theorem 2.9). Choose their short involution `β⁺`, put `β⁻ := β⁺ z`, and
let `v⁺, v⁻` be the axes of `β⁺, β⁻`. With

```text
X⁺ = orbit M_alg v⁺
K  = Stab_M_alg(v⁺) = C_M_alg(β⁺)
X⁻ = orbit K v⁻
S  = Stab_M_alg(v⁺, v⁻),
```

prove `S = C_{G₀}(β⁺)` from `β⁺ β⁻ = z` and `C_{M_alg}(z) = G₀`, and prove that the map from `S` to
`Stab_Co1(λ)` is surjective with kernel `C_Q(β⁺)` of order `2^24`. This identifies the two-axis
stabilizer of shape `2^{1+23}.Co2` and gives `|S| = 2^24 · |Co2|` through §8.4; the kernel is not the
extraspecial group `Q` of order `2^25`.

Formalize the orbit certificates of §§3–4 and Appendix D of Höhn–Seysen: representative words,
stabilizer generators, complete decompositions into subgroup orbits, and the triality transitions of
their Tables 2 and 4. Prove the soundness of the action calculations and exhaustive coverage of both
`X⁺` and the full `K`-orbit `X⁻`; for the latter, justify the passage from the local group
`K ∩ G₀` and the triality calculations to the full stabilizer action, since closure under a
subgroup's generators alone does not prove coverage. Justify any modular arithmetic used to certify
equalities in the rational representation. Prove finiteness of `X⁺`, `X⁻` and `S` first; use the
orbit and fibre equivalences to deduce `Finite K` from finite `X⁻` and `S`, then `Finite M_alg` from
finite `X⁺` and `K`, so that neither step assumes the group being proved finite is finite. Only then
take cardinalities to obtain `|M_alg| = |X⁺| · |X⁻| · |S|`. *Needs:* §§4.2, 4.4, 8.4, 9.1.

**Checks.**
- `|S| = 2²⁴ · |Co₂| = 709767191322427392000`, `|X⁻| = 2|B| / |S| = 11707448673375` and
  `|X⁺| = |M| / 2|B| = 97239461142009186000`, with `|X⁺| · |X⁻| · |S| = |M|`. Taking the kernel to be
  `Q` of order `2²⁵` would double `|S|` and give `2|M|`.

### 9.3 Simplicity of the constructed Monster

Prove simplicity of `M_alg` through Lemmas 5.3–5.5 and Theorem 5.6 of Höhn–Seysen: the complete list
`1, ⟨z⟩, Q, G₀` of normal subgroups of `G₀`, from its extraspecial subgroup and the faithful
irreducible action of `Co1` on `Λ/2Λ`, and the explicit triality calculations excluding each proper
possibility for the intersection of a normal subgroup with `G₀`. *Needs:* §§8.4, 9.1–9.2.

### 9.4 The constructed Baby Monster

Define `B_alg := K/⟨β⁺⟩` and prove its finiteness and its order `|B_alg| = |X⁻| · |S| / 2`, as in
Corollary 5.2 of Höhn–Seysen. Prove its simplicity separately by the prime-order normal-generation
criterion of §4.4: Sylow normal forms for the primes `2, 3, 5, 7, 11, 13, 17, 19, 23, 31, 47`, the
prime divisors of `|B| = 2^41·3^13·5^6·7^2·11·13·17·19·23·31·47` (the factorization displayed in
Höhn–Seysen, Corollary 5.2, carries a factor `41`, which divides `|M|` but not the decimal value
printed there), coverage of their prime-order elements up to conjugacy in the quotient, and
normal-generation words for each resulting representative and every quotient generator. Prove
nontriviality and the comparisons of quotient word evaluation and of the central kernel before
applying the criterion. Neither the simplicity of `M_alg` nor the order of `B_alg` gives this
theorem. *Needs:* §§4.4, 9.2.

**Checks.**
- `|X⁻| · |S| / 2 = 4154781481226426191177580544000000 = |B|`, and `41` does not divide it.

### 9.5 No proper double cover of the Monster

Select the presentation route of Ivanov, with the hypothesis that the Monster has no proper double
cover attributed to Griess in [Breuer–Magaard–Wilson, v2, §3.1](https://arxiv.org/html/1902.07758v2).
Prove that no perfect group admits a surjection onto `M_alg` with central kernel of order two; this
excludes a proper covering group and allows the split extension `C₂ × M_alg`. Formalize the required
part of Griess, *The Schur multipliers of the known finite simple groups, III*, directly for
`M_alg`, carrying its concrete local-subgroup and construction hypotheses. Any comparison with
Griess's construction is proved from the identifications of §§8.4 and 9.1–9.2, independently of
Layer 10, of the `Y₄₄₃` recognition theorem and of `TauCeti.ClassificationStatement`; the two
Monsters are not identified by the presentation theorem whose proof this supplies. Computing the
entire Schur multiplier is not part of this target, and the order and simplicity of `M_alg` do not
imply it. *Needs:* §§9.1–9.3.

### Examples

The involution `z` is central in `G₀` and of type `2B`; the short involution `β⁺` is of type `2A`,
and its centralizer `K` is the double cover `2·B_alg`.

### Dependencies

Layers 4, 6 and 8.

## Layer 10: recognition of the Monster and Baby Monster, and the sporadic endpoint (P2-R)

Checking relators in a constructed model gives only maps out of a presented group; the
presentation-identification theorems below supply the upper bounds.

### 10.1 The Bimonster carrier

Construct `BiM := (M_alg × M_alg) ⋊ C₂` from the constructed Monster, the nontrivial element of `C₂`
swapping the factors. Give the two factor inclusions, the projection onto `C₂` with its kernel, the
swap element with its square and conjugation equations, and generation by the factors and the swap.
This carrier does not depend on any presentation recognition. *Needs:* §9.2.

### 10.2 The Baby Monster presentation

Select the `Y₅₅₅` presentation of Ivanov, *Presenting the Baby Monster*, as invoked by
Breuer–Magaard–Wilson §2. Transcribe its numbered generators and its full relator family, including
the additional spider relation and any other relation that source requires; a presentation is not
inferred from the Coxeter diagram alone, and no deflation relation is taken from a different
construction. Give the source-to-Lean numbering and generator dictionaries, check all relations and
generation, and prove that the presented group is `MulEquiv` to `BiM`. Then formalize the deduction of
the `Y₄₃₃` central extension and quotient used below, with its subgroup maps and kernels and the
hypothesis of §9.5, before concluding recognition of the Baby Monster presentation. Neither this
intermediate carrier nor its presentation theorem is assumed through the final recognition
conclusion. *Needs:* §§4.1–4.3, 9.4, 9.5, 10.1.

### 10.3 The Monster presentation

Use Ivanov, *Y-groups via Transitive Extension*, especially Lemma 3.2 and §3.9, carrying its
transitive-extension and subgroup-identification arguments as proof obligations, to identify the
Coxeter-plus-spider group `Y₄₄₃` with `M_alg × C₂`. *Needs:* §§4.1–4.3, 9.2, 9.3, 10.1.

### 10.4 Transport to the exact carriers

Account for the quotient conventions of the Lean definitions.

- `TauCeti.Sporadic.Monster.presentation` has the `Y₄₄₃` Coxeter relators followed by
  `TauCeti.Sporadic.Monster.spiderRelator = (a b₁ c₁ a b₂ c₂ a b₃ c₃)^10` and
  `TauCeti.Sporadic.Monster.centralInvolutionRelator = (a b₃ c₃ d₃ b₁ c₁ b₂)^9`, Ivanov's `f₃₁₂`.
  Identify the Coxeter-plus-spider group with `M_alg × C₂` (§10.3), prove that `f₃₁₂` kills its
  central factor, and identify the full 80-relator quotient with `M_alg`.
- `TauCeti.Sporadic.BabyMonster.presentation` has the `Y₄₃₃` Coxeter relators followed by
  `TauCeti.Sporadic.BabyMonster.spiderRelator = (t₅ t₄ t₃ t₅ t₆ t₇ t₅ t₉ t₁₀)^10`,
  `TauCeti.Sporadic.BabyMonster.extraRelatorOne = (t₅ t₄ t₃ t₆ t₇ t₈ t₉)^9` and
  `TauCeti.Sporadic.BabyMonster.extraRelatorTwo = (t₅ t₄ t₃ t₆ t₉ t₁₀ t₁₁)^9`. Identify the
  Coxeter-plus-spider group `2 × 2·B` with `C₂ × K`, including the identification of the cover with
  the constructed centralizer `K`, and prove that the normal closure of the two extra relators is
  exactly the kernel of the map to `K/⟨β⁺⟩ = B_alg`, so that the full 69-relator presentation gives
  `B_alg`.

Give the numbered-generator dictionaries, verify generation, and transport the resulting `MulEquiv`s
to the exact `TauCeti.SporadicName.Group` carriers. The equivalences
`TauCeti.Sporadic.Monster.mulEquivPresentedGroupCoxeterAppend` and
`TauCeti.Sporadic.BabyMonster.mulEquivPresentedGroupCoxeterAppend` identify the presentations with
the corresponding Coxeter quotients and recognize no finite simple group. *Needs:* §§10.2–10.3.

### 10.5 The uniform sporadic theorems

Prove `sporadicName_finite` (`Finite s.Group`), `sporadicName_isSimpleGroup` (`IsSimpleGroup
s.Group`) and `sporadicName_card` (`Nat.card s.Group = sporadicOrder s`) for every
`s : TauCeti.SporadicName`, by cases on `s` from §§6.2–6.4, 7.2–7.11, 8.3, 9.3, 9.4 and 10.4. The order
is that of the exact presented group, not of a model that merely satisfies its relators. *Needs:*
§§6.1–6.4, Layer 7, §§8.3, 9.3–9.4, 10.4.

### Examples

In `BiM` the swap `σ` satisfies `σ² = 1` and `σ (g, h) σ⁻¹ = (h, g)`; the diagonal
`{(g, g)} ≅ M_alg` is its centralizer in `M_alg × M_alg`.

### Dependencies

Layers 4, 6–9.

## Layer 11: the conjugacy classes of the Monster (P2M)

The conjugacy structure is built on the constructed Monster of Layer 9 and transported across the
recognition `MulEquiv` of §10.4 to exactly `TauCeti.SporadicName.M.Group`. It reuses Tau Ceti's
conjugacy and character theory; neither the classification proposition nor a prior verification of
the full Monster character table is an input.

### 11.1 The two classes of involutions

Prove `monster_two_involution_classes`: the presented Monster contains elements `a` and `b` of order
2 that are not conjugate, every element of order 2 is conjugate to `a` or to `b`, and the centralizers
of `a` and `b` have orders `2·|B|` and `2^25·|Co1|`. Identify the centralizers themselves: the
central extension of the Baby Monster of §9.4 in the `2A` case, with the involution as its kernel,
and the local group `2^{1+24}_+.Co1` of §9.1 in the `2B` case, with proved maps, kernels and
quotients, not a group-shape label. Prove the required local-group and character-table facts for
these subgroups, or connect them by proved isomorphisms to their constructions in Layers 8 and 9.
*Route.* The finite local route of Appendix E of Höhn–Seysen: prove the odd-index reduction from `M_alg` to `G₀`, construct exhaustive local involution families
in `G₀`, and certify their fusion to `β⁺` or `z` by conjugating words; prove the two representatives
nonconjugate by their representation invariants; supply the required local character facts of
`Co1` from §§8.3–9.1. The published computation is input to a soundness proof and a checked
certificate, not an imported theorem; its alternative calculation through the Monster's character
table is not used, and no identification with the full automorphism group of the Griess algebra or
the moonshine module is required. This places the two-involution theorem after the order and local
action constructions and before the complete class analysis. *Needs:* §§4.5, 9.1–9.4, 10.4.

**Checks.**
- `|M| / (2·|B|) = 97239461142009186000 = |X⁺|`: the class `2A` is in bijection with the axes of
  §9.2. The two centralizer orders are `8309562962452852382355161088000000` and
  `139511839126336328171520000`.

### 11.2 The representation of degree 196883

Prove `monster_exists_irreducible_196883`: there is an irreducible complex representation of the
presented Monster on `ℂ^196883`. Construct it from the Griess module: identify the fixed line and
the complementary or quotient module of the 196884-dimensional representation, and prove
irreducibility of the 196883-dimensional piece independently of the Monster's character table.
*Needs:* §§9.1–9.3, 10.4; Mathlib `Representation.IsIrreducible`.

### 11.3 The complete list of classes

Construct an explicit finite list of representative words in the recorded generators, evaluate them
in the constructed model and in the presented group, and prove pairwise nonconjugacy and coverage.
Deliver Tau Ceti `TauCeti.ClassData` on this list, with its label and representative round trips
and the criterion that two elements have the same label exactly when they are conjugate; the
equivalence with `ConjClasses` sends a label to the class of its specified representative, and is
not chosen from the desired cardinality. Prove each representative's element order, the order and
stated structure of its centralizer, and its inverse and power classes, and check the subgroup
fusion maps used to identify the rows. Follow the class-verification argument of
[Breuer, Magaard and Wilson, *Verification of the conjugacy classes and ordinary character table of
the Monster*, §2 and §4.9 Proposition 1](https://arxiv.org/html/2412.12182v1), supplying its
individual local subgroup, table and representation inputs before the count: distinguish the classes
meeting the involution centralizers from the odd-order analysis, and prove exhaustion over all
element orders. Where the argument uses a power map or fusion test, prove its value on the actual
elements; matching names in a printed table is not a fusion proof. The mass criterion of §4.5 applies
once the group order and the centralizer orders are independently certified. The axis-orbit
certificate of §9.2 is not a classification of the elements. Record which representation values,
centralizer calculations and fusion tests separate each pair of candidate classes; these are
constructions and theorems, not hypothesis fields of a conditional class-count theorem. Then prove
`monster_card_conjClasses`: `Nat.card (ConjClasses M) = 194` for the presented Monster
`M = TauCeti.SporadicName.M.Group`, from the list
of length 194 through `TauCeti.ClassData.numClasses_eq_card_conjClasses`. The group order and the
class count are proved separately: the order (§10.5), simplicity and the classification proposition
do not give the count. *Needs:* §§4.5, 11.1–11.2; Tau Ceti `TauCeti.ClassData`,
`TauCeti.ClassData.numClasses_eq_card_conjClasses`.

### 11.4 The irreducible characters

Prove `monster_card_irreducibleCharacters`: the presented Monster has exactly 194 irreducible
complex characters, `Nat.card (TauCeti.irreducibleCharacters ℂ M) = 194`, from §11.3 and Tau Ceti's
`TauCeti.card_irreducibleCharacters` (for a finite group over an algebraically closed field in which
the group order is invertible; finiteness is §10.5, and `ℂ` supplies the field conditions). Hence the
ordinary character table has 194 rows and columns. The class verification precedes any verification
of the full table, which is not an input here; the generic theorem relating irreducible characters
and classes is Tau Ceti's and is not reproved. *Needs:* §§10.5, 11.3; Tau Ceti
`TauCeti.irreducibleCharacters`, `TauCeti.card_irreducibleCharacters`.

### Examples

The class `1A` is the identity, `2A` contains `β⁺`, `2B` contains `z`, and the 196883-dimensional
character takes the value 196883 at `1A`.

### Dependencies

Layers 4, 9 and 10; Tau Ceti's class-data and character-table libraries.

## Layer 12: assembly of the list (A0)

### 12.1 The two uniform theorems

Prove `CFSGIndex_finite`, `Finite i.Group`, and `CFSGIndex_isSimpleGroup`, `IsSimpleGroup i.Group`,
for every `i : TauCeti.CFSGIndex`, by cases on the four constructors: the cyclic and alternating
branches are Tau Ceti's (`TauCeti.CFSGIndex.finite_cyclic`, `TauCeti.CFSGIndex.isSimpleGroup_cyclic`,
`TauCeti.CFSGIndex.isSimpleGroup_alternating`, with finiteness of `alternatingGroup (Fin n)` an
instance), the Lie-type branch is §5.3, and the sporadic branch is §10.5. No case uses
`TauCeti.ClassificationStatement` or assumes the property being proved, and the endpoint depends on
no axiom beyond Lean's standard ones. *Needs:* §§5.3, 10.5; Tau Ceti
`TauCeti.CFSGIndex.finite_cyclic`, `TauCeti.CFSGIndex.isSimpleGroup_cyclic`,
`TauCeti.CFSGIndex.isSimpleGroup_alternating`.

**Checks.**
- The dispatcher on one index of each kind gives the expected group: the cyclic index `p = 7`, of
  order 7; the alternating index `n = 5`, of order 60; the ordinary `A₁(7)`, of order 168; the
  graph-twisted `²A₂(3)`, of order 6048; `Sz(8)`, of order 29120; `²G₂(27)` and `²F₄(8)` (§5.1); the
  Tits group, of order 17971200; `M11`, of order 7920; and `J3`, of order 50232960. These test the
  case split, not the uniform proofs.

### Examples

For `i = cyclic 2 _` the carrier is `Multiplicative (ZMod 2)`, simple of order 2; for
`i = alternating 5 _` it is `A₅`.

### Dependencies

Layers 5 and 10; Tau Ceti's elementary branches.

## Scope and ownership

This roadmap owns the finiteness and simplicity of every group on the classification list, on the
exact carriers of CFSGStatement, together with the structure theory of the finite Steinberg fixed
points (split Tits systems, twisted root groups, fixed-point Bruhat decomposition), the soundness
theorems for presented groups and permutation certificates, the sporadic models, recognitions and
simplicity proofs, the Leech-lattice and Griess-algebra constructions of the Conway groups, the
Monster and the Baby Monster, and the conjugacy classes of the Monster. Each layer above states what
it owns.

**Already in the libraries at the pins and consumed by name above.**

- The cyclic and alternating branches (E0): Tau Ceti's
  `TauCeti.CFSGIndex.natCard_cyclic`, `TauCeti.CFSGIndex.finite_cyclic`,
  `TauCeti.CFSGIndex.isSimpleGroup_cyclic` and `TauCeti.CFSGIndex.isSimpleGroup_alternating`.
- The finite-coordinate fixed-point criterion and its transport (F0), and the finiteness of every
  Lie-type carrier (F1): Tau Ceti's `TauCeti.finite_fixedSubgroup_of_iterate_apply_eq_pow`,
  `TauCeti.finite_fixedSubgroup_of_iterate_eq_iterate`,
  `Subgroup.finite_fixedSubgroup_of_iterate_eq_iterate`,
  `Representation.finite_fixedSubgroup_of_iterate_apply_eq_pow`, `TauCeti.fixedSubgroupCongr`,
  `TauCeti.finiteFixedPointCandidate`,
  `TauCeti.ValidLieTypeIndex.iterate_steinberg_twistOrder_of_not_usesHalfFrobenius`,
  `TauCeti.ValidLieTypeIndex.finite_fixedPoints` and `TauCeti.ValidLieTypeIndex.finite`. The
  acceptance file states the latter as `validLieTypeIndex_finite`.
- Of T0: the Bruhat uniqueness theorems, the classification of overgroups of `B`
  (`TauCeti.TitsSystem.standardParabolicOrderIso`), Tits's normal-subgroup theorem and simplicity
  criterion for the normal closure of `U` with its bridge to the derived central quotient, and the
  Iwasawa route for central quotients. Layer 1 adds the split structure.
- Of T2 and T3: simplicity of the type-`A` constructor (`TauCeti.ValidLieTypeIndex.isSimpleGroup_A`)
  and of the Suzuki constructor (`TauCeti.ValidLieTypeIndex.isSimpleGroup_suzuki`), and the
  fixed-point comparisons with `SL_{r+1}(𝔽_q)`, `Sp_{2r}(𝔽_q)`, `Sp₄(𝔽_q)` and `SU_{r+1}(q)`.
- Of P0: generator elimination, the Reidemeister–Schreier kernel identification given a free basis,
  the index-two rewriting, normal-generation programs, the prime-order normal-generation criterion
  and its Sylow-local form, class data, the mass criterion and the transport of class data.
- The twenty-six sporadic presentations (CFSGStatement's S0–S1, carried by Tau Ceti), with the
  Coxeter-quotient identifications of the Monster and Baby Monster presentations and the
  commutator identification of `Fi24′`.

**Left to other roadmaps.**

- [CFSGStatement](../CFSGStatement/README.md) owns the index, the carriers, the canonical
  Chevalley–Demazure carriers (its Layers 1–2), their comparison with the designated carriers (its
  §3.1) and the induced candidate comparisons (its §4.1), the comparison of the Suzuki branch with
  Tau Ceti's `TauCeti.suzukiGroup` (its §5.1, which can transport results but is not an input to
  the theorems here), and the classification proposition. This roadmap proves neither `TauCeti.ClassificationStatement` nor pairwise nonisomorphism or uniqueness of
  indices.
- [ChevalleyGroups](../ChevalleyGroups/README.md) C2–C5 owns the ambient theory on the canonical
  points: root subgroups for every root, the commutator formula, the Bruhat decomposition and Tits
  system over a field, the centre, Steinberg's presentation, generation over an algebraically
  closed field by root subgroups, and the Frobenius, graph and exceptional endomorphisms with their
  action on root subgroups. [ReductiveGroups](../ReductiveGroups/README.md) Layer 7 owns abstract
  Borel, root-datum and Bruhat theory. This roadmap owns the remaining structure theory of the finite
  fixed points.
- [Rank24LatticeConstructions](../Rank24LatticeConstructions/README.md) Layer 6 owns the Leech
  lattice by Construction B and an odd shift, its rational form and its congruence model; this
  roadmap owns its sporadic automorphism groups and their representation comparisons and builds no
  second Leech lattice. [AlgebraicCodingTheory](../../Completed/AlgebraicCodingTheory/README.md)
  Layer 5 owns the extended Golay code and its code theory and excludes the Mathieu identification,
  which is §8.1 here. [ThetaSeries](../ThetaSeries/README.md) Layer 8 (item 8D) proves the theta
  identity of the Leech lattice; the explicit minimal-vector families are §8.2 here.
- [SporadicOrders](../SporadicOrders/README.md) Layers 0–2 owns the stabilizer-chain order formula,
  orbits and membership along a base (its §§0.1–0.3), the ten canonical ATLAS permutation models with
  their orders (Layer 1) and the surjections from the presented groups (Layer 2). It supplies
  theorems, not a checker or a certificate format. This roadmap owns the upper bounds, recognition and
  simplicity for those ten names, the four further models of §6.3, and the soundness of every
  permutation certificate it uses (§4.4); a permutation certificate never bounds an abstract
  presented group.

## Exact supplier contracts

### From Mathlib

- `isSimpleGroup_of_prime_card`: a group of prime order is simple. `alternatingGroup.isSimpleGroup`:
  `alternatingGroup α` is simple when `5 ≤ Nat.card α`.
- `MulAction.IwasawaStructure` and `MulAction.IwasawaStructure.isSimpleGroup`: a nontrivial perfect
  group with an Iwasawa structure on a faithful quasiprimitive action is simple.
- `MulAction.IsPreprimitive` and `MulAction.isCoatom_stabilizer_iff_preprimitive`: a pretransitive
  action on a nontrivial set is primitive exactly when a point stabilizer is a maximal subgroup.
  `MulAction.orbit`, `MulAction.stabilizer`.
- `PresentedGroup`, `PresentedGroup.toGroup` and `PresentedGroup.toGroup.unique`: an assignment on
  which every relator evaluates to `1` gives the unique homomorphism with those generator values.
- `IsSimpleGroup`, `IsSolvable`, `Subgroup.normalClosure`, `commutator`, `Subgroup.center`,
  `Subgroup.centralizer`, `Subgroup.index`, `Nat.card`, `ConjClasses`, `IsConj`, `orderOf`,
  `Representation` and `Representation.IsIrreducible`, `Equiv.Perm`, `alternatingGroup`, `ZMod`,
  `Multiplicative`.

### From Tau Ceti

- **The list and its carriers** (`CFSG/Index.lean`, `CFSG/Classification.lean`,
  `CFSG/Assembly/LieType.lean`, `CFSG/Sporadic/Presentation.lean`): `TauCeti.CFSGIndex`,
  `TauCeti.CFSGIndex.Group`, `TauCeti.CFSGIndex.cyclic`, `TauCeti.CFSGIndex.alternating`,
  `TauCeti.LieTypeIndex.Valid`, `TauCeti.ValidLieTypeIndex` with `AmbientGroup`, `steinberg`,
  `frobenius`, `FixedPoints`, `Group` and `simpleRootSubgroup`, `TauCeti.SporadicName`,
  `TauCeti.SporadicName.presentation`, `TauCeti.SporadicName.Group`, `TauCeti.GroupPresentation`
  with `TauCeti.GroupPresentation.mem_relatorSet_iff`, `TauCeti.Relator`, and
  `TauCeti.ClassificationStatement`. The carriers include no finiteness or simplicity condition.
- **Elementary branches** (`CFSG/BasicProperties/Elementary.lean`):
  `TauCeti.CFSGIndex.natCard_cyclic` (the cyclic carrier has `p` elements),
  `TauCeti.CFSGIndex.finite_cyclic`, `TauCeti.CFSGIndex.isSimpleGroup_cyclic`,
  `TauCeti.CFSGIndex.isSimpleGroup_alternating`.
- **Fixed points and finiteness** (`GroupTheory/FixedSubgroup.lean`,
  `GroupTheory/FixedSubgroup/MatrixCoordinates.lean`, `GroupTheory/FixedPointCandidate.lean`,
  `CFSG/BasicProperties/LieTypeFinite.lean`): `TauCeti.fixedSubgroup`, `TauCeti.fixedSubgroupCongr`
  (fixed subgroups of endomorphisms intertwined by a `MulEquiv` are isomorphic),
  `TauCeti.FixedPointCandidate`, `TauCeti.FixedPointCandidate.congr`,
  `TauCeti.DerivedCentralQuotient`, `TauCeti.DerivedCentralQuotient.congr`,
  `TauCeti.finiteFixedPointCandidate`; the finite-coordinate criterion
  `TauCeti.finite_fixedSubgroup_of_iterate_apply_eq_pow` (for `ρ : G → Matrix n n K` injective, `n`
  finite, `K` an integral domain, `F` an endomorphism, `r` any natural number and `m > 1`: if
  `ρ (F^[r] g) i j = (ρ g i j)^m` for all `g, i, j`, then `fixedSubgroup F` is finite), its iterate form
  `TauCeti.finite_fixedSubgroup_of_iterate_eq_iterate` (if `Φ` raises every coordinate to the power
  `m` and `F^[r] = Φ^[k]` with `k ≠ 0`; with `k = 0` the hypothesis holds for `F = id` on an infinite
  group), and its forms `Subgroup.finite_fixedSubgroup_of_iterate_eq_iterate` for a subgroup of
  `GL n K` and `Representation.finite_fixedSubgroup_of_iterate_apply_eq_pow` for a faithful
  representation with a finite basis; `TauCeti.ValidLieTypeIndex.steinberg_steinberg_of_usesHalfFrobenius`,
  `TauCeti.ValidLieTypeIndex.iterate_steinberg_twistOrder_of_not_usesHalfFrobenius`,
  the constructor Frobenius formulas (`TauCeti.ValidLieTypeIndex.frobenius_A` and its analogues),
  `TauCeti.GraphTwistedIndex.twistOrder`, `TauCeti.GraphTwistedIndex.twistOrder_pos`,
  `TauCeti.LieTypeIndex.one_lt_fieldOrder`, `TauCeti.ValidLieTypeIndex.card_fixedField`,
  `TauCeti.ValidLieTypeIndex.finite_fixedPoints` and `TauCeti.ValidLieTypeIndex.finite`
  (`Finite d.Group` for every valid index).
- **Finite-field comparisons and family simplicity** (`CFSG/BasicProperties/TypeA.lean`,
  `TypeC.lean`, `TypeB/Two.lean`, `TwistedA.lean`, `Suzuki.lean`, `CFSG/Suzuki/`):
  `TauCeti.TypeALieIndex.specialLinearEquivFixedPoints`,
  `TauCeti.TypeALieIndex.projectiveSpecialLinearEquivGroup`,
  `TauCeti.ValidLieTypeIndex.isSimpleGroup_A` (the group of every valid `A_r(q)` is simple),
  `TauCeti.TypeCLieIndex.symplecticEquivFixedPoints`,
  `TauCeti.TypeB2LieIndex.symplecticEquivFixedPoints`,
  `TauCeti.TypeB2LieIndex.projectiveSymplecticEquivGroup` (the group of `B₂(q)` is `PSp₄(𝔽_q)`),
  `TauCeti.TypeB2LieIndex.commutator_symplectic_eq_top`,
  `TauCeti.TypeALieIndex.specialUnitaryEquivFixedPoints`, `TauCeti.suzukiGroup`,
  `TauCeti.Suzuki.titsSystem`, `TauCeti.SuzukiLieIndex.groupEquivSuzukiGroup` and
  `TauCeti.ValidLieTypeIndex.isSimpleGroup_suzuki` (the group of every valid Suzuki index is simple).
- **Tits systems** (`GroupTheory/TitsSystem/`): `TauCeti.TitsSystem`,
  `TauCeti.TitsSystem.IsIrreducible`, `TauCeti.TitsSystem.IsIrreducible.of_mulEquiv`,
  `TauCeti.TitsSystem.bruhatCell`, `TauCeti.TitsSystem.bruhatCell_injective`,
  `TauCeti.TitsSystem.disjoint_bruhatCell_iff`, `TauCeti.TitsSystem.existsUnique_mem_bruhatCell`,
  `TauCeti.TitsSystem.standardParabolic`, `TauCeti.TitsSystem.standardParabolicOrderIso` (the
  subsets of `S` are order-isomorphic to the subgroups containing `B`), `TauCeti.TitsSystem.comap`,
  `TauCeti.TitsSystem.le_normalCore_subgroupOf_or_eq_top_of_normal`,
  `TauCeti.TitsSystem.center_normalClosure_eq_normalCore_subgroupOf`,
  `TauCeti.TitsSystem.isSimpleGroup_quotient_normalCore_subgroupOf`,
  `TauCeti.TitsSystem.isSimpleGroup_derivedCentralQuotient` and
  `TauCeti.TitsSystem.nontrivial_quotient_normalCore_subgroupOf`. The criterion assumes an
  irreducible Weyl group, `U` solvable and normalized by `B` with `B ≤ U (B ∩ N)`, `Z ∩ U = 1`, the
  normal closure of `U` equal to `[G, G]` and perfect, and concludes that
  `DerivedCentralQuotient G` is simple whenever it is nontrivial.
- **Iwasawa's criterion for central quotients** (`GroupTheory/GroupAction/Iwasawa.lean`):
  `MulAction.IwasawaStructure.ofConj`, `MulAction.IwasawaStructure.isSimpleGroup_quotient_center`,
  `MulAction.IwasawaStructure.mem_center_iff` and
  `MulAction.IwasawaStructure.isSimpleGroup_derivedCentralQuotient` (a nontrivial perfect group
  with an Iwasawa structure on a quasiprimitive action whose kernel is central has simple derived
  central quotient).
- **Presentations** (`GroupTheory/Presentation/`): `PresentedGroup.eliminateGenerators` (Tietze
  elimination of defined generators), `PresentedGroup.subgroupPresentationEquiv`
  (Reidemeister–Schreier, given a free basis and coset representatives),
  `TauCeti.IsSchreierIndexTwoSource.mulEquivKerParityHom`,
  `TauCeti.IsSchreierIndexTwoSource.mulEquivCommutator`,
  `TauCeti.GroupPresentation.mulEquivCommutator`, `TauCeti.NormalClosureProgram`,
  `TauCeti.NormalClosureProgram.normalClosure_eq_top_of_eval_eq` and
  `TauCeti.NormalClosureProgram.normalClosure_eq_top_of_check` (a checked program recovering a
  generating family proves normal generation).
- **Simplicity certificates** (`GroupTheory/Subgroup/Simple.lean`, `GroupTheory/Sylow/Simple.lean`):
  `IsMulTorsion.isSimpleGroup_of_isConj_of_normalClosure_eq_top` and
  `TauCeti.isSimpleGroup_of_card_eq_of_normalClosure_eq_top_of_isConj`.
- **Conjugacy classes and characters** (`GroupTheory/ClassEquation.lean`,
  `RepresentationTheory/CharacterTable/Dixon/ClassData/Basic.lean`,
  `RepresentationTheory/CharacterTable/Table.lean`, `Algebra/Group/Conj.lean`):
  `List.sum_index_centralizer_eq_card_iff` (a pairwise nonconjugate list of a finite group meets
  every conjugacy class exactly when the centralizer indices of its entries sum to the group
  order), `TauCeti.ClassData` (a list of representatives with pairwise nonconjugacy and coverage),
  `TauCeti.ClassData.ofSumIndexCentralizer`, `TauCeti.ClassData.map` with
  `TauCeti.ClassData.rep_map`, `TauCeti.ClassData.classOf_map`, `TauCeti.ClassData.classFinset_map`,
  `TauCeti.ClassData.index_map_inv` and `TauCeti.ClassData.index_map_pow`,
  `TauCeti.ClassData.index_eq_index_iff` (two elements have the same label exactly when they are
  conjugate), `TauCeti.ClassData.numClasses_eq_card_conjClasses`, `MulEquiv.conjClassesEquiv`,
  `TauCeti.irreducibleCharacters` and `TauCeti.card_irreducibleCharacters` (for a finite group `G`
  and an algebraically closed field `k` with `Nat.card G` invertible, the number of irreducible
  characters is the number of conjugacy classes). The libraries
  `RepresentationTheory/CharacterTable` and `RepresentationTheory/FrobeniusGroup/Basic` supply
  ordinary character theory (Burnside, Frobenius kernels, irreducible expansions and
  Frobenius–Schur theory); a source's private character objects are compared with them once.
- **Sporadic presentations** (`CFSG/Sporadic/`): `TauCeti.Sporadic.j3Presentation`,
  `TauCeti.Sporadic.j4Presentation`, `TauCeti.Sporadic.ruPresentation`,
  `TauCeti.Sporadic.onanPresentation`, `TauCeti.Sporadic.fi23Presentation`,
  `TauCeti.Sporadic.fi24PrimePresentation`, `TauCeti.Sporadic.Fi24AutomorphismGroup`,
  `TauCeti.Sporadic.fi24PrimeGroupMulEquivCommutator`, `TauCeti.Sporadic.hnPresentation`,
  `TauCeti.Sporadic.Lyons.presentation`, `TauCeti.Sporadic.Thompson.presentation`,
  `TauCeti.Sporadic.co1Presentation`, `TauCeti.Sporadic.Monster.presentation`,
  `TauCeti.Sporadic.Monster.spiderRelator`, `TauCeti.Sporadic.Monster.centralInvolutionRelator`,
  `TauCeti.Sporadic.Monster.mulEquivPresentedGroupCoxeterAppend`,
  `TauCeti.Sporadic.BabyMonster.presentation`, `TauCeti.Sporadic.BabyMonster.spiderRelator`,
  `TauCeti.Sporadic.BabyMonster.extraRelatorOne`, `TauCeti.Sporadic.BabyMonster.extraRelatorTwo`
  and `TauCeti.Sporadic.BabyMonster.mulEquivPresentedGroupCoxeterAppend`. These record presentation
  data and Coxeter-quotient identifications; none states an order, finiteness or simplicity.

### From TauCetiRoadmap.CFSGStatement

Layer 1 (the canonical Chevalley–Demazure points `Gᶜ_d`), §3.1 (the equivalence `e_d` from the
designated ambient group to `Gᶜ_d`, matching simple root subgroups and torus and intertwining the
Steinberg maps), §4.1 (the induced comparison of fixed groups and candidates) and §5.1 (the Suzuki
comparison). Consumed only on the transport routes of §§2.1, 2.6 and 5.1.

### From TauCetiRoadmap.ChevalleyGroups

C2–C5: root subgroups for every root, torus, commutator formula, Bruhat decomposition and Tits
system over a field, centre, Steinberg's presentation, generation by root subgroups over an
algebraically closed field, and the Frobenius, graph and exceptional endomorphisms with their
action on root subgroups and characters. Consumed on the transport route of §2.1.

### From TauCetiRoadmap.SporadicOrders

Layer 0: the stabilizer-chain order formula (§0.1), the orbits of a generated permutation group
(§0.2) and the membership criterion along a base (§0.3). Layers 1–2: the ten carriers
`M11 M12 M22 M23 M24 J1 J2 HS McL Co3`, their orders, and the surjections from the presented groups
onto them. Consumed in §§4.4 and 6.2.

### From TauCetiRoadmap.Rank24LatticeConstructions

Layer 6: the Leech lattice `Λ = K.ofIsotropicSubgroup(H_s)` on `Fin 24 → ℚ` with
`B(x, y) = (∑ i, x_i y_i)/2`, its rank, positive-definiteness, evenness, unimodularity, minimum 4 and
congruence model `x_i = a_i/2`. Consumed in §8.2.

### From TauCetiRoadmap.AlgebraicCodingTheory

Layer 5: the extended binary Golay code with its coordinate numbering, and its weight and rank
theorems (octads and codeword counts). Consumed in §§8.1–8.2.

## References

- R. W. Carter, *Simple Groups of Lie Type*, particularly the root-group, BN-pair and simplicity
  arguments; R. Steinberg, *Endomorphisms of Linear Algebraic Groups*, for the Steinberg
  fixed-point constructions; R. Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33,
  for the Bruhat decomposition of the fixed points.
- J. Tits, the simplicity criterion for groups with a BN-pair; see
  [Conrad's notes on Tits systems](https://math.stanford.edu/~conrad/249BW16Page/handouts/titssystem.pdf),
  Theorem 2.4, and
  [Conrad's notes on Tits systems and root groups](https://math.stanford.edu/~conrad/249BW16Page/handouts/roottits.pdf)
  for the group-theoretic interface.
- [ATLAS of Finite Group Representations](https://brauer.maths.qmul.ac.uk/Atlas/v3/) for named
  sporadic groups, presentations, finite representations and orders.
- [Höhn–Seysen, *The Order of the Monster Finite Simple Group*](https://arxiv.org/abs/2508.01037)
  for the Griess-algebra construction, the Monster and Baby Monster order arguments, and the
  accompanying axis-orbit certificate data.
- [Breuer, Magaard and Wilson, *Verification of the conjugacy classes and ordinary character table
  of the Monster*, arXiv:2412.12182v1](https://arxiv.org/html/2412.12182v1), particularly §2 and
  §4.9 Proposition 1, for the local prerequisites and the class-verification route; its full
  character-table verification follows the class count.
- [Breuer–Magaard–Wilson, *Verification of the ordinary character table of the Baby Monster*,
  arXiv:1902.07758v2](https://arxiv.org/abs/1902.07758v2), §§2–3.1, for the presentation and its
  dependence on the Monster's having no proper double cover.
- [Ivanov, *Presenting the Baby Monster*, J. Algebra 163 (1994), 88–108](https://doi.org/10.1006/jabr.1994.1005),
  for the Baby Monster presentation theorem.
- [Ivanov, *Y-groups via Transitive Extension*, J. Algebra 218 (1999), 412–435](https://doi.org/10.1006/jabr.1999.7882),
  especially the definition on p. 413, Lemma 3.2 and §3.9, for the Monster Coxeter-plus-spider
  group and its central quotient.
- Griess, *The Schur multipliers of the known finite simple groups, III*, Proceedings of the
  Rutgers Group Theory Year, 1983–1984 (1985), 69–80, for the central-extension prerequisite cited by
  Breuer–Magaard–Wilson.
- [FiniteSimpleGroups](https://github.com/KitaKen1/finite-simple-groups-lean) for independent formal
  permutation models of the fourteen groups of Layer 6; its results apply to Tau Ceti's carriers only
  through a proved presentation equivalence.

The source labels of Layer 7 refer to these presentations and construction arguments:

- [C][src-c]: the Tau Ceti sporadic dispatcher and its imported presentations at revision
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; [A][src-a]: the ATLAS representation list. Each
  selected model is linked in its section.
- [J3][src-j3] and [J4][src-j4]: the ATLAS Magma presentation artifacts, with their subgroup words
  and index targets. For the J4 construction, Bolt–Bray–Curtis,
  [*Symmetric presentation of the Janko group J4*](https://doi.org/10.1112/jlms/jdm086), §5.
- [Ru][src-ru]: Soicher's pinned `tcenum` input, whose word conventions are defined by the
  [parser at the same revision](https://raw.githubusercontent.com/lhsoicher/tcenum/fb9dd89130fca8ad7dc4a92537c96ce7b30b62f1/src/tcfrontend.c);
  the construction source is Bradley–Curtis–Malik,
  [*Symmetric generation of the Rudvalis group*](https://doi.org/10.1112/jlms/jdq039).
- [ON][src-on] and [F23][src-f23]: records `GPLTable.ON.1` and `GPLTable.Fi23.1` of Lindenbergh's
  Group Presentations Library, following Praeger–Soicher,
  [*Low Rank Representations and Graphs for Sporadic Groups*, Chapter 4](https://doi.org/10.1017/CBO9780511526039.005).
- [F24][src-f24]: Kim–Michler, *Construction of Fischer's sporadic group Fi24′ inside GL8671(13)*,
  Lemma 6.2(a)–(c) and Theorem 6.3, for the parent presentation and its permutation action; §7.7
  assigns the presentation-kernel and stabilizer-order proofs needed to certify that action.
- [HN][src-hn]: Bray–Curtis, *The construction of the Harada–Norton group*, §§3–5; the first
  constructor in [the corrected `HNpb.m`](https://webspace.maths.qmul.ac.uk/j.n.bray/Papers/HN/HNpb.m)
  and the [author's errata](https://webspace.maths.qmul.ac.uk/j.n.bray/Papers/HN/HN.html).
- [Ly][src-ly]: Havas–Sims, *A presentation for the Lyons simple group*, §14.2, relations
  (14.1)–(14.86), and §14.4 for the enumeration on the six retained generators.
- [Th][src-th]: Havas–Soicher–Wilson, *A presentation for the Thompson sporadic simple group*,
  Theorem 3.1 for the relators and subgroup tower, §4 for matrix generators, and §5 for the global
  enumeration.

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

### Existing formalizations

These are secondary proof sources for the targets above; they change neither the ownership nor the
exact-carrier requirements. Coordinate with their authors before adapting code, and express reusable
lemmas through Tau Ceti's presentation, character, action and Tits-system interfaces.

- Axiom's [sporadic converse theorem](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Milestones/FAM_sporadic_converse.lean)
  proves finiteness and simplicity of each exact `TauCeti.SporadicName.Group` at Tau Ceti revision
  `6e0c6acab5f4c6f42e5f5bab9bd5e4e84f74c380`. Its presentation and model comparisons are proof
  sources for Layers 6–10, after comparing relators and generators with the pinned ones. Its
  [Monster simplicity proof](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Milestones/FAM_M_simplicity.lean)
  uses the Feit–Thompson theorem through the odd-order local bounds in
  [`Monster/Existence/StdOdd/Seven`](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Monster/Existence/StdOdd/Seven.lean).
  It is not an alternative completion criterion: the construction and recognition routes of Layers
  9–10, including `M_alg`, `G₀`, `K` and `B_alg`, which Layer 11 consumes, are required, and
  fragments depending on Feit–Thompson are replaced within those routes; importing its final Monster
  theorem does not discharge them. Citing it adds no Feit–Thompson prerequisite.
- Its [finite simple Lie models](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Milestones/CAT_native_realization.lean)
  and [`LieType/Catalog`](https://github.com/AxiomMath/CFSG/tree/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/LieType/Catalog)
  supply material for Layers 2, 3 and 5. The models in
  [`Blueprint/Catalog`](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Blueprint/Catalog.lean)
  are finite-field adjoint quotients, twisted derived central quotients, and Ree and Suzuki matrix
  groups. Comparing `d.Group` with such a model is a proved `MulEquiv` (§2.6); a finite-field model
  need not have an ambient Steinberg map, and the comparison includes fixed-field descent, the
  identification of the derived subgroup with the appropriate root-generated group, and matching
  centres, which are structure theorems of Layers 2, 3 and 5 and not consequences of finiteness.
  Its admissibility predicate `StatedLieAdmissible` is matched with `TauCeti.LieTypeIndex.Valid`,
  including the Tits group versus `²F₄(2)′` and the lower bound on the Suzuki parameter.
