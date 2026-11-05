# Roadmap: topological mirror symmetry for Hitchin systems

**Summary.** Build character Hodge realizations and twisted stringy invariants, principal gerbe-splitting torsors, and abstract dual Hitchin systems; specialize them to stable trace-free SLn and PGLn Higgs moduli. The end theorems identify the ordinary SL E-polynomial with the powered-gerbe stringy PGL E-polynomial, their finite-field counts and character-isotypic traces, and canonical-twist Hodge numbers. Degree independence, Prym duality, arithmetic mirror integration and the stronger fibrewise Galois comparison are separate theorems of the library.

## Scope and ownership

This roadmap owns character and fractional realizations, stringy invariants, arithmeticity of relative gerbes, principal splitting torsors, abstract dual Hitchin systems and their integration comparison, and the relative general-D trace-free chosen-determinant SL/PGL specialization. Its stable moduli construction differs from the canonical GL construction by its general twist, determinant isomorphism, trace condition and μn-rigidification. Its Prym results identify the spectral pairings and actions, rather than construct generic abelian duals.

Generic bundles, tensor operations and determinants are supplied by TauCetiRoadmap.AlgebraicVectorBundles L0B–L0C. Line bundles and their dual tensor classes are already in the library; no replacement Picard carrier is built. TauCetiRoadmap.JacobianChallenge Layers A–E supplies curve cohomology, relative Picard functors and Jacobians. TauCetiRoadmap.SchemeAndStackFoundations §§1.15–1.16, 2.15, 3.4–3.7 owns torsors, contracted products, Hochschild–Serre and Picard–Brauer descent. TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.5, 4.9, 4.20, 5.1 owns quotient inertia, coherent gerbe transgression, banded gerbes, neutralizations, Isom torsors, classification, change of band and rigidification; these are imported, never reconstructed.

TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, A3.2–A3.7 owns dual abelian schemes, normalized Poincaré bundles, finite-flat quotients, multiplication degrees and Weil pairings. TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14 owns general Higgs stacks, spectral covers, regular centralizers and Picard actions. TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §§7.1, 7.3 and 9.1 owns canonical GL stability, coarse moduli, properness and purity. The general-D/fixed-determinant extensions are the exact contracts below, rather than repetitions of those targets.

The completed TauCetiRoadmap.HodgeStructures linear-algebraic theory supplies abstract mixed Hodge structures, Tate objects and strictness. TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory Layers H.0, H.1 and P supply the compact-support mixed Hodge realization of smooth quasi-projective complex varieties with Hodge-module coefficients, its point comparison, strictness, localization and Künneth; its extension to separated varieties with finite-monodromy coefficients and character projectors, and the unitary-family comparison, are separate supplier contracts. TauCetiRoadmap.MotivesAndAlgebraicCycles §4.20 supplies the scissor ring K₀Var k, its universal property and the Lefschetz class; its finite-group equivariant extension is the contract below. TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.11–2.12 supplies general local-field integration. Generic orbifold integration extends the AlgebraicModuliForArithmeticGeometry §4.5 transgression through the EndoscopicTransferAndUnitaryTraceComparison contract. Local Tate duality remains with TauCetiRoadmap.ArithmeticGaloisDuality D7.6; Frobenius density and semisimple character recognition remain with TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8, 5.1–5.3. Generic finite Fourier orthogonality is already in the library and is applied only in §5.6.

The full genus range is part of the theorem. Low-genus calculations in §3.9, with their gerbe sectors in §4.8, replace a nonexistent generic stable spectral torsor where necessary. The actual Galois isomorphism of §5.4 is a distinct target and is not inferred from its virtual-character consequence. The literal μr-neutrality condition of GWZ20 Definition 6.9 (both μr-gerbes on two regular fibres are neutral exactly when both fibres have points) is not a target of this roadmap: every comparison here uses the sufficient local Brauer condition of §2.2, which that condition implies, and no Brauer-to-μr converse is asserted.

## Conventions

Curves are smooth projective and geometrically connected. In families they are smooth proper over a noetherian base with a verified relative polarization. Rank n is a positive integer, invertible on the base; determinant degrees d,e are integers prime to n. For the main comparison D⊗ω⁻¹ has strictly positive degree or is trivial; no parity of deg D is assumed there. The SL degree comparisons of §§4.2–4.3 assume no parity of (n−1)deg D either; their degree-zero correction line is chosen according to the parity of n. This permits every genus: a dimension formula on a nonempty locus never licenses a negative-dimensional space.

All sheaves and group schemes use explicit universes determined by the scheme/site carrier; scalar extensions preserve the chosen universe. Hodge dimensions use rational or complex coefficients, finite-group projectors use characteristic-zero splitting coefficients, and étale traces use a finite extension of ℚℓ inside ℚ̄ℓ with ℓ different from the residue characteristic. Only a finite list of fractional twists needs one finite coefficient extension.

Write M_SL^L for the μn-rigidification of stable trace-free D-Higgs bundles with a chosen determinant isomorphism det E≃L. Write Γ=J_X[n], of geometric rank n^(2g), and M_PGL^d=[M_SL^L/Γ] for the stack, separately from its coarse quotient. Make Γ constant by the specified finite étale base change when arithmetic labels require it. The gerbe admissibility bound is μ_(n|Γ|)=μ_(n^(2g+1)). For n=2,g=2 these orders are 16 and 32.

Use compact supports and geometric Frobenius. The symbol * in cohomology denotes the alternating class; §5.4 instead writes an explicit direct sum and forgets cohomological grading. The projector for χ is |G|⁻¹Σ_g χ(g)⁻¹g. Stack traces sum over every rational torsor class with reciprocal automorphism order. A trivial-action point over 𝔽₃ with C₂ symmetry has mass 1/2+1/2=1; its sign-character mass is 1/2−1/2=0.

The Lefschetz symbol ℒ is reserved for [A¹] with trivial group action; L denotes a determinant line. ℒ^a corresponds to the negative Tate twist ℚ̄ℓ(−a), eigenvalue q^a and Hodge bidegree (a,a). Thus H_c²(A¹)=ℚℓ(−1) gives E(A¹)=xy and count q. Compatible nonzero roots satisfy s₁=q and s_(rr′)^r=s_r′ for positive r,r′. Positive real roots define stringy counts; comparisons explicitly transport root and character choices. A prime power is at least 2; q=1 is not a residue-field input, and no formula uses s₀.

For an order-r tangent eigenvalue exp(2πic/r), 0≤c<r, age is the sum of c/r. In relative dimension m set w(γ)=m−F(γ⁻¹). One eigenvalue −1 in dimension one has F=1/2 and w=1/2. The stringy/integral comparison uses the complex conjugate of fα(x)=exp(2πi inv(x*β)); the primitive cube-root phase is changed to its inverse. Invariant top forms use a base form before the fibre form: dt∧θ. An integral unit changes density by 1, whereas a uniformizer changes it by q⁻¹.

For a degree-n spectral cover π:Y→X put M=det π_*O_Y=D^(−n(n−1)/2) and Nm(B)=det π_*B⊗M⁻¹. Hence the fixed-determinant norm target is L⊗M⁻¹. At n=2 it is LD, and the square torsor has determinant label L²D. The two-term Higgs deformation complex has degrees 0,1, with differential u↦θu−(u⊗1)θ; automorphisms, tangents and obstructions have hypercohomological degrees 0,1,2. For diagonal θ=diag(a,b), the off-diagonal matrix unit E₁₂ maps to (a−b)E₁₂.

The normalized Weil pairing uses χγ(ν)=(ν,γ). The determinant label is ν=δ(L Lν⁻¹), so twisted geometric Frobenius is ν⁻¹Fr. For C₃, (ν,γ)=ζ^(νγ) and (1/3)Σν ζ^(νγ)ζ^(−νδ) is 1 at δ=γ and 0 otherwise. Local reciprocity uses the ClassFieldTheory arithmetic-Frobenius convention before passing to geometric-Frobenius cohomology. The tame generator is determined by σ(π)/π and the chosen primitive root, not by applying reciprocity to that root.

## Exact supplier contracts

### From Mathlib

Use `AddMonoidAlgebra` in `Mathlib/Algebra/MonoidAlgebra/Defs.lean` for finitely supported rational bidegrees, with coefficient ring ℤ and exponent group ℚ×ℚ. It supplies the convolution algebra, not the realization of a variety. Use `sum_hom_units_eq_zero` in `Mathlib/RingTheory/IntegralDomain.lean` for the sum of a nontrivial multiplicative character on a finite group into a domain. Use `Matrix.trace` in `Mathlib/LinearAlgebra/Matrix/Trace.lean` for the diagonal sum; the rank-two Jordan witness in §5.4 uses it without importing a semisimplicity assertion.

### From Tau Ceti

Use `TauCeti.Hodge.MixedHodgeStructure` in `TauCeti/Geometry/Hodge/Mixed/Basic.lean`: rational increasing weight filtration, bounded decreasing Hodge filtration and pure graded pieces on specified integral/rational/complex base-change models. It is abstract filtration data. Use `TauCeti.Hodge.tate_hodgeNumber` in `TauCeti/Geometry/Hodge/Tate/Basic.lean`: the sole Tate Hodge number of ℤ(m) is at p=−m.

Use `TauCeti.AlgebraicGeometry.InvertibleSheaf` in `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, and `TauCeti.AlgebraicGeometry.LineBundleClass` with `TauCeti.AlgebraicGeometry.LineBundleClass.inv_mk` in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`. Tensor product, trivial bundle and dual give its commutative group. Use `TauCeti.AlgebraicGeometry.AbelianVariety` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`: a proper geometrically integral group object over a field; relative duality is the abelian-scheme contract below.

Use `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` in `TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean` and `TauCeti.AlgebraicGeometry.rigidifiedPicardPoint` in `TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean` for pointed-family rigidified line-bundle classes and their trivial class. These are functorial classes on a morphism with a chosen section; represented Picτ and dual abelian schemes require the Picard contracts.

Use `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` in `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean` over a finite commutative group G and a commutative domain M with enough roots of unity of order the exponent of G (`HasEnoughRootsOfUnity M (Monoid.exponent G)`); no characteristic hypothesis is made there, and this roadmap applies it with M=ℚ̄ℓ. The sum of χ(σ)⁻¹χ(g) over all characters is |G| at g=σ and 0 otherwise. No replacement character-orthogonality theorem is a target here.

Use `TauCeti.subsingleton_brauerGroup_of_finite` in `TauCeti/Algebra/BrauerGroup/Trivial.lean`: the Brauer group of a finite field is trivial. With SchemeAndStackFoundations §2.22 it gives Br(O_F)=0 for the complete discrete valuation rings of §§1.4 and 4.6.

### From TauCetiRoadmap.HodgeStructures

Consume the completed roadmap’s Core definitions, Layers L2–L3 and weight-one instances for abstract mixed structures, strictness and Tate normalization. Family unitary splittings require the following extension of that direction; the geometric compact-support realization is imported from MixedHodgeModulesAndIrregularHodgeTheory below.

What HodgeStructures must provide (gap:unitary-splitting-families): Provide the rank-one flat-unitary-line/Pic0 equivalence in smooth projective complex families and its coherent action on the common finite splitting torsor.

### From TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory

Consume H.0/mixed-hodge-module and H.0/abelian-strictness for the abelian category of admissible graded-polarizable mixed Hodge modules on a smooth quasi-projective complex variety, strictness of its morphisms for F and W, and the identification of its point category with graded-polarizable rational mixed Hodge structures on `TauCeti.Hodge.MixedHodgeStructure`; H.1/operations and H.1/weight-bounds for the six operations, Tate twists, the open/closed localization triangles and the weight bounds of f_!; P/pair-cohomology at f=0 for the compact-support mixed Hodge structures H_c^r(U,N) of a smooth quasi-projective U with Hodge-module coefficients N; and P/pair-kunneth-duality at f=g=0 for Künneth and Poincaré duality with the twist (−d). Over 𝔾_m these give H_c¹=ℚ(0) and H_c²=ℚ(−1), hence E=xy−1; over 𝔸¹ they give H_c²=ℚ(−1) and E=xy. A finite-monodromy rational local system is the admissible variation of weight zero with trivial Hodge filtration; its character eigenspaces exist only after extending coefficients to the character field, which is part of the adapter requested below. Singular varieties enter only through closed supports in a smooth quasi-projective ambient variety; general separated varieties are the extension below.

What MixedHodgeModulesAndIrregularHodgeTheory must provide (gap:geometric-compact-mhs): Extend the compact-support Hodge realization of P/pair-cohomology from smooth quasi-projective varieties to separated finite-type complex varieties, by local embeddings into smooth varieties or by descent along closed/open stratifications into smooth quasi-projective pieces, with functoriality for proper maps and open immersions, SNC blow-up comparison, coefficient extension to the character field, finite-group character projectors and finite-monodromy coefficient adapters, all compatible with its rational mixed-Hodge carrier on the pinned mixed Hodge structures.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §§3.6, 3.8, 3.10, 3.12–3.14 for Higgs stacks, spectral covers, regular centralizers, Picard actions and their actual anisotropic/codimension hypotheses. Section 3.16 supplies the finite-stabilizer weighted trace in its anisotropic Hitchin setting. The general finite-quotient local-system trace extends that setting through the following contracts. Consume AlgebraicModuliForArithmeticGeometry §4.5 for generic transgression on the action groupoid, with Lγ⊗γ*Lδ→Lγδ, its unit and associativity, and coherent centralizer descent; use the separate finite-quotient stack trace contract for weighted traces.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:generic-orbifold-transgression): Extend AlgebraicModuliForArithmeticGeometry §4.5 quotient inertia and coherent gerbe transgression, using the finite-quotient stack trace contract, by tangent age and normalized orbifold integration, the μ_(r|Γ|) Hasse and band-change comparison, integral-to-special-fibre cocycle compatibility, and arithmetic descent with Frobenius sector permutation for nonsplit finite étale commutative acting group schemes.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-hitchin-picard): Extend Higgs stacks, spectral module equivalence, regular centralizers, relative Picard actions and codimension estimates to the noetherian smooth-curve general-D stable fixed-determinant families and singular spectral fibres used here.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Consume §4.20 for the scissor ring K₀Var k of separated finite-type k-schemes with the relations [X]=[Z]+[X∖Z] for closed immersions, the product, the universal property for additive multiplicative invariants and 𝕃=[𝔸¹]; it is defined over any field and makes no blow-up presentation. The G=1 realizations of §§0.1–0.3 are additive maps out of this ring, and ℒ of §0.2 is 𝕃 with trivial action. Its spread-out version over a finite-type R⊂ℂ for a finite list of varieties, and its finite-group equivariant extension with the Bittner presentation (BITTNER04 §7, Lemma 7.1, line 812), are the contract below.

What MotivesAndAlgebraicCycles must provide (gap:equivariant-grothendieck): Extend the scissor ring K₀Var k of §4.20 to the ring K₀^G(Var_k) of varieties with a good action of a finite group G (every orbit in an affine open), over any field k and, for a finite list of varieties spread out from ℂ, over a subring R⊂ℂ of finite type over ℤ; give the closed/open relations, the product, the class ℒ=[𝔸¹ with trivial action] and the universal property for additive multiplicative equivariant invariants; for k of characteristic zero prove the equivariant Bittner presentation by smooth projective G-varieties with the blow-up relation, from equivariant SNC compactification and equivariant weak factorization; keep this ring distinct from its quotient by the representation ideal and from the additive character realizations.

### From TauCetiRoadmap.LogicAndDefinabilityInNumberTheory

Consume §§2.5, 2.7–2.9 and 2.12 for analytic substitution, gauge measures, positive-codimension nullity, Weil volume and base-first Fubini over every nonarchimedean local field, including equal characteristic; §2.11 supplies dual-abelian prime-to-p isogeny volume invariance.

### From TauCetiRoadmap.CohomologyComparisons

Consume §2.15 Hodge–Tate degeneration for proper smooth objects, with the negative twist on H^a(Ω^b) in total degree a+b. Its P¹ degree-two term is ℚp(−1). The following extension supplies number-field and character/fractional compatibility.

What CohomologyComparisons must provide (gap:fractional-equivariant-hodge-tate): Provide finite-group-equivariant smooth-proper number-field Hodge–Tate comparison, constancy of character Hodge numbers on a smooth connected complex base and Ito additive rational-period multiplicities for finite sets of fractional twists.

### From TauCetiRoadmap.ArithmeticGaloisDuality

Consume D7.6, paragraphs “Local abelian-variety duality and gerbe evaluation” and “Self-dual isogenies and their local index”. For characteristic-zero local F these give the continuous pairing A(F)×H¹(F,A∨)→ℚ/ℤ, its gerbe-evaluation square, and |coker φ(F)|=|ker φ(F)| for a self-dual isogeny of degree prime to the residue characteristic. The equal-characteristic branch is a separate contract.

What ArithmeticGaloisDuality must provide (gap:equal-characteristic-abelian-duality): Extend the normalized abelian local Tate pairing, gerbe evaluation, isogeny connecting-map adjunction and self-dual prime-to-p index formula to equal-characteristic local fields k((t)).

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume §§A1.3, A1.5, A2.2–A2.3, A3.2–A3.3, A3.5, A3.7 for invariant differentials, the theorem of the cube, normalized Poincaré duality, finite-flat quotients, dual-isogeny kernels and the polarized Weil pairing. Multiplication by n has degree n^(2g), and is étale when n is a unit. The norm/pullback adapters are specified below; relative Picτ itself is imported from ComplexComparisonPartII.

What AbelianSchemesAndArithmeticModuli must provide (gap:relative-picard-norm-duality): Provide the Pic0 identification of relative Picτ with the dual abelian scheme on abelian-scheme torsors, norm-pullback Poincaré duality and represented spectral norm kernels and finite quotients with the required smoothness and base change.

### From TauCetiRoadmap.ComplexComparisonPartII

Consume §C3.2e, `picardTorsionComponent`, for relative Picτ: for a locally noetherian base and a flat morphism, projective Zariski-locally on the base, with geometrically integral fibres, Picτ is an open and closed subgroup scheme of finite type of the relative Picard scheme and commutes with locally noetherian base change. The smooth projective geometrically connected families of §§1.3–1.5 satisfy these hypotheses. Consume §C3.2f.1, `picardZeroSheaf`, for the identity-component subsheaf Pic0 and its fibrewise characterization. For an elliptic curve E over a field the imported Picτ is Pic0≅E∨, and for ℙ¹ it is 0; no second Picτ is constructed here.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Consume §§1.3, 2.1–2.2 for Quot/Hilbert parameters; §4.5, `quotientGerbeTransgression` and `quotientInertiaComponents`, for coherent centralizer descent of equivariant commutative-banded gerbes and the conjugacy-class inertia decomposition for every finite constant group; §§4.1–4.3, 4.9, 4.20 for banded gerbes, neutralizations, Isom torsors and H² classification; §5.1 for rigidification and its base-change property; §§7.3, 7.6.1 for Picard representability; §§9.4–9.5, 9.7 for characteristic-zero equivariant resolution and SNC compactification. A finite quotient, an algebraic mapping stack, and proper stable-Higgs coarse moduli are different conclusions.

What AlgebraicModuliForArithmeticGeometry must provide (gap:relative-higgs-git-properness): Provide relative stable general-D Higgs parameter spaces and GIT coarse moduli for projective smooth curve families, with separatedness, quasiprojectivity, semistable Hitchin properness, relative deformation theory and liftability of curves and chosen line bundles.

What AlgebraicModuliForArithmeticGeometry must provide (gap:smooth-stack-hartogs): Extend an invertible-sheaf trivialization uniquely across a complement of codimension at least two on a smooth normal locally noetherian algebraic stack, compatibly with restriction to smooth charts.

What AlgebraicModuliForArithmeticGeometry must provide (gap:relative-gerbe-splitting-representability): Provide algebraic relative stacks of Gₘ- and μr-neutralizations for arithmetic gerbes on proper geometrically connected degree-zero-cohomologically-flat families in the Picard representability domain, with r invertible for μr, the Picard-stack or μr-torsor-stack action, algebraic-space representability of rigidified Pic[r]-torsors and base change, using the existing gerbe and rigidification APIs.

### From TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves

Consume §7.1 for canonical GL stability, §7.3 for the canonical coarse moduli and proper Hitchin morphism, and §9.1 for purity of canonical coprime GL compact cohomology. The general-D, fixed-determinant and finite-character extensions below retain the same stability notion.

What CountingBundlesAndHallAlgebrasOfCurves must provide (gap:higgs-sector-purity): Extend canonical GL Higgs purity to complex general-D semiprojective fixed-determinant spaces and canonical finite-order fixed loci with their finite splitting-torsor covers, compatibly with geometric mixed Hodge structures and character projectors.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Consume §§3.7, 6.3–6.4 for coefficient-compatible traces, proper pushforward and invariant decompositions, together with TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7 for proper base change, lower shriek, compact supports and Künneth, and §§F.4.2–F.4.6 for bounded finite-dimensional rational realization and continuous Galois actions. F.5–F.7 supply duality, smooth purity/trace normalization and blow-up comparisons, respectively; F.2.5 alone asserts no finiteness. Finite stack traces require the following contract.

What EtaleDualityAndPerverseSheaves must provide (gap:finite-quotient-stack-trace): Provide bounded compact cohomology with characteristic-zero ℓ-adic coefficients, ℓ invertible, proper base change and geometric-Frobenius trace for finite-monodromy sheaves on quotients of separated finite-type schemes by finite étale group schemes, including stabilizer orders divisible by the residue characteristic, with every rational torsor class weighted by its reciprocal automorphism order.

The finite group order is invertible in the ℓ-adic coefficient field, so averaging over the group is exact there and no tameness is needed for this trace formula; tameness is kept only where ages and orbifold integrals enter (§§0.6–0.8, Layer 2). For the trivial action of C₂ on Spec 𝔽₂ the weighted sum over the two rational C₂-torsors is 1/2+1/2=1, the trace of Frobenius on H⁰ of the point, although BC₂ is not tame in characteristic 2.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§1.7–1.8 for characteristic-zero semisimplification and Brauer–Nesbitt, and §§5.1–5.3 for number-field Frobenius density and recognition on a dense subset. Equality of all traces determines a virtual class or semisimplification; no arithmetic semisimplicity or separation of degrees of a singular fibre follows.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Consume §7.15 for purity of proper smooth cohomology, with finite-group idempotents commuting with Frobenius. Weight-degree separation is applied to smooth proper summands in the Grothendieck group. §§7.8, 7.12 supply weight bounds, not purity of every ordinary-degree stalk of a pure direct image.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §§0.6, 1.15–1.16, 1.20–1.23, 2.11, 2.15, 2.22, 3.4–3.7 and 4.6: reflexive Hartogs, torsor classes, contracted products, inertia and finite quotients, Kummer, Hochschild–Serre, Azumaya/Brauer classes, Picard groupoids and norm, Picard–Brauer descent and deformations of curves and lines. The low-degree sequence used in §1.4 is middle-exact: neither Br(K)→Br(X) injective nor the final edge map surjective is presumed without its extra hypothesis. The stack extension of Hartogs is the explicit moduli contract above.

### From TauCetiRoadmap.JacobianChallenge

Consume Layers A–E: tensor/Picard operations and degree; Riemann–Roch and Serre duality; relative coherent cohomology and base change; relative Picard functor, Jacobian and line-bundle obstruction; abelian varieties. A rational point of a Picard degree component is converted into an actual line bundle using its Brauer obstruction; over a finite field that obstruction vanishes. Lang’s vanishing used in §3.5 is supplied by TauCetiRoadmap.ReductiveGroupsPartII §RG2.3.7, applied to the connected Jacobian.

### From TauCetiRoadmap.AlgebraicVectorBundles

Consume L0B–L0C for finite locally free sheaves on the curve, tensor and exterior operations and determinant. The determinant identity for a finite locally free spectral pushforward uses these operations on X, not on the parameter scheme.

### From TauCetiRoadmap.ClassFieldTheory

Consume Layer 5 for the normalized local invariant Br(F)→ℚ/ℤ and Kummer cup-product evaluation. The vanishing Br(O_F)=0 for a complete discrete valuation ring O_F with finite residue field k is not part of that layer: it is SchemeAndStackFoundations §2.22, `brauer_henselian_local` (O_F is henselian, so Br(O_F)→Br(k) is an isomorphism), followed by Tau Ceti `TauCeti.subsingleton_brauerGroup_of_finite` for the finite field k. Layers 6–7 fix arithmetic local reciprocity. For a cyclic tame inertia group I of order e≥1, viewed as a constant group over a base S on which e is invertible, the general inputs are the Kummer sequence 0→Pic(BI_S)/e→H²(BI_S,μe)→H²(BI_S,Gₘ)[e]→0 and, over a field K, the Hochschild–Serre spectral sequence H^a(K,H^b(I,μe))⇒H^(a+b)(BI_K,μe) of the Galois covering BI_(K^s)→BI_K; no cardinality is asserted over a general base. Over the finite residue field k=𝔽q of O_F with e dividing q−1, so that e is prime to the characteristic and μe⊂k, the spectral sequence has only the columns a=0,1, its degree-two terms H⁰(k,H²(I,μe)) and H¹(k,Hom(I,μe)) are cyclic of order e, and H²(k,μe)=0. Hence |H²(BI_k,μe)|=e², |Pic(BI_k)/e|=|Hom(I,k×)|=e and |H²(BI_k,Gₘ)[e]|=e. Over C, over F itself, or over 𝔽q with e not dividing q−1 these orders differ; the Checks of §1.1 compute them. The gerbe/torsor comparison retains H¹(F,A∨[r]) and its Pic/r contribution, rather than replacing it by r-torsion Brauer classes alone.

The generic orbifold contract uses an ordinary top exterior form before taking its rth tensor power, an unramified enlargement when a tame extension does not split, and the residue character of σ(π)/π. Its integral generic-to-special-fibre comparison tracks the coboundary between field-valued and integral unit-valued splittings. Its μr Hasse/transgression comparison requires μ_(re) for inertia order e dividing |Γ|, not μ_(e²). At e=4,r=2 over 𝔽₉, 8 divides q−1 and 16 does not; this is a test of the precise bound. A degree-r Azumaya algebra gives a projective space of dimension r−1; a Brauer–Severi section implies splitting, and the converse used here is restricted to fields or local bases. Bockstein signs use δ:H¹(ℤ/e)→H²(ℤ) with dψ=eφ. Arithmetic extension classes retain H¹(k,Hom(I,μe)) and geometric descent invariants.

## How to read the build

Layer 0 constructs the realizations and stringy comparison. Layer 1 builds relative and principal splittings, keeping the band and Kummer obstruction, and evaluates arithmetic gerbes on abelian varieties over local fields. Layer 2 turns dual abelian fibres into local integrals and then arithmetic and complex mirror equalities. Layer 3 supplies the relative stable SL/PGL spectral geometry and separate low-genus calculations. Layer 4 proves degree independence and constructs the powered Hausel–Thaddeus gerbes with arithmetic descent. Layer 5 proves the main, Hodge and isotypic results and the stronger Galois comparison as a distinct target. Each Needs line separates the statement’s carriers from the inputs of the indicated proof route; another proof may replace that route without changing the statement.

## Layer 0: Realizations and stringy invariants

### 0.1 Character E-polynomials and weighted counts

For a good action of a finite group G on a separated finite-type variety X and a one-dimensional character χ, define Eχ_G(X)=Σ_i,p,q (−1)^i dim Gr_F^p Gr_W^(p+q) H_c^i(X,C)^χ x^p y^q. Over 𝔽q define the χ-count by alternating geometric-Frobenius traces on H_c^i(X,ℚ̄ℓ)^χ. Its stack expression is Σ_[z] Tr(Fr_z,Lχ,z)/|Aut(z)| over [X/G](𝔽q). Fix the associated-local-system convention so that this formula selects the χ-eigenspace, rather than its inverse. Both realizations are additive for invariant closed/open decompositions; Eχ is generally only an additive map, not a ring homomorphism. (GWZ20 §2.5, Definition 2.14, p.523).

G is finite, every orbit lies in an affine open, and the action is over the base. χ:G→C× is one-dimensional; identify its roots of unity with coefficients in ℚ̄ℓ, with ℓ different from the residue characteristic. Compact supports and the geometric mixed Hodge structure are essential for nonproper X.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §2.5, Definition 2.14, p.523).

- For an invariant closed Z⊂X, Eχ(X)=Eχ(Z)+Eχ(X∖Z).
- The weighted quotient-stack sum equals the alternating trace on the χ-eigenspaces.
- For G=1, identify the construction with the ordinary geometric compact-support mixed Hodge realization of MixedHodgeModulesAndIrregularHodgeTheory P/pair-cohomology at f=0, whose point values use TauCeti.Hodge.MixedHodgeStructure.
- Eχ(Spec C) is 1 for χ=1 and 0 otherwise.
- For abelian G over splitting coefficients, Eχ(X×Y)=Σ_ψ Eψ(X) E_(χψ⁻¹)(Y).
- Over F_(q^m), replace geometric Frobenius by Fr^m on the same eigenspace.

One proof route is as follows. Import constructible compactly supported cohomology and the geometric mixed Hodge realization from MixedHodgeModulesAndIrregularHodgeTheory H.1/operations and P/pair-cohomology at f=0 on smooth quasi-projective pieces, extended to separated varieties and character coefficients through the geometric compact-support mixed-Hodge supplier contract. Apply the finite-group idempotent |G|⁻¹Σ_g χ(g)⁻¹g. Use exact sequences for invariant closed/open pairs. Apply the stack trace formula of the finite-quotient stack trace contract to identify the alternating trace with the groupoid-weighted sum, including nontrivial rational torsors. The tensor-product rule convolves characters; taking a single χ coefficient therefore preserves addition, but does not in general preserve multiplication.

**Checks.**

- Over F3 the trivial-character count for a point with C₂-action is 1/2+1/2=1, not 2.
- For the sign action of C₂ on A¹/F3 the trivial-character weighted sum is 1/2+1/2+1+1=3, not 4.
- For the sign representation of C₂, its sign multiplicity is 1 but the sign multiplicity of its tensor square is 0; χ-projection cannot be declared multiplicative.
- For G=1, E(A¹)=xy and #A¹(𝔽q)=q, consistent with compact H_c²=ℚℓ(−1), not with ordinary H⁰; on 𝔾_m the imported H_c¹=ℚ(0), H_c²=ℚ(−1) give E=xy−1 and count q−1.
- Over 𝔽₂, for C₂ acting trivially on a point, the trivial-character weighted sum is again 1/2+1/2=1, equal to the trace on H⁰; the stabilizer order 2 equals the residue characteristic, so the formula is not restricted to tame stabilizers.
- For nontrivial χ, the χ-count of a point with trivial action is zero.

*Needs:* TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; TauCetiRoadmap.MotivesAndAlgebraicCycles §4.20 and the equivariant scissor contract (gap:equivariant-grothendieck); Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`; Mathlib `sum_hom_units_eq_zero`; TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### 0.2 Fractional Lefschetz powers and root systems

