# Roadmap: length bounds in p-adic families

**Summary.** Let `O` be a discrete valuation ring with fraction field `K` and normalized valuation `v`. In a `p`-adic family, finitely many eigensystems are the points of a finite set `X`, and the algebra they generate is a *split algebra*: an `O`-subalgebra `A ⊆ O^X` of functions on `X` that separates the points. Congruences between the points are measured by lengths of `O`-modules. This roadmap builds the congruence module of a finitely generated torsion-free `O`-module `M` with an `A`-action along a set `Y ⊆ X` of points (and, for any finite `O`-algebra, along a central idempotent of `A ⊗ K`), which measures how far `M` is from the direct sum of its parts over `Y` and over `X ∖ Y`. It then bounds the congruence ideal of a point at which a family of representations is reducible by the lengths of extension modules and Selmer groups of the blocks, in the manner of Ribet's construction of unramified extensions, with explicit losses for local defects.

The headline theorems are these.

1. For `Z ⊆ X`, the length `η_Z(M)` of the congruence module of `M` along `Z` satisfies `η_Z(M) ≤ Σ_{π∈Z} mult(π)·v(cc_Z(π))`, where `mult(π)` is the dimension of the `π`-eigenspace of `M ⊗ K` and `cc_Z(π) = {f(π) : f ∈ A, f = 0 on X ∖ Z}` is the relative congruence ideal. More generally, if `S ⊆ X` and for every `π ∈ S` an `O`-linear endomorphism `α_π` of `M` commuting with `A` kills the eigenspaces of the points outside `S` and acts on the `π`-eigenspace by a nonzero scalar `a_π`, then `η_S(M) ≤ Σ_{π∈S} mult(π)·v(a_π)`.
2. Let `𝒜` be an `O`-algebra, `ψ_b : 𝒜 → M_{d_b}(O)` (`b` in a finite set `B`) surjective `O`-algebra homomorphisms and `Rel ⊆ 𝒜^g` a left `𝒜`-submodule. If an ideal `J ⊆ O` contains every coefficient of the generic determinant `∏_b det ψ_b(Σ_k X_kΘ_k)` for all tuples of arrays `Θ_k` with rows in `Rel`, then `length_O(O/J) ≤ Σ_b length_O Sol_b`, where `Sol_b ⊆ ((K/O)^{d_b})^g` is the module of solutions of the relations through `ψ_b`. When `Rel` is finitely generated and the residue field of `O` has more than `g·Σ_bd_b` elements, one array of relations suffices (1.8b (1′), the form of the formal proof; the generic form is this roadmap's).
3. Let `O` be complete, `A` local, `G` a profinite group and `r_x : G → GL_n(O)` (`x ∈ X`) continuous representations whose determinants are the specialisations of a determinant `D : A[G] → A` of dimension `n`. Let `π ∈ X` be a point with `r_π ⊗ K ≅ ⊕_b ρ_b ⊗ K`, where the reductions of the `ρ_b : G → GL_{d_b}(O)` are absolutely irreducible and pairwise non-isomorphic and one block is a continuous character `χ`; let `Xs, Z ⊆ X` with `π ∈ Xs ∩ Z`, where `Z` contains every `x ∈ Xs` at which `χ` occurs in `r_x ⊗ K`, and put `c(π) = {f(π) : f ∈ A, f = 0 on Xs ∖ Z}`. If the cut cocycles of every block (cocycles of `G` with values in `ρ_b ⊗ χ^{−1} ⊗ K/O`, cut out by the family) satisfy local conditions `L_{b,v}` at closed subgroups `G_v`, then `length_O(O/c(π)) ≤ Σ_b length_O H¹_𝒮(G, ρ_b ⊗ χ^{−1} ⊗ K/O)`, a sum of lengths of Selmer groups. The derivation of the hypotheses from `D` (1.8c (3)) and the bound over every residue field are this roadmap's; in [FormalProof] the residue field of `O` has more than `g·n` elements, `g` the number of generators of the module `Y_s` of 1.8c (1.8c, *The form of the formal proof*).

The roadmap extends [PadicFamilies](../../PadicFamilies/README.md), whose congruence module and congruence ideal of one augmentation are the case of a single point; PadicFamilies §1.7a states the congruence module of a commutative `O`-algebra, finite and free, along an idempotent of `A ⊗ K`, which is the case `M = A` of the congruence module of 1.7a. [IntegralHeckeAndGaloisDeterminants](../../IntegralHeckeAndGaloisDeterminants/README.md) provides determinants, Amitsur's formula, Henselian lifting of matrix units and generalized matrix algebras, from which the hypotheses of the third headline are derived; [SelmerIwasawaCohomology](../../SelmerIwasawaCohomology/README.md) and [ProfiniteCohomology](../../ProfiniteCohomology/README.md) provide Selmer structures and explicit continuous cocycles; and the sub-roadmap [SelmerLengthBoundsAndLocalLifting](../SelmerLengthBoundsAndLocalLifting/README.md) of the family [RiemannHypothesisForDirichletLFunctions](../README.md) provides the duality of local defects and the lifting exponents at the places above `p`. In the family, these bounds measure the congruence modules of theta lifts in [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md).

Layer 1, the only layer, defines the congruence module along a central idempotent, its symmetry and its form relative to a set of points of a split algebra, with the length bound by multiplicities (1.7a); proves the determinant lemma by a Morita reduction, the Smith normal form and Gauss's lemma, and its form with one array over a large residue field (1.8b); bounds the congruence ideal at a reducible point by extension modules of the blocks, embeds them into cocycles, and derives the hypotheses from a residually multiplicity-free determinant and through finite free extensions (1.8c); passes to Selmer groups with local conditions, local defects and the coboundary terms of a non-unit `δ` (1.8d); and proves the general bound with local defects, for an absolutely irreducible block and characters, with the places split into rows and columns, the orthogonality of cut cocycles to a dual family, and an element `E` with `E² = δE` built from one group element (1.8e).

## Conventions

`O` is a discrete valuation ring with fraction field `K`, normalized valuation `v`, uniformizer `ϖ` and residue field `k`; `length_O` is the length of an `O`-module, possibly infinite, and for a nonzero ideal `I ⊆ O`, `v(I)` is the valuation of a generator, which is `length_O(O/I)` (for the congruence ideals, [FormalProof], `Formalism/CharacterColumnKernels/StatementN.lean` (`Formalism.NG.vcc`)). Completeness of `O` and finiteness of its residue field are assumed only where a statement says so. `K/O` is the quotient of `K` by `O`, with the discrete topology; for a representation on a free `O`-module `T`, `T ⊗ K/O` carries the induced action. For an ideal `J` of a ring acting on `M`, `M[J] = {m ∈ M : Jm = 0}`.

In the split case (1.7a), `X` is a finite set, `A ⊆ O^X` an `O`-subalgebra separating the points, `λ_x : A → O` evaluation at `x`, `V_x` the `x`-eigenspace of `M_K = M ⊗ K`, `mult(x) = dim_K V_x`, and `𝔞_Y = {f ∈ A : f|_Y = 0}` for `Y ⊆ X`; 1.7a fixes the rest of this notation, and 1.8c–1.8e use it with the notation `𝒜`, `y_γ`, `Y`, `Y_s`, `ψ_b` and `c(π)` that 1.8c introduces.

For a profinite group `G` and a discrete `O`-module with a continuous action, `H^i` is continuous cohomology (ProfiniteCohomology Layer 1), with explicit cocycles and coboundaries in degrees `1` and `2` as in ProfiniteCohomology §2.1, compared with it in ProfiniteCohomology §3.2; for the lattice coefficients of 1.8e (Col) and (3a), continuous cochains into inverse limits are those of ArithmeticGaloisDuality §R02.1.2. Selmer groups of local conditions are those of SelmerIwasawaCohomology §§2.1–2.9.

Notation and conventions not restated here are those of PadicFamilies, its Conventions and §§1.7–1.8 (the raw congruence module `Ψ_λ(M)` and the congruence ideal `η_λ` of an augmentation `λ : A → O`).

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. Every section carries both labels. The forms stated beside
those of [FormalProof] that are not statements of [FormalProof] are named in the first label: the congruence module along a
central idempotent of a general finite algebra (1.7a (1), (2)), the generic form (1) and the form (2) over every residue
field of 1.8b, the form over every residue field and the clauses (3), (4) of 1.8c, the refinement in 1.8d (3′) and the
case `t = 1` of 1.8e (4).

**Corollaries of general theorems.** A section may carry, as a third line under these two labels,
`*Corollary of:*`, which names a general theorem and the roadmap section that states it, and the
clauses it covers when it does not cover the whole section. The general theorem is proved in the
roadmap that states it, and what the line covers is deduced from it. The proof of the Riemann
hypothesis for Dirichlet L-functions needs only that case, not the general theorem in full: the
`*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the
statement when that proof has a narrower one. Where the route given with the section is not the
deduction, it is a second proof, [FormalProof]'s unless the label says that it differs; the
`*Needs:*` line lists what that route needs, and the deduction needs the section that the `*Corollary
of:*` line names.

## Layer 1: Congruence modules and Ribet-type length bounds

PadicFamilies §1.7 defines the raw congruence module `Ψ_λ(M) = M/(M[𝔭_λ] + M[I_λ])` of one augmentation `λ : A → O`, with its functoriality, its annihilation by `𝔭_λ + I_λ` and the identification `Ψ_λ(A) = A/(I_λ + Ann_A(I_λ))`, PadicFamilies §1.7a the congruence module of a commutative `O`-algebra, finite and free, along an idempotent of `A ⊗ K`, and PadicFamilies §1.8 the congruence ideal `η_λ = λ(Ann_A(ker λ))` with `Ψ_λ(A) ≅ O/η_λ` under the double-annihilator identity. This layer adds the congruence module of a module `M` along a central idempotent of `A ⊗ K` and its symmetry, its form relative to a set of points of a split algebra, the relative congruence ideal at a point of a set and the length bound by multiplicities (1.7a, which reduces to PadicFamilies §1.7 for a single point, as its first Check says); and the Ribet-type bound of a congruence ideal with lengths (1.8b–1.8e).

### 1.7a Congruence modules along an idempotent and relative to a set of points

*Origin:* adapted from Hida (1986), the module of congruences of a decomposition of a Hecke algebra in two factors: what is
published is the case of an algebra acting on itself, which PadicFamilies §1.7a states for a commutative `O`-algebra, finite
and free, along an idempotent of `A ⊗ K`, with its symmetry, finite length, raw-annihilator form and split case; it is the
case `M = A`, `A` commutative, of (1) without its last clause, of (2) and of the first clause of (3). The module form, for a
finitely generated torsion-free `O`-module with an action of a finite `O`-algebra, along a central idempotent of `A ⊗ K` and
relative to a set of points of a split algebra, is this roadmap's: the relative congruence ideal `cc_Z(π)` and the length
bounds (4), (4′) by multiplicities are particular to this proof; the congruence module along a central idempotent for a
general finite `A`, with (1) and (2), is this roadmap's own formulation.

*Method of the formal proof:* the congruence module is formed relative to a set of points of a split algebra, as in (3), and
the family bound (4′) is proved by induction on `S` for a finitely generated `O`-module stable under the `α_π`, one point `π`
at a time: the image of the module modulo the eigenspaces of the other points is torsion-free of rank at most `mult(π)`, so
its quotient by `a_π` has length at most `mult(π)·v(a_π)`, and the part inside the other eigenspaces is treated by the
induction; this is the filtration of the route. [FormalProof] states (4) as well, for a local `A` and an integer `A_α`, and
its last sentence for a local `A` (`Formalism/CharacterColumnKernels/StatementN.lean` (`Formalism.NG.StatCongBoundGood`,
`Formalism.NG.StatCongBound`)), and proves both by the same induction
(`Formalism/CharacterColumnKernels/IdempotentNormalForms/LengthQuotSmulRangeFree.lean` (`Formalism.NG.congBoundGood`,
`Formalism.NG.congBound`)); for a general `A`, (4) is the case of (4′) given in the statement.

Let `O` be a discrete valuation ring with fraction field `K` and normalized valuation `v`, `A` a finite `O`-algebra (not
necessarily commutative or reduced), `M` a finitely generated torsion-free `O`-module with an `O`-linear `A`-action,
`M_K = M ⊗ K`, and `e` an idempotent of the centre of `A ⊗ K`. The **congruence module of `M` along `e`** is
`Ψ_e(M) := eM/(M ∩ eM_K)` (inside `M_K`), and `η_e(M) := length_O Ψ_e(M)`.

**Split algebras.** Let `X` be a finite set and `A ⊆ O^X` an `O`-subalgebra separating the points of `X` (so `A` is reduced,
finite and free over `O`, and `A ⊗ K = K^X`); write `λ_x : A → O` for evaluation at `x`, `V_x ⊆ M_K` for the `x`-eigenspace,
`mult(x) = dim_K V_x`, and for `Y ⊆ X`: `V_Y = ⊕_{x∈Y}V_x`, `e_Y ∈ A ⊗ K` the idempotent of `Y`, `Ψ_Y := Ψ_{e_Y}`,
`η_Y := η_{e_Y}`, and `𝔞_Y = {f ∈ A : f|_Y = 0}`. For `Z ⊆ X` and `π ∈ Z` the **relative congruence ideal** is
`cc_Z(π) := λ_π(𝔞_{X∖Z}) = {f(π) : f ∈ A, f|_{X∖Z} = 0}`.

Prove:

1. (*symmetry*) the kernel of `M → eM/(M ∩ eM_K)` is `(M ∩ eM_K) ⊕ (M ∩ (1−e)M_K)`, so
   `Ψ_e(M) ≅ M/((M ∩ eM_K) ⊕ (M ∩ (1−e)M_K)) ≅ Ψ_{1−e}(M)`, of finite length; `Ψ_e` is functorial in `A`-linear maps and
   compatible with passing to an `A`-stable direct summand of `M`;
2. (*the raw construction*) for commutative `A` torsion-free over `O` (so `A ⊆ A ⊗ K`), put `𝔞_e := A ∩ e(A ⊗ K)`; then `Ann_A(𝔞_e) = 𝔞_{1−e}`,
   `M[𝔞_e] = M ∩ (1−e)M_K`, and `Ψ_e(M) = M/(M[𝔞_e] + M[𝔞_{1−e}])`, the raw annihilator construction of PadicFamilies §1.7 with `𝔞_e` in
   place of `ker λ`; it is killed by `𝔞_e + 𝔞_{1−e}`, and `Ψ_e(A) ≅ A/(𝔞_e + 𝔞_{1−e})`;
3. (*split algebras*) `M[𝔞_Y] = M ∩ V_Y`, so `Ψ_Y(M) = M/(M[𝔞_Y] + M[𝔞_{X∖Y}])` and `η_Y(M)` is the length of
   the quotient of `M` by `(M ∩ V_Y) ⊕ (M ∩ V_{X∖Y})`; `cc_Z(π)` is a nonzero ideal of `O`, increasing in `Z`, and `cc_{{π}}(π) = η_{λ_π}`
   (PadicFamilies §1.8);
4. (*length bound*) let `Z′ ⊆ Z ⊆ X` and `α ∈ End_O(M)` commuting with `A`, acting on `V_x` by a nonzero `A_α ∈ O` for
   `x ∈ Z′` and by `0` for `x ∈ Z ∖ Z′`. Then `η_{Z′}(M) ≤ Σ_{π∈Z′} mult(π)·(v(cc_Z(π)) + v(A_α))`; in particular
   `η_Z(M) ≤ Σ_{π∈Z} mult(π)·v(cc_Z(π))`;

   (4′) (*a family of endomorphisms*) let `S ⊆ X` and, for each `π ∈ S`, `α_π ∈ End_O(M)` commute with `A`, kill `V_x` for every
   `x ∉ S` and act on `V_π` by `a_π ∈ O ∖ {0}`. Then `η_S(M) ≤ Σ_{π∈S} mult(π)·v(a_π)`. Nothing is asked of `α_π` on `V_x` for the other
   `x ∈ S`. (4) is the case `S = Z′`, `α_π := f_π·α` with `f_π ∈ 𝔞_{X∖Z}` and `f_π(π)` a generator of `cc_Z(π)`.

`O` any discrete valuation ring; finiteness of the residue field and completeness are not needed; the Dedekind version
follows by localization. `Suggested.lean` states the last sentence of (4) as
`length_quot_annihilators_le_sum_rank_mul_relCongruence` and (4′) as
`length_quot_annihilators_le_sum_rank_mul_of_endomorphisms`, with `Ψ` in the form of (3).
The congruence module along a central idempotent for a general finite `A`, with (1) and (2), is this roadmap's; [FormalProof]
has the congruence module only relative to a set of points of a split algebra, the case of (3), which is the case used.
For the split-case notation and (3): [FormalProof], `Formalism/CharacterColumnKernels/StatementN.lean` (`Formalism.NG.Vx`),
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.BasicNotions.ccAt`). The last sentence of (4) follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/LenUnitLeOfFamily.lean`
(`GlobalTheory.EtaFromCut.congMod_le_of_family`), `Formalism/CharacterColumnKernels/StatementN.lean` (`Formalism.NG.CongMod`).

*Route.* (1) For `m ∈ M`, `em ∈ M` exactly when `(1−e)m ∈ M`, and then `m = em + (1−e)m` with both summands in `M`; the map
`M → eM` is onto, and `e` central makes everything `A`-linear. (2) `𝔞_e ⊗ K = e(A ⊗ K)`, so `m` is killed by `𝔞_e` exactly
when `em = 0`; and `a·𝔞_e = 0` exactly when `ae = 0`. (3) is (2) with `e = e_Y`, `𝔞_{e_Y} = 𝔞_{X∖Y}`. (4) Let `U = e_{Z′}M`
and `Q = Ψ_{Z′}(M)`; for `f ∈ 𝔞_{X∖Z}` the operator `fα` kills `V_x` for `x ∉ Z` and for `x ∈ Z ∖ Z′`, so
`A_αf·e_{Z′}m = fα(m) ∈ M ∩ V_{Z′}`, and `Q` is killed by every `A_αf`. Order `Z′ = {π_1, …, π_s}` and filter `U` by
`U_k = U ∩ ⊕_{i≤k}V_{π_i}`: `gr_kU` is free of rank `mult(π_k)`, `A` acts on it through `λ_{π_k}`, and `gr_kQ` is a quotient
of `(O/A_α·cc_Z(π_k))^{mult(π_k)}`. Summing the lengths gives the bound. (4′) Put `U := e_SM` and `Q := Ψ_S(M) = U/(M ∩ V_S)`. For
`m ∈ M`, `α_π(m) = α_π(e_Sm)` (`α_π` kills `(1 − e_S)m ∈ V_{X∖S}`), so `α_π` maps `U` into `M ∩ V_S ⊆ U`, and `Q` is killed by every
`α_π`. Order `S = {π_1, …, π_s}` and filter `U` by `U_k = U ∩ ⊕_{i≤k}V_{π_i}`: for `u ∈ U_k`, `α_{π_k}u ∈ M ∩ ⊕_{i≤k}V_{π_i}` and
`a_{π_k}u − α_{π_k}u ∈ U_{k−1}` (both act by `a_{π_k}` on `V_{π_k}`); so `a_{π_k}` kills `gr_kQ`, a quotient of `gr_kU`, which embeds in `V_{π_k}`
as a finitely generated `O`-module of rank at most `mult(π_k)`. Hence `length gr_kQ ≤ mult(π_k)·v(a_{π_k})`, and summing gives the bound.
The endomorphisms for different points are not compared, so the sets on which they act by nonzero scalars may overlap. See [FormalProof] for the length bound with its
filtration proof, and for (4′) in it
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/LenUnitLeOfFamily.lean` (`GlobalTheory.EtaFromCut.congMod_le_of_family`); [Hida], §0, §3 ((3.9a), (3.11)) and §6, for congruence modules of Hecke algebras.

