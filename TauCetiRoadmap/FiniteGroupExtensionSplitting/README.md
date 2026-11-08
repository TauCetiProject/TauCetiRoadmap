# Roadmap: Gaschütz splitting and complements to abelian normal subgroups

**Summary.** This roadmap develops the splitting theory of a group `G` over an abelian normal
subgroup `N`: the dictionary between complements of `N`, splittings of the quotient extension
`N → G → G ⧸ N` and normalized crossed homomorphisms `G → N`; the crossed transfer of such a
homomorphism from a subgroup `H ≥ N` of finite index to `G`, built from Tau Ceti's degree-one
cochain corestriction; and the comparison with the class of the extension in `H²(G ⧸ N, N)`. The
end theorems, for `G` finite, are **Gaschütz's splitting theorem** (`exists_isComplement'_of_coprime_index`): if `N`
has a complement in a subgroup `H` whose index is coprime to `|N|`, then `N` has a complement in
`G`; its **Sylow form** (`exists_isComplement'_iff_sylow`): an abelian normal `p`-subgroup has a
complement in `G` if and only if it has one in a Sylow `p`-subgroup; and the **invariant-complement
theorem** (`exists_invariant_complement`): under an action of a `q`-group with `q ≠ p`, such a
complement can be chosen invariant. The statements concern actual subgroup complements, not the
vanishing of an obstruction alone; the cohomological comparison
(`exists_complement_iff_cohomologyClass_eq_zero`) is proved as a theorem about those complements.

## Scope and ownership

- **Owned here.** Local and global complements, their restriction and transport, and the
  splitting–complement dictionary for the quotient extension (Layer 0, cited downstream as S0);
  the conjugation action of `G` on `N`, its additive module, crossed projections of complements,
  kernels of normalized crossed maps, their equivariance and restriction (Layer 1, S1); the crossed
  transfer, its value on `N`, the inverse-exponent normalization, Gaschütz's theorem, the quotient
  action of `G ⧸ N`, the quotient extension as a `GroupExtension`, the cohomological comparison and
  the restriction formula for the extension class (Layer 2, S2); Sylow detection and invariant
  complements in external and internal form (Layer 3, S3).
- **Supplied by Mathlib at the pin.** Complements (`Subgroup.IsComplement'`), group extensions,
  sections and splittings (`GroupExtension`, `GroupExtension.Section`, `GroupExtension.Splitting`),
  semidirect products (`SemidirectProduct.mulEquivSubgroup`), the multiplicative cocycle and
  coboundary predicates (`groupCohomology.IsMulCocycle₁`, `groupCohomology.IsMulCoboundary₁`),
  Sylow theory and the Schur–Zassenhaus theorem (`Subgroup.exists_right_complement'_of_coprime`).
  Schur–Zassenhaus is consumed where coprimality of `|N|` and `[G : N]` is available and is never
  restated.
- **Supplied by Tau Ceti at the pin.** The degree-one cochain corestriction and its formulas, the
  transversal word, the transfer with arbitrary representatives, factor sets of sections, the
  cohomology class of a factor set and its splitting criterion, corestriction on group cohomology
  and the Sylow restriction criterion. Their exact names are in *Exact supplier contracts*. The
  generator-lifting lemma of Gaschütz,
  `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective` in
  `TauCeti/GroupTheory/Gaschutz.lean`, is a different theorem and is not developed here.
- **Left to LocalFiniteGroupTheory.** Hall subgroups and the conjugacy of coprime complements (its
  L1), coprime action and invariant Sylow subgroups under a coprime action (its L3). The
  invariant-complement theorem of §3.2 assumes no coprimality of `|A|` and `|W|` and is proved from
  §3.1 and Sylow conjugacy alone; nothing of that roadmap is consumed.
- **Not in scope.** Non-abelian kernels (the theorem fails for them: §2.4 records Baer's
  counterexample), profinite extensions, the classification of all complements up to conjugacy,
  and the comparison of `H²(G ⧸ N, N)` with the cohomology of a topological group.

## Conventions

- `G` is a group and `N` is a subgroup with `N.Normal` and `IsMulCommutative N`. Finiteness of
  `G`, written `[Finite G]`, is assumed in §§2.1–2.4, §2.7 and Layer 3, where a transversal of
  `H` or a Sylow subgroup is used; the dictionaries of Layers 0–1 and the comparison of §2.6 hold
  for every group `G`. Orders are `Nat.card`, indices are `Subgroup.index`. Every statement is
  universe-polymorphic except the cohomological comparison of §2.6, stated for `G : Type` because
  the pinned `TauCeti.FactorSet.cohomologyClass` is.
- Permutations multiply as Mathlib's `Equiv.Perm`: `(f * g) x = f (g x)`, the right factor acting
  first, so `(1 2 3) * (1 2) = (1 3)` and `(1 2) * (1 2 3) = (2 3)`; conjugation `g * σ * g⁻¹`
  relabels the entries of `σ` by `g`.
- A **local complement** of `N` in a subgroup `H` is a subgroup `K` with `N ⊓ K = ⊥` and
  `N ⊔ K = H`; this forces `N ≤ H` and `K ≤ H`. A **global complement** is a subgroup `D` with
  `N.IsComplement' D`. For `H = ⊤` the two notions agree (§0.1).
- The **conjugation action** `conjugationAction N` is `g • n = g * n * g⁻¹` (§1.1). A **crossed
  map** `c : H → N` on a subgroup `H ≥ N` satisfies `c (g * h) = (g • c h) * c g`, which is
  Mathlib's `groupCohomology.IsMulCocycle₁` for the action restricted to `H`; it is **normalized**
  when `c n = n` for every `n ∈ N`. The **principal crossed map** of `a ∈ N` is
  `g ↦ (g • a) * a⁻¹`, Mathlib's `IsMulCoboundary₁` witness `g • a / a`. Since `N` is abelian,
  `(g • c h) * c g = c g * (g • c h)`, so the order of the two factors is immaterial, but the
  action is not: in `A₄` with `N = V₄` and `D = ⟨(1 2 3)⟩`, the projection `c` along `D` has
  `c ((1 2 3) * (1 2)(3 4)) = (1 4)(2 3) = (1 2 3) • c ((1 2)(3 4))`, while the convention
  `g⁻¹ * n * g` would give `(1 3)(2 4)`.
- Products over cosets use Tau Ceti's transversal word
  `lWord H t u γ = (t u)⁻¹ * γ * t (γ⁻¹ • u)` for a transversal `t : G ⧸ H → G`, and the
  corestriction convention `(cor¹_t f) γ = ∑ u, t u • f (lWord H t u γ)`.
- A `q`-group acting on `W` acts by group automorphisms, `[MulDistribMulAction A W]`; a subgroup
  `D ≤ W` is `A`-stable when `a • d ∈ D` for all `a ∈ A` and `d ∈ D`.

## Exact supplier contracts

**From Mathlib** (`Mathlib/GroupTheory/Complement.lean`, `Mathlib/GroupTheory/GroupExtension/Defs.lean`,
`Mathlib/GroupTheory/GroupExtension/Basic.lean`, `Mathlib/GroupTheory/SemidirectProduct.lean`,
`Mathlib/GroupTheory/Sylow.lean`, `Mathlib/GroupTheory/Index.lean`,
`Mathlib/GroupTheory/SchurZassenhaus.lean`,
`Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`,
`Mathlib/RepresentationTheory/Rep/Basic.lean`, `Mathlib/GroupTheory/GroupAction/ConjAct.lean`,
`Mathlib/Algebra/Group/Subgroup/Actions.lean`, `Mathlib/Algebra/Group/Submonoid/DistribMulAction.lean`,
`Mathlib/GroupTheory/PGroup.lean`).