Use the scissor ring K₀Var k of MotivesAndAlgebraicCycles §4.20 and its good-finite-group equivariant extension K0^G(Var_k) from the equivariant scissor contract (gap:equivariant-grothendieck), together with the spread-out ring K0^G(Var/R) over R for the finite list of varieties in use, retaining its distinction from further equivariant representation quotients. Adjoin coherent formal roots of ℒ=[A¹ with trivial G-action]; any expression in use has a positive finite common denominator N. If negative exponents are used, first localize at ℒ. The target rational-bidegree algebra has invertible monomials and the finite-field image q is nonzero, so these additive scalar-linear realizations extend to that localization. For a fixed prime power q, a compatible root system is s_r∈C× for r≥1 with s_1=q and s_(rr′)^r=s_r′. Extend χ-realizations additively and linearly over the trivial-action Lefschetz powers: #^(s,χ)([X]ℒ^(a/N))=#χ(X)s_N^a and Eχ([X]ℒ^(a/N))=Eχ(X)(xy)^(a/N). Root choices remain part of the finite-field evaluation. (GWZ20 §2.5, Definition 2.16, p.525).

R has the finite-type hypotheses of the realization in use. Fractional bidegrees live in the finite-support rational-exponent algebra, available as AddMonoidAlgebra Z (Q×Q); only the necessary denominator subalgebra is used. Use a fixed system s for general prime powers. No root-choice independence is assumed there.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §2.5, Definition 2.16, p.525).

- A compatible system satisfies s_1=q.
- For positive r,r′, (s_(rr′))^r=s_r′.
- The evaluation of [X]ℒ^(a/N) is #χ(X)s_N^a and Eχ(X)(xy)^(a/N).
- Refining N to NN′ gives the same evaluation by the root relation.
- The integer-exponent subalgebra agrees with the ordinary realization; its Tate sign agrees with TauCeti.Hodge.tate_hodgeNumber.
- For q=p prime to the character-value order, Galois transport fixing those values identifies the equality relations for compatible systems.

One proof route is as follows. Import the actual equivariant Grothendieck ring and its realization descent from the equivariant scissor supplier contract. Form the directed union of finite root adjunctions, with the transition ℒ^(1/N)=(ℒ^(1/NN′))^N′. Extend the already additive χ map by the displayed scalar formula, using that trivial-character ℒ acts by a Tate shift. Do not turn the χ coefficient map into a ring homomorphism. For q=p prime not dividing the order of χ values, Eisenstein over the cyclotomic coefficient field and compactness transport two systems by an automorphism fixing those values. Apply this only at the prime-residue points used in comparison.

**Checks.**

- At q=4, the positive system has s_2=2 while the system exp((log 4+2πi)/r) has s_2=−2. ℒ^(1/2)=2[pt] holds under the first evaluation and fails under the second.
- ℒ^0 acts as 1 on every χ realization; for χ≠1 its value on the isolated trivial-action point is nevertheless 0.
- ℒ has bidegree (1,1), whereas the existing Tate structure Z(1) has bidegree (−1,−1).

*Needs:* §0.1 (character e-polynomials and weighted counts); TauCetiRoadmap.MotivesAndAlgebraicCycles §4.20; Mathlib `AddMonoidAlgebra`; Tau Ceti `TauCeti.Hodge.tate_hodgeNumber`; the equivariant scissor contract (gap:equivariant-grothendieck).

### 0.3 Equivariant Katz comparison

Let R⊂C be of finite type over Z, G finite and χ one-dimensional. For separated good G-schemes X,Y of finite type over R, equality of the χ-counts after every map R→𝔽q implies Eχ_G(X_C)=Eχ_G(Y_C). The same statement holds for virtual scissor classes. (GWZ20 §2.5, Theorem 2.15 and proof, pp.523–524).

Fix an identification of the character-value fields in C and ℚ̄ℓ. Counts include every finite extension of every allowed finite residue field. Shrinking and spreading are performed simultaneously on both sides.

One proof route is as follows. Use the equivariant Bittner presentation requested from the equivariant scissor supplier contract, not a nonequivariant compactification, to reduce virtual classes to smooth projective good G-varieties. Spread the finite list and all relations after shrinking R. Use constancy of character Hodge numbers in smooth proper complex families to specialize to a number-field model in the relevant component; this adapter is requested from CohomologyComparisons §2.15. Apply ArithmeticGaloisRepresentations §§5.1–5.3 and ArithmeticGaloisRepresentations §§1.7–1.8 to the resulting virtual lisse realizations. Purity separates each integral cohomological degree for smooth proper summands; work in the Grothendieck group. The equivariant Hodge–Tate decomposition identifies the multiplicity at Tate degree −p with H^q(Ω^p), with the indicated convention. Additivity returns the asserted equality for the original nonproper varieties. The required geometric MHS and equivariant blow-up interfaces are supplier obligations.

**Checks.**

- For G=1 the ring is K₀Var k of MotivesAndAlgebraicCycles §4.20 and the statement is ordinary Katz comparison.
- The proof concludes equality of Hodge polynomials, not an actual isomorphism of nonsemisimple arithmetic representations.

*Needs:* §0.1 (character e-polynomials and weighted counts); TauCetiRoadmap.MotivesAndAlgebraicCycles §4.20; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§9.4–9.5, 9.7; TauCetiRoadmap.CohomologyComparisons §§2.15; TauCetiRoadmap.ArithmeticGaloisRepresentations §§5.1–5.3; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8; TauCetiRoadmap.DeligneWeightsAndPurity §§7.15; the equivariant scissor contract (gap:equivariant-grothendieck); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); the fractional equivariant Hodge–Tate contract (gap:fractional-equivariant-hodge-tate).

### 0.4 Finite-denominator Tate roots

For R⊂C of finite type and a finite denominator N, choose ℓ∤N. After shrinking Spec R[1/ℓ] and a finite étale cover R′ with a chosen complex embedding, the cyclotomic character has image in a log/exp neighborhood. The character exp((1/N)log χℓ) defines a lisse rank-one ℚℓ(1/N) whose Nth tensor power is ℚℓ(1); roots for divisors of N are compatible. With ℚ̄ℓ coefficients one can choose compatible roots for all denominators, but only each fixed finite set is asserted to have a finite coefficient model. (GWZ20 §2.5, Lemma 2.17, pp.525–526).

The sheaves are on Spec R′[1/ℓ], not on all of Spec R. For the ℚℓ formula N is prime to ℓ, or a specific finite convergence bound must be supplied. No fixed finite coefficient field is required to contain every ℓ-power root of the cyclotomic character.

One proof route is as follows. Kill the finite torsion quotient of the cyclotomic image by finite étale base change and choose a sufficiently deep principal-unit subgroup. For ℓ∤N, division by N preserves the log image and exp converges; tensor compatibility follows by multiplication of logarithms. For the all-denominator ℚ̄ℓ statement use compatible principal-unit roots of a generator of the procyclic cyclotomic image, with continuous Zℓ powers. This is an existence statement; the finite-denominator branch suffices for every fractional comparison.

**Checks.**

- For N=1 obtain the cyclotomic Tate sheaf.
- A proposed ℚℓ-valued system of all ℓ-power roots fails on an open cyclotomic image: sufficiently high powers cannot hit a fixed shallow principal unit.

*Needs:* TauCetiRoadmap.CohomologyComparisons §§2.15; the fractional equivariant Hodge–Tate contract (gap:fractional-equivariant-hodge-tate).

### 0.5 Katz comparison with fractional twists

For R,G,χ as above and finite fractional-Lefschetz expressions X,Y in the equivariant scissor realization, suppose #^(s,χ)(X_𝔽q)=#^(s,χ)(Y_𝔽q) for every R→𝔽q, using a specified compatible system at each map. Then Eχ(X_C)=Eχ(Y_C) in the rational-bidegree algebra. (GWZ20 §2.5, Theorem 2.18, pp.526–527).

A single finite denominator N works for both expressions. Choose ℓ∤N and finite coefficient models after the permitted common cover. The comparison is in a Grothendieck group of representations; alternating signs remain attached to cohomological degrees. At q=p prime, p is also prime to the order of the character values when transporting root systems.

One proof route is as follows. Reduce to finite virtual sums of smooth projective G-varieties times ℒ^a by equivariant Bittner. Apply §0.4 and identify ℒ^a with ℚ̄ℓ(−a), giving geometric Frobenius eigenvalue q^a. Use the prime-field transport from §0.2 at density-one prime-residue places of the number-field specialization. It fixes the character-value field. Arbitrary prime powers retain their specified root choices. Chebotarev and Brauer–Nesbitt compare virtual representation classes, including all weight pieces; do not discard alternating signs when rational shifts make weights overlap. Apply the generalized fractional Hodge–Tate realization of Ito §5 to those classes. Its rational Cℓ(a)-period multiplicities and additivity are the fractional equivariant Hodge–Tate supplier contract adapter. It returns the shift h^(p−a,q−a), with the negative Tate twist, then yields equality of rational Hodge bidegrees.

**Checks.**

- ℒ^(1/2) shifts the E-bidegree by (1/2,1/2); its realization is ℚ̄ℓ(−1/2).
- Keep X exponents a_i and Y exponents b_j separate; no conclusion about actual ungraded Galois representations follows.

*Needs:* §0.2 (fractional lefschetz powers and root systems); §0.3 (equivariant katz comparison); §0.4 (finite-denominator tate roots); TauCetiRoadmap.ArithmeticGaloisRepresentations §§5.1–5.3; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8; TauCetiRoadmap.CohomologyComparisons §§2.15; TauCetiRoadmap.DeligneWeightsAndPurity §§7.15; the fractional equivariant Hodge–Tate contract (gap:fractional-equivariant-hodge-tate); the equivariant scissor contract (gap:equivariant-grothendieck); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs).

### 0.6 Stringy E-polynomials and point counts

For a smooth tame finite quotient stack X=[Y/Γ], use its inertia decomposition ⨿_[γ][Y^γ/C(γ)] and the imported age F(γ,Z). Set E_st(X)=Σ_[γ],Z E([Z/C(γ,Z)])(xy)^F(γ,Z), where Z ranges over representatives for centralizer orbits of connected components of Y^γ and C(γ,Z) is its stabilizer. The sector E uses C(γ,Z)-invariants in compact cohomology; equivalently use the full centralizer on the union of that orbit of components. Over 𝔽q containing the required roots, set #_st(X)=Σ_[z]∈IX(𝔽q) q^F(z)/|Aut(z)|, with positive real q^F. Allow Γ nonabelian here; the integration layers specialize to abelian Γ. (GWZ20 §2.1, Definition 2.4 and Remark 2.5, pp.513–514).

