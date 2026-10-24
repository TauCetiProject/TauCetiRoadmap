# Roadmap: étale cohomology foundations, part II: refined duality, perverse decomposition and local traces

**Summary.** Starting from EtaleCohomologyFoundations, construct duality for nonprojective finite coefficients, multiplicity-sensitive flat traces, higher étale cycle classes, and the functor calculus of perverse sheaves. Develop the perverse weight filtration, the decomposition theorem and relative hard Lefschetz. Finally construct cohomological correspondences and local terms, prove the contracting and tubular-neighbourhood trace comparisons, and extract graded Frobenius determinant signs using the supplied reciprocal-polynomial identity. The comparison results retain integral torsion and distinguish adjunction mates from stronger geometric transport.

## Scope and ownership

EtaleCohomologyFoundations is the first prerequisite. Its constructible coefficient categories, six operations, smooth trace and purity, finite-Tor Verdier duality, basic projective-bundle and global blow-up formulas, middle perversity and open intermediate extension are the starting point. The present additions include all bounded constructible complexes over self-injective finite coefficients, flat traces with multiplicities, higher Chern classes and Chow descent, abstract recollement, detailed perverse operations, intersection complexes and decomposition. A retained variant states explicitly which additional coefficient range, map compatibility or geometric conclusion it supplies.

DeligneWeightsAndPurity supplies scalar Weil numbers, Frobenius spectra, punctual and determinantal weights, the curve estimates, Weil II, mixed complexes and the directional six-operation weight bounds. It also supplies the weight filtration and geometric semisimplicity of **lisse** mixed sheaves and absolute hard Lefschetz. Here the new objects are mixed **perverse** sheaves, their weight filtration and geometric semisimplicity, categorical primitive summands, relative hard Lefschetz and decomposition. The vector-space primitive decomposition is used from that supplier; the extension to an abelian category with Tate twist is constructed here.

SchemeAndStackFoundations supplies dimension functions, projective and blow-up geometry, Chow groups and their intersection operations. AlgebraicVectorBundles supplies finite locally free sheaves, duals and tensor operations. Their Chern theory in Chow groups is distinct from the étale Chern classes constructed here. JacobianChallenge supplies line bundles, degrees and the principally polarized Jacobian. LefschetzPencilsAndVanishingCycles supplies pencils, vanishing cycles and nearby cycles. AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomology and ComplexComparisonPartII supply the coefficient categories and comparison functors used below. Their exact ranges are part of the contracts, rather than implicit identifications of categories.

The scope is separated finite-type **schemes**. General Gabber absolute purity, semistable-trait fundamental classes, perverse sheaves over traits with a rectified dimension function, relative perverse `t`-structures over a curve, stack operations and stack trace formulas, perfect algebraic spaces, and equivariant and hyperbolic localization require separate extensions. The curve Euler–Poincaré formula with Swan conductors is constructed in §5.2. Formal models over `O_C/p` and non-Noetherian solid coefficient rings are also outside this scope. Decomposition over `ℂ` or `ℚ̄_ℓ` does not assert semisimplicity over a smaller coefficient field. The supported topological interface is constructed in §3.6. Integral analytic realization and strong diamond transport retain the explicit additional hypotheses stated below.

## Conventions

Unless a statement specifies another base, schemes are separated of finite type over a field `k`, and `ℓ` is invertible in `k`. Geometric traces and vector-space duality are taken over a separably closed field. Over a general field, relative duality lives in the derived category of Galois modules; applying absolute Galois cohomology does not produce ordinary linear duality.

Write `Λ` for a Noetherian torsion coefficient ring annihilated by an integer invertible on the base. The all-constructible finite-level duality statements require `Λ` self-injective, particularly `O/λ^m` for a DVR `O` and `m ≥ 1`. Arbitrary `Λ` retains the finite-Tor range. For adic statements, `E/ℚ_ℓ` is finite, `O` is its ring of integers and `λ` a uniformizer; the exponent in `O/λ^m` is independent of its ramification index over `ℤ_ℓ`. An `O`-local system called finite free is locally finite free. A general finite locally constant `Λ`-sheaf need not be projective. `ℚ̄_ℓ` coefficients are obtained by finite-diagram descent through finite `E`, rather than by assuming every object is defined over `ℚ_ℓ`.

Complexes are cohomologically graded: `H^i(K[a]) = H^{i+a}(K)`. `D^b_c` denotes bounded constructible complexes and `D_ctf` the constructible finite-Tor subcategory. Tensor products and internal `Hom` are derived unless described as underived sheaf operations. Duality is `D_X K = RHom(K,a^!Λ)`. For a smooth morphism of pure relative dimension `d`, the imported trace identifies `f^!K` with `f^*K(d)[2d]`.

Geometric Frobenius acts on `ℚ_ℓ(1)` by `q⁻¹`. Thus an untwisted Poincaré pairing has target `ℚ_ℓ(−d)` and multiplier `q^d`. A shift `[a]` raises the weight of a pure complex by `a`, and a Tate twist (r) lowers it by `2r`. The perverse dimension function is `δ(x) = dim closure{x}`. `IC_X(L) = j_!*(L[d])` on a pure `d`-dimensional support; there is no half Tate twist. Integral `p` and `p⁺` are distinct, exchanged by Verdier duality.

Projective bundles parameterize lines: `P(E) = Proj Sym(E∨)`, with `O(−1) ⊂ π^*E` and `ξ = c₁(O(1))`. The Chern relation has all plus signs, `Σ π^*c_r(E) ξ^{rank E−r} = 0`. For rank one, `ξ = −π^*c₁(E)`; this fixes the convention. For a smooth centre `Z ⊂ X`, the exceptional divisor of `Bl_Z X` is `P(N_Z/X)`, and `O(−E)|_E = O_E(1)`.

A correspondence has legs `c₁:C→X₁` and `c₂:C→X₂`. Its cohomological morphisms are `c₁^*F₁→c₂^!F₂`, equivalently `c₂!c₁^*F₁→F₂`. The graph of `g` is `(g,id)`, so it acts through `u:g^*F→F`. Fixed loci and inverse images are scheme-theoretic unless underlying supports are explicitly mentioned. In particular, an isolated fixed point can have a nonreduced Artin fixed component.

## Exact supplier contracts

The named suppliers below are the existing TauCetiRoadmap documents, with versioned references in the bibliography. In particular, the weight-theory input is TauCetiRoadmap.DeligneWeightsAndPurity, whose scalar, lisse and absolute Lefschetz targets are consumed here.

### From Mathlib and Tau Ceti

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `CategoryTheory.Triangulated.TStructure` supplies the predicates `le`, `ge`, `heart`, `bounded`, the `Heart` inclusion class, and the functors `truncLE` and `truncGE`. `TStructure.heart` is the intersection of the two degree-zero object properties. Mathlib's [t-exactness classes](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/Triangulated/TStructure/TExact.lean) `CategoryTheory.Functor.RightTExact`, `LeftTExact` and `TExact` supply preservation in every degree, with `RightTExact.mk` and `LeftTExact.mk` as degree-zero constructors; their functors carry `CommShift ℤ` and `IsTriangulated`. `Triangulated.AbelianSubcategory.abelian` supplies the admissible-subcategory criterion used to prove the heart theorem in Layer 2. `DerivedCategory.TStructure.t` and `DerivedCategory.homologyFunctor` supply the ordinary derived-category comparison. Ordinary category theory supplies adjunctions, images, kernels, full subcategories and finite biproducts.

Scheme morphisms, fibre products, ideal sheaves and locally finite algebraic cycles use the native Mathlib carriers. `AlgebraicGeometry.AlgebraicCycle` alone does not provide Chow groups or a cycle class. Likewise `Scheme.ellAdicSheaf` is an underived sheaf construction, rather than the normalized constructible category used here. Module duals, perfect bilinear pairings, kernels and ranges, determinants, characteristic polynomials and generalized eigenspaces are the linear-algebra inputs. The existing transpose/inverse characteristic-polynomial identities and dual-map determinant are used in Layer 8.

The following Tau Ceti declarations supply the exact algebraic interfaces. Module names below are relative to `TauCeti`.

| Module | Declaration and contract |
| --- | --- |
| `Algebra.Module.ZMod.Injective` | `Module.Baer.zmod_self n`, for `n ≠ 0`, supplies Baer's criterion for `ZMod n`; `Module.Baer.injective` converts it to self-injectivity. Section 0.1 extends this to arbitrary DVR quotients and finite-module evaluation over Noetherian self-injective rings. |
| `LinearAlgebra.BilinearForm.SymplecticBasis` | `LinearMap.BilinForm.IsAlt.even_finrank` supplies even rank for a finite-dimensional space over any field carrying a nondegenerate alternating form. Section 8.1 adds the self-paired primary-space multiplicities and determinant sign. |
| `LinearAlgebra.Trace.Pi` | `LinearMap.trace_pi_of_apply_eq` supplies `Tr(T) = Σ_(σ(i)=i) Tr(u_i)` for every commutative coefficient ring, finite index set `I`, finite free module `M`, arbitrary self-map `σ` of `I` and operator `T(x)_i = u_i(x_(σ(i)))`. Section 6.3 identifies the geometric cohomological operator and local terms with these linear data; no additional ring-coefficient trace theorem is required. |
| `LinearAlgebra.Determinant` | `LinearMap.det_eq_of_compl₁₂_self_eq_smul` identifies the multiplier of a nonzero alternating form with the determinant for a rank-two module with a chosen basis, assuming `IsCancelMulZero R` and `Module.IsTorsionFree R N` for its value module `N`. In particular it applies to a nonzero scalar-valued form over a field. The general-rank determinant is §8.1. |
| `LinearAlgebra.BilinearForm.Isometry` | `TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self` supplies the Gram-matrix determinant identity for an isometry over a commutative ring, with a finite basis. |
| `CategoryTheory.InvolutiveDual` | `CategoryTheory.Functor.IsInvolutiveDual` and `CategoryTheory.Functor.dualityEquivalence` turn a double-dual isomorphism satisfying the triangle identity into an anti-equivalence whose inverse is the same duality. Section 0.2 constructs the geometric dual and its evaluation. |

Roadmap section citations below specify mathematical interfaces with their coefficient and geometric hypotheses. They do not introduce Lean carriers: the suggested signatures use only declarations at the library pins.

### From EtaleCohomologyFoundations and EnhancedDerivedSheaves

Use EtaleCohomologyFoundations §§F.0–F.3 for constructible sheaves and stalks, Tate twists, derived coefficients with uniform `Tor` amplitude, cohomology with supports and localization, finite-presentation descent, finite cohomology, proper/smooth and generic base change, Artin's support-dimension estimate, compact support, projection and Künneth. Sections 0.8–0.11 supply finite flat trace, Kummer `c₁`, smooth-pair fundamental classes and the projective-bundle formula, smooth curve effacement and smooth trace in arbitrary relative dimension. The general flat trace below extends these maps and agrees with them on their domains.

Sections F.4–F.6 supply normalized `ℤ_ℓ` realization, finite `E` through lattices, reduction and rationalization, `f^!` as right adjoint to `Rf_!`, Verdier duality in the constructible finite-Tor range, smooth purity, Poincaré duality, Gysin maps with projection, composition and transverse base change, self-intersection and rational étale Gauss–Bonnet. The closed-point calculation for an excellent regular one-dimensional base is supplied there in its finite-Tor range. The self-injective extension below keeps the same normalization.

Section F.7 supplies the ordinary and compact global blow-up decomposition, including the actual exceptional columns and inverse signs, and constant-coefficient weak Lefschetz for smooth ample hyperplanes. Section F.8 supplies finite, integral `p/p⁺` and rational middle perversity, gluing, the abelian perverse heart, perverse cohomology, the image definition of open `j_!*`, and geometric affine vanishing, including the `p⁺` torsion boundary. Sections F.10.1–F.10.2b supply rational-point fixed loci and the comparison of scheme pullback with geometric cohomological Frobenius, including adic realization; §F.10.3 supplies perfect-complex trace, shift signs, cyclicity and coherent filtered additivity. These supplied definitions and their checks belong to those sections.

EnhancedDerivedSheaves §§0.1–0.4 supply the ringed-site enhancement, tensor–`Hom` and coherent derived limits. Section 0.4's `ClassicalDerived.functorCoherence` supplies the enhanced inverse-image/direct-image adjunction, exact extension by zero, adjunction mates and base-change/projection transformations; `ClassicalDerived.functorCoherence.coefficientComparison` supplies their coefficient-forgetting and coefficient-change maps. For a closed/open pair, this gives `j^* ⊣ Rj_*` and `j_! ⊣ j^*`; EtaleCohomologyFoundations §0.7's `ClassicalAlgebraic.supportLocalization` constructs `i^!` and both localization triangles for arbitrary coefficient rings. These ambient recollement data do not require self-injectivity. Section 0.2 proves bounded constructible preservation for noetherian coefficients; §2.2 records the resulting recollement.

The unbounded scheme support functor used in §0.5 is EtaleCohomologyFoundations §0.8's `ClassicalAlgebraic.properSupports`, with the exceptional adjoint of §F.5. For separated finite-type field schemes and torsion `Λ`, its compactification `f=p∘j` satisfies the enhancement hypotheses: `j_!` is exact, proper geometric fibres have uniformly bounded torsion cohomology, and `Rp_*` commutes with direct sums. Proper base change and the projection formula give the exchange and projection equivalences. These supply finite cohomological amplitude and colimit preservation for the unbounded lift (Stacks Tags 0G2A, 0G29, 0F0C and 0GL5); §0.4 of EnhancedDerivedSheaves alone is not an unconditional proper-support theorem. The analytic and diamond applications retain the domains of their named geometric suppliers below. EnhancedDerivedSheaves §E4.5 supplies coefficient-system reconstruction and derived completeness. Limits of normalized systems below are taken in this enhancement; inverse limits of triangulated categories alone are insufficient.

### From geometric roadmaps

SchemeAndStackFoundations §0.7 supplies the dimension function and its specialization properties; §0.9 supplies approximation of finite geometric diagrams. EtaleCohomologyFoundations §§G.1–G.3 supply Nagata compactifications and common refinements. Mathlib `exists_finite_inj_algHom_of_fg` (RingTheory/NoetherNormalization.lean) supplies affine Noether normalization, with SchemeAndStackFoundations §0.7 for dimension bounds; §0.20 of that roadmap supplies finiteness of normalization; its §§2.1–2.17 supply the étale site, Kummer and sheaf/Galois cohomology, topological invariance and pro-étale foundations; §§4.11, 5.4–5.6 supply blow-ups, projective and flag geometry, normal bundles, normal cones, deformation and Chow intersection operations (`Chow.gysin` in §5.5; `Chow.intersect`, `proper_intersection` and `Chow.graphPullback` in §5.6). Section 1.3 constructs the Euler–Tor comparison with this intersection product. AlgebraicVectorBundles L0A–L0C supplies finite locally free sheaves, rank, tensor, sums, duals and determinants. JacobianChallenge Layers `A, D` and `F` supply divisor degree, the Jacobian with principal polarization and Abel–Jacobi. AbelianSchemesAndArithmeticModuli §A3 supplies the perfect alternating Weil pairing on torsion of a principally polarized abelian variety. The curve cup/Weil-pairing identification is the curve input of EtaleCohomologyFoundations §0.11, not an application of the higher-dimensional duality proved from it.

LefschetzPencilsAndVanishingCycles §§0.5–0.8 supply nearby cycles with a chosen geometric generic point, the vanishing triangle and their stated quasi-finite exchange maps; the all-finite-type and normalized-adic specialization extension is constructed in §6.4; §§3.3–3.5 supply pencil-axis geometry, Veronese re-embedding and smooth pencils; §7b.7 supplies generic restriction in its stated range. ReductiveGroups Layer 4 supplies diagonalizable groups, characters and semisimple elements. Section 7.4 constructs the diagonalizable reduced cyclic closure in `semisimpleCyclicClosure_diagonalizable`. Exact projection to character spaces is used only on finite-dimensional rational representations in the finite-jet argument of §7.4.

The following small geometric interfaces are required in addition to those headings. For a smooth centre, identify the exceptional divisor and its normal line with the conventions above. For a relatively ample line on a universally closed scheme, the complement of a section divisor is affine (Stacks Lemma 29.44.18, Tag 0EKE). Generic affine hyperplanes are smooth for a smooth source with unramified map, as in Katz, *Affine cohomological transforms*, Lemma 3.5, p.182. For fixed multidegree, the open locus of smooth complete intersections in the product of defining-form projective spaces has geometrically irreducible nonempty characteristic fibres and contains a member with a smooth ample chain. Section 4.3 proves the cohomology calculation first for that member and transports it to every smooth complete intersection by proper smooth base change; it does not require a smooth chain for each prescribed presentation. Their tangent–normal exact sequence gives `c(T_X)=(1+h)^{N+1}∏(1+d_i h)⁻¹` and `deg h^m=∏d_i`. The elementary geometric identifications and the two incidence/affineness lemmas are proved in the relevant Layer 4 subsections from the cited scheme geometry; their conclusions are not inferred from weak Lefschetz.

GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace` supplies the shared
trace class, integrated local terms and proper trace formula for smooth proper curves over an algebraically
closed field, with bounded constructible finite-Tor coefficients, including normalized adic realization.
Its R17.6.3b / `contracting-curve-local-term` supplies contraction to a reduced closed point and the
transpose/dual-stalk compatibility. Sections 6.3–6.5 use these interfaces on their stated domains; the targets
here extend them to general schemes and identify their specializations. Write `Tr^curve` and `LT^curve` for
the supplied maps. [TCR-GL2AutomorphicRepresentationsAndTransfer]; [Varshavsky-LV-2007] §1.2.2,
Proposition 1.2.5, Corollary 1.2.6 and Theorem 2.1.3, pp.8–10,17–18.

### From weight theory

DeligneWeightsAndPurity §§0.1–0.19 supply scalar Weil numbers and fixed-`ι` weights, the arithmetic of weights, spectral powers, tensor/dual/exterior spectra, characteristic power series, weight decomposition of Frobenius modules and perfect-pairing eigenvalue reciprocity. Sections 1.3–1.7 supply Rosati and the abelian-variety/curve estimates. Sections 5.1–5.18 supply Weil groups and Weil sheaves, punctual and determinantal weights, rank-one normalization, curve and local-monodromy bounds, monodromy specialization, the positive pole-order argument and compact Weil form. Sections 6.1–6.4 supply coefficient-specific vanishing cycles, real cohomological factors, square improvement and parabolic curve purity. Sections 7.5–7.9 supply the curve reduction, tame covers and Weil II direct-image theorem. Sections 8.1–8.5, 8.8–8.9, 8.11–8.12 supply mixed/pure complexes and six-operation bounds; §§8.14, 8.18–8.20 supply lisse geometric semisimplicity, the lisse weight filtration and potentially pure models. Sections 9.6–9.12 supply absolute hard Lefschetz, vector-space primitive decomposition and rational ample restriction/vanishing orthogonality. These inputs are used with geometric Frobenius and a fixed embedding `ι:ℚ̄_ℓ→ℂ` when `ι`-weights are used.

| Supplier target | Contract used here |
| --- | --- |
| AutomorphicLFunctionsAndLocalFactors AL.3, `normalized-scheme-ic-purity` [TCR-AutomorphicLFunctionsAndLocalFactors] | For `ℓ∤q`, a separated finite-type pure `d`-dimensional scheme over `𝔽_q`, a dense smooth open `j:U→X` and a lisse `ℚ̄_ℓ`-sheaf `L` punctually pure of integer weight `w`, the normalized complex `IC⁰_X(L)=(j_!*(L[d]))[−d]` is pure of weight `w`, independently of shrinking `U`. For proper `X`, `H^r(X̄,IC⁰_X(L))` is pure of weight `w+r`. Section 5.3 transports this supplied theorem through `IC_X(L)≅IC⁰_X(L)[d]`; `intersectionComplexPurity` names that perverse-normalization adapter. |

### From comparison roadmaps

ComplexComparisonPartII §§C−1.1, C5.4, C6.0–C6.6 supplies algebraically constructible analytic coefficient categories, finite Artin comparison, ordinary and compact integral/rational realization, proper `Rf*` and separated finite-Tor `Rf!` comparison, and the integral exponential/Kummer first-Chern comparison. The additional nonproper constructible `Rf*` exchange, perverse equivalence and rational stable-lattice essential image are §3.5 below. AlgebraicTopology Stage 6 supplies relative cochains, local orientations and products. CharacteristicClasses C2.1–C2.4 [TCR-CharacteristicClasses] owns the ordinary topological Thom class `U_E`, its orientation and product normalization, and embedding Gysin with supports, composition and projection formula. Section 3.6 identifies the ordinary realizations of its supported sheaf Thom/Gysin maps with those supplied maps, and constructs complete coefficient systems and torsion-sensitive noncompact constructible duality from relative cochains, localization and local orientation calculations.

ClassicalAdicEtaleCohomology §§9.3–9.6, 8.2 and 11.1 supplies the chart-independent analytic smooth trace, analytic `c₁` and Huber proper and nonproper algebraic-model cohomology comparisons. AdicSpacesPartII §R1 supplies scheme-fibre-product analytification. The full smooth-duality comparison in §3.8 uses Huber's prime-to-**residue**-characteristic range, a quasi-separated target and tautness for proper supports. Extending it to normalized integral analytic systems additionally requires an analytic constructible derived-complete realization with common strata and uniform bounds; that extension is not asserted by the finite theorem.

AdicCoefficientsAndComparisons §§L0–L3 supplies the ambient completed coefficient categories, the characteristic-`p` scheme/diamond functor `c*`, its full faithfulness, monoidality and pullback, `Rf!` comparison and right-adjoint recovery of `f!` and internal `Hom`. Sections L4 and L6 supply the complete-DVR proper-support and constructible direct-image/full-faithfulness comparisons in their finite prime-to-residue-characteristic range. These give the mate and recovery equations in §3.9. Strong `c*f!` comparison additionally requires the specified essential-image/counit condition; ambient full faithfulness alone does not imply it.

## How to read the build

Layer 0 extends finite-level duality and traces, and Layer 1 builds the higher cycle theory. Layer 2 supplies abstract hearts and the detailed perverse calculus. Layer 3 treats normalized ramified coefficients and comparison maps before Layer 4 applies them to stronger Lefschetz and blow-up statements. Layer 5 adds perverse weights and decomposition, using the imported Weil II theory. Layers 6 and 7 construct trace classes and identify local terms by contraction or normal cones. Layer 8 isolates the linear algebra exported to functional equations. In each subsection, the named API records the intended interface, and the Checks distinguish the definition from plausible incorrect alternatives. `Suggested.lean` records only signatures expressible using the pinned carriers; the geometric and enhanced constructions remain targets of this README.

`Suggested.lean` states the theorems on coefficient duality, abelian hearts, finite-length splitting, signs of similitudes and graded Frobenius reciprocity expressible using the pinned carriers.

## Layer 0: self-injective coefficient duality and flat traces

### 0.1 Self-injective finite coefficient rings

**Self-injectivity for DVR quotients and finite-module evaluation.** Let `O` be a discrete valuation ring with
uniformizer `π` (for example `ℤ_ℓ` or the ring of integers `O_E` of a finite extension `E/ℚ_ℓ`) and `n ≥ 1`. Then `Λ = O/πⁿ` is injective as a module over itself. Consequently `Hom_Λ(−, Λ)` is exact on `Λ`-modules, `Ext^q_Λ(M, Λ) = 0`
for `q > 0`, and `M → Hom(Hom(M, Λ), Λ)` is an isomorphism for finitely generated `M`. For `Λ = ℤ/ℓ²` the module `ℤ/ℓ`
is not projective, so finite-level duality is a statement about the self-injective ring, not about a field.
More generally, for any Noetherian commutative self-injective ring `R` and finitely generated `R`-module `M`,
evaluation `M→M∨∨` is an isomorphism. The DVR-quotient assertion includes ramified and equal-characteristic
coefficient rings.

Work with the following additional hypotheses. `O` a discrete valuation ring; `n ≥ 1`.

Name the resulting statement `selfInjectiveCoefficients`. In `Suggested.lean`, `uniformizerQuotient_selfInjective` states self-injectivity for arbitrary DVR quotients and `finiteModule_eval_bijective` states the general evaluation theorem.

A proof proceeds as follows.

Baer's criterion (Mathlib Module.Baer): the ideals of `O/πⁿ` are `πᵏO/πⁿ`; a map `πᵏO/πⁿ → O/πⁿ` sends `πᵏ` to an
element killed by `π^{n−k}`, which lies in `π^kO/πⁿ`, so it extends to multiplication by an element.

Decompose a finitely generated module into cyclic modules `O/πᵏ`, with `1≤k≤n`. Its `Λ`-dual is `π^{n−k}Λ≅O/πᵏ`, and
evaluation is an isomorphism on each summand. This includes equal-characteristic DVRs.

For the general evaluation statement, choose a finite presentation `R^a→R^b→M→0`. Self-injectivity makes
`Hom_R(−,R)` exact; applying it twice preserves that presentation and the finite-free evaluations are
isomorphisms. The induced map on cokernels is the evaluation of `M`, so it is an isomorphism. Noetherianity
ensures that finitely generated `M` admits such a presentation.

Use [SGA4-XVIII] 3.2.6, p. 586.

*Needs:* `Module.Injective`; `Module.Baer.injective`; `ZMod`.

**Checks.**


- `Hom_{ℤ/ℓ²}(ℤ/ℓ, ℤ/ℓ²) ≅ ℤ/ℓ`, generated by `1 ↦ ℓ`. In particular, `ℤ/2` is nonprojective over `ℤ/4`, and its dual has the nonzero generator `1↦2`.

- For `O=k[[π]]` and `n=1`, duality is ordinary finite-dimensional `k`-duality; for `n=2, Λ/(π)` is nonprojective but its double dual is itself.

- The zero module has zero dual. The exponent `n=0` is excluded: the quotient would be the zero ring.

### 0.2 Duality beyond finite Tor dimension

Extend constructible finite-Tor duality to all bounded constructible complexes over self-injective finite coefficients.

**Product duality and the Künneth evaluation map.** For separated finite-type `X,Y` over a separably closed field and the constructible finite-Tor coefficient range, prove `productDualityKunneth`: `K_X⊠K_Y≅K_(X×Y), D_XF⊠G≅RHom(pr₁*F,pr₂!G)`, and consequently `D_(X×Y)(F⊠G)≅D_XF⊠D_YG`. All tensor products are derived. The middle formula, rather than an assertion that every constructible sheaf is dualizable for tensor, is the input to trace classes in §6.3. The corresponding ramified integral/rational formulas are obtained after the realization and coefficient-extension results of Layer 3.

Give these isomorphisms their naturality, pullback/exceptional-pullback coherence, and evaluation compatibility: under the product formula, the diagonal restriction of `D_XF⊠F` maps to `K_X` by the usual evaluation. Use constructible finite-Tor dévissage, the imported compact-support Künneth formula and exceptional adjunction; on smooth strata the statement reduces to finite projective coefficient complexes and the trace-normalized smooth dualizing complex. Localization glues the strata, and adjunction identifies the glued morphism with the Künneth map. This proves the product factorization, which does not follow merely by writing down the right adjoint `f!`. (Varshavsky, *Lefschetz–Verdier trace formula*, §§0.3–0.4, pp.5–6, and §1.2.2(a), pp.8–9, arXiv v2; SGA 4 XVIII, §3.2.6, p.586.) *Needs:* EtaleCohomologyFoundations §§F.2, F.5–F.6 and the duality normalization of this subsection.

**Checks.**

- At two geometric points the middle map is the usual perfect-complex identity `F∨⊗G≅RHom(F,G)`, including the Koszul sign on shifted complexes.
- For `F=Λ_X` and smooth `Y` of dimension `e`, the product dualizing map has twist `e` and shift `2e` in the `Y` factor; on two smooth factors their dimensions add.
- With `Λ=ℤ/4`, the sheaf `ℤ/2` is constructible but its derived tensor square is unbounded. It is excluded from the finite-Tor assertion even though its `Λ`-linear double dual is correct.


**The étale dualizing base in dimension zero or one.** Let `S` be a field spectrum or an excellent regular
noetherian scheme of pure dimension one, with `n` invertible, and `Λ` a noetherian commutative self-injective ring
killed by `n`. The constant `Λ_S` is an étale dualizing object: `RHom(−,Λ_S)` preserves bounded constructible
complexes and its evaluation is an isomorphism. For a closed point `i` in a regular curve/trait,
`i^!Λ_S≅Λ(−1)[−2]`. These are étale `Λ`-module statements, independent of coherent `O`-module duality. For `X→S` set
`K_X=a^!Λ_S`; this target fixes the base used by constructible biduality. For an arbitrary noetherian
commutative ring killed by `n`, the corresponding preservation and evaluation statements hold on `D_ctf(S,Λ)`, as
in SGA 4½ [Th. finitude] 4.1.

Work with the following additional hypotheses. For dimension one, use the constant base dualizing object with
no global twist/shift; it differs from the geometric dualizing complex of a smooth curve over a field. `n`
invertible on `S`; no absolute-purity theorem in higher dimension is imported.

Name the resulting statement `oneDimensionalDualizingBase`.

A proof proceeds as follows.

A geometric field point reduces to finite-module duality over `Λ`. Self-injectivity makes `Hom(−,Λ)` exact and the
finite double-dual isomorphism follows from the finite-presentation argument of §0.1. Étale stalk
conservativity descends the calculation to a field.

At a strict henselian trait, the Kummer valuation sequence and local tame cohomology give `i^!Λ=Λ(−1)[−2]`. Wild
inertia has prime-to-`n` finite quotients and exact invariants; the remaining tame group has `n`-primary
cohomological dimension one, with `H¹(M)=M_I(−1)`. Invariants and coinvariants are exchanged by `Λ`-duality. These
explicit local calculations are required from the finite-coefficient EtaleCohomologyFoundations §§F.0–F.6
import, not from coherent duality.

For `j:U↪S` dense open and a finite lisse `F` on `U`, the same calculation gives `RHom(j_*F,Λ_S)=j_*(F^∨)`, with
higher sheaf `Ext` zero; `j_*` here is underived. The point-supported case follows from the closed-point
calculation and finite-module double duality. No reverse derived exchange `D Rj_*` is used.

For a constructible sheaf `F`, choose a dense open `j` on which it is finite lisse. The canonical map `F→j_*j^*F`
has kernel and cokernel supported on finitely many closed points; triangles and bounded cohomological
dévissage give the base evaluation isomorphism. These are the proof of SGA 4½ [Dualité] 1.3–1.4, pp. 156–157;
the same finite-module calculation applies to self-injective artinian `Λ`.

For the `D_ctf` variant, use bounded finite projective coefficient complexes on each stratum, whose dual and
double dual are finite projective without any self-injectivity assumption. The same explicit trait calculation
and closed-point dévissage prove [Th. finitude] 4.1, p. 250. This is the base input for the
arbitrary-noetherian-coefficient `D_ctf` statement at constructible-biduality.

Use [SGA4half] [Dualité] 1.1–1.4, pp. 155–157; [SGA4half] [Th. finitude] 4.1, p. 250.

*Needs:* §0.1; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations
§§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site
contract above; `IsRegularLocalRing`.

**Checks.**


- On `Spec Ω` it is finite-module double duality, including `Λ=ℤ/ℓ²` and `M=ℤ/ℓ`.

- At a closed point of a regular trait the shift is `−2` and twist `−1`, with the Kummer valuation fixing the generator.

**Verdier biduality on constructible complexes.** Let `X` be separated of finite type over a field `k` (or over a
excellent regular noetherian base of dimension `≤ 1` such as `ℤ[1/ℓ]`), `n` invertible, and `Λ = O/πⁿ` (more generally
a noetherian self-injective ring killed by `n`). Then `D_X` preserves `D^b_c(X, Λ)` and `D_ctf(X, Λ)`, and for `K ∈ D^b_c(X, Λ)` the evaluation `ev_K : K → D_X D_X K` is an isomorphism. Hence `D_X : D^b_c(X, Λ)^op → D^b_c(X, Λ)` is
an anti-equivalence with `D_X² ≅ id`. For any noetherian coefficient ring killed by `n`, including non-Gorenstein
finite rings, biduality and preservation hold on `D_ctf`; extension to all `D^b_c` is asserted here only for
self-injective `Λ`.

Work with the following additional hypotheses. `X` separated of finite type over a field or an excellent regular
noetherian base of dimension `≤1`; `n` invertible. `Λ` noetherian, commutative, self-injective and killed by `n`;
finite rings not self-injective are restricted to constructible finite-Tor complexes. The base dualizing
object is `Λ_S` from one-dimensional-dualizing-base; `K_X=a^!Λ_S`. Imported finiteness is the étale finiteness
theorem, not coherent sheaf biduality.

Name the resulting statement `constructibleBiduality`.

A proof proceeds as follows.

First establish constructibility of `D_XK` by finite stratification and the finite-module duality calculation on
smooth strata. The formal identity `D_X j_!=Rj_*D_U` and étale finiteness suffice; no identity `D_X Rj_*=j_!D_U`
is needed. Purely inseparable extension reduces field strata to the perfect case without changing the étale
site. Over a regular one-dimensional base use its dualizing calculation and generic/special-fibre
stratification.

For a proper `a:X→S`, formal adjunction gives `D_S Ra_*≅Ra_*D_X` before biduality. Check the evaluation square
commutes (SGA 4½ [Th. finitude] Lemma 4.4, p. 250): under this identity `Ra_*(ev_K)` is `ev_{Ra_*K}`. Base
biduality therefore gives `Ra_*Cone(ev_K)=0`.

Use induction on the dimension of the support, with étale localization and a compactification, as in [Th.
finitude] 4.3–4.5. Induction applied to fibres of local affine projections shows the cohomology sheaves of the
evaluation cone have finite support on closed geometric points. For the trait case first remove the generic
fibre using the field case; the same induction leaves finitely many closed points in the special fibre. This
is precisely the finite-support conclusion of that proof, rather than a general assertion that proper
pushforward is conservative.

A finite-support constructible complex is pushed forward exactly along its finite support; its geometric
stalks are finite direct sums of the support stalks. Thus `Ra_*Cone(ev_K)=0` forces each support stalk, and
hence the cone, to vanish. This proves biduality without invoking the reverse exchange which will be deduced
from it in the duality-exchange statement below.

Initially use constructible finite-Tor complexes as in Theorem 4.3. Self-injective noetherian `Λ` has finite
injective dimension zero, so the same bounded dévissage extends to `D^b_c` (4.7 explicitly treats `ℤ/m`); the
finite-module lemma handles `O/π^m` as well. The duality preserves `D_ctf` by perfect local calculation.

Use [SGA4half] [Th. finitude] Theorem 4.3, Lemma 4.4 and §§4.5–4.7, pp. 250–251; [SGA4half] [Dualité] 1.1–1.4,
pp. 155–157; [SGA4-XVIII] 3.2.6, p. 586; [Angeniol-1976] §3, Théorème 3.2 and proof, pp. 161–162.

*Needs:* EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§F.0–F.1,
0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract
above.

**Checks.**


- `X = Spec Ω` (`Ω` separably closed): biduality is `M ≅ Hom(Hom(M, Λ), Λ)` on perfect complexes over `Λ = ℤ/ℓⁿ`.

- `X` a smooth curve, `K = j_*L` for `j : U → X` dense open and `L` locally constant: `D_X(j_*L) ≅ j_*(L^∨)(1)[2]` (used for Weil `I` 2.12).

**The dualizing complex of a smooth scheme and the dual of a local system.** For `X` smooth of pure dimension `d`,
use the supplied trace normalization `K_X≅Λ(d)[2d]`. Extend its local-system dual formula from finite locally
free sheaves to every finite locally constant `Λ`-sheaf `L` when `Λ` is Noetherian and self-injective, including
nonprojective `O/π^m`-modules: `RHom(L,Λ)` is the underived `L∨` in degree zero, `D_XL≅L∨(d)[2d]`, and the evaluation
is an isomorphism. The closed smooth-pair compatibility is the restriction of this additional coefficient
range to the supplied purity identification.

Work with the following additional hypotheses. `X` smooth of pure dimension `d` over a field `k`; `Λ` killed by `n`
invertible. Noetherian self-injectivity of `Λ` is used for `L^∨` to be the derived dual; over `ℤ_ℓ` the derived dual
has `Ext` terms (§0.6).

Name the resulting statement `dualizingComplexOfSmoothScheme`.

A proof proceeds as follows.

`K_X = a^!Λ ≅ a^*Λ(d)[2d] = Λ(d)[2d]` by EtaleCohomologyFoundations §§0.11, F.6.

For `L` locally constant constructible, `ℰxt^q(L, Λ)` is computed étale-locally where `L` is constant with finite
stalk `M`, and `Ext^q_Λ(M, Λ) = 0` for `q > 0` because `Λ` is self-injective (§0.1); so `RHom(L, Λ(d)[2d]) = L^∨(d)[2d]`, and biduality reduces to `M ≅ Hom(Hom(M, Λ), Λ)` by the finite-presentation argument of §0.1.

Closed pair: `i^!K_X ≅ K_Z` by composition, then cancel twists (EtaleCohomologyFoundations §§0.10, F.6 gives the
canonical form).

Use [SGA4-XVIII] 3.2.6, p. 586; [SGA4-XVIII] Théorème 3.2.5, p. 585.

*Needs:* EtaleCohomologyFoundations §§0.11, F.6; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4;
§0.1.

**Checks.**


- `X` a smooth curve over an algebraically closed field: `K_X ≅ Λ(1)[2]`.

**Duality exchanges `f_*` with `f_!` and `f^*` with `f^!`.** Under the hypotheses of §0.2, for `f : X → S` a morphism of
schemes separated of finite type over `k` and constructible complexes: `D_S ∘ Rf_* ≅ Rf_! ∘ D_X` on `D^b_c(X, Λ)`
and `D_X ∘ f^! ≅ f^* ∘ D_S` on `D^b_c(S, Λ)`; in particular, for `i : Z → X` closed and `j : U → X` open, `D_Z i^* ≅ i^! D_X, D_X i_* ≅ i_* D_Z, D_U j^* ≅ j^* D_X` and `D_X Rj_* ≅ j_! D_U`. Moreover `D_X(K ⊗^L L) ≅ RHom(K, D_X L)`
for `K, L ∈ D^b_c`, and `f^!` preserves `D^b_c`.

Work with the following additional hypotheses. As in constructible-biduality; constructibility of `Rf_*` and `f^!`
is part of the conclusion (`f^!` via `f^! = D f^* D`).

Name the resulting statement `dualityExchangeIsomorphisms`.

A proof proceeds as follows.

Apply `D` to the formal exchanges `D_S Rf_! ≅ Rf_* D_X` and `D_X f^* ≅ f^! D_S` (EtaleCohomologyFoundations §F.5;
EnhancedDerivedSheaves §0.4) and use biduality on both sides; constructibility of `f^!K` follows from `f^!K ≅ D_X f^* D_S K`.

Use [SGA4-XVIII] 3.1.10 and 3.2.6, p. 573 and 586.

*Needs:* EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4.

**Checks.**


- For `i` the inclusion of a closed point of a smooth curve `C` over an algebraically closed field: `i^!Λ ≅ D(i^*D_C Λ) = D(Λ(1)[2]) = Λ(−1)[−2]`.

**Open-closed recollement on constructible complexes.** Let `X` be separated of finite type over a field `k`,
`i : Z → X` closed with open complement `j : U → X`, and `Λ` a noetherian commutative ring killed by `n ≥ 1`
invertible in `k`. On `D^b_c` the six functors `i^*, i_* = i_!, i^!, j_!, j^* = j^!, Rj_*` satisfy: `i^* ⊣ i_* ⊣ i^!` and
`j_! ⊣ j^* ⊣ Rj_*`; `i_*, j_!` and `Rj_*` are fully faithful; `j^*i_* = 0, i^*j_! = 0` and `i^!Rj_* = 0`; and there are
distinguished triangles `j_!j^*K → K → i_*i^*K →` and `i_*i^!K → K → Rj_*j^*K →`, natural in `K`. When `Λ` is
self-injective, duality exchanges the two triangles. These are the recollement data (BBD 1.4.3) that Layer 2 uses to glue the perverse
`t`-structure.

Work with the following additional hypotheses. `X` separated of finite type over `k`; `n ≥ 1` invertible in `k`;
`Λ` noetherian, commutative and killed by `n`. Self-injectivity is required only for the duality assertion.

Name the resulting statement `recollementAdjunctions`.

A proof proceeds as follows.

On the ambient unbounded categories, EnhancedDerivedSheaves §0.4's `ClassicalDerived.functorCoherence`
gives `j^* ⊣ Rj_*` and enhances the exact adjunction `j_! ⊣ j^*`.
EtaleCohomologyFoundations §0.7's `ClassicalAlgebraic.supportLocalization` constructs `i^!` as the supported
fibre in `i_*i^!K → K → Rj_*j^*K` and gives `i_* ⊣ i^!` and the other localization triangle.
For bounded constructible preservation, finite-coefficient finiteness is EtaleCohomologyFoundations §F.3's
`VanishingCycles.etaleFiniteness`. Extend it here to these noetherian coefficients: on a finite normal
stratification the finite monodromy groups give resolutions by finite free modules over their group rings.
Combine finite-cover coefficient change with the finite-coefficient finiteness theorem, and truncate the
resolutions using the uniform cohomological bound for `Rj_*`. Noetherianity keeps the resulting kernels and
cokernels finitely generated. Stratification and localization give bounded constructibility of `Rj_*K`;
the supported triangle then gives it for `i^!K`. This restriction uses neither Verdier biduality nor an
unbounded proper-support extension.

The vanishing statements are checked on stalks `(j^*i_*)` or by adjunction (`i^!Rj_* =` right adjoint of `j^*i_* = 0`).

Use [SGA4-XVIII] Proposition 3.1.8, p. 571; [SGA4half] [Th. finitude] §§1–2 for finite-coefficient finiteness,
with the noetherian-coefficient dévissage above.

*Needs:* EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§F.0–F.1,
0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract
above.

**Checks.**


- `X = A¹, Z = {0}`: for `K = Λ` the second triangle has `i^!Λ = Λ(−1)[−2]` and `Rj_*Λ` with stalk at 0 equal to `Λ ⊕ Λ(−1)[−1]`: both triangles and all shifts are verified (the closed-point acceptance test of §0.2).

- For `Z = ∅` the support functor `i^!` is zero and `j^*` is the identity; for `Z = X` these roles are reversed.

- Over an algebraically closed field with `ℓ` invertible, take `Λ = 𝔽_ℓ[ε,η]/(ε,η)²` and `j:𝔾_m→𝔸¹`. This ring is not self-injective (its socle has dimension two), but the recollement still exists: `i^!Λ_𝔸¹ = Λ(−1)[−2]`, and `(Rj_*Λ_𝔾_m)_0` has cohomology `Λ` in degree zero and `Λ(−1)` in degree one.

### 0.3 Quasi-finite flat and flat curve traces

Extend the finite flat trace to quasi-finite flat maps and the smooth curve trace to flat curves with component multiplicities.

**The trace for quasi-finite flat morphisms.** For `f : X → S` separated, flat, of finite presentation and
quasi-finite, and `F` an abelian sheaf on `S`, there is a unique trace morphism `Tr_f : f_!f^*F → F` such that (Var
`1`) `Tr_f` is natural in `F`; (Var 2) it is compatible with every base change `S′ → S`; (Var 3) for `f = gh` with `g, h`
of the same kind, `Tr_f = Tr_g ∘ g_!(Tr_h)g^*`; (Var 4) if `f` is finite locally free of constant `rank r`, the
composite `F → f_*f^*F = f_!f^*F → F` is multiplication by `r`. On geometric stalks over `s̄, (f_!f^*F)_s̄ = ⊕_{x̄ ↦ s̄} F_s̄` and `Tr_f` is `(a_x̄) ↦ Σ m_x̄ a_x̄`, where `m_x̄` is the length of the local ring of the fibre `X_s̄` at
`x̄`. For `f` étale, `Tr_f` is the counit of the adjunction `f_! ⊣ f^*`. With `F` replaced by `K ∈ D(S, Λ)`, it gives
`Rf_!f^*K = f_!f^*K → K`.

Work with the following additional hypotheses. `f` separated, flat, of finite presentation, quasi-finite
(relative dimension zero); `S` arbitrary. `F` any abelian sheaf (no torsion hypothesis is needed in relative
dimension zero).

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.finiteFlatTrace`: `Tr_f : f_!f^*F ⟶ F` for `f` separated flat of finite presentation and quasi-finite.

- `TauCeti.EtaleDuality.finiteFlatTrace_natural`: `Tr_f` is natural in `F`.

- `TauCeti.EtaleDuality.finiteFlatTrace_baseChange`: `g^*(Tr_f)` corresponds to `Tr_{f′}` under the base-change isomorphism `g^*f_! ≅ f′_!g′^*`.

- `TauCeti.EtaleDuality.finiteFlatTrace_comp`: `Tr_{gh} = Tr_g ∘ g_!(Tr_h)`.

- `TauCeti.EtaleDuality.finiteFlatTrace_unit`: For `f` finite locally free of constant `rank r, Tr_f ∘` (unit of `f^* ⊣ f_*`) `= r · id`.

- `TauCeti.EtaleDuality.finiteFlatTrace_etale`: For `f` étale, `Tr_f` is the counit of `f_! ⊣ f^*`.

- `TauCeti.EtaleDuality.finiteFlatTrace_stalk`: On the stalk at `s̄, Tr_f` is `(a_x̄) ↦ Σ_x̄ m_x̄ a_x̄` with `m_x̄` the multiplicity of the fibre at `x̄`.

A proof proceeds as follows.

Reduce étale-locally to the finite flat pieces of SGA 4 XVII 6.2.1–6.2.2. Define the trace on a geometric
fibre as the sum of coefficient stalks weighted by the lengths of its local rings; the weighted morphism
construction in 6.2.3–6.2.5 glues these maps and proves base change and composition. Algebra.trace on regular
functions is a different map and is not an input.

Étale case: SGA 4 XVII 6.2.11 identifies `f_!` with the left adjoint of `f^*` and `Tr_f` with the counit.

Use [SGA4-XVII] Théorème 6.2.3, p. 422-423; [SGA4-XVII] Théorème 6.2.3 (Var 4), p. 423; [SGA4-XVII]
Proposition 6.2.11, p. 430.

*Needs:* EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3;
EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4; `AlgebraicGeometry.Flat`;
`AlgebraicGeometry.LocallyQuasiFinite`; `AlgebraicGeometry.IsFinite`; `AlgebraicGeometry.Scheme.Hom.finrank`;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above;
`AlgebraicGeometry.LocallyOfFinitePresentation`.

**Checks.**


- `TauCeti.EtaleDuality.finiteFlatTrace_separable`: For `Spec L → Spec K` with `L/K` finite separable of degree `r, Tr ∘` unit `= r` on every sheaf.

- `TauCeti.EtaleDuality.finiteFlatTrace_square_map`: For `f : A¹ → A¹, x ↦ x²`, over an algebraically closed field of characteristic `≠ 2`, the stalk of `Tr_f` at 0 is multiplication by 2 on `F_0`.

- `TauCeti.EtaleDuality.finiteFlatTrace_id`: For `f = id, Tr_f` is the identity.

- `TauCeti.EtaleDuality.not_finiteFlatTrace_counit_ramified`: In the category of étale `𝔽₂`-module sheaves, take `f:𝔸¹_ℂ→𝔸¹_ℂ`, `t↦t²`, and `F=i_*𝔽₂` for the origin inclusion `i`. Then `f_!f^*F≅F` and `Tr_F=2·id_F=0`. Since `f^*F≠0`, no unit can satisfy `f^*(Tr_F)∘η_(f^*F)=id_(f^*F)`. Thus this trace cannot be a counit of `f_!⊣f^*`; the étale assertion above identifies the canonical counit in its stated range.

- Over `k=𝔽̄₂` with `Λ=𝔽₃`, the square map is a universal homeomorphism. Topological invariance (Stacks Tag 03SI) makes `f_!=f_*` inverse to `f^*`. Its weighted trace is `2ε₀`, where `ε₀` is the equivalence counit (Stacks Tag 0GKI); together with `2⁻¹η₀` it satisfies both triangles. Ramification alone does not exclude a counit in a coefficient category.

- `Spec L → Spec K` for a finite separable extension of degree `r: Tr ∘` unit `= r`.

- `x ↦ x²` on `A¹` over an algebraically closed field of characteristic `≠ 2`: at the origin the stalk of `f_!f^*F` is `F_0` and `Tr` is multiplication by 2.

**The trace morphism for curves.** (a) Let `X` be a curve (separated, finite type, pure dimension one) over an
algebraically closed field `k` of exponent characteristic `p, n` prime to `p`, with irreducible components `c` and
multiplicities `n_i = length O_{X,η_i}`. Then `H²_c(X, ℤ/n(1)) ≅ H²(X̄_red, ℤ/n(1)) ≅ Pic(X̄_red)/n ≅ (ℤ/n)^c` (`X̄`
a completion of `X_red, c₁` and degree), and `Tr_X : H²_c(X, ℤ/n(1)) → ℤ/n` is `(a_i) ↦ Σ n_i a_i`; it extends to
`Tr_X : H²_c(X, F(1)) → F` for every torsion abelian group `F` prime to p. (b) For a flat compactifiable curve `f : X → S` (flat, finite presentation, separated, fibres of pure dimension one) and a torsion sheaf `F` on `S` prime to
the residue characteristics, there is a unique `Tr_f : R²f_!(f^*F(1)) → F`, natural in `F`, compatible with every
base change, and equal to (a) on geometric fibres. It satisfies: additivity over components (1.1.4);
compatibility with quasi-finite flat traces on either side (1.1.7, 1.1.8); and `Tr_f` is an isomorphism when `f`
is smooth with geometrically irreducible fibres (1.1.9).

Work with the following additional hypotheses. `k` algebraically closed for (a); in (b) `S` arbitrary
(quasi-compact quasi-separated for compactifiability) and `F` torsion prime to residue characteristics. Uses the
cohomology of curves over algebraically closed fields (`H² = Pic/n`, vanishing above 2), imported through
SchemeAndStackFoundations EtaleCohomologyFoundations §§F.0–F.6, and the degree of line bundles from
JacobianChallenge Layer `A`.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.curveTrace`: `Tr_f : R²f_!(f^*F(1)) ⟶ F` for a flat compactifiable curve `f : X → S` and torsion `F` prime to the residue characteristics.

- `TauCeti.EtaleDuality.curveTrace_baseChange`: `Tr_f` is compatible with every base change `S′ → S`.

- `TauCeti.EtaleDuality.curveTrace_components`: For nonempty opens `U_i` of the irreducible components, the sum of the `Tr_{U_i}` factors through `Tr_X` (SGA 4 XVIII 1.1.4).

- `TauCeti.EtaleDuality.curveTrace_quasiFiniteFlat`: For `u : X → Y` quasi-finite flat over a curve `Y, Tr_{fu} = Tr_f ∘ R²f_!(Tr_u)` (1.1.7), and the dual compatibility for a quasi-finite flat base (1.1.8).

- `TauCeti.EtaleDuality.curveTrace_isIso`: If `f` is smooth with geometrically irreducible fibres, `Tr_f` is an isomorphism.

- `TauCeti.EtaleDuality.curveTrace_firstChernClass`: For `X` a proper smooth connected curve over an algebraically closed field, `Tr_X(c₁(L)) = deg L mod n`.

A proof proceeds as follows.

(`a`): `H²_c(X) ≅ H²_c`(`X_red`) (topological invariance), and for the dense open `X_red ⊂ X̄` the localization
sequence (SGA 4 XVII 5.1.16.3) with the finite complement gives `H²_c(X) ≅ H²(X̄)`; Kummer and degree give
`(ℤ/n)^c`; define `t((a_i)) = Σ n_i a_i` (SGA 4 XVIII 1.1.3).

(b): on `P¹_S` the Kummer map `ℤ/n → R²p_*ℤ/n(1)` is an isomorphism (checked fibrewise); its inverse is `Tr_p`.
Where `X` admits a quasi-finite flat `S`-map `u` to `P¹_S`, set `Tr_f := Tr_p ∘ Tr_u` (§0.3), independent of `u` by
checking fibrewise via 1.1.5; glue over such opens using right exactness of `R²f_!`; in general restrict to the
dense Cohen-Macaulay locus. For `F` with `nF = 0` use `R²f_!ℤ/n(1) ⊗ F ≅ R²f_!(f^*F(1))` (projection formula) and
pass to the limit (SGA 4 XVIII 1.1.6).

1.1.4, 1.1.7-1.1.9 are checked fibre by fibre from (a).

Use [SGA4-XVIII] 1.1.3, (1.1.3.3), p. 486; [SGA4-XVIII] Proposition 1.1.6, p. 489; [SGA4-XVIII] Lemme 1.1.9,
p. 491.

*Needs:* EtaleCohomologyFoundations §0.9; EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4;
EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations
§§F.0–F.6 and the scheme-site contract above; JacobianChallenge layer a line bundles divisors picard group
degree.

**Checks.**


- `TauCeti.EtaleDuality.curveTrace_projectiveLine`: On `P¹` over an algebraically closed field, `Tr(c₁(O(1))) = 1 ∈ ℤ/n`.

- `TauCeti.EtaleDuality.curveTrace_twoLines`: For `X = A¹ ⊔ A¹` over an algebraically closed field, `H²_c(X, Λ(1)) ≅ Λ²` and `Tr_X(a, b) = a + b`.

- `TauCeti.EtaleDuality.curveTrace_empty`: For the empty curve, `H²_c = 0` and `Tr = 0`.

- `TauCeti.EtaleDuality.not_curveTrace_isIso_doubleLine`: For `X = Spec k[x, y]/(y²)` (a double line) and `n = 2, Tr_X` is multiplication by the multiplicity 2 on `H²_c(X, ℤ/2(1)) ≅ ℤ/2`, hence zero and not an isomorphism.

- `P¹` over `k` algebraically closed: `Tr(c₁(O(1))) = 1`.

- Two disjoint lines: `H²_c ≅ Λ²` and `Tr` is the sum.

- The double line `Spec k[x, y]/(y²): Tr` is multiplication by 2 on `H²_c ≅ ℤ/n`, not an isomorphism for `n` even.

**Poincaré duality on a smooth curve over an algebraically closed field.** Let `U` be a smooth connected curve
over an algebraically closed field `k` and `n` invertible in `k`. For every finite locally constant sheaf `F` of
`ℤ/n`-modules on `U` and every `r`, the pairing `H^r_c(U, F) × H^{2−r}(U, F^∨(1)) → H²_c(U, μ_n) →Tr ℤ/n` is perfect.
In particular `H¹_c(U, ℤ/n)` and `H¹(U, μ_n)` are dual, and for a tame finite étale cover `u : U′ → U` the trace
`Tr_u : H¹_c(U′, ℤ/n) → H¹_c(U, ℤ/n)` is (after choosing `μ_n ≅ ℤ/n`) the transpose of `u^* : H¹(U, ℤ/n) → H¹(U′, ℤ/n)`. The proof uses the Jacobian and Kummer theory and is independent of the general duality theorem.

Work with the following additional hypotheses. `k` algebraically closed, `n` invertible; `U` smooth connected
(affine or proper). This is the curve input of SGA 4 XVIII §1 and must not be deduced from §0.2 or
§§0.3–0.7:pairings (it is used to prove them).

Name the resulting statement `curveH1Duality`.

A proof proceeds as follows.

Dévissage (Milne LEC 14.7, steps 0-4): both sides vanish outside `0 ≤ r ≤ 2`; both are `δ`-functors in `F`; a finite
map `U′ → U` reduces `F` to a direct image of a constant sheaf; removing a point `x` compares the pair sequences,
with `H^r_x(U, μ_n) = ℤ/n` for `r = 2` and 0 otherwise (Kummer on the henselian trait); so it suffices to treat `F = ℤ/n` on a complete smooth curve `X`.

Complete curve: `H⁰` and `H²` are dual by the trace (§0.3). In degree 1, Kummer gives `H¹(X, μ_n) = Pic(X)[n] = J(k)[n]` for the Jacobian `J` (JacobianChallenge Layer `D`) and `H¹(X, ℤ/n) = Hom(π₁, ℤ/n) = Hom(J[n], ℤ/n)` via the
Abel-Jacobi pullback of isogenies; the cup product pairing is identified with the Weil pairing on `J[n]` (Milne
LEC 14.8), which is perfect for the principal polarization (AbelianSchemesAndArithmeticModuli A3).

Transposition 1.6.6: the trace `Tr_u` and `u^*` are adjoint for the cup-product pairing by the projection formula
`Tr_u(a ∪ u^*b) = Tr_u(a) ∪ b`; perfectness on `U` and `U′` then makes `Tr_u` the transpose of `u^*` (SGA 4 XVIII 1.6.6,
first proof via 1.6.5.1).

Use [Milne-LEC] Theorem 14.7, p. 93; [Milne-LEC] Example 14.8, p. 93; [SGA4-XVIII] Lemme 1.6.6, p. 545.

*Needs:* EtaleCohomologyFoundations §0.9; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves
§§0.1–0.3; AbelianSchemesAndArithmeticModuli §A3 (Weil pairing); JacobianChallenge layer `d` the relative picard
functor and the jacobian scheme; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `U = A¹: H¹_c(A¹, ℤ/n) = 0 = H¹(A¹, μ_n)`.

- `U = G_m: H¹_c(G_m, ℤ/n) ≅ ℤ/n` and `H¹(G_m, μ_n) = Γ(G_m, O)^×/n ≅ ℤ/n` (generated by the Kummer class of the coordinate `t`), and the pairing is perfect.

### 0.4 The general flat trace and its multiplicities

**The trace morphism `Tr_f : R^{2d}f_!f^*F(d) → F`.** Consider triples `(f, d, F): f : X → Y` compactifiable, `d` an
integer, `F` a torsion sheaf on `Y` prime to the residue characteristics, where `f` satisfies `(∗)_d`: there is an
open `U ⊂ X` on which `f` is flat of finite presentation with fibres of dimension `≤ d` and the fibres of `X − U` have
dimension `< d`. There is a unique trace `Tr_f : R^{2d}f_!f^*F(d) → F` such that (Var 1) it is natural in `F`; (Var
2) it commutes with base change along `Y′ → Y` (`Y′` quasi-compact quasi-separated); (Var 3) for composable `X →g Y →f Z` satisfying `(∗)_e` and `(∗)_d, fg` satisfies `(∗)_{d+e}` and `Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g)` under
`R^{2d}f_!R^{2e}g_! ≅ R^{2(d+e)}(fg)_!`; (Var `4`)(`I`) for `d = 0` and `f` finite locally free of `rank r, F → f_*f^*F → F` is multiplication by `r`; (II) for the affine line it is the isomorphism (2.8.1). For `d = 0` it is the
quasi-finite flat trace, for curves the curve trace, for affine space (2.8.1) (Prop. 2.10). It is compatible
with Künneth: `Tr_{f×g} = Tr_f ⊗ Tr_g` (2.12). In derived form, `Tr_f : Rf_!(f^*K(d)[2d]) → K` for `K ∈ D(Y, Λ), Λ`
killed by `n` invertible (2.13.2). For `Λ = ℤ/n` with `n ≥ 2`, the sheaf trace `R^{2d}f_!Λ(d) → Λ` is an isomorphism
iff every geometric fibre has exactly one `d`-dimensional irreducible component and its multiplicity is prime to
`n` (Remark 2.10.1). This criterion does not assert that the derived trace `Rf_!f^*K(d)[2d] → K` is an
isomorphism; it is not an iff for arbitrary `F`, for instance `F = 0`.

Work with the following additional hypotheses. `f` compactifiable satisfying (`∗`)`_d` (e.g. flat of finite
presentation of pure relative dimension `d`); `F` torsion prime to residue characteristics. Uses only §1.1 of SGA
4 XVIII (not the effacement lemma).

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.trace`: `Tr_f : R^{2d}f_!f^*F(d) ⟶ F` for `f` compactifiable satisfying `(∗)_d`.

- `TauCeti.EtaleDuality.derivedTrace`: `Tr_f : Rf_!(f^*K(d)[2d]) ⟶ K` in `D(Y, Λ)`, natural in `K`.

- `TauCeti.EtaleDuality.trace_baseChange`: (Var 2): compatibility with base change.

- `TauCeti.EtaleDuality.trace_comp`: (Var `3`): `Tr_{fg} = Tr_f ∘ R^{2d}f_!`(`Tr_g`).

- `TauCeti.EtaleDuality.trace_finite`: (Var `4`)(`I`): for `d = 0` and `f` finite locally free of `rank r, Tr_f ∘` unit `= r`.

- `TauCeti.EtaleDuality.trace_affineLine`: (Var 4)(II): for the affine line `Tr_f` is the isomorphism (2.8.1).

- `TauCeti.EtaleDuality.trace_kunneth`: `Tr_{f×g} ∘` (Künneth) `= Tr_f ⊗ Tr_g` (SGA 4 XVIII 2.12).

- `TauCeti.EtaleDuality.trace_isIso_iff`: For `Λ = ℤ/n, n ≥ 2`, the sheaf trace `R^{2d}f_!Λ(d) → Λ` is an isomorphism iff each geometric fibre has one `d`-dimensional irreducible component of multiplicity prime to `n`. No such criterion for the derived trace or an arbitrary sheaf `F` is asserted.

- `TauCeti.EtaleDuality.higherLowerShriek`: `R^q f_!K := ℋ^q(Rf_!K)`, the sheaf on which the trace is defined.

A proof proceeds as follows.

Reduction to the dense open `U` and to the Cohen-Macaulay locus: `R^{2d}` does not see closed subsets of fibre
dimension `< d` (SGA 4 XVIII 2.1, 2.3) and is computed by étale covers (2.2).

Locally on a Cohen-Macaulay flat `X`, choose a quasi-finite flat map `u : X → E^d_Y` and set `Tr_f := Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_u)` (affine-space trace and quasi-finite flat trace); independence of `u`: two systems of
parameters are joined by a chain changing one coordinate at a time (2.5-2.6), and changing one coordinate
reduces to the curve case (1.1.7-1.1.8). Glue by uniqueness.

Uniqueness: (Var 2) reduces to `S` an algebraically closed field, and (Var 3)-(Var 4) pin the trace on the
generating classes.

Künneth compatibility from (Var 3) and the asymmetric description of the Künneth map (SGA 4 XVII 5.4.3.5); the
derived form by tensoring with `K` via the projection formula (2.13.1).

Use [SGA4-XVIII] Théorème 2.9, p. 553; [SGA4-XVIII] Proposition 2.10, p. 559; [SGA4-XVIII] 2.13, (2.13.2), p.
560; [SGA4-XVIII] Remarque 2.10.1, p. 559.

*Needs:* §0.3; EtaleCohomologyFoundations §§0.11, F.6; EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves
§0.4; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3; `AlgebraicGeometry.Flat`;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `TauCeti.EtaleDuality.trace_projectiveSpace`: For `P^d` over an algebraically closed field, `Tr(c₁(O(1))^d) = 1`.

- `TauCeti.EtaleDuality.trace_dimZero_separable`: For `Spec k′ → Spec k` finite separable of degree `r` and `d = 0, Tr ∘` unit `= r`.

- `TauCeti.EtaleDuality.trace_twoComponents`: Assume `Λ ≠ 0`. For `X = P¹ ⊔ P¹` over an algebraically closed field `(d = 1), H²(X, Λ(1)) ≅ Λ²` and `Tr` is the sum, so `Tr` is surjective but not injective.

- `TauCeti.EtaleDuality.not_trace_ignores_multiplicity`: For the double plane `X = Spec k[x, y, z]/(z²)` over an algebraically closed `k` and `d = 2, Tr` is multiplication by 2 on `H⁴_c(X, Λ(2)) ≅ Λ`; a trace defined without multiplicities (the identity there) violates (Var `4`)(`I`) after a finite flat projection.

- For `X = Spec k′ → Spec k` finite separable of degree `r` and `d = 0, Tr ∘` unit `= r`.

**Top-degree compactly supported cohomology of a variety.** Let `X` be separated of finite type of dimension `≤ d`
over an algebraically closed field `k, n` invertible in `k, Λ = ℤ/n`. Then `H^q_c(X, F) = 0` for `q > 2d` and every
torsion sheaf `F`, and étale topological invariance and the reduced smooth loci give `H^{2d}_c(X, Λ(d)) ≅ Λ^{C_d}, C_d` the set of irreducible components of dimension `d`, when the structure morphism satisfies `(*)_d`,
its trace on the factor of a component of multiplicity `m` is multiplication by `m`. In particular, for `X`
geometrically irreducible of dimension `d` over a field `k₀` with `k = k̄₀, H^{2d}_c(X_k, Λ) ≅ Λ(−d)` as a Galois
module (geometric Frobenius acting by `q^d` over `𝔽_q`). For `X` smooth connected of dimension `d` and `F` locally
constant constructible, `H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d)` (coinvariants); this is §0.6.

Work with the following additional hypotheses. `X` separated of finite type over an algebraically closed field
(for the Galois statement, base change from `k₀`).

Name the resulting statement `topDegreeCompactCohomology`.

A proof proceeds as follows.

Vanishing above `2d`: SGA 4 XVII 5.2.8.1.

Remove the smaller-dimensional components and a closed subset of dimension `< d` (XVIII 2.1). Pass to `X_red`
using étale topological invariance, then to a dense smooth open in each component. Smooth purity identifies
each summand with `Λ`. The trace of 2.9, when `(*)_d` holds, separately acts on this reduced-cohomology
identification with the generic multiplicities (2.10.1); it need not be an isomorphism for nonreduced `X`.

Galois equivariance: use topological invariance to pass to `X_red`, then a Galois-stable dense smooth open. On
that geometrically irreducible smooth open, the trace is an isomorphism and is Galois-equivariant by (Var 2),
giving `H^{2d}_c(X_k, Λ) ≅ Λ(−d)`. The possibly noninvertible multiplicity-weighted trace of `X` itself is not
used to deduce this identification.

Use [SGA4-XVIII] Lemme 2.1, p. 550; [SGA4-XVIII] Remarque 2.10.1, p. 559.

*Needs:* EtaleCohomologyFoundations §§0.11, F.6; EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4;
`IsSepClosed`.

**Checks.**


- `X = P^d: H^{2d}(P^d, Λ(d)) ≅ Λ`.

- `X = A^d ∪ A^{d−1}` (disjoint): `H^{2d}_c ≅ Λ`.

### 0.5 Global duality and torsion pairings

Retain nonprojective locally constant finite coefficients and the distinction between geometric and arithmetic duality.

**Global Verdier duality over a field: relative and geometric forms.** Let `X` be separated of finite type over
a field `k` with `a : X → Spec k, n` invertible, `Λ = O/πⁿ` (or self-injective, killed by `n`). (a) Relative duality
in `D(k_ét, Λ): Ra_*D_X K ≅ RHom(Ra_!K, Λ)` for every `K ∈ D(X, Λ)`, as complexes of `Gal(k_s/k)`-modules. (b)
Geometric duality: for `X̄ := X ⊗_k k_s, RΓ(X̄, D_X̄ K̄) ≅ RHom_Λ(RΓ_c(X̄, K̄), Λ)`, and for `K ∈ D^b_c, H^{−q}(X̄, D K̄) ≅ Hom_Λ(H^q_c(X̄, K̄), Λ)` since `Λ` is self-injective. The relative form is not the same as a
statement about absolute cohomology `RΓ(X, −) = RΓ(k, Ra_*−)`: for `X = Spec 𝔽_q` and `K = Λ`, the absolute groups
`RΓ(X, D_X Λ) = RΓ(𝔽_q, Λ)` are `Λ` in degrees 0 and 1, while `RHom_Λ(RΓ(𝔽_q, Λ), Λ)` is `Λ` in degrees 0 and `−1`, so
the absolute analogue of (b) is false. Over `ℤ_ℓ` the derived dual and its `Ext` terms are retained (Layer 3 and
§0.6).

Work with the following additional hypotheses. `X` separated of finite type over a field `k`; `n` invertible in `k`.
(a) holds for all `K ∈ D(X, Λ)`; the degreewise form in (b) uses self-injectivity of `Λ`.

Name the resulting statement `relativeAndGeometricDuality`.

A proof proceeds as follows.

(a) is sheafified exceptional adjunction from EtaleCohomologyFoundations §F.5, with `L := K`, target `Λ` and
`a^!Λ = K_X`. The unbounded support functor satisfies the amplitude, colimit, exchange and projection hypotheses
in the exact supplier contract above; EnhancedDerivedSheaves §0.4 supplies the coherent adjunction maps.

For the displayed geometric duality, apply sheafified adjunction directly to `ā : X_k̄ → Spec k̄`. Do not
commute `Ra_*` across the field extension by the proper base change theorem when a is not proper. Any separate
comparison of the original relative duality object with its geometric stalk requires its own
constructibility/base-change hypotheses.

Use [SGA4-XVIII] 3.2.6, p. 586; [Stacks-MoreEtale] Lemmas 11.5–11.6 (tags 0GLC–0GLD).

*Needs:* EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; §0.1; EtaleCohomologyFoundations
§§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site
contract above.

**Checks.**


- `X = Spec k: (a)` is `RHom(K, Λ) ≅ RHom(K, Λ)`.

- `X = Spec 𝔽_q, K = Λ`: relative duality holds in `D`(`𝔽_q`,ét, `Λ`), while the absolute form fails in degrees `±1` (`H¹(𝔽_q, Λ) = Λ` against `Ext^{−1} = Λ` in degree `−1`).

- `X = P¹` over an algebraically closed field: `H^{−q}(X, D Λ) = H^{2−q}(X, Λ(1))` is dual to `H^q(X, Λ)`.

**Poincaré duality for smooth varieties with torsion coefficients.** Let `X` be smooth, separated, of finite
type and of pure dimension `d` over a separably closed field `k, n` invertible in `k, Λ = O/πⁿ` (e.g. `ℤ/ℓⁿ`), and `F` a
locally constant constructible sheaf of `Λ`-modules. Then `RΓ(X, F^∨(d)[2d]) ≅ RHom_Λ(RΓ_c(X, F), Λ)`, and for
every `i` the pairing `H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → H^{2d}_c(X, Λ(d)) →Tr Λ` is a perfect pairing of
finitely generated `Λ`-modules. For `X` proper, `H_c = H`. For general `Λ` killed by `n` the derived statement holds
with `F^∨ := RHom(F, Λ)` and the degreewise statement needs self-injectivity.

Work with the following additional hypotheses. `k` separably closed (for a general `k` apply to `X ⊗ k_s` with
Galois action: §0.5). `X` smooth separated of pure dimension `d`; `F` locally constant constructible; `Λ = O/πⁿ`.

Name the resulting statement `poincareDualityTorsion`.

A proof proceeds as follows.

Combine §0.5 (b) with `D_X F = F^∨(d)[2d]` (§0.2).

The adjunction isomorphism is given by evaluation `F ⊗ F^∨ → Λ` followed by the counit `R a_!a^!Λ → Λ`. Taking
cohomology identifies this map with cup product and the smooth trace; this is the formal evaluation/counit
calculation, independent of the later cup-product trace pairing.

Finiteness of `H^i_c` and `H^i`: imported finiteness theorem.

Use [SGA4-XVIII] 3.2.6, (3.2.6.2), p. 586; [Milne-LEC] Theorem 24.1, p. 144.

*Needs:* §0.2; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `X = P¹, F = Λ: H⁰ × H²(Λ(1)) → Λ` and `H¹ = 0`.

- `X = G_m, F = Λ: H¹_c(G_m, Λ) ≅ Λ` is dual to `H¹(G_m, Λ(1)) ≅ Λ`.

**The duality pairing is cup product followed by the trace; graded symmetry.** In the situation of §0.5, the
pairing defined by the duality isomorphism equals `⟨x, y⟩ = Tr_X(x ∪ y)` for `x ∈ H^i_c(X, F), y ∈ H^{2d−i}(X, F^∨(d))`, where `∪ : H^i_c(X, F) ⊗ H^j(X, G) → H^{i+j}_c(X, F ⊗ G)` is the cup product and `F ⊗ F^∨ → Λ` is
evaluation. For `F = Λ` and `X` proper, the cup-product pairing `H^i(X, Λ) × H^{2d−i}(X, Λ(d)) → Λ` satisfies `⟨x, y⟩ = (−1)^{i(2d−i)}⟨y, x⟩ = (−1)^i ⟨y, x⟩` after identifying `Λ(d) ⊗ Λ ≅ Λ ⊗ Λ(d)`; in the middle degree `i = d` with
`d` odd, graded commutativity proves alternation when 2 is invertible in `Λ`, and with `d` even it proves symmetry.
The curve alternation for all `n` follows separately from the Weil pairing (curve-h1-duality); no general
2-primary alternation is deduced from the Koszul sign alone. For smooth proper `f : X → S` of relative dimension
`d` with connected geometric fibres, `R^{2d}f_*Λ(d) ≅ Λ` via `Tr_f` and the fibrewise pairings `R^jf_*Λ ⊗ R^{2d−j}f_*Λ → R^{2d}f_*Λ → Λ(−d)` are morphisms of sheaves compatible with base change, so monodromy preserves
them.

Work with the following additional hypotheses. As in poincare-duality-torsion; for the relative form `f` smooth
proper with geometrically connected fibres, `n` invertible on `S`.

Name the resulting statement `cupProductTracePairing`.

A proof proceeds as follows.

The duality isomorphism is the adjoint of `Tr` through the evaluation `K ⊗^L D K → K_X`; on cohomology this is cup
product with the evaluation map followed by `Tr` (SGA 4 XVIII 3.2.6, Milne LEC 24.1 discussion).

Graded commutativity of the cup product on `H*(X, Λ)` (Koszul sign `(−1)^{ij}`), with `i(2d − i) ≡ i mod 2`. To
infer `⟨x,x⟩ = 0` from `2⟨x,x⟩ = 0` require 2 invertible, or the separate curve Weil-pairing argument.

Relative form: `Tr_f` is an isomorphism for connected geometric fibres (§0.4, isomorphism criterion) and
commutes with base change (Var 2); `R^jf_* = R^jf_!` commutes with base change (proper base change, imported).

Use [Milne-LEC] §24, p. 145; [SGA4-XVIII] Proposition 2.12, p. 559-560.

*Needs:* §0.4; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; §0.3.

**Checks.**


- Curve `(d = 1)`: the pairing on `H¹` is alternating, matching the Weil pairing on `J[n]` (Milne LEC 14.8).

- Surface `(d = 2)`: the pairing on `H²` is symmetric; on `P¹ × P¹` its matrix in the basis of the two rulings is [[0, 1], [1, 0]].

**Galois and Frobenius equivariance of the Poincaré pairing.** Let `X₀` be smooth separated of finite type of
pure dimension `d` over a field `k₀, X = X₀ ⊗ k_s`, and `F₀` locally constant constructible on `X₀`. The pairing
`H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → Λ` of §0.5 is `Gal(k_s/k₀)`-equivariant (`Λ` with trivial action). Over `k₀ = 𝔽_q` with geometric Frobenius `F`: for the untwisted pairing `H^i_c(X, Λ) × H^{2d−i}(X, Λ) → H^{2d}_c(X, Λ) →^{Tr_X} Λ(−d)`, one has ⟨Fx, Fy⟩ `= q^d⟨x, y⟩`. Consequently, if `F` acts on `H^i_c` with eigenvalue `α` then `q^d/α` is an
eigenvalue of `F` on `H^{2d−i}`, with multiplicities preserved. Eigenvalue multisets and their algebraic
multiplicities are statements for field coefficients (`𝔽_ℓ` or, after adic-and-rational-poincare-duality, `ℚ_ℓ`),
not for modules over `ℤ/ℓᵐ`. The torsion-ring conclusion is the equivariance of the pairing itself. For nonempty geometrically connected `X₀`, the top-degree trace is an isomorphism; in general the pairing uses the trace without this identification.

Work with the following additional hypotheses. `k₀` arbitrary for Galois equivariance; `k₀ = 𝔽_q` for the
Frobenius statement.

Name the resulting statement `galoisFrobeniusEquivariance`.

A proof proceeds as follows.

Trace and cup product are compatible with base change (Var 2) and hence with the Galois action; the twist `Λ(d)`
carries the cyclotomic character.

Geometric Frobenius acts on `Λ(−d)` by `q^d` (EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves
§§0.1–0.3).

Over a field, perfectness identifies the second space with the linear dual of the first. The pairing identity
intertwines its Frobenius with `q^d` times the dual of the inverse of the first Frobenius. This operator
conjugacy, not merely a relation on paired eigenvectors, gives reciprocal eigenvalues with algebraic
multiplicities.

Use [Deligne-WeilI-1974] (2.4), p. 281.

*Needs:* EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- `X = P¹` over `𝔽_q: F` acts on `H⁰` by 1 and on `H²` by `q`, and ⟨`F·1`, Fy⟩ `= q⟨1, y⟩`.

- Elliptic curve `E` over `𝔽_q`: the Frobenius eigenvalues `α, β` on `H¹` satisfy `αβ = q`.

- For `X₀=P¹⊔P¹`, `H²_c(X,Λ)=Λ(−1)²` and `Tr_X(a,b)=a+b`. The trace pairing is Frobenius-equivariant with multiplier `q`, although for nonzero `Λ` its top-degree trace is not an isomorphism.

- The operator identity `pairing_dual_operator` identifies the second Frobenius with `q^d` times the dual inverse of the first under a perfect field-valued pairing, so reciprocal eigenvalues retain algebraic multiplicities.

### 0.6 Integral duality and extreme degrees

Extract the torsion `Ext` term and the invariant/coinvariant descriptions from derived duality.

**`ℓ`-adic and rational Poincaré duality, with the integral derived form kept separate.** Let `X` be smooth
separated of finite type of pure dimension `d` over a separably closed field `k, E/ℚ_ℓ` finite with ring of
integers `O_E` and uniformizer `π, ℓ` invertible in `k`, and `F` a finite free lisse `O_E`-sheaf (a compatible system
`(F_m)` of locally constant finite free `O_E/π^m`-sheaves, with `F_{m+1}⊗O_E/π^m≅F_m`). With `H^i_c(X, F) := lim_m H^i_c(X, F_m)` and `H^i(X, F^∨(d)) := lim_m H^i(X, F_m^∨(d))` (finitely generated `O_E`-modules), there is a
derived duality `RΓ(X, F^∨(d)[2d]) ≅ RHom_{O_E}(RΓ_c(X, F), O_E)`, hence short exact sequences `0 → Ext¹_{O_E}(H^{2d−i+1}_c(X, F), O_E) → H^i(X, F^∨(d)) → Hom(H^{2d−i}_c(X, F), O_E) → 0`. After `⊗E`, the pairing
`H^i_c(X, F_E) × H^{2d−i}(X, F_E^∨(d)) → E` is a perfect pairing of finite-dimensional `E`-vector spaces,
Galois-equivariant (Frobenius-equivariant over `𝔽_q`).

Work with the following additional hypotheses. `k` separably closed; `ℓ` invertible; `F` finite free lisse;
finite-level duality is applied at each level `O_E/π^m` (self-injective, with finite free `F_m` so ordinary dual
commutes with reduction). For these finite free lisse systems, use EtaleCohomologyFoundations §F.4: finite-`E`
lattices, finitely generated integral cohomology, perfect cohomology complexes, strict derived reduction and
coefficient change. The later constructible ramified-tower construction is not needed here.

Name the resulting statement `adicAndRationalPoincareDuality`.

A proof proceeds as follows.

At level `m: RΓ(X, F_m^∨(d)[2d]) ≅ RHom_{O/π^m}(RΓ_c(X, F_m), O/π^m)` (§0.5), compatible with reduction
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3).

Pass to the derived limit: `R` lim of `RHom_{O/π^m}(C ⊗^L O/π^m, O/π^m)` is `RHom_{O_E}(C, O_E)` for `C` a perfect
`O_E`-complex computing `RΓ_c(X, F)` (finiteness), and the groups are finite so `lim¹` vanishes.

The universal coefficient sequence for `RHom_{O_E}(C, O_E)` gives the `Ext¹` terms; they are torsion and vanish
after `⊗E`.

Use [Deligne-WeilI-1974] (2.14) `A`), p. 283.

*Needs:* §0.5; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `X` a smooth projective curve of genus `g, F = ℤ_ℓ: H¹(X, ℤ_ℓ)` is free of `rank 2g` and the pairing `H¹ × H¹ → ℤ_ℓ(−1)` is perfect (unimodular).

- An Enriques surface over `k` of characteristic `≠ 2, ℓ = 2: H²(X, ℤ_2)` has torsion `ℤ/2` and `H³(X, ℤ_2) ≅ ℤ/2`, illustrating the `Ext¹` term; over `ℚ_2` the pairing is perfect.

**Cohomology in degrees 0 and `2d` with compact supports.** Let `X` be smooth, separated, connected of dimension `d ≥ 1` over a separably closed field `k, n` invertible, and `F` a locally constant constructible sheaf of `Λ`-modules
`(Λ = O/πⁿ)` or a lisse `ℚ_ℓ`-sheaf. (a) `H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d)`, the coinvariants of the
monodromy representation, twisted. (b) If `X` is affine, `H⁰_c(X, F) = 0`. (c) For `d = 1` (a curve, Weil `I` (2.10)):
`H⁰_c(X, F) = 0` when `X` is affine and `H²_c(X, F) = (F_x̄)_{π₁(X, x̄)}(−1)`. In particular, for a rank-one `F` over
a field coefficient ring with geometrically nontrivial monodromy on a non-proper geometrically connected `X, H⁰_c = H^{2d}_c = 0`. For finite-ring coefficients require that some monodromy scalar `χ(γ)−1` is a unit;
nontrivial monodromy alone is insufficient. For example the `ℤ/4` Kummer local system on `G_m` with monodromy `−1`
has coinvariants `ℤ/2`.

Work with the following additional hypotheses. `X` smooth connected; for (b) affine (or more generally with no
proper component).

Name the resulting statement `extremeDegreeCohomology`.

A proof proceeds as follows.

(a): by §0.5, `H^{2d}_c(X, F)` is dual to `H⁰(X, F^∨(d)) = ((F_x̄)^∨)^{π₁}(d)`, and duality exchanges invariants
of the dual with coinvariants.

(b): a section of `F` with compact (proper) support on a connected non-proper `X` is zero (its support is open and
closed and proper).

Use [Deligne-WeilI-1974] Scholie (2.10), p. 282.

*Needs:* §0.5; §0.4.

**Checks.**


- `X = A¹, F = Λ: H⁰_c = 0` and `H²_c = Λ(−1)`.

- For field coefficients, `X = G_m` and the Kummer sheaf `F` of a nontrivial character `χ` of `μ_m` have `H⁰_c = H²_c = 0`.

- Over `Λ=ℤ/4`, the double-cover Kummer local system with monodromy `−1` has `H²_c(G_m,F)=ℤ/2(−1)`: its coinvariants are nonzero.

### 0.7 Curve direct images and relative pairings

**Poincaré duality on a projective curve with `j_*` coefficients (Weil `I` 2.12).** Write `Λ` for `ℚ_ℓ` in the
rational case and `O/πᵐ` in the finite-level case. Let `X` be a projective smooth connected curve over an
algebraically closed field `k, j : U → X` the inclusion of a dense open, `ℓ` invertible in `k`, and `F` a lisse
`ℚ_ℓ`-sheaf (or a locally constant constructible `O/πⁿ`-sheaf) on `U`. Then `D_X(j_*F) ≅ j_*(F^∨)(1)[2]`, and the
pairing `Tr(x ∪ y) : H^i(X, j_*F) ⊗ H^{2−i}(X, j_*F^∨(1)) → H²(X, j_*(F ⊗ F^∨)(1)) → H²(X, Λ(1)) → Λ` is a
perfect duality, Frobenius-equivariant when `X, U` and `F` are defined over `𝔽_q`. The stalks of `j_*F` at the points
of `X − U` are the local monodromy invariants. In the finite-level variant the trace target is `Λ = O/πᵐ`; in the
rational variant it is `ℚ_ℓ`. The invariant/coinvariant duality used locally is valid for these self-injective
finite coefficients.

Work with the following additional hypotheses. `X` projective smooth connected curve over `k` algebraically
closed; `F` lisse on `U`; for `ℚ_ℓ` coefficients pass to the limit as in §0.6. The torsion statement needs the dual
of `j_*F` to be `j_*(F^∨)(1)[2]`, which is the local calculation at the punctures.

Name the resulting statement `curvePoincareDualityWithJStarStatement`.

A proof proceeds as follows.

Local calculation (Weil `I` (2.14) `E`; SGA 4½ [Dualité] 1.3, pp. 156–157): at a puncture `s` with inclusion `i_s, i_s^*j_*F = F^{I_s}` (invariants) and `i_s^!j_*F = (F_{I_s})(−1)[−2]` (coinvariants), and the duality between
invariants and coinvariants of the dual representation gives `D(j_*F) ≅ j_*(F^∨)(1)[2]` (§0.2, example).

Then global duality (§0.5) gives `RΓ(X, j_*F^∨(1)[2]) ≅ RHom(RΓ(X, j_*F), Λ)`, identified with the cup-product
pairing (§0.5); pass to `ℚ_ℓ`.

Use [Deligne-WeilI-1974] §2, Théorème (2.12), p. 283; [Deligne-WeilI-1974] §2, (2.14) `E`), p. 283.

*Needs:* §0.2; §0.5; §0.6.

**Checks.**


- Used in Weil `I` (3.9) and Weil II (3.3.5) to turn upper weight bounds into lower bounds; the pairing is on `j_*F`, not on `j_!F`.

- `U = X`: the usual Poincaré duality on the curve.

**`H⁰` and `H²` of `F₁ ⊗ F₂^∨` on a proper curve.** Let `X` be a projective smooth connected curve over an
algebraically closed field (or the geometric curve of one over `𝔽_q`), and `F₁, F₂` lisse `ℚ̄_ℓ`-sheaves. Then `H⁰(X, F₁ ⊗ F₂^∨) = Hom_X(F₂, F₁)` and `H²(X, F₁ ⊗ F₂^∨) ≅ H⁰(X, F₁^∨ ⊗ F₂(1))^∨ = Hom_X(F₁, F₂)^∨(−1)`,
Frobenius-equivariantly for Weil sheaves; on a non-proper `U` the same holds for `H⁰_c = 0` and `H²_c` by §0.6. The
order of the two `Hom` spaces is fixed by evaluation, rather than by the opposite ordering printed in Yu’s
equations.

Work with the following additional hypotheses. Lisse `ℚ̄_ℓ` coefficients (via finite `E` and passage to the
limit).

Name the resulting statement `lisseTensorHomDualityOnCurves`.

A proof proceeds as follows.

`F₁ ⊗ F₂^∨ ≅ Hom(F₂, F₁)` as lisse sheaves, so global sections are `Hom_X(F₂, F₁)`.

Poincaré duality (§0.6) on the proper curve gives `H²(X, G) ≅ H⁰(X, G^∨(1))^∨` with `G^∨ = F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂)`.

Frobenius equivariance from §0.5.

Use [Yu-2023] §6.1, equations (6.1.1)-(6.1.2), p. 42.

*Needs:* §0.6; §0.5.

**Checks.**


- `F₁ = F₂` irreducible: `H⁰` and `H²` are one-dimensional, giving the pole of the self-pair `L`-function (Yu Prop. 6.1.1).

**Relative Poincaré duality for smooth morphisms with locally constant coefficients.** Let `f : X → S` be smooth
compactifiable of pure relative dimension `d, n` invertible on `S, Λ = O/πⁿ`, and `F` a locally constant
constructible sheaf of `Λ`-modules on `X` such that the `R^q f_!(F^∨)` are locally constant constructible for all `q`.
Then `R^q f_*F ≅ Hom_Λ(R^{2d−q}f_!(F^∨), Λ)(−d)` for every `q`, compatibly with base change; in particular, for `f`
proper smooth the sheaves `R^q f_*F` and `R^{2d−q}f_*(F^∨(d))` are dual local systems. This is the scheme analogue
of Berkovich's Theorem 7.4.9 used in ClassicalAdicEtaleCohomology §9.2.

Work with the following additional hypotheses. `f` smooth compactifiable of pure relative dimension `d`; `F` locally
constant constructible with locally constant `R^q f_!(F^∨)`; `Λ` self-injective.

Name the resulting statement `relativeDualityLocallyConstant`.

A proof proceeds as follows.

`Rf_*RHom(F^∨, f^!Λ) ≅ RHom(Rf_!F^∨, Λ)` (EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4), with
`f^!Λ = Λ(d)[2d]` (EtaleCohomologyFoundations §§0.11, F.6) and `RHom(F^∨, Λ) = F`.

If the `R^q f_!F^∨` are locally constant constructible, `ℰxt^p(R^q f_!F^∨, Λ) = 0` for `p > 0` (self-injectivity,
stalkwise), so the spectral sequence degenerates to the stated isomorphism.

Use [SGA4-XVIII] Théorème 3.2.5, p. 585.

*Needs:* EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§0.11, F.6;
§0.1.

**Checks.**


- `f : A^d_S → S, F = Λ: R^q f_*Λ = Λ` for `q = 0` and 0 otherwise, dual to `R^{2d}f_!Λ(d) ≅ Λ`.

### Examples

For a double plane and coefficients `ℤ/2`, the top-degree flat trace is multiplication by 2 and vanishes, although the étale topos is that of the reduced plane. For `ℤ/ℓ²` coefficients, the nonprojective constant module `ℤ/ℓ` still has exact finite-level duality. Over a DVR, a torsion cohomology group instead contributes the displayed `Ext¹` term.

### Dependencies

EtaleCohomologyFoundations §§F.0–F.6 and 0.8–0.11; EnhancedDerivedSheaves §§0.1–0.4; JacobianChallenge Layers `A` and `D`; the Weil-pairing contract.

## Layer 1: higher Chern classes and Chow descent

### 1.1 Semi-purity and singular cycle classes with supports

**Semi-purity: `H^q_Z(X, Λ) = 0` for `q < 2c`.** Let `X` be smooth over a perfect field `k, n` invertible, and `Z ⊂ X` a
closed subset of codimension `≥ c`. Then `H^q_Z(X, F) = 0` and `ℋ^q_Z(F) = 0` for `q < 2c` and every locally constant
constructible `F`. Consequently, for `Y ⊂ Z` closed of codimension `≥ c + 1` in `X`, restriction `H^{2c}_Z(X, F) → H^{2c}_{Z−Y}(X − Y, F)` is an isomorphism (and injective in degree `2c + 1`).

Work with the following additional hypotheses. `X` smooth over a perfect field `k` (so the regular locus of a
reduced closed subscheme is smooth and dense); `codim Z ≥ c`.

Name the resulting statement `semiPurity`.

A proof proceeds as follows.

Induction on `dim Z`: the singular locus `Y` of `Z_red` has smaller dimension; the triple sequence `H^q_Y(X) → H^q_Z(X) → H^q_{Z−Y}(X − Y)` gives the vanishing from purity for the smooth pair (`Z − Y, X − Y`)
(EtaleCohomologyFoundations §§0.10, F.6) and induction for `Y` (codimension `≥ c + 1`, so `H^q_Y = 0` for `q < 2c + 2`) (Milne LEC 23.1).

The isomorphism in degree `2c` follows from the same sequence.

Use [Milne-LEC] Lemma 23.1 (Semi-purity), p. 138.

*Needs:* EtaleCohomologyFoundations §§0.10, F.6; EtaleCohomologyFoundations §§F.0–F.1, 0.7;
EnhancedDerivedSheaves §§0.1–0.3; `PerfectField`.

**Checks.**


- `Z` a point on a surface `(c = 2): H^q_Z = 0` for `q < 4`.

**The fundamental class with supports of a cycle.** Let `X` be smooth of pure dimension `d` over a perfect field
`k, n` invertible, `Λ = ℤ/n` (or `O/πⁿ`). For an integral closed subscheme `Z ⊂ X` of codimension `c` with (smooth,
dense) regular locus `Z° = Z − Y`, the fundamental class `s_{Z/X} ∈ H^{2c}_Z(X, Λ(c))` is the unique class
restricting to the purity generator `s_{Z°/(X−Y)} ∈ H^{2c}_{Z°}(X − Y, Λ(c))` (EtaleCohomologyFoundations
§§0.10, F.6), which exists and is unique by semi-purity. Extend linearly to cycles: for `α = Σ m_i[Z_i]` of
codimension `c` with support `|α|, s_α := Σ m_i s_{Z_i/X} ∈ H^{2c}_{|α|}(X, Λ(c))`. For `Z` smooth it is the image
of 1 under purity; for `c = 1` and `Z` a Cartier divisor it is the Kummer local class. Smooth purity is never
applied to a singular `Z`; over an imperfect field, where the regular locus may fail to be smooth, the
construction is not asserted.

Work with the following additional hypotheses. `X` smooth over a perfect field `k`; `Z` integral of pure codimension
`c`; `n` invertible. Perfectness of `k` makes the regular locus of `Z` smooth and dense (covers finite fields and
algebraically closed fields).

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.fundamentalClass`: `s_{Z/X} ∈ H^{2c}_Z(X, Λ(c))` for `Z ⊂ X` integral of codimension `c, X` smooth over a perfect field.

- `TauCeti.EtaleDuality.fundamentalClass_restrict`: Étale open restriction carries `s_{Z/X}` to the restricted fundamental class; for `Z` integral the class is uniquely determined by the purity generator on a dense smooth open. Removing the singular closed subset does not change `H^{2c}_Z`, by semi-purity in codimension `≥c+1`.

- `TauCeti.EtaleDuality.fundamentalClass_smooth`: For `Z` smooth, `s_{Z/X}` is the image of 1 under purity `H⁰(Z, Λ) ≅ H^{2c}_Z(X, Λ(c))`.

- `TauCeti.EtaleDuality.fundamentalClass_divisor`: For `c = 1` and `Z` a Cartier divisor, `s_{Z/X}` is the Kummer local class; its image in `H²(X, Λ(1))` is `c₁(O(Z))`.

- `TauCeti.EtaleDuality.fundamentalClass_etale`: `u^*s_{Z/X} = s_{u^{-1}Z/X′}` for `u : X′ → X` étale.

- `TauCeti.EtaleDuality.fundamentalClassOfCycle`: `s_α ∈ H^{2c}_{|α|}(X, Λ(c))` for a codimension-`c` cycle `α`, additive in `α`.

- `TauCeti.EtaleDuality.fundamentalClass_unique`: For `Z` integral, restriction of `H^{2c}_Z(X,Λ(c))` to any dense smooth open of `Z` is injective; hence a class with the purity-generator restriction equals `s_{Z/X}`.

- `TauCeti.EtaleDuality.fundamentalClassOfCycle_add`: For cycles `α,β` whose supports lie in the same closed `Z, s_{α+β}=s_α+s_β` in `H^{2c}_Z(X,Λ(c))`.

A proof proceeds as follows.

Semi-purity (§1.1) with `Y = Sing(Z)` of codimension `≥ c + 1` in `X` gives `H^{2c}_Z(X) ≅ H^{2c}_{Z°}(X − Y)`; define
`s_{Z/X}` as the preimage of the purity generator.

Compatibility with étale restriction and with open restriction `X′ ⊂ X` follows from uniqueness.

Use [Milne-LEC] §23, p. 139.

*Needs:* EtaleCohomologyFoundations §§0.10, F.6; EtaleCohomologyFoundations §0.9;
`AlgebraicGeometry.AlgebraicCycle`; `PerfectField`.

**Checks.**


- `TauCeti.EtaleDuality.fundamentalClass_hyperplane`: For a hyperplane `H ⊂ P^n` over an algebraically closed field, the image of `s_{H/P^n}` in `H²(P^n, Λ(1))` is `c₁(O(1))`.

- `TauCeti.EtaleDuality.fundamentalClass_nodalCubic`: For the nodal cubic `C ⊂ P²` over an algebraically closed field of characteristic `≠ 2, 3`, the image of `s_{C/P²}` is `3c₁(O(1))`, computed through the smooth locus.

- `TauCeti.EtaleDuality.fundamentalClass_whole`: For `Z = X (c = 0), s_{X/X} = 1 ∈ H⁰(X, Λ)`.

- `TauCeti.EtaleDuality.not_fundamentalClass_purity_singular`: Over an algebraically closed characteristic-zero field with `Λ = ℤ/3`, let `Z = {xy = 0} ⊂ A²`. The stalk at the crossing of `ℋ²_Z(Λ(1))` is `Λ²`, generated by the two branches (local Kummer residues), whereas `Λ_Z` has stalk `Λ`. Thus `i^!Λ` cannot be `Λ_Z(−1)[−2]`; the fundamental classes of the branches exist without asserting purity for the singular union.

- For a hyperplane `H ⊂ P^n, s_{H/P^n}` maps to `c₁(O(1))` in `H²(P^n, Λ(1))`.

- For the nodal cubic `C ⊂ P², s_{C/P²}` maps to `3c₁(O(1)) = c₁(O(3))` although `C` is singular.

### 1.2 Higher étale Chern classes

**Chern classes of vector bundles in étale cohomology.** Let `X` be a scheme with `n` invertible (in applications
smooth over a perfect field). For a locally free `E` of `rank m + 1` with `π : P(E) → X` and `ξ = c₁(O_{P(E)}(1))`,
the Chern classes `c_r(E) ∈ H^{2r}(X, Λ(r))` are the unique classes with `Σ_{r=0}^{m+1} π^*c_r(E) ∪ ξ^{m+1−r} = 0`
and `c₀ = 1` (Grothendieck's definition through EtaleCohomologyFoundations §§0.9, F.7). They satisfy:
functoriality `c_r(f^*E) = f^*c_r(E)`; normalization `c₁(L)` is the Kummer class for a line bundle; Whitney
formula `c_t(E) = c_t(E′)c_t(E″)` for `0 → E′ → E → E″ → 0`; `c_r(E) = 0` for `r > rank E`; splitting principle. The
top Chern class of the normal bundle computes self-intersections (EtaleCohomologyFoundations §§0.10, F.6).

Work with the following additional hypotheses. `n` invertible; `E` locally free of finite `rank` (Zariski-locally
free). Quasi-compactness is needed only for the assertion that the total Chern class is a unit; individual
Chern classes and the Whitney identity do not need it.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.chernClass`: `c_r(E) ∈ H^{2r}(X, Λ(r))` for `E` locally free.

- `TauCeti.EtaleDuality.totalChernClass`: `c(E)=Σ_{r=0}^{rank E} c_r(E)` in the even diagonal cohomology ring. For quasi-compact `X` this is a unit: a finite trivializing cover bounds the nilpotence of its positive-degree part.

- `TauCeti.EtaleDuality.chernClass_pullback`: `c_r(f^*E) = f^*c_r(E)`.

- `TauCeti.EtaleDuality.chernClass_one_lineBundle`: For `L` invertible, `c₁(L)=`firstChernClass `L`; higher vanishing is `chernClass_eq_zero_of_rank_lt`.

- `TauCeti.EtaleDuality.totalChernClass_whitney`: `c(E) = c(E′) ∪ c(E″)` for `0 → E′ → E → E″ → 0`.

- `TauCeti.EtaleDuality.chernClass_eq_zero_of_rank_lt`: `c_r(E) = 0` for `r > rank E`.

- `TauCeti.EtaleDuality.chernClass_projectiveBundle_relation`: `Σ_r π^*c_r(E) ∪ ξ^{rank E − r} = 0` in `H^{2 rank E}(P(E), Λ(rank E))`.

A proof proceeds as follows.

Existence and uniqueness of the relation from freeness of `H*(P(E))` over `H*(X)` (Grothendieck's method, Milne
LEC 23.3).

Normalization and convention: `P(E) := Proj Sym(E^∨)` parametrizes lines in `E` and `O(−1)` is the tautological line
subbundle; for `E = L` of rank one, `P(L) = X` with `O(−1) = L`, so the relation `ξ + c₁(E) = 0` gives `c₁(E) = −c₁(O(1)) = c₁(L)`, the Kummer class (Milne LEC 23.3 (b)).

Whitney formula and splitting principle: pull back to the flag bundle, where `E` has a filtration with
line-bundle quotients and `π^*` is injective (iterate projective-bundle freeness).

For quasi-compact `X` choose a finite trivializing cover. Positive Chern classes restrict to zero on its
members, and the multiplicative cover filtration bounds their nilpotence; the finite geometric series in the
positive-degree part gives the inverse of `c(E)`. Do not assert this uniform nilpotence on an arbitrary
non-quasi-compact scheme.

Use [Milne-LEC] §23, p. 140; [Milne-LEC] Theorem 23.3, p. 140.

*Needs:* EtaleCohomologyFoundations §§0.9, F.7; EtaleCohomologyFoundations §0.9; SchemeAndStackFoundations
§§0.7, 0.9, 4.11 and the geometric contracts above; SchemeAndStackFoundations §§5.1–5.5.

**Checks.**


- `TauCeti.EtaleDuality.chernClass_tangent_projectiveSpace`: For `X = P^m` over an algebraically closed field, `c(T_{P^m}) = (1 + h)^{m+1}` in `Λ[h]/(h^{m+1})`.

- `TauCeti.EtaleDuality.chernClass_trivial`: `c(O_X^r) = 1`.

- `TauCeti.EtaleDuality.chernClass_sum_lines`: Assume `Λ ≠ 0`. `c(O(1) ⊕ O(1)) = (1 + h)²` on `P^m`, so `c₂ = h² ≠ 0` for `m ≥ 2`.

- `TauCeti.EtaleDuality.not_chernClass_two_of_line`: Assume `Λ≠0`. For a line bundle `L, c₂(L) = 0` although `c₁(L)²` may be nonzero (e.g. `L = O(1)` on `P²`): `c₂` is not `c₁²`.

- `c(T_{P^m}) = (1 + h)^{m+1}`.

- `c(O ⊕ O(1))` on `P^m` is `1 + h`.

### 1.3 Chow classes and intersection degrees

Extend the supplied projective-space basis and Kummer class to Chow descent, products and degree compatibility.

**Chow intersection multiplicities and Euler–Tor lengths.** Let `k` be perfect, `X` a smooth
separated finite-type `k`-scheme of pure dimension `d`, and `V,W⊂X` integral closed subvarieties
meeting properly: every irreducible component of `V∩W` has dimension `dim V+dim W−d`.
Construct `chowIntersection_eq_eulerTor`: at the generic point `η` of each such component,
the multiplicity in the proper-intersection cycle representing `[V]·[W]` is
`Σ_i(−1)^i length_A Tor_i^A(O_{V,η},O_{W,η})`, where `A=O_{X,η}`. Equivalently this is
an equality of top-dimensional supported cycles on `V∩W`; its pushforward represents
the Chow product. All these lengths are finite. Construct finite free resolutions of finite `A`-modules of length at most `dim A`, using a regular-parameter Koszul resolution of the residue field and minimal free resolutions; this bounds the Tor range and terminates the sum (Stacks Tag 00OE).

Import SchemeAndStackFoundations §5.6 / `Chow.intersect`, `proper_intersection` and
`Chow.graphPullback`, and §5.5 / `Chow.gysin`. Compare the diagonal refined Gysin
construction with the Euler characteristic of a finite locally free resolution: reduction
to the regular diagonal and deformation to its normal bundle identify the local Gysin
multiplicity with the alternating Koszul homology lengths. Localization at `η` gives the
displayed Tor expression. The argument is over `k`, retaining the perfect-field and
proper-intersection hypotheses; it does not require an algebraically closed ground field
or vanishing of higher Tor. Use Serre, *Algèbre locale. Multiplicités*, Chapter V §3
(intersection multiplicities); Fulton, *Intersection Theory*, §8.2 (proper intersections)
and §20.4 (Tor and intersection products); [Stacks] Section 43.14, Tag 0AZR
(the Euler–Tor formula), and Section 43.17, Tag 0B08.

*Needs:* SchemeAndStackFoundations §§5.5–5.6; Mathlib `ModuleCat.projectiveResolution` and `CategoryTheory.Tor`, with its homological-complex and regular-local-ring APIs.

**Checks.**

- For the coordinate axes in `A²_k`, `Tor₀=k` at the origin and higher Tor vanishes,
  giving multiplicity one.
- For `V=(y=0)` and `W=(y=x²)` in `A²_k`, the local tensor is `k[x]_(x)/(x²)`
  and higher Tor vanishes, giving multiplicity two, including in characteristic two.
- The disjoint lines `(x=0)` and `(x=1)` in `A²_k` have zero derived tensor and
  zero supported intersection cycle; there is no generic intersection point to sum over.

**The étale cycle class map `CH^r(X) → H^{2r}(X, Λ(r))`.** Let `X` be smooth of pure dimension `d` over a perfect
field `k, n` invertible, `Λ = ℤ/n` (or `O/πⁿ`, and with `ℤ_ℓ, ℚ_ℓ` coefficients by passage to the limit). The cycle
class of a codimension-`r` cycle `α` is `cl_X(α) :=` image of the fundamental class `s_α ∈ H^{2r}_{|α|}(X, Λ(r))` in
`H^{2r}(X, Λ(r))`. The map `cl_X : Z^r(X) → H^{2r}(X, Λ(r))` is additive and factors through rational equivalence,
giving `cl_X : CH^r(X) → H^{2r}(X, Λ(r))` (Chow groups imported from SchemeAndStackFoundations
§§5.1–5.6). For `r = 1` it is `c₁ ∘` (divisor `↦` line bundle); it is compatible with flat
pullback, with proper pushforward (Gysin maps of EtaleCohomologyFoundations §§0.10, F.6), with intersection
products (`cl(α · β) = cl(α) ∪ cl(β)` for properly intersecting cycles, hence a ring homomorphism `CH*(X) → ⊕ H^{2r}(X, Λ(r))` for `X` smooth quasi-projective), and with the Galois action (`cl` is `Gal(k̄/k)`-equivariant into
`H^{2r}(X_k̄, Λ(r))`). For `X` proper over `k̄, Tr_X(cl(point)) = 1`, so `Tr ∘ cl =` degree on 0-cycles. No comparison
between numerical and homological equivalence is asserted.

Work with the following additional hypotheses. `X` smooth over a perfect field; for the ring structure `X` smooth
quasi-projective (moving lemma imported with the intersection product from SchemeAndStackFoundations
§§5.1–5.6). Over an imperfect field the construction through the smooth locus is not asserted (inseparable
descent is outside this scope).

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.cycleClass`: `cl_X : Z^r(X) →+ H^{2r}(X, Λ(r))`, on Mathlib AlgebraicCycle `X ℤ` restricted to codimension `r`.

- `TauCeti.EtaleDuality.cycleClass_rationalEquiv`: `cl_X` vanishes on cycles rationally equivalent to zero, so factors through `CH^r(X)`.

- `TauCeti.EtaleDuality.cycleClass_divisor`: For a Cartier divisor `D, cl_X(D) = c₁(O(D))`.

- `TauCeti.EtaleDuality.cycleClass_pullback`: `cl(f^*α)=f^*cl(α)` for flat `f`; the arbitrary smooth-scheme refined formula is stated separately on Chow groups.

- `TauCeti.EtaleDuality.cycleClass_pushforward`: `cl(f_*α) = f_*cl(α)` for `f` proper between smooth schemes.

- `TauCeti.EtaleDuality.cycleClass_intersection`: `cl(α · β) = cl(α) ∪ cl(β)` for properly intersecting cycles.

- `TauCeti.EtaleDuality.trace_cycleClass_point`: `Tr_X(cl(x)) = 1` for a closed point of `X` proper over `k` separably closed; `Tr ∘ cl = deg` on 0-cycles.

- `TauCeti.EtaleDuality.cycleClass_galois`: `cl` is `Gal(k̄/k)`-equivariant into `H^{2r}(X_k̄, Λ(r))`; over `𝔽_q` geometric Frobenius fixes `cl(α)` in the twisted group.

- `TauCeti.EtaleDuality.chowCycleClass`: The additive map `CH^r(X)→H^{2r}(X,Λ(r))` induced by `cycleClass_rationalEquiv`.

- `TauCeti.EtaleDuality.chowCycleClass_refinedPullback`: For a morphism `f:Y→X` of smooth schemes, `cl(f^!α)=f^*cl(α)`, where `f^!` is `Chow.graphPullback f` from SchemeAndStackFoundations §5.6, using `Chow.gysin` from §5.5.

- `TauCeti.EtaleDuality.cycleClass_whole`: `cl_X([X])=1` in `H⁰(X,Λ)`, for smooth integral `X`.

A proof proceeds as follows.

Use the supported classes of fundamental-class and the weighted coherent-complex construction of SGA 4½
[Cycle] 2.3.1–2.3.8: for a perfect `O_X`-complex with support of codimension at least `r`, its class has generic
coefficient the alternating length of its homology. On a smooth `X` every coherent sheaf is locally perfect. The
trace construction agrees with the smooth-locus generator by 2.3.8(i), and uniqueness follows from semi-purity
away from the generic points.

For a principal-divisor generator `div_W(g)`, with `W` integral of codimension `r−1`, take the closure `Γ` of the
graph of `g` in `X×P¹`. For nonconstant `g, Γ` is integral and flat over the regular curve `P¹`. Its codimension-`r`
weighted class restricts at 0 and `∞` by the derived base-change identity [Cycle] 2.3.8(ii). Flatness over `P¹`
eliminates parameter `Tor` terms; the resulting Euler lengths are the two divisor fibres, including all singular
generic points. The normalization/valuation description of `div_W(g)`, imported with SchemeAndStackFoundations
§§5.1–5.5 rational equivalence, identifies their difference with the pushforward of `div_W(g)`. For constant `g`
both are zero.

The two section pullbacks `H^{2r}(X×P¹,Λ(r))→H^{2r}(X,Λ(r))` coincide: the projective-bundle decomposition
writes a class as a`+ξb`, and `ξ=c₁(O(1))` restricts to zero on either constant section. Therefore `cl(div_W(g))=0`
without deleting `Sing(W)`. This proves descent to `CH^r` integrally modulo `n`; a Chern-character argument
requiring factorial denominators would not suffice.

For properly intersecting `Z,W` use [Cycle] 2.3.8(iii): the cup product of their supported classes is the
weighted class of `O_Z⊗^L O_W`, with coefficient `Σ_i(−1)^i length Tor_i` at each generic intersection point. The
proof factors the diagonal graph through a smooth projection and a regular closed immersion, uses
compatibility of the weighted trace with both, and uses semi-purity only to compare generic supported classes.
Apply `chowIntersection_eq_eulerTor` to identify this supported cycle with the Chow
proper-intersection cycle. Over a perfect field [Cycle] 2.3.9 gives the same cup-product
formula with Euler–Tor multiplicities; ordinary intersection lengths suffice only when
higher Tor vanishes. The moving lemma extends the formula to the Chow ring for smooth
quasi-projective `X`.

Flat pullback is the derived base-change formula; proper pushforward follows from weighted-trace transitivity
and restriction to generic points, with contracted components zero by degree/dimension. Cartier divisors give
the Kummer `c₁` by the local regular-sequence case 2.3.8(i). Base change of the trace gives Galois equivariance,
and the normalized point trace gives degree on zero cycles. For arbitrary morphisms between separated smooth
schemes, the graph is a global regular closed immersion into their smooth product; SchemeAndStackFoundations
§5.6 / `Chow.graphPullback` applies through this global factorization, using §5.5 / `Chow.gysin`. Compatibility with its refined Gysin and
smooth pullback gives the refined Chow pullback formula.

Use [SGA4half] [Cycle] 2.3.1–2.3.8, pp. 144–149; 2.3.9–2.3.10, p. 150; [Milne-LEC] §23, pp. 139–142.

*Needs:* §1.1; EtaleCohomologyFoundations §§0.10, F.6; EtaleCohomologyFoundations §0.9;
SchemeAndStackFoundations §§5.1–5.6; `chowIntersection_eq_eulerTor`; `AlgebraicGeometry.AlgebraicCycle`;
`AlgebraicGeometry.AlgebraicCycle.map`; EtaleCohomologyFoundations §§0.9, F.7.

**Checks.**


- `TauCeti.EtaleDuality.cycleClass_hyperplane`: On `P^n` over an algebraically closed field, `cl(H) = h` and `cl` of a linear subspace of codimension `r` is `h^r`.

- `TauCeti.EtaleDuality.cycleClass_transverse_curves`: For two transverse curves `C, D` on a smooth projective surface over an algebraically closed field, `Tr(cl(C) ∪ cl(D)) =` #`(C ∩ D)`.

- `TauCeti.EtaleDuality.cycleClass_zero`: `cl_X(0) = 0`, and `cl_X([X]) = 1` for `r = 0`.

- `TauCeti.EtaleDuality.cycleClass_principal`: For `f` a nonzero rational function on `X, cl_X`(div `f`) `= 0`.

- `TauCeti.EtaleDuality.not_cycleClass_injective`: For an elliptic curve `E` over an algebraically closed field, the 0-cycle `[p] − [q] (p ≠ q)` is not rationally equivalent to 0 but `cl([p] − [q]) = 0` in `H²(E, Λ(1)): cl` is not injective (and nothing about numerical vs homological equivalence is asserted).

- Hyperplanes in `P^n: cl(H) = h` and `cl(H₁ ∩ … ∩ H_r) = h^r` for transverse hyperplanes.

- A transverse intersection of two curves on a surface: `Tr(cl(C) ∪ cl(D)) =` #`(C ∩ D)`.

- Self-intersection of a line on `P²: cl(L)² = h², Tr = 1 = deg N_{L/P²}`.

- A singular divisor (the nodal cubic in `P²`): `cl(C) = 3h` through the fundamental class built on the smooth locus.

**Cohomology of projective space and degrees.** For `X` smooth projective of pure dimension `d` over a separably
closed perfect field and a line bundle `L`, prove `Tr_X(c₁(L)^d)=(L^d)` modulo the coefficient modulus. Here `(L^d)`
is the integral Chow intersection number. This strengthens the supplied projective-space basis by
compatibility with degree and arbitrary line bundles. In particular the hyperplane class `h` on `P^m` satisfies
`Tr(h^m)=1`, and for a smooth divisor `i:Y→X` the degree formula is compatible with `i_*i^*x=cl(Y)∪x` and
`Tr_X(i_*y∪x)=Tr_Y(y∪i^*x)`.

Work with the following additional hypotheses. `k` separably closed; `X` smooth projective for the degree formula
(intersection number `(L^d)` from SchemeAndStackFoundations §§5.1–5.6).

Name the resulting statement `projectiveSpaceCohomology`.

A proof proceeds as follows.

Import the projective-space-basis target proved before projective-bundle freeness; the ring relation follows
from its basis and vanishing.

Degree formula: in `CH*(X)`, take the integral self-intersection `c₁(L)^d` and use `cl(c₁(L)) = c₁(L)`,
multiplicativity and `Tr ∘ cl =` degree on 0-cycles (cycle-class-map). The cycle-class construction of this
layer proves that compatibility. No division by a very-ample multiple modulo `n` is needed.

Hyperplane formulas: projection formula and `Tr_X ∘ i_* = Tr_Y` (EtaleCohomologyFoundations §§0.10, F.6).

Use [Milne-LEC] proof of Theorem 23.2, p. 139.

*Needs:* EtaleCohomologyFoundations §§0.10, F.6; EtaleCohomologyFoundations §§0.11, F.6;
SchemeAndStackFoundations §§5.1–5.6; §0.3; EtaleCohomologyFoundations §§0.9, F.7.

**Checks.**


- `P¹: H⁰ = Λ, H² = Λ(−1), Tr(h) = 1`.

- A smooth quadric surface `Q ⊂ P³: Tr(h²) = 2`.

### Examples

On `P²`, put `h=c₁(O(1))`. Whitney gives `c(O(1)⊕O(1))=1+2h+h²`. The square `h²` is a nonzero point class, although `c₂` of either line is zero. Its trace is 1. This checks both the rank convention and compatibility with intersection degree.

### Dependencies

Layer 0; EtaleCohomologyFoundations §§0.9–0.10 and F.6–F.7; AlgebraicVectorBundles L0; SchemeAndStackFoundations §§5.1–5.6.

## Layer 2: abstract hearts and the perverse functor calculus

### 2.1 The abstract heart and its cohomology

**The heart of a `t`-structure is an abelian category.** Let `C` be a pretriangulated category satisfying the
octahedral axiom (Mathlib's IsTriangulated) and let `t` be a `t`-structure on `C` in Mathlib's sense (aisles `t.le n`
and coaisles `t.ge n`, with `t.le n = t.le 0` shifted by `−n`). Its heart `C^♥ := t.le 0 ∩ t.ge 0`, as a full
subcategory with inclusion `ι`, is an abelian category, and `ι` is additive and fully faithful. Moreover: (i)
`Hom_C(ιA, (ιB)[m]) = 0` for `A, B` in the heart and every `m < 0`; (ii) a sequence `0 → A → B → D → 0` in `C^♥` is
short exact if and only if there is a morphism `ιD → (ιA)[1]` completing `ιA → ιB → ιD` to a distinguished
triangle, and that morphism is then unique; (iii) the heart is closed under extensions in `C`: if `X′ → X → X″ → X′[1]` is distinguished with `X′, X″` in the heart, so is `X`; (iv) a morphism `f : A → B` of the heart has kernel
`ι`-image `τ_{≤0}(Cone(f)[−1])` and cokernel `τ_{≥0}Cone(f)` computed with Mathlib's truncation functors.

Work with the following additional hypotheses. `C` pretriangulated with the octahedral axiom; `t` any `t`-structure
(no boundedness or nondegeneracy is needed). The abelian structure is the one supplied by Mathlib's
AbelianSubcategory criterion; the theorem is that its two hypotheses hold for the heart.

Name the resulting statement `heartAbelianSubcategory`; `heart_abelian` in `Suggested.lean` states existence of the abelian structure.

A proof proceeds as follows.

Negative `Hom` vanishing (i): `(ιB)[m]` lies in `t.ge (−m) ⊆ t.ge 1` for `m < 0`, so every map from `t.le 0` to it is
zero by the orthogonality axiom of the `t`-structure (BBD 1.3.1 (i)).

Admissibility: for `f : A → B` in the heart complete `ιA → ιB` to a triangle `ιA → ιB → S → (ιA)[1]`. The rotated
triangle `ιB → S → (ιA)[1]` shows `S ∈ t.le 0 ∩ t.ge (−1)`. The truncation triangle `τ_{≤−1}S → S → τ_{≥0}S` gives `K := (τ_{≤−1}S)[−1]` and `Q := τ_{≥0}S` in the heart with a distinguished triangle `K[1] → S → Q → K[2]`, which is
Mathlib's admissibleMorphism condition (BBD 1.3.6 proof, p.31; the diagram (1.2.2.1)).

The heart is closed under finite direct sums because both `t.le 0` and `t.ge 0` are closed under extensions (BBD
1.3.4, p.30: each is an orthogonal of the other), hence has finite products. Apply
`CategoryTheory.Triangulated.AbelianSubcategory.abelian` to `ι`.

(ii) and (iv) are the description of kernels, cokernels and short exact sequences in an admissible abelian
subcategory (BBD 1.2.4–1.2.5, the admissibility used in 1.3.6); (iii) is BBD 1.3.6's stability under
extensions, again from 1.3.4.

Use [BBD-1982] Théorème 1.3.6 and its proof, pp.31–32; 1.3.4, p.30.

*Needs:* `CategoryTheory.Triangulated.TStructure`; `CategoryTheory.Triangulated.TStructure.heart`;
`CategoryTheory.Triangulated.AbelianSubcategory.abelian`; `CategoryTheory.IsTriangulated`;
`CategoryTheory.Triangulated.TStructure.truncLE`; `CategoryTheory.Triangulated.TStructure.truncGE`.

**Checks.**


- For Mathlib's canonical `t`-structure DerivedCategory.TStructure.t on `D(A)`, the heart is equivalent to A through the degree-zero inclusion (BBD 1.3.6, Exemple, p.31).

- For the middle perverse `t`-structure on a point `Spec Ω` with `Ω` separably closed, the heart is the category of finitely generated `Λ`-modules in degree 0 (§2.4).

- Non-example: in `D(Ab)`, the full subcategory of complexes with cohomology in degrees `−1` and 0 is not the heart of any `t`-structure: it contains `A = (ℤ/2)[1]` and `B = ℤ/2`, and `Hom(B, A[−1]) = Hom(ℤ/2, ℤ/2) ≠ 0`, which (i) forbids.

**The cohomology functors of a `t`-structure.** Let `t` be a `t`-structure on a pretriangulated category `C` with the
octahedral axiom. The zeroth `t`-cohomology is `H⁰_t := τ_{≥0} ∘ τ_{≤0} : C → C^♥`, lifted to the heart
(canonically isomorphic to `τ_{≤0} ∘ τ_{≥0}`, BBD 1.3.5), and `H^m_t(X) := H⁰_t(X[m])`. Then: (a) `H⁰_t` is a
homological functor to the abelian heart: a distinguished triangle `X → Y → Z → X[1]` gives a long exact
sequence `… → H^m_t X → H^m_t Y → H^m_t Z → H^{m+1}_t X → …`; (b) for `X` in the heart, `H⁰_t X ≅ X` and `H^m_t X = 0`
for `m ≠ 0`; (c) if `X` lies in `t.le a ∩ t.ge b` for some `a, b` (`X` is `t`-bounded) then `X ≅ 0` if and only if `H^m_t X = 0` for all `m`, and `X ∈ t.le 0` if and only if `H^m_t X = 0` for all `m > 0` (dually for `t.ge 0`); (d) if `t` is
nondegenerate `(⋂ t.le n = ⋂ t.ge n = 0)` the same detection holds for every object (BBD 1.3.7).

Work with the following additional hypotheses. `C` pretriangulated with the octahedral axiom; `t` a `t`-structure.
Detection (c) needs `t`-boundedness of `X`; (d) needs nondegeneracy.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.TStructure.homologyZero`: `H⁰_t : C ⥤` heart(t), the lift of truncGE 0 ∘ truncLE 0 to the heart.

- `TauCeti.EtaleDuality.TStructure.homology`: `H^m_t := H⁰_t ∘ [m] : C ⥤` heart(t) for `m ∈ ℤ`.

- `TauCeti.EtaleDuality.TStructure.homologyZero_isHomological`: `H⁰_t` is a homological functor (Mathlib Functor.IsHomological) into the abelian heart.

- `TauCeti.EtaleDuality.TStructure.homologyZeroIsoOfMemHeart`: For `X` in the heart, `H⁰_t X ≅ X` naturally.

- `TauCeti.EtaleDuality.TStructure.homology_shift`: `H^m_t(X[a]) ≅ H^{m+a}_t(X)` naturally.

- `TauCeti.EtaleDuality.TStructure.isZero_of_homology_isZero`: If `X` is `t`-bounded and every `H^m_t X` is zero, then `X` is zero.

- `TauCeti.EtaleDuality.TStructure.isLE_iff_homology`: For `t`-bounded `X: X ∈ t.le n` iff `H^m_t X = 0` for all `m > n`; dually `X ∈ t.ge n` iff `H^m_t X = 0` for `m < n`.

- `TauCeti.EtaleDuality.TStructure.homologyCanonicalIso`: For DerivedCategory.TStructure.t on `D(A)`, under heart `≌ A, H^m_t` corresponds to DerivedCategory.homologyFunctor `A m`.

A proof proceeds as follows.

Define `H⁰_t` from Mathlib's truncation functors `t`.truncLE 0 and `t`.truncGE 0; the composite lands in the heart
because truncations preserve the opposite aisle (BBD 1.3.4–1.3.5), and lift it along the inclusion.

Homological: BBD 1.3.6, second half (pp.31–32): first for triangles inside `t.ge 0` and inside `t.le 0` by
representability, then the general case by the octahedral axiom.

(b): truncations of an object of the heart are itself. For (c), `a` is the upper bound and `b` the lower
bound. If `a < b`, orthogonality makes `X` zero. If `a = b`, then `X ≅ H^a_t(X)[−a]`. For `a > b`, induct on
`a − b` using `τ_{≤a−1}X → X → H^a_t(X)[−a]`; the first term lies in `t.le (a−1) ∩ t.ge b`.
This proves zero detection; applying it to the appropriate truncation gives aisle detection. (d): BBD 1.3.7.

Use [BBD-1982] Proposition 1.3.5 and Théorème 1.3.6, pp.30–32; Proposition 1.3.7, pp.32–33.

*Needs:* `CategoryTheory.Triangulated.TStructure`; `CategoryTheory.Triangulated.TStructure.truncLE`;
`CategoryTheory.Triangulated.TStructure.truncGE`; `CategoryTheory.Functor.IsHomological`;
`DerivedCategory.TStructure.t`; `DerivedCategory.homologyFunctor`;
`CategoryTheory.Triangulated.TStructure.bounded`.

**Checks.**


- `TauCeti.EtaleDuality.homology_canonical_shift`: For the canonical `t`-structure on `D(Ab): H¹_t((ℤ/2)[−1]) ≅ ℤ/2` and `H⁰_t((ℤ/2)[−1]) ≅ 0`.

- `TauCeti.EtaleDuality.homologyZero_zero`: `H⁰_t(0) ≅ 0`, and for `X` in the heart `H^m_t X ≅ 0` for `m ≠ 0`.

- `TauCeti.EtaleDuality.homology_canonical_compat`: For DerivedCategory.TStructure.t on `D(A), H^m_t ≅` DerivedCategory.homologyFunctor `A m` under heart `≌ A`.

- In `D(ℚ)`, take `X = ℚ[0] ⊕ ℚ[−1]`, with upper bound `a=1` and lower bound `b=0`.
  Its upper truncation triangle is `ℚ[0] → X → ℚ[−1] → ℚ[1]`. Truncating instead at `b−1=−1`
  gives first term zero and third term `X`, which is not `H⁰(X)[0]` since `H¹(X)=ℚ`.

- `TauCeti.EtaleDuality.homologyZero_not_triangulated`: `H⁰_t` does not commute with the shift: for `A ≠ 0` in `A, H⁰_t(A[1]) = 0` while `(H⁰_t A)[1]` is not zero; so `H⁰_t` is homological but not triangulated.

- `TauCeti.EtaleDuality.not_isZero_of_homology_unbounded`: For the degenerate `t`-structure with `t.le n = C` and `t.ge n = 0` for all `n` on a nonzero `C`, every `H^m_t` vanishes on a nonzero object, which is not `t`-bounded: the boundedness hypothesis in `isZero_of_homology_isZero` cannot be dropped.

- For Mathlib's canonical `t`-structure on `D(Ab): H¹_t((ℤ/2)[−1]) ≅ ℤ/2` and `H⁰_t((ℤ/2)[−1]) = 0`.

- For the middle perverse `t`-structure, `H^m_t` is perverse cohomology `pH^m` (§2.4); on a smooth curve `C, pH^{1}(Λ_C) ≅ Λ_C[1]` and `pH^m(Λ_C) = 0` for `m ≠ 1`.

### 2.2 Exact functors and recollement

**Left and right `t`-exact functors.** Let `(C₁, t₁), (C₂, t₂)` be pretriangulated categories with `t`-structures
and `T : C₁ → C₂` a triangulated functor. `T` is right `t`-exact if `T(t₁.le 0) ⊆ t₂.le 0`, left `t`-exact if `T(t₁.ge 0) ⊆ t₂.ge 0`, and `t`-exact if both; since `T` commutes with shifts, right `t`-exactness gives `T(t₁.le n) ⊆ t₂.le n` for
every `n`, and dually. The induced functor on hearts is `pT := H⁰_{t₂} ∘ T ∘ ι₁ : C₁^♥ → C₂^♥`. Then (BBD 1.3.17):
(i) `pT` is right exact if `T` is right `t`-exact and left exact if `T` is left `t`-exact; (ii) for `T` right `t`-exact and
`K ∈ t₁.le 0, H⁰_{t₂}`(TK) `≅ pT(H⁰_{t₁}K)` (dually for left `t`-exact and `K ∈ t₁.ge 0`); (iii) for an adjunction `T* ⊣ T_*` of triangulated functors, `T*` is right `t`-exact if and only if `T_*` is left `t`-exact, and then `pT* ⊣ pT_*`;
(iv) composites of left (right) `t`-exact functors are left (right) `t`-exact and `p(T₂ ∘ T₁) ≅ pT₂ ∘ pT₁`. A fully
faithful `t`-exact functor reflects the aisles (BBD 1.3.19).

Work with the following additional hypotheses. Triangulated functors between pretriangulated categories with
`t`-structures; (iii) needs an adjunction of triangulated functors (Mathlib Adjunction plus IsTriangulated on
both functors).

Use Mathlib's `T.RightTExact t₁ t₂`, `T.LeftTExact t₁ t₂` and `T.TExact t₁ t₂`, with
`T.CommShift ℤ` and `T.IsTriangulated`. Its `isLE_obj` and `isGE_obj` supply preservation in every degree;
the degree-zero constructors are `RightTExact.mk` and `LeftTExact.mk`.
The additional interface consists of the following maps and identities.

- `TauCeti.EtaleDuality.Functor.rightTExact_comp`: `T₁.RightTExact t₁ t₂` and `T₂.RightTExact t₂ t₃` give `(T₁ ⋙ T₂).RightTExact t₁ t₃`.

- `TauCeti.EtaleDuality.Functor.leftTExact_comp`: The corresponding composition result over `LeftTExact`.

- `TauCeti.EtaleDuality.Functor.isRightTExact_iff_isLeftTExact_of_adjunction`: For an adjunction `L ⊣ R` with both functors carrying `CommShift ℤ` and `IsTriangulated`, `L.RightTExact t₁ t₂ ↔ R.LeftTExact t₂ t₁`.

- `TauCeti.EtaleDuality.Functor.heartFunctor`: `pT := H⁰_{t₂} ∘ T ∘ ι₁` : heart`(t₁) ⥤` heart`(t₂)`.

- `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteColimits`: Under `T.RightTExact t₁ t₂`, `pT` is right exact (preserves finite colimits).

- `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteLimits`: Under `T.LeftTExact t₁ t₂`, `pT` is left exact (preserves finite limits).

- `TauCeti.EtaleDuality.Functor.heartAdjunction`: If `L ⊣ R` with `L.RightTExact t₁ t₂` (equivalently `R.LeftTExact t₂ t₁`), then `pL ⊣ pR` on the hearts.

- `TauCeti.EtaleDuality.Functor.heartFunctorComp`: Under `T₁.LeftTExact t₁ t₂` and `T₂.LeftTExact t₂ t₃`, `p(T₂ ∘ T₁) ≅ pT₂ ∘ pT₁`; dually under the two `RightTExact` hypotheses.

- `TauCeti.EtaleDuality.Functor.heartRestriction_exists`: For triangulated `C₁,C₂` and `T.TExact t₁ t₂`, there is a functor on the full-subcategory hearts whose composite with the target inclusion is naturally isomorphic to `ι₁ ⋙ T`, preserving finite limits and finite colimits. It identifies with `pT`.

A proof proceeds as follows.

Use the supplied degree-zero constructors and all-degree preservation. Composition follows by applying
the two native preservation instances successively.

(`i`), (ii): long exact sequences of `H_{t₂}` applied to `T` of a short exact sequence of the heart, using §2.1 (ii)
(BBD 1.3.17 proof, p.37).

(iii): `Hom(T*V, U) = Hom(V, T_*U)` and the characterisation of `t.le 0` as the left orthogonal of `t.ge 1` (BBD
1.3.4); the heart adjunction from `H⁰` of the adjunction maps (BBD 1.3.17 (iii), 1.3.18).

(iv): BBD 1.3.17 (iv) from (ii).

Use [BBD-1982] 1.3.16 and Proposition 1.3.17, pp.36–37; Remarque 1.3.18, p.37; 1.3.19, p.38.

*Needs:* §2.1; `CategoryTheory.Triangulated.TStructure`; `CategoryTheory.Functor.IsTriangulated`;
`CategoryTheory.Adjunction`; Mathlib `CategoryTheory.Functor.RightTExact`, `LeftTExact`, `TExact`.

**Checks.**


- `TauCeti.EtaleDuality.isTExact_id`: The identity functor is `t`-exact for every `t`-structure.

- `TauCeti.EtaleDuality.isRightTExact_shift_one`: The shift [1] is right `t`-exact for every `t`-structure.

- `TauCeti.EtaleDuality.not_isLeftTExact_shift_one`: For the canonical `t`-structure on `D(A)` with `A ≠ 0`, the shift [1] is not left `t`-exact: `A ∈ t.ge 0` but `A[1] ∉ t.ge 0`.

- Shift `[−1]` is left `t`-exact, and fails right `t`-exactness when the heart is nonzero. Thus neither `[1]` nor `[−1]` is `t`-exact in that case.

- `TauCeti.EtaleDuality.isTExact_mapDerivedCategory`: An exact functor `F : A ⥤ B` of abelian categories induces a `t`-exact functor `D(A) ⥤ D(B)` for the canonical `t`-structures.

- `TauCeti.EtaleDuality.not_isRightTExact_globalSections_projectiveLine`: Assume `Λ≠0`. Derived global sections `RΓ(P¹_Ω, −) : D(P¹_Ω, Λ) → D(Λ), Ω` separably closed, is left `t`-exact for the canonical `t`-structures but not right `t`-exact: `Λ(1)` in degree 0 has `H²(P¹, Λ(1)) ≅ Λ ≠ 0`.

- The identity of `C` is `t`-exact; the shift [1] is right `t`-exact for every `t`.

- For an exact functor `F : A → B` of abelian categories, the derived functor `D(A) → D(B)` is `t`-exact for the canonical `t`-structures.

**Recollement of triangulated categories.** A recollement `D_F → D → D_U` consists of pretriangulated categories
`D_F, D, D_U`, triangulated functors `i_* : D_F → D` and `j^* : D → D_U`, triangulated adjoints `i^* ⊣ i_* ⊣ i^!` and
`j_! ⊣ j^* ⊣ j_*` (all six triangulated, with the four adjunctions given), such that (a) `j^* ∘ i_* ≅ 0`; (b) for
every `K` in `D` the adjunction maps extend to distinguished triangles `j_!j^*K → K → i_*i^*K → (j_!j^*K)[1]` and
`i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]`; (c) the adjunction maps `i^*i_* → 1, 1 → i^!i_*, 1 → j^*j_!, j^*j_* → 1`
are isomorphisms, so `i_*, j_!` and `j_*` are fully faithful (BBD 1.4.3). Consequences: `i^*j_! ≅ 0, i^!j_* ≅ 0, Hom(j_!B, i_*A) = 0 = Hom(i_*A, j_*B)`; the connecting maps of the triangles in (b) are unique; `i_*` identifies
`D_F` with the full subcategory of `D` on which `j^*` vanishes. The basic instance is constructible étale sheaves on
`X` with a closed subscheme `Z` and open complement `U`, with `i_* = i_!` and `j^! = j^*`. For any noetherian `Λ`
killed by an invertible `n`, use EnhancedDerivedSheaves §0.4's `ClassicalDerived.functorCoherence` for `j^* ⊣ Rj_*`
and exact extension by zero, and EtaleCohomologyFoundations §0.7's `ClassicalAlgebraic.supportLocalization` for
`i^!` and the triangles. The bounded constructible preservation in ofClosedOpen below is independent of
self-injectivity; §0.2 additionally identifies the dual recollement when `Λ` is self-injective.

Work with the following additional hypotheses. `D_F, D, D_U` pretriangulated; the six functors triangulated;
adjunctions part of the data.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.Recollement`: The structure: `i_*, j^*`, the adjoints `i^*, i^!, j_!, j_*`, the four adjunctions, `j^*i_* ≅ 0`, the two distinguished triangles and the full faithfulness isomorphisms.

- `TauCeti.EtaleDuality.Recollement.triangleLowerShriek`: The functorial distinguished triangle `j_!j^*K → K → i_*i^*K → (j_!j^*K)[1]` built from the counit and unit.

- `TauCeti.EtaleDuality.Recollement.triangleUpperShriek`: The functorial distinguished triangle `i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]`.

- `TauCeti.EtaleDuality.Recollement.upperStar_lowerShriek_isZero`: `i^* ∘ j_! ≅ 0` and `i^! ∘ j_* ≅ 0`.

- `TauCeti.EtaleDuality.Recollement.essImage_lowerStar`: `K` is in the essential image of `i_*` iff `j^*K ≅ 0`.

- `TauCeti.EtaleDuality.Recollement.op`: The opposite recollement of `D_F^op → D^op → D_U^op`, exchanging `j_!` with `j_*` and `i^*` with `i^!`.

- `TauCeti.EtaleDuality.Recollement.ofClosedOpen`: For `X` separated of finite type over a field `k`, `Z ⊂ X` closed with open complement `U`, and `Λ` noetherian killed by `n ≥ 1` invertible in `k`, construct the recollement `D^b_c(Z, Λ) → D^b_c(X, Λ) → D^b_c(U, Λ)`. Include bounded constructible preservation of `Rj_*` for these noetherian coefficients and deduce it for `i^!` from the supported triangle. The ambient functors and adjunctions are `ClassicalDerived.functorCoherence` (EnhancedDerivedSheaves §0.4) and `ClassicalAlgebraic.supportLocalization` (EtaleCohomologyFoundations §0.7); self-injectivity is unnecessary.

- `TauCeti.EtaleDuality.Recollement.ofClosedOpen_upperStar`: In ofClosedOpen, `j^*` is restriction to `U` and `i_*` is pushforward along the closed immersion.

A proof proceeds as follows.

Record the functors and adjunctions as data, and (a)–(c) as properties (BBD 1.4.3, (1.4.3.1)–(1.4.3.5)).

`i^*j_! ≅ 0` and `i^!j_* ≅ 0` by adjunction from (a); uniqueness of the connecting maps because `Hom(j_!j^*K, i_*i^*K[−1]) = 0` (BBD 1.1.10 with (1.4.3.3)).

The kernel of `j^*` is the essential image of `i_*`: the second triangle of (b) for `K` with `j^*K = 0`.

For ofClosedOpen, use recollementAdjunctions (§0.2), including its noetherian-coefficient finiteness argument
for `Rj_*` and the localization construction of `i^!`. These give the six functors on `D^b_c` without
self-injectivity or an unbounded proper-support lift.

Use [BBD-1982] 1.4.3, (1.4.3.1)–(1.4.3.5), pp.44–45; 1.4.2.1, p.44; Remarque 1.4.8, p.48.
For constructible preservation use §0.2 and [SGA4half] [Th. finitude] §§1–2.

*Needs:* §0.2; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3;
EtaleCohomologyFoundations §F.3 (`VanishingCycles.etaleFiniteness`); EnhancedDerivedSheaves §0.4
(`ClassicalDerived.functorCoherence`); `CategoryTheory.Functor.IsTriangulated`;
`CategoryTheory.Adjunction`.

**Checks.**


- `TauCeti.EtaleDuality.recollement_ofClosedOpen_empty`: For `Z = ∅, i_* = 0` and `j^* : D^b_c(X, Λ) → D^b_c(U, Λ)` is an equivalence.

- `TauCeti.EtaleDuality.recollement_triangle_affineLine`: For `X = 𝔸¹, Z = {0}, K = Λ_X`: triangleLowerShriek is `j_!Λ_{𝔾_m} → Λ_{𝔸¹} → i_*Λ_0 →`.

- `TauCeti.EtaleDuality.recollement_ofClosedOpen_upperStar_eq`: In Recollement.ofClosedOpen, `j^*` is the restriction functor of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 along `U ⊂ X`.

- `TauCeti.EtaleDuality.not_recollement_without_adjoints`: The inclusion of finite-dimensional `F`-vector spaces into all `F`-vector spaces (as derived categories in degree 0) is fully faithful but has no right adjoint: a right adjoint `R` would give `Hom(F, R(V)) ≅ Hom(F, V) = V` for infinite-dimensional `V`, impossible since `Hom(F, R(V)) = R(V)` is finite-dimensional. Full faithfulness alone does not give a recollement.

- For the étale recollement of `Z = {0} ⊂ X = 𝔸¹` with `U = 𝔾_m`, the first triangle for `Λ_X` is the localization triangle `j_!Λ_U → Λ_X → i_*Λ_0 →`.

- For self-injective `Λ`, duality on `D^b_c` (§0.2) maps the étale recollement to the opposite recollement, exchanging `j_!` with `j_*` and `i^*` with `i^!`.

**Gluing `t`-structures along a recollement.** Let `D_F → D → D_U` be a recollement (§2.2) of categories
satisfying the octahedral axiom, with `t`-structures `t_F` and `t_U`. Put `D^{≤0} := {K : j^*K ∈ D_U^{≤0}, i^*K ∈ D_F^{≤0}}` and `D^{≥0} := {K : j^*K ∈ D_U^{≥0}, i^!K ∈ D_F^{≥0}}`. Then: (a) `(D^{≤0}, D^{≥0})` is a `t`-structure on
`D`, the glued `t`-structure (BBD 1.4.10); conversely a `t`-structure on `D` is glued from `t`-structures on `D_U` and `D_F`
exactly when `j_!j^*` is right `t`-exact (BBD 1.4.12); (b) `j_!, i^*` are right `t`-exact, `j_*, i^!` are left `t`-exact,
`j^*, i_*` are `t`-exact, and `(pj_!, pj^*, pj_*), (pi^*, pi_*, pi^!)` are adjoint triples of functors between the
hearts (BBD 1.4.16); (c) on hearts `pj^* ∘ pi_* = 0, pi^* ∘ pj_! = 0, pi^! ∘ pj_* = 0`, and for `A` in the heart `C`
the sequences `pj_!pj^*A → A → pi_*pi^*A → 0` and `0 → pi_*pi^!A → A → pj_*pj^*A` are exact; the essential image
of `pi_*` is the thick subcategory of A with `pj^*A = 0`, and `pj^*` identifies `C_U` with the quotient `C/C_F` (BBD
1.4.17–1.4.18); (d) for `A` in `C` there are exact sequences `0 → pi_*H^{−1}(i^*A) → pj_!pj^*A → A → pi_*pi^*A → 0`
and `0 → pi_*pi^!A → A → pj_*pj^*A → pi_*H¹(i^!A) → 0` (BBD 1.4.19); (e) for `B` in `D_U` and `p ∈ ℤ` there is, up to
unique isomorphism, a unique extension `X` of `B (j^*X ≅ B)` with `i^*X ∈ D_F^{≤p−1}` and `i^!X ∈ D_F^{≥p+1}`, namely
the relative truncation `τ^F_{≤p−1}j_*B` (BBD 1.4.14); (f) the glued `t`-structure is nondegenerate iff `t_U` and
`t_F` are (1.4.11), and it is bounded when `t_U` and `t_F` are bounded.

Work with the following additional hypotheses. A recollement whose three categories satisfy the octahedral
axiom; `t`-structures `t_U, t_F`.

Name the resulting statement `gluingTStructures`.

A proof proceeds as follows.

Orthogonality: for `X ∈ D^{≤0}, Y ∈ D^{≥1}` use the first triangle of `X` and adjunction: `Hom(i_*i^*X, Y) = Hom(i^*X, i^!Y) = 0` and `Hom(j_!j^*X, Y) = Hom(j^*X, j^*Y) = 0` (BBD 1.4.10, axiom (i)).

Truncation triangles: choose `Y → X → j_*τ_{≥1}j^*X` and `A → Y → i_*τ_{≥1}i^*Y` and apply the octahedral axiom;
applying `j^*, i^*, i^!` to the octahedron shows `A ∈ D^{≤0}, B ∈ D^{≥1}` (BBD 1.4.10, axiom (iii), pp.48–49).

(b) from the definitions and the adjoint criterion of §2.2 (BBD 1.4.16); (c)–(d) from the two triangles of the
recollement and long exact sequences of `t`-cohomology (§2.1; BBD 1.4.17–1.4.19).

(e): the triangle `i_*i^*X → j_!B[1]` ... of BBD 1.4.14 shows any such `X` is `τ^F_{≤p−1}j_*B`, which has the
required bounds; (f) boundedness: if `B ∈ D_U^{[a,b]}` and the `F`-part is bounded, the defining conditions are
met in a finite range.

Use [BBD-1982] Théorème 1.4.10, p.48; Remarque 1.4.11, Proposition 1.4.12, p.49; Proposition 1.4.14, p.51;
[BBD-1982] Propositions 1.4.16–1.4.18, pp.51–52; Lemme 1.4.19, p.52.

*Needs:* §2.1; `CategoryTheory.Triangulated.TStructure`; `CategoryTheory.IsTriangulated`.

**Checks.**


- With `D_F = 0` the glued `t`-structure on `D ≃ D_U` is `t_U`; with `D_U = 0` it is `t_F`.

- For `Z = {0} ⊂ 𝔸¹` with `U = 𝔾_m`, gluing the middle perverse `t`-structure on all `D^b_c(U, Λ)` to the natural `t`-structure on `D^b_c(Z, Λ)` gives the middle perverse `t`-structure on all `D^b_c(𝔸¹, Λ)` (§2.4; EtaleCohomologyFoundations §F.8). The object `Λ_{𝔸¹}[1]` lies in its heart. On the subcategory of `D^b_c(U, Λ)` with lisse cohomology, middle perversity agrees with the natural `t`-structure shifted by one; that description does not extend to every constructible complex on `U`.

- Over algebraically closed `k` with `ℓ ≠ char(k)` and `Λ = 𝔽_ℓ`, let `a:{1}→𝔸¹` and `P=a_*Λ[0]`. The support/cosupport conditions make `P` middle perverse. Its restriction `j^*P` is a nonzero degree-zero skyscraper on `𝔾_m`, outside the shifted natural heart `Sh_c(𝔾_m,Λ)[1]`. Hence gluing that shifted natural `t`-structure on the full open category to the natural one at `{0}` excludes `P` from its heart, although `Λ_{𝔸¹}[1]` belongs to both glued hearts.

- Gluing the natural `t`-structures (shift 0 on both pieces) gives the natural `t`-structure of `D^b_c(X, Λ)`.

### 2.3 Abstract intermediate extension and torsion tilting

**Intermediate extension in a recollement.** In a recollement with glued `t`-structure (§2.2), with hearts `C_U, C, C_F`, the intermediate extension `j_!* : C_U → C` sends `B` to the image, in the abelian category `C`, of the map
`pj_!B → pj_*B` adjoint to the identity of `B` (BBD 1.4.22). Then: (a) `j^*j_!*B ≅ B`; (b) `j_!*B ≅ τ^F_{≤−1}j_*B ≅ τ^F_{≥1}j_!B`, and similarly `pj_!B ≅ τ^F_{≤−2}j_*B, pj_*B ≅ τ^F_{≤0}j_*B` (BBD 1.4.23); (c) `j_!*B` is the unique
extension `X` of `B` in `D` with `i^*X ∈ D_F^{≤−1}` and `i^!X ∈ D_F^{≥1}` (BBD 1.4.24), equivalently the unique
extension of `B` in `C` with no nonzero subobject or quotient in the essential image of `pi_*` (BBD 1.4.25); (d)
`j_!*` is a fully faithful functor and sends simple objects to simple objects; (e) every simple object of `C` is
either `pi_*S` with `S` simple in `C_F` or `j_!*S` with `S` simple in `C_U` (BBD 1.4.26).

Work with the following additional hypotheses. A recollement of categories satisfying the octahedral axiom
with the glued `t`-structure.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.Recollement.intermediateExtension`: `j_!*` : heart`(t_U) ⥤` heart(glued), `B ↦` image`(pj_!B → pj_*B)`.

- `TauCeti.EtaleDuality.Recollement.intermediateExtension_eq_image`: `j_!*B ≅` Abelian.image of the canonical map `pj_!B ⟶ pj_*B`.

- `TauCeti.EtaleDuality.Recollement.upperStar_intermediateExtension`: `j^* ∘ j_!* ≅ 𝟭` on heart`(t_U)`.

- `TauCeti.EtaleDuality.Recollement.intermediateExtension_iso_truncation`: `j_!*B ≅ τ^F_{≤−1}(j_*B) ≅ τ^F_{≥1}(j_!B)` (relative truncations).

- `TauCeti.EtaleDuality.Recollement.intermediateExtension_unique`: An extension `X` of `B` with `i^*X ∈ D_F^{≤−1}` and `i^!X ∈ D_F^{≥1}` is isomorphic to `j_!*B` by a unique isomorphism compatible with the identifications `j^*X ≅ B`.

- `TauCeti.EtaleDuality.Recollement.intermediateExtension_no_sub_quotient`: `j_!*B` has no nonzero subobject and no nonzero quotient in the essential image of `pi_*`.

- `TauCeti.EtaleDuality.Recollement.intermediateExtension_fullyFaithful`: `j_!*` is fully faithful.

- `TauCeti.EtaleDuality.Recollement.intermediateExtension_simple`: `j_!*` sends simple objects to simple objects.

- `TauCeti.EtaleDuality.Recollement.simple_classification`: Every simple object of the glued heart is `pi_*S` (`S` simple in `C_F`) or `j_!*S` (`S` simple in `C_U`), and these are distinct.

A proof proceeds as follows.

Define `j_!*` as the image of the canonical map `pj_!B → pj_*B` in the abelian heart (§2.1), the map being `H⁰` of
`j_!B → j_*B` (BBD (1.4.6.2), (1.4.22.1)).

(b): BBD 1.4.23 from 1.4.14 (§2.2 (e)) with `p = −1, −2, 0`.

(c): 1.4.24 is 1.4.14 for `p = 0`; 1.4.25 reformulates it, because `pi^*X` (resp. `pi^!X`) is the largest quotient
(resp. subobject) of `X` in `C_F` (BBD 1.4.17.1).

(d): a map `φ : B → B′` induces a map of images; restriction is faithful on objects with no `C_F`-sub or quotient
because kernel and cokernel defects would be supported on `F` (1.4.25); simple objects by 1.4.26.

(e): BBD 1.4.26 — a simple object of `C` either lies in the thick subcategory `C_F` or has simple image in `C/C_F`
and no sub or quotient in `C_F`.

Use [BBD-1982] Définition 1.4.22, Proposition 1.4.23, p.54; Corollaires 1.4.24–1.4.25, Proposition 1.4.26,
p.55.

*Needs:* §2.2; §2.1; `CategoryTheory.Abelian.image`; `CategoryTheory.Simple`.

**Checks.**


- `TauCeti.EtaleDuality.intermediateExtension_closed_zero`: If `D_F = 0` then `j_!*` is a quasi-inverse of the equivalence `pj^*` on hearts.

- `TauCeti.EtaleDuality.intermediateExtension_affineLine`: For the étale recollement `𝔾_m ⊂ 𝔸¹ ⊃ {0}` with field coefficients, `j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1]`.

- `TauCeti.EtaleDuality.not_lowerShriek_eq_intermediateExtension`: For `𝔾_m ⊂ 𝔸¹` with field coefficients, `pj_!(Λ[1])` has the nonzero subobject `i_*Λ_0`, so `pj_!(Λ[1]) ≇ j_!*(Λ[1])`.

- `TauCeti.EtaleDuality.intermediateExtension_simple_test`: `j_!*` of a simple object of `C_U` is simple in `C`.

- For `j : 𝔾_m → 𝔸¹` with field coefficients, `j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1]`, and the exact sequence `0 → i_*Λ_0 → pj_!(Λ[1]) → Λ_{𝔸¹}[1] → 0` shows `pj_! ≠ j_!*`.

**Tilting a `t`-structure along a torsion theory.** Let `t` be a `t`-structure on a pretriangulated category `D` with
heart `C`, and `(T, F)` a torsion theory on `C` (`Hom(T, F) = 0` for `T ∈ T, F ∈ F`, and every `A` in `C` has a short exact
sequence `0 → A_T → A → A_F → 0` with `A_T ∈ T, A_F ∈ F`). The tilt `t⁺` is defined by `t⁺.le 0 := {X ∈ t.le 1 : H¹_t X ∈ T}` and `t⁺.ge 0 := {X ∈ t.ge 0 : H⁰_t X ∈ F}`. Then `t⁺` is a `t`-structure on `D` with `t.le 0 ⊆ t⁺.le 0 ⊆ t.le 1`
and `t.ge 1 ⊆ t⁺.ge 0 ⊆ t.ge 0`; its heart `C⁺` carries the torsion theory `(F, T[−1])`; tilting `t⁺` along it gives `t`
shifted by one. If `C` is `O`-linear (`O` a discrete valuation ring with uniformizer `λ`) and noetherian, then
(`λ`-power-torsion objects, objects on which `λ` is a monomorphism) is a torsion theory on `C`; if `C` is artinian,
(divisible objects, torsion objects) is one.

Work with the following additional hypotheses. `D` pretriangulated with the octahedral axiom; `(T, F)` a torsion
theory on the heart.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.TStructure.tilt`: `t⁺ :=` the tilt of `t` along a torsion theory `(T, F)` of its heart.

- `TauCeti.EtaleDuality.TStructure.tilt_le_iff`: `X ∈ t⁺.le 0` iff `X ∈ t.le 1` and `H¹_t X ∈ T`.

- `TauCeti.EtaleDuality.TStructure.tilt_ge_iff`: `X ∈ t⁺.ge 0` iff `X ∈ t.ge 0` and `H⁰_t X ∈ F`.

- `TauCeti.EtaleDuality.TStructure.le_le_tilt`: `t.le 0 ⊆ t⁺.le 0 ⊆ t.le 1`.

- `TauCeti.EtaleDuality.TStructure.ge_tilt_ge`: `t.ge 1 ⊆ t⁺.ge 0 ⊆ t.ge 0`.

- `TauCeti.EtaleDuality.TStructure.TorsionTheory`: A torsion theory on an abelian category: full subcategories `(T, F)` with `Hom(T, F) = 0` and the torsion sequences.

- `TauCeti.EtaleDuality.TStructure.TorsionTheory.ofNoetherianLinear`: For an `O`-linear noetherian abelian category, (`λ`-power torsion, `λ`-torsion-free) is a torsion theory.

- `TauCeti.EtaleDuality.TStructure.tilt_tilt`: Tilting `t⁺` along `(F, T[−1])` recovers `t` shifted by one.

A proof proceeds as follows.

Orthogonality: for `X ∈ t⁺.le 0, Y ∈ t⁺.ge 1, Hom(X, Y) = Hom(τ_{≥1}X, τ_{≤1}Y) = Hom_C(H¹X, H¹Y) = 0` since `H¹X ∈ T` and `H¹Y ∈ F` (Juteau Prop. 1.3.6 (i)).

Truncation: split `H¹_t X` by the torsion sequence and lift it to a triangle with BBD 1.3.15 (Juteau Prop. 1.3.6
(iii)).

The noetherian/artinian torsion theories: the chain `ker(λ^n)` stabilises (resp. `im(λ^n)`) (Juteau Props.
1.3.4–1.3.5).

Use [Juteau-2009] Definition 1.3.1, Propositions 1.3.3–1.3.6, pp.42–44 (arXiv:0901.3671v1); [BBD-1982]
3.3.1–3.3.2, p.98; 3.3.4, p.99.

*Needs:* §2.1; `CategoryTheory.Triangulated.TStructure`.

**Checks.**


- `TauCeti.EtaleDuality.tilt_point_integral`: On `D^b_fg(ℤ_ℓ)` with (torsion, torsion-free): `(ℤ/ℓ)[−1] ∈` heart`(t⁺), (ℤ/ℓ)[0] ∉` heart`(t⁺), ℤ_ℓ[0] ∈` heart`(t⁺)`.

- `TauCeti.EtaleDuality.tilt_torsion_zero`: If `T = 0` (so `F = C`) then `t⁺ = t`.

- `TauCeti.EtaleDuality.tilt_free_zero`: If `F = 0` (so `T = C`) then `t⁺.le 0 = t.le 1`: the tilt is the shift of `t` by one.

- `TauCeti.EtaleDuality.tilt_dual_compat`: `RHom_{ℤ_ℓ}(−, ℤ_ℓ)` maps the natural `t.le 0` of `D^b_fg(ℤ_ℓ)` onto `t⁺.ge 0` (BBD 3.3.1).

- `TauCeti.EtaleDuality.not_torsionTheory_divisible_free`: On finitely generated `ℤ_ℓ`-modules, (divisible, torsion) is not a torsion theory: the only divisible submodule of `ℤ_ℓ` is 0 and `ℤ_ℓ/0 = ℤ_ℓ` is not torsion, so `ℤ_ℓ` has no torsion sequence (the category is noetherian, not artinian).

- For `D = D^b_fg(ℤ_ℓ)` with the natural `t`-structure and (torsion, torsion-free), the heart of `t⁺` contains `ℤ_ℓ[0]` and `(ℤ/ℓ)[−1]` but not `(ℤ/ℓ)[0]`; this is BBD's `t`-structure on `D_c(pt, ℤ)` in 3.3.1.

### 2.4 Noetherian torsion coefficients and descent

Extend the finite-coefficient perverse construction to every Noetherian ring annihilated by an integer invertible on the base, and establish étale descent.

**The middle perverse `t`-structure on constructible complexes.** Let `k` be a field, `n` invertible in `k, X`
separated of finite type over `k` and `Λ` a noetherian ring with `nΛ = 0`. For a point `x` of `X` let `i_x : x → X` be the
inclusion, factored as `x → {x}^− → X`, and put `i_x^* K :=` (`K` restricted to `x`) and `i_x^! K :=` (`i^!K` restricted
to the generic point `x` of `{x}^−`) for `i : {x}^− → X` closed; their geometric fibres at `x̄` are the stalk and
costalk of `K` at `x`. Define `pD^{≤0}(X, Λ) := {K ∈ D^b_c(X, Λ) : ℋ^m(i_x^*K) = 0` for `m > −dim(x)`, for every point
`x`} (4.0.1), equivalently `dim Supp ℋ^m(K) ≤ −m` for every `m` (4.0.1′), and `pD^{≥0}(X, Λ) := {K ∈ D^b_c(X, Λ) : ℋ^m(i_x^!K) = 0` for `m < −dim(x)`, for every point `x`} (4.0.2), with `pD^{≤a} := pD^{≤0}[−a]` and `pD^{≥a} := pD^{≥0}[−a]`. Then `(pD^{≤0}, pD^{≥0})` is a `t`-structure on `D^b_c(X, Λ)`, the middle perverse `t`-structure. It is
bounded: `D^{≤−dim X} ⊆ pD^{≤0} ⊆ D^{≤0}` and `D^{≥0} ⊆ pD^{≥0} ⊆ D^{≥−dim X}` for the natural `t`-structure. For a
finite partition of the reduced perfect-base change into smooth equidimensional locally closed strata `S`, transported to `X` by topological invariance, such that every `ℋ^m(i_S^*K)` and `ℋ^m(i_S^!K)` is locally constant, `K ∈ pD^{≤0}` iff `ℋ^m(i_S^*K) = 0`
for `m > −dim S` on every stratum, and `K ∈ pD^{≥0}` iff `ℋ^m(i_S^!K) = 0` for `m < −dim S` on every stratum. The
`t`-structure is étale local, restriction of scalars along a finite `Λ → Λ′` is `t`-exact, extension of the base
field is `t`-exact, and for `X = Spec Ω` with `Ω` separably closed it is the natural `t`-structure of `D^b_c(Spec Ω, Λ) ≃ D^b_fg(Λ)`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. No
smoothness of `X` and no perfectness of `k` are assumed: the proof reduces to the perfect closure by topological
invariance of the étale site. BBD write the proof for `ℤ/ℓ, ℤ/ℓ^n` and finite `ℤ/ℓ^n`-algebras (2.2.10–2.2.13);
for a general noetherian `Λ` killed by `n` the proof below runs the same gluing induction on the specific
complexes involved.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.perverseLE`: The upper aisle: `K` with `ℋ^m(i_x^*K) = 0` for `m > −dim(x)` at every point `x`.

- `TauCeti.EtaleDuality.perverseGE`: The lower aisle: `K` with `ℋ^m(i_x^!K) = 0` for `m < −dim(x)` at every point `x`.

- `TauCeti.EtaleDuality.perverseTStructure`: The `t`-structure on `D^b_c(X, Λ)` with le `0 =` perverseLE and ge `0 =` perverseGE.

- `TauCeti.EtaleDuality.perverseTStructure_le_iff_support`: `K ∈ pD^{≤0}` iff `dim Supp ℋ^m(K) ≤ −m` for every `m`.

- `TauCeti.EtaleDuality.perverseTStructure_le_iff_strata`: For a stratification adapted to `K` (lisse `ℋ^m(i_S^*K), ℋ^m(i_S^!K)`): `K ∈ pD^{≤0}` iff `ℋ^m(i_S^*K) = 0` for `m > −dim S`, and `K ∈ pD^{≥0}` iff `ℋ^m(i_S^!K) = 0` for `m < −dim S`.

- `TauCeti.EtaleDuality.perverseTStructure_bounded`: `D^{≤−dim X} ⊆ pD^{≤0} ⊆ D^{≤0}` and `D^{≥0} ⊆ pD^{≥0} ⊆ D^{≥−dim X}`; every `K` lies in some `pD^{[a,b]}`.

- `TauCeti.EtaleDuality.perverseTStructure_glue`: For `Z ⊂ X` closed with complement `U`, the perverse `t`-structure of `X` is the gluing of those of `U` and `Z` along Recollement.ofClosedOpen.

- `TauCeti.EtaleDuality.perverseTStructure_etale_local`: For an étale surjective `u : V → X, K ∈ pD^{≤0}` (resp. `pD^{≥0}`) iff `u^*K` is.

- `TauCeti.EtaleDuality.perverseTStructure_restrictScalars`: Restriction of scalars along a finite ring map `Λ → Λ′` (so that constructibility is kept) is `t`-exact for the perverse `t`-structures.

- `TauCeti.EtaleDuality.perverseTStructure_baseField`: For a field extension `K/k`, pullback to `X_K` is `t`-exact (BBD 4.2.9).

- `TauCeti.EtaleDuality.perverseTStructure_point`: For `X = Spec Ω, Ω` separably closed, the perverse `t`-structure is the natural one under `D^b_c ≃ D^b_fg(Λ)`.

- `TauCeti.EtaleDuality.perverseTStructure_perfectClosure`: Pullback along `X_{k^perf} → X` is a `t`-exact equivalence of the perverse `t`-structures.

A proof proceeds as follows.

Replace `X` by `(X_{k^perf})_red`: both reduction and `X_{k^perf} → X` are universal homeomorphisms, so their composite induces an equivalence of étale sites
(required from EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above, Stacks Tag 04DY),
preserving stalks, costalks, constructibility and `dim(x)` (SchemeAndStackFoundations §0.7).

On a smooth equidimensional stratum `S` of dimension `e`, for complexes with locally constant cohomology the
pointwise conditions are the natural `t`-structure shifted by `e`: the stalk condition at the generic point gives
`D^{≤−e}`, and smooth-pair purity (EtaleCohomologyFoundations §§0.10, F.6) gives `i_x^!L ≅ i_x^*L(−c)[−2c]` for `c = e − dim(x)`, so the costalk condition is implied by the one at the generic point (§2.4).

Construction of the truncation triangle of a given `K` by noetherian induction on the reduced perfect-base change:
remove intersections of distinct irreducible components and shrink their smooth loci to obtain a dense open
`U = ⊔_i U_i`, a finite disjoint union of smooth equidimensional opens on which the cohomology sheaves of `K`
are lisse. On each `U_i` use natural truncation shifted by `dim U_i`, and assemble these triangles on `U`.
Glue with the perverse `t`-structure of the closed complement (induction) along the
open–closed recollement by the octahedral argument of §2.2 (BBD 1.4.10 and 2.1.3). For every noetherian `Λ`
killed by `n` invertible in `k`, the ambient adjunction `j^* ⊣ Rj_*` and exact extension by zero are
EnhancedDerivedSheaves §0.4's `ClassicalDerived.functorCoherence`; `i^!` and the localization triangles are
EtaleCohomologyFoundations §0.7's `ClassicalAlgebraic.supportLocalization`.
Recollement.ofClosedOpen (§2.2) uses §0.2's noetherian-coefficient finiteness argument for `Rj_*`, whose
supported triangle proves bounded constructibility of `i^!`; thus the construction stays in `D^b_c` without
self-injectivity or a general unbounded proper-support lift.

Orthogonality `Hom(pD^{≤0}, pD^{≥1}) = 0` by dévissage along the same stratification: for `i_S` the stratum
inclusions, `Hom(i_{S!}i_S^*K, L) = Hom(i_S^*K, i_S^!L)` vanishes by the shifted natural bounds on `S` (BBD
2.1.4).

Independence of choices and the stratum criterion: refining the stratification does not change the conditions,
by purity (BBD 2.2.11, citing SGA 4 XVI 3.7 for the analogue of 2.1.14) and the pointwise form 2.2.12 with the
corrected inequalities of the pointwise inequalities above; the stratum criterion is the one used in the proof
of BBD 4.2.8, p.112.

Bounds (2.1.2.1); étale locality from the pointwise form and the quasi-finite invariance of `dim(x)`;
restriction of scalars commutes with stalks and with `i^!` (EtaleCohomologyFoundations §§F.0–F.1, 0.7;
EnhancedDerivedSheaves §§0.1–0.3); base-field extension: BBD 4.2.9; the point: `dim(x) = 0` and costalk `=` stalk.

Use [BBD-1982] 4.0, (4.0.1)–(4.0.2) and (4.0.1′), p.102; [BBD-1982] 2.2.9–2.2.13, pp.69–71; [BBD-1982]
Proposition 2.1.3, Corollaire 2.1.4, p.57; (2.1.2.1), p.57; [BBD-1982] proof of Proposition 4.2.8, p.112;
4.2.9, p.112; [Stacks] Tag 04DY (Étale Cohomology, Section 59.45).

*Needs:* §2.2; SchemeAndStackFoundations §0.7; EtaleCohomologyFoundations §§F.0–F.1, 0.7;
EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; §0.2;
EtaleCohomologyFoundations §§0.10, F.6; `CategoryTheory.Triangulated.TStructure`;
`CategoryTheory.Triangulated.TStructure.bounded`; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site
contract above.

**Checks.**


- `TauCeti.EtaleDuality.perverse_point_eq_canonical`: For `X = Spec Ω, Ω` separably closed: `pD^{≤0} = D^{≤0}` under `D^b_c(Spec Ω, Λ) ≃ D^b_fg(Λ)`.

- `TauCeti.EtaleDuality.perverse_curve_constant_shift`: For a smooth curve `C` over `k: Λ_C[1] ∈ pD^{≤0} ∩ pD^{≥0}`.

- `TauCeti.EtaleDuality.perverse_skyscraper`: For a closed point `x` and a finitely generated `Λ`-module `M, i_{x*}M[0] ∈ pD^{≤0} ∩ pD^{≥0}`.

- `TauCeti.EtaleDuality.perverse_empty`: For `X = ∅` the category is zero and `pD^{≤0} = pD^{≥0} =` everything.

- `TauCeti.EtaleDuality.not_perverse_curve_constant`: For a nonempty smooth curve `C` and `Λ ≠ 0, Λ_C` (degree 0) lies in `pD^{≥1}` and not in `pD^{≤0}`.

- `TauCeti.EtaleDuality.not_perverse_codimension_convention`: Assume `Λ≠0`. On `X = 𝔸² ⊔ 𝔸¹, Λ_{𝔸²}[2] ⊕ Λ_{𝔸¹}[1]` is perverse, while `Λ_{𝔸²}[2] ⊕ Λ_{𝔸¹}[2]` (every component shifted by `dim X`, as a codimension-based convention would do) is not: at the generic point of `𝔸¹` the costalk of `Λ_{𝔸¹}[2]` sits in degree `−2 < −1`, violating the lower condition.

- Every dense open of `𝔸² ⊔ 𝔸¹` meets both components and has components of dimensions 2 and 1.
  The truncation construction uses shifts 2 and 1 on these pieces; no equidimensional dense open exists.

- On a nonempty smooth curve `C` over `k` with `Λ≠0`, `Λ_C[1]` lies in the heart and `Λ_C` (in degree 0) lies in `pD^{≥1}` but not in `pD^{≤0}`.

- For a closed point `x` of `X, i_{x*}M[0]` lies in the heart for every finitely generated `Λ`-module `M`.

- On a nonempty smooth surface `S` with `Λ≠0`, `Λ_S[1]` lies in `pD^{≥1}` but not in `pD^{≤0}` (its stalk at the generic point is in degree `−1 > −2`), while `Λ_S[2]` is perverse.

**Perverse sheaves.** In the situation of §2.4, the category of perverse sheaves is the heart `Perv(X, Λ) := pD^{≤0}(X, Λ) ∩ pD^{≥0}(X, Λ)`, a full abelian subcategory of `D^b_c(X, Λ)` (§2.1), with perverse cohomology
functors `pH^m : D^b_c(X, Λ) → Perv(X, Λ)` (§2.1). Short exact sequences of perverse sheaves are the
distinguished triangles with perverse vertices; `Hom(K, L[m]) = 0` for perverse `K, L` and `m < 0`. Perverse sheaves
form a stack for the étale topology: for perverse `K, L` the presheaf `U ↦ Hom(K|_U, L|_U)` on `X_ét` is a sheaf,
and perverse sheaves given on an étale covering with isomorphisms on overlaps satisfying the cocycle condition
glue to a perverse sheaf, unique up to unique isomorphism (BBD 2.1.21–2.1.23, 2.2.19). If `K` is perverse with
support of dimension `≤ e`, then at every point `x` with `dim(x) = e` its stalk is concentrated in degree `−e`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.PerverseSheaf`: `Perv(X, Λ) :=` the heart of perverseTStructure, a full subcategory of `D^b_c(X, Λ)`.

- `TauCeti.EtaleDuality.PerverseSheaf.abelian`: `Perv(X, Λ)` is abelian.

- `TauCeti.EtaleDuality.perverseCohomology`: `pH^m : D^b_c(X, Λ) ⥤ Perv(X, Λ), m ∈ ℤ`.

- `TauCeti.EtaleDuality.perverseCohomology_isHomological`: `pH⁰` is homological: distinguished triangles give long exact sequences of perverse sheaves.

- `TauCeti.EtaleDuality.PerverseSheaf.ext_neg_eq_zero`: `Hom(K, L[m]) = 0` for perverse `K, L` and `m < 0`.

- `TauCeti.EtaleDuality.PerverseSheaf.hom_isSheaf`: For perverse `K, L, U ↦ Hom(K|_U, L|_U)` is a sheaf on `X_ét`.

- `TauCeti.EtaleDuality.PerverseSheaf.descent`: Perverse sheaves on an étale covering with cocycle isomorphisms glue uniquely to a perverse sheaf on `X`.

- `TauCeti.EtaleDuality.PerverseSheaf.restrictEtale`: For `u : V → X` étale, `u^* : Perv(X, Λ) ⥤ Perv(V, Λ)` is exact.

- `TauCeti.EtaleDuality.PerverseSheaf.pointEquiv`: For `X = Spec Ω, Ω` separably closed, `Perv(X, Λ) ≌` finitely generated `Λ`-modules.

- `TauCeti.EtaleDuality.PerverseSheaf.stalk_generic_concentration`: If `K` is perverse with `dim Supp K ≤ e` and `dim(x) = e`, then `ℋ^m(K)_x̄ = 0` for `m ≠ −e`.

A proof proceeds as follows.

Define `Perv(X, Λ)` as the heart and `pH^m` as the `t`-cohomology of §2.4.

Morphism descent: for `K ∈ pD^{≤0}` and `L ∈ pD^{≥0}, ℋ^`mRHom`(K, L) = 0` for `m < 0` (BBD 2.1.20–2.1.21, (2.2.8) in
the étale setting), so `ℋ⁰RHom(K, L)` is the sheaf of morphisms (2.1.22).

Object descent: BBD 2.2.19 gives a proof valid for the étale constructible categories: glue along a finite
étale covering using the vanishing of negative local Exts and the morphism descent just proved.

Generic concentration: the support condition gives vanishing above `−e` at `x`; on a dense open `V` of `{x}^−` smooth
of dimension `e` on which `K` has lisse cohomology, the costalk condition at `x` reads `ℋ^m(K)_x̄ = 0` for `m < −e`
(§2.4), since `i_x^!` and `i_x^*` differ there by the twist and shift of purity.

Use [BBD-1982] Définition 2.1.5, p.58; Proposition 2.1.20 and Corollaires 2.1.21–2.1.23, pp.64–65; [BBD-1982]
2.2.8, p.69; 2.2.19, p.74; [BBD-1982] 4.0, Exemples, p.102.

*Needs:* §2.1; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3;
`CategoryTheory.Triangulated.TStructure.heart`.

**Checks.**


- `TauCeti.EtaleDuality.perverseSheaf_point`: `Perv(Spec Ω, Λ) ≌` finitely generated `Λ`-modules, `Ω` separably closed.

- `TauCeti.EtaleDuality.perverseSheaf_skyscraper`: For a closed point `x` and finitely generated `M, i_{x*}M[0]` is perverse.

- `TauCeti.EtaleDuality.perverseSheaf_empty`: `Perv(∅, Λ)` is the zero category.

- `TauCeti.EtaleDuality.perverseSheaf_surface_shift`: On a smooth surface `S`, `Λ_S[2]` is perverse. If `S` is nonempty and `Λ≠0`, `Λ_S[1]` is not perverse.

- `TauCeti.EtaleDuality.not_perverse_constant_surface`: On a nonempty smooth surface `S` with `Λ≠0`, `pH^m(Λ_S[1]) = 0` for `m ≠ 1` and `pH¹(Λ_S[1]) ≅ Λ_S[2]: Λ_S[1]` is not perverse.

- `Perv(Spec Ω, Λ) ≃` finitely generated `Λ`-modules for `Ω` separably closed.

- On a nodal cubic `X` with normalization `ν : P¹_k → X` and node `i_s:s→X`, put
  `ε = coker(Λ_s → i_s^*ν_*Λ_{P¹_k})`, retaining the Galois action on the two branches.
  The ordinary normalization sequence `0 → Λ_X → ν_*Λ_{P¹_k} → i_{s*}ε → 0` rotates to the perverse
  short exact sequence `0 → i_{s*}ε → Λ_X[1] → ν_*Λ_{P¹_k}[1] → 0`.
  For a split rational node `ε≅Λ_s`; in general its geometric fibre is `Λ²/diag(Λ)` with the branch
  permutation action (Stacks Tag 0CBW).

**Shifted local systems on smooth schemes are perverse.** Let `X` be smooth over `k` of pure dimension `d` and `K ∈ D^b_c(X, Λ)` with locally constant cohomology sheaves. Then `K ∈ pD^{≤0}` iff `ℋ^m(K) = 0` for `m > −d`, and `K ∈ pD^{≥0}` iff `ℋ^m(K) = 0` for `m < −d`. In particular `L[d]` is perverse for every locally constant constructible
sheaf `L` of `Λ`-modules, and on lisse complexes the perverse `t`-structure is the natural `t`-structure shifted by `d`.
For a point `x` with `dim(x) = d − c, i_x^!K ≅ i_x^*K(−c)[−2c]`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `X`
smooth over `k` of pure dimension `d`; the cohomology sheaves of `K` are locally constant.

Name the resulting statement `shiftedLocalSystemsPerverse`.

A proof proceeds as follows.

Stalk side: the support of a nonzero locally constant sheaf is a union of components of dimension `d`, so
(4.0.1′) is the vanishing above `−d`.

Costalk side: choose a smooth dense open `V` of `{x}^−` (after passing to `k^`perf, §2.4); `V ⊂ X` is a smooth pair of
codimension `c`, and smooth-pair purity with locally constant coefficients (EtaleCohomologyFoundations §§0.10,
F.6) gives `i_V^!K ≅ i_V^*K(−c)[−2c]`; restrict to `x`. The costalk condition at `x` becomes `ℋ^m(K_x̄) = 0` for `m < −dim(x) − 2c = −d − c`, implied by the condition at the generic points `(c = 0)`.

This is the argument of BBD 4.3.2 (p.112–113) and the example in 4.0 (p.102).

Use [BBD-1982] 4.0, Exemples, p.102; [BBD-1982] Lemme 4.3.2 and its proof, pp.112–113.

*Needs:* SchemeAndStackFoundations §0.7; EtaleCohomologyFoundations §§0.10, F.6; EtaleCohomologyFoundations
§§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- For `C` a smooth curve, `Λ_C[1]` is perverse; if `C` is nonempty and `Λ≠0`, `Λ_C[0]` is not.

- If `Λ=0` or `X=∅`, every shifted constant complex on `X` is zero and is perverse.

- For `X = 𝔸²` and a closed point `x: i_x^!Λ_X ≅ Λ(−2)[−4]`, whose only cohomology is in degree `4 ≥ −0`.

**Open–closed recollement of perverse sheaves.** Let `i : Z → X` be a closed immersion with open complement `j : U → X`. The middle perverse `t`-structure on `D^b_c(X, Λ)` is glued (§2.2) from those of `U` and `Z` along the étale
recollement. Consequently: `j_!, i^*` are right `t`-exact; `Rj_*, i^!` are left `t`-exact; `j^*` and `i_*` are `t`-exact;
`pj_!, pj^*, pj_*` and `pi^*, pi_*, pi^!` are adjoint triples on perverse sheaves; `i_* : Perv(Z, Λ) → Perv(X, Λ)`
is fully faithful with essential image the perverse sheaves `K` with `j^*K = 0`, a thick (Serre) subcategory, and
`pj^*` identifies `Perv(U, Λ)` with the quotient; for `K` perverse there are exact sequences of perverse sheaves `0 → i_*pH^{−1}(i^*K) → pj_!j^*K → K → i_*pH⁰(i^*K) → 0` and `0 → i_*pH⁰(i^!K) → K → pj_*j^*K → i_*pH¹(i^!K) → 0`, the
middle maps being `pH⁰` of the counit `j_!j^*K → K` and the unit `K → Rj_*j^*K`. No bound `i^*K ∈ pD^{[−1,0]}` holds
for a general closed immersion (that is the affine-open case, §2.7).

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `i : Z → X` closed with open complement `j : U → X`.

Name the resulting statement `openClosedPerverseRecollement`.

A proof proceeds as follows.

The stalk and costalk conditions for points of `U` are those of `U` (SchemeAndStackFoundations §0.7: `dim(x)` is
unchanged), and for points of `Z` the conditions on `i^*K` and `i^!K` are those defining `pD(Z)`; hence the perverse
`t`-structure of `X` is the glued one (BBD 2.1.8, 2.2.3, 2.2.11).

Exactness and adjoint triples: §2.2 (`b`) (BBD 1.4.16, 2.1.6).

Thick subcategory and quotient: §2.2 (`c`) (BBD 1.4.17.1–1.4.18).

Exact sequences: §2.2 (`d`) (BBD 1.4.19), using only `i^*K ∈ pD^{≤0}, i^!K ∈ pD^{≥0}`.

Counterexample to a `[−1, 0]` bound: for a closed point `x` of a smooth surface `S, i_x^*Λ_S[2] = Λ[2]` has perverse
degree `−2` and `i_x^!Λ_S[2] = Λ(−2)[−2]` has perverse degree `+2`.

Use [BBD-1982] Proposition 2.1.6, p.58; 2.1.8, p.59; 2.2.3, pp.67–68; [BBD-1982] Propositions 1.4.16–1.4.18
and Lemme 1.4.19, pp.51–52.

*Needs:* §2.2; §0.2.

**Checks.**


- For `j : 𝔾_m → 𝔸¹` and `K = Λ_{𝔸¹}[1]: i^*K = Λ[1]` so `pH^{−1}(i^*K) = Λ` and the first sequence reads `0 → i_*Λ_0 → pj_!(Λ[1]) → Λ_{𝔸¹}[1] → 0`.

- Assume `Λ≠0`. For a closed point `x` of a smooth surface `S, i^*(Λ_S[2])` has nonzero `pH^{−2}`: the four-term sequences use only `pH^{−1}i^*` and `pH⁰i^*`, and this example shows they are not a two-term amplitude statement.

### 2.5 Perverse duality without a projectivity assumption

Extend the supplied finite-Tor self-duality to bounded constructible self-injective finite coefficients.

**Verdier duality preserves perverse sheaves.** Let `Λ` be self-injective (a finite field of characteristic `ℓ ≠ char k, O/λ^m` or `ℤ/ℓ^m`), or `Λ = E/ℚ_ℓ` finite under the `ℓ`-adic hypotheses. Verdier duality `D_X = RHom(−, K_X)`
(EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4) maps `pD^{≤0}(X, Λ)` onto `pD^{≥0}(X, Λ)` and
`pD^{≥0}` onto `pD^{≤0}`. Hence `D_X` restricts to an anti-equivalence `Perv(X, Λ)^op ≃ Perv(X, Λ)` with `D_X² ≅ id, pH^m(D_X K) ≅ D_X pH^{−m}(K), D_X ∘ pj_! ≅ pj_* ∘ D_U` and `D_X ∘ j_!* ≅ j_!* ∘ D_U` for an open `j`. The locally
closed extension follows in §2.8 from closed-pushforward duality and transitivity. For `Λ = O_E` (not
self-injective) duality exchanges the middle perversity `p` with `p⁺` instead (EtaleCohomologyFoundations §F.8
(integral `p/p+` tilt, pointwise criteria and duality)).

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). For duality statements `Λ` is moreover self-injective (a finite field of
characteristic `ℓ ≠ char k`, or `O_E/λ^m`, or `ℤ/ℓ^m`; §0.1), the setting of §0.2. For the `E`-coefficient case (`E/ℚ_ℓ`
finite, ring of integers `O`, uniformizer `λ, ℓ ≠ char k`) the base field satisfies BBD's finiteness condition:
`H^i(Gal(k^sep/k′), ℤ/ℓ)` is finite for every finite `k′/k` and every `i` (BBD 2.2.14 and 4.0; for example `k` finite
or separably closed). The categories `D^b_c(X, O)` and `D^b_c(X, E)` and their operations are the `ℓ`-adic formalism
required from EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

Name the resulting statement `perverseVerdierSelfDuality`.

A proof proceeds as follows.

Biduality and the exchange formulas `D i^* ≅ i^! D, D Rj_* ≅ j_! D` (§0.2, §0.2; for `E` the `ℓ`-adic versions
required from EtaleCohomologyFoundations §§F.0–F.6).

On a smooth stratum `S` of dimension `e`, for a complex `M` with locally constant cohomology, `D_S M = RHom(M, Λ(e)[2e])` has `ℋ^m(D_S M) = Hom(ℋ^{−m−2e}(M), Λ)(e)`, because `Hom(−, Λ)` is exact on finitely generated `Λ`-modules
(self-injectivity, §0.1) and `K_S ≅ Λ(e)[2e]` (§0.2). So `D_S` exchanges the shifted natural aisles `D^{≤−e}` and
`D^{≥−e}`.

Apply the stratum criterion of §2.4 to `K` and `D_X K` with a stratification adapted to both: `i_S^* D_X K ≅ D_S i_S^! K`. This is BBD 2.2.8 (field coefficients) and 4.0.

`j_!*: D` exchanges `pj_!` and `pj_*` and is exact on hearts, so it maps the image of `pj_! → pj_*` to the image of
the dual map.

Use [BBD-1982] 2.2.8, p.69; 2.2.11, p.70; [BBD-1982] 4.0, p.102; [Juteau-2009] §1.1, (1.2)–(1.9), pp.38–39
(arXiv:0901.3671v1).

*Needs:* §2.4; §2.3; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; §0.2; §0.1;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `D_X(Λ_C[1]) ≅ Λ_C(1)[1]` on a smooth curve `C`.

- For `Λ = O = ℤ_ℓ` on `X = Spec Ω: D(ℤ/ℓ[0]) = ℤ/ℓ[−1]`, which is not perverse although `ℤ/ℓ[0]` is — integral coefficients are excluded.

### 2.6 Quasi-finite maps and dimension bounds

**Quasi-finite, finite and étale morphisms and the perverse `t`-structure.** Let `f : X → Y` be a quasi-finite
morphism of separated schemes of finite type over `k`. Then `Rf_!` and `f^*` are right `t`-exact and their right
adjoints `Rf_*` and `f^!` are left `t`-exact for the middle perverse `t`-structures. If `f` is finite, `f_* = Rf_* = Rf_!`
is `t`-exact; if `f` is étale, `f^* = f^!` is `t`-exact; a closed immersion `i` gives a `t`-exact fully faithful `i_*` on
perverse sheaves. For a perverse sheaf `F` on `X, Rf_!F ∈ pD^{≤0}(Y)` and `Rf_*F ∈ pD^{≥0}(Y)`, and `f_!*F :=`
image`(pH⁰Rf_!F → pH⁰Rf_*F)` defines a functor `Perv(X, Λ) → Perv(Y, Λ)` generalising `j_!*`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `f`
quasi-finite (for `Rf_!`: separated, of finite type).

Name the resulting statement `quasiFinitePerverseExactness`.

A proof proceeds as follows.

Right `t`-exactness of `Rf_!` and `f^*`: by (4.0.1′) the upper aisle is a condition on `dim Supp ℋ^m`; for `f`
quasi-finite the underived `f_!` and `f^*` are exact, `ℋ^m(Rf_!K) = f_!ℋ^m(K)` with support `f(Supp ℋ^mK)` of the same
dimension, and `Supp ℋ^m(f^*K) = f^{−1}(Supp ℋ^mK)` has dimension at most that of `Supp ℋ^mK`
(SchemeAndStackFoundations §0.7) (BBD 2.2.5).

Left `t`-exactness of `Rf_*` and `f^!` by adjunction (§2.2, BBD 1.3.17 (iii)).

Finite `f: Rf_* = Rf_! = f_*` exact on sheaves (finite pushforward, imported with proper base change through
EtaleCohomologyFoundations §§F.0–F.6), so both one-sided statements combine; étale `f: f^! = f^*`
(EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4) (BBD 2.2.6).

`f_!*`: BBD 2.2.7 — the natural map `Rf_!F → Rf_*F` factors through `pH⁰` of each side.

Use [BBD-1982] Proposition 2.2.5, p.68; Corollaire 2.2.6 and 2.2.7, p.69.

*Needs:* §2.4; SchemeAndStackFoundations §0.7; §2.2; EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves
§0.4; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§F.0–F.6 and
the scheme-site contract above.

**Checks.**


- For a finite surjection `ν : P¹ → X` onto a nodal cubic, `ν_*Λ_{P¹}[1]` is perverse.

- For `j : 𝔾_m → 𝔸¹` (quasi-finite, affine) `j_!Λ[1]` and `Rj_*Λ[1]` are perverse (also by §2.7).

**Perverse amplitude of the operations for a morphism with bounded fibre dimension.** Let `f : X → Y` be a
morphism of separated schemes of finite type over `k` whose fibres have dimension `≤ d`. Then `f^*` maps `pD^{≤0}(Y)`
into `pD^{≤d}(X)` and `f^!` maps `pD^{≥0}(Y)` into `pD^{≥−d}(X)`; `Rf_!` maps `pD^{≤0}(X)` into `pD^{≤d}(Y)` and `Rf_*` maps
`pD^{≥0}(X)` into `pD^{≥−d}(Y)`. For `f` proper, `Rf_* = Rf_!` has perverse amplitude `[−d, d]`. Consequently `(pH^d Rf_!, pH^{−d} f^!)` and `(pH^d f^*, pH^{−d} Rf_*)` are adjoint pairs of functors between perverse sheaves.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. Fibres
of `f` of dimension `≤ d`.

Name the resulting statement `fibreDimensionPerverseAmplitude`.

A proof proceeds as follows.

`f^*`: for `K ∈ pD^{≤0}(Y), ℋ^m(f^*K)_x̄ = ℋ^m(K)_{f(x̄)}` vanishes for `m > −dim f(x)` by (4.0.1); since `dim(x) ≤ dim f(x) + d` (SchemeAndStackFoundations §0.7), `−dim f(x) ≤ d − dim(x)`, so it vanishes for `m > d − dim(x)`,
which is (4.0.1) for (`f^*K`)`[d]` (BBD 4.2.4).

`Rf_*`: adjoint to `f^*[d]` up to shift (§2.2 (iii)).

`Rf_!` and `f^!`: duality exchanges each pair for self-injective coefficients (§2.5); for a general noetherian `Λ`
use instead the stalk formula of `Rf_!` (compact-support cohomology of fibres vanishing above 2·dim,
EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4) with (4.0.1′): at a point `y` of dimension `e`, the
part of the fibre over `y` meeting `Supp ℋ^qK` has dimension `δ ≤ min(d, −q − e)`, and `H^{m−q}_c` of it vanishes
unless `m − q ≤ 2δ ≤ d − q − e`, so `ℋ^m(Rf_!K)_ȳ = 0` for `m > d − e`; then adjunction for `f^!`.

The adjunctions on perverse sheaves follow from BBD 1.3.17 (iii) applied to `(Rf_![d], f^![−d])` and `(f^*[d], Rf_*[−d])`.

Use [BBD-1982] 4.2.2–4.2.4, p.108.

*Needs:* SchemeAndStackFoundations §0.7; §2.4; §2.2; §2.5; EtaleCohomologyFoundations §F.2;
EnhancedDerivedSheaves §0.4.

**Checks.**


- For `f : 𝔸¹ → Spec k (d = 1)` and `K = Λ[1]: Rf_*K = RΓ(𝔸¹, Λ)[1] = Λ[1] ∈ pD^{≥−1}` and `Rf_!K = Λ(−1)[−1] ∈ pD^{≤1}`; both bounds are attained.

- For `f = P¹ → Spec k` (proper, `d = 1`): `Rf_*Λ[1]` has perverse cohomology in degrees `−1` and 1 only.

### 2.7 Smooth and affine morphisms

**Smooth pullback with its dimension shift.** Let `f : X → Y` be smooth of pure relative dimension `d`. Then
`f^![−d] ≅ f^*``[d](d)`, and the functor `f^*[d]` is `t`-exact for the middle perverse `t`-structures, inducing an exact
functor `f^*[d] : Perv(Y, Λ) → Perv(X, Λ)` with left adjoint `pH^d Rf_!(d)` and right adjoint `pH^{−d} Rf_*`. If
moreover `f` is surjective with geometrically connected fibres, then `f^*[d] : Perv(Y, Λ) → Perv(X, Λ)` is fully
faithful (BBD 4.2.5). The field-coefficient assertions about subobjects, quotients and simple objects are
deduced after the classification in §2.10.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `f`
smooth of pure relative dimension `d`; for full faithfulness, `f` surjective with geometrically connected fibres;
for the thick-image statement `Λ` is a field (finite of characteristic `ℓ`, or `E`).

Name the resulting statement `smoothPullbackPerverseExactness`.

A proof proceeds as follows.

Smooth purity `f^! ≅ f^*(d)[2d]` (EtaleCohomologyFoundations §§0.11, F.6), so `f^*[d] ≅ f^!``[−d](−d)`; §2.6 gives
`f^*[d]` right `t`-exact and `f^![−d]` left `t`-exact; together `t`-exact.

Full faithfulness: `f^*RHom(K, L) ≅ RHom(f^*K, f^*L)` for smooth `f` (smooth base change, imported through
EtaleCohomologyFoundations §§F.0–F.6); for perverse `K, L` both RHoms lie in `D^{≥0}`, and `f_*f^*H ≅ H` for every
sheaf `H` because `f` has local sections and geometrically connected fibres (BBD (4.2.5.1)–(4.2.5.3)).

Use [BBD-1982] 4.2.4 (smooth case), pp.108–109; Proposition 4.2.5, p.109; 4.2.6, Lemme 4.2.6.1 and Corollaire
4.2.6.2, pp.110–111.

*Needs:* §2.6; §2.2; §2.4; §2.3; EtaleCohomologyFoundations §§0.11, F.6; EtaleCohomologyFoundations §§F.0–F.1,
0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract
above.

**Checks.**


- For `pr : 𝔸¹ × Y → Y, pr^*[1]` sends `IC_Y` to `IC_{𝔸¹×Y}` and is fully faithful on perverse sheaves.

- Assume `Λ≠0`. For the étale double cover `f : 𝔾_m → 𝔾_m, z ↦ z²` (`char k ≠ 2, ℓ ≠ 2`; fibres not connected), `f^*[1]` is not full: for the nontrivial quadratic Kummer sheaf `L, Hom(Λ[1], L[1]) = 0` while `f^*L ≅ Λ` gives `Hom(f^*Λ[1], f^*L[1]) ≅ Λ`.

**Perverse Artin vanishing for affine morphisms.** Let `f : X → Y` be an affine morphism of separated schemes of
finite type over `k`. Then `Rf_* : D^b_c(X, Λ) → D^b_c(Y, Λ)` is right `t`-exact and `Rf_!` is left `t`-exact for the
middle perverse `t`-structures (BBD 4.1.1–4.1.2); `pf_* := pH⁰Rf_*` is right exact and `pf_! := pH⁰Rf_!` left exact
on perverse sheaves, and `p(fg)_* ≅ pf_* pg_*` for affine `f, g`. If `f` is quasi-finite and affine, `Rf_*` and `Rf_!`
are `t`-exact (BBD 4.1.3). If `k` is separably closed and `K ∈ pD^{≤0}(X)`, then `H^m(Z, K) = 0` for `m > 0` for every
quasi-finite `u : Z → X` with `Z` affine (BBD 4.1.5); in particular for `X` affine and `K` perverse, `H^m(X, K) = 0` for
`m > 0` and `H^m_c(X, K) = 0` for `m < 0`, and `H^m(X, F) = 0` for `m > dim X` for every constructible sheaf `F` (SGA 4
XIV 3.2).

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `f`
affine; for `Rf_!, f` separated of finite type and `Λ` a finite ring (reduced to self-injective `ℤ/ℓ^a`-coefficients
by restriction of scalars). For the cohomology statements `k` is separably closed (BBD state 4.1.4–4.1.5 for `k`
algebraically closed; the purely inseparable extension `k̄/k` changes no étale cohomology, by topological
invariance).

Name the resulting statement `perverseArtinVanishing`.

A proof proceeds as follows.

Right `t`-exactness of `Rf_*`: a constructible `K` lies in `pD^{≤d}` iff each `ℋ^m(K)[−m]` does, so it suffices that `dim Supp R^qf_*F ≤ dim Supp F − q` for every constructible `F` on `X`: Artin's affine theorem SGA 4 XIV 3.1, required
from EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above (BBD 4.1.1, p.102–103).

Left `t`-exactness of `Rf_!`: Verdier duality `D Rf_* ≅ Rf_! D` (§0.2) with §2.5 (BBD 4.1.2) for self-injective `Λ`;
for a finite ring `Λ` killed by `n`, restriction of scalars to `ℤ/n = ∏ ℤ/ℓ^a` keeps constructibility, commutes with
`Rf_!`, stalks and costalks (EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3) and
detects both aisles (BBD 4.0), and each `ℤ/ℓ^a` is self-injective.

Quasi-finite affine `f`: §2.6 supplies the other half (BBD 4.1.3; its proof cites 4.1.7 for the right
`t`-exactness of `f_*`, meaning 4.1.1: the affine direct-image theorem of this subsection).

Cohomology: apply 4.1.1 to `Z → Spec k` after the quasi-finite pullback `u^*K ∈ pD^{≤0}(Z)` (BBD 4.1.5); `H_c` by
duality over a separably closed field.

Use [BBD-1982] Théorème 4.1.1, p.102; Corollaires 4.1.2–4.1.5, p.103.

*Needs:* §2.4; §2.6; §2.5; §2.2; §0.2; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves
§§0.1–0.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- For `X = 𝔸¹` over `k̄` and `K = Λ[1]: H^m(𝔸¹, Λ[1]) = 0` for `m > 0 (H¹(𝔸¹, Λ) = 0)`, and `H^m_c(𝔸¹, Λ[1]) = 0` for `m < 0 (H⁰_c(𝔸¹, Λ) = 0)`.

- Assume `Λ≠0`. Non-example (affineness): for `P¹` over `k̄` and `K = Λ[1], H¹(P¹, Λ[1]) = H²(P¹, Λ) ≅ Λ(−1) ≠ 0`.

- Assume `Λ≠0`. For `X = 𝔾_m` over `k̄, H¹(𝔾_m, Λ) ≅ Λ(−1) ≠ 0` in degree `1 = dim X`: the bound `m > dim X` is sharp.

**Affine open immersions: exactness and the four-term sequences.** Let `j : U → X` be an affine open immersion
(for example the complement of an effective Cartier divisor) with closed complement `i : D → X`. Then: (i) for a
perverse `G` on `U, j_!G` and `Rj_*G` are perverse; (ii) for a perverse `F` on `X, i^*F ∈ pD^{[−1,0]}(D)` and `i^!F ∈ pD^{[0,1]}(D)`, and there are exact sequences of perverse sheaves `0 → i_*pH^{−1}i^*F → j_!j^*F → F → i_*pH⁰i^*F → 0` and `0 → i_*pH⁰i^!F → F → Rj_*j^*F → i_*pH¹i^!F → 0`; (iii) for a perverse `G` on `U` there is an exact sequence
`0 → i_*pH^{−1}(i^*Rj_*G) → j_!G → Rj_*G → i_*pH⁰(i^*Rj_*G) → 0`, and `i^*j_!*G[−1]` and `i^!j_!*G[1]` are perverse
with `i^*j_!*G[−1] ≅ pH^{−1}(i^*Rj_*G) ≅ pH⁰(i^!j_!G)` and `i^!j_!*G[1] ≅ pH⁰(i^*Rj_*G) ≅ pH¹(i^!j_!G)` (BBD
4.1.10–4.1.12).

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `j` an
affine open immersion; `Λ` a finite ring killed by `n`, as in §2.7, whose left `t`-exactness of `Rj_!` (deduced by
duality after restriction of scalars to the self-injective `ℤ/ℓ^a`) gives the perversity of `j_!G`; the `O`- and
`E`-coefficient versions follow by EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in
§3.1 here.

Name the resulting statement `affineOpenComplementExactness`.

A proof proceeds as follows.

(i) is §2.7 for the quasi-finite affine `j` (BBD 4.1.3).

(ii): the perverse cohomology sequences of the triangles `j_!j^*F → F → i_*i^*F` and `i_*i^!F → F → Rj_*j^*F`,
with `j_!j^*F` and `Rj_*j^*F` perverse by (i), force the stated amplitudes (BBD 4.1.10).

(iii): (ii) for `F = Rj_*G` gives the sequence (BBD (4.1.11.1)); comparing with (ii) for `F = j_!G` through
`i^*Rj_*G ≅ i^!j_!G[1]` identifies the end terms, and `j_!*G` is the image of `j_!G → Rj_*G` (§2.8), whence the
descriptions of `i^*j_!*G[−1]` and `i^!j_!*G[1]` (BBD 4.1.12).

Use [BBD-1982] Corollaire 4.1.10, (4.1.10.1)–(4.1.10.2); 4.1.11, (4.1.11.1); Corollaire 4.1.12,
(4.1.12.1)–(4.1.12.2), p.106.

*Needs:* §2.4; §2.3.

**Checks.**


- For `j : 𝔾_m → 𝔸¹` over `k̄` and `G = Λ[1]: pH^{−1}(i^*Rj_*G) ≅ Λ_0` and `pH⁰(i^*Rj_*G) ≅ Λ_0(−1)`, the sequence `0 → i_*Λ_0 → j_!Λ[1] → Rj_*Λ[1] → i_*Λ_0(−1) → 0` is exact, `j_!*G ≅ Λ_{𝔸¹}[1], i^*j_!*G[−1] ≅ Λ_0` and `i^!j_!*G[1] ≅ Λ_0(−1)`.

- Assume `Λ≠0`. Non-example: for the non-affine complement `j` of a closed point `x` in a smooth surface `S, Rj_*Λ[2]` is not perverse: `R³j_*Λ ≠ 0` at `x` (from `H⁴_x(S, Λ) ≅ Λ(−2)`), giving cohomology in degree 1 at a point of dimension 0.

### 2.8 Products and locally closed intermediate extensions

Extend the supplied open intermediate extension by locally closed transitivity, strict boundary bounds and external products.

**External tensor product is `t`-exact.** For `X₁, X₂` separated of finite type over `k` and `Λ` a field (finite of
characteristic `ℓ`, or `E` under the `ℓ`-adic hypotheses), the external tensor product `K ⊠ L := pr₁^*K ⊗ pr₂^*L : D^b_c(X₁, Λ) × D^b_c(X₂, Λ) → D^b_c(X₁ ×_k X₂, Λ)` is `t`-exact in either variable when the other argument is
perverse, for the middle perverse `t`-structures; in particular the external product of perverse sheaves is
perverse, and `IC_{X₁}(L₁) ⊠ IC_{X₂}(L₂) ≅ IC_{X₁×X₂}(L₁ ⊠ L₂)` when `X₁ ×_k X₂` is irreducible (for instance when
`X₁` is geometrically irreducible), `IC` being formed on the smooth dense open `U₁ × U₂`. It commutes with `Rf_*, Rf_!, f^*, f^!` for products of morphisms and with Verdier duality (BBD 4.2.7).

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` a field; the statement is false for `ℤ_ℓ` or `ℤ/ℓ²` coefficients without
flatness, since `⊗` is not exact (BBD 4.0 (d)).

Name the resulting statement `externalProductTExact`.

A proof proceeds as follows.

Künneth formulas for `⊠` with the six operations, and `D(K ⊠ L) ≅ DK ⊠ DL`: imported (SGA 4 XVII 5.4.3, through
EtaleCohomologyFoundations §§F.0–F.6 as required by EtaleCohomologyFoundations §§F.0–F.2) and BBD 4.2.7.

Choose stratifications `T₁, T₂` adapted to `K` and `L` (§2.4 stratum criterion); on `S₁ × S₂, i^*(K ⊠ L) = i^*K ⊠ i^*L` and `i^!(K ⊠ L) = i^!K ⊠ i^!L`, and the cutoff `−dim(S₁ × S₂) = −dim S₁ − dim S₂` is additive; over a field,
`ℋ` of a tensor product of complexes with lisse cohomology is the tensor product of cohomologies (BBD 4.2.8,
which stresses the linearity of the perversity function).

`IC`: the external product of `j_!*` is `j_!*` of the external product by the strict support conditions and §2.8.

Use [BBD-1982] 4.2.7, pp.111–112; Proposition 4.2.8 and its proof, p.112.

*Needs:* §2.4; §2.5; §0.2; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `Λ_{C₁}[1] ⊠ Λ_{C₂}[1] ≅ Λ_{C₁×C₂}[2]` for smooth curves `C₁, C₂`.

- Over `Λ = ℤ_ℓ` (that is `O`): on a point, `ℤ/ℓ ⊠ ℤ/ℓ = ℤ/ℓ ⊗^L ℤ/ℓ` has cohomology `ℤ/ℓ` in degrees `−1` and 0, so the external product of two perverse objects is not perverse; over `Λ = ℤ/ℓ²` the same product has `ℤ/ℓ` in every degree `≤ 0` (the 2-periodic resolution by multiplication by `ℓ`) and is not even bounded.

**Intermediate extension of perverse sheaves.** Let `j : U → X` be a locally closed immersion of separated
schemes of finite type over `k`, factored as an open immersion `j′ : U → Ū` into its closure followed by the
closed immersion `ī : Ū → X`, and put `Z := Ū ∖ U`. The intermediate extension is `j_!* := ī_* ∘ j′_!* : Perv(U, Λ) → Perv(X, Λ)`, where `j′_!*A` is the image of `pH⁰(j′_!A) → pH⁰(Rj′_*A)` (§2.3 for the perverse recollement of
§2.4). For A perverse on `U, j′_!*A` is the unique perverse sheaf `P` on `Ū` with `P|_U ≅ A, ℋ^m(i_x^*P) = 0` for `m ≥ −dim(x)` and `ℋ^m(i_x^!P) = 0` for `m ≤ −dim(x)` at every point `x` of `Z` (BBD 2.1.9 in the pointwise form of 2.2.12);
equivalently the unique perverse extension with no nonzero perverse subobject or quotient supported on `Z`. It
is fully faithful, sends simple objects to simple objects, is independent of the factorisation, and is
transitive: (`j₂ ∘ j₁`)`_!* ≅ j₂_!* ∘ j₁_!*` (BBD (2.1.7.1)). If `i : Z → Ū` is the closed complement, `i^*j′_!*A ∈ pD^{≤−1}(Z)` and `i^!j′_!*A ∈ pD^{≥1}(Z)`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `j` a
locally closed immersion; A perverse on `U`.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.intermediateExtension`: `j_!* : Perv(U, Λ) ⥤ Perv(X, Λ)` for a locally closed immersion `j : U ⟶ X`.

- `TauCeti.EtaleDuality.intermediateExtension_eq_image`: For `j` open, `j_!*A ≅` image`(pH⁰(j_!A) ⟶ pH⁰(Rj_*A))` in `Perv(X, Λ)`.

- `TauCeti.EtaleDuality.restrict_intermediateExtension`: `j^*(j_!*A) ≅ A`.

- `TauCeti.EtaleDuality.intermediateExtension_stalk_bound`: For a boundary point `x` of `Ū ∖ U, ℋ^m(i_x^*j_!*A) = 0` for `m ≥ −dim(x)`.

- `TauCeti.EtaleDuality.intermediateExtension_costalk_bound`: For a boundary point `x` of `Ū ∖ U, ℋ^m(i_x^!j_!*A) = 0` for `m ≤ −dim(x)`.

- `TauCeti.EtaleDuality.intermediateExtension_unique`: A perverse extension of A satisfying both strict boundary bounds is uniquely isomorphic to `j_!*A`.

- `TauCeti.EtaleDuality.intermediateExtension_no_sub_quotient`: `j_!*A` has no nonzero perverse subobject or quotient supported on `Ū ∖ U`.

- `TauCeti.EtaleDuality.intermediateExtension_fullyFaithful`: `j_!*` is fully faithful.

- `TauCeti.EtaleDuality.intermediateExtension_comp`: `(j₂ ∘ j₁)_!* ≅ j₂_!* ∘ j₁_!*`.

- `TauCeti.EtaleDuality.intermediateExtension_simple`: `j_!*` sends simple perverse sheaves to simple perverse sheaves.

- `TauCeti.EtaleDuality.intermediateExtension_etale`: For `u : V → X` étale and `j_V` the base change of `j, u^* ∘ j_!* ≅ j_{V!*} ∘ u^*`.

A proof proceeds as follows.

Open dense case: §2.3 applied to the glued perverse `t`-structure (§2.4), giving image, characterisations, full
faithfulness and simplicity.

Pointwise strict bounds: the conditions `i^*P ∈ pD^{≤−1}(Z), i^!P ∈ pD^{≥1}(Z)` of BBD 1.4.24 translate through
the pointwise description of the perverse `t`-structure of `Z` (§2.4; `dim(x)` is the same in `Z` and in `X`) into the
strict stalk and costalk vanishing (BBD 2.1.9).

Transitivity (BBD (2.1.7.1)): apply `pj_!, pj_!*, pj_*` to the maps `pk_! → pk_!* → pk_*` and compose;
independence of the factorisation follows from the characterisation.

Closed pushforward `ī_*` is `t`-exact and fully faithful on perverse sheaves (§2.6).

Use [BBD-1982] 1.4.22–1.4.25, pp.54–55; 2.1.7, (2.1.7.1), pp.58–59; [BBD-1982] Proposition 2.1.9, p.59;
2.2.12, pp.70–71.

*Needs:* §2.3; §2.4; §2.6.

**Checks.**


- `TauCeti.EtaleDuality.intermediateExtension_iso`: If `j` is an isomorphism, `j_!* ≅` the identity functor.

- `TauCeti.EtaleDuality.intermediateExtension_affineLine_constant`: For `j : 𝔾_m → 𝔸¹` and `Λ` a field, `j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1]`.

- `TauCeti.EtaleDuality.intermediateExtension_kummer`: For `Λ` a field, `j : 𝔾_m → 𝔸¹` over `k̄` and `L` a nontrivial rank-one tame Kummer local system, `j_!*(L[1]) ≅ j_!L[1] ≅ Rj_*L[1]`.

- `TauCeti.EtaleDuality.intermediateExtension_closed_compat`: For a closed immersion `ī, ī_!* = ī_*` on perverse sheaves (the pushforward of §2.6).

- `TauCeti.EtaleDuality.not_intermediateExtension_eq_lowerShriek`: For `j : 𝔾_m → 𝔸¹` and `Λ` a field, `pH⁰(j_!Λ[1]) = j_!Λ[1]` is not isomorphic to `j_!*(Λ[1])`: it has the subobject `i_*Λ_0`.

- `TauCeti.EtaleDuality.not_unrestricted_standard_truncation`: For `U = 𝔾_m ⊂ 𝔸¹` and `A` the skyscraper `Λ` at the point 1 of `U` in degree `0, j_!*A` is the skyscraper at 1 on `𝔸¹` while the natural truncation `τ_{≤−1}Rj_*A` is 0: the absolute form of §2.9 needs its degree condition `A ∈ D^{≤−1}(U)`, and only the truncation relative to the boundary computes `j_!*A` here.

- For `Λ` a field, `j : 𝔾_m → 𝔸¹` over `k̄` and `L` a nontrivial rank-one tame Kummer local system, `j_!L[1] ≅ j_!*(L[1]) ≅ Rj_*L[1]`.

- For `j : 𝔾_m → 𝔸¹` and `Λ[1], j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1]`, while `j_!(Λ[1])` and `Rj_*(Λ[1])` are different perverse sheaves.

### 2.9 Deligne truncation and low-degree comparison

**Deligne's truncation formula for the intermediate extension.** Let `j : U → X` be an open immersion whose
closed complement `i : F → X` is smooth over `k` (after passing to `k^`perf) of pure dimension `d`, and `A` perverse on
`U`. For an integer a write `τ^F_{≤a}` for the truncation relative to `F` for the natural `t`-structure of `F` (BBD
1.4.13): `τ^F_{≤a}M` is the fibre of `M → i_*τ_{≥a+1}i^*M`, so it agrees with `M` on `U` and restricts on `F` to
`τ_{≤a}i^*M`. If `ℋ^m(i^*Rj_*A)` is locally constant on `F` for every `m ≥ −d`, then `j_!*A ≅ τ^F_{≤−d−1}Rj_*A` (BBD
(2.2.4.1)); if the local constancy holds for `m ≥ −d − 1` (resp. `m ≥ −d + 1`) then `pH⁰(j_!A) ≅ τ^F_{≤−d−2}Rj_*A`
(resp. `pH⁰(Rj_*A) ≅ τ^F_{≤−d}Rj_*A`) (BBD (2.2.4.2)–(2.2.4.3)). If moreover `A ∈ D^{≤−d−1}(U)` for the natural
`t`-structure (for instance `A = L[e]` with `L` locally constant on `U` smooth of pure dimension `e > d`), the relative
truncation is the natural one of `X: j_!*A ≅ τ_{≤−d−1}Rj_*A`. More generally (BBD 2.1.11), for a filtration `U = U_k ⊂ U_{k+1} ⊂ … ⊂ U_N = X` by opens with each `U_{m+1} ∖ U_m` smooth of pure dimension `−m − 1, A ∈ D^{≤k}(U_k)`,
and the local-constancy hypothesis at each step, `j_!*A ≅ τ_{≤N−1}Rj_{N*} ∘ … ∘ τ_{≤k}Rj_{k+1,*}`A with natural
truncations, where `j_{m+1} : U_m → U_{m+1}`. Without the degree condition on A the natural truncation is wrong:
for `A` a skyscraper at a closed point of `U, j_!*A = j_*A` while `τ_{≤−d−1}Rj_*A = 0`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. The
local constancy of `ℋ^m(i^*Rj_*A)` on `F` is part of the statement; it fails in general (wild ramification), and
without it neither formula need hold in the étale setting. The natural (absolute) truncation needs in addition
`A ∈ D^{≤−d−1}(U)`; the iterated formula needs `A ∈ D^{≤k}(U_k)`.

Name the resulting statement `deligneTruncationFormula`.

A proof proceeds as follows.

By §2.3 (`b`) (BBD 1.4.23), `j_!*A ≅ pτ^F_{≤−1}Rj_*A`, the truncation relative to `F` for the perverse `t`-structure
of `F` (BBD (2.2.3.1)).

The natural triangle `τ_{≤−d−1}i^*Rj_*A → i^*Rj_*A → τ_{≥−d}i^*Rj_*A` has first term in `D^{≤−d−1}(F) ⊆ pD^{≤−1}(F)` (bounds of §2.4) and, under the local-constancy hypothesis, third term with locally constant
cohomology in degrees `≥ −d` on `F` smooth of pure dimension `d`, hence in `pD^{≥0}(F)` (§2.4). So it is the perverse
truncation triangle of `i^*Rj_*A`, and the two relative truncations of `Rj_*A` agree (BBD 2.2.3–2.2.4, with the
stratum criterion 2.2.2 (iii)); the shifted hypotheses give (2.2.4.2)–(2.2.4.3) in the same way.

If `A ∈ D^{≤−d−1}(U)`, the natural triangle `τ_{≤−d−1}Rj_*A → Rj_*A → τ_{≥−d}Rj_*A` has third term supported on `F`
(its restriction to `U` is `τ_{≥−d}A = 0`), so it is the relative truncation triangle and `τ^F_{≤−d−1}Rj_*A = τ_{≤−d−1}Rj_*A`.

Iterate along the filtration using transitivity (§2.8), as in BBD 2.1.11: `A ∈ D^{≤k}(U_k)`, and the output of
each step lies in `D^{≤m}(U_{m+1}) ⊆ D^{≤m+1}(U_{m+1})`, so the degree condition propagates.

Use [BBD-1982] 2.2.3, (2.2.3.1), and Proposition 2.2.4, (2.2.4.1)–(2.2.4.3), p.68; [BBD-1982] 2.1.10, p.59;
Proposition 2.1.11, p.60.

*Needs:* §2.8; §2.3; §2.4.

**Checks.**


- For `j : 𝔾_m → 𝔸¹` and `Λ[1] (d = 0): τ_{≤−1}Rj_*Λ[1] = (j_*Λ)[1] = Λ_{𝔸¹}[1] = j_!*Λ[1]`.

- For a smooth curve `C`, an open dense `j : U → C` and `L` locally constant on `U` (the hypothesis holds at the finitely many points of `F`), `j_!*(L[1]) ≅ (j_*L)[1]` with `j_*` the underived direct image.

- Degree condition: for `U = 𝔾_m ⊂ 𝔸¹ (F = {0}, d = 0)` and `A` the skyscraper `Λ` at the point 1 of `U, j_!*A = j_*A` is the skyscraper at 1 on `𝔸¹` and equals `τ^F_{≤−1}Rj_*A`, while the natural truncation `τ_{≤−1}Rj_*A` is 0.

**Low-degree cohomology of an intermediate extension across a boundary of high codimension.** Let `j : U → X` be
an open immersion whose closed complement `Z` has codimension `≥ c` in every component (`dim Z ≤ d − c` with `X` of
pure dimension `d`), A perverse on `U` and `P := j_!*A`. Then the cone `C` of the natural map `P → Rj_*A` lies in
`i_*pD^{≥0}(Z) ⊆ i_*D^{≥ −dim Z}`, hence in the natural `D^{≥ c−d}`; consequently, for every étale `V → X, H^m(V, P) → H^m(V ∩ U, A)` is an isomorphism for `m ≤ c − d − 1` and injective for `m = c − d`. For `A = L[d]` with `L` a
sheaf on `U: H^q(X, P[−d]) ≅ H^q(U, L)` for `q ≤ c − 1` and `H^c(X, P[−d]) → H^c(U, L)` is injective. In particular,
for `X̄` smooth of pure dimension `d, D ⊂ X̄` a strict normal crossings divisor with singular locus `D_sing`
(codimension `≥ 2`), `X := X̄ ∖ D, a : X → U := X̄ ∖ D_sing, b : U → X̄` and `F` locally constant on `X` such that the
`ℋ^mRa_*F` are locally constant along `D ∖ D_sing`, one has `b_!*((a_*F)[d]) = j_!*(F[d])` and `H¹(X̄, j_!*(F[d])[−d]) ≅ H¹(U, a_*F)`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `codim (X ∖ U) ≥ c` in each component of `X, X` of pure dimension `d`.

Name the resulting statement `intermediateExtensionLowDegreeCohomology`.

A proof proceeds as follows.

The recollement triangle `i_*i^!P → P → Rj_*j^*P` gives `C ≅ i_*i^!P[1]`; `i^!P ∈ pD^{≥1}(Z)` by the strict costalk
bound (§2.8), so `C ∈ i_*pD^{≥0}(Z)`.

`pD^{≥0}(Z) ⊆ D^{≥−dim Z}` (§2.4 bounds), and `−dim Z ≥ c − d`.

Long exact cohomology sequence of `P → Rj_*A → C` on `V`.

SNC case: `a_!*(F[d]) = (a_*F)[d]` by §2.9 (`D ∖ D_sing` is smooth of dimension `d − 1`, under the stated local
constancy), transitivity gives `j_!* = b_!* a_!*`, and the codimension-two case of the first part applied to `b`
gives the `H¹` isomorphism.

Use [BBD-1982] Corollaire 1.4.24, p.55; (2.1.2.1), p.57; [BBD-1982] Proposition 2.2.4, p.68.

*Needs:* §2.8; §2.4; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4.

**Checks.**


- Assume `Λ≠0`. For `X = 𝔸², U = 𝔸² ∖ {0}, A = Λ[2]: P = Λ_{𝔸²}[2]`, and `H^q(𝔸², Λ) → H^q(U, Λ)` is an isomorphism for `q ≤ 1` and injective for `q = 2` (here `c = 2`), while `H³(U, Λ) ≅ Λ(−2) ≠ 0 = H³(𝔸², Λ)`.

- For the nodal cubic `X` with node `s`, normalisation `ν : P¹ → X` and `U = X ∖ {s} (c = 1, d = 1): IC_X[−1] = ν_*Λ`, so `H⁰(X, IC_X[−1]) = H⁰(P¹, Λ) ≅ Λ ≅ H⁰(U, Λ)` (degree `c − 1`), and `H¹(X, IC_X[−1]) = H¹(P¹, Λ) = 0` injects into `H¹(U, Λ) ≅ Λ(−1)` (degree `c`).

### 2.10 Intersection complexes and simple perverse sheaves

**The intersection complex of a local system.** Let `X` be a separated scheme of finite type over `k`, irreducible
of dimension `d`. Put `Y=(X_{k^perf})_red`, choose a dense smooth open `U ⊂ Y`, and let `j:U→Y` be its inclusion. For `L` a locally constant constructible sheaf of `Λ`-modules on `U`, transport the construction from `Y` to `X` along the universal-homeomorphism equivalences of §2.4 (Stacks Tag 03SI). All formulas below are computed on `Y` and transported in this way. If `X` is reduced over a perfect field, `Y=X` and `j` is an open immersion in `X`. The
intersection complex `IC_X(L) ∈ Perv(X,Λ)` is this transported object, represented on `Y` by `j_!*(L[d])` (§2.8, §2.4); put `IC_X := IC_X(Λ)`. It does not
depend on `U`: for `U′ ⊂ U` dense open, `IC_X(L) ≅ IC_X(L|_{U′})`. Its restriction to `U` is `L[d]` (no Tate twist and
no shift by `2d`). If `X` is smooth and `L` extends to a locally constant sheaf `L_X` on `X, IC_X(L)=L_X[d]`; if `dim X = 1, IC_X(L) ≅ (j_*L)[1]`; if `ν : X′ → X` is finite and an isomorphism over `U` with `X′` smooth of pure dimension `d`
and `L′` locally constant on `X′` extending `L`, then `IC_X(L) ≅ ν_*(L′[d])`; `IC_X(L)` is simple if `L` is irreducible
and `Λ` is a field. No half-twist normalisation is built into the definition. For `X` irreducible of dimension `d`
with a dense open `U` smooth over `k, L` locally constant constructible on `U` and self-injective `Λ, D_X IC_X(L) ≅ IC_X(L^∨(d))` with
`L^∨ := Hom(L, Λ)`. No isomorphism `IC_X(L) ≅ D_X IC_X(L)` is asserted without a given perfect pairing `L ⊗ L → Λ(d)`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` is a noetherian commutative ring with `nΛ = 0`; `D^b_c(X, Λ)` is the bounded
constructible category of EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3. `X`
irreducible of dimension `d`; `U` dense smooth open in `Y=(X_{k^perf})_red`; `L` locally constant constructible on `U`. Use the equivalence with `Y` for all operations in the displayed formulas.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.intersectionComplex`: `IC_X(L)` is the transport of `j_!*(L[d]) ∈ Perv(Y, Λ)` for `j:U→Y=(X_{k^perf})_red` dense open smooth and `L` locally constant on `U`.

- `TauCeti.EtaleDuality.intersectionComplex_restrict`: `IC_X(L)|_U ≅ L[d]`.

- `TauCeti.EtaleDuality.intersectionComplex_independent`: For `U′ ⊆ U` dense open, `IC_X(L) ≅ IC_X(L|_{U′})`.

- `TauCeti.EtaleDuality.intersectionComplex_of_smooth`: If `X` is smooth `(U = X), IC_X(L) ≅ L[d]`.

- `TauCeti.EtaleDuality.intersectionComplex_curve`: If `d = 1, IC_X(L) ≅ (j_*L)[1]` with `j_*` underived.

- `TauCeti.EtaleDuality.intersectionComplex_finite_birational`: For `ν : X′ → X` finite, an isomorphism over `U, X′` smooth and `L′` locally constant on `X′` extending `L: IC_X(L) ≅ ν_*(L′[d])`.

- `TauCeti.EtaleDuality.intersectionComplex_simple`: If `Λ` is a field and `L` is irreducible, `IC_X(L)` is simple.

- `TauCeti.EtaleDuality.intersectionComplex_verdierDual`: For self-injective `Λ: D_X IC_X(L) ≅ IC_X(L^∨(d))` (§2.5).

A proof proceeds as follows.

Apply reduction and perfect-base-change topological invariance (§2.4; Stacks Tag 03SI), then §2.8 to `L[d]` on the dense smooth open of `Y`. Nilpotents supply no extra étale data.

Independence of `U`: transitivity `(j_U ∘ j′)_!* = j_{U!*} ∘ j′_!*` and `j′_!*(L|_{U′}[d]) = L[d]` because a shifted
local system on smooth `U` satisfies the strict boundary bounds on `U ∖ U′` by purity (BBD Lemme 4.3.2).

Curves: §2.9 with a zero-dimensional boundary.

Finite birational `ν: ν_*` is `t`-exact (§2.6) and finite fibres over the boundary give the strict stalk and
costalk bounds (proper base change for finite maps), so `ν_*(L′[d])` is the unique extension.

Simplicity for irreducible `L` over a field: §2.10 (BBD 4.3.3).

For self-injective finite coefficients and for `E`, the perverse duality of §2.5 exchanges the two maps defining
the intermediate-extension image. On `U, D_U(L[d])=L∨(d)[d]`; applying the image comparison proves the `IC`
duality formula, without asserting self-duality of `L`. The `O` case instead exchanges `p` and `p⁺`.

Use [BBD-1982] Lemme 4.3.2 and Lemme 4.3.3, pp.112–113; Théorème 4.3.1 (ii), p.112.

*Needs:* §2.8; §2.4; §2.9; §2.6.

**Checks.**


- `TauCeti.EtaleDuality.intersectionComplex_smoothCurve`: For a smooth curve `C, IC_C ≅ Λ_C[1]`.

- `TauCeti.EtaleDuality.intersectionComplex_nodalCurve`: For a nodal cubic `X` with normalisation `ν : P¹_k → X, IC_X ≅ ν_*Λ_{P¹_k}[1]`, with geometric stalk `Λ²` in degree `−1` at the node, carrying the branch permutation action.

- `TauCeti.EtaleDuality.intersectionComplex_cuspidalCurve`: For a cuspidal cubic `X, IC_X ≅ Λ_X[1]` (the normalisation is a universal homeomorphism).

- For `X=Spec ℂ[t,ε]/(ε²)`, no nonempty open of `X` is smooth. Reduction gives `Y=𝔸¹_ℂ`, and `IC_X` is the transport of `Λ_Y[1]`.

- `TauCeti.EtaleDuality.intersectionComplex_point`: For `X = Spec k̄ (d = 0), IC_X(L) = L` in degree 0.

- `TauCeti.EtaleDuality.intersectionComplex_restrict_compat`: `IC_X|_U ≅ Λ_U[d]`, not `Λ_U(d)[2d]` (the dualizing complex): the `IC` normalisation is the perverse shift.

- `TauCeti.EtaleDuality.not_intersectionComplex_nodal_constant`: Assume `Λ≠0`. For a nodal cubic `X` with
  normalization `ν:P¹_k→X` and node `i_s:s→X`, set `ε=coker(Λ_s→i_s^*ν_*Λ_{P¹_k})`.
  Then `Λ_X[1]` is perverse but not `IC_X`: the perverse exact sequence
  `0 → i_{s*}ε → Λ_X[1] → ν_*Λ_{P¹_k}[1] → 0` has a nonzero subobject supported at the node.
  Its geometric fibre is `Λ²/diag(Λ)`; the sheaf `ε` is constant for a split rational node
  (Stacks Tag 0CBW).

- Over `𝔽₇` with `Λ=𝔽₅`, the cubic `y²z=x²(x−z)` has rational node `[0:0:1]` and normalization
  parameter `t=y/x`, with `(x,y)=(t²+1,t(t²+1))`. Its branches satisfy `t²+1=0` and Frobenius
  exchanges them, so `ε` has Frobenius `−1` and `Hom_(G_𝔽₇)(Λ,ε)=0`. The punctual kernel is not constant.
  After extending the base to `𝔽₄₉` it becomes constant; with coefficients `𝔽₂` the sign action is
  already trivial over `𝔽₇`.

- `IC` of a smooth curve is `Λ[1]`; `IC` of a nodal cubic is `ν_*Λ_{P¹}[1]`, whose geometric stalk at the node is `Λ²` in degree `−1`, with its branch permutation action.

- `IC` of a cuspidal cubic `X` is `Λ_X[1]`, since its normalisation is a universal homeomorphism.

**Finite length and the simple perverse sheaves.** Let `Λ` be a field (finite of characteristic `ℓ ≠ char k`, or
`E/ℚ_ℓ` finite under the `ℓ`-adic hypotheses, or `ℚ̄_ℓ` as the colimit over such `E`, EtaleCohomologyFoundations
§§F.4, F.8; ramified coefficient refinement in §3.1 here). Every perverse sheaf on `X` has finite length in
`Perv(X, Λ)`: the category is artinian and noetherian. The simple perverse sheaves are exactly the objects
`i_{V̄*}IC_{V̄}(L) = j_{V!*}(L[dim V])` computed on `Y=(X_{k^perf})_red` and transported to `X`, where `j_V:V→Y` includes an irreducible smooth locally closed reduced subscheme and `L` is an irreducible locally constant sheaf of `Λ`-modules on `V`; two such are isomorphic iff the closures of the `V` agree and the `L` agree on a common dense open. For `Λ = O/λ^m` (or `ℤ/ℓ^m`) every perverse sheaf has finite length, by the same noetherian induction (lisse sheaves of
finitely generated `O/λ^m`-modules have finite length), and since `λ` acts nilpotently every simple object is
killed by `λ`: it is `j_{V!*}(L[dim V])` for an irreducible locally constant sheaf `L` of `O/λ`-modules; for `Λ = O` the
category is only noetherian and its dual `p⁺`-category only artinian. As a consequence, for a smooth surjective
`f:X→Y` of pure relative dimension `d` with geometrically connected fibres and field coefficients, for `Λ` a field
its essential image is closed under subobjects and quotients, every perverse sheaf on `X` has a largest perverse
subsheaf and a largest perverse quotient coming from `Y`, namely `f^*[d]` of `pH^{−d}Rf_*` and of `pH^dRf_!(d)` (BBD
4.2.6.2), and `f^*[d]` sends simple objects to simple objects.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` a field for the classification; `X` separated of finite type over `k`.

Name the resulting statement `simplePerverseSheavesClassification`.

A proof proceeds as follows.

Reduce to `(X_{k^perf})_red` by topological invariance (§2.4), so every irreducible support has a smooth dense open.

Simplicity of `L[dim V]` on smooth irreducible `V` for irreducible `L`: a perverse subobject is `M[dim V]` on a dense
open for a lisse subsheaf `M`; irreducibility persists on dense opens because `π₁(U) → π₁(V)` is surjective for `V`
normal irreducible (Stacks Tag 0BQI, required from EtaleCohomologyFoundations §§F.0–F.6); then the
no-sub/quotient characterisation of `j_!*` (BBD 4.3.3, citing 1.4.25: the no-boundary-subquotient criterion of
§2.3).

Simplicity of `i_{V̄*}j_!*`: twice §2.3 (`d`) (BBD 4.3.4).

Finite length by noetherian induction: a perverse `F` is `L[dim U]` on a smooth irreducible dense open `U` of its
reduced support over the perfect closure with `L` lisse of finite length, so the four-term sequences of §2.4 reduce to intermediate extensions of
the constituents of `L` and to perverse sheaves on smaller supports (BBD 4.3.4); the classification is §2.3 (e).

`O/λ^m`: the noetherian induction of the previous step applies verbatim, lisse `O/λ^m`-sheaves having finite
length; `λ` is nilpotent on every object, hence zero on a simple one. `O`: BBD 4.0 (b) and Juteau §1.1.

Apply the finite-length classification to the fully faithful smooth pullback of §2.7. Smooth base change for
intermediate extension and the connected-fibre fundamental-group surjection preserve the simple lisse
constituents. Induction on length makes the image closed under subobjects and quotients; the heart adjunctions
identify the largest ones as stated (BBD §§4.2.6–4.2.6.2, pp.110–111).

Use [BBD-1982] Théorème 4.3.1, Lemmes 4.3.2–4.3.3, 4.3.4, pp.112–113; [BBD-1982] 4.0 (b), p.101; [Stacks] Tag
0BQI (Lemma 58.10.7).

*Needs:* §2.8; §2.3; §2.4; EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1
here; `CategoryTheory.Simple`; `CategoryTheory.IsArtinianObject`; `CategoryTheory.IsNoetherianObject`;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; §2.7.

**Checks.**


- On `𝔸¹` over `k̄` with `Λ` a field, `Rj_*Λ[1]` for `j : 𝔾_m → 𝔸¹` has `length 2`, with constituents `Λ_{𝔸¹}[1]` and `i_*Λ_0(−1)`.

- Over `Λ = ℤ_ℓ` on a point, `ℤ_ℓ` has the infinite descending chain `ℤ_ℓ ⊃ ℓℤ_ℓ ⊃ …`, so `Perv(pt, ℤ_ℓ)` is not artinian.

- On `X₀ = 𝔸²_{𝔽_q}` with rational coefficients and `L = ℚ_ℓ(1), IC_X(L) = ℚ_ℓ(1)[2]` and `D_X IC_X(L) = ℚ_ℓ(1)[2]`. The perfect pairing has target `ℚ_ℓ(2)`, as the positive `d` twist requires. In contrast `L = ℚ_ℓ(−1)` pairs with itself into `ℚ_ℓ(−2)`, but its dual intersection complex is `ℚ_ℓ(3)[2]`, with a different Frobenius eigenvalue. Forgetting Frobenius would hide the sign error; the arithmetic structures distinguish them. The rational example uses the extension of this duality in §3.1.

### 2.11 Nonconstructible perversity conditions

**Perversity conditions on nonconstructible complexes.** Let `X` be separated of finite type over `k` and `Λ`
torsion (`nΛ = 0, n` invertible in `k`). For `a ∈ ℤ` and `K` in the unbounded derived category `D(X, Λ)`
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), say `K ∈ pD^{≤a}_{ext}(X, Λ)` if
`ℋ^m(i_x^*K) = 0` for `m > a − dim(x)` at every point `x`, and `K ∈ pD^{≥a}_{ext}(X, Λ)` if `K` is bounded below and
`ℋ^m(i_x^!K) = 0` for `m < a − dim(x)` at every point `x` (`i_x^! :=` restriction of `i^!` along `{x}^− → X` to `x`,
EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4). Then: (a) on `D^b_c(X, Λ)` these are the aisles
of the middle perverse `t`-structure; (b) `pD^{≤a}_{ext}` is closed under extensions, arbitrary direct sums and
filtered colimits; (c) `pD^{≥a}_{ext} ⊆ D^{≥a−dim X}`, so every family in it is uniformly bounded below (BBD
2.1.2, remark after the definition), and `pD^{≥a}_{ext}` is closed under extensions and under filtered colimits,
because for systems uniformly bounded below (all `K_α ∈ D^{≥b}` for one `b`) geometric costalks commute with the
colimit; (d) for `j : U → X` open, `Rj_*` preserves `pD^{≥a}_{ext}` and `j^*` preserves both conditions; for `f : X → Y`
finite, `f_*` preserves both; for `u` étale, `u^*` preserves both and detects them when surjective. No `t`-structure
on `D(X, Λ)` and no constructibility of filtered colimits is asserted.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). `Λ` torsion with `nΛ = 0`; `X` noetherian (separated of finite type over `k`); the
lower condition includes bounded-belowness so that `i_x^!` is the derived functor on `D⁺`; together with the
costalk vanishing it then forces the bound `K ∈ D^{≥a−dim X}`, which is what makes the costalk of a filtered
colimit the colimit of the costalks.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.perverseLEExt`: `K ∈ D(X, Λ)` with `ℋ^m(i_x^*K) = 0` for `m > a − dim(x)` at every point.

- `TauCeti.EtaleDuality.perverseGEExt`: `K ∈ D⁺(X, Λ)` with `ℋ^m(i_x^!K) = 0` for `m < a − dim(x)` at every point.

- `TauCeti.EtaleDuality.perverseLEExt_iff_of_constructible`: On `D^b_c(X, Λ)`, perverseLEExt a and perverseGEExt a are `pD^{≤a}` and `pD^{≥a}`.

- `TauCeti.EtaleDuality.perverseLEExt_colimit`: perverseLEExt a is closed under filtered colimits and direct sums.

- `TauCeti.EtaleDuality.perverseGEExt_isGE`: If `K ∈` perverseGEExt a then `K ∈ D^{≥a−dim X}`; in particular every family in perverseGEExt a is uniformly bounded below.

- `TauCeti.EtaleDuality.perverseGEExt_colimit`: perverseGEExt a is closed under filtered colimits; the uniform lower bound the costalk comparison needs is supplied by `perverseGEExt_isGE`.

- `TauCeti.EtaleDuality.costalk_colimit_iso`: For a filtered system `K_α` in `D^{≥b}(X, Λ), colim ℋ^m(i_x^!K_α) ≅ ℋ^m(i_x^! colim K_α)`.

- `TauCeti.EtaleDuality.perverseGEExt_pushforward_open`: For `j : U → X` open, `Rj_*` preserves perverseGEExt a.

- `TauCeti.EtaleDuality.perverseExt_finite_pushforward`: For `f` finite, `f_*` preserves perverseLEExt a and perverseGEExt a.

- `TauCeti.EtaleDuality.perverseExt_etale_local`: For `u` étale, `u^*` preserves both conditions, and detects them when `u` is surjective.

A proof proceeds as follows.

(a): definitions agree with (4.0.1)–(4.0.2) (§2.4).

(b): stalks are exact and commute with all colimits.

Lower bound in (c): if `K ∈ D^{≥b}` with `ℋ^b(K) ≠ 0` and `b < a − dim X`, take a nonzero section `s` of `ℋ^b(K)` over
some étale `V` and a generic point `v` of an irreducible component of its support, lying over `x ∈ X`; near `v` the
section is supported on the preimage of `{x}^−`, so it gives a nonzero element of `ℋ^b(i_x^!K)` (the lowest
cohomology of `i_x^!K` is the sheaf of sections of `ℋ^b(K)` supported on `{x}^−`), although `b < a − dim X ≤ a − dim(x)`. This is the pointwise form of BBD's remark after 2.1.2.

(c): `ℋ^m(i_x^!K)` is the colimit over étale neighbourhoods `V` of `x` and closed `W = {x}^− ∩ V` of `H^m_W(V, K)`; with
a uniform lower bound `b, H^m_W(V, −)` depends only on `τ_{≤m+1}`, a bounded complex in `[b, m+1]`, and étale
cohomology with supports of the qcqs `V` commutes with filtered colimits of sheaves (EtaleCohomologyFoundations
§§F.0–F.6/cohomology-filtered-colimits via the localization triangle of EtaleCohomologyFoundations §§F.0–F.1,
0.7; EnhancedDerivedSheaves §§0.1–0.3); induct on the length.

(d): for `x ∉ U, {x}^− ⊆ X ∖ U` and `i^!Rj_* = 0` (§2.2), so the costalk of `Rj_*K` at `x` vanishes; for `x ∈ U` it is
that of `K`. Finite `f: f_*` is exact, stalks of `f_*K` at `y` are the sums of stalks over the finitely many points
above `y`, and `i_y^!f_*K = f′_*i′^!K` by base change for the closed immersion; dim is preserved by quasi-finite
maps (SchemeAndStackFoundations §0.7). Étale `u`: stalks and costalks are preserved.

Use [BBD-1982] Définition 2.1.2 and the remarks after it, p.56; [BBD-1982] 4.0, (4.0.1)–(4.0.2), p.102.

*Needs:* §2.4; SchemeAndStackFoundations §0.7; §2.2; EtaleCohomologyFoundations §§F.0–F.1, 0.7;
EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `TauCeti.EtaleDuality.perverseExt_skyscraper_sum`: On a smooth curve `C, ⊕_{x closed} i_{x*}Λ[0]` satisfies both perverseLEExt 0 and perverseGEExt 0.

- `TauCeti.EtaleDuality.perverseExt_empty`: On `X = ∅` every complex satisfies both conditions.

- `TauCeti.EtaleDuality.perverseExt_constructible_compat`: For `K ∈ D^b_c(X, Λ), K ∈` perverseLEExt `0 ∩` perverseGEExt 0 iff `K ∈ Perv(X, Λ)`.

- `TauCeti.EtaleDuality.not_perverseGEExt_lowerShriek_open`: For `j : 𝔸² ∖ {0} → 𝔸²` over `k̄` and `Λ = ℤ/ℓ, Λ[2]` satisfies perverseGEExt 0 on the open but `j_!Λ[2]` does not satisfy it on `𝔸²`: its costalk at the origin is `(i^*Rj_*Λ[2])[−1] ≅ Λ[1] ⊕ Λ(−2)[−2]`, nonzero in degree `−1 < 0`. So the list in (d) contains `Rj_*` and not `j_!`.

- A filtered colimit of perverse sheaves `Λ_C[1] → …` along the identity is `Λ_C[1]`.

- For a smooth curve `C` and the direct sum `K = ⊕_{x ∈ C closed} i_{x*}Λ[0]` (not constructible), `K ∈ pD^{≤0}_{ext} ∩ pD^{≥0}_{ext}`.

### 2.12 Semismall and small maps

**Proper semismall pushforward preserves perversity.** Let `f : X → Y` be a proper morphism of separated schemes
of finite type over `k` and `Λ` self-injective (a finite field of characteristic `ℓ, O/λ^m, ℤ/ℓ^m`) or `E` under the
`ℓ`-adic hypotheses. Let `X = ⊔_α X_α` be a finite partition into locally closed equidimensional strata and `Y = ⊔_β Y_β` a finite partition into locally closed subsets, such that for all `α, β` and every geometric point `ȳ` of
`Y_β: 2·dim(f^{−1}(ȳ) ∩ X_α) + dim Y_β ≤ dim X_α` (with dim `∅ = −∞`). Let `K` be a perverse sheaf on `X` such that
the cohomology sheaves of `i_α^*K` and of `i_α^*D_X K` are locally constant on each `X_α`. Then `Rf_*K = Rf_!K` is
perverse. In particular (one stratum): if `X` is smooth of pure dimension `n, L` is locally constant on `X` and
`dim(X ×_Y X) ≤ n` — equivalently `2·dim f^{−1}(ȳ) + dim Y_β ≤ n` for a partition of `Y` — then `Rf_*(L[n])` is
perverse (`f` is semismall).

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). For duality statements `Λ` is moreover self-injective (a finite field of
characteristic `ℓ ≠ char k`, or `O_E/λ^m`, or `ℤ/ℓ^m`; §0.1), the setting of §0.2. `f` proper; the strata hypotheses
as stated; no local triviality of `f` over the `Y_β` is needed. Self-injective coefficients are needed for the
cosupport half, which is deduced from the support half by duality; for `O = ℤ_ℓ` duality exchanges `p` and `p⁺` and
the statement is not asserted here.

Name the resulting statement `semismallPushforwardPerversity`.

A proof proceeds as follows.

Support: for `ȳ` in `Y_β, (Rf_*K)_ȳ ≅ RΓ(f^{−1}(ȳ), K)` by proper base change (imported through
EtaleCohomologyFoundations §§F.0–F.6), and `RΓ(f^{−1}(ȳ), K) = RΓ_c` because the fibre is proper. Filter the
fibre by the locally closed pieces `Z_α := f^{−1}(ȳ) ∩ X_α` (compact-support localization sequences,
EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4).

On `X_α` the cohomology sheaves of `K` are locally constant, so the stalk condition at the generic points of `X_α`
gives `ℋ^m(K|_{X_α}) = 0` for `m > −dim X_α` everywhere on `X_α` (§2.4). Since `H^q_c(Z, F) = 0` for `q > 2·dim Z` and
every torsion sheaf `F` (§0.4), the hypercohomology spectral sequence gives `H^m_c(Z_α, K) = 0` for `m > 2·dim Z_α − dim X_α ≤ −dim Y_β`. Hence `ℋ^m(Rf_*K)_ȳ = 0` for `m > −dim Y_β`; since `y ∈ Y_β, dim(y) ≤ dim Y_β`, so `−dim Y_β ≤ −dim(y)` and the stalk vanishes for `m > −dim(y)`, which is (4.0.1) at `y`; so `Rf_*K ∈ pD^{≤0}(Y)`.

Cosupport: `D_X K` is perverse (§2.5) and satisfies the same stratum hypotheses, so `Rf_*D_X K ∈ pD^{≤0}(Y)`; `D_Y Rf_*K ≅ Rf_!D_X K = Rf_*D_X K` (EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4, `f` proper), hence
`Rf_*K ∈ pD^{≥0}(Y)` by self-duality.

Smooth source: take one stratum `X`; `K = L[n]` and `D_X K = L^∨(n)[n]` have locally constant cohomology; `dim(X ×_Y X) ≤ n` is the stated inequality summed over the strata of a partition of `Y` by fibre dimension (de
Cataldo–Migliorini Prop. 4.2.1, there over `ℂ` with a topologically locally trivial stratification, which this
étale argument does not need).

Use [deCataldo-Migliorini-2009] §4.2, Proposition 4.2.1 and Definition 4.2.2, p.56 (arXiv:0712.0349v2);
[BBD-1982] 4.2.4, p.108.

*Needs:* §2.4; §2.5; EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4; §0.4;
EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§F.0–F.6 and the
scheme-site contract above.

**Checks.**


- A proper surjective generically finite map of smooth surfaces is semismall (fibres of dimension `≤ 1` over finitely many points), so `Rf_*Λ[2]` is perverse; `e`.`g`. the blow-up of a point of `𝔸²`.

- Assume `Λ≠0`. Non-example: the blow-up `f` of a point in `𝔸³` (exceptional divisor `P²` over the point, `2·2 + 0 > 3`) is not semismall, and `Rf_*Λ[3]` has stalk `H⁴(P², Λ) ≠ 0` in degree 1 at the point, so it is not perverse.

- For a connected smooth projective curve `C`, the map `C→Spec k` fails semismallness: `2·1>1`. With nonzero constant field coefficients, `RΓ(C,Λ[1])` has nonzero perverse cohomology in degrees `−1` and `1`.

**Small maps push intersection complexes to intersection complexes.** Let `f : X → Y` be a proper surjective
morphism of irreducible separated schemes of finite type over `k, X` smooth of pure dimension `n, Λ`
self-injective (or `E`), `L` locally constant on `X`, and suppose `f` is small: there is a partition `Y = ⊔ Y_β` into
locally closed subsets with a dense open stratum `Y_0` such that `f` is semismall for it, `2·dim f^{−1}(ȳ) + dim Y_β ≤ n` for every `β` and `ȳ ∈ Y_β` (on `Y_0` this says that `f` is finite over `Y_0`, since `dim Y_0 = n`), and the
inequality is strict, `2·dim f^{−1}(ȳ) + dim Y_β < n`, for every `β ≠ 0` (de Cataldo–Migliorini Remark 4.2.4). The
semismall inequality on `Y_0` cannot be dropped: with the single stratum `Y_0 = 𝔸²` the blow-up of the origin
would satisfy the strict condition vacuously. Assume moreover that `f` is finite étale over a dense open `V ⊂ Y_0`
smooth over `k` (generic étaleness is a hypothesis: smallness does not imply it in characteristic `p`). Then `dim Y = n` and `Rf_*(L[n]) ≅ IC_Y((f_*L)|_V)`.

Work with the following additional hypotheses. `k` is a field, `n ≥ 1` an integer invertible in `k`, and `X, Y, Z, U`
are separated schemes of finite type over `k`; every point `x` has `dim(x) :=` dim of its closure
(SchemeAndStackFoundations §0.7). For duality statements `Λ` is moreover self-injective (a finite field of
characteristic `ℓ ≠ char k`, or `O_E/λ^m`, or `ℤ/ℓ^m`; §0.1), the setting of §0.2. `f` proper surjective, `X` smooth of
pure dimension `n, f` small (semismall for the partition, with strict inequalities off the dense stratum `Y_0`), `f`
finite étale over a dense smooth open `V ⊂ Y_0`.

Name the resulting statement `smallPushforwardIntersectionComplex`.

A proof proceeds as follows.

`Rf_*(L[n])` is perverse by §2.12 (smallness includes the semismall inequalities for the partition, the dense
stratum included).

Strict support: for `ȳ ∉ V` in `Y_β` of dimension `b`, the support computation of the semismall proof gives
`ℋ^m(Rf_*L[n])_ȳ = 0` for `m > 2·dim f^{−1}(ȳ) − n`, and smallness makes this `< −b`, including the zero-dimensional
fibres over strata with `b < n` (where `−n < −b`); for `ȳ ∈ Y_0 ∖ V` the fibre is finite and `dim(y) ≤ n − 1`, so the
stalk, concentrated in degree `−n`, vanishes for `m ≥ −dim(y)`. Strict cosupport by duality: `D_Y Rf_*(L[n]) ≅ Rf_*(L^∨(n)[n])`.

These are the strict bounds of §2.8 along `Y ∖ V`, so `Rf_*(L[n]) ≅ j_!*((Rf_*L[n])|_V) = IC_Y((f_*L)|_V)`
(§2.10).

Use [deCataldo-Migliorini-2009] §4.2, Remark 4.2.4, p.56 (arXiv:0712.0349v2).

*Needs:* §2.8; §2.10; §2.5.

**Checks.**


- The normalisation `ν` of a nodal cubic is small (over the node the fibre is two points: `2·0 + 0 < 1`) and finite étale over the smooth locus, so `ν_*Λ_{P¹}[1] = IC_X`.

- Assume `Λ≠0`. Non-example: the blow-up `f` of a point in `𝔸²` is semismall but not small `(2·1 + 0 = 2)`: the stalk of `Rf_*Λ[2]` at the origin is `H^*(P¹, Λ)[2]`, with `ℋ⁰ ≅ H²(P¹, Λ) ≅ Λ(−1) ≠ 0` at a point of dimension 0, which the strict stalk bound of an intersection complex forbids; so `Rf_*Λ[2]` is perverse but is not `IC_{𝔸²}`.

- In characteristic `p`, the finite purely inseparable map `𝔸¹→𝔸¹`, `a↦a^p`, is small (all fibres have dimension zero), but is finite étale on no nonempty open. Generic étaleness is a separate hypothesis.

### Examples

For `j:G_m→A¹` and field coefficients, `j_!*(Λ[1])=Λ_A¹[1]`, while `pj_!Λ[1]` has the boundary subobject `i_*Λ`. On a nodal curve, `IC` has a rank-two stalk at the node after normalization; the shifted constant sheaf is perverse but differs from `IC`. These examples detect an image formed in the wrong heart or a missing dimension shift.

### Dependencies

Layer 0; EtaleCohomologyFoundations §F.8 and its derived coefficients; Mathlib `t`-structures, truncation triangles and abelian-subcategory criterion; SchemeAndStackFoundations §0.7.

## Layer 3: ramified adic coefficients and comparison maps

### 3.1 Ramified normalized constructible systems

Extend the supplied `Z_ℓ` normalization and realization to `O/λ^m` towers with a common finite stratification and uniform ordinary and `Tor` bounds.

**Uniformly bounded constructible normalized adic systems.** For a complete DVR `O` as in the coefficient
conventions, write `R_n=O/λ^(n+1)`. Import `Sys_O` as the limit in enhanced stable categories of `D(X_ét,R_n)` under
derived coefficient reduction (EnhancedDerivedSheaves §E4.5). Equivalently, use its coCartesian-section
description: levels, reduction equivalences, all higher associator coherences and homotopy-coherent maps. A
list of level isomorphisms with only identity and triple equations in the triangulated homotopy categories is
insufficient. Define the normalized full subcategory by requiring each level bounded constructible, a single
ordinary interval and `Tor` interval valid at every level (`Tor` tested against all degree-zero ambient
`R_n`-sheaves), and one finite algebraic stratification with all level cohomology sheaves lisse finite.
NormalizedSystem is the homotopy category of this enhanced full subcategory; take the homotopy category after
the enhanced limit. Reduction is ambient derived tensor, corestricted to bounded objects only through these
witnesses. For `O=ℤ_ℓ` the uniform-bounds system is imported from EtaleCohomologyFoundations §F.4.1; the residue
is the ramified tower and the common-stratification API. No unrestricted triangulated inverse limit is
declared constructible.

Work with the following additional hypotheses. `X` is a noetherian finite-dimensional scheme with `ℓ` invertible;
`O` is the ring of integers in a finite extension of `ℚ_ℓ`, with uniformizer `λ`. The geometric comparison and
six-operation extensions retain their additional finite-type/base hypotheses from their respective statements.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.normalized_system_reduction`: Under the equivalence, the `n`-th level is canonically isomorphic to derived reduction of the original integral complex.

- `TauCeti.EtaleDuality.normalized_system_uniform_bounds`: Every normalized system has one lower and one upper ordinary cohomological bound valid at every level.

- `TauCeti.EtaleDuality.normalized_system_common_strata`: Every normalized system has one finite algebraic stratification on which every cohomology sheaf at every level is lisse.

- `TauCeti.EtaleDuality.normalized_system_finiteTor`: Each bounded level of a normalized system has finite `Tor` amplitude, measured in its ambient unbounded coefficient category against all degree-zero sheaves; the system predicate supplies the same interval for all levels.

A proof proceeds as follows.

Use the enhanced coefficient diagram and its full homotopy-coherent limit of EnhancedDerivedSheaves §E4.5,
with tensor associators of §§0.3–0.4. Restrict it by the ordinary`/Tor` bounds and constructibility predicate;
do not reconstruct its objects or morphisms from a 2-limit of homotopy categories. Its visible identity/triple
comparisons are consequences of this full coherence, not the definition. All `Tor` and reduction tests occur in
the unbounded ambient coefficient categories.

Bhatt–Scholze Definition 6.5.1 and Proposition 6.6.11 (pp.49,54) identify constructibility with derived
completeness and stratumwise perfect local models. For a noetherian finite-dimensional `X` these provide a
common finite stratification and uniform bounds. The operations and their reduction compatibilities use Lemmas
6.7.13,6.7.18–6.7.20 (pp.57–58), with rational passage in 6.8.14–6.8.15 (pp.61–62). E4 reconstruction gives
completeness, not constructibility by itself.

The normalization equivalence identifies every level with derived coefficient reduction; for `O = ℤ_ℓ` this is
the comparison of EtaleCohomologyFoundations §§F.4.1–F.4.3.

Over `O`, which has global dimension one, integral-to-quotient reduction of a bounded constructible complex has
a bounded realization. Quotient-to-quotient reduction does not have this property on all Dbc objects. On a
separably closed point, `R = ℤ/ℓ²` and `M = R/ℓ` have `Tor_i(M, M) = M` and `Ext^i(M, M) = M` for every `i ≥ 0`; the
periodic multiplication-by-`ℓ` free resolution proves the obstruction (compare the `Tor` check of
EtaleCohomologyFoundations §F.1). `M` remains in Dbc and in the point perverse heart, but has no finite `Tor`
amplitude.

Use the coefficient-module sheaf category for the specified regime: finite levels have the `t`-exact native
étale identification, while integral and rational objects realize in the pro-étale completed-coefficient
category (EtaleCohomologyFoundations §F.4.3). Neither faithful realization nor its `t`-compatibility is asserted
for ordinary étale constant-`O` sheaves.

Use [Bhatt-Scholze-proetale-2015] §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2,
Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2); [BBD-1982] 2.2.14, p.71;
[TCR-EtaleCohomologyFoundations] §F.4.1, VanishingCycles.normalizedAdicSystems;
[TCR-EnhancedDerivedSheaves] §E4.5 (`Sys_I` and coCartesian sections), with §§0.3–0.4.

*Needs:* EnhancedDerivedSheaves Layer 4.

**Checks.**


- `TauCeti.EtaleDuality.adic_constant_normalized`: The constant integral complex produces a normalized system with uniform ordinary and `Tor` bounds.

- `TauCeti.EtaleDuality.adic_reduction_coherence`: Successive reductions through `n,m,l` agree with direct reduction by the specified coefficient associator.

- `TauCeti.EtaleDuality.adic_underived_residue_tower_excluded`: On a geometric point the ordinary compatible tower `M_n=O/λ` concentrated in degree zero is not a derived-normalized system. Already `(O/λ)⊗^L_{O/λ²}(O/λ)` has a nonzero `O/λ` in every nonpositive degree, so reduction from `n=1` to `n=0` is not `M_0[0]`.

- `TauCeti.EtaleDuality.nonperfect_point_unbounded_operations`: Over a separably closed point and `R=Z/ell²`, the degree-zero finite module `M=R/`ell belongs to Dbc, is not finite-Tor, and its ambient self-tensor has `M` in every nonpositive degree while its ambient self-`RHom` has `M` in every nonnegative degree. The test fixes the actual quotient module and asserts those cohomology identifications in the ambient categories.

- `TauCeti.EtaleDuality.adic_integral_torsion_derived_levels`: The integral torsion object `O/λ` is retained: its derived `n`-th level is the perfect two-term complex [`R_n` --`λ→ R_n`] in degrees `−1,0`. These levels form a normalized enhanced system with uniform `Tor` interval `[−1,0]`, unlike the underived degree-zero residue tower.

- The reduction functors and their composition transformations are those of the imported enhanced limit; passing to its homotopy category preserves them without replacing the system by a list of pairwise isomorphisms.

- Agreement with EtaleCohomologyFoundations: for `O = ℤ_ℓ` a system is normalized exactly when it is a normalized system in the sense of EtaleCohomologyFoundations §F.4.1 whose levels admit one common lisse stratification; the constant tower is normalized there and here.

**Evaluation and successive coefficient reduction.** In the coefficient, geometric and category setting of
Uniformly bounded constructible normalized adic systems: Under the equivalence, the `n`-th level is canonically
isomorphic to derived reduction of the original integral complex.

Name the resulting statement `apiNormalizedSystemReduction`.

A proof proceeds as follows.

The `n`-th evaluation of the enhanced coefficient-system limit is derived reduction by its normalization
equivalence; use its coCartesian transition edges and the coefficient associator for successive reductions.
This is a natural equivalence in the original complex, not an arbitrary isomorphism chosen for each level.

Use [Bhatt-Scholze-proetale-2015] §3.5, Lemmas 3.5.5 and 3.5.7, pp.25–26; §6.5, Definition 6.5.1, p.49 (arXiv
v2); enhanced refinement: EnhancedDerivedSheaves §E4.5.

**Checks.**


- On a geometric point, the constant integral object `O` has `n`-th level `R_n` in degree zero.

- For the integral torsion object `O/λ`, the `n`-th level is [`R_n` --`λ→ R_n`] in degrees `−1,0`, not the degree-zero residue module; successive derived reductions preserve this two-term model.

**A common cohomological interval.** In the coefficient, geometric and category setting of Uniformly bounded
constructible normalized adic systems: Every normalized system has one lower and one upper ordinary
cohomological bound valid at every level.

Name the resulting statement `apiNormalizedSystemUniformBounds`.

A proof proceeds as follows.

Project the ordinary-bound witness in the normalized full-subcategory predicate. Under reconstruction from a
bounded integral complex with ordinary amplitude `[a,b], O` has global dimension one, so derived reduction has
ordinary amplitude contained in `[a−1,b]` for all `n`. Uniformity does not follow merely from each level being
bounded separately.

Use [Bhatt-Scholze-proetale-2015] §6.5, Definition 6.5.1 and Lemmas 6.5.3–6.5.4, pp.49–50 (arXiv v2).

**Checks.**


- On a point, `O` in degree zero has the same ordinary interval [0,0] at every level.

- On a point, `O/λ` has uniform ordinary interval `[−1,0]` at every derived level. A family with bounds depending on `n` supplies no uniform-bound witness.

**Strata shared by every level.** In the coefficient, geometric and category setting of Uniformly bounded
constructible normalized adic systems: Every normalized system has one finite algebraic stratification on
which every cohomology sheaf at every level is lisse.

Name the resulting statement `apiNormalizedSystemCommonStrata`.

A proof proceeds as follows.

Project the common-stratification witness in the normalized full-subcategory predicate. For reconstructed
constructible pro-étale complexes use Bhatt–Scholze Proposition 6.6.11 to choose one finite algebraic
stratification; derived reduction of each stratumwise perfect `O`-local model remains lisse in every
cohomological degree. Individual level stratifications alone are not the asserted common witness.

Use [Bhatt-Scholze-proetale-2015] §6.6, Proposition 6.6.11, p.54 (arXiv v2).

**Checks.**


- The constant `O`-system on a connected smooth `X` uses the single stratum `X` for every `n`.

- On `A¹` with `j:G_m→A¹`, the system of `j_!O` uses the fixed two-stratum decomposition `G_m` and {0}; reductions have lisse cohomology on `G_m` and zero stalk at {0}.

**Classical and pro-étale `ℓ`-adic constructible categories.** For `X` of finite type over a field, or over a
regular `ℤ[1/ℓ]`-base of dimension at most one, extend the supplied normalized `ℤ_ℓ` coefficient category to a
possibly ramified `O=O_E`. The category `D^b_c(X, O)`, obtained by taking the homotopy category of the normalized
full subcategory of the enhanced coefficient-system limit of EnhancedDerivedSheaves §E4.5, with `K_m ∈ D_ctf(X, O/λ^m)` and homotopy-coherent derived reduction equivalences (§3.1) is equivalent to Bhatt–Scholze's
`D_cons(X_proét, O)` of derived `λ`-complete objects whose reductions are constructible, compatibly with the
reduction functors `K ↦ K ⊗^L O/λ^m`. `D^b_c(X, E) := D^b_c(X, O) ⊗ E` is the full subcategory `D_cons(X_proét, E)`,
and `D^b_c(X, Ē)` is the 2-colimit over finite `E'/E`. Both carry the six operations `f^*, Rf_*, Rf_!, f^!, ⊗, RHom`, compatible with the finite-level ones under reduction and with coefficient extension `E → E'`; for `O = ℤ_ℓ`
these are the imported operations.

Work with the following additional hypotheses. `X` of finite type over a field (or a regular base of dimension `≤ 1`) with `ℓ` invertible; `E/ℚ_ℓ` finite. For the six operations use the hypotheses of Bhatt–Scholze §§6.6–6.7 and
Remark 6.8.15: noetherian finite-dimensional bases with `ℓ` invertible, and the quasi-excellence hypothesis of
6.7.1 for nonproper direct image. Completion and coefficient reconstruction on a replete topos are
EnhancedDerivedSheaves E4 (§E4.5); constructibility, boundedness and the scheme six operations are additional
inputs, not consequences of repleteness alone. Tensor, internal `Hom` and coefficient change are the enhanced
operations of EnhancedDerivedSheaves §0.3 in the ambient unbounded derived category; finite `Tor` amplitude is
tested there against all degree-zero sheaves. Bounded outputs require actual bounded-constructible restriction
witnesses. General-ring trace evaluation uses `ctf` inputs; bounded duality on every Dbc object uses its stated
coefficient regime.

Name the resulting statement `classicalAndProetaleAdicCategories`.

A proof proceeds as follows.

Pro-étale side: `D(X_proét, O)` and derived completion are EnhancedDerivedSheaves E4 (coefficient-system
reconstruction, EnhancedDerivedSheaves Layer 4); `D_cons` is the subcategory of complete objects with
constructible reductions (Bhatt–Scholze 6.5).

Use the enhanced limit and all higher coherence of EnhancedDerivedSheaves §E4.5, taking its homotopy category
only afterwards. The equivalence with `λ`-adic systems: `K ↦ (K ⊗^L O/λ^m)_m` with inverse Rlim (Bhatt–Scholze,
comparison with Ekedahl's category; EnhancedDerivedSheaves Layer 4). For `O = ℤ_ℓ` this is
EtaleCohomologyFoundations §§F.4.2–F.4.3; for ramified `O` the same argument applies to the tower `O/λ^m`, since
`O/λ^{em}` is a finite free `ℤ/ℓ^m`-algebra (`e` the ramification index) and the realization, its Milnor sequence
and the pro-étale comparison only use the uniform bounds and the finite-level operations.

Six operations on `D^b_c(X, O)`: defined levelwise on normalized systems by the finite-level operations of
EtaleCohomologyFoundations §§0.7–0.8, F.2 and F.5, which preserve `D_ctf` and commute with `⊗^L O/λ^m` (projection
formula, §F.2.7; finiteness, §F.3); `E` and `Ē` by localization and colimit (Bhatt–Scholze 6.8; for finite `E` also
§F.4.5).

Use [Bhatt-Scholze-proetale-2015] §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2,
Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2); [TCR-EtaleCohomologyFoundations] §§F.4.1–F.4.6
and F.5; [TCR-EnhancedDerivedSheaves] §0.3 (ClassicalDerived.tensorHom,
inverseLimits, derivedCompletion) and §E4.5.

*Needs:* EnhancedDerivedSheaves Layer 4.

**Checks.**


- `X = Spec Ω, Ω` separably closed: `D^b_c(X, O) ≃ D^b_{fg}(O)` and `D^b_c(X, E) ≃ D^b_{fd}(E)`.

- The constant system `(O/λ^m)_m` corresponds to `O_X`; its rationalization is `E_X`.

- On a geometric point, `O/λ` is a nonzero object of `D^b_c(X,O)`. Its `m`-th derived level is `[O/λ^m →^{λ} O/λ^m]` in degrees `−1,0`, obtained from the two-term free `O`-resolution. It becomes zero in `D^b_c(X,E)`. Thus neither rationalization nor an underived degree-zero residue tower replaces the integral category.

### 3.2 Strict reduction and integral mapping limits

**Strict reduction of integral exceptional pullback and duality.** Let `k` be a field with `ℓ` invertible, `O` the
integers of a finite extension of `ℚ_ℓ, λ` a uniformizer, `O_n=O/λ^n (n≥1)`, and `f:X→Y` a separated finite-type
morphism of separated finite-type `k`-schemes. In the imported normalized constructible adic/pro-étale category
write `ρ_nK=K⊗^L_O O_n` and `K_X=a_X^!O`. The canonical comparisons `ρ_n f^!K≃f_n^!ρ_nK, ρ_n Rf_*M≃Rf_{n,*}ρ_nM`,
and `ρ_n Rf_!M≃Rf_{n,!}ρ_nM` hold. Completed pullback and tensor commute with reduction; internal `Hom` satisfies
`ρ_n RHom_O(M,N)≃RHom_{O_n}(ρ_nM,ρ_nN)`. Consequently `ρ_nK_X≃a_X^!O_n, ρ_nD_XM≃D_{X,n}ρ_nM`, and the integral
biduality map is an isomorphism. These comparisons respect identity, composition and repeated reduction.
Outputs are bounded constructible, with one finite stratification and ordinary`/Tor` bounds independent of `n`.

Work with the following additional hypotheses. `K,M,N` are bounded constructible derived-complete `O`-complexes
with perfect stalks on finite strata; over the regular DVR `O` this includes bounded finitely generated stalk
complexes and integral torsion. Finite-type schemes over a field are noetherian, excellent and finite
dimensional. The finite cohomological dimension used for direct images is that of the relative étale
pushforward, supplied by the finite-level finiteness theorem, not an assertion about arithmetic global
cohomology. Internal `Hom` is sheaf internal `Hom`. A constructible object supported on a stratum need not be
globally tensor-dualizable. Restrict bounded coefficient operations through actual finite-Tor witnesses.

Name the resulting statement `operationReductionComparisons`.

A proof proceeds as follows.

Use §3.1’s homotopy-coherent ramified normalized-system/pro-étale equivalence and reduction functors. The
generic derived-limit operations are EnhancedDerivedSheaves Layer 4; EtaleCohomologyFoundations §F.4 provides
the `ℤ_ℓ` special case and geometric finiteness.

Apply Bhatt–Scholze 6.7.1 to obtain finite relative cohomological dimension and 6.5.11 for strict `Rf_*`
reduction. Use a compactification, finite-level proper support and 6.7.6–6.7.10 for `Rf_!`; do not identify `Rf_!`
with the right derived functor of `H^0f_!` on the pro-étale site.

For `f^!`, use 6.7.18: locally factor `f` as a closed immersion followed by a smooth map. Smooth purity gives
reduction on the smooth factor; the closed factor uses the localization triangle and direct-image scalar
comparison for its open complement. Then 6.7.19 constructs the compatible limit and its adjunction.

Apply 6.7.13 by stratified dévissage for internal `Hom` and use `f=a_X` for `K_X`. Reduce biduality to the
finite-level §0.2 map and use conservativity on derived-complete objects.

The noetherian stratification criterion 6.6.11 gives common strata; local perfect `O`-complexes give uniform `Tor`
bounds for reductions. Coherence comes from the canonical exchange maps in the enhanced imported formalism.

Use [Bhatt-Scholze-proetale-2015] Lemma 6.5.11, p.51; Proposition 6.6.11, p.54; 6.7.1–6.7.2, p.55;
6.7.6–6.7.13, pp.56–57; 6.7.18–6.7.19, pp.57–58; [TCR-EtaleCohomologyFoundations] §F.4, normalized `ℤ_ℓ`
realization and finite-`E` lattice coefficients.

*Needs:* EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; §3.1;
EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3; EtaleCohomologyFoundations §F.5;
EnhancedDerivedSheaves §0.4; §0.2; EtaleCohomologyFoundations §§0.11, F.6.

**Checks.**


- At a geometric point, the object `O/λ` in degree zero is admitted; its derived `O_n`-reduction has nonzero degrees `−1` and 0, so reduction is not ordinary tensor on cohomology.

- For smooth `f` of relative dimension `d`, the comparison reduces `f^!O=O(d)[2d]` to `O_n(d)[2d]`, preserving the trace-normalized purity map.

- For a smooth closed divisor and its open complement, reduction commutes with the supported localization triangle.

**Coherent mapping limits for integral traces and cycle classes.** Let `X` be separated finite type over a
separably closed field `k, ℓ` invertible in `k`, and `M,N` in the bounded constructible derived-complete `O`-category
above. With `M_n=ρ_nM, N_n=ρ_nN`, the canonical equivalence of derived `O`-module mapping complexes is
`RHom_X(M,N)≃Rlim_n RHom_{X,O_n}(M_n,N_n)`. Thus `0→lim¹_n Hom(M_n,N_n[−1])→Hom_X(M,N)→lim_n Hom(M_n,N_n)→0`.
Finite-level shifted `Hom` groups are finite, so the `lim¹` term vanishes in this geometric setting. Compatible
finite-level traces, evaluation/biduality maps, cup products, smooth-pair Gysin morphisms and supported cycle
classes give unique integral maps with these reductions; their finite-level naturality, composition and
projection identities hold integrally. The maps agree under the classical/pro-étale realization equivalence
and rationalize to the `E`-valued maps. Integral derived cohomology retains the `Tor` and `Ext` terms of coefficient
reduction and duality.

Work with the following additional hypotheses. `O` is a finite-extension integer ring as above; coefficients are
finite at each level and objects have common finite strata, coherent reductions and uniform ordinary`/Tor`
bounds. `RHom_X` denotes `RΓ(X,RHom_O(M,N))`, not only sheaf internal `Hom`. Finiteness and the degreewise `Hom`-limit
identity use separably closed `k`. For arithmetic `k` retain the derived mapping equivalence when its imported
hypotheses hold and the displayed `lim¹` obstruction; no unconditional equality detection is asserted. Relative
natural transformations are first supplied with enhanced compatibility/homotopies. The geometric `Hom`-limit
consequence applies to each specified pair of objects; it is not a replacement for coherent functor-level
data.

Name the resulting statement `mappingLimitAndIntegralClassTransport`.

A proof proceeds as follows.

Use §3.1’s homotopy-coherent ramified normalized-system/pro-étale equivalence and reduction functors. The
generic derived-limit operations are EnhancedDerivedSheaves Layer 4; EtaleCohomologyFoundations §F.4 provides
the `ℤ_ℓ` special case and geometric finiteness.

Apply the Milnor sequence to the derived mapping complex. Finite-level constructibility and geometric
cohomological finiteness imply every shifted `Hom` group is finite; descending images in each finite group
stabilize, proving Mittag–Leffler rather than assuming surjective transition maps.

Lift the specified compatible finite-level morphisms through this mapping equivalence. Compare both sides of
an identity by their coherent reductions and use the vanishing `lim¹` term. For adjunction and purity use their
canonical enhanced maps, not arbitrary choices of lifts.

Import the integral derived Poincaré-duality statement and its `Ext¹` sequence from §0.6. For a perfect
`O`-complex `C`, retain `0→H^q(C)⊗O_n→H^q(C⊗^LO_n)→H^{q+1}(C)[λ^n]→0`. Flat rationalization removes the torsion only
after these integral statements have been established.

Use [Bhatt-Scholze-proetale-2015] Lemma 6.6.2, p.52; Lemma 6.7.13, p.57; 6.8.14–6.8.15, pp.61–62; [BBD-1982]
§2.2, p.72 (derived coefficient `Tor` sequence); 2.2.16, p.73 (adic `Hom/`Milnor sequence);
[TCR-EtaleCohomologyFoundations] §F.4, normalized `ℤ_ℓ` realization and finite-`E` lattice coefficients.

*Needs:* EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; EtaleCohomologyFoundations
§F.5; EnhancedDerivedSheaves §0.4; §0.4; EtaleCohomologyFoundations §0.9; §0.6; EtaleCohomologyFoundations
§§0.10, F.6; §1.1; §1.3.

**Checks.**


- On a point take `C=O/λ` in degree zero. `RHom_O(C,O)` has `H¹=O/λ` and `H⁰=0`; `C⊗^LO_n` has `H⁻¹` and `H⁰` both `O/λ`. A rational-only pairing would erase this test.

- For `P¹`, the integral trace of `c₁(O(1))` is 1, and every reduction gives the finite-level value 1.

- On an open smooth curve, the localization triangle and trace commute with finite-level reduction; no ordinary-cohomology substitute for compact support is used.

- A smooth divisor class is compatible under reduction, integral realization and rationalization.

### 3.3 Perverse coefficient extension

**Perverse `t`-structures with `ℓ`-adic coefficients and coefficient extension.** For `X` of finite type over `k` (`ℓ`
invertible) and `E/ℚ_ℓ` finite, the middle perverse `t`-structure of §2.4 on `D^b_c(X, E)` and on `D^b_c(X, Ē) := 2-colim_{E'} D^b_c(X, E')` is compatible with coefficient extension: for a finite extension `E ⊂ E', K ↦ K ⊗_E E'` is `t`-exact, induces an exact functor `Perv(X, E) → Perv(X, E')`, commutes with `j_!*` and `IC (IC_X(L) ⊗_E E' ≅ IC_X(L ⊗_E E'))`, and `Hom_{Perv(X,E')}(K ⊗ E', L ⊗ E') = Hom_{Perv(X,E)}(K, L) ⊗_E E'`. Reduction from `O` to `O/λ (K ↦ K ⊗^L O/λ)` is right `t`-exact for `p` and sends the heart of `p` to `pD^{[−1,0]}` (EtaleCohomologyFoundations
§F.8 (integral `p/p+` tilt, pointwise criteria and duality)). Simple objects of `Perv(X, Ē)` are defined over some
finite `E'`.

Work with the following additional hypotheses. `X` of finite type over a field, `ℓ` invertible; `E ⊂ E'` finite
extensions of `ℚ_ℓ`. The perverse `t`-structures are those of §2.4 (specified by EtaleCohomologyFoundations as
VanishingCycles.fieldPerverseTStructure, EtaleCohomologyFoundations §F.8, for finite and `ℓ`-adic coefficients).
The `Hom` scalar-extension identity is for a finite coefficient-field extension (general algebraic extensions
through the stated filtered colimit), not an arbitrary field homomorphism.

Name the resulting statement `rationalPerverseCoefficientExtension`.

A proof proceeds as follows.

Faithfully flat finite scalar extension commutes with stalks and costalks and is exact, hence perverse
`t`-exact. It commutes with images in the heart, so commutes with `j_!*` and `IC` without using the special
standard-truncation formula. The algebraic-closure case is the filtered union of finite coefficient
extensions.

Homs: finite field extension is a finite direct sum after choosing a basis. Additivity gives the canonical
derived-mapping scalar-extension isomorphism, independently of trace comparison.

Reduction: `K ⊗^L O/λ` sits in the triangle `K →λ K → K ⊗^L O/λ →`, whose perverse cohomology sequence gives the
amplitude `[−1, 0]`.

Use [BBD-1982] §4.0, pp.101–102; 6.1.2`(A″),(B″)`, pp.149–150; 2.2.18, p.73;
[TCR-EtaleCohomologyFoundations] §F.8, VanishingCycles.fieldPerverseTStructure and
VanishingCycles.intermediateExtension.

*Needs:* §2.4; §2.8; EtaleCohomologyFoundations §F.8 (integral `p/p+` tilt, pointwise criteria and duality);
§3.1.

**Checks.**


- `TauCeti.EtaleDuality.coefficient_extension_reflects_zero_morphism`: Finite faithful field extension detects a zero morphism between perverse objects.

- `TauCeti.EtaleDuality.coefficient_extension_point_rank`: Extension of a finite-dimensional point coefficient space preserves rank, also for a quadratic field extension.

- `TauCeti.EtaleDuality.coefficient_extension_zero_object`: Extension sends the zero perverse object to zero.

- `IC_X(Ē)` of a smooth curve is `Ē[1]`.

- For `X = Spec Ω, ⊗E'` is the scalar extension of finite-dimensional vector spaces.

### 3.4 Finite extension of duality and cycle maps

**Finite coefficient extension preserves duality and its morphisms.** For finite `E⊂E′` over `ℚ_ℓ`, rings of
integers `O⊂O′`, and separated finite-type `X,Y` over a field where `ℓ` is invertible, finite free scalar extension
commutes canonically with `f^*, Rf_*, Rf_!, f^!`, internal `Hom, K_X` and `D_X` on the bounded constructible adic
categories. It sends trace, evaluation, biduality, cup, Gysin and cycle-class maps to their `O′`-counterparts.
Integral comparison uses `O/λ^n→O′/λ^`nO′; this is a cofinal subsequence of the `λ′`-adic tower, with ramification
index accounted for. After inverting `ℓ` the same statements hold for `E→E′`. Use the existing perverse
coefficient-extension theorem for perverse `t`-exactness, `j_!*` and `IC`. For an algebraic closure Ebar, form the
filtered coefficient category from finite subextensions: every specified bounded constructible object,
morphism and finite diagram descends to a finite subextension, and the preceding compatibilities pass to that
category.

Work with the following additional hypotheses. All scalar extensions here are finite free extensions of
complete DVRs or finite coefficient-field extensions, followed by the specified filtered algebraic-extension
category. An unrestricted category of all analytic Ebar-valued local systems is not used. Integral torsion
objects are retained; derived reduction `O→O/λ` is distinct from the flat `O→O′` and `E→E′` operations and is not
perverse `t`-exact. For `Hom` base change in the rational constructible category use its actual mapping complexes.
No assertion that a simple object remains simple after coefficient extension is made. The operation and mate
identities are canonical enhanced comparisons over arbitrary `k` in this range; their proof does not use the
separably-closed-field `Hom`-limit uniqueness theorem.

Name the resulting statement `coefficientExtensionDualityAndClasses`.

A proof proceeds as follows.

Finite free extension is exact and can be computed by a finite direct sum after choosing a basis; canonical
`O`-linear operation comparisons are isomorphisms by that calculation. Apply the operation-reduction result to
the cofinal `λ^`nO′ tower and its ramification comparison.

Compare the adjunction units/counits and tensor-`Hom` evaluations under scalar extension. Their mates yield the
duality and trace identities; the finite-level constructions of Layer 1 yield the cycle/Gysin identities.

Use the imported rationalization, finite-coefficient descent of Bhatt–Scholze 6.8.14 and the existing rational
perverse coefficient-extension theorem. Finite diagrams and their coherence data descend together; the
filtered-colimit construction is owned by the imported coefficient category.

Use [Bhatt-Scholze-proetale-2015] 6.8.2, pp.58–59; 6.8.14–6.8.15, pp.61–62; [BBD-1982] 2.2.18, p.73;
6.1.2`(C′)`, pp.150–151; [TCR-EtaleCohomologyFoundations] §F.4, normalized `ℤ_ℓ` realization and finite-`E`
lattice coefficients.

*Needs:* §3.2; §3.3; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above;
EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- At a point `O/λ` extends to `O′/λO′`, whose length over `O′` is the ramification index; replacing it by `O′/λ′` would lose the integral information.

- On `P¹` the trace of the extended first Chern class is still `1∈O′` and `1∈E′`.

- For a smooth divisor, extension commutes with its localization boundary/Gysin map; Layer 2 supplies the separate integral perverse reduction amplitude `[−1,0]`.

### 3.5 Betti comparison of perverse categories

Add perverse equivalences, the rational stable-lattice essential image and nonproper constructible `Rf*` exchange to the supplied finite and adic Artin comparisons.

**Comparison with the complex-analytic constructible category.** For `X` separated of finite type over `ℂ`,
strengthen the supplied Artin comparisons by the following categorical and perverse equivalences, ramified
integral coefficients and nonproper constructible `Rf_*` exchange. The comparison functor `ε^* : D^b_c(X_ét, Λ) → D^b_c(X^an, Λ)` (constructible for algebraic stratifications) is an equivalence for finite `Λ` (BBD 6.1.2, from
Artin's comparison theorem SGA 4 XVI 4.1), commutes with `f^*, Rf_*, Rf_!` and `f^!` in their constructible ranges
for morphisms of finite type. Tensor and `RHom` comparison are stated in the ambient unbounded categories: for
bounded constructible `K,L`, finite `Tor` amplitude of `K` gives bounded-constructible restriction receipts for `K⊗^L L` and `RHom(K,L)`, and the comparisons then restrict through these receipts. Bounded Verdier duality on every
Dbc object is asserted only for the finite-field, DVR-quotient, integral and rational coefficient regimes; for
a general finite ring it uses the existing `ctf` input range. The functor is `t`-exact for the middle perverse
`t`-structures, so it identifies `Perv(X_ét, Λ)` with algebraically constructible perverse sheaves on `X^an` and
preserves `j_!*` and `IC`. For `O_E` coefficients the corresponding equivalence follows from finite-level
comparison. For `E` coefficients the functor is fully faithful with essential image the algebraically
constructible complexes whose cohomology local systems on normal connected strata admit monodromy-stable `O_E`
lattices (BBD 6.1.2`(A″),(B″)`); it is an equivalence onto that image; the comparison of trace maps and cycle
classes with topological orientation classes is §3.7.

Work with the following additional hypotheses. `X` separated of finite type over `ℂ`; algebraically constructible
complexes; `Λ` finite, `O_E` or `E`. For `E` coefficients the analytic target is restricted to the
monodromy-stable-lattice essential image. A rank-one `E` local system on `ℂ×` with monodromy `ℓ` admits no stable
`O_E` lattice and is not the analytification of an étale `E` local system. Tensor and internal-`Hom` outputs are
first ambient objects. A bounded output is corestricted only with its actual bounded-constructible witness;
the displayed comparisons use finite-Tor first input. Analytic complex-field tensor`/RHom` used by
geometric-origin constructors has separate field-coefficient boundedness receipts.

Name the resulting statement `complexAnalyticComparison`.

A proof proceeds as follows.

Import analytification and the finite/adic ordinary and compact comparisons from ComplexComparisonPartII
§§C−1.1,C6.0–C6.6 [TCR-ComplexComparisonPartII]. Its generic enhanced analytic categories use
EnhancedDerivedSheaves §§0.1–0.4. It already supplies proper `Rf_*` and separated `Rf_!` exchange on `ctf` inputs.
Prove the remaining nonproper constructible `Rf_*` comparison using EtaleCohomologyFoundations
§§F.0–F.6 and the scheme-site contract above. BBD 6.1.2, pp.148–151 supplies the categorical refinement:
finite and integral equivalences and rational full faithfulness with the stable-lattice essential image. Apply
the finite comparisons levelwise to the coherent `λ`-adic systems for ramified `O_E`.

For the finite non-`ctf` coefficient range, use BBD 6.1.2`(C), (C′)` and their proof, pp.150–151, with its
localization/dévissage argument to extend the operation comparison beyond the imported `ctf` exchange. `Rf_!` is
computed by proper pushforward and `j_!` using the existing Nagata compactifications. Define the `f^!` exchange by
adjunction; compute it locally via smooth purity and closed/open localization as in BBD p.151. Do not infer it
solely from global full faithfulness of `ε^*`.

Perverse `t`-exactness: the stalk/costalk conditions are computed on points of `X` and stratifications, which
agree on both sides.

Realize Dbc in the unbounded coefficient category appropriate to its regime and AnalyticDbc in the native
derived category of analytic module sheaves. Compare the ambient tensor and `RHom` of the realized inputs;
finite-Tor boundedness receipts and realization isomorphisms identify the bounded restrictions. Over complex
coefficient fields, use their separate analytic boundedness theorem, not a universal bounded operation over
arbitrary rings.

Use [BBD-1982] 6.1.2`(A), (A′), (A″), (B′), (B″), (C), (C′)` and the proof, pp.148–151; [TCR-ComplexComparisonPartII]
§§C−1.1,C6.0–C6.6.

*Needs:* §2.4; §2.8; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `TauCeti.EtaleDuality.analytic_monodromy_nonunit`: On `C×` a rank-one analytic `E` local system with monodromy the uniformizer has no monodromy-stable finite free `O` lattice.

- `X = 𝔸¹_ℂ: H^q(𝔸¹_ét, Λ) = H^q(ℂ, Λ) = Λ` for `q = 0, 0` otherwise.

- `IC` of the nodal cubic over `ℂ: ε^*IC_X = ν_*Λ_{P¹(ℂ)}[1]`, the topological `IC` complex.

### 3.6 Tate lines, orientation and supported classes

**Supported topological orientation and complete coefficients.** Work on the locally compact Hausdorff analytic spaces of finite-type complex varieties, with finite cohomological dimension and algebraically constructible complexes. Define `BettiSupportedPurity` using relative cochains of the normal bundle and its complement of the zero section. For a smooth closed subvariety `i:Z→X` of a smooth complex variety `X`, of pure codimension `c`, complex orientation of the normal bundle gives `i^!Λ_X≅Λ_Z(−c)[−2c]`, after the Tate-line identification below. This constant-coefficient purity assertion is restricted to smooth pairs. Define its supported sheaf Thom class and Gysin map by the closed-support adjunction. Under the relative sheaf–cochain realization, identify their induced ordinary maps with CharacteristicClasses C2.1–C2.4's `U_E` and embedding Gysin for the same positive complex orientation, products and supports. Prove compatibility with the supplied integration on compactly supported top cochains. Import oriented fibre integration and trace normalization from ComplexComparisonPartII §C6.5 / `artinSmoothTrace`, and normalized topological realization with integral and rational traces from §C6.6 / `adicArtinComparison`. Extend those coefficient systems to ramified `O=O_E` using §3.4. Define this extension `BettiNormalizedSystem(O)` as coherent derived-complete `O/λ^m` systems in the supplied analytic constructible enhancement, with one finite algebraic stratification and uniform ordinary and `Tor` bounds; its reductions are derived reductions. The additional constructions are supported sheaf purity, its realization comparison with the ordinary Thom/Gysin maps, higher-cycle comparison and constructible duality, using the relative cochains and compact-manifold duality of AlgebraicTopology Stage 6.

The API consists of `thom_normalCoordinate` (positive complex-coordinate generator), `thom_product` (direct sums of normal bundles), `gysin_localization`, `gysin_projection`, `thom_realization` (the realized supported class equals the supplied `U_N` of the normal bundle), `gysin_realization` (the realized support-adjunction map equals the supplied embedding Gysin), `trace_compactSupport` (compatibility with the imported trace after ramified coefficient extension), `bettiDuality_evaluation`, `normalized_reduce`, and `normalized_mappingLimit`. For an algebraically constructible finite-Tor `K` on a smooth complex `d`-fold, the duality statement is `RΓ(X,RHom(K,Λ(d)[2d]))≅RHom(RΓ_c(X,K),Λ)`; retain the derived `Hom` and its integral `Ext` term. At `O`-level use the complete limit of the finite-level maps; after inverting `λ` retain the stable-lattice analytic essential image from §3.5.

Construct the supported sheaf class on `(ℂ^c,ℂ^c−{0})` from the positive relative-cochain generator. Localization glues it along the normal bundle. Under relative sheaf–cochain realization, uniqueness of the supplied Thom class with these fibre generators identifies it with CharacteristicClasses C2.1's `U_N`. Compare support adjunction with tubular extension to obtain C2.4's embedding Gysin. Transport C2.2–C2.4's products, projection and composition identities through this comparison, retaining the same support groups. For noncompact duality start with a trivial local system on an oriented ball, where compactly supported relative cochains calculate the shifted coefficient dual. Use finite algebraic stratification, open/closed localization and duality triangles to pass to constructible complexes; use finite projective coefficient resolutions for finite-Tor objects. This supplies the compact-support pairing rather than a fundamental class without compactness. The already supplied finite Artin comparison respects localization; the local Kummer/exponential generator then identifies the étale and topological maps. Form coherent `O/λ^m` diagrams and apply EnhancedDerivedSheaves coefficient reconstruction and §3.2 mapping limits with the displayed bounds. (Dimca, *Sheaves in Topology*, Proposition 3.2.11, p.65, Theorem 3.3.3, p.68, and Theorem 3.3.10, p.69, for supported purity and derived compact-support duality; finite-Tor coefficient base change supplies the finite quotient rings. BBD §§6.1.2(`A′`–`C′`), pp.149–151, and 6.1.4, pp.151–152; [TCR-CharacteristicClasses] C2.1–C2.4 for ordinary Thom/Gysin and their identities; AlgebraicTopology Stage 6 for relative cochains and orientation products; EnhancedDerivedSheaves Layer 4 for derived completeness.) *Needs:* §§3.1–3.5, ComplexComparisonPartII §§C5.4, C6.0–C6.6, CharacteristicClasses C2.1–C2.4, and the supplied relative-cochain/orientation API.

**Checks.**

- The zero section of the trivial complex line has relative Thom group `Λ` in degree two; `thom_realization` sends its class to CharacteristicClasses C2.1's positive coordinate generator.
- Codimension zero gives the identity support map. The product of two line generators gives the codimension-two class with shift four and agrees with CharacteristicClasses C2.2's ordered Thom product.
- For a smooth closed complex embedding, `gysin_realization` identifies the supported sheaf map with CharacteristicClasses C2.4's Thom/tubular Gysin before forgetting support; their projection and composition squares commute.
- For the singular curve `X={xy=0}⊂ℂ²`, `Z={0}` and `Λ=𝔽₂`, the costalk has `H¹_Z(X,Λ)=Λ` and `H²_Z(X,Λ)=Λ²`: a small neighbourhood is contractible and its puncture has two components, each homotopy equivalent to a circle. Smoothness of `Z` alone does not give purity in a singular ambient space.
- For `X=ℂ`, ordinary degree-two cohomology vanishes but `H²_c(X,Λ(1))=Λ` and its integration is the identity. Ordinary support would give a wrong trace.
- At a point with `K=O/λ`, the derived `O`-dual has its nonzero `Ext¹` term. Ordinary `Hom` alone is zero and fails duality; reduction of the normalized object likewise keeps both derived terms.


**Tate coefficients and the complex orientation line.** For a smooth separated finite-type complex scheme `X` of
pure complex dimension `d`, let `or_X` be the integral local orientation system of the real `2d`-manifold `X^an`
supplied by AlgebraicTopology Stage 6. For `n≥1` put `ζ_n = exp(2πi/ℓ^n)`. Construct the compatible coefficient
identifications `θ_{X,n}:(Z/ℓ^n(d))^an≃or_X⊗Z/ℓ^n` sending `ζ_n^{⊗d}` to the positive complex local orientation
generator. Equivalently first identify the analytic Tate line with `Z(1)/ℓ^n, Z(1)=2πiZ`, using the exponential
sequence, and identify `Z(d)` with `or_X`. Pass these maps through the imported normalized topological realization
to `Z_ℓ` and then `O,E` and finite coefficient extensions. For disconnected `X` use the orientation system
componentwise; the integral object is a coefficient sheaf identification, not a global fundamental class on a
noncompact space.

Work with the following additional hypotheses. Smooth `X`, separated and finite type over `C`, pure complex
dimension `d`; the complex analytic/singular realization and orientation-system carrier are imported. The
compatible positive roots `ζ_n` are part of the trivialization convention. The intrinsic `Z(d)/`orientation
comparison is conjugation compatible. Arbitrary root choices cannot be silently substituted. No de Rham
comparison or field isomorphism `C≃`Ebar is needed for finite, integral or rational `ℓ`-adic Betti comparison.

The interface consists of the following maps and identities.


- `tateOrientation_finite`: Expose `θ_{X,n}` as an isomorphism of coefficient sheaves, with `ζ_n^{⊗d}` mapped to the positive local generator.

- `tateOrientation_ext`: Two `Z/ℓ^n`-linear coefficient-sheaf maps from the analytic Tate line agree if their maps on every stalk agree on `ζ_n^{⊗d}`. In particular the map sending this generator to the positive local orientation generator is unique.

- `tateOrientation_reduction`: For `m≥n` the reduction of `θ_{X,m}` is `θ_{X,n}`; identity and triple reduction squares commute.

- `tateOrientation_etalePullback`: For an étale map between smooth pure-`d`-dimensional complex schemes, the orientation pullback identifies the pullback of `θ` with `θ` on the source; identities and compositions agree.

- `tateOrientation_product`: For smooth `X` of dimension `d` and `Y` of dimension `e`, the product orientation and Tate tensor isomorphisms identify `θ_{X×Y}` with `θ_X⊠θ_Y`, with the fixed ordered product convention.

- `tateOrientation_coefficientExtension`: Extension `Z_ℓ→O→O′` or `E→E′` carries `θ` to the corresponding coefficient comparison; its constant integral realization uses EtaleCohomologyFoundations §F.4’s underived comparison with the existing Mathlib Scheme.ellAdicSheaf.

- `tateOrientation_changeGenerator`: If the chosen compatible root generator is replaced by its `u`-th power, `u∈Z_ℓ^×`, the untwisting map that sends the new generator to the same positive orientation is `u^(−d)` times the original map.

- `tateOrientation_conjugation`: Under the canonical antiholomorphic map `X^an→`(conjugate `X`)`^an`, conjugation sends the positive orientation generator and the `d`-th Tate generator to `(−1)^d` times their corresponding generators. The intrinsic twisted comparison commutes with this map; no real descent or conjugation automorphism of `X` is assumed.

A proof proceeds as follows.

Use the Kummer/exponential comparison to identify the analytic Tate coefficient with the reduction of `2πiZ`.
Tensor `d` times and use the complex orientation of the tangent space to identify that integral line with the
local orientation system, as in BBD 6.1.4.

Check compatibility of the roots under `ζ_{n+1}^ℓ=ζ_n`, étale pullback and products. Apply
ComplexComparisonPartII §C6.6, extended to the ramified systems of §3.1 to the system, not an independently
defined constant topological `Z_ℓ` sheaf.

Extend coefficients by the finite-extension theorem and record the effect of changing the compatible root
generator.

Use [BBD-1982] 6.1.4, pp.151–152; [TCR-ComplexComparisonPartII] §§C5.4, C6.0–C6.6, constructible Artin
comparison; [TCR-EtaleCohomologyFoundations] §F.4, normalized `ℤ_ℓ` realization and finite-`E` lattice
coefficients.

*Needs:* EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; AlgebraicTopology stage 6
cohomology products and manifold duality; `AlgebraicGeometry.Scheme.smallEtaleTopology`;
`AlgebraicGeometry.Scheme.ellAdicSheaf`; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves
§§0.1–0.3; §3.4.

**Checks.**


- `tateOrientation_point`: For a point `(d=0), θ` is the identity coefficient identification, for every root choice. Its integral constant realization agrees with the imported comparison to Mathlib Scheme.ellAdicSheaf and its cohomology with Scheme.EllAdicCohomology.

- `tateOrientation_line_sign`: On `A¹(C), ζ_n` maps to the orientation determined by the ordered real basis `(1,i)`; using `−i` reverses this generator.

- `tateOrientation_product_two_lines`: On `A²(C)` the product of the two positive line generators is the positive real four-dimensional orientation; simultaneous conjugation preserves it.

- `tateOrientation_changed_root`: For `d=1` and `ℓ=5`, replacing `ζ_n` by `ζ_n²` multiplies the fixed-orientation untwisting map by `2^−1` modulo `5^n`. Keeping the original map fails to send the new generator to 1.

- At `d=0`, reduction of the orientation comparison is the identity at every level; two successive reductions give the same identity as their composite.

**Betti comparison preserves purity, trace and supported Gysin classes.** Use the supported Thom/Gysin and
noncompact integral-duality interface constructed in this subsection. Let `X` be smooth separated finite type
over `C`, pure dimension `d`, and `i:Z→X` a smooth closed subscheme of pure codimension `c`. For `Λ=Z/ℓ^n, O` or `E` use
the imported finite/integral/rational Artin comparison and the Tate-orientation identification.
Analytification identifies the trace-normalized purity map `i^!Λ_X≃Λ_Z(−c)[−2c]` with topological purity from
the complex orientation of the normal bundle. The supported fundamental class `η_Z∈H_Z^{2c}(X,Λ(c))`, its image
`cl_X(Z)`, and the Gysin morphism all correspond to the topological Thom/supported class, its cohomology image
and the topological Gysin map. The Kummer first Chern class corresponds to the topological `c₁`; hence
`cl_X(D)=c₁(O(D))` for a smooth divisor `D` on both sides. The smooth absolute dualizing complex `Λ(d)[2d]`,
compact-support trace, cup/evaluation pairing and derived compact-support duality commute with comparison. For
nonproper `X` integration uses compact support and local orientation; on proper `X` it specializes to the global
oriented fundamental class.

Work with the following additional hypotheses. Use bounded constructible finite-Tor input complexes for
tensor/evaluation; integral `O` is regular. Finite-level Artin comparison and normalized topological realization
are ComplexComparisonPartII §§C6.3–C6.6, extended to ramified coefficients by §3.1. For general singular
cycles, use §1.1 and cycle-class-map with their semi-purity and rational-equivalence hypotheses; this theorem
establishes the smooth-pair normalization used by that imported extension. Topological local orientation,
relative cohomology and cup/cap are imported from AlgebraicTopology Stage 6 and its prerequisite stages. The
additional supported Thom/Gysin and noncompact integral-duality interface is constructed at the start of this
subsection from relative cochains and local orientations.

Name the resulting statement `complexSupportedClassTransport`.

A proof proceeds as follows.

Start with finite-coefficient Artin comparison and its closed/open localization and `Rf_!` maps. BBD 6.1.2,
pp.149–151 compares `f^!` by local closed/smooth factorization: closed support uses localization, and the smooth
factor uses purity. Apply the orientation-line identification to the absolute dualizing object. This avoids
assuming a right adjoint on an unrestricted rational analytic category.

For the smooth closed immersion use local coordinates for the smooth pair and topological local orientation of
`C^c`; complex orientation and the Kummer/exponential sequence give the same normal-coordinate generator. Glue
using localization and the supported Layer 1 construction. This comparison is of specified purity maps, not
just their one-dimensional cohomology groups.

Compare finite-level trace with local orientation integration using BBD 6.1.4. Cup/evaluation and `Rf_!`
compatibility give derived compact-support duality. Pass the coherent finite-level comparisons through the
required normalized topological `O`-realization, using strict reduction and completeness; the geometric
mapping-limit result verifies the specified integral maps. Rationalize and extend finite coefficients. At
`E`-level retain the stable-lattice Artin essential image; do not invoke an equivalence with all analytic
`E`-local systems.

For a divisor compare its supported class and first Chern class using Layer 1 and the Kummer/exponential
diagram. The equality follows with the positive convention; arbitrary units are accounted for by the
orientation API.

Use [BBD-1982] 6.1.2(`A′`–`C′`), pp.149–151; 6.1.4, pp.151–152; [TCR-ComplexComparisonPartII] §§C5.4,
C6.0–C6.6, constructible Artin comparison; [TCR-EtaleCohomologyFoundations] §F.4, normalized `ℤ_ℓ`
realization and finite-`E` lattice coefficients.

*Needs:* §3.2; §3.5; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above;
AlgebraicTopology stage 6 cohomology products and manifold duality; EtaleCohomologyFoundations §§0.11, F.6;
EtaleCohomologyFoundations §0.9; EtaleCohomologyFoundations §§0.10, F.6; §1.1; §1.3.

**Checks.**


- `P¹(C): c₁(O(1))` is the positive class and its trace is `+1` at finite, integral and rational levels.

- `U=P¹` minus `r≥1` distinct points: `H_c²(U,Λ(1))≃Λ` with trace 1 on the positive generator; the boundary segment `Λ→Λ^r→H_c¹(U,Λ)` has the diagonal first map. In contrast `H²(U,Λ)=0`.

- For a smooth divisor `D` in a smooth proper complex `X`, the supported algebraic class maps to the positive Thom class, and both routes to `H²(X^an,Λ)` give `c₁(O(D))`; the square commutes before forgetting support.

- For disconnected `X`, trace sums the component traces; no connectedness-free assertion `H_c^{2d}(X,Λ(d))≃Λ` is made.

### 3.7 Comparison of traces and integral classes

Transport the additional ramified integral, supported class and orientation structures through the supplied comparison functors.

**Transport of traces, duality and Gysin classes to `ℓ`-adic and rational coefficients.** For `X` separated of
finite type over a field, extend the supplied finite-Tor adic duality and trace maps to the ramified
constructible `O`-category of §3.1, and add integral higher cycle classes. For `O=O_E`, prove the following
compatible maps and torsion-sensitive identities: (a) the dualizing complex `K_X := a^!O ∈ D^b_c(X, O)` reduces
to the finite-level `K_X ⊗^L O/λ^m` and `D_X := RHom(−, K_X)` preserves `D^b_c(X, O)`; the evaluation `K → D_XD_XK` is
an isomorphism for all `K ∈ D^b_c(X, O)` (its reductions have finite `Tor` amplitude over `O/λ^m`, so the imported
`ctf` biduality applies levelwise and passes to the limit) and for `D^b_c(X, E)`; `D_X` exchanges `Rf_*` and `Rf_!, f^*`
and `f^!`. (b) The smooth trace `Tr_f`, the purity isomorphism `f^!O ≅ O(d)[2d]` for smooth `f` of relative dimension
`d`, the Gysin maps and the cycle class map `cl : CH^r(X) → H^{2r}(X, O(r))` are the limits of their finite-level
versions, with integral torsion retained: for geometric cohomology (`X` over a separably closed field), `H^q(X, O) = lim H^q(X, O/λ^m)` is a finitely generated `O`-module whose torsion is not discarded, and the
universal-coefficient sequences `0 → H^q(X, O) ⊗ O/λ^m → H^q(X, O/λ^m) → H^{q+1}(X, O)[λ^m] → 0` hold. (c) After
`⊗E` these give the rational statements, compatible with extension of scalars `E → E' ⊂ Ē` (`D_X`, traces and cycle
classes commute with `− ⊗_E E'`).

Work with the following additional hypotheses. `X` separated of finite type over a field; `ℓ` invertible; `O = O_E`.
The inverse-limit, finite-generation and finite-group Mittag-Leffler assertions in (b) concern geometric
cohomology over a separably closed field. Arbitrary-field arithmetic cohomology is not asserted finite.
Cycle-class transport uses the perfect-field and cycle hypotheses of §1.3, whose descent to Chow groups
EtaleCohomologyFoundations does not state.

Name the resulting statement `adicTransportOfDualityAndClasses`.

A proof proceeds as follows.

Use ambient coefficient reduction and the uniform ordinary`/Tor` bounds of the enhanced normalized systems for
the bounded restrictions. `O` is a DVR of global dimension one: bounded constructible `O`-complexes are
stratumwise perfect, and their derived reductions lie in `D_ctf(X,O/λ^m)` with a common interval. Apply exactly
the `ctf` biduality and exchange isomorphisms of EtaleCohomologyFoundations §F.5 at those levels; the dual
systems retain common constructibility and bounds, and enhanced reconstruction gives integral biduality.
Quotient-to-quotient reduction is not bounded on every Dbc object. No biduality on arbitrary nonperfect
finite-level Dbc inputs is imported. Finite-group Mittag–Leffler is used only for geometric cohomology.

Traces, purity and Gysin maps are compatible with reduction by construction (their finite-level constructions
in EtaleCohomologyFoundations §§0.9–0.11 and F.6 are natural in `Λ`), hence define maps of systems; cycle
classes likewise (§1.3).

Universal coefficients: `RΓ(X, K) ⊗^L O/λ^m ≅ RΓ(X, K ⊗^L O/λ^m)` for `K ∈ D^b_c(X, O)` and `RΓ(X, K) ∈ D^b_{fg}(O)`
(for `O = ℤ_ℓ` this is §F.4.4; for ramified `O` the same argument over the tower `O/λ^m`). The finiteness clause is
geometric; over arbitrary `k` the absolute Galois cohomology need not be finitely generated.

Coefficient extension: `E'` is finite free over `E`, so all operations commute with `− ⊗_E E'`.

Use [Bhatt-Scholze-proetale-2015] Remark 6.8.15, p. 62 (arXiv v2); [TCR-EtaleCohomologyFoundations]
§§F.4.4–F.4.5, F.5 and F.6.

*Needs:* §3.1; §1.3.

**Checks.**


- `X` smooth proper connected of dimension `d` over `k` separably closed: `H^{2d}(X, O(d)) ≅ O` via the limit trace, and Poincaré duality over `O` has the `Ext¹` correction of integral duality (EtaleCohomologyFoundations §F.5, adic duality as the realization of §F.4).

- An Enriques surface over `k` separably closed of characteristic `≠ 2` with `ℓ = 2: H²(X, ℤ_2)` has torsion `ℤ/2`, which the integral statement retains.

**Algebraic higher-cycle classes and duality versus topological orientation.** Import
ComplexComparisonPartII §C6.5 / `artinSmoothTrace` and §C6.6 / `adicArtinComparison`, including oriented
integration, normalized topological realization and the finite, integral and rational trace normalizations.
Extend their coefficient systems to ramified `O_E` and `E` using §3.4 and the supported interface of §3.6.
For smooth separated `X/ℂ` of pure dimension `d`, prove `traceOrientationComparison`: the étale supported
class of each codimension-`r` cycle corresponds to its topological fundamental class, and cup products and
compact-support constructible duality pairings agree under comparison. Use the positive Tate coordinate
`exp(2πi/n)↦1` at finite levels, coherently over `O_E/λ^m`, then rationalize. Integral pairings retain derived
`Hom`, including its `Ext` term; rational analytic objects lie in §3.5's stable-lattice essential image.

For smooth closed subvarieties compare the supported Thom/Gysin classes of §3.6 with §1.3. Semi-purity
identifies the class on an arbitrary cycle from its smooth dense locus; linearity gives the higher-cycle
comparison. Cup products and the imported trace comparison then identify the duality evaluations. Ramified
coefficient extension and §3.2 mapping limits preserve these diagrams.

Use [BBD-1982] 6.1.2, pp.148–151, and 6.1.4, pp.151–152; [TCR-ComplexComparisonPartII] §§C5.4,C6.5–C6.6.

*Needs:* §§1.3,3.4–3.6; ComplexComparisonPartII §§C6.5–C6.6 / `artinSmoothTrace`, `adicArtinComparison`.

**Checks.**

- A smooth divisor `D⊂X` has `cl(D)=c₁(O(D))`, corresponding to the topological Poincaré dual of `[D]`.
- In `𝔸²_ℂ`, the supported class of the origin is the product of the two positive coordinate Thom classes;
  it has degree four and trace 1 after forgetting supports to compact supports.
- For `X=Spec ℂ` and `K=O_E/λ`, both duality comparisons retain `Ext¹_O(K,O)≅O_E/λ`; underived duals vanish
  and do not supply the pairing.

### 3.8 Analytic smooth trace compatibility

**Smooth trace comparison on algebraically realized analytic spaces.** Let `k` be a complete nontrivially
rank-one valued nonarchimedean field, `f:X→Y` a separated finite-type smooth morphism of pure relative dimension
`d` between finite-type `k`-schemes, and `f^an:X^an→Y^an` its actual analytification over Spa`(k,k°)`. Assume the
analytic map is taut and its target quasi-separated, and `n` is prime to the residue characteristic. Under the
imported comparison `(Rf_!K)^an≃Rf^an_!(K^an)`, the analytified scheme trace `Rf_!f^*L(d)[2d]→L` equals Huber’s
analytic smooth trace, and the trace-normalized purity/adjunction maps `f^!L≃f^*L(d)[2d]` compare with
`(f^an)^!L^an≃(f^an)^*L^an(d)[2d]`. For a smooth pair `i:Z→X`, the corresponding supported smooth-pair fundamental
class and Gysin map agree with their analytified maps. This transports the given algebraic model; it neither
assigns models to arbitrary analytic spaces nor enlarges analytic duality to residue-characteristic torsion.

Work with the following additional hypotheses. `Λ=Z/n, n≥1` prime to residue characteristic, and `L` bounded
below; for bounded constructible duality restrict to actual finite-Tor inputs and bounds.
ClassicalAdicEtaleCohomology §9.5 (`GeneralSmoothTrace`) already supplies the shifted-constant trace, in a broader coefficient range.
Its §9.6 smooth-duality theorem supplies the full `D⁺` trace-normalized adjunction used here, in
Huber’s narrower range. Use scheme-fibre-product analytification from AdicSpacesPartII and finite-dimensional,
separated/taut analytic support hypotheses. General finite-type field direct-image comparison Huber 3.8.1
needs `n` prime to `char(k)` in positive characteristic; this weaker condition in characteristic zero does not
extend the smooth-duality range. Integral analytic realization is not inferred from finite-coefficient
comparison without a normalized analytic coefficient category and uniform bounds; its exact extension is
recorded separately.

Name the resulting statement `analyticSmoothTraceComparison`.

A proof proceeds as follows.

Import Huber 5.7.2’s proper-support comparison (and its pseudo-adic version 5.7.5) through the existing
analytic owner. For proper maps use ClassicalAdicEtaleCohomology §8.2 and for open embeddings use extension by zero;
glue through the compactification comparison.

Import ClassicalAdicEtaleCohomology §9.5 and its chart, composition, pullback and `P¹` normalization, rather than
plan another trace. Huber 7.3.4 constructs the all-dimensional trace on local étale affine charts from the
algebraic trace by 5.7.5; compare the chartwise normalized constructions and glue on the given algebraic
model.

Huber 7.5.3–7.5.4 identify that trace with the exceptional adjunction counit. Taking the trace-normalized
adjoint gives the stated smooth-purity comparison.

For a smooth closed pair apply transitivity of exceptional pullback to the two smooth structure maps, then
their trace-normalized purity formulas, to obtain codimension-`c` purity. The proper closed/open localization
comparisons transport the supported Layer 1 class and its Gysin map. This is smooth-pair purity on an
algebraic model; arbitrary regular analytic pairs are outside the claim. Import ClassicalAdicEtaleCohomology §9.3 (`AnalyticFirstChernClass`)
for the Kummer normalization already compared with schemes.

Use [Huber-1996] Theorems 3.7.2 and 3.8.1, pp.226–228; Theorems 5.7.2 and 5.7.5, pp.316–318; [Huber-1996]
Theorem 7.3.4 and proof, pp.378–382; Theorem 7.5.3 and Lemma 7.5.4(ii) and proof, pp.390–392.

*Needs:* ClassicalAdicEtaleCohomology §§9.3–9.6 and the analytic duality contract above;
ClassicalAdicEtaleCohomology §§8.2, 11.1; AdicSpacesPartII §R1; EtaleCohomologyFoundations §§0.11, F.6;
EtaleCohomologyFoundations §§0.10, F.6; §1.1.

**Checks.**


- `P¹_k`: the algebraic and analytic finite-level trace send `c₁(O(1))` to 1; this is tested on the actual analytification.

- `A¹_k` and `G_m,k`: comparison respects the compact-support localization sequence and its curve trace.

- A smooth algebraic divisor has the same supported class and Gysin normalization after analytification; a rigid closed disc is not declared the analytification of `A¹_k`.

### 3.9 Diamond adjunction mates and the image condition

**Scheme/diamond trace mates and the essential-image condition.** Let `f:Y→X` be separated finite type between
qcqs characteristic-`p` schemes (or the perfection of such a morphism), and take the eligible discrete
prime-to-`p` or regular adic coefficients of AdicCoefficientsAndComparisons. Put `F=Rf_!, F◇=Rf◇_!`, and let
`c_X^*⊣Rc_X*, c_Y^*⊣Rc_Y*`. The imported comparison `α:c_X^*F≃F◇c_Y^*` has right-adjoint mate
`β:f^!Rc_X*≃Rc_Y*(f◇)^!`. These are compatible with the exceptional adjunction counits: for `B` on `X◇`, the map `F f^!Rc_X*B→Rc_X*B` recovered from the diamond counit `F◇(f◇)^!B→B`, using `α`’s right-adjoint mate and `β`, is the
scheme counit. For `a:Y→Spec k` and `B=c_k^*Λ` this recovers `K_Y` and `D_Y` through `Rc_Y*` and recovers the
trace/evaluation morphisms. Strong `c_Y^*f^!A≃(f◇)^!c_X^*A` follows precisely when that diamond exceptional
object belongs to the essential image of `c_Y^*`; its comparison is the counit after `β` and the scheme unit. The
same test applies to the internal-`Hom` object defining diamond duality. This proves the mate compatibility and
the conditional criterion, not the missing geometric essential-image assertion.

Work with the following additional hypotheses. The diamond map is compactifiable, representable in locally
spatial diamonds and of finite dim.trg, as supplied by ECD 27.4. The dualizing complex is relative to `B=(Spec k)◇`, with its actual structure map. For mixed-characteristic finite-type schemes over a complete DVR with
perfect residue field, use L4/27.5 for `α` and `β`, and L6/27.7 only for the scheme unit on bounded constructible
finite prime-to-residue-characteristic objects `A` and the recovered candidate `T=f^!A`, with explicit
constructibility and finite-Tor witnesses. Use the ambient adjunction and the recovered constructible
candidate; do not assert global ambient full faithfulness or a right adjoint between restricted bounded
constructible categories. Characteristic-`p` and DVR constructions of `(Spec k)◇` have different plus-ring/base
conventions. Internal `Hom` and tensor are ambient derived operations; bounded constructible restrictions
require their own witnesses. Neither full faithfulness of `c^*` nor right-adjoint recovery implies that every
diamond object is in its essential image.

Name the resulting statement `diamondTraceMatesAndImageCondition`.

A proof proceeds as follows.

Use L3’s exact `α, β` and internal-`Hom` right-adjoint identity. Define `δ_C:F Rc_Y*C→Rc_X*F◇C` by adjunction from
`c_X*F Rc_Y*C→F◇c_Y*Rc_Y*C→F◇C` using `α` and the `c_Y` counit. The mate/triangle identities give `ε_scheme` at `Rc_X*B = (Rc_X*ε◇_B) ∘ δ_(f◇!B) ∘ F(β_B)`, with source `F f^!Rc_X*B` and target `Rc_X*B`. This proves compatibility of the
actual counits.

Use the full-faithfulness unit to recover `a^!Λ` and then apply `Rc_Y* RHom(c_Y^*K,B)=RHom(K,Rc_Y*B)` to recover
scheme duality. This is the verified content of the supplied right-adjoint recovery theorem.

For a desired strong object comparison compose `c_Y^*` of `β` with the counit at the relevant diamond object. The
pinned Mathlib counit/essential-image criterion makes the exact additional hypothesis explicit. The strong
comparison is conditional on this essential-image hypothesis; the mate and recovery theorem requires no such
assertion.

Apply the same mate calculation to L4’s `α` and `β` in their own base convention. Import L6’s unit theorem only on
the particular eligible finite constructible objects. Put `T=f^!A` and `B=(f◇)^!c_X^*A`; the scheme unit at `A` and
`β` give `e:Rc_Y*B≃T`. If the unit at `T` is invertible, the canonical `c_Y^*T→B` is invertible exactly when `B` is
isomorphic to `c_Y^*T`. This pointwise candidate criterion uses ambient adjunction triangle identities, not
ambient full faithfulness or an adjunction between bounded restrictions. No exceptional-image preservation
follows from 27.7.

Use [ECD-2026] Propositions 27.1–27.4, pp.163–165; 27.5–27.7, pp.166–167.

*Needs:* AdicCoefficientsAndComparisons §§L0–L6; ClassicalAdicEtaleCohomology §§8.2, 11.1–11.2;
`CategoryTheory.Adjunction.isIso_counit_app_iff_mem_essImage`; EtaleCohomologyFoundations §F.5;
EnhancedDerivedSheaves §0.4.

**Checks.**


- For `f` the identity, both mates and recovered counit are identities.

- For `f` étale, `f^!=f^*` and the known pullback comparison supplies the strong exceptional comparison in this restricted case.

- For `P¹` in characteristic `p`, recover the scheme trace of `c₁(O(1))` as 1 through `Rc_*`; do not replace this test by an unproved absolute diamond dualizing-object identity.

- The inclusion of the zero-object category into vector spaces is fully faithful and has a right adjoint sending every vector space to the zero object. Its counit `0→V` is not invertible for nonzero `V`. This concrete categorical check prevents inferring an image theorem from right-adjoint recovery.

- In the DVR range, for `T=f^!`A with invertible unit and recovered `B`, test the criterion `B≃c_Y^*T` directly. Membership in the image of an unspecified nonconstructible scheme object is not substituted for this particular candidate.

- For `X=𝔸^d, Rc_{X*}K_{(𝔸^d)^◇/B} ≅ Λ(d)[2d]`, and `Rc_{X*}RHom(c_X^*Λ,K_{X^◇/B})` gives the same scheme dualizing complex.

- For `X=P¹`, right-adjoint recovery gives `Λ(1)[2]`. Strong `c^*` transport on either example remains conditional on the additional L3 theorem; these checks assert no unconditional counit isomorphism.

### Examples

For `O/λ` supported at a geometric point, derived reduction has terms in degrees `−1` and 0; ordinary reduction loses one of them. A rank-one local system on `C×` with monodromy `ℓ` has no stable integral lattice, so it is outside the rational étale essential image. At a diamond boundary, the adjunction mate exists before any essential-image theorem is supplied.

### Dependencies

Layers 0–2; EnhancedDerivedSheaves Layer 4; EtaleCohomologyFoundations §F.4; ComplexComparisonPartII §§C5.4, C6.0–C6.6; the analytic, topological and diamond contracts above.

## Layer 4: refined Lefschetz and geometric decompositions

### 4.1 Support estimates and weak Lefschetz for complexes

Extend the supplied sheaf support bound and constant-coefficient smooth ample Lefschetz theorem to complexes, arbitrary affine complements and integral saturation.

**Artin vanishing for constructible complexes on affine schemes.** Let `k` be a separably closed field, `n ≥ 1`
invertible in `k, Λ` a noetherian ring with `nΛ = 0`, and `U` an affine scheme of finite type over `k`. (b) Let `K ∈ D^b_c(U, Λ)` and let `d_q ∈ ℤ ∪ {−∞}` satisfy `dim Supp ℋ^q(K) ≤ d_q` for every `q` (dim `∅ = −∞`). Then `H^m(U, K) = 0`
for every `m > max_q (q + d_q)`. (c) In particular, if `dim Supp ℋ^q(K) ≤ −q` for all `q`, that is `K ∈ pD^{≤0}(U)`,
then `H^m(U, K) = 0` for `m > 0` (for perverse `K` this is the statement of EtaleCohomologyFoundations §F.8,
imported); and `H^m(U, K) = 0` for `m > dim U + max{q : ℋ^q(K) ≠ 0}`. (d) The same bounds hold for `K ∈ D^b_c(U, O_E)` and `D^b_c(U, E)` (`E/ℚ_ℓ` finite, `ℓ` invertible in `k`). (e) Universal homeomorphisms: the bounds (a)–(d) hold
for every affine scheme `U′` with a universal homeomorphism `U′ → U` onto an affine `U` of finite type over `k`,
supports being measured in `|U′| = |U|`. In particular they hold when `k` is perfect of characteristic `p` and `U′` is
an affine perfect `k`-scheme perfectly of finite presentation, for example the perfection of an affine `k`-scheme
of finite type. Parts (b)–(e) are the complex, adic and perfect forms that EtaleCohomologyFoundations §F.3 does not
state.

Work with the following additional hypotheses. `k` separably closed; `n` invertible in `k`; `Λ` noetherian with `nΛ = 0`
(for (a) and (b)). `U` affine of finite type over `k`; affineness is essential: `H²(P¹, Λ(1)) = Λ` although `dim P¹ = 1`. For `O_E` and `E` coefficients use EtaleCohomologyFoundations §§F.4.1–F.4.5: normalized `ℓ`-adic systems with
cohomological and `Tor` intervals uniform in the level, their realization, and finite `E/ℚ_ℓ` through `O_E`
lattices. `O_E`-coefficients are regarded as `ℤ_ℓ`-coefficients with an `O_E`-action along the finite free `ℤ_ℓ → O_E`; this changes neither the cohomology groups, nor the supports, nor the perversity conditions, nor the
maps, and a finitely generated `O_E`-module is `O_E`-torsion-free exactly when it is `ℤ_ℓ`-torsion-free. For (e): `U′ → U` a universal homeomorphism with `U` affine of finite type over `k`; in the perfect case `k` is perfect of
characteristic `p` and `U′` is affine, perfect and perfectly of finite presentation.

Name the resulting statement `affineVanishingHypercohomology`.

A proof proceeds as follows.

(a) is EtaleCohomologyFoundations §F.3 (VanishingCycles.affineArtinVanishing), which states the constructible
bound `q > dim Supp F` for prime-to-characteristic torsion coefficients; it is the statement of SGA 4 XIV
Théorème 3.1 and Corollaire 3.2, restated as BBD Corollaire 4.1.4.

(b) Use the hypercohomology spectral sequence `E₂^{p,q} = H^p(U, ℋ^q K) ⇒ H^{p+q}(U, K)`, which converges
because `K` is bounded. By (a), `E₂^{p,q} = 0` for `p > d_q`, so every term with `p + q = m` vanishes when `m > q + d_q`
for all `q`.

(c) is (b) with `d_q = −q`, respectively `d_q = dim U`.

(d) For `O = ℤ_ℓ`, apply (b) to each level `ℤ/ℓ^n` of the normalized system (EtaleCohomologyFoundations §F.4.1).
The universal-coefficient sequence puts the support of `ℋ^q(K_n)` inside the supports of `ℋ^q(K)` and `ℋ^{q+1}(K)`,
and `q + d_{q+1} < (q+1) + d_{q+1}`, so the levels satisfy the same bound `max_q(q + d_q)`. Pass to the
realization: §F.4.2 identifies `RΓ` of the realization with Rlim of the finite levels; the groups `H^{m−1}(U, K_n)` are finite (§F.3), so the Milnor `lim¹` term vanishes and `H^m(U, K) = 0` above the bound. For `O = O_E`
restrict scalars to `ℤ_ℓ`; rational coefficients follow by inverting `ℓ` (§F.4.5). The bound is imposed only on
nonzero ordinary cohomology sheaves.

(e) A universal homeomorphism induces an equivalence of étale sites transporting sheaves, supports and
cohomology (EtaleCohomologyFoundations §F.0.4, VanishingCycles.universalHomeomorphismEtaleEquivalence; for
perfections Zhu, Remark A.4 and Proposition A.5). An affine perfect `k`-scheme perfectly of finite presentation
is the perfection of a `k`-scheme of finite presentation (Zhu, Definition A.13 and Proposition A.15), and that
model is affine because affineness passes between a scheme and its perfection (Zhu, Lemma A.7(6)); apply
(a)–(d) to the model.

Use [Deligne-WeilII-1980] §4, (4.1.6), p. 218; [SGA4-XIV] XIV, Théorème 3.1 and Corollaire 3.2, LNM 305 pp.
159–160; [TCR-EtaleCohomologyFoundations] §F.3, VanishingCycles.affineArtinVanishing; [Zhu-2017] Appendix A.1.2, Remark A.4, Proposition A.5 and Lemma A.7(6), pp. 45–47; A.2.1,
Definition A.13 and Proposition A.15, pp. 49–50 (arXiv v3).

**Checks.**


- `U = 𝔸¹_k, F` constructible: `H^q(𝔸¹, F) = 0` for `q ≥ 2`; the bound is sharp: for `n > 1, H¹(𝔾_m, ℤ/n) ≅ ℤ/n(−1) ≠ 0`.

- `K = i_{x*}Λ[−q]` for a closed point `x: d_q = 0`, and `H^m(U, K) = 0` for `m ≠ q`, as (b) predicts.

- Assume `Λ≠0`. Non-example: `U = P¹` is not affine and `H²(P¹, Λ(1)) ≅ Λ`, so affineness cannot be dropped.

- Perfect case: over an algebraically closed `k` of characteristic `p`, the perfection `Spec k[t^{1/p^∞}]` of `𝔸¹` is not of finite type, yet it has `H^q = 0` for `q ≥ 2` with constructible coefficients, exactly as `𝔸¹` by (e).

**Compact-support vanishing on affine schemes and its smooth lisse case.** Let `k` be a separably closed field,
`U` an affine scheme of finite type over `k` and `a ∈ ℤ`, with coefficients as in the conventions (`Λ` finite with
invertible annihilator, `O = O_E`, or `E`). (b) If `K ∈ pD^{≥a}(U)`, then `H^i_c(U, K) = 0` for `i < a`. For field
coefficients (a finite field of characteristic `ℓ`, or `E`) the condition `K ∈ pD^{≥a}` is the dual support bound
`dim Supp ℋ^q(D_U K) ≤ −a − q` for every `q`, the form used in Weil II 6.2.11 and in
LefschetzPencilsAndVanishingCycles §7b.9 (InvariantCycles.dualSupportAffineVanishing, stated there for `ℚ_ℓ` on
hyperplane complements and imported). (c) If `Λ = O` and `K ∈ p⁺D^{≥a}(U)`, then `H^i_c(U, K) = 0` for `i < a` and
`H^a_c(U, K)` is a torsion-free `O`-module. (d) Smooth case: if `U` is smooth of pure dimension `d` and `L` is a locally
constant constructible sheaf of `Λ`-modules (`Λ` finite), or a locally free lisse `O`- or `E`-sheaf, then `L ∈ pD^{≥d}(U)` and `H^i_c(U, L) = 0` for `i < d`; for a locally free lisse `O`-sheaf also `L ∈ p⁺D^{≥d}(U)`, so `H^d_c(U, L)` is torsion-free.

Work with the following additional hypotheses. `k` separably closed; `U` affine of finite type over `k`. Affineness
is essential: for `Λ≠0`, `H⁰_c(P¹, Λ) = Λ ≠ 0` although `Λ[1]` is perverse on `P¹`. Coefficient regimes: `Λ` a finite ring whose
annihilator is invertible in `k`; `O = O_E` for a finite extension `E/ℚ_ℓ` with `ℓ` invertible in `k`; or `E`. Perverse
`t`-structures are the middle perversity of §2.4 and, for `O` and `E`, of EtaleCohomologyFoundations §§F.4, F.8;
ramified coefficient refinement in §3.1 here; for `O` the dual perversity `p⁺` is that of
EtaleCohomologyFoundations §F.8 (integral `p/p+` tilt, pointwise criteria and duality). These agree with
VanishingCycles.fieldPerverseTStructure of EtaleCohomologyFoundations §F.8. `O_E`-coefficients are regarded as
`ℤ_ℓ`-coefficients with an `O_E`-action along the finite free `ℤ_ℓ → O_E`; this changes neither the cohomology
groups, nor the supports, nor the perversity conditions, nor the maps, and a finitely generated `O_E`-module is
`O_E`-torsion-free exactly when it is `ℤ_ℓ`-torsion-free. For the duality steps, `D_U = RHom(−, a^!Λ)` for `a : U → Spec k` is the dualizing functor of EtaleCohomologyFoundations §F.5; biduality holds on `D^b_c` for finite
fields, DVR quotients `O/λ^m, O` and `E`. A finite ring `Λ` is reduced to self-injective `ℤ/ℓ^m`-coefficients by
restriction of scalars, as in §2.7.

Name the resulting statement `compactSupportVanishingSmoothAffine`.

A proof proceeds as follows.

(a) is EtaleCohomologyFoundations §F.8 for finite and rational coefficients and both integral hearts; in the
atlas it is the compact-support half of §2.7 (BBD 4.1.1–4.1.2 with duality).

(b) Induct on the perverse amplitude of the bounded `K`. The triangle `pτ^{≤b}K → K → pτ^{≥b+1}K` and the long
exact sequence of `RΓ_c(U, −)` reduce the claim to a single shifted perverse object `P[−b]` with `b ≥ a`, and
`H^i_c(U, P[−b]) = H^{i−b}_c(U, P)` vanishes for `i < b` by (a), in particular for `i < a`. For field coefficients
`D_U` exchanges `pD^{≥a}` and `pD^{≤−a}` (§2.5), and `pD^{≤−a}` is the support condition `dim Supp ℋ^q ≤ −a − q` (§2.4);
this gives the dual support form.

(c) For `P` in the `p⁺`-heart, `D_U P` lies in the `p`-heart (EtaleCohomologyFoundations §F.8 (integral `p/p+` tilt,
pointwise criteria and duality)), so `H^m(U, D_U P) = 0` for `m > 0` by perverse Artin vanishing (§2.7). Duality
for `U → Spec k` gives `RΓ_c(U, P) ≅ RHom_O(RΓ(U, D_U P), O)`; as `O` has global dimension one, `H^i_c(U, P) = 0` for
`i < 0` and `H^0_c(U, P) = Hom_O(H^0(U, D_U P), O)` is torsion-free. The truncation argument of (b) for `p⁺` then
gives `H^i_c(U, K) = 0` for `i < a` and `H^a_c(U, K) ≅ H^0_c(U, p⁺H^a(K))`, which is torsion-free.
EtaleCohomologyFoundations §F.8 states the same two facts for the hearts.

(d) For a locally constant constructible `L` on smooth `U` of pure dimension `d, L[d]` is perverse (§2.4, using
smooth purity `i_x^!L ≅ i_x^*L(−c)[−2c]`), so `L ∈ pD^{≥d}` and (b) applies. For a locally free lisse `O`-sheaf,
`D_U(L[d]) = L^∨(d)[d]` is again a shifted locally free lisse sheaf, hence `p`-perverse, so `L[d]` lies in the
`p⁺`-heart as well and (c) applies.

Cross-check with Deligne's route (Weil II 4.1.6): for field coefficients and lisse `L`, Poincaré duality gives
`H^i_c(U, L) ≅ H^{2d−i}(U, L^∨(d))^∨`, which vanishes for `2d − i > d` by Artin vanishing (§4.1 (a)).
Residue-field dévissage gives another proof for locally constant sheaves over self-injective finite rings; the
perverse argument above makes it unnecessary.

Use [Deligne-WeilII-1980] §4, (4.1.6), p. 219; Proposition (6.2.11) and the first paragraph of its proof, pp.
249–250; [TCR-EtaleCohomologyFoundations] §F.8, VanishingCycles.fieldPerverseTStructure (affine vanishing
clause), with §F.5; [TCR-LefschetzPencilsAndVanishingCycles] §7b.9, Lemma (affine
vanishing from a dual support bound), InvariantCycles.dualSupportAffineVanishing.

*Needs:* §2.7; §2.4; EtaleCohomologyFoundations §F.8 (integral `p/p+` tilt, pointwise criteria and duality);
§2.5; EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here.

**Checks.**


- `U = 𝔸^d: H^i_c(𝔸^d, Λ) = 0` for `i ≠ 2d`, in particular for `i < d`.

- `U = 𝔾_m (d = 1): H⁰_c(𝔾_m, Λ) = 0` while `H¹_c(𝔾_m, Λ) = Λ ≠ 0` for nonzero `Λ` — the bound `i < d` is sharp.

- Assume `Λ≠0`. Non-example: `U = P¹` is not affine and `H⁰_c(P¹, Λ) = Λ ≠ 0` although `d = 1`.

- Assume `Λ≠0`. A complex that is not a shifted local system: on `U = 𝔸¹` with `j : 𝔾_m → 𝔸¹, K = j_!Λ[1]` is perverse; `H^i_c(𝔸¹, K) = H^{i+1}_c(𝔾_m, Λ)` vanishes for `i < 0`, and `H⁰_c(𝔸¹, K) ≅ Λ`, so (b) is sharp for `a = 0`.

- The `p⁺` hypothesis in (c) is needed: on `U = Spec k` with `O`-coefficients, the `p`-perverse torsion object `O/λ` has `H⁰_c = O/λ`, which is torsion; its dual `(O/λ)[−1]` lies in the `p⁺`-heart and has `H⁰_c = 0` and torsion `H¹_c = O/λ`, so torsion-freeness is asserted in degree a only.

**The weak Lefschetz theorem for complexes.** Let `k` be a separably closed field, `X` a separated scheme of
finite type over `k, i : Y → X` a closed subscheme whose complement `j : U → X` is affine, `n ∈ ℤ`, and `K ∈ D^b_c(X, Λ)` for a coefficient regime of the conventions (`Λ` finite with invertible annihilator, `O = O_E`, or `E`). (a) If
`j^*K ∈ pD^{≥n+1}(U)`, the restriction `H^q_c(X, K) → H^q_c(Y, i^*K)` is bijective for `q < n` and injective for `q = n`; when `X` is proper these are the ordinary groups `H^q(X, K) → H^q(Y, i^*K)`. (b) Dually, if `j^*K ∈ pD^{≤n+1}(U)`, the forgetful map `H^q_Y(X, K) → H^q(X, K)` is bijective for `q > n + 2` and surjective for `q = n + 2`. (c) If `Λ = O` and `j^*K ∈ p⁺D^{≥n+1}(U)`, the cokernel of `H^n_c(X, K) → H^n_c(Y, i^*K)` is a torsion-free
`O`-module. (d) If `X, Y` and `K` come from `X₀, Y₀` and `K₀` over a subfield `k₀` with `k = k₀^sep`, the maps of (a)–(c)
are `Gal(k/k₀)`-equivariant; over `k₀ = 𝔽_q` they commute with the geometric Frobenius. (e) Classical case: let `X`
be smooth projective of pure dimension `n + 1, Y = X ∩ H` for a hyperplane `H` of a projective embedding
containing no irreducible component of `X` (`Y` need not be smooth), and `L` a locally constant constructible
`Λ`-sheaf (`Λ` finite) or a locally free lisse `O`- or `E`-sheaf. Then `L ∈ pD^{≥n+1}(X)`, so `H^q(X, L) → H^q(Y, i^*L)`
is bijective for `q < n` and injective for `q = n`.

Work with the following additional hypotheses. `k` separably closed; `X` separated of finite type over `k`; `U = X − Y` affine. The affineness of `U` is the only property of `Y` that is used; for a hyperplane section of a projective
`X` it holds because `U` is closed in `P^N − H ≅ 𝔸^N`. Coefficient regimes: `Λ` a finite ring whose annihilator is
invertible in `k`; `O = O_E` for a finite extension `E/ℚ_ℓ` with `ℓ` invertible in `k`; or `E`. Perverse `t`-structures are
the middle perversity of §2.4 and, for `O` and `E`, of EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient
refinement in §3.1 here; for `O` the dual perversity `p⁺` is that of EtaleCohomologyFoundations §F.8 (integral
`p/p+` tilt, pointwise criteria and duality). These agree with VanishingCycles.fieldPerverseTStructure of
EtaleCohomologyFoundations §F.8. `O_E`-coefficients are regarded as `ℤ_ℓ`-coefficients with an `O_E`-action along
the finite free `ℤ_ℓ → O_E`; this changes neither the cohomology groups, nor the supports, nor the perversity
conditions, nor the maps, and a finitely generated `O_E`-module is `O_E`-torsion-free exactly when it is
`ℤ_ℓ`-torsion-free. For field coefficients `K ∈ pD^{≥n+1}` is equivalent to the dual support bound `dim Supp ℋ^q(DK) ≤ −n − 1 − q` of Weil II 6.2.11 and LefschetzPencilsAndVanishingCycles §7b.9. This theorem is distinct
from hard Lefschetz (DeligneWeightsAndPurity §§9.6–9.12) and makes no claim about the nondegeneracy of the
intersection form on the vanishing part (§4.6). For (d), `K₀` is a bounded constructible complex on `X₀` whose
pullback is `K`; the Frobenius conventions are those of EtaleCohomologyFoundations §F.10.2b.

Name the resulting statement `weakLefschetz`.

A proof proceeds as follows.

Affineness in the classical case: `U = X − Y → P^N − H` is a closed immersion, hence an affine morphism
(`AlgebraicGeometry.isClosedImmersion_iff_isAffineHom`), into the affine scheme `P^N − H = D_+(h) ≅ Spec` of a
degree-zero localization (`AlgebraicGeometry.Proj.basicOpenIsoSpec`); so `U` is affine
(`AlgebraicGeometry.isAffine_of_isAffineHom`).

(a) The localization triangle `j_!j^*K → K → i_*i^*K` (EtaleCohomologyFoundations §0.7,
ClassicalAlgebraic.supportLocalization) and compact supports (§§0.8, F.2.5) give the exact sequence `… → H^q_c(U, j^*K) → H^q_c(X, K) → H^q_c(Y, i^*K) → H^{q+1}_c(U, j^*K) → …`. By §4.1 (b), `H^q_c(U, j^*K) = 0` for `q < n + 1`. Hence restriction is injective for `q ≤ n` and surjective for `q ≤ n − 1`. For proper `X`, compact and
ordinary cohomology agree on `X` and on the closed `Y`.

(b) The triangle `i_*i^!K → K → Rj_*j^*K` gives `… → H^{q−1}(U, j^*K) → H^q_Y(X, K) → H^q(X, K) → H^q(U, j^*K) → …`. Perverse Artin vanishing on the affine `U` (§2.7) gives `H^m(U, j^*K) = 0` for `m > n + 1`, hence surjectivity
for `q ≥ n + 2` and injectivity for `q ≥ n + 3`.

(c) In the sequence of (a), the cokernel of `H^n_c(X, K) → H^n_c(Y, i^*K)` injects into `H^{n+1}_c(U, j^*K)`,
which is torsion-free by §4.1 (c).

(d) All maps are induced by morphisms of schemes and complexes defined over `k₀`, hence commute with the Galois
action (EtaleCohomologyFoundations §F.4.6, VanishingCycles.adicFunctoriality, and §F.10.2b,
VanishingCycles.frobeniusCohomology).

(e) `L[n+1]` is perverse on the smooth `X` (§2.4), so `L ∈ pD^{≥n+1}(X)`, and `j^*` is `t`-exact; apply (a) with `X`
proper.

Use [Deligne-WeilII-1980] §4, (4.1.6), pp. 218–219; Proposition (6.2.11)(i) and the first paragraph of its
proof, pp. 249–250; [Deligne-WeilI-1974] §7, p. 299; [TCR-EtaleCohomologyFoundations] §F.7,
VanishingCycles.etaleWeakLefschetz; §0.7 ClassicalAlgebraic.supportLocalization;
[TCR-LefschetzPencilsAndVanishingCycles] §7b.9, Theorem (weak Lefschetz under a support bound).

*Needs:* §2.7; §2.4; `AlgebraicGeometry.isClosedImmersion_iff_isAffineHom`;
`AlgebraicGeometry.Proj.basicOpenIsoSpec`; `AlgebraicGeometry.isAffine_of_isAffineHom`.

**Checks.**


- `X = P^{n+1}, Y = P^n` a hyperplane: `i^* : H^q(P^{n+1}, Λ) → H^q(P^n, Λ)` is an isomorphism for `q ≤ 2n` (the `P^m` calculation of EtaleCohomologyFoundations §0.9), consistent with the theorem.

- Assume `Λ≠0`. `X = P¹ × P¹ ⊂ P³ (n + 1 = 2), Y` a smooth conic: `i^*` is injective on `H¹ = 0` and an isomorphism on `H⁰`; on `H²` (outside the range) the map `Λ(−1)² → Λ(−1)` is not injective, so the range `q ≤ n` is sharp.

- `n + 1 = 1` (`X` a smooth projective curve, `Y` a finite set of points): `H⁰(X) → H⁰(Y)` is injective.

- Assume `Λ≠0`. Agreement with EtaleCohomologyFoundations: for `Y` smooth and `L = Λ` constant, the conclusion is that of EtaleCohomologyFoundations §F.7 (VanishingCycles.etaleWeakLefschetz), whose plane-cubic check `H¹(P²) = 0 → H¹(C) = Λ²` is injective and not surjective.

- Singular ambient space: for the projective cone `X ⊂ P³` over a smooth conic (a quadric surface with one singular point, a local complete intersection), `Λ_X[2]` is perverse, so restriction to a hyperplane section `Y` missing the vertex is bijective on `H⁰` and injective on `H¹`; smoothness of `X` is not used.

- (b) in the smooth case: for `X = P^{n+1}, Y = P^n` and `K = Λ`, purity identifies `H^q_Y(X, Λ)` with `H^{q−2}(P^n, Λ(−1))`, and `H^{q−2}(P^n)(−1) → H^q(P^{n+1})` is bijective for `q > n + 2` and surjective for `q = n + 2`.

**The dual (Gysin) form of weak Lefschetz.** Let `k` be separably closed, `X` a smooth separated `k`-scheme of
finite type of pure dimension `n + 1`, and `i : Y → X` a smooth closed subscheme of pure dimension `n` (a smooth
effective Cartier divisor) whose complement `U` is affine, for instance a smooth hyperplane section of a smooth
projective `X`. Let `L` be a locally constant constructible `Λ`-sheaf (`Λ` finite) or a locally free lisse `O`- or
`E`-sheaf. Then the Gysin map `i_* : H^q(Y, i^*L) → H^{q+2}(X, L(1))` is bijective for `q > n` and surjective for `q = n`. Equivalently `H^{q+2}(X, L(1))/i_*H^q(Y, i^*L)` injects into `H^{q+2}(U, L(1))`, which vanishes for `q + 2 > n + 1`. If `X, Y` and `L` are defined over `k₀` with `k = k₀^sep`, the Gysin map is `Gal(k/k₀)`-equivariant, and over `𝔽_q`
it commutes with the geometric Frobenius.

Work with the following additional hypotheses. As stated; `X` need not be proper: the argument uses only the
localization triangle, smooth-pair purity and the affineness of `U`. Coefficient regimes: `Λ` a finite ring whose
annihilator is invertible in `k`; `O = O_E` for a finite extension `E/ℚ_ℓ` with `ℓ` invertible in `k`; or `E`. Perverse
`t`-structures are the middle perversity of §2.4 and, for `O` and `E`, of EtaleCohomologyFoundations §§F.4, F.8;
ramified coefficient refinement in §3.1 here; for `O` the dual perversity `p⁺` is that of
EtaleCohomologyFoundations §F.8 (integral `p/p+` tilt, pointwise criteria and duality). These agree with
VanishingCycles.fieldPerverseTStructure of EtaleCohomologyFoundations §F.8. `O_E`-coefficients are regarded as
`ℤ_ℓ`-coefficients with an `O_E`-action along the finite free `ℤ_ℓ → O_E`; this changes neither the cohomology
groups, nor the supports, nor the perversity conditions, nor the maps, and a finitely generated `O_E`-module is
`O_E`-torsion-free exactly when it is `ℤ_ℓ`-torsion-free.

Name the resulting statement `weakLefschetzGysin`.

A proof proceeds as follows.

`L[n+1]` is perverse on the smooth `X` (§2.4), so `L(1) ∈ pD^{≤n+1}(X)`; §4.1 (b) applies to `K = L(1)`.

Smooth-pair purity identifies `i^!L(1) ≅ i^*L[−2]` (EtaleCohomologyFoundations §0.10,
ClassicalAlgebraic.smoothBoundaryPurity, and its adic form in §F.6, VanishingCycles.smoothPairGysin), so
`H^{q+2}_Y(X, L(1)) ≅ H^q(Y, i^*L)` and the forgetful map becomes the Gysin map `i_*`. §4.1 (b) gives bijectivity
for `q + 2 > n + 2` and surjectivity for `q + 2 = n + 2`.

For field coefficients and proper `X` this is the transpose of §4.1 (e) under Poincaré duality on `X` and `Y` (the
Gysin map is the transpose of `i^*`, EtaleCohomologyFoundations §F.6), which gives the same ranges.

Equivariance as in §4.1 (d); the Gysin map raises the twist by one.

Use [Deligne-WeilII-1980] §4, (4.1.6), p. 219; [Deligne-WeilI-1974] §7, p. 300;
[TCR-EtaleCohomologyFoundations] §§0.7, 0.10 and F.6;
[TCR-DeligneWeightsAndPurity] §9.3`(a),(c)`.

*Needs:* §2.4.

**Checks.**


- `X = P^{n+1}, Y = P^n: i_* : H^q(P^n) → H^{q+2}(P^{n+1})(1)` sends `h^j` to `h^{j+1}`; it is an isomorphism for `n < q ≤ 2n` and surjective for `q = n`.

- `n = 0: Y` a finite set of `d ≥ 1` distinct geometric points on a smooth connected projective curve `X`; `i_* : H⁰(Y) = Λ^d → H²(X, Λ(1)) = Λ` is the sum map, surjective.

- Assume `Λ≠0`. The range is sharp: for `X = P¹ × P¹` and `Y` a conic, `i_* : H⁰(Y) → H²(X)(1)` is not surjective onto `Λ² (q = 0 < n = 1)`.

- Agreement with DeligneWeightsAndPurity §9.3(c): for a smooth hyperplane section of a smooth projective `X` and `ℚ_ℓ`-coefficients the dual Gysin statement there is this conclusion.

**Integral weak Lefschetz: torsion-freeness of the cokernel.** In the situation of §4.1 with `Λ = O = O_E`: if
`j^*K ∈ p⁺D^{≥n+1}(U)`, then `H^{n+1}_c(U, j^*K)` is a torsion-free `O`-module and so is the cokernel of `H^n_c(X, K) → H^n_c(Y, i^*K)`. In particular (Weil II 4.1.6), for `X` smooth projective of pure dimension `n + 1, Y = X ∩ H` a
hyperplane section and `U = X − Y`, the group `H^{n+1}_c(U, ℤ_ℓ)` is torsion-free and `H^n(Y, ℤ_ℓ)/i^*H^n(X, ℤ_ℓ)`
is torsion-free; the same holds with `ℤ_ℓ` replaced by `O_E` or by any locally free lisse `O`-sheaf `L` on `X`.

Work with the following additional hypotheses. `k` separably closed, `ℓ` invertible; `X` separated of finite type
over `k` with `U = X − Y` affine; for the classical case `X` smooth projective of pure dimension `n + 1` and `Y` a
hyperplane section. The integral perversity `p⁺` is the dual of `p` (EtaleCohomologyFoundations §F.8 (integral
`p/p+` tilt, pointwise criteria and duality)). A locally free lisse `O`-sheaf `L` on a smooth `X` of pure dimension `n + 1` satisfies `L ∈ p⁺D^{≥n+1}`, because `D(L[n+1]) = L^∨(n+1)[n+1]` is `p`-perverse. `RΓ_c(U, ℤ_ℓ)` is a perfect
complex of `ℤ_ℓ`-modules with `RΓ_c(U, ℤ_ℓ) ⊗^L ℤ/ℓ ≅ RΓ_c(U, ℤ/ℓ)`: this is EtaleCohomologyFoundations §F.4.4
(VanishingCycles.adicFiniteness). `O_E`-coefficients are regarded as `ℤ_ℓ`-coefficients with an `O_E`-action along
the finite free `ℤ_ℓ → O_E`; this changes neither the cohomology groups, nor the supports, nor the perversity
conditions, nor the maps, and a finitely generated `O_E`-module is `O_E`-torsion-free exactly when it is
`ℤ_ℓ`-torsion-free.

Name the resulting statement `weakLefschetzIntegral`.

A proof proceeds as follows.

General case: §4.1 (c), whose torsion-freeness input is §4.1 (c).

Deligne's route for `K = ℤ_ℓ`, kept as a cross-check: since `RΓ_c(U, ℤ_ℓ)` is perfect with derived reduction
`RΓ_c(U, ℤ/ℓ)` (EtaleCohomologyFoundations §F.4.4), there is a short exact sequence `0 → H^n_c(U, ℤ_ℓ) ⊗ ℤ/ℓ → H^n_c(U, ℤ/ℓ) → Tor₁^{ℤ_ℓ}(H^{n+1}_c(U, ℤ_ℓ), ℤ/ℓ) → 0`. The middle term vanishes by §4.1 (d) `(n < n + 1)`, so
`H^{n+1}_c(U, ℤ_ℓ)` has no `ℓ`-torsion, and a finitely generated `ℤ_ℓ`-module without `ℓ`-torsion is torsion-free.

The exact sequence `H^n(X, ℤ_ℓ) → H^n(Y, ℤ_ℓ) → H^{n+1}_c(U, ℤ_ℓ)` of §4.1 embeds `H^n(Y)/i^*H^n(X)` into the
torsion-free `H^{n+1}_c(U, ℤ_ℓ)`.

Use [Deligne-WeilII-1980] §4, (4.1.6), p. 219; [TCR-EtaleCohomologyFoundations] §F.4.4,
VanishingCycles.adicFiniteness.

*Needs:* EtaleCohomologyFoundations §F.8 (integral `p/p+` tilt, pointwise criteria and duality).

**Checks.**


- For `n≥0` and `X=P^{n+1}`, `H^{n+1}_c(𝔸^{n+1},ℤ_ℓ)=0` and the restriction cokernel is zero.

- For `n=−1`, `X=P⁰` and `Y=∅`, `H⁰_c(𝔸⁰,ℤ_ℓ)=ℤ_ℓ` is torsion-free and the restriction cokernel in degree `−1` remains zero.

- `X` a smooth projective surface `(n = 1)` with `Y` a smooth hyperplane curve: `H¹(Y, ℤ_ℓ)/i^*H¹(X, ℤ_ℓ)` is a free `ℤ_ℓ`-module (the vanishing part of the curve's `H¹` is saturated).

- Affineness diagnostic: `U = P¹` is smooth of dimension one but non-affine, and `H⁰_c(U, ℤ/ℓ) = ℤ/ℓ ≠ 0`. Thus smoothness alone does not supply the compact-vanishing input used by the universal-coefficient argument.

- `p⁺` cannot be replaced by `p`: for `X = U = Spec k, Y = ∅` and `n = −1`, the `p`-perverse torsion object `O/λ` has `H⁰_c = O/λ`, which is torsion.

### 4.2 Ample divisors and generic affine sections

**Weak Lefschetz for ample divisors and hypersurface sections.** Let `k` be separably closed, `X` a proper
`k`-scheme, `ℒ` an ample invertible `O_X`-module, `r ≥ 1` and `s ∈ Γ(X, ℒ^{⊗r})` with zero scheme `Y = V(s)`. Then `U = X − Y = X_s` is affine, so the conclusions of §4.1 (a)–(d) apply to `(X, Y)` under their respective hypotheses:
restriction uses `j^*K ∈ pD^{≥n+1}`, the supported direction uses `j^*K ∈ pD^{≤n+1}`, the integral saturation uses
`p⁺D^{≥n+1}`, and equivariance requires descent data. Coefficients may be finite, `O` or `E`. In particular, if `X` is
smooth projective of pure dimension `n + 1` and `s` is nonzero on every irreducible component (so `Y` is an
effective Cartier divisor), restriction `H^q(X, L) → H^q(Y, L)` is bijective for `q < n` and injective for `q = n`
for every locally constant constructible or locally free lisse `L`, and when `Y` is smooth the Gysin statement of
§4.1 holds. This applies to `Y = X ∩ V(F)` for a homogeneous form `F` of degree `r` on `P^N ⊃ X`, and by induction
along a chain `X = X_0 ⊃ X_1 ⊃ … ⊃ X_c` of smooth successive ample divisors.

Work with the following additional hypotheses. `X` proper over `k` separably closed; `ℒ` ample; `Y` the zero scheme of
a section of a positive power of `ℒ`. For the statements about local systems `X` is smooth projective of pure
dimension `n + 1` and the section is nonzero on every irreducible component, so `Y` is an effective Cartier
divisor. Only the affineness of `X − Y = X_s` is used beyond §4.1, together with topological invariance of the
étale site (`Y` and `Y_red` have the same cohomology; EtaleCohomologyFoundations §F.0.4).

Name the resulting statement `ampleDivisorWeakLefschetz`.

A proof proceeds as follows.

`X` is proper over `k` and `ℒ^{⊗r}` is ample, so `X_s = X − Y` is affine (Stacks, Tag 0EKE: for `f` universally closed
and `ℒ f`-ample, `X_s → S` is affine; proved here from SchemeAndStackFoundations projective geometry). Ampleness
alone does not suffice without properness: on a quasi-affine non-affine `X` with `ℒ = O_X` and `s = 1, X_s = X`.

With `U = X_s` affine, apply each part of §4.1 with its own amplitude, coefficient and descent hypotheses. For
§4.1 also retain the smooth-pair and lisse-coefficient hypotheses needed to identify supported cohomology by
purity; affineness alone does not supply that identification.

Hypersurface sections: the degree-`r` Veronese embedding (LefschetzPencilsAndVanishingCycles §3.4,
LefschetzPencil.veronese with `veronese_isClosedImmersion` and `veronese_hyperplane`) turns `V(F) ∩ X` into a
hyperplane section of the re-embedded `X` (Weil `I`, 5.7), whose complement is affine by the argument of §4.1.

Chains: apply the statement to each `X_{j+1} ⊂ X_j` (each smooth projective) and compose.

Use [Deligne-WeilI-1974] §5, (5.7), p. 292; [Stacks-Morphisms] Morphisms of Schemes, Lemma 44.18, Tag 0EKE;
[TCR-EtaleCohomologyFoundations] §F.0.4, VanishingCycles.universalHomeomorphismEtaleEquivalence; [TCR-LefschetzPencilsAndVanishingCycles] §3.4, Theorem (existence of Lefschetz pencils),
LefschetzPencil.veronese, `veronese_isClosedImmersion, veronese_hyperplane`.

*Needs:* §4.1; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above;
AlgebraicVectorBundles L0A–L0C and JacobianChallenge Layer `A`.

**Checks.**


- `X = P^{n+1}, Y` a smooth quadric hypersurface `(r = 2): H^q(Y) ≅ H^q(P^{n+1})` for `q < n`.

- `n + 1 = 2, X = P², Y` a smooth plane cubic curve: `H⁰(P²) → H⁰(Y)` is an isomorphism `(q = 0 < n = 1)` and `H¹(P²) = 0 → H¹(Y) = Λ²` is injective.

- Assume `Λ≠0`. Non-example: take `X = P¹ × P¹` and `ℒ = O(0,2)`, nef but not ample, with `s` vanishing at two distinct points of the second factor. Then `Y` is the disjoint union of two fibres and `H⁰(X,Λ) = Λ → H⁰(Y,Λ) = Λ²` is diagonal, not an isomorphism although `0 < n = 1`. The complement `P¹ × G_m` is non-affine and `H¹_c(P¹ × G_m,Λ) = Λ ≠ 0`, violating the low-degree compact vanishing required in the proof.

**Weak Lefschetz for generic affine hyperplane sections.** Let `k` be a separably closed field, `V` a separated
scheme of finite type over `k, π : V → 𝔸^N` a quasi-finite morphism, and `P` a perverse complex on `V` for a
coefficient regime of the conventions (`Λ` finite with invertible annihilator, `O` with the perversity `p`, or `E`).
For `(a, b) ∈ k^N × k` put `H_{a,b} = {Σ a_i x_i + b = 0} ⊂ 𝔸^N, V_{a,b} = π^{−1}(H_{a,b})` with closed immersion
`ι_{a,b}`, and let `j_{a,b} : V − V_{a,b} → V` be the open complement. There is a dense open `𝒰` of the parameter
space `𝔸^{N+1}` of affine maps `𝔸^N → 𝔸¹` such that for `(a, b) ∈ 𝒰(k): (1) H^q(V, j_{a,b!}j_{a,b}^*P) = 0` for `q < 0`; (2) the restriction `H^q(V, P) → H^q(V_{a,b}, ι_{a,b}^*P)` is bijective for `q < −1` and injective for `q = −1`.
(3) If `V` is smooth of pure dimension `d ≥ 1` and `F` is a locally constant constructible `Λ`-sheaf (`Λ` finite) or a
locally free lisse `O`- or `E`-sheaf, then `H^q(V, F) → H^q(V_{a,b}, F)` is bijective for `q < d − 1` and injective
for `q = d − 1`; if moreover `V` is connected and `d ≥ 2`, then `V_{a,b}` is nonempty and connected. (4) If `V` is
smooth and irreducible of dimension `d ≥ 2` and `π` is unramified, then `V_{a,b}` is smooth and irreducible of
dimension `d − 1` for `(a, b)` in a dense open. For smooth irreducible `V` and unramified `π`, iterate (3) and (4)
along successive generic affine hyperplanes `H_1, H_2, … ⊂ 𝔸^N` only for `1 ≤ i ≤ d − 1`: the resulting sections
have dimension `d − i ≥ 1` and are smooth and connected. The `i`-th restriction is bijective in degrees `q < d − i`
and injective in degree `q = d − i`. No connectedness is claimed for a final zero-dimensional section.

Work with the following additional hypotheses. `k` separably closed; `V` separated of finite type; `π` quasi-finite.
For `(4), V` smooth irreducible and `π` unramified. Coefficient regimes: `Λ` a finite ring whose annihilator is
invertible in `k`; `O = O_E` for a finite extension `E/ℚ_ℓ` with `ℓ` invertible in `k`; or `E`. Perverse `t`-structures are
the middle perversity of §2.4 and, for `O` and `E`, of EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient
refinement in §3.1 here; for `O` the dual perversity `p⁺` is that of EtaleCohomologyFoundations §F.8 (integral
`p/p+` tilt, pointwise criteria and duality). These agree with VanishingCycles.fieldPerverseTStructure of
EtaleCohomologyFoundations §F.8. `O_E`-coefficients are regarded as `ℤ_ℓ`-coefficients with an `O_E`-action along
the finite free `ℤ_ℓ → O_E`; this changes neither the cohomology groups, nor the supports, nor the perversity
conditions, nor the maps, and a finitely generated `O_E`-module is `O_E`-torsion-free exactly when it is
`ℤ_ℓ`-torsion-free. The open `𝒰` depends on `V, π` and `P`; nothing is asserted for special hyperplanes: `(a, b) = (0, 0)` gives the whole of `V` and `(0, b)` with `b ≠ 0` the empty section. Katz states (1)–(3) for `ℚ̄_ℓ`-coefficients
and, in (3), for local complete intersections `V` of pure dimension `d`, where `F[d]` is perverse; this proves the
smooth case, in which the perversity of `F[d]` is §2.4.

Name the resulting statement `genericAffineWeakLefschetz`.

A proof proceeds as follows.

Reduction to projective space: put `K := Rπ_*P` on `𝔸^N` and `K̄ := Rι_*K` for the open immersion `ι : 𝔸^N → P^N`.
Quasi-finite direct images are left `t`-exact (§2.6), so `K̄ ∈ pD^{≥0}(P^N)`, and `H^q(V, P) = H^q(P^N, K̄)`.

Generic exchange, following Katz Appendix A.1–A.5, pp.218–221: write `f = ιπ : V → P^N` and use the universal
hyperplane incidence and its open complement over the dual projective space. The complement projection is
locally a product, so its extension-by-zero exchange is invertible by smooth base change (A.2). Generic base
change for `Rf_*` (EtaleCohomologyFoundations §F.3) makes the other open-complement exchange invertible after
shrinking the parameter base (A.3). The localization triangles and proper direct image for the closed
incidence then give the closed-restriction exchange (A.4–A.5). Pull back that dense open along the nonzero
affine forms defining hyperplanes other than infinity; this gives `𝒰 ⊂ 𝔸^{N+1}`. Thus `RΓ(H̄, K̄|_{H̄}) = RΓ(V_{a,b}, ι_{a,b}^*P)`. For `N = 0`, quasi-finite `V` is zero-dimensional and the assertion follows directly in
negative degrees after excluding `b = 0`.

Coefficient extension of the exchange just constructed: Katz proves it for `ℚ̄_ℓ`, but the same incidence
argument works for bounded constructible finite coefficients using the generic base-change supplier. For any
finite `Λ`, forget to `ℤ/n`, filter the finitely many cohomology sheaves by their finitely many
residue-characteristic layers, and intersect the finitely many resulting dense opens. For `O` use one residue
complex `P ⊗ᴸ_O O/λ` to choose the open; this complex need not be perverse. Reduction commutes with the exchange
because `O/λ` is a perfect `O`-complex, and the bounded constructible exchange cone vanishes by derived Nakayama.
This uses one open, not a separate open at every `λ`-power. For `E` choose an integral constructible lattice
complex (Bhatt–Scholze Proposition 6.8.14(2), pp.61–62) and invert `λ`. Now apply §4.1 (a) on `P^N` with `n = −1`,
since `K̄ ∈ pD^{≥0}` and the complement is affine. It gives (2); localization shows that (2) is equivalent to
(1).

(3) For smooth `V` of pure dimension `d, F[d]` is perverse (§2.4); apply (2) to `P = F[d]`. To obtain connectedness
independently of `F`, intersect this open with the one obtained from a nonzero constant finite-field sheaf. For
`d ≥ 2` its `H⁰` restriction is an isomorphism; connected `V` therefore has a nonempty connected section.

(4) is the Bertini lemma proved here using SchemeAndStackFoundations smoothness and incidence geometry (Katz,
Lemma 3.5): for smooth irreducible `V` and unramified `π` the parameters with smooth `(d − 1)`-dimensional section
contain a dense open; with the connectedness of (3) this gives irreducibility (Katz, Corollary 3.4.3).

Iteration: restrict the quasi-finite unramified map to the first smooth section and regard it as a map to `H_1 ≅ 𝔸^{N−1}`. Repeat while the source dimension is at least two, ending in dimension one (Katz, Sums of Betti
numbers, Theorem 8, pp.8–9). Applying (3) at the `i`-th step gives `q < d − i` and `q = d − i` as stated. Generic
zero-dimensional sections can have several points.

Use [Katz-ACT-1993] §3, Theorem 3.4, pp.180–181; Corollaries 3.4.1–3.4.3, pp.181–182; Lemma 3.5 and proof,
pp.182–183; Appendix A.1–A.5, pp.218–221; [Katz-BettiSum-2001] Part `I`, proof of Theorem 2, p. 3; Part II,
Theorem 8, p. 8 (author manuscript); [TCR-EtaleCohomologyFoundations] §F.3, constructible generic base
change; §F.2.2, smooth base change; [TCR-LefschetzPencilsAndVanishingCycles]
§7b.7, InvariantCycles.genericHyperplaneRestriction.

*Needs:* §4.1; §2.6; §2.4; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- `V = 𝔸²` with `π` the identity and `F = Λ`: a generic line `V_{a,b} ≅ 𝔸¹` is connected and `H^q(𝔸²) → H^q(𝔸¹)` is bijective for `q = 0` and injective for `q = 1`.

- Assume `Λ≠0`. Sharpness at `q = d − 1`: for `V = 𝔸² − C` with `C` a smooth affine conic (characteristic not two), `H¹(V, Λ) ≅ Λ(−1)` by the Gysin sequence, while a generic line meets `C` in two points and `H¹(V_{a,b}, Λ) ≅ Λ(−1)²`; restriction is injective and not surjective.

- Special parameters are excluded: for `π` the identity of `𝔸², (a, b) = (0, 0)` gives `V_{0,0} = V` and (0, 1) gives the empty section; neither lies in `𝒰`.

- Agreement with the source: for `ℚ̄_ℓ`-coefficients and smooth `V, (3)` is Katz's weak Lefschetz (Affine cohomological transforms, Corollary 3.4.1), and (1)–(2) are his Theorem 3.4 with `f = 0`.

- Iteration stops before dimension zero: in characteristic different from two, take the smooth connected affine quadric surface `x² + y² + z² = 1` in `𝔸³` with its closed immersion. One generic plane section is a smooth connected affine conic, but the next generic plane cuts it in two reduced geometric points. Thus smoothness can persist in dimension zero while connectedness fails.

- Integral exchange uses a single dense open chosen for `P ⊗ᴸ_O O/λ`; the residue complex is allowed to have two ordinary cohomology degrees. A proposed proof that merely intersects the opens for all `O/λ^a` is not sufficient.

### 4.3 Smooth complete intersections

**Cohomology of smooth complete intersections.** Let `k` be separably closed, `ℓ` invertible in `k`, and `X ⊂ P^N_k` a
smooth complete intersection of dimension `m ≥ 1`. Let `Λ = ℤ/ℓ^a, ℤ_ℓ` or `ℚ_ℓ` and `h = c₁(O(1))|_X ∈ H²(X, Λ(1))`.
Then: (a) for `q ≠ m, 0 ≤ q ≤ 2m, H^q(X, Λ) = 0` for `q` odd and `H^q(X, Λ(q/2))` is free of rank one for `q` even;
`h^{q/2}` generates for `q < m`. For `q > m`, a generator is dual to `h^{m−q/2}` under Poincaré duality, and `h^{q/2}`
is `deg(X)` times that generator (after the trace normalization); the restriction `H^q(P^N, Λ) → H^q(X, Λ)` is an
isomorphism for `q < m`. (b) `H^m(X, Λ) = Λ(−m/2)·h^{m/2} ⊕ H^m(X, Λ)_0` when `m` is even (for `Λ = ℚ_ℓ`, and for
`ℤ/ℓ^a` or `ℤ_ℓ` when `deg X` is prime to `ℓ`), with `H^m(X)_0 := ker(∪h : H^m(X) → H^{m+2}(X)(1))`; `H^m(X) = H^m(X)_0`
when `m` is odd. (c) With `ℤ_ℓ` coefficients all `H^q(X, ℤ_ℓ)` are torsion-free. (d) If `X` is defined over `𝔽_q`, the
geometric Frobenius acts on `H^{2j}(X, ℚ_ℓ), 2j ≠ m`, by multiplication by `q^j`. The comparison of primitive
ranks across characteristics is the separate target §4.7; it compares ranks across characteristics. (e)
Families: let `S` be a scheme on which `ℓ` is invertible and `f : X → S` a smooth projective morphism whose
geometric fibres are smooth complete intersections of dimension `m ≥ 1` and fixed multidegree in `P^N`, embedded
in `P^N_S` with relative hyperplane class `η ∈ H⁰(S, R²f_*Λ(1))`. For `Λ = ℤ/ℓ^a` and `0 ≤ q ≤ 2m` with `q ≠ m, R^qf_*Λ = 0` for `q` odd, and for `q` even `R^qf_*Λ(q/2)` is the constant sheaf `Λ_S`, generated by `η^{q/2}` for `q < m` and by
the section dual to `η^{m−q/2}` under the relative trace pairing for `q > m`; `R^mf_*Λ` is locally constant
constructible, and for `m` even with the degree prime to `ℓ` it splits as `Λ_S(−m/2)·η^{m/2} ⊕ ker(∪η)`. The same
holds for the `ℤ_ℓ`- and `ℚ_ℓ`-systems `(R^qf_*ℤ/ℓ^a)_a`. Over `S = Spec k₀` the constant sheaves `Λ_S(−q/2)` give back
the Galois and Frobenius statements of (d).

Work with the following additional hypotheses. `X` a smooth complete intersection in `P^N` over a separably closed
field; `ℓ` invertible. The splitting in (b) uses that `h^m` has degree `deg X` on `X (Tr(h^m) = deg X)`: it is a
direct sum over `ℚ_ℓ`, and over `ℤ/ℓ^a` or `ℤ_ℓ` only when `deg X` is a unit. For (e): `S` any scheme with `ℓ` invertible;
`f` smooth projective with a relative embedding in `P^N_S` and geometric fibres smooth complete intersections of
dimension `m ≥ 1` and fixed multidegree; the relative trace is that of EtaleCohomologyFoundations §0.11 for
smooth separated finitely presented `f`.

Name the resulting statement `completeIntersectionCohomology`.

A proof proceeds as follows.

Induction along the chain `X_N = P^N ⊃ … ⊃ X_m = X`, each `X_r` an ample divisor in the smooth projective `X_{r+1}`
(§4.2): `H^q(X_{r+1}) → H^q(X_r)` is bijective for `q < r` and injective for `q = r`; the Gysin map `H^q(X_r)(−1) → H^{q+2}(X_{r+1})` is bijective for `q > r` and surjective for `q = r` (§4.1).

Hence `H^q(X) ≅ H^q(P^N)` for `q < m`, where `H^*(P^N)` has one `Λ(−i)` in each even degree `2i` generated by the
hyperplane powers (EtaleCohomologyFoundations §0.9 and the first check of §F.7), and by Poincaré duality on `X`
(§§F.5–F.6, with the adic realization of §F.4.4) `H^q(X)` for `q > m` is dual to `H^{2m−q}(X)`, which is `Λ·h^{m−q/2}`
or 0.

Torsion-freeness: for each smooth divisor `X_r` in `X_{r+1}`, integral weak Lefschetz (§4.1) gives an injection
`H^r(X_{r+1}, ℤ_ℓ) → H^r(X_r, ℤ_ℓ)` with torsion-free cokernel. The source group is in a degree below `dim X_{r+1}`, hence identified with the free projective-space group by the already proved low-degree calculation.
Therefore the middle group of `X_r` is free as well. Integral Poincaré duality and its universal-coefficient
sequence then give freeness in all higher degrees, including degree `r+1`. This avoids assuming freeness in
degree `r+1` to prove it in degree `r`.

Splitting (`b`): `Tr_X(h^m) = deg X` (the degree of the hyperplane class on `X`, from the point normalization of
EtaleCohomologyFoundations §0.9 and the projection formula of §F.6), so `h^{m/2} ∪ h^{m/2} ≠ 0` and `Λh^{m/2}` is
a direct summand complementary to the kernel of `∪h` when `deg X` is invertible in `Λ`.

Frobenius: the low-degree hyperplane powers have eigenvalue `q^j` in untwisted cohomology (geometric Frobenius
acts on `Λ(1)` by `q⁻¹`, EtaleCohomologyFoundations §F.10.2b). In high degrees use the perfect
Frobenius-equivariant pairing with low degrees, whose multiplier is `q^m`; the resulting eigenvalue is `q^j` even
when `h^j` is not an integral generator.

To pass from the chain calculation to an arbitrary smooth complete intersection of the same multidegree, use
the nonempty open smooth-intersection locus in the product of projective spaces parameterizing its defining
forms. Each geometric characteristic fibre of this parameter space is irreducible. Iterated Bertini supplies a
point with a smooth successive chain. Smooth proper base change makes every finite-level cohomology sheaf
lisse on that locus, so its stalks have the ranks and freeness calculated at the chain point. Passing through
the compatible finite levels gives the integral freeness and rational ranks. This argument does not assert
that every prescribed presentation has smooth partial intersections; the hyperplane and trace maps then
establish the canonical low/high generators on every fibre.

(e) The upstream finiteness statements are used first on noetherian models. Zariski-locally on an arbitrary `S`,
descend the smooth projective finitely presented embedding and its finite defining data to a finitely
generated `ℤ[1/ℓ]`-algebra; smoothness and the required fibre conditions are retained after enlarging that
algebra. Proper base change pulls the resulting local systems and pairings back to `S`, so the formulas below
are valid on any `S` and glue by their canonical hyperplane and trace maps. By smooth and proper base change
each `R^qf_*Λ` is locally constant constructible with geometric stalks `H^q(X_s̄, Λ)` (EtaleCohomologyFoundations
§F.3, VanishingCycles.lisseDirectImageTransport), computed by (a)–(c). The global section `η^{q/2}` of
`R^qf_*Λ(q/2)` generates every stalk for `q < m`, so `Λ_S → R^qf_*Λ(q/2)` is an isomorphism. For `q > m`, the relative
trace `R^{2m}f_*Λ(m) → Λ_S` (§0.11) and cup product give a pairing `R^qf_*Λ(q/2) ⊗ R^{2m−q}f_*Λ(m − q/2) → Λ_S`
that is perfect on stalks by Poincaré duality on the fibres, so `R^qf_*Λ(q/2) ≅ Λ_S`. The splitting of `R^mf_*Λ`
is the stalkwise splitting of (b), defined by global sections. Over `S = Spec k₀` a constant sheaf `Λ(−j)` has
geometric Frobenius eigenvalue `q^j`, which is (d).

Use [Milne-LEC] §16 (aside on complete intersections), p. 110; [TCR-EtaleCohomologyFoundations] §0.9,
ClassicalAlgebraic.cycleClasses; §F.7, first check;
[TCR-LefschetzPencilsAndVanishingCycles] §2.3 (smooth quadrics) and §4.5, Application (hypersurfaces
outside the middle degree).

*Needs:* §4.2; §4.1; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- `TauCeti.EtaleDuality.completeIntersection_conic_generator`: On a smooth conic in characteristic different from 2, the hyperplane class has trace 2 and vanishes with `F_2` coefficients. A high-degree generator therefore uses duality rather than blindly using `h^r`.

- `X = P^m` itself `(N = m): H^m(X)_0 = 0` and every statement reduces to the `P^m` calculation of EtaleCohomologyFoundations §0.9.

- `X` a smooth plane cubic `(m = 1): H¹(X, ℚ_ℓ) = H¹(X)_0` has dimension `2 = b_1^0` for degree 3.

- `X` a smooth quadric surface in `P³` (`m = 2`, degree `2`): `H²(X, ℚ_ℓ(1)) = ℚ_ℓh ⊕ H²_0` with `dim H²_0 = 1`; with `ℤ/2` coefficients the splitting fails (`deg X = 2` is not invertible), as the hypothesis requires.

- Smooth plane conic with `Λ = ℤ/2: H²(X, Λ(1)) ≅ Λ` but `h = 2`[point] `= 0`. With `ℤ₂, h` spans an index-two submodule. Thus high-degree freeness must not be stated as generation by `h`.

- For a smooth complete intersection specified by a smooth successive chain, each restriction is an isomorphism below the new middle dimension; a high-degree integral hyperplane power need not generate when `ℓ` divides the degree.

- Quadric family: for a smooth quadric `f : X → S` of relative dimension `m ≥ 1` (degree `2`), `R^{2i}f_*ℤ_ℓ(i), 2i ≠ m`, is constant, generated by `η^i` for `2i < m` and by the trace-dual section `γ_i` for `m < 2i ≤ 2m`. The relation is `η^i = 2γ_i`. For `ℓ = 2, γ_i` is an integral class specified by the perfect pairing, not division by an invertible scalar. This agrees with LefschetzPencilsAndVanishingCycles §2.3.

- Agreement with LefschetzPencilsAndVanishingCycles §4.5, Application (hypersurfaces outside the middle degree, `ℚ_ℓ`-coefficients): for a smooth hypersurface the groups outside degree `m` are those of projective space, as (a) states.

### 4.4 Projective bundles, integration and flags

Add the cohomology ring, pushforward, pairings and section classes to the supplied projective-bundle decomposition.

**The projective-bundle decomposition: ring structure, pushforward, pairing and Frobenius weights.** Let `X` be
a quasi-compact quasi-separated scheme and `Λ` a finite ring annihilated by an integer `n` invertible on `X` (by
derived extension of scalars from `ℤ/n`, as in EtaleCohomologyFoundations §0.9), with bounded constructible `K`.
For `Λ = O_E` or `E` require additionally that `X` is of finite type over a field with `ℓ` invertible and take bounded
constructible `K`. Let `V` be a locally free `O_X`-module of `rank m + 1, π : P(V) → X` the projective bundle of lines
in `V` and `ξ = c₁(O(1)) ∈ H²(P(V), Λ(1))`. (a) Extend the supplied constant projective-bundle formula to every
bounded constructible `K`, including nonperfect finite-coefficient `K: H^q(P(V),π* K)≅⊕_j H^{q−2j}(X,K(−j))`. (b)
ring structure: `⊕_q H^q(P(V), Λ(∗)) = H^∗(X, Λ(∗))[ξ]/(Σ_{r=0}^{m+1} c_r(V) ξ^{m+1−r})`; (c) for `π_*` the
relative smooth proper trace pushforward (relative dimension `m`), over every base allowed above, `π_*(π^*a ∪ ξ^j) = 0` for `j < m` and `π_*(π^*a ∪ ξ^m) = a`; (d) if `X` and `V` are defined over a field `k₀` and `k = k₀^sep`, the
decomposition `H^q(P(V)_k, Λ) ≅ ⊕_j H^{q−2j}(X_k, Λ)(−j)` is `Gal(k/k₀)`-equivariant; over `k₀ = 𝔽_q` the geometric
Frobenius acts on the `j`-th summand as `F_X ⊗ q^j` (untwisted cohomology); (e) for `X` smooth proper of pure
dimension `d` over `k` separably closed, the Poincaré pairing on `P(V)` restricted to the summands `j` and `j'` vanishes
when `j + j' < m` and is `⟨π^*a ξ^j, π^*b ξ^{m−j}⟩ = ⟨a, b⟩_X` when `j + j' = m`. (f) Complete flag bundles: for `V`
of `rank r ≥ 2` let `φ : Fl(V) → X` be the complete flag bundle, built as the tower of projective bundles `P(V) ← P(Q_1) ← …` with tautological lines and `ξ_i` the class of the dual of the `i`-th tautological line. Then
`H^*(Fl(V), Λ)` is a free `H^*(X, Λ)`-module on the monomials `ξ_1^{a_1}⋯ξ_{r−1}^{a_{r−1}}` with `0 ≤ a_i ≤ r − i, φ^*` is split injective in every degree, and `φ^*V` carries the tautological filtration by subbundles with
line-bundle quotients whose first Chern classes `x_1, …, x_r` satisfy `φ^*c_k(V) = e_k(x_1, …, x_r)` (the
splitting principle; the Whitney formula is that of §1.2). (g) Zero and infinity sections: for a line bundle `L`
and `V = O_X ⊕ L (m = 1)` the sections `P(O_X)` and `P(L)` of `P(V) → X` are disjoint divisors with `cl(P(L)) = ξ` and
`cl(P(O_X)) = ξ + π^*c₁(L)`; their product vanishes, which is the relation `ξ² + π^*c₁(L)ξ = 0` of (b).

Work with the following additional hypotheses. `X` qcqs with `n` invertible and `Λ` a finite `ℤ/n`-algebra; for `O_E` or
`E` additionally `X` is of finite type over a field with `ℓ` invertible. Only (e) requires `X` smooth proper over a
field; (c) uses relative trace and does not require `X` smooth. `V` is locally free of `rank m + 1`; for (f) `V` has
`rank r ≥ 2`. `P(V)` parametrizes lines in `V` and `ξ = c₁(O(1))`, with `O(1)` dual to the tautological line: this is
SchemeAndStackFoundations §5.4 (projectiveBundle `V :=` relativeProj of the symmetric algebra of `V^∨`, with
`projectiveBundle_dual_convention`) on TauCetiRoadmap main; the plus-sign Chern relation follows this
convention. Twists and Frobenius conventions are those of EtaleCohomologyFoundations §F.0.3 (etaleTateTwists)
and §F.10.2b (geometric Frobenius acts on `Λ(−1)` by `q`). The étale Chern classes `c_r(V)` of (b) are those of §1.2
(defined by the projective-bundle relation); EtaleCohomologyFoundations states `c₁` (§0.9) but not the higher
étale classes. The adic extension is the realization of §F.7 in its finite-type range; `O_E`-coefficients are
regarded as `ℤ_ℓ`-coefficients with an `O_E`-action along the finite free `ℤ_ℓ → O_E`; this changes neither the
cohomology groups, nor the supports, nor the maps, and a finitely generated `O_E`-module is `O_E`-torsion-free
exactly when it is `ℤ_ℓ`-torsion-free.

Name the resulting statement `projectiveBundleDecomposition`.

A proof proceeds as follows.

(a) for the constant coefficient object is imported from EtaleCohomologyFoundations §0.9 and its adic
realization §F.7. For arbitrary bounded constructible `K`, form the same cup-power columns `⊕_j K(−j)[−2j] → Rπ_*π^*K`. On a geometric stalk proper base change identifies this with the `P^m` formula for the bounded
`Λ`-module complex `K_x`. Extend the free-coefficient calculation to such a complex by a bounded-above free
resolution: the uniform fibre cohomological-dimension bound `2m` makes each total degree depend on a finite
truncation. This proves the columns are an isomorphism without assuming `K` has finite `Tor` dimension. Taking
cohomology gives the asserted formula. For `ctf K` the imported projection formula (§F.2.7) gives the same map;
for `O_E` and `E` use the normalized adic realization and its uniform bounds.

(b) is the definition of the Chern classes by the projective-bundle relation (§1.2) together with the freeness
in (a).

(c) Use the relative smooth proper trace of EtaleCohomologyFoundations §0.11 (extended from `ℤ/n` to finite `Λ` by
coefficient extension, and realized adically by §F.7). It exists for `π : P(V) → X` independently of smoothness
of `X`. Its projection formula gives `π_*(π^*a ∪ ξ^j) = a ∪ π_*(ξ^j)`. For `j < m` the target of `π_*(ξ^j)` is
negative-degree cohomology of `X` and vanishes; `π_*(ξ^m) = 1` by the degree-one fibre normalization `Tr_{P^m}(ξ^m) = 1` and base change. The map `α ↦ π_*(ξ^m ∪ α)` therefore retracts `π^*`, as required for pullback injectivity.

(d) `ξ` is the Chern class of a line bundle defined over `k₀`, so it is Galois-invariant in `H²(P(V)_k, Λ(1))`; in
untwisted cohomology `F^*ξ = q·ξ` (EtaleCohomologyFoundations §F.10.2b: geometric Frobenius acts on `Λ(1)` by
`q⁻¹`), which gives the stated action.

(`e`) `Tr_{P(V)} = Tr_X ∘ π_*` (compatibility of smooth traces with composition, EtaleCohomologyFoundations §0.11,
ClassicalAlgebraic.smoothTrace), and (c).

(f) Iterate (a) and (c) along the tower of projective bundles of the tautological quotients (Grothendieck
1958, §1): each stage multiplies the basis by the powers `ξ_i^a` with a at most its relative dimension, and the
pushforward of the top power splits each pullback. The tautological sub-line bundles give the filtration of
`φ^*V`; its Chern-root identity is the Whitney formula of §1.2 applied to the filtration.

(g) `P(L)` is the zero scheme of the composite of the tautological inclusion `O(−1) → π^*V` with the projection to
`π^*O_X`, a section of `O(1)`; `P(O_X)` is the zero scheme of `O(−1) → π^*L`, a section of `O(1) ⊗ π^*L`. Each section
is regular, and the class of the zero scheme of a regular section of a line bundle is its first Chern class
(EtaleCohomologyFoundations §0.9, Cartier-divisor agreement). The two sections are disjoint, so the product of
their classes is zero.

Use [Milne-LEC] §23, Theorem 23.2, p. 139; [TCR-EtaleCohomologyFoundations] §0.9,
ClassicalAlgebraic.cycleClasses; §F.7; §0.11, ClassicalAlgebraic.smoothTrace; §F.10.2b; [TCR-SchemeAndStackFoundations] §5.4, projectiveBundle and `projectiveBundle_dual_convention`
(README, version main d208139); [Grothendieck-Chern-1958] §1, pp. 138–139; §2, Lemme 1, p. 141.

*Needs:* §1.2.

**Checks.**


- `X = Spec k` for `k` separably closed, `E = k^{m+1}: P(E) = P^m` and (a) is `H^∗(P^m) = Λ[ξ]/(ξ^{m+1})` (EtaleCohomologyFoundations §0.9).

- `P¹`-bundle over a smooth projective geometrically connected curve `C` over `𝔽_q`: the geometric Frobenius has eigenvalues those of `H^a(C)` and `q` times those of `H^{a−2}(C)` on `H^a(P(E))`; `e`.`g`. `dim H²(P(E)) = 2` with eigenvalues `q, q`.

- The Frobenius twist on the summand `j` is `q^j`, not 1: 'equal Betti numbers' is not enough.

- Agreement with EtaleCohomologyFoundations: on a rank-one bundle `P(V) = X` and only the `j = 0` summand occurs, and the zero bundle has empty projectivization, as in the checks of EtaleCohomologyFoundations §0.9.

- (f) For `V` of `rank 3` over a separably closed point, `Fl(V)` is the flag variety of `k³`; the six basis monomials `1, ξ_1, ξ_2, ξ_1², ξ_1ξ_2, ξ_1²ξ_2` give Betti numbers 1, 2, 2, 1.

- (g) Over `X = Spec k` with `L` trivial, `P(V) = P¹` and both sections are points of class `ξ`, so `ξ² = 0`, as the relation with `c₁(L) = 0` requires.

- Nonperfect coefficients: over a separably closed point take `Λ = ℤ/4, K = ℤ/2` in degree zero and `P(V) = P¹`. Then `H⁰(P¹,K) = ℤ/2` and `H²(P¹,K(1)) = ℤ/2`, with all other groups zero. `K` has infinite projective dimension over `Λ`; the formula must still apply.

- Relative trace and splitting do not require a smooth base: for a nonreduced qcqs `X` with `n` invertible and `V = O_X², π_*(ξ·π^*a) = a` and `φ^*` remains split injective for iterated projective bundles.

- For `V = O_X ⊕ L` with `X` a smooth proper curve, `π_*(ξ²) = −c₁(L)` by the Chern relation and `π_*(ξ) = 1`. Thus the trace retraction `α ↦ π_*(ξ ∪ α)` is a left inverse of `π^*`, but its value on the higher column `ξ` can be nonzero; it is not in general the coordinate projection of the projective-bundle decomposition.

### 4.5 Sheaf-level blow-up splitting and retractions

Refine the supplied global blow-up decomposition to a splitting of `Rπ*` and explicit trace-compatible retractions, including supports.

**Direct images along the blow-up of a smooth centre.** Let `k` be a field, `ℓ` invertible in `k, X` a smooth
separated finite-type `k`-scheme, `i : Z → X` a smooth closed subscheme of pure codimension `c ≥ 2, π : X̃ = Bl_Z X → X` the blow-up, `E = π^{−1}(Z)` the exceptional divisor with `j : E → X̃` and `p = π|_E : E → Z`, and `ζ := c₁(O_E(1)) = −j^*c₁(O_X̃(E)) ∈ H²(E, Λ(1))`. Then `X̃` is smooth, `E` is a smooth divisor with `E ≅ P(N_{Z/X})` over
`Z` (imported), `Λ_X → Rπ_*Λ_X̃` is split injective, and `Rπ_*Λ_X̃ ≅ Λ_X ⊕ ⊕_{a=1}^{c−1} i_*Λ_Z(−a)[−2a]`;
equivalently `π_*Λ = Λ, R^{2a}π_*Λ ≅ i_*Λ_Z(−a)` for `1 ≤ a ≤ c − 1` (generated by the image of `ζ^a` under `j^*`),
and `R^qπ_*Λ = 0` for all other `q > 0`. `Λ` is a finite ring whose annihilator is invertible in `k, O_E` or `E`. The
splitting is the actual sum of the adjunction unit and `j_*(ζ^(a-1)p^*(-))`; its restriction to `E` has columns
`1, −ζ, …, −ζ^(c-1)`.

Work with the following additional hypotheses. `X` smooth, separated and of finite type over a field `k, Z ⊂ X`
smooth of pure codimension `c ≥ 2`; `ℓ` invertible in `k`. The geometry of the blow-up (`X̃` smooth, `E = P(N_{Z/X}), O_X̃(−E)|_E = O_E(1), π` an isomorphism over `X − Z, π` proper) is required from SchemeAndStackFoundations §§0.7,
0.9, 4.11 and the geometric contracts above. TauCetiRoadmap main states blow-ups and strict transforms
(SchemeAndStackFoundations §4.11 with StableReduction Layer 4) and normal bundles of regular immersions
(§5.5), but not this identification of the exceptional divisor.

Name the resulting statement `blowupDirectImages`.

A proof proceeds as follows.

Over `X − Z, π` is an isomorphism, so `Rπ_*Λ|_{X−Z} = Λ`.

`π` is proper, so proper base change (EtaleCohomologyFoundations §F.2.1, VanishingCycles.properBaseChange) gives
`(R^qπ_*Λ)_z̄ = H^q(P^{c−1}_{z̄}, Λ)` at geometric points `z̄` of `Z: Λ(−a)` for `q = 2a ≤ 2(c − 1), 0` otherwise
(§4.4 (a) over a point).

Use the adjunction unit for `Λ_X` and, for `1 ≤ a ≤ c−1`, the morphism `i_*Λ_Z(−a)[−2a] → Rπ_*Λ_X̃` obtained from
`p^*`, multiplication by `ζ^{a−1}`, and the exceptional-divisor Gysin map `j_*` (EtaleCohomologyFoundations §F.6,
VanishingCycles.smoothPairGysin). Their direct sum defines the proposed decomposition morphism.

Check this morphism on geometric stalks by proper base change. Off `Z` it is the identity. Over `Z` its
restriction to `E` has columns 1 and `−ζ^a`, since `j^*j_*y = −ζ∪y` by the self-intersection formula of
EtaleCohomologyFoundations §F.6. These form the projective-bundle basis, so the morphism is an isomorphism.
The trace `π_*` splits its first column by the degree-one projection formula. Merely knowing the cohomology
sheaves of a complex would not prove a derived splitting.

Applying `RΓ` recovers VanishingCycles.etaleBlowup of EtaleCohomologyFoundations §F.7, which states the
decomposition of `RΓ(Bl_Z X, Λ)` with the same exceptional Gysin columns; this is its sheaf-level form over `X`,
needed for supports and compact supports in §4.5.

Use [Milne-LEC] §33, proof of Lemma 33.2, p. 194; [TCR-EtaleCohomologyFoundations] §F.2.1,
VanishingCycles.properBaseChange; §F.6, VanishingCycles.smoothPairGysin; §F.7, VanishingCycles.etaleBlowup.

*Needs:* §4.4; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- Blow-up of a point in a surface `(c = 2): R²π_*Λ = Λ_x(−1)` at the point `x`, generated by the class of the exceptional curve.

- `c = 3, Z` a point in a threefold: `R²π_*Λ = Λ_x(−1), R⁴π_*Λ = Λ_x(−2), R¹ = R³ = 0`.

- Non-example: for `c = 1` the blow-up is an isomorphism and `Rπ_*Λ = Λ`; the formula's sum over `1 ≤ a ≤ c − 1` is then empty, so no correction term appears.

- For the blow-up of `A²` at the origin, `E=P¹` and `j*j*(1)=−ζ`. Thus the exceptional column restricts with a minus sign, including modulo odd `ℓ`; declaring it `+ζ` changes the specified splitting.

**Trace, support and Frobenius compatibility of the blow-up splitting.** Use the supplied global blow-up
isomorphism `Φ` with its exceptional Gysin columns, and its sheaf-level refinement of §4.5. Prove the following
additional compatibilities: the first component of `Φ⁻¹` is the Gysin pushforward `π_*`; `π_*π^*=id`;
`j^*π^*x=p^*i^*x`; and `π_*j_*(ζ^{a−1}p^*z)=0` for `1≤a<c`. For proper `X` over a separably closed field,
`Tr_X̃(π^*x)=Tr_X(x)` on top-degree classes. If `X` and `Z` descend to `k₀`, these same columns are
`Gal(k₀^sep/k₀)`-equivariant; over `𝔽_q` the a-th exceptional column carries `F_Z⊗q^a` in untwisted cohomology. All
maps are defined at the sheaf level before taking ordinary cohomology, compact supports or supports in a
specified closed subset. Coefficients are a finite ring with invertible annihilator, `O_E` or `E`.

Work with the following additional hypotheses. As in §4.5; for Galois and Frobenius statements `X` and `Z` are
defined over `k₀` and the cohomology is that of `X_k, Z_k`. For cohomology over a non-separably-closed `k₀` the
decomposition is of Galois modules after base change to `k`.

Name the resulting statement `blowupFormula`.

A proof proceeds as follows.

`π_*π^* = id: π` is proper birational between smooth schemes of the same dimension, so `π^!Λ_X ≅ Λ_X̃` by smooth
purity on both sides (EtaleCohomologyFoundations §F.6) and the trace defines `π_*`; `π_*1 = 1` because `π` is an
isomorphism over a dense open, and the projection formula (§F.2.7) gives `π_*π^*x = x ∪ π_*1 = x`.

Traces: `Tr_X̃ = Tr_X ∘ π_*` (composition of smooth traces, EtaleCohomologyFoundations §0.11) and `π_*π^* = id`.
Equivariance and Frobenius as in §4.4 (d): `ζ` and the Gysin map of `E` are defined over `k₀` and `j_*` raises the
twist by one.

Use [Deligne-WeilI-1974] §7, p. 299; [Milne-LEC] §33, proof of Lemma 33.2, p. 194;
[TCR-EtaleCohomologyFoundations] §F.7, VanishingCycles.etaleBlowup; §F.6; §0.11;
[TCR-LefschetzPencilsAndVanishingCycles] §3.3 (the total space of a pencil) and §4.5 (the cohomology of
the total space).

*Needs:* §4.4.

**Checks.**


- Blowing up a `k`-rational point `x` on a smooth projective surface `S` over separably closed `k (c = 2): H²(S̃) = H²(S) ⊕ Λ(−1)·[E]` with `[E]² = −1, H¹, H³` unchanged; if the surface and the point descend to `𝔽_q`, the new geometric Frobenius eigenvalue is `q`. Checked independently of any Weil bound.

- Blowing up a point in `P³ (c = 3): b₂` and `b₄` both increase by one, `b_odd` unchanged.

- Euler characteristic: `χ(X̃) = χ(X) + (c − 1)χ(Z)`; for `c = 1` nothing changes.

- Axis of a Lefschetz pencil `(c = 2)`: for `X ⊂ P^N` smooth projective and an axis A transverse to `X, H^q(Bl_{A∩X}X) ≅ H^q(X) ⊕ H^{q−2}(A ∩ X)(−1)`, and over `𝔽_q` the geometric Frobenius acts on the second summand as `q·F_{A∩X}`. The incidence identification is LefschetzPencilsAndVanishingCycles §3.3 and the decomposition with its restriction and Gysin formulas is §4.5 there; both are imported.

**Pullback along blow-ups and projective bundles is split injective.** Let `σ : X' → X` be either (i) the
blow-up of a smooth `k`-scheme `X` along a smooth closed subscheme `Z` of pure codimension `c ≥ 2`, or (ii) a
projective bundle `P(E) → X` of relative dimension `r ≥ 1` over a qcqs `X`, or (iii) the complete flag bundle `Fl(E) → X` of a vector bundle `E` of `rank s ≥ 2` over a qcqs `X`, with `ℓ` invertible. For `Λ` a finite ring whose annihilator
is invertible, `O_E` or `E, σ^* : H^q(X, Λ) → H^q(X', Λ)` is split injective, with retraction `π_*` in case (i), a `↦ σ_*(ξ^r ∪ −)` in case (ii) and the iterated pushforward of the top monomial `ξ_1^{s−1}ξ_2^{s−2}⋯ξ_{s−1}` in case
(iii); the same holds for cohomology with compact supports and for cohomology with supports in a closed subset
`T ⊂ X` and its preimage. In case (ii) the cokernel is the sum of `H^{q−2j}(X, Λ)(−j)` for `1≤j≤r`; for `r=1` this is
`H^{q−2}(X, Λ)(−1)`, and in case (i) the cokernel is `⊕_{a=1}^{c−1} H^{q−2a}(Z, Λ)(−a)`, so `σ^*` is bijective in
degrees `q < 2` (and an isomorphism in all degrees when `Z = ∅`).

Work with the following additional hypotheses. As in §4.5 (case (i)) or §4.4 (case (ii)); integral
coefficients `O_E` allowed. The adic projective-bundle case has the finite-type and bounded-constructible range
of §4.4. Supports and compact supports use the same proper derived decomposition, not a new pullback on
compact supports for arbitrary nonproper morphisms. For compact supports assume `X` separated of finite type
over a field, so `RΓ_c` is the supplied structural lower-shriek functor. The blow-up case retains that same
geometric range from blowup-direct-images; the finite-coefficient ordinary/support projective-bundle statement
keeps the qcqs range.

Name the resulting statement `pullbackInjectiveBlowupBundle`.

A proof proceeds as follows.

(i) §4.5: `H^q(X') = σ^*H^q(X) ⊕` (exceptional summands), with `π_*σ^* = id`.

(ii) §4.4 (a) and (c).

Compact supports and supports in `T`: apply the same decompositions of `Rσ_*Λ` (§4.5, §4.4 (a)), which are
isomorphisms in `D(X, Λ)`, to `RΓ_c(X, −)` and `RΓ_T(X, −)`; for `σ` proper, `Rσ_! = Rσ_*` (EtaleCohomologyFoundations
§0.8, ClassicalAlgebraic.properSupports) and supports in the preimage of `T` are computed by the triangles of
§0.7.

(iii) §4.4 (f): iterate case (ii) along the tower of projective bundles.

Use [Liu-Tian-Xiao-Zhang-Zhu-2022] Lemma 5.11.3(2)–(5), Invent. Math. 228 (2022), pp. 251–252 (published
edition); [TCR-EtaleCohomologyFoundations] §§0.7–0.8, ClassicalAlgebraic.supportLocalization and
ClassicalAlgebraic.properSupports.

*Needs:* §4.4.

**Checks.**


- `P¹`-bundle over a separably closed geometric point: `H⁰(pt) → H⁰(P¹)` bijective, `H²(P¹) = Λ(−1)` is the cokernel.

- Blow-up of one geometric point on a smooth connected projective surface over a separably closed field: `σ^*` bijective on `H⁰, H¹, H³, H⁴` and injective with cokernel `Λ(−1)` on `H²`.

- Integral coefficients: `σ^*` is split injective on `H^q(X, ℤ_ℓ)`, so torsion in `H^q(X, ℤ_ℓ)` injects into `H^q(X', ℤ_ℓ)`.

- Flag bundle: for `E` of `rank 2` the flag bundle is `P(E)`, and case (iii) is case (ii) with `r = 1`.

### 4.6 Restriction, vanishing and primitive subspaces

Retain arbitrary smooth divisors and finite/integral coefficient controls beyond the rational ample decomposition.

**Vanishing and restricted subspaces of a smooth divisor, and primitive subspaces.** Let `k` be separably
closed, `ℓ` invertible, `E` a field of coefficients (finite of characteristic `ℓ`, or finite over `ℚ_ℓ`), `X` a smooth
proper `k`-scheme of pure dimension `n + 1` and `i : Y → X` a smooth effective Cartier divisor (pure dimension `n`),
with class `L = c₁(O_X(Y)) ∈ H²(X, E(1))`; the principal case is a smooth hyperplane section of a smooth
projective `X`, with `L = c₁(O_X(1))`. Define the vanishing subspace `Van(Y) := ker(i_* : H^n(Y, E) → H^{n+2}(X, E(1)))` and the restricted subspace `Res(Y) := im(i^* : H^n(X, E) → H^n(Y, E))`, both `E`-subspaces of `H^n(Y, E)`.
Then, with respect to the Poincaré pairing `⟨y, y'⟩ = Tr_Y(y ∪ y')` on `H^n(Y, E)` (perfect and `(−1)^n`-symmetric
after the identification `E(n) ≅ E` over `k`), `Res(Y) = Van(Y)^⊥` and `Van(Y) = Res(Y)^⊥`; `dim Res(Y) + dim Van(Y) = dim H^n(Y)`. Moreover `i_*i^* = L ∪ −` on `H^∗(X)`. For `0 ≤ q ≤ n + 1` the primitive subspace is `P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q)))`. These identities define kernels, images and orthogonals.
Complementary decompositions require additional nondegeneracy hypotheses; the rational ample case and the
resulting Lefschetz decomposition are supplied by DeligneWeightsAndPurity §§9.6–9.12. Over finite fields of
coefficients even an ample divisor need not give complementary `Res(Y)` and `Van(Y)`.

Work with the following additional hypotheses. `X` smooth proper of pure dimension `n + 1` over `k` separably
closed; `Y` a smooth effective Cartier divisor (for instance a smooth hyperplane section); field coefficients `E`
(so that orthogonal complements have complementary dimensions). Ampleness of `Y` is not used.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.vanishingSubspace`: `Van(Y) := ker(i_* : H^n(Y, E) → H^{n+2}(X, E(1)))` as an `E`-subspace of `H^n(Y, E)`.

- `TauCeti.EtaleDuality.restrictedSubspace`: `Res(Y) := im(i^* : H^n(X, E) → H^n(Y, E))` as an `E`-subspace of `H^n(Y, E)`.

- `TauCeti.EtaleDuality.restrictedSubspace_eq_orthogonal`: `Res(Y) = Van(Y)^⊥` for the Poincaré pairing of `Y`.

- `TauCeti.EtaleDuality.vanishingSubspace_eq_orthogonal`: `Van(Y) = Res(Y)^⊥` for the Poincaré pairing of `Y`.

- `TauCeti.EtaleDuality.finrank_restricted_add_vanishing`: `dim Res(Y) + dim Van(Y) = dim H^n(Y, E)`.

- `TauCeti.EtaleDuality.gysin_comp_restriction`: `i_* ∘ i^* = L ∪ − : H^q(X, E) → H^{q+2}(X, E(1))`.

- `TauCeti.EtaleDuality.primitiveSubspace`: `P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q)))` for `q ≤ n + 1`.

- `TauCeti.EtaleDuality.vanishingSubspace_galois`: If `X, Y` are defined over `k₀, Van(Y)` and `Res(Y)` are `Gal(k/k₀)`-stable subspaces.

A proof proceeds as follows.

`Van(Y)` and `Res(Y)` are kernels and images of `E`-linear maps between finite-dimensional spaces (finiteness:
EtaleCohomologyFoundations §F.3, VanishingCycles.etaleFiniteness, for finite fields of coefficients;
§§F.4.4–F.4.5 for `ℓ`-adic fields).

`i_*` is the transpose of `i^*` for the Poincaré pairings of `Y` and `X` (EtaleCohomologyFoundations §F.6, Gysin maps
and their projection formula): `⟨i^*x, y⟩_Y = ⟨x, i_*y⟩_X`. Hence `y ⊥ Res(Y) ⟺ i_*y ⊥ H^n(X) ⟺ i_*y = 0`
(perfectness of Poincaré duality on `X`, §§F.5–F.6), `i`.`e`. `Res(Y)^⊥ = Van(Y)`; the pairing on `Y` is perfect, so
`Van(Y)^⊥ = Res(Y)` and the dimensions add up.

`i_*i^*x = cl(Y) ∪ x = L ∪ x` (projection formula of §F.6 and the agreement of the class of a Cartier divisor
with the Kummer first Chern class of `O_X(Y)`, §0.9). Ampleness plays no role in these three steps.

`P^q(X)` is a kernel of an `E`-linear map; nothing about its complement is claimed.

Use [Deligne-WeilII-1980] §4.3, before Lemme (4.3.2), p. 222; [TCR-EtaleCohomologyFoundations] §§0.9, F.3,
F.5–F.6; [TCR-DeligneWeightsAndPurity] §9.3(a);
[TCR-LefschetzPencilsAndVanishingCycles] §3.4, LefschetzPencil.veronese and `veronese_hyperplane`.

**Checks.**


- `TauCeti.EtaleDuality.vanishingSubspace_projectiveSpace`: For `X = P^{n+1}` and `Y = P^n` a hyperplane, `Van(Y) = 0` and `Res(Y) = H^n(Y)`.

- `TauCeti.EtaleDuality.restrictedSubspace_planeCubic`: For `X=P²` embedded by `O(3)`, a smooth plane cubic `Y` is a hyperplane section; `Res(Y)=0` and `Van(Y)=H¹(Y,E)` has dimension 2.

- `TauCeti.EtaleDuality.vanishingSubspace_zero_of_curve_point`: For `n=0, X` a smooth connected projective curve and `Y` a nonempty reduced hyperplane section of `d` points, `Van(Y)` is the kernel of the sum map `E^d → E` and has dimension `d−1`.

- `TauCeti.EtaleDuality.not_vanishing_inf_restricted_eq_bot`: Use `𝔽₂` coefficients over a separably closed base field of characteristic different from 2. Take `X` a smooth quadric threefold and `Y` its smooth quadric surface hyperplane section. `H²(Y) ≅ 𝔽₂², Res(Y)` is spanned by `h = (1,1)`, and `h∪h` has trace `2 = 0`, so `Res(Y) = Van(Y)` is nonzero. This detects an unjustified direct-sum axiom.

- `TauCeti.EtaleDuality.primitiveSubspace_degree_zero`: For a connected smooth projective `X` of dimension `D, P⁰(X)=H⁰(X,E)=E`, since `L^{D+1}` lands above degree `2D`.

- `TauCeti.EtaleDuality.primitiveSubspace_projectiveSpace`: For `X=P^D` with `L=c₁(O(1))` and `0<q≤D, P^q(X)=0`: in positive even degree the specified power sends the hyperplane generator to a nonzero hyperplane power, and in odd degree the domain is zero.

- For `X=P²_ℂ`, `Y` a smooth plane cubic and `E=𝔽₃`, `L=3h=0` and `P²(X)=H²(X,E)≅E`. Over any coefficient field `E` of characteristic three, scalar multiplication by 3 has the whole vector space as its kernel.

- `TauCeti.EtaleDuality.primitiveSubspace_quadricSurface`: For `X=P¹×P¹` with `L=(1,1), P²(X)` is the one-dimensional kernel of `(a,b)↦`a`+b`, spanned by `(1,−1)`. This distinguishes the primitive kernel from either zero or all `H²`.

- `X = P^{n+1}, Y = P^n: Van(Y) = 0` for `n` odd `(H^n(Y) = 0)` and for `n` even `Van(Y) = 0` since `i_*` is an isomorphism `H^n(P^n) → H^{n+2}(P^{n+1})`; `Res(Y) = H^n(Y)`.

- Take `X = P²` with its `O(3)` Veronese embedding and `Y` a smooth plane cubic, which is a hyperplane section for that embedding. Then `Res(Y)=0` and `Van(Y)=H¹(Y)`, of dimension 2.

- The intersection `Res(Y) ∩ Van(Y)` is not asserted to be 0: in characteristic `ℓ` coefficients `E = 𝔽_2` and `n` even, the restricted class of a quadric hyperplane section can be isotropic; only orthogonality is proved.

- The `P², O(3)` test uses the actual degree-three Veronese embedding of LefschetzPencilsAndVanishingCycles §3.4 (LefschetzPencil.veronese). Orthogonality uses the actual restriction/Gysin maps, not arbitrary subspaces with matching dimensions.

### 4.7 Complete-intersection Betti numbers

**Betti numbers of smooth complete intersections are independent of the field.** Fix `N, m` and a multidegree
`(d_1, …, d_{N−m})`. For every separably closed field `k` of characteristic `≠ ℓ` and every smooth complete
intersection `X ⊂ P^N_k` of that multidegree and dimension `m`, every Betti number is independent of the geometric
field, and `dim H^m(X, ℚ_ℓ)` equals the topological Betti number `b_m(X_ℂ^an)` of any smooth complete intersection
`X_ℂ ⊂ P^N_ℂ` of the same multidegree, and hence the primitive `rank b_m^0 = dim H^m(X, ℚ_ℓ)_0` of §4.3 is a
function of (`N, m, d_`•) only; for a smooth hypersurface of degree `d, b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d`.

Work with the following additional hypotheses. Smooth complete intersections of a fixed multidegree; `ℓ`
invertible in `k`. `m≥1` for the primitive-rank and displayed hypersurface formula, as in §4.3; `d≥1`.
Zero-dimensional reduced cohomology is a different convention.

Name the resulting statement `completeIntersectionBettiComparison`. Define the displayed integer quotient on all natural arguments using integer division. In the geometric range `d ≥ 1, m ≥ 1`, prove divisibility by `d`, agreement with the primitive middle Betti number, and nonnegativity; at `d = 1` it is zero. The values outside that range carry no geometric rank assertion.

A proof proceeds as follows.

The parameter scheme `S ⊂ ∏ P(Sym^{d_i})` over `Spec ℤ[1/ℓ]` of tuples defining a smooth complete intersection of
dimension `m` is open with geometrically irreducible (hence connected) fibres and nonempty over every point; the
universal family `f : 𝒳 → S` is smooth and proper (required from SchemeAndStackFoundations §§0.7, 0.9, 4.11 and
the geometric contracts above).

Smooth proper base change makes `R^mf_*ℚ_ℓ` lisse on the connected parameter scheme (EtaleCohomologyFoundations
§F.3, VanishingCycles.lisseDirectImageTransport, at finite levels, then §F.4), hence its rank is constant.
Identifications of different geometric fibres require a choice of path or specialization data; the canonical
conclusion here is equality of ranks, not a canonical identification of all fibres.

Over `ℂ`, Artin's comparison (§3.5) identifies `dim H^m(X_ℂ, ℚ_ℓ)` with the topological Betti number. The
hypersurface formula: by étale Gauss–Bonnet (EtaleCohomologyFoundations §F.6,
VanishingCycles.etaleGaussBonnet) `χ(X) = deg c_m(T_X)`, and `c(T_X) = (1+h)^{N+1}∏(1+d_ih)^{−1}` restricted to `X`
(required from SchemeAndStackFoundations §§5.1–5.6); §4.3 gives all other Betti numbers, so `b_m` is determined
by `χ`.

Use [Milne-LEC] §16, p. 110; [TCR-EtaleCohomologyFoundations] §F.3,
VanishingCycles.lisseDirectImageTransport; §F.6, VanishingCycles.etaleGaussBonnet.

*Needs:* §4.3; §3.5; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above;
SchemeAndStackFoundations §§5.1–5.6.

**Checks.**


- Smooth plane cubics: `b_1 = 2` over every `k` (`= (8 − 2)/3 = 2` by the formula with `m = 1, d = 3`).

- Smooth quadric surfaces: `b_2^0 = (1 + 1)/2 = 1`.

- Further values of the hypersurface formula, checked in the suggested file: conic 0, cubic surface 6, quartic surface 21, quintic threefold `204 (b₃ = 204)`.

### Examples

For a degree-`d` smooth hypersurface of dimension `m`, the middle Betti number differs from the projective-space value by `((d−1)^{m+2}+(−1)^m(d−1))/d`. For `d=1` this difference is zero. For a smooth quadric threefold and its quadric-surface section modulo 2, restriction and vanishing subspaces can coincide nontrivially; an integral or finite-coefficient direct sum cannot be inferred from rational Lefschetz.

### Dependencies

Layers 0–3; EtaleCohomologyFoundations §§F.3, F.7–F.8; projective/flag/blow-up geometry, ample-complement affineness and complete-intersection families from the exact geometric contracts.

## Layer 5: perverse weights, decomposition and relative hard Lefschetz

### 5.1 Frobenius descent and mixed perverse objects

**Adic finite-field Hochschild–Serre comparison.** Let `X₀/𝔽_q` be separated of finite type,
`ℓ∤q`, `E/ℚ_ℓ` finite, and `K₀,L₀∈D^b_c(X₀,E)`. Write `X=X₀×𝔽̄_q`, with pullbacks `K,L` and geometric
Frobenius `F` on the geometric derived Hom induced by both descent data. Construct
`adicFiniteFieldHochschildSerre`:

`RHom_X₀(K₀,L₀) ≃ fib(1−F : RHom_X(K,L) → RHom_X(K,L))`.

The comparison is natural in both arguments and compatible with finite extensions of `E`. Use coherent
integral lattices from §3.1 and apply SchemeAndStackFoundations §2.15 / `hochschildSerre_galois_covering`
to the normalized finite-level internal Hom complexes. In the enhancement, identify continuous cochains
of the integral limit with the derived limit of the finite-level continuous cochains, retaining `Rlim`
and its possible `lim¹`. For `Gal(𝔽̄_q/𝔽_q)=ℤ̂`, its continuous `ℓ`-primary cochains are represented by the
two-term `1−F` fibre. Derived limits commute with this finite homotopy limit. Rationalize using §3.1;
finite geometric Hom groups and boundedness identify this rationalization with the rational derived Hom.
Descend finite diagrams to `E` and pass to `ℚ̄_ℓ` by finite coefficient extension.

Use [BBD-1982] Proposition 5.1.2, equations (5.1.2.1)–(5.1.2.5), pp.123–124.

*Needs:* §§3.1–3.3; SchemeAndStackFoundations §2.15 / `hochschildSerre_galois_covering`;
EnhancedDerivedSheaves Layer 4; EtaleCohomologyFoundations §§F.3–F.4.

**Checks.**

- At `Spec 𝔽_q` for `K₀=L₀=E` with trivial action, the fibre of zero has `E` in degrees 0 and 1.
- At a point with rank-one Hom action `a≠1`, `1−F` is invertible, so the arithmetic derived Hom is zero.
- For perverse `K₀,L₀`, geometric `Hom⁻¹=0` gives arithmetic `Hom=Hom_X(K,L)^F`, while degree one retains
  the coinvariant term. In particular the trivial rank-one point representation has a nonzero arithmetic
  self-extension.

**Perverse sheaves over `𝔽_q` as Frobenius-equivariant perverse sheaves over `𝔽̄_q`.** Let `X₀` be separated of
finite type over `𝔽_q` and `K₀, L₀ ∈ D^b_c(X₀, ℚ̄_ℓ)`, with pullbacks `K, L` to `X`. (a) For every `i` there is a short
exact sequence `0 → Hom^{i−1}(K, L)_F → Hom^i(K₀, L₀) → Hom^i(K, L)^F → 0`, where `Hom^i := Hom(−, −[i])` in the
derived category, `F` is the geometric Frobenius acting on the finite-dimensional `ℚ̄_ℓ`-space `Hom^i(K, L) = H^i RHom(K, L)` by transport of structure, and the subscript/superscript `F` denote coinvariants/invariants. (b) The
functor sending a perverse sheaf `F₀` on `X₀` to the pair `(F, φ), φ : Fr*F ≅ F` its Weil descent isomorphism, is
fully faithful from `Perv(X₀, ℚ̄_ℓ)` to the category of perverse sheaves on `X` equipped with an isomorphism `Fr*F ≅ F`, and its essential image is stable under extensions and under subquotients. (c) The functor is not
essentially surjective: over `X₀ = Spec 𝔽_q` the pair (`ℚ̄_ℓ`, multiplication by a non-unit `u ∈ ℚ̄_ℓ^×`) is not in
the image.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). The Frobenius acting on `Hom^i(K, L)` is the one induced by the descent data of `K₀` and `L₀`; continuous Galois cohomology of `Gal(𝔽̄_q/𝔽_q) ≅ ℤ̂` is
used.

Name the resulting statement `frobeniusDescentOfPerverseSheaves`.

A proof proceeds as follows.

Apply `adicFiniteFieldHochschildSerre` to `K₀,L₀`. Its geometric complex is `RHom_X(K,L)` with the action induced by the two descent data; no properness or smoothness of the structural morphism is needed.

The Hochschild–Serre spectral sequence for `Gal(𝔽̄_q/𝔽_q) ≅ ℤ̂` has only the columns `p = 0, 1`, since continuous
cohomology of `ℤ̂` with finite-dimensional `ℓ`-adic coefficients is invariants in degree 0, coinvariants in degree
1 and zero above; this gives (`a`) (BBD (5.1.2.3)–(5.1.2.5)).

For perverse `K₀, L₀` the group `Hom^{−1}(K, L)` vanishes (§2.1), so (a) with `i = 0` gives full faithfulness:
`Hom(K₀, L₀) = Hom(K, L)^F`.

With `i = 1, Ext¹` in `Perv(X₀)` and `Ext¹` in the category of pairs `(F, φ)` both sit in exact sequences with `Hom(K, L)_F` on the left and `Ext¹(K, L)^F` on the right; equal dimensions and injectivity give a bijection, hence
stability under extensions.

Stability under subquotients follows from the noetherian-induction Lemma 5.1.3 of BBD: on a smooth dense open
where a sub-object is a shifted lisse sheaf, a Frobenius-stable lisse subquotient descends; extend by `p j_!, p j_*` and the closed complement.

The non-example over a point: a Weil-descent isomorphism of `ℚ̄_ℓ` which is multiplication by a non-`ℓ`-adic unit
is not the Frobenius of a continuous `ℓ`-adic Galois representation.

Use [BBD-1982] 5.1.1–5.1.4, pp. 122–125 (Proposition 5.1.2 with Remark, Lemma 5.1.3, Remark 5.1.4).

*Needs:* §2.4; §2.1; §3.1; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above;
EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- Over `X₀ = Spec 𝔽_q, K₀ = L₀ = ℚ̄_ℓ: Hom^0 = ℚ̄_ℓ` and `Hom^1(K₀, L₀) = ℚ̄_ℓ` (coinvariants of the trivial action), while `Hom^1(K, L) = 0`.

- For `K₀ = ℚ̄_ℓ` and `L₀ = ℚ̄_ℓ(1)` on `Spec 𝔽_q: F` acts on `Hom(K, L) = ℚ̄_ℓ` by `q^{-1} ≠ 1`, so invariants and coinvariants vanish and `Hom^i(K₀, L₀) = 0` for all `i`.

**Mixed perverse sheaves and the perverse `t`-structure on mixed complexes.** For `X₀` separated of finite type
over `𝔽_q`, let `D^b_m(X₀, ℚ̄_ℓ) ⊂ D^b_c(X₀, ℚ̄_ℓ)` be the full triangulated subcategory of mixed complexes
(DeligneWeightsAndPurity §8.1). The middle perverse `t`-structure of `D^b_c(X₀, ℚ̄_ℓ)` restricts to a `t`-structure
on `D^b_m(X₀, ℚ̄_ℓ)`; its heart `Perv_m(X₀)` is the category of mixed perverse sheaves: perverse sheaves on `X₀`
whose ordinary cohomology sheaves are mixed. `Perv_m(X₀)` is a full abelian subcategory of `Perv(X₀, ℚ̄_ℓ)` stable
under kernels, cokernels, extensions and all subquotients. A mixed perverse sheaf `F₀` has weights `≤ w` (resp. `≥ w`, pure of weight `w`) when `F₀ ∈ D^b_m` has; with the shifted convention of DeligneWeightsAndPurity §8.1, `F₀[1]`
has weights `≤ w + 1` exactly when `F₀` has weights `≤ w`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). Mixedness is tested on ordinary
cohomology sheaves; perverse truncations are computed in `D^b_c(X₀, ℚ̄_ℓ)`.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.MixedPerverseSheaf`: The full subcategory `Perv_m(X₀)` of `Perv(X₀, ℚ̄_ℓ)` of perverse sheaves whose ordinary cohomology sheaves are mixed.

- `TauCeti.EtaleDuality.mixedTStructure`: The perverse `t`-structure restricted to `D^b_m(X₀)`; its heart is equivalent to MixedPerverseSheaf `X₀`.

- `TauCeti.EtaleDuality.MixedPerverseSheaf.abelian`: `Perv_m(X₀)` is abelian and its inclusion into `Perv(X₀)` is exact.

- `TauCeti.EtaleDuality.MixedPerverseSheaf.of_subquotient`: A subobject or quotient in `Perv(X₀)` of a mixed perverse sheaf is mixed (BBD 5.1.7(ii)).

- `TauCeti.EtaleDuality.MixedPerverseSheaf.of_extension`: An extension in `Perv(X₀)` of mixed perverse sheaves is mixed.

- `TauCeti.EtaleDuality.perverseCohomology_mixed`: For `K₀` mixed, every `pH^i(K₀)` is mixed perverse.

- `TauCeti.EtaleDuality.MixedPerverseSheaf.HasWeightsLE`: `F₀` has weights `≤ w` iff its underlying complex is in `D^b_{≤w}(X₀)` (DeligneWeightsAndPurity §8.1).

- `TauCeti.EtaleDuality.MixedPerverseSheaf.IsPure`: `F₀` is pure of weight `w` iff it has weights `≤ w` and `≥ w`.

- `TauCeti.EtaleDuality.MixedPerverseSheaf.isPure_dual`: `D_{X₀}F₀` is mixed perverse, and `F₀` pure of weight `w` implies `D_{X₀}F₀` pure of weight `−w` (§2.5, DeligneWeightsAndPurity §8.11).

- `TauCeti.EtaleDuality.MixedPerverseSheaf.isPure_twist`: `F₀` pure of weight `w` implies `F₀(r)` pure of weight `w − 2r`.

A proof proceeds as follows.

`D^b_m(X₀)` is stable under `f^*, Rf_*, Rf_!, Rf^!, ⊗, RHom` and Verdier duality (DeligneWeightsAndPurity §8.5)
and under the ordinary truncations, since mixedness is a condition on cohomology sheaves (BBD 5.1.6).

The perverse truncations are built from these operations along a stratification (§2.4, gluing), so they
preserve `D^b_m`; hence the perverse `t`-structure restricts (BBD 5.1.7(i)).

The heart of the restricted `t`-structure is a full subcategory of `Perv(X₀)` stable under kernels, cokernels and
extensions (it is the intersection with a triangulated subcategory).

Stability under subquotients: apply BBD Lemma 5.1.3/Remark 5.1.4 to the system of subcategories `Perv_m(Y₀)` for
all subschemes `Y₀`, whose hypotheses (stability under `p j_!, p j_*`, closed pushforward, lisse subquotients on
smooth strata) hold by DeligneWeightsAndPurity §8.5 (BBD 5.1.7(ii)).

Use [BBD-1982] 5.1.5–5.1.8, pp. 125–127; [Deligne-WeilII-1980] (6.1.11) and (6.2.2)–(6.2.4), pp. 246–247.

*Needs:* §2.4; EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; §3.4;
§2.5; DeligneWeightsAndPurity §8.1; DeligneWeightsAndPurity §8.2; DeligneWeightsAndPurity §8.5;
DeligneWeightsAndPurity §8.11; DeligneWeightsAndPurity §5.3.

**Checks.**


- `TauCeti.EtaleDuality.constantShift_isPure`: For `X₀` smooth of pure dimension `d, ℚ̄_ℓ[d]` is a mixed perverse sheaf, pure of weight `d`.

- `TauCeti.EtaleDuality.zero_isPure_all`: The zero perverse sheaf is mixed and pure of every weight `w`.

- `TauCeti.EtaleDuality.mixedPerverse_point_iff`: On `X₀ = Spec 𝔽_q` a perverse sheaf is a finite-dimensional Galois representation, and it is mixed iff every eigenvalue of the geometric Frobenius is a `q`-Weil number of some integer weight (DeligneWeightsAndPurity §5.3).

- `TauCeti.EtaleDuality.not_mixed_of_nonWeil_eigenvalue`: On `Spec 𝔽_q` the rank-one representation with Frobenius eigenvalue `1 + √2` is perverse but not mixed, since the conjugate `1 − √2` has a different absolute value.

- `ℚ̄_ℓ[d]` on a smooth pure `d`-dimensional `X₀` is mixed perverse and pure of weight `d`.

- On `Spec 𝔽_q, Perv_m` is the category of finite-dimensional continuous `ℚ̄_ℓ`-representations of `Gal(𝔽̄_q/𝔽_q)` whose Frobenius eigenvalues are `q`-Weil numbers of integer weight.

**Weights are tested at closed points and are insensitive to finite extension of `𝔽_q`.** Let `K₀ ∈ D^b_m(X₀, ℚ̄_ℓ)`. (a) `K₀` has weights `≤ w` iff `i_x^*K₀` has weights `≤ w` for every closed point `x` of `X₀`; it has weights `≥ w`
iff `i_x^!K₀` has weights `≥ w` for every closed point `x`. (b) For `n ≥ 1` the pullback of a specified arithmetic `K₀`
to `X₀ ⊗ 𝔽_{qⁿ}` is mixed, or has either weight bound, iff `K₀` does. This compares compatible arithmetic
descents: a bare geometric object can have different weights under different Frobenius descents. (c) For
nonzero mixed complexes `K₀,L₀` the optimal upper weight of `K₀ ⊠ L₀` is the sum of their optimal upper weights,
and its optimal lower weight is the sum of their optimal lower weights. For arbitrary complexes the
inequalities remain valid, including the zero object; the displayed equalities are asserted only for nonzero
factors.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). In (c), `X₀ × Y₀` is the fibre
product over `𝔽_q` and `K₀ ⊠ L₀ := pr₁^*K₀ ⊗ pr₂^*L₀`.

Name the resulting statement `pointwiseWeightCriteria`.

A proof proceeds as follows.

(a), first half: weights `≤ w` are defined by the punctual weights of `ℋ^i, i`.`e`. by the stalks at closed points,
which are the cohomology of `i_x^*K₀`.

(a), second half: `K₀` has weights `≥ w` iff `D K₀` has weights `≤ −w`; apply the first half to `D K₀` and use `i_x^* D = D i_x^!` (§0.2).

(b): the closed points of `X₀ ⊗ 𝔽_{qⁿ}` lie over those of `X₀` and the Frobenius of the residue field of a point
over `x` is a power of that of `x`; Weil `q^{deg}`-numbers of weight `w` are preserved and detected by powers.

(c): the upper bound `≤ w + w′` is stability of `⊗` and pullback (DeligneWeightsAndPurity §8.11); equality is
checked at closed points (a), where the stalk of `K₀ ⊠ L₀` at `(x, y)` is the tensor product of the stalks and
eigenvalue weights add; the lower bound follows by duality since `⊠` commutes with Verdier duality (§0.2,
Künneth for dualizing complexes).

Use [BBD-1982] Proposition 5.1.9, Remarks 5.1.10–5.1.11, p. 127; 5.1.12, p. 128; (5.1.14.1) and (5.1.14.1*),
pp. 128–129.

*Needs:* §0.2; DeligneWeightsAndPurity §8.1; DeligneWeightsAndPurity §8.2; DeligneWeightsAndPurity §8.11;
DeligneWeightsAndPurity §5.3.

**Checks.**


- `ℚ̄_ℓ` on `𝔸¹_{𝔽_q}` is pure of weight 0: at every closed point `x, i_x^*ℚ̄_ℓ = ℚ̄_ℓ` has weight 0 and `i_x^!ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2]` has weight `2 − 2 = 0`; its perverse shift `ℚ̄_ℓ[1]` is pure of weight 1.

- `ℚ̄_ℓ(1) ⊠ ℚ̄_ℓ(1)` on `Spec 𝔽_q` is `ℚ̄_ℓ(2)`, of weight `−4 = (−2) + (−2)`.

- The geometric rank-one sheaf on a point admits arithmetic descents with Frobenius 1 and `q`; they have weights 0 and 2 respectively. Finite extension of one chosen descent preserves its weight, but does not identify these descents.

### 5.2 Weights, Ext groups and affine detection

**Curve Euler–Poincaré with Swan conductors.** For a smooth connected curve `U` with smooth proper
completion `C` over an algebraically closed field `k`, `ℓ` invertible in `k`, and lisse finite-dimensional
`ℚ̄_ℓ`-sheaf `L`, prove `curveEulerPoincareSwan`:

`χ_c(U,L)=rank(L)χ_c(U,ℚ̄_ℓ)−Σ_(x∈C∖U) Swan_x(L)`.

Include the finite coefficient-field form used in BBD 4.5.1 and compatibility with coefficient extension.
Use ArithmeticGaloisRepresentations §3.1 / `Conductor.swanConductor` for local Swan conductors over the
completed curve fields and its finite-wild-image break description. For finite coefficient fields, lift the
wild representations through their prime-to-`ℓ` finite quotients to calculate the same Swan character.
For a finite étale cover `C′→C` of degree `e`, put `U′=C′×_C U`: rank is unchanged, the sum of Swan conductors
and `χ_c(U′,L|_U′)` are multiplied by `e`. For covers only étale over `U`, keep their actual boundary
ramification and compute Swan conductors by the upper-numbering restriction formula instead.

For the Leray sheaves in `bettiGrowthInEtaleTowers`, prove the conductor bounds used there as part of this
target: the inertia-equivariant nearby-cycle description identifies their geometric generic cohomology;
the wild action factors through one finite quotient independent of the projective-curve covers. If `b` bounds its upper breaks, each Swan conductor is at most `b` times the dimension of the corresponding nearby-cycle cohomology. The perverse nearby-cycle bounds and induction on the remaining factors give the smaller products in BBD 4.5.1, uniformly over these covers.

Use [SGA4half], [Sommes trig.] §3.2, equation (3.2.1), p.189; [BBD-1982] proof of Proposition 4.5.1,
pp.118–120, for the finite-coefficient formula and uniform wild-action estimate.

*Needs:* ArithmeticGaloisRepresentations §3.1 / `Conductor.swanConductor`;
LefschetzPencilsAndVanishingCycles Layer 6; §§0.5–0.6,2.6,3.1.

**Checks.**

- The constant rank-`r` sheaf has Swan sum zero and Euler characteristic `r(2−2g(C)−#(C∖U))`.
- A nontrivial tame Kummer sheaf on `𝔾_m` has Swan zero at both ends and Euler characteristic zero.
- In characteristic `p`, a nontrivial Artin–Schreier sheaf attached to `x^d` on `𝔸¹`, with `d≥1` prime to `p`,
  has Swan `d` at infinity and Euler characteristic `1−d`. A tame-only formula would give 1.
- A degree-`e` finite étale cover of the proper completion multiplies the boundary Swan sum and compact
  Euler characteristic by `e`; an arbitrary cover of the open curve carries no such unramified-boundary claim.

**Sublinear negative cohomology in étale towers.** Let `k` be algebraically closed, `ℓ` invertible in `k, X=∏_{a=1}^n X_a` with `X_a` smooth projective connected curves, and `f:U→X` quasi-finite separated. For
`K∈pD≥0(U,ℚ̄_ℓ)` there is `C` independent of connected finite étale covers `X̃_a→X_a` of degrees `d_a` such that, for
`Ũ=U×_X∏X̃_a, dim H^i(Ũ,K)≤C∏d_a` for all `i`, and for `i<0` it is bounded by `C·max_{|A|=n−|i|}∏_{a∈A}d_a` (zero if
`|i|>n`). Consequently, for any perverse sheaf `F` on a finite-type `k`-scheme and point `x` there is an affine étale
neighbourhood `U` and finite étale covers `U_N→U` of degrees `e_N→∞` with `dim H^i(U_N,F)=o(e_N)` for every `i<0`.

Work with the following additional hypotheses. The pullback of `K` to each cover is understood. The product
bound is for `n≥1`; the zero-dimensional case is immediate. The constant depends on `K` and `f`, never on the
covers.

Name the resulting statement `bettiGrowthInEtaleTowers`.

A proof proceeds as follows.

Reduce the projective-product upper-perverse bound to sheaves shifted by support dimension and to finite
coefficients via universal coefficients. Induct on the number of factors.

On a dense open of the first curve the relevant direct images are lisse. Leray, `curveEulerPoincareSwan` (including its finite-coefficient conductor estimates), and induction control ranks. Nearby-cycle perverse bounds control the Swan contributions by the
same smaller products. Duality gives the lower-perverse bound; quasi-finite `f_*` preserves `pD≥0`, giving 4.5.4.

Choose a quasi-finite affine-space map near `x`, and an étale neighbourhood pulled back from a product of
positive-genus projective curves. Covers of each curve with degree `d→∞` give total degree `d^n` while each
negative-degree bound is `O(d^(n−|i|))`. This yields the sublinear conclusion used in 5.2.3–5.2.8.

Use [BBD-1982] Proposition 4.5.1 and Corollaries 4.5.3–4.5.5, pp.117–121; use in 5.2.3–5.2.8, pp.131–134.

*Needs:* `curveEulerPoincareSwan`; §2.6; §2.5; LefschetzPencilsAndVanishingCycles Layer 6; EtaleCohomologyFoundations §§F.0–F.6 and the
scheme-site contract above.

**Checks.**


- For a positive-genus smooth projective curve `C, F=ℚ̄_ℓ[1], dim H⁻¹(C̃,F)=1` while the cover degree tends to infinity.

- For `n=2` and `i=−1` the bound is `C·max(d₁,d₂)`, rather than `C·d₁d₂`; equal-degree towers distinguish these rates.

- For `K=ℚ̄_ℓ[2]` on a product of two connected projective curves, `H⁻²` has dimension 1 on every connected product cover. The negative-degree estimate uses the empty product, independent of both degrees.

**`Ext`-vanishing between weights.** Let `K₀, L₀ ∈ D^b_m(X₀, ℚ̄_ℓ)` and `w ∈ ℤ`. (a) If `K₀` has weights `≤ w` and `L₀`
has weights `> w` (`i`.`e`. `≥ w + 1`), then `Ra_*RHom(K₀, L₀) ∈ D_{>0}(Spec 𝔽_q)` for `a : X₀ → Spec 𝔽_q`, and `Hom(K₀, L₀[i]) = 0` for all `i > 0`. (b) If `K₀` has weights `≤ w` and `L₀` has weights `≥ w`, then `F` has no invariants on `Hom(K, L[i])` for `i > 0`, so the restriction `Hom(K₀, L₀[i]) → Hom(K, L[i])` is zero for `i > 0`, and `Hom(K₀, L₀[i]) = 0`
for `i ≥ 2`. (c) In particular, for mixed perverse `K₀` of weights `≤ w` and `L₀` of weights `> w: Hom(K₀, L₀) = 0` and
`Ext¹_{Perv(X₀)}(K₀, L₀) = 0`; for simple mixed perverse `U₀, V₀` pure of weights `u > v, Ext¹(V₀, U₀) = 0`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality).

Name the resulting statement `weightExtVanishing`.

A proof proceeds as follows.

`RHom(K₀, L₀)` has weights `≥ (w+1) − w = 1` by DeligneWeightsAndPurity §8.11 (v), and `Ra_*` preserves lower bounds
(ii); so `Ra_*RHom ∈ D_{≥1} = D_{>0}`, giving (a) first part (BBD 5.1.15(i)).

On `Spec 𝔽_q`, a complex of weights `> 0` has `H^i` of weights `> i ≥ 0` for `i ≥ 0`, so Frobenius has no eigenvalue 1:
invariants and coinvariants of `Hom^i(K, L)` vanish for `i ≥ 0`.

Insert into the exact sequences of §5.1: `Hom^i(K₀, L₀) = 0` for `i > 0`, which is (`a`) (BBD 5.1.15(ii)).

With weights `≥ w` for `L₀, Hom^i(K, L)` has weights `≥ i`, hence `> 0` for `i ≥ 1`: invariants vanish for `i > 0` and
coinvariants vanish for `i ≥ 1`, giving (`b`) (BBD 5.1.15(iii)).

(c): for perverse `K₀, L₀, Hom^0 = Hom(K, L)^F` with weights `> 0` has no invariants; `Ext¹` in `Perv` is `Hom^1`
(§2.1). The simple pure case is the instance used in BBD 5.3.5.

Use [BBD-1982] Proposition 5.1.15 (i)–(iii) and its proof, p. 129.

*Needs:* §5.1; §2.1; DeligneWeightsAndPurity §8.11; DeligneWeightsAndPurity §8.2.

**Checks.**


- `K₀ = ℚ̄_ℓ, L₀ = ℚ̄_ℓ(−1)` on `Spec 𝔽_q` (weights 0 and `2`): `Hom^i(K₀, L₀) = 0` for all `i`, since Frobenius acts by `q ≠ 1`.

- Sharpness of the strict inequality: `K₀ = L₀ = ℚ̄_ℓ` on `Spec 𝔽_q` (both of weight 0) has `Ext¹(K₀, L₀) = ℚ̄_ℓ ≠ 0`, realised by the unipotent rank-two sheaf `E₂`.

**Lower weights of a mixed perverse sheaf are detected by `H⁰` on affine étale opens.** A mixed perverse sheaf
`F₀` on `X₀` has weights `≥ w` iff for every affine étale map `u : U₀ → X₀` the Frobenius module `H⁰(U, u^*F)`
(hypercohomology of the pullback over `𝔽̄_q`, with `U₀` defined over a finite extension `𝔽_{qⁿ}` as allowed by §5.1
(b)) has weights `≥ w`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `U₀ → X₀` étale with `U₀` affine; `H⁰`
is hypercohomology of the complex `u^*F` over `𝔽̄_q`.

Name the resulting statement `affineCohomologyWeightCriterion`.

A proof proceeds as follows.

Necessity: `u^! = u^*` for étale `u` preserves weights `≥ w`, and `RΓ = Ra_*` preserves lower bounds
(DeligneWeightsAndPurity §8.11 (ii)); `H⁰` of a complex of weights `≥ w` has weights `≥ w`.

For curves follow BBD 5.2.2: use the classification of simple perverse constituents, affine étale
neighbourhoods with many preimages of a selected point, and the estimates for `H⁻¹` and `H⁰`. Their dimensions
force the lower bound on the punctual part and on the lisse constituents.

The higher-dimensional argument is BBD 5.2.3–5.2.8, not a formal restriction-to-curves argument. Choose a
finite map to a product of curves and towers of finite étale covers on those curves. The cohomology-growth
theorem BBD 4.5.4–4.5.5 bounds negative cohomology by a polynomial of smaller degree than the top growth term.
The trace comparison in 5.2.5–5.2.7 excludes a constituent of weight below `w`; noetherian induction handles the
closed complement. The Betti-growth estimate of §5.2 lists the nearby-cycle and curve-Euler-characteristic
inputs; it is not supplied by the early perverse theorem alone.

The weights of `H⁰(U, F)` are those of the Frobenius of `𝔽_{qⁿ}` acting by transport of structure (BBD
5.1.11–5.1.12).

Use [BBD-1982] Théorème 5.2.1 and its proof 5.2.2–5.2.8, pp. 129–134.

*Needs:* §5.1; §2.7; §2.10; Layer 2; DeligneWeightsAndPurity §8.11; DeligneWeightsAndPurity §8.9.

**Checks.**


- `F₀ = ℚ̄_ℓ[1]` on `𝔾_{m,𝔽_q}: H⁰(𝔾_m, ℚ̄_ℓ[1]) = H¹(𝔾_m, ℚ̄_ℓ) = ℚ̄_ℓ(−1)` has weight `2 ≥ 1`, consistent with weights `≥ 1`, while `H^{−1} = H⁰(𝔾_m)` has weight `0 < 1` and is not tested.

- On `X₀=𝔾_{m,𝔽_q}`, the punctual sheaf `F₀=δ₁(1)` has `H⁰(X,F)=ℚ̄_ℓ(1)` of weight `−2` on the identity affine étale neighbourhood, so it does not have weights `≥−1`.

- For odd `q`, the connected affine étale cover `u:𝔾_m→𝔾_m`, `t↦t²`, has two rational lifts of 1. Thus `H⁰(U,u^*δ₁(1))=ℚ̄_ℓ(1)⊕ℚ̄_ℓ(1)`, pure of weight `−2`. For any affine étale neighbourhood meeting the support, this group is the permutation module on its finite nonempty set of geometric lifts, tensored with `ℚ̄_ℓ(1)`; Frobenius cycles contribute roots of unity, preserving weight `−2`.

**Subquotients of mixed perverse sheaves keep their weight bounds.** If a mixed perverse sheaf `F₀` has weights
`≥ w` (resp. `≤ w`), every subquotient of `F₀` in `Perv(X₀)` has weights `≥ w` (resp. `≤ w`).

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality).

Name the resulting statement `subquotientWeightStability`.

A proof proceeds as follows.

For a quotient `G₀` of `F₀` and affine étale `U`, Artin vanishing makes `H⁰(U,F) → H⁰(U,G)` surjective; hence the
lower bound `≥ w` passes to `G` by the affine `H⁰` criterion.

For a subobject `G₀ ⊂ F₀` the exact sequence `H⁻¹(U,F/G) → H⁰(U,G) → H⁰(U,F)` first gives `G₀` weights `≥ w−1`. Apply
the same argument to `G₀ ⊠ G₀ ⊂ F₀ ⊠ F₀`: the external product is perverse and exact in each argument by the
external-product exactness of §2.8, and `F₀ ⊠ F₀` has weights `≥ 2w`. Thus 2·(the optimal lower weight of `G₀`) `≥ 2w−1`, which gives `≥ w` by integrality. Treat `G₀=0` separately. This avoids using a nonexistent integral Tate
half-twist when `w` is odd.

Verdier duality exchanges subobjects and quotients and reverses weights, giving the upper bound `≤ w`. This is
BBD 5.3.1.

Use [BBD-1982] Proposition 5.3.1, p. 134.

*Needs:* §5.1; §2.7; §2.5; Layer 2; DeligneWeightsAndPurity §8.11.

**Checks.**


- On `Spec 𝔽_q` the unipotent rank-two sheaf `E₂` (Frobenius a single Jordan block with eigenvalue 1) is pure of weight 0, and its unique rank-one subobject and quotient `ℚ̄_ℓ` are pure of weight 0.

- On `Spec 𝔽_q, ℚ̄_ℓ ⊕ ℚ̄_ℓ(−1)` has weights `≤ 2` and `≥ 0`; its quotient `ℚ̄_ℓ(−1)` has weight `2 ≤ 2` and its subobject `ℚ̄_ℓ` has weight `0 ≥ 0`, while neither bound can be improved for the sum.

### 5.3 Purity of intermediate extensions

**Affine intermediate-extension weights and the perverse-normalization adapter.** (a) Let `j : U₀ ↪ X₀` be
an affine locally closed immersion and `F₀` a mixed perverse sheaf on `U₀`. If `F₀` has weights `≤ w` (resp. `≥ w`), so
does `j_!*F₀`; if `F₀` is pure of weight `w, j_!*F₀` is pure of weight `w`. (b) Let `X₀` be irreducible of dimension `d, U₀ ⊂ X₀` a dense open subscheme smooth over `𝔽_q` and `L₀` a lisse `ℚ̄_ℓ`-sheaf on `U₀` punctually pure of weight `w`.
Identify the intersection complex of §2.10 with the shifted supplied normalized complex,
`IC_{X₀}(L₀) ≅ IC⁰_{X₀}(L₀)[d]`. Transport `normalized-scheme-ic-purity` of
AutomorphicLFunctionsAndLocalFactors AL.3 across this identification: `IC_{X₀}(L₀)` is pure perverse of weight
`w + d`, and `IC_{X₀} := IC_{X₀}(ℚ̄_ℓ)` has weight `d`. (c) For `X₀` proper over `𝔽_q`, the comparison
`H^i(X, IC_X(L)) ≅ H^{i+d}(X, IC⁰_X(L))` transports the supplied proper-cohomology purity to weight
`w + d + i` for every `i`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). (a): `j` affine (`j_!` and `Rj_*` are
then `t`-exact for the perverse `t`-structure). (b): the shift is the perverse normalisation `L₀[d]`; no Tate
half-twist is built in.

Name this interface `intersectionComplexPurity`. Parts (b)–(c) are the perverse-normalization adapter for the
generic scheme purity theorem supplied by AutomorphicLFunctionsAndLocalFactors AL.3,
`normalized-scheme-ic-purity`.

A proof proceeds as follows.

(a) Since `j` is affine and quasi-finite, `j_!F₀` and `Rj_*F₀` are perverse (§2.7, BBD 4.1.3).

If `F₀` has weights `≤ w, j_!F₀` has weights `≤ w` (DeligneWeightsAndPurity §8.11 (i)); `j_!*F₀` is the image of `j_!F₀ → Rj_*F₀`, a quotient of `j_!F₀` in `Perv(X₀)`, so it has weights `≤ w` by §5.2.

Dually, if `F₀` has weights `≥ w, Rj_*F₀` has weights `≥ w` and its subobject `j_!*F₀` has weights `≥ w`; combining both
gives purity (BBD 5.3.2, first proof).

(b) Both normalizations use the same intermediate extension: §2.10 gives `IC_{X₀}(L₀)=j_!*(L₀[d])`, while
the supplier defines `IC⁰_{X₀}(L₀)=(j_!*(L₀[d]))[−d]`. The shift isomorphisms give the comparison, compatible
with restriction and independence of the dense smooth open. The supplied weight `w` becomes `w+d` under
`[d]` by the shift convention; perversity is §2.10. No Tate twist is introduced.

(c) Apply `RΓ` to that comparison. Cohomological grading identifies degree `i` on the perverse normalization
with degree `i+d` on `IC⁰`, whose supplied proper-cohomology weight is `w+(i+d)`.

Use [BBD-1982] Corollaire 5.3.2 with its first proof, p. 135, for (a);
[TCR-AutomorphicLFunctionsAndLocalFactors] AL.3, `normalized-scheme-ic-purity`, for (b)–(c);
[Deligne-WeilII-1980] (6.2.2), (6.2.4) and (6.2.5) `b`), p. 247, for the weight and shift conventions.

*Needs:* §2.7; §5.2; §2.4; §2.10; §2.8; §5.1; DeligneWeightsAndPurity §8.11; DeligneWeightsAndPurity §8.9;
AutomorphicLFunctionsAndLocalFactors AL.3, `normalized-scheme-ic-purity`.

**Checks.**


- For a smooth projective curve `C₀` and `L₀ = ℚ̄_ℓ: IC = ℚ̄_ℓ[1]`, pure of weight 1, and `H^i(C, ℚ̄_ℓ[1]) = H^{i+1}(C, ℚ̄_ℓ)` is pure of weight `i + 1`.

- For the split nodal cubic `X₀` with normalisation `ν : ℙ¹ → X₀` (`ν` finite birational), `IC_{X₀} = ν_*ℚ̄_ℓ[1]`, so `H⁰(X,IC_X)=IH¹(X)=H¹(ℙ¹,ℚ̄_ℓ)=0` although `H¹(X, ℚ̄_ℓ) = ℚ̄_ℓ` has weight 0: the constant sheaf `ℚ̄_ℓ[1]` on `X₀` is not pure of weight 1.

- The specialisation `X₀` smooth projective of dimension `d` gives `IC = ℚ̄_ℓ[d]` and recovers purity of `H^i(X, ℚ̄_ℓ)` of weight `i` (the Weil II weight inputs (DeligneWeightsAndPurity §§8.1–8.20), Weil II 3.3.9).

- For a pure lisse sheaf of weight `w` on a smooth curve, `IC⁰` has weight `w` and `IC=IC⁰[1]` has weight `w+1`, including odd `w`. The adapter uses only a cohomological shift.

**Simple mixed perverse sheaves are pure.** Every simple object of `Perv_m(X₀)` is pure: it is isomorphic to
`i_*j_!*(L₀[d])` for `i` the closure of a smooth connected locally closed `U₀ ⊂ X₀` of dimension `d, j : U₀ ↪ Ū₀` open
and `L₀` an irreducible lisse `ℚ̄_ℓ`-sheaf on `U₀` punctually pure of some integer weight `β`, and it is pure of
weight `β + d`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality).

Name the resulting statement `simpleMixedPerverseIsPure`.

A proof proceeds as follows.

A simple mixed perverse sheaf is simple in `Perv(X₀)` (§5.1: subobjects of mixed are mixed), so it is
`i_*j_!*(L₀[d])` with `L₀` irreducible lisse on a smooth connected `U₀` (§2.10, applied to arithmetic objects
through §5.1).

Shrink `U₀` (allowed, §2.10): `L₀` is mixed and irreducible, so its weight filtration by lisse subsheaves
(DeligneWeightsAndPurity §5.3; Weil II 3.4.1(ii)) has a single step and `L₀` is punctually pure.

Take `U₀` affine and apply §5.3 (BBD 5.3.4).

Use [BBD-1982] Corollaire 5.3.4, p. 136.

*Needs:* §5.1; §2.10; DeligneWeightsAndPurity §5.3.

**Checks.**


- The punctual simple perverse sheaf `ℚ̄_ℓ(r)` at a closed point is pure of weight `−2r`.

- On `Spec 𝔽_q` a simple mixed perverse sheaf is a one-dimensional continuous `ℚ̄_ℓ`-representation whose Frobenius eigenvalue is a `q`-Weil number of some integer weight `β`, and it is pure of weight `β`.

### 5.4 The perverse weight filtration

**Splitting lemma for a partition of simple objects with `Ext¹`-vanishing.** Let A be an abelian category in
which every object has finite length. Let `S⁺ ⊔ S⁻` be a partition of the isomorphism classes of simple objects,
and `A⁺` (resp. `A⁻`) the full subcategory of objects all of whose simple subquotients lie in `S⁺` (resp. `S⁻`).
Assume every short exact sequence `0 → U → E → V → 0` with `U ∈ S⁺` and `V ∈ S⁻` splits. Then every object `F` has a
unique subobject `W F ∈ A⁻` with `F / W F ∈ A⁺`; `Hom(A⁺, A⁻) = Hom(A⁻, A⁺) = 0` and `Ext¹(A⁻, A⁺) = 0`; and every
morphism `f : F → G` satisfies `f(W F) = f(F) ∩ W G`.

Work with the following additional hypotheses. A abelian, every object of finite `length` (artinian and
noetherian); the partition is of isomorphism classes of simple objects; `Ext¹` vanishing is only required from
`S⁻` to `S⁺`.

Name the resulting statement `torsionTheorySplittingLemma`; `exists_unique_torsion_subobject` in `Suggested.lean` states existence and uniqueness of the constituent-defined subobject. For an isomorphism-invariant predicate `P`, `SimpleSubquotientsIn P X` means that `P` holds for every simple quotient `B/A` of subobjects `A ≤ B` of `X`. Give this predicate invariance under isomorphism and closure under subobjects, quotients and extensions. The simple-object test is `SimpleSubquotientsIn P X ↔ P X` for simple `X`. These are the constituent conditions defining `A⁺` and `A⁻` above.

A proof proceeds as follows.

`Ext¹(Y, X) = 0` for `X ∈ A⁺, Y ∈ A⁻` by dévissage along composition series and the long exact `Ext` sequence; `Hom`
vanishings because `A⁺` and `A⁻` share no simple constituents.

Existence by induction on length: choose a simple subobject `S ⊂ F` and `W(F/S)`; its preimage `E` is an extension
of `W(F/S)` by `S`. If `S ∈ S⁻` take `W F = E`; if `S ∈ S⁺` the extension splits by `Ext¹(W(F/S), S) = 0`, take a lift of
`W(F/S)`.

Uniqueness: for two candidates `W′, W″` the composites `W′ → F → F/W″` and `W″ → F → F/W′` vanish by `Hom(A⁻, A⁺) = 0`.

Strictness: both `f(W F)` and `f(F) ∩ W G` have the characteristic property of `W(f(F))`.

Use [BBD-1982] Lemme 5.3.6 and its proof, p. 137.

*Needs:* `CategoryTheory.Abelian`; `CategoryTheory.Simple`; `CategoryTheory.IsArtinianObject`;
`CategoryTheory.IsNoetherianObject`.

**Checks.**


- The zero object satisfies `SimpleSubquotientsIn P` for every `P` because it has no simple subquotient.
- On a simple nonzero `S` the predicate holds precisely when `P(S)` holds; taking `P` constantly false gives a non-example.
- The module `ℚ[t]/(t−1)²` satisfies `SimpleSubquotientsIn` for the predicate of being isomorphic to `ℚ[t]/(t−1)`, yet is not semisimple. Its length-two extension does not split; a constituent condition cannot require a direct-sum presentation.

- `A =` finite-dimensional representations of `ℤ` over `ℚ̄_ℓ` on which the generator acts with eigenvalues in `{1, q}`, `S⁻ = {eigenvalue 1}`, `S⁺ = {eigenvalue q}`: `W F` is the generalized 1-eigenspace and the splitting is the generalized eigenspace decomposition.

- Without the `Ext¹` hypothesis the conclusion fails: for finite-dimensional representations of the quiver `1 → 2` over a field, the indecomposable projective `P₁` is a non-split extension of `S₁` by `S₂`; with `S⁻ = {S₁}` and `S⁺ = {S₂}`, its subobjects are `0, S₂` and `P₁`, and none lies in `A⁻` with quotient in `A⁺`.

**The weight filtration of a mixed perverse sheaf.** Every mixed perverse sheaf `F₀` on `X₀` has a unique finite
increasing filtration `W = (W_i F₀)_{i ∈ ℤ}` by perverse subsheaves, with `W_i F₀ = 0` for `i ≪ 0` and `W_i F₀ = F₀`
for `i ≫ 0`, such that `Gr^W_i F₀ := W_i F₀ / W_{i−1} F₀` is pure of weight `i` for every `i`. `W_i F₀` is the largest
perverse subsheaf of weights `≤ i`, and `F₀ / W_i F₀` has weights `> i`. Every morphism `f : F₀ → G₀` of mixed
perverse sheaves is strictly compatible: `f(W_i F₀) = f(F₀) ∩ W_i G₀`. The filtration is an arithmetic object on
`X₀`; its arithmetic filtration need not split, and its geometric pullback can also be nonsplit, although each
geometric graded piece is semisimple (§5.5).

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). Weights are integers (mixed in
the sense of the Weil II weight convention, not `ι`-mixed with real weights); for `ι`-mixed objects BBD 5.3.5
applies to the weight-class decomposition modulo `ℤ` first.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.weightFiltration`: For a mixed perverse sheaf `F₀` and `i ∈ ℤ`, the perverse subsheaf `W_i F₀ ⊆ F₀`.

- `TauCeti.EtaleDuality.weightFiltration_mono`: `W_i F₀ ≤ W_{i+1} F₀` as subobjects.

- `TauCeti.EtaleDuality.weightFiltration_eq_bot`: There is `N` with `W_i F₀ = 0` for `i < −N` and `W_i F₀ = F₀` for `i > N`.

- `TauCeti.EtaleDuality.weightGraded_isPure`: `W_i F₀ / W_{i−1} F₀` is pure of weight `i`.

- `TauCeti.EtaleDuality.weightFiltration_unique`: Any finite increasing filtration by perverse subsheaves with pure graded pieces of weights `i` equals `W`.

- `TauCeti.EtaleDuality.weightFiltration_strict`: For `f : F₀ → G₀, f(W_i F₀) = f(F₀) ∩ W_i G₀`; in particular `f` maps `W_i` into `W_i`.

- `TauCeti.EtaleDuality.weightFiltration_eq_largest`: `W_i F₀` is the largest perverse subsheaf of `F₀` having weights `≤ i`.

- `TauCeti.EtaleDuality.weightFiltration_dual`: `D(W_i F₀)` is identified with the quotient `D F₀ / W_{−i−1} D F₀` (duality exchanges weights `i` and `−i`).

A proof proceeds as follows.

`Perv_m(X₀)` is abelian with all objects of finite `length` (§5.1, §2.10), and simple objects are pure (§5.3).

For each `i`, partition the simple classes into `S⁺` (weight `> i`) and `S⁻` (weight `≤ i`); `Ext¹(V, U) = 0` for `U ∈ S⁺, V ∈ S⁻` by §5.2 (c).

§5.4 gives the unique `W_i F₀` with constituents of weight `≤ i` and quotient with constituents of weight `> i`, and
strictness.

An object of `A⁻` has weights `≤ i` (weights `≤ i` are stable under extensions, DeligneWeightsAndPurity §8.1) and
conversely constituents of an object of weights `≤ i` have weights `≤ i` (§5.2); so `W_i F₀` is the largest
subobject of weights `≤ i` and `Gr^W_i` is pure of weight `i` (BBD 5.3.5).

Use [BBD-1982] Théorème 5.3.5 and its proof with Lemme 5.3.6, pp. 136–137.

*Needs:* §5.1; §2.10; §5.3; §5.2; §2.5; DeligneWeightsAndPurity §8.1.

**Checks.**


- `TauCeti.EtaleDuality.weightFiltration_pure`: If `F₀` is pure of weight `w` then `W_i F₀ = 0` for `i < w` and `W_i F₀ = F₀` for `i ≥ w`.

- `TauCeti.EtaleDuality.weightFiltration_jstar_Gm`: For `j : 𝔾_m ↪ 𝔸¹` over `𝔽_q, W_1(Rj_*ℚ̄_ℓ[1]) = ℚ̄_ℓ,𝔸¹[1]` and `Gr^W_2(Rj_*ℚ̄_ℓ[1]) ≅ δ₀(−1)`.

- `TauCeti.EtaleDuality.weightFiltration_point`: On `Spec 𝔽_q, W_i` of a mixed representation `V` is the sum of the generalized Frobenius eigenspaces with eigenvalues of weight `≤ i`. The ordinary and perverse hearts on a point coincide; DeligneWeightsAndPurity §0.7 supplies the spectral calculation.

- `TauCeti.EtaleDuality.weightFiltration_not_split_geometrically_trivial`: The weight filtration is not a direct-sum decomposition in `Perv(X₀)` in general: the extension in `weightFiltration_jstar_Gm` is non-split, since `Hom(δ₀(−1), Rj_*ℚ̄_ℓ[1]) = 0`.

- For `F₀` pure of weight `w: W_{w−1}F₀ = 0` and `W_w F₀ = F₀`.

- On `𝔾_{m,𝔽_q}` with `j : 𝔾_m ↪ 𝔸¹`, the perverse sheaf `Rj_*ℚ̄_ℓ[1]` sits in `0 → ℚ̄_ℓ,𝔸¹[1] → Rj_*ℚ̄_ℓ[1] → δ₀(−1) → 0`; its weight filtration has `Gr_1 = ℚ̄_ℓ[1]` and `Gr_2 = δ₀(−1)`, the punctual sheaf at 0 of weight 2.

**Upper weights of a mixed perverse sheaf are detected generically on closed subvarieties.** A mixed perverse
sheaf `F₀` on `X₀` has weights `≤ w` iff every irreducible closed subscheme `Y₀ ⊆ X₀`, of dimension `d`, has a dense
open `U₀ ⊆ Y₀` on which the ordinary cohomology sheaf `ℋ^{−d}(F₀)|_{U₀}` has punctual weights `≤ w − d`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality).

Name the resulting statement `genericWeightCriterion`.

A proof proceeds as follows.

Necessity: weights `≤ w` means `ℋ^{−d}` has punctual weights `≤ w − d` everywhere.

Sufficiency: otherwise, by §5.4, `F₀` has a simple quotient `G₀` pure of weight `w′ > w`, of the form `j_!*(L₀[d])` on
a smooth affine connected `U₀ ⊂ Y₀` with `L₀` punctually pure of weight `w′ − d` (§5.3).

The long exact cohomology sequence of `0 → Ker → F₀ → G₀ → 0` gives, on a dense open of `Y₀`, a surjection
`ℋ^{−d}(F₀) → ℋ^{−d}(G₀) = L₀` (degree `−d` is the top degree there by the perverse stalk bounds, §2.4); so `L₀` has
weights `≤ w − d`, contradicting `w′ > w` (BBD 5.3.7).

Use [BBD-1982] Corollaire 5.3.7 and its proof, pp. 137–138.

*Needs:* §5.3; §2.4; DeligneWeightsAndPurity §8.1.

**Checks.**


- For `F₀ = ℚ̄_ℓ[1] ⊕ δ₀(−1)` on `𝔸¹`: on `Y₀ = 𝔸¹` the generic sheaf `ℋ^{−1} = ℚ̄_ℓ` has weight `0 ≤ w − 1` iff `w ≥ 1`, and on `Y₀ = {0}` the sheaf `ℋ^0` contains `ℚ̄_ℓ(−1)` of weight `2 ≤ w` iff `w ≥ 2`; so `F₀` has weights `≤ 2` and not `≤ 1`.

### 5.5 Geometric semisimplicity and arithmetic Jordan blocks

**Semisimple and geometrically semisimple perverse sheaves.** An object of an abelian category is semisimple
if it is isomorphic to a finite direct sum of simple objects. A perverse sheaf `F` on `X` (over `𝔽̄_q`) is
semisimple if it is semisimple in `Perv(X, ℚ̄_ℓ)`; then `F ≅ ⊕_k i_{V_k*} j_{k!*}(L_k[d_k])` with `V_k` smooth
connected locally closed of dimension `d_k` and `L_k` irreducible lisse. A perverse sheaf `F₀` on `X₀` is
geometrically semisimple if its pullback `F` to `X` is semisimple; a complex `K₀ ∈ D^b_c(X₀, ℚ̄_ℓ)` is geometrically
split-semisimple if its pullback `K` satisfies `K ≅ ⊕_i pH^i(K)[−i]` with every `pH^i(K)` semisimple. No condition
on the Frobenius structure is imposed.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). Semisimplicity is a property of
the geometric object over `𝔽̄_q`, not of `F₀` in `Perv(X₀)`; a decomposition of `K` is an isomorphism, not a canonical
one.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.IsSemisimpleObject`: In an abelian category with finite biproducts: `X` is isomorphic to a finite biproduct of simple objects.

- `TauCeti.EtaleDuality.IsSemisimpleObject.biprod`: Finite biproducts of semisimple objects are semisimple.

- `TauCeti.EtaleDuality.IsSemisimpleObject.of_mono`: In a finite-length abelian category, a subobject (and a quotient) of a semisimple object is semisimple and is a direct summand.

- `TauCeti.EtaleDuality.isSemisimpleObject_iff_socle`: A finite-length object is semisimple iff it equals the sum of its simple subobjects (its socle).

- `TauCeti.EtaleDuality.IsGeometricallySemisimple`: `F₀ ∈ Perv(X₀)` is geometrically semisimple iff its pullback to `X` is IsSemisimpleObject in `Perv(X, ℚ̄_ℓ)`.

- `TauCeti.EtaleDuality.IsGeometricallySplitSemisimple`: `K₀` is geometrically split-semisimple iff over `𝔽̄_q` there is an isomorphism `K ≅ ⊕_i pH^i(K)[−i]` (finite sum) and each `pH^i(K)` is semisimple.

- `TauCeti.EtaleDuality.isGeometricallySemisimple_lisse_iff`: For `X₀` smooth connected of dimension `d` and `L₀` lisse, `L₀[d]` is geometrically semisimple iff `L₀` is geometrically semisimple in the sense of DeligneWeightsAndPurity §8.14, 8.19.

- `TauCeti.EtaleDuality.IsGeometricallySemisimple.baseChange`: Geometric semisimplicity is invariant under extension of `𝔽_q` to `𝔽_{qⁿ}` and of `E` to `E′`.

A proof proceeds as follows.

Finite direct sums exist in `Perv(X)` (an additive heart); finite length makes 'sum of simple subobjects' and
'finite direct sum of simples' agree.

The description of simple objects is §2.10.

For lisse sheaves on a smooth connected `X₀` shifted by `dim X₀`, the definition agrees with geometric
semisimplicity of DeligneWeightsAndPurity §8.14, 8.19, since `L ↦ L[d]` is an exact fully faithful embedding of
lisse sheaves into `Perv(X)` whose essential image is closed under subquotients on smooth `X`.

Use [BBD-1982] Théorème 5.3.8 (statement), p. 138; 6.2.4 (the notion 'semi-simple' for complexes), p. 163.

*Needs:* §2.10; §2.4; §2.1; `CategoryTheory.Simple`; `CategoryTheory.Limits.HasFiniteBiproducts`;
`IsSemisimpleModule`; DeligneWeightsAndPurity §8.14, 8.19.

**Checks.**


- `TauCeti.EtaleDuality.isSemisimpleObject_zero`: The zero object is semisimple (the empty biproduct).

- `TauCeti.EtaleDuality.isSemisimpleObject_moduleCat_field`: For a field `K`, every finite-dimensional object of ModuleCat `K` is IsSemisimpleObject, agreeing with Mathlib's IsSemisimpleModule.

- `TauCeti.EtaleDuality.not_isSemisimpleObject_unipotent`: The `ℚ̄_ℓ[ℤ]`-module `ℚ̄_ℓ²` on which 1 acts by the unipotent Jordan block is not semisimple in finite-dimensional `ℤ`-representations: its unique simple subobject has no complement.

- `TauCeti.EtaleDuality.E2_isGeometricallySemisimple`: The rank-two unipotent sheaf `E₂` on `Spec 𝔽_q` is geometrically semisimple, and its arithmetic object is not semisimple in `Perv(Spec 𝔽_q)`.

- The constant sheaf `ℚ̄_ℓ[d]` on a smooth connected `X₀` of pure dimension `d` is geometrically semisimple. It is geometrically simple when `X₀` is geometrically connected; for `X₀ = Spec 𝔽_(q²)`, its geometric pullback is the direct sum of the constant sheaves on two points.

- The arithmetic sheaf `E₂` (unipotent Frobenius) on `Spec 𝔽_q` is geometrically semisimple (over `𝔽̄_q` it is `ℚ̄_ℓ²`) but not semisimple in `Perv(Spec 𝔽_q)`.

**Pure perverse sheaves are geometrically semisimple.** If `F₀` is a pure perverse sheaf on `X₀` (of some weight
`w`), then `F₀` is geometrically semisimple: over `𝔽̄_q, F` is a finite direct sum of simple perverse sheaves
`i_*j_!*(L[d])` with `L` irreducible lisse on smooth connected `U ⊂ X` of dimension `d`. Neither `F₀` in `Perv(X₀)` nor
the Frobenius action is asserted semisimple.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). Purity of the arithmetic object
`F₀` is the hypothesis; a perverse sheaf over `𝔽̄_q` with no pure model is not covered.

Name the resulting statement `purePerverseGeometricSemisimplicity`.

A proof proceeds as follows.

Let `F′ ⊆ F` be the socle (sum of simple perverse subsheaves); it is Frobenius-stable, so it descends to `F′₀ ⊆ F₀` (§5.1, stability under subquotients).

`F′₀` and `F″₀ := F₀ / F′₀` are pure of weight `w` (§5.2).

The class of `0 → F′₀ → F₀ → F″₀ → 0` in `Hom^1(F″₀, F′₀)` maps to zero in `Hom^1(F″, F′)` (§5.2 (b)), so `F ≅ F′ ⊕ F″` over `𝔽̄_q`.

If `F″ ≠ 0` it has a simple subobject, which lifts to a simple subobject of `F` not in `F′`, contradicting
maximality; so `F = F′` is semisimple (BBD 5.3.8, copying Weil II 3.4.1(iii)).

Use [BBD-1982] Théorème 5.3.8 and its proof, p. 138; [Deligne-WeilII-1980] Théorème (3.4.1)(iii), p. 207.

*Needs:* §5.1; §5.2; §2.10.

**Checks.**


- Deligne's semisimplicity theorem: pure lisse sheaves are geometrically semisimple (DeligneWeightsAndPurity §§8.1–8.20) (a punctually pure lisse sheaf on a normal `X₀` is geometrically semisimple) is recovered for smooth connected `X₀` by applying the theorem to `L₀[dim X₀]`.

- `E₂` on `Spec 𝔽_q` is pure of weight 0 and geometrically semisimple, but `F₀ = E₂` is not semisimple: the theorem asserts nothing about the arithmetic category.

**Indecomposable pure perverse sheaves are Jordan blocks on simple ones.** (a) The indecomposable pure
perverse sheaves on `X₀` with `ℚ̄_ℓ` coefficients are exactly `S₀ ⊗ E_n` with `S₀` pure simple and `n ≥ 1`, where `E_n` is
the pullback to `X₀` of the rank-`n` sheaf on `Spec 𝔽_q` on which geometric Frobenius acts unipotently with one
Jordan block. (b) If `S₀` is simple, there are `d ≥ 1` and a perverse sheaf `S₁` on `X₁ := X₀ ⊗ 𝔽_{q^d}` such that `S₀ ≅ π_*S₁` for `π : X₁ → X₀, S₁` is geometrically simple (its pullback to `X` is simple) and `S₁` is not isomorphic to
any of its nonidentity conjugates under `Gal(𝔽_{q^d}/𝔽_q)`. Part (a) also holds with coefficients a finite
`E/ℚ_ℓ`; part (b) does not in general.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality).

Name the resulting statement `pureIndecomposables`.

A proof proceeds as follows.

For `F₀` with `F` semisimple (e.g. `F₀` pure, §5.5), decompose `F` into isotypic components indexed by isomorphism
classes a of simple constituents; Frobenius permutes the classes, and orbits `C` give a decomposition `F₀ = ⊕_C F₀,C` descending by §5.1.

For an orbit of `length d`, the a-part is defined over `𝔽_{q^d}` and `F₀,C ≅ π_*(F₁,a)`; choose `φ : Fr^{d*}G_a ≅ G_a`
for a simple `G_a`; then `F₁`,a `≅ G_a ⊗ V_a` with `V_a := Hom(G_a, F_a)` carrying a Frobenius.

Indecomposability forces one orbit and a single Jordan block on `V_a`; rescaling `φ` makes it unipotent, giving `S₀ ⊗ E_n` with `S₀ = π_*(G₁)` simple (BBD 5.3.9(i)); for `F₀` simple, `V_a` is one-dimensional, giving (b).

With `E` coefficients the linear algebra of 5.3.9(i) still goes through, but the descent of a geometrically
simple constituent to a finite extension may need a coefficient extension, so (b) fails as stated (BBD
5.3.10).

Use [BBD-1982] Proposition 5.3.9, pp. 138–139, and Remarque 5.3.10, p. 140.

*Needs:* §5.1; §2.10.

**Checks.**


- `E_n` on `Spec 𝔽_q` is pure of weight 0 and indecomposable but not simple for `n ≥ 2`.

- Let `X₀ = Spec 𝔽_{q²}`, viewed over `𝔽_q`: the simple perverse sheaf `ℚ̄_ℓ` on `X₀` pulls back to `ℚ̄_ℓ ⊕ ℚ̄_ℓ` on the two geometric points, so it is not geometrically simple; it is `π_*S₁` for `d = 2` and `S₁` the constant sheaf on one of the two components of `X₀ ⊗ 𝔽_{q²}`, which is geometrically simple and not isomorphic to its Galois conjugate.

**A pure perverse sheaf splits into an intermediate extension and a part supported on the complement.** Let `F₀`
be a pure perverse sheaf on `X₀, j : U₀ ↪ X₀` open and `i : Z₀ ↪ X₀` the complementary closed immersion. Then `F₀`
has a unique decomposition `F₀ = j_!*F′₀ ⊕ i_*F″₀` in `Perv(X₀)`, with `F′₀ = j^*F₀`; the adjunction map `pj_!j^*F₀ → F₀` factors through the quotient `j_!*j^*F₀` of `pj_!j^*F₀`, the map `F₀ → pj_*j^*F₀` through the subobject `j_!*j^*F₀`
of `pj_*j^*F₀`, and the composite of adjunction maps `i_* pH⁰(i^!F₀) → F₀ → i_* pH⁰(i^*F₀)` is an isomorphism
(both sides equal `i_*F″₀`).

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `F₀` pure; for mixed `F₀` the
decomposition fails (e.g. `Rj_*ℚ̄_ℓ[1]` on `𝔸¹`).

Name the resulting statement `pureOpenClosedDecomposition`.

A proof proceeds as follows.

Uniqueness: `Hom(j_!*F′, i_*F″) = Hom(i_*F″, j_!*F′) = 0` since `j_!*` has no subobject or quotient supported on `Z`
(§2.3).

By §5.1 it suffices to check the factorisations and that the maps are the inclusions and projections of a
decomposition over `𝔽̄_q`.

Over `𝔽̄_q, F` is semisimple (§5.5), so it suffices to treat its simple constituents, each of the form `j_!*G′` or
`i_*G″` (§2.10), for which the statements are immediate (BBD 5.3.11).

Use [BBD-1982] Corollaire 5.3.11, p. 140.

*Needs:* §5.1; §2.3; §2.10; §2.4.

**Checks.**


- For the mixed, not pure, perverse sheaf `F₀ = Rj_*ℚ̄_ℓ[1]` on `𝔸¹_{𝔽_q}` with `Z = {0}: i^!F₀ = 0` while `pH⁰(i^*F₀) = ℚ̄_ℓ(−1) ≠ 0`, so the composite in the statement is not an isomorphism, and `F₀` is a non-split extension of `δ₀(−1)` by `ℚ̄_ℓ[1]`; purity is necessary.

- For `F₀ = IC_{X₀}` with `X₀` irreducible and `U₀` dense, `F″₀ = 0`.

### 5.6 Perverse cohomology and decomposition

**Weights of a mixed complex are read off its perverse cohomology.** Let `K₀ ∈ D^b_m(X₀, ℚ̄_ℓ)`. (a) `K₀` has
weights `≤ w` (resp. `≥ w`) iff every perverse cohomology sheaf `pH^i(K₀)` has weights `≤ w + i` (resp. `≥ w + i`). (b)
`K₀` is pure of weight `w` iff every `pH^i(K₀)` is pure of weight `w + i`. (c) For `f : X₀ → Y₀` of finite type and `F₀` a
mixed perverse sheaf of weights `≤ w`, the perverse sheaves `pH⁰(Rf_!F₀)` and `pH⁰(f^*F₀)` have weights `≤ w`; if `F₀`
has weights `≥ w, pH⁰(Rf_*F₀)` and `pH⁰(Rf^!F₀)` have weights `≥ w`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). Perverse truncation and perverse
cohomology are those of §5.1; the shift convention puts `pH^i(K₀)[−i]` in weights `≤ w + i − i = w` when `pH^i` has
weights `≤ w + i`.

Name the resulting statement `perverseCohomologyWeights`.

A proof proceeds as follows.

Sufficiency in (a): weights `≤ w` are stable under extensions in triangles (DeligneWeightsAndPurity §8.1); use
the triangles `(pτ_{<i}K₀, pτ_{≤i}K₀, pH^i(K₀)[−i])`.

Necessity for upper bounds is BBD 5.4.1, by descending induction, reducing to `w=0` and `pH⁰K₀`. Once the positive
perverse cohomology is bounded, `pτ≤0K₀` has upper weight `≤0`. On an irreducible `d`-dimensional closed `Y₀` use the
exact sequence `ℋ⁻ᵈ(pτ≤0K₀)|_Y₀ → ℋ⁻ᵈ(pH⁰K₀)|_Y₀ → ℋ⁻ᵈ⁺¹(pτ<0K₀)|_Y₀`. The last term vanishes on a dense open by
the perverse support condition, so the middle term is generically a quotient of the first, whose punctual
weights are `≤−d`. Apply the generic-weight criterion. Duality gives lower bounds. The first term is not claimed
to vanish.

(b) is (a) applied to both bounds (BBD 5.4.4).

(c): `Rf_!, f^*` preserve upper bounds and `Rf_*, f^!` lower bounds (DeligneWeightsAndPurity §8.11); apply (a) to
the degree-0 perverse cohomology (BBD 5.4.2).

Use [BBD-1982] Théorème 5.4.1, Corollaires 5.4.2 and 5.4.4, pp. 140–142.

*Needs:* §5.1; §5.4; §2.1; DeligneWeightsAndPurity §8.1; DeligneWeightsAndPurity §8.11.

**Checks.**


- For `X₀` smooth of dimension `d, K₀ = ℚ̄_ℓ` (weight `0`): `pH^d(K₀) = ℚ̄_ℓ[d]` is pure of weight `0 + d`, and all other `pH^i` vanish.

- For `f : 𝔸¹_{𝔽_q} → Spec 𝔽_q` and `F₀ = ℚ̄_ℓ[1]` (pure of weight `1`): `Rf_!F₀ = H²_c(𝔸¹)[−1] = ℚ̄_ℓ(−1)[−1]`, whose only perverse cohomology sheaf `pH¹ = ℚ̄_ℓ(−1)` has weight `2 = 1 + 1`; by (b), `Rf_!F₀` is pure of weight 1.

**Intermediate extension along a quasi-finite morphism preserves weights.** Let `f : X₀ → Y₀` be quasi-finite
(for example any locally closed immersion) and `F₀` a mixed perverse sheaf on `X₀`. Define `f_!*F₀ :=`
Im`(pH⁰(Rf_!F₀) → pH⁰(Rf_*F₀))`. If `F₀` has weights `≥ w` (resp. `≤ w`), so does `f_!*F₀`; pure perverse sheaves go to
pure perverse sheaves of the same weight. For a locally closed immersion `j` this is the intermediate extension
`j_!*` of §2.8, without the affineness hypothesis of §5.3.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `f` quasi-finite and separated of
finite type.

Name the resulting statement `quasiFiniteIntermediateExtensionPurity`.

A proof proceeds as follows.

`pH⁰(Rf_!F₀)` has weights `≤ w` when `F₀` does and `pH⁰(Rf_*F₀)` has weights `≥ w` when `F₀` does (§5.6 (c)).

`f_!*F₀` is a quotient of the first and a subobject of the second, so §5.2 gives both bounds (BBD 5.4.3,
following the first proof of 5.3.2).

For an immersion, the image of `pH⁰j_! → pH⁰j_*` is `j_!*` (§2.8, BBD 1.4.22).

Use [BBD-1982] Corollaire 5.4.3, p. 142; Remarque 5.3.3, p. 136.

*Needs:* §5.2; §2.8; §2.6.

**Checks.**


- For `j : 𝔸² ∖ {0} ↪ 𝔸²` (quasi-finite, not affine), `Rj_*ℚ̄_ℓ[2]` is not perverse (it has the cohomology sheaf `δ₀(−2)` in degree 1), but the image of `pH⁰(Rj_!ℚ̄_ℓ[2]) → pH⁰(Rj_*ℚ̄_ℓ[2])` is `j_!*ℚ̄_ℓ[2] = ℚ̄_ℓ[2]`, pure of weight 2.

- For `f` finite (e.g. a normalisation), `f_!* = f_*` is exact and preserves purity.

**Pure complexes split geometrically into shifted intersection complexes.** Let `K₀ ∈ D^b_m(X₀, ℚ̄_ℓ)` be pure
of weight `w`. Then over `𝔽̄_q: (a) K ≅ ⊕_i pH^i(K)[−i]` (a finite sum, isomorphism in `D^b_c(X, ℚ̄_ℓ)`); (b) each
`pH^i(K)` is semisimple, being the pullback of the pure perverse sheaf `pH^i(K₀)` of weight `w + i`; (c)
consequently `K ≅ ⊕_k (i_{V_k*} j_{k!*}(L_k[d_k]))[n_k]` for finitely many smooth connected locally closed `V_k`
of dimension `d_k`, irreducible lisse `L_k` on `V_k` and integers `n_k`. The isomorphism in (a) is not canonical and
need not be compatible with the Frobenius structure of `K₀`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). Purity of the arithmetic complex
`K₀` is required; the conclusion is over `𝔽̄_q` only.

Name the resulting statement `pureComplexGeometricSplitting`.

A proof proceeds as follows.

`pH^i(K₀)` is pure of weight `w + i` (§5.6 (b)), so `pH^i(K₀)[−i]` is pure of weight `w` and `pτ_{<i}K₀` has weights `≤ w, pH^i(K₀)[−i]` weights `≥ w`.

The connecting morphism of `(pτ_{<i}K₀, pτ_{≤i}K₀, pH^i(K₀)[−i])` is a degree-one map from `pH^i(K₀)[−i]` to
`pτ_{<i}K₀`; by §5.2 (b) its image over `𝔽̄_q` is zero, so `pτ_{≤i}K ≅ pτ_{<i}K ⊕ pH^i(K)[−i]`; induct on `i` (BBD
5.4.5).

(b) is §5.5; (c) combines (a), (b) and the classification of simple perverse sheaves (§2.10) (BBD 5.4.6).

Use [BBD-1982] Théorème 5.4.5 and Corollaire 5.4.6, p. 142.

*Needs:* §5.2; §5.5; §2.10; §2.1.

**Checks.**


- For `X₀` smooth projective, `K₀ = Rf_*ℚ̄_ℓ` for `f : X₀ → Spec 𝔽_q` is pure of weight 0 and the splitting is `H*(X, ℚ̄_ℓ) ≅ ⊕_i H^i(X)[−i]`, the elementary decomposition of a complex of vector spaces.

- Arithmetic perverse-cohomology splitting can fail: on `X₀=𝔸¹` set `G₀=ℚ̄_ℓ[1]` and `F₀=δ₀(−1)`. Geometrically `Hom¹(F,G)=ℚ̄_ℓ` with trivial Frobenius and `Hom²(F,G)=0`; `adicFiniteFieldHochschildSerre` gives `Ext²_X₀(F₀,G₀)=ℚ̄_ℓ`. A nonzero class defines `G₀ → K₀ → F₀[−1] → G₀[1]`. Its perverse cohomology has weights 1 in degree 0 and 2 in degree 1, so `K₀` is pure of weight 1. The triangle splits geometrically but not arithmetically. Separately, `E₂` on a point obstructs splitting into arithmetic simple constituents, not splitting into perverse cohomology degrees.

**The decomposition theorem for proper morphisms over finite fields.** Let `f₀ : X₀ → Y₀` be a proper morphism
of separated schemes of finite type over `𝔽_q` and `K₀ ∈ D^b_m(X₀, ℚ̄_ℓ)` pure of weight `w` (for example `K₀ = IC_{X₀}(L₀)` with `L₀` lisse punctually pure of weight `w − dim X₀` on a smooth dense open, or `K₀ = ℚ̄_ℓ[dim X₀]`
for `X₀` smooth). Then: (a) `Rf₀_*K₀` is pure of weight `w` and each `pH^i(Rf₀_*K₀)` is pure of weight `w + i`; (b) over
`𝔽̄_q, Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i]`; (c) each `pH^i(Rf_*K)` is semisimple, a finite sum of `i_{V*}j_!*(L[dim V])`
with `L` irreducible lisse on smooth connected `V ⊂ Y`; (d) for `Y₀` proper over `𝔽_q, H^j(Y, Rf_*K) = H^j(X, K)` is
pure of weight `w + j`. No integral or mod-`ℓ` decomposition, no canonical or Frobenius-compatible splitting, and
no semisimplicity of the arithmetic Frobenius is asserted.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `f₀` proper; `K₀` pure (a pure
arithmetic model is part of the input).

Name the resulting statement `decompositionTheorem`.

A proof proceeds as follows.

(a): proper direct image preserves purity (DeligneWeightsAndPurity §8.12); perverse cohomology of a pure
complex is pure (§5.6 (b)).

(b), (c): apply §5.6 to `Rf₀_*K₀`.

(d): compose with the proper structure map of `Y₀` and use (a) for `Y₀ → Spec 𝔽_q`.

The standard inputs `IC_{X₀}(L₀)` pure of weight `w` come from §5.3.

Use [BBD-1982] Théorèmes 5.4.5–5.4.6, p. 142, with 5.1.14, p. 128; [Deligne-WeilII-1980] (6.2.6), p. 248;
[Zhu-2017] proof of Lemma 2.11, p. 26 (arXiv v3); Appendix A.3.1, pp. 54–55; [Yun-Zhang-2019] §3.5, Corollary
3.29 and (3.36)–(3.38), pp. 443–452.

*Needs:* §5.3; DeligneWeightsAndPurity §8.12.

**Checks.**


- For the blow-up `π : X₀ → 𝔸²_{𝔽_q}` of the origin, `Rπ_*ℚ̄_ℓ[2] ≅ ℚ̄_ℓ[2] ⊕ δ₀(−1)` over `𝔽̄_q`, both summands pure of weight 2 (the exceptional `ℙ¹` contributes `H²(ℙ¹) = ℚ̄_ℓ(−1)` at 0).

- For `f : X₀ → Spec 𝔽_q` proper and `K₀ = IC_{X₀}, (d)` gives purity of intersection cohomology, agreeing with §5.3 (c).

- The finite-type proper models and resolutions over `𝔽̄_q` used by GeometricSatakeAndFusion GS3–GS4 (Zhu, proof of Lemma 2.11) and the proper Hitchin-type maps in EndoscopicTransferAndUnitaryTraceComparison §§3.14a–3.18 are instances, with the purity of their inputs established by the consumer.

- For Zhu’s resolution in §2.1, Lemma 2.11, pp.26–27, use `π_*ℚ̄_ℓ[d] = IC_μ ⊕ C`. The working `IC` shift is `[d]`, as in the main text §2.1.1 p.20; Appendix A.3.1 p.55 prints the dualizing shift `[2d](d)`, the known normalization misprint of the dualizing convention. The perfect-space transport remains a Part II input.

**The decomposition theorem for semismall maps.** Let `X₀` be smooth over `𝔽_q` of pure dimension `n, f₀ : X₀ → Y₀`
proper and surjective, and assume `f` is semismall: `dim(X ×_Y X) ≤ n`. Choose a stratification of `Y₀` into smooth
connected locally closed strata `S₀` (defined over `𝔽_q` after a finite extension) such that each `R^q f_*ℚ̄_ℓ`
restricted to each stratum is lisse; put `d_S := dim f^{−1}(y)` for `y ∈ S`, and call `S` relevant if `dim S + 2 d_S = n`. Then `Rf₀_*ℚ̄_ℓ[n]` is a pure perverse sheaf of weight `n`, and over `𝔽̄_q` there is an isomorphism `Rf_*ℚ̄_ℓ[n] ≅ ⊕_{S relevant} IC_{S̄}(L_S), L_S := (R^{2d_S}f_*ℚ̄_ℓ)|_S`, where `L_S` is the lisse sheaf whose geometric fibre
at `y` is `H^{2d_S}(f^{−1}(y)) ≅ ℚ̄_ℓ(−d_S)^{#(top-dimensional irreducible components of f^{−1}(y))}`. The summand
supported on `S̄` (its `S`-isotypic part for the support decomposition) is canonically determined.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `X₀` smooth of pure dimension `n`;
`f₀` proper surjective and semismall; the stratification makes all `R^q f_*ℚ̄_ℓ` lisse on strata. Choose a finite
algebraic stratification adapted to `f`, with the fibre dimension locally constant on each stratum and the
frontier condition; test semismallness on that stratification. The complex-topological semismall theorem is a
comparison source; the étale statement uses the support estimate, Verdier duality and the scheme decomposition
theorem.

Name the resulting statement `semismallDecomposition`.

A proof proceeds as follows.

`Rf_*ℚ̄_ℓ[n]` is perverse by the smooth-source constant-coefficient semismall criterion (the special case stated
in §2.12; de Cataldo–Migliorini Proposition 4.2.1), and pure of weight `n` by DeligneWeightsAndPurity §8.9 (c)
and DeligneWeightsAndPurity §8.12.

By §5.5, `Rf_*ℚ̄_ℓ[n] = ⊕ IC_{S̄}(M_S)` over `𝔽̄_q`, grouping simple constituents by the stratum of the generic
point of their support, with `M_S` semisimple lisse on `S` (§2.10).

Restrict to a stratum `S`: an `IC_{S̄′}(M_{S′})` with `S ⊂ S̄′ ∖ S′` has `ℋ^j` vanishing on `S` for `j ≥ −dim S` (§2.8
stalk bound), so `ℋ^{−dim S}(Rf_*ℚ̄_ℓ[n])|_S = M_S`.

By proper base change the left side is `R^{n−dim S}f_*ℚ̄_ℓ|_S`, whose fibres are `H^{n−dim S}(f^{−1}(y))`;
semismallness gives `n − dim S ≥ 2 d_S`, so it vanishes unless `S` is relevant, where it is the top cohomology
`H^{2d_S}(f^{−1}(y)) = ℚ̄_ℓ(−d_S)^{#top components}` (§0.4).

The support decomposition of a semisimple perverse sheaf is canonical (the `S`-part is the sum of all simple
subobjects with generic support point in `S`).

Use [deCataldo-Migliorini-2009] Proposition 4.2.1, Definitions 4.2.2–4.2.3, Remark 4.2.4 and Theorem 4.2.7,
pp. 55–57 (arXiv v2); [Zhu-2017] proof of Proposition 2.3, p. 21 (arXiv v3), citing Mirković–Vilonen Lemma
4.3.

*Needs:* §2.12; §5.5; §2.10; §2.8; §0.4; DeligneWeightsAndPurity §8.9; DeligneWeightsAndPurity §8.12.

**Checks.**


- For the blow-up of `𝔸²` at the origin `(n = 2)`: strata `𝔸²∖{0}` (`d = 0`, relevant) and `{0}` (`d = 1, 0 + 2 = 2`, relevant), giving `ℚ̄_ℓ[2] ⊕ δ₀(−1)`, matching §5.6's acceptance example.

- For a small map (all non-dense strata irrelevant) the formula reduces to `Rf_*ℚ̄_ℓ[n] ≅ IC_Y(L)` with `L = f_*ℚ̄_ℓ` on the dense stratum, agreeing with §2.12.

- For the Springer resolution (with characteristic different from 2 in the `SL₂` example) of the nilpotent cone of `SL₂ (n = 2)`, the strata are the regular orbit `(d = 0)` and the origin (`d = 1`, relevant), giving `ℚ̄_ℓ[2] ⊕ δ₀(−1)` as for the `A₁` surface singularity.

### 5.7 Graded Lefschetz objects in an abelian category

Generalize the supplied vector-space primitive decomposition to an abelian category with a coherent Tate twist.

**Graded Lefschetz objects and primitive parts in an abelian category with a Tate twist.** Let A be an abelian
category with an additive autoequivalence `M ↦ M(1)` and powers `M(n), n ∈ ℤ`. A graded Lefschetz object `(L, η)`
consists of objects `L^i ∈` A for `i ∈ ℤ`, zero outside a finite interval, and morphisms `η_i : L^i → L^{i+2}(1)`.
For `r ≥ 0` its iterate `η^r : L^{i} → L^{i+2r}(r)` is `η_{i+2r−2}(r−1) ∘ ⋯ ∘ η_i(0)`, with the canonical
identifications (`a`)`(b) ≅` (a`+b`). `(L, η)` satisfies hard Lefschetz if `η^r : L^{−r} → L^{r}(r)` is an isomorphism
for every `r ≥ 0`. Its primitive part in degree `−r ≤ 0` is the kernel `P^{−r} := ker(η^{r+1} : L^{−r} → L^{r+2}(r+1))`, with its inclusion into `L^{−r}`.

Work with the following additional hypotheses. A abelian; (1) an additive autoequivalence with chosen
coherence isomorphisms (`a`)`(b) ≅` (a `+ b`); in the application `A = Perv(Y₀, ℚ̄_ℓ)` or `Perv(Y, ℚ̄_ℓ)` and (1) is the
Tate twist.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.GradedLefschetz`: Structure: objects `L i (i : ℤ)`, finite support, morphisms `η i : L i ⟶` twist `(L (i+2)) 1`.

- `TauCeti.EtaleDuality.GradedLefschetz.etaPow`: The iterate `η^r : L i ⟶` twist `(L (i + 2r)) r`, defined by recursion on `r` using the twist coherence.

- `TauCeti.EtaleDuality.GradedLefschetz.etaPow_zero`: `η^0` is the identity (up to the coherence isomorphism `(0) ≅ id`).

- `TauCeti.EtaleDuality.GradedLefschetz.etaPow_succ`: `η^{r+1} = (η_{i+2r})(r) ∘ η^r`, after coherence.

- `TauCeti.EtaleDuality.GradedLefschetz.HardLefschetz`: For all `r : ℕ, η^r : L (−r) ⟶` twist `(L r) r` is an isomorphism.

- `TauCeti.EtaleDuality.GradedLefschetz.primitive`: `P^{−r} :=` kernel of `η^{r+1} : L (−r) ⟶` twist `(L (r+2)) (r+1)`, with its inclusion `ι_r`.

- `TauCeti.EtaleDuality.GradedLefschetz.primitive_eq_top`: If `L^{r+2} = 0` then `P^{−r} = L^{−r}`; in particular `P^{−r} = L^{−r}` for `r` at the end of the support.

- `TauCeti.EtaleDuality.GradedLefschetz.map`: Morphisms of graded Lefschetz objects induce maps on primitive parts, compatibly with composition and identities.

A proof proceeds as follows.

The iterate is defined by induction on `r`, composing with the twisted `η` and the coherence isomorphisms; hard
Lefschetz and primitive parts are defined from it with Mathlib's kernels.

Morphisms of graded Lefschetz objects are families of morphisms commuting with `η`; kernels of `η`-iterates are
functorial for them.

Use [BBD-1982] 5.4.10 (set-up before the theorem), p. 144; [deCataldo-Migliorini-2009] Theorem 5.2.1, item 2
(primitive Lefschetz decomposition), pp. 81–82 (arXiv v2).

*Needs:* `CategoryTheory.Abelian`; `CategoryTheory.Limits.kernel`; §2.4.

**Checks.**


- `TauCeti.EtaleDuality.gradedLefschetz_zero_hardLefschetz`: The zero graded object satisfies hard Lefschetz and has zero primitive parts.

- `TauCeti.EtaleDuality.gradedLefschetz_projectiveSpace`: For `L^i = ℚ̄_ℓ(−(n+i)/2)` for `i ≡ n mod 2, |i| ≤ n`, and 0 otherwise (the cohomology of `ℙⁿ` shifted by `n`) with `η` the identity maps, hard Lefschetz holds and `P^{−r} = L^{−n}` if `r = n` and 0 otherwise.

- `TauCeti.EtaleDuality.gradedLefschetz_zero_eta_not_HL`: `L^{−1} = L^{1} = ℚ̄_ℓ` with `η = 0` does not satisfy hard Lefschetz (`η¹ : L^{−1} → L^{1}(1)` is zero).

- `TauCeti.EtaleDuality.gradedLefschetz_vectorSpace_compat`: For `A =` finite-dimensional vector spaces with trivial twist, HardLefschetz agrees with the bijectivity hypothesis of DeligneWeightsAndPurity §9.7 after reindexing `V^j = L^{j−n}`.

- For `A =` finite-dimensional `ℚ̄_ℓ`-vector spaces with trivial twist, `L^i = H^{n+i}(X)` of a smooth projective `n`-dimensional `X` and `η =` cup product with an ample class, this is the data of DeligneWeightsAndPurity §9.1, and `P^{−r}` is the primitive cohomology `P^{n−r}`.

**Primitive decomposition of a graded Lefschetz object satisfying hard Lefschetz.** Let `(L, η)` be a graded
Lefschetz object in an abelian category with Tate twist (§5.7) satisfying hard Lefschetz. Then for every `r ≥ 0`
the map `⊕_{a ≥ 0} P^{−r−2a}(−a) → L^{−r}`, given on the a-th summand by `η^a` composed with the primitive
inclusion and the twist coherence, is an isomorphism (a finite biproduct), and for every `r ≥ 0, L^{r} ≅ L^{−r}(−r)` via `η^r`. Equivalently, in each degree `n` the map from the biproduct of the primitive string columns
`P^{−r}(−a), 0 ≤ a ≤ r, −r + 2a = n`, to `L^n` is an isomorphism.

Work with the following additional hypotheses. Hard Lefschetz for all `r ≥ 0`; `L` of finite support. No splitting
is assumed: the summands are the actual kernels and the maps are actual `η`-powers.

Name the resulting statement `abstractPrimitiveDecomposition`.

A proof proceeds as follows.

For `r ≥ 0, η : L^{−r−2} → L^{−r}(1)` is a monomorphism, since `η^{r+1} ∘ η = η^{r+2}` is an isomorphism on
`L^{−r−2}`.

Make every twist explicit. On `L⁻ʳ` the projection to the nonprimitive summand is `p = η(−1) ∘ (η^(r+2))⁻¹(−1) ∘ η^(r+1)`: the successive objects are `L^(r+2)(r+1), L^(−r−2)(−1), L⁻ʳ`. Hard Lefschetz makes `p` an idempotent
whose image is `η(L^(−r−2)(−1))` and whose kernel is `P⁻ʳ`. The abelian splitting of this idempotent yields `L⁻ʳ ≅ P⁻ʳ ⊕ L^(−r−2)(−1)`. The additive autoequivalence and its inverse preserve kernels and this splitting.

Iterate (induction on the length of the support) to obtain the full string decomposition; positive degrees
follow from the isomorphisms `η^r`.

Use [deCataldo-Migliorini-2009] Theorem 5.2.1, item 2 (primitive Lefschetz decomposition), pp. 81–82 (arXiv
v2); [BBD-1982] Théorème 5.4.10, p. 144.

**Checks.**


- For `ℙ¹ (n = 1): L^{−1} = ℚ̄_ℓ, L^{1} = ℚ̄_ℓ(−1), P^{−1} = L^{−1}`; the decomposition is `L^{−1} = P^{−1}, L^{1} = ηP^{−1}`.

- In the vector-space case the statement is DeligneWeightsAndPurity §9.7 (i)–(ii), including `dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}`.

### 5.8 Universal hyperplanes and relative hard Lefschetz

Extend absolute hard Lefschetz by projective relative hard Lefschetz and categorical primitive summands.

**Perverse cohomology along the universal hyperplane section.** Let `f : X → Y` factor as a closed immersion `X ↪ ℙ^d × Y` followed by the projection, with `η = c₁(𝒪(1))`. Let `Y′ = ℙ^{d∨} × Y, X′ = ℙ^{d∨} × X` with `u : X′ → X`
and `u : Y′ → Y` the projections (smooth of relative dimension `d` with connected fibres), `H ⊂ X′` the universal
hyperplane section, `v : H ↪ X′` and `h : H → Y′` the induced proper map. For `K ∈ pD^{≥0}(X): (i) u^*Rf_*K ≅ Rf′_*u^*K`, hence `(u^*pH^i Rf_*K)[d] ≅ pH^{i+d}(Rf′_*u^*K)`; (ii) for `i < d − 1, pH^i(Rf′_*u^*K) ≅ pH^i(Rh_*(uv)^*K)`; (iii) `pH^{d−1}(Rf′_*u^*K) → pH^{d−1}(Rh_*(uv)^*K)` is injective and identifies the source
with the largest perverse subsheaf of the target that comes from `Y` (is of the form `u^*G[d]`).

Work with the following additional hypotheses. `X, Y` separated of finite type over a field `k` (`k = 𝔽_q` or `𝔽̄_q`),
coefficients `ℚ̄_ℓ`; the factorisation through `ℙ^d × Y` is available locally on `Y` after replacing `η` by a
multiple.

Name the resulting statement `universalHyperplaneLemma`.

A proof proceeds as follows.

`u` is smooth of relative dimension `d` with connected fibres, so `u^*[d]` is `t`-exact and fully faithful on perverse
sheaves, with a largest subobject and a largest quotient coming from `Y` (§2.7, BBD 4.2.4–4.2.6); smooth base
change gives (i).

`u^*K` lies in `pD^{≥d}(X′)`; the projection `g : U := X′ ∖ H → Y′` is affine, so `g_!(u^*K|_U) ∈ pD^{≥d}(Y′)` by left
`t`-exactness of `g_!` (§2.7, BBD 4.1.2); the triangle `(g_!(u^*K|_U), Rf′_*u^*K, Rh_*(uv)^*K)` gives (ii) and the
injectivity in (iii).

For (iii) it remains to compare `pH^{−d}u_*` of the two sides; by the projective-bundle formula (§4.4, BBD
5.4.12) `u_*u^* = ⊕_{i=0}^{d} (−)``[−2i](−i)` and `(uv)_*(uv)^*` has the same summands for `i ≤ d − 1`, and the
fibre-dimension bound gives the needed vanishing (BBD 5.4.13).

Use [BBD-1982] Lemme 5.4.11, Lemme 5.4.12 and 5.4.13, pp. 145–146.

*Needs:* §2.6; §2.7; §4.4; §0.2; §2.4; Layer 2.

**Checks.**


- For `Y` a point and `X = ℙ^d` itself, `H` is the universal hyperplane (incidence variety) and (ii)–(iii) recover the weak Lefschetz statement for hyperplane sections of `ℙ^d` in degrees below `d − 1`.

**Relative hard Lefschetz.** Let `f₀ : X₀ → Y₀` be a projective morphism of separated schemes of finite type
over `𝔽_q` and `η ∈ H²(X₀, ℚ̄_ℓ(1))` the first Chern class of an `f₀`-ample line bundle. Cup product with `η` gives `η : K₀ → K₀``[2](1)` for every `K₀`, hence `η^i : pH^{−i}(Rf₀_*K₀) → pH^{i}(Rf₀_*K₀)(i)`. If `F₀` is a pure perverse
sheaf on `X₀` of weight `w`, then for every `i ≥ 0, η^i : pH^{−i}(Rf₀_*F₀) → pH^{i}(Rf₀_*F₀)(i)` is an isomorphism
of pure perverse sheaves of weight `w − i` on `Y₀` (the same then holds over `𝔽̄_q`). A proper morphism has no
automatic ample class: projectivity and the chosen relatively ample line bundle are hypotheses.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `f₀` projective; the line bundle
is `f₀`-ample; `η` is its Chern class in the adic theory (§1.2, §3.7); `F₀` pure perverse.

Name the resulting statement `relativeHardLefschetzTheorem`.

A proof proceeds as follows.

The question is local on `Y₀`; after shrinking `Y₀` and replacing `η` by a positive multiple (which does not change
bijectivity of `η^i`), `f₀` factors through `ℙ^d × Y₀` with `η = c₁(𝒪(1))`.

Case `i = 1: η` is the composite of restriction `pH^{−1}(Rf_*F) → pH^0(Rh_*((uv)^*F[d−1]))` along the universal
hyperplane and its dual Gysin map back to `pH^1(Rf_*F)(1)` (after `u^*[d]`).

By §5.8, `u^*(pH^{−1}(Rf_*F))[d]` is the largest subobject of `P := pH^0(Rh_*((uv)^*F[d−1]))` coming from `Y`, and dually
`u^*(pH^1(Rf_*F))(1)[d]` is its largest quotient coming from `Y`.

`(uv)^*F₀[d−1]` is pure (smooth pullback), so `Rh_*` of it and `P` are pure (DeligneWeightsAndPurity §8.12, §5.6),
hence `P` is semisimple over `𝔽̄_q` (§5.5); the largest sub coming from `Y` maps isomorphically to the largest such
quotient, so `η` is an isomorphism (BBD 5.4.14).

General `i`: induction on `i`, factoring `u^*[d]` of `η^{i+1}` through `pH^{−i}h_*`, the inductive isomorphism for `h` and
`(uv)^*F[d−1]`, and the dual Gysin map (BBD 5.4.15).

Weights: `pH^{−i}` has weight `w − i` and `pH^{i}(i)` has weight `w + i − 2i = w − i`.

Use [BBD-1982] 5.4.10 (statement), p. 144; proof 5.4.14–5.4.15, pp. 146–147;
[deCataldo-Migliorini-2009] Theorem 3.1.11 and Remark 3.1.12, p. 38 (arXiv v2).

*Needs:* §5.5; §5.6; §1.2; §3.7; §5.7; §2.6; §2.7; §2.5; DeligneWeightsAndPurity §8.12.

**Checks.**


- For `Y₀ = Spec 𝔽_q, X₀` smooth projective of dimension `n` and `F₀ = ℚ̄_ℓ[n]`, the statement is DeligneWeightsAndPurity §9.6: `η^i : H^{n−i}(X, ℚ̄_ℓ) ≅ H^{n+i}(X, ℚ̄_ℓ(i))`.

- For `f₀ = ℙ¹ × Y₀ → Y₀` and `F₀ = ℚ̄_ℓ[1 + dim Y₀]` with `Y₀` smooth: `pH^{−1} = ℚ̄_ℓ[dim Y₀]` and `pH^{1} = ℚ̄_ℓ(−1)[dim Y₀]`, and `η` is the isomorphism given by the class of a point in `H²(ℙ¹)`.

- The ampleness hypothesis matters: for `f : ℙ¹_{𝔽_q} → Spec 𝔽_q` and `F₀ = ℚ̄_ℓ[1]`, the trivial line bundle gives `η = 0`, so `η¹ : pH^{−1} = H⁰(ℙ¹) → pH¹(1) = H²(ℙ¹)(1)` is zero although both sides are `ℚ̄_ℓ`.

**Relative primitive decomposition of perverse cohomology.** In the situation of §5.8, put `P^{−i} := ker(η^{i+1} : pH^{−i}(Rf₀_*F₀) → pH^{i+2}(Rf₀_*F₀)(i+1))` for `i ≥ 0`. Then for every `i ≥ 0, pH^{−i}(Rf₀_*F₀) ≅ ⊕_{a ≥ 0} P^{−i−2a}(−a)` via `η`-powers, in `Perv(Y₀)`; and over `𝔽̄_q, Rf_*F ≅ ⊕_{i ≥ 0} ⊕_{a=0}^{i} P^{−i}(−a)[i − 2a]` (non-canonically for the sum over degrees, by §5.6). Each `P^{−i}` is pure of weight `w − i`.

Work with the following additional hypotheses. As in §5.8.

Name the resulting statement `relativeLefschetzPrimitiveDecomposition`.

A proof proceeds as follows.

The perverse cohomology sheaves with the `η`-maps form a graded Lefschetz object in `Perv(Y₀)` with the Tate twist
(§5.7), which satisfies hard Lefschetz by §5.8.

Apply §5.7 in `Perv(Y₀)`.

Combine with the geometric splitting of §5.6 (b) for the statement on `Rf_*F`; purity of `P^{−i}` by §5.2.

Use [BBD-1982] Théorème 5.4.10, p. 144; [deCataldo-Migliorini-2009] Theorem 5.2.1, item 2, pp. 81–82 (arXiv
v2).

*Needs:* §5.7; §5.6; §5.2.

**Checks.**


- For `f` the structure map of a smooth projective `X₀` of dimension `n` and `F₀ = ℚ̄_ℓ[n], P^{−i}` is primitive cohomology `P^{n−i}(X)`, and the decomposition is the classical Lefschetz decomposition, matching §5.7.

**Hard Lefschetz in intersection cohomology.** Let `X₀` be projective over `𝔽_q` of pure dimension `n, η` the Chern
class of an ample line bundle, and `L₀` a lisse sheaf on a smooth dense open of `X₀`, punctually pure of weight `w`.
Then for every `i ≥ 0`, cup product with `η^i` is an isomorphism `IH^{n−i}(X, L) → IH^{n+i}(X, L)(i)`, where `IH^j(X, L) := H^{j−n}(X, IC_X(L))`, between spaces pure of weight `w + n − i`.

Work with the following additional hypotheses. `X₀` separated of finite type over `𝔽_q` (`q` a power of `p`), `X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p`; coefficients `ℚ̄_ℓ`, realised as the 2-colimit of the rational adic categories `D^b_c(−, E)`
over finite `E/ℚ_ℓ` (§3.1, §3.3); 'perverse' refers to the middle perversity of §2.4 with its `ℓ`-adic form
EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here; mixed complexes and
integer weights are those of DeligneWeightsAndPurity §8.1 and DeligneWeightsAndPurity §8.2 (a sheaf of weights
`≤ w` has `ℋ^i` of punctual weights `≤ w + i`; weights `≥ w` are defined by duality). `X₀` projective; `L₀` punctually
pure (a pure model is required).

Name the resulting statement `intersectionCohomologyHardLefschetz`.

A proof proceeds as follows.

`IC_{X₀}(L₀)` is pure of weight `w + n` (§5.3).

Apply §5.8 to `f₀ : X₀ → Spec 𝔽_q` and `F₀ = IC_{X₀}(L₀)`; perverse cohomology on a point is ordinary cohomology.

Use [BBD-1982] Théorème 5.4.10 with `Y₀` a point, p. 144; 6.2.10, p. 165; [deCataldo-Migliorini-2009] Remark
3.1.12, p. 38 (arXiv v2).

*Needs:* §5.3.

**Checks.**


- For `X₀` smooth projective and `L₀ = ℚ̄_ℓ` this is DeligneWeightsAndPurity §9.6 over `𝔽̄_q`.

- Agreement with Weil II 6.2.13 (DeligneWeightsAndPurity §9.10): put `d=dim X` and `K=IC_X(L)[−d]`. The perverse support bounds for `IC_X(L)` and `DIC_X(L)` give both supplier bounds with parameter `d`, since `DK[−2d]=DIC_X(L)[−d]`. Then `H^j(X,K)=IH^j(X,L)`. Equivalently, the perverse normalization `K=IC_X(L)` uses supplier parameter 0.

- For `X=ℙ¹` and `L=ℚ̄_ℓ`, `IC=ℚ̄_ℓ[1]` and `DIC=ℚ̄_ℓ(1)[1]`. Parameter 1 fails for the perverse IC: `H¹(DIC[−2])` has one-dimensional support, exceeding `1−1=0`. The shifted `K=ℚ̄_ℓ` satisfies both bounds with parameter 1, giving `η:H⁰(X,K)≅H²(X,K)(1)`.

### 5.9 Restricted specialization and geometric origin

**Restricted constructible categories and their specialisation to finite fields.** Let `X` be of finite type
over `ℂ, T` a finite stratification of `X` into smooth connected algebraic strata and, for each `T ∈ T, L(T)` a
finite set of isomorphism classes of irreducible locally constant sheaves of `ℤ/ℓ`-modules on `T`. `D^b_{T,L}(X, ℤ_ℓ)` is the full subcategory of `D^b_c(X, ℤ_ℓ)` of objects for which every `ℋ^q(K⊗^Lℤ/ℓ)|_T` is locally constant
with all constituents in `L(T)`, using the derived reduction of the complex `K`. Choose a finitely generated
`ℤ`-subalgebra `A ⊂ ℂ, S = Spec A`, and a model `(X_S, T_S, L_S)` over `S`, shrunk so that strata are smooth over `S`
with geometrically connected fibres and the relative sheaves `Ext^q(j_!L,j′_!L′)` commute with base change, and
`R^p a_*Ext^q(j_!L,j′_!L′)` are locally constant on `S` and commute with base change, for `a:X_S→S` and the finitely
many pairs under consideration. For a strictly henselian DVR `V` with `A ⊂ V ⊂ ℂ` whose residue field `s̄` is an
algebraic closure of a finite residue field of `A`, the restriction functors `D^b_{T,L}(X, ℤ_ℓ) ← D^b_{T,L}(X_V, ℤ_ℓ) → D^b_{T,L}(X_s̄, ℤ_ℓ)` are equivalences; the induced system of equivalences `D^b_{T,L}(X, ℤ_ℓ) ≃ D^b_{T,L}(X_s̄, ℤ_ℓ)`, as a germ along the filter of such `V`, depends only on `(X, T, L)`. After refining `(T, L)`
and shrinking `S`, the equivalences respect any given finite list of the operations `Rf_*, Rf_!, f^*, Rf^!, ⊗, RHom`, the perverse `t`-structure (when the `R^q j_*L|_{T′}` are lisse with constituents in `L(T′)`), and rank,
lissity and monodromy of sheaves on strata; they extend to `ℚ_ℓ, E_λ` and `ℚ̄_ℓ` coefficients. There is no
equivalence of the full categories `D^b_c(X, ℤ_ℓ) ≃ D^b_c(X_s̄, ℤ_ℓ)`.

Work with the following additional hypotheses. `X` separated of finite type over `ℂ`; complex coefficients for the
analytic statements and `ℚ̄_ℓ` coefficients for the étale ones, related by a chosen field isomorphism `ℂ ≅ ℚ̄_ℓ`
and by the étale/analytic comparison of §3.5; strata are algebraic. Only finitely many operations and objects
are transported at a time; refinements change the germ only by restriction.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.RestrictedCategory`: For a stratification `T` and finite sets `L(T)` of irreducible `ℤ/ℓ`-local systems, the full subcategory of `D^b_c(X, ℤ_ℓ)` whose residual cohomology on each stratum has constituents in `L(T)`.

- `TauCeti.EtaleDuality.RestrictedCategory.mem_iff`: `K` lies in the restricted category iff for every `q` and `T, ℋ^q(K ⊗^L ℤ/ℓ)|_T` is locally constant with all Jordan–Hölder constituents in `L(T)`.

- `TauCeti.EtaleDuality.RestrictedCategory.triangulated`: The restricted category is a triangulated subcategory, closed under isomorphism, shifts and cones.

- `TauCeti.EtaleDuality.GoodModel`: A finitely generated `A ⊂ ℂ` and a model `(X_S, T_S, L_S)` satisfying the smoothness, geometric connectedness and `Ext`-base-change conditions of BBD 6.1.8.

- `TauCeti.EtaleDuality.specializationEquiv`: For a good model and a strictly henselian `V` as in BBD 6.1.8, the equivalence `D_{T,L}(X, ℤ_ℓ) ≃ D_{T,L}(X_s̄, ℤ_ℓ)` through `D_{T,L}(X_V, ℤ_ℓ)`.

- `TauCeti.EtaleDuality.specializationEquiv_perverse`: If the `R^q j_*L|_{T′}` are lisse with constituents in `L(T′)`, the equivalence is `t`-exact for the perverse `t`-structures.

- `TauCeti.EtaleDuality.specializationEquiv_comm`: For one of `Rf_*, Rf_!, f^*, Rf^!, ⊗, RHom` and suitable refinements of `(T, L)` on source and target, the equivalences commute with it after shrinking `S`.

- `TauCeti.EtaleDuality.specializationEquiv_rational`: The equivalences extend to `ℚ_ℓ, E` and `ℚ̄_ℓ` coefficients by inverting `ℓ` and taking 2-colimits.

A proof proceeds as follows.

For `ℤ/ℓⁿ` coefficients the equivalences are formal from the identification of the `H^p(−, Ext^q(F, G))` on `X, X_V`
and `X_s̄` for `F, G` of the form `j_!L` (smooth and proper base change on the chosen model, generic base change,
SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above geometric spreading out and
EtaleCohomologyFoundations §§F.0–F.6 cohomological base change) (BBD 6.1.9).

Finite `Tor` dimension is preserved, and the `ℓ`-adic statement follows from the definition of `ℓ`-adic derived
categories as normalized systems (§3.1, §3.1).

Compatibility with operations and with the perverse `t`-structure: enlarge `(T, L)` so that the operations send
the restricted categories into restricted categories, then shrink `S` so that base change holds (BBD 6.1.10,
using EGA IV §§8–9 spreading-out lists, 6.1.7).

Over `ℂ`, the étale category is compared with the analytic one by §3.5.

Use [BBD-1982] 6.1.8, Lemme 6.1.9 and 6.1.10, pp. 155–159.

*Needs:* §3.5; §3.1; §2.4; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above;
SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- `TauCeti.EtaleDuality.restrictedCategory_point`: On a geometric point with `L={𝔽_ℓ}`, every bounded constructible `ℤ_ℓ`-complex belongs to the category, including `ℓ`-torsion complexes; the same description holds after specialization.

- `TauCeti.EtaleDuality.restrictedCategory_empty_L`: If every `L(T)` is empty, derived reduction has zero cohomology on every stratum. Derived completeness and Nakayama force the object itself to be zero.

- `TauCeti.EtaleDuality.restrictedCategory_excluded_character`: On `𝔾_m` with `ℓ` odd and `L` consisting only of the trivial residual rank-one sheaf, the rank-one character of order 2 is excluded; adjoining its residual character includes it. A definition using only lissity or rank would fail this test.

- `TauCeti.EtaleDuality.restrictedCategory_mono`: Enlarging the families `L(T)` enlarges the restricted category; refinements of `(T, L)` therefore induce the restriction maps of germs used in BBD 6.1.10.

- For `X = a` point, `T = {X}` and `L = {𝔽_ℓ}, D^b_{T,L}(X, ℤ_ℓ)` is the category of perfect `ℤ_ℓ`-complexes, identical over `ℂ` and over `s̄`. For `X = ℙ¹_ℂ` with one stratum and `L = {𝔽_ℓ}`, specialisation sends the constant `ℤ_ℓ`-object on `ℙ¹` to the constant object on `ℙ¹_{s̄}`. Commutation with pushforward along the structural maps identifies their global cohomology: `H⁰ = ℤ_ℓ, H² = ℤ_ℓ(−1)`, and all other degrees vanish. These pushforwards are objects on the respective base points.

- A non-quasi-unipotent `ℤ_ℓ`-local system on `𝔾_m` still belongs to a restricted category: its finite-dimensional mod-`ℓ` representation has finitely many irreducible constituents, which can be chosen as `L(T)`. BBD 6.1.8 warns that the entire `ℓ`-adic sheaf need not descend to a finitely generated field; the restricted-category specialization germ does not assert such descent.

**Perverse sheaves and complexes of geometric origin.** For schemes `X` of finite type over `ℂ`, the class of
simple perverse sheaves of complex vector spaces of geometric origin is the smallest class (a) containing the
constant sheaf `ℂ` on a point and (b) closed under taking the simple constituents of `pH^i T(F)` for `T` one of
`Rf_*, Rf_!, f^*, Rf^!` (`f` a morphism of schemes of finite type over `ℂ`), and (c) closed under taking the simple
constituents of `pH^i(A ⊗ B)` and `pH^i RHom(A, B)` for `A, B` with constituents in the class. A perverse sheaf is
semisimple of geometric origin if it is a finite direct sum of simple ones of geometric origin; a complex `K ∈ D^b_c(X(ℂ), ℂ)` is semisimple of geometric origin if `K ≅ ⊕_i pH^i(K)[−i]` and each `pH^i(K)` is semisimple of
geometric origin.

Work with the following additional hypotheses. `X` separated of finite type over `ℂ`; complex coefficients for the
analytic statements and `ℚ̄_ℓ` coefficients for the étale ones, related by a chosen field isomorphism `ℂ ≅ ℚ̄_ℓ`
and by the étale/analytic comparison of §3.5; strata are algebraic. The definition is inductive over all
schemes of finite type over `ℂ`; constituents are simple subquotients in the analytic perverse heart.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.GeometricOrigin`: The inductive predicate on simple analytic perverse sheaves defined by (a)–(c).

- `TauCeti.EtaleDuality.GeometricOrigin.const_point`: The constant sheaf `ℂ` on `Spec ℂ` is of geometric origin.

- `TauCeti.EtaleDuality.GeometricOrigin.of_constituent`: A simple constituent of `pH^i T(F)` with `F` of geometric origin and `T ∈ {Rf_*, Rf_!, f^*, Rf^!}` is of geometric origin; likewise for `⊗` and `RHom`.

- `TauCeti.EtaleDuality.GeometricOrigin.simple`: Every perverse sheaf of geometric origin is simple.

- `TauCeti.EtaleDuality.IsSemisimpleGeometricOrigin`: `K ≅ ⊕_i pH^i(K)[−i]` with each `pH^i(K)` a finite sum of simple perverse sheaves of geometric origin.

- `TauCeti.EtaleDuality.IsSemisimpleGeometricOrigin.ic_finite_monodromy`: `j_!*(L[d])` is semisimple of geometric origin when `L` has finite monodromy.

- `TauCeti.EtaleDuality.IsSemisimpleGeometricOrigin.shift`: Stable under shifts and finite direct sums.

A proof proceeds as follows.

The class exists as the intersection of all classes with properties (a)–(c).

The full subcategories of `D^b_c(X(ℂ), ℂ)` of objects whose perverse cohomology constituents are of geometric
origin are stable under `f_*, f_!, f^*, f^!, ⊗` and `RHom` by construction (BBD 6.2.4).

Use [BBD-1982] 6.2.4, pp. 162–163.

*Needs:* §3.5; §2.10; §2.1; §5.5.

**Checks.**


- `TauCeti.EtaleDuality.geometricOrigin_constant_smooth`: For `X` smooth connected of dimension `d` over `ℂ, ℂ_X[d]` is of geometric origin (it is `pH^d(f^*ℂ)` for `f : X →` point).

- `TauCeti.EtaleDuality.isSemisimpleGeometricOrigin_zero`: The zero complex is semisimple of geometric origin (the empty sum).

- `TauCeti.EtaleDuality.not_isSemisimpleGeometricOrigin_jstar`: For `j : ℂ^× ↪ ℂ`, the perverse sheaf `Rj_*ℂ[1]` has constituents `ℂ_ℂ[1]` and `ℂ_0`, both of geometric origin, but it is a non-split extension of `ℂ_0` by `ℂ_ℂ[1]`, so it is not semisimple of geometric origin.

- For `j : U ↪ X` an open immersion with `U` smooth connected of dimension `d` and `L` a local system with finite monodromy on `U, j_!*(L[d])` is semisimple of geometric origin, since `L` is a direct summand of `π_*ℂ` for a finite étale cover `π`.

**Simple perverse sheaves of geometric origin specialise to pure sheaves over finite fields.** Let `F` be a
simple perverse `ℚ̄_ℓ`-sheaf of geometric origin on `X` over `ℂ` (transported from `ℂ` to `ℚ̄_ℓ` coefficients by a field
isomorphism and §3.5). For `S = Spec A, A ⊂ ℂ` finitely generated over `ℤ` and large enough, each specialisation
equivalence of §5.9 sends `F` to a simple perverse sheaf `F_s̄` on `X_s̄` satisfying `(P): X_s̄` comes by extension of
scalars from some `X₀` over a finite field `𝔽_q` and `F_s̄` from a pure perverse sheaf `F₀` on `X₀`.

Work with the following additional hypotheses. `X` separated of finite type over `ℂ`; complex coefficients for the
analytic statements and `ℚ̄_ℓ` coefficients for the étale ones, related by a chosen field isomorphism `ℂ ≅ ℚ̄_ℓ`
and by the étale/analytic comparison of §3.5; strata are algebraic. The model, the finite field and the pure
`F₀` are part of the output (a witness), not assumptions; purity is a conclusion.

Name the resulting statement `pureSpecializationOfGeometricOrigin`.

A proof proceeds as follows.

Simplicity is preserved by the specialisation equivalences (§5.9, perverse `t`-exactness).

By the inductive definition (§5.9) it suffices that `(P)` holds for `ℚ̄_ℓ` on a point and is stable under the
generating operations, which commute with the equivalences after refining and shrinking.

The generating operations preserve mixedness and perverse cohomology of their finite-field models. Their
arithmetic simple constituents are pure. A geometric simple constituent need not itself be the pullback of an
arithmetic simple object over the original finite field: use the finite-extension/geometrically-simple
classification of BBD 5.3.9(ii), recorded in §5.5, to realize it by a pure model over a finite extension. This
is the property used in BBD 6.2.6.

Use [BBD-1982] Lemme 6.2.6 and its proof, pp. 163–164.

*Needs:* §5.1; §5.3; §5.5; DeligneWeightsAndPurity §8.5; DeligneWeightsAndPurity §8.20.

**Checks.**


- For `F = ℂ_X[d]` with `X` smooth over `ℂ, F₀` can be taken to be `ℚ̄_ℓ[d]` on a smooth model `X₀`, pure of weight `d`.

### 5.10 Decomposition and relative Lefschetz over the complex numbers

**The decomposition theorem over `ℂ`.** Let `f : X → Y` be a proper morphism of schemes of finite type over `ℂ`. If
`K ∈ D^b_c(X(ℂ), ℂ)` is semisimple of geometric origin, then `Rf_*K` is semisimple of geometric origin: `Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i]` and each `pH^i(Rf_*K)` is a finite direct sum of simple perverse sheaves of geometric
origin. The same holds with `ℂ` replaced by `ℚ̄_ℓ` in the étale topology. In particular, for `X` smooth (resp. any `X`
and `L` of geometric origin), `Rf_*ℂ_X[dim X]` (resp. `Rf_*IC_X(L)`) decomposes in this way. No `ℚ`- or `ℚ_ℓ`-rational
descent of the splitting is asserted.

Work with the following additional hypotheses. `X` separated of finite type over `ℂ`; complex coefficients for the
analytic statements and `ℚ̄_ℓ` coefficients for the étale ones, related by a chosen field isomorphism `ℂ ≅ ℚ̄_ℓ`
and by the étale/analytic comparison of §3.5; strata are algebraic. `K` semisimple of geometric origin; complex
(or `ℚ̄_ℓ`) coefficients.

Name the resulting statement `decompositionTheoremComplex`.

A proof proceeds as follows.

Reduce to `K = F` simple perverse of geometric origin (finite sums and shifts).

Choose `S` large and specialise (§5.9): `F_s̄` comes from a pure `F₀` on `X₀` over `𝔽_q`, and `f`, refined `(T, L)` on `Y` and
the operation `Rf_*` are compatible with the equivalences (§5.9).

Over `𝔽̄_q, Rf_*F_s̄` splits as `⊕ pH^i[−i]` with semisimple `pH^i` (§5.6); transport back through the equivalences
to get the statement for `Rf_*F`; the constituents are of geometric origin by definition (BBD 6.2.7).

Use [BBD-1982] Théorème 6.2.5 and its proof 6.2.7, pp. 163–164; [deCataldo-Migliorini-2009] Theorem 1.6.1, pp.
13–14 (arXiv v2).

*Needs:* §5.9; §5.6; §3.5.

**Checks.**


- For the blow-up `π` of `ℂ²` at `0, Rπ_*ℂ[2] ≅ ℂ[2] ⊕ ℂ_0` (the complex counterpart of the `𝔽_q` example of §5.6).

- For `f : X →` point with `X` projective, the theorem gives `H*(X, IC_X)` as a graded vector space, the content being the existence of the `IC` formalism rather than splitting.

**Relative hard Lefschetz over `ℂ`.** Let `f : X → Y` be a projective morphism of schemes of finite type over `ℂ, η`
the first Chern class of a relatively ample line bundle, and `F` a semisimple perverse sheaf of geometric origin
on `X`. Then for every `i ≥ 0, η^i : pH^{−i}(Rf_*F) → pH^{i}(Rf_*F)` is an isomorphism (Tate twists trivialised by
the choice of `2πi`). For `Y` a point this is hard Lefschetz in intersection cohomology of complex projective
varieties.

Work with the following additional hypotheses. `X` separated of finite type over `ℂ`; complex coefficients for the
analytic statements and `ℚ̄_ℓ` coefficients for the étale ones, related by a chosen field isomorphism `ℂ ≅ ℚ̄_ℓ`
and by the étale/analytic comparison of §3.5; strata are algebraic. `f` projective with a chosen relatively
ample line bundle; `F` semisimple of geometric origin.

Name the resulting statement `relativeHardLefschetzComplex`.

A proof proceeds as follows.

Write the semisimple `F` as a finite direct sum of simple geometric-origin constituents. Specialize each
constituent to a pure finite-field model, after one common refinement, shrinking and finite residue-field
extension that also models `f` and `η`. Different constituents may have different weights, so the sum is not
asserted to be pure of one weight. Apply the finite-field theorem separately and take the direct sum.

Apply §5.8 over `𝔽_q` and transport back (BBD 6.2.10).

Use [BBD-1982] Théorème 6.2.10, p. 165.

*Needs:* §5.9; §5.8; §3.7.

**Checks.**


- For `X` smooth projective over `ℂ` and `F = ℂ[dim X], Y` a point: `η^i : H^{n−i}(X, ℂ) ≅ H^{n+i}(X, ℂ)`, the classical hard Lefschetz theorem.

### Examples

A nontrivial arithmetic unipotent Jordan extension of the unit object is pure but fails arithmetic semisimplicity; its geometric pullback splits. Relative hard Lefschetz is an isomorphism of perverse sheaves carrying the stated Tate twist, whereas the decomposition splitting is geometric and generally noncanonical. The zero Lefschetz object has zero primitive parts in every degree.

### Dependencies

Layers 0–4; DeligneWeightsAndPurity §§0, 5–8 and 9.6–9.12; the arithmetic-model and generic-base-change contracts; Mathlib finite-length abelian-category and kernel/biproduct APIs.

## Layer 6: cohomological correspondences and contracting trace formulas

### 6.1 Scheme correspondences and their fixed schemes

**Correspondences of schemes and their morphisms.** A correspondence from `X₁` to `X₂` is a morphism `c = (c₁, c₂) : C → X₁ × X₂` of schemes separated of finite type over `k`. A morphism from `c : C → X₁ × X₂` to `b : B → Y₁ × Y₂`
is a triple `[f] = (f₁, f♮, f₂)` with `b₁f♮ = f₁c₁` and `b₂f♮ = f₂c₂`. `[f]` is proper (resp. an open or closed
embedding) when `f₁, f♮` and `f₂` are. A self-correspondence is `c : C → X × X`; its fixed-point scheme is `Fix(c) := C ×_{X×X} X` (fibre product with the diagonal `Δ`), with `Δ′ : Fix(c) → C` and `c′ : Fix(c) → X`. A compactification
of `c` is a correspondence `c̄ : C̄ → X̄₁ × X̄₂` with `C̄, X̄₁` and `X̄₂` proper over `k` with a dominant open embedding
`[j] : c → c̄`; every pair of compactifications of `X₁, X₂` extends to one of `c`.

Work with the following additional hypotheses. Schemes separated of finite type over a field `k`; fibre products
are the native scheme fibre products.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.Correspondence`: Structure: a scheme `C` with morphisms `c₁ : C ⟶ X₁, c₂ : C ⟶ X₂` over `Spec k`.

- `TauCeti.EtaleDuality.Correspondence.Hom`: Morphisms `(f₁, f♮, f₂)` with the two commuting squares.

- `TauCeti.EtaleDuality.Correspondence.Hom.IsProper`: A morphism is proper when `f₁, f♮` and `f₂` are proper.

- `TauCeti.EtaleDuality.Correspondence.fix`: `Fix(c) :=` pullback of `(c₁, c₂) : C ⟶ X ×_k X` along the diagonal, with `Δ′` and `c′`.

- `TauCeti.EtaleDuality.Correspondence.graph`: The graph-type correspondence `(g, id) : X ⟶ X ×_k X` of a morphism `g : X ⟶ X (c₁ = g, c₂ = id)`, the convention used for cohomological correspondences.

- `TauCeti.EtaleDuality.Correspondence.fix_graph`: `Fix`(graph `g`) is the equaliser of `id` and `g`.

- `TauCeti.EtaleDuality.Correspondence.Hom.comp`: Componentwise composition, associative and unital.

- `TauCeti.EtaleDuality.Correspondence.compactify_preserving_invariance`: For a self-correspondence `c` and open `U⊂X`, assume `c₁⁻¹U` is dense in `C, c₁:c₁⁻¹U→U` is proper, and `X∖U` is locally `c`-invariant. There is a proper compactification `c̄` with `X̄∖U` locally `c̄`-invariant (Varshavsky Lemma 1.5.4). This is the compactification used by the Fujiwara–Varshavsky formula.

A proof proceeds as follows.

Composition of morphisms of correspondences is componentwise; Fix is functorial for morphisms of
self-correspondences with `f₁ = f₂`.

Existence of compactifications: compactify `C` by Nagata and take the closure of `C` in `C′ × X̄₁ × X̄₂` (Varshavsky
1.1.3).

For the invariance-preserving compactification, use the properness over `U` to control the closure of the first
leg. Blow up the boundary locus to separate the closures that would violate local invariance, and replace the
compactification by the proper transform; this is the construction in Varshavsky Lemma 1.5.4, pp.14–15. Use
EtaleCohomologyFoundations §§G.1–G.3 for Nagata compactification and common refinements, and
SchemeAndStackFoundations §4.11 with StableReduction Layer 4 for blow-ups and strict transforms.

Use [Varshavsky-LV-2007] Definition 1.1.1, Notation 1.1.2, Remark 1.1.3, pp. 6–7; Notation 1.2.1, p. 8 (arXiv
v2).

*Needs:* `AlgebraicGeometry.Scheme`; `CategoryTheory.Limits.pullback`; `AlgebraicGeometry.IsProper`;
`AlgebraicGeometry.IsSeparated`; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- `TauCeti.EtaleDuality.fix_graph_id_point`: For `X = Spec k` and `g = id, Fix`(graph `g`) `= Spec k`.

- `TauCeti.EtaleDuality.fix_graph_frobenius_count`: For `X₀` over `𝔽_q` and `g` the `q`-power Frobenius of `X = X₀ ⊗ 𝔽̄_q, Fix`(graph `g`) is the reduced finite scheme of points of `X₀(𝔽_q)`.

- `TauCeti.EtaleDuality.fix_transpose`: `Fix(c^t)` is canonically isomorphic to `Fix(c)`.

- `TauCeti.EtaleDuality.fix_graph_affine_line_translation`: Translation `x ↦ x + 1` on `𝔸¹` has empty fixed-point scheme over every field, although in characteristic `p` it is an automorphism of finite order `p`: a finite-order automorphism need not have fixed points.

- The graph-type correspondence `(g, id) : X → X × X` of an endomorphism `g` has Fix equal to the fixed-point scheme `X^g`.

- The transpose `c^t = (c₂, c₁)` has `Fix(c^t) ≅ Fix(c)`.

### 6.2 Cohomological correspondences, pushforward and composition

**Cohomological correspondences.** Let `c : C → X₁ × X₂` be a correspondence, `F₁ ∈ D^b_ctf(X₁, Λ)` and `F₂ ∈ D^b_ctf(X₂, Λ)`. A cohomological correspondence lifting `c` (a `c`-morphism) from `F₁` to `F₂` is a morphism `u : c₁^*F₁ → c₂^!F₂` in `D(C, Λ)`; equivalently, by the adjunction `c₂_! ⊣ c₂^!`, a morphism `c₂_!c₁^*F₁ → F₂`. `Hom_c(F₁, F₂) := Hom(c₁^*F₁, c₂^!F₂)`. Convention: pull back along the first leg and apply the exceptional inverse image along
the second; the leg convention's `c₂^*K → c₁^!K` is the same notion with the legs named in the opposite order.
For an endomorphism `g : X → X`, the graph-type correspondence is `(g, id) : X → X × X (c₁ = g, c₂ = id)`, whose
`c`-morphisms are the maps `u : g^*F → F`.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.CohCorr`: For `c` : Correspondence `X₁ X₂` and `F₁, F₂`, the type of morphisms `c₁^*F₁ ⟶ c₂^!F₂`.

- `TauCeti.EtaleDuality.CohCorr.adjointEquiv`: CohCorr `c F₁ F₂ ≃ (c₂_!c₁^*F₁ ⟶ F₂)`, natural in `F₁` and `F₂`.

- `TauCeti.EtaleDuality.CohCorr.ofId`: For the identity correspondence of `X`, CohCorr `≃ Hom(F₁, F₂)`.

- `TauCeti.EtaleDuality.CohCorr.ofGraph`: For the graph-type correspondence `(g, id)`, CohCorr `≃ Hom(g^*F, F)`.

- `TauCeti.EtaleDuality.CohCorr.module`: CohCorr `c F₁ F₂` is `a Λ`-module, and precomposition/postcomposition with morphisms of `F₁, F₂` are `Λ`-linear.

- `TauCeti.EtaleDuality.CohCorr.transport`: An isomorphism of correspondences (support isomorphism compatible with both legs) transports `c`-morphisms through the canonical identifications of pullbacks and exceptional pullbacks; two `c`-morphisms are equal iff their transports are.

A proof proceeds as follows.

The adjunction `c₂_! ⊣ c₂^!` is EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; it identifies the
two descriptions naturally in `F₁, F₂`.

For `c` the identity correspondence of `X, Hom_c(F₁, F₂) = Hom(F₁, F₂)` (since `id^! = id`).

Use [Varshavsky-LV-2007] Definition 1.1.4 and Remark 1.1.5, p. 7 (arXiv v2); [Lu-Zheng-2022] §2.2,
Construction 2.6, p. 13 (arXiv v4).

*Needs:* §6.1; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations
§§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- `TauCeti.EtaleDuality.cohCorr_point`: For `X₁ = X₂ = C = Spec k`, CohCorr `≃ Hom(F₁, F₂)` in `D(Λ)`.

- `TauCeti.EtaleDuality.cohCorr_graph_weil`: For `X₀` over `𝔽_q` and `F₀` a Weil sheaf, the Weil isomorphism `Fr^*F ≅ F` is a `c`-morphism for the graph-type correspondence of Frobenius on `X`.

- `TauCeti.EtaleDuality.cohCorr_adjoint_compat`: adjointEquiv agrees with §0.2's adjunction `c₂_! ⊣ c₂^!` (its unit and counit).

- `TauCeti.EtaleDuality.cohCorr_not_pushforward_of_endomorphism`: For reversed legs `c=(id,g)`, a `c`-morphism is `F→g^!F`. Even when `g` is étale this is `F→g^*F`, whereas the graph convention gives `g^*F→F`. The domains and codomains differ; étaleness does not reverse a morphism.

- For `c = (g, id)` the graph-type correspondence of an endomorphism `g`, a `c`-morphism is a map `u : g^*F → F`; for `g` the Frobenius of `X₀ ⊗ 𝔽̄_q`, the Weil structure `Fr^*F ≅ F` of a sheaf on `X₀` is one.

- For `X₁ = X₂ = C = Spec k`, a `c`-morphism is a morphism of perfect `Λ`-complexes `F₁ → F₂`.

**Pushforward of cohomological correspondences and the induced map on compactly supported cohomology.** Let
`[f] = (f₁, f♮, f₂) : c → b` be a morphism of correspondences satisfying one of: (i) the square `(c₁, f♮, f₁, b₁)`
is cartesian; (ii) `f₁` and `f♮` are proper; (iii) `c₁` and `b₁` are proper. Then there is a base change morphism BC :
`b₁^*f₁_! → f♮_!c₁^*` (the standard one in (`i`), (ii); in (iii) adjoint to `f₁_! → f₁_!c₁_*c₁^* = b₁_*f♮_!c₁^*`),
and every `c`-morphism `u : c₂_!c₁^*F₁ → F₂` yields a `b`-morphism `[f]_!(u) : b₂_!b₁^*(f₁_!F₁) → b₂_!f♮_!c₁^*F₁ = f₂_!c₂_!c₁^*F₁ → f₂_!F₂`. Pushforwards compose: `([g] ∘ [f])_! = [g]_! ∘ [f]_!` when both satisfy the same
condition. For `c₁` proper, the structure morphism to the trivial correspondence gives `RΓ_c(u) : RΓ_c(X₁, F₁) → RΓ_c(X₂, F₂)`, explicitly `RΓ_c(X₁, F₁) → RΓ_c(C, c₁^*F₁) = RΓ_c(X₂, c₂_!c₁^*F₁) → RΓ_c(X₂, F₂)`, and `RΓ_c(u)` is
unchanged under compactification.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. One of the three admissibility conditions (i)–(iii) for `[f]`; for `RΓ_c(u), c₁` proper.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.CohCorr.pushforward`: For an admissible `[f] : c ⟶ b`, the map CohCorr `c F₁ F₂ →` CohCorr `b (f₁_!F₁) (f₂_!F₂)`.

- `TauCeti.EtaleDuality.CohCorr.pushforward_comp`: `([g] ∘ [f])_! = [g]_! ∘ [f]_!` for morphisms admissible for the same condition.

- `TauCeti.EtaleDuality.CohCorr.pushforward_id`: The identity morphism of correspondences induces the identity.

- `TauCeti.EtaleDuality.CohCorr.rgammac`: For `c₁` proper, `RΓ_c(u) : RΓ_c(X₁, F₁) ⟶ RΓ_c(X₂, F₂)`.

- `TauCeti.EtaleDuality.CohCorr.rgammac_compactification`: `RΓ_c(u)` agrees with `RΓ_c` of the extension of `u` to a compactification under `RΓ_c(X_i, F_i) ≅ RΓ_c(X̄_i, j_i!F_i)`.

- `TauCeti.EtaleDuality.CohCorr.rgammac_graph`: For the graph-type correspondence of proper `g, RΓ_c(u) = H(u) ∘ g^*` on `RΓ_c(X, F)`.

A proof proceeds as follows.

In case (i) use cartesian base change for compact pushforward `Rf_!`, which does not require `f` to be proper. In
case (ii) the commutative square need not be cartesian: use the ordinary exchange `b₁^*Rf₁_* → Rf♮_*c₁^*`,
obtained by adjunction, and identify `Rf₁_!` with `Rf₁_*` and `Rf♮_!` with `Rf♮_*` using their properness. This
exchange need not be an isomorphism. In case (iii), with `c₁` proper, use the adjoint composite and `c₁_! = c₁_*`
(Varshavsky 1.1.6(a)).

Compatibility with composition reduces to the compatibility of base change morphisms with composition
(Varshavsky 1.1.6(b)).

`RΓ_c(u) := [π]_!(u)` for the structure morphism, which satisfies (iii); independence of compactification by
1.1.6(`b`) (Varshavsky 1.1.7).

Use [Varshavsky-LV-2007] 1.1.6 (a)–(b) and 1.1.7 (a)–(c), pp. 7–8 (arXiv v2).

*Needs:* EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §F.5;
EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `TauCeti.EtaleDuality.pushforward_trivial`: Pushing forward along the identity morphism of the trivial correspondence over `Spec k` is the identity on `Hom(F₁, F₂)`.

- `TauCeti.EtaleDuality.rgammac_graph_finite_set`: For `X = ⊔_{i∈I} Spec k` finite, `g` a self-map `σ` of `I` and `F =` constant `M, RΓ_c(u)` is the endomorphism `(x_i) ↦ (u_i(x_{σ(i)}))` of `M^I`.

- `TauCeti.EtaleDuality.rgammac_frobenius_compat`: For `X₀` over `𝔽_q, F₀` a Weil complex and `u` its Frobenius structure on the graph of Frobenius, `RΓ_c(u)` is the geometric Frobenius endomorphism of `RΓ_c(X, F)` of EtaleCohomologyFoundations §§F.10.2–F.10.2b.

- For `c` the graph-type correspondence of `g : X → X` proper and `u : g^*F → F, RΓ_c(u)` is the endomorphism of `RΓ_c(X, F)` induced by `g` and `u` (pull back along `g`, then `u`).

- For the trivial correspondence over `Spec k, [π]_!` is the identity.

**Pullback, open restriction and restriction to invariant closed subsets.** (a) Pullback: if `[f] : c → b` has
its right square cartesian up to nilpotents, or `f♮` and `f₂` étale, there is BC : `c₂_!f♮^* → f₂^*b₂_!`, and a
`b`-morphism `u` gives a `c`-morphism `[f]^*(u) : c₂_!c₁^*(f₁^*F₁) → f₂^*F₂`. (b) Open restriction: for a
self-correspondence `c` and open `W ⊂ C, U ⊂ X, u` restricts to `u|_W` and to `u|_U` on `c|_U : c₁^{−1}(U) ∩ c₂^{−1}(U) → U × U`. (c) A closed `Z ⊂ X` is `c`-invariant if `c₁(c₂^{−1}(Z)) ⊂ Z` set-theoretically, and locally `c`-invariant if
each `z ∈ Z` has an open neighbourhood `U` with `Z ∩ U c|_U`-invariant; for `c`-invariant `Z, c|_Z : c₂^{−1}(Z)_red → Z × Z` and `u` restricts to `u|_Z`; in general one first restricts to the largest open `W(Z) ⊂ C` over which `Z` is
invariant. (d) If `c₂` is quasi-finite and `x` is a closed point, `Fix(c|_x)` is finite and for `y ∈ Fix(c|_x)` the
restriction `u_y : F_x → F_x` is the summand of `(c₂_!c₁^*F)_x → F_x` at `y`; `Tr(u_y)` is the naive local term.

For schematically invariant `Z`, put `C_Z := c⁻¹(Z×Z) = c₂⁻¹Z` and form the full scheme restriction
`c|Z:C_Z→Z×Z`, with cohomological restriction `u|Z` given by the cartesian
right square. The reduction `r:(C_Z)_red→C_Z` identifies `c|_Z` with the reduced support of `c|Z`.
Under the canonical identification `r^*≅r^!`, the pullback of `u|Z` is `u|_Z`.
Normal cones and Artin fixed components in Layer 7 use `c|Z` and
`u|Z`, retaining their full scheme carriers.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.CohCorr.pullbackAlong`: For `[f]` with right square cartesian up to nilpotents or `f♮, f₂` étale, the map CohCorr `b F₁ F₂ →` CohCorr `c (f₁^*F₁) (f₂^*F₂)`.

- `TauCeti.EtaleDuality.CohCorr.restrictOpen`: `u ↦ u|_U` for `U ⊂ X` open, on `c|_U := c₁^{−1}(U) ∩ c₂^{−1}(U)`.

- `TauCeti.EtaleDuality.Correspondence.IsInvariant`: `Z` closed is `c`-invariant iff `c₁(c₂^{−1}(Z)) ⊆ Z` as sets.

- `TauCeti.EtaleDuality.Correspondence.IsLocallyInvariant`: `Z` is locally `c`-invariant iff every point of `Z` has an open `U` with `Z ∩ U` invariant for `c|_U`.

- `TauCeti.EtaleDuality.CohCorr.restrictClosed`: For `Z c`-invariant, `u ↦ u|_Z` on `c|_Z : c₂^{−1}(Z)_red → Z × Z`.

- `TauCeti.EtaleDuality.Correspondence.isLocallyInvariant_of_isInvariant`: Invariant implies locally invariant, and locally invariant implies invariant in a neighbourhood of `Fix(c)` (Varshavsky 1.5.3`(a),(e)`).

- `TauCeti.EtaleDuality.CohCorr.naiveLocalTerm`: For `c₂` quasi-finite and `y ∈ Fix(c|_x), u_y : F_x ⟶ F_x` and its trace.

A proof proceeds as follows.

(a), (b): base change for cartesian squares up to nilpotents (topological invariance,
EtaleCohomologyFoundations §§F.0–F.6) and étale base change (Varshavsky 1.1.8–1.1.9).

(c): the largest open `W(Z)` is the complement of the closure of `c₂^{−1}(Z) ∖ c₁^{−1}(Z)` (Varshavsky Lemma
1.5.3(b)); invariance makes the inclusion of `c|_Z` cartesian up to nilpotents, so (a) applies (1.5.6).
For schematic invariance the right square for `c|Z` is cartesian before reduction. Étale nilpotent
invariance identifies `r^*`, `r^!` and the inverse of `r_*`; base-change coherence identifies the two
cohomological restrictions without identifying the two support schemes.

(d): for quasi-finite `c₂` the stalk `(c₂_!c₁^*F)_x` is the direct sum of the stalks of `c₁^*F` over `c₂^{−1}(x)`
(Varshavsky 1.5.7).

Use [Varshavsky-LV-2007] 1.1.8–1.1.9, p. 8; Definition 1.5.1, Example 1.5.2, Lemma 1.5.3, 1.5.6–1.5.8, pp.
14–16 (arXiv v2); [Varshavsky-LocalTerms-2020] §1.2 and Remark 1.3, p.3; [Stacks] Tag 03SI.

*Needs:* §0.2; EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above.

**Checks.**


- `TauCeti.EtaleDuality.restrictOpen_univ`: Restriction to `U = X` returns `u` (after the canonical identification `c|_X = c`).

- `TauCeti.EtaleDuality.isInvariant_point_of_finite_fibre`: If `c₂^{−1}(x)` is finite, `{x}` is locally `c`-invariant (Varshavsky Example 1.5.2).

- `TauCeti.EtaleDuality.restrictClosed_graph_compat`: For the graph-type correspondence of `g` preserving
  `Z` set-theoretically, restrictClosed gives `g|_(Z_red)^*(F|_(Z_red)) → F|_(Z_red)`.
  If `g` also preserves `Z` schematically, this is the pullback of `u|Z:g|_Z^*(F|_Z) → F|_Z`.

- `TauCeti.EtaleDuality.not_isInvariant_translation`: For the graph of translation by 1 on `𝔸¹` in characteristic 0, the closed point {0} is not invariant.

- For `c` the graph-type correspondence of an automorphism `g` with `g(Z) = Z` as sets, `u|_Z`
  is the restricted equivariant structure on `F|_(Z_red)`. Under schematic invariance it is the
  transport of the full restricted structure `u|Z` on `F|_Z`.

- For `X=Z=Spec k[ε]/(ε²)` and `g=id`, `c|_Z` has carrier `Spec k`, while `c|Z` is the identity graph
  on the full `Z`. Their fixed schemes are `Spec k` and `Z`, respectively. For constant `F=Λ` and
  `u=id`, the cohomological restrictions both identify with `id_Λ` under the étale equivalence.

- Example 1.5.2 of Varshavsky: a closed point `x` with `c₂^{−1}(x)` finite is locally `c`-invariant.

**Composition of cohomological correspondences.** Given cohomological correspondences `(c, u)` from `(X, L)` to
`(Y, M)` and `(d, v)` from `(Y, M)` to `(Z, N)`, their composite is supported on `e : C ×_Y D → X × Z` with legs `c₁ ∘ pr_C` and `d₂ ∘ pr_D`, and is the composite `pr_C^*c₁^*L → pr_C^*c₂^!M → pr_D^!d₁^*M → pr_D^!d₂^!N`, where the
middle map is the base change `pr_C^*c₂^! → pr_D^!d₁^*` of the cartesian square (adjoint to the proper/compact
base change isomorphism `pr_D!pr_C^* ≅ d₁^*c₂!`). Composition is associative and unital up to the canonical
isomorphisms of fibre products, and is compatible with pushforward to `Spec k`: for `c₁, d₁` proper, `RΓ_c` of the
composite is `RΓ_c(v) ∘ RΓ_c(u)`. Together with external products `(X, L) ⊗ (X′, L′) = (X × X′, L ⊠ L′)` these
form a symmetric monoidal 2-category (a bicategory). For fixed endpoints `(X,L),(Y,M)`, a 2-morphism
`(c,u)→(d,v)` is a proper support map `p:C→D` with `d₁p=c₁`, `d₂p=c₂` and
`v=CohCorr.pushforward (id_X,p,id_Y) u`. The equation compares the specified cohomological maps;
`Correspondence.Hom` alone supplies only the underlying commuting squares.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. The base-change maps are those of EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4;
external products use finite `Tor` dimension on both factors.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.CohCorr.comp`: (`c, u`), `(d, v) ↦` (`c ×_Y d`, composite).

- `TauCeti.EtaleDuality.CohCorr.comp_assoc`: Associativity up to the canonical isomorphism of iterated fibre products, transporting the actual `c`-morphisms.

- `TauCeti.EtaleDuality.CohCorr.id_comp`: The identity correspondence with `u = id` is a left and right unit.

- `TauCeti.EtaleDuality.CohCorr.rgammac_comp`: For proper first legs, `RΓ_c(v ∘ u) = RΓ_c(v) ∘ RΓ_c(u)`.

- `TauCeti.EtaleDuality.CohCorr.boxProduct`: External product of cohomological correspondences, symmetric monoidal and compatible with composition.

- `TauCeti.EtaleDuality.CohCorr.TwoHom`: The proper support maps with fixed endpoints and the displayed pushforward equation.

- `TauCeti.EtaleDuality.CohCorr.TwoHom.id`, `TauCeti.EtaleDuality.CohCorr.TwoHom.vcomp`: Identity support maps and vertical composition, with associative and unital laws.

- `TauCeti.EtaleDuality.CohCorr.TwoHom.hcomp`: Horizontal composition is the proper map `p×_Y q` between composite supports; prove its pushforward equation and interchange with vertical composition.

- `TauCeti.EtaleDuality.CohCorr.twoCoherence`: The fibre-product associator and unitors are invertible 2-morphisms, natural for `TwoHom`, satisfying pentagon and triangle identities. External products of proper support maps give the symmetric monoidal coherence.

A proof proceeds as follows.

The base change map `pr_C^*c₂^! → pr_D^!d₁^*` exists for every cartesian square of separated finite-type schemes
(EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4), so the composite is always defined.

Associativity and unit: coherence of base change maps with composition of squares (EtaleCohomologyFoundations
§F.5; EnhancedDerivedSheaves §0.4).

For 2-morphisms use proper pushforward composition and base change. Properness survives products and base
change, giving horizontal composition. The corresponding mate identities prove interchange and naturality;
the canonical support isomorphisms satisfy the bicategory and symmetric monoidal coherence identities.

Compatibility with `RΓ_c`: compose the pushforwards of 1.1.6 and use proper base change (Lu–Zheng Construction
2.6).

Use [Lu-Zheng-2022] §2.2, Construction 2.6, p. 13 (arXiv v4).

*Needs:* EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; EtaleCohomologyFoundations §§F.0–F.1,
0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- `TauCeti.EtaleDuality.comp_graph`: The composite of the graph-type correspondences of `g` and `h` is the graph-type correspondence of `g ∘ h`.

- `TauCeti.EtaleDuality.comp_id`: Composition with the identity correspondence returns the original `c`-morphism after the canonical identification `C ×_X X ≅ C`.

- `TauCeti.EtaleDuality.comp_point_compat`: For `X = Y = Z = Spec k` composition is composition of morphisms in `D(Λ)`.

- `TauCeti.EtaleDuality.comp_assoc_up_to_iso`: Composition is associative up to the canonical isomorphism `(C ×_Y D) ×_Z E ≅ C ×_Y (D ×_Z E)` of supports, which transports the composite `c`-morphisms into each other; it is an isomorphism of 1-morphisms of the 2-category, not an equality of supports.

- Composing the graph-type correspondences of `g` and `h` (with structures `u, v`) gives the graph-type correspondence of `g ∘ h` with the composite structure.

- The identity correspondence of `(X, L)` with `u = id` is a unit.

- For the fold `p:Spec k ⊔ Spec k→Spec k` with both endpoints `(Spec k,Λ)` and `u=(a,b)`, the pushforward is `a+b`. Thus `p` is a 2-morphism to `(Spec k,a+b)`; for `Λ≠0`, `a=1,b=0`, it is not one to `(Spec k,0)` despite the commuting support squares.

- Over a point, horizontal composition of finite-support folds uses the Cartesian product of their index sets; the pushforward equality is distributivity of finite sums. Vertical composition is summation in stages, so interchange holds, including empty supports.

### 6.3 Trace classes, local terms and proper pushforward

The targets in this subsection concern separated finite-type schemes of arbitrary dimension. On the
smooth proper-curve domain of GL2AutomorphicRepresentationsAndTransfer R17.6.3a /
`proper-curve-correspondence-trace`, the named maps are adapters to its supplied interface: under the
coefficient and dualizing-complex identifications, `Tr_c(u) = Tr^curve_c(u)` and
`LT_β(u) = LT^curve_β(u)`. The diagonal evaluation, adjunction counits and proper integration maps agree;
these equations also commute with normalized adic realization. The proper-curve trace theory is supplied
by that target, while the construction below supplies the general extension.

**The trace map of a self-correspondence and its local terms.** Let `k` be separably closed, `c : C → X × X` a
self-correspondence and `F ∈ D^b_ctf(X, Λ)`. The trace map `Tr_c : Hom(c₂_!c₁^*F, F) → H⁰(Fix(c), K_{Fix(c)})` is
`H⁰` of the composite `RHom(c₁^*F, c₂^!F) ≅ c^!(DF ⊠ F) → c^!Δ_*K_X ≅ Δ′_*c′^!K_X = Δ′_*K_{Fix(c)}`, where the
first isomorphism is Illusie's Künneth identification, the middle map is induced by `DF ⊠ F → Δ_*K_X` adjoint to
the evaluation `DF ⊗ F → K_X`, and the last is proper base change for the closed immersion `Δ`. For an open `β ⊂ Fix(c), Tr_β` is the restriction to `β`; if `β` is proper over `k`, the local term `LT_β(u) ∈ Λ` is the image of
`Tr_β(u)` under the integration map `π_β! : H⁰(β, K_β) → Λ`. For the trivial correspondence over `Spec k, Tr` is the
usual trace of an endomorphism of a perfect complex.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `k` separably closed; `F` of finite `Tor` dimension, so that biduality and the Künneth identification `DF ⊠ F ≅ RHom(pr₁^*F, pr₂^!F)` hold (§0.2).

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.CohCorr.traceMap`: `Tr_c : Hom(c₂_!c₁^*F, F) → H⁰(Fix(c), K_{Fix(c)}), Λ`-linear.

- `TauCeti.EtaleDuality.CohCorr.traceMap_linear`: `Tr_c` is `Λ`-linear in `u`.

- `TauCeti.EtaleDuality.CohCorr.traceOn`: `Tr_β :=` restriction of `Tr_c` to an open `β ⊆ Fix(c)`.

- `TauCeti.EtaleDuality.CohCorr.localTerm`: For `β ⊆ Fix(c)` open and proper over `k, LT_β(u) := π_β!(Tr_β(u)) ∈ Λ`.

- `TauCeti.EtaleDuality.CohCorr.localTerm_sum`: For a finite partition of a proper `Fix(c)` into open-closed `β, π_!Tr_c(u) = Σ_β LT_β(u)`.

- `TauCeti.EtaleDuality.CohCorr.traceMap_trivial`: For the trivial correspondence over `Spec k, Tr` is the perfect-complex trace of EtaleCohomologyFoundations §F.10.3.

- `TauCeti.EtaleDuality.CohCorr.traceMap_restrictOpen`: `Tr` commutes with restriction to open `W ⊆ C` containing the relevant part of `Fix(c)`.

A proof proceeds as follows.

Apply productDualityKunneth of §0.2: `K_X⊠K_Y ≅ K_(X×Y)` and `D F⊠G ≅ RHom(pr₁^*F,pr₂^!G)` for bounded
constructible finite-Tor complexes. Then sheafified adjunction gives `RHom(c₁^*F,c₂^!F) ≅ c^!(D F⊠F)`. This uses
the product factorization proved in §0.2 as well as sheafified adjunction.

The evaluation map and the diagonal adjunction give `DF ⊠ F → Δ_*K_X`; base change `c^!Δ_* ≅ Δ′_*c′^!` for the
cartesian square defining `Fix(c)` (EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4), and `c′^!K_X = K_{Fix(c)}` (Varshavsky 1.2.2(a)).

Local terms by restriction and the proper integration map (Varshavsky 1.2.2(`b`), (1.3)–(1.4)); the
trivial-correspondence case is Varshavsky 1.2.3 and matches the perfect-complex trace of
EtaleCohomologyFoundations §F.10.3.

Use [Varshavsky-LV-2007] 0.3–0.4, pp. 5–6; Notation 1.2.1, 1.2.2 (a)–(b) with (1.2)–(1.4), Example 1.2.3, pp.
8–9 (arXiv v2).

*Needs:* GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace`;
§6.2; §6.1; §0.2; §0.5; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4;
EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- `TauCeti.EtaleDuality.traceMap_point`: On the trivial correspondence, `Tr(id_F) = χ(F) := Σ (−1)^i rank H^i(F)` for `F` with free cohomology over a field `Λ`.

- `TauCeti.EtaleDuality.localTerm_isolated_identity`: For `g` an automorphism with isolated fixed point `x` and `F = Λ, u = id`, if the induced map on the normal cone at `x` has no nonzero fixed vector then `LT_x(u) = 1` (Varshavsky 2020, Corollary 4.11(b)).

- `TauCeti.EtaleDuality.localTerm_naive_compat`: For `c₂` quasi-finite and `{x} c`-invariant, `LT_y(u|_x)` equals the naive trace `Tr(u_y | F_x)`.

- `TauCeti.EtaleDuality.localTerm_not_naive_identity_curve`: The adapter to GL2AutomorphicRepresentationsAndTransfer R17.6.3a gives `LT_X(id) = LT^curve_X(id) = 2 − 2g` for a smooth proper curve of genus `g` with constant `Λ` coefficients. The fixed component is the whole curve, so there is no finite sum of pointwise naive terms.

- For the trivial correspondence `pt → pt × pt, Tr(u) = Tr(u | F)` for `F` a perfect `Λ`-complex (Varshavsky 1.2.3).

- For `c₂` quasi-finite and an isolated fixed point `y` over a closed point `x` with `{x}` invariant, `LT_y(u|_x) = Tr(u_y | F_x)`, the naive local term (Varshavsky 1.5.7).

**Trace maps commute with proper pushforward of correspondences.** Let `[f] = (f, f♮, f)` be a proper morphism
from a self-correspondence `c : C → X × X` to `b : B → Y × Y` (the two outer components equal). Then the induced
`f′ : Fix(c) → Fix(b)` is proper and, for every `F ∈ D^b_ctf(X, Λ)` and `u ∈ Hom(c₂_!c₁^*F, F), Tr_b([f]_!(u)) = f′_!(Tr_c(u))` in `H⁰(Fix(b), K_{Fix(b)})`, where `f′_!` is the integration map of the proper `f′`. The
correspondences `c` and `b` need not be proper.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `[f]` proper with equal outer components; `k` separably closed.

Name the resulting statement `tracePushforwardCompatibility`.

For proper morphisms within the supplied smooth proper-curve domain, this name is the adapter to
GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace`, with equation
`Tr_b([f]_!u) = Tr^curve_b([f]_!u) = f′_!Tr^curve_c(u) = f′_!Tr_c(u)`.

A proof proceeds as follows.

`Fix(c)` is closed inside `C×_B Fix(b)`: impose equality of the two resulting `X`-points using the closed diagonal
of separated `X`. The projection `C×_B Fix(b)→Fix(b)` is proper because `f♮` is proper. Hence the induced `f′` is
proper. It is not simply a base change of `f`.

For the trace identity use Varshavsky §4.4, pp.36–38. Reduce to the diagonal identity correspondence on `X×X`;
the product-dualizing identification compares the two internal-`Hom` evaluations. The projection formula and
adjunction counits compare this evaluation before and after proper pushforward. The diagrams (4.13)–(4.15)
express these compatibilities; applying `c^!` and proper diagonal base change gives the equality on `Fix(b)`. This
uses the coherent six-operation and product-dualizing inputs of §6.3.

Proposition 1.2.5, through Theorem 4.3.1 and Corollary 4.3.2, then gives the stated identity for proper `[f]`.
Properness of `c` or `b` is not required.

Use [Varshavsky-LV-2007] Proposition 1.2.5, p. 10; Theorem 4.3.1, Corollary 4.3.2 and 4.3.4, pp. 34–36 (arXiv
v2).

*Needs:* GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace`;
§6.2; §0.5; EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.4; §0.2.

**Checks.**


- For `b` the trivial correspondence and `c` proper, the statement is the Lefschetz–Verdier formula of §6.3.

- On the supplied proper-curve domain, the comparison identifies the pushforward of the entire trace
  class, including a positive-dimensional fixed component, before integration.

- For composable proper morphisms `[f]` and `[g]`, the identity reads
  `Tr_d([g]_![f]_!u) = g′_!f′_!Tr_c(u) = (g′∘f′)_!Tr_c(u)`.

**The Lefschetz–Verdier trace formula.** Let `k` be separably closed and `c : C → X × X` a self-correspondence
proper over `k` (`C` and `X` proper over `k`). For every `F ∈ D^b_ctf(X, Λ)` and every `c`-morphism `u : c₂_!c₁^*F → F, Tr(RΓ_c(u) | RΓ_c(X, F)) = Σ_{β ∈ π₀(Fix(c))} LT_β(u)`. For `Λ` a field this is `Σ_i (−1)^i Tr(H^i_c(u)) = Σ_β LT_β(u)`. The Frobenius specialization, including the compact-support formula for a nonproper scheme, is proved in §6.5 from the contracting-boundary refinement.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `c` proper over `k` (the structure morphism `[π]_c` is proper); for the trace on cohomology, `Λ` such that
`RΓ_c(X, F)` is perfect.

Name the resulting statement `lefschetzVerdierTraceFormula`.

On the supplied smooth proper-curve domain this name adapts GL2AutomorphicRepresentationsAndTransfer R17.6.3a /
`proper-curve-correspondence-trace`: `Tr(RΓ(u)) = Σ_β LT^curve_β(u) = Σ_β LT_β(u)`.

A proof proceeds as follows.

Apply §6.3 to the structure morphism `[π]_c` from `c` to the trivial correspondence: the left side is `Tr([π]_!(u))`
(Varshavsky 1.1.7, 1.2.3).

The right side is `π_{Fix(c)!}(Tr_c(u))`, which splits over the connected components of the proper `Fix(c)`
(Varshavsky Corollary 1.2.6; SGA 5 III 4.7).

Use [Varshavsky-LV-2007] Corollary 1.2.6, p. 10 (arXiv v2).

*Needs:* GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace`;
§6.2; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- For `X = ⊔_{i∈I} Spec k` finite, `c` the graph-type correspondence of `σ : I → I` and `F = M` constant: `Tr(RΓ(u)) = Σ_{σ(i)=i} Tr(u_i | M)`, which is Tau Ceti's `LinearMap.trace_pi_of_apply_eq` (§6.3).

- For the identity of a smooth proper curve of genus `g`, the supplied interface gives
  `χ(X) = 2 − 2g = LT^curve_X(id) = LT_X(id)` with `ℚ_ℓ` coefficients.

- For `u = 0`, the induced cohomological operator and every local term vanish, also when the fixed
  locus has positive dimension.

**The Lefschetz–Verdier formula for finite étale schemes and permutation correspondences.** Let `k` be separably
closed, `X = ⊔_{i ∈ I} Spec k` for a finite set `I, σ : I → I` and `g : X → X` the induced morphism, `c = (g, id)` its
graph-type correspondence, `M` a finite free `Λ`-module (`Λ` a field or `ℤ/ℓⁿ`) and `F` the constant sheaf with fibre `M`,
with `u : g^*F → F` given by endomorphisms `u_i : M → M`. Then `RΓ(X, F) = M^I, RΓ(u)` acts by `(x_i) ↦ (u_i(x_{σ(i)})), Fix(c) = {i : σ(i) = i}, LT_i(u) = Tr(u_i)` and the Lefschetz–Verdier formula reads `Tr(RΓ(u)) = Σ_{σ(i)=i} Tr(u_i | M)`. The linear trace identity is supplied by Tau Ceti’s `LinearMap.trace_pi_of_apply_eq` for both coefficient regimes. The target here identifies `RΓ(u)`, the fixed scheme and its geometric local terms with those supplied linear data. With `M=Λ` and `u_i=1`, the trace equals the number of fixed points; Mathlib’s `Matrix.trace_permutation` supplies the permutation case.

Work with the following additional hypotheses. `X` finite étale (a finite disjoint union of copies of `Spec k`); `Λ` a field or `ℤ/ℓⁿ`, with `ℓ` invertible in `k` and `n ≥ 1` in the latter case. The supplied linear identity itself applies over every commutative ring with `M` finite free.

Name the resulting statement `zeroDimensionalLefschetzVerdier`.

A proof proceeds as follows.

Étale cohomology of a finite disjoint union of separably closed points is the product of fibres in degree 0.

`Fix(c)` is the reduced finite scheme of fixed indices; at each the local term is naive (§6.2 (d), with `c₂ = id`
quasi-finite).

Apply the supplied `LinearMap.trace_pi_of_apply_eq` to this identified operator. Its index map `σ` is an arbitrary self-map; invertibility is unnecessary. `Matrix.trace_permutation` is a comparison for a permutation `σ` and rank-one trivial `u_i`.

Use [Varshavsky-LV-2007] Example 1.2.3 and 1.5.7, pp. 9 and 16 (arXiv v2).

*Needs:* §6.2; `LinearMap.trace_pi_of_apply_eq`; `Matrix.trace_permutation`.

**Checks.**


- `σ` a transposition of `I = {1, 2}` with `u_i = id` on `M = Λ`: trace 0, no fixed points.

- `σ = id`: trace `|I| · rank M = Σ_i Tr(id_M)`.

### 6.4 Invariant decompositions and specialization

**Additivity of trace maps over an invariant closed subset and its complement.** Let `c : C → X × X` be a
self-correspondence, `u : c₂_!c₁^*F → F` a `c`-morphism and `Z ⊂ X` a closed `c`-invariant subset with open complement
`U`. Then `c₁^{−1}(U) ⊂ c₂^{−1}(U), u|_Z` and `u|_U` extend by zero to `c`-morphisms `[i_Z]_!(u|_Z)` and `[j_U]_!(u|_U)`,
and `Tr_c(u) = Tr_c([i_Z]_!(u|_Z)) + Tr_c([j_U]_!(u|_U))` in `H⁰(Fix(c), K_{Fix(c)})`. Consequently, for `c` proper
over `k, Tr(RΓ_c(u)) = Tr(RΓ_c(u|_Z)) + Tr(RΓ_c(u|_U))`.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `Z` closed and `c`-invariant; `k` separably closed.

Name the resulting statement `traceAdditivity`.

On the supplied proper-curve domain, this general filtered additivity statement uses
GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace` through §6.3:
`Tr^curve_c(u) = Tr^curve_c([i_Z]_!(u|_Z)) + Tr^curve_c([j_U]_!(u|_U))`.
The two summands are trace classes on the original proper correspondence, with coefficients
`i_*i^*F` and `j_!j^*F`; the restricted open curve need not be proper.

A proof proceeds as follows.

Construct the finite filtered trace calculus in the enhanced coefficient category: a two-step filtered object
is a diagram `F¹→F⁰` with associated grades `F¹` and `Cone(F¹→F⁰)`. For longer finite filtrations use finite
diagrams, convolution for tensor product and its right-adjoint internal `Hom`; derive six operations on those
diagrams. The cofiber/grade functor is compatible with these operations in the forms of Varshavsky §§5.1–5.2,
pp.39–42. Localization supplies `F¹=j_!j^*F→F⁰=F`, with second grade `i_*i^*F`.

Invariance gives the derived mapping vanishing `RHom(c₂!c₁^*j_!j^*F,i_*i^*F)=0`. The mapping-fibre sequence for
two-step diagrams therefore lifts `u` uniquely to this filtered localization object (Varshavsky §5.3, pp.42–44).

Filtered evaluation gives the two diagonal evaluations on grades. Their sum is the unfiltered trace. Proper
closed-immersion compatibility and open restriction identify them with the displayed closed and open
contributions. This proves Proposition 1.5.10 without choosing a splitting of the localization triangle.

Use [Varshavsky-LV-2007] 1.5.9 and Proposition 1.5.10, p. 16; §5.1–5.3, pp. 39–44 (arXiv v2).

*Needs:* §6.3; §6.2; §0.2; EtaleCohomologyFoundations §§F.0–F.2; EnhancedDerivedSheaves §§0.1–0.3.

**Checks.**


- For the graph-type correspondence of an automorphism `g` of a proper curve and `Z = X^g` finite, the Lefschetz number splits into the fixed-point contribution and the contribution of `U`, which has no fixed points.

- For the identity on `ℙ²` with constant `ℚ_ℓ` coefficients, `Z = ℙ¹` and `U = 𝔸²`, integration of the
  identity is the compact Euler-characteristic equality `3 = 2 + 1`.

- For `Z = ∅` the closed contribution is zero and the open contribution is `Tr_c(u)`; for `Z = X` the
  open contribution is zero and the closed contribution is `Tr_c(u)`.

**Specialisation of cohomological correspondences over a trait.** Let `k` be separably closed, `R` a discrete
valuation ring over `k` with residue field `k` (for example `k[t]_{(t)}` or `k[[t]]`), `D = Spec R` with generic point `η`
and closed point `s`. A separated finite-type `X̃` over `D` lifts `X` if it comes with `ϕ : X̃ → X × D` inducing `X̃_η ≅ X_η`; the specialisation functor is `sp_{X̃}(F) := Ψ_{X̃}(ϕ_η^*F_η) : D^b_ctf(X, Λ) → D^b_ctf(X̃_s, Λ)`, with `Ψ`
the nearby-cycles functor (computed after strict henselisation). A lift `f̃` of `f` gives base-change maps
`f̃_s^*sp → sp f^*, f̃_s!sp → sp f_!, sp f_* → f̃_s*sp, sp f^! → f̃_s^!sp`, isomorphisms for `f̃` proper (the !
and * pushforward ones) or smooth (pullback). For a lift `c̃` of a correspondence `c`, every `c`-morphism `u` gives a
`c̃_s`-morphism `sp_c̃(u) : c̃_s2!c̃_s1^*sp F₁ → sp c₂!c₁^*F₁ → sp F₂`. The trace maps commute with
specialisation: `sp_{Fix(c̃)}(Tr_c(u)) = Tr_{c̃_s}(sp_c̃(u))`, where `sp_{Fix(c̃)} : H⁰(Fix(c), K) → H⁰(Fix(c̃_s), K)` is the induced map; `c` and `c̃` need not be proper. For `X̃ = X × D, sp` is the identity. In
computing `Ψ`, pass to a strict henselization and a chosen geometric generic point `η̄`; the functor is
`i_s^*Rj_η̄*` applied to the geometric generic-fibre pullback. Using the ordinary generic point instead would
introduce inertia cohomology. Construct here the all-finite-type exchange transformations and their normalized
adic extension from the supplied torsion geometric nearby cycles; the input is not assumed to include those
stronger transformations.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `R` a DVR over `k` with residue field `k`; nearby cycles of LefschetzPencilsAndVanishingCycles §§0.5–0.8
and the specialization contract of §6.4 with torsion coefficients prime to the residue characteristic,
extended to adic coefficients.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.Lift`: A separated finite-type `X̃` over `D` with `ϕ : X̃ ⟶ X × D` whose generic fibre is an isomorphism.

- `TauCeti.EtaleDuality.Lift.sp`: `sp_{X̃} : D^b_ctf(X, Λ) ⥤ D^b_ctf(X̃_s, Λ), F ↦ Ψ(ϕ_η^*F_η)`.

- `TauCeti.EtaleDuality.Lift.sp_const`: For the constant lift `X × D, sp` is naturally isomorphic to the identity.

- `TauCeti.EtaleDuality.Lift.bcLowerShriek`: For a lift `f̃` of `f, f̃_s!sp → sp f_!`, an isomorphism for `f̃` proper.

- `TauCeti.EtaleDuality.CohCorr.sp`: For a lift `c̃` of `c, u ↦ sp_c̃(u)`, a `c̃_s`-morphism from `sp F₁` to `sp F₂`.

- `TauCeti.EtaleDuality.CohCorr.traceMap_sp`: `sp_{Fix(c̃)} ∘ Tr_c = Tr_{c̃_s} ∘ sp_c̃` (Varshavsky Proposition 1.3.5).

When the original and special-fibre correspondences both lie in the supplied smooth proper-curve
domain, the §6.3 adapters identify this equation with
`sp_{Fix(c̃)}(Tr^curve_c(u)) = Tr^curve_{c̃_s}(sp_c̃(u))`, using
GL2AutomorphicRepresentationsAndTransfer R17.6.3a / `proper-curve-correspondence-trace` for both trace maps.
The specialization transformation itself is the general-scheme target of this subsection.

A proof proceeds as follows.

After strict henselization choose `η̄` and use `Ψ=i_s^*Rj_η̄*` on the geometric generic-fibre complex. Construct
the four exchange maps by the corresponding six-operation mates. Proper and smooth exchange are isomorphisms
in their stated ranges. Starting from the torsion geometric nearby cycles, construct the transformations by
these mates, and prove compatibility with derived coefficient reduction. The common stratification, bounded
cohomological amplitude and finite-level constructibility give normalized adic systems by §3.1; derived
inverse limits then give their `O_E` forms, and localization gives `E`. Proper/smooth exchange is checked at
finite levels, where its inverse exists, and transported through normalization.

For the constant lift, `i^*F_D → i^*Rj_*j^*F_D` is an isomorphism (Varshavsky 1.3.3(a), Remark 3.2.5).

`sp_c̃(u)` is the displayed composite (1.3.4); compatibility with trace maps is Varshavsky Proposition 1.3.5,
proved with cohomological morphisms in §4 (4.3.4).

Use [Varshavsky-LV-2007] 1.3.1–1.3.4 and Proposition 1.3.5, pp. 10–12; 4.3.4, p. 35 (arXiv v2).

*Needs:* LefschetzPencilsAndVanishingCycles §§0.5–0.8 and the specialization contract of §6.4; §6.3; §6.2;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; §3.1.

**Checks.**


- `TauCeti.EtaleDuality.sp_const_trivial`: For `X = Spec k` with the constant lift, `sp` is the identity on perfect `Λ`-complexes.

- `TauCeti.EtaleDuality.sp_nearby_compat`: `sp_{X̃}(F) = Ψ_{X̃}(ϕ_η^*F_η)` is LefschetzPencilsAndVanishingCycles §§0.5–0.8 and the specialization contract of §6.4's nearby-cycles complex for the trait `D`.

- `TauCeti.EtaleDuality.sp_normalCone_punctured_line`: Assume `Λ≠0`. For `X=𝔸¹,Z={0},F=j_!Λ` on `𝔾_m`, identify the deformation by `x=t·v`. On `v≠0` the specialization is nonzero; its restriction at `v=0` is zero by Verdier’s zero-section theorem. Thus specialization is not extension of `F|_Z` by zero, nor the constant sheaf on the whole cone.

- `TauCeti.EtaleDuality.sp_normalCone_zeroSection`: For the deformation to the normal cone of `Z ⊂ X`, restricting `sp(F)` to the zero section recovers `F|_Z` (Verdier; Varshavsky Proposition 1.4.2); away from the zero section `sp(F)` is not determined by `F|_Z`.

- For the constant lift `X × D` and `c × D, sp_c̃(u) = u` and the compatibility is trivial.

**Deformation to the normal cone and Verdier’s specialisation isomorphism.** Let `Z ⊂ X` be a closed subscheme
and `R` as in §6.4 with uniformizer `t`. The deformation `X̃_Z := Spec_{X_D}(O_{X_D}[I_{Z_D}/t])` lifts `X`, its
special fibre is the normal cone `N_Z(X) = Spec_Z(⊕_n I_Zⁿ/I_Z^{n+1})`, and `Z_D ↪ X̃_Z` restricts on the special
fibre to the zero section `Z ⊂ N_Z(X)`. (a) Verdier: for `F ∈ D^b_ctf(X, Λ)` the natural map `sp_{X̃_Z}(F)|_Z → F|_Z` is an isomorphism. (b) Functoriality: for `f : X′ → X` with `f·(I_Z) ⊂ I_{Z′}, f` lifts uniquely to `f̃ : X̃′_{Z′} → X̃_Z`; `f̃_s(N_{Z′}(X′))` lies set-theoretically in the zero section iff `f·(I_Z)ⁿ ⊂ I_{Z′}^{n+1}` for
some `n`; for `Z′ = f^{−1}(Z)` and `f` a closed embedding (resp. proper, smooth), so is `f̃`. (c) A correspondence `c`
lifts to `c̃_Z` on the deformations, and the deformation of `Fix(c)` to the normal cone of `c′^{−1}(Z)` is a closed
subscheme of `Fix(c̃_Z)`.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `Z ⊂ X` closed; (a) for all `F` of finite `Tor` dimension (in fact for all constructible `F`).

Name the resulting statement `normalConeSpecialization`.

A proof proceeds as follows.

(b), (c): direct from the definition of the Rees-type algebra `O_{X_D}[I_Z/t]` (Varshavsky Lemma 1.4.3,
Corollary 1.4.5).

For the zero-section isomorphism follow Varshavsky §3, pp.21–25. Localization reduces to vanishing for `F|_Z=0`.
Blow up to make the ideal Cartier, then embed into an affine-space pair with a coordinate hyperplane. The
one-dimensional step uses a finite étale trivializing cover, normalization, and cohomological dévissage to
obtain generic vanishing. Noether normalization produces a projection finite on the bad-support locus;
dimension induction finishes the argument. Use the nearby-cycle exchange constructed in §6.4,
Mathlib `exists_finite_inj_algHom_of_fg` (RingTheory/NoetherNormalization.lean) for affine Noether normalization, with SchemeAndStackFoundations §0.7 for dimension bounds. Derive the projection finite on the bad-support locus as in Varshavsky §3.2. Use SchemeAndStackFoundations §0.20, `nagata_normalization_finite`, for finite
normalization over these excellent finite-type bases; the blow-up and strict-transform geometry is supplied by
§4.11 with StableReduction Layer 4. This is Verdier SP5, not a formal `G_m`-equivariance calculation.

Use [Varshavsky-LV-2007] Notation 1.4.1, Proposition 1.4.2, Lemma 1.4.3, 1.4.4 and Corollary 1.4.5, pp. 12–14;
§3, pp. 21–25 (arXiv v2).

*Needs:* LefschetzPencilsAndVanishingCycles §§0.5–0.8 and the specialization contract of §6.4; §6.1;
SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- For `Z = X` the deformation is the constant lift and (a) is the identity.

- For `X = 𝔸¹, Z = {0}, N_Z(X) = 𝔸¹` and (a) says the nearby cycles of the deformed constant sheaf restrict to `F_0` at the zero section.

- Assume `Λ≠0`. For `X=𝔸¹`, `Z={0}` and `F=j_!Λ` from `𝔾_m`, write the deformation as `x=t·v`. Specialization vanishes at the zero section but is nonzero on `v≠0`; the zero-section theorem does not make specialization constant along the cone.

### 6.5 Contraction and Frobenius twisting

**Contracting correspondences and Frobenius twists.** Let `c : C → X × X` be a correspondence and `Z ⊂ X` a closed
subscheme. `c` stabilises `Z` if `c₁·(I_Z) ⊂ c₂·(I_Z)·O_C` (scheme-theoretically `c₁(c₂^{−1}(Z)) ⊂ Z`); `c` is
contracting near `Z` if it stabilises `Z` and `c₁·(I_Z)ⁿ ⊂ c₂·(I_Z)^{n+1}·O_C` for some `n ≥ 1`; `c` is contracting near
`Z` in a neighbourhood of fixed points if some open `W ⊃ Fix(c)` of `C` has `c|_W` contracting near `Z`. Over `𝔽̄_q` with
`c` defined over `𝔽_q`, the `n`-th Frobenius twist is `c^{(n)} := (Fr_X^n ∘ c₁, c₂) = (c₁ ∘ Fr_C^n, c₂)`. For `f : Y → X` and `Z ⊂ X` a reduced closed subscheme, `ram(f, Z)` is the least positive integer `m≥1` with `(I_{(f^{−1}Z)_red})^m ⊂ I_{f^{−1}Z}`; for
`f` quasi-finite, `ram(f) := max({1} ∪ {ram(f,x) : x a closed point of X})` is finite, including when the target is empty.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. Schemes noetherian (finite type over `k`); in the Frobenius statements `k = 𝔽̄_q` and `c` is defined
over `𝔽_q`.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.Correspondence.Stabilizes`: `c₁·(I_Z) ⊆ c₂·(I_Z)·O_C` as ideal sheaves of `C`.

- `TauCeti.EtaleDuality.Correspondence.IsContractingNear`: Stabilizes `c Z` and `∃ n ≥ 1, c₁·(I_Z)ⁿ ⊆ c₂·(I_Z)^{n+1}·O_C`.

- `TauCeti.EtaleDuality.Correspondence.IsContractingNearFix`: `∃ W ⊆ C` open containing `Fix(c)` with `c|_W` contracting near `Z`.

- `TauCeti.EtaleDuality.Correspondence.frobeniusTwist`: `c^{(n)} := (Fr_X^n ∘ c₁, c₂)` for `c` defined over `𝔽_q`.

- `TauCeti.EtaleDuality.ramification`: For reduced closed `Z, ram(f, Z) :=` least positive integer `m≥1` with `(I_{(f^{−1}Z)_red})^m ⊆ I_{f^{−1}Z}`; `ram(f) := max({1} ∪ {ram(f,x) : x a closed point of X})` for `f` quasi-finite.

- `TauCeti.EtaleDuality.Correspondence.Stabilizes.isInvariant`: If `c` stabilises `Z` then `Z_red` is `c`-invariant.

- `TauCeti.EtaleDuality.Correspondence.isContractingNear_iff_normalCone`: `c` is contracting near `Z` iff it stabilises `Z` and the first leg of the special fibre of the deformed correspondence maps the normal cone into the zero section.

A proof proceeds as follows.

Stabilising `Z` implies `Z_red` is `c`-invariant (Varshavsky Remark 2.1.2(a)); contraction is equivalently the
condition that the special fibre of the deformed correspondence `c̃_Z` maps `N_{c^{−1}(Z)}(C)` into the zero
section of `N_Z(X)` (Remark 2.1.2(b), via §6.4 (b)).

`ram(f, Z)` exists by noetherianity, and at a closed point `x` is bounded by `max{1,dim_{κ(x)} Γ(f^{−1}(x),O)}` for quasi-finite `f` (Varshavsky 2.2.2).

Use [Varshavsky-LV-2007] Definition 2.1.1, Remark 2.1.2, p. 17; 2.2.1–2.2.2, pp. 18–19 (arXiv v2).

*Needs:* §6.1; §6.2; §6.4; `AlgebraicGeometry.Scheme.IdealSheafData`;
`AlgebraicGeometry.Scheme.IdealSheafData.comap`.

**Checks.**


- `TauCeti.EtaleDuality.frobenius_isContractingNear_point`: The graph-type correspondence `(Fr, id)` of the `q`-Frobenius is contracting near every `𝔽_q`-rational point, with `n = 1`.

- `TauCeti.EtaleDuality.identity_not_contracting`: The identity correspondence of `𝔸¹` is not contracting near `{0}: I²` does not contain `I`.

- `TauCeti.EtaleDuality.isContractingNear_empty`: Every correspondence is contracting near `Z = X (I_Z = 0)` and near `Z = ∅ (I_Z = O_X)`, with `n = 1`.

- `TauCeti.EtaleDuality.ramification_etale`: For an étale `f` and reduced closed `Z, ram(f,Z)=1` since its inverse image is reduced. Reducedness of `Z` is required; an arbitrary thickened closed subscheme need not have ramification 1.

- For `Z=∅`, the inverse-image ideals are both `O_Y`, and the least positive exponent is 1 even for `f=id`. For a quasi-finite map with empty target the bound `ram(f)` is also 1.

- `TauCeti.EtaleDuality.identity_contracting_nilpotent_support`: For `X=Spec k[ε]/(ε²)` and `Z=V(ε)`, the identity is contracting with `n=2` because `I_Z²=0`. The support `|Z|=|X|` is open, although `Z` is a proper closed subscheme.

- The graph-type correspondence `(Fr, id)` of the `q`-Frobenius of `X = X₀ ⊗ 𝔽̄_q` is contracting near every point `x ∈ X₀(𝔽_q): Fr·(I_x) ⊆ I_x^q ⊆ I_x²`.

- For the identity correspondence, contraction fails near a nonempty closed `Z` whose support `|Z|` is not open: Nakayama would force `|Z|` to be open if `I_Zⁿ=I_Z^(n+1)`. This is a condition on support; a nilpotent ideal may make the identity contracting even when `Z` is a proper closed subscheme.

**Local terms of a contracting correspondence are computed on the contracted subscheme.** Let `c : C → X × X` be
contracting near a closed subscheme `Z` in a neighbourhood of fixed points, and `β ⊂ Fix(c)` open and connected
with `c′(β) ∩ Z ≠ ∅`. Then (a) `β ⊂ c′^{−1}(Z)` set-theoretically, so `β` is an open connected subset of `Fix(c|_Z)`;
(b) for every `c`-morphism `u, Tr_β(u) = Tr_β(u|_Z)`, and if `β` is proper over `k, LT_β(u) = LT_β(u|_Z)`.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `k` separably closed; contraction near `Z` on an open neighbourhood of `Fix(c)`.

Name the resulting statement `contractingLocalTerms`.

On the smooth proper-curve domain with `Z` a reduced closed point, this name adapts
GL2AutomorphicRepresentationsAndTransfer R17.6.3b / `contracting-curve-local-term`:
`Tr_β(u) = Tr^curve_β(u) = Tr_β(u|_Z)` and
`LT_β(u) = LT^curve_β(u) = LT_β(u|_Z)` when `β` is proper.
These are equations under the étale identification of the reduced fixed loci, including when `β`
is nonreduced. The general target treats arbitrary closed subschemes in arbitrary dimension.

A proof proceeds as follows.

Replace `c` by its restriction to a neighbourhood of `Fix(c)` where it contracts and by `C ∖ (Fix(c) ∖ β)`, so
`Fix(c) = β`.

(a): by §6.4 (b)–(c) the special fibre of the deformation maps the normal cone of `c′^{−1}(Z)` in `β` to the zero
section, giving `(I_{c′^{−1}Z})ⁿ = (I_{c′^{−1}Z})^{n+1}` on `β`; connectedness and noetherianity force
`(I_{c′^{−1}Z})ⁿ = 0`.

(b): by §6.4, `Tr_c(u)` is the sum of the `Z`-part (equal to `Tr_{c|_Z}(u|_Z)` by §6.3 for the closed embedding) and
the `U`-part; to kill the `U`-part assume `F|_Z = 0` and use §6.4 for `c` and the deformation `c̃_Z`: the specialised
`c`-morphism vanishes because the deformed first leg lands in the zero section where `sp F = F|_Z = 0` (Verdier,
§6.4 (a)), while `sp` on Fix is an isomorphism (Varshavsky Theorem 2.1.3).

Use [Varshavsky-LV-2007] Theorem 2.1.3 and its proof, pp. 17–18 (arXiv v2).

*Needs:* GL2AutomorphicRepresentationsAndTransfer R17.6.3b / `contracting-curve-local-term`;
§6.4; §6.3; §6.2.

**Checks.**


- For the graph-type correspondence of Frobenius and `Z = {x}` a fixed closed point, `LT_x(u)` is the naive term `Tr(u_x | F_x)`.

- For smooth proper source and target curves, if a fixed branch has parameter pullbacks `t³` and `t²`, the ideals
  satisfy `(t³) ⊂ (t²)` and `(t³)² = (t²)³`. The supplied R17.6.3b term and its adapter are
  `LT_y(u) = LT^curve_y(u) = Tr(u_y | F_x)`; the length-two fixed scheme contributes no factor two.

- For the identity of a smooth proper curve and a reduced closed point `Z`, contraction fails:
  `(tⁿ)` is not contained in `(t^{n+1})` for any `n ≥ 1`. Its whole-curve term remains the supplied
  `LT^curve_X(id)`, rather than a pointwise stalk trace.

**Frobenius twists are contracting for large powers.** Let `c : C → X × X` be a correspondence over `𝔽̄_q` defined
over `𝔽_q`. Give every closed subset `Z` its reduced scheme structure when forming `ram(c₂,Z)`.
(a) If `Z ⊂ X` is closed, `n` satisfies `qⁿ > ram(c₂, Z)`, and `Z` is `c^{(n)}`-invariant, then `c^{(n)}` is
contracting near `Z`. (b) If `Z` is a closed locally `c`-invariant subset defined over `𝔽_q`, then `c^{(n)}` is
contracting near `Z` in a neighbourhood of fixed points for every `n` with `qⁿ > ram(c₂, Z)`. (c) If `c₂` is
quasi-finite, then for every `n` with `qⁿ > ram(c₂), c^{(n)}` is contracting near every closed point in a
neighbourhood of fixed points, and `Fix(c^{(n)})` is finite.

Work with the following additional hypotheses. `k = 𝔽̄_q`; `c` defined over `𝔽_q`; `ram` as in §6.5.

Name the resulting statement `frobeniusTwistContracting`.

A proof proceeds as follows.

(a): with `d = ram(c₂, Z), (c₁^{(n)})·(I_Z)` is the `qⁿ`-th power of an ideal contained in `I_{c₂^{−1}(Z)_red}`,
hence inside `I_{c₂^{−1}(Z)_red}^{d+1} ⊂ I_{c₂^{−1}(Z)}`, and its `d`-th power lies in `I_{c₂^{−1}(Z)}^{d+1}`
(Varshavsky Lemma 2.2.3).

(b): a locally `c`-invariant `Z` defined over `𝔽_q` is locally `c^{(n)}`-invariant, so it is `c^{(n)}|_W`-invariant on
the open `W(Z) ⊃ Fix(c^{(n)})` (§6.2); apply (a) to `c|_W` (Varshavsky Corollary 2.2.4(a)).

(c): closed points are locally invariant when `c₂` is quasi-finite (Varshavsky Example 1.5.2, Corollary
2.2.4(b)); finiteness of Fix by §6.5 (a) applied at each point (Theorem 2.3.2(a)).

Use [Varshavsky-LV-2007] Lemma 2.2.3, Corollary 2.2.4, pp. 19; Theorem 2.3.2(a), p. 20 (arXiv v2).

*Needs:* §6.2.

**Checks.**


- For `c` the identity correspondence of `X₀ ⊗ 𝔽̄_q, c^{(n)}` is the graph of Frobenius`^n`, whose fixed points are `X₀(𝔽_{qⁿ})`, finite, for every `n ≥ 1 (ram = 1)`.

**The Fujiwara–Varshavsky trace formula (Deligne’s conjecture).** Let `c : C → X × X` be a correspondence over
`𝔽̄_q` defined over `𝔽_q`, and `U ⊂ X` an open subset defined over `𝔽_q` such that the restriction `c₁:c₁^{−1}(U)→U` is
proper, `c₂` is quasi-finite over `c₂^{−1}(U)`, and `X ∖ U` is locally `c`-invariant. Then there is `d ≥ ram(c₂|_{c₂^{−1}(U)})` such that for every `F ∈ D^b_ctf(X, Λ)` with `F|_{X∖U} = 0`, every `n` with `qⁿ > d` and every
`c^{(n)}`-morphism `u : c₂!(c₁^{(n)})^*F → F: Tr(RΓ_c(u)) = Σ_{y ∈ Fix(c^{(n)}) ∩ c₂^{−1}(U)} Tr(u_y | F_{c₂(y)})`, a finite sum of naive local terms. If `X` and `C` are proper, `d := max{ram(c₂|_{c₂^{−1}(U)}), ram(c₂, X ∖ U)}` works. For `F` with a Weil structure `ψ : Fr^*F → F` and a `c`-morphism `u, u^{(n)} := u ∘ ψⁿ` is a
`c^{(n)}`-morphism, and for `U = X` this is Deligne's conjecture proved by Fujiwara.

Work with the following additional hypotheses. `k = 𝔽̄_q`; `c` and `U` defined over `𝔽_q`; the
properness/quasi-finiteness over `U` and local invariance of `X ∖ U`; `Λ` and `D^b_ctf` as in §6.1's setting; `RΓ_c(u)`
as in Varshavsky 2.3.1 (defined using `c₁` proper over `U` and `F|_{X∖U} = 0`).

Name the resulting statement `fujiwaraVarshavskyTraceFormula`.

A proof proceeds as follows.

Restrict to `c₁⁻¹U` and use properness of `c₁:c₁⁻¹U→U` to construct `RΓ_c(u)`; the assumption `F|_(X∖U)=0` identifies
`RΓ_c(U,F|_U)` with `RΓ_c(X,F)`. This is Varshavsky 2.3.1.

Reduce (b) to (c): restrict to `c₁^{−1}(U)`, compactify so that `X̄ ∖ U` stays locally invariant (Varshavsky Lemma
1.5.4), and extend `u` by zero; traces are unchanged (§6.2).

(c): by §6.3, `Tr(RΓ_c(u)) = Σ_β LT_β(u)`. Components with `c₂(β) ⊂ X ∖ U: c^{(n)}` contracts near `X ∖ U` (§6.5
(b)), so `LT_β(u) = LT_β(u|_{X∖U}) = 0` as `F|_{X∖U} = 0` (§6.5).

Components meeting `c₂^{−1}(U)` are points `y` (§6.5 `(c)`), `c^{(n)}` contracts near `c₂(y)`, and `LT_y(u) = LT_y(u|_x) = Tr(u_y)` (§6.5 and the naive term of §6.2 (d)) (Varshavsky Theorem 2.3.2, Remark 2.3.3).

Use [Varshavsky-LV-2007] 2.3.1, Theorem 2.3.2 and Remark 2.3.3, pp. 19–21 (arXiv v2).

*Needs:* §6.3; §6.2; §6.1.

**Checks.**


- For `c` the identity correspondence of `X₀ ⊗ 𝔽̄_q` with `X₀` proper, `U = X` and `u^{(n)} = ψⁿ` the Weil structure: the formula is the Grothendieck–Lefschetz trace formula `Tr(Frⁿ | RΓ(X, F)) = Σ_{x ∈ X₀(𝔽_{qⁿ})} Tr(Frⁿ_x | F_x)`, for all `n ≥ 1 (ram = 1)`, with geometric cohomological Frobenius as normalized by EtaleCohomologyFoundations §§F.10.2–F.10.2b.

- EndoscopicTransferAndUnitaryTraceComparison §§7.10a,8.5 uses the formula for Igusa/PEL fixed-point traces. AutomorphicGaloisRepresentationsPartII §AG2.1a / contracting-hecke-trace-formula applies it to Hecke and coefficient correspondences on smooth proper compact PEL/Kuga-power special fibres, with `U=X` and a common Frobenius bound.

**The compact-support Frobenius trace formula for Weil and ramified coefficients.** Import
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4 / `VanishingCycles.etaleTraceFormulaFinite`,
`VanishingCycles.etaleTraceFormula` and `VanishingCycles.pointCountTrace` for arithmetically descended
finite/rational complexes and integral constants. Here prove `frobeniusCompactSupportTraceFormula` for
Weil descent data without a continuous Galois model and extend to ramified integral coefficients using §3.1,
compatibly with the general cohomological-correspondence trace class of §6.3.

Let `X₀/𝔽_q` be separated of finite type, `X=X₀×𝔽̄_q`, and `F` a constructible finite-Tor complex with a Weil
isomorphism `ψ:Fr^*F≅F`, with the finite, integral or rational coefficients of §6.1. Require its geometric
stalks and `RΓ_c(X,F)` to be perfect over the coefficient ring. For every `n≥1` the extension states

`Tr(Frⁿ | RΓ_c(X,F)) = Σ_(x∈X₀(𝔽_(qⁿ))) Tr(Frⁿ_x | F_x)`.

On the imported coefficient/descent ranges it agrees with the named supplier formulas. Apply
`fujiwaraVarshavskyTraceFormula` to the identity correspondence on a compactification over `𝔽_q` and extension
by zero of `F`. Both legs have ramification bound one, the boundary is invariant, and `qⁿ>1` for `n≥1`.
Contraction identifies interior local terms with stalk traces and kills the boundary terms. No continuous
Galois extension of `ψ` is used. Apply §3.1 to coherent ramified finite-level systems and §3.2 to their trace
maps; perfectness identifies their realized traces. The equation is the integrated §6.3 trace class and is
compatible with finite coefficient extension and reduction on these perfect systems.

Use [Varshavsky-LV-2007] Theorem 2.3.2 and Remark 2.3.3, pp.20–21;
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4.

*Needs:* §§3.1–3.2,6.3,6.5; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4 /
`VanishingCycles.etaleTraceFormulaFinite`, `VanishingCycles.etaleTraceFormula`, `VanishingCycles.pointCountTrace`;
EtaleCohomologyFoundations §§G.1–G.3, F.10.1–F.10.3.

**Checks.**

- On a point, a rank-one `E` Weil object with `ψ=λ` for a uniformizer has trace `λⁿ` on both sides. It has
  no continuous Galois model, so it lies beyond the descended rational supplier range.
- On `𝔸¹`, the same constant geometric Weil object has compact trace `λⁿqⁿ`, matching the sum of its
  `qⁿ` stalk contributions and the integrated correspondence trace class.
- For ramified `O_E`, a constant free coefficient module with Weil automorphism `a∈O_Eˣ` has point trace
  `aⁿ`, reducing to that same value modulo every `λ^m`; rationalization and finite coefficient extension
  preserve the equation.

### Examples

For `X` a finite disjoint union of geometric points and graph `(σ,id)`, the global operator sends `(x_i)` to `(u_i x_{σ(i)})`. Only fixed diagonal blocks contribute to its trace, giving `Σ_{σ(i)=i}Tr(u_i)`. The local term of a general correspondence is a trace class integrated on a proper fixed component, before it is identified with a stalk trace.

### Dependencies

Layers 0, 1 and 3; EtaleCohomologyFoundations six operations and trace; SchemeAndStackFoundations fibre products, ideal sheaves and deformation geometry; the full nearby-cycle exchange contract in §6.4.

## Layer 7: tubular neighbourhoods and isolated local terms

### 7.1 Punctured tubular fixed-point conditions

**Fixed-point conditions in a punctured tubular neighbourhood.** For a self-correspondence `c:C→X×X` and closed
`Z⊂X`, use the full scheme restriction `c|Z:c⁻¹(Z×Z)→Z×Z` (§6.2).
Let `N_Z(c):N_(c⁻¹(Z×Z))C→N_ZX×N_ZX` be the induced conical correspondence and `V=Fix(c|Z)` its full
schematic vertex. Define NoTubularFixed`(c,Z)` by `|Fix(N_Z(c))|∖|V|=∅`. Define NoAlmostTubularFixed`(c,Z)` by NoTubularFixed
together with finiteness of `{t∈k : |Fix((t·N_Z(c)₁,N_Z(c)₂))|∖|V|≠∅}`. In the comparison theorem `Z` is
schematically `c`-invariant: `c₂⁻¹Z⊆c₁⁻¹Z`, equivalently `c₂⁻¹Z=c⁻¹(Z×Z)`. This is stronger than invariance only of
underlying sets.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. Use scheme inverse images and relative normal cones; the two fixed-point predicates compare
underlying sets. Scalar `t=0` is included.

The interface consists of the following maps and identities.


- `TauCeti.EtaleDuality.NoTubularFixed`: Predicate defined by emptiness of the punctured fixed locus of the induced normal-cone correspondence.

- `TauCeti.EtaleDuality.NoAlmostTubularFixed`: Predicate imposing NoTubularFixed and a finite bad-scalar set, including `t=0`.

- `TauCeti.EtaleDuality.noAlmostTubularFixed_iff`: Equivalent to NoTubularFixed and an open subset `S⊂𝔸¹` containing 1 on which the punctured fixed loci are all empty.

- `TauCeti.EtaleDuality.noTubularFixed_graph`: For `c=(f,id),Z={x}`, the predicate is equivalent to `Fix(N_xf)` having only its vertex as underlying set.

- `TauCeti.EtaleDuality.noTubularFixed_openClosed`: The reduced `Fix(c|Z)` is open and closed in the reduced `Fix(c)`.

- `TauCeti.EtaleDuality.contracting_noAlmostTubularFixed`: A correspondence contracting near `Z` in a neighbourhood of its fixed points has no almost tubular fixed points after this restriction; the bad-scalar set is empty.

- `TauCeti.EtaleDuality.noTubularFixed_congr`: An isomorphism of correspondences carrying `Z` to `Z′` preserves both predicates.

A proof proceeds as follows.

Functoriality of relative normal cones defines both legs and their common vertex. The scalar action on the
first leg defines the family.

The inclusion `N_(Fix(c|Z))Fix(c)↪Fix(N_Z(c))` and Nakayama show that NoTubularFixed makes `Fix(c|Z)` an open and
closed part of `Fix(c)` after reduction (Lemma 4.8).

For a contracting correspondence restricted to a neighbourhood of its fixed points, the first cone leg has
set-theoretic image in the vertex. Every scalar then has empty punctured fixed locus (Lemma 4.7).

Use [Varshavsky-LocalTerms-2020] §1.2 and Remark 1.3, p.3; Definitions 4.3–4.4, Remarks 4.5–4.6 and Lemmas 4.7–4.8, pp.8–9 (v3).

*Needs:* §6.1; §6.2; §6.4; §6.5.

**Checks.**


- `TauCeti.EtaleDuality.tubular_scalar`: For graph `x↦λx` on `𝔸¹, Z={0}, λ∈k×∖{1}`, NoTubularFixed holds and the bad-scalar set is `{λ⁻¹}`.

- `TauCeti.EtaleDuality.tubular_identity`: For the identity of `𝔸¹` at `Z={0}`, NoTubularFixed fails.

- `TauCeti.EtaleDuality.tubular_whole_space`: For `Z=X` the normal cone has only its vertex, so both predicates hold with empty bad-scalar set.

- For the identity on `X=Z=Spec k[ε]/(ε²)`, the normal cone and its fixed vertex are the full `Z`.
  Both punctured-cone predicates hold. The reduced restriction of §6.2 instead has fixed scheme `Spec k`.

- `TauCeti.EtaleDuality.tubular_singular_tame`: On `Spec k[x,y,z]/(x³+yz)` with `g=(x,−y,−z), char k≠2`, the origin is isolated in `X^g` but `N_0X=Spec k[x,y,z]/(yz)` has a fixed line. NoTubularFixed fails; tame order and isolated support alone are insufficient.

### 7.2 ULA trace constancy and normal-cone comparison

**Constancy of relative traces for universally locally acyclic coefficients.** Let `S` be connected, `c:C→X×_S X`
a relative correspondence, and `u:c₁^*F→c₂^!F` a relative cohomological correspondence. Assume `F` is universally
locally acyclic over `S` and `Fix(c)→S` is topologically constant: `Fix(c)_red≅Y×S_red` over `S` for some `Y`. For any
geometric points `s,t` of `S`, the canonical identification `H⁰(Fix(c_s),K_Fix(c_s))≅H⁰(Fix(c_t),K_Fix(c_t))` takes
`Tr(c_s,u_s)` to `Tr(c_t,u_t)`. The groups belong to the fixed-point fibres, not to `X_s` and `X_t`.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `S` is connected; the topological trivialization is over `S`; use relative extraordinary pullback and
the fibre restriction of `u`. `F` is ULA, not merely lisse on a single fibre.

Name the resulting statement `relativeTraceConstancy`.

A proof proceeds as follows.

Reduce equality between geometric fibres to specialization on strict henselian traits using constructibility
and connectedness.

ULA gives `F_s≅Ψ(F_η̄)`, compatible with every base change. The nearby-cycle exchange maps carry the relative
correspondence to its specialized one.

Trace commutes with this specialization by the product-duality and evaluation diagrams of §7. The
topologically constant fixed-point family identifies its dualizing cohomology, so specializing its trace does
not change the element.

Use [Varshavsky-LocalTerms-2020] Proposition 2.5, p.5; proof §7, pp.14–18 (v3); published pp.988–989,
999–1004.

*Needs:* §6.3; §6.4; LefschetzPencilsAndVanishingCycles §§0.5–0.8 and the specialization contract of §6.4;
EtaleCohomologyFoundations §§F.0–F.6 and the scheme-site contract above; §0.2.

**Checks.**


- For `X=Y×S,F=pr_Y*G` and the product of one fixed correspondence with `S`, all fibre traces agree.

- ULA cannot be dropped: take `X=S=𝔸¹` with the relative identity correspondence and `F` the skyscraper at 0. The fixed family is topologically constant, but the fibre traces are 1 at 0 and 0 away from 0.

**Trace comparison with an invariant closed subscheme.** Let `c:C→X×X` and let `Z⊂X` be a schematically
`c`-invariant closed subscheme. Assume NoTubularFixed`(c,Z)`. Then `Fix(c|Z)_red` is open and closed in `Fix(c)_red`.
(a) If also NoAlmostTubularFixed`(c,Z)`, restriction of `Tr_c(u)` to `Fix(c|Z)` equals `Tr_(c|Z)(u|Z)` for every
`c`-morphism `u` on a constructible finite-Tor complex. (b) Every connected component `β` of `Fix(c|Z)` that is proper
over `k` is a connected component of `Fix(c)`, and `LT_β(u)=LT_β(u|Z)`. Part (b) requires no global
NoAlmostTubularFixed assumption.

The full restriction `c|Z` has the same étale trace as §6.2's reduced restriction `c|_Z`:
the nilpotent closed immersion `r_Fix:Fix(c|_Z)→Fix(c|Z)` identifies dualizing cohomology and carries
`Tr_(c|_Z)(u|_Z)` to `Tr_(c|Z)(u|Z)`. Integration over corresponding proper components gives equal
local terms.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. Schematic invariance and the punctured-cone conditions are those of §7.1; in (b) `β` is proper,
although `X` and `C` need not be proper.

Name the resulting statement `normalConeTraceComparison`.

A proof proceeds as follows.

For the full/reduced comparison, §6.2 identifies the cohomological restrictions under reduction of
the support. Apply proper trace functoriality (§6.3) to this nilpotent closed immersion; its induced
map `r_Fix` is also a nilpotent closed immersion, so étale nilpotent invariance makes the trace map
on dualizing cohomology an isomorphism. Compatibility of proper integration gives the local-term equality.

Use closed/open trace additivity to reduce to `F|Z=0`. Specialize `c,u,F` to the normal cone. The fixed family
near the vertex is topologically constant, and the trace-specialization exchange identifies its trace with the
original restriction.

Verdier’s zero-section theorem gives `sp_ZF|Z=0`, while monodromicity of specialization allows a finite power of
the scaling action to give weak equivariance at finite coefficients. This is Verdier SP1 and Proposition 5.1;
the adic passage must use normalized finite-level limits, not an assumed global equivariant structure.

The zero stalk along the vertex extends the weak equivariance across scalar 0. Remove the finitely many bad
nonzero scalars and retain 0 and 1. On this scalar family `F⊠Λ` is ULA; relative trace constancy identifies the
trace at 1 with the zero trace at 0. This proves (a).

For (b) first isolate the proper component `β`. The quotient of the punctured fixed cone by `𝔾_m` is proper over
`β`. Its projection to the scalar line has closed image disjoint from 0, hence a finite image. This is Lemma 3.9
and gives the required local no-almost condition; apply (a) and integrate the trace over `β`.

Use [Varshavsky-LocalTerms-2020] §1.2 and Remark 1.3, p.3; Theorem 4.10, p.10; Lemma 3.9, pp.7–8; proof §6, pp.12–14 (v3); published
pp.995, 997–999; [Verdier-1983] §3, Definition 3.1 and criterion 3.2, pp.338–340; §5, Proposition 5.1,
pp.341–343; §8, SP1 (p.352), SP5 (p.353) and proof (p.354); [Stacks] Tag 03SI.

*Needs:* §7.1; §6.2; §6.4; §6.3; LefschetzPencilsAndVanishingCycles §§0.5–0.8 and the specialization contract of
§6.4; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- A graph `x↦λx, λ≠1` on `𝔸¹` at `Z={0}`, has local term equal to its stalk trace.

- For contracting correspondences the no-almost predicate holds with no bad scalars and recovers the 2007 comparison.

- For `Z=X` the restriction identity is tautological; removing properness of `β` does not leave a scalar-valued local term.

- For `X=Z=Spec k[ε]/(ε²)`, `g=id`, `F=Λ` and `u=id`, the full restriction has fixed scheme `Z`
  and the reduced restriction has fixed scheme `Spec k`. Their trace classes correspond to `1∈Λ`
  and both integrated local terms are 1.

### 7.3 Tame fixed subschemes

**The full fixed subscheme has no punctured-cone fixed points for a tame automorphism.** Let `k` be
algebraically closed, `X` separated of finite type over `k`, and `g` an automorphism with `g^m=id` for a positive `m`
invertible in `k`. Set `Z=Fix(g)` as the full scheme equalizer, including nilpotents. Then `Fix(N_Z(g))=Z` as
schemes. The graph `(g,id)` has no almost fixed points in the punctured tubular neighbourhood of `Z`: its
bad-scalar set is contained in `{λ⁻¹ : λ^m=1, λ≠1}`. Neither smoothness of `X` nor reducedness of `Z` is required.
This statement does not replace `Z` by `Z_red`.

Work with the following additional hypotheses. Use the full scheme fixed locus and its ideal; the tame
finite-order assumption allows spectral projectors for the `m` distinct roots of unity. `X` is separated, so fixed
points have finite-group invariant affine neighbourhoods.

Name the resulting statement `tameFixedSubschemeNormalCone`.

A proof proceeds as follows.

Near any point of `Z` choose an affine open `U` containing that fixed point. The intersection of the finitely many
`g^iU` is affine because `X` is separated, contains the point, and is `g`-invariant. Work on `X=Spec` A there.

Write `A=⊕_{λ^m=1} A_λ` using the explicit spectral projectors `(1/m)Σ_j λ^(−j)g^j`, also for infinite-dimensional
A over `k`. The fixed ideal `I` is generated by `A_λ` for `λ≠1`, since it is generated by `g(a)−a`. The quotient `Q=A/I`
has trivial `g`-action.

The `Q`-module `I/I²` is generated by images of the nontrivial `A_λ`. Since `Q` has trivial action and the spectral
projectors are exact, `(I/I²)_1=0`. The graded `Q`-algebra `gr_I A` is generated in degree one via `Sym_Q(I/I²)↠gr_I A`. In the fixed-scheme quotient all degree-one generators are killed, so only degree-zero `Q` remains. Hence
`Fix(N_Z(g))=Spec Q`, including its nilpotents.

For the scalar-twisted cone map the action on a degree-one `λ`-generator is `tλ`. Outside the finite set `λ⁻¹` with
`λ≠1`, all degree-one generators are again killed in the fixed quotient. The set omits 0 and 1. These local
computations agree on overlaps and prove the no-almost predicate globally.

Use [Varshavsky-LocalTerms-2023] §4.1–4.4 pp.992–994; Theorem 4.10 pp.994–995; failed general comparison in
Lemma 5.1 pp.995–996.

*Needs:* §7.1; §6.4; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above.

**Checks.**


- For `X=Spec k[x,y,z]/(x³+yz), g=(x,−y,−z), char k≠2`, the full fixed ideal is `(y,z)`, and `Z=Spec k[x]/(x³)`. Its conormal generators have character `−1`, so its fixed cone is exactly this nonreduced `Z`. The cone along the reduced origin instead has a fixed line; replacing `Z` by `Z_red` would fail.

- For the involution on `𝔸¹` the fixed subscheme is {0}; the only possible bad scalar is `−1`. For the identity, `Z=X` and the bad-scalar set is empty.

- The result does not extend to order divisible by `char k`: for `g(t)=t+1` on `ℙ¹` in characteristic `p`, at `∞` the conormal character is trivial, so the spectral-projector step is unavailable and the local term can differ from its stalk trace.

### 7.4 Semisimple isolated fixed subschemes

**Diagonalizability of a semisimple cyclic closure.** Let `k` be algebraically closed, `G` a linear
algebraic group over `k`, and `g∈G(k)` semisimple. Prove `semisimpleCyclicClosure_diagonalizable`: the reduced
Zariski closure `D` of `⟨g⟩` is diagonalizable, and evaluation at `g` is injective on its character group:
`χ(g)=1` iff `χ` is the trivial character. Its identity component is a torus and its finite component group
has order prime to `char k` in positive characteristic. For a finite-dimensional rational `D`-module,
character projections are exact and `g−1` is invertible on each nontrivial character space.

Choose a faithful linear representation and diagonalize `g`. Its reduced cyclic closure is a closed subgroup
of the diagonal torus, hence is diagonalizable. A character equal to 1 on `g` is 1 on every power and therefore
on `D` by density. The structure of a reduced diagonalizable group over the perfect field `k` gives the torus
and prime-to-characteristic component assertions. Use the character-space decomposition and its exactness
for the representation statement.

Use [Milne-AG-2017] Theorem 12.9(c), pp.233–234, and §12(e), p.236;
[Jantzen-2003] Part I §2.11(1)–(4), pp.30–31, for exact character projections.

*Needs:* ReductiveGroups Layer 4 (semisimple elements, faithful linear representations and diagonalizable groups).

**Checks.**

- An element of order `m` prime to `char k` has reduced closure `μ_m`, and characters are detected by a
  primitive `m`-th root, including `m=1` where the closure and character group are trivial.
- An infinite-order element of `𝔾_m(k)` has closure `𝔾_m`; no nonzero character evaluates to 1.
- In characteristic `p`, a nonidentity unipotent element of order `p` has reduced cyclic closure the constant
  group `ℤ/p`, which is not diagonalizable. Semisimplicity cannot be dropped.

**Semisimple isolated fixed points: the full fixed subscheme has a fixed cone with no extra points.** Let `k` be
algebraically closed, `X` separated of finite type over `k`, and let a linear algebraic group `G` act on `X`. Let
`g∈G(k)` be semisimple and `x` an isolated point of the support of `Fix(g)`. Let `Z` be the open-and-closed Artin
component of the full scheme equalizer `Fix(g)` supported at `x`, and `N_Z(g)` the induced map on the normal cone
`N_ZX`. Then `Fix(N_Z(g))=Z` scheme-theoretically. The scalar-twisted cone maps have a finite bad set of
parameters, avoiding 0 and 1, outside which their fixed subscheme is `Z`. Thus the graph `(g,id)` has no almost
fixed points in the punctured tubular neighbourhood of `Z` and satisfies the proper-component hypothesis of the
normal-cone trace theorem. In particular, for any constructible finite-Tor adic complex `F` with `u:g^*F→F, LT_x(u)=Tr(u_x)`. `X` need not be normal or smooth and `g` need not have finite order.

Work with the following additional hypotheses. `Z` is the full scheme fixed component, including its nilpotents;
replacing it by the reduced point is invalid. Étale sheaf coefficients have `ℓ` invertible in `k` and the rational
adic/finite-Tor conventions of EtaleCohomologyFoundations §§F.0–F.2/6. The reduced Zariski closure `D` of the
cyclic subgroup generated by `g` is diagonalizable, with a torus and a finite prime-to-characteristic component.
Cyclic density means `χ(g)≠1` for every nontrivial character `χ` of `D`. These facts are supplied by `semisimpleCyclicClosure_diagonalizable`.

Name the resulting statement `semisimpleIsolatedFixedSubschemeNormalCone`.

A proof proceeds as follows.

Work at `x`, without choosing a `D`-invariant affine neighbourhood. The stabilizer of `x` contains every power of `g`
and hence `D`. Put `A=𝒪_(X,x)`, maximal ideal `m`, and let `I=(g(a)−a:a∈A)` be the full fixed ideal. Isolated support
makes `I m`-primary. `D` preserves `I` because it commutes with `g`. Choose `N` with `m^N⊆I²`. The algebraic `D`-action on
the finite jet `A/m^N` induces a rational `D`-action on the finite algebra `B=A/I²` and its square-zero ideal
`J=I/I²`.

`D` acts trivially on `Q=A/I: g` acts trivially, and equality with the trivial action on this finite-dimensional
quotient is a closed condition, so cyclic density implies triviality of all `D`. Decompose `B` into `D`-character
spaces. Exact weight projection makes `B₀→Q` surjective and places every nontrivial `B_χ` in `J`. Since `χ(g)−1` is a
nonzero scalar for `χ≠0`, the images of `(g−1)B` generate `J` from these spaces.

For any coefficient `b∈B`, choose `b₀∈B₀` with the same image in `Q`, and write `b=b₀+j` with `j∈J`. Multiplying a
nontrivial-weight generator in `J` by `j` gives zero because `J²=0`; multiplication by `b₀` preserves its nontrivial
weight. Therefore `J` has no trivial-character component, and `g−1` is invertible on `J`. This proves the essential
conormal claim even though the original local algebra need not itself be a rational `D`-module.

The surjection `Sym_Q(J)→gr_I(A)` generates the cone algebra in degree one over degree-zero `Q`. In the
fixed-scheme quotient, every generator of `J_χ` vanishes because its eigenvalue `χ(g)` is not 1. Hence that
quotient is exactly `Q`, retaining its nilpotents. Only finitely many eigenvalues `λ` occur in `J`. Scalar parameter
`t` replaces them by `tλ`, so the exceptional parameters are among `λ⁻¹`, a finite set omitting 0 and 1. The same
statement includes the zero parameter by the cone contraction. Shrink `X` about `x` to remove other fixed
components; local conormal calculations give the scheme assertion along `Z`.

`Z` is finite Artin and therefore proper. Apply §7.2, Varshavsky Theorem 4.10(b), to the graph along `Z`; it
requires no extra fixed points in the punctured cone and properness of the component. The restricted graph is
the identity on the full `Z` under the `c|Z` convention of §7.1; its reduction is §6.2's `c|_Z`.
The cohomological restriction comparison of §6.2 and trace comparison of §7.2 identify their local terms.
Nilpotent invariance of the étale site identifies its compact trace with the alternating
stalk trace at `x`. This yields the local-term equality. For proper `X` with finite fixed support, sum these
equalities in Lefschetz–Verdier.

Use [Jantzen-2003] Part `I`, §2.11(1)–(4), pp.30–31; [Varshavsky-LocalTerms-2023] Theorem 4.10(b) and Lemma 5.1,
p.995; Corollaries 5.4 and 5.6, p.996 (version of record).

*Needs:* `semisimpleCyclicClosure_diagonalizable`; §7.2; §7.1; §6.3; ReductiveGroups layer 4 jordan decomposition diagonalizable groups tori;
SchemeAndStackFoundations §§0.7, 0.9, 4.11 and the geometric contracts above; EtaleCohomologyFoundations
§§F.0–F.6 and the scheme-site contract above.

**Checks.**


- For `char(k)≠2, X=Spec k[x,y,z]/(x³+yz), g(x,y,z)=(x,−y,−z): Fix(g)=Spec k[x]/(x³), I=(y,z)`, and `J` has eigenvalue `−1`. The full fixed cone has fixed subscheme `Z`, so `LT_0` is the stalk trace. The cone at the reduced origin still has the fixed `x`-line, demonstrating why that false comparison is unnecessary.

- On the same singular `X`, let `t∈k×` have infinite order and let `g(x,y,z)=`(`x`,ty,`t⁻¹z`). The full fixed subscheme is again `k[x]/(x³)`, and `J` has weights `t,t⁻¹`. The finite bad set is `{t,t⁻¹}`, avoiding 1: this checks the general infinite-order semisimple application.

- For `g(a)=λa` on `𝔸¹` with `λ≠1`, the full fixed scheme is the origin and the only bad scalar is `λ⁻¹`. If `X` is itself a zero-dimensional Artin scheme and `g=id, Z=X, J=0` and the punctured cone is empty.

- In characteristic `p`, translation `g(a)=a+1` on `ℙ¹` is unipotent of order `p` and has one fixed point at `∞`. Its local term on the constant sheaf is 2 whereas the stalk trace is 1. It fails the semisimplicity and nontrivial-conormal-weight hypotheses.

### 7.5 Local terms at isolated fixed points

**Local terms at tame and semisimple isolated fixed points.** Let `k` be algebraically closed and `X` separated of
finite type over `k`. (a) If `f:X→X` fixes `x` and `N_x(f)` has no nonzero fixed points, then `x` is isolated and
`LT_x(u)=Tr(u_x|F_x)` for any `u:f^*F→F` with `F` constructible of finite `Tor` dimension. (b) If `X` is smooth at an
isolated fixed point `x` of a semisimple element `g` of a linear algebraic group acting on `X`, the same equality follows from `semisimpleIsolatedFixedSubschemeNormalCone` applied to its full Artin fixed component. (c) For an automorphism `g` of finite order invertible in `k`, the
equality holds at every isolated fixed point, including singular ones, by applying the trace comparison to the
full fixed subscheme `Z=Fix(g)`. If `X` is proper and `X^g` has finite support, its global trace is the sum of their
stalk traces. The cone of the reduced point can have nonzero fixed points even in (c); it is not an asserted
intermediate result. The perfect-scheme transport is a separate Part II target. (d) More generally, if `g` is a
semisimple element of a linear algebraic group acting on `X` and `x` is isolated in the fixed support, then
`LT_x(u)=Tr(u_x)`, even for singular nonnormal `X` and infinite-order `g`: apply the full Artin fixed-subscheme
theorem of §7.4. For proper `X` with finite fixed support the global trace is the sum of these stalk traces.

Work with the following additional hypotheses. All schemes are separated of finite type over a field `k`
(separably closed whenever trace maps, local terms or traces on cohomology occur); `ℓ` is invertible in `k`; `Λ` is
a finite ring killed by a power of `ℓ`, or a finite extension of `ℤ_ℓ` or `ℚ_ℓ` (in the adic case `D^b_ctf` is the
category of §3.1); `D^b_ctf(X, Λ)` is the category of constructible complexes of finite `Tor` dimension
(EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3), stable under the six
operations. `k` algebraically closed; for (c), `g^m = id` as `k`-scheme automorphisms with `m` invertible in `k`, so
that `⟨g⟩` is a finite diagonalizable group of order prime to p. Only (b) requires smoothness at `x`. In (c) use
the full fixed subscheme, not the reduced point. Apply `semisimpleIsolatedFixedSubschemeNormalCone` to the full Artin fixed component in (b) as well as (d).

Name the resulting statement `finiteOrderLocalTerms`.

A proof proceeds as follows.

(a) Apply the proper-component part of normal-cone-trace-comparison with `Z={x}`; its restricted trace is the
stalk trace.

(b) Apply `semisimpleIsolatedFixedSubschemeNormalCone` from §7.4 to the full Artin fixed component.
Its normal-cone trace comparison gives the equality directly.

(c) Use the tame-fixed-subscheme-normal-cone theorem with the full scheme `Z=Fix(g)`, which gives
NoAlmostTubularFixed without smoothness. Apply normal-cone-trace-comparison to `Z`. An isolated component `β` of `Z`
has finite nonreduced support, is proper over `k`, and has the same étale site as its reduced point. The
restricted graph is the identity correspondence because `g|Z=id`. Thus its local term is the stalk trace. For
the global statement sum these terms in the proper Lefschetz–Verdier formula.

For arbitrary semisimple `g`, use §7.4: the finite-jet rational diagonalizable action has no invariant conormal
character, so the cone along the full Artin fixed component satisfies Theorem 4.10(b). The argument uses only the rational finite-jet action at the fixed point.

Use [Varshavsky-LocalTerms-2020] Theorem 4.10 and Corollary 4.11, p. 10; Lemma 5.1–Corollary 5.6, pp. 10–11
(arXiv v3); [Hansen-Kaletha-Weinstein-2022] Proposition 5.6.2 and its proof, p. 61 (arXiv v4);
[Varshavsky-LocalTerms-2023] §4 Theorem 4.10, p.995; §5 pp.995–997.

*Needs:* §6.3; §6.2; §6.4; `AlgebraicGeometry.Scheme`; §7.2; SchemeAndStackFoundations §§0.7, 0.9, 4.11 and
the geometric contracts above; §7.3; §7.4.

**Checks.**


- For the involution `x ↦ −x` of `ℙ¹ (p ≠ 2)` with `F = Λ, u = id`: fixed points 0 and `∞`, naive terms `1 + 1 = 2 = Tr(g^* | H⁰ ⊕ H²) = 1 + 1`.

- The finite-order hypothesis matters: for translation by 1 on `𝔸¹ ⊂ ℙ¹` in characteristic `p` (order `p`, not prime to `p`), the unique fixed point `∞` has naive term 1 while `Tr(g^* | H*(ℙ¹)) = 2`, so the local term at `∞` is 2, not naive.

- On `Spec k[x,y,z]/(x³+yz)` with `g=(x,−y,−z), char k≠2`, the reduced-origin cone has a fixed `x`-line. This disproves the reduced-point cone implication, but the full fixed scheme is `Spec k[x]/(x³)` and its conormal has eigenvalue `−1`. The full-fixed-subscheme theorem proves `LT_0(u)=Tr(u_0)`.

### Examples

Over `char(k)≠2`, on `Spec k[x,y,z]/(x³+yz)`, the involution `(x,y,z)↦(x,−y,−z)` has full fixed scheme `Spec k[x]/(x³)`. Its conormal weights are `−1` and the fixed cone is this Artin scheme. The cone at the reduced origin has a fixed `x`-line, so replacing the full fixed scheme invalidates the cone argument. For a characteristic-`p` translation on `P¹`, the unique fixed point has local term 2 and stalk trace 1: the tame/semisimple hypotheses are necessary.

### Dependencies

Layer 6; SchemeAndStackFoundations normal cones and deformation; ReductiveGroups Layer 4 and exact character projection on finite rational representations; ULA and nearby-cycle compatibility as specified in §7.2.

## Layer 8: Frobenius reciprocity from graded duality

### 8.1 Self-pairings, multiplicity parity and determinant signs

Use the supplied primary-space reciprocity and the Tau Ceti alternating-rank theorem; add the self-pairing multiplicity restrictions and the determinant sign.

**The determinant of a similitude of a symmetric or alternating form.** Let `F` be a field of characteristic `≠ 2, V` of finite dimension `b` with a perfect bilinear form `⟨·,·⟩` which is symmetric `(ε = +1)` or alternating `(ε = −1), c ∈ F^×`, and `φ ∈ GL(V)` with `⟨φv, φw⟩ = c⟨v, w⟩`. Fix `s ∈ F̄` with `s² = c` and let `m_±` be the algebraic
multiplicity of `±s` as an eigenvalue of `φ` (the dimension of the generalized eigenspace over `F̄`). Then: (b)
`det(φ)² = c^b`; (c) if `ε = −1`, then `b, m_+` and `m_−` are even and `det(φ) = c^{b/2}`; (d) if `ε = +1`, then `m_+ + m_− ≡ b (mod 2)` and `det(φ) = (−1)^{m_−} s^b`, thus `det(φ)=(−1)^{b−m_+}s^b` as well. If `b` is even, `s^b=c^{b/2}`, and
only then this simplifies to `det(φ)=(−1)^{m_−}c^{b/2}`. In odd rank retain `s^b`, even when `s` lies in `F`. For
`c=q^d` with `d` even use `s=q^{d/2}`, so `s^b=q^{(d/2)·b}`, with no parity assumption on `b`.

Work with the following additional hypotheses. `char F ≠ 2`; form perfect and `ε`-symmetric; `φ` a similitude with
factor `c`; no semisimplicity of `φ`.

Name the resulting statement `formSimilitudeDeterminant`. In `Suggested.lean`, `form_similitude_det_alt` states the alternating determinant and even self-paired multiplicities, and `form_similitude_det_symm` states the symmetric multiplicity parity and both determinant signs. Both use scalar extension to an algebraically closed field and a chosen square root `s` of the multiplier.

A proof proceeds as follows.

Use the primary-space decomposition and perfect pairings `V_α × V_(c/α)` supplied by DeligneWeightsAndPurity
§0.16, with scalar extension to an algebraic closure. The spaces are generalized eigenspaces, so their
dimensions are algebraic multiplicities without a semisimplicity hypothesis.

The supplied two-space determinant identity, with both spaces and both operators equal, gives `det(φ)²=c^b`.

Eigenvalues `α ≠ ±s` come in pairs `{α, c/α}` of equal multiplicity, each pair contributing `c^{dim V_α}`; so `det φ = c^{(b − m_+ − m_−)/2} s^{m_+} (−s)^{m_−} = (−1)^{m_−} s^b`, and `b − m_+ − m_−` is even.

For the alternating case the self-paired primary spaces `V_s` and `V_(−s)` carry nondegenerate alternating
restrictions. Apply Tau Ceti’s `LinearMap.BilinForm.IsAlt.even_finrank` to these spaces and `V`. Their
dimensions are even, so the preceding product has positive sign and `det(φ)=c^(b/2)`. The new assertion is this
determinant and the even multiplicities of the self-paired primary spaces; even rank of an alternating space
is the supplied input.

Use [Deligne-WeilI-1974] (2.6), pp. 281–282; [Milne-LEC] Remark 27.13 and Summary 27.14(a), p. 159.

*Needs:* DeligneWeightsAndPurity §0.16; `Module.End.maxGenEigenspace`;
`LinearMap.det_eq_of_compl₁₂_self_eq_smul`; `TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self`;
`Module.End.iSup_maxGenEigenspace_eq_top`; `LinearMap.finrank_maxGenEigenspace_eq`.

**Checks.**


- Rank-two alternating case: `det φ = c`, matching `LinearMap.det_eq_of_compl₁₂_self_eq_smul`.

- Symmetric rank one with `⟨x, y⟩ = xy` and `φ = −s (c = s²): m_− = 1` and `det φ = −s`, so the sign is not determined by the form alone.

- Isometries `(c = 1): det(φ)² = 1`, matching `TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self`.

### 8.2 Graded Frobenius duality

**Graded Frobenius duality data of weight `(2d, q^d)`.** Fix a field `E` of characteristic 0, an integer `d ≥ 0` and
`q ∈ E^×`. A graded Frobenius duality datum consists of finite-dimensional `E`-vector spaces `H^i` (`0 ≤ i ≤ 2d`; zero
otherwise), automorphisms `F_i ∈ GL(H^i)`, and perfect pairings `⟨·,·⟩_i : H^i × H^{2d−i} → E` such that `⟨F_i x, F_{2d−i} y⟩_i = q^d ⟨x, y⟩_i` and `⟨x, y⟩_i = (−1)^i ⟨y, x⟩_{2d−i}` (the Koszul sign `(−1)^{i(2d−i)} = (−1)^i` of
graded commutativity). Its Betti numbers are `b_i := dim H^i`, its Euler characteristic `χ := Σ (−1)^i b_i`, its
polynomials `P_i(t) := det(1 − tF_i | H^i)` and its determinant `Δ := ∏_i det(F_i)^{(−1)^i} ∈ E^×`. The middle
form `⟨·,·⟩_d` is `(−1)^d`-symmetric.

Work with the following additional hypotheses. `E` of characteristic 0 (so `ℚ_ℓ` with `ℓ = 2` is allowed, and
alternating and symmetric are distinct); pairings perfect; `F` acts by a similitude of factor `q^d`; no
semisimplicity of `F`.

The interface consists of the following maps and identities.


- `TauCeti.GradedFrobeniusDuality`: Data: `d≥0,q∈E×`,finite-dimensional `H^i` for `i∈ℤ` with `H^i=0` outside `0≤i≤2d`,automorphisms `F_i`,perfect pairings `H^i×H^(2d−i)→E` and the similitude/Koszul laws. An `ℕ`-indexed implementation includes explicit vanishing above `2d` and uses pairs `i,j` with `i+j=2d`, avoiding unrestricted subtraction on `ℕ`.

- `TauCeti.GradedFrobeniusDuality.betti`: `b_i :=` finrank `E (H i)`.

- `TauCeti.GradedFrobeniusDuality.betti_symm`: `b_i = b_{2d−i}` for `0 ≤ i ≤ 2d`.

- `TauCeti.GradedFrobeniusDuality.eulerChar`: `χ := Σ_{i ≤ 2d} (−1)^i b_i ∈ ℤ`.

- `TauCeti.GradedFrobeniusDuality.frobPoly`: `P_i(t) := det(1 − t F_i) =` charpolyRev of `F_i`.

- `TauCeti.GradedFrobeniusDuality.delta`: `Δ := ∏_{i ≤ 2d} det(F_i)^{(−1)^i} ∈ E^×` (with zpow).

- `TauCeti.GradedFrobeniusDuality.middle_symm`: `⟨x, y⟩_d = (−1)^d ⟨y, x⟩_d` on `H^d`.

- `TauCeti.GradedFrobeniusDuality.ofSmoothProper`: The datum of a smooth proper `X₀` of pure dimension `d` over `𝔽_q` (§§0.3–0.7:pairings), with `E = ℚ_ℓ`.

A proof proceeds as follows.

The data are linear algebra; the main instance is built from §§0.3–0.7's Poincaré duality: for `X₀` smooth
proper of pure dimension `d` over `𝔽_q` and `ℓ ∤ q, H^i := H^i(X, ℚ_ℓ), F_i :=` geometric Frobenius, `⟨x, y⟩_i := Tr(x ∪ y)` with the trace `H^{2d}(X, ℚ_ℓ) → ℚ_ℓ(−d)` composed with the identification of `ℚ_ℓ(−d)` on which `F` acts
by `q^d` (§0.5, §0.5, §0.6).

Graded commutativity of cup product gives the Koszul sign; equivariance of the trace under Frobenius gives the
similitude factor `q^d` (Weil `I` (2.5)).

A second instance: `X₀` proper of pure dimension `d` whose dualizing complex has a Frobenius-equivariant
isomorphism `a^!ℚ_ℓ ≅ ℚ_ℓ(d)[2d]` (a rational homology manifold), with the pairing from §0.5; this is the datum
WeilConjectures:WC.6/homology-manifold-weil-assembly needs.

Use [Deligne-WeilI-1974] (2.3)–(2.6), pp. 281–282.

*Needs:* §0.5; §0.6; `LinearMap.IsPerfPair`; `LinearMap.charpoly`.

**Checks.**


- `TauCeti.GradedFrobeniusDuality.zero_dim_point`: `d = 0, H⁰ = E, F = 1, ⟨1,1⟩ = 1: χ = 1, Δ = 1, P₀ = 1 − t`.

- `TauCeti.GradedFrobeniusDuality.projectiveLine`: The `ℙ¹` datum `(d = 1, F₀ = 1, F₂ = q)` has `χ = 2` and `Δ = q`, and `Δ² = q^{dχ} = q²`.

- `TauCeti.GradedFrobeniusDuality.not_datum_wrong_factor`: `H⁰ = H² = E` with `F₀ = 1, F₂ = 1` and `⟨1,1⟩ = 1, d = 1, q ≠ 1`, is not a datum: the similitude condition `⟨F₀x, F₂y⟩ = q⟨x, y⟩` fails.

- `TauCeti.GradedFrobeniusDuality.curve_betti_even`: For `d = 1` the form on `H¹` is alternating and perfect, so `b₁` is even (agreeing with Tau Ceti `LinearMap.BilinForm.IsAlt.even_finrank`).

- `ℙ¹` over `𝔽_q: H⁰ = E` with `F = 1, H² = E` with `F = q, ⟨1, 1⟩ = 1`; `d = 1, χ = 2, Δ = q`.

- A smooth projective curve of genus `g: H¹` of dimension `2g` with the alternating cup-product form and `F` a symplectic similitude of factor `q`.

**Reciprocity of Frobenius polynomials and the determinant relation.** For a graded Frobenius duality datum
(§8.2) of weight `(2d, q^d): (a) b_i = b_{2d−i}`; (b) for `0 ≤ i ≤ 2d, P_{2d−i}(t)·det(F_i) = (−q^d t)^{b_i}·P_i(1/(q^d t))` as an identity in `E(t)`, and the eigenvalues of `F_{2d−i}` with algebraic multiplicity
are the `q^d/α` for `α` those of `F_i`; (c) `det(F_i)·det(F_{2d−i}) = q^{d b_i}`; (d) if `d` is odd, `b_d` is even and
`det(F_d) = q^{d b_d/2}`; if `d` is even, `det(F_d) = (−1)^{m_−} q^{(d/2)·b_d} = (−1)^{b_d − m_+} q^{(d/2)·b_d}`,
where `m_±` is the algebraic multiplicity of `±q^{d/2}` as an eigenvalue of `F_d`; (e) `Δ² = q^{dχ}`, and `dχ` is even.
These are statements about the actual finite-dimensional spaces; no semisimplicity of Frobenius is assumed,
and no zeta function is defined here (WeilConjectures:WC.2 assembles the signed functional equation from
them). For `X₀` smooth proper over `𝔽_q` of pure dimension `d` and `E = ℚ_ℓ` (`ℓ ∤ q, ℓ = 2` allowed) these apply to
`H^i(X, ℚ_ℓ)` with geometric Frobenius, and likewise for proper rational homology manifolds.

Work with the following additional hypotheses. A graded Frobenius duality datum over a field of characteristic
0; for the geometric instances, the hypotheses of §§0.3–0.7:pairings (smooth proper) or a
Frobenius-equivariant isomorphism `a^!ℚ_ℓ ≅ ℚ_ℓ(d)[2d]` (homology manifold). For odd `d` the exponent `d·b_d/2` is
an integer because `b_d` is even. For even `d` use `(d/2)·b_d`; writing `d·(b_d/2)` would be incorrect when `b_d` is
odd.

Name the resulting statement `poincareReciprocityExport`. In `Suggested.lean`, `poincareReciprocityExport` states polynomial reciprocity in the rational-function field, complementary determinant products, both middle-degree sign formulas, `Δ² = q^{dχ}` and evenness of `dχ`. Its definitions `gradedEulerChar` and `gradedDelta` take the finite sum and alternating unit-group product over the integer interval `0 ≤ i ≤ 2d`. Give these numerical expressions invariance under degreewise linear equivalence, additivity of the Euler sum and multiplicativity of the determinant product under direct sums. The definition `frobPoly` is the reversed characteristic polynomial of an automorphism. The statement retains the specified perfect pairings, Koszul sign and multiplier without a semisimplicity assumption.

A proof proceeds as follows.

(a): the pairing `H^i × H^{2d−i} → E` is perfect.

(b), (c): apply DeligneWeightsAndPurity §0.16 to `V = H^i, W = H^{2d−i}, φ = F_i, ψ = F_{2d−i}, c = q^d: det(1 − tF_{2d−i}) = det(F_i)^{−1} det(F_i − q^d t)`, and `det(F_i − q^d t) = (−q^d t)^{b_i} det(1 − (q^d t)^{−1}F_i)`.

(d): the middle form is `(−1)^d`-symmetric (Koszul sign); apply §8.1 with `c = q^d` and `s = q^{d/2}` when `d` is
even.

(e): pairing `i` with `2d − i` (same parity), `Δ² = ∏_i (det F_i · det F_{2d−i})^{(−1)^i} = ∏_i q^{d b_i (−1)^i} = q^{dχ}`; `dχ` is even because `d` even, or `d` odd and `χ ≡ b_d ≡ 0 mod 2` after pairing the other degrees.

Use [Deligne-WeilI-1974] (2.4) and (2.6), pp. 281–282; [Milne-LEC] Remark 27.13 and Summary 27.14, p. 159.

*Needs:* DeligneWeightsAndPurity §0.16; §8.1; §0.5; §0.6.

**Checks.**


- `ℙ¹: P₂(t)·det(F₀) = 1 − qt = (−qt)·(1 − 1/(qt)) = (−qt)·P₀(1/(qt))`; `Δ = q, χ = 2, Δ² = q²`.

- A curve of genus `g: det(F₁) = q^g` (alternating middle form), `Δ = 1 · q^{−g} · q = q^{1−g}, χ = 2 − 2g` and `Δ² = q^{2−2g} = q^{dχ}`.

- A smooth quadric surface over `𝔽_q (d = 2)` whose two rulings are swapped by Frobenius: `F` on `H² = ℚ_ℓ(−1)²` has eigenvalues `q` and `−q, m_− = 1`, so `det(F₂) = −q²`, the sign that the split quadric (eigenvalue `q` twice) does not have.

- Identity Frobenius in every degree gives `gradedDelta = 1`, including zero-dimensional vector spaces; a one-dimensional degree-one factor with determinant a contributes `a⁻¹`, fixing the alternating sign.

- For the numerical definitions alone, zero Betti numbers give `χ = 0` and three rank-one degrees 0,1,2 give `χ = 1`. Scalar automorphisms 2,3,5 on those three degrees give `Δ = 2·3⁻¹·5 = 10/3`. For `d = 0` and a single rank-one space with automorphism `q, Δ = q`. These test the actual alternating product and its endpoints; the arbitrary scalar triple is not claimed to satisfy Poincaré duality.

### Examples

For `P¹, d=1, b₀=b₂=1, b₁=0, F₀=1` and `F₂=q`. Thus `χ=2, Δ=q` and `P₂(t)=1−qt`, giving `Δ²=q²`. The zero vector space has determinant and characteristic power series 1. In odd middle degree the alternating form forces even dimension, including when the coefficient field is `Q₂`.

### Dependencies

Layer 0 for geometric examples; Mathlib finite-dimensional linear algebra, generalized eigenspaces, determinants and characteristic polynomials; DeligneWeightsAndPurity §0 for scalar spectral compatibility.

## Downstream consumers

GeometricSatakeAndFusion and the proposed stack and perfect-space extensions use intersection complexes and decomposition. LefschetzPencilsAndVanishingCycles uses the finite/integral Lefschetz and blow-up refinements. WeilConjectures uses the graded reciprocal-polynomial and determinant identities. This roadmap owns scheme pure decomposition (`pureComplexGeometricSplitting`, `decompositionTheorem`), relative perverse Lefschetz (`relativeHardLefschetzTheorem`) and general cohomological-correspondence local terms (`fujiwaraVarshavskyTraceFormula` and §6.3). EndoscopicTransferAndUnitaryTraceComparison §§3.14a,7.10a uses these interfaces for its applications; scheme-level shtuka constructions also use the correspondence and local-term API; stack applications first require the separate stack formalism.

## References

- **[Angeniol-1976]** B. Angéniol, [Théorème de finitude en cohomologie étale (d’après P. Deligne)](https://www.numdam.org/article/AST_1976__36-37__152_0.pdf). Astérisque 36–37 (1976), pp. 152–162; Numdam public scan.

- **[BBD-1982]** A. A. Beilinson, J. Bernstein, P. Deligne, [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf). Astérisque 100 (1982), 5–171; Numdam scan (printed page = PDF page − 1).

- **[Bhatt-Scholze-proetale-2015]** Bhargav Bhatt, Peter Scholze, [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2). arXiv 1309.1198v2 (2014); published Astérisque 369 (2015).

- **[Deligne-WeilI-1974]** P. Deligne, [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf). Publ. Math. IHÉS 43 (1974), 273–307 (Numdam).

- **[Deligne-WeilII-1980]** P. Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf). Publ. Math. IHÉS 52 (1980), 137–252 (Numdam).

- **[Dimca-2004]** Alexandru Dimca, Sheaves in Topology. Universitext, Springer, 2004.

- **[ECD-2026]** Peter Scholze, [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf). Author manuscript dated 14 April 2026; manuscript pagination.

- **[Grothendieck-Chern-1958]** Alexander Grothendieck, [La théorie des classes de Chern](https://www.numdam.org/article/BSMF_1958__86__137_0.pdf). Bull. Soc. Math. France 86 (1958), 137–154; Numdam scan.

- **[Hansen-Kaletha-Weinstein-2022]** D. Hansen, T. Kaletha, J. Weinstein, [On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/pdf/1709.06651v4). Forum Math. Pi 10 (2022); arXiv:1709.06651v4.

- **[Huber-1996]** Roland Huber, [Étale Cohomology of Rigid Analytic Varieties and Adic Spaces](https://doi.org/10.1007/978-3-663-09991-8). Aspects of Mathematics E30, Vieweg (1996).

- **[Jantzen-2003]** J. C. Jantzen, Representations of Algebraic Groups. 2nd edition, Mathematical Surveys and Monographs 107, AMS (2003).

- **[Juteau-2009]** D. Juteau, [Correspondance de Springer modulaire et matrices de décomposition (Modular Springer correspondence and decomposition matrices)](https://arxiv.org/pdf/0901.3671v1). Thèse de doctorat, Université Paris 7 (2007); arXiv:0901.3671v1.

- **[Katz-ACT-1993]** Nicholas M. Katz, [Affine cohomological transforms, perversity, and monodromy](https://web.math.princeton.edu/~nmk/old/ACT.pdf). J. Amer. Math. Soc. 6 (1993), no. 1, 149–222; author-hosted scan of the published article.

- **[Katz-BettiSum-2001]** Nicholas M. Katz, [Sums of Betti numbers in arbitrary characteristic](https://web.math.princeton.edu/~nmk/BettiSum14.pdf). Author manuscript; published Finite Fields Appl. 7 (2001), 29–44.

- **[Liu-Tian-Xiao-Zhang-Zhu-2022]** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4). Inventiones Mathematicae 228 (2022), 107–375.

- **[Lu-Zheng-2022]** Q. Lu, W. Zheng, [Categorical traces and a relative Lefschetz–Verdier formula](https://arxiv.org/pdf/2005.08522v4). Forum Math. Sigma 10 (2022); arXiv:2005.08522v4.

- **[Milne-AG-2017]** J. S. Milne, [Algebraic Groups](https://www.jmilne.org/math/Books/iAG2017.pdf). Cambridge Studies in Advanced Mathematics 170 (2017), author version; Theorem 12.9 and §12(e).

- **[Milne-LEC]** J. S. Milne, [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf). Version 2.21, 22 March 2013 (202 pages; printed page = PDF page).

- **[SGA4-XIV]** M. Artin, [SGA 4, Exposé XIV: Théorème de finitude pour un morphisme propre; dimension cohomologique des schémas algébriques affines](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf). Retyped edition of LNM 305 (version 71766d9, 2024), with LNM page numbers in the margin.

- **[SGA4-XVII]** P. Deligne, [Exposé XVII. Cohomologie étale à supports propres](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf). SGA 4, tome 3, Lecture Notes in Mathematics 305 (Springer, 1973); retyped edition of the SGA 4 re-edition project (2024).

- **[SGA4-XVIII]** P. Deligne, [Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf). SGA 4, tome 3, Lecture Notes in Mathematics 305 (Springer, 1973); retyped edition of the SGA 4 re-edition project, version 71766d9 of 30 July 2024 (LNM page numbers in the margin).

- **[SGA4half]** Pierre Deligne, with contributions by J.-F. Boutot, A. Grothendieck, L. Illusie and J.-L. Verdier, [Cohomologie étale (SGA 4½)](https://publications.ias.edu/sites/default/files/Number32.pdf). Lecture Notes in Mathematics 569 (1977), IAS public scan.

- **[Stacks]** The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). Online, tags.

- **[Stacks-MoreEtale]** The Stacks Project Authors, [The Stacks Project, Chapter 'More Étale Cohomology' (tag 0F4U)](https://stacks.math.columbia.edu/download/more-etale.pdf). Chapter PDF, version ed88ff78 compiled 14 July 2026.

- **[Stacks-Morphisms]** The Stacks Project Authors, [The Stacks Project, Chapter 29: Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf). Version ed88ff78 (compiled 14 July 2026).

- **[TCR-AdicCoefficientsAndComparisons]** TauCetiRoadmap contributors, Adic coefficients and comparison with schemes. README.md, version 4a7b4d83e2622df066e2a883525bb755bce6b115.

- **[TCR-AutomorphicLFunctionsAndLocalFactors]** TauCetiRoadmap contributors, [Automorphic L-functions and local factors](../AutomorphicLFunctionsAndLocalFactors/README.md#normalized-scheme-ic-purity). README.md, AL.3, `normalized-scheme-ic-purity`, version d1996dc1edb1a6f095caec7bd8768245888b7a7c.

- **[TCR-CharacteristicClasses]** TauCetiRoadmap contributors, *Characteristic classes* (the CharacteristicClasses roadmap), C2.1–C2.4.

- **[TCR-ClassicalAdicEtaleCohomology]** TauCetiRoadmap contributors, Classical analytic étale cohomology. README.md, version cd2cc07b343892659c939ce98f41f8b21aa2f9ae.

- **[TCR-ComplexComparisonPartII]** TauCetiRoadmap contributors, Complex comparison, part II. README, version 654c956cf2e193efd94e91816658b2fcd1ffb8d8.

- **[TCR-DeligneWeightsAndPurity]** TauCetiRoadmap contributors, Deligne weights, purity and the Weil bounds. README.md, version 5f713c436ee303ceb25938d815e236b1a2c3d09a.

- **[TCR-EnhancedDerivedSheaves]** TauCetiRoadmap contributors, Enhanced derived categories of sheaves. README.md, version ba9de88d837c1973a006cfaa2861b39410ddcba6.

- **[TCR-EtaleCohomologyFoundations]** TauCetiRoadmap contributors, Étale cohomology foundations. README.md, version 651c49797943811c7dd6d8ab4b5771b7ede1ec0d.

- **[TCR-GL2AutomorphicRepresentationsAndTransfer]** TauCetiRoadmap contributors,
  [GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md),
  R17.6.3a–R17.6.3b, version b4365ef.

- **[TCR-LefschetzPencilsAndVanishingCycles]** TauCetiRoadmap contributors, Lefschetz pencils, nearby cycles and vanishing cycles. README.md, version 4c7deab75898820bcc1fedd1db4df1010cfc2303.

- **[TCR-SchemeAndStackFoundations]** TauCetiRoadmap contributors, Scheme and stack foundations. README.md, version d2081398eedfbd4153d3067aa98a21b5a5270957.

- **[Varshavsky-LV-2007]** Y. Varshavsky, [Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2). Geom. Funct. Anal. 17 (2007); arXiv:math/0505564v2.

- **[Varshavsky-LocalTerms-2020]** Y. Varshavsky, [Local terms for transversal intersections](https://arxiv.org/pdf/2003.06815v3). arXiv:2003.06815v3.

- **[Varshavsky-LocalTerms-2023]** Yakov Varshavsky, [Local terms for transversal intersections](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AD273B3043D9AADF4A522F51F1178575/S0010437X23007091a.pdf/local-terms-for-transversal-intersections.pdf). Compositio Mathematica 159 (2023), pp.985–1004, DOI 10.1112/S0010437X23007091.

- **[Verdier-1983]** J.-L. Verdier, [Spécialisation de faisceaux et monodromie modérée](https://www.numdam.org/item/AST_1983__101-102__332_0.pdf). Astérisque 101–102 (1983), pp.332–364.

- **[Yu-2023]** Hongjie Yu, [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5). Annals of Mathematics 197 (2023), 423-531.

- **[Yun-Zhang-2019]** Z. Yun, W. Zhang, [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf). Ann. of Math. 189 (2019), no. 2, 393–526 (published version, author copy).

- **[Zhu-2017]** X. Zhu, [Affine Grassmannians and the geometric Satake in mixed characteristic](https://arxiv.org/pdf/1407.8519v3). Ann. of Math. 185 (2017), no. 2; arXiv:1407.8519v3.

- **[deCataldo-Migliorini-2009]** M. A. de Cataldo, L. Migliorini, [The decomposition theorem, perverse sheaves and the topology of algebraic maps](https://arxiv.org/pdf/0712.0349v2). Bull. AMS 46 (2009); arXiv:0712.0349v2.
