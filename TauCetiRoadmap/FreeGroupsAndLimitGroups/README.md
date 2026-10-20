# Roadmap: free groups, equations over groups, and limit groups

**Summary.** This roadmap builds, on top of Mathlib's `FreeGroup`, `Monoid.PushoutI`, `HNNExtension` and first-order syntax (`FirstOrder.Language`), a library for free groups and the groups that look like them: conjugacy, roots and centralizers of reduced words, Stallings graphs of finitely generated subgroups, a first-order syntax for groups with basis coefficients, Bass–Serre theory, equations, radicals and coordinate groups over a group, surface groups and quadratic equations, Makanin's generalised equations with finite cancellation families and length bounds for solutions over a free group, fully residually free (limit) groups with their NTQ towers, Lyndon length functions and infinite words, JSJ decompositions and finite Makanin–Razborov diagrams, and finally the implicit function theorems of Kharlampovich and Myasnikov for regular quadratic equations and regular NTQ systems. Every layer ends in standalone theorems; the roadmap is useful without any formalisation of Tarski's problem for free groups, which it deliberately does not plan.

The headline targets are: the recursive decidability of satisfiability of systems of equations and inequations over a free group of finite rank (Layer 7); Merzljakov's theorem on formal solutions and the constrained-formal-solution characterization of positive sentences (Layer 7); the equivalence of limit groups, finitely generated fully residually free groups and coordinate groups of irreducible algebraic sets (Layer 8); finite Grushko and JSJ decompositions of finitely generated fully residually free groups and finite Makanin–Razborov diagrams for finite systems over a free group (Layer 10); and the implicit function theorems for regular quadratic equations and regular NTQ systems, with formal solutions (Layer 11).

## Scope and ownership

This roadmap owns:

- conjugacy, maximal roots and centralizers in free groups, primitive elements, CSA groups and commutative transitivity, with malnormality supplied by Tau Ceti (Layer 1);
- Serre graphs with edge reversal and adapters to the shared multigraph walk and component API, Stallings graphs and graph criteria for finitely generated subgroups of free groups, with the exact Schreier formula (Layer 2);
- the language of groups with basis constants, the term–word correspondence and the reduction of quantifier-free formulas and of existential and universal sentences to systems of equations and inequations (Layer 3);
- graphs of groups, their fundamental groups and Bass–Serre trees, the structure theorem, induced splittings, the Kurosh and Grushko theorems, domination, collapses and Dehn twists (Layer 4);
- algebraic geometry over groups: `G[X]`, algebraic sets, radicals, coordinate groups, separation and discrimination, domains, the Zariski topology, equational Noetherianity and irreducible components (Layer 5);
- finite polygonal surface models, their normal forms, face presentations and peripheral groups, curves and cutting, surface groups with boundary and quadratic equations, regularity, radicals, and quadratically hanging vertices (Layer 6);
- generalised equations, Makanin's finiteness and minimal-solution bounds, recursive truth sets for the existential, universal and positive fragments, and Merzljakov's theorem (Layer 7);
- fully residually free groups, limit groups, extensions of centralizers, the embedding theorems, finite presentability, and NTQ systems (Layer 8);
- Lyndon length functions, `Λ`-trees and free actions on them, infinite words, `F^{ℤ[t]}` and graphs labelled by infinite words (Layer 9);
- JSJ theory for limit groups, marked finite Grushko and JSJ graphs, complete Makanin–Razborov factorization diagrams, finite irreducible-component systems, and equations over a limit group (Layer 10);
- lifts to generic points, basic automorphisms and generic families, and the regular implicit function theorems (Layer 11).

What it builds on, and does not plan again:

- **Mathlib** (at the Tau Ceti pin) already has the free group with reduced words and cyclic reduction (`FreeGroup.reduce`, `FreeGroup.toWord`, `FreeGroup.IsCyclicallyReduced`, `FreeGroup.reduceCyclically`), torsion-freeness and uniqueness of roots for a fixed exponent (the `IsMulTorsionFree` instance on `FreeGroup α`), free bases (`FreeGroupBasis`, `IsFreeGroup`), the non-constructive Nielsen–Schreier theorem (`subgroupIsFreeOfIsFree`), the Schreier inequality `Subgroup.rank_le_index_mul_rank`, amalgamated products and HNN extensions with their normal forms (`Monoid.PushoutI.NormalWord`, `HNNExtension.NormalWord`, hence Britton's lemma), free products and the ping-pong lemma (`Monoid.CoprodI`, `Monoid.CoprodI.lift_injective_of_ping_pong`, and the free-group form `FreeGroup.injective_lift_of_ping_pong`), presented and finitely presented groups, first-order syntax and semantics with prenex normal form (`FirstOrder.Language.BoundedFormula.toPrenex`), list encodings of terms and formulas, and the computability framework. These are cited, never re-planned. Reduced-word equality and the trivial-word criterion are consumed directly, and syntax encoding and prenex transformations have no second implementation here.
- **Shared free-group centralizer interfaces.** [Mathlib PR #42677](https://github.com/leanprover-community/mathlib4/pull/42677), commit `b38ce379d898d1284bae5582be27de1d2af39f67`, proposes `FreeGroup/Center.lean` with `FreeGroup.centralizer_of_eq_closure`, `FreeGroup.isCyclic_centralizer`, `FreeGroup.commute_of_commute`, `FreeGroup.center_eq_top_of_subsingleton` and `FreeGroup.center_eq_bot_of_nontrivial`. These overlap §§1.5–1.8. Coordinate the shared signatures with that work and build the required theory in Tau Ceti using its interface shape wherever the pinned Mathlib lacks it; adopt the Mathlib declarations when available. The maximal-root identification and malnormality targets remain here. No reuse of the proposed proofs is required.
- **Tau Ceti at the pin** already has malnormal subgroups, as trivial-intersection subgroups: `TauCeti.IsTISubgroup` (TauCeti/GroupTheory/TrivialIntersection.lean), with its lattice form `TauCeti.isTISubgroup_iff_inf_conj_smul_eq_bot`. The CSA condition of Layer 1 is stated with it, and malnormality is not defined again here; `RepresentationTheory/CharacterTheory`, Layer 8 “Frobenius groups and Frobenius’s theorem,” uses the same notion for finite groups.
- **Tau Ceti at the pin** supplies free-group residual finiteness, residual `p` and the sharper Schreier inequality through the exact contracts below. The equality for finite-index free subgroups is Layer 2.
- **Tau Ceti roadmaps.** [GraphConnectivityAndFlows, Target 1.1](../GraphConnectivityAndFlows/README.md#11-undirected-walks-isomorphisms-and-representation-bridges) supplies native multigraph walks, connectivity and components; §§2.1–2.1a own the Serre-dart adapter. §§2.2–2.2a own graph path groups, spanning-tree presentations, finite multigraph integral and binary cycle kernels, forest bases, coefficient comparison and rank formulas. §§6.0a–6.1a own the finite polygonal surface models, normal forms, face presentations and marked boundary comparisons used here; §6.0d owns combinatorial two-sided curves, proper arcs, their cut models and the cutting-to-splitting comparisons. These are item-level inputs, without flow, Menger or mapping-class-group prerequisites. `AlgebraicTopology's` surface topology and `FuchsianOrbifolds`' analytic surfaces have different applications. QH vertices here have hyperbolic surface groups and trivial fiber (§6.10); `GeometricTopology's` geometric JSJ is distinct from Layer 10's group-theoretic JSJ. `ProfiniteProPGroups` and `PeripheralActions` concern pro-`p` groups. [ClassifyingSpaces, Stage 2 item 7](../ClassifyingSpaces/README.md#stage-2-the-cellular-model) supplies presentation complexes and their fundamental-group comparison to §10.1a, hence §10.2 and downstream JSJ consumers; §2.2 is combinatorial and independent of that input. These roadmap contracts are specifications, distinct from the declarations implemented at the library pin.

| Shared mathematics | Owner and supplier contract | Dependency direction |
| --- | --- | --- |
| Underlying multigraph incidence | Mathlib `Graph` | §2.1 supplies the Serre-dart adapter. |
| Native multigraph walks, connectivity and components | `GraphConnectivityAndFlows` Target 1.1 | §2.1a consumes this API and proves the Serre comparison; no flow or Menger target is needed. |
| Graph edge-path groups, spanning-tree presentations and group rank | Local §2.2, over Mathlib `FreeGroup` and `PresentedGroup` | Layers 2, 4, 7 and 10 use these graph group results. |
| Finite multigraph cycle kernels, forest bases, coefficient comparison and ranks | Local §2.2a; component counts from `GraphConnectivityAndFlows` Target 1.1 | The general core includes loops, parallel edges, disconnected graphs and the empty graph; its graph-group comparisons use §2.2. |
| Finite polygonal surfaces, boundary incidence, moves and normal forms | Local §§6.0a–6.0b | §6.0d consumes this polygonal carrier; §§6.3–6.4 and §6.10 use the resulting peripheral surfaces. |
| Combinatorial two-sided curves, proper arcs and cut models | Local §6.0d, on the carrier of §§6.0a–6.0b | Both curve and arc cutting, disjoint-family and subdivision compatibility, marked boundary transport, face-group regluing and the monomorphic cyclic edge maps are local targets. §§6.3 and 6.10 consume these contracts. |
| Surface face presentations and subdivision comparisons | Local §6.0c | §6.1a identifies the marked boundary conjugacy classes in `S±(g,m)`. Quadratic normalization in §6.6 is independent of surface realization. |
| Presentation complexes and their fundamental groups | `ClassifyingSpaces` Stage 2.7 (on main), using `AlgebraicTopology` Stage 1 van Kampen and Stage 4 CW inputs | Stage 2.`7 →` §10.1a `→` §10.2 and downstream JSJ consumers; the relative finite-cell construction and track resolution are owned in §10.1a. |

`Out` of scope (non-goals): the full first-order decision procedure for free groups and everything specific to it — effective reduction of arbitrary formulas to Boolean combinations of two-block formulas, the existential–universal decision trees, MAX-equivalence and the associated algebraic-solution bounds, complete reducing systems of that procedure, induced-NTQ enlargement algorithms, tight envelopes, projective-image and configuration machinery, and termination of the outer quantifier-elimination procedure; also the parametrisation theorem for arbitrary NTQ systems with correcting embeddings, lifts of `∀∃` formulas over arbitrary systems, implicit function theorems for non-regular NTQ systems, and the classification of groups up to elementary equivalence. A separate first-order decidability development may import this library; none of its specialised constructions are hidden prerequisites here.

## Conventions

- **Words.** A word over `α` is a `List (α × Bool)`, the letter `(a, true)` standing for `a` and `(a, false)` for `a⁻¹` (Mathlib's convention). Elements of `FreeGroup α` are represented by their reduced words `toWord`. Finite bases are `Fin n` or a `Fintype` with an explicit enumeration.
- **Commutators and conjugation.** `[x, y] = x⁻¹ y⁻¹ x y` in the sources' formulas; Lean uses the real-bodied function `comm x y = x⁻¹ * y⁻¹ * x * y`, which equals Mathlib's `⁅x⁻¹, y⁻¹⁆`; thus `comm a b` reduces to `a⁻¹ b⁻¹ a b` for distinct basis letters (the surface relators of Layer 6 are stated with the source convention). Conjugation `g⁻¹ x g` is written `x^g`.
- **Malnormality.** A subgroup `M ≤ G` is malnormal when `g M g⁻¹ ∩ M = 1` for every `g ∉ M`. This is Tau Ceti's `TauCeti.IsTISubgroup M`, and the word ‘malnormal’ always refers to it.
- **Coefficients.** For a coefficient group `G`, `G[X] := Monoid.Coprod G (FreeGroup X)`; a `G`-group has a specified embedding of `G`; the evaluation constructions also make sense for an arbitrary coefficient homomorphism, with injectivity stated separately where it is used; equations over `G` are elements of `G[X]`. For `G = F(A)` the identification `G[X] ≅ FreeGroup (X ⊕ A)` is used for computations.
- **Graphs and graphs of groups.** Graphs are Serre graphs (edge reversal without fixed points; loops and multiple edges allowed). In a graph of groups the boundary monomorphisms satisfy `α_e = ω_{ē}`, and the fundamental group uses the relation `e ω_e(c) e⁻¹ = α_e(c)`.
- **Finite descriptions and decidability.** All targets specify mathematical objects, existence, uniqueness, solution sets and factorization. Recursive decidability assertions concern sets of finite words or sentences; no executable procedure, algorithm implementation, output certificate or complexity bound is a target. For finite presentations of limit groups, the hypothesis that the represented group is fully residually free is explicit; no recognition theorem for that class is asserted.
- **Semantics.** First-order semantics is Mathlib's; prenex transformations are used in nonempty structures, which groups are.

## Exact supplier contracts

### From Mathlib (commit 6b7abb3)

- `FirstOrder.Language`: A first-order language: function and relation symbols graded by arity. Used in §3.1.
- `FirstOrder.Language.BoundedFormula`: Formulas with free variables in `α` and `n` de Bruijn-indexed bound variables (capture is impossible by construction). Used in the semantic correspondence of §3.2 and the positive normal forms of §7.9.
- `FirstOrder.Language.BoundedFormula.IsExistential`: Existential formulas: quantifier-free formulas under a block of existential quantifiers. Used in §3.5.
- `FirstOrder.Language.BoundedFormula.IsQF`: Quantifier-free bounded formulas. Used in §3.4.
- `FirstOrder.Language.BoundedFormula.IsUniversal`: Universal formulas. Used in §3.5.
- `FirstOrder.Language.BoundedFormula.Realize`: Satisfaction of a bounded formula. Used in the semantic correspondence of §3.2 and the positive normal forms of §7.9.
- `FirstOrder.Language.BoundedFormula.listEncode`: List encoding of a bounded formula at a fixed number `n` of bound variables; `listDecode` and its round trip `listDecode_encode_list` go through `Σ n`, `BoundedFormula α n`. Mathlib gives Countable instances, no Encodable or Primcodable structure on formulas. Used in the first-order truth-set statements of Layer 7.
- `FirstOrder.Language.BoundedFormula.realize_toPrenex`: `toPrenex` preserves satisfaction in every nonempty structure. Used in the semantic correspondence of §3.2 and the positive normal forms of §7.9.
- `FirstOrder.Language.BoundedFormula.toPrenex`: A prenex normal form transformation of bounded formulas. Used in the semantic correspondence of §3.2 and the positive normal forms of §7.9.
- `FirstOrder.Language.Sentence`: Sentences: formulas without free variables. Used in §3.5.
- `FirstOrder.Language.Structure`: An interpretation of a language in a type. Used in §3.1.
- `FirstOrder.Language.Term`: First-order terms over a language with variables in a type. Used in §3.2.
- `FirstOrder.Language.Term.listEncode`: List encoding of terms, with `listDecode` and the round trip `listDecode_encode_list`; Encodable instance on terms. Used in the first-order truth-set statements of Layer 7.
- `FirstOrder.Language.withConstants`: The language `L[[A]]` obtained by adding constant symbols for the elements of `A`. Used in §3.1.
- `FreeGroup`: The free group on a type, as the quotient of words List `(α × Bool)` by one-step reduction; (a, true) is the letter `a` and (a, false) its inverse. Used in §1.2, §2.2, §2.3, §3.2, §3.3, §5.1, §5.8, §6.1, §7.1, §8.3, §9.1, §9.4.
- `FreeGroup.IsCyclicallyReduced`: A word is cyclically reduced when it is reduced and its last letter is not the inverse of its first. Used in §1.1.
- `FreeGroup.IsReduced`: A word is reduced when no letter is followed by its inverse (`List.IsChain` condition). Used in §2.3, §7.1.
- `FreeGroup.injective_lift_of_ping_pong`: The free-group ping-pong lemma. For a nontrivial index type `ι`, `a : ι → G` and a `G`-action on a set with sets `X i`, `Y i` such that every `X i` is nonempty, the `X i` are pairwise disjoint, the `Y i` are pairwise disjoint, `X i` and `Y j` are disjoint for all `i`, `j`, `a i • (Y i)ᶜ ⊆ X i` and `(a i)⁻¹ • (X i)ᶜ ⊆ Y i`, the map `FreeGroup.lift a` is injective. Used in §5.8.
- `FreeGroup.lift`: The universal property: `(α → β) ≃ (FreeGroup α →* β)`, with `lift_mk` computing on words. Used in §3.3, §5.1.
- `FreeGroup.map`: Functoriality of `FreeGroup` in the basis. Used in §3.2 and §5.1.
- `FreeGroup.norm`: Word length: the length of the reduced word, with `norm_mul_le`, `norm_inv_eq`, `norm_eq_zero`. Used in §9.1.
- `FreeGroup.reduce`: Free reduction of a word, a structurally recursive (computable) function on List `(α × Bool)` given `DecidableEq α`. Used throughout Layer 1 and Layer 2.
- `FreeGroup.reduce.exact`: reduce `L₁ =` reduce `L₂` implies mk `L₁ =` mk `L₂`. Used in word equality and path membership throughout Layers 1–2.
- `FreeGroup.reduce.sound`: mk `L₁ =` mk `L₂` implies reduce `L₁ =` reduce `L₂`. Used in word equality and path membership throughout Layers 1–2.
- `FreeGroup.reduceCyclically`: Cyclic reduction of a word (defined on every list), with the conjugator; `reduceCyclically L` is cyclically reduced when `L` is reduced. Used in §1.1 and §1.4.
- `FreeGroup.reduceCyclically.conj_conjugator_reduceCyclically`: A word equals conjugator `· reduceCyclically · conjugator⁻¹` (as words, so in the group). Used in §1.1, §1.4.
- `FreeGroup.toWord`: The reduced word of an element of `FreeGroup α`, with `toWord_injective` and `mk_toWord`. Used throughout Layer 1 and Layer 2.
- `FreeGroup.toWord_injective`: `toWord` is injective on `FreeGroup α`. Used throughout Layer 1 and Layer 2.
- `FreeGroup.toWord_inv`: `toWord x⁻¹ = invRev (toWord x)`. Used in the word-length and path statements.
- `FreeGroup.toWord_mul`: `toWord (x * y) =` reduce `(toWord x ++ toWord y)`. Used in the word-length and path statements.
- `FreeGroupBasis`: A free basis of a group: an isomorphism with `FreeGroup ι`, with lift and `ext_hom`. Used in §1.3, §2.8.
- `Group.IsFinitelyPresented`: A group is finitely presented: a quotient of a free group of finite rank by the normal closure of finitely many elements. Used in §8.7, §10.2.
- `Group.ResiduallyFinite`: Residually finite groups. Used in §6.2.
- `Group.rank`: The minimal cardinality of a finite generating set of a group with `[Group.FG G]` (noncomputable). Used in §2.11, §4.11.
- `HNNExtension`: The HNN extension of `G` along an isomorphism `φ : A ≃* B` of subgroups, with of, `t`, lift and `t_mul_of`. Used in §4.5, §4.13, §8.5.
- `HNNExtension.NormalWord`: Normal words for HNN extensions relative to a transversal pair, with equiv : `HNNExtension ≃ NormalWord` (the normal form theorem; noncomputable). Britton's lemma is the separate theorem `HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range`. Used in §4.3.
- `HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range`: Britton's lemma: a reduced word whose product lies in the image of the base group contains no occurrence of `t`. Used in §4.3.
- `HNNExtension.of_injective`: The base group embeds in the HNN extension. Used in §4.3.
- `IsConj`: Conjugacy of two elements of a monoid. Used in §1.1.
- `IsFreeGroup`: A group admitting a free basis. Used in §1.3, §2.8, §6.2, §8.1.
- `IsIrreducible`: Irreducible subsets of a topological space. Used in §5.10.
- `IsMulCommutative`: The class of commutative multiplications, applied to a subgroup coerced to a type (abelian subgroups). Used in §1.7.
- `IsMulTorsionFree`: Injectivity of `x ↦ x ^ n` for `n ≠ 0`; `FreeGroup α` carries an instance in Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean (unique roots and torsion-freeness). Used in §1.4 (Maximal roots and their uniqueness).
- `Lex`: The lexicographic order type synonym; `Lex (Fin n → ℤ)` is a linearly ordered abelian group. Used in §9.1, §9.2, §9.4.
- `Matrix.SpecialLinearGroup`: The special linear group `SL(n, R)`. Used in §5.8, §5.9.
- `Monoid.Coprod`: The binary free product `M ∗ N` of monoids (groups), with `inl`, `inr` and lift. Used in §4.2, §4.5, §5.1.
- `Monoid.Coprod.lift`: The universal property of the binary free product. Used in §5.1.
- `Monoid.CoprodI`: The free product of a family of monoids or groups, with reduced words Word and the ping-pong lemma. Used in §4.2.
- `Monoid.CoprodI.lift_injective_of_ping_pong`: For homomorphisms `f i : H i →* G` and a `G`-action, assume nonempty pairwise disjoint sets `X i` and, for `i ≠ j` and `h ≠ 1` in `H i`, `f i h • X j ⊆ X i`. Also require either at least three indices or a factor with at least three elements. Then the lift from the free product is injective. Used in §5.8.
- `Monoid.PushoutI`: The pushout (amalgamated free product) of a family of groups over a common group `H`, with of, base, lift. Used in §4.5, §4.13, §8.5.
- `Monoid.PushoutI.NormalWord`: Normal words for amalgamated products relative to a Transversal (which bundles injectivity of every `φ i`), with equiv : `PushoutI ≃ NormalWord` (normal form theorem; noncomputable, needs `DecidableEq` on the index and factors). Used in §4.3.
- `Monoid.PushoutI.of_injective`: When every `φ i` is injective, every factor embeds in the amalgamated product. Used in §4.3.
- `PresentedGroup`: The group `FreeGroup α ⧸ normalClosure` rels presented by generators `α` and relators rels. Used in §6.1.
- `Quiver`: Quivers (directed multigraphs with loops), with paths in Mathlib/Combinatorics/Quiver/Path.lean. Used in §2.1.
- `SimpleGraph`: Simple graphs (no loops, no multiple edges). Used in §2.1.
- `SimpleGraph.Dart`: Darts (oriented edges) of a simple graph, with Dart.symm, `Dart.symm_symm` and `Dart.symm_ne` (no dart is its own reverse). Used in §2.1.
- `Subgroup.centralizer`: The centralizer of a subset of a group. Used in §1.6, §1.7, §4.13, §8.5.
- `Subgroup.index`: The index of a subgroup (0 when infinite). Used in §2.11.
- `Subgroup.normalClosure`: The normal closure of a subset of a group. Used in §4.2, §5.2, §8.3.
- `Subgroup.rank_le_index_mul_rank`: For `[Group.FG G]` and `[H.FiniteIndex]`: rank `H ≤` index `H ·` rank `G` (an inequality only). Used in §2.11.
- `Subgroup.zpowers`: The cyclic subgroup generated by an element. Used in §1.6.
- `TopologicalSpace.NoetherianSpace`: Noetherian topological spaces (descending chain condition on closed sets), with finite decomposition into irreducible components. Used in §5.10.
- `TopologicalSpace.generateFrom`: The topology generated by a family of sets declared open. Used in §5.6.
- `subgroupIsFreeOfIsFree`: Nielsen–Schreier: every subgroup of a free group is free (non-constructive, via free groupoids). Used in §2.8.

- `FreeGroup.toWord_eq_nil_iff`: `x.toWord=[]` if and only if `x=1`; `FreeGroup.toWord_mk` computes the word of mk `L` as reduce `L`. These supply word equality and the trivial-word criterion, including cancellation of `a b b⁻¹a⁻¹`.

- `Primcodable`, `Primrec` and `ComputablePred` (Mathlib/Computability): the standard natural-number encoding framework, primitive recursiveness, and recursive predicates. The recursion assertions below use these library meanings on finite-word or syntax codes; no extra executable encoding is specified.

### From Tau Ceti (commit a91d3aa)

- `TauCeti.IsTISubgroup` (TauCeti/GroupTheory/TrivialIntersection.lean): `H ≤ G` is a trivial-intersection, that is malnormal, subgroup, stated elementwise: for `g ∉ H` and `x ∈ H`, `g x g⁻¹ ∈ H` forces `x = 1`. Used in §1.7 (CSA groups and commutation transitivity) and §1.8, and through them wherever CSA groups occur (§5.5, §7.9, Layer 8).
- `TauCeti.isTISubgroup_iff_inf_conj_smul_eq_bot`: `IsTISubgroup H ↔ ∀ g ∉ H`, `H ⊓ MulAut.conj g • H = ⊥`, the lattice form. Used in §1.8.
- `FreeGroup.instResiduallyFinite` (TauCeti/GroupTheory/FreeGroup/ResiduallyP.lean): every free group is `Group.ResiduallyFinite`. `FreeGroup.exists_normal_isPGroup_quotient_notMem` supplies a finite-index normal subgroup avoiding any specified nontrivial word, with `p`-group quotient for each prime `p`. Used in §6.2.
- `Subgroup.rank_le_one_add_index_mul_rank_sub_one` (TauCeti/GroupTheory/Schreier.lean): for a finite-index subgroup `H` of a finitely generated `G`, `rank H ≤ 1 + H.index * (rank G - 1)`, in natural numbers. Layer 2 asks for the exact integer equality for free groups.
- `TauCeti.IsTISubgroup.centralizer_singleton_le` (TauCeti/GroupTheory/TrivialIntersection.lean): if `H` is malnormal and `1≠x∈H`, then `C_G(x)≤H`. Used with maximal abelian subgroups in §1.7.

Cross-layer prerequisites are explicit: §§8.5–8.6 precede §6.8; §§8.8–8.9 provide the normalized tower embedding independently of §8.7; §8.6a's carrier and ICE comparison and §8.6b's irreducible-to-tower embedding precede §8.7, while §9.5's length-function corollary follows §8.7. Finite presentability in §8.7 precedes §8.2's finite-rank abelian-subgroup conclusion.


## How to read the build

The representative Lean boundary targets are `rad_sq` (§5.2),
`trivial_coefficients_closure_boundary` (§5.6), `centralizerExt_proper_power` (§8.5),
and `compatible_no_lift` (§11.1).

Layer 1 proves conjugacy, roots and centralizers over Mathlib's free group. Layer 2 adds Serre graphs and the Stallings correspondence; Layer 3 supplies the language of groups and the term–word and formula–system dictionaries. Layer 4 develops Bass–Serre theory. Layer 5 gives algebraic geometry over a coefficient group; Layer 6 treats surface groups and quadratic equations. Layer 7 supplies cancellation families, solution bounds and positive formal solutions. Layer 8 identifies limit groups, fully residually free groups and irreducible coordinate groups and builds NTQ towers. Layer 9 gives length functions, infinite words and subgroup graphs. Layer 10 proves finite JSJ and Makanin–Razborov factorization theorems; Layer 11 proves the regular implicit function theorems. The subsection contracts fix the proof order: §§8.5–8.6 supply §6.8; §§6.8–6.9 and §8.8 supply normalized tower discrimination and embeddings in §8.9 independently of §8.7; §§8.6a–8.6b and §8.9 supply §8.7; §8.7 supplies §8.2's finite-rank centralizers and §9.5's limit-group length-function corollary.

## Layer 1: Free-group conjugacy, roots and centralizers

This layer proves the elementary structure of free groups: conjugacy, maximal roots, cyclic centralizers and CSA. Proper powers and primitive elements are different notions, and root and centralizer statements explicitly distinguish the identity.

### 1.1 Conjugacy criterion: cyclic reductions agree up to cyclic permutation

Prove the following statement. For `x`, `y ∈ FreeGroup α`, `x` and `y` are conjugate if and only if the cyclically reduced words `reduceCyclically (toWord x)` and `reduceCyclically (toWord y)` are cyclic permutations of each other `(List.IsRotated)`. Moreover every element is conjugate, by the explicit word conjugator `(toWord x)`, to the element of its cyclic reduction.

Throughout this subsection assume: `α` has decidable equality.

By Mathlib's `conj_conjugator_reduceCyclically`, `x` is conjugate to the element `u` of its cyclic reduction; likewise `y` to `v`.
Rotating a cyclically reduced word is conjugation by a prefix, so rotated words give conjugate elements.
Conversely if `g⁻¹ u g = v` with `u`, `v` cyclically reduced, analyse cancellation at both ends. A conjugator of length at most `|u|` is either the appropriate prefix or the inverse of a terminal segment of `u`; in either case `v` is a rotation (the `ℤ` case of MRS-REGULAR Lemma 3.`8(2)`). For a longer conjugator, remove the complete copies of `u` or `u⁻¹` that cancel, reducing to the short case. The identity is handled separately.

`a b` and `b a` are conjugate in `F(a,b)`; `a b` and `a b⁻¹` are not (their cyclic reductions are not rotations of each other). The criterion fails for words that are not cyclically reduced: `a b a⁻¹` and `b` are conjugate though `a b a⁻¹` is not a rotation of `b`, which is why the cyclic reduction is taken first.

Use [MRS-REGULAR] §3, Lemma 3.8, p. 13 of the author copy: For infinite words over a discretely ordered abelian group, a conjugate of a cyclically reduced word by a short enough conjugator is a cyclic permutation; the case of the ordered group `ℤ` is ordinary reduced words.; [LEAN] Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean (`reduceCyclically`, conjugator, `conj_conjugator_reduceCyclically`): Cyclic reduction of a reduced word with the explicit conjugating prefix.

*Needs:* Mathlib `FreeGroup.reduceCyclically.conj_conjugator_reduceCyclically`; Mathlib `FreeGroup.IsCyclicallyReduced`; Mathlib `FreeGroup.reduceCyclically`; Mathlib `IsConj`.

The finite-word background is also a mathematical target. For a `Primcodable` alphabet `α` with decidable equality, use the standard list code of `α×Bool` and identify free-group elements with their reduced words. Prove that reducedness, free reduction, word equality, conjugacy and proper-power membership are primitive recursive on these codes. Multiplication is reduction of concatenation; inversion is reversal with inverted signs. For a finite enumerated `α` and a primitively encoded group `H` whose multiplication and inversion are primitive recursive, evaluation under a finite table `α→H` is primitive recursive; so are substitutions of free-group words and maps induced by finite basis maps. State the round-trip relation between valid reduced-word codes and `FreeGroup α` using `toWord` and `mk`, without constructing a second free-group carrier or an encoding instance. The shortest-period description of §1.4 gives primitive-recursive maximal-root data, with the identity distinguished. Sources: [LEAN] Mathlib/GroupTheory/FreeGroup/Reduce.lean and Mathlib/Computability/Primrec/List.lean; [IFT] §2.1, p. 4; [SUBGROUPS] §5, proof of Lemma 21, p. 36.

For the finite substitution `a↦a b`,`b↦b`, the word `[a,b]=a⁻¹b⁻¹a b` maps to `b⁻¹a⁻¹b⁻¹a b²`. The empty word has code for the empty list, the word `a a⁻¹` represents that same group element, and an unreduced list is not itself a valid reduced-word representative.

### 1.2 Proper powers

Define `Group.IsProperPower` as follows. An element `x` of a group `G` is a proper power when there are `y ∈ G` and `n ∈ ℕ` with `n ≥ 2` and `x = y ^ n`. This is a predicate on any group `(Group.IsProperPower)`, used here for free groups and in Layer 8 for limit groups.

Definition by an existential statement over `G × ℕ`.

The public interface should expose the following named results:

- `Group.IsProperPower`: `IsProperPower x ↔ ∃ y n`, `2 ≤ n ∧ x = y ^ n`.
- `Group.IsProperPower.map`: A homomorphism maps proper powers to proper powers (the converse fails).
- `Group.IsProperPower.one`: 1 is a proper power (`1 = 1 ^ 2`); the root statements therefore treat the identity separately.
- `Group.isProperPower_zpow`: For `|n| ≥ 2`, `y ^ n` is a proper power.

**Checks.**

- `FreeGroup.isProperPower_of_sq`: `of a ^ 2` is a proper power in `FreeGroup α`.
- `FreeGroup.not_isProperPower_of`: `of a` is not a proper power: in particular not every nontrivial element of a free group is a proper power, and a definition allowing `n = 1` is wrong.
- `FreeGroup.not_isProperPower_commutator`: For `a ≠ b`, the commutator `⁅of a, of b⁆` is not a proper power, although it is not primitive either (§1.3): the two notions differ.
- `Group.isProperPower_one`: The identity is a proper power, so ‘not a proper power’ is used only for nontrivial elements.

In `F(a,b)`, `a²` and `(a b)³` are proper powers; a, `a b` and `[a,b]` are not.

This interface is used by Layer 1 maximal roots: a maximal root is a root that is not a proper power; Layer 8 centralizer extensions: the extended element `u` is taken not to be a proper power (IFT p. 6); Layer 7 periodic structures: periods are cyclically reduced non-proper-powers (IFT §5, p. 40).

Use [IFT] §5.4, p. 40: A period is defined there as a cyclically reduced word that is not a proper power; periods organise the analysis of periodic solutions of generalised equations.; [VAR-I] §1, Lemma 12 and its proof, p. 17: A nontrivial commutator in a free group is not a proper power (Schützenberger), used to identify commuting commutators.

*Needs:* Mathlib `FreeGroup`.

### 1.3 Primitive elements of a free group

Define `FreeGroup.IsPrimitive` as follows. An element `x` of a group `G` with `IsFreeGroup G` is primitive when it belongs to some free basis of `G`: there are a type `ι`, a basis `b : FreeGroupBasis ι G` and `i : ι` with `b i = x`. For `FreeGroup α` this is the existence of an automorphism sending `x` to of a for some a.

Definition by quantifying over Mathlib's `FreeGroupBasis`.

The public interface should expose the following named results:

- `FreeGroup.IsPrimitive`: `IsPrimitive x ↔ ∃ (ι) (b : FreeGroupBasis ι G) (i : ι)`, `b i = x`.
- `FreeGroup.IsPrimitive.of`: `of a` is primitive in `FreeGroup α`.
- `FreeGroup.IsPrimitive.map_mulEquiv`: Primitivity is invariant under group isomorphisms.
- `FreeGroup.IsPrimitive.not_isProperPower`: A primitive element is not a proper power (its image in the abelianisation is part of a basis of `ℤ^(α)`).

**Checks.**

- `FreeGroup.isPrimitive_of_mul`: of a * of `b` is primitive in `F(a,b)`, witnessed by the basis `(a b, b)`.
- `FreeGroup.not_isPrimitive_commutator`: `⁅of a, of b⁆` is not primitive and not a proper power (its abelianisation is 0): being primitive is not the negation of being a proper power.
- `FreeGroup.not_isPrimitive_one`: 1 is not primitive.
- `FreeGroup.not_isPrimitive_sq`: `of a ^ 2` is not primitive.

In `F(a,b): a`, `a b` (basis `(a b, b)`) and `a b²` (basis `(a b², b)`) are primitive; `a²`, `[a,b]` and 1 are not.

This interface is used by Layer 1 maximal roots: the specification keeps proper powers distinct from non-primitive elements; Layer 11 generic families: Merzljakov words and the basic automorphisms are built from primitive elements of `F`; Layer 2 free factors: Stallings graphs detect free factors.

Use [KM02] §11 (algebraic extensions and free factors), pp. 31–33: Free factors of finitely generated subgroups of `F` are detected on subgroup graphs (Theorem 11.2); KM02 does not use the word primitive, and this definition is the rank-one free-factor case.; [LEAN] Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean `(FreeGroupBasis)`: Free bases of a free group as data.

*Needs:* Mathlib `IsFreeGroup`; Mathlib `FreeGroupBasis`.

### 1.4 Maximal roots and their uniqueness

For every nontrivial `x ∈ FreeGroup α` there is a unique pair `(r, k)` with `r ∈ FreeGroup α`, `k ∈ ℕ`, `k ≥ 1`, `r^k = x` and `r` not a proper power. Prove `FreeGroup.exists_maximalRoot` with this exact existence and uniqueness statement. Prove also that every positive-exponent root `y^n = x` satisfies `n ∣ k` and `y = r^(k/n)`, and that conjugation and inversion transport the pair to `(g r g⁻¹, k)` and `(r⁻¹, k)`. For a positive integer `m` the pair for `x^m` is `(r, m k)`. These statements specify roots by their intrinsic properties.

The cyclically reduced word of `x` is a positive power of its shortest repeating block; transporting that block by the cyclic-reduction conjugator gives `r`. Mathlib supplies uniqueness of roots for a fixed nonzero exponent. The identity has no pair satisfying the non-proper-power condition: 1 is itself a proper power, and exponents in `1=1^k` are not unique.

**Checks.**

- For `x=(a b)²` with distinct a,`b`, the unique pair is `(a b,2)`.
- For `x=b a² b⁻¹`, the pair is `(b a b⁻¹,2)`, which fixes the direction of conjugation.
- A nontrivial commutator `[a,b]` has pair `([a,b],1)`, although it is not primitive.
- The roots of `(a b)⁶` with positive exponent are `(a b)^(6/n)` for `n∣6`; in particular its square root is `(a b)³`.
- At `x=1` the positive-exponent uniqueness assertion fails, so all these assertions require `x≠1`.

Sources: [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy; [LEAN] Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean `(FreeGroup.reduceCyclically.reduce_flatten_replicate)`.

*Needs:* §1.2 (Proper powers); §1.1 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation); Mathlib `IsMulTorsionFree` and `FreeGroup.reduceCyclically.reduce_flatten_replicate`.

### 1.5 Commuting elements of a free group are powers of a common element

Prove the following statement. For `x`, `y ∈ FreeGroup α: x * y = y * x` if and only if there are `r ∈ FreeGroup α` and `m`, `n ∈ ℤ` with `x = r ^ m` and `y = r ^ n`. If `x≠1`, take its unique maximal root from §1.4.

If `x = 1` take `r = y`. Otherwise conjugate so that `x` is cyclically reduced; `y` commutes with `x`, so `y⁻¹ x y = x`, and by §1.1 `y` conjugates the cyclically reduced word `x` to itself; induct on `|y|` as in that proof to get `y ∈` the cyclic group generated by the maximal root of `x`.
The converse is immediate.

`a b` and `(a b)³` commute; `a` and `b` do not. In `ℤ²` (not free) the conclusion fails: `(1,0)` and `(0,1)` commute but are not powers of one element; the theorem uses freeness.

Use [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy: Centralizers of nontrivial elements of `F` are cyclic, generated by maximal roots.; [ALG] §2.1, p. 15 of the author copy: In a CSA group centralizers of nontrivial elements are abelian and commutation is transitive on nontrivial elements; free groups are CSA.

*Needs:* §1.4 (Maximal roots and their uniqueness); §1.1 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation).

### 1.6 Centralizers of nontrivial elements are the cyclic groups of their maximal roots

Prove the following statement. For `x ∈ FreeGroup α` with `x ≠ 1`: For the maximal-root pair `(r,k)` of §1.4, Subgroup.centralizer `{x} =` Subgroup.zpowers `r`. For `x=1` the centralizer is `⊤`; it need not be cyclic.

Combine §1.5 with §1.4 (Maximal roots and their uniqueness): an element commuting with `x` is a power of the common root, which is a power of the maximal root.

The centralizer of `a² b a² b` in `F(a,b)` is `⟨a² b⟩`. The centralizer of 1 is the whole group, which is not cyclic when `|α| ≥ 2`: the identity is handled explicitly.

Use [SUBGROUPS] §5, proof of Lemma 21, p. 36 of the author copy: `C_F(h)` is cyclic, generated by the maximal root of `h`, for `h ≠ 1`.

*Needs:* §1.5 (Commuting elements of a free group are powers of a common element); §1.4 (Maximal roots and their uniqueness); Mathlib `Subgroup.centralizer`; Mathlib `Subgroup.zpowers`.

### 1.7 CSA groups and commutation transitivity

Define `Group.IsCSA` as follows. Malnormality is Tau Ceti's `TauCeti.IsTISubgroup` (a subgroup `M` with `g M g⁻¹ ∩ M = 1` for every `g ∈ G ∖ M`; see the supplier contracts) and is not defined again here. `G` is a CSA group when every maximal abelian subgroup `M` of `G` (abelian in the sense of Mathlib's `IsMulCommutative M`, and maximal among abelian subgroups) satisfies `TauCeti.IsTISubgroup M`. `G` is commutative transitive when for all `x`, `y`, `z ∈ G` with `y ≠ 1`, `[x, y] = 1` and `[y, z] = 1` imply `[x, z] = 1`. A CSA group is commutative transitive, and in a CSA group the centralizer of every nontrivial element is abelian (it is the unique maximal abelian subgroup containing the element).

Predicates on groups, with maximality of abelian subgroups quantified over subgroups.
CSA implies commutative transitive: if `y ≠ 1` commutes with `x` and `z`, let `M` be a maximal abelian subgroup containing `y`; for `x ∉ M` some element of `x M x⁻¹ ∩ M` would be the nontrivial `y = x y x⁻¹`, contradicting malnormality, so `x ∈ M`, likewise `z ∈ M`, and `M` is abelian (ALG §2.1, p. 15).

The public interface should expose the following named results:

- `Group.IsCSA`: Every maximal abelian subgroup `M` satisfies `TauCeti.IsTISubgroup M`.
- `Group.IsCommTransitive`: Commutation is transitive on nontrivial elements.
- `Group.IsCSA.isCommTransitive`: CSA groups are commutative transitive.
- `Group.IsCSA.centralizer_isMaximalAbelian`: In a CSA group, for `g ≠ 1` the centralizer of `g` is abelian and is the unique maximal abelian subgroup containing `g`.
- `Group.IsCSA.of_injective`: Subgroups of CSA groups are CSA (a maximal abelian subgroup of a subgroup is its intersection with a maximal abelian subgroup of the group, by the previous item).
- `Group.IsCSA.of_commGroup`: Abelian groups are CSA.

**Checks.**

- `Group.isCSA_freeGroup`: `FreeGroup α` is CSA (§1.8).
- `Group.isCSA_of_commGroup`: Multiplicative `ℤ` is CSA, so CSA does not imply nonabelian; the trivial group is CSA.
- `Group.not_isCSA_prod_int`: `FreeGroup (Fin 2) ×` Multiplicative `ℤ` is not commutative transitive, hence not CSA, although the centralizers of the generators `(a, 0)`, `(b, 0)`, `(a, 1)` are abelian: a definition testing only the elements of some generating set would accept it.
- `Group.not_isCSA_amalgam_sq`: `F(a,b) ∗_{⟨a²⟩} (⟨a²⟩ × ⟨t⟩)` is not CSA: `a` commutes with `a²`, `a²` commutes with `t`, but `a` and `t` do not commute (the test `LimitGroup.centralizerExt_proper_power` of Layer 8).
- `Group.IsCSA.center_eq_bot`: A nonabelian CSA group has trivial centre (Mathlib's Subgroup.center `G = ⊥`): a nontrivial central element would make every two elements commute by commutation transitivity.

Every abelian group is CSA (its only maximal abelian subgroup is the whole group, and there is no `g` outside it). `F(a,b) × ℤ` is not commutative transitive: `(a, 0)` and `(b, 0)` both commute with `(1, 1)` but not with each other.

This interface is used by §1.8: free groups are CSA; §5.5 (CSA groups with nonabelian coefficients are domains; free groups are domains): CSA `G`-groups with nonabelian `G` are `G`-domains; §7.9 (Positive formulas as single equations (Malcev's equation)): Mal'tsev's equation has only the trivial solution in torsion-free CSA groups satisfying Vaught's condition; Layer 8 limit groups and extensions of centralizers: fully residually free groups are CSA; extensions of centralizers of CSA groups.

Use [ALG] §1, p. 4, and §2.1, pp. 15–16: Malnormal subgroups and CSA groups (every maximal abelian subgroup malnormal); in a CSA group centralizers of nontrivial elements are abelian and commutation is transitive on nontrivial elements; Proposition 1 uses the notion for `G`-domains.; [IFT] §2.6, p. 7: Freely discriminated groups are torsion-free CSA groups.

*Needs:* Mathlib `Subgroup.centralizer`; Mathlib `IsMulCommutative`; Tau Ceti `TauCeti.IsTISubgroup`.

### 1.8 Maximal cyclic subgroups are malnormal; free groups are CSA

Prove the following statement. Let `u ∈ FreeGroup α` be nontrivial and not a proper power, and `M =` zpowers `u`. Then `M` is a maximal abelian subgroup and is malnormal (`TauCeti.IsTISubgroup M`; in the lattice form, `g M g⁻¹ ⊓ M = ⊥` for `g ∉ M`). Consequently `FreeGroup α` is a CSA group (§1.7) (every maximal abelian subgroup is malnormal), and commutation is transitive on nontrivial elements.

Maximal abelian subgroups of `F` are trivial or the centralizers of nontrivial elements (§1.6), i.`e`. zpowers of non-proper-powers.
If `g u^m g⁻¹ = u^n` with `m`, `n ≠ 0`, then `|m| = |n|` by comparing cyclically reduced lengths; `n = −m` is impossible because a nontrivial element of a free group is not conjugate to its inverse (if `h x h⁻¹ = x⁻¹` then `h²` commutes with `x`, so `h` and `x` are powers of one element by §1.5, and then `x = x⁻¹`, `x = 1`). Hence `m = n`, `g` commutes with `u^m`, and `g ∈` centralizer `(u^m) =` zpowers `u`.

For `u = a`, `g = b: b⟨a⟩b⁻¹ ∩ ⟨a⟩ = 1`. For `u = a²`, a proper power, the conclusion fails: `g = a` lies outside `⟨a²⟩` but `a ⟨a²⟩ a⁻¹ ∩ ⟨a²⟩ = ⟨a²⟩`, so the hypothesis that `u` is not a proper power is needed.

Use [ALG] §1, p. 4 and §2.1, Proposition 1, p. 16 of the author copy: Definition of CSA groups (maximal abelian subgroups malnormal); a CSA group containing a non-abelian coefficient group is a domain.; [SUBGROUPS] §4, malnormality, p. 16 of the author copy: Malnormal subgroups and the malnormality problem.

*Needs:* §1.6 (Centralizers of nontrivial elements are the cyclic groups of their maximal roots); §1.1 (Conjugacy criterion: cyclic reductions agree up to cyclic permutation); §1.2 (Proper powers); §1.5 (Commuting elements of a free group are powers of a common element); §1.7 (CSA groups and commutation transitivity); Tau Ceti `TauCeti.IsTISubgroup`; Tau Ceti `TauCeti.isTISubgroup_iff_inf_conj_smul_eq_bot`.

### Examples

For `w = b⁻¹a⁶b` in `F(a,b)`, cyclic reduction gives `a⁶`. Its shortest repeating block is `a`; transporting that block by `b` gives the maximal root `b⁻¹ab` and exponent 6. The centralizer is `⟨b⁻¹ab⟩`. The identity has no non-proper-power maximal root, and its centralizer is the whole free group. The word `a b b⁻¹a⁻¹` reduces to `[]`, while `a b a⁻¹b⁻¹` is nontrivial for `a≠b`, by the library normal form.

### Dependencies

This layer consumes none. Library suppliers are the declarations specified above; no other roadmap is required.

## Layer 2: Stallings graphs and finitely generated free subgroups

Stallings' method represents a finitely generated subgroup of a free group by a finite folded labelled graph. The graphs are Serre graphs with edge reversal (shared with Layer 4). Finite folded quotients preserve the accepted subgroup; the resulting correspondence between subgroups and based folded core graphs gives explicit free bases (a constructive Nielsen–Schreier theorem), membership, intersections, the index and the exact Schreier formula, and conjugacy of subgroups. Based equality and conjugacy are distinguished throughout.

### 2.1 Serre graphs: graphs with edge reversal, loops and multiple edges

Define `SerreGraph` as follows. A Serre graph consists of a vertex type `V`, an edge type `E`, an origin map `src : E → V` and a reversal `rev : E → E` with `rev (rev e) = e` and `rev e ≠ e` for every edge; the terminus is `tgt e := src (rev e)`. Loops `(src e = tgt e)` and multiple edges are allowed. An orientation is a subset `E⁺ ⊆ E` containing exactly one edge of each pair `{e, rev e}`. A path from `u` to `w` is a list of edges `e₁ … e_k` with `src e₁ = u`, `tgt e_i = src e_{i+1}` and `tgt e_k = w` (the empty path at `u` has `u = w`); a path is reduced when no `e_{i+1} = rev e_i`. Write `SerreGraph.Preconnected` for pairwise path reachability and `SerreGraph.Connected` for Nonempty `V` together with preconnectivity. Connectedness always includes nonemptiness, as in the shared Graph convention. A tree is nonempty, preconnected and has no reduced closed path of positive length.

Structure with the four fields and two axioms; paths as lists with a chain condition; reduced paths by a second chain condition.

The public interface should expose the following named results:

- `SerreGraph`: Fields `V`, `E`, `src`, `rev` with `rev_rev` and `rev_ne`; `tgt e = src (rev e)`.
- `SerreGraph.Path`: Paths as lists of composable edges between two vertices, with nil, cons, append and reverse (reverse reverses the list and applies `rev`).
- `SerreGraph.Path.IsReduced`: No backtracking: no edge immediately followed by its reverse.
- `SerreGraph.Path.reduce`: Every path is homotopic (by removing backtracks) to a unique reduced path with the same ends.
- `SerreGraph.Preconnected`, `SerreGraph.Connected`: The path-based predicates above are adapters to shared reachability and nonempty connectedness, respectively.
- `SerreGraph.IsTree`: Connected, nonempty, and every reduced closed path is empty.
- `SerreGraph.IsTree.unique_reduced_path`: In a tree, between two vertices there is exactly one reduced path.
- `SerreGraph.toQuiver`: A Serre graph gives a Quiver on `V` (hom-type from `u` to `w` the edges with those ends) with Mathlib's `HasInvolutiveReverse` structure given by `rev`.
- `SerreGraph.Hom`: Morphisms: maps on vertices and edges commuting with `src` and `rev`; composition and identity.
- `SerreGraph.ofSimpleGraph`: A Mathlib `SimpleGraph G` gives a Serre graph with `E = G.Dart`, `src =` Dart.fst and `rev =` Dart.symm (`rev_rev` from `Dart.symm_symm`, `rev_ne` from `Dart.symm_ne`); it is a tree in the sense here iff it is a nonempty Mathlib tree `(SimpleGraph.IsTree)`.
- `SerreGraph.connected_ofSimpleGraph`: The dart adapter is connected iff `G` is Mathlib-connected, including when its vertex type is empty.
- `SerreGraph.toGraph`: The underlying Mathlib `Graph` on `V` with all vertices and with edge identities the reversal orbits `E/{e ∼ rev e}`; incidence is the unordered pair of ends. Parallel edge pairs remain distinct.
- `SerreGraph.ofGraph`: For a Mathlib `Graph`, use its actual vertex and edge subtypes and choose an ordering of the two ends of each edge; attach two darts (`e`, true), (`e`, false), reversing the sign. A loop also has two distinct darts. Different endpoint orderings give isomorphic Serre graphs, and forgetting reversal recovers the original `Graph` up to these subtype identifications.
- `SerreGraph.reachable_toGraph`: Serre path reachability agrees with underlying-graph walk reachability. `SerreGraph.connected_toGraph` gives `Γ`.`toGraph.Connected ↔` Nonempty `V ∧ Γ`.Preconnected, equivalently `Γ`.`toGraph.Connected ↔ Γ`.Connected. This identifies connected components and connectedness. The map on paths forgets loop direction and is surjective, but need not injective. Group-valued path operations use Serre paths, where a loop and its inverse remain distinct.

**Checks.**

- `SerreGraph.rose_one_not_tree`: The rose with one petal (one vertex, edges `e` and `rev e`, a loop) is connected but not a tree: the path `[e]` is a reduced closed path. A definition of graphs that drops loops (for instance through Mathlib's `SimpleGraph`) would call it a tree.
- `SerreGraph.segment_isTree`: The segment (vertices 0, 1; edges `e: 0→1` and `rev e`) is a tree and the unique reduced path from 0 to 1 is `[e]`.
- `SerreGraph.single_vertex_isTree`: One vertex and no edges is connected and a tree, in both representations.
- With `V=E=`Empty, preconnectivity holds vacuously, but connectedness and the tree predicate are false; the underlying Graph is also not connected and has no components.
- `SerreGraph.double_edge_not_tree`: Two vertices joined by two edge pairs `e`, `f` is not a tree (`[e, rev f]` is a reduced closed path): multiple edges are allowed and detected.
- `SerreGraph.toQuiver_reverse`: Under `toQuiver`, Mathlib's Quiver.reverse of the arrow `e` is `rev e`.
- A one-loop rose has one underlying loop and two Serre darts; the paths `[e]` and `[rev e]` have the same forgotten walk but represent opposite generators in §2.2.
- The graph of two isolated vertices is neither preconnected nor connected, and has two components in both representations; a connectedness hypothesis cannot be inferred from the presence of a basepoint.

The one-vertex graph with one pair of loop edges `{e, ē}` (the rose with one petal) is connected and not a tree. The segment with two vertices and one edge pair is a tree.

This interface is used by Layer 2 labelled graphs and Stallings foldings: the underlying graph of an `X`-digraph with inverse edges; Layer 4 graphs of groups and Bass–Serre trees: the underlying graph of a graph of groups and the tree on which the fundamental group acts; Layer 9 `Λ`-trees: the simplicial case `Λ = ℤ` of `Λ`-trees is a Serre tree.

Use [TREES] Chapter I, §2.1, Definition 1 (graphs with edge reversal), §2.2 (trees): Serre's graphs: vertices, edges, origin and terminus, and a fixed-point-free involution on edges; trees are connected nonempty graphs without circuits.; [FOLD] §2, Convention 2.1, p. 5: The graph underlying a graph of groups: vertices, edges with a fixed-point-free involution `e ↦ e⁻¹` and origin and terminus maps with `o(e) = t(e⁻¹)`, loops and multiple edges allowed.; [KM02] §2, Definition 2.1 and Convention 2.2, p. 2: `X`-digraphs with the formal inverse edges added give the same combinatorics of paths and reduced paths.

*Needs:* Mathlib `Quiver`; Mathlib `SimpleGraph`; Mathlib `SimpleGraph.Dart`; Mathlib `Graph` (Mathlib/Combinatorics/Graph/Basic.lean); §2.1a (shared multigraph connectivity and Serre comparison), for the underlying-graph comparison.

### 2.1a Shared multigraph connectivity and the Serre adapter

Consume `GraphConnectivityAndFlows` Target 1.1's `Graph.Walk`, native reachability, `Graph.Connected` and component subgraphs `Graph.IsConnectedComponentOf`. Its walks are indexed by ambient vertices and allow an empty walk even outside the vertex set; reachability requires actual endpoints. Components are the minimal nonempty closed subgraphs, identified there with `toSimpleGraph.ConnectedComponent`. The Serre predicates of §2.1 adapt paths to this API; there is no second generic multigraph connectivity or component theory.

Prove `SerreGraph.reachable_toGraph`, then `SerreGraph.connected_toGraph` with the explicit Nonempty `V` conjunct, and the component equivalence on the actual vertex subtypes. The path map retains the sequence of edge identities but forgets the direction of a loop. It is surjective on walks with actual endpoints: choose a dart above each traversal. It is not asserted to be injective or to induce an edge-path-group map by identifying the two loop directions. Group comparisons in §2.2 retain signed oriented edges.

**Checks.**

- In the one-loop bouquet the graph is connected with one component; its one-edge native walk has two Serre lifts. The loops `[e]` and `[rev e]` give opposite, distinct generators of the infinite cyclic reduced path group.
- The two-vertex graph with two parallel edges is connected with one component in both representations; its two length-one walks remain distinct, and `[e,rev f]` gives a nontrivial reduced loop.
- Two isolated actual vertices give two components; the empty graph has none and is not connected. An empty walk at an ambient point outside the vertex set supplies no reachability witness.
- A single isolated actual vertex is preconnected and connected, with one component. On the empty vertex type only preconnectivity holds, so the connectedness comparison needs its nonempty conjunct.

Sources: `GraphConnectivityAndFlows` Target 1.1 (native walks, reachability and component comparisons); [LEAN] Mathlib/Combinatorics/Graph/Basic.lean (incidence); [TREES] Chapter I, §§2.1–2.2; [FOLD] §2, Convention 2.1, p. 5.

*Needs:* `GraphConnectivityAndFlows` Target 1.1 (walks, native connectivity and components only); §2.1 (Serre graphs and incidence adapters).

### 2.2 Maximal trees exist and the fundamental group of a graph is free

Prove the following statement. Let `Γ` be a connected Serre graph and `v a` vertex. (1) `Γ` has a maximal subtree `T` containing every vertex; for finite `Γ`, `T` has exactly #`V−1` positive edges. (2) The set `π₁(Γ, v)` of reduced closed paths at `v`, with concatenation followed by reduction, is a group, free with basis indexed by the positive edges of `Γ` outside `T`: the basis element for `e` is the reduced loop (path in `T` from `v` to `src e`) `· e ·` (path in `T` from `tgt e` to `v`). (3) For finite `Γ`, as integers, rank `π₁(Γ, v) =` #`E⁺ −` #`V + 1`; as natural numbers the expression is (#`E⁺ + 1`) `−` #`V`.

Throughout this subsection assume: `Γ` connected (for (2), (3)); for (3), `Γ` finite.

(1) Zorn's lemma on subtrees for general `Γ` (Serre I.2.3, Proposition 11); for finite `Γ a` spanning tree.
(2) Every reduced closed path factors uniquely as a reduced product of the `T`-loops of the edges it crosses outside `T`.
(3) A finite tree has #`E⁺ =` #`V − 1` (KM02 Lemma 8.2 counts #`E⁺(Γ − T)`).

**Target.** Build the reduced-path group and its spanning-tree presentation here, for arbitrary connected based Serre graphs. `SerreGraph.SpanningTree` consists of a reversal-closed dart subset retaining every vertex whose restricted graph is a tree (`SerreGraph.restrict`); `SerreGraph.exists_spanningTree` gives its existence. `SerreGraph.IsOrientation` chooses one dart of each reversal pair. The representative `SerreGraph.graphRelators` imposes `e·rev(e)=1` for every dart and `e=1` for tree darts; `SerreGraph.GraphPresentation` is the resulting `PresentedGroup`. Prove `SerreGraph.graphPresentation_reducedLoop_bijective`: sending a reduced closed path to its dart word gives a bijection onto this presentation. Transport of concatenation and reversal identifies it with the reduced-path group. Prove `SerreGraph.graphPresentation_free`, with free generators the positive non-tree darts, and `SerreGraph.graphPresentation_rank` for finite graphs, together with finite generation (`SerreGraph.graphPresentation_fg`). The representative rank signature carries the resulting `Group.FG` instance explicitly.

Prove compatibility with based connected subgraph inclusions and with a change of spanning tree. A non-tree dart `e` represents the tree path to `src(e)`, then `e`, then the tree path back. Each finite reduced path lies in a finite connected based subgraph; adjoining its finitely many tree paths gives a finite subgraph with the restricted tree basis. Thus the arbitrary-graph statement agrees with the finite presentations. Native unsigned walks are used only for connectivity (§2.1a); a loop and its reverse remain distinct group elements. `SerreGraph.rose` and `SerreGraph.roseTree` specify the petal and empty-tree examples below; `SerreGraph.parallelGraph` and `SerreGraph.parallelTree` specify the segment, double-edge and theta examples.

**Checks.**

- The one-loop rose has group `ℤ`, with `[e]` and `[rev e]` mapping to `+1` and `−1`; identifying their forgotten native walks cannot define this group comparison.
- For two vertices joined by two parallel edges the non-tree edge gives one generator; the theta graph gives rank 2 in the path and tree presentations.
- The segment gives the trivial group in both presentations; inclusions into an infinite rose preserve every finite set of petal generators.

Use [HATCHER] §1.A, Proposition 1A.2, pp. 84–85 (the non-tree loop basis); [TREES] Chapter I, §2.3, Proposition 11, and §3.1 (graphs with free fundamental group): Connected graphs contain maximal trees containing all vertices; a group acting freely on a tree is free with basis given by the edges outside a maximal tree of the quotient.; [KM02] §6, Lemma 6.1, p. 12, and §8, Lemma 8.2, p. 20: A spanning tree of a folded core graph gives a free basis of its subgroup, and #`E⁺(Γ − T) =` #`E⁺Γ −` #`VΓ + 1`.

*Needs:* §2.1 (Serre graphs); §2.1a (shared connectivity comparison); Mathlib `FreeGroup`, `PresentedGroup` and `Subgroup.normalClosure`.

### 2.2a Finite cycle spaces and independent cycles

**Target.** Build integral and binary cycle theory for every finite multigraph, with loops and parallel edges allowed and without connectedness or nonemptiness assumptions. Use a finite Serre graph `Γ` and an orientation `O ⊆ E`; the actual edge type is the subtype `O`, with endpoints `Γ.src` and `Γ.tgt` restricted to it. More generally the constructions and forest theorems apply to any dart subset `O`, regarded as a multigraph with those actual edges. Define `SerreGraph.integralCycleBoundary : (O →₀ ℤ) →ₗ[ℤ] (V →₀ ℤ)` by `e ↦ δ_tgt(e) − δ_src(e)` and `SerreGraph.cycleLattice` as its kernel. Define `SerreGraph.modTwoCycleSpace` by the same incidence kernel over `ZMod 2`. Supply membership, extensionality, coordinate restriction and invariance under graph isomorphisms; reversing an edge negates its integral coordinate and leaves its binary coordinate unchanged.

Define `SerreGraph.supportGraph O` by `SimpleGraph.fromRel (fun v w => ∃ e : O, Γ.src e = v ∧ Γ.tgt e = w)`, retaining every vertex. This simple graph is used only for connectivity and forests; chain modules retain loops and separate parallel edges. By §2.1a and `GraphConnectivityAndFlows` Target 1.1's simplification bridge, `Nat.card (Γ.supportGraph O).ConnectedComponent` is the supplied `Graph.componentCount` of the endpoint multigraph. For an orientation it also counts the components of `Γ`.

Define `SerreGraph.IsSpanningForest O F` for `F ⊆ E`: require `F ⊆ O`, no loop in `F`, no two distinct darts of `F` with the same unordered endpoint pair, acyclicity of `supportGraph F`, and equality of its reachability relation with that of `supportGraph O`. Prove `SerreGraph.exists_spanningForest` and `SerreGraph.spanningForest_card`, namely `#F + #components = #V`. Use Mathlib's simple spanning-forest existence and tree edge count, choosing one actual edge above each forest edge. In `SerreGraph.exists_forest_cycleBasis`, provide integral and binary bases indexed by the chords `O ∖ F`. The integral basis vector traverses its chord forward and the unique forest path back; its chord coordinates are the corresponding unit vector. Its coefficient reductions form the binary basis, also with unit chord coordinates. Every cycle has a unique expansion with its own chord coefficients.

Prove `SerreGraph.cycleLattice_modTwoEquiv`: there exists a `ZMod 2`-linear equivalence `(ZMod 2) ⊗[ℤ] cycleLattice ≃ modTwoCycleSpace` sending `1 ⊗ c` to edgewise reduction of `c`. The forest bases prove bijectivity. Prove `SerreGraph.finrank_cycleLattice` and `SerreGraph.modTwoCycleSpace_finrank`, for the integral rank and binary dimension respectively, in the additive form `rank + #V = #O + #components`. Equivalently each is `#O + #components − #V` in `ℕ`, with addition before truncated subtraction. Neither formula assumes connectedness; the bases also prove that the integral kernel is finite free.

Retain `SerreGraph.cycleBoundary` and `SerreGraph.cycleSpace` as finite-function coordinates for binary incidence and its kernel. Prove `SerreGraph.cycleBoundary_finsupp`: finite-function/Finsupp equivalences commute with boundary, since subtraction equals addition over `ZMod 2`. Restrict this square to the coordinate-preserving equivalence `SerreGraph.exists_cycleSpace_finsuppEquiv` with `modTwoCycleSpace`. These comparisons require neither an orientation nor connectedness. For a spanning tree `T` and orientation `O`, the forest basis gives `SerreGraph.cycleSpace_basis`, indexed by the positive non-tree darts with unit non-tree coordinates. Deduce `SerreGraph.cycleSpace_finrank`, dimension `#O + 1 − #V`, for this connected nonempty specialization.

Prove `SerreGraph.graphPresentation_abelianization`: the abelianization of §2.2's group is free abelian on its positive non-tree darts. Identify these generators with the integral forest cycles and their reductions with the binary tree-loop basis. Require compatibility with based connected subgraph inclusions and changes of spanning tree. The integral basis and §2.2's free group basis supply periodic structures in §7.6 and finite graph presentations in Layer 10. No embedding or planarity criterion is required.

**Checks.**

- A one-loop rose has integral rank and binary dimension 1; its loop column is zero, rather than the characteristic vector of its single endpoint. The integral unit cycle reduces to the binary unit cycle. A spanning forest cannot contain the loop.
- Two vertices with two parallel edges have rank 1. If the first edge is the forest, the chord cycle is `e₁ − e₀`, reducing to `(1, 1)`; taking both parallel edges is forbidden even though their simple support is acyclic. The theta graph has rank 2, with its three simple cycles dependent over either coefficient ring (using signed integral cycles).
- A segment has zero cycle modules and one component: `0 + 2 = 1 + 1`. Two isolated vertices also have zero cycle modules but no spanning tree; their empty forest gives `0 + 2 = 0 + 2`. The empty graph has zero kernels, empty forest and zero components, giving `0 = 0`. Coefficient reduction is an isomorphism in all these cases.

Sources: [TREES] Chapter I, §§2–3 (trees and graph groups); [HATCHER] §1.A, Propositions 1A.1–1A.2, pp. 83–85 (tree loops), §2.2, pp. 140–141 and 153–154 (incidence and coefficients), and Chapter 3, p. 187 (componentwise graph cycles); [DIESTEL] §1.9, Proposition 1.9.2, Theorem 1.9.6 and Proposition 1.9.7 (binary cycles, fundamental bases and incidence kernels for simple graphs). Applying the tree-path argument componentwise, retaining actual edges and zero loop columns, gives the multigraph statements here.

*Needs:* §§2.1–2.1a (Serre graphs and shared connectivity); `GraphConnectivityAndFlows` Target 1.1 (`Graph.componentCount` and the simplification bridge); §2.2 for the graph-group comparison only; Mathlib `Finsupp.linearCombination`, `Finsupp.linearEquivFunOnFinite`, `ZMod`, `LinearMap.ker`, `TensorProduct`, `Module.Basis`, `Module.finrank`, `SimpleGraph.exists_isAcyclic_reachable_eq_le` and `SimpleGraph.IsTree.card_edgeFinset`.

NeronModelsAndSemistableAbelianVarieties §4.2 (dual graphs of semistable curves) is a downstream consumer of this finite multigraph cycle core.

### 2.3 `α`-labelled graphs (`X`-digraphs) and the subgroup they accept

Define `StallingsGraph` as follows. For a type `α`, an `α`-labelled graph is a Serre graph `Γ` with a labelling `μ : E → α × Bool` such that `μ (rev e) =` (a, !`b`) when `μ e = (a, b)`. The label of a path is the word of its edge labels, an element of List `(α × Bool)`. For a vertex `v`, the subgroup accepted at `v` is subgroup `Γ v :=` {mk (label `p`) | `p a` closed path at `v`} `≤ FreeGroup α`; it equals the set of freely reduced labels of reduced closed paths when `Γ` is folded. A morphism of labelled graphs is a Serre-graph morphism preserving labels; a based graph `(Γ, v)` is a labelled graph with a base vertex. A labelled graph is folded when no vertex is the origin of two distinct edges with the same label, and it is a core graph at `v` when every vertex and edge lies on a reduced closed path at `v`.

Structure extending `SerreGraph` with the labelling and its equivariance axiom; subgroup `Γ v` is the image of the label map on closed paths, which is closed under products (concatenation) and inverses (reversal).

The public interface should expose the following named results:

- `StallingsGraph`: An `α`-labelled Serre graph with a base vertex; Fintype `V` and `E` for the finite case.
- `StallingsGraph.subgroup`: subgroup `Γ v` : Subgroup `(FreeGroup α)`, the elements read by closed paths at `v`.
- `StallingsGraph.IsFolded`: At each vertex, at most one edge with each label in `α × Bool`.
- `StallingsGraph.IsCore`: Every edge lies on a reduced closed path at the base vertex.
- `StallingsGraph.Hom.subgroup_le`: A based morphism `(Γ, v) → (Δ, w)` gives subgroup `Γ v ≤` subgroup `Δ w` (KM02 Lemma 4.1).
- `StallingsGraph.subgroup_conj`: If `p` is a path from `v` to `w` with label `g` then `subgroup Γ w = (mk g)⁻¹ · subgroup Γ v · mk g`.
- `StallingsGraph.mem_subgroup_iff_folded`: For folded `Γ`, a reduced word is in subgroup `Γ v` iff it is the label of a (necessarily reduced) closed path at `v`.

**Checks.**

- `StallingsGraph.rose_subgroup_top`: For the rose `R_α` (one vertex, one petal per letter), subgroup `R_α = ⊤`.
- `StallingsGraph.edge_subgroup_bot`: A tree (for instance one edge labelled a) accepts `⊥` at every vertex.
- `StallingsGraph.unfolded_reads_nonreduced`: In the unfolded graph with two loops labelled a at `v`, the closed path `a · ā` (first loop, then the reverse of the second) has label `a a⁻¹` although it is a reduced path; so for unfolded graphs reduced paths need not have reduced labels, and the characterisation by reduced paths needs `IsFolded`.
- `StallingsGraph.subgroup_basepoint`: In the cycle of length 2 labelled a, `b`, the subgroups at the two vertices are `⟨a b⟩` and `⟨b a⟩`: conjugate and distinct, so based equality differs from conjugacy.

The rose with petals labelled a, `b` accepts `F(a,b)` at its vertex. A single edge labelled a from `v` to `w ≠ v` accepts the trivial subgroup at `v`.

This interface is used by the subgroup characterizations of KM02 §§3–9; Layer 9 `(ℤ[t],X)`-graphs: the infinite-word generalisation keeps the same accepted-subgroup semantics; Layer 10 subgroup structure: subgroups of limit groups represented by labelled graphs.

Use [KM02] §2, Definitions 2.1, 2.3 and 2.7, pp. 2–4; §3, Proposition 3.1 and Lemma 3.2, p. 6; Definition 3.5 and Lemma 3.7, p. 7: `X`-digraphs, folded graphs, the language `L(Γ, v)` of reduced closed paths, the fact that the freely reduced labels of closed paths form a subgroup, and core graphs.; [FOLD] §3, A-graphs, pp. 8–10: The same notions for graphs labelled by a graph of groups; the free-group case is `X`-digraphs.

*Needs:* §2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges); Mathlib `FreeGroup`; Mathlib `FreeGroup.IsReduced`.

### 2.4 Stallings folds as graph quotients

Define `StallingsGraph.foldAt` for two distinct edges `f₁`,`f₂` with the same origin and label as the quotient identifying their termini and their inverse edge pairs. Include loops and multiple edges. The quotient has a surjective based label-preserving morphism from `Γ`. For a finite graph, prove existence of a finite folded quotient with a surjective based label-preserving quotient morphism, preserving connectedness and the accepted subgroup.

The API consists of `StallingsGraph.foldAt`, `StallingsGraph.foldHom` (the quotient morphism), and `StallingsGraph.exists_folded_quotient` (a finite folded quotient with its quotient morphism and accepted-subgroup equality). On an already folded graph the identity morphism supplies the quotient.

**Checks.**

- The flower with petals `a b` and `a c`, for three distinct letters, has a folded quotient with two vertices and three edge pairs: one a-edge `v→w` and `b`,`c`-edges `w→v`.
- The rose `R_α` is folded and its identity quotient suffices.
- Two petals both labelled a identify to a single a-petal.
- Folding a loop labelled a at `v` with an a-edge `v→w` identifies `w` with `v`; identifying only edges fails the graph-morphism condition.

Sources: [KM02] §2, Definition 2.4 and Lemma 2.5, pp. 3–4.

*Needs:* §2.3 (`α`-labelled graphs (`X`-digraphs) and the subgroup they accept).

### 2.5 Folding preserves the accepted subgroup; cores do not change it

Prove the following statement. For a finite `α`-labelled graph `Γ` with base vertex `v`: (1) subgroup `(foldAt Γ f₁ f₂) v`' `=` subgroup `Γ v` where `v`' is the image of `v`; hence every graph reached by a finite sequence of folds accepts the same subgroup at the image of `v`. (2) The core Core(`Γ`, `v`), the union of the reduced closed paths at `v`, is connected, contains `v`, has no vertex of degree one except possibly `v`, and subgroup (Core `Γ v`) `v =` subgroup `Γ v`.

(1) The image of a closed path is a closed path with the same label (KM02 Lemma 2.`5(2)`); conversely a closed path in the folded graph lifts to a path whose label differs by inserting backtracks `a a⁻¹` at the folded edge, so the elements agree (KM02 Lemma 3.4).
(2) KM02 Lemma 3.7: closed reduced paths at `v` stay in the core.

For the flower with petals `a b` and `a c`, the folded graph still accepts `⟨a b, a c⟩` at `v`. Deleting a hanging edge not on any closed path at `v` does not change the subgroup.

Use [KM02] §3, Lemma 3.4, p. 7, and Lemma 3.7, p. 7: A single folding does not change the language of the graph at the base vertex; the core has the same language.; [FOLD] §4, Proposition 4.15, pp. 17–18: Folding moves on A-graphs preserve the subgroup `L(B, u₀)` of `π₁(A, v₀)` that the graph defines.

*Needs:* §2.4 (Stallings folds as graph quotients); §2.3 (`α`-labelled graphs (`X`-digraphs) and the subgroup they accept).

### 2.6 The Stallings graph of a finitely generated subgroup

Define `FreeGroup.stallingsGraph` as follows. For a finite list ws of words over `α`, `stallingsGraph` ws is a finite connected folded based core graph accepting the subgroup generated by ws, unique up to based labelled isomorphism (§2.7). A finite sequence of fold quotients of the flower of ws, followed by its based core, proves existence. The flower has one vertex `v` and one petal reading each reduced nonempty generating word. The target specifies this representative and its universal characterization.

Throughout this subsection assume: `α` has decidable equality; ws a finite list of words (its elements denote their freely reduced group elements).

The core of a folded quotient of the flower has the required properties by §2.5. The based core retains the initial path from the base vertex, even if that vertex has degree one.

The public interface should expose the following named results:

- `FreeGroup.stallingsGraph`: A finite based folded core graph for the generated subgroup, up to based isomorphism.
- `FreeGroup.subgroup_stallingsGraph`: subgroup (`stallingsGraph` ws) `v =` Subgroup.closure {mk `w` | `w ∈` ws}.
- `FreeGroup.stallingsGraph_isFolded`: `stallingsGraph` ws is folded, connected and a core graph at `v`.
- `FreeGroup.stallingsGraph_perm`: Permuting, inverting or Nielsen-transforming the generating list yields an isomorphic based graph (§2.7).
- `FreeGroup.stallingsGraph_nil`: `stallingsGraph []` is the one-vertex graph with no edges.

**Checks.**

- `FreeGroup.stallingsGraph_ab_ac`: `stallingsGraph [a b, a c]` has two vertices and three edge pairs, and accepts `⟨a b, a c⟩`.
- `FreeGroup.stallingsGraph_nil_bot`: `stallingsGraph []` accepts `⊥`.
- `FreeGroup.stallingsGraph_a_a2`: `stallingsGraph [a², a³]` is the rose with one petal labelled `a: ⟨a², a³⟩ = ⟨a⟩`.
- `FreeGroup.stallingsGraph_conj_basepoint`: `stallingsGraph [b a b⁻¹]` is a cycle labelled `a` with a hanging `b`-edge at the base vertex: the core is taken at the base vertex, so a definition removing every degree-one vertex would change the accepted subgroup to `⟨a⟩`.

`stallingsGraph [a b, a c]` has 2 vertices and 3 edge pairs. `stallingsGraph []` is the single vertex with no edges.

This interface is used by Layer 2 membership, intersection, index and conjugacy criteria: `stallingsGraph` represents the generated subgroup; Layer 2 Nielsen bases: spanning trees of the Stallings graph give free bases; Layer 6 finite covers of surfaces with boundary: finite-index subgroups of free groups are described by complete Stallings graphs.

Use [KM02] §3, Proposition 3.8, p. 8, and §7, Proposition 7.1, p. 16: For a finitely generated subgroup given by finitely many freely reduced words, the folded core graph of the flower is accepts exactly that subgroup.

*Needs:* §2.4 (Stallings folds as graph quotients); §2.5 (Folding preserves the accepted subgroup; cores do not change it); Mathlib reduced-word operations.

### 2.7 Stallings correspondence: subgroups and based folded core graphs

Prove the following statement. Let `α` be finite. (1) For every subgroup `H ≤ FreeGroup α` there is a connected folded based graph `(Γ(H), 1_H)`, a core graph at `1_H`, with subgroup `Γ(H) 1_H = H`; it is unique up to a unique based isomorphism. (2) `Γ(H)` is finite if and only if `H` is finitely generated, and then `Γ(H) ≅ stallingsGraph` ws for any finite generating list ws. (3) For subgroups `K`, `H: K ≤ H` if and only if there is a based morphism `Γ(K) → Γ(H)`, which is then unique. (4) Forgetting base points: the type graph (unbased core) of `Γ(H)` is obtained by deleting, when the base vertex has degree one, the hanging path that runs from it to the first vertex of degree at least three; a graph in which every vertex has degree at least two is left unchanged, and for `H = 1` the one-vertex graph is kept. The type graph determines `H` up to conjugacy: `H` and `K` are conjugate if and only if their type graphs are isomorphic as labelled graphs.

Throughout this subsection assume: `α` finite (the basis of `F` is finite); `H` any subgroup for (1), finitely generated for the finiteness clause of (2).

(1) Existence from the `coset` graph `H`\`F` with its core (KM02 Theorem 5.1); uniqueness from uniqueness of morphisms between folded graphs (Lemma 4.2) and the existence of morphisms for containments (Proposition 4.3) (KM02 Theorem 5.2).
(2) KM02 Lemma 5.4 with Proposition 3.8.
(3) KM02 Lemma 4.1 and Proposition 4.3.
(4) KM02 §7, Proposition 7.7 (subgroups are conjugate iff their unbased cores are isomorphic as labelled graphs).

`Γ(⟨a b⟩)` and `Γ(⟨b a⟩)` are distinct based graphs with isomorphic unbased cores. `Γ(F(a,b))` is the rose with two petals; `Γ(⟨a, b a b⁻¹⟩)` is not complete.

Use [KM02] §4, Lemmas 4.1–4.2 and Proposition 4.3, pp. 9–10; §5, Theorems 5.1–5.2, Definition 5.3, Lemma 5.4, pp. 11–12; §7, Definition 7.3, pp. 16–17, and Proposition 7.7, p. 17: Existence and uniqueness of the subgroup graph, finiteness exactly for finitely generated subgroups, containment as based morphisms, and conjugacy as isomorphism of unbased cores.

*Needs:* §2.6 (The Stallings graph of a finitely generated subgroup); §2.5 (Folding preserves the accepted subgroup; cores do not change it); §2.3 (`α`-labelled graphs (`X`-digraphs) and the subgroup they accept).

### 2.8 Explicit free bases and embeddings from a Stallings graph

Define `StallingsGraph.basisWords` as follows. For a finite connected folded based graph `(Γ, v)` and a maximal tree `T` (§2.2), `basisWords Γ T` assigns to each positive edge `e` outside `T` the reduced label of the `T`-loop through `e`. The map `ι : FreeGroup (E⁺ ∖ T) →* FreeGroup α` sending `e` to mk `(basisWords Γ T e)` is injective with range subgroup `Γ v`; its corestriction is an explicit isomorphism `FreeGroup (E⁺ ∖ T) ≃*` subgroup `Γ v`, and the inverse is computed by reading a word along `Γ` and recording the non-tree edges crossed. Hence, as integers, rank (subgroup `Γ v`) `=` #`E⁺ −` #`V + 1` (or (#`E⁺ + 1`) `−` #`V` in `ℕ`).

Throughout this subsection assume: `Γ` finite, connected and folded.

Folded graphs have no reduced closed path with trivial label, so the `T`-loop words form a free basis (KM02 Proposition 6.7).
The inverse map reads the input word from `v` (unique since `Γ` is folded) and lists the non-tree edges in order.
The rank formula is KM02 Lemma 8.2.

The public interface should expose the following named results:

- `StallingsGraph.basisWords`: The `T`-loop word of each positive non-tree edge.
- `StallingsGraph.basisEquiv`: `FreeGroup (E⁺ ∖ T) ≃*` subgroup `Γ v`, explicit in both directions.
- `StallingsGraph.freeGroupBasis`: A `FreeGroupBasis (E⁺ ∖ T)` (subgroup `Γ v`), agreeing with Mathlib's `IsFreeGroup` instance from `subgroupIsFreeOfIsFree`.
- `StallingsGraph.rank_subgroup`: As integers, Group.rank (subgroup `Γ v`) `=` #`E⁺ −` #`V + 1` for finite connected folded `Γ`; use (#`E⁺ + 1`) `−` #`V` for a natural-number signature.
- `StallingsGraph.basisEquiv_symm_apply`: The inverse reads the word along `Γ` from `v` and records non-tree edges.

**Checks.**

- `StallingsGraph.rank_ab_ac`: rank `⟨a b, a c⟩ = 2` computed from `stallingsGraph [a b, a c]`.
- `StallingsGraph.rank_bot`: For the one-vertex graph without edges, the basis is empty and the subgroup is `⊥`.
- `StallingsGraph.rank_a2_a3`: For ws `= [a², a³]` the Stallings graph has rank 1 although ws has two elements: the rank is not the length of the generating list.
- `StallingsGraph.basisEquiv_compat`: The composition `FreeGroup (E⁺ ∖ T) ≃*` subgroup `Γ v → FreeGroup α` equals `FreeGroup.lift` of the basis words.

For `Γ(⟨a b, a c⟩)` with `T` the `a`-edge, the basis words are `a b` and `a c` and the rank is `3 − 2 + 1 = 2`. For the index-2 subgroup `⟨a², a b, a b⁻¹⟩` of `F(a,b)` (words of even length) the graph is complete with 2 vertices and 4 edge pairs, and the rank is `4 − 2 + 1 = 3`.

This interface is used by Layer 2 Schreier formula and Howson property: ranks of subgroups and of intersections are read from graphs; Layer 4 Grushko decompositions of subgroups of free groups: explicit bases of free factors; Layer 10 explicit embedding data: the specification asks for explicit words and maps between graph presentations and subgroups.

Use [KM02] §6, Lemma 6.1, p. 12, Proposition 6.7 and Corollary 6.8, p. 15; §8, Lemma 8.2, p. 20: A spanning tree of a folded graph yields a free basis of its subgroup (Lemma 6.1); for a geodesic spanning tree of a folded core graph the basis is Nielsen-reduced (Proposition 6.7); the rank is the number of positive edges outside the tree (Lemma 8.2).; [LEAN] Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean `(subgroupIsFreeOfIsFree)`: Mathlib proves the Nielsen–Schreier theorem non-constructively; this target provides explicit bases compatible with it.

*Needs:* §2.7 (Stallings correspondence: subgroups and based folded core graphs); §2.2 (Maximal trees exist and the fundamental group of a graph is free); Mathlib `IsFreeGroup`; Mathlib `FreeGroupBasis`; Mathlib `subgroupIsFreeOfIsFree`.

### 2.9 Product graphs and subgroup tests as graph criteria

Define `StallingsGraph.prod` as the pullback of two labelled graphs over the rose: vertices are pairs and an edge is a pair of equally labelled edges, with coordinatewise incidence and reversal. For folded graphs `Γ` and `Δ` the product is folded. Prove `StallingsGraph.prod_subgroup` with both foldedness hypotheses: subgroup (`Γ`.prod `Δ`) `(v,w) =` subgroup `Γ v ⊓` subgroup `Δ w`. For arbitrary labelled graphs assert only containment in that intersection. For folded factors the based core consequently represents the intersection. Its non-tree edges give the free basis of §2.8.

The representatives `LabelledGraph.prod`, `LabelledGraph.prod_accepted_le` and `LabelledGraph.prod_accepted` carry the product, unconditional containment and folded-factor equality. The API includes the two graph projections, preservation of reversal and labels, the accepted-subgroup equality, preservation of foldedness, and compatibility with based cores. Membership in a folded graph is the closed-path criterion of §2.3; index and conjugacy are the complete-graph and type-graph criteria of §§2.7 and 2.11.

**Checks.**

- `b⁻¹c` belongs to `⟨a b,a c⟩`, with expression `(a b)⁻¹(a c)`.
- The one-vertex graph without edges accepts only 1.
- `b a` does not belong to `⟨a b⟩` for distinct a,`b`, although these words are conjugate; based membership differs from conjugacy.
- `⟨a²⟩∩⟨a³⟩=⟨a⁶⟩`, so the product-core has a six-edge a-cycle.
- The `a`-rose and an unfolded three-edge cycle labelled a,`b`,`b⁻¹` both accept `⟨a⟩`, but their based product accepts `⊥`. Foldedness is necessary for equality.
- `⟨a,b a b⁻¹⟩` is proper and has infinite index in `F(a,b)`, despite having rank two. Its graph lacks some outgoing labels.

For the index-two subgroup `⟨a²,a b,a b⁻¹⟩` the complete graph has two vertices and four edge pairs, hence rank three.

Sources: [KM02] §7, Propositions 7.1–7.2, p. 16, Corollaries 7.8, 7.11, 7.13, pp. 17–20; §8, Corollary 8.5, p. 21; §9, Lemmas 9.2–9.3 and Proposition 9.4, pp. 25–26, Corollary 9.5, p. 26.

*Needs:* §2.3 (`α`-labelled graphs (`X`-digraphs) and the subgroup they accept); §2.7 (Stallings correspondence: subgroups and based folded core graphs); §2.8 (Explicit free bases and embeddings from a Stallings graph).

On finite enumerated alphabets, code a finite labelled graph by finite vertex and edge sets and their incidence, reversal and label tables. Require the mathematical uniform primitive-recursiveness assertions for the Stallings graph and its basis descriptions, the closed-path membership predicate, finite-index data and subgroup conjugacy or conjugate-containment witness relations, and finite generators of intersections. These assertions concern finite descriptions satisfying the structural criteria above; no graph-processing program is specified. Sources: [KM02] §7, Proposition 7.1, p. 16, Corollaries 7.8 and 7.13, pp. 17–20; §8, Corollary 8.5, p. 21; §9, Corollary 9.5, p. 26.

### 2.10 Intersections: product graphs and the Howson property

Prove the following statement. For subgroups `H`, `K ≤ FreeGroup α`: the core at the pair of base vertices `(1_H, 1_K)` of the product graph `Γ(H) × Γ(K)` is the subgroup graph of `H ∩ K`; at another pair of vertices `(v, w)` the product graph accepts the intersection of the conjugates of `H` and `K` accepted at `v` and `w`. Consequently (Howson) the intersection of two finitely generated subgroups of a free group is finitely generated, and the non-tree loops of the product-core give a free basis of it.

The product of folded graphs is folded (KM02 Lemma 9.2) and a closed path at `(v, w)` projects to closed paths in both factors; conversely two closed paths with the same reduced label combine (KM02 Proposition 9.4).
Finiteness: the product of finite graphs is finite (KM02 Corollary 9.6).

`⟨a²⟩ ∩ ⟨a³⟩ = ⟨a⁶⟩`. `⟨a, b a b⁻¹⟩ ∩ ⟨b⟩ = ⊥`.

Use [KM02] §9, Lemma 9.2, p. 25, Proposition 9.4, pp. 25–26, Corollaries 9.5–9.6, p. 26: The product of subgroup graphs computes the intersection; finitely generated subgroups of free groups have finitely generated intersections, finitely generated.

*Needs:* §2.9 (Product graphs and subgroup tests as graph criteria); §2.7 (Stallings correspondence: subgroups and based folded core graphs); §2.8 (Explicit free bases and embeddings from a Stallings graph).

### 2.11 Finite index and the Schreier formula

Prove the following statement. Let `α` be finite and `H ≤ FreeGroup α`. (1) `H` has finite index if and only if `Γ(H)` is finite and complete (every vertex has an outgoing edge with each label in `α × Bool`), and then H.index `=` #`V(Γ(H))`. (2) (Schreier formula, exact form) If `H` has finite index `i` then `H` is finitely generated and, as integers, Group.rank `H − 1 = i · (|α| − 1)`.

Throughout this subsection assume: `α` finite (for `α` empty the formula reads `−1 = −1`); `H` of finite index for (2).

(1) KM02 Proposition 8.`3: coset` representatives are the labels of tree paths to the vertices.
(2) KM02 Corollary 8.4: in a complete graph #`E⁺ = |α| ·` #`V`, and, as integers, rank `H − 1 =` #`E⁺ −` #`V` by §2.8. This strengthens the supplier inequalities to an equality for free groups.

The kernel of `F(a,b) → ℤ/2` sending a, `b` to 1 has index 2 and rank `1 + 2·1 = 3`. `⟨a, b a b⁻¹⟩` has infinite index; its graph is not complete.

Use [KM02] §8, Proposition 8.3, pp. 20–21, Corollaries 8.4–8.5, p. 21: A subgroup has finite index iff its graph is finite and `X`-regular; the index is the number of vertices; Schreier's formula rk(`H`) `− 1 = i`(rk(`F`) `− 1`).

*Needs:* §2.9 (Product graphs and subgroup tests as graph criteria); §2.8 (Explicit free bases and embeddings from a Stallings graph); §2.7 (Stallings correspondence: subgroups and based folded core graphs); Mathlib `Subgroup.rank_le_index_mul_rank`; Mathlib `Group.rank`; Mathlib `Subgroup.index`.

### Examples

Fold the based bouquet for `⟨a²,b⟩ ≤ F(a,b)`. The result has two vertices, an a-edge in each direction around the two-edge a-cycle, and a `b`-loop at the basepoint. Its rank is 2. The missing `b`-edge at the other vertex proves that the subgroup has infinite index; membership is exactly the based closed-path criterion.

### Dependencies

This layer consumes Layer 1, pinned Mathlib incidence and `GraphConnectivityAndFlows` Target 1.1. §§2.2–2.2a own graph path groups, tree presentations, finite multigraph cycle modules, forest bases, coefficient comparisons and ranks; §6.0c uses their local presentations.

## Layer 3: First-order group syntax and solution statements

The first-order language of groups with constants for a basis and the dictionary between terms and words. The end of the layer reduces quantifier-free formulas, and existential and universal sentences, to finitely many systems of equations and inequations; no decision theorem for formulas with more than one quantifier block is a target.

### 3.1 The language of groups and its coefficient extensions

Define `FirstOrder.Language.group` as follows. Language.group is the first-order language with one constant symbol one, one unary function symbol `inv` and one binary function symbol `mul`, and no relation symbols. Every group `G` is a Language.group-structure by interpreting the symbols as 1, `x ↦ x⁻¹` and multiplication. For a type A of coefficient names, `L_A :=` Language.group[`[A]`] adds a constant for each `a ∈ A`; a group `G` together with `c : A → G` is an `L_A`-structure. For a coefficient group generated by `A` (in particular `F(A)` with `c =` of), the sentences of `L_A` over `(G, c)` are the sentences of the source's language `L_A`. The theory of groups is the set of the three group axioms as `L`-sentences (representative `groupTheory`).

Define the language by its function-symbol family indexed by arity `(0, 1, 2)` and the empty relation family.
Instances: Group `G` gives `Language.group.Structure G`; a map `c : A → G` gives the constants structure, hence an `L_A`-structure (Mathlib's `constantsOn` structure for `withConstants`).

The public interface should expose the following named results:

- `FirstOrder.Language.group`: The language with symbols one, `inv`, `mul` of arities 0, 1, 2.
- `FirstOrder.Language.group.instStructure`: A group `G` is a Language.group-structure with the standard interpretations.
- `FirstOrder.Language.group.realize_mul`: Term.realize `v (mul t s) =` Term.realize `v t` * Term.realize `v s`, and similarly for `inv` and one.
- `FirstOrder.Language.group.Lcoeff`: Language.group[`[A]`] with the constants structure given by `c : A → G`.
- `FirstOrder.Language.group.theory`: The theory of groups (associativity, identity, inverse) as Language.group-sentences; `G ⊨` theory for every group `G`.
- `FirstOrder.Language.group.homomorphism`: A group homomorphism `φ : G → H` commuting with the coefficient maps is a homomorphism of `L_A`-structures; realize of terms commutes with `φ`.

**Checks.**

- `FirstOrder.Language.group.realize_comm_false`: The `L_A`-sentence `mul(a,b) = mul(b,a)` is false in `FreeGroup (Fin 2)` with `c =` of: a language with only equality and no constants could not express this.
- `FirstOrder.Language.group.realize_comm_true`: The same sentence is true in Multiplicative `(Fin 2 → ℤ)` with the standard basis as constants.
- `FirstOrder.Language.group.trivial_models`: In the trivial group every atomic sentence is true.
- `FirstOrder.Language.group.models_theory`: Every Group `G` satisfies the theory of groups; for a Language.group-structure satisfying the theory, the induced operations form a group whose structure agrees with `instStructure`.

Every group is a model of the theory of groups; a monoid that is not a group (`ℕ` under addition, with `inv` interpreted arbitrarily) is not. With `A = Fin 2` and `c =` of : `Fin 2 → F(a,b)`, the atomic `L_A`-sentence `mul(a, b) = mul(b, a)` is false in `F(a,b)` and true in `ℤ²` with `c(0) = (1,0)`, `c(1) = (0,1)`.

This interface is used by Layer 3 term–word and formula–system correspondences; Layer 7 existential, universal and positive truth sets over `F(A)`; IFT §2.3 and §3: formulas in `L_A` and their equivalence modulo the axioms of group theory.

Use [IFT] §2.3, p. 4: The standard language of group theory has symbols for multiplication, inversion and identity; for `G` generated by `A` one adds constants for the elements of `A` only, giving `L_A`.; [LEAN] Mathlib/ModelTheory/Basic.lean (Language, Structure) and Mathlib/ModelTheory/LanguageMap.lean `(withConstants)`: First-order languages, structures and the extension of a language by constants.

*Needs:* Mathlib `FirstOrder.Language`; Mathlib `FirstOrder.Language.Structure`; Mathlib `FirstOrder.Language.withConstants`.

The finite-syntax background uses Mathlib's list encodings. For a `Primcodable` coefficient alphabet `A` and variable alphabet `X`, require primitive-recursive validity for terms and for `Σn`,`L_A`.`BoundedFormula X n`, using Mathlib’s encode/decode round trips, with an empty variable alphabet for sentences. Terms agree with Mathlib's existing Encodable instance; formula codes explicitly include the number of bound variables. Substitution with a finite table, renaming along a primitive-recursive map, bound-index shifting, Boolean connectives, quantifiers and prenex forms are primitive recursive on these encodings; a merely computable renaming has only the corresponding computability assertion. Satisfaction follows Mathlib's substitution and prenex theorems in nonempty structures. These are mathematical statements about finite syntax, without an executable decoder or extra encoding instance. Sources: [LEAN] Mathlib/ModelTheory/Encoding.lean, Syntax.lean and Complexity.lean; [IFT] §2.3, pp. 4–5 and §3, Corollaries 2–7, pp. 11–13.

**Checks.**

- A code for `∀x (x a=a x)` decodes to that sentence with its coefficient constant and binder intact.
- A lone binary function symbol without arguments is an invalid term code and does not denote a formula; missing arguments cannot be padded with identities.
- A variable-term code agrees with Mathlib's Encodable instance.
- Substituting `y a` for `x` in `∃z (x z=1)` gives `∃z ((y a)z=1)`; the free variable `y` is not captured by `z`.

### 3.2 Group terms as words: the term–word correspondence

Define `FirstOrder.Language.group.Term.toWord` as follows. Define `toWord : L_A`.Term `X → FreeGroup (X ⊕ A)` by recursion: var `x ↦` of `(inl x)`, the constant `a ↦` of `(inr a)`, one `↦ 1`, `inv t ↦ (toWord t)⁻¹`, `mul t s ↦ toWord t * toWord s`; and `ofWord : FreeGroup (X ⊕ A) → L_A`.Term `X` sending the reduced word to the left-nested product of letters and inverted letters (the identity to one). An atomic formula `t = s` corresponds to the word equation `toWord t * (toWord s)⁻¹ = 1`.

Structural recursion on terms; `ofWord` by recursion on `toWord` of the element (representative `wordToTerm`).

The public interface should expose the following named results:

- `FirstOrder.Language.group.Term.toWord`: The word of a term.
- `FirstOrder.Language.group.Term.ofWord`: The term of a word (left-nested product).
- `FirstOrder.Language.group.Term.toWord_ofWord`: `toWord (ofWord w) = w`.
- `FirstOrder.Language.group.Term.realize_eq_lift`: For every group `G`, `c : A → G` and `v : X → G`: Term.realize `(v, c) t = FreeGroup.lift` (Sum.elim `v c`) `(toWord t)`.
- `FirstOrder.Language.group.Term.realize_equal_iff`: `(t = s)` holds under `(v, c)` iff `FreeGroup.lift` (Sum.elim `v c`) `(toWord t * (toWord s)⁻¹) = 1`.

**Checks.**

- `FirstOrder.Language.group.Term.toWord_conj`: `toWord (mul(inv(a), mul(x, a))) = (of (inr a))⁻¹ * of (inl x) * of (inr a)`.
- `FirstOrder.Language.group.Term.toWord_one`: `toWord` one `= 1` and `toWord (mul(t, inv t)) = 1` although `mul(t, inv t)` and one are distinct terms.
- `FirstOrder.Language.group.Term.ofWord_toWord_ne`: `ofWord (toWord (mul(t, inv t))) =` one `≠ mul(t, inv t)`: the correspondence is a bijection up to the group axioms, not on syntax.
- `FirstOrder.Language.group.Term.realize_lift_compat`: In `G = FreeGroup A` with `c =` of, realize (`v`, of) `t = FreeGroup.lift` (Sum.elim `v` of) `(toWord t)`, i.`e`. substitution of Mathlib `FreeGroup.lift` and substitution.

`toWord (mul(inv(a), mul(x, a))) = a⁻¹ x a`. `toWord (ofWord w) = w` for every `w`.

This interface is used by Layer 3 quantifier-free normal form: atomic formulas become word equations; Layer 5 systems of equations over `G`: equations `S(X, A) = 1` are elements of `G[X] = G ∗ F(X)`; Layer 7 cancellation families: formulas correspond to words through `toWord`.

Use [IFT] §2.3, p. 4: Every term of `L_A` is equivalent modulo the group axioms to a group word in the variables and the constants; atomic formulas are equations `S(X, A) = 1`.; [LEAN] Mathlib/ModelTheory/Syntax.lean (Term) and Mathlib/GroupTheory/FreeGroup/Basic.lean: Terms as an inductive type and the free group as the target of word normal forms.

*Needs:* §3.1 (The language of groups and its coefficient extensions); Mathlib `FreeGroup`; Mathlib `FirstOrder.Language.Term`.

### 3.3 Finite systems of equations and inequations with word coefficients

Define `FreeGroup.EqIneqSystem` as follows. For finite types `X` (variables) and A (basis of the coefficient free group), an equation–inequation system is a pair `(S, T)` of finite lists of words in `FreeGroup (X ⊕ A)`. An assignment `v : X → G` into a group `G` with coefficients `c : A → G` solves `(S, T)` when `FreeGroup.lift` (Sum.elim `v c`) `s = 1` for every `s ∈ S` and `FreeGroup.lift` (Sum.elim `v c`) `t ≠ 1` for every `t ∈ T`. Solutions in `FreeGroup A` use `c =` of.

A structure with two lists and a solution predicate.

The public interface should expose the following named results:

- `FreeGroup.EqIneqSystem`: Fields eqs, ineqs : List `(FreeGroup (X ⊕ A))`.
- `FreeGroup.EqIneqSystem.IsSolution`: The solution predicate for `v : X → G` and coefficients `c : A → G`.
- `FreeGroup.EqIneqSystem.isSolution_map`: If `φ : G →* H` commutes with the coefficients and is injective, `φ ∘ v` solves `(S, T)` in `H` iff `v` solves it in `G`; for non-injective `φ` only the equations transfer.
- `FreeGroup.EqIneqSystem.isSolution_iff_reduced`: For `G=FreeGroup A`, an assignment solves the system exactly when every evaluated equation has empty reduced word and every evaluated inequation has nonempty reduced word (the Mathlib criterion).
- `FreeGroup.EqIneqSystem.append`: Conjunction of two systems.

**Checks.**

- `FreeGroup.EqIneqSystem.solution_commuting`: In `F(a,b)`, `x = a`, `y = a²` solves `([x y x⁻¹ y⁻¹], [x])`.
- `FreeGroup.EqIneqSystem.empty_system`: The empty system `([], [])` is solved by every assignment.
- `FreeGroup.EqIneqSystem.ineq_not_eq`: The system `([], [x])` is solved by `x = a` but not by `x = 1`: inequations are not equations, and a definition storing all constraints as equations `w = 1` is wrong.
- `FreeGroup.EqIneqSystem.isSolution_iff_formula`: `v` solves `(S, T)` iff the conjunction of the atomic formulas (`toWord`-preimages of `S`, negated preimages of `T`) is realized by `(v, c)` in `G`.

The system `([x y x⁻¹ y⁻¹], [x])` over `F(a,b)` has the solution `x = a`, `y = a²`. The system `([x a x⁻¹ a⁻¹, x b x⁻¹ b⁻¹], [x])` has no solution in `F(a,b)`: an element commuting with `a` and `b` is trivial.

This interface is used by Layer 3 existential reduction: existential sentences reduce to finitely many systems; Layer 7 cancellation families and solution bounds; Layer 5 algebraic sets: the equations `S` give the algebraic set `V_G(S)`; inequations cut out its constructible subsets.

Use [IFT] §2.3, pp. 4–5: A Boolean combination of atomic formulas of `L_A` is a disjunction of conjunctions of equations `S_j(X, A) = 1` and inequations `T_k(X, A) ≠ 1`.; [VAR-II] §0, Definition 9, p. 6 of the author copy: The existential theory consists of sentences `∃X (⋀ u_i = 1 ∧ ⋀ v_j ≠ 1)` true in `G`.

*Needs:* Mathlib `FreeGroup`; Mathlib `FreeGroup.lift`; §3.2 (Group terms as words: the term–word correspondence).

### 3.4 Quantifier-free formulas are finite disjunctions of systems

For any quantifier-free `L_A`-formula `φ` with free variables in a finite type `X`, there is a finite list of equation–inequation systems `(S_i,T_i)` over `FreeGroup (X⊕A)` such that in every group `G` with coefficients `c:A→G` and every assignment `v:X→G`, `φ` is realized by `(v,c)` if and only if `v` solves some `(S_i,T_i)`. Prove `FirstOrder.Language.group.quantifierFree_iff_systems`, uniformly in the group and coefficient map.

Each atomic equality `t=s` corresponds to the word equation `toWord(t) toWord(s)⁻¹=1`; a negated atom corresponds to the inequation. Boolean disjunctive normal form supplies the finite family.

For `φ=¬(x=a)∨(x y=y x)` the systems are `([],[x a⁻¹])` and `([x y x⁻¹y⁻¹],[])`. A false matrix has no disjuncts, while a true matrix has one empty system. Lists of inequations keep conjunction separate from disjunction.

Sources: [IFT] §2.3, pp. 4–5; [LEAN] Mathlib/ModelTheory/Complexity.lean `(IsQF, IsQF.induction_on_sup_not)`.

*Needs:* §3.3 (Finite systems of equations and inequations with word coefficients); §3.2 (Group terms as words: the term–word correspondence); Mathlib `FirstOrder.Language.BoundedFormula.IsQF`.

### 3.5 Existential and universal sentences as solution statements

Let `σ` be an existential `L_A`-sentence `∃x₁…∃x_k φ` with quantifier-free matrix. In every group `G` with coefficients `c`, `G⊨σ` if and only if one system in a finite family supplied by §3.4 has a solution. For a universal sentence `∀x₁…∀x_k φ`, `G⊨σ` if and only if none of the systems associated to `¬φ` has a solution. Prove `FirstOrder.Language.group.existential_iff_solution` and `FirstOrder.Language.group.universal_iff_no_solution` for these classes in Mathlib's sense. These equivalences use only the group axioms, so the family is independent of `G`.

The sentence `∃x ([x,a]=1∧x≠1)` corresponds to `([x a x⁻¹a⁻¹],[x])`; `x=a` is a witness in `F(a,b)`. The universal commutativity sentence holds in `ℤ²` and fails in `F(a,b)`, since the single inequation `[x,y]≠1` has a solution exactly in nonabelian groups.

Sources: [IFT] §2.3, p. 5, and §3.2, pp. 13–16; [VAR-II] §0, Definition 9, p. 6 of the author copy.

*Needs:* §3.4 (Quantifier-free formulas are finite disjunctions of systems); Mathlib `FirstOrder.Language.BoundedFormula.IsExistential`, `FirstOrder.Language.BoundedFormula.IsUniversal`, and `FirstOrder.Language.Sentence`.

### Examples

The sentence `∃x ([x,a] = 1 ∧ x ≠ 1)` becomes the equation–inequation system `([x,a],[x])`. In `F(a,b)`, `x=a` witnesses truth. Negating `∀x∀y [x,y]=1` produces the system with the single inequation `[x,y]≠1`, witnessed by `x=a`,`y=b`. The conversion preserves coefficients and quantifier scope.

### Dependencies

This layer consumes Layer 1. Library suppliers are the declarations specified above; no other roadmap is required.

## Layer 4: Bass–Serre theory and relative splittings

Graphs of groups, their fundamental groups and Bass–Serre trees, built on the Serre graphs of Layer 2 and compared with Mathlib's amalgams and HNN extensions. The layer proves the structure theorem, the normal form theorem, induced splittings (finite under finite generation), the Kurosh and Grushko theorems with their uniqueness statements, the moves relating splittings, and Dehn twists. Effective JSJ decompositions are in Layer 10, not consequences of this layer.

### 4.1 Graphs of groups

Define `GraphOfGroups` as follows. A graph of groups `𝔸` over a Serre graph `A` (§2.1) assigns a group `A_v` to each vertex, a group `A_e` to each edge with `A_{rev e} = A_e`, and for each edge an injective homomorphism `ω_e : A_e →* A_{tgt e}`, with `α_e := ω_{rev e} : A_e →* A_{src e}`. Loops and multiple edges are allowed; no finiteness is assumed in the definition, and ‘finite graph of groups’ means a finite underlying graph.

Structure over a Serre graph with dependent families of groups and monomorphisms satisfying the reversal compatibility.

The public interface should expose the following named results:

- `GraphOfGroups`: Fields: graph, `vertexGroup`, `edgeGroup`, `edgeGroup_rev`, `ω` with injectivity.
- `GraphOfGroups.α`: `α_e := ω_{rev e}` composed with the identification `A_{rev e} = A_e`.
- `GraphOfGroups.segment`: The graph of groups of an amalgam: two vertices, one edge pair.
- `GraphOfGroups.loop`: The graph of groups of an HNN extension: one vertex, one loop pair.
- `GraphOfGroups.Hom`: Morphisms: a graph morphism with compatible group homomorphisms and twisting elements, composing associatively.
- `GraphOfGroups.restrict`: Restriction to a subgraph (used for collapses and for the maximal-tree presentation).

**Checks.**

- `GraphOfGroups.segment_eq_pushout`: For the segment with groups A, `B`, `C` and maps `C → A`, `C → B`, `π₁` is isomorphic to Mathlib's `Monoid.PushoutI` over the two-element index (§4.5).
- `GraphOfGroups.trivial_groups`: If all vertex and edge groups are trivial, `π₁(𝔸, v)` is the free group `π₁(A, v)` of §2.2.
- `GraphOfGroups.noninjective_rejected`: Data with a non-injective `ω_e` is not a graph of groups: with `ω_e` non-injective the vertex groups would not embed (the normal form theorem fails).
- `GraphOfGroups.BS12`: The loop with `A_v = A_e = ℤ = ⟨a⟩`, `α = id`, `ω = ×2` has `π₁ ≅ ⟨a, t | t a² t⁻¹ = a⟩ ≅` BS(1,2), with the convention of §4.2: `e ω_e(c) e⁻¹ = α_e(c)`.

The segment with vertex groups `ℤ`, `ℤ` and edge group `ℤ` mapped by 2 and 3 is a graph of groups (`π₁` is the torus-knot-type group `⟨x, y | x² = y³⟩`). A one-vertex graph with one loop pair, `A_v = A_e = ℤ`, `α_e = id`, `ω_e = ×2`, is a graph of groups (`π₁ ≅` BS(1,2)).

This interface is used by Layer 4 Bass–Serre tree and structure theorem: the data from which the fundamental group and its tree are built; Layer 6 surface-group splittings and QH vertices: surfaces are cut along curves into graphs of groups; Layer 8 NTQ groups and Layer 10 JSJ decompositions: limit groups are described by graphs of groups with abelian edge groups.

Use [FOLD] §2, Convention 2.1, p. 5: A graph of groups: an underlying Serre graph with vertex and edge groups, boundary monomorphisms `α_e`, `ω_e`, with `A_{e⁻¹} = A_e` and `α_{e⁻¹} = ω_e`.; [TREES] Chapter I, §4.4, Definition 8: Serre's definition of a graph of groups `(G, Y)`.; [GL-JSJ] §1.1, pp. 15–16: Graphs of groups as quotients of actions on trees; conventions on minimality and edge orientation.

*Needs:* §2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges).

### 4.2 The fundamental group of a graph of groups, via paths and via a maximal tree

Define `GraphOfGroups.Path` as follows. For a graph of groups `𝔸` and a vertex `v₀`: (1) an `𝔸`-path from `v` to `v′` is a sequence `a₀`, `e₁`, `a₁`, `…`, `e_k`, `a_k` with `e₁…e_k` an edge path from `v` to `v′`, `a₀ ∈ A_v`, `a_k ∈ A_{v′}`, `a_i ∈ A_{tgt e_i} = A_{src e_{i+1}}`; `π₁(𝔸, v₀)` is the set of `𝔸`-paths from `v₀` to `v₀` modulo the equivalence generated by a, `e`, `ω_e(c)`, `rev e`, `a′ ∼ a α_e(c) a′`, with concatenation as product. (2) For a maximal tree `T` of A, `π₁(𝔸, T)` is the quotient of the free product of the `A_v (Monoid.CoprodI)` and the free group on `E` by the relations `rev e = e⁻¹`, `e ω_e(c) e⁻¹ = α_e(c)` (convention fixed here, matching (1)), and `e = 1` for `e ∈ T`. There is a canonical isomorphism `π₁(𝔸, v₀) ≃* π₁(𝔸, T)` sending the loop `[v₀, src e]_T e [tgt e, v₀]_T` to `e`.

Throughout this subsection assume: A connected (for (2) and the isomorphism).

(1) Define `𝔸`-paths and elementary equivalences; concatenation descends to the quotient (FOLD Definition 2.3).
(2) Define the presentation as a quotient of `Monoid.Coprod (Monoid.CoprodI A_·) (FreeGroup E)` by a normal closure.
The isomorphism sends a generator to the corresponding `T`-loop; its inverse reads an `𝔸`-path letter by letter (FOLD Proposition 2.`4(3)` gives the generating set).

The public interface should expose the following named results:

- `GraphOfGroups.Path`: `𝔸`-paths with concatenation and elementary reduction.
- `GraphOfGroups.π₁`: `π₁(𝔸, v₀)`: closed `𝔸`-paths modulo equivalence, a group.
- `GraphOfGroups.π₁Tree`: `π₁(𝔸, T)` as a presented group.
- `GraphOfGroups.π₁Equiv`: `π₁(𝔸, v₀) ≃* π₁(𝔸, T)` for a maximal tree `T`.
- `GraphOfGroups.vertexHom`: For `v` and a path `p` from `v₀` to `v`, the homomorphism `A_v →* π₁(𝔸, v₀)`, `a ↦ p a p⁻¹`.
- `GraphOfGroups.π₁.lift`: Homomorphisms `π₁(𝔸, T) →* H` correspond to families `φ_v : A_v →* H` and elements `h_e ∈ H` with `h_e = 1` on `T`, `h_{rev e} = h_e⁻¹` and `h_e φ(ω_e c) h_e⁻¹ = φ(α_e c)`.
- `GraphOfGroups.π₁.map`: Functoriality in morphisms of graphs of groups.

**Checks.**

- `GraphOfGroups.π₁_segment`: `π₁` of the segment with `ℤ ← ℤ → ℤ` by 2 and 3 is `⟨x, y | x² = y³⟩`, whose abelianisation is `ℤ`.
- `GraphOfGroups.π₁_trivial`: For a single vertex with group `G` and no edges, `π₁ = G`.
- `GraphOfGroups.π₁_rose_trivial`: For the rose with `n` petals and trivial groups, `π₁` is free of rank `n`.
- `GraphOfGroups.π₁_tree_relation_needed`: Omitting the relations `e = 1` for `e ∈ T` in (2) adds a free factor of rank #`E⁺(T)`: the presentation must kill tree edges.

For the segment, `π₁(𝔸, T)` is the amalgam `A ∗_C B`. Changing the maximal tree gives isomorphic groups (§4.4).

This interface is used by Layer 4 normal form and vertex-group injectivity: the group in which reduced paths are compared; Layer 4 Bass–Serre tree: vertices are cosets of conjugated vertex groups in `π₁`; Layer 6, Layer 8, Layer 10: every splitting of a surface group, limit group or NTQ group is `π₁` of a graph of groups.

Use [FOLD] §2, Definitions 2.2–2.3 and Proposition 2.`4(3)`, pp. 5–6: `𝔸`-paths, the equivalence relation generated by elementary reductions, `π₁(𝔸, v₀)` as classes of closed `𝔸`-paths, and generators from a maximal subtree.; [TREES] Chapter I, §5.1, the groups `F(G, Y)`, `π(G, Y)`, `π₁(G, Y, T)` and `π₁(G, Y, P₀)`: Serre defines both versions of the fundamental group and identifies them.

*Needs:* §4.1 (Graphs of groups); §2.2 (Maximal trees exist and the fundamental group of a graph is free); Mathlib `Monoid.CoprodI`; Mathlib `Monoid.Coprod`; Mathlib `Subgroup.normalClosure`.

### 4.3 Normal form theorem and injectivity of vertex groups

Prove the following statement. Let `𝔸` be a graph of groups. (1) A nontrivial element `a ∈ A_v`, as a length-zero path, is not equivalent to the trivial path; hence each `vertexHom A_v →* π₁(𝔸, v₀)` is injective. (2) A reduced `𝔸`-path (one containing no subsequence a, `e`, `ω_e(c)`, `rev e`, `a′`) of positive length is not equivalent to a shorter path, and two equivalent reduced `𝔸`-paths have the same underlying edge path. (3) In particular, for the segment, Mathlib's normal form for `Monoid.PushoutI` is recovered, and for the loop Mathlib's normal form for `HNNExtension` (Britton's lemma: a word `t^{ε₁} g₁ …` with no pinch `t c t⁻¹`, `c ∈ A`, or `t⁻¹ c t`, `c ∈ B`, is nontrivial).

Construct an action of `π₁(𝔸, v₀)` on the set of reduced normal-form words relative to transversals of the edge-group images, as Mathlib does for `PushoutI` and `HNNExtension`, and check the relations (FOLD Proposition 2.4, Serre I §5.2 Theorem 11).
(1) and (2) follow because the action sends the empty word to the normal form of the path.

In `⟨a, t | t a² t⁻¹ = a⟩` the path `t a t⁻¹` is reduced because `a ∉ ω(ℤ) = ⟨a²⟩`, so `t a t⁻¹ ∉ ⟨a⟩`; the path `t a² t⁻¹` is not reduced and equals a. For the segment with `C → A`, `C → B` the identity maps of a common group, `π₁ = A` and a reduced closed path of positive length does not exist. Crossing the edge once is a reduced path of length one between distinct vertices.

Use [FOLD] §2, Proposition 2.4 (Normal Form Theorem), p. 6: Nontrivial vertex-group elements are nontrivial in `π₁`; reduced `𝔸`-paths of positive length are not equivalent to shorter paths, and equivalent reduced paths share the edge path.; [TREES] Chapter I, §5.2, Theorem 11 and its corollaries: Reduced words in the fundamental group of a graph of groups are nontrivial; vertex groups embed.; [LEAN] Mathlib/GroupTheory/PushoutI.lean `(NormalWord, of_injective)` and Mathlib/GroupTheory/HNNExtension.lean `(NormalWord, of_injective)`: The one-edge cases are in Mathlib.

*Needs:* §4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); Mathlib `Monoid.PushoutI.NormalWord`; Mathlib `HNNExtension.NormalWord`; Mathlib `HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range`; Mathlib `Monoid.PushoutI.of_injective`; Mathlib `HNNExtension.of_injective`.

### 4.4 Independence of the maximal tree and the base vertex

Prove the following statement. For a connected graph of groups `𝔸`, vertices `v₀`, `v₁` and maximal trees `T`, `T′: π₁(𝔸, T) ≃* π₁(𝔸, T′)` and `π₁(𝔸, v₀) ≃* π₁(𝔸, v₁)`, by isomorphisms that carry each vertex group `A_v` to a conjugate of its image and each edge-group image to a conjugate of its image.

Both are isomorphic to `π₁(𝔸, v₀)` through §4.2; change of base vertex is conjugation by an `𝔸`-path from `v₀` to `v₁`.

For the theta graph of groups with trivial groups, the two choices of maximal tree give two free bases of `F₂` related by a Nielsen automorphism.

Use [TREES] Chapter I, §5.1, Proposition 20: The groups `π₁(G, Y, T)` for different maximal trees and `π₁(G, Y, P₀)` for different base points are isomorphic.; [FOLD] §2, Proposition 2.`4(3)`, p. 6: Generators of `π₁(𝔸, v₀)` attached to an arbitrary maximal subtree.

*Needs:* §4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree).

### 4.5 One-edge graphs of groups are Mathlib's amalgams and HNN extensions

Prove the following comparison. (1) For the segment graph of groups with vertex groups A, `B`, edge group `C` and monomorphisms `C → A`, `C → B`, `π₁ ≃* Monoid.PushoutI` over the index `Bool` with these maps, compatibly with the inclusions of A and `B`. (2) For the loop graph of groups with vertex group `G`, edge group `C` and monomorphisms `α`, `ω : C → G`, `π₁ ≃* HNNExtension G (α C) (ω C) φ` with `φ = ω ∘ α⁻¹` on the image, sending `G` to of and the loop edge `e` to `t⁻¹`: with `A := α(C)`, `B := ω(C)` and `φ = ω ∘ α⁻¹`, Mathlib's relation `t a t⁻¹ = φ(a) (a ∈ A)` is `e⁻¹ α(c) e = ω(c)`, which is the relation `e ω(c) e⁻¹ = α(c)` of §4.2.

Compare universal properties: `π₁`.lift of §4.2 with `Monoid.PushoutI.lift` and `HNNExtension.lift`.

The free product `A ∗ B` is the segment with trivial edge group and equals `Monoid.Coprod A B` up to the canonical isomorphism.

Use [TREES] Chapter I, §1.1 (amalgams) and §5.1 (examples of fundamental groups of graphs of groups): Amalgamated products and HNN extensions are the fundamental groups of the segment and the loop.; [LEAN] Mathlib/GroupTheory/PushoutI.lean (lift) and Mathlib/GroupTheory/HNNExtension.lean (lift, `t_mul_of`): Universal properties of Mathlib's amalgams and HNN extensions.; [GL-JSJ] §1.1, p. 16: A one-edge splitting, that is a graph of groups with one edge, is an amalgam `A ∗_C B` or an HNN extension `A ∗_C`.

*Needs:* §4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); Mathlib `Monoid.PushoutI`; Mathlib `HNNExtension`; Mathlib `Monoid.Coprod`.

### 4.6 Group actions on trees: elliptic and hyperbolic elements, relative trees

Define `GTree` as follows. A `G`-tree is a Serre tree `T` with an action of `G` by graph automorphisms without inversions (`g · e ≠ rev e` for all `g`, `e`). An element `g` is elliptic when it fixes a vertex and hyperbolic otherwise; a subgroup `H` is elliptic when it fixes a vertex. For a family `𝒜` of subgroups closed under conjugation and taking subgroups and a family `ℋ` of subgroups, an `(𝒜, ℋ)`-tree is a `G`-tree whose edge stabilizers lie in `𝒜` and in which every `H ∈ ℋ` is elliptic. `T` is minimal when it has no proper `G`-invariant subtree. `T` dominates `T′` when there is a `G`-equivariant continuous map of the geometric trees `T → T′`, allowing edges to collapse or map to subdivided edge paths, equivalently when every vertex stabilizer of `T` is elliptic in `T′`; two trees are in the same deformation space when each dominates the other.

Define the action structure, the predicates elliptic, hyperbolic, minimal, the relative-tree predicate and domination.

The public interface should expose the following named results:

- `GTree`: A Serre tree with a `G`-action without inversions.
- `GTree.IsElliptic`: `g` (or `H`) fixes a vertex.
- `GTree.IsHyperbolic`: `g` fixes no vertex.
- `GTree.IsRelative`: Edge stabilizers in `𝒜` and every `H ∈ ℋ` elliptic.
- `GTree.Dominates`: `T` dominates `T′`: an equivariant map `T → T′` exists; characterisation by vertex stabilizers.
- `GTree.SameDeformationSpace`: Mutual domination; an equivalence relation.
- `GTree.translationLength`: `ℓ(g) = min` over vertices of `d(x, g x)`; `ℓ(g) = 0` iff `g` elliptic.

**Checks.**

- `GTree.cayley_hyperbolic`: In the Cayley tree of `F(a,b)`, `ℓ(a b) = 2` and `ℓ(a b a⁻¹) = 1`.
- `GTree.point_all_elliptic`: On the one-vertex tree every subgroup is elliptic, and every `G`-tree dominates the one-vertex tree.
- `GTree.inversion_excluded`: The action of `ℤ/2` on the segment swapping its two vertices inverts the edge, so it is not a `G`-tree action; after subdivision it becomes one with an elliptic generator.
- `GTree.dominates_iff`: `T` dominates `T′` iff every vertex stabilizer of `T` is elliptic in `T′` (checked on the Bass–Serre trees of `A ∗ B` and of the trivial splitting).

`F(a,b)` acting on its Cayley tree: every nontrivial element is hyperbolic. In the Bass–Serre tree of `A ∗_C B`, A and `B` are elliptic and `a b (a ∈ A ∖ C, b ∈ B ∖ C)` is hyperbolic.

This interface is used by Layer 4 structure theorem and induced splittings: subgroups act on the Bass–Serre tree; Layer 10 JSJ theory: universal ellipticity, domination and deformation spaces of `(𝒜, ℋ)`-trees; Layer 9 `Λ`-trees: the simplicial case of `Λ`-tree actions.

Use [GL-JSJ] §1.1, pp. 15–17 (actions without inversions, elliptic and hyperbolic elements, minimal subtrees), Definition 2.1, p. 22, and §2.2 (domination, deformation spaces): Trees with actions, ellipticity, domination as existence of an equivariant map, equivalently ellipticity of vertex stabilizers, and `(𝒜, ℋ)`-trees.; [TREES] Chapter I, §6.1 and §6.4, Propositions 24–25: Fixed points and hyperbolic automorphisms of trees.

*Needs:* §2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges).

### 4.7 The Bass–Serre tree of a graph of groups

Define `GraphOfGroups.bassSerreTree` as follows. For a graph of groups `𝔸` with base vertex `v₀`, the Bass–Serre tree `X(𝔸, v₀)` has as vertices the classes `p A_v` of `𝔸`-paths `p` from `v₀` to `v` (`p ≈ p′` when `p ∼ p′` a with `a ∈ A_v`), with an edge between `p A_v` and `p a e A_{v′}` for `a ∈ A_v` and an edge `e` from `v` to `v′`. `π₁(𝔸, v₀)` acts by left concatenation, without inversions. `X` is a tree; the stabilizer of `p A_v` is `p A_v p⁻¹` and the stabilizer of the edge from `p A_v` to `p a e A_{v′}` is `p a α_e(A_e) a⁻¹ p⁻¹`. Its quotient is the connected component of `v₀` in A, and is the whole graph `A` when A is connected. Vertex-group identifications require a path from `v₀` to that vertex.

Define the vertex and edge sets as quotients of `𝔸`-paths and the action by concatenation (FOLD Definition 2.5).
Connectedness by induction on path length; absence of reduced circuits from §4.3 (Normal form theorem and injectivity of vertex groups).

The public interface should expose the following named results:

- `GraphOfGroups.bassSerreTree`: `X(𝔸, v₀)` as `a GTree` for `π₁(𝔸, v₀)`.
- `GraphOfGroups.bassSerreTree_isTree`: `X(𝔸, v₀)` is a tree.
- `GraphOfGroups.stabilizer_vertex`: Stab(`p A_v`) `= p A_v p⁻¹`.
- `GraphOfGroups.stabilizer_edge`: Edge stabilizers are conjugates of edge-group images.
- `GraphOfGroups.quotient_bassSerreTree`: The quotient graph `X/π₁` is isomorphic to the component of `v₀`; for connected A this identifies it with A.

**Checks.**

- `GraphOfGroups.bassSerreTree_free_product`: For `ℤ ∗ ℤ` the vertex `⟨a⟩` has neighbours `a^k⟨b⟩` for `k ∈ ℤ`, so degree `ℵ₀`.
- `GraphOfGroups.bassSerreTree_point`: For a one-vertex graph of groups without edges, `X` is a point.
- `GraphOfGroups.bassSerreTree_BS12`: For BS(1,2) the vertex `A_v` has `1 + 2 = 3` incident edge orbits representatives: index `[A : α(C)] = 1` and `[A : ω(C)] = 2`, so each vertex has degree 3.
- `GraphOfGroups.bassSerreTree_not_quotient_paths`: Taking all `𝔸`-paths without the relation `≈` gives a graph with a vertex for each element of `A_v` at the base, not a tree with the correct stabilizers.
- For two isolated vertices with trivial groups and basepoint at one, `X` and `X/π₁` have one vertex, while A has two; the other vertex group has no based `vertexHom` supplied by §4.2.

For `F(a,b) = ℤ ∗ ℤ` with the segment of trivial edge group, `X` is the tree whose vertices are cosets of `⟨a⟩` and `⟨b⟩`, bipartite with all vertices of infinite degree. For a graph of groups with all groups trivial, `X` is the universal cover of the component of `v₀` in `A`.

This interface is used by Layer 4 structure theorem: the canonical example of a `G`-tree with given quotient graph of groups; Layer 4 induced splittings: subgroups of `π₁` act on `X`; Layer 10 JSJ trees: trees of splittings of limit groups.

Use [FOLD] §2, Definition 2.5 and the paragraphs following it, pp. 6–7: The Bass–Serre covering tree as classes of `𝔸`-paths, its tree property from the normal form theorem, the action and the stabilizers.; [TREES] Chapter I, §5.3, Theorem 12: The universal covering tree of a graph of groups.

*Needs:* §4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); §4.3 (Normal form theorem and injectivity of vertex groups); §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees).

### 4.8 Structure theorem: actions on trees are graphs of groups

Prove the following statement. Let a group `U` act on a tree `Y` without inversions. Then the quotient graph `B = Y/U` carries a graph of groups `𝔹` (vertex groups stabilizers of lifts of vertices along a lift `T₁` of a maximal tree and a fundamental domain `T₂`, edge groups edge stabilizers, monomorphisms inclusions twisted by chosen elements `t_v`) such that `U ≃* π₁(𝔹, v₀′)` and `Y` is `U`-equivariantly isomorphic to the Bass–Serre tree of `𝔹`. The resulting graph of groups is independent of the choices up to isomorphism of graphs of groups.

Choose `T₁ ⊆ T₂ ⊆ Y` as in FOLD Remark 2.7 and define `𝔹`.
The map `π₁(𝔹, T) → U` is surjective since `U` is generated by the vertex stabilizers along `T₁` and the `t_v`; injectivity and the tree isomorphism come from comparing `Y` with the Bass–Serre tree (Serre I §5.4 Theorem 13).

`SL(2, ℤ)` acting on its Bass–Serre tree (from the amalgam `ℤ/4 ∗_{ℤ/2} ℤ/6`) recovers that amalgam. A free action gives trivial vertex groups and `U` free (§2.2).

Use [FOLD] §2, Proposition 2.6 and Remark 2.7, pp. 7–8: For `U` acting on a tree without inversions the quotient carries a graph of groups with `U ≅ π₁` and the tree equivariantly isomorphic to its Bass–Serre tree; explicit construction from a lifted maximal tree and fundamental domain.; [TREES] Chapter I, §5.4, Theorem 13: The structure theorem for groups acting on trees.

*Needs:* §4.7 (The Bass–Serre tree of a graph of groups); §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); §2.2 (Maximal trees exist and the fundamental group of a graph is free); §4.4 (Independence of the maximal tree and the base vertex).

### 4.9 Elliptic–hyperbolic dichotomy and fixed points of finitely generated groups

Prove the following statement. Let `G` act on a tree `T` without inversions. (1) Every `g ∈ G` is either elliptic or hyperbolic; a hyperbolic `g` has a unique axis, a `g`-invariant bi-infinite line on which it translates by `ℓ(g) > 0`. (2) If `H ≤ G` is finitely generated and every element of `H` is elliptic, then `H` fixes a vertex (for a finite generating set, it suffices that every generator and every product of two generators is elliptic). (3) If `H` contains a hyperbolic element then `T` contains a unique minimal `H`-invariant subtree `μ_T(H)`, the union of the axes of hyperbolic elements of `H`.

Throughout this subsection assume: Action without inversions; `H` finitely generated in (2).

(1) Serre I §6.4, Propositions 24–25: consider the minimum of `d(x, g x)`.
(2) Serre I §6.5, Corollary 2 (Serre's lemma on pairs of elliptic elements); `GL`-JSJ Proposition 1.1 shows the third alternative (fixing an end) only occurs for infinitely generated `H`.
(3) `GL`-JSJ Proposition 1.`1(2)`.

In `F(a,b)` on its Cayley tree, `a` and `b` are hyperbolic, with axes meeting in one vertex. `ℚ` (infinitely generated) can act on a tree with all elements elliptic and no global fixed point, so the finite-generation hypothesis in (2) is needed.

Use [TREES] Chapter I, §6.4, Propositions 24–25 and §6.5, Corollary 2: Automorphisms of trees without inversion are elliptic or hyperbolic; finitely generated groups of elliptic automorphisms have a fixed point.; [GL-JSJ] §1.1, Proposition 1.1, p. 17: Trichotomy: a global fixed point, or hyperbolic elements and a unique minimal invariant subtree, or an infinitely generated group fixing a unique end.

*Needs:* §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees).

### 4.10 Induced splittings of subgroups, with finiteness under finite generation

Define `GraphOfGroups.inducedSplitting` as follows. Let `G = π₁(𝔸, v₀)` with Bass–Serre tree `X` and base vertex `x₀`, and let `U ≤ G`. For a `U`-invariant subtree `Y ⊆ X` containing `x₀`, the induced splitting of `U` is the graph of groups of the structure theorem for the action of `U` on `Y`; its vertex groups are `U ∩` conjugates of vertex groups of `𝔸` and its edge groups `U ∩` conjugates of edge groups. The preferred subtree is `X_{U,x₀} := ⋃_{u ∈ U} [x₀, u x₀]`. If `U` is generated by a finite set `S`, put `K_S := {x₀} ∪ ⋃_{s ∈ S} [x₀, s x₀]`. Then `X_{U,x₀} = U · K_S`, so the induced graph of groups on `X_{U,x₀}/U` is finite; without finite generation it may be infinite.

Throughout this subsection assume: For finiteness: `U` finitely generated.

Apply §4.8 to the action of `U` on `Y`.
For finite `S`, `K_S` is a finite subtree containing `x₀`, even when `S` is empty. For a word `s₁⋯s_k` in `S ∪ S⁻¹`, `[x₀, s₁⋯s_k x₀]` is contained in the union of the translated generator segments `s₁⋯s_{i−1}[x₀, s_i x₀]`. An inverse-generator segment satisfies `[x₀, s⁻¹x₀] = s⁻¹[x₀, sx₀]`. Thus every such segment lies in `U·K_S`; the length-zero word contributes `x₀`. Conversely, `X_{U,x₀}` is the `U`-invariant hull of the orbit `Ux₀` and contains `K_S`, so `U·K_S` lies in it. Hence `K_S` meets every vertex and edge orbit, proving finiteness of the quotient.

The public interface should expose the following named results:

- `GraphOfGroups.inducedSplitting`: The graph of groups of `U` acting on a `U`-invariant subtree.
- `GraphOfGroups.minimalSubtreeAt`: `X_{U,x₀} = ⋃_{u ∈ U} [x₀, u x₀]`.
- `GraphOfGroups.inducedSplitting_finite`: For finitely generated `U` the induced graph on `X_{U,x₀}` is finite.
- `GraphOfGroups.inducedSplitting_vertexGroup`: Each vertex group of the induced splitting is `U ∩ g A_v g⁻¹` for some `g` and `v`.
- `GraphOfGroups.inducedSplitting_equiv`: `U ≃* π₁` of the induced splitting (structure theorem).

**Checks.**

- `GraphOfGroups.induced_cyclic`: For `U = ⟨a b⟩` in `⟨a⟩ ∗ ⟨b⟩` the induced splitting on `X_{U,x₀}` is a cycle with two vertices and two edge pairs, all groups trivial: a definition that quotients by the subgroup generated by `a` and `b` separately, or that forgets one vertex orbit, gives a one-vertex loop instead.
- `GraphOfGroups.induced_vertex_subgroup`: For `U ≤ A_{v₀}`, `U` fixes `x₀`, `X_{U,x₀} = {x₀}`, and the induced splitting is the single vertex `U`.
- For `U=1` and `S=∅`, `K_S={x₀}` and `X_{U,x₀}/U` has one vertex and no edges, with trivial vertex group; it is not the empty graph.
- `GraphOfGroups.induced_infinite`: For the commutator subgroup of `F(a,b)` the induced graph is infinite: finiteness needs finite generation.
- `GraphOfGroups.induced_kurosh`: For `𝔸` with trivial edge groups (a free product), the induced splitting gives the Kurosh decomposition of `U` (§4.11).

For `U = ⟨a b⟩ ≤ ℤ ∗ ℤ = ⟨a⟩ ∗ ⟨b⟩`, `X_{U,x₀}` is the axis of `a b`, on which `a b` translates by two edges, so the induced graph of groups is a cycle with two vertices (one orbit of cosets of `⟨a⟩`, one of `⟨b⟩`) and two edge pairs, all groups trivial, with `π₁ ≅ ℤ`. The commutator subgroup of `F(a,b)` (infinitely generated) has an infinite induced graph on the Cayley tree.

This interface is used by Layer 4 Kurosh and Grushko theorems: subgroups of free products; Layer 10 subgroup descriptions: induced splittings of finitely generated subgroups of limit groups (FOLD Theorem 5.8); Layer 6 finite covers: finite-index subgroups of surface groups inherit splittings.

Use [FOLD] §2, Definition 2.8, p. 8: Induced splittings of a subgroup with respect to an invariant subtree, the preferred subtree `X_{U,x₀}`, and vertex and edge groups conjugate into those of `𝔸`.; [TREES] Chapter I, §5.5: Subgroups of fundamental groups of graphs of groups act on the same tree.

*Needs:* §4.8 (Structure theorem: actions on trees are graphs of groups); §4.7 (The Bass–Serre tree of a graph of groups); §4.9 (Elliptic–hyperbolic dichotomy and fixed points of finitely generated groups).

### 4.10a Group-labelled graphs and folds for the Grushko theorem

For a finite based graph of groups `𝔸` with trivial edge groups, define an `𝔸`-graph: a finite typed Serre graph with finitely generated vertex subgroups of the corresponding `𝔸`-vertex groups and edge labels `(a,e,b)` in the endpoint groups and an `𝔸`-edge. Its path map represents a subgroup of `π₁(𝔸)`. Construct the `S`-wedge of a finite family of reduced `𝔸`-paths. Define the auxiliary moves A0–A2 and folds F1–F4 with the applicability and basepoint-admissibility conditions of FOLD §4. Prove preservation of the represented subgroup through the canonical epimorphisms and equivariant tree maps of Proposition 4.15. Define complexity as the underlying graph rank plus the sum of vertex-subgroup ranks; prove that these folds do not increase it. Prove existence of a finite folded `𝔸`-graph realizing the induced splitting, with the same represented subgroup and complexity no greater than the `S`-wedge. This target uses trivial edge groups; it does not require the benign-graph membership algorithms or folds F5–F6.

**Checks.**

- An `S`-wedge made from `k` reduced generating paths has complexity at most `k`, with equality when the generating set has minimum cardinality. For `S={a,a²,b}` in `⟨a⟩∗⟨b⟩` based at `⟨a⟩`, the vertex subgroup has rank one and there is one circle, so the initial complexity is two, although `k=3`.
- A fold merging two edge pairs preserves the represented subgroup; a vertex-subgroup rank increase is compensated in the total complexity.
- For `𝔸` the one-edge presentation of `G₁∗G₂` and `S` generating that whole group, the folded induced graph recovers `𝔸` and has complexity rank `G₁+`rank `G₂`.

Sources: [FOLD] §3, Definition 3.1, Convention 3.2 and Definition 3.3, pp. 8–9; §4, Definitions 4.5–4.7, Convention 4.8, Definitions 4.9–4.11 and Proposition 4.15, pp. 12–18; §5, Definition 5.1 and Lemma 5.3, pp. 19–20; §6, Definition 6.1 and proof of Theorem 6.2, pp. 27–28.

*Needs:* §§4.1–4.3 (graphs of groups, path presentations and normal forms); §4.10 (induced splittings); §2.2 (graph rank); Mathlib `Group.rank`.

### 4.11 Kurosh subgroup theorem, Grushko–Neumann theorem and Grushko decompositions

Prove the following statement. (1) (Kurosh) Every subgroup `U` of a free product `∗_i G_i` is a free product of a free group and of subgroups `U ∩ g G_i g⁻¹` (one for each double `coset U g G_i` with nontrivial intersection). (2) (Grushko–Neumann) For finitely generated nontrivial `G₁`, `G₂`, rank `(G₁ ∗ G₂) =` rank `G₁ +` rank `G₂`. (3) (Grushko decomposition) Every finitely generated group `G` is a free product `G = G₁ ∗ ⋯ ∗ G_p ∗ F_q` with each `G_i` nontrivial, not `ℤ` and freely indecomposable; `p`, `q` are unique and the `G_i` are unique up to conjugacy and permutation. (4) (Relative version) For a finite family `ℋ` of finitely generated subgroups, the same holds for free decompositions in which every `H ∈ ℋ` is conjugate into some factor, with the `G_i` freely indecomposable relative to the conjugates of `ℋ` they contain. Such a relative factor may be infinite cyclic when it carries a nontrivial peripheral subgroup; only unconstrained cyclic factors are collected into `F_q`. The trees of these decompositions form one deformation space (the Grushko deformation space relative to `ℋ`).

Throughout this subsection assume: (2)–(4): finitely generated groups; (4): `ℋ` finite family of finitely generated subgroups.

(1) Apply §4.10 to `U` acting on the tree of the free product (trivial edge stabilizers).
(2) Folding argument on `𝔸`-graphs with the complexity of FOLD Definition 6.1 (FOLD Theorem 6.2).
(3) Existence by induction on rank using (2); uniqueness by (1) applied to two decompositions (the factors of one are elliptic in the tree of the other).
(4) The same argument for (trivial edge group, `ℋ`)-trees; `GL`-JSJ §3.2 identifies the Grushko deformation space.

rank(`ℤ/2 ∗ ℤ/3`) `= 2`; rank(`F₂ ∗ ℤ`) `= 3`. The Grushko decomposition of `ℤ² ∗ F₂` has `p = 1`, `q = 2`, `G₁ = ℤ²`.

Use [FOLD] §6, Definition 6.1 and Theorem 6.2, pp. 27–29: A proof of Grushko's theorem rk(`G₁ ∗ G₂`) `=` rk `G₁ +` rk `G₂` by foldings of `𝔸`-graphs.; [TREES] Chapter I, §5.5, Theorem 14: Kurosh's subgroup theorem from the action on the Bass–Serre tree of a free product.; [GL-JSJ] Introduction, pp. 1–3, and §3.2, p. 30: Grushko decompositions `G = G₁ ∗ ⋯ ∗ G_p ∗ F_q` with `q` and the `G_i` unique up to conjugacy and permutation; the Grushko deformation space, also relative to a family of subgroups.

*Needs:* §4.10a (group-labelled graphs and finite trivial-edge folding); §4.10 (Induced splittings of subgroups, with finiteness under finite generation); §4.8 (Structure theorem: actions on trees are graphs of groups); §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); §2.8 (Explicit free bases and embeddings from a Stallings graph); Mathlib `Group.rank`.

### 4.12 Collapses, refinements and domination of splittings

Prove the following statement. For a `G`-tree `T` and a `G`-invariant set of edges `E′`, the collapse `T/E′` (contract each edge of `E′`) is a `G`-tree dominated by `T`, whose vertex stabilizers are the stabilizers of the collapsed subtrees. If `T₁` is elliptic with respect to `T₂` (every edge stabilizer of `T₁` is elliptic in `T₂`), there is a refinement `T̂₁` of `T₁` dominating `T₂` (the standard refinement) with a collapse map `T̂₁ → T₁`, in which a subgroup is elliptic iff it is elliptic in both `T₁` and `T₂`; if moreover `G` is finitely generated, both trees are minimal, and the edge stabilizers of `T₂` are finitely generated, `T₂` is obtained from `T̂₁` by finitely many collapses and folds. Moves that preserve the set of elliptic subgroups (collapses of edge orbits whose endpoints are in distinct `G`-orbits and satisfy `G_e = G_{src e}`, their inverse expansions, and slides) preserve the deformation space.

Collapses: quotient of a tree by a `G`-invariant forest is a tree; the induced map is equivariant.
Standard refinement: blow up each vertex `v` of `T₁` into a `G_v`-invariant subtree of `T₂` (`GL`-JSJ Proposition 2.2).
Deformation-space moves: `GL`-JSJ Remark 2.13 and the references there.

Collapsing the edge of `A ∗_C B` gives the trivial tree, dominated by every tree. For the two cyclic splittings of a closed surface group along intersecting curves, neither is elliptic with respect to the other, so no common refinement exists.

Use [GL-JSJ] §2.1, Definition 2.1, Proposition 2.2 and Remark 2.3, pp. 22–23; Definition 2.5 and Lemma 2.6, pp. 23–24; Remark 2.13, p. 26: Ellipticity of one tree with respect to another; the standard refinement dominating the second tree, with its elliptic subgroups (Proposition 2.2(iv)); for finitely generated edge stabilizers the second tree is obtained from it by collapses and folds (Remark 2.3, citing Bestvina–Feighn); collapse maps and the moves relating trees of a deformation space.

*Needs:* §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); §4.8 (Structure theorem: actions on trees are graphs of groups).

### 4.13 Dehn twists of one-edge splittings

Define `GraphOfGroups.dehnTwistAmalgam` as follows. (1) For `G = A ∗_C B` (Mathlib's `Monoid.PushoutI` over `Bool`) and `z ∈` Subgroup.centralizer `C` with `z ∈ B`, the Dehn twist `τ_z` is the automorphism with `τ_z(a) = a` for `a ∈ A` and `τ_z(b) = z b z⁻¹` for `b ∈ B` (well defined since `z` centralizes `C`). (2) For `G = HNNExtension A C₁ C₂ φ` (Mathlib’s convention `t a t⁻¹ = φ(a)` for `a ∈ C₁`) and `z ∈ A` centralizing `C₁`, `τ_z` is the automorphism fixing A pointwise and sending `t` to `t z`; it is well defined because `(t z) a (t z)⁻¹ = t a t⁻¹ = φ(a)` for `a ∈ C₁`. (3) `τ_z` fixes A pointwise, acts on the other vertex group by conjugation, fixes the edge group pointwise, preserves the conjugacy class of every subgroup elliptic in the splitting, and `τ_z ∘ τ_w = τ_{zw}` for `z`, `w` in `B ∩ C_G(C)`; the HNN rule has the same composition order for `z`, `w` in its base centralizer.

Throughout this subsection assume: `z` centralizes the edge group (inside the vertex group indicated).

Define `τ_z` by the universal property `(Monoid.PushoutI.lift, HNNExtension.lift)`, check the relations using that `z` centralizes the amalgamated subgroup, and invert by `τ_{z⁻¹}`.

The public interface should expose the following named results:

- `GraphOfGroups.dehnTwistAmalgam`: `τ_z` for an amalgam, as `a MulEquiv`.
- `GraphOfGroups.dehnTwistHNN`: `τ_z` for an HNN extension, as `a MulEquiv`.
- `GraphOfGroups.dehnTwist_apply_left`: `τ_z a = a` for `a ∈ A`.
- `GraphOfGroups.dehnTwist_apply_right`: `τ_z b = z b z⁻¹` for `b ∈ B`; `τ_z t = t z` in the HNN case.
- `GraphOfGroups.dehnTwist_mul`: `τ_z ∘ τ_w = τ_{z w}`; `τ_1 = id`.
- `GraphOfGroups.dehnTwist_edge`: `τ_z` fixes the edge group pointwise and preserves the conjugacy class of every elliptic subgroup.
- `GraphOfGroups.dehnTwistAmalgam_eq_refl_iff`: With the boundary maps injective and `z∈B` centralizing `C`, the amalgam twist is the identity iff `z` is central in `B`. In particular centrality in `G` suffices.
- `GraphOfGroups.dehnTwistHNN_eq_refl_iff`: With injective associated-subgroup inclusions and `z∈A` centralizing `C₁`, the HNN twist `t↦`tz is the identity iff `z=1`. The representative `dehnTwistHNN_eq_refl_iff` gives this criterion for any automorphism with the prescribed values on A and `t`.

**Checks.**

- `GraphOfGroups.dehnTwist_one`: `τ_1 = MulEquiv.refl`.
- `GraphOfGroups.dehnTwist_surface`: On `⟨a₁,b₁⟩ ∗_{c = [a₁,b₁] = [b₂,a₂]} ⟨a₂,b₂⟩`, `τ_c` maps `a₂ ↦ c a₂ c⁻¹` and fixes `a₁`.
- `GraphOfGroups.dehnTwist_requires_centralizer`: For `z ∈ B` not centralizing `C`, the rule `a ↦ a`, `b ↦ z b z⁻¹` does not respect `c ∈ C` (it sends `c` to both `c` and `z c z⁻¹ ≠ c`), so no homomorphism is defined: the centralizer hypothesis is necessary.
- For an amalgam, central `z∈B` gives the identity twist; injectivity of `B` shows that identity forces `z` to commute with all of `B`.
- For the identity HNN extension `⟨a,t | tat⁻¹=a⟩≅ℤ²`, `z=a` is central but the twist `t↦ta` is nonidentity. Cancellation in `τ_z(t)=t` and injectivity of the base inclusion force `z=1`.

The variant fixing A and conjugating `B` by `z ∈ A` is also an automorphism, but its law is `τ_z ∘ τ_w = τ_{wz}`, since it fixes `z` and `w`. Exchanging A and `B` gives the symmetric convention. For `A = F(a,b)`, `B = F(c,d)`, `C = 1`, choosing `z=a` and `w=b` in this variant gives `τ_a(τ_b(c)) = b a c a⁻¹ b⁻¹`, fixing the order explicitly.

For `F(a,b) = ⟨a⟩ ∗ ⟨b⟩` (`C` trivial) and `z = b`, `τ_b` fixes `a` and `b`: twisting a free splitting by an element of the factor `B` is inner on `B` and the identity on A. For the closed surface group `⟨a₁,b₁,a₂,b₂ | [a₁,b₁][a₂,b₂]⟩` split along `c = [a₁,b₁]`, `τ_c` fixes `a₁`, `b₁` and conjugates `a₂`, `b₂` by `c`: it is the classical Dehn twist along the separating curve.

This interface is used by Layer 10 Makanin–Razborov diagrams: modular groups generated by Dehn twists act on solution sets; Layer 11 generic families: the basic automorphisms of quadratic equations are products of Dehn twists; Layer 6 surface groups: Dehn twists along simple closed curves of surfaces.

Use [GL-JSJ] §9, p. 97, and §5.1.4, p. 46: Dehn twists of a one-edge splitting `A ∗_C B` by a central element of `C` (conjugation on one factor, identity on the other), and twists along simple closed curves of surfaces; this version twists by an element centralizing the edge group, which contains `GL's` case.; [SELA-I] §5, Definition 5.2, p. 62: The modular group of a freely indecomposable limit group is generated by inner automorphisms, Dehn twists along edges of the cyclic JSJ decomposition, Dehn twists along curves in quadratically hanging vertex groups, and generalized Dehn twists of abelian vertex groups.; [TREES] Chapter I, §1.1 and §1.4: Universal properties of amalgams and HNN extensions used to define automorphisms.

*Needs:* §4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); Mathlib `Monoid.PushoutI`; Mathlib `HNNExtension`; Mathlib `Subgroup.centralizer`.

### Examples

For the HNN extension `⟨a,b,t | t⁻¹at=a⟩`, the associated subgroup is `⟨a⟩`. Britton reduction cannot shorten `t⁻¹bt` because `b∉⟨a⟩`, whereas `t⁻¹a²t` reduces to `a²`. The twist `t↦ta`, `a↦a`, `b↦b` is an automorphism with inverse `t↦ta⁻¹`.

### Dependencies

This layer consumes Layers 1–2, including the shared graph inputs to Layer 2. Its direct external suppliers are the pinned declarations specified above.

## Layer 5: Equations, radicals, and algebraic geometry over groups

Algebraic geometry over a group `G` (Baumslag–Myasnikov–Remeslennikov): `G[X]`, algebraic sets, radicals and coordinate groups, with the distinction between the normal closure and the radical; separation versus discrimination; domains, the Zariski topology (whose points are closed when the coefficients reach every point, for instance over `H = G`, but not over every `G`-group) and equational Noetherianity (proved for free groups of finite rank through linearity); irreducible components and the characterisation of irreducibility by discrimination. A radical quotient need not be fully residually free, and Noetherianity is not an algorithm.

### 5.1 `G`-groups and the free `G`-group `G[X]`

Define `GroupAlgGeom.GGroup` as follows. For a group `G`, a `G`-group is a group `H` with an injective homomorphism `ι_H : G →* H`, and a `G`-homomorphism `H →_G K` is a homomorphism `φ` with `φ ∘ ι_H = ι_K`. For a type `X`, `G[X] := Monoid.Coprod G (FreeGroup X) = G ∗ F(X)`, a `G`-group through the left inclusion. For a `G`-group `H` and `v : X → H`, evaluation eval `v : G[X] →* H` is `Monoid.Coprod.lift ι_H (FreeGroup.lift v)`; for `w ∈ G[X]` and `v`, `w(v) :=` eval `v w`. The same evaluation formula is also available for an arbitrary coefficient homomorphism, without bundling it as a `G`-group.

Define the bundled `G`-group structure (a group with an embedding of `G`) and its morphisms.
`G[X]` and eval from Mathlib's `Monoid.Coprod` and `FreeGroup.lift`.

The public interface should expose the following named results:

- `GroupAlgGeom.GGroup`: A group `H` with `ι : G →* H` and a proof of injectivity.
- `GroupAlgGeom.GHom`: `G`-homomorphisms, with identity and composition.
- `GroupAlgGeom.GX`: `G[X] := Monoid.Coprod G (FreeGroup X)`.
- `GroupAlgGeom.eval`: eval `v : G[X] →* H` for a `G`-group `H` and `v : X → H`.
- `GroupAlgGeom.eval_inl`: eval `v (inl g) = ι_H g`.
- `GroupAlgGeom.eval_inr_of`: eval `v` (`inr` (of `x`)) `= v x`.
- `GroupAlgGeom.homEquiv`: `G`-homomorphisms `G[X] →_G H` are in bijection with `X → H` via `v ↦` eval `v`.
- `GroupAlgGeom.eval_comp`: For a `G`-homomorphism `φ : H → K`, `φ ∘` eval `v =` eval `(φ ∘ v)`.

**Checks.**

- `GroupAlgGeom.eval_commutator`: For `G = FreeGroup (Fin 2)`, `X = Unit`, `eval (fun _ => a ^ 2) (x a x⁻¹ a⁻¹) = 1` and `eval (fun _ => b) (x a x⁻¹ a⁻¹) ≠ 1`.
- `GroupAlgGeom.GX_empty`: For `X` empty, `G[X] ≅ G` (`Monoid.Coprod G` (`FreeGroup` Empty) with trivial right factor).
- `GroupAlgGeom.GX_trivial_G`: For `G` trivial, `G[X] ≅ FreeGroup X` and eval agrees with `FreeGroup.lift`.
- `GroupAlgGeom.GX_not_product`: `G[X]` is not `G × F(X)`: in `G[X]` the elements `inl a` and `inr` (of `x`) do not commute for `a ≠ 1`.

For `G = F(a,b)` and `X = {x}`, the element `x a x⁻¹ a⁻¹ ∈ G[X]` evaluated at `x = a²` is 1. eval is the unique `G`-homomorphism `G[X] → H` sending `x` to `v x`.

This interface is used by Layer 5 algebraic sets and radicals: equations are elements of `G[X]` and solutions are evaluations; Layer 3 equation systems: for `G = F(A)`, `G[X]` is identified with `FreeGroup (X ⊕ A)` (both are free on `X ⊔ A`); Layer 7, Layer 8, Layer 11: coordinate groups `G_{R(S)}` are quotients of `G[X]`.

Use [IFT] §2.2, p. 4: `G`-groups, `G`-homomorphisms, and the free `G`-group `G[X] = G ∗ F(X)`, free in the category of `G`-groups.; [ALG] §1 (introduction) and §2, pp. 2–5: `G`-groups, `G`-homomorphisms, `G[X]` and evaluation of its elements at points of `H^n`.

*Needs:* Mathlib `Monoid.Coprod`; Mathlib `Monoid.Coprod.lift`; Mathlib `FreeGroup.lift`; Mathlib `FreeGroup`.

### 5.2 Algebraic sets, radicals and coordinate groups

Define `GroupAlgGeom.V` as follows. Let `H` be a `G`-group and `S ⊆ G[X]`. The algebraic set `V_H(S) ⊆ (X → H)` is `{v | ∀ s ∈ S, s(v) = 1}`. For `Y ⊆ (X → H)`, the ideal `I_H(Y) = {w ∈ G[X] | ∀ v ∈ Y, w(v) = 1}` is a normal subgroup. The radical of `S` over `H` is `Rad_H(S) := I_H(V_H(S))`, and the coordinate group of an algebraic set `Y` is `Γ(Y) := G[X] ⧸ I_H(Y)`; for `Y = V_H(S)` this is `G_{R(S)} := G[X] ⧸ Rad_H(S)`. These quotients have canonical coefficient homomorphisms; `Γ(Y)` is a `G`-group when `Y` is nonempty, and `G_S` is a `G`-group when `S` has a solution in a `G`-group. The empty algebraic set has trivial coordinate group, so its coefficient map need not be injective. When `H = G` one writes `V(S)`, `Rad(S)`.

Define `V`, I as sets and normal subgroups; `Rad` and `Γ` by composition and quotient.

The public interface should expose the following named results:

- `GroupAlgGeom.V`: `V_H(S)` as a Set `(X → H)`.
- `GroupAlgGeom.I`: `I_H(Y)` as a normal subgroup of `G[X]`.
- `GroupAlgGeom.Rad`: `Rad_H(S) = I_H(V_H(S))`.
- `GroupAlgGeom.coordGroup`: `G_{R(S)} = G[X] ⧸ Rad_H(S)`, with its coefficient homomorphism; it is a `G`-group if `V_H(S)` is nonempty.
- `GroupAlgGeom.systemGroup`: `G_S = G[X] ⧸ ncl(S)`, with the surjection `G_S →* G_{R(S)}`.
- `GroupAlgGeom.V_antitone`: `S ⊆ T → V T ⊆ V S`; `Y ⊆ Z → I Z ≤ I Y`.
- `GroupAlgGeom.V_ncl`: `V_H(ncl S) = V_H(S)`; hence `ncl S ≤ Rad_H(S)`.
- `GroupAlgGeom.V_I_V`: `V (I (V S)) = V S`.

**Checks.**

- `GroupAlgGeom.rad_sq`: Over `G = FreeGroup (Fin 2)` and `X = Unit`, `Rad({x²}) = ncl({x})` while `ncl({x²}) ≠ ncl({x})`: the radical is not the normal closure.
- `GroupAlgGeom.V_empty`: `V(∅) =` everything and `Rad(∅) = I(X → G)`, which is `⊥` when `G` is a nonabelian free group and `X` finite (`G[X]` is `G`-separated by `G`).
- `GroupAlgGeom.V_centralizer`: `V({x a x⁻¹ a⁻¹}) =` {`v` | `v ∈` zpowers a} over `F(a,b)` (§1.6).
- `GroupAlgGeom.rad_abelian`: Over `G = ℤ` (abelian), `Rad({x²}) = ncl(x)` as well, but over `G = ℤ/2`, `V({x²})` is everything and `Rad({x²}) = I(G)`. With `G = F(a,b)` fixed, the radical also depends on the `G`-group `H`: over `H = G × ℤ/2` (coefficients `g ↦ (g, 0)`) the point `x = (1, 1)` solves `x² = 1` and does not satisfy `x = 1`, so `x ∉ Rad_H({x²})` although `x ∈ Rad_G({x²})`. `Rad` must carry the group `H` in which points are taken.

Over `G = F(a,b)`, `X = {x}: V({x²}) = {1}` and `Rad({x²}) = ncl(x) ≠ ncl(x²)`, so `G_S ≠ G_{R(S)}`. `V({x a x⁻¹ a⁻¹}) = ⟨a⟩` (the centralizer of a).

This interface is used by Layer 5 Zariski topology and irreducibility: closed sets and their ideals; Layer 6 radicals of quadratic equations: explicit radicals `R(S)` of standard quadratic equations; Layer 8 and Layer 11: coordinate groups of NTQ systems and lifts into `G_{R(S)}`.

Use [ALG] §1, p. 5 (roots, `V_H(S)`); §3.1–3.4, pp. 26–36 (`I_H(Y)`, Lemmas 8–9, the coordinate group `Γ(Y) ≅ G[X]/I_H(Y)`, Corollary 8): Algebraic sets as sets of roots, the annihilating ideal of a set of points, and the coordinate group as the quotient by it.; [IFT] §2.4, pp. 5–6: Systems `S = 1` over `G`, `V_G(S)`, the radical `R(S)` and the coordinate group `G_{R(S)} = G[X]/R(S)`.

*Needs:* §5.1 (`G`-groups and the free `G`-group `G[X]`); Mathlib `Subgroup.normalClosure`.

### 5.3 `G`-separation and `G`-discrimination (residual and full residual properties)

Define `GroupAlgGeom.IsSeparatedBy` as follows. Let `K`, `H` be `G`-groups. `K` is `G`-separated by `H` when for every `k ≠ 1` in `K` there is a `G`-homomorphism `φ : K → H` with `φ k ≠ 1`; `K` is `G`-discriminated by `H` when for every finite set `k₁`, `…`, `k_n` of nontrivial elements of `K` there is a `G`-homomorphism `φ : K → H` with `φ k_i ≠ 1` for all `i`. For `G = 1` these are ‘`K` is residually `H`’ and ‘`K` is fully residually `H`’. Discrimination implies separation; the converse fails.

Two predicates quantified over `G`-homomorphisms.

The public interface should expose the following named results:

- `GroupAlgGeom.IsSeparatedBy`: `K` is `G`-separated by `H`.
- `GroupAlgGeom.IsDiscriminatedBy`: `K` is `G`-discriminated by `H`.
- `GroupAlgGeom.IsDiscriminatedBy.isSeparatedBy`: Discrimination implies separation.
- `GroupAlgGeom.IsDiscriminatedBy.subgroup`: Passing to `G`-subgroups preserves both properties.
- `GroupAlgGeom.isSeparatedBy_iff_iInf_ker`: `K` is separated by `H` iff the intersection of the kernels of `G`-homomorphisms `K → H` is trivial.

**Checks.**

- `GroupAlgGeom.prod_separated_not_discriminated`: `FreeGroup (Fin 2) × FreeGroup (Fin 2)` is separated by `FreeGroup (Fin 2)` through the two projections, but not discriminated: no homomorphism to a free group keeps both `(1, b)` and `(⁅a, b⁆, 1)` nontrivial, since the image of `(1, b)` would commute with the images of `(a, 1)` and `(b, 1)`, forcing them to commute with each other.
- `GroupAlgGeom.self_discriminated`: Every `G`-group `H` is `H`-discriminated by itself through the identity.
- `GroupAlgGeom.Z2_not_separated_by_Z`: `ℤ/2` is not separated by `ℤ (G = 1)`: no nontrivial homomorphism `ℤ/2 → ℤ`.
- `GroupAlgGeom.free_discriminated_compat`: For `G = 1` and `H` free, `IsDiscriminatedBy K H` is Layer 8's `IsFullyResiduallyFree K` when `H` has rank at least 2.

`F × F` (with `G = 1`, `H = F` free nonabelian) is separated but not discriminated by `F`. Every `G`-subgroup of a `G`-group discriminated by `H` is discriminated by `H`.

This interface is used by Layer 5 irreducibility criterion: irreducible algebraic sets have `G`-discriminated coordinate groups; Layer 8 fully residually free groups: the coefficient-free case `G = 1`; Layer 11 generic families: discriminating families of solutions.

Use [ALG] §1, pp. 6–7 (definitions of `G`-separation and `G`-discrimination, Theorem C1): A `G`-group is `G`-separated by `H` when nontrivial elements survive in some `G`-homomorphism to `H`, and `G`-discriminated when finitely many do simultaneously; these are the residual and fully residual properties.; [IFT] §2.5, p. 6: Discrimination and separation of `G`-groups by `G`, and the big powers condition.

*Needs:* §5.1 (`G`-groups and the free `G`-group `G[X]`).

### 5.4 Zero divisors and `G`-domains

Define `GroupAlgGeom.IsZeroDivisor` as follows. In a `G`-group `H`, a nontrivial `x` is a `G`-zero divisor when there is a nontrivial `y ∈ H` with `[x, g y g⁻¹] = 1` for every `g ∈ G` (the image of `G` in `H`). `H` is a `G`-domain when it has no `G`-zero divisors; for `G = H` one says `H` is a domain.

A predicate on `G`-groups.

The public interface should expose the following named results:

- `GroupAlgGeom.IsZeroDivisor`: `x` is a `G`-zero divisor in `H`.
- `GroupAlgGeom.IsGDomain`: No `G`-zero divisors.
- `GroupAlgGeom.IsGDomain.mono`: If `H` is a `G`-domain then `H` is a domain (larger conjugating set).
- `GroupAlgGeom.IsGDomain.of_CSA`: A CSA `H` with a specified embedding of nonabelian `G` is a `G`-domain (ALG Proposition 1).

**Checks.**

- `GroupAlgGeom.free_isDomain`: `FreeGroup (Fin 2)` is a domain.
- `GroupAlgGeom.abelian_not_domain`: A nontrivial abelian group is not a domain (`x = y` works), so `ℤ` is not a domain although `ℤ` is torsion-free: being a domain is not torsion-freeness.
- `GroupAlgGeom.trivial_domain`: The trivial group is a domain (no nontrivial elements).
- `GroupAlgGeom.prod_not_domain`: `F × F` is not a domain: `(a,1)` commutes with every conjugate of `(1,b)`.

A nonabelian free group is a domain (§5.5). `ℤ²` is not a domain: any two nontrivial elements commute.

This interface is used by Layer 5 Zariski topology: for a `G`-domain, nonempty finite unions of algebraic sets are algebraic, and nontrivial coefficients also give the empty algebraic set; Layer 5 irreducibility criterion: hypothesis of ALG Theorem 5; Layer 8 limit groups: nonabelian fully residually free groups are domains (CSA).

Use [ALG] §2.1, Definition 1, p. 14: `G`-zero divisors and `G`-domains.

*Needs:* §5.1 (`G`-groups and the free `G`-group `G[X]`).

### 5.5 CSA groups with nonabelian coefficients are domains; free groups are domains

Prove the following statement. If `G` is nonabelian, `ι : G → H` is injective and `H` is CSA, then `H` is a `G`-domain; in particular every nonabelian free group `F` is a domain and an `F`-domain, and so is every CSA group containing `F`.

Let `x`, `y ≠ 1` with `[x, g y g⁻¹] = 1` for all `g ∈ G` and a, `b ∈ G` with `[a, b] ≠ 1`; `y` and `a y a⁻¹` both lie in the centralizer `M` of `x`, the maximal abelian subgroup containing `x`, so a `M a⁻¹ ∩ M ≠ 1` and malnormality gives `a ∈ M`; likewise `b ∈ M`, so `[a, b] = 1` (ALG Proposition 1).

Injectivity is essential: a trivial coefficient map `F(a,b) → ℤ` makes `ℤ a` CSA group but not an `F`-domain. Noncommuting coefficients must have noncommuting images.

`F(a,b)` is a domain; `F(a,b) × ℤ` is not (it is not CSA).

Use [ALG] §2.1, Proposition 1 and Corollary 1, p. 16: A CSA `G`-group with non-abelian `G` is a `G`-domain.

*Needs:* §5.4 (Zero divisors and `G`-domains); §1.8 (Maximal cyclic subgroups are malnormal; free groups are CSA); §1.7 (CSA groups and commutation transitivity).

### 5.6 The Zariski topology on `H^X`

Define `GroupAlgGeom.zariski` as follows. For a `G`-group `H` and a type `X`, the Zariski topology on `X → H` is the topology whose closed sets are the intersections of families of finite unions of algebraic sets `V_H(S)`, `S ⊆ G[X]` (equivalently `TopologicalSpace.generateFrom` of the complements of algebraic sets). Points `v` with every coordinate in the image of `G` are closed, since `{v} = V({x ι(g_x)⁻¹ | x ∈ X})`; hence the topology is T1 when `ι : G → H` is onto (in particular for `H = G`), but not for every `G`-group (ALG Theorem 3 claims T1 in general; see the coefficient-free counterexample below). If `H` is a `G`-domain and `G` is nontrivial, finite unions of algebraic sets are algebraic, including the empty union, so the closed sets are exactly the algebraic sets and the closure of `Y` is `V(I(Y))`. A nonidentity coefficient defines the empty algebraic set. For `G=1 a G`-domain `H` is trivial; its empty closed set is not algebraic. The topology and algebraic-set closedness require no nontriviality assumption.

Define by `generateFrom`; closedness of points with coordinates `ι(g_x)` from `V({x ι(g_x)⁻¹})`.

The public interface should expose the following named results:

- `GroupAlgGeom.zariski`: The Zariski `TopologicalSpace` on `X → H` (as a type synonym).
- `GroupAlgGeom.isClosed_V`: Algebraic sets are closed.
- `GroupAlgGeom.isClosed_iff_algebraic`: For a `G`-domain `H` with nontrivial `G`, closed iff algebraic.
- `GroupAlgGeom.closure_eq_V_I`: For a `G`-domain `H` with nontrivial `G`, closure `Y = V (I Y)`.
- `GroupAlgGeom.zariski_t1`: The Zariski topology is T1 when `ι : G → H` is surjective (in particular for `H = G`); points with coordinates in `ι(G)` are always closed.
- `GroupAlgGeom.eval_continuous`: Word maps `(X → H) → (Y → H)` given by tuples of elements of `G[X]` are continuous (ALG Lemma 11).

**Checks.**

- `GroupAlgGeom.union_cyclic_closed`: For `H = G = FreeGroup (Fin 2)`, `X = Unit`: zpowers `a ∪` zpowers `b` is algebraic, cut out by the words `[[x,a], g [x,b] g⁻¹]` for `g ∈ G`.
- For `G=H=1` and `X=Unit` every algebraic set is the singleton ambient space, whereas closure `∅=∅` and `V(I(∅))` is the ambient space. Thus a trivial domain does not satisfy closed iff algebraic or closure `Y=V(I(Y))`.
- `GroupAlgGeom.zariski_finite_discrete`: For a finite group `H = G` (with `ι` the identity) every subset of `X → H` (`X` finite) is closed, because points are closed and there are finitely many.
- `GroupAlgGeom.zariski_not_algebraic_abelian`: For `H = G =` Multiplicative `ℤ` (not a domain) and `X = Unit`, the set `{0, 1}` is closed (a union of two points) but not algebraic: every algebraic subset of `ℤ` is `∅`, a point or `ℤ` (the solutions of one linear equation `n x = m`), so the domain hypothesis is necessary.
- `GroupAlgGeom.zariski_t1_points`: For `H = G`, singletons are closed: `{v} = V({x (v x)⁻¹ | x ∈ X})`; for `G = 1` and `H = FreeGroup (Fin 2)` the closure of {of 0} is all of `H`, so T1 needs coefficients for every point (the coefficient-free counterexample below).

Over `F(a,b)` with `X = {x}`, the set `⟨a⟩ ∪ ⟨b⟩` is closed and algebraic. Over `ℤ²` (not a domain) the topology is still defined but closed sets need not be algebraic.

This interface is used by Layer 5 irreducible components: irreducibility in this topology; Layer 8 limit groups: irreducible coordinate groups; Layer 10 finite irreducible-component systems: components are closed sets of this topology.

Use [ALG] §3.2, Theorem 3, p. 32, and Lemma 10, p. 34: The Zariski topology on `H^n` with closed sets the intersections of finite unions of algebraic sets; T1; for a `G`-domain the closed sets are the algebraic sets and the closure of `Y` is `V(I(Y))`.

*Needs:* §5.2 (Algebraic sets, radicals and coordinate groups); §5.4 (Zero divisors and `G`-domains); Mathlib `TopologicalSpace.generateFrom`.

### 5.7 Equationally Noetherian groups

Define `GroupAlgGeom.IsEquationallyNoetherian` as follows. A `G`-group `H` is `G`-equationally Noetherian when for every finite type `X` (equivalently every `n`) and every `S ⊆ G[X]` there is a finite `S₀ ⊆ S` with `V_H(S₀) = V_H(S)`. For `G = H` one says `H` is equationally Noetherian.

A predicate quantifying over finite variable types and subsets of `G[X]`.

The public interface should expose the following named results:

- `GroupAlgGeom.IsEquationallyNoetherian`: Every system has a finite subsystem with the same solutions in `H`.
- `GroupAlgGeom.IsEquationallyNoetherian.exists_finite`: For `S ⊆ G[X]`, a finite `S₀ ⊆ S` with `V S₀ = V S` (existence only, not an algorithm).
- `GroupAlgGeom.IsEquationallyNoetherian.subgroup`: `G`-subgroups of `G`-equationally Noetherian groups are `G`-equationally Noetherian.
- `GroupAlgGeom.IsEquationallyNoetherian.rad_finite`: `Rad_H(S) = Rad_H(S₀)` for the finite subsystem.

**Checks.**

- `GroupAlgGeom.abelian_eqNoetherian`: `ℤ` is equationally Noetherian: every system in one variable over `ℤ` is equivalent to one equation `n x = m`.
- `GroupAlgGeom.finite_eqNoetherian`: Every finite group is equationally Noetherian.
- `GroupAlgGeom.eqNoetherian_rank_zero`: With no variables, an inconsistent system is equivalent to a single nontrivial coefficient equation, whereas a consistent system is equivalent to the empty subsystem; nonemptiness is not assumed.
- `GroupAlgGeom.restrictedProduct_not_eqNoetherian`: The restricted direct product of countably many copies of `FreeGroup (Fin 2)`, as a group over itself, is not equationally Noetherian: the system `{[x, a_n] : n ∈ ℕ}`, with `a_n` the letter a in the `n`-th factor, is equivalent to none of its finite subsystems (ALG Proposition `4(1)`); so the property is not automatic.

Abelian groups are equationally Noetherian (ALG Theorem 1). Equivalently the Zariski topology on `H^n` is Noetherian for all `n` (§5.10).

This interface is used by Layer 5 Noetherian topology and irreducible components: hypothesis of ALG Theorem D1 and Corollary 11; Layer 8 limit groups: finite presentability of coordinate groups uses equational Noetherianity of `F`; Layer 11: finite subsystems in the compatibility arguments.

Use [ALG] §1, p. 5 (definition), §2.2 (Theorem B1, Theorem 1 and Proposition 4), pp. 19–`23: H` is `G`-equationally Noetherian when every system over `G` is equivalent over `H` to a finite subsystem; linear groups over commutative Noetherian rings and abelian groups are examples, infinite restricted products of non-abelian groups are not.

*Needs:* §5.2 (Algebraic sets, radicals and coordinate groups).

### 5.8 Free groups of finite rank are linear over `ℤ`

Prove the following statement. The matrices `[[1, 2], [0, 1]]` and `[[1, 0], [2, 1]]` generate a free subgroup of rank 2 of `SL(2, ℤ)`, so `FreeGroup (Fin 2)` embeds in `Matrix.SpecialLinearGroup (Fin 2) ℤ`; and `FreeGroup (Fin n)` embeds in `FreeGroup (Fin 2)` (sending the `i`-th generator to `b^i a b^{−i}`), hence in `SL(2, ℤ)`, for every `n`.

Ping-pong on `ℤ²` with the cones `{|x| > |y|}` and `{|x| < |y|}`: Mathlib's `Monoid.CoprodI.lift_injective_of_ping_pong` for the free product of two copies of `ℤ` (each factor has at least three elements), transported along Mathlib's `freeGroupEquivCoprodI`; or directly the free-group form `FreeGroup.injective_lift_of_ping_pong`.
The elements `b^i a b^{−i} (0 ≤ i < n)` form a free basis of the subgroup they generate (§2.8 on their Stallings graph).

The image of `⁅a, b⁆` has trace `tr(A)² + tr(B)² + tr(AB)² − tr(A) tr(B) tr(AB) − 2 = 4 + 4 + 36 − 24 − 2 = 18 ≠ 2`, so it is not the identity.

Use [ALG] §2.2, p. 20 and the introduction, p. 5: Free groups are linear; the equational Noetherianity of free groups (Guba) is a special case of Theorem B1.; [LEAN] Mathlib/GroupTheory/CoprodI.lean `(lift_injective_of_ping_pong)`: The ping-pong lemma for free products.

*Needs:* Mathlib `Monoid.CoprodI.lift_injective_of_ping_pong`; Mathlib `FreeGroup.injective_lift_of_ping_pong`; Mathlib `Matrix.SpecialLinearGroup`; Mathlib `FreeGroup`; §2.8 (Explicit free bases and embeddings from a Stallings graph).

### 5.9 Linear groups are equationally Noetherian; so are free groups of finite rank

Prove the following statement. If `H` embeds in `GL(n, R)` for a commutative Noetherian ring `R`, then `H` is equationally Noetherian (with coefficients in `H`, hence `G`-equationally Noetherian for every `G ≤ H`). In particular every free group of finite rank, and every finitely generated free group as an `F`-group, is equationally Noetherian.

A system `S` over `H` in variables `X` becomes a system of polynomial equations over `R` in the matrix entries of the variables together with det `· det⁻¹ = 1`; by the Hilbert basis theorem the ideal it generates is finitely generated, and finitely many members of `S` suffice (ALG Theorem B1, after Bryant and Guba).
Apply to `SL(2, ℤ)` with `R = ℤ` and §5.8.

`FreeGroup (Fin 3)` is equationally Noetherian.

Use [ALG] §2.2, Theorem B1, pp. 19–20 (stated in the introduction, p. 5): Linear groups over commutative Noetherian unital rings are equationally Noetherian; free groups (Guba) as a special case.

*Needs:* §5.7 (Equationally Noetherian groups); §5.8 (Free groups of finite rank are linear over `ℤ`); Mathlib `Matrix.SpecialLinearGroup`.

### 5.10 Noetherian Zariski topology and irreducible components

Prove the following statement. Let `H` be `G`-equationally Noetherian. (1) For every finite `X` the Zariski topology on `X → H` is Noetherian (descending chain condition on closed sets), and conversely Noetherianity for all `n` implies `G`-equational Noetherianity. (2) Every closed set `Y` is a finite union `Y = Y₁ ∪ … ∪ Y_m` of irreducible closed sets with `Y_i ⊄ Y_j` for `i ≠ j`, and this irredundant decomposition is unique up to order (the `Y_i` are the maximal irreducible closed subsets). (3) The coordinate group `Γ(Y)` embeds canonically in `Γ(Y₁) × … × Γ(Y_m)`.

Throughout this subsection assume: `H G`-equationally Noetherian (no domain hypothesis is needed for (1)–(3)).

(1) ALG Proposition 10 and Theorem D1: chains of algebraic sets stabilise.
(2) Mathlib's `NoetherianSpace` gives finitely many irreducible components (ALG Corollary 11).
(3) ALG Proposition `12: I(Y) = ⋂ I(Y_i)`.

Over `F(a,b)`, `V({[[x,a],[x,b]^g] : g}) = ⟨a⟩ ∪ ⟨b⟩` has the two components `⟨a⟩` and `⟨b⟩`, and `Γ` embeds in `Γ(⟨a⟩) × Γ(⟨b⟩)`.

Use [ALG] §3.6, Proposition 10, p. 37; Theorem D1 (introduction p. 9, proof §3.6, p. 38); Corollaries 10–11 and Proposition 12, p. 39: Equational Noetherianity is the descending chain condition on algebraic sets; closed sets are finite unions of uniquely determined irreducible components; the coordinate group embeds in the product of those of the components.

*Needs:* §5.6 (The Zariski topology on `H^X`); §5.7 (Equationally Noetherian groups); Mathlib `TopologicalSpace.NoetherianSpace`; Mathlib `IsIrreducible`.

### 5.11 Irreducibility is discrimination of the coordinate group

Prove the following statement. Let `H` be a `G`-equationally Noetherian `G`-domain, `X` a finite variable type and `Y ⊆ (X → H)` a nonempty closed set. Then `Y` is irreducible if and only if `Γ(Y)` is `G`-discriminated by `H`. Every coordinate `G`-group `Γ(Y)` for nonempty `Y` is `G`-separated by `H`. For systems `S` with `V_H(S)` nonempty, `Rad_H(S)=ncl(S)` if and only if the bundled `G`-group `G_S` is `G`-separated by `H`; a point supplies injectivity of its coefficient map. The representative `radical_eq_normalClosure_iff_separated` uses arbitrary coefficient homomorphisms. For arbitrary `S`, use groups with arbitrary coefficient homomorphisms: `Rad_H(S)=ncl(S)` if and only if the intersection of the kernels of all coefficient-preserving maps `G_S→H` is trivial, including the empty intersection. In particular, for a reducible `Y`, `Γ(Y)` is `G`-separated but not `G`-discriminated by `H`: a radical quotient need not be fully residually `H`.

Throughout this subsection assume: `H a G`-equationally Noetherian `G`-domain, `X` finite and `Y` nonempty for the irreducibility criterion. For nontrivial `G` the closed/algebraic identification uses §5.6 with that hypothesis; for `G=1` the domain `H` is trivial and the nonempty criterion is the singleton case directly. The empty algebraic set has no points and is not irreducible; its trivial radical quotient, with its arbitrary coefficient map, is outside the bundled `G`-group category when `G` is nontrivial.

Separation: `I(Y)` is the intersection of the kernels of the evaluations at points of nonempty `Y` (ALG Corollary 8). On `G_S`, the intersection of coefficient-preserving kernels is `Rad_H(S)/ncl(S)`. This gives the arbitrary-map criterion without asserting coefficient injectivity; consistency gives the bundled version.
Irreducible `⇒` discriminated: for finitely many nontrivial elements, each is nonzero on a proper closed subset's complement, and irreducibility makes the intersection of the nonempty open sets nonempty (ALG Lemma 15).
Discriminated `⇒` irreducible: if `Y = Y₁ ∪ Y₂` properly, pick `w_i ∈ I(Y_i) ∖ I(Y)`; a `G`-homomorphism nonzero on both `w₁`, `w₂` is a point of `Y` outside `Y₁ ∪ Y₂` (ALG Theorem 5).

**Checks.**

- For `S={a,b,x}` over `F(a,b)`, `V(S)=∅` and both the radical and normal closure are all of `F[x]`. The defining quotient is trivial with a noninjective coefficient map, so it is not a bundled `F`-group. There are no coefficient-preserving maps to `F`; their kernel intersection in this trivial quotient is trivial.
- For `S={x²}` over a nonabelian free group, `V(S)={1}` but `Rad(S)=ncl(x)` properly contains `ncl(x²)`; the defining quotient `F∗(ℤ/2)` is not `F`-separated by `F`.
- For `S={x}`, the defining quotient is `F` with its injective coefficient map, `Rad(S)=ncl(x)`, and the bundled separation criterion holds.

`Γ(⟨a⟩ ∪ ⟨b⟩)` over `F(a,b)` is `F`-separated but not `F`-discriminated by `F`. `Γ(V([x, a])) = F ∗_{⟨a⟩} ⟨a, t | [a,t]⟩` is `F`-discriminated by `F` (an extension of a centralizer).

Use [ALG] §3.4, Corollary 8, p. 36; §4, Lemma 15 and Theorem 5, p. 40; Theorem C1, introduction p. 7: Coordinate groups are `G`-separated by `H`; for a `G`-equationally Noetherian `G`-domain a closed set is irreducible iff its coordinate group is `G`-discriminated by `H`; discrimination is separation plus being a domain.; [VAR-I] §1, Lemmas 2–4, p. 5: Over a torsion-free group, separation of `G_S` by `G` gives `R(S) = ncl(S)` (Lemma 3; the converse is immediate because coordinate groups are separated); over an equationally Noetherian CSA group, `V(S)` is irreducible iff `G_{R(S)}` is discriminated by `G` (Lemma 4).

*Needs:* §5.10 (Noetherian Zariski topology and irreducible components); §5.3 (`G`-separation and `G`-discrimination (residual and full residual properties)); §5.4 (Zero divisors and `G`-domains); §5.2 (Algebraic sets, radicals and coordinate groups).

### 5.12 Points as homomorphisms; word maps and changes of coordinates

Prove the following statement. Let `H` be a `G`-group. (1) For a nonempty algebraic set `Y ⊆ (X → H)`, evaluation gives a bijection `Hom_G(Γ(Y), H) ≃ Y`. (2) Word maps (morphisms of algebraic sets given by tuples of elements of `G[X]`) correspond contravariantly to `G`-homomorphisms of coordinate groups, giving an equivalence (anti-equivalence) between nonempty algebraic sets over `H` with word maps and their coordinate `G`-groups with `G`-homomorphisms. (3) A `G`-automorphism `σ` of `G[X]` (a change of coordinates) maps `V_H(S)` bijectively onto `V_H(σ⁻¹(S))` and induces `G_{R(S)} ≅ G_{R(σ⁻¹ S)}`.

(1) A `G`-homomorphism `Γ(Y) → H` is determined by the images of `X`, which form a point of `V(I(Y)) = Y`.
(2) ALG Theorem 4 and Corollary 9.
(3) Specialisation of (2) to invertible word maps. For empty solution sets, changes of coordinates still transport radicals and quotients, using arbitrary coefficient homomorphisms rather than the category of bundled `G`-groups.

**Checks.**

- For `Y={v}`, the coordinate `G`-group evaluates isomorphically onto the subgroup generated by the coefficients and `v`; its `G`-homomorphisms to `H` correspond to this one point.
- For `Y=∅` over nontrivial `G`, `Γ(Y)=1` has a noninjective coefficient map and is outside the bundled `G`-group category.
- An invertible substitution carries an inconsistent system to another empty solution set; both trivial quotients are compared through their arbitrary coefficient maps.

For `Y = V([x, a])` over `F(a,b)`, `Hom_F(Γ(Y), F) ≃ ⟨a⟩`. The change of coordinates `x ↦ x a` sends `V([x, a])` to itself.

Use [ALG] §3.5, Lemma 13, Proposition 9, Lemma 14, Corollary 8, Theorem 4 and Corollary 9, pp. 35–37: Polynomial (word) maps between algebraic sets, coordinate groups as groups of polynomial functions, and the equivalence of the category of algebraic sets with that of coordinate groups.; [IFT] §2.4, pp. 5–6: Points of `V(S)` correspond to `G`-homomorphisms `G_{R(S)} → G`.

*Needs:* §5.2 (Algebraic sets, radicals and coordinate groups); §5.1 (`G`-groups and the free `G`-group `G[X]`); §5.3 (`G`-separation and `G`-discrimination (residual and full residual properties)).

### Examples

Over `F(a,b)`, the system `x²=1` has the single solution `x=1` by torsion-freeness. Its radical is the normal closure of `x` in `F[x]`, although the defining normal closure of `x²` is smaller. Thus the coordinate group is `F`, while the group presented by the original relator alone is `F∗(ℤ/2)`. Radicals and defining relators must remain distinct.

### Dependencies

This layer consumes Layer 1, Layer 3. Library suppliers are the declarations specified above; no other roadmap is required.

## Layer 6: Surface groups and quadratic equations

Surface groups are given by presentations with their peripheral elements and connected to graphs of groups; quadratic equations, their standard forms, regularity and radicals follow Kharlampovich–Myasnikov, with the low-genus exceptions kept. Quadratically hanging vertices are defined here; rigidity is relative to a splitting family and belongs to Layer 10.

### 6.0a Compact polygonal surfaces and their boundary incidence

**Target.** Define `PolygonalComplex` by a finite Serre one-skeleton and a finite nonempty family of nonempty closed face traversals. A face is a polygon with its sides attached to the indicated darts, linearly on each side. Distinct occurrences of the same edge or vertex remain distinct face corners (`PolygonalComplex.Corner`). At a corner, the incoming side reversed and the outgoing side are its two outgoing germs (`PolygonalComplex.cornerEnds`). Form `PolygonalComplex.vertexLink` as the Serre multigraph whose vertices are outgoing germs at the given vertex and whose edge pairs are the face corners there. Count degree by link darts (`PolygonalComplex.linkDegree`), so a link loop contributes two. `PolygonalComplex.HasSurfaceLink` says the link is nonempty and connected, with either all degrees two or exactly two degree-one endpoints and all other degrees two. These are respectively a circle and an interval, including one-edge circles and intervals.

The Lean carrier `PolygonalComplex` allows arbitrary vertex, edge and face types; `PolygonalComplex.linkDegree` and `PolygonalComplex.HasSurfaceLink` require a finite face type. `SurfaceModel` supplies finite types for all three.

`SurfaceModel` bundles such a complex with nonempty connected one-skeleton and the surface-link condition at every vertex. Prove that every edge occurs once or twice among the unoriented face sides; the once-incident sides form its boundary (`SurfaceModel.boundaryDarts`, `SurfaceModel.boundary_incidence`). Prove that every boundary vertex has exactly two boundary germs and every boundary component is a circle. `SurfaceModel.boundaryClass` assigns a boundary dart to its component; `SurfaceModel.BoundaryCircuit` records a nonempty reduced circuit traversing every unoriented edge of that component exactly once. Prove `SurfaceModel.boundaryCircuit_exists`. `SurfaceModel.BoundaryVertex` retains only vertices on these sides, and `SurfaceModel.BoundaryComponent` is their edge-connected component quotient. `SurfaceModel.boundary` records the resulting boundary Serre graph and its cyclic traversals. Set `SurfaceModel.eulerChar` to #vertices−#dart-pairs+#faces. `SurfaceModel.IsOrientable` means that the faces can be oriented so that each twice-incident side is traversed in opposite directions. Prove invariance under incidence isomorphisms, reversal of face orientations and cyclic changes of face starting points, and prove that the model has a finite triangulated refinement. The link condition excludes pinched vertices; no topological classification or mapping-class-group theory is an input. `PolygonalComplex.polygon` supplies one-vertex polygon examples, and `SurfaceModel.disc`, `SurfaceModel.torus` and `SurfaceModel.projectivePlane` are their valid incidence models.

**Checks.**

- A triangulated disc has interval links at boundary vertices, circle links at interior vertices, one boundary traversal and `χ=1`.
- The torus and projective-plane polygons have circle links; the torus is orientable with `χ=0`, the projective plane nonorientable with `χ=1`. The sphere digon `aa⁻¹` has two vertices, one edge and one face, hence `χ=2`.
- A pair of pants has three boundary components and `χ=−1`. Identifying unrelated boundary vertices makes a disconnected link and is rejected, even if every edge still has one or two incident faces.
- Infinitely many copies of the face `aa⁻¹` on the one-loop rose give infinitely many incidences at each germ. `Nat.card` of either incidence fibre is zero; the finite-face hypotheses exclude this complex from the degree and surface-link declarations.

Sources: [SURFACES] Chapter 6, Definitions 6.1–6.2, pp. 80–83 (polygons, corners and boundary vertices), Definition 6.4, pp. 86–88 (orientation and `χ`), and Proposition 6.1, pp. 86–87 (triangulated refinement); [HATCHER] §2.1 (finite cell incidence).

*Needs:* §§2.1–2.1a (Serre incidence and shared connectivity); elementary finite sets, lists and quotients from Mathlib.

### 6.`0b` Polygonal moves, normal forms and boundary transport

**Target.** Define `SurfaceModel.Move` on polygonal presentations by edge subdivision `e↦uv` (and `rev(e)↦rev(v)rev(u)`, with a new intervening vertex), face splitting `XY↦Xd,d⁻¹Y` along a fresh side, their inverses, incidence relabellings, cyclic changes and reversal of a face orientation. Require the new sides and face occurrences to be fresh, the inverse face split to join distinct faces, and every endpoint to retain the indicated corner incidence. Prove these moves preserve the surface-link condition, orientability and `χ`, and induce boundary-component bijections carrying traversals to their subdivided paths. Use their finite equivalence closure for normal-form existence: every connected model is equivalent to an orientable handle or nonorientable square polygon with one hole block `c_j p_j c_j⁻¹` per boundary component. The connecting arcs `c_j` retain the boundary vertices. The closed orientable genus-zero form is the sphere digon `aa⁻¹`. The nonorientable genus is positive; if `m` is the number of holes, `χ=2−2g−m` or `2−g−m`, respectively.

Prove this normal-form theorem locally, including the elimination of adjacent inverse pairs, vertex and face reductions, and extraction of handles or crosscaps from the paired interior sides. Each reduction is a finite sequence of the specified moves, preserving the marked boundary components. A collapse used only for a group presentation need not be a surface move. The representative signatures `presentation_adjoin_edge` and `presentation_split_face` give the associated algebraic presentation isomorphisms. `SurfaceModel.presentation_normalForm` records the resulting standard group presentation, orientability, boundary count, Euler characteristic and the peripheral comparison of §6.1a.

**Checks.**

- Torus-side subdivision replaces its generator by a product, preserves `χ=0` and retains circle links at the new vertices.
- Splitting a disc face introduces an interior side occurring in both new faces and retains its single boundary traversal. Splitting against a fresh side differs from imposing an additional unrelated relator.
- Pair-of-pants normalization retains three separate boundary traversals and their connecting arcs; identifying the three hole vertices before the link comparison is invalid.

Sources: [SURFACES] Chapter 6, Definition 6.3, pp. 84–85 (the two subdivisions), Proposition 6.1, pp. 86–87, Definition 6.5, pp. 88–91 (normal forms) and Lemma 6.1, pp. 92–95 (reduction to normal form).

*Needs:* §6.0a (polygonal models and corner links); §2.2 (spanning trees); Mathlib `FreeGroup` and `PresentedGroup` for the associated presentation isomorphisms.

### 6.`0c` Face presentations and subdivision invariance

**Target.** For a finite connected based polygonal complex `C` and a spanning tree `T` in its one-skeleton, define `PolygonalComplex.faceRelators` to consist of the reversal and tree relations of §2.2 and the dart word of every face. `PolygonalComplex.FacePresentation` is the corresponding `PresentedGroup`; for a surface model write `SurfaceModel.faceGroup`. Prove `PolygonalComplex.facePresentation_quotient`: this group is the graph path group modulo the normal closure of the based face traversals. Base each face by the tree path to its starting vertex; tree edges disappear in the presentation. Prove `PolygonalComplex.facePresentation_tree_independent`, and compatibility with arbitrary changes of connecting paths, starting corners and orientations. Connecting-path changes conjugate relators and boundary words; orientation reversal inverts them.

Prove subdivision invariance using §6.0b's edge and face isomorphisms. Track every marked boundary traversal through these maps, with composition and inverse compatibility. The representative `SurfaceModel.boundaryWord` sends a boundary circuit to the chosen face presentation. `SurfaceModel.MarksBoundary` requires a bijection from actual boundary components to the standard peripheral indices and takes each circuit to that peripheral element up to conjugacy and inversion. These are combinatorial presented-group results and require no topological fundamental-group comparison. They supply the presentation and peripheral comparison in §6.1a.

**Checks.**

- For a disc the face relation kills the boundary loop, giving the trivial group and trivial peripheral subgroup.
- For a torus the face group is `⟨a,b | [a,b]=1⟩`; subdividing a side substitutes the same product in the relator and in its generator image.
- For a pair of pants the group is `F(p₁,p₂)` with `p₃=(p₁p₂)⁻¹`, retaining all three boundary conjugacy classes.
- For the projective plane the group is `⟨c | c²=1⟩`, rather than the torus group. A face traversal based by a different path gives a conjugate relator, not an additional independent relation.

Sources: [HATCHER] §1.2, Proposition 1.26, pp. 50–52 (normal closure of based attaching loops); [SURFACES] Chapter 6, Definition 6.3, pp. 84–85 (subdivisions) and §6.6 (edge-path presentations). The combinatorial quotient statement follows from the universal properties of the two presentations.

*Needs:* §2.2 (local graph path group and tree presentation); §§6.0a–6.0b; Mathlib `PresentedGroup` and `Subgroup.normalClosure`.

### 6.`0d` Essential curves, proper arcs and cutting

**Target.** On the local polygonal carrier of §6.0a, define `SurfaceModel.TwoSidedCurve` as a nonempty simple cyclic edge path in the interior of a subdivision, with an annular strip of faces as its regular neighborhood. Simplicity means distinct cyclic vertices and unoriented edges; the strip has orientable genus-zero normal form with two boundaries. Define `SurfaceModel.ProperArc` as a simple edge path after subdivision with distinct boundary endpoints and interior disjoint from the boundary, with a disc strip neighborhood meeting the original boundary in two end segments. Record these neighborhoods by finite face and corner data and the normal-form comparisons of §6.0b. Curves and arcs with different subdivisions are transported to a common refinement by that subsection's moves.

Construct `SurfaceModel.cutAlong` for a two-sided curve and `SurfaceModel.cutAlongArc` for a proper arc. Both operations, including their curve and arc carriers, are owned here. Their values are finite nonempty families of connected `SurfaceModel` pieces, with incidence maps to the subdivided original model: a cut can disconnect the surface. Duplicate each cut side, distribute its incident faces to its two copies, and split the vertex links at the cut germs. At an interior path vertex a circle link splits into two interval links; at a proper-arc endpoint the interval link splits at its interior cut germ. Prove that these are exactly the resulting corner links and that every piece satisfies §6.0a's surface-link condition. Faces and their corner occurrences are retained, and identifying the paired cut sides and their endpoints recovers the original subdivided incidence model up to isomorphism.

For a finite family of curves and arcs on a common refinement with pairwise disjoint strip neighborhoods, including distinct arc endpoints, construct the simultaneous cut. Prove that it agrees up to incidence isomorphism with successive cuts in any order, transporting each remaining path and neighborhood. Prove compatibility with edge and face subdivisions by common refinement; the comparisons preserve the projection, pairing of cut sides, and boundary markings. Cutting along the empty family returns the original model. The sum of the pieces' Euler characteristics is `χ` of the original plus the number of arcs. Each closed curve creates two complete boundary circuits. Original boundary circles avoiding arc endpoints correspond bijectively to the distinguished untouched boundary circuits; circles hit by endpoints are instead split into marked segments, with their cyclic order and reconnections recorded in the new boundary circuits.

Define `SurfaceModel.EssentialCurve` as a two-sided curve for which neither side of the cut bounds a disc piece nor cobounds an annulus piece with an original boundary. All cutting operations use the preceding local cut models. This subsection also owns marked boundary transport, the face-group regluing comparison, infinite order and the monomorphic edge maps. In §6.0c's presentations, prove that regluing the paired circles or intervals, with connecting paths and stable letters as required, recovers the original face group and all original boundary conjugacy classes. The two boundary circuits above a curve map to its class and its inverse, up to the chosen connecting-path conjugations. For an essential curve in a model with `χ<0`, prove that this class has infinite order in the original and the adjacent cut-piece face groups; hence both cyclic edge maps are injective. Proper-arc gluings have trivial edge groups. These comparisons supply the simultaneous dual Bass–Serre splittings of §§6.3 and 6.10.

**Checks.**

- A pair of pants has no essential closed curve; each simple interior closed curve bounds a disc or is boundary-parallel. A disc-bounding interior curve is two-sided but has trivial face-group class, so two-sidedness alone cannot supply a monomorphic cyclic edge.
- A primitive nonseparating curve on a torus is two-sided and essential; cutting it gives an annulus with two new boundary traversals.
- The core of `a M`öbius band has `a M`öbius neighborhood and is excluded by the two-sided condition; the core of an annulus is excluded by boundary parallelism.
- A proper chord of a disc cuts it into two discs; its endpoints split boundary traversals and their interval links.
- A proper arc joining the boundary circles of an annulus cuts it into a disc.
- A proper arc joining two distinct boundary circles of a pair of pants cuts it into an annulus and retains the third boundary circle.
- Two disjoint separating curves in a closed genus-three model give three connected pieces. Simultaneous cutting and either order of successive cuts give the same paired boundary circuits; subdividing a cut side only subdivides the corresponding two boundary copies.
- The empty cut family returns the original model and its boundary markings; a separating curve returns two pieces rather than a connected surface with their vertices identified.

Sources: [GL-JSJ] §5.1.2, pp. 42–43 (essential two-sided curves and dual splittings); [SURFACES] Gallier–Xu, Chapter 6, Definitions 6.1–6.3, pp. 80–85 (face incidence, circle/interval vertex links and subdivisions); [HATCHER] §1.2, Proposition 1.26, pp. 50–52 (based face presentations under gluing). The local cutting and compatibility assertions follow by separating corner incidences along the specified strips; regluing identifies exactly the duplicated sides.

*Needs:* §§6.0a–6.0b supply the local curve/arc incidence carrier, links, subdivisions and normal forms for both cut operations; §6.0c supplies the face-group and marked-boundary comparisons. The infinite-order and monomorphic edge-map conclusions also use §6.1a, §6.2 (boundary groups) and §4.5 (amalgam and HNN normal forms). The curve carriers and combinatorial cutting, including proper arcs and disjoint families, precede those group conclusions and §6.1a.

### 6.1 Surface groups with boundary and their peripheral structure

Define `SurfaceGroup.orientable` as follows. For `g`, `m ∈ ℕ`: the orientable surface group `S⁺(g, m)` is `PresentedGroup` on generators `a₁`, `b₁`, `…`, `a_g`, `b_g`, `p₁`, `…`, `p_m` with the single relator `[a₁,b₁] ⋯ [a_g,b_g] p₁ ⋯ p_m` (commutator convention `[x, y] = x⁻¹ y⁻¹ x y`), and the non-orientable surface group `S⁻(g, m)`, `g ≥ 1`, has generators `c₁`, `…`, `c_g`, `p₁`, `…`, `p_m` and relator `c₁² ⋯ c_g² p₁ ⋯ p_m`. The peripheral (boundary) elements are `p₁`, `…`, `p_m`, and the boundary subgroups are their cyclic subgroups and conjugates. The Euler characteristic is `χ = 2 − 2g − m` (orientable) or `χ = 2 − g − m` (non-orientable). Closed surface groups are the case `m = 0`.

Instances of Mathlib's `PresentedGroup` with a one-element relator set; the peripheral tuple as a function `Fin m →` the group.

The public interface should expose the following named results:

- `SurfaceGroup.orientable`: `S⁺(g, m)` as `a PresentedGroup`.
- `SurfaceGroup.nonorientable`: `S⁻(g, m)` as `a PresentedGroup`.
- `SurfaceGroup.peripheral`: The boundary elements `p_i`, and the boundary subgroups zpowers `p_i`.
- `SurfaceGroup.eulerChar`: `χ` as an integer, `2 − 2g − m` or `2 − g − m`.
- `SurfaceGroup.lift`: Homomorphisms out of `S±(g, m)` correspond to tuples satisfying the relator `(PresentedGroup.toGroup)`.
- `SurfaceGroup.abelianization`: The abelianisation of `S⁺(g, 0)` is `ℤ^{2g}`; of `S⁻(g, 0)` is `ℤ^{g−1} × ℤ/2`; of `S±(g, m)`, `m ≥ 1`, free abelian of rank `1 − χ`.

**Checks.**

- `SurfaceGroup.torus`: `S⁺(1, 0) ≃*` Multiplicative `(Fin 2 → ℤ)`.
- `SurfaceGroup.projectivePlane`: `S⁻(1, 0)` has order 2.
- `SurfaceGroup.disc`: `S⁺(0, 1)` is trivial (the relator is `p₁`), and `S⁺(0, 0)` is trivial (the sphere).
- `SurfaceGroup.pants_free`: `S⁺(0, 3)` is free of rank 2 on `p₁`, `p₂` (`IsFreeGroup` with `FreeGroupBasis`), agreeing with §6.2.
- `SurfaceGroup.klein_not_torus`: `S⁻(2, 0)` (Klein bottle) has abelianisation `ℤ × ℤ/2` and is not isomorphic to `S⁺(1, 0)` although both have `χ = 0`: the orientability type is part of the data.

`S⁺(1, 0) ≅ ℤ² (χ = 0)`; `S⁻(1, 0) ≅ ℤ/2` (the projective plane, `χ = 1`); `S⁺(0, 3)` is free of rank 2 with `p₃ = (p₁ p₂)⁻¹` (pair of pants, `χ = −1`). `S⁺(2, 0)` is the genus-two surface group, `χ = −2`.

This interface is used by Layer 6 quadratic equations: standard quadratic equations are surface relators with coefficients; Layer 6 QH vertices: vertex groups of QH type are surface groups with boundary; Layer 10 JSJ of limit groups: flexible vertices are surface (QH) vertices; Layer 11 basic automorphisms: automorphisms of `S⁺(g, m)` fixing boundary elements up to conjugacy.

Use [IFT] §2.7, Definition 3, p. 8: Standard quadratic words of types (1)–(4): products of commutators or squares, followed by conjugates of coefficients; the left sides of surface relators with boundary.; [GL-JSJ] §5.1, Definition 5.1, p. 42, and §5.1.2, pp. 42–43: Fundamental groups of compact surfaces (and 2-orbifolds) with boundary subgroups, and their Euler characteristic; hyperbolic exactly when `χ < 0`.; [VAR-I] §1, Definition of standard quadratic equations and Lemma 6, pp. 8–9: Standard forms of quadratic equations over `G`, whose coefficient-free parts are surface relators.

*Needs:* Mathlib `PresentedGroup`; Mathlib `FreeGroup`.

### 6.1a Surface models, presentations and peripheral comparison

For a finite connected nonempty polygonal surface model with possibly empty boundary (§6.0a), construct `SurfaceGroup.modelEquiv`: its local `SurfaceModel.faceGroup`, identified with the Serre quotient by §6.0c, is isomorphic to `S±(g,m)`, where `g`, `m` and the orientability type come from its polygonal normal form. Use a spanning tree in the one-skeleton and §6.0c's face presentation, then §6.0b's surface-preserving moves. Transport each boundary traversal, based by a connecting path, to a conjugate of `p_j` or `p_j⁻¹`, bijectively on boundary components. Prove invariance of this peripheral comparison under those moves and subdivisions. A model with several boundaries retains distinct boundary vertices and their links before collapsing the connecting tree; the resulting one-vertex presentation is not itself required to be a surface map.

This group and peripheral comparison uses the surface carrier, vertex links, moves and essential two-sided curves of §§6.0a–6.0d. Cutting along such a curve or proper arc gives the peripheral group identifications used in §6.3. In §6.4, finite `coset` lifts of the model must preserve the vertex-link condition; their boundary traversals correspond to `H`-conjugacy classes `H∩x⟨p_j⟩x⁻¹`, indexed by double cosets. No comparison with a topological fundamental-group carrier is required.

**Checks.**

- A pair-of-pants model gives `F(p₁,p₂)`, with `p₃=(p₁p₂)⁻¹` and three distinct peripheral conjugacy classes; collapsing connecting arcs does not identify its boundary components.
- The torus polygon gives `⟨a,b | [a,b]=1⟩`, and subdividing a side preserves the presented group and `χ=0`.
- The projective-plane model compares with `S⁻(1,0)=⟨c | c²=1⟩` in both presentations; its nonorientability is retained.
- A disc model gives the trivial group and trivial boundary subgroup; its boundary map from `ℤ` is not injective, so it cannot supply a monomorphic cyclic edge in §6.3.
- A one-vertex relator diagram for a pair of pants cannot replace the surface model in a cover argument unless its actual vertex links and boundary components satisfy the surface-map conditions.

Sources: [SURFACES] Gallier–Xu, *A Guide to the Classification Theorem for Compact Surfaces*, Chapter 6, Definitions 6.1 and 6.5 and Theorem 6.1 (polygonal models, boundary normal forms and moves); [HATCHER] §1.2 (cellular presentations) and §1.3, Theorem 1.38 (covers and subgroups), for the presentation and `coset`-lift comparisons.

*Needs:* §2.2 (Maximal trees exist and the fundamental group of a graph is free); §6.1 (Surface groups with boundary and their peripheral structure); §§6.0a–6.0c (compact models, normal forms and face presentations). Cutting applications use §6.0d's carrier and cut models; its infinite-order conclusion follows §6.2.

### 6.2 Surface groups with boundary are free; closed ones are not

Prove the following statement. (1) For `m ≥ 1`, `S±(g, m)` is free of rank `1 − χ`, with free basis `a₁`, `b₁`, `…`, `a_g`, `b_g`, `p₁`, `…`, `p_{m−1}` (respectively `c₁`, `…`, `c_g`, `p₁`, `…`, `p_{m−1}`); `p_m` is the inverse of the product of the others in the relator order. (2) For `m = 0` and `χ ≤ 0`, `S±(g, 0)` is not free: for the orientable case, a free group of rank `2g` with this abelianisation would make the defining surjection `FreeGroup (Fin 2g) → S⁺(g, 0)` an isomorphism (free groups of finite rank are Hopfian), contradicting the nontriviality of the relator; for the non-orientable case the abelianisation has torsion.

(1) Eliminate `p_m` using the relator (a Tietze move), leaving no relator.
(2) Free groups of finite rank are Hopfian: use the residual-finiteness supplier specified above (Tau Ceti `FreeGroup.instResiduallyFinite`); finitely generated residually finite groups are Hopfian (Malcev's argument with the finitely many homomorphisms to each finite group); the relator is nontrivial by Mathlib `FreeGroup.toWord_eq_nil_iff`.

`S⁺(0, 3) ≅ F₂` and `S⁺(1, 1) ≅ F₂` (both `χ = −1`). `S⁺(1, 0) ≅ ℤ²` is not free.

Use [GL-JSJ] §5.1, p. 42: Compact surfaces with nonempty boundary have free fundamental group; closed hyperbolic surface groups are one-ended relative to their boundary subgroups (Proposition 5.4 and the remark after Corollary 5.6).; [IFT] §2.7, Definition 3, p. 8: The surface relators of standard quadratic equations.

*Needs:* §6.1 (Surface groups with boundary and their peripheral structure); §2.8 (Explicit free bases and embeddings from a Stallings graph); §5.8 (Free groups of finite rank are linear over `ℤ`); Mathlib `Group.ResiduallyFinite`; Mathlib `IsFreeGroup`.

### 6.3 Cutting and gluing: surface groups as graphs of groups

Prove the following statement. (1) Gluing: for `g = g₁ + g₂`, `S⁺(g, m₁ + m₂)` is the amalgam `S⁺(g₁, m₁ + 1) ∗_{ℤ} S⁺(g₂, m₂ + 1)` along the last boundary elements (with inverse orientation), provided both boundary maps `ℤ → S⁺(g_i,m_i+1)` are injective; neither piece is a disc. For `g ≥ 1`, `S⁺(g, m)` is the HNN extension of `S⁺(g − 1, m + 2)` identifying two boundary elements (a non-separating curve); the non-orientable variants use essential two-sided curves and injective boundary maps as well. (2) Each of these is the fundamental group of a one-edge graph of groups (§4.5) whose vertex groups are surface groups with boundary and whose edge group is the boundary subgroup of the cut curve; the peripheral structure of the result is the union of the remaining boundary subgroups. (3) Iterating, every `S±(g, m)` with `χ < 0` is `π₁` of a graph of groups whose vertex groups are pairs of pants `S⁺(0, 3)` (and, for non-orientable surfaces, `S⁻(1, 2)`) and whose edge groups are infinite cyclic boundary subgroups. (4) Closed surface groups with `χ ≤ 0` are torsion-free: each is `π₁` of a one-edge graph of groups with free vertex groups (cut along a non-separating two-sided curve), and a finite subgroup of `π₁` of a graph of groups fixes a vertex of the Bass–Serre tree, hence is conjugate into a vertex group.

Throughout this subsection assume: Genus and boundary counts as indicated; infinite-order boundary elements for the cyclic edge maps; `χ < 0` for (3). A disc has trivial boundary element, so gluing a disc is a quotient by a boundary word, not an amalgam along a monomorphic `ℤ` edge.

Write the relator as a product of the relators of the pieces and apply Tietze transformations; compare universal properties with §4.5.

`S⁺(2, 0) = S⁺(1, 1) ∗_{ℤ} S⁺(1, 1)` along `[a₁, b₁] = [b₂, a₂]` (separating curve). `S⁺(2, 0)` is also an HNN extension of `S⁺(1, 2) ≅ F₃` (non-separating curve).

Use [GL-JSJ] §5.1.2, pp. 42–43: Any essential two-sided simple closed curve (geodesic) on a surface defines a cyclic splitting of its fundamental group relative to the boundary subgroups, and families of disjoint curves give dual graphs of groups.; [TREES] Chapter I, §4.1 and §5.1: Amalgams and HNN extensions as fundamental groups of segments and loops of groups.

*Needs:* §6.1 (Surface groups with boundary and their peripheral structure); §6.1a (Surface models, presentations and peripheral comparison); §6.2 (Surface groups with boundary are free; closed ones are not); §6.0d (local curve and arc cut models, boundary transport and face-group regluing); §4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); §4.2 (The fundamental group of a graph of groups, via paths and via a maximal tree); §4.9 (Elliptic–hyperbolic dichotomy and fixed points of finitely generated groups); §4.7 (The Bass–Serre tree of a graph of groups).

### 6.4 Finite-index subgroups of surface groups and the Euler characteristic

Prove the following statement. Let `Σ = S±(g, m)` and `H ≤ Σ` of finite index `n`. Then `H`, with the induced peripheral structure (the subgroups `H ∩ x⟨p_j⟩x⁻¹`, one `H`-conjugacy class for each double `coset H x ⟨p_j⟩`), is isomorphic to a surface group `S±(g′, m′)` with its peripheral structure, where `χ′ = n · χ`, `m′` is the number of such double cosets, and the orientability type is orientable when `Σ` is orientable. For `m ≥ 1` this refines the Schreier formula: rank `H − 1 = n` (rank `Σ − 1`).

Throughout this subsection assume: `[Σ : H] = n` finite.

Start with a polygonal surface model before collapsing a connecting tree: give distinct boundary components distinct vertices, pair the handle or crosscap sides, and retain arcs joining the boundary components. Use the `coset` permutation action `Σ →` Sym(`Σ/H`) to lift each oriented side and polygon to `n` sheets. The relator ensures that each lifted polygon closes; paired interior sides occur twice, boundary sides once, and lifted vertex links are the same circles or intervals as downstairs. This proves that the lifted complex is a surface. The one-vertex presentation obtained by collapsing connecting arcs is only a group presentation; for several boundary components it need not itself be a surface.
Bring its polygon gluing to a surface normal form by §6.0b's moves, and apply §6.1a's presentation and peripheral comparison; this gives the standard presentation of `H` and the boundary count.
`χ` is the alternating count of cells, multiplied by `n` under the cover; for `m ≥ 1` compare with §2.11.

The index-2 subgroup of `S⁺(2, 0)` (kernel of a map to `ℤ/2`) is `S⁺(3, 0): χ = −4 = 2 · (−2)`. The orientable double cover of `S⁻(3, 0) (χ = −1)` is `S⁺(2, 0) (χ = −2)`.

Use [GL-JSJ] §5.1, Definition 5.1, p. 42: The Euler characteristic of a compact surface (or orbifold) and its role in hyperbolicity; finite-index subgroups correspond to finite covers.; [KM02] §8, Proposition 8.3 and Corollary 8.4, pp. 20–21: Finite-index subgroups of a free group (the case `m ≥ 1`, where `Σ` is free) correspond to finite `X`-regular subgroup graphs, the index is the number of vertices, and Schreier's formula holds.

*Needs:* §6.1 (Surface groups with boundary and their peripheral structure); §6.1a (Surface models, presentations and peripheral comparison); §6.3 (Cutting and gluing: surface groups as graphs of groups); §2.11 (Finite index and the Schreier formula); §2.7 (Stallings correspondence: subgroups and based folded core graphs).

### 6.5 Quadratic words, standard quadratic equations and their solutions

Define `GroupAlgGeom.Quadratic.IsQuadratic` as follows. Let `G` be a group and `S ⊆ G[X]`. `S` is quadratic when every variable occurring in `S` occurs at most twice (as `x` or `x⁻¹`) in the reduced forms of the elements of `S`, and strictly quadratic when exactly twice. A standard quadratic equation over `G` is one of: (1) `∏_{i=1}^{n} [x_i, y_i] = 1`, `n > 0`; (2) `∏_{i=1}^{n} [x_i, y_i] ∏_{j=1}^{m} z_j⁻¹ c_j z_j d = 1`, `n`, `m ≥ 0`, `n + m ≥ 1`; (3) `∏_{i=1}^{n} x_i² = 1`, `n > 0`; (4) `∏_{i=1}^{n} x_i² ∏_{j=1}^{m} z_j⁻¹ c_j z_j d = 1`, `n > 0`, `m ≥ 0`, with `d`, `c_j` nontrivial elements of `G`; types (1)–(2) are orientable and (3)–(4) non-orientable of genus `n`. Atoms are `[x, y]`, `x²`, `z⁻¹ c z`; the atomic rank `r(S)` is the number of atoms. A solution `φ` of a standard equation written `r₁ ⋯ r_k d = 1 (k ≥ 2)` is degenerate if some `r_i^φ = 1`, commutative if `[r_i^φ, r_{i+1}^φ] = 1` for all `i`, and in general position if `[r_i^φ, r_{i+1}^φ] ≠ 1` for all `i`. `S` is consistent when it has a solution in `G`.

Predicates on elements of `G[X]` (occurrence counts in the reduced form of `Monoid.Coprod` words) and an inductive description of the four standard shapes. The orientation case split uses type (2) for every standard coefficient-conjugacy word with no squares or commutators, and types (3)–(4) only for positive square genus. In particular `GroupAlgGeom.Quadratic.Standard` carries `n > 0` in its type-(4) constructor. This disambiguates the overlapping zero-square notation in [IFT] Definition 3 before forming a surface or basic sequence.

The public interface should expose the following named results:

- `GroupAlgGeom.Quadratic.IsQuadratic`: Every variable occurs at most twice.
- `GroupAlgGeom.Quadratic.IsStrictlyQuadratic`: Every occurring variable occurs exactly twice.
- `GroupAlgGeom.Quadratic.Standard`: The standard equations of types (1)–(4), with genus `n`, coefficients `c_j`, `d`; the non-orientable constructors require `n > 0`, and zero-square conjugacy forms use type (2).
- `GroupAlgGeom.Quadratic.Standard.toWord`: The left side as an element of `G[X]`.
- `GroupAlgGeom.Quadratic.atomicRank`: `r(S)`.
- `GroupAlgGeom.Quadratic.eulerChar`: `χ(S) = 2 − 2n − (m + 1)` or `2 − n − (m + 1)` when the coefficient `d` is present (the surface of the equation has `m + 1` boundary components, one for each `c_j` and one for `d`), and `2 − 2n` or `2 − n` otherwise.
- `GroupAlgGeom.Quadratic.Solution.IsGeneralPosition`: General-position solutions.
- `GroupAlgGeom.Quadratic.surfaceHom`: The coefficient-free part of a standard equation is the relator of a surface group: solutions of type (1) are homomorphisms `S⁺(n, 0) → G`.

**Checks.**

- Over `F(a,b)`, `z₁⁻¹ a z₁ · z₂⁻¹ b z₂ · z₃⁻¹ a z₃ · (aba)⁻¹ = 1` has solution `(1,1,1)`, noncommuting adjacent atom values `a`,`b`,a and `κ=4`, hence is regular. It is type (2), `n=0`,`m=3`: its surface is `S⁺(0,4)`, with `χ=−2`, and §11.3 uses the conjugacy-only orientable sequence of length 2. It is excluded from type (4) and the mixed one-square or two-square branches.
- `GroupAlgGeom.Quadratic.isStandard_x2y2z2`: `x² y² z² = 1` is standard of type (3) with genus 3 and atomic rank 3.
- `GroupAlgGeom.Quadratic.not_quadratic_cubic`: `x y x⁻¹ y⁻¹ x = 1` is not quadratic, although it has length 5 and only two variables.
- `GroupAlgGeom.Quadratic.commutator_solution_degenerate`: For `[x₁,y₁][x₂,y₂] = 1` the solution `x_i = y_i = 1` is degenerate and commutative.
- `GroupAlgGeom.Quadratic.genus2_no_general_position`: In `F(a,b)`, `x₁ = a`, `y₁ = b`, `x₂ = b`, `y₂ = a` solves `[x₁,y₁][x₂,y₂] = 1` but is commutative: `r₂ = [b,a] = r₁⁻¹`. Indeed every solution of this equation has `r₂^φ = (r₁^φ)⁻¹`, so it has no solution in general position (IFT Theorem 1 needs `n > 2` for type (1)); a definition of general position that ignored the order of the atoms would wrongly accept it.
- `GroupAlgGeom.Quadratic.genus3_general_position`: In `F(a,b)`, `x₁ = a`, `y₁ = b`, `x₂ = b`, `y₂ = a²`, `x₃ = a`, `y₃ = a⁻¹ b a` solves `[x₁,y₁][x₂,y₂][x₃,y₃] = 1` (`[a,b][b,a²] = [a⁻¹ b a, a]`, and `r₃ = [a, a⁻¹ b a]` is its inverse) and is in general position: `[a,b]` and `[b,a²]` do not commute, nor do `[b,a²]` and `r₃ = ([a,b][b,a²])⁻¹`.
- `GroupAlgGeom.Quadratic.strict_conjugate_inconsistent`: `z⁻¹ c z = 1` with `c ≠ 1` is strictly quadratic but inconsistent. It is not a standard equation under the nontrivial-`d` convention; it normalizes to the coefficient-only equation `c=1`. The representative `conjugate_coeff_algSet_eq_empty` states its empty solution set.

`x² y² z² = 1` is standard of type (3), genus 3, `r(S) = 3`. `x y x⁻¹ y⁻¹ x = 1` is not quadratic (`x` occurs three times).

This interface is used by Layer 6 radicals and regularity: the objects classified; Layer 7 generalised equations: quadratic sections of generalised equations correspond to quadratic equations; Layer 8 NTQ systems: quadratic levels; Layer 11 implicit function theorem: regular standard quadratic equations.

Use [IFT] §2.7, Definitions 2–5, p. 8: Quadratic and strictly quadratic sets, the four types of standard quadratic equations, atoms and atomic rank, degenerate, commutative and general-position solutions.; [VAR-I] §1, pp. 8–9 (standard forms and Lemma 6): Standard quadratic equations over a group and reduction of strictly quadratic words to them.

*Needs:* §5.1 (`G`-groups and the free `G`-group `G[X]`); §6.1 (Surface groups with boundary and their peripheral structure).

### 6.6 Quadratic words and standard forms

For every strictly quadratic word `W∈G[X]`, prove `GroupAlgGeom.Quadratic.exists_standardForm` with two possible conclusions: after a coefficient-fixing automorphism `f` and conjugation, the word is either a coefficient `c∈G` (including `c=1`), or a standard quadratic word of positive atomic rank on a finite subset `X₀⊆X`. Record `X₀` and the variables absent from the resulting word. The automorphism is a finite product of elementary Nielsen-type automorphisms; give its action on variables and its inverse. Changes of coordinates and conjugation induce a bijection of solution sets and an isomorphism of radical coordinate groups commuting with their coefficient homomorphisms, all taken over the full variable set `X`. For nonempty solution sets these coefficient maps are injective and the isomorphism is a `G`-isomorphism. Variables absent from the normalized word remain unconstrained coordinates.

First cyclically reduce the free-product word relative to `G` and remove variables that disappear in this reduction. Apply the square, commutator and coefficient-conjugate normalization to the remaining word; the non-coefficient branch has positive atomic rank. The coefficient branch `c≠1` has no solutions in `G`, while `c=1` admits every assignment. Transport these solution sets and their radicals by §5.12 as well.

**Checks.**

- The word `x⁻¹y⁻¹x y` is already standard of positive atomic rank.
- The Klein-bottle word `x y x y⁻¹` is equivalent to `x′²y′²` by a change of free generators.
- Over `F(a,b)`, `z⁻¹`az cyclically reduces to a: its variable disappears and its solution set is empty. It cannot normalize to a positive-rank standard word over this one-variable set.
- The identity has the coefficient branch `c=1` and every assignment is a solution, including when `X` is nonempty but no variable occurs.

Sources: [IFT] §2.7, Definitions 2–3 and Lemma 1, p. 8; [VAR-I] §1, Lemma 6, p. 8, for the genuine quadratic branch; coefficient and identity branches follow from free-product cyclic reduction and §5.12.

*Needs:* §6.5 (Quadratic words, standard quadratic equations and their solutions); §5.12 (Points as homomorphisms; word maps and changes of coordinates); §1.3 (Primitive elements of a free group).

### 6.7 Regular standard quadratic equations

Define `GroupAlgGeom.Quadratic.kappa` as follows. Let `S = 1` be a standard quadratic equation over a nonabelian freely discriminated group `G` (written `r₁ ⋯ r_k d = 1`). Put `κ(S) = |X| + ε(S)`, with `ε(S) = 1` when the coefficient `d` occurs and 0 otherwise. Require `S` to have a solution in `G`. Within this consistent class `S = 1` is regular when it is `[x, y] = d` with `d ≠ 1`, or `[x₁, y₁][x₂, y₂] = 1`, or `r(S) ≥ 2`, `S` has a non-commutative solution and `S` is not of one of the types `c₁^{z₁} c₂^{z₂} = c₁ c₂`, `x² c^z = a² c`, `x₁² x₂² = a₁² a₂²`. Equivalently, `S` is regular precisely when it is consistent and `κ(S) ≥ 4` and `S` has a non-commutative solution in `G`, or `S` is `[x, y] d = 1 (d ≠ 1)`, or `S` is `[x₁, y₁][x₂, y₂] = 1`; the last clause is needed because that equation has `κ = 4` but only commutative solutions `(r₂^φ = (r₁^φ)⁻¹)`, which `IFT's` equivalent formulation overlooks (see the genus-two exception below).

A predicate combining the shape of `S` with the existence of a non-commutative solution.

The public interface should expose the following named results:

- `GroupAlgGeom.Quadratic.kappa`: `κ(S) = |X| + ε(S)`.
- `GroupAlgGeom.Quadratic.IsRegular`: The regularity predicate.
- `GroupAlgGeom.Quadratic.isRegular_iff`: `IsRegular S ↔ S` is consistent and ((`κ S ≥ 4 ∧ ∃` non-commutative solution) `∨ S` is `[x, y] d = 1` with `d ≠ 1 ∨ S` is `[x₁, y₁][x₂, y₂] = 1`).
- `GroupAlgGeom.Quadratic.IsRegular.of_genus`: Consistent orientable equations of positive genus other than `[x, y] = 1` are regular (IFT Corollary `1(1)`).

**Checks.**

- `GroupAlgGeom.Quadratic.isRegular_genus2`: `[x₁,y₁][x₂,y₂] = 1` over `F(a,b)` is regular, by its explicit clause: all its solutions are commutative, so a definition by ‘`κ ≥ 4` and a non-commutative solution’ alone would reject it.
- `GroupAlgGeom.Quadratic.not_isRegular_comm`: `[x, y] = 1` is consistent and orientable of genus 1 but not regular: all its solutions commute.
- `GroupAlgGeom.Quadratic.not_isRegular_lyndon`: `x₁² x₂² x₃² = 1` has `κ = 3` and only commutative solutions in a free group (Lyndon), so it is not regular; a definition by genus alone would wrongly accept it.
- `GroupAlgGeom.Quadratic.isRegular_xy_d`: A consistent equation `[x, y] = d` with `d ≠ 1 (κ = 3)` is regular by the explicit clause. In `F(a,b)`, `[x,y]=[a,b]` qualifies, while `[x,y]=a` is inconsistent and is excluded even though its constant is nontrivial.

`[x₁,y₁][x₂,y₂] = 1` is regular; `[x, y] = 1` is not; `x₁² x₂² x₃² = 1` is not (all its solutions commute, Lyndon).

This interface is used by Layer 11 implicit function theorem for quadratic equations: the hypothesis of IFT Theorem 9; Layer 8 regular NTQ systems: quadratic levels of regular NTQ systems are regular; Layer 6 radical theorem: regular equations have `R(S) = ncl(S)`.

Use [IFT] §2.7, Definition 6 and the remark after it, p. 9: Definition of regular standard quadratic equations (over `F`; used over any `G` in §7.1, p. 67), the invariant `κ(S)`, and an equivalent formulation that omits the equation `[x₁,y₁][x₂,y₂] = 1` (corrected here, the explicit genus-two exception in §6.7).; [VAR-I] §1, Theorem 1 and Propositions 1–8, pp. 7–27: Analysis of standard quadratic equations over fully residually free groups by type.

*Needs:* §6.5 (Quadratic words, standard quadratic equations and their solutions).

### 6.8 Radicals of consistent standard quadratic equations

Prove the following statement. Let `G` be freely discriminated (fully residually free and nonabelian) and `S = 1` a standard quadratic equation over `G` with a solution in `G`. Then: (1) for `S = [x, y] d` or `[x₁, y₁][x₂, y₂]`, `R(S) = ncl(S)`; (2) for `S = x² d`, `R(S) = ncl(x b)` where `b² = d`; (3) for `S = c^z d`, `R(S) = ncl({[z b⁻¹,h] : h∈C_G(c)})` where `d⁻¹ = c^b`; the single-relator formula holds when `C_G(c)=⟨c⟩`; (4) for `S = x₁² x₂²`, `R(S) = ncl(x₁x₂)`; (5) for `S = x₁² x₂² x₃²`, `R(S) = ncl(x₁x₂x₃, [x₁,x₂], [x₁,x₃], [x₂,x₃])`; (6) if `r(S) ≥ 2` and `S` has a non-commutative solution, `R(S) = ncl(S)`; (7) if all solutions of `S` are commutative and `S` is either of type (4) or of type (2) with `n=0`, `R(S)` is the normal closure of the system consisting of `x₁⋯x_n = s₁⋯s_n`, pairwise commutators of the `x_k` and of `u_i := a_i⁻¹z_i`, the mixed commutators `[u_i,x_k]`, and `[x_k,C]`, `[u_i,C]`, where `(s,a)` is a fixed solution and `C = C_G(c₁^{a₁},…,c_m^{a_m},s₁,…,s_n)`, and `G_{R(S)}` is an extension of a centralizer. In addition (general position) the equation has a solution in general position in the cases listed in IFT Theorem 1 (type (1) with `n > 2`, type (2) with `n > 0` and `n + m > 1`, type (3) with `n > 3`, type (4) with `n > 2`, and `r(S) ≥ 2` with a non-commutative solution).

Throughout this subsection assume: `G` nonabelian freely discriminated; `S` consistent over `G` (has a solution in `G`). The representative `radical_conjugacy_eq` carries these coefficient hypotheses and the specified conjugator for case (3).

VAR-I §§2–3 treat the standard types one by one (Propositions 3–8), using discrimination by big powers (§8.5a) and Lemma 9. For (3), set `t=z b⁻¹`: every solution centralizes all of `C_G(c)` by commutative transitivity. The quotient with these full-centralizer relations is `G(c,ℤ)`, discriminated by §8.6, which gives the reverse radical inclusion. VAR-I §3, Form 2, p. 28 distinguishes `C_G(c)=⟨c⟩` from the larger-centralizer case; IFT Theorem `2(3)` omits those additional relations.
The general-position statement is VAR-I Theorem 1 as recalled in IFT Theorem 1. For (4), uniqueness of square roots gives `x₂=x₁⁻¹`, and the quotient by `x₁x₂` is `G∗ℤ`. For (5), Lyndon’s three-squares theorem gives pairwise commutation, and torsion-freeness then gives `x₁x₂x₃=1`; the resulting quotient is `G∗ℤ²`. These quotients are `G`-discriminated by centralizer-extension embeddings (VAR-I Lemma 16, p. 28; §8.6), giving the reverse radical inclusions. The commutators alone printed in IFT Theorem `2(4)`–(5), p. 9, do not contain the original equation, so those two formulas require the product relations stated here.

Nonabelianity is necessary: over `G=ℤ` the genus-two equation has all variable commutators in its radical, whereas its defining quotient `ℤ∗S⁺(2,0)` is nonabelian. For `x₁²x₂²=1` the assignment `x₁=x₂=a` satisfies the commutator alone but fails the equation. For three squares, `x₁=a`,`x₂=x₃=1` does the same.

**Checks.**

- For `c=a²`,`d=a⁻²`,`b=1` over `F(a,t)`, `[z,a]` lies in the radical but survives modulo `ncl([z,a²])` by Britton's lemma; the radical quotient uses the full centralizer `⟨a⟩`.
- For `c=a`,`d=a⁻¹`,`b=1` over `F(a,t)`, `C(c)=⟨c⟩` and the single-relator formula is valid.
- Over `G=⟨a,t,b | [a,t]=1⟩`, `c=a` has centralizer `⟨a,t⟩`, so both `[z,a]` and `[z,t]` occur in the conjugacy radical.

Over `F(a,b)`, `R(x² a²) = ncl(x a) (b = a)`. Over `F(a,b)`, `R(x₁² x₂² x₃²)` contains `[x₁, x₂]` although `[x₁, x₂] ∉ ncl(x₁² x₂² x₃²)`: the low-genus exceptions are real.

Use [IFT] §2.7, Theorems 1–2, pp. 8–9: General-position solutions in the listed cases, and the explicit radicals of consistent standard quadratic equations over freely discriminated groups.; [VAR-I] §1, Theorems 1 and 3, pp. 7–9; §§2–3, Propositions 3–8, pp. 14–27, and §3, Form 2, p. 28: Proofs of the radical descriptions, including the full-centralizer conjugacy radical.

*Needs:* §6.5 (Quadratic words, standard quadratic equations and their solutions); §6.7 (Regular standard quadratic equations); §5.2 (Algebraic sets, radicals and coordinate groups); §5.3 (`G`-separation and `G`-discrimination (residual and full residual properties)); §8.6 (Extensions of centralizers are discriminated by the base group).

### 6.9 Coordinate groups of regular quadratic equations as surface amalgams

Prove the following statement. Let `S = 1` be a regular standard quadratic equation of type (2) or (4) over a nonabelian freely discriminated group `G`, with genus `n` and coefficients `c₁`, `…`, `c_m`, `d`. Then `G_{R(S)} = G_S`, and `G_S` is the fundamental group of the graph of groups with one vertex group `G`, one vertex group the surface group `S±(n, m + 1)` (orientable for type (2), including `n=0`, and non-orientable for type (4), which has `n>0`), and `m + 1` edges with infinite cyclic edge groups identifying the boundary elements `p_j` with conjugates of `c_j (j ≤ m)` and `p_{m+1}` with `d` (with the orientation fixed by the relator). For types (1) and (3), `G_S = G ∗ S±(n, 0)`. The surface vertex is a QH vertex (§6.10) whose boundary subgroups are exactly the edge groups.

Throughout this subsection assume: `S` regular (so `R(S) = ncl(S)` by §6.8 (Radicals of consistent standard quadratic equations), (6)).

`G_S = (G ∗ F(X)) / ncl(S)`; rewriting `S` as the surface relator with `p_j := z_j⁻¹ c_j z_j` and `p_{m+1} := d` gives the amalgam presentation (Tietze moves), and §4.5 iterated identifies it with `π₁` of the graph of groups.

For `S = [x,y][a,b]⁻¹ = 1` over `F(a,b)`, the solution `(a,b)` establishes consistency. Then `G_S = F(a,b) ∗_{[a,b]⁻¹ = p} S⁺(1,1)`, with `p=[x,y]⁻¹`. The superficially similar equation `[x,y]a=1` is inconsistent and is outside this radical theorem.

Use [IFT] §2.7, Theorem 2 and Definition 6, p. 9: Regular standard quadratic equations have `R(S) = ncl(S)`, so their coordinate group is the group of the system.; [GL-JSJ] §5.2, Definition 5.13, p. 47: A surface group attached along boundary subgroups is a QH vertex group of the resulting splitting.

*Needs:* §6.8 (Radicals of consistent standard quadratic equations); §6.3 (Cutting and gluing: surface groups as graphs of groups); §4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); §6.1 (Surface groups with boundary and their peripheral structure).

### 6.10 Quadratically hanging (QH) vertices and their peripheral data

Define `GTree.IsQH` in the surface case with trivial fiber. Let `T` be an `(𝒜, ℋ)`-tree of a group `G` (§4.6). QH data at a vertex `v` consist of a compact connected surface model `Σ` of §6.1a with `χ(Σ)<0` and an isomorphism `Q=G_v≃S±(g,m)` compatible with that model. Under this isomorphism every incident edge stabilizer and every intersection `Q∩gHg⁻¹ (H∈ℋ)` must be contained in a conjugate of a boundary subgroup, or be trivial. The peripheral data are the conjugacy classes of `⟨p_j⟩` in this chosen surface presentation. A boundary component is used when such an incident subgroup or intersection has finite index in its boundary subgroup. The surface model and isomorphism are part of the QH data; rigidity and flexibility are relative to the splitting family in Layer 10.

A structure on a vertex of a `G`-tree recording `Σ`, the surface-group isomorphism and the boundary-containment condition. This is the trivial-fiber surface specialization of `GL`-JSJ Definition 5.13 used in the torsion-free CSA endpoints.

The public interface should expose the following named results:

- `GTree.IsQH`: The surface model, surface-group isomorphism and boundary-containment condition.
- `GTree.IsQH.boundarySubgroups`: The peripheral (boundary) subgroups of a QH vertex.
- `GTree.IsQH.usedBoundary`: Used boundary components.
- `GTree.IsQH.surfaceEquiv`: The specified isomorphism `Q≃S±(g,m)`, carrying each peripheral subgroup to its boundary conjugacy class.
- `GTree.IsQH.dualSplitting`: A finite family of disjoint essential two-sided simple closed curves on `Σ` gives a splitting of `G` refining `T` at `v`, relative to `ℋ`, with cyclic new edge groups (`GL`-JSJ Definition 5.14). If these subgroups belong to `𝒜` the refinement is an `(𝒜,ℋ)`-tree. Use §6.0d's curves and cutting, §6.1a's comparison and §6.3's group splittings.

**Checks.**

- `GTree.isQH_surface_vertex`: In `F(a,b) ∗_{a ~ [x,y]⁻¹} F(x, y)` the vertex `F(x, y) = S⁺(1, 1)` is QH with one used boundary component.
- `GTree.not_isQH_abelian`: A vertex with stabilizer `ℤ²` is not QH: it is not a hyperbolic surface group; `χ`(torus)`=0`, so a definition omitting `χ<0` would accept it.
- `GTree.not_isQH_unbounded_edge`: An incident edge subgroup not contained in a boundary conjugate (for instance the subgroup of a non-peripheral essential curve) violates the QH condition for the specified surface data.
- `GTree.isQH_pants_degenerate`: A pair-of-pants vertex `S⁺(0, 3)` with its three boundary subgroups as incident edge groups is QH `(χ = −1)` but admits no essential simple closed curve, so its dual splittings are trivial.
- `S⁺(2,0)×ℤ` at a point vertex does not satisfy this surface QH interface: its nontrivial center prevents it from being a hyperbolic surface group. Its projection to `S⁺(2,0)` has infinite fiber and is QH in the broader orbifold-extension definition, which is outside this interface.

In the splitting of §6.9, the surface vertex is QH with `Σ` of genus `n` and `m+1` boundary components, all used. A vertex group `ℤ²` is never QH.

This interface is used by Layer 10 JSJ decompositions: flexible vertices of abelian JSJ decompositions of limit groups are QH; Layer 10 modular groups: automorphisms of QH vertex groups fixing the peripheral structure; Layer 11 implicit function theorems: quadratic levels of NTQ systems are QH vertices of their coordinate groups.

Use [GL-JSJ] §5.2, Definitions 5.13–5.15, p. 47, specialized to surfaces with trivial fiber (boundary data, dual splittings and used components), and Theorem 9.5, p. 91 (nonabelian flexible vertices of torsion-free CSA groups are surface groups); [SELA-I] §2, Theorem 2.7, p. 43: Surface QH vertices in the abelian JSJ of a freely indecomposable limit group.

*Needs:* §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); §6.1 (Surface groups with boundary and their peripheral structure); §6.1a (Surface models, presentations and peripheral comparison); §6.3 (Cutting and gluing: surface groups as graphs of groups); §6.0d (simultaneous local cut models and their marked peripheral comparisons); §4.8 (Structure theorem: actions on trees are graphs of groups).

### Examples

For `S=[x,y][a,b]⁻¹=1` over `F(a,b)`, `x=a`,`y=b` is a solution. The equation is regular and its radical is `ncl(S)`. Its coordinate group is the amalgam of `F(a,b)` with the once-punctured torus group along the boundary word. In contrast, `[x,y]a=1` has no solution because the image of a in the coefficient abelianization is nonzero.

### Dependencies

This layer consumes Layers 1, 2, 4 and 5. §§6.0a–6.1a own the finite polygonal models, corner links, normal forms, face presentations, peripheral comparisons, combinatorial curve and arc cutting, and cutting-to-splitting applications. Its algebraic quadratic normalization does not depend on surface realization.

## Layer 7: Generalised equations, equation solving, and positive formal solutions

Generalised equations and their finite cancellation families connect group equations to graphical word equations. Elementary transformation relations preserve solutions; periodicity and minimal-solution bounds yield finiteness theorems and recursive truth sets. Merzljakov's theorem supplies formal solutions of positive sentences with the required prefix dependence. A finite description of all solutions is Layer 10.

### 7.1 Generalised equations with constants and parameters

Define `FreeGroup.GenEq` as follows. A (combinatorial) generalised equation `Ω` over the basis `A` consists of: boundaries `1, …, ρ + 1` and items `h₁, …, h_ρ` (`h_i` between boundaries `i` and `i + 1`); a set of bases, each with left and right end-points `α(μ) < β(μ)`, an orientation `ε(μ) ∈ {±1}`, and either a dual base `Δ(μ)` (with `Δ(Δ(μ)) = μ`, a variable base) or a label in `A^{±1}` (a constant base of length one); and boundary connections `(p, μ, q)` relating a boundary `p` inside `μ` to a boundary `q` inside `Δ(μ)`. Its basic equations are `h[α(μ), β(μ)]^{ε(μ)} = h[α(Δμ), β(Δμ)]^{ε(Δμ)}`, its coefficient equations `h_i = a` for constant bases, and its boundary equations those of the boundary connections. A solution is a tuple `U = (U₁, …, U_ρ)` of nonempty reduced words over `A^{±1}` such that every side of every equation is reduced as written and the equations hold graphically; group solutions drop the reduced-as-written condition. `Ω` is formally consistent when the combinatorial conditions of IFT Definition 10 hold. A parametric generalised equation additionally partitions its closed sections into variable (active, non-active), parametric and constant sections, and is in standard form when these occur in that order. The coordinate group `F_{R(Ω)}` is the coordinate group (Layer 5) of the system of group equations `Ω*` over `F(A)`.

A finite combinatorial structure (natural-number data), with decidable formal consistency (IFT Lemma 12).

The public interface should expose the following named results:

- `FreeGroup.GenEq`: The combinatorial data: `ρ`, bases with end-points, orientation, duals or labels, boundary connections, and (for parametric equations) the section partition.
- `FreeGroup.GenEq.Solution`: Tuples of nonempty reduced words satisfying the equations graphically.
- `FreeGroup.GenEq.IsFormallyConsistent`: The conditions of IFT Definition 10, decidable.
- `FreeGroup.GenEq.toSystem`: The system `Ω*` of group equations over `F(A)` in the items.
- `FreeGroup.GenEq.coordGroup`: `F_{R(Ω)} := coordGroup` of `Ω*` (§5.2).
- `FreeGroup.GenEq.Solution.toHom`: A solution gives an `F`-homomorphism `F_{R(Ω)} → F(A)`.

**Checks.**

- `FreeGroup.GenEq.fig2_solution`: The generalised equation of IFT Fig. 2 has the solution read off the cancellation tree there (`h₃ = b`, `h₄ = a`, `h₉ = a`, `h₁₀ = b` and the corresponding variable items).
- `FreeGroup.GenEq.empty`: The generalised equation with `ρ = 0` and no bases has exactly one solution (the empty tuple).
- `FreeGroup.GenEq.items_nonempty`: Assigning the empty word to an item is not a solution: items are nonempty, which is how inequations `w ≠ 1` are encoded (§7.2).
- `FreeGroup.GenEq.graphical_vs_group`: For the basic equation `h₁ h₂ = h₃` with `U = (a, a⁻¹ b, b)`, the group equation holds but `U₁U₂ = a a⁻¹ b` is not reduced as written, so `U` is a group solution and not a solution.
- `FreeGroup.GenEq.coordGroup_compat`: `coordGroup Ω` is Layer 5's `coordGroup` of the system `toSystem Ω` over `G = FreeGroup A`.

The generalised equation of IFT Fig. 2 has ten items `h₁`, `…`, `h₁₀`, eleven boundaries, basic equations `h₁ = h₇`, `h₂ = h₈`, `h₅ = h₆`, `h₁h₂h₃h₄ = h₆h₇`, `h₅ = h₈h₉h₁₀` and coefficient equations `h₃ = b`, `h₄ = a`, `h₉ = a`, `h₁₀ = b`. A generalised equation with a solution is formally consistent (IFT Lemma `12(1)`).

This interface is used by Layer 7 reduction and transformations: the objects on which Makanin's process acts; Layer 10 Makanin–Razborov diagrams: vertices of the solution tree are generalised equations; Layer 11 cut equations: IFT §5.7 builds cut equations from generalised equations.

Use [IFT] §4.1, Definitions 8–10 and Lemma 12, pp. 17–20; §4.3, Definitions 11–12, pp. 23–24: Combinatorial generalised equations (boundaries, items, bases, duals, orientations, constant bases, boundary connections), their solutions as tuples of nonempty reduced words, formal consistency and its decidability, and parametric generalised equations in standard form.; [JSJ] §4.1, pp. 125–129: The same definitions in the effective JSJ paper.; [VAR-II] §1, pp. 7–9: Generalised equations as used for the triangular quasi-quadratic description.

*Needs:* Mathlib `FreeGroup`; Mathlib `FreeGroup.IsReduced`; §5.2 (Algebraic sets, radicals and coordinate groups).

### 7.2 Finite cancellation schemes for equation–inequation systems

For a finite system `(S,T)` over `F(A)` with finite A and `X`, specify `FreeGroup.GenEq.CancellationFamily`: a finite family of generalised equations `Ω_P`, each with word maps `P_x(H,A)∈F[H]` for `x∈X`. A member records a partition table (a cancellation scheme). Each inequation `t≠1` is represented by `t z_t⁻¹=1` with a fresh variable constrained to occupy a nonempty item. Alphabet constraints mean that a variable lies in the free subgroup on a specified sub-basis. The number and size of partition tables and the lengths of the `P_x` are bounded in terms of the total word length; prove `FreeGroup.GenEq.cancellationFamily_finite` and `FreeGroup.GenEq.cancellationFamily_wordMap_bound`. The solution correspondence is §7.3.

**Checks.**

- For the empty system with no variables the empty generalised equation supplies the trivial cancellation scheme.
- For `x=a` there is a scheme with one item labelled `a` and word map `x=h₁`.
- For `x≠1` no scheme may assign its fresh witness zero items, since that would admit `x=1`.
- For `x²=a` with a a basis letter, every member is unsatisfiable.
- For `x y=a b`, both the solution `x=a`,`y=b` and solutions `x=a c`,`y=c⁻¹b` have cancellation schemes; the maps must preserve the cancelling segment `c`.

Sources: [IFT] §4.2, Lemmas 13–14, pp. 20–23; [JSJ] §4.2, Lemma 4.7, pp. 129–132; [RECOMP] §2, Proposition 1, p. 8; [MAK] §2, Lemma 1, p. 76.

*Needs:* §7.1 (Generalised equations with constants and parameters); §3.3 (Finite systems of equations and inequations with word coefficients).

### 7.3 Correctness of the reduction to generalised equations (both directions)

Prove the following statement. (1) If the cancellation family of `(S,T)` is empty, `(S, T)` has no solution in `F(A)`. (2) For every `Ω ∈` the cancellation family of `(S,T)` and every solution `U` of `Ω`, `x ↦ P_x(U, A)` is a solution of `(S, T)` (including the inequations, since the `z_t` are nonempty reduced). (3) For every solution `W` of `(S, T)` there are `Ω ∈` the cancellation family of `(S,T)` and a solution `U` of `Ω` with `W = P(U)`. The map `Hom_F(F_{R(Ω)}, F) → Hom_F(F_{R(S)}, F)` is induced by the `F`-homomorphism `π_Ω : F_{R(S)} → F_{R(Ω)}` of the word maps, and the equation-preservation part of (2) holds in every `F`-group in place of `F(A)` (IFT Lemma `14(2)`, (4)); for inequations a specialization must additionally keep each fresh witness nontrivial.

IFT Lemma 14 for equations; inequations through the fresh nonempty variables; alphabet constraints are preserved because labels are read from the solution words.

For `x y = a b`, the solution `x = a`, `y = b` comes from the table without cancellation, and `x = a c`, `y = c⁻¹ b` from the table with a cancelling segment `c`.

Use [IFT] §4.2, Lemma 14, pp. 22–23: Both directions of the correspondence between solutions of `S` and solutions of the generalised equations in the cancellation family of `S`.; [JSJ] §4.2, Lemma 4.7, p. 132: The same lemma.

*Needs:* §7.2 (Finite cancellation schemes for equation–inequation systems); §7.1 (Generalised equations with constants and parameters); Mathlib `FreeGroup.toWord_eq_nil_iff` (Correctness of the word-problem procedure (both answers)).

### 7.4 Elementary relations between generalised equations

Specify `FreeGroup.GenEq.Transformation` as a relation between formally consistent generalised equations with associated surjective `F`-homomorphisms of coordinate groups. Its five elementary cases are cutting a base at a boundary connection (ET1), transferring a base (ET2), removing matched bases (ET3), removing a lonely base (ET4), and introducing a boundary (ET5), with exactly the applicability hypotheses and exceptional cases of IFT §5.1. Keep separate derived data for closing or transporting a section (D1–D2), complete cut (D3), taking the kernel (D4), the entire transformation (D5), and identifying constant sections (D6), with their individual transport maps (IFT §5.2). For D4, with no boundary connections, kernel elimination gives a Tietze isomorphism of defining presentation groups `F[H]/ncl(Ω*)≃(F[H_K]/ncl((overline{Ker Ω})*))∗F(Z)`, after deleting free kernel items, with eliminated-variable reconstruction and free-factor assignments. For radical coordinate groups it induces a surjection `F_{R(overline{Ker Ω})}∗F(Z)→F_{R(Ω)}`. If the reconstructed `F`-specializations discriminate that free product, this surjection is an isomorphism; no such discrimination is asserted for arbitrary kernels. Transport the radical through the full reconstructed system, including the free assignments. It is not an elementary coordinate-group quotient. Each elementary source has finitely many successors with the prescribed surjections.

The API gives the applicability conditions, `FreeGroup.GenEq.Transformation.solution_forward` (unique transfer of a fixed graphical solution to a successor), `FreeGroup.GenEq.Transformation.solution_backward` (composition yields a group solution), and the surjectivity and finite-successor assertions. For ET1–ET3 the backward composite is graphical; the other cases require their reducedness conditions. D1–D3, D5 and D6 have the transport contracts proved for each move in IFT §5.2; a composite uses those contracts. Kernel elimination retains the presentation-group isomorphism and free assignments; its radical quotient uses the full reconstructed system.

**Checks.**

- Eliminating a lone base retains the free assignments: if `h₁=h₂` is the only equation, removing the base leaves a free cyclic coordinate group, not the trivial group.
- ET3 removes a matched pair and leaves the same solutions on the surviving items; it imposes no new condition on an otherwise unconstrained item.
- The identity relation carries the identity homomorphism and leaves all solutions unchanged.
- ET5 inside a length-two base distinguishes every admissible boundary position in the dual base.
- Over `F(a,b)`, take all base orientations positive, no boundary connections, dual intervals `(1,3)∼(3,5)`, `(5,7)∼(7,9)`, `(9,11)∼(11,13)`, singleton pairs `1∼4`, `1∼9`, `1∼12`, `5∼8`, `5∼10`, `5∼11`, constants `h₂=h₃=a`, `h₆=h₇=b`, and free `h₁₃=z`. Here `i∼j` denotes `(i,i+1)∼(j,j+1)`. The multiplicities of `h₁,…,h₁₃` are `(4,2,2,2,4,2,2,2,2,2,2,2,0)`; every interior base endpoint touches another base, so no variable base is eliminable. The group equations reduce to `[h₁,a]=[h₅,b]=[h₁,h₅]=1`. Every group point has `h₁=1` or `h₅=1`. The kernel points `(h₁,h₅)=(a,1)`,`(1,b)` show that both elements survive its radical quotient `K`. Thus `[h₁,z h₅ z⁻¹]` lies in `R(Ω)` but is an eight-syllable reduced word in `K∗F(z)`. The radical-coordinate surjection is not injective; these group points are not graphical solutions with nonempty items.
- An ET5 homomorphism may be a proper quotient, so the edge maps must be surjections rather than assumed isomorphisms.
- ET1 at `(p,λ,q)` splits `λ` and its dual at precisely the two corresponding positions; restrictions of a solution word give the two new bases.

Sources: [IFT] §5.1, ET1–ET5, pp. 27–30; §5.2, D1–D6 and Lemma 16, pp. 30–35. The free-product formula in D4 and Lemma 16 is used for defining presentation groups; its radical-coordinate version needs the stated discrimination hypothesis. [JSJ] §5.1–§5.2, pp. 135–143 (printed).

*Needs:* §7.1 (Generalised equations with constants and parameters).

### 7.5 Solution preservation under elementary relations

For every formally consistent `Ω` and every applicable elementary relation ET1–ET5, every graphical solution of `Ω` transfers to a unique successor and graphical solution there, and composition with its coordinate-group surjection recovers the original solution. Conversely every successor solution composes to a group solution of `Ω`; for ET1–ET3 it is graphical, and for the remaining cases it is graphical under the stated reducedness conditions. Prove `FreeGroup.GenEq.transformation_solution_correspondence`. For D1–D3, D5 and D6 use their individual contracts of §7.4. For D4 reconstruct through the presentation-group isomorphism, eliminated-variable substitutions and free assignments, then transport the radical through the full reconstructed equation system. Impose the original graphical nonemptiness and reducedness conditions; the kernel solution alone does not determine the original solution, and its radical coordinate group with an unrestricted free factor need not be the source coordinate group. Formal inconsistency excludes a branch only when that branch has no solutions.

For ET1 the two new bases carry restrictions of the original word at the boundary connection. The distinction between group and graphical solutions is essential: adjacent factors can cancel after a backward composition.

Sources: [IFT] §5.1, pp. 27–30 (the commutative diagram defining elementary transformations and the cases ET1–ET5).

*Needs:* §7.4 (Elementary relations between generalised equations); §7.1 (Generalised equations with constants and parameters).

### 7.6 Finiteness and length bounds for minimal solutions

For a formally consistent generalised equation `Ω` over a fixed finite basis `A`, with alphabet constraints, prove a uniform bound: if `Ω` has a solution, it has one with total item length at most `B_A(‖Ω‖)`, where `B_A:ℕ→ℕ` depends only on the notational size. The analogous bound holds for a finite equation–inequation system after its cancellation-family reduction. Prove `FreeGroup.GenEq.exists_bounded_solution`. Retain the mathematical assertion that such bounds can be recursive.

Use §§2.2–2.2a for the graph bases and integral cycle relations of periodic structures. The proof includes the bound on exponents of periodicity of minimal solutions, periodic structures, the finite subtree containing their paths, and induction on the number of pairs of bases. Use the corrected minimality argument of MAK §6: `E`.11 does not preserve minimality, and alphabet restrictions must be intersected when intervals are identified. Inequations use nonempty witness items. This argument uses neither a universal-theory decision procedure nor a Layer 10 decomposition theorem.

For `[x,y]=[a,b]`, `x=a`,`y=b` has total length two. An inconsistent system has no minimal solution; the bound is conditional on existence. Rank zero has only the trivial assignment, and rank one is the system of integer linear equations and inequations obtained from exponent sums. Finite descriptions of all solutions via recompression are alternative background, rather than an explicit numerical length bound.

Sources: [IFT] §5.3–§5.5, pp. 35–58 (the tree `T(Ω)`, periodized equations, Lemmas 30–32, the finite subtree `T₀(Ω)` and Proposition 1); [MAK82] §1, Lemma 1.4, p. 487; §10, Theorem 10.3, p. 539; §11, Lemmas 11.1–11.4 and Theorem 11.5, pp. 545–546; [MAK] §2, Lemmas 1–2, pp. 76–78; §5, pp. 79–80; §6, pp. 80–88; [RECOMP] Proposition 1, p. 8, and Theorem 1 and Corollary 1, p. 12.

*Needs:* §§2.2–2.2a (graph bases and integral cycle relations); §7.4 (Elementary relations between generalised equations); §7.5 (Solution preservation under elementary relations); §7.3 (Correctness of the reduction to generalised equations (both directions)).

### 7.7 Satisfiability and small constrained examples

For finite A and `X`, state the recursive decidability of the set of finite equation–inequation systems over `F(A)` having a solution, also with each variable restricted to the subgroup on a specified sub-basis. This target is the mathematical decidability theorem `FreeGroup.satisfiability_recursive`, grounded in the length-bound theorem of §7.6. Correctness means the recursive set is exactly `{s | ∃v, s.IsSolution FreeGroup.of v}`, with the subgroup constraints included in the existential quantifier.

**Checks.**

- `[x,y]=[a,b]` has the solution `x=a`,`y=b`.
- The empty system is solved by every tuple, including the all-identity tuple; with no variables there is exactly one tuple.
- `[x,a]=[x,b]=1` together with `x≠1` has no solution for distinct basis letters a,`b`.
- With `y∈⟨a⟩`, `y²=a²` has the unique solution `y=a`, whereas `y=b` has none.
- `x²=a` is unsatisfiable. At rank zero, every inequation fails; at rank one the commutativity equation always holds.

Sources: [IFT] §4.4, proof of Corollary 9, p. 26, and §5.1 (Lemma 15 uses decidability of the universal theory); [RECOMP] Abstract and §1, pp. 1–2; [MAK] §3, Theorem 1 and its proof, p. 78.

*Needs:* §7.6 (Finiteness and length bounds for minimal solutions); §3.3 (Finite systems of equations and inequations with word coefficients); Mathlib reduced-word equality.

### 7.8 Existential and universal theories as recursive sets

For a finite basis `A`, state that the existential and universal theories of `F(A)` in `L_A` are recursive sets of finite sentences, with the standard finite-symbol encoding. Their truth conditions are exactly the solution and no-solution equivalences of §3.5. No statement covers arbitrary quantifier alternations.

**Checks.**

- `∃x ([x,a]=1∧x≠1)` is true when `a` is a basis letter, witnessed by `a`.
- `∀x∀y [x,y]=1` is false in `F(a,b)`, true in `F(a)`, and true in the rank-zero group; rank matters.
- `∃x (x=x)` holds even in the trivial group.
- `∀x∀y∀z (x²y²z²=1→[x,y]=1)` holds in every free group by Lyndon's theorem.

The primitive carrier of formulas is Mathlib's syntax; the target concerns recursive truth sets.

Sources: [VAR-II] §0, Definition 9, p. 6 of the author copy; [IFT] §3.2, p. 13, and §5.1, Lemma 15, p. 30; [MAK] §2, Lemmas 1–2, pp. 76–78, and §3, Theorem 1, p. 78.

*Needs:* §3.5 (Existential and universal sentences as solution statements); §7.7 (Satisfiability and small constrained examples).

### 7.9 Positive formulas as single equations (Malcev's equation)

Prove the following statement. Let `G` be torsion-free, CSA, nonabelian and satisfying Vaught's condition `∀x∀y∀z (x² y² z² = 1 → [x,y] = [x,z] = [y,z] = 1)` — in particular any nonabelian free group — and a, `b ∈ G` with `[a, b] ≠ 1`. (1) The equation `x² a x² a⁻¹ = (y b y b⁻¹)²` has only the trivial solution in `G`. (2) For equations `S₁ = 1`, `…`, `S_k = 1` there exist single equations `S = 1` with `V_G(S) = V_G(S₁, …, S_k)` and `S′ = 1` with `V_G(S′) = V_G(S₁) ∪ … ∪ V_G(S_k)`. (3) Every positive quantifier-free formula of `L_A` is equivalent over `G` to a single equation, and every positive sentence to one of the form `∀x₁∃y₁ … ∀x_k∃y_k (S(X, Y, A) = 1)`.

Throughout this subsection assume: `G` torsion-free, CSA, nonabelian, satisfying Vaught's condition; a, `b ∈ A` non-commuting.

(1) IFT Lemma 3 (after Malcev), using Vaught's condition and commutation transitivity.
(2) IFT Corollaries 2–5, with IFT Lemma 4 for disjunctions.
(3) IFT Corollary 6 and the prenex form of §2.3 with fictitious quantifiers.

Over `F(a,b)`, the system `{x = 1, y = 1}` is equivalent to the single equation `x² a x² a⁻¹ = (y b y b⁻¹)²`.

Use [IFT] §3.1, Definition 7 and Lemma 3, pp. 10–11; Corollaries 2–6 and Lemma 4, pp. 11–12; §2.3, p. 5; §4.4, p. 25: Malcev's equation with only the trivial solution in groups of the class `T` (torsion-free, CSA, Vaught's condition, two non-commuting elements), the equivalence of finite conjunctions and disjunctions of equations into one equation over such groups (modulo the axioms of `T`), and the prenex `∀∃` form of positive sentences used for Merzljakov's theorem (p. 25).; [MAK] §4, Lemma 3 (Mal'tsev) and Lemma 4 (Gurevich), pp. 78–79: In a free group the equation `x₁² a₁ x₁² a₁⁻¹ = (x₂ a₂ x₂ a₂⁻¹)²` is equivalent to `x₁ = 1 ∧ x₂ = 1` (Lemma 3), and a conjunction of four equations is equivalent to the disjunction `x₁ = 1 ∨ x₂ = 1` (Lemma 4).

*Needs:* §1.8 (Maximal cyclic subgroups are malnormal; free groups are CSA); §3.4 (Quantifier-free formulas are finite disjunctions of systems); Mathlib substitution and prenex semantics; §1.7 (CSA groups and commutation transitivity).

### 7.10 Merzljakov's theorem: formal solutions of positive sentences

Prove the following statement. Let `F = F(A)` be a nonabelian free group of finite rank and `S(X, Y, A) = 1` an equation with `X = (x₁, …, x_k)`, `Y = (y₁, …, y_k)`. If `F ⊨ ∀x₁∃y₁ … ∀x_k∃y_k (S(X, Y, A) = 1)`, then there are words `q₁(x₁)`, `q₂(x₁, x₂)`, `…`, `q_k(x₁, …, x_k)` with `q_i ∈ F[x₁, …, x_i]` (the free product `F ∗ F(x₁, …, x_i)`) such that `S(x₁, q₁(x₁), …, x_k, q_k(x₁, …, x_k), A) = 1` in `F[X]`: the equation has a solution in the free group `F[X]` whose `i`-th component depends only on `x₁`, `…`, `x_i`.

Throughout this subsection assume: `F` nonabelian of finite rank; a single equation (by §7.9 every positive sentence reduces to this case).

Choose Merzljakov words `g_i = b a^{m_{i1}} b ⋯ a^{m_{in_i}} b` with increasing exponents, `n_i` larger than (the maximum item count in the cancellation family of `S`) `· |S|`, and no subword `b a^{m} b` shared with earlier `g_l`, `h_l`; choose `h_i` inductively so the remaining sentence holds.
Apply §7.3 to the solution `(g, h)`; each `g_i` contains a marked subword occurring inside a single item and exactly once; replace each marked occurrence `b a^{m} b` by `b a^{m} x_i b` throughout (IFT §4.4).
The modified tuple is a solution of the generalised equation over `F[X]` (the equations hold graphically), so `X ↦ x_i`, `Y ↦ Q(Ũ)` solves `S` over `F[X]`; the dependence of `q_i` on `x₁`, `…`, `x_i` comes from the marking order.

For `∀x∃y (y = x a)`, the formal solution is `q(x) = x a`. For `∀x∃y ([x, y] = 1)` a formal solution is `q(x) = x` (or 1).

Use [IFT] §4.4, Merzljakov's Theorem and its proof, pp. 24–26: If a positive `∀∃` sentence holds in `F`, the equation has a solution in `F[X]` with `q_i` depending on `x₁`, `…`, `x_i`; proof by Merzljakov words and generalised equations.; [LIFT] Introduction, p. 217: Statement of Merzljakov's theorem as the basic implicit function theorem.; [MAK] §4, Lemma 5 (Merzlyakov), p. `79: A ∀∃`-sentence with one equation holds in `F` iff the equation in the existential variables is solvable over a free group of larger rank with each unknown restricted to the subalphabet of the coefficients and the earlier universal variables (the constrained formal-solution characterization).

*Needs:* §7.3 (Correctness of the reduction to generalised equations (both directions)); §7.9 (Positive formulas as single equations (Malcev's equation)); §5.1 (`G`-groups and the free `G`-group `G[X]`).

### 7.11 Positive sentences and constrained formal witnesses

For a positive `L_A`-sentence over `F(A)` with finite A of cardinality at least two, express it as `∀x₁∃y₁…∀x_k∃y_k (S=1)` using §7.9. Prove that the sentence is true if and only if there is a formal solution `q` over `F(A∪X)` with `q_i∈F(A∪{x₁,…,x_i})`. Necessity is Merzljakov's theorem and sufficiency follows by specialization. Together with §7.7 this states the positive theory as a recursive set. The target retains formal witnesses and their quantifier dependence.

**Checks.**

- `∀x∃y (y=x a)` has formal solution `q(x)=x a`.
- `∀x∃y (y²=x)` is false, since `x=a` has no square root.
- With `k=0` and `S` the empty word, the unique empty witness tuple works.
- For `∀x₁∃y₁∀x₂∃y₂ (y₁=x₁∧y₂=x₂x₁)`, `q₁=x₁` and `q₂=x₂x₁` meet the prefix constraints; allowing `q₁` to depend on `x₂` would change the quantifier meaning.

Sources: [IFT] §4.4, Corollary 9 and its proof, p. 26; Definition 13 and Theorem 4, pp. 26–27; [MAK] §4, Lemmas 3–5, pp. 78–79, and §5, Theorem 2, pp. 79–80.

*Needs:* §7.10 (Merzljakov's theorem: formal solutions of positive sentences); §7.9 (Positive formulas as single equations (Malcev's equation)); §7.7 (Satisfiability and small constrained examples).

### Examples

The constrained equation `y²=a²` with `y∈⟨a⟩` has the unique solution `y=a`. With the same constraint, `y=b` has no solution for distinct a,`b`. For `∀x∃y (y=x a)`, the formal word `q(x)=x a` witnesses truth. The sentence `∀x∃y (y²=x)` fails at `x=a`.

### Dependencies

This layer consumes Layer 1, Layer 3, Layer 5. Library suppliers are the declarations specified above; no other roadmap is required.

## Layer 8: Fully residually free groups, limit groups, and ordinary NTQ towers

Fully residually free groups (free discrimination), limit groups as limits of marked free groups, and their identification with coordinate groups of irreducible algebraic sets; extensions of centralizers, the embedding theorems and finite presentability; raw triangular quasi-quadratic systems, normalized NTQ tower carriers, their finite solution covers and level maps, and the regular subclass used in Layer 11. The cyclic-centralizer theorem of free groups is not transferred: centralizers in limit groups are free abelian, not cyclic.

### 8.1 Residually free and fully residually free groups

Define `LimitGroup.IsResiduallyFree` as follows. A group `G` is residually free when for every `g ≠ 1` there are a free group `F` and a homomorphism `φ : G → F` with `φ g ≠ 1`, and fully residually free (freely discriminated, `ω`-residually free) when for every finite set `g₁`, `…`, `g_n` of nontrivial elements there are a free group `F` and `φ : G → F` with `φ g_i ≠ 1` for all `i`. Free groups are quantified as Mathlib's `IsFreeGroup` over types in the universe of `G` (equivalently, by Nielsen–Schreier, `FreeGroup (Fin 2)` for countable `G`). For an `F`-group (`F` free nonabelian with fixed embedding) the coefficient version is Layer 5's `F`-discrimination by `F`.

Two predicates; the `F`-version is §5.3 with `G = H = F`.

The public interface should expose the following named results:

- `LimitGroup.IsResiduallyFree`: Residually free.
- `LimitGroup.IsFullyResiduallyFree`: Fully residually free.
- `LimitGroup.IsFullyResiduallyFree.isResiduallyFree`: Full residual freeness implies residual freeness.
- `LimitGroup.IsFullyResiduallyFree.of_injective`: Subgroups (injective homomorphisms into) of fully residually free groups are fully residually free.
- `LimitGroup.isFullyResiduallyFree_iff_discriminatedBy`: `IsFullyResiduallyFree G ↔ G` is discriminated by `FreeGroup (Fin 2)` (Layer 5 with trivial coefficient group), for countable `G`.

**Checks.**

- `LimitGroup.free_prod_int_not_frf`: `FreeGroup (Fin 2) ×` Multiplicative `ℤ` is residually free and not fully residually free.
- `LimitGroup.zn_frf`: Multiplicative `(Fin n → ℤ)` is fully residually free (discriminate by maps to `ℤ`).
- `LimitGroup.trivial_frf`: The trivial group is fully residually free (the condition is vacuous).
- `LimitGroup.Z2_not_rf`: `ℤ/2` is not residually free (free groups are torsion-free).
- `LimitGroup.closed_surface_frf`: `S⁺(2, 0)` is fully residually free (Baumslag), while `S⁻(3, 0)` (relator `x² y² z²`) is not even residually free: by Lyndon's theorem every homomorphism to a free group kills `⁅x, y⁆ ≠ 1`.

`F₂ × ℤ` is residually free and not fully residually free (not commutative transitive). `ℤⁿ` and free groups are fully residually free.

This interface is used by Layer 8 limit groups and coordinate groups: the central class of the layer; Layer 10 finite presentations and factorization diagrams; Layer 11: coefficient groups of the implicit function theorem.

Use [LIMITS] §2.3, Definition 2.5, p. 12: Residually free and fully residually free groups; `F₂ × ℤ` separates the two notions.; [IFT] §2.6, p. 7: Freely discriminated groups are torsion-free CSA groups; `F`-discrimination for `F`-groups.

*Needs:* §5.3 (`G`-separation and `G`-discrimination (residual and full residual properties)); Mathlib `IsFreeGroup`.

### 8.2 Structure of fully residually free groups

Prove the following statement. Let `G` be fully residually free. Then: (1) `G` is torsion-free, commutative transitive and CSA; (2) every finitely generated subgroup is fully residually free; (3) centralizers of nontrivial elements are abelian (maximal abelian subgroups are malnormal), and, for `G` finitely generated, every abelian subgroup is free abelian of finite rank, so centralizers are free abelian of finite rank but need not be cyclic; (4) two elements generate 1, `ℤ`, `ℤ²` or a nonabelian free group of rank 2; (5) a nonabelian fully residually free group is a domain (Layer 5).

(1), (2), (4): LIMITS Proposition 3.1, by transferring finitely many relations or non-relations to a free quotient.
(3) Abelian subgroups embed, through discriminating maps, in centralizers of free groups (§1.6) only for finitely many elements at a time, so they are torsion-free abelian; finite generation of abelian subgroups of finitely generated fully residually free groups uses the embedding of §8.7 (Embedding theorems and finite presentability).
(5) §5.5.

In `ℤ² ∗ ℤ`, a fully residually free group, the centralizer of `(1,0)` is `ℤ²`: centralizers are abelian but not cyclic. The free-group statement ‘centralizers are cyclic’ (§1.6) fails for limit groups, as `ℤ²` shows.

Use [LIMITS] §3.1, Proposition 3.1, pp. 4 and 20: Limit groups are torsion-free, commutative transitive, CSA and bi-orderable; finitely generated subgroups are limit groups; two-generated subgroups are 1, `ℤ`, `ℤ²` or `F₂`.; [SUBGROUPS] §5, Lemma 20, p. 36: Proper centralizers of finitely generated fully residually free groups are free abelian of finite rank and their ranks form a finite set.

*Needs:* §8.1 (Residually free and fully residually free groups); §1.8 (Maximal cyclic subgroups are malnormal; free groups are CSA); §5.5 (CSA groups with nonabelian coefficients are domains; free groups are domains); §1.6 (Centralizers of nontrivial elements are the cyclic groups of their maximal roots); §8.7 (Embedding theorems and finite presentability); §1.7 (CSA groups and commutation transitivity).

### 8.3 The space of marked groups and limit groups

Define `LimitGroup.MarkedGroup` as follows. For `n ∈ ℕ`, the space `𝒢_n` of `n`-marked groups is the set of normal subgroups of `FreeGroup (Fin n)`, topologised as a closed subset of the Cantor space Set `(FreeGroup (Fin n)) = 2^{F_n}` (product topology); a marked group `(G, S)` with `S : Fin n → G` generating `G` corresponds to the kernel of `FreeGroup.lift S`. A limit group is a finitely generated group `G` some (equivalently every) marking of which is a limit in `𝒢_n` of markings of free groups.

Topology induced from the product topology on Set `(FreeGroup (Fin n))`; normal subgroups form a closed, hence compact, subset.

The public interface should expose the following named results:

- `LimitGroup.MarkedGroup`: Normal subgroups of `FreeGroup (Fin n)` with the subspace topology from Set `(FreeGroup (Fin n))`.
- `LimitGroup.MarkedGroup.compactSpace`: `𝒢_n` is compact (and totally disconnected).
- `LimitGroup.MarkedGroup.ofMarking`: The point of `𝒢_n` given by a generating `n`-tuple of a group.
- `LimitGroup.IsLimitGroup`: `G` finitely generated and some marking is a limit of markings of free groups.
- `LimitGroup.IsLimitGroup.marking_independent`: If one marking of `G` is a limit of free markings then every marking is.

**Checks.**

- `LimitGroup.Z2_isLimitGroup`: Multiplicative `(Fin 2 → ℤ)` is a limit group: the markings `(ℤ, (1, k))` converge to its marking as `k → ∞`.
- `LimitGroup.free_isLimitGroup`: Every free group of finite rank is a limit group (constant sequence).
- `LimitGroup.finite_not_limit`: `ℤ/2` is not a limit group: its marking is isolated from free markings (a relator `a²` survives in a neighbourhood but holds in no nontrivial free marking).
- `LimitGroup.marked_topology_compat`: Convergence in `𝒢_n` is pointwise convergence of the indicator functions of the kernels.

The 2-markings `(ℤ, (1, k))` of `ℤ` converge, as `k → ∞`, to the marking of `ℤ² = ⟨x, y | [x, y]⟩: a` fixed word dies for all large `k` iff both its exponent sums vanish. Finite non-trivial groups are isolated from free groups' markings and are not limit groups.

This interface is used by Layer 8 equivalence of definitions: the marked-limit formulation of limit groups; SELA-I §1: Sela's limit groups via limiting actions.

Use [LIMITS] §2.1, Definition 2.1, p. 8, and Definition 2.4, p. 12: The set of `n`-marked groups as normal subgroups of `F_n` with the Cantor topology, compact and totally disconnected; limit groups as limits of marked free groups.

*Needs:* Mathlib `FreeGroup`; Mathlib `Subgroup.normalClosure`.

### 8.4 Limit groups are the finitely generated fully residually free groups

Prove the following statement. For a finitely generated group `G` the following are equivalent: (1) `G` is a limit group (§8.3); (2) `G` is fully residually free; (3) `G` has the same universal theory as some free group (in the language of groups without constants; as `F₂` when `G` is nonabelian, as `ℤ` when `G` is nontrivial abelian; for the trivial group, the free group of rank zero). Separately, for an `F`-group `G` (`F ≤ G` free nonabelian of finite rank, `G` finitely generated as an `F`-group), the following two relative conditions are equivalent to each other: (4) `G` is `F`-discriminated by `F`; (5) `G` is `F`-isomorphic to the coordinate group `F_{R(S)}` of an irreducible nonempty algebraic set over `F`, with `S` a finite system (by equational Noetherianity).

Throughout this subsection assume: `G` finitely generated; for (4)–(5), the specified inclusion `F ↪ G` is part of the data. Conditions (4)–(5) imply (1)–(3), but the reverse implication need not preserve that inclusion.

(1) `⇔` (2) `⇔` (3): LIMITS Theorem 1.1 (Corollary 3.10, Theorem 5.1, Corollary 6.5 and Proposition 6.6).
(4) `⇔` (5): §5.11 over the equationally Noetherian domain `F`, with `G = G[X]/Rad(S)` for a presentation of `G` over `F`; finiteness of `S` from §5.9.

The relative conditions are also equivalent to equality with `F` of the universal theory in the language with coefficients, and to an `F`-embedding into `F^{ℤ[t]}` (IFT §2.6, p. 7). For a negative control take `G=F(a,b)` and the coefficient subgroup `F=⟨a²,b⟩`. The group `G` is fully residually free, but an `F`-homomorphism `G→F` would have to send a to a square root of `a²` in `F`. Unique roots in `G` force that root to be a, which is outside `F`. Thus no such homomorphism exists.

The coordinate group of `[x, a] = 1` over `F(a,b)` is fully residually free (an extension of the centralizer of a). The coordinate group of the reducible set `⟨a⟩ ∪ ⟨b⟩` is not.

Use [LIMITS] §1, Theorem 1.1 and the remark following it, p. 4: Equivalence of: limit group in Sela's sense, limit of free markings, same universal theory as a free group, subgroup of a non-standard free group, fully residually free; fully residually free groups are the coordinate groups of irreducible algebraic sets.; [IFT] §2.6, the theorems attributed to [47], [4], [19], [20], p. 7: A finitely generated `F`-group is `F`-discriminated by `F` iff it is `F`-universally equivalent to `F` iff it is the coordinate group of an irreducible algebraic set over `F` iff it `F`-embeds in `F^{ℤ[t]}`.

*Needs:* §8.1 (Residually free and fully residually free groups); §8.3 (The space of marked groups and limit groups); §5.11 (Irreducibility is discrimination of the coordinate group); §5.9 (Linear groups are equationally Noetherian; so are free groups of finite rank); §5.3 (`G`-separation and `G`-discrimination (residual and full residual properties)). The relative equivalence with an `F`-embedding into `F^{ℤ[t]}` uses §8.9(4) and §8.6a's carrier comparison, independently of §8.7.

### 8.5 Extensions of centralizers and iterated extensions

Define `LimitGroup.centralizerExt` as follows. For a group `G`, `u∈G` and `n∈ℕ`, the extension is `G(u,ℤⁿ):=G∗_{C_G(u)}(C_G(u)×ℤⁿ)`, using the full centralizer. For `n=1` it is the HNN extension `⟨G,t | [c,t]=1, c∈C_G(u)⟩`; `n=0` gives `G`. This construction is unrestricted. Separately, `LimitGroup.IsAdmissibleCentralizerStep` requires `u≠1`, `u` not a proper power, and `n>0` (the representative `IsAdmissibleCentralizerStep` uses these three conditions). In a nonabelian fully residually free lower group, `C_G(u)` is then maximal abelian. An ICE group over a nonabelian free group `F` is a finite chain `F=G₀<G₁<⋯<G_m` with `G_{i+1}=G_i(u_i,ℤ^{n_i})` and every step admissible. The empty chain is permitted; positive rank makes every displayed step strict. §8.6 reduces any nonidentity parameter to a non-proper-power with the same full centralizer.

Defined through `Monoid.PushoutI` with the two inclusions; the HNN description through `HNNExtension` with `A = B = C_G(u)` and `φ = id`.

The public interface should expose the following named results:

- `LimitGroup.centralizerExt`: `G(u, ℤⁿ)` as `Monoid.PushoutI`.
- `LimitGroup.centralizerExt.of_injective`: `G` embeds in `G(u, ℤⁿ)` (Mathlib's `PushoutI.of_injective`).
- `LimitGroup.centralizerExt.lift`: Homomorphisms out of `G(u, ℤⁿ)` are pairs (`φ` on `G`, commuting tuple in the centralizer of `φ(C_G(u))`).
- `LimitGroup.centralizerExt.retraction`: For `k ∈ ℤⁿ`, the `G`-homomorphism `t_i ↦ u^{k_i}` (a retraction onto `G`).
- `LimitGroup.IsAdmissibleCentralizerStep`: Nonidentity, non-proper-power parameter and positive added rank.
- `LimitGroup.ICE`: Finite chains of admissible steps over nonabelian `F`, with their coefficient inclusions.

**Checks.**

- `LimitGroup.centralizerExt_Z`: `centralizerExt` (Multiplicative `ℤ`) `(ofAdd 1) ℤ ≅ ℤ²` (the centralizer of a generator of `ℤ` is `ℤ`).
- `LimitGroup.centralizerExt_free`: `centralizerExt F(a,b) a ℤ ≅ ⟨a, b, t | [a, t] = 1⟩`.
- `LimitGroup.centralizerExt_proper_power`: Extending the centralizer of `a²` in `F(a,b)` with the centralizer taken as `⟨a²⟩` instead of `C(a²) = ⟨a⟩` gives a group in which `a` and `t` do not commute but `a²` and `t` do; it is not CSA, so the construction must use the full centralizer.
- `LimitGroup.centralizerExt_trivial_n`: For `n = 0`, `G(u, ℤ⁰) = G`.
- For `u=1`, `F(a,b)(1,ℤ)≅F(a,b)×ℤ` is outside ICE: if a map to a free group preserves the central generator `t`, cyclic centralizers force it to kill `[a,b]`. Thus `{t,[a,b]}` cannot be discriminated. Every coefficient-fixing map to `F(a,b)` kills `t`.
- The raw extension at `a²` has the same full centralizer and group as the extension at `a`; its parameter is replaced by `a` before recording an admissible step. A rank-zero extension is a repetition, not an ICE step.

`F(a,b)(a, ℤ) = F(a,b) ∗_{⟨a⟩} (⟨a⟩ × ⟨t⟩) ≅ ⟨a, b, t | [a, t] = 1⟩`. `ℤ(1, ℤ) = ℤ²`.

This interface is used by Layer 8 embedding theorems: ICE groups receive embeddings of limit groups; Layer 8 NTQ systems: centralizer-extension levels of NTQ systems; Layer 10 centralizers and conjugacy: SUBGROUPS Lemma 21 inducts over the chain; Layer `9 F^{ℤ[t]}: F^{ℤ[t]}` is the union of a countable chain of extensions of centralizers.

Use [IFT] §2.5, pp. 6–7: The extension `G(u, t)` of the centralizer of a non-proper-power `u` in a non-abelian CSA group, discriminated into `G` by the maps `t ↦ u^k`.; [SUBGROUPS] §5, p. 36: Centralizer extensions `H(u, s) = H ∗_⟨u⟩ (⟨u⟩ × ⟨s⟩)` and chains of them.; [VAR-I] §1, Definition 5, p. 5, and Lemma 5, p. 7: Free extensions of centralizers `K(u, t) = ⟨K, t | [C(u), t] = 1⟩` (Definition 5); a group obtained from a CSA group by a sequence of free extensions of centralizers embeds in `G^{ℤ[x]}` (Lemma 5).

*Needs:* Mathlib `Monoid.PushoutI`; Mathlib `HNNExtension`; Mathlib `Subgroup.centralizer`; §4.5 (One-edge graphs of groups are Mathlib's amalgams and HNN extensions); §1.7 (CSA groups and commutation transitivity).

### 8.5a Big powers and discrimination

Define `Group.IsBP` (representative `IsBP`): for every finite nonempty tuple `(u₁,…,u_k)` of nonidentity elements whose consecutive entries do not commute, there is `N≥1` such that `u₁^{e₁}⋯u_k^{e_k}≠1` whenever all natural exponents `e_i≥N`. Prove `isBP_freeGroup` for every `FreeGroup α` by cyclic reduction and bounded cancellation between consecutive noncommuting powers. Own the bounded-cancellation estimate: after recording conjugators and maximal roots, the overlap between adjacent power blocks is bounded independently of their exponents; otherwise their axes have a common ray and the elements commute. This uses the Cayley tree and the cyclic-centralizer theorem, not an embedding theorem for limit groups. Prove `IsBP.of_injective` and `IsBP.of_discriminated`, giving BP inheritance by subgroups and by groups discriminated by BP groups, preserving the tuple entries and adjacent commutators in a single discriminating map. Thus prove `IsFullyResiduallyFree.isBP`.

**Checks.**

- In `F(a,b)`, `a^p b^q≠1` for all `p`,`q≥1`.
- The tuple `(a,a⁻¹)` is excluded: its equal-power product is 1 for arbitrarily large exponents.
- In `ℤ/2` the nonidentity singleton has trivial powers for arbitrarily large even exponents, so `ℤ/2` does not satisfy BP.
- The singleton tuple (1) is excluded; the singleton condition for a nonidentity element rules out torsion. Trivial groups satisfy BP vacuously.
- Any finite tuple in a fully residually free group is tested in one free image preserving its entries and adjacent commutators, rather than separate maps for each pair.

Sources: [IFT] §2.5, Definition 1 and following paragraph, p. 6 (BP and its inheritance); §§1.4–1.6 here supply the free-group cyclic reduction and centralizers for the bounded-cancellation proof. The explicit nonidentity condition handles the singleton tuple omitted in the printed definition.

*Needs:* §§1.1, 1.4–1.6; §4.6 (Cayley-tree actions); §8.1 (full residual freeness); §5.3 (discrimination).

### 8.6 Extensions of centralizers are discriminated by the base group

Prove the following statement. Let `G` be a nonabelian CSA group with the big powers property (in particular a nonabelian fully residually free group), and let `u≠1` be not a proper power. Then `G(u,ℤ)` is `G`-discriminated by the retractions `ξ_k:t↦u^k`: for every `w≠1` there is `N_w` with `ξ_k(w)≠1` for every `k≥N_w`. Over a nonabelian fully residually free `G`, positive-rank extensions are successive rank-one admissible steps and their discriminations compose on finite sets. Consequently every ICE group over nonabelian `F` is `F`-discriminated by `F` and fully residually free. For nonabelian CSA BP groups, `G[X]` is `G`-discriminated by `G` as well.

Throughout this subsection assume: `G` nonabelian, CSA, big powers (BP); `u≠1` and not a proper power. The finite-rank iteration and root reduction below use full residual freeness. The representative `isFullyResiduallyFree_centralizerExt` carries a nonabelian base and an admissible rank-one step.

Write `w` in normal form for the amalgam (§4.3) and apply big powers to the alternating product `g₀ u^{k m₁} g₁ ⋯` (IFT §2.5, Theorem of [40]).

Prove `LimitGroup.centralizerExt_root_reduction`: for a fully residually free `G` and `u≠1` there is `r` not a proper power with `u=r^d`, `d≥1`, and `C_G(u)=C_G(r)`. Choose a free-group homomorphism not killing `u`. The exponent of any root of `u` is bounded by the maximal-root exponent of its nontrivial image; a root of maximal exponent in `G` is not a proper power. Commutative transitivity gives the centralizer equality. This uses §8.1, not finite presentation or the general embedding theorem.

**Checks.**

- In `⟨a,b,t | [a,t]=1⟩`, `[b,t]` maps to `[b,a^k]≠1` for `k≥1`.
- For the rank-two extension of `C_F(a)`, choosing both new generators to map to `a^k` kills their quotient; finite-set discrimination requires successive retractions with suitable exponents, not every tuple of equally large exponents.
- For `a²` the root reduction uses `r=a` and `d=2`, with `C_F(a²)=C_F(a)`; it preserves the raw extension.
- At `u=1` the extension `F₂×ℤ` fails full residual freeness, and at `n=0` no strict step occurs.

Use [IFT] §2.5, the theorem of [40], pp. 6–7: For a nonabelian CSA BP-group, the maps `t ↦ u^k` discriminate `G(u, t)` into `G`; For finite `X`, `G[X] G`-embeds into `G(u, t)`.; [VAR-II] §0, Lemma 2 and Theorem 1, p. 4: Groups obtained by free extensions of centralizers embed in `G^{ℤ[x]}` and are discriminated by `G`.

*Needs:* §8.5a (big powers); §8.5 (Extensions of centralizers and iterated extensions); §4.3 (Normal form theorem and injectivity of vertex groups); §8.1 (Residually free and fully residually free groups); §5.5 (CSA groups with nonabelian coefficients are domains; free groups are domains); §1.7 (CSA groups and commutation transitivity).

### 8.6a Lyndon's completion and its centralizer-chain realization

Construct `LimitGroup.lyndonCompletion` for a nonabelian free group `F=F(X)` of finite rank. A `ℤ[t]`-group has exponentiation `h^p` satisfying `h^1=h`, `h^0=1`, `1^p=1`, `h^{p+q}=h^p h^q`, `(h^p)^q=h^{pq}`, compatibility with conjugation, and `(hk)^p=h^p k^p` when `h` and `k` commute. `F^{ℤ[t]}` is the tensor `ℤ[t]`-completion: every homomorphism `F→H` to a `ℤ[t]`-group extends uniquely to a homomorphism commuting with exponentiation. Construct its coefficient inclusion and its direct-limit realization by a countable chain of admissible full-centralizer extensions of §8.5, adjoining polynomial powers exhaustively: every centralizer element and every polynomial exponent is assigned a stage, compatible extensions of each abelian centralizer supply the exponent laws, and new centralizers are processed at subsequent stages. Prove injectivity of every transition and independence of the enumeration via the completion universal property. The countable rank extensions of MRS-REGULAR §2.1 are resolved into finite admissible steps; every finite set occurs in one finite step. Prove the comparison: each finite ICE group over `F` embeds over `F` in this completion, and each finitely generated subgroup of the completion lies in a finite stage. Renaming the polynomial indeterminate identifies `F^{ℤ[x]}` with `F^{ℤ[t]}`. This carrier and comparison use centralizer-extension theory, independently of §8.7.

**Checks.**

- The coefficient inclusion preserves a nonidentity generator a, and its powers satisfy `a^{t+1}=a^t a` and `(a^t)^t=a^{t²}`.
- Mapping `F` into any `ℤ[t]`-group determines the exponent-preserving map from the completion uniquely; changing the exhaustive enumeration yields the same completion over `F`.
- Every finite set lies in a finite admissible ICE stage, while all polynomial powers of a need not lie in one such stage.
- `F₂(1,ℤ)=F₂×ℤ` has no embedding over `F₂` in this `F₂`-discriminated completion.

Sources: [MRS-REGULAR] §2.1, E1–E3 and the centralizer-chain construction, pp. 3–4; [VAR-I] §1, Definitions 6–7 and Lemma 5, pp. 6–7; [IFT] §2.5, p. 7.

*Needs:* §§8.5–8.6 (admissible centralizer extensions and discrimination); Mathlib polynomial rings and group direct limits. No absolute limit-group embedding theorem is used.

### 8.`6b` Finite tower covers and irreducible coordinate-group embeddings

`Fix a` nonabelian free coefficient group `F` of finite rank. For finite `X` and a finite system `S⊆F[X]`, prove `LimitGroup.NTQ.finite_tower_cover`: there are a finite index set I, normalized towers `T_j` over `F` as in §8.8, finite generating tuples `Y_j` with finite saturated presentations `U_j⊆F[Y_j]`, and tuples of words `p_j∈F[Y_j]^X` such that

- for every `F`-homomorphism `ψ:T_j→F`, the tuple `p_j(ψ(Y_j))` solves `S`;
- every `v∈V_F(S)` equals `p_j(ψ(Y_j))` for some `j∈I` and some `F`-homomorphism `ψ:T_j→F`;
- each word tuple induces an `F`-homomorphism `θ_j:F_{R_F(S)}→T_j`, and its nonempty solution image is irreducible. Empty `V_F(S)` has `I=∅`.

Thus `R_F(S)` is the intersection of the kernels of `F[X]→T_j` given by the word tuples. This is a finite pointwise cover by all tower specializations, not just discriminating families or compositions of level retractions. For a raw TQ system, the cover includes the specializations where lower coefficient words vanish or their centralizers grow. Construct these branches using the parametric generalised equations, periodic structures, defining-presentation kernel reconstruction and full radical transport of §§7.1–7.6. Prove finiteness and both solution directions, including coefficient-degeneration branches, before extracting any component. The construction uses fixed-coefficient quadratic radicals only within an individual normalized tower; it never identifies them with the raw system's global radical.

If `V_F(S)` is nonempty and irreducible, one of the finitely many image closures is all of `V_F(S)`. For that `j`, `θ_j` is injective: a word vanishing in `T_j` vanishes on a dense solution image, hence on `V_F(S)`. Conversely tower discrimination (§8.9(2)) makes each `θ_j` well-defined on the radical quotient and each image irreducible. This proves the `F`-embedding into a normalized tower, equivalently for every finitely generated `F`-group `F`-discriminated by `F`. This owns the irreducible-to-tower input independently of the absolute embedding theorem; the tower-to-ICE input is §8.9(4), proved by structural induction.

**Checks.**

- For `S` empty, `F[X]` is the one-level empty tower and the word map is the identity.
- The equation `[x,a]=1` over `F(a,b)` has its admissible full-centralizer tower and identity word map.
- For `S={[u,v],[u,x]}`, retain both branches: `u=1` with `v`,`x` free, and `[u,v]=[u,x]=[v,x]=1`. Their carriers are `F∗F(v,x)` and `F∗ℤ³`, with word maps `(1,v,x)` and `(u,v,x)`. They cover every solution by commutation transitivity. The second carrier is the normalized tower obtained by repairing the conjugacy level over `F∗ℤ²`; the first retains `(1,a,b)`.
- A reducible union `⟨a⟩∪⟨b⟩` has a finite tower cover; its coordinate group cannot embed in an `F`-discriminated tower, since that would force discrimination and irreducibility.
- An abstract fully residually free group with coefficient subgroup `⟨a²,b⟩` need not be discriminated fixing those coefficients; use the specified relative hypothesis.

Sources: [VAR-II] §0, Theorems 2–3, p. 4, and §§1–9, pp. 7–37; [IFT] §5.6, Theorems 5–6, pp. 59–60, for the finite solution-tree and word-map covering. The terminal carriers here use the iterated fixed-coefficient radical presentations of §8.8; their comparison with the original system is the two solution directions above. Theorem 4 of [VAR-II], pp. 4–5, gives the separate passage to abstract groups.

*Needs:* §§7.1–7.6 (cancellation families, transformations, periodic structures and finite solution trees); §8.8 (normalized tower carriers); §§5.9–5.12 (Noetherianity, irreducibility and word maps); §6.8 (fixed-coefficient quadratic radicals); §8.9(2) (independent tower discrimination); §8.9(4) for the subsequent passage from towers to ICE.

### 8.7 Embedding theorems and finite presentability

Prove the following statement. `Fix a` nonabelian free group `F` of finite rank. (1) (Kharlampovich–Myasnikov) A finitely generated group is fully residually free if and only if it embeds in Lyndon's group `F^{ℤ[x]}`; equivalently it embeds in an admissible ICE group over a nonabelian free group of finite rank. (2) Every finitely generated residually free group embeds in a direct product of finitely many fully residually free groups. (3) Every finitely generated fully residually free group is finitely presented, and so is every finitely generated subgroup of it (they are themselves fully residually free). (4) Every finitely generated subgroup of an ICE group over `F` is built from free abelian groups of finite rank by finitely many free products, amalgams over abelian groups one of which is maximal abelian, free extensions of centralizers, and separated HNN extensions with abelian associated subgroups one of which is maximal abelian.

(1) Use the irreducible-coordinate-group embedding into a normalized tower of §8.6b, the independently proved tower-to-ICE embedding of §8.9(4), and the completion/ICE comparison of §8.6a. Conversely ICE groups are discriminated by §8.6. VAR-II Theorem 4 passes from an abstract finitely generated fully residually free group to its coefficient-free presentation over `F`; it does not assert discrimination fixing an arbitrary embedded coefficient subgroup.
(2) VAR-II Corollary 2, via §5.10 (Noetherian Zariski topology and irreducible components).
(3)–(4) VAR-II Theorem 6 and Corollary 3 (structure of finitely generated subgroups of ICE groups by induced splittings, Layer 4).

The closed surface group `S⁺(2, 0)` embeds in an ICE group over `F₂`. `F₂ × F₂` (residually, not fully residually free) embeds in a product of two fully residually free groups, as (2) allows.

Use [VAR-II] §0, Theorems 1, 3, 4, 6 and Corollaries 2–3, pp. 4–5: The quadratic embeddings supply the normalized tower-to-ICE induction of §8.9; a finitely generated group is fully residually free iff it embeds in `F^{ℤ[x]}`; residually free groups embed in finite products; the structure of finitely generated subgroups of ICE groups and finite presentability.; [LIMITS] §4, Theorem 4.2, p. 30: First characterisation: limit groups are exactly the finitely generated subgroups of iterated extensions of centralizers of free groups.; [SUBGROUPS] §2.3, Theorems 1–2, p. 6: Effective versions: from a finite presentation one constructs the embedding into `F^{ℤ[t]}` and into an ICE group.

*Needs:* §8.5 (Extensions of centralizers and iterated extensions); §8.6 (Extensions of centralizers are discriminated by the base group); §8.4 (Limit groups are the finitely generated fully residually free groups); §8.8 (raw TQ systems and normalized NTQ towers); §8.9(4) (normalized tower-to-ICE embedding); §8.6a (Lyndon completion and ICE comparison); §8.6b (irreducible-to-tower embedding); §7.2–§7.6 (cancellation families and solution trees); §5.10 (Noetherian Zariski topology and irreducible components); §4.10–§4.11 (induced splittings and subgroup structure) for (3)–(4); Mathlib `Group.IsFinitelyPresented`.

### 8.8 Raw TQ systems and normalized NTQ towers

A raw TQ system `LimitGroup.NTQ.System` over `G` is a finite system `S=S₁∪⋯∪S_n` in disjoint finite variable tuples `X₁`,`…`,`X_n`. Its raw lower groups are `G_{R_G(S_{i+1},…,S_n)}`. Each level is (1) a standard quadratic equation; (2) equations `[x,y]=[x,v]=1` for `x`,`y∈X_i` and `v` in a specified finite set of lower coefficient words; (3) `[x,y]=1` for `x`,`y∈X_i`; or (4) empty. Coefficients are words in `G` and the lower variables. `LimitGroup.NTQ.IsNondegenerate` means that each level has a solution in its raw lower coordinate group. This condition alone gives no discrimination or irreducibility assertion for the raw global coordinate group.

A normalized NTQ tower `LimitGroup.NTQ.Tower` is instead built from the bottom up, with `T_{n+1}=G`. Over the fixed lower carrier `H=T_{i+1}`, its next carrier `T_i` is one of:

1. `H[X_i]/R_H(Q_i)`, where `Q_i` is a consistent standard quadratic equation with specified `H`-solution and the nonidentity coefficients required by §6.5. Its presentation uses the entire fixed-`H` radical of §6.8, including all full-centralizer relations for nonregular quadratic levels. Regular levels use `ncl(Q_i)`.
2. `H∗_{C_H(u_i)}(C_H(u_i)×ℤ^{|X_i|})`, with `X_i` nonempty and admissible full-centralizer data.
3. `H∗ℤ^{|X_i|}`.
4. `H∗F(X_i)`.

`LimitGroup.NTQ.IsAdmissibleCentralizerLevel` requires `u_i≠1`, `u_i` not a proper power, an abelian `C_H(u_i)`, and a finite set `U_i` generating that entire subgroup, with positive added rank. The representative `IsAdmissibleCentralizerLevel` records these conditions over the fixed lower carrier `H`. At a quadratic conjugacy level `c^z d=1`, `d⁻¹=c^b`, use all relations `[z b⁻¹,h]=1` for `h∈C_H(c)`, whether or not the raw level was labelled type (2). Root reduction concerns the full centralizer and does not remove these relations. For towers with finite presentations, record finite generators for every centralizer used in exceptional quadratic radicals as well. Over finite-rank free `F`, §8.9 supplies these finite centralizer data independently of §8.7.

Write `U^sat` for the union of the tower's defining relators, lifting coefficients and fixed-`H` radical generators to words in the lower variables and `G`. Its defining quotient is `T₁`. A raw system and a tower obtained by adding these relators have a defining-presentation quotient map, but need not have the same `G`-points or the same global radical. The comparison for all solutions is the finite tower cover of §8.6b. In particular, a lower specialization killing `c` can release `z` from the fixed-`H` centralizer relations and must be represented by another branch.

The public interface should expose the following named results:

- `LimitGroup.NTQ.System`: Raw levels with their types and coefficient words.
- `LimitGroup.NTQ.IsNondegenerate`: Solvability over the raw lower coordinate groups, with no tower conclusion.
- `LimitGroup.NTQ.Tower`: Iterated fixed-coefficient carriers, quadratic solutions and radical presentations, and admissible full-centralizer data.
- `LimitGroup.NTQ.levelGroup`: `T_i` of a normalized tower, rather than the raw tail's global radical quotient.
- `LimitGroup.NTQ.IsRegular`: Every raw level regular quadratic or empty, with a solution at each lower level. Such a system has its normalized tower with the same defining equations; §8.9 identifies its global coordinate group with `T₁`.
- `LimitGroup.NTQ.IsAdmissibleCentralizerLevel`: The full-centralizer conditions over `H` above.
- `LimitGroup.NTQ.inclusion`: The coefficient homomorphisms `T_{i+1}→T_i`.
- `LimitGroup.NTQ.retraction`: A fixed-`H` quadratic solution, or the assignment of 1 to new abelian or free generators, gives `T_i→T_{i+1}` left inverse to inclusion.

**Checks.**

- `LimitGroup.NTQ.genus2`: The one-level equation `[x₁,y₁][x₂,y₂]=1` over `F(a,b)` is regular, with tower `F∗S⁺(2,0)`.
- `LimitGroup.NTQ.empty`: One empty level gives `F∗F(X)=F[X]`.
- `LimitGroup.NTQ.lyndon_not_regular`: The quadratic level `x₁²x₂²x₃²=1` is consistent but nonregular; its normalized carrier is `F∗ℤ²` with `x₁x₂x₃=1` as well as pairwise commutation.
- `LimitGroup.NTQ.degenerate_example`: `[x,y]=a` over `F(a,b)` has no solution by abelianization and gives no quadratic tower level.
- Over `F(a,b)`, `[x,a]=[x,b]=1` with `U={a,b}` and `u=1` has the solution `x=1` but fails centralizer admissibility. Its defining quotient `F₂×ℤ` differs from its radical quotient `F₂`.
- Over `H=⟨a,b,t | [a,t]=1⟩`, both a type-(2) level at a with `U={a,t}` and the normalized quadratic level `a^x a⁻¹=1` include `[x,t]=1` as well as `[x,a]=1`.
- With lower raw system `[u,v]=1` and upper quadratic equation `u^x u⁻¹=1`, the raw nondegeneracy condition holds, but normalization gives `F∗ℤ³` and excludes the raw point `(u,v,x)=(1,a,b)`. The additional free branch `u=1` in §8.6b retains that point.

This interface supplies normalized terminal carriers to §§8.6b and 10.7–10.8. Layer 11 uses the regular subclass, whose tower presentation equals its original equations.

Sources: [IFT] §7.6, Definition 43, p. 137, for the four raw types and regularity; [VAR-II] §0, Definition 8, p. 4; [VAR-I] §1, Theorem 1, p. 7, and §3, Form 2, p. 28, for the fixed-coefficient quadratic carriers and full-centralizer conjugacy radical. The tower definition keeps these fixed-coefficient quotients distinct from the raw global radical.

*Needs:* §§6.5–6.8 (standard quadratic equations, consistency, regularity and fixed-coefficient radicals); §5.2 (global radicals and coordinate groups); §8.5 (full-centralizer extensions); §4.3 (normal forms).

### 8.9 Normalized towers: radicals, discrimination and level maps

Let `T` be a normalized NTQ tower over a nonabelian fully residually free `G`, with carriers `T_i` and saturated presentation `U^sat` as in §8.8. Prove: (1) `R_G(U^sat)=ncl(U^sat)`, so `T₁≅G_{R_G(U^sat)}`; for a regular raw system `S` the saturation adds no relations and `R_G(S)=ncl(S)`. (2) `T₁` is `G`-discriminated by `G` and `V_G(U^sat)` is irreducible. (3) Each `T_{i+1}→T_i` is injective and has the specified retraction. (4) `T₁ G`-embeds in a finite chain of admissible full-centralizer extensions over `G`. None of these conclusions identifies the global coordinate group of an arbitrary nondegenerate raw TQ system with its normalized tower.

Prove (4) independently of §8.7 by induction on the fixed-coefficient carriers. VAR-I Theorem 1 supplies the quadratic coordinate-group embedding over `H=T_{i+1}`, using the repaired radicals of §6.8 for nonregular equations and the separate genus-two case. LIFT Propositions 5.1–5.2 provide the construction for regular equations with general-position solutions. A conjugacy level is the extension of the entire `C_H(c)`; types (2), (3) and (4) respectively extend a full centralizer, add a free abelian free factor and add a free factor. When `H` embeds in an ICE stage `E` over `G`, normal forms extend a centralizer step over `H` to one over `E`, since `C_E(u)∩H=C_H(u)`; iterate for the finite chain. Reduce nonidentity parameters to non-proper-powers by §8.6. No discrimination hypothesis is part of the tower definition.

Over a finite-rank free base `F`, also prove `LimitGroup.NTQ.finite_centralizer_data`: every nonidentity element in a finite ICE group `E` has a free abelian centralizer of finite rank, and the same holds in any subgroup `H≤E`. Induct on ICE steps using normal forms: an elliptic element's centralizer is conjugate into an unchanged old centralizer or the enlarged abelian vertex; a hyperbolic element has cyclic centralizer, since the pointwise stabilizer of its axis is trivial by malnormality. For `H` use `C_H(u)=H∩C_E(u)` and the subgroup theorem for finitely generated free abelian groups. This supplies finite full-centralizer generators for each quadratic radical and type-(2) attachment in §8.8, and hence finite saturated presentations for towers over `F`. It uses the ICE embedding in (4), not the general embedding theorem of §8.7.

Derive (2) from (4), §8.6's discrimination and §5.11's `G`-domain open-set argument, without Noetherianity. The defining quotient of `U^sat` is `T₁`, so discrimination gives (1). At a regular quadratic level the fixed-`H` radical is its defining normal closure; induction gives the regular-raw comparison. A fixed-`H` solution annihilates `R_H(Q_i)`, giving (3); types (2)–(4) retract by killing the new generators. The finite cover of §8.6b, not the level retractions alone, transports all raw-system specializations.

**Checks.**

- The nonregular level `x²=1` has fixed-coefficient radical `ncl(x)`, so its normalized carrier is `G` and it adds no QH vertex.
- Finite centralizer data in the empty ICE chain give `C_F(a)=⟨a⟩` for a basis letter `a`.
- After extending `C_F(a)`, the centralizer of `a` is `⟨a,t⟩≅ℤ²`, supplying both generators for the next normalized conjugacy level.
- In the same extension `F(a,b)(a,ℤ)`, the hyperbolic normal form bt has cyclic centralizer. The identity is excluded from the finite free abelian centralizer statement, since `C_E(1)=E` can be nonabelian.
- Over the abelian base `ℤ a` genus-two equation does not have its defining relator as radical; the nonabelian base hypothesis is necessary.
- `quadratic_specialization_radical_gap`: For `S={[u,v],[u,x]}` over `F(a,b)`, both `u` and `[v,x]` survive in `K=F_{R_F(S)}`, by the solutions `(a,1,1)` and `(1,a,b)`. Every map from `K` to a free group preserving `u` kills `[v,x]`, so `K` is neither fully residually free nor `F`-discriminated. Over the fixed lower `H=F∗ℤ²`, however, the radical of `u^x u⁻¹` contains `[v,x]`. This verifies the fixed-coefficient/global distinction using `radical`, `CoordGroup` and discrimination.
- `quadratic_specialization_reducible`: `V_F(S)=V_F(u=1)∪V_F([u,v]=[u,x]=[v,x]=1)`, with both subsets proper, witnessed by those same two solutions. The normalized pairwise-commuting carrier and the free `u=1` carrier both occur in the finite cover.
- For `H=F(a,b)∗⟨z⟩` and `K=H∗_{⟨z⟩}⟨z,x | [z,x]=1⟩`, level retractions followed by `z↦1` force `x↦1`, whereas `z↦1`,`x↦a` is an `F`-homomorphism `K→F`. All tower homomorphisms, rather than only iterated level retractions, enter the finite-cover interface.

Sources: [VAR-I] §1, Theorem 1, p. 7, and §3, Form 2, p. 28 (fixed-coefficient quadratic embeddings); [LIFT] §5, Propositions 5.1–5.2, pp. 266–270 (general-position regular embeddings); [IFT] §§2.5–2.7, pp. 6–9 (full centralizers, commutation transitivity and quadratic forms); [SUBGROUPS] §5, Lemmas 19–21, pp. 36–37 (normal-form centralizers in ICE chains, used directly for finite centralizer data). The induction is on normalized fixed-coefficient carriers; the counterexample prevents applying [VAR-I] Theorem 2 or [VAR-II] Theorem 1 to the global radical under raw solvability alone.

*Needs:* §8.8 (normalized carriers and saturated presentations); §6.8 (fixed-coefficient quadratic radicals); §6.9 (regular surface amalgams); §8.6 (centralizer-extension discrimination and root reduction); §§5.3, 5.11 (discrimination and irreducibility); §4.3 (normal forms and extension along a base embedding). §8.7 consumes (4).

### Examples

In `H=⟨a,b,t | [a,t]=1⟩`, specialization `t↦aᵏ` fixes `F(a,b)`. For every finite collection of nontrivial `H`-words, all sufficiently large `k` preserve their nontriviality. The centralizer of `a` is `⟨a,t⟩≅ℤ²`, showing why the cyclic-centralizer conclusion for free groups does not transfer to limit groups.

### Dependencies

This layer consumes Layers 4–7 and §8.6a's independent Lyndon carrier comparison. Surface models enter through the local targets of Layer 6.

## Layer 9: Length functions and infinite-word representations

Lyndon length functions with values in ordered abelian groups, freeness and regularity as separate properties, actions on `Λ`-trees, infinite words and Lyndon's group `F^{ℤ[t]}`; the free `ℤⁿ`-length functions of limit groups, and graphs labelled by finitely described infinite words and the Howson property.

### 9.1 Lyndon length functions: free and regular

Define `LyndonLength` as follows. Let `Λ` be an ordered abelian group and `G` a group. A Lyndon length function is `l : G → Λ` with (L1) `l(g) ≥ 0` for every `g` and `l(1) = 0`; (L2) `l(g⁻¹) = l(g)`; (L3) `c(g, f) > c(g, h) → c(g, h) = c(f, h)` for all `g`, `f`, `h`, where the Gromov product `c(g, f) = ½(l(g) + l(f) − l(g⁻¹ f))` is taken in the divisible hull `Λ ⊗ ℚ`. It is free when moreover (L4) `c(g, f) ∈ Λ` for all `g`, `f` and (L5) `l(g²) > l(g)` for `g ≠ 1`; it is regular when (L6) for all `g`, `f` there are `u`, `g₁`, `f₁` with `g = u ∘ g₁`, `f = u ∘ f₁` and `l(u) = c(g, f)`, where `x = y ∘ z` means `x = y z` and `l(x) = l(y) + l(z)`. Freeness and regularity are independent properties.

A structure with a function to `Λ` and the axioms; Gromov products valued in the divisible hull (Mathlib's `ℚ`-module of a torsion-free abelian group, or `Λ ⊗ ℚ`).

The public interface should expose the following named results:

- `LyndonLength`: A Lyndon length function `G → Λ`.
- `LyndonLength.gromov`: `c(g, f)` in the divisible hull of `Λ`.
- `LyndonLength.IsFree`: (L4) and (L5).
- `LyndonLength.IsRegular`: (L6).
- `LyndonLength.le_add`: `l(g f) ≤ l(g) + l(f)` and `0 ≤ c(g, f) ≤ min(l(g), l(f))`.
- `LyndonLength.comap`: Restriction along an injective homomorphism is a Lyndon length function, free if the original is.

**Checks.**

- `LyndonLength.freeGroup_norm`: `FreeGroup.norm` (Mathlib, `ℕ`-valued), cast to `ℤ`, is a free regular Lyndon length function with values in `ℤ`.
- `LyndonLength.zero`: `l ≡ 0` is a Lyndon length function on any group, free only on the trivial group.
- `LyndonLength.torsion_not_free`: On `ℤ/2` the function `l(1) = 0`, `l(g) = 1` for `g ≠ 1` is a Lyndon length function failing (L5): it is not free `(l(g²) = 0)`.
- `LyndonLength.Z2_lex`: On `ℤ²` with `Λ = Lex (Fin 2 → ℤ)`, `l(g) = |g|` (absolute value for the lexicographic order) is a free regular Lyndon length function: `ℤ²` acts freely on the `Λ`-tree `Λ` by translations.

The word length on `FreeGroup α` is a free regular `ℤ`-valued Lyndon length function. The function `l ≡ 0` on `ℤ` is a Lyndon length function that is not free.

This interface is used by Layer 9 infinite words: infinite words carry the standard free length function; Layer 9 embedding theorems: free `ℤⁿ`-length functions on limit groups; Layer 10 subgroup descriptions: Nielsen cancellation for the length function on `F^{ℤ[t]}`.

Use [LENGTH] §2.1–§2.2, axioms (L1)–(L6) and Example 1, pp. 4–5: Lyndon length functions, the Gromov product `c(g, f)`, free length functions (L4)–(L5), regular length functions (L6); word length on a free group is free and regular.; [MRS-REGULAR] §2, pp. 3–8: Lyndon length functions with values in ordered abelian groups and their properties.

*Needs:* Mathlib `FreeGroup.norm`; Mathlib `Lex`; Mathlib `FreeGroup`.

### 9.2 `Λ`-metric spaces, `Λ`-trees and free actions

Define `LambdaTree.MetricSpace` as follows. Let `Λ` be an ordered abelian group. A `Λ`-metric space is a nonempty set `X` with `d : X × X → Λ` such that `d(x, y) ≥ 0`, `d(x, y) = 0` iff `x = y`, `d(x, y) = d(y, x)` and `d(x, y) ≤ d(x, z) + d(z, y)`. A segment is the image of an isometry from an interval `[a, b]` of `Λ`; `X` is geodesic when any two points are the endpoints of a segment. A `Λ`-tree is a geodesic `Λ`-metric space in which (T2) two segments meeting in a single common endpoint have a segment as union and (T3) two segments with a common endpoint intersect in a segment. A group `G` acts on a `Λ`-tree by isometries; an isometry `g` is elliptic if it fixes a point, an inversion if `g²` fixes a point and `g` does not, and hyperbolic otherwise; the action is free (and without inversions) when every `g ≠ 1` is hyperbolic. For a base point `x`, `l_x(g) = d(x, g x)` is the based length function of the action.

Throughout this subsection assume: `Λ` an ordered abelian group (a linear order compatible with addition).

Structures for `Λ`-metric spaces and the tree axioms (T1)–(T3), segments as images of isometries from intervals of `Λ`, and the elliptic/inversion/hyperbolic trichotomy of isometries (KMS-ACTIONS §§4.2–4.3).
Every `Λ`-tree is 0-hyperbolic and its Gromov products `(x · y)_v` lie in `Λ` (KMS-ACTIONS Lemma 8, p. 26), which is what makes `l_x a` Lyndon length function satisfying (L4).

The public interface should expose the following named results:

- `LambdaTree.MetricSpace`: A `Λ`-valued metric satisfying (M1)–(M4).
- `LambdaTree`: A geodesic `Λ`-metric space satisfying (T2) and (T3).
- `LambdaTree.segment`: The segment `[x, y]`, unique in a `Λ`-tree.
- `LambdaTree.gromov_mem`: In a `Λ`-tree, `d(x, v) + d(y, v) − d(x, y) ∈ 2Λ`, so Gromov products lie in `Λ`, and the space is 0-hyperbolic.
- `LambdaTree.IsHyperbolic`: An isometry with no fixed point and no fixed point of its square.
- `LambdaTree.IsFreeAction`: Every nontrivial group element acts as a hyperbolic isometry.
- `LambdaTree.basedLength`: `l_x(g) = d(x, g x)` for a base point `x`.
- `LambdaTree.ofSerreTree`: The vertex set of a Serre tree (§2.1) with the path metric is a `ℤ`-tree, and every `ℤ`-tree arises this way.

**Checks.**

- `LambdaTree.self`: `Λ` itself with `d(a, b) = |a − b|` is a `Λ`-tree; `ℤ` acts freely on the `ℤ`-tree `ℤ` by translations.
- The empty convex subset of `ℤ` has no `Λ`-tree carrier, since the metric-space definition requires nonemptiness.
- `LambdaTree.point`: A one-point space is a `Λ`-tree, on which every isometry is elliptic, so only the trivial group acts freely on it.
- `LambdaTree.circle_not_tree`: The vertex set of a cycle of length 4 with the path metric is a geodesic `ℤ`-metric space but not a `ℤ`-tree: two segments between opposite vertices meet only in their endpoints, so (T3) fails; a definition asking only for geodesics would accept it.
- `LambdaTree.reflection_inversion`: On the `ℤ`-tree `ℤ`, the isometry `n ↦ 1 − n` is an inversion (no fixed point, its square is the identity), so an action of `ℤ/2` by it is not free without inversions.
- `LambdaTree.cayley_compat`: For the Cayley tree of `FreeGroup α` (a `ℤ`-tree) and the base point 1, the based length function is Mathlib's `FreeGroup.norm`.

`Λ` with `d(a, b) = |a − b|` is a `Λ`-tree, and so is every nonempty convex subset of `Λ` (KMS-ACTIONS Example 9). A `ℤ`-metric space is a `ℤ`-tree iff it is the vertex set of a simplicial tree with the path metric (KMS-ACTIONS Example 10), which links `ℤ`-trees to the Serre trees of Layer 2.

This interface is used by §9.3: free `Λ`-valued length functions are the based length functions of free actions on `Λ`-trees; §9.5 and VAR-II Corollary 6: finitely generated fully residually free groups act freely on `ℤⁿ`-trees; Layer 4 Bass–Serre theory: for `Λ = ℤ`, `Λ`-trees are the simplicial trees of the Bass–Serre theory.

Use [KMS-ACTIONS] §4.2, pp. 25–26 (axioms (M1)–(M4), segments, (T1)–(T3), Examples 9–10, Lemma 8); §4.3, pp. 26–28 (elliptic, inversion, hyperbolic, axis and translation length, Theorem 6); §4.4, p. 28 (`Λ`-free groups): `Λ`-metric spaces and `Λ`-trees, the classification of isometries of a `Λ`-tree, and free actions (every nontrivial element hyperbolic); `ℤ`-trees are simplicial trees.; [LENGTH] §2.1, Theorem 1, p. 5: Free Lyndon length functions with values in `A` correspond to free actions on `A`-trees (Chiswell), which is the use made of `Λ`-trees in this layer.

*Needs:* Mathlib `Lex`; §2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges); §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees).

### 9.3 Length functions and actions on `Λ`-trees

Prove the following statement. For an ordered abelian group `Λ`, a group `G` has a free Lyndon length function with values in `Λ` if and only if `G` acts freely on a `Λ`-tree; the length function is `l(g) = d(x, g x)` for a base point `x`. For `Λ = ℤ`, `Λ`-trees are the simplicial (Serre) trees of Layer 2 with their path metric, and a free action without inversions on such a tree corresponds to a free `ℤ`-valued length function.

From an action, `l(g) = d(x, g x)` satisfies (L1)–(L5) (free action: no fixed points and no inversions).
Conversely Chiswell's construction builds a `Λ`-tree from the length function (LENGTH Theorem 1 citing Chiswell).

`F(a,b)` acting on its Cayley tree gives the word length.

Use [LENGTH] §2.1, Theorem 1, p. 5: A group has a free Lyndon length function with values in `A` iff it acts freely on an `A`-tree (Chiswell).; [MRS-REGULAR] §2, pp. 3–8: `Λ`-trees and the correspondence with length functions.; [KMS-ACTIONS] §5, pp. 34–36: The based length function `l_x(g) = d(x, g x)` of an action on a `Λ`-tree is a Lyndon length function; free actions give free length functions, and Chiswell's construction goes back.

*Needs:* §9.1 (Lyndon length functions: free and regular); §9.2 (`Λ`-metric spaces, `Λ`-trees and free actions); §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); §2.1 (Serre graphs: graphs with edge reversal, loops and multiple edges).

### 9.4 Infinite words over an ordered abelian group

Define `InfWord` as follows. Let `Λ` be a discretely ordered abelian group (least positive element 1) and `X` a set. An infinite (`Λ`-)word is a function `w : [1, α_w] → X^{±1}` on the interval `[1, α_w] = {β ∈ Λ | 1 ≤ β ≤ α_w}`, `α_w ≥ 0`, with `|w| := α_w`; it is reduced when `w(β + 1) ≠ w(β)⁻¹`. `R(Λ, X)` is the set of reduced `Λ`-words with the partial multiplication `u ∗ v` (defined when the maximal common initial segment `com(u⁻¹, v)` exists, removing it), and inversion. `CDR(Λ, X)` is the subset of words admitting a cyclic decomposition `c⁻¹ ∘ v ∘ c` with `v` cyclically reduced. For `Λ = ℤ`, `R(ℤ, X)` is the set of reduced words and `∗` is the multiplication of `FreeGroup X`.

Words as functions on intervals of `Λ`; `∗` defined when the cancellation segment is an interval with a maximal element (MRS-REGULAR §3).

The public interface should expose the following named results:

- `InfWord`: Reduced `Λ`-words: a length `α` and a function on `[1, α]` with no cancelling adjacent letters.
- `InfWord.mul`: The partial product `u ∗ v`.
- `InfWord.inv`: `w⁻¹(β) = w(α_w + 1 − β)⁻¹`.
- `InfWord.CDR`: Words with a cyclic decomposition `c⁻¹ ∘ v ∘ c`.
- `InfWord.length_isLyndon`: On any subgroup of `CDR(Λ, X)`, `w ↦ |w|` is a free Lyndon length function (MRS-REGULAR Corollary 4.2).
- `InfWord.equivFreeGroup`: For `Λ = ℤ`, the reduced words with `∗` form a group isomorphic to `FreeGroup X`, with `|·| = FreeGroup.norm`.

**Checks.**

- `InfWord.ZFreeGroup`: For `Λ = ℤ` and `X = Fin 2`, `InfWord ℤ X ≃ FreeGroup (Fin 2)` as groups, matching `toWord`.
- For a discretely ordered non-Archimedean `Λ`, P1–P4 alone do not justify a universal-group normal form; that theorem applies only after P5 is proved for the chosen subset.
- `InfWord.empty`: The empty word `(α = 0)` is the identity for `∗`.
- `InfWord.at_mul_a`: In `R(ℤ[t], {a, b})`, `a^t ∗ a = a^{t+1}` and `|a^t ∗ b| = t + 1`.
- `InfWord.undefined_product`: In `R(ℤ[t], {a, b})` let `v` be the word on `[1, t]` that is `a` at the integers 1, 2, 3, `…` and `b` at the other elements of `[1, t]`; the common initial segment of `a^t` and `v` is `{1, 2, 3, …}`, which has no largest element, so `(a^t)⁻¹ ∗ v` is undefined: `∗` is genuinely partial, and `R(Λ, X)` is not a group.

For `Λ = ℤ[t]` with `t ≫ 1`, the word `a^t` (the constant function `a` on `[1, t]`) is an infinite word of length `t`; `a^t ∗ a = a^{t+1}`. `R(ℤ, X)` with `∗` is `FreeGroup X` via `toWord`.

This interface is used by Layer `9 F^{ℤ[t]}`: elements of Lyndon's group are infinite `ℤ[t]`-words; Layer 9 infinite-word graphs: edge labels of `(ℤ[t], X)`-graphs; Layer 10 finite descriptions of limit groups: standard decompositions of elements as infinite words.

Use [MRS-REGULAR] §3, Theorem 3.4, p. 10; §4, Theorem 4.1 and Corollary 4.2, p. 14: Reduced `A`-words with partial multiplication satisfy pregroup axioms P1–P4; P5 is proved for the specified extension-of-centralizers subsets in §6, not for all of `R(A,X)`; on `CDR(A, X)` the length is a free Lyndon length function, inherited by every subgroup.; [LENGTH] §2.3, Theorems 2–4 and Corollary 1, p. 9: Infinite words and length functions: subgroups of `CDR(A, X)` have free length functions (Theorem 2); a group with a free length function in a discretely ordered `A` embeds length-preservingly in `CDR(A, X)` (Theorem 3), for arbitrary `A` after passing to `ℤ ⊕ A` (Corollary 1), and a free regular length function embeds in `R(A′, X)` with regular induced length (Theorem 4).

*Needs:* Mathlib `Lex`; Mathlib `FreeGroup`.

### 9.5 Lyndon's group `F^{ℤ[t]}` as infinite words, and free length functions on limit groups

Use the completion and ICE comparison of §8.6a as the carrier `F^{ℤ[t]}`; this subsection constructs its infinite-word representation.

Prove the following statement. (1) This completion embeds in `CDR(ℤ[t],X)`, and the induced length `L(w)=|w|` is a free regular Lyndon length function with values in `ℤ[t]` ordered with `t≫1`. (2) Consequently every finitely generated fully residually free group has a free Lyndon length function with values in `ℤⁿ` with the lexicographic order, for some `n` (restrict to the finitely generated subgroup, whose lengths lie in a finitely generated subgroup `ℤⁿ` of `ℤ[t]`). (3) Regularity is not inherited by subgroups: a finitely generated subgroup of `F^{ℤ[t]}` has a free length function that need not be regular; every finitely generated group acting freely on a `ℤⁿ`-tree embeds length-preservingly in a finitely generated group acting freely and regularly on a `ℤⁿ`-tree (KMS-ACTIONS Theorems 48–49; an enlargement), and a finitely generated group with a free regular `ℤⁿ`-length function admits, after removing unused convex height levels, a finite chain `G₁ < ⋯ < G_m = G` with `1≤m≤n` for `n≥1` and `G₁` free of finite rank and each `G_{i+1}` obtained from `G_i` by finitely many HNN extensions associating cyclically reduced centralizers by length-preserving isomorphisms (LENGTH Theorem 7, with the height normalized). For `n=0` freeness forces `G` to be trivial.

(1) MRS-REGULAR §§5–7: Lyndon's exponentiation on `CDR(ℤ[t], X)` (Theorem 5.5) and the embedding of each extension of centralizers (Theorems 6.15, 6.17) into `CDR`, with regularity of the length.
(2) §8.7 with (1).
(3) KMS-ACTIONS §10.4 (Completions of `ℤⁿ`-free groups) constructs the regular completion by induction on `n` (Theorems 47–49); LENGTH Theorems 6–7 give the structure of regular `ℤⁿ`-free groups.

**Checks.**

- The ICE group `⟨a,b,s | [a,s]=1⟩` maps over `F(a,b)` into the completion by `s↦a^t`; its infinite-word length is `t` and it acts freely on a `ℤ²`-tree.
- On `ℤ`, `l(k)=(0,0,|k|)` in `Lex ℤ³` is free and regular but has only one used height and a one-term structural chain; strict chain length is not the ambient `n`.
- A closed surface group `S⁺(2,0)` has a free `ℤⁿ`-length function for some `n`, using §8.7 only for this corollary.
- Every finite set of completion elements belongs to one finite stage of the direct limit, while all polynomial exponents need not lie in one finite stage.
- The inadmissible pushout `F₂(1,ℤ)=F₂×ℤ` cannot embed over `F₂` in the completion, which is `F₂`-discriminated; the ICE comparison applies only to admissible steps.

Use [VAR-I] §1, Definitions 6–7 and Lemma 5, pp. 6–7, and [IFT] §2.5, p. 7 (tensor completion, centralizer-chain realization and comparison); [MRS-REGULAR] Abstract and §1; §5, Theorem 5.5; §6, Theorems 6.15 and 6.17; §7, pp. 1–`32: F^{ℤ[t]}` is represented by infinite `ℤ[t]`-words with a free regular Lyndon length function; every finitely generated fully residually free group has a free length function in `ℤⁿ`.; [KMS-ACTIONS] §10.4, Theorems 47–49, pp. 97–99: Length-preserving regular completion for finitely generated `ℤⁿ`-free groups; [LENGTH] §4.3, Theorems 6–7, pp. 20–21: Finitely generated groups with a free regular `ℤⁿ`-length function are iterated HNN extensions of a free group along centralizers.; [VAR-II] §0, Corollary 6, p. 6: Every finitely generated fully residually free group acts freely on a `ℤⁿ`-tree with the lexicographic order.

*Needs:* The carrier and ICE comparison are supplied by §8.6a. Its infinite-word realization (1) also needs §9.4 (Infinite words over an ordered abelian group) and §9.1 (Lyndon length functions: free and regular). The limit-group corollary (2) needs §8.7; the action and regular-completion results (3) use §9.3 (Length functions and actions on `Λ`-trees).

### 9.6 Graphs labelled by infinite words

Define `InfWord.Graph` as a finite Serre graph with inverse-compatible labels in `R(ℤ[t],X)`, each given by a finite standard decomposition into ordinary words and powers `u^{f(t)}` of cyclically reduced words. Its accepted subgroup consists of products of closed-path labels for which the partial multiplication is defined. Define `U`-foldedness by all ten conditions `(i)`–`(x)` of SUBGROUPS §2.5, p. 9. Expand each finite standard decomposition into edges labelled ordinary letters or powers `u^α` from the ordered Lyndon set, and prove that this subdivision preserves accepted labels. Apply the ten conditions to this expanded graph. Construct its ordered Lyndon set `U`, standard decompositions, `u`-components and their exponent-labelled paths, component subgroups `H_u(v)`, and level graphs, with the compatibility of path products and standard decomposition required in those conditions. SUBGROUPS §3.1, Definitions 1–2, pp. 11–12 define the partial product and product graphs, separately from `U`-foldedness. For a finite family `h₁`,`…`,`h_k` in `F^{ℤ[t]}` there exists a based `U`-folded graph accepting exactly `⟨h₁,…,h_k⟩`. The target is existence and its accepted-subgroup characterization.

The API includes `InfWord.Graph`, `InfWord.Graph.IsUFolded`, `InfWord.Graph.accepted`, `InfWord.Graph.exists_ofGens`, and a product-core construction whose accepted subgroup is the intersection. Require that ordinary `ℤ`-length labels recover the Stallings correspondence of Layer 2. Standard decompositions are part of the domain; arbitrary functions on infinite intervals need not admit them.

**Checks.**

- `⟨a^t b⟩` has a `U`-folded representation after subdividing its standard decomposition and completing its `u`-components; an unsplit macro-labelled loop does not by itself satisfy the ten conditions.
- The empty generating family has the one-vertex edgeless graph and accepts `⊥`.
- For the ordinary words `a b`,`a c` the graph agrees with the two-vertex, three-edge-pair Stallings graph.
- Partial foldedness alone does not supply the lower-level paths required by conditions (iii)–`(x)`, so the predicate retains those conditions.
- An arbitrary reduced function on `[1,t]` lacking a finite standard decomposition does not meet the definition's representation hypothesis.

Sources: [SUBGROUPS] §§2.4–2.5, conditions `(i)`–`(x)`, p. 9, and Proposition 5, p. 10; §3, Definitions 1–2, Corollaries 1–2, Lemma 10, Theorems 4–5, pp. 10–15; [MRS-REGULAR] §8, Proposition 8.3 and Corollaries 8.4, 8.6, pp. 34–36; [INFINITE-WORDS] the paper as cited in SUBGROUPS §2.4.

*Needs:* §9.4 (Infinite words over an ordered abelian group); §9.5 (Lyndon's group `F^{ℤ[t]}` as infinite words, and free length functions on limit groups); §2.3 (`α`-labelled graphs (`X`-digraphs) and the subgroup they accept); §2.4 (Stallings folds as graph quotients); §2.6 (The Stallings graph of a finitely generated subgroup).

### 9.7 Intersections and the Howson property

For finitely generated subgroups `H`,`K` of `F^{ℤ[t]}`, prove that `H∩K` is finitely generated, represented by the core of the appropriate product of `U`-folded graphs. Consequently every finitely generated fully residually free group has the Howson property. Membership is the accepted-path characterization on the `U`-folded graph; preserve the compatibility with the ordinary Stallings criterion. This asks for mathematical subgroup descriptions.

The subgroup `⟨a^t⟩` contains `a^{2t}` but not `a^{t+1}`; `k t=t+1` has no solution `k∈ℤ`.

Sources: [SUBGROUPS] §2.4, Proposition 5, p. 10; §3, Theorems 4–6 and Corollaries 3–4, pp. 14–16.

*Needs:* §9.6 (`(ℤ[t], X)`-labelled graphs of finitely generated subgroups); §2.10 (Intersections: product graphs and the Howson property).

### Examples

Embed `⟨a,b,t | [a,t]=1⟩` in `F(a,b)^{ℤ[t]}` by sending the stable letter to the infinite word `aᵗ`. Then `|aᵗb|=t+1` in the ordered group `ℤ[t]`. The subgroup `⟨aᵗ⟩` contains `a²ᵗ` but not `aᵗ⁺¹`, as the exponent equation `k t=t+1` has no integer solution.

### Dependencies

This layer consumes Layers 2, 4 and 8, including their local graph and surface inputs. Its direct external suppliers are the pinned declarations specified above.

## Layer 10: JSJ structure and finite solution diagrams

JSJ theory for finitely generated fully residually free groups, finite marked Grushko and JSJ graphs, Makanin–Razborov factorization diagrams, and finite irreducible-component systems. Equations over a limit group carry a separate constrained-factorization target and source contract.

### 10.1 Universal ellipticity, JSJ trees and the JSJ deformation space

Define `GTree.JSJ.IsUniversallyElliptic` as follows. `Fix a` group `G`, a family `𝒜` of subgroups closed under conjugation and taking subgroups (cyclic, or abelian), and a finite family `ℋ` of subgroups. Among minimal `(𝒜, ℋ)`-trees (§4.6): a subgroup is universally elliptic when it is elliptic in every `(𝒜, ℋ)`-tree, and a tree is universally elliptic when its edge stabilizers are. A JSJ tree is a universally elliptic `(𝒜, ℋ)`-tree dominating every universally elliptic `(𝒜, ℋ)`-tree; the JSJ deformation space is the set of JSJ trees (when nonempty it is one deformation space over the universally elliptic groups of `𝒜`). A vertex stabilizer of a JSJ tree is rigid when it is elliptic in every `(𝒜, ℋ)`-tree and flexible otherwise. Two JSJ decompositions are equivalent when they lie in the same deformation space; no single displayed graph of groups is canonical.

Predicates on `(𝒜, ℋ)`-trees defined from Layer 4's ellipticity and domination.

The public interface should expose the following named results:

- `GTree.JSJ.IsUniversallyElliptic`: Elliptic in every `(𝒜, ℋ)`-tree.
- `GTree.JSJ.IsJSJ`: Universally elliptic and dominating every universally elliptic tree.
- `GTree.JSJ.IsRigidVertex`: Vertex stabilizer elliptic in every `(𝒜, ℋ)`-tree.
- `GTree.JSJ.IsFlexibleVertex`: Not rigid.
- `GTree.JSJ.equivalent_iff`: Two JSJ trees are in the same deformation space, i.`e`. have the same elliptic subgroups.

**Checks.**

- `GTree.JSJ.free_group`: For `FreeGroup (Fin 2)` over cyclic groups, every minimal free action on a tree is a JSJ tree (vertex stabilizers trivial).
- `GTree.JSJ.surface_flexible`: For `S⁺(2, 0)` over cyclic groups the JSJ tree is a point and the vertex is flexible: the cyclic splittings along intersecting curves are not universally elliptic.
- `GTree.JSJ.trivial_group`: For the trivial group the point is the JSJ tree.
- `GTree.JSJ.not_unique_tree`: JSJ trees are not unique up to isomorphism (outer space for `F₂` has many points): a definition demanding a unique displayed graph of groups is wrong; equality is equality of deformation spaces.

For `F_n` (any `𝒜` containing the trivial subgroup) the JSJ trees are the free actions of `F_n` on trees (outer space); all vertex stabilizers are trivial. For a closed surface group `S⁺(g, 0)`, `g ≥ 2`, over cyclic groups, the JSJ tree is a point and the vertex is flexible (QH).

This interface is used by Layer 10 existence and marked finite graphs; Layer 10 Makanin–Razborov diagrams: modular groups are generated by twists along JSJ edges and automorphisms of flexible vertices; Layer 11: QH vertices of NTQ groups.

Use [GL-JSJ] Introduction, pp. 3–5; §2, Definition 2.7, p. 24, Definition 2.12, p. 25, Definition 2.14, p. 26: Universally elliptic subgroups and trees, JSJ trees as universally elliptic trees dominating all universally elliptic trees, the JSJ deformation space, rigid and flexible vertices.; [JSJ] §2 (splittings), pp. 101–120: Cyclic and abelian splittings of fully residually free groups and their JSJ decompositions in Kharlampovich–Myasnikov's formulation; there 'rigid' means a non-QH, non-abelian vertex group (p. 106), whereas this definition uses Guirardel–Levitt's universal definition.

*Needs:* §4.6 (Group actions on trees: elliptic and hyperbolic elements, relative trees); §4.12 (Collapses, refinements and domination of splittings); §6.10 (Quadratically hanging (QH) vertices and their peripheral data).

### 10.1a Accessibility and trees of cylinders

Own two accessibility inputs. For finitely presented `G` and a sequence `T₁←T₂←⋯` of refinements by collapse maps, construct a tree `S` with finitely generated edge and vertex stabilizers and morphisms `S→T_k` for all sufficiently large `k`. Relatively, for `G` finitely presented relative to a finite family `ℋ`, and `(𝒜,ℋ)`-trees `T_k`, construct such an `(𝒜,ℋ)`-tree `S` with finitely generated edge stabilizers. When the members of `ℋ` are finitely generated, its vertex stabilizers are finitely generated as well. These are eventual domination assertions, not stabilization of the deformation spaces. Build the finite-resolution argument of `GL`-JSJ Proposition 2.24, using the presentation complexes and tracks appearing in its proof.

For finitely generated torsion-free CSA `G` and a minimal tree with nontrivial abelian (respectively cyclic) edge stabilizers, define the tree of cylinders using commutation of edge stabilizers, its collapsed tree, and small domination (the new elliptic subgroups are abelian). Prove the cylinder comparison and uniform `(2,1)`-acylindricity of `GL`-JSJ Proposition 7.12. Own the acylindrical accessibility input: for fixed `k`, a bound depending on `G` and `k` on edge orbits of minimal reduced `k`-acylindrical trees; together with the limiting refinement argument of §8.1.1, deduce the torsion-free CSA specialization of Theorem 8.7 for `G` freely indecomposable relative to `ℋ`. The limiting argument includes compactness of projectivized length functions, convergence to real-tree actions and agreement of the axes and Gromov topologies (Appendix A), as well as the relative ellipticity and smallness conclusions needed for the cylinder construction. For the limiting actions arising in this argument, prove Lemma 8.4's arc and tripod stabilizer conclusions and the graph-of-actions decomposition used on p. 83 (simplicial, axial and surface components in the torsion-free case); this decomposition input is owned here. Use the surface QH conclusion of Theorem 9.5 for these torsion-free endpoints.

**Checks.**

- A constant sequence yields a morphism from a tree with finitely generated stabilizers onto the given tree, even when that tree's original edge groups are not finitely generated.
- `GL`-JSJ Remark 2.18's descending cyclic refinements need not stabilize their deformation spaces; the accessibility tree still eventually dominates them.
- In a torsion-free CSA group the cylinder segment stabilizer is trivial for length at least three; a noncyclic abelian cylinder stabilizer may become elliptic, so the new tree need not have the same deformation space.
- Relative accessibility retains each `H∈ℋ` elliptic; finite generation of these `H` is needed for the vertex finite-generation conclusion.

Sources: [GL-JSJ] §2, Proposition 2.17 and Remark 2.18, pp. 26–27, Proposition 2.24 and its proof, pp. 28–30; §7, Proposition 7.12, p. 78; §§8.1.1–8.2, pp. 81–90 (accessibility and Theorem 8.7); §9, Theorem 9.5, p. 91; Appendix A.1–A.3, pp. 109–115 (length functions and real-tree convergence).

*Needs:* §§4.6–4.8 (tree actions and their quotient graphs of groups); §4.12 (refinements and domination); §6.10 (surface QH); §9.2–§9.3 for real trees and length functions; `ClassifyingSpaces` Stage 2 item 7 for presentation complexes and their fundamental-group comparison, with the relative finite-cell construction and track resolution owned by this target.

### 10.2 Existence of abelian and cyclic JSJ decompositions of limit groups

Prove the following statement. (1) If `G` is finitely presented (relative to a finite family `ℋ` of finitely generated subgroups), the JSJ deformation space of `G` over any family `𝒜` (relative to `ℋ`) is nonempty and contains a tree with finitely generated edge and vertex stabilizers. (2) If `G` is a finitely generated torsion-free CSA group freely indecomposable relative to `ℋ`, it has an abelian JSJ decomposition relative to `ℋ`, with nonabelian flexible vertices satisfying the surface QH interface of §6.10. (3) For a finitely generated fully residually free group `G` (finitely presented and CSA by Layer 8), the cyclic and abelian JSJ decompositions relative to a finite family of finitely generated subgroups exist, and their flexible vertices are surface QH vertices of §6.10 or abelian vertices; rigidity is relative to the chosen family: an abelian-JSJ rigid vertex is elliptic in every relative abelian splitting, while a cyclic-JSJ rigid vertex has this assertion only for relative cyclic splittings.

Throughout this subsection assume: `G` finitely presented relative to `ℋ` for (1); torsion-free finitely generated CSA and relative free indecomposability for (2); fully residually free and finitely generated for (3).

(1) The eventual domination theorem of §10.1a supplies a tree dominating the refinement sequence with finitely generated stabilizers (`GL`-JSJ Theorem 2.16, relative Theorem 2.20).
(2) Use §10.1a's acylindrical accessibility, limiting argument and tree-of-cylinders comparison to obtain `GL`-JSJ Theorem 9.5.
(3) Combine with §8.7 (Embedding theorems and finite presentability) and §8.2; the description of flexible vertices is `GL`-JSJ §9 for CSA groups and SELA-I §2 for limit groups.

For `G = F(a,b) ∗_{a = [x,y]⁻¹} F(x, y)` relative to `ℋ = {F(a,b)}`, the abelian JSJ decomposition has the rigid vertex `F(a,b)` and the QH vertex `F(x, y)`. Without `ℋ` it does not: `G = ⟨b, x, y⟩` is free of rank 3, so its JSJ trees have trivial vertex groups.

Use [GL-JSJ] §2, Theorem 2.16 and Theorem 2.20, pp. 26–27; §9, Theorem 9.5, p. 91: Finitely presented (relatively finitely presented) groups have JSJ decompositions over any family; torsion-free finitely generated CSA groups have abelian JSJ decompositions.; [SELA-I] §2, Theorem 2.7, p. 43, and §3, Theorem 3.2, p. 44: Freely indecomposable limit groups admit abelian JSJ decompositions with QH, abelian and rigid vertices, and non-abelian ones admit principal cyclic splittings.; [JSJ] §9, Theorem 9.1, and §13, pp. 179–207: Non-degenerate JSJ `ℤ`-decompositions of freely indecomposable fully residually free groups.

*Needs:* §10.1a (relative accessibility; acylindrical accessibility; trees of cylinders); §10.1 (Universal ellipticity, JSJ trees and the JSJ deformation space); §8.7 (Embedding theorems and finite presentability); §8.2 (Structure of fully residually free groups); §4.12 (Collapses, refinements and domination of splittings); §6.10 (Quadratically hanging (QH) vertices and their peripheral data); Mathlib `Group.IsFinitelyPresented`.

### 10.3 Presentations, embeddings and kernel criteria

Let `G` be finitely generated and fully residually free, given by a finite presentation `⟨X|S⟩`. Prove that a represented word `w` is trivial in `G` if and only if the coefficient-free universal sentence `∀X(S=1→w=1)` holds in `F₂`. For a finite presentation over `F` use the same criterion with coefficients only when its specified `F`-embedding is discriminated by `F`. Prove also that every finitely generated subgroup has a finite presentation on its given generators and an embedding into an ICE group, with generator images represented by words. For a homomorphism between two such groups given on generators, injectivity is triviality of its kernel and surjectivity is generation by the images. Retain the recursive decidability assertions for word equality, membership, conjugacy and injectivity or surjectivity on this class.

**Checks.**

- For a free presentation with no relators, word equality agrees with Mathlib's reduction criterion.
- `⟨a,b,t|[a,t]=1⟩` is itself a one-step ICE group over `F(a,b)`.
- In `ℤ²∗⟨t⟩`, `(1,0)` and `(0,1)` are not conjugate, while `c=t⁻¹` witnesses `c⁻¹(1,0)c=t(1,0)t⁻¹`.
- The Klein-bottle presentation `⟨x,y|x²y²=1⟩` is outside the fully residually free class: it fails commutation transitivity, so the free-discrimination radical criterion must not be applied to it.
- The map `F(x,y)→F(a,b)`, `x↦a²`,`y↦b²` is injective; `x↦a`,`y↦a` is not, since it kills `x y⁻¹`.
- For the trivial group all represented words equal 1 and the unique subgroup is trivial.

Sources: [JSJ] §3, Theorems 3.1, 3.2, 3.4–3.7, 3.20–3.22, pp. 121–125; [SUBGROUPS] §2.3, Theorems 1–3, p. 6; §§3–6, Theorems 4–11, pp. 14–38; [FOLD] §5, Theorem 5.8, p. 22.

*Needs:* §7.8 (Existential and universal theories as recursive sets); §8.7 (Embedding theorems and finite presentability); §8.9 (normalized tower radicals, discrimination and level maps); §9.7 (Intersections and the Howson property).

### 10.4 Relative Grushko decompositions with presentations

For finitely generated fully residually free `G` and a finitely generated subgroup `H`, require a relative Grushko decomposition `G=G₁∗⋯∗G_p∗F_q` with `H` conjugate into a factor, with finite generating sets and finite presentations of the factors and a marked isomorphism to `G`. The factors are freely indecomposable relative to the peripheral subgroups they carry. Only unconstrained cyclic factors belong to `F_q`. Uniqueness is the conjugacy-and-permutation statement of §4.11.

For `ℤ²∗F(c,d)` with no nontrivial peripheral subgroup, `p=1`,`q=2` and `G₁=ℤ²`. A closed hyperbolic surface group is freely indecomposable. For `G=ℤ` and `H=2ℤ`, the cyclic relative factor is retained, giving `p=1`,`q=0`; for `H=1` it is the free factor `F₁`.

Sources: [JSJ] §10, Theorem 10.1, p. 186 (announced in the introduction, p. 93); [FOLD] §6, Theorem 6.2, p. 28.

*Needs:* §4.11 (Kurosh subgroup theorem, Grushko–Neumann theorem and Grushko decompositions); §10.3 (Presentations, embeddings and kernel criteria).

### 10.5 Relative JSJ graphs with marked presentations

For finitely generated fully residually free `G` freely indecomposable relative to a finite family `ℋ` of finitely generated subgroups, require a cyclic and an abelian relative JSJ graph of groups with finite vertex presentations, finitely generated edge groups and injective boundary maps, and a marked isomorphism `G≃π₁`. Describe rigid, abelian and QH vertices, with the surface and peripheral data in the QH case. The resulting Bass–Serre tree belongs to the JSJ deformation space of §10.2. Equivalence is mutual domination, rather than equality of a displayed graph. The finite mathematical decomposition satisfies the JSJ universal property.

For `F(a,b)∗_{a=[x,y]⁻¹}F(x,y)` relative to `{F(a,b)}`, the decomposition has a rigid coefficient vertex and a once-punctured-torus QH vertex. Without the peripheral family the group is free of rank three, and its JSJ trees have trivial vertex stabilizers.

Sources: [JSJ] Introduction, Theorem 1 and Theorem 13.1, p. 93; §13, pp. 199–207; §9, Theorem 9.1; [GL-JSJ] Introduction, pp. 3–5.

*Needs:* §10.2 (Existence of abelian and cyclic JSJ decompositions of limit groups); §10.3 (Presentations, embeddings and kernel criteria); §6.10 (Quadratically hanging (QH) vertices and their peripheral data); §4.8 (Structure theorem: actions on trees are graphs of groups).

### 10.6 Makanin–Razborov (`Hom`-) diagrams

Define `LimitGroup.MRDiagram` as follows. For a finitely generated group `G` and the free group `F`, a `Hom(G, F)`-diagram (Makanin–Razborov diagram) is a finite rooted tree with: the root labelled `G`; every other vertex `v` labelled by a finitely generated fully residually free group `G_v` (given by a finite presentation) with a modular group `Mod(G_v) ≤ Aut(G_v)` (generated by Dehn twists along edges of its abelian JSJ decomposition, automorphisms of its QH vertex groups fixing the peripheral structure, and automorphisms of abelian vertex groups fixing the peripheral subgroups); every edge labelled by a homomorphism (from the root: a homomorphism `G → G_v`; otherwise a proper epimorphism `G_v ↠ G_w`); and every leaf labelled by a free group (a free product of `F` with a free group in the coefficient version). A branch `B: G → G_{v₁} → ⋯ → G_{v_k} = F_B` together with `σ_i ∈ Mod(G_{v_i})` and a homomorphism `ψ : F_B → F` gives the composite homomorphism `ψ ∘ π_k ∘ σ_k ∘ ⋯ ∘ π₁ ∘ σ₁ ∘ π₀` (the branch restrictions, if any, are part of the data). The diagram is complete when every homomorphism `G → F` is such a composite; the `F`-version uses `F`-homomorphisms.

A finite tree datatype with group presentations, homomorphisms on generators and generating sets of modular groups. Include an empty solution diagram with no branches for an inconsistent coefficient system; its root is a failure marker rather than a free leaf. In that case the radical quotient is trivial and its coefficient map is not injective, so no coefficient-preserving root map to `F` is asserted.

The public interface should expose the following named results:

- `LimitGroup.MRDiagram`: The finite rooted tree with vertex groups, modular generators and edge maps.
- `LimitGroup.MRDiagram.branchHoms`: The set of composites along branches.
- `LimitGroup.MRDiagram.IsComplete`: Every homomorphism `G → F` is a branch composite.
- `LimitGroup.MRDiagram.IsSound`: Every branch composite is a homomorphism `G → F` (automatic for homomorphisms) and, for `G = F_{R(S)}`, a solution of `S`.
- `LimitGroup.MRDiagram.modular`: Generators of the modular group of each vertex.
- `LimitGroup.MRDiagram.IsComponentNormalized`: In the coefficient version for a finite system, the closures of the solution images through individual root children are irreducible and are exactly the distinct irreducible components, with no repeated component. This is additional data, not a consequence of `IsComplete`. The existence theorem of §10.7 requires completeness only; component data are supplied separately by §10.8.

**Checks.**

- `LimitGroup.MRDiagram.inconsistent`: For `x²=a` over `F(a,b)`, the solution diagram is empty: there are no branches and no solutions, and no `F`-embedding of its trivial radical quotient.
- `LimitGroup.MRDiagram.free_root`: For `G` free, the one-edge diagram `G → G` (leaf `G` free) is complete.
- For the empty one-variable system over nonabelian `F`, the two root edges `F∗⟨x⟩→F∗⟨x⟩` (identity) and `F∗⟨x⟩→F (x↦1)` form a sound complete diagram. Their images are `F` and `{1}`; it fails `IsComponentNormalized`, and maximal-closure extraction returns only `F`.
- `LimitGroup.MRDiagram.centralizer`: For `S = [x, a] = 1` over `F(a,b)`, the diagram root `⟨F, t | [a, t]⟩ →` (identity) the same group with modular generator `t ↦ t a → (t ↦ 1)` leaf `F` is `F`-complete; its composites are exactly `x ↦ a^k`.
- `LimitGroup.MRDiagram.need_modular`: For `S = [x₁,y₁][x₂,y₂] = 1` over `F`, the leaf maps without the modular group of the QH vertex `S⁺(2, 0)` miss solutions: completeness requires precomposing with `Mod(G_v)`.
- `LimitGroup.MRDiagram.proper_quotients`: Edges below the root are proper epimorphisms; a diagram with an isomorphism edge has a redundant vertex, so the canonical diagrams exclude it.

For the empty system over `F (G = F[X])`, the one-edge diagram with leaf `F[X]` and the identity is `F`-complete: every solution is a specialisation of the leaf. For `S = [x, a] = 1` over `F(a,b)`: the root is `G = F_{R(S)} = ⟨F, t | [a, t]⟩ (x = t)`, with one edge (the identity) to a vertex labelled `G` itself whose modular group is generated by the twist `t ↦ t a`, and one proper epimorphism `t ↦ 1` from it to the leaf `F`; the composites are `t ↦ a^k`, exactly the solutions.

This interface is used by Layer 10 finite factorization theorem; Layer 10 irreducible components: §10.8 extracts maximal irreducible image closures separately from the full cover; Layer 11 parametrisation: fundamental sequences are branches.

Use [JSJ] §11, Theorems 11.1–11.3, pp. 191–194 (stated in the introduction, pp. 93–94): Complete canonical `Hom(G, F)`- and `Hom_F(G, F)`-diagrams, for finitely presented `G`; for a finite system `S`, the solutions of `S` in `F` are exactly the `F`-homomorphisms of the diagram.; [SELA-I] §5, Definition 5.2, p. 62, Proposition 5.6, p. 67, and Theorem 5.7, p. 68: Modular groups of limit groups (Definition 5.2); every homomorphism to a free group factors, after a modular automorphism, through a maximal shortening quotient (Proposition 5.6); the canonical Makanin–Razborov diagram encodes all homomorphisms to a free group as compositions of modular automorphisms, quotient maps and homomorphisms of free groups (Theorem 5.7).; [IFT] §5.6, Theorems 5–7, pp. 59–61: The solution tree `T_sol(Ω, Λ)`, fundamental sequences, the finite family of NTQ systems covering `V(S)`, and the finite rooted tree describing `Hom(G, F)`.

*Needs:* §8.1 (Residually free and fully residually free groups); §10.2 (Existence of abelian and cyclic JSJ decompositions of limit groups); §4.13 (Dehn twists of one-edge splittings); §6.10 (Quadratically hanging (QH) vertices and their peripheral data).

### 10.7 Finite Makanin–Razborov diagrams and factorization

For every finite equation system `S` over a nonabelian finite-rank free group `F`, prove existence of a finite `F`-complete `Hom_F(F_{R(S)},F)`-diagram `C`. Every allowed branch composite, including its modular automorphisms and final free-leaf specialization, is an `F`-homomorphism and hence a solution of `S`; every solution factors as such a composite. Below the root, edges are proper epimorphisms between finitely generated fully residually free groups, and leaves are `F∗F(Y)`. An inconsistent system has the empty solution diagram and no coefficient-preserving map to `F`. The target is the finite factorization theorem. Its solution-tree construction uses the normalized terminal towers and word maps of §8.6b. First prove finite shortening-quotient factorization for all `F`-homomorphisms `T_j→F` using the tower's JSJ modular groups and the descending-chain theorem below. Composing with `θ_j` gives the required root branches. The finite cover proves completeness, including the branches where lower coefficient words vanish; tower discrimination alone does not. The `Hom`-diagram leaves are `F∗F(Y)`.

Include the descending-chain theorem for proper epimorphisms of limit groups (LIMITS Proposition 3.13), with its finite-generation hypotheses. Branch finiteness and finite branching both enter the finite-diagram conclusion. The modular groups come from twists and QH or abelian vertex automorphisms of §10.6; their presence is essential.

**Checks.**

- For `[x,y]=1`, branch specializations give all pairs `(u^m,u^n)`, `m`,`n∈ℤ`.
- For `[x,a]=1`, modular powers of `t↦t a` followed by `t↦1` give exactly `t↦a^k`.
- For `[u,v]=[u,x]=1`, the `u=1` branch admits `(1,a,b)`, while the commuting tower admits `(a,1,1)`. Retaining only the normalized conjugacy tower fails completeness.

Sources: [JSJ] §11, Theorem 11.3, p. 94 (proved in §11); [IFT] §5.6, Theorem 5, Theorem 7, pp. 59–61; [LIMITS] §3, Proposition 3.13, p. 23; [SELA-I] §5, Theorem 5.7, p. 68.

*Needs:* §8.6b (finite normalized tower covers with both solution directions); §8.9 (tower discrimination and embeddings); §10.6 (Makanin–Razborov (`Hom`-) diagrams); §10.5 (Relative JSJ graphs with marked presentations); §7.6 (Finiteness and length bounds for minimal solutions); §7.3 (Correctness of the reduction to generalised equations (both directions)).

### 10.8 Finite irreducible systems, radicals and NTQ covers

For a finite system `S` over a nonabelian finite-rank free group `F`, require finite systems `S₁`,`…`,`S_m` representing its unique irredundant irreducible-component decomposition, with finite presentations of `F_{R(S_i)}`. For irreducible `S` require finitely many normal generators of `R(S)`. Require also the finite normalized tower cover of §8.6b: saturated systems `U_i` presenting towers `T_i` and word maps `p_i:Hom_F(T_i,F)≅V_F(U_i)→V_F(S)`, with nonempty irreducible images covering `V_F(S)`. Put `C_i=`closure(`p_i(V(U_i))`). The components are exactly the distinct inclusion-maximal `C_i`; every component is some `C_i`, while other `C_i` may be proper subsets of components. Keep the full pointwise cover and the maximal-closure component indices as separate data: closure containment alone does not permit discarding branch images. For `V(S)=∅` use empty families.

The finite-cover principle `component_iff_maximal_cover` states: if finitely many nonempty irreducible closed sets `C_i` cover a closed set `Y`, its maximal irreducible closed subsets are precisely the inclusion-maximal `C_i`. A closed irreducible subset of a finite closed cover lies in one member, which proves the extraction statement independently of diagram normalization.

**Checks.**

- For the empty one-variable system, add the constant map `x↦1` to the identity cover of `F`. Both images are irreducible, the cover is complete, and only `F` is an inclusion-maximal closure.
- A duplicated identity word map gives two indices with the same closure; the component data contain that component once.
- For `V(S)=∅` there are no NTQ cover members or components; no nonempty irreducible image is introduced.
- For `⟨a⟩∪⟨b⟩` the two maximal closures are the two cyclic sets; adding their common point `{1}` changes neither the cover nor the components.
- For `[u,v]=[u,x]=1`, the `u=1` and pairwise-commuting branches are two distinct components: their points `(1,a,b)` and `(a,1,1)` show neither contains the other. The normalized conjugacy branch alone loses a component.

For a finite subsystem of the equations `[[x,a],g[x,b]g⁻¹]=1` defining `⟨a⟩∪⟨b⟩` over `F(a,b)`, the two component systems are `[x,a]=1` and `[x,b]=1`. Such a finite subsystem exists by equational Noetherianity.

Sources: [IFT] §5.6, Theorem 6, p. 60; [VAR-II] §0, Theorem 2, p. 4; [JSJ] §3, Corollary 3.8 and Theorem 3.9, p. 122.

*Needs:* §10.7 (finite `Hom`-diagrams); §8.6b (complete normalized tower covers); §8.9(2) (irreducible tower solution sets); §5.10 (Noetherian Zariski topology and irreducible components); §8.8 (normalized terminal carriers).

### 10.9 Equations over a limit group and subgroup constraints

For a finitely generated fully residually free group `H`, a finite variable tuple `X` and a finite system `S(X)=1` with coefficients in `H`, state the recursive decidability of solvability in `H` and a finite complete `Hom_H(H_{R(S)},H)`-factorization diagram. This is a separate mathematical target. A diagram of maps into an ambient NTQ group does not establish factorization of maps into `H`.

The target includes a constrained factorization theorem for an embedding `H↪N` into an NTQ group carrying a free regular `ℤⁿ`-length function: restrict every variable image to `H`, and prove finiteness and completeness of the resulting family. The accepted-subgroup description of `H` does not decide whether an infinite parametric family contains an `H`-valued tuple. The source contract for this constrained theorem is KM06 Theorem 32, cited by JSJ Theorem 3.23; JSJ §§13–14 give only a sketch and cite the proof elsewhere. This constrained theorem supplies no prerequisite to §§10.1–10.9 or Layer 11, which use the free-group theory and subgroup structure independently.

For `H=F(a,b)` this is the free-group case of Layer 7. In `H=ℤ²∗ℤ`, `[x,(1,0)]=1` has exactly the solutions `x∈ℤ²`.

Sources: [JSJ] §3, Theorem 3.23, p. 125; §12, Theorems 12.6–12.7, p. 94; §14, Theorem 14.1 and Corollary 14.2, p. 207; [KM06] Theorem 32 (the cited prerequisite); [SUBGROUPS] §2.3, Theorems 1–3, p. 6.

*Needs:* §10.3 (Presentations, embeddings and kernel criteria); §9.5 (Lyndon's group `F^{ℤ[t]}` as infinite words, and free length functions on limit groups); §9.7 (Intersections and the Howson property); §10.7 (Finite Makanin–Razborov diagrams and factorization).

### Examples

For `[x,a]=1` over `F(a,b)`, use a root vertex `H=⟨F,t | [a,t]=1⟩`, an identity root edge to `H`, its modular twist `t↦ta`, and a proper quotient `t↦1` to the leaf `F`. Applying all integer powers of the twist before the quotient yields exactly `x=aᵏ`. Omitting the modular automorphisms leaves only `x=1` and loses completeness.

### Dependencies

This layer consumes Layers 2, 4–9 and `ClassifyingSpaces` Stage 2 item 7 through §10.1a `→` §10.2 and downstream JSJ consumers. Presentation complexes are specified on main; the relative finite-cell and track-resolution work is owned here. Graph and surface inputs enter through Layers 2 and 6; the remaining external suppliers are pinned declarations.

## Layer 11: Regular implicit-function theorems over free groups

Lifts of compatible equations to generic points, the basic automorphisms, discriminating families and test-equation-dependent reconstruction for regular quadratic equations, and the implicit function theorems for regular quadratic equations and regular NTQ systems, with complete lifts (inequations allowed) and formal solutions at the generic point. The theorems are not extended to arbitrary NTQ systems.

### 11.1 Compatible equations, `S`-lifts and complete `S`-lifts

Define `GroupAlgGeom.Lift.IsCompatible` as follows. Let `G` be a group, `S(X) = 1` a system over `G` with a solution in `G`, and `μ : G[X] → G_{R(S)}` the canonical map. A formula `Φ(X, Y)` of `L_A` (in particular `T(X, Y) = 1`, or `T(X, Y) = 1 ∧ W(X, Y) ≠ 1`) is compatible with `S` over `G` when for every solution `a` of `S` in `G` there is `b` with `Φ(a, b)` true in `G` (`V_G(S)` is the projection of the truth set of `Φ ∧ S = 1`). A compatible `Φ` admits an `S`-lift (a lift to a generic point) when `∃Y Φ(X^μ, Y)` is true in `G_{R(S)}`, the elements `X^μ` treated as constants; a solution `Y(X) ∈ G_{R(S)}^{|Y|}` is a formal solution. A compatible equation `T(X, Y) = 1` admits a complete `S`-lift when it admits an ordinary `S`-lift and every formula `T = 1 ∧ W ≠ 1` compatible with `S` admits an `S`-lift. The ordinary lift is required even when there is no compatible inequation extension. A family `Θ` of solutions of `S` is generic when every equation `V(X, Y) = 1` such that `V(X^θ, Y) = 1` is solvable in `G` for all `θ ∈ Θ` admits a complete `S`-lift.

Predicates on systems and formulas, using Layer 5 coordinate groups and Layer 3 formulas.

The public interface should expose the following named results:

- `GroupAlgGeom.Lift.IsCompatible`: `Φ` is compatible with `S` over `G`.
- `GroupAlgGeom.Lift.HasLift`: `Φ` admits an `S`-lift: `∃Y Φ(X^μ, Y)` in `G_{R(S)}`.
- `GroupAlgGeom.Lift.HasCompleteLift`: `T` admits an ordinary `S`-lift, and every compatible `T = 1 ∧ W ≠ 1` admits an `S`-lift. The representative predicate also accepts finite equation systems.
- `GroupAlgGeom.Lift.IsGenericFamily`: A family of `S`-solutions on which solvability of each single equation implies a complete `S`-lift; the representative signature uses auxiliary variables indexed by `Fin n`.
- `GroupAlgGeom.Lift.hasLift_isCompatible`: For an equation, or more generally a positive formula, a generic-point solution specialises to compatibility (compose with the points `G_{R(S)} → G`). This implication does not hold for an arbitrary formula containing inequations.

**Checks.**

- `GroupAlgGeom.Lift.hasLift_square`: For `S` empty over `F(a,b)`, `T = (y² = x²)` admits the lift `y = x`.
- `GroupAlgGeom.Lift.not_compatible_sqrt`: `T = (y² = x)` is not compatible with the empty system over `F(a,b)`.
- `GroupAlgGeom.Lift.compatible_no_lift`: For `S = ([x, y] = 1)`, which is not regular, the formula `x = z² ∨ y = z² ∨ x y = z²` (a single equation over `F` by §7.9) is compatible with `S`, since for `x = u^m`, `y = u^n` one of `m`, `n`, `m + n` is even, but admits no `S`-lift: in `F_{R(S)} = F ∗ ⟨x, y | [x, y]⟩` none of `x`, `y`, `x y` is a square. Compatibility does not imply lifting outside the regular class.
- For `S:x=1` over `F`, the singleton family `x↦1` is generic: the coordinate group is `F`, so every equation solvable on the family and every compatible equation–inequation system has its witness at that unique generic point.
- Over the trivial group, `S` and `T` empty have an ordinary lift and a complete lift; no inequation is compatible. Requiring the ordinary lift explicitly prevents the inequation clause alone from defining completeness.
- The empty family for `S:x=1` is not generic: the equation `a=1` with `a≠1` is vacuously solvable on the family but has no lift.
- For `S:[x,y]=1`, the family of all `F`-solutions discriminates `F∗ℤ²` but is not generic: the square disjunction above, encoded as a single equation by §7.9, is solvable on the whole family and has no lift.
- `GroupAlgGeom.Lift.trivial`: Every equation `T` with a solution `Y(X) ∈ G[X]` admits an `S`-lift for every consistent `S`, by composing with `μ`. A generic solution of `y=x` with `y≠1` for `S` empty is not compatible at `x=1`, so the statement must be restricted to equations.

Over `F`, `T = (y² = x²)` is compatible with the empty system `S` and admits the lift `y = x`. Over `F`, `T = (y² = x)` is not compatible with the empty system (`x = a` has no square root).

This interface is used by Layer 11 implicit function theorems: the conclusions; Layer 7 Merzljakov's theorem: the case `S` empty of complete lifts with formal solutions in `F[X]`.

Use [IFT] §6, Definitions 25–27 and the definition of `S`-lift, pp. 63–67: Compatibility of a formula with `S = 1` over `G`, lifts to a generic point (`S`-lifts) as solvability in `G_{R(S)}`, and complete `S`-lifts.; [LIFT] Introduction, pp. 215–216 (printed), and §2, Propositions 2.5 and 2.8, pp. 224–226: The same notions, with their characterisations by coordinate groups.; [IFT] §7.6, p. 141: Generic families of solutions of regular quadratic equations and NTQ systems.

*Needs:* §5.2 (Algebraic sets, radicals and coordinate groups); §5.1 (`G`-groups and the free `G`-group `G[X]`); §5.12 (Points as homomorphisms; word maps and changes of coordinates).

### 11.2 Compatibility and lifts in terms of coordinate groups

Prove the following statement. Let `S(X) = 1` have a solution in `G`. (1) `T(X, Y) = 1` is compatible with `S` over `G` iff `G_{R(S)}` embeds canonically in `G_{R(S ∪ T)}` and every `G`-homomorphism `G_{R(S)} → G` extends to `G_{R(S ∪ T)}`. (2) `T` is compatible with `S` and admits an `S`-lift iff there is a `G`-retraction `G_{R(S ∪ T)} → G_{R(S)}` (identity on `G_{R(S)}`); a solution of `T(X^μ, Y) = 1` in `G_{R(S)}` gives the retraction and conversely. (3) Discrimination does not suffice: `G_{R(S)}` may be `G`-discriminated by `G` while a compatible equation admits no `S`-lift (`S = [x, y]` over `F: F_{R(S)} = F ∗ ℤ²` is `F`-discriminated, and the equation equivalent to `x = z² ∨ y = z² ∨ x y = z²` is compatible without `S`-lift, §11.1); a generic family in the sense of IFT Definition 44 would suffice, but the lifting input here is the test-equation-dependent reconstruction of §11.4c, iterated in §11.6. Fixed-depth discrimination does not supply that input even for regular `S` (§11.4).

(1) LIFT Proposition 2.5 (IFT Proposition 2); (2) LIFT Proposition 2.8 (IFT Proposition 3, with Lemma 40 for the retraction); (3) the example of §11.1.

For `S` empty, (2) says `T` admits a lift iff `F[X]` is a retract of `F_{R(T)}` over `F[X]`.

Use [LIFT] §2, Proposition 2.5, p. 224, and Proposition 2.8, p. 226: Compatibility as embedding plus extension of homomorphisms; lifts as retractions of coordinate groups.; [IFT] §6, Lemmas 36–40 and Propositions 2–3, pp. 64–67: Separating families and `G_{R(S)}`-homomorphisms (Lemmas 36–40); compatibility as an embedding of coordinate groups with extension of homomorphisms (Proposition 2) and lifts as retractions (Proposition 3).

*Needs:* §11.1 (Compatible equations, `S`-lifts and complete `S`-lifts); §5.3 (`G`-separation and `G`-discrimination (residual and full residual properties)); §5.11 (Irreducibility is discrimination of the coordinate group).

### 11.3 The basic sequence of automorphisms of a regular quadratic equation

Define `GroupAlgGeom.Lift.basicSeq` as follows. For a regular standard orientable quadratic equation `S(X) = 1` over `G` (genus `n`, coefficients `c₁`, `…`, `c_m`, `d`), the basic sequence `Γ = (γ₁, …, γ_K)`, `K = K(m, n)` (`K = m + 4n − 1` when `m`, `n ≠ 0`, `4n − 1` when `m = 0`, and `m − 1` when `n = 0`, where regularity forces `m ≥ 3`), consists of `G`-automorphisms of `G[X]` fixing the left side of `S`, each a Dehn twist of the surface splitting of §6.9 along a simple closed curve of a fixed chain of curves. For a tuple `p = (p₁, …, p_K)` of natural numbers define `φ_{K,p} := γ_K^{p_K} ⋯ γ₁^{p₁}`; the families below use positive exponents. Zero-square coefficient-conjugacy equations are the orientable `n=0` branch, with `K=m−1`, and use no square substitutions. For non-orientable regular equations, whose square genus is positive, first use the mixed form with commutators and one or two squares; IFT §7.5, p. 136, adds substitutions involving the square variables. In its two-square form the length is `m+2` if the commutator genus is zero, and `m+4n+2` otherwise, so the orientable formula for `K` is not reused.

Throughout this subsection assume: `S` regular, in standard form.

Define each `γ_i` on the generators `X` by the explicit formulas of IFT §7.1 (Nielsen-type substitutions conjugating a block of variables by a product of atoms); check separately that `γ_i` fixes `S` and that its induced surface automorphism is a twist (§4.13) of the surface vertex.

The public interface should expose the following named results:

- `GroupAlgGeom.Lift.basicSeq`: The list `(γ₁, …, γ_K)` of `G`-automorphisms of `G[X]`.
- `GroupAlgGeom.Lift.basicSeq_fix`: `γ_i(S) = S`.
- `GroupAlgGeom.Lift.phi`: `φ_{K,p} = γ_K^{p_K} ∘ ⋯ ∘ γ₁^{p₁}`.
- `GroupAlgGeom.Lift.basicSeq_dehn`: Each `γ_i` is the Dehn twist of §4.13 along a curve of the surface splitting.

**Checks.**

- The regular equation `z₁⁻¹ a z₁ · z₂⁻¹ b z₂ · z₃⁻¹ a z₃ · (aba)⁻¹ = 1` uses `S⁺(0,4)` and the two conjugacy-only orientable basic automorphisms. Killing coefficients and abelianizing gives zero in `ℤ³`; a coefficient-fixing automorphism preserves this, whereas one or two distinct square variables give a nonzero vector. Thus no mixed square form is assigned to this equation.
- `GroupAlgGeom.Lift.basicSeq_length`: For `m = 0`, `n = 2` the basic sequence has `K = 4 · 2 − 1 = 7` automorphisms.
- `GroupAlgGeom.Lift.basicSeq_fixes_S`: Each `γ_i` fixes `[x₁,y₁][x₂,y₂]` in `F[X]`.
- `GroupAlgGeom.Lift.phi_zero`: `φ_{K,(0,…,0)} = id`.
- `GroupAlgGeom.Lift.not_for_irregular`: For `x₁² x₂² x₃² = 1` (not regular) no such family produces non-commutative solutions: all solutions commute, so the construction is restricted to regular equations.

For `S = [x₁,y₁][x₂,y₂]` over `F` (no coefficient `d`, so the surface is closed of genus two) the basic sequence has `K = 7` automorphisms, twists along a chain of curves; they fix the word `S₀ = [x₁,y₁][x₂,y₂]` (IFT p. 68). Each `γ_i` fixes the word `S(X)` in `G[X]`.

This interface is used by Layer 11 discriminating families and test-equation-dependent lifting: the solutions are `β ∘ φ_{JK,p}`, with depth and cancellation conditions chosen for the test equation in §11.4c; Layer 10 modular groups: the basic automorphisms generate a subgroup of the modular group of the QH vertex.

Use [IFT] §7.1, the basic automorphisms and Lemma 41, pp. 67–75: The basic sequence `Γ = (γ₁, …, γ_{m+4n−1})` of automorphisms of `G[X]` fixing a regular orientable standard quadratic word, and the automorphisms `φ_{K,p}`.; [LIFT] §4, the basic sequence and Definition 4.2, pp. 230–232; [IFT] §7.5, p. 136 (non-orientable sequence): The basic sequence of automorphisms of a regular orientable standard quadratic equation, `K(m, n)` and the automorphisms `φ_{K,p}`.

*Needs:* §6.7 (Regular standard quadratic equations); §6.9 (Coordinate groups of regular quadratic equations as surface amalgams); §4.13 (Dehn twists of one-edge splittings); §5.12 (Points as homomorphisms; word maps and changes of coordinates).

### 11.4 Discriminating twist families of regular quadratic equations

Prove the following statement. Let `G` be a nonabelian finitely generated fully residually free group, `S = 1` a regular standard orientable quadratic equation over `G` other than `[x₁,y₁][x₂,y₂] = 1`, `Γ` its basic sequence and `β : G_S → G` a solution in general position (one exists by §6.8; the excluded equation has none, and IFT p. 99 treats it as `[x₁,y₁] = [y₂,x₂]` over `G ∗ F(x₂, y₂)`). For any `J ≥ 2` and any set `P ⊆ ℕ^{JK}` unbounded in every coordinate simultaneously (for each `M` there is `p∈P` with all `p_i>M`), the family `Ξ_{P,β} = {φ_{JK,p} β | p ∈ P} G`-discriminates `G_{R(S)}` into `G`, and so does `Ξ_{P,β,p′} = {φ_{tK,p′} θ | θ ∈ Ξ_{P,β}}` for any `t` and any fixed `p′ ∈ ℕ^{tK}` (IFT Theorem 10). This assertion is discrimination only. Solvability of a test equation on one prescribed fixed-depth family does not imply an ordinary or complete lift, even over `G = F`. The lifting construction in §11.4c chooses depth and cancellation data after fixing the compatible test equation and inequation. Non-orientable regular equations are treated by the same method in IFT §7.5.

Treat the coefficient-free genus-two equation separately. Put `H=F∗F(x₂,y₂)` and regard its coordinate group `K` as that of `[x₁,y₁]=[y₂,x₂]` over `H`. The `H`-solution `x₁=y₂`,`y₁=x₂` has nontrivial commutator and supplies the centralizer-extension embedding `K↪E` over `H`. Construct the staged family `K→E→H→F`: first centralizer retractions and the basic automorphisms over `H`, then coefficient-fixing discriminating specializations of the free generators `x₂`,`y₂` into `F`. Prove that finite nontrivial subsets of `K` survive suitable successive choices, and that the resulting `F`-valued tuples solve the original genus-two equation. For lifting, §11.4c chooses the staged test families after the compatible equation and inequation are fixed, with Merzljakov formal solutions (§7.10) for the free coefficient parameters. Compatibility over `F` does not by itself assert compatibility over `H`; the return to `F`-valued specializations is part of that reconstruction target.

**Checks.**

- The `F`-valued tuple `(a,b,b,a)` solves the original equation and has a nontrivial first commutator, although the two atoms commute.
- No original genus-two solution is in atom general position; the `H`-coefficient equation has nontrivial constant `[y₂,x₂]` and uses its one-commutator case.
- For a finite set of nontrivial `K`-words, first choose an `E→H` specialization preserving them, then an `H→F` specialization preserving their images. Choosing these independently without the finite-set conditions is insufficient.
- For `S:[x,y]=[a,b]` over `F(a,b)`, `K=3`, `J=2` and `P=ℕ⁶`, the six moves are `y`,`x`,`y`,`y`,`x`,`y` in evaluation order; reversing the exponent indices leaves this family unchanged. Define `A₀=a`, `B₀=b`. At `i∈{1,3,4,6}`, impose `[t_i,A_{i−1}]=1` and put `(A_i,B_i)=(A_{i−1},t_i B_{i−1})`; at `i∈{2,5}`, impose `[t_i,B_{i−1}]=1` and put `(A_i,B_i)=(t_i A_{i−1},B_{i−1})`. Add `x=A₆`,`y=B₆`. The `A_i`,`B_i` are word abbreviations, so this is a finite system `T` in six auxiliary variables. It is solvable on every twist tuple by taking `t_i` to be the corresponding power of the unchanged entry.
- The bounded-twist system has no `S`-lift: in `D=F(a,b)∗_{[a,b]=[x,y]}F(x,y)`, every primitive coefficient element `w` has `C_D(w)=⟨w⟩`. Its nonzero abelianization excludes membership in any coefficient conjugate of the edge group, so its fixed subtree is just the coefficient vertex; a centralizer preserves that vertex. Inductively every `t_i` lies in the coefficient factor and each `(A_i,B_i)` remains a basis of it. Thus `A₆`,`B₆` cannot equal the generic `x`,`y`, which lie outside that factor by normal form.
- Conjunction encoding (§7.9) is valid in both `F` and its fully residually free `D` and gives a single-equation obstruction to genericity. Increasing exponents or restricting to a cofinal subset preserves the obstruction; the same argument applies to any fixed finite depth. The representative signatures are `oneCommutatorEquation`, `boundedTwistStages`, `boundedTwistSystem`, `boundedTwist_family_solvable` and `boundedTwist_no_lift`.

Throughout this subsection assume: `G` nonabelian finitely generated fully residually free; `S` regular; `β` in general position (exists by §6.8).

Big powers and the Nielsen property of `φ_{K,p}` with respect to the words of `Γ` (IFT Lemmas 42–65, §7.2–7.3): long products of large powers do not cancel.
`G_{R(S)}` embeds in an extension of centralizers of `G` (LIFT Propositions 5.1–5.2), discriminated by §8.6.

For `S = ([x, y] = [a, b])` over `F(a,b)` (regular by its explicit clause; with one atom every solution counts as in general position), `β = (a, b)` and `P` unbounded, the solutions `φ_{2K,p} β` discriminate `F_{R(S)}` into `F`.

Use [IFT] §7.1, p. 68 (the one-commutator basic moves), §7.2, Theorem 10, p. 104, the exception on p. 99, and §7.6, Definition 44, p. 141: For a finitely generated fully residually free `G`, a regular orientable standard quadratic `S` and a general-position solution `β`, the families `Ξ_{P,β}` discriminate `G_{R(S)}` into `G`; `[x₁,y₁][x₂,y₂] = 1` has no general-position solution and is treated over a larger coefficient group; generic families are defined in Definition 44.; [LIFT] §5, Propositions 5.1–5.2, pp. 266–270: General-position solutions of regular quadratic equations give embeddings into extensions of centralizers.

*Needs:* §8.5a (big powers); §§1.3, 1.6 (primitive elements and free centralizers), §§4.5–4.8 (amalgam normal forms and Bass–Serre trees), §6.9 (the regular quadratic amalgam) and §7.9 (conjunction encoding) for the bounded-twist Check; §11.3 (The basic sequence of automorphisms of a regular quadratic equation); §8.6 (Extensions of centralizers are discriminated by the base group); §6.8 (Radicals of consistent standard quadratic equations); §8.1 (Residually free and fully residually free groups).

### 11.4a Finite parameter solution trees

For a finite system `S(X,Y)=1` over a nonabelian finite-rank free group `F`, construct the finite parameter solution tree `T_sol(Ω,X)` for each initial parametric generalised equation from the cancellation family. Its vertices retain `X`-sections, defining presentation-group reconstruction, full radical transport and canonical automorphisms; its terminal equations have only the parameter sections and free items needed for reconstruction. Any tower attachments use the normalized carriers of §§8.8–8.9 and the finite solution-transport interface of §8.6b; coefficient-degeneration branches retain the original parameter values. Prove both directions of solution transport and completeness of the finite terminal covering, with the free assignments of kernel elimination retained at the presentation-group level and the radical transported through the entire reconstructed system. Own the decomposition tree, periodic-structure quotients and induction on complexity of IFT §5.6; finite minimal-solution bounds alone do not assert this complete covering.

**Checks.**

- For `y=x`, a terminal reconstruction is `y↦x` and the parameter section is retained.
- A free item eliminated by D4 remains assignable in the presentation-group reconstruction; the full system controls the radical. The reducible kernel of §7.4 gives a proper radical quotient of `K∗F(z)`, although `z` has arbitrary `F`-values.
- For `[y,x]=1`, the specialization `x=1` permits arbitrary `y`; completeness includes this degenerate parameter value.
- With parameters `u`,`v` satisfying `[u,v]=1` and equation `u^x u⁻¹=1`, the parameter branch `u=1` retains arbitrary `x` even when `[v,x]≠1`; the normalized fixed-lower-carrier branch alone cannot supply this transport.

Sources: [IFT] §5.6, Theorems 5–7 and their constructions, pp. 59–61; §5.3–§5.5, pp. 35–58, for the decomposition tree and periodic structures.

*Needs:* §§7.1–7.6 (parametric equations, cancellation, elementary moves, kernel reconstruction and periodic structures); §8.6b (finite word-map covers) and §§8.8–8.9 (normalized terminal carriers). This parameter-preserving tree is independent of the ordinary `Hom`-diagram interface of §10.7.

### 11.`4b` Cut equations and finite covering

Define a cut equation by a finite interval set `E`, finite parameter and piece alphabets `X`,`M`, and word-label maps `f_X:E→F[X]`, `f_M:E→F[M]`. A graphical solution consists of coefficient-fixing maps `β:F[X]→F` and `α:F[M]→F` with every piece image nonempty, each substituted `f_M`-label reduced as written, and that word equal to the reduced `β`(`f_X`-label). A group solution only requires equality of the evaluated group elements. Construct the cut equation of a generalised equation with its piece and parameter maps and prove both graphical solution directions.

For finite `S(X,Y)=1`, construct a finite family of cut equations with parameter alphabet `X` and `f_X(E)⊆X^{±1}`, and fixed reconstruction words `Q_i(M_i)` for `X`. Every `F`-solution `(U,V)` has a graphical cut solution `α` in some member `i` and reconstruction words `P_{i,V}(M_i)` with `U=Q_i(α)`, `V=P_{i,V}(α)`, and `Q_i(α)` reduced as written. Conversely each member `i` has fixed words `P_i(M_i)` such that every group cut solution `(β,α)` yields an `S`-solution `(Q_i(α),P_i(α))`. The forward `Y`-reconstruction may depend on `V`; it is not asserted to be the same fixed tuple as the backward reconstruction. The covering is supplied by §11.4a's finite parameter solution tree, using presentation-group reconstruction followed by radical transport through the full reconstructed system; all graphical conditions remain part of the correspondence.

**Checks.**

- A one-interval cut labelled `x` and `m` has `α(m)=β(x)` as graphical solution precisely when that word is nonempty.
- The piece assignment `(a,a⁻¹b)` gives the group equality `m₁m₂=b` but fails the graphical reduced-as-written condition.
- An empty parameter value is covered through terminal free/empty-section data, not by assigning the empty word to a required nonempty piece.
- Reconstruction from a group cut solution still solves `S` even when its substituted piece words cancel.

Sources: [IFT] §5.7, Definitions 21–22, p. 61, Lemma 34 and Theorem 8, pp. 61–63; [LIFT] §3, Theorem 3.4, p. 229.

*Needs:* §11.4a (finite parameter solution trees); §§7.1–7.3 (generalised equations and cancellation); §5.1 (evaluation); Mathlib `FreeGroup.IsReduced`.

### 11.`4c` Test-equation-dependent cut-equation reconstruction

For a regular standard quadratic equation `S` over a nonabelian free group `F`, first fix a compatible equation `T(X,Y)=1`. Prove an ordinary `S`-lift by the following reconstruction target. For each `W` with `T=1 ∧ W≠1` compatible with `S`, prove the corresponding equation–inequation lift by the same target applied anew to that fixed pair `T`,`W`. Both conclusions concern the generic point in `F_{R(S)}`. The test data precede the choices of block depth, base solution and exponent separation; there is no assertion that solvability on an arbitrary fixed-depth discriminating family suffices.

For each fixed set of test data, reduce to a nonabelian finite-rank free factor `F₀` containing its coefficients. At each `F₀`-valued `S`-point, the `F`-witnesses lie in a finite free-product extension of `F₀`. Coefficient-fixing discrimination of that extension into `F₀` (§8.6) returns equation witnesses and preserves `W` when present. Thus compatibility descends to `F₀`. The same finite-survival argument descends consistency and any noncommutative solution needed for regularity. Regularity and §6.8 identify both radicals with the defining normal closures; the original coordinate group is `F∗_{F₀}(F₀)_{R(S)}`. Amalgam normal forms embed the smaller coordinate group, so an ordinary or inequation lift over `F₀` gives the required lift over `F`.

For orientable `S` with a general-position solution, take the finite parameter tree and cut-equation covering of §§11.4a–11.4b for `S∧T`, retaining `W≠1` as a condition on the chosen witnesses when present. Prove a uniform finite bound `κ_max` on the complexities `κ(Π)` of its possible initial `Γ`-cut equations from the finite covering data, before choosing the block depth. Choose `r₀≥2` and `L=`JK with `L≥Kr₀+4Kκ_max`, together with the remaining cancellation bounds of IFT §7.4. Choose a base solution satisfying §7.3's small-cancellation condition `1/λ` with `λ>10`, and exponent tuples whose initial size and successive gaps dominate these finite bounds, as in IFT §7.4's `P_{a,h}`. The depth, base solution, initial size and gap function may all depend on `T`,`W` and their finite cut data. Compatibility with every `S`-solution supplies witnesses on these subsequently chosen `F`-valued families.

Own the stabilization and reconstruction argument: along an infinite subfamily a single cut equation covers the witnesses; its transformations either reach zero complexity or stabilize for three `K`-blocks (IFT Claim 9). The stabilized pieces split into free, very short and reconstructed pieces. Prove that the very short pieces satisfy a consistent finite residual system and that the reconstructed pieces are words in `X` and these residual/free pieces, independent of the surviving variable exponent blocks (IFT Proposition 8). Substituting residual values and reversing the cut transformations produces words `Y(X)` that solve `T` on a discriminating subfamily; discrimination then gives `T(X,Y(X))=1` in `F_{R(S)}`. In the inequation case retain witnesses for `T∧W≠1` throughout reconstruction and a specialization at which the reconstructed `W` is nonidentity, proving `W(X,Y(X))≠1` in the coordinate group. Nonvanishing is part of the reconstruction conclusion, not a consequence of discrimination alone.

For the closed genus-two exception, use §11.4's coefficient enlargement and return to `F`-valued specializations, with all finite survival and cancellation requirements imposed after `T`,`W` are fixed. Own the parameter reconstruction and Merzljakov-word argument for those free coefficient parameters; no compatibility over the enlarged coefficient group is assumed. For non-orientable regular `S`, use the square-variable substitutions and cancellation analysis of IFT §7.5 with the same order of quantifiers. This target is proved from parameter trees, cut equations, small cancellation and discrimination; it supplies §11.5 independently of that implicit function theorem.

**Checks.**

- For the closed genus-two `S`, `T:[z,x₁]=1` and `W:z≠1` are compatible even when `x₁=1`. The lift `z=x₁` is nonidentity at the generic point although that specialization kills it; a complete lift does not require one witness to preserve `W` at every point.
- The bounded-twist system of §11.4 is solvable on every prescribed six-move twist tuple but has no ordinary `S`-lift. It fails compatibility with all `S`-solutions, so it does not satisfy this target's hypothesis.
- A cut equation with complexity `κ(Π)` requires the bound involving `κ(Π)` in Claim 9; fixing `J=2` before the test equation cannot provide arbitrarily many stabilization blocks.
- For the closed genus-two equation and `T:z=x₁y₁`, reconstruction gives `z=x₁y₁` in its original `F`-coordinate group; no lift theorem over `F∗F(x₂,y₂)` is used.

Sources: [IFT] §7.3, pp. 105–109 (small-cancellation solutions); §7.4, pp. 109–111 (test solutions and finite covering), Claim 9, p. 120, Proposition 8, pp. 121–134, and pp. 134–136 (reconstruction and inequations); §7.5, pp. 136–137 (non-orientable case).

*Needs:* §11.4 (discrimination and the genus-two staged family); §§11.4a–11.4b (parameter trees and cut equations); §7.10 (Merzljakov formal solutions); §8.5a (big powers); §8.6 (free-product discrimination), §6.8 (regular radicals) and §4.5 (amalgam normal forms) for the finite-rank reduction; §11.3 (basic automorphisms); §5.12 (specialization at coordinate-group points).

### 11.5 Implicit function theorem for regular quadratic equations

Prove the following statement. Let `S(X, A) = 1` be a regular standard quadratic equation over a nonabelian free group `F = F(A)`, with finite variable tuples `X`,`Y`. Every equation `T(X, Y, A) = 1` compatible with `S` over `F` admits an ordinary `S`-lift and a complete `S`-lift: for every `W(X, Y)` such that `T = 1 ∧ W ≠ 1` is compatible with `S`, there is `Y(X) ∈ F_{R(S)}^{|Y|}` (words in `X ∪ A` modulo `R(S) = ncl(S)`) with `T(X, Y(X)) = 1` and `W(X, Y(X)) ≠ 1` in `F_{R(S)}`. The theorem is stated over `F`; for finitely generated fully residually free coefficient groups the sources provide the discriminating families (IFT Theorem 10, Corollary 12) used at the levels of NTQ systems, not a separate implicit function theorem.

Throughout this subsection assume: `S` regular standard quadratic over `F`; `T` compatible with `S` (and `W` such that `T ∧ W ≠ 1` is compatible).

Apply §11.4c first to `T` alone to obtain the ordinary lift, and then separately to each fixed compatible pair `T`,`W`. Its block depth, small-cancellation solution and separated exponents depend on that test data. The cut-equation reconstruction supplies words `Y(X)` and retains a nontrivial specialization of `W` for the inequation lift. The genus-two case uses the staged `F`-valued family and parameter reconstruction of §11.4c. No genericity property of a prescribed fixed-depth family is assumed.

For `S = [x₁,y₁][x₂,y₂]` and `T = (z = x₁ y₁)`, the lift is `z = x₁ y₁` (trivially). For `S = [x₁,y₁][x₂,y₂]` and `T = ([z, x₁] = 1 ∧ z ≠ 1)`, a lift is `z = x₁`.

Use [IFT] §7.4, Theorem 9, p. 67 (statement) and pp. 109–136 (proof, including Case 1 and Case 2 on pp. 135–136): Every equation compatible with a regular standard quadratic equation over `F` admits a complete `S`-lift.; [LIFT] Introduction, Theorem A, p. 216: The same theorem with effective complete `S`-lifts.; [IFT] §7.2, Theorem 10 and Corollary 12, pp. 104–105: Discriminating families of solutions over finitely generated fully residually free coefficient groups (not an implicit function theorem over them).

*Needs:* §11.4c (test-equation-dependent reconstruction); §§11.4a–11.4b (parameter solution trees and finite cut-equation covering); §7.10 (Merzljakov formal solutions for the genus-two bridge); §11.4 (discriminating twist families); §11.2 (Compatibility and lifts in terms of coordinate groups); §7.4 (Elementary relations between generalised equations); §7.3 (Correctness of the reduction to generalised equations (both directions)).

### 11.6 Implicit function theorem for regular NTQ systems

Prove the following statement. Let `U(X, A) = 1` be a regular NTQ system over a nonabelian free group `F = F(A)` (every level a regular standard quadratic equation or empty). Every equation `V(X, Y, A) = 1` compatible with `U` admits an ordinary `U`-lift and a complete `U`-lift. When `U` is entirely empty this is Merzljakov's theorem in the form with inequations (formal solutions in `F[X]`). The claim is not extended to NTQ systems with non-regular quadratic levels, abelian levels or centralizer-extension levels.

Throughout this subsection assume: `U` regular NTQ; `V` compatible with `U`.

Induct on the number of levels using the following tower-family/residual-system contract. For arbitrary-rank `F` first use §11.4c's finite-data reduction, including the finitely many level-solution and regularity witnesses in the finite-rank coefficient data. Write `G_i=F_{R(U_i,…,U_n)}` and `G_{n+1}=F`. First fix `V`, and fix `W` as well for an inequation lift. At a regular quadratic top level over `G₂`, compose §11.4's basic-automorphism solutions with `F`-valued specializations of the lower tower. Choose block depths, small-cancellation solutions and exponent separation after these test data and their finite cut-equation complexities are fixed, following §11.4c. Prove that the composed discriminating families retain the required nontrivial coefficient/atom values and cancellation bounds at every level. Compatibility with all `U`-solutions supplies test witnesses on whichever `F`-valued families these choices require. For the closed genus-two exception include the coefficient enlargement and return to `F`-valued specializations. The single-level free-base case uses §11.5; discrimination over `G₂` alone is not an implicit function theorem over `G₂`.

Apply the finite cut-equation covering to these composed `F`-valued families. Obtain a surviving branch, reconstruction expressions for `Y` in top-level words and residual variables, and a finite residual system `Δ` over `F` with lower parameters `X₂`,`…`,`X_n`. Prove compatibility of `Δ` with the entire lower NTQ system, including lower solutions outside the chosen test subfamily. Induction supplies residual values in `G₂` and reconstruction gives `Y` in `G₁`. Perform the construction for `V` alone to give the ordinary lift. For each fixed compatible inequation `W≠1`, choose and retain a subfamily and branch on which the reconstructed `W` survives; carry the resulting residual nonvanishing condition through the induction and prove `W≠1` after reconstruction in `G₁`. This is the complete-lift assertion; a family that only solves the equations is insufficient. At an empty top level use Merzljakov words with the same residual compatibility and inequation contract.

**Checks.**

- For an entirely empty tower and `V: [y,x₁]=1`, `W:y≠1`, compatibility holds even at `x₁=1` by choosing a nonidentity `y`. A formal value `y=x₁` is nontrivial in `F[X]`, even though the specialization `x₁=1` kills it.
- For two disjoint genus-two levels and `V:[y,x₁]=1`, `W:y≠1`, compatibility holds also when `x₁=1`. Composed `F`-valued families preserve `x₁≠1` and reconstruct `y=x₁` in `G₁`. The lower coordinate group contains a closed genus-two surface subgroup, so the free-base theorem cannot be applied to it as if it were free.
- With an empty lower level in `z` and top equation `[x₁,y₁][x₂,y₂]=z`, no `G₂`-valued top solution exists by abelianization; this violates NTQ nondegeneracy before any tower-family argument.

For two disjoint genus-two levels, `[x₁,y₁][x₂,y₂]=1` and `[u₁,v₁][u₂,v₂]=1`, each level has a trivial solution and is regular over its nonabelian lower group, so the theorem applies. By contrast, an empty lower level in `z` with top equation `[x₁,y₁][x₂,y₂]=z` is degenerate: `z` has nonzero abelianization in the lower free product and is not a product of commutators there.

Use [IFT] §7.6, Theorem 11 and its proof, pp. 137–141: Every equation compatible with a regular NTQ system admits a complete `U`-lift, by induction on levels with Merzljakov words for empty levels.; [LIFT] Introduction, Theorem `B`, p. 217, and §8: The same theorem with effective lifts.

*Needs:* §11.5 (Implicit function theorem for regular quadratic equations); §8.8 (raw TQ systems and normalized NTQ towers); §8.9 (normalized tower radicals, discrimination and level maps); §7.10 (Merzljakov's theorem: formal solutions of positive sentences); §11.4 (discriminating twist families); §11.4c (test-equation-dependent reconstruction).

### 11.7 Lifts under substitution and changes of coordinates

Prove the following statement. (1) If `σ` is a `G`-automorphism of `G[X]` (a change of coordinates) and `T(X, Y) = 1` admits a (complete) `S`-lift, then `T(σX, Y) = 1` admits a (complete) `S^σ`-lift, where `S^σ` is the transformed system, and the formal solutions correspond under the induced isomorphism of coordinate groups. (2) If `T(X, Y) = 1` admits an `S`-lift `Y(X)` and `T′(X, Y, Z) = 1` admits an `(S ∪ T)`-lift `Z(X, Y)`, then `T ∧ T′` admits an `S`-lift `(X, Y(X), Z(X, Y(X)))` when `G_{R(S∪T)}` retracts onto `G_{R(S)}`. (3) In particular regularity and the conclusions of §11.5 are invariant under the reduction to standard form of §6.6, so the theorem applies to every quadratic equation whose standard form is regular.

(1) §5.12; (2) compose the retractions of §11.2 (Compatibility and lifts in terms of coordinate groups); (3) apply (1) to the automorphism of §6.6.

The non-standard equation `x y x⁻¹ y⁻¹ z w z⁻¹ w⁻¹ = 1` has a regular standard form and inherits the implicit function theorem.

Use [IFT] §2.7, Lemma 1, p. 8, and §6, Lemmas 36–40, pp. 63–67: Standard forms by `G`-automorphisms; lifts and retractions of coordinate groups.; [LIFT] §2, Propositions 2.5 and 2.8, pp. 224–226: Coordinate-group characterisations used to transport lifts.

*Needs:* §11.2 (Compatibility and lifts in terms of coordinate groups); §5.12 (Points as homomorphisms; word maps and changes of coordinates); §6.6 (Quadratic words and standard forms); §11.5 (Implicit function theorem for regular quadratic equations).

### Examples

For the regular genus-two equation `[x₁,y₁][x₂,y₂]=1`, `z=x₁y₁` solves the compatible equation `z=x₁y₁` at the generic point. A lift of `[z,x₁]=1` together with `z≠1` is `z=x₁`; `x₁` is nontrivial in the coordinate group, even though some specializations kill it. The existence of a generic witness therefore does not imply that its specialization witnesses every compatible inequation.

### Dependencies

This layer consumes Layers 5–10, including Layer 10's `ClassifyingSpaces` Stage 2.7 input and the local graph/surface targets of Layers 2 and 6. Its remaining external suppliers are the pinned declarations specified above.

## Downstream consumers

A separate development of the first-order theory of free groups (Tarski's problems) may import this library: it would consume the recursive truth sets and formal-solution theorems of Layer 7, the Makanin–Razborov diagrams of Layer 10 and the implicit function theorems of Layer 11, and own its specialised constructions (induced NTQ systems, envelopes, the decision trees and the termination of quantifier elimination). Any roadmap needing free groups, Bass–Serre theory, surface groups or equations over groups imports the corresponding layer of this roadmap.

## References

- [LEAN] The Mathlib Community, *Mathlib (free groups, amalgams, HNN extensions, model theory, computability)*, Mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a. <https://github.com/leanprover-community/mathlib4/tree/6b7abb3c7686292736be2955bd3eb9ebf63b456a>
- [SURFACES] Jean Gallier and Dianna Xu, *A Guide to the Classification Theorem for Compact Surfaces*, Springer, 2013, author copy, Chapter 6 (printed pages cited). <https://www.cis.upenn.edu/~jean/surfclassif-root.pdf>
- [HATCHER] Allen Hatcher, *Algebraic Topology*, Cambridge University Press, 2002, §§1.2–1.3, §1.A and §§2.1–2.2 (cellular presentations, covering spaces, graph bases and incidence homology). <https://pi.math.cornell.edu/~hatcher/AT/AT.pdf>
- [DIESTEL] Reinhard Diestel, *Graph Theory*, 3rd edition, Springer, 2005, §1.9, pp. 23–27 (binary cycle space, fundamental cycles and incidence). <https://webhomes.maths.ed.ac.uk/~v1ranick/papers/diestel1.pdf>
- [TREES] Jean-Pierre Serre, *Trees*, Springer Monographs in Mathematics, corrected 2nd printing 2003 (translation of Arbres, amalgames, `SL₂`, Astérisque 46, 1977). <https://link.springer.com/book/10.1007/978-3-642-61856-7>. The corresponding targets also cite FOLD, KM02 or `GL`-JSJ.
- [FOLD] Ilya Kapovich, Richard Weidmann, Alexei Myasnikov, *Foldings, graphs of groups and the membership problem*, Internat. `J`. Algebra Comput. 15 (2005), 95–128; `arXiv`:math/0302206v2 (PDF pages cited). <https://arxiv.org/abs/math/0302206>
- [KM02] Ilya Kapovich, Alexei Myasnikov, *Stallings foldings and the subgroup structure of free groups*, `J`. Algebra 248 (2002), 608–668; `arXiv`:math/0202285v1 (PDF pages cited). <https://arxiv.org/abs/math/0202285>
- [ALG] Gilbert Baumslag, Alexei Myasnikov, Vladimir Remeslennikov, *Algebraic geometry over groups I. Algebraic sets and ideal theory*, `J`. Algebra 219 (1999), 16–79; authors' copy from A. Myasnikov's publication page (58 pp.; PDF pages cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/FINAL_AL_51_38.pdf>
- [VAR-I] Olga Kharlampovich, Alexei Myasnikov, *Irreducible affine varieties over a free group. I: Irreducibility of quadratic equations and Nullstellensatz*, `J`. Algebra 200 (1998), 472–516; authors' copy (46 pp.; PDF pages cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/pp1_34.pdf>
- [VAR-II] Olga Kharlampovich, Alexei Myasnikov, *Irreducible affine varieties over a free group. II: Systems in triangular quasi-quadratic form and description of residually free groups*, `J`. Algebra 200 (1998), 517–570; authors' copy (40 pp.; PDF pages cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/pp_ff_35.pdf>
- [MAK] `G`. `S`. Makanin, *Decidability of the universal and positive theories of a free group*, Izv. Akad. Nauk SSSR Ser. Mat. 48 (1984), 735–749; English translation Math. USSR-Izv. 25 (1985), 75–88 (the translation's printed pages are cited). <https://www.mathnet.ru/eng/im1489>
- [MAK82] `G`. `S`. Makanin, *Equations in a free group*, Izv. Akad. Nauk SSSR Ser. Mat. 46 (1982), 1199–1273; English translation Math. USSR-Izv. 21 (1983), 483–546 (the translation's printed pages are cited). <https://www.mathnet.ru/eng/im1703>
- [RECOMP] Volker Diekert, Artur Jeż, Wojciech Plandowski, *Finding all solutions of equations in free groups and monoids with involution*, Inform. and Comput. 251 (2016), 263–286; `arXiv:1405`.5133v2. <https://arxiv.org/abs/1405.5133>
- [LIMITS] Christophe Champetier, Vincent Guirardel, *Limit groups as limits of free groups*, Israel `J`. Math. 146 (2005), 1–75; `arXiv`:math/0401042v2. <https://arxiv.org/abs/math/0401042>
- [GL-JSJ] Vincent Guirardel, Gilbert Levitt, *JSJ decompositions of groups*, Astérisque 395 (2017); `arXiv:1602`.05139v2 (PDF pages cited). <https://arxiv.org/abs/1602.05139>
- [JSJ] Olga Kharlampovich, Alexei Myasnikov, *Effective JSJ decompositions*, Groups, Languages, Algorithms, Contemp. Math. 378 (2005), 87–212; `arXiv`:math/0407089v2 (the journal page numbers printed in its running heads are cited). <https://arxiv.org/abs/math/0407089>
- [SUBGROUPS] Olga Kharlampovich, Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Subgroups of fully residually free groups: algorithmic problems*, Group theory, statistics, and cryptography, Contemp. Math. 360 (2004), 63–101; authors' copy (39 pp., internal page numbers 1–39 cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_temp/KMRS_FRFG_AlgProb_65.pdf>
- [LENGTH] Olga Kharlampovich, Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Groups with free regular length functions in `Z^n`*, Trans. Amer. Math. Soc. 364 (2012), 2847–2882; `arXiv:0907`.2356v2. <https://arxiv.org/abs/0907.2356>
- [KMS-ACTIONS] Olga Kharlampovich, Alexei Myasnikov, Denis Serbin, *Actions, length functions, and non-archimedean words*, Internat. `J`. Algebra Comput. 23 (2013), 325–455; `arXiv:1211`.3207v2 (printed page numbers of the `arXiv` version cited). <https://arxiv.org/abs/1211.3207>
- [INFINITE-WORDS] Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Fully residually free groups and graphs labeled by infinite words*, Internat. `J`. Algebra Comput. 16 (2006), 689–737. <https://doi.org/10.1142/S0218196706003141>. Supplementary citation; the subgroup descriptions use SUBGROUPS.
- [MRS-REGULAR] Alexei Myasnikov, Vladimir Remeslennikov, Denis Serbin, *Regular free length functions on Lyndon's free `Z[t]`-group `F^{Z[t]}`*, Groups, Languages, Algorithms, Contemp. Math. 378 (2005), 37–77; authors' copy (40 pp.; internal page numbers cited). <https://web.stevens.edu/algebraic/alexeim/Publications/All_files_new/conm_borovik2_MRSc_85.pdf>
- [SELA-I] Zlil Sela, *Diophantine geometry over groups I: Makanin–Razborov diagrams*, Publ. Math. IHÉS 93 (2001), 31–105 (Numdam). <https://www.numdam.org/item/PMIHES_2001__93__31_0/>
- [IFT] Olga Kharlampovich, Alexei Myasnikov, *Implicit function theorem over free groups*, `J`. Algebra 290 (2005), 1–203; `arXiv`:math/0312509v2 (printed page numbers of the `arXiv` version cited). <https://arxiv.org/abs/math/0312509>
- [LIFT] Olga Kharlampovich, Alexei Myasnikov, *Algebraic geometry over free groups: lifting solutions into generic points*, Groups, Languages, Algorithms, Contemp. Math. 378 (2005), 213–318; `arXiv`:math/0407110v4 (the journal page numbers printed in its running heads are cited). <https://arxiv.org/abs/math/0407110>
- [KM06] Olga Kharlampovich, Alexei Myasnikov, *Elementary theory of free non-abelian groups*, `J`. Algebra 302 (2006), 451–552. <https://doi.org/10.1016/j.jalgebra.2006.03.033>. The constrained-factorization source contract is stated in §10.9.
