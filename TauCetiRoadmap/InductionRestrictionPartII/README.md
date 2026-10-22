# Roadmap: fixed fibers, parity obstructions and finite reduced-multiplier calculations (induction, restriction, and Mackey theory for finite groups, part II)

**Summary.** This roadmap counts fixed points of unit powers in marked central extensions of
finite groups, expresses the answer through square classes and two-adic thresholds, and proves
structural reduced-multiplier formulas for marked groups. Its main theorem gives every compatible
fiber either zero fixed points or exactly the torsion count `|A[q−1]|`. The surviving degree
parities form an affine kernel coset over `𝔽₂`; ranks, threshold histograms and weight enumerators
then make the count explicit. A homological toolkit proves the full five-term exact sequence,
positive-degree finiteness and a Hall-coinvariant comparison. The final layer relates
centralizer-generated relation subgroups to reduced multipliers and
proves an exterior-square formula for odd abelian bases. It records all thirty-one values in
Wood's Table 2 as explicit input data for fixed-fiber applications; nineteen abelian entries
are also worked Checks of that formula.

The end results are the fixed-fiber count, `two_adic_survival`, the affine-coset description of
surviving parities and `rank_parity_count` in Layer RS.4, and the reduced-multiplier formula,
`antidiagonal_multiplier` and the conditional finite-model applications in Layer RS.6.
Layers RS.0, RS.1 and RS.3 supply
the homological comparisons, local normalization and degree restrictions they need. The
suggested home is `TauCeti/GroupTheory/ReducedSchur/`, with the general homological comparisons
beside `TauCeti/RepresentationTheory/Homological/GroupHomology/`.

## Scope and ownership

This roadmap owns the full low-degree homology exactness theorem for a central extension,
finiteness and order-annihilation in every positive homological degree, and the isomorphism from
a normal Hall subgroup's multiplier coinvariants to the corresponding primary part of the
ambient multiplier. It adds the power law for commuting-pair classes, local normalization within
one inertia class, and the image equality for reduced-cover homology. It owns the restriction of
the unit action to an automorphism of the central kernel, its finite-level bound, bounded degree
slices, fixed degree lattices and degree orbit sets. It then owns the fixed-fiber, parity and
finite-model comparison theorems described above.

The following objects and results are supplied elsewhere and enter only as prerequisites:

- **InverseGaloisAndArithmeticFundamentalGroups, IG.3.4–IG.3.5** supplies oriented commuting-pair
  classes and the class map of a central extension, universal coefficients, reduced Schur
  multipliers and covers, conjugacy-equivariant markings, the universal marked extension and its
  fiber-product model, the class degree map, compatible covers of coprime semidirect products,
  unit-power corrections and their set action, and cyclotomic twists. Its IG.4 supplies coprime
  complement conjugacy. The exact contracts below fix the interfaces consumed here; none of
  these constructions is a target of this roadmap.
- **RepresentationTheory/InductionRestriction, Layer 7** supplies representation groups of finite
  groups and projective-representation theory. IG.3.4 supplies the oriented comparison between
  the kernel of a Schur cover and `H₂(G, ℤ)`. Induction and Mackey theory themselves are not used.
- **Mathlib** supplies integral group-homology carriers, chain differentials, abelianization,
  semidirect products and finite linear algebra. **Tau Ceti** supplies elementary-2 quotients,
  factor-set conventions, homological transfer and nonempty homomorphism-fiber cardinalities.
- **ProfiniteArithmetic, Layer 0** supplies the profinite-integer ring and its units. The action
  used here is the finite-level action supplied by IG.3.5; there is no second profinite carrier.
- **AlgebraicTopology, Stage 2, relative singular chains and homology** supplies singular
  homology of spaces. The group-homology comparisons
  here concern the algebraic bar complex rather than a second singular-homology development.
- **AlgebraicCodingTheory, Layer 3 (Completed/AlgebraicCodingTheory)**, and the pinned Tau Ceti module
  `TauCeti/InformationTheory/Coding/Weight/Enumerator.lean` supply weight distributions and
  polynomials for arbitrary finite sets of words, including affine binary cosets. Use
  `Set.weightPolynomial : Set (Fin N → ZMod 2) → Polynomial ℤ`,
  `Set.coeff_weightPolynomial` and `Set.eval_one_weightPolynomial`; their coefficient and
  cardinality formulas are prerequisites. RS.4.18 adds the translation by a coordinate lower
  bound and the generating series for integer degrees satisfying that bound.

## Conventions

- `A` *central extension* is Mathlib's `GroupExtension A E G` (fields `inl`, `rightHom`, exactness
  `range_inl_eq_ker_rightHom`) together with the hypothesis `S.inl.range ≤ Subgroup.center E`. It is
  *stem* if moreover `S.inl.range ≤ commutator E`. Finiteness is assumed exactly where stated.
- `M(G) = H₂(G, ℤ)` is the carrier `groupHomology.H2 (Rep.trivial ℤ G ℤ)`, written additively.
  `Multiplier G` in Lean is only an abbreviation for this carrier; its cyclic-order-three
  Check is `M(C₃)=0`. `TauCeti.schurMultiplier k G` is the different group `H²(G, kˣ)`.
- Commutators are `XYX⁻¹Y⁻¹`. The *oriented commuting-pair class* of commuting `x, y` is
  `⟨x,y⟩`, the class of the integral 2-cycle `[x|y] − [y|x]`; reversing the pair negates it. Mathlib's differentials
  with trivial coefficients are `d[g|h] = [h] − [gh] + [g]` and
  `d[g|h|k] = [h|k] − [gh|k] + [g|hk] − [g|h]`.
- The factor set of a normalized section `σ` of an extension satisfies `inl(φ(g,h)) = σ(g)σ(h)σ(gh)⁻¹`
  (Tau Ceti's convention). The class map `τ_S` evaluates `φ` on integral cycles and sends `⟨x, y⟩` to the
  commutator of lifts of `x` and `y`.
- `c ⊆ G` is conjugacy-invariant. Generation of `G` by `c` is assumed for the universal marked extension
  and everything built on it; closure under invertible powers is assumed for the power action; in
  Layer RS.4 and the parity statements every element of `c` has order two.
- `D = c/G` is the set of conjugacy classes contained in `c` (the subtype of `ConjClasses G` of
  classes meeting `c`), and `L = D →₀ ℤ` is the integer lattice of class degrees, with basis
  vectors `e_d`. The map `δ : L → Additive Gᵃᵇ` satisfies `δ(e_[x]) = [x]`. Degrees are integers; inverse generators have negative
  degree.
- The reduced multiplier `M(G,c) = M(G)/Q_c` is canonical. A reduced cover `S_c = S/τ_S(Q_c)`
  depends on the chosen Schur cover `S`; different choices need not give isomorphic groups
  (`D₈` and `Q₈` over `C₂ × C₂`).
- The units of the prime-to-p profinite integers act on a finite group by `g ↦ g^α`, through any
  common exponent. On a nonabelian group this is a permutation of the underlying set, not a
  homomorphism. On the class lattice the action permutes coordinates, `m^α(d^α) = m(d)`; it never
  multiplies a degree by `α`.
- In Layer RS.4, `A = M(G,c)` is the kernel of the reduced cover, `B = A/A²` is
  `TauCeti.ElementaryTwoQuotient` of `Multiplicative A`, and `v₂` is the 2-adic valuation.
- Explicit finite groups are given by their multiplication and their marked embedding; an abstract
  group name or a SmallGroups number names an example but does not replace these data.

## Exact supplier contracts

### From Mathlib (pinned 6b7abb3)

- `GroupExtension`, `GroupExtension.Section`, `GroupExtension.Splitting`
  (`Mathlib/GroupTheory/GroupExtension/Defs.lean`): an injective `inl`, a surjective `rightHom` and
  exactness; centrality is not part of the structure and is always a separate hypothesis.
- `Rep.trivial`, `groupHomology.cycles₂`, `groupHomology.boundaries₂`, `groupHomology.H2`,
  `groupHomology.H2π`, `groupHomology.H2π_eq_iff`, `groupHomology.d₂₁_single`,
  `groupHomology.d₃₂_single`
  (`Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean`): the integral 2-cycles
  as a submodule of `G × G →₀ ℤ`, their quotient `H₂` and its kernel. `groupHomology.map` and
  `groupHomology.map_comp` (`.../GroupHomology/Functoriality.lean`) give functoriality along a group
  homomorphism together with a compatible coefficient map; with trivial integral coefficients the
  identity serves.
- `groupHomology.H1AddEquivOfIsTrivial` and `groupHomology.H1AddEquivOfIsTrivial_single`:
  `H₁(G, A) ≃+ Gᵃᵇ ⊗ A` for trivial `A`, sending the class of `single g a` to `[g] ⊗ a`;
  `groupHomology.d₁₀_eq_zero_of_isTrivial`, `groupHomology.cycles₁IsoOfIsTrivial`,
  `groupHomology.isZero_groupHomology_succ_of_subsingleton`, `groupHomology.H0IsoOfIsTrivial`,
  `Rep.FiniteCyclicGroup.groupHomologyIsoEven` and `Rep.FiniteCyclicGroup.groupHomologyIsoOdd`.
- `groupCohomology.cocycles₂`, `groupCohomology.H2`, `groupCohomology.H2π`,
  `groupCohomology.H2π_eq_iff`, `groupCohomology.map`
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/`).
- `Abelianization`, `Abelianization.of`, `Abelianization.lift`, `Abelianization.map`, `commutator`,
  `ConjClasses`, `IsConj`, `Subgroup.centralizer`, `Subgroup.center`, `QuotientGroup`,
  `MonoidHom.eqLocus`, `SemidirectProduct` (with `inl`, `inr`, `rightHom`,
  `toGroupExtension`), `MulEquiv.prodComm`, `alternatingGroup`, `DihedralGroup`,
  `Matrix.SpecialLinearGroup`, `Matrix.GeneralLinearGroup`.
- `Finsupp.domCongr`, `Finsupp.liftAddHom`, `MulActionHom` (`T →[B] X`), `AddTorsor`/
  `MulAction.IsPretransitive`, `MulAction.orbitRel`.
- `powMonoidHom`, `MonoidHom.fiberEquivKer`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
  `AddCommGroup.primaryComponent`, `Representation.Coinvariants`, `LinearMap.finrank_range_add_finrank_ker`,
  `Module.card_eq_pow_finrank`.

### From Tau Ceti (pinned a91d3aa)

- `TauCeti.ElementaryTwoQuotient G` for a commutative group `G`, the `ZMod 2`-module
  `ModN (Additive G) 2`, and `TauCeti.elementaryTwoQuotientMk`,
  `TauCeti.elementaryTwoQuotientMk_mul`, `TauCeti.elementaryTwoQuotientMk_eq_iff`,
  `TauCeti.elementaryTwoQuotientMk_eq_zero_iff`, `TauCeti.elementaryTwoQuotientMap`
  (`TauCeti/Algebra/Group/ElementaryTwoQuotient/Basic.lean`). Multiplicative squares map to zero;
  two elements have the same image exactly when their quotient is a square.
- `TauCeti.GroupExtension.factorSet` and `TauCeti.GroupExtension.inl_factorSet`
  (`TauCeti/GroupTheory/GroupExtension/FactorSetOfSection.lean`) fix the convention
  `inl(φ(g,h)) = σ(g)σ(h)σ(gh)⁻¹`. They require a normalized section, an abelian kernel and
  `TauCeti.GroupExtension.InducesAction S`; for a central extension take the trivial kernel action and prove that
  compatibility from centrality. The supplied class map uses this sign.
- `TauCeti.FactorSet.characterTransgression` and
  `TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator`
  (`TauCeti/GroupTheory/GroupExtension/Character.lean`) send a kernel character `χ` to the
  cohomology class of `χ ∘ φ`, and prove this map injective when the kernel lies in the
  commutator subgroup and the coefficient action is trivial. They require neither finiteness
  nor divisibility. The finite Schur-cover comparison below uses coefficients `ℂˣ`.
- `TauCeti.groupHomology.transfer` and
  `TauCeti.groupHomology.transfer_comp_map_subtype_id`
  (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`) supply transfer
  `Hₙ(G,M) → Hₙ(H,Res M)` for a finite-index subgroup `H`, in every degree, and
  `transfer M H n ≫ groupHomology.map H.subtype (𝟙 (Rep.res H.subtype M)) n = [G:H] • 𝟙`.
  Thus corestriction after transfer is multiplication by the index. RS.0.3 adds the opposite-composite
  norm formula for a normal subgroup, with the hypotheses stated there.
- `Set.weightPolynomial`, `Set.coeff_weightPolynomial` and `Set.eval_one_weightPolynomial`
  (`TauCeti/InformationTheory/Coding/Weight/Enumerator.lean`) apply to arbitrary finite sets of
  words, including affine cosets. For `C : Set (Fin N → ZMod 2)`, the polynomial lies in
  `Polynomial ℤ`, its coefficient at `w` is the number of words of Hamming weight `w`, and
  evaluation at `1` is `Nat.card C`. No linear-subspace hypothesis is required.
- `MonoidHom.subtypeFiberEquivKer`, `MonoidHom.card_fiber_eq_card_ker` and
  `MonoidHom.finite_fiber` (`TauCeti/GroupTheory/Coset/Fiber.lean`) identify the actual subtype
  `{x // f x = b}` with the kernel after a point of that fiber is given, count its elements, and
  prove finiteness from finiteness of the kernel. The coordinate equation in RS.4 uses these
  directly; it does not introduce a second power-fiber equivalence or counting theorem.
- `TauCeti.schurMultiplier` and `TauCeti.schurMultiplier_def`
  (`TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean`) identify the
  cohomological multiplier with `groupCohomology.H2 (Rep.ofMulDistribMulAction G kˣ)` for a
  commutative semiring `k`, with trivial action. This fixes the distinction from the integral
  homological multiplier `M(G)` used here.

### From roadmaps on main

- **RepresentationTheory/InductionRestriction, Layer 7, projective representations, factor sets,
  and the Schur multiplier:** representation groups of finite groups, namely central stem
  extensions with kernel the integral multiplier. Only this cover input is used; induction and
  character formulas are not needed.
- **ProfiniteArithmetic, Layer 0, the ring structure on the profinite integers:** the ring on
  `Additive TauCeti.zHat` and its units, with reductions to finite residue rings. IG.3.5 supplies their
  prime-to-characteristic unit-power action; RS.3.2 proves its finite-level bound.
