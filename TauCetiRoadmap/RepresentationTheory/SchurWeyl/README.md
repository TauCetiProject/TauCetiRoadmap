# Roadmap: representations of the symmetric group, Specht modules, and Schur-Weyl duality

**Summary.** Tau Ceti has the representation theory of the symmetric group up to the character
table: the partition, diagram and class dictionary, dominance, standard tableaux, Young subgroups
and permutation modules, Young symmetrizers, the Specht modules with their standard basis,
irreducibility, absolute irreducibility, distinctness and completeness over `ℚ` and over `ℂ`, the
hook-length formula, the integer-valued characters with both orthogonality relations, the finite
Schur polynomials with Jacobi–Trudi, Pieri, the Kostka expansion and the finite-variable Frobenius
characteristic, row insertion, the tensor-power actions of `Sₙ` and `GLₔ` with their mutual
centralizers, the Schur functor, the Brauer diagram combinatorics and the orthogonal and symplectic
cup, cap and crossing operators. This roadmap builds what joins these into the full theory: the
Specht sign-transpose intertwiner `S^λ ⊗ sgn ≅ S^(λᵗ)` and Specht self-duality (Layer 4); skew
tableaux, jeu de taquin, the Littlewood–Richardson rule, the finite Frobenius formulas, the
character-side Murnaghan–Nakayama rule, full RSK, the stable ring `Λ_R` of symmetric functions with its Hall form, `ω`, the stable
Frobenius characteristic and its induction product, and the matrix form of Newton's identities
(Layer 7); the simultaneous `Sₙ × GLₔ` decomposition of `(ℂᵈ)^(⊗n)` (Layer 8); and the Brauer
algebra `B_k(δ)` with its actions on `V^(⊗k)` for the orthogonal and symplectic groups, the first
fundamental theorem in every dimension, the harmonic tensors and their classification, the trace
filtration, the multiplicity spaces and the semisimplicity criterion (Layer 9). The end theorems
are `littlewoodRichardson`, `murnaghanNakayama`, `hallForm_frobeniusCharacteristic`,
`schurWeylDecomposition`, `orthogonal_centralizer_eq_adjoin_brauerGenerators` and
`harmonicTensors_decomposition`.

## Scope and ownership

This roadmap owns: the sign-transpose intertwiner `T_λ`, its scalar `κ_t`, the character identity
`χ^(λᵗ) = sgn · χ^λ`, Specht self-duality through the tabloid form, and the induction and Kronecker
transpose comparisons (Layer 4, §§4.1–4.4); the comparison of `κ_t` with `n!/f^λ` (Layer 5, §5.1);
the transpose-sign identity on the symmetric character table (Layer 6, §6.1); skew tableaux and
their conversions, jeu de taquin, Knuth equivalence, dual
equivalence, the Littlewood–Richardson tableaux and rule, evacuation and full RSK, the
finite Frobenius formulas and character-side Murnaghan–Nakayama rule, the Hall form on the finite
symmetric polynomials and the isometry property of the native Frobenius characteristic, the stable ring `Λ_R` with its Hall form,
`ω`, free generators, Hopf structure and rational power-sum presentation, the stable Frobenius
characteristic with its induction product, and the matrix specialization of Newton's identities
(Layer 7, §§7.1–7.9); the simultaneous equivariant decomposition of `(ℂᵈ)^(⊗n)` and its balanced
tensor presentation and transpose comparisons (Layer 8, §§8.1–8.3); the Brauer algebra `B_k(δ)`
with its loop rule, the
orthogonal and symplectic Brauer actions, the first fundamental theorem on tensors and the reverse
centralizer, the harmonic tensors and the shape spaces `E_λ`, the trace filtration and cup
expansions, the multiplicity spaces and cell comparisons, and the three semisimplicity statements
(Layer 9, §§9.1–9.9).

Layers 0–3 contain no target of their own: the dictionary, the orders, standard tableaux,
λ-tableaux and their row and column groups, Young subgroups, permutation modules and their
induced description, Kostka numbers, the symmetrizers with their vanishing and factorization
lemmas, the polytabloids, the Specht modules and the submodule theorem are in Tau Ceti and are
consumed by the names listed under *From Tau Ceti*. Of Layers 4–6, irreducibility, absolute
irreducibility, distinctness, completeness over `ℚ` and over `ℂ`, Young's rule, the trivial, sign
and standard identifications, the standard basis, the hook-length formula, the sum of squares,
the integer character, the character table with both orthogonality relations and the class sizes
are likewise in Tau Ceti, including the integer/complex table comparison
`TauCeti.symmetricCharacterTableℂ_apply` and `TauCeti.symmetricCharacterTableℂ_eq_characterTable`.
The generic external product belongs to CharacterTheory §3.6; induction and its projection
comparison are `Representation.ind` and `TauCeti.indProjection`. The targets here are their
Specht-specific transpose comparisons.

Left to named roadmaps: the Schur functor `𝕊^λ(ℂᵈ)` as a `GLₔ`-subrepresentation, its vanishing
criterion and symmetric and exterior extremes belong to ClassicalGroups Layer 2, and the
identification of Schur polynomials as torus characters of `GLₔ` and the Weyl dimension formula to
ClassicalGroups Layers 3–5; the count of irreducibles over a splitting field, the character-table
specification `TauCeti.IsCharacterTableSpec` and the Dixon–Schneider method belong to
CharacterTheory Layers 2 and 5; induced characters and Frobenius reciprocity to
InductionRestriction Layer 2; identity components, component groups and the characteristic-zero
equivalence of reductive and linearly reductive groups to ReductiveGroups Layers 3 and 6; the
planar diagram category, the Temperley–Lieb algebras `TL_k(δ) ⊆ B_k(δ)`, their cellular theory
and Jones–Wenzl projections to TemperleyLieb Layers 2–6; the comparison of the finite Schur
polynomials with polynomial `gl_n`-modules to LieHighestWeight Layer 9; hives, honeycombs and the
saturation theorem to TensorProductCombinatorics.

A kept variant: the finite-variable Hall form `hallForm` of §7.4 lives on the native
`TauCeti.symmetricHomogeneousSubmodule`, so that its power-sum normalisation and the isometry
property are stated against the native Frobenius characteristic; the stable Hall form of §7.5 is
defined by stable Schur coordinates, equivalently by any projection to `d ≥ n` in degree `n`,
and is the form consumers use in `Λ_R`. Projection to `d < n` need not preserve it.

## Conventions

- **The group.** `Sₙ` is `Equiv.Perm (Fin n)`; its group algebra is `MonoidAlgebra k (Equiv.Perm
  (Fin n))`, written `k[Sₙ]`. Conjugacy classes are `ConjClasses (Equiv.Perm (Fin n))`, indexed by
  cycle type through `TauCeti.partitionEquivConjClasses`.
- **Base field.** The Specht theory is over `ℚ`; `ℂ`-statements are obtained by the native scalar
  extension `TauCeti.spechtModuleℂ`. Absolute irreducibility is the native endomorphism statement
  `TauCeti.spechtModuleEndAlgEquiv`, not a consequence of rational character values.
- **Vocabulary.** Partitions are `Nat.Partition n`; diagrams are `YoungDiagram`, with `YoungDiagram.ofPartition`
  the diagram of a partition; the transpose partition is `Nat.Partition.conjugate`; semistandard fillings
  are Mathlib's `SemistandardYoungTableau`; a λ-tableau is `TauCeti.YoungTableau μ`, a bijection
  from the cells of `μ` onto `Fin μ.card`; a standard tableau is `TauCeti.StandardYoungTableau μ`;
  symmetric polynomials are `MvPolynomial.esymm`, `hsymm`, `psum`, `msymm` and their
  partition-indexed products, and Schur polynomials are `TauCeti.schurPoly` (partition-indexed) and
  `TauCeti.diagramSchurPoly` (diagram-indexed).
- **Symmetrizers.** For a λ-tableau `t`, `a_t` is the sum of its row group, `b_t` the signed sum of
  its column group, and the Young symmetrizer is `c_t = a_t * b_t` (`TauCeti.YoungTableau.youngSymmetrizer`);
  on a left module it applies the column antisymmetrizer first. The polytabloid is
  `e_t = b_t · {t}` and the Specht module is the span of the polytabloids inside the permutation
  module, which is a left `k[Sₙ]`-module on left cosets.
- **Dominance.** `TauCeti.Dominates μ ν` reads "`μ` dominates `ν`": every partial sum of the sorted
  parts of `μ` is at least the corresponding partial sum for `ν`. Conjugation reverses it
  (`TauCeti.conjugate_dominates_conjugate_iff`).
- **Tensor powers.** The `n`-th tensor power of `V = Fin d → ℂ` is `⨂[ℂ] (_ : Fin n), V`; the
  `Sₙ`-action is `TauCeti.permTensorAction ℂ d n` (dimension first, degree second) and the
  `GLₔ`-action is `TauCeti.tensorPowerRep ℂ d n`. No bespoke tensor-power type is introduced.
- **Coefficients in Layer 9.** The diagram algebra and tensor actions of §§9.1–9.2 are over
  any commutative ring `R`. The FFT of §9.3 is over an infinite field `K`, with `2 ≠ 0` for
  the orthogonal group. Reverse commutants by complete reducibility and §§9.4–9.9 use `ℂ`.
- **Orthogonal and symplectic groups.** In the complex statements, `O_n` is `Matrix.orthogonalGroup (Fin n) ℂ`, the symmetric
  bilinear orthogonal group (Mathlib's star on `ℂ` here is `starRingOfComm`, so no conjugation
  enters); `Sp_(2l)` is `Matrix.symplecticGroup (Fin l) ℂ` on `(Fin l ⊕ Fin l) → ℂ` with the form
  `ω(v, w) = vᵀ J w`, `J = Matrix.J`, so that for the basis vectors `e = Sum.inl 0`, `f = Sum.inr 0`
  one has `ω(e, f) = −1` and `ω(f, e) = 1`. The native symplectic cup is `θ = e ⊗ f − f ⊗ e` in
  rank one and the loop value is `cap(θ) = −2l`.
- **Brauer algebra loop values.** `B_k(δ)` acts on `V^(⊗k)` with `δ = n` in the orthogonal case and
  `δ = −2l` in the symplectic case. Diagrams are stacked with `D₁` above `D₂`
  (`TauCeti.composeDiagram`), so that permutation diagrams compose as
  `TauCeti.composeDiagram_permToBrauer` states, without inversion.
- **Reading words.** The Littlewood–Richardson reading word reads rows from the top down, each row
  from right to left; letters are zero-indexed and the ballot condition is `#(k+1) ≤ #k` on every
  prefix. The Knuth row word reads rows from the bottom up, each row left to right.

## Exact supplier contracts

### From Mathlib

- `YoungDiagram` with `transpose`, `rowLen`, `colLen`, `rowLens`, `ofRowLens`, `equivListRowLens`
  (`Combinatorics/Young/*`); `SemistandardYoungTableau`
  with `content`; `Nat.Partition n` with its `Fintype` instance; `Equiv.Perm.cycleType`,
  `Equiv.Perm.partition`, `Equiv.Perm.sign`.
- `MonoidAlgebra`, `Representation`, `Representation.ofMulAction`, `Representation.ind`,
  `Representation.dual`, `Representation.tprod`, `Representation.comp`, `Representation.IntertwiningMap`, `Subrepresentation`, `Rep`, `FDRep`
  with its monoidal structure, `FDRep.character`, `Representation.IsIrreducible`,
  `CategoryTheory.Simple`, Maschke's theorem and Schur's lemma.