- `Subgroup.IsComplement'`, `Subgroup.isComplement'_of_disjoint_and_mul_eq_univ`,
  `Subgroup.IsComplement'.sup_eq_top`, `Subgroup.IsComplement'.disjoint`,
  `Subgroup.IsComplement'.index_eq_card`, `Subgroup.IsComplement'.card_mul`,
  `Subgroup.isComplement'_iff_card_mul_and_disjoint`: a complement is a subgroup meeting `N`
  trivially whose product with `N` is `G`; `|N| * |D| = |G|` and `[G : N] = |D|`.
- `GroupExtension`, `GroupExtension.Section`, `GroupExtension.Splitting`, `GroupExtension.Equiv`,
  `GroupExtension.conjAct`, `GroupExtension.inl_conjAct_comm`, `GroupExtension.surjInvRightHom`:
  an extension is a pair of homomorphisms `inl`, `rightHom` with `inl` injective, `rightHom`
  surjective and `range inl = ker rightHom`; a splitting is a section that is a homomorphism;
  `conjAct e` is conjugation by `e` read on the kernel.
- `SemidirectProduct.mulEquivSubgroup`: for `N.IsComplement' D` with `N` normal, `N ⋊ D ≃* G`.
- `IsPGroup.le_sylow_of_normal`, `Sylow.not_dvd_index`, `Sylow.card_eq_multiplicity`,
  `IsPGroup.exists_le_sylow`, `MulAction.exists_smul_eq` for `Sylow p G`,
  `IsPGroup.exists_card_eq`: a normal `p`-subgroup lies in every Sylow `p`-subgroup, `p` does
  not divide `[G : P]`, every `p`-subgroup lies in a Sylow `p`-subgroup, Sylow `p`-subgroups are
  conjugate, a finite `p`-group has order `p ^ j` for some `j`.
- `Subgroup.index_map_eq`, `Subgroup.card_mul_index`, `Subgroup.finiteIndex_of_finite`,
  `SemidirectProduct.card`: `[G' : f(H)] = [G : H]` for `f : G →* G'` surjective with
  `ker f ≤ H`; `|H| * [G : H] = |G|`; every subgroup of a finite group has finite index;
  `|W ⋊ A| = |W| * |A|`.
- The restriction of a `MulDistribMulAction G M` to a subgroup `H`: the instance
  `MulDistribMulAction ↥H M` of `Mathlib/Algebra/Group/Subgroup/Actions.lean` (the copy for
  subgroups of `Submonoid.mulDistribMulAction`), with `Subgroup.smul_def`: `h • m = (h : G) • m`.
- `Subgroup.exists_right_complement'_of_coprime`: Schur–Zassenhaus, a normal subgroup of order
  coprime to its index has a complement.
- `groupCohomology.IsMulCocycle₁ f`, which is `∀ g h, f (g * h) = g • f h * f g`, and
  `groupCohomology.IsMulCoboundary₁ f`, which is `∃ x, ∀ g, g • x / x = f g`; `IsMulCoboundary₂`.
- `Rep.ofMulDistribMulAction G M`: the `ℤ`-representation of `G` on `Additive M` with
  `ρ g a = Additive.ofMul (g • Additive.toMul a)`.
- `MulAut.conjNormal`, `MulAut.conjNormal_apply`, `MulDistribMulAction.compHom`,
  `QuotientGroup.lift`, `QuotientGroup.mk'`, `Subgroup.normalizerMonoidHom`.

**From Tau Ceti** (`TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Basic.lean`,
`TauCeti/GroupTheory/TransversalWord.lean`, `TauCeti/GroupTheory/Transfer.lean`,
`TauCeti/GroupTheory/GroupExtension/FactorSetOfSection.lean`,
`TauCeti/GroupTheory/GroupExtension/Cohomology.lean`,
`TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`,
`TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean`,
`TauCeti/GroupTheory/Perm/FinThree/Basic.lean`, `TauCeti/GroupTheory/GroupExtension/ZModFour.lean`).

- `TauCeti.ContCohomology.cochainsCor1 G M U t ht`, for `U : Subgroup G` of finite index, an
  additive `G`-module `M` with `[AddCommGroup M] [DistribMulAction G M]`, a transversal
  `t : G ⧸ U → G` with `ht : ∀ u, ↑(t u) = u`; `cochainsCor1_apply` is the formula
  `∑ u, t u • f (lWord U t u γ)`; `cochainsCor1_isCocycle₁` (a cocycle on `U` goes to a cocycle on
  `G`), `cochainsCor1_d0` (coboundaries go to coboundaries), `cochainsCor1_changeTransversal`
  (two transversals differ by an explicit coboundary), `cochainsCor1_res` (corestriction of a
  restricted cocycle is `[G : U] • c` plus a coboundary). No topology and no representation
  category enter the degree-one cochain section.
- `TauCeti.lWord`, `TauCeti.lWord_def`, `TauCeti.lWord_mem`, `TauCeti.transversal_mul_lWord`,
  `TauCeti.lWord_of_mem_of_normal` (for `γ ∈ U` with `U` normal, `lWord U t u γ = (t u)⁻¹ * γ * t u`).
- `TauCeti.transfer_eq_prod_lWord`, `MonoidHom.transfer_eq_prod_of_bijective`,
  `MonoidHom.transfer_comp`, `MonoidHom.transfer_transfer`: the transfer with arbitrary representatives,
  its naturality and transitivity. They are consumed for the comparison of §2.1 with the
  classical transfer when the action on `N` is trivial.
- `TauCeti.GroupExtension.InducesAction S`, `TauCeti.GroupExtension.factorSet σ hσ hact`,
  `TauCeti.GroupExtension.factorSetToGroupExtensionEquiv`,
  `TauCeti.GroupExtension.cohomologyClass_factorSet_eq`,
  `TauCeti.GroupExtension.inducesAction_iff_conjActOfSection_eq`,
  `TauCeti.GroupExtension.conjActOfSection_apply`: for an extension of `G` by an abelian `M` whose
  conjugation action is the given `MulDistribMulAction G M`, every normalized section has a factor
  set, the extension is equivalent to the twisted product of that factor set, and the class of the
  factor set does not depend on the section.
- `TauCeti.FactorSet.cohomologyClass`, `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
  (`α.groupExtension` splits iff `α.cohomologyClass = 0`),
  `TauCeti.FactorSet.nsmul_cohomologyClass_eq_zero_iff` (`n • α.cohomologyClass = 0` iff the
  pointwise `n`-th power of `α` is a `2`-coboundary); all for `G M : Type`.
- `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`,
  `TauCeti.groupCohomology.index_nsmul_eq_zero_of_map_eq_zero`: restriction to a finite-index
  subgroup `S` followed by corestriction is multiplication by `S.index`, so a class whose
  restriction vanishes is killed by the index.
- `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`: a class killed by a
  power of `p` whose restriction to a Sylow `p`-subgroup vanishes is zero.
- `TauCeti.isComplement'_alternatingGroup_stabilizer_perm_fin_three`: the stabilizer of a point is
  a complement of `A₃` in `S₃`. `TauCeti.isEmpty_splitting_zmodFourExtension`: the extension
  `ZMod 2 → ZMod 4 → ZMod 2` has no splitting.

## How to read the build

Layer 0 fixes the vocabulary: local and global complements, their restriction and transport, and
the quotient extension `N → G → G ⧸ N` with its splittings. Layer 1 turns a complement into a
normalized crossed map `G → N` and back, and records how kernels move under conjugation,
restriction and principal crossed maps. Layer 2 transfers a normalized crossed map from `H` to
`G` with Tau Ceti's degree-one corestriction, computes its value on `N`, normalizes it by an
inverse exponent and reads off Gaschütz's theorem; it then builds the quotient action and compares
complements with the class of the extension in `H²(G ⧸ N, N)`, including the restriction formula
that gives the cohomological proof of the same theorem. Layer 3 specialises to Sylow subgroups
and derives the invariant-complement theorem in a semidirect product.

