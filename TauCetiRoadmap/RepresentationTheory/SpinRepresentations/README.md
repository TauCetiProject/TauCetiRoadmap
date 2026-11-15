# Roadmap: clifford algebras, the Pin and Spin groups, and spin representations

**Summary.** Develop Clifford-specific comparisons for spin representations from the native
Clifford algebra, polarization, double covers and quadratic Lie action. The endpoints are the
isometry criteria for Clifford automorphisms, spin and half-spin highest-weight comparisons,
the rank-six vector/exterior-square identification, real and complex group comparisons,
triality on the actual three eight-dimensional modules, and Kostant's isotypy and full
ρ-decomposition. General-field, degenerate-form and rank-zero branches retain their stated scope.

## Scope and ownership

This roadmap owns the generator-preserving automorphism subgroup and filtration criterion,
transport along specified form isometries and polarizations, the compact-real and arbitrary-complex
polar comparisons, the complex group differential, low-rank D comparisons, the rank-six vector
comparison, real maximal-compact and Lie-coordinate adapters, concrete triality comparisons and
Kostant's decomposition. The Clifford algebra, word filtration/PBW, finite monomial groups,
coordinate criteria, Fock modules, odd-line signs, Pin/Spin equivariance, double covers, compact
topology, positive-real complex polar deformation, generic B/D highest weights, exceptional
standard/dual module identifications, real components and real Clifford table are already in the
library. The exact supplier contracts below specify their hypotheses and the interfaces consumed.

The arithmetic general-field spinor norm and rank-zero generated/even-norm-one comparison
belong to OrthogonalSpinGroups §§1A–1F; the rank-zero normalizer and μ₂ comparisons are native.
Generic root data, highest-weight theory, Lie integration and pinned reductive groups belong to
RootSystems, LieHighestWeight, LieGroups and ReductiveGroups respectively, by the sections below.
Clifford bundles, spin structures and Dirac operators belong to SpinGeometry G1–G6, downstream
of the algebraic and real-group comparisons here. InductionRestriction's Clifford theory over a
normal subgroup is a separate subject. No geometric refinement is a supplier for the Fock core.

## Conventions

- **The base field is `ℂ` for the representation theory; real forms are named explicitly.** The spin
  modules, their irreducibility, and the highest-weight identification are stated over `ℂ` (algebraically
  closed, characteristic `0`). For finite-dimensional V with nondegenerate Q, a maximal isotropic
  subspace has dimension `⌊dim V/2⌋`. In dimension `2l` the full Clifford algebra is `M_(2^l)(ℂ)`;
  in dimension `2l+1` it is `M_(2^l)(ℂ) × M_(2^l)(ℂ)`. The **structure theory** of the Clifford algebra, the
  grading, the filtration, and the Pin/Spin double covers are stated over a general commutative ring `R`
  with `[Invertible (2 : R)]` where that is the honest generality (Mathlib's `equivExterior` and the
  twisted-conjugation lemmas already carry `[Invertible (2 : R)]`), and specialized to a field where
  nondegeneracy and dimension counts are used. The **real Clifford algebras** `Cliff(p, q)` and the real
  groups `Spin(p, q)` are a separate, explicitly real layer; do not fold the signature `(p, q)` into the
  complex theory, where every nondegenerate form of a given rank is equivalent.
- **Reuse Mathlib's Clifford, quadratic-form, and Pin/Spin vocabulary.** The Clifford algebra is
  `CliffordAlgebra Q` for `Q : QuadraticForm R M` (`= QuadraticMap R M R`), with `CliffordAlgebra.ι Q`,
  `CliffordAlgebra.lift`, the grading `CliffordAlgebra.evenOdd Q : ZMod 2 → Submodule R _` and its
  `GradedAlgebra` instance, the even subalgebra `CliffordAlgebra.even Q`, `CliffordAlgebra.involute`,
  `CliffordAlgebra.reverse`, and the module isomorphism `CliffordAlgebra.equivExterior`. The groups are
  `lipschitzGroup Q`, `pinGroup Q`, `spinGroup Q` with `pinGroup.toUnits`, `spinGroup.toUnits`, and the
  action lemmas `spinGroup.conjAct_smul_range_ι`, `spinGroup.involute_act_ι_mem_range_ι`. Isometries are
  `QuadraticForm.IsometryEquiv`; nondegeneracy is `QuadraticForm.Nondegenerate`; the exterior power is
  `exteriorPower R k M = ⋀[R]^k M` and the exterior algebra `ExteriorAlgebra R M`. A representation is
  `Representation ℂ G V`, bundled as `FDRep ℂ G`. Never introduce a private synonym for any of these.
- **`pinGroup Q` and `spinGroup Q` are Mathlib's `Submonoid`s carrying a `Group` instance; the double cover
  targets the native abstract orthogonal group.** Consume
  `TauCeti.QuadraticMap.orthogonalGroup Q : Subgroup (M ≃ₗ[R] M)` and
  `TauCeti.QuadraticMap.specialOrthogonalGroup Q` from
  `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`. Use its
  `orthogonalGroupEquivIsometryEquiv` and `orthogonalGroupCongr`; the determinant is
  `QuadraticMap.orthogonalDet Q`, whose kernel inside O(Q) is `specialOrthogonalWithin Q`,
  compared to the native SO(Q) by `specialOrthogonalWithinEquiv`. The O(Q) carrier itself needs
  only the native commutative-semiring/module hypotheses; determinant statements use its
  commutative-ring hypotheses. In a finite basis b over R with 2 invertible, put
  `D=Q.toMatrix b`, the matrix of Q.associated (half the polar form). Coordinate matrices in
  GL preserve Q exactly when `Aᵀ D A=D`; diagonalization makes D diagonal. Mathlib's
  `Matrix.orthogonalGroup n R` instead satisfies `Aᵀ A=1` for the standard sum-of-squares form.
  Compare with it only after specifying an isometry to that standard form, using the native
  orthogonal-group transport. Consume the native `CliffordAlgebra.ιRangeEquiv` from
  `CliffordAlgebra/Vectors.lean`, and the maps `CliffordAlgebra.pinToOrthogonal` and
  `CliffordAlgebra.spinToSpecialOrthogonal` from `Pin/Action.lean` and
  `Spin/SpecialOrthogonal.lean`. Their construction transports the range action and proves form
  preservation; the ring/module assumptions and `[Invertible (2 : R)]` suffice, with no
  nondegeneracy, finiteness or freeness required. The Fock equivariance contracts use these native maps and their twisted-conjugation formulas.
- **Surjectivity over ℂ and the general-field spinor norm.** For finite-dimensional nondegenerate Q
  over ℂ, consume native `CliffordAlgebra.spinToSpecialOrthogonal_surjective`; in positive
  dimension its scalar kernel is `{±1}` of order2, while the dimension0 generated carrier is
  trivial. For a general field K of characteristic different from2, use the native maps
  `CliffordAlgebra.orthogonalSpinorNorm Q hQ` on O(Q) and
  `CliffordAlgebra.spinorNorm Q hQ` on SO(Q), with codomain
  `Multiplicative (TauCeti.SquareClassGroup K)`. Their literal unit-square quotient comparison is
  `TauCeti.multiplicativeSquareClassEquiv : (Kˣ ⧸ Subgroup.square Kˣ) ≃*
  Multiplicative (TauCeti.SquareClassGroup K)`. Consume the general-field image/kernel theorem
  `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm` with finite dimension,
  nondegeneracy and invertible2. It is exact at SO(Q), without claiming that the spinor norm is
  onto its entire codomain. OrthogonalSpinGroups1A owns the reverse/star norm
  comparison, 1B–1C the general-field generated carrier/vector-map comparisons,
  and 1D–1E the spinor-norm/image-kernel contract. QuadraticFormInvariants Layer 1 records
  native Cartan–Dieudonné; the covers contract below names the actual implementation declarations.
  Rational-point surjectivity fails in general. Keep algebraic-group surjectivity and the
  real component qualifications separate from this statement about K-points.
- **The spin module is `⋀·W` for a maximal isotropic `W`, made a Clifford module by pinning the
  contraction coefficient to Mathlib's `polar`.** Over `ℂ`, a nondegenerate `Q` on a `2l`- or
  `(2l+1)`-dimensional `V` admits a maximal isotropic subspace `W` with `finrank ℂ W = l`; the spin module is
  `S = ExteriorAlgebra ℂ W = ⋀·W`. The Clifford operator `c(v)` acts by exterior multiplication `w ∧ -` for
  `w ∈ W` and by contraction `contractLeft` against the functional `QuadraticMap.polar Q w' ∘ (W ↪ V)` for
  `w' ∈ W'`. The defining requirement is the operator identity
  `c(x) ∘ c(y) + c(y) ∘ c(x) = polar Q x y • 1`, from which `c(v) ∘ c(v) = Q v • 1` (the Clifford relation)
  follows because `polar Q v v = 2 • Q v`. Do not write the coefficient as a prose "twice"; state it as
  `QuadraticMap.polar` and prove the anticommutator identity. Use `P : TauCeti.SpinPolarizationData Q`, its `P.W`, actual
  `decompositionEquiv`, polar `pairingEquiv` and `lineCoordinate` with square Q.
  Consume `TauCeti.spinAction Q P : CliffordAlgebra Q →ₐ[ℂ] Module.End ℂ S`
  and its `spinAction_ι_wedge`, `spinAction_ι_contract` and
  `spinAction_ι_lineOperator` equations. These native equations pin the selected
  convention; do not define another polarization/action carrier. The spin representation of
  `spinGroup Q` is the restriction of this Clifford action along `spinGroup.toUnits`; keep the Clifford-module
  structure and the group representation separate, related by an explicit lemma.
- **In odd dimension the single module `⋀·W` is not faithful for the full Clifford algebra.** For
  `dim V = 2l+1` the Clifford algebra is `M_{2^l}(ℂ) × M_{2^l}(ℂ)`, of dimension `2 · (2^l)²`, while
  `dim ⋀·W = 2^l`, so `spinAction` cannot be injective on all of `Cliff(V, Q)`: it factors through one of
  the two central-idempotent summands. Fix the action of the extra anisotropic vector `e` (with `V = W ⊕ W' ⊕
  ⟨e⟩`) as the parity operator scaled so that `c(e) ∘ c(e) = Q e • 1`, which pins the summand. The faithful
  object is the direct sum of the two inequivalent spinor modules, not a single `S`.
- **The highest-weight identification is a Lie-algebra statement, against the abstract fundamental weights.**
  The highest-weight theory is stated first at the **Lie-algebra** level: `S` is a `LieModule ℂ 𝔰𝔬(V) S` (via
  the bivector realization of Layer 3), and its highest weight is `ωₗ = ½(1,…,1)` (type `Bₗ`); the two
  half-spin summands are `𝔰𝔬(V)`-submodules with the two fork-node weights (type `Dₗ`),
  assigned by the parity of l in Layer5 under the fixed Cartan `Nᵢ−1/2`. Mathlib's
  `Representation ℂ G V` is a *group* object. Construct the Lie action algebraically
  by composing `spinAction` with Layer3's quadratic/bivector Lie embedding.
  **SpinDifferentialComparison** is a sibling target on concrete smooth group models;
  **SpinGroupHighestWeightCorollary** consumes that comparison and the Lie highest-weight
  theorem. Lie classification and representation-level triality depend on the algebraic
  action independently of the group-differential branch. The weights `½(±1,…,±1)` live in the weight lattice of
  [the root-systems roadmap](../RootSystems/README.md), strictly larger than the lattice generated by the
  vector weights `±eᵢ`, which is why they are not constituents of tensor powers of the vector representation.
  State the identification against the fundamental weights of
  [the highest-weight roadmap](../LieHighestWeight/README.md) and the `Bₗ`/`Dₗ` root data, not against an ad
  hoc coordinate vector; this requires the explicit choice of a split Cartan and Borel of `𝔰𝔬(V)` and an
  identification of its roots with the abstract `Bₗ`/`Dₗ` root system (Layer 5). The Lie algebra `𝔰𝔬(V)` is
  realized here as `⋀²V ⊂ even Cliff(V, Q)` under the commutator bracket, and identified with Mathlib's
  `LieAlgebra.Orthogonal.so`; the spin action of the group differentiates to this bracket action, and that
  compatibility is a named target.
- **The Clifford grading is `ℤ/2`; the degree filtration and its associated graded are separate.**
  Mathlib's `evenOdd Q` is the `ℤ/2`-grading; `equivExterior` is a module isomorphism.
  Over a commutative ring R, consume native `CliffordAlgebra.filtration Q k`, defined using
  `TauCeti.Algebra.wordFiltration (ι Q) k`. It spans words of length at most k, includes the
  empty word, and has `F₀ = range (algebraMap R _)`. The native identity
  `CliffordAlgebra.filtration_eq_pow` is exactly `Fₖ = (1 ⊔ LinearMap.range (ι Q)) ^ k`;
  `filtration_eq_iSup_pow` is the supremum of exact-length range powers for lengths at most k.
  A single power of `range (ι Q)` alone has a different convention. Consume native
  `filtration_mul`, exhaustiveness and, with2 invertible, `filtrationGradedEquiv` and
  `associatedGradedEquivExterior`. The latter is the actual algebra isomorphism with the
  exterior algebra, including degree0 and homogeneous multiplication; do not infer it from
  the bare module isomorphism. Keep these native degree-quotient comparisons distinct from
  the `ℤ/2`-grading and from the differential comparisons still required here.