**Checks.**

- `Y = {x}` in a split algebra: `Ψ_{{x}}(M) = Ψ_{λ_x}(M)` of PadicFamilies §1.7, since `ker λ_x = 𝔞_{{x}}` and `Ann_A(ker λ_x) = 𝔞_{X∖{x}}`.
- (*the indices*) `A = M = O × O`, `Y = {1}`: `𝔞_Y = 0 × O`, and `M[0 × O] = O × 0 = M ∩ V_Y`; writing `M[𝔞_{X∖Y}] = M ∩ V_Y`
  instead would give `0 × O`.
- `A = {(a, b) ∈ O² : a ≡ b mod ϖⁿ}`, `M = A`, `Z = Y = {1}`: `cc_Z(1) = ϖⁿO`, `η_Y(A) = n`, and the bound is an equality.
- The multiplicity is needed: for the same `A` and `M = A^m`, `η_{{1}}(M) = mn = mult(1)·v(cc(1))` with `mult(1) = m`.
  For this free `M`, SerreWeightAndLevelOptimisation §1.3 gives the same length for its congruence functor, `(O/η_λ)^m`
  with `η_λ = ϖⁿO`.
- `Ψ_Y(M)` depends on `M`, not only on `A`: for `M = O^X` (with `A` acting coordinatewise) `Ψ_Y(M) = 0` for every `Y`,
  although `cc_Y(1) = ϖⁿO`; the bound is an inequality.
- (*an algebra not given inside `O^X`*) `A = O[t]/(t² − ϖ^{2n})`, `e = (1 + t/ϖⁿ)/2` (residue characteristic odd), `M = A`: `Ψ_e(A) ≅ O/ϖⁿ`,
  the congruence between the two points `t = ±ϖⁿ`, recovered by the split case after `A ↪ O × O`, `t ↦ (ϖⁿ, −ϖⁿ)`.
- (*torsion-freeness in (2)*) `A = O[ε]/(ε², ϖε)`, `e = 1`: reading `𝔞_e` as a preimage, `𝔞_1 = A` and `𝔞_0 = kε`, while
  `Ann_A(A) = 0 ≠ kε`: (2) needs `A ⊆ A ⊗ K`.

*Needs:* PadicFamilies §§1.7, 1.8; Mathlib `Module.length`, `IsIdempotentElem`.

### 1.8b Lengths from generic determinants of block homomorphisms

*Origin:* adapted from Johnston and Nickel (2013): the one-block case and the Morita step, the Fitting ideal of a module over
a matrix ring being generated by determinants of square arrays of relations; here one array serves several block
homomorphisms at once, over a residue field with more than `g·Σ_b d_b` elements (1′). The generic form (1) and the form (2)
over every residue field are this roadmap's own formulation.

*Method of the formal proof:* for (1′), with `Rel` the left span of the rows of one relation matrix `P` with finitely many
rows, one left multiplier `C` is chosen and `Θ = C·P`: for each block a Smith normal form of `ψ_b(P)` singles out a minor
such that any multiplier making it a unit gives `C·P` the same solutions in `((K/O)^{d_b})^g` as `P`; modulo `ϖ` these
minors are nonzero polynomials in the coefficients of a general multiplier, that of the block `b` of total degree at most
`g·d_b`, so over a residue field with more than `g·Σ_b d_b` elements their product has a non-root, which lifts to one
multiplier good for every block; the length of the solution module of a square array is then read as the valuation of its
determinant. The step beyond the one-block statement is this general-position choice of a single multiplier. The route
below reaches (1′) otherwise: one optimal array for each block, combined generically, the contents of the determinants being
compared by Gauss's lemma.

Let `O` be a discrete valuation ring with fraction field `K` and normalized valuation `v`, `𝒜` an `O`-algebra (not
necessarily commutative), `B` a finite set and `ψ_b : 𝒜 → M_{d_b}(O)` surjective `O`-algebra homomorphisms (`b ∈ B`),
`g ≥ 1`, and `Rel ⊆ 𝒜^g` a left `𝒜`-submodule. For a `g × g` array `Θ` over `𝒜` write `ψ_b(Θ)` for the
`gd_b × gd_b` matrix over `O`. Let `J ⊆ O` be an ideal that contains every coefficient of the polynomial
`∏_{b∈B} det ψ_b(Σ_{k=1}^m X_kΘ_k) ∈ O[X_1, …, X_m]`, for every `m` and every `m`-tuple of `g × g` arrays `Θ_k` whose
rows lie in `Rel`. Prove:

1. `length_O(O/J) ≤ Σ_{b∈B} length_O Sol_b`, `Sol_b = {u ∈ ((K/O)^{d_b})^g : Σ_qψ_b(θ_q)u_q = 0 for all θ ∈ Rel}`;
2. for one block (`#B = 1`) the ideal generated by the determinants `det ψ_b(Θ)` of arrays with rows in `Rel` already has
   colength `length Sol_b`.

   (1′) (*one array, large residue field*; *the form of the formal proof*) if `Rel` is finitely generated and the residue
   field of `O` has more than `g·Σ_{b∈B}d_b` elements, there is one `g × g` array `Θ` with rows in `Rel` such that
   `v(det ψ_b(Θ)) = length_O Sol_b` for every `b ∈ B` at once (both sides infinite together). Consequently, under these two
   hypotheses, an ideal `J` containing `∏_{b∈B} det ψ_b(Θ)` for every `g × g` array `Θ` with rows in `Rel` satisfies
   `length_O(O/J) ≤ Σ_b length_O Sol_b`. For one block (more than `g·d_b` elements) this is the form of the formal proof
   of (2). [FormalProof] states (1′) as `Formalism/CharacterColumnKernels/IdempotentNormalForms/GenFin.lean`
   (`Formalism.NG.genericFin`), with `Rel` the left span of the rows of one matrix with finitely many rows, and reads
   `v(det ψ_b(Θ))` as a length by `Formalism/CharacterColumnKernels/IdempotentNormalForms/LengthKerOfDetEqZero.lean`
   (`Formalism.NG.lenKer`). The route below does not use finite generation: `R_b ⊆ O^{gd_b}` is finitely generated for
   every `Rel`.

`Suggested.lean` states (1) as `length_quot_le_sum_length_blockSolutions` and (1′) as
`length_quot_le_sum_length_blockSolutions_of_card_residueField`.

`O` any discrete valuation ring; the Dedekind version follows by localization. Infinite lengths are allowed on the right.
The generic form (1) and the form (2) over every residue field are this roadmap's; for (2), an array whose `gd_b` rows form a
basis of the lattice `R_b` of the route has `v(det ψ_b(Θ)) = length Sol_b`, and every array with rows in `Rel` has at least
that, its rows lying in `R_b` (both are infinite when `R_b` has not full rank).