## Layer 0: complement and section dictionaries (S0)

### 0.1 Local and global complements

For subgroups `N ≤ H` of `G`, say that `K` is a local complement of `N` in `H` when
`N ⊓ K = ⊥` and `N ⊔ K = H`. Prove that then `K ≤ H`, that `N` is normal in `H` when `N` is
normal in `G`, and that every `h ∈ H` is uniquely `h = n * k` with `n ∈ N`, `k ∈ K` (uniqueness
from `N ⊓ K = ⊥`; existence from `N ⊔ K = H` together with `N * K = K * N` for `N` normal, via
`Subgroup.mul_normal`). Define the two projections `h ↦ n` and `h ↦ k` of this decomposition
and prove `|H| = |N| * |K|`. Prove that for `H = ⊤` the local notion agrees with the global one:
`N ⊓ K = ⊥ ∧ N ⊔ K = ⊤ ↔ N.IsComplement' K` when `N` is normal
(`Subgroup.isComplement'_of_disjoint_and_mul_eq_univ` for the forward direction,
`Subgroup.IsComplement'.disjoint` and `Subgroup.IsComplement'.sup_eq_top` for the converse).
*Needs:* Mathlib `Subgroup.IsComplement'`, `Subgroup.mul_normal`, `disjoint_iff`.

- The projection `h ↦ n` restricts to the identity on `N` and to the constant `1` on `K`; the
  projection `h ↦ k` is a homomorphism `H → K` with kernel `N` (it is the composite of
  `H → H ⧸ N` with the inverse of `K ≅ H ⧸ N`).
- Restriction: if `N.IsComplement' D` and `N ≤ H`, then `D ⊓ H` is a local complement of `N` in
  `H` (`h = n * d` forces `d = n⁻¹ * h ∈ D ⊓ H`); the converse fails, so the restriction map
  from global to local complements is not surjective in general.
- Transport along `e : G ≃* G'`: `K` is a local complement of `N` in `H` iff `K.map e` is one of
  `N.map e` in `H.map e`; and `K` is a local complement of `N` in `H` iff `K.subgroupOf H` is a
  global complement of `N.subgroupOf H` in the group `↥H`.

**Checks.**

- In `S₃` with `N = A₃`, `H = ⊤`, `K = ⟨(1 2)⟩`: `N ⊓ K = ⊥`, `N ⊔ K = S₃`, the decomposition of
  `(1 3)` is `(1 2 3) * (1 2)` (the product `(1 3 2) * (1 2)` is `(2 3)`); the global form is
  `TauCeti.isComplement'_alternatingGroup_stabilizer_perm_fin_three`.
  A definition that forgot `N ⊓ K = ⊥` would accept `K = S₃`.
- In `C₄` with `N = C₂`: no local complement in `H = C₄` (the subgroups are `⊥, C₂, C₄`), while
  `K = ⊥` is a local complement in `H = C₂`. A definition with `N ⊔ K = ⊤` in place of `H` would
  reject the latter.
- `N = ⊥`: `K = H` is the unique local complement in `H`; `N = H`: `K = ⊥` is.
- Restriction is not surjective: in `A₄` with `N = V₄` and `H = V₄`, `K = ⊥` is a local
  complement in `H` and is `D ⊓ H` for `D = ⟨(1 2 3)⟩`; in `SL(2, 3)` with `N = Z = {±1}` and
  `H = Q₈`, no local complement exists (every subgroup of `Q₈` of order `4` contains `−1`), so a
  fortiori no global one.

### 0.2 The quotient extension and its splittings

Define `quotientExtension N : GroupExtension N G (G ⧸ N)` with `inl = N.subtype` and
`rightHom = QuotientGroup.mk' N`. Prove that its splittings correspond to global complements of
`N`: a splitting `s : G ⧸ N →* G` with `mk ∘ s = id` has range `s.range`, a complement
(`N ⊓ s.range = ⊥` because `mk (s x) = x`, and `N ⊔ s.range = ⊤` because `g = (g * (s (mk g))⁻¹) * s (mk g)`);
conversely a complement `D` gives the splitting `x ↦ ((mk' N).restrict D)⁻¹ x` through the
isomorphism `D ≃* G ⧸ N` (`Subgroup.IsComplement'` gives bijectivity of `mk' N` on `D`). Prove
the two value lemmas, `range (s_D) = D` and `s_{range s} = s`, so the correspondence is a
bijection between splittings of `quotientExtension N` and global complements of `N`. For `H ≥ N`
apply the same to `↥H` and `N.subgroupOf H`, and prove that the splittings of that extension
correspond to local complements of `N` in `H` through §0.1. Prove that for `N.IsComplement' D`
the equivalence `SemidirectProduct.mulEquivSubgroup` is the inverse of the decomposition of §0.1.
*Needs:* Mathlib `GroupExtension.Splitting`, `QuotientGroup.mk'`, `SemidirectProduct.mulEquivSubgroup`;
§0.1.

- `(quotientExtension N).rightHom_surjective` is `QuotientGroup.mk'_surjective N` and the kernel
  identification is `QuotientGroup.ker_mk'`.
- Transport of splittings along `GroupExtension.Equiv`: an equivalence `e : S.Equiv S'` of
  extensions carries splittings of `S` to splittings of `S'` (compose the homomorphism with `e`)
  and back, so `Nonempty S.Splitting ↔ Nonempty S'.Splitting`. This is the bridge used in §2.6.

**Checks.**

- `C₄` over `C₂`: `TauCeti.isEmpty_splitting_zmodFourExtension` says the pinned extension
  `ZMod 2 → ZMod 4 → ZMod 2` (written multiplicatively) has no splitting; the quotient extension
  of `C₄` by its `C₂` is isomorphic to it after identifying `N`, `C₄` and `C₄ ⧸ N` with
  `Multiplicative (ZMod 2)`, `Multiplicative (ZMod 4)` and `Multiplicative (ZMod 2)` (this is not
  a `GroupExtension.Equiv`, which keeps the kernel and the quotient fixed), and splittings
  transport along such an isomorphism as along an `Equiv`; so `C₂` has no complement in `C₄`, as
  §0.1 found directly.
- `S₃` over `A₃`: the splitting `x ↦ (1 2)^x` has range `⟨(1 2)⟩`; the other splittings have
  ranges `⟨(1 3)⟩`, `⟨(2 3)⟩`, three complements for three splittings.
- `N = ⊤`: `G ⧸ N` is trivial, the unique splitting has range `⊥`, the unique complement.
- A wrong converse that took `D.map (mk' N)` instead of the inverse of `mk' N` on `D` would send
  every complement to `⊤` and fail the value lemma.

### Examples

`S₃` over `A₃` (three complements), `C₄` over `C₂` (none), `A₄` over `V₄` (four complements, the
Sylow `3`-subgroups), `SL(2, 3)` over its centre (none, since none exists in `Q₈`), `C₂` inside
`C₄ ≤ C₄ × C₃` (a local complement in `C₂`, none in `C₄`).

### Dependencies

Mathlib only.

## Layer 1: crossed projections (S1)

### 1.1 The conjugation action and its additive module