Y is smooth separated finite type; the finite group order is invertible, with the chosen roots of unity giving the sector labels. F uses tangent eigenvalues exp(2πic/r) with 0≤c<r. The alternative weight satisfies w(γ,Z)=dim X−F(γ⁻¹,Z). The quotient-stack presentation and inertia come from SchemeAndStackFoundations §§1.20–1.23 and AlgebraicModuliForArithmeticGeometry §4.5, `quotientInertiaComponents`; tangent age and its integration compatibility use the generic orbifold/transgression contract.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §2.1, Definition 2.4 and Remark 2.5, pp.513–514).

- The inertia decomposition evaluates the invariant by the displayed sum, with component stabilizers or equivalently full centralizers on invariant component unions.
- For a smooth scheme, the invariant agrees with the ordinary compact Hodge/count realization.
- An equivalence of smooth quotient stacks preserving tangent data identifies the invariants.
- For k coprime to the generator order, replacing the primitive generator by its kth power transports γ to γ^k and gives the same untwisted sector sum.
- The invariant of a disjoint union is the sum of the invariants.
- The identity sector has age zero.

One proof route is as follows. Apply the imported inertia and age to the character realization at the trivial centralizer character; sum its finitely many connected sectors with the rational diagonal shift. Use weighted quotient-stack masses over finite fields, including rational torsors. Prove invariance under presentation and simultaneous root-generator/sector reindexing from the imported inertia/age equivalences. Nontrivial tangent eigenvalues are essential, so this is not the invariant of the coarse space alone.

**Checks.**

- The invariant of Spec C is 1 and of Spec 𝔽q is 1.
- Over a split field of characteristic different from 2, E_st(BC₂)=2 and #_st(BC₂)=2: each of the two age-zero inertia components has ordinary mass 1. This is different from the ordinary mass of BC₂, which is 1.
- For [A¹/C₂] with sign action, the stringy E-polynomial is xy+(xy)^(1/2); over odd 𝔽q the stringy count is q+q^(1/2).
- For a free finite action on smooth Y, [Y/Γ] is the smooth quotient scheme and all nonidentity sectors are empty.
- For S₃ acting trivially on a point, the three conjugacy classes give three age-zero sectors, each of mass 1, so E_st(BS₃)=3 and #_st(BS₃)=3. Summing over six elements without conjugacy would give 6.
- If a centralizer exchanges two fixed components, quotienting their union by that centralizer gives one component quotient by its stabilizer. For two points exchanged freely by C₂, the invariant union quotient has mass 1 and H⁰-invariant dimension 1; incorrectly treating the two points as separately indexed components gives 2.

*Needs:* §0.1 (character e-polynomials and weighted counts); §0.2 (fractional lefschetz powers and root systems); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.5, 4.9, 4.20; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs).

### 0.7 Gerbe-twisted stringy invariants

For the quotient stack X of §0.6, an étale μr-gerbe α and a fixed faithful embedding of μr into the coefficient field, import its transgression torsor Pα on IX. Define E_st(X,α)=Σ_Z E(Z,Pα|Z)(xy)^F(Z) by the specified character of the torsor total space, with invariants under the component stabilizer as in §0.6. Define #^α_st(X)=Σ_[z] q^F(z) Tr(Fr_z,Nα,z)/|Aut(z)|. All root embeddings, torsor-associated character conventions and age generators are transported together. Every age twist is locally constant by connected inertia component; no common age for an entire fixed locus is presumed. (GWZ20 §2.4, Definitions 2.12–2.13, pp.521–522).

r is invertible and the finite-field roots required by the chosen sector presentation and μr-character are present. Use geometric Frobenius, positive q^age, and the associated line local system Nα selecting the same character as the complex realization. A μr-gerbe may be nonneutral even when its induced Gₘ-gerbe is neutral; transgression factors through that Gₘ-gerbe. Whenever transgression is identified through the Gₘ image, impose the actual admissibility root condition μ_(r|Γ|) for the chosen finite quotient presentation on the base, as in the μr-to-Gₘ transgression comparison (GWZ20 Lemma 2.9, pp.520–521); over C it is automatic.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §2.4, Definitions 2.12–2.13, pp.521–522).

- For the neutral gerbe, twisted and untwisted invariants coincide.
- A stack equivalence and a band-preserving gerbe equivalence transport the invariant.
- Gerbes with isomorphic induced Gₘ-gerbes have equivalent transgressed local systems, with the fixed character convention.
- Pullback along inertia inversion identifies Nα on γ⁻¹ with the dual of Nα on γ.
- The transgression on the identity section is canonically trivial.
- The sector coefficient is the faithful-character part of compact cohomology of its μr-torsor total space, with centralizer invariants.

One proof route is as follows. Import action-groupoid transgression with its unit and coherent centralizer descent from AlgebraicModuliForArithmeticGeometry §4.5, `quotientGerbeTransgression`. Use the generic orbifold/transgression extension for admissible band-change, Hasse and arithmetic specialization compatibility. Pull each sector torsor to its finite cover with Γ×μr-action. Apply §0.1 to the torsor total space and append its age monomial. The stack trace formula supplies stabilizer denominators. Use transgression pullback and inversion to prove functoriality, trivial-twist normalization and the inverse-sector/dual-local-system relation needed by the integral formula.

**Checks.**

- On [A¹/C₂] with neutral gerbe, the value is xy+(xy)^(1/2), not just xy.
- For the nonneutral μ₂-root gerbe of O(1) on ℙ¹/C, the unit modification trivializes the identity-sector transgression torsor, so the twisted invariant is 1+xy; nonneutrality of the gerbe does not make that torsor nontrivial.
- For a μr-torsor over Spec 𝔽q on which geometric Frobenius acts by a∈μr, the associated faithful-character trace is the chosen character value of a, rather than the number of rational points of the torsor.
- For r=3 and a primitive value ζ, inverse-sector traces are ζ and ζ⁻¹. They cannot be identified without dualizing or conjugating.
- On a smooth scheme the identity-sector transgression is trivial, so these stringy invariants are ordinary even for a nonneutral μr-gerbe.

*Needs:* §0.6 (stringy e-polynomials and point counts); §0.1 (character e-polynomials and weighted counts); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.5, 4.9, 4.20; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs).

### 0.8 Stringy counts determine E-polynomials

Let R⊂C be of finite type, X_i=[Y_i/Γ_i] smooth finite abelian quotients over R, and α_i μr-gerbes. If their twisted stringy counts agree after every R→𝔽q with the group and band orders invertible on the common smooth tame model and with compatible specified root/character choices, then E_st((X_1)_C,α_1)=E_st((X_2)_C,α_2). A common shrinking and finite étale cover is allowed, retaining the chosen complex fibres. (GWZ20 §2.5, Theorem 2.19, pp.527–528).

The root and character choices over residue fields are transported to the same complex convention; enlarge R to contain the finite needed roots. All finite-field extensions remain in the hypothesis.

One proof route is as follows. Put both presentations under Γ_1×Γ_2 and separate the finitely many connected inertia sectors. Realize transgression torsors as good Γ×μr-varieties. Encode sector Z by its torsor total-space class times ℒ^F(Z), using the faithful μr character and trivial centralizer character. The exponent is the age F, not the gerbe α. Apply §0.5 to the finite virtual difference; the compatible root/character conventions identify its E-realization with the required twisted stringy difference.

**Checks.**

- For trivial groups and gerbes recover ordinary Katz comparison.
- The expression uses the same finite set of age denominators on the two sides after common refinement.

*Needs:* §0.5 (katz comparison with fractional twists); §0.7 (gerbe-twisted stringy invariants); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); the equivariant scissor contract (gap:equivariant-grothendieck); the fractional equivariant Hodge–Tate contract (gap:fractional-equivariant-hodge-tate); the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### Examples

The quotient [A¹/C₂] over 𝔽₃ has ordinary mass 1/2+1+1/2+1=3, and its age-1/2 nonidentity sector has mass 1. Thus its stringy count is 3+√3 and its E-polynomial is xy+(xy)^(1/2). At q=4, compatible square roots 2 and −2 give different evaluations of ℒ^(1/2); the choice must accompany a fractional count. (GWZ20 Definitions 2.4, 2.14, 2.16.)

### Dependencies

TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §4.5 (quotient inertia and coherent transgression); TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; TauCetiRoadmap.MotivesAndAlgebraicCycles §4.20 and the equivariant scissor contract (gap:equivariant-grothendieck); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`; Mathlib `sum_hom_units_eq_zero`; Mathlib `AddMonoidAlgebra`; Tau Ceti `TauCeti.Hodge.tate_hodgeNumber`; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§9.4–9.5, 9.7; TauCetiRoadmap.CohomologyComparisons §§2.15; TauCetiRoadmap.ArithmeticGaloisRepresentations §§5.1–5.3; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8; TauCetiRoadmap.DeligneWeightsAndPurity §§7.15; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20.

## Layer 1: Arithmetic gerbes and relative splittings

### 1.1 Arithmetic gerbes

For f:U→V proper with geometrically connected fibres and a smooth commutative band B over V, a B-gerbe α on U is V-arithmetic when an étale covering {V_i→V} makes α|_(U×V V_i) neutral. For a field K this means geometric neutrality over K^s, with finite-presentation descent. Keep the band: arithmetic μr-neutrality is stronger than neutrality of its image in H²(U,Gₘ). (GWZ20 §6.1, Definition 6.1, p.565).

r is invertible when B=μr. Use the imported algebraic stack/gerbe formalism; assume f_*Gₘ=Gₘ universally whenever a Picard or Hochschild–Serre statement below needs it, in particular for smooth proper geometrically connected fibres.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §6.1, Definition 6.1, p.565).

- An arithmetic gerbe remains arithmetic after arbitrary base change.
- A chosen neutralization implies arithmeticity.
- For finite-presentation gerbes over a field, arithmeticity is equivalent to neutrality over the separable closure.
- Extension along μr→Gₘ preserves arithmeticity; the converse requires the Kummer obstruction and is not asserted.
- Band-preserving equivalences of relative gerbes preserve arithmeticity.

One proof route is as follows. Define the local-neutrality property on the base étale site, using gerbes from AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20. Use the sheaf condition to transport along equivalences and base change; over a field descend a geometric neutralization to a finite separable extension. Compare the μr and Gₘ images by extension of band, retaining the Kummer kernel Pic(U)/r.

**Checks.**

- For U=V=Spec ℝ, the μ₂-gerbe whose class is the nonzero element of H²(ℝ,μ₂)≅Br(ℝ)[2], the class of the Hamilton quaternions, is arithmetic, since it is neutral over ℂ, but is not neutral over ℝ.
- On P1/C, the μ2-gerbe of square roots of O(1) has neutral induced Gₘ-gerbe but is not arithmetic as a μ2-gerbe: its class in Pic(P1)/2 is nonzero.
- For U=BC₂ over Spec C and r=2, H²(BC₂,μ₂)=H²(C₂,μ₂) has order 2 and is the Kummer image of Pic(BC₂)/2=Hom(C₂,C×), of order 2, while H²(BC₂,Gₘ)=C×/C×² is trivial. The μ₂-gerbe of square roots of the sign character has neutral induced Gₘ-gerbe but is not arithmetic. The orders are (2,2,1); the finite residue-field orders (e²,e,e)=(4,2,2) of the ClassFieldTheory contract fail on this base.
- For U=BC₂ over Spec 𝔽₅ and r=2, the degree-two Hochschild–Serre terms H⁰(𝔽₅,H²(C₂,μ₂)) and H¹(𝔽₅,Hom(C₂,μ₂)) have order 2 each and H²(𝔽₅,μ₂)=0, so H²(BC₂,μ₂) has order 4, while Pic(BC₂)/2=Hom(C₂,𝔽₅×) and H²(BC₂,Gₘ)[2]=H¹(𝔽₅,μ₂) have order 2. The class from H¹(𝔽₅,Hom(C₂,μ₂)) is a nonzero Brauer class killed over 𝔽₂₅, hence arithmetic and not neutral; the sign-root class is not arithmetic. Omitting the H¹(k,Hom(I,μe)) term would give order 2. For e=1 all three orders are 1.
- For U=BC₃ over Spec 𝔽₅, where 3 does not divide q−1=4, geometric Frobenius acts by inversion on μ₃, Hom(C₃,μ₃) and H²(C₃,μ₃), so every Hochschild–Serre term of total degree two vanishes, Hom(C₃,𝔽₅×)=1 and H²(BC₃,Gₘ)=H¹(𝔽₅,μ₃)=0. All three orders are 1, not (9,3,3): the divisibility e | q−1 is needed.
- For U=BC₂ over Spec ℚ₅ and r=2, the degree-two terms H⁰(ℚ₅,H²(C₂,μ₂)), H¹(ℚ₅,μ₂)=ℚ₅×/ℚ₅×² and H²(ℚ₅,μ₂)=Br(ℚ₅)[2] have orders 2, 4 and 2. The section Spec ℚ₅→BC₂ and the global sign-root class make every differential touching them zero, so H²(BC₂,μ₂) has order 16, Pic(BC₂)/2 order 2 and H²(BC₂,Gₘ)[2] order 8. The residue-field orders do not transfer to the local field.
- For μ1 the unique gerbe is neutral and arithmetic.
- The root gerbe of the existing trivial invertible sheaf has its canonical root and is arithmetic.
- On the square-zero base Spec k[ε]/(ε²), pulling back a chosen neutralization gives the same zero H² class, so arithmeticity stays true without replacing the nonreduced base by its reduction.
- This is a property of the relative gerbe and its band, not an assertion that a global section exists.

*Needs:* TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`.

### 1.2 Relative stacks of splittings

For a V-arithmetic Gₘ-gerbe β on U, define the V-stack Split̃(U/V,β) by the groupoid of its neutralizations on U_T for T→V. Tensoring a neutralization by a line bundle gives an action of the relative Picard stack Pic̃(U/V), and this makes Split̃ a Pic̃-torsor. For a μr-gerbe α, use its μr-neutralizations and μr-rigidify to obtain Split_μr; it is a torsor under the rigidified relative μr-torsor sheaf, identified with Pic(U/V)[r] by the relative Kummer sequence. (GWZ20 §6.1, Lemma 6.2 and Definition 6.3, pp.565–566).

f is proper, geometrically connected and cohomologically flat in degree zero in the chosen Picard representability interface. r is invertible and the appropriate gerbe is V-arithmetic. Rigidification is a sheaf construction; quotienting individual T-valued section sets is insufficient.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §6.1, Lemma 6.2 and Definition 6.3, pp.565–566).

- Tensoring a Gₘ-neutralization by a line bundle defines the Picard-stack action with unit and associativity isomorphisms. For μr-neutralizations use the relative μr-torsor stack and retain the rth-power trivialization.
- For Gₘ-neutralizations, the action map Pic̃×Split̃→Split̃×Split̃ is an equivalence over V. For μr-neutralizations replace Pic̃ by the relative μr-torsor stack; after μr-rigidification its acting sheaf is Pic(U/V)[r].
- Pullback identifies the splitting stack with the splitting stack of the pulled-back gerbe.
- The μr-rigidification map is a μr-gerbe and removes precisely the scalar μr automorphisms.
- The rigidified relative μr-torsor group is Pic(U/V)[r], via the relative Kummer sequence, not Pic(U/V)/r.
- A chosen Gₘ-neutralization identifies its splitting stack with Pic̃. A chosen μr-neutralization identifies its splitting stack with the relative μr-torsor stack and its rigidification Split_μr with Pic[r].

One proof route is as follows. Use the imported Picard stack and gerbe maps. The sheaf of differences of any two neutralizations is a line bundle, or a μr-torsor with the band retained. Arithmeticity makes the difference action locally nonempty, hence a torsor rather than just a pseudotorsor. Apply AlgebraicModuliForArithmeticGeometry §5.1 and its base-change theorem. On the base étale site, the Kummer map kills relative unit ambiguities and identifies the rigidified μr-torsor group with Pic[r].

**Checks.**

- For the neutral μr-gerbe on a pointed smooth projective curve, the rigidified splitting sheaf is its relative Picard r-torsion, of order r^(2g) when r is invertible.
- For U=V and a base gerbe, the rigidified relative splitting sheaf is the terminal sheaf even if the base gerbe has no global neutralization.
- For U=V=Spec C and the neutral μ₂-gerbe, a neutralization has scalar automorphism group of order 2; μ₂-rigidification gives order 1.
- For a neutral Gₘ-gerbe the difference between the trivialization and its tensor by an existing InvertibleSheaf L is exactly the class of L in the imported Picard group.
- Over Spec ℝ, the μ2-torsors t²=1 and t²=−1 are not isomorphic, although their associated line bundles are both trivial. They give different objects in the neutral μ2-gerbe splitting groupoid before rigidification; the relative rigidified sheaf for U=V is nevertheless terminal. Forgetting the square trivialization before forming the groupoid loses this distinction.

*Needs:* §1.1 (arithmetic gerbes); TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; the relative splitting-stack contract (gap:relative-gerbe-splitting-representability).

### 1.3 The principal splitting torsor

Let Picτ(U/V) be the inverse image in the relative Picard sheaf of the torsion subgroup of its geometric component group. For a V-arithmetic μr-gerbe α, define Split′(U/V,α)=Split_μr(U/V,α)×^(Pic(U/V)[r])Picτ(U/V). This is extension of structure group of a Pic[r]-torsor, not a chosen connected component of Split̃. Over an abelian-scheme torsor, identify Picτ=Pic0 with the dual abelian scheme. (GWZ20 §6.1, Definition 6.4 and the paragraph following it, p.566).

Use the relative Picard representability imported from JacobianChallenge D and the torsion component Picτ and identity component Pic0 of ComplexComparisonPartII §§C3.2e, C3.2f.1; the dual-abelian-scheme identification uses A2 and the Picard contract. The map Pic[r]→Picτ is the natural inclusion and r is invertible. Picτ=Pic0 is invoked only where proved; torsion in the Néron–Severi group can prevent it in general.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §6.1, Definition 6.4 and the paragraph following it, p.566).

- Picτ acts simply transitively on Split′ after an étale base cover.
- A μr-neutralization maps canonically to a point of Split′.
- The contracted product commutes with the allowed base changes.
- For the neutral gerbe with its chosen neutralization, Split′≃Picτ equivariantly.
- For a torsor under A, the acting group is A∨ through the normalized relative Picard/Poincaré comparison.
- The torsor class is the image of the splitting Pic[r]-cocycle in H¹(V,Picτ).

One proof route is as follows. Form the contracted product as the fppf sheaf quotient of pairs (s,L) under (s,L)·t=(s·t,t⁻¹L). Import quotient representability and descent. The residual Picτ action is locally simply transitive; descent gives the principal torsor. Base change and band/gerbe equivalences act on both factors. For an abelian torsor, translation and the normalized Poincaré comparison identify Picτ with the dual abelian scheme; no origin of the torsor is chosen.

**Checks.**

- For the pullback to a curve X/ℝ with X(ℝ) nonempty of the Hamilton μ₂-gerbe of Spec ℝ, Split′≃Picτ has an ℝ-point while the μ₂-gerbe remains nonneutral over ℝ.
- For the neutral μr-gerbe on an elliptic curve E with its origin, Split′ is E∨, not the finite group E[r].
- For U=V=Spec K the relative Picard group is zero and Split′ is a point, independently of the constant gerbe class.
- If the relative Picard component group has nonzero torsion, the construction retains those Picτ components; replacing it by Pic0 changes the contracted-product torsor.

*Needs:* §1.2 (relative stacks of splittings); TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.ComplexComparisonPartII §§C3.2e, C3.2f.1 (`picardTorsionComponent`, `picardZeroSheaf`); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20.

### 1.4 Principal splittings and constant Brauer classes

For smooth proper geometrically connected X/K with H⁰(X_Ks,Gₘ)=(Ks)× and arithmetic μr-gerbe α, a K-point of Split′ implies that the induced Gₘ-class β lies in im(Br(K)→Br(X)). Write Br(X)_K for the kernel of Br(X)→Br(X_Ks), the classes killed over the separable closure; β lies in it because α is arithmetic. Use the middle-exact Hochschild–Serre edge sequence Pic(X)→Pic(X_Ks)^GK→Br(K)→Br(X)_K→H¹(GK,Pic(X_Ks))→H³(GK,(Ks)×). No injectivity of Br(K) or surjectivity to H¹ is assumed. A K-point of X gives injectivity, and H³=0 suffices for the right surjectivity. (GWZ20 §6.1, equation (24) and Lemma 6.5, pp.565–566).

