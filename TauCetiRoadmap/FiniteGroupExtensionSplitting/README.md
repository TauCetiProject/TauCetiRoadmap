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
That API is transfer of ordinary homomorphisms to a commutative group; S2 owns
the new transfer of crossed homomorphisms with a nontrivial conjugation action.
Its [group-extension library](https://github.com/TauCetiProject/TauCeti/tree/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/GroupExtension)
owns factor sets and extension classification. Reuse those definitions and the
native cohomology dictionary when expressing consequences in `H²`; neither a
second extension category nor a second factor-set convention belongs here.
In particular, consume `FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
from `GroupExtension/Cohomology` and
`groupCohomology.map_subtype_id_comp_corestriction` and
`index_nsmul_eq_zero_of_map_eq_zero` from
`RepresentationTheory/Homological/GroupCohomology/Corestriction`.

[LocalFiniteGroupTheory #1634](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1634)
owns Hall subgroups, conjugacy of coprime complements, and invariant Sylow theory.
This roadmap owns the coprime-index detection of splitting when `N` need not be
a Hall subgroup. Its proof constructs crossed transfer above the existing
complement and action APIs, so it has no dependency on that proposal's implementation.
The prime-power automorphism application below uses only Sylow conjugacy.

Gaschütz's [generator-lifting lemma](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/GroupTheory/Gaschutz.lean)
is already in Tau Ceti and is a different theorem. Do not redevelop it here.
Nonabelian kernels, profinite extensions and a classification of all complements
are outside this roadmap. Ordinary Schur–Zassenhaus existence is consumed from
Mathlib, not restated as new work.

## Conventions

`G` is a finite group. `N H K` are actual `Subgroup G`s; `N.Normal` and
`IsMulCommutative N` express the kernel hypotheses. A local complement is
`N ⊓ K = ⊥` and `N ⊔ K = H`; this implies `N ≤ H` and `K ≤ H`.
A global complement is `Subgroup.IsComplement' N D`. State both forms and prove
their equivalence under the normality hypothesis. Keep the finite-order and
coprime hypotheses visible, using `Nat.card` and `Subgroup.index`.

Use left crossed homomorphisms for the conjugation action:
`c(x*y) = c(x) * (x * c(y) * x⁻¹)` as an equality in `N`. Their normalizing
condition is `c(n) = n` for `n : N`. With this convention the kernel is a
complement, and `g = c(g) * (c(g)⁻¹*g)` is the associated factorization.
Use the native `NonabelianH1.Cocycle` and
`GroupExtension.Splitting.cocycleEquiv` from `GroupExtension/NonabelianH1`.
Prove the formula relating the complement projection to that splitting cocycle,
including the inversion caused by choosing a reference splitting.

## Milestones

| Layer | Inputs | Deliverable |
| --- | --- | --- |
| S0 | native complements and group extensions | local and global splitting dictionaries |
| S1 | S0, abelian kernel | crossed projections and their kernels |
| S2 | S1, Mathlib transversals, native extension cohomology | Gaschütz's coprime-index splitting theorem |
| S3 | S2, Sylow theory | Sylow detection and invariant-complement applications |

### S0: complement and section dictionaries

For `N ≤ H`, construct the quotient extension of `H` by `N.subgroupOf H` and
prove that its splittings correspond to complements to `N` in `H`. Include
the formulas for the projection onto the complement, the unique decomposition
`h = n*k`, and the induced semidirect-product equivalence. Prove transport
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

For the crossed projection in S1, construct a transfer `T : G → N` using a
finite left transversal for `H`. Prove the crossed identity and
`T(n) = n^[G:H]` for `n ∈ N`. Give the change-of-transversal formula: the
two transferred crossed homomorphisms differ by a principal crossed
homomorphism. After normalizing to fix `N`, their kernels are conjugate by
an element of `N`. Products may be reordered because `N` is abelian. Prove
all formulas with the same conjugation convention as S1.

When `[G:H]` is coprime to `|N|`, choose an inverse exponent modulo `|N|`.
Powering `T` by that exponent gives a crossed projection fixing `N`.
Its kernel is the desired global complement. Export
`exists_isComplement'_of_coprime_index` with no hypotheses of solvability,
centrality of `N`, or coprimality of `|N|` with `[G:N]`.

Relate this construction to the native extension class: prove restriction of
the class agrees with the class of the pulled-back extension over `H/N`, and
that `|N|` kills `H²(G/N,N)` because it kills the coefficient module. Native
restriction/corestriction gives `cor ∘ res = [G/N:H/N]`. Prove
`[G/N:H/N] = [G:H]` for `N ≤ H`; Bézout then proves the
class vanishes when its restriction vanishes. Compare the resulting splitting
criterion with the elementary crossed-transfer construction through the native
splitting/class dictionary. This uses the native cohomology universes; the
elementary complement theorem remains universe-polymorphic. No new model of
`H²` or extension classification is introduced.

### S3: Sylow and invariant complements

1. For an abelian normal `p`-subgroup `N` and a Sylow `p`-subgroup `P`, prove
   `N ≤ P` and the equivalence between splitting over `P` and over `G`.
   State the result both in ambient-subgroup and subgroup-of-`P` form.
2. If a finite `q`-group `A`, `q ≠ p`, acts by automorphisms on a finite
   group `W`, preserves an abelian normal `p`-subgroup `N`, and `N` splits
   in a Sylow `p`-subgroup of `W`, prove that `N` has an `A`-invariant
   complement in `W`. Apply S2 in `W ⋊ A`: the chosen Sylow `p`-subgroup
   of `W` is still Sylow in `W ⋊ A`. A global complement has `p`-power
   index, so its Sylow `q`-subgroups are Sylow in `W ⋊ A`. Conjugate the
   complement to contain `A`, then intersect with `W`. Prove the intersection
   and normalization identities. No coprimality of `|A|` and `|W|` is needed.

## Worked examples

Give the splitting of the normal `C₃` in `S₃`, with a transposition complement.
Show that the central `C₂` in `C₄` does not split and that Sylow detection says
exactly this. For `C₄ × C₃`, the same `C₂` has coprime-index overgroup `C₄`
but no local complement; this checks that the coprime-index hypothesis alone
does not assert splitting. Identify all the subgroups and quotient maps in
these examples using native cyclic groups and products.

## References and provenance

- W. Gaschütz, *Zur Erweiterungstheorie der endlichen Gruppen*, Journal für
  die reine und angewandte Mathematik 190 (1952), 93–107.
- D. J. S. Robinson, *A Course in the Theory of Groups*, 2nd ed., the theory of
  complements and abelian extensions.
- Axiom's [coprime-index complement lifting](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/GroupTheory/AbelianNormalCoprimeComplementLifting.lean#L145)
  and [Sylow and invariant complement applications](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/SignalizerFunctorTheorem/McBride/Prelim/Gaschutz.lean)
  are proof sources. They do not determine names or replace S0–S3's intrinsic
  specification. Coordinate with their authors before adapting source code.
