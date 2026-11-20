# Roadmap: local analysis of finite groups

Local analysis studies a finite group through its *local subgroups*, the normalizers and
centralizers of its nontrivial `p`-subgroups. It is the toolkit of the graduate texts by
Gorenstein, Aschbacher, Isaacs and Kurzweil–Stellmacher. It also supplies the vocabulary in which
every structural statement about finite simple groups is phrased. Mathlib has Sylow theory, the
existence half of Schur–Zassenhaus, transfer, the focal subgroup theorem, nilpotent and solvable
groups, the Frattini subgroup and subnormality. It has none of the subgroups `O_p(G)`, `F(G)`,
`E(G)` and `F*(G)`, and none of the theory of coprime action, the Thompson subgroup, normal
`p`-complements or signalizer functors that is built from them. This roadmap supplies that
library.

Its named milestones are:

- **Hall's theorem** and the **conjugacy half of Schur–Zassenhaus** (L1);
- the **Baer–Suzuki theorem**: `x ∈ O_p(G)` exactly when every `⟨x, xᵍ⟩` is a `p`-group (L1);
- **Bender's theorem** `C_G(F*(G)) ≤ F*(G)` (L2);
- **Glauberman's lemma** on invariant Sylow subgroups and the standard coprime-action
  identities, including **Thompson's `A × B` lemma** (L3);
- the structure of **extraspecial groups** and **Thompson's replacement theorem** (L4);
- **Frobenius's normal `p`-complement theorem**, **Glauberman's `ZJ` theorem** and the
  **Glauberman–Thompson normal `p`-complement theorem** (L5);
- **Thompson's theorem**: a finite group with a fixed-point-free automorphism of prime order is
  nilpotent, and hence every Frobenius kernel is nilpotent (L6);
- **Glauberman's solvable signalizer functor theorem** (L7).

The intended Tau Ceti home is `TauCeti/GroupTheory/` (for example `GroupTheory/PCore.lean`,
`GroupTheory/Fitting/`, `GroupTheory/CoprimeAction/`, `GroupTheory/Thompson/`,
`GroupTheory/SignalizerFunctor/`), next to the existing `FrobeniusKernel.lean`,
`TrivialIntersection.lean` and `Frattini.lean`.

## Scope and boundaries

**The in-scope rule is one sentence: a result belongs here when its standard proof uses only
subgroups, group actions and transfer, and no characters or representations.** Everything below
meets that rule. In particular:

- **Character theory** belongs to the
  [character-theory roadmap](../RepresentationTheory/CharacterTheory/README.md). That roadmap
  proves Frobenius's theorem, that the Frobenius kernel is a normal complement (its Layer 8), and
  Burnside's `pᵃqᵇ` theorem. Its Layer 8 names the nilpotency of the Frobenius kernel as a
  downstream target; L6 here proves it. L6 states the result against Tau Ceti's existing
  `frobeniusKernel` set, so it does not depend on that Layer 8.
- **Modular representation theory**, meaning Brauer characters and blocks, is excluded by the
  [representation-theory family](../RepresentationTheory/README.md) and is not taken up here.
- **The groups on the classification list** belong to
  [CFSGStatement](../CFSGStatement/README.md) and
  [CFSGBasicProperties](../CFSGBasicProperties/README.md). This roadmap proves no property of a
  specific simple group. The concrete groups in its examples are cyclic, dihedral, quaternion,
  symmetric and alternating groups and `p`-groups of small order.
- **Groups of Lie type** and the Lang–Steinberg theorem belong to
  [ReductiveGroups](../ReductiveGroups/README.md) and the Chevalley-group material it cites.
- **Fusion systems**, Alperin's fusion theorem and **L-balance** (whose proof needs the Schreier
  property of simple groups) are not part of this roadmap.

All groups are finite unless a statement says otherwise.

## Starting points