All Picard sheaves and Galois modules are the imported geometric ones. For proper geometrically connected X beyond this smooth case, require explicitly the global-units and relative-Picard hypotheses of the edge sequence. The conclusion concerns β, not neutrality of α as a μr-gerbe.

One proof route is as follows. The cocycle description of §1.3 sends β to the image of its Picτ-torsor class in H¹(K,Pic). A rational point kills that class. Apply the exact low-degree sequence in SchemeAndStackFoundations §2.15 with F=Gₘ, and the Picard identifications of SchemeAndStackFoundations §§3.6–3.7. Its exactness at Br(X)_K alone gives a constant Brauer class; no new geometric spectral sequence is needed. Use pullback along a rational point only when present. The Kummer sequence explains why a possible Pic(X)/r residue prevents inferring μr-neutrality from β=0.

**Checks.**

- For the real conic with no real point, the nonzero Hamilton Brauer class can map to zero, so the displayed sequence cannot begin with an unconditional injection.
- For O_F=ℤ₅ or 𝔽₅[[t]] and a constant class β=c pulled back from Br(F) with inv c=1/2, if β extends to a class on a model over O_F and the F-point extends to an O_F-point, then its evaluation c lies in the image of Br(O_F)≅Br(𝔽₅)=0, so inv c=0; a constant class of invariant 1/2 cannot so extend.

*Needs:* §1.3 (the principal splitting torsor); TauCetiRoadmap.ClassFieldTheory Layer 5; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.SchemeAndStackFoundations §§2.15, 2.22; TauCetiRoadmap.SchemeAndStackFoundations §§3.4, 3.6–3.7.

### 1.5 Unitary and arithmetic principal splittings

For smooth projective U→V over C, an arithmetic μr-gerbe α, and Picτ(U/V)=Pic0(U/V), identify the analytification of Split′ with the relative analytic space over V^an of flat unitary splittings of the corresponding unitary gerbe; its total space is a complex manifold when V is smooth, and no smoothness of V is assumed. The isomorphism is equivariant for the rank-one unitary-line/Pic0 comparison and compatible with pullback; it does not select a neutralization. (GWZ20 §6.1, Remark 6.6, p.567; HT03 §3, numbered pp.8–13).

Retain Picτ=Pic0 and the smooth projective complex hypotheses. The unitary gerbe and its flat splittings are imported from the rank-one extension requested of the rank-one unitary-family contract; that stage is required with family compatibility.

One proof route is as follows. Apply the imported rank-one unitary-line/Pic0 equivalence to local neutralizations and their differences. Both sides are obtained by extending the same Pic[r]-torsor of μr-neutralizations along Pic[r]→Pic0. Compare the descent cocycles, using arithmeticity. The source only states the comparison as a remark; retain the rank-one unitary-family supplier contract until the analytic construction and family descent are supplied.

**Checks.**

- For a neutral gerbe on an elliptic curve, both sides are its dual elliptic curve as real manifolds with their compatible complex structure.
- For U=E×V over a nodal complex curve V, an elliptic curve E and α=0, both sides are E∨×V^an over V^an; neither total space is a manifold at the node, so the comparison is one of relative analytic spaces over V^an.

*Needs:* §1.3 (the principal splitting torsor); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; the rank-one unitary-family contract (gap:unitary-splitting-families).

### 1.6 Evaluation of arithmetic gerbes on abelian varieties over local fields

Let F be a nonarchimedean local field, A/F an abelian variety, r a positive integer invertible in F, α an F-arithmetic μr-gerbe on A, β∈Br(A) the class of its induced Gₘ-gerbe, and t∈H¹(F,A∨) the class of the principal splitting torsor Split′(A/F,α) of §1.3, using Picτ(A/F)=Pic0(A/F)=A∨. Prove that inv(x*β)−inv(0*β)=⟨x,t⟩ for every x∈A(F), where ⟨,⟩ is the normalized local pairing A(F)×H¹(F,A∨)→ℚ/ℤ of ArithmeticGaloisDuality D7.6. Equivalently fα(x)=fα(0)·exp(2πi⟨x,t⟩), so fα is a constant root of unity times the character of t. (GWZ20 §6.1, Lemma 6.7; the evaluation square for Ext² classes is ArithmeticGaloisDuality D7.6, paragraph “Local abelian-variety duality and gerbe evaluation”.)

The constant fα(0) is not asserted to be 1: an arbitrary constant class from Br(F) may be added to β without changing t. For F of characteristic zero the pairing and the evaluation square are those of D7.6; for F=k((t)) they are the equal-characteristic local-duality supplier contract, with r prime to the residue characteristic.

One proof route is as follows. Let α_t∈Ext²_F(A,Gₘ) be the D7.6 class of t, viewed as a Gₘ-gerbe on A. Prove that the Hochschild–Serre edge map Br(A)_F→H¹(F,Pic(A_F^s)) of SchemeAndStackFoundations §2.15, where Br(A)_F is the kernel of Br(A)→Br(A_F^s), sends α_t to the image of t under A∨(F^s)⊂Pic(A_F^s); this is the comparison between the Ext spectral sequence and the Hochschild–Serre spectral sequence for the sheaf represented by A. By the cocycle description of §1.3, used in §1.4, the edge map sends β to the image of t as well. Middle exactness of the low-degree sequence at Br(A)_F gives β=α_t+c with c pulled back from Br(F). Evaluate: x*α_t has invariant ⟨x,t⟩ by the D7.6 square, 0*α_t=0 because the Yoneda composite with the origin vanishes, and x*c=c for every x. Hence 0*β=c and inv(x*β)−inv(0*β)=⟨x,t⟩.

**Checks.**

- For t=0 and β the pullback of a class c∈Br(F) with inv c=1/2, both sides vanish: inv(x*β)−inv(0*β)=1/2−1/2=0=⟨x,0⟩, while fα≡−1. Omitting the subtraction of inv(0*β) would give 1/2≠0, so the normalization at the origin is necessary.
- For A=0, A(F)={0} and H¹(F,A∨)=0, so both sides are 0 and fα is the constant fα(0).
- For an elliptic curve E/ℚ_ℓ and t≠0, local duality makes x↦⟨x,t⟩ a nonzero character of E(ℚ_ℓ), so fα is nonconstant and its Haar integral over E(ℚ_ℓ) is 0, even after multiplication by the constant fα(0).
- For t of exact order 3 and x with ⟨x,t⟩=1/3, the formula gives fα(x)=fα(0)·exp(2πi/3); the opposite orientation ⟨x,−t⟩ gives exp(−2πi/3), so the sign is fixed by the D7.6 class α_t, and order-two classes cannot detect it.

*Needs:* §1.3 (the principal splitting torsor); §1.4 (principal splittings and constant brauer classes); TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and gerbe evaluation); TauCetiRoadmap.SchemeAndStackFoundations §§2.15, 3.6–3.7; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.ClassFieldTheory Layer 5; the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### Examples

For the neutral gerbe on an elliptic curve E, the finite splitting sheaf is E[r], while the principal splitting torsor is E∨. A constant nonsplit real μ₂-gerbe can have a §1.3 point without a μ₂-neutralization. The root gerbe of O(1) on ℙ¹ has Brauer image zero but Kummer class 1 mod 2. (GWZ20 Definitions 6.3–6.4, Lemma 6.5; HT03 Proposition 3.2, HT03 line 385.)

### Dependencies

the relative splitting-stack contract (gap:relative-gerbe-splitting-representability); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.ClassFieldTheory Layer 5; TauCetiRoadmap.SchemeAndStackFoundations §§2.15, 2.22; TauCetiRoadmap.SchemeAndStackFoundations §§3.4, 3.6–3.7; Tau Ceti `TauCeti.subsingleton_brauerGroup_of_finite`; TauCetiRoadmap.ComplexComparisonPartII §§C3.2e, C3.2f.1; TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and gerbe evaluation); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality); the rank-one unitary-family contract (gap:unitary-splitting-families).

## Layer 2: Abstract Hitchin duality

### 2.1 Abstract Hitchin systems

An abstract Hitchin system over noetherian R consists of smooth A/R, a smooth admissible finite abelian quotient stack M/R, π:M→A with proper coarse map, and a smooth commutative A-group P acting relatively. Choose dense open A♦⊂A with P♦ an abelian scheme and a dense open M′⊂M which is a P-torsor over its image in A, contains M♦ and has complement of codimension at least two. The torsor need not be surjective over A. Use equidimensional components when writing q^dim M. (GWZ20 §6.2, Definition 6.8, p.568; §6.3, Remark 6.14, p.571).

Admissible means a presentation [U/Γ] with U smooth quasi-projective over the base, Γ a finite abelian group of order invertible on the base acting with a dense free locus, and all |Γ|th roots of unity on the base; this is GWZ20 Definition 4.10, whose Γ is an abstract, hence constant, finite abelian group. This roadmap also admits Γ a finite étale commutative group scheme that is constant on the chosen étale charts; the nonsplit case is its extension through the generic orbifold/transgression contract (gap:generic-orbifold-transgression). Quasi-projectivity of U makes the action good in the sense of §0.1 and the coarse quotient U/Γ a scheme; §3.1 supplies quasi-projectivity of M_SL^L in the projective-curve setting used by §4.7. The complement of the free locus in U has codimension at least two; this bound is not part of Definition 4.10 but follows from the torsor-locus condition of Definition 6.8(c), since M′ carries no stabilizers and U→U/Γ is finite surjective. A μr-gerbe is admissible when r is a unit and all r|Γ|th roots are present. The integral comparison uses this presentation and these root choices (GWZ20 Definition 4.10; Definition 6.8(c), p.568; Corollary 5.29, p.564). P is smooth along the zero section with locally free invariant differentials on the part used for gauge forms. Properness belongs to the coarse map; M′ is an algebraic space, with no residual stabilizers.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §6.2, Definition 6.8, p.568; §6.3, Remark 6.14, p.571).

- The restriction M♦ is a torsor under the abelian scheme P♦ over its image.
- The coarse-space map to A is proper.
- The complement of the specified torsor locus has codimension at least two.
- Base change preserves the structure when smoothness, admissibility, density and the codimension bound are preserved; in particular use the verified flat base changes and field extensions, and recheck dense opens for a general nonflat base change.
- On M′ the stack is the imported P-torsor algebraic space, with trivial inertia.
- On M′, relative differential forms identify with pullbacks of the invariant forms on P, by the imported torsor differential theorem.

One proof route is as follows. Package the imported smooth stack, relative group action, dense opens and proper coarse morphism, with the stated geometric properties as proof obligations about those actual objects. Use the torsor action to identify relative tangent bundles on M′ with the invariant tangent bundle of P. Keep the codimension bound as a structural hypothesis: extension of a nowhere-zero top form and equality of orbifold/gauge measure use it.

**Checks.**

- For an elliptic curve E over a field, M=P=E×A¹ over A=A¹ with M′=M and A♦=A is an abstract system.
- With trivial relative group and M=A smooth, the identity proper coarse morphism is a relative-dimension-zero system.
- Blowing up a point of a smooth surface abelian fibration produces an exceptional divisor in the complement of the old torsor locus. Its codimension one fails the stated bound, so the old locus cannot certify the new system.
- A torsor over an open image is allowed; existence of A♦ does not assert that every base fibre of M has a rational point.

*Needs:* TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### 2.2 Dual Hitchin systems

Take two abstract systems over the same A, arithmetic admissible μr-gerbes α_i, an étale isogeny φ:P1→P2 over all A, and ψ:(P1♦)∨≃P2♦ with ψφ∨=φψ∨ under biduality. Its geometric kernel degree over A♦ is a unit. Require Picτ=P_i∨ on regular fibres and equivariant isomorphisms Split′(M_i♦/A♦,α_i)≃M_(i′)♦ as P_(i′)♦-torsors. The local hypothesis sufficient for all comparisons is: whenever both fibres over b∈A(O_F)∩A♦(F) have F-points, both induced Gₘ-gerbes are neutral. The paper’s condition that both μr-gerbes are neutral iff both fibres have points is a stronger additional predicate; it implies the sufficient hypothesis, and its extra μr-neutrality assertion is used by no theorem of this roadmap. (GWZ20 §6.2, Definition 6.9 and Remark 6.10, pp.568–569; proof of Theorem 6.17, p.573).

The local-field condition quantifies over each R→O_F and the indicated integral base points; retain the admissible root and prime-to-characteristic hypotheses. Both systems have the same pure total dimension on the compared components, as supplied by their dual regular abelian fibres and common smooth base. The isogeny is étale on all A where gauge forms are pulled back; generic étaleness alone is insufficient.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §6.2, Definition 6.9 and Remark 6.10, pp.568–569; proof of Theorem 6.17, p.573).

- Split′ of the ith regular fibre is a torsor under the opposite group and is equivariantly the opposite fibre.
- The square for φ, φ∨ and ψ commutes with the stated source/target identifications.
- If both regular integral fibres have F-points then both induced Brauer classes vanish on those fibres.
- Swap the systems using the duality and the corresponding reversed self-dual isogeny when supplied; do not assume φ has an inverse.
- Pullback preserves the structure under the verified base changes of the abstract systems, with the local condition checked after composition R→R′→O_F.
- The paper’s stronger μr splitting condition implies the sufficient local Brauer condition of this subsection by extension of band; the opposite splitting-torsor group is P_i′, not P_i.

One proof route is as follows. Use the imported dual abelian-scheme functor and Poincaré biduality to type the self-duality square. The splitting torsor acts by the opposite Prym, with the indicated convention. Form the local evaluation condition on the induced Brauer classes, because the imported transgression and fα factor through Gₘ-gerbes. Record the relationship to the literal μr splitting condition of Definition 6.9(d): the proof of the integral theorem only uses the displayed forward implication for Brauer neutrality. Do not use a point of Split′ to claim a μr-neutralization.

**Checks.**

- For E self-dual by its principal polarization, two copies of E×A¹ with φ=id and neutral gerbes form a dual pair with all torsors trivial.
- Multiplication by p on an elliptic scheme in characteristic p is not an allowed étale prime-to-characteristic isogeny.
- If P1 and P2 are dual but nonisomorphic presentations, Split′(M1,α1) carries the P2 action via ψ; an untransported P1 action has the wrong type.
- For a rational degree-zero line not r-divisible over a field, its root μr-gerbe can have zero Brauer class while remaining nonneutral. The local Brauer condition cannot be rewritten as μr-neutrality without an additional argument.

*Needs:* §2.1 (abstract hitchin systems); §1.3 (the principal splitting torsor); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.3–A3.5; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### 2.3 Compatible gauge forms

Zariski locally on A choose a top form η generating Ω^top_(A/O_F) and a generator θ2 of the invariant relative top forms of P2/A. Set θ1=φ*θ2. Transfer θi to the torsor locus M_i′ and form ωi=π_i*η∧θi there. Extend uniquely across its codimension-at-least-two complement to a nowhere-vanishing top form on the smooth stack M_i. Its absolute-value measure on the generically free coarse locus is the imported orbifold measure. These local forms glue as measures; no global triviality of the canonical bundle on all of A is assumed. (GWZ20 §6.3, pp.570–571, Lemma 6.13 and Remark 6.14).

The zero-section determinant line of the invariant relative differentials is trivialized on the chosen base neighborhood. A group scheme gives that line by pullback, not a global generator without shrinking. φ is étale over this neighborhood, so pullback preserves a generator integrally. Smoothness/normality and a codimension-two complement are required for invertible-sheaf Hartogs extension.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §6.3, pp.570–571, Lemma 6.13 and Remark 6.14).

- On M′ the form is π*η∧θ, under the canonical torsor differential map.
- A top-form section with this restriction extends uniquely and remains a generator across a codimension-two complement in the smooth stack.
- On regular fibres θ1,b is exactly φ_b*θ2,b.
- Changing either chosen local generator by an integral unit leaves the induced p-adic measure unchanged.
- On M(O_F)^natural the absolute-value measure agrees with the imported μ_orb.
- Restriction to a smaller base neighborhood agrees with the same construction.

One proof route is as follows. Import the invariant differential identification for a smooth group torsor from the generic orbifold/transgression supplier contract, including independence of its trivialization. Apply pullback and the determinant exact sequence for the smooth torsor map to construct the nowhere-zero form on M′. Use the smooth-stack Hartogs contract extending SchemeAndStackFoundations §0.6 through AlgebraicModuliForArithmeticGeometry §7.3 to extend the section and its inverse trivialization across codimension two. Use the imported orbifold/gauge comparison on the free locus. Changes of compatible integral generators multiply absolute values by units of norm one, giving the same measure.

**Checks.**

- For E×A¹/O_F with invariant elliptic differential θ, ω=dt∧θ and fibre integration uses |θ|.
- Replacing θ by uθ with u∈O_F× multiplies the analytic density by |u|=1.
- Replacing θ by πθ multiplies fibre volume by q⁻¹ and is not a change of integral generator.
- A codimension-one exceptional boundary is not covered by the uniqueness-and-nonvanishing assertion; its canonical discrepancy changes the top form.
- The exceptional divisor after blowing up a smooth point blocks the extension argument for the old torsor locus.
- For the product elliptic system, η=dt and a fixed invariant elliptic differential give the product measure. For a=xy on G_m², da=y dx+x dy and da∧(−dx/x)=dx∧dy; using dx/x reverses the sign.
- Over both Q₃ and F₃((t)), take π=3 or t respectively. Then vol(O_F)=1, vol(πO_F)=1/3, and π²(dx)⊗² has density |π²|^(1/2)=1/3; the inverse scaling would give 3.
- On A² minus its origin, the trivialization 1 of O extends uniquely as 1; the omitted point has codimension 2.
- On G_m⊂A¹, t cannot extend as a trivialization of O because t(0)=0; this codimension-one complement is excluded.
- Extending 1 and −1 across the origin in A² retains their distinct values; a zero-section extension would not be an invertible trivialization.

*Needs:* §2.2 (dual hitchin systems); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the smooth-stack Hartogs contract (gap:smooth-stack-hartogs).

### 2.4 Twisted counts as local integrals

For an admissible smooth finite abelian quotient M/O_F of pure relative dimension m and an admissible μr-gerbe α, #^α_st(M_k)/q^m=∫_(M(O_F)^natural) conjugate(fα)dμ_orb, where fα(x)=exp(2πi inv(x*β)) for the induced Brauer gerbe β and the fixed normalized embeddings. Here M(O_F)^natural means coarse integral points whose generic point is in the free locus. (GWZ20 §5.6, Corollary 5.29, p.564).

Use the precise root, tame and admissible-gerbe assumptions exported by the generic orbifold/transgression supplier contract. The Hasse/transgression identification must include the integral-to-special-fibre comparison and the μ_(r|Γ|) root bound; both are part of the generic orbifold contract.

One proof route is as follows. Apply the imported specialization-sector measure formula q^(−w)/|Aut| and the Hasse/transgression theorem to integrate each constant transgression phase. Reindex γ by γ⁻¹. The age identity w(γ)=m−F(γ⁻¹) and dualization of the inertia local system produce complex conjugation of fα. Sum all rational sector classes. The normalization is q^m, not the base dimension or a coarse unweighted count.

**Checks.**

- For a smooth scheme with trivial gerbe, recover Weil’s volume formula #M(k)/q^m.
- For a primitive cube-root phase, omitting the conjugation gives its inverse and fails the fixed convention.

*Needs:* §0.7 (gerbe-twisted stringy invariants); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; TauCetiRoadmap.ClassFieldTheory Layer 5; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### 2.5 Equal volumes of dual regular fibres

For a dual pair and b∈A(O_F)∩A♦(F), if both regular fibres have F-points, then ∫_(M1,b(F))|θ1,b|=∫_(M2,b(F))|θ2,b|. The forms are exactly those of §2.3. (GWZ20 §6.3, Lemma 6.16, p.572).

The fibres P_i,b are dual abelian varieties and the isogeny is self-dual of prime-to-residue-characteristic degree. The local index input is needed for F=k((t)) as well as characteristic-zero local fields. The D7.6 local-duality statement assumes characteristic zero; the equal-characteristic local-duality supplier contract records this extension.

One proof route is as follows. Trivialize each torsor at an F-point; invariant forms make the integral independent of that point. Apply LogicAndDefinabilityInNumberTheory §2.11 to the dual abelian varieties with θ1=φ*θ2; its field range includes equal characteristic. An alternative index proof uses ArithmeticGaloisDuality D7.6 and its equal-characteristic extension as follows. Change variables under φ: the integral on P1 is |ker φ(F)| times the integral on φ(P1(F)) with θ2. Translation invariance multiplies the latter by |P2(F)/φP1(F)| to give the full P2 volume. Apply the self-dual isogeny index theorem, extended to equal characteristic, prime to the residue characteristic, by the equal-characteristic local-duality supplier contract, to identify these two finite factors.