Define `conjugationAction N : MulDistribMulAction G N` as the evaluation action of `MulAut N`
pulled back along `MulAut.conjNormal` by `MulDistribMulAction.compHom`, so that
`g • n = g * n * g⁻¹`. Define the additive conjugation module, the instance
`DistribMulAction G (Additive N)` with `g • Additive.ofMul n = Additive.ofMul (g • n)`
(`smul_zero` is `g • 1 = 1`, `smul_add` is `g • (n * m) = g • n * g • m`), and prove that it
agrees with `(Rep.ofMulDistribMulAction G N).ρ`: `ρ g a = g • a` for every `a : Additive N`.
The pinned Mathlib has `Additive.vadd` and `Additive.addAction` (the acting side made additive)
but no `DistribMulAction G (Additive M)` from a `MulDistribMulAction G M`, so this instance is a
definition of this roadmap. The restriction of the action to a subgroup `H` is not defined here:
it is the pinned instance `MulDistribMulAction ↥H N` of `Mathlib/Algebra/Group/Subgroup/Actions.lean`
(the subgroup copy of `Submonoid.mulDistribMulAction`), whose value is `Subgroup.smul_def`.
*Needs:* Mathlib `MulAut.conjNormal`, `MulDistribMulAction.compHom`, `Rep.ofMulDistribMulAction`,
`Subgroup.smul_def`.

- `(g • n : G) = g * n * g⁻¹` holds by definition; `n • m = n * m * n⁻¹ = m` for `n, m ∈ N` since
  `N` is abelian.
- For `h ∈ H`, the restricted action is `h • n = (h : G) • n` (`Subgroup.smul_def`, a `rfl`
  lemma), so `(h • n : G) = h * n * h⁻¹`; the crossed maps of Layer 1 on `H` are taken for this
  instance.
- The additive module and `Rep.ofMulDistribMulAction G N` have the same underlying action, so
  §2.1 may apply `cochainsCor1` to `Additive N` and read the result multiplicatively.

**Checks.**

- `A₄`, `N = V₄`, `g = (1 2 3)`, `n = (1 2)(3 4)`: `g • n = (1 4)(2 3)`, whereas
  `g⁻¹ * n * g = (1 3)(2 4)`; the two conventions differ, and the one chosen is the first.
- `N` central (`SL(2, 3)` over `{±1}`): the action is trivial, `g • n = n` for all `g`.
- `N = ⊤` with `G` abelian: the action is trivial; with `G = S₃`, `N = ⊤` is not abelian and the
  definition of the action still makes sense (only `IsMulCommutative` is dropped), with
  `(1 2) • (1 2 3) = (1 3 2)`.
- The additive module on `Additive V₄ ≅ (ZMod 2)²` under `(1 2 3)` is the matrix of order `3`
  permuting the three non-zero vectors; a wrong instance using `g⁻¹` gives its inverse.

### 1.2 The crossed projection of a local complement

For a local complement `K` of `N` in `H`, define the crossed projection `c_K : H → N` as the
`N`-component `h = n * k ↦ n` of §0.1. Prove that `c_K` is a crossed map for the action of `H` on
`N` (`h = n₁ * k₁`, `h' = n₂ * k₂` give `h * h' = n₁ * (k₁ * n₂ * k₁⁻¹) * (k₁ * k₂)`, so
`c_K (h * h') = n₁ * (k₁ • n₂) = (h • c_K h') * c_K h`, because
`h • n₂ = n₁ * (k₁ • n₂) * n₁⁻¹`; this computation commutes no two elements of `N`, and for
abelian `N` the two factors may be written in either order), that it is normalized (`c_K n = n`),
that `c_K k = 1` for `k ∈ K`, and that its kernel is `K`. *Needs:* §0.1, §1.1.

- `c_K` is not a homomorphism unless the action of `K` on `N` is trivial: `c_K (k * n) = k • n`
  while `c_K k * c_K n = n`.
- For `H = ⊤` and `D` a global complement, `c_D : G → N` is normalized and crossed for
  `conjugationAction N`.

**Checks.**

- `S₃`, `N = A₃`, `K = ⟨(1 2)⟩`: `c_K ((1 3)) = (1 2 3)` (from `(1 3) = (1 2 3) * (1 2)`), `c_K ((1 2)) = 1`,
  `c_K ((1 2) * (1 2 3)) = (1 2) • (1 2 3) = (1 3 2) ≠ c_K ((1 2)) * c_K ((1 2 3)) = (1 2 3)`: a
  definition that made `c_K` a homomorphism is wrong.
- `A₄`, `N = V₄`, `K = ⟨(1 2 3)⟩`: `c_K ((1 2 3) * (1 2)(3 4)) = (1 4)(2 3)`, the witness of the
  conventions.
- `N = ⊥`: `c_K = 1`; `K = ⊥`, `H = N`: `c_K = id`.

### 1.3 Kernels of normalized crossed maps

For a normalized crossed map `c : H → N`, prove that `ker c = {h ∈ H | c h = 1}` is a subgroup
(`c 1 = 1` from `c 1 = c 1 * c 1`; closure from the crossed identity; inverses from
`1 = c (h⁻¹ * h) = (h⁻¹ • c h) * c h⁻¹`), that `N ⊓ ker c = ⊥` (`c n = n`), and that
`N ⊔ ker c = H`: for `h ∈ H` put `n = c h`; then `c (n⁻¹ * h) = (n⁻¹ • c h) * c n⁻¹ = n * n⁻¹ = 1`
because `N` is abelian, so `h = n * (n⁻¹ * h)` with `n⁻¹ * h ∈ ker c`. Prove the two inverse
lemmas, `c_{ker c} = c` and `ker c_K = K`, so that local complements of `N` in `H` and normalized
crossed maps `H → N` are in bijection. Nothing here uses finiteness of `G`. Export the headline
`exists_complement_iff_crossedProjection`: for `H = ⊤` and any group `G`, `N` has a global
complement iff there is `c : G → N` with `groupCohomology.IsMulCocycle₁ c` for
`conjugationAction N` and `c n = n` for all `n ∈ N`. *Needs:* §1.2, §0.1, Mathlib
`groupCohomology.IsMulCocycle₁`.

**Checks.**

- `S₃`, `N = A₃`: the three normalized crossed maps `S₃ → A₃` are the projections along the
  three transpositions; a map with `c ((1 2)) = (1 2 3)` and `c ((1 3)) = 1` is not crossed.
- `C₄` over `C₂`: a normalized crossed map `c : C₄ → C₂` would give `c (x²) = x • c x * c x = (c x)² = 1`
  for the generator `x`, contradicting `c (x²) = x² ≠ 1`; so there is none, consistent with §0.1.
- Dropping normalization: the constant map `1` is crossed with kernel `H`, which is not a
  complement unless `N = ⊥`.
- Dropping `IsMulCommutative`: the dictionary does not use it. In `S₄` with the normal
  non-abelian `N = A₄`, `H = S₄` and `K = ⟨(1 2)⟩`, the projection `c_K` satisfies
  `c_K (g * h) = (g • c_K h) * c_K g` for all `g, h` by the computation of §1.2, and
  `ker c_K = K`; the step `c (n⁻¹ * h) = (n⁻¹ • c h) * c n⁻¹ = n * n⁻¹ = 1` with `n = c h` uses
  only `n⁻¹ • n = n⁻¹ * n * n = n`. The hypothesis is carried because the pinned
  `groupCohomology.IsMulCocycle₁` is defined for a commutative coefficient group (`[CommGroup M]`),
  and because the reversed order `c g * (g • c h)` agrees with it only for abelian `N`: with
  `g = (1 2 3)`, `h = (1 2 4)` in `A₄`, `(g • c_K h) * c_K g = g * h = (1 3)(2 4)` but
  `c_K g * (g • c_K h) = g * g * h * g⁻¹ ≠ g * h` because `g * h ≠ h * g`.

### 1.4 Equivariance and restriction