- **`𝔰𝔬(V, Q)` for an abstract form is `skewAdjointLieSubalgebra (QuadraticMap.polarBilin Q)`, and
  quadratic elements are half-normalized commutators (Layer 9).** The orthogonal Lie algebra of an
  abstract nondegenerate `Q` is Mathlib's Lie subalgebra of skew-adjoint endomorphisms of the polar
  form; never introduce a private synonym. The quadratic element attached to a pair `(a, b)` is
  `⅟2 • ⁅ι Q a, ι Q b⁆`, and its defining property is the bracket identity
  `⁅β(a, b), ι Q x⁆ = ι Q (polar Q b x • a - polar Q a x • b)`, the same formula that pins
  `CliffordAlgebra.bivectorEquivSo_apply_ιMulti_mulVec` in Layer 3; do not hard-code the `⅟2` anywhere else. **Normal-ordered
  quadratics** (products `ι a · ι b`, as in `F_ij = ½ Σ_k d_ik d_kj`) differ from the antisymmetrized
  ones by a scalar, the **normal-ordering constant**; for a reductive `𝔤` this constant shifts the
  central component of the highest weight, so every statement names which of the two embeddings it
  uses. And **two `𝔤`-actions on `Cliff(𝔤, B)` must never be conflated**: the commutator action
  `x • c = ⁅q(x), c⁆` (the exterior extension of the adjoint representation, not isotypic) and the
  **left-regular** action `x • c = q(x) · c` (the isotypic one, Kostant's); every isotypy statement
  says which action it is about, and the two carry different native names
  (`CliffordAlgebra.cliffordDerivationRep` and `CliffordAlgebra.kostantLieRingModule`).

## Exact supplier contracts

### From Mathlib

- **The Clifford algebra and its universal property** - `LinearAlgebra/CliffordAlgebra/Basic.lean`:
  `CliffordAlgebra Q` (for `Q : QuadraticForm R M`), `CliffordAlgebra.ι Q : M →ₗ[R] CliffordAlgebra Q` with
  `ι_sq_scalar` (`ι Q m * ι Q m = algebraMap R _ (Q m)`), the universal property
  `CliffordAlgebra.lift Q : {f : M →ₗ[R] A // ∀ m, f m * f m = algebraMap _ _ (Q m)} ≃ (CliffordAlgebra Q →ₐ[R] A)`
  with `ι_comp_lift`, `lift_unique`, `hom_ext`, `induction`, `adjoin_range_ι`; the functoriality
  `CliffordAlgebra.map (f : Q₁ →qᵢ Q₂)` and `CliffordAlgebra.equivOfIsometry`.
- **The `ℤ/2`-grading and the even subalgebra** - `LinearAlgebra/CliffordAlgebra/Grading.lean`:
  `CliffordAlgebra.evenOdd Q : ZMod 2 → Submodule R (CliffordAlgebra Q)`, the `GradedAlgebra (evenOdd Q)`
  instance (`CliffordAlgebra.gradedAlgebra`), `evenOdd_mul_le`, `evenOdd_isCompl`, `iSup_ι_range_eq_top`
  (`⨆ i, (range ι)^i = ⊤`, the top of the filtration), and the induction principles `evenOdd_induction`,
  `even_induction`, `odd_induction`; `LinearAlgebra/CliffordAlgebra/Even.lean`: `CliffordAlgebra.even Q`
  (`= (evenOdd Q 0).toSubalgebra`), `EvenHom`, `CliffordAlgebra.even.lift`.
- **Conjugation, reversal, and the exterior-algebra isomorphism** -
  `LinearAlgebra/CliffordAlgebra/Conjugation.lean`: `CliffordAlgebra.involute` (the grade involution),
  `involuteEquiv`, `CliffordAlgebra.reverse`, `reverseEquiv`, `reverse_comp_involute`;
  `LinearAlgebra/CliffordAlgebra/Contraction.lean`: `CliffordAlgebra.contractLeft`,
  `CliffordAlgebra.contractRight`, `CliffordAlgebra.changeForm`, and the module isomorphism
  `CliffordAlgebra.equivExterior [Invertible (2 : R)] : CliffordAlgebra Q ≃ₗ[R] ExteriorAlgebra R M`.
- **The Lipschitz, Pin, and Spin groups** - `LinearAlgebra/CliffordAlgebra/SpinGroup.lean`:
  `lipschitzGroup Q : Subgroup (CliffordAlgebra Q)ˣ` with
  `lipschitzGroup.conjAct_smul_range_ι` (the twisted conjugation preserves `range ι`, over
  `[Invertible (2 : R)]`) and `lipschitzGroup.involute_act_ι_mem_range_ι`; `pinGroup Q` and `spinGroup Q`
  as `Submonoid (CliffordAlgebra Q)` with their `Group` and `StarMul` instances, `pinGroup.toUnits`,
  `spinGroup.toUnits`, `spinGroup.mem_even`, `spinGroup.involute_eq` (`involute` fixes the spin group),
  `spinGroup.conjAct_smul_ι_mem_range_ι`, and `spinGroup.conjAct_smul_range_ι`.
- **Small Clifford algebras identified** - `LinearAlgebra/CliffordAlgebra/Equivs.lean`:
  `CliffordAlgebraComplex.equiv : CliffordAlgebra CliffordAlgebraComplex.Q ≃ₐ[ℝ] ℂ` (with
  `Q r = -(r * r)`), `CliffordAlgebraQuaternion.equiv : CliffordAlgebra (Q c₁ c₂) ≃ₐ[R] ℍ[R,c₁,0,c₂]`,
  `CliffordAlgebraDualNumber.equiv`, and `CliffordAlgebra (0 : QuadraticForm R Unit) ≃ₐ[R] R`; the
  even-subalgebra isomorphism `LinearAlgebra/CliffordAlgebra/EvenEquiv.lean`:
  `CliffordAlgebra.equivEven : CliffordAlgebra Q ≃ₐ[R] CliffordAlgebra.even (Q' Q)`
  (`Q'` the form with one extra negated coordinate), the seed of Bott periodicity; and the tensor
  decompositions `LinearAlgebra/CliffordAlgebra/Prod.lean` (`CliffordAlgebra.prodEquiv`, over the graded
  tensor product `ᵍ⊗`) and `LinearAlgebra/CliffordAlgebra/BaseChange.lean`
  (`CliffordAlgebra.equivBaseChange`).
- **Quadratic forms and isometries** - `LinearAlgebra/QuadraticForm/Basic.lean` (`QuadraticForm`,
  `Matrix.toQuadraticForm'`, `QuadraticForm.toMatrix'`), `.../QuadraticForm/IsometryEquiv.lean`
  (`QuadraticForm.IsometryEquiv`, `refl`, `symm`, `trans`), `.../QuadraticForm/Radical.lean`
  (`QuadraticForm.Nondegenerate`, `nondegenerate_iff_radical_eq_bot`), and `QuadraticMap.IsOrtho`.
- **The classical groups and the orthogonal Lie algebra** - `LinearAlgebra/UnitaryGroup.lean`
  (`Matrix.orthogonalGroup n R`, `Matrix.specialOrthogonalGroup n R`, `mem_orthogonalGroup_iff`),
  `LinearAlgebra/Matrix/SpecialLinearGroup.lean`, `LinearAlgebra/SymplecticGroup.lean`;
  `Algebra/Lie/Classical.lean`: `LieAlgebra.Orthogonal.so n R` (skew-adjoint matrices for the identity
  form), `so'`, and the type-`B`/`D` presentations `soIndefiniteEquiv`, together with
  `skewAdjointMatricesLieSubalgebra`.
- **Exterior and tensor algebra, and the representation vocabulary** - `LinearAlgebra/ExteriorAlgebra/Basic.lean`
  (`ExteriorAlgebra R M`), `LinearAlgebra/ExteriorPower/Basic.lean` (`exteriorPower R n M = ⋀[R]^n M`,
  `exteriorPower.ιMulti`, `exteriorPower.map`), `LinearAlgebra/ExteriorPower/Basis.lean`
  (`Module.Basis.exteriorPower`, the basis of `⋀[R]^n M` induced by a basis of `M`), `Module.Dual`, `Module.End`,
  `Module.finrank`; `RepresentationTheory/Basic.lean` (`Representation`), `RepresentationTheory/FDRep.lean`
  (`FDRep`), `RepresentationTheory/Character.lean` (`FDRep.character`).
- **The Lie-theory vocabulary of Layer 9** - `Algebra/Lie/SkewAdjoint.lean`
  (`skewAdjointLieSubalgebra`, the skew-adjoint endomorphisms of a bilinear form as a Lie
  subalgebra of `Module.End`), `Algebra/Lie/InvariantForm.lean` (`LinearMap.BilinForm.lieInvariant`),
  `Algebra/Lie/TraceForm.lean` (`LieModule.traceForm`, `killingForm`), `Algebra/Lie/Killing.lean`
  (`LieAlgebra.IsKilling`), `Algebra/Lie/Rank.lean` (`LieAlgebra.rank`),
  `Algebra/Lie/OfAssociative.lean` (the commutator `LieRing` on any associative algebra, so
  `CliffordAlgebra Q` and `Matrix n n ℂ` carry `⁅·,·⁆` with no new instances, and `AlgHom.toLieHom`),
  `Algebra/Lie/Semisimple/Defs.lean` (`LieModule.IsIrreducible`), `Algebra/Lie/DirectSum.lean` (the
  Lie module instances on `⨁`), `QuadraticMap.polarBilin`, `LinearMap.BilinMap.toQuadraticMap` with
  `LinearMap.BilinMap.polarBilin_toQuadraticMap` (`polarBilin (toQuadraticMap B) = B + B.flip`, the
  factor-of-two bookkeeping), `Algebra.lmul` (the left-regular action), and `Matrix.single` (the
  matrix units) with `Matrix.trace`.

### From Tau Ceti

Consume existing Tau Ceti implementations on their actual carriers, by name; `Suggested.lean` restates none of them and states only the headline theorems built on them. The inventory below states the native hypotheses and the remaining comparison interfaces; the layers specify their construction order.

| Milestone | Native API and scope | Remaining comparison or target |
|---|---|---|
| Degree filtration and algebra PBW | `CliffordAlgebra.filtration`, `filtration_mul`, `filtrationGradedEquiv`, `associatedGradedEquivExterior`; commutative rings, with invertible 2 for the exterior/PBW comparison | Use the actual word-filtration `GradedPiece`/associated graded and its generator equations. |
| Clifford dimension and vector carrier | `CliffordAlgebra.finrank_eq_two_pow`: invertible 2, **nontrivial** scalar ring, finite free module. `CliffordAlgebra.ιRangeEquiv`: invertible 2, arbitrary module and form | No unrestricted-ring injectivity or zero-ring numerical formula is asserted. The universal zero-module algebra equivalences remain valid even over a trivial ring. |
| Orthogonal group and covers | Native `TauCeti.QuadraticMap.orthogonalGroup`/`specialOrthogonalGroup`, `CliffordAlgebra.pinToOrthogonal`/`spinToSpecialOrthogonal`, `spinToSpecialOrthogonal_surjective`, `card_ker_spinToSpecialOrthogonal`, `spinDoubleCover` | Use the native Gram-matrix criteria below; transport the projection along the specified form isometry. Surjectivity uses a finite nondegenerate space over a separably closed field of characteristic not two; the order-two kernel/extension additionally needs positive dimension. Zero is handled by `lipschitzGroup_eq_bot`, `instSubsingletonSpinGroup` and the zero-kernel/bijectivity corollaries. Preserve the general-field spinor-norm and real full-cover branches. |
| Bivectors and arbitrary forms | `CliffordAlgebra.bivector`, `bivector_lie_ι`, `bivectorEquivSo`, `soEquivQuadratic`, `cliffordInducedRep`, `cliffordDerivationRep`; the abstract realization requires a finite-dimensional nondegenerate quadratic space over a field with invertible 2 | Consume the actual half-normalized action equations. Differentiation of the group cover is a separate smooth comparison. |
| Genuine polarization and Fock action | `TauCeti.SpinPolarizationData` contains an actual direct-sum coordinate equivalence, perfect pairing and a line coordinate squaring to Q; `ofNondegenerate` supplies it over a separably closed field of characteristic not two. `TauCeti.spinAction`, `spinRep`, `pinRep` use this same carrier | Do not replace this data by a second partial polarization record. Use the native line-sign comparison below. |
| Complex matrix structure | `CliffordAlgebra.nonempty_algEquiv_matrix_of_finrank_eq_two_mul`, `nonempty_algEquiv_matrix_prod_of_finrank_eq_two_mul_add_one`, and `nonempty_algEquiv_even_matrix_of_finrank_eq_two_mul_add_one`; field, separably closed, characteristic not two, finite dimension and nondegenerate Q | Polarization-dependent `cliffordEquivMatrix` and `evenCliffordEquivProdEnd` pin the maps. In even rank zero the even algebra is the scalar algebra; no two nonzero half-spin factors exist. |
| Group irreducibility and half-spin | `CliffordAlgebra.span_spinGroup_eq_even` supplies the group/algebra bridge. `TauCeti.spinPlus_invariant` and half-spin subrepresentations require `P.line=⊥`; odd irreducibility is `spinRep_isIrreducible_of_odd` on the whole module | Keep the actual separably closed/char-not-two and nonzero odd-half hypotheses. In odd dimension, Clifford evenness does not imply exterior-parity invariance. |
| Type B and type D highest weights | The four `TauCeti.SpinPolarizationData.isHighestWeightVector_typeDSpin{Plus,Minus}LieRep_...` exports and the four identifications `nonempty_lieModuleEquiv_typeDSpin{Plus,Minus}_irreducibleQuotient_...` of the half-spin modules with `TauCeti.irreducibleQuotient` use native `TypeDStd` Cartan/Borel, half-rank at least 4 and explicit even/odd rank; `nonempty_lieModuleEquiv_typeBSpin_irreducibleQuotient` identifies the type-B spin module with `L(ωₗ)` on `typeBLieBasis` for every l≥1; all over a field of characteristic zero | Adopt their parity-dependent fork assignment below. Root-rank zero/one and D2/D3 are handled directly, not through nonexistent generic fork nodes. |
| Split type-D Lie algebra | `TauCeti.TypeDStd.lieBasis` on the diagonal Cartan `TauCeti.typeDDiagonalCartan` (abelian, self-normalizing, a Cartan subalgebra), the root-space classification `TauCeti.TypeDStd.rootSpace_typeDDiagonalCartan_ne_bot_iff` and its indexing `TauCeti.TypeDStd.typeDRootWeight` by the pinned simply connected datum, `TauCeti.TypeDStd.lieSpan_rootGenerator_eq_top`, `TauCeti.TypeDStd.isSimple_typeD`, `TauCeti.TypeDStd.isKilling_typeD` (half-rank at least 4, characteristic zero), `TauCeti.TypeDStd.serreRepresentation` and the generic surjectivity `TauCeti.serreLift_lieBasis_surjective` | Injectivity of the numbered Serre realization at half-rank 4 (Serre's theorem) and its bundling as a Lie equivalence; no second Cartan, root, Killing-form or simplicity computation. |
| Native type-D spin carrier | `TauCeti.TypeDSpinCarrier.groupScheme` (half-rank n ≥ 4: the Kostant toral closure of the Fock representation of `TauCeti.splitEvenPolarization ℚ n` inside `GL_(2^n)` over ℤ), its `points`, `rootSubgroupPoints`, `weightTorusPoints`, simple-root pinning against `DynkinType.simplyConnectedRootDatum`, complete reducibility, and over an algebraically closed field the connected, smooth generated subgroup with trivial unipotent radical (`unipotentRadicalDefiningIdeal_generated_eq_augmentation`) | It asserts no identification with Clifford `spinGroup`, no equality of the generated subgroup with the base-changed integral carrier, and no reductivity. Layer 8 consumes it as the algebraic model of Spin₈ on S⁺⊕S⁻. |
| Native triality and its carrier | `TauCeti.serreDiagramAut` with H/E/F, inverse, iterate and `serreLift_comp_serreDiagramAut` equations; `TauCeti.D4Tripled.trialityAutomorphism`/`trialityPoints`, root equations, inverse torus relabelling and three-block Levi; on the tripled carrier also `TauCeti.D4Tripled.isCompletelyReducible_standardComodule`, the simple-root pinning against `DynkinType.simplyConnectedRootDatum`, and over an algebraically closed field the connected, smooth generated subgroup (`geometricallyConnectedCommHopfAlgProperty_generatedCoordinateHopfAlgebra`, `smoothCommHopfAlgProperty_generatedCoordinateHopfAlgebra`) and the unipotent-radical obstruction under reducedness | Layer8 consumes these implementations and owns the concrete numbered Serre equivalence and pinned **complex** tripled-points↔CliffordSpin comparison, all three intertwiners and the integrated-lift comparison. The native carriers alone assert neither reductivity, nor equality of a generated subgroup with the base-changed integral carrier, nor this identification. |
| Native rational triality on the three modules | For `P : TauCeti.SpinPolarizationData Q` with `Module ℚ V`, a basis b of `P.W` indexed by `Fin 4` and, for the Lie equations, `P.line = ⊥`: the block equivalences `TauCeti.D4Tripled.vectorBlockEquiv` (the split vector module `Fin 4 ⊕ Fin 4 → ℚ`, with signs `TauCeti.D4Tripled.vectorBasisSign`), `TauCeti.SpinPolarizationData.d4SpinPlusBlockEquiv` and `d4SpinMinusBlockEquiv` with their `_serreE`, `_serreF`, `_serreH` equations; the intertwiners `d4VectorToSpinMinusEquiv`, `d4SpinMinusToSpinPlusEquiv` and `d4SpinPlusToVectorEquiv`, built from the block reindexings by `d4TripledTrialityPerm`, intertwining every Chevalley generator after `trialityPermD4` and with cyclic composites the identity (`d4TrialityCycle_apply_apply_apply` and its two siblings); and the nonzero Lie-invariant form `d4TrialityTrilinearForm` on vector, odd and even half-spin modules, with `d4TrialityTrilinearForm_ne_zero`, `_cyclic`, `_serreE_invariant`, `_serreF_invariant` and `_serreH_invariant` | Layer 8 base-changes these from the split rational form to Q₈ along the isometry of §8.2 item 2, proves the group-level equations on `x_±i(u)` and `T_Cl(s)`, and compares the transported form with Clifford multiplication. |
| Exceptional ranks three through six | `TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_of_finrank_eq_three` and `TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_prod_of_finrank_eq_four` over a separably closed field of characteristic not two (the latter through the split even centre and a quaternion-product model), and the rank-three spin/standard intertwining endpoint; `TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix P hV : spinGroup Q ≃* SL(4, K)` for a polarization `P` of a six-dimensional space over a field with 2 invertible, sending a Spin element to its matrix on `S⁺` | The polarized standard and dual representation equivalences in ranks four through six are suppliers below. Retain the specified rank-five form comparison and the rank-six vector comparison `V ≅ ⋀²ℂ⁴`. In rank six, `range_spinGroup_toUnits_ne_evenUnitaryGroup_of_six_le_finrank` records that the norm-one condition alone does not cut out Spin. |
| Real forms and periodicity | Four `realClifford...Equiv...` base entries, `TauCeti.realCliffordBottEquiv`, `nonempty_realCliffordEightPeriodicityEquiv`, the full signed table `TauCeti.realClifford_classification`, the full-cover carrier `CliffordAlgebra.cliffordFullCover`, and native compact connectedness/covering/stabilizer/sphere/simple-connectivity/universal-cover APIs | Finish the real full-cover surjectivity, kernel and topological comparisons without importing indefinite-domain connectedness. |
| Kostant machine and CAR | `TauCeti.LieAlgebra.adjointSO`/`killingQuadraticForm`, `CliffordAlgebra.adjointCliffordHom` and scoped left-regular module; native `TauCeti.glCliffordHom` and CAR `isIsotypicOfType_glIrreducible_car`, `nonempty_lieModuleEquiv_directSum_glIrreducible_car` over algebraically closed characteristic-zero fields, all N | General Killing-semisimple Kostant isotypy/multiplicity, full spinor comparison and the stronger primitive-subspace theorem remain targets. The CAR example does not prove the general theorem. |

The public development below additionally retains its compact-real identification and arbitrary-form polar transport, concrete smooth group models, algebraic-versus-differentiated action separation and real-signature maximal-compact/Lie adapters. “Build” in a layer means consume its existing producer where listed and construct the remaining stated interfaces; it never licenses a duplicate generic owner.

### From Tau Ceti: finite groups, coordinates and comparisons

- In `TauCeti/LinearAlgebra/CliffordAlgebra/MonomialGroup/Basic.lean`,
  `CliffordAlgebra.monomialGroup`, `monomialGroupEquiv`, `natCard_monomialGroup`,
  `mem_center_monomialGroup_iff`, `natCard_conjClasses_monomialGroup_of_even`,
  `natCard_conjClasses_monomialGroup_of_odd` and `monomialGroupAlgebraQuotientEquiv` supply the signed
  monomials, their normal form, order, centre, conjugacy-class counts and quotient algebra. The hypotheses are an
  orthogonal basis with generator squares ±1 over a nontrivial commutative ring with 2
  invertible; cardinality uses a finite basis, and the even conjugacy-class count requires positive even rank. Over a separably closed field of characteristic
  different from two, `TauCeti.monomialGroup_nonempty_equiv_of_even`,
  `monomialGroup_finrank_eq_two_pow_of_even`, `monomialGroup_finrank_eq_two_pow_of_odd`
  and `monomialGroup_nonempty_equiv_comp_subtype_of_odd` in
  `TauCeti/RepresentationTheory/Spin/MonomialGroup/Spinor.lean` supply the negative-central-character
  irreducibles and their even restrictions. The positive sector is supplied by
  `TauCeti.monomialGroup_existsUnique_nonempty_equiv_ofLinearCharacter` and
  `monomialGroup_finrank_eq_one_of_apply_monomialGroupEpsilon_eq_one` in
  `TauCeti/RepresentationTheory/Spin/MonomialGroup/Character.lean`; the quotient has 2ⁿ
  characters, as counted by `CliffordAlgebra.natCard_monoidHom_quotient_monomialGroupSign`.
- `QuadraticForm.isometryEquivWeightedSumSquares` and
  `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` in
  `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean` supply diagonalization over fields
  with 2 invertible. The latter requires the associated bilinear form to be separating on
  the left. `QuadraticForm.equivalent_weightedSumSquares_of_isSepClosed` in
  `TauCeti/LinearAlgebra/QuadraticForm/SepClosed.lean` normalizes a finite-dimensional such
  form to the sum of squares over a separably closed field. In
  `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Coordinate.lean`,
  `TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix` and
  `mem_specialOrthogonalGroup_iff_toMatrix` give `Aᵀ D A=D` and the additional determinant-one
  equation for any finite basis over a commutative ring with 2 invertible.
- For the complexification of a real form with a specified finite orthonormal basis,
  `CliffordAlgebra.leftMulMatrixRpow_complexConj_reverse_mul_self_mem_spinGroup` in
  `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/RealPower.lean` supplies real powers of g†g
  in Spin, where † is coefficient conjugation after reversal. The joint continuity theorem
  `CliffordAlgebra.continuousOn_leftMulMatrixRpow_complexConj_reverse_mul_self` and
  `CliffordAlgebra.spinPolarRetraction`, `spinPolarHomotopyRel`, `spinPolarHomotopyEquiv`
  in `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Polar.lean` supply the deformation onto
  the unitary part. `coe_spinPolarRetraction_apply`, `coe_spinPolarHomotopyRel_apply`,
  `complexConj_reverse_mul_self_spinPolarRetraction` and
  `spinPolarRetraction_of_complexConj_reverse_mul_self_eq_one` pin its values and fixed locus.
  Identification with compact real Spin and transport to an arbitrary complex Q are §2's targets.
- `TauCeti.SpinPolarizationData.negLineCoordinate`, `spinAction_negLineCoordinate_apply`,
  `spinRepEquivNegLineCoordinate`, `exists_spinAction_volume_eq_algebraMap` and
  `cliffordEquivEndProd` in `TauCeti/RepresentationTheory/Spin/LineSign.lean` supply the odd-line
  comparison. If J is exterior parity, the all-element equation is
  `c_(P⁻)(x)=J c_P(involute x) J`; its restriction to Spin is the parity intertwiner.
  On an odd orthogonal spanning volume the characters are λ and −λ, with
  `λ²=(-1)^(n(n−1)/2)·Π Q(e_i)`; the product action is faithful in odd finite dimension
  over a field with 2 invertible. No second odd-line construction is required.
- `TauCeti.pinRep_mul_spinAction_ι_mul_pinRep_inv` and
  `TauCeti.spinRep_mul_spinAction_ι_mul_spinRep_inv` in
  `TauCeti/RepresentationTheory/Spin/Equivariance.lean` give
  `ρ_Pin(g)c(v)ρ_Pin(g⁻¹)=(-1)^p c(pinToOrthogonal Q g v)` for a Pin element of parity p,
  and `ρ(g)c(v)ρ(g⁻¹)=c(spinToSpecialOrthogonal Q g v)` for Spin, on the native Fock module
  over any commutative ring with 2 invertible and polarization data.
- Over a field with 2 nonzero and a polarization P, the following bundled endpoints
  identify the actual representations along their group equivalences:
  `TauCeti.exists_spinGroup_mulEquiv_specialLinearGroup_prod_and_halfSpin_equiv_stdSLRep_of_finrank_eq_four`
  in `TauCeti/RepresentationTheory/Spin/Exceptional/Four/HalfSpin.lean`,
  `TauCeti.exists_spinGroup_mulEquiv_symplecticGroup_and_spinRep_equiv_stdSymplecticRep_of_finrank_eq_five`
  in `TauCeti/RepresentationTheory/Spin/Exceptional/Five/Group.lean`, and
  `TauCeti.exists_spinGroupEquivSpecialLinearGroupOfFinrankEqSix_and_halfSpin_equiv_stdSLRep_and_dual`
  in `TauCeti/RepresentationTheory/Spin/Exceptional/Six/Polarized.lean`.
  The last theorem's witness is `TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix P hV`;
  its duality input is `TauCeti.exists_spinMinusSubrep_equiv_dual_spinPlusSubrep_of_finrank_eq_six`
  in `TauCeti/RepresentationTheory/Spin/Exceptional/Six/HalfSpinDual.lean`.
- The `SL₄` side of the rank-six vector comparison is native, in the sibling files
  `ExteriorSquare.lean`, `SpecialIsometry.lean`, `Kernel.lean` and `Hyperbolic.lean` of
  `TauCeti/RepresentationTheory/Spin/Exceptional/Six/`. Over a nontrivial commutative ring K,
  `TauCeti.spinSixWedgeForm K` is the symmetric wedge pairing on `⋀²(K⁴)` and
  `TauCeti.spinSixSpecialLinearToSpecialIsometryGroup K` sends `SL₄(K)` to its determinant-one
  isometries, acting by `(TauCeti.stdSLRep K 4).exteriorPower 2`
  (`spinSixSpecialLinearToSpecialIsometryGroup_apply`). Over a domain its kernel is the scalars
  ±1 (`spinSixSpecialLinearToSpecialIsometryGroup_eq_one_iff`), of order two when 2≠0
  (`card_ker_spinSixSpecialLinearToSpecialIsometryGroup`). The hyperbolic coordinates
  `TauCeti.spinSixWedgeIsometryEquivPolarSplit K` identify the pairing with the polar form of
  `TauCeti.splitEvenForm K 3`; with 2 invertible, `TauCeti.spinSixWedgeQuadraticIsometryEquivSplit K`
  is the resulting isometry of quadratic forms and
  `spinSixWedgeIsometryEquivPolarSplit_spinVectorAction` transports the Spin vector action
  along it. The exterior-power representation is Tau Ceti's `Representation.exteriorPower`
  (`TauCeti/RepresentationTheory/ExteriorPower.lean`). No comparison of this map with
  `spinToSpecialOrthogonal` along `spinGroupEquivSpecialLinearGroupOfFinrankEqSix` is native.
- `CliffordAlgebra.range_spinToSpecialOrthogonal_realCliffordForm_eq_connectedComponentOfOne`
  and `ker_spinorNorm_realCliffordForm_eq_connectedComponentOfOne` in
  `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/Real/IdentityComponent.lean` identify the
  vector image and norm-sign kernel with SO₀(p,q), for `2≤p+q` on the coordinate topology.
  `CliffordAlgebra.pathConnectedSpace_realCliffordSpinGroup` in the sibling `Connected.lean`
  assumes `2≤p` or `2≤q`. In the sibling `OneOne.lean`,
  `CliffordAlgebra.realCliffordSpinOneOneContinuousMulEquiv` identifies Spin(1,1) with
  `rootsOfUnity 2 ℝ × Multiplicative ℝ`; `connectedComponentOfOne_realCliffordSpinGroup_one_one`
  and `index_connectedComponentOfOne_realCliffordSpinGroup_one_one` give its hyperbolic-rotation
  identity component and index two. The maximal-compact and Lie-coordinate comparisons remain in §7.
- `TauCeti.finrank_eq_finrank_cartan_add_two_mul_card_isPos` in
  `TauCeti/Algebra/Lie/Weights/Dimension.lean` gives `dim 𝔤 = dim H + 2·#Δ⁺` for a
  finite-dimensional Killing-semisimple Lie algebra and splitting Cartan H with root base b.
  Over ℂ the splitting hypothesis holds; §9 identifies Mathlib's Lie rank with dim H.

### From TauCetiRoadmap.OrthogonalSpinGroups

Consume [OrthogonalSpinGroups §§1A–1F](../../../Completed/OrthogonalSpinGroups/README.md#layer-1-the-lipschitz-group-and-the-spinor-norm):
reverse/star norm comparison (§1A), generated carriers and vector maps (§§1B–1C),
spinor-norm image/kernel exactness (§§1D–1E), and the generated-Spin versus full even
norm-one comparison at rank zero (§1F). These are general-field inputs with characteristic
not two and finite-dimensional nondegenerate forms where stated. The rank-zero comparison and
the full zero-vector twisted normalizer Kˣ are native (covers contract below).

### From TauCetiRoadmap.ClassicalGroups

Consume [ClassicalGroups §§0.1–0.2 and 1.2](../ClassicalGroups/README.md) for standard classical
representations and their exterior powers; §3.5 and Layer 3A specify the rational SO/Sp
comparison. This roadmap supplies the Clifford-specific spin representations.

### From TauCetiRoadmap.LieHighestWeight

Consume [LieHighestWeight Layer 7](../LieHighestWeight/README.md) for the normalized split-field
Serre presentation, and its supplier contracts for the native irreducible quotient,
complete reducibility and Weyl formulas. Layer 9's reductive center comparisons and the
native dual-standard Pieri rule are the inputs for the CAR example. These uses retain the
chosen Cartan, base, characteristic-zero field and central character.

### From TauCetiRoadmap.RootSystems

Consume [RootSystems §4.3 and §5.2](../RootSystems/README.md) for numbered B/D root data and
based diagram automorphisms, on the full simply connected character/cocharacter lattices.
Its former Layer 6 is mapped there and to the native `TauCeti.DynkinType.simplyConnectedRootDatum`
in its downstream numbering table.

### From TauCetiRoadmap.LieGroups

Consume [LieGroups Layers 0–3 and 4–5](../LieGroups/README.md): finite-dimensional closed
subgroups and the Lie functor for the smooth comparison, then integration of Lie maps on
connected simply connected groups. The underlying-real complex Spin adapters are Layer 3;
algebraic Lie-module comparisons do not require this branch. §7.3 additionally consumes
LieGroups Layer 9's Cartan decomposition `K×𝔭≅G` for a global matrix-cover model (a closed
transpose-stable H≤GL_N(ℝ) with finitely many components and a specified finite central
cover). §7.3 supplies that model: H=SO₀(p,q) in the coordinates of `realCliffordForm p q`,
with the two-fold central cover Spin(p,q)→H.

### From TauCetiRoadmap.ReductiveGroups

Consume [ReductiveGroups §9B](../../ReductiveGroups/README.md#9b-pinned-groups-and-their-explicit-carriers)
for the Chevalley–Demazure construction, base change, root generation and the isomorphism
theorem for pinned split reductive groups. Layer 8 supplies the specific complex Clifford
and tripled carriers and proves the hypotheses before applying that theorem.

### From TauCetiRoadmap.QuadraticFormInvariants

[QuadraticFormInvariants Layer 1](../../QuadraticFormInvariants/README.md#layer-1-hyperbolic-planes-and-witt-theory)
records the general-field reflection and Cartan–Dieudonné interfaces. Consume their native
finite-dimensional nondegenerate characteristic-not-two declarations named in the covers contract below.

### Native interfaces used by the layers

#### Clifford algebra, filtration and PBW

- **The universal property, consumed and packaged.** Use `CliffordAlgebra.lift` and `hom_ext` as the
  working interface, with the basic identities `ι_sq_scalar`, `ι_mul_ι_add_swap` (the polarization
  `ι a · ι b + ι b · ι a = polar Q a b`), and, for orthogonal vectors, the anticommutation
  `ι_mul_ι_comm_of_isOrtho`. Record the functor `CliffordAlgebra.map` and `equivOfIsometry`: an isometry of
  forms induces an algebra isomorphism. For finite-dimensional **nondegenerate** forms over `ℂ`, the Clifford algebra therefore depends only on the dimension. This classification aside does not impose nondegeneracy on the universal algebra or PBW construction: in dimension1 the zero form gives dual numbers, whereas `Q(x)=x²` gives `ℂ×ℂ`.
- **The `ℤ/2`-grading.** Consume `evenOdd Q`, the `GradedAlgebra` instance, `evenOdd_isCompl`, and the even
  subalgebra `even Q`; state `involute` as the grade involution (`involute` is `+1` on `evenOdd Q 0`, `-1`
  on `evenOdd Q 1`) and record `spinGroup.mem_even`, `spinGroup.involute_eq`. This grading is what
  distinguishes `pinGroup` from `spinGroup`.
- **The degree filtration.** Consume `CliffordAlgebra.filtration Q k` from
  native `Filtration.lean`: it is the span of products of at most k
  generators, with the empty word included. Keep its exact convention,
  scalar degree0, generator degree1, monotonicity, exhaustiveness and
  `filtration_mul` equality. `filtration_eq_iSup_pow` compares it with the
  supremum of exact-length range powers; it is not one exact-length power.
- **The associated graded and exterior powers.** Consume the native chain
  `ExteriorFiltration.lean` → `FiltrationGradedEquiv.lean` → `PBW.lean`.
  `CliffordAlgebra.filtrationGradedEquiv Q k` identifies the actual
  `TauCeti.Algebra.wordFiltration.GradedPiece (ι Q) (k+1)` with
  `⋀[R]^(k+1) M`;
  `TauCeti.Algebra.wordFiltration.previousRestricted_succ` identifies that carrier with
  the preceding-step quotient. Its proof transports `equivExterior` through
  the filtration, and its leading-term inverse comparison is explicit.
  `CliffordAlgebra.associatedGradedEquivExterior Q` is the full algebra
  equivalence, including degree0 and homogeneous multiplication, over a
  commutative ring with2 invertible. Consume its `_apply_of_succ` and
  inverse comparison lemmas. Thus the required PBW compatibility is a
  native theorem, not inferred from the bare module isomorphism
  `equivExterior` and not left as a duplicate local admitted equivalence. Consume native
  `CliffordAlgebra.finrank_eq_two_pow` over a **nontrivial** commutative ring R
  with2 invertible and finite free M:
  `finrank R (CliffordAlgebra Q) = 2 ^ finrank R M`, matching
  `∑ₖ (finrank R M).choose k`. Nontriviality is essential; no zero-ring rank
  identity is asserted.

#### Polarized structure isomorphisms

Consume `TauCeti/RepresentationTheory/Spin/Structure.lean` and `OddStructure.lean`.
For a chosen native `SpinPolarizationData`, the Fock action is constructed first and its
surjectivity is proved by creation/annihilation matrix units; dimension then gives the
structure isomorphism. Consume `TauCeti.SpinPolarizationData.cliffordEquivEnd` and
`TauCeti.SpinPolarizationData.cliffordEquivMatrix` in even dimension.
`TauCeti.SpinPolarizationData.evenCliffordEquivProdEnd P hline` requires `P.line=⊥`,
without a nonzero-W hypothesis: at rank0 its factors are End(K) and End(0).
`TauCeti.SpinPolarizationData.evenCliffordEquivProdMatrix` takes `P.W≠⊥`
and `finrank K V=2*l` in place of hline, deriving `P.line=⊥` internally and giving
the two equal matrix sizes in positive even dimension.
Consume `TauCeti.SpinPolarizationData.evenCliffordEquivEnd` in odd dimension.
The exact field-level matrix statements are
`CliffordAlgebra.nonempty_algEquiv_matrix_of_finrank_eq_two_mul` and
`CliffordAlgebra.nonempty_algEquiv_matrix_prod_of_finrank_eq_two_mul_add_one`, over separably closed fields
of characteristic different from2. The selected ℂ signatures consume these results directly.

Layer4 uses the same `P : TauCeti.SpinPolarizationData Q` and native Fock action
throughout. Its polar coefficient and odd anisotropic-vector choice are already
encoded by `pairingEquiv` and `lineCoordinate`; consume their native evaluation
lemmas directly. The remaining comparison targets are isometry/polarization transport,
the algebraic quadratic Lie-action comparison,
and the separate differentiated group action, as specified
in Layers2–4. The native action is constructed before its
matrix-structure consequences. Group irreducibility additionally consumes the
native even-Clifford spanning bridge described in the Fock-restriction contract below; an End-image alone
is only an algebra-module statement.

#### Even and odd structure and periodicity inputs

- **The even-dimensional case.** For `Q` nondegenerate on a `2l`-dimensional `V` over an
  algebraically closed field of characteristic different from2,
  `CliffordAlgebra Q ≃ₐ[K] Matrix (Fin (2^l)) (Fin (2^l)) K`.
  For l≥1 the even subalgebra is
  `even Q ≃ₐ[K] Matrix (Fin (2^(l-1))) _ K × Matrix (Fin (2^(l-1))) _ K`.
  For l=0 the full and even Clifford algebras are K, their centers have dimension1,
  and the exterior spin module is K with plus part K and minus part0; no pair
  of nonzero half-spin modules or two-dimensional even center is asserted. Consume
  `cliffordEquivEnd_apply` and `evenCliffordEquivProdEnd_apply`: these
  isomorphisms act by the same native `TauCeti.spinAction` and half-spin
  actions, not by an unrelated model requiring an unspecified intertwiner.
- **The odd-dimensional case.** Over an algebraically closed field of characteristic different from2,
  for `Q` nondegenerate on a `(2l+1)`-dimensional `V`,
  `CliffordAlgebra Q ≃ₐ[K] Matrix (Fin (2^l)) _ K × Matrix (Fin (2^l)) _ K`, while the even subalgebra is a
  single `Matrix (Fin (2^l)) _ K`. The center is `K` (even case) or `K × K` (odd case); the two
  central idempotents in the odd case are the source of the two inequivalent restrictions to `Pin`.
- **The seed of periodicity.** Consume `CliffordAlgebra.equivEven`
  (`Cliff(Q) ≅ even(Q ⊕ ⟨-1⟩)`) and `CliffordAlgebra.prodEquiv` (the graded tensor product over a
  direct sum of forms); these are the algebraic inputs the complex structure theorem and the real Bott
  periodicity below both rest on.

#### Vector carrier

- **Vectors from the Clifford algebra.** Consume `CliffordAlgebra.ιRangeEquiv Q` and its
  pointwise generator/inverse laws from `CliffordAlgebra/Vectors.lean`. Over a commutative ring
  with 2 invertible, it identifies M with `range (ι Q)` for arbitrary Q; nondegeneracy and
  finite-dimensionality are not needed. Use this native equivalence to compare the range action
  with the orthogonal action on M and the chosen Clifford-module construction.

#### Covers and the general-field image

- **The double cover, over `ℂ`.** For finite-dimensional `V` over an
  algebraically closed field of characteristic different from2 (`ℂ` here), with nondegenerate Q
  and positive dimension, `pinToOrthogonal Q` and `spinToSpecialOrthogonal Q` are
  **surjective** (Cartan-Dieudonné: every isometry is a product of reflections, each realized by a unit
  vector), with **kernel `{±1}`** of order two (`MonoidHom.ker (spinToSpecialOrthogonal Q)` generated by `-1`,
  `Nat.card = 2`). Consume the native kernel/surjectivity theorems from `Pin/Kernel`,
  `CartanDieudonne`, `Spin/Kernel` and `Spin/Surjectivity`, and the group-extension packages
  `CliffordAlgebra.pinDoubleCover` and `spinDoubleCover` from `Pin/DoubleCover` and
  `Spin/DoubleCover`. Identify their inclusions/projections with the scalar −1 and the native
  action maps, retaining the stated positive-dimensional hypotheses. For the Pin and
  group-extension packages retain their exact hypotheses and identify inclusions, projections
  and underlying-action equations with the same native maps. These are the short exact
  sequences `1 → ℤ/2 → Pin(V) → O(V) → 1` and `1 → ℤ/2 → Spin(V) → SO(V) → 1`.
  At rank zero, over any commutative ring K and for a subsingleton module, consume
  `CliffordAlgebra.equivOfSubsingleton : CliffordAlgebra Q ≃ₐ[K] K` (inverse the scalar
  inclusion) with `unitsEquivOfSubsingleton`, `vectorNormalizer_eq_top_of_subsingleton` and
  `vectorNormalizerEquivUnitsOfSubsingleton` (every unit preserves the zero vector subspace
  under twisted conjugation, so the twisted normalizer is Kˣ),
  `evenUnitaryGroupEquivRootsOfUnityOfSubsingleton` (the even norm-one group is μ₂(K), the
  scalar norm being u²) and `range_spinGroup_toUnits_eq_bot_of_subsingleton` (generated Spin
  is trivial); scalar-kernel results retain their positive-rank hypotheses.
  Over a **general field** K of characteristic different from2, for finite-dimensional
  nondegenerate Q, consume OrthogonalSpinGroups1D–1E's image/kernel contract,
  with the reverse/star comparison from1A and generated-carrier inputs from1B–1C.
  The implementation declarations in `CliffordAlgebra/Spin/SpinorNorm/Basic.lean`
  are `CliffordAlgebra.orthogonalSpinorNorm Q hQ`,
  `CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal`, the restriction
  `CliffordAlgebra.spinorNorm Q hQ` to native SO(Q), and
  `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`. The codomain is
  `Multiplicative (TauCeti.SquareClassGroup K)`; use `TauCeti.multiplicativeSquareClassEquiv`
  for the canonical comparison with `Kˣ ⧸ Subgroup.square Kˣ`. Reflection at v has
  square class Q(v), the reverse-norm convention. Native Pin uses star norm, whose value
  on `ι v` is −Q(v); reverse and star norms agree on even elements and differ by the
  degree sign on homogeneous odd elements. Consume OrthogonalSpinGroups §1A's comparison and the
  `Lipschitz/ReverseNorm.lean` declarations. For a Lipschitz element x, with
  `∃v, IsUnit (Q v)`, `exists_scalarUnits_mul_mem_spinGroup_iff` identifies scalar
  rescalability into Spin with both Clifford-evenness and
  `IsSquare (cliffordNorm Q x)`; the square condition alone is insufficient.
  `CliffordAlgebra.reflection_mul_reflection_mem_range_spinToOrthogonal_of_isSquare`
  in `ReflectionLift.lean` gives the pair lift when `IsSquare (⅟(Q v)*⅟(Q w))`;
  it does not assert that every adjacent pair in a general factorization has square norm.
  For general reflection factorization, QuadraticFormInvariants Layer 1 records native
  Cartan–Dieudonné; the actual
  general-field implementation is `QuadraticForm/CartanDieudonne/Basic.lean`, exporting
  `TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq` (length at most dim V)
  under finite dimension, `NeZero (2:K)` and hQ. The Clifford wrapper also supplies
  general-field `CliffordAlgebra.lipschitzToOrthogonal_surjective`. The exact Pin
  hypothesis of `CliffordAlgebra.pinToOrthogonal_surjective_of_isSquare` is
  `∀(v:V) [Invertible (Q v)], IsSquare (-⅟(Q v))`; separable closure supplies it.
  Exactness at SO(Q) is not surjectivity of the spinor norm onto all square classes.
  Algebraically closed and real-component results remain separate specializations.

#### Compact Spin topology

- **SpinCompactTopologyFoundation.** The compact topology of the positive-definite
  real generated Spin carrier `CliffordAlgebra.realCliffordSpinGroupZero n` is native, and
  Layer 2 (§2.3) consumes it for the complex topology used by the group integration of §8.4:
  `pathConnectedSpace_realCliffordSpinGroupZero_add_two` for n≥2, compactness,
  `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`, and, in
  `Topology/Algebra/CliffordAlgebra/Spin/SimplyConnected.lean`, the seed
  `CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero_three` (through
  `TauCeti.realSpinThreeHomeomorphQuaternionSphere`, compact `Spin(3)` as the unit
  quaternion sphere), the sphere-bundle step
  `simplyConnectedSpace_realCliffordSpinGroupZero_succ` along `Spin(m) → Spin(m+1) → S^m`
  for m≥2, and simple connectivity for every n≥3,
  `CliffordAlgebra.simplyConnectedSpace_realCliffordSpinGroupZero n hn`
  (Lawson–Michelsohn, *Spin Geometry*, Theorem I.2.10). In
  `Topology/Algebra/CliffordAlgebra/Spin/UniversalCover.lean`,
  `CliffordAlgebra.realCliffordSpinUniversalCoverEquivZero n hn` identifies compact
  `Spin(n)`, n≥3, with the universal covering group of compact `SO(n)` compatibly with
  the two projections, and `realSpecialOrthogonalFundamentalGroupMulEquiv` gives
  `π₁(SO(n), 1) ≅ ℤ/2`. The offset n≥3 is exact and the low dimensions stay separate
  branches: `Spin(2)` is the circle double cover, connected with fundamental group ℤ; in
  dimension1 the generated Spin group is {±1}, not path connected; dimension0 is trivial.
  For complex groups, with the subspace topology of the module topology on the Clifford
  algebra, `CliffordAlgebra.pathConnectedSpace_spinGroup_of_two_le_finrank`
  (`Topology/Algebra/CliffordAlgebra/Spin/Connected.lean`) makes `spinGroup Q` path-connected
  for every nondegenerate Q on a finite-dimensional complex space of dimension at least two. In
  dimension two, `Spin/Two.lean` gives
  `CliffordAlgebra.nonempty_spinGroup_continuousMulEquiv_units_of_finrank_eq_two`, a
  topological-group isomorphism with ℂˣ built on
  `spinGroupContinuousMulEquivUnitsWeightedSumSquaresOne` (`u+vJ ↦ u+iv` for `J=e₁e₂`),
  and `not_simplyConnectedSpace_spinGroup_of_finrank_eq_two`.

#### Polarization and line-coordinate choice

- **A maximal isotropic subspace.** Consume `P.W`, `P.W'`, `P.line`,
  `P.decompositionEquiv` and `P.pairingEquiv`. In dimensions2l and2l+1,
  consume `finrank_W_eq_of_finrank_eq_two_mul` and its `_add_one` counterpart.
  `pairingEquiv_apply` is exactly `polar Q x y`; the line coordinate has
  square Q and records the odd square-root choice. This preserves the full
  polarization family, rather than selecting an arbitrary unlabelled W.
- **The Clifford module `S = ⋀·P.W`.** Consume `TauCeti.spinAction Q P`
  and the three native generator equations from `Polarization/CliffordAction.lean`:
  W acts by exterior multiplication, W' by zero-form `contractLeft` against
  `P.pairingEquiv`, and z in the line by
  `P.lineCoordinate z • CliffordAlgebra.involute`. The native Clifford
  relation and its polarization give
  `c(x)c(y)+c(y)c(x)=polar Q x y • 1`. Use the `_apply` lemmas of
  the native polarized structure isomorphisms above to identify this same action's image.
  In even dimension it is the full End S. In odd dimension it is not
  injective on the full Clifford algebra and factors through one central
  summand; the direct sum of the two odd spinor modules is faithful. Keep
  both line-coordinate choices from the supplier contracts on the same exterior carrier.
  At dimension 1, W=0 and parity is the identity: the two full-Clifford characters
  send the normalized generator to 1 and −1, while both Spin restrictions send
  scalar −1 to −1. Rank zero has no odd line.

#### Fock restrictions, parity and irreducibility

- **The group representation.** Consume `TauCeti.spinRep Q P` and
  `TauCeti.pinRep Q P` from `Spin/Representation.lean`, with their
  `_apply` equations restricting the same native action through the actual
  group inclusions. The equivariance equations of the supplier contracts apply to this
  same Fock carrier, including the parity sign for Pin.
  **SpinDifferentialComparison** is the separate Layer3 group branch. Its output and
  the algebraic Lie highest-weight theorem meet in **SpinGroupHighestWeightCorollary**.
- **Half-spin summands.** Consume `TauCeti.spinPlus Q P`, `spinMinus`,
  `spinPlusSubrep` and `spinMinusSubrep` from `HalfSpin/Basic.lean`.
  Their vector-space sum is always S, but the subrepresentation/invariance
  statements require `P.line=⊥` (equivalent to even ambient dimension).
  In positive even dimension l≥1, `P.W≠⊥` and the two native dimension
  formulas give2^(l−1). Do not infer parity invariance merely because a
  group element is Clifford-even: in odd ambient dimension the line
  operator changes that parity bookkeeping. For odd dimension above1,
  neither nontrivial parity summand is invariant, by
  `TauCeti.not_forall_map_spinRep_spinPlus_le` and
  `TauCeti.not_forall_map_spinRep_spinMinus_le`. At dimension1, W=0,
  S⁺=S=ℂ and S⁻=0; this is the explicit exception, not a half-spin split.
- **From the algebra to the group.** Consume
  `CliffordAlgebra.span_spinGroup_eq_even` from `ReflectionLift.lean`:
  over ℂ, for nondegenerate Q,
  `span_ℂ (spinGroup Q : Set (CliffordAlgebra Q))=(even Q).toSubmodule`.
  Its native `_of_isSquare` version keeps the precise normalization
  `IsSquare ((Q v)⁻¹*(Q w)⁻¹)` for anisotropic pairs; the proof uses
  normalized reflection-pair lifts, spanning by anisotropic vectors and
  even-Clifford induction. Consume this native span theorem, including its empty-product
  rank0 case.
  Do not apply this square-normalization
  theorem to a general field or real signature without its hypotheses.
- **Group irreducibility and inequivalence.** Consume `Spin/Irreducible.lean`:
  `TauCeti.spinRep_isIrreducible_of_odd`,
  `TauCeti.isIrreducible_spinPlusSubrep`, `TauCeti.isIrreducible_spinMinusSubrep` and
  `TauCeti.isEmpty_equiv_spinPlusSubrep_spinMinusSubrep`, with their exact `hline`
  and nonzero-W conditions. Their `_of_span` interfaces explain the bridge:
  group-invariance/intertwining extends linearly to even Q, then the
  native full endomorphism images prove the conclusions. In odd dimension
  `OddStructure.lean` already proves `evenSpinAction_surjective`: for the
  central odd volume ω with ω²=c≠0, surjectivity of the full Fock action
  makes c(ω) scalar and
  `ι(v)=c⁻¹(ι(v)ω)ω` makes the even image all End S. No normalized ω²=1
  or separably-closed hypothesis is needed for that operator-form step;
  the complex group-span specialization supplies group irreducibility.
  In positive even dimension the two End factors give nonisomorphic
  half-spin actions; the group-span lemma supplies group inequivalence.
  At rank0 use the scalar/zero parity split and its sole nonzero simple
  module. Keep the real norm±1 and component branches in Layer7 separate.

#### Cartan coordinates and native spin highest weights

- **A split Cartan and positive roots, matched to the abstract root datum.** Choose dual
  isotropic bases with `polar Q wᵢ wⱼ'=δᵢⱼ`. The bivector
  `Hᵢ=½(ι(wᵢ)ι(wᵢ')−ι(wᵢ')ι(wᵢ))` acts on S as `Nᵢ−1/2`, where
  `Nᵢ=c(wᵢ)c(wᵢ')` is the occupation projection. Pin positive roots to
  `eᵢ−eⱼ` and `eᵢ+eⱼ` for i<j, and additionally `eᵢ` in type B.
  For D use simple roots `eᵢ−eᵢ₊₁` (i<l) and `eₗ₋₁+eₗ` at the other fork;
  thus `ωₗ=½(e₁+⋯+eₗ)` and `ωₗ₋₁=½(e₁+⋯+eₗ₋₁−eₗ)`.
  Identify these coordinates and this positive system with the abstract B/D root
  datum and fundamental weights of the root-systems/highest-weight suppliers.
- **Weights of the spin module.** The Hᵢ eigenvalue on a basis wedge is +1/2
  when wᵢ occurs and −1/2 otherwise. All2^l sign vectors occur. This is native in
  `RepresentationTheory/Spin/Weight.lean` for a basis b of P.W over a commutative ring with
  2 invertible: Hᵢ is `TauCeti.SpinPolarizationData.diagonalBivector`,
  `spinAction_diagonalBivector_basis` multiplies the exterior basis vector indexed by a finite
  set s by `TauCeti.spinWeight K s i` (`⅟2` if i∈s, `−⅟2` otherwise), and
  `TauCeti.range_spinWeight` says the weights are exactly the sign vectors. The top wedge
  `w₁∧⋯∧wₗ` is killed by the pinned positive root operators and has weight ωₗ;
  `w₁∧⋯∧wₗ₋₁` has weight ωₗ₋₁ in type D. Prove these highest-vector statements
  and match the abstract weights before applying highest-weight classification
  (Panyushev, arXiv:math/0001161v1, Lemma 2.2, p. 7, for the character;
  the highest-vector and fundamental-weight identifications use the native declarations below).
- **Type Bₗ: so(2l+1).** For l≥1 the algebraic odd-dimensional Lie module S is
  `L(ωₗ)`, of dimension2^l by the following native theorem:
  `TauCeti.SpinPolarizationData.nonempty_lieModuleEquiv_typeBSpin_irreducibleQuotient`
  makes `⋀·W` a module over `LieAlgebra.Orthogonal.typeB (Fin l) K` through
  `P.typeBSpinLieRep b z hz` (a basis `b` of `P.W` and a line vector `z` with `Q z = 1`) and
  identifies it with `TauCeti.irreducibleQuotient` of the base of `TauCeti.typeBLieBasis` at
  the dual Cartan basis vector of the terminal short node, over any field of characteristic
  zero. Consume it.
  Its half-integral weights lie outside the lattice of vector weights, hence outside
  every tensor power of the standard module, including every exterior power.
  At l=0 retain the one-dimensional trivial Lie module and its actual Spin action;
  no B₀ root classification is asserted.
- **Type Dₗ: so(2l).** For l≥2 the native S⁺ is the even exterior summand
  and S⁻ the odd one. With the Cartan and positive system just fixed, if l is even,
  `S⁺≅L(ωₗ)` and `S⁻≅L(ωₗ₋₁)`; if l is odd, `S⁺≅L(ωₗ₋₁)` and
  `S⁻≅L(ωₗ)`. Each has dimension2^(l−1). Their sum is the restriction of the
  type-B spin module, and the fork automorphism exchanges the two highest weights
  by the numbered native highest-vector formulas. For l≥4 these four identifications hold over
  any field of characteristic zero, in
  `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Fundamental.lean`:
  `TauCeti.SpinPolarizationData.nonempty_lieModuleEquiv_typeDSpinPlus_irreducibleQuotient_terminal_of_even`,
  `nonempty_lieModuleEquiv_typeDSpinMinus_irreducibleQuotient_penultimate_of_even`,
  `nonempty_lieModuleEquiv_typeDSpinPlus_irreducibleQuotient_penultimate_of_odd` and
  `nonempty_lieModuleEquiv_typeDSpinMinus_irreducibleQuotient_terminal_of_odd`. There the
  native half-spin modules are made modules over the split
  `LieAlgebra.Orthogonal.typeD (Fin l) K` through `P.typeDSpinPlusLieRep b hline` and
  `P.typeDSpinMinusLieRep b hline` for a basis `b` of `P.W`, and `L(ω)` is
  `TauCeti.irreducibleQuotient` of the base of `TauCeti.TypeDStd.lieBasis l hl`, with `ωₗ`
  (terminal) and `ωₗ₋₁` (penultimate) the dual-basis vectors of its simple coroots at indices
  `l−1` and `l−2`; their highest vectors are the native
  `isHighestWeightVector_typeDSpin{Plus,Minus}LieRep_exteriorBasis_…` exports. Consume them.
  Preserve D₂'s A₁×A₁ and D₃'s A₃ identifications under this convention.
  At l=1 use the two one-dimensional so(2) weights −1/2 on S⁺ and +1/2 on S⁻,
  without fictitious D₁ fork nodes; at l=0 use S⁺=ℂ, S⁻=0. These rank0/torus
  branches remain part of the representation scope.

#### Real form and Clifford classification

- **The real forms `Cliff(p, q)`.** Consume native `TauCeti.realCliffordForm` from
  `TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic`, with its weight, coordinate,
  signature-isometry and nondegeneracy API. It is the diagonal
  form with `p` entries `+1` and `q` entries `-1`, and `Cliff(p, q) = CliffordAlgebra (realCliffordForm p q)`.
  Consume the four implemented native algebra equivalences and their `_ι`
  generator formulas: `realCliffordOneZeroEquivProd`,
  `realCliffordZeroOneEquivComplex`, `realCliffordZeroTwoEquivQuaternion`,
  and `realCliffordOneOneEquivMatrix`. They fix the acceptance conventions
  `Cliff(1,0) ≅ ℝ × ℝ`, `Cliff(0,1) ≅ ℂ`, `Cliff(0,2) ≅ ℍ`, `Cliff(1,1) ≅ M₂(ℝ)`
  on this same coordinate form; the periodicity recurrence consumes them.
- **Bott periodicity.** Consume native `TauCeti.realCliffordBottEquiv` for the
  hyperbolic recurrence, with its generator formula and the same signature convention. The isomorphisms `Cliff(p+1, q+1) ≅ Cliff(p, q) ⊗ᵣ M₂(ℝ)`,
  `Cliff(p+8, q) ≅ Cliff(p, q) ⊗ᵣ M₁₆(ℝ)` (mod-`8` periodicity), built from
  `CliffordAlgebra.equivEven` and `CliffordAlgebra.prodEquiv`; the resulting **classification table** of
  `Cliff(p, q)` as a matrix algebra over `ℝ`, `ℂ`, or `ℍ` (the eightfold way, native as
  `TauCeti.realClifford_classification p q`, with `TauCeti.realCliffordResidue p q` the
  representative in `[0, 8)` of `q − p` modulo 8), stated as a function of
  `(q - p) mod 8` **in the convention fixed by the four base entries above** (references that make generators
  square to `+1` index by `(p - q) mod 8` instead; the base-entry tests pin which is meant): residues
  `0,1,2,3,4,5,6,7` give `M(ℝ)`, `M(ℂ)`, `M(ℍ)`, `M(ℍ)×M(ℍ)`, `M(ℍ)`, `M(ℂ)`, `M(ℝ)`, `M(ℝ)×M(ℝ)`,
  the size fixed by `dim = 2^(p+q)` (Lawson–Michelsohn, *Spin Geometry*, Theorem I.4.3 and Tables I–II
  of §I.4). This is the real
  refinement of the complex structure theorem above, where all forms of a rank are equivalent.
  **Checks.** `Cliff(1,0)`: residue7, `ℝ×ℝ`; `Cliff(0,1)`: residue1, `ℂ`; `Cliff(0,2)`: residue2,
  `ℍ`; `Cliff(1,1)`: residue0, `M₂(ℝ)`; `Cliff(2,0)`: residue6, `M₂(ℝ)` (generators `Z`, `X`);
  `Cliff(3,0)`: residue5, `M₂(ℂ)` (Pauli matrices); `Cliff(0,3)`: residue3, `ℍ×ℍ`;
  `Cliff(5,0)`: residue3, `M₂(ℍ)×M₂(ℍ)`; `Cliff(0,8)` and `Cliff(8,0)`: residue0, `M₁₆(ℝ)`.
  Indexing by `(p−q) mod 8` instead would put `Cliff(1,0)` at residue1 and predict `ℂ`, which
  is wrong since `Cliff(1,0) ≅ ℝ×ℝ` has zero divisors.

#### Quadratic lifts and the two Lie actions

- **The abstract quadratic realization.** Consume native `CliffordAlgebra.bivector`,
  `bivector_lie_ι`, `quadraticLieSubalgebra`, `soEquivQuadratic` and
  `soEquivQuadratic_lie_ι` in their exact scopes. The quadratic element `β(a, b) = ⅟2 • ⁅ι Q a, ι Q b⁆`,
  pinned by the bracket identity `⁅β(a, b), ι Q x⁆ = ι Q (polar Q b x • a - polar Q a x • b)` with
  `polar` Mathlib's, exactly Layer 3's normalization; the quadratic elements as a `LieSubalgebra` of
  `Cliff(V, Q)` (contained in `even Q` and in `filtration Q 2`); and `soEquivQuadratic`, the Lie
  isomorphism from `skewAdjointLieSubalgebra (polarBilin Q)` onto them for nondegenerate `Q` on a
  finite-dimensional space, pinned by its own generator-action identity so no automorphism of `𝔰𝔬`
  can be silently composed in.
- **Every Clifford module is a `𝔤`-module.** A homomorphism `θ : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(V, Q)` composed with
  the quadratic realization and any Clifford action `ρ : Cliff(V, Q) →ₐ[K] End(S)` gives
  `𝔤 →ₗ⁅K⁆ End(S)` (native `CliffordAlgebra.cliffordInducedRep`, with its apply pin).
  Consume native `CliffordAlgebra.cliffordDerivationRep` for the commutator action
  and `CliffordAlgebra.kostantLieRingModule`, `kostantLieModule`, `kostant_lie_def`
  for the Killing-form left-regular action. The two actions on `Cliff(V, Q)` itself are named apart:
  the **commutator action** (`cliffordDerivationRep`, the exterior extension of the `V`-action under
  `equivExterior`, **not** isotypic) and the **left-regular action** (via `Algebra.lmul`, the
  isotypic one). The worked non-example pinning the distinction:
  `⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1` under the commutator action, against the four copies of the
  `2`-dimensional simple under left multiplication.

#### Rank-three standard representation

For `V = ℂ³` (type `B₁ = A₁`), `even Cliff(V, Q) ≅ M₂(ℂ)` with `dim W = 1`, and the
spinor-norm-one subgroup `spinGroup Q` is the determinant-one subgroup, giving `spinGroup Q ≃* SL(2, ℂ)`;
the `2`-dimensional spin representation `S` is the standard representation of `SL₂`. Over `ℝ` this is
`Spin(3) ≅ SU(2)`. The group isomorphism is native,
`TauCeti.nonempty_spinGroup_mulEquiv_specialLinearGroup_of_finrank_eq_three`, for every nondegenerate
form over a separably closed field of characteristic not two, with its spin/standard intertwining
endpoint.


#### Rank-four half-spin factors

For `V = ℂ⁴` (type `D₂ = A₁ × A₁`), `spinGroup Q ≃* SL(2,ℂ) × SL(2,ℂ)`, with
`S⁺` and `S⁻` the standard representations of the two factors; this is the reducibility of the `D₂` spin
module into the two `A₁` standards. Use the polarized group and representation
equivalences in the supplier contracts, retaining the chosen form and polarization.


#### Compact topology and geometric consumers

Consume the SpinCompactTopologyFoundation contract above: the native simple connectivity for n≥3, the
universal-cover comparison and the low-dimensional exceptions.
The negative-form comparison is NegativeFormEvenComparison of §7.3, on the
native `CliffordAlgebra.realCliffordSpinGroupEquivNeg`;
[SpinGeometry G1.1](../../SpinGeometry/README.md#layer-1-negative-metric-clifford-modules-and-their-positive-metrics)
consumes the same native comparison for its negative-metric geometric model, and
[SpinGeometry G4.1](../../SpinGeometry/README.md#layer-4-spin-lifts-obstruction-and-classification)
is the smooth/frame refinement, downstream of §7.3.


## How to read the build

Layer 0 gives the automorphism criteria; Layer 1 transports normalized forms, and Layer 2
compares their group maps and topology. Layers 3–5 separate algebraic Lie actions from group
differentiation and identify highest weights. Layer 6 adds the vector/exterior-square endpoint;
Layer 7 treats real signatures. Layer 8 builds the numbered Lie, pinned group and three-module
comparisons for triality, then compares the integrated lift. Layer 9 reaches Kostant independently
of Layers 6–8. Native Fock and structure theorems are inputs, so their use before Layer 4 is no
forward construction dependency. `Suggested.lean` states `generator_range_iff`,
`first_word_piece_iff`, `simplyConnectedSpace_spinGroup_of_three_le_finrank` (§2.3),
`spin6_vector_equiv_exteriorSquare`, `cliffordFullCoverToOrthogonal_surjective_and_card_ker`
(§7.2), `exists_trialityAut`, `exists_trialityForm`, `nonempty_kostant_isotypic`,
`kostant_multiplicity` and `kostantSpinRep_multiplicity`, with only the definition
`kostantSpinRep` needed by the last.
The module docstring identifies the other headlines and the carriers they lack at the pins.


## Layer 0: the Clifford algebra, its universal property, and the two gradings

### 0.1 Recovering isometries from Clifford automorphisms

L0.Bogoliubov is §0.1. The criteria below are derived from the universal property and
ordered-monomial basis, not quoted as a theorem named Bogoliubov (Gallier,
arXiv:0805.0311v3, Definition 1.3, p. 14, and Theorem 1.4, p. 18).
Gallier presents the real case; the argument here uses the native field-general
universal property and PBW with 2 invertible, including degenerate forms.

Let K be a field with2 invertible, V a finite-dimensional K-vector space
and Q a quadratic form, including degenerate forms. Put C=CliffordAlgebra Q
and W=range(CliffordAlgebra.ι Q). Use native `Q.IsometryEquiv Q` for
isometries and native `AlgEquiv K C C` for algebra automorphisms, with
multiplication in function-composition order. Construct the subgroup

`B(Q)={φ : C≃ₐ[K]C | Submodule.map φ.toLinearMap W = W}`.

Prove its identity, composition and inverse laws, and construct the group
isomorphism from the isometry group of Q to B(Q) using the existing
`CliffordAlgebra.equivOfIsometry`. Supply the group structure on the native
self-isometry carrier from `refl`, `trans` and `symm`, with the same
composition order. The inverse restricts φ to W and transports through the
native `CliffordAlgebra.ιRangeEquiv`; prove linearity, bijectivity,
`φ(ι(v))=ι(f(v))` and `Q(f(v))=Q(v)` using the generator square and the
injective scalar map. Prove that every φ preserving W comes from a unique
such f, and that the inverse constructions respect both composition and
inverses. Equality of algebra automorphisms is tested on the generators.

Give the equivalent word-filtration characterization:
`φ∈B(Q) ↔ φ(F₁)=F₁ ↔ ∀m≥0, φ(F_m)=F_m`, where F_m is the actual native
`CliffordAlgebra.filtration Q m` and each image is a submodule map. Prove
`F₁=K·1⊕W` by the native PBW/exterior comparison. If φ preserves F₁, write
`φ(ι(v))=a(v)·1+ι(T(v))`. Its induced map on F₁/F₀ makes T invertible;
the degree-one part of the square relation is `2a(v)T(v)=0`, which forces
a(v)=0 over K. This proves the converse without a nondegeneracy hypothesis.
For isometry-induced maps prove preservation of every F_m, compatibility
with `involute` and `reverse`, and that the associated-graded action is the
native exterior action induced by f. Include conjugation/naturality under
isometries between different forms, orthogonal-sum tensor comparisons and
field-extension compatibility through `equivBaseChange`, with the generator
squares commuting in each diagram. The scalar-extension statement compares
the extended maps; it does not assert that all isometries over the larger
field descend. Include V=0 and Q=0, where the construction agrees with the
generator-preserving automorphisms of the exterior algebra. Preserve the
word-filtration condition separately from the ℤ/2-grading.

Calibrate the boundary with the real positive plane `Q(a,b)=a²+b²`.
Construct directly, from the universal property and the ordered-product
basis, the algebra equivalence C≃M₂(ℝ) taking the two generators to

`Z=[[1,0],[0,−1]]`, `X=[[0,1],[1,0]]`.

The generator plane becomes `W=span_ℝ{Z,X}`. The matrices
`D=diag(2,1)` and `D⁻¹=diag(1/2,1)` define an inner algebra automorphism
`A↦DAD⁻¹`; it fixes Z but takes X to `[[0,2],[1/2,0]]`, outside W.
Prove the inverse, matrix identities and nonmembership, then transport this
automorphism back to C to exhibit one not induced by an isometry. This
simple model uses no real periodicity or later Pin/Spin classification.
Thus B(Q) is the precise group in the Clifford/isometry correspondence;
the full algebra automorphism group is a different object. These targets
make the Bogoliubov construction precise: B(Q) is exactly the image of the
isometry group, not the whole automorphism group.

The headlines `generator_range_iff` (an automorphism preserves W if and only
if it is `CliffordAlgebra.equivOfIsometry f` for a unique self-isometry f) and
`first_word_piece_iff` (preserving W is equivalent to preserving F₁) state the
two criteria; the group laws, naturality and associated-graded comparisons
above are targets beyond those two statements.

**Checks.**
- The real positive plane: with `e₁↦Z`, `e₂↦X`, `D=diag(2,1)`, the inner
  automorphism `A↦DAD⁻¹` fixes Z and sends X to `[[0,2],[1/2,0]]`, whose
  entries would have to satisfy `b=2=1/2` to lie in `span{Z,X}`; so it lies
  outside B(Q). A definition identifying every automorphism with an
  isometry would accept it.
- V=0: C=K, the only K-algebra automorphism is the identity, F₁=K·1, and the
  unique isometry is the identity, so both criteria hold; a criterion
  requiring positive dimension would wrongly exclude this case.
- Q=0 on a line Ke: C is the dual numbers `K[ε]`, `ε=ι(e)`; the algebra
  automorphisms are `ε↦uε` for `u∈Kˣ`, all preserve W=Kε, and the isometry
  group of the zero form is `GL₁=Kˣ`: the correspondence is `u↦u`. A
  definition demanding nondegeneracy would wrongly exclude this case.
- Grading is weaker than filtration: in `Cliff(4,0)` with `ω=e₁e₂e₃e₄`
  (`ω²=1`, ω commutes with even and anticommutes with odd elements),
  `u=2+ω` is a unit with `u⁻¹=(2−ω)/3`, and conjugation by u preserves
  the ℤ/2-grading but sends `e₁` to `(5e₁−4e₂e₃e₄)/3`, outside F₁. A
  criterion stated on `evenOdd` instead of on `filtration Q 1` would
  accept it.
- Uniqueness: two isometries f, f′ with `equivOfIsometry f=equivOfIsometry f′`
  agree on every `ι(v)`, hence are equal because ι is injective
  (`CliffordAlgebra.ι_injective`, with 2 invertible); an `∃` in place of
  `∃!` would not record this.

The construction has the following API.

- The subgroup identity, composition and inverse agree with those of algebra automorphisms.
- Restriction and extension are inverse group homomorphisms, with the generator equation stated above.
- Isometry transport, orthogonal sums and scalar extension commute with the induced maps and graded actions.

*Needs:* Mathlib `CliffordAlgebra.lift`, `equivOfIsometry`, `hom_ext`, `ι_injective`; Tau Ceti `CliffordAlgebra.ιRangeEquiv`, `filtration` and `associatedGradedEquivExterior`; Mathlib `equivBaseChange` and `prodEquiv` for the transport laws.

### Examples

For the zero form on a line, ε↦2ε and ε↦3ε compose to ε↦6ε; the inverse of the first is ε↦ε/2. The real-plane matrix and grading-only counterexamples in §0.1 distinguish the two rejected automorphism models.

### Dependencies

Native Clifford universal property, vectors, word filtration and PBW; no later layer.

## Layer 1: the structure theorem

### 1.1 Transport of normalized forms

For a finite-dimensional nondegenerate quadratic space over
a field of characteristic different from two, use the specified diagonalizing isometry from
the supplier contracts; over ℂ use its sum-of-squares normalization. Prove compatibility of
`CliffordAlgebra.equivOfIsometry` with transport of the chosen polarization and its Fock action,
on each of the three polarization summands. Retain the chosen isometry in the comparison.
**Checks.**
- For the normalized complex plane, the monomial group has order 8, centre {±1}, five
conjugacy classes and one negative-central-character irreducible of dimension 2:
`8=4·1²+2²`. Counting every irreducible as one-dimensional would give only 5.
- For normalized dimension 3, its order is 16, its centre has order 4 and its ten classes
give `16=8·1²+2·2²`; the two negative-central-character irreducibles have dimension 2.
- In dimensions 0 and 1 the monomial groups have orders 2 and 4; their Clifford quotient
algebras have dimensions 1 and 2. At dimension 1 all four irreducibles are lines,
while only two have positive central character.

The construction has the following API.

- Transport takes the chosen W, W′ and line to their specified images, with the same polar pairing.
- The exterior map intertwines both Fock actions on every generator, hence every Clifford element.
- Identity and composite form isometries give identity and composite transports.

**Checks.**
- The identity isometry sends a vacuum 1 and a one-vector wedge w to themselves; a scalar rescaling fails the vacuum test.
- In a hyperbolic pair with polar(w,w′)=1, transport w to 2w and w′ to w′/2; creation followed by contraction still gives 1 on w, excluding an unscaled dual transport.
- For the complex form diag(1,2), the normalized basis e₁,e₂/√2 has Gram matrix diag(1,1); retaining e₂ would leave its square equal to 2.

*Needs:* Mathlib `QuadraticForm.isometryEquivWeightedSumSquares`, `CliffordAlgebra.equivOfIsometry`; Tau Ceti complex normalization, `SpinPolarizationData` and `spinAction` from the contracts.

### Examples

The monomial checks in §1.1 give orders 2, 4, 8 and 16 in dimensions 0–3. Transport checks retain the Gram matrix and polar-dual scale.

### Dependencies

Native normalized-form and Fock contracts; Clifford isometry functoriality.

## Layer 2: the Pin and Spin groups and the double covers

### 2.1 The native orthogonal carriers and coordinate comparison

Consume
`TauCeti.QuadraticMap.orthogonalGroup Q` and `specialOrthogonalGroup Q` from the native
`OrthogonalGroup/Basic.lean` supplier. The former consists of the Q-preserving linear
automorphisms and is equivalent, through `orthogonalGroupEquivIsometryEquiv`, to the actual
self-isometry type `Q.IsometryEquiv Q`. Consume `orthogonalGroupCongr` for transport along a
specified isometry, `QuadraticMap.orthogonalDet`, and its determinant-one kernel/inclusion
comparisons `specialOrthogonalWithinEquiv` and `specialOrthogonalToOrthogonal`.
With a finite basis b and 2 invertible, use the coordinate criteria in the supplier
contracts with `D=Q.toMatrix b`; retain D in arbitrary coordinates. Construct the
comparison with the standard matrix groups only along a specified isometry to the
sum-of-squares form, and prove compatibility of this transport with the native Spin
projection. Over ℂ use Layer 1's specified normalization.

The construction has the following API.

- Along the specified isometry, the comparison maps native O(Q) and SO(Q) isomorphically onto `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup`, through `orthogonalGroupCongr`.
- In an arbitrary finite basis, membership is `Aᵀ D A=D` with `D=Q.toMatrix b`, together with `det A=1` for SO.
- Composed with `spinToSpecialOrthogonal`, it gives the matrix of the vector action in the specified basis; identity and composite isometries give identity and composite comparisons.

**Checks.**
- For `D=diag(1,2)` the coordinate swap A has `AᵀA=1` but `AᵀDA=diag(2,1)≠D`: it lies in `Matrix.orthogonalGroup` but does not preserve Q in these coordinates, so a comparison that drops D would accept it.
- In the basis `e₁, e₂/√2` the Gram matrix is `diag(1,1)`, and the swap `e₁↦e₂/√2`, `e₂↦√2e₁` preserves `Q(ae₁+be₂)=a²+2b²`: the image `√2b·e₁+(a/√2)·e₂` has value `2b²+a²`.
- Scalar −1 in Spin acts on V by `involute(−1)·v·(−1)⁻¹=v`, so its matrix is the identity in every basis; recording the spinor action instead of the vector action would give −1.

*Needs:* Tau Ceti `orthogonalGroupCongr`, the two matrix-membership criteria and `spinToSpecialOrthogonal`; §1.1 specified isometry/polarization transport.


### 2.2 The native twisted-conjugation homomorphisms

Consume `CliffordAlgebra.pinToOrthogonal Q`
into native O(Q) and `CliffordAlgebra.spinToSpecialOrthogonal Q` into native SO(Q), under
the same commutative-ring/module and invertible2 hypotheses. Use
`ι_pinToOrthogonal_apply`, `coe_spinToSpecialOrthogonal_apply` and
`specialOrthogonalToOrthogonal_spinToSpecialOrthogonal` for their actual underlying actions
and inclusion comparison. The native SO map remains defined outside finite-free modules,
using Mathlib’s determinant convention1 there. Prove compatibility with functorial form transports; the Fock equivariance is supplied by the contracts. For a nonisotropic v, its Clifford unit lies
in `lipschitzGroup Q` and twisted conjugation gives the **reflection** in `v⊥`.
If `Q v = −1`, it lies in native `pinGroup Q` and `pinToOrthogonal` gives that
reflection. Over ℂ normalize any nonisotropic v to `Q v = −1` first.

*Needs:* Mathlib Clifford functoriality; Tau Ceti `pinToOrthogonal`, `spinToSpecialOrthogonal` and the equivariance supplier; §1.1 transport.


### 2.3 SpinComplexPolarTopology

For every finite-dimensional nondegenerate complex
Q, transport along an explicit form isometry to `∑xᵢ²`, with n=dimℂV, and use
the actual subspace topology of native `spinGroup Q` in Clifford units.
Use the complexified positive-real-form polar deformation in the supplier contracts,
with `g†=conj(reverse g)` in the orthonormal monomial basis. Its formula is
`H(g,t)=g(g†g)^(-t/2)`, for 0≤t≤1, with endpoint in `Spin∩U` (Gallier,
arXiv:0805.0311v3, Theorem 1.24, p. 43, for the polar homeomorphism of an
adjunction-stable pseudo-algebraic matrix group with its unitary part times a real vector
space; the Spin deformation used here is the native one).
Identify this intersection homeomorphically with the real compact
generated Spin(n): unitarity is equivalent to `conj g=g`, and the fixed-real
subgroup equality follows by real Spin→SO surjectivity and the complex kernel
{±1}, not by identifying Spin with all even unitary Clifford elements. Consume the
native base change `CliffordAlgebra.spinGroupBaseChange` (injective by
`spinGroupBaseChange_injective`, continuous by `continuous_spinGroupBaseChange`) and the
coefficient conjugation `CliffordAlgebra.complexConj` with `complexConj_ofBaseChangeAux`;
prove the fixed-locus identification, topology agreement and transport through the chosen
form isometry explicitly.
Connectedness for n≥2 and the exception n=2 are native (Compact Spin topology contract):
`CliffordAlgebra.pathConnectedSpace_spinGroup_of_two_le_finrank`, and at n=2
`nonempty_spinGroup_continuousMulEquiv_units_of_finrank_eq_two`, built on
`spinGroupContinuousMulEquivUnitsWeightedSumSquaresOne` (in the even algebra
`g=u+vJ`, `J=e₁e₂`, `J²=-1`, `u²+v²=1`, sent to `u+iv`, with inverse `u=(z+z⁻¹)/2`,
`v=(z-z⁻¹)/(2i)`), with `not_simplyConnectedSpace_spinGroup_of_finrank_eq_two`.
The target here is simple connectivity for n≥3, the headline
`simplyConnectedSpace_spinGroup_of_three_le_finrank`: transport the simple connectivity of
compact Spin(n) from SpinCompactTopologyFoundation along the polar deformation retraction
onto the unitary fixed locus. Dimension0 is trivial and dimension1 is the discrete {±1} branch.
These are topological statements about complex points; algebraic simple-connectivity
of the B/D root datum is a separate notion. The underlying-real smooth model is
supplied by SpinDifferentialComparison (§3.2); transport these topological conclusions
along its actual subspace-topology identification before LieGroups4–5 integration.
This topology branch is not a prerequisite of the algebraic Fock/highest-weight
core. It is a prerequisite of group-level triality. Indefinite real Spin(p,q)
topology and general real-signature Lie adapters are owned in Layer7;
NoncompactQuantumSymmetry §M0 consumes their (4,1) application.

The construction has the following API.

- The compact-real inclusion identifies its image exactly with the unitary fixed locus.
- The comparison and inverse are continuous for the native subspace topologies and commute with the vector projection.
- Specified form isometries transport the deformation, including its endpoints and fixed-locus equation.

**Checks.**
- In Spin₂(ℂ) at z=2, u=5/4 and v=−3i/4 satisfy u²+v²=1 and u+iv=2; using z instead of z⁻¹ in the inverse fails this identity.
- The polar path on this torus is z/|z|^t: H(2,0)=2 and H(2,1)=1, so the time direction is fixed.
- For z=exp(iθ), H(z,t)=z for all t; a contraction to the identity would wrongly move this compact subgroup.

*Needs:* Tau Ceti polar powers, continuity, retraction and homotopy contracts; native `spinGroupBaseChange` and `complexConj`; native compact Spin covering and simple connectivity; §1.1 isometry transport. Only the integration use additionally needs §3.2 topology/smooth comparison.

### Examples

At rank zero the native comparisons give the twisted normalizer ℂˣ (scalar 2 lies in it with norm 4), the even norm-one group μ₂(ℂ) of order 2 and generated Spin of order 1. At rank two the polar torus path takes 2 to 1 and fixes the unit circle, whose fundamental group is ℤ.

### Dependencies

§1.1 and the native coordinate, cover, rank-zero, compact, base-change and polar APIs.

## Layer 3: the Lie algebra `𝔰𝔬(V) ≅ ⋀²V` inside the Clifford algebra

### 3.1 Bivectors as a Lie subalgebra

Consume native
`CliffordAlgebra.bivector`, `bivector_lie_ι`, `quadraticLieSubalgebra`,
`bivectorExteriorEquivQuadraticLieSubalgebra`, `bivectorLieRing` and
`bivectorLieAlgebra`. The exterior-square Lie structure is transported from
the quadratic Clifford subalgebra, not backwards from so. For the standard form
`QuadraticMap.weightedSumSquares R 1` on `Fin n→R`, consume native
`CliffordAlgebra.bivectorEquivSo` over a commutative ring with invertible2 and
`bivectorEquivSo_apply_ιMulti_mulVec`: the action on x is
`(2∑vᵢxᵢ)•u-(2∑uᵢxᵢ)•v`. The underlying Clifford element is
`β(u,v)=⅟2•⁅ιu,ιv⁆`, with general pin
`⁅β(u,v),ιx⁆=ι(polar Q v x•u-polar Q u x•v)`.
For arbitrary finite-dimensional nondegenerate Q over a field with invertible2,
consume native `CliffordAlgebra.soEquivQuadratic` and its `_lie_ι` pin from
`Quadratic/Realization.lean`. Own the standard-form basis comparison with this
realization by the identical generator action. That comparison is a sibling
of the algebraic spin Lie-action core, which uses the abstract realization directly.
Layer9 consumes the same realization for induced-module/invariant-form applications.

The construction has the following API.

- The standard-form comparison and the abstract realization agree on every `β(u,v)`: both send it to `x ↦ polar Q v x • u − polar Q u x • v`.
- The comparison is a Lie algebra isomorphism commuting with transport along the specified isometry of §1.1.
- Its image is the quadratic Lie subalgebra, contained in `even Q` and in `filtration Q 2`.

**Checks.**
- For the sum of squares, `polar(eᵢ,eⱼ)=2δᵢⱼ` and `β(e₁,e₂)=e₁e₂` sends `e₁↦−2e₂` and `e₂↦2e₁`, as `(2∑vᵢxᵢ)•u−(2∑uᵢxᵢ)•v` gives at u=e₁, v=e₂; the unhalved commutator `⁅ιe₁,ιe₂⁆` would give `−4e₂` and `4e₁`.
- `β(u,u)=0` for every u, matching the zero skew map; the symmetrized product `½(ιu·ιv+ιv·ιu)` would instead give the scalar `Q(u)` at v=u, which is not a bivector.
- The bivectors have dimension `n(n−1)/2`, which is 3 at n=3 and 0 at n=1, equal to `dim so(n)`; the whole of `filtration Q 2` would have dimension `1+n+n(n−1)/2`.

*Needs:* Tau Ceti `bivectorEquivSo`, `soEquivQuadratic` and their generator-action equations; §1.1 specified form isometry.


### 3.2 SpinDifferentialComparison: the group branch

For finite-dimensional nondegenerate
Q over ℂ, build the concrete underlying-real smooth group model and its comparison to
native `spinGroup Q`. Consume `CliffordAlgebra.isClosed_range_spinGroup_toUnits`
and LieGroups0–3's finite-dimensional closed-subgroup/Lie-functor APIs, including
native `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`
to choose data modeled on the actual `lieSubalgebraOfSubgroup`, followed by
`TauCeti.Lie.EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup`. Use Layer2's form/basis
comparison to model the actual SO target as a closed subgroup of matrix units.
Transport the embedded structures with their subspace topologies and actual
inclusions, on Spin along the native injective `spinGroup.toUnits`.
Own the topology/smooth-inclusion transport, smoothness of the native SO projection
and of the finite-dimensional Fock representation, and the transport to an abstract V of
the native identification of the subgroup Lie algebra in units coordinates with the
quadratic Lie subalgebra of the Clifford algebra.
For Q on `Fin n → ℂ` consume the native finite-dimensional normed ℝ-algebra structure of
`Topology/Algebra/CliffordAlgebra/Normed.lean`
(`CliffordAlgebra.instNormedAlgebraRealComplexCliffordAlgebra`,
`instFiniteDimensionalRealComplexCliffordAlgebra`), whose topology is the module topology
used by `Spin/Closed`, and, in `Topology/Algebra/CliffordAlgebra/Spin/LieAlgebra.lean`,
`CliffordAlgebra.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_quadraticLieSubalgebra_complex`
with its exponential-line form
`forall_expUnit_smul_mem_complexSpinGroup_iff_mem_quadraticLieSubalgebra`: for nondegenerate
Q the real Lie algebra of the closed complex Spin subgroup is the complex quadratic Lie
subalgebra. The real-signature statement
`CliffordAlgebra.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_quadraticLieSubalgebra`
is its sibling in the same file. Own only the transport of both along the specified
isometry of §1.1 from an abstract V to `Fin n → ℂ`. Compare with native
`CliffordAlgebra.soEquivQuadratic` and its generator-action equation. The Lie algebra meant here is the quadratic Lie subalgebra,
not the whole associative Clifford algebra. Prove the coordinate maps respect the
complex scalar action, so these real derivatives induce the required ℂ-linear Lie maps.
In those coordinates prove `ι(d(spinToSpecialOrthogonal)(x) v)=⁅x,ι(v)⁆` and
`d(spinRep)(x)=spinAction(x)`. Consume the existing compact-real coordinate theorem
`TauCeti.CliffordAlgebra.realCliffordSpinToSpecialOrthogonalCoordinateLieHom_eq_bivectorEquivSo`
in its actual Q=realCliffordForm n 0 scope, and build the complex-point comparison here.
At dimension0 (D₀) the generated group and Lie algebra are trivial; at dimension1
(B₀) the Lie algebra is zero while the actual scalar Spin action is retained. This branch supplies
**SpinGroupHighestWeightCorollary** after the algebraic highest-weight theorem;
it is independent of that theorem's construction and of representation-level triality.

The construction has the following API.

- The embedded Spin and SO models have their actual inclusions and inherited topologies.
- The projection and Fock action are smooth; their derivatives satisfy the displayed generator equations.
- The Lie-coordinate maps are ℂ-linear and preserve brackets.

**Checks.**
- For a positive plane β=e₁e₂, the derivative sends e₁ to −2e₂ and e₂ to 2e₁, excluding an omitted factor two.
- In rank 1 the Lie algebra is zero but scalar −1 acts on the spinor line by −1; differentiation cannot identify it with the trivial group representation.
- In rank 0 both the generated group and tangent Lie algebra are trivial, of dimensions 0 and 0.

*Needs:* LieGroups Layers 0–3 closed-subgroup and Lie-functor contracts; Tau Ceti closed Spin units range, the complex normed structure of `Normed.lean` and the complex Lie-algebra identification of `Spin/LieAlgebra.lean`; §1.1 isometry transport and §2.1 coordinate transport; native Fock action. The Lie-action comparison does not require §5.2.

### Examples

For Q(e₁)=Q(e₂)=1, [e₁e₂,e₁]=−2e₂ and [e₁e₂,e₂]=2e₁. The vector derivative of exp(t e₁e₂) has exactly these two values.

### Dependencies

§§1.1 and 2.1, native quadratic/Fock APIs and LieGroups Layers 0–3. No highest-weight prerequisite.

## Layer 4: the spin and half-spin representations

Stated over `ℂ`, for finite-dimensional nondegenerate Q. Use the native
`TauCeti.SpinPolarizationData Q` throughout, supplied by
`SpinPolarizationData.ofNondegenerate` in `Spin/Polarization/Exists.lean`.
The Fock construction, representation, parity summands, dimensions and group
irreducibility are native suppliers. This layer exposes their exact chosen conventions,
the algebraic Lie-action comparisons and the separate group-differential branch.

### 4.1 SpinAlgebraicLieActionComparison

Let ℓ_Q be the inclusion of
`CliffordAlgebra.soEquivQuadratic Q hQ` into the Clifford algebra. On S use
`(TauCeti.spinAction Q P).toLieHom.comp ℓ_Q`; equip it with the native
`LieRingModule.compLieHom` and `LieModule.compLieHom` structures. Consume the native
`typeBSpinLieRep`, `typeDSpinLieRep`, `typeDSpinPlusLieRep` and `typeDSpinMinusLieRep`
coordinate models from `Spin/Polarization/TypeB/Representation.lean` and
`TypeD/Representation.lean`, with their actual basis, odd-line unit-vector and hline
hypotheses. Prove their comparison to Layer3's normalization on generators. In particular
`[c(β(a,b)),c(x)]=c(polar Q b x • a−polar Q a x • b)` follows by applying the algebra
homomorphism to the Clifford bracket identity; it requires no differentiated group action.
Consume `Spin/Polarization/Irreducible.lean`'s algebraic Lie irreducibility theorems
`TauCeti.SpinPolarizationData.isIrreducible_typeBSpinLieRep`,
`isIrreducible_typeDSpinPlusLieRep` and `isIrreducible_typeDSpinMinusLieRep` (the last with
the nonzero-W hypothesis), with their adjoin and invariant-subspace inputs. These are the
irreducibility inputs to Layer5, separately from the group-irreducibility suppliers below.

The construction has the following API.

- The composite `(TauCeti.spinAction Q P).toLieHom.comp ℓ_Q` is a Lie homomorphism into `Module.End ℂ S`, whose value on each `β(a,b)` is the stated Fock operator.
- It agrees with the native type-B and type-D coordinate representations along their basis, line-vector and hline data.
- In even dimension it preserves S⁺ and S⁻, and the native irreducibility theorems give the stated irreducibility.

**Checks.**
- On a hyperbolic plane with `polar(w,w′)=1`, `S=span{1,w}`, `C=c(w)`, `A=c(w′)` and `N=CA`: `AC=1−N`, so `β(w,w′)` acts by `½(CA−AC)=N−½`, with value `−½` on 1 and `+½` on w; without the `⅟2` the values would be ∓1, not the spin weights.
- `[N,C]=C` on S (both send 1 to w and w to 0), matching c of the bracket identity `⁅β(w,w′),ιw⁆=ι(polar(w′,w)•w−polar(w,w)•w′)=ιw`; the opposite sign convention would give −C.
- In dimension one the skew-adjoint endomorphisms of the line are zero (`2a·B(x,y)=0` forces a=0), so the Lie action on the one-dimensional S is zero although scalar −1 in Spin acts by −1; the algebraic comparison does not see this sign.

*Needs:* Tau Ceti `soEquivQuadratic`, `spinAction`, the type-B/D coordinate representations and `isIrreducible_typeBSpinLieRep`, `isIrreducible_typeDSpinPlusLieRep`, `isIrreducible_typeDSpinMinusLieRep`; §3.1 basis comparison.


### 4.2 CompactRealSpinSpanAndIrreducibility — real compact groups on complex spinors

For a finite-dimensional positive-definite real quadratic space `(V_R,Q_R)`, consume native `CliffordAlgebra.span_spinGroup_eq_even_of_isSquare`. Its field/characteristic-not2/nondegenerate hypotheses hold over ℝ; its pair-normalization premise holds because `(Q_R v)⁻¹*(Q_R w)⁻¹>0` for nonisotropic v,w, hence is a real square. No `IsSepClosed ℝ` is asserted. This proves that the actual generated real Spin group spans the real even Clifford algebra, including the empty-product rank0 case. Equivalently, in an orthonormal basis the paired positive generators `e_i e_j` are native even norm-one Spin elements and their products span the even algebra; this does not say individual positive generators lie in native Pin.
Consume the native real-to-complex base change: for Mathlib's `CliffordAlgebra.ofBaseChangeAux`, `CliffordAlgebra.ofBaseChangeAux_involute`, `ofBaseChangeAux_reverse`, `ofBaseChangeAux_star`, `ofBaseChangeAux_mem_even` and `ofBaseChangeAux_injective`, and the group maps `CliffordAlgebra.lipschitzGroupBaseChange` and `spinGroupBaseChange` with `spinVectorAction_baseChange_tmul`. Prove that complexifying the real even algebra gives the complex even algebra, by the even-word spanning argument and the inverse base-change comparison. It follows that the complex-linear span of the image of compact real Spin is the whole even algebra of the complexified form. For its genuine native polarization P, group-invariant complex subspaces and complex-linear intertwiners therefore extend to the same even-Clifford action. Apply the existing full-endomorphism images to prove odd full-spin irreducibility and, in positive even dimension, half-spin irreducibility and inequivalence. Keep `P.line=⊥` for the half-spin subrepresentations and `P.W≠⊥` for the nonzero minus factor. Rank0 has the sole nonzero simple `S⁺=ℂ`, with `S⁻=0`; rank1 has the one-dimensional full spinor. This argument supplies real-compact restriction irreducibility; complex Spin irreducibility alone does not.
Geometric negative-metric consumers additionally use the native group comparison `CliffordAlgebra.realCliffordSpinGroupEquivNeg` and Layer7's NegativeFormEvenComparison built on it, sending the positive-form bivector `e_i e_j` to minus the negative-form bivector, with the pinned vector conjugation and central signs. Over ℂ, positive-to-negative full Clifford transport sends v to iv; it is not a real full-algebra isomorphism. SpinGeometry G1.1 compares its separate rank0 `μ₂` geometric carrier with the native trivial generated Spin downstream. The bridge requires neither compact topology/Haar integration nor Bott/KO/triality; bare exterior, CAR and universal-algebra consumers do not inherit it.

The construction has the following API.

- The native real-to-complex inclusion `spinGroupBaseChange` commutes with generators, evenness, norms and the vector action, and is consumed with these equations.
- Complexification identifies the real even algebra with the complex even algebra and its compact-Spin span.
- Invariant subspaces and intertwiners extend from compact Spin to that even algebra, yielding the stated irreducibility and inequivalence.

**Checks.**
- Rank 0: the even algebra and S⁺ have dimension 1, S⁻ has dimension 0; no irreducibility is asserted for the zero module.
- Rank 1: compact Spin={±1}, and −1 acts by −1 on the one-dimensional full spinor; a trivial character would fail.
- Rank 2: in the basis 1,w, e₁=C+A and e₂=i(C−A) give e₁e₂=i(1−2N), with eigenvalues i,−i; its rotations have distinct characters exp(it), exp(−it).

*Needs:* Mathlib `CliffordAlgebra.equivBaseChange`; Tau Ceti base-change maps `spinGroupBaseChange`, `lipschitzGroupBaseChange` and the `ofBaseChangeAux` equations, `span_spinGroup_eq_even_of_isSquare`, the native full End images and half-spin subrepresentations. Negative-metric applications additionally use §7.3.

### Examples

On the hyperbolic Fock plane, C²=A²=0 and (CA+AC)(1)=1. In odd dimension one the two full-Clifford characters differ on e (1 versus −1), but agree on scalar −1 in Spin.

### Dependencies

§3.1, native Fock/irreducibility and real even-span APIs; the negative-metric use additionally needs §7.3.

## Layer 5: the fundamental representations of `Bₗ` and `Dₗ`

Built on [the highest-weight roadmap](../LieHighestWeight/README.md) (the theorem of the highest weight, the
fundamental weights) and [the root-systems roadmap](../RootSystems/README.md) (the `Bₗ`/`Dₗ` root data).
**SpinHighestWeights is algebraic:** use SpinAlgebraicLieActionComparison to make S
and, in even dimension, its parity summands Lie modules by the Layer3 quadratic/bivector
embedding. Their Lie irreducibility comes from the native algebraic adjoin/invariant-subspace
results. Highest-weight classification consumes this action, Cartan and positive roots;
there is no group-differential prerequisite. Consume the native TypeD/HighestWeight
highest-vector and fork-weight comparisons in their actual Lie rank l=dim(P.W)≥4,
characteristic0 scope,
transporting their pinned positive system to the one below. The TypeB and low-rank D
branches retain their explicit root-operator and weight comparisons. The separate
SpinGroupHighestWeightCorollary uses the concrete SpinDifferentialComparison branch.

### 5.1 Low-rank D and specified Cartan transport

Compare the algebraic action of Layer 4
with the chosen Cartan and positive roots: `H_i=N_i−1/2` (the native
`TauCeti.SpinPolarizationData.diagonalBivector`, acting by `TauCeti.spinWeight` through
`spinAction_diagonalBivector_basis`), with positive roots
`e_i−e_j`, `e_i+e_j` for i<j. For half-rank l≥4 use the native identifications
in the contracts with their explicit basis transports. For l=2 identify D₂ with
A₁×A₁ and the two half-spin Lie modules with its two standard modules; for l=3
identify D₃ with A₃ and the half-spin Lie modules with its standard and dual modules.
Respect the exterior-parity assignment: for even l, S⁺ has ω_l; for odd l, S⁻ has ω_l.
At l=1 the weights on S⁺ and S⁻ are −1/2 and +1/2; at l=0 they are the scalar and zero
modules, without a D₁ or D₀ root classification. These are the Lie restrictions of the
polarized rank-four and rank-six standard/dual equivalences in the supplier contracts;
the weight calculation is also the spin character formula of Panyushev,
arXiv:math/0001161v1, Lemma 2.2, p. 7.

The construction has the following API.

- The transported Cartan acts on each exterior basis vector `w_I` by the sign vector with `+½` at i∈I and `−½` otherwise, transporting the native `spinAction_diagonalBivector_basis`.
- The positive root operators kill the top wedge and, in type D, `w₁∧⋯∧wₗ₋₁`; the resulting highest weights are the abstract fundamental weights under the chosen identification of root data.
- At l=2 and l=3 the Lie identifications are the restrictions of the polarized rank-four and rank-six standard/dual equivalences.

**Checks.**
- l=2: `S⁺=span{1,w₁∧w₂}` has weights `(−½,−½)` and `(½,½)=ω₂`, and `S⁻=span{w₁,w₂}` has `(½,−½)=ω₁` and `(−½,½)`; a rule giving S⁺ the weight ωₗ₋₁ at every l would put ω₂ in the wrong summand.
- l=3: the top wedge `w₁∧w₂∧w₃` lies in S⁻ with weight `(½,½,½)=ω₃`, and `w₁∧w₂` in S⁺ with `(½,½,−½)=ω₂`; the l=2 rule "S⁺ has ωₗ" fails here because the top wedge is odd.
- l=1: `S⁺=ℂ·1` has weight `−½` and `S⁻=ℂ·w` has `+½` under `H₁=N₁−½`; reading the weight off `N₁` alone would give 0 and 1.

*Needs:* §4.1 algebraic action comparison; RootSystems §4.3 numbered data; native `diagonalBivector`, `spinWeight` and `spinAction_diagonalBivector_basis`; native B/D highest-weight contracts, and the rank-four/six standard-module equivalences for D₂/D₃.


### 5.2 SpinGroupHighestWeightCorollary

Package the actual native `spinRep` and
half-spin group representations together with their identified differentials from
SpinDifferentialComparison. The resulting ℂ-linear Lie modules are the `L(ωₗ)`
and parity-assigned `L(ωₗ₋₁)` modules just classified, with the existing native
group irreducibility/inequivalence statements on the same carriers. This asserts a
specified differential comparison; it does not identify representations of a
disconnected group from their differentials. At B₀ retain the actual scalar Spin
action on S=ℂ although its Lie action is trivial; at rank0 retain the trivial generated
group and S⁺=ℂ,S⁻=0. Representation-level triality uses SpinHighestWeights,
while the group-level triality stage also consumes this comparison and its integration target.

*Needs:* §3.2 differential comparison; §5.1 Lie identifications; native group irreducibility and inequivalence.


### 5.3 Characters and the Weyl construction, cross-referenced

State the character of `S` as an element of the
group algebra of the weight lattice, `∑_{εᵢ = ±1} e^{½ ∑ᵢ εᵢ eᵢ}` (the Weyl character formula specialized;
Panyushev, arXiv:math/0001161v1, Lemma 2.2, p. 7, and equation (2.3), p. 8);
the familiar product form `∏ᵢ (tᵢ^{½} + tᵢ^{-½})` is its evaluation on a maximal torus, valid only after the
spin maximal torus and its character lattice are defined (half-powers of adjoint-torus coordinates are not
functions on the adjoint torus). Record that the *other* `Bₗ`/`Dₗ` fundamentals `⋀ᵏ V` are built in
[the classical-groups roadmap](../ClassicalGroups/README.md); together they are a full set of fundamental
representations (Fulton–Harris, *Representation Theory*, Lecture 19, §§19.2 and 19.4).

*Needs:* §5.1 chosen Cartan; native weight bases and Weyl character formula from LieHighestWeight supplier contracts; ClassicalGroups §3.5 for the other fundamental modules.

### Examples

For l=2, the highest even wedge has weight (1/2,1/2)=ω₂. For l=3 the top wedge is odd and has weight (1/2,1/2,1/2)=ω₃; the even highest wedge has weight (1/2,1/2,−1/2)=ω₂. At l=1 the vacuum weight is −1/2.

### Dependencies

§4.1 and native highest-weight/root data; only §5.2 additionally needs §3.2.

## Layer 6: the low-dimensional exceptional isomorphisms

Each is an isomorphism of the actual native spin group with a small classical group
(Fulton–Harris, *Representation Theory*, Lecture 20, §§20.1–20.2; the exact polarized
representation equivalences are listed in the supplier contracts).
For every case, retain its complete positive-dimensional nondegenerate membership condition:
evenness, the reversal/Clifford-norm-one condition, and preservation of the Clifford image of V.
Use the specified native even-algebra models and their reversal and membership equations.
In dimension six norm one alone gives GL₄ in the first half-spin projection, while vector
preservation cuts it down to SL₄. The comparisons below retain the actual form isometry,
polarization and matrix basis.

### 6.1 `Spin₅ ≅ Sp₄`

For `V = ℂ⁵` (type `B₂ = C₂`), `spinGroup Q ≃* Sp(4, ℂ)`
(`Matrix.symplecticGroup (Fin 2) ℂ`),
with the `4`-dimensional spin representation `S` the standard representation of `Sp₄`; the symplectic form
on `S` comes from the reversal antiautomorphism. The group isomorphism is the split case of
[OrthogonalSpinGroups 1F](../../../Completed/OrthogonalSpinGroups/README.md#layer-1-the-lipschitz-group-and-the-spinor-norm):
in dimension five the even Clifford algebra is central simple of degree four with reversal
symplectic, `Spin(Q) = U(C₀, σ) = Sp(C₀, σ)` (natively
`range_spinGroup_toUnits_eq_evenUnitaryGroup` in `Spin/LowRank/Five.lean`), and `C₀` splits
over ℂ (`nonempty_algEquiv_even_matrix_of_finrank_eq_two_mul_add_one`). The polarized
spin/standard equivalence is supplied as well. Compare the specified reversal pairing
on S with the chosen standard symplectic form under that equivalence.

The construction has the following API.

- The reversal pairing on S is nondegenerate, alternating and invariant under native Spin.
- Under the polarized rank-five equivalence it is a nonzero multiple of the chosen standard symplectic form, and scalar −1 corresponds to −I.
- The comparison commutes with the specified form isometry and polarization transports of §1.1.

**Checks.**
- Scalar −1 in Spin₅ acts on S by −1, so it goes to −I in Sp₄, the nontrivial central element; a comparison through the vector action would send it to the identity.
- `dim Sp₄=10=dim so₅`, whereas the isometry group of a symmetric form on the four-dimensional S has dimension 6, so a symmetric pairing could not receive the faithful ten-dimensional Spin₅ action.
- On `S=⋀(span{w₁,w₂})`, the pairing given by the top-degree coefficient of `reverse(s)∧t` has `⟨w₁,w₂⟩=1=−⟨w₂,w₁⟩`, `⟨1,w₁∧w₂⟩=1=−⟨w₁∧w₂,1⟩` and the other basis pairings zero, so it is alternating and nondegenerate; without the reversal `⟨1,w₁∧w₂⟩=⟨w₁∧w₂,1⟩`, and that pairing is neither symmetric nor alternating.

*Needs:* Native polarized rank-five group/standard-module comparison and its reversal form; OrthogonalSpinGroups §1F for the unitary carrier.


### 6.2 `Spin₆ ≅ SL₄`

For `V = ℂ⁶` (type `D₃ = A₃`) the group isomorphism is native:
`TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix P hV : spinGroup Q ≃* SL(4, K)`,
for a polarization `P` of a six-dimensional quadratic space over a field with 2
invertible, sends a Spin element to the matrix of its action on `S⁺` in the basis
`TauCeti.spinPlusFinBasisOfFinrankEqSix P hV`
(`coe_spinGroupEquivSpecialLinearGroupOfFinrankEqSix_apply`); over ℂ every nondegenerate
`Q` has such a `P` (`SpinPolarizationData.ofNondegenerate`). Its proof cuts the even
norm-one units, a copy of `GL₄` in the first projection, down to `SL₄` by the determinant
of the half-spin action. Under this isomorphism `S⁺ ≅ ℂ⁴` is the standard representation by
construction; its dual half-spin comparison is supplied as well. Prove
`spin6_vector_equiv_exteriorSquare`: for this same group isomorphism f and polarization P,
there is a linear equivalence `E : V ≃ₗ[ℂ] ⋀[ℂ]^2 (Fin 4 → ℂ)` with
`E(spinToSpecialOrthogonal Q g v)=((TauCeti.stdSLRep ℂ 4).exteriorPower 2 (f g))(E v)`
for every g and v. This is the vector/exterior-square comparison, distinct from either
half-spin equivalence. The `SL₄` side, with its wedge form, its kernel ±1 and its
hyperbolic coordinates, is native (supplier contracts); the target is the comparison of
`spinToSpecialOrthogonal Q` with `TauCeti.spinSixSpecialLinearToSpecialIsometryGroup ℂ`
composed with f, along E. These four exhaust the coincidences of the `Bₗ`/`Dₗ`
diagrams with the `Aₗ`/`Cₗ` diagrams.

*Needs:* Native polarized `TauCeti.spinGroupEquivSpecialLinearGroupOfFinrankEqSix`, its half-spin/dual comparison; Mathlib exterior powers; Tau Ceti `Representation.exteriorPower`, `spinSixWedgeForm`, `spinSixSpecialLinearToSpecialIsometryGroup` with its apply and kernel theorems, and `spinSixWedgeIsometryEquivPolarSplit`; §4.1 algebraic action and §5.1 D₃ weights.

### Examples

For SL₄ diagonal entries 2,3,5,1/30, the six exterior-square eigenvalues are 6,10,1/15,15,1/10,1/6, in reciprocal pairs and with product 1. Scalar −I acts trivially on ⋀² and scalar iI acts by −I; their vector images therefore differ. The exterior-square dimension is 6, whereas each half-spin dimension is 4.

### Dependencies

Native exceptional group/module comparisons, §4.1 and §5.1; Mathlib exterior powers and the native wedge-form and exterior-square APIs.

## Layer 7: real Clifford algebras, Bott periodicity, and `Spin(p, q)`

### 7.1 The real spin groups

`Spin(p,q)` is the native
`CliffordAlgebra.realCliffordSpinGroup p q = spinGroup (TauCeti.realCliffordForm p q)`.
In positive dimension its orthogonal image is `SO(p,q)∩ker(norm-sign)`, with
kernel `{±1}`. The identity-component image and norm-sign-kernel comparison are
supplied by the real component theorems in the contracts, with `2≤p+q`; the
definite rank-one SO group is trivial. Compare the full cover's even subgroup,
which reaches all of SO, with this native norm-one subgroup on the actual
inherited topologies (Lawson–Michelsohn, *Spin Geometry*, §I.2).
Treat the compact `Spin(n) = CliffordAlgebra.realCliffordSpinGroupZero n`, its negative-sign model, and the split
and Lorentzian forms with these explicit image and component qualifications.

*Needs:* Native real component image/kernel contract; the full real cover comparison of §7.2.


### 7.2 Full real orthogonal covers and the norm-one subgroup

For a positive-dimensional
nondegenerate real quadratic space, consume the native normalized full Clifford cover
`CliffordAlgebra.cliffordFullCover Q` inside `lipschitzGroup Q`
(`TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/FullCover.lean`), with its action
`cliffordFullCoverToOrthogonal` and the inclusion `spinToCliffordFullCover`: its elements
are those whose unit-valued reverse norm `cliffordNorm Q x = reverse(x)·x` is `±1`. Since
`star=reverse∘involute`, the norm `N(x)=x star(x)` agrees with it on even elements and is its
negative on odd ones, so the full cover is also the set where `N(x)=±1`.
Prove closure, the inherited topology,
continuity of twisted conjugation, and its surjection onto O(Q) with kernel
`{±1}` of order two (the headline `cliffordFullCoverToOrthogonal_surjective_and_card_ker`, for
finite-dimensional nondegenerate Q of positive dimension), using normalized nonisotropic reflection lifts and Cartan–Dieudonné (Gallier,
arXiv:0805.0311v3, Definition 1.6, p. 31, and Proposition 1.21, p. 39, where Pin(p,q) is
this norm-±1 cover).
Prove the covering-map and local-section statements. Native `pinGroup Q`
is the norm-one subgroup, not this whole cover: `star=reverse∘involute` gives
`N(ιv)=−Q(v)`. Its orthogonal image is the kernel of the descended norm-sign
character. For positive-definite Q in positive dimension, native pin equals
native spin and has image SO, of index two in O. For negative-definite Q it
covers all of O. For indefinite Q its image is the index-two norm-sign kernel.
Prove all three cases, including the even-subgroup images. Compare the
full cover's even subgroup and native `spinGroup Q`, including their images,
components and kernels rather than calling both a cover of every SO component.
State the dimension-zero case separately. Lorentzian field roadmaps consume
this generic full-cover construction; RelativisticQuantumFieldTheory RQFT2
owns its phase-cochain twists, P/C/T actions and Lorentz isoclinism calculation.
**Checks.**
- `Cliff(0,1)`, `e²=−1`: the Lipschitz group is `ℝˣ ∪ ℝˣe` with reverse norms `a²` and
  `−b²`, so the full cover is `{±1,±e}`, cyclic of order 4 (`e²=−1`); `e` acts on V by
  `involute(e)·(te)·e⁻¹=(−e)(te)(−e)=−te`, so the cover maps onto `O(1)={±1}` with kernel
  `{±1}`. Native Pin is the whole cover here (`e·star(e)=−e²=1`). Requiring norm exactly `1`
  instead of `±1` would keep only `{±1}` and miss the reflection.
- `Cliff(1,0)`, `e²=1`: the full cover is again `{±1,±e}` but now `≅ ℤ/2 × ℤ/2`, and it
  covers `O(1)`; native Pin is only `{±1}`, since `e·star(e)=−e²=−1`, with image
  `SO(1)={1}` of index two. The two covers of `O(1)` are not isomorphic, so the sign
  convention of the generators is visible in the group.
- `Cliff(1,1)`, `z=e₁e₂`: `z²=1`, `reverse(z)·z=e₂e₁e₁e₂=−1`, so `z` lies in the even part
  of the full cover but not in native Spin; conjugation by `z` sends `e₁↦−e₁`, `e₂↦−e₂`, the
  element `−1` of `SO(1,1)` outside its identity component, which native Spin, whose
  elements are `±(cosh t + sinh t·z)`, does not reach. A comparison asserting that native
  Spin covers all of `SO(p,q)` fails here.

The construction has the following API.

- The full cover is a closed subgroup of the Clifford units, and `cliffordFullCoverToOrthogonal` acts by `v ↦ involute(x)·v·x⁻¹`.
- That action is a continuous surjection onto O(Q) with kernel {±1} and local sections, hence a covering map.
- Native `pinGroup Q` and `spinGroup Q` lie in the full cover (`spinToCliffordFullCover` for Spin), and their orthogonal images are the kernels of the descended norm-sign character in O(Q) and in SO(Q).

*Needs:* Native `CliffordAlgebra.cliffordFullCover`, `cliffordFullCoverToOrthogonal`, real-signature forms and general-field Cartan–Dieudonné; LieGroups Layers 0–3 for local smooth/topological models.


### 7.3 General real-signature topology and Lie adapters (local to Layer7)

For every
p,q>0, use the actual native `CliffordAlgebra.realCliffordSpinGroup p q` with its inherited topology and its
norm-one condition `x star(x)=1`; on even elements this is the reversal norm.
Keep it distinct from the full cover's even subgroup with norm ±1. Consume
native closedness of the Spin units range, its exponential-line/quadratic-Lie
comparison, and LieGroups0–3's closed-subgroup construction. Own the remaining
real-signature basis/coordinate and differential adapters identifying its Lie
algebra with `so(p,q)`, with the vector projection differentiating to the
Layer3 bivector map. Pin the signature/permutation, subspace-topology and
ambient matrix-topology comparisons on the existing units-range Lie carriers.
**NegativeFormEvenComparison.** The group comparison is native:
`CliffordAlgebra.realCliffordSpinGroupEquivNeg p q : realCliffordSpinGroup p q ≃* realCliffordSpinGroup q p`
in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Neg.lean`, the composite of
`CliffordAlgebra.spinGroupEquivNeg` with the Spin map of the native coordinate isometry
`TauCeti.realCliffordFormNegIsometry p q : -(realCliffordForm p q) ≅ realCliffordForm q p`,
with the bivector sign `coe_realCliffordSpinGroupEquivNeg_apply_of_coe_eq_ι_mul_ι`
(`ι a * ι b ↦ -(ι a' * ι b')`), the vector-action intertwining
`spinVectorAction_realCliffordSpinGroupEquivNeg` and `realCliffordSpinGroupEquivNeg_negOne`
(`-1 ↦ -1` in positive dimension); at `(p, q) = (n, 0)` it compares compact
`Spin(n) = CliffordAlgebra.realCliffordSpinGroupZero n` with `spinGroup (realCliffordForm 0 n)`.
Consume it. Own the two statements it does not make. First, the real algebra isomorphism
`even (realCliffordForm n 0) ≃ₐ[ℝ] even (realCliffordForm 0 n)`, the composite of Mathlib's
`CliffordAlgebra.evenEquivEvenNeg` (`even Q ≃ₐ[R] even (-Q)`, sending `ι a * ι b` to
`-(ι a * ι b)`, pinned by `CliffordAlgebra.evenToNeg_ι`) with Tau Ceti's
`CliffordAlgebra.evenEquivOfIsometry (TauCeti.realCliffordFormNegIsometry n 0)`: prove that it
commutes with `reverse` (from Tau Ceti's `CliffordAlgebra.evenEquivEvenNeg_reverseEven`) and with
`involute` on even elements, and that on Spin elements it is `realCliffordSpinGroupEquivNeg n 0`.
Second, that `realCliffordSpinGroupEquivNeg n 0` is a homeomorphism for the subspace topologies
from the two Clifford unit groups, hence a topological-group isomorphism.
**Checks.** `(e₁e₂)² = −e₁²e₂²` is `−1` on both sides (`−(+1)(+1)` and
`−(−1)(−1)`), so the sign of the bivector image is a convention and the map
`e₁e₂ ↦ +e₁e₂` is also an algebra isomorphism; the pinned sign is minus, as
`evenToNeg_ι` says. Conjugation by `e₁e₂` sends `e₁` to `−e₁` on both sides
(inverse `−e₁e₂` on both), so the vector action is unchanged by the sign.
`reverse(e₁e₂)·e₁e₂ = −(e₁e₂)² = 1` on both sides, so norm one is preserved.
For n=0 and n=1 both even algebras are `ℝ·1` and the map is the identity.
Construct the positive/negative block Clifford inclusions and the maximal
compact subgroup
`K(p,q) ≅ (Spin(p) × Spin(q))/⟨(-1,-1)⟩`, using NegativeFormEvenComparison
(`realCliffordSpinGroupEquivNeg q 0`) for the second block. Prove its kernel, topology and maximal
compactness, and the Cartan/polar homeomorphism
`Spin(p,q) ≅ K(p,q) × ℝ^(p*q)`, giving a deformation retraction to K(p,q) (Gallier,
arXiv:0805.0311v3, Theorem 1.24, p. 43, and Propositions 1.25–1.26, p. 44, for `SO₀(p,q)`; the
lift to Spin is a target here).
**Checks.**
- `(p,q)=(1,1)`: `Spin(1)×Spin(1)={±1}²` and the quotient by `⟨(−1,−1)⟩` has order 2,
  mapping onto `{±1}` in `Spin(1,1)`; among the elements `±(cosh t + sinh t·z)` only `t=0`
  lies in a compact subgroup, so this is the maximal compact subgroup. Omitting the quotient
  would give order 4, and the product map `(a,b)↦ab` is not injective on it.
- `(p,q)=(2,1)`: `K(2,1)=(Spin(2)×{±1})/⟨(−1,−1)⟩ ≅ Spin(2)`, a circle, and the polar factor is
  `ℝ²`; the total dimension `1+2=3` is that of `so(2,1)`, as for `SL₂(ℝ)`, whose maximal
  compact subgroup is the circle `SO(2)`.
- Dimensions: `dim K(p,q) + pq = p(p−1)/2 + q(q−1)/2 + pq = (p+q)(p+q−1)/2 = dim Spin(p,q)`;
  for `(2,2)` this is `1+1+4=6`, and for `(3,1)` it is `3+0+3=6` with `K(3,1) ≅ Spin(3)`.
Use the component classification in the supplier contracts: path connectedness
holds when `2≤p` or `2≤q`. For (1,1), the topological product model gives the two
components `±(cosh t+sinh t z)` with `z²=1`; the identity component is (ℝ,+).
Its one-dimensional abelian Lie algebra is not semisimple. For p+q≥3 prove `so(p,q)` semisimple, including the semisimple
product case `so(2,2) ≅ sl₂(ℝ) ⊕ sl₂(ℝ)`; do not assert simplicity in that case.
Retain the definite compact branches and their dimension0/1 exceptions above.
NoncompactQuantumSymmetry §M0 owns its actual
`(Spin₀(4,1),Spin(4))` application and application-specific adapters, consuming
these general Layer7 comparisons; it is not a prerequisite for this general
maximal-compact/Lie target. The geometric smooth/frame refinement remains in G4.1.

The construction has the following API.

- The even-algebra comparison preserves multiplication, reversal and grade involution, and restricts to the specified negative-form group map.
- The block product map has kernel generated by (−1,−1) and induces the displayed topological quotient K(p,q).
- The Cartan homeomorphism has zero section K(p,q), yields its deformation retraction and proves maximal compactness; the Lie-coordinate map respects the vector differential.

*Needs:* Native real Spin closedness, component classification and quadratic Lie membership; LieGroups Layers 0–3 and Layer 9 Cartan decomposition; native `realCliffordSpinGroupEquivNeg`, Mathlib `evenEquivEvenNeg`; §3.1 normalization.

### Examples

At (1,1), the full even cover contains z=e₁e₂ with norm −1 and vector image −I, outside SO₀(1,1). The native Spin product model has two components. At (2,2), dim K+pq=1+1+4=6, with semisimple Lie algebra sl₂⊕sl₂.

### Dependencies

Native real Clifford, cover, component and negative-form APIs; §3.1 and LieGroups Layers 0–3 and 9.

## Layer 8: triality for `Spin₈`

Fix a nondegenerate eight-dimensional complex quadratic space `(V,Q₈)`, an even
native `P : TauCeti.SpinPolarizationData Q₈`, `hline : P.line=⊥`, and a basis
`b : Module.Basis (Fin 4) ℂ P.W`. All comparisons below retain this data. Transport
along a specified form isometry/polarization comparison gives the theorem for every
such Q₈; an unspecified choice is not a natural identification of carriers.
The algebraic Lie stage precedes group differentiation and integration. The group
stage constructs the algebraic comparison and compares it with the integrated lift.

**Numbering and orientation.** Use `CartanMatrix.D 4`, the Bourbaki roots
`α₁=e₁−e₂`, `α₂=e₂−e₃`, `α₃=e₃−e₄`, `α₄=e₃+e₄`, and the native
`σ=TauCeti.trialityPermD4 : Equiv.Perm (Fin 4)`: zero-based `0→2→3→0`, fixing1,
so one-based `1→3→4→1`. The character lattice P has fundamental basis
`ω₁,…,ω₄` and the cocharacter lattice has the simple-coroot basis, as in
[RootSystems §4.3](../RootSystems/README.md#43-numbered-family-comparisons).
Layer5 assigns S⁺ weight ω₄ and S⁻ weight ω₃ at half-rank4. Sending numbered
root generators by σ acts on pulled-back highest weights by
`ω₁→ω₄→ω₃→ω₁`. Distinguish this contravariant action from the direct permutation
of vectors in the native tripled module.

### 8.1 Numbered Serre and quadratic presentations

8A is §8.1.

Consume `TauCeti.serreDiagramAut ℂ (CartanMatrix.D 4) hσ` from
`TauCeti/Algebra/Lie/Presentation/Serre/Automorphism.lean`,
where `hσ` is the Cartan-preservation equality supplied by
`cartanMatrix_D4_trialityPermD4`, transported from the native Dynkin-type spelling.
Its H/E/F value equations, inverse/composition equations and
`serreDiagramAut_iterate_eq_id` already supply the generic construction and
order-dividing-three theorem. Consume its `serreLift_comp_serreDiagramAut` on an
actual `IsSerreSystem`; no second generic diagram-lift engine is introduced.

The concrete remaining construction is **SpinD4NumberedPresentationComparison**.
Use `TauCeti.TypeDStd.serreRepresentation 4 (by decide)` on the actual split
orthogonal matrix Lie algebra. Consume its complete H/E/F image equations,
`P.typeDQuadraticEquiv b hline`,
`typeDQuadraticEquiv_rootGenerator`, `typeDQuadraticEquiv_cartanGenerator`, and
`typeDQuadraticEquiv_comp_serreRepresentation` from native
`Spin.Polarization.TypeD.Serre.Comparison`. These already fix the chain and fork
signs. Prove that this particular matrix Serre realization is bijective and bundle
it as a Lie equivalence `c_mat`, then compose with `P.typeDQuadraticEquiv b hline`
to obtain `c_quad` into native `CliffordAlgebra.quadraticLieSubalgebra Q₈`.

The proof cut is explicit, and most of it is native at half-rank 4 over ℂ.
Consume `TauCeti.TypeDStd.lieBasis` on the diagonal Cartan
`TauCeti.typeDDiagonalCartan` (abelian, self-normalizing and a Cartan subalgebra
when 2 is regular), the classification of its 24 root lines
`TauCeti.TypeDStd.rootSpace_typeDDiagonalCartan_ne_bot_iff` and their indexing
`TauCeti.TypeDStd.typeDRootWeight` by the pinned simply connected D₄ datum,
generation by the simple root generators `TauCeti.TypeDStd.lieSpan_rootGenerator_eq_top`,
simplicity `TauCeti.TypeDStd.isSimple_typeD` and nondegeneracy of the Killing form
`TauCeti.TypeDStd.isKilling_typeD`; `TauCeti.serreLift_lieBasis_surjective` gives
surjectivity of the Serre lift of the basis generators. None of these is recomputed.
The remaining target is injectivity:
use [LieHighestWeight Layer7's normalized split-field Serre presentation](../LieHighestWeight/README.md)
(Serre's theorem: `Matrix.ToLieAlgebra ℂ (CartanMatrix.D 4)` is finite-dimensional of
dimension 28) and compare dimensions with the 28 coroot/root basis vectors, rather
than an assumed abstract isomorphism with unspecified scalings. D₄ is symmetric, but
the generic Serre-system results use the transposed-Cartan convention; record the
equality, not a silent change of convention. None of these steps uses triality,
topological simple-connectivity or the group comparison below.

For the Clifford formulas put `C_i=ι Q₈ (b_i)` and
`A_i=ι Q₈ (P.dualVector b i)`; on the Fock module these are creation and contraction,
with `A_i C_j+C_j A_i=δ_ij` and `N_i=C_i A_i`.
The positive/negative chain elements are `C_i A_(i+1)` and `C_(i+1) A_i`
for i=1,2,3. The fork elements are `C₃ C₄` and **`A₄ A₃`**. Their brackets are
`N_i−N_(i+1)` and `N₃+N₄−1`. Thus the orthonormal Cartan coordinates are
`H_i=N_i−1/2`; the simple coroots are `H_i−H_(i+1)` and `H₃+H₄`.
These are the native numbered bivector representatives, with the same half-polar
normalization as Layer3, not a fresh Chevalley sign choice.

Transport the native diagram automorphism through `c_mat` and `c_quad`, compare
it under the actual matrix/abstract-orthogonal/quadratic Lie equivalences, and
prove its effect on the Cartan, positive Borel and every simple positive and
negative generator. Use the native lift transport equation to identify the
resulting homomorphisms. The three Lie-module intertwiners are native over ℚ
(`d4VectorToSpinMinusEquiv`, `d4SpinMinusToSpinPlusEquiv`, `d4SpinPlusToVectorEquiv` in the
rational-triality contract, intertwining each Chevalley generator after `trialityPermD4`);
base-change them to the actual complex vector and half-spin carriers of Q₈ along the
isometry of §8.2 item 2, as in8C below, first at Lie level. This is representation-level
triality independently of any group-differential construction.

The construction has the following API.

- `c_mat` and `c_quad` are Lie algebra equivalences from the Serre algebra of `CartanMatrix.D 4`, onto the split orthogonal matrix Lie algebra and onto `CliffordAlgebra.quadraticLieSubalgebra Q₈`.
- They send each numbered `H_i`, `E_i`, `F_i` to the native matrix generators and to the Clifford elements displayed above.
- Transporting `serreDiagramAut` through them gives an automorphism of the quadratic Lie subalgebra with the stated effect on the Cartan, the Borel and every simple generator.

**Checks.**
- The Killing form is `κ(X,Y)=6 tr(XY)` in the eight-dimensional standard module (the factor `2n−2` at n=4): on the 24 roots `Σ_α α(H₁)²=12`, against `tr(H₁²)=2`; a factor 8 or 12 would contradict this trace.
- `[E₄,F₄]=C₃C₄A₄A₃−A₄A₃C₃C₄=N₃N₄−(1−N₃)(1−N₄)=N₃+N₄−1`, which acts by −1 on the vacuum 1; with `F₄=A₃A₄` the bracket changes sign and acts by +1 there.
- The four Cartan elements and the 24 root vectors give `4+24=28=dim so₈`, the Serre dimension; omitting the negative root vectors would give 16.

*Needs:* Native `TypeDStd.serreRepresentation`, `P.typeDQuadraticEquiv`, root-space basis and Serre surjectivity; LieHighestWeight Layer 7 for injectivity; RootSystems §4.3 numbered D₄ datum; §4.1 algebraic Fock action and §5.1 weights; for the intertwiners, the native rational triality intertwiners `d4VectorToSpinMinusEquiv`, `d4SpinMinusToSpinPlusEquiv`, `d4SpinPlusToVectorEquiv` and the isometry of §8.2 item 2.


### 8.2 Pinned tripled and Clifford carriers

8B is §8.2.

**SpinTrialityPinnedCarrierComparison is owned here in Layer8.** It constructs the
following specific comparisons, consuming the generic pinned-group construction,
base change and pinned-isomorphism theorem of
[ReductiveGroups9B](../../ReductiveGroups/README.md#9b-pinned-groups-and-their-explicit-carriers).
That generic owner is not a second home for these Clifford and three-module adapters.

The native supplier is `TauCeti.D4Tripled.groupScheme`, its actual
`points ℂ` subgroup of `GL₂₄(ℂ)`, numbered `rootSubgroupPoints`, and
`weightTorusPoints`. Consume `TauCeti.D4Tripled.pointsPresentation` with
`TauCeti.GeneralLinear.IntegralPointsPresentation.mulEquiv`, `mulEquiv_mapPoints` and `natIso`,
`TauCeti.D4Tripled.points_def` and `TauCeti.D4Tripled.mem_points_iff`
for the represented Hopf-algebra points rather than substituting an abstract
D₄ group for this carrier. Native `TauCeti.D4Tripled.trialityAutomorphism` and
`trialityPoints` already act on it. Native `TauCeti.D4Tripled.coordinateMap_X_eq_zero` supplies
preservation of all three8-dimensional coordinate blocks over every value ring.
Those facts alone assert neither reductivity nor an identification with
CliffordSpin. Build that comparison before transporting triality.

1. **The faithful tripled algebraic carrier over ℂ.** Construct the simply connected
   pinned group `G_sc` of `DynkinType.simplyConnectedRootDatum (.D 4)` using9B,
   and its rational8-dimensional minuscule representations of highest weights
   ω₁,ω₃,ω₄ on the actual three native integral weight lattices after scalar
   extension. Integrate their integral divided-power/root matrices by9B's
   Chevalley–Demazure construction and prove equality with the native tripled
   raising/lowering and weight-torus matrices, not merely equality of characters.
   The sum has trivial kernel: characteristic-zero differential injectivity
   follows from the simple D₄ Lie algebra and the nonzero vector action; a residual
   kernel is central, and its characters on the three blocks are ω₁,ω₃,ω₄,
   which generate P modulo the root lattice. Prove these statements and obtain a
   closed immersion into GL₂₄. Its image is the native toral closure after base
   change to ℂ. Prove this last equality on the defining coordinate ideals:
   identify the rational image with the rational closure generated by the same
   root subgroups and weight torus, use9B root generation/big cells, and identify
   the native integral ideal with its rational contraction. Prove localization
   and flat characteristic-zero extension preserve that kernel; tensoring the
   coordinate exact sequence with ℚ then ℂ gives equality of the ideals. Do not
   assume that arbitrary scheme-theoretic closure commutes with arbitrary base
   change. Consume the native connectedness and smoothness of the subgroup
   generated over ℂ by the numbered root subgroups and weight torus
   (`D4Tripled.geometricallyConnectedCommHopfAlgProperty_generatedCoordinateHopfAlgebra`,
   `D4Tripled.smoothCommHopfAlgProperty_generatedCoordinateHopfAlgebra`),
   `D4Tripled.isCompletelyReducible_standardComodule`, the unipotent-radical
   obstruction `D4Tripled.unipotentRadicalDefiningIdeal_eq_augmentation` (which
   applies once the ideal equality makes the base-changed coordinate algebra
   reduced) and the simple-root pinning equations against
   `DynkinType.simplyConnectedRootDatum`; the remaining content of this item is
   the ideal equality, the full root datum and the big cell. With these inputs
   the construction supplies smoothness, connectedness, the maximal
   torus, the Borel and the full simply connected based root datum of the
   **complex** native carrier. It does not assert an unproved all-base integral
   reductivity theorem.
2. **The pinned algebraic Clifford carrier.** The algebraic model of Spin₈ on
   S⁺⊕S⁻ is the native `TauCeti.TypeDSpinCarrier.groupScheme` at half-rank 4,
   the toral closure of the Fock representation of
   `TauCeti.splitEvenPolarization ℚ 4`; no second closed subgroup of the even
   Clifford units is constructed. On the Clifford algebra of Q₈ define
   `x_i(u)=1+u E_i` and `x_-i(u)=1+u F_i` with the elements of8A. Prove
   `E_i²=F_i²=0`, their inverses `1−u E_i`, `1−u F_i`, and actual native Spin
   membership: reversal norm1 (each `E_i`, `F_i` reverses to its negative)
   and vector preservation, with conjugation on V equal to `exp(u ad E_i)`
   (the quadratic terms agree because `[E_i,[E_i,v]]=−2 E_i v E_i`). Define
   `n_i(z)=x_i(z)x_-i(−z⁻¹)x_i(z)`, `h_i(z)=n_i(z)n_i(−1)` and
   `T_Cl(s)=∏_i h_i(s_i)`. Prove the h_i commute, the torus is injective, its
   characters are the displayed integral weights, and the root conjugation
   equations have simple roots equal to the rows of `CartanMatrix.D 4`. The
   simple coroots are the h_i, not the orthogonal e_i coordinate torus of SO₈,
   whose character lattice is smaller.
   Transport along the isometry of Q₈ with the base change to ℂ of the
   canonical split form that sends the hyperbolic basis `P.typeDBasis b hline`
   to `TauCeti.splitEvenBasis`, and write Φ for `TauCeti.spinRep Q₈ P` in the
   exterior basis `b_I` indexed by `Finset (Fin 4)`. Prove that Φ is injective
   on native `spinGroup Q₈` (the faithful even-Clifford action on S⁺⊕S⁻ of the
   native polarized structure isomorphisms), that Φ(x_±i(u)) and Φ(T_Cl(s)) are the base changes of the native
   `TypeDSpinCarrier.rootSubgroupPoints` and `weightTorusPoints` with the
   **same** parameters (the native comparison
   `typeDSpinSerreRepresentation_eq_comp_serreRepresentation` fixes the chain
   and fork signs), and that Φ maps `spinGroup Q₈` onto the complex points of
   the carrier. The native Spin double cover and native path-connectedness of complex Spin
   (`CliffordAlgebra.pathConnectedSpace_spinGroup_of_two_le_finrank`)
   identify the whole complex-point group with the subgroup generated by these
   root subgroups; do not silently replace it by an unidentified identity
   component. For the pinning hypotheses of9B consume the native connected and
   smooth generated subgroup over ℂ, complete reducibility and
   `TypeDSpinCarrier.unipotentRadicalDefiningIdeal_generated_eq_augmentation`;
   prove the equality of the generated subgroup with the base-changed integral
   carrier by the coordinate-ideal argument of item1, compute the full
   character lattice as P from the faithful half-spin actions and the
   simple-coroot lattice as all Y, and construct the 24 root subgroups by the
   fixed root words and the opposite unipotent big-cell chart, an open
   immersion of dimension28. These supply the reductive, simply connected
   pinning hypotheses for9B without using triality. Topology alone is not an
   algebraic-group-scheme isomorphism; every carrier equality in this item is a
   target here.
   **Checks.** Below, `⁅ι a·ι b, ι x⁆ = polar(b,x)·ι a − polar(a,x)·ι b` and
   `polar(b′_i, b_j) = δ_ij`, with `N_i = C_i A_i` the number operator of slot i.
   - `x_i(u)x_i(v) = x_i(u+v)` and `x_i(u)⁻¹ = x_i(−u)`, because `E_i² = 0`: for instance
     `E₄² = C₃C₄C₃C₄ = −C₃²C₄² = 0`, as `C₃² = Q₈(b₃) = 0`. A root element with nonzero square
     would break additivity in u.
   - On V, `[E₁, ι b₂] = ι b₁` and `[E₁, ι b′₁] = −ι b′₂`, and `E₁ = C₁A₂` brackets the other six
     basis vectors to zero; so `x₁(u)` sends `b₂ ↦ b₂ + u b₁`, `b′₁ ↦ b′₁ − u b′₂` and fixes the rest.
     The pairing is preserved: `polar(b₂ + u b₁, b′₁ − u b′₂) = −u + u = 0 = polar(b₂, b′₁)`;
     the sign `+u b′₂` would not preserve it.
   - Every `E_i` kills `b₁₂₃₄ ∈ S⁺` (`E_i = C_i A_(i+1)` for i≤3 and `E₄ = C₃C₄` all create a
     vector already present), so every `x_i(u)` fixes it; with the fork elements interchanged,
     `A₄A₃·b₁₂₃₄ = b₁₂ ≠ 0` and the highest line would move.
   - `h_i(z)` acts on a vector of `[E_i, F_i]`-eigenvalue m by `z^m`, as `diag(z, z⁻¹)` does in the
     standard representation of `SL₂`, where `n_i(z)` is `[[0, z], [−z⁻¹, 0]]`; hence
     `h_i(z)h_i(w) = h_i(zw)` and `h_i(1) = 1`.
   - On S the eigenvalue of `N₃ + N₄ − 1` gives `h₄(z)·1 = z⁻¹·1`, `h₄(z)·b₁₂₃₄ = z·b₁₂₃₄` and
     `h₄(z)·b₃ = b₃`; with `n₄(z)n₄(1)` in place of `n₄(z)n₄(−1)` the value at `z = 1` would be
     `n₄(1)²`, which acts on `1` by `−1`, not the identity.
   - `h₃(−1)h₄(−1) = −1`: on `b_I` its exponent is `(N₃ − N₄) + (N₃ + N₄ − 1) = 2N₃ − 1`, odd, so
     it acts by `−1` on `S⁺ ⊕ S⁻`, where the Clifford algebra acts faithfully, and trivially on V,
     so it is the central `−1` of Spin₈, invisible in the coordinate torus of `SO₈`.
   - `T_Cl(s)` acts on the highest vectors by their fundamental characters: on `b₁₂₃₄ ∈ S⁺` by
     `s₄` (ω₄), on `b₁₂₃ ∈ S⁻` by `s₃` (ω₃) and on `b₁ ∈ V` by `s₁` (ω₁).
   - `T_Cl` is injective: it acts on `b₁₂ ∈ S⁺` by `s₂ s₄⁻¹` and on `b₁ ∈ S⁻` by `s₁ s₄⁻¹`, and
     with the values `s₄`, `s₃` above these force `s = 1` when `T_Cl(s) = 1`.
   - On V, `b₁, b₂, b₃, b₄` have characters `s₁`, `s₁⁻¹s₂`, `s₂⁻¹s₃s₄`, `s₃⁻¹s₄`, so `T_Cl(s)` acts
     trivially on V exactly when `s₁ = s₂ = 1` and `s₃ = s₄ = ±1`: the kernel of the vector action
     on the torus is `{1, h₃(−1)h₄(−1)} = {±1}`, of order two, not trivial as for the
     coordinate torus of `SO₈`.
3. **The comparison and its values.** Apply9B's pinned-isomorphism theorem to the
   tripled carrier and the spin carrier over ℂ with these
   actual computed pinnings (Conrad, *Reductive Group Schemes*, Theorem 6.1.17,
   p. 197, on the nonempty base Spec ℂ). Bundle the resulting algebraic isomorphisms and,
   composing with Φ⁻¹, the induced complex-point equivalence
   `Ψ : TauCeti.D4Tripled.points ℂ ≃* CliffordAlgebra.spinGroup Q₈`.
   Prove `Ψ(rootSubgroupPoints (.inl i) ℂ u)=x_i(u)` and the corresponding
   negative equation, with the **same additive parameter** u. Prove
   `Ψ(weightTorusPoints ℂ s)=T_Cl(s)` for `s : Fin 4 → ℂˣ`.
   Give the inverse equations, all coordinate maps, and continuity/smoothness
   of these algebraic maps on complex points. Its differential is exactly
   `c_quad` through the tripled H/E/F realization and Layer3's abstract
   orthogonal comparison, not only an unnumbered Lie equivalence. Prove
   compatibility with `(TauCeti.D4Tripled.pointsPresentation ℂ).mulEquiv`, so that scheme
   triality and matrix-point triality yield the same Ψ-conjugate automorphism; on scheme-valued
   points the native `TauCeti.D4Tripled.schemePointsMulEquiv_trialityAutomorphism_comp_carrierι`
   already identifies scheme triality with conjugation by `trialityMatrix`. Pinning uniqueness makes
   these comparisons independent of proof choices; changes of b/P use their
   specified transport maps.

The construction has the following API.

- The root elements have additive parameter law and inverse at the negative parameter; the coroot elements multiply in their unit parameter.
- The torus is injective with the specified character and coroot lattices, root conjugation equations and big-cell chart.
- The comparison and inverse preserve every numbered root subgroup and torus parameter, commute with represented points and have the specified differential.

*Needs:* §8.1 numbered generators; ReductiveGroups §9B pinned groups, root generation and isomorphism theorem; native TypeDSpinCarrier and D4Tripled contracts; native faithful even Fock action and complex double cover; native `CliffordAlgebra.pathConnectedSpace_spinGroup_of_two_le_finrank` for the whole complex-point group. Item 3 also uses Items 1–2.


### 8.3 Three blocks and oriented pullbacks

8C is §8.3.

Let B₁,B₃,B₄ be the actual coordinate subspaces on indices0–7,8–15,16–23 of
`Fin 24 → ℂ`, with block representations β₁,β₃,β₄ of `D4Tripled.points ℂ`.
Construct them by restricting the native24-dimensional representation using the
Levi theorem, and prove they are invertible block maps; do not infer a
representation from an informal matrix corner. Their highest vectors are the
coordinate vectors at indices0,8,16. Obtain linear equivalences
`J₁:B₁≃ₗ[ℂ]V`, `J₃:B₃≃ₗ[ℂ]S⁻`, `J₄:B₄≃ₗ[ℂ]S⁺` as the base changes to ℂ, along the
isometry of §8.2 item 2, of the inverses of the native rational block equivalences
`TauCeti.D4Tripled.vectorBlockEquiv` (read in the hyperbolic basis `P.typeDBasis b hline` of V),
`TauCeti.SpinPolarizationData.d4SpinMinusBlockEquiv` and `d4SpinPlusBlockEquiv`, where
`ρ₊=(TauCeti.spinPlusSubrep P hline).toRepresentation`,
`ρ₋=(TauCeti.spinMinusSubrep P hline).toRepresentation`, and ρᵥ is the native
`spinToSpecialOrthogonal Q₈` vector action. Pin J₁ at b₁, J₃ at
`b₁∧b₂∧b₃`, and J₄ at `b₁∧b₂∧b₃∧b₄`, understood as vectors of the actual
parity submodules. These have weights ω₁,ω₃,ω₄ in8A's Cartan/Borel.

On all eight weight vectors of each block, in the native coordinate order, the maps are
exactly:

| Block coordinates | Images, in order (wedge factors increasing) |
|---|---|
| 0–7 | `b₁,b₂,b₃,b₄,b′₄,−b′₃,b′₂,−b′₁` |
| 8–15 | `b₁₂₃,b₁₂₄,b₁₃₄,b₂₃₄,b₁,b₂,b₃,b₄` |
| 16–23 | `b₁₂₃₄,b₁₂,b₁₃,b₂₃,b₁₄,b₂₄,b₃₄,1` |

Here b′ is the polar-dual basis, `b_I` is the increasing exterior monomial in
P.W, and 1 is the exterior unit. The chain/fork formulas of8A fix the signs
shown. Over ℚ the inverses of the native block equivalences have these values:
`d4SpinMinusBlockEquiv_symm_single` and `d4SpinPlusBlockEquiv_symm_single` send each
coordinate vector to the exterior basis vector of the same weight with sign `+`, and
`vectorBlockEquiv_apply_apply` carries the signs `TauCeti.D4Tripled.vectorBasisSign` of
row 0–7; their `_serreE`, `_serreF` and `_serreH` equations give the full H/E/F agreement.
The Lie intertwiners required in8A are the base changes of these equations to Q₈. For the
group comparison prove the same equations
on each x_±i(u) and on T(s), then use root generation from8B to obtain
`J_j β_j(g)=ρ_j(Ψ g) J_j` for every g. All group actions are on these actual
native vector/parity carriers. The full `TauCeti.spinRep Q₈ P` is16-dimensional
and is S⁺⊕S⁻; it is not one of these three8-dimensional blocks.

**Checks.** Here `F_i` acts on V by the bracket of 8B and on S by the Fock operators, with
`A_i` the contraction by `b′_i`, a graded derivation.
- J₁: the highest coordinate goes to `b₁`, of weight `e₁ = ω₁` (`[N_j, ι b₁] = δ_j1 ι b₁`),
  bracketed to zero by every `E_i`.
- J₁: the lowering steps are `F₁b₁ = b₂`, `F₂b₂ = b₃`, `F₃b₃ = b₄`, `F₄b₃ = b′₄`,
  `F₃b′₄ = −b′₃`, `F₂(−b′₃) = b′₂` and `F₁b′₂ = −b′₁`, which are the two minus signs of
  row 0–7; a row with `+b′₃` or `+b′₁` would fail to intertwine `F₃` or `F₁`.
- J₁: the inverse step `E₄b′₄ = b₃` matches `F₄b₃ = b′₄`, and `ad(N₃ + N₄ − 1)` acts on `b₃` by
  `1 = ⟨e₃, e₃ + e₄⟩`, the `SL₂`-weight of that two-dimensional string.
- J₃: the highest image `b₁₂₃` has weight `(½,½,½,−½) = ω₃` for `H_i = N_i − ½`, and every
  `E_i` kills it (for instance `E₂b₁₂₃ = C₂A₃b₁₂₃ = C₂b₁₂ = 0`).
- J₃: `F₃b₁₂₃ = b₁₂₄`, `F₂b₁₂₄ = C₃(−b₁₄) = b₁₃₄`, `F₁b₁₃₄ = b₂₃₄` and
  `F₄b₁₃₄ = A₄(−b₁₄) = b₁`, all with sign `+`, as in row 8–15.
- J₃: all eight images have odd degree (3 or 1), and their weights are the eight vectors
  `½(±1,±1,±1,±1)` with an odd number of minus signs, each once; exchanging J₃ and J₄
  would put `b₁₂₃` in S⁺.
- J₄: the highest image `b₁₂₃₄` has weight `(½,½,½,½) = ω₄`, and every `E_i` kills it.
- J₄: `F₄b₁₂₃₄ = b₁₂`, `F₂b₁₂ = b₁₃`, `F₁b₁₃ = b₂₃`, `F₃b₁₃ = b₁₄`, `F₁b₁₄ = b₂₄`,
  `F₂b₂₄ = b₃₄` and `F₄b₃₄ = 1`, all with sign `+`, as in row 16–23.
- J₄: all images have even degree (4, 2, 0); the lowest coordinate goes to the vacuum `1`, of
  weight `−ω₄`, on which `h₄(z)` acts by `z⁻¹`, against `z` on `b₁₂₃₄`.

Let `P₂₄=TauCeti.D4Tripled.trialityMatrix ℂ`, the native permutation matrix.
Native `d4TripledTrialityPerm` sends blocks `B₁→B₃→B₄→B₁`, and
`trialityPoints ℂ g=P₂₄ g P₂₄⁻¹`. Define
`t=Ψ ∘ trialityPoints ℂ ∘ Ψ⁻¹`. Define the three explicit intertwiners
`K_v+=J₁(P₂₄|B₄)J₄⁻¹:S⁺→V`,
`K_+−=J₄(P₂₄|B₃)J₃⁻¹:S⁻→S⁺`, and
`K_−v=J₃(P₂₄|B₁)J₁⁻¹:V→S⁻`.
Their rational Lie-level counterparts are the native `d4SpinPlusToVectorEquiv`,
`d4SpinMinusToSpinPlusEquiv` and `d4VectorToSpinMinusEquiv`, composed from the same block
equivalences and the block reindexings by `d4TripledTrialityPerm`.
Prove, for every s in native Spin₈,
`ρᵥ(t s)K_v+=K_v+ρ₊(s)`,
`ρ₊(t s)K_+−=K_+−ρ₋(s)`, and
`ρ₋(t s)K_−v=K_−vρᵥ(s)`.
Their cyclic composite on V is the identity by the native `P₂₄³=1`.
Thus the retained pullback cycle is
`ρᵥ∘t≅ρ₊`, `ρ₊∘t≅ρ₋`, `ρ₋∘t≅ρᵥ`.
Prove the numbered root equations and the inverse torus relabelling
`t(T_Cl(s))=T_Cl(fun k => s(σ.symm k))` from the native equations. A forward
σ in this formula would contradict the pinned roots/weights.

The construction has the following API.

- Each block restriction is a representation, with its displayed highest vector and eight-vector basis.
- The J maps and inverses intertwine H/E/F, root subgroups and the torus; lowering words give the displayed normalized values.
- The K maps intertwine the three oriented pullbacks and have cyclic composite the identity.

*Needs:* §8.1 numbered Lie maps and §8.2 root/torus comparison; native D4Tripled block preservation and triality permutation; native rational block equivalences `vectorBlockEquiv`, `d4SpinMinusBlockEquiv`, `d4SpinPlusBlockEquiv` and intertwiners `d4VectorToSpinMinusEquiv`, `d4SpinMinusToSpinPlusEquiv`, `d4SpinPlusToVectorEquiv`; native Fock/half-spin carriers and §5.1 weights.


### 8.4 Integration and invariant triality form

8D is §8.4.

Consume LieGroups4–5's integration of Lie homomorphisms, Layer2's
SpinComplexPolarTopology (simply connected for n≥3; connectedness for n≥2 is native) and
Layer3's SpinDifferentialComparison. Regard the complex Lie automorphism of8A
as real-linear and integrate it on the actual underlying-real smooth Spin₈(ℂ).
**SpinSimplyConnectedIntegrationComparison** constructs the integrating-carrier
isomorphism and proves that the resulting smooth automorphism equals t from8C,
using the identical differential on the H/E/F generators and uniqueness of
integration on a connected simply connected group (Kirillov, *Introduction to Lie Groups
and Lie Algebras*, author notes, Theorem 3.41, p. 40). Construct the polarization/basis-dependent
automorphism first with its Ψ value equation. The headline `exists_trialityAut`
states the outcome for every even polarization `P` with `P.line=⊥`: an
automorphism t of native `spinGroup Q₈` with `t³=1`, not inner, with the three
pullback intertwiners of8C, and conjugate under some `Ψ : TauCeti.D4Tripled.points ℂ ≃* spinGroup Q₈`
to `TauCeti.D4Tripled.trialityPoints ℂ`. For other specified data use the proved
polarization/form transport equations, rather than asserting equality of all
pinned automorphisms without conjugating their pinnings. Algebraic simple-connectivity
is not substituted for this topological hypothesis. This retains the group
integration summit as well as its comparison with the native algebraic carrier.

The native order-dividing-three statement transports to `t³=1`. Prove exact
order3 and that t is not inner using8C and the three pairwise nonisomorphic
highest weights ω₁,ω₃,ω₄: an inner twist is intertwined with the original
representation by that group's action and cannot change its isomorphism class.
Reversing σ uses t⁻¹ and reverses every block/pullback/torus equation together.
Finally construct the nonzero `Spin₈`-invariant trilinear form
`V⊗S⁺⊗S⁻→ℂ` (the headline `exists_trialityForm`: Clifford multiplication
`V⊗S⁺→S⁻` paired with the reversal-invariant pairing on S⁻, invariant by
`TauCeti.spinRep_mul_spinAction_ι_mul_spinRep_inv`), normalize it with the chosen Clifford multiplication and invariant
pairings, and compute its transformation under t and the displayed intertwiners
(Baez, *The Octonions*, arXiv:math/0105155v4, §2.4, pp. 15–17, for the compact-real
Clifford multiplication and triality; the specified complex carrier transport here is an
additional comparison). Compare it with the base change to Q₈, along the isometry of §8.2
item 2, of the native rational form `d4TrialityTrilinearForm` (nonzero, cyclic under the
native intertwiners and invariant under every Chevalley generator, with its vector, odd and
even arguments in that order).
Relate this triality form to octonion multiplication under specified quadratic
and carrier isometries, against the native octonion algebra `TauCeti.Octonion`, its form
`TauCeti.Octonion.trialityTrilinearForm` (the trace of a triple product) and the native
comparison of the integral coordinate triality form with it,
`TauCeti.D4Tripled.trialityTrilinearForm_eq_octonionBlockTrilinearForm`. These consequences
retain the octonion target; no
real-form identification is inferred from the complex comparison. The real
Clifford/Pin/Spin/Bott programme of Layer7 and Kostant's independent Layer9
remain separate with their existing hypotheses.

The triality form and the integrated comparison have the following API.

- The nonzero trilinear form is invariant under the native vector and two half-spin actions.
- The specified J and K maps compare it with Clifford multiplication and the octonion form, retaining the chosen normalization.
- The integrated automorphism has the specified differential and equals the algebraically transported automorphism; cubing gives the identity.

**Checks.**
- With pairing normalized by the coefficient of w₁w₂w₃w₄, Clifford multiplication gives T(w₁,1,w₂w₃w₄)=1, excluding the zero form.
- The same expression with w₂ in the first slot is 0 because w₂∧w₂w₃w₄=0, excluding an arbitrary constant trilinear value.
- The three weights on the nonzero value sum to `e₁−(e₁+e₂+e₃+e₄)/2+(−e₁+e₂+e₃+e₄)/2=0`; changing the last factor to the same highest weight as the vacuum breaks torus invariance.

*Needs:* §8.3 oriented intertwiners; §2.3 simple connectivity and §3.2 differentials; LieGroups Layers 4–5 integration; native Spin equivariance, octonion trilinear form, D4Tripled octonion comparison and, for the form comparison, native `d4TrialityTrilinearForm` with the isometry of §8.2 item 2.

### Examples

The displayed lowering tables have eight independent weights in each block. On their highest lines the inverse torus relabelling cycles ω₁→ω₄→ω₃→ω₁; the opposite relabelling reverses this cycle. The central element h₃(−1)h₄(−1) acts as −1 on both half-spin modules and +1 on V.

### Dependencies

§§2.3, 3.2, 4.1 and 5.1 as specified separately above; LieHighestWeight Layer 7, RootSystems §4.3, ReductiveGroups §9B and LieGroups Layers 4–5.

## Layer 9: Lie algebras acting through the Clifford algebra, and Kostant's isotypy corollary

Layer3 consumes the native standard-ring and abstract-form quadratic realizations; this layer
consumes those same native interfaces, turns them into a machine (every Clifford module becomes a
`𝔤`-module along any `θ : 𝔤 → 𝔰𝔬(V, Q)`), and climbs to its summit application: Kostant's isotypy
corollary for `Cliff(𝔤, B)` under **left multiplication** by the quadratic lift of the adjoint
representation. The two-actions convention of the standing conventions governs every statement
here. Independent of Layers 6-8.

### 9.1 The adjoint embedding and the rank bookkeeping

For a symmetric invariant nondegenerate `B`
(the Killing form of a semisimple `𝔤`, or the trace form of a faithful representation where the
Killing form is degenerate), `ad : 𝔤 →ₗ⁅K⁆ 𝔰𝔬(𝔤, B)` is the native
`TauCeti.LieAlgebra.adjointSO B hB`, pinned by `TauCeti.LieAlgebra.adjointSO_apply`
(`(adjointSO B hB x) y = ⁅x, y⁆`); it needs only the invariance `hB` of `B`, not
symmetry. Consume native `TauCeti.LieAlgebra.killingQuadraticForm` and
`CliffordAlgebra.adjointCliffordHom` with their pins (Kostant, Proposition 28; Bazlov, arXiv:0812.2059v2, §3.5, p. 11).
For finite-dimensional Killing-semisimple 𝔤 over ℂ, prove
`LieAlgebra.rank ℂ 𝔤 = dim H` for a Cartan subalgebra H; combine it with
`TauCeti.finrank_eq_finrank_cartan_add_two_mul_card_isPos` to obtain
`d = l + 2 · #Δ⁺`. This additive identity makes the multiplicity exponents exact divisions.

*Needs:* Mathlib `LieAlgebra.rank` and Cartan subalgebras; native root-space dimensions, `TauCeti.finrank_eq_finrank_cartan_add_two_mul_card_isPos`, invariant-form adjoint lift and Killing quadratic form.


### 9.2 Kostant's isotypy corollary (the summit)

For Killing-semisimple `𝔤` over `ℂ`, the
left-regular `Cliff(𝔤, κ)` (carrier the Clifford algebra of the Killing quadratic form,
`⁅x, c⁆ = q(ad x) · c`, identified with `⋀𝔤` by `equivExterior` and of dimension `2^d` by the native
`CliffordAlgebra.finrank_eq_two_pow`): for a Cartan subalgebra `H` and a base `b` of its root system, every simple submodule is
isomorphic to `L(ρ)`, and the pinned decomposition equivalence exhibits `2^{(d+l)/2}` copies of
`L(ρ)`, which has dimension `2^{(d-l)/2}` (`nonempty_kostant_isotypic`, `kostant_multiplicity`). Here `L(ρ)`
is the native carrier `TauCeti.irreducibleQuotient b ρ`, the irreducible quotient of the Verma
module, at the Weyl vector `ρ = TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) b`, the
half-sum of the positive roots of `b`; the same carrier is `V_ρ` below. Kostant's full `ρ`-decomposition
`C(𝔤) ≅ End(V_ρ) ⊗ C(P)` is a required, strictly stronger construction target on explicit objects
(Bazlov, arXiv:0812.2059v2, §§3.2–3.5, pp. 9–11, Theorem 3.1; Kostant,
Theorems B, 35 and 40). The ordinary commutant identities below are consequences
of this tensor decomposition, not a claim of ordinary mutual commutants in odd rank. Set `E=(⋀𝔤)^𝔤`, let `I` be its positive-degree augmentation ideal, and define `P` as the orthocomplement of `I²` inside `I` for the degreewise determinant extension of the Killing form (different exterior degrees are orthogonal). This is not the primitive subspace of the ordinary exterior Hopf coalgebra. Name the equivariant Chevalley/PBW quantization `σ : ⋀𝔤 ≃ₗ C(𝔤)`, with antisymmetrization normalized by `1/k!`. Prove that `σ(p)σ(q)+σ(q)σ(p)` is scalar, define `Q_P` by `σ(p)²=Q_P(p)·1`, and compare its polar form and reversal signs with the extended Killing forms; do not simply restrict the exterior bilinear form and assume the Clifford relations. Prove `dim P=l` and nondegeneracy. Let `A` be the image of `U(𝔤)` under the adjoint quadratic lift; it lies in the even Clifford algebra and its ordinary commutant is the invariant Clifford algebra. Construct `Cliff(P,Q_P)` faithfully into that commutant, write `B` for its image and identify `A≅End(V_ρ)` as algebras, with `V_ρ` the native `TauCeti.irreducibleQuotient b ρ` and the isomorphism compatible with the action of `A` on `V_ρ` through `U(𝔤)`. Prove the ordinary commutant identities `Comm(A)=B` and `Comm(B)=A·Z(B)`, together with generation and the actual multiplication algebra equivalence `A⊗Cliff(P,Q_P)≃C(𝔤)`, including the ordinary-versus-graded tensor sign dictionary. Do not assert ordinary mutual commutants in odd rank: for `𝔰𝔩₂`, `C(𝔤)=M₂⊕M₂`, `A` is the diagonal `M₂` and `B=ℂ⊕ℂ` is central, so `Comm(B)` is the whole Clifford algebra. A graded-commutant formulation requires its own explicit grading comparison. Retain rank zero (`P=0`, `A=ℂ`). Restriction to the native left-regular `𝔤`-action must recover isotypy and multiplicity. Neither numerical dimension nor CAR proves this target; no relative symmetric-pair theorem is imported. The **spin-module variant**: the full spinor module
`⋀·W` of `Cliff(𝔤, κ)` (the native `spinAction` composed with the adjoint quadratic lift; in positive even
dimension it is `S⁺ ⊕ S⁻`, with the two half-spin summands separately smaller by a factor of two;
at dimension0 the full spinor module is ℂ, with `S⁺=ℂ` and `S⁻=0`)
is isotypic with multiplicity `2^{⌊l/2⌋}`: a linear equivalence of `⋀·W` with the direct sum of
`2^{⌊l/2⌋}` copies of `TauCeti.irreducibleQuotient b ρ` intertwines the action through `kostantSpinRep`
with the Lie action on the direct sum (`kostantSpinRep_multiplicity`). The dimensions agree:
`dim ⋀·W = 2^{⌊d/2⌋}` and `d ≡ l (mod 2)` give `2^{⌊l/2⌋} · 2^{(d-l)/2} = 2^{⌊d/2⌋}`.
**Checks** of `σ`, `P` and `Q_P`. For `𝔰𝔩₂`, `κ(h,h) = 8` and `κ(e,f) = 4`, so `h`, `e+f`, `e−f`
are κ-orthogonal with `κ`-values `8`, `8`, `−8`; for `Q = killingQuadraticForm`, `ι x·ι x = κ(x,x)`
and `polar = 2κ`.
- `σ(x∧y) = ½(xy − yx) = xy − κ(x,y)`, so `σ(x∧x) = 0` while `ι x·ι x = κ(x,x)`: the map
  `x∧y ↦ xy` is not alternating, and σ is not multiplicative (`σ(h)σ(h) = 8`, `σ(h∧h) = 0`).
- For κ-orthogonal `x₁,…,x_k`, `σ(x₁∧⋯∧x_k) = x₁⋯x_k`: for `ω = h∧(e+f)∧(e−f)`,
  `σ(ω) = h(e+f)(e−f)`.
- σ is the identity on degrees 0 and 1 (`σ(1) = 1`, `σ(x) = ι x`).
- `𝔰𝔩₂` (`d = 3`, `l = 1`): `⋀¹` and `⋀²` are copies of the adjoint representation, so
  `E = ℂ1 ⊕ ℂω`, `I = ℂω`, `I² = 0` and `P = ℂω`, of dimension `1 = l`.
- `𝔰𝔩₂ ⊕ 𝔰𝔩₂` (`d = 6`, `l = 2`): with the volume forms ω₁, ω₂ of the factors,
  `E = span{1, ω₁, ω₂, ω₁∧ω₂}`, `I² = ℂ ω₁∧ω₂` and `P = span{ω₁, ω₂}`, of dimension `2 = l`;
  taking `P = I` would give dimension 3.
- Rank zero: for `𝔤 = 0`, `E = ℂ`, `I = 0` and `P = 0`, of dimension `0 = l`.
- `Q_P(ω) = σ(ω)²`: three anticommuting factors with squares `q₁, q₂, q₃` give
  `(x₁x₂x₃)² = −q₁q₂q₃`, so `Q_P(ω) = −(8·8·(−8)) = 512 ≠ 0`.
- The determinant extension of κ gives `⟨ω, ω⟩ = 8·8·(−8) = −512 = −Q_P(ω)`; the factor
  `−1` is the reversal sign `(−1)^(3·2/2)` in degree 3, so the restricted exterior form is
  not `Q_P`.
- For `𝔰𝔩₂ ⊕ 𝔰𝔩₂`, `σ(ω₁)` and `σ(ω₂)` are odd products of mutually orthogonal vectors and
  anticommute, so `Q_P(aω₁ + bω₂) = 512(a² + b²)`: diagonal and nondegenerate on P.

The construction has the following API.

- Quantization is equivariant, respects the filtration and has the normalized antisymmetrization formula, including degrees 0 and 1.
- The primitive subspace has dimension l; its scalar-square quadratic form is nondegenerate and its Clifford action is faithful.
- Multiplication gives the stated tensor algebra equivalence, with the specified ordinary commutants and left-regular module decomposition.

**Checks.**
- At rank 0, Q_P(0)=0 and the tensor algebra is ℂ⊗ℂ=ℂ, of dimension 1.
- For the sl₂ volume ω above, Q_P(2ω)=4·512=2048; a linear rather than quadratic scaling law would give 1024.
- For sl₂, A is diagonal M₂ inside M₂⊕M₂ and B is its two-dimensional centre; Comm(B) has dimension 8, whereas A has dimension 4, excluding ordinary mutual commutants.

*Needs:* §9.1 rank equality; native Clifford PBW, dimension, adjoint quadratic lift and left-regular module; LieHighestWeight native complete reducibility, Weyl dimension and irreducible quotient; native Fock action for the spin-module variant.


### 9.3 The worked instance: `gl_N` on `M_N(ℂ)` (the CAR algebra)

Consume native
`TauCeti.traceQuadraticForm`, `polarBilin_traceQuadraticForm`, `glCliffordHom`,
its `_single`, `_lie_ι` and `_normalOrdering` pins, and `carLieRingModule`,
`carLieModule`, `car_lie_def`. Consume native `TauCeti.isIsotypicOfType_glIrreducible_car`,
`nonempty_lieModuleEquiv_directSum_glIrreducible_car`, `finrank_glIrreducible_glHalfStaircase` and
`exists_isGlHighestWeightVector_glHalfStaircase_car` over algebraically closed characteristic-zero
fields, for every N including0. Compare their named-simple/decomposition and highest-vector
predicates to the concrete submodule and matrix-unit statements below on these same native actions. `𝔤 = gl_N` is **reductive, not
Killing-semisimple**, so its form is the **trace form** `Q X = tr (X²)` (nondegenerate where the
Killing form is not), and its highest weight carries a half-integral central component; the
reductive highest-weight vocabulary is
[the highest-weight roadmap](../LieHighestWeight/README.md)'s Layer 9, cited in prose only. The
generators `d_ab = ι (E_ab)` satisfy the CAR relations `d_ab d_cd + d_cd d_ab = 2 δ_bc δ_ad`
(pinned as the polar-form equation); the **normal-ordered quadratics** `F_ij = ½ Σ_k d_ik d_kj`
form a Lie homomorphism `glCliffordHom` with `[F_ij, d_kl] = δ_jk d_il - δ_li d_kj` (basis-free:
bracketing a generator is the adjoint action), and differ from the antisymmetrized quadratic
elements by the **normal-ordering constant** `(N/2) δ_ij`, the source of the half-integral central
weight. The left-regular `Cliff(M_N)` (the fermionic Fock space `⋀(M_N)` via `equivExterior`,
dimension `2^{N²}`) is isotypic with `2^{N(N+1)/2}` simple summands of dimension `2^{N(N-1)/2}`,
each containing a highest weight vector of weight `ν = (N - 1/2, …, 1/2)` for the matrix-unit
positive system. [Panyushev's Prop. 2.4 and Ex. 2.5(1)](https://arxiv.org/pdf/math/0001161#page=8)
supply reduced-spin identities and the adjoint-spin Kostant example. Compare the actual native
normal-ordered `gl_N` proof with this derivation: for N≥2 the quadratic lift restricts to `sl_N`
with isotypic highest weight `ρ`, while `glCliffordHom_normalOrdering` adds the
scalar character `(N/2) tr`, giving `ν = ρ + (N/2)(1,…,1)`.
Retain the left-regular multiplicity calculation and direct N=0,1 comparison branches; the native
decomposition already supplies their theorem-level endpoint.
This decomposition is the one used in the CAR-matrix analysis of Shlyakhtenko
(arXiv:2606.28648v1, Lemmas 1–2, pp. 5–6, and Proposition 1, p. 10); the companion decomposition
`V* ⊗ L(ν) ≅ ⨁_{t=1}^{N} L(ν - ε_t)` is the dual-standard Pieri rule of
[the highest-weight roadmap](../LieHighestWeight/README.md), uniform in `t` because every
`ν - ε_t` stays dominant.

*Needs:* Native trace quadratic form, normal-ordering identity, CAR isotypy/decomposition and highest vector; LieHighestWeight Layer 9 central-character comparisons and native dual-standard Pieri rule; §9.2 for the semisimple comparison only.

### Examples

For sl₂, d=3 and l=1 give dim L(ρ)=2 and multiplicity 4, hence 8=2³. For sl₃, d=8 and l=2 give 8·32=256 and spin multiplicity 2 on a 16-dimensional spinor. For the zero Lie algebra both multiplicities and simple dimension are 1.

### Dependencies

Native Clifford PBW, quadratic lift, Fock and highest-weight APIs; §9.1 rank equality precedes §9.2 multiplicities. No Layers 6–8.

## Worked examples (acceptance criteria)

- **`Cliff(0,1) ≅ ℂ` and `Cliff(0,2) ≅ ℍ`.** The `ℝ`-algebra isomorphisms `CliffordAlgebraComplex.equiv`
  (consumed) and `Cliff(realCliffordForm 0 2) ≃ₐ[ℝ] ℍ[ℝ]` (supplier contracts, real form and Clifford
  classification), the first two entries of the Bott
  table; and `Cliff(1,1) ≅ M₂(ℝ)`, the periodicity step.
- **`Spin₃ ≅ SL₂` and its spin representation.** For `V = ℂ³`, `spinGroup Q ≃* SL(2, ℂ)` (supplier contracts, rank-three standard
  representation), with the
  `2`-dimensional spin representation `TauCeti.spinRep Q P` the standard representation of `SL₂`
  (`finrank ℂ (ExteriorAlgebra ℂ P.W) = 2`, `finrank ℂ P.W = 1`). Over `ℝ`, `Spin(3) ≅ SU(2)`, the double cover of
  `SO(3)` with kernel `{±1}` (supplier contracts, covers and compact Spin topology), the smallest
  instance of the whole theory.
- **The `2ˡ`-dimensional spin representation of `𝔰𝔬(2l+1)`.** For type `Bₗ`, `TauCeti.spinRep Q P` is irreducible of
  dimension `2ˡ` with highest weight `ωₗ = ½(1,…,1)` (Layers 4-5), and its weights are exactly the `2ˡ`
  half-integer sign vectors `½(±1,…,±1)`. Acceptance: `finrank ℂ (ExteriorAlgebra ℂ P.W) = 2 ^ l`, and the
  highest weight is the last fundamental weight of `Bₗ`, lying in the half-integral coset and outside the
  lattice generated by the vector weights `±eᵢ` (the lattice containing every weight of every tensor power of
  the standard module), which is the precise obstruction to being a tensor-power constituent.
- **The half-spin representations of `𝔰𝔬(8)` and triality.** For `V = ℂ⁸` (type `D₄`), `S⁺` and `S⁻` are
  irreducible of dimension `8`, equal to `dim V`; triality (Layer 8, `exists_trialityAut`) is an
  order-three outer automorphism t of `Spin₈` with pullbacks `V∘t ≅ S⁺`, `S⁺∘t ≅ S⁻`, `S⁻∘t ≅ V`, and
  the trilinear form `V ⊗ S⁺ ⊗ S⁻ → ℂ` is `Spin₈`-invariant. Acceptance: `t³ = 1`, t is not inner, the
  three `8`-dimensional representations are cyclically permuted in that orientation, and t corresponds
  to the native tripled-carrier triality.
- **`⋀𝔰𝔩₂` under the two actions (the Layer 9 non-example and smallest example).** Under the
  **commutator** action, `⋀𝔰𝔩₂ ≅ 1 ⊕ V(2) ⊕ V(2) ⊕ 1` (dimensions `1 + 3 + 3 + 1 = 8 = 2³`), not
  isotypic; under **left multiplication**, `Cliff(𝔰𝔩₂, κ)` is four copies of one `2`-dimensional
  simple (`d = 3`, `l = 1`: simple dimension `2^{(3-1)/2} = 2`, multiplicity `2^{(3+1)/2} = 4`). The
  pair is the acceptance check that the two actions are truly kept apart.
- **The CAR algebra on `N × N` matrices (the Shlyakhtenko instance).** For `𝔤 = gl_N` with the trace
  form: the CAR relations from the polar-form pin (`2 δ_bc δ_ad`), the `gl_N` relations
  `[F_ij, F_kl] = δ_jk F_il - δ_li F_kj` from `glCliffordHom`, the normal-ordering constant
  `(N/2) δ_ij`, and the isotypic decomposition of the left-regular `Cliff(M_N)` into `2^{N(N+1)/2}`
  simples of dimension `2^{N(N-1)/2}` with highest weight `ν = (N - 1/2, …, 1/2)`. Acceptance
  arithmetic: `2^{N(N-1)/2} · 2^{N(N+1)/2} = 2^{N²} = dim ⋀(M_N)`, and `d ± l` bookkeeping
  `d + l = N² + N`, `d - l = N² - N = 2 · #Δ⁺`. The `V* ⊗ L(ν)` decomposition and the Casimir
  separation of its blocks are the matching worked examples of
  [the highest-weight roadmap](../LieHighestWeight/README.md).

## Downstream consumers

ClassicalGroups §3.5 uses the B/D spin fundamentals alongside tensor constructions.
SpinGeometry G1.1 and G4.1 use the algebraic spin modules, the native negative-form group
comparison and Layer 7's even-algebra/topological comparisons for Clifford bundles and spin lifts.
NoncompactQuantumSymmetry §M0 consumes the real maximal-compact and Lie adapters at signature
(4,1). RelativisticQuantumFieldTheory RQFT2 consumes the full real Clifford cover for its
Lorentz applications. These consumers supply no prerequisites to the algebraic Fock core.

## References

- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991), Lecture 20 - the
  primary reference: the Clifford algebra, the Pin and Spin groups and the double cover, the spin
  representations `S`, `S⁺`, `S⁻` from a maximal isotropic subspace, their highest weights as the `Bₗ`/`Dₗ`
  fundamentals, the low-dimensional isomorphisms, and triality (Lecture 20, §20.3 and the exercises);
  Lecture 19, §§19.2 and 19.4, for the fundamental representations of the even and odd orthogonal
  Lie algebras.
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255 (2009),
  Chapter 6 - the spin representations of `𝔰𝔬(n)` uniformly, the Clifford-algebra construction of the spin
  module, the highest-weight theory, and the fundamental representations of `Bₗ` and `Dₗ`.
- H. B. Lawson, M.-L. Michelsohn, *Spin Geometry*, Princeton (1989), Chapter I - the definitive account of
  Clifford algebras `Cliff(p, q)`, their Bott-periodic classification (the eightfold table), the Pin and Spin
  groups as double covers, and the real and complex spinor representations. By section: §I.2 for Pin and
  Spin, §I.3 for the algebras themselves, §I.4 for the classification (Theorem 4.1 for the three periodicity
  isomorphisms (4.1)-(4.3), of which (4.3) is the native `TauCeti.realCliffordBottEquiv`, Theorem 4.3 for eight-periodicity, Tables I and
  II for the tables), §I.5 for the representations, and §I.10 for the `(1,1)`-periodicity theorem. Their
  `Cl(r,s)` is this roadmap's `Cliff(s, r)`: §I.4 (4.0) records `Cl(1,0) = ℂ` and `Cl(0,1) = ℝ ⊕ ℝ`, the
  opposite index order.
- C. Chevalley, *The Algebraic Theory of Spinors*, Columbia (1954) - the algebraic construction of the spin
  representation from a maximal isotropic subspace, the even/odd decomposition into half-spinors, and the
  intrinsic (basis-free) development of the Clifford algebra used in Layer 4.
- É. Cartan, *The Theory of Spinors*, Hermann (1966) - the original discovery of spinors, the geometry of
  isotropic subspaces, and triality for `Spin₈`.
- J. F. Adams, *Lectures on Exceptional Lie Groups*, Chicago (1996) - triality, the octonions, and the
  trilinear form `V ⊗ S⁺ ⊗ S⁻ → ℂ` on `Spin₈` (the octonion multiplication as the triality form).
- B. Kostant, *Clifford algebra analogue of the Hopf-Koszul-Samelson theorem, the ρ-decomposition
  C(𝔤) = End V_ρ ⊗ C(P), and the 𝔤-module structure of ⋀𝔤*, Adv. Math. 125 (1997), 275-350 - the
  source for Layer 9's isotypy corollary and the full ρ-decomposition it is a corollary of.
- D. Panyushev, *The exterior algebra and "spin" of an orthogonal 𝔤-module*, Transform. Groups 6
  (2001), 371-396 - the extension to orthogonal `𝔤`-modules;
  [Prop. 2.4 and Ex. 2.5(1)](https://arxiv.org/pdf/math/0001161#page=8) give reduced-spin identities
  and the adjoint-spin Kostant example. Layer9 owns their trace-form `M_N` specialization,
  the left-regular multiplicity argument and the normal-ordering central shift for `gl_N`.
- E. Meinrenken, *Clifford Algebras and Lie Theory*, Springer Ergebnisse 58 (2013), Chapters 5-10 -
  the modern textbook account of the quadratic realization and the Kostant theory.
- D. Shlyakhtenko, *Failure of Strong Convergence of Matrices with Fermionic Entries*,
  arXiv:2606.28648v1, Lemmas 1–2, pp. 5–6, and Proposition 1, p. 10 - the CAR-matrix analysis whose
  `gl_N` representation theory is the motivating application of the Layer 9 worked instance.

- J. Gallier, *Clifford Algebras, Clifford Groups, and a Generalization of the Quaternions*,
  arXiv:0805.0311v3, Definition 1.3, p. 14, Theorem 1.4, p. 18 — universal property and
  monomial basis used in the derived automorphism criteria; Definition 1.6, p. 31, and
  Proposition 1.21, p. 39 — the norm-±1 real cover; Theorem 1.24, p. 43, and Propositions
  1.25–1.26, p. 44 — the polar structure of O(p,q) and SO(p,q).
- A. Kirillov, Jr., *Introduction to Lie Groups and Lie Algebras*, author notes,
  Theorem 3.41, p. 40 — integration from a connected simply connected Lie group.
- B. Conrad, *Reductive Group Schemes*, Theorem 6.1.17, p. 197 — pinned isomorphism theorem.
- Y. Bazlov, *The Harish-Chandra isomorphism for Clifford algebras*, arXiv:0812.2059v2,
  §§3.2–3.5, pp. 9–11, Theorem 3.1 — primitive invariants, their Clifford form and
  Kostant's tensor decomposition; the cited Kostant statements are Theorems B, 35 and 40.
- J. C. Baez, *The Octonions*, arXiv:math/0105155v4, §2.4, pp. 15–17 — compact
  spinor multiplication, invariant triality and its octonion interpretation.