**Checks.**

- For φ=id on a self-dual elliptic product, both finite factors are 1.
- For φ=[n] on a principally polarized elliptic curve at n prime to p, the finite kernel and cokernel have the same order even when not every geometric n-torsion point is F-rational.

*Needs:* §2.3 (compatible gauge forms); TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and self-dual isogenies); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.11–2.12; the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### 2.6 Fibrewise gerbe-character integrals

For every b∈A(O_F)∩A♦(F) in a dual pair, ∫_(M1,b(F)) fα1|θ1,b|=∫_(M2,b(F)) fα2|θ2,b|, with the empty-domain integral equal to zero. (GWZ20 §6.3, Theorem 6.17, pp.573–574).

Use the sufficient local Brauer condition in §2.2 and the evaluation formula of §1.6 for arithmetic gerbes on the regular fibres. Retain the generic orbifold/transgression supplier contract and, for equal-characteristic F, the equal-characteristic local-duality supplier contract.

One proof route is as follows. If both point sets are empty, both integrals vanish. If exactly one is nonempty, identify that torsor with its abelian group. By §1.6 its phase is the constant fα(0) times the character x↦exp(2πi⟨x,t⟩) of the opposite torsor class t, which is nonzero because the opposite fibre has no F-point. Local Tate nondegeneracy makes the character nontrivial, and Haar translation gives integral zero. If both are nonempty, the sufficient local condition makes both underlying Brauer gerbes neutral. Their evaluation functions are 1 by the imported factorization, and §2.5 applies. The symmetric one-empty case is identical with the roles exchanged. Conjugating the equality supplies the convention used in §2.4.

**Checks.**

- A nontrivial character has integral zero even after multiplication by a constant root of unity.
- The both-nonempty case requires Brauer triviality, not just constancy with an unknown phase.

*Needs:* §2.5 (equal volumes of dual regular fibres); §2.2 (dual hitchin systems); §1.6 (evaluation of arithmetic gerbes on abelian varieties over local fields); TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and self-dual isogenies); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; Mathlib `sum_hom_units_eq_zero`; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### 2.7 Fibrewise arithmetic mirror symmetry

For a dual pair over finite k=𝔽q, the twisted stringy counts agree. More precisely, for every a∈A(k) and every finite extension k_m/k, the alternating geometric-Frobenius trace of the inertia-fibre compact cohomology with coefficients Nα1⊗ℚ̄ℓ(−F1) equals that for Nα2⊗ℚ̄ℓ(−F2), over a after base change to k_m. The rational age twist is made on each connected sector with a compatible finite denominator; it is not a fractional cohomological shift. (GWZ20 §6.2, Theorem 6.12, pp.569–570; proof pp.574–575). The source states this for constant Γ, as its Definition 4.10 requires; for the nonsplit finite étale Γ admitted by §2.1 it is this roadmap’s extension through the generic orbifold/transgression contract (gap:generic-orbifold-transgression).

The proper coarse maps and finite inertia justify the required proper/compact fibre trace comparison from the generic orbifold/transgression supplier contract. Both total dimensions agree. The finite extension inherits or enlarges the chosen roots consistently.

One proof route is as follows. Base change the finite-field pair to O_F=k[[t]], so equal-characteristic local duality is necessary. Fix a residue base point a. The stack trace formula and §2.4 identify the normalized inertia-fibre trace with the integral over the reduction tube above a, with the required conjugate phase. Use §2.3 and Fubini. Remove the complement of A♦(F), which is a null set for the smooth base measure, then apply §2.6 on every remaining fibre. The common q^dim M normalization gives equality of the unnormalized traces. Repeat over every finite extension and sum over a for the global stringy count.

**Checks.**

- The conclusion is an equality of alternating traces for all Frobenius powers. It does not itself separate individual cohomological degrees or detect extension classes.
- For the neutral elliptic product it reduces to the same ordinary count on both sides above each a.

*Needs:* §2.4 (twisted counts as local integrals); §2.6 (fibrewise gerbe-character integrals); §2.3 (compatible gauge forms); TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### 2.8 Complex mirror symmetry for abstract systems

For a dual pair over a finite-type subalgebra R⊂C, E_st((M1)_C,α1)=E_st((M2)_C,α2), in the rational-bidegree realization with the fixed character conventions. (GWZ20 §6.2, Theorem 6.11, p.569; reduction p.570).

Spread all duality data, finite denominators, admissible roots and the sufficient local condition over a common model; perform only the allowed base changes preserving the system data. The proof uses the supplier contracts required by §0.8 and §2.7.

One proof route is as follows. Apply §2.7 after each good finite-field specialization of the common model, including every finite extension. Apply §0.8 to that equality of twisted counts. The complex fibres are preserved by the chosen embeddings and the finite étale cover; translate the character conventions on inertia to the original complex sector sum.

**Checks.**

- The theorem applies to the sufficient local Brauer formulation, hence in particular to every literal dual pair of Definition 6.9.
- For the trivial relative group with M=A=Spec k and neutral band μ₁, both sides are 1; for empty fibres they are 0. These are different from any implication between μr and Brauer neutrality.

*Needs:* §0.8 (stringy counts determine e-polynomials); §2.7 (fibrewise arithmetic mirror symmetry); the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); the equivariant scissor contract (gap:equivariant-grothendieck); the fractional equivariant Hodge–Tate contract (gap:fractional-equivariant-hodge-tate).

### Examples

For a self-dual elliptic product E×A¹ with identity isogeny and neutral gerbes, the forms are dt∧θ on both sides and the fibre integrals are the same volume V. At a fibre with exactly one rational torsor, the nontrivial opposite Tate character makes both integrals 0. Multiplying θ by a uniformizer at q=3 scales V to V/3. (GWZ20 Lemmas 6.13, 6.16, Theorem 6.17.)

### Dependencies