- **Mathlib.** `Sylow` and `IsPGroup`; `Subgroup.IsComplement'`,
  `Subgroup.exists_right_complement'_of_coprime` (existence in Schur–Zassenhaus);
  `MonoidHom.transfer`, `MonoidHom.transferSylow` and Burnside's normal `p`-complement theorem
  (`ker_transferSylow_isComplement'` under `IsCyclic`/central hypotheses);
  `Subgroup.focalSubgroup` with `commutator_inf_eq_focalSubgroup`; `Group.IsNilpotent`,
  `Group.isNilpotent_of_finite_tfae`; `Group.IsSolvable`; `frattini` with `frattini_nilpotent`;
  `Subgroup.IsSubnormal`; `Group.IsPerfect`; `Subgroup.normalCore`; `MonoidHom.FixedPointFree`;
  `MulDistribMulAction`, `FixedPoints.subgroup`, and the pointwise action of an acting group on
  `Subgroup G`.
- **Tau Ceti.** `TauCeti.IsTISubgroup` and `TauCeti.IsTISet`
  (`GroupTheory/TrivialIntersection.lean`); `TauCeti.frobeniusKernel` and its cardinality
  (`GroupTheory/FrobeniusKernel.lean`); the bound on automorphisms of a `p`-group acting
  trivially modulo the Frattini subgroup (`GroupTheory/Frattini.lean`); the commutator calculus of
  `GroupTheory/Commutator.lean`; `IsPGroup` closure lemmas (`GroupTheory/PGroup.lean`); the
  transfer API of `GroupTheory/Transfer/`.
