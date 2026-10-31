# Roadmap: Gaschütz splitting and complements to abelian normal subgroups

Develop the splitting theory of finite groups with an abelian normal subgroup.
The endpoint is **Gaschütz's splitting theorem**: if `N ⊴ G` is abelian and has
a complement in a subgroup `H` of index coprime to `|N|`, then it has a complement
in `G`. In particular an abelian normal `p`-subgroup has a complement in `G` if
and only if it has a complement in a Sylow `p`-subgroup. Prove these through a
usable library of complement projections and transfer of crossed homomorphisms.

Suggested home: `TauCeti/GroupTheory/GroupExtension/Splitting/`. The statement
concerns existence of actual subgroup complements, not just vanishing of a named
obstruction whose connection to complements remains unproved.

## Existing foundations and boundaries

Use Mathlib's `Subgroup.IsComplement'`, `GroupExtension`,
`GroupExtension.Splitting`, `SemidirectProduct` and quotient-group APIs. Tau Ceti
already supplies transfer with arbitrary finite coset representatives, naturality
and transitivity in
[`GroupTheory/Transfer/Basic`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/Transfer/Basic.lean).
For crossed homomorphisms consume
[`ContCohomology/Corestriction/Basic`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Basic.lean):
`TauCeti.ContCohomology.cochainsCor1`, `cochainsCor1_isCocycle₁`,
`cochainsCor1_changeTransversal`, `cochainsCor1_res` and `cochainsCor1_d0`.
Its degree-one cochain section needs no topology or representation category.
It already uses the words and conventions of `GroupTheory/TransversalWord`.
S2 adds the normal-subgroup restriction formula, normalization and complement
application; it does not construct a second crossed transfer.

The native group-extension library owns factor sets and extension classification.
Consume `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
from [`GroupExtension/Cohomology`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/GroupExtension/Cohomology.lean),
and `TauCeti.groupCohomology.map_subtype_id_comp_corestriction` and
`TauCeti.groupCohomology.index_nsmul_eq_zero_of_map_eq_zero` from
[`GroupCohomology/Corestriction`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean).
Neither a second extension category nor a second factor-set convention belongs here.