the smooth-stack Hartogs contract (gap:smooth-stack-hartogs); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §2.11 (dual-abelian volume invariance); §1.6 (evaluation of arithmetic gerbes on abelian varieties over local fields); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; §1.3 (the principal splitting torsor); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.3–A3.5; TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`; §0.7 (gerbe-twisted stringy invariants); TauCetiRoadmap.ClassFieldTheory Layer 5; TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and self-dual isogenies); Mathlib `sum_hom_units_eq_zero`; TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; §0.8 (stringy counts determine e-polynomials).

## Layer 3: Stable Higgs moduli and spectral torsors

### 3.1 Stable trace-free fixed-determinant moduli

For a smooth proper geometrically connected genus-g curve X/S over a noetherian base, a line bundle D, n≥1 invertible on S and L of degree d with gcd(n,d)=1, form the stable locus in the imported D-Higgs stack, impose Trθ=0 and an isomorphism det E≃L, and μn-rigidify its scalar stabilizers. Denote the resulting finite-type separated coarse algebraic space by M_SL^L; in the source’s projective-curve setting prove that it is a quasiprojective scheme. Stability means every proper nonzero θ-invariant saturated subbundle has smaller slope. The trace-free characteristic-coefficient map lands in A=⊕_(i=2)^n f_*D^i when these sheaves satisfy the stated locally-free/base-change interface. (GWZ20 §7.1, Definition 7.1 and Remark 7.2, pp.575–576).

The basic Higgs stack, characteristic polynomial and spectral carrier are imports from EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14, not new definitions here. Its existing node is over finite fields; the relative noetherian-family adapter is requested explicitly. For D=ω import the general stable GLn carrier and its stability from CountingBundlesAndHallAlgebrasOfCurves §§7.1, 7.3; extend those notions to this D-twist and fixed determinant, retaining their meaning. Fixed determinant with its isomorphism has μn scalar stabilizers; the unfixed-determinant stable stack has Gₘ stabilizers. Do not rigidify the former by Gₘ. Use projective curves or a verified relative polarization where the moduli construction needs one.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §7.1, Definition 7.1 and Remark 7.2, pp.575–576).

- The stable SL stack maps to the imported Higgs stack by forgetting the determinant isomorphism, and carries trace zero.
- The map from the stable fixed-determinant stack to M_SL^L is a μn-gerbe with the imported universal property of rigidification.
- The construction agrees with base change in the verified moduli/coarse-base-change setting, including the chosen field extensions and spread models.
- The Hitchin map records characteristic coefficients a2,…,an, under the H⁰(D^i) base-change comparisons.
- For n=1 the fixed line and trace-zero condition leave a point over each base, with trivial automorphisms.
- When D=ω, the underlying stable object and its slope condition agree with CountingBundlesAndHallAlgebrasOfCurves §7.1 and the forgetful map lands in the coarse moduli of CountingBundlesAndHallAlgebrasOfCurves §7.3.

One proof route is as follows. Extend the imported carrier by descent to the specified family bases, using AlgebraicVectorBundles for finite locally free sheaves, tensor products and determinants. Use the existing slope/stability interface, with D replacing ω, and the imported bounded Quot/parameter-space machinery. The required stable-Higgs GIT/adequate-quotient interface is the relative Higgs-moduli supplier contract; the Hilbert and Quot parameter constructions alone do not assert this quotient. Form the fixed-determinant and trace-zero fibre, then apply the existing rigidification and its base-change theorem. Establish finite type and separatedness; prove quasiprojectivity in the selected projective family setting. Use characteristic coefficients rather than power traces, so no division by 2,…,n is hidden. Record the actual H⁰(D^i) base-change identification.

**Checks.**

- For n=1, A is the zero vector space and M_SL^L is Spec k; θ must be zero.
- For stable rank 2 in characteristic different from 2, scalars preserving det E≃L satisfy λ²=1; Gₘ would give the wrong stabilizer.
- For a rank-2 degree-0 Higgs bundle (O⊕O,0), the summand O is invariant of equal slope, so the object is not stable.
- The existing InvertibleSheaf D and finite locally free E live on X_S, and θ:E→E⊗D is O_X-linear; placing E on S does not type this datum.
- Over an algebraically closed field a stable fixed-determinant object has exactly μn automorphisms before rigidification and none afterwards.

*Needs:* TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.1; TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§1.3, 2.1–2.2, 7.3, 8.2; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; TauCetiRoadmap.JacobianChallenge Layer A; TauCetiRoadmap.JacobianChallenge Layer B; TauCetiRoadmap.JacobianChallenge Layer C; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 3.2 Smoothness of stable fixed-determinant moduli

Under the preceding moduli hypotheses, suppose D⊗ω_X/S⁻¹ has positive degree on every geometric fibre or is trivial. Then M_SL^L is smooth over S. At a geometric point its deformation complex is End0(E)→End0(E)⊗D, δ(u)=θu−(u⊗1)θ, in degrees 0 and 1; H⁰ gives infinitesimal automorphisms, H¹ the tangent space and H² the obstruction. Stability and n invertible kill H⁰, and Serre duality and the D condition kill H². Its relative dimension on nonempty fibres is (n²−1)deg D. (GWZ20 §7.1, Lemma 7.3 and proof, pp.576–577).

The degree and base-change hypotheses are fibrewise and the moduli deformation interface is the relative Higgs-moduli supplier contract. For D=ω the degree formula is 2(n²−1)(g−1); a negative value signals emptiness, not a negative-dimensional smooth scheme. When the residue characteristic divides n, scalar endomorphisms may have trace zero, so this argument is not applicable.

One proof route is as follows. Use the imported deformation theory of Higgs pairs and the trace/determinant differential to obtain the End0 complex, with an explicit cohomological indexing convention. A stable Higgs endomorphism is scalar. Since n is a unit its trace-zero part vanishes. Serre duality identifies H² with trace-free Higgs maps E→E⊗ωD⁻¹. Negative degree gives vanishing by stability; for D=ω it reduces to the same trace-free endomorphism vanishing. Apply the infinitesimal lifting criterion to the actual moduli stack and rigidification; use Riemann–Roch for the stated dimension and verify relative smoothness by the chosen finite-presentation criterion.

**Checks.**

- For n=1 the complex is zero and the dimension is zero.
- In characteristic p dividing n, id_E∈End0(E) demonstrates why the n-unit hypothesis cannot be removed.

*Needs:* §3.1 (stable trace-free fixed-determinant moduli); TauCetiRoadmap.JacobianChallenge Layer B; TauCetiRoadmap.JacobianChallenge Layer C; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 3.3 PGLn moduli as a finite quotient

Let Γ=J_X[n], finite étale of rank n^(2g) when n is invertible. Tensoring E by an n-torsion line defines its action on M_SL^L. Define the stable PGLn stack of degree class d mod n by M_PGL^d=[M_SL^L/Γ], and identify it with the intended geometric stable PGL moduli by étale-local lifts and descent. The quotient is independent of L after the corresponding determinant twists; its coarse quotient and the stack are kept distinct. (GWZ20 §7.1, Definition 7.4 and Remark 7.5, p.577).

After a finite étale base change Γ may be made constant; arithmetic formulas explicitly use this choice. All n-torsion actions and quotients are sheaf/stack actions, including the determinant trivialization coherence before rigidification. A finite-field count over k uses the possibly nonsplit finite étale group scheme J_X[n] and its rational torsors. Equality after a splitting extension alone does not descend a trace over k; the generic orbifold contract includes Galois descent and Frobenius-compatible sector permutation on nonsplit group schemes. This construction does not assert generic freeness until §3.9 verifies it.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §7.1, Definition 7.4 and Remark 7.5, p.577).

- The map M_SL^L→[M_SL^L/Γ] is the quotient atlas with its Γ-descent datum.
- There is a coarse quotient morphism, distinct from the quotient atlas and the stack.
- Changing the determinant by an nth power gives the same PGL degree component via tensoring.
- Pullback of Γ and its action commutes with the quotient-stack construction.
- The Γ-invariant SL Hitchin map descends to the PGL stack and its coarse space.
- At a geometric point represented by E, inertia is {N∈J_X[n]:E⊗N≃E as Higgs bundles}.

One proof route is as follows. Use tensor functoriality of the existing Higgs carrier and det(E⊗N)=det(E)N^n to define Γ action on the rigidified space. Use quotient-stack descent from AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20. A local lift of a PGL bundle differs from another by tensoring a line bundle; normalize determinants using the n-power map and descend. Construct the coarse quotient separately with the imported finite quotient interface. The residual fixed-point stabilizers remain in the PGL stack.

**Checks.**

- For n=1, Γ is trivial and both SL1 and PGL1 spaces are a point.
- Where Γ acts freely, the quotient stack is the smooth algebraic-space quotient and has trivial inertia.
- If a geometric stable fixed-determinant space is a single point and Γ is nontrivial, the quotient is BΓ, not a point. This boundary is excluded from the generically free integration certificate until separately treated.
- For n=2 and g=2 in odd characteristic, Γ has 2^4=16 geometric points; replacing it by μ2 gives the wrong quotient.
- The Γ action preserves the Hitchin map because tensoring a line preserves the characteristic polynomial.
- For y²=x³+x+3 over 𝔽₁₇ the cubic has no rational root, so E[2](𝔽₁₇) has only its identity although its geometric order is 4 and μ₈ lies in the field. Required roots alone do not make Γ constant.
- Frobenius actions diag(1,1) and diag(1,−1) have traces 2 and 0, but both have trace 2 on every even power. Equality over a splitting quadratic extension alone cannot prove equality over k.

*Needs:* §3.1 (stable trace-free fixed-determinant moduli); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.2; TauCetiRoadmap.JacobianChallenge Layer D.

### 3.4 Properness of the stable Hitchin morphism

For gcd(n,d)=1 in the smooth projective curve and D setting above, the stable GLn and fixed-determinant trace-free SLn Hitchin morphisms are proper; so is the PGL coarse Hitchin map. Properness is not asserted of the nonproper total Higgs space over the ground field. (GWZ20 §7.1, Theorem 7.6, p.577).

Use the actual noetherian relative moduli construction, not just properness on the anisotropic locus. D-twisted semistable properness and its relative version are supplied by the relative Higgs-moduli contract. In the canonical GLn case the precise existing CountingBundlesAndHallAlgebrasOfCurves §7.3 statement is consumed under its original hypotheses.

One proof route is as follows. Import the semistable Hitchin properness theorem for the selected family bases through the relative Higgs-moduli supplier contract. Coprimality identifies stable and semistable rank-degree classes. The determinant and trace conditions form the closed relative fibre needed for properness of SL. Apply finite quotient/coarse descent for the PGL map. Verify the valuative criterion after the necessary finite extension and descent, without inferring that the stable locus of an arbitrary proper map is proper.

**Checks.**

- For n=1 the SL map is point→point, and GL1 is Pic^d(X)×H⁰(D)→H⁰(D), proper because Pic^d is proper.
- This does not turn the entire unbounded Higgs stack of EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14 into a proper finite-type object.

*Needs:* §3.1 (stable trace-free fixed-determinant moduli); §3.3 (pgln moduli as a finite quotient); TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§1.3, 2.1–2.2, 7.3, 8.2; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 3.5 Determinant change and Γ-twists

For N a line bundle, tensoring gives M_SL^L≃M_SL^(L N^n) over the Hitchin base. If L1,L2 have the same degree, the n-root sheaf T of L2 L1⁻¹ on the base is a Γ-torsor; contracting M_SL^L1 with T gives M_SL^L2, with the tensor action and descent conventions fixed. Over finite k use the Kummer identification J_X(k)/nJ_X(k)≃H¹(k,Γ), which needs Lang’s vanishing H¹(k,J_X)=0. (GWZ20 §7.1, Lemma 7.7, pp.578–579; §7.5, pp.590–591).

For a family the root object is an étale sheaf torsor, not an asserted global line bundle. For the arithmetic ν-labeling used in §7.5, set ν=δ(L1 L2⁻¹) as in the source, so its geometric Frobenius acts as ν⁻¹Fr. This is the inverse of the positive-root cocycle if that cocycle was used for T.

One proof route is as follows. Tensor the Higgs bundle and its determinant isomorphism; the inverse is tensoring by N⁻¹. Choose local nth roots of L2 L1⁻¹ in the relative Jacobian and compute their Γ transition cocycle. The same cocycle glues the tensor maps. Over finite fields import the Kummer exact sequence and Lang vanishing. Record explicitly the inverse relabeling between the root torsor and the source’s arithmetic twist ν.

**Checks.**

- If L2=L1N^n with N rational, the twist class is zero.
- Tensoring by a line changes degree by n deg N, so determinant degree modulo n is preserved.

*Needs:* §3.1 (stable trace-free fixed-determinant moduli); §3.3 (pgln moduli as a finite quotient); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.2; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20.

### 3.6 Stable spectral fibres as norm preimages

On the regular locus with smooth connected spectral cover π:Y_a→X of degree n, set M=det(π_*O_Y). The spectral correspondence identifies the SL Hitchin fibre with P_a^L=Nm_π⁻¹(L M⁻¹), a torsor under P_a^0=ker(Nm:J_Y→J_X) when that kernel is connected. The norm is Nm(B)=det(π_*B)M⁻¹. The PGL fibre is the corresponding quotient by Γ. The determinant correction is L M⁻¹, never L M. (GWZ20 §7.2, Lemma 7.8, pp.579–580).

Use the imported spectral correspondence with a verified relative-base-change version, and the stable regular spectral locus. Smoothness of Y alone is not assumed to imply connectedness, stability or nonemptiness; these are established in §3.9 or remain the separate low-genus calculation of §3.9. For the monic spectral algebra, π_*O_Y=⊕_(j=0)^(n−1) D^(−j), so M=D^(−n(n−1)/2), independent of the Hitchin parameter.

One proof route is as follows. Use the EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14 spectral module equivalence and its relative extension requested in the relative Higgs-moduli supplier contract. A spectral line B pushes forward to E with det E=Nm(B)M. Solve det E=L to obtain the displayed inverse-M norm target; retain the determinant-isomorphism and rigidification comparisons between the spectral Picard stack and its fibre space. Use the relative norm map on Jacobians from the A2 request, and identify its kernel action with the imported Picard action. Quotient by Γ for PGL.

**Checks.**

- For n=1, M=O and Nm=id, so the fixed-L fibre is a point.
- For n=2, M=D⁻¹ and the norm target is L D; the opposite sign would give L D⁻¹.

*Needs:* §3.1 (stable trace-free fixed-determinant moduli); §3.3 (pgln moduli as a finite quotient); TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 3.7 The PGLn Prym group

For the spectral family and its norm-kernel group P_SL acting on the stable SL fibration, define P_PGL=P_SL/Γ using the pullback inclusion π*:J_X[n]→P_SL. On the smooth connected regular locus this identifies with J_Y/π*J_X. The map φ:P_SL→P_PGL has kernel Γ and is a finite étale isogeny when n is a unit and the pullback inclusion has been verified. (GWZ20 §7.2, Definition 7.9, p.580; Proposition 7.10, pp.580–582).

The global norm-Picard family over A, including singular spectral fibres, is an imported relative Picard-action interface; its extension is explicitly requested from EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14 and A2. Check π* injectivity and connected norm kernel on the regular locus. For deg D>0, the negative-degree spectral summands give the required pullback injectivity; low-degree exceptions remain the separate low-genus calculation of §3.9. No general construction of abelian quotients or duals is duplicated: A3 supplies those on A♦.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §7.2, Definition 7.9, p.580; Proposition 7.10, pp.580–582).

- There is a quotient homomorphism P_SL→P_PGL with kernel π*J_X[n].
- Over A♦, P_PGL≃J_Y/π*J_X, equivariantly with the natural maps.
- The quotient and its action agree with all verified base changes of the spectral family.
- P_PGL acts on the PGL fibration, with identity and composition laws induced from the Picard action.
- Over A♦ this is the A3 finite étale abelian-scheme quotient isogeny, not a quotient of groups of rational points.
- The kernel Γ has geometric rank n^(2g) where the pullback inclusion is faithful.

One proof route is as follows. Use the norm identity Nm(π*N)=N^n to map Γ into the SL norm kernel; prove injectivity under the selected spectral hypotheses. Form the fppf quotient, importing finite quotient representability and A3 on regular abelian fibres. The n-power map on J_X is fppf-surjective; use it to identify the quotient of the norm kernel by Γ with J_Y/π*J_X on A♦. Extend the specified group/action globally by the imported Picard-family construction, with its exact smoothness and étaleness obligations.

**Checks.**

- For n=1 the SL norm kernel and PGL quotient are trivial.
- For n=2,g=2 in odd characteristic and the connected regular spectral locus, the quotient kernel has order 16.
- In general P_PGL(F) need not equal P_SL(F)/Γ(F); the connecting H¹(F,Γ) term cannot be dropped.
- Nm∘π*=[n] on J_X, with the imported Jacobian and its existing multiplication map.
- On A♦ the relative dimensions of the two Pryms agree.

*Needs:* §3.6 (stable spectral fibres as norm preimages); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.3–A3.5; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.2; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 3.8 Duality of SLn and PGLn Pryms

On A♦, the principal polarizations of the spectral and base Jacobians identify P_PGL with (P_SL)∨. Under this identification, φ:P_SL→P_PGL is self-dual. The comparison identifies the actual evaluation/Poincaré pairings and the kernel Weil pairing, not merely the dimensions of two abelian schemes. (GWZ20 §7.2, Proposition 7.10 and proof, pp.580–582).

The spectral norm is dual to pullback under the Jacobian principal polarizations, through AbelianSchemesAndArithmeticModuli §§A2.2–A2.3. The regular connectedness and pullback-injectivity hypotheses of §3.6 apply.

One proof route is as follows. Import normalized Poincaré biduality and duality of norm versus pullback from A2. Dualize the exact norm-kernel sequence. The dual quotient J_Y/π*J_X identifies with P_SL∨; compare it with §3.7. Track the induced maps from the principal polarization of J_Y to verify the self-duality square, using A3 dual isogenies and Cartier-dual kernels.

**Checks.**

- The kernel pairing is the transported Jacobian n-torsion pairing; a dimension-only isomorphism would not suffice.

*Needs:* §3.7 (the pgln prym group); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.3–A3.5; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; TauCetiRoadmap.JacobianChallenge Layer E.

### 3.9 Regular locus and abstract-system certificates

Construct the specified regular open and torsor loci for the stable SLn and PGLn fibrations, prove smoothness of the relevant Picard group families, properness of the coarse maps, generic freeness/admissibility of the quotient, and codim(M∖M′)≥2, and thereby certify Definition 6.8. On the geometric range where smooth spectral curves are connected and the stable regular locus is nonempty, the source’s smooth-spectral locus supplies A♦. The theorem’s full genus range requires a separate verification; it is not silently reduced to g≥2. (GWZ20 §7.2, Propositions 7.11–7.12, p.582).

Use the actual stable moduli and characteristic/root hypotheses established in this layer. The finite-field EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14 anisotropic properness and δ-codimension theorem do not automatically give this noetherian-family stable certificate. For g=1,D=ω=O,n>1 a generic trace-free characteristic polynomial has distinct constant roots. Its global projectors split any Higgs bundle into eigenbundles; one has slope at least the total slope. Hence the stable generic fibre is empty. Smooth spectral therefore cannot be treated as automatically connected with nonempty stable fibres.

One proof route is as follows. Use the relative spectral and Picard action interfaces to identify the regular group torsors; compare the selected opens with the source’s regular locus. Prove the complement codimension and the quotient generic-freeness statement in the actual stable spaces, importing the needed Ngô regular-centralizer input through EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.14 with its exact relative-family hypotheses. For deg D>0, verify spectral pullback injectivity by the decomposition π_*O_Y and the vanishing of sections of negative-degree line bundles. Check connectedness and dense regular fibres in the precise range used. Establish the codimension certificate with these relative hypotheses. In the low-genus cases compute the stable locus, quotient stack and gerbe transgression directly as specified below.

For genus zero, n>1 and gcd(n,d)=1, prove emptiness for every allowed D of degree at most 0. Over an algebraic closure X=ℙ¹ and D=O(−2)=ω, O(−1) or O; these are the allowed twists of nonpositive degree, since deg(Dω⁻¹)>0 means deg D≥−1. Write E=⊕ᵢ O(aᵢ) with a₁≥⋯≥aₙ and let B be the full block of summands of maximal degree a₁. Not all aᵢ are equal, since otherwise n divides d. Thus 0<rank B<n and μ(B)=a₁>d/n. Every component B→(E/B)⊗D lies in H⁰(O(aⱼ+deg D−a₁))=0, because aⱼ<a₁ and deg D≤0, so B is θ-invariant and destabilizes. Hence the stable GL and SL spaces and the PGL quotient are empty; their ordinary, inertia and gerbe-twisted invariants are all 0. Emptiness is geometric and therefore descends to every allowed field.

The splitting used in this calculation follows from the curve cohomology of JacobianChallenge Layer B: take a saturated line O(a)⊂E of maximal degree. Such lines exist by saturating a nonzero rational section; their degrees are bounded above because clearing poles of a generic trivialization embeds E into O(m)^n, and any nonzero component of a line map forces its degree to be at most m. Split its vector-bundle quotient by induction; a quotient line O(b) with b>a would give a rank-two preimage with χ(F(−a−1))=b−a>0, contradicting maximality of a. Therefore b≤a and each extension splits because H¹(O(a−b))=0. This argument also supplies the split expression in arbitrary characteristic. (Boundary calculation using JacobianChallenge Layer B, Riemann–Roch and Serre duality.)

Rank one is separate: SL₁=PGL₁=point for every twist; on ℙ¹, GL₁=Pic^d(ℙ¹)×H⁰(D) is A¹ for D=O and a point for D=O(−1) or ω.

For D=ω=O in genus one with gcd(n,d)=1, determine the stable fixed-determinant space and its Γ action: a trace-free Higgs field on a stable bundle is a trace-free endomorphism, hence zero, and over an algebraic closure the stable bundle of rank n, degree d and determinant L is unique, so M_SL^L is one point, smooth of relative dimension (n²−1)deg D=0; tensoring by N∈Γ=J_X[n] preserves rank, degree and determinant, so every N fixes the point and M_PGL^e=BΓ, with inertia all of Γ, zero tangent space in every sector and no dense free locus. The powered gerbe, its commutator pairing and the sector sums on this quotient are the separate target §4.8, which uses the gerbe construction of §4.4; the invariant equality in this range is stated there, without a generically free quotient assertion. (GWZ20 Theorem 7.21, p.588; boundary calculation from the fixed-determinant definition of §3.1 and the quotient of §3.3.)

**Checks.**

- For X=ℙ¹, D=O, n=2, d=e=1 over C or F₃, E=O(a)⊕O(1−a) has a≥1. The lower matrix entry belongs to H⁰(O(1−2a)) of dimension 0, and the invariant line has slope a≥1>1/2. Both mirror invariants are 0. Here deg(Dω⁻¹)=2, so this is inside the main scope and outside a blanket stable regular-torsor certificate.
- For n=3, d=2 and E=O(1)⊕O(1)⊕O on ℙ¹/C with D=O, the maximal block has rank 2 and slope 1>2/3; all maps from it to O have section-space dimension 0. Taking one maximal line alone need not give a θ-invariant line.
- For n=2, d=0, E=O⊕O and θ=0, the full maximal block has rank 2 and slope 0=0. This excluded noncoprime case does not justify the strict instability argument; each line still obstructs stability by equality.
- At n=1 on ℙ¹ with D=O, SL and PGL counts are 1=1, while GL₁=A¹ has count 3 over F₃ and E=xy over C; imposing trace zero on GL₁ would give the wrong count 1.

*Needs:* TauCetiRoadmap.JacobianChallenge Layers A–B (degree, Riemann–Roch and Serre duality); §3.1 (stable trace-free fixed-determinant moduli); §3.3 (pgln moduli as a finite quotient); §3.2 (smoothness of stable fixed-determinant moduli); §3.4 (properness of the stable hitchin morphism); §3.8 (duality of sln and pgln pryms); §2.1 (abstract hitchin systems); TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 3.10 Spectral torsor products, powers and periods

With P_a^L=Nm⁻¹(L M⁻¹), contracted product gives P^L·P^L′≃P^(L L′ M⁻¹), and for every integer e, (P^L)^e≃P^(L^e M^(1−e)). Tensoring by π*Q gives P^L≃P^(L Q^n). The class of an SL spectral torsor is n-torsion, since the nth power norm target is realized by π*(L M⁻¹). For GL spectral Picard torsors, their period divides n when Pic¹(X)(F) contains an actual degree-one line bundle; its pullback has degree n. (GWZ20 §7.3, Lemmas 7.13–7.14, pp.582–583).

All equalities are equivariant isomorphisms of torsors under the same regular Prym or Jacobian, not equalities of chosen points. For GL period arguments the degree-one line bundle is established over finite residue fields by Picard/Lang/Brauer inputs and lifted in the smooth Picard family before passing to F. Use integer powers in the commutative torsor group, including inverse torsors; the e=0 result is P^M, the norm-identity torsor.

One proof route is as follows. Multiply norm targets using the norm homomorphism and solve again for the determinant label. This gives the inverse-M correction in the product formula. Induct for nonnegative powers, use inverse torsors for negative powers, and compare pullback line bundles via Nm(π*Q)=Q^n. Exhibit π*(L M⁻¹) in the nth contracted power to prove the SL period bound. For GL, exhibit the degree-n pullback line and use the degree torsor law. Record M=D^(−n(n−1)/2) as a single line on X independent of a; the correction N is therefore uniform over all regular spectral parameters.

**Checks.**

- At e=1 the determinant label is L; at e=0 it is M and the norm target is O.
- For n=2, (P^L)^2=P^(L²D), not P^(L²D⁻¹).
- A class t killed by n is zero iff et is zero whenever gcd(e,n)=1, by Bézout; coprimality with d alone would be irrelevant.

*Needs:* §3.6 (stable spectral fibres as norm preimages); TauCetiRoadmap.JacobianChallenge Layer A; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.2.

### Examples

For n=2,g=2,D=ω, the smooth connected spectral curve has genus 5, the Prym dimension is 5−2=3 and the Hitchin base has dimension 3. The total dimension is 6. The determinant correction M=ω⁻¹ has degree −2, the norm target is Lω, and Γ has order 16. For rank one every Prym and Hitchin base is a point. (GWZ20 Lemmas 7.3, 7.8 and Proposition 7.10.)

### Dependencies

TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison §§3.6, 3.8, 3.10, 3.12–3.14; TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.1; TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§1.3, 2.1–2.2, 7.3, 8.2; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; TauCetiRoadmap.JacobianChallenge Layer A; TauCetiRoadmap.JacobianChallenge Layer B; TauCetiRoadmap.JacobianChallenge Layer C; Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.2; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.3–A3.5; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; TauCetiRoadmap.JacobianChallenge Layer E; §2.1 (abstract hitchin systems).

## Layer 4: Degree independence and dual gerbes

### 4.1 GLn coprime-degree point counts

Let X/𝔽q be smooth projective geometrically connected, Dω⁻¹ of positive degree or trivial, n,d>0 coprime, p∤nd, μ_(n^(2g))⊂𝔽q, and e coprime to n and p. Then #M_GL^d(𝔽q)=#M_GL^e(𝔽q). This is the D-twisted comparison by local integration. The canonical GL carrier is CountingBundlesAndHallAlgebrasOfCurves §7.3; its canonical coprime counting formulas of §§8.3 and 10.4 are not used here. (GWZ20 §7.3, Theorem 7.15 and proof, pp.583–584).

All stable moduli and properness hypotheses from Layer 3 apply. The generic spectral Picard torsor period bound uses an actual degree-one line bundle on X, available over finite fields and liftable over the chosen smooth Picard model. The torsor-class argument uses gcd(d,n)=gcd(e,n)=1; coprimality of e with d is not used.

One proof route is as follows. Lift the curve and finite list of line bundles to a complete unramified characteristic-zero discrete valuation ring with residue field 𝔽q. Smoothness of the curve and H²=0 give the curve/Picard lifting interface requested in the relative Higgs-moduli supplier contract. On the regular spectral base the degree-d fibre is the dth power of the degree-one Jacobian torsor, whose class is killed by n. Bézout makes its triviality independent of d in the unit classes modulo n. Choose common invariant relative forms and a base form, remove the measure-zero singular base, and integrate fibre volumes. Nonempty Jacobian torsors have the same translation-invariant volume; empty ones contribute zero. Use Weil’s smooth-model formula and equal dimensions to return to point counts. For genus zero with deg D≤0 and for canonical genus one, use the separate calculations of §3.9; at rank one retain Pic^d(X)×H⁰(D).

**Checks.**

- For n=1 the space is Pic^d(X)×H⁰(D); Pic^d is a Jacobian torsor with a finite-field point and all degrees have the same count.
- With n=3,d=1,e=3, e is coprime to d but kills every order-3 torsor class. A nonzero class t has t≠0 and et=0; this excludes replacing gcd(e,n)=1 by gcd(e,d)=1.

*Needs:* §3.9 (low-genus stable-locus calculations); §3.4 (properness of the stable hitchin morphism); §3.10 (spectral torsor products, powers and periods); §2.3 (compatible gauge forms); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.3; TauCetiRoadmap.JacobianChallenge Layer D; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 4.2 SLn coprime-degree point counts

Assume p>n, gcd(n,d)=1, μ_(n^(2g))⊂𝔽q, and Dω⁻¹ of positive degree or trivial. Then there is a line bundle N of degree zero such that, for every integer e prime to n, #M_SL^L(𝔽q)=#M_SL^(L^e N^(e−1))(𝔽q). Set M=D^(−n(n−1)/2), of degree −n(n−1)deg D/2. For n odd, n divides deg M; choose Q with n deg Q=deg M and take N=M⁻¹Q^n. For n even, choose T with deg T=−(n−1)deg D and take N=T^(n/2)M⁻¹, of degree −(n/2)(n−1)deg D+n(n−1)deg D/2=0. The choices can be made over the residue curve and lifted uniformly before integration. (GWZ20 §7.3, Theorem 7.16 and proof, pp.584–585).

Here deg M is divisible by n exactly when (n−1)deg D is even, which holds for odd n and for D=ω, where deg D=2g−2, but fails for even n and odd deg D; the even-n choice covers that case without any parity hypothesis. Existence of Q or T over a finite field follows from a Picard degree component having a rational point and Br(𝔽q)=0, not from the integer degree calculation alone. The line N is independent of the spectral parameter a.

One proof route is as follows. Lift the curve and the finite list of line bundles to a complete unramified characteristic-zero discrete valuation ring with residue field 𝔽q, through the relative Higgs-moduli supplier contract, and use §3.10: an n-torsion class t is zero iff et=0 for gcd(e,n)=1. The eth power is P^(L^e M^(1−e)). For n odd, tensor by π*Q^(e−1) to replace that label by L^e(M⁻¹Q^n)^(e−1)=L^e N^(e−1). For n even, e is odd, so (e−1)/2 is an integer and L^e N^(e−1)=L^e M^(1−e)⊗(T^((e−1)/2))^n; tensor by π*T^((e−1)/2) to pass between the two labels. Integrate the resulting identical triviality indicators against the same invariant Prym volume and base form. Apply Weil’s formula to the equal total volumes. For genus zero with deg D≤0 and n>1, apply §3.9 directly: every compared stable space is empty, independently of the determinant degree in the coprime classes. Rank one gives the identity 1=1. The sign of M in N and in the torsor power is the one fixed by §3.10.

**Checks.**

- For n=2,g=2,D=ω of degree 2, deg M=−2; the even-n choice takes deg T=−2 and N=Tω of degree 0. Since deg M is even here, Q of degree −1 with N=ωQ² also has degree 0, and the two determinants L^e N^(e−1) differ by the square of (TQ⁻²)^((e−1)/2), e being odd.
- At e=1 the right determinant is L, giving the identity comparison.
- At n=2 and deg D=1, deg M=−1 is odd, so no integral-degree Q satisfies 2 deg Q=−1 and the odd-n choice is unavailable, while T of degree −1 gives N=TM⁻¹ of degree 0; for T=D⁻¹ this is N=O, and the comparison #M_SL^L=#M_SL^(L^e) for odd e is the determinant twist of §3.5, since L^e=L⊗(L^((e−1)/2))². At n=3 and deg D=1, deg M=−3, so deg Q=−1 works although deg D is odd. At n=4, deg D=1 and e=3, deg M=−6, deg T=−3, N=T²M⁻¹ has degree 0 and L³N²=L³M⁻²⊗T⁴ with T⁴ a fourth power.

*Needs:* §3.9 (low-genus stable-locus calculations); §3.10 (spectral torsor products, powers and periods); §3.4 (properness of the stable hitchin morphism); §2.3 (compatible gauge forms); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; TauCetiRoadmap.JacobianChallenge Layer A; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.ClassFieldTheory Layer 5; the relative Higgs/GIT/properness contract (gap:relative-higgs-git-properness), relative spectral Picard contract (gap:relative-hitchin-picard) and represented relative Picard contract (gap:relative-picard-norm-duality).

### 4.3 Betti and Hodge numbers in coprime degree

Over C with the same curve, D and coprimality hypotheses, the Betti numbers and the cohomologically graded Hodge numbers of M_GL^d are independent of the coprime degree, and so are those of M_SL^L. Within a fixed degree, changing L is realized by tensoring an nth root over C. Across coprime degree classes, combine the arithmetic comparisons with purity; equality of E-polynomials alone is insufficient. (GWZ20 §7.3, Corollary 7.17, p.586).

The compact-support geometric mixed Hodge realization and comparison are the geometric compact-support mixed-Hodge supplier contract. Import the canonical GL ℓ-adic purity theorem of CountingBundlesAndHallAlgebrasOfCurves §9.1. Its extension to D-twisted and fixed-determinant geometric Hodge cohomology is the explicit Higgs-sector purity supplier contract, not an existing conclusion of that section. Purity must state weight k for H_c^k, so the coefficient with p+q=k determines the sign and the cohomological degree.

One proof route is as follows. For two degrees d₁,d₂ prime to n choose e with ed₁≡d₂ mod n. For SL, fix the degree-zero line N of §4.2 (N=M⁻¹Q^n for n odd, N=T^(n/2)M⁻¹ for n even). Choose a line of degree (d₂−ed₁)/n and an nth root in Pic0 so that the second determinant differs from L₁^eN^(e−1) by an actual nth power. Spread these fixed choices simultaneously. Apply the SL count comparison and determinant twisting after every reduction on the common smooth tame spread model; use the GL comparison for GL. Katz then gives equal E-polynomials. This does not presume determinant independence of finite-field counts. Apply the requested smooth semiprojective Higgs purity theorem: the proper weighted Hitchin map supplies limits, the fixed loci are projective, and an actual Białynicki–Birula filtration with its affine-bundle shifts establishes geometric purity. Do not infer purity of an open variety merely from purity of a compactification. Weight-degree separation recovers each compact Hodge number from its E coefficient. Use Poincaré duality for the smooth equidimensional moduli to pass to ordinary cohomology and Betti numbers. Over C the n-power map on Pic0 is surjective, and tensoring removes determinant choices in a degree. For genus zero with deg D≤0 and n>1, §3.9 gives zero cohomology in every degree directly; at rank one GL is A¹ for D=O and a point for D=O(−1) or ω, while SL is always a point.

**Checks.**

- The result concerns coprime degrees; it does not identify a noncoprime stable space with a coprime one.
- A mixed Hodge polynomial without degree-purity cannot by itself determine Betti numbers.

*Needs:* §3.9 (low-genus stable-locus calculations); §4.1 (gln coprime-degree point counts); §4.2 (sln coprime-degree point counts); §0.3 (equivariant katz comparison); TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §9.1; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6, F.5–F.6 (Poincaré duality) and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); the fixed-determinant and twisted-sector purity contract (gap:higgs-sector-purity).

### 4.4 Hausel–Thaddeus gerbes

The stable fixed-determinant Higgs stack over its μn-rigidified space defines a μn-gerbe α_SL,L, the obstruction to a universal fixed-determinant family. Construct a coherent Γ-equivariant structure and descend it to α_PGL,L on [M_SL^L/Γ]. For e prime to n choose a with ad≡e mod n and put L′=L^a; the PGL degree is e mod n. The comparison uses α_SL,L^e and α_PGL,L′^d. (GWZ20 §7.4, pp.586–587, preceding Theorem 7.18).

n is invertible, Γ=J_X[n] is constant after the chosen finite étale base change, and μ_(n|Γ|)=μ_(n^(2g+1)) is constant. Equivariance is action-groupoid descent with pullback-twisted multiplication of the associated line torsors; an ordinary group extension with ignored base action is not a substitute. L′ need only have degree congruent to e modulo n; the quotient identifies the degree-class component.

The construction has the following API, with the hypotheses of this subsection. (GWZ20 §7.4, pp.586–587, preceding Theorem 7.18).

- A neutralization over T is exactly a universal stable fixed-determinant family over X×T with the specified determinant data.
- The band is μn, acting by scalar automorphisms, compatibly with the existing rigidification.
- For each Γ action arrow give a band-preserving gerbe isomorphism and coherent composition on the action groupoid.
- Pullback of α_PGL,L along the quotient atlas is α_SL,L with its coherent Γ descent datum.
- The gerbes, their powers and their descent data commute with the verified curve/moduli base changes.
- If ad≡e mod n and L′=L^a, the gerbe powers on the two degree-class components are α_SL,L^e and α_PGL,L′^d, with no interchange of d and e.

One proof route is as follows. Use §3.1 and the imported μn-rigidification theorem to obtain the gerbe and its universal-family interpretation. Build tensor action and the scalar coherence on the gerbe. Use étale-local curve sections and normalized Poincaré lines to define the descent isomorphisms; prove their cocycle and independence of auxiliary choices. This arithmetic-family verification is the arithmetic descent construction of §4.4–§4.5. Apply AlgebraicModuliForArithmeticGeometry §§4.1–4.5 and 4.20 for coherent quotient descent and transgression; its arithmetic compatibility is the generic orbifold/transgression extension. Take its indicated powers with the band fixed.

**Checks.**

- For n=1 the band and both gerbes are trivial.
- For n=2,g=2, |Γ|=16 and the admissibility root order n|Γ| is 32; μ2 alone does not meet this hypothesis.
- A nontrivial base action changes the line-torsor cocycle to L_γ⊗γ*L_δ→L_(γδ). Omitting γ* fails the action-groupoid coherence even if a pointwise central extension exists.
- For a nontrivial action on two base points, the two line-torsor fibres are permuted; composition must use the pulled-back second line, which distinguishes coherent descent from two independent central extensions.

*Needs:* §3.1 (stable trace-free fixed-determinant moduli); §3.3 (pgln moduli as a finite quotient); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.5, 4.9, 4.20; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### 4.5 Duality of the gerbe splitting torsors

On the common connected regular spectral locus, the two powered gerbes are arithmetic and there are canonical equivariant identifications Split′((M_SL^L)♦/A♦,α_SL,L^e)≃(M_PGL^e)♦ and Split′((M_PGL^e)♦/A♦,α_PGL,L′^d)≃(M_SL^L)♦, under the opposite PGL and SL Prym actions respectively. (GWZ20 §7.4, Theorem 7.18, p.587; HT03 Propositions 3.2 and 3.6, numbered pp.8–13).

The integer choices and root/admissibility data are those of §4.4. The dual Prym and norm conventions are exactly those of Layer 3. The complex HT03 propositions use unitary language (HT03 Proposition 3.2, numbered pp.10–11, HT03 line 385; Proposition 3.6, p.13, HT03 line 498). Their contracted-product proofs must be made algebraic and descended over the noetherian base; this is the arithmetic descent construction of §4.4–§4.5.

One proof route is as follows. On a smooth spectral fibre use a universal line normalized at a local section to identify the finite μn-neutralization torsor, then extend its action by the dual Prym. Use the normalized Poincaré bundle and theorem of the cube to compare the two torsors and their degree powers, following HT03 Propositions 3.2 and 3.6. Verify the opposite action and tensor-product coherence. Descend the local constructions, including changes of normalization section, and prove base-change compatibility over the arithmetic model; a topological isomorphism over C is not sufficient here. Verify arithmetic μn-neutrality separately by an étale-local spectral universal family with its actual determinant normalization. A local section of Split′ alone does not imply μn-neutrality. Construct the displayed torsor identifications only after this verification; the arithmetic descent construction of §4.4–§4.5 includes that proof obligation.

**Checks.**

- For n=1 both sides are points under trivial Pryms.
- For a point t of exact order 3 in a regular PGL Prym fibre, an equivariant identification f satisfies f(s+t)=f(s)+t. Composing f with inversion of the fibre about a chosen point sends s+t to f(s)−t, and −t≠t, so it is an isomorphism of underlying spaces that is not equivariant; for t of order 2 the two agree and the test is blind.

*Needs:* §4.4 (hausel–thaddeus gerbes); §3.8 (duality of sln and pgln pryms); §1.3 (the principal splitting torsor); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3.

### 4.6 Local Brauer splitting of the powered gerbes

Over O_F with the prescribed roots, if the two regular fibres above b∈A(O_F)∩A♦(F) have F-points, both powered gerbes have neutral induced Gₘ-gerbes on those fibres. Consequently both Hasse-character functions are 1 there. This is the local condition needed by the integral proof; no μn-neutrality of the powered gerbes is asserted. (GWZ20 §7.4, Lemma 7.19 and proof, p.587).

Use the smooth stable SL space, proper Hitchin map, and Br(O_F)=0 for a complete discrete valuation ring with finite residue field, from SchemeAndStackFoundations §2.22 `brauer_henselian_local` and Tau Ceti `TauCeti.subsingleton_brauerGroup_of_finite`. For the PGL side construct an integral point as the image of an integral SL point in the appropriate degree, rather than assume every coarse stack point lifts integrally.

One proof route is as follows. The opposite regular fibre point and §4.5 give a point of Split′. Apply §1.4 to make the underlying Gₘ-gerbe a constant class along each fibre. An SL F-point over an integral Hitchin parameter extends to O_F by properness. Evaluation of its gerbe gives a class in Br(O_F)=0; the constant Brauer class is therefore zero. Use §3.10 and the prime-to-n degree powers to obtain an SL point of the degree needed for the PGL fibre. The ath power of P^L has label L^a M^(1−a), of degree ad+(1−a)deg M≡e mod n: deg M=−n(n−1)deg D/2 is divisible by n for odd n, and for even n the unit a is odd, so (1−a)deg M is divisible by n; no parity of deg D is needed. Extend it integrally and take its image in the PGL quotient to evaluate the other constant class. Apply the imported factorization of transgression/Hasse evaluation through Gₘ-gerbes. Do not erase a possible Pic/r Kummer residue of the original μn-gerbe.

**Checks.**

- A constant nonzero Brauer phase would make fα a nontrivial constant; Br(O_F)=0 is the step excluding it.
- The proof does not claim that Br=0 implies H²(μn)=0 on the entire positive-dimensional fibre.

*Needs:* §4.5 (duality of the gerbe splitting torsors); §1.4 (principal splittings and constant brauer classes); §3.4 (properness of the stable hitchin morphism); §3.10 (spectral torsor products, powers and periods); TauCetiRoadmap.ClassFieldTheory Layer 5; TauCetiRoadmap.SchemeAndStackFoundations §2.22 (`brauer_henselian_local`); Tau Ceti `TauCeti.subsingleton_brauerGroup_of_finite`.

### 4.7 The SLn/PGLn dual pair

Combine the two stable Hitchin fibrations, their Prym groups, and α_SL,L^e and α_PGL,L′^d into a dual pair in the sufficient local-Brauer sense of Layer 2. The isogeny is P_SL→P_SL/Γ, its regular duality is the Prym Poincaré comparison, the principal splittings are the opposite fibres, and local Brauer neutrality holds when both have points. The low-genus range outside the regular certificate is treated in §3.9 and, for its gerbe sectors, in §4.8. (GWZ20 §7.4, Proposition 7.20, p.588).

Use the common A♦ and every codimension/admissibility condition in §3.9. n and the quotient kernel degree are units. Γ and μ_(n^(2g+1)) are constant on the chosen model.

One proof route is as follows. Apply §3.9 for the abstract-system data, without replacing it by a generic properness assertion. Use §3.7 for the globally étale isogeny and §3.8 for the self-duality square. Apply §4.5 and §4.6. The root hypothesis n|Γ| makes the gerbes admissible through the generic orbifold/transgression supplier contract. The pair satisfies the sufficient local Brauer condition, which is all the main invariant equality uses; no μn-neutrality claim is made.

**Checks.**

- For n=1 both moduli are points, Γ and the band are trivial, both splitting torsors are one point and both Brauer classes are 0, so the pair is the trivial dual pair.
- For D=ω=O in genus one with n=2 and d=1, every stable trace-free Higgs field vanishes and the fixed-determinant stable bundle is unique, so M_SL^L is a point fixed by all of Γ=J_X[2]; the quotient is BΓ with stabilizer of order 4 and empty free locus, so it fails the codimension-two admissibility condition and is handled by §3.9 and §4.8.
- A non-generically-free low-genus quotient is not accepted as an admissible abstract system by this assembly alone.

*Needs:* §3.9 (regular locus and abstract-system certificates); §3.8 (duality of sln and pgln pryms); §4.5 (duality of the gerbe splitting torsors); §4.6 (local brauer splitting of the powered gerbes); §2.2 (dual hitchin systems); the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### 4.8 Genus-one canonical gerbe sectors

Let X be a curve of genus one, D=ω=O, gcd(n,d)=1, L of degree d, and L′=L^a with ad≡e mod n as in §4.4; the base field contains μ_(n³)=μ_(n^(2g+1)). By §3.9, M_SL^L and M_SL^(L′) are single points with trivial Γ action, Γ=J_X[n], and M_PGL^e=BΓ. Prove that the descended powered gerbe α_PGL,L′^d on BΓ has commutator pairing Γ×Γ→μn equal to the normalized Weil pairing of §3.8 raised to an exponent c prime to n, hence nondegenerate; that its transgression to the inertia sector of γ∈Γ is the rank-one local system on BΓ given by the character ν↦(ν,γ)^c, with age zero; and that therefore the identity sector contributes one trivial line in H_c⁰ while every sector γ≠0 has zero Γ-invariant cohomology. Conclude E(M_SL^L)=1=E_st(M_PGL^e,α_PGL,L′^d) over ℂ and, over every finite field k of §5.1, #M_SL^L(k)=1=#^α_st(M_PGL^e), where for a k-rational sector γ the weighted count is |Γ(k)|⁻¹ times the sum of (ν,γ)^c over the classes ν∈H¹(k,Γ). (GWZ20 §7.4, Theorem 7.21, p.588; boundary calculation from §4.4 and §0.7.)

The point gerbe α_SL,L on M_SL^L=Spec k is a μn-gerbe over Spec k, neutral over ℂ and over every finite field, where H²(k,μn)=0. The descended class on BΓ is the class in H²(Γ,μn) of the μn-extension of Γ formed by the determinant-compatible isomorphisms E≃E⊗N, N∈Γ, and its commutator is the whole content; the quotient BΓ has no dense free locus, so this range is excluded from §2.2 and §4.7 and nothing here is inferred from the abstract-system integral. The exponent c depends on n, d and the chosen power; only its invertibility modulo n is used.

One proof route is as follows. Choose isomorphisms φ_N:E→E⊗N for N∈Γ, unique up to μn once compatible with the determinant trivializations, because E is stable; the composites φ_N φ_N′ and φ_(NN′) differ by elements of μn, so the φ_N generate the μn-extension of Γ that is the §4.4 equivariant structure on the neutral point gerbe, and the dth power multiplies its commutator exponent by d. Nondegeneracy: the sections φ_N∈H⁰(End(E)⊗N) define a map ⊕_(N∈Γ) N⁻¹→End(E) of semistable degree-zero bundles; its kernel is a direct sum of some of the distinct lines N⁻¹, since Ext¹ between distinct degree-zero lines vanishes on a genus-one curve, and each N⁻¹ maps injectively, so the map is injective, and equal rank n² and degree 0 make it an isomorphism End(E)≃⊕_(N∈Γ) N; if some N₀≠O lay in the radical of the commutator, φ_(N₀) would be locally central in the Azumaya algebra End(E), hence a global section of the centre summand O⊗N₀=N₀, which has none. Alternating pairings on J_X[n]≃(ℤ/n)² with values in μn are the powers of the Weil pairing, so the commutator is (·,·)^c with c a unit. Apply AlgebraicModuliForArithmeticGeometry §4.5, `quotientGerbeTransgression`, on BΓ: conjugating a lift of γ by a lift of ν multiplies it by the commutator, so the transgressed line on the sector of γ is the character ν↦(ν,γ)^c. Apply §0.7 with zero tangent space and §0.1: Γ-invariants of a nontrivial character vanish and of the trivial character give one line. Over k, the rational points of the γ-sector are the classes ν∈H¹(k,Γ), each with automorphism group Γ(k), and geometric Frobenius acts on the transgressed line at ν by (ν,γ)^c; since μn⊂k the character descends to H¹(k,Γ), |H¹(k,Γ)|=|Γ(k)|, and Fourier orthogonality, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, gives 1 for γ=0 and 0 otherwise; the only k-rational sectors are those of γ∈Γ(k).

**Checks.**

- For n=2, d=e=1, Γ=C₂² and the commutator is the Weil pairing e₂ itself, the only nondegenerate alternating pairing on C₂². Each of the three nonzero γ gives a nontrivial character and invariant dimension 0, so the twisted stringy E-polynomial is 1+0+0+0=1=E(point); the neutral gerbe would give 1+1+1+1=4, and the ordinary E-polynomial of BΓ is 1.
- Over 𝔽q with q≡1 mod 2 and Γ constant, n=2, each sector has four rational torsors of mass 1/4; for γ≠0 the four Frobenius traces are 1,1,−1,−1 and the sector count is 0, for γ=0 it is 1, so the twisted stringy count is 1=#M_SL^L(𝔽q), whereas the untwisted stringy count of BΓ is 4 and its ordinary mass is 1.
- For nonconstant Γ over 𝔽q, only γ∈Γ(𝔽q) label rational sectors; H¹(𝔽q,Γ)=Γ/(Fr−1)Γ has order |Γ(𝔽q)|, and for Γ(𝔽q) of order 2 inside C₂² the single nonzero rational γ still has a nontrivial descended character, so the total is 1+0=1 rather than 2.
- For n=1 the group Γ and the band are trivial, the single sector is the point, and both invariants are 1.
- A nonequivariant central extension with ignored base action, or the trivial pairing, would give every sector the trivial character and the wrong value |Γ|=n²; the commutator of the §4.4 action-groupoid descent is what removes the n²−1 nonidentity sectors.

*Needs:* §3.9 (genus-one stable space and Γ action); §4.4 (hausel–thaddeus gerbes); §3.8 (duality of sln and pgln pryms); §0.7 (gerbe-twisted stringy invariants); §0.6 (stringy e-polynomials and point counts); §0.1 (character e-polynomials and weighted counts); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §4.5 (`quotientGerbeTransgression`); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; TauCetiRoadmap.JacobianChallenge Layer B; Tau Ceti `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace).