- `MvPolynomial.esymm`, `hsymm`, `psum`, `msymm`, `esymmPart`, `hsymmPart`, `psumPart`,
  `MvPolynomial.esymmAlgEquiv`, `MvPolynomial.mul_esymm_eq_sum` (Newton's identities),
  `MvPolynomial.IsSymmetric`, `MvPolynomial.IsHomogeneous`.
- `PiTensorProduct` with `tprod`, `reindex`, `map`, `lift`, `tmulEquiv`, `dualDistribEquiv`;
  `dualTensorHomEquiv`; `DirectSum.lmap`; `LinearMap.BilinForm`; `Module.Basis.toDual`;
  `LinearMap.BilinForm.exists_orthogonal_basis` (needs `Invertible 2`); `Matrix.GeneralLinearGroup`,
  `Matrix.orthogonalGroup`, `Matrix.symplecticGroup`, `Matrix.J`; `Matrix.charpoly`,
  `Matrix.charpolyRev`, `Matrix.reverse_charpoly`, `Matrix.charpoly.univ_map_eval₂Hom`,
  `LinearMap.charpoly_toMatrix`, `LinearMap.trace_eq_matrix_trace`; `Subalgebra.centralizer`,
  `Algebra.adjoin`; `IsSemisimpleRing`.

### From Tau Ceti

Layer 0, the dictionary and orders (`Combinatorics/Young/Partitions.lean`,
`RepresentationTheory/Symmetric/Partitions.lean`, `Combinatorics/Enumerative/Partition/{Dominance,Conjugate}.lean`,
`Combinatorics/Young/StandardTableau/Basic.lean`, `Combinatorics/Young/Tableau.lean`,
`RepresentationTheory/Symmetric/RowColumnSubgroup.lean`): `YoungDiagram.ofPartition`,
`TauCeti.partitionEquivYoungDiagram`, `TauCeti.partitionEquivConjClasses`, `TauCeti.Dominates` with
`TauCeti.lex_le_of_dominates`, `Nat.Partition.conjugate` with `TauCeti.conjugate_dominates_conjugate_iff`,
`TauCeti.StandardYoungTableau` with `TauCeti.standardCount`, `TauCeti.YoungTableau` with
`TauCeti.YoungTableau.relabel`, `TauCeti.YoungTableau.rowSubgroup`, `TauCeti.YoungTableau.colSubgroup`,
`TauCeti.YoungTableau.rowSubgroup_inf_colSubgroup_eq_bot` and `TauCeti.YoungTableau.rowSubgroupMulEquiv`.

Layer 1, Young subgroups and permutation modules (`RepresentationTheory/Symmetric/YoungSubgroup.lean`,
`RepresentationTheory/Symmetric/PermutationModule/{Basic,Form}.lean`, `Combinatorics/Young/Kostka.lean`):
`TauCeti.youngSubgroup` with `TauCeti.youngSubgroupMulEquiv`, `TauCeti.card_youngSubgroup` and
`TauCeti.youngSubgroup_index_mul`; `TauCeti.permutationModule` with `TauCeti.finrank_permutationModule`,
`TauCeti.permutationModuleIsoIndTrivial` and the tabloid form `TauCeti.tabloidForm` with
`TauCeti.tabloidForm_invariant`; `TauCeti.kostkaNumber` with `TauCeti.kostkaNumber_self` and
`TauCeti.kostkaNumber_eq_zero_of_not_dominates`; `TauCeti.BoundedSSYT`.

Layer 2, symmetrizers (`RepresentationTheory/Symmetric/{Symmetrizer,Vanishing,Factorization}.lean`,
`RepresentationTheory/Symmetric/Specht/Ideal/Idempotent.lean`): `TauCeti.YoungTableau.youngSymmetrizer`,
`TauCeti.YoungTableau.youngSymmetrizerOver`, the absorption lemmas `TauCeti.YoungTableau.mul_youngSymmetrizer_left`
and `TauCeti.YoungTableau.mul_youngSymmetrizer_right`, the vanishing criterion
`TauCeti.YoungTableau.rowMeetsColumnTwice_relabel_iff`, the factorization
`TauCeti.YoungTableau.mem_mul_of_not_rowMeetsColumnTwice`, and `TauCeti.YoungTableau.youngSymmetrizer_sq`
(`c_t * c_t = (n! / dim (A c_t)) • c_t`) with `TauCeti.YoungTableau.isIdempotentElem_smul_youngSymmetrizer`.

Layer 3, Specht modules (`RepresentationTheory/Symmetric/Specht/{Module,Comparison,SubmoduleTheorem}.lean`):
`TauCeti.YoungTableau.tabloid`, `TauCeti.YoungTableau.polytabloid`, `TauCeti.spechtSubrepresentation`, `TauCeti.spechtModule`
(an `FDRep ℚ (Equiv.Perm (Fin n))`), the ideal comparison
`TauCeti.YoungTableau.spechtIdealEquivSpechtSubrepresentation`, and the submodule theorem
`TauCeti.spechtSubrepresentation_le_or_le_orthogonal`.

Layers 4–6, classification, basis, characters (`RepresentationTheory/Symmetric/Specht/{SubmoduleTheorem,AbsoluteIrreducibility,Distinctness,Completeness,Complex,Extremes,StandardBasis,HookLength,SumOfSquares,Character,Orthogonality}.lean`,
`RepresentationTheory/Symmetric/PermutationModule/YoungRule.lean`, `RepresentationTheory/Symmetric/ClassSize.lean`):
`TauCeti.isIrreducible_spechtModule`, `TauCeti.spechtModuleEndAlgEquiv`, `TauCeti.spechtModule_iso_iff`,
`TauCeti.partitionEquivSimpleFDRepClasses`, `TauCeti.spechtModuleℂ`, `TauCeti.instSimpleSpechtModuleℂ`,
`TauCeti.spechtModuleℂ_iso_iff`, `TauCeti.partitionEquivSimpleFDRepClassesℂ`,
`TauCeti.char_permutationModule_eq_sum_kostkaNumber_mul_spechtChar` (Young's rule),
`TauCeti.finrank_spechtModule_indiscrete`, `TauCeti.finrank_spechtModule_ones`,
`TauCeti.spechtModule_indiscrete_ρ_eq_trivial`, `TauCeti.spechtModule_ones_ρ_apply`,
`TauCeti.spechtModuleStandardBasis`, `TauCeti.finrank_spechtModule`,
`YoungDiagram.hookLength` (`Combinatorics/Young/HookLength/Basic.lean`),
`TauCeti.finrank_spechtModule_mul_prod_hookLength`, `TauCeti.standardCount_mul_prod_hookLength`,
`TauCeti.sum_sq_standardCount`, `TauCeti.spechtChar` with `TauCeti.spechtChar_cast`,
`TauCeti.spechtCharValue`, `TauCeti.symmetricCharacterTable`,
`TauCeti.symmetricCharacterTable_column_orthogonality`, `TauCeti.symmetricCharacterTable_row_orthogonality`,
`TauCeti.symmetricCharacterTableℂ` with `TauCeti.symmetricCharacterTableℂ_apply`,
`TauCeti.symmetricCharacterTableℂ_eq_characterTable`, `TauCeti.isCharacterTableSpec_symmetricCharacterTableℂ`,
`TauCeti.partMultiplicity`, `TauCeti.zPart` and `TauCeti.card_partition_parts_mul_zPart_fin`;
`TauCeti.signLinearCharacter` and `FDRep.ofLinearCharacter` (`RepresentationTheory/Symmetric/SignCharacter.lean`,
`RepresentationTheory/LinearCharacter/Basic.lean`).

Layer 7, finite Schur theory and class functions (`RingTheory/MvPolynomial/Symmetric/Schur/*.lean`,
`RingTheory/MvPolynomial/Symmetric/{Homogeneous,PowerSum,Complete,NewtonIdentities}.lean`,
`RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean`, `RepresentationTheory/Symmetric/PermutationModule/PowerSum.lean`,
`RepresentationTheory/CharacterTable/{ClassFunction,Pairing,VirtualCharacter}.lean`,
`RepresentationTheory/Induction/ClassFunction.lean`, `Combinatorics/Young/{RimHook,Schensted,RowInsertion}.lean`,
`GroupTheory/Perm/SumCongr.lean`): `TauCeti.diagramSchurPoly`, `TauCeti.schurPoly`,
`TauCeti.schurPoly_eq_rename`, `TauCeti.schurPoly_isSymmetric`, `TauCeti.schurPoly_mul_alternant`,
`TauCeti.hsymmInt`, `TauCeti.schurPoly_eq_det_hsymmInt`, `TauCeti.hsymm_mul_schurPoly`,
`TauCeti.psum_mul_schurPoly`, `TauCeti.schurPoly_eq_sum_kostkaNumber_smul_msymm`,
`TauCeti.schurPoly_ones`, `TauCeti.schurPoly_indiscrete`, `TauCeti.aeval_snoc_zero_diagramSchurPoly`,
`TauCeti.aeval_snoc_zero_hsymmInt`, `TauCeti.symmetricHomogeneousSubmodule`, `TauCeti.msymmBasis`,
`TauCeti.schurPolyBasis` with `TauCeti.coe_schurPolyBasis`, `TauCeti.partitionEquivSchurIndex`,
`TauCeti.psumPart_isSymmetric`, `TauCeti.isHomogeneous_psumPart`,
`TauCeti.psumPart_eq_sum_card_fixedPoints_smul_msymm`,
`TauCeti.psumPart_eq_sum_character_smul_msymm`, `TauCeti.zPart_pos`, `TauCeti.zPart_dvd_factorial`,
`TauCeti.frobeniusCharacteristic` with
`TauCeti.frobeniusCharacteristic_spechtCharacter`, `TauCeti.schurPolyBasis_repr_frobeniusCharacteristic`,
`TauCeti.frobeniusCharacteristic_apply` (Schur-coordinate expansion); `TauCeti.ClassFunction` with
`TauCeti.ClassFunction.ofCharacter`,
`TauCeti.ClassFunction.toConjClasses`, `TauCeti.ClassFunction.characterPairing`
(`(1/|G|) ∑_g f(g) h(g⁻¹)`, bilinear), `TauCeti.virtualCharacters`, and induction of class functions
along a subgroup `S : Subgroup G` with `[S.FiniteIndex]`,
`TauCeti.ClassFunction.ind S : TauCeti.ClassFunction R S →ₗ[R] TauCeti.ClassFunction R G`
over a semiring `R`; `YoungDiagram.IsRimHook μ ν` (`μ / ν`
is a rim hook, ambient shape first) and `YoungDiagram.rimHookHeight` (rows met, minus one);
`TauCeti.rowInsert`, `TauCeti.reverseRowInsert`, `TauCeti.rowInsertEquiv` and `List.IsTableauRows`;
`Equiv.Perm.finSumPermHom` (the block embedding `Sₙ × Sₘ → S_(n+m)`); `Multiset.mul_esymm_eq_sum`.

Layer 8, tensor actions (`RepresentationTheory/Symmetric/TensorAction/{Basic,Centralizer,Faithful,GeneralLinear,SchurWeyl}.lean`,
`RepresentationTheory/ClassicalGroups/TensorPower.lean`, `RepresentationTheory/ClassicalGroups/WeylModule/{Basic,Multiplicity,SchurWeyl}.lean`,
`RepresentationTheory/Tensor/Power.lean`): `PiTensorProduct.reindexRepresentation`,
`TauCeti.permTensorAction`, `TauCeti.permTensorActionAlgHom`, `TauCeti.tensorPowerRep`,
`TauCeti.centralizer_range_tensorPowerRep_eq_range_permTensorActionAlgHom`,
`TauCeti.centralizer_range_permTensorAction_eq_range_tensorPowerRep_asAlgebraHom`,
`TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`,
`TauCeti.permTensorActionAlgHom_injective_iff` (injective iff degree `≤` dimension),
`TauCeti.schurFunctor d μ` (the image of the row-superstandard symmetrizer, a `FDRep ℂ (GL (Fin d) ℂ)`),
`TauCeti.YoungTableau.intertwiningMapEquivWeylModule`,
`TauCeti.sum_finrank_spechtModule_mul_finrank_weylModuleOfShape`, and `Representation.tensorPower`.

Layer 9, Brauer combinatorics and generators (`Combinatorics/Brauer/{Diagram,Compose,LoopCount,Associativity,Generator,Relations,PropagatingNumber,Relabel,Flip}.lean`,
`Combinatorics/Enumerative/PerfectMatching.lean`, `RepresentationTheory/ClassicalGroups/{Orthogonal,Symplectic}.lean`,
`RepresentationTheory/ClassicalGroups/BrauerGenerators/Orthogonal/{Basic,TensorPower}.lean`,
`RepresentationTheory/ClassicalGroups/BrauerGenerators/Symplectic.lean`): `TauCeti.BrauerDiagram k`
(perfect matchings of `Fin k ⊕ Fin k`) with `TauCeti.card_brauerDiagram`, the arc predicates
`IsThrough`, `IsCap`, `IsCup`, `TauCeti.permToBrauer` with `TauCeti.permToBrauer_injective`,
`TauCeti.capCup`, `TauCeti.composeDiagram` with `TauCeti.composeDiagram_assoc` and
`TauCeti.composeDiagram_permToBrauer`, `TauCeti.middleLoopCount`, `TauCeti.BrauerDiagram.propagatingNumber`
with its parity and composition bounds, `TauCeti.BrauerDiagram.relabel`, `TauCeti.BrauerDiagram.flip`;
`TauCeti.stdOrthogonalRep`, `TauCeti.stdOrthogonalRepToDual` with `TauCeti.stdOrthogonalRepToDual_equivariant`,
`TauCeti.orthogonalCap`, `TauCeti.orthogonalCup`, `TauCeti.orthogonalCupCap`,
`TauCeti.orthogonalCupCapAt k n d i j` (cup-cap on the slots `i, j` of the `d`-th tensor power of
`kⁿ`; at `i = j` it is a rank-one map, not an arc, so every arc statement carries `i ≠ j`) with
`TauCeti.orthogonalCupCapAt_tprod`, `TauCeti.commute_orthogonalCupCapAt_tensorPower`,
`TauCeti.permTensorAction_mul_orthogonalCupCapAt`, `TauCeti.orthogonalCupCapAt_mul_self`,
`TauCeti.piTensorProductMap_comp_orthogonalCup`; `TauCeti.stdSymplecticRep`,
`TauCeti.stdSymplecticBilinForm`, `TauCeti.stdSymplecticRepToDual` with
`TauCeti.stdSymplecticRepToDual_equivariant`, `TauCeti.symplecticCap`, `TauCeti.symplecticCup`
(`−∑ J_(xy) e_x ⊗ e_y`, the inverse-form cup), `TauCeti.symplecticCupCap`
(`= cup ∘ cap`), `TauCeti.symplecticCrossing`, `TauCeti.symplecticCap_comp_symplecticCup`
(`= −2l`) and `TauCeti.piTensorProductMap_comp_symplecticCup`.

The projection formula `TauCeti.indProjection`
(`RepresentationTheory/Induction/Projection.lean`) is an isomorphism in `Rep` over any commutative
ring along any group homomorphism: `Ind(X ⊗ Res Y) ≅ Ind(X) ⊗ Y`; §4.4 uses its inverse.

### From TauCetiRoadmap.ClassicalGroups

Layer 2 owns the Schur functor `𝕊^λ(ℂᵈ)` as a `GLₔ`-subrepresentation of the tensor power, its
tableau independence, its vanishing for more than `d` rows and the extremes `Symᵈ`, `⋀ᵈ`; Layer 4
owns the theorem that `s_λ` is the torus character of the polynomial irreducible `V_λ`. §8.1 here
consumes the Layer 2 carrier; Layer 7 here supplies the Schur-polynomial identities Layer 4 there
consumes.

### From TauCetiRoadmap.CharacterTheory

Layer 2 owns the count of irreducibles over a splitting field; Layer 5 owns
`TauCeti.IsCharacterTableSpec` and its uniqueness statement; §3.6 supplies external tensor
products, formed by `Representation.tprod` after pullback along the two projections.
§4.4 uses these products and §6.1 uses the table convention.

### From TauCetiRoadmap.InductionRestriction

Layer 2 owns induced characters and Frobenius reciprocity on class functions; §7.6 here consumes
them for the induction product of the stable Frobenius characteristic.

### From TauCetiRoadmap.ReductiveGroups

Layer 3 owns identity components and component groups; Layer 6 owns, in characteristic zero,
reductive ⇔ linearly reductive. §9.3 here consumes both for complete reducibility of the tensor
representations of `O_n` and `Sp_(2l)`.

## How to read the build

Layers 0–3 are consumed from Tau Ceti and introduce nothing. Layer 4 builds the sign-transpose
intertwiner `T_λ`, its character form, Specht self-duality and the induction and Kronecker
transpose comparisons; Layer 5 compares its scalar with the hook-length dimension; Layer 6
transports the transpose-sign identity through the native integer/complex table comparison. Layer 7 builds, in independent lanes, the
skew-tableau and Littlewood–Richardson theory with RSK (§§7.1–7.2), the finite Frobenius formulas
followed by the Murnaghan–Nakayama rule (§7.3), the finite Hall form and the isometry (§7.4), the stable ring
`Λ_R` with its Hall form, `ω` and the rational presentation (§7.5), the stable Frobenius
characteristic and its induction product (§7.6), the Hopf structure (§7.7), the matrix Newton
identities (§7.8) and the power-sum basis comparisons (§7.9). Layer 8 builds the simultaneous
decomposition of the tensor power from the native centralizer theorems and the Schur functor
(§8.1), its balanced-tensor presentation (§8.2) and the Schur-functor transpose comparison (§8.3).
Layer 9 builds the Brauer algebra (§9.1), its two geometric actions (§9.2), group-image complete
reducibility over `ℂ`, the invariant-tensor bridge, FFT and reverse commutant (§9.3),
the harmonic tensors and shape spaces (§9.4), the trace filtration (§9.5), cup expansions and their
relations (§9.6), the multiplicity spaces and cell comparisons (§9.7), the semisimplicity
statements (§9.8) and the rank-one symplectic examples (§9.9). The order of construction is
Layers 4–6, then §§7.1–7.4, §7.5, §§7.6–7.9, Layer 8, §§9.1–9.9.

## Layer 0: partitions, diagrams, tableaux, and orders

This layer is consumed entirely: the partition/diagram/class dictionary, dominance and its
reversal under conjugation, the lexicographic refinement, standard tableaux with their count,
λ-tableaux with their row and column groups. See *From Tau Ceti*, Layer 0.

### Examples

`(3,1)` dominates `(2,2)`; conjugation gives `(2,2)ᵀ = (2,2)` and `(3,1)ᵀ = (2,1,1)`, and indeed
`(2,2)` dominates `(2,1,1)`. The five partitions of `4` have `f^λ = 1, 3, 2, 3, 1`.

### Dependencies

Tau Ceti Layer 0 suppliers. No earlier layer.

## Layer 1: Young subgroups and the permutation modules `M^λ`

This layer is consumed entirely: the Young subgroup with its cardinality and index, the
permutation module on the left cosets with its dimension, its identification with the induced
trivial representation, the invariant tabloid form, and the Kostka numbers with their dominance
vanishing. See *From Tau Ceti*, Layer 1.

### Examples

`M^((n))` is the trivial representation and `M^((1ⁿ))` is the regular representation;
`dim M^((2,1)) = 3`.

### Dependencies

Tau Ceti Layer 1 suppliers. No earlier layer.

## Layer 2: Young symmetrizers

This layer is consumed entirely: `a_t`, `b_t`, `c_t = a_t * b_t`, the absorption rules
`p * c_t = c_t` for `p` in the row group and `c_t * q = sgn(q) • c_t` for `q` in the column group,
the vanishing criterion (`a_t * σ * b_t = 0` exactly when some row of `t` meets some column of `σt`
twice, equivalently `σ ∉ rowSubgroup t · colSubgroup t`), the factorization of the complementary
case as `σ = p q`, and essential idempotence `c_t * c_t = (n!/dim(A c_t)) • c_t`. See *From Tau
Ceti*, Layer 2.

### Examples

For the row tableau of shape `(n)`, `c_t = a_t` is the sum of all permutations and
`c_t * c_t = n! • c_t`; for the column tableau of shape `(1ⁿ)`, `c_t = b_t` and again
`c_t * c_t = n! • c_t`; for `(2,1)` with `t` having first row `0, 1` and second row `2`,
`c_t = (1 + (0 1))(1 − (0 2))` and `c_t * c_t = 3 • c_t`, matching `3!/f^((2,1)) = 6/2`.

### Dependencies

Tau Ceti Layer 2 suppliers; Layer 0.

## Layer 3: the Specht modules `S^λ`

This layer is consumed entirely: tabloids, polytabloids, the Specht subrepresentation of `M^λ`, its
packaging as `FDRep ℚ (Equiv.Perm (Fin n))`, the comparison with the left ideal `ℚ[Sₙ] c_t` for the
convention `c_t = a_t * b_t`, and the submodule theorem (every submodule of `M^λ` contains `S^λ` or
lies in its orthogonal for the tabloid form). See *From Tau Ceti*, Layer 3.

### Examples

For `(n−1, 1)`, `M^λ` is the natural permutation representation on `Fin n` and `S^λ` is the
sum-zero hyperplane; for `(1ⁿ)`, `S^λ` is the sign representation inside the regular one.

### Dependencies

Tau Ceti Layer 3 suppliers; Layers 1–2.

## Layer 4: completeness and irreducibility (the classification)

Irreducibility, absolute irreducibility (`End_(ℚ[Sₙ]) S^λ ≅ ℚ`), distinctness, completeness over
`ℚ` and over `ℂ`, Young's rule and the trivial, sign and standard identifications are consumed
(*From Tau Ceti*, Layers 4–6). The targets of this layer are the representation-level
sign-transpose intertwiner and self-duality that the library lacks.

### 4.1 The tableau transpose and the sign automorphism

For a λ-tableau `t : TauCeti.YoungTableau μ` define its transpose `tᵗ : TauCeti.YoungTableau μ.transpose`
by swapping the two coordinates of each cell, with the cell-membership and cardinality transports
(`μ.transpose.card = μ.card`). Prove that transposition interchanges the row and column groups:
`rowSubgroup tᵗ = colSubgroup t` and `colSubgroup tᵗ = rowSubgroup t` under the identification of
`Fin μ.transpose.card` with `Fin μ.card`, and that it commutes with relabelling. In `A = ℚ[Sₙ]`
define the sign automorphism `ε : A ≃ₐ[ℚ] A`, `ε(σ) = sgn(σ) σ` on group elements, and prove it is an
involution. Prove `ε(a_t) = b_(tᵗ)`, `ε(b_t) = a_(tᵗ)`, hence `ε(c_t) = b_(tᵗ) * a_(tᵗ)`, the
symmetrizer of `tᵗ` in the opposite product order (Fulton–Harris, Lecture 4, §4.1).
*Needs:* Tau Ceti `TauCeti.YoungTableau`, `TauCeti.YoungTableau.rowSubgroup`,
`TauCeti.YoungTableau.colSubgroup`, `TauCeti.YoungTableau.youngSymmetrizer`; Mathlib
`YoungDiagram.transpose`, `MonoidAlgebra.lift`, `Equiv.Perm.sign`.

- The transpose of the transpose is the original tableau, after the cardinality transport.
- `ε` is distinct from the inversion anti-automorphism `σ ↦ σ⁻¹`, which exchanges left and right
  ideals; `ε` preserves left ideals.

**Checks.**

- For the row tableau of shape `(2)`, `tᵗ` is the column tableau of shape `(1,1)`; `ε(a_t) =
  ε(1 + (0 1)) = 1 − (0 1) = b_(tᵗ)`. In `S₃`, `ε((0 1 2)) = (0 1 2)`, whereas inversion
  sends it to `(0 2 1)`; these are distinct basis vectors of `ℚ[S₃]`.
- For `n = 0` and `n = 1`, `ε` is the identity and `tᵗ` is the empty, respectively one-cell,
  tableau.
- For the self-transpose shape `(2,1)`, `tᵗ` of the tableau with rows `0 1 / 2` is the tableau
  with rows `0 2 / 1`, not `t` itself: `row(tᵗ) = {1, (0 2)}` equals `col(t)`.

### 4.2 The sign-transpose intertwiner `T_λ`

Construct `F_t : A c_t ⊗ sgn_n → A c_(tᵗ)` by `F_t(x ⊗ 1) = ε(x) * b_(tᵗ)`, with `sgn_n` the
one-dimensional representation `FDRep.ofLinearCharacter (TauCeti.signLinearCharacter ℚ (Fin n))`.
Prove membership in the target left ideal (`ε(x c_t) b_(tᵗ) = ε(x) b_(tᵗ) a_(tᵗ) b_(tᵗ)` lies in
`A c_(tᵗ)`), linearity, and the intertwining equation for the sign-twisted left action on the
source. Consume `TauCeti.YoungTableau.youngSymmetrizer_sq` for `c_t * c_t = κ_t • c_t` with
`κ_t = n!/dim_ℚ(A c_t) ≠ 0`, and prove `F_(tᵗ) ∘ F_t = κ_t • id` and `F_t ∘ F_(tᵗ) = κ_(tᵗ) • id`
after the identification `sgn_n ⊗ sgn_n ≅ 1`. These make `F_t` nonzero; associativity of
composition then gives `κ_t = κ_(tᵗ)`, so the inverse of `F_t` is `κ_t⁻¹ F_(tᵗ)`. Transport through
the native ideal/polytabloid comparison `TauCeti.YoungTableau.spechtIdealEquivSpechtSubrepresentation`
to an isomorphism `T_λ : S^λ ⊗ sgn_n ≅ S^(λᵗ)` in `FDRep ℚ (Equiv.Perm (Fin n))`, choosing the
row-superstandard tableau of `λ` for the partition-level map; the headline is
`spechtModule_tensor_sign_iso`. Prove the relabelling comparison: for another tableau `t' = σ t`
the two constructions differ by the unit `sgn(σ)` composed with the native relabelling
isomorphisms. The independently normalised `T_(λᵗ)` composed with `T_λ ⊗ sgn` is a scalar multiple
of the identity of `S^λ`; compute that scalar, including for self-transpose shapes, rather than
asserting an involution. Transport `T_λ` by `Representation.baseChange` to every field of
characteristic zero, in particular to `TauCeti.spechtModuleℂ`, and prove the scalar-extension and
tensor-unit comparison squares (Fulton–Harris, Lecture 4, Exercise 4.4; James, Theorem 8.15).
*Needs:* §4.1; Tau Ceti `TauCeti.spechtModule`, `Nat.Partition.conjugate`,
`TauCeti.YoungTableau.spechtIdealEquivSpechtSubrepresentation`, `TauCeti.YoungTableau.youngSymmetrizer_sq`,
`TauCeti.signLinearCharacter`, `FDRep.ofLinearCharacter`, `TauCeti.spechtModuleℂ`; Mathlib `FDRep`
monoidal structure, `Representation.baseChange`.

- `spechtModule_tensor_sign_iso`: for every partition `μ` of `n`, `S^μ ⊗ sgn_n ≅ S^(μᵗ)` in
  `FDRep ℚ (Equiv.Perm (Fin n))`.
- The composite `F_(tᵗ) ∘ F_t` is `κ_t • id` on `A c_t ⊗ sgn_n`, and `κ_t = κ_(tᵗ)`.

**Checks.**

- `n = 2`, `λ = (2)`: `A c_t = ℚ(1 + (0 1))` is the trivial module; `T_λ` sends it to
  `A c_(tᵗ) = ℚ(1 − (0 1))`, the sign module; `κ_t = 2!/1 = 2`, and `F_(tᵗ) ∘ F_t` is
  multiplication by `2`, not the identity: a construction asserting `F_(tᵗ) ∘ F_t = id` is wrong
  already here.
- `n = 3`, `λ = (2,1)`: `κ_t = 3!/2 = 3`; `T_λ` is a self-map of the isomorphism class of the
  two-dimensional standard representation, since `(2,1)ᵗ = (2,1)` and `S^((2,1)) ⊗ sgn ≅ S^((2,1))`.
- `n = 0`: `S^∅ = ℚ`, `sgn_0 = ℚ`, `T_∅` is the identity of `ℚ` and `κ = 0!/1 = 1`.
- Without the right factor `b_(tᵗ)`, the image `ε(x c_t) = ε(x) b_(tᵗ) a_(tᵗ)` lies in the
  opposite-order ideal `A b_(tᵗ) a_(tᵗ)` rather than in `A c_(tᵗ) = A a_(tᵗ) b_(tᵗ)`; for
  `λ = (2,1)` the elements `a b` and `b a` differ by the difference of the two `3`-cycles.

### 4.3 The character identity and Specht self-duality

Prove `spechtChar_conjugate`: `χ^(λᵗ)(σ) = sgn(σ) · χ^λ(σ)` on the integer-valued Specht characters,
from `T_λ` and the character of a tensor product (James, Theorem 8.15 read on characters).
Restrict the native invariant tabloid form `TauCeti.tabloidForm`
to `S^λ`, prove it nondegenerate over `ℚ` (the submodule theorem with `⟨e_t, e_t⟩ ≠ 0`, James,
Chapter 4), and export the equivariant map `v ↦ B(v, ·)` to the native dual
`Representation.dual (S^λ).ρ`, whose action is `(σ · φ)(v) = φ(σ⁻¹ v)`; the headline is
`spechtModule_self_dual`. Prove its compatibility with scalar extension to any characteristic-zero
field: over `ℂ` this is a complex-bilinear duality, distinct from a Hermitian identification.
*Needs:* §4.2; Tau Ceti `TauCeti.spechtChar`, `TauCeti.tabloidForm`, `TauCeti.tabloidForm_invariant`,
`TauCeti.spechtSubrepresentation_le_or_le_orthogonal`; Mathlib `Representation.dual`,
`FDRep.character`.

- `spechtChar_conjugate`: for every `μ ⊢ n` and `σ`, `χ^(μᵗ)(σ) = sgn(σ) · χ^μ(σ)`.
- `spechtModule_self_dual`: there is a `ℚ`-linear bijection `S^μ → (S^μ)^*` intertwining the Specht
  action with the contragredient action.

**Checks.**

- `n = 3`: `χ^((2,1))` takes the values `2, 0, −1` on the classes `1, (0 1), (0 1 2)`; `sgn` takes
  `1, −1, 1`; the product `2, 0, −1` equals `χ^((2,1))` again, as `(2,1)ᵗ = (2,1)`. For
  `λ = (3)`, `sgn · χ^((3)) = sgn = χ^((1,1,1))`.
- The tabloid form on `M^((2,1))` restricted to `S^((2,1))` has Gram matrix `[[2, 1], [1, 2]]` on
  the two standard polytabloids, determinant `3 ≠ 0`; the same form in characteristic `3` is
  degenerate, which is why the statement is over `ℚ`.
- A map `v ↦ B(·, v)` with the action `(σ · φ)(v) = φ(σ v)` is not equivariant for non-abelian
  `Sₙ`: on `S^((2,1))` the two conventions differ by `σ ↦ σ⁻¹`, and only the contragredient one
  makes the bijection an intertwiner.

### 4.4 Induction and Kronecker transpose comparisons

For `λ ⊢ a`, `μ ⊢ b`, `ν ⊢ a+b`, let `C_((λ,μ))^ν` be the space of intertwiners from `S^ν` to the
representation `inducedSpecht λ μ` of `S_(a+b)` induced along the block embedding `Equiv.Perm.finSumPermHom a b` from
the external tensor product `S^λ ⊠ S^μ` of `S_a × S_b` from CharacterTheory §3.6. Use
`Representation.ind` along the block embedding, prove that the restriction of `sgn_(a+b)` is
`sgn_a ⊠ sgn_b`, and apply the inverse of `TauCeti.indProjection` to obtain
`Ind(W) ⊗ sgn ≅ Ind(W ⊗ Res sgn)`. With
`T_λ, T_μ, T_ν` this gives a linear equivalence `C_((λ,μ))^ν ≃ C_((λᵗ,μᵗ))^(νᵗ)` with explicit
inverse, stated as `inducedSpechtTranspose`. For
tensor products inside one `Sₙ` the two sign twists cancel: construct
`kroneckerDoubleTranspose`, `S^(λᵗ) ⊗ S^(μᵗ) ≅ S^λ ⊗ S^μ`, and
`kroneckerSingleTranspose`, `S^(λᵗ) ⊗ S^μ ≅ (S^λ ⊗ S^μ) ⊗ sgn_n`, hence the two-factor and
factor/output transpose symmetries of the Kronecker multiplicity spaces; simultaneous
transposition of all three indices is a different assertion and is not claimed (James,
Theorem 16.4 for the Littlewood–Richardson rule on induced modules). *Needs:* §4.2; Tau Ceti
`Equiv.Perm.finSumPermHom`, `TauCeti.indProjection`; Mathlib `Representation.ind`,
`Representation.IntertwiningMap`; CharacterTheory §3.6.

**Checks.**

- `a = b = 1`, `ν = (2)`: `Ind(ℚ ⊠ ℚ) = M^((1,1))` is the regular representation of `S₂`, so
  `C_((1),(1))^((2))` and `C_((1),(1))^((1,1))` are both one-dimensional; the equivalence swaps them.
- Kronecker, `n = 3`: `S^((2,1)) ⊗ S^((2,1)) ≅ S^((3)) ⊕ S^((2,1)) ⊕ S^((1,1,1))` (characters
  `(2, 0, −1)² = (4, 0, 1)`), so the multiplicities of `S^((3))` and of `S^((1,1,1)) = S^((3))ᵗ`
  agree, as the factor/output symmetry predicts with `λ = μ = (2,1)` self-transpose.
- Transposing all three indices is not a symmetry: the trivial module occurs once in
  `S^((3)) ⊗ S^((3))`, but `S^((1,1,1))` does not occur in `S^((1,1,1)) ⊗ S^((1,1,1))`, which is
  trivial.

### Examples

`S₄`: the two three-dimensional Specht modules `S^((3,1))` and `S^((2,1,1)) ≅ S^((3,1)) ⊗ sgn` are
exchanged by `T_((3,1))`; the self-transpose `(2,2)` has `T` a self-map of its isomorphism class.

### Dependencies

Tau Ceti Layers 2–4 suppliers; Layers 2–3; Mathlib `Representation.dual`, `Representation.ind`.

## Layer 5: the standard basis and the hook-length formula

The standard basis, `finrank ℚ S^λ = f^λ`, the multiplicative hook-length formula
`f^λ · ∏ hooks = n!` and the sum of squares `∑ (f^λ)² = n!` are consumed (*From Tau Ceti*,
Layers 4–6).

### 5.1 The symmetrizer scalar

Prove `κ_t = n!/f^λ` for every λ-tableau `t`, from `TauCeti.YoungTableau.youngSymmetrizer_sq`,
`TauCeti.YoungTableau.spechtIdealEquivSpechtSubrepresentation` and `TauCeti.finrank_spechtModule`;
hence the idempotent `(f^λ/n!) • c_t` and `κ_t = ∏ hooks` by the multiplicative hook-length formula
(Fulton–Harris, Lemma 4.26). *Needs:* Tau Ceti `TauCeti.YoungTableau.youngSymmetrizer_sq`,
`TauCeti.finrank_spechtModule`, `TauCeti.finrank_spechtModule_mul_prod_hookLength`.

**Checks.**

- `(2,1)`: `κ_t = 6/2 = 3 = ∏ hooks = 3 · 1 · 1`.
- `(n)` and `(1ⁿ)`: `κ_t = n!`, the product of the hooks `n, n−1, …, 1`.
- A scalar `f^λ/n!` in place of `n!/f^λ` fails already for `(2)`: `c_t * c_t = 2 • c_t`, not
  `(1/2) • c_t`.

### Examples

`n = 5`: `f^λ = 1, 4, 5, 6, 5, 4, 1`, with squares summing to `120`.

### Dependencies

Tau Ceti Layers 2–5 suppliers; Layer 4.

## Layer 6: characters and class sizes

The integer character `χ^λ`, its class-indexed values, the character table with row and column
orthogonality, and the class sizes `n!/z_μ` are consumed (*From Tau Ceti*, Layers 4–6).

### 6.1 The character table against the specification

Prove `spechtChar_conjugate` on the table as `X(λᵗ, μ) = sgn(μ) X(λ, μ)` with
`sgn(μ) = (−1)^(n − ℓ(μ))`. Use the integer/complex table comparison to transport this
identity to the character-table specification. *Needs:* §4.3; Tau Ceti
`TauCeti.symmetricCharacterTableℂ_apply`, `TauCeti.symmetricCharacterTableℂ_eq_characterTable`,
`TauCeti.isCharacterTableSpec_symmetricCharacterTableℂ`; CharacterTheory Layer 5.

**Checks.**

- `n = 3`: the table has rows `(1,1,1), (1,−1,1), (2,0,−1)` on the classes `1³, 2·1, 3`; the sign
  of the class `2·1` is `(−1)^(3−2) = −1` and of `3` is `(−1)^(3−1) = 1`.
- `n = 4`: `X((3,1), ·) = (3, 1, −1, 0, −1)` on `1⁴, 2·1², 2², 3·1, 4` and `X((2,1,1), ·) =
  (3, −1, −1, 0, 1)`, the product with the signs `(1, −1, 1, 1, −1)`.

### Examples

Row orthogonality for `n = 3`: `∑_μ (3!/z_μ) X(λ, μ) X(λ', μ)` with class sizes `1, 3, 2` gives
`6 δ`.

### Dependencies

Tau Ceti Layers 4–6 suppliers; Layer 4; CharacterTheory Layer 5.

## Layer 7: symmetric functions, the Frobenius characteristic, and RSK

The finite Schur polynomials with Jacobi–Trudi, the bialternant, horizontal Pieri, the Kostka
expansion, the Schur and monomial bases, the Schur-coordinate Frobenius characteristic, and
row insertion are the inputs listed under *From Tau Ceti*, Layer 7. The finite Frobenius
formulas of §7.3 connect those coordinates with cycle types before the character rule and Hall
normalisation use them.

### 7.1 Skew tableaux, jeu de taquin and Knuth equivalence

For diagrams `inner ≤ outer` define `skewCells inner outer = outer.cells \ inner.cells` and the
carrier `SkewSemistandardYoungTableau inner outer` (entries vanish outside the skew cells, weakly
increase along rows, strictly increase down columns), with content `skewContent` counting entries
exactly as `SemistandardYoungTableau.content` does. Build bounded skew tableaux with entries below
`d`, their `Finite` instances, entry extensionality, restriction and weight API, and the skew Schur
polynomial as the tableau sum over any commutative semiring; prove it equals
`TauCeti.diagramSchurPoly` on straight shapes and its stability under setting the last variable to
zero. Build standard skew tableaux (entries bijective onto `Fin (#skewCells)`), transposes, and the
inverse conversions between straight skew tableaux and `TauCeti.BoundedSSYT`, between standard
straight skew tableaux and `TauCeti.StandardYoungTableau`, and between straight bounded tableaux
and row lists with `List.IsTableauRows`, preserving shape, entries, content and insertion. Define
the two Knuth relations `x z y ≡ z x y` for `x ≤ y < z` and `y x z ≡ y z x` for `x < y ≤ z`, prove
Greene's theorem (the largest union of `k` weakly increasing subsequences has size the sum of the
first `k` row lengths of the insertion tableau) and the insertion-tableau characterisation of
Knuth equivalence. Define inward slides (the smaller of the right and lower neighbours moves into
the hole, the lower one on ties; a sole neighbour moves) and reverse slides (the larger of the left
and upper neighbours, the upper one on ties), prove they preserve semistandardness and content,
the inverse-slide law, termination, standardisation and destandardisation, rectification and its
independence of the order of slides, and dual equivalence with its exchange lemma (Fulton, *Young
Tableaux*, §§1.1–1.2, 2.1, 3.1–3.2, Appendix A.1; Haiman's Math 249 notes, lectures 33–36).
*Needs:* Tau Ceti `TauCeti.BoundedSSYT`, `TauCeti.StandardYoungTableau`, `TauCeti.rowInsert`,
`TauCeti.rowInsertEquiv`, `List.IsTableauRows`; Mathlib `SemistandardYoungTableau`, `YoungDiagram`.

- `skewContent` of a straight tableau agrees with the native content under the conversion.
- Rectification of a skew tableau is independent of the order of inward slides, and two skew
  tableaux are Knuth equivalent iff their rectifications agree.

**Checks.**

- Shape `(2,1)/(1)`, entries `1` at `(0,1)` and `0` at `(1,0)`: semistandard, since the two
  cells share no row and no column; the reading word is `1 0`, which is not a ballot word. A
  definition that compared entries across the inner cell `(0,0)` would be the wrong model: it has
  no entry there to compare with, and the same filling with both entries `0` must also be
  accepted.
- Inward slide tie: hole at `(0,0)` with `1` to the right and `1` below moves the lower `1` up; the
  other choice breaks column strictness for the tableau with rows `· 1 / 1 2`.
- `inner = outer`: the empty skew tableau, content `0`, skew Schur polynomial `1`.

### 7.2 Littlewood–Richardson, evacuation and RSK

Define `skewReadingCells` (rows top to bottom, each right to left), `IsBallotWord` (every prefix
has at least as many `k` as `k+1`, zero-indexed) and `LRTableau inner outer content`, the skew
semistandard tableaux with `content.rowLen k` letters `k` and ballot reading word; set
`lrCoefficient μ ν κ = Nat.card (LRTableau μ κ ν)` and give the `Finite` instance. Prove the
Fin-alphabet comparison `TauCeti.schurPoly (Fin d) R μ = TauCeti.diagramSchurPoly d R (YoungDiagram.ofPartition μ)`
from `TauCeti.schurPoly_eq_rename` and symmetry, which carries each statement between the two
indexings. Prove the tableau-product bijection: pairs of straight bounded tableaux of shapes `μ` and `ν` correspond to
pairs (straight bounded tableau of shape `κ`, Littlewood–Richardson tableau of shape `κ/μ` and
content `ν`) summed over `κ` of size `|μ| + |ν|`, with weights adding, using insertion,
rectification and dual equivalence. Summing weights gives `littlewoodRichardson`:
`s_μ s_ν = ∑_κ c^κ_(μ,ν) s_κ` in every finite alphabet over every commutative semiring, with the
shapes of more than `d` rows contributing zero, and its diagram-indexed form
`diagramLittlewoodRichardson`; prove `c^κ_(μ,ν) = 0` unless `μ ≤ κ`, the symmetry
`c^κ_(μ,ν) = c^κ_(ν,μ)`, compatibility with setting the last variable to zero, and the strip
specialisations: `ν = (r)` is the native horizontal Pieri `TauCeti.hsymm_mul_schurPoly`, and
`ν = (1^r)` is vertical Pieri, because `r` distinct letters with a ballot word force the reading
word to be increasing, so each row receives at most one new cell (Fulton, *Young Tableaux*, §5.1,
Corollary 2 and §5.2; Macdonald I.9, (9.2); Stanley, *Enumerative Combinatorics* 2, Appendix
A1.3). Prove Schützenberger evacuation on standard tableaux of a straight shape (remove the entry
`0`, rectify, record the vacated cell with the largest remaining label) is an involution preserving
shape. Build RSK for permutations, words and nonnegative integer matrices from `TauCeti.rowInsert`
through the conversions of §7.1, with inverse, shape and weight identities. For permutations,
prove `RSK(σ⁻¹) = (Q, P)` and `RSK(reverse σ) = (Pᵗ, evac(Q)ᵗ)`
(Stanley, *Increasing and decreasing subsequences*, equation (7), p. 5).
For words on `Fin d`, use weak rows and strict columns; define semistandard evacuation by
rotating the tableau by 180 degrees inside its bounding rectangle, complementing entries by `i ↦ d−1−i`, and rectifying the
resulting skew tableau. Prove it is a shape-preserving involution reversing the content, and
`P(reverseComplement w) = evac_d(P(w))` (Lenart, arXiv v6, §2.4, pp. 6–7).
For nonnegative integer matrices, order the biword
lexicographically (top entries first, bottom entries increasing on ties), and prove
`RSK(Aᵀ) = (Q(A), P(A))`. Its permutation case is a bijection from `Equiv.Perm (Fin n)`
onto pairs of standard tableaux of a common shape, whose cardinality identity is the native
`TauCeti.sum_sq_standardCount` (Fulton, *Young Tableaux*, §§4.1–4.3; Stanley 2, Theorem 7.11.5 and
§A1.2). *Needs:* §7.1; Tau Ceti `TauCeti.schurPoly`, `TauCeti.diagramSchurPoly`,
`TauCeti.hsymm_mul_schurPoly`, `TauCeti.rowInsert`, `TauCeti.rowInsertEquiv`, `TauCeti.sum_sq_standardCount`.

- `littlewoodRichardson`: `s_μ s_ν = ∑_(κ ⊢ n+m) c^κ_(μ,ν) s_κ` in `MvPolynomial σ R`.
- `diagramLittlewoodRichardson`: the same on diagram-indexed Schur polynomials in `d` variables.
- The vertical Pieri rule `s_μ e_r = ∑ s_κ` over `κ/μ` a vertical strip of size `r`, `r = 0`
  included.

**Checks.**

- `c^((3,2,1))_((2,1),(2,1)) = 2`: the shape `(3,2,1)/(2,1)` has three cells `(0,2), (1,1), (2,0)`,
  content `(2,1)` means two `0`s and one `1`; the fillings with ballot reading word
  (order `(0,2), (1,1), (2,0)`) are `0 0 1` and `0 1 0`; the filling `1 0 0` fails the ballot
  condition at its first letter. The coefficient of `s_((3,2,1))` in `s_((2,1))²` in `d ≥ 3`
  variables is `2`.
- `c^((2))_((1),(1)) = c^((1,1))_((1),(1)) = 1` and `s_((1))² = s_((2)) + s_((1,1))`; in one
  variable the second term vanishes and `x² = x²`.
- The right-to-left order within rows is pinned by `c^((3,2))_((1),(2,2)) = 1` (Pieri): the
  filling of `(3,2)/(1)` with rows `· 0 1` and `0 1` is semistandard, its reading word `1 0 1 0`
  is not ballot, while the left-to-right word `0 1 0 1` is; the other filling, rows `· 0 0` and
  `1 1`, has reading word `0 0 1 1` and is the single Littlewood–Richardson tableau.
- RSK of the permutation `1 0 2` (one-line notation, zero-indexed) gives `P` with rows `0 2 / 1`
  and `Q` with rows `0 2 / 1`; the identity permutation gives a single row; the reversal
  `2 1 0` gives a single column. Reversing `1 0 2` gives `2 0 1`, with
  `P = 0 1 / 2 = P(1 0 2)ᵗ` and `Q = 0 2 / 1 = evac(Q(1 0 2))ᵗ`.
- The empty word on `Fin 0` gives two empty tableaux; evacuation fixes the empty tableau.
- The word `0 0` equals its reversal and has shape `(2)`, excluding shape transposition for
  plain word reversal; on `Fin 2`, its reverse complement is `1 1`, still shape `(2)`.
- On `Fin 2`, `0 1 0` has insertion tableau `0 0 / 1`; its reverse complement `1 0 1`
  has tableau `0 1 / 1`, the semistandard evacuation, with content `(1,2)` instead of `(2,1)`.
- The matrix `[[1,1],[0,0]]` gives `P = 0 1`, `Q = 0 0`; its transpose gives
  `P = 0 0`, `Q = 0 1`.

### 7.3 Finite Frobenius formulas and the Murnaghan–Nakayama rule

For every finite alphabet σ, commutative ring R and partition ρ of n, prove
`finiteFrobenius`: `p_ρ = ∑_(λ ⊢ n) χ^λ(ρ) s_λ` in `MvPolynomial σ R`, with the integer
character values mapped to R; there is no bound on the alphabet size and no characteristic
restriction. One route expands the power sums in monomial symmetric polynomials, substitutes
Young's rule for each permutation character, and collects the Kostka expansion of each Schur
polynomial. Carry out this argument over ℚ, descend its equality to ℤ by coefficientwise
injectivity of ℤ → ℚ, and then change coefficients to R. Over the same arbitrary commutative
ring and finite alphabet prove `finiteFrobeniusInverse`:
`n! • s_λ = ∑_(ρ ⊢ n) ((n!/z_ρ) χ^λ(ρ)) • p_ρ`, where n!/z_ρ is exact division in ℕ
by `TauCeti.zPart_dvd_factorial`, followed by the coefficient map to R; this follows by
substitution of `finiteFrobenius` and integral row orthogonality. For every commutative ℚ-algebra R,
deduce the normalised inverse formula `s_λ = ∑_(ρ ⊢ n) (χ^λ(ρ)/z_ρ) • p_ρ`, where the fraction
is formed in ℚ and mapped to R, using row orthogonality.
For n ≤ d and a complex class function f on Sₙ, prove `finiteFrobeniusCharacteristic`:
the underlying polynomial of `TauCeti.frobeniusCharacteristic n d h f` is
`∑_(ρ ⊢ n) (f(ρ)/z_ρ) • p_ρ`, where
`f(ρ) = TauCeti.ClassFunction.toConjClasses f (TauCeti.partitionEquivConjClasses n ρ)`.
Derive this by the Schur-coordinate expansion and the inverse formula, or by class-size
regrouping of the character pairing. In the normalised inverse and characteristic formulas
z_ρ is positive by `TauCeti.zPart_pos`; division in the coefficient ring is used only
over a ℚ-algebra (Etingof et al.,
arXiv:0901.0827v5, Proposition 4.61, p. 66, for the complex forward formula; the integral
form follows by the coefficient argument above, and the inverse and characteristic forms by
character orthogonality). *Needs:* Tau Ceti
`TauCeti.psumPart_eq_sum_character_smul_msymm`,
`TauCeti.char_permutationModule_eq_sum_kostkaNumber_mul_spechtChar`,
`TauCeti.schurPoly_eq_sum_kostkaNumber_smul_msymm`,
`TauCeti.symmetricCharacterTable_row_orthogonality`, `TauCeti.frobeniusCharacteristic_apply`,
`TauCeti.ClassFunction.toConjClasses`, `TauCeti.partitionEquivConjClasses`,
`TauCeti.card_partition_parts_mul_zPart_fin`, `TauCeti.zPart_pos`,
`TauCeti.zPart_dvd_factorial`; Mathlib
`MvPolynomial.map`, `MvPolynomial.map_injective`.

**Checks.**

- In degree zero, the empty partition has z = 1 and both polynomial bases contain 1, even
  in the empty alphabet; the characteristic of the scalar class function a is a.
- In degree two, `p_2 = s_((2)) − s_((1,1))` and `p_1² = s_((2)) + s_((1,1))`.
  At `(x,y) = (1,2)` the values are `5 = 7 − 2` and `9 = 7 + 2`; interchanging the
  trivial and sign rows would give −5 in the first equation.
- In one variable the same two identities give `x² = x² − 0 = x² + 0`; in the empty
  alphabet and positive degree both sides vanish. No stable-range bound belongs on
  `finiteFrobenius`.
- Over 𝔽₂ at `(x,y) = (1,1)`, both degree-two equations give `0 = 1 + 1`; the integral inverse
  still gives `2 s_((2)) = p_1² + p_2 = 0`, but division by z = 2 is impossible, so the
  normalised inverse formula needs its rational-algebra hypothesis.
- For S₂ with class-function values `(a,b)` on identity and transposition, the characteristic
  is `(a/2) p_1² + (b/2) p_2 = ((a+b)/2) s_((2)) + ((a−b)/2) s_((1,1))`.
  At `(a,b) = (1,0)` and `(x,y) = (1,2)`, both descriptions give 9/2, excluding a
  missing class-size denominator.
- For the standard character of S₃, the inverse formula is
  `s_((2,1)) = p_1³/3 − p_3/3`; at `(x,y) = (1,2)` both sides are 6, with
  character values `(2,0,−1)` and centralizer orders `(6,2,3)`; the integral inverse is
  `6 s_((2,1)) = 2 p_1³ − 2 p_3`, giving `36 = 54 − 18`.

State and prove `murnaghanNakayama` on cycle-type partitions: for `κ ⊢ n + r`, `r > 0`, and `ρ` the
cycle type obtained from `ν ⊢ n` by adjoining a part `r`,
`χ^κ(ρ) = ∑_μ (−1)^(height(κ/μ)) χ^μ(ν)`, the sum over `μ ⊢ n` such that `κ/μ` is a rim hook,
read with `YoungDiagram.IsRimHook` (ambient shape first) and `YoungDiagram.rimHookHeight`. Prove it
from Frobenius's formula `finiteFrobenius` in at least
`n + r` variables, the native polynomial rule `TauCeti.psum_mul_schurPoly` and the Schur basis
`TauCeti.schurPolyBasis`; then prove compatibility with representatives `σ` and derive the values
`χ^λ(1) = f^λ` and `χ^((1ⁿ)) = sgn` (Macdonald I.7, Example 5; James, Theorem 21.1; Sagan,
Theorem 4.10.2). *Needs:* §7.3 `finiteFrobenius`; Tau Ceti `TauCeti.spechtCharValue`,
`TauCeti.psum_mul_schurPoly`, `TauCeti.schurPolyBasis`; Mathlib `YoungDiagram.IsRimHook`,
`YoungDiagram.rimHookHeight`.

- `murnaghanNakayama`: the recursion above, with the sum over `μ` filtered by the rim-hook
  predicate.
- The recursion from the empty diagram determines the whole table.

**Checks.**

- `κ = (2,1)`, `ρ = (3)` (so `ν = ∅`, `r = 3`): the only rim hook of size `3` in `(2,1)` is the
  whole diagram, of height `1`, so `χ^((2,1))((3)) = (−1)^1 · 1 = −1`.
- `κ = (2,1)`, `ρ = (2,1)` with `r = 2`, `ν = (1)`: the skew shape `(2,1)/(1)` has the cells
  `(0,1)` and `(1,0)`, which are not adjacent, so it is not a rim hook, and `(2,1)/(2)` and
  `(2,1)/(1,1)` have one cell each; the sum is empty and `χ^((2,1))((2,1)) = 0`, the table value.
  A rim-hook predicate that admitted disconnected skew shapes would give `−χ^((1))((1)) = −1`
  here and is excluded.
- `κ = (1,1,1)`, `ρ = (3)`: the whole column is a rim hook of height `2`, value `+1 = sgn` of a
  `3`-cycle.
- `κ = (2,1,1)`, `ρ = (3,1)`, `r = 3`, `ν = (1)`: `(2,1,1)/(1)` has the non-adjacent cells `(0,1)`
  and `(1,0)`, and the column of three cells is not of the form `κ/μ` (its complement `{(0,1)}` is
  not a diagram), so there is no rim hook of size `3`, the sum is empty and
  `χ^((2,1,1))((3,1)) = 0`, the `S₄` table value.
- The sign is `(−1)^(rows met − 1)`, not `(−1)^(columns met − 1)`: for `κ = (2,2)`, `ρ = (2,2)`,
  `r = 2`, `ν = (2)`, the rim hook `(2,2)/(2)` (the second row, height `0`) leaves `(2)` and the
  rim hook `(2,2)/(1,1)` (the second column, height `1`) leaves `(1,1)`, so
  `χ^((2,2))((2,2)) = χ^((2))((2)) − χ^((1,1))((2)) = 1 − (−1) = 2`, the table value; the column
  convention gives `−1 − 1 = −2`.

### 7.4 The Hall form on finite symmetric polynomials and the isometry

Define `hallForm d R n` on `TauCeti.symmetricHomogeneousSubmodule (Fin d) R n` as the bilinear form
for which the native Schur basis is orthonormal, `Module.Basis.toDual` of `TauCeti.schurPolyBasis`.
Prove `hallForm_psumPart`: for `n ≤ d`, `⟨p_μ, p_ν⟩ = δ_(μν) z_μ` for elements whose underlying
polynomials are `MvPolynomial.psumPart (Fin d) R μ` and `psumPart (Fin d) R ν`, from Frobenius's
formula and the native column orthogonality `TauCeti.symmetricCharacterTable_column_orthogonality`.
Prove `hallForm_frobeniusCharacteristic`: for `n ≤ d` the native `TauCeti.frobeniusCharacteristic`
is an isometry from `TauCeti.ClassFunction.characterPairing` to `hallForm d ℂ n`, from
`TauCeti.schurPolyBasis_repr_frobeniusCharacteristic` and the orthonormality of the Specht
characters (Macdonald I.4, (4.7)–(4.8); I.7). *Needs:* §7.3 `finiteFrobenius`; Tau Ceti
`TauCeti.schurPolyBasis`,
`TauCeti.symmetricHomogeneousSubmodule`,
`TauCeti.symmetricCharacterTable_column_orthogonality`, `TauCeti.frobeniusCharacteristic`,
`TauCeti.schurPolyBasis_repr_frobeniusCharacteristic`, `TauCeti.ClassFunction.characterPairing`,
`TauCeti.zPart`; Mathlib `Module.Basis.toDual`, `MvPolynomial.psumPart`.

- `hallForm d R n (s_μ) (s_ν) = δ_(μν)` on the Schur basis vectors, by `Module.Basis.toDual_apply`.
- `hallForm_psumPart`: `⟨p_μ, p_ν⟩ = δ_(μν) z_μ` for `n ≤ d`.
- `hallForm_frobeniusCharacteristic`: `⟨ch f, ch g⟩ = (1/n!) ∑_σ f(σ) g(σ⁻¹)` for `n ≤ d`.

**Checks.**

- `n = 2 ≤ d`: `p_((1,1)) = p_1² = s_((2)) + s_((1,1))` and `p_((2)) = s_((2)) − s_((1,1))`, so
  `⟨p_((1,1)), p_((1,1))⟩ = 2 = z_((1,1))`, `⟨p_((2)), p_((2))⟩ = 2 = z_((2))` and
  `⟨p_((1,1)), p_((2))⟩ = 1 − 1 = 0`.
- `d = 1 < n = 2`: `p_((2)) = p_((1,1)) = x²` and the Schur basis is `{s_((2))}` alone, so
  `⟨p_((2)), p_((1,1))⟩ = 1 ≠ 0` and `⟨p_((1,1)), p_((1,1))⟩ = 1 ≠ 2`: the hypothesis `n ≤ d` is
  necessary.
- The isometry for `n = 2`: `ch(χ^((2))) = s_((2))`, `ch(χ^((1,1))) = s_((1,1))`, and the
  character pairing of two distinct irreducible characters is `0`, of a character with itself `1`.
- A form defined as the dot product of monomial coordinates is not the Hall form: in `d = 2`,
  `s_((2)) = m_((2)) + m_((1,1))` would have norm `2`.

### 7.5 The stable ring `Λ_R`, its Hall form and `ω`

For every commutative ring `R` define the degree-`n` module as the submodule of compatible families
in `∀ d, TauCeti.symmetricHomogeneousSubmodule (Fin d) R n`, compatible under
`MvPolynomial.aeval (Fin.snoc MvPolynomial.X 0)`; their direct sum over `n` is `Λ_R`. Build the
graded commutative `R`-algebra structure from componentwise multiplication, the degree-`(n+m)`
multiplication maps, the unit, and the algebra specialisation maps to each finite alphabet; prove
projection in degree `n` is a linear equivalence onto `TauCeti.symmetricHomogeneousSubmodule (Fin d) R n`
for `d ≥ n`, from the native Schur bases and `TauCeti.aeval_snoc_zero_diagramSchurPoly`. Construct
the degreewise Schur basis, the stable elementary, complete and power-sum families (the stable
`P_n` for `n > 0` with components `MvPolynomial.psum (Fin d) R n`; the finite zeroth power sum is
`d` and defines no stable `P_0`), and their specialisation identities. Prove the stable fundamental
theorem `Λ_R ≃ₐ[R] R[e₁, e₂, …]` (generator `r` representing `e_(r+1)`), the analogous free
generation by the `h_r` through the triangular change of generators, and construct the involution
`ω` exchanging `e_r` and `h_r`. Build dual Jacobi–Trudi `s_λ = det(e_(λᵗ_i − i + j))` by the
complementary-minor identity for the mutually inverse Toeplitz matrices `H` and `E`
(`∑_(i=0)^r (−1)^i e_i h_(r−i) = δ_(r,0)`), prove `ω(s_λ) = s_(λᵗ)` from the two Jacobi–Trudi
identities, `ω² = id`, and recover each Pieri rule from the other under `ω`. Define the degreewise
Hall form by the dot product of stable Schur coordinates. Prove that it agrees with §7.4's
`hallForm` after projection to any `d ≥ n` in degree `n`, independently of the chosen `d`;
only this stable tail preserves the form. Pair different degrees by zero, and prove `⟨p_μ, p_ν⟩ = δ_(μν) z_μ` from
`hallForm_psumPart`. Give the rational power-sum presentation: for `[Algebra ℚ R]`, the
`R`-algebra `MvPolynomial ℕ R` with `X r` representing `p_(r+1)` maps isomorphically onto `Λ_R`,
with inverse through the free elementary generators and Newton's recursion
`E_n = (1/n) ∑_(i=1)^n (−1)^(i−1) E_(n−i) X_(i−1)` (the factor `1/n` is the image of the rational
inverse, so no division is asserted over a general ring); prove the composites are identities by
generator extensionality, the compatibility with specialisation, coefficient-change naturality,
and that it preserves the weighted grading `deg X_r = r + 1` (Macdonald I.2, (2.11′), (2.12),
(2.14′); I.3, (3.4), (3.5), (3.8); I.4, (4.7), (4.8); I.5, (5.16), (5.17)). *Needs:* §7.4;
Tau Ceti `TauCeti.symmetricHomogeneousSubmodule`, `TauCeti.schurPolyBasis`,
`TauCeti.aeval_snoc_zero_diagramSchurPoly`, `TauCeti.aeval_snoc_zero_hsymmInt`,
`TauCeti.schurPoly_eq_det_hsymmInt`, `TauCeti.hsymm_mul_schurPoly`; Mathlib `DirectSum.GAlgebra`,
`MvPolynomial.esymmAlgEquiv`, `MvPolynomial.mul_esymm_eq_sum`.

- `Λ_R` is a graded commutative `R`-algebra whose degree-`n` part projects isomorphically to the
  degree-`n` symmetric polynomials in `d ≥ n` variables.
- `ω` is an algebra involution with `ω(e_r) = h_r`, `ω(p_r) = (−1)^(r−1) p_r` and `ω(s_λ) = s_(λᵗ)`.
- `⟨p_μ, p_ν⟩ = δ_(μν) z_μ` and the Schur functions are orthonormal.

**Checks.**

- `e_2 = (p_1² − p_2)/2`, `h_2 = (p_1² + p_2)/2`; `ω(e_2) = h_2` and `ω(p_2) = −p_2`.
- `s_((2,1)) = h_2 h_1 − h_3 = e_2 e_1 − e_3` by both Jacobi–Trudi identities, and
  `ω(s_((2,1))) = s_((2,1))`.
- Stable `s_((1,1))` has norm `1`, as does its image in every `d ≥ 2`. In one variable its
  image is `0` with norm `0`: projection below degree is neither injective nor an isometry.
- The specialisation `MvPolynomial.psum (Fin d) R 0 = d` depends on `d`, so there is no stable
  `P_0`; an algebra map sending `X 0 ↦ p_1` with the index shift is the right model, one sending
  `X 0 ↦ p_0` is excluded.
- Newton for `n = 3`: `E_3 = (1/3)(E_2 p_1 − E_1 p_2 + E_0 p_3) = (p_1³ − 3 p_1 p_2 + 2 p_3)/6`.

### 7.6 The stable Frobenius characteristic and induction

Over `ℂ` construct `ch_n : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n)) ≃ₗ[ℂ] Λ_(ℂ,n)` with
projection at every `d ≥ n` exactly `TauCeti.frobeniusCharacteristic n d h`; prove the stable
cycle-type formula `ch(f) = ∑_μ f(μ) p_μ / z_μ` from `finiteFrobeniusCharacteristic`,
`ch(χ^λ) = s_λ`, and the isometry with the stable Hall form from `hallForm_frobeniusCharacteristic`.
Identify `TauCeti.virtualCharacters ℂ Sₙ` with the `ℤ`-lattice of Schur coordinates and restrict
`ch` to an isomorphism onto `Λ_(ℤ,n)` through the coefficient embedding `Λ_ℤ → Λ_ℂ`; the virtual
characters are a proper sublattice of the integer-valued class functions (for `n = 2` the class
function with values `1, 0` is not virtual). Build the block embedding `Sₙ × Sₘ → S_(n+m)` from
`Equiv.Perm.finSumPermHom`, its image subgroup and the inverse isomorphism, the external product
class function `(σ, τ) ↦ f(σ) g(τ)` transported to that subgroup, and prove
`ch(Ind(f ⊠ g)) = ch(f) · ch(g)` in `Λ_ℂ`, with induction `TauCeti.ClassFunction.ind S` for the image subgroup
`S : Subgroup (Equiv.Perm (Fin (n + m)))`, with `[S.FiniteIndex]` supplied by finiteness of S_(n+m),
and Frobenius reciprocity from InductionRestriction Layer 2 (Macdonald I.7). *Needs:* §7.3
`finiteFrobeniusCharacteristic`, §§7.4–7.5; Tau Ceti
`TauCeti.frobeniusCharacteristic`, `TauCeti.virtualCharacters`,
`TauCeti.ClassFunction.ind`, `Equiv.Perm.finSumPermHom`; InductionRestriction Layer 2.

- `ch` is an isometric linear equivalence, `ch(χ^λ) = s_λ`, `ch(1_(Sₙ)) = h_n`, `ch(sgn) = e_n`.
- `ch(Ind(f ⊠ g)) = ch(f) ch(g)`; in particular `ch(M^μ) = h_μ` and Young's rule is the Kostka
  expansion of `h_μ`.

**Checks.**

- `n = m = 1`: `Ind` of the trivial character of `S₁ × S₁` is the regular character of `S₂`,
  `ch = p_1² = h_2 + e_2 = s_((2)) + s_((1,1))`.
- `ch(χ^((2,1))) = 2 p_1³/6 + 0 · p_2 p_1/2 − p_3/3 = (p_1³ − p_3)/3 = s_((2,1))`, with
  `z_((1,1,1)) = 6`, `z_((2,1)) = 2`, `z_((3)) = 3`.
- The block embedding of `(σ, τ)` acts on the first `n` and the last `m` points; the other
  convention (last `n`, first `m`) gives a conjugate subgroup and the same induced class function.

### 7.7 Hopf structure

Construct the graded Hopf maps on the free elementary generators of `Λ_R`:
`Δ(e_n) = ∑_(i=0)^n e_i ⊗ e_(n−i)`, `ε(e_n) = 0` for `n > 0`, `S(e_n) = (−1)^n h_n`, with
`e_0 = h_0 = 1`; prove coassociativity, cocommutativity, the counit and antipode laws by generator
extensionality and `H(−t) E(t) = 1`; compare `Δ` with splitting alphabets through
`Fin d ⊕ Fin e ≃ Fin (d + e)`; prove `Δ(P_n) = P_n ⊗ 1 + 1 ⊗ P_n`, `ε(P_n) = 0`, `S(P_n) = −P_n`
for `n > 0`, and that the rational presentation of §7.5 intertwines these with the
primitive-power-sum Hopf structure (Macdonald I.5, Example 25). *Needs:* §7.5.

**Checks.**

- `Δ(e_1) = e_1 ⊗ 1 + 1 ⊗ e_1` and `S(e_1) = −e_1`; `Δ(h_2) = h_2 ⊗ 1 + h_1 ⊗ h_1 + 1 ⊗ h_2`.
- `S(e_2) = h_2`, consistent with `e_2 − e_1 h_1 + h_2 = 0`.
- The coefficient of `e_1 ⊗ e_1` in `Δ(e_2)` is `1`: splitting the alphabet `{x,y}` as
  `{x}` and `{y}` gives `e_2(x,y) = xy`; a primitive coproduct for `e_2` would give `0`.

### 7.8 Matrix trace specialisation of Newton's identities

For `A ∈ Mat_d(R)` over a commutative ring, put `p_j(A) = tr(A^j)` for `j > 0`,
`c_r(A) = coeff_r (A.charpolyRev)` and `E_r(A) = (−1)^r c_r(A)`. Prove `c_0 = E_0 = 1`,
`c_r = E_r = 0` for `r > d`, and for `0 ≤ r ≤ d` the identification `coeff_(d−r) (A.charpoly) =
c_r(A)` through `Matrix.reverse_charpoly`, so that `E_d = det A`; the convention avoids truncated
subtraction for `r > d`, and `d = 0` has characteristic polynomial `1` and all positive traces
`0`. Prove the integral recurrence `r c_r(A) = −∑_(j=1)^r c_(r−j)(A) p_j(A)` for every `r > 0`,
equivalently `r E_r = ∑_(j=1)^r (−1)^(j−1) E_(r−j) p_j`, by proving it on the universal matrix
over `ℤ` (`Matrix.charpoly.univ_map_eval₂Hom`) through its injective passage to a
characteristic-zero splitting field, where `E_r` is the elementary symmetric function and `p_j`
the power sum of the root multiset with algebraic multiplicities (built from the generalised
eigenspace decomposition and nilpotent trace identities, without assuming diagonalisability), and
specialising coefficientwise; so the final statement has no field, splitting or
invertibility-of-`r` hypothesis. For a commutative `ℚ`-algebra solve the recurrence through §7.5's
rational presentation: `E_r(A) = ∑ (−1)^(r − ∑ m_j) ∏_j p_j(A)^(m_j) / (j^(m_j) m_j!)` over
`m₁ + 2m₂ + ⋯ + r m_r = r`, and `c_r` with the sign `(−1)^(∑ m_j)`; the two signs differ in odd
degree. Prove coefficient-ring naturality, reindexing and similarity invariance, export the
basis-independent statement for an endomorphism of a finite-dimensional vector space through
`LinearMap.charpoly_toMatrix` and `LinearMap.trace_eq_matrix_trace`, and for a finite-dimensional
representation identify `p_j(ρ(g)) = χ_ρ(g^j)`, so that the dimension and the character values on
`g, g², …, g^d` determine the characteristic polynomial of `ρ(g)`; prove transport under
isomorphism and scalar extension (Macdonald I.2, (2.11′) and (2.14′); the matrix form is the
specialisation at the eigenvalue multiset). The integral recurrence is `matrixTraceNewton` in `Suggested.lean`. *Needs:* §7.5; Mathlib `Matrix.charpoly`, `Matrix.charpolyRev`,
`Matrix.reverse_charpoly`, `Matrix.charpoly.univ_map_eval₂Hom`, `MvPolynomial.mul_esymm_eq_sum`,
`LinearMap.charpoly_toMatrix`, `LinearMap.trace_eq_matrix_trace`; Tau Ceti
`Multiset.mul_esymm_eq_sum`.

- The recurrence holds over every commutative ring, in every characteristic.
- `E_1 = p_1`, `2E_2 = p_1² − p_2`, `6E_3 = p_1³ − 3p_1p_2 + 2p_3`,
  `24E_4 = p_1⁴ − 6p_1²p_2 + 3p_2² + 8p_1p_3 − 6p_4`.

**Checks.**

- `d = 2`: `det(X − A) = X² − tr(A) X + det A`, so `c_1 = −tr A`, `c_2 = det A`, and
  `2 c_2 = −(c_1 p_1 + c_0 p_2) = tr(A)² − tr(A²)` gives `det A = (tr(A)² − tr(A²))/2` over `ℚ`.
- `d = 0`: `charpolyRev = 1`, both sides of the recurrence are `0` for every `r > 0`.
- A four-dimensional representation with `g² = 1`: `p_1 = χ(g)`, `p_2 = 4`, `p_3 = χ(g)`,
  `p_4 = 4`, and the quartic is `(X − 1)^a (X + 1)^(4−a)` with `a = (4 + χ(g))/2`; with
  `g³ = 1`, `p_3 = 4`; with `g⁴ = 1`, `p_4 = 4`. For a trivial summand of dimension `s`,
  `charpoly(ρ(g) ⊕ id_s) = charpoly(ρ(g)) (X − 1)^s` and `p_j(ρ(g) ⊕ id_s) = p_j(ρ(g)) + s`,
  including `s = 0` and zero-dimensional `ρ`.
- The sign: `c_1 = −p_1` but `E_1 = +p_1`; a convention taking `E_r = c_r` fails at `r = 1`.

### 7.9 Power-sum bases in finitely many variables

Prove `finitePowerSumBasis`: over `ℚ`, the products `p_μ` over all partitions `μ ⊢ r` specialise to a basis of the
degree-`r` symmetric polynomials in `d ≥ r` variables, from the stable comparison and its finite
projection; in `d < r` variables the Schur or monomial basis indexed by partitions with at most
`d` parts gives the dimension, and the full power-sum family is dependent. Supply the
specialisation and quotient equations. These are statements about bases of symmetric-polynomial
spaces, not about values at a single matrix; the finite zeroth trace `p_0 = d` is a dimension
parameter and not a generator (Macdonald I.2, (2.12)). *Needs:* §7.5; Tau Ceti
`TauCeti.msymmBasis`, `TauCeti.schurPolyBasis`, `TauCeti.zPart`; Mathlib `MvPolynomial.psumPart`.

**Checks.**

- `r = 2`, `d = 1`: `p_((2)) = p_((1,1)) = x²`, dependent; the Schur basis `{s_((2))}` has one
  element.
- `r = 2`, `d = 2`: `p_((2)) = x² + y²` and `p_((1,1)) = (x + y)²` are independent.

### Examples

The running examples are `c^((3,2,1))_((2,1),(2,1)) = 2`, the `S₃` values of §7.3 and the
degree-`2` Hall computations of §7.4; the Schur–Weyl example of Layer 8 uses `s_((2))` and
`s_((1,1))` in two variables.

### Dependencies

Tau Ceti Layer 7 suppliers; Layers 4–6; InductionRestriction Layer 2 (§7.6 only); Mathlib
`Module.Basis.toDual`, `DirectSum.GAlgebra`, `Matrix.charpolyRev`.

## Layer 8: Schur-Weyl duality

The permutation action `TauCeti.permTensorAction ℂ d n`, its algebra map from `ℂ[Sₙ]`, the diagonal
`GLₔ`-action `TauCeti.tensorPowerRep ℂ d n`, the two centralizer equalities, the membership
criterion `TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`, faithfulness exactly when
`n ≤ d`, the Schur functor `TauCeti.schurFunctor d μ` of ClassicalGroups Layer 2 and the
sum-of-dimensions identity are consumed (*From Tau Ceti*, Layer 8). For `d < n` the sign shape
`(1ⁿ)` already lies in the kernel, and the partner of `GLₔ` is the image of `ℂ[Sₙ]`, a proper
quotient.

### 8.1 The simultaneous decomposition

Prove `schurWeylDecomposition`: a `ℂ`-linear equivalence
`(ℂᵈ)^(⊗n) ≃ ⊕_(μ ⊢ n, ℓ(μ) ≤ d) S^μ_ℂ ⊗ 𝕊^μ(ℂᵈ)` that intertwines `TauCeti.permTensorAction ℂ d n`
with the summand-wise complex Specht actions and `TauCeti.tensorPowerRep ℂ d n` with the
summand-wise Schur-functor actions, both transported by `DirectSum.lmap`. The route: the isotypic
decomposition of the tensor power over the semisimple algebra `ℂ[Sₙ]`, the complex Specht/ideal
comparison, and the native `GL`-equivariant comparison
`TauCeti.YoungTableau.intertwiningMapEquivWeylModule` from the intertwiner space to the symmetrizer
image. A dimension identity alone does not discharge it (Fulton–Harris, Theorem 6.3; Goodman–Wallach,
§9.1.1). *Needs:* Tau Ceti `TauCeti.permTensorAction`, `TauCeti.tensorPowerRep`,
`TauCeti.spechtModuleℂ`, `TauCeti.schurFunctor`, `TauCeti.YoungTableau.intertwiningMapEquivWeylModule`,
`TauCeti.centralizer_range_tensorPowerRep_eq_range_permTensorActionAlgHom`; ClassicalGroups Layer 2;
Mathlib `DirectSum.lmap`, Maschke's theorem.

- `schurWeylDecomposition`: the equivariant equivalence above, for every `d` and `n`.
- Taking dimensions recovers `TauCeti.sum_finrank_spechtModule_mul_finrank_weylModuleOfShape`.

**Checks.**

- `d = 2, n = 2`: `(ℂ²)^(⊗2) ≅ S^((2)) ⊗ Sym²(ℂ²) ⊕ S^((1,1)) ⊗ ⋀²(ℂ²)`, dimensions `1·3 + 1·1 = 4`.
- `d = 1, n = 2`: only `(2)` survives, `(ℂ)^(⊗2) ≅ S^((2)) ⊗ Sym²(ℂ)`, dimension `1`; the shape
  `(1,1)` contributes `⋀²(ℂ) = 0`.
- `n = 0`: the empty tensor power is `ℂ`, the single shape `∅` gives `S^∅ ⊗ 𝕊^∅ = ℂ ⊗ ℂ`.
- A map that is only `Sₙ`-equivariant is not unique: on `(ℂ²)^(⊗2)` the `S₂`-isotypic components
  are `Sym²` and `⋀²`, but inside the `(2)`-component any `GL₂`-non-equivariant automorphism of
  `Sym²(ℂ²)` also intertwines `S₂`.

### 8.2 The balanced tensor presentation

For every `d, n : ℕ` and `μ ⊢ n`, define `balancedSchurRelations d n mu` in
`(ℂᵈ)^(⊗n) ⊗[ℂ] S^μ` as the complex span of `(v · σ) ⊗ s − v ⊗ (σ · s)` for `σ ∈ Sₙ`,
with the right action `v · σ = permTensorAction(σ⁻¹) v`. By linearity this is also the span of
the relations for every `a ∈ ℂ[Sₙ]`. Its quotient is the balanced tensor product
`(ℂᵈ)^(⊗n) ⊗_(ℂ[Sₙ]) S^μ`. Prove `balancedSchurPresentation`: there is a surjective complex
linear map from the ordinary tensor product to `𝕊^μ(ℂᵈ)` with kernel exactly
`balancedSchurRelations d n mu`, intertwining the diagonal `GLₔ` action on the tensor-power
factor with the Schur-functor action. This induces the full `GLₔ`-equivariant quotient
equivalence, including when `ℓ(μ) > d`. A route uses Specht self-duality (§4.3) and the
intertwiner comparison of §8.1 (Fulton–Harris, §6.1). *Needs:* §§4.3, 8.1; Tau Ceti
`TauCeti.permTensorAction`, `TauCeti.tensorPowerRep`, `TauCeti.spechtModuleℂ`,
`TauCeti.schurFunctor`; Mathlib `TensorProduct`, `Submodule.span`, `LinearMap.ker`.

- The relation span is invariant under `GLₔ` acting on the tensor-power factor, so this action
  descends to the quotient.
- For every complex vector space `W`, a bilinear map from the tensor power and `S^μ` to `W`
  factors uniquely through the quotient exactly when it sends `(v · σ, s)` and `(v, σ · s)`
  to the same value for every `v, s, σ`.
- `balancedSchurPresentation` identifies that quotient with the native Schur functor, with the
  full kernel and surjectivity conditions excluding a map onto a proper subspace.

**Checks.** Identify a one-dimensional row or column Specht module with `ℂ` by a
nonzero generator in the following coordinate tests.

- `d = n = 2`, `μ = (2)`: the relation span is generated by `e₁ ⊗ e₀ − e₀ ⊗ e₁`, has
  dimension `1`, and the quotient has dimension `4 − 1 = 3 = dim Sym²(ℂ²)`. The class of
  `e₀ ⊗ e₀` is nonzero; killing the entire tensor product would fail this test.
- `d = n = 2`, `μ = (1,1)`: the relation span is generated by `2e₀ ⊗ e₀`,
  `e₁ ⊗ e₀ + e₀ ⊗ e₁` and `2e₁ ⊗ e₁`; its dimension is `3`, giving quotient dimension
  `4 − 3 = 1 = dim ⋀²(ℂ²)`. Using the trivial Specht action would give dimension `3` instead.
- `d = 1, n = 2`, `μ = (1,1)`: the relation `2e₀ ⊗ e₀` spans the whole one-dimensional
  source, so the quotient and the Schur functor are both zero.
- `n = 0`, including `d = 0`: every relation is zero, and the quotient is `ℂ ⊗ ℂ ≅ ℂ`, of
  dimension `1`; for `d = 0, n > 0` the source and quotient are zero.
- For `g = diag(2,3)` on `ℂ²`, the row quotient has eigenvalues `4,6,9` and the column
  quotient eigenvalue `6`; the quotient comparison must preserve these actions, not just dimensions.
- In `S₃`, set `σ = (0 1)`, `τ = (1 2)` and `v = e₀ ⊗ e₁ ⊗ e₂`. Then
  `(v · σ) · τ = v · (στ) = e₁ ⊗ e₂ ⊗ e₀`, so balancing twice gives
  `[(v · σ) · τ ⊗ s] = [v ⊗ σ(τ s)]`. Using the left action as a right action instead
  gives `e₂ ⊗ e₀ ⊗ e₁`, detecting the reversed product.

### 8.3 Schur-functor and stable-character transpose comparisons

For `λ ⊢ a`, `μ ⊢ b`, compare §4.4's induced multiplicity spaces with the multiplicities in
`𝕊^λ(ℂᵈ) ⊗ 𝕊^μ(ℂᵈ)` using §8.1 and the balanced presentation. Prove that replacing
`λ, μ, ν` by their transposes preserves these abstract multiplicity spaces; each finite-rank
Schur summand vanishes when its shape has more than `d` rows. Under the stable character map,
identify this comparison with `ω(s_λ s_μ) = s_(λᵗ) s_(μᵗ)` (James, Theorem 16.4;
Macdonald I.7 and I.9). *Needs:* §§4.4, 7.5–7.6, 8.1–8.2; ClassicalGroups Layer 2.

**Checks.**

- `λ = μ = (1)`: both `(2)` and `(1,1)` have multiplicity `1`; transposition exchanges them.
- At `d = 1`, `𝕊^((1,1)) = 0` but `𝕊^((2))` has dimension `1`, so transposition does not
  assert equality of finite-rank dimensions.
- `ω(s_1²) = s_1² = s_2 + s_11` agrees with the exchanged multiplicities.

### Examples

`(ℂ²)^(⊗2)`: the two actions commute, `Sym²` has dimension `3` and `⋀²` dimension `1`.

### Dependencies

Tau Ceti Layer 8 suppliers; Layer 4 (§4.3 for §8.2); ClassicalGroups Layer 2; Mathlib
`DirectSum.lmap`, `TensorProduct`.

## Layer 9: Schur-Weyl duality for the orthogonal and symplectic groups (the Brauer algebra)

Layer 8 is the `GLₔ × Sₙ` duality on `V^(⊗n)` with no extra structure. Fixing a nondegenerate
invariant form on `V` cuts `GLₔ` to `O_n` or `Sp_(2l)`, and the centralizer of the smaller group is
the image of the Brauer algebra `B_k(δ)`, whose diagrams may join two bottom or two top points by
an arc that contracts the paired slots against the form. The permutation diagrams form `ℂ[S_k]`
inside it over `ℂ` (and `R[S_k]` over a general coefficient ring); the planar diagrams form the Temperley–Lieb subalgebra of TemperleyLieb Layer 2.
The diagram combinatorics, the standard representations, the equivariant self-dualities and the
cup, cap, crossing and cup-cap operators with their relations are consumed (*From Tau Ceti*,
Layer 9).

### 9.1 The Brauer algebra

For a commutative ring `R` and `δ ∈ R`, define `B_k(δ)` as the free module on `TauCeti.BrauerDiagram k` with the product
`D₁ * D₂ = δ^(loop(D₁, D₂)) • (D₁ ∘ D₂)`, `loop = TauCeti.middleLoopCount` and `∘ = TauCeti.composeDiagram`;
prove the three-layer loop identity `loop(D₁, D₂) + loop(D₁ ∘ D₂, D₃) = loop(D₂, D₃) + loop(D₁, D₂ ∘ D₃)`,
hence associativity from `TauCeti.composeDiagram_assoc`; the unit is the identity diagram
`TauCeti.permToBrauer 1`. The diagram basis has cardinality `(2k − 1)!!` for `k > 0`
and `1` for `k = 0`, by `TauCeti.card_brauerDiagram`; over a field this is the dimension.
For a ring homomorphism `f : R → S`, construct the coefficient-change map
`B_k(δ) → B_k(f(δ))` and the scalar-extension isomorphism `S ⊗_R B_k(δ) ≅ B_k(f(δ))`,
with identity and composition laws. Build the algebra map `R[S_k] → B_k(δ)` sending `σ` to `TauCeti.permToBrauer σ`, injective by `TauCeti.permToBrauer_injective`,
multiplicative by `TauCeti.composeDiagram_permToBrauer`. Prove the generator presentation: `s_i`
(adjacent crossings) and `e_i = TauCeti.capCup i (i+1)` satisfy `s_i² = 1`, `e_i² = δ e_i`,
`s_i e_i = e_i s_i = e_i`, the braid relations, `e_i e_(i±1) e_i = e_i`, `s_i e_(i+1) e_i = s_(i+1) e_i`,
and commutation at distance, from `TauCeti.composeDiagram_capCup_capCup`,
`TauCeti.middleLoopCount_capCup_capCup` and the relations file; prove they generate `B_k(δ)`
(Brauer 1937, §5; Doty–Hu, §1, p. 2, for the integral algebra and base change). *Needs:* Tau Ceti `TauCeti.BrauerDiagram`,
`TauCeti.composeDiagram`, `TauCeti.middleLoopCount`, `TauCeti.composeDiagram_assoc`,
`TauCeti.permToBrauer`, `TauCeti.capCup`, `TauCeti.card_brauerDiagram`; Mathlib `MonoidAlgebra`,
`Module.Basis`.

- `B_k(δ)` is a unital associative `R`-algebra with the diagram basis and coefficient-change maps.
- `B_0(δ) = B_1(δ) = R`; `B_2(δ)` has basis `1, s, e` with `s² = 1`, `e² = δe`, `se = es = e`.

**Checks.**

- `k = 2`: `e * e` stacks two cup-caps and closes one loop, so `e * e = δ e`; `s * e = e` since
  the crossing above a cup reconnects to the same cup. A loop rule with `δ^(loop)` replaced by
  `δ` fails at `k = 4` on `(e_1 e_3)(e_1 e_3) = δ² e_1 e_3`.
- `(2k − 1)!!` for `k = 3` is `15`; the `6` permutation diagrams plus `9` diagrams with one arc.
- The loop identity for `D₁ = D₂ = D₃ = e` in `B_2`: `1 + 1 = 1 + 1`.
- Over `ℤ` and `𝔽₂`, `B_2(0)` has diagram basis `1,s,e` with `s² = 1`, `se = e`, `e² = 0`;
  reduction modulo two preserves all three products. Over the zero ring the same basis index
  type exists but the module is zero, so no unconditional natural-number dimension is asserted.

### 9.2 The orthogonal and symplectic actions

Over every commutative ring `R`, use the standard nondegenerate dot product or standard
alternating form on the finite free coordinate module. Construct `ρ_O : B_k(n) →ₐ[R] End(V^(⊗k))` for `V = Fin n → R`: through-strands permute slots by
`TauCeti.permTensorAction R n k`, each bottom arc contracts a pair of slots by the dot product
(cap) and each top arc expands a pair by `∑ e_i ⊗ e_i` (cup); prove `ρ_O(e_(ab)) =
TauCeti.orthogonalCupCapAt R n k a b` for `a ≠ b`, that `ρ_O` is an algebra map (the generator
relations at `δ = n`, from `TauCeti.orthogonalCupCapAt_mul_self`,
`TauCeti.permTensorAction_mul_orthogonalCupCapAt` and the relations file), and that it commutes
with `orthAction R n k`, the native `(TauCeti.stdOrthogonalRep R n).tensorPower k`, by
`TauCeti.commute_orthogonalCupCapAt_tensorPower`. Construct `ρ_Sp : B_k(−2l) →ₐ[R] End(V^(⊗k))` for
`V = (Fin l ⊕ Fin l) → R`: order every cap and cup by increasing slot index and use the inverse-form
cup `TauCeti.symplecticCup`; the permutation diagram of `σ` acts as `sgn(σ) •
PiTensorProduct.reindexRepresentation` so that an adjacent crossing is minus the flip and
`s_i e_i = e_i` holds for the alternating cup-cap; the two-strand cup-cap acts as the native
`TauCeti.symplecticCupCap R l`; build its placements at arbitrary ordered pairs of slots by
tensoring with identities and reindexing; prove the generator relations with these signs at
`δ = −2l` from `TauCeti.symplecticCap_comp_symplecticCup` and the symplectic relations file, and
commutation with `(TauCeti.stdSymplecticRep R l).tensorPower k` (Goodman–Wallach, §10.1.1;
Dipper–Doty–Hu, arXiv v2, §1, p. 4, display preceding Theorem 1.2;
Doty–Hu, §1, pp. 2–3, for coefficient rings). *Needs:* §9.1; Tau Ceti `TauCeti.orthogonalCupCapAt`,
`TauCeti.orthogonalCupCapAt_mul_self`, `TauCeti.permTensorAction_mul_orthogonalCupCapAt`,
`TauCeti.commute_orthogonalCupCapAt_tensorPower`, `TauCeti.symplecticCup`, `TauCeti.symplecticCupCap`,
`TauCeti.symplecticCrossing`, `TauCeti.symplecticCap_comp_symplecticCup`,
`TauCeti.commute_symplecticCupCap_tensorPower`, `PiTensorProduct.reindexRepresentation`.

- `orthAction`: the native diagonal action of `O_n` on `V^(⊗k)`.
- `brauerGenerators R n k`: the set of the permutation operators and the cup-caps `e_(ab)`, `a ≠ b`;
  `ρ_O` maps `B_k(n)` onto `Algebra.adjoin R (brauerGenerators R n k)`.
- `ρ_O(permToBrauer σ) = TauCeti.permTensorAction R n k σ` and
  `ρ_Sp(permToBrauer σ) = sgn(σ) • reindexRepresentation σ`.

**Checks.**

- Orthogonal loop value: `cap ∘ cup = ∑_i e_i · e_i = n`, so `e² = n e` on `V^(⊗2)`.
- Symplectic over `ℤ`, `l = 1`: `cap(θ) = ω(e, f) − ω(f, e) = −2`, so `e² = −2 e`; the flip sends `θ` to
  `−θ`, so minus the flip fixes `θ` and `s e = e`. With the flip itself, `s e = −e` and the
  Brauer relation fails: this pins the sign on permutation diagrams.
- `orthogonalCupCapAt` at `a = b` is not an arc; `brauerGenerators` excludes it. Including it
  would add the rank-one map `v ↦ (∑_a v_a) 1` on one slot, which does not commute with `O_n`
  over `ℂ` for `n ≥ 2` (for `n = 2`, the reflection `diag(−1,1)` gives
  `(−1,1)` versus `(−1,−1)` on the first basis vector).
- `n = 0`: `V = 0`, `V^(⊗k) = 0` for `k ≥ 1`, every statement is about the zero algebra; `k = 0`:
  `V^(⊗0) = R`, `B_0 = R` acting by scalars.

### 9.3 The invariant-tensor bridge and the first fundamental theorem

First, over `ℂ`, prove complete reducibility of each rational tensor representation of `O_n`
and `Sp_(2l)`, using ReductiveGroups Layers 3 and 6 and averaging over the finite component group.
Deduce that its generated group-image algebra is a product of full matrix algebras on the
irreducible factors, and equals its double commutant. This input uses neither the Brauer FFT
nor the filtration. After the FFT below, its commutant is the Brauer image, also semisimple.

For the bridge and FFT, let `K` be an infinite field, with `2 ≠ 0` in the orthogonal case;
no characteristic restriction is imposed in the symplectic case. Write `G` for `O_n` or
`Sp_(2l)`, `V` for its standard module, `φ : V ≃ V^*` for the native
equivariant self-duality (`TauCeti.stdOrthogonalRepToDual`, `v ↦ v ⬝ᵥ ·`, or
`TauCeti.stdSymplecticRepToDual`, `v ↦ ω(v, ·)`), and `T^(k,k) = ⨂[K] (_ : Fin k ⊕ Fin k), V`
with `Sum.inl` the input slots and `Sum.inr` the output slots, the boundary of a `TauCeti.BrauerDiagram k`.

1. *Endomorphisms as tensors.* Construct `Ξ_k : End(T^k) ≃ T^(k,k)` as the composite of the inverse
   of `dualTensorHomEquiv` (on `Dual(T^k) ⊗ T^k`, a finite free module), the inverse of
   `PiTensorProduct.dualDistribEquiv` on the first factor, `φ⁻¹` in every input slot, and
   `PiTensorProduct.tmulEquiv`; prove `Ξ_k(ρ_G(g) ∘ f ∘ ρ_G(g)⁻¹) = g · Ξ_k(f)` for the diagonal
   action on all `2k` slots from the native equivariance of `φ`; so `f` commutes with the image of
   `G` iff `Ξ_k(f)` is `G`-invariant.
2. *Matching tensors.* Order the `2k` slots with every input before every output, each block by
   index; for `D : TauCeti.BrauerDiagram k` orient each arc from its smaller endpoint and let `t_D`
   be the tensor product of native cups placed in the oriented arcs. Prove `t_D` is `G`-invariant
   (`TauCeti.piTensorProductMap_comp_orthogonalCup`, `TauCeti.piTensorProductMap_comp_symplecticCup`);
   prove relabelling: reindexing `t_D` by a slot permutation `π` gives `t_(π·D)` in the orthogonal
   case and `(−1)^r t_(π·D)` in the symplectic case, `r` the number of arcs whose orientation `π`
   reverses; prove `Ξ_k(ρ(D)) = ε(D) t_D` with `ε = 1` orthogonally and an explicit sign
   `ε(D) ∈ {±1}` symplectically.
3. *The tensor theorem, in every dimension.* Prove the `G`-invariants of `T^(k,k)` are the span of
   the `t_D`, for every `n`, `l`, `k`, and that invariants in odd tensor degree vanish.
   In characteristic different from two this
   follows from `−1 ∈ G`; for symplectic groups in characteristic two use the weights of the
   split diagonal torus (an odd sum of standard weights cannot be zero). Matching tensors
   are independent for `n ≥ k`, respectively `l ≥ k`; independence is not used for spanning.
4. *The commutant.* `f` centralizes the image of `G` iff `Ξ_k(f)` is invariant iff it lies in the
   span of the `t_D = ε(D) Ξ_k(ρ(D))` iff `f ∈ range ρ`. This is `orthogonal_centralizer_eq_adjoin_brauerGenerators`
   (the centralizer of `orthAction K n k` equals `Algebra.adjoin K (brauerGenerators K n k)`, the image of
   `ρ_O`) and its symplectic analogue with `B_k(−2l)` (Doty–Hu, Theorem 1.2(b), every infinite
   field of odd characteristic; Dipper–Doty–Hu, Theorem 1.2(1) over `ℂ` and Theorem 1.4 over every
   infinite field; Goodman–Wallach, §5.3.2). The kernel of `ρ` (the second fundamental theorem) is
   not needed. Prove the reverse centralizer
   `centralizer_adjoin_brauerGenerators_eq_adjoin_orthAction` and its symplectic analogue as a
   double-centralizer statement over `ℂ`, using the group-image semisimplicity proved first
   in this subsection. No semisimplicity assertion in positive characteristic is inferred.

A characteristic-zero route for step 3 over `ℂ`. Fix an invariant `u`. The polynomial map `μ(g) = g^(⊗2k) u` on
square matrices of size `dim V` satisfies `μ(gh) = μ(g)` for `h ∈ G`. Put `c = g c₀ gᵀ`, `c₀` the
coefficient matrix of the native cup (`1` for `O`, `−J` for `Sp`), so that `G` is the stabilizer of
`c₀`. Over the dense open set where the leading principal minors of `c` (for `O`), or its leading
Pfaffians (for `Sp`), are nonzero, factor `c = L c₀ Lᵀ` (Cholesky with `L` lower triangular, or
symplectic Gram–Schmidt, rational in `c`); then `L⁻¹ g ∈ G` and `μ(g) = μ(L)`. In the orthogonal
case column `j` of `L` is `√(d_j / d_(j−1))` times a rational vector in `c`, and
`μ(L) = μ(L · diag(±1))`, so only even powers of the roots occur; hence `μ(g) = F(c)` with `F`
rational, with poles at most along the irreducible minors. Every symmetric (alternating) matrix is
`g c₀ gᵀ` with `g` possibly singular (`LinearMap.BilinForm.exists_orthogonal_basis` for the
symmetric case; the alternating normal form), and `μ` stays bounded along `g + tA`, so `F` is a
polynomial, homogeneous of degree `k`, with `F(h c hᵀ) = h^(⊗2k) F(c)` for every matrix `h`.
Polarise `F` through the symmetriser (`O`) or antisymmetriser (`Sp`) of each slot pair and the
symmetrisation of the `k` pairs: this gives a linear map `L_F` of `T^(2k)` commuting with every
`h^(⊗2k)` with `L_F(c^(⊗k)) = F(c)`. By `TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`
(`(2k)!` is invertible in `ℂ`), `L_F` is the action of an element of `ℂ[S_(2k)]`, so
`u = F(c₀) = L_F(c₀^(⊗k))` is a combination of permuted copies of `c₀^(⊗k)`, which after reindexing
along `finSumFinEquiv` are `±t_D`. Weyl's polynomial vector-invariant theorem with polarisation
is another route. For the stated infinite-field generality, develop the invariant-spanning
and scalar-extension arguments of Doty–Hu, Theorem 1.2(b), and Dipper–Doty–Hu, Theorem 1.4;
the complex polarization argument does not supply this generality. Include the change-of-form
comparison after extension to an algebraic closure and descent back to the dot-product model:
prove the `K`-points of the orthogonal group are Zariski dense, using the Cayley chart at the
identity and its translates by reflections, and descend the finite-dimensional invariant
spaces and the diagram span along the field extension. *Needs:* §9.2;
ReductiveGroups Layers 3 and 6 for the complex reverse commutant only; Tau Ceti
`TauCeti.stdOrthogonalRepToDual_equivariant`, `TauCeti.stdSymplecticRepToDual_equivariant`,
`TauCeti.piTensorProductMap_comp_orthogonalCup`, `TauCeti.piTensorProductMap_comp_symplecticCup`,
`TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`, `TauCeti.BrauerDiagram.relabel`;
Mathlib `dualTensorHomEquiv`, `PiTensorProduct.dualDistribEquiv`, `PiTensorProduct.tmulEquiv`,
`LinearMap.BilinForm.exists_orthogonal_basis`, `Subalgebra.centralizer`, `Algebra.adjoin`.

- `orthogonal_centralizer_eq_adjoin_brauerGenerators`: for every infinite field `K` with
  `2 ≠ 0` and every `n`, `k`.
- `centralizer_adjoin_brauerGenerators_eq_adjoin_orthAction`: over `ℂ`, for every `n` and `k`.
- The symplectic FFT uses `Matrix.symplecticGroup (Fin l) K` over every infinite field;
  the reverse commutant here is over `ℂ`.

**Checks.**

- `k = 0`: `Ξ_0` is the identity of `ℂ` and the empty matching tensor is `1`. `V = 0`, `k > 0`:
  both sides of step 3 are zero.
- Orthogonal, `k = 1`: `Ξ_1(id_V) = ∑_i e_i ⊗ e_i`, so `ε = 1`; at `n = 1` the
  single matching tensor is nonzero although `n < 2k`. Over `ℚ`, for `n = k = 2`, the three matching
  tensors have Gram matrix with diagonal `4`, off-diagonal `2`, determinant `32 ≠ 0`.
- For `O_3`, degree two, complete reducibility gives dimensions `5,3,1`, so the group image
  has dimension `25+9+1 = 35`; the FFT gives its commutant dimension `3`, and the double
  commutant dimension `35`, without any filtration input.
- In characteristic two, the symplectic loop `−2l` is zero, but over an infinite field the
  torus still has nontrivial standard weights: for `Sp_2`, weights `1,−1` have no zero
  odd-length sum. This replaces the unavailable `−1` argument.
- `Sp_2`, `k = 1`, basis `e, f`: `φ(e) = −f^*`, `φ(f) = e^*`, so `Ξ_1(id_V) = f ⊗ e − e ⊗ f = −θ`;
  dropping the sign of `φ⁻¹` gives `+θ`; so `ε(id) = −1` at `k = 1`.
- `Sp_2`, `k = 2`: the native cap `x ⊗ y ↦ ω(x, y)` is sent to `−θ` in the input slots, so
  `Ξ_2(symplecticCupCap) = −θ_in ⊗ θ_out`, `ε = −1`; the crossing (minus the flip) has `ε = −1`;
  the identity has `ε = (−1)² = 1`.
- `Sp_2` in tensor degree `4`: the invariants have dimension `2` but there are three matching
  tensors, related by `θ₁₂θ₃₄ − θ₁₃θ₂₄ + θ₁₄θ₂₃ = 0`; they span and are dependent, outside the
  stable range `l ≥ k`. In degree `2` the invariants are `ℂθ`.
- `O_1 = {±1}` on `V = ℂ`: every one of the `(2k − 1)!!` matching tensors equals `e^(⊗2k)` and
  the whole one-dimensional `T^(2k)` is invariant.
- Negative control, `O_2` versus `SO_2` in degree `2`: the `O_2`-invariants of `V ⊗ V` are
  `ℂ · cup`; `SO_2 ⊂ SL_2` also fixes `e₁ ⊗ e₂ − e₂ ⊗ e₁`, which a reflection negates. The theorem
  is false for `SO_n` and is stated for the full disconnected `O_n`.

### 9.4 Harmonic tensors and the shape spaces `E_λ`

For this subsection and §§9.5–9.9, coefficients are `ℂ`.

Define `harmonicTensors n q ⊆ V^(⊗q)` as the common kernel of the cup-caps `TauCeti.orthogonalCupCapAt ℂ n q a b`
over `a ≠ b` (the cup is injective for `n ≥ 1`, so this is the common kernel of the contractions;
for `q ≤ 1` it is all of `V^(⊗q)`), and in the symplectic case the common kernel of the
alternating contractions of §9.2. Prove `harmonicTensors_orthAction_mem` and
`harmonicTensors_permTensorAction_mem`. For `λ ⊢ q` and a λ-tableau `t` define
`orthShapeSpace n λ t = range(c_t) ⊓ harmonicTensors n q`, with `c_t` acting through
`TauCeti.permTensorAction ℂ n q` and `TauCeti.YoungTableau.youngSymmetrizerOver ℂ t`, and the
admissibility `OrthAdmissible n λ`, `λᵗ₁ + λᵗ₂ ≤ n` (first two column lengths). Prove
`orthShapeSpace_orthAction_mem`, independence of `t` up to `O_n`-isomorphism, `orthShapeSpace_ne_bot_iff`
(`E_λ ≠ 0 ↔ λᵗ₁ + λᵗ₂ ≤ n`), `orthShapeSpace_irreducible` (every `O_n`-stable subspace of an
admissible `E_λ` is `0` or `E_λ`), pairwise inequivalence of the admissible `E_λ`, and
`harmonicTensors_decomposition`: `H^q ≅ ⊕_(λ ⊢ q admissible) E_λ ⊗ S^λ_ℂ` as `O_n × S_q`-modules,
the `O_n`-action on `H^q` and `E_λ` the restriction of `orthAction ℂ n q` and the `S_q`-action on `H^q` the
restriction of the permutation action, for any choice of tableaux. The orthogonal theorem is for
the full disconnected `O_n` with its determinant twists. In the symplectic case the admissible
shapes are those with `ℓ(λ) = λᵗ₁ ≤ l`, a different condition, and all permutations in the shape
construction act by the ordinary unsigned permutation action. Each `E_λ` is built in degree
`q = |λ|`, independently of the ambient degree `k`; for `V = 0`, `T^0 = ℂ` and `T^q = 0` for
`q > 0`, stated separately so that the empty shape does not assert a nonzero summand in positive
degree (Goodman–Wallach, §10.2.1; symplectic §10.2.3, p. 440; odd orthogonal
§10.2.4, p. 442; even orthogonal §10.2.5, p. 446; the zero-dimensional boundary above is direct;
Weyl, *The Classical Groups*, V.7). *Needs:*
§§9.2–9.3; Tau Ceti `TauCeti.orthogonalCupCapAt`, `TauCeti.permTensorAction`,
`TauCeti.YoungTableau.youngSymmetrizerOver`, `TauCeti.spechtModuleℂ`, `YoungDiagram.ofPartition`;
Mathlib `Submodule`, `LinearMap.restrict`, `DirectSum.lmap`; ReductiveGroups Layer 6 (complete
reducibility behind the decomposition).

- `harmonicTensors`, `orthShapeSpace`, `OrthAdmissible`: the definitions above.
- `harmonicTensors_orthAction_mem`, `harmonicTensors_permTensorAction_mem`,
  `orthShapeSpace_orthAction_mem`: stability under the two actions.
- `orthShapeSpace_ne_bot_iff`, `orthShapeSpace_irreducible`, `harmonicTensors_decomposition`.

**Checks.**

- `n = 1`, `O_1 = {±1}`: `V^(⊗q)` is spanned by `e^(⊗q)`, `cap(e ⊗ e) = 1 ≠ 0`, so `H^q = 0` for
  `q ≥ 2` and `H^1 = V`; the admissible shapes are `∅` and `(1)`, with column sums
  `0` and `1`, respectively, and `H^0 = ℂ`.
- `n = 2`, `q = 2`: `E_((2))` is the traceless symmetric square, dimension `2`; `E_((1,1)) =
  ⋀²(ℂ²)`, dimension `1`, harmonic since `cap(e₁ ⊗ e₂ − e₂ ⊗ e₁) = 0`; `(1,1,1)` has `λᵗ₁ = 3 > 2`
  and `E = 0`. `H² = E_((2)) ⊗ S^((2)) ⊕ E_((1,1)) ⊗ S^((1,1))` has dimension `2 + 1 = 3 = 4 − 1`.
- `n = 3`, `q = 2`: `V^(⊗2) ≅ Sym²₀ ⊕ ⋀² ⊕ ℂ` of dimensions `5 + 3 + 1`; `H² = Sym²₀ ⊕ ⋀²`, and
  the trace line `ℂ · cup` is the image of `e`, absent from the `GL_3` decomposition `Sym² ⊕ ⋀²`.
- A definition of admissibility by `ℓ(λ) ≤ n` (the `GL` condition) is wrong: for `n = 2`,
  `λ = (1,1)` passes both, but `λ = (2,2)` has `ℓ = 2 ≤ 2` while `λᵗ₁ + λᵗ₂ = 4 > 2`, and
  the admissible shapes of degree `4` for `O_2` are `(4)` alone (`(3,1)ᵗ = (2,1,1)` gives
  `3 > 2`), so `H⁴ = E_((4)) ⊗ S^((4))` has dimension `2` and `E_((2,2)) = 0`.
- `q = 0`: `H^0 = ℂ`, the single shape `∅` is admissible for every `n`, `E_∅ = ℂ`; for `n = 0`
  and `q > 0` every space is `0`.

### 9.5 The diagram ideals and the trace filtration

For `j ≥ 0` let `I_j ⊆ B_k(δ)` be the span of the diagrams with at least `j` bottom caps,
`propagatingNumber(D) + 2j ≤ k`; prove these are two-sided ideals, `I_0 = B_k`, `I_(j+1) ⊆ I_j`,
`I_j = 0` for `2j > k`, from `TauCeti.BrauerDiagram.propagatingNumber` and its composition bounds.
For the geometric action `ρ` put `F_j = span{ρ(b) v : b ∈ I_j}` and `gr_j = F_j / F_(j+1)`; these
are group- and Brauer-stable, `F_0 = T^k`, and `I_(j+1)` annihilates `gr_j`. On the coordinate
tensor basis use the positive Hermitian product: the Hermitian adjoint of each cap is its inserted
cup, with a uniform sign in the symplectic convention, so the common cap kernel is the orthogonal
complement of the sum of the cup images; prove that sum is `F_1`, hence `T^q = H^q ⊕ F_1` as group
modules and `H^q ≅ T^q / F_1`. The positivity is Hermitian coordinate linear algebra, not
positivity of the complex bilinear form, and uses no averaging over an infinite group. For complete reducibility of the whole geometric action use §9.3, including its
finite-component averaging for `O_n`; the zero-dimensional case is direct (Goodman–Wallach,
Appendix F, Theorem F.1.1, p. 2).
*Needs:* §§9.2–9.4; Tau Ceti `TauCeti.BrauerDiagram.propagatingNumber`,
`TauCeti.BrauerDiagram.propagatingNumber_composeDiagram_le_left`.

**Checks.**

- `k = 2`: `I_1 = ℂ e`, `I_2 = 0`; `F_1 = ℂ · cup`, `gr_0 = T^2 / ℂ cup ≅ H^2`.
- `k = 3`, `Sp_2`: `F_1` has dimension `4` (§9.9), `H^3 = Sym³(ℂ²)` has dimension `4`, and
  `8 = 4 + 4`.
- `2j > k` gives `I_j = 0`: for `k = 1`, `I_1 = 0` since no diagram on one strand has a cap.

### 9.6 Cup expansions, matching signs and the graded action

Let `P_(k,j)` be the finite set of `j` disjoint unordered pairs of slots, each written
increasingly, with the `k − 2j` free slots in increasing order. Inserting `j` copies of the
copairing and keeping the free slots in order defines group-intertwining maps
`cup_P : T^(k−2j) → T^k`: on a pure tensor, sum over indices `a_p, b_p` for each pair with
coefficient `∏_p (B⁻¹)_(a_p b_p)` (`B` the dot-product matrix or `J`; the copairing matrices are
`1` and `−J`), place `e_(a_p), e_(b_p)` in the ordered slots of `p` and the lower entries in the
free slots; this is multilinear and descends by `PiTensorProduct.lift`. Prove independence of the
enumeration of pairs and two-strand agreement with the native cups. Form
`C_j : ⊕_(P ∈ P_(k,j)) H^(k−2j) → T^k`, prove its image lies in `F_j` and the composite `Ψ_j` to
`gr_j` is surjective for `0 ≤ j ≤ ⌊k/2⌋` (factor each diagram of `I_j` into its top partial
matching, through-strand permutation and bottom contractions; replacing the lower tensor by its
`H` part changes the output by `F_(j+1)`). Define `R_j = ker Ψ_j` and the canonical equivalence
`(⊕_P H^(k−2j)) / R_j ≅ gr_j`, which specifies the relations in every dimension. Let `w_P` be the
list of the increasingly oriented pair blocks (ordered by first endpoint) followed by the free
slots in increasing order, a permutation of the slots; put `ε(P) = sgn(w_P)` for `Sp` and `1`
for `O` (exchanging two-slot blocks is even, so `ε` is independent of the enumeration), and let
`D_j` multiply the `P`-summand by `ε(P)`, `D_j² = 1`. Define `ρ_std` by partial-matching stacking:
a stack with fewer than `k − 2j` propagating strands acts by zero; otherwise it gives an output
placement `Q`, a loop count `a` and a permutation `τ` of the free slots, with coefficient `δ^a`
and action the permutation for `O` and `sgn(τ)` times it for `Sp`, `τ` fixed by the native
stacking order. The action on the raw cup domain is `ρ_raw(b) = D_j ρ_std(b) D_j`, so the
symplectic coefficient from `P` to `Q` is `ε(Q) ε(P) δ^a sgn(τ)` times the free-slot
permutation; the normalised map `C_j D_j` (cups `ε(P) cup_P`) intertwines `ρ_std` and `C_j`, `Ψ_j`
intertwine `ρ_raw`. Prove the algebra laws and the compatibility with the tensor action on
adjacent crossings and adjacent contractions, including closed loops and stacks that lose
propagating strands, then the general diagram formula; `R_j` is `ρ_raw`-stable and `D_j R_j` is
the relation space for `Ψ_j D_j`. As a separate stability theorem, for `0 ≤ j ≤ ⌊k/2⌋`, prove `Ψ_j` injective for
`n ≥ 2k` (orthogonal) or `l ≥ k` (symplectic), so `R_j = 0` and
`dim gr_j = |P_(k,j)| · dim H^(k−2j)` with `|P_(k,j)| = k!/(2^j j! (k−2j)!)`, by an independent
leading-term argument in the coordinate tensor basis, separating placements by distinct basis
indices (and distinct symplectic pairs), without using cell modules or their Gram forms;
require the cup maps and quotient actions to commute with relabelling and identify `F_j` with
the sum of the `j`-cup and higher components (Goodman–Wallach, Appendix F, Theorems F.1.1–F.1.2, pp. 2–4, for filtration and cup spanning;
Brauer 1937, §§3–4, for diagram actions).
*Needs:* §9.5; Tau Ceti `TauCeti.orthogonalCup`, `TauCeti.symplecticCup`,
`TauCeti.BrauerDiagram.propagatingNumber`; Mathlib `PiTensorProduct.lift`, `DirectSum.toModule`,
`Equiv.Perm.sign`.

**Checks.**

- `k = 3`, `j = 1`: `P_(3,1) = {12, 13, 23}`, free slots `3, 2, 1`; the words `[1,2,3]`,
  `[1,3,2]`, `[2,3,1]` have signs `+, −, +`, so `ε = (1, −1, 1)`.
- `|P_(4,2)| = 4!/(4 · 2 · 1) = 3`, the three perfect matchings of four points.
- `n = 1`, `k = 2`, `j = 1`: `H^0 = ℂ`, `cup_(12)(1) = e ⊗ e`, `Ψ_1` is injective though
  `n = 1 < 2k = 4`: the stability bound is sufficient, not necessary.

### 9.7 Multiplicity spaces and the two label conventions

For every `k` set `J_k = {(j, λ) : 0 ≤ j ≤ ⌊k/2⌋, λ ⊢ k − 2j}` with the admissibility condition of
§9.4. Define `G_(k,λ) = Hom_G(E_λ, T^k)`, the native `Representation.IntertwiningMap` space, with
Brauer action `b · f = ρ(b) ∘ f`; prove evaluation gives the simultaneous group/Brauer equivalence
`⊕_((j,λ) ∈ J_k admissible) E_λ ⊗ G_(k,λ) ≅ T^k`, zero multiplicity spaces contributing zero
(in particular `V = 0`, `k > 0`); for positive-dimensional `V` prove the admissible multiplicities
nonzero and that `λ` occurs in `gr_j` exactly when `|λ| = k − 2j`, comparing with `Ψ_j` on each
Young isotypic component. Fix the standard Brauer labels by the diagram cell module
`Δ_(k,μ) = ℂ[P_(k,j)] ⊗ S^μ` for `μ ⊢ k − 2j` (stacking acts on free slots by the Specht action,
`j = 0` gives `S^μ` through `B_k / I_1 ≅ ℂ[S_k]`), prove the stacking rule, the contravariant Gram
pairing with its radical, and name its simple head `D_(k,μ)`. In the geometric range identify `G`
with that head (same left-action convention; `TauCeti.BrauerDiagram.flip` transports a right-module
source): `G^O_(k,λ) ≅ D_(k,λ)` and `G^Sp_(k,λ) ≅ D_(k,λᵗ)`. First apply `D_j` to pass from the raw
cup domain to standard stacking; the second comparison then uses `S^λ ⊗ sgn ≅ S^(λᵗ)` (§4.2) on the
free slots, because the symplectic crossing is minus the flip; it does not transpose the
group-module shape. Both the matching signs `ε(P)` and this free-slot twist are required,
including `q = 1` where the latter is trivial. Transport the Gram pairing by `D_j` (raw matrix
`= D_j · standard · D_j`) with the transported radical; construct the evaluation and cup
compatibilities and prove simplicity over the image algebra; at dimension zero use the boundary
statements of §9.4 (Goodman–Wallach, §10.1.2; Dipper–Doty–Hu, §§3–4). *Needs:* §§4.2, 9.3–9.6;
Tau Ceti `TauCeti.BrauerDiagram.flip`, `TauCeti.spechtModuleℂ`; Mathlib `Representation.IntertwiningMap`.

**Checks.**

- `Sp_2`, `k = 2`: `H^2 = Sym²(ℂ²)` has shape `(2)` (dimension `3`), the native crossing acts on it
  by `−1` and the cup-cap by `0`, so its Brauer label is `(1,1)`; the equality case
  `|−2| = 2k − 2` of §9.8 is semisimple.
- `O_3`, `k = 2`: labels `(2)` on `Sym²₀`, `(1,1)` on `⋀²`, `∅` on the trace line, each with
  multiplicity one.
- `k = 1`: `J_1 = {(0, (1))}`, `G_(1,(1)) = Hom_G(V, V) = ℂ` for positive-dimensional `V`, and the
  sign twist is trivial.

### 9.8 Three semisimplicity statements

Over `ℂ`, §9.3 gives the semisimple Brauer image in every dimension. Apply it to split the
`F_j` filtration equivariantly and to the evaluation decomposition of §9.7, even where the
abstract algebra is not semisimple. Cup-placement independence is the separate sufficient
stability theorem of §9.6.
For the abstract algebra: for generic `δ`, `B_k(δ)` is split semisimple with simples indexed by the
partitions of `k, k−2, …`; for integer `δ` the bound `|δ| ≥ 2k − 2` is sufficient, not sharp, with
`k = 0, 1` proved directly; prove it from Rui's criterion (`B_k(δ)` over `ℂ`, `δ ≠ 0`, is semisimple
iff `δ ∉ Z(k)`; for `k ≥ 2`, the positive elements of `Z(k)` lie in `[1, k − 2]` and the least element is
`4 − 2k`; `B_k(0)` for `k ≥ 1` is semisimple iff `k ∈ {1, 3, 5}`), at both `δ = n` and `δ = −2l`. The abstract
criterion gives a nonsingular cell Gram form and stable diagram-module dimensions where those are
needed; it is not a hypothesis of the geometric decomposition. Outside it the cell radical and the
tensor-action kernel are distinguished; the modular cellular theory of `B_k(δ)` is the Brauer
analogue of TemperleyLieb Layer 5 and is a theorem of this layer only in the forms stated here
(Rui 2005, Theorem 1.2; Brauer 1937, §5; Goodman–Wallach, §10.1.2). *Needs:* §§9.1, 9.3, 9.7;
ReductiveGroups Layers 3 and 6; Mathlib `IsSemisimpleRing`.

**Checks.**

- `k = 2`: the bound is `|δ| ≥ 2`; `B_2(δ)` fails to be semisimple only at `δ = 0`
  (`Z(2) = {0}`), so the bound is not sharp.
- `k = 3`: the bound is `4`; the nonsemisimple integer parameters are `{−2, 1}`. The
  three-dimensional cell Gram determinant is `(δ+2)(δ−1)²`, equal to `2` at `δ = 0`
  and `0` at `δ = −2, 1`. Thus `B_3(0)` is semisimple; its simple dimensions `1,2,1,3`
  have squared sum `1+4+1+9 = 15`.
- `B_3(−2)`: the `j = 1` cell Gram matrix in the normalised placement basis is
  `[[−2, 1, 1], [1, −2, 1], [1, 1, −2]]`, determinant `−6 + 3 + 3 = 0`, so `B_3(−2)` is not
  semisimple while its image on `(ℂ²)^(⊗3)` is.

### 9.9 Rank-one symplectic examples and cup relations

For `Sp_2` at `k = 3`, with `e, f` the basis vectors at `Sum.inl 0`, `Sum.inr 0`, `J(e, f) = −1`,
`J(f, e) = 1`, and the inverse-form cup `θ = e ⊗ f − f ⊗ e`, define `D₁₂, D₁₃, D₂₃ : V → V^(⊗3)` by
inserting `θ` in those slots and prove on `e, f` that `D₁₂ − D₁₃ + D₂₃ = 0`. In placement order
`(12, 13, 23)`, `ε = (1, −1, 1)`. On the raw domain `V ⊕ V ⊕ V` the four generator actions are
`s₁(x, y, z) = (x, −z, −y)`, `s₂(x, y, z) = (−y, −x, z)`, `e₁(x, y, z) = (−2x − y + z, 0, 0)`,
`e₂(x, y, z) = (0, 0, x − y − 2z)`; prove `C` intertwines each with minus the flip, respectively the
cup-cap, in the corresponding adjacent slots; `s₁` and `s₂` fix `r(v) = (v, −v, v)` while `e₁`, `e₂`
kill it; under `D = diag(1, −1, 1)` this is the relation `(v, v, v)` for the normalised cups
`(D₁₂, −D₁₃, D₂₃)` and standard stacking. Each `D` has rank `2`, their sum has rank `4`,
`H³ = Sym³(ℂ²)` has dimension `4`, and `(ℂ²)^(⊗3) ≅ Sym³(ℂ²) ⊕ (ℂ² ⊗ ℂ²_mult)` as `Sp_2`-modules
(the second factor the two-dimensional multiplicity space with trivial action), equivalently
`Sym³V ⊕ V ⊕ V`; the cup-kernel comparison, not a sum of three independent copies of `V`. These
examples separate the three distinctions of §9.8 (Dipper–Doty–Hu, arXiv v2, §1, p. 4,
display preceding Theorem 1.2, for the signed action).
*Needs:* §§9.2, 9.6–9.8; Tau Ceti `TauCeti.symplecticCup`, `TauCeti.symplecticCupCap`, `Matrix.J`.

**Checks.**

- `−P₁₂` on `(x, y, z)`, read through the placements: the crossing of slots `1, 2` sends the
  placement `12` to itself with sign, `13` to `23` and `23` to `13` with the sign of the flip, so
  `s₁(x, y, z) = (x, −z, −y)`; similarly `s₂ = (−y, −x, z)`.
- `e₁` on the `12`-placement: `cap(θ) = −2`, giving `−2x`; on `13` and `23` the contraction of the
  cup against one slot and the free vector gives `−y` and `+z`; so `e₁(x, y, z) = (−2x − y + z, 0, 0)`,
  and `e₁(v, −v, v) = (−2v + v + v, 0, 0) = 0`.
- `D₁₂ − D₁₃ + D₂₃` on `e`: `(e⊗f⊗e − f⊗e⊗e) − (e⊗e⊗f − f⊗e⊗e) + (e⊗e⊗f − e⊗f⊗e) = 0`.
- The Gram determinant `0` of §9.8 and the semisimple image: the kernel of `C` restricted to the
  relation line is the cell radical, and the image on `(ℂ²)^(⊗3)` has `End = M_1 × M_2`.

### Examples

`O_3` on `(ℂ³)^(⊗2)`: `B_2(3)` has basis `1, s, e`, its image is the full centralizer, and
`(ℂ³)^(⊗2) ≅ Sym²₀ ⊕ ⋀² ⊕ ℂ`. `Sp_2 = SL_2` with `δ = −2` on `(ℂ²)^(⊗3)` is §9.9.

### Dependencies

Tau Ceti Layer 9 suppliers; Layers 4 (§4.2), 7 (§7.5 for `ω`, in §9.7 only as a comparison) and 8;
ReductiveGroups Layers 3 and 6; Mathlib `Subalgebra.centralizer`, `Algebra.adjoin`,
`IsSemisimpleRing`, `dualTensorHomEquiv`.

## Downstream consumers

- ClassicalGroups Layer 4 consumes the Schur-polynomial identities of Layer 7 and its Frobenius
  formula; Layer 8 here consumes its Layer 2 carrier.
- LieHighestWeight Layer 9 consumes Layer 7's Schur polynomials and interlacing identities.
- TensorProductCombinatorics consumes the skew tableaux, jeu de taquin, Littlewood–Richardson
  tableaux and rule, evacuation and the stable ring of §§7.1–7.2, 7.5.
- TypeAHeckeAlgebras, KacMoody and CountingBundlesAndHallAlgebrasOfCurves consume Layer 7's stable
  ring and Hall form.
- DeligneWeightsAndPurity consumes the symplectic pair contractions of §9.6; FreeProbability
  consumes the permutation centralizer of Layer 8; NoncompactQuantumSymmetry consumes Layers 3–5;
  BordismFormalGroups consumes Layers 0, 2 and 5; AutomorphicGaloisRepresentationsPartII consumes
  the normalised idempotents of Layer 2 and the duality of Layer 8.

## Worked examples

- **`S₃` and `S₄`.** The Specht modules give degrees `1, 2, 1` for `n = 3` and `1, 3, 2, 3, 1` for
  `n = 4`, with the character tables of CharacterTheory; the two degree-`3` modules of `S₄` are
  exchanged by `spechtModule_tensor_sign_iso`. Sums of squares `6` and `24`.
- **Hook lengths for `n = 5`.** `f^λ = 1, 4, 5, 6, 5, 4, 1`, squares summing to `120`.
- **Littlewood–Richardson and Hall.** `c^((3,2,1))_((2,1),(2,1)) = 2` by the two ballot tableaux;
  `⟨p_((1,1)), p_((1,1))⟩ = 2`; the degree-`2` Schur functions are orthonormal.
- **Schur–Weyl on `(ℂ²)^(⊗2)`.** `S^((2)) ⊗ Sym²(ℂ²) ⊕ S^((1,1)) ⊗ ⋀²(ℂ²)`, dimensions `3 + 1 = 4`.
- **Brauer duality on `(ℂ³)^(⊗2)` for `O_3`.** `B_2(3)` with `s² = 1`, `e² = 3e`, `se = e`;
  `(ℂ³)^(⊗2) ≅ Sym²₀ ⊕ ⋀² ⊕ ℂ`, dimensions `5 + 3 + 1 = 9`; the trace line is the image of `e`.

## References

- G. D. James, *The Representation Theory of the Symmetric Groups*, Lecture Notes in Mathematics
  682, Springer (1978): Chapter 4 (the submodule theorem and the form in characteristic zero),
  Theorem 8.15 (`S^(λᵗ) ≅ (S^λ)^* ⊗ sgn`), Theorem 16.4 (Littlewood–Richardson), Theorem 21.1
  (Murnaghan–Nakayama).
- W. Fulton, *Young Tableaux*, LMS Student Texts 35, CUP (1997): §§1–3 (tableaux, insertion, jeu
  de taquin), §§4.1–4.3 (RSK), §5.1 Corollary 2 and §5.2 (Littlewood–Richardson), Appendix A.1.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, GTM 129, Springer (1991):
  Lecture 4 §4.1 and Exercise 4.4, Lemma 4.26, §6.1 and Theorem 6.3.
- B. E. Sagan, *The Symmetric Group*, 2nd ed., GTM 203, Springer (2001): §4.9, Theorem 4.10.2.
- I. G. Macdonald, *Symmetric Functions and Hall Polynomials*, 2nd ed., Oxford (1995): I.2
  (2.11′), (2.12), (2.14′); I.3 (3.4), (3.5), (3.8); I.4 (4.7), (4.8); I.5 (5.16), (5.17),
  Example 25; I.7 and its Example 5; I.9 (9.2).
- R. P. Stanley, *Enumerative Combinatorics*, vol. 2, CUP (1999): Theorem 7.11.5, Appendix A1
  §§A1.1–A1.3.
- R. P. Stanley, *Increasing and decreasing subsequences and their variants*, ICM survey (2006),
  equation (7), p. 5; author version https://math.mit.edu/~rstan/papers/ids.pdf .
- C. Lenart, *On the combinatorics of crystal graphs, I. Lusztig’s involution*,
  arXiv:math/0509200v6 (2007), §2.4, pp. 6–7 (semistandard evacuation).
- M. Haiman, *Math 249: Algebraic Combinatorics*, lecture notes, Berkeley (2015),
  https://math.berkeley.edu/~mhaiman/math249-spring15/ : lectures 33–36 (jeu de taquin, dual
  equivalence, the Littlewood–Richardson rule).