- **Mathlib pull requests.** [mathlib4#39771](https://github.com/leanprover-community/mathlib4/pull/39771)
  defines `Subgroup.pCore p H`, the `p`-core of a subgroup `H`, as the image in `G` of the
  intersection of the Sylow `p`-subgroups of `H`, with its universal property and functoriality.
  L1 builds `pCore` in exactly that name and shape, so that adopting Mathlib's declaration is a
  deletion plus an import.
  [mathlib4#40036](https://github.com/leanprover-community/mathlib4/pull/40036) defines a
  group-level `p`-core, and
  [mathlib4#35603](https://github.com/leanprover-community/mathlib4/pull/35603) proves that the
  Frattini quotient of a `p`-group is elementary abelian. Both are prior art to reuse; the shape
  is the one of #39771.

## Conventions

- **Cores are relative.** Every core-like construction takes `H : Subgroup G` and returns a
  `Subgroup G` contained in `H`: `pCore p H`, `piCore π H`, `pPrimeCore p H`, `fitting H`,
  `layer H`, `generalizedFitting H`. The group-level object is the value at `⊤`. A relative core
  of `H` agrees with the image of the core of the group `↥H`; prove this (`map_subtype_*`) for each
  construction, since that is how results about groups are transported to subgroups.
- **`π`-groups.** `π : Set ℕ`, and `IsPiSubgroup π K` means every prime dividing `Nat.card K`
  lies in `π`. `O_{p′}` is `piCore {q | q ≠ p}`. Prove `piCore {p} H = pCore p H` for prime `p`.
  A Hall `π`-subgroup is a `π`-subgroup whose index is divisible by no prime of `π`.
- **Actions.** A group `A` acts on `G` through `[MulDistribMulAction A G]`. `C_G(A)` is Mathlib's
  `FixedPoints.subgroup A G`, and `C_G(a)` for one element is `fixedBy A a`. `[K, A]` is
  `commutatorAct A K`, the closure of `{x⁻¹ (a • x) | x ∈ K, a ∈ A}`. Invariance of a subgroup is
  `a • K = K` in the pointwise action. A subgroup `A ≤ N_G(K)` acting on `K` by conjugation is
  the special case given by Mathlib's `MulDistribMulAction (normalizer K) K`; state each theorem
  for the external action and derive its internal form.
- **Coprime action.** "Coprime" is `Nat.Coprime (Nat.card A) (Nat.card G)`. Where the classical
  proof uses conjugacy of complements, the theorem carries the hypothesis
  `Group.IsSolvable A ∨ Group.IsSolvable G`. The Feit–Thompson theorem, which would remove it, is
  not part of this roadmap, and no theorem here assumes it.
- **Commutators** are Mathlib's: `⁅g, h⁆ = g * h * g⁻¹ * h⁻¹`, `⁅H, K⁆` for subgroups, and the
  iterated `[P, x, x]` is `⁅⁅P, zpowers x⁆, zpowers x⁆`.
- **Normal `p`-complements.** `HasNormalPComplement p G` means some normal `N` satisfies
  `IsComplement' N P` for every `P : Sylow p G`. This is the form of Mathlib's Burnside theorem.
- **Thompson subgroup.** `𝒜(P)` is the set of abelian subgroups of `P` of maximal *order*, and
  `J(P)` is the subgroup they generate. Some sources use elementary abelian subgroups of maximal
  rank; that variant is not used here. `Z(J(P))` is written `centralizer J ⊓ J`.
- **Universes.** Statements are universe-polymorphic in `G` and in the acting group. No statement
  is restricted to `Type`.

## Milestone graph

```text
L1 cores, π-groups, Hall, Schur–Zassenhaus conjugacy, Baer–Suzuki
 ├── L2 Fitting subgroup, components, F*(G), Bender
 └── L3 coprime action ──┐
L4 p-groups: elementary abelian, p-rank, extraspecial, J(P), replacement
                         ├── L5 normal p-complements, p-stability, ZJ, Glauberman–Thompson
                         │    └── L6 Thompson: fixed-point-free automorphisms, Frobenius kernels
                         └── L7 solvable signalizer functors
```

L4 rests only on Mathlib's `p`-group theory and may proceed in parallel with L1–L3.

## L1: cores, Hall subgroups, and the Baer–Suzuki theorem

- **`p`-cores.** `pCore p H` as in mathlib4#39771, with that PR's API: `pCore_le`,
  `isPGroup_pCore`, the normality of `(pCore p H).subgroupOf H`, its characteristic property,
  `le_pCore` for normal `p`-subgroups, `pCore_eq_iSup` and `pCore_eq_iInf_sylow`,
  `mem_pCore_iff`, `pCore_eq_bot_iff`, `pCore_eq_self_iff`, and the behaviour under
  homomorphisms (`map_pCore_le_pCore`, `map_pCore_eq_pCore_of_ker_isPGroup`,
  `MulEquiv.map_pCore`).
- **`π`-cores.** `piCore π H`, the subgroup generated by the normal `π`-subgroups of `H`, with
  the same API as `pCore`: it is a normal (indeed characteristic) `π`-subgroup of `H`
  (`isPiSubgroup_piCore`) containing every normal `π`-subgroup; `piCore_singleton`;
  `pPrimeCore p H`; and `O_π(H ⧸ O_π(H)) = 1`. For `N` normal in `H`, `O_π(N) = O_π(H) ⊓ N`.
- **Hall's theorem.** In a solvable group, Hall `π`-subgroups exist for every `π`, any two are
  conjugate, and every `π`-subgroup lies in one (`exists_isHallSubgroup`,
  `exists_conj_eq_of_isHallSubgroup`, `exists_le_isHallSubgroup`).
- **Schur–Zassenhaus, conjugacy.** If `N ⊴ G` with `gcd(|N|, |G : N|) = 1` and `N` or `G ⧸ N`
  is solvable, any two complements of `N` are conjugate (`exists_conj_eq_of_isComplement'`).
  Prove the abelian case first, from Mathlib's `Subgroup.QuotientDiff` machinery
  (`exists_smul_eq`). Reduce the case of solvable `N` to it by induction on `|N|`, and prove the
  case of solvable `G ⧸ N` by induction on `|G : N|`.
- **The Baer–Suzuki theorem.** For a `p`-element `x` of `G`, `x ∈ O_p(G)` if and only if
  `⟨x, gxg⁻¹⟩` is a `p`-group for every `g ∈ G`
  (`mem_pCore_of_forall_isPGroup_closure` and its converse). The proof is by the
  Alperin–Lyons counting argument. The same statement appears as a
  [lean-eval problem](https://github.com/leanprover/lean-eval/pull/311) phrased with
  mathlib4#39771's `pCore`.

## L2: the Fitting subgroup, components, and `F*(G)`

- **The Fitting subgroup.** `fitting H`, generated by the normal nilpotent subgroups of `H`. It
  is nilpotent (`isNilpotent_fitting`), characteristic, contains every normal nilpotent subgroup,
  and equals `⨆ p, pCore p H`, an internal direct product of its Sylow subgroups
  (`fitting_eq_iSup_pCore`). Prove `fitting N = fitting H ⊓ N` for `N` normal in `H`,
  `frattini G ≤ fitting ⊤`, `fitting (G ⧸ frattini G)` is the image of `fitting ⊤`, and, for
  solvable `G`, `C_G(F(G)) ≤ F(G)` (`centralizer_fitting_le`).
- **Quasisimple groups and components.** `IsQuasisimple K`: `K` is perfect (`Group.IsPerfect`)
  and `K ⧸ center K` is simple. A component of `H` is a quasisimple subgroup subnormal in `H`
  (`IsComponentOf K H`, with Mathlib's `Subgroup.IsSubnormal`). Prove:
  - a quasisimple group modulo any proper normal subgroup is quasisimple, and a proper normal
    subgroup of a quasisimple group is central;
  - a component of a subnormal subgroup of `H` is a component of `H`, and a component of `H`
    contained in `N ⊴ H` is a component of `N`;
  - distinct components commute (`commutator_eq_bot_of_isComponentOf`);
  - a component either lies in a given subnormal subgroup or commutes with it;
  - `G` permutes its components by conjugation, and every component normalizes every subnormal
    subgroup.
- **The layer.** `layer H := E(H)`, the subgroup generated by the components of `H`. Prove that
  it is the central product of the components: `E(H)` is perfect, `E(H) ⧸ Z(E(H))` is the direct
  product of the simple quotients `K ⧸ Z(K)`, and `⁅fitting H, layer H⁆ = ⊥`
  (`commutator_fitting_layer`).
- **`F*(G)` and Bender's theorem.** `generalizedFitting H := fitting H ⊔ layer H`. Prove that
  `C_G(F*(G)) ≤ F*(G)` (`centralizer_generalizedFitting_le`), and its consequences:
  `F*(G) = F(G)` when `G` is solvable, `F*(G) = G` when `G` is quasisimple, and
  `C_G(F*(G)) = Z(F(G))`.

## L3: coprime action

Let `A` act on `G` with `gcd(|A|, |G|) = 1`. Where marked †, the theorem assumes
`Group.IsSolvable A ∨ Group.IsSolvable G` (see Conventions).

- **Invariant Sylow subgroups.**† For each prime `p`, an `A`-invariant Sylow `p`-subgroup exists,
  and any two are conjugate by an element of `C_G(A)` (`exists_sylow_smul_eq`,
  `exists_mem_fixedPoints_conj_eq`). More generally (**Glauberman's lemma**): if `G` and `A` also
  act compatibly on a set `Ω`, with `G` transitive, then `A` fixes a point of `Ω`, and the
  `A`-fixed points form a single `C_G(A)`-orbit.
- **Fixed points modulo a normal subgroup.**† If `N` is normal and `A`-invariant, every coset
  `gN` fixed by `A` contains an element of `C_G(A)`
  (`exists_mem_fixedPoints_mul_of_forall_mem`), so `C_{G/N}(A)` is the image of `C_G(A)`.
- **Commutator identities.**† `G = C_G(A) [G, A]` (`fixedPoints_sup_commutatorAct`),
  `[G, A, A] = [G, A]` (`commutatorAct_commutatorAct`), and for abelian `G`,
  `G = C_G(A) × [G, A]` as an internal direct product.
- **Generation by centralizers.** If `A` is a noncyclic elementary abelian `p`-group, then `G`
  is generated by the `C_G(a)`, `a ∈ A ∖ {1}` (`iSup_fixedBy_eq_top`). No solvability
  hypothesis is needed, since `A` is solvable.
- **Action on `p`-groups.** For a `p`-group `P` and a `p′`-group `A`: if `A` acts trivially on
  `P ⧸ Φ(P)` then it acts trivially on `P` (from the existing Tau Ceti Frattini bound);
  `[P, A, A] = [P, A]`; and **Thompson's `A × B` lemma**: if `A × B` acts on `P` with `B` a
  `p`-group and `A` trivial on `C_P(B)`, then `A` is trivial on `P`
  (`eq_of_fixedPoints_le_of_isPGroup`).

## L4: `p`-groups for local analysis

- **Elementary abelian groups and `p`-rank.** `IsElementaryAbelian p E`: abelian with
  `e ^ p = 1` for all `e`. Prove that the Frattini quotient of a `p`-group is elementary abelian,
  identify an elementary abelian `p`-group with a vector space over `ZMod p` through `Additive`,
  and prove that its subgroups of index `p` are the hyperplanes. `pRank p G` (`m_p(G)`) is the
  largest `k` with an elementary abelian subgroup of order `p ^ k`. Prove monotonicity in
  subgroups, `m_p(G) = m_p(S)` for `S` Sylow, and that a `p`-group of `p`-rank `1` is cyclic for
  odd `p`, and cyclic or generalized quaternion for `p = 2`.
- **Extraspecial groups.** `IsExtraspecial p P`: `P` is a `p`-group with `|Z(P)| = p` and
  `P′ = Φ(P) = Z(P)`. Prove `|P| = p ^ (1 + 2n)` with `n ≥ 1`
  (`exists_card_eq_of_isExtraspecial`); that the commutator induces a nondegenerate alternating
  form on `P ⧸ Z(P)` over `ZMod p`; that `P` is a central product of `n` extraspecial groups of
  order `p³`; and that for each `p` and `n ≥ 1` there are exactly two isomorphism classes of
  extraspecial groups of order `p ^ (1 + 2n)`. For `p = 2` these are the central products of
  copies of `D₈` and `Q₈`, distinguished by the number of `Q₈` factors modulo `2`. For odd `p`
  they are distinguished by their exponent, `p` or `p²`.
- **The Thompson subgroup.** `maxOrderAbelianSubgroups P` (`𝒜(P)`) and
  `thompsonSubgroup P` (`J(P)`). Prove that `J(P)` is characteristic in `P`, that
  `J(P) ≤ Q ≤ P` implies `J(Q) = J(P)`, and that every member of `𝒜(P)` contains `Z(P)`, so
  that `Z(P) ≤ Z(J(P))`.
- **Replacement theorems.** **Thompson's replacement theorem**, in its base form: for
  `A ∈ 𝒜(P)` and `x ∈ P` such that `M := ⟨[x, u] : u ∈ A⟩` is abelian,
  `M · C_A(M) ∈ 𝒜(P)` (`sup_mem_maxOrderAbelianSubgroups`). Then **Glauberman's replacement
  theorem** for odd `p`:
  if `B ⊴ P` has class at most `2` and `B′ ≤ Z(J(P))`, then either `B` lies in every member of
  `𝒜(P)`, or some `A ∈ 𝒜(P)` not containing `B` is normalized by `B`.

## L5: normal `p`-complements and the `ZJ` theorem

- **Normal `p`-complements.** `HasNormalPComplement p G` (Conventions). Prove that it is
  inherited by subgroups and quotients, that the complement is `O_{p′}(G)` and is unique, and
  that it agrees with Mathlib's Burnside theorem in the cyclic-Sylow and central-Sylow cases.
- **Frobenius's normal `p`-complement theorem.** `G` has a normal `p`-complement if and only if
  `N_G(Q)` has one for every nontrivial `p`-subgroup `Q`, if and only if `N_G(Q) ⧸ C_G(Q)` is a
  `p`-group for every `p`-subgroup `Q` (`hasNormalPComplement_of_forall_isPGroup`). The proof
  uses Mathlib's focal subgroup theorem.
- **`p`-stability.** For odd `p`, `IsPStable p G`: whenever `P` is a `p`-subgroup with
  `O_{p′}(G) P ⊴ G`, and `x ∈ N_G(P)` satisfies `[P, x, x] = 1`, the image of `x` in
  `N_G(P) ⧸ C_G(P)` lies in `O_p(N_G(P) ⧸ C_G(P))`. The prototype states the last clause without
  a quotient. Prove the two forms equivalent.
- **Glauberman's `ZJ` theorem.** For odd `p`, if `G` is `p`-stable and
  `C_G(O_p(G)) ≤ O_p(G)`, then `Z(J(S))` is normal in `G` for every Sylow `S`
  (`normal_center_thompsonSubgroup`). Prove that it is in fact characteristic.
- **The Glauberman–Thompson normal `p`-complement theorem.** For odd `p` and a Sylow
  `p`-subgroup `S`, if `N_G(Z(J(S)))` has a normal `p`-complement, so does `G`
  (`hasNormalPComplement_of_normalizer_center_thompsonSubgroup`). Also prove **Thompson's normal
  `p`-complement theorem**, from which it is usually derived: for odd `p`, if `N_G(J(S))` and
  `C_G(Z(S))` both have normal `p`-complements, so does `G`.

## L6: Thompson's theorem on fixed-point-free automorphisms

- **Thompson's theorem.** If `φ` is an automorphism of `G` of prime order with no nonidentity
  fixed point (`MonoidHom.FixedPointFree`), then `G` is nilpotent
  (`isNilpotent_of_fixedPointFree`). The proof is by minimal counterexample. It uses L3 to find
  `φ`-invariant Sylow subgroups, L5 (Thompson's normal `p`-complement theorem for odd `p`) to
  produce a normal complement, and Mathlib's `MonoidHom.FixedPointFree` lemmas for the
  involutive case.
- **Fixed-point-free automorphism groups.** If a nontrivial group of automorphisms acts with no
  nonidentity fixed point on `G` (each nonidentity element is fixed-point-free), then `G` is
  nilpotent.
- **Frobenius kernels are nilpotent.** If `H` is a proper nontrivial trivial-intersection
  subgroup (`TauCeti.IsTISubgroup`) and `N` is a subgroup with carrier `TauCeti.frobeniusKernel H`,
  then `N` is nilpotent (`isNilpotent_of_coe_eq_frobeniusKernel`). Conjugation by an element of
  prime order in `H` is a fixed-point-free automorphism of `N`.

## L7: solvable signalizer functors

Let `A ≤ G` be an elementary abelian `p`-subgroup.

- **Signalizer functors.** `IsSignalizerFunctor p A θ` for `θ : G → Subgroup G`, read on
  `A ∖ {1}`: each `θ a` is a `p′`-subgroup of `C_G(a)` normalized by `A`, and
  `θ a ⊓ C_G(b) ≤ θ b` for all nonidentity `a, b ∈ A`. Its completion
  `signalizerCompletion A θ` is the subgroup generated by the `θ a`. `θ` is **complete** when its
  completion is a `p′`-group `W` with `C_W(a) = θ a` for each nonidentity `a`. Prove the basic
  closure properties: the completion is normalized by `A`, and a complete functor's completion
  contains every `A`-invariant `p′`-subgroup `Y` with `C_Y(a) ≤ θ a` for all nonidentity `a`,
  when `A` is noncyclic (by L3's generation by centralizers).
- **Glauberman's solvable signalizer functor theorem.** If `m_p(A) ≥ 3` and every `θ a` is
  solvable, then `θ` is complete and its completion is solvable
  (`signalizerCompletion_complete`). The proof uses L1 (`π`-cores and Hall subgroups of
  solvable groups) and L3 (coprime action and generation by centralizers).

## Not on this roadmap: the character-theoretic local theory

*This section motivates a future roadmap. It is not work to attempt under this one; contributors
should not follow it.* The deep local theorems used in the classification combine the material
above with ordinary and modular character theory. They are the Feit–Thompson odd order theorem,
Glauberman's `Z*` theorem (which uses Brauer's block theory), the Brauer–Suzuki theorem, the
Bender–Suzuki classification of groups with a strongly embedded subgroup, and the
Gorenstein–Walter classification of groups with dihedral Sylow `2`-subgroups. Each needs a
roadmap of its own, resting on this one and on a modular-representation roadmap.

## References

- M. Aschbacher, *Finite Group Theory*, 2nd ed., Cambridge Studies in Advanced Mathematics 10,
  Cambridge University Press, 2000.
- D. Gorenstein, *Finite Groups*, Harper & Row, 1968; 2nd ed., Chelsea, 1980.
- I. M. Isaacs, *Finite Group Theory*, Graduate Studies in Mathematics 92, American Mathematical
  Society, 2008.
- H. Kurzweil and B. Stellmacher, *The Theory of Finite Groups: An Introduction*, Universitext,
  Springer, 2004.
- J. L. Alperin and R. Lyons, On conjugacy classes of `p`-elements, *J. Algebra* 19 (1971),
  536–537.
- G. Glauberman, A characteristic subgroup of a `p`-stable group, *Canad. J. Math.* 20 (1968),
  1101–1135.
- G. Glauberman, On solvable signalizer functors in finite groups, *Proc. London Math. Soc.* (3)
  33 (1976), 1–27.
- J. G. Thompson, Finite groups with fixed-point-free automorphisms of prime order,
  *Proc. Nat. Acad. Sci. U.S.A.* 45 (1959), 578–581.

## Provenance

*Secondary. The milestones above are the specification; nothing in this section is
prescriptive.* Machine-checked proofs of most of these statements exist in two Apache-2.0
projects. They can be consulted as sources, after coordinating with their authors as the
[porting guidance](../../README.md#porting-existing-work) asks.

- [AxiomMath/CFSG](https://github.com/AxiomMath/CFSG/tree/69cb972f587a3ecc035e092253167ff2e303c962),
  a proof of `TauCeti.ClassificationStatement`. Its statements of the milestones above are in
  `CFSG/Milestones/`: `LC_generalized_fitting_self_centralizing` (L2),
  `ZJ_glauberman_characteristic` and `ZJ_glauberman_replacement` (L4–L5),
  `SG_two_signalizer_completeness` and `CL_LIT_signalizer_functor_theorem` (L7). Its general
  material is spread over `CFSG/GroupTheory/` (including `PCore/`, `Fitting/`,
  `CoprimeActionSupport/`, `PLayer/`) and `CFSG/SignalizerFunctorTheorem/`. The project keeps
  several parallel definitions of the same core, so it is a proof source and not an interface to
  copy.
- [Qiuzhen-CFSG/CFSG](https://github.com/Qiuzhen-CFSG/CFSG), vendored in the project above as
  `CFSG/ThirdParty/QiuzhenCFSG/`. It contains the Baer–Suzuki theorem (`BaerSuzuki/`, L1),
  Thompson's replacement theorem (`FeitThompson/Gorenstein/Chapter8_2.lean`, L4), the definitions
  of `p`-stability (`Glauberman/Definitions.lean`, L5), and Thompson's fixed-point-free
  automorphism theorem (`BenderSuzuki/External/Huppert/V/theorem_8_14.lean`, L6).