*Route.* Three steps. (Morita) `ψ_b` is onto `M_{d_b}(O)` and `Rel` is a left `𝒜`-module, so `ψ_b(Rel)` is the set of
`d_b × gd_b` matrices all of whose rows lie in one `O`-submodule `R_b ⊆ O^{gd_b}`; `Sol_b` is the Pontryagin dual of
`O^{gd_b}/R_b`. (Smith normal form; AInfCohomology §AI.1.3) If `R_b` has full rank there is one array `Θ_b` with rows in `Rel` and
`v(det ψ_b(Θ_b)) ≤ length Sol_b`: choose `gd_b` vectors of `R_b` spanning a sublattice of the same colength and group them in
`g` rows of `d_b`; otherwise `Sol_b` has infinite length. (Gauss's lemma in `O[X_1, …, X_m]`) For the generic array `Σ_bX_bΘ_b`, write each
`F_b = det ψ_b(Σ_kX_kΘ_k)` as `c_b·G_b` with `c_b ∈ O` a generator of the ideal of the coefficients of `F_b` and `G_b` of unit
content (some coefficient a unit); the reductions of the `G_b` modulo `ϖ` are nonzero in `k[X_1, …, X_m]`, which is a domain,
so the product of the `G_b` has unit content, and some coefficient of `∏_bF_b` is `∏_bc_b` times a unit and lies in
`J`; and `c_b` divides `F_b(e_b) = det ψ_b(Θ_b)`. Over a small residue field a hypothesis on single arrays does not
suffice, because no single array need be optimal for all blocks at once (third Check). Over a residue field with more than
`g·Σ_bd_b` elements one array is optimal for all blocks: this is (1′), the form in which [FormalProof] states and uses the
lemma. For it (the blocks with `Sol_b` of infinite length aside, where every determinant is `0`), the reduction modulo `ϖ` of
`∏_bG_b` is a nonzero polynomial of degree at most `g·Σ_bd_b` in the variables `X_b`, so it has a non-root with coordinates
in the residue field; for a lift `a ∈ O^B` of it and `Θ := Σ_ba_bΘ_b`, `det ψ_b(Θ) = c_b·G_b(a)` with `G_b(a)` a unit, so
`v(det ψ_b(Θ)) = v(c_b) ≤ v(det ψ_b(Θ_b)) ≤ length Sol_b`, and no array with rows in `Rel` has a smaller valuation (the rows
of its image under `ψ_b` lie in `R_b`). (1), with the generic array and no condition on the residue field, is this roadmap's
variant; where (1′) applies, (1) follows from it, since `∏_b det ψ_b(Θ)` is the coefficient of `X_1^{gΣd_b}` of the generic
determinant for `m = 1`. *Needs:* Mathlib `Matrix.det`, `MvPolynomial.map` with `MvPolynomial.coeff_map` and the instance making
`MvPolynomial σ k` a domain over a domain `k` (the reduction modulo `ϖ` above), Smith normal form over a PID, `Module.length`;
AInfCohomology §AI.1.3 (diagonal form and `Fitt₀` over a valuation ring).

**Checks.**

- `𝒜 = O`, one block of size `1`, `g = 1`, `Rel = ϖⁿO`: the smallest admissible `J` is `ϖⁿO` and `Sol = (K/O)[ϖⁿ]`; both
  lengths are `n`.
- `𝒜 = O × O` with the two projections, `g = 1`, `Rel = ϖ^aO × ϖ^bO`: the smallest admissible `J` is `ϖ^{a+b}O` and the
  two solution modules have lengths `a` and `b`; the bound adds the blocks. The array `(ϖ^a, 0)` alone has product of
  determinants `0`, while the array `(ϖ^a, ϖ^b)` is optimal for both blocks.
- (*single arrays over a small residue field*) `O = ℤ_2`, `𝒜 = {(a, b, c) ∈ O³ : a ≡ b ≡ c mod 2}` with its three
  projections, `g = 1`, `Rel = 𝒜·(2, 0, 2) + 𝒜·(0, 2, 2)`: each `Sol_b` is `(K/O)[2]`, the generic determinant of the two
  generators is `8X_1X_2(X_1 + X_2)` and the smallest admissible `J` is `8O`, of colength `3`. A single element of `Rel` is
  `(2a_1, 2b_2, 2(a_3 + b_3))` with `a, b ∈ 𝒜`, and the three coordinates have valuation `1` only if `ā = 1`, `b̄ = 1` and
  `ā + b̄ = 1` in `𝔽_2` (`ā`, `b̄` the common residues of the coordinates of `a`, `b`): the products of single arrays
  generate `16O`, of colength `4 > 3`. Here `g·Σ_bd_b = 3 > 2 = #k`.

### 1.8c Congruence ideals at a reducible point are bounded by extension modules

*Origin:* adapted from Urban (2001), Theorem 1.1, as quoted in Berger (2009), Theorem 7: the bound of a congruence ideal by
the length of a module of extensions, for two blocks, is extended to any number of matrix blocks at one reducible point,
relative to a set of points, with the lengths of all blocks summed; the vanishing of the determinant of a square array of
relations at a point where the relations have a nonzero solution is Dasgupta (2023), Lemma 4.5, for `GL₂` and two
characters. The form over every residue field and (4) are this roadmap's own formulation; (3) is the classical unit case,
after Ribet (1976) and Bellaïche and Chenevier (2009).

*Method of the formal proof:* `Y_s` is presented by a relation matrix over `𝒜`; 1.8b (1′) gives one square array of
relations optimal for every block at `π`, whose determinant is by (P) a function in `A` and vanishes at every point of
`Xs ∖ Z`, where the relations have a nonzero solution; after a descent along a finite cover, as in (5), its value at `π` lies
in `c(π)`, and it is the product of the block determinants, whose valuations are the lengths of the solution modules. The
step beyond the published two-block argument is that one determinant controls all blocks at once.

Let `O`, `K`, `X`, `A ⊆ O^X` be as in the split case of 1.7a, `G` a group, `r_x : G → GL_n(O)` (`x ∈ X`) representations,
and `𝒜 ⊆ ∏_{x∈X}M_n(O)` the `A`-span of the elements `r(g) = (r_x(g))_x`, `g ∈ G`. Let `χ : G → O^×` be a character,
`Xs ⊆ X`, `Z ⊆ X`, `π ∈ Xs ∩ Z`, and `c(π) := {f(π) : f ∈ A, f|_{Xs∖Z} = 0}`. Consider the hypotheses:

- (P) for all `m, k` and every `m × m` array `Θ` over `𝒜 ⊗_O O[X_1, …, X_k]`, the polynomial `x ↦ det Θ(x)` (of the
  `mn × mn` matrix at `x`) has its coefficients in `A`;
- (D) over `K`, `r_π` is conjugate to a block sum `⊕_{b∈B}ρ_b` with `ρ_b : G → GL_{d_b}(O)`, one block `b₀` equal to `χ`,
  and the block maps `ψ_b : 𝒜 → M_{d_b}(O)` (evaluation at `π` followed by the `b`-th block) are defined and surjective;
- (E) there is `E ∈ 𝒜` with `E(x) ≠ 0` for `x ∈ Xs ∖ Z` and `E(π) = δ·(projector onto the χ-line)`, `δ ∈ O ∖ {0}`;
- (N) for `x ∈ Xs ∖ Z` no nonzero vector of `K^n` is fixed by `χ^{−1}r_x`.

Put `y_γ := (χ(γ)^{−1}r(γ) − 1)E ∈ 𝒜`, `Y := Σ_γ𝒜y_γ` and `Y_s` its image in `∏_{x∈Xs}M_n(O)`. Prove:

1. under (P), (D), (E), (N): `length_O(O/c(π)) ≤ Σ_{b∈B} length_O Hom_𝒜(Y_s, O^{d_b} ⊗ K/O)`, with `𝒜` acting on `O^{d_b}`
   through `ψ_b`;
2. `φ ↦ (γ ↦ φ(y_γ))` embeds `Hom_𝒜(Y_s, O^{d_b} ⊗ K/O)` into the `1`-cocycles `Z¹(G, ρ_b ⊗ χ^{−1} ⊗ K/O)`, and the
   embedded cocycles of the block `b₀` are homomorphisms `G → K/O`;
3. (*supply of the hypotheses*) suppose `O` is complete and `A` local, `D : A[G] → A` is a determinant of dimension `n`
   whose specialisation at every `x ∈ X` is `det∘r_x`, `r_π ⊗ K ≅ ⊕_{b∈B}ρ_b ⊗ K` with `ρ_b : G → GL_{d_b}(O)` whose
   reductions `ρ̄_b` are absolutely irreducible and pairwise non-isomorphic, `ρ_{b₀} = χ`, and
   `Z ⊇ {x ∈ Xs : χ ⊂ r_x ⊗ K}`. Then (P), (D), (E) and (N) hold, with `E` an idempotent (`δ = 1`);
4. (*determinants of arrays*) if the coefficients of the characteristic polynomials of the `r(g)`, `g ∈ G`, lie in `A` (as
   functions of `x`), then (P) holds; the converse is the case `m = 1`, `Θ = X_1 − r(g)`. This applies in particular when a
   determinant `D : A[G] → A` of dimension `n` specialises at every `x ∈ X` to `det∘r_x`;
5. (*finite free extensions*) let `A[T]/(P)` with `P ∈ A[T]` monic of degree `k`, let `X′` be the set of pairs `(x, α)`,
   `α ∈ O` a root of `P_x`, and let `A′ ⊆ O^{X′}` be the image of `A[T]/(P)` under evaluation on `X′` (an `O`-subalgebra separating
   the points of `X′`, so a split algebra as in 1.7a; the evaluation need not be injective, for instance when some `P_x`
   has a multiple root or a root outside `O`, and `A → A′` need not be injective, when some `P_x` has no root in `O`). Suppose `P_π` has a root `α_π ∈ O`, and `P_x` has `k` distinct roots in `O` for
   every `x ∈ Xs ∖ Z`. Then for `π′ := (π, α_π)`, `{f(π′) : f ∈ A′, f vanishes at every point of X′ over Xs ∖ Z} ⊆ c(π)`: the
   bound (1) over `A′` (with `Xs′`, `Z′` the points over `Xs`, `Z`, and `r_{(x,α)} := r_x`) bounds `length_O(O/c(π))`.

When every block is a character `χ_b`, `d_b = 1` and the bound reads `length_O(O/c(π)) ≤ Σ_b length_O Hom_𝒜(Y_s, K/O)`, with `𝒜`
acting on the `b`-th copy of `K/O` through `ψ_b` (so `r(g)` acts by `χ_b(g)`); by (2) the elements of these modules are cocycles for
the ratios `χ_bχ^{−1}`, which do not define an action of `𝒜`.

`G` any group, no topology; continuity is added in 1.8d. `O` any discrete valuation ring in (1), (2), (4), (5). `Xs` is a
parameter: on `Xs = X`, `c(π) = cc_Z(π)` of 1.7a; for smaller `Xs` it is the ideal relative to the points kept.

*The form of the formal proof.* [FormalProof] proves (1) when the residue field of `O` has more than `g·n` elements, `g` the
number of generators of the `𝒜`-module `Y_s` (as in the route), and with (P) in the form without variables (for every `m` and
every `m × m` array `Θ` over `𝒜`, the function `x ↦ det Θ(x)` lies in `A`), through 1.8b (1′):
`Formalism/CharacterColumnKernels/IdempotentNormalForms/GlobalConcreteOf.lean` (`Formalism.NG.globalConcrete`), stated over
a finite cover as in (5). The statement for every
residue field, through (P) with variables and 1.8b (1), is this roadmap's variant. (3) and (4) are this roadmap's. In place of
(3), [FormalProof] takes (P), (D), (N), the idempotents `e_B`, `e₁` and the element of 1.8e (4) as hypotheses and uses no
idempotent `E` cutting out the `χ`-line, its characters being congruent to one another at small primes; (3) is the classical
unit case ([Ribet76], [BC09]). In place of (4) it has: if for every `m` and all `a_1, …, a_m ∈ 𝒜` the coefficients of
`x ↦ det(Σ_iX_ia_i(x))` lie in `A`, then (P) holds in the form without variables
(`Formalism/CharacterColumnKernels/IdempotentNormalForms/IsUnitDetOfConst.lean` (`Formalism.NG.blockDet`)).
For the ideal `c(π)` and the elements `y_γ`: [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/GlobalCore.lean` (`GlobalTheory.Cut.ccOff`),
`Formalism/CharacterColumnKernels/StatementN.lean` (`Formalism.NG.ycoc`),
`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.yg`). For (2):
[FormalProof], `Formalism/CharacterColumnKernels/StatementPsi.lean` (`Formalism.NG.colPsi`). (5) follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.VanishingLemma`).

*Route.* (1) Choose `γ_1, …, γ_g` with `Y = Σ_q𝒜y_{γ_q}` and let `Rel ⊆ 𝒜^g` be the relations among the `y_{γ_q}` on `Xs`, so
that `𝒜^g/Rel ≅ Y_s`. Every coefficient of the generic determinant of an array of relations is a function in `A` by (P),
and it vanishes at `x ∈ Xs ∖ Z`: by (E) and (N) some `y_γ(x)u ≠ 0`, so `(y_{γ_q}(x)u)_q` is a nonzero solution of every
relation at `x`. Hence its value at `π` lies in `c(π)`, and by (D) that value is `∏_b det ψ_b` of the array; 1.8b with
`J = c(π)` gives the bound, the solution modules being `Hom_𝒜(𝒜^g/Rel, O^{d_b} ⊗ K/O)`. (2) `y_{γγ′} = χ^{−1}r(γ)y_{γ′} + y_γ`,
and the `y_γ` generate `Y`. (4) Write `Θ(x) = Σ_{i,j,g}E_{ij} ⊗ a_{ijg}(x)r_x(g)` in `M_m(M_n(O[X_1, …, X_k]))`, `a_{ijg} ∈ A[X_1, …, X_k]`.
Amitsur's formula (IntegralHeckeAndGaloisDeterminants §0.5, applied to the determinant of `M_{mn}`; for honest matrices
`det(1 − τΣ_lB_l) = ∏_{w Lyndon}det(1 − τ^{|w|}w(B))`) writes `det Θ(x)`, the top characteristic coefficient, as an integer
polynomial, independent of `x`, in the characteristic coefficients of words of length at most `mn` in the
`B = E_{ij} ⊗ a_{ijg}(x)r_x(g)`. A word is `0` or `E_{ab} ⊗ (∏a)(x)·r_x(g_1⋯g_l)`; its characteristic polynomial is trivial if
`a ≠ b` (it is nilpotent) and is that of `(∏a)(x)·r_x(g_1⋯g_l)` in dimension `n` if `a = b`. So `det Θ(x)` is the value at `x`
of a polynomial with coefficients in `A[X_1, …, X_k]` in the coefficients of the characteristic polynomials of the `r(g)`.
Under `D`, these are the characteristic coefficients of `g` (IntegralHeckeAndGaloisDeterminants §0.2), which lie in `A`.
For `m = 1` (4) is also the descent of IntegralHeckeAndGaloisDeterminants §0.5 (*A determinant descends to the subring of
its coefficients*), applied to the `O^X`-valued determinant `det∘r`.
(5) Lift `f ∈ A′` to `Σ_{i<k}f_iT^i`, `f_i ∈ A`. If `f` vanishes at the `k` points over `x ∈ Xs ∖ Z`, the Vandermonde matrix
of the distinct roots of `P_x` is invertible over `K`, so every `f_i(x) = 0`; hence `f_i(π) ∈ c(π)` and `f(π′) ∈ c(π)`. The
hypothesis (P) over `A′` holds by (4): the coefficients of the characteristic polynomials of the `r(g)`, as functions on `X′`, lie in
the image of `A` in `A′`.
(3) (P) is (4). (D): since `r_π ⊗ K = ⊕ρ_b ⊗ K`,
the compression to the block `b` of an element of `𝒜(π)` is an algebra map, with image the `O`-span of `ρ_b(G)` (`A` acts at
`π` through `λ_π`), which is `M_{d_b}(O)` because `ρ̄_b(G)` spans `M_{d_b}(k)` (ArithmeticGaloisRepresentations §1.7,
*Absolute irreducibility*) and by Nakayama. (E): `𝒜` is finite
over the complete local `A`; every `r̄_x` has semisimplification `⊕_bρ̄_b`, because the residual determinant `D ⊗ k`
determines it (IntegralHeckeAndGaloisDeterminants §1.2) and is the same for all `x` (`A` is local); the simple
`𝒜`-modules are therefore the `ρ̄_b`, and `𝒜/Rad(𝒜) ≅ ∏_bM_{d_b}(k)`. The idempotent of the factor of `χ̄` lifts to an
idempotent `E ∈ 𝒜` (IntegralHeckeAndGaloisDeterminants §1.3, Henselian lifting of matrix units). At every `x`, `E(x)` acts on
the composition factors of `r̄_x` as the projector onto the factor `χ̄`, which occurs once, so `E(x)` is an idempotent of
rank one, in particular nonzero; at `π`, `ψ_b(E)` is an idempotent of `M_{d_b}(O)` with reduction `0` for `b ≠ b₀` and `1`
for `b₀`, so `E(π)` is the projector onto the `χ`-line. (N) is the definition of `Z`. The hypotheses (D) and (E) say that `π`
lies on the locus where the residually multiplicity-free determinant splits into the blocks `ρ_b`, which is the total
reducibility locus of the generalized matrix algebra (IntegralHeckeAndGaloisDeterminants §§1.3–1.4); a constituent of
`r_π ⊗ K` with reducible reduction, or `χ` not among the constituents, breaks (D). Sources: [Ribet76], §§2–4; [BC09], Sections 1.3–1.5; [FormalProof] for (1) over a large residue field, (2) and (5).
(2) is a neighbouring form, with cocycles and `K/O` coefficients at one point, of the injection of extension modules into
extensions of IntegralHeckeAndGaloisDeterminants §1.4 (*GMA extension module*, *Off-diagonal extension injection*; [BC09],
Section 1.5), whose qualitative rank-two case is *Classical Ribet lattice* in the same section. The two-dimensional
integral Ribet theorems with Fitting ideals over the family ring are IntegralHeckeAndGaloisDeterminants §§6.1, 6.7 and,
with local conditions, IntegralIwasawaTheory §9.6; neither they nor (1) contain the other. In the polarized three-block form of the method,
the polarization and the vanishing of the abelian term isolate the Selmer group of the middle
block; 1.8c–1.8d are the unpolarized form, with the lengths of all blocks summed.
*Needs:* 1.7a, 1.8b;
IntegralHeckeAndGaloisDeterminants §§0.2 (characteristic coefficients), 0.5 (Amitsur's formula, descent), 1.2
(determinants and semisimple reconstruction), 1.3 (Henselian lifting of matrix units), 1.4 (reducibility ideals);
ArithmeticGaloisRepresentations §1.7 (absolute irreducibility); ProfiniteCohomology §2.1 (explicit cocycles).

**Checks.**

- (*a computed two-point case*) `X = Xs = {π, x}`, `A = {(a, b) : a ≡ b mod ϖ^m} ⊆ O²`, `r_π = χ ⊕ χ′` with `χ̄ ≠ χ̄′`,
  `Z = {π}`, so `c(π) = ϖ^mO`. (a) Irreducibility of `r_x` (a Ribet lattice) forces neither the term of the block `χ` to vanish
  nor the bound to be an equality. Take odd residue characteristic, `G` free on `g_1, …, g_4`, `χ = 1`, `r_π = (D, I, I, I)` on the
  generators with `D = diag(1, −1)` (so `χ′(g_1) = −1`), `r_x = (D, (1 + ϖ^m)I, I + ϖ^mE_{12}, I + ϖ^mE_{21})`, absolutely irreducible (the
  two transvections have no common eigenline), and `E := (1 + r(g_1))/2`. Then `Y_s` is `ϖ^mO²` placed in the first column at `x`
  (and `0` at `π`), and both `Hom_𝒜(Y_s, K/O)`, through `ψ_χ` and through `ψ_{χ′}`, are `(K/O)[ϖ^m]`, of length `m` (the scalar `1 + ϖ^m`
  and the elements `(a, b) ∈ A` kill them by `ϖ^m`, and `D` separates the two coordinates): the bound reads `m ≤ 2m`. (b) If
  `r_x = χ_2 ⊕ χ′` with `χ_2 ≡ χ (mod ϖ^m)`, `χ_2 ≠ χ`, the term of `χ′χ^{−1}` is `0` (`χ̄_2 ≠ χ̄′`) and the block `b₀` carries
  `m` through the homomorphism `(χ_2χ^{−1} − 1)/ϖ^m`: the term of the block of `χ` itself is needed when the characters can
  move.
- `Xs = Z = {π}`: every `f` vanishes on `Xs ∖ Z = ∅`, so `c(π) = O` and the bound is empty; it only sees congruences with
  the points of `Xs ∖ Z`.
- (*why (D) needs the residual blocks*) If `r_π ⊗ K` is irreducible of dimension `2` but `r̄_π` is reducible, the image of
  `𝒜` at `π` is a proper order of `M_2(K)` and no surjection onto `M_2(O)` exists: (3) excludes this by asking the `ρ̄_b` to be
  absolutely irreducible.
- (*why (5) needs distinct roots*) `X = Xs = {π, x}`, `Z = {π}`, `A = {(a, b) : a ≡ b mod ϖ²}`, so `c(π) = ϖ²O`; `P = T² − h`
  with `h = (ϖ², 0) ∈ A`. Then `P_x = T²` has a double root, `f = T` vanishes at the only point `(x, 0)` over `x`, and
  `f(π, ϖ) = ϖ ∉ c(π)`: the congruence ideal over `A′` contains `ϖO`, and a bound for its colength (`≤ 1`) does not bound
  `length_O(O/c(π)) = 2`.

### 1.8d The bound with local conditions

*Origin:* adapted from Berger (2009), proof of Theorem 6, steps (i) and (ii), after Urban (2001), for two blocks: the module of extensions
injects into a Selmer group with local conditions, whose length then bounds the congruence ideal; and from Dasgupta (2023),
§3: the evaluation that excludes coboundaries when the projector onto the character is an idempotent. Here for any number
of blocks, with local defects (2′), and with an element `E`, `E² = δ_A·E`, for a non-unit `δ_A(π)`, at the cost
`2d_b·v(δ_A(π))` in the length bound (3′); nearest published result with a loss: Ophir and Weiss (2024), Theorem 1.3, for
`GL₂` and congruent characters. The refinement in (3′), at the cost `d_b·v(δ_A(π))`, is this roadmap's own formulation.

*Method of the formal proof:* for `E = Σ_g t_g r(g)` with `E² = δ_A·E` and `τ = Σ_g t_g χ(g)`, a homomorphism whose cut
cocycle is the coboundary of `m` sends the element `(E − τ)E` of `Y` to `−δ_A(π)·m`, and applying `E` once more gives
`δ_A(π)²·m = 0`; cocycles modulo coboundaries then map into the Selmer group, and a larger local condition costs the length
of the quotient. The published argument has an idempotent, for which no coboundary occurs; here `E` need not be idempotent
and the loss is recorded.

In the situation of 1.8c let `G` be profinite, the `r_x` and `χ` continuous, and fix closed subgroups `G_v` (`v ∈ 𝒱`) and
local conditions `L_{b,v} ⊆ H¹(G_v, ρ_b ⊗ χ^{−1} ⊗ K/O)`; write `H¹_𝒮(G, ρ_b ⊗ χ^{−1} ⊗ K/O)` for the classes whose
restriction to every `G_v` lies in `L_{b,v}`. Prove:

1. the cocycles of 1.8c(2) are continuous;
2. if every cocycle in the image of `Hom_𝒜(Y_s, O^{d_b} ⊗ K/O)` restricts into `L_{b,v}` at every `v`, then
   `length_O(O/c(π)) ≤ Σ_{b∈B}(length_O C_b + length_O H¹_𝒮(G, ρ_b ⊗ χ^{−1} ⊗ K/O))`, where `C_b` is the module of
   coboundaries among those cocycles;

   (2′) (*local defects*) more generally, if at every `v` the cocycles of the block `b` restrict into an `O`-submodule
   `L̃_{b,v} ⊇ L_{b,v}` with `length_O(L̃_{b,v}/L_{b,v}) ≤ ν_{b,v}`, then the bound of (2) holds with `Σ_{b,v}ν_{b,v}` added (`𝒱` may be
   infinite: if the sum is finite, only finitely many of the `L̃_{b,v}/L_{b,v}` are nonzero);
3. `C_{b₀} = 0`; and if `E² = δ_A·E` for some `δ_A ∈ A` with `δ_A(π) ∈ O^×` (for instance `δ_A ∈ A^×`), then `C_b = 0` for
   every `b`;

   (3′) (*a non-unit `δ`*; *the form of the formal proof*) if `E² = δ_A·E` for some `δ_A ∈ A`, then for every `b ≠ b₀` and
   every vector `m ∈ O^{d_b} ⊗ K/O` whose coboundary `g ↦ (ψ_b(u_g) − 1)m` (`u_g := χ(g)^{−1}r(g)`) is a cut cocycle of the
   block `b`, `δ_A(π)²·m = 0` ([FormalProof], `Formalism/CharacterColumnKernels/IdempotentNormalForms/BlockRhoFull.lean`
   (`Formalism.NG.cobColumn`), for the module with columns of 1.8e). So `δ_A(π)²·C_b = 0`, `length_O C_b ≤ 2d_b·v(δ_A(π))`, and
   `δ_A(π)²·H⁰(G, ρ_b ⊗ χ^{−1} ⊗ K/O) = 0` (the case of the zero cocycle). *Refinement* (this roadmap's): `δ_A(π)·C_b = 0`,
   so `length_O C_b ≤ d_b·v(δ_A(π))`, and `δ_A(π)·H⁰(G, ρ_b ⊗ χ^{−1} ⊗ K/O) = 0` for `b ≠ b₀`; the two together give the
   square on `m`. Both forms hold equally for the homomorphisms of `Y` and of the module with columns of 1.8e: the arguments
   use only the restriction to the image of `Y`.

The cocycles `γ ↦ φ(y_γ)`, `φ ∈ Hom_𝒜(Y_s, O^{d_b} ⊗ K/O)` (1.8c(2)), are the **cut cocycles** of the block `b`.

For `G = G_{F,S}` of a number field and the `G_v` decomposition groups, `H¹_𝒮` is the Selmer group of the local conditions
(SelmerIwasawaCohomology §§2.1–2.9). When all blocks are characters `χ_b`, the bound is a sum of lengths of Selmer groups of
the ratios `χ_bχ^{−1}`. (3) is (3′) with `v(δ_A(π)) = 0`; under the supply 1.8c(3), `δ_A = 1`.

*Route.* (1) The `r_x` are continuous and `Y_s` is generated by finitely many `y_γ`. (2) The map from cocycles to classes has
kernel `C_b`, and its image lies in `H¹_𝒮` by hypothesis. (2′) The classes with restrictions in the `L̃_{b,v}` contain those
with restrictions in the `L_{b,v}` with quotient injecting into the product `∏_vL̃_{b,v}/L_{b,v}`
(SelmerIwasawaCohomology §2.3); when `Σ_vν_{b,v}` is finite only finitely
many factors are nonzero, so the quotient has length at most `Σ_vν_{b,v}`, and when it is infinite there is nothing to prove. (3′) For `b₀` the coefficients are the
trivial module, whose coboundaries are zero (`B¹ = 0` for the trivial action, ProfiniteCohomology §2.1). Put
`u_g := χ(g)^{−1}r(g)`, and let `b ≠ b₀` and
`φ ∈ Hom_𝒜(Y_s, O^{d_b} ⊗ K/O)` with `φ(y_g) = (ψ_b(u_g) − 1)m` for all `g`. (*The form with the square.*) Write
`E = Σ_gt_gr(g)` (`t_g ∈ A`, a finite sum) and `τ := Σ_gt_gχ(g) ∈ A`. The element `y := Σ_gt_gχ(g)·y_g = (E − τ)E` of `Y` has
`φ(y) = ψ_b(E)m − τ(π)m = −δ_A(π)m` (as `ψ_b(E) = 0` and `τ(π) = δ_A(π)`, the scalar by which `E(π)` acts on the `χ`-line)
and `Ey = δ_Ay`; hence `0 = ψ_b(E)φ(y) = φ(Ey) = −δ_A(π)²m`. (*The refinement.*) The `A`-span `I_χ` of the `u_g − 1` is a
two-sided ideal of `𝒜`, equal to the left ideal they generate: `u_h(u_g − 1) = (u_{hg} − 1) − (u_h − 1)` and
`(u_g − 1)u_h = (u_{gh} − 1) − (u_h − 1)`, and `A` is central. For `c = Σ_ga_g(u_g − 1) ∈ I_χ`, `cE = Σ_ga_gy_g ∈ Y`
and `φ(cE) = ψ_b(c)m`. Take
`c = (u_γ − 1)E ∈ I_χ`: then `cE = (u_γ − 1)E² = δ_Ay_γ`, so `δ_A(π)·(ψ_b(u_γ) − 1)m = φ(cE) = ψ_b(u_γ − 1)ψ_b(E)m = 0`, because
`ψ_b(E) = 0` for `b ≠ b₀` by (D) and (E). So every coboundary in `C_b` is killed by `δ_A(π)`; the coboundaries form a quotient
of `O^{d_b} ⊗ K/O`, divisible of corank at most `d_b`, whose `δ_A(π)`-torsion has length at most `d_b·v(δ_A(π))`. For the last
clause, on a vector `m` fixed by every `ψ_b(u_g)`,
`ψ_b(E)m = Σ_gt_g(π)χ(g)·m`, and `Σ_gt_g(π)χ(g)` is the scalar by which `E(π)` acts on the `χ`-line, which is `δ_A(π)`; as
`ψ_b(E) = 0` for `b ≠ b₀`, `δ_A(π)m = 0`. (3) is the case of a unit `δ_A(π)`. Sources: [FormalProof], except the refinement
in (3′). *Needs:* 1.8c; SelmerIwasawaCohomology §§2.1–2.9; ProfiniteCohomology
Layer 1 (continuous cohomology and restriction), §§2.1, 2.3 and 3.2 (explicit cocycles, their restriction and their classes).

**Checks.**

- For a number field `F`, `p` odd, `G = G_F`, `O = ℤ_p` and the unramified condition at every place, the term of the block `b₀`
  is `length Hom(Cl_F, ℚ_p/ℤ_p) = v_p(#Cl_F)` (ClassFieldTheory §13.1, the Hilbert class field, with the unramified condition
  of SelmerIwasawaCohomology §2.7): the class-number term of a Ribet bound.
- With `𝒱 = ∅`, `H¹_𝒮` is all of `H¹(G, ρ_b ⊗ χ^{−1} ⊗ K/O)`, and the bound of (2) follows from 1.8c(1), the cut cocycles
  modulo `C_b` embedding in `H¹`; it is weaker in general. In the two-point case of 1.8c with `O = ℤ_p`, `p` odd, and `G` the free
  profinite group on `g_1, …, g_4`, 1.8c(1) reads `m ≤ 2m`, while the term of the block `χ = 1` in (2) is the length of
  `H¹(G, ℚ_p/ℤ_p) = (ℚ_p/ℤ_p)⁴`, which is infinite. Adding conditions can only lower `H¹_𝒮`, so the hypothesis that the
  cut-out cocycles satisfy them is what carries the arithmetic.
- (*(3′) is an upper bound depending on `E`*) If `E = ϖ^a·e` with `e ∈ 𝒜` an idempotent as in 1.8c(3), then
  `Y = ϖ^a·Y(e)` is isomorphic to the module of `e` and the cut cocycles are the same, so `C_b = 0` by (3) for `e`, while (3′)
  for `E` gives only `length C_b ≤ d_b·a` by the refinement (`2d_b·a` in the form of the formal proof). A choice of `E`
  with smaller `v(δ_A(π))` gives a better bound; (3′) is what is
  available when no `E` with a unit `δ_A(π)` exists (1.8e(4)).

### 1.8e The bound with local defects: columns, rows and a non-unit `δ`

*Origin:* particular to this proof: Ribet's module enlarged by generators that impose the local conditions at some places,
duality at the others, and a projector up to a non-unit built from one group element, with explicit losses. The case
`t = 1` of (4), with the product taken in the corner, is this roadmap's own formulation.

*Method of the formal proof:* the local conditions at the columns are built into the module `Y_c` by adjoining generators
and relations; the determinant of an array of its relations vanishes at the points of `Xs ∖ Z`, because a count of
dimensions at each column gives a nonzero homomorphism there, and equals at `π` the product of the block determinants; the
kernels of `Ψ_b` are then counted block by block from the relations.

**Setting.** In the situation of 1.8d (`G` profinite; (P), (D), (E), (N) of 1.8c at `π ∈ Xs ∩ Z`; local conditions `L_{b,v}`
at the subgroups `G_v`, `v ∈ 𝒱`), suppose that the blocks at `π` are `ρ_0 : G → GL_N(O)` with **absolutely irreducible
reduction** (`ρ̄_0(G)` spans `M_N(k)`) and characters `χ = χ_1, χ_2, …, χ_t` (so `n = N + t` and `b₀ = 1`); that `E` satisfies
`E² = δ_A·E` with `δ_A ∈ A`, and that `δ_A(x) ≠ 0` and `E(x)` has rank one for `x ∈ Xs ∖ Z` (for the element of (4) this is
supplied, not assumed); put `v_δ := v(δ_A(π))` and `u_g := χ(g)^{−1}r(g)`. Let `e₁ ∈ 𝒜` be an idempotent with `e₁(π)` of rank one
on the block `ρ_0` and zero on the others, of rank one at every `x ∈ Xs ∖ Z`, let `T_ρ := O^N` with `ρ_0` and `v₁ ∈ T_ρ` a
generator of the image of `e₁(π)`, and for `x ∈ X` let `V_x := K^n` with `G` acting by `χ^{−1}r_x`. Fix finitely many closed
subgroups `G_w`, `w ∈ Row ⊔ Col`, besides those of 1.8d, and write `h⁰_{b,w} := length_O H⁰(G_w, ρ_b ⊗ χ^{−1} ⊗ K/O)`.

- (Col) For `w ∈ Col`: classes `κ_{w,1}, …, κ_{w,j_w} ∈ H¹(G_w, T_ρ(χ^{−1}))` forming, modulo torsion, a basis of a
  **saturated** submodule `F_w` (one containing the torsion, with `H¹(G_w, T_ρ(χ^{−1}))/F_w` torsion-free); a homomorphism
  `θ_w : G_w → O` generating the local condition of the block `χ`, with some `θ_w(g)` a unit; `e′_w ∈ ℕ` and cochains
  `K_{w,a} : G_w → 𝒜e₁` and `k_w : G_w → 𝒜E` such that `g ↦ ψ_0(K_{w,a}(g))v₁` is a cocycle of class `ϖ^{e′_w}κ_{w,a}` and
  `ψ_1(k_w(g)) = ϖ^{e′_w}δ_A(π)·β_w·θ_w(g)` with `β_w ∈ O^×` independent of `g` (the lifting of the local conditions of `T_ρ` and
  of the trivial lattice along `𝒜e₁ ↠ T_ρ`, `a ↦ ψ_0(a)v₁`, and `𝒜E ↠ δ_A(π)O`, up to `ϖ^{e′_w}`; when the lifting comes from an
  exponent `e` of `p`, as in SelmerLengthBoundsAndLocalLifting §§4.10c–4.10f, `e′_w = e·v(p)`); and, at every `x ∈ Xs ∖ Z`, a
  `K`-subspace `L_{w,x}` of the functions `G_w → V_x` containing the coboundaries `g ↦ (χ^{−1}r_x(g) − 1)s`, the cochains
  `g ↦ K_{w,a}(g)(x)s` (`s ∈ e₁(x)V_x`) and `g ↦ k_w(g)(x)s` (`s ∈ E(x)V_x`), and of dimension at most
  `j_w + dim_K H⁰(G_w, V_x)` modulo the coboundaries.
- (Row) For `w ∈ Row` and every block `b`: the restrictions to `G_w` of the cut cocycles of the block `b` lie in an
  `O`-submodule `L̃_{b,w} ⊇ L_{b,w}` with `length_O(L̃_{b,w}/L_{b,w}) ≤ ν_{b,w}`.

The **module with columns** is
`Y_c := (Y ⊕ ⊕_{w∈Col}(𝒜m_w ⊕ ⊕_{a≤j_w}𝒜q_{w,a} ⊕ 𝒜z_w))/(relations)`, the relations being, for `w ∈ Col`, `Em_w = 0`,
`(1 − e₁)q_{w,a} = 0`, `(δ_A − E)z_w = 0` and, for `g ∈ G_w`, `y_g + (u_g − 1)m_w = δ_A·Σ_aK_{w,a}(g)q_{w,a} + δ_A·k_w(g)z_w`.
The module is built on `Y`, formed in `𝒜 ⊆ ∏_{x∈X}M_n(O)`. Applied to the restrictions of `A`, `𝒜` and the `r_x` to the
points of `Xs` (a split algebra again, with the same ideal `c(π)`), `Y` becomes `Y_s`, and (1)–(3a) hold for the module with
columns built on `Y_s`, which has fewer cut cocycles. The
**cut cocycles** of the block `b` are the cocycles `g ↦ φ(y_g)`, `φ ∈ Hom_𝒜(Y_c, O^{d_b} ⊗ K/O)`, and
`Ψ_b : Hom_𝒜(Y_c, O^{d_b} ⊗ K/O) → Z¹(G, ρ_b ⊗ χ^{−1} ⊗ K/O)` is `φ ↦ (g ↦ φ(y_g))`; the hypothesis of 1.8d(2) is assumed for
them: at every `v ∈ 𝒱` they restrict into `L_{b,v}`. For the block `ρ_0` (resp. `χ`, resp. `χ_c`, `c ≥ 2`) let the local
condition at `w ∈ Col` be the image of `F_w ⊗ K/O` (resp. of `θ_w ⊗ K/O`, resp. `0`), and let `H¹_{𝒮_b}` be the Selmer group of
these conditions at `Col`, of the `L_{b,w}` at `Row` and of the `L_{b,v}` at `𝒱`. Prove:

1. (*the module with columns*) `length_O(O/c(π)) ≤ Σ_b length_O Hom_𝒜(Y_c, O^{d_b} ⊗ K/O)`; every cocycle in the image of `Ψ_b`
   restricts at `w ∈ Col` into the local condition of the block `b`; and `length_O ker Ψ_b` is at most
   `Σ_{w∈Col}(j_w(e′_w + v_δ) + h⁰_{0,w} + Nv_δ)` for `b = ρ_0`, `Σ_{w∈Col}(e′_w + 3v_δ)` for `b = χ`, and
   `Σ_{w∈Col}(h⁰_{c,w} + v_δ)` for `b = χ_c`, `c ≥ 2`;
2. (*the bound with local defects*)
   `length_O(O/c(π)) ≤ Σ_b length_O H¹_{𝒮_b}(G, ρ_b ⊗ χ^{−1} ⊗ K/O) + Σ_bΣ_{w∈Row}ν_{b,w}`
   ` + Σ_{w∈Col}((1 + j_w)e′_w + (j_w + 2)v_δ + h⁰_{0,w} + t·max_{c≥2}h⁰_{c,w}) + 4(N + t)(#Col + 1)·v_δ`;
3. (*rows from duality*) if for `w ∈ Row` a perfect local pairing makes `L_{b,w}` the exact annihilator of a submodule
   `F′_{b,w}` of a finitely generated `O`-module, and the cut cocycles of the block `b` are orthogonal at `w` to a submodule
   `I_{b,w} ⊆ F′_{b,w}`, then (Row) holds with `L̃_{b,w} = I_{b,w}^⊥` and `ν_{b,w} = length_O(F′_{b,w}/I_{b,w})`
   (SelmerLengthBoundsAndLocalLifting §4.10b for the Bloch–Kato conditions);

   (3a) (*orthogonality from a dual family*) let `O` be finite over `ℤ_p`, `w ∈ Row` with `G_w` the absolute Galois group of a
   finite extension of some `ℚ_ℓ` (mapping continuously to `G`), `ε` its `p`-adic cyclotomic character, and `a : G_w → 𝒜` a
   continuous `1`-cocycle for the action `g·a := ε(g)·a·u_g^{−1}`. Then the `2`-cocycle `(g, h) ↦ a_g·u_g·y_h`, with values in
   `Y(1)` (`G_w` acting on `Y` through `ε` alone), is the coboundary of a continuous `Y(1)`-valued cochain. Consequently, for every
   block `b`, every `φ ∈ Hom_𝒜(Y_c, O^{d_b} ⊗ K/O)` and every `O`-linear `ϑ : O^{d_b} ⊗ K/O → K/O`, the cup product of the cocycle
   `g ↦ ϑ∘ψ_b(a_g)` (with values in the dual lattice of `ρ_b ⊗ χ^{−1}`, twisted by `ε`) with the cut cocycle `g ↦ φ(y_g)` vanishes
   in `H²(G_w, K/O(1))`: (3) applies with `I_{b,w}` the submodule of `F′_{b,w}` generated by those of the classes of these
   cocycles that lie in `F′_{b,w}`;
4. (*an element `E` from one group element*) let `O` be finite over `ℤ_p`, lengths and `v` normalised by `v(p) = 1` in this
   clause, `χ_c = χ·ε^{−(c−1)}` for a character `ε : G → O^×`, and `e_B ∈ 𝒜` an idempotent with `e_B(π)` the projector onto the
   character blocks and `e_B(x)` of rank `t` for all `x`. Let `g ∈ G` with `ε(g)^i ≠ 1` for `0 < i < t`. Suppose that `A` separates the points of `X` and that every `r_x ⊗ K` (`x ∈ X`) is a direct sum of pairwise
   non-isomorphic absolutely irreducible representations. Then for every `L ≥ 0` there is `s = Σ_kj_k·e_Ba_ke_B` with `j_k ∈ A`,
   `j_k(π) = 0` and `a_k ∈ 𝒜` such that the characteristic polynomial `P ∈ A[U]` of `R := e_Br(g)e_B + ϖ^Ls` on the image of `e_B`
   (monic of degree `t`) has `t` distinct roots at every point of `X`. After enlarging `O` to contain these roots, let `A′` be
   the splitting algebra of `P` over `A`, with roots `α_1, …, α_t`, evaluated on the points over `X` (1.8c(5), applied `t − 1`
   times), and `E′ := ∏_{c=2}^{t}(R − α_ce_B)`, a product in the corner `e_B𝒜e_B ⊗_A A′`, whose identity is `e_B` (so `E′ = e_B` for
   `t = 1`). Then `E′² = δ_{A′}·E′` with `δ_{A′} := ∏_{c≥2}(α_1 − α_c)` (`δ_{A′} = 1` for `t = 1`); at the point
   `π′` over `π` with `α_c(π′) = χ_c(g)`, `E′(π′)` is `δ_{A′}(π′)` times the projector onto the `χ`-line and
   `v(δ_{A′}(π′)) = Σ_{0<i<t}v(1 − ε(g)^{−i})`, which is `Σ_{0<i<t}(s₀ + v_p(i))` when `ε(g) = 1 + p^{s₀}u` with `u ∈ ℤ_p^×`,
   `s₀ ≥ 1` (`s₀ ≥ 2` if `p = 2`); at every point over `X`, `δ_{A′} ≠ 0` and `E′` has rank one; and the bounds of
   1.8c–1.8e over `A′` at `π′`, with `E′`, bound `length_O(O/c(π))`.

The case `t = 1` of (4), with the product taken in the corner, is this roadmap's: [FormalProof] takes the product in the full
matrix algebra, with `E′` of rank one at every point as a hypothesis
(`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.Eel`,
`Formalism.MainNotions.N.GoodCongruenceObjects`)), so it asserts nothing at `t = 1`, and needs only `t ≥ 2`
(`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IdempotentBlockRootFactorsRankOneDomainStatement.lean`
(`GlobalTheory.T.idempotentBlock_rootFactors_rank_one_domain`): rank one and `E′² = δ_{A′}·E′` at a point with distinct roots).
For the Setting, (Col), (Row), the module with columns, `Ψ_b` and the local conditions at `Col`: [FormalProof],
`Formalism/CharacterColumnKernels/StatGlobalModule.lean` (`Formalism.NG.colRelJ`),
`Formalism/WachLatticeTwists/RealClassMaps/RealClassMapTheorem.lean`
(`Formalism.RepresentationBoundsCohomology.FIN.InRhoFixReal`). (2) follows from [FormalProof],
`Formalism/WachLatticeTwists/RamifiedBlockRings/RamifiedBlockProofs/LengthBoundViaSplitting.lean`
(`Formalism.RepresentationBoundsCohomology.ringDataObjects.length_bound_via_splitting`). (3a) follows from [FormalProof],
`Formalism/WachLatticeTwists/RealClassMaps/Statement.lean` (`Formalism.RepresentationBoundsCohomology.FIN.InRowReal`). For
`t ≥ 2`, the element `E′` of (4), `δ_{A′}` and `v(δ_{A′}(π′))`: [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.Eel`),
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.BasicNotions.NData.vdel`).

*Route.* (1) The first inequality is 1.8c(1) with `Y_c` in place of `Y_s`: `Y_c` is finitely generated, the coefficients of
the generic determinants of arrays of its relations lie in `A` by (P), and it suffices that `Hom_𝒜(Y_c, V_x) ≠ 0` for
`x ∈ Xs ∖ Z` (a nonzero homomorphism gives a nonzero vector killed by every array of relations at `x`); at `π` the value is
`∏_b det ψ_b`. *A dimension count:* `E(x) = δ_A(x)·(rank-one projector)` with `δ_A(x) ≠ 0`; let `η` generate `E(x)V_x`, so
`V_x = Kη ⊕ ker E(x)`, and `φ₀ : Y → V_x`, `aE ↦ a(x)η`, is a nonzero `𝒜`-homomorphism (by (N), some `(u_g(x) − 1)η ≠ 0`). A
homomorphism of `Y_c` restricting to `σφ₀` on `Y` is, at each column `w`, a choice of `ξ ∈ K^{j_w}` (the values on the `q_{w,a}`,
multiples of a generator `s₁` of `e₁(x)V_x`), `ζ ∈ K` (the value on `z_w`, a multiple of `η`) and `v ∈ V_x` (with
`δ_A(x)v = ση + (the value on m_w)`, the latter in `ker E(x)`) such that `Σ_aξ_aK_{w,a}(·)(x)s₁ + ζk_w(·)(x)η = d⁰v` on `G_w`. The
linear map `(ξ, ζ, v) ↦ Σ_aξ_aK_{w,a}(·)(x)s₁ + ζk_w(·)(x)η − d⁰v` goes from a space of dimension `j_w + 1 + dim V_x` into
`L_{w,x}`, of dimension at most `j_w + dim H⁰(G_w, V_x) + (dim V_x − dim H⁰(G_w, V_x))`: its kernel `S_w` is nonzero. If some `S_w`
has a nonzero element with `σ = 0`, it defines a nonzero homomorphism vanishing on `Y` and on the other columns (if
`ξ = ζ = 0`, then `v ≠ 0` and its value `δ_A(x)v` on `m_w` is nonzero); otherwise normalise `σ = 1` at every column and glue with `φ₀`. The relation
at `w ∈ Col` makes the restriction of every cut cocycle a coboundary plus `δ_A(π)` times a combination of the chosen
classes: the local condition is built into the module. *The kernels:* `φ ∈ ker Ψ_b` vanishes on `Y` and is given at each
column by `μ = φ(m_w)`, `ξ_a = φ(q_{w,a})`, `ζ = φ(z_w)`, subject to the relations. On `ρ_0` (where `E` acts by `0`): `δ_A(π)ζ = 0`
(length `≤ Nv_δ`), `ξ_a ∈ e₁M ≅ K/O`, and `(u_g − 1)μ = δ_A(π)Σ_aψ_0(K_{w,a}(g))ξ_a` on `G_w` (`k_w(g) ∈ 𝒜E` acts by `0`), so
`δ_A(π)ϖ^{e′_w}Σ_aξ_aκ_{w,a} = 0` in `H¹(G_w, T_ρ(χ^{−1}) ⊗ K/O)`; as `F_w` is saturated,
`(K/O)^{j_w} → H¹(G_w, T_ρ(χ^{−1})) ⊗ K/O ⊆ H¹(G_w, T_ρ(χ^{−1}) ⊗ K/O)` is injective, so every `ξ_a` is killed by
`ϖ^{e′_w}δ_A(π)` (length `j_w(e′_w + v_δ)`), and given the `ξ_a`, `μ` is determined up to `H⁰` (length `h⁰_{0,w}`). On `χ` (trivial
action; `E` acts by `δ_A(π)`, `e₁` by `0`): `ξ_a = 0`, `δ_A(π)μ = 0` (length `≤ v_δ`), and the relation gives
`ϖ^{e′_w}δ_A(π)²β_wθ_w(g)·ζ = 0` for all `g`, with some `θ_w(g)` a unit (length `≤ e′_w + 2v_δ`). On `χ_c`, `c ≥ 2` (`E` and `e₁` act
by `0`): `ξ_a = 0`, `δ_A(π)ζ = 0` (length `≤ v_δ`), and `μ` is fixed by `G_w` (length `h⁰_{c,w}`). (2) For each block,
`length Hom_𝒜(Y_c, ·) = length ker Ψ_b + length(coboundaries in im Ψ_b) + length(image in H¹)`; the coboundaries have length at
most `d_bv_δ` by the refinement of 1.8d(3′) (at most `2d_bv_δ` in the form of [FormalProof]), which uses only the part `Y`;
with either value the kernels and coboundaries stay within the stated bound, since
`#Col·(N + t)v_δ + 2(N + t)v_δ ≤ 4(N + t)(#Col + 1)v_δ`; the image in `H¹` lies in the Selmer group of the conditions at `Col`
(by (1)), of `L̃_{b,w}` at `Row` and of `L_{b,v}` at `𝒱`, of length at most `length H¹_{𝒮_b} + Σ_{w∈Row}ν_{b,w}` (1.8d(2′)). The
kernels and coboundaries add up to
`Σ_{w∈Col}((1 + j_w)e′_w + (j_w + 2)v_δ + h⁰_{0,w} + Σ_{c≥2}h⁰_{c,w} + (N + t)v_δ) + (N + t)v_δ`, within the stated bound. (3) The
annihilator of `I` contains that of `F′`, which is `L_{b,w}`, with quotient the Pontryagin dual of `F′/I` (the annihilator
calculus of ArithmeticGaloisDuality §D7.7.1 when `O` is finite over `ℤ_p`). (3a) As `a` is a
cocycle and `y_h = (u_h − 1)E`, the `2`-cocycle `(g, h) ↦ a_gu_gy_h` is the coboundary of `f(g) := −a_gu_gE` in `𝒜E(1)`:
`ε(g)f(h) − f(gh) + f(g) = a_gu_g(u_h − 1)E`, using `a_{gh}u_{gh} = a_gu_gu_h + ε(g)a_hu_h`. Since `Y ⊆ 𝒜E` are finitely generated
`O`-modules on which `G_w` acts through `ε` alone, and `H²(G_w, M(1)) ≅ M ⊗_O H²(G_w, O(1)) = M` functorially for such `M`
(ArithmeticGaloisDuality §D7.4, *The local invariant map as a quasi-isomorphism*: `inv_w : H²(G_w, M(1)) ≅ M` for a finitely
generated `M` with trivial action, from the local invariant of §R02.4.2 and `cd_p(G_w) = 2`, ClassFieldTheory §6.1),
`H²(G_w, Y(1)) → H²(G_w, 𝒜E(1))` is injective, so the `2`-cocycle is a coboundary in `Y(1)`. Applying `ϑ∘φ`, which is
`G_w`-equivariant from `Y(1)` to `K/O(1)` and turns `a_gu_gy_h` into `ϑ(ψ_b(a_g)·ψ_b(u_g)φ(y_h))` (`φ` is `𝒜`-linear), gives the
vanishing of the cup product. (4) *Separability by a correction.* At `x ≠ π` the corner `e_B(x)·K[r_x(G)]·e_B(x)` is a product of
matrix algebras of total degree `t` (ArithmeticGaloisRepresentations §5.5, *Independence of characters*, for the pairwise
non-isomorphic absolutely irreducible summands), so it contains an element with separable characteristic polynomial on the
image of `e_B(x)`; multiplying by
`f − f(π)` for an `f ∈ A` with `f(x) ≠ f(π)` and by a power of `ϖ`, it is a nonzero multiple of the value at `x` of an admissible
`s = Σ_kc_kj_ke_Ba_ke_B` (`c_k ∈ O`). The discriminant of the characteristic polynomial of `R(x)` is a polynomial in the
`c_k`, nonzero at `x ≠ π` (its top coefficient in a scaling of `s` is the discriminant for `s(x)` alone) and constant `≠ 0` at
`π` (`s(π) = 0`, and the roots `χ_c(g) = χ(g)ε(g)^{−(c−1)}` are distinct since `ε(g)^i ≠ 1` for `0 < i < t`); a nonzero
polynomial over the infinite domain `O` has a non-root at which all of finitely many of these are nonzero. *The element.*
`R` satisfies `P(R) = 0` in `e_B𝒜e_B ⊗ A′` (Cayley–Hamilton at every point, `𝒜 ⊆ ∏_xM_n(O)`), so `E′(R − α_1e_B) = 0`,
`E′R = α_1E′` and `E′² = ∏_{c≥2}(α_1 − α_c)E′` (`E′e_B = E′`). For `t = 1`, `E′ = e_B` is an idempotent of rank `t = 1` at every point,
equal at `π` to the projector onto the `χ`-line; the empty product taken in `𝒜 ⊗ A′` instead of the corner would be `1`, of rank
`N + 1` at `π`. `R(π) = e_Br_π(g)e_B` acts on the `χ_c`-line by `χ_c(g)`, so `E′(π′)` kills the lines
`c ≥ 2` and the block `ρ_0` and acts on the `χ`-line by `∏_{c≥2}χ(g)(1 − ε(g)^{−(c−1)})`, of valuation
`Σ_{0<i<t}v(1 − ε(g)^{−i})`; for `ε(g) = 1 + p^{s₀}u` this is `Σ_{0<i<t}v_p((1 + p^{s₀}u)^{−i} − 1) = Σ_{0<i<t}(s₀ + v_p(i))`
(for an integer in place of `p^{s₀}u` and a positive exponent, this valuation is the lifting-the-exponent identity of
DiophantineApproximationAndTranscendence §3.7). At every point the roots are distinct, so `E′` is `δ_{A′}` times the
projector onto the `α_1`-eigenline of `R`, of rank one. The coefficients of `P` lie in `A` by (P); 1.8c(5) applied `t − 1`
times passes from `A′` back to `A`. Sources: [FormalProof]; [Ribet76] and [BC09] for the unit case.
*Needs:* 1.8c, 1.8d; IntegralHeckeAndGaloisDeterminants §§0.5, 1.3; SelmerIwasawaCohomology §§2.1–2.9 and SelmerLengthBoundsAndLocalLifting §4.10b;
ArithmeticGaloisDuality §§R02.1.2 (lattice coefficients), R02.4.2, D7.4, D7.7.1; ClassFieldTheory §6.1;
ArithmeticGaloisRepresentations §5.5; ProfiniteCohomology §2.1; Mathlib `Polynomial.SplittingField` (or the universal
splitting algebra), `Matrix.aeval_self_charpoly`, `Polynomial.discr`.

**Checks.**

- With `Col = ∅`, `Row = ∅` and `δ_A(π)` a unit, (2) is 1.8d(2)–(3): no column cost, no defect, `v_δ = 0`.
- With `Col = ∅` the bound of (2) needs no lifting hypothesis at all: every place above `p` is a row and pays a colength.
- The kernel cost of a column with `j_w = 0` is `e′_w + 3v_δ` on the block `χ`, `h⁰_{0,w} + Nv_δ` on `ρ_0` and `h⁰_{c,w} + v_δ` on
  each `χ_c`: with `v_δ = 0` only the lifting exponent and the invariants remain.
- (*saturation in (Col)*) With `j_w = 1` and `κ_{w,1} = ϖκ₀`, `κ₀` of infinite order, the map `K/O → H¹(G_w, T_ρ(χ^{−1})) ⊗ K/O`,
  `ξ ↦ ξ·ϖκ₀`, has kernel `(K/O)[ϖ]`, and the kernel count on `ρ_0` would miss one: the classes must be a basis of a saturated
  submodule.
- In (4), `t = 2`, `p` odd, `ε(g) = 1 + pu` with `u ∈ ℤ_p^×`: `v_δ = 1`; for `p > t + 1` and `g` with `ε(g)` a generator modulo `p`, the factors
  `1 − ε(g)^{−i}`, `0 < i < t`, are units and `v_δ = 0`, the unit case. When `ε̄(G) ⊆ 𝔽_p^×` (as for the cyclotomic character) and
  `p ≤ t`, the index `i = p − 1 < t` gives the non-unit factor `1 − ε(g)^{−(p−1)}` for every `g`, and no choice of `g` makes `δ_{A′}(π′)` a
  unit: this is why the bound carries `v_δ`. Without the condition on `ε̄(G)` this fails: for `p = t = 3` and `ε̄(g)` of order `8` in
  `𝔽_9^×` both factors are units.
- (*the correction in (4)*) If at some `x ≠ π` the element `e_B(x)r_x(g)e_B(x)` has a repeated eigenvalue on the image of
  `e_B(x)` (as when `g` acts by one scalar on two constituents of `r_x`), the uncorrected element gives `δ(x) = 0` there and no
  projector of rank one; the correction removes this and changes nothing at `π`.

### Examples

- In `A = {(a, b) ∈ O² : a ≡ b mod ϖⁿ}` with `M = A` and `Z = Y = {1}`, `cc_Z(1) = ϖⁿO` and `η_Y(A) = n`, so the bound of 1.7a (4) is an equality; for `M = A^m` both sides are `mn`, and for `M = O^X` the congruence module is `0` although `cc_Y(1) = ϖⁿO` (1.7a).
- For `𝒜 = O × O` with its two projections, `g = 1` and `Rel = ϖ^aO × ϖ^bO`, the smallest admissible `J` in 1.8b is `ϖ^{a+b}O`, and the two solution modules have lengths `a` and `b`; the array `(ϖ^a, 0)` alone has product of determinants `0` (1.8b).
- In the computed two-point case of 1.8c, with `c(π) = ϖ^mO` and an absolutely irreducible `r_x`, both extension modules are `(K/O)[ϖ^m]`, of length `m`, and the bound reads `m ≤ 2m` (1.8c).
- For a number field `F`, `p` odd, `G = G_F`, `O = ℤ_p` and the unramified condition at every place, the term of the block `χ` in 1.8d is `v_p(#Cl_F)`, the class-number term of a Ribet bound (1.8d).
- In 1.8e (4) with `t = 2`, `p` odd and `ε(g) = 1 + pu`, `u ∈ ℤ_p^×`, `v_δ = 1`; for `p > t + 1` and `ε(g)` a generator modulo `p`, `v_δ = 0` (1.8e).

### Dependencies

PadicFamilies §§1.7, 1.8; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.2, 1.3, 1.4; ProfiniteCohomology Layer 1 and §§2.1, 2.3, 3.2; ArithmeticGaloisDuality §§R02.1.2, R02.4.2, D7.4, D7.7.1; ArithmeticGaloisRepresentations §§1.7, 5.5; ClassFieldTheory §§6.1, 13.1; AInfCohomology §AI.1.3; SelmerIwasawaCohomology §§2.1–2.9; SelmerLengthBoundsAndLocalLifting §§4.10b, 4.10c, 4.10d, 4.10e, 4.10f; Mathlib's lengths of modules, idempotents, determinants, multivariate polynomials over a domain, characteristic polynomials and discriminants.

## Downstream consumers

CongruenceModulesOfThetaLifts uses the split case of 1.7a, with the family form (4′), for the congruence length of a step (CongruenceModulesOfThetaLifts §7.1) and for the total congruence bound (CongruenceModulesOfThetaLifts §§7.10a, 7.10b); 1.8c for the local condition at `ℓ` (CongruenceModulesOfThetaLifts §7.6); the hypotheses of the Ribet-type bound, through 1.8c (4), (5) and the element of 1.8e (4), for its Hecke–Galois families on definite unitary groups (CongruenceModulesOfThetaLifts §7.7a); and the bounds with local conditions and local defects, 1.8d (2′), (3), (3′) and 1.8e (1)–(3a), for its congruence bounds by Selmer groups, with columns at the places of one type above a split prime, rows at their conjugates and at the inert places, and `E` built from an inertia element by 1.8e (4) (CongruenceModulesOfThetaLifts §§7.7b, 7.7c). Congruence arguments for endoscopic lifts on definite unitary groups use the relative congruence module of 1.7a and the length form of the Ribet bound, 1.8b–1.8e, with local defects at small primes.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns congruence modules of modules along a central idempotent and relative to a set of points of a split finite flat algebra, with their length bound (1.7a); the generic-determinant length lemma (1.8b); the bound of the congruence ideal at a reducible point by extension and Selmer modules of its blocks, with the derivation of its hypotheses from a residually multiplicity-free determinant (1.8c–1.8d); and the general bound with local defects for a partition of the places into rows and columns, the orthogonality of the cut cocycles to the classes of a dual family, and an element `E` with `E² = δE`, `δ` not a unit, built from one group element with a correction that separates the roots at every point (1.8e). These statements extend Layer 1 of [PadicFamilies](../../PadicFamilies/README.md), which they follow in its notation.

Not owned here. The raw congruence module and the congruence ideal of one augmentation are PadicFamilies §§1.7, 1.8; the congruence module of a commutative `O`-algebra, finite and free, along an idempotent of `A ⊗ K`, with its symmetry and its raw-annihilator form, is PadicFamilies §1.7a, which states the case of an algebra acting on itself: the case `M = A`, `A` commutative, of 1.7a (1) without its last clause, of (2) and of the first clause of (3). Determinants and their characteristic coefficients, Amitsur's formula, semisimple reconstruction, Henselian lifting of matrix units, generalized matrix algebras and reducibility ideals are [IntegralHeckeAndGaloisDeterminants](../../IntegralHeckeAndGaloisDeterminants/README.md) §§0.2, 0.5, 1.2–1.4; the two-dimensional integral Ribet theorems with Fitting ideals over the family ring, different statements, are IntegralHeckeAndGaloisDeterminants §6.1 (*Ribet theory for distinct residual characters*) and §6.7 (*Ribet extension with all local conditions*, *Ribet extension without residual distinctness*), and, with local conditions, IntegralIwasawaTheory §9.6. Continuous cohomology with discrete coefficients is [ProfiniteCohomology](../../ProfiniteCohomology/README.md) Layer 1, its explicit low-degree cocycles ProfiniteCohomology §§2.1, 2.3 and 3.2, continuous cochains into inverse limits (the lattice coefficients of 1.8e) [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) §R02.1.2, and the local invariant of a local field ArithmeticGaloisDuality §R02.4.2. Selmer structures and Selmer groups with discrete coefficients are [SelmerIwasawaCohomology](../../SelmerIwasawaCohomology/README.md) §§2.1–2.9. The defect of a class under local duality and the lifting of finite classes with loss are [SelmerLengthBoundsAndLocalLifting](../SelmerLengthBoundsAndLocalLifting/README.md) §§4.10b–4.10f. The congruence modules of theta lifts to which these bounds are applied belong to [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md).

## Exact supplier contracts

### From TauCetiRoadmap.PadicFamilies

§1.7: the raw congruence module `Ψ_λ(M) = M/(M[𝔭_λ] + M[I_λ])` of a surjection `λ : A → O` with `I_λ = Ann_A(𝔭_λ)`, functorial in `A`-linear maps and killed by `𝔭_λ + I_λ`, with `Ψ_λ(A) = A/(I_λ + Ann_A(I_λ))` (1.7a (2) and its first Check). §1.7a: for a commutative `O`-algebra `A`, finite and free, and an idempotent `e` of `A ⊗ K`, the congruence module `eA/(A ∩ e(A ⊗ K))` (Hida's module of congruences of the decomposition), its symmetry in `e` and `1 − e`, its finite length, `Ann_A(𝔞_e) = 𝔞_{1−e}` with the raw annihilator form, and the split case: the case of an algebra acting on itself, which is the case `M = A`, `A` commutative, of 1.7a (1) without its last clause, of (2) and of the first clause of (3). §1.8: the congruence ideal `η_λ = λ(Ann_A(ker λ))` and `Ψ_λ(A) ≅ O/η_λ` under the double-annihilator identity (1.7a (3)).

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§0.2: the characteristic polynomial and coefficients of a determinant, their scalar extension (compatibility with specialisation), and `det∘ρ` for a matrix representation. §0.5: Amitsur's formula for determinants, and the descent of a determinant to the subring of its coefficients. §1.2: determinants and semisimple reconstruction (the residual determinant determines the semisimplification). §1.3: Henselian lifting of matrix units in an algebra integral over a henselian local ring, and generalized matrix algebras for a residually multiplicity-free determinant. §1.4: reducibility ideals. Used in 1.8c (3), (4) and 1.8e (4).

### From TauCetiRoadmap.SelmerIwasawaCohomology

§§2.1–2.9: local conditions and Selmer groups with discrete coefficients, used in 1.8d and 1.8e.

### From TauCetiRoadmap.ProfiniteCohomology

Layer 1: continuous cohomology `continuousCohomology` with discrete coefficients and its functoriality along continuous homomorphisms, in particular restriction to closed subgroups (§§1.4–1.5), used in 1.8d and 1.8e. §2.1: the explicit continuous cocycles and coboundaries, with `B¹ = 0` for the trivial action, used in 1.8c–1.8e; §2.3: their restriction to a subgroup, used in 1.8d. §3.2: the classes of explicit cocycles in continuous cohomology in degrees `1` and `2`, used in 1.8d.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.1.2: continuous cochains into inverse limits and their comparison with continuous cohomology for compact coefficients, used for the lattice coefficients of 1.8e (Col) and (3a). §R02.4.2: the local invariant `H²(G_w, μ_{p^n}) ≅ ℤ/p^n` of a local field, used in 1.8e (3a). §D7.4: the local invariant `H²(G_w, M(1)) ≅ M` for a finitely generated `M` with trivial action, used in 1.8e (3a). §D7.7.1: annihilators under perfect pairings, used in 1.8e (3) when `O` is finite over `ℤ_p`.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.7: absolute irreducibility in Burnside's form, used in 1.8c (3). §5.5: independence of characters (the surjection of `k[Γ]` onto the product of the endomorphism algebras of pairwise non-isomorphic absolutely irreducible representations), used in 1.8e (4).

### From TauCetiRoadmap.ClassFieldTheory

§6.1: `cd_ℓ G_K = 2` for a nonarchimedean local field `K` of characteristic zero, used in 1.8e (3a). §13.1: the Hilbert class field and the class group as its Galois group, used in the first Check of 1.8d.

### From TauCetiRoadmap.AInfCohomology

§AI.1.3: the diagonal form of a finitely presented module over a valuation ring and its zeroth Fitting ideal, used in 1.8b.

### From SelmerLengthBoundsAndLocalLifting, a sub-roadmap of this family

§4.10b: the defect of a class orthogonal to part of the dual finite classes equals the colength, used in 1.8e (3). §§4.10c–4.10f: lifting of finite classes with loss from an exponent `e` of `p`, which gives the lifting exponents `e′_w = e·v(p)` of the columns in 1.8e.

### From Mathlib

`Module.length` and `IsIdempotentElem` (1.7a); `Matrix.det`, `MvPolynomial.map`, `MvPolynomial.coeff_map`, the instance making `MvPolynomial σ k` a domain over a domain `k`, and the Smith normal form over a principal ideal domain (1.8b); `Polynomial.SplittingField`, `Matrix.aeval_self_charpoly` and `Polynomial.discr` (1.8e (4)).

## References

- **[Hida]** Haruzo Hida, *Iwasawa modules attached to congruences of cusp forms*, Annales Scientifiques de l'École Normale Supérieure (4) 19 (1986), 231–273: congruence modules of Hecke algebras (1.7a).
- **[Ribet76]** Kenneth A. Ribet, *A modular construction of unramified p-extensions of ℚ(μ_p)*, Inventiones Mathematicae 34 (1976), 151–162 (1.8c).
- **[BC09]** Joël Bellaïche and Gaëtan Chenevier, *Families of Galois representations and Selmer groups*, Astérisque 324 (2009), Chapter 1 (1.8c (3)).
- **[JN13]** H. Johnston and A. Nickel, *Noncommutative Fitting invariants and improved annihilation results*, Journal of the London Mathematical Society 88 (2013); arXiv:1202.0711, Definition 2.1, Theorem 2.4, §3.8 and Lemma 4.15: noncommutative Fitting invariants, the one-block case of the determinant lemma and its Morita step (1.8b).
- **[Urban01]** E. Urban, *Selmer groups and the Eisenstein–Klingen ideal*, Duke Mathematical Journal 106 (2001), 485–525, Theorem 1.1 and p. 519: for two blocks, a stable lattice whose reduction modulo the Eisenstein ideal `I` is an extension of `ρ₂ ⊗ T/I` by `ρ₁ ⊗ N/I` with `length(T/I) ≤ length(N/IN)` (1.8c), as quoted in [Berger09], which follows Urban for the injection into a Selmer group (1.8d).
- **[Berger09]** T. Berger, *An Eisenstein ideal for imaginary quadratic fields and the Bloch–Kato conjecture for Hecke characters*, Compositio Mathematica 145 (2009), 603–632; arXiv:math/0701177, Theorem 7 and the proof of Theorem 6, steps (i) and (ii): Urban's lattice for two blocks (1.8c) and the injection of the module of extensions into a Selmer group with local conditions (1.8d).
- **[Dasgupta23]** S. Dasgupta, *On constructing extensions of residually isomorphic characters*, preprint (2023), arXiv:2310.16631, §3 and Lemma 4.5: the unit case of the exclusion of coboundaries (1.8d), and the vanishing of the determinant of a square array of relations where the relations have a nonzero solution, for `GL₂` and two characters (1.8c).
- **[OW24]** A. Ophir and A. Weiss, *On Ribet's lemma for GL₂ modulo prime powers*, Research in the Mathematical Sciences (2024); arXiv:2111.01559, Theorem 1.3: Ribet's lemma for congruent characters, with a loss (1.8d).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The files and declarations of [FormalProof] named in this README are those of the first commit of that repository, the source as published, with the file paths relative to its directory `src/`: <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005/src>. It is the source of the length bound for relative congruence modules in its family form (1.7a (4′)); of the determinant lemma in the form of one array over a large residue field (1.8b (1′)) and of the bound by extension modules deduced from it, with the passage to a finite cover (1.8c (1), (2), (5)); of the passage to Selmer groups with local defects and of the coboundary bound with the square of `δ` (1.8d (2), (2′), (3′)); and of the module with columns with its kernel counts, the bounds of the three kinds of block, the duality at the rows and the element `E` with `E² = δE` (1.8e). The congruence module along a central idempotent (1.7a (1), (2)), the generic form of the determinant lemma without a condition on the residue field (1.8b (1)), the supply of the hypotheses (1.8c (3), (4)) and the refinement of 1.8d (3′) are this roadmap's.
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