For a normalized crossed map `c : H → N` and `g ∈ G`, define `c^g : g H g⁻¹ → N` by
`c^g x = g • c (g⁻¹ * x * g)` and prove that it is a normalized crossed map with
`ker c^g = g (ker c) g⁻¹`; for a local complement `K` of `N` in `H` this says that `g K g⁻¹` is a
local complement of `N` in `g H g⁻¹` with crossed projection `c_K^g`. For an intermediate
subgroup `N ≤ H' ≤ H`, prove that the restriction `c|_{H'}` is a normalized crossed map with
kernel `ker c ⊓ H'`, a local complement of `N` in `H'`. *Needs:* §1.3, Mathlib `MulAut.conj`.

**Checks.**

- `S₃`, `K = ⟨(1 2)⟩`, `g = (1 2 3)`: `g K g⁻¹ = ⟨(2 3)⟩`, and `c_K^g` is the projection along
  `⟨(2 3)⟩`.
- `A₄`, `N = V₄`, `H = A₄`, `H' = V₄`: the restriction of `c_K` to `V₄` is the identity with kernel
  `⊥ = K ⊓ V₄`.
- A wrong formula `c^g x = c (g⁻¹ * x * g)` without the outer `g •` fails normalization:
  for `x = n ∈ N`, it gives `g⁻¹ * n * g ≠ n` in `A₄`.

### 1.5 Principal crossed maps move kernels by conjugation

For `a ∈ N`, prove that `δ_a : H → N`, `δ_a g = (g • a) * a⁻¹`, is a crossed map (Mathlib's
`IsMulCoboundary₁` witness `a`), that `c * δ_a` is normalized and crossed whenever `c` is, and
that `ker (c * δ_a) = a (ker c) a⁻¹`: for `d ∈ ker c`, with `u = d • a`,
`c (a d a⁻¹) = a • (d • a⁻¹) * a = a * u⁻¹` and `δ_a (a d a⁻¹) = u * a⁻¹`, whose product is `1`
because `N` is abelian; the reverse inclusion follows by symmetry with `a⁻¹`. *Needs:* §1.3,
Mathlib `groupCohomology.IsMulCoboundary₁`.

**Checks.**

- `S₃`, `c = c_{⟨(1 2)⟩}`, `a = (1 2 3)`: `c * δ_a` has kernel `a ⟨(1 2)⟩ a⁻¹ = ⟨(2 3)⟩`.
- `a = 1`: `δ_1 = 1` and the kernel is unchanged.
- `N` central: `δ_a = 1` for all `a`, and all complements conjugate under `N` coincide, as they
  must since conjugation by `N` is trivial.

### Examples

The three crossed projections `S₃ → A₃`; the four crossed projections `A₄ → V₄` and their
conjugacy by `V₄` (§1.5 with `a ∈ V₄` permutes them transitively, matching the fact that the four
Sylow `3`-subgroups are conjugate under `V₄`).

### Dependencies

Layer 0; Mathlib `groupCohomology.IsMulCocycle₁`, `IsMulCoboundary₁`, `Rep.ofMulDistribMulAction`.

## Layer 2: transfer, coprime-index detection and the cohomological comparison (S2)

### 2.1 The crossed transfer

Let `N ≤ H ≤ G` with `N` abelian normal in `G`, let `c : H → N` be a normalized crossed map and
`t : G ⧸ H → G` a transversal (`[H.FiniteIndex]` is `Subgroup.finiteIndex_of_finite`). Define the
crossed transfer `T_t c : G → N` as `TauCeti.ContCohomology.cochainsCor1 G (Additive N) H t ht`
applied to `c` read in the additive module of §1.1, written back multiplicatively:

    T_t c g = ∏ u : G ⧸ H, t u • c (lWord H t u g)

Prove from `cochainsCor1_isCocycle₁` that `T_t c` is a crossed map for `conjugationAction N`,
and from `cochainsCor1_changeTransversal` that for a second transversal `t'`,
`T_{t'} c = T_t c * δ_a` with `a = ∏ v, t v • c (transversalDiff H t t' v)`, where
`transversalDiff H t t' v = (t v)⁻¹ * t' v`. The kernels of `T_t c` and `T_{t'} c` are not in
general conjugate by `a`: §1.5 is a statement about normalized crossed maps, and `T_t c` takes
the value `n ^ [G : H]` on `n ∈ N` (§2.2); the conjugacy of the complements obtained from `t`
and `t'` is proved after normalization, in §2.3. Prove that when the action
of `G` on `N` is trivial and `c` is a homomorphism, `T_t c` is Mathlib's `MonoidHom.transfer c`
(`TauCeti.transfer_eq_prod_lWord`). *Needs:* §1.1, §1.5, Tau Ceti `cochainsCor1`,
`cochainsCor1_apply`, `cochainsCor1_isCocycle₁`, `cochainsCor1_changeTransversal`,
`transfer_eq_prod_lWord`.

- `T_t` is multiplicative in `c` (it is an additive homomorphism on cochains).
- `cochainsCor1_res`: for a crossed map `c : G → N` restricted to `H`,
  `T_t (c|_H) = c^{[G:H]} * δ_a` with `a = ∏ u, c (t u)`.

**Checks.**

- `H = G`, `t` the section `1 ↦ 1`: `lWord G t 1 g = g` and `T_t c = c`.
- `G = S₃`, `H = N = A₃`, `c = id` (crossed because `A₃` acts trivially on itself), `t` the
  transversal `1 ↦ 1`, `(1 2) A₃ ↦ (1 2)`, `n = (1 2 3)`, `s = (1 2)`: the words `lWord A₃ t u s`
  are `s * t (s⁻¹ • 1) = s * s = 1` and `s⁻¹ * s * t 1 = 1`, so `T_t c s = 1`; the words for `n`
  are `n` and `s⁻¹ * n * s = (1 3 2)`, whose translates `1 • n` and `s • (1 3 2)` are both `n`, so
  `T_t c n = n² = (1 3 2)`, as §2.2 predicts. Then `T_t c (s * n) = (s • n²) * 1 = n`, and
  `ker (T_t c) = ⟨s⟩`, a complement. A definition without the factor `t u •` would send every
  element of `S₃` to `1` (for `n` the untwisted product is `n * (s⁻¹ * n * s) = n * n² = 1`, for
  `s * n` it is `n² * n = 1`, for `s` it is `1 * 1`), so its kernel `S₃` is not a complement.
- Change of transversal, same `G`, `H`, `c`, `t`, and `t'` with `t' (s̄) = s * n = (2 3)`: the
  words for `s` are `s * t' (s̄) = n` and `(s * n)⁻¹ * s = n²`, with translates `n` and
  `(s * n) • n² = n`, so `T_{t'} c s = n² ≠ 1`, while `T_{t'} c (s * n) = 1`:
  `ker (T_{t'} c) = ⟨(2 3)⟩`. The change-of-transversal element is
  `a = t (s̄) • c (s⁻¹ * (s * n)) = s • n = n² = (1 3 2)`, and `a ⟨(1 2)⟩ a⁻¹ = ⟨(1 3)⟩`, which
  is not `ker (T_{t'} c)`: §1.5 does not apply to the unnormalized transfers. The normalized
  statement of §2.3 holds with `e = 2`: `a ^ 2 = n` and `n ⟨(1 2)⟩ n⁻¹ = ⟨(2 3)⟩`.
- `N` trivial action, `c` a homomorphism `H → N`: `T_t c` is the transfer, independent of `t`
  (`cochainsCor1_changeTransversal` with `δ_a = 1`).

### 2.2 The value of the crossed transfer on `N`

Prove that for `n ∈ N`, `lWord H t u n = (t u)⁻¹ * n * t u` (because `n⁻¹ • u = u`: for
`u = mk g`, `g⁻¹ * n⁻¹ * g ∈ N ≤ H` by normality of `N` in `G`), hence
`t u • c (lWord H t u n) = t u • ((t u)⁻¹ * n * t u) = n` by normalization, and so
`T_t c n = n ^ [G : H]`. This is a new lemma: Tau Ceti's `lWord_of_mem_of_normal` assumes `H`
itself normal. *Needs:* §2.1, Tau Ceti `lWord_def`, Mathlib `Subgroup.Normal.conj_mem`.

