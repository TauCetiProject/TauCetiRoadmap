# Roadmap: abelian varieties of GL₂-type and modularity of ℚ-curves

**Summary.** An abelian variety over ℚ can have dimension greater than one while its endomorphisms split its Tate module into two-dimensional pieces. This roadmap proves modularity for these varieties: every abelian variety of GL₂-type over ℚ is a quotient of a modular Jacobian `J₁(N)`. For a ℚ-simple variety A of dimension n, the attached weight-two newform has coefficient field `End⁰_ℚ(A)`, its conductor is `Nⁿ`, and its least modular level is N. The resulting pointed map from `X₁(N)` to A has image generating A. A totally real endomorphism field gives the Γ₀ version.

The second goal concerns ℚ-curves: elliptic curves over ℚ̄ isogenous to all their Galois conjugates. Ribet's cocycle and restriction-of-scalars construction put every non-CM ℚ-curve inside a primitive GL₂-type variety over ℚ. Modularity over ℚ then supplies a modular Jacobian quotient over ℚ̄. Over a solvable Galois field of definition, a finite character twist and solvable base change give an automorphic representation with the elliptic curve's local factors at every finite place. In particular, ℚ-curves over real or imaginary quadratic fields are modular in the sense used by Caraiani–Newton.

The proof of modularity follows residual representations through Serre's theorem, a bounded collection of weight-two newforms, exact identification of coefficients, comparison of rational Tate modules, and Faltings' isogeny criterion. All-place Weil–Deligne compatibility is deduced after modularity; it is not a hypothesis of this proof. This order keeps the good-prime argument independent of the stronger local compatibility convention.

## Scope and ownership

EllipticCurveModularity R29 proves the dimension-one theorem. Layers 3–4 generalise its constructions and compare the pointed parametrisations when the same quotient and Abel–Jacobi map are chosen. This roadmap owns the structural results specific to GL₂-type varieties, their modularity and exact level, and the forward ℚ-curve construction. The `GL₂(E)`-type bundle itself belongs to SmallRamificationAndAbelianVarietyBaseCases §5.1, and its Tate modules belong to ArithmeticGaloisRepresentations §§6.1–6.4. Other roadmaps cite this roadmap by the identifiers GT.1–GT.6 for Layers 1–6 and by slugs such as GT.1/primitive for §1.2 and GT.3/modularity-theorem for §3.6; those identifiers name the layers and targets numbered here.

AbelianSchemesAndArithmeticModuli A1–A3 and A6 supply geometry, rational endomorphisms, polarizations, images, isogenies and Weil restriction. ModularCurvesPartII Layers 3–6, 13, 16 and §17.3 supply the curves, Jacobians, Hecke quotients `A_f` and rational pointed Abel–Jacobi maps. AutomorphicGaloisRepresentations §§1.5, 4.4–4.9 and 6.1–6.4 supply newform representations and local compatibility; ClassicalSerreModularity R27.6 supplies the strong Serre theorem. Faltings' comparison theorems, p-adic Hodge theory, Néron models, automorphic base change and reciprocity are imported at the layers specified below.

The theory of inner twists and geometric building blocks beyond the squared-trace field is outside the scope. Ribet's converse from geometric factors to ℚ-curves is also outside the scope. General modularity over a nonsolvable field is not asserted. CM ℚ-curves enter the final quadratic-field conclusion through Caraiani–Newton's separate CM alternative, rather than through the rational-valued non-CM cocycle construction.

## Conventions

An abelian variety is the native [`TauCeti.AlgebraicGeometry.AbelianVariety K`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean). Its integral endomorphism ring is [`AbelianVariety.End A`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean), whose addition is the pointwise group law and whose multiplication is composition. Set `End⁰_K(A) = ℚ ⊗_ℤ End_K(A)`. Rational inverse and conjugation statements use this algebra and rationalized Hom groups. They preserve the existing ring operations. An E-equivariant isogeny intertwines the two actual E-actions; in native integral morphisms this can be expressed after clearing a common integer denominator.

A `GL₂(E)`-type structure is an injection `E ↪ End⁰_ℚ(A)` from a number field with `[E : ℚ] = dim A`. Unless a target explicitly treats powers or general modular quotients, A is ℚ-simple: it has positive dimension and has no nonzero proper abelian subvariety over ℚ. This condition is stronger than E-stability. Native `A.dim` takes values in `WithBot ℕ∞`; the finite dimension is the rank of its tangent space. The library theorem [`AbelianVariety.finrank_tangentSpace_eq_dim`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean#L193) identifies these dimensions, so no independent dimension parameter is used.

Fix an algebraic closure ℚ̄ and write `G_K` for the absolute Galois group with its Krull topology. Tate modules are covariant. `Frob_p` is arithmetic Frobenius, and the cyclotomic character `χ_ℓ` has Hodge–Tate weight 1. For a ℚ-simple A let `E = End⁰_ℚ(A)`, S be its finite set of bad primes, λ a prime of E over ℓ, and `E_λ` its completion. The native decomposition is

```text
V_ℓ(A) = ⊕_{λ | ℓ} V_λ(A),   dim_{E_λ} V_λ(A) = 2.
```

The representation `ρ_λ` is the action on that component. The symbols `a_p`, `d_p` and ε acquire their meaning in Layer 2. A residual representation means the action on the actual λ-torsion of an integral model, supplied by ArithmeticGaloisRepresentations §6.4, and its semisimplification is compared with reduction of the rational representation. In dimension one, use that owner's §6.1 `TateModule.residualRep` on geometric elliptic torsion; its matrix form requires a basis. Residue fields are embedded into one algebraic closure before two residual representations are compared. Residue degree one does not imply `E_λ = ℚ_ℓ` unless ramification is also excluded.

All modular levels are positive. Modularity of level N means a surjective ℚ-homomorphism `J₁(N) → A`; Γ₀ modularity uses `J₀(N)`. A level in this definition need not be the least level. The exact-level theorem assumes ℚ-simplicity: for powers, the availability of enough oldform copies is an additional requirement.

For a normalized weight-two newform f use the existing [`HeckeRing.GL2.Newform`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean) carrier. Its coefficient field is `K_f`, its character is `ε_f`, and `A_f` is the Hecke quotient of the modular Jacobian. Coefficient fields and quotient actions are supplied by their owners, rather than encoded as arbitrary fields or representations. The fixed-level multiplicity-one theorem is used only with its actual fixed-level and nebentypus hypotheses; agreement at almost all primes across different levels uses ModularForms Layer 5.

In Layer 5 the coefficient groups ℚˣ and ℚ̄ˣ are discrete and have trivial `G_ℚ`-action. Their multiplicative law is presented additively for continuous cohomology. Tate's vanishing is not a statement about the natural Galois action on ℚ̄ˣ. A family `μ_g` consists of geometric conjugate isogenies defined over a common finite Galois field. That field is enlarged again when needed so that the locally constant splitting map α factors through its Galois group.

Serre's good-prime compatibility in Layer 2 fixes E-rational Frobenius polynomials outside S. Khare–Wintenberger strict compatibility in Layer 4 fixes local Weil–Deligne parameters at every place, including the coefficient prime. The latter may require a finite extension E′/E to realize all the parameters. Analytic normalization is `L(Π,s−1/2) = L(A,s)` in weight two. The normalized Fricke functional equation retains `i² = −1` until its constants are absorbed into the root number.

At a split multiplicative place of residue size `q`, the covariant Tate module has
arithmetic-Frobenius eigenvalue `q` on its invariant line but eigenvalue `1` on its
inertia coinvariants. Thus the local Euler polynomial is `1 − T`, using arithmetic
Frobenius on coinvariants, or geometric Frobenius on inertia invariants of the dual
cohomological representation. At good places the same convention gives
`1 − a_v T + qT²`. Every bad-place comparison below uses this duality explicitly.
For character twisting, arithmetic reciprocity gives
`ψ_Hecke(ϖ_v) = ψ(Frob_v)` at an unramified place. A supplier normalized with
geometric reciprocity uses `ψ_Hecke = ψ⁻¹ ∘ Art_geom`; the inverse converts the
same character, rather than replacing it by its dual. A character with
`ψ(Frob_v) = ζ₃` must multiply a good trace by `ζ₃`, not `ζ₃⁻¹`.


## Exact supplier contracts

### From other roadmaps

These interfaces describe the inputs to the targets. Each is attached to its owning layer; the geometric, cohomological and automorphic objects keep their native meaning throughout.

| Owner | Required interface |
| --- | --- |
| AbelianSchemesAndArithmeticModuli §A1.6 | Dimension-one abelian varieties and nonsingular Weierstrass curves, compatible with homomorphisms, isogenies, field embeddings and conjugation. The tangent-space dimension identity is supplied by the Tau Ceti theorem cited above. |
| AbelianSchemesAndArithmeticModuli §§A2.5, A3.9, A6.14; PELModuli §§M0.1–M0.2 | Polarizations and the positive Rosati involution, duality and its restriction to a number-field action. |
| AbelianSchemesAndArithmeticModuli §§A3.3–A3.4 and A6.3 | Image abelian subvarieties and finite-subgroup quotients, including the effect on Tate lattices needed to saturate the endomorphism order. |
| AbelianSchemesAndArithmeticModuli §§A6.4–A6.8, A6.12, A6.22, A6.26 and A6.30–A6.34 | `End⁰` and `Hom⁰`, rational inverses of isogenies, compatible field structures, matrix-product actions, derivative action, faithful geometric base change, non-CM scalar endomorphisms, and finite étale Weil restriction with its product decomposition. Base change of native Hom and End is already available; the rationalized functoriality and elliptic comparison must respect those maps. |
| AbelianSchemesAndArithmeticModuli §§A5.1–A5.7 | Complex uniformization and Betti–Tate comparison equivariant for endomorphisms and complex conjugation. Real Frobenius interchanges the two Hodge summands; this is the input for oddness. |
| ArithmeticGaloisRepresentations Layers 1–6; SmallRamificationAndAbelianVarietyBaseCases §5.1 | Continuous representations, characters, conductors, oddness, recognition by Frobenius polynomials, and the actual Tate components `TateModule.lambdaTateModule` and λ-torsion with coefficient embeddings and isogeny transport (§6.4). The dimension-one comparison uses §6.1, [Basis-free elliptic residual representation](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation), including `TateModule.residualRep` and its trace, determinant and change-of-basis laws. |
| EllipticCurves Layers 3–4 and 4.5a, “Invariant theory over a Dedekind domain” | Elliptic model bridges: on an integral equation minimal at ℓ, good reduction is equivalent to `ℓ ∤ Δ`; the reduced projective point count gives `a_ℓ = ℓ + 1 − #Ẽ(𝔽_ℓ)`; for a semistable curve the conductor has exponent zero at good primes and one at multiplicative primes. Use local minimal models and the curve-level semistability predicate of Layer 4.5a. The comparison with the Artin conductor is consumed through EllipticCurveModularity R29.4. |
| NeronModelsAndSemistableAbelianVarieties §§5.0b–5.1, 5.4–5.7 and 6.10 | Good reduction, the integral conductor and local Euler polynomials, and their independence of the auxiliary coefficient prime. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.19, R07.4.19 and R07.6.1; AlgebraicModularFormsAndSerreWeights §4.9 (R15.4), The weight-two criterion | The crystalline comparison, Hodge–Tate weights and finite-flat weight-two recipe. |
| ModularCurvesPartII Layers 3–6, 13, 16 and §17.3; JacobianChallenge Layer F | Native `X₁(N)`, `X₀(N)`, `J₁(N)`, `J₀(N)`, degeneracy maps, `A_f`, coefficient-field and Hecke actions, rational cusps and the generating pointed Abel–Jacobi map. Include all positive low levels used in the zero-Jacobian tests. |
| ModularCurvesPartII §§13.2–13.3 and 16.1–16.4 | The actual Hecke operator and coefficient-field actions. The `J₀(23)` worked checks below take the explicit data `dim J₀(23) = 2`, `T₂²+T₂−1 = 0`, and `End⁰ = ℚ[T₂] ≃ ℚ(√5)` as hypotheses. |
| RepresentationTheory, SemisimpleAlgebras Layers 1–3 | The simple-module/block dictionary, invariant Wedderburn multiplicities and centralizers. The Mathlib Wedderburn and Schur declarations in the next table are used directly. |
| ModularForms Layers 3–5, 8 and 10 | The old/new decomposition with multiplicity `d(N/M)`, the newforms as an orthogonal basis of the new subspace (Layer 5), cross-level strong multiplicity one, coefficient fields and their conjugates, and finite-dimensionality of `S₂(Γ₁(M))` at every level (Layer 10). The native newform and character-space direct sum already exist. Finiteness of the normalized newforms of level dividing a given integer is derived from these in §3.3. |
| ClassicalSerreModularity R27.6 | Residual modularity at Serre's prescribed weight and prime-to-ℓ level; neither its proof nor the compatible-system classification is repeated here. |
| AlgebraicModularFormsAndSerreWeights §7.5 (R15.6), S-type and modularity predicates | The shared residual attachment predicate, written ArisesFrom there, with one coefficient reduction giving both Frobenius traces and determinants. Its integral-model theorem identifies semisimple residual representations after compatible coefficient extension; absolute irreducibility identifies the given representation itself. §3.2 consumes this interface; existence comes from ClassicalSerreModularity R27.6. |
| FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7 and R28.6.7 | Semisimplicity, Tate–Hom comparison, almost-all residual comparison, and the rational Tate-module isogeny criterion over number fields. |
| AutomorphicGaloisRepresentations §§1.5, 4.4–4.9, 6.1–6.4 and 7.3; AutomorphicGaloisRepresentationsPartII AG2.P | Newform realizations, Tate decomposition, local factors and conductors, coefficient-prime compatibility, and compatible-system reindexing after finite coefficient extension. |
| ModularForms Layers 6–7 | Normalized Fricke companion and pseudo-eigenvalue, Euler products including bad primes, and the completed functional equation. Entire analytic extension of the native cusp-form coefficient Dirichlet series is a library input. |
| Tau Ceti continuous-cohomology library | Use the existing canonical degree-two comparison, its coefficient-map and inflation compatibility, and positive-degree vanishing for discrete rational modules, cited in the next table. The quotient `ℚ̄ˣ/μ_∞` is uniquely divisible and hence admits the required ℚ-module structure. These are library inputs. |
| ProfiniteCohomology Layer 10 | Inflation and the comparison of the explicit degree-two cocycle description with the canonical continuous cohomology, for profinite groups acting trivially on discrete coefficients. |
| ArithmeticGaloisRepresentations §7.6, “Projective lifting” | Tate's vanishing for trivial-action ℚ/ℤ coefficients, from which the ℚ̄ˣ version follows. |
| GL2AutomorphicRepresentationsAndTransfer §§R17.4.3–R17.4.9 and R17.6.17–R17.6.18; ClassFieldTheory Layer 11 | Solvable base change, rank-two finite quotient character extraction, finite character twists, local compatibility, coherent algebraic characters across auxiliary coefficient primes, and global Artin reciprocity. §6.1 owns the extension of character extraction to arbitrary positive finite rank. |
| AbelianSchemesAndArithmeticModuli §§A5.1–A5.3; EllipticCurves Layer 1, “Isogenies, the dual, the invariant differential, and formal groups” | Complex lattice uniformization, algebraicity of analytic homomorphisms and geometric endomorphism actions. §5.1 proves its CM conjugate-isogeny consequence. |
| EllipticCurveModularity R29.3–R29.6 | Infinite congruence-to-equality arguments; the newform of an elliptic curve (R29.3, The newform of an elliptic curve), attached through its `IsNewformOf` predicate; R29.4's targets The level is the conductor and The conductor and its semistable comparison; and the dimension-one modularity and pointed parametrisation with which Layer 4 compares its choices. The general conductor includes additive and wild reduction; the squarefree bad-prime product requires semistability. |

### From Mathlib and Tau Ceti

Use the following declarations at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native tangent dimensions,
base change and continuous-cohomology comparison are supplied directly by these libraries.

| Declaration | Role |
| --- | --- |
| [`TauCeti.AlgebraicGeometry.AbelianVariety`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean) | Abelian variety over a field K: a group object in Over (Spec K), proper and geometrically integral (bundled); smoothness, connectedness and commutativity derived |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean) | The tangent space at 0 (Zariski tangent space at the zero point), the Lie algebra `Lie(A/K)` used in the Lie-algebra divisibility argument |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean) | Isogenies of abelian varieties over a field (finite surjective homomorphisms) |
| [`HeckeRing.GL2.Newform`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean) | Bundled newforms of level N and weight k: Hecke eigenform away from the level, new, normalised `a₁ = 1` |
| [`cuspFormCharSpace`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/ModularForms/DiamondOperators.lean) | `S_k(N, χ)` as the joint diamond-operator eigenspace in `S_k(Γ₁(N))`, `χ : (ℤ/N)ˣ →* ℂˣ` |
| [`CongruenceSubgroup.Gamma1`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean) | The congruence subgroup `Γ₁(N)` of `SL₂(ℤ)` |
| [`cyclotomicCharacter`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean) | The ℓ-adic cyclotomic character `(L ≃+* L) →* ℤ_ℓˣ` |
| [`DirichletCharacter`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/DirichletCharacter/Basic.lean) | Dirichlet characters as multiplicative characters of ℤ/n, the form of the nebentypus ε |
| [`NumberField.IsCMField`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/NumberField/CMField.lean) | CM fields: totally complex quadratic extensions of their maximal real subfield |
| [`NumberField.IsTotallyReal`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean) | Totally real number fields: every infinite place is real |
| [`Field.absoluteGaloisGroup`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/AbsoluteGaloisGroup.lean) | The absolute Galois group `G_K = Aut(K̄/K)` with its Krull topology |
| [`IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean) | Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras |
| [`IsSemisimpleModule`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/SimpleModule/Basic.lean) | Semisimple modules (complemented submodule lattice), the form of Faltings' semisimplicity |
| [`IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/AlgebraRepresentation/Basic.lean) | Schur's lemma over an algebraically closed field: the commutant of a finite-dimensional simple module is the scalars |
| [`LinearMap.bijective_or_eq_zero`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/SimpleModule/Basic.lean) | Schur's lemma: a linear map between simple modules is bijective or zero |
| `Module.finrank_dvd_finrank_right` in `Mathlib.LinearAlgebra.Dimension.Free` | For a scalar tower of free modules, the base-field degree divides the total finrank; use after constructing the derivative action. |
| [`traceForm_nondegenerate`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Trace/Basic.lean) | The trace form of a finite separable field extension is nondegenerate |
| [`WeierstrassCurve.IsElliptic`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean) | Elliptic Weierstrass curves (unit discriminant), the elliptic curves of Layer 5 |
| [`continuousCohomology`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) | Continuous cohomology in degree n of a TopRep, as the homology of homogeneous cochains in TopModuleCat; the canonical `H²` carrier, not its inflation/comparison API. |
| [`TauCeti.ofDiscreteModule`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean) | A discrete module with a G-action as a TopRep; joint continuity/smoothness is a separate hypothesis, automatic for the trivial action used here. Use Additive ℚˣ or Additive ℚ̄ˣ with discrete topology for the multiplicative coefficients. |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.End`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean) | Native `End A = Additive (A ⟶ A)`, with Ring operations induced by the pointwise group law and composition; not a Preadditive hom-set assumption. |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.prod`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Product.lean) | Native categorical product of two abelian varieties; the module provides finite products used for piObj powers. |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.baseChange`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean) | Actual pullback base change of an abelian variety along a field algebra map; not a substitute for rational Hom0 functoriality. |
| [`TauCeti.Isogeny`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean) | Native Weierstrass isogeny via a coordinate-ring pullback into the source function field and the maps-infinity condition. This consumer additionally requires IsElliptic on both curves. |
| [`TauCeti.Isogeny.map`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/BaseChange/Basic.lean) | Coefficientwise base change of an actual isogeny along a field ring homomorphism, with identity, composition and iterated-map coherence in the same module. |
| [`WeierstrassCurve.quadraticTwistOf`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean) | Explicit twist by trace/norm parameters (t,n); nonsingularity requires `t²−4n` nonzero over a field. For `t=0,n=−d/4` its discriminant parameter is d. |
| [`TauCeti.ContCohomology.Z2`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean) | Existing continuous inhomogeneous degree-two cocycles for a continuous action, as continuous cochains intersected with ker d2. The library supplies their comparison with canonical continuousCohomology through the discrete explicit `H²` carrier, cited below. |
| [`TauCeti.ContCohomology.explicitInfl2`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean) | Existing explicit degree-two inflation from a normal-subgroup quotient with fixed-point coefficients to the full group. Use the library’s `explicitIso_infl2` to transport this map to canonical continuousCohomology, through the coefficient dictionary. |
| [`WeierstrassCurve.exists_variableChange_of_j_eq`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/EllipticCurve/IsomOfJ.lean) | Two nonsingular Weierstrass curves over a separably closed field with equal j-invariant differ by a native VariableChange. Includes the exceptional `j=0` and `j=1728` cases. |
| [`CuspForm.hasEntireExtension_qExpansion_coeff`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean) | For a positive-weight cusp form on the native finite-index subgroup, the Dirichlet series of its q-expansion coefficients has an entire extension. This does not supply the normalized newform Euler product or the Fricke pseudo-eigenvalue comparison. |
| [`HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean) | At fixed positive level, weight and nebentypus, normalized newforms agree if their eigenvalues agree at every index coprime to the level outside a finite set. Cross-level comparison and agreement only at almost all primes need the cross-level extension in ModularForms Layer 5. |
| [`isInternal_cuspFormCharSpace`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/ModularForms/CharacterDecomp.lean) | At every natural level N and integer weight k, the native cuspFormCharSpace k χ form an internal direct sum in the `Γ₁(N)` cusp-form space. Only decidable equality on diamond characters is required; no finite-dimensionality or positive-level hypothesis. |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.finrank_tangentSpace_eq_dim`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean#L193) | The native tangent finrank, coerced into `WithBot ℕ∞`, equals `A.dim`; use this library theorem for the dimension bridge. |
| [`TauCeti.AlgebraicGeometry.AbelianVariety.Hom.baseChange`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Hom/BaseChange.lean); [`AbelianVariety.End.baseChange`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/End/BaseChange.lean) | Base change of actual morphisms and the resulting endomorphism-ring map, respecting composition and integer multiplication. |
| [`TauCeti.ContCohomology.explicitH2IsoContinuousCohomology`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean#L414) | For a compact topological group and a discrete abelian coefficient group with continuous action, identifies DiscreteH2 with canonical degree-two continuous cohomology of ofDiscreteModule. The explicit source has the discrete topology. |
| [`TauCeti.ContCohomology.explicitIso_coeffMap2`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/ComparisonDegreeTwo.lean#L90); [`explicitIso_infl2`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Comparison.lean#L148) | The comparison respects equivariant coefficient maps and quotient inflation, with the coefficient dictionary on invariants. Apply to the trivial discrete actions here. |
| [`TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_of_module_rat`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/Torsion.lean#L124) | Positive-degree cohomology of a discrete representation of a compact topological group vanishes when its coefficient group is a ℚ-module. Use for the uniquely divisible quotient `ℚ̄ˣ/μ_∞`. |

## How to read the build

Layer 1 develops the endomorphism structure, Layer 2 its compatible Tate components, and Layer 3
proves modularity using only good-prime comparisons. Layer 4 identifies the conductor,
least level and all-place local factors. Layer 5 constructs the GL₂-type factor of a
non-CM ℚ-curve; Layer 6 descends the Galois comparison by a finite character and applies
solvable base change. [`Suggested.lean`](Suggested.lean) states the centralizer and
simple-power decomposition theorem, the totally-real-or-CM alternative and Ribet's
geometric ℚ-curve factor theorem, as `ribetTheorem21`, `totallyRealOrCm` and
`ribetTheorem61`. Its notation is
`Qbar`, `GQ`, `AVQ`, `End0`, `IsSimpleOverQ` and `IsGeometricQCurve`.
The file is not an exhaustive checklist. The modular Jacobians, abelian λ-adic
components, conductors, Weil–Deligne parameters and automorphic representations
needed to state the other headline conclusions do not exist at the pins; their
constructions and the resulting theorems are specified by the targets and supplier
contracts below.

The small modular-curve data in the Checks are explicit hypotheses of those worked
specializations: the indicated genera, Hecke polynomials, coefficient fields, models,
and newform labels are not computation targets. General theorems use only their stated
geometric and representation-theoretic hypotheses.

## Layer 1: Abelian varieties of GL₂-type and their endomorphism algebras

The GL₂-type bundle is imported from SmallRamificationAndAbelianVarietyBaseCases §5.1. This layer identifies its rational endomorphism algebra, separates powers from primitive varieties, and establishes the structural properties used by the modularity argument. Every action is an action on an actual abelian variety.

### Native rational-action notation

For a native abelian variety `A/K`, `End0 A` is exactly
`ℚ ⊗[ℤ] AbelianVariety.End A`. The canonical map from integral endomorphisms
sends `a` to `1 ⊗ a`; it preserves zero, one, addition and multiplication. The aliases
`Qbar`, `GQ` and `AVQ` denote `AlgebraicClosure ℚ`,
`Field.absoluteGaloisGroup ℚ` and the native abelian varieties over `ℚ`.
Finite dimension is `Module.finrank ℚ A.TangentSpace`;
the dimension comparison is the supplied library theorem in the contracts above.
These are notation on the supplier's rational endomorphism theory, not a second
endomorphism ring. (Ribet92, §2, pp. 2–3; AbelianSchemesAndArithmeticModuli §A6.26.)

**Checks.**

- The integer scalar `[2]` maps to `2 • 1` in `End0 A`, whereas zero maps to zero;
  the multiplication convention sends `[2] ∘ [3]` to `6 • 1`.
- For a dimension-one variety over `ℚ`, `Module.finrank ℚ A.TangentSpace = 1`; for `B × B` with
  `dim B = 1` it is `2`; for the zero variety it is `0`.
- `End0` rationalizes integral scalars: the scalar `[2]` has inverse `1/2` on a
  positive-dimensional variety. Treating `End0` as integral `End` would fail this check.

The suggested predicate `IsSimpleOverQ A` spells the supplier's
AbelianSchemesAndArithmeticModuli §A6.4 notion on the existing carriers: `A.dim ≠ 0`,
and for every closed-immersion homomorphism `B → A`, either `B.dim = 0` or its
scheme map is surjective. A surjective closed immersion here is an isomorphism.
Use the supplier's isogeny invariance, zero exclusion and division-algebra theorem.
For field actions `ιA : E →ₐ[ℚ] End0 A`, `ιB : E →ₐ[ℚ] End0 B`,
equivariance of f means that for every `x : E` some common nonzero
integer `n` clears its two denominators, giving integral endomorphisms `a, b`
with `a = n·ιA(x)`, `b = n·ιB(x)` in the rational rings and `f ∘ a = b ∘ f`.
The API must identify this with intertwining on rational Hom, prove independence
of the chosen denominator, and compatibility with identity, composition and
isogeny inverses. (Ribet92, proof of Theorem 2.1, p. 3;
AbelianSchemesAndArithmeticModuli §§A6.4, A6.22 and A6.26.)

**Checks.**

- A dimension-one variety is simple; `B × B` for positive-dimensional `B` is not,
  since the first factor is a proper positive-dimensional closed subgroup.
- The zero variety is not simple; the
  positive-dimension clause is essential.
- Identity and integer-scalar isogenies are equivariant for the same action.
  For the two conjugate embeddings of a quadratic field into `M₂(ℚ)`, the
  identity map is not equivariant, whereas the matrix conjugating the embeddings is.
- Denominator `2n` yields the same equivariance as denominator `n`; taking `n=0`
  would incorrectly make every map equivariant and is excluded.

### 1.1 The degree of an acting division algebra divides the dimension

Prove that if a finite-dimensional division ℚ-algebra D acts unitally on `End⁰_ℚ(A)`, the map `D → End⁰_ℚ(A)` sending 1 to the identity, then `dim_ℚ D` divides dim A. Consequently an E-stable, nonzero abelian subvariety B of a `GL₂(E)`-type A equals A. Stability here is up to isogeny: every `e ∈ E` has a nonzero integer multiple `n·e ∈ End_ℚ(A)` mapping B into B.
For a closed-immersion homomorphism `f : B → A`, stability under ι
requires, for each `e`, integral endomorphisms `a` of A and `b` of B and
`n ∈ ℤ`, `n ≠ 0`, with `a = n·ι(e)` in `End0 A` and `a ∘ f = f ∘ b`.
Prove that f is surjective
when B has positive dimension and `[E:ℚ] = dim A`.

The divisibility theorem says that
`Module.finrank ℚ A.TangentSpace` is divisible by `Module.finrank ℚ D` for every acting
finite-dimensional division ℚ-algebra D, including noncommutative ones.

The proof uses the following steps.

1. `End⁰_ℚ(A)` acts ℚ-linearly on the tangent space `Lie(A/ℚ) = T₀A` (Tau Ceti AbelianVariety.TangentSpace), of ℚ-dimension dim A; an isogeny induces an isomorphism on tangent spaces in characteristic 0, so endomorphisms up to isogeny act.
2. Apply Mathlib `Module.finrank_dvd_finrank_right` to the resulting unital division-algebra module and the supplied tangent-dimension comparison. The new work is constructing this derivative action and identifying the stable-subvariety action, rather than reproving the tower law.
3. For B: E acts on `Lie(B/ℚ)`, of dimension dim B, so `[E : ℚ] = dim A` divides `dim B ≤ dim A`, whence `B = A`.

**Checks.**

- For `E × E` with E an elliptic curve over ℚ, every quadratic field acting has degree `2 = dim`; no cubic field acts.
- Over `𝔽_p` the tangent-space argument fails: the Frobenius endomorphism acts by zero on Lie.
- The identity inclusion is stable for every rational field action.
- Every homomorphism is stable for the rational scalar ℚ-action; in particular,
  the proper first factor of `B₀ × B₀` is stable for that action.
- On `B₀ × B₀` with `dim B₀ = 1` and the regular `ℚ(√2)`-action, the first
  factor is not stable: the matrix of `√2` sends it to the second factor. Allowing
  `n = 0` would incorrectly declare it stable and contradict the conclusion.

*Needs:* `TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`; `AbelianSchemesAndArithmeticModuli A6`; `TauCeti.AlgebraicGeometry.AbelianVariety`; `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `TauCeti.AlgebraicGeometry.AbelianVariety.finrank_tangentSpace_eq_dim`.