### Examples

For n=2,g=2,D=ω, choose Q of degree −1. Then N=M⁻¹Q²=ωQ² has degree 2−2=0. For e=3 the determinant label is L³N², of degree 3d; at e=1 it is L. The root bound for the descended gerbe is n|Γ|=32. (GWZ20 Theorem 7.16, §7.4.)

### Dependencies

§3.9 (low-genus stable-locus calculations); §3.4 (properness of the stable hitchin morphism); §3.10 (spectral torsor products, powers and periods); §2.3 (compatible gauge forms); TauCetiRoadmap.LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9, 2.12; TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §7.3; TauCetiRoadmap.JacobianChallenge Layer D; TauCetiRoadmap.JacobianChallenge Layer A; TauCetiRoadmap.ClassFieldTheory Layer 5; §0.3 (equivariant katz comparison); TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §9.1; TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; §3.1 (stable trace-free fixed-determinant moduli); §3.3 (pgln moduli as a finite quotient); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§5.1; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A2.2–A2.3; TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §§4.1–4.3, 4.9, 4.20; §3.8 (duality of sln and pgln pryms); §1.3 (the principal splitting torsor); §1.4 (principal splittings and constant brauer classes); §3.9 (regular locus and abstract-system certificates); §2.2 (dual hitchin systems); TauCetiRoadmap.SchemeAndStackFoundations §2.22 (`brauer_henselian_local`); Tau Ceti `TauCeti.subsingleton_brauerGroup_of_finite`; §4.4 (hausel–thaddeus gerbes); §0.7 (gerbe-twisted stringy invariants); §0.6 (stringy e-polynomials and point counts); §0.1 (character e-polynomials and weighted counts); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §4.5 (`quotientGerbeTransgression`); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; TauCetiRoadmap.JacobianChallenge Layer B; Tau Ceti `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`.

## Layer 5: Mirror symmetry and refined cohomology

### 5.1 SLn/PGLn topological mirror symmetry

Let X/k be smooth projective geometrically connected of genus g, Dω⁻¹ have strictly positive degree or be trivial, n≥1, gcd(n,d)=gcd(n,e)=1, L∈Pic^d(X), and μ_(n^(2g+1))⊂k. Choose L′=L^a with ad≡e mod n. Over C the target is E(M_SL^L;x,y)=E_st(M_PGL^e,α_PGL,L′^d;x,y). Over k=𝔽q of characteristic p>n the target is #M_SL^L(k)=#^α_st(M_PGL^e). The same root/gerbe conventions are used on both sides. (GWZ20 §7.4, Theorem 7.21 and proof, p.588). GWZ20 proves (b) for constant Γ=J_X[n]; for nonsplit J_X[n] over k the finite-field equality is this roadmap’s extension through the generic orbifold/transgression contract (gap:generic-orbifold-transgression), with the trace identity of §2.7 descended as in §3.3.

The assertion includes every genus. Its proof requires the abstract-system certificate where the stable regular locus is nonempty, the separate low-genus calculations of §§3.9 and 4.8 elsewhere, and the generic integration, realization and arithmetic gerbe descent constructions of the supplying sections.

One proof route is as follows. Spread the complex data to finite-type R⊂C with n inverted and the required finite roots; use splitting étale charts for Γ while preserving the chosen complex point and all descent data. In the finite-field branch retain Frobenius and its permutation of the charts, rather than infer a k-count from the split extension. Apply §4.7, then §2.8 or §2.7. This uses the sufficient local Brauer version whose proof was supplied in Layer 2. On the smooth SL scheme only the identity inertia sector remains; its age is zero and transgression is trivial, so the twisted stringy invariant there is the ordinary one. For genus zero with deg D≤0, use §3.9 directly to prove the same invariant equality; for canonical genus one use §4.8, whose nondegenerate commutator leaves only the identity sector; the rank-one branch is 1=1, the genus-zero branches at n>1 are 0=0, and the canonical genus-one branch is 1=1 on both the complex and the finite-field side.

**Checks.**

- At n=1 both moduli and both invariants are 1, including over 𝔽₂ and 𝔽₃.
- For n=2,g=2 the field 𝔽_(3^8) has q−1=6560=32·205 and p=3>2. The finite-field theorem includes it. Characteristic 2 with n=2 fails n invertible and p>n.
- For n=2,g=2,D=ω, use Γ of order 16 and the root order 32; the result specializes to the rank-two case independently checked by Hausel–Thaddeus.
- The finite-field version requires the stated roots and p>n; no unsupported small-characteristic extension is asserted.