- H. Weyl, *The Classical Groups*, Princeton (1939), Chapter V §7 (harmonic tensors).
- R. Brauer, *On algebras which are connected with the semisimple continuous groups*, Ann. of
  Math. 38 (1937), 857–872, §§3–5.
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, GTM 255, Springer
  (2009): §5.3.2, §9.1.1, §§10.1.1–10.1.2, §§10.2.1, 10.2.3–10.2.5; Appendix F, Theorems F.1.1–F.1.2, pp. 2–4, author supplement
  https://sites.math.rutgers.edu/~goodman/pub/symmetry/appf.pdf .
- H. Rui, *A criterion on the semisimple Brauer algebras*, J. Combin. Theory Ser. A 111 (2005),
  78–88, Theorem 1.2; preprint https://math.ecnu.edu.cn/preprint/2004-012.pdf .
- R. Dipper, S. Doty, J. Hu, *Brauer algebras, symplectic Schur algebras and Schur–Weyl duality*,
  Trans. Amer. Math. Soc. 360 (2008), 189–213, arXiv:math/0503545: §1, p. 4, display preceding
  Theorem 1.2 (signed action), Theorem 1.2(1), Theorem 1.4
  (numbering of arXiv v2).
- S. Doty, J. Hu, *Schur–Weyl duality for orthogonal groups*, Proc. Lond. Math. Soc. 98 (2009),
  679–713, arXiv:0712.0944: Theorem 1.2(b) (numbering of arXiv v3).
- P. Etingof et al., *Introduction to Representation Theory*, arXiv:0901.0827v5 (2011),
  §4.20, Proposition 4.61, p. 66 (finite Frobenius formula); §4.15, Theorem 4.47, p. 61.