**Checks.**

- `S₃`, `H = A₃`, `n = (1 2 3)`: `T_t c n = n² = (1 3 2)`.
- `H = G`: `T_t c n = n`.
- With `H` not containing `N`, the statement is false as stated (`lWord` need not stay in the
  conjugates of `n`); the hypothesis `N ≤ H` is forced by the local-complement convention.

### 2.3 Normalization by an inverse exponent

Prove that pointwise powers of crossed maps are crossed (`(c ^ e) (g * h) = ((g • c h) * c g) ^ e
= (g • (c h) ^ e) * (c g) ^ e`, using that `N` is abelian), and that when
`Nat.Coprime [G : H] |N|` there is `e : ℕ` with `e * [G : H] ≡ 1 (mod |N|)` (`ZMod.unitOfCoprime`
or Bézout), so that `(T_t c) ^ e` is a normalized crossed map `G → N`: its value on `n ∈ N` is
`n ^ (e * [G : H]) = n` by `pow_card_eq_one'`. Prove that for two transversals `t`, `t'` and `a`
the element of §2.1, `(T_{t'} c) ^ e = (T_t c) ^ e * δ_{a ^ e}` (pointwise powers of `δ_a` are
`δ_{a ^ e}` because `N` is abelian), so that §1.5, now applied to normalized maps, gives
`ker ((T_{t'} c) ^ e) = a ^ e (ker ((T_t c) ^ e)) a ^ (−e)`: the complements that §2.4 produces
from two transversals are conjugate under `N`. Since `e` is prime to `|N|`, `x ^ e = 1` iff
`x = 1` for `x ∈ N`, so `ker ((T_t c) ^ e) = ker (T_t c)` and the kernels of the transfers
themselves are conjugate by `a ^ e`, although not by `a` in general (§2.1, change-of-transversal
Check). *Needs:* §1.5, §2.1, §2.2, Mathlib `ZMod.unitOfCoprime`, `pow_card_eq_one'`.

**Checks.**

- `[G : H] = 1`: `e = 1`.
- `S₃`, `H = A₃`, `c = id`, `e = 2`: the transfers for `t` and `t'` of §2.1 have kernels
  `⟨(1 2)⟩` and `⟨(2 3)⟩`, and `a ^ 2 = (1 2 3)` conjugates the first to the second; `a` itself
  conjugates it to `⟨(1 3)⟩`, so an argument that skipped the normalization would assert a false
  conjugacy.
- `C₄ ≤ C₄ × C₃`, `N = C₂`, `H = C₄`, `[G : H] = 3`, `|N| = 2`: `e = 1` works since `3 ≡ 1 (mod 2)`;
  §2.4 does not apply because `N` has no local complement in `H`.
- `[G : H] = 2`, `|N| = 3`: `e = 2`; `|N| = 2`: no `e`, and §2.4 fails (`C₄` over `C₂` with
  `H = C₂`).

### 2.4 Gaschütz's splitting theorem

Export `exists_isComplement'_of_coprime_index`: for `N` abelian normal in the finite group `G`,
`H` a subgroup, `K` a local complement of `N` in `H`, and `Nat.Coprime H.index (Nat.card N)`,
there is a global complement `D` of `N` in `G` (gaschutz1952, Satz 1, p. 99, second sentence;
sambale2023, Theorem 1). The route: `c_K` (§1.2), `T_t c_K` (§2.1), its normalization
`(T_t c_K) ^ e` (§2.3), and the kernel of the latter (§1.3 with `H = ⊤`). No solvability,
centrality of `N` or coprimality of `|N|` with `[G : N]` is assumed. Record that the theorem is
false for non-abelian `N`: in the central product `SL(2, 3) ∗ C₄` of order `48`, `N = Q₈` has a
complement in its Sylow `2`-subgroup `Q₈ ∗ C₄` of index `3` but none in the whole group
(sambale2023, Section 1). *Needs:* §1.2, §1.3, §2.1, §2.3.

**Checks.**

- `N = ⊥`: the hypothesis `Nat.Coprime H.index 1` holds and `D = ⊤`.
- `H = ⊤`: the conclusion restates the hypothesis through §0.1.
- `S₃`, `N = A₃`, `H = ⊤`, `K = ⟨(1 2)⟩`: `D = ⟨(1 2)⟩`.
- Negative control, index hypothesis needed: `C₄`, `N = C₂`, `H = C₂`, `K = ⊥`: index `2` is not
  coprime to `|N| = 2` and `C₂` has no complement in `C₄`.
- Negative control, local complement needed: `C₄ × C₃`, `N = C₂`, `H = C₄` of index `3` coprime
  to `2`, but `N` has no local complement in `H`, and none in `G` either (a complement of `C₂` in
  `C₄ × C₃` would have order `6` and meet `C₄` in a complement of `C₂` in `C₄`).
- Negative control, commutativity needed: `SL(2, 3) ∗ C₄` over `Q₈` as above.

### 2.5 The quotient action and the class of the quotient extension

Define `quotientConjugationAction N : MulDistribMulAction (G ⧸ N) N` as the evaluation action
pulled back along `QuotientGroup.lift N MulAut.conjNormal`, which descends because `N` acts
trivially on itself by conjugation (`N` abelian). Prove `quotientExtension_inducesAction`:
`TauCeti.GroupExtension.InducesAction (quotientExtension N)` for this action, that is,
`(quotientExtension N).conjAct g n = mk g • n`. For a normalized section `σ` of the quotient
extension (`σ 1 = 1`), the pinned `TauCeti.GroupExtension.factorSet σ hσ hact` is a factor set
with class `cohomologyClass ∈ H²(G ⧸ N, N)`, independent of `σ` by
`TauCeti.GroupExtension.cohomologyClass_factorSet_eq`; call it the class of the quotient
extension. This is the one place where `G : Type` is required. *Needs:* §1.1, §0.2, Mathlib
`QuotientGroup.lift`, Tau Ceti `InducesAction`, `factorSet`, `cohomologyClass_factorSet_eq`.

- `mk g • n = g • n` for every representative `g`; in particular `mk n • m = m` for `n, m ∈ N`.
- `quotientExtension_inducesAction` is proved, not admitted: it reduces through
  `inducesAction_iff_conjActOfSection_eq` to `conjAct (σ x) m = x • m`, which is
  `inl_conjAct_comm` after rewriting `x = rightHom (σ x)`.

**Checks.**

- `S₃`, `N = A₃`: `G ⧸ N ≅ C₂` acts on `A₃` by inversion; the quotient action of the non-trivial
  coset sends `(1 2 3)` to `(1 3 2)` whatever representative is used.
- `N` central: the quotient action is trivial, and the factor set of a section is the usual
  central `2`-cocycle.
- `C₄` over `C₂`: `G ⧸ N = C₂` acts trivially (`C₄` is abelian); the factor set of the normalized
  section `0 ↦ 0, 1 ↦ 1` has `α (1, 1) = 2 ∈ ZMod 4`, the generator of `N`, and its class is
  non-zero, consistent with the absence of a complement.
- A wrong action using `g⁻¹` in place of `g` would still descend to `G ⧸ N` but would fail
  `quotientExtension_inducesAction` in `A₄` over `V₄` (the witness of the conventions).

### 2.6 The cohomological comparison

