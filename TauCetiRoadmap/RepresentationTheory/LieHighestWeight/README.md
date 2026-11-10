# Roadmap: representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas

**Summary.** Develop normalized polynomial tensor comparisons, the invariant-form
symmetry sign and PBW symmetrization, split Serre presentations, exceptional algebra
models, reductive center comparisons and affine Weyl geometry. The inputs are native
highest-weight modules, PBW, complete reducibility, the Weyl formulas, the minuscule and
dual-standard Pieri rules, Chevalley restriction and the Harish-Chandra isomorphisms;
the new comparisons retain the actual generators, products, actions and
integral lattices. The split characteristic-zero and compact real forms are separate.

## Scope and ownership

This roadmap owns the comparisons and extensions in Layers 0–10 below. The
following are already in Mathlib or Tau Ceti and are consumed through the exact
contracts below, so a consumer cites the declaration, not a layer of this roadmap:
the rank-one integer spectrum, classification and weight strings
(`TauCeti.exists_int_of_hasEigenvalue`, `TauCeti.finrank_eq_of_hasPrimitiveVectorWith`,
`TauCeti.Sl2Std.isInternal_cgSummand`); Cartan subalgebras and the root-space
decomposition (Mathlib `LieSubalgebra.IsCartanSubalgebra`,
`LieAlgebra.IsKilling.rootSystem`); the weights of a module and their
integrality (`TauCeti.integralWeightLattice`, `TauCeti.exists_int_apply_coroot`);
the PBW basis and filtration (`Module.Basis.pbwBasis`,
`TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`); Verma modules and their
irreducible quotients (`TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`);
the dominant-integral classification
(`TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`);
complete reducibility and the Casimir (`TauCeti.exists_isCompl_of_isKilling`,
`TauCeti.casimirElement`); the Weyl character, dimension and Kostant formulas
and Freudenthal's formula (`TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`,
`TauCeti.finrank_eq_prod_coweightPairing_div`,
`TauCeti.formalCharacter_coeff_eq_kostantMultiplicity`,
`TauCeti.freudenthal_multiplicity_formula`); the general-linear
highest-weight carrier (`TauCeti.glIrreducible`); the minuscule and dual-standard Pieri rules
(`TauCeti.minuscule_pieri`, `TauCeti.gl_dual_standard_pieri`); the Lie invariants, Weyl
invariants and Killing-orthogonal restriction with Chevalley's restriction theorem
(`TauCeti.SymmetricAlgebra.lieInvariants`, `TauCeti.linearInvariants`,
`TauCeti.lieCartanRestriction`, `LieSubalgebra.lieChevalleyRestrictionIso`); and the
Harish-Chandra isomorphisms with the central-character orbit theorem
(`TauCeti.harishChandraIso`, `TauCeti.harishChandraLinearIso`,
`TauCeti.vermaCentralCharacter_eq_iff`). The native split octonion and Albert carriers,
their dimensions and the dimension of split-octonion derivations are inputs, not
new construction targets. The exceptional-model identifications remain targets.
The native orbit sums, finite integral lower sets, character triangularity and dominant-weight
density, inner-automorphism action, Cartan density/conjugacy, trace-power polynomials,
degreewise center-symbol isomorphisms and split Albert determinant/Jordan identities
are also inputs, with exact declarations below. Layer 7 adds global normalized
symmetrization and multiplicative assembly of the degreewise center symbols.
So are the PBW Rees algebra with its fibres at one and zero
(`TauCeti.UniversalEnvelopingAlgebra.reesAlgebra`, `reesOneFiberEquiv`, `reesZeroFiberEquiv`);
the Cayley–Dickson double and the real division octonions (`TauCeti.CayleyDickson`,
`TauCeti.DivisionOctonionReal`); the affine and extended affine Weyl groups with the fundamental
alcove and the coweight lattice (`RootPairing.affineWeylGroup`,
`RootPairing.extendedAffineWeylGroup`, `RootPairing.fundamentalAlcove`,
`RootPairing.coweightLattice`); differentiation of rational representations of `GL_n(ℂ)`, the
differentiated Weyl modules and the Littlewood–Richardson tableaux
(`TauCeti.nonempty_lieModuleEquiv_rationalWeylRep_glIrreducible`, `TauCeti.LRTableau`); and
complete reducibility for reductive Lie algebras with semisimple central action
(`TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`). Each layer states only
what these do not.

| Former layer numbering | Present owner and replacement |
| --- | --- |
| Layer 1: Cartan subalgebras and roots | Mathlib `LieSubalgebra.IsCartanSubalgebra`, `LieAlgebra.exists_isCartanSubalgebra`, `LieAlgebra.IsKilling.rootSystem`, `LieAlgebra.IsKilling.finrank_rootSpace_eq_one`; finite root geometry remains RootSystems Layers 1–6. |
| Layer 2: weights and integrality | Mathlib `LieModule.genWeightSpace`, `LieModule.iSup_genWeightSpace_eq_top`; Tau Ceti `TauCeti.isSemisimple_toEnd_cartan`, `TauCeti.integralWeightLattice`, `TauCeti.exists_int_apply_coroot`. |
| Layer 4: classification of finite-dimensional irreducibles | Tau Ceti `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`, `TauCeti.VermaModule` and `TauCeti.irreducibleQuotient`; complete reducibility is supplied separately by `TauCeti.exists_isCompl_of_isKilling`. |

These former layer identifiers refer to the supplier contracts, not to new
construction targets. AdoIwasawa consumes native ordered PBW directly; this
roadmap's additional exports are the central-monic finiteness adapter, the normalized
symmetrization and the first-order bracket on the native Rees zero fibre.