[LocalFiniteGroupTheory #1634](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1634)
owns Hall subgroups, conjugacy of coprime complements, and invariant Sylow theory.
This roadmap owns the coprime-index detection of splitting when `N` need not be
a Hall subgroup. Its proof applies native crossed transfer to the existing
complement and action APIs, so it has no dependency on that proposal's implementation.
The prime-power automorphism application below uses only Sylow conjugacy.

Gaschütz's [generator-lifting lemma](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/Gaschutz.lean)
is already in Tau Ceti and is a different theorem. Do not redevelop it here.
Nonabelian kernels, profinite extensions and a classification of all complements
are outside this roadmap. Ordinary Schur–Zassenhaus existence is consumed from
Mathlib, not restated as new work.

## Conventions

`G` is a finite group. S0–S2 target the finite setting used by the
Sylow and finite-group applications here; their supporting transfer and
action adapters should retain the native APIs' universe generality. `N H K` are actual `Subgroup G`s; `N.Normal` and
`IsMulCommutative N` express the kernel hypotheses. A local complement is
`N ⊓ K = ⊥` and `N ⊔ K = H`; this implies `N ≤ H` and `K ≤ H`.
A global complement is `Subgroup.IsComplement' N D`. State both forms and prove
their equivalence under the normality hypothesis. Keep the finite-order and
coprime hypotheses visible, using `Nat.card` and `Subgroup.index`.

For `N.Normal`, use `MulAut.conjNormal` to pull the evaluation action of
`MulAut N` back to `G` via `MulDistribMulAction.compHom`. Restrict that
explicit action to `H` when needed. Use Mathlib's
`groupCohomology.IsMulCocycle₁ c` for a crossed map `c : G → N`, and
`IsMulCoboundary₁` for principal crossed maps. Since `N` is abelian, its
identity `c(x*y)=(x • c(y))*c(x)` agrees with
`c(x*y)=c(x)*(x*c(y)*x⁻¹)`. The normalization is `c(n)=n`.
The kernel is a complement, with factorization `g=c(g)*(c(g)⁻¹*g)`.
Use the additive conjugation module `Additive N` for `cochainsCor1`.

The quotient-level comparison with a reference splitting uses native
`NonabelianH1.Cocycle` and `GroupExtension.Splitting.cocycleEquiv` from
[`GroupExtension/NonabelianH1`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/GroupExtension/NonabelianH1.lean),
with discrete topologies and the explicitly induced quotient action. Those
are cocycles on the quotient, not the crossed projections on `G`. Prove the
comparison formula, including inversion for the chosen reference splitting.

## Milestones

| Layer | Inputs | Deliverable |
| --- | --- | --- |
| S0 | native complements and group extensions | local and global splitting dictionaries |
| S1 | S0, abelian kernel | crossed projections and their kernels |
| S2 | S1, native degree-one corestriction and extension cohomology | Gaschütz's coprime-index splitting theorem |
| S3 | S2, Sylow theory | Sylow detection and invariant-complement applications |

### S0: complement and section dictionaries

For `N ≤ H`, construct the quotient extension of `H` by `N.subgroupOf H` and
prove that its splittings correspond to complements to `N` in `H`. Include
the formulas for the projection onto the complement, the unique decomposition
`h = n*k`. Consume `SemidirectProduct.mulEquivSubgroup` and the native
`IsComplement'` disjointness/product criteria for the semidirect-product
equivalence. Prove transport
under ambient group equivalences and between subgroups and their ambient
images. Restrict a global complement to `H` by intersection and prove it is a
local complement. All section-to-complement and complement-to-section maps
must come with inverse and value lemmas.

### S1: crossed projections

Construct from a local complement a map `c : H → N` satisfying the crossed
identity and `c(n) = n`. Conversely, construct a complement as the kernel of
such a map. Prove the kernel is a subgroup and the two constructions are
inverse. Supply equivariance under conjugation and restriction to intermediate
subgroups. This is not an ordinary homomorphism unless the action is trivial.

### S2: transfer and coprime-index detection

For S1's crossed projection, define `T : G → N` by applying native
`cochainsCor1` to `Additive N`. Pin its formula to `TauCeti.lWord`:
`T(g)=∏_{u∈G/H} t(u) • c(lWord H t u g)` in multiplicative notation.
Consume the crossed-identity and change-of-transversal theorems. Prove
`T(n)=n^[G:H]` using normality of `N≤H`, so
`lWord H t u n=t(u)⁻¹*n*t(u)` and each translated summand is `n`.
Prove that normalized crossed projections differing by the principal crossed
map of `a∈N` have kernels conjugate by `a`; apply the native explicit
coboundary formula when changing the transversal. All formulas use S1's action.

When `[G:H]` is coprime to `|N|`, choose an inverse exponent modulo `|N|`.
Powering `T` by that exponent gives a crossed projection fixing `N`.
Its kernel is the desired global complement. Export
`exists_isComplement'_of_coprime_index` with no hypotheses of solvability,
centrality of `N`, or coprimality of `|N|` with `[G:N]`.

For the cohomological comparison, construct the conjugation action of `G/N`
on the abelian kernel `N`, prove independence of the representative and the
quotient extension's `InducesAction` statement. Transport splittings through
`GroupExtension.Equiv`, using `factorSetToGroupExtensionEquiv`, and deduce
that the actual quotient extension splits iff its native factor-set class
vanishes. This extends the existing criterion for `α.groupExtension` to the
extension of S0.

Identify `H/(N.subgroupOf H)` with the image of `H` in `G/N`, identify the
kernel with `N`, and compare coefficient actions and pulled-back extensions
under those equivalences. Prove the resulting restriction formula for the
extension class. Consume `TauCeti.FactorSet.nsmul_cohomologyClass_eq_zero_iff`
for coefficient annihilation, native restriction/corestriction, and
`Subgroup.index_map_eq` for `[G/N:H/N]=[G:H]`. Bézout gives vanishing of the
class. State the comparison as an iff between existence of a complement and
vanishing of this class, with the normalized transfer kernel furnishing a
splitting under that correspondence. Consume
`TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`
for its Sylow specialization. Use native cohomology universes throughout;
the elementary complement theorem remains universe-polymorphic.

### S3: Sylow and invariant complements

1. For an abelian normal `p`-subgroup `N` and a Sylow `p`-subgroup `P`, prove
   the equivalence between splitting over `P` and over `G`.
   Consume `IsPGroup.le_sylow_of_normal` for `N ≤ P`; state the result
   both in ambient-subgroup and subgroup-of-`P` form.
2. If a finite `q`-group `A`, `q ≠ p`, acts by automorphisms on a finite
   group `W`, with `[MulDistribMulAction A W]`, preserves an abelian normal `p`-subgroup `N`, and `N` splits
   in a Sylow `p`-subgroup of `W`, prove that `N` has an `A`-invariant
   complement `D` in `W`, with `a • D = D` for every `a`.
   Also derive the internal form for `A ≤ normalizer W` in an ambient
   group, acting on `W` by conjugation. Apply S2 in `W ⋊ A`: the chosen Sylow `p`-subgroup
   of `W` is still Sylow in `W ⋊ A`. A global complement has `p`-power
   index, so its Sylow `q`-subgroups are Sylow in `W ⋊ A`. Conjugate the
   complement to contain `A`, then intersect with `W`. Prove the intersection
   and normalization identities. No coprimality of `|A|` and `|W|` is needed.

## Worked examples

Give the splitting of the normal `C₃` in `S₃`, with a transposition complement.
Consume the existing `Perm/FinThree` complement and
`TauCeti.isEmpty_splitting_zmodFourExtension` for the elementary split/nonsplit
examples. Test proper-Sylow detection using `V₄ ⊴ A₄`, which splits with
complement `C₃`, and the central `C₂ ⊴ SL(2,3)`, which does not split
even in its Sylow subgroup `Q₈`. For `C₄ × C₃`, the same `C₂` has coprime-index overgroup `C₄`
but no local complement; this checks that the coprime-index hypothesis alone
does not assert splitting. Identify all the subgroups and quotient maps in
these examples using native permutation/matrix groups, cyclic groups and products.

## References and provenance

- W. Gaschütz, *Zur Erweiterungstheorie der endlichen Gruppen*, Journal für
  die reine und angewandte Mathematik 190 (1952), 93–107.
- D. J. S. Robinson, *A Course in the Theory of Groups*, 2nd ed., the theory of
  complements and abelian extensions.
- Axiom's [coprime-index complement lifting](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/GroupTheory/AbelianNormalCoprimeComplementLifting.lean#L145)
  and [Sylow and invariant complement applications](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/SignalizerFunctorTheorem/McBride/Prelim/Gaschutz.lean)
  are proof sources. They do not determine names or replace S0–S3's intrinsic
  specification. Coordinate with their authors before adapting source code.