Sources: [Ribet92](#references), §2, p. 2.

### 1.2 Primitive abelian varieties of GL₂-type and the power construction

Define the following notions. Given a `GL₂(F)`-type B over ℚ and a finite extension E/F of degree n, choose an F-basis of E. Define `E ⊗_F B` as the power `Bⁿ`, equipped with the E-action through its regular representation `E ↪ M_n(F) ↪ End⁰_ℚ(Bⁿ)`. Its dimension is `[E : ℚ]`, so it is of `GL₂(E)`-type. A `GL₂(E)`-type A is primitive when no E-equivariant ℚ-isogeny identifies it with such a construction for `[E : F] > 1`. The equivariant isogeny class is independent of the chosen basis: the isogeny class of `E ⊗_F B` with its E-action does not depend on the chosen F-basis of E.

The underlying native power is `piObj (fun _ : Fin [E:F] => B)`.
Construct its rational E-action for a number-field tower `ℚ ⊆ F ⊆ E`, a basis
`b : Module.Basis (Fin [E:F]) F E` and the given rational F-action ι.
For every `x : E`, a common nonzero integer n makes `n·ιE(x)` an integral
endomorphism whose `(i,j)` entry, in `End0 B`, is `n·ι((b.repr (x·b j)) i)`.
Entries use the actual coordinate inclusions and projections of the native product.
This characterizes the regular multiplication action.
For `F = ℚ`, `[E:ℚ] = 2` and basis `(1, √2)`, the native inclusion into
the first coordinate is not stable when `dim B = 1`.

Primitivity quantifies over intermediate fields F, `GL₂(F)`-type varieties B,
such bases and E-equivariant isogenies to these powers, excluding all with
`[E:F] > 1`. Its full meaning includes the action, not just the underlying power
variety.

Require the following constructions and laws.

- `E ⊗_F B` for B of `GL₂(F)`-type over ℚ and a finite extension E/F with a chosen F-basis.
- `dim (E ⊗_F B) = [E : F] · dim B`.
- The power constructions for two F-bases of E are E-equivariantly ℚ-isogenous (the change of basis has entries in F, acting through `End⁰`).
- The predicate on (A, E): not E-equivariantly ℚ-isogenous to a power construction with `[E : F] > 1`.
- Primitivity is invariant under E-equivariant ℚ-isogeny.
- A is primitive if and only if A is ℚ-simple (§1.3).

**Checks.**

- For `E = F` the power construction is B itself with its structure, and B is primitive exactly when it is ℚ-simple.
- For an elliptic curve B over ℚ and `E = ℚ(√2)`, `E ⊗_ℚ B = B × B` is of `GL₂(E)`-type but not primitive.
- `J₀(23)`, of dimension two with `E = ℚ(√5)` acting through the Hecke algebra, is primitive.
- The power construction satisfies the definition of SmallRamificationAndAbelianVarietyBaseCases §5.1: `[E : ℚ] = dim (E ⊗_F B)`.

The proof uses the following steps.

1. Embed E into `M_n(F)` by its action on the chosen basis and let `M_n(F)` act on `Bⁿ` by matrices with entries in the image of F (A6: `End⁰(Bⁿ) = M_n(End⁰(B))`).
2. Then `[E : ℚ] = n[F : ℚ] = n dim B = dim Bⁿ`, so the construction is of `GL₂(E)`-type; a change of basis conjugates the embedding by an element of `GL_n(F) ⊆ GL_n(End⁰_ℚ(B))`, which is an E-equivariant isogeny of `Bⁿ`.

**Checks.**

- For `n > 1`, `E ⊗_F B = Bⁿ` is not ℚ-simple.
- Every elliptic curve over ℚ is primitive `(E = ℚ)`.

*Needs:* `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `AbelianSchemesAndArithmeticModuli A6`; `TauCeti.AlgebraicGeometry.AbelianVariety.prod`; `TauCeti.AlgebraicGeometry.AbelianVariety.End`.

Sources: [Ribet92](#references), §2, p. 3.

### 1.3 Ribet's Theorem 2.1: primitive, simple and maximal endomorphism field

Prove the following. For `GL₂(E)`-type A, put `X = End⁰_ℚ(A)`. The centralizer of E in X is E. Its centre F lies in E; with `n = [E : F]`, one has `X ≃ M_n(F)` and an E-equivariant ℚ-isogeny `A ∼ E ⊗_F B`, where B is ℚ-simple, `End⁰_ℚ(B) = F` and B has `GL₂(F)`-type. Thus primitivity, ℚ-simplicity, and the assertion that X is a number field of degree dim A are equivalent. Under these equivalent conditions the given copy of E is all of X.

`ribetTheorem21` in `Suggested.lean` states the centralizer assertion,
equivalence of simplicity with surjectivity of the given E-action, the matrix
algebra with its regular E-action, and the underlying simple-power isogeny
decomposition. The action is arbitrary subject to `[E:ℚ] = dim A`; the statement
includes nonsimple varieties.

The proof uses the following steps.

1. The commutant D of E in X is a division algebra: a nonzero endomorphism commuting with E has image `B ⊆ A` on which E acts, so `B = A` by §1.1, and the endomorphism is an isogeny (A6).
2. `Lie(A/ℚ)` is a D-module, so `dim_ℚ D` divides `dim A = [E : ℚ]` (§1.1); as `E ⊆ D`, `D = E`. Hence E is a maximal commutative subalgebra of the semisimple algebra X (A6) and the centre F of X lies in E.
3. X is simple (its centre F is a field), so `X ≅ M_n(Q)` with Q a division algebra of dimension `t²` over F, and maximality of E gives `nt = [E : F]`. A is isogenous to `Bⁿ` with `End⁰(B) = Q` (A6, Poincaré reducibility), and the Lie argument gives `n t² [F : ℚ] | [E : ℚ] = nt[F : ℚ]`, so `t = 1`, `Q = F` and `n = [E : F]`.
4. Each of (i)–(iii) is equivalent to `n = 1`.

**Checks.**

- For `A = B × B` with B an elliptic curve over ℚ without CM and `E = ℚ(i)`: `X = M₂(ℚ)`, `F = ℚ`, `n = 2`.
- For `J₀(23)`: `X = ℚ(√5)`, `n = 1`.

*Needs:* §1.1; §1.2; `AbelianSchemesAndArithmeticModuli A6`; `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

Sources: [Ribet92](#references), Theorem 2.1, p. 3; [Ribet92](#references), proof of Theorem 2.1, p. 3.

### 1.4 The endomorphism field of a ℚ-simple GL₂-type variety

Construct the following data. For a ℚ-simple GL₂-type A define `E_A` to be its actual rational endomorphism algebra, with the compatible number-field structure supplied by the preceding theorem. Its degree is dim A and its identity action supplies `GL₂(E_A)`-type. Any given `GL₂(E)`-type embedding ι is an isomorphism `E ≃ E_A`. Transport along ι identifies the coefficient fields, primes and λ-adic representations of the two descriptions. Throughout, A is ℚ-simple and of `GL₂(E)`-type for some E in the sense of SmallRamificationAndAbelianVarietyBaseCases §5.1.

Require the following constructions and laws.

- `E_A = End⁰_ℚ(A)` as a field, for ℚ-simple A of GL₂-type.
- `E_A` is a number field.
- `[E_A : ℚ] = dim A`.
- The tautological `GL₂(E_A)`-type structure in the sense of SmallRamificationAndAbelianVarietyBaseCases §5.1.
- Every `GL₂(E)`-type structure ι on A is a field isomorphism `E ≃ E_A`.
- A ℚ-isogeny `φ : A → A′` induces `E_A ≃ E_{A′}`, `α ↦ φ ∘ α ∘ φ⁻¹`, compatibly with the λ-adic representations.
- The canonical involution of `E_A` (§1.5) is the Rosati involution of every ℚ-polarization.

**Checks.**

- For an elliptic curve E₀ over ℚ, `E_{E₀} = ℚ` (`End_ℚ(E₀) = ℤ`, EllipticCurveModularity R29.1).
- `E_{J₀(23)} = ℚ(√5)`, generated by the Hecke operator T₂ with `T₂² + T₂ − 1 = 0`.
- `E_{J₁(13)} = ℚ(√−3)`, a CM field, matching the order-6 character of the newform of level 13.
- For `B × B` with B an elliptic curve over ℚ, `End⁰_ℚ = M₂(ℚ)` is not a field: simplicity is needed.

The proof uses the following steps.

1. By §1.3, `X = End⁰_ℚ(A)` is a number field of degree dim A containing `ι(E)`, hence equal to `ι(E)`.
2. Transport of structure along ι identifies the λ-adic representations `V_λ(A)` for E and for `E_A`.

**Checks.**

- For an elliptic curve over ℚ, `E_A = ℚ`.
- For `J₀(23)`, `E_A = ℚ(√5)`; for `J₁(13)`, `E_A = ℚ(√−3)`.

*Needs:* §1.3; `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `AbelianSchemesAndArithmeticModuli A6`.

Sources: [Ribet92](#references), §3, p. 4.

### 1.5 The endomorphism field is totally real or CM, with the Rosati involution as canonical involution

Prove the following. The endomorphism field of a ℚ-simple GL₂-type A is totally real or CM. Every polarization defined over ℚ induces the same restriction of Rosati to that field: the identity in the totally real case and the canonical complex conjugation in the CM case. In particular this field involution is independent of the polarization.

`totallyRealOrCm` in `Suggested.lean` states the field alternative on the
given coefficient field E. The Rosati conclusion uses the polarizations and
positive involutions specified by the supplier contracts.

The proof uses the following steps.

1. A ℚ-polarization λ defines the Rosati involution † on `End⁰_ℚ(A) = E` (A2), a positive involution: `Tr(x x†) > 0` for `x ≠ 0` (AbelianSchemesAndArithmeticModuli §A6.14).
2. A number field with a positive involution is totally real with trivial involution, or CM with the involution equal to complex conjugation under every complex embedding: this is the commutative case of the Albert classification (PELModuli §§M0.1–M0.2 with `B = E`: types C and A of degree one).
3. The complex conjugation of a CM field is unique, so † is independent of λ.

**Checks.**

- For `J₀(23)`, `E = ℚ(√5)` is totally real and every Rosati involution is the identity on E.
- For `J₁(13)`, `E = ℚ(√−3)` and the Rosati involution is complex conjugation.

*Needs:* `AbelianSchemesAndArithmeticModuli A2`; `AbelianSchemesAndArithmeticModuli A6`; `PELModuli §§M0.1–M0.2`; §1.4; `NumberField.IsCMField`; `NumberField.IsTotallyReal`.

Sources: [Ribet92](#references), §3, p. 4; [Ribet92](#references), §3, p. 6.

### 1.6 The modular quotient `A_f` is ℚ-simple of GL₂-type with endomorphism field `K_f`

Prove the following. Let f be a normalized weight-two newform on `Γ₁(N)`, with positive N, coefficient field `K_f` and character `ε_f`: an eigenform for all `T_n` and diamond operators, new at level N, with `a₁(f) = 1`. The quotient `A_f = J₁(N)/p_f J₁(N)` of ModularCurvesPartII §§16.1–16.7 is ℚ-simple, and its Hecke action identifies `K_f` with `End⁰_ℚ(A_f)`; in particular it has `GL₂(K_f)`-type. More generally `J₁(N)` is ℚ-isogenous to `∏_{M | N} ∏_{[g]} A_g^{d(N/M)}`, where [g] runs through the coefficient-conjugacy orbits of weight-two newforms of level M and d is the divisor-counting function.

The proof uses the following steps.

1. `dim A_f = [K_f : ℚ]` and the `K_f`-action are ModularCurvesPartII §§16.1–16.7; so `A_f` is of `GL₂(K_f)`-type.
2. `V_ℓ(A_f) ≅ ⊕_{λ|ℓ} ρ_{f,λ}` (AutomorphicGaloisRepresentations §§6.1–6.4), with the `ρ_{f,λ} ⊗ ℚ̄_ℓ` for the different embeddings `σ : K_f → ℚ̄_ℓ` absolutely irreducible (AutomorphicGaloisRepresentations §4.8). Let L be generated by the good-prime eigenvalues outside any chosen finite exceptional set containing the primes dividing Nℓ. ModularForms Layer 8G supplies the conjugate newform for each embedding of `K_f`. If two embeddings agree on L, cross-level strong multiplicity one (ModularForms Layer 5) identifies their conjugate newforms, hence all their coefficients. Since `K_f = ℚ(a_n(f) : n ≥ 1)`, the embeddings agree on `K_f`, proving `L = K_f`. Thus the constituents are pairwise non-isomorphic: distinct embeddings have different good Frobenius traces. Faltings (FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.6) gives `End⁰_ℚ(A_f) ⊗ ℚ_ℓ = End_{G_ℚ} V_ℓ(A_f) = K_f ⊗ ℚ_ℓ`, so `End⁰_ℚ(A_f) = K_f` ([Ribet80](#references), Corollary 4.2, p. 51, by a different argument).
3. A field endomorphism algebra forces ℚ-simplicity (§1.3). The isogeny decomposition of `J₁(N)` follows from the old/new decomposition of `S₂(Γ₁(N))` (ModularForms Layer 4 and ModularCurvesPartII §16.6, Oldforms) and the Hecke-equivariant identification of the cotangent space of `J₁(N)` with `S₂(Γ₁(N))`.

**Checks.**

- `N = 11`: `A_f = J₁(11)` is ℚ-isogenous to `J₀(11) ≃ X₀(11)`, and
  `K_f = ℚ`, through ModularCurvesPartII §16.5, Trivial character. These curves are not isomorphic:
  the model `y² + y = x³ − x²` of `X₁(11)` has `j = −4096/11`, whereas
  the model `y² + y = x³ − x² − 10x − 20` of `X₀(11)` has
  `j = −122023936/161051`.
- `N = 23`: `A_f` is ℚ-isogenous to `J₀(23)` by ModularCurvesPartII §16.5,
  and `K_f = ℚ(√5)`.
- `N = 13` on Γ₁: `J₁(13)` is `A_f` for the newform with character of order 6; `K_f = ℚ(√−3)` is CM.

*Needs:* `ModularCurvesPartII §§16.1–16.7`; `AutomorphicGaloisRepresentations §§6.1–6.4`; `AutomorphicGaloisRepresentations §§1.5 and 4.8`; `FaltingsFinitenessAndIsogenyTheorems R28.4`; §1.3; `ModularForms Layers 4–5 and 8G`; `Chebotarev Layer 10`; `ModularForms Layer 8`.

Sources: [Ribet92](#references), §3, p. 4.


### Examples

The degree-one power returns the original action; the quadratic regular action on `B × B` is not primitive. With the explicit level-23 Hecke data stated above, the field case has `n = 1` in Theorem 2.1 and is primitive.

### Dependencies

*Needs:* AbelianSchemesAndArithmeticModuli §§A1.6, A6.4–A6.14 and A6.26; SmallRamificationAndAbelianVarietyBaseCases §5.1; ModularCurvesPartII §§16.1–16.4; RepresentationTheory, SemisimpleAlgebras Layers 1–3.

## Layer 2: The λ-adic system of a GL₂-type abelian variety

Throughout this layer A is ℚ-simple of GL₂-type, `E = End⁰_ℚ(A)`, S is its set of bad primes, and `ρ_λ` acts on the native `V_λ(A)`. This common hypothesis applies to every target below. The integral model is used whenever residual torsion is mentioned. The layer proves precisely the hypotheses needed to apply the weight-two Serre theorem.

Build the targets in this order: integral-model, frobenius-polynomial,
crystalline-at-good-primes, determinant-character, odd, absolute-irreducibility,
coefficient-conjugation, coefficients-generate, inner-twist-field,
residual-irreducibility, conductor-bound. The crystalline target uses Layer 1 and
the integral model, independently of the determinant character.

### 2.1 The integral model with endomorphism ring `𝒪_E`

Construct the following data. Choose an E-equivariant ℚ-isogeny `A → A′` such that `End_ℚ(A′)` identifies with `𝒪_E`. Such an A′ exists. For every maximal ideal λ of `𝒪_E` the actual group `A′[λ]` is a two-dimensional vector space over `𝔽_λ` with continuous `G_ℚ`-action. Its semisimplification is the semisimplified reduction of `ρ_λ` and is independent of the integral model.

The residual representation of ArithmeticGaloisRepresentations §6.4, Endomorphism coefficients, requires `𝒪_E ⊆ End_ℚ(A′)`; this node supplies such an A′. Specialize that supplied residual action to this model. For an elliptic curve it is compared with `TateModule.residualRep` of ArithmeticGaloisRepresentations §6.1, rather than constructing another elliptic torsion action.

An integral model records the native variety A′, a native isogeny `A → A′`,
an intertwining rational E-action and a ring equivalence `𝓞 E ≃+* End A′`
whose image in `End0 A′` agrees with that rational action on each algebraic
integer. Prove existence for simple A and `[E:ℚ] = dim A`, compatibly with the
supplied residual representations. An arbitrary isogenous variety without the
integral-action compatibility is not an integral model in this sense.

Require the following constructions and laws.

- An E-equivariantly isogenous A′ with `End_ℚ(A′) = 𝒪_E`.
- `End_ℚ(A′) = 𝒪_E` as subrings of E.
- `ρ̄_λ : G_ℚ → GL(A′[λ]) ≅ GL₂(𝔽_λ)`, from the `A′[λ] = {x ∈ A′[ℓ] : λx = 0}` interface of ArithmeticGaloisRepresentations §6.4, Endomorphism coefficients.
- `dim_{𝔽_λ} A′[λ] = 2`.
- For `p ∉ S`, `p ∉ λ`: the characteristic polynomial of `ρ̄_λ(Frob_p)` is `X² − ā_p X + ε̄(p)p`, the reduction of §2.2.
- `ρ̄_λ^{ss}` is independent of the integral model and of the lattice.

**Checks.**

- For an elliptic curve E₀ over ℚ, choose the integral model to be E₀ itself. The geometric-point comparison of ArithmeticGaloisRepresentations §6.1 then identifies `ρ̄_ℓ` with its `TateModule.residualRep E₀ ℓ`, equivariantly and compatibly with trace and determinant, before any choice of basis. An arbitrary isogenous integral model gives the same semisimplification.
- `det ρ̄_λ = ε̄ · χ̄_ℓ`, the reduction of §2.3.
- Let `B = X₀(11)`, `A = B × B`, and let `E = ℚ(√2)` act by regular matrices.
  Although `𝒪_E = ℤ[√2]` acts integrally, `End_ℚ(A) = M₂(ℤ)` is noncommutative,
  so the identity model cannot have `𝒪_E ≃ End_ℚ(A)`. Every isogenous model
  still has noncommutative rational endomorphisms, so no such integral model exists.
  This obstruction holds for every dimension-one B over ℚ, every coefficient
  field and every given action. This
  tests both the full-endomorphism equivalence and the simplicity hypothesis.
- If `End_ℚ(A) = 𝒪_E` already (for example `A_f` with `𝒪_{K_f}` acting), `A′ = A` is an integral model.
- `A′[ℓ]` is not `A′[λ]` unless `λ = ℓ𝒪_E`: `A′[ℓ] = ⊕_{λ|ℓ} A′[λ^{e_λ}]` has `𝔽_ℓ`-dimension `2[E : ℚ]`.

The proof uses the following steps.

1. For each ℓ put `L_ℓ = 𝒪_E·T_ℓ(A) ⊆ V_ℓ(A)`: a `G_ℚ`-stable, `𝒪_E`-stable lattice containing `T_ℓ(A)`, equal to it for `ℓ ∤ [𝒪_E : End_ℚ(A) ∩ E]`. Then `K = ⊕_ℓ L_ℓ/T_ℓ(A)` is a finite Galois-stable subgroup of `A(ℚ̄)`, `A′ = A/K` (A3, quotients by finite subgroup schemes) has `T_ℓ(A′) = L_ℓ`, and every element of `𝒪_E` preserves every `T_ℓ(A′)`, hence lies in `End_ℚ(A′)` (AbelianSchemesAndArithmeticModuli §§A6.2 and A3.4, saturation of End in `End ⊗ ℤ_ℓ`); so `End_ℚ(A′) = 𝒪_E`.
2. `T_ℓ(A′)` is free of rank two over `𝒪_E ⊗ ℤ_ℓ` (AbelianSchemesAndArithmeticModuli §A6.12 with ArithmeticGaloisRepresentations §6.4, Endomorphism coefficients), so `A′[λ] = T_λ(A′)/λT_λ(A′)` is two-dimensional over `𝔽_λ`, and Brauer–Nesbitt gives the independence of the semisimplification from the lattice, hence from A′.

**Checks.**

- For an elliptic curve over ℚ, `A′ = A` and `A′[ℓ] = A[ℓ]`.
- Two integral models are related by an `𝒪_E`-equivariant isogeny; the semisimplified residual representations agree.

*Needs:* §1.4; `ArithmeticGaloisRepresentations §§6.1–6.4`; `AbelianSchemesAndArithmeticModuli A6`; `AbelianSchemesAndArithmeticModuli A3`; `ArithmeticGaloisRepresentations Layer 1`.

Sources: [Ribet92](#references), §3, p. 7.

### 2.2 E-rationality of the Frobenius polynomials

Prove the following. For each good prime p there are `a_p,d_p ∈ 𝒪_E` such that, for every λ not over p, `ρ_λ` is unramified at p and has arithmetic Frobenius polynomial `X² − a_p X + d_p`. The coefficients are read through `E ↪ E_λ` and are independent of λ. This is E-rational strict compatibility in the good-prime sense of Serre, with exceptional set S.

The proof uses the following steps.

1. Néron–Ogg–Shafarevich: `ρ_λ` is unramified at `p ∉ S`, `p ≠ ℓ`, and `ρ_λ(Frob_p)` is induced by the Frobenius endomorphism `π_p` of the reduction `A_p`, which commutes with E acting by reduction (NeronModelsAndSemistableAbelianVarieties §5.0b, Good reduction).
2. For α in the commutant of E in `End⁰(A_p)`, the `E ⊗ ℚ_ℓ`-linear trace `t_ℓ(α)` of α on the free module `V_ℓ(A_p)` (AbelianSchemesAndArithmeticModuli §A6.12) satisfies `Tr_{E⊗ℚ_ℓ/ℚ_ℓ}(e·t_ℓ(α)) = Tr(eα | V_ℓ)` for all `e ∈ E`; the right side is the rational trace of `eα ∈ End⁰(A_p)`, independent of ℓ (AbelianSchemesAndArithmeticModuli §A6.11). Nondegeneracy of the trace form of E (`traceForm_nondegenerate`) gives `t_ℓ(α) ∈ E`, independent of ℓ.
3. Take `a_p = t(π_p)` and `d_p = (t(π_p)² − t(π_p²))/2`; integrality because `π_p` is integral over ℤ.

**Checks.**

- For `E = ℚ`: `a_p = p + 1 − #A_p(𝔽_p)` and `d_p = p`.
- For `J₀(23)`, `p = 2`: `X² − a₂X + 2` with `a₂ = (−1 + √5)/2`.
- At the bad prime 11 of `X₀(11)`, the local Euler polynomial is linear
  (`1 − T`); it is excluded from this good-prime quadratic formula.

*Needs:* `ArithmeticGaloisRepresentations §§6.1–6.4`; `NeronModelsAndSemistableAbelianVarieties §§5.0b and 5.4–5.7`; `AbelianSchemesAndArithmeticModuli A6`; `traceForm_nondegenerate`.

Sources: [Ribet92](#references), §3, p. 4.

### 2.3 Ribet's Lemma 3.1: the determinant is `ε·χ_ℓ`

Prove the following. One finite-order E-valued character ε works for all λ: `det ρ_λ = εχ_ℓ` for `λ | ℓ`. It is unramified at all good primes, has `N_{E/ℚ}(ε) = 1`, and may be viewed as a Dirichlet character supported only at bad primes. Consequently `d_p = ε(p)p` at every good p.

The proof uses the following steps.

1. Choose `ℓ₀ ∉ S` split completely in E (Chebotarev) and `λ₀ | ℓ₀`, so `δ = det ρ_{λ₀} : G_ℚ → ℤ_{ℓ₀}^×`. §2.11 makes δ de Rham. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3 and GlobalNumberFields Layers 9–10 identify such a global character over ℚ with an algebraic Hecke character, hence `δ = χ_{ℓ₀}^a·ε₀` with integer `a` and finite-order `ε₀`.
2. The determinant has Hodge–Tate weight `1` by §2.11,
   so `a = 1`. At every good prime `p ≠ ℓ₀`, the finite-order factor has value
   `ε₀(Frob_p) = d_p/p ∈ E`, through the chosen embedding into `ℚ_{ℓ₀}`.
   Every value in its finite image occurs at such a Frobenius element by
   Chebotarev. Thus ε₀ is the realization of one finite-order E-valued character ε.
3. For every λ, compare `det ρ_λ` with `εχ_ℓ` on good Frobenius elements away
   from ℓ and ℓ₀, using their common coefficients `d_p`. Chebotarev identifies
   the characters, without a de Rham hypothesis at bad coefficient primes.
   For any good p choose λ not over p; both `det ρ_λ` and `χ_ℓ` are unramified
   there, so ε is unramified at p. Comparing
   `det_{ℚ_ℓ} V_ℓ(A) = χ_ℓ^{dim A}` with
   `∏_λ N_{E_λ/ℚ_ℓ}(εχ_ℓ)` gives `N_{E/ℚ}(ε) = 1`.

**Checks.**

- For E totally real, `ε = 1` and `det ρ_λ = χ_ℓ`, as in ArithmeticGaloisRepresentations §6.4, Endomorphism coefficients.
- For `J₁(13)`, ε is the character of order 6 of the newform of level 13, with values in `ℚ(√−3)`.
- For `X₀(11)` at `λ = 11`, good-prime crystallinity does not apply, but the
  Frobenius comparison still proves `det ρ₁₁ = χ₁₁`.

*Needs:* §2.2; §2.11; GlobalNumberFields Layers 9–10; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3`; `NeronModelsAndSemistableAbelianVarieties §§5.4–5.7`; `ArithmeticGaloisRepresentations §§6.1–6.4`; `Chebotarev Layer 10`; `ArithmeticGaloisRepresentations Layer 2`; `DirichletCharacter`; `cyclotomicCharacter`.

Sources: [Ribet92](#references), Lemma 3.1, p. 4; [Ribet92](#references), proof of Lemma 3.1, p. 5.

### 2.4 Ribet's Lemma 3.2: the system is odd

Prove the following. For every complex conjugation c in `G_ℚ`, `ε(c) = 1` and `det ρ_λ(c) = −1`. Thus ε is even and every λ-adic component is odd in the sense of ArithmeticGaloisRepresentations §4.1.

The proof uses the following steps.

1. Fix `ℚ̄ ⊂ ℂ`. The comparison `V_ℓ(A) ≅ H₁(A(ℂ), ℚ) ⊗ ℚ_ℓ` is E-equivariant and identifies complex conjugation c with `F_∞ ⊗ 1`, `F_∞` the real Frobenius on `H₁(A(ℂ), ℚ)`, an E-linear involution of a two-dimensional E-vector space; hence `V_λ ≅ H₁(A(ℂ), ℚ) ⊗_E E_λ` with c acting as `F_∞ ⊗ 1`.
2. `det_E F_∞ = +1` would force `F_∞ = ±1`, but `F_∞ ⊗ 1` interchanges `H^{-1,0}` and `H^{0,-1}` in `H₁(A(ℂ), ℚ) ⊗ ℂ`, so `F_∞` is not a scalar. Hence `det ρ_λ(c) = −1` and `ε(c) = 1` since `χ_ℓ(c) = −1`.
3. For E totally real this is also ArithmeticGaloisRepresentations §6.2 together with §6.4, Endomorphism coefficients; the CM case needs the Hodge decomposition.

**Checks.**

- For an elliptic curve over ℚ, `det ρ_ℓ(c) = −1`.
- Consequence: the newform attached in Layer 3 has even character `ε(−1) = 1`, as weight-two forms must.
- A scalar action `ρ_λ(c) = ±1` would have determinant `+1` and cannot
  interchange the two nonzero Hodge summands; it fails the conclusion.

*Needs:* §2.3; `AbelianSchemesAndArithmeticModuli A6`; `ArithmeticGaloisRepresentations §§6.1–6.4`; `ArithmeticGaloisRepresentations §4.1`; `Field.absoluteGaloisGroup`.

Sources: [Ribet92](#references), Lemma 3.2, p. 5; [Ribet92](#references), proof of Lemma 3.2, p. 5.

### 2.5 Ribet's Proposition 3.3: absolute irreducibility

Prove the following. Every `ρ_λ` is absolutely irreducible, and its commutant as a `ℚ_ℓ[G_ℚ]`-module is `E_λ`. For the whole Tate module over an open subgroup `H = G_K`, the more general comparison is `End_{ℚ_ℓ[H]} V_ℓ(A) = End⁰_K(A) ⊗ ℚ_ℓ`.

The proof uses the following steps.

1. Faltings: `V_ℓ(A)` is a semisimple `ℚ_ℓ[G_ℚ]`-module and `End_{ℚ_ℓ[G_ℚ]} V_ℓ(A) = End⁰_ℚ(A) ⊗ ℚ_ℓ = E ⊗ ℚ_ℓ` (FaltingsFinitenessAndIsogenyTheorems R28.4; the version over K is the same theorem over K).
2. `V_ℓ = ⊕_λ V_λ` with `E ⊗ ℚ_ℓ = ∏ E_λ` acting factorwise, so each `V_λ` is semisimple with commutant `E_λ`; a semisimple module whose commutant is a field is simple, and `End_{E_λ[G]} V_λ = E_λ` persists after extension of scalars in characteristic 0, which is absolute irreducibility.

**Checks.**

- For `E = ℚ`: `V_ℓ` of an elliptic curve over ℚ is absolutely irreducible (EllipticCurveModularity R29.6).
- Fails over a field of definition of extra endomorphisms: for a CM elliptic curve over ℚ, `V_ℓ` restricted to the Galois group of the CM field is reducible over `ℚ̄_ℓ`.

*Needs:* §1.4; `ArithmeticGaloisRepresentations §§6.1–6.4`; `FaltingsFinitenessAndIsogenyTheorems R28.4`; `IsSemisimpleModule`.

Sources: [Ribet92](#references), Proposition 3.3, p. 5.

### 2.6 Ribet's Proposition 3.4: `a_p = ε(p)·ā_p`

Prove the following. Write bar for the canonical involution of E from Layer 1. At every good prime p, `a_p = ε(p)ā_p`. On representations this is `V_σ ≃ V_{σ̄} ⊗ σ(ε)` for every `σ : E ↪ ℚ̄_ℓ`, where `V_σ = V_ℓ(A) ⊗_{E⊗ℚ_ℓ,σ} ℚ̄_ℓ` and `σ̄ = σ ∘ bar`.

The proof uses the following steps.

1. A polarization over ℚ gives a `G_ℚ`-equivariant Weil pairing `⟨ , ⟩ : V_ℓ × V_ℓ → ℚ_ℓ(1)` with `⟨e x, y⟩ = ⟨x, ē y⟩` (ArithmeticGaloisRepresentations §6.2; the Rosati involution is the canonical involution by §1.5 and AbelianSchemesAndArithmeticModuli §A3.9).
2. After extension of scalars this gives `V_{σ̄} ≅ Hom(V_σ, ℚ̄_ℓ(1))`; as `V_σ` is two-dimensional with determinant `σ(ε)χ_ℓ`, `Hom(V_σ, ℚ̄_ℓ(σ(ε)χ_ℓ)) ≅ V_σ`, so `V_σ ≅ V_{σ̄} ⊗ σ(ε)`.
3. Take traces of `Frob_p` for `p ∉ S ∪ {ℓ}`: `σ(a_p) = σ(ε(p))·σ(ā_p)`.

**Checks.**

- For E totally real, consistent with `ε = 1`.
- For a newform with character ε: `ā_p = ε(p)⁻¹a_p`, the classical relation.

*Needs:* §2.3; §1.5; `ArithmeticGaloisRepresentations §§6.1–6.4`; `AbelianSchemesAndArithmeticModuli A2`.

Sources: [Ribet92](#references), Proposition 3.4, p. 6.

### 2.7 Ribet's Proposition 3.5: the traces generate E

Prove the following. Deleting any finite set S′ containing the bad primes leaves enough Frobenius traces to generate the whole field: `E = ℚ(a_p : p ∉ S′)`.

The proof uses the following steps.

1. Fix ℓ and let `V_σ` (`σ : E → ℚ̄_ℓ`) be the components of `V_ℓ ⊗ ℚ̄_ℓ`. By Faltings (§2.5) the commutant of `G_ℚ` is `E ⊗ ℚ̄_ℓ = ∏_σ ℚ̄_ℓ`, so the `V_σ` are simple and pairwise non-isomorphic.
2. Semisimple representations in characteristic 0 with equal traces are isomorphic (ArithmeticGaloisRepresentations §1.8), so the trace functions of the `V_σ` are distinct; by Chebotarev they are distinguished by their values `σ(a_p)` at `Frob_p`, `p ∉ S′ ∪ {ℓ}`. So distinct embeddings differ on `ℚ(a_p : p ∉ S′)`, which is therefore E.

**Checks.**

- For `J₀(23)`: `a₂ = (−1 + √5)/2` generates E.
- Removing finitely many primes does not change the field.

*Needs:* §2.5; §2.2; `Chebotarev Layer 10`; `ArithmeticGaloisRepresentations Layer 1`.

Sources: [Ribet92](#references), Proposition 3.5, p. 6.

### 2.8 Ribet's Proposition 3.6: `F = ℚ(a_p²/ε(p))` is totally real and E/F is abelian

Prove the following. The subfield `F = ℚ(a_p²/ε(p) : p ∉ S)` of E is totally real, and E/F is an abelian extension.

The proof uses the following steps.

1. By §2.6, the conjugate of `a_p²/ε(p)` is `ā_p²/ε̄(p) = ε(p)⁻²a_p² · ε(p) = a_p²/ε(p)`, so F is fixed by the canonical involution and is totally real (§1.5).
2. Adjoin all roots of unity and the square roots of `t_p = a_p²/ε(p)` to F. This is an abelian extension of F (a compositum of cyclotomic and quadratic extensions). Since `ε(p)` is a root of unity, its square roots lie in this extension too; `a_p = ±√t_p·√ε(p)` lies there, including `a_p = 0`. §2.7 then places E inside this abelian extension, so E/F is abelian. This is Ribet’s argument, not the claim that `√t_p` and `ε(p)` alone generate E.

**Checks.**

- For `J₀(23)`, `F = E = ℚ(√5)`.
- For the newform of level 169 with `E = ℚ(√3)` in Ribet §7, `F = ℚ` (an extra twist).

*Needs:* §2.6; §2.7; §1.5; §2.3.

Sources: [Ribet92](#references), Proposition 3.6, p. 7.

### 2.9 Ribet's Lemma 3.7: residual absolute irreducibility for almost all λ

Prove the following. For an integral model A′, the `G_ℚ`-action on `A′[λ]` is absolutely irreducible for all but finitely many maximal ideals λ of `𝒪_E`. In dimension one this specializes to the almost-all irreducibility of elliptic prime torsion in R29.1.

The proof uses the following steps.

1. For almost all ℓ, the `ℤ_ℓ`-algebra generated by `G_ℚ` in `End(T_ℓ(A′))` is the full commutant of `End_ℚ(A′) ⊗ ℤ_ℓ = 𝒪_E ⊗ ℤ_ℓ` (FaltingsFinitenessAndIsogenyTheorems R28.6), that is `∏_{λ|ℓ} M₂(𝒪_λ)` for ℓ unramified in E, `T_ℓ(A′)` being free of rank two over `𝒪_E ⊗ ℤ_ℓ`.
2. Reducing modulo ℓ, the `𝔽_ℓ`-span of `ρ̄(G_ℚ)` on `A′[ℓ] = ⊕_λ A′[λ]` is `∏_λ M₂(𝔽_λ)`, so each `A′[λ]` is absolutely irreducible. Ribet deduces the same from Faltings' mod-ℓ theorem ([FW84](#references), Theorem 1, p. 204, as cited in [Ribet92](#references), proof of Lemma 3.7, p. 7).

**Checks.**

- Compatible with the parent: for an elliptic curve over ℚ, `E[p]` is irreducible for all but finitely many p.
- Exceptions occur: `X₀(11)` has reducible `X₀(11)[5]` (a rational 5-torsion point).

*Needs:* §2.1; `FaltingsFinitenessAndIsogenyTheorems R28.6`; `AbelianSchemesAndArithmeticModuli A6`.

Sources: [Ribet92](#references), Lemma 3.7, p. 7.

### 2.10 Bounded conductors of the λ-adic and residual representations

Prove the following. Let `cond(A) = ∏_p p^{f_p(A)}`, with `f_p(A)` the Artin conductor exponent of `V_ℓ(A)` for an auxiliary `ℓ ≠ p`. For λ of residue degree one over ℓ, the prime-to-ℓ conductors satisfy `N(ρ̄_λ) | N(ρ_λ) | cond(A)`. Scalar restriction in the proof retains the factor `[E_λ : ℚ_ℓ]`, even when the residue degree is one.

The proof uses the following steps.

1. `f_p(A)` is independent of `ℓ ≠ p`: the `H^i(A)` form a ℚ-rational strictly compatible system (NeronModelsAndSemistableAbelianVarieties §6.10), and `cond(A)` is defined from it (NeronModelsAndSemistableAbelianVarieties §5.4).
2. For `p ≠ ℓ`, restriction of scalars of `V_λ` from `E_λ` to `ℚ_ℓ` is a direct summand of `V_ℓ(A)`. The Artin conductor is additive and nonnegative, and restriction of scalars multiplies its exponent by `[E_λ : ℚ_ℓ]` (each inertia-fixed space, monodromy kernel and Swan term acquires that dimension factor). Thus `[E_λ : ℚ_ℓ]·f_p(ρ_λ) ≤ f_p(A)`, so `f_p(ρ_λ) ≤ f_p(A)`. This applies to every λ; residue degree one alone does not imply `E_λ = ℚ_ℓ`.
3. Reduction does not increase the conductor (ArithmeticGaloisRepresentations §§3.1–3.6).

**Checks.**

- For an elliptic curve E₀ over ℚ, `N(ρ̄_{E₀,p}) | N_{E₀}` (EllipticCurveModularity R29.1).
- `f_p(A) = 0` for `p ∉ S`.
- In the semistable elliptic case, EllipticCurves Layers 4 and 4.5a give the squarefree bad-prime product, identified with `N_{E₀}` by EllipticCurveModularity R29.4. The curve `y² = x³ − x` has conductor 32 and bad-prime product 2: its additive reduction at 2 excludes this formula.

*Needs:* `NeronModelsAndSemistableAbelianVarieties §§5.4–5.7`; `NeronModelsAndSemistableAbelianVarieties §6.10`; `ArithmeticGaloisRepresentations §§3.1–3.6`; `ArithmeticGaloisRepresentations §§6.1–6.4`; EllipticCurves Layers 4 and 4.5a; EllipticCurveModularity R29.4.

Sources: [Ribet92](#references), proof of Lemma 4.1, p. 8.

### 2.11 Crystalline with Hodge–Tate weights {0, 1} at good primes; finite flat residual representations

Prove the following. At a good coefficient prime ℓ, each `ρ_λ|_{G_{ℚ_ℓ}}` for `λ | ℓ` is crystalline. After extension through any embedding `E_λ ↪ ℚ̄_ℓ` its weights are 0 and 1, once each. The λ-torsion of an integral model extends to a finite flat group scheme over `ℤ_ℓ`. With `χ_ℓ` of weight 1, this is the regular weight pair (1,0).

The proof uses the following steps.

1. A has good reduction at `ℓ ∉ S`, so `V_ℓ(A)|_{G_{ℚ_ℓ}}` is crystalline with Hodge–Tate weights 0 and 1, each of multiplicity dim A (FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.19 and R07.1.19).
2. The Hodge–Tate decomposition `ℂ_ℓ ⊗ V_ℓ ≅ (ℂ_ℓ(1) ⊗ Lie A) ⊕ (ℂ_ℓ ⊗ H¹(A, 𝒪_A)^∨)` is E-equivariant, and `Lie(A/ℚ)` is a one-dimensional E-vector space (dimension count, §1.1), so every embedding τ sees each weight exactly once.
3. `A′[λ] ⊆ A′[ℓ]`, and `A′[ℓ]` is the generic fibre of the finite flat ℓ-torsion of the Néron model (an abelian scheme over `ℤ_ℓ`); take the scheme-theoretic closure.

**Checks.**

- For `E = ℚ`: an elliptic curve with good reduction at ℓ has crystalline `V_ℓ` with weights {0, 1}.
- The weights give Serre weight `k = 2` for `ρ̄_λ` (§3.2).
- `X₀(11)` has multiplicative reduction at 11; its 11-adic Tate module is
  semistable with nonzero monodromy and is not crystalline. The good-reduction
  hypothesis excludes this case.

*Needs:* `ArithmeticGaloisRepresentations §§6.1–6.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.19`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.19`; `TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`; §1.1; §2.1; `NeronModelsAndSemistableAbelianVarieties §5.1`.

Sources: [Ribet92](#references), proof of Lemma 4.2, p. 8; [KW-I](#references), §5, p. 8.


### Examples

For `E = ℚ`, the integral model is the original elliptic curve and the determinant is cyclotomic. For a quadratic coefficient field with an inert prime, the full ℓ-torsion has dimension four over `𝔽_ℓ`, while λ-torsion has dimension two over `𝔽_λ`.

### Dependencies

*Needs:* Layer 1; ArithmeticGaloisRepresentations Layers 1–6; AbelianSchemesAndArithmeticModuli §§A3.3–A3.4 and A6.12; NeronModelsAndSemistableAbelianVarieties §§5.1 and 5.4–5.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.19, R07.4.19, R07.6.1 and R07.P7.3; FaltingsFinitenessAndIsogenyTheorems §§R28.4 and R28.6.

## Layer 3: Modular abelian varieties and the modularity theorem

Modularity is defined using modular Jacobians and then proved by the residual Serre/Ribet argument. The structural characterization assumes ℚ-simplicity; the modularity theorem also treats powers through oldform multiplicity. Parametrisation is a pointed morphism from the curve itself.

### 3.1 Modular abelian varieties over ℚ

Define the following notions. For positive N, define modularity of A at level N by the existence of a surjective homomorphism `J₁(N) → A` over ℚ. Define Γ₀ modularity at N using `J₀(N)` instead. In each case modularity without a specified level means that such a positive level exists. Homomorphisms are homomorphisms of abelian varieties over ℚ in the sense of Tau Ceti JacobianChallenge Layer E, and surjective means faithfully flat, equivalently that the image is all of A. Since `X₁(N)` has genus 0 exactly for `N ≤ 10` and `N = 12`, `J₁(N) = 0` for those N and only `A = 0` is modular of such a level.

Require the following constructions and laws.

- A is modular of level N: ∃ surjective `J₁(N) → A` over ℚ.
- A is modular when such a positive level exists.
- Modularity at N implies modularity at every positive multiple M of N.
- A ℚ-isogeny `A → A′` (or any surjection) transports modularity of A to A′.
- A quotient of a modular abelian variety is modular.
- For ℚ-simple A of GL₂-type: modular ⇔ isogenous to some `A_f` ⇔ some `V_λ(A) ≅ ρ_{f,λ′}` (§3.7).
- Modular of level N for Γ₀ implies modular of level N: pushforward along the finite surjection `X₁(N) → X₀(N)` gives a surjection `J₁(N) → J₀(N)` (ModularCurvesPartII §13.1).
- For an elliptic curve over ℚ, being modular for Γ₀ at level N is the formulation (ii) of EllipticCurveModularity R29.6.

**Checks.**

- `X₀(11)` is modular of level 11 for Γ₀.
- The zero abelian variety is modular of every positive level; `J₁(N) = 0` for `1 ≤ N ≤ 10` and `N = 12`.
- `J₁(13)` is modular of level 13 but not modular of level 13 for Γ₀, since `J₀(13) = 0`.
- `X₀(11)` is modular of level 22 as well as 11: the level in the definition is not the conductor.

The defining property has the following consequences.

1. modular of level N implies modular of every level M with N | M, because the degeneracy map `X₁(M) → X₁(N)` induces a surjection `J₁(M) → J₁(N)` (Albanese functoriality, ModularCurvesPartII §13.1); a quotient of a modular variety is modular; a variety ℚ-isogenous to a modular one is modular, since a composite of surjections is surjective.

**Checks.**

- `X₀(11) = J₀(11)` is modular of level 11 (for Γ₀ and for Γ₁, via `J₁(11) → J₀(11)`).
- `J₁(13)`, of dimension 2, is modular of level 13 but not for Γ₀ at level `13 (J₀(13) = 0)`.

*Needs:* `ModularCurvesPartII Layers 3–6 and §13.1`; `ModularCurvesPartII §§16.1–16.7`; `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; `TauCeti.AlgebraicGeometry.AbelianVariety.baseChange`.

Sources: [KW-I](#references), §10.2, p. 21; [Ribet92](#references), §1, p. 2.

### 3.2 Residual Serre witnesses of weight two at bounded level

Prove the following. Choose an integral model A′. There are infinitely many maximal ideals λ of `𝒪_E` with residue degree one above odd good primes ℓ that are unramified in E and for which `ρ̄_λ` is absolutely irreducible. For each such λ, obtain a normalized weight-two newform `g_λ` of level `N_λ` dividing `cond(A)` from which `ρ̄_λ ⊗ 𝔽̄_ℓ` arises in the sense of the residual attachment predicate of AlgebraicModularFormsAndSerreWeights §7.5 (R15.6). Its coefficient-place comparison supplies a prime λ′ of `K_{g_λ}` above ℓ and compatible residue embeddings. The integral-model comparison identifies the semisimple reduction of the newform representation with `ρ̄_λ ⊗ 𝔽̄_ℓ`. Thus both Frobenius traces and determinants agree for every p outside `S ∪ {ℓ}`. The nebentypus is allowed to depend on λ.

The shared residual attachment interface draws on the API design of the Imperial College London FLT project. Layer 3 uses the coefficient reduction and the integral-model theorem of AlgebraicModularFormsAndSerreWeights §7.5 (R15.6).

The proof uses the following steps.

1. Λ is infinite: infinitely many primes split completely in E (Chebotarev), and only finitely many λ are excluded by §2.9.
2. For `λ ∈ Λ`, `ρ̄_λ : G_ℚ → GL₂(𝔽_ℓ)` is odd (§2.4), absolutely irreducible, finite at ℓ with `det ρ̄_λ|_{I_ℓ} = χ̄_ℓ` (§2.11; ε is unramified at `ℓ ∉ S`), so Serre's weight is `k(ρ̄_λ) = 2` (AlgebraicModularFormsAndSerreWeights §4.9, The weight-two criterion) and its level `N(ρ̄_λ)` divides `cond(A)` (§2.10).
3. The strong form of Serre's conjecture (ClassicalSerreModularity R27.6) gives `g_λ` of weight `k(ρ̄_λ) = 2` and level `N(ρ̄_λ)`, with the shared residual attachment predicate of AlgebraicModularFormsAndSerreWeights §7.5. Use that owner's integral-model theorem, which under absolute irreducibility identifies `ρ̄_λ ⊗ 𝔽̄_ℓ` itself with the semisimple reduction of an integral model of the attachment of `g_λ`, and compare good Frobenius polynomials using §2.2 and AutomorphicGaloisRepresentations §1.5. The comparison is over a common algebraic closure `𝔽̄_ℓ`; Serre does not assert that the newform’s residue field is already `𝔽_ℓ`.

**Checks.**

- For `dim A = 1` the witnesses have trivial character, as in the parent `(ε = 1)`.
- For `J₀(23)` and λ above ℓ ≡ `±1` mod 5, `g_λ` can be taken to be the newform of level 23.
- The prime `λ = 5` for `X₀(11)` is excluded: its rational point of order 5
  makes the residual representation reducible, despite good reduction at 5.
- A nonsplit residual extension and its semisimplification have the same good Frobenius polynomials. The shared attachment predicate cannot distinguish them; absolute irreducibility is what makes its integral-model comparison an isomorphism with `ρ̄_λ` itself.

*Needs:* §2.9; §2.4; §2.11; §2.10; §2.2; `ClassicalSerreModularity R27.6`; `AlgebraicModularFormsAndSerreWeights §4.9 (R15.4)`; AlgebraicModularFormsAndSerreWeights §7.5 (R15.6), S-type and modularity predicates; `Chebotarev Layer 10`; `AutomorphicGaloisRepresentations §1.5`; §2.1; §2.3; `NeronModelsAndSemistableAbelianVarieties §5.0b`.

Sources: [Ribet92](#references), Lemma 4.1 and Lemma 4.2, p. 8; [Ribet92](#references), proof of Theorem 4.4, p. 8.

### 3.3 One newform for infinitely many λ

Prove the following. From the witnesses choose one normalized weight-two newform f, of level `N_f` dividing `cond(A)`, that occurs for an infinite subset `Λ_f`. For each λ in this subset there is a ring homomorphism `φ_λ` : `𝒪_{K_f} → 𝔽_λ = 𝔽_ℓ` carrying `a_p(f)` to the reduction of `a_p(A)` for all p outside `S ∪ {ℓ}`. These maps use the whole ring of integers; the finite coefficient-order index is excluded before choosing the infinite subset.

The proof uses the following steps.

1. Prove here that there are finitely many normalized weight-two newforms of level dividing `cond(A)`: for each of the finitely many `M | cond(A)`, distinct normalized newforms of level `M` are linearly independent in `S₂(Γ₁(M))`, since they form an orthogonal basis of its new subspace (ModularForms Layer 5), and `S₂(Γ₁(M))` is finite-dimensional (ModularForms Layer 10). The native cusp-form spaces already decompose into diamond-character spaces by `isInternal_cuspFormCharSpace`; this is finiteness on the existing carrier, rather than a new character decomposition.
2. `λ ↦ g_λ` maps the infinite set Λ to this finite set, so some fibre is infinite (EllipticCurveModularity R29.3). At this point reduction lands in `𝔽_{λ′}`, with the good Hecke values in its embedded subfield `𝔽_λ`.
3. Choose finitely many good-prime `a_p(f)` generating `K_f`: use §1.6, the Frobenius comparison of ModularCurvesPartII §§16.1–16.7, and §2.7 applied to `A_f`. The order they generate has finite index in `𝒪_{K_f}`. Delete the finitely many λ whose residue characteristic divides this index or is one of the chosen primes. The remaining `Λ_f` is infinite, and reduction of every element of `𝒪_{K_f}` lies in the embedded `𝔽_λ`. Thus `φ_λ` has the stated codomain `𝔽_λ = 𝔽_ℓ`.

**Checks.**

- For `dim A = 1` this is the parent's pigeonhole step.
- For `cond(A) = 529` the levels are 1, 23 and 529. `S₂(Γ₁(1)) = 0`, and `S₂(Γ₁(23))` has dimension 12, the genus of `X₁(23)`; as there are no oldforms from level 1, it is spanned by exactly 12 normalized newforms, of which the two with trivial character span the two-dimensional `S₂(Γ₀(23))`. A count that used `S₂(Γ₀(M))` instead of `S₂(Γ₁(M))` would see only those two and miss the ten with nontrivial character.
- The level of f divides `cond(A)`; its exact value is §4.2.

*Needs:* §3.2; `EllipticCurveModularity R29.3`; `ModularForms Layers 5 and 10`; `HeckeRing.GL2.Newform`; `isInternal_cuspFormCharSpace`; `cuspFormCharSpace`; `CongruenceSubgroup.Gamma1`; §2.7; §1.6; `ModularCurvesPartII §§16.1–16.7`; `ModularForms Layer 8`.

Sources: [Ribet92](#references), proof of Theorem 4.4, pp. 8–9.

### 3.4 Exact coefficients: `K_f ≅ E` with `a_p(f) ↦ a_p(A)`

Prove the following. The infinitely many reductions determine a field isomorphism `j : K_f ≃ E`. For every p outside S with `p ∤ N_f`, it satisfies `j(a_p(f)) = a_p(A)` and `j(ε_f(p)) = ε(p)`.

The final field comparison uses the native `TauCeti.CoefficientField f`.
Once exact good coefficient equality holds in a common field and those good
traces generate E, identify the two coefficient fields by an isomorphism
intertwining the embeddings and traces. The preceding steps supply this exact
equality and generation.

The proof uses the following steps.

1. Put `R = 𝒪_{K_f} ⊗_ℤ 𝒪_E` and let `B = ∏_i 𝒪_{L_i}` be its integral
   closure in `K_f ⊗_ℚ E = ∏_i L_i`. Both are full finite ℤ-lattices in the same rational algebra, so
   `R ⊆ B` has finite index D.
   Discard residue characteristics dividing D, leaving infinitely many λ.
   The pair `(φ_λ, 𝒪_E → 𝔽_λ)` defines `R → 𝔽_ℓ`, which extends uniquely
   through `R[1/D] = B[1/D]`. Its kernel therefore selects a unique factor.
   Infinitely many select one L, with embeddings `u : K_f → L`, `v : E → L`
   (the finite pigeonhole argument of EllipticCurveModularity R29.3).
2. For `p ∉ S`, `p ∤ N_f`, the element `u(a_p(f)) − v(a_p(A)) ∈ 𝒪_L` lies in primes above infinitely many ℓ, hence vanishes (EllipticCurveModularity R29.3).
3. `K_f` is generated by these `a_p(f)` (ModularCurvesPartII §§16.1–16.7 with §2.7 applied to `A_f`, §1.6) and E by these `a_p(A)` (§2.7), so `u(K_f) = v(E)` and `j = v⁻¹ ∘ u`. To identify characters, first use the resulting equality of good traces and Chebotarev–Brauer–Nesbitt (ArithmeticGaloisRepresentations §5.3) to identify the characteristic-zero representations. Their determinants then identify `j(ε_f)` with ε. Trace congruences alone do not give determinant congruences.

**Checks.**

- For `dim A = 1`, `K_f = ℚ` and `a_p(f) = a_p(A)`: the parent's exact equality.
- For `J₀(23)` and its newform f, j is the identity of `ℚ(√5)` once E is identified with the Hecke field through the Hecke action; j is unique, as the `a_p` generate.
- For `K_f = E = ℚ(√5)` at characteristic 5, the rational factors
  `√5 ↦ ±√5` give the same residual map `√5 ↦ 0`; this characteristic
  divides D and must be removed before asserting uniqueness of the factor.

*Needs:* §3.3; `EllipticCurveModularity R29.3`; §2.7; §1.6; `ModularCurvesPartII §§16.1–16.7`; §2.3; `ArithmeticGaloisRepresentations §5.3`; `ModularForms Layer 8`.

Sources: [Ribet92](#references), proof of Theorem 4.4, p. 8.

### 3.5 Comparison of λ-adic representations with those of the newform

Prove the following. For every prime λ of E, the coefficient identification j gives an isomorphism of `E_λ[G_ℚ]`-modules `ρ_λ ≃ ρ_{f,j⁻¹(λ)} ⊗_{K_{f,j⁻¹(λ)}} E_λ`. Taking all components over ℓ yields `V_ℓ(A) ≃ V_ℓ(A_f)` over `ℚ_ℓ`, with the field actions intertwined by j.

Two abelian varieties realized by the same newform have equivariantly isomorphic
rational Tate modules at every ℓ. Applying this to A and the supplier's `A_f`
gives the full rational comparison; the component comparison additionally retains
the coefficient identification j.

The proof uses the following steps.

1. Both `ρ_λ` and `ρ_{f,j⁻¹λ} ⊗ E_λ` are semisimple (§2.5; AutomorphicGaloisRepresentations §1.5) and unramified outside a finite set with traces of `Frob_p` equal to `a_p(A) = j(a_p(f))` for almost all p; Chebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations §5.3, ArithmeticGaloisRepresentations §1.8) make them isomorphic.
2. Sum over `λ | ℓ`, using `V_ℓ(A) = ⊕ V_λ` (ArithmeticGaloisRepresentations §6.4) and `V_ℓ(A_f) ≅ ⊕ ρ_{f,λ}` (AutomorphicGaloisRepresentations §§6.1–6.4).

**Checks.**

- For `dim A = 1`: `V_r(E) ≅ V_r(f)`, as in R29.4.
- The isomorphism need not respect a chosen integral structure; only rational Tate modules are compared.
- Choosing only one conjugate quadratic factor for a dimension-two variety gives
  the wrong total dimension and cannot supply this rational Tate equivalence.

*Needs:* §3.4; §2.5; `AutomorphicGaloisRepresentations §1.5`; `AutomorphicGaloisRepresentations §§6.1–6.4`; `ArithmeticGaloisRepresentations §5.3`; `ArithmeticGaloisRepresentations Layer 1`; `Chebotarev Layer 10`; `ArithmeticGaloisRepresentations §§6.1–6.4`.

Sources: [Ribet92](#references), proof of Theorem 4.4, p. 8.

### 3.6 Modularity of abelian varieties of GL₂-type (Ribet's Theorem 4.4, Khare–Wintenberger Corollary 10.2(i))

Prove the following. If A is ℚ-simple of GL₂-type, there is a normalized weight-two newform f on `Γ₁(N_f)` and a ℚ-isogeny `A_f → A`. The isomorphism `K_f ≃ End⁰_ℚ(A)` identifies the Hecke action with the endomorphism action. Composing with `J₁(N_f) → A_f` makes A modular at `N_f`. Every GL₂-type variety over ℚ is modular, including the powers described in Layer 1; the latter conclusion uses enough oldform copies at a suitable larger level.

The rational Tate module is `ℚ_ℓ ⊗_{ℤ_ℓ} T_ℓ(A)`, with its native action
induced by precomposition on `Hom_ℚ(Spec ℚ̄, A)` and passage to compatible
torsion families. An arithmetic Frobenius lift at a prime p fixes a maximal
ideal P of the integral closure of ℤ in ℚ̄ above p and acts as `x ↦ xᵖ`
modulo P. Outside one finite exceptional set, the characteristic polynomial on
the full rational Tate module, after extension to `ℚ̄_ℓ`, is
`∏_τ (X² − τ(a_p(f))X + τ(ε_f(p))p)` for `p ∤ N_fℓ`, with τ running over
the embeddings of the native coefficient field into `ℚ̄_ℓ`. Both traces and
determinants are retained, independently of the Frobenius lift and chosen basis.
These conventions use the supplied Tate and coefficient-field theory
(ArithmeticGaloisRepresentations §§6.1–6.4; AutomorphicGaloisRepresentations
§§6.1–6.4; Ribet92, §3, pp. 4–5 and proof of Theorem 4.4, p. 8).

The proof uses the following steps.

1. §3.5 gives `V_ℓ(A) ≅ V_ℓ(A_f)` as `ℚ_ℓ[G_ℚ]`-modules; Faltings' isogeny criterion (FaltingsFinitenessAndIsogenyTheorems R28.4) gives a ℚ-isogeny `φ : A_f → A`. It intertwines `K_f` and E through j: `x ↦ φxφ⁻¹` is a field isomorphism `K_f → E` carrying the E-linear trace `a_p(f)` of Frobenius on `V_ℓ(A_f)` to that on `V_ℓ(A)`, which is `a_p(A) = j(a_p(f))`, and the `a_p(f)` generate `K_f`.
2. Compose the quotient `J₁(N_f) → A_f` (ModularCurvesPartII §§16.1–16.7) with φ to obtain a surjection `J₁(N_f) → A`.
3. For non-simple A of `GL₂(E)`-type, A is isogenous to `Bⁿ` with B ℚ-simple of GL₂-type (§1.3), and `B ~ A_f` with f of level N. In `J₁(N·2^{n−1})` the factor `A_f` occurs with multiplicity `d(2^{n−1}) = n` (§1.6), so `A_fⁿ`, hence A, is a quotient of `J₁(N·2^{n−1})`.

**Checks.**

- `J₀(23)` is isogenous to `A_f` for the newform of level 23 with `K_f = ℚ(√5)`.
- Dimension one: every elliptic curve over ℚ is modular (EllipticCurveModularity R29.6).
- Ribet's example of level 81: `A_f` with `E = ℚ(√3)` is its own instance.
- In dimension one the product has one factor, `X² − a_pX + p`; replacing
  arithmetic Frobenius by its inverse gives reciprocal eigenvalues and fails it.
- For a quadratic coefficient field the two conjugate factors give a degree-four
  polynomial, rather than one arbitrarily chosen quadratic factor.
- For an elliptic square the general theorem uses n = 2 and a suitable larger
  oldform level; the simple headline does not assert that its endomorphism algebra
  is a field.

*Needs:* §3.5; `FaltingsFinitenessAndIsogenyTheorems R28.4`; `ModularCurvesPartII §§16.1–16.7`; §3.1; §1.3; §1.6.

Sources: [KW-I](#references), Corollary 10.2, p. 21; [Ribet92](#references), Theorem 4.4, p. 8.

### 3.7 Equivalent forms of modularity

Prove the following. For a ℚ-simple GL₂-type A, modularity is equivalent to each of the following: being ℚ-isogenous to some weight-two `A_f`; having one λ-adic component isomorphic, after extension to `ℚ̄_ℓ`, to a component of a weight-two newform representation; having such a realization for every λ; and being isomorphic to a ℚ-simple quotient of some `J₁(N)`. The representation comparison always uses primes above the same ℓ. The implications between these assertions use no Serre modularity theorem; §3.6 proves that they hold.

The proof uses the following steps.

1. (a) ⇒ (b): a surjection `J₁(N) → A` and the isogeny decomposition of `J₁(N)` (§1.6) give a nonzero map `A_g → A` for some newform g of level dividing N (A6: Hom between non-isogenous simple varieties vanishes), hence `A ~ A_g` as both are simple (AbelianSchemesAndArithmeticModuli §A6.4).
2. (b) ⇒ (d): `V_ℓ(A) ≅ V_ℓ(A_f)` decomposes compatibly with the endomorphism fields (AutomorphicGaloisRepresentations §6.1). (d) ⇒ (c) is trivial. For (c) ⇒ (b), fix the embeddings `τ : E → ℚ̄_ℓ` and `τ′ : K_f → ℚ̄_ℓ` of the given isomorphism. Their good Frobenius traces agree. E and `K_f` are each generated by these traces off a common finite exceptional set (§2.7, applied also to `A_f` using §1.6 and ModularCurvesPartII §16.1). Thus `τ(E) = τ′(K_f)`, giving `j = τ⁻¹τ′` with exact good coefficients. §3.5, followed by Faltings, gives `A ~ A_f`. This argument needs no infinite residual congruences and no Serre theorem.
3. (b) ⇒ (e) ⇒ (a): compose `J₁(N) → A_f` with the isogeny; an isogeny image of a quotient is a quotient.

**Checks.**

- For `dim A = 1` these are formulations (i)–(ii) of R29.6.
- (c) for a single λ of degree one already suffices.

*Needs:* §3.1; §3.6; §3.5; §1.6; `AbelianSchemesAndArithmeticModuli A6`; `FaltingsFinitenessAndIsogenyTheorems R28.4`; `AutomorphicGaloisRepresentations §§6.1–6.4`; §2.7; `ModularCurvesPartII §§16.1–16.7`.

Sources: [KW-I](#references), §10.2, p. 21.

### 3.8 The ℚ-simple quotients of the `J₁(N)` are the GL₂-type varieties (generalised Shimura–Taniyama–Weil)

Prove the following. A variety B over ℚ is a ℚ-simple quotient of a positive-level `J₁(N)` precisely when it is ℚ-simple of GL₂-type. The assignment `f ↦ A_f` induces a bijection between coefficient-conjugacy orbits of normalized weight-two newforms, over all levels and characters, and the ℚ-isogeny classes of these varieties.

The proof uses the following steps.

1. ⇒: a ℚ-simple quotient of `J₁(N)` is isogenous to some `A_f` (proof of §3.7 (a) ⇒ (b)), which is of `GL₂(K_f)`-type (§1.6); GL₂-type is an isogeny invariant (SmallRamificationAndAbelianVarietyBaseCases §5.1).
2. ⇐: §3.6.
3. Bijection: `A_f ~ A_g` iff `V_ℓ(A_f) ≅ V_ℓ(A_g)` (Faltings) iff the eigenvalue systems of f and g are Galois-conjugate (Chebotarev, Brauer–Nesbitt), iff `g ∈ [f]` by strong multiplicity one (Tau Ceti ModularForms layer 5).
4. Use the library fixed-level/nebentypus strong multiplicity-one theorem where its good-index hypotheses apply; comparison across levels from agreement at almost all primes uses the cross-level form from ModularForms Layer 5.

**Checks.**

- Level 11: the only simple quotient up to isogeny of `J₁(11)` is `X₀(11)`.
- Non-example: `E₁ × E₂` for non-isogenous elliptic curves is a quotient of some `J₁(N)` but not a simple one.

*Needs:* §3.6; §3.7; §1.6; `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `FaltingsFinitenessAndIsogenyTheorems R28.4`; `ModularForms Layer 5`; `ArithmeticGaloisRepresentations §5.3`; `ModularForms Layer 8`; `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

Sources: [KW-I](#references), §10.2, p. 21; [Ribet92](#references), §1, p. 2.

### 3.9 Totally real endomorphism field, trivial character and quotients of `J₀(N)`

Prove the following. For ℚ-simple GL₂-type A, total reality of E, triviality of ε, and Γ₀ modularity are equivalent. When they hold, A is a quotient of `J₀(N_f)`. Applying the conductor theorem in Layer 4 identifies this level as `cond(A)^{1/dim A}`. This is the Γ₀ form of the modular characterization that Serre predicted ([Ribet92](#references), §1, p. 2) and specializes to the parent’s quotient at the elliptic conductor.

The nebentypus conclusion uses the native newform carrier, the simple
GL₂-type action and dimension hypotheses, total reality of E, the newform
realization and its full endomorphism-field equivalence.

The proof uses the following steps.

1. (a) ⇒ (b): with Rosati trivial on E the Weil pairing makes `∧²_{E_λ} V_λ ≅ E_λ(1)` (ArithmeticGaloisRepresentations §6.4, Endomorphism coefficients), so `det ρ_λ = χ_ℓ`.
2. (b) ⇒ (a): `ε = 1` gives `a_p = ā_p` (§2.6), so the canonical involution fixes `E = ℚ(a_p)` (§2.7) and E is totally real (§1.5).
3. (b) ⇔ (c): `A ~ A_f` with `ε_f = ε` via j (§3.4); for trivial `ε_f`, `A_f` is isogenous to the quotient of `J₀(N_f)` (ModularCurvesPartII §§16.1–16.7); conversely a simple quotient of `J₀(N)` is isogenous to some `A_g` with g of trivial character.

**Checks.**

- `J₀(23)`: `E = ℚ(√5)` totally real, `ε = 1`, a quotient of `J₀(23)`.
- `J₁(13)`: `E = ℚ(√−3)`, ε of order 6, not a quotient of any `J₀(N)`.
- For `X₀(11)`, the field is ℚ and the character is trivial. The Γ₁ quotient
  `A_f = J₁(11)` gives the Γ₀ parametrisation through its isogeny to
  `J₀(11)`, rather than through an identification of the two elliptic curves.

*Needs:* §3.6; §3.4; §2.6; §2.7; §1.5; `ModularCurvesPartII §§16.1–16.7`; `ArithmeticGaloisRepresentations §§6.1–6.4`.

Sources: [Ribet92](#references), §3, p. 4; [Ribet92](#references), §7, p. 16.

### 3.10 Modular parametrisation of a GL₂-type variety

Prove the following. Suppose `dim A > 0` and `q : J₁(N) → A` is surjective over ℚ. For the rational cusp c and its pointed Abel–Jacobi map, `φ = q ∘ AJ_c` : `X₁(N) → A` satisfies `φ(c) = 0`. It is nonconstant and its image generates A. If A is ℚ-simple of GL₂-type, q can be chosen through a degeneracy map to `J₁(M)`, the newform quotient `A_f` of level `M | N`, and an isogeny `A_f → A`. With `ε = 1`, use `X₀(N)` and the cusp ∞ instead. The first assertion also applies to modular powers.

The proof uses the following steps.

1. The pointed Abel–Jacobi image generates `J₁(N)`: if `B ⊆ J₁(N)` is the abelian subvariety generated by the image of `AJ_c`, with inclusion `i`, the pointed map `X₁(N) → B` factors through a homomorphism `π : J₁(N) → B` by the Albanese property of JacobianChallenge Layer F, and `i ∘ π` and the identity both factor `AJ_c` through `J₁(N)`, so the uniqueness clause of Layer F gives `i ∘ π = id` and `B = J₁(N)`. Its image under q therefore generates A, and `φ(c) = q(0) = 0`. If φ were constant, it would be the zero map and could only generate the zero abelian variety; positive dimension excludes this.
2. In the ℚ-simple GL₂-type case, from the surjection `J₁(N) → A` and the newform decomposition of `J₁(N)`, choose a newform f of level `M | N` with `A_f ~ A` (§3.7 and §1.6). Compose `AJ_c` : `X₁(N) → J₁(N)`, a surjective degeneracy map `J₁(N) → J₁(M)` (ModularCurvesPartII §13.1, `jacobianNorm` and `jacobianNorm_pull`), `J₁(M) → A_f` and an isogeny `A_f → A`. Nonconstancy follows from ModularCurvesPartII §16.7, The Abel–Jacobi composite to `A_f` is nonconstant. The ambient modular level N need not be the newform level M.
3. The image of `X₁(N)` generates `J₁(N)` by step 1, hence its image under the composite generates A.
4. For `ε = 1` the chosen f has trivial character, so use `J₀(N) → J₀(M) → A_f`, with `AJ_∞` and the trivial-character quotient (ModularCurvesPartII §16.5, Trivial character: the quotient of `J₀(N)`). This gives the Γ₀ parametrisation at the specified ambient level N, not merely at some other level.

**Checks.**

- For `dim A = 1` and `ε = 1` this is the parametrisation `X₀(N) → E` of R29.5.
- For `J₁(13)` the parametrisation is the Abel–Jacobi embedding of `X₁(13)`, a curve of genus 2.
- For `B × B` with `B = X₀(11)`, the level-22 oldform quotient `J₁(22) → B × B` yields a pointed, nonconstant generating curve map even though the target is not ℚ-simple.

*Needs:* §3.6; §3.9; `ModularCurvesPartII §17.3`; `ModularCurvesPartII §§16.1–16.7`; `JacobianChallenge Layer F`; §3.7; §1.6; `ModularCurvesPartII Layers 3–6 and §13.1`.

Sources: [Ribet92](#references), §1, p. 1.


### Examples

A simple dimension-one variety has the elliptic theorem and the same pointed quotient composite. A power requires enough oldform multiplicity and need not have the same least modular level as its simple factor.

### Dependencies

*Needs:* Layers 1–2; ClassicalSerreModularity §R27.6; AlgebraicModularFormsAndSerreWeights §4.9 (R15.4) and §7.5 (R15.6); ModularForms Layers 3–5, 8 and 10; ModularCurvesPartII §§13.1, 16.1–16.7 and 17.3; AutomorphicGaloisRepresentations §§1.5 and 6.1–6.4; FaltingsFinitenessAndIsogenyTheorems §R28.4; JacobianChallenge Layer F; EllipticCurveModularity Layers R29.3 and R29.5–R29.6.

## Layer 4: Conductors, exact level and L-functions

Except for the explicit dimension-one comparison, A is ℚ-simple of GL₂-type, `n = dim A = [E : ℚ]`, and f, `j : K_f ≃ E` come from Layer 3. These hypotheses apply to the conductor, least level, strict compatibility and analytic product statements. Additional copies in powers are governed by Layer 3 rather than by the least-level formula.

### 4.1 Carayol's conductor formula for GL₂-type varieties

Prove the following. With the simple A and newform f fixed above, for every p and every λ not over p prove `f_p(A) = n f_p(ρ_λ)` and `f_p(ρ_λ) = ord_p(N_f)`. Here `f_p(A)` is the Artin exponent of the rational Tate module and the component exponent is measured over `E_λ`. Consequently `cond(A) = N_fⁿ`. In particular, a weight-two newform of level N has `cond(A_f) = N^{dim A_f}`.

The proof uses the following steps.

1. `V_ℓ(A) = ⊕_{λ|ℓ} V_λ` as `ℚ_ℓ[G_{ℚ_p}]`-modules, and the Artin conductor is additive; for an `E_λ`-representation W viewed over `ℚ_ℓ`, every term of `a(W)` (Swan conductor and codimension of inertia invariants, ArithmeticGaloisRepresentations §§3.1–3.6) is multiplied by `[E_λ : ℚ_ℓ]`. So `f_p(A) = Σ_{λ|ℓ} [E_λ : ℚ_ℓ]·f_p(ρ_λ)`.
2. `ρ_λ ≅ ρ_{f,j⁻¹λ} ⊗ E_λ` (§3.5) and the Artin conductor of `ρ_{f,λ′}` away from ℓ is the prime-to-ℓ part of `N_f` (Carayol; AutomorphicGaloisRepresentations §§4.4–4.9 and 6.4, Classical conductors and bad Euler factors); so `f_p(ρ_λ) = ord_p(N_f)` for every `λ ∤ p`, and `Σ_{λ|ℓ}[E_λ : ℚ_ℓ] = n`.
3. Apply this at each p with an auxiliary `ℓ ≠ p`.

**Checks.**

- `J₀(23)`: `cond = 23² = 529` and `n = 2`, so `N(A) = 23`.
- `J₁(13)`: `cond(J₁(13)) = 13²`, level 13.
- Elliptic curves: `cond(E) = N_f`, Carayol's Corollaire 0.8 and EllipticCurveModularity R29.4.

*Needs:* §3.5; §3.6; `AutomorphicGaloisRepresentations §§4.4–4.9 and 6.4`; `ArithmeticGaloisRepresentations §§3.1–3.6`; `NeronModelsAndSemistableAbelianVarieties §§5.4–5.7`.

Sources: [Carayol86](#references), Corollaire (0.8), p. 411; [Carayol86](#references), Théorème (A), pp. 410–411.

### 4.2 The exact level of a GL₂-type variety

Prove the following. For ℚ-simple GL₂-type A of dimension n, define `N(A)` as the positive integer with `N(A)ⁿ = cond(A)`. It equals the level of every newform whose abelian variety is ℚ-isogenous to A. For every `M ≥ 1`, a surjection `J₁(M) → A` exists if and only if `N(A) | M`; hence `N(A)` is the least parametrisation level. The larger level `cond(A)ⁿ` in Khare–Wintenberger §10.2 is valid. It is `N(A)^{n²}`, so for `n ≥ 2` it is strictly larger than `N(A)`; the positive-dimensional variety cannot have conductor one. For `n = 1` the two levels agree.

The proof uses the following steps.

1. `cond(A) = N_f^n` by §4.1, so `N(A) = N_f`; two newforms f, g with `A ~ A_f ~ A_g` are Galois conjugate (§3.8) and have the same level.
2. If `N(A) | M`, the degeneracy map makes `J₁(M) → J₁(N_f) → A` surjective (§3.1).
3. If `J₁(M) → A` is surjective, `A ~ A_g` for a newform g of level dividing M (§3.7); `g ∈ [f]` by strong multiplicity one, so `N_f = N_g` divides M.
4. Use the library fixed-level/nebentypus strong multiplicity-one theorem where its good-index hypotheses apply; comparison across levels from agreement at almost all primes uses the cross-level form from ModularForms Layer 5.

**Checks.**

- `J₀(23)`: `N(A) = 23` and A is modular of level 23 but not of level 1, …, 22.
- For an elliptic curve E₀ of conductor 11: `N(E₀) = 11`; KW's level `11¹` coincides.
- For `J₀(23)`: KW's level is `529²` while the exact level is 23.

*Needs:* §4.1; §3.1; §3.7; §3.8; `ModularForms Layer 5`; `ModularCurvesPartII Layers 3–6 and §13.1`; `SmallRamificationAndAbelianVarietyBaseCases §6.1, Fontaine row`; `ModularForms Layer 8`; `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

Sources: [KW-I](#references), §10.2, p. 21; [Carayol86](#references), Corollaire (0.8), p. 411.

### 4.3 The λ-adic system is strictly compatible in the sense of Khare–Wintenberger

Prove the following. The good-prime polynomials of A lie in E. After some finite extension `i : E ↪ E′`, its representations, indexed through `τ′ ∘ i` for embeddings `τ′ : E′ → ℚ̄_ℓ`, form an E′-rational, two-dimensional, regular, irreducible, odd, geometric strictly compatible system of weights (1,0). For each q choose a Frobenius-semisimple Weil–Deligne parameter `r_q` over E′, unramified when `q ∉ S`, such that `WD(ρ_{τ′∘i}|_{D_q})^{F-ss} ≃ τ′r_q` for every τ′. This includes `q = ℓ`. The all-place conclusion follows from modularity and allows the finite coefficient extension in Carayol’s theorem.

The proof uses the following steps.

1. Choose f and `j : K_f ≅ E` by §3.6. AutomorphicGaloisRepresentations §7.3 (The fixed-eigenform compatible family) supplies a full strictly compatible family over a sufficiently large number field containing `K_f`; its statement does not require that field to be `K_f`. First pass to the dual family, using the dual operation on the shared compatible-system carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d, which AutomorphicGaloisRepresentationsPartII AG2.P (Arbitrary-rank compatible data and operations) proves preserves the strict predicate, together with the dictionary of AutomorphicGaloisRepresentations §3.11. Its members are then the arithmetic `ρ_{f,λ}` of §1.5. Transport `K_f` through j, obtaining a finite extension E′/E, and reindex these dual members by `τ′ : E′ → ℚ̄_ℓ` using the coefficient-extension operation of the same carrier, likewise preserved by AG2.P, and §3.5. Carayol §0.6 distinguishes being defined over a rationality field from being realised there; full comparison at `q = ℓ` is supplied by AutomorphicGaloisRepresentations §§4.9 and 7.3’s coefficient-prime theorem, not by Carayol 1986 alone.
2. Regular, odd and irreducible: §2.11, §2.4, §2.5.

**Checks.**

- For an elliptic curve over ℚ, NeronModelsAndSemistableAbelianVarieties §6.10
  already gives all-place Frobenius-semisimple WD compatibility for cohomological
  H¹, with rational isomorphism class over ℚ̄. Dualize to compare with the
  covariant Tate module, and realize the parameters over the common finite
  coefficient extension permitted here. The additional requirement here is
  realization over that coefficient field.
- At `p ∥ cond(A)^{1/n}` with p not dividing the conductor of ε, `r_p` has nonzero monodromy (Steinberg type, AutomorphicGaloisRepresentations §§4.4 and 6.4).
- For `X₀(11)` at 3, the arithmetic Frobenius polynomial of the cohomological
  member is `X² + X/3 + 1/3`. Its dual has `X² + X + 3`, as required for
  the covariant Tate module; coefficient extension alone cannot change these roots.

*Needs:* §3.5; §3.4; `AutomorphicGaloisRepresentations §§3.11, 4.9 and 7.3`; `AutomorphicGaloisRepresentationsPartII AG2.P`; `SmallRamificationAndAbelianVarietyBaseCases §5.0d`; §2.11; §2.4; §2.5; §3.6.

Sources: [KW-I](#references), §5, pp. 7–8; [Ribet92](#references), §3, p. 4; [Carayol86](#references), §0.6 and Théorème (A) (§0.7), p. 410.

### 4.4 The L-function of a GL₂-type variety

Prove the following. At every prime p, identify the local factor of `L(A,s)`, defined using geometric Frobenius on inertia invariants of `H¹` for an auxiliary `ℓ ≠ p` (equivalently arithmetic Frobenius on inertia coinvariants of the covariant Tate module), with `∏_{σ:K_f→ℂ} L_p(f^σ,s)`. For `p ∤ N_f` the individual factor is `(1−a_p(f^σ)p^{−s}+ε_f^σ(p)p^{1−2s})⁻¹`; for `p | N_f` it is `(1−a_p(f^σ)p^{−s})⁻¹`. It follows that `L(A,s) = ∏_σ L(f^σ,s)` is entire. Its completion `Λ(A,s) = cond(A)^{s/2}((2π)^{−s}Γ(s))ⁿL(A,s)` satisfies `Λ(A,s) = w_A Λ(A,2−s)`, with `w_A ∈ {−1,1}`.

The proof uses the following steps.

1. `H¹ ⊗ ℚ̄_ℓ = ⊕_ι ρ_ι^∨` and `ρ_ι ≅ ρ_{f,ι∘j}` (§3.5); the local factor of `ρ_{f,λ}^∨` at `p ≠ ℓ` is that of f at p (AutomorphicGaloisRepresentations §§4.4–4.9 and 6.4, whose Euler factors are read on the inertia invariants of the cohomological dual).
2. The library `CuspForm.hasEntireExtension_qExpansion_coeff` gives entire analytic extension of each native cusp-form Dirichlet series. ModularForms Layer 7 identifies that series with the normalized newform Euler product; the finite product over coefficient embeddings is therefore entire.
3. Use the normalised Fricke companion `𝒲_{N_f}` of ModularForms layers 6–7. At weight two its functional equation carries `i² = −1`; after absorbing the Fricke pseudo-eigenvalue into `w_σ` it reads `Λ(f^σ, s) = w_σ Λ(f^{σ̄}, 2 − s)`. The embeddings are closed under complex conjugation, so the product is self-dual, and `cond(A) = N_f^n` gives the displayed completion. Apply this product equation twice to obtain `Λ(A, s) = w_A²Λ(A, s)`. The normalised Euler product is nonzero in its half-plane of absolute convergence, so its analytic extension is not identically zero and `w_A² = 1`. Thus `w_A = ±1`; realness on the real line alone would not prove this.

**Checks.**

- For `J₀(23)`: `L(J₀(23), s) = L(f, s)L(f^σ, s)` for the two embeddings of `ℚ(√5)`.
- For `dim A = 1` this is EllipticCurveModularity Layer R29.6.
- For `J₁(13)`, the two coefficient embeddings of `ℚ(√−3)` exchange the
  Fricke companion equations. Their product has conductor `13²` and a sign
  root number, even though the individual equations have conjugate companions.

*Needs:* §3.5; §4.1; `AutomorphicGaloisRepresentations §§4.4–4.9 and 6.4`; `NeronModelsAndSemistableAbelianVarieties §§5.4–5.7`; `ModularForms Layer 7`; `ModularForms Layer 6`; `ModularForms Layer 8`; `CuspForm.hasEntireExtension_qExpansion_coeff`.

Sources: [Carayol86](#references), Théorème (A), §§0.6–0.7, pp. 410–411, for local comparison followed by the finite product over embeddings; [DS05](#references), §5.10, for the two-form Hecke functional equation with the weight-two Fricke normalization of ModularForms Layers 6–7. Carayol §0.8, p. 411, gives the dimension-one specialization.

### 4.5 Compatibility with the parent in dimension one

Let E₀/ℚ be elliptic, with conductor `N_{E₀}`. The dimension-one specialization has endomorphism field ℚ, `ε = 1`, `K_f = ℚ`, and `f = F_{E₀}` at level `N_{E₀}`. Here `F_{E₀}` is the newform of the elliptic curve of EllipticCurveModularity R29.3 (The newform of an elliptic curve), whose level is pinned by R29.4 (The level is the conductor). Compare the isogeny and the pointed `X₀(N_{E₀})` parametrisation with EllipticCurveModularity R29.5–R29.6 using the same quotient `q : J₀(N_{E₀}) → E₀` and the same `AJ_∞`. In both constructions the curve map is `q ∘ AJ_∞`. This is a compatibility of chosen data; arbitrary isogenies and parametrisations are not required to be unique.

Use the elliptic model bridges of EllipticCurves Layers 3–4 and 4.5a for the good-prime comparison: on an integral model minimal at ℓ, `ℓ ∤ Δ` characterizes good reduction, and the full projective point count of its reduction gives `a_ℓ = ℓ + 1 − #Ẽ(𝔽_ℓ)`. EllipticCurveModularity R29.4 identifies the elliptic conductor with the Artin conductor used here. Its semistable comparison gives the squarefree product of bad primes only for a semistable curve; the dimension-one specialization itself allows arbitrary reduction.

The proof uses the following steps.

1. `E = End⁰_ℚ(E₀) = ℚ` (R29.1), so `ε = 1` (§2.3, E totally real) and the newform of §3.6 has trivial character and rational coefficients.
2. Its trivial character and exact good coefficients satisfy the parent's `IsNewformOf` predicate. EllipticCurveModularity R29.4 (The level is the conductor) gives its level `cond(E₀) = N_{E₀}`, agreeing with §4.2; attachment uniqueness identifies it with the newform of `E₀` of R29.3. §3.9 gives the quotient of `J₀(N_{E₀})`.
3. Choose the R29.5 isogeny and quotient q when specializing the Part II construction. Both curve maps are `q ∘ AJ_∞` on `X₀(N_{E₀})`, so their equality and value 0 at ∞ follow from this common construction. Precompose with `X₁(N_{E₀}) → X₀(N_{E₀})` for the Γ₁ comparison; this supplies the curve-morphism comparison, not merely equality of newforms.

**Checks.**

- `X₀(11)`: the Part II statements return `J₀(11) → X₀(11)`, the identity.
- The Part II route uses the strong Serre theorem with nontrivial characters only when E is CM, never in dimension one.
- The minimal model `y² + y = x³ − x² − 10x − 20` has `Δ = −11⁵`, good reduction at 2 and five projective points over `𝔽₂`, giving `a₂ = −2`. Its semistable conductor is 11, not `|Δ|`.
- An integral rescaling of this model with coefficients multiplied by `2ⁱ` in degree i has discriminant `2¹²(−11⁵)` and defines the same rational curve. Divisibility of that discriminant by 2 does not detect bad reduction: the equation is not minimal at 2.

*Needs:* §3.6; §3.9; §3.10; §4.2; EllipticCurves Layers 3–4 and 4.5a; EllipticCurveModularity R29.3–R29.6.

Sources: [KW-I](#references), §10.2, p. 21; [Carayol86](#references), Corollaire (0.8), p. 411; [DDT](#references), §1.1, pp. 18–19, and §2.2, Propositions 2.11–2.12, pp. 56–57, for the elliptic model and conductor comparisons.


### Examples

With the given level-23 data, `n = 2` and the conductor formula reads `23² = 529`, while the least level remains `23`. A Steinberg local parameter keeps nonzero monodromy and gives a linear bad Euler factor.

### Dependencies

*Needs:* Layers 2–3; AutomorphicGaloisRepresentations §§4.4–4.9, 6.4 and 7.3; AutomorphicGaloisRepresentationsPartII AG2.P; SmallRamificationAndAbelianVarietyBaseCases §5.0d; NeronModelsAndSemistableAbelianVarieties §§5.4–5.7 and 6.10; ModularForms Layers 5–8; EllipticCurveModularity Layers R29.4–R29.6.

## Layer 5: ℚ-curves as factors of abelian varieties of GL₂-type

First define the geometric ℚ-curve property. The cocycle and restriction-of-scalars argument then assume non-CM and use a common finite Galois field where all chosen conjugate isogenies are defined. The endomorphism algebra is obtained from those maps; its action on the Lie algebra determines the dimension of the projector image.

### 5.1 ℚ-curves

Define the following notions. An elliptic curve C/ℚ̄ is a ℚ-curve when each conjugate ᵍC, for `g ∈ G_ℚ`, is isogenous to C over ℚ̄. A curve C₀ over a number field `K ⊆ ℚ̄` has this property when its geometric base change does, including conjugations that move K. Non-CM means `End_ℚ̄(C) = ℤ`. Elliptic curves are those of Mathlib (`WeierstrassCurve` with `IsElliptic`) or, equivalently, one-dimensional abelian varieties (AbelianSchemesAndArithmeticModuli A1); isogenies over ℚ̄ are nonzero homomorphisms; ᵍC is the base change of C along `g : ℚ̄ → ℚ̄`.

Require the following constructions and laws.

- Define the ℚ-curve condition for C over ℚ̄ (or over `K ⊆ ℚ̄`) by `ᵍC ~ C` over ℚ̄ for all `g ∈ G_ℚ`.
- If `C ~ C′` over ℚ̄ and C is a ℚ-curve then so is C′.
- ᵍC is a ℚ-curve whenever C is.
- A curve with a model over ℚ (more generally with `j(C) ∈ ℚ`) is a ℚ-curve.
- Every CM elliptic curve over ℚ̄ is a ℚ-curve.
- For a ℚ-curve with a model over K there are a finite Galois `K′ ⊇ K` over ℚ and K′-isogenies `μ_g : ᵍC₀ → C₀` for all `g ∈ Gal(K′/ℚ)`.

**Checks.**

- The base change to ℚ̄ of `X₀(11)` is a ℚ-curve, with `μ_g` the identity.
- The curve `y² = x³ − x` with CM by `ℤ[i]` is a ℚ-curve; so are all curves with CM by an order of `ℚ(i)`.
- A quadratic twist over K of a curve defined over ℚ is a ℚ-curve with `μ_g` isomorphisms over ℚ̄. In particular, over `K = ℚ(√2)`, the twist of `y² = x³ − x + 1` by `d = √2` has traces 4 and `−4` at the two primes above 7 (d reduces to 3 and 4), and is still a non-CM ℚ-curve: its j-invariant is `−6912/23`, which is not an algebraic integer.
- Let C₀ be non-CM over a quadratic field K and let `p = 𝔭·σ𝔭` split, with good reduction at both primes. If `a_𝔭(C₀)² ≠ a_{σ𝔭}(C₀)²` then C₀ is not a ℚ-curve. For a geometric isogeny to σC₀, the one-dimensional space `Hom⁰_ℚ̄(σC₀,C₀)` is a `G_K`-line with finite action in `ℚ^×`, hence action by `{±1}`; the two Tate representations differ by this quadratic character, so their good traces agree up to sign. Unequal unsquared traces are not an obstruction to a geometric isogeny.

The defining property has the following consequences.

1. it depends only on the ℚ̄-isogeny class of C; conjugates of a ℚ-curve are ℚ-curves; a curve with a model over ℚ is a ℚ-curve; every CM curve is a ℚ-curve, because ᵍC has CM by an order in the same imaginary quadratic field and all such curves are isogenous. For the CM assertion, prove here that lattices with an action of orders in the same imaginary quadratic field are commensurable after a complex homothety, adjusting the embedded CM type by conjugation before forgetting the action. Their common finite-index sublattice gives analytic isogenies; AbelianSchemesAndArithmeticModuli §§A5.1–A5.3 algebraizes these maps. Conjugation preserves the abstract imaginary quadratic endomorphism field, so this proves the CM ℚ-curve assertion without a CM reciprocity theorem. For rational j, each conjugate has the same j-invariant; use the library `WeierstrassCurve.exists_variableChange_of_j_eq`, then the induced pointed coordinate pullback to obtain an actual isogeny.
2. Because ℚ̄-isogenies are defined over a finite extension, a ℚ-curve with a model over K has, after enlarging K to a finite Galois extension of ℚ, isogenies `μ_g : ᵍC₀ → C₀` defined over K for all `g ∈ Gal(K/ℚ)` (Ribet §6).

**Checks.**

- Every elliptic curve over ℚ is a ℚ-curve.
- Caraiani–Newton Corollary 7.2.5: a curve `E/F` over a quadratic field with `E` and `σE` geometrically 5-isogenous is a ℚ-curve.

*Needs:* `WeierstrassCurve.IsElliptic`; `AbelianSchemesAndArithmeticModuli A1`; `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; AbelianSchemesAndArithmeticModuli §§A5.1–A5.3; EllipticCurves Layer 1; `TauCeti.Isogeny`; `TauCeti.Isogeny.map`; `WeierstrassCurve.quadraticTwistOf`; `WeierstrassCurve.exists_variableChange_of_j_eq`.

Sources: [Ribet92](#references), §1, p. 2; [FLHS15](#references), §12, p. 18; [CN23](#references), §1, p. 7.

### Two native curve models

Use the rational equations `y² + y = x³ − x² − 10x − 20` for `X₀(11)`
and `y² = x³ − x` for the Gaussian CM curve. Their coefficients specify native
`WeierstrassCurve ℚ` values.
Use the native discriminant, j-invariant, base-change and isogeny APIs. Their
identifications with modular or CM data are the explicit hypotheses of the worked
specializations above, while nonsingularity follows directly from the discriminant
formula. (Ribet92, §§1 and 7, pp. 1–2 and 15–16; Mathlib
`WeierstrassCurve.Δ` and `WeierstrassCurve.j`.)

**Checks.**

- The `X₀(11)` model has `a₁ = 0`, `a₂ = −1`, `a₃ = 1`, `a₄ = −10`, `a₆ = −20`.
  Dropping the `y` term changes the curve.
- Its discriminant is `−11⁵ = −161051`, so it is nonsingular over `ℚ`.
- Its `c₄ = 496` gives `j = −122023936/161051`; replacing it by the Gaussian
  model would give `1728`.
- The Gaussian model has `a₁ = a₂ = a₃ = a₆ = 0`, `a₄ = −1`; replacing `−1` by
  zero gives a singular curve.
- Its discriminant is `64`, whereas that singular model has discriminant `0`.
- Its `j = 1728`; after base change to `ℚ̄` its rational model proves the ℚ-curve
  condition without choosing a CM action.

### Native scalar and coefficient notation

With a chosen non-CM identification `e : ℚ ≃ₐ[ℚ] End0 A` for a native variety
over `ℚ̄`, extract rational scalars by the unit map
`Units.map e.symm : (End0 A)ˣ → ℚˣ`. Require the inverse-unit-map identity,
preservation of multiplication and inverse, and recovery of u under e on underlying
elements. It is used only after
proving that the geometric endomorphisms are rational scalars; it does not extract
rational coefficients from a CM endomorphism algebra. (Ribet92, §6, p. 13.)

**Checks.**

- The identity quasi-isogeny extracts `1`, and scalar multiplication by `−1` extracts `−1`.
- A quasi-isogeny corresponding to `2/3` extracts `2/3`; using integral endomorphisms
  alone would lose this value.
- A CM automorphism acting by `i` has no such rational scalar extraction: there is
  no rational-algebra equivalence `ℚ ≃ End0 A` in that case.

For a field `F`, the coefficient module of Layer 5 is the supplied
`TauCeti.ofDiscreteModule ℤ GQ (Additive Fˣ)`, with the discrete topology and
trivial action fixed inside the representation, and its degree-two cohomology is
the canonical `continuousCohomology 2` of that representation. The API uses the
supplied coefficient maps, canonical `H²` comparison and inflation, respecting
these actions and the additive presentation of multiplication. (Ribet92, Theorem
6.3, p. 13; ProfiniteCohomology Layer 10 and the library contracts above.)

**Checks.**

- For every `g`, the action on a chosen unit is the identity; in particular complex
  conjugation fixes `i` in the `F = ℚ̄` coefficient module, unlike the natural action.
- Addition of `Additive.ofMul 2` and `Additive.ofMul 3` corresponds to the unit `6`;
  the zero additive coefficient corresponds to the multiplicative unit `1`.
- The coefficient embedding `ℚˣ → ℚ̄ˣ` induces the canonical map on `H²`, commuting
  with inflation; it is not a change to the natural Galois action.

### 5.2 The cocycle of a non-CM ℚ-curve

Construct the following data. For non-CM C₀/K, choose K-isogenies `μ_g : ᵍC₀ → C₀` over a finite Galois K/ℚ, normalized by `μ₁ = id`. Form `c(g,h) = μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹` in `Hom⁰`. Its value is a nonzero rational scalar, and c is a 2-cocycle for the trivial action on ℚˣ. Inflate its class to continuous `H²(G_ℚ,ℚˣ)`. This class depends only on the geometric isogeny class, independently of the field, model and chosen isogenies. Its degree relation is `c(g,h)² = deg μ_g deg μ_h / deg μ_{gh}`. Since C₀ is non-CM, `End⁰_K(C₀) = ℚ` and every element of `Hom⁰_K(ᵍC₀, C₀)` is a rational multiple of `μ_g`; `μ_{gh}⁻¹` is the inverse in `Hom⁰`, isogenies being invertible up to isogeny.

Require the following constructions and laws.

- `c : Gal(K/ℚ) × Gal(K/ℚ) → ℚ^×` from the chosen `μ_g`.
- c is a 2-cocycle for the trivial action.
- `[c_C] ∈ H²(G_ℚ, ℚ^×)`, by inflation.
- `[c_C]` depends only on the ℚ̄-isogeny class of the non-CM elliptic curve; it is independent of K, the model C₀ and the `μ_g` after inflation.
- `c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}`.
- If C has a model over ℚ, `[c_C] = 0`.

**Checks.**

- For a curve over ℚ with `μ_g = id`, `c ≡ 1`.
- For K quadratic, with `μ₁ = id`, `μ_σ = μ` and `μ ∘ σμ = [m]`: `c(σ, σ) = m`, `c(1, ·) = c(·, 1) = 1`.
- For a non-CM quadratic twist C₀/K of an elliptic curve E₀/ℚ, enlarge K to a finite Galois L/ℚ where a twisting isomorphism `φ : C₀,L ≅ E₀,L` is defined. Taking `μ_g = φ⁻¹ ∘ ᵍφ` gives an L-defined family of isomorphisms with `c ≡ 1` and `[c_C] = 0`. The geometric twist hypothesis does not supply K-defined conjugate isogenies.
- On a rational non-CM curve over quadratic K, the unnormalized choices
  `μ₁ = [2]`, `μ_σ = id` give `c(σ,σ) = 1/2` and `c(1,σ) = 2`; these
  choices are excluded by `μ₁ = id`.
- For a CM curve, `End⁰` is an imaginary quadratic field, the values `μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹` need not be rational, and the construction does not apply.

The proof uses the following steps.

1. `μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ ∈ End⁰_K(C₀) = ℚ`, nonzero; the cocycle identity follows from associativity of composition and `ᵍ(μ_h ∘ ʰμ_k) = ᵍμ_h ∘ ᵍʰμ_k`.
2. Changing `μ_g` to `r_gμ_g` changes c by the coboundary of r. Enlarging K inflates. To compare models in the same ℚ̄-isogeny class, first enlarge to a common finite Galois field where the comparison quasi-isogeny φ is defined, then conjugate `μ_g` by φ and ᵍφ; the cocycle values are unchanged because the scalars are rational. Any remaining choices differ by a rational coboundary. Degrees are multiplicative and `deg r = r²` on `ℚ^× ⊆ End⁰`.

**Checks.**

- For C₀ defined over ℚ take `μ_g = id`: `c = 1`.
- For K quadratic with `μ₁ = id` and `μ = μ_σ` satisfying `μ ∘ σμ = [m]`, `c(σ, σ) = m` and `c = 1` elsewhere (§5.8).

*Needs:* §5.1; `AbelianSchemesAndArithmeticModuli A6`; `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; `TauCeti.ContCohomology.explicitH2IsoContinuousCohomology`; `TauCeti.ContCohomology.explicitIso_coeffMap2`; `TauCeti.ContCohomology.explicitIso_infl2`; `continuousCohomology`; `TauCeti.ofDiscreteModule`; `TauCeti.ContCohomology.Z2`; `TauCeti.ContCohomology.explicitInfl2`.

Sources: [Ribet92](#references), proof of Theorem 6.1, p. 13.

### 5.3 Tate's theorem: `H²(G_ℚ, ℚ̄^×) = 0` for the trivial action, and the splitting map α

Prove that continuous `H²(G_ℚ,ℚ̄ˣ)` vanishes when ℚ̄ˣ is discrete with trivial action. Therefore the geometric cocycle has a locally constant splitting α with `c(g,h) = α(g)α(h)/α(gh)`. Enlarge K to a finite Galois field K′ through which α factors. Then `ε_C(g) = α(g)²/deg μ_g` is a finite-order Dirichlet character, and the field `E_α = ℚ(α(g) : g ∈ G_ℚ)` is an abelian extension of ℚ.

The proof uses the following steps.

1. The torsion of M is `μ_∞ ≅ ℚ/ℤ` with trivial action and `M/μ_∞` is uniquely divisible, so `H^i(G_ℚ, M/μ_∞) = 0` for `i ≥ 1` (use the library’s positive-degree vanishing for discrete ℚ-modules); hence `H²(G_ℚ, M) = H²(G_ℚ, ℚ/ℤ) = 0` (ArithmeticGaloisRepresentations §7.6, “Projective lifting”).
2. The image of `[c_C]` in `H²(G_ℚ, ℚ̄^×)` vanishes, giving α; a locally constant α factors through a finite quotient.
3. `α(g)²/deg μ_g` is multiplicative by §5.2 `(c² = ∂(deg μ))`, so it is a character of finite order, a Dirichlet character; `α² ≡ ε_C mod ℚ^×` makes `E_α` abelian over ℚ.

**Checks.**

- For K quadratic with `μ₁ = id`, `μ_σ = μ` and `μ ∘ σμ = [m]`, choose
  `α(1) = 1`, `α(σ) = √m`. Then `ε_C` is trivial or the character of K/ℚ
  according to the sign of m (§5.8).
- The statement fails for nontrivial action: `H²(G_ℚ, ℚ̄^×)` with the Galois action is not zero (it contains the Brauer group of ℚ).
- Normalization gives `c(1,g) = 1`, so every splitting satisfies `α(1) = 1`;
  multiplying α by a nontrivial finite character can still change `E_α`.

*Needs:* `ArithmeticGaloisRepresentations §7.6, “Projective lifting”`; §5.2; `TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_of_module_rat`; `TauCeti.ContCohomology.explicitH2IsoContinuousCohomology`; `TauCeti.ContCohomology.explicitIso_coeffMap2`; `TauCeti.ContCohomology.explicitIso_infl2`; `ArithmeticGaloisRepresentations Layer 2`; `DirichletCharacter`; `cyclotomicCharacter`; `continuousCohomology`; `TauCeti.ofDiscreteModule`.

Sources: [Ribet92](#references), Theorem 6.3, p. 13; [Ribet92](#references), proof of Theorem 6.3, p. 13.

### 5.4 Ribet's Lemma 6.4: the endomorphism algebra of `Res_{K/ℚ} C₀` is a twisted group algebra

Prove the following. Use a common finite Galois K/ℚ where both the conjugate isogenies and the splitting α are defined. The actual `B = Res_{K/ℚ} C₀` is an abelian variety of dimension `[K:ℚ]`. Its rational endomorphisms identify with `⊕_σ Hom⁰_K(σC₀,C₀)`. The `μ_σ` give a basis `λ_σ` satisfying `λ_σλ_τ = c(σ,τ)λ_{στ}`, hence `End⁰_ℚ(B) ≃ R = ℚ^c[Gal(K/ℚ)]`. This algebra is semisimple, and `λ_σ ↦ α(σ)` gives a surjective ℚ-algebra map `ω : R → E_α`.

The proof uses the following steps.

1. B is an abelian variety over ℚ representing `S ↦ C₀(S_K)` (AbelianSchemesAndArithmeticModuli A6), so `Hom_ℚ(X, B) = Hom_K(X_K, C₀)` for abelian X/ℚ; with `B_K ≅ ∏_σ σC₀` (AbelianSchemesAndArithmeticModuli §A6.31) this gives `End⁰_ℚ(B) = ⊕_σ Hom⁰_K(σC₀, C₀) = ⊕_σ ℚ·μ_σ`.
2. `λ_σ` acts on `B_K = ∏_g ᵍC₀` by the matrix sending the factor ᵍσC₀ to ᵍC₀ through `ᵍμ_σ`; the identity `μ_σ ∘ σμ_τ = c(σ, τ)μ_{στ}` gives the multiplication table.
3. ω is multiplicative because `c = ∂α`; it is onto `E_α` by definition. R is semisimple as `End⁰` of an abelian variety (A6).

**Checks.**

- For C₀ over ℚ and `K = ℚ`, `R = ℚ` and `B = C₀`.
- For K quadratic, `R = ℚ[X]/(X² − m)` (§5.8).

*Needs:* §5.2; §5.3; `AbelianSchemesAndArithmeticModuli A6`.

Sources: [Ribet92](#references), Lemma 6.4, p. 14; [Ribet92](#references), §6, p. 14.

### 5.5 Ribet's Proposition 6.5 and Corollary 6.6: `B_K ~ R ⊗ C₀` and `Lie(B)` is free of rank one

Prove the following. Write `T = ∏_σ C_σ` with each `C_σ` a copy of C₀ over K. On T let `λ_g` carry `C_σ` to `C_{gσ}` by the rational scalar `c(g,σ)`. The map `ι : T → B_K = ∏_σ σC₀` in the isogeny category sends `C_σ` to the `σ⁻¹C₀` factor by `σ⁻¹μ_σ`. It is R-equivariant for this source action and the structural target action. Taking Lie algebras and descending the semisimple multiplicities proves `Lie(B/ℚ) ≃ R` as R-modules.

The proof uses the following steps.

1. On the `C_σ` factor put `h = (gσ)⁻¹`. The structural `λ_g` sends the `σ⁻¹C₀` factor to hC₀ through `ʰμ_g`. Thus `λ_gι` has component `ʰμ_g ∘ ᵟμ_σ` with `δ = σ⁻¹`, equal to `ʰ(μ_g ∘ ᵍμ_σ) = c(g,σ)ʰμ_{gσ}`. This is the component of `ιλ_g` from `C_σ` to hC₀, proving equivariance with the source’s inverse-index convention.
2. `Lie(B_K/K) = Lie(B/ℚ) ⊗ K`, and through ι it is `R ⊗_ℚ Lie(C₀/K)` with R acting on the first factor; `Lie(C₀/K)` is one-dimensional, so `Lie(B_K/K)` is free of rank one over `R ⊗ K`, and freeness descends to `Lie(B/ℚ)` over R. Here R is finite-dimensional semisimple: descent of this module isomorphism follows by comparing simple-module multiplicities in its Wedderburn decomposition, not from a general assertion that free modules descend over every ring.

**Checks.**

- For `K = ℚ`: `Lie(C₀)` is free of rank one over ℚ.
- For K quadratic, `Lie(B)` is a free `ℚ[X]/(X² − m)`-module of rank one, two-dimensional over ℚ.

*Needs:* §5.4; `TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`; `AbelianSchemesAndArithmeticModuli A6`; `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

Sources: [Ribet92](#references), Proposition 6.5, p. 15; [Ribet92](#references), Corollary 6.6, p. 15.

### 5.6 Ribet's Theorem 6.1: non-CM ℚ-curves are factors of GL₂-type varieties

Prove the following. For a non-CM ℚ-curve, let π be the central projector of R onto the `E_α` factor. Take the image A of a positive integer multiple of π acting on B. It is a ℚ-simple, primitive `GL₂(E_α)`-type variety with `End⁰_ℚ(A) = E_α` and `dim A = [E_α:ℚ]`. Over K it is isogenous to `C₀^{dim A}`; thus C is a geometric simple factor of A.

`ribetTheorem61` in `Suggested.lean` uses a one-dimensional abelian variety
C over ℚ̄. `IsGeometricQCurve C` requires actual isogenies from every base
change along `σ : G_ℚ` to C. This agrees with the Weierstrass ℚ-curve condition under
AbelianSchemesAndArithmeticModuli §A1.6's elliptic comparison. Non-CM is expressed
by `Nonempty (ℚ ≃ₐ[ℚ] End0 C)`. The theorem supplies a simple A over ℚ, its
full endomorphism number field of degree dim A, and an actual ℚ̄-isogeny
`A_ℚ̄ → C^{dim A}`. It asserts existence of a factor, with no preferred splitting α.

The proof uses the following steps.

1. `R = E_α × ker ω` as semisimple algebras; let π be the idempotent of `E_α` and `A ⊆ B` the image of mπ for m with `mπ ∈ End_ℚ(B)`; A is nonzero, defined over ℚ, and `E_α = πRπ` acts on A.
2. `E_α` acts without multiplicity on `Lie(B)` (§5.5), hence on `Lie(A)`, so `dim A = [E_α : ℚ]` and A is of `GL₂(E_α)`-type (SmallRamificationAndAbelianVarietyBaseCases §5.1).
3. `B_K` is isogenous to a power of C₀ (AbelianSchemesAndArithmeticModuli §A6.31 with `σC₀ ~ C₀`), so `A_K` is too, and C₀ is a quotient of `A_K`. A is primitive: `End⁰_ℚ(A) = πRπ = E_α` is a field (§1.3).

**Checks.**

- For a rational model choose `K = ℚ`, `μ₁ = id` and `α = 1`. Then
  `E_α = ℚ` and the projector image is the rational curve itself.
- For a rational non-CM model over cyclic cubic K, take `μ_g = id` and α a
  nontrivial cubic character. Then `c = 1`, but `E_α = ℚ(ζ₃)` and the
  projector image has dimension two. The splitting choice affects the factor.
- For the `ℚ(√13)`-curve of Ribet §7, choose `K = ℚ(√13)`, its K-defined
  conjugate isogeny, `μ₁ = id`, and the quadratic splitting `α(1) = 1`,
  `α(σ) = √m`. Then `E_α = ℚ(√3)`, and the projector image is ℚ-isogenous
  to the level-169 `A_f` and has dimension two.
- Inflate these isogenies to `Kℚ(ζ₁₁)⁺`, and multiply the inflated splitting
  by an order-five character of `Gal(ℚ(ζ₁₁)⁺/ℚ)`. The cocycle is unchanged,
  but now `E_α = ℚ(√3, ζ₅)` and the projector image has dimension eight.

*Needs:* §5.5; §5.4; §5.3; §1.3; `SmallRamificationAndAbelianVarietyBaseCases §5.1`; `AbelianSchemesAndArithmeticModuli A6`.

Sources: [Ribet92](#references), Theorem 6.1, p. 12; [Ribet92](#references), proof of Theorem 6.1, p. 15.

### 5.7 Ribet's Corollary 6.2, unconditional: ℚ-curves are quotients of `J₁(N)` over ℚ̄

Prove the following. Every non-CM ℚ-curve is a geometric quotient of some positive-level `J₁(N)`. More precisely choose a weight-two newform f at level N and a finite Galois K′/ℚ with a model C₀ of C such that `(A_f)_{K′}` is K′-isogenous to `C₀^{[K_f:ℚ]}`. The forward assertion follows by applying Layer 3 to the projector variety. Ribet’s converse from geometric factors to ℚ-curves belongs to the broader building-block theory.

Apply the modularity theorem to the simple rational variety from
`ribetTheorem61`. Composing its Jacobian quotient with the geometric
isogeny and a coordinate projection gives the quotient of C.

The proof uses the following steps.

1. §5.6 gives A over ℚ of GL₂-type with `A_{K′} ~ C₀^{dim A}`; §3.6 gives `A ~ A_f` and a surjection `J₁(N) → A` over ℚ; compose over K′ with a projection `A_{K′} → C₀`.
2. CM curves are excluded: they are quotients of `J₁(N)_ℚ̄` by Shimura's theorem ([Shimura71](#references), Theorem 1, p. 206), which belongs to the CM theory, and Caraiani–Newton count CM curves as modular by definition.

**Checks.**

- A curve over ℚ: f its newform, `K′ = ℚ`.
- The 5-isogenous family of Caraiani–Newton Corollary 7.2.5 consists of such curves.
- The Gaussian CM curve has geometric rational endomorphism algebra `ℚ(i)`, so
  it does not satisfy the native non-CM hypothesis; its separate CM modularity
  assertion is the one specified in the scope.

*Needs:* §5.6; §3.6; `ModularCurvesPartII §§16.1–16.7`.

Sources: [Ribet92](#references), Corollary 6.2, p. 12; [FLHS15](#references), §12, p. 18.

### 5.8 ℚ-curves over quadratic fields (Ribet §7)

Prove the following. Let K/ℚ be quadratic, σ its nontrivial automorphism, and C₀/K non-CM with a K-isogeny `μ : σC₀ → C₀`. Write `μ ∘ σμ = [m]`, where m is a nonzero integer. The Weil-restriction endomorphism algebra is `ℚ[X]/(X²−m)`, and the character `θ = α²/deg μ` has `θ(σ) = sign(m)`. If m is a square, the algebra is `ℚ × ℚ` and C₀ is K-isogenous to a rational elliptic curve. If m is not a square, `B = Res_{K/ℚ} C₀` is a primitive `GL₂(ℚ(√m))`-type surface, with determinant character `ε = θ`; its endomorphism field is real exactly when θ is trivial. Imaginary K forces `m > 0`. Thus in the nonsquare case at least one of K and `ℚ(√m)` is real, and imaginary K makes B a Γ₀ quotient. In the square case its rational elliptic factors are Γ₀ modular.

The proof uses the following steps.

1. Normalize `μ₁ = id`, `μ_σ = μ`, and choose `α(1) = 1`, `α(σ) = √m`. Then c takes the value m on (σ, σ) and 1 elsewhere (§5.2); `R = ℚ[X]/(X² − m)` by §5.4, split by `α(σ) = √m`.
2. (a) m a square: `R ≅ ℚ × ℚ`, `E_α = ℚ`, and §5.6 gives an elliptic curve A over ℚ with `A_K ~ C₀`. (b) `R = E` is a field and `B = A` is primitive; `B_K ~ C₀ × C₀` with E acting through its regular representation, so `det ρ_λ|_{G_K} = χ_ℓ`, ε is a character of `Gal(K/ℚ)`, nontrivial exactly when E is imaginary (§2.6, §3.9), hence `ε = θ`.
3. (c) If K is imaginary, σ is complex conjugation, `C₀(ℂ) = ℂ/L` and `σC₀(ℂ) = ℂ/L̄`, μ is multiplication by some `γ ∈ ℂ^×`, and `m = γγ̄ > 0`. Alternatively: if E is imaginary, `ε = θ` is nontrivial and even (§2.4), so K is real.

**Checks.**

- Caraiani–Newton’s imaginary quadratic ℚ-curves with K-defined conjugate isogenies fall under (c): the nonsquare case has E real and `ε = 1`, while the square case descends to rational elliptic factors.
- Koike's example: `E = ℚ(√3)` real, `K = ℚ(√−3)` imaginary (Ribet §7, level 81).
- Shimura's examples with E imaginary and K real (Ribet §7).

*Needs:* §5.2; §5.4; §5.6; §2.3; §2.4; §2.6; §3.9; `AbelianSchemesAndArithmeticModuli A6`.

Sources: [Ribet92](#references), §7, p. 15; [Ribet92](#references), Lemma 7.1, p. 16; [Ribet92](#references), Proposition 7.2, p. 16.


### Examples

For a rational model choose `K = ℚ`, `μ₁ = id` and `α = 1`: the cocycle is `1`,
`E_α = ℚ`, and the factor is the curve itself. Other splittings over larger
fields can select rational factors of higher dimension. Over a quadratic field, `m` square gives a split algebra, whereas nonsquare `m` gives a quadratic coefficient field; imaginary base fields force `m > 0`.

### Dependencies

*Needs:* Layers 1–4; AbelianSchemesAndArithmeticModuli §§A1.6, A5.1–A5.3, A6.4–A6.8 and A6.26–A6.33; ArithmeticGaloisRepresentations §7.6; ProfiniteCohomology Layer 10 and the canonical library `H²` comparisons; ModularCurvesPartII Layer 16; SmallRamificationAndAbelianVarietyBaseCases §5.1.

## Layer 6: Modularity of ℚ-curves over their fields of definition

The geometric factor from Layer 5 identifies Tate representations on a sufficiently small open subgroup. A finite character accounts for their comparison over the original field. Solvable base change and reciprocity turn this comparison into automorphy with all finite local factors. The final quadratic statement includes CM as a separate case.

### 6.1 Representations agreeing on an open normal subgroup differ by a character

Let G be profinite and H an open normal subgroup. Over an algebraically closed characteristic-zero field L with its ℓ-adic or discrete topology, take continuous representations `ρ₁, ρ₂ : G → GL_n(L)` of any positive finite dimension `n`. Prove that if their restrictions to H are isomorphic and absolutely irreducible, there is a character `ψ : G/H → Lˣ` with `ρ₂ ≃ ρ₁ ⊗ ψ`. In particular the inflated character has finite order.

This target owns the extension to arbitrary positive finite rank.
Its rank-two specialization, for a prime-cyclic extension E/F and two
compatible families whose members agree and are absolutely irreducible on `G_E`,
is the Schur-lemma step of GL2AutomorphicRepresentationsAndTransfer R17.6.18,
Automorphic descent with a consistent compatible-system twist: there the two
members are `r_λ` and `ρ_{π,λ}`, the open normal subgroup is `G_E`, and the
character is a power of the norm-kernel character `η_λ`. The open normal subgroup
has finite discrete quotient, so the character obtained is automatically
continuous. R17.6.18 owns the common twist across coefficient primes and
automorphic descent; Layer 6 owns the higher-rank extension and the ℚ-curve
application.

The proof uses the following steps.

1. `Hom_H(ρ₁, ρ₂)` is one-dimensional by Schur's lemma; G acts on it by `(g·φ) = ρ₂(g) ∘ φ ∘ ρ₁(g)⁻¹`, H trivially since φ is H-equivariant, so G/H acts through a character ψ.
2. A nonzero φ is injective and surjective (`ρ₁|_H`, `ρ₂|_H` irreducible of the same finite dimension) and satisfies `ρ₂(g) ∘ φ = ψ(g) · φ ∘ ρ₁(g)` for the character ψ of G/H by which G acts on the line `Hom_H(ρ₁, ρ₂)`; so `φ : ρ₁ ⊗ ψ ≅ ρ₂`. ψ is continuous as it factors through the finite group G/H.

**Checks.**

- For any positive finite dimension, `ρ₂ = ρ₁ ⊗ η` with a character `η` of `G/H` recovers `ψ = η`.
- For `n = 2`, the hypothesis says there is no common invariant line on the open subgroup; this is the form used for the Tate components here.
- For `G = S₃ × C₃`, `H = S₃ × {1}`, let ρ₁ be the inflated standard two-dimensional representation of S₃ and η a character of C₃ taking a generator to a primitive cube root ζ₃. For `ρ₂ = ρ₁ ⊗ η`, both rank-two interfaces give `ψ = η`; the trace at that generator is `2ζ₃`, distinguishing η from its inverse.
- Fails without absolute irreducibility on H: for `ρ₁|_H` reducible, `Hom_H` can be two-dimensional and no character need exist.

*Needs:* `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`; `LinearMap.bijective_or_eq_zero`; `ArithmeticGaloisRepresentations Layer 1`; `GL2AutomorphicRepresentationsAndTransfer R17.6.18` for the rank-two specialization.

Sources: [Ribet92](#references), proof of Theorem 5.3, p. 10.

### 6.2 The Tate module of a ℚ-curve is a twist of the restriction of a newform's representation

Prove the following. For a non-CM ℚ-curve C over any number field K and any prime ℓ, choose a weight-two newform f, an embedding `ι : K_f → ℚ̄_ℓ` and a finite-order character `ψ : G_K → ℚ̄_ℓˣ` such that `V_ℓ(C) ⊗_{ℚ_ℓ} ℚ̄_ℓ ≃ (ρ_{f,ι}|_{G_K}) ⊗ ψ`. The restriction of `ρ_{f,ι}` to `G_{K″}` remains absolutely irreducible for every finite extension K″/K.

The proof uses the following steps.

1. By §5.6 and §5.7 there are `A_f` over ℚ and a finite Galois K′/ℚ containing K with `(A_f)_{K′} ~ C_{K′}^{n}`, `n = [K_f : ℚ]`; so `V_ℓ(A_f)|_{G_{K′}} ≅ V_ℓ(C)^{n}`, compatibly with `K_f ⊗ ℚ_ℓ` acting on `Hom⁰_{K′}(C, A_f) ⊗ ℚ_ℓ`, a free module of rank one.
2. Hence `ρ_{f,ι}|_{G_{K′}} ≅ V_ℓ(C) ⊗ ℚ̄_ℓ` restricted to `G_{K′}` for every ι (AutomorphicGaloisRepresentations §§6.1–6.4 and Jordan–Hölder).
3. `V_ℓ(C)` is absolutely irreducible on every open subgroup: Faltings over K″ gives `End_{G_{K″}} V_ℓ(C) = End_{K″}(C) ⊗ ℚ_ℓ = ℚ_ℓ` with `V_ℓ(C)` semisimple (FaltingsFinitenessAndIsogenyTheorems R28.6, FaltingsFinitenessAndIsogenyTheorems §R28.6.3). Apply §6.1 to `G_K ⊇ G_{K′}`.

**Checks.**

- C with a model over ℚ: f is the newform of the model, ψ the quadratic character of a twist.
- For K quadratic and m a non-square (§5.8), f has `K_f = ℚ(√m)` and `B = Res_{K/ℚ}C ~ A_f`.

*Needs:* §5.6; §5.7; §6.1; `AutomorphicGaloisRepresentations §§6.1–6.4`; `FaltingsFinitenessAndIsogenyTheorems R28.6`; `ArithmeticGaloisRepresentations §§6.1–6.4`.

Sources: [Ribet92](#references), Lemma 7.1 proof, p. 16.

### 6.3 Modularity of ℚ-curves over solvable Galois fields

Prove the following. Suppose K/ℚ is finite, Galois and solvable, and C/K is a non-CM ℚ-curve. Use the f and finite algebraic character underlying ψ from the preceding target. Base change `π_f` along a prime-cyclic tower and twist by its finite-order Hecke avatar `ψ_Hecke` in the reciprocity convention above. The resulting `Π = BC_{K/ℚ}(π_f) ⊗ (ψ_Hecke)` is cuspidal of parallel weight two. For every finite place v, its local factor in `L(Π,s−1/2)` equals that of `L(C,s)`, including bad places. At an unramified v its classical `T_v` eigenvalue is `a_v(C) = Nv+1−#C̃_v(k_v)`. Consequently C is modular in Caraiani–Newton’s sense, and in the Freitas–Le Hung–Siksek sense when K is totally real.

The proof uses the following steps.

1. Base change: K/ℚ is Galois solvable, so `BC_{K/ℚ}` is defined along a prime-cyclic tower (GL2AutomorphicRepresentationsAndTransfer §§R17.4.3–R17.4.9); at each step the image stays cuspidal because `ρ_f` restricted to every open subgroup is absolutely irreducible (§6.2), so `π_f` is never dihedral relative to a step.
2. Fix the one-ℓ isomorphism (f,ι,ψ) from §6.2. The finite image of ψ consists of roots of unity; choose their algebraic lifts compatibly with ι in a finite number field containing `K_f`, and use global Artin reciprocity to form its finite-order Hecke character. At good v the one-ℓ isomorphism identifies the algebraic trace and determinant of the twisted restricted newform with the rational polynomial of C. Injectivity of the coefficient embedding makes these identities algebraic, so they transport to every auxiliary coefficient prime. GL2AutomorphicRepresentationsAndTransfer §R17.6.17 then matches the twisted base change Π with this family at good v; ArithmeticGaloisRepresentations §5.3 recognition identifies it with `V_ℓ′(C)` for every auxiliary ℓ′, using continuity, semisimplicity and the corresponding embeddings and twists.
3. For any finite v over p, now choose an auxiliary `ℓ′ ≠ p` using the preceding transport, rather than changing the original fixed ℓ without justification. GL2AutomorphicRepresentationsAndTransfer §R17.4.3 identifies `rec(Π_v)` with the restriction of `rec(π_{f,p})` to `W_{K_v}` twisted by the algebraic character at v; Carayol (AutomorphicGaloisRepresentations §§4.4–4.9 and 6.4) compares this with the WD parameter of the corresponding ℓ′-adic member. Apply the arithmetic/cohomological dual dictionary of AutomorphicGaloisRepresentations §3.11 to these local parameters before comparison with the covariant `V_ℓ′(C)`. The resulting identification gives equality of the local factors even at bad v (NeronModelsAndSemistableAbelianVarieties §5.6).
4. At archimedean places the base change of the weight-two discrete series is cohomological of parallel weight two.

**Checks.**

- `K = ℚ`: `Π = π_f ⊗ ψ`, recovering the modularity of twists of curves over ℚ.
- For a quadratic `K` and a `K`-point `P` of `X(b3, ns5)` with `x(P) ∈ ℚ`, the underlying curve is a ℚ-curve (Caraiani–Newton Corollary 7.3.4, first case, where `σ(P) = w₃(P)`): Π is a twisted base change from ℚ of a weight-two newform. The two `ℚ(√−11)`-points of their Proposition 7.3.3 are not covered by that argument and are outside this target.
- Non-example: for K/ℚ not solvable the base-change step is unavailable and the theorem makes no claim.

*Needs:* §6.2; `GL2AutomorphicRepresentationsAndTransfer §§R17.4.3–R17.4.9`; `GL2AutomorphicRepresentationsAndTransfer §§R17.6.17–R17.6.18`; `AutomorphicGaloisRepresentations §§3.11, 4.4–4.9 and 6.4`; `NeronModelsAndSemistableAbelianVarieties §§5.4–5.7`; `ClassFieldTheory Layer 11`; `AutomorphicGaloisRepresentations §1.5`; `ArithmeticGaloisRepresentations §5.3`.

Sources: [FLHS15](#references), §12, p. 18; [CN23](#references), §1, p. 2; [FLHS15](#references), §1, pp. 2–3.

### 6.4 ℚ-curves over quadratic fields are modular

Prove the following. Every ℚ-curve over a real or imaginary quadratic field is modular in the sense of Caraiani–Newton §1. The conclusion includes their CM alternative. In the non-CM case obtain a cuspidal parallel-weight-two Π on `GL₂(𝔸_K)` with `L(Π,s−1/2) = L(C,s)`. This supplies the ℚ-curve input to Caraiani–Newton Corollaries 7.2.5 and 7.3.4 and Freitas–Le Hung–Siksek §12.

The proof uses the following steps.

1. CM curves are modular by definition in Caraiani–Newton's sense.
2. Otherwise K/ℚ is cyclic of degree two, hence solvable Galois, and §6.3 applies.
3. For imaginary K and a K-defined isogeny `σC → C`, §5.8 gives `m > 0`. If m is nonsquare, `Res_{K/ℚ} C` has a real quadratic endomorphism field and is a quotient of `J₀(N)`. If m is square, its endomorphism algebra is `ℚ × ℚ`: the rational elliptic factors are Γ₀-modular, so their product is a quotient of `J₀(N)` at a common multiple of their levels. This last conclusion does not turn the split endomorphism algebra into a field.

**Checks.**

- Caraiani–Newton Corollary 7.2.5: `E/F` with `E` and `σE` geometrically 5-isogenous, so E is modular.
- Freitas–Le Hung–Siksek Lemma 12.1: the real quadratic points of `X₀(35)` that are ℚ-curves give modular curves.
- Non-example: a quadratic-field curve that is not a ℚ-curve gets no conclusion here.

*Needs:* §6.3; §5.8; §5.1.

Sources: [CN23](#references), Corollary 7.2.5, p. 97; [CN23](#references), Corollary 7.3.4, p. 98; [FLHS15](#references), §12, pp. 18–19, especially Lemma 12.1, p. 19.

### Examples

For `K = ℚ`, the twist theorem is ordinary elliptic modularity. For either real or
imaginary quadratic `K`, its degree-two Galois group supplies the required solvable
tower. The non-CM conclusion is full cuspidal automorphy; the CM alternative is the
one in Caraiani–Newton's definition. A quadratic curve failing the squared-trace
ℚ-curve check receives no conclusion from Layer 6.

### Dependencies

*Needs:* Layer 5; ArithmeticGaloisRepresentations §§1.7–1.8 and 5.3; AutomorphicGaloisRepresentations §§1.5, 4.4–4.9 and 6.1–6.4; FaltingsFinitenessAndIsogenyTheorems §§R28.6.2–R28.6.4; GL2AutomorphicRepresentationsAndTransfer §§R17.4.3–R17.4.9 and R17.6.17–R17.6.18; ClassFieldTheory Layers 11–12; NeronModelsAndSemistableAbelianVarieties §5.6.

## Downstream consumers

EllipticCurveModularityImaginaryQuadratic uses §6.4 for
non-CM ℚ-curves over quadratic fields in the Caraiani–Newton sense. The output is a
cuspidal parallel-weight-two representation with every finite local factor, including
bad places, and `L(Π,s−1/2) = L(C,s)`; it does not require conjugate isogenies to be
defined over the original quadratic field. §5.8 adds the sharper
Weil-restriction description when those isogenies are defined over that field.

## References

- **KW-I.** Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Inventiones mathematicae 178 (2009), no. 3, 485–504; authors' copy results.pdf (23 pp., PDF of 31 May 2009), cited by its own page numbers. Target citations use this version and its stated pagination.
- **Ribet92.** Kenneth A. Ribet, [Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf). Algebra and Topology 1992 (Taejŏn), Korea Adv. Inst. Sci. Tech. (1992), 53–79; reprinted in Modular Curves and Abelian Varieties, Progress in Mathematics 224 (2004), 241–261; author's AMS-TeX manuscript korea.pdf (19 pp., PDF of 6 September 2003), cited by its own page numbers. Target citations use this version and its stated pagination.
- **Carayol86.** Henri Carayol, [Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/item/ASENS_1986_4_19_3_409_0.pdf). Annales scientifiques de l'École normale supérieure (4) 19 (1986), no. 3, 409–468; Numdam scan with text layer (published pagination; PDF page = printed page − 407). Target citations use this version and its stated pagination.
- **FLHS15.** Nuno Freitas, Bao V. Le Hung and Samir Siksek, [Elliptic curves over real quadratic fields are modular](https://arxiv.org/pdf/1310.7088v4). Inventiones mathematicae 201 (2015), 159–206; arXiv:1310.7088v4 (18 July 2014). Target citations use this version and its stated pagination.
- **Ribet80.** Kenneth A. Ribet, [Twists of modular forms and endomorphisms of abelian varieties](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0253/LOG_0011.pdf). Mathematische Annalen 253 (1980), 43–62; Göttingen digitization centre scan, cited by its printed page numbers.
- **Shimura71.** Goro Shimura, [On elliptic curves with complex multiplication as factors of the Jacobians of modular function fields](https://doi.org/10.1017/S0027763000014471). Nagoya Mathematical Journal 43 (1971), 199–208; publisher-open copy, cited by its printed page numbers.
- **FW84.** Gerd Faltings, Gisbert Wüstholz et al., *Rational points*, Aspects of Mathematics E6, Vieweg, Braunschweig/Wiesbaden, 1984. Cited by its locator alone, for the mod-ℓ semisimplicity theorem that Ribet92 attributes to it.
- **DS05.** Fred Diamond and Jerry Shurman, *A First Course in Modular Forms*, Graduate Texts in Mathematics 228, Springer, 2005. Cited by its locator alone.
- **DDT.** Henri Darmon, Fred Diamond and Richard Taylor, [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Current Developments in Mathematics 1995, International Press, 1–154; the first author's copy (revision of 9 September 2007), cited by its own page numbers.
- **CN23.** Ana Caraiani and James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3 (27 March 2025). Target citations use this version and its stated pagination.