Export `exists_complement_iff_cohomologyClass_eq_zero`: for any group `G : Type`, `N` abelian
normal and `σ` a normalized section of `quotientExtension N`, `N` has a global complement iff
the class of `factorSet σ hσ (quotientExtension_inducesAction N)` is zero; no finiteness of `G`
is assumed, none of the inputs below has one. Route: by §0.2 a
complement is a splitting of `quotientExtension N`; by `factorSetToGroupExtensionEquiv` that
extension is equivalent to `α.groupExtension` for `α = factorSet σ …`, and splittings transport
along `GroupExtension.Equiv` (§0.2); by `nonempty_splitting_iff_cohomologyClass_eq_zero`,
`α.groupExtension` splits iff `α.cohomologyClass = 0`. This extends the pinned criterion for
`α.groupExtension` to the quotient extension of an actual subgroup. *Needs:* §0.2, §2.5, Tau Ceti
`factorSetToGroupExtensionEquiv`, `nonempty_splitting_iff_cohomologyClass_eq_zero`.

**Checks.**

- `S₃` over `A₃`: a complement exists and the class is zero; the normalized section
  `1 ↦ 1, (1 2) A₃ ↦ (1 2)` is itself a splitting, with factor set `1`.
- `C₄` over `C₂`: the class is non-zero (§2.5) and no complement exists.
- `N = ⊥`: the class lives in `H²(G, 1) = 0` and `D = ⊤`.
- Both directions with the same action: `D₈` over its cyclic `C₄` splits (a reflection generates
  a complement) and `Q₈` over its `C₄` does not (`−1` is the only involution of `Q₈` and lies in
  `C₄`); in both, `G ⧸ N = C₂` acts on `C₄` by inversion, and the two classes are the two elements
  of `H²(C₂, C₄) ≅ ℤ/2` for that action (`C₄^{C₂}/(1 + τ)C₄ = {0, 2}/0`), zero for `D₈` and
  non-zero for `Q₈`. Here `|N| = 4` and `[G : N] = 2` are not coprime, so the separation is not
  forced by order considerations. `A₄` over `V₄` does not test the action: `gcd(3, 4) = 1` gives
  `H²(C₃, V₄) = 0` for every action, so a comparison that used the trivial action would still
  report class zero, which happens to be correct.

### 2.7 The restriction formula and the cohomological proof

For `N ≤ H ≤ G`, identify `H ⧸ (N.subgroupOf H)` with the image `H.map (mk' N) ≤ G ⧸ N`
(`QuotientGroup.quotientMapSubgroupOfOfLe` is injective here because `ker (mk' N) = N ≤ H`), and
identify `N.subgroupOf H` with `N`; prove that the quotient action of `H ⧸ (N.subgroupOf H)` on
`N.subgroupOf H` corresponds to the restriction of `quotientConjugationAction N` along the
inclusion of `H.map (mk' N)`. Prove the restriction formula for the extension class: the
restriction `groupCohomology.map (H.map (mk' N)).subtype (𝟙 _) 2` of the class of the quotient
extension of `G` is the class of the quotient extension of `↥H` by `N.subgroupOf H`, transported
along these identifications. Deduce a second proof of §2.4: if `N` has a local complement in `H`,
that restricted class is zero (§2.6 for `↥H`), so `[G ⧸ N : H.map (mk' N)] • x = 0` by
`index_nsmul_eq_zero_of_map_eq_zero`, and `[G ⧸ N : H.map (mk' N)] = [G : H]` by
`Subgroup.index_map_eq` (`mk' N` is surjective with kernel `N ≤ H`); also `|N| • x = 0` by
`nsmul_cohomologyClass_eq_zero_iff`, since `α ^ |N| = 1` pointwise by `pow_card_eq_one'`; Bézout
gives `x = 0`, and §2.6 gives the complement. The Sylow case is
`eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` applied to `P.map (mk' N)`, a Sylow
`p`-subgroup of `G ⧸ N` whose preimage in `G` is `P ⊇ N`. *Needs:* §2.5, §2.6, Mathlib
`QuotientGroup.quotientMapSubgroupOfOfLe`, `Subgroup.index_map_eq`, Tau Ceti
`index_nsmul_eq_zero_of_map_eq_zero`, `nsmul_cohomologyClass_eq_zero_iff`,
`eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`.

**Checks.**

- `H = G`: the restriction is the identity and the formula is trivial.
- `S₃`, `N = A₃`, `H = A₃`: `H.map (mk' N) = ⊥`, the restricted class lives in `H²(1, A₃) = 0`,
  and `[G ⧸ N : ⊥] = 2 = [S₃ : A₃]`; `2 • x = 0` and `3 • x = 0` give `x = 0`.
- `C₄`, `N = C₂`, `H = C₂`: `[G : H] = 2 = |N|`, Bézout fails, and indeed `x ≠ 0`.
- `A₄`, `N = V₄`, `H = V₄`: `H.map (mk' N) = ⊥`, so `3 • x = 0`; with `4 • x = 0` this gives
  `x = 0`, the cohomological form of the Sylow detection (`P = V₄` here).

### Examples

`S₃` over `A₃` (crossed transfer from `A₃`, inverse exponent `e = 2`), `C₄ × C₃` over `C₂` (index
coprime but no local complement), `SL(2, 3) ∗ C₄` over `Q₈` (non-abelian failure).

### Dependencies

Layers 0–1; Tau Ceti `cochainsCor1` and its four formulas, `lWord`, `transfer_eq_prod_lWord`,
`factorSet`, `factorSetToGroupExtensionEquiv`, `cohomologyClass_factorSet_eq`,
`nonempty_splitting_iff_cohomologyClass_eq_zero`, `nsmul_cohomologyClass_eq_zero_iff`,
`index_nsmul_eq_zero_of_map_eq_zero`, `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`;
Mathlib `ZMod.unitOfCoprime`, `pow_card_eq_one'`, `Subgroup.index_map_eq`,
`QuotientGroup.quotientMapSubgroupOfOfLe`.

## Layer 3: Sylow detection and invariant complements (S3)

### 3.1 Sylow detection

Export `exists_isComplement'_iff_sylow`: for `N` an abelian normal `p`-subgroup
(`IsPGroup p N`) of the finite group `G` and `P : Sylow p G`, `N` has a global complement iff it
has a local complement in `P` (gaschutz1952, 2. Reduktionssatz, p. 100, second sentence;
sambale2023, Section 1, the Sylow consequence of Theorem 1). Forward: `N ≤ P` by
`IsPGroup.le_sylow_of_normal`, and for a global complement `D`, `D ⊓ P` is a local complement in
`P` (§0.1). Backward: `[G : P]` is prime to `p` (`Sylow.not_dvd_index`), hence to `|N| = p ^ j`,
and §2.4 applies with `H = P`. State also the form inside `↥P`: a global complement of
`N.subgroupOf P` in `↥P` (§0.1 transport). *Needs:* §0.1, §2.4, Mathlib
`IsPGroup.le_sylow_of_normal`, `Sylow.not_dvd_index`, `IsPGroup.exists_card_eq`.

**Checks.**

- `A₄`, `N = V₄`, `p = 2`, `P = V₄`: the right side holds with `K = ⊥`, the left with
  `D = ⟨(1 2 3)⟩`.
- `SL(2, 3)`, `N = {±1}`, `p = 2`, `P = Q₈`: both sides fail (every order-`4` subgroup of `Q₈`
  contains `−1`; a complement in `SL(2, 3)` would have order `12`, and `SL(2, 3)` has no subgroup
  of order `12`).
- `S₃`, `N = A₃`, `p = 3`, `P = A₃`: `K = ⊥` on the right, `D = ⟨(1 2)⟩` on the left.
- `N = ⊥`: `D = ⊤` and `K = P`.
- Dropping `IsPGroup p N`: `C₆ = C₂ × C₃` with `N = C₆`, `p = 2`, `P = C₂`: `N ⊔ K = P` is
  impossible since `N ≰ P`, so the right side is empty while `D = ⊥` is a complement; the
  `p`-group hypothesis is what makes `N ≤ P`.