[RootSystems, Layers 1–6](../RootSystems/README.md) owns finite root geometry,
chambers, Weyl groups and finite-type classification. This roadmap owns the
representation-theoretic comparison of opposition and integral weight lattices with
those root systems. [ClassicalGroups, Layers 2–4](../ClassicalGroups/README.md)
owns Schur modules, the group classification, group characters and branching;
its Layer 3 uses Lie highest-weight theory. [SchurWeyl, Layer 7](../SchurWeyl/README.md)
owns Schur polynomials, Jacobi–Trudi and RSK. Differentiation of rational representations
and the Littlewood–Richardson tableaux are native; the multiplicity statement for the
`gl_n` Lie modules belongs here.
[ReflectionInvariantTheory, §2](../../ReflectionInvariantTheory/README.md#2-complex-branch-shephardtodd-in-both-directions)
owns separation of distinct finite linear-group orbits by invariant polynomials.
Layer 7 specializes this theorem to the Cartan dual and transports it to the dot action.

[CharacteristicClasses, C5](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings)
owns compact infinitesimal invariance, geometric Cartan transport and real descent.
[TangentialBordism §9.1 (B3.6)](../../TangentialBordism/README.md#91-idempotent-cayley-plane-b36)
and [§9.2 (B3.7)](../../TangentialBordism/README.md#92-compact-automorphisms-and-spin-isotropy-b37)
own the compact Albert idempotent geometry and automorphism transitivity.
[LieGroupoidsPoisson, G4.6A](../../LieGroupoidsPoisson/README.md) owns the
positive smooth Lie–Poisson bracket on the dual of a finite-dimensional real
Lie algebra, including its smooth Poisson packaging; G4.6B owns the
coadjoint-leaf theorem. Layer 3 supplies the polynomial evaluation and
derivative identity directly from the PBW zero fibre.
[PseudodifferentialOperators, §3.1](../../PseudodifferentialOperators/README.md)
owns smooth periodic Fourier expansions and rapid decay in derivative seminorms.
[TensorProductCombinatorics, §§1.5–1.6 and 2.6](../../TensorProductCombinatorics/README.md)
owns lattice cone series, their Fourier boundary values, directional endpoint
reconstruction and the type-A root-coordinate specialization. Its §1.6
comparison for every rational expression equal to a Laurent polynomial
already covers the normalized Weyl identity. Layer 6.2 supplies that finite
identity and identifies the finite torus Fourier coefficients with weight
multiplicities. The generic constructions have no character-theoretic premise;
the finite identities here have no distributional premise.

The compact-group applications of this theory are not targets of this roadmap: self-duality
and the Frobenius–Schur type of representations of a compact connected group on its actual
character lattice, the Haar-measure proof of the type-A character identity with its
virtual-character, tensor and branching applications, the regular extension of continuous
representations of U(n) to rational representations of `GL_n(ℂ)`, and the centre `P∨/Y` of a
compact semisimple group with its period-lattice comparison. Each of them needs LieGroups
Layers 4, 6 or 7 (Lie integration, maximal tori and Weyl integration, complexification), and
LieGroups Layer 7 consumes the split Serre presentation of §7.1, so they follow LieGroups in
the order of supply and belong to LieHighestWeight, Part II. This roadmap stops at the
algebraic statements they use: opposition and the invariant-form sign (Layer 5), the finite
character identities (§6.2) and the affine lattice quotients (Layer 10).

## Conventions

- **The base field.** Work over a field `K` that is **algebraically closed and of characteristic
  zero** for the representation theory proper (so the characteristic polynomials of `H`-actions split
  and all weights take values in `K`), matching Mathlib's `[Field K] [CharZero K] [IsAlgClosed K]`.
  Algebraic closure and finite-dimensionality give only the **generalized** weight-space decomposition
  (`iSup_genWeightSpace_eq_top`, once `IsTriangularizable K H M` is in place); that the generalized
  weight spaces are honest simultaneous eigenspaces is a **separate theorem** (the native diagonalizability theorem), coming from the
  semisimplicity of the `H`-action, not from algebraic closure alone. State each result at the
  generality it actually needs: the `sl₂` weight-string arguments need only
  `CharZero` and finite-dimensionality; the generalized decomposition needs `IsTriangularizable`; the
  diagonalizability and the classification need algebraic closure. **Do not** bundle "algebraically
  closed, characteristic zero, semisimple, split" into one mega-class; spell the hypotheses each theorem
  uses.
  The named split-field Serre sublane in Layer 7 and the split models in Layer 8 instead
  use an arbitrary `[Field K] [CharZero K]`, a finite-dimensional Killing-semisimple `L`,
  a Cartan subalgebra `H` and `[IsTriangularizable K H L]`; the Serre presentation does not
  assume `L` simple. The native HC/Chevalley isomorphisms carry their own separately stated
  algebraic-closure hypotheses.
- **The Lie algebra, and what "semisimple" means here.** `L` is a finite-dimensional Lie algebra over
  `K` (`[LieRing L] [LieAlgebra K L] [Module.Finite K L]`). The default semisimplicity hypothesis is
  **`LieAlgebra.IsKilling K L`** (non-degenerate Killing form), which over a characteristic-zero field
  is equivalent to `LieAlgebra.IsSemisimple K L` and, crucially, is the hypothesis under which Mathlib
  already produces `LieAlgebra.IsKilling.rootSystem`. Over an algebraically closed `K` every Cartan
  subalgebra is **split** (all root and weight values land in `K`); this splitness is itself a **named
  milestone** (feeding Mathlib's `IsTriangularizable K H L`), consumed thereafter rather than treated as
  ambient, so we do not carry a separate "split" hypothesis. Where the general theory over a non-closed
  field needs a split semisimple Lie algebra, that is a named generalization stated as such, not the
  default. The abelian, nilpotent, and solvable notions are Mathlib's (`LieAlgebra.IsNilpotent`,
  `LieAlgebra.IsSolvable`, `HasTrivialRadical`).
- **Cartan subalgebras, roots, and weights are Mathlib's.** Fix a Cartan subalgebra `H` via
  `[H.IsCartanSubalgebra]` (`LieSubalgebra.IsCartanSubalgebra`); it exists by
  `LieAlgebra.exists_isCartanSubalgebra`. A **root** is a nonzero `LieModule.Weight K H L` (element of
  the `Finset` `LieSubalgebra.root H`); a **weight of a module** `M` is a `LieModule.Weight K H M`; the
  **root space** and **weight space** are `LieAlgebra.rootSpace H α = LieModule.genWeightSpace L α` and
  `LieModule.genWeightSpace M χ`. The **root system** is `LieAlgebra.IsKilling.rootSystem H`, a
  `RootPairing H.root K (Module.Dual K H) H`; its **coroots** are `LieAlgebra.IsKilling.coroot`, and
  `finrank_rootSpace_eq_one` says root spaces are lines. Never introduce a private `Root`, `Weight`, or
  `Coroot` synonym.
- **Positive systems and dominance, via a base.** Fix a base
  `base : (LieAlgebra.IsKilling.rootSystem H).Base` (`RootPairing.Base`, which exists by
  `RootPairing.nonempty_base`); its `IsPos` predicate and `base.support` of **simple roots** are the
  positive system and simple system. We reserve the name `base` for the root-system base and never reuse
  it for the Borel subalgebra it determines. Integrality is an **arithmetic** condition, not a linear
  one: a weight `λ : Module.Dual K H` is **integral** when `λ (α^∨) ∈ ℤ` (the image of `ℤ` in `K`) for
  every root `α`, and **dominant integral** when `λ (αᵢ^∨) ∈ ℕ` for every simple root `αᵢ`. The
  **integral weight lattice** `X` is therefore a `ℤ`-submodule of `Module.Dual K H`, **not** a
  `K`-subspace. Use the native integral-weight lattice and integer coroot pairings.
  Its comparison with a based root datum retains the actual root-system carrier;
  the character lattice of a non-simply-connected group need not be the full weight lattice.
- **Modules are `LieModule`s; the categorical `FDRep` is a mirror.** Develop the theory on the
  Mathlib-native module core: `M` with `[LieRingModule L M] [LieModule K L M]`, irreducibility as
  `LieModule.IsIrreducible K L M` (`= IsSimpleOrder (LieSubmodule K L M)`), and the enveloping algebra
  `UniversalEnvelopingAlgebra K L` with its universal property `UniversalEnvelopingAlgebra.lift`.
  Finite-dimensional representations of `L` are the same data as finite-dimensional
  `UniversalEnvelopingAlgebra K L`-modules; keep that dictionary explicit where the associative-algebra
  presentation (PBW, Verma modules as cyclic `U(L)`-modules) is the natural home. Use Mathlib's
  vocabulary throughout: `LieSubmodule`, `LieModuleHom`, `LieModuleEquiv` (`M ≃ₗ⁅K,L⁆ N`),
  `Module.finrank`, `Module.Dual`.
- **Highest weight is defined against the base, not against a total order.** A **highest weight
  vector** of weight `λ` in `M` is a nonzero `v` with `⁅x, v⁆ = λ x • v` for `x ∈ H` and `⁅e, v⁆ = 0`
  for every `e` in a positive root space. `L(λ)` is the unique irreducible module generated by such a
  vector. The `sl₂` case is this definition with the single positive root, and
  `IsSl2Triple.HasPrimitiveVectorWith` is exactly a highest weight vector for that `sl₂`; keep the
  general definition and the `sl₂` structure literally the same notion so the reductions typecheck.
- **Characters live in the group algebra of the weight lattice.** The **formal character** of a
  finite-dimensional module is the multiplicity function `μ ↦ dim Mμ` (honest weight multiplicities,
  legitimate once the native diagonalizability theorem is in place), an element of the integral
  group algebra `ℤ[X]` of the weight lattice (a `Module.Dual K H →₀ ℤ` supported on integral weights).
  The Weyl group `(rootSystem H).weylGroup` acts on it. The Weyl character formula is an identity in
  this group algebra, stated with the **integral denominator** `∏_{α>0}(1 - e^{-α})` (all exponents in
  `X`) rather than the symmetric `∏(e^{α/2} - e^{-α/2})` (whose half-weights `α/2` need not lie in `X`);
  the dimension formula is its specialization at the trivial character, taken in `ℚ`, and Kostant's
  formula is its expansion against the Kostant partition function. Keep the three as one development,
  not three.
- **Reductive Lie algebras and the `gl_n` conventions (Layer 9).** Layer 9 drops the blanket
  `IsKilling`: reductivity is Mathlib's `LieAlgebra.HasCentralRadical` (`radical = center`), carried as
  an unbundled hypothesis, and semisimplicity is imposed on the derived ideal
  `LieAlgebra.derivedSeries K L 1`, never on `L`; `IsAlgClosed` appears per-theorem exactly where a
  Schur-type argument needs it. The concrete `gl_n` is `Matrix (Fin n) (Fin n) K` with its
  `LieRing.ofAssociativeRing` bracket (Mathlib names no separate carrier), its Cartan is the diagonal
  diagonalCartan, and its positive system is the matrix-unit order (`Matrix.single i j 1` raising for
  `i < j`), since `LieAlgebra.IsKilling.rootSystem` is unavailable for it. On `gl_n` the **Killing form
  is degenerate**, so the pinned invariant form is the **trace form of the standard representation**
  (`⟨X, Y⟩ = tr (X * Y)`, `LieModule.traceForm`); the trace-form Casimir scalar
  `Σᵢ μᵢ (μᵢ + n - 1 - 2i)` is meaningless without that convention, so it is stated only for this
  form. Dominance for `gl_n` is a condition on **differences** (`μᵢ - μᵢ₊₁ ∈ ℕ`) with the entries
  free in `K`: the non-integral central direction that the group-level `DominantWeight n` of
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) (weakly decreasing **integer** tuples)
  does not see. The dictionary to the abstract semisimple theory is the restriction to
  `LieAlgebra.SpecialLinear.sl (Fin n) K`, pinned by the Layer 9 transfer targets, not left as prose.

## Exact supplier contracts

### From Mathlib

`MulAction.orbit`, `MulAction.mem_orbit_iff` and `MulAction.orbit_smul`
in `Mathlib/GroupTheory/GroupAction/Defs.lean` supply the orbit as the range
of the action, its membership equation and invariance under changing the
representative. `MulAction.card_orbit_mul_card_stabilizer_eq_card_group`
in `Mathlib/GroupTheory/GroupAction/Quotient.lean` supplies the finite
orbit-stabilizer count. Layer 6 carries these laws to the finite-set realization.

Use the following native carriers and their stated hypotheses. In particular,
generalized weight spaces alone do not assert diagonalizability, and a
nondegenerate Killing form is not a hypothesis on the reductive matrix algebra.

- **`sl₂` triples and the primitive-vector argument:** `Mathlib/Algebra/Lie/Sl2.lean`,
  `IsSl2Triple h e f` (with `lie_e_f`, `lie_h_e_nsmul`, `lie_h_f_nsmul`), `IsSl2Triple.toLieSubalgebra`,
  `IsSl2Triple.HasPrimitiveVectorWith t m μ` (fields `ne_zero`, `lie_h`, `lie_e`), the ladder lemmas
  `lie_f_pow_toEnd_f`, `lie_h_pow_toEnd_f`, `lie_e_pow_succ_toEnd_f`, and the integrality theorem
  `IsSl2Triple.HasPrimitiveVectorWith.exists_nat` (the highest weight of a primitive vector in a
  finite-dimensional module is a natural number), plus `exists_hasPrimitiveVectorWith`.
- **The `sl₂` Lie algebra concretely:** `Mathlib/Algebra/Lie/Classical.lean`,
  `LieAlgebra.SpecialLinear.sl n R` (trace-zero matrices), `SpecialLinear.single`,
  `SpecialLinear.singleSubSingle`, and `sl_non_abelian`; `sl (Fin 2) K` is our worked `sl₂`.
- **Cartan subalgebras:** `Mathlib/Algebra/Lie/CartanSubalgebra.lean`
  (`LieSubalgebra.IsCartanSubalgebra`, self-normalizing and nilpotent) and
  `Mathlib/Algebra/Lie/CartanExists.lean` (`LieAlgebra.exists_isCartanSubalgebra`,
  `exists_isCartanSubalgebra_engel`).
- **Weights and the weight-space decomposition:** `Mathlib/Algebra/Lie/Weights/Basic.lean`,
  `LieModule.genWeightSpace M χ`, `genWeightSpaceOf`, `LieModule.Weight R L M` (a bundled nonzero
  weight, `FunLike` to `L → R`), `LieModule.IsTriangularizable`, `iSupIndep_genWeightSpace`,
  `iSup_genWeightSpace_eq_top` (the decomposition when triangularizable); `Weights/Linear.lean`
  (`LinearWeights`, `Weight.toLinear`, so a weight is a genuine linear functional in characteristic
  zero); `Weights/Cartan.lean` (`LieAlgebra.rootSpace`, `rootSpaceWeightSpaceProduct` so root spaces
  move weight spaces by `⁅rootSpace H α, Mχ⁆ ⊆ M(α+χ)`); `Weights/Chain.lean`
  (`genWeightSpaceChain`, the root-string bounds).
- **The root system of a semisimple Lie algebra:** `Mathlib/Algebra/Lie/Weights/Killing.lean` and
  `Weights/RootSystem.lean`, `LieAlgebra.IsKilling` (non-degenerate Killing form),
  `IsKilling.instSemisimple`, `finrank_rootSpace_eq_one` (root spaces are one-dimensional),
  `IsKilling.coroot`, `cartanEquivDual`, `exists_isSl2Triple_of_weight_isNonZero` (the `sl₂` triple of
  a root), `sl2SubmoduleOfRoot`, and `LieAlgebra.IsKilling.rootSystem H : RootPairing H.root K
  (Module.Dual K H) H` with its instances `IsRootSystem`, `IsCrystallographic`, `IsReduced`, and
  `rootSystem_pairing_apply`, `rootSystem_coroot_apply`.
- **Abstract root systems, bases, Weyl groups:** `Mathlib/LinearAlgebra/RootSystem/*`,
  `RootPairing`, `RootSystem`, `RootPairing.Base` with `RootPairing.nonempty_base` and `Base.IsPos`,
  `Base.height`, `RootPairing.Base.cartanMatrix`, and `RootPairing.weylGroup`,
  `RootPairing.Equiv.reflection`. The corresponding Lie integral lattice is
  `TauCeti.integralWeightLattice`; the based-lattice comparisons retain these actual carriers.
- **The universal enveloping algebra:** `Mathlib/Algebra/Lie/UniversalEnveloping.lean`,
  `UniversalEnvelopingAlgebra K L`, `UniversalEnvelopingAlgebra.ι` (the Lie map `L →ₗ⁅K⁆ U(L)`),
  `UniversalEnvelopingAlgebra.lift` (the universal property, an equiv `(L →ₗ⁅K⁆ A) ≃ (U(L) →ₐ[K] A)`),
  `ι_comp_lift`, `lift_unique`, `hom_ext`.
- **Semisimplicity and irreducibility infrastructure:** `Mathlib/Algebra/Lie/Semisimple/Defs.lean`
  (`LieModule.IsIrreducible R L M := IsSimpleOrder (LieSubmodule R L M)`, `HasTrivialRadical`,
  `LieAlgebra.IsSemisimple`, `LieAlgebra.IsSimple`), `Semisimple/Basic.lean` (under `[LieAlgebra.IsSimple R L]`, the adjoint module `L` is
  irreducible; semisimple algebras are not generally irreducible as modules over themselves), `Weights/IsSimple.lean` (the ideal/root-set dictionary).
- **Trace and invariant forms:** `Mathlib/Algebra/Lie/TraceForm.lean`, `InvariantForm.lean`,
  `Killing.lean` (`killingForm`, `traceForm`, `traceForm_cartan_nondegenerate`), the raw material for
  the Casimir element.
- **The Serre presentation and the exceptional algebras, as defined objects:**
  `Mathlib/Algebra/Lie/SerreConstruction.lean`, `Matrix.ToLieAlgebra R CM` (the quotient of
  `FreeLieAlgebra R (CartanMatrix.Generators B)` by the Serre relations `CartanMatrix.Relations.toIdeal`,
  built from `CartanMatrix.Relations.HH/EF/HE/HF/adE/adF`, carrying `LieRing` and `LieAlgebra R`
  instances), and the named split algebras `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂`; the standard
  integer Cartan matrices `CartanMatrix.E₆`, `E₇`, `E₈`, `F₄`, `G₂`, `A n`, `B n`, `C n`, `D n`
  (`Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean`), and `RootPairing.Base.cartanMatrix` of the
  [../RootSystems/README.md](../RootSystems/README.md) roadmap. Mathlib defines these algebras as
  quotients but establishes none of their structural theorems (finite-dimensionality, dimensions,
  Killing-semisimplicity and type, concrete models, representations); those are built here.
- **The symmetric algebra and the center of an algebra:** `Mathlib/LinearAlgebra/SymmetricAlgebra/`
  (`SymmetricAlgebra R M`, `SymmetricAlgebra.equivMvPolynomial`, `Basis.symmetricAlgebra`), the target
  of the Harish-Chandra isomorphism; `Subalgebra.center R A` (`Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`),
  so `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)`; and the Weyl group
  `(rootSystem H).weylGroup` that acts on `S(H)` by the dot action.
- **Non-associative algebras, derivations, and exterior powers (for the exceptional models):**
  `Mathlib/Algebra/Jordan/Basic.lean` (`IsJordan`, `IsCommJordan`, the Jordan-identity classes);
  `Mathlib/Algebra/Lie/Derivation/Basic.lean` (`LieDerivation`, and `LieDerivation.instLieAlgebra`,
  the derivations of a Lie algebra as a Lie algebra) and `Mathlib/RingTheory/Derivation/Basic.lean`
  (`Derivation R A M`, for the commutative case); `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`
  (`exteriorPower`, `⋀[R]^n M`, `exteriorPower.map`, `exteriorPower.ιMulti`) for the magic-square
  summands; and `LieAlgebra.SpecialLinear.sl n R` (`Algebra/Lie/Classical.lean`). Mathlib has **no
  octonion / Cayley algebra** and **no exceptional Jordan (Albert) algebra**.
- **Reductive vocabulary and matrix Lie algebras (for Layer 9):** `LieAlgebra.center`,
  `LieAlgebra.radical`, `LieAlgebra.derivedSeries`, and `LieAlgebra.HasCentralRadical`
  (`Mathlib/Algebra/Lie/Semisimple/Defs.lean`, `radical = center`, the characteristic-zero
  reductivity criterion - the predicate exists, its structure theory does not); the matrix Lie
  algebra `Matrix n n K` via `LieRing.ofAssociativeRing` with `lieEquivMatrix'`, the trace-zero
  subalgebra `LieAlgebra.SpecialLinear.sl`, the standard-module instance
  `LieRingModule (Matrix n n R) (n → R)` (`Mathlib/Algebra/Lie/Matrix.lean`), matrix units
  `Matrix.single`, and the trace form `LieModule.traceForm`.
- **Module constructions and the ring-level isotypic machinery (for the Layer 6 toolkit):** tensor
  products of Lie modules (`Mathlib/Algebra/Lie/TensorProduct.lean`), Hom and dual Lie modules
  (`Module.Dual.instLieRingModule`, `Mathlib/Algebra/Lie/Basic.lean`), direct sums
  (`Mathlib/Algebra/Lie/DirectSum.lean`). The Lie-level isotypic theory is native Tau Ceti
  (below), built on the ring-level `IsIsotypicOfType` and `isotypicComponent` of
  `Mathlib/RingTheory/SimpleModule/Isotypic.lean`.

The torus coefficient definition is Mathlib `mFourierCoeff`, in
`Mathlib/Analysis/Fourier/AddCircleMulti.lean`: it integrates f against the
negative-frequency character. `UnitAddTorus.mFourierBasis` supplies the L²
basis, and `UnitAddTorus.hasSum_mFourier_series_of_summable` supplies the
continuous-function Fourier expansion under summability. For §6.2 use
`UnitAddTorus.orthonormal_mFourier` and the definition of `mFourierCoeff`
to extract the coefficients of the finite character sum; no convergence
estimate is needed for that finite sum.

### From Tau Ceti

- `RootPairing.weightOrbitSum`, in
  `TauCeti/LinearAlgebra/RootSystem/Weyl/WeightOrbitSum.lean`, is the integral
  sum over distinct weights in a finite Weyl orbit. `RootPairing.dominantWeightsBelow`,
  in `TauCeti/LinearAlgebra/RootSystem/DominantCone.lean`, is the finite set of
  dominant integral μ with λ−μ in the nonnegative integral simple-root cone.
  Its root-system hypotheses include finite root indices, crystallographicity,
  and a characteristic-zero domain; the orbit sum requires a finite Weyl group.
  `TauCeti.formalCharacter_irreducibleQuotient_eq_orbitSum_add_lower`, in
  `TauCeti/Algebra/Lie/HighestWeight/OrbitSum.lean`, gives the leading coefficient
  1 and lower coefficients equal to actual weight multiplicities under the standing
  algebraically closed characteristic-zero, finite-dimensional Killing, split-Cartan,
  chosen-base and finite-dimensional irreducible-quotient hypotheses.
  `TauCeti.polynomial_eq_zero_of_dominantIntegral`, in
  `TauCeti/Algebra/Lie/HighestWeight/Weight/Density.lean`, gives polynomial
  density in S(H) for a split Cartan in a finite-dimensional Killing algebra over
  any characteristic-zero field, without algebraic closure.
- `TauCeti.intLieAlgebra`, `TauCeti.intLieAlgebraLieEquiv` and its generator,
  product and inverse equations, in
  `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean`, supply the
  subgroup generated by nilpotent adjoint exponentials and its Lie action.
  These contracts use a characteristic-zero field and the compatible rational Lie
  structure. `TauCeti.SymmetricAlgebra.map_apply_of_mem_intLieAlgebra`, in
  `AdjointAction/SymmetricInvariants.lean`, fixes Lie invariants under that action.
  `TauCeti.killingDuality`, in `Algebra/Lie/Killing/Duality.lean`, and
  `TauCeti.killingSymmetricEquiv` with
  `TauCeti.killingSymmetricEquiv_lieModuleDerivation`, in
  `Algebra/Lie/Killing/SymmetricAlgebra.lean`, supply the duality and equivariance
  for finite-dimensional Killing algebras over a field. Their symmetric map sends
  x to κ(x,−), with the coadjoint inverse-transpose action on the dual.
- `LieSubalgebra.exists_rootExponentialPolynomialParametrization` and
  `LieSubalgebra.polynomial_eq_zero_of_intCartan`, in
  `TauCeti/Algebra/Lie/AdjointAction/RootExponential.lean`, supply polynomial
  density of the inner conjugates of a split Cartan for finite-dimensional Killing
  algebras over characteristic-zero fields, with the compatible rational Lie structure.
  `LieSubalgebra.exists_map_intLieAlgebraLieEquiv_eq`, in
  `AdjointAction/CartanConjugacy.lean`, supplies conjugacy of Cartans with algebraic
  closure additionally assumed. The polynomial inputs are native
  `TauCeti.jacobiMatrixAt`, in `RingTheory/MvPolynomial/Jacobian.lean`,
  `TauCeti.algebraicIndependent_of_mulVec_surjective_jacobiMatrixAt`,
  `TauCeti.eq_zero_of_forall_eval_eq_zero_of_mulVec_surjective_jacobiMatrixAt` and
  `AlgebraicIndependent.exists_ne_zero_setOf_eval_ne_zero_subset_range`, in
  `RingTheory/MvPolynomial/Dominant.lean`: respectively algebraic independence over
  a commutative ring, vanishing over an infinite domain, and a nonempty principal
  open in the image over an algebraically closed field, with finite coordinate sets.
- `TauCeti.tracePowerPolynomial`, `TauCeti.lift_eval_tracePowerPolynomial`,
  `TauCeti.tracePowerPolynomial_mem_homogeneousSubmodule` and
  `TauCeti.tracePowerPolynomial_mem_lieInvariants`, in
  `TauCeti/Algebra/Lie/TracePowerPolynomial.lean`, supply the trace-power polynomial
  of a finite free Lie module over a commutative ring, its evaluation, degree and
  invariance. `TauCeti.tracePowerRestriction`,
  `TauCeti.map_dualMap_tracePowerPolynomial` and
  `TauCeti.lieCartanRestriction_killingSymmetricEquiv_symm_tracePowerPolynomial`, in
  `Algebra/Lie/HighestWeight/TracePower.lean`, supply its weight-power-sum restriction
  under the standing algebraically closed characteristic-zero Killing/Cartan hypotheses
  and finite-dimensional module hypothesis, including degree zero.
- `TauCeti.UniversalEnvelopingAlgebra.centerPBWGradedInvariantIso` and
  `TauCeti.UniversalEnvelopingAlgebra.centerPBWGradedInvariantIso_symbol`, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Center.lean`, identify the actual
  degree-n center quotient with homogeneous Lie invariants by the PBW symbol.
  Their scope is a Lie algebra free over a commutative ring with n! invertible,
  without Killing, algebraic closure or finite-dimensionality assumptions.
  Layer 7 specializes to characteristic-zero fields for all degrees together.
  `TauCeti.hcProjection_sub_lieCartanRestriction_mem_wordFiltrationPrevious`, in
  `Algebra/Lie/HighestWeight/CentralCharacter/LeadingTerm.lean`, gives the lower-degree
  discrepancy for a central homogeneous symmetrization, with a finite-dimensional
  Killing algebra and split Cartan over a characteristic-zero field (`K : Type`).
  `SymmetricAlgebra.translation_sub_self_mem_wordFiltrationPrevious`, in
  `LinearAlgebra/SymmetricAlgebra/Translation.lean`, gives the translation discrepancy
  over every commutative ring; `TauCeti.dotInvariantsEquivLinearInvariants` supplies
  the translated invariant algebra comparison in `CentralCharacter/Linear.lean`.
- `TauCeti.SplitK0`, `TauCeti.SplitK0.of` and `TauCeti.SplitK0.lift`, in
  `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`, supply the split
  Grothendieck group and its universal additive invariant for an essentially small
  preadditive category with binary biproducts. `TauCeti.SplitK0.instCommRing`,
  `TauCeti.SplitK0.of_mul_of` and `TauCeti.SplitK0.liftRingHom`, in
  `CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean`, supply its tensor ring
  for an essentially small braided monoidal preadditive category with binary
  biproducts and tensor product additive in each variable, and the universal multiplicative,
  unit-preserving additive invariant. Layer 6 supplies the Lie-module specialization,
  not another group-completion or monoidal K₀ construction.
  `TauCeti.ExactK0.fromSplitEquiv`, in
  `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`, supplies the comparison
  with a specified exact structure when every conflation splits; Layer 6
  supplies that splitting hypothesis by complete reducibility.

- `TauCeti.isIrreducible_restrict_derivedSeries` and
  `TauCeti.sup_center_derivedSeries_eq_top`, in `TauCeti/Algebra/Lie/Reductive.lean`,
  supply restriction to the semisimple part and the spanning statement for reductive L.
  `TauCeti.exists_centralWeight_of_isIrreducible`, in
  `TauCeti/Algebra/Lie/Weights/Central.lean`, gives scalar central action over an
  algebraically closed field on a finite-dimensional irreducible module.
- `TauCeti.isGlHighestWeightVector_glIrreducibleGenerator`,
  `TauCeti.nonempty_lieModuleEquiv_glIrreducible`, `TauCeti.finrank_glIrreducible_le`
  and `TauCeti.isIrreducible_glIrreducible_restrict_sl`, in
  `TauCeti/Algebra/Lie/GeneralLinear/Carrier.lean`, supply the normalized carrier,
  uniqueness, minimum cyclic dimension and restriction. These are not new targets.
  `TauCeti.gl_dual_standard_pieri`, in `TauCeti/Algebra/Lie/GeneralLinear/Pieri.lean`,
  supplies the dual-standard Pieri rule `V* ⊗ L(μ) ≅ ⨁_t L(μ - ε_t)` over an algebraically
  closed characteristic-zero field; Layer 9 applies it and does not restate it.

- `TauCeti.integralWeightLattice`, `TauCeti.mem_integralWeightLattice_iff` and
  `TauCeti.root_mem_integralWeightLattice`, in
  `TauCeti/Algebra/Lie/Weights/WeightLattice.lean`, supply the actual integral
  weights as a ℤ-submodule and the inclusion of the roots; they do not identify
  an arbitrary compact group's character lattice with the full weight lattice.

- `TauCeti.exists_int_of_hasEigenvalue`, in `TauCeti/Algebra/Lie/Sl2/Spectrum.lean`,
  gives integer eigenvalues for a finite-dimensional module over a characteristic-zero
  field, without irreducibility or algebraic closure.
- `TauCeti.finrank_eq_of_hasPrimitiveVectorWith`, in
  `TauCeti/Algebra/Lie/Sl2/WeightString.lean`, gives dimension n+1 under irreducibility
  over the triple's own subalgebra. `TauCeti.isSemisimple_toEnd_cartan` and
  `TauCeti.exists_int_apply_coroot` supply the Cartan weight theory.
- `Module.Basis.pbwBasis` and its ordered-product equation, together with
  `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, its associated-graded comparison,
  and its injectivity, finite-spanning and Noetherian theorems, are consumed over
  their native coefficient rings. In particular the ordered PBW input to
  Ado–Iwasawa has no characteristic-zero restriction.
- `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`, their generators and
  universal properties, and
  `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`
  supply the highest-weight classification. `TauCeti.IsMinuscule` and
  `TauCeti.tensorMultiplicity` are the carriers of the native minuscule Pieri rule
  `TauCeti.minuscule_pieri`, in `TauCeti/Algebra/Lie/HighestWeight/Pieri.lean`, with its
  companions `TauCeti.tensorMultiplicity_eq_one_iff_of_isMinuscule` and
  `TauCeti.tensorMultiplicity_eq_zero_iff_of_isMinuscule`; Layer 6 consumes the rule.
- `TauCeti.invForm` and `TauCeti.invForm_coroot`, in
  `TauCeti/Algebra/Lie/Weights/InvariantForm.lean`, and `TauCeti.casimirElement`
  and `TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top`, in
  `TauCeti/Algebra/Lie/HighestWeight/Casimir.lean`, supply the Killing normalization.
  `TauCeti.exists_isCompl_of_isKilling`, in
  `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`, supplies invariant
  complements over every characteristic-zero field; it has no algebraic-closure binder.
- `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`,
  `TauCeti.finrank_eq_prod_coweightPairing_div` and
  `TauCeti.formalCharacter_coeff_eq_kostantMultiplicity` supply the three Weyl/Kostant
  formulas in `HighestWeight/Weyl/Character.lean`, `Weyl/Dimension.lean` and
  `KostantMultiplicity.lean`. Freudenthal's formula is supplied by
  `TauCeti.freudenthal_multiplicity_formula` in `HighestWeight/Freudenthal.lean`.
- `TauCeti.hcProjection`, `TauCeti.vermaCentralCharacter`, `TauCeti.dotInvariants`
  and `TauCeti.hcProjection_mem_dotInvariants` supply the raw projection and its
  inclusion in dot invariants, in `HighestWeight/CentralCharacter/HarishChandra.lean`
  and `DotOrbit.lean`. `TauCeti.hcProjectionLinear`, `TauCeti.linearInvariants`,
  `TauCeti.mem_linearInvariants_iff`, `TauCeti.isHomogeneous_linearInvariants`,
  `TauCeti.dotInvariantsEquivLinearInvariants`, `TauCeti.lift_hcProjectionLinear` and
  `TauCeti.lift_add_weylVector_hcProjectionLinear`, in `CentralCharacter/Linear.lean`,
  supply the `−ρ`-translated projection, the ordinary Weyl invariants and the
  central-character equations. `TauCeti.hcProjection_mem_wordFiltration_iff`,
  `TauCeti.hcProjectionLinear_mem_wordFiltration_iff` and `TauCeti.hcProjection_injective`,
  in `CentralCharacter/Injective.lean`, and `TauCeti.range_hcProjection` and
  `TauCeti.range_hcProjectionLinear`, in `CentralCharacter/Surjective.lean`, supply both
  filtration directions, injectivity and the ranges.
  `TauCeti.harishChandraIso`, `TauCeti.harishChandraLinearIso`,
  `TauCeti.coe_harishChandraIso_apply`, `TauCeti.harishChandraIso_symm_mem_pbwFiltration`,
  `TauCeti.harishChandraLinearIso_symm_mem_pbwFiltration` and
  `TauCeti.vermaCentralCharacter_eq_iff`, in `CentralCharacter/Isomorphism.lean`, supply the
  Harish-Chandra isomorphisms `Z(U(L)) ≃ₐ[K] S(H)^{W·}` and `Z(U(L)) ≃ₐ[K] S(H)^W`, the
  identification of the forward map with the projection, the inverse filtration against
  `TauCeti.Algebra.wordFiltration (SymmetricAlgebra.ι K H) n` and the central-character orbit
  theorem `χ_λ = χ_μ ↔ ∃ w, w·λ = μ`. The pin states that file for `K : Type`; nothing of it
  is a target here.
- `TauCeti.SymmetricAlgebra.lieInvariants`,
  `TauCeti.SymmetricAlgebra.mem_lieInvariants_iff_mem_maxTrivSubmodule` and
  `TauCeti.SymmetricAlgebra.decompose_mem_lieInvariants_iff`, in
  `TauCeti/LinearAlgebra/SymmetricAlgebra/LieModule.lean`, supply the Lie invariants
  `S(M)^L` over any commutative ring, as the maximal trivial submodule and degreewise.
  `TauCeti.killingCartanProjection`, `TauCeti.lieCartanRestriction`,
  `TauCeti.lieCartanRestriction_ι_cartan`, `TauCeti.lieCartanRestriction_ι_root`,
  `TauCeti.lieCartanRestriction_surjective`,
  `TauCeti.lieCartanRestriction_mem_homogeneousSubmodule` and
  `TauCeti.map_dualMap_killingSymmetricEquiv`, in
  `TauCeti/Algebra/Lie/Killing/CartanRestriction.lean`, supply the Killing-orthogonal
  projection, its symmetric-algebra map `S(L) →ₐ[K] S(H)`, its values on Cartan and root
  generators, surjectivity, degree preservation and the restriction square, over any field.
  `LieSubalgebra.lieCartanRestriction_injOn_lieInvariants`, in
  `TauCeti/Algebra/Lie/Killing/ChevalleyRestriction.lean`, and
  `LieSubalgebra.lieChevalleyRestrictionIso`,
  `LieSubalgebra.coe_lieChevalleyRestrictionIso_apply` and
  `LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`, in
  `TauCeti/Algebra/Lie/HighestWeight/ChevalleyRestriction.lean`, supply Chevalley's
  restriction theorem `S(L)^L ≃ₐ[K] S(H)^W` over an algebraically closed characteristic-zero
  field, with the restriction as forward map and degrees preserved in both directions.
- `TauCeti.opposition`, `TauCeti.root_opposition`, `TauCeti.coroot'_opposition`,
  `TauCeti.opposition_involutive` and `TauCeti.oppositionPerm`, in
  `TauCeti/LinearAlgebra/RootSystem/Opposition.lean`, supply the actual root involution
  and base permutation. They do not identify a compact group's integral character lattice.
- `TauCeti.Octonion K`, its norm and trace, and
  `TauCeti.Octonion.finrank_derivationLieAlgebra`, in
  `TauCeti/Algebra/Octonion/Basic.lean` and `Derivation.lean`, supply the split
  octonions and the dimension 14 of their derivations. The native nonassociative
  derivation carrier is `TauCeti.derivationLieAlgebra`.
- `TauCeti.AlbertAlgebra K`, `TauCeti.AlbertAlgebra.finrank_eq_twentySeven` and
  `TauCeti.AlbertAlgebra.finrank_traceZero`, in
  `TauCeti/Algebra/AlbertAlgebra/Basic.lean`, supply the split product and dimensions
  27 and 26. `TauCeti.AlbertAlgebra.det`, `TauCeti.AlbertAlgebra.spur`,
  `TauCeti.AlbertAlgebra.mul_mul_self` and `TauCeti.AlbertAlgebra.six_mul_det`, in
  `TauCeti/Algebra/AlbertAlgebra/Determinant.lean`, supply the cyclic determinant,
  quadratic coefficient and cubic/undivided trace identities over a commutative
  ring with 2 invertible; the determinant itself needs only a commutative ring.
  `TauCeti.AlbertAlgebra.det_eq_invOf_two_mul_invOf_three_mul` additionally
  assumes 3 invertible. `TauCeti/Algebra/AlbertAlgebra/Jordan.lean` supplies
  `IsCommJordan` with 2 invertible. The split exceptional-type identification and
  compact real comparison remain targets.
- `TauCeti.glIrreducible`, in `TauCeti/Algebra/Lie/GeneralLinear/Carrier.lean`,
  supplies the highest-weight carrier with its native module instances.
  `TauCeti.glCasimir` and
  `TauCeti.glCasimir_smul_of_isGlHighestWeightVector_of_lieSpan_eq_top`, in
  `TauCeti/Algebra/Lie/GeneralLinear/Casimir.lean`, supply the trace-form Casimir
  and its scalar on every cyclic highest-weight module.
- `TauCeti.UniversalEnvelopingAlgebra.prodEquivTensor` and
  `TauCeti.UniversalEnvelopingAlgebra.symmetricAlgebraEquiv`, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Prod.lean` and `Abelian.lean`, supply
  the maps composing `productEnveloping`; the center comparison is
  `exists_productCenterEquiv`.
- `LieModule.isotypicMultiplicity` (the finrank of `S →ₗ⁅R,L⁆ M`, in
  `TauCeti/Algebra/Lie/Multiplicity.lean`), `LieModule.isotypicComponent` (the
  supremum of the Lie submodules equivalent to S, in `TauCeti/Algebra/Lie/Isotypic.lean`),
  `TauCeti.UniversalEnvelopingAlgebra.lieSubmoduleOrderIsoAsModule` (the order
  isomorphism between Lie submodules and `U(L)`-submodules for the canonical
  module structure, over any commutative ring, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Module.lean`), and
  `LieModule.nonempty_lieModuleEquiv_isotypicComponent` and
  `LieModule.finrank_isotypicComponent` (in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Multiplicity.lean`) supply the Lie
  isotypic theory. The last two assume a field K with `[IsAlgClosed K]`, a
  finite-dimensional M with a `U(L)`-module structure in a scalar tower, and a
  finite-dimensional irreducible S; they give `isotypicComponent ≃ S^(⊕m)` and
  `dim = m · dim S` without complete reducibility of M. Uniqueness of the count
  over finite irreducible decompositions is
  `LieModule.isotypicMultiplicity_eq_ncard_of_isInternal`. Under the standing Killing, Cartan,
  base and algebraically closed characteristic-zero hypotheses,
  `TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient` and
  `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul`, in
  `TauCeti/Algebra/Lie/HighestWeight/Decomposition.lean`, supply
  `M ≅ ⊕_λ L(λ)^(⊕ m_λ)` over dominant integral λ and `ch M = Σ_λ m_λ ch L(λ)`.

- `TauCeti.UniversalEnvelopingAlgebra.reesAlgebra`, `reesParameter`, `reesGenerator`,
  `reesGenerator_mul_sub_mul`, `eval_reesGenerator` and
  `adjoin_reesParameter_union_range_reesGenerator`, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/Rees/Basic.lean`, supply the PBW Rees subalgebra of
  `U_R(L)[t]`, its central parameter, the generators `j(x)=ι(x)t`, their commutator relation,
  evaluation at a scalar and generation, for a Lie algebra over a commutative ring.
  `reesOneFiberEquiv` and `quotientReesParameterSubOneEquiv`, in `Rees/OneFiber.lean`, supply
  the fibre at one; `TauCeti.coeffSubalgebra.baseChangeEvalEquiv`, in
  `TauCeti/RingTheory/GradedAlgebra/CoeffSubalgebra/UnitFiber.lean`, is the same statement at
  every unit of R. `reesSpecializationZero`, `reesSpecializationZero_reesGenerator`,
  `reesSpecializationZero_surjective`, `reesSpecializationZero_eq_zero_iff`,
  `ker_reesSpecializationZero` and `reesZeroFiberEquiv`, in `Rees/ZeroFiber.lean`, supply the
  zero fibre for `L` free over R. The pin has no bracket on the zero fibre, no presentation by
  generators and relations and no Laurent comparison; those are Layer 3 targets.
- `TauCeti.CayleyDickson`, with its product, `NonAssocRing`, `Star` and `StarRing` structures,
  module structure and `TauCeti.CayleyDickson.finrank_eq`, in
  `TauCeti/Algebra/CayleyDickson/Basic.lean`, supplies the ordered-pair double of a
  nonassociative ring with involution. `TauCeti.CayleyDickson.normSq`, `trace`,
  `self_add_star`, `self_mul_star`, `mul_self`, `left_alternative`, `right_alternative`,
  `flexible`, `normSq_eq_zero`, the inverse with `mul_inv_cancel₀` and its companions,
  `TauCeti.DivisionOctonionReal`, `TauCeti.DivisionOctonionReal.finrank_eq_eight` and
  `TauCeti.DivisionOctonionReal.exists_mul_mul_ne`, in
  `TauCeti/Algebra/CayleyDickson/Quaternion.lean`, supply the double of the quaternions: norm
  and trace over a commutative ring, positivity and inverses over a linearly ordered field,
  and the real division octonions. The pin has no Moufang identity on this carrier (it has
  them on the split `TauCeti.Octonion`, `TauCeti.Octonion.moufang_left`), no normed structure,
  no imaginary part or cross product and no statement about its derivations; those are Layer 8
  targets.
- `RootPairing.coweightLattice`, `RootPairing.toDualRootSpan`,
  `RootPairing.toDualRootSpan_injective` and `RootPairing.finite_quotient_corootSpan_map`, in
  `TauCeti/LinearAlgebra/RootSystem/CoweightLattice.lean`; `RootPairing.fundamentalAlcove`,
  `RootPairing.closedFundamentalAlcove`, `RootPairing.Base.affineSimpleRoot` and
  `RootPairing.fundamentalAlcove_nonempty`, in `RootSystem/Alcove.lean`;
  `RootPairing.affineCoreflection`, `RootPairing.affineWeylGroup` and
  `RootPairing.mem_affineWeylGroup_iff`, in `RootSystem/Weyl/Affine/Basic.lean`;
  `RootPairing.exists_mem_affineWeylGroup_apply_mem_closedFundamentalAlcove`,
  `RootPairing.iUnion_image_closedFundamentalAlcove_eq_univ`,
  `RootPairing.eq_one_of_mem_affineWeylGroup_of_apply_mem_fundamentalAlcove`,
  `RootPairing.eq_one_of_mem_affineWeylGroup_of_mapsTo` and
  `RootPairing.existsUnique_mem_affineWeylGroup_preimage_fundamentalAlcove_eq`, in
  `Weyl/Affine/Alcove.lean`; `RootPairing.extendedAffineWeylGroup` and
  `RootPairing.extendedAffineWeylGroupQuotientEquiv`, in `Weyl/ExtendedAffine/Basic.lean`;
  `RootPairing.fundamentalAlcoveStabilizer`, `RootPairing.fundamentalAlcoveStabilizerToQuotient`,
  `RootPairing.fundamentalAlcoveStabilizerToQuotient_surjective`,
  `RootPairing.ker_fundamentalAlcoveStabilizerToQuotient` and
  `RootPairing.affineWeylGroup_sup_fundamentalAlcoveStabilizer`, in
  `Weyl/ExtendedAffine/Alcove.lean`; and
  `RootPairing.fundamentalAlcoveStabilizerToPerm_mem_matrixSymmetryGroup`, in
  `Weyl/ExtendedAffine/Wall.lean`, supply the affine engine of Layer 10. Their hypotheses are
  a root pairing over a commutative ring, specialised as each statement needs to a linearly
  ordered field, with a finite nonempty root index set, crystallographic, reduced and
  irreducible, and a base; covering and transitivity assume the field Archimedean, freeness
  does not. The closed alcove is defined by the weak inequalities and is not stated to be a
  topological closure. The pin does not prove that `Ω → P∨/Q∨` is injective, that a closed-alcove
  representative is unique, or anything about point stabilizers, quotient topology,
  intermediate lattices or diagram automorphisms; those are Layer 10 targets.
- `TauCeti.IsRationalRep.differential`, `differential_tprod`,
  `mem_invtSubmodule_iff_forall_mem_invtSubmodule_differential`, `isIrreducible_differential`,
  `isIntertwiningMap_iff_forall_map_differential` and `tprodLieModuleEquiv`, in
  `TauCeti/RepresentationTheory/ClassicalGroups/Differential.lean`, supply the differential of
  a rational representation of `GL_n(ℂ)` as a `gl_n(ℂ)`-module, its tensor rule and the
  equivalence of stable subspaces, irreducibility and intertwiners with their differentiated
  counterparts. `isGlHighestWeightVector_differential` and
  `nonempty_lieModuleEquiv_glIrreducible`, in `ClassicalGroups/Weight/Differential.lean`, pass
  from group to Lie highest-weight vectors.
  `TauCeti.nonempty_lieModuleEquiv_rationalWeylRep_glIrreducible` and
  `TauCeti.nonempty_lieModuleEquiv_tprod_rationalWeylRep_glIrreducible`, in
  `ClassicalGroups/WeylModule/Differential.lean`, identify the differentiated rational Weyl
  module of a dominant integer weight, and tensor products of two, with the native
  `glIrreducible` carriers. `TauCeti.nonempty_equiv_tprod_rationalWeylRep`, in
  `ClassicalGroups/WeylModule/LittlewoodRichardson.lean`, decomposes a tensor product of
  rational Weyl modules over Yamanouchi tableaux. `TauCeti.LRTableau`, in
  `TauCeti/Combinatorics/Young/LittlewoodRichardson/Basic.lean`, with
  `TauCeti.lrTableauEquivYamanouchi` (`Yamanouchi.lean`) and
  `TauCeti.diagramSchurPoly_mul_diagramSchurPoly_eq_sum_natCard_lrTableau`
  (`TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/LittlewoodRichardson.lean`), supply the
  finite tableau carrier and the product rule `s_λ s_μ = Σ_ν Nat.card (LRTableau λ ν μ) s_ν`.
  The pin does not state the multiplicity of `glIrreducible n ν` in a tensor product of two
  such modules; that is the Layer 9 target.
- `TauCeti.exists_isCompl_of_forall_center_lie_eq_smul` and
  `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`, in
  `TauCeti/Algebra/Lie/Reductive/CompleteReducibility.lean`, supply complete reducibility for a
  finite-dimensional module of a finite-dimensional reductive Lie algebra over a
  characteristic-zero field when the centre acts by scalars, respectively triangularizably
  with semisimple operators. `TauCeti.isCompl_center_derivedSeries` and
  `TauCeti.lieModuleEquivOfCenterOfDerivedSeries`, in `Reductive/Basic.lean`, supply the
  splitting and the equivalence criterion. For `gl_n`,
  `TauCeti.complementedLattice_lieSubmodule_gl_of_forall_one_lie_eq_smul`
  (`GeneralLinear/CompleteReducibility.lean`),
  `TauCeti.isIsotypic_of_forall_isGlHighestWeightVector` and
  `TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_of_forall_isGlHighestWeightVector`
  (`GeneralLinear/Isotypic.lean`) supply the single-weight criterion, and
  `TauCeti.isotypicMultiplicity_glIrreducible_car` with
  `TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_car`
  (`GeneralLinear/CAR/Decomposition.lean`) the CAR decomposition.
- `TauCeti.coeff_formalCharacter_eq_freudenthalRHS_div`, in
  `TauCeti/Algebra/Lie/HighestWeight/Freudenthal.lean`, is Freudenthal's recursion solved for
  the multiplicity at `μ ≠ λ`. `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization` and
  `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_mem_center_iff`, in
  `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Symmetrization.lean`, supply degreewise
  symmetrization and its centre criterion for `L` free over a commutative ring with `n!`
  invertible.

### From other roadmaps

Use RootSystems Layers 1–6 for the finite root data, ClassicalGroups Layers 2–4
for rational group representations and SchurWeyl Layer 7 for finite Schur polynomials.
ReductiveGroups Layers 2 and 5P supply the tangent and
characteristic-zero closed-subgroup smoothness cut used by Layer 9.

### From ReflectionInvariantTheory

Consume [ReflectionInvariantTheory §2](../../ReflectionInvariantTheory/README.md#2-complex-branch-shephardtodd-in-both-directions)
for a finite faithful linear group acting on a finite-dimensional vector space V
over an algebraically closed characteristic-zero field K: two points have equal
evaluations on every invariant in Sym(V*) if and only if they lie in the same
group orbit. Apply this to V=H* and the actual Weyl action; finite-dimensional
double duality identifies Sym(V*) with Sym(H). Layer 7 owns this identification
and the translation by ρ, not the interpolation-and-averaging construction.

## How to read the build

Layer 0 fixes normalized rank-one comparisons and Layer 3 adds the presentation and
first-order bracket of the native PBW Rees algebra. The native highest-weight inputs are
listed in the supplier contracts; Layer 5 develops opposition and the symmetry of invariant forms. Layer 6 builds tensor and
character comparisons on the native minuscule Pieri rule; Layer 7 consumes the native
Chevalley restriction and filtered Harish-Chandra isomorphisms and proves the split Serre
presentation. Layer 8 gives the exceptional models, Layer 9 the reductive comparisons,
and Layer 10 the closed-alcove and lattice comparisons on the native affine Weyl groups. Each proof route names its inputs;
other proofs can establish the same mathematical targets. `Suggested.lean` states
only the headline theorems on available carriers, and its docstring identifies
headlines whose carriers are unavailable at the pins.

## Layer 0: normalized rank-one tensor comparisons

### 0.1 concrete polynomial tensor strings and their Hermitian orthogonality

The polynomial action and ladder are those of Etingof, *Lie Groups and Lie
Algebras I & II*, §11.4, Theorem 11.16, pp. 65–67; the abstract tensor
multiplicities are Theorem 11.18, p. 68. The normalized tensor dictionary,
Hermitian form, orthogonality and factorial norms below are derived adapters:
they use that explicit ladder and the native permutation-sum symmetrization,
with the product Hermitian form on tensor powers. The averaging calculation
in item 3 fixes its scale, and the adjoint recurrence in item 4 fixes every
lowered norm. Construct the concrete rank-one tensor comparison here. It consumes
native symmetric powers and their standard `GL₂(ℂ)`/`SU(2)` actions, the native
single-module ladder, and finite-dimensional tensor linear algebra. It does not
consume Layer 6's character formula, general compact Haar theory, either existence or
orthogonality of an abstract Clebsch–Gordan decomposition, or the later reductive `gl_n`
classification. The resulting
concrete decomposition is a comparison with the native abstract Clebsch–Gordan theorem.
The monomial normalization is stated by `exists_polynomialSymmetric`;
the coefficient formulas and Checks below specify the rest of the tensor comparison.

1. **Polynomial, symmetric-tensor and action dictionaries.** Let
   `P_d = MvPolynomial.homogeneousSubmodule (Fin 2) ℂ d`, and put
   `e_i^d = x^(d-i)y^i` for `0≤i≤d`, zero outside this range. Construct its monomial
   basis and a linear equivalence to the existing `Sym[ℂ]^d (Fin 2 → ℂ)` that sends
   `e_i^d` to the pure symmetric tensor with `d-i` copies of the first standard vector
   and `i` copies of the second. Supply both inverse formulas, coordinates, zero-degree
   unit, addition/scalars, multiplication between degrees, and the tensor-product
   comparison with the bihomogeneous polynomials in two pairs of variables. Prove
   naturality for the actual native `TauCeti.symPowerRep ℂ 2 d` and its restriction
   `TauCeti.SU2.symPower d`. Here `x,y` denote standard *vectors*: a matrix
   `[[a,b],[c,d]]` substitutes `x↦a x+c y`, `y↦b x+d y`.
   These are not the contragredient polynomial functions of ReductiveGroups10C;
   provide the dual/action dictionary when comparing with that model rather than
   identifying their Borel and sign conventions silently. On diagonal matrices the
   weight of `e_i^d` is `(d-i,i)`.

   **Checks.**

   - For d=0 the dictionary sends the constant polynomial 1 to the unit of the
     zeroth symmetric power; the zero map fails this.
   - For d=2 the monomial xy maps to the pure symmetric tensor of one first and one
     second standard vector with coefficient 1, whose averaged symmetrization is
     `(x⊗y+y⊗x)/2`, of squared norm 1/2 in the product Hermitian form.
   - The rescaled map `2·e` satisfies every linear-map law but sends xy to twice
     that tensor, whose averaged symmetrization `x⊗y+y⊗x` has squared norm 2;
     `exists_polynomialSymmetric` excludes it at i=1.

   *Needs:* Mathlib homogeneous polynomials; native `SymmetricPower` and
   `SymmetricPower.tprod`; native `TauCeti.symPowerRep` for naturality.

2. **Actual operators and vectors.** Define on these polynomials
   `E=x∂_y`, `F=y∂_x`, `H=EF-FE`, prove preservation of degree and all linear-map
   laws, and identify them with differentiation of the actual upper/lower unipotent
   and diagonal actions. Prove the group exponential formulas (finite sums for E,F),
   their tensor Leibniz laws and `H=[E,F]`, `[H,E]=2E`, `[H,F]=-2F`.
   In particular `E e_i=i e_(i-1)`, `F e_i=(d-i)e_(i+1)` and
   `H e_i=(d-2i)e_i`, with zero endpoints. On `P_m⊗P_n` use the actual
   `E_tot=E⊗1+1⊗E`, `F_tot=F⊗1+1⊗F`, and `H_tot`. For d=2: `E(xy)=x²`,
   `F(xy)=y²`, `H(xy)=0` and `H(x²)=2x²`; replacing E by `y∂_x` would give
   `E(x²)=2xy`, raising the wrong end of the string.
   For every `0≤r≤min(m,n)` define the nonzero vector

   `v_r=(x₁y₂-y₁x₂)^r x₁^(m-r)x₂^(n-r)
       =Σ_(j=0)^r (-1)^j binom(r,j) e_j^m⊗e_(r-j)^n`.

   Prove equality of these two actual constructions under the bihomogeneous
   comparison, annihilation by E, invariance under the upper unipotent subgroup,
   GL₂ highest weight `(m+n-r,r)`, and SL₂ highest weight `N_r=m+n-2r`.
   Prove that the simultaneous E-kernel and fixed weight line is spanned by this
   vector; the completed string basis in item4 then proves that the whole
   E-kernel is the direct sum of these lines.
   Construct every `F_tot^k v_r`, its finite binomial/Leibniz coefficient formula,
   weight `(m+n-r-k,r+k)`, and the ladder identities
   `E_tot F_tot^k v_r=k(N_r-k+1)F_tot^(k-1)v_r`,
   `F_tot^(N_r+1)v_r=0`, with nonvanishing for `0≤k≤N_r`.
   Exponents and bounds must be stated before using natural-number subtraction.

3. **The invariant Hermitian form and normalization.** Use the form conjugate-linear
   in the first variable with `⟨e_i^d,e_j^d⟩=δ_ij/binom(d,i)` and tensor-product
   form on `P_m⊗P_n`. Construct its sesquilinearity, conjugate symmetry, strict
   positivity, and compatible norm/inner-product structure retaining the existing
   additive and complex scalar parents; give the pure-tensor product and coordinate
   formulas. Prove invariance under the actual `U(2)` action and hence SU₂ restriction,
   with `E†=F` and `H†=H`. Build this using the explicit averaged symmetrization
   `(1/d!)·SymmetricPower.toTensorPower` into the tensor power with its product
   Hermitian form. The native `toTensorPower` sums **all permutations**, including
   repeated words. Its value on `e_i` is `i!(d-i)!` times the sum `u_i` of the
   `binom(d,i)` distinct words; the averaged image is `u_i/binom(d,i)`.
   Prove injectivity, naturality, isometry and each counting identity, including d=0.
   Thus `‖u_i‖²=binom(d,i)` and `‖e_i‖²=1/binom(d,i)`.
   The orthonormal polynomial basis is `sqrt(binom(d,i)) e_i`, whereas
   `u_i/sqrt(binom(d,i))` is the same orthonormal tensor basis. Neither formula
   licenses silently replacing one dictionary with the other.

   **Checks.**

   - For d=0, the unit monomial has squared norm 1/choose(0,0)=1.
   - For d=2, xy has squared norm 1/choose(2,1)=1/2, and its averaged tensor is
     (x⊗y+y⊗x)/2; the unweighted coefficient form would give 1.
   - For d=2, x² and xy have inner product 0, since their coefficient supports differ.

4. **Orthogonality before decomposition.** Prove directly from the adjoint identities
   that `⟨F_tot^k v_r,F_tot^l v_s⟩=0` whenever r≠s (all k,l), and that different
   H-weights are orthogonal. For equal weights and r<s, `k-l=s-r>0`; move the
   lowering operators across the form to a positive power of E on `v_s`, which is
   zero. Compute

   `‖v_r‖²=Σ_j binom(r,j)^2/[binom(m,j)binom(n,r-j)]
     =r!(m-r)!(n-r)!(m+n-r+1)!/[m!n!(m+n-2r+1)!]`,

   `‖F_tot^k v_r‖²=k! N_r!/(N_r-k)! · ‖v_r‖²` for `0≤k≤N_r`.
   Prove the finite-sum/factorial identity and all denominator positivity claims.
   This gives explicit normalized strings. Prove their linear independence and
   spanning by the dimension identity `Σ_r(N_r+1)=(m+1)(n+1)`; construct the actual
   basis, inverse coordinate/projection maps and mutually orthogonal invariant
   summands. Construct the GL₂ intertwiners
   `det^r⊗Sym^(N_r)(ℂ²) → Sym^m(ℂ²)⊗Sym^n(ℂ²)` sending the highest monomial
   to `v_r`; on its i-th monomial use `(N_r-i)!/N_r! · F_tot^i v_r`.
   Check intertwining on the actual torus and both unipotent subgroups by the
   polynomial formulas; use elementary matrix generation of GL₂, rather than
   infer group equivariance from an unspecified differentiation comparison.
   Supply injectivity, image, the direct-sum intertwining equivalence and its inverse,
   SU₂ restriction and the comparison with the native rank-one decomposition
   `TauCeti.Sl2Std.isInternal_cgSummand`.
   On each common SU₂ weight of two strings prove the corresponding orthogonality;
   one uniform choice is `ε=(m+n) mod 2`, reached at `k=(N_r-ε)/2`.
   Lowering preserves the invariant **summands**, and moves between weight spaces.

5. **Symmetric-square calculation and all boundaries.** For n≥2 set
   `A=y²⊗x^n`, `B=xy⊗x^(n-1)y`, `C=x²⊗x^(n-2)y²`.
   With `w₁=v_0`, `w₂=-v_1`, `w₃=v_2`, prove

   `F²w₁=2A+4nB+n(n-1)C`,
   `Fw₂=A+(n-2)B-(n-1)C`, `w₃=A-2B+C`.

   The A,B,C Gram matrix is diagonal with entries `1,1/(2n),2/[n(n-1)]`.
   Prove the three cross-inner-products are zero by these actual vectors and this
   form, and give their positive norms and unit normalizations. The three highest
   weights are `(n+2,0),(n+1,1),(n,2)`; retain the determinant twists in the GL₂/U₂
   decomposition. For n=0 there is only r=0; for n=1 only r=0,1. Treat m=0,
   n=0, r=0, the trivial representation, empty lowering ranges and every zero
   endpoint explicitly, without assigning meaning to a negative symmetric power.

### Examples

V(2) has weights 2,0,−2 and dimension 3; the d=2 monomial xy has norm squared 1/2.

### Dependencies

*Needs:* native rank-one modules and symmetric powers; Mathlib homogeneous polynomials and tensor products.

## Layer 3: enveloping algebra, Verma modules, and `L(λ)`

### 3.1 PBW, its Rees algebra and the linear Poisson bracket

- **Concrete PBW normalization and its extensions.** Consume
  `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `pbwFiltrationPrevious`,
  `PBWGradedPiece`, the ring-filtration/exhaustiveness API, ι_injective,
  `pbwAssociatedGradedEquiv` and the domain theorem. Consume `Module.Basis.pbwBasis`, `pbwBasis_eq_prod_pow`,
  `pbwBasis_zero` and `pbwBasis_single`: the vector at a multi-exponent is exactly
  the increasing product of `ι(bᵢ)^{mᵢ}`. Derive the graded-basis value equation
  from `pbwAssociatedGradedEquiv` and `pbwHomogeneousComponentMap` on these same
  ordered monomials. Consume map_pbwFiltration_le for native induced maps;
  expose its subalgebra, quotient and direct-sum ordered-span specializations.
  Consume native `PBW.Noetherian.Basic` and `.Opposite` for left/right
  Noetherianity of finite-dimensional L, including the explicit opposite-ring instance. These interfaces are over an arbitrary field, including F₂, for
  [Ado–Iwasawa](../AdoIwasawa/README.md); only triangular decomposition uses
  the root-space/semisimple characteristic-zero setting. Consume the native
  triangular multiplication equivalence on the actual nilradicals below.

  Consume native `span_range_bounded_orderedPowerProducts_eq_top` and
  `moduleFinite_of_isIntegral_of_span_eq_top` from `PBW.Finite`. The
  central-subalgebra adapter `module_finite_of_central_monic_relations` packages
  a subalgebra R≤Z(U(L)) through the commutative scalar view
  S:=R.comap(center.val), a subalgebra of the center, supplies the S→R algebra/tower
  comparisons, reindexes a finite basis by Fin n, and converts its explicit
  monic relations to `IsIntegral` before applying those native theorems. It
  preserves the original R-module structure and the bounded ordered products;
  it does not rebuild native finite-spanning or module-finiteness machinery.
- **PBW Rees deformation and its first-order Poisson bracket.** Let `R` be a commutative
  ring and `L` a Lie `R`-algebra. No semisimplicity or characteristic-zero hypothesis
  is imposed. Write `F_n` for the native increasing PBW filtration, with
  `F_(-1)=0`. The noncommutative Rees algebra is native (From Tau Ceti) and is consumed, not
  rebuilt: `TauCeti.UniversalEnvelopingAlgebra.reesAlgebra R L` is the subalgebra
  `{Σ a_n t^n | a_n∈F_n}` of the central-variable polynomial ring `U_R(L)[t]`, with the central
  element `ħ=t` (`reesParameter`), its `R[t]`-algebra structure, the `R`-linear generators
  `j(x)=ι(x)t` (`reesGenerator`), the relation `j(x)j(y)-j(y)j(x)=ħ j([x,y])`
  (`reesGenerator_mul_sub_mul`) and generation by ħ and the `j(x)`
  (`adjoin_reesParameter_union_range_reesGenerator`). The degree-`n` part is `F_n t^n`, not the
  associated-graded quotient. The fibre at `t=1` is `U_R(L)` (`reesOneFiberEquiv`, with
  `j(x)↦ι(x)`), and the same native base change at a unit `a∈Rˣ`
  (`TauCeti.coeffSubalgebra.baseChangeEvalEquiv`, with `eval_reesGenerator`) gives `U_R(L)` by
  `j(x)↦a ι(x)`; a nonzero nonunit in a general ring is not covered. For `L` free over `R`, the
  zero specialization `reesSpecializationZero` is an algebra map onto `Sym_R(L)` sending `j(x)`
  to the symmetric generator `x`, its kernel is the ideal generated by ħ
  (`ker_reesSpecializationZero`), a Rees polynomial lies in it exactly when its degree-`n`
  coefficient is in `F_(n-1)` for every n, and `reesZeroFiberEquiv` is the resulting
  identification of the zero fibre with `Sym_R(L)`, with no choice of basis. Ordinary ambient
  evaluation `U_R(L)[t]→U_R(L)` at zero is not this fibre map: it kills every `j(x)`, while
  the zero-fibre class of `j(x)` is the symmetric-algebra generator `x`.
  The coefficient ring is central; multiplication in `U_R(L)` need not commute.

  The targets are what the pin does not state. For `L` free over `R`, prove the
  presentation by the tensor algebra over `R[t]` on
  `R[t]⊗_R L`, modulo the two-sided relations
  `xy-yx-t[x,y]`. Its universal property identifies `R[t]`-algebra maps
  into any associative `R[t]`-algebra `A` with `R`-linear maps `f:L→A`
  satisfying `[f(x),f(y)]=t f([x,y])`. Construct both inverse maps on the
  actual quotient and generators. Consume the native ordered PBW basis over
  a commutative ring to prove that, for a chosen ordered basis, the increasing products of
  `j(b_i)` form an `R[t]`-basis. Thus the family is free and flat over `R[t]`. Multiplication
  by `ħ` is injective on the Rees algebra of every `L`, being multiplication by `t` in
  `U_R(L)[t]`. Do not rebuild a second PBW theorem.
  Prove naturality of the Rees algebra, its generators and its fibre maps under Lie
  homomorphisms. After scalar extension to `R[t,t⁻¹]`, identify the family with
  `R[t,t⁻¹]⊗_R U_R(L)` by `j(x)↦t ι(x)`. Use scalar extension along
  the commutative parameter ring, without assuming a general noncommutative
  localization theorem.

  Prove `exists_reesZeroFiberBracket`: for `L` free over `R` there is an `R`-bilinear map B on
  `Sym_R(L)` such that, whenever `ab−ba=ħc` in the Rees algebra, B of the zero-fibre classes of
  a and b is the class of c. Such a c exists for all a, b, because the zero fibre is
  commutative and the kernel is generated by ħ; it is unique because ħ is not a zero divisor;
  and the value is independent of both chosen lifts, because changing a by `ħd` changes
  the commutator by `ħ[d,b]`, and `[d,b]` is itself a multiple of ħ, so the quotient by ħ changes
  by a multiple of ħ and its class is unchanged. Surjectivity of
  the specialization therefore determines B uniquely. Prove alternation, Jacobi and the two
  Leibniz identities, its degree `-1` property, naturality, and
  `{x,y}=[x,y]` on the symmetric generators, which is the native generator relation. It is the
  unique biderivation with this generator equation. Use associativity, the commutator
  identities and injective multiplication by `ħ` for these proofs. For the dual-number
  base change `R[ε]/(ε²)`, use an ordered PBW module splitting to write
  `p⋆q=pq+ε B₁(p,q)`. Track the change of `B₁` under a change of the splitting and prove
  `B₁(p,q)-B₁(q,p)={p,q}`. The full first-order product coefficient
  is not asserted to be the Poisson bracket or to be alternating.

  **Checks.**

  - For `[x,y]=y`: `j(x)j(y)−j(y)j(x) = t²(ι(x)ι(y)−ι(y)ι(x)) = t²ι(y) = ħ·j(y)`, so
    `{x,y}=y`; the opposite sign convention would give −y.
  - For abelian L every commutator in the Rees algebra is 0, c=0, and the bracket is
    identically 0; the family is the constant commutative family.
  - Replacing a=j(x) by `a+ħ·j(z)` leaves the class of a unchanged and changes the commutator
    with `j(y)` by `ħ²·j([z,y])`, whose quotient `ħ·j([z,y])` specializes to 0: the bracket
    does not see the lift.
  - For the zero ring, or L=0, both sides are 0, respectively the bracket on R is 0.

  For a finite-dimensional real Lie algebra L, construct the algebra map
  E:Sym_ℝ(L)→C∞(L*,ℝ) by x↦ℓ_x, where ℓ_x(ξ)=ξ(x), and prove
  injectivity. For every p,q∈Sym_ℝ(L) and ξ∈L*, prove
  `E({p,q})(ξ)=ξ([d(E(p))_ξ,d(E(q))_ξ])`, identifying the derivatives
  in L** with vectors of L through the finite-dimensional evaluation
  isomorphism. This is an identity on polynomial evaluations, proved from
  the generator equation and the product rule (Gutt, *Deformation
  Quantization and Symmetries*, Lecture 1, slide 14). It gives the comparison
  with any smooth bracket having the displayed differential formula without
  using the construction or Jacobi identity of a bracket on all smooth functions.

  - E sends 1 to 1 and E({x,y})(ξ) to ξ([x,y]); sums and products are preserved.
  - For any real Lie homomorphism u:L→M, its symmetric-algebra map and
    pullback along u*:M*→L* give a commuting square of evaluations.
  - Polynomial evaluation is injective over ℝ. Its derivative obeys the
    product rule, and the derivative identity holds for all polynomials,
    without a nonzero or nonconstant hypothesis.

  **Checks.**

  - For L=0 and for an abelian real line the two sides of the derivative
    identity are 0; E(1)=1, excluding the zero map.
  - For [x,y]=y, at ξ(x)=2, ξ(y)=3, both sides for p=x,q=y are 3;
    reversing p,q gives −3, excluding the negative bracket convention.
  - For the same algebra, p=x²,q=y gives 12 on both sides at (2,3),
    testing the product rule beyond linear generators.
  - For sl₂, {h,e}=2e and {e,f}=h, so {e,h²+4ef}=−4eh+4eh=0.
    The polynomial e is not central since {h,e}=2e is nonzero.

  *Needs:* the algebraic bracket above; symmetric-algebra evaluation;
  finite-dimensional biduality, the derivative product rule and polynomial
  identity over ℝ.
  The noncommutative Rees carrier is distinct from the commutative
  weight-Rees families of GroebnerGeometry G4.

  Acceptance cases include abelian `L` (the constant commutative family),
  the two-dimensional algebra `[x,y]=y`, and `sl₂` with
  `[h,e]=2e`, `[h,f]=-2f`, `[e,f]=h`. Compute the parameter-dependent
  generator relations. In `sl₂` prove that
  `j(h)²+2ħ j(h)+4j(f)j(e)` is central and that its zero-fibre symbol
  is the Poisson-central polynomial `h²+4ef`. These examples check the
  parameter, sign and order conventions against the same concrete algebra.
  The presentation, the Laurent comparison and the bracket over an arbitrary commutative ring
  are derived statements: their inputs are the native Rees algebra with its two fibres, the
  native ordered PBW basis over a commutative ring and injectivity of
  multiplication by ħ. Gutt, *Deformation Quantization and Symmetries*, Lecture 1,
  slide 14 (2019) is cited only for the real characteristic-zero convention
  `{ℓ_x,ℓ_y}=ℓ_[x,y]`, not as a source for the arbitrary-ring statements.

### 3.2 Ordered and symmetrized first-order products

 Let L be
  the Lie R-algebra on the free module Rx⊕Ry with `[x,y]=y`. Realize it as
  the matrix Lie subalgebra spanned by `H=E₀₀`, `N=E₀₁` in
  `Matrix (Fin 2) (Fin 2) R`; prove the span/bracket/basis dictionary.
  This is the affine Lie algebra. For every
  commutative coefficient ring R, use Rees generators X=j(H), Y=j(N), so
  `XY−YX=ħY`, with ordered PBW basis `Y^aX^b` over R[ħ]. Compare Sym(L)
  with the native polynomial ring R[x,y] through this same basis.

  Construct the ordered linear comparison S_ord(x^b y^a)=Y^a X^b and its
  inverse. Inductively prove `X^bY^c=Y^c(X+cħ)^b`, and transport multiplication:

  `(y^a x^b)⋆(y^c x^d)=Σ_(n=0)^b binom(b,n)c^n ħ^n y^(a+c)x^(b+d−n)`.

  Prove this finite formula over R, its scalar/bilinear extension, unit,
  associativity, parameter specialization and the literal comparison with
  the Rees multiplication; no factorial division is used. At ħ²=0 its
  first-order coefficient is `B_ord(p,q)=(∂_x p)y(∂_y q)`. Hence
  `B_ord(x,y)=y`, `B_ord(y,x)=0` and
  `B_ord(p,q)−B_ord(q,p)=y((∂_x p)(∂_y q)−(∂_y p)(∂_x q))`.
  Identify this last expression with the algebraic zero-fibre bracket by
  its symmetric-generator equation; over ℝ the preceding derivative identity
  evaluates it as `y((∂_x p)(∂_y q)−(∂_y p)(∂_x q))`. Ordered first-order
  multiplication is not alternating, including on the two generators.

  When R is a ℚ-algebra, also construct the symmetrized PBW comparison by
  averaging all permutations of each homogeneous tensor, with its degree
  factorial inverse. Compare it with S_ord, retaining the identity at ħ=0.
  Modulo ħ² the change is `S_sym=S_ord∘T`, where
  `T=Id+ħD`, `D(p)=(1/2)y∂_x∂_y p`, and `T⁻¹=Id−ħD`.
  Prove the monomial formula for this first-order change by counting the
  mean number of XY interchanges. Transport the product by
  `p⋆_sym q=T⁻¹(Tp⋆Tq)` and prove

  `B_sym(p,q)=B_ord(p,q)+D(p)q+pD(q)−D(pq)=(1/2){p,q}`.

  Thus even the symmetric splitting gives half the bracket as its product
  coefficient; the full first-order commutator gives the bracket. Retain this distinction with the fixed parameter. The
  ordered integral construction remains valid in characteristic2; the
  averaging/half-bracket comparison has its stated ℚ-algebra hypothesis.
  This example uses only the native arbitrary-ring Rees algebra, the bracket of §3.1
  and native polynomial derivatives. General formal deformation quantization
  and convergence are not prerequisites. These formulas are derived here from
  the commutation rule `X^bY^c=Y^c(X+cħ)^b`; for the real characteristic-zero
  symmetrization framework see
  [Gutt, Deformation Quantization and Symmetries, Lecture1](https://simone.gutt.web.ulb.be/DQWurzOct2019Lect1%262.pdf).

  **Checks.**

  - `B_ord(x,y)=y` and `B_ord(y,x)=0`, so ordered first-order multiplication is
    not alternating; their difference is the bracket value y.
  - At p=xy, `D(p)=(1/2)y`, and `B_sym(x,y)=y+0+0−(1/2)y=(1/2)y`, half the
    bracket, while `B_sym(y,x)=−(1/2)y` and their difference is y; reporting y
    as the symmetric coefficient confuses the two splittings.
  - With a=0, b=1, c=1, d=0 the product formula gives `x⋆y=yx+ħy`, matching
    `XY=YX+ħY`; at ħ=0 it is the commutative product of R[x,y].

Prove the induced-tensor presentation of the native Verma module:
U(L) ⊗ over U(𝔟) with the one-dimensional highest-weight character is isomorphic
to the native quotient, taking 1⊗1 to its generator and intertwining the left
U(L)-action. The source uses the actual Borel and its inclusion, and the
comparison includes zero among possible images of the universal generator
(Humphreys, *Introduction to Lie Algebras and Representation Theory*, §20.3).

*Needs:* native Borel and Verma universal properties; balanced tensor products;
the triangular PBW equivalence.

### Examples

For [x,y]=y, the ordered first-order coefficients are B(x,y)=y and B(y,x)=0; their difference is y.

### Dependencies

*Needs:* native ordered PBW, filtration, associated grading and Verma modules;
for §3.1's real polynomial comparison, finite-dimensional differential calculus.

## Layer 5: opposition and invariant forms

### 5.1 Opposition, ordinary duality and self-duality

Use the split characteristic-zero semisimple scope and chosen Cartan/base of
the native highest-weight contracts (From Tau Ceti), with the standing
algebraically closed coefficient field. Consume
native `TauCeti.Algebra.Lie.HighestWeight.LowestWeight` and `.Dual`, in
particular `exists_isHighestWeightVector_dual`,
`nonempty_lieModuleEquiv_dual_iff` and the invariant-bilinear-form criterion.
For dominant integral λ, the ordinary dual of the finite-dimensional `L(λ)`
has highest weight `−w₀λ` and is equivalent
to `L(−w₀λ)`; these are supplied theorems, not a second dual-module construction.
Record the actual weight-space evaluation and highest/lowest-line equations
under the native action `(x·f)(v)=−f(x·v)`. This ordinary dual differs from
a contravariant dual defined using a Chevalley anti-involution.

Consume `TauCeti.opposition`, `oppositionPerm`, `root_opposition`,
`coroot'_opposition` and `opposition_mem_support` from native
`TauCeti.LinearAlgebra.RootSystem.Opposition`. Identify this actual involution
with the based root automorphism `δ=−w₀` on the rational/real root realization constructed by the integral-lattice comparison
here, using [RootSystems, Layer 4](../RootSystems/README.md) for its chamber and longest-element data: give its root, coroot, fundamental-weight
and oriented Cartan-matrix equations, preserving the native contravariant
coweight convention. Construct its based-automorphism witness and change-of-base
comparison; reuse the existing involution and base permutation.

Prove that `L(λ)` is self-dual exactly when `δλ=λ`, equivalently its
fundamental-weight coefficients are constant on δ-orbits. Complete reducibility
then identifies the dual multiplicities of an arbitrary finite-dimensional
module by `m_(M*)(λ)=m_M(δλ)` and gives its self-duality criterion. Prove that
EVERY finite-dimensional module is self-dual iff δ is the identity on the
weight space, equivalently `w₀=−Id`; for the reverse implication from all
modules use the fundamental highest-weight modules, whose weights span.
The trivial semisimple algebra satisfies this statement, and reducible systems
use opposition separately on each component, without permuting equal components.

Compute opposition in the valid finite types, with the actual numbered simple
roots and fundamental weights: it is trivial in A1, B, C, even D, E7, E8, F4
and G2, and nontrivial in A_n for n≥2, odd D_n for n≥5, and E6. Use
RootSystems' valid rank bounds and low-rank identifications. Trivial based
diagram automorphism group therefore implies every module is self-dual.
The converse fails already for D4: `−Id` is the even four-sign-change Weyl
element, hence is w₀, whereas its based diagram automorphism group is S3.
This root-level example asserts no triality automorphism of every isogeny form.

Self-duality does not determine the symmetry of the invariant form: the standard
`sl₂`-module is self-dual with an alternating form. The Lie invariant-form headline is `invariantForm_isSymm_iff_tits_sign`: for a nonzero
invariant bilinear form on L(λ), symmetry is equivalent to
(−1) raised to the sum of λ evaluated on the positive coroots being +1, and
skew-symmetry to the same sign being −1. The sum uses the integral pairings.
This follows the principal-sl₂ proof of Etingof, *Lie Groups and Lie Algebras
I & II*, Example 32.13 and Proposition 32.14, pp. 176–177. That source treats
complex simple Lie algebras. For the stated algebraically closed
characteristic-zero field and semisimple L, construct the principal triple
componentwise using the same algebraic Chevalley-generator equations
(Etingof, *Representations of Lie Groups*, §17.2, p. 81); the rank-one
string argument uses no analytic property of ℂ. Its inputs are: a nonzero
invariant form on the irreducible `L(λ)` is nondegenerate and unique up to
scalar; the element `2ρ∨`, the sum of the positive coroots, is the semisimple
element of a principal `sl₂`-triple; its eigenvalue `m = λ(2ρ∨)` on the
highest-weight line is strictly larger than on every other weight space,
since `ρ∨` pairs to 1 with each simple root; hence the `sl₂`-module `V(m)`
occurs in `L(λ)` exactly once, the form restricts nondegenerately to it, and
the invariant form on `V(m)` has sign `(−1)^m` by the native rank-one weight
strings. The principal triple is constructed from the Chevalley generators of
the simple roots with coefficients fixed by `2ρ∨ = Σ_i c_i α_i∨`.

**Checks.**

- In type A₁ opposition is the identity and every `V(n)` is self-dual. In type A₂
  opposition exchanges the two fundamental weights, so `L(ω₁)` is not self-dual, its dual
  being `L(ω₂)`, while the adjoint module `L(ω₁+ω₂)` is.
- For `sl₂`, `2ρ∨=h` and `λ(h)=n` on `V(n)`: the standard module V(1) has the alternating
  form with matrix [[0,1],[−1,0]] and sign `(−1)¹=−1`; the adjoint module V(2) has the
  symmetric Killing form and sign `(−1)²=+1`. Both weights are fixed by opposition, so
  opposition does not decide the sign.
- For `sl₃` and the adjoint module, λ=ω₁+ω₂ and the positive coroots sum to `2α₁∨+2α₂∨`,
  so the exponent is 2+2=4 and the form is symmetric, as the Killing form is. For the trivial
  module the exponent is 0 and the form on K is symmetric.

*Needs:* native opposition and dual-module theorems; RootSystems Layer 4;
native integral-weight lattice; native rank-one weight strings.

### Examples

For `sl₂` the modules V(1) and V(2) are both self-dual, with invariant forms of signs −1 and +1.

### Dependencies

*Needs:* native arbitrary-field complete reducibility and duality; native opposition; RootSystems Layer 4.

## Layer 6: the Weyl character, dimension, and Kostant formulas

Consume native `TauCeti.formalCharacter K H M`,
`formalCharacter_coeff_eq_finrank_weightSpace`, formalCharacter_tensor,
weylDenominator/weylNumerator, coweightPairing, and the Kostant partition/
multiplicity functions. formalCharacter_coeff pins the local alias to the
actual Cartan weight-space dimension. Consume `finrank_weightSpace_vermaModule`
for the Verma partition bound. The native freudenthal_multiplicity_formula
and `casimirScalar_eq_of_coeff_formalCharacter_mul_weylDenominator_ne_zero`
precede native `formalCharacter_mul_weylDenominator_eq_weylNumerator`;
this proof uses no HC or category-O linkage. Consume
`finrank_eq_prod_coweightPairing_div` and `formalCharacter_coeff_eq_kostantMultiplicity`
for the resulting dimension/multiplicity formulas. Consume native `casimirScalar_ne_casimirScalar_of_genWeightSpace_ne_bot_of_isHighestWeightVector`
for the nonzero recursion denominator at actual weights μ≠λ; no claim is made
for arbitrary absent weights below λ. The orbit-sum, trace,
graded-restriction and decomposition adapters below use these actual characters.

### 6.1 Orbit sums and the integral root order

Use the orbit sums, integral lower sets, triangular character expansion and
polynomial density from the exact Tau Ceti supplier contracts. The extra
comparison is the inverse reading of an arbitrary module's character below;
it uses the native expansion rather than constructing a second root order or
orbit sum. The only step taken from the literature is the triangularity argument, that a
weight of `L(λ)` is Weyl-conjugate to a dominant weight below λ, which is the step (3)⇒(2) in
the proof of Etingof, Proposition 30.4, p. 159; that proposition itself is the list of
equivalent conditions for a minuscule weight and does not state the inversion.

**Checks of the imports.**

- In A₁ the orbit sum at 0 is 1 and at 1 is z+z⁻¹; summing over all
  Weyl elements would incorrectly give 2 at 0.
- Below 2 the native integral lower set is {0,2}: 2−0=1·2 and 2−2=0·2,
  whereas 2−1=1 is not an integral multiple of the simple root 2.
- ch V(2)=z²+1+z⁻²=m₂+m₀; its augmentation is 3, whereas m₂ has augmentation 2.
- At rank zero the sole orbit and lower set are {0}, and the character is 1.

*Needs:* the native orbit expansion and dominant-weight density in Exact supplier contracts.

**The representation ring and the character algebra.** Fix K and L in a universe
u, with K algebraically closed of characteristic zero and L finite-dimensional
Killing-semisimple. Use the category of finite-dimensional native Lie modules
with Lie-module homomorphisms. Prove it essentially small in u by transporting
each module to Kⁿ; changes of basis give isomorphic objects, not additional
classes. Apply native `TauCeti.SplitK0` and its monoidal ring structure to this
category, with the tensor product over K, additive in each variable, and the
one-dimensional trivial module as unit. The carrier is the group completion of isomorphism classes under direct
sum: [M⊕N]=[M]+[N] and [0]=0. Complete reducibility makes every short exact
sequence split, so native `TauCeti.ExactK0.fromSplitEquiv` identifies this group with exact K₀
for the usual short-exact-sequence structure.
This is a ring of virtual classes. No positive cone restriction is imposed.

Specialize the native universal ring map to the formal character in ℤ[X], where
X is the actual integral weight lattice. Its value on [M] is the native weight
multiplicity sum; prove that the support lies in X and the image is Weyl invariant.
The construction uses the native additive and tensor character identities and
complete reducibility, with triangularity as in the proof of Etingof, Proposition 30.4,
(3)⇒(2), p. 159. Its additional API is:

- Tensor product gives [M][N]=[M⊗N], with [K]=1, and duality sends e^λ to e^(−λ)
  under the character map; these operations respect the chosen small model.
- The map sends [M]−[N] to ch M−ch N; augmentation is dim M−dim N, and its
  additivity for exact sequences follows from the split comparison.
- Under these semisimplicity hypotheses the classes of the irreducibles form a
  ℤ-basis, the character map is injective, and honest module classes have
  nonnegative irreducible coefficients. Equality of two honest classes is
  equivalent to Lie-module isomorphism, by native complete reducibility.

**Checks.**

- For sl₂, [V(1)]²=[V(2)]+[V(0)] and both characters are z²+2+z⁻².
- ch([V(2)]−[V(0)])=z²+z⁻², with augmentation 2. This virtual class has
  irreducible coefficients 1 and −1, so has no honest module representative;
  the representation semiring would not contain this difference.
- [0]=0 has character 0, whereas [V(0)]=1 has character 1 and dimension 1.
- For L=0 the ring is ℤ, dimension and character both send [Kⁿ]−[Kᵐ] to n−m;
  thus [K]−2[K]=−1 is retained even when the root system is empty.

*Needs:* native `TauCeti.SplitK0`, its monoidal ring and universal character-map
contracts and native split-to-exact comparison; Mathlib Lie-module tensor products; native complete reducibility and
formal characters; the finite-dimensional category's small-model comparison above.

The Layer 6 comparisons form the decomposition toolkit: complete reducibility makes
"decompose `M` into irreducibles" well-posed, and these targets package it as the callable interface a
downstream application actually invokes.

- **Highest-weight indexing of the native isotypic decomposition.** The multiplicity,
  isotypic component, their dimension identity and the Lie/`U(L)` submodule dictionary are
  native (`LieModule.isotypicMultiplicity`, `LieModule.isotypicComponent`,
  `LieModule.finrank_isotypicComponent`,
  `TauCeti.UniversalEnvelopingAlgebra.lieSubmoduleOrderIsoAsModule`; see the supplier
  contracts) and are consumed, not rebuilt; so are the packaged highest-weight decomposition
  `TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient` and the character identity
  `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul`, in
  `TauCeti/Algebra/Lie/HighestWeight/Decomposition.lean`. What is added here is the inverse
  reading: for a finite-dimensional M over the standing algebraically closed
  characteristic-zero field, the multiplicity of `L(λ)` in M is determined by
  `TauCeti.formalCharacter K H M` through triangular inversion against the orbit-sum
  supplied expansion, so two finite-dimensional modules are equivalent exactly when
  their formal characters agree. This is a derived statement, with no source claim: the
  multiplicities are recovered from `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul`
  by downward induction on the finite native lower sets, using the leading coefficient 1 of
  `TauCeti.formalCharacter_irreducibleQuotient_eq_orbitSum_add_lower`, and equal
  multiplicities give an equivalence by
  `TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient`. *Needs:* the native decomposition and character identity
  above; the orbit-sum expansion and finiteness of dominant weights below λ in this layer.

  **Checks.**

  - For sl₂ and `M = V(2) ⊕ V(0) ⊕ V(0)` the multiplicities of V(2) and V(0) are 1 and 2
    and the isotypic components have dimensions 3 and 2; the formal character
    `e^2 + 3 + e^(−2)` has orbit-sum coefficients 1 and 3, and triangular inversion against
    `ch V(2) = (e^2 + e^(−2)) + 1` recovers the multiplicities 1 and 2. Reading the
    orbit-sum coefficients as multiplicities gives the wrong value 3 for V(0).
  - For M = 0 every multiplicity is 0 and the decomposition is the empty sum.
  - `V(1) ⊗ V(1)` and `V(2) ⊕ V(0)` have the same character `e^2 + 2 + e^(−2)` and are
    equivalent, while `V(1) ⊕ V(1)` has character `2e^1 + 2e^(−1)` and is not: equal
    dimension alone does not decide equivalence.
- **Tensor multiplicities and the minuscule Pieri rule.** The multiplicity `c^ν_{λμ}` of `L(ν)` in
  `L(λ) ⊗ L(μ)` (tensor products of Lie modules are Mathlib's), with the character identity
  `ch L(λ) · ch L(μ) = Σ_ν c^ν_{λμ} ch L(ν)` through formalCharacter_tensor. A dominant integral
  `μ` is **minuscule** when all weights of `L(μ)` form one Weyl orbit. The **minuscule Pieri rule**
  is native: `TauCeti.minuscule_pieri` (`TauCeti/Algebra/Lie/HighestWeight/Pieri.lean`) gives,
  for dominant integral `λ` and `ν` and minuscule `μ`, `c^ν_{λμ} = 1` when `ν - λ` is a weight of
  `L(μ)` and `0` otherwise, so `L(λ) ⊗ L(μ) ≅ ⊕_τ L(λ+τ)` over the weights `τ` of `L(μ)` with
  `λ+τ` dominant, each with multiplicity one, by native complete reducibility. The dominance of
  the target weight is essential (for `sl₂` with `λ = 0`, `μ = ω`,
  the weight `-ω` of `L(ω)` satisfies the weight condition while `L(0) ⊗ L(ω) = L(ω)`). For `gl_n`
  this specializes to the classical Pieri rules for the standard module and its dual; the
  dual-standard one is native as well (Layer 9). The textbook source is Etingof, §30.2,
  Corollary 30.7 and proof, p. 160, with Proposition 30.4, p. 159, and Corollary 30.5, p. 160;
  the native proof is the Racah–Speiser formula with the vanishing of every `w ≠ 1` term for a
  minuscule `μ`, and neither proof is repeated here.
  *Needs:* `TauCeti.minuscule_pieri` and native complete reducibility.
  The type-A Littlewood–Richardson multiplicities of the `gl_n` Lie modules are the Layer 9
  target, built on the native tableau carrier and differentiation contracts.

### 6.2 Rational Weyl identities and finite torus characters

Consume the native integral weight group algebra, denominator-cleared Weyl
formula and Kostant coefficient theorem, and ClassicalGroups Layers 3–4's
group-character comparison. For each finite reduced crystallographic root
datum, W-stable lattice X between the root lattice and the weight lattice, and dominant highest weight λ∈X,
work in ℤ[X] and its localization at the factors
1−e^(−α) for positive roots α. Prove
`wρ−ρ=−Σ_(α>0,w⁻¹α<0) α`, with the inversion convention fixed by the
Weyl action and base. Only wρ−ρ and w(λ+ρ)−ρ need belong to X; ρ itself
need not be a character. Rewrite the native Weyl identity as

`ch L(λ) = [Σ_w sgn(w)e^(w(λ+ρ)−ρ)] / ∏_(α>0)(1−e^(−α))`.

Prove its equality with the fixed-point rational sum
`Σ_w e^(wλ)/∏_(α>0)(1−e^(−wα))`, retaining the signs and shifts from
inverted denominator factors. This is an algebraic adapter of the native
Weyl formula: each inverted factor satisfies
`1−e^α=−e^α(1−e^(−α))`, and the inversion-set identity supplies exactly
the numerator shift (Etingof, *Lie Groups and Lie Algebras I & II*,
Proposition 26.3 and Theorem 26.4, pp. 139–140). The factors are nonzero because roots are
nonzero lattice elements; ℤ[X] is a domain since X is free abelian.
For GL_n, compare ρ with the integral staircase δ=(n−1,…,0); their
difference is W-fixed, so shifted exponents agree without adjoining
fractional characters. No root-system rank or global-form restriction is added.

Using a lattice basis X≃ℤ^r, evaluate the finite character as
`χ(θ)=Σ_μ dim L(λ)_μ · exp(2πi⟨μ,θ⟩)` on the native unit torus.
This evaluation is the finite sum of native torus characters. Its API is:

- Addition and multiplication of finite characters become pointwise addition
  and multiplication, and the zero weight maps to the constant function 1.
- Its native Fourier coefficient at μ is dim L(λ)_μ, by integrating the
  finite sum and using orthogonality; a lattice-basis change uses the dual
  torus map and preserves these coefficients.
- The finite sum is continuous at every point of the torus, including the
  points where separate summands of the fixed-point expression have poles.

These are adapters of ClassicalGroups Layer 4 and Mathlib's finite Fourier
orthogonality, not a construction of distributions or infinite series. The
coefficient sign is the negative-frequency sign in `mFourierCoeff`.

**Checks.**

- For GL₂ and λ=(1,0), the fixed-point sum is
  `t1/(1−t2/t1)+t2/(1−t1/t2)=t1+t2`. At (t1,t2)=(2,3), its summands
  are −4 and 9 and their sum is 5. Here δ−ρ=(1/2,1/2) is fixed by
  swapping the coordinates; at t1=t2=1 the finite character has value 2.
- For A₁ with X=ℤ, χ_n(z)=z^n+z^(n−2)+⋯+z^(−n), so its Fourier coefficients
  are 1 precisely at those weights. For n=1, integration against z⁻¹
  gives 1 and against z gives 1; for the single monomial z alone these
  values are 1 and 0, excluding the opposite Fourier sign.
- For the A₂ adjoint representation, the coefficient at weight 0 is 2
  and at each of the six roots is 1; at the identity the value is 8.
  Native Kostant counting in simple-root coordinates gives
  P(0,0)=1, P(1,0)=1 and P(1,1)=2, retaining both walls and the origin.
- For X=0 the root product and Weyl sum each have one term, λ=0,
  the character is 1, and the sole Fourier coefficient is 1. For an
  empty root system with X=ℤ, the weight-m torus character is z^m,
  with coefficient 1 at m and 0 elsewhere; empty roots do not force a
  trivial central character. For the zero module every coefficient is 0.

*Needs:* native characters, Weyl and Kostant formulas; RootSystems Layers
1–6; ClassicalGroups Layers 3–4; Mathlib's unit torus, normalized Haar
measure and finite Fourier orthogonality.

### Examples

For sl₂, V(1)⊗V(1)=V(2)⊕V(0), with dimensions 4=3+1 and multiplicities one.

### Dependencies

*Needs:* native characters, Weyl and Kostant formulas, highest-weight
classification and complete reducibility (From Tau Ceti); Layer 5;
RootSystems Layers 1–6; ClassicalGroups Layers 3–4;
Mathlib's finite Fourier orthogonality.

## Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

The structural layer behind the character formula: the center that the native Casimir
`TauCeti.casimirElement` sits inside,
the recursion that computes multiplicities in practice, and the presentation that recovers `L` from
its root system.

### 7.1 The center, Harish-Chandra, Freudenthal and Serre

- **The center `Z(U(L))` and central characters.** `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)`,
  the commutative algebra in which the native Casimir element lives. The **central character**
  `χ_(base,λ) : Z(U(L)) →ₐ[K] K`, written centralCharacter base λ below, is read from the Verma top line.
  Consume native `TauCeti.vermaCentralCharacter base λ`, defined through the action of the
  center on the **one-dimensional top weight line** of the Verma module
  `M(λ)` (which the center preserves), so its construction depends on the Layer 3 Verma / highest-weight
  machinery. Consume native `representation_eq_vermaCentralCharacter_smul` for the action
  on any generating highest-weight line and `vermaCentralCharacter_casimirElement` for
  the native Casimir eigenvalue `⟨λ+ρ,λ+ρ⟩−⟨ρ,ρ⟩`, retaining the chosen base.
- **The Harish-Chandra isomorphisms and their conventions.** Write `ev_λ : S(H) →ₐ[K] K`
  for `SymmetricAlgebra.lift λ`, viewing `S(H)` as polynomial functions on `H*`. The dot action is
  `w·λ = w(λ+ρ)−ρ`. Consume native `TauCeti.dotInvariants`, with its exact evaluation
  characterization `ev_(w·λ)(p)=ev_λ(p)`. Consume the native ordinary Weyl-invariant
  subalgebra `TauCeti.linearInvariants H`, defined by `ev_(wλ)(p)=ev_λ(p)`, with its
  membership equation `TauCeti.mem_linearInvariants_iff` and its homogeneity
  `TauCeti.isHomogeneous_linearInvariants` (`CentralCharacter/Linear.lean`).

  The **raw** map `HC_dot = hcProjection : Z(U(L)) →ₐ[K] S(H)` is the restriction to the
  center of `(ε₋ ⊗ id ⊗ ε₊) ∘ PBW⁻¹`, using the ordered multiplication isomorphism
  `U(n₋) ⊗ U(H) ⊗ U(n₊) ≃ₗ[K] U(L)` of Layer 3 and `U(H) ≃ₐ[K] S(H)`.
  Consume native `TauCeti.cartanProjection`, `TauCeti.hcProjection`,
  `TauCeti.dotAction`, `TauCeti.vermaCentralCharacter`,
  `TauCeti.hcProjection_mem_dotInvariants`, `TauCeti.vermaCentralCharacter_dotAction`,
  and `TauCeti.lift_hcProjection` from
  `TauCeti.Algebra.Lie.HighestWeight.CentralCharacter.DotOrbit`, with the native Weyl
  vector and action-law API; there is no translation in the raw map. Augmentations and
  triangular multiplication are supplied by its imported native enveloping-algebra modules.
  `TauCeti.hcProjection` packages its center restriction as an algebra homomorphism. Its range is
  exactly `S(H)^{W·}` (`TauCeti.range_hcProjection`), and the native
  `TauCeti.harishChandraIso base : Z(U(L)) ≃ₐ[K] S(H)^{W·}` (`CentralCharacter/Isomorphism.lean`)
  packages the projection as an algebra isomorphism, `TauCeti.coe_harishChandraIso_apply`
  identifying its forward map with `TauCeti.hcProjection` and
  `TauCeti.hcProjection_mem_wordFiltration_iff` with
  `TauCeti.harishChandraIso_symm_mem_pbwFiltration` giving both directions of the
  PBW/degree-filtration comparison, the degree filtration of `S(H)` being
  `TauCeti.Algebra.wordFiltration (SymmetricAlgebra.ι K H) n`. The pin states these for
  `K : Type`; no existence theorem is stated here.

  The polynomial translation `τ_μ` with `ev_λ(τ_μ p)=ev_(λ+μ)(p)` is the native
  `SymmetricAlgebra.translation` (`LinearAlgebra/SymmetricAlgebra/Translation.lean`),
  with its generator formula `translation_ι`, composition `translation_trans`, inverse
  `translation_symm` and degree-filtration preservation
  `translation_mem_wordFiltration_iff`. The **linear**
  map is the native `HC_lin = TauCeti.hcProjectionLinear base := τ_(−ρ) ∘ HC_dot`
  (`CentralCharacter/Linear.lean`), so `HC_lin(z)(λ)=HC_dot(z)(λ−ρ)`
  (`TauCeti.lift_hcProjectionLinear`). Translation restricts to an isomorphism from dot
  invariants to ordinary invariants (`TauCeti.dotInvariantsEquivLinearInvariants`), and the
  native `TauCeti.harishChandraLinearIso base : Z(U(L)) ≃ₐ[K] S(H)^W`
  (`CentralCharacter/Isomorphism.lean`) is the linear Harish-Chandra isomorphism, with
  `TauCeti.harishChandraLinearIso_symm_mem_pbwFiltration` for its inverse filtration.
  Use native `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n` and
  `TauCeti.SymmetricAlgebra.homogeneousSubmodule K H k`; degree≤n is their sum over k≤n,
  the native word filtration. Forward filtration preservation of the raw and linear projections
  is the forward half of `TauCeti.hcProjection_mem_wordFiltration_iff` and
  `TauCeti.hcProjectionLinear_mem_wordFiltration_iff`. The central-character equations
  `χ_λ(z)=ev_λ(HC_dot(z))=ev_(λ+ρ)(HC_lin(z))` are native (`TauCeti.lift_hcProjection`,
  `TauCeti.lift_add_weylVector_hcProjectionLinear`), compatible with the action on the Verma
  top line. These equations fix the shift signs.
  All central characters in this layer retain the chosen base; changing to the opposite
  Borel changes the weight labeling and the raw polynomial.

  The native translation is an algebra automorphism S(H)→S(H) with the following API
  (Etingof, *Representations of Lie Groups*, Theorem 14.1, pp. 70–71,
  for its Harish-Chandra use; the laws hold on generators), consumed here:

  - On a generator h it sends h to h+μ(h)·1, and it fixes every scalar.
  - Composition adds parameters; the inverse has parameter −μ.
  - It preserves degree≤n in both directions; on positive homogeneous degree n
    its difference from the identity has degree≤n−1, and on degree 0 it is zero.

  **Checks for translation.** In A₁ write ρ(h)=1.

  - τ_(−ρ)(1)=1, excluding the zero map.
  - τ_(−ρ)(h)=h−1 and τ_ρ(h−1)=h, fixing both direction and inverse.
  - τ_(−ρ)(h²+2h)=h²−1; τ_ρ instead gives h²+4h+3, so the raw Casimir
    polynomial becomes ordinarily invariant only with the negative shift.

  *Needs:* symmetric-algebra universal property and evaluation; the native Weyl
  vector for the specialization μ=−ρ, and the raw projection for HC_lin.
- **Lie-algebra Chevalley restriction and its native carriers.** Consume
  `TauCeti.SymmetricAlgebra.lieInvariants K L L`, the subalgebra of Mathlib's `SymmetricAlgebra K L`
  killed by native `TauCeti.SymmetricAlgebra.lieModuleDerivation`
  (`LinearAlgebra/SymmetricAlgebra/LieModule.lean`), with its maximal-trivial-submodule and
  degreewise characterizations. Consume the canonical
  Mathlib `Module.Dual` action `⁅x,φ⁆(y)=−φ(⁅x,y⁆)`, with the coadjoint representation
  coadjointRepresentation given by Mathlib's `LieModule.toEnd K L (Module.Dual K L)`, and its
  coadjointDerivation through native `derivationOfEnd`, with the generator equation.
  Use the native Killing-duality, inner-action, polynomial-density, Cartan-conjugacy
  and trace-power contracts below. Under the Killing identifications L≃L* and H≃H*,
  the restriction square identifies polynomial restriction S(L*)→S(H*) with
  the Killing-orthogonal map S(L)→S(H). Its forward map fixes h∈H and kills
  every nonzero root generator. Chevalley restriction and its homogeneous
  inverse are inputs to the new global symmetrization comparison.

  **Checks of the imported actions and trace restriction.**

  - In the standard sl₂ triple, exp(ad e)h=h−2e and exp(ad e)f=f+h−e;
    its inverse sends h to h+2e. The identity-only subgroup fails the first equation.
  - For κ(h,h)=8 and κ(e,f)=4, the transported κ(h,−) has value
    κ(h−2e,f)=−8=κ(h,f−h−e); using the transpose instead of inverse transpose
    gives +8.
  - The standard sl₂ trace powers at h in degrees 0,1,2,3 are 2,0,2,0;
    the zero module gives 0 also in degree 0.
  - The degree-two restriction at th is 2t². Its Killing-transported element
    is h²/32, evaluating to (8t)²/32=2t²; the adjoint module instead gives
    8t² and h²/8, since its weights are 2,0,−2.
  - At the regular Cartan point h, the root-exponential parametrization has
    derivatives −2e,2f,h of rank 3; at zero it has only the Cartan direction,
    of rank 1. Surjectivity is required at one point, not at every point.

  *Needs:* the native contracts for inner actions, Killing transport, Cartan
  density/conjugacy and trace restriction; Etingof, *Representations of Lie
  Groups*, Theorem 10.1 and proof, pp. 51–52, for their complex interpretation.

  The native Lie-invariant subalgebra and the coadjoint action are generic Lie constructions.
  PBW symmetrization and the center-symbol comparison hold for every Lie algebra over
  a characteristic-zero field, without finite-dimensionality, Killing or algebraic-closure
  assumptions; state their APIs at this generality. The native HC and Lie–Chevalley
  isomorphisms use algebraically closed characteristic-zero K and finite-dimensional
  Killing-semisimple L. The theorem `exists_pbwSymmetrization` itself applies to every
  Lie algebra over every characteristic-zero field: average ordered monomials
  over permutations with coefficient 1/m!, with its product formula, commutator equivariance,
  inverse and filtration API, including pbwSymmetrization_symm_mem_degreeLE. Consume native `pbwHomogeneousComponentMap`,
  `pbwAssociatedGradedEquiv` and `TauCeti.SymmetricAlgebra.gradedAlgebra` for the
  direct homogeneous grading and leading symbols. The degreewise symmetrization
  `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization` and its centre criterion
  `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_mem_center_iff`
  (`PBW/Symmetrization.lean`) are native, for `L` free over a commutative ring with `n!`
  invertible; the global map of `exists_pbwSymmetrization` restricts to them in each degree. Filter the actual center by the comaps of native
  PBW steps; its associated graded is the direct sum of successive submodule quotients
  (degree 0 predecessor is⊥). The symbol and center-membership theorems identify this
  graded algebra with S(L)^L. Consume the native degreewise
  `TauCeti.UniversalEnvelopingAlgebra.centerPBWGradedInvariantIso` and its symbol
  equation. The additional target is normalized representative multiplication
  centerPBWGradedMul and its compatibility under these isomorphisms; direct-sum
  assembly gives the graded algebra identification; centerPBWGradedMul is bilinear
  in the two native quotient modules. Symmetrization itself is linear, not multiplicative.

  **Checks of the symbol assembly.**
  - In sl₂, Ω=h²+2h+4fe has symbol h²+4ef in degree 2;
    the term 2h disappears. Its square has degree-4 symbol
    (h²+4ef)², testing multiplication rather than just a linear identification.
  - For a one-dimensional abelian algebra, the degree-i class of xⁱ times
    the degree-j class of xʲ is the degree-(i+j) class of xⁱ⁺ʲ; the
    degree-0 class of 1 acts as the unit, including i=j=0.
  - For the zero Lie algebra, the degree-0 quotient is K and all positive
    degree quotients are zero. Replacing successive quotients by the
    filtration steps would incorrectly retain K in every degree.

  With the native PBW Rees algebra and the zero-fibre bracket of Layer 3, compare its first-order
  product with this characteristic-zero PBW symmetrization. Pin the lift
  of a quadratic symmetric product as
  `sym(xy)=(j(x)j(y)+j(y)j(x))/2`. In the dual-number fibre its
  transported product on linear generators is
  `x⋆y=xy+(ε/2)[x,y]`. Prove this equation and the equality of the
  antisymmetrized first-order coefficient with Layer 3's canonical
  Poisson bracket. No factor `1/2` is used in the arbitrary-ring Layer 3
  construction. This comparison follows the general symmetrization
  construction here and is not an input to it or to the earlier PBW theorem.

  Compare the global symmetrization with native homogeneous symmetrization on
  each homogeneous component by their common permutation-average equation.
  Then apply the native leading-term and translation contracts: for a homogeneous
  invariant p of positive degree n, HC_dot(sym p)−lieCartanRestriction(p) has
  degree≤n−1; in degree 0 it is zero. The linear projection has the same
  leading restriction because translation lowers the discrepancy by one degree.
  These consequences use the native results, not a second proof of them.
  The homogeneous components of ordinary invariants and of Lie invariants are native
  (`TauCeti.isHomogeneous_linearInvariants`,
  `TauCeti.SymmetricAlgebra.decompose_mem_lieInvariants_iff`); ordinary invariants form a
  graded subalgebra, whereas dot invariants need not. Export cartanEquivDual_weylGroup
  from native `rootInvariantForm.isOrthogonal_reflection` and simple-coreflection
  generation, to transport polynomial restrictions between S(H*) and S(H).
  HC injectivity, surjectivity and inverse filtration are native
  (`TauCeti.hcProjection_injective`, `TauCeti.range_hcProjection`,
  `TauCeti.harishChandraIso_symm_mem_pbwFiltration`,
  `TauCeti.harishChandraLinearIso_symm_mem_pbwFiltration`); the center-symbol comparison
  above sits beside them and is not an input to them.
  The dependency order is native root, weight, classification and Weyl formulas, together with
  Layer 6 → the native Chevalley restriction theorem → the native HC isomorphisms, with the
  global normalized symmetrization and multiplicative assembly of the native degreewise
  center symbols as separate exports. Compact-group C5 branches from the
  Lie–Chevalley restriction/infinitesimal transport step and does not consume HC.
  [CharacteristicClasses C5](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings)
  consumes these generic Lie-algebra results, and owns compact-group invariance, its
  geometric root-data comparison, reductive central factors and real descent. The trace
  route and normalized HC agree with Etingof, Theorem 10.1 and Remark 10.2, pp. 51–52,
  Theorem 13.5 and proof, p. 69, and Theorem 14.1, pp. 70–71; see [Etingof, arXiv:2401.01446v2](https://arxiv.org/html/2401.01446v2#S10.SS1).
- **Central characters and the dot orbit.** `χ_λ = χ_μ ⟺ μ ∈ W·λ` (dot action) is native:
  `TauCeti.vermaCentralCharacter_eq_iff` (`CentralCharacter/Isomorphism.lean`, with `∃ w, w·λ = μ`
  on the right) says two central characters coincide iff the weights lie in one dot
  orbit, proved there from `TauCeti.harishChandraIso` and the native orbit separation
  `TauCeti.forall_mem_dotInvariants_lift_eq_iff` (`CentralCharacter/OrbitSeparation.lean`).
  This is the central-character / orbit theorem behind Verma-module homomorphisms. The full **linkage
  principle** of category `O` (the precise statement about composition factors of `M(λ)`, the integral
  Weyl group, and the order constraints of the block decomposition) is strictly stronger and is a
  separate development, not identified with this orbit statement.
The orbit-separation step is native as well; ReflectionInvariantTheory §2's finite-orbit
separation theorem with V=H* gives the same statement once its polynomial invariants are
identified with `TauCeti.linearInvariants H` through finite-dimensional double duality and evaluation.
For a linear-invariant polynomial p, the polynomial q(λ)=p(λ+ρ) is dot invariant,
since w·λ+ρ=w(λ+ρ); this translation transports the supplied separation theorem
in both directions. No new finite-group separation theorem is constructed here.

**Checks.**

- In A₁ the ordinary orbits {−1,1} and {−2,2} have h²-values 1 and 4.
  The invariant (h²−1)/3 takes values 0 and 1, respectively; 3 is nonzero in K.
- With ρ=1 the same polynomial evaluated at h+1 separates dot orbits {0,−2}
  and {1,−3}, again by 0 and 1. Translation by −1 instead gives values 0 and
  8/3 at 0 and −2, failing dot invariance.
- Points 1 and −1 lie in the same ordinary orbit and cannot be separated by
  an invariant polynomial. At rank zero there is a single point and a single
  orbit, so equality of all invariant evaluations still agrees with orbit equality.

*Needs:* ReflectionInvariantTheory §2; finite-dimensional double duality;
the native dot action and ρ-translation in Layer 7.

For dominant-integral uniqueness use the
Mathlib `RootPairing.restrictScalarsRat` and the native ordered rational chamber theorem.
Construct dominantIntegral_eq_of_dotAction_eq: the inverse rational Cartan matrix
puts dominant-integral weights in the rational root span; transport the base, ρ and Weyl
action, apply `eq_of_dotAction_eq_of_mem_dominantChamber` over ℚ, then extend scalars to K;
no ordered-field structure on algebraically closed K is used.

- **Central characters separate the dominant weights.** On dominant integral weights `λ ↦ χ_λ` is
  injective (distinct dominant weights lie in distinct dot orbits, by the orbit theorem above), and
  the center acts on the `λ`-isotypic component of any finite-dimensional module by `χ_λ`: the
  eigenspace-of-the-center refinement of the Layer 6 decomposition toolkit. A single Casimir
  eigenvalue does not separate distinct dominant weights in general; the full center does, which is
  why the separation is stated here and not through the native Casimir alone.
- **Freudenthal's multiplicity formula.** The recursion is **anchored at the base case** `mult_λ = 1`
  (the top weight has multiplicity one); for `μ` a weight of `L(λ)`,
  `(⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩) · mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} · ⟨μ+jα, α⟩`
  (freudenthal_multiplicity_formula). The inner sum over `j ≥ 1` is **finite**: `μ + jα` leaves the
  (finite) weight set for large `j`, so `j` ranges over a finite set. For an actual weight `μ ≠ λ` of `L(λ)` the
  Casimir denominator `⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩` is nonzero, so the identity **solves for** `mult_μ`
  downward from `λ`, complementing the closed form of Kostant. Consume native
  freudenthal_multiplicity_formula,
  `casimirScalar_ne_casimirScalar_of_genWeightSpace_ne_bot_of_isHighestWeightVector` and the
  solved form `TauCeti.coeff_formalCharacter_eq_freudenthalRHS_div`
  (`HighestWeight/Freudenthal.lean`), which divides by the Casimir difference at every `μ ≠ λ`;
  at a form that is not a weight both sides vanish. Nothing of the recursion is a target here.
  It is a check on Kostant's formula and the route for the worked examples below.
- **Serre's relations and the split-field presentation of `L`.** Work over any
  `[Field K] [CharZero K]` with `[FiniteDimensional K L] [LieAlgebra.IsKilling K L]`,
  a Cartan `H` and `[IsTriangularizable K H L]`; simplicity of `L` is not assumed. Mathlib's `Matrix.ToLieAlgebra K CM` is the
  quotient by the Serre relators. Consume the native
  `TauCeti/Algebra/Lie/Presentation/Serre/Killing.lean`: its
  `exists_isSerreSystem_of_base` supplies `e,f : ↥base.support → L`, the fixed simple
  coroot family `h_i=((rootSystem H).coroot i : L)`,
  `TauCeti.IsSerreSystem K base.cartanMatrix.transpose h e f`, and
  `LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f)=⊤`, without algebraic closure.
  Its root-string construction uses normalized simple-root sl₂ triples; retain the
  raising/lowering root-space and coroot normalization when exposing these data.
  `TauCeti.serreLift` sends the actual H/E/F generators to those families, and
  `serreLift_surjective` (or `exists_surjective_serreLift_of_base`) gives surjectivity.
  Own the remaining `serreLift_injective_of_base` for this actual normalized lift:
  for every such generating system in a Killing-semisimple `L`, prove its kernel is zero. Construct
  the finite-type root-graded straightening/spanning theorem from the Serre relations:
  the simple Cartan generators together with one chosen bracket word for each root span
  the presented algebra. Show their images are the normalized coroot/root-space basis of
  `L`, using root strings, Jacobi and characteristic-zero coefficients. Their independent
  images then prove injectivity. Combine it with the supplied surjection to construct
  the presentation equivalence from that same lift, with its H/E/F value equations.
  The source is Etingof, §24.2, Theorem 24.2 and Lemma 24.3, pp. 130–132, stated there for
  every reduced root system, whose presented algebra is the direct sum over the irreducible
  components (first line of the proof);
  the root-support and one-dimensional-root-space steps occur in the proof of
  parts (iii)–(iv), pp. 131–132. The source assumes algebraic closure in §24.1;
  the split-field extension here uses its algebraic proof on the root-lattice
  grading: mixed brackets reduce to the positive part, Cartan part or negative
  part, and the Serre relations make every simple-root sl₂ action locally finite.
  Rank-one strings preserve weight multiplicity under simple reflections;
  height reduction leaves only roots and zero in the support and makes each
  root space a line. All weights and Cartan eigenvalues lie in K by splitness;
  the required nonzero integer coefficients are invertible by characteristic zero.
  Positivity in the height argument is in the rational root space, not an order
  on K. Thus this route needs neither algebraic closure nor an embedding into ℂ.
  *Needs:* native normalized Serre lift and surjectivity; native characteristic-zero
  root sl₂ strings; RootSystems Layers 1–6 for rational root geometry; the
  root-graded spanning target in this paragraph. No HC input is used.
  The all-root normalization exists_chevalleySystem and serre_presentation_equiv
  are split-field contracts, independent of the HC isomorphism. Writing
  `A = base.cartanMatrix`, the native root convention is `A i j = αᵢ(hⱼ)`, whereas
  `CartanMatrix.Relations.HE` imposes `⁅Hᵢ, Eⱼ⁆ = CM i j • Eⱼ`. Hence
  `⁅hᵢ, eⱼ⁆ = αⱼ(hᵢ) • eⱼ = A j i • eⱼ`, and for distinct simple roots the higher
  relations are `ad(eᵢ)^(1 - A j i) eⱼ = 0` and `ad(fᵢ)^(1 - A j i) fⱼ = 0`.
  Check both Cartan eigenvalues and higher exponents on a nonsymmetric rank-three matrix
  (types `B₃`/`C₃`), using `base.cartanMatrix` of the concrete root system as
  the comparison, rather than the `CartanMatrix.bₙ`/`cₙ` labels. Simply-laced
  matrices do not detect the transpose.
  For simple `L` the matrix `base.cartanMatrix` is indecomposable; in general it is block
  diagonal over the simple ideals, generators of different blocks commute in the presented
  algebra by the Serre relations with zero Cartan entry, and the presentation is the **direct
  sum** of the simple-ideal presentations. One route proves the simple case and assembles the
  blocks; the statement is for every Killing-semisimple `L`.

  **Checks.**

  - For `sl₂` the Serre algebra of the matrix (2) is spanned by h, e, f, and the lift onto the
    3-dimensional `sl₂` is injective.
  - For `L = sl₂ × sl₂`, which is semisimple and not simple, the Cartan matrix is diag(2,2),
    the relations with zero entry give `[e₁,e₂]=[f₁,f₂]=0`, the Serre algebra is spanned by the
    six generators, and the surjective lift onto the 6-dimensional `L` is injective.
  - Without the relation `ad(e₁)^(1−A) e₂ = 0` the presented algebra of diag(2,2) contains the
    nonzero class `[e₁,e₂]`, which maps to 0 in `L`: the higher Serre relations are needed for
    injectivity already in the reducible case.

  This identifies Mathlib's `Matrix.ToLieAlgebra`
  with the concrete Killing algebra; it is the Lie-algebra companion to the root-datum existence
  (`GeckConstruction`) of [../RootSystems/README.md](../RootSystems/README.md), and the input to Layer
  8's identification of the exceptional models.

### 7.2 Polynomial carriers for the headline comparisons

The four carriers of the Chevalley and Harish-Chandra comparisons are native at the
pin and are consumed with the hypotheses the pin states; nothing in this subsection is
defined here.

- **Degree filtration of S(H).** `TauCeti.Algebra.wordFiltration (SymmetricAlgebra.ι K H) n`
  (`Algebra/WordFiltration/Basic.lean`), over any commutative ring, is the ordinary degree
  filtration, including constants at n=0; `TauCeti.Algebra.wordFiltration_eq_iSup_pow` writes
  it as the sum of the powers of the generator range in degrees k≤n, which are the native
  `TauCeti.SymmetricAlgebra.homogeneousSubmodule K H k`
  (`LinearAlgebra/SymmetricAlgebra/Homogeneous.lean`). It is monotone, exhaustive and
  multiplicative. For a one-dimensional Cartan, step 0 contains 1 and excludes h, and step 1
  contains 1+h and excludes h²; for H=0 every step is K (Etingof, Theorem 14.1(iv), pp. 70–71).
- **Ordinary Weyl invariants.** `TauCeti.linearInvariants H` (`CentralCharacter/Linear.lean`),
  for a split finite-dimensional Killing-semisimple L over a characteristic-zero field, is the
  subalgebra of S(H) with equal evaluations at λ and wλ (`TauCeti.mem_linearInvariants_iff`),
  closed under every homogeneous component (`TauCeti.isHomogeneous_linearInvariants`); its
  carrier is a subalgebra of S(H), not a set of weights (Etingof, Theorem 10.1, p. 51, and
  Remark 10.2(1), p. 52). In A₁, 1 and h² are invariant, h is not, and the dot invariant
  h²+2h is not, by the evaluations at 1 and −1.
- **Lie invariants.** `TauCeti.SymmetricAlgebra.lieInvariants K L L`
  (`LinearAlgebra/SymmetricAlgebra/LieModule.lean`), over any commutative ring, is the
  subalgebra killed by every `TauCeti.SymmetricAlgebra.lieModuleDerivation`
  (`TauCeti.SymmetricAlgebra.lie_eq_lieModuleDerivation` reads it as the bracket); its
  submodule is the maximal trivial Lie submodule
  (`TauCeti.SymmetricAlgebra.mem_lieInvariants_iff_mem_maxTrivSubmodule`) and it is graded
  (`TauCeti.SymmetricAlgebra.decompose_mem_lieInvariants_iff`); Etingof, proof of Theorem 13.5,
  p. 69, is the complex case. For abelian L every polynomial is invariant; in sl₂, h is not,
  since e·h=−2e, and h²+4ef is.
- **Killing-orthogonal restriction.** `TauCeti.lieCartanRestriction H`
  (`Algebra/Lie/Killing/CartanRestriction.lean`), over any field, for a finite-dimensional
  Killing-semisimple L and a Cartan H, is the symmetric-algebra map of
  `TauCeti.killingCartanProjection H`; it fixes Cartan generators, kills nonzero-root
  generators, preserves homogeneous degree and is onto, and
  `TauCeti.map_dualMap_killingSymmetricEquiv` is its square with polynomial restriction on the
  dual spaces. Etingof, Remark 10.2(1), p. 52, describes the complex specialization. In sl₂, h
  maps to h and e, f to 0, so h²+4ef maps to h²; for L=0 the map is the identity of K.

*Needs:* the native declarations above; the comparisons that use them are
`exists_pbwSymmetrization` and the native `TauCeti.harishChandraIso` and
`LieSubalgebra.lieChevalleyRestrictionIso`.

### Examples

For sl₂, the dot reflection sends t to −t−2; the raw Casimir polynomial h²+2h has equal values 3 at t=1 and t=−3.

### Dependencies

*Needs:* native root/weight theory and classification; Layer 6; native triangular PBW, symmetric grading, Killing duality and Serre lift; the native `LieSubalgebra.lieChevalleyRestrictionIso`, `TauCeti.harishChandraIso`, `TauCeti.harishChandraLinearIso` and `TauCeti.vermaCentralCharacter_eq_iff`; ReflectionInvariantTheory §2 for finite-orbit separation.

## Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as Serre-construction quotients.
This layer identifies concrete **split** models over every characteristic-zero field `K`,
using Layer 7's split-field presentation. For each concrete derivation or graded model,
first prove finite dimensionality, Killing-simplicity, construct its split Cartan `H`
and `[IsTriangularizable K H L]`, and compute its concrete root system/base and fixed
coroots. Give the explicit index equivalence taking `base.cartanMatrix.transpose` to
that named Serre algebra's Cartan matrix, checking the generator scalings; apply the
normalized presentation only after these model-specific inputs. The resulting map is
defined over `K`, including nonclosed fields. The formally real / compact division forms
are a **separate `K=ℝ` real-form track** and are compared with split models only after
the stated scalar extension; “formally real” is never asserted over algebraically closed `K`.

- **The split octonions `𝕆`.** Consume the actual native `TauCeti.Octonion K`
  Zorn-vector-matrix carrier, product, conjugation, norm and trace from
  `TauCeti/Algebra/Octonion/Basic.lean`. Construct the split Cayley–Dickson doubling
  comparison by an explicit `K`-linear equivalence preserving unit, product, conjugation,
  norm and trace; it is a comparison of nonassociative algebras, not an associative
  `AlgEquiv`. Preserve its native dimension and composition laws and prove the
  alternative/Moufang comparison laws on the doubling presentation. The doubling interface is transported through this comparison. The compact
  division octonions are the separate real form and are not `Der`-matched with split
  `LieAlgebra.g₂ ℝ`.
- **`G₂ = Der(𝕆)`.** The derivation algebra of the split `𝕆` is a `14`-dimensional simple Lie algebra of
  type `G₂`, with its `7`-dimensional **fundamental representation** the imaginary octonions `Im 𝕆`
  (imaginaryOctonion). Use `TauCeti.derivationLieAlgebra K (TauCeti.Octonion K)` with its native
  commutator bracket and dimension theorem; prove that it is Killing-simple of type
  `G₂`, and use the native imaginary-module irreducibility theorem; identify it with the **split**
  `LieAlgebra.g₂ K` via `octonionSerreLift_injective`, the injectivity of the
  actual native `TauCeti.Octonion.g₂ToDerivationLieAlgebra`, together with
  `TauCeti.Octonion.g₂ToDerivationLieAlgebra_surjective` from
  `TauCeti/Algebra/Octonion/Serre.lean`. The map sends the Serre H/E/F generators
  to the native Cartan/raising/lowering derivations; it has source split G₂ and
  target split-octonion derivations. Layer 7 supplies the presentation argument.
  The dimension and absolute type are Schafer, 1961 notes, Chapter III, p. 28
  (SchaferNonassociative line 1022); the split identification additionally uses
  the split Cartan and normalized generators required at the start of this layer.
  Baez §4.1, Theorem 4, p. 37 concerns the compact real derivations instead;
  their 7-dimensional imaginary module is discussed immediately after that theorem.
- **The split Albert algebra `H₃(𝕆)` and `F₄ = Der(H₃(𝕆))`.** Consume the native
  `TauCeti.AlbertAlgebra K` coordinate carrier and symmetrized product from
  `TauCeti/Algebra/AlbertAlgebra/Basic.lean`, with its actual cyclic off-diagonal layout,
  trace and trace-zero submodule. Transport the Hermitian-matrix/doubling presentation
  by an explicit product-preserving linear equivalence, using the octonion comparison;
  preserve trace and hence its kernel. Transport the supplied Jordan identity
  through this comparison; the representation comparison is a target, while
  the dimensions 27 and 26 are inputs. Its derivation
  algebra is a 52-dimensional Killing-simple split algebra with fundamental 26-dimensional
  trace-zero representation. Construct its split Cartan and concrete root-matrix
  comparison before the identification `nonempty_derivationAlbert_equiv_f4` with `LieAlgebra.f₄ K`.
  The dimension 52 and absolute type are Schafer, 1961 notes, Chapter IV,
  p. 41 (SchaferNonassociative line 1461); splitness is established by the
  concrete Cartan/generator construction here, not inferred from dimension.
  Baez §4.2, Theorem 5, p. 41 is the distinct compact real-form statement.
  The trace-zero module has dimension 27−1=26 by the native trace splitting;
  its irreducibility is a model-specific target using the split root action.
  Use the native cyclic determinant and cubic/trace identities from the
  supplier contract. The extra comparison preserves this actual determinant
  under the Hermitian-matrix/doubling equivalence, with the scalar-extension
  comparison specified in the compact track below (Baez §3.4, p. 32;
  Schafer, 1961 notes, Chapter IV, equations (39)–(42′), pp. 40–41).

  **Checks of the imported determinant.**

  - At diag(1,2,3), det=6 and spur=11; the trace formula gives
    (6³−3·6·14+2·36)/6=6, and the characteristic polynomial is
    t³−6t²+11t−6, zero at 1,2,3.
  - At diag(1,0,0), det=0 and spur=0; A³−A²=0, excluding a constant determinant.
  - Over ℚ the undivided identity is 6·6=36. Over 𝔽₃ the same diagonal
    specializes to diag(1,−1,0), both sides are 0, and division by 6 is
    unavailable; only the undivided identity is consumed there.

  Over ℝ this native carrier remains split. The separate division-octonion
  construction below supplies the formally real compact Albert carrier.
- **The compact real algebra suppliers.** This algebraic sublane of Layer 8 is
  independent of Layers 0–7's representation/classification results and of projective
  geometry. The carrier is native (From Tau Ceti): `TauCeti.CayleyDickson A` is the
  ordered-pair double of a nonassociative ring with involution, with product
  `(a,b)(c,d)=(ac−Star.star(d)b, da+b Star.star(c))`, involution
  `Star.star(a,b)=(Star.star(a),−b)`, its `NonAssocRing` and `StarRing` structures, module
  structure and scalar laws, and `TauCeti.DivisionOctonionReal` is
  `TauCeti.CayleyDickson (Quaternion ℝ)`, of dimension 8. On the double of the quaternions
  over a commutative ring the pin has the norm `N(a,b)=N(a)+N(b)` as a multiplicative map
  (`TauCeti.CayleyDickson.normSq`), the trace `T(a,b)=2 Re(a)` (`TauCeti.CayleyDickson.trace`),
  `x+Star.star x=T(x)•1`, `x·Star.star x=N(x)•1`, the quadratic equation
  `x²=T(x)x−N(x)`, the left and right alternative laws and the flexible law; over a linearly
  ordered field it has positivity of the norm, absence of zero divisors and the inverse
  `Star.star(x)/N(x)` with its cancellation laws; and
  `TauCeti.DivisionOctonionReal.exists_mul_mul_ne` records non-associativity. This convention
  is compared with Baez, *The Octonions*, §2.2, equations (2)–(3) and Propositions 4–5,
  pp. 8–10, by the map (a,b)↦(a,conj(b)). None of this is rebuilt, and no second carrier or
  `Star` is introduced; associativity, `DivisionRing` and `NormedRing` instances are not asserted.
  The existing `TauCeti.Octonion ℝ` Zorn algebra is **split** and is not this carrier.

  The targets on this carrier are what the pin lacks:

  - the three Moufang identities on `TauCeti.CayleyDickson (Quaternion R)` for a commutative
    ring R (the pin has them only for the split `TauCeti.Octonion`), and associativity of
    every subalgebra generated by two elements, including its closure under conjugation;
  - polarization of the norm, and for R=ℝ the normed real vector-space structure with
    `‖x‖²=N(x)`, transported through the explicit equivalence to `WithLp 2 (ℍ×ℍ)`, together
    with smoothness of multiplication, conjugation and inversion on nonzero elements in the
    ordered eight-coordinate Euclidean model;
  - the imaginary part, cross product and 3-form of the next paragraph, the derivation algebra
    and its comparison with infinitesimal automorphisms;
  - `compact_g2_derivation_divisionOctonion`: the derivation algebra
    `TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal` has dimension 14 and
    negative-definite Killing form (Baez §4.1, Theorem 4, p. 37, for the compact group whose
    Lie algebra this is). A route: the complexification below gives dimension 14 from the
    native `TauCeti.Octonion.finrank_derivationLieAlgebra`; every derivation kills 1 and is
    skew for the positive form on the imaginary part, so `ad(D)` is skew for the restricted
    Hilbert–Schmidt form and `Killing(D,D)=−‖ad(D)‖²`, which is negative for D≠0 because the
    centre is zero by faithful complexification.

**The invariant tensors of the division octonions.** Write A for
`TauCeti.DivisionOctonionReal`, with the native product, positive involution, norm N and trace T.
Put `Im(A)=ker T` and `g(v,w)=−Re(vw)` there. Define
`v×w=(vw−wv)/2`, `φ(v,w,z)=g(v×w,z)`, and prove
`vw=−g(v,w)1+v×w`, positive definiteness, the norm identities, and
`u×(u×v)=g(u,v)u−g(u,u)v`, with `dim Im(A)=7`. In dimension seven, do not assert the
three-dimensional vector triple-product formula for three unrelated vectors. Define
`associator(u,v,w)=(uv)w−u(vw)` and prove the full trilinear identity with this exact
sign convention
`(u×v)×w−u×(v×w)=associator(u,v,w)+g(u,v)w−g(v,w)u`. The finite Cayley-frame table is an explicit comparison input, not a
claim deduced from dimension. For a derivation D of the actual
`TauCeti.derivationLieAlgebra ℝ A` carrier, first prove D(1)=0 and prove that
`exp(tD)` preserves multiplication by uniqueness for the linear ODE in the associative
endomorphism algebra. Only after this integration may norm preservation be differentiated. This order supplies
both inclusions between the native derivation Lie algebra and the infinitesimal automorphisms
without presupposing norm preservation for an arbitrary Leibniz map. A trace shortcut would
need an additional trace-to-norm argument: taking traces in `[D,L_x]=L_(Dx)` gives
`tr(L_(Dx))=0`, not `tr(D L_x)=0`.

**Checks.**

- In the split Zorn algebra the idempotent with diagonal entries (1,0) and zero
  vectors is nonzero and has norm 0. In the division double the unit (1,0) has norm 1.
- For x=(i,0), y=(j,0), both (yx)x and y(xx) equal (−j,0); this tests right alternativity.
- With i=(i,0), j=(j,0) and ℓ=(0,1), the native product gives (ij)ℓ=(0,k) while i(jℓ)=(0,−k).
  Thus their sum is 0, and the algebra is not associative.
- For the left Moufang identity `(z x z) y = z (x (z y))` at z=ℓ, x=i, y=j: `ℓ i ℓ = i`
  since `ℓ i = (0,−i)` and `(0,−i)ℓ = (i,0)`, so the left side is `ij = k`; on the right
  `ℓ j = (0,−j)`, `i(0,−j) = (0,−ji) = (0,k)`, and `ℓ(0,k) = (k,0)`. Both sides are k.

**Complex scalar-extension boundary.** Compare this real algebra with the split
Zorn carrier only after explicit scalar extension to ℂ. The target is
`exists_complexified_divisionOctonion_equiv`: a complex-linear equivalence from
`ℂ ⊗[ℝ] TauCeti.DivisionOctonionReal` to `TauCeti.Octonion ℂ` preserving the unit and the
product, on the same multiplication convention. Transport
conjugation complex-linearly (it is not complex conjugation) and transport derivations by
the actual `TauCeti.derivationLieAlgebraCongr` interface. Prove the finite-dimensional
Leibniz-kernel base-change statement needed for the derivation comparison. The existing
split Serre map is only known as a surjection in its stated source; prove the required
isomorphism independently. Complexification does not identify the two real forms.

This algebra sublane is a prerequisite of the late compact `G₂` application in
LieGroups Layer 7, not a conclusion of it. In particular, the positive norm and cross
product are constructed before any compact group, root system, or representation
classification is used.
- **The formally real Albert supplier.** On the division octonions just specified,
  construct the compact Albert algebra, written J below, with scalar diagonal `Fin 3 → ℝ` and cyclic
  off-diagonal `Fin 3 → TauCeti.DivisionOctonionReal` in the same Hermitian positions as native
  `TauCeti.AlbertAlgebra`. Define the Jordan product by the entrywise symmetrization
  `½(AB+BA)`, with each binary octonion product parenthesized; no associative matrix
  ring structure is used. Give `NonAssocCommRing`, `Module ℝ`,
  `SMulCommClass ℝ J J` and `IsScalarTower ℝ J J` on this carrier J.
  Give projection/extensionality, real bilinearity, unit,
  conjugation, `IsCommJordan`, power associativity and trace/trace-zero.
  Define its determinant cubic in the same cyclic layout by
  `det A=a0*a1*a2−a0*N(x0)−a1*N(x1)−a2*N(x2)+T((x0*x1)*x2)`.
  Prove its characteristic and trace-power identities as for the split
  carrier, and give the trace/determinant polarization APIs.
  Prove dimensions 27/26, the positive-definite
  trace form `trace(A∘B)`, formal reality `Σ A_i²=0 → ∀i,A_i=0`, the diagonal
  orthogonal idempotent frame, Peirce decomposition and products, the cubic
  characteristic identity, associativity of the trace form
  `trace((A∘B)∘C)=trace(A∘(B∘C))`, and intrinsic real spectral
  decomposition into orthogonal primitive Jordan idempotents. Prove
  primitive idempotents are exactly the trace-one idempotents, and any
  complete orthogonal primitive frame summing to1 has exactly three
  elements. Prove that
  commutators `[L_A,L_B]` are derivations skew-adjoint for the trace form.
  This algebraic decomposition does not assert automorphism transitivity
  on frames: that geometric theorem belongs to TangentialBordism §§9.1–9.2 (B3.6–B3.7). Supply the fixed 27-coordinate Euclidean topology and smooth
  product/trace/determinant maps, automorphism preservation of trace and the trace
  form, and its native derivation Lie algebra with bracket and trace-zero
  representation. These generic algebra APIs precede classification. The
  complexification/type identification follows this algebraic sublane and
  Layer 8's split-F₄ theorem. Construct the real tensor products
  `ℂ ⊗[ℝ] TauCeti.DivisionOctonionReal` and
  `ℂ ⊗[ℝ] J`. The complex-linear extension of positive real
  conjugation sends `z⊗x` to `z⊗Star.star x`, fixing the complex coefficient;
  this is distinct from tensor `Star.star`, which conjugates the coefficient.
  Consume native
  `Algebra.TensorProduct.instNonAssocRing` and
  `instNonUnitalNonAssocSemiring`, `tmul_mul_tmul`,
  `isScalarTower_right` and `sMulCommClass_right` for their existing
  nonassociative products, units and complex-bilinear interfaces:
  `(z⊗a)(w⊗b)=zw⊗(ab)`. No second multiplication instance is introduced.
  Construct the quadratic form via native `QuadraticForm.baseChange`,
  the trace by linear extension, and define the complexified cubic by
  `((trace A)³−3*trace(A)*trace(A²)+2*trace(A³))/6` on the native
  tensor-product Jordan algebra. Prove its scalar-extension and polarized
  comparisons; no undeclared cubic-form base-change API is presumed.
  Extend octonion conjugation complex-linearly on `ℂ ⊗[ℝ] A`: on a pure tensor the map is `z ⊗ x ↦ z ⊗ Star.star x`, so it fixes the complex coefficient. This is not the default tensor-product `Star.star`, which conjugates that coefficient, and it is not scalar complex conjugation. Construct
  the division-octonion and compact-Albert complexification comparisons as complex-linear, unital,
  product-preserving equivalences to native `TauCeti.Octonion ℂ` and
  `TauCeti.AlbertAlgebra ℂ`, preserving the norm/involution and
  trace/determinant respectively. No associative `Algebra`/`AlgEquiv`
  instance is presumed for these nonassociative products.
  Prove the derivation base change: the complexification of
  `TauCeti.derivationLieAlgebra ℝ J` is the actual
  derivation Lie algebra of the complexified product. Prove this using
  finite-dimensional Leibniz-equation kernels and flat scalar extension,
  including bracket preservation. Consume native
  `TauCeti.derivationLieAlgebraCongr` on the preceding multiplicative
  linear equivalence, then Layer 8's split Albert identification, to
  identify the complexified derivation algebra with the split
  type-F4 complex Lie algebra. Derive dimension 52 and zero real centre of the
  real derivation algebra by faithful
  complexification. Prove skew-adjointness for the trace form of
  every derivation, not just inner commutators: prove
  `trace(L_A)=9 trace(A)` and `[D,L_A]=L_(D A)`; matrix commutator trace
  gives trace(D A)=0, and Leibniz plus the associative trace form gives
  skew-adjointness. Prove that the Killing form of the real derivation algebra is negative definite:
  restrict the positive Hilbert–Schmidt form from the orthogonal
  endomorphisms to the derivation algebra, prove ad(D) skew-adjoint,
  and use zero centre to get `Killing(D,D)=−‖ad(D)‖²<0` for D≠0.
  These named algebraic results give the compact real type-F4 Lie algebra
  without any projective transitivity or an undefined complex F4 group.
  Do not identify the split and division real forms.
  The fixed-carrier trace-one-idempotent geometry,
  its compact automorphism group and F4/Spin9 projective-plane comparison belong to
  [TangentialBordism §9.1 (B3.6)](../../TangentialBordism/README.md#91-idempotent-cayley-plane-b36) and
  [§9.2 (B3.7)](../../TangentialBordism/README.md#92-compact-automorphisms-and-spin-isotropy-b37).

  **Checks.**

  - The diagonal element diag(1,2,3) with zero off-diagonal entries has
    determinant 6 and trace 6, and its square has trace 14.
  - With diagonal (3,1,1), off-diagonal x₁=1 and x₀=x₂=0 in the cyclic layout,
    the determinant is 3·1·1 − 1·N(1) = 2; omitting the norm terms gives 3.
  - `trace(A∘A) = Σ a_i² + 2 Σ N(x_i)`. On the compact carrier this vanishes only
    at A=0. On the split carrier the element with zero diagonal and x₀ the
    nonzero Zorn idempotent of norm 0 gives trace(A∘A)=0 with A≠0, so positive
    definiteness and formal reality need the division octonions.
  - Under the complex-linear extension of conjugation, `i⊗1` is fixed, whereas
    the tensor-product `Star.star` sends it to `−i⊗1`.

  **Complexification APIs.** Write C_A=ℂ⊗[ℝ]A for each real algebra A above.
  Keep the following maps separate; their formulas are derived scalar-extension
  adapters to the Cayley–Dickson product and Albert cubic (Baez, §2.2,
  pp. 8–10, and §3.4, p. 32, with the cyclic layout fixed above).

  - Complex-linear octonion conjugation C_A→C_A sends z⊗a to z⊗ā;
    it is involutive, reverses products, and fixes scalars.
  - The extended norm C_A→ℂ and trace C_A→ℂ satisfy N(z⊗a)=z²N(a)
    and T(z⊗a)=zT(a), with their polarized forms obtained by scalar extension.
  - The complex Albert cubic C_J→ℂ is homogeneous of degree three, satisfies
    det(z⊗A)=z³det(A), and agrees with the displayed trace-power expression.
  - The octonion equivalence C_A→TauCeti.Octonion ℂ and the Albert equivalence
    C_J→TauCeti.AlbertAlgebra ℂ preserve products and units and have complex-linear
    inverses. The Albert map is the diagonal-identity and entrywise octonion map
    in the cyclic layout, so it also preserves the specified frame, trace and cubic.

  **Checks for complex-linear octonion conjugation.**

  - It sends 1⊗1 to 1⊗1, and sends 1⊗u to −1⊗u for a quaternion unit u.
  - For quaternion units u,v with uv=w, conjugation sends 1⊗(uv) to −1⊗w,
    equal to (1⊗v̄)(1⊗ū), whereas the unreversed product is 1⊗w.
  - It fixes i⊗1; coefficient conjugation would give −i⊗1.

  **Checks for the extended norm.**

  - N(1⊗1)=1, excluding the zero form.
  - N(i⊗1)=−1; this is a complex quadratic form, not a positive Hermitian norm.
  - For u²=−1 and T(u)=0, N(1⊗1+i⊗u)=1+i²=0 although the vector is nonzero;
    positivity is a real-form assertion.

  **Checks for the extended trace.**

  - On octonions, T(1⊗1)=2 and T(i⊗1)=2i, excluding conjugate-linearity.
  - T(1⊗u)=0 for a pure quaternion unit u, so trace is not norm (which is 1 there).
  - On the Albert algebra, trace(i⊗diag(1,2,3))=6i and trace(1⊗E₀₀)=1;
    the octonion factor 2 does not belong in Jordan trace.

  **Checks for the complex cubic.**

  - At diag(1,2,3), the trace powers are 6,14,36, and
    (6³−3·6·14+2·36)/6=6.
  - At i⊗diag(1,2,3), homogeneity gives −6i, not 6i or 6.
  - At E₀₀ the trace powers are 1,1,1 and the cubic is (1−3+2)/6=0;
    at the unit they are 3,3,3 and the cubic is (27−27+6)/6=1.

  **Checks for the octonion complexification equivalence.** Let U,V,W be the
  images of 1⊗u,1⊗v,1⊗w for quaternion units uv=w.

  - The unit and i⊗1 map to 1 and i·1, respectively; a scalar conjugation fails.
  - UV=W and VU=−W, so [U,V]=2W≠0; a commutative or opposite-product map fails.
  - U²=−1 and the transported involution sends U to −U but fixes i·1;
    the split real algebra cannot be substituted before extending scalars.

  **Checks for the Albert complexification equivalence.** Put B=E₀₁+E₁₀
  and C=E₁₂+E₂₁ in its real scalar-matrix Jordan subalgebra.

  - The unit maps to the unit, with trace 3 and determinant 1; each Eᵢᵢ
    maps to the same frame idempotent, excluding a permuted unmarked frame.
  - B∘C=(E₀₂+E₂₀)/2 on both sides; ordinary matrix multiplication gives E₀₂
    and fails the Jordan-product equation.
  - i⊗B maps to i times the image of B, whose square is −(E₀₀+E₁₁);
    its trace is −2, fixing complex bilinearity and the product normalization.

  *Needs:* the real products, trace and cubic above; native nonassociative tensor
  multiplication and quadratic base change; the complex octonion comparison
  before the entrywise Albert comparison. The compact exceptional group plays no role.

  **Derivation comparison API.** For either finite-dimensional real algebra A,
  the base-change map ℂ⊗Der_ℝ(A)→Der_ℂ(C_A) sends z⊗D to the endomorphism
  w⊗a↦zw⊗D(a). Prove its bijectivity by scalar extension of the Leibniz kernel,
  its bracket equation and compatibility with composition of scalar extensions.
  For the product-preserving equivalence e:C_A→A_split, use native
  TauCeti.derivationLieAlgebraCongr, whose evaluation is D↦e∘D∘e⁻¹.
  The final map to the split Serre algebra is the composite with Layer 8's
  identification; its inverse and bracket law are the composite ones.

  **Checks for derivation base change.** In the scalar-matrix Jordan subalgebra
  put A=E₀₀, B=E₀₁+E₁₀, and D=[L_A,L_B].

  - Every extended derivation kills 1; D(A)=−B/4≠0, so the zero map fails.
  - The image of i⊗D sends 1⊗A to −i⊗B/4; conjugating the coefficient gives
    the wrong sign +i⊗B/4.
  - Put D₁₂=[L_(E₁₁),L_(E₁₂+E₂₁)]. Then [D,D₁₂](A)=−(E₀₂+E₂₀)/16;
    after extension the commutator has exactly the same value, not its negative.

  **Checks for derivation transport through e.**

  - Transported D kills e(1)=1 and sends e(A) to −e(B)/4, preserving a nonzero action.
  - Transported iD sends e(A) to −i e(B)/4, excluding a conjugate-linear map.
  - The transported commutator sends e(A) to −e(E₀₂+E₂₀)/16; the inverse
    transport recovers −(E₀₂+E₂₀)/16.

  **Checks for the final type-F₄ comparison.** Denote its image of 1⊗D by d
  and that of 1⊗D₁₂ by d₁₂; use the transported 27-dimensional representation.

  - d acts on the image of A as −B/4, so d≠0 and the comparison is not the zero map.
  - i d acts on that vector as −i B/4; its action on the unit vector is 0.
  - [d,d₁₂] acts on that vector as −(E₀₂+E₂₀)/16, agreeing with both
    preceding comparisons. The source and target have complex dimension 52.

  *Needs:* finite-dimensional Leibniz kernels and flat scalar extension for base
  change; the product-preserving equivalence for transport; Layer 8's split F₄
  identification only for the final type comparison.

  *Needs:* the division octonions above; native `TauCeti.AlbertAlgebra` layout,
  `TauCeti.derivationLieAlgebra` and `TauCeti.derivationLieAlgebraCongr`;
  Mathlib `Algebra.TensorProduct` and `QuadraticForm.baseChange`; Layer 8's
  split F4 identification for the complexified compact Albert derivation algebra.
- **The `E`-series `E₆, E₇, E₈`, as explicit constructions.** Two different constructions produce these,
  and the roadmap keeps them apart rather than conflating them:
    - **The Vinberg `ℤ/3`-model of split `E₈`.** `𝔢₈ = 𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*` of dimension
      `248 = 80 + 84 + 84` (consume `LieAlgebra.SpecialLinear.sl (Fin 9) K`, `exteriorPower`,
      `⋀[K]^3 (Fin 9 → K)`), a `ℤ/3`-graded Lie algebra whose bracket pairs the exterior summands into
      `𝔰𝔩₉`. This is one concrete construction of split `E₈`; it is **not** the Freudenthal-Tits magic
      square built from a pair of composition algebras. The complex graded decomposition
      is Garibaldi, *E₈, the most exceptional group*, arXiv:1605.01721v1, §4,
      Example 4.4, p. 9 (GaribaldiE8 line 382). This is a module decomposition
      until the bracket and its normalization have been constructed.
    - **`E₆` and `E₇` as their own carriers.** `E₆` (dimension `78`, with its `27`-dimensional
      representation `J`) and `E₇` (dimension `133`, with its `56`-dimensional representation from the
      Freudenthal triple system on `J`) each need an **explicit carrier and bracket**, not merely a
      dimension count. Use the Tits construction on split composition algebras
      and the split Albert algebra, keeping the two bracketed carriers distinct;
      they are not summands of the `sl₉ ⊕ Λ³ ⊕ Λ³*` model. Baez §4.3,
      pp. 42–44 gives the magic-square construction; §4.4, Theorem 6, pp. 45–46
      gives the E₆ models and 52+26=78, and §4.5, Theorem 7, pp. 47–48 gives
      the E₇ models and 52+3·27=133. Those statements concern compact real
      forms and their complexifications, not an identification of every real form.
      The Freudenthal representation has carrier K⊕K⊕J⊕J*, of dimension
      2+27+27=56, with the trace pairing identifying J and J*; the complex
      background is Baez §4.5, p. 48.
      For the `E₇` 56-dimensional representation, consume the native integral `TauCeti.E7Minuscule` weight table,
      `cartanMatrix`, `raisingMatrix`, `loweringMatrix`, `isSerreSystem` and
      `serreRepresentation` in `TauCeti/Algebra/Lie/E7/Minuscule/Basic.lean`. After
      entrywise `ℤ→K` scalar extension and the explicit Cartan-index comparison, prove
      that the Freudenthal model's generator action is intertwined with this actual
      native 56-dimensional representation. The invariant symplectic/quartic-form
      comparisons and the 133-dimensional algebra/bracket identification remain
      concrete targets here; the native matrix representation alone does not supply them.
  Build each, prove its dimension and Killing-simplicity of the stated type, and identify it with the
  split `LieAlgebra.e₆`, `e₇`, `e₈ K` via Layer 7. The **fundamental representations** `27` for `E₆`,
  `56` for `E₇`, and the adjoint `248` for `E₈` are the smallest nontrivial ones.
  Their algebra-dimension headlines are `finrank_e6_e7` and `finrank_e8`.

  **Split-field comparison route.** Construct the split models first over ℚ:
  Zorn coordinates, split composition algebras and the split Albert product for
  G₂/F₄/E₆/E₇, and the volume form on ℚ⁹ for E₈. Fix all bracket maps and
  scalings over ℚ. Prove their Jacobi identities, exhibit a rational split
  Cartan, and give rational simple-root generators with the normalized
  Serre relations and generation of the entire carrier. The root-space
  calculation gives ranks plus root counts 2+12=14, 4+48=52, 6+72=78,
  7+126=133 and 8+240=248; use RootSystems Layers 1–6 for these finite root
  systems and Layer 7 for the presentation isomorphism. The literature's
  complex models above identify the intended type and bracket, but the
  rational Cartan/generator equations are owned inputs here. Extend this
  actual rational map along ℚ→K; its inverse extends too. For derivation
  carriers, identify scalar extension with the finite-dimensional Leibniz
  kernel, as in the base-change target above. This route proves the stated
  results for every characteristic-zero K without assuming K embeds into ℂ.

  **Checks of forms and dimensions.**

  - The split real Zorn norm vanishes at the nonzero diagonal idempotent
    with entries (1,0), whereas the division norm is 1 at the identity and strictly positive
    on every nonzero vector;
    equal dimension 8 does not identify these algebras over ℝ.
  - Derivations have dimensions 14 and 52 on the split models; compact
    derivations have the same dimensions but negative-definite Killing form,
    whereas a nonzero split coroot has positive Killing square over ℝ.
    The real-form comparison is made only after complexification.
  - The E-series dimensions are 52+26=78, 52+81=133 and
    (9²−1)+2·binom(9,3)=80+168=248, agreeing with rank plus root count.
    Replacing Λ³(K⁹) by Λ²(K⁹) would give 80+72=152 and fails.

### Examples

The native dimensions are 8, 8+3+3=14, 3+3·8=27 and 26; the E8 model has 80+84+84=248 dimensions.

### Dependencies

*Needs:* native split octonion and Albert products; Layer 7 for split-type identification; quaternion algebra for the independent compact real track.

## Layer 9: reductive Lie algebras and `gl_n`

The layers above fix a Killing-semisimple `L`. `gl_n` is **reductive, not semisimple**: its Killing
form is degenerate and its centre is the scalar matrices, so none of the `IsKilling` machinery
applies to it directly. This layer supplies the Lie-algebra-level `gl_n` theory.
For its polynomial comparison consume the native differentiation of rational
`GL_n(ℂ)`-representations, with its stable-subspace and intertwiner dictionaries, and the
native rational Weyl modules (From Tau Ceti), whose group-level theory is
[ClassicalGroups Layers 2–4](../ClassicalGroups/README.md). This layer is that theory, under the
conventions of the reductive standing-conventions bullet (Mathlib's `HasCentralRadical` as the
unbundled reductivity hypothesis, the trace form as the invariant form, the matrix-unit positive
system). It is independent of Layer 8.

### 9.1 Reductive irreducibles, differentiation and the Littlewood–Richardson application

- **Reconstruction for reductive irreducibles.** Complete reducibility of a finite-dimensional
  module of a reductive Lie algebra on which every central element acts semisimply is native:
  `TauCeti.exists_isCompl_of_forall_center_lie_eq_smul` when the centre acts by scalars, over
  any characteristic-zero field, and
  `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center` when the central action is
  triangularizable with every central operator semisimple
  (`TauCeti/Algebra/Lie/Reductive/CompleteReducibility.lean`). The target here is the
  reconstruction. Over an algebraically closed characteristic-zero field and a
  finite-dimensional reductive L, prove that sending an irreducible finite-dimensional
  L-module to the pair of its restriction to the derived ideal and its central weight is a
  bijection from equivalence classes of such modules onto pairs of an equivalence class of
  irreducible finite-dimensional modules of the derived ideal and a linear functional on the
  centre. The functional has no integrality condition. This is a derived statement with no
  source claim beyond the splitting of a reductive algebra into its centre and a semisimple
  ideal (Etingof, *Lie Groups and Lie Algebras I & II*, Corollary 18.8, p. 99): the restriction
  is irreducible by `TauCeti.isIrreducible_restrict_derivedSeries`, the centre acts by
  `TauCeti.exists_centralWeight_of_isIrreducible`, injectivity is
  `TauCeti.lieModuleEquivOfCenterOfDerivedSeries`, and for surjectivity the module of the derived
  ideal is extended along the projection of `TauCeti.isCompl_center_derivedSeries` with the
  centre acting by the given functional.

  **Checks.**

  - For the abelian Lie algebra K the derived ideal is 0, the irreducibles are the
    one-dimensional modules on which 1 acts by a scalar c, and the pair is (trivial, c): two
    different scalars give inequivalent modules, so the functional cannot be dropped.
  - A nilpotent two-by-two Jordan block for the abelian Lie algebra K has an invariant kernel
    without an invariant complement, so the central semisimplicity hypothesis of the native
    complete-reducibility theorem cannot be omitted; this module is not irreducible and is
    outside the reconstruction.
  - For `gl₂` the pair of the standard module is (V(1), the central weight with value 1 on the
    identity matrix) and that of the determinant character is (V(0), value 2); both restrict to
    irreducibles of `sl₂` and are separated from their twists by the central value.

  *Needs:* native reductive center/derived splitting, irreducible restriction, central weight
  and the equivalence criterion `TauCeti.lieModuleEquivOfCenterOfDerivedSeries`.

- **The diagonal Cartan and `gl_n` weights.** `diagonalCartan n`, a Cartan subalgebra of `gl_n`;
  weights are `n`-tuples via `μ ↦ (A ↦ Σᵢ μᵢ Aᵢᵢ)` (glWeightEquiv); **dominance is a condition on
  differences** (`TauCeti.IsGlDominantIntegral`: consecutive differences in `ℕ`, entries free in `K`), and a
  **highest weight vector** is a simultaneous eigenvector of the diagonal killed by the strict upper
  triangle (`TauCeti.IsGlHighestWeightVector`). The staircase `ν = (N - 1/2, …, 1/2)` is dominant with no
  integer entry.
- **The `gl_n` Pieri rule and the single-weight criterion.** The **dual-standard Pieri rule** is
  native, `TauCeti.gl_dual_standard_pieri` (`TauCeti/Algebra/Lie/GeneralLinear/Pieri.lean`, over an
  algebraically closed characteristic-zero field), with formula `V* ⊗ L(μ) ≅ ⊕_t L(μ - ε_t)` over the `t` with `μ - ε_t` dominant, multiplicity one (the standard
  module is Mathlib's `Fin n → K` instance, `ε_t = Pi.single t 1`; the `V ⊗ L(μ)` mirror is not
  separately pinned). The **single-weight isotypic criterion** at the `gl` level is native as
  well (`TauCeti/Algebra/Lie/GeneralLinear/Isotypic.lean`): over an algebraically closed field, a
  finite-dimensional module all of whose highest weight vectors have weight `μ` is isotypic
  (`TauCeti.isIsotypic_of_forall_isGlHighestWeightVector`), and when it is completely reducible
  it is a direct sum of copies of `glIrreducible N μ`
  (`TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_of_forall_isGlHighestWeightVector`).
  Complete reducibility holds when the identity matrix acts by a scalar
  (`TauCeti.complementedLattice_lieSubmodule_gl_of_forall_one_lie_eq_smul`,
  `GeneralLinear/CompleteReducibility.lean`). The hypothesis is essential: for `gl₁`, a nonzero
  nilpotent two-by-two Jordan block has only highest weight `0` but has no invariant complement
  to its kernel. Neither statement is a target here.
- **The dictionary to the group level.** The `DominantWeight n` of
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) (weakly decreasing integer tuples)
  sits inside `TauCeti.IsGlDominantIntegral` as the integer-coordinate weights. Changing
  such a tuple by `m · (1, …, 1)`, `m∈ℤ`, is the visible determinant twist.
  The Lie condition also permits shifts by arbitrary `c∈K`; such weights need
  not integrate to rational group representations.
- **Differentiation and the Littlewood–Richardson multiplicities.** The differentiation bridge
  from rational `GL_n(ℂ)`-representations to `gl_n(ℂ)`-modules is native (From Tau Ceti):
  `TauCeti.IsRationalRep.differential` with its tensor rule `differential_tprod`, the
  equivalence of stable subspaces and of intertwiners with their differentiated counterparts,
  preservation of irreducibility, the passage from group highest-weight vectors to Lie
  highest-weight vectors, and the identification of the differentiated rational Weyl module of
  a dominant integer weight λ with `glIrreducible n λ`
  (`TauCeti.nonempty_lieModuleEquiv_rationalWeylRep_glIrreducible`), also for tensor products
  (`TauCeti.nonempty_lieModuleEquiv_tprod_rationalWeylRep_glIrreducible`). The decomposition of
  a tensor product of rational Weyl modules indexed by Yamanouchi tableaux is native
  (`TauCeti.nonempty_equiv_tprod_rationalWeylRep`), and so are the tableau carrier
  `TauCeti.LRTableau`, its finiteness and the product rule
  `TauCeti.diagramSchurPoly_mul_diagramSchurPoly_eq_sum_natCard_lrTableau`. None of these is
  rebuilt here.

  The target is `isotypicMultiplicity_tensor_glIrreducible_eq_card_lrTableau`: for Young
  diagrams λ, μ, ν with at most n rows, read as weights of `gl_n(ℂ)` by their row lengths, the
  native multiplicity `LieModule.isotypicMultiplicity` of `glIrreducible n ν` in
  `glIrreducible n λ ⊗ glIrreducible n μ` is `Nat.card (LRTableau λ ν μ)`, the number of
  Littlewood–Richardson tableaux of shape ν/λ and content μ. The count is zero unless λ is
  contained in ν and `|ν|=|λ|+|μ|`, the central identity-matrix weight; shapes with more than n
  rows are excluded by hypothesis, their Schur polynomials vanishing in n variables. A route:
  differentiate the native group decomposition, identify each summand by the native
  differentiated Weyl module, transport the Yamanouchi index to `LRTableau` by the native
  bijection of `TauCeti/Combinatorics/Young/LittlewoodRichardson/Yamanouchi.lean`, and count
  morphisms by Schur's lemma. For general dominant integer weights the statement follows by a
  determinant twist, which shifts all three weights and leaves the count unchanged.

**Checks.**

- For λ=μ=(1) and n=2, the LR counts of ν=(2) and ν=(1,1) are both 1, the standard module
  squared is `L(2,0)⊕L(1,1)`, and the dimensions are 2·2=3+1.
- For n=1 the shape (1,1) has two rows and is excluded; the remaining count 1 at ν=(2) matches
  `L(1)⊗L(1)=L(2)` for `gl₁`, of dimension 1. Counting (1,1) with its tableau would give 2.
- For empty λ the unique tableau has shape ν and content μ only when ν=μ, matching
  `L(0)⊗L(μ)=L(μ)`; a failed containment or size sum has count 0. For n=0 all three diagrams
  are empty, the Lie algebra is 0, and both sides are 1.

*Needs:* the native differentiation, Weyl-module and tableau contracts (From Tau Ceti);
Schur's lemma over ℂ and native complete reducibility of the differentiated modules.

### 9.2 Reductive enveloping centers and the actual invariant maps

Work first over a characteristic-zero field K with a finite-dimensional reductive
Lie algebra L, using this layer's actual central/derived splitting
`e:L≃ₗ⁅K⁆z(L)×[L,L]`. The center factor is abelian. The map `productEnveloping` uses native
`TauCeti.UniversalEnvelopingAlgebra.mapEquiv`, `prodEquivTensor` and
`symmetricAlgebraEquiv`; do not reconstruct their generic engines. Compose them
to construct the actual algebra equivalence
`U(L)≃Sym(z(L))⊗U([L,L])`. On a generator, its value is
`ι_z(pr_z x)⊗1+1⊗ι_der(pr_der x)`, and the inverse multiplies the two
inclusions. Export these equations, factor inclusions, inverse equations,
naturality for splitting-preserving Lie maps, and forward/inverse PBW filtration
compatibility with the total tensor filtration. The construction of this algebra
equivalence uses universal properties and does not assume the HC theorem.

Restrict this actual map to the center. Consume Mathlib's
`Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct`, the
commutativity of the symmetric factor and tensor injectivity over K. Prove that
`id⊗center.val` is injective and that its range is exactly the tensor algebra's
center: commute with the right-factor generators to obtain central coefficients
in a basis of the left factor; the left factor already commutes with everything.
Prove `exists_productCenterEquiv` on an abelian direct-product factor; transport it
through the specified splitting to obtain `Z(U(L))≃Sym(z(L))⊗Z(U([L,L]))` with its inclusion square and pure-tensor formula,
not just an equality of dimensions or a linear bijection. This center-factor
argument also applies to an explicitly supplied product with any abelian factor;
it uses no classification or algebraic closure. The reductive decomposition
itself has the finite-dimensional characteristic-zero hypotheses of this layer.
For the zero Lie algebra both enveloping and symmetric algebras are K and these
maps are the scalar/unit identifications.

For the HC and Chevalley refinements now assume K algebraically closed, retain
a chosen Cartan H_s and positive base for the semisimple derived algebra, and
put `H=z(L)×H_s` through the specified splitting. The Weyl group fixes z(L).
Tensor the derived algebra's native **raw** HC isomorphism `TauCeti.harishChandraIso` with the identity on
`Sym(z(L))`. Its PBW projection is zero on the two nilradicals and identity on
the whole H, including its center. Extend rho by zero on z(L); its translation
has no central shift. Export the full reductive raw/dot and translated/ordinary
algebra isomorphisms, both filtration directions, central-character evaluations
and their diagrams with the tensor center map. The derived HC theorem, not an
application of `IsKilling` to L, is the input. Keep the central weight functional
arbitrary at the Lie-algebra level. Tensor the native Lie–Chevalley
restriction `LieSubalgebra.lieChevalleyRestrictionIso` with the central symmetric algebra and prove the actual restriction
square and degreewise compatibility; invariants of this fixed central factor are
all its polynomials. Finite bases degree by degree justify passage through the
invariant subspaces, not an unproved invariants/base-change assertion.

**Connected groups and the three different center comparisons.** For a smooth
connected affine reductive algebraic group G over algebraically closed
characteristic-zero K, construct its actual adjoint actions on L, its symmetric
algebra and U(L), using the induced enveloping maps and native PBW functoriality.
Each symmetric degree and each PBW step is a finite-dimensional rational
G-module. Own the finite-dimensional rational comparison at this cut: a vector
is G-fixed iff its differential is zero. Prove it from the closed stabilizer,
its tangent/kernel comparison and the characteristic-zero Cartier smoothness
comparison explicitly constructed in [ReductiveGroups Layer5P](../../ReductiveGroups/README.md#layer-5p-the-shared-polynomial-unipotent-exponential-and-logarithm), using its coordinate-Hopf/invariant-derivation argument
and Layer2 tangent smoothness criteria. Only that generic closed-subgroup
smoothness cut is consumed, not the unipotent functions or later Bruhat
application. Equality of Lie algebras plus connectedness gives the whole G.
These constructions include the actual action on each finite piece and its
compatibility with the inclusions. In characteristic p a weight-p character of
G_m has zero differential and is not trivial; for disconnected groups the
component action also remains. Neither case is covered by this equality.

Apply that comparison to obtain `U(L)^G=Z(U(L))` by commuting with every canonical
Lie generator, and `Sym(L)^G=Sym(L)^L`. Separate the following maps:

- Layer 7 equivariant PBW symmetrization restricts to a **linear** equivalence
  between invariant symmetric tensors and the center, with all product words
  averaged by `1/m!`; it is not asserted multiplicative on invariant tensors.
- Its leading symbols give the canonical graded-algebra identification
  `gr Z(U(L))≃Sym(L)^G`, with the actual center filtration and symbol equations.
- The chosen reductive HC isomorphism followed by inverse actual Chevalley
  restriction gives an algebra isomorphism from the center to invariant
  polynomials. Its Cartan/positive-base and rho translation conventions are
  retained; it is not relabeled as ordinary symmetrization or as an unspecified
  canonical equality. No Duflo construction is required as a premise.

[CharacteristicClasses C5](../../CharacteristicClasses/README.md#c5-compact-lie-restriction-and-universal-rational-rings) remains the owner of the compact real-group
infinitesimal-invariant comparison, geometric Cartan/root transport and real
coefficient descent. Use that contract when specializing this diagram to compact
real forms; do not add another compact Chevalley or Chern–Weil engine here.
The connected algebraic PBW-piece comparison above has no compact form, C5
cohomology, Borel–Weil, affine oper or invariant-evaluation theorem as a premise.

### 9.3 The normalized product map

Define `productEnveloping` by composing the native enveloping-product equivalence
with the inverse abelian enveloping comparison. Its coefficients form an arbitrary
field and the first Lie factor is abelian; neither finite dimensionality nor
algebraic closure is required. Prove `exists_productCenterEquiv` with its inclusion
square (Dixmier, *Enveloping Algebras*, §1.6, for the reductive specialization).

- Prove the generator equation (z,s)↦z⊗1+1⊗s and the inverse product formula.
- Preserve units and algebra operations, and prove naturality for maps of each factor.
- Identify the center through the actual tensor inclusion, retaining the order of factors.

**Checks.**

- For Z=S=0 the map is K≃K⊗K, and 1 maps to 1⊗1.
- For Z=K abelian and S=0, the degree-one generator maps to t⊗1, not 0.
- For Z=K and S=sl₂, a scalar-direction generator maps to t⊗1 and the quadratic
  Casimir from S maps to 1⊗C; the center is K[t]⊗K[C].

*Needs:* native product, abelian and functorial enveloping equivalences;
Mathlib tensor injectivity over a field and the include-right centralizer theorem.

**Matrices and trace duality.** Specialize to `gl_n(K)=Matrix (Fin n) (Fin n) K`.
Consume native center/derived theorems in `GeneralLinear.Basic` and
`TauCeti.traceBilinForm`, its nondegeneracy and Lie invariance in
`GeneralLinear.TraceForm`. The actual invariant pairing is
`B(A,B)=tr(AB)`, with dual matrix units E_ij and E_ji. Construct the
finite-dimensional equivalence `A↦(B↦tr(AB))` and its inverse, prove conjugation/
coadjoint equivariance, and transport the symmetric-algebra restriction square.
Polynomial functions on L* are `Sym(L)` through evaluation into the double dual;
polynomial functions on L are `Sym(L*)`. These are different carriers until the
specified trace equivalence relates them. Do not use the degenerate gl_n Killing
form for this identification.

For n>0 the scalar coordinate is `c(A)=tr(A)/n`, the scalar projection is
`c(A)I`, and the derived projection is `A−c(A)I`. Prove both composite identities,
bracket preservation and trace zero using invertibility of n. Thus
`Z(U(gl_n))≃K[t]⊗Z(U(sl_n))`, where the central variable maps to `ι(I)`.
Under trace duality the symbol of `ι(I)` is the function `A↦tr(A)=σ₁(A)`,
whereas the coefficient of I in the central projection is `tr(A)/n`. Export
this factor-n comparison instead of conflating the two coordinates.
For general characteristic the splitting requires n invertible; when p divides
n the identity is trace-zero and this decomposition cannot be imported. The
HC conclusions here continue to require characteristic zero. For n=0 the matrix
Lie algebra, center and derived algebra are zero, so its center is K with no
central polynomial variable. For n=1 the derived algebra is zero and the center
is K[t]. Prove these maps separately rather than dividing by zero or invoking
nonzero semisimple rank.

Over algebraically closed characteristic-zero K, construct restriction of the
actual conjugation-invariant polynomial functions to diagonal matrices. For
n≥2 the nonzero discriminant locus is a dense open of diagonalizable matrices,
so restriction is injective. Permutation conjugation makes its image symmetric;
the elementary characteristic coefficients supply the inverse by the fundamental
symmetric-polynomial theorem. Treat n=0 and1 directly. Export the full algebra
maps, their generator evaluations, both inverse identities and homogeneous
filtrations: gl_n has generators of degrees1,…,n, whereas sl_n has trace zero
and generators of degrees2,…,n. Compose these actual maps with the reductive HC
and trace squares. The three comparisons are respectively linear, graded algebraic and filtered
algebraic (Etingof, arXiv:2401.01446v2, Theorem 13.5 and its proof, p. 69;
Theorem 14.1(iv)–(v), pp. 70–71; Example 10.3, pp. 52–53).

`productEnveloping` fixes the native product map; `exists_productCenterEquiv`
states the center equivalence with its inclusion square.

---

### Examples

For gl₂ at μ=(3/2,1/2), the trace Casimir scalar is 15/4−1/4=7/2; at μ=0 only the dual-standard dominant summand survives.

### Dependencies

*Needs:* native reductive splitting, general-linear modules and the dual-standard Pieri rule `TauCeti.gl_dual_standard_pieri`; Layers 6–7; ReductiveGroups Layers 2 and 5P; the native differentiation and Littlewood–Richardson tableau contracts (From Tau Ceti).

## Layer 10: affine Weyl geometry and the coweight quotient

This layer consumes the finite root geometry and classification of
[RootSystems](../RootSystems/README.md), the native affine and extended affine Weyl groups with
the fundamental alcove and coweight lattice, and the integral weight lattice and Weyl action on the
native integral-weight carrier. It adds the comparison of those lattices with an integral root
datum, the isomorphism `Ω ≃ P∨/Q∨`, point orbits and stabilizers on the closed alcove, the quotient
topology and the affine diagram automorphisms. It does not consume a compact Lie group, a compact
torus, or a period theorem.

### 10.1 The integral lattice comparison and the affine Weyl action

Write P for the native `TauCeti.integralWeightLattice H`, a ℤ-submodule
of `Module.Dual K H`, with the Weyl action; do not use the ambient `K`-dual as though every
element were integral. Construct the based root-datum comparison from this `P` to the actual
character lattice, preserving roots, coroot pairings, and the Weyl action. For the simply connected
finite-type datum this identifies `P` with its character lattice `X_sc`. For another semisimple
isogeny form retain its actual intermediate lattice `Q ⊆ X ⊆ P`; do not assert `X ≃ P` (for example,
adjoint type A₁ has `X=2ℤω`). This layer constructs the based-datum comparison, distinct from the native
lattice construction and from a compact character-lattice comparison; it cannot
be inferred from the type classification alone.

For the affine construction retain an actual integral root datum `D : RootDatum ι X Y` with
`Module.Finite ℤ X`, `Module.Free ℤ X`, and the corresponding properties on `Y`. Form its rational
scalar extension on `ℚ ⊗[ℤ] X` and `ℚ ⊗[ℤ] Y`, carrying each actual indexed root and coroot
by `x ↦ 1⊗x`. Native `TensorProduct.leftModule` supplies the extension-scalar actions.
The tensor flip compares this with the right-factor models `X ⊗[ℤ] ℚ` and `Y ⊗[ℤ] ℚ`;
transport the scalar actions along that flip when using those models. Prove the induced rational pairing is perfect, crystallographic, reduced, irreducible, and
spans both rational spaces. Root-system irreducibility and spanning are hypotheses on this rational
pairing: the integral `IsRootSystem`/`IsIrreducible` mixins are too strong for a non-unimodular root
datum and do not express the intended semisimple condition. Keep the integral root datum, its maps,
and its actual lattice data as the source of the construction. Carry finite-free hypotheses on both lattices and finite root indices
explicitly in every rationalization and affine-construction theorem.
Use the actual finite root index set of the datum (for the native `DynkinType` datum, `Fin t.numRoots`, not `Fin t.rank`).

The affine engine is native and is consumed, not rebuilt (From Tau Ceti). For a root pairing
`P : RootPairing ι R M N` over a linearly ordered field R, with finite nonempty index set,
crystallographic, reduced and irreducible, and a base b, the affine space is the coweight space N.
The coweight lattice `P∨` is `RootPairing.coweightLattice` (the points at which every root is
integral), the coroot lattice `Q∨` is `P.corootSpan ℤ`, and `RootPairing.toDualRootSpan` compares
N with the dual of the root span; for an integral root datum whose roots and coroots span up
to torsion, `Hom_ℤ(Q,ℤ)/Q∨` is finite (`RootPairing.finite_quotient_corootSpan_map`). The open
fundamental alcove

`A = {x ∈ N | αᵢ(x) > 0 for every αᵢ ∈ Δ, and θ(x) < 1}`

is `RootPairing.fundamentalAlcove`, with θ the highest root `b.highestRoot`; its affine walls
have functions `αᵢ` and `α₀ = 1 − θ` (`RootPairing.Base.affineSimpleRoot`). The affine
reflections are `RootPairing.affineCoreflection`, the affine Weyl group `W_aff = Q∨ ⋊ W` is
`RootPairing.affineWeylGroup` with `RootPairing.mem_affineWeylGroup_iff`, and over an Archimedean
field it acts simply transitively on alcoves
(`RootPairing.existsUnique_mem_affineWeylGroup_preimage_fundamentalAlcove_eq`). The extended
affine Weyl group `W_ext = P∨ ⋊ W` is `RootPairing.extendedAffineWeylGroup`,
`Ω = Stab_{W_ext}(A)` is `RootPairing.fundamentalAlcoveStabilizer`, the homomorphism
`Ω → P∨/Q∨` is `RootPairing.fundamentalAlcoveStabilizerToQuotient`, which is onto with kernel
`Ω ∩ W_aff`, `W_ext = W_aff ⊔ Ω`, and the action of Ω on the affine simple walls preserves the
affine Cartan matrix (`RootPairing.fundamentalAlcoveStabilizerToPerm_mem_matrixSymmetryGroup`).
The literature statements are Garnier, *Fundamental domains for extended affine Weyl
groups* (23 October 2020), Theorems 1.3.2 and 1.3.5, p. 5; the length-zero
representatives are §2.2 and Proposition-Definition 2.2.1, pp. 7–8.

The targets of this subsection are what the native engine does not state.

- Prove that `Ω → P∨/Q∨` is injective: an element of the kernel lies in `W_aff` and stabilizes
  the nonempty alcove, so it is the identity by native freeness on alcoves
  (`RootPairing.eq_one_of_mem_affineWeylGroup_of_mapsTo`, `RootPairing.fundamentalAlcove_nonempty`).
  With native surjectivity over an Archimedean field this is the isomorphism `Ω ≃ P∨/Q∨`.
  Deduce `W_ext = W_aff ⋊ Ω` through actual multiplication and inverse maps. Ω is the
  length-zero subgroup; a general element of `W_ext` does not stabilize A.
- For a root system coming from an integral root datum as above, identify the native
  `RootPairing.coweightLattice` of its real form with `Hom_ℤ(Q, ℤ)` through
  `RootPairing.toDualRootSpan`, and the real coweight space with `Hom_ℤ(Q, ℝ)`, by the explicit
  comparison from `ℝ ⊗[ℤ] Hom_ℤ(Q,ℤ)` given by `a⊗f ↦ (q ↦ a*(f(q):ℝ))`, with inverse
  constructed from a finite integral basis of the root lattice.
- Compare the native highest root `b.highestRoot` with the highest long root determined by the
  finite-type symmetrizer, transported from `DynkinType.IsLongSimpleRoot` along Weyl orbits,
  including its coefficients in Δ.

**Checks.**

- For A₁ in the coordinate α(x), the closed alcove is [0,1]. The affine reflection
  at 0 fixes 0, so that endpoint has stabilizer of order 2, while 1/3 has trivial stabilizer.
- In A₁ the class of the fundamental coweight generates `P∨/Q∨` of order 2, and its
  representative in Ω is x↦1−x, which maps (0,1) to itself and is not in `W_aff`, whose
  elements are x↦±x+2k: injectivity would fail if Ω were replaced by all of `W_ext`, where
  the translation by 2 maps to the zero class.
- In rank 0 the space and its orbit quotient are a point, the Weyl group is trivial,
  and both lattice quotients are 0; the native engine assumes a nonempty root index set, and
  this case is stated directly.

**Closed alcoves and point orbits.** The closed alcove
`Abar={x : αᵢ(x)≥0 for all i, θ(x)≤1}` is the native `RootPairing.closedFundamentalAlcove`, and
covering by its `W_aff`-translates is native
(`RootPairing.iUnion_image_closedFundamentalAlcove_eq_univ`). Prove
`eq_of_mem_closedFundamentalAlcove_of_mem_affineWeylGroup`: under the hypotheses of the native
covering theorem (a root pairing over an Archimedean linearly ordered field, with finite nonempty
index, crystallographic, reduced and irreducible, and a base), if x and f(x) both lie in the
closed alcove for some f in `W_aff`, then f(x)=x. With the covering theorem, every `W_aff`-orbit
of points meets Abar in exactly one point (Garnier, Theorem 1.3.5, p. 5).
Simple transitivity on open alcoves alone does not give this boundary
statement. Over ℝ prove that Abar is the topological closure of A, and local finiteness of the
affine root hyperplanes. For x∈Abar, prove its W_aff-stabilizer is exactly the finite
subgroup generated by the affine simple-wall reflections whose walls
contain x; construct its root/parabolic description and the conjugation
comparison for points in other closed alcoves. This stabilizer statement is
an adapter to the affine reflection arrangement of Garnier §1.3, pp. 4–5:
choose a small ball meeting only hyperplanes through x, join two local
chambers by a gallery across those walls, and use the native simple transitivity on
alcoves to identify the resulting product with the given stabilizer element. Give face intersections and
stabilizers, including vertices and intersections of several walls. Prove
properness of the lattice/finite-W action and Hausdorffness of its orbit
quotient, and construct the homeomorphism `Abar≃V/W_aff` induced by the
actual inclusion and quotient maps. For reducible semisimple data take the
product of these closed alcoves and wall systems; rank zero is a point.

**Checks.**

- In A₁, with the coordinate α(x) and coroot translations by 2, the orbit of 2/3 is
  `{±2/3+2k}`, which meets [0,1] in 2/3 only; the orbit of the wall point 1 is the odd integers,
  meeting [0,1] in 1 only, and the reflection x↦2−x fixes 1.
- With the coweight translations by 1 in place of the coroot translations, x↦1−x carries 2/3
  to 1/3 inside [0,1]: uniqueness is a statement about `W_aff` and fails for `W_ext`.
- The point 0 has stabilizer of order 2 in `W_aff` and 1/3 has trivial stabilizer, so the
  statement is `f(x)=x`, not `f=1`.

For every specified W-stable intermediate lattice `Q∨⊆Y⊆P∨`, restrict the
same action to `W_Y=Y⋊W`. Construct
`Ω_Y=Stab_(W_Y)(A)`, its inclusion in Ω and its isomorphism with Y/Q∨,
and prove `W_Y=W_aff⋊Ω_Y` through actual multiplication and inverse maps.
The Ω_Y action preserves Abar. Prove that two points of Abar are
W_Y-related exactly when they are Ω_Y-related, and construct the
homeomorphism `Abar/Ω_Y≃V/W_Y`. At x∈Abar identify its full stabilizer
with `Stab_(W_aff)(x)⋊Stab_(Ω_Y)(x)` under those same maps. Thus the
closed alcove itself gives unique representatives for Q∨⋊W orbits;
other lattices retain the displayed finite identifications. The intermediate
lattice decomposition is Garnier, Proposition 2.3.1, pp. 16–17. The quotient
homeomorphisms are derived adapters: the affine action is proper because its
translation lattice is discrete and its linear group finite; the resulting
continuous bijections from compact Abar or Abar/Ω_Y to Hausdorff orbit spaces
are homeomorphisms.


Let `Γ_root` be the automorphism group of the finite based root system: it preserves `Δ`, the root
lengths, and every oriented Cartan integer, without imposing a choice of isogeny lattice. Extend each
element to the affine node by fixing `0`. Prove the conjugation action of `Γ_root` on `Ω`, and
construct the concrete isomorphism

`Ω ⋊ Γ_root ≃ Aut(affine Cartan matrix)`
(Garnier, Corollary 2.2.7, p. 10, with the oriented Cartan data retained).

Here an affine Cartan automorphism is a permutation of the finite simple nodes together with node
`0` that preserves the full untwisted affine Cartan matrix, including multiple-edge orientation. A
special node is one with coefficient `1` in the affine null-root relation; node `0` is special.
Prove injectivity by the action on the alcove walls. For surjectivity, prove every affine-diagram
automorphism sends special nodes to special nodes, use the simply transitive `Ω`-action on special
nodes to move it back to `0`, then identify the stabilizer of `0` with `Γ_root`.

For a reducible finite root system, do the construction on each irreducible component and include
the permutations of isomorphic components in the resulting based/affine diagram automorphism group.
Treat rank zero directly: its affine diagram has no nodes and its Weyl and translation groups are
trivial.

The two lattice quotients have different meanings and remain distinct. For a W-stable lattice
`Q∨ ⊆ Y ⊆ P∨`, the stabilizer of the alcove in `Y⋊W` is `Y/Q∨`, whereas the dual quotient is
`P∨/Y`; for `Y=Q∨` the first is trivial and the second is `P∨/Q∨`, and for `Y=P∨` the sizes are
reversed. Check the constructions and actions in types `A₁`, `A_r`, `D₄`, and `E₆`:
respectively `Ω ≅ C₂`; `Ω ≅ C_{r+1}` with the nontrivial finite diagram involution acting by
inversion for `r ≥ 2`; `Ω ≅ C₂ × C₂` and the `S₃` triality action permuting its three nonzero
elements; and `Ω ≅ C₃` with the diagram involution acting by inversion. These checks fix the affine
node, orientation, and semidirect-product convention. For a lattice `Y`, define
`Γ_Y ≤ Γ_root` to be the subgroup preserving `Y`; the quotient `P∨/Y` is equivariant under `Γ_Y`.
An arbitrary intermediate lattice need not be preserved by every root-system diagram automorphism.

### Examples

In type A₁ with the coordinate α(x), the closed alcove is [0,1], `P∨/Q∨` has order 2 and Ω is generated by x↦1−x; the lattice `Y=Q∨` gives `Y/Q∨=0` and `P∨/Y` of order 2, and `Y=P∨` reverses these two sizes.

### Dependencies

*Needs:* the native affine and extended affine Weyl groups, fundamental alcove and coweight lattice (From Tau Ceti); RootSystems Layers 1–6; the native integral-weight lattice.

## Worked examples

- **`sl₂` irreducibles `V(n)`.** For `L = sl (Fin 2) K` with its standard triple: construct `V(n)`,
  prove `dim V(n) = n+1`, that `h` acts with spectrum `{n, n-2, …, -n}`, and that `V(0), V(1), V(2)`
  are the trivial, standard, and adjoint modules. Verify Clebsch-Gordan `V(1) ⊗ V(1) ≅ V(2) ⊕ V(0)`.
  Weyl dimension formula: `dim V(n) = (n+1)`, matching directly.
- **The adjoint representation.** For any `L` (e.g. `sl (Fin 3) K`), the adjoint module `L` itself is
  finite-dimensional irreducible (for simple `L`), its weights are the roots together with `0` (with
  multiplicity `rank L`), its highest weight is the **highest root** `θ`, and it is `L(θ)`. Check
  `dim L` against the Weyl dimension formula at `λ = θ`.
- **`sl₃` weight diagrams.** For `L = sl (Fin 3) K` (type `A₂`), with fundamental weights `ω₁, ω₂`:
  the standard `V(ω₁)` (dimension `3`) and its dual `V(ω₂)` (dimension `3`), the adjoint `V(ω₁+ω₂)`
  (dimension `8`) with its hexagonal weight diagram and the `0` weight of multiplicity `2` (Kostant's
  formula gives the `2`), and `V(2ω₁)` (dimension `6`). Reproduce the weight diagrams as the supports
  of `TauCeti.formalCharacter`.
- **The Weyl dimension formula on a few reps.** For type `A₂`: `dim V(aω₁+bω₂) = (a+1)(b+1)(a+b+2)/2`,
  checked against `3, 3, 8, 6, 10` for `ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁`. For type `B₂`/`G₂`, at least the
  adjoint and one fundamental representation, as a check that the positive-root product is computed with
  the right multiplicities.
- **Complete reducibility in action.** A chosen reducible-but-indecomposable-looking extension (e.g. a
  non-split-looking submodule of `V(1) ⊗ V(1)`) is split by the native complete reducibility
  `TauCeti.exists_isCompl_of_isKilling`, decomposing as predicted by
  Clebsch-Gordan and the character ring.
- **The center and linkage for `sl₂`.** Consume native
  `TauCeti.SpecialLinear.instHasTrivialRadicalSl` from `GeneralLinear.Radical` and
  Mathlib `HasTrivialRadical.instIsKilling`; construct slTwoDiagonalCartan, with
  generator h=E₀₀−E₁₁, its Cartan instance, root decomposition and slTwoPositiveBase
  selecting e=E₀₁ as positive (with f=E₁₀). These concrete instance/base targets belong
  here before any application of Layer 7; triangularizability is the native
  `instIsTriangularizableOfIsAlgClosed` consequence. Consume the existing native standard
  `TauCeti.isSl2Triple_single` triple. For `L=sl (Fin 2) K`, this diagonal Cartan H
  and standard triple `[h,e]=2e`, `[h,f]=−2f`, `[e,f]=h`, choose the positive base {α} with e∈L_α and `ρ(h)=1`. Set
  `Ω=h²+2h+4fe`. Prove `Ω` is central and construct
  `Polynomial K ≃ₐ[K] Z(U(sl₂))` sending X to Ω, and
  prove `Ω=8·TauCeti.casimirElement K (sl (Fin 2) K)` for the native Killing-dual normalization of `TauCeti.casimirElement`
  (`κ(h,h)=8`, `κ(e,f)=4`). In the coordinate
  `t=λ(h)`, `ρ(h)=1`, the raw map sends `Ω` to `t²+2t`, invariant under `t↦−t−2`;
  the linear map sends it to `t²−1`, invariant under `t↦−t`. Hence the two image
  subalgebras are `K[t²+2t]` and `K[t²]`, respectively, and `χ_n(Ω)=n(n+2)`.
  Check `χ_λ=χ_μ` iff `μ=λ` or `μ=−λ−2`. Freudenthal on `V(n)` returns
  multiplicity `1` for each of `n,n−2,…,−n`, matching the native rank-one weight string
  (`TauCeti/Algebra/Lie/Sl2/WeightString.lean`).
- **`sl₃` multiplicities by Freudenthal.** For type `A₂`, recompute the `0`-weight multiplicity `2` of
  the adjoint `V(ω₁+ω₂)` by Freudenthal's recursion (a check on the Kostant computation in the `sl₃`
  worked example above) and the multiplicities of `V(2ω₁+2ω₂)`.
- **`G₂ = Der(𝕆)` and its `7`.** On the native split octonions verify the alternative identities and the
  multiplicative norm, use the native derivation carrier, and check `finrank K (Der 𝕆) = 14`, that it is Killing-simple of
  type `G₂` (Cartan matrix reindexes to `CartanMatrix.G₂`), that `Im 𝕆` is its `7`-dimensional
  irreducible `V(ω₁)`, and `Der(𝕆) ≃ₗ⁅K⁆ LieAlgebra.g₂ K`. The Weyl dimension formula on `G₂` returns
  `7` and `14` for the two fundamental weights.
- **`F₄ = Der(H₃(𝕆))` and `E₈`.** Use the native split Albert product, dimension 27, Jordan
  identity and derivation carrier; check `finrank = 52`, type `F₄`, the `26`-dimensional representation
  `J₀`, and `≃ₗ⁅K⁆ LieAlgebra.f₄ K`. For `E₈`, check `finrank (𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*) = 248 =
  80 + 84 + 84`, Killing-simplicity of type `E₈`, and `≃ₗ⁅K⁆ LieAlgebra.e₈ K`; the Weyl dimension
  formula at the adjoint highest weight returns `248`.
- **Isotypic components against characters (the toolkit check).** For `L = sl (Fin 2) K` and
  `M = (V(1) ⊗ V(1)) ⊕ V(0)`: the isotypic multiplicities are `1, 0, 2` at the weights `2, 1, 0`,
  agreeing with the coefficients extracted from `formalCharacter M`, and the component finranks
  `3 + 0 + 2` sum to `dim M = 5`, checking finrank_isotypicComponent and the packaged
  decomposition against Clebsch-Gordan.
- **`gl_2`, the classification concretely.** The irreducibles of `gl_2` are the pairs `(μ₁, μ₂)` with
  `μ₁ - μ₂ ∈ ℕ`, of dimension `μ₁ - μ₂ + 1`; the restriction to `sl (Fin 2) K` is `V(μ₁ - μ₂)` and
  the centre acts by `μ₁ + μ₂`. The trace-form Casimir scalar is `μ₁(μ₁ + 1) + μ₂(μ₂ - 1)`, matching
  glCasimir_smul_of_isGlHighestWeightVector at `n = 2`. `gl_1` is the degenerate check: every
  `μ : K` is dominant, so the non-integral central direction is visible already in rank one, where
  the group-level `DominantWeight 1` sees only `ℤ`.
- **The staircase weight and Casimir separation on `gl_N`.** `ν = (N - 1/2, …, 1/2)`: no entry is an
  integer, every consecutive difference is `1`, so `IsGlDominantIntegral ν` holds, and every lowered
  weight `ν - ε_t` is still dominant. The Casimir scalars separate them:
  `C(ν - ε_t) - C(ν - ε_s) = 4 (t - s)` (zero-based), pairwise distinct, so on a module whose
  irreducible constituents all have highest weights among the `ν - ε_t` the single operator
  `TauCeti.glCasimir` already distinguishes the summands.
- **Minuscule Pieri for the standard module and its dual on `gl_N`.** The standard module (weights
  `ε_t`) and its dual (weights `-ε_t`) are minuscule; `TauCeti.gl_dual_standard_pieri` gives
  `V* ⊗ L(ν) ≅ ⨁_{t} L(ν - ε_t)` with all `N` summands surviving for the staircase `ν`, the uniform
  decomposition the motivating CAR application reads off
  ([../SpinRepresentations/README.md](../SpinRepresentations/README.md) Layer 9).
- **The single-weight criterion in action.** For the `gl_N` action by fermionic bilinears on the
  Clifford algebra `CliffordAlgebra (TauCeti.traceQuadraticForm K (Fin N))` of the `N²`-dimensional
  matrix space (the CAR module of [../SpinRepresentations/README.md](../SpinRepresentations/README.md)
  Layer 9), the decomposition is native: `TauCeti.complementedLattice_lieSubmodule_car` gives
  complete reducibility, the identity matrix acting by the scalar `N²/2 = Σ_i ν_i`;
  `TauCeti.isotypicMultiplicity_glIrreducible_car` gives the multiplicity `2^(N(N+1)/2)` of
  `glIrreducible N (glHalfStaircase K N)`, and
  `TauCeti.nonempty_lieModuleEquiv_directSum_glIrreducible_car` the direct-sum decomposition
  (`TauCeti/Algebra/Lie/GeneralLinear/CAR/Decomposition.lean`), over an algebraically closed
  characteristic-zero field. The count agrees with the dimensions: `2^(N²) = 2^(N(N+1)/2) · 2^(N(N−1)/2)`,
  and at `N = 2` this reads `16 = 8 · 2`. Nothing of this example is a target here.

## Downstream consumers

AdoIwasawa consumes arbitrary-field ordered PBW directly from Tau Ceti and the
additional central-monic finiteness comparison in Layer 3. CharacteristicClasses C5 consumes the native
Lie–Chevalley restriction `TauCeti.lieCartanRestriction` and native Killing-duality
comparison. The split
exceptional identifications in Layer 8 use the split Serre presentation in
Layer 7; the compact Albert geometry in TangentialBordism §§9.1–9.2 (B3.6–B3.7) uses the
separate positive real algebra track. SpinRepresentations consumes the native dual-standard
Pieri rule `TauCeti.gl_dual_standard_pieri`, which Layer 9 applies.

The polynomial derivative identity in §3.1 identifies the PBW zero-fibre
bracket with the differential formula used by LieGroupoidsPoisson G4.6A.
Its smooth Poisson structure supplies the geometric interpretation of that
identity. Likewise §6.2's finite Laurent identity is an input to
TensorProductCombinatorics §1.6's theorem for rational expressions equal to
Laurent polynomials: one common regular height expands every summand, and
the resulting boundary value is the ordinary finite torus character.
Its coefficient reconstruction applies to native Kostant fibres through
§2.6's type-A dictionary. This composition retains both toric terms for
A=(2), giving 1/2+(−1)^b/2=1,0,1 at b=0,1,2, and its empty-list coefficient
is δ₀. The analytic constructions use PseudodifferentialOperators §3.1;
the finite identities exported here do not depend on those constructions.

Layer 9's reductive enveloping-product and center-factor constructions consume the native product/abelian/tensor-centralizer APIs and the existing early reductive splitting. Its HC and invariant-polynomial refinements consume Layer7; its connected algebraic fixed-vector comparison consumes only RG2/5P's tangent/Cartier cut. None consumes Borel–Weil or characteristic-class cohomology.

Layer 10 consumes the native affine and extended affine Weyl groups, the fundamental alcove and the coweight lattice, the native integral-weight predicates, and RootSystems Layers 1–6 for finite root geometry and the based classification. It uses no Lie group and no period lattice. LieGroups Layer 7 consumes the split Serre presentation of §7.1; the compact-group applications named in Scope and ownership follow LieGroups and are not targets of this roadmap.

## References

- P. Etingof, *Lie Groups and Lie Algebras I & II*, MIT 18.755 lecture notes
  (Spring 2024), §11.4 and Theorems 11.16/11.18, pp. 65–68; Corollary 18.8, p. 99;
  §24.2, Theorem 24.2 and Lemma 24.3, pp. 130–132;
  Proposition 26.3 and Theorem 26.4, pp. 139–140; §30.1, Proposition 30.4,
  p. 159, and Corollary 30.5, p. 160; §30.2, Corollary 30.7 and proof, p. 160; Example 32.13
  and Proposition 32.14, pp. 176–177. These page numbers are the printed pages of the
  [MIT course notes](https://ocw.mit.edu/courses/18-755-lie-groups-and-lie-algebras-ii-spring-2024/mit18_755_s24_lec_full.pdf).
- A. Garnier, *Fundamental domains for extended affine Weyl groups*
  (23 October 2020), Theorems 1.3.2 and 1.3.5, p. 5;
  Proposition-Definition 2.2.1, pp. 7–8; Corollary 2.2.7, p. 10;
  Proposition 2.3.1, pp. 16–17,
  [author's manuscript](https://www.lamfa.u-picardie.fr/agarnier/unpub/fund_dom_KP.pdf).

- C. De Concini, C. Procesi, M. Vergne, *Box splines and the equivariant index
  theorem*, arXiv:1012.1049v3 (2012), §1, pp. 6–7; Definitions 2.5–2.9,
  pp. 8–10; Theorems 2.15 and 2.29, pp. 11 and 15; §3.1,
  Propositions 3.2 and 3.4 and Theorem 3.3, pp. 19–20. These locators
  refer to the arXiv version.

- P. Etingof, *Representations of Lie Groups*, arXiv:2401.01446v2 (2024),
  Theorem 10.1 and Remark 10.2, pp. 51–52; Theorem 13.5, p. 69;
  Theorem 14.1, pp. 70–71. The Chevalley/HC source is over ℂ; the algebraic
  characteristic-zero extension requires the polynomial arguments stated in Layer 7.
- S. Gutt, *Deformation Quantization and Symmetries*, Lectures 1–2 (2019),
  Lecture 1, slide 14: PBW symmetrization and the positive linear Poisson convention.
- J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer GTM 9 (1972),
  the primary reference: `sl₂` (Ch. II §7), root-space decomposition and root systems (Ch. III), the
  universal enveloping algebra and PBW (Ch. V §17), Verma modules, `L(λ)`, and the finite-dimensional
  classification (Ch. VI §20-21), Weyl's complete reducibility via the Casimir (Ch. II §6, Ch. VI),
  and the Weyl character, dimension and Kostant formulas (§22.3, §24.1 and §24.2).
- J.-P. Serre, *Complex Semisimple Lie Algebras*, Springer (1987), the concise development of `sl₂`,
  root systems, and the highest-weight classification.
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991), `sl₂`,
  `sl₃` weight diagrams (Lectures 12-13), the classical-series representations, and the Weyl character
  and dimension formulas (Lecture 25) with many worked examples; the source for the `sl₃` acceptance
  criteria.
- J. E. Humphreys, *Representations of Semisimple Lie Algebras in the BGG Category O*, AMS GSM 94
  (2008), Verma modules, category `O`, the BGG resolution, and the character formula in modern form.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 7-8*, the structure theory, Cartan
  subalgebras, root systems, and the invariant-theoretic treatment of characters.
- J. C. Jantzen, *Lectures on Quantum Groups* / *Representations of Algebraic Groups*, the Kostant
  partition function, the Weyl and Kostant formulas, and the link to the algebraic-groups picture that
  [../ClassicalGroups/README.md](../ClassicalGroups/README.md) consumes.
- N. Bourbaki, *Lie Groups and Lie Algebras, Chapter 8*, the center of the enveloping algebra, the
  Harish-Chandra homomorphism and central characters, the linkage principle, and the Chevalley-Serre
  presentation of a split semisimple Lie algebra; the source for Layer 7.
- R. D. Schafer, *An Introduction to Nonassociative Algebras*, 1961 lecture notes,
  Chapter III, p. 28 (Cayley derivations); Chapter IV, equations (39)–(42′),
  pp. 40–41 (cubic norm), and p. 41 (Albert derivations). These locators refer
  to the Project Gutenberg transcription of the 1961 notes, not the expanded 1966 book.
- S. Garibaldi, *E₈, the most exceptional group*, arXiv:1605.01721v1 (2016),
  §4, Example 4.4, p. 9: the complex A₈-graded E₈ module decomposition.
- J. C. Baez, *The Octonions*, arXiv:math/0105155v4 (2002), §2.2, pp. 8–10
  for Cayley–Dickson conventions and §3.4, p. 32 for the Albert determinant;
  §4.1, Theorem 4, p. 37 and §4.2, Theorem 5, p. 41 for compact G₂/F₄;
  §§4.3–4.5, pp. 42–48, Theorems 6–7, for magic-square E₆/E₇ and
  the Freudenthal 56-dimensional carrier. The split-field route is stated in Layer 8.
- J. M. Landsberg and L. Manivel, *The projective geometry of Freudenthal’s magic square*,
  arXiv:math/9908039v1 (1999), §1.1, pp. 2–3, for the complex magic-square background.
  This background does not supply the arbitrary-field bracket comparisons of Layer 8.
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255 (2009),
  highest-weight theory for `gl_n` and the classical groups, the trace-form Casimir, isotypic
  decompositions, and the Pieri rules; the primary source for Layer 9 and the minuscule Pieri
  targets of Layer 6.
- J. Dixmier, *Enveloping Algebras*, AMS GSM 11 (1996), reductive Lie algebras (§1.6) and the center
  of the enveloping algebra; the source for the reductive structure theory and the central-character
  separation of Layer 7.
- A. Molev, *Yangians and Classical Lie Algebras*, AMS Mathematical Surveys and Monographs 143
  (2007), Ch. 1-2, `gl_n` highest weight modules with arbitrary entries and integral differences,
  and the Gelfand-Tsetlin bases; the source for the "entries in `K`, differences in `ℕ`"
  formulation of `gl_n` dominance.