- **[AlgebraicCodingTheory, Layer 3, weight enumerators and MacWilliams](../../Completed/AlgebraicCodingTheory/README.md#layer-3-weight-enumerators-and-macwilliams):** weight distributions
  of finite word sets and their polynomial interpretation. The exact APIs used are the pinned
  Tau Ceti declarations above.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

Use Layer IG.3.4, **Reduced Schur covers and the universal marked extension**, and Layer IG.3.5,
**The action of units and the cyclotomic twist**, and IG.5.6, **General rational-class
fixed-fiber formula**. The cover and action contracts are stated in
[InverseGaloisAndArithmeticFundamentalGroups, IG.3.4–IG.3.5](../InverseGaloisAndArithmeticFundamentalGroups/README.md#ig34-reduced-schur-covers-and-the-universal-marked-extension).

- IG.3.4 **Commutators of lifts and the class map of a central extension** supplies
  `ReducedSchur.commutingCycle`, `ReducedSchur.homologicalCommutator` and
  `ReducedSchur.liftCommutator`. The cycle is `[x|y]−[y|x]` for `xy=yx`; its class is `⟨x,y⟩`.
  For a central extension `1→A→E→G→1`, its natural additive class map `τ_E:M(G)→Additive A`
  sends this class to `XYX⁻¹Y⁻¹` for any lifts. The universal-coefficient evaluation
  `H²(G,A)→Hom(M(G),A)` has kernel `Ext(Gᵃᵇ,A)` and is onto for trivial abelian `A`. These inputs supply the sign and naturality
  needed in RS.0 and RS.1. The class map is defined by evaluating the section cocycle on cycles;
  its construction and universal coefficients precede the full exactness theorem in RS.0.1.
- IG.3.4 **The reduced Schur multiplier** and **Reduced Schur covers** supply
  `ReducedSchur.schurRelations`, `ReducedSchur.reducedMultiplier` and `ReducedSchur.ReducedCover`.
  For conjugacy-invariant `c`, `Q_c` is generated by `⟨x,y⟩` with `x∈c`, `y∈C_G(x)` and
  `M(G,c)=M(G)/Q_c`. For a chosen finite Schur cover with oriented class isomorphism
  `τ_S:M(G)≃ker π`, the quotient `S_c=S/τ_S(Q_c)` has central kernel `M(G,c)`, is stem, and
  lifts commuting pairs with first entry in `c` to commuting pairs. IG supplies the zero composite
  `H₂(S_c,ℤ)→M(G)→M(G,c)`; RS.1 asks for the stronger image equality. No generation hypothesis
  on `c` is used for these objects.
- IG.3.4 **Conjugacy classes lift bijectively** supplies `ReducedSchur.classCompatibleMarking`.
  Every individual conjugacy class above a class in `c` maps bijectively to it. Choosing one lift
  `X_d` of one representative in each class gives an equivariant marking `x↦x̂`; representative
  lifts remain choices. This is the input to local normalization and the lift-square columns.
- IG.3.4 **Marked central extensions**, **The universal marked extension**, **The class degree map**,
  **The marked fibre product and the computation of `U(G,c)**` and **The kernel of the universal
  marked extension** supply `ReducedSchur.MarkedExtension`, `ReducedSchur.universalMarked`,
  `ReducedSchur.classSet`, `ReducedSchur.classDegree`, `ReducedSchur.degree`,
  `ReducedSchur.markedFiberProduct`, `ReducedSchur.universalEquivFiberProduct` and
  `ReducedSchur.universalKernel`. For finite `G` generated by conjugacy-invariant `c`,
  `D=c/G`, `L=D→₀ℤ`, `δ(e_[x])=[x]`, and the marked isomorphism is
  `U(G,c)≅P={(h,m)∈S_c×L:[π_c(h)]=δ(m)}`, carrying `[x]` to `(x̂,e_[x])`.
  The central kernel is `K≅M(G,c)×ker δ`; its torsion is `M(G,c)`. Integer degrees, negative
  degrees included, are essential. No comparison with this presentation is assumed without
  generation.
- IG.3.4 **Coprime semidirect products and admissible inertia** supplies
  `ReducedSchur.compatibleCovers`, `ReducedSchur.multiplier_kernel_primary`,
  `ReducedSchur.admissibleInertiaClasses` and `ReducedSchur.reduced_kernel_primary`. For finite
  `H,Γ` of coprime orders, the projection `M(H⋊Γ)→M(Γ)` is onto and has precisely the
  `|H|`-primary kernel; the complementary primary part maps isomorphically to `M(Γ)`. With
  admissibility (generation of `H` by `h⁻¹γ(h)`), the nonidentity equal-order inertia classes
  generate `H⋊Γ`; their conjugacy classes project bijectively to the nonidentity conjugacy
  classes of `Γ`. The compatible covers and degree maps descend to reduced covers and multipliers. The Hall-coinvariant isomorphism in RS.0 is
  the additional comparison, not a second construction of these compatible covers.
- IG.3.5 **Powers by units and the permutation of class degrees**, **Central power corrections**
  and **The discrete action of units** supply `ReducedSchur.unitPow`,
  `ReducedSchur.degreePermutation`, `ReducedSchur.powerCorrection` and `ReducedSchur.unitAction`.
  For characteristic exponent `p=1` or a prime coprime to `|G|`, and
  `α∈Ẑ^{(p′)×}`, set `z_d(α)=X_d^{−α}(x_d^α)^` and
  `W_α(m)=∏_d z_d(α)^{m_d}`. For conjugacy-invariant generating `c` stable under invertible powers,
  `α·(h,m)=(h^αW_α(m),m^α)` on `P`, where `m^α` permutes coordinates. The cocycle law is
  `W_{αβ}(m)=W_β(m)^α W_α(m^β)`. The action is by permutations in general, and compatible changes
  of model intertwine it. RS.3 asks for its multiplicativity only on `K` and its finite-level bound.
- IG.3.5 **The cyclotomic twist of a set** supplies `ReducedSchur.cyclotomicTwist`:
  `X⟨−1⟩=Map_B(T,X)` for a nonempty `B`-torsor `T` and a `B`-set `X`. Evaluation at a torsor
  point is a bijection; changing that point acts by the corresponding unit. A central character
  `χ:Γ→B` acts on the evaluated twist by `χ⁻¹`. In the finite-field application arithmetic
  Frobenius therefore acts by `q⁻¹`, geometric Frobenius by `q`; their fixed sets coincide.

- [IG.5.6, **General rational-class fixed-fiber formula**](../InverseGaloisAndArithmeticFundamentalGroups/README.md#ig56-components-and-their-invariants)
  supplies the identity-signature
  power-image criterion and the count zero or `|A[q−1]|` for rational class unions. RS.4
  expresses this obstruction through involution squares and extends the formula to signatures
  in `c`.

The homological inputs have two branches. RS.0.1 uses only IG.3.4's section-cocycle class map
and universal coefficients to prove full five-term exactness and
`extensionClassMap_surjective_of_stem` for arbitrary central stem extensions. The finite
oriented Schur-cover comparison belongs to IG.3.4 and follows independently from its universal
coefficients and the pinned character transgression: for a finite central stem extension
`1→A→S→G→1`, the map on `ℂˣ`-valued kernel characters is injective and, under universal
coefficients, sends `χ` to `χ ∘ τ_S`. Here `Ext(Gᵃᵇ,ℂˣ)=0` since `ℂˣ` is divisible. Characters
separate the finite quotient `A/im τ_S`, so injectivity forces `τ_S` onto; the Schur-cover
hypothesis `|A|=|M(G)|` makes it an isomorphism. The character separation is Mathlib's
`CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`
(`Mathlib/GroupTheory/FiniteAbelian/Duality.lean`), and `Additive ℂˣ` is an injective coefficient
group by `AddCommGrpCat.injective_of_divisible` (`Mathlib/Algebra/Category/Grp/Injective.lean`).
Thus the IG.3.4 cover comparison has no prerequisite in RS.0.1; the reduced-cover homology
applications in RS.1 use both branches. The finite comparison is the one of Wood (2021),
§2.1, p. 2; full exactness retains the generality and source of RS.0.1.

The finite-group universal-coefficient, cover and power interfaces above are used with their
stated hypotheses. The original sources are Wood (2021), §2.1–Theorem 2.5, pp. 2–4, and §4,
equations (2) and (4), pp. 6–8; Wood (2019), §2.3, p. 387, Definition 3.1, p. 388, and
Lemmas 3.3–3.4, p. 390; and Liu–Wood–Zureick-Brown, §12 and Lemma 12.10, published pp. 104–105
and 110–112. They are supplier contracts, not extra targets here.

## How to read the build

Layer RS.0 proves the complete central-extension exact sequence and the Hall-coinvariant
comparison. Layer RS.1 applies the supplied oriented cycles and covers to a power law, local
normalization and an exact homology image. Layer RS.3 studies the supplied unit action on its
central kernel and degree lattice. Layer RS.4 solves the fiber equation and translates it into
binary linear algebra. Layer RS.6 relates centralizer relations to reduced kernels, proves an
exterior-square formula
for odd abelian bases, and applies the fixed-fiber theorems to finite marked models under explicit
multiplier hypotheses. Each layer ends with examples and dependencies.

The headline statements in `Suggested.lean` are:

| Lean theorem | Roadmap statement on pinned carriers |
| --- | --- |
| `integralHomology_finite` | RS.0.2: finiteness of integral homology in every positive degree. |
| `integralHomology_card_smul` | RS.0.2: the group order annihilates integral homology in every positive degree. |
| `multiplier_hallPart` | RS.0.3: inclusion identifies Hall-subgroup multiplier coinvariants with the ambient Hall-primary part. |
| `two_adic_survival` | RS.4.10: the finite abelian power equation is solvable exactly at the obstruction threshold. |
| `parity_degree_generatingSeries` | RS.4.18: the translated weight polynomial counts integer degrees with a coordinate lower bound. |
| `odd_index_two_reduction` | RS.6.1: the full multiplier is the odd-order subgroup's conjugation coinvariants, and has odd order. |
| `multiplier_prod_abelian` | RS.6.8: the degree-two Künneth comparison, including the oriented tensor summand. |
| `abelian_multiplier_exteriorSquare` | RS.6.8: the exterior square identifies with the finite abelian multiplier through oriented cycles. |
| `antidiagonal_multiplier` | RS.6.8: the ordinary integral multiplier of the anti-diagonal model identifies with that of its base. |

The file defines `Multiplier`, `torsionImageFiltration`, `obstructionThreshold`, `C₂`,
`swapAction`, `SwapWreath`, `abelianizedSum` and `sumKernelModel` to state these results on
native homology, square-quotient and semidirect-product carriers. The full five-term sequence
and reduced-cover homology image require the supplied section-cocycle class map and reduced
cover. The kernel-action, marked fixed-fiber and surviving-parity theorems require the supplied
marked extension, class degree map and unit action. The reduced-multiplier comparison requires
the supplied relation subgroup and quotient. These objects are absent at the pins; their
mathematical targets are specified in the layers below.

## Layer RS.0: Exactness and Hall-coinvariant homology comparisons

The additional homological targets are the full five-term sequence, positive-degree finiteness
beyond the supplied degree-two statement, and the Hall-coinvariant isomorphism.

### RS.0.1 The five-term exact sequence of a central extension

Prove `extensionClassMap_exact`: for a central extension `S : GroupExtension A E G` (no finiteness
assumed) the sequence

```text
M(E) --π_*--> M(G) --τ_S--> Additive A --(inl)ᵃᵇ--> Additive Eᵃᵇ --(π)ᵃᵇ--> Additive Gᵃᵇ --> 0
```

is exact, where `π_* = groupHomology.map S.rightHom` on trivial integral coefficients,
`(inl)ᵃᵇ = (Abelianization.of.comp S.inl).toAdditive` and
`(π)ᵃᵇ = (Abelianization.map S.rightHom).toAdditive`. The four exactness statements are separate
theorems:

- `extensionClassMap_exact_left`: `range π_* = ker τ_S`;
- `extensionClassMap_exact_mid`: `range τ_S = ker (inl)ᵃᵇ`, the kernel elements that become trivial
  in `Eᵃᵇ`;
- `abelianization_exact_of_extension`: `range (inl)ᵃᵇ = ker (π)ᵃᵇ`;
- `abelianization_map_surjective`: `(π)ᵃᵇ` is onto.

The last two hold for arbitrary group extensions when written multiplicatively.
Centrality makes `A` abelian and is used for the first two.

Two corollaries for **stem** extensions (`S.inl.range ≤ commutator E`):

- `extensionClassMap_surjective_of_stem`: `τ_S` is onto;
- `abelianization_map_bijective_of_stem`: `(π)ᵃᵇ` is an isomorphism `Eᵃᵇ ≃ Gᵃᵇ`.

*Proof sketch.* Build the low-degree resolution argument for this theorem; neither a spectral-sequence
API nor Hopf’s formula is assumed to be in the library. Mathematically, the Hochschild–Serre
spectral sequence of the extension with trivial integral
coefficients has `E²_(p,q) = H_p(G, H_q(A, ℤ))`; centrality makes the action of `G` on `H_q(A, ℤ)`
trivial and `H₁(A, ℤ) = A`. Its low-degree terms give the five-term sequence, with the differential
`d² : E²_(2,0) = M(G) → E²_(0,1) = A` as the middle map. Identify that differential with `τ_S` by
computing it on the section cocycle (both are the transgression of the factor set); this fixes the
sign as in the supplied commuting-pair formula. The tail `A → Eᵃᵇ → Gᵃᵇ → 0` is the elementary statement
that `Eᵃᵇ/(image of A) = (E/A)ᵃᵇ`. A route avoiding spectral sequences applies Hopf's formula to a
free presentation `F → E` and its composite with `E → G`: with `R ⊆ T ⊆ F` the kernels,
`M(G) = (T ∩ [F,F])/[F,T]`, `M(E) = (R ∩ [F,F])/[F,R]`, `A = T/R`, and the map `M(G) → A` is induced
by the inclusion `T ∩ [F,F] ⊆ T`; its kernel is `((R ∩ [F,F])[F,T])/[F,T]` because `[F,T] ⊆ R` by
centrality. The only IG.3.4 inputs here are the section-cocycle class map and universal
coefficients; neither the oriented Schur-cover comparison nor the reduced covers enter this
argument. The stem-surjectivity corollary applies to arbitrary central stem extensions,
including infinite ones. *Needs:* IG.3.4 (class map and universal coefficients); Mathlib `groupHomology.map`, `Abelianization`, `Abelianization.map`,
`commutator`.

*Source.* Löh, *Group Cohomology*, Theorem 3.2.12 (Hochschild–Serre spectral sequence), p. 123,
Proposition 3.2.13, p. 124, and Remark 3.2.14 (naturality), p. 125; the low-degree argument is the
one of the proof of Theorem 3.2.18 (Hopf's formula), pp. 129–131; Hopf's formula itself is Theorem
1.5.1, p. 30, and `H₁` is the abelianization by Theorem 1.4.1, p. 20. The identification of the
middle map with the commutator class is Wood (2021), §2.1, p. 2.

**Checks.**

- `extensionFiveTerm_test_1` (split central): for `A × G → G`, `(inl)ᵃᵇ` is injective and `(π)ᵃᵇ` is
  onto, including for infinite `A`.
- `extensionFiveTerm_test_2` (abelian total group): for `C₂ → C₄ → C₂`, `(inl)ᵃᵇ` is injective and
  `ker (π)ᵃᵇ` has order two; `τ = 0` does not force a splitting.
- `extensionFiveTerm_test_3` (stem): for `C₂ → D₈ → C₂ × C₂`, `(inl)ᵃᵇ = 0`, `τ` is onto and `(π)ᵃᵇ`
  is bijective. A statement claiming injectivity of `(inl)ᵃᵇ` in general fails here.
- extensionFiveTerm_test_4 (centrality needed for the middle terms): for `C₃ → C₃ ⋊ C₂ → C₂` with
  inversion (the symmetric group `S₃`), the kernel is not central, `(inl)ᵃᵇ = 0` because
  `[t, a] = a⁻² = a` generates `C₃`, and `(π)ᵃᵇ` is bijective; the tail exactness holds without
  centrality, and no class map is defined.

### RS.0.2 Finite integral homology

The abbreviation `Multiplier` uses the native degree-two homology carrier with its existing
operations. Its Checks are `M(1)=0`, `M(C₃)=0`, and `M(C₂²)≅C₂`. The first two agree with
Mathlib's trivial- and finite-cyclic-group homology; the last follows from the exterior-square
comparison of RS.6.8 and rejects an identically trivial multiplier.

Prove, for a finite group `G` and `n ≥ 1`, on the carrier `groupHomology (Rep.trivial ℤ G ℤ) n`:

- `integralHomology_finite`: the group is finite;
- `integralHomology_card_smul`: `Nat.card G • z = 0` for every element `z`.

This extends the degree-two finiteness supplied by IG.3.4 to every positive degree. Degree zero is excluded: `H₀(G, ℤ) = ℤ`.

*Proof sketch.* Annihilation: apply corestriction after transfer to the trivial subgroup; the
composite is multiplication by `[G : 1] = |G|` and factors through the homology of the trivial
group, which vanishes in positive degrees
(`groupHomology.isZero_groupHomology_succ_of_subsingleton`). Tau Ceti supplies the
transfer and this composite as `TauCeti.groupHomology.transfer` and
`TauCeti.groupHomology.transfer_comp_map_subtype_id`
(`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`). Finiteness: the chain module `(Fin n → G) →₀ ℤ` is finite free, so its homology is a finitely
generated abelian group, and a finitely generated abelian group of finite exponent is finite.
*Needs:* Mathlib `groupHomology`, `groupHomology.isZero_groupHomology_succ_of_subsingleton`,
`groupHomology.inhomogeneousChains`.

*Source.* Löh, *Group Cohomology*, Theorem 1.7.15 (transfer), p. 64, and its application to the
trivial subgroup in the proof of Corollary 1.7.16, pp. 64–65.

**Checks.**

- integralHomology_test_1 (degenerate): the trivial group has zero homology in every positive
  degree.
- integralHomology_test_2 (cyclic): `H_(2k+1)(C₂, ℤ) ≅ C₂` and `H_(2k+2)(C₂, ℤ) = 0` for `k ≥ 0`
  (Mathlib's `Rep.FiniteCyclicGroup.groupHomologyIsoOdd`, `groupHomologyIsoEven`); this rejects a
  degree shift and a claim that all positive-degree homology of a finite group vanishes.
- integralHomology_test_3 (degree zero excluded): `H₀(C₂, ℤ) ≅ ℤ` is infinite and `2 • [1] ≠ 0`
  there (`groupHomology.H0IsoOfIsTrivial`).

### RS.0.3 Hall coinvariants of the multiplier

Let `H` be a normal subgroup of a finite group `G` with `gcd(|H|, [G : H]) = 1` (a normal Hall
subgroup). For a set of primes `ϖ`, write `M(G)_ϖ` for the `ϖ`-primary part of the finite abelian
group `M(G)`, and `M(H)_G` for the coinvariants of the conjugation action of `G` on `M(H)`
(`Representation.Coinvariants`; inner automorphisms of `G` act trivially on `M(G)` and conjugation
by `H` acts trivially on `M(H)`, so the action factors through `G/H`).

Write `ϖ` for the primes dividing `|H|`. Prove `multiplier_hallPart`: corestriction (`groupHomology.map H.subtype`) induces an isomorphism
  `M(H)_G ≃+ M(G)_ϖ`.
For a split extension `G=H⋊Γ`, compose this isomorphism with the primary/complement
comparison supplied by IG.3.4 to obtain `M(H⋊Γ)≅M(H)_Γ⊕M(Γ)`, with the inclusion and projection
as the displayed maps. The new target is the identification of the Hall part with coinvariants.

The native signature takes a representation `ρ` on `Multiplier H` whose value at each `g∈G`
is the homology map induced by `MulAut.conjNormal g`. It identifies its coinvariants with the
range of inclusion-induced homology and sends each coinvariant class to that inclusion image.
This range consists exactly of elements killed by some power of `|H|`, specifying the Hall
primary part without a separate carrier.

*Proof sketch.* `M(G)` is finite of exponent dividing `|G|` (RS.0.2), so it splits into its primary
parts (Mathlib's finite abelian primary decomposition). Write `m = [G : H]`. Corestriction after
transfer is `m` (pinned Tau Ceti `transfer_comp_map_subtype_id`); transfer after corestriction on
`M(H)` is the norm `Σ_(gH ∈ G/H) (c_g)_*` (the chain-level formula for the transfer, Löh §1.7.3, pp.
63–64, with `H` normal), which induces multiplication by `m` on the coinvariants. As `m` is
invertible on the `ϖ`-groups `M(H)_G` and `M(G)_ϖ`, corestriction is injective on `M(H)_G` and onto
`M(G)_ϖ`. The Hochschild–Serre spectral sequence gives the same result: for coprime
orders every `E²_(p,q)` with `p, q > 0` vanishes, and the possible differential `d³` from a
subquotient of `H₃(Γ, ℤ)` (killed by `|Γ|`) into `M(H)_Γ` (killed by `|H|`) is zero. *Needs:*
RS.0.2; Mathlib `groupHomology.map`, `groupHomology.map_comp`, `Representation.Coinvariants`,
`SemidirectProduct`, `AddCommGroup.equiv_directSum_zmod_of_finite`; pinned Tau Ceti
`TauCeti.groupHomology.transfer`, `TauCeti.groupHomology.transfer_comp_map_subtype_id`.

*Source.* Löh, *Group Cohomology*, Theorem 1.7.15, p. 64, and the chain-level description of the
transfer, pp. 63–64; for the spectral-sequence route, Theorem 3.2.12, p. 123, and Proposition
3.2.13, p. 124. The use in the source papers is Liu–Wood–Zureick-Brown, Lemma 12.10 and its proof
(published version pp. 110–111), and Ellenberg–Venkatesh–Westerland, Example 9.3.2 (arXiv v1, p. 57).

**Checks.**

- multiplier_hallPart_test_1 (trivial complement): for `Γ = 1` the inclusion `H → H ⋊ 1` induces a
  bijection on multipliers; the map, not only the orders, is tested.
- multiplier_hallPart_test_2 (action on the multiplier): `H = C₃ × C₃` with `Γ = C₂` acting by
  inversion. Then `M(H) ≅ Λ²H ≅ C₃` and inversion acts on `Λ²H` by `(−1)² = 1`, so the coinvariants
  are `C₃` and `M(H ⋊ C₂) ≅ C₃`. Replacing the induced action on `M(H)` by inversion would wrongly
  give `0`.
- multiplier_hallPart_test_3 (coprimality needed): with trivial action on `C₂ × C₂`, both factor
  multipliers vanish but `M(C₂ × C₂) ≅ C₂`; the inclusion of the first factor is not onto the kernel
  of the projection to the second, so the statement fails without coprime orders.

### Examples

For `C₂→C₄→C₂`, the class map is zero while the extension does not split; for
`C₂→D₈→C₂²`, it is onto and the inclusion of the kernel dies on abelianization. For
`(C₃²)⋊C₂` with inversion, the Hall-coinvariant comparison gives multiplier `C₃`, because
inversion on the second exterior power is the identity.

### Dependencies

IG.3.4's class map, universal coefficients and primary/complement comparison; pinned Tau Ceti
homological transfer; Mathlib integral group homology, abelianization and finite abelian groups.

## Layer RS.1: Power laws, local normalization and the reduced-cover homology image

These targets use the supplied oriented classes and chosen reduced covers. The power law works
for arbitrary groups; local normalization uses one conjugacy class; the image theorem concerns
a reduced cover of a finite Schur cover.

### RS.1.1 Commuting-pair classes respect orders

Prove `commutator_order`: For commuting x,y, the homological commutator is additive in each
commuting cyclic variable: `⟨x^n,y⟩=n⟨x,y⟩` for every natural number `n`. In particular if `x` is an
involution then `2⟨x,y⟩=0`.

*Proof sketch.* Work directly in Mathlib's integral inhomogeneous bar chains. Write
`z(a,y)=[a|y]−[y|a]` and put

`T(a,b;y)=[a|b|y]−[a|y|b]+[y|a|b]`.

If a and `b` each commute with `y`, expand the existing differential `groupHomology.d₃₂_single`. Its
four terms on [a|b|y] are `[b|y]−[ab|y]+[a|by]−[a|b]`. Combining the three differentials and
cancelling `by=yb` and `ay=ya` gives

`d₃T(a,b;y)=z(a,y)+z(b,y)−z(ab,y)`.

The assumptions concern only commuting with `y`; the calculation does not require a and `b` to commute
with each other. Taking `a=b=1` gives `d₃T(1,1;y)=z(1,y)`, so the unit cycle is a boundary even in the
unnormalized chain model. For `n≥0` define the finite chain

`Bₙ(x,y)=Σ_(0≤k<n) T(xᵏ,x;y)−T(1,1;y)`.

Each xᵏ commutes with `y`. The consecutive product terms telescope, yielding

`d₃Bₙ(x,y)=n z(x,y)−z(xⁿ,y)`.

By `groupHomology.boundaries₂`, this difference lies in the image of the native differential. Apply
`groupHomology.H2π_eq_iff` to the two cycles, using linearity of `H2π`, to obtain the stated power
law. If `x²=1`, specialize to `n=2` and use the unit-cycle boundary. Swapping the variables and negating
`z` gives the power law in the second variable. This proof uses no finiteness hypothesis, chosen
cover, universal coefficient sequence or calculation of the homology of a torus.

*Needs:* IG.3.4 (homological commutators and their oriented cycle formula); Mathlib's
`groupHomology.d₃₂_single`, `groupHomology.boundaries₂` and `groupHomology.H2π_eq_iff` in
`RepresentationTheory/Homological/GroupHomology/LowDegree.lean`. The same file's
`groupHomology.d₂₁_single` verifies that `z(x,y)` is a cycle when `xy=yx`. Subtraction, finite sums and
the cycle quotient use the existing `ℤ`-linear APIs.

*Source.* Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021),
author copy, §2.1, author PDF p.2, fixes the oriented cycle representing `⟨x,y⟩`. The boundary
calculation above is a direct deduction from that cycle and Mathlib's stated differential, rather
than an additional result attributed to Wood.

**Checks.**

- At `n=0, B₀=−T(1,1;y)` has boundary `−z(1,y)`, so the formula includes the unit case. At `n=1` the
  displayed boundary is zero. At `n=2` with `x²=1` it shows that `2⟨x,y⟩` vanishes; `⟨x,y⟩` itself can
  remain nonzero. Reversing the ordered pair changes the sign of its cycle. No class is asserted for
  a pair that fails the commuting hypothesis.

### RS.1.2 Local class normalization

**`localClassNormalization`.** Assume `c` is one conjugacy class, choose `c₀∈c`, and let `E=S_c`. For `e`
with `π_c(e)∈c∪{1}`, define `z(e)` to be the unique element in its conjugacy class mapping to `c₀` if
`π_c(e)∈c`, and `e` itself if `π_c(e)=1`.

*Construction.* Apply the individual-class bijection; no arithmetic lift or global product is
constructed here.

Normalization projects to `c₀` or 1 according to the branch. It lies in the conjugacy class
of `e` and is invariant under conjugating `e`; it fixes every element over `{1,c₀}`.
For `a∈kerπ_c` and allowed `e`, it satisfies `z(ae)=a·z(e)`, since central multiplication
transports the unique conjugate over `c₀`.

The characterizing existence and uniqueness hold for any extension whose projection is
injective on the conjugacy class of the given element `e`, assuming its image is conjugate to
`c₀`. The supplied reduced cover satisfies this class-injectivity hypothesis over `c`.

*Needs:* IG.3.4 (conjugacy-class bijection).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1 p.388 and Lemmas 3.3–3.4
p.390 (PDF pp.12,14).

**Checks.**

- `localClassNormalization_test_1` (degenerate): For a kernel element `a, z(a)=a`.
- `localClassNormalization_test_2` (computation): For `S₃` with `c` the transpositions and `c₀=(12)`,
  `z((23))=(12)` in its identity reduced cover.
- `localClassNormalization_test_3` (non-example): For several conjugacy classes `c`, one `c₀` cannot
  normalize elements from all classes: in the identity cover of the abelian group `C₃` with
  `c={1,2}` in additive residues, the conjugacy class of 2 has no point above `c₀=1`. The single-class
  hypothesis is essential.

### RS.1.3 Local normalized factors commute

Prove `local_factors_commute`: Any two elements of a central extension mapping to `{1,c₀}` commute. In
particular all `z(e)` in the preceding single-class construction commute.

*Proof sketch.* Kernel factors are central; two elements above `c₀` differ by a central kernel factor.

*Needs:* RS.1.2; `GroupExtension` (Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1 p.388 and Lemmas 3.3–3.4
p.390 (PDF pp.12,14).

**Checks.**

- In `D₈ → C₂²`, two lifts of the same element commute (they differ by a central factor), while lifts
  of the two basis elements do not; the hypothesis that both factors lie over `{1,c₀}` cannot be
  weakened to lying over `c`.

### RS.1.4 Reduced-cover homology image

Prove `homology_image`: for the reduced cover `π_c:S_c→G` of a Schur cover,
`im(H₂(S_c,ℤ) → M(G)) = Q_c`. In particular the composite `H₂(S_c,ℤ) → M(G) → M(G,c)` is zero.

*Proof sketch.* The quotient `S → S_c` is a map of central extensions over the identity of `G` whose
kernel map is the quotient `ker π → ker π_c`, so by naturality of the supplied class map (IG.3.4) the class map of `S_c` is the
quotient `M(G) → M(G,c)` read through `τ_c`. Exactness at `M(G)` of the five-term sequence (RS.0.1)
identifies the image of `H₂(S_c,ℤ)` with its kernel `Q_c`. Functoriality alone gives only the inclusion
of the image in `Q_c`.

*Needs:* IG.3.4 (reduced cover); IG.3.4 (class map and universal coefficients); RS.0.1 (`extensionClassMap_exact_left`); `groupHomology.map` (Mathlib).

*Source.* Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the
Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, §7.3, paragraph after
the definition, arXiv v1 PDF p.34.

**Checks.**

- For `G = C₂ × C₂` and `c = ∅` (`S_c = D₈` or `Q₈`) the image of `H₂(S_c, ℤ)` in `M(G) ≅ C₂` is `Q_∅ = 0`; for `c`
  the three nonidentity elements, `S_c = G` and the image is all of `M(G) = Q_c`. A claim that the
  image is always zero fails the second case, and the supplied zero composite does not decide it.

### Examples

The formula `⟨x²,y⟩=2⟨x,y⟩` makes every relation from an involution two-torsion. In the identity
reduced cover of `S₃`, local normalization sends `(23)` to the chosen `(12)`. For `C₂²` the
homology image is zero when `c=∅` and all of `M(C₂²)` when `c` is the three nonidentity elements.

### Dependencies

IG.3.4's oriented commuting-pair classes, class map, reduced cover and conjugacy-class bijection;
RS.0's exactness theorem; Mathlib's explicit bar differential.

## Layer RS.3: Kernel automorphisms and degree restrictions

Throughout this layer `G` is finite and `c` is conjugacy-invariant, generating and stable under
invertible powers, with the class degree lattice and marked model from IG.3.4–IG.3.5.

### RS.3.1 The restricted kernel action is multiplicative

Prove `kernel_action_aut`: Each unit acts by a group automorphism on `K(G,c)`. In cover coordinates `h`
lies in the commutative central `A`, so `α·(hh′,m+m′)=α·(h,m)α·(h′,m′)`. This statement does not extend
to all `U`.

*Proof sketch.* Use centrality of h,h′, the homomorphism law for `W_α` and additivity of the degree
permutation. The inverse unit supplies the inverse homomorphism.

*Needs:* IG.3.5 (unit action and twist); IG.3.4 (marked extension and degree).

*Source.* Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified
extensions* (2024), §12, published version pp. 104–105; arXiv v2 pp. 47–48.

**Checks.**

- For `G = S₃` with `c` the transpositions, the unit `−1` acts on `K(G,c)` by an automorphism, while on
  `U(G,c)` it is not multiplicative: inversion reverses the order of two
  noncommuting cover coordinates: the statement must be restricted to the
  kernel.

### RS.3.2 A finite level determines the discrete action

Prove `finite_level_action`: For a finite `G, α≡β` modulo `|G|²` implies `α·` and `β·` agree on every
element of `U(G,c)`. The same holds for `K` and its degree lattice.

*Proof sketch.* The exponent of `M(G)` divides |G|, so the exponent of `S_c` divides `|G|²`. Power
residues and class permutations are determined at that level; apply the coordinate formula. For a
general marked central model, assume explicitly that every element of its kernel is killed by |G|.
This gives the same exponent bound for its cover. The reduced-multiplier case uses the degree-two annihilation bound supplied by IG.3.4.

*Needs:* IG.3.5 (unit action); IG.3.4 (the multiplier is killed by the group order), which supplies the kernel exponent bound.

*Source.* Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021),
author copy, Remark 4.1, author PDF p.8.

**Checks.**

- For `G = C₃` with `c` its two nonidentity elements, any two profinite units whose residues
  modulo `9 = |G|²` are represented by 2 and 11 act identically on the infinite group `U(G,c)`; the bound concerns the finite cover coordinate and the
  class permutation, not finiteness of `U`.

### RS.3.3 Bounded total-degree slice

**`boundedDegreeSlice`.** For finite `D` and integers `n,M`, define
`L_{n,≥M} = {m∈ℤ^D : (∀ d, m(d)≥M) ∧ Σ_d m(d)=n}`. Define `K_{n,≥M}` as its degree preimage and the twisted slice as equivariant functions
valued in this invariant subset. The counting applications take `n≥0` and `M≥0`; LWZB uses `M>0`. Integer bounds are
allowed in the general lattice definition.

*Construction.* Use a subset of the integer lattice, not a subgroup; degree permutation preserves
its inequalities and sum. Restrict the action to the actual projection kernel and bundle its degree
projection as an equivariant map. The twisted slice is the inverse image of the lattice slice under
the induced map of equivariant functions. Evaluation at one torsor point detects membership because
the lattice slice is invariant.

Membership records both the coordinate lower bound and exact total sum. Every power
permutation preserves the slice, and `K_{n,≥M}⟨−1⟩` is its preimage under the twisted degree map.

*Needs:* IG.3.5 (unit action and twist); IG.3.4 (marked extension and degree).

*Source.* Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified
extensions* (2024), §12, published version pp. 104–105; arXiv v2 pp. 47–48.

**Checks.**

- boundedDegreeSlice_test_1 (degenerate): For `D` empty, the slice is singleton at `n=0` and empty at
  every `n≠0`, including `n=−1`.
- boundedDegreeSlice_test_2 (computation): For `|D|=2,n=3,M=1`, the slice consists of (1,2),(2,1).
- boundedDegreeSlice_test_3 (non-example): For nonempty `D,n=0,M=1`, the slice is empty; it is never
  declared a group containing zero.

### RS.3.4 Power-fixed degree lattice

**`powerFixedDegree`.** For `q` prime to `|G|`, define
`L_{≡q} = {m∈ℤ^D : ∀ d, m(d^q)=m(d)}`. Its `n,≥M`
slice adds the lower-bound and exact total-degree conditions.

*Construction.* Use the fixed subgroup of the permutation, and the ordinary action orbit quotient.
Rationality of `c` as a set does not imply each conjugacy class is fixed.

The lattice consists precisely of q-fixed degree vectors. Identify it with integer-valued
functions on the native orbit quotient `D/⟨q⟩`, so evaluation at the orbit of `d` gives `m(d)`.
Under this identification total degree is `Σ_O |O|m_O`, rather than the unweighted sum.

*Needs:* IG.3.5 (unit action and twist); RS.3.3.

*Source.* Liu–Wood–Zureick-Brown (2022 preprint), §12, paragraph before Proposition 12.7, arXiv v2
PDF p.50.

**Checks.**

- powerFixedDegree_test_1 (degenerate): At q≡1 modulo the exponent of `G, L_{≡q}=L`.
- powerFixedDegree_test_2 (computation): For the two nontrivial classes of `C₃` and `q=2`,
  `L_{≡q}={(a,a):a∈ℤ}`; total degree is 2a.
- powerFixedDegree_test_3 (non-example): For this `C₃` example with `M = 0`, the fixed slice of total
  degree 1 is empty (2a `= 1` has no solution), while the unconstrained slice contains (1,0) and
  (0,1).

### RS.3.5 Orbit set of class degrees

**`DegreeOrbitSet`.** Define `𝔖^{c,G}` as the orbit quotient of the integer lattice `L` under the
unit-power coordinate permutation. Its `n,≥M` subset is the image of `L_{n,≥M}`. Choice of a
roots-of-unity generator changes a degree vector within this orbit.

*Construction.* Take the existing action-orbit equivalence relation, then its quotient. Bundle the
unit-power permutations as a homomorphism into the class permutation group and act on the integer
lattice by `Finsupp.domCongr`. Evaluation of an equivariant twist at any two torsor points gives the
same orbit class.

The API:

- `degreeOrbitSet_mk`: Every degree vector has a class in `𝔖^{c,G}`.
- `degreeOrbitSet_eq`: Two orbit classes are equal iff the vectors differ by a unit-power
  permutation.
- `degreeOrbitSet_slice`: The `n,≥M` image is independent of the choice of torsor generator.

*Needs:* IG.3.5 (unit action and twist); RS.3.3.

*Source.* Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified
extensions* (2024), §12, published version pp. 104–105; arXiv v2 pp. 47–48.

**Checks.**

- `degreeOrbitSet_test_1` (degenerate): For `D` empty, the orbit set is singleton.
- `degreeOrbitSet_test_2` (computation): For `C₃` nonidentity classes, (1,4) and (4,1) have the same
  orbit class.
- `degreeOrbitSet_test_3` (non-example): For the same two-class set, (1,4) and (2,3) have different
  orbit classes despite equal total degree.

### Examples

- For `G=C₃` with `c` its two nonidentity elements, the finite-level unit `2` swaps the two
  classes, so it acts on `L=ℤ²` by `(m₁,m₂) ↦ (m₂,m₁)`. The power-fixed lattice for `q=2`
  is `{(a,a) : a∈ℤ}`, of total degree `2a`.
- For `G=S₃` with `c` the transpositions, every odd unit fixes the single class; the action on
  `U ≅ {(h,n) : sign h = (−1)ⁿ}` is `(h,n) ↦ (h^α,n)`, a permutation that is not a
  homomorphism for `α=−1`.

### Dependencies

IG.3.4–IG.3.5's marked model, unit action and twist; the supplied degree-two annihilation bound; Mathlib `ZMod`, `Finsupp.domCongr`,
`MulActionHom`, orbit relations.

## Layer RS.4: Fixed fibers, square obstructions and parity

Throughout this layer `G` is finite and generated by `c, a` conjugacy-invariant union of classes of
involutions. The reduced cover, its marking and its unit action are the supplied ones. For an odd q the fixed points of q in each fiber of `P`
over (g, m) are the solutions of a power equation in the finite abelian group `A = M(G,c)`;
solvability is governed by the square class of an explicit element `b(g,m)` and by `v₂(q − 1)`. The
second half turns the dependence on the parities of `m` into linear algebra over `F₂`. Wood’s
Proposition 4.1 and equation (6) supply the power equation and the specified even/odd parity
cases. The square-times-torsion lemma, filtration, threshold and binary linear-algebra formulas
below are algebraic consequences developed here, with their deductions given explicitly.

### RS.4.1 Lift squares are central

Prove `involution_square_central`: for any reduced cover `S_c→G` and any `x∈G` with `x²=1`, every
lift `X∈S_c` has `X²∈A=M(G,c)`, hence `X²` commutes with `S_c`. This elementary statement requires
neither `x∈c` nor generation by `c`; the later fiber theorems retain the layer's standing hypotheses.

Both kernel membership and centrality hold for any central extension and any lift `X` whose
projected square is one.

*Proof sketch.* Project `X²` to `x²=1`; apply centrality of the kernel.

*Needs:* IG.3.4 (reduced cover).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- Take `G = C₂ × C₂` and `c=∅` (so `A = M(G) ≅ C₂` and `S_c=S`). In the cover `Q₈` every lift of a
  nonidentity element squares to the central `−1`; in the cover `D₈` the lifts of the rotation class
  square to the central element and the lifts of the two reflection classes square to 1. So `X² ∈ A`
  depends on the class, and squaring is not a homomorphism `S_c → A`.

### RS.4.2 Square-class obstruction of a fiber

**`squareObstruction`.** Assume finite `G` is generated by involution classes `c_i, A=M(G,c)`, chosen
class lifts `X_i`, and `g∈c∪{1}` with lift `Y` (`Y=1` for `g=1`). For an integer degree `m` with `Σ_i`
`m_i[c_i]=[g]` in `G^ab`, define `b(g,m)=Y²∏_i(X_i²)^−m_i∈A` and `β(g,m)` as its class in
TauCeti.ElementaryTwoQuotient `A`. Lift changes multiply `b` by a square; `β` depends only on the parity
of `m`.

*Construction.* All squared factors lie in `A`. Replacing `Y` or `X_i` by central kernel factors inserts
squares. Modulo squares, exponents reduce mod 2.

The API:

- `squareObstruction_representative`: `b(g,m)=Y²∏_i(X_i²)^−m_i`.
- `squareObstruction_choice`: `β` is independent of lift choices; `b` generally is not.
- `squareObstruction_parity`: Changing each `m_i` by an even integer leaves `β` unchanged.
- `squareObstruction_compatibility`: The domain first requires `δ(m)=[g]`; incompatible fibers are
  empty before this obstruction is considered.

*Needs:* RS.4.1; IG.3.4 (marked extension and degree); `TauCeti.ElementaryTwoQuotient` (Tau Ceti);
`TauCeti.elementaryTwoQuotientMk_mul` (Tau Ceti).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- `squareObstruction_test_1` (degenerate): For `g=1` and `m=0, β=0`.
- `squareObstruction_test_2` (computation): For `g∈c_k` and `m=e_k, β=0`.
- `squareObstruction_test_3` (non-example): A degree incompatible with [g] cannot acquire a nonempty
  fiber merely because the formal square product is a square.
- At the square-quotient stage, the algebraic fixture `A=C₈` sends a generator a and `a³` to the
  same nonzero class, and sends `a²` to zero. This checks the quotient computation, without
  asserting that this fixture is realised by an admissible marked group. In the marked central
  model `C₁₄→C₂` below, `(g,m)=(g,3)` gives `b=a⁻²≠1` but `β=0`; replacing a square class by its chosen
  representative would fail this check.

### RS.4.3 The fixed-fiber power equation

Prove `fixed_fiber_equation`: For the hypotheses of square-obstruction and odd q coprime to |G|, let
`r=(q−1)/2`. Writing a fiber point as (Yh,m), the q-fixed equation is `h^{q−1}=b(g,m)^{−r}`. Since the
power subgroup is closed under inversion, solvability is equivalent to `b(g,m)^r∈A^{2r}`.

*Proof sketch.* Insert the coordinate action and `c_i` involutions in Wood equation (6); all
correction factors are powers of central `X_i²`. The fiber is the set of elements of the pullback with
projection `g` and degree `m`, not the set of formal solutions of the displayed equation. Require that
each chosen class representative represents its indexed inertia class. A q-unit is obtained from
coprimality with the chosen common exponent of the cover and base.

*Needs:* RS.4.2; IG.3.5 (unit action and twist); `powMonoidHom` (Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- For `q=3` (`r=1`) and an involution class with `X² = a`, the correction is `W_3(e_i)=X_i^{−2}=a⁻¹`, so the equation reads `h² = b⁻¹`; the sign matters for the solutions `h`, though not for
  solvability.
- In the marked central model `C₁₄→C₂`, write `X` for a generator of `C₁₄` and `a=X²` for the kernel
  generator of order seven. For `g` the nonidentity element and `m=3`, choose `Y=X`. Then `b=a⁻²`
  and `q=3` gives `h²=a²`, whose unique solution is `h=a`. Reversing the sign gives `h=a⁻¹` instead.
  Indeed `(Xa)³a⁻³=Xa`, whereas `(Xa⁻¹)³a⁻³≠Xa⁻¹`. This tests the coordinate action on a
  marked central extension; `C₁₄→C₂` is not asserted to be a reduced Schur cover.

### RS.4.4 Square-times-torsion solvability

Prove `square_torsion_solvability`: For a commutative group `A, b∈A` and `r∈ℕ, b^r∈A^{2r}` iff
`b∈A²·A[r]`. At `r=0` both sides hold for every `b`, with `A[0]=A`.

*Proof sketch.* If `b^r=h^{2r}`, then `bh⁻²∈A[r]`; the converse is obtained by raising a square times
r-torsion element to `r`.

*Needs:* `powMonoidHom` (Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- For `A=C₈,r=2` and an odd generator `b`, both conditions fail; for `r=8` both hold.
- At `r=0` every `h` solves `h⁰=b⁰`; no valuation criterion is applied to that case.

### RS.4.5 All fixed fibers and their torsion count

Prove the fixed-fiber count: For odd `q≥1` prime to |G|, the fiber over (g,m) has `|A[q−1]|` fixed points
if `δ(m)=[g]` and `b(g,m)^r∈A^{2r}`, and zero otherwise. The q and `q⁻¹` actions have the same fixed
points. No nonnegativity of `m` is needed for this group-theoretic statement.

*Proof sketch.* Apply the existing nonempty power-fiber equivalence to its kernel; a permutation and
its inverse have the same fixed set. For an arbitrary finite central marked model, retain the
finite-kernel hypothesis and count the fixed subset of the actual (g,m) fiber. Its cardinality is
zero when degree compatibility or power-image membership fails.

For any finite abelian `A`, `b∈A` and natural `r`, including zero, the solutions of
`h^{2r}=b^{−r}` number `|A[2r]|` when `b` is a square times an `r`-torsion element, and zero
otherwise.

*Needs:* RS.4.3; InverseGaloisAndArithmeticFundamentalGroups IG.5.6, **General rational-class
fixed-fiber formula**; `MonoidHom.fiberEquivKer` (Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- Take `A = C₄` (written additively), `b = 1` and `q=3` (`r=1`): `b` is not in `2A + A[1] = 2A`, so the
  fiber has no fixed point, although `|A[q−1]| = |A[2]| = 2`.
- A degree incompatible with `[g]` has an empty fixed fiber even when its square obstruction
  vanishes; compatibility is necessary for the marked-extension fiber to be nonempty.
- At `q=1` the action is the identity, so every compatible fiber has |A| fixed points and
  every incompatible fiber is empty. The positive-valuation criterion below requires `q>1`.

### RS.4.6 Odd-parity fixed-point fiber

Prove `odd_parity_fiber`: If `g∈c_k, m_k` is odd and all other `m_i` are even, then the fiber is
compatible and its fixed count is `|A[q−1]|`.

*Proof sketch.* The abelianized involution classes give compatibility. The displayed `b` is a square,
so `b^r` is a 2r-th power.

*Needs:* RS.4.5; RS.4.2.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- For `G = S₃` with `c` the transpositions, `A = 0`, so every compatible fiber has exactly one fixed point
  for every allowed q.

### RS.4.7 Even-parity fixed-point fiber

Prove `even_parity_fiber`: If `g=1` and every `m_i` is even, then the compatible fiber has exactly `|A[q−1]|`
fixed points.

*Proof sketch.* The degree maps to 1 in `G^ab` and `b` is a product of even powers.

*Needs:* RS.4.5; RS.4.2.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- The degree `m = −2e_i` is allowed: the statement is about the group `U`, and nonnegativity is imposed
  only by the counting slices of RS.3.3.

### RS.4.8 Torsion-image filtration

**`torsionImageFiltration`.** For an abelian `A` let `B=TauCeti.ElementaryTwoQuotient A`. Define
`B_t` to be the image in `B` of `A[2^t]=ker(powMonoidHom(2^t))`, regarded as a ZMod 2 subspace. `B_0=0`; the
filtration is increasing. When `A` is finite, `B_e=B` whenever `2^e` annihilates its
2-primary part: every `a` killed by some `2^k` is killed by `2^e`.

*Construction.* Restrict the square-class map to the specified torsion subgroup; its additive image
is a submodule. Finite abelian primary decomposition proves exhaustion.

The one-torsion subgroup is trivial, so `B_0=0`, and `t≤u` implies `B_t≤B_u`.
For a specified `e` annihilating the 2-primary part, `B_e=B`. For `A=C_{2^e}`,
`B_t=0` when `t<e` and `B_t=B` when `t≥e`.

*Needs:* `powMonoidHom` (Mathlib); `TauCeti.ElementaryTwoQuotient` (Tau Ceti);
`TauCeti.elementaryTwoQuotientMap` (Tau Ceti); `AddCommGroup.equiv_directSum_zmod_of_finite`
(Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- torsionImageFiltration_test_1 (degenerate): For `A` of odd order, `B_t=0=B` for every `t`.
- torsionImageFiltration_test_2 (computation): For `A=C₈`, the filtration is zero at `t=0,1,2` and all
  `C₂` at `t=3`.
- torsionImageFiltration_test_3 (non-example): In `C₈`, the nontrivial 2-torsion element is a
  square, so its image in `B_1` is zero; the quotient is not the torsion subgroup.

### RS.4.9 Two-primary obstruction threshold

**`obstructionThreshold`.** For `b∈finite` abelian `A` with 2-primary exponent `2^e` define
`t_A(b) = min {t≥0 : class(b)∈B_t}`. It lies between `0` and `e`. It depends only on the
square class, and is the maximum of the exponents `e_j` for which `b` has odd coordinate in a
cyclic factor `C_{2^{e_j}}` (empty maximum `0`).

*Construction.* Exhaustion ensures the minimum exists. Compute the torsion image separately in each
cyclic factor; the odd-primary part is uniquely 2-divisible.

The threshold is zero exactly for squares, equal square classes have equal thresholds,
and `0≤t_A(b)≤e`. A generator of `C_{2^e}` with `e>0` has threshold `e`.

*Needs:* RS.4.8; RS.4.4; `AddCommGroup.equiv_directSum_zmod_of_finite` (Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- obstructionThreshold_test_1 (degenerate): `t_A(1)=0`.
- obstructionThreshold_test_2 (computation): For `b=(generator,identity)` in `C₄ × C₈`, the
  threshold is 2; for `b=(identity,generator)` it is 3.
- obstructionThreshold_test_3 (non-example): For a generator in `C₈` the threshold is 3, not 1
  despite its nonzero image in a one-dimensional square quotient.

### RS.4.10 Two-adic criterion for fiber survival

Prove `two_adic_survival`: For odd `q>1` prime to |G| and compatible degree `m`, the fixed fiber is
nonempty iff `v₂(q−1)≥t_A(b(g,m))+1`.

*Proof sketch.* Put `r=(q−1)/2`; its odd part contributes no new square classes, so the image of A[r]
is `B_{v₂(r)}`. Combined with RS.4.3–RS.4.4 this is a statement about the finite abelian group `A`
alone: the equation `h^{q−1} = b^r` has a solution iff `v₂(q−1) ≥ t_A(b) + 1`; the Lean file states it
in this form.

*Needs:* RS.4.5; RS.4.9; RS.4.4.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- For `A = C₈` and `b a` generator, `t_A(b) = 3`, so the fixed fiber is nonempty exactly when 16 ∣ q `− 1`
  (q `= 17` is the first prime that works).
- The parities of `odd_parity_fiber` and `even_parity_fiber` have threshold 0 and survive every
  allowed odd `q>1`.
- At `q=1` every compatible fiber survives, including a nonsquare obstruction in `C₈`;
  the positive-valuation criterion's `q>1` hypothesis is essential.

### RS.4.11 Involution classes span the abelianization

Prove `involution_abelianization`: For any group `G` generated by a subset `c` with `x²=1` for `x∈c`,
every element of `G^ab` squares to 1. For `N` generating involution classes, `G^ab` is an
elementary abelian 2-group. There is a surjective `F₂-linear` map `a:F₂^N→Additive(G^ab), a(e_i)=[c_i]`.

*Proof sketch.* Every abelianized generator has order dividing 2; extend on the free `F₂`-vector space
and use generation.

Use `AddCommGroup.zmodModule` with the proved identity `2·u=0` to give the existing carrier
`Additive(G^ab)` its `F₂`-module structure. The class map on binary coordinates retains the basis values
of `δ`; this construction preserves the existing group operations.

*Needs:* IG.3.4 (marked extension and degree); `Abelianization` (Mathlib).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- For `S₃` with `c` the transpositions, `N = 1` and a : `F₂ → C₂` is the identity; for `S₆` with `c` the
  transpositions and the triple transpositions, `N = 2` and `a(e₁ + e₂) = 0`, so a is onto but not
  injective.

### RS.4.12 Lift-square class columns

Prove `lift_square_columns`: For each involution class `c_i`, the class `s_i` of `X_i²` in `B=A/A²` is
independent of both the lift and the representative in `c_i`.

For an arbitrary central extension with abelian kernel, take two lifts with conjugate images
and kernel elements mapping to their squares. Their images in `TauCeti.ElementaryTwoQuotient A`
are equal; the square-lift hypotheses already imply that the projected elements square to one.

*Proof sketch.* Lift changes insert squares of central factors; conjugation fixes the central lift
square.

*Needs:* RS.4.1; `TauCeti.elementaryTwoQuotientMk_mul` (Tau Ceti).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- Changing `X_i` to `X_i·k` with `k ∈ A` changes `X_i²` to `X_i² k²`, which has the same class in `B`; the
  column depends only on the class `c_i`.

### RS.4.13 The parity and lift-square maps

**`paritySquareMap`.** With `V=F₂^N`, the already constructed `a:V→Additive(G^ab)`, and
`B=TauCeti.ElementaryTwoQuotient A`, define `s:V→B` by the lift-square columns `s(e_i)=s_i`. Extend only
on the free vector space, not on `G` or `S_c`.

*Construction.* Specify basis values and use the free-vector-space universal property.

Extract `X_i²` in the injected kernel using `GroupExtension` exactness before taking its image in
`TauCeti.ElementaryTwoQuotient A`. On the finite coordinate space, `s(v)=Σ_i v_i·class(X_i²)`. This
formula supplies the adapter from the extension's chosen marked lifts to the binary linear map.

The API:

- `paritySquareMap_basis_s`: `s(e_i)=class(X_i²)`.
- `paritySquareMap_linear`: Both maps preserve addition and `F₂` scalar multiplication.
- `paritySquareMap_quotient`: s uses the existing TauCeti elementary-2 quotient of `A`.

*Needs:* RS.4.11; RS.4.12.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6),
Remark 4.2, printed pp.400–401 (PDF pp.24–25).

**Checks.**

- paritySquareMap_test_1 (basis columns): On `V=B=F₂²`, prescribe `s₁=e₁` and `s₂=e₂`.
  The free linear extension satisfies `s(e₁+e₂)=e₁+e₂`.
- `paritySquareMap_test_2` (computation): For `S₃` transpositions and its identity reduced cover,
  `V=F₂`, `Additive(Gᵃᵇ)≅F₂`, `a=id`, `B=0` and `s=0`.
- `paritySquareMap_test_3` (non-example): For distinct classes with the same abelianized image,
  `a(e₁+e₂)=0` even though `e₁+e₂≠0`. In `S₆` the class of a transposition and the class of three disjoint
  transpositions give an explicit example: their cycle types differ and both have odd sign.
- At the free-vector-space adapter, prescribe two columns `s₁=s₂=1` in `B=F₂`. Then
  `s(e₁)=s(e₂)=1` and `s(e₁+e₂)=0`. The zero map and a map taking the union of the nonzero
  columns both fail this test. This is a linear-algebra fixture, not a claim about a reduced cover.

### RS.4.14 Compatible parities and their obstruction

Prove `affine_compatible_parities`: For `g=1` set `v_g=0`; for `g∈c_k` set `v_g=e_k`. Compatible `ε` are
exactly `v_g+ker a`, and `β(g,ε)=s(v_g+ε)`.

*Proof sketch.* The abelianization condition is `a(ε)=a(v_g)`. Over `F₂` subtraction equals addition,
and the central-square product gives the displayed s value.

A signature includes either the identity with lift 1, or an actual `x∈c` with its marked lift. Write
`v_g=0` in the first case and `v_g=e_[x]` in the second. For an integer degree `m`, let `ε(m)_d` be `m_d`
reduced modulo 2. The signature square is the kernel element extracted from the square of this
chosen lift. The equivalence with `ε(m)+v_g∈ker a` uses the actual degree-to-abelianization map, and
the square-obstruction identity uses the actual extension's marked square columns. Each chosen
representative `x_d` must belong to its indexed conjugacy class.

*Needs:* RS.4.13; RS.4.2.

*Source.* Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and
finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences
developed here, rather than separately numbered results in that paper.

**Checks.**

- For `G = S₃, c` the transpositions and `g a` transposition, `v_g = e₁` and the compatible parities are
  `{e₁}=v_g+ker a`, whereas `ker a={0}`.

### RS.4.15 Joint parity constraint map

**`jointParityMap`.** Put `U_ab=Additive(G^ab)`, with its elementary-2 vector-space structure. For `t≥0`
define the linear map `L_t : V → U_ab ⊕ (B/B_t)` by `v ↦ (a(v), s(v) mod B_t)`. Its kernel consists of degree
parities compatible with the identity and with square obstruction in `B_t`.

*Construction.* For arbitrary `F₂`-modules `V,U,B`, linear maps `a:V→U` and `s:V→B`, and submodule `W≤B`,
define `v ↦ (a(v), s(v) mod W)`. The geometric instance takes `U=U_ab` and `W=B_t`.
Compose with the native quotient and product linear maps.

The value is `L_t(v)=(a(v),class(s(v)))`, with second coordinate in `B/B_t`.
Thus `v∈kerL_t` iff `a(v)=0` and `s(v)∈B_t`. The kernels increase with `t`, and at
`t=e` the kernel is `ker a`.

*Needs:* RS.4.13; RS.4.8.

*Source.* Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and
finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences
developed here, rather than separately numbered results in that paper.

**Checks.**

- jointParityMap_test_1 (coordinates): On `V=F₂²`, let `a` and `s` be the first and second
  coordinate projections and `W=0`. Then `L(e₁)=(1,0)` and `L(e₂)=(0,1)` in `F₂ × (F₂/0)`.
- jointParityMap_test_2 (computation): For `a=0,s=id` on `F₂` and `B_t=0, kerL_t=0`; when `B_t=B`,
  `kerL_t=F₂`.
- jointParityMap_test_3 (non-example): For `a=id` and `s=0` on `F₂, kerL_t=0` for every `B_t`.
  Keeping only the square-obstruction coordinate would incorrectly give all of `F₂`; keeping
  only a fails the preceding test with `a=0` and `s=id`.

### RS.4.16 Surviving parities form an affine kernel coset

Prove the affine-coset description of surviving parities: if `v₂(q−1)=t+1`, the parities giving
nonempty fixed fibers are
`C_t^g=v_g+kerL_t`. Each corresponding compatible integer-degree fiber has `|A[q−1]|` fixed points.

*Proof sketch.* Membership combines a compatibility equation and the quotient obstruction equation.
Translate by `v_g`.

Instantiate `L_t` with the existing involution abelianization map and the lift-square map of the
marked extension. For every integer degree `m`, the actual fixed subset of the pullback over (g,m) is
nonempty exactly when `ε(m)+v_g∈ker L_t`. The fixed subset then has cardinality `|ker(a↦a^{q−1})|`. This
specializes to the reduced-cover model, where `A` is the reduced multiplier; it also holds for any
finite central marked model. The conditions are `q>1`, q odd, and q coprime to a positive common
exponent `n` of the cover and `G`. No upper bound `q<n` is required.

For arbitrary binary modules, linear maps `a,s` and obstruction subspace `W`,
`{v : a(v)=a(v_g), s(v−v_g)∈W}` equals the translate by `v_g` of the joint constraint kernel.
The fixed-fiber assertion uses the actual class and lift-square maps described above.

*Needs:* RS.4.15; RS.4.14; RS.4.10.

*Source.* Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and
finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences
developed here, rather than separately numbered results in that paper.

**Checks.**

- With `a=0` and `s=id` on `V = F₂` and `B = F₂` (so `B_0 = 0` and `B_1=B`): for `t = 0` (q ≡ 3 mod 4) the
  surviving parities for `g = 1` are {0}.
- In the same fixture, for `t = 1` (q ≡ 5 mod 8) all of `F₂` survives. Lower bounds and total
  degree enter the counts of RS.4.18.
- At `t=0`, translating the fixture's signature to `v_g=1` gives the surviving coset `{1}`;
  replacing the affine coset by the unshifted kernel would give `{0}`.

### RS.4.17 Ranks count surviving parities

Prove `rank_parity_count`: `|C_t^g|=2^{N−rankL_t}`. For `K_t=2^{N−rankL_t}` and `K_{−1}=0`, the number of
compatible parities with exact threshold `t` is `K_t−K_{t−1}`. The cosets for `g = 1` and for `g ∈ c`
have equal cardinalities, though in general not equal weight enumerators (RS.4.18).

*Proof sketch.* Translation preserves cardinality; use rank-nullity and finite-vector-space
cardinality. Increasing kernels give the histogram difference.

For `t=0` the exact-threshold set is the entire translated kernel of `L_0`. For `t>0` it is the translated
kernel of `L_t` with the translated kernel of `L_{t−1}` removed. On a compatible actual degree fiber
this condition is equivalent to threshold `β(g,m)=t`. The kernels are nested because `B_{t−1}⊆B_t`, so
ordinary natural-number subtraction gives the stated histogram. Translation identifies the parity
counts for any two signatures, independently of the chosen representative lifts. The linear-algebra
formula holds for any finite `F₂`-module `V`, any `F₂`-module `W`, any linear map `L:V→W`
and any translate `v₀`: the coset `v₀+kerL` has `2^{dimV−dim(rangeL)}` elements.

For obstruction subspaces `W≤W'`, the translated joint kernels are nested, and their
cardinality difference is the difference of these rank counts.

*Needs:* RS.4.16; `LinearMap.finrank_range_add_finrank_ker` (Mathlib); `Module.card_eq_pow_finrank`
(Mathlib).

*Source.* Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and
finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences
developed here, rather than separately numbered results in that paper.

**Checks.**

- With `N=2` and `ker L_t={0,e₁+e₂}`, the coset for `g=1` is `{0,e₁+e₂}` and the coset
  for `v_g=e₁` is `{e₁,e₂}`. Both have `2=2^{2−1}` elements, but at `N₀=0` their weight
  enumerators are `1+X²` and `2X`.
- For the zero map on `𝔽₂²`, every parity survives and the count is `4=2^{2−0}`.
- For the zero-dimensional space there is one parity and the count is `1=2⁰`.

### RS.4.18 Lower bounds and the parity degree series

For a subset `C⊆F₂^N`, in particular the surviving affine coset `C_t^g`, and an integer lower
bound `N₀≥0`, let `δ=N₀` mod 2.
Use `W(X)` for the supplied weight polynomial of the translated set
`T_δ(C)={ε+δ·1 : ε∈C}`, with coefficients in `ℤ`. The additional datum here is the lower-bound
translation: its exponent `wt(ε+δ·1)` is the excess above `N·N₀` of the least total degree with
parity `ε` and all coordinates at least `N₀`.

Prove `parity_lowerBound_translation`: for each `ε∈C`, the degrees `m∈ℤ^N` with `m_i≥N₀` and
`m_i` mod `2=ε_i` are uniquely `m_i=N₀+(ε_i+δ)̃+2k_i` with `k_i∈ℕ`, where the tilde takes the
representative 0 or 1. In particular the translation changes the weight argument and leaves the
surviving parity condition `ε∈C` fixed.

Prove `parity_degree_generatingSeries`: define `c_n` as the finite cardinality of
`{m∈ℤ^N : (∀ i, m_i≥N₀) ∧ (m mod 2)∈C ∧ Σ_i m_i=n}`. Then in `ℤ[[X]]`,

```text
Σ_{n≥0} c_n X^n = X^{N·N₀} W(X) · (1−X²)^(−N).
```

Here the last factor means the Nth power of the formal inverse of `1−X²`, whose constant
coefficient is the unit `1`; in Lean this inverse is `PowerSeries.invOfUnit (1 - PowerSeries.X ^ 2) 1`. This includes `N=0`: there is one empty degree of total zero if
`C` contains the empty vector, and none otherwise. For `N>0`, the coefficient also equals
`Σ_{ε∈C} binom(k+N−1,N−1)`, summing only `ε` for which
`n−N·N₀−wt(ε+δ·1)=2k` with `k∈ℕ`. The unique coordinate decomposition proves the series by
multiplying `N` geometric series; no asymptotic statement is used.

*Needs:* RS.4.16; Tau Ceti `Set.weightPolynomial`, `Set.coeff_weightPolynomial` and
`Set.eval_one_weightPolynomial`.

*Source.* Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and
finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences
developed here, rather than separately numbered results in that paper.

**Checks.**

- `parity_degree_series_test_1` (degenerate): For `N=0` and the singleton parity, the series is 1;
  for the empty parity set it is 0.
- `parity_degree_series_test_2` (computation): For `N=1,N₀=0, C={0}` gives `1/(1−X²)` and `C={1}`
  gives `X/(1−X²)`.
- `parity_degree_series_test_3` (non-example): Those two cosets have equal cardinality but unequal
  polynomials; signature counts cannot be identified by cardinality alone.
- `parity_degree_series_test_4` (lower-bound shift): For `N=1,N₀=1, C={0}` gives
  `X²/(1−X²)`, whereas `C={1}` gives `X/(1−X²)`. Omitting `T_δ` would interchange the two series.
- For `N=2,N₀=1,C={00,11}`, the series is `(X²+X⁴)/(1−X²)²`. Its coefficient at `X⁴` is 3:
  the degrees (1,3), (3,1), (2,2). This pins both the shift and the total-degree convention.

### RS.4.19 Independent class images eliminate the obstruction

Prove `independent_classes`: If the `N` class images in `G^ab` are linearly independent, then a is an
isomorphism. Each g-signature has the sole compatible parity `v_g, β=0`, and a nonempty fixed fiber
for every allowed q.

*Proof sketch.* Surjectivity and basis independence give an isomorphism; its kernel is zero, and
`s(0)=0`.

State independence on the actual elements `[x_d]` in `Additive(G^ab)`, using the elementary-2 module
structure supplied by generation by involutions. The bijectivity of a identifies degree
compatibility with `ε(m)=v_g`. The square-obstruction class is then zero, and for every allowed q the
actual fixed fiber is nonempty with `|A[q−1]|` elements. Generation, valid class representatives,
finiteness of `A`, and the common exponent hypotheses remain explicit; independence does not replace
any of them.

For a bijective binary linear map `a` and any linear square map `s`, the fiber of `a(v_g)`
is `{v_g}` and `s(v_g−v_g)=0`.

*Needs:* RS.4.13; RS.4.14; RS.4.16.

*Source.* Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and
finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences
developed here, rather than separately numbered results in that paper.

**Checks.**

- For `G = C₂ × C₂` with `c` all three nonidentity elements, the class images are dependent (three
  vectors in `F₂²`), so this criterion does not apply; for `G = C₂` with `c` its nonidentity element it
  applies with `N = 1`, whatever `A` is.

### Examples

- For `G = S₃` (one involution class, `A=0`) every compatible fiber has exactly one fixed point for
  every odd q prime to 6, and the surviving parities are `v_g+ker a={v_g}`.
- For a reduced multiplier `A = C₈` with one column `s₁` the class of a generator (an algebraic fixture),
  a fiber whose square obstruction has the class of a generator has threshold 3, so it has fixed
  points exactly when 16 divides q `− 1`.

### Dependencies

IG.3.4–IG.3.5's marked model and unit action; Layer RS.3; Tau Ceti `TauCeti.ElementaryTwoQuotient`; Mathlib finite abelian groups and
finite-dimensional linear algebra over `ZMod 2`.

## Layer RS.6: Finite marked-group comparisons and applications

A finite central surjection gives a reduced multiplier when it has the oriented class isomorphism
of a Schur cover. RS.6.4 proves the comparison using centralizer-generated relations; RS.6.5
identifies the resulting parity statistics with the actual fixed fibers. The index-two theorem
and the anti-diagonal exterior-square formula are structural targets. The individual numerical
multiplier values in Wood's Table 2 are input hypotheses in the conditional applications, and the
abelian entries are also worked Checks of the structural formula.

### RS.6.1 Odd-index-two homology reduction

Prove `odd_index_two_reduction`: For finite `H` normal in `G` with |H| odd and `G/H=C₂, M(G)≅M(H)_{C₂}`
and `M(G)` has odd order. For any union `c` of involution classes, `Q_c=0` and `M(G,c)=M(G)`.

*Proof sketch.* `H` is a normal Hall subgroup with quotient `C₂`, and an involution outside `H` spans a
complement. By RS.0.3, corestriction gives `M(H)_{C₂} ≅ M(G)_odd` and the projection identifies `M(G)_2`
with `M(C₂) = 0`, so `M(G) = M(H)_{C₂}` has odd order. (The Hochschild–Serre argument of the source
gives the same: positive `C₂-homology` of the odd-order modules `H_q(H,ℤ)` vanishes, `H₂(C₂,ℤ) = 0`, and
the only possible `d³` into the (0,2) term starts from a 2-primary group.) If `x` is an involution and `y`
commutes with `x`, then `2⟨x,y⟩ = ⟨x²,y⟩ = 0` (`commutator_order`), so `⟨x,y⟩ = 0` in the odd-order group
`M(G)`; hence `Q_c = 0`.

Use `Representation.Coinvariants` for the integral homology representation induced by conjugation on
the normal subgroup `H`. Inner conjugation by `H` acts trivially, so the G-action factors through G/H.
The edge isomorphism sends the inclusion-induced image of `z∈M(H)` to the native coinvariant class of
`z`. This identifies the map as well as the two abstract groups. The vanishing relation conclusion
also permits any subset whose elements square to the identity.

*Needs:* IG.3.4 (homological commutators); IG.3.4 (reduced multiplier); RS.1.1; RS.0.3 (`multiplier_hallPart`) and IG.3.4 (primary/complement comparison); `M(C₂)=0` (Mathlib `Rep.FiniteCyclicGroup.groupHomologyIsoEven`).

*Source.* Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the
Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, Example 9.3.2, arXiv
v1 PDF p.57.

**Checks.**

- For `G = C₂ × C₂` and `H = C₂` (even order) the conclusion fails: `M(G) ≅ C₂`, and for `c` all nonidentity
  elements `Q_c = M(G) ≠ 0`.

### RS.6.2 Commutators define a centralizer homomorphism

Prove `centralizer_commutator_hom`: For fixed `x∈G` in a central extension `E→G`, the lift-commutator
function `κ_E(x,−):C_G(x)→A` is a group homomorphism.

*Proof sketch.* Choose product lifts and expand [X,YZ]; the two kernel commutators are central, so
conjugation terms disappear.

*Needs:* IG.3.4 (lift commutators).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix
opening p.420 (PDF pp.11,43–44).

**Checks.**

- For `D₈ → C₂ × C₂` and `x` the image of the rotation, `κ(x,−)` is the homomorphism `C₂ × C₂ → C₂` that
  kills `x` and is nonzero on the other two nonidentity elements. For noncommuting `x, y` the commutator
  of lifts is not in the kernel, so `κ(x,−)` is defined only on the centraliser.

### RS.6.3 Centralizer generators suffice for reduction

Prove `centralizer_generator_relations`: For a central extension `E→G`, the subgroup generated by all
`κ_E(x,y)` with `x∈c,y∈C_G(x)` equals that generated using one representative per class in `c` and any
group-generating set of its centralizer.

*Proof sketch.* At fixed `x` the commutator-of-lifts map `C_G(x)→A` is a homomorphism because its values
are central. Conjugating both arguments preserves the central result.

The equality of generated subgroups inside the total group `E` is equivalent to the equality
inside `A`, by injectivity of the kernel inclusion. The representatives lie in `c` and meet
every class in `c`, the sets `T_d` generate the actual centralizers in `G`, and the chosen lifts
project to their indexed elements.

*Needs:* IG.3.4 (lift commutators); IG.3.4 (class-compatible marking); RS.6.2.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix
opening p.420 (PDF pp.11,43–44).

**Checks.**

- For `D₁₆→D₈`, reducing rotation exponents modulo four, fix the image of `s`. Its
  centralizer is generated by `s,r²`. Their lift commutators are `1,r⁴`, generating the
  nontrivial kernel `⟨r⁴⟩`. Filtering the ambient generators `{r,s}` to those centralizing
  the image of `s` leaves only `s` and gives the trivial relation subgroup.

### RS.6.4 The centralizer-generated quotient comparison

Prove `centralizer_generator_quotient`. Let `G` and `E` be finite groups, let
`S : GroupExtension A E G` be central and stem, and assume its oriented class map
`τ_E : M(G) ≃+ Additive A` is an isomorphism. Let `c ⊆ G` be conjugacy-invariant. Choose one
representative `x_d` of each class in `c`, and a finite set `T_d ⊆ C_G(x_d)` generating the
actual centralizer. Choose lifts of `x_d` and the elements of `T_d`. Let `R ≤ A` be generated by
all their lift commutators, read through the injective kernel inclusion. Then
`τ_E(Q_c) = Additive R`, and there is an isomorphism

```text
M(G,c) ≃+ Additive (A/R),    [z] ↦ [τ_E(z)].
```

The hypotheses include the ordinary Schur-cover property: centrality, a large kernel or a
quotient cardinality alone does not imply the asserted class isomorphism. No generation of `G`
by `c` is needed for this comparison. RS.6.3 identifies the relation subgroup; quotienting the
specified class isomorphism gives the result. The map on each reduced homology class is part of
the statement, rather than an unspecified equality of group orders.

The comparison API consists of `centralizer_generator_quotient_relations` (the stated image of
`Q_c`), `centralizer_generator_quotient_apply` (the displayed value on `[z]`), and
`centralizer_generator_quotient_transport` (naturality for isomorphisms of central extensions
carrying `c` to the new marking). A conjugacy-equivariant marking in the reduced cover keeps
its selected representative lifts, so the comparison also identifies the lift-square columns
of RS.4.12. For a specified ambient embedding, transport retains that embedding as data.

*Needs:* RS.6.3; InverseGaloisAndArithmeticFundamentalGroups IG.3.4, **Commutators of lifts and the
class map of a central extension**, **The reduced Schur multiplier**, and **Reduced Schur covers**.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix
opening p.420 (PDF pp.11,43–44), together with the generator reduction in RS.6.3.

**Checks.**

- For `G=E=1` and `c=∅`, the relation subgroup and reduced quotient are trivial.
- For `D₈→C₂²` with `c` all nonidentity elements, one nontrivial central commutator generates
  the kernel and `A/R=1`.
- The central surjection `C₄→C₂` has kernel of order two but is not a Schur cover of `C₂`;
  its class map is zero and does not satisfy the isomorphism hypothesis.

### RS.6.5 Parity statistics of a specified reduced quotient

Prove `finite_parity_comparison`. Retain the hypotheses and quotient identification of RS.6.4,
assume that `c` generates `G` and consists of involutions, and give a homomorphism `π₀:G→C₂`
and `τ∈c` with `π₀(τ)≠1`. Write `A_red=A/R`. Form the actual class and lift-square maps `a,s`
of RS.4.13 on `V=𝔽₂^D`, the torsion-image spaces `B_t ⊆ A_red/A_red²`, and `L_t` from RS.4.15.
For either signature `g=1` or `g=τ`, with `v_g=0` or `e_[τ]`, respectively, the surviving
parities at `v₂(q−1)=t+1` are exactly `C_t^g=v_g+ker L_t`. Here `q>1` is odd and coprime to a
positive common exponent of the cover and `G`. Every integer degree with a surviving parity
has exactly `|A_red[q−1]|` fixed points in its actual compatible fiber.

The membership condition is `a(v+v_g)=0` together with `s(v+v_g)∈B_t`; the square coordinate
is extracted from the chosen marked lifts in the reduced extension and then mapped to the native
elementary-2 quotient. The number of surviving parities is `K_t=2^{|D|−rank L_t}`. With
`K_{−1}=0`, the number with exact threshold `t` is `K_t−K_{t−1}`. For lower bound `N₀≥0`, their
weight polynomial is the supplied polynomial of
`{v+(N₀ mod 2)·1 : v∈C_t^g}`; its coefficient at `w` counts exactly those translated words
of weight `w`, and RS.4.18 gives the full integer-degree generating series. These statements
apply to any specified Schur cover and marked embedding satisfying the hypotheses.

The comparison API consists of `finite_parity_obstruction` (agreement with the actual
lift-square columns), `finite_parity_cosets` (the two displayed affine cosets),
`finite_parity_counts` (ranks and threshold differences), and `finite_parity_weights` (the
translated finite weight sum and lower-bound series).

*Needs:* RS.6.4; RS.4.13–RS.4.18; Tau Ceti `Set.weightPolynomial` and its coefficient and
cardinality formulas.

*Source.* Derived from Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1,
equation (6) and Remark 4.2, printed pp.400–401 (PDF pp.24–25), together with RS.4. The cover
comparison uses §2.3 p.387; the marked examples are in Table 2 p.419 and the Appendix p.420.

**Checks.**

- For `S₃` with transpositions, `a=id` on `𝔽₂`, `A_red=0`, and each signature has one parity
  with threshold zero.
- For trivial `A_red`, every compatible parity survives every allowed odd `q`, including `q=1`
  under the identity-action case of RS.4.5.
- For the algebraic fixture `A_red=C₈` with one odd square column, that column first survives
  at `v₂(q−1)=4`. This is a finite-abelian-group Check, without an arithmetic realisation hypothesis.

### RS.6.6 The order-96 A₄ arithmetic type

**`order96Type`.** Let `ab:A₄→C₃` be its abelianization map. Put `K=ker((a,b)↦ab(a)+ab(b))` inside `A₄²`,
and `F=K⋊C₂` with the involution swapping the two `A₄` factors. Use the explicit
embedding `F⊆A₄≀C₂` and `c` its outside order-2 elements for the reduced multiplier, rather than an
unmarked abstract SmallGroups label.

*Construction.* The sum map `A₄²→C₃` is onto and preserved by swap; form its kernel and restricted
semidirect product. The embedding is part of the specified marked model.

The abelianization fixture is a surjection `A₄→C₃` with kernel `[A₄,A₄]`, used consistently on both
coordinates. The multiplicative form of the kernel condition is `ab(a)ab(b)=1`. Swapping coordinates
defines an automorphism of this actual kernel and hence the `C₂-action`. The homomorphism into
`(A₄×A₄)⋊C₂` retains both coordinates and the swap coordinate and is injective. The outside-involution
set uses that projection, not a cardinality test or a chosen abstract group identifier.

The API:

- `order96Type_kernel`: `K` consists exactly of pairs with `ab(a)+ab(b)=0`.
- `order96Type_swap`: Swap preserves `K` and squares to the identity.
- `order96Type_outside`: The quotient `F→C₂` is the swap coordinate; `c` is its outside involution set.

*Needs:* Mathlib `alternatingGroup`, `Abelianization`, `SemidirectProduct`, `MulEquiv.prodComm`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Appendix opening, printed p.420 (PDF
p.44).

**Checks.**

- The kernel has order `48` and the semidirect product has order `96`.
- `order96Type_test_1` (computation): A pair of 3-cycles with abelianized values 1,2 belongs to `K`.
- `order96Type_test_2` (non-example): A pair with values 1,1 does not belong to `K`; using the
  difference instead of the sum builds another specified kernel.
- `order96Type_test_3` (compatibility): The outside element ((1,1),swap) has order 2 and projects
  nontrivially.

### RS.6.7 Fixed fibers for the order-96 model

Prove `order96_fixed_fibers`: let `F` be the marked model of RS.6.6, with `c` its outside
involutions, assume `c` generates `F`, and assume an isomorphism `M(F,c)≃C₂`. Use its reduced
cover and marking, take `g∈c∪{1}`, and let `m` be an integer class degree. For odd `q>1` prime
to `|F|`, an incompatible fiber is empty. A compatible fiber has two fixed points when
`q≡1 mod 4`; when `q≡3 mod 4`, it has two fixed points exactly when `β(g,m)=0`, and zero
otherwise. At `q=1` every compatible fiber has two fixed points.

The explicit multiplier isomorphism is an input hypothesis. The quotient comparison of RS.6.4
specifies its meaning: an oriented Schur-cover class isomorphism identifies the relation subgroup
with `Q_c`, and its quotient is the given cyclic group of order two. No ordinary multiplier or
relation-subgroup order is prescribed. Wood's Table 2, row 8, records this multiplier value.
The fixed-fiber conclusion follows from RS.4.5 and RS.4.10 since the nonzero class in
`C₂/C₂²` has threshold one.

*Needs:* RS.6.6; RS.6.4; RS.4.5; RS.4.10.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6),
pp.400–401; §2.3 p.387; Table 2 p.419 and Appendix opening p.420 (PDF pp.11,24–25,43–44).

**Checks.**

- A nonzero obstruction survives `q≡1 mod 4` and fails at `q≡3 mod 4`; a zero obstruction
  survives both. The multiplier value alone asserts no moment limit or enumeration of types.

### RS.6.8 The anti-diagonal model for abelian base groups

**`antidiagonalModel`.** For an abelian group `G`, let `W(G)=(G×G)⋊C₂`, with the nonidentity
swap element exchanging the factors. Let `F(G)≤W(G)` consist of `((a,a⁻¹),t)` with `a∈G`
and `t∈C₂`. Its quotient map `ρ:F(G)→C₂` is the restricted projection and its marking is
`c(G)={x∈F(G) : ρ(x)≠1}`. Every element of `c(G)` is an involution, since its square is
`((a,a⁻¹)(a⁻¹,a),1)=1`. The coordinate map `(a,t) ↦ ((a,a⁻¹),t)` identifies `F(G)` with
`G⋊C₂`, where the nonidentity element acts by inversion on `G`. For `G=C_n` this is the dihedral
group of order `2n`.

Membership of `((a,b),t)` in `F(G)` means `b=a⁻¹`. For finite `G` its order is `2|G|`.
The marking consists exactly of elements with `ρ(x)≠1`, all of which square to 1. For
`G=Multiplicative (ZMod n)`, identify `F(G)` with `DihedralGroup n`, carrying the marking
onto the reflections.

*Construction.* Define the swap action `swapAction G : C₂ →* MulAut (G × G)` through
`MulEquiv.prodComm`, form `SwapWreath G = (G × G) ⋊ C₂`, and take `F(G)` to be the kernel of `((a,b),t) ↦ ab`, a homomorphism because `G` is commutative. This is the sum-kernel model of RS.6.9 for abelian `G`,
and `Suggested.lean` states its ordinary-homology comparison using `sumKernelModel G`.
Its marking is the outside involution set. *Needs:*
Mathlib `SemidirectProduct`, `MulEquiv.prodComm`, `DihedralGroup`, `MonoidHom.range`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), introduction, printed pp. 378–379, for
the admissibility conditions and this model for abelian groups; §8.2, Table 2, p. 419.

**Checks.**

- `antidiagonalModel_test_1` (membership): in `W(C₃)`, ((1,2),t) `∈ F(C₃)` for both `t` (additive
  residues), but the diagonal pair ((1,1),1) is not in `F(C₃)`.
- `antidiagonalModel_test_2` (marking): the pure swap ((0,0),t) with `t ≠ 1` lies in `c(G)`, and the
  identity does not.
- `antidiagonalModel_test_3` (dihedral): `F(C₃)` is the dihedral group of order `6 (≅ S₃)`, with `c` the
  three reflections.

The cyclic group alias `C₂ = Multiplicative (ZMod 2)` has the following Checks.

- `Nat.card C₂=2`; the trivial group would fail this check.
- `Multiplicative.ofAdd (1 : ZMod 2)` squares to the identity; an infinite cyclic group would fail.
- This element differs from the identity; confusing additive `1` with multiplicative `1` would fail.

The light semidirect-product adapters have their own checks. Coordinates in `C₃` below are
additive residues; the trailing 1 denotes the identity of the swap group.

- `swapAction` at the identity fixes (1,2) in `C₃²`, the nonidentity element sends it to (2,1),
  and applying that nonidentity element twice returns (1,2). Thus a trivial action or an
  action with the wrong order fails these computed checks.
- `SwapWreath 1` has order two; `SwapWreath C₃` has order eighteen; in the latter the pure swap
  conjugates the base element ((1,0),1) to ((0,1),1), so this group is not the direct product.
- `abelianizedSum` on `C₃²` sends (1,2) to 0 and (1,1) to 2, and on `S₃²` sends a pair of
  transpositions to the identity in `S₃ᵃᵇ=C₂`. These reject a difference, a projection, and an
  unabelianized product as its definition.
- The outside involution set excludes the identity, includes the pure swap, and in `SwapWreath C₃`
  excludes ((1,0),swap), whose square is `((1,1),1)≠1`. Checking the outside coordinate alone
  would admit that last element.

Prove `antidiagonal_marking`: for every abelian `G`, the set `c(G)` generates `F(G)`. The product
of two outside elements `((a,a⁻¹),t)((b,b⁻¹),t)` is `((ab⁻¹,(ab⁻¹)⁻¹),1)`. For finite `G` of
odd order, `c(G)` is a single conjugacy class: conjugating `((a,a⁻¹),t)` by `((b,b⁻¹),1)` gives `((ab²,(ab²)⁻¹),t)`, and squaring
is bijective on `G`. For `G = C₂` the one-class statement fails: `F(C₂) ≅ C₂ × C₂` is abelian and `c(C₂)`
consists of two classes.

Prove the reduced-multiplier formula for the anti-diagonal model: for finite abelian `G` of odd order,

```text
M(F(G), c(G)) = M(F(G)) ≅ M(G) ≅ Λ²G,
```

The native ordinary-homology comparison is `antidiagonal_multiplier`: `M(F(G)) ≅ M(G)`. Here `Λ²G`
is the exterior square of the `ℤ`-module `G`. Concretely, for `G = ⊕ᵢ C_{nᵢ}` the multiplier is
`⊕_{i<j} C_{gcd(nᵢ,nⱼ)}`.

*Proof sketch.* The kernel of `ρ` is `G`, of odd order, so RS.6.1 gives `M(F,c) = M(F) ≅ M(G)_{C₂}`, where
`C₂` acts through inversion on `G`. Prove the degree-two Künneth comparison
`multiplier_prod_abelian`: `M(A × B) ≅ M(A) ⊕ M(B) ⊕ (A ⊗ B)` for abelian `A, B`, with the
tensor summand carried by the cross-factor commuting-pair cycles. The map
`abelian_multiplier_exteriorSquare` uses Mathlib's `⋀[ℤ]^2 (Additive G)` and sends `a∧b` to `⟨a,b⟩`. The boundary calculation of RS.1.1
makes it bilinear, and `⟨a,a⟩=0` makes it alternating. A finite cyclic decomposition, the
Künneth comparison and `M(C_n)=0` show that this map is an isomorphism for finite abelian `G`.
Naturality follows from the supplied naturality of commuting-pair classes, independently of
the chosen decomposition. Inversion therefore acts on `Λ²G` by `(−1)·(−1)=1`, so the coinvariants
are all of `M(G)`. *Needs:* RS.6.1; RS.0.3; RS.1.1; Mathlib
`Rep.FiniteCyclicGroup.groupHomologyIsoEven` (`M(C_n)=0`); the degree-two Künneth formula
`M(A×B) ≅ M(A) ⊕ M(B) ⊕ (A⊗B)`, which Mathlib lacks at the pin and which is proved as part
of this target.

*Source.* Löh, *Group Cohomology*, Corollary 3.2.23 (Künneth theorem for group homology), p. 136,
and Corollary 1.6.13 (homology of finite cyclic groups), p. 49; Ellenberg–Venkatesh–Westerland,
Example 9.3.2 (arXiv v1, p. 57), for the index-two reduction in this setting.

**Checks.**

- `antidiagonal_reduced_multiplier_test_1` (cyclic): for `G = C_n` with `n` odd, `M(F,c) = 0`; this is
  rows 1–4, 6, 9–12, 14–15, 18, 20 and 26–27 of Wood's Table 2.
- `antidiagonal_reduced_multiplier_test_2` (rank two): for `G = C₃², C₅², C₉ × C₃` the values are `C₃`,
  `C₅, C₃` (rows 5, 19, 21).
- `antidiagonal_reduced_multiplier_test_3` (rank three): for `G = C₃³` the value is `C₃³` (row 25); a
  formula using `M(G) ⊗ ℤ/2` or the coinvariants of the inversion action on `G` itself would give 0.

### RS.6.9 Sum-kernel, graph and full wreath models

These constructions realise the nonabelian rows. For any group `G`, let `W(G)=(G×G)⋊C₂` with the swap
action as in RS.6.8.

**`sumKernelModel`.** The map `W(G)→Gᵃᵇ`, `((a,b),t) ↦ [a][b]`, is a homomorphism (the target is
commutative, so the swap does not change [a][b]). Its kernel is `sumKernelModel G`, with quotient
map to `C₂` the restriction of the projection of `W(G)`, and marking its outside involutions. For finite
`G`, |sumKernelModel G|  =  2|G||[G,G]|, because the map is onto with fibres of size `|G|²/|Gᵃᵇ|`.
Membership is [b] `= [a]⁻¹` in Gᵃᵇ; an outside element ((a,b),t) is an involution iff `b = a⁻¹` in `G`.
When `G` is perfect, `sumKernelModel G` is all of `W(G)` (the *full wreath model*).

**`graphModel`.** For an involutive automorphism `θ` of `G`, let `G ⋊_θ C₂` act through `θ`, and embed it in
`W(G)` by `(g,t) ↦ ((g,θ(g)),t)`; involutivity makes this a homomorphism, and it is injective. Its
outside involutions are the elements (g, t) with `t ≠ 1` and `θ(g) = g⁻¹`. For finite `G` it has order
2|G|.

For any `C₂`-action `φ`, take `θ=φ(swap)` in this construction. The injective homomorphism
`G ⋊[φ] C₂ → W(G)` sends `(g,t)` to `((g,θ(g)),t)`, and its outside involutions satisfy
`θ(g)=g⁻¹`.

Prove the displayed membership, order and outside-involution formulas for the sum kernel,
and its equality with `W(G)` when `G=[G,G]`. For the graph embedding, prove the coordinate
formula, injectivity, order `2|G|` for finite `G`, and the displayed outside-involution criterion.

*Needs:* Mathlib `SemidirectProduct`, `SemidirectProduct.lift`, `Abelianization`, `commutator`,
`MulAut`, `MonoidHom.ker`. In the Lean file the map `W(G)→Gᵃᵇ` is built from `abelianizedSum G`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Appendix opening, p. 420 (the sum
condition), and §8.2, Table 2, p. 419.

**Checks.**

- sumKernelModel_test_1 (sum, not difference): in `W(C₃)` the pair ((1,2),1) (additive residues)
  lies in the sum kernel and ((1,1),1) does not.
- sumKernelModel_test_2 (orders): `|sumKernelModel A₄|=2·12·4=96` (row 8, equal to the model
  of RS.6.6), `|sumKernelModel SL₂(𝔽₃)|=2·24·8=384` (row 17), and for `G=C₇⋊C₃` the order
  is `2·21·7=294` (row 13).
- sumKernelModel_test_3 (perfect): for `G = A₅` the sum kernel is all of `W(A₅)`, of order 7200 (row
  29).
- `graphModel_test_1` (symmetric groups): for `G=A_n` with `n=4` or `n=5` and `θ` conjugation
  by a transposition `τ`, the map `(a,t) ↦ aτ^t` identifies `G⋊_θC₂` with `S_n` and carries
  outside involutions to transpositions (rows 7 and 28).
- `graphModel_test_2` `(GL₂(𝔽₃))`: for `G = SL₂(𝔽₃)` and `θ` conjugation by `diag(−1,1)`, the graph model is
  `GL₂(𝔽₃)`, of order 48, and its outside involutions are the 12 conjugates of `diag(−1,1)` (row 16).
- `graphModel_test_3` (inverse transpose): for `G = SL₃(𝔽₂)` and `θ(g) = (g⁻¹)ᵀ`, the graph model has
  order 336 (row 30), since `|SL₃(𝔽₂)|=168`. For the elementary matrices
  `u=I+E₀₁` and `v=I+E₁₂`, `(uv)ᵀ≠uᵀvᵀ`; transpose alone reverses products and is not an
  automorphism.

### RS.6.10 The table of reduced multipliers

Prove `table_fixed_fiber_application`: choose any listed marked model `(F,c)`, assume `c`
generates `F`, and assume an isomorphism `M(F,c)≃A` with the group in the last column. For
`g∈c∪{1}`, odd `q≥1` prime to `|F|`, and any integer degree `m`, the actual fiber has zero
fixed points when its degree is incompatible; otherwise it has `|A[q−1]|` fixed points
exactly under the square-times-torsion criterion of RS.4.5. For `q>1` this is equivalently
`v₂(q−1)≥t_A(b(g,m))+1`. The marking, reduced cover and chosen lifts are those of IG.3.4;
`c` is the full set of outside involutions of the displayed embedded model. An application
using a single inertia class also assumes that this outside set is one conjugacy class.

Each numerical multiplier value below is an explicit input hypothesis of this application.
The abelian entries also follow as worked Checks of RS.6.8. Isomorphisms identifying a displayed
model with another specified embedded marked group must retain its marking and embedding.

| Row | `G` | Marked group `F` | Input `A ≃ M(F,c)` |
| --- | --- | --- | --- |
| 1, 2, 3, 4 | `C₃, C₅, C₇, C₉` | `F(G)` (RS.6.8): `D₆, D₁₀, D₁₄, D₁₈` | 1 |
| 5 | `C₃²` | `F(C₃²)` | `C₃` |
| 6, 9, 10, 11, 12 | `C₁₁, C₁₃, C₁₅, C₁₇, C₁₉` | `F(G): D₂₂, D₂₆, D₃₀, D₃₄, D₃₈` | 1 |
| 7 | `A₄` | graph model, `≅ S₄` | 1 |
| 8 | `A₄` | sum-kernel model, order 96 (RS.6.6) | `C₂` |
| 13 | `C₇ ⋊ C₃` | sum-kernel model, order 294 | 1 |
| 14, 15 | `C₂₁, C₂₃` | `F(G): D₄₂, D₄₆` | 1 |
| 16 | `SL₂(𝔽₃)` | graph model, `≅ GL₂(𝔽₃)` | 1 |
| 17 | `SL₂(𝔽₃)` | sum-kernel model, order 384 | 1 |
| 18 | `C₂₅` | `F(C₂₅) = D₅₀` | 1 |
| 19 | `C₅²` | `F(C₅²)` | `C₅` |
| 20 | `C₂₇` | `F(C₂₇) = D₅₄` | 1 |
| 21 | `C₉ × C₃` | `F(C₉ × C₃)` | `C₃` |
| 22 | Heisenberg group of order 27 | graph model for (a,b,z) `↦ (−a,−b,z)`, order 54 | 1 |
| 23 | Heisenberg group of order 27 | sum-kernel model, order 162 | `C₃²` |
| 24 | `C₉ ⋊ C₃` | sum-kernel model, order 162 | 1 |
| 25 | `C₃³` | `F(C₃³)` | `C₃³` |
| 26, 27 | `C₂₉, C₃₁` | `F(G): D₅₈, D₆₂` | 1 |
| 28 | `A₅` | graph model, `≅ S₅` | 1 |
| 29 | `A₅` | full wreath model `A₅` ≀ `C₂` | `C₂` |
| 30 | `SL₃(𝔽₂) ≅ PSL₃(𝔽₂)` | graph model for inverse transpose, order 336 | 1 |
| 31 | `SL₃(𝔽₂)` | full wreath model, order 56 448 | `C₂` |

Here `D_{2n}` denotes the dihedral group of order 2n, the Heisenberg group is the upper unitriangular
subgroup of `SL₃(𝔽₃)` with coordinates `(a,b,z)` and product
`(a,b,z)(a′,b′,z′) = (a+a′,b+b′,z+z′+ab′)`, and `C₇ ⋊ C₃, C₉ ⋊ C₃` are the nonabelian groups of orders 21 and 27 with a cyclic normal
subgroup of index three (generated by `x ↦ x+1` and `x ↦ 2x` on `ℤ/7`, respectively `x ↦ x+1` and `x ↦ 4x` on
`ℤ/9`).

*Needs:* RS.4.5 and RS.4.10; RS.6.4 and the models of RS.6.6–RS.6.9. RS.6.1 applies to
the odd-index-two models in rows 13 and 22–24.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §8.2, Table 2, p. 419, and the Appendix
opening, p. 420.

**Checks.**

- The values for the abelian rows agree with RS.6.8 (`antidiagonal_reduced_multiplier_test_1` to
  `antidiagonal_reduced_multiplier_test_3`): their values are given by `Λ²G`.
- Row 8 supplies exactly the multiplier hypothesis of RS.6.7.
- The values of rows 29 and `31 (C₂)` are nonzero although the bases are perfect: a rule "perfect base
  ⇒ trivial reduced multiplier" is false.

### Examples

- For the symmetric group `S₃` with `c` the transpositions (row 1), `M(S₃) = 0`, the identity is a Schur
  cover, the reduced cover is `S₃` itself, the parity map is the identity of `F₂`, and every compatible
  fiber has one fixed point for every odd q prime to 6.
- For `G = C₃² ⋊ C₂` (row 5), `M(G,c) = M(G) ≅ C₃` by RS.6.1 and RS.6.8, so `A = C₃` has odd order, `B = 0`,
  and every compatible parity survives every allowed q, with `|A[q−1]| = 3` or 1 fixed points
  according as 3 divides q `− 1` or not.

### Dependencies

Layers RS.0, RS.1 and RS.4; RS.6.1 uses RS.0.3. The fixed-fiber applications use the
listed multiplier isomorphisms as explicit hypotheses.

## Downstream consumers

ArithmeticStatistics ST.3 and ST.5, and ArithmeticStatisticsPartV, use the degree restrictions of
RS.3, the fixed-fiber counts and parity statistics of RS.4, and the finite-group calculations of
RS.6. ArithmeticStatistics ST.3 is a downstream consumer that identifies these models with
embedded arithmetic types and enumerates those types. These identifications are not inputs to the
abstract quotient comparisons. The reduced multipliers, covers and marked-extension objects used
by these consumers come directly from InverseGaloisAndArithmeticFundamentalGroups IG.3.4–IG.3.5. The local normalization in RS.1 is useful when multiplying local
inertia factors; the exactness and Hall-coinvariant comparisons in RS.0 apply to central
extensions independently of arithmetic. Embedded-type enumeration and arithmetic distribution
statements remain with the named arithmetic roadmaps.

## References

- Melanie Matchett Wood, *Nonabelian Cohen–Lenstra moments*, Duke Math. J. 168 (2019), no. 3,
  377–427 ([NSF public access copy](https://par.nsf.gov/servlets/purl/10152050)): §2.3, p. 387;
  Definition 3.1, p. 388; Lemmas 3.3–3.4, p. 390; §4.1, pp. 398–401 (Proposition 4.1 and
  equation (5), p. 400; equation (6) and Remark 4.2, p. 401); introduction, pp. 378–379; §8.2,
  Table 2, p. 419; Appendix opening, p. 420. The freely readable
  [arXiv v2](https://arxiv.org/abs/1702.04644v2) has the same labels: §2.3 p. 8; Definition 3.1 p. 9;
  Lemmas 3.3–3.4 pp. 10–11; §4.1 pp. 17–19 (Proposition 4.1 and equation (5) p. 18, equation (6)
  pp. 18–19 and Remark 4.2 p. 19); Table 2 p. 34; Appendix opening p. 35. Other parenthetical PDF
  page numbers above refer to the journal copy.
- Melanie Matchett Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*,
  Research in the Mathematical Sciences 8 (2021), Article 21 ([author
  copy](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf)): §2.1, p. 2; §2, Lemmas
  2.1–2.4 and Theorem 2.5, pp. 2–4; §4, equations (2) and (4) and Remark 4.1, pp. 6–8.
- Jordan `S`. Ellenberg, Akshay Venkatesh, Craig Westerland, *Homological stability for Hurwitz spaces
  and the Cohen–Lenstra conjecture over function fields, II*,
  [arXiv:1212.0923v1](https://arxiv.org/abs/1212.0923v1) (2012, withdrawn): §§7.2–7.5, pp. 32–37;
  Example 9.3.2, p. 57.
- Yuan Liu, Melanie Matchett Wood, David Zureick-Brown, *A predicted distribution for Galois groups
  of maximal unramified extensions*, Invent. Math. 237 (2024), 49–116 ([NSF public access
  copy](https://par.nsf.gov/servlets/purl/10509628); preprint
  [arXiv:1907.05002v2](https://arxiv.org/abs/1907.05002v2)): §12, pp. 104–105 (arXiv v2 pp. 47–48;
  the paragraph before Proposition 12.7, arXiv v2 p. 50); Lemma 12.10 and its proof, pp. 110–111
  (arXiv v2 p. 53); proof of Theorem 10.4, p. 112 (arXiv v2 p. 54).
- Clara Löh, *Group Cohomology*, lecture notes, version of 30 July 2019 ([author
  copy](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf)): §1.2, pp. 11–17; Theorem
  1.4.1, p. 20; Theorem 1.5.1, p. 30; §1.5.2, pp. 32–40; Outlook 1.5.15, p. 40; Corollary 1.6.13, p.
  49; §1.7.3 and Theorem 1.7.15, pp. 63–64; Corollary 1.7.16, pp. 64–65; Theorem 3.2.12, p. 123;
  Proposition 3.2.13, p. 124; Remark 3.2.14, p. 125; Theorem 3.2.18, pp. 129–131; Corollary 3.2.20,
  p. 133; Corollary 3.2.23, p. 136.