### 3.2 Invariant complements, external form

Export `exists_invariant_complement`: let a finite `q`-group `A` act on a finite group `W` by
automorphisms (`[MulDistribMulAction A W]`), let `N` be an abelian normal `p`-subgroup of `W`
with `p ≠ q`, stable under `A` (`a • n ∈ N`), and let `N` have a local complement in a Sylow
`p`-subgroup `P` of `W`; then `N` has an `A`-stable global complement `D` in `W`. No coprimality
of `|A|` and `|W|` is assumed. Route, in the semidirect product `W ⋊ A` for the given action: `|W ⋊ A| = |W| * |A|`
(`SemidirectProduct.card`), so the `p`-part of `|W ⋊ A|` is that of `|W|` and `inl P` is a Sylow
`p`-subgroup of `W ⋊ A`; `inl N` is normal in `W ⋊ A` (normal in `inl W` and `A`-stable) and
abelian, with local complement `inl K` in `inl P`; §3.1 gives a global complement `D₀` of `inl N`
in `W ⋊ A`. Its index is `|N| = p ^ j`, so a Sylow `q`-subgroup `Q` of `D₀` is a Sylow
`q`-subgroup of `W ⋊ A` (`Sylow.card_eq_multiplicity`); `inr A` is a `q`-subgroup, so it lies in
some Sylow `q`-subgroup, conjugate to `Q` by some `x` (`MulAction.exists_smul_eq`), and
`D₁ = x D₀ x⁻¹` is a complement of `inl N` containing `inr A`. Put `D = (D₁ ⊓ inl W).comap inl`
viewed in `W`: `N ⊓ D = ⊥` from `inl N ⊓ D₁ = ⊥`; `N ⊔ D = W` because `inl w = n * d` forces
`d = n⁻¹ * inl w ∈ D₁ ⊓ inl W`; and `inl (a • d) = inr a * inl d * (inr a)⁻¹ ∈ D₁` since
`inr a ∈ D₁`. *Needs:* §0.1, §3.1, Mathlib `SemidirectProduct`, `SemidirectProduct.card`,
`Sylow.card_eq_multiplicity`, `IsPGroup.exists_le_sylow`, `MulAction.exists_smul_eq`.

**Checks.**

- `A` trivial: the statement is the backward direction of §3.1.
- Negative control, `p ≠ q` needed: `W = V₄ = ⟨x, y⟩`, `N = ⟨x⟩`, `p = q = 2`, `A = C₂` acting by
  `x ↦ x`, `y ↦ x * y`; `P = W`, `K = ⟨y⟩` is a local complement; the complements of `N` are
  `⟨y⟩` and `⟨x * y⟩`, swapped by `A`, so no `A`-stable complement exists.
- No coprimality of `|A|` and `|W|`: `W = S₃`, `N = A₃`, `p = 3`, `A = C₂` acting by conjugation
  by `(1 2)` (`q = 2` divides `|W| = 6`); `P = A₃`, `K = ⊥`; `D = ⟨(1 2)⟩` is `A`-stable.
- `W = A₄`, `N = V₄`, `p = 2`, `A = C₃` acting by conjugation by `(1 2 3)`; `P = V₄`, `K = ⊥`; the
  `A`-stable complement is `⟨(1 2 3)⟩` itself, and the other three Sylow `3`-subgroups are not
  `A`-stable.
- Dropping `A`-stability of `N`: with `W = V₄ × C₃`, `N = ⟨x⟩ × 1`, `p = 2`, `q = 3` and
  `A = C₃` acting on `V₄` by the order-`3` automorphism `x ↦ y ↦ x * y ↦ x` and trivially on
  `C₃`, every other hypothesis holds (`P = V₄ × 1`, `K = ⟨y⟩ × 1`) but the conclusion is false:
  the complements of `N` are `⟨y⟩ × C₃` and `⟨x * y⟩ × C₃`, and `A` moves `⟨y⟩` to `⟨x * y⟩`
  and `⟨x * y⟩` to `⟨x⟩`, so neither is `A`-stable. The hypothesis is what makes `inl N` normal
  in `W ⋊ A`.

### 3.3 Invariant complements, internal form

In a finite group `G`, let `W` and `A` be subgroups with `A ≤ W.normalizer`, `A` a `q`-group, and
`N ≤ W` an abelian `p`-subgroup with `p ≠ q`, normalized by `W` and by `A`; suppose `N` has a
local complement in a subgroup `P ≤ W` with `P.subgroupOf W` a Sylow `p`-subgroup of `↥W`.
Prove that there is `D ≤ W` with `N ⊓ D = ⊥`, `N ⊔ D = W` and `a * d * a⁻¹ ∈ D` for all `a ∈ A`,
`d ∈ D`. Route: apply §3.2 to `↥W` with `A` acting through
`Subgroup.normalizerMonoidHom` composed with the inclusion `A → W.normalizer`
(so `a • w = a * w * a⁻¹`), to `N.subgroupOf W` and `P.subgroupOf W`, and transport the result
back by §0.1. *Needs:* §0.1, §3.2, Mathlib `Subgroup.normalizerMonoidHom`, `Subgroup.subgroupOf`.

**Checks.**

- `G = S₄`, `W = A₄`, `N = V₄`, `A = ⟨(1 2 3)⟩`, `p = 2`, `q = 3`, `P = V₄`: `D = ⟨(1 2 3)⟩`.
- `G = S₄`, `W = A₄`, `N = V₄`, `A = ⟨(1 2)⟩`: `q = 2 = p` and the theorem does not apply; here
  the conclusion happens to hold (`(1 2) * (1 2 3) * (1 2) = (1 3 2)`, so `⟨(1 2 3)⟩` is
  `A`-stable), and the genuine failure for `p = q` is the `V₄` instance of §3.2.
- `A = ⊥`: §3.1 inside `↥W`.
- `W = G`: `A ≤ G.normalizer = ⊤` is automatic and the internal form is §3.2 for the conjugation
  action of `A` on `G`.

### Examples

`S₄` with `W = A₄`, `N = V₄`, `A = ⟨(1 2 3)⟩`; `S₃` with `A = ⟨(1 2)⟩` acting on `W = S₃`;
`V₄` under `C₂` as the `p = q` failure; `SL(2, 3)` over its centre with `A` trivial as a
non-split instance.

### Dependencies

Layers 0–2; Mathlib `Sylow`, `SemidirectProduct`, `Subgroup.normalizerMonoidHom`.

## Downstream consumers

The Gaschütz criterion (§2.4), its Sylow form (§3.1) and the invariant-complement theorem (§3.2,
§3.3) are the complement-existence inputs of local finite group theory beyond the
Schur–Zassenhaus range, where `|N|` and `[G : N]` need not be coprime; the crossed-projection
dictionary (§1.3) and the transport of splittings (§0.2) are reusable for any extension with
abelian kernel.

## References

- W. Gaschütz, *Zur Erweiterungstheorie der endlichen Gruppen*, J. reine angew. Math. 190
  (1952), 93–107 (`gaschutz1952`; Satz 1 on p. 99 is §2.4, the 2. Reduktionssatz on p. 100 is
  §3.1).
- B. Sambale, *On the converse of Gaschütz' complement theorem*, arXiv:2303.00254
  (`sambale2023`; Theorem 1 is the modern statement of §2.4, Section 1 gives the Sylow form and
  Baer's non-abelian counterexample `SL(2, 3) ∗ C₄`).
- Prior formalisations, consulted as proof sources and not as specifications: Axiom's
  [coprime-index complement lifting](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/GroupTheory/AbelianNormalCoprimeComplementLifting.lean#L145)
  and [Sylow and invariant complement applications](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/SignalizerFunctorTheorem/McBride/Prelim/Gaschutz.lean).