*Needs:* §3.9 (low-genus stable-locus calculations); §4.8 (genus-one canonical gerbe sectors); §4.7 (the sln/pgln dual pair); §2.8 (complex mirror symmetry for abstract systems); §2.7 (fibrewise arithmetic mirror symmetry); §0.7 (gerbe-twisted stringy invariants); the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs); the equivariant scissor contract (gap:equivariant-grothendieck); the fractional equivariant Hodge–Tate contract (gap:fractional-equivariant-hodge-tate).

### 5.2 Canonical-twist Hodge numbers

For D=ω over C under the main theorem’s hypotheses, the compact stringy Hodge numbers of (M_PGL^e,α_PGL,L′^d) equal the compact Hodge numbers of M_SL^L. On an inertia component Z of age a, the stringy summand H_c^k(Z,Nα) has stringy degree k+2a and Hodge bidegree (p+a,q+a). Purity must identify its weight with k before this shift, so the shifted weight equals the stringy degree. (GWZ20 §7.4, Corollary 7.22 and proof, p.589).

The finite-monodromy local-system MHS is constructed through the torsor total-space character projector in the geometric compact-support mixed-Hodge supplier contract. Use the Higgs-sector purity supplier contract for canonical fixed-determinant spaces and their finite-order fixed loci; the generic CountingBundlesAndHallAlgebrasOfCurves §9.1 GL assertion alone does not state this sector version. The result uses age-shifted rational indices; it does not assert equality of unshifted individual sector cohomologies. For D=ω the Γ-action preserves the holomorphic symplectic form. Its nontrivial tangent eigenvalues pair as ζ^b and ζ^(n−b), so every sector has integral age a=codim(Z)/2. The shift 2a is even and preserves the alternating sign.

One proof route is as follows. Apply §5.1 for equality of E-polynomials. Use the requested semiprojective purity statement on SL and on the finite-order fixed-locus torsor covers, with the character projector and finite quotient invariants. Track compact-support degrees. Use symplectic eigenvalue pairing to prove a is integral. Purity gives weight k before the shift and weight k+2a afterwards. Since 2a is even, the sign (−1)^k agrees with (−1)^(k+2a); p+q=k+2a therefore separates the signs. Extract each Hodge number coefficientwise.

**Checks.**

- For n=1 the only nonzero compact Hodge number is h_c^(0,0)=1.
- A mixed sector without purity cannot be read degree by degree from its alternating E-polynomial.
- A nonsymplectic sector of age 1/2 cannot use this parity argument; the canonical-twist hypothesis is essential to this proof.

*Needs:* §5.1 (sln/pgln topological mirror symmetry); §4.3 (betti and hodge numbers in coprime degree); TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §9.1; the fixed-determinant and twisted-sector purity contract (gap:higgs-sector-purity); TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory H.0/mixed-hodge-module, H.1/operations, P/pair-cohomology and the geometric compact-support mixed-Hodge contract (gap:geometric-compact-mhs).

### 5.3 The justified fibrewise virtual comparison

For every a∈A(𝔽q) in the main finite-field setting and every m≥1, the alternating trace of Fr^m on the SL Hitchin fibre equals that on the twisted PGL inertia fibre with the negative age Tate twists. Consequently their alternating classes agree in the Grothendieck group of finite-dimensional continuous ℚ̄ℓ-representations of Gal(𝔽q), after a common finite coefficient extension for the finite set of fractional twists. This is a virtual equality; individual degrees and nonsplit extensions are not identified. (GWZ20 §6.2, Theorem 6.12, p.569; §7.4, proof of Theorem 7.23, p.589).

Use all extension-field identities of §2.7, with the compatible mth Frobenius powers of the same finite-denominator Tate roots. The cohomological complexes have finite-dimensional bounded cohomology from proper coarse fibres and the imported finite-quotient stack trace formalism.

One proof route is as follows. Apply §2.7 to the SL/PGL pair above a over every finite extension. Collect even and odd cohomology as virtual continuous representations with the fixed negative age twist. Traces of all Frobenius powers agree. Use the characteristic-zero Brauer–Nesbitt recognition on semisimplifications of these virtual classes. No semisimplicity of the original arithmetic action is inferred. In the empty genus-zero cases deg D≤0 at n>1, apply §3.9 directly: both fibre complexes are zero, so every Frobenius-power trace is 0. In canonical genus one apply §4.8: the only nonempty fibre is over a=0, the SL fibre is the point with H_c⁰=ℚ̄ℓ, and in the PGL inertia fibre only the identity sector has nonzero Γ-invariants, again ℚ̄ℓ with trivial Frobenius, so every trace is 1=1.

**Checks.**

- I2 and the unipotent Jordan block J2 have identical traces of every power but different fixed-space dimensions; the conclusion must not identify them as actual representations.
- An even and an odd copy of the same representation cancel virtually, so virtual equality alone does not separate degrees.

*Needs:* §3.9 (empty low-genus fibres); §4.8 (genus-one canonical gerbe sectors); §4.7 (the sln/pgln dual pair); §2.7 (fibrewise arithmetic mirror symmetry); TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8; TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### 5.4 Actual fibrewise Galois isomorphism

Under every hypothesis of the finite-field theorem §5.1, fix ℓ≠p, its faithful band character, and compatible fractional Tate roots over a common finite coefficient extension as in §§0.4–0.7. For every a∈A(𝔽q), put S_a=(h_SL)⁻¹(a) over the algebraic closure and Y_a=(h_SL,L′)⁻¹(a) for the chosen mirror determinant L′=L^a₀ with a₀d≡e mod n. The stronger target is an isomorphism of finite-dimensional continuous ungraded ℚ̄ℓ-representations of Gal(𝔽q):

    ⊕_i H_c^i(S_a, Qbar_l) ≅ ⊕_[γ],O ( ⊕_i H_c^i(Z_O, N_(α_PGL,L′^d,γ))(−F_(γ,O)) )^C_Γ(γ).

Here the sum is over conjugacy classes in Γ over the algebraic closure and centralizer orbits O of connected components of Y_a^γ. The scheme Z_O is the union of the components in O, the local system is the faithful-character realization of the transgression of α_PGL,L′^d, and F_(γ,O) is the age in the tangent space of the smooth total moduli, not of a possibly singular fibre. Equivalently, use a single component with its centralizer stabilizer. The right side is the direct sum of all these geometric summands with their actual descent datum: geometric Frobenius permutes γ and O and transports the gerbe local systems and age twists when Γ is nonsplit. Individual summands are asserted Galois-stable only when that descent fixes their labels. The comparison is required for each rational base point over each finite extension, compatibly with restriction of the same action and Tate-root choices. This specifies the actual representation target associated with GWZ20 §7.4, Theorem 7.23, p.589; it makes no degreewise or derived comparison assertion.

There are no cohomological shifts in this ungraded target. The age twist changes the Frobenius eigenvalues by q^F; the explicit direct sums forget ordinary degrees and retain every summand with positive multiplicity. In the canonical complex Hodge comparison of §5.2, the separate stringy grading places H_c^i(Z,N)(−F) in degree i+2F, with integral F from symplecticity. That grading is not part of the present target.

One proof route is a geometric comparison giving the displayed actual actions. A route from §5.3 instead must first recover the nonalternating multiplicities by a justified separation of the actual fibre contributions, and must then prove arithmetic semisimplicity of both resulting representations before using character recognition. These are local proof obligations for this theorem, not consequences of global purity or of the alternating trace identity. Purity of a proper direct-image complex alone does not give pure ordinary-degree stalks at singular fibres, and weight purity does not eliminate Frobenius Jordan blocks.

**Checks.**

- Qℓ[0] and Qℓ[−2] both have alternating trace 1 and become the same one-dimensional trivial representation after the explicit direct sum. Their H⁰ dimensions are respectively 1 and 0; this target deliberately does not identify their derived complexes.
- Qℓ[0]⊕Qℓ[−1] has alternating trace 1−1=0 but underlying dimension 2, whereas the zero complex has trace 0 and dimension 0. This excludes deriving the target from alternating traces alone, even for semisimple actions.
- I₂ and J₂ have trace 2 for every Frobenius power but fixed-space dimensions 2 and 1. The continuous action of Gal(𝔽q) on J₂ factors through its Zℓ quotient; purity of its two eigenvalues 1 does not identify it with I₂.
- In the age-one canonical control, a class of degree 2 and bidegree (1,1) acquires bidegree (2,2) and stringy degree 4 in §5.2; a Tate twist alone retains ordinary degree 2. Here both degrees are forgotten and its one-dimensional summand remains, with Frobenius multiplied by q.
- For n=1 the single sector is a point, F=0 and N is trivial, so both direct sums are Qℓ in dimension 1. In the empty genus-zero branches of §3.9 both sides are the zero representation of dimension 0. In canonical genus one, by §4.8, the fibre over a=0 gives Qℓ on the left and, on the right, Qℓ from the identity sector with zero contributions from the n²−1 sectors whose character is nontrivial; the dimensions are 1=1, not 1=n².
- For two sectors exchanged by Frobenius with trivial one-dimensional coefficients and age 0, the total action matrix is ((0,1),(1,0)): trace 0 on odd powers and 2 on even powers. Replacing descent by two separately fixed lines would give trace 2 on every power.

*Needs:* §5.3 (the justified fibrewise virtual comparison); §5.1 (finite-field hypotheses); §3.9 (low-genus fibres); §4.8 (genus-one canonical gerbe sectors); §§0.4, 0.6–0.7 (fractional roots, sectors and gerbe coefficients); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §4.5 (centralizer descent); TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6; TauCetiRoadmap.DeligneWeightsAndPurity §7.15; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8; the generic orbifold/transgression contract (gap:generic-orbifold-transgression); the finite-quotient trace contract (gap:finite-quotient-stack-trace); Mathlib `Matrix.trace`.

### 5.5 Determinant variation of inertia-sector traces

Let ν label the determinant twist of the SL fibration by δ(L Lν⁻¹)∈Γ, so its geometric Frobenius is ν⁻¹Fr. Let Tγ(ν) be the twisted trace of the γ-inertia sector of the corresponding mirror PGL data, including the prescribed degree power of its gerbe and the age twist. With the Weil pairing convention χγ(ν)=(ν,γ), prove Tγ(ν)=(ν,γ)⁻¹Tγ(0). (GWZ20 §7.5, Lemma 7.25, equations (32)–(35), pp.591–593).

k contains μ_(n^(2g+1)), Γ is constant and the genus and regular-locus hypotheses of the preceding applications apply. The local Tate calculation uses only the ordered mixed block between an unramified ν and the tame sector class. It does not use isotropy of the complementary block at even torsion. Tγ(ν) includes the transported gerbe and power-of-determinant choices; it is not an unlabelled comparison of fixed loci with unrelated gerbes.

One proof route is as follows. Lift the finite list of determinant line bundles and compare the SL torsor classes by the unramified Γ class ν. Use the self-dual isogeny exact sequence and its pairing adjunction to identify the ratio of local gerbe characters with the inverse local Tate pairing of ν and the connecting class of a PGL point. Apply the imported specialization with the inverse tame-character generator convention to identify the ramified coordinate of that connecting class with γ. The mixed evaluation is then the normalized Jacobian Weil pairing (ν,γ). Integrate on the fixed γ sector and use §2.4 with its conjugation conventions consistently. This gives the displayed ratio; no vanishing of the ramified/ramified diagonal is needed.

**Checks.**

- For n=3 and (ν,γ)=ζ3, the multiplier is ζ3⁻¹; the direct multiplier fails the fixed ν⁻¹Fr convention.
- For F=Q3 and the complementary C₂ Kummer class of −3, the diagonal self-pairing can have invariant 1/2. The mixed formula must remain valid without asserting that this diagonal vanishes.

*Needs:* §3.5 (determinant change and γ-twists); §4.5 (duality of the gerbe splitting torsors); §2.4 (twisted counts as local integrals); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and self-dual isogenies); TauCetiRoadmap.ClassFieldTheory Layer 5; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### 5.6 Character-isotypic mirror symmetry

In the finite-field setting of the main theorem, with Γ constant, choose the primitive nth root and the Jacobian Weil pairing identifying γ∈Γ with χγ(ν)=(ν,γ). Then Tr(Fr,H_c^*(M_SL^L,ℚ̄ℓ)^χγ)=Tr(Fr,H_c^*([(M_SL^L′)^γ/Γ],N_L′⊗ℚ̄ℓ(−Fγ))). Traces are alternating, and the right side is the γ-sector of the PGL inertia with its degree-d powered Hausel–Thaddeus gerbe. (GWZ20 §7.5, Theorem 7.24 and proof, pp.590–593, especially equations (30)–(32)).

The star denotes the alternating compact-support realization, not a direct sum with forgotten signs. Use ℓ≠p splitting coefficients, the same faithful μn character and the ν⁻¹Fr convention. The theorem gives a character trace identity, not the actual-isomorphism claim left in §5.4.

One proof route is as follows. Use §3.5 to enumerate all Γ twists of the SL space over k. The trace of a twist is Tr(ν⁻¹Fr,H_c^*(M_SL^L)). Multiply by χγ(ν), sum over ν and divide by |Γ|. The existing pinned character orthogonality isolates the χγ eigenspace; no new generic Fourier theory is needed. Apply §5.1 to each determinant twist and §5.5 to its mirror trace. The same character orthogonality isolates precisely the γ sector. Cancel the common factor |Γ|. Keep every age twist, character inverse and stack automorphism weight from the supplying nodes. In the genus-zero empty branches of §3.9, both isotypic and sector cohomologies are zero and the identity is 0=0 directly. In canonical genus one, §4.8 gives the identity without §5.5: Γ acts trivially on the point M_SL^L, so the χγ-isotypic trace is 1 for γ=0 and 0 otherwise, and the γ-sector of BΓ with its transgressed character has weighted trace 1 for γ=0 and 0 otherwise.

**Checks.**

- For Γ=1 recover the ordinary total trace equality.
- For C₃ the ν⁻¹ action and multiplier χγ(ν), with division by 3, isolate χγ and not its inverse.
- For n=2,g=2 the Fourier normalization is 1/16, using all 16 characters.

*Needs:* §3.9 (empty low-genus fibres); §4.8 (genus-one canonical gerbe sectors); §5.1 (sln/pgln topological mirror symmetry); §5.5 (determinant variation of inertia-sector traces); §3.5 (determinant change and γ-twists); Tau Ceti `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`; Mathlib `sum_hom_units_eq_zero`; TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; the generic orbifold/transgression contract (gap:generic-orbifold-transgression) and finite-quotient trace contract (gap:finite-quotient-stack-trace); the equal-characteristic local-duality contract (gap:equal-characteristic-abelian-duality).

### Examples

For C₃, the normalized Fourier sum is (1+1+1)/3=1 on its selected character and (1+ζ+ζ²)/3=0 on either other character. For a genus-two rank-two system the normalization is 1/16. Matrices I₂ and J₂ have trace 2 for every power but fixed dimensions 2 and 1; this excludes the false inference from traces to actual actions. (GWZ20 Theorems 7.23–7.24, Lemma 7.25; the matrix calculation is direct.)

### Dependencies

§3.9 (low-genus stable-locus calculations); §4.8 (genus-one canonical gerbe sectors); TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry §4.5 (centralizer descent); §4.7 (the sln/pgln dual pair); §2.8 (complex mirror symmetry for abstract systems); §2.7 (fibrewise arithmetic mirror symmetry); §0.7 (gerbe-twisted stringy invariants); §4.3 (betti and hodge numbers in coprime degree); TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves §9.1; TauCetiRoadmap.ArithmeticGaloisRepresentations §§1.7–1.8; TauCetiRoadmap.EtaleCohomologyFoundations §§F.2.1, F.2.4–F.2.7, F.4.2–F.4.6 and TauCetiRoadmap.EtaleDualityAndPerverseSheaves §§3.7, 6.3–6.4; TauCetiRoadmap.DeligneWeightsAndPurity §§7.15; Mathlib `Matrix.trace`; §3.5 (determinant change and γ-twists); §4.5 (duality of the gerbe splitting torsors); §2.4 (twisted counts as local integrals); TauCetiRoadmap.AbelianSchemesAndArithmeticModuli §§A3.7; TauCetiRoadmap.ArithmeticGaloisDuality §D7.6 (local abelian-variety duality and self-dual isogenies); TauCetiRoadmap.ClassFieldTheory Layer 5; Tau Ceti `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`; Mathlib `sum_hom_units_eq_zero`.

## Downstream consumers

Endoscopic and geometric Langlands applications consume the abstract dual-system integral, the spectral Prym pairing and the character-isotypic trace identity. Moduli-cohomology applications consume coprime-degree independence and the canonical-twist stringy Hodge comparison. Arithmetic fibre comparisons consume the virtual class theorem; an application needing actual fibre actions must use the explicit ungraded direct-sum comparison of §5.4 and its separate geometric or multiplicity-separation/semisimplicity proof. The theory supplies these interfaces for general curves and coefficient choices satisfying their stated hypotheses.

## Worked examples

The six layer examples give the stack-versus-coarse normalization, fractional-root dependence, neutral and nonneutral splitting torsors, product-system volumes, the rank-two determinant sign, and Fourier orientation. Two additional computations fix the distinction between rank one and the low-genus boundary.

For n=1, trace zero forces θ=0 and the chosen determinant fixes E=L. The SL and PGL moduli, Hitchin base and Pryms are points, the band μ₁ is trivial and both final invariants are 1. No positive-dimensional generic-fibre argument enters. (GWZ20 Definition 7.1, Theorem 7.21.)

For a canonical elliptic curve and n>1, distinct constant Higgs eigenvalues give projectors onto invariant eigenbundles. Their ranks sum to n and their degrees sum to d, so at least one slope is ≥d/n. The stable generic spectral fibre is empty despite the spectral cover being smooth. The actual stable locus and its Γ stabilizers are computed in §3.9, and the powered-gerbe transgression on the resulting quotient BΓ in §4.8: its commutator pairing is nondegenerate, so only the identity sector contributes and both invariants are 1. For genus zero with deg D≤0 and coprime rank n>1, the full highest-degree block is Higgs-invariant and has slope strictly greater than d/n, so both moduli are empty and both invariants are 0. For D=O,n=2,d=1 the forbidden lower entry has dimension 0 and 1>1/2 witnesses instability. At n=1 the SL/PGL invariants are 1, while GL₁ with D=O has E=xy and count 3 over F₃. (GWZ20 Propositions 7.11–7.12 and Theorem 7.21, with these boundary calculations.)

For the order-three sign convention, set χγ(ν)=ζ^(νγ). The ν⁻¹Fr trace contributes ζ^(−νδ) on the χδ piece, and averaging with χγ gives δγδ. Reversing just one exponent selects −γ. At order two this mistake is invisible. For the nonsemisimple witness J₂^m has rows (1,m),(0,1), hence trace 2; its fixed vectors are (a,0), whereas every vector is fixed by I₂. Both have the same eigenvalues and virtual class. (GWZ20 Theorem 7.24, equations (30)–(32); the matrix calculation is direct.)

## References

All statements are expressed in the roadmap’s own words. GWZ20 locators refer to the published version; the other locators refer to the exact open preprint versions below, with numbered preprint pages.

- **GWZ20.** Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*, Inventiones mathematicae 221 (2020), 505–596, [DOI 10.1007/s00222-020-00957-8](https://doi.org/10.1007/s00222-020-00957-8). Definitions 2.2–2.16, Theorems 2.15, 2.18–2.19; Corollary 5.29; §§6–7.
- **HT03.** Tamás Hausel and Michael Thaddeus, *Mirror symmetry, Langlands duality, and the Hitchin system*, [arXiv math/0205236v1](https://arxiv.org/abs/math/0205236v1). Proposition 3.2, numbered pp.10–11 (HT03 line 385); Proposition 3.6, numbered p.13 (HT03 line 498). Published in Inventiones mathematicae 153 (2003), 197–229; numbering here follows the preprint.
- **ITO04.** Tetsushi Ito, *Stringy Hodge numbers and p-adic Hodge theory*, [arXiv math/0211378v3](https://arxiv.org/abs/math/0211378v3). Lemma 4.3, numbered p.12 (ITO04 line 524); Proposition 5.1, p.13 (ITO04 line 555); Definitions 5.2–5.3 and fractional variant §5.3, pp.13–15 (ITO04 line 573, ITO04 line 611, ITO04 line 624); Example 5.5, p.15 (ITO04 line 666). Published in Compositio Mathematica 140 (2004), 1499–1517.
- **BITTNER04.** Franziska Bittner, *The universal Euler characteristic for varieties of characteristic zero*, [arXiv math/0111062v1](https://arxiv.org/abs/math/0111062v1). §7, Lemma 7.1, numbered p.18 (BITTNER04 line 812); representation-quotient distinction (BITTNER04 line 805); equivariant resolution and weak factorization in the proof (BITTNER04 line 830). Published in Compositio Mathematica 140 (2004), 1011–1032.
