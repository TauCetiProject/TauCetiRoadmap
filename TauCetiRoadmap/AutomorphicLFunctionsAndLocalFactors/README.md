# Roadmap: automorphic L-functions and local factors

**Summary.** This roadmap develops distribution and normalization interfaces for character L-functions and constructs the analytic factors of automorphic representations of `GLₙ`. It consumes ArithmeticGaloisRepresentations §2.7's scalar adelic Fourier foundations, [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison), [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation) and [Root-number product formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula). It proves vector-space and distribution refinements and develops the Godement–Jacquet and Rankin–Selberg integrals. The rank-one global integral theory is the `n = 1` case of its `GLₙ` theory; the finite-order and algebraic Hecke functional equations are supplied by LFunctions through §2.7. General unitary-character continuation and functional equations are the rank-one case of [The global standard L-function](#global-godement-jacquet). Its final interfaces compare Satake and Weil–Deligne determinants, rational period structures and finite Euler corrections. The function-field part also proves the polynomial and reciprocal-factor statements used to normalize intertwining scalars, and checks the weight conventions on projective spaces, the multiplicative group, curves, semistable filtrations and unramified cuspidal tensor factors.

The library must expose the spaces, measures, distributions and comparison maps that make those theorems usable. An integral formula is accompanied by its convergence domain and continuation theorem. A local denominator is characterized by the ideal of test integrals, rather than by a choice of one test vector. A period is a class modulo the units of its rationality field, rather than a canonically chosen complex number.

## Scope and ownership

The finite-place representation categories, normalized parabolic induction, genericity and Satake isomorphisms come from **SmoothRepresentationsOfLocalGroups**, layers SR.1–SR.5. **ArithmeticLocallySymmetricSpaces**, ALS.F.6–F.7, supplies number-field automorphic forms, cusp forms, rapid decay, cuspidal discreteness and cohomological carriers; ALS.5b supplies their geometric rational cohomology realizations. **AutomorphicFormsOnReductiveGroups**, §§2.3–2.7 and 3.4–3.5, supplies normalized archimedean induction, Langlands classification, archimedean parameters, the generic unitary dual, globalization and algebraic restricted tensor factorization; §§4.3 and 5.7 supply number-field cuspidal `GLₙ` genericity and Clozel rationality; §4.5 supplies the shared `NormalizedMaassEigenform(r,δ)` carrier and its Fourier, Hecke, reflection-parity and adelization comparisons. The representation prerequisites below specialize these constructions to the `GLₙ` Whittaker and local-factor interfaces, compare their smooth and Hilbert tensor realizations, and construct function-field cuspidal carriers, number-field isobaric sums and rational Whittaker/cohomological comparisons. Generic finite-place newforms use ClassFieldTheory layer 7 for rank one and [GL₂ newvectors](#gl2-newvectors) for rank two; the compatible higher-rank newform construction is a target here. AL.2 consumes the real-parameter specialization of the shared Maass carrier for its standard and adjoint L-functions. The Whittaker integrals, their analytic continuation and the scalar period comparison are built here. Ordinary multiplicity one is proved from the supplied cusp-form Fourier reconstruction and local Whittaker uniqueness; it does not require the general automorphic trace formula.

**AdelicAlgebraicGroups**, layers AA.0–AA.2, owns adelic group topology, restricted Haar products and quotient measures. ArithmeticGaloisRepresentations §2.7, **Global inputs**, owns the standard trace character, local additive self-duality, restricted-product adelic duality and diagonal self-annihilator, together with the common number-field adelic Schwartz–Bruhat space, restricted/completed tensor API, self-dual Fourier transform and Poisson summation. Its [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations) supplies `finiteStandardEvaluation`, `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`; [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison) identifies their standard global integral with the conductor-normalized Hecke completion on algebraic norm twists; [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation) supplies LFunctions layer 5's equation for finite-order characters; [Root-number product formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula) is a finite-sum identity identifying the Gauss-sum root number with the local constants. General unitary-character continuation and functional equations come from [The global standard L-function](#global-godement-jacquet) at `n=1`. This roadmap owns the local functional equation for arbitrary Schwartz functions, eigendistribution uniqueness and the global matrix-integral continuation for every `n≥1`, with its rank-one scalar corollary [Hecke continuation and functional equation](#hecke-l-functional-equation), with the conductor and root-number normalizations below. **ReductiveGroupsPartII**, RG2.5.2, supplies the L-group; [The unramified L-group Euler factor](#l-group-local-factor) forms its Frobenius coset `Ĝ ⋊ Frob_v` for an unramified group. **IntegralHeckeAndGaloisDeterminants**, §3a.1, supplies the normalized `GLₙ` Satake coefficients. **ArithmeticGaloisRepresentations**, §§2.4–2.7, supplies Weil–Deligne representations and their geometric-Frobenius Euler and epsilon factors. AL.1 identifies its distribution scalar with `tateLocalConstant` unconditionally. Higher-rank ramified analytic/parameter factor equalities are supplied inputs to normalization transport; the existence of a general finite-place local Langlands correspondence is a separate theorem.

**LFunctions**, layers 0, 5–6, owns the primitive finite-order and algebraic Hecke functions, conductor-balanced completions, continuation and inverse-character functional equations. **ArithmeticGaloisRepresentations**, §2.7, supplies **Standard-test-function evaluations**, **Hecke zeta-integral comparison**, **Finite-order Hecke functional equation** and **Root-number product formula**, with the root-number formula a finite-sum identity for arbitrary unitary characters and complex norm twists. AL.0 consumes that supplier's Schwartz/Fourier/Poisson prefix and proves its finite-dimensional vector-space and partial-transform extensions and compact-uniform estimates. AL.2 proves the global Godement–Jacquet continuation by matrix Poisson summation for every `n≥1`; AL.1 states its rank-one scalar corollary and the normalization adapters to Hecke's functions, with the exact comparison in [Canonical rank-one comparison](#canonical-rank-one-comparison). AL.4 consumes the earlier arithmetic Weil–Deligne theory; no arithmetic local-constant construction depends on AL.4.

**Downstream consumers.** AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, DirichletPadicLFunctions and EndoscopicTransferAndUnitaryTraceComparison consume the global rank-one theory through [Hecke continuation and functional equation](#hecke-l-functional-equation) and [The global standard L-function](#global-godement-jacquet). AutomorphicSpectralTheory and GL2AutomorphicRepresentationsAndTransfer also use AL.1's [Rank-one local zeta integral and functional equation](#rank-one-local-functional-equation). AutomorphicSpectralTheory §§2.3a, 3.6a–3.6d, 4.14a, 4.15a–4.15e and 7.1–7.2 use the scalar factors here for normalized-intertwiner bounds, growth and superpositivity, residual factors and transfer applications. Its §1.15c Eisenstein construction identifies its conductor-balanced Hecke function with the meromorphic continuation in AL.1 by agreement on `Re(s)>1`; its §3.6a intertwining construction proves bounds for the same completed Rankin–Selberg function used by AL.3. The canonical scalar endpoints belong here; the Eisenstein and intertwining constructions and their comparison with these endpoints belong to AutomorphicSpectralTheory.

For function fields **ArithmeticGaloisDuality**, §R02.3.2, owns the ideles, idele classes, degree and arithmetic reciprocity; **ArithmeticGaloisRepresentations**, Layer 3, owns the Artin/Swan conductor invariant, including equal characteristic. AL.3 identifies its multiplicative and geometric interfaces with these supplied objects and constructs residue-character, self-dual-measure and Poisson comparisons on the completion-valued adeles constructed in [Curve additive analysis](#curve-additive-analysis), using **AlgebraicCurves**, layers 0, 4, 5, 9 and 12, then the unramified pure realization, cohomological determinant comparison and [weight-facing acceptance suite](#weight-facing-acceptance-suite). The suite uses **EtaleCohomologyFoundations**, §§F.5–F.7, for duality, cycle classes and projective-space cohomology, and **DeligneWeightsAndPurity**, §§0.17, 1.7, 1.10, 6.4, 7.15 and 10.1–10.3, for weight transport, purity, semistable weights and component-aware point counts. The scheme geometry is imported from **SchemeAndStackFoundations**, layers 0–3; scheme étale operations and trace from **EtaleCohomologyFoundations**, §§F.0–F.6, F.10.1–F.10.5 and 0.11 (smooth trace and curve duality), with §§0.9–0.10 for cycle classes and smooth-boundary purity; weights and purity from **DeligneWeightsAndPurity**, DWP.0–DWP.1 and DWP.5–DWP.7. **SchemeAndStackFoundations**, §0.29, supplies scheme Frobenius and its twists. The curve subsection constructs Harder–Narasimhan truncation theory and the ramified lower-rank correspondence and function-field converse inputs for rank induction. Rational cohomology for the particular finite-stabilizer shtuka compactifications, their boundary comparison and essential Hecke summand are part of the realization construction here. **EtaleCohomologyFoundations**, §F.8, supplies middle extension; **DeligneWeightsAndPurity**, §§8.11–8.12, supplies directional weight bounds and proper purity for pure complexes. AL.3 proves [Normalized scheme intersection-complex purity](#normalized-scheme-ic-purity) from these earlier inputs. [Shtuka intersection cohomology and essential comparison](#shtuka-intersection-comparison) uses that scheme theorem for its local-model normalization, descent and comparison with compactly supported cohomology. Scheme-level duality alone does not supply those stack statements.

The last layer states the complex `GL₂` period and stabilization dictionary used by interpolation formulas. Constructing p-adic measures, overconvergent modular symbols and exceptional-zero formulas is separate work. Algebraicity is used only with an actual critical-value theorem and its coefficient field, sign, character and nonzero period. The rational Whittaker/cohomological period theorem of AL.3 has its own broader hypotheses; a `GL₂` formula over `ℚ` does not establish algebraicity for arbitrary rank or arbitrary number fields.

## Conventions

Throughout the number-field part, K is a number field and F is a completion `ℝ, ℂ` or a finite extension of `ℚₚ`. The function-field part explicitly changes to `K=𝔽_q(X)`, for X smooth, projective and geometrically connected. Write `O, P, ϖ` and q for a nonarchimedean local field's valuation ring, maximal ideal, uniformizer and residue cardinality. Use `|ϖ|=q⁻¹` and `|z|_ℂ=z z̄`. All analytic functions are complex-valued; comparison with `ℓ`-adic factors specifies an embedding of the algebraic coefficient field.

There are two Fourier conventions, connected by an explicit comparison. Mathlib's `VectorFourier.fourierIntegral` uses `ψ(−B(x,y))`. The Tate transform `F⁺` uses `ψ(B(x,y))`; therefore `F⁺f(y)=F⁻f(−y)`. With the self-dual measure, applying either same-sign transform twice reflects f. The negative-sign formula for `f(x−a)` has phase `ψ(−B(a,y))`; multiplying f by `ψ(B(x,y₀))` shifts its negative-sign transform by `y−y₀`.

The standard global additive character has real component `exp(2πix)`, p-adic component `exp(−2πi fracₚ(x))`, and is pulled back by local trace. It is trivial on the diagonal K. At a finite place of different exponent d, its conductor is `P⁻ᵈ` and its self-dual additive Haar measure gives O volume `q⁻ᵈᐟ²`. At infinity use dx over `ℝ` and 2 dx dy over `ℂ` with the trace character `exp(2πi(z+z̄))`. If `ψ` is replaced by `ψ_a`, its self-dual measure is multiplied by `|a|¹ᐟ²`. Multiplicative Haar measure giving `O×` volume 1 is a different convention. Tate's measure uses the factor `q⁻ᵈᐟ²` on `O×`; every change of multiplicative measure scales the zeta integral and normalized distribution together.

`GLₙ` standard factors and Rankin–Selberg factors use the unitary center 1/2. The Godement–Jacquet determinant exponent is `s+(n−1)/2`. For `GLₙ×GLₘ, n>m`, the exponent is `s−(n−m)/2` and the auxiliary index satisfies `0≤j≤n−m−1`; equal ranks require an additional Schwartz function and exponent s. The two Whittaker characters in a Rankin–Selberg integral are opposite. Matrix Fourier transform uses the trace pairing and positive Tate character. Source conventions using inverse characters or transposes are transported before their functional equations are compared.

Use the native Deligne factors `Γ_ℝ(s)=π⁻ˢᐟ²Γ(s/2)` and `Γ_ℂ(s)=2(2π)⁻ˢΓ(s)`. Kudla's complex Gaussian integral is `πΓ_ℂ` in its stated multiplicative measure, so its normalized distribution is rescaled when the canonical factor is used. Completed functions include every archimedean and finite local factor. A superscript S removes the specified places; a finite product of inverse local denominators relates the two functions meromorphically.

At a finite unramified place, local polynomials have constant term 1 and use geometric Frobenius in the Galois comparison. A pure motive of weight w has arithmetic variable `s_mot=s_unit+w/2`. In particular, the tensor of `Symⁿ⁻¹H¹` of one elliptic curve with `SymⁿH¹` of another has weight `2n−1`; its center n corresponds to unitary center 1/2. Purity and matching dimensions alone do not identify its Frobenius polynomial with an automorphic one.

For function fields put `z=q⁻ˢ` and use `z^(deg v)` in the v-factor. Rational identities retain numerator and denominator, including their multiplicities. Roots on `|z|=1` are excluded from the open-disc zero–pole index. Numerical division by zero, or a totalized integral outside its convergence domain, is never a replacement for continuation or a limit.

## Exact supplier contracts

The following constructions are reused. The work below proves the additional local-field or representation-theoretic statements with their stated hypotheses.

| Interface | Existing construction and its precise use |
| --- | --- |
| Reductive representations and cuspidal `GLₙ` inputs | **AutomorphicFormsOnReductiveGroups**, §§2.3–2.7: normalized induction, Casselman embedding, Langlands classification, archimedean parameters, generic unitary dual and Casselman–Wallach globalization; §§3.4–3.5: restricted tensors and Flath factorization; §4.3: number-field cuspidal Fourier reconstruction and global/local genericity; §5.7: Clozel rationality and exact-field finite-part descent in the cohomological normalization. This roadmap specializes these inputs to its Whittaker, analytic tensor and rational-period comparisons. |
| GL₂ eigensystems and Hecke coordinates | **AutomorphicFormsOnReductiveGroups**, §5.8 supplies Hecke characters and nonzero eigenclasses, specialized to complex coefficients; §7.3 supplies the raw, cohomological and unitary Hecke normalization. AL.3's [eigensystem datum](#automorphic-l-data) uses this character, its specified archimedean parameters and missing local factors, and the explicit normalization exponent. |
| Normalized Maass eigenforms | **AutomorphicFormsOnReductiveGroups**, §4.5: `NormalizedMaassEigenform(r,δ)`, `fourierCoefficient`, `fourierExpansion`, `maassHecke`, `maassHeckeRecurrence`, `maassAdelization` and `maassClassicalEquiv`. AL.2 uses real `r≥0`, first coefficient one in the supplied factor-two expansion, reflection sign `(−1)^δ` and the supplied unitary adelic realization. Negative real parameters use the same eigenvalue and `K_(ir)=K_(−ir)`. The standard and adjoint L-series, local factors, completions, functional equation and L-value norm identities are targets here. |
| Positive-argument Bessel kernel | **AutomorphicFormsOnReductiveGroups**, §4.5: the convergent cosh integral for complex order, argument derivatives, symmetry, Fourier ODE, decay and half-order value. AL.0 identifies its half-integral formula with that kernel and adds holomorphy and derivatives in the order variable. |
| Characters and Fourier integrals | Mathlib `AddChar`, `ContinuousMonoidHom`, `Real.fourierChar`, `ZMod.toCircle`, `ZMod.dft`, `VectorFourier.fourierIntegral`, its translation/scalar/a.e. congruence lemmas, and `SchwartzMap.fourierTransformCLM`. Translation covariance and the Schwartz Fourier operator are imported. |
| Compact-open duals | Mathlib `PontryaginDual` supplies the continuous-character space and topology. Tau Ceti's `fourierPontryaginDualEquiv` classifies the dual of an additive circle; its Fourier coefficient uniqueness and the Pontryagin Fourier–Stieltjes uniqueness results are reused in that scope. **ArithmeticGaloisRepresentations**, §2.7's scalar Fourier/Poisson prefix, supplies the standard trace character, local self-duality, restricted-product adelic duality and diagonal self-annihilator. AL.0 compares these supplied pairings with `U⊥` and its local-factor and vector-space Fourier conventions. |
| Distributions | Mathlib `TemperedDistribution` is the continuous dual with pointwise-convergence topology. Its `delta` is already evaluation at a point. The new work is the scaling action, eigenspaces, restrictions and finite-jet classification, not a second Dirac distribution. |
| Parametric integrals | Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `mellin`, `mellin_differentiableAt_of_isBigO_rpow` and `mellinInv_mellin_eq`. Local integrability, strict endpoint exponent margins, continuity at the inversion point and integrability on the Mellin line remain hypotheses. |
| Adeles and Euler products | Tau Ceti's **GlobalNumberFields**, layers 0, 5, 6, 9 and 10, and **LocalFieldsRamification**, layer 3. The completed **RestrictedProducts** roadmap, layers 0–3 on the reference topology, functorial maps, finite-factor decompositions and diagonal subgroups, and the `TauCeti.RestrictedProductGroup` and `TauCeti.rationalDiagonal` APIs are reused. **ArithmeticDirichletSeries**, layers 3 and 8, supplies analytic Euler products and Landau positivity. |
| Finite rank-one epsilon scalar | **ArithmeticGaloisRepresentations**, §2.7, [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum), owns `tateLocalConstant`; its [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), `finiteStandardEvaluation`, supplies the scalar test integrals and their Fourier values. AL.1 proves the unconditional identification with the normalized-distribution scalar, using the same positive Fourier character, self-dual measure and norm twist. Clients use that supplied scalar through the AL.1 adapter. |
| Conductors | The main **ClassFieldTheory** roadmap, layer 7, supplies `characterConductorExp` and `unitFiltration_characterConductorExp_le_ker`. The normalized local analytic statements use that attained integer directly, together with the local Artin normalization. **ArithmeticGaloisRepresentations**, §§3.1–3.3 and 3.5, is the sole owner of Artin/Swan conductors, their integrality and the Weil–Deligne conductor, for its complete discretely valued perfect-residue setting in either characteristic. AL.3 uses `Conductor.artinConductor` and `Conductor.artinConductorNat` on the local Galois representation, constructs equal-characteristic Weil-parameter adapters and compares the same integer with the analytic epsilon exponent and rank-one modulus. Its equal-characteristic local constants and product formula are constructed here; the finite-place epsilon theorem in §2.7 of that supplier is p-adic. |
| Function-field multiplicative arithmetic | **ArithmeticGaloisDuality**, §R02.3.2, owns `GlobalFunctionField.ideles`, `ideleClassGroup`, `ideleDegree`, degree surjectivity, compact degree-zero classes, `GlobalFunctionField.classFormation` and arithmetic reciprocity with local compatibility. AL.3 constructs completion-valued additive adeles, identifies their topological units and rational diagonal with these ideles, and compares the divisor/Picard and geometric rank-one dictionaries with the supplied degree and Artin map. |
| Rank-one checks | Mathlib's primitive Dirichlet completed functional equation, Gaussian Fourier transform, theta identity, finite Gauss sums, completed Riemann zeta functional equation and residue, and number-field class number/regulator/discriminant definitions and real one-sided Dedekind residue limit. The real residue limit alone does not assert complex continuation. Tau Ceti `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` and `TauCeti.ne_zero_of_eqOn_dedekindZeta` already give the Dedekind specialization near Re(s)=1; use them in that scope. General unitary-character Hecke continuation and functional equations come from AL.2 at `n=1`; ArithmeticGaloisRepresentations §2.7 supplies the **Finite-order Hecke functional equation** and the finite-sum **Root-number product formula**, and the distribution/measure comparisons are AL.1 targets. On algebraic norm twists use **Hecke zeta-integral comparison** with LFunctions layers 0, 5–6. |
| Primitive rank-one functions | **LFunctions**, layer 0 and layers 5–6: primitive finite-order Hecke functions in layer 5 and algebraic Hecke functions in layer 6, with conductor-balanced completions and inverse-character equations. **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**: scalar adelic Schwartz/Fourier/Poisson foundations; [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), with `finiteStandardEvaluation`, `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`; [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison), with conductor and variable transport on algebraic norm twists; [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation), with LFunctions layer 5's finite-order equation; [Root-number product formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula), with the finite-sum local-constant product identity; [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum), defining `tateLocalConstant` by Gauss sums and archimedean phases. AL.1 compares the real evaluations directly, the complex evaluations after the `π⁻¹` test-vector scaling and the finite evaluations after the `q^(ν/2)` scaling. General unitary-character continuation, functional equations and arbitrary-test-function residues come from AL.2 at `n=1`. |
| Entire growth and factorization | **ZerosOfLFunctions**, layer 0 `OrderLE` and layer 5.1–5.6: multiplicity-counted zero bounds, genus-one canonical products and Hadamard factorization for general entire functions of order at most one, nonzero at the origin. AL.2 supplies the centered-growth adapter, removal of the central zero and paired-zero/parity/positivity specialization. |
| Holomorphic modular L-functions | Tau Ceti `CuspForm.abscissaOfAbsConv_qExpansion_coeff_le`, `CuspForm.LSeries_qExpansion_coeff_eq` and `CuspForm.hasEntireExtension_qExpansion_coeff`. In the coefficient normalization the recorded absolute-convergence bound is Re(s)>k/2+1 and the comparison includes width⁻ˢ. Tau Ceti `HeckeRing.GL2.Newform.LSeries_eulerProduct_hasProd` and its value forms already give analytic Euler products with the bad-prime factors included. These are used for the modular specialization. |
| Weight-facing acceptance | **DeligneWeightsAndPurity**, §§0.17, 1.7, 1.10, 6.4, 7.15 and 10.1–10.3, supplies weight predicates, purity and arithmetic transports; **EtaleCohomologyFoundations**, §§F.5–F.7, supplies duality, cycle classes and projective-space cohomology. AL.3 owns the [acceptance suite](#weight-facing-acceptance-suite) and its comparison with the unramified pure realization. |
| Intersection complexes | **EtaleCohomologyFoundations**, §F.8, supplies the perverse heart, intermediate extension and affine vanishing; **DeligneWeightsAndPurity**, §§8.9 and 8.11–8.12, supplies shift/weight conventions, directional bounds and proper purity. AL.3 constructs [Normalized scheme intersection-complex purity](#normalized-scheme-ic-purity), including the mixed-perverse subquotient argument, before the shtuka-specific pullback, descent and essential comparisons. |
| Polynomial factors and orders | Mathlib `Matrix.charpolyRev` is det(1−T M). `MeromorphicOn.divisor`, its multiplication/inversion lemmas and `meromorphicOrderAt_mul` supply divisor arithmetic. The latter adds native `WithTop ℤ` orders even in the infinite-order cases; no replacement order function is constructed. |


### Native formulas and carriers

Mathlib `AddChar.compAddMonoidHom` and `AddChar.compAddMonoidHom_apply`
(`Mathlib/Algebra/Group/AddChar.lean`) supply trace pullback as a character and its
evaluation. `AddChar.mulShift`, `AddChar.mulShift_apply`, `AddChar.mulShift_mul`,
`AddChar.mulShift_mulShift` and `AddChar.mulShift_zero` in the same module supply
algebraic local character shifts. They are used directly. ArithmeticGaloisRepresentations
§2.7's scalar Fourier/Poisson prefix supplies the standard trace character, its conductor
and diagonal product theorem, local topological self-duality, restricted-product adelic
duality and the diagonal self-annihilator. AL.0 compares these supplied maps with its
bilinear annihilator and local-factor Fourier normalizations.

Mathlib `SchwartzMap`, `TemperedDistribution` and `TemperedDistribution.delta` supply
the archimedean test-function carrier, its continuous dual and point evaluation;
`SchwartzMap.fourierTransformCLM` supplies the Schwartz Fourier operator. At a finite
place SmoothRepresentationsOfLocalGroups SR.1.1 supplies its locally constant compactly
supported carrier. The additional targets here are scalar actions, finite-level
Fourier identities and the local/adelic comparison; no new copies of the supplied
spaces or Dirac functional are constructed.

Mathlib `LSeries` and `LSeriesSummable` supply the Maass finite series in its
convergence domain. This roadmap adds its gamma completion, normalization comparisons
and automorphic continuation. Mathlib `Matrix.charpolyRev`, `Matrix.eval_charpolyRev`
and `Matrix.coeff_charpolyRev_eq_neg_trace`
(`Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`) supply det(1−TM), constant term 1
and linear coefficient `−tr(M)`. AL.4 adds the L-group/Satake interpretation and its
basis and conjugacy comparisons over that native polynomial.

Tau Ceti `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` and
`TauCeti.ne_zero_of_eqOn_dedekindZeta`
(`TauCeti/NumberTheory/NumberField/DedekindZeta.lean`) give continuation to
`Re(s)>1−1/[K:ℚ]` after subtraction of the simple pole at 1, and nonvanishing on
`Re(s)=1` away from 1 for a compatible holomorphic representative. These statements
are consumed for that Dedekind specialization. General unitary-character Hecke continuation and functional equations
are AL.2's `n=1` case; the finite-order equation is supplied by
ArithmeticGaloisRepresentations §2.7's **Finite-order Hecke functional equation**, and the
Schwartz-distribution measure comparison is an AL.1 target. On algebraic norm twists
[Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison) identifies the standard integral with the LFunctions completion.

### Roadmap contracts

- **AutomorphicFormsOnReductiveGroups**, §§2.3–2.7 and 3.4–3.5, supplies the
  general normalized archimedean induction, Casselman embedding, Langlands
  classification, Weil parameters, generic unitary dual, globalization, restricted
  tensor construction and Flath factorization. The representation prerequisites
  specialize them to `GLₙ` and compare the supplied algebraic realizations with
  smooth/Hilbert realizations and local factors. Section 4.3 supplies number-field
  Fourier reconstruction and global/local cuspidal `GLₙ` genericity; AL.3 constructs
  the global Whittaker product realization and the function-field extension on its
  curve carriers. Section 4.5 supplies the positive-argument cosh Bessel kernel and
  its argument analysis; AL.0 proves the half-integral adapter and order derivatives.
  Section 4.5 also supplies `NormalizedMaassEigenform(r,δ)` with `fourierCoefficient`,
  `fourierExpansion`, `maassHecke`, `maassHeckeRecurrence`, `maassAdelization` and
  `maassClassicalEquiv`. AL.2 consumes its real `r≥0` specialization with reflection
  sign `(−1)^δ`; a negative real parameter has the same eigenvalue and Bessel kernel.
  AL.2 owns the standard and adjoint L-series, local factors, completions,
  functional equation and L-value norm identities on this supplied subtype.
  Section 5.7 supplies Clozel's regular algebraic cuspidal `GLₙ` rationality and
  exact-field descent; [Finite-part rationality](#finite-part-rationality) identifies
  that model with the rational Whittaker model and the geometric coefficient field.
- **AdelicAlgebraicGroups**, §§0.1–0.4 supplies locally normalized Haar measures,
  the restricted Haar product and its finite-factor Fubini comparison. Sections 2.2–2.3
  supply invariant quotient measures and rational quotients with Weil integration.
  AL.0 proves the local-vector-space and distribution extensions with those measures; the common
  adelic Schwartz/Fourier/Poisson prefix is consumed from ArithmeticGaloisRepresentations §2.7
  **Global inputs**.
- The main **ClassFieldTheory** roadmap, layer 7, supplies
  `TauCetiRoadmap.ClassFieldTheory.characterConductorExp` and
  `TauCetiRoadmap.ClassFieldTheory.unitFiltration_characterConductorExp_le_ker`.
  The integer is the least unit-filtration depth killed by the continuous character,
  and the attainment theorem places that filtration in its kernel. AL.1 consumes
  this integer and proves norm-twist invariance and analytic epsilon comparisons.
- **LFunctions**, layers 0, 5–6 supplies primitive Hecke functions and their balanced
  completions, conductors, root numbers and functional equations; **ArithmeticGaloisRepresentations**,
  §2.7 **Global inputs** supplies the standard trace character, local and adelic additive
  duality, diagonal self-annihilator and common adelic Schwartz/Fourier/Poisson foundations.
  Its **Standard-test-function evaluations**, **Hecke zeta-integral comparison**,
  **Finite-order Hecke functional equation**, [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum) and **Root-number product formula** supply the
  local standard values, the standard-integral normalization, the finite-order equation,
  Gauss-sum local constants and their finite-sum product identity, including algebraic norm twists.
  AL.2 supplies continuation and functional equations for every rank, including general unitary characters at rank one.
  AL.1 consumes these comparisons through [Canonical rank-one comparison](#canonical-rank-one-comparison).
- **ZerosOfLFunctions**, layer 0 and layer 5.1–5.6 supplies the general order predicate,
  zero-divisor bounds, canonical products and Hadamard theorem. AL.2 uses them for its
  centered paired-zero theorem, factoring out a central zero before applying layer 5.6.
- **SmoothRepresentationsOfLocalGroups**, SR.1.1 supplies finite-place compactly
  supported locally constant functions; SR.2–SR.3 supplies normalized induction and
  irreducible admissible inputs; SR.4 supplies spherical Satake classes. SR.2.3
  *whittaker-functionals* gives `GL₂` uniqueness; SR.5.1 *mirabolic-derivatives* and
  SR.5.3 *highest-derivative-adapter* give derivatives and their characteristic-zero
  adapter. Higher-rank uniqueness, generic newforms and conductor normalization
  use the [generic newform interface](#generic-local-newforms), with rank-two
  newvectors supplied by [GL₂ newvectors](#gl2-newvectors)
  and the higher-rank construction here.
- **ReductiveGroupsPartII**, RG2.5.1–RG2.5.2, supplies the dual group and L-group.
  [The unramified L-group Euler factor](#l-group-local-factor) forms the Frobenius
  coset `Ĝ ⋊ Frob_v` of an unramified group from that L-group.
  **IntegralHeckeAndGaloisDeterminants**, §3a.1, *Normalized Satake coefficients for GLn*,
  supplies the integral-to-unitary polynomial conversion: under its Satake map the
  roots are `q^((n−1)/2)` times the unitary roots.
- **ArithmeticGaloisRepresentations**, §§2.4–2.5 supplies the shared Weil–Deligne
  data (V,r,N), inertia and monodromy invariant factor and arithmetic/geometric
  Frobenius conversion; §2.7 supplies epsilon factors and owns the canonical finite
  rank-one `tateLocalConstant`. AL.1 proves the unconditional local distribution
  comparison. AL.4 takes supplied higher-rank ramified factor equalities as inputs, and proves their
  normalization transport and the unramified determinant comparison.
- **ArithmeticGaloisRepresentations**, Layer 3, supplies the Artin/Swan conductor in
  equal characteristic with its continuity and finite-wild-image hypotheses. AL.3
  constructs the equal-characteristic Weil-parameter adapter and epsilon-exponent comparison.
- **ArithmeticGaloisDuality**, §R02.3.2, supplies function-field ideles, idele
  classes, degree and arithmetic reciprocity with local compatibility. Its carrier and
  class-formation prefix precedes the AL.3 additive-adele comparison and geometric
  rank-one realizations. These realizations agree with the inverse of its Artin map.
- **ArithmeticLocallySymmetricSpaces**, ALS.5b.1 *Betti, de Rham and relative Lie algebra cohomology in characteristic zero*, ALS.5b.4
  *The automorphic comparison and Franke's input* and ALS.5b.5 *Cuspidal cohomology* supplies the geometric
  characteristic-zero realizations, retaining the `FrankeInput` hypothesis of ALS.5b.4.
  ALS.F.6–F.7 supplies automorphic and archimedean cohomological carriers.
  [Finite-part rationality](#finite-part-rationality) supplies the finite-part E-structure. AL.3 constructs their actual
  comparison with an explicit nonzero infinity vector and retains the period modulo `E×`.
  Its Gauss twisting theorem uses generators transported by the infinity twisting map;
  independently chosen generators retain their additional comparison scalar.
- **SchemeAndStackFoundations**, layers 0–3 supplies schemes, descent and stacks,
  sites and scheme cohomology, and curve/Picard objects. **AlgebraicModuliForArithmeticGeometry**,
  layers 2–5 supplies Hom/Isom parameters, effective descent, gerbes and rigidification.
  **EtaleCohomologyFoundations**, §§F.0–F.6 and F.10.1–F.10.5, supplies finite
  constructible/ctf and adic operations, duality, Frobenius-equivariant Künneth
  and trace algebra.
  **InverseGaloisAndArithmeticFundamentalGroups**, §IG.0.T3, supplies
  `VanishingCycles.etaleTraceFormula`. **EtaleCohomologyFoundations**,
  §0.11, supplies `ClassicalAlgebraic.smoothTrace` and
  `ClassicalAlgebraic.curveDuality` for separated smooth finitely presented maps,
  with the §0.8 compactification, coefficients `ℤ/n` and n invertible; §§0.9–0.10
  supply cycle classes and smooth-boundary purity. Use compatible `ℓ`-power lattices and
  rational adic realization for `ℓ≠char(𝔽_q)`. **DeligneWeightsAndPurity**,
  DWP.0–DWP.1 and DWP.5–DWP.7, supplies numerical weights, Weil descent,
  curve purity and direct-image bounds. In particular DWP.6.4 and DWP.7.8,
  with duality, give pure smooth-proper cohomology. SchemeAndStackFoundations
  §0.29 supplies absolute, relative, iterated and q-power scheme Frobenius
  with their specified codomains. Their scheme statements are not
  substituted for AL.3's finite-stabilizer shtuka cohomology and boundary comparisons.
  **EtaleCohomologyFoundations**, §F.8, supplies the perverse heart and middle extension;
  **DeligneWeightsAndPurity**, §§8.11–8.12, supplies weight bounds and proper purity.
  AL.3 proves [Normalized scheme intersection-complex purity](#normalized-scheme-ic-purity)
  with the mixed-perverse subquotient bounds and affine-open reduction.
  [Shtuka intersection cohomology and essential comparison](#shtuka-intersection-comparison)
  transports this scheme theorem through its local-model pullback and descent,
  then constructs the essential compact-support comparison.
- **EtaleCohomologyFoundations**, §§F.5–F.7, supplies the duality, cycle classes
  and projective-space cohomology used in AL.3's
  [weight-facing acceptance suite](#weight-facing-acceptance-suite).
  **DeligneWeightsAndPurity**, §§0.17, 1.7, 1.10, 6.4, 7.15 and 10.1–10.3,
  supplies spectral separation, curve weights, zeta rationality, purity and the
  arithmetic weight transports for that suite. The acceptance statements and
  their unramified cuspidal tensor-factor comparisons are AL.3 targets here.

The mathematical hypotheses below define the scope of each target. `Suggested.lean` states the headline results expressible on the pinned carriers: point-supported finite jets, Bessel identities, local and global rank-one continuation and functional equations, local eigenline uniqueness, paired Hadamard factorization and positivity, generic newform lines in every rank, and Casselman's `GL₂` dimension and central-character theorems. The module docstring identifies the objects needed for the remaining headline statements.

## How to read the build

| Layer | Library built |
| --- | --- |
| AL.0 | Bilinear annihilators, local-factor and vector-space Fourier comparisons over the supplied scalar character/duality and Poisson foundations, self-dual measure adapters and Bessel transforms. |
| AL.1 | Tate eigendistributions, local/global factor adapters, scalar Hecke corollary of Godement–Jacquet, canonical Hecke comparison and CM normalization. |
| AL.2 | Godement–Jacquet standard factors, GL₂ and higher-rank newform tests, centered entire functions and paired products, and Maass standard functions. |
| AL.3 | Whittaker models, Rankin–Selberg analysis, multiplicity/converse theorems, periods, function-field cuspidal polynomials and reciprocity, open-disc indices and the weight-facing acceptance suite. |
| AL.4 | Satake/L-group determinants, conditional Weil–Deligne comparisons and factor operations. |
| AL.5 | Finite Euler corrections, critical-value normalization, sign vanishing and refined GL₂ factors. |

Specialize AutomorphicFormsOnReductiveGroups §§2.3–2.7’s induction, parameters and globalization to `GLₙ` before the Whittaker/Weil-parameter comparisons and AL.1’s archimedean factors. Construct AL.0 and AL.1's local distribution prefix first among the analytic layers; construct the restricted-tensor comparisons using that supplier’s §§3.4–3.5 and use the ALS.F.6 cusp realization before number-field global integrals. In the function-field branch, curve additive analysis constructs completion-valued adeles and compact rational unipotent quotients before restricted-tensor realizations constructs the cuspidal carriers. Prove local Whittaker uniqueness, then construct the local integral/factor prefixes of AL.2 and AL.3. The local `GL₂` newvector targets and the higher-rank newvector/essential-function targets follow these prefixes and precede ramified tests. The `GL₂` dimension theorem uses only the AL.2 prefix ending at standard-local-l-factor. The ramified Godement–Jacquet test uses the finite-place Rankin–Selberg induced-factor product. AL.2's matrix Poisson continuation, including `n=1`, precedes AL.1's Hecke comparison. The rank-one part uses only AL.0, AL.1's local prefix and the supplied Hecke comparisons. The global analytic prefix of AL.3 precedes AL.2's sharp Euler-product convergence boundary, using the positive self-pair and the Jacquet–Shalika bound. AL.4's determinant interface precedes the function-field and motivic suffix of AL.3. Rational periods use the geometric rational structures of the finite-part rationality target and ALS.5b after the analytic Whittaker model has been constructed. The isobaric construction precedes number-field strong multiplicity one, which then precedes finite-part rationality and periods. In the curve branch, degree/slope, HN filtrations and polygon boundedness precede shtuka truncations. Function-field local/global analytic and converse targets precede rank induction. Rank r first assumes the ramified correspondence and temperedness in every smaller rank, constructs the lower-rank leg-in-level spaces and their counts for boundary degenerators in the level, applies normalized scheme intersection-complex purity to the local models and constructs their descent and essential compact-support comparison, proves the level-r essential-cohomology construction, applies VI.11 and its local comparisons, then specializes to no level. The document groups targets by layer; these finer dependencies specify their acyclic construction order.

For named APIs, `LocalFourier` means `TauCeti.LocalFourier`, `SchwartzBruhat` means `TauCeti.SchwartzBruhat`, `TateZeta` means `TauCeti.TateZeta`, and `ALk` means `TauCeti.AutomorphicLFunctions.ALk`. A definition's tests specify concrete computations, comparisons or failures that distinguish its normalization.


## Representation prerequisites

<a id="archimedean-smooth-representations"></a>

**Archimedean Whittaker comparisons.** For `GLₙ(ℝ)` and `GLₙ(ℂ), n≥1`, specialize **AutomorphicFormsOnReductiveGroups**, §§2.3–2.7: use its normalized induction and compact picture, ordered standard modules, Langlands quotients and Casselman–Wallach equivalence for admissible finite-length Harish-Chandra modules, treating `GLₙ(ℂ)` as a real reductive group. For a specified unitary Hilbert realization identify its smooth vectors with the supplied smooth moderate-growth Fréchet globalization, preserving maximal-compact finite vectors. Use the supplied compatibility with contragredients, normalized induction and norm twists. For generic irreducibles prove one-dimensionality of the continuous Whittaker-functional space for a fixed nondegenerate character and identify the resulting orbit-function realization with this smooth representation. Retain continuity and the globalization topology in this comparison. Casselman embedding and the generic unitary classification are consumed from §§2.3 and 2.6.

**Checks.** `GL₁` characters globalize on a complex line; a weight-two `GL₂` discrete-series block retains both `O(2)` signs; a continuous Whittaker functional is unique up to scalar, whereas the zero functional gives no realization.

(Source: Bernstein–Krötz, *Smooth Fréchet globalizations of Harish-Chandra modules*, arXiv:0812.1684v3, §1, Theorem 1.1 and §§5, 10; Humphries, §2.2.2–§2.2.4, pp.4–5; Jacquet, §2, pp.3–5.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §§2.3–2.7, normalized induction, Casselman embedding, Langlands classification, parameters, generic unitary dual and globalization.

<a id="archimedean-gln-parameters"></a>

**Archimedean `GLₙ` parameters.** Use **AutomorphicFormsOnReductiveGroups**, §2.5, for the Weil groups `W_ℝ=ℂ×∪jℂ×, j²=−1, jzj⁻¹=z̄`, and `W_ℂ=ℂ×`, their finite-dimensional semisimple continuous parameters, constituent classification and correspondence with Langlands quotients. Specialize this correspondence to the ordered normalized standard modules and smooth globalizations used by [Archimedean Whittaker comparisons](#archimedean-smooth-representations). Real one-dimensional constituents are `sgn^a|·|^t`; real two-dimensional constituents `I_w|·|^t` have `w≥1`; complex constituents have integral angular weight and a complex norm exponent. Match the corresponding characters and discrete-series blocks, duals, norm twists, infinitesimal characters, and the gamma/epsilon formulas of AL.1. The parameter construction precedes those formulas.

**Checks.** The trivial real line gives `Γ_ℝ(s)`; `I₁` gives `D₂` and `Γ_ℂ(s+1/2)`; `I₀` splits as `1⊕sgn` and is excluded from the irreducible two-dimensional list.

(Source: Humphries, §2.2.1–§2.2.4 and §2.4.2–§2.4.3, pp.3–7; Borel, §§12–13, pp.46–50.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §§2.4–2.5, Langlands classification and archimedean parameters; [Archimedean Whittaker comparisons](#archimedean-smooth-representations); ReductiveGroupsPartII RG2.5's dual-group vocabulary.

<a id="restricted-tensor-realizations"></a>

**Restricted tensor realizations.** For an irreducible admissible `GLₙ` cuspidal module, specialize **AutomorphicFormsOnReductiveGroups**, §§3.4–3.5, to obtain the algebraic restricted tensor, its universal maps, cofinal-finite-set independence and unique irreducible local factors. Fix nonzero spherical reference vectors at almost every finite place. For a specified unitary cuspidal Hilbert realization, identify this algebraic factorization with the restricted Hilbert tensor using unit spherical vectors. Use [Archimedean Whittaker comparisons](#archimedean-smooth-representations) for its smooth infinity realization. Over a number field prove that the completed projective tensor of the supplied archimedean smooth globalizations realizes the smooth automorphic module in ALS.F.6, compatibly with the algebraic and Hilbert factorizations. Tensor maps depend on the chosen spherical vectors and global scalar. Over a function field use [Curve additive analysis](#curve-additive-analysis) for completion-valued adeles and compact rational unipotent quotients, with its identification of topological units with ArithmeticGaloisDuality §R02.3.2’s ideles. Central characters and central degree classes use that supplier’s idele-class quotient and degree. Construct smooth central-character automorphic functions on `GLₙ(K)\GLₙ(𝔸)`, their constant terms by integration over these unipotent quotients, and the cuspidal subspace with all proper constant terms zero. At fixed compact-open level and fixed central degree class prove finite support modulo the centre and finite dimensionality; give the invariant `L²` pairing and algebraic restricted tensor factorization of an irreducible cuspidal summand. Compare their quotient measures with the residue-character self-dual measures. For number-field rational unipotents, prove compactness and successive integration along root-subgroup coordinates from AdelicAlgebraicGroups §2.3 and GlobalNumberFields layers 5–6; prove independence of coordinates and the quotient Fubini identity before Fourier reconstruction.

**Checks.** A `GL₁` tensor recovers an idele-class character; changing one spherical vector scales the tensor identification; a sum of two independent pure tensors need not itself be pure.

(Source: Cogdell, Fields lectures, Lecture 3, Theorems 3.2, 3.4 and 3.6, pp.22–26; Lafforgue, VI §1d, pp.157–158 and Appendix B §2b, pp.230–232.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §§3.4–3.5, restricted tensors and Flath factorization, with §§2.3–2.7 at infinity; ALS.F.6; GlobalNumberFields layers 5–6; SmoothRepresentationsOfLocalGroups SR.1–SR.4; AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3; ArithmeticGaloisDuality §R02.3.2 for function-field ideles, idele classes and degree; [Curve additive analysis](#curve-additive-analysis) for their carrier and function-field measure comparisons; [Archimedean Whittaker comparisons](#archimedean-smooth-representations) at infinity.

<a id="isobaric-construction"></a>

**`GLₙ` isobaric sums.** Over a number field construct the isobaric Langlands sum of a finite multiset of cuspidal representations with specified norm twists, as the irreducible Langlands quotient of ordered normalized induction. Identify its unramified Satake polynomial with the product of the constituent polynomials. This construction precedes number-field strong multiplicity one.

**Checks.** A one-term isobaric sum is that cusp representation; two unramified characters with values a,b give `1−(a+b)T+abT²`; permuting the cuspidal constituents preserves the isomorphism class of the sum.

(Source: [Langlands](#ref-langlands1979), Propositions 1–2, pp.203–207, for automorphic constituents of cuspidal induction, together with the supplied local Langlands classification for the specified quotient; Cogdell, Fields lectures, Lecture 9, pp.75–76, for cuspidal support.)

*Needs:* [Archimedean Whittaker comparisons](#archimedean-smooth-representations); [Restricted tensor realizations](#restricted-tensor-realizations); SR.2–SR.3 normalized induction and Langlands quotients; AL.2 local-factor prefix.

<a id="finite-part-rationality"></a>

**Finite-part rationality.** For a regular algebraic cuspidal `GLₙ` representation over a number field in the C-algebraic/cohomological normalization, consume **AutomorphicFormsOnReductiveGroups**, §5.7: its finite-part rationality field is a number field, its finite part has a model over that exact field, and coefficient automorphisms give the corresponding cuspidal conjugates. Identify that supplied model, after scalar extension, with the finite part in [Restricted tensor realizations](#restricted-tensor-realizations). For the strongly pure weights of the rational-period target, construct the semilinear action and rational Whittaker model using normalized finite-place newvectors. Compare with the geometric cohomology carrier only after extending scalars to contain both the weight field and the finite-part field; this construction does not choose a period representative. Use ALS.F.7 for the cohomological weight and infinity carriers.

**Checks.** An algebraic `GL₁` Hecke character gives a one-dimensional finite-part model; enlarging the field extends that model; a raw unitary Satake root scaled by `q^(−(n−1)/2)` need not belong to the rationality field, so the C-algebraic normalization is retained.

(Source: Clozel, *Motifs et formes automorphes*, §3, Théorème 3.13; Raghuram, §2.5.2.1–§2.5.2.3, pp.24–25, rational Whittaker and geometric models.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §5.7, Clozel rationality and exact-field finite-part descent; [Restricted tensor realizations](#restricted-tensor-realizations); [Generic finite-place newforms](#generic-local-newforms); ALS.F.7 and ALS.5b.1/ALS.5b.5; AL.3 strong multiplicity one and Whittaker factorization.

## Layer AL.0: Local and adelic Fourier analysis


### Annihilators and compact-open Fourier identities


<a id="pairing-annihilator"></a>

**Annihilator for a bilinear character pairing.** Construct `U⊥={w∈W | ψ(L(u,w))=1 for every u∈U}` as an AddSubgroup W. It is generally not an R-submodule. Its data is exactly this carrier and the inherited additive subgroup operations.

Work under the following hypotheses. R is a commutative ring; V and W are additive commutative groups and R-modules. `ψ` is a native AddChar R Circle; `L:V×W→R` is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data.

Require the following API.

- The annihilator of the zero additive subgroup is the full subgroup W.
- For the zero bilinear pairing the annihilator of every U is W.
- `U⊆U′` implies `(U′)⊥⊆U⊥` for the same `ψ` and L.
- For a linear `T:W′→W`, the annihilator for `(v,w′)↦L(v,Tw′)` equals the native comap of `U⊥` along T. This uses native `LinearMap.compl₂`.

**Checks.**

- For `R=V=W=Z/2`, the standard ZMod.toCircle character, multiplication pairing and `U=V`, the annihilator is zero.
- For `ψ=1` and every L,U, the annihilator is W.
- For `V=W=R`, multiplication pairing and U the additive subgroup generated by `1, U⊥` equals the native kernel of `ψ.toAddMonoidHom`. U cannot be replaced by all of R in this assertion.
- For `R=V=W=R`-real, `ψ(x)=exp(2πix)`, multiplication pairing and `U=Z·1`, the annihilator contains 1 and does not contain 1/2. Thus it is not stable under real scalar multiplication.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* Mathlib `AddChar`; Mathlib `AddChar.map_zero_eq_one`; Mathlib `AddChar.map_add_eq_mul`; Mathlib `LinearMap.compl₂`; Mathlib `AddChar.toAddMonoidHom`; Mathlib `ZMod.toCircle`; Mathlib `ZMod.injective_toCircle`; Mathlib `Real.fourierChar`; Mathlib `Subgroup.zpowers`.


<a id="mem-pairing-annihilator"></a>

**Membership in the character annihilator.** Prove, for every `w, w∈U⊥` if and only if `ψ(L(u,w))=1` for all `u∈U`.

Work under the following hypotheses. Use the pairing data above.

**Checks.**

- For U zero the condition is empty.
- For the trivial character it holds on every subgroup.
- For the real standard character and `U=ℤ·1`, membership is precisely integral frequency.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* [Annihilator for a bilinear character pairing](#pairing-annihilator).


<a id="closed-annihilator"></a>

**Closedness of the character annihilator.** If W is a topological space and `w↦ψ(L(v,w))` is continuous for each `v∈V`, then `U⊥` is closed in W.

Work under the following hypotheses. Use the pairing data above. W is topological; each displayed one-variable circle-valued map is continuous.

**Checks.**

- For U zero the annihilator is the closed set W.
- Over ℝ the annihilator of `ℤ·1` is the closed subgroup `ℤ·1`.
- For the real standard character and `U=ℝ` it is the closed singleton zero.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); Mathlib `isClosed_eq`; Mathlib `isClosed_iInter`.


<a id="open-annihilator"></a>

**Openness of a compact subgroup annihilator.** Suppose V,W are topological spaces, U is compact as a subset of V, and `(v,w)↦ψ(L(v,w))` is jointly locally constant. Then `U⊥` is open in W.

Work under the following hypotheses. Use the pairing data above. V,W are topological; U is compact; the joint circle-valued pairing is IsLocallyConstant.

**Checks.**

- For U zero the annihilator is all of W and is open.
- At an unramified finite place the annihilator of O is the open subgroup O.
- The real multiplication pairing is continuous but not locally constant; its annihilator of `ℤ·1` is not open.

(Source: Mathlib `IsLocallyConstant`, compactness and the finite-subcover argument applied to the character pairing.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); Mathlib `IsLocallyConstant.isOpen_fiber`; Mathlib `generalized_tube_lemma`.


<a id="vanishing-from-period"></a>

**Fourier vanishing from a nontrivial period.** If `f(v+u)=f(v)` for every v and `ψ(L(u,w))≠1`, then `Ff(w)=0`.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and `μ` is invariant under right addition.

**Checks.**

- A constant function has zero transform at every nontrivial character frequency.
- For `f=1_O` at an unramified finite place, a frequency outside O is killed by an O-period.
- The zero period has character value one and fails the nontrivial-phase hypothesis.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* Mathlib `VectorFourier.fourierIntegral_comp_add_right`.


<a id="fourier-support"></a>

**Fourier support lies in the period annihilator.** If every `u∈U` is a period of f, then ordinary `support(Ff)⊆U⊥`.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and `μ` is invariant under right addition.

**Checks.**

- An O-periodic finite-place function has transform supported in the trace dual of O.
- For the trivial character the annihilator is all frequencies, giving no smaller support.
- For f zero the Fourier support is empty even for a degenerate pairing.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); [Fourier vanishing from a nontrivial period](#vanishing-from-period).


<a id="indicator-transform"></a>

**Fourier transform of a subgroup indicator.** If U is measurable, then `F(1_U)=μ.real(U)·1_(U⊥)`. The theorem uses native totalized Bochner integrals. On finite-measure compact-open U with continuous pairing it is the usual convergent Fourier calculation.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and `μ` is invariant under right addition. U is measurable. No unit-volume assumption and no self-duality identification are imposed.

**Checks.**

- At an unramified finite place with unit O-volume, the transform of `1_O` is `1_O`.
- Rescaling Haar measure rescales the transformed indicator.
- For the trivial character the transformed indicator is the constant `μ.real(U)`.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); [Fourier support lies in the period annihilator](#fourier-support); Mathlib `VectorFourier.fourierIntegral`; Mathlib `MeasureTheory.integral_indicator_const`; Mathlib `MeasureTheory.integral_congr_ae`.


<a id="coset-transform"></a>

**Fourier transform of a coset indicator.** For measurable U and `a∈V`, the transform of `v↦1_U(v−a)` equals `w↦ψ(−L(a,w))·μ.real(U)·1_(U⊥)(w)`.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and `μ` is invariant under right addition. U is measurable; `a∈V`.

**Checks.**

- For a zero translate the subgroup-indicator formula is recovered.
- Translating O by an element of O leaves its indicator unchanged.
- A translate with nontrivial phase gives the inverse phase for the negative kernel.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* [Fourier transform of a subgroup indicator](#indicator-transform); Mathlib `VectorFourier.fourierIntegral_comp_add_right`.


<a id="modulation"></a>

**Fourier transform of a character modulation.** For every `w₀`, the transform of `v↦ψ(L(v,w₀))·f(v)` equals `w↦Ff(w−w₀)`. No invariance of `μ` is needed.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

**Checks.**

- Modulation by zero frequency changes nothing.
- Modulating a real Gaussian moves its transformed Gaussian to the modulation frequency.
- The identity holds for the zero measure and requires no Haar normalization.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* Mathlib `VectorFourier.fourierIntegral`; Mathlib `AddChar.map_add_eq_mul`; Mathlib `MeasureTheory.integral_congr_ae`.


<a id="frequency-periods"></a>

**Frequency periods from support containment.** If ordinary `support(f)⊆U` and `a∈U⊥`, then `Ff(w+a)=Ff(w)` for all w. No invariance of `μ` is needed.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

**Checks.**

- A function supported in O at an unramified finite place has O-periodic transform.
- For support in the zero subgroup the Fourier integrand is independent of frequency.
- For U the full space and a nondegenerate pairing, only the zero frequency period follows.

(Source: Mathlib `AddChar.toAddMonoidHom` and `VectorFourier.fourierIntegral`; the subgroup identities follow by evaluating characters and translating the integral.)

*Needs:* [Membership in the character annihilator](#mem-pairing-annihilator); Mathlib `VectorFourier.fourierIntegral`; Mathlib `AddChar.map_add_eq_mul`; Mathlib `MeasureTheory.integral_congr_ae`.


<a id="locally-constant-transform"></a>

**Local constancy of the Fourier transform.** Suppose V is topological, W is a topological additive group, U is compact, the joint character pairing is locally constant, and `support(f)⊆U`. Then Ff is locally constant.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. W is an IsTopologicalAddGroup; U is compact in V; the joint pairing is locally constant.

**Checks.**

- At a finite place the transform of a Schwartz–Bruhat function is locally constant.
- Support in O at an unramified place gives a transform constant on O-cosets.
- A real Gaussian has nonconstant transform; continuity cannot replace local constancy of the pairing.

(Source: Mathlib `VectorFourier.fourierIntegral`; translation of the frequency by the open annihilator of the compact support subgroup.)

*Needs:* [Openness of a compact subgroup annihilator](#open-annihilator); [Frequency periods from support containment](#frequency-periods); Mathlib `IsLocallyConstant.iff_exists_open`.


<a id="compact-support-transform"></a>

**Compact support from a compact period annihilator.** If W is Hausdorff, every `u∈U` is a period of f, and `U⊥` is compact, then Ff has compact support in the native sense.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and `μ` is invariant under right addition. W is a Hausdorff topological space; `U⊥` is compact. This compactness is an explicit input, not inferred from openness of U.

**Checks.**

- Finite-place open lattices have compact annihilators under the supplied local duality.
- For f zero the transform has empty compact support.
- For U zero over a noncompact dual the annihilator is W, so the compactness hypothesis fails.

(Source: Mathlib `HasCompactSupport`, `tsupport` and `VectorFourier.fourierIntegral`; the Fourier-support containment and closed compact annihilator give the result.)

*Needs:* [Fourier support lies in the period annihilator](#fourier-support); Mathlib `HasCompactMulSupport.of_mulSupport_subset_isCompact`.


<a id="indicator-inversion"></a>

**Fourier inversion for a subgroup indicator.** Put `A=U⊥`. Suppose U and A are measurable, `μ` on V and `ν` on W are translation invariant, the annihilator of A for the transposed pairing equals U, and `μ.real(U)ν.real(A)=1`. Then `F_(ν,Lᵗ)(F_(μ,L)(1_U))(v)=1_U(−v)`.

Work under the following hypotheses. Use the pairing data above. V has a measurable-space structure; `μ` is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and `μ` is invariant under right addition. W has measurable addition and `ν` is right-translation invariant. U,A are measurable. The double-annihilator equality and the volume-product equality are supplied explicitly.

**Checks.**

- For the unramified lattice O both unit-volume transforms fix its indicator.
- For `U=P^m` the dual lattice and reciprocal volumes cancel.
- Rescaling only one measure leaves an uncancelled scalar and violates the volume-product hypothesis.

(Source: Mathlib `VectorFourier.fourierIntegral`; applying the indicator formula twice with the stated double-annihilator and volume hypotheses.)

*Needs:* [Fourier transform of a subgroup indicator](#indicator-transform); Mathlib `VectorFourier.fourierIntegral_const_smul`; Mathlib `LinearMap.flip`.


### Characters, trace duality and self-dual measures

Consume **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, for the common
scalar character/duality foundations below, without automorphic hypotheses. In particular,
the same trace pairing identifies `𝔸_K` with `PontryaginDual(Multiplicative 𝔸_K)` by
restricted products and has diagonal annihilator `K⊥=K`. The `StandardAdditiveCharacter`
and `AdditiveDualityMap` names below denote specializations of this supplied API.
The additional work is its comparison with the bilinear annihilator, normalized local
measures and the local-factor and vector-space Fourier transforms.


<a id="standard-additive-character"></a>

**The standard additive character.** Use the standard trace character `ψ = ψ_ℚ ∘ Tr_{K/ℚ}` supplied by ArithmeticGaloisRepresentations §2.7, **Global inputs** (called `standardAddChar` in AutomorphicFormsOnReductiveGroups), with `ψ_Q,∞(x)=exp(2πix)` and `ψ_Q,p(x)=exp(−2πi frac_p(x))`; on a completion `K_v` it is `ψ_v=ψ_Q,w∘Tr_{K_v/Q_w}`. Its restricted product is trivial on the diagonal K. Its finite conductor is the inverse different `D_v^(−1)=P_v^(−d_v)`, while its archimedean characters are `exp(2πix)` and `exp(2πi(z+z̄))`. Compare these supplied formulas with the positive local-factor Fourier kernel.

Work under the following hypotheses. K number field; `frac_p(x)` denotes the rational p-primary part modulo Z. These are Kudla’s positive infinity characters, the inverse of Tate’s opposite global choice.

Use the following specializations of the supplied API. The planned names AL0.StandardAdditiveCharacter.conductor, AL0.StandardAdditiveCharacter.diagonal and AL0.StandardAdditiveCharacter.nontrivial, cited by ClassicalArithmeticCompletion, denote these three statements in order; they are specializations of the supplied character, not a second owner.

- The largest trivial fractional ideal is `P^(−d_v)`.
- `∏_vψ_v(a)=1` for `a∈K`.
- Each `ψ_v` is continuous and nontrivial.

**Checks.**

- For `Q_p` the different exponent is0 and `ψ` is trivial on `Z_p` but not `p^(−1)Z_p`.
- `ψ_R(1)=1` and `ψ_R(1/2)=−1`.
- `ψ_C(i)=1` although `i≠0`; nontriviality does not mean an injective character.
- At diagonal `1/3∈ℚ`, the real phase `exp(2πi/3)` cancels the `3`-adic phase `exp(−2πi/3)`. Giving both phases the positive sign fails diagonal triviality.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**, standard trace characters; definitions and conventions in [Kudla](#ref-kudla2004), §3 (3.30), p.124 and §4, p.127.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, scalar character/duality prefix; [Annihilator for a bilinear character pairing](#pairing-annihilator); Mathlib `AddChar.compAddMonoidHom`.


<a id="fractional-ideal-annihilator"></a>

**The trace annihilator of a fractional ideal.** Identify `U⊥` for multiplication and the supplied trace character `ψ_v` with the supplied local duality annihilator. For a fractional ideal `A=P^m`, this gives `A⊥={y:∀x∈A,ψ_v(xy)=1}=P^(−m−d_v)`. Consequently `(A⊥)⊥=A` and every such annihilator is compact open.

Work under the following hypotheses. Nonarchimedean completion of a number field; inverse different exponent `d_v`.

**Checks.**

- For `F=ℚ_p` and `m=0`, the annihilator is `ℤ_p`.
- At a ramified completion with `d_v>0`, `O_v⊥=P_v^(−d_v)`, which strictly contains `O_v`.
- For arbitrary integer m, applying `m↦−m−d_v` twice returns m, including for negative m.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**, trace duality and the inverse different; comparison with the character annihilator above.)

*Needs:* [The standard additive character](#standard-additive-character); [Annihilator for a bilinear character pairing](#pairing-annihilator); Tau Ceti **LocalFieldsRamification**, layer 3 ramification the tame and wild cases and the filtration.


<a id="self-dual-haar"></a>

**Self-dual local additive Haar measure.** Compare the supplied scalar self-dual measure with the local-factor normalization. The finite-place measure adapter rescales additive Haar `μ₀` with `μ₀(O)=1` by `q^(−d_v/2)`. Identify it with the supplied `ψ_v`-self-dual measure; at infinity use `μ_R=dx` and `μ_C=2 dxdy` for the standard trace characters. Transport the supplied character scaling `ψ_a(x)=ψ(ax), μ_{ψ_a}=|a|^(1/2)μ_ψ` and prove `μ(A)μ(A⊥)=1` for `A=P^m`. This additive normalization is distinct from prescribing multiplicative O×-volume1.

Work under the following hypotheses. `a∈F×`; Haar positive; `d_v` is the trace different exponent.

Require the following API.

- `μ(O)=q^(−d/2)`.
- `μ(A)μ(A⊥)=1`.
- Changing `ψ` to `ψ_a` multiplies `μ` by `|a|^(1/2)`.

**Checks.**

- `d=0` gives `μ(O)=1`.
- `d=2` gives `μ(O)=q^(−1)`, and `μ(P^(−2))=q`.
- For `|a|=q^(−1)`, the new Haar is `q^(−1/2)μ`, not `q^(−1)μ`.
- The complex trace pairing needs2 dxdy, not dxdy.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**, self-dual measures and character scaling; the fractional-ideal annihilator and indicator inversion give the volume product.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, scalar self-dual measure; [The trace annihilator of a fractional ideal](#fractional-ideal-annihilator); [Fourier inversion for a subgroup indicator](#indicator-inversion); **AdelicAlgebraicGroups**, §0.1, Borel structure and local normalization; Mathlib `fourierIntegral_gaussian`.


<a id="additive-duality-map"></a>

**The additive local-field duality map.** For a number-field completion F and continuous nontrivial additive character `ψ`, use the supplied topological group isomorphism `ι_ψ(y)(x)=ψ(xy)`, taking values in native `PontryaginDual(Multiplicative F)`. Compare its underlying character with Mathlib's algebraic shift.

Work under the following hypotheses. Use multiplication in F and compact-open topology on the native continuous-character group; do not replace the dual by a new carrier.

Use the supplied continuous compact-open map with the displayed evaluation formula. Its
underlying algebraic character is Mathlib's `AddChar.mulShift ψ y`, using commutativity to
write its value as `ψ(xy)`. The additive, scalar-character and zero identities are the native
shift identities recorded in Exact supplier contracts. Continuity into the compact-open
dual and the local-field topological isomorphism belong to the supplied scalar prefix;
its comparison with `U⊥` is specified below.

**Checks.**

- At zero: `ι_ψ(0)` is the trivial character.
- At a real half-frequency: For `ψ_R` and `y=1/2`, the character has value−1 at `x=1`.
- Over the two-element field: Over `F₂` with the nontrivial character, the map identifies the two elements with the two characters.
- For the trivial character: For trivial `ψ` the map is constant and cannot be a duality isomorphism.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**, scalar local additive duality; Mathlib `PontryaginDual`.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, local additive self-duality; Mathlib `PontryaginDual`; Mathlib `AddChar`; Mathlib `ContinuousMonoidHom`; [The standard additive character](#standard-additive-character).


<a id="local-additive-self-duality"></a>

**Self-duality of a local additive group.** Consume the topological isomorphism for `F=ℝ,ℂ` or a finite extension of `ℚ_p` from ArithmeticGaloisRepresentations §2.7. The annihilator comparison identifies `y∈U⊥` with `∀x∈U, ι_ψ(y)(x)=1`. It applies to every additive subgroup U; algebraically it holds for any commutative ring with a supplied topological isomorphism satisfying this evaluation formula. For local lattices transport the supplied compactness and double-annihilator identities through this comparison.

Work under the following hypotheses. F is a number-field completion in AL.0’s scope (`ℝ`, `ℂ`, or a finite extension of `ℚ_p`), and `ψ` is continuous and nontrivial; the topology on its dual is compact-open. The algebraic comparison assumes the supplied isomorphism and its evaluation formula. Equal-characteristic residue characters are treated by the curve additive analysis in AL.3.

**Checks.**

- For `U={0}`, both annihilator descriptions give all of F.
- For `U=F` and nontrivial `ψ`, both descriptions give `{0}`: a nonzero y has `yF=F`.
- For `F=ℝ`, the standard character and `U=ℤ·1` give the annihilator `ℤ·1`, which is not a real subspace.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**, scalar local additive duality; comparison by evaluating the supplied pairing.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, local additive self-duality; [The additive local-field duality map](#additive-duality-map); [The trace annihilator of a fractional ideal](#fractional-ideal-annihilator).


### Local Schwartz–Bruhat spaces and finite Fourier levels


<a id="local-schwartz-bruhat-space"></a>

**The local Schwartz–Bruhat space `S(F)`, its `F^×`-action and tempered distributions.** For F nonarchimedean, `S(F)` is the complex vector space of functions f : `F → ℂ` for which there is `r ≥ 0` with `supp f ⊆ P^{−r}` and f constant on cosets of `P^r` (SR.1's locally constant compactly supported carrier over `ℂ`); `S(F)′` is its algebraic dual. For `F = ℝ, ℂ, S(F)` is Mathlib's Schwartz space `𝓢(F, ℂ)` (F viewed as a real vector space) and `S(F)′ = 𝓢′(F, ℂ)` is Mathlib's TemperedDistribution. `F^×` acts by `r(a)f(x) = f(xa)` and on distributions by `⟨r′(a)λ, f⟩ = ⟨λ, r(a^{−1})f⟩`. `δ₀` is `⟨δ₀, f⟩ = f(0)`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. Kudla p. 115: tempered distributions at a finite place are arbitrary `ℂ`-linear functionals; at `ℝ, ℂ` they are the continuous functionals on the Fréchet space.

Require the following API.

- `r(a)f(x) = f(xa)`, a group action of `F^×` by linear maps.
- `(r(a)f)(x) = f(xa)`.
- `f ∈ S(F)` iff `∃ r, supp f ⊆ P^{−r} ∧ f` is `P^r`-periodic.

**Checks.**

- `1_O ∈ S(F)` with `r = 0`; `1_{O^×} ∈ S(F)` with `r = 1`.
- `e^{−πx²} ∈ S(ℝ)` and `e^{−2πxx̄} ∈ S(ℂ)`.
- `r′(a)δ₀ = δ₀` for all `a ∈ F^×`.
- The constant function 1 on F is not in `S(F)`: its support is not compact (finite place) and it does not decay `(ℝ)`.

(Source: Mathlib `SchwartzMap`, `TemperedDistribution` and continuous duals; SmoothRepresentationsOfLocalGroups SR.1.1, locally constant compactly supported functions.)

*Needs:* **SmoothRepresentationsOfLocalGroups**, SR.1; Mathlib `SchwartzMap`; Mathlib `TemperedDistribution`; Mathlib `TemperedDistribution.delta`; [Local constancy of the Fourier transform](#locally-constant-transform).


<a id="finite-schwartz-period-level"></a>

**Finite-place Schwartz levels.** A locally constant compactly supported complex function on a nonarchimedean local field is supported in `P^(−M)` and invariant under translation by `P^N` for some integers M,N. Thus it is a finite linear combination of coset indicators on `P^(−M)/P^N`, where `N≥−M`.

Work under the following hypotheses. Import SR.1’s generic carrier; the ambient group is an actual local field, not an arbitrary LCA group.

**Checks.**

- The indicator of O has O as a period subgroup.
- The indicator of `P^m` is invariant under `P^m`.
- A nonzero constant function on a noncompact local field is locally constant but has no compact support lattice.

(Source: SmoothRepresentationsOfLocalGroups SR.1.1 and compactness; a finite cover by constancy cosets supplies a common open period subgroup.)

*Needs:* [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); [Fourier transform of a coset indicator](#coset-transform); [The trace annihilator of a fractional ideal](#fractional-ideal-annihilator).


<a id="finite-fourier-inversion"></a>

**Finite-place Schwartz Fourier inversion.** The Fourier transform carries SR.1’s finite-place Schwartz carrier into itself and its square is `f(x)↦f(−x)`, with the self-dual Haar. For the positive kernel use `F⁺f(x)=F⁻f(−x)` where `F⁻` is the native transform with the same `ψ`.

Work under the following hypotheses. Every function has a finite coset decomposition; the actual integrals are integrable.

**Checks.**

- The zero finite quotient gives the identity transform.
- On the two-element quotient the constant vector transforms to a multiple of the zero-frequency indicator.
- On a cyclic quotient of odd order the double same-sign transform reflects a delta at a nonzero element.

(Source: Mathlib `ZMod.dft` and finite character orthogonality, applied to the finite quotient determined by a support lattice and a period lattice.)

*Needs:* [Finite-place Schwartz levels](#finite-schwartz-period-level); [Self-dual local additive Haar measure](#self-dual-haar); [Fourier inversion for a subgroup indicator](#indicator-inversion); [Fourier transform of a coset indicator](#coset-transform).


<a id="archimedean-fourier-comparison"></a>

**Archimedean Schwartz Fourier comparison.** At R use native SchwartzMap Fourier with the positive source transform `F⁺f(ξ)=F⁻f(−ξ)`. At C identify `C≃R²` and the trace pairing `Tr(zw)=2(Re z Re w−Im z Im w)`; with self-dual2dxdy, `F⁺` preserves SchwartzMap and `F⁺²f(x)=f(−x)`. The Gaussian `exp(−2π|z|²)` is fixed by this transform.

Work under the following hypotheses. The complex absolute value for Tate is|z|²; the native Euclidean norm remains|z|. The trace pairing differs from the Hermitian inner product.

**Checks.**

- The real Gaussian `exp(−πx²)` is fixed by the positive transform.
- The complex trace Gaussian `exp(−2π
- z
- ²)` is fixed with measure `2 dxdy`.
- Using only dxdy over ℂ halves its transformed value and fails the normalization.

(Source: Mathlib `SchwartzMap.fourierTransformCLM`, `fourierIntegral_gaussian` and Fourier inversion; the real-linear trace pairing and its Jacobian give the complex comparison.)

*Needs:* Mathlib `SchwartzMap.fourierTransformCLM`; Mathlib `fourierIntegral_gaussian`; [Self-dual local additive Haar measure](#self-dual-haar).


<a id="local-fourier-inversion"></a>

**Local Fourier transform, self-dual measure and inversion on `S(F)`.** Fix a continuous nontrivial additive character `ψ` of F and use the supplied duality `y ↦ (x ↦ ψ(xy))` and unique self-dual Haar measure dx. Compare the local-factor transform with that scalar Fourier normalization: for `f ∈ S(F), f̂(x) = ∫_F f(y)ψ(xy)dy` lies in `S(F)`, the map `f ↦ f̂` is a linear isomorphism, and `f̂̂(x) = f(−x)`. For `β ∈ F^×` and `ψ_β(x) = ψ(βx)`, use the supplied measure scaling `|β|^{1/2}dx` and prove that the `ψ_β`-transform of f is `|β|^{1/2}r(β)f̂`. For F nonarchimedean the conductor `ν(ψ)` is the largest `ν` with `ψ` trivial on `P^{−ν}`. Extend the comparison to distributions by `⟨λ̂, f⟩ = ⟨λ, f̂⟩`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. Kudla's convention `ψ(x) = e(x) = e^{2πix}` on `ℝ` and `e(x + x̄)` on `ℂ` (3.30) has positive sign; Mathlib's `𝓕` uses `e^{−2πi⟨x, w⟩}`, so `f̂_Kudla(x) = 𝓕f(−x)` at `ℝ`, and at `ℂ one` also rescales by 2 through the trace pairing.

**Checks.**

- At an unramified finite place, the standard character and `μ(O)=1` give `f̂=1_O` for `f=1_O`.
- At `F=ℂ`, the standard trace character and `2 dxdy` fix `exp(−2π|z|²)` under the positive transform.
- For `β=ϖ` at a finite place, the character change gives `q^(−1/2)r(ϖ)f̂`; the factor is the square root of the additive Jacobian.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**, scalar self-duality; the finite Fourier-level comparison and Mathlib Schwartz inversion give the local-factor adapter. Definition and sign convention: [Kudla](#ref-kudla2004), §3, Fourier transforms, p.122.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, scalar duality and self-dual measure; [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); [Fourier transform of a subgroup indicator](#indicator-transform); [Fourier transform of a coset indicator](#coset-transform); [Fourier inversion for a subgroup indicator](#indicator-inversion); Mathlib `SchwartzMap.fourierTransformCLM`; Mathlib `fourierIntegral_gaussian`; Mathlib `Real.fourierChar`; [Finite-place Schwartz Fourier inversion](#finite-fourier-inversion); [Archimedean Schwartz Fourier comparison](#archimedean-fourier-comparison); [Self-dual local additive Haar measure](#self-dual-haar); [Self-duality of a local additive group](#local-additive-self-duality).


<a id="point-supported-distributions"></a>

**Tempered distributions supported at a point.** Let `E = ℝⁿ`. A tempered distribution `λ ∈ 𝓢′(E, ℂ)` with `dsupport λ ⊆ {0}` is a finite linear combination `Σ_{|α|≤N} c_α ∂^αδ₀`. For `n = 1 (F = ℝ)` the `F^×`-finite ones are `⊕_k ℂ·D^kδ₀`; for `n = 2` written in `x, x̄ (F = ℂ)` they are `⊕_{k,l} ℂ·D^kD̄^lδ₀, D = ∂/∂x, D̄ = ∂/∂x̄`.

`AL0.pointSupported_finiteJet` states the equivalent vanishing-jet property in every finite real dimension: each point-supported tempered distribution vanishes on all Schwartz functions whose derivatives through some finite order vanish at zero.

Work under the following hypotheses. `E = ℝⁿ` with Mathlib's `𝓢(E, ℂ), 𝓢′(E, ℂ) = TemperedDistribution` and dsupport.

**Checks.**

- Evaluation at zero depends only on the zeroth jet.
- The first derivative of evaluation depends on the first jet and is not a multiple of evaluation.
- Empty distributional support forces the zero distribution, which satisfies the finite-jet property.

(Source: Mathlib `Distribution.dsupport` and `SchwartzMap` seminorms; a shrinking cutoff and finite Taylor expansion give the finite-jet factorization, and its dual gives the derivatives of evaluation.)

*Needs:* [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); Mathlib `TemperedDistribution`; Mathlib `TemperedDistribution.delta`; Mathlib `Distribution.dsupport`; Mathlib `SchwartzMap`.


<a id="schwartz-parameter-domination"></a>

**Domination for Schwartz parameter integrals.** A holomorphic Schwartz-valued family bounded in the relevant Schwartz seminorms on every compact parameter set gives locally uniform integrable bounds for its Mellin or Fourier parameter derivatives in the stated convergence strip. Hence integration and parameter differentiation commute there. For Mellin families, endpoint power exponents must leave a strict margin around the compact s-set.

Work under the following hypotheses. Use native SchwartzMap on finite-dimensional real spaces; a mere pointwise holomorphic family is insufficient.

(Source: [Jacquet](#ref-jacquetarch), §2, pp.5–6, analytic families; §3, pp.15–20, compact-parameter estimates.)

*Needs:* Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; Mathlib `mellin_differentiableAt_of_isBigO_rpow`; [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space).


### Adelic Schwartz spaces, Poisson summation and partial transforms


<a id="adelic-schwartz-bruhat-space"></a>

*Consumed contract: the adelic Schwartz–Bruhat space `S(𝔸)` and its standard functions.* Consume **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, for this carrier, its restricted/completed tensor API and its self-dual Fourier transform. The following notation refers to those supplied objects. `S(𝔸_K)` is the locally convex inductive limit over finite-place compact-open support/period levels of `SchwartzMap(K_∞,ℂ)` tensor the corresponding finite-dimensional spaces of finite-adelic functions. Equivalently the archimedean tensor product is completed; finite linear combinations of products of one-place functions are dense. They need not exhaust `S(𝔸_K)` when several archimedean places occur. Distinguished finite-place tensors are `1_{O_v}` almost everywhere. The supplied Fourier transform is continuous on this space. Restricted tensor distributions extend continuously from these dense products. The vector-space comparison below proves the additional compact-uniform estimates for Schwartz functions.

Work under the following hypotheses. k a number field; `𝔸` its adele ring with the restricted-product topology; `ψ = ∏_v ψ_v` a nontrivial character of `𝔸` trivial on k.

Consume the carrier and tensor/Fourier API with the following interface notation.

- `S(𝔸)` is the locally convex inductive limit of finite-place support/period levels tensored with `SchwartzMap(K∞,ℂ)`; the archimedean tensor factors are completed.
- The factorizable function `⊗_v f_v`, given `f_v ∈ S(k_v)` with `f_v = f_v^o` outside a finite set.
- `(⊗ f_v)(x) = ∏_v f_v(x_v)`, a finite product for each x.
- The global transform of `⊗ f_v` is `⊗ f̂_v`.
- Finite linear combinations of one-place factorizable functions are dense in `S(𝔸)`; no algebraic spanning equality is asserted when several archimedean factors occur.

**Checks.**

- `f^o = ⊗_{v<∞} 1_{O_v} ⊗ ⊗_{v|∞}` Gaussian lies in `S(𝔸)`.
- For `k = ℚ` and `f = 1_Ẑ ⊗ e^{−πx²}, Σ_{ξ∈ℚ} f(tξ) = Σ_{n∈ℤ} e^{−πt²n²}` for `t > 0`.
- If one local factor `f_v` is 0, then `⊗f_v = 0`.
- The product `∏_p 1_{pℤ_p}` is not in `S(𝔸)`: infinitely many factors differ from `f_p^o`, and it is the indicator of the compact but not open set `∏_p pℤ_p ⊂ 𝔸_f`, so it is not locally constant.

(Source: ArithmeticGaloisRepresentations §2.7, **Global inputs**; [Kudla](#ref-kudla2004), §4, p.125, Schwartz-space definition and tensor conventions.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**; [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); **AdelicAlgebraicGroups**, AA.0; Mathlib `SchwartzMap`; Tau Ceti **GlobalNumberFields**, layer 5 full adeles and the additive quotient; **AdelicAlgebraicGroups**, §0.2, *restricted-haar-product*; **AdelicAlgebraicGroups**, §0.3, Fubini for restricted product measures.


<a id="adelic-poisson-summation"></a>

**Vector-space Poisson comparison and compact-uniform estimates.** Consume **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**, for restricted-product adelic self-duality, the diagonal self-annihilator, covolume one, Poisson summation and its dilated identity. Their scalar formulas are recalled here to fix the normalization. Let k be a number field and `ψ` a nontrivial character of `𝔸/k` with the self-dual measure on `𝔸`. (i) The annihilator of k in `𝔸` under `(x, y) ↦ ψ(xy)` is k, and `𝔸/k` has volume 1. (ii) Poisson: if f is continuous and integrable, the net `Σ_{ξ∈E}|f(x + ξ)|` over finite `E⊂k` converges uniformly on every compact subset of `𝔸`, and `Σ_{ξ∈k}|f̂(ξ)|<∞`, then `Σ_{ξ∈k} f̂(ξ) = Σ_{ξ∈k} f(ξ)`. The periodisation is continuous and k-periodic, hence descends to `𝔸/k`; integrate over a relatively compact fundamental domain using the same compact-uniform convergence. (iii) For `f ∈ S(𝔸)` and every idele `𝔞, (1/|𝔞|) Σ_{ξ∈k} f̂(ξ/𝔞) = Σ_{ξ∈k} f(𝔞ξ)`.

For each `n≥1`, use the supplied scalar space to form `S(𝔸^n)`, with completed archimedean tensor factors, the coordinate pairing `Σ_i x_i y_i` and product self-dual measure. Prove the coordinatewise Fourier and Poisson identities, reflection under the double transform and covolume one for `k^n`. The `n=1` identity is the supplied scalar theorem. Prove continuity, integrability and joint compact-uniform absolute periodisation for f and f̂ on `S(𝔸^n)`, extending from finite-place levels and archimedean Schwartz seminorms: the sum is over `k^n`, translations lie in compact `C⊂𝔸^n` and coordinatewise idele dilations lie in compact `B⊂𝔸×`. The dilated Poisson identity has Jacobian `|a|^(−n)`, so `Σ_ξ f(aξ)=|a|^(−n)Σ_ξ f̂(ξ/a)`. For `n=1` also prove the weighted scalar idele bound below; higher-rank Mellin bounds retain the exponent ns and the nonzero-vector hypotheses of the mirabolic target.

Work under the following hypotheses. Let `f∈S(𝔸^n)` with `n≥1`. For `h=f,f̂`, prove integrability and compact-uniform convergence of the finite-subset nets `Σ_{ξ∈E}|h(a(x+ξ))|` on every `B×C`, with B and C as above. For `n=1`, also prove that `a↦|h(a)||a|^σ` is integrable on `𝔸×` for every real `σ>1`. Thus the absolute dual sum in Poisson is finite after every idele dilation. Compact-uniform convergence uses fixed finite subsets of `K^n` on each `B×C`; only the limit is periodic. Weighted bounds with strict exponent margins justify parameter differentiation in the Mellin convergence half-plane.

**Checks.**

- For `n=2` and a product of two scalar standard functions, the coordinate transform and Poisson sum are the products of the supplied scalar identities. A completed Schwartz function need not be a single pure tensor.
- For `n=1` the comparison is exactly the supplied scalar transform and Poisson theorem, including its measure and positive-kernel convention.
- For `k=ℚ`, the adele with real component `1/2` and all finite components zero pairs to `−1` with diagonal 1, so is outside `ℚ⊥`. For an idele b the pairing `ψ(bxy)` has diagonal annihilator `b⁻¹k`; the equality `k⊥=k` uses the supplied diagonal-trivial character.
- For `k=ℚ` and `f=1_Ẑ⊗e^(−πx∞²)`, periodisation converges absolutely and uniformly on each compact set; on the real slice with finite component zero it is `Σ_{n∈ℤ}e^(−π(x+n)²)`, uniformly for x in any compact interval.
- The same fixed-subset net fails to converge uniformly on all `𝔸`. For any finite `E⊂ℚ`, take an integer n∉E and `x=−n` diagonally; the omitted `ξ=n` term is `f(0)=1`. Already the real slice and finite `E⊂ℤ` have this obstruction.
- On that real slice, the sums `Σ_{n∈ℤ}e^(−πa²(x+n)²)` converge absolutely and uniformly for `a∈[r,R], 0<r≤R`, and x in a compact set. Their value at `x=0` gives the theta Riemann–Roch identity under `a↦a⁻¹`; allowing `a→0` would destroy this uniform bound.

(Source: Godement–Jacquet, *Global Theory*, pp.136–184, vector-space Poisson summation and Schwartz estimates; ArithmeticGaloisRepresentations §2.7, **Global inputs**, for the scalar Fourier/Poisson identities.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7 **Global inputs**; [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); **AdelicAlgebraicGroups**, AA.0; Mathlib `Real.tsum_exp_neg_mul_int_sq`; Tau Ceti **GlobalNumberFields**, layer 5 full adeles and the additive quotient; Tau Ceti **RepresentationTheory/CompactGroups**, layer 6 characters of compact groups; [Self-duality of a local additive group](#local-additive-self-duality); **AdelicAlgebraicGroups**, §0.2, *restricted-haar-product*.


<a id="partial-fourier-transform"></a>

**Partial Fourier transformation.** For a product `X×V` and an admitted Schwartz function `Φ`, define `F_V⁺Φ(x,w)=∫_VΦ(x,v)ψ(B(v,w))dv` with the `ψ`-self-dual measure. The transform acts only in V and preserves the appropriate Schwartz carrier. On a product `f⊗g it` is `f⊗F⁺g`.

Work under the following hypotheses. X is a finite-dimensional local vector space for the carrier comparison; applications on an affine variety use the supplied Schwartz realization, not a newly invented intrinsic carrier.

Require the following API.

- `F_V(f⊗g)=f⊗Fg`.
- `F_V²Φ(x,v)=Φ(x,−v)`.
- Transforms in two disjoint factors commute.
- `F_V⁺Φ(x,w)=F_V⁻Φ(x,−w)`.

**Checks.**

- A Gaussian in V leaves the factor `f(x)` unchanged.
- In dimension0 the partial transform is the identity with point mass1.
- A nonconstant `f(x)` is not Fourier transformed when only V is selected.

(Source: [Zhang](#ref-zhang2021), §§11.1–11.2, printed p.933 (physical p.71), Fourier action and its partial transform.)

*Needs:* [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space).


### Bessel transforms


<a id="bessel-k"></a>

**The K-Bessel kernel.** Use the positive-argument kernel of **AutomorphicFormsOnReductiveGroups**, §4.5. For `c>0` and `ν∈ℂ`, identify its cosh integral with the half-integral adapter `AL0.BesselK`: `K_ν(c) = (1/2)∫₀∞ exp(−c(u+u⁻¹)/2) exp(ν log u) du/u = ∫₀∞ exp(−c cosh t) cosh(νt) dt`. Both integrals converge absolutely. The substitution `u=exp(t)` gives a half-integral over all real t; pairing t with `−t` gives the supplied kernel. Use the ordinary real logarithm on positive u; the function at `c≤0` is outside this interface. Argument differentiation, the Fourier ODE, decay and the half-order value are supplied by §4.5; the order-variable holomorphy and derivatives below are proved for this adapter.

Work under the following hypotheses. c is a positive real number; integration is with respect to Lebesgue measure on `(0,∞)`.

Require the following API.

- For `c>0`, the half-integral converges absolutely and the adapter equals the supplied cosh integral.
- Transport the supplied symmetry to the adapter: `K_{−ν}(c)=K_ν(c)`.
- `ν↦K_ν(c)` is entire, and its j-th derivative inserts `(log u)^j` in the half-integral.
- Transport the supplied half-order value: `K_{1/2}(c)=sqrt(π/(2c)) exp(−c)`.

**Checks.**

- `K_{1/2}(1)=sqrt(π/2)/e`.
- `K_{−1/2}(2)=K_{1/2}(2)=sqrt(π/4)e⁻²`.
- `K_0(c)>0` for `c>0`, including `c=1`.
- The integral diverges at `c=0, ν=0`: the positivity restriction cannot be dropped.

(Source: [Zhang](#ref-zhang2021), §12.3, p.942, definition preceding Lemma 12.3.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §4.5, positive-argument cosh Bessel kernel, symmetry, argument derivatives, Fourier ODE, decay and half-order value; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; Mathlib `mellin_differentiableAt_of_isBigO_rpow`; Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`.


<a id="bessel-half-order-derivative"></a>

**The half-order derivative of K.** For `c>0, ∂_νK_ν(c)|_{ν=1/2}=−sqrt(π/2) exp(c)c^(−1/2) Ei(−2c)`, where `Ei(−r)=−∫ᵣ∞ exp(−t)dt/t` for `r>0`.

Work under the following hypotheses. `c>0`; both integrals use real Lebesgue measure.

The real-valued function `AL0.negativeEi` has body `−∫_{t>r}exp(−t)/t dt`;
the analytic statements require `r>0`. Prove negativity, derivative `exp(−r)/r`
and limit zero as `r→∞`. The theorem `AL0.BesselHalfOrderDerivative` states
the displayed order derivative.

**Checks.**

- At `r=1` the value is strictly negative, whereas reversing the leading sign gives a positive value.
- At `r=2` its derivative is `exp(−2)/2`, which distinguishes differentiation in r from differentiation in `−r`.
- Its limit at `+∞` is zero; adding a nonzero integration constant violates this normalization.


(Source: [Zhang](#ref-zhang2021), §12.3, p.943, last display in the proof of Lemma 12.3.)

*Needs:* [The K-Bessel kernel](#bessel-k); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.


<a id="bessel-laplace-mellin"></a>

**The Bessel–Laplace Mellin identity.** For `m>0` and real t with `0<t<Re(s)`, the integral of `y^(s−1/2)K_(t+1/2)(2πmy)exp(−2πmy)` over `y>0` is `sqrt(π)Γ(s+t+1)Γ(s−t)/(Γ(s+1)(4πm)^(s+1/2))`. Both sides extend holomorphically to `t=0` for `Re(s)>0`. The theorem `AL0.BesselLaplaceMellin` states the displayed identity.

Work under the following hypotheses. Complex power uses the real logarithm of positive y and4πm; t may be complex in the continued neighbourhood of0.

(Source: [Gross–Zagier](#ref-grosszagier1986), IV §6, proof of Proposition(6.2), unnumbered displayed integral, printed p.299 (physical p.76).)

*Needs:* [The K-Bessel kernel](#bessel-k); [Domination for Schwartz parameter integrals](#schwartz-parameter-domination); Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`.


### Examples

For Z/4 with counting measure, the native negative transform of the indicator of {1} at frequency 1 is `−i`. For Z/2 the double counting-measure transform is `2f(−x)`; the self-dual normalization removes the factor 2. Over `ℂ`, the Gaussian `exp(−2π|z|²)` has Lebesgue integral 1/2, so its self-dual mass is 1 with 2 dxdy.

### Dependencies

Mathlib character, Fourier, measure, Schwartz and distribution APIs; GlobalNumberFields layers 0 and 5–6; LocalFieldsRamification layer 3; AdelicAlgebraicGroups §§0.1–0.4; SmoothRepresentationsOfLocalGroups SR.1.1.


## Layer AL.1: Local eigendistributions and Hecke L-functions

The local eigendistribution and factor interfaces specialize the matrix-level local theory.
The global rank-one analytic contract is [Hecke continuation and functional equation](#hecke-l-functional-equation),
the scalar `n=1` corollary of AL.2's [global Godement–Jacquet theorem](#global-godement-jacquet).
It includes every unitary idele-class character, norm twists, residues and the Hecke normalization comparison.


### Quasi-characters and eigen-distribution spaces


<a id="local-quasicharacter-conductor"></a>

**Local quasi-characters, unramified characters and the conductor exponent.** A quasi-character of `F^×` is a continuous homomorphism `ω` : `F^× → ℂ^×`; it is a character if `|ω| = 1`. There is a unique real `σ` (the exponent) with `|ω(x)| = |x|^σ`, so `ω = ω_u·ω_σ` with `ω_u` a character. For F nonarchimedean, `ω` is unramified if `ω` is trivial on `O^×`; the unramified quasi-characters are exactly `x ↦ t^{ord x} = |x|^s` with `t = q^{−s} ∈ ℂ^×, s` determined modulo `2πi/log q`. For ramified `ω` the conductor exponent `c(ω)` is the smallest integer `c ≥ 1` with `ω` trivial on `1 + P^c`; put `c(ω) = 0` for unramified `ω`. For `F = ℝ` every quasi-character is `ωω_s` with `ω(x) = x^{−a}, a ∈ {0, 1}` (Kudla (3.18)); for `F = ℂ it` is `ωω_s` with `ω(x) = x^{−a}x̄^{−b}, a, b ∈ ℤ, min(a, b) = 0` (Kudla (3.20)). Use the attained `ClassFieldTheory.characterConductorExp` supplied by **ClassFieldTheory**, layer 7, as this integer; its arithmetic construction is supplied there.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. The archimedean normal forms are Kudla's (after Weil); they differ from the common `sgn^a` normalisation: `sgn(x) = x^{−1}|x|`, so `sgn = x^{−1}·ω_1`.

Require the following API.

- The real `σ` with `|ω(x)| = |x|^σ`.
- `ω_s(x) = |x|^s`.
- At finite places, unramified means `ω` trivial on `O^×`, expressed by Mathlib as `O^× ≤ MonoidHom.ker ω`.
- `ω` unramified iff `ω = ω_s` for some s, unique modulo `2πi/log q`.
- `c(ωω_s) = c(ω)`.
- At `ℝ, ℂ`: `ω = x^{−a}(x̄^{−b})·ω_s` with the stated constraints, uniquely.

**Checks.**

- `ω_s` is unramified with `c = 0`, and `ω_s(ϖ) = q^{−s}`.
- For p odd and `χ` a primitive Dirichlet character `mod p^n`, the induced `ω` on `ℚ_p^× (ω(p) = 1)` has `c(ω) = n`.
- At `ℝ, sgn = x^{−1}·ω_1`: `a = 1` and `s = 1` in (3.18).
- The trivial character has exponent 0 and conductor 0.
- The Teichmüller-type character of `ℤ_p^×` (p odd) extended by `ω(p) = 1` is ramified with conductor 1, although it is trivial on `1 + pℤ_p`.

Use the native continuous-homomorphism carrier `ContinuousMonoidHom Fˣ ℂˣ` without a second quasi-character type.
For the norm-power construction, a positive continuous homomorphism
`a:Fˣ→ℝˣ` and `s∈ℂ` determine a continuous homomorphism `Fˣ→ℂˣ` with value `exp(s log(a(x)))`.
Here a is the normalized local absolute value in the arithmetic specialization.


(Source: ClassFieldTheory layer 7, `characterConductorExp` and `unitFiltration_characterConductorExp_le_ker`; norm characters are trivial on the unit filtration.)

*Needs:* Mathlib `ContinuousMonoidHom`; [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); Tau Ceti **ClassFieldTheory**, layer 7 the absolute local artin map its normalizations and conductors; Tau Ceti **GlobalNumberFields**, layer 0 places completions and the product formula; Tau Ceti **GlobalNumberFields**, layer 10 archimedean characters infinity types and cyclotomic arithmetic.


<a id="local-zeta-integral"></a>

**The local Tate zeta integral `z(s, ω; f)`.** For a character `ω` of `F^×, s ∈ ℂ` with `Re s > 0` and `f ∈ S(F), z(s, ω; f) = ∫_{F^×} f(x)ω(x)|x|^s d^×x` converges absolutely (Kudla (3.3)); `s ↦ z(s, ω; f)` is holomorphic on `Re s > 0`, and `f ↦ z(s, ω; f)` is a nonzero element `z(s, ω) ∈ S′(ωω_s)`. In Tate's notation, `ζ(f, c) = ∫ f(α)c(α)d^×α` for quasi-characters c of exponent `> 0`, and `z(s, ω; f) = ζ(f, ωω_s)`. The integral satisfies `z(s, ωω_t; f) = z(s + t, ω; f)` and `z(s, ω; r(a)f) = (ωω_s)(a)^{−1}z(s, ω; f)`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. Measures as in Kudla: at a finite place `d^×x` gives `O^×` volume 1; at `ℝ` and `ℂ, d^×x = |x|^{−1}dx` with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives `O^×` the volume `N𝔡^{−1/2}`. Rescaling `d^×x` by `c>0` rescales z and `z₀=z/L` by c, since L is fixed. It leaves `ε` and `γ` unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by `c^(−1)`. `ω` unitary; the quasi-character case is the twist `ω_t`.

Require the following API.

- `z(s, ω; f) = ∫_{F^×} f(x)ω(x)|x|^s d^×x`.
- Absolute convergence for `Re s > 0`.
- `s ↦ z(s, ω; f)` is holomorphic on `Re s > 0`.
- `z(s, ωω_t; f) = z(s + t, ω; f)`.
- `z(s, ω; r(a)f) = (ωω_s)(a)^{−1} z(s, ω; f)`.
- `z(s, ω) ∈ S′(ωω_s)`, linear in f.
- For `c>0, z_(c d×x)(s,ω;f)=c z_(d×x)(s,ω;f)`, hence `z₀_(c d×x)=c z₀_(d×x)` with L fixed.

**Checks.**

- `ω(ϖ) = t`: `z(s, ω; 1_O) = (1 − tq^{−s})^{−1}`.
- `z(s, 1; e^{−πx²}) = Complex.Gammaℝ s` at `ℝ`.
- `z(s, 1; e^{−2πxx̄}) = (2π)^{1−s}Γ(s) = π·Complex.Gammaℂ s` at `ℂ` (twice-Lebesgue dx).
- `ω` ramified: `z(s, ω; 1_O) = 0`, since `∫_{O^×} ω d^×x = 0` on every annulus.
- `ω = 1, f = 1_O, s = 0`: `Σ_{n≥0} q^{−n·0}` diverges, so the half-plane `Re s > 0` is sharp.
- Doubling the multiplicative measure doubles z/L. It does not leave this normalized distribution fixed; halving f restores its standard value.

Construct the zeta functional from a complex vector space V,
a linear inclusion `ι:V→(G→ℂ)`, a measure `μ` on the measurable carrier G, and integrability
of `ι(f)(x)ω(x)a(x)^s` for every f; its output is a complex linear functional `V→ℂ` with
the displayed integral as value. At infinity the target also proves continuity for the
Schwartz topology. Integrability is an explicit input to this linear construction.


(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.3.2 (2.3), pp.5–6, specialized to rank one. Integral definition and measure convention only: [Tate](#ref-tate1950), §2.4, Definition 2.4.1, physical p.16; [Kudla](#ref-kudla2004), §3, Zeta integrals, p.117.)

*Needs:* [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor); [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); **AdelicAlgebraicGroups**, AA.0; Mathlib `Complex.Gammaℝ`; Mathlib `Complex.Gammaℂ`; Mathlib `Complex.integral_cpow_mul_exp_neg_mul_Ioi`; Mathlib `mellin`.


<a id="eigendistribution-space"></a>

**The spaces `S′(ω)` of `ω`-eigendistributions.** For a quasi-character `ω` of `F^×, S′(ω) = {λ ∈ S(F)′ : r′(a)λ = ω(a)λ for all a ∈ F^×}` . Restriction along `C_c^∞(F^×) ⊂ S(F)` gives an exact sequence `0 → S′(ω)₀ → S′(ω) → C_c^∞(F^×)′(ω)` (3.2), where `S′(ω)₀` is the space of `ω`-eigendistributions supported at 0 (vanishing on `C_c^∞(F^×)`); here `C_c^∞(F^×)` means locally constant compactly supported functions at a finite place.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. At `ℝ, ℂ, C_c^∞(F^×) ⊂ 𝓢(F, ℂ)` consists of smooth functions with compact support in `F^×`.

Require the following API.

- `S′(ω)` as a submodule of `S(F)′`.
- `λ ∈ S′(ω) ↔ ∀ a, r′(a)λ = ω(a)λ`.
- `S′(ω)₀`: eigendistributions vanishing on `C_c^∞(F^×)`.
- The left exact sequence (3.2).
- `z(s, ω) ∈ S′(ωω_s)` for `Re s > 0`.

**Checks.**

- `δ₀ ∈ S′(1)`.
- `f ↦ ∫ f(x)ω(x)d^×x` on `C_c^∞(F^×)` is an `ω`-eigendistribution.
- For `ω ≠ 1, δ₀ ∉ S′(ω)`, since `r′(a)δ₀ = δ₀`.
- `z(s, ω) ∈ S′(ωω_s)` for `Re s > 0`: its eigencharacter is `ωω_s`, not `ω`.

For the algebraic specialization, use a group action
`ρ:G→End_ℂ(V)` and a character `ω:G→ℂˣ` to construct the submodule of V's linear dual
cut out by `ℓ(ρ(a⁻¹)v)=ω(a)ℓ(v)` for every a,v. Given `U⊆V`, the intended
`S′(ω)₀` is its intersection with the annihilator of U.
For the local analytic statement U is the punctured compactly supported test space;
the archimedean version uses the continuous dual. On a native real or complex
field F, `TateZeta.archimedeanEigenSpace` is the submodule of
`TemperedDistribution F ℂ` satisfying `T(f∘e_a)=χ(a)T(f)`, where
`e_a : F ≃L[ℝ] F` is inverse scalar multiplication and χ is a continuous
quasi-character of `Fˣ`. The pullback `e_a(x)=a⁻¹x` is the real linear homeomorphism
`TateZeta.inverseScalar a`. The theorem `TateZeta.archimedeanEigenSpace.finrank`
states that every such eigenline has complex dimension one.


(Source: Mathlib continuous linear duals and `Submodule`; the eigencondition defines a linear subspace, and restriction has kernel the annihilator of the punctured test space.)

*Needs:* [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor).


<a id="restriction-to-punctured-line"></a>

**Eigendistributions on `C_c^∞(F^×)` are multiples of `ω(x)d^×x`.** The space `C_c^∞(F^×)′(ω)` of `ω`-eigendistributions on `C_c^∞(F^×)` is one-dimensional, spanned by `ω(x)d^×x`. Hence for `λ ∈ S′(ω)` there is `c ∈ ℂ` with `⟨λ, f⟩ = c∫_{F^×} f(x)ω(x)d^×x` for all f with compact support in `F^×`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`.

**Checks.**

- The trivial character gives multiplicative Haar integration on punctured tests.
- Rescaling multiplicative Haar measure changes the generator but preserves its line.
- Evaluation at zero restricts to zero, so restriction on the full Schwartz dual is not injective.

(Source: Mathlib `MeasureTheory.Measure.IsHaarMeasure` and uniqueness of invariant Haar functionals; multiplication by the character identifies the eigencondition with invariance on the multiplicative group.)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); Mathlib `MeasureTheory.Measure.IsHaarMeasure`.


<a id="eigendistributions-supported-at-zero"></a>

**Eigendistributions supported at 0.** (i) F nonarchimedean: the distributions supported at 0 are `ℂ·δ₀`, and `δ₀ ∈ S′(ω₀)` for the trivial `ω₀`; `S′(ω)₀ = 0` for `ω ≠ ω₀`. (ii) `F = ℝ, D = d/dx`: the `F^×`-finite distributions supported at 0 are `⊕_{k≥0} ℂ·D^kδ₀`, and `S′(ω)₀ = ℂ·D^kδ₀` if `ω(x) = x^{−k}, 0` otherwise. (iii) `F = ℂ, D = ∂/∂x, D̄ = ∂/∂x̄`: they are `⊕_{k,l≥0} ℂ·D^kD̄^lδ₀`, and `S′(ω)₀ = ℂ·D^kD̄^lδ₀` if `ω(x) = x^{−k}x̄^{−l}, 0` otherwise.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. In (ii), (iii) only `F^×`-finite distributions are classified (Kudla footnote 8).

**Checks.**

- At a finite place evaluation at zero has trivial eigencharacter.
- Over ℝ its first derivative has inverse scalar character `a↦a⁻¹`.
- Over ℂ the holomorphic and antiholomorphic first jets have distinct characters on nonreal scalars.

(Source: The point-supported finite-jet theorem above; scalar pullback acts diagonally on Taylor monomials, giving the stated inverse monomial characters on their dual jets.)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Tempered distributions supported at a point](#point-supported-distributions).


### Local normal forms, uniqueness and the exceptional extension


<a id="unramified-local-theory"></a>

**Unramified local theory: `z(s, ω) = L(s, ω)z₀(s, ω)`.** Let F be nonarchimedean and `ω` unramified with `ω(ϖ) = t`; use `L(s, ω) = (1 − tq^{−s})^{−1}`. Consume ArithmeticGaloisRepresentations §2.7, [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), `finiteStandardEvaluation`, for the integrals of `f_ω=q^(ν/2)1_O` and its Fourier transform in Tate's measures. With Kudla's unit-volume multiplicative measure this is the evaluation of `f^o=1_O`. For `τ = [1] − [ϖ^{−1}] ∈ ℤ[F^×]` and `f ∈ S(F), r(τ)f = f − r(ϖ^{−1})f` has compact support in `F^×`, so prove that `⟨z₀(s, ω), f⟩ = ∫_{F^×}(r(τ)f)(x)ωω_s(x)d^×x` (3.5) is entire in s and `z₀(s, ω) ∈ S′(ωω_s)`. When `‖tq^(−s)‖<1`, equivalently `Re(s)>log‖t‖/log q, z(s, ω) = L(s, ω)z₀(s, ω)` (3.6); this identity continues the distribution meromorphically to `ℂ`. For unitary `ω` the convergence region is `Re(s)>0`. The supplied standard evaluation gives `⟨z₀(s, ω), f^o⟩ = 1` for all s (3.8); deduce that `z₀(s, ω)` is never zero, `z(s, ω; f)/L(s, ω)` is entire for every f, and for each s the vector `f^o` makes it nonzero: `L(s, ω)` is the greatest common denominator of the zeta integrals (3.9).

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. Measures as in Kudla: at a finite place `d^×x` gives `O^×` volume 1; at `ℝ` and `ℂ, d^×x = |x|^{−1}dx` with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives `O^×` the volume `N𝔡^{−1/2}`. Rescaling `d^×x` by `c>0` rescales z and `z₀=z/L` by c, since L is fixed. It leaves `ε` and `γ` unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by `c^(−1)`.

**Checks.**

- For `ν=0`, the supplied vector is `1_O` and its normalized distribution value is 1.
- For `ν=1`, Tate's integral of the unscaled `1_O` is `q^(−1/2)L(s,ω)`; the vector `q^(1/2)1_O` has normalized value 1. Dropping this scaling loses the different.
- For `ω=1` at `s=0`, the unnormalized distribution has a pole, while `z₀(0,1)=δ₀` with Kudla's measure and still evaluates to 1 on `1_O`.

(Source: ArithmeticGaloisRepresentations §2.7, **Standard-test-function evaluations**; summing valuation shells gives the geometric denominator, and the difference operator removes the tail near zero.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7, **Standard-test-function evaluations**, `finiteStandardEvaluation`; [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); Mathlib `tsum_geometric_of_norm_lt_one`.


<a id="invariant-distributions-exceptional-case"></a>

**The invariant distributions: `S′(ω₀)` is one-dimensional.** At a finite place, the `F^×`-invariant distributions `S′(ω₀)` form the line `ℂ·δ₀`, although (3.11) only bounds the dimension by 2. The distribution `⟨λ₀, f⟩ = ⟨d^×x, f − f(0)f^o⟩` (3.12) is an `O^×`-invariant preimage of `d^×x` with `⟨λ₀, f^o⟩ = 0`, and `r′(ϖ)λ₀ = λ₀ − δ₀` (3.13). So `F^×` acts on the span of `δ₀, λ₀` through `x ↦ [[1, −ord x], [0, 1]]` (3.14), a non-semisimple representation whose invariants are `ℂ·δ₀`; `d^×x` does not extend to an `F^×`-invariant distribution on `S(F)`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. `f^o = 1_O`; the matrix (3.14) is written in the ordered basis `(δ₀, λ₀)`.

**Checks.**

- Evaluation at zero is fixed by the unipotent matrix.
- The regularized Haar lift changes by minus evaluation under a uniformizer.
- Inverting the uniformizer changes the off-diagonal entry to plus one, distinguishing the extension from two trivial lines.

(Source: The punctured Haar-functional and point-support classifications above; translating the regularized shell sum by a uniformizer gives the displayed nontrivial unipotent extension.)

*Needs:* [Eigendistributions supported at 0](#eigendistributions-supported-at-zero); [Eigendistributions on `C_c^∞(F^×)` are multiples of ω(x)d^×x](#restriction-to-punctured-line); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory).


<a id="ramified-local-theory"></a>

**Ramified local theory: `z(s, ω)` is entire and `L(s, ω) = 1`.** Let F be nonarchimedean and `ω` ramified with conductor c. Consume ArithmeticGaloisRepresentations §2.7, [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), `finiteStandardEvaluation`, for `f_ω=q^(ν/2)ω⁻¹1_(O×)`, its integral 1 and its Fourier evaluation in Tate's measures. For `f ∈ S(F), ∫_{F^× − P^n} f(x)ωω_s(x)d^×x` is independent of n for n large; prove that this defines an entire distribution family and that `z₀(s, ω) := z(s, ω)` is a basis vector of `S′(ωω_s)` for every s (3.15), with `L(s, ω) = 1` (3.16). The supplied evaluation becomes `⟨z₀(s, ω), f^o⟩ = 1` for `f^o = ω⁻¹1_(O×)` in Kudla's measure (3.17), giving the gcd property (3.9).

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. Measures as in Kudla: at a finite place `d^×x` gives `O^×` volume 1; at `ℝ` and `ℂ, d^×x = |x|^{−1}dx` with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives `O^×` the volume `N𝔡^{−1/2}`. Rescaling `d^×x` by `c>0` rescales z and `z₀=z/L` by c, since L is fixed. It leaves `ε` and `γ` unchanged when both sides use the same rescaling and the additive Fourier measure is fixed. A standard test vector with z₀-value1 must then be rescaled by `c^(−1)`.

**Checks.**

- At `ν=1`, the unscaled unit-supported function has Tate integral `q^(−1/2)`; its supplied `q^(1/2)` multiple has value 1 for every s.
- Over `ℚ₃`, the quadratic unit character with `ω(3)=1` and the standard negative finite additive character has `c=1, ν=0` and Fourier-transformed standard vector supported on `3⁻¹ℤ₃×`, with central epsilon `−i`. The original vector is supported on `ℤ₃×`.
- For `f=1_(P^n)`, unit-character orthogonality makes the continued distribution value zero for every s; for the standard vector it is 1. Thus the family is nonzero without a pole or a nonzero value on every test vector.

(Source: ArithmeticGaloisRepresentations §2.7, **Standard-test-function evaluations**; unit-character orthogonality cancels the sufficiently small shells, making the remaining sum entire.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7, **Standard-test-function evaluations**, `finiteStandardEvaluation`; [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Eigendistributions on `C_c^∞(F^×)` are multiples of ω(x)d^×x](#restriction-to-punctured-line); [Eigendistributions supported at 0](#eigendistributions-supported-at-zero); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor).


<a id="archimedean-local-theory"></a>

**Archimedean local theory: `Γ`-factors and the standard functions.** Consume ArithmeticGaloisRepresentations §2.7, [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`, for the scalar integrals and Fourier transforms of the standard functions. In Kudla's real normal form `ω(x)=x^(−a)`, `a∈{0,1}`, the supplier's norm exponent is `t=−a`, giving `L(s,ω)=Γ_ℝ(s)` and `f^o=x^a exp(−πx²)` (3.19). In his complex normal form `ω(z)=z^(−a)z̄^(−b)`, `a,b∈ℕ, min(a,b)=0`, the supplier's angular weight is `k=b−a` and norm exponent is `t=−(a+b)/2`, giving `L(s,ω)=πΓ_ℂ(s)` and `f^o=z^a z̄^b exp(−2πzz̄)` (3.21). Tate and Kudla use the same archimedean measures `dx/|x|` and `2 dx dy/|z|_ℂ`; Kudla's complex vector and factor are π times the supplied vector and canonical factor, so `z₀,Kudla=π⁻¹z₀,canonical`. Thus `⟨z₀(s,ω),f^o⟩=1` is the supplied scalar evaluation in these normalizations.

Prove that `z₀(s,ω):=L(s,ω)⁻¹z(s,ω)` extends to an entire distribution family and is a basis vector of `S′(ωω_s)` for every s. Prove that `z(s,ω)` has simple distribution poles exactly at the poles of L: over `ℝ` at `s=−r`, `r∈2ℤ_{≥0}`, with residue a nonzero multiple of `D^(a+r)δ₀`; over `ℂ` at `s=−r`, `r∈ℤ_{≥0}`, with residue a nonzero multiple of `D^(a+r)D̄^(b+r)δ₀`. At a pole the constant Laurent coefficient extends `ωω_(−r)(x)d^×x` to `S(F)` but is not an element of `S′(ωω_(−r))`.

Work under the following hypotheses. F is `ℝ` with its usual absolute value or `ℂ` with `|z|_ℂ=zz̄`, and `ω_s(x)=|x|^s`. Use the displayed normal forms, the positive standard Fourier character and its self-dual additive measure. All archimedean quasi-characters are covered by norm twists of these forms. Kudla's factors do not depend on a or b because those exponents are included in the norm shift. For a general Schwartz input the initial absolutely convergent region is `Re(s)>a` over `ℝ` and `Re(s)>(a+b)/2` over `ℂ`. The special `f_a` or `f_{a,b}` has its own convergence region `Re(s)>0`; this does not improve convergence for every Schwartz input.

**Checks.**

- Over `ℝ`, `a=1` uses the supplier's `t=−1`, so its standard integral is `Γ_ℝ(s)` and Fourier eigenvalue is i; the distribution's residue at `s=0` is a nonzero multiple of `Dδ₀`.
- Over `ℂ`, `a=b=0, s=1` gives integral 1 on Kudla's Gaussian and `Γ_ℂ(1)=1/π` on the supplied `π⁻¹` Gaussian. Their normalized distribution values are both 1 in their respective factor conventions.
- Over `ℂ`, angular weight `k=1` uses `a=0,b=1` and `t=−1/2`; replacing the supplied `π⁻¹z̄ exp(−2πzz̄)` by `π⁻¹z exp(−2πzz̄)` makes its integral zero by angular integration.
- Over `ℝ`, a Schwartz function nonzero at 0 in the `a=1` normal form requires `Re(s)>1` for absolute convergence; the supplied special function's cancellation does not give a distribution integral on all inputs in `Re(s)>0`.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §§2.3.2 and 2.4.2–2.4.3, pp.5–7, rank-one factors; ArithmeticGaloisRepresentations §2.7, **Standard-test-function evaluations**. Subtracting Taylor jets near zero gives the distribution continuation and residues.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7, **Standard-test-function evaluations**, `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`; [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Eigendistributions on `C_c^∞(F^×)` are multiples of ω(x)d^×x](#restriction-to-punctured-line); [Eigendistributions supported at 0](#eigendistributions-supported-at-zero); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor); Mathlib `Complex.Gammaℝ`; Mathlib `Complex.Gammaℂ`; Mathlib `Complex.Gammaℝ_mul_Gammaℝ_add_one`; [Tempered distributions supported at a point](#point-supported-distributions); [Domination for Schwartz parameter integrals](#schwartz-parameter-domination).


<a id="local-uniqueness-theorem"></a>

**Local uniqueness: `dim S′(ω) = 1`.** For every quasi-character `ω` of `F^×`, the space `S′(ω)` of `ω`-eigendistributions on `S(F)` is one-dimensional. Writing `ω = ω′ω_s` with `ω′` a character (or an archimedean normal form), it is spanned by `z₀(s, ω′)`.

The statements `TateZeta.finiteEigenSpace_finrank` and
`TateZeta.archimedeanEigenSpace.finrank` give this dimension on the native
locally constant compactly supported and tempered-distribution carriers, respectively.
The definitions `TateZeta.finiteSchwartzSpace`, `TateZeta.finitePullback` and
`TateZeta.finiteEigenSpace` use the compactly supported submodule of native
`LocallyConstant F ℂ`, its inverse scalar pullback and its algebraic dual.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`.

**Checks.**

- At a finite place the trivial eigenline is evaluation at zero.
- For the real character `a↦a⁻¹`, the resonant eigenline is the first derivative of evaluation.
- The regularized punctured Haar lift at a resonant character has a nonzero scaling defect and gives no second eigenvector.

(Source: The punctured eigenline, point-supported jet classification and exceptional extension above; the normalized local families supply a nonzero line, and the extension obstruction excludes a second eigenvector at a resonant character.)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Eigendistributions on `C_c^∞(F^×)` are multiples of ω(x)d^×x](#restriction-to-punctured-line); [Eigendistributions supported at 0](#eigendistributions-supported-at-zero); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [The invariant distributions: S′(ω₀) is one-dimensional](#invariant-distributions-exceptional-case); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory).


<a id="fourier-transform-eigendistribution"></a>

**The Fourier transform of an `ω`-eigendistribution.** If `λ ∈ S′(ω)`, then `λ̂ ∈ S′(ω^{−1}ω₁)`, where `ω₁(x) = |x|` and `⟨λ̂, f⟩ = ⟨λ, f̂⟩`. Consequently `ẑ₀(s, ω)` is a multiple of `z₀(1 − s, ω^{−1})`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. f̂ is taken with the self-dual measure for a fixed nontrivial `ψ`.

**Checks.**

- The Fourier transform of evaluation at zero is additive Haar with absolute-value eigencharacter.
- Transforming additive Haar gives evaluation at zero and the trivial eigencharacter.
- The transform of a unitary eigencharacter includes the absolute-value factor and need not be unitary.

(Source: Mathlib `SchwartzMap.fourierTransformCLM`; changing variables in scalar pullback gives the inverse character and the absolute-value Jacobian.)

*Needs:* [The spaces S′(ω) of ω-eigendistributions](#eigendistribution-space); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); [Local uniqueness: dim S′(ω) = 1](#local-uniqueness-theorem).


### Local epsilon factors and Gauss sums


<a id="local-epsilon-gamma-factors"></a>

**The local `ε-` and `γ`-factors `ε(s, ω, ψ)` and `γ(s, ω, ψ)`.** For a character `ω`, a nontrivial `ψ` and the self-dual `dx, ε(s, ω, ψ) ∈ ℂ^×` is the unique constant with `ẑ₀(1 − s, ω^{−1}) = ε(s, ω, ψ)z₀(s, ω)` (3.23), and `γ(s, ω, ψ) = ε(s, ω, ψ)L(1 − s, ω^{−1})/L(s, ω)` (3.26). Properties: `ε(s, ω, ψ) = ⟨z₀(1 − s, ω^{−1}), f̂^o⟩` for the standard `f^o` (3.27); `ε(s, ωω_t, ψ) = ε(s + t, ω, ψ)` (3.28); `ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ)` (3.29); `ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1)`; `|ε(1/2, ω, ψ)| = 1`. Tate's factor is `ρ(ωω_s) = 1/γ(s, ω, ψ)` (for `ψ = e^{2πiΛ}`).

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. `ω` a character; archimedean `ω` in Kudla's normal form; `L(1 − s, ω^{−1})` is read after rewriting `ω^{−1}` in normal form times `ω_t`. The norm identity at1/2 assumes `ω` unitary. General quasi-character identities are obtained by twists; the assertion of unit norm is not made for all twists.

Require the following API.

- `ε(s, ω, ψ) ∈ ℂ^×`, characterized by (3.23); at finite places it is an adapter to ArithmeticGaloisRepresentations §2.7's canonical scalar.
- for every finite completion, continuous quasi-character `ω`, nontrivial continuous `ψ` and `s∈ℂ`, prove `ε(s,ω,ψ)=tateLocalConstant(ω·|·|^s,ψ,dx_ψ)`. Identify the Circle-valued and complex-valued additive characters by the native inclusion. Both sides use the positive Tate Fourier kernel, the conductor convention `ψ` trivial on `P^(−ν)` but not `P^(−ν−1)`, and the same self-dual measure. The equality holds for all s, including points where an unnormalized L-factor has a pole. It is independent of higher-rank local Langlands or any supplied ramified parameter comparison. Use ArithmeticGaloisRepresentations §2.7's `finiteStandardEvaluation` on the nonzero normalized eigenline and transport by norm twisting; clients receive the canonical supplied scalar. When a Weil character is introduced use `Art_F=artinMap^(−1)`, sending a uniformizer to geometric Frobenius, as in that supplier.
- `γ(s, ω, ψ) = ε L(1 − s, ω^{−1})/L(s, ω)`, meromorphic in s.
- (3.27): `ε = ⟨z₀(1 − s, ω^{−1}), f̂^o⟩`.
- (3.28): `ε(s, ωω_t, ψ) = ε(s + t, ω, ψ)`.
- (3.29): `ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ)`.
- `ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1)`.
- `|ε(1/2, ω, ψ)| = 1`.

The planned names cited by ClassicalArithmeticCompletion map to this target as follows: TateZeta.epsilonFactor is `ε(s, ω, ψ)`, with finite values the supplied `tateLocalConstant`; TateZeta.epsilonFactor_smul_char is (3.29); TateZeta.epsilonFactor_mul_inv is `ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1)`; TateZeta.epsilonFactor_unramified_zero is the unramified Check below; TateZeta.epsilonFactor_real_sign is the Check `F = ℝ, ω = x^{−1}, ψ = e`, where `ε = i`.

**Checks.**

- `ω` unramified, `ν(ψ) = 0`: `ε(s, ω, ψ) = 1`, as `f̂^o = f^o`.
- `F = ℝ, ω = x^{−1}, ψ = e`: `ε = i` and `γ(s, x^{−1}, e) = iΓ_ℝ(3 − s)/Γ_ℝ(s) (ω^{−1} = x = x^{−1}ω₂)`.
- `F = ℝ, ω = 1, ψ = e`: `1/γ(s) = Γ_ℝ(s)/Γ_ℝ(1 − s) = Complex.Gammaℂ s · cos(πs/2)`.
- `ε(s, ω_t, ψ) = ε(s + t, 1, ψ)` with the same `ψ`.
- `ε` is not independent of `ψ`: at a finite place `ε(s, 1, ψ_ϖ) = q^{1/2−s}ε(s, 1, ψ)` by (3.29).
- For ramified `ω` with `c=1` and `ψ` of `ν=1`, the local supplier identification gives `ω(ϖ²)q^(1−2s)𝔤(ω,ψ)`, retaining both conductors. Over `ℚ₃` take `ω(3)=1`, its unit character the nontrivial quadratic residue character, and `ψ(x)=ψ₀(3x)` with `ψ₀` the standard negative finite character. Then `𝔤=−i` and both scalars equal `−i·3^(1−2s)`; at `s=0` they are `−3i`. Omitting `ν` instead gives `−i√3`.

**Checks for the gamma formula.** For `γ(s)=ε(s)L_dual(1−s)/L(s)`, if both L-values are 1 it gives `ε(s)`; at `ε=2,L=3,L_dual=5 it`
gives 10/3 rather than 6/5; for a real trivial constituent its gamma quotient
is `Γ_R(1−s)/Γ_R(s)`, the inverse of Tate's rho quotient at regular points.


(Source: ArithmeticGaloisRepresentations §2.7, **Arithmetic character constants** and **Standard-test-function evaluations**; the rank-one Godement–Jacquet equation identifies the analytic scalar. Local-integral constant convention only: [Kudla](#ref-kudla2004), §3 (3.23)–(3.26), p.123.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7, [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum) and **Standard-test-function evaluations**, `finiteStandardEvaluation`, for the canonical finite-place scalar and the standard-vector comparison; [Local uniqueness: dim S′(ω) = 1](#local-uniqueness-theorem); [The Fourier transform of an ω-eigendistribution](#fourier-transform-eigendistribution); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion).


<a id="rank-one-local-functional-equation"></a>

**Rank-one local zeta integral and functional equation.** Let F be a nonarchimedean local field or one of `ℝ,ℂ`, let `χ=ω|·|^t` be a continuous quasi-character of `F×` with ω unitary and `t∈ℂ`, and let `f∈S(F)`. Use the normalized absolute value, a nontrivial continuous additive character ψ, its self-dual additive measure `dx_ψ` and a fixed multiplicative Haar measure on both sides. The integral `localZetaIntegral(f,χ,s)=∫_(F×) f(x)χ(x)|x|^s d×x` is the same local Tate zeta integral defined above; it converges absolutely for `Re(s)>−Re(t)` and continues meromorphically. It is exactly [The Godement–Jacquet zeta integral](#godement-jacquet-integral) with `n=1`, `β=χ` and `Φ=f`. Specialize [The Godement–Jacquet functional equation](#godement-jacquet-functional-equation) to obtain `localZetaIntegral_functionalEquation`:

`Z(f̂,χ⁻¹,1−s)=γ(s,χ,ψ)Z(f,χ,s)`, where `γ(s,χ,ψ)=ε(s,χ,ψ)L(1−s,χ⁻¹)/L(s,χ)`.

The transform uses the positive Tate kernel `ψ(xy)` and `dx_ψ`. These are identities of meromorphic germs, including at poles; the quotients `Z/L` are entire. At finite completions of number fields, the standard-vector comparison identifies `ε(s,χ,ψ)` with ArithmeticGaloisRepresentations §2.7's [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum), `tateLocalConstant(χ|·|^s,ψ,dx_ψ)`, and therefore identifies γ with that constant times the displayed L-ratio. Evaluate the normalized matrix equation on the supplied standard vector, whose original normalized value is 1, using [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations). This comparison is independent of higher-rank local Langlands. The local integral and equation are specializations of the matrix theory; the eigendistribution and scalar-normalization APIs below refine that same equation.

The theorems `TateZeta.localZetaIntegral_functionalEquation` and `TateZeta.archimedeanLocalFunctionalEquation` state meromorphic continuation and the local equation. The nonarchimedean statement works on `IsNonarchimedeanLocalField` and `ContinuousMonoidHom` carriers; the archimedean statement uses native `SchwartzMap` on a real or complex field. One nonzero meromorphic γ serves every locally constant compactly supported test function. For a character of norm exponent r, the two continuations agree with their absolutely integrable formulas on `Re(s)>−r` and `Re(s)>r`, respectively, and their reflected equation holds as an equality of meromorphic germs. The common integral domain is `0<Re(s)+r<1`. The modulus `a:F→ℝ` is specified by its scaling of additive Haar measure on every measurable set. Any additive Haar normalization is allowed; γ scales with that measure. With the self-dual measure it agrees with the displayed normalized γ. At number-field completions, identifying epsilon with the supplier's `tateLocalConstant`, and hence γ with the displayed L-ratio, uses the local-field standard vectors. The definition `TateZeta.localZetaIntegral` uses the native multiplicative carrier.

**Checks.**

- Unramified χ at a finite place with `ν(ψ)=0` gives `ε=1`, `L(s,χ)=(1−χ(ϖ)q^(−s))⁻¹` and the geometric-series equation for `1_O` with unit-volume-one multiplicative measure. With Tate's measure and general ν use `q^(ν/2)1_O` and `ε=χ(ϖ^ν)q^((1/2−s)ν)`.
- For the quadratic unit character over `ℚ₃` with `χ(3)=1` and the standard negative finite character, `c=1,ν=0`, `L=1` and `ε=−i·3^(1/2−s)`. Replacing ψ by `ψ(3·)` gives `ν=1` and `ε=−i·3^(1−2s)`, retaining both conductors.
- At `ℝ`, `χ=sgn^a|·|^t` has `L(s,χ)=Γ_ℝ(s+t+a)` and `ε=i^a`; at `ℂ`, angular weight k gives `Γ_ℂ(s+t+|k|/2)` and `ε=i^|k|`. Use the supplied conjugate-angular standard vectors and their `π⁻¹` normalization over `ℂ`.
- For `χ=1,f=1_O,ν=0`, the integral diverges at `s=0` while its continuation has a pole; the equation there is an identity of germs rather than of totalized integral values. The continued equation retains this pole without assigning a divergent integral a finite value.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.3.2 (2.3), pp.5–6 and §2.4.4 (2.15), p.7, with transpose trivial in rank one; ArithmeticGaloisRepresentations §2.7, **Standard-test-function evaluations**, for normalization.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral), [Convergence of the matrix zeta integral](#godement-jacquet-convergence), [The standard local L-factor](#standard-local-l-factor) and [The Godement–Jacquet functional equation](#godement-jacquet-functional-equation) at `n=1`; [The local Tate zeta integral](#local-zeta-integral) for its sharp convergence half-plane; **ArithmeticGaloisRepresentations**, §2.7, **Arithmetic character constants** and **Standard-test-function evaluations**.


<a id="local-functional-equation"></a>

**Distribution form of the rank-one local functional equation.** This is the distribution form of [Rank-one local zeta integral and functional equation](#rank-one-local-functional-equation), obtained from AL.2 at `n=1`. For every `f ∈ S(F)`, as meromorphic functions of `s, z(1 − s, ω^{−1}; f̂) = γ(s, ω, ψ)z(s, ω; f)` (3.25); equivalently `z(1 − s, ω^{−1}; f̂)/L(1 − s, ω^{−1}) = ε(s, ω, ψ)·z(s, ω; f)/L(s, ω)` (3.24), both sides entire.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. `ω` unitary, with quasi-characters included by norm twists; f̂ for `ψ` with the self-dual measure.

**Checks.**

- For an unramified finite-place character and conductor-zero ψ, the standard indicator has `Z/L=1` and `ε=1`.
- For a ramified finite-place character, `L=1` and the unit-supported standard vector gives the normalized Gauss-sum scalar.
- The real odd Gaussian gives `ε=i`; the complex conjugate-angular vector of weight k gives `ε=i^|k|` with the canonical gamma factor.

(Source: The rank-one Godement–Jacquet equation above and its normalized-distribution comparison; ArithmeticGaloisRepresentations §2.7, **Arithmetic character constants**, identifies the finite-place epsilon scalar.)

*Needs:* [Rank-one local zeta integral and functional equation](#rank-one-local-functional-equation); [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors); [The local Tate zeta integral z(s, ω; f)](#local-zeta-integral); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion).


<a id="local-gauss-sum"></a>

**The local Gauss sum `𝔤(ω, ψ)`.** Use the normalized Gauss integral of ArithmeticGaloisRepresentations §2.7 in the finite scalar comparison; its distribution-theoretic Fourier and support identities are constructed here. For F nonarchimedean, `ω` ramified with conductor c and `ψ` of conductor `ν, 𝔤(ω, ψ) = q^{(ν+c)/2}∫_{O^×} ω^{−1}(y)ψ(ϖ^{−ν−c}y)dy` with dy self-dual for `ψ`. Then the transform of the standard function `f^o = ω^{−1}1_{O^×}` is `f̂^o(x) = 𝔤(ω, ψ)q^{−(ν+c)/2}·conj(f^o(ϖ^{ν+c}x))` (3.31), vanishing unless `ord x = −ν − c`; and `𝔤(ω, ψ)·conj(𝔤(ω, ψ)) = 1`. The product `ω(ϖ^{ν+c})𝔤(ω, ψ)` does not depend on the choice of `ϖ`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. `ω` a character (unitary), ramified.

Require the following API.

- `𝔤(ω, ψ) = q^{(ν+c)/2}∫_{O^×}ω^{−1}(y)ψ(ϖ^{−ν−c}y)dy`.
- (3.31): `f̂^o(x) = 𝔤 q^{−(ν+c)/2} conj(f^o(ϖ^{ν+c}x))`.
- `𝔤(ω, ψ)·conj 𝔤(ω, ψ) = 1`.
- `ω(ϖ^{ν+c})𝔤(ω, ψ)` is independent of `ϖ`.
- For `c = 1 it` is `q^{−1/2}` times Mathlib's gaussSum of the residue characters.

**Checks.**

- `F = ℚ_p, c = 1, ν = 0`: `𝔤 = p^{−1/2}·gaussSum(χ^{−1}, ψ₁)` with `χ = ω|_{ℤ_p^×}` on `𝔽_p^×` and `ψ₁(a) = ψ(a/p)`.
- `|𝔤(ω, ψ)| = 1`, recovering `|gaussSum| = √p` for `c = 1`.
- `f̂^o(x) = 0` whenever `ord x ≠ −ν − c`.
- With `ϖ^(−ν−c+1)` the integral vanishes. For `c>1` use the last nontrivial principal-unit quotient; for `c=1` the additive phase is constant on `O×` and the nontrivial residue character sums to0.

**Checks for the scalar integral.** An empty integration set gives zero. As a finite
algebraic check over `𝔽₂` with counting measure, `U={1}, ϖ=1, q=2, ν=0, c=1`,
`ω=1` and the nontrivial additive character give `−sqrt(2)`. This check fixes the
prefactor and phase of the scalar formula; the norm-one theorem uses the genuine
local-field unit group and ramified-character hypotheses stated above.


(Source: ArithmeticGaloisRepresentations §2.7, **Arithmetic character constants**, **Standard-test-function evaluations** and the local Gauss-sum normalization; comparison by evaluation on the nonzero normalized eigenline.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7, [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum), for the shared normalized Gauss integral; [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); Mathlib `gaussSum`; Mathlib `gaussSum_mul_gaussSum_eq_card`.


<a id="explicit-epsilon-factors"></a>

**Explicit local `ε`-factors.** Compare the normalized-distribution scalar with ArithmeticGaloisRepresentations §2.7, [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations): `finiteStandardEvaluation` and `tateLocalConstant` supply the finite formulas, while `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex` supply the archimedean values. Use their standard-vector evaluations and local uniqueness to identify their scalars with the action on the full eigenline. The real measures agree; the complex vector and factor both differ by π in Kudla's convention, leaving epsilon unchanged. (i) F nonarchimedean, `ω` unramified, `ν(ψ) = ν`: `ε(s, ω, ψ) = ω(ϖ^ν)q^{(1/2−s)ν}`. (ii) `ω` ramified with conductor c: `ε(s, ω, ψ) = ω(ϖ^{ν+c})q^{(1/2−s)(ν+c)}𝔤(ω, ψ)`. Identify these formulas with the normalized-distribution epsilon scalar. (iii) `F = ℝ, ω(x) = x^{−a}, a ∈ {0, 1}, ψ = e`: the supplied `t=−a` evaluation gives `ε(s, ω, ψ) = i^a`. (iv) `F = ℂ, ω(z) = z^(−a)z̄^(−b), a,b∈ℕ, min(a,b)=0, ψ=e(z+z̄)`: the supplied `k=b−a, t=−(a+b)/2` evaluation gives `ε(s,ω,ψ)=i^|k|=i^max(a,b)`. In Tate's normalisation (`ψ` with conductor `𝔡^{−1}`, so `ν = ord 𝔡`), the supplied finite formulas give `ρ(|·|^s) = N𝔡^{s−1/2}(1 − q^{s−1})/(1 − q^{−s})` and `ρ(c|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(c)` for ramified c with conductor `𝔣` and `c(π) = 1`.

Work under the following hypotheses. F is a completion `k_v` of a number field k. Nonarchimedean: ring of integers O, maximal ideal `P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord` : `F^× → ℤ`. Archimedean: `F = ℝ` with the usual `|x|`, or `F = ℂ` with `|x| = x·x̄`. `ω_s(x) = |x|^s`. `ψ` standard at `ℝ, ℂ` as in (3.30); at a finite place (3.28) and (3.29) reduce to `ν = 0` and a fixed `ω`.

**Checks.** An unramified conductor-zero character gives 1; a ramified character with `c=ν=1` gives `ω(ϖ²)q^(1−2s)𝔤`, agreeing with the canonical local comparison; at `ℝ` the odd normal-form constituent gives i; at `ℂ` the trivial constituent gives 1, while both angular weights `k=1` and `k=−1` give i with the conjugate standard vectors specified by the supplier.

(Source: ArithmeticGaloisRepresentations §2.7, **Arithmetic character constants** and **Standard-test-function evaluations**; [Chenevier–Taïbi](#ref-cheneviertaibi2020), §2.1, p.274, footnote 6, for the positive-character archimedean convention; [Humphries, archimedean newforms](#ref-humphriesarch), (2.18), p.8, displays `i^(−κ)` and is not used for the epsilon sign.)

*Needs:* **ArithmeticGaloisRepresentations**, §2.7, [Arithmetic character constants](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum) and **Standard-test-function evaluations**, `finiteStandardEvaluation`, `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`; [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors); [The local Gauss sum 𝔤(ω, ψ)](#local-gauss-sum); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory); [Local quasi-characters, unramified characters and the conductor exponent](#local-quasicharacter-conductor).


### Canonical archimedean factors

<a id="gl2-archimedean-parameter-factors"></a>

**GL₂ parameter coordinates and archimedean factors.** Specialize the semisimple Weil parameters and `recGL` of AutomorphicFormsOnReductiveGroups §2.5 to dimension two. `RealGL2Parameter` has a principal branch, an unordered pair `(a₁,t₁),(a₂,t₂)` representing `sgn^aᵢ|·|^tᵢ`, and a discrete branch `(k,t)` representing `I_(k−1)|·|^t`, with `k≥2`. `ComplexGL2Parameter` is an unordered pair `(κ₁,t₁),(κ₂,t₂)` representing `(z/|z|)^κᵢ|z|_ℂ^tᵢ`. These are coordinates on the supplied parameter classes; the smooth representation is their Langlands quotient. Complex GL₂ has no discrete-series branch.

Expose the real and complex gamma-shift multisets, `twist`, `dual`, `centralExponent`, the angular or parity part of the central character, and `epsilonFactor`. The factors use the canonical positive-character conventions of this section:

| Parameter | Γ_ℝ shifts | Γ_ℂ shifts | Central character | ε |
| --- | --- | --- | --- | --- |
| Real principal | `t₁+a₁, t₂+a₂` | empty | `sgn^(a₁+a₂)|·|^(t₁+t₂)` | `i^a₁ i^a₂` |
| Real discrete `(k,t)` | empty | `t+(k−1)/2` | `sgn^k|·|^(2t)` | `i^k` |
| Complex principal | empty | `t₁+|κ₁|/2, t₂+|κ₂|/2` | `(z/|z|)^(κ₁+κ₂)|z|_ℂ^(t₁+t₂)` | `i^|κ₁| i^|κ₂|` |

Duality negates each norm exponent and each complex angular weight, preserves real parities and the discrete weight, and is involutive. Twisting adds the character's exponent to each constituent and its parity or angular weight to each principal constituent; a real sign twist leaves the discrete parameter class unchanged. Thus a norm twist by u adds `2u` to `centralExponent`. Prove agreement of the multiset products with the canonical gamma product, independence of ordering, the dual and twist laws, and compatibility with the supplied `recGL`.

`IsGeneric` means that the corresponding irreducible smooth globalization admits a nonzero continuous functional equivariant under the fixed nontrivial upper-unipotent character. It is the supplied Whittaker predicate transported along `recGL`. Discrete parameters are generic. For principal parameters it holds exactly when the associated ordered normalized standard module is irreducible; a reducible standard module's Whittaker functional need not descend to its Langlands quotient. Define `RealGL2Parameter.oddArtin` by `(0,0),(1,0)`, `RealGL2Parameter.trivialArtin` by `(0,0),(0,0)`, and `ComplexGL2Parameter.trivialArtin` by `(0,0),(0,0)`.

**Checks.** The odd real Artin parameter has `Γ_ℝ(s)Γ_ℝ(s+1)=Γ_ℂ(s)` and epsilon i. The trivial real and complex Artin parameters give `Γ_ℝ(s)²` and `Γ_ℂ(s)²`, both with epsilon 1; the trivial real Artin parameter differs from the parameter `|·|^(1/2)⊕|·|^(−1/2)` of the trivial GL₂ representation, whose quotient is nongeneric. Weight two has shift `1/2`, central parity zero and epsilon `−1`. An angular twist from `κ=−1` to `κ=0` changes the absolute-weight shift, so angular twists are not uniform translations of gamma shifts.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §§2.2.2–2.2.4, 2.4.1–2.4.4, pp.4–8; [Chenevier–Taïbi](#ref-cheneviertaibi2020), §2.1, p.274, footnote 6, for the positive-character epsilon convention; Humphries (2.18), p.8, displays negative powers of i and is not used for the epsilon sign; AutomorphicFormsOnReductiveGroups §2.5 for the parameter correspondence.)

*Needs:* [Archimedean GLₙ parameters](#archimedean-gln-parameters); [Archimedean Whittaker comparisons](#archimedean-smooth-representations); [Canonical archimedean factors](#canonical-archimedean-factor); [The archimedean standard epsilon factor](#archimedean-standard-epsilon).


<a id="canonical-archimedean-factor"></a>

**Canonical archimedean factors.** For unitary-normalized characters, `L_R(s,sgn^a|·|^t)=Γ_R(s+t+a), a∈{0,1}`, and `L_C(s,(z/|z|)^κ|·|_C^t)=Γ_C(s+t+|κ|/2)`. For a real discrete-series block `D_k⊗|det|^t` use `Γ_C(s+t+(k−1)/2), k≥2`. General `GL_n` archimedean factors multiply over the imported Weil constituents. Kudla’s complex Gaussian zeta normalization is `πΓ_C`, so its distribution is rescaled to the canonical factor.

Work under the following hypotheses. `Γ_R=π^(−s/2)Γ(s/2)`; `Γ_C=2(2π)^(−s)Γ(s)`; `|z|_C=zz̄`.

Require the following API.

- Real factors are `Γ_R(s+t+a)`.
- Complex factors are `Γ_C(s+t+|κ|/2)`.
- The weight-k block has `Γ_C(s+t+(k−1)/2)`.
- Weil direct sums multiply the gamma factors.

**Checks.**

- `a=t=0` gives `Γ_R(s)`.
- `κ=−3,t=0` gives `Γ_C(s+3/2)`, equal to `κ=3`.
- `D₂` has `Γ_C(s+1/2)`.
- Kudla’s complex Gaussian integral is `πΓ_C(s)`; equating it to `Γ_C(s)` losesπ.

The three gamma formulas multiply over the finite multiset of real, complex and
discrete-series constituents. The empty multiset gives 1 and multiset union multiplies
factors. Their comparison with representations uses the archimedean `GLₙ` parameters.


(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.2–§2.4.3, (2.7), (2.10), (2.13), pp.6–7.)

*Needs:* [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory); [Archimedean GLₙ parameters](#archimedean-gln-parameters).


<a id="archimedean-standard-epsilon"></a>

**The archimedean standard epsilon factor.** For the positive standard Tate character, a real Weil constituent1 has epsilon1, sgn has epsilon i, and `I_w=Ind_(W_C)^(W_R)(z/|z|)^w, w≥1`, has epsilon `i^(w+1)`. A weight-k discrete-series constituent therefore has epsilon `i^k`. Over C an angular character of weightκ has epsilon `i^|κ|`. Direct sums multiply these factors; norm twists do not change these archimedean constants.

For real parity `a∈{0,1}`, the scalar `i^a` is compared with the character epsilon by the real branch of the explicit local theorem.

Work under the following hypotheses. `I_0=1⊕sgn` is reducible and gives epsilon i by multiplication. The convention is the one in Chenevier–Taïbi footnote6; a negative Fourier character requires the central-character(-1) comparison.

**Checks.** Parity zero gives 1; the real sign character has parity one and epsilon i; the split parameter `I_0` has product epsilon `1·i=i`.

(Source: [Chenevier–Taïbi](#ref-cheneviertaibi2020), §2.1 p.274, footnote6 and epsilon formula.)

*Needs:* [Explicit local ε-factors](#explicit-epsilon-factors); [Canonical archimedean factors](#canonical-archimedean-factor); [Archimedean GLₙ parameters](#archimedean-gln-parameters).


### Global distributions and completed Euler products


<a id="global-eigendistributions"></a>

**Factorizable distributions and global uniqueness.** A restricted family of continuous local distributions normalized on almost every standard vector defines a continuous restricted-tensor distribution. A nonzero global `ω`-eigendistribution factors into the local eigenlines and the global eigenline has dimension1. No factorization converse is asserted for arbitrary distributions: a sum of two independent product distributions need not be decomposable.

Work under the following hypotheses. k a number field, `𝔸 = 𝔸_k, 𝔸^×` the ideles with `|x| = ∏|x_v|_v, J = {|x| = 1}`; `ω = ⊗ω_v` a character of `𝔸^×/k^×` (a Hecke character in the sense of GlobalNumberFields Layer 9); `ω_s(x) = |x|^s`.

**Checks.**

- A restricted tensor of normalized local eigenvectors is a global eigenvector.
- Rescaling one local generator rescales the tensor by the same scalar.
- In the unrestricted distribution space a sum of independent product tensors need not factor.

(Source: AutomorphicFormsOnReductiveGroups §§3.4–3.5, restricted-tensor universal maps; local eigenline uniqueness determines each finite-factor restriction, and continuity determines the completed archimedean extension.)

*Needs:* [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [Local uniqueness: dim S′(ω) = 1](#local-uniqueness-theorem); [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory); Tau Ceti **GlobalNumberFields**, layer 9 hecke and ray class characters.


<a id="completed-hecke-l-function"></a>

**Normalization of the supplied completed Hecke function.** Identify the `n=1` standard matrix integral with the unbalanced all-place product using ArithmeticGaloisRepresentations §2.7's [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations). Its [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison) identifies the conductor-balanced form on algebraic norm twists with LFunctions' completion; its [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation) supplies the finite-order equation from LFunctions layer 5. For every unitary idele-class character, the conductor-balanced completion is constructed by [The global standard L-function](#global-godement-jacquet) at `n=1`. Compare these meromorphic germs with the integral continuation of [The global standard L-function](#global-godement-jacquet) at `n=1` by equality in the convergence half-plane. For a unitary character `ω` of `𝔸^×/k^×`, use `Λ(s,ω)=∏_v L_v(s,ω_v)` (4.4) over all places, with canonical archimedean factors; `L^S(s,ω)=∏_(v∉S)L_v(s,ω_v)` for a finite S containing infinity and the ramified places. Both products converge absolutely for `Re(s)>1`; for continuous quasi-characters of norm exponent r use `Re(s)+r>1`. For `S ⊇ S_∞ ∪ {ramified v}, L^S(s, ω) = Σ_{𝔞 prime to S} χ(𝔞)N𝔞^{−s}`, where `χ(𝔭_v) = ω_v(ϖ_v)` is the associated ideal character.

Work under the following hypotheses. k a number field, `𝔸 = 𝔸_k, 𝔸^×` the ideles with `|x| = ∏|x_v|_v, J = {|x| = 1}`; `ω = ⊗ω_v` a unitary character of `𝔸^×/k^×` (a Hecke character in the sense of GlobalNumberFields Layer 9); `ω_s(x) = |x|^s`. A general continuous quasi-character is `χ=ω|·|^t`, with the corresponding variable shift `s↦s+t`.

Use the supplied function through the following product notation and normalization comparisons.

- The unbalanced product `Λ(s, ω) = ∏_v L_v(s, ω_v)` for `Re s > 1`, with its continued germ. On algebraic norm twists this germ is the conductor/variable adapter to the supplied completion, with continuation from AL.2 at `n=1`, identified with the finite-order/algebraic Hecke functions via ArithmeticGaloisRepresentations §2.7's **Finite-order Hecke functional equation** and **Hecke zeta-integral comparison**. For general unitary characters its continuation and equation are AL.2's `n=1` case.
- `L^S(s, ω) = ∏_{v∉S} L_v(s, ω_v)`.
- `L^S(s, ω) = Σ_{(𝔞, S) = 1} χ(𝔞)N𝔞^{−s}` for `Re s > 1`.
- `Λ(s, ω) = ∏_{v∈S}L_v(s, ω_v)·L^S(s, ω)`.
- `Λ(s,ω)=z(s,ω;f^o)` for the supplier's normalized standard vectors: under Tate's measures use the finite scaling `N𝔡_v^(1/2)`, the real vector unchanged and the complex scaling `π⁻¹`. Kudla's unit-volume finite measure uses the unscaled finite vectors. These are comparisons with `finiteStandardEvaluation`, `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`.

**Checks.**

- `k = ℚ, ω = 1`: `Λ(s, 1) = completedRiemannZeta s`.
- `k = ℚ, ω` attached to a primitive Dirichlet character `χ`: `L_∞ = Γ_ℝ(s)` (`χ` even) or `Γ_ℝ(s + 1)` (`χ` odd, `ω_∞ = sgn = x^{−1}ω₁`), which is Mathlib's DirichletCharacter.gammaFactor, and `Λ(s, ω) = gammaFactor χ s · LFunction χ s`.
- `ω = 1`: `L^{S_∞}(s, 1)` is the Dedekind zeta function NumberField.dedekindZeta.
- `Λ(s, ω)` is not `Σ χ(𝔞)N𝔞^{−s}` alone: the archimedean factors and the ramified factors `L_v = 1` are part of it.

**Checks for the partial product.**

- For `ℚ` and the trivial character, removing infinity gives `ζ(s)` in `Re(s)>1`.
- Removing infinity and `p=2` instead gives `(1−2^(−s))ζ(s)`; the factor is a denominator polynomial, not its inverse.
- Removing infinity and both 2 and 3 gives `(1−2^(−s))(1−3^(−s))ζ(s)`, with each prime removed once.


The arithmetic product identities retain their absolute-convergence half-plane and continuation hypotheses.


(Source: ArithmeticGaloisRepresentations §2.7, **Standard-test-function evaluations**, **Hecke zeta-integral comparison** and **Finite-order Hecke functional equation**; ArithmeticDirichletSeries layer 3, absolutely convergent Euler products.)

*Needs:* [The global standard L-function](#global-godement-jacquet) at `n=1`; **ArithmeticGaloisRepresentations**, §2.7, **Standard-test-function evaluations**, **Hecke zeta-integral comparison**, **Finite-order Hecke functional equation** and **Root-number product formula**; [Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)](#unramified-local-theory); [Ramified local theory: z(s, ω) is entire and L(s, ω) = 1](#ramified-local-theory); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory); Tau Ceti **ArithmeticDirichletSeries**, layer 3 local factors and euler products.


<a id="canonical-rank-one-comparison"></a>

**Canonical rank-one comparison.** Let `χ₀` be an algebraic type-A₀ idele-class character over K, with primitive finite conductor `𝔣₀`, and let `χ=χ₀|·|^t, t∈ℂ`. Write `σ` for LFunctions layer 6's ideal-side shift, so `χ₀(ϖ_v)=χ₀,u(ϖ_v)q_v^σ`, and put `A=|D_K|N𝔣₀>0` and `u=s+t−σ`. Use the primitive unitary character `χ₀,u`, real parity at each real place and complex gamma shift `|n_τ−n_τ̄|/2`. On `Re(u)>1` identify the Euler series and gamma factors, giving

`A^(u/2) Λ_AL(s,χ) = Λ_LF(χ₀,s+t) = Λ_LF,unit(χ₀,u)`.

Here `Λ_AL` is the unbalanced all-place product in this roadmap, extended to quasi-characters by `Λ_AL(s,ω|·|^v)=Λ_AL(s+v,ω)`. Consume ArithmeticGaloisRepresentations §2.7's [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison), `heckeZetaIntegral_eq_completedHecke`, and [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation), `finiteOrderHeckeFunctionalEquation`, to identify the `n=1` Godement–Jacquet continuation with the same meromorphic Hecke germs at every point. For any unitary `ω`, define `Λ_H` by conductor balancing the `n=1` [global Godement–Jacquet continuation](#global-godement-jacquet). Then `A^(s/2)Λ_AL(s,ω)=Λ_H(ω,s)`, with `A=|D_K|N𝔣(ω)`; it includes continuous infinity types outside algebraic norm twists. Values agree wherever both representatives are analytic. Multiplication by `A^(u/2)` transports the unbalanced meromorphic germ equation to the balanced one.

For an imprimitive presentation at modulus `𝔪`, multiply the primitive finite series by `∏_{v|𝔪₀, v∤𝔣₀}(1−χ₀,u(ϖ_v)q_v^(−u))`, exactly LFunctions layer 5's Euler correction and layer 6's primitive reduction. Keep A as the primitive conductor, not the presentation modulus. Use the finite-sum identity in §2.7's [Root-number product formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula), `rootNumber_eq_prod_tateLocalConstant`, to identify the epsilon product with the supplied root number by

`ε_AL(s,χ)=W_LF(χ₀) A^(1/2−u)`.

Thus conductor balancing changes the reflected equation to the supplied constant-root-number equation; the inverse character and inverse norm twist are evaluated at `1−s`. Transport the polar divisor under `u=s+t−σ`. These comparisons use the same prime-idele dictionary, Fourier sign and Deligne gamma factors throughout, independently of multiplicative Haar rescaling of z and `z₀`.

**Checks.**

- For every finite-order Hecke character `(σ=t=0)`, the conductor-balanced product, LFunctions' primitive completion and ArithmeticGaloisRepresentations §2.7's scalar completion are the same meromorphic germ, and `A^(s−1/2)ε_AL(s,χ)` is their single root number. This is an identity for the whole family, including its conductor, gamma factors and polar divisor.
- For the trivial character of `ℚ` presented modulo 6, the finite presented series is `(1−2^(−s))(1−3^(−s))ζ(s)`, while `A=1` and the primitive completed function still has its two simple poles. Presentation modulus 6 supplies no conductor power.
- For the odd quadratic character of conductor 4, the unbalanced product is `Γ_R(s+1)L_f(s,χ)`; the supplied completion is `4^(s/2)` times it. The local epsilon product is `4^(1/2−s)`, with root number 1.
- For `χ=|·|^t` over `ℚ, u=s+t` and both completed germs have poles at `−t` and `1−t`. For general `χ₀` the translation uses `u=s+t−σ`, including the sign of `σ`.

(Source: Godement–Jacquet, *Global Theory*, pp.136–184, specialized to `n=1`; LFunctions layers 0, 5–6, completion, primitive reduction and norm-shift conventions; ArithmeticGaloisRepresentations §2.7, **Hecke zeta-integral comparison**, **Finite-order Hecke functional equation** and **Root-number product formula**.)

*Needs:* **LFunctions**, layers 0, 5–6; **ArithmeticGaloisRepresentations**, §2.7; **GlobalNumberFields**, layer 9, the prime-idele/ideal-character dictionary; [Normalization of the supplied completed Hecke function](#completed-hecke-l-function); [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors). The comparison uses [The global standard L-function](#global-godement-jacquet) at `n=1` and the three named Hecke contracts of §2.7; its distribution refinement uses AL.1's local normalized distributions and their restricted tensor product.


### Rank-one specialisation and Hecke comparison

The scalar corollary [Hecke continuation and functional equation](#hecke-l-functional-equation)
specializes AL.2's [global Godement–Jacquet theorem](#global-godement-jacquet) to `n=1`
for every unitary idele-class character. ArithmeticGaloisRepresentations §2.7 supplies
the standard-function evaluations, the finite-order/algebraic Hecke comparison and the
finite-sum root-number product formula. The epsilon comparison below identifies the
local normalized-distribution scalars with that product.


<a id="global-epsilon-factor"></a>

**The normalized-distribution epsilon comparison.** Consume the finite-sum identity in **ArithmeticGaloisRepresentations**, §2.7, [Root-number product formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula), `rootNumber_eq_prod_tateLocalConstant`, and [Standard-test-function evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations), for the product `ε(s,χ)=∏_v ε_v(s,χ_v,ψ_v)` for every continuous quasi-character. The local values are those of `finiteStandardEvaluation`, `archimedeanStandardEvaluation_real` and `archimedeanStandardEvaluation_complex`. Use the supplied root number, additive-character independence and conductor formula; prove its action on the normalized global distribution, `ẑ₀(1−s,χ⁻¹)=ε(s,χ)z₀(s,χ)`, by the restricted tensor product of the local distribution equations. Identify its scalar equation with the `n=1` Godement–Jacquet equation through the canonical rank-one comparison; finite-order/algebraic characters also agree with Hecke's supplied equation. The finite-sum identity supplies no analytic continuation or functional equation. On algebraic norm twists that comparison identifies the product with the supplied LFunctions root number and conductor power. The product is finite since `ε_v=1` at every finite place with unramified `χ_v` and `ν(ψ_v)=0`. For a unitary idele-class character `ω`, the supplied formula is `ε(s,ω)=W_H(ω)(|d_k|N𝔣(ω))^(1/2−s)`, with `𝔣(ω)=∏𝔭_v^c(ω_v)`, `W_H(ω)=ε(1/2,ω)` and `|W_H(ω)|=1`. For `χ=ω|·|^t`, use `ε(s,χ)=ε(s+t,ω)`; the unit norm assertion applies to the unitary character.

Work under the following hypotheses. k a number field, `𝔸 = 𝔸_k, 𝔸^×` the ideles with `|x| = ∏|x_v|_v, J = {|x| = 1}`; `ω = ⊗ω_v` a unitary character of `𝔸^×/k^×` (a Hecke character in the sense of GlobalNumberFields Layer 9); `ω_s(x) = |x|^s`. A general continuous quasi-character is `χ=ω|·|^t`, with the corresponding variable shift `s↦s+t`.

Use the supplied scalar product, character independence and conductor formula in the first four interfaces; the last is the distribution refinement proved here.

- `ε(s, ω) = ∏_v ε_v(s, ω_v, ψ_v)`.
- `ε(s, ω)` is the same for every nontrivial `ψ` trivial on k.
- `ε(s, ω) = ε(1/2, ω)(|d_k|N𝔣(ω))^{1/2−s}`.
- `|ε(1/2, ω)| = 1`.
- (4.7): `ẑ₀(1 − s, ω^{−1}) = ε(s, ω)z₀(s, ω)`.

**Checks.**

- `k = ℚ, ω = 1`: `ε(s, 1) = 1`.
- `k = ℚ, ω` attached to a primitive Dirichlet character of conductor N: `ε(s, ω) = N^{1/2−s}ε(1/2, ω)`, the N-power in Mathlib's `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `ε(1/2, ω)` is the product of the `p | N` Gauss-sum factors and `i^a` at `∞`, identified with rootNumber through the `ω ↔ χ^{±1}` dictionary of GlobalNumberFields Layer 9.
- At `s=1/2`, the quadratic conductor-4 character over `ℚ` has epsilon i at infinity for the positive real Tate character and `−i` at 2 for the negative finite character, giving global product 1. In the zero-extended mod-4 dictionary `χ(1)=1, χ(3)=−1`, the negative-character Gauss sum is `−2i` and its normalized value is `−i`. An everywhere finite-unramified character over `ℚ` has even infinity parity, since its value on diagonal `−1` is 1.
- A single local factor `ε_v(s, ω_v, ψ_v)` does depend on `ψ_v` (3.29); only the product over all places is independent.

The finite-product formula also gives 1 on an empty exceptional set. Two local
values i and `−i` multiply to 1, rather than summing to zero. These scalar checks
pin the product convention independently of the arithmetic conductor calculation.


(Source: ArithmeticGaloisRepresentations §2.7, **Root-number product formula**; Godement–Jacquet, *Global Theory*, pp.136–184, `n=1` local-constant product.)

*Needs:* [The global standard L-function](#global-godement-jacquet) at `n=1`; **ArithmeticGaloisRepresentations**, §2.7, **Standard-test-function evaluations**, **Hecke zeta-integral comparison**, **Finite-order Hecke functional equation** and **Root-number product formula**; [The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)](#local-epsilon-gamma-factors); [Explicit local ε-factors](#explicit-epsilon-factors); [Factorizable distributions and global uniqueness](#global-eigendistributions); [Vector-space Poisson comparison and compact-uniform estimates](#adelic-poisson-summation).


<a id="hecke-l-functional-equation"></a>

**Hecke continuation and functional equation.** For a number field K and every continuous unitary idele-class character `ω`, put `A=|D_K|N𝔣(ω)>0`. Let `Λ(s,ω)=∏_v L_v(s,ω_v)` be the unbalanced product with the canonical Deligne archimedean factors, initially for `Re(s)>1`, and put `Λ_H(ω,s)=A^(s/2)Λ(s,ω)`. As the scalar `n=1` corollary of [The global standard L-function](#global-godement-jacquet), these functions continue meromorphically to `ℂ` and satisfy

`Λ(s,ω)=W_H(ω) A^(1/2−s) Λ(1−s,ω⁻¹)`,

`Λ_H(ω,s)=W_H(ω) Λ_H(ω⁻¹,1−s)`.

Here `W_H(ω)` is the Gauss-sum root number of ArithmeticGaloisRepresentations §2.7's [Root-number product formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula), with `|W_H(ω)|=1`. That finite-sum identity identifies the product of local constants; the analytic continuation and reflected equation come from Godement–Jacquet. The [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison) and [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation) identify the finite-order/algebraic specializations with LFunctions layers 5–6.

The theorem `TateZeta.heckeContinuation` states continuation, convergence on `Re(s)>1`, the conductor-balanced functional equation, entireness away from norm characters, their translated simple poles and complex norm-twist transport on Tau Ceti's native `HeckeCharacter`. The definitions `TateZeta.heckeFiniteFactor`, `TateZeta.heckeArchFactor` and `TateZeta.heckeConductorScale` use its local components, infinity type and primitive conductor. The supplied complex infinity exponent uses `|z|`, so its gamma shift divides that exponent by 2 to express the `|z|_ℂ` convention. The root number's arithmetic identification is the supplied-constant comparison above.

The conductor-balanced `Λ_H` is the canonical unitary Hecke continuation. Any Eisenstein construction agreeing with its full primitive Euler product and archimedean factors on `Re(s)>1` agrees with it as a meromorphic function by uniqueness of continuation, including its pole principal parts. The unbalanced product is recovered by `A^(−s/2)Λ_H`; agreement of scattering ratios alone does not fix this normalization.

The completions are entire unless `ω=|·|^(it)` for a real t. In that case their poles are simple at `−it,1−it`. Complex norm twists of any character translate s and the inverse twist in the reflected equation.

Work under the following hypotheses. Use the continuous idele-class character carrier of GlobalNumberFields layer 9, the standard trace character with positive Fourier kernel and its self-dual additive measure. The scalar matrix integrals use Tate's multiplicative measure: finite unit volume `q_v^(−ν_v/2)`, `dx/|x|` over `ℝ` and `2 dx dy/|z|_ℂ` over `ℂ`, with `dt/t` in the idele-class norm disintegration. Standard vectors have the finite `q_v^(ν_v/2)` and complex `π⁻¹` scalings of ArithmeticGaloisRepresentations §2.7. Interpret the equations as identities of meromorphic germs, and as value identities where the representatives are analytic. Multiplication by `A^(s/2)` transports the unbalanced germ equation to the balanced one.

**Checks.**

- For `K=ℚ, ω=1`, the unbalanced completion is `completedRiemannZeta`, with residues `−1,+1` at `0,1` and reflected equation `Λ(s)=Λ(1−s)`.
- A primitive finite-order character gives the supplied LFunctions completion. For the odd quadratic character of conductor 4 over `ℚ`, `W_H=1` and balancing removes the factor `4^(1/2−s)` from the unbalanced equation.
- For `ω=|·|^(it)`, put `D=|D_K|`. Then `Λ_H(ω,s)=D^(−it/2)Λ_H(1,s+it)` and `W_H(ω)=D^(−it)`, so the poles move to `−it,1−it`.
- For a character nontrivial on `C_K¹`, the completion is entire; nontriviality on the full idele-class group alone does not exclude norm characters.
- Over `K=ℚ(√2)`, let `ε=1+√2` and `r=π/log ε`. The unitary character with infinity component `|x₁/x₂|^(ir)` and ideal value `|α₁/α₂|^(−ir)` on `(α)` is well-defined because `ε^(2ir)=1`; its real gamma shifts are `ir,−ir`. It is neither a pure norm character nor an algebraic character times a complex norm power. Both the matrix-integral and Eisenstein constructions therefore identify the same entire completion in this case.

(Source: Godement–Jacquet, *Global Theory*, pp.136–184, specialized to `n=1`; ArithmeticGaloisRepresentations §2.7, **Standard-test-function evaluations**, **Hecke zeta-integral comparison**, **Finite-order Hecke functional equation** and **Root-number product formula**; Mathlib `NumberField.dedekindZeta_residue_def` and `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.)

*Needs:* [The global standard L-function](#global-godement-jacquet) at `n=1`; [Normalization of the supplied completed Hecke function](#completed-hecke-l-function); [The normalized-distribution epsilon comparison](#global-epsilon-factor); **ArithmeticGaloisRepresentations**, §2.7, the four named contracts above and **Global inputs** with measure disintegration; **GlobalNumberFields**, layers 9–10; Mathlib `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `completedRiemannZeta_one_sub` and `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.


### CM quadratic completion and orbital comparisons


<a id="cm-quadratic-completion"></a>

**The CM quadratic Hecke completion.** For E/F CM quadratic, F totally real of degree g, let `η` be the nontrivial quadratic idele-class character, `Q=|D_F|N(f_η)=|D_E|/|D_F|`. The canonical conductor-balanced completion is `Λ_η(s)=Q^(s/2)Γ_R(s+1)^g L_f(s,η)`, entire of order at most1, with `Λ_η(s)=W_ηΛ_η(1−s), W_η=1`. The unbalanced completion `L_η(s)=Γ_R(s+1)^gL_f(s,η)` satisfies `L_η(s)=Q^(1/2−s)L_η(1−s)`.

Work under the following hypotheses. Use ClassFieldTheory layer 13’s abelian conductor–discriminant formula and its Hecke/character conductor dictionary; the quadratic root number1 follows from the Dedekind zeta quotient.

**Checks.** `E=ℚ(i), F=ℚ` gives `Q=4` and real gamma `Γ_ℝ(s+1)`; `E=ℚ(√−3), F=ℚ` gives `Q=3`; multiplying the unbalanced completion by `Q^(s/2)` cancels the conductor power in the reflected equation and retains root number 1.

(Source: [Thorner–Zaman](#ref-thornerzaman2017), §2, printed p.1141 (physical p.9).)

*Needs:* [Hecke continuation and functional equation](#hecke-l-functional-equation); [Canonical archimedean factors](#canonical-archimedean-factor); **ClassFieldTheory**, layer 13, abelian conductor–discriminant formula and Hecke conductor dictionary.


<a id="cm-logarithmic-gamma-correction"></a>

**The CM gamma logarithmic correction.** For the unbalanced CM completion `L_η=Γ_R(s+1)^gL_f, L_η′(0)/L_η(0)=L_f′(0)/L_f(0)−(g/2)(γ+log(4π))`. Its functional equation gives `L_η′(0)/L_η(0)+L_η′(1)/L_η(1)=−log Q`. Balancing adds (1/2)log Q to each logarithmic derivative.

Work under the following hypotheses. `η` CM quadratic; `L_f(0)` and `L_f(1)` nonzero; `γ` Euler’s constant.

(Source: [Yuan–Zhang](#ref-yuanzhang2018), §7.1 p.590, displayed gamma correction.)

*Needs:* [The CM quadratic Hecke completion](#cm-quadratic-completion); [Canonical archimedean factors](#canonical-archimedean-factor).


<a id="quadratic-orbital-tate-comparison"></a>

**The normalized quadratic orbital Tate comparison.** For the quadratic idele-class character `η` in Zhang, the zero-orbit integrals are `Orb(0+,Φ,s)=Λ(s,η)∏_v Z_v(s,η,Φ_v(·,0))/L_v(s,η)` and `Orb(0−,Φ,s)=Λ(−s,η)∏_v Z_v(−s,η,Φ_v(0,·))/L_v(−s,η)`. Each normalized local integral is entire and equals1 at unramified standard data.

Work under the following hypotheses. Use Zhang’s stated local measures and L-factors. The second orbit has−s from inversion, not s; `η=η^(−1)`.

(Source: [Zhang](#ref-zhang2021), §12.5 pp.946–947 (12.15)–(12.19).)

*Needs:* [The global standard L-function](#global-godement-jacquet) at `n=1`; [Normalization of the supplied completed Hecke function](#completed-hecke-l-function); [Local uniqueness: dim S′(ω) = 1](#local-uniqueness-theorem).


### Examples

For `ℚ`, the standard finite indicators and real Gaussian give completedRiemannZeta, epsilon factor 1. Over `ℂ`, the same trace Gaussian gives `πΓ_C`, while a weight-two real discrete-series block gives `Γ_C(s+1/2)`. These two computations distinguish multiplicative measure conversion from the discrete-series shift.

### Dependencies

AL.0; ArithmeticGaloisRepresentations §2.7 **Global inputs**; LFunctions layers 0, 5–6; GlobalNumberFields layers 9–10; ClassFieldTheory layers 7 and 13 (conductor–discriminant and Hecke conductor dictionary); AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3; the archimedean representation/parameter and restricted tensor prerequisites here.


## Layer AL.2: Godement–Jacquet standard functions


### Matrix zeta integrals and standard denominators


<a id="generic-local-newforms"></a>

**Generic finite-place newforms.** Let F be a nonarchimedean local field, `n≥1`, and `π` an irreducible admissible generic smooth complex `GLₙ(F)` representation. For fixed nondegenerate `ψ` prove Whittaker uniqueness in all ranks, reusing SR.2.3 for `n=2`. Put `K₁(P^c)={k∈GLₙ(O): k_{nj}∈P^c for j<n, k_{nn}≡1 mod P^c}`, with `K₁(P⁰)=GLₙ(O)`. Use ClassFieldTheory layer 7 for `n=1` and [GL₂ newvectors](#gl2-newvectors) for `n=2`. Construct the compatible theorem here for `n≥3`: define c as the least depth with nonzero invariants and prove existence, vanishing below c and dimension one at c. For `c>0` identify that line with the `ω_π(k_{nn})`-isotypic `K₀(P^c)` line and prove `c(ω_π)≤c`. For a conductor-O `ψ`, Whittaker evaluation at 1 is nonzero on it; normalize `W°(1)=1` and prove its essential Whittaker restriction and the `GLₙ×GLₙ₋₁` spherical-twist test. After the local-factor prefix identify c with the epsilon conductor. The theorem `AL2.genericNewform` states existence of the minimal fixed line, vanishing below its depth and nonvanishing of the Whittaker functional on it for every positive rank, with genericity expressed directly by upper-unipotent equivariance. This order defines the fixed line before using it as an analytic test vector.

**Checks.** For `n=1, c` is the attained character conductor of ClassFieldTheory layer 7; `c=0` gives the spherical line; a ramified central character prevents `c=0` and satisfies `c(ω_π)≤c`; a nongeneric determinant character for `n>1` has no essential Whittaker vector.

(Source: Humphries, Godement–Jacquet tests, §2.1–§2.2, p.2, Theorems 3.2 and 3.7, pp.3–4, citing JPSS, Théorèmes (4)–(5); Atobe–Kondo–Yasuda, Theorem 1.1, pp.3–4, and Theorems 2.1–2.2, for the characteristic-zero comparison with their general newforms, generic case λ=(0,…,0,c); Casselman, *On some results of Atkin and Lehner*, Theorem 1 and §3, for GL₂.)

*Needs:* [GL₂ newvectors](#gl2-newvectors) for rank two, constructed after the local integral/factor prefix ending at standard-local-l-factor and before newform and ramified-vector tests. SR.2.3 *whittaker-functionals*, SR.5.1 *mirabolic-derivatives* and SR.5.3 *highest-derivative-adapter* for their specified derivative contracts; ClassFieldTheory layer 7; AL.3's generic local Rankin–Selberg factor prefix for the essential test and analytic conductor comparison.

<a id="godement-jacquet-integral"></a>

**The Godement–Jacquet zeta integral.** For `n≥1`, an irreducible admissible `π` of `GL_n(F)`, matrix coefficient `β(g)=ℓ(π(g)v)`, and `Φ∈S(Mat_n(F))`, put `Z(s,β,Φ)=∫_{GL_n(F)}β(g)Φ(g)|det g|_F^(s+(n−1)/2)dg` in its absolute-convergence half-plane. dg gives `GL_n(O)` volume1 at an unramified finite place.

Work under the following hypotheses. F is a local field; at infinity `π` is a Casselman–Wallach representation and `ℓ` a continuous contragredient vector.

Require the following API.

- Z is the displayed integral in its convergence domain.
- Z is linear in `β` and `Φ` where the integrals converge.
- `Z(s,β⊗|det|^t,Φ)=Z(s+t,β,Φ)`.

**Checks.**

- For `n=1` the exponent is s and Z is the Tate integral.
- For `n=2` the determinant exponent is `s+1/2`.
- `Φ=0` gives `Z=0`, including after continuation.
- Replacing dg by c dg multiplies Z by c; the L-factor normalization is independent of this choice.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.3.2, (2.3), pp.5–6.)

*Needs:* [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); **SmoothRepresentationsOfLocalGroups**, SR.3; [Archimedean Whittaker comparisons](#archimedean-smooth-representations); **AdelicAlgebraicGroups**, AA.0.


<a id="godement-jacquet-convergence"></a>

**Convergence of the matrix zeta integral.** For fixed `π,β,Φ` the Godement–Jacquet integral converges absolutely for `Re(s)>c_π`, locally uniformly there with every s-derivative obtained by insertion of powers of `log|det g|`.

Work under the following hypotheses. Use finite-place admissibility and archimedean moderate growth; no universal `Re(s)>0` bound is asserted.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.3.2, after (2.3), p.6.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.


<a id="standard-local-l-factor"></a>

**The standard local L-factor.** At a finite place the `C[q^s,q^(−s)]`-span of all continued `Z(s,β,Φ)` is the principal fractional ideal generated by `L(s,π)=P_π(q^(−s))^(−1), P_π(0)=1`. At infinity L is the product of `Γ_R/Γ_C` factors of the archimedean Langlands parameter, constructed in [Archimedean GLₙ parameters](#archimedean-gln-parameters); these are distinct constructions with a comparison theorem.

Work under the following hypotheses. `π` irreducible admissible; archimedean parameters use unitary normalization.

Require the following API.

- `P_π(0)=1` at a finite place.
- Every Z/L is entire; at each `s₀` some quotient is nonzero.
- For Satake roots `α_i, L(s,π)=∏_i(1−α_i q^(−s))^(−1)`.
- `L(s,π⊗|det|^t)=L(s+t,π)`.

**Checks.**

- `L(s,1_F)=(1−q^(−s))^(−1)`.
- A ramified rank-one character has `L=1` rather than a degree-one unramified factor.
- `L(s,sgn)=Γ_R(s+1)`, not `Γ_R(s)`.
- For `(z/|z|)^κ |z|_C^t, L=Γ_C(s+t+|κ|/2)`.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.1–§2.4.3, pp.6–7.)

*Needs:* [Convergence of the matrix zeta integral](#godement-jacquet-convergence); [Archimedean GLₙ parameters](#archimedean-gln-parameters); [Archimedean local theory: Γ-factors and the standard functions](#archimedean-local-theory).


<a id="godement-jacquet-functional-equation"></a>

**The Godement–Jacquet functional equation.** With positive trace Fourier transform Φ̂(Y)=∫Φ(X)ψ(tr(XY))dX and self-dual additive measure, `Z(1−s,β̌,Φ̂)/L(1−s,π∨)=ε(s,π,ψ)Z(s,β,Φ)/L(s,π), β̌(g)=β(g^(−1))`. `ε` is a nonzero monomial in `q^(−s)` at finite places.

Work under the following hypotheses. Haar and `ψ` conventions agree with AL.1; convert explicitly from native negative Fourier kernel.

**Checks.**

- For `n=1` the determinant exponent is s and the equation is the rank-one local equation, with `β̌=χ⁻¹`.
- For `n=1`, unramified χ and conductor-zero ψ, the normalized standard vector gives `ε=1`.
- Replacing Φ by zero makes both continued integrals zero for every n; the scalar ε remains the representation's nonzero scalar.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.4, (2.15), p.7, for the matrix equation and §2.1.2, p.3, for the additive character and measure; [Chenevier–Taïbi](#ref-cheneviertaibi2020), §2.1, p.274, footnote 6, for the positive-character epsilon convention. Humphries (2.18), p.8, displays negative powers of i and is not used for the epsilon sign.)

*Needs:* [The standard local L-factor](#standard-local-l-factor); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion). The matrix equation supplies the rank-one local equation by specialization.


<a id="godement-jacquet-spherical-test"></a>

**The spherical matrix test vector.** For unramified irreducible `π` of `GL_n(F)`, choose K-fixed `v,ℓ` with `ℓ(v)=1` and `Φ=1_Mat_n(O)`. With K-volume1 and unitary Satake roots `α_i, Z(s,β,Φ)=∏_i(1−α_iq^(−s))^(−1)`. For `n=1` this is the Tate geometric series.

Work under the following hypotheses. Finite place; normalized parabolic induction uses `δ_B^(1/2)`; matrix exponent `s+(n−1)/2`.

(Source: [Humphries, Godement–Jacquet tests](#ref-humphriesgj), §1, (1.1), p.1.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral); [The unramified L-group Euler factor](#l-group-local-factor); **IntegralHeckeAndGaloisDeterminants**, §3a.1, Normalized Satake coefficients for GLn.


<a id="unitary-self-dual-real-factors"></a>

**Real coefficients of unitary self-dual factors.** If a local irreducible admissible `π` is unitary and self-dual, its finite-place normalized Euler polynomial has real coefficients. At infinity its gamma shifts are real or occur in conjugate pairs of the same gamma type. Consequently its local factor is positive at all sufficiently large real s.

Work under the following hypotheses. Both unitarity and self-duality are required; positivity is only asserted away from gamma poles and sufficiently far right.

(Source: [Yun–Zhang](#ref-yunzhang2017), Appendix B LemmaB.3 and proof pp.904–905.)

*Needs:* [The standard local L-factor](#standard-local-l-factor); [The Godement–Jacquet zeta integral](#godement-jacquet-integral); [Canonical archimedean factors](#canonical-archimedean-factor).


<a id="gl2-unramified-genericity"></a>

**Unramified GL₂ genericity in Hecke coordinates.** For `q≥2`, an arithmetic spherical Hecke polynomial is `1−aT+qsT²`, with `s≠0`. The genericity condition is `a²≠s(q+1)²`. If its nonzero Satake parameters are α and β, so `a=α+β` and `qs=αβ`, prove that this condition is equivalent to `α/β≠q` and `α/β≠q⁻¹`. The spherical Langlands quotient is generic exactly under this condition, by the normalized-induction reducibility criterion. Uniformly rescaling both parameters does not change it. In unitary coordinates `A=a/√q`, the polynomial is `1−AT+sT²` and the same condition is `A²≠s(q+2+q⁻¹)`; the two coordinate formulas are not interchangeable.

**Checks.** A determinant character with uniformizer value c has `a=(q+1)c`, `s=c²` and fails the condition. Repeated nonzero parameters `α=β` have ratio 1 and satisfy the condition for every `q≥2`. At `q=2`, the trivial representation has `(a,s)=(3,1)` and lies exactly on the excluded boundary. An unramified Steinberg twist is generic but has no maximal-compact fixed vector, so this degree-two spherical criterion does not apply to it.

(Source: [Bushnell–Henniart](#ref-bushnellhenniart2006), §9.11, p.69, normalized induction and its irreducibility criterion; the equivalence follows by factoring `q(α+β)²−αβ(q+1)²=(qα−β)(α−qβ)`.)

*Needs:* SmoothRepresentationsOfLocalGroups SR.2–SR.4 for normalized induction, Whittaker genericity and Satake parameters; [The standard local L-factor](#standard-local-l-factor); AutomorphicFormsOnReductiveGroups §7.3 for arithmetic/unitary Hecke normalization.

### GL₂ newvectors

<a id="gl2-newvectors"></a>

<a id="gl2-level-bridges"></a>

**Local GL₂ levels and adelic cosets.** For a nonarchimedean local field F, define the integral subgroups once: `K₀(Pⁿ)={g∈GL₂(O): g₂₁∈Pⁿ}` and `K₁(Pⁿ)={g∈K₀(Pⁿ): g₂₂−1∈Pⁿ}`. The latter is the rank-two last-row subgroup of [Generic finite-place newforms](#generic-local-newforms). The definition `TauCeti.GL2Blueprint.k0` accepts an ideal of any commutative ring. The last-row group is the rank-two specialization of `AL2.newformK1`; `TauCeti.GL2Blueprint.localK1` abbreviates `AL2.newformLocalK1` at rank two. Embed the integral groups into `GL₂(F)`. Prove that the unit ideal gives the full integral group, that `K₁⊆K₀`, and that depth zero is the full integral maximal compact. Prove that the embedded level subgroups are compact open. At positive depth, `K₁` is normal in `K₀` and the lower-right entry identifies `K₀/K₁` with `(O/Pⁿ)×`.

Use Mathlib's `Matrix.GeneralLinearGroup.upperRightHom`, the additive-character homomorphism `x↦[[1,x],[0,1]]`, for every rank-two unipotent embedding, including Whittaker equivariance. Prove membership in the last-row subgroup for every integral upper unipotent and every ideal. For a number field K and finitely supported depths `(n_v)`, use AdelicAlgebraicGroups AA.1.5's product-level construction for `U₁=∏_v K₁(P_v^n_v)`. Under its restricted-product realization, the local embedding `ι_v`, equal to the identity away from v, sends `localK1(K_v,n_v)` into `U₁`; coordinate evaluation recovers the original local element. Prove that this product is compact open. Over ℚ compare it with the last-row `K₁(N)` of that supplier's AA.5.2; AA.5.2's modular-curve specialization is not a general-number-field level construction.

For any compact open product level `U=GL₂(O_v)×U^v` at a finite place v, put `t_v=ι_v(diag(ϖ_v,1))`. Choose lifts u of the residue field. Prove the disjoint right-coset decomposition `U t_v U=⊔_r ι_v(r)U`, with the q representatives `r_u=[[ϖ_v,u],[0,1]]` and `r_∞=diag(1,ϖ_v)`. Thus the local q+1 representatives give the global coset system, independently of the lifts and of the level away from v. Compare this system with AdelicAlgebraicGroups AA.4.5's relative-index degree and AutomorphicFormsOnReductiveGroups §7.3's Hecke convention.

**Checks.** At depth zero both groups are `GL₂(O)`; at depth one `diag(u,1)` belongs to `K₁` for every unit u, whereas `diag(1,u)` belongs only when `u≡1 mod P`. Every integral upper unipotent belongs to `K₁` at every depth; a lower unipotent with unit entry fails at positive depth. When q=2 the good-place decomposition has exactly three cosets, indexed by the three lines of the residue plane. Changing a lift by `ϖa` preserves its right coset. At Iwahori level `U_v=K₀(P_v)`, the double coset of `diag(ϖ_v,1)` has q right cosets, so the q+1 assertion requires full maximal-compact level at v.

(Source: [Bushnell–Henniart](#ref-bushnellhenniart2006), §7.2, pp.50–51, Cartan decomposition and double-coset index; [Casselman](#ref-casselman1973), pp.302–303, congruence subgroups, with the last-row convention; the coset representatives follow by reduction of column lattices to the q+1 residue-field lines. AdelicAlgebraicGroups AA.1.5, AA.4.5 and AA.5.2 supply the product-level and global quotient comparisons.)

*Needs:* AdelicAlgebraicGroups AA.0–AA.1 for restricted products and integral embeddings, AA.1.5 for product levels and AA.4.5 for coset degrees; Mathlib `Matrix.GeneralLinearGroup.upperRightHom`; LocalFieldsRamification layer 0 for the valuation ring and residue field.

Construct the `GL₂` Kirillov model and its compactly supported functions in the proof of the existence and dimension statements below, using SR.2.3 Whittaker uniqueness and SR.3 smooth admissible representations.

<a id="r16-2-newvector-level-exists"></a>

#### Existence of a nonzero newvector level

For an irreducible admissible infinite-dimensional complex smooth representation `π` of `GL₂(F)`, with F a nonarchimedean local field of any characteristic, there is `n≥0` and a nonzero vector fixed by the last-row `K₁(pⁿ)`. This assertion neither uses a conductor exponent nor asserts the dimension formula; it supplies the nonempty level set before its minimum is defined. It is stated as `TauCeti.GL2Blueprint.newvectorLevelExists`.

**Checks.** An unramified generic principal series has a nonzero level-zero vector; an unramified Steinberg twist first has a vector at level one; both assertions apply over `𝔽_q((T))`, including residue characteristic two.

Use Mathlib's `IsNonarchimedeanLocalField`, its valuation ring and maximal ideal, and `Representation.invariants` for the embedded subgroup. Smoothness means every vector stabilizer is open; admissibility means the invariant subspace of every compact open subgroup is finite-dimensional. Irreducibility is Mathlib's `Representation.IsIrreducible`. These conditions specialize the SmoothRepresentationsOfLocalGroups SR.3 theory without introducing replacement representation or local-field carriers.

*Needs:* the last-row `K₁` subgroup of this section; SmoothRepresentationsOfLocalGroups SR.3 and the `GL₂` Kirillov construction in Casselman’s proof; Mathlib `Representation.invariants`; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals.

*Source:* [Casselman](#ref-casselman1973), §1 Theorem 1, p. 302; its proof and subgroup decomposition, pp. 303–306.

<a id="r16-2-newvector-conductor"></a>

#### The newvector conductor exponent

For irreducible admissible infinite-dimensional `π` of `GL₂(F), c(π)` is the least `n≥0` for which `π^{K₁(pⁿ)}` is nonzero. Define the ideal conductor `p^{c(π)}`. The same least-level construction is available for an existing representation with an explicit nonempty level set. Existence for the stated `π` is the preceding newvectorLevelExists theorem, not a field stored in a replacement representation. This specializes fixed vectors. The definition `TauCeti.GL2Blueprint.conductorExponent` takes the minimum of the nonempty level set.

`π` generic, equivalently infinite-dimensional irreducible; O,p and `K₁` fixed.

Prove the following API.
- `π^{K₁(p^{c(π)})}≠0` and `π^{K₁(pⁿ)}=0` for `n<c(π)`.
- Isomorphic local representations have equal conductor exponent.
- An unramified `χ` has `c(π⊗χdet)=c(π)`, since `χdet` is trivial on `GL₂(O)`.

**Checks.**
- An irreducible unramified generic principal series has conductor zero.
- An unramified Steinberg twist has conductor one.
- For `χ` of conductor `a≥2`, c(St⊗χdet)=2a≠1+a. At `a=1` both formulas give2, so that case alone would not detect the incorrect rule.

*Needs:* the last-row `K₁` subgroup of this section; SmoothRepresentationsOfLocalGroups SR.3 and the `GL₂` Kirillov construction in Casselman’s proof; Mathlib `Representation`; Mathlib `Representation.invariants`; [GL₂ newvector-level-exists](#r16-2-newvector-level-exists).

*Source:* [Casselman](#ref-casselman1973), Theorem 1 p. 302 and epsilon remark p. 307.

<a id="r16-2-casselman-newvector"></a>

#### Casselman’s newvector theorem

For `π` as above and every `n≥0, dimℂ π^{K₁(pⁿ)}=max(0,n−c(π)+1)`. The minimal fixed space is a line. In the lower-last-row convention it is the `ωπ(d)`-isotypic line for `K₀(p^{c(π)})`, with `ωπ` the central character, when `c>0`; at `c=0 it` is the spherical line. With `ψ` trivial on O but nontrivial on `ϖ⁻¹O`, Whittaker evaluation `W↦W(1)` is nonzero on this line. Casselman’s printed top-left central-character convention is transported through the dual/twist convention; it is not silently identified with the lower-last-row subgroup. The theorem has no odd-residue-characteristic restriction. The statements `TauCeti.GL2Blueprint.casselmanNewvector` and `TauCeti.GL2Blueprint.casselmanNewvector_k0_character` give the dimension formula and central-character action.

**Checks.** Over `𝔽_q((T))`, a generic unramified principal series has fixed-space dimension `n+1` at level n; an unramified Steinberg twist has dimension n; at every field and positive conductor c the dimension is zero at `n=c−1` and one at `n=c`.

*Needs:* [GL₂ newvector-conductor](#r16-2-newvector-conductor); SmoothRepresentationsOfLocalGroups SR.3 and the `GL₂` Kirillov construction in Casselman’s proof; the `K₀` subgroup of this section; the last-row `K₁` subgroup of this section; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals; AL.2's local integral/factor prefix through [The standard local L-factor](#standard-local-l-factor), before newform tests.

*Source:* [Casselman](#ref-casselman1973), Theorem 1, p. 302; Corollary to the Proof, p. 306; Kirillov construction in the proof, pp. 303–306.

<a id="r16-2-normalized-newvector"></a>

#### The normalized Whittaker newvector

For generic irreducible `π` and the chosen conductor-O `ψ`, take the unique `K₁(p^{c(π)})`-fixed vector in the Whittaker model of SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals with `W(1)=1`. Equivalently, in the existing fixed line and its Whittaker functional `λ`, choose the unique v with `λ(v)=1`. No arbitrary vector is made canonical before fixing `ψ` and `λ`. For an unramified determinant twist `χ, Wχ(g)=χ(det g)W(g)` under the corresponding Whittaker identification.

Normalize the one-dimensional fixed line using its nonzero restricted functional.
The Whittaker model and functional are supplied by SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals.

Prove the following API.
- vnew is fixed by `K₁(p^{c(π)})`.
- `λ(vnew)=1`.
- Every fixed v with `λ(v)=1` equals vnew.
- Scaling the nonzero functional by `a≠0` rescales its normalized vector by `a⁻¹`.
- An unramified twist identifies Wnew with `χ(det g)Wnew(g)`.

**Checks.**
- For `V=ℂ` and `λ(z)=2z` the normalized vector is 1/2.
- Replacing `λ` by `aλ` with `a≠0` changes vnew to `a⁻¹vnew`.
- The zero functional admits no vector of value one; it fails the input hypothesis.

*Needs:* [GL₂ casselman-newvector](#r16-2-casselman-newvector); Mathlib `Representation.invariants`; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals.

*Source:* [Jacquet–Langlands](#ref-jacquetlanglands1970), §11 following Proposition 11.1.1, p. 183; normalize the spherical local function at e.


The rank-two essential Whittaker restriction and `GL₂×GL₁` spherical-twist test, including the equality with the standard local factor and the epsilon-conductor comparison, are the rank-two specialization of [Generic finite-place newforms](#generic-local-newforms). Prove them after the minimal-line and value-one normalization above.

### Ramified Godement–Jacquet test vector


<a id="godement-jacquet-newform-test"></a>

**A ramified Godement–Jacquet test vector.** Let `π` be a ramified generic representation of `GL_n(F), F` nonarchimedean, with conductor `c>0`, normalized newvectors v°,v̌° and `β(g)=⟨π(g)v°,v̌°⟩, β(1)=1`. Let `Φ(X)=ω_π(X_nn)^(−1)/vol K₀(P^c)` when `X∈Mat_n(O), X_nj∈P^c` for `j<n, X_nn∈O×`, and 0 otherwise. Then `Z(s,β,Φ)=L(s,π)`.

Work under the following hypotheses. Use the generic finite-place newform theorem here including `c(ω_π)≤c`; `dg(K)=1`.

(Source: [Humphries, Godement–Jacquet tests](#ref-humphriesgj), Theorem 1.2, p.1; §§4–5, pp.5–7.)

*Needs:* [The Godement–Jacquet zeta integral](#godement-jacquet-integral); [The standard local L-factor](#standard-local-l-factor); [Generic finite-place newforms](#generic-local-newforms); [The unramified Rankin–Selberg test](#rs-unramified-test); [Nonarchimedean factors under normalized induction](#rs-induced-factor-product).


<a id="jacquet-shalika-satake-bound"></a>

**The Jacquet–Shalika Satake bound.** For an irreducible unitary generic unramified representation of `GL_n(F)`, every unitary-normalized Satake root satisfies `q^(−1/2)<|α_i|<q^(1/2)`. Hence a unitary global cusp form has these bounds at all unramified places. This does not assert temperedness over a number field.

Work under the following hypotheses. Genericity is imported from the cuspidal realization; finite local field F.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Corollary7.1.2 and proof, pp.58–59.)

*Needs:* [The unramified Rankin–Selberg test](#rs-unramified-test); [Local convergence and continuity](#rs-local-convergence); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms*.


### Global Godement–Jacquet theory


<a id="global-godement-jacquet"></a>

**The global standard L-function.** For every `n≥1` and unitary cuspidal `π` of `GLₙ(𝔸_K)`, construct the global Godement–Jacquet integrals `Z(s,β,Φ)=∫_(GLₙ(𝔸_K)) β(g)Φ(g)|det g|^(s+(n−1)/2)dg`, where `β(g)=⟨π(g)φ,φ′⟩` is a cuspidal automorphic matrix coefficient, with the pairing on `Z(𝔸_K)GLₙ(K)\GLₙ(𝔸_K)`, and `Φ∈S(Mₙ(𝔸_K))`. Prove convergence in a right half-plane and meromorphic continuation with `Z(s,β,Φ)=Z(1−s,β∨,Φ̂)`, where `β∨(g)=β(g⁻¹)` and the positive Fourier transform uses the trace pairing. Use AL.0's vector-space Poisson comparison on `Mₙ(𝔸_K)` to establish the matrix theta identity before its cuspidal pairing and Mellin transform. For `n≥2`, cuspidality removes the rank-deficient contributions and the integrals are entire. For `n=1`, this is the same construction on `M₁(𝔸_K)=𝔸_K`. Include complex determinant norm twists by translating s. The finite standard Euler product converges absolutely for `Re(s)>1` for unitary π. The completed `Λ(s,π)=∏_v L(s,π_v)` continues meromorphically and satisfies `Λ(s,π)=ε(s,π)Λ(1−s,π∨)`; it is entire for `n≥2`. The product of local epsilon factors is independent of the global additive character.

For `n=1`, let χ be any continuous idele-class quasi-character and normalize its matrix coefficient as `β=χ`. For the factorisable standard function, ArithmeticGaloisRepresentations §2.7's [Hecke zeta-integral comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison) gives `Z(s,χ,f^std_χ)=A^(−u/2)Λ_unit(χ₀,u)` for `χ=χ₀|·|^t`, algebraic `χ₀`, `u=s+t−σ` and `A=|D_K|N𝔣₀`. Thus `A^(u/2)Z` is the supplied Hecke completion. For general unitary characters the local standard evaluations identify the product with the standard matrix integral in its convergence half-plane. This matrix-integral theorem supplies its continuation and functional equation; define `Λ_H(χ,s)=A^(s/2)Λ(s,χ)` by conductor balancing, and translate s for complex norm twists.

Work under the following hypotheses. K is a number field, `n≥1`, and π is unitary cuspidal, with complex determinant twists included by translation. Use a nontrivial continuous additive character of `𝔸_K/K` and the self-dual matrix measure for the trace pairing. The standard-function comparisons use the standard trace character; transport them to any other global character `ψ_b`, `b∈K×`, by Fourier and Haar scaling and the product formula. Choose multiplicative Haar measures compatible with the local integrals and, at `n=1`, with AL.1's Tate measures after the stated local Haar comparisons; disintegrate the idele-class norm with `dt/t`. The initial matrix-integral construction gives a sufficiently far-right half-plane; the sharp `Re(s)>1` Euler-product boundary for higher rank additionally uses the self-pair Rankin–Selberg mean-square coefficient argument. The matrix Poisson continuation and its `n=1` case precede that sharper boundary.

**Checks.**

- For `n=1`, K=`ℚ` and the standard Gaussian tensor, `Z=Γ_ℝ(s)ζ(s)` has residues `−1,+1` at `0,1`.
- For `χ=|·|^t`, including nonzero imaginary t, the possible poles move to `−t,1−t`. For `f=0` both residues vanish and the continuation is zero; individual integrals can have removable singularities.
- For `n≥2` cuspidal data all matrix integrals and the completed standard function are entire. A one-dimensional trivial character has a pole at 1 and cannot be included in that entire assertion.

(Source: Godement–Jacquet, *Global Theory*, pp.136–184, matrix Poisson summation and global continuation; [Borel](#ref-borel1979), §14, pp.52–53, standard representation case; ArithmeticGaloisRepresentations §2.7, **Hecke zeta-integral comparison** and **Standard-test-function evaluations**, for the finite-order/algebraic and local standard-function comparisons.)

*Needs:* [The Godement–Jacquet functional equation](#godement-jacquet-functional-equation); [Vector-space Poisson comparison and compact-uniform estimates](#adelic-poisson-summation); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms* (unitary central character and rapid decay); **AdelicAlgebraicGroups**, §2.3, Rational quotients; **ArithmeticGaloisRepresentations**, §2.7, **Standard-test-function evaluations** and **Hecke zeta-integral comparison**; for the sharper higher-rank Euler-product boundary, [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles), [The Jacquet–Shalika Satake bound](#jacquet-shalika-satake-bound), Tau Ceti **ArithmeticDirichletSeries**, layer 8 landau type positivity and layer 3 local factors and euler products.


### Centered entire functions and paired products

**Centered growth and the shared order predicate.** Define `AL2.IsCenteredOrderOne(f)` for `f:ℂ→ℂ` by requiring f entire and, for every `ε>0, a C>0` such that `|f(z)|≤exp(C(1+|z|^(1+ε)))` for all z. Prove equivalence with entirety together with ZerosOfLFunctions layer 0's `OrderLE f 1`, namely `f=O(exp(|z|^A′))` at the cobounded filter for every `A′>1`. Absorb C by an exponent strictly between 1 and A′; conversely extend the asymptotic bound across a compact disc using continuity. Transport products, translations and polynomials through this identification. Consume the multiplicity-counted zero bound and canonical-product theory of ZerosOfLFunctions layer 5.1–5.6.

**Checks.** The constant 1 satisfies both growth formulations. The polynomial `1+z²` satisfies both despite its nonempty zero divisor. The function `exp(z²)` fails both order-one conditions on positive real inputs, while `exp(z)` satisfies both.

(Source: [Yun–Zhang](#ref-yunzhang2017), Appendix B.1, order definition and (B.3), p.902; ZerosOfLFunctions layer 0, `OrderLE`, and layer 5.1–5.6.)

*Needs:* **ZerosOfLFunctions**, layer 0 and layer 5.1–5.6; Mathlib entire functions and compact bounds for continuous functions.

**Paired Hadamard theorem.** Suppose f has this growth, `f(−z)=δf(z)` for `δ∈{1,−1}`, all its zeros lie on the imaginary axis, and `f(x)` is positive real for all sufficiently large positive real x. Then there are `m≥0, c>0` and a finite or countable multiset of positive real numbers `γ`, with `Σγ⁻²<∞`, such that

`f(z)=c z^m ∏γ(1+z²/γ²)`, locally uniformly on `ℂ`, and `δ=(−1)^m`.

The interfaces `AL2.PairedHadamardFactorization`, `AL2.PairedHadamard_derivatives_nonnegative` and `AL2.PairedHadamard_derivatives_positive` retain the growth, parity, zero-location and eventual-positivity hypotheses. Multiplicity is retained, including the zero of order m at the origin. Since eventual positivity excludes `f≡0, m` is finite. Apply the shared theorem to the entire function g extending `f(z)/z^m`, with `g(0)=f^(m)(0)/m!≠0`; g has `OrderLE g 1` by the growth adapter. ZerosOfLFunctions layer 5.2, 5.4 and 5.6 supplies the zero divisor, locally uniform genus-one product and affine exponential. Pair the zeros `±iγ` with their multiplicities; the elementary-factor identity `E₁(z/(iγ))E₁(z/(−iγ))=1+z²/γ²` cancels the exponentials. Parity removes the linear exponential, and eventual positivity fixes `c>0`. Every derivative at zero and at a positive real point is real and nonnegative. If f is not a polynomial, every derivative at a positive real point is strictly positive and every coefficient of `z^(m+2j), j≥0`, is positive. For polynomials, coefficients above the degree vanish.

**Checks.** `f=1+z²` has vanishing higher derivatives; `f=sinh z` has strictly positive derivatives for `x>0`; `f=1−z²` violates the imaginary-zero and positivity hypotheses. For `f=z^m` the shared theorem applies to `g=1` with an empty noncentral zero divisor, giving `c=1` and `δ=(−1)^m`; for `m>0` the shared theorem cannot be applied directly to f at the origin.

(Source: [Yun–Zhang](#ref-yunzhang2017), Appendix B, Proposition B.1 and factorization argument, pp.902–903; the non-polynomial strictness condition is required. The downstream application in AutomorphicSpectralTheory §3.6c uses this theorem for f(z)=Λ(1/2+z).)

*Needs:* The centered-growth adapter above; **ZerosOfLFunctions**, layer 5.1–5.6, generic Hadamard infrastructure; Mathlib analytic functions, derivatives and meromorphic zero orders.


### Maass standard functions and their norm


<a id="maass-standard-l-function"></a>

**The normalized Maass standard L-function.** For `r∈ℝ`, put `r₀=|r|` and take `φ∈NormalizedMaassEigenform(r₀,δ)` from **AutomorphicFormsOnReductiveGroups**, §4.5. Set `ε=δ∈{0,1}`, so the reflection sign is `(−1)^ε`, and let `a(m)=fourierCoefficient(φ,m)` in its supplied factor-two normalization, with `a(1)=1`. Use the native `LSeries a s` for `L_f(s)=∑_{m≥1}a(m)m^(−s)`, with Euler polynomial `1−a(p)T+T²`. The canonical completion is `Γ_R(s+ε+ir)Γ_R(s+ε−ir)L_f(s)`. Duke’s completion `π^(−s)Γ((s+ε+ir)/2)Γ((s+ε−ir)/2)L_f(s)` is `π^ε` times this canonical one.

Work under the following hypotheses. The supplied subtype carries smooth `SL₂(ℤ)` invariance, square-integrability for hyperbolic measure, zero constant Fourier term, Laplace eigenvalue `1/4+r₀²=1/4+r²`, simultaneous normalized Hecke eigenvectors, first coefficient one and reflection parity `(−1)^δ`. Consume `fourierExpansion`, `maassHecke` and `maassHeckeRecurrence` for its Fourier and Hecke comparisons; use `maassAdelization` and `maassClassicalEquiv` for its realization in the ALS.F.6 cusp space. The coefficient and continuation comparisons use that supplied realization in unitary normalization. The identity `K_(ir)=K_(−ir)` identifies negative real inputs with `r₀`, preserving every real parameter in these L-function formulas. The general congruence-subgroup carrier and imaginary-parameter branch remain supplied by §4.5.

Require the following API.

- The p factor is`(1−a(p)p^(−s)+p^(−2s))^(−1)`.
- The canonical completion has the displayed two `Γ_R` factors.
- Duke’s completion is `π^ε` times the canonical one.
- The primitive quadratic twist replaces `a(m)` by `χ_d(m)a(m)`.

**Checks.**

- `a(1)=1`; no extra factor2 occurs in the Dirichlet series.
- For `ε=1` Duke’s completion isπ times the canonical completion.
- the supplied `maassHeckeRecurrence` at `m=n=p` gives `a(p²)=a(p)²−1`, matching the reciprocal quadratic polynomial.
- Replacing the cusp form by an Eisenstein series can introduce poles; entirety is not then asserted.
- For `δ=1`, the imported reflection sign is `−1`; `maassClassicalEquiv` restricts `maassAdelization(φ)` back to `φ`, retaining odd parity and its first coefficient. Full `O(2)` invariance would lose this parity component.
- For negative real `r`, the eigenvalue and Fourier kernel agree with those at `−r`; at `r=0`, the shared carrier and the two equal gamma factors remain defined.

The completion multiplies the native coefficient L-series by the two displayed
`Γ_R` factors. Its comparison with Duke's formula retains the first coefficient,
reflection parity and reciprocal quadratic Hecke polynomial.


(Source: [Duke–İmamoğlu–Tóth](#ref-dukeimamoglutoth2016), §5.2 pp.962–963 (5.6)–(5.9); **AutomorphicFormsOnReductiveGroups**, §4.5, shared normalized carrier and comparisons.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §4.5, `NormalizedMaassEigenform` and its Fourier, Hecke, parity and adelization comparisons; [The K-Bessel kernel](#bessel-k); [The standard local L-factor](#standard-local-l-factor); [Canonical archimedean factors](#canonical-archimedean-factor); **ArithmeticLocallySymmetricSpaces**, ALS.F.6.


<a id="maass-standard-functional-equation"></a>

**The Maass standard functional equation.** The canonical completion of the normalized level-one Maass cusp form is entire and satisfies `Λ(s)=(-1)^εΛ(1−s)`.

Work under the following hypotheses. Same hypotheses and gamma convention as maass-standard-l-function.

(Source: [Duke–İmamoğlu–Tóth](#ref-dukeimamoglutoth2016), §5.2 p.963 (5.9).)

*Needs:* [The normalized Maass standard L-function](#maass-standard-l-function); [The global standard L-function](#global-godement-jacquet).


<a id="maass-adjoint-l-function"></a>

**The finite Maass adjoint L-function.** For the normalized level-one Hecke–Maass cusp eigenform with `r∈ℝ`, let `π` be its unitary adelic realization. Its central character is trivial, so at p its Satake roots are `α_p,α_p⁻¹`. Define `L_f(s,Ad φ)` in its absolute-convergence half-plane by local denominator `(1−T)(1−α_p²T)(1−α_p⁻²T), T=p^(−s)`. Prove `L_f(s,π×π∨)=ζ(s)L_f(s,Ad φ)`. Continue this quotient to `s=1`; the simple self-pair pole and the positive unfolding residue give a finite, nonzero, positive value there. The archimedean adjoint factor is `Γ_R(s)Γ_R(s+2ir)Γ_R(s−2ir)`. Multiplying the finite continuation by these factors gives completed value `L_f(1,Ad φ)/cosh(πr)` at 1.

**Checks.** At each prime the self-pair denominator has two copies of `1−T`, so dividing by `ζ` leaves exactly one; at `s=1` the completed adjoint value is `L_f(1,Ad φ)/cosh(πr)`, rather than the finite value; the positive self-pair residue equals `L_f(1,Ad φ)` because `Res_(s=1)ζ(s)=1`, proving positivity without assuming a value for a divergent Euler product.

(Source: Humphries–Nordentoft, §4.1.1, (4.5), p.21; Cogdell, Fields lectures, Lecture 9 §3 and §6, pp.71–74, self-pair pole; the gamma comparison uses the real gamma reflection formula.)

*Needs:* [The normalized Maass standard L-function](#maass-standard-l-function); [The Rankin–Selberg local L-factor](#rs-local-factor); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); AL.1’s trivial-character zeta continuation and canonical archimedean factors. This target follows the AL.3 self-pair analytic prefix and precedes the norm comparison.

<a id="maass-norm-comparison"></a>

**The Maass Fourier and Petersson normalization.** For a level-one Hecke–Maass cusp eigenform with the Duke expansion and `a(1)=1, ∫_(SL₂(Z)\H)|φ|² dxdy/y²=2L_f(1,Ad φ)/cosh(πr)`. In the `W_(0,ir)(4π|n|y)` convention, `ρ(1)λ(n)=sqrt(n)ρ(n)` and the identity `W_(0,ir)(x)=sqrt(x/π)K_(ir)(x/2)` for `x>0` is proved in this comparison from AL.0’s K-Bessel integral, so the Duke normalization is exactlyρ(1)=1. `L²`-unit normalization therefore has `|ρ(1)|²=cosh(πr)/(2L_f(1,Ad φ))`.

Work under the following hypotheses. Level1 and standard hyperbolic measure of volumeπ/3; coefficients normalized as above. Use the finite adjoint value of the preceding target. No unspecified Petersson scalar is allowed.

**Checks.** Duke’s `a(1)=1` gives `ρ(1)=1` in the W convention; `L²`-unit normalization has the displayed reciprocal finite-adjoint scalar; writing the completed adjoint value instead gives norm `2Λ(1,Ad φ)`, with its gamma factor already included.

(Source: [Humphries–Nordentoft](#ref-humphriesnordentoft), §4.1.1 (4.2)–(4.6) pp.21–22.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §4.5, the shared Fourier normalization and adelization comparisons; [The normalized Maass standard L-function](#maass-standard-l-function); [The finite Maass adjoint L-function](#maass-adjoint-l-function); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The K-Bessel kernel](#bessel-k); The Whittaker differential equation and its decaying solution are constructed here from AL.0’s K-Bessel kernel, specialized to `ν=ir` and `x>0`, with `W_(0,ν)(x)=sqrt(x/π)K_ν(x/2)` fixed by its large-x asymptotic. **ArithmeticLocallySymmetricSpaces**, ALS.F.6.


### Examples

At rank one the matrix integral is the Tate integral; at rank two its determinant exponent is `s+1/2`. For an odd Maass form Duke's completion is `π` times the canonical completion. The centered polynomial `1+z²` has third derivative zero, whereas `sinh(z)` has every derivative positive at positive real points.

### Dependencies

AL.0–AL.1; the local and global analytic prefixes of AL.3 for the mean-square coefficient argument; SmoothRepresentationsOfLocalGroups SR.3–SR.5; the archimedean representation/parameter and restricted tensor prerequisites here and ArithmeticLocallySymmetricSpaces ALS.F.6–F.7; AdelicAlgebraicGroups §2.3; IntegralHeckeAndGaloisDeterminants §3a.1; completed ArithmeticDirichletSeries layers 3 and 8.


## Layer AL.3: Rankin–Selberg theory and function-field factors


### Whittaker realizations and parameter estimates


<a id="whittaker-model"></a>

**The Whittaker realization.** Given generic `π` of `GL_n(F)` and a nonzero Whittaker functional `λ` with `λ(π(u)v)=ψ_N(u)λ(v)`, its Whittaker model is the image `v↦W_v, W_v(g)=λ(π(g)v)`. At infinity use the continuous functional on the Casselman–Wallach globalization; at finite places use the smooth model.

Work under the following hypotheses. `ψ_N(u)=ψ(Σ_{i=1}^{n−1}u_{i,i+1})`; `π` generic and irreducible.

Require the following API.

- `W(ug)=ψ_N(u)W(g)`.
- `W_{π(h)v}(g)=W_v(gh)`.
- Equality at every g is equality in the model.
- The generic irreducible realization is a representation isomorphism onto its image.

**Checks.**

- For `n=1, N` is trivial and `W(g)=χ(g)W(1)`.
- `λ≠0` gives a nonzero W; the zero functional cannot define the model.
- A model for `ψ^(−1)` has the inverse unipotent phase and is required for the second RS factor.

Use the image submodule of orbit functions `g↦ℓ(ρ(g)v)`, retaining smoothness or
the Casselman–Wallach topology in its local-field realization. Prove equivariance,
compatibility with right translation and injectivity for irreducible ρ and nonzero ℓ.


(Source: [Jacquet](#ref-jacquetarch), §2, pp.3–5, continuous Whittaker form and realization.)

*Needs:* [Generic finite-place newforms](#generic-local-newforms); [Archimedean Whittaker comparisons](#archimedean-smooth-representations).


<a id="whittaker-compact-parameter-estimates"></a>

**Uniform archimedean Whittaker estimates.** For a compact parameter set `Ω` in a fixed induced Casselman–Wallach family, there is M such that for every enveloping-algebra differential operator X there is a continuous seminorm `ν_X` with `|ρ(X)W_{u,f}(g)|≤||g||^Mν_X(f)` for `u∈Ω`. Sharper torus estimates give arbitrary decay in the simple-root directions after the prescribed moderate-growth factors.

Work under the following hypotheses. Use fixed compact-picture Fréchet carrier; `λ_u` varies continuously/holomorphically in u.

(Source: [Jacquet](#ref-jacquetarch), §3, Lemma 3.12 and Proposition 3.2, pp.19–20.)

*Needs:* [The Whittaker realization](#whittaker-model); [Archimedean Whittaker comparisons](#archimedean-smooth-representations).


### Unequal-rank and equal-rank integrals


<a id="rs-local-integrals"></a>

**The local Rankin–Selberg integrals.** For generic `π_n,π_m` with `n>m≥1`, opposite Whittaker models and `0≤j≤n−m−1, Ψ_j(s,W,W′)=∫_{N_m\GL_m}∫_{Mat_{j,m}}W([[g,0,0],[x,I_j,0],[0,0,I_{n−m−j}]])W′(g)|det g|^(s−(n−m)/2)dx dg`. For `n=m` use `Ψ(s,W,W′,Φ)=∫_{N_n\GL_n}W(g)W′(g)Φ(e_ng)|det g|^s dg`.

Work under the following hypotheses. Local field F, quotient Haar supplied by AA.2; `Φ∈S(F^n)`.

Require the following API.

- The `n=m` formula includes `Φ(e_ng)` and exponent s.
- The unequal-rank family has `j=0,…,n−m−1`.
- `Ψ_j` is bilinear on convergent inputs; equal rank is also linear in `Φ`.
- Twisting `π_n` by `|det|^t` shifts s to `s+t`.

**Checks.**

- `n=2,m=1,j=0` gives `∫F×W(diag(a,1))χ(a)|a|^(s−1/2)d×a`.
- `n=m=1` gives the Tate integral for the product character with `Φ`.
- For one point of mass `one, W=2,W′=3,Φ=5, |det|=2` and `s=1`, the equal-rank integral is 60; omitting `Φ` or using the unequal-rank exponent fails this check.
- `n=m+3` has three j values 0,1,2; omitting the x-integrals loses the FE partners.

**Checks for the formula specializations.**

- On two point-mass carriers, `n=2,m=1, W=2, W′=3, |det|=4` and `s=1` give `Ψ=12`; using exponent s gives 24.
- At equal rank, replacing `Φ` by zero gives zero for every W,W′, so a formula omitting `Φ` fails.
- At equal rank with a point mass, `W=2,W′=3,Φ=5, |det|=2` and `s=1` give 60, retaining both the Schwartz input and exponent s.


(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 6, Theorem 6.1, p.47, fractional ideal of local integrals; Lecture 8, pp.61–62, archimedean setting.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Schwartz–Bruhat space S(F), its `F^×`-action and tempered distributions](#local-schwartz-bruhat-space); **AdelicAlgebraicGroups**, §2.2, *quotient-measure*.


<a id="rs-local-convergence"></a>

**Local convergence and continuity.** For fixed generic `π_n,π_m`, all `Ψ_j` converge absolutely in a right half-plane, locally uniformly in s; at infinity they are jointly continuous bilinear forms on the smooth Fréchet models, extending to the completed projective tensor product. If both irreducible generic inputs are unitary, the local integrals converge absolutely for `Re(s)≥1`; this closed boundary estimate is needed in the strong multiplicity-one argument.

Work under the following hypotheses. Parameters in compact sets require the uniform seminorm estimates; a K-finite algebraic tensor statement alone is insufficient.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture6 Proposition6.2(i), printed p.47 (physical p.51); Lecture8 Proposition8.2, printed p.63 (physical p.67); [Jacquet](#ref-jacquetarch), §2, Theorem 2.1, pp.6–7; Proposition 3.2 and its proof, pp.19–20.)

*Needs:* [The local Rankin–Selberg integrals](#rs-local-integrals); [Uniform archimedean Whittaker estimates](#whittaker-compact-parameter-estimates); **SmoothRepresentationsOfLocalGroups**, SR.3.


<a id="rs-local-factor"></a>

**The Rankin–Selberg local L-factor.** At a finite place the Laurent-polynomial span of the `Ψ_j` (and `Φ` when `n=m`) is generated by `L(s,π_n×π_m)=P(q^(−s))^(−1), P(0)=1`. At infinity use `L(s,σ_n⊗σ_m)` for the imported archimedean Weil parameters and prove that all `Ψ/L` are entire, with no common zero at any point.

Work under the following hypotheses. Generic irreducible inputs; finite fractional ideals and archimedean holomorphic modules are distinct.

Require the following API.

- `Ψ/L` is entire for every permitted test input.
- At each `s₀` some normalized test input has nonzero value.
- `L(s,π×π′)=∏_{i,j}(1−α_iβ_jq^(−s))^(−1)`.
- For `m=1` the factor is the standard L-factor of the character twist of `π`.

**Checks.**

- Two unramified characters give `(1−αβq^(−s))^(−1)`.
- Satake roots `(2,3), β=5` give denominator `(1−10T)(1−15T)`.
- Two ramified characters can have unramified product; multiplying their separate standard L-factors does not compute the tensor L-factor.

(Source: [Jacquet](#ref-jacquetarch), §2, Theorem 2.3, Lemmas 2.4–2.5 and Theorems 2.6–2.7, pp.8–10; §12.1, pp.83–87; [Cogdell, Fields lectures](#ref-cogdellfields), Lecture6 §2, Proposition6.3 and Corollary6.3.1, printed p.48 (physical p.52).)

*Needs:* [The local Rankin–Selberg integrals](#rs-local-integrals); **SmoothRepresentationsOfLocalGroups**, SR.3; [Archimedean GLₙ parameters](#archimedean-gln-parameters); [Local uniqueness: dim S′(ω) = 1](#local-uniqueness-theorem); [Local convergence and continuity](#rs-local-convergence); [Generic finite-place newforms](#generic-local-newforms).


### Induction, functional equations and test realization


<a id="rs-induced-factor-product"></a>

**Nonarchimedean factors under normalized induction.** Let F be nonarchimedean and `π=Ind_P^GL_n(⊠_i π_i)` and `π′=Ind_Q^GL_m(⊠_j π′_j)` be irreducible generic normalized inductions, with every block irreducible essentially square-integrable. Then `L(s,π)=∏_i L(s,π_i)` and `L(s,π×π′)=∏_(i,j)L(s,π_i×π′_j)`. For a rank-one norm character, `L(s,π×|·|^t)=L(s+t,π)`. These are exact identities of normalized local factors, at this finite place.

Work under the following hypotheses. Use the induced representations themselves, with `δ_P^(1/2)`, not arbitrary irreducible quotients of reducible induction. The irreducible generic range suffices for the newform application; no general nongeneric quotient product theorem is asserted. This target is the finite-place product needed by the ramified Godement–Jacquet newform proof. No archimedean induction-compatibility input is inferred from the finite SR.2 contract.

(Source: [Humphries, archimedean newforms](#ref-humphriesarch), §2.2.1–2.2.3 p.4; §2.4.1 formulas(2.4)–(2.6), p.6; [Humphries, Godement–Jacquet tests](#ref-humphriesgj), §5 proof of Theorem1.2, p.6, invoking JPSS1983 §9.5.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [The standard local L-factor](#standard-local-l-factor); **SmoothRepresentationsOfLocalGroups**, SR.2; **SmoothRepresentationsOfLocalGroups**, SR.3.


<a id="rs-local-functional-equation"></a>

**The local Rankin–Selberg functional equation.** There is a unique `γ(s,π_n×π_m,ψ)` such that the `dual Ψ_{n−m−1−j}(1−s,R(w_{n,m})W̃,W̃′)` equals `ω_{π_m}(−1)^(n−1)γ(s,π_n×π_m,ψ)Ψ_j(s,W,W′)`. At equal rank include the self-dual Fourier transform `Φ̂`. Put `γ=ε L(1−s,π_n∨×π_m∨)/L(s,π_n×π_m)`.

Work under the following hypotheses. `W̃(g)=W(w_n t(g^(−1)))`; use the source Weyl matrix convention and positive Fourier kernel consistently.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 6 §3, Theorem 6.2, pp.48–49; Lecture 8 §3, pp.63–64.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Local Fourier transform, self-dual measure and inversion on S(F)](#local-fourier-inversion); **SmoothRepresentationsOfLocalGroups**, SR.3.


<a id="rs-archimedean-realization"></a>

**Archimedean realization of holomorphic multiples.** For the ordered induced Whittaker-type representations of Jacquet Theorem2.6, every `m(s)=h(s)L(s,σ⊗σ′)` in the space `L(σ⊗σ′)` is represented by the completed projective tensor RS integral when `n>m`, and by a finite sum of such integrals with Schwartz `Φ_i` when `n=m`. Here h is entire and, on every finite vertical strip, `P(s)m(s)` is bounded whenever P is a polynomial clearing the poles of L on that strip. For irreducible induced representations and `m=n−1` or `m=n, L` itself is a finite sum of K-finite test integrals (Gaussian-polynomial `Φ_i` when `n=m`). No arbitrary-entire-multiple claim, arbitrary-rank-gap K-finite claim, or reducible-input extension of Theorem2.7 is made.

Work under the following hypotheses. Use Jacquet’s compact-picture models with `Re(u₁)≤⋯≤Re(u_r)` and `Re(u′₁)≤⋯≤Re(u′_r′)`. The required vertical-strip boundedness is the definition of `L(σ⊗σ′)` on pp.5–6, not merely that h is entire. Irreducibility is required for Theorem2.7; Remark2.8 leaves the corresponding reducible case conjectural.

(Source: [Jacquet](#ref-jacquetarch), §2 definition of L(τ), pp.5–6; Theorems2.6–2.7 and Remark2.8, pp.9–10; §12.1.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Local convergence and continuity](#rs-local-convergence); [Archimedean GLₙ parameters](#archimedean-gln-parameters); [Uniform archimedean Whittaker estimates](#whittaker-compact-parameter-estimates).


<a id="rs-unramified-test"></a>

**The unramified Rankin–Selberg test.** For finite `F, ψ` of conductor O, normalized spherical W°,W′° with value1 at identity, and `Φ°=1_{O^n}` at equal rank, `Ψ_0(s,W°,W′°)=L(s,π×π′)`. At equal rank use `Ψ(s,W°,W′°,Φ°)`. At ramified `π` and spherical `π′` the essential/newform test uses the conductor-dependent `Φ` of Humphries (3.10), not blindly `1_{O^n}`.

Work under the following hypotheses. Satake roots in unitary normalization; spherical/essential Whittaker functions supplied by the generic finite-place newform target (by the function-field local-factor prefix in equal characteristic).

(Source: [Humphries, Godement–Jacquet tests](#ref-humphriesgj), §3, Theorems 3.7 and 3.9, formula (3.10), pp.3–4.)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Generic finite-place newforms](#generic-local-newforms); **IntegralHeckeAndGaloisDeterminants**, §3a.1, Normalized Satake coefficients for GLn; **SmoothRepresentationsOfLocalGroups**, SR.4.


### Fourier reconstruction and ordinary multiplicity one


<a id="gln-fourier-expansion"></a>

**The `GL(n)` cuspidal Fourier expansion.** Over a number field specialize **AutomorphicFormsOnReductiveGroups**, §4.3, to the smooth cuspidal `GLₙ` carrier, with `n≥2`, the character `ψ_N` and quotient volume 1. For a smooth cuspidal `φ` use its coefficient `W_φ(g)=∫_{N_n(K)\N_n(𝔸_K)}φ(ug)ψ_N(u)⁻¹du`, with quotient volume 1. Then `φ(g)=Σ_{γ∈N_{n−1}(K)\GL_{n−1}(K)}W_φ(diag(γ,1)g)`, with locally uniform absolute convergence in the smooth cuspidal setting. In particular `φ↦W_φ` is injective and equivariant. This identifies the supplied reconstruction with the Whittaker realization used here. Global genericity is supplied by the same §4.3; the product realization is constructed below.

Work under the following hypotheses. K is a number field in Cogdell Lecture 4; use a nontrivial global additive character and ALS.F.6 smooth cuspidality/rapid decay. On the function-field carriers of [Restricted tensor realizations](#restricted-tensor-realizations), prove the same reconstruction by successive compact-unipotent Fourier expansion, as used in Yu §5.3.1 before factorization. At infinite places use smooth moderate-growth globalizations and the derivative estimates needed for the stated convergence. A vanishing cuspidal constant term is essential.

Require the following API.

- `W_φ=W_φ′` implies `φ=φ′` for smooth cusp forms with the fixed character and measure.
- `W_{R(h)φ}(g)=W_φ(gh)`.

**Checks.**

- For `n=2` the unipotent quotient is an additive adelic quotient: integrating the character `e(x)` against `e(−x)` gives 1, whereas `e(2x)` against `e(−x)` gives zero. The kernel extracts the specified frequency, including its sign.
- A nonzero constant automorphic function has vanishing nontrivial Fourier coefficient and fails cuspidality; it cannot be reconstructed by this cusp expansion.
- If every translate in the reconstruction sum has zero Whittaker coefficient, the cusp form itself is zero. This tests the injective realization, rather than the existence of some arbitrary linear functional.


(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 4 §1–§2, printed pp.29–31 (PDF pp.33–35); [Yu](#ref-yu2023), §5.3.1, Lemma 5.3.3 proof, p.36.)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §4.3, number-field Fourier/character duality, cuspidal Fourier reconstruction and global/local genericity; [Vector-space Poisson comparison and compact-uniform estimates](#adelic-poisson-summation); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms*; **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms* (unitary central character and rapid decay); [Restricted tensor realizations](#restricted-tensor-realizations), compact rational unipotent quotients; **AdelicAlgebraicGroups**, §2.2, *quotient-measure*.


<a id="global-whittaker-factorization"></a>

**Global Whittaker factorization.** For an irreducible cuspidal `π` of `GL_n(𝔸_K)`, use **AutomorphicFormsOnReductiveGroups**, §4.3, for number-field global and local-component genericity and injective Fourier reconstruction, specialized in [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion). Over a function field use that target’s reconstruction on the curve carriers to obtain the same genericity. With quotient volume 1, continuous local Whittaker uniqueness and a fixed Flath restricted tensor realization, a factorizable `φ` has `W_φ=∏_v W_v`, after fixing one global scalar; almost all `W_v` are normalized spherical. At infinite places extend continuously from dense tensors. An arbitrary global cusp vector or distribution is not asserted decomposable.

Work under the following hypotheses. `π` is an irreducible cuspidal automorphic representation with the specialized restricted tensor realization. Its number-field genericity is supplied by AutomorphicFormsOnReductiveGroups §4.3; its function-field genericity uses [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion). At infinite places use the continuous Whittaker functional on the smooth moderate-growth globalization; uniqueness of arbitrary algebraic functionals on the Harish–Chandra module is not the theorem. The function-field spherical specialization is Yu §5.3.1.

Require the following API.

- Specialize the supplied number-field genericity to this realization: every irreducible cuspidal `π` and its local components possess a nonzero Whittaker functional for the fixed nontrivial character. The function-field version follows from the reconstruction on the curve carriers.
- A pure tensor has the product Whittaker function with the fixed global scalar and almost-all spherical normalization.

**Checks.** For `GL₁` the product is the idele-class character evaluated componentwise; rescaling one local Whittaker functional by a nonzero scalar rescales the product by that scalar; the trivial `GL₂` representation has zero nontrivial Whittaker coefficient and fails cuspidality, so it is excluded from the genericity assertion.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 4 §2, Theorem 4.1 and Corollaries 4.1.1–4.1.3, printed pp.31–33 (PDF pp.35–37); [Yu](#ref-yu2023), §5.3.1 pp.36–38, equation (5.3.1).)

*Needs:* **AutomorphicFormsOnReductiveGroups**, §4.3, number-field global and local-component cuspidal `GLₙ` genericity; [The Whittaker realization](#whittaker-model); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms*; **AdelicAlgebraicGroups**, §2.2, *quotient-measure*; [Restricted tensor realizations](#restricted-tensor-realizations), including compact rational unipotent quotients; [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion).


<a id="global-multiplicity-one"></a>

**Ordinary global multiplicity one for `GL(n)`.** For an irreducible admissible smooth representation `π` of `GL_n(𝔸_K), K` a number field, its multiplicity in the smooth cuspidal spectrum with fixed central character is at most one. If `π` is cuspidal, the multiplicity is one: any two nonzero equivariant embeddings into that cusp space differ by a nonzero scalar and have the same image. This is the ordinary multiplicity theorem; it assumes the same global representation, rather than cofinite local agreement.

Work under the following hypotheses. `n≥1`; K a number field; characteristic-zero complex automorphic forms. Work with the unitary central-character Hilbert realization or an explicitly fixed norm twist. Use continuous equivariant embeddings and continuous Whittaker functionals on the smooth moderate-growth globalizations at infinity. Compare smooth and Hilbert cusp multiplicities by the dense smooth-vector realization in ALS.F.6’s cuspidal Hilbert subspace, using the globalization and restricted tensor targets here. Prove this comparison here as part of the multiplicity theorem.

Require the following API.

- Two nonzero equivariant embeddings of `π` into the fixed smooth cusp space differ by `c∈ℂ×`.
- The ranges of those two embeddings coincide.

**Checks.**

- For `c≠0, i` and c·i have the same image and the same cuspidal constituent.
- Even when `dim π^K=2`, the contribution at level K has dimension 2 while the global automorphic multiplicity is 1.
- If there is no nonzero cusp embedding, the multiplicity is 0, consistent with the at-most-one assertion.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 4 §3, Theorem 4.2 and proof, printed pp.33–34 (PDF pp.37–38).)

*Needs:* [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion); [Global Whittaker factorization](#global-whittaker-factorization); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms* (cuspidal spectrum).


### Mirabolic Eisenstein series and unfolding


<a id="mirabolic-eisenstein-series"></a>

**The mirabolic Eisenstein series.** For `Φ∈S(𝔸^n)`, unitary idele-class character `η` and `Re(s)>1, E(g,s,Φ,η)=|det g|^s∫_{K×\𝔸×}Σ_{ξ∈K^n\{0}}Φ(aξg)|a|^(ns)η(a)d×a`. Equivalently E is the sum over `P_{n−1,1}(K)\GL_n(K)` of the section `f(g,s)=|det g|^s∫_{𝔸×}Φ(ae_ng)|a|^(ns)η(a)d×a`.

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. `n≥1`; self-dual additive Haar and a specified multiplicative Haar; Schwartz topology uses the completed archimedean factors.

Require the following API.

- E is the displayed nonzero theta Mellin integral.
- E equals the sum of the displayed section over the maximal-parabolic quotient.
- `E(zg,s,Φ,η)=η(z)^(−1)E(g,s,Φ,η)`.

**Checks.**

- For `n=1, GL₁(K)\GL₁(𝔸)` unfolding recovers the `n=1` Godement–Jacquet integral.
- `Φ=0` gives `E=0`.
- A character nontrivial on the norm-one class group has no theta zero-mode poles; merely calling it nontrivial is insufficient for norm twists.

**Check for the theta-Mellin formula.** With a point mass, `n=2`,
|det g|=3, θ₀=5, |a|=2, η=1 and s=1 give 60, rather than the value 30
obtained by omitting n from the norm exponent.


(Source: [Cogdell, Columbia lectures](#ref-cogdellintegrals), §1.1.3, pp.4–5.)

*Needs:* [The adelic Schwartz–Bruhat space S(𝔸) and its standard functions](#adelic-schwartz-bruhat-space); [The global standard L-function](#global-godement-jacquet) at `n=1`; **AdelicAlgebraicGroups**, §2.2, *quotient-measure*.


<a id="mirabolic-eisenstein-functional-equation"></a>

**Continuation and residues of mirabolic Eisenstein series.** `E(g,s,Φ,η)=E(t(g^(−1)),1−s,Φ̂,η^(−1))` meromorphically over a number field. If `η=|·|^(−inσ)`, its only possible simple poles are `s=iσ` and1+iσ. With `κ=vol(K×\𝔸¹)` in the chosen measures, the zero-mode terms in that case are `−κ|det g|^sΦ(0)/(n(s−iσ))+κ|det g|^(s−1)Φ̂(0)/(n(s−1−iσ))`. If the restriction of `η` to the norm-one idele class group is nontrivial, both zero-mode integrals vanish. The case `η=1` is `σ=0`.

Work under the following hypotheses. Positive Fourier kernel, additive self-duality; n-fold quotient covolume normalized1. Use the AL.0 compact-uniform absolute periodisation contract for `Φ` and `Φ̂` on `𝔸^n`, jointly in compact dilation/translation sets, and the weighted idele integrability bounds for the noncompact Mellin direction; no interchange uses uniform convergence over all translations.

**Checks.** For `n=1, g=1` and `η=1` the two zero-mode terms are `−κΦ(0)/s` and `κΦ̂(0)/(s−1)`, as in the `n=1` Godement–Jacquet equation. If `η` is nontrivial on the norm-one classes, both terms vanish. For `n=2, η=1` and `g=1`, the residues at 0 and 1 are `−κΦ(0)/2` and `κΦ̂(0)/2`; the factor 1/n is retained.

(Source: [Cogdell, Columbia lectures](#ref-cogdellintegrals), §1.1.3, pp.4–5, Poisson summation and functional equation.)

*Needs:* [The mirabolic Eisenstein series](#mirabolic-eisenstein-series); [Vector-space Poisson comparison and compact-uniform estimates](#adelic-poisson-summation); [Hecke continuation and functional equation](#hecke-l-functional-equation).


<a id="global-rs-unfolding"></a>

**Global Rankin–Selberg unfolding.** For unitary cuspidal `π_n,π_m` and pure tensors, the unequal-rank projected cusp integral and the equal-rank integral `∫_{Z_n(𝔸)GL_n(K)\GL_n(𝔸)}φ(g)φ′(g)E(g,s,Φ,ω_πω_π′)dg` unfold to `∏_v Ψ_v(s)`. For `n>m` project `φ` along the unipotent radical of `(m+1,1,…,1)`, with factor `|det|^(−(n−m−1)/2)`, then integrate against `φ′|det|^(s−1/2)`.

Work under the following hypotheses. K is a number field. The function-field rational/periodic-pole branch is treated by the separate function-field nodes. Initially `Re(s)≫0`; global character product trivial on `K×`. Adjacent rank needs no preliminary projection.

(Source: [Cogdell, Columbia lectures](#ref-cogdellintegrals), §1.1.2–§1.1.3 pp.3–5.)

*Needs:* [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion); [The mirabolic Eisenstein series](#mirabolic-eisenstein-series); [The local Rankin–Selberg integrals](#rs-local-integrals); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms* (unitary central character and rapid decay); **AdelicAlgebraicGroups**, §2.3, Rational quotients; [Global Whittaker factorization](#global-whittaker-factorization).


### Poles, functional equations and the closed boundary


<a id="rs-global-poles"></a>

**Continuation and the Rankin–Selberg pole criterion.** For unitary cuspidal `π_n,π_m` the completed `Λ(s,π_n×π_m)` continues meromorphically. It is entire if `n≠m`. If `n=m`, its only poles are simple at `s=iσ` and1+iσ for real `σ` with `π_n∨≅π_m⊗|det|^(iσ)`. In particular `Λ(s,π×π∨)` has simple poles at0 and1, and `Λ(s,π×π′∨)` has a pole at1 iff `π≅π′`.

Work under the following hypotheses. K is a number field. The function-field rational/periodic-pole branch is treated by the separate function-field nodes. Holomorphic normalized local quotients have no common zero; all archimedean factors included.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §3, printed p.71 (PDF p.75); §6, Theorems 9.1–9.2, printed p.74 (PDF p.78).)

*Needs:* [Global Rankin–Selberg unfolding](#global-rs-unfolding); [The Rankin–Selberg local L-factor](#rs-local-factor); [Continuation and residues of mirabolic Eisenstein series](#mirabolic-eisenstein-functional-equation); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms* (unitary central character and rapid decay).


<a id="rs-global-functional-equation"></a>

**The global Rankin–Selberg functional equation.** `Λ(s,π×π′)=ε(s,π×π′)Λ(1−s,π∨×π′∨)`, with `ε` the finite product of local epsilon factors at all archimedean places and all finite places where either representation or the chosen additive character is ramified. For the standard trace character this includes places dividing the different, even for unramified representations. Central-character signs disappear because `∏_vω_{π′_v}(−1)=ω_{π′}(−1)=1`. The global product is independent of the chosen global additive character.

Work under the following hypotheses. K is a number field. The function-field rational/periodic-pole branch is treated by the separate function-field nodes. Use unitary cuspidal representations and consistent quotient measures.

**Checks.** For the trivial `GL₁` self-pair over `ℚ, ε=1`; over `ℚ(√5)` both representations are finite-unramified but the trace character at (√5) gives global `ε(s)=5^(1/2−s)`; rescaling the global character by `a∈K×` changes local factors whose product cancels by the product formula. The exceptional-place epsilon product includes the discriminant-5 power.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §4, printed pp.71–72 (PDF pp.75–76); §6, Theorems 9.1–9.2, printed p.74 (PDF p.78).)

*Needs:* [The local Rankin–Selberg functional equation](#rs-local-functional-equation); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); AL.1 [explicit-epsilon-factors](#explicit-epsilon-factors) and [global-epsilon-factor](#global-epsilon-factor), including additive-character conductors.


<a id="rs-boundary-nonvanishing"></a>

**Rankin–Selberg nonvanishing on the boundary.** For unitary cuspidal `π₁,π₂` over a number field, the finite partial Rankin–Selberg `L^S(s,π₁×π₂)` has no zeros on `Re(s)≥1`; its poles there occur only at1+it where `π₂≅π₁∨⊗|det|^(−it)`, and are simple. The statement is meromorphic at a pole, not a finite-value assertion.

Work under the following hypotheses. S contains ramified and archimedean places; all finite removed factors are nonzero and regular on this boundary by the strict local exponent bound.

(Source: [Sarnak](#ref-sarnak2004), §1 p.3 (5), discussion of Shahidi.)

*Needs:* [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The global Rankin–Selberg functional equation](#rs-global-functional-equation); [The Jacquet–Shalika Satake bound](#jacquet-shalika-satake-bound).


### Strong multiplicity one


<a id="strong-multiplicity-one"></a>

**The analytic proof of strong multiplicity one.** If cuspidal `π₁,π₂` of `GL_n(𝔸_K)` have isomorphic local components at all finite places outside a finite set, then `π₁≅π₂` globally, including every omitted finite and infinite place; with AL.3/global-multiplicity-one their cusp realizations coincide.

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. Unitarize the central characters consistently; every excluded finite and archimedean local factor is nonzero and finite at `s=1`, by the local unitary bounds and gamma calculation. Agreement at infinity is a conclusion.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Theorem9.3 and proof, pp.74–75.)

*Needs:* [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [The Jacquet–Shalika Satake bound](#jacquet-shalika-satake-bound); [Ordinary global multiplicity one for GL(n)](#global-multiplicity-one); [Local convergence and continuity](#rs-local-convergence); [The Rankin–Selberg local L-factor](#rs-local-factor).


<a id="isobaric-strong-multiplicity-one"></a>

**Strong multiplicity one for isobaric sums.** Given the [isobaric construction](#isobaric-construction) `π=⊞_iτ_i`, equality of unramified components almost everywhere determines the multiset of cuspidal constituents `τ_i`, including multiplicities and norm twists. Thus two isobaric representations with those components are isomorphic. For arbitrary automorphic constituents the conclusion is equality of cuspidal support, not an unproved assertion that every constituent is itself the same representation.

Work under the following hypotheses. K is a number field; the function-field statements are established in the separate curve-cohomological subsection below. Use the isobaric/residual prerequisite and SR.2 normalized induction, with the supplied archimedean induction specialized in [Archimedean Whittaker comparisons](#archimedean-smooth-representations).

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Theorem9.4, pp.75–76.)

*Needs:* [The analytic proof of strong multiplicity one](#strong-multiplicity-one); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); [GLₙ isobaric sums](#isobaric-construction); **ArithmeticLocallySymmetricSpaces**, ALS.F.6–F.7.


### Central periods


<a id="normalized-rs-period"></a>

**The normalized adjacent-rank period.** For generic `π_m⊠π_{m+1}`, put `λ_v(s,W)=∫_{N_m\GL_m}W(diag(h,1),h)|det h|^s dh` and `λ_v♮(W)=(λ_v(s,W)/L(s+1/2,π_m×π_{m+1}))|_{s=0}`. This is a nonzero continuous `H_v`-invariant functional, unique up to scalar on the generic representation. For tempered inputs the integral converges for `Re(s)>−1/2`.

Work under the following hypotheses. Take opposite Whittaker characters; normalized quotient entire even if the raw value at0 needs continuation.

Require the following API.

- `λ_v(s)/L(s+1/2)` is entire.
- `λ_v♮` is `H_v` invariant.
- `λ_v♮(W°)=1` with the conductor-zero character and stated Haar.

**Checks.**

- For two unramified inputs and W° the normalized value is1.
- `Re(s)=0` is in the tempered convergence region, while the boundary `−1/2` is excluded.
- A raw integral that fails to converge at0 is evaluated through the entire quotient, not declared zero by totalization.

(Source: [Leslie](#ref-leslie2025), §8.2 pp.58–59, (8.3).)

*Needs:* [The Rankin–Selberg local L-factor](#rs-local-factor); [Local convergence and continuity](#rs-local-convergence); [The unramified Rankin–Selberg test](#rs-unramified-test); [Generic finite-place newforms](#generic-local-newforms); [Archimedean Whittaker comparisons](#archimedean-smooth-representations); [Archimedean GLₙ parameters](#archimedean-gln-parameters).


<a id="global-central-period"></a>

**Central Rankin–Selberg period factorization.** For unitary cuspidal `Π_m⊠Π_{m+1}` and a factorizable cusp vector `φ, ∫_{GL_m(K)\GL_m(𝔸)}φ_m(h)φ_{m+1}(diag(h,1))dh=L(1/2,Π_m×Π_{m+1})∏_vλ_v♮(W_v)`. A quadratic idele-class twist gives the same identity with `Π_m⊗η` and the twisted local functionals.

Work under the following hypotheses. The product uses spherical value1 almost everywhere; quotient measures are those of Leslie §8.

(Source: [Leslie](#ref-leslie2025), Proposition8.3 and Corollary8.4 pp.59–60.)

*Needs:* [The normalized adjacent-rank period](#normalized-rs-period); [Global Rankin–Selberg unfolding](#global-rs-unfolding); [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles); **ArithmeticLocallySymmetricSpaces**, ALS.F.6, *Automorphic forms, constant terms and cusp forms* (unitary central character and rapid decay).


### GLₙ converse theorems

<a id="l-function-datum"></a>

**L-function data and derived products.** Construct `LDatum` indexed by finite places, with residue cardinalities `q_v : ℕ`, degree bound n, Euler polynomials `P_v` and dual polynomials `P_vᵈ` over ℂ, finite multisets of real and complex gamma shifts and their duals, a real convergence abscissa σ and a real reflection centre c. This is algebraic and numerical data. Define `WellFormed` by `n≥1`, `q_v≥2`, `P_v(0)=P_vᵈ(0)=1`, both degrees at most n, and `−Re(μ)≤σ` for every gamma shift μ, including dual shifts. It imposes no analytic continuation or growth assertion. The separation of data from analytic hypotheses follows the interface design used by the Imperial College London FLT project.

Derive `LFun(D,s)=∏_v P_v(q_v^(−s))⁻¹`, its dual product, `archFactor(D,s)=∏_μ Γ_ℝ(s+μ) ∏_ν Γ_ℂ(s+ν)` and its dual. `Converges D` requires nonzero local denominators in `Re(s)>σ` and, on every nonempty compact subset C of that half-plane, summability of `sup_(s∈C)|P_v(q_v^(−s))−1|` and the analogous dual family. Prove that the two products converge absolutely and locally uniformly to nonvanishing holomorphic functions there. The initial completion is the product of the derived finite and archimedean factors on that half-plane; its continuation is a theorem or a separate hypothesis. Expose swapping primal and dual data, involutivity, independence of multiset ordering, and the exact finite-deletion/restoration identities. A partial product carries its omitted local factors explicitly.

**Checks.** `P_v=1` is permitted at a ramified place and contributes 1, while `P_v(0)=0` fails `WellFormed`. For `q_v=2`, `1−αT` has the factor `(1−α2^(−s))⁻¹` and its dual must be specified separately; complex conjugation is not the definition of duality. A real shift multiset `{0,1}` has archimedean factor `Γ_ℂ(s)`, whereas two complex zero shifts give `Γ_ℂ(s)²`. Polynomials `P_v=1−T` over the primes converge only in the appropriate right half-plane; well-formedness alone gives no convergent Euler product.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §2, pp.5–6, local-factor products and convergence hypotheses; [Humphries, archimedean newforms](#ref-humphriesarch), §2.4.1–§2.4.3, pp.5–7; [Cogdell, Fields lectures](#ref-cogdellfields), §§7–8 for finite and infinite local factors.)

*Needs:* [The standard local L-factor](#standard-local-l-factor); [The Rankin–Selberg local L-factor](#rs-local-factor); [Canonical archimedean factors](#canonical-archimedean-factor); Mathlib `Polynomial`, `Multiset`, `HasProd` and the holomorphic locally uniform limit API. The datum and its products are constructed before their automorphic instances.

<a id="bounded-on-strips"></a>

**Boundedness on finite vertical strips.** For `f : ℂ→ℂ`, define `BoundedOnStrips f` by: for every pair of real endpoints a,b there is `C≥0` such that `‖f(s)‖≤C` whenever `a≤Re(s)≤b`. This roadmap owns the predicate. Prove preservation under products, complex translations and reflection `s↦2c−s` for real c. Use the actual entire continued completions, including their gamma factors. Meromorphic functions with poles in a strip do not satisfy this bound. AutomorphicSpectralTheory's `FiniteStripOrder` is a downstream growth condition: bounded strip functions satisfy its scalar finite-order condition; finite strip order does not imply boundedness.

**Checks.** The constant function 1 is bounded with C=1 on every strip. `exp(s²)` is bounded on each finite vertical strip, since its modulus is `exp(Re(s)²−Im(s)²)`. `exp(−s²)` has finite strip order but is unbounded on the imaginary axis. An actual pole at 1 excludes boundedness on any strip containing a neighborhood of 1.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §1 Theorem 1.1 and §2, pp.5–6; [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §5, pp.72–73, for the completed Rankin–Selberg bounds.)

*Needs:* Mathlib complex norm and real-part API; the continued functions of [The global standard L-function](#global-godement-jacquet) and [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles) for automorphic applications.

<a id="pinned-niceness"></a>

**Niceness with specified root number and conductor.** Define `IsNicePinned D ε N`, with the complex constant ε and positive real conductor scale N as explicit arguments. It asserts `WellFormed D`, `Converges D`, `ε≠0`, `N>0`, and the existence of entire functions Λ and Λᵈ extending respectively `archFactor(D,s)LFun(D,s)` and its dual from `Re(s)>σ`. Both extensions satisfy `BoundedOnStrips`, and for every s satisfy `Λ(s)=ε N^(c−s)Λᵈ(2c−s)`. Continuation, boundedness and the functional equation are predicates to prove, rather than fields of `LDatum`. Prove uniqueness of the two continuations from their initial half-plane, the dual predicate with root number `ε⁻¹` and the same N, and equivalence with the balanced equation after multiplying each completion by `N^(s/2)`. At `c=1/2` the conductor exponent is `1/2−s`. No finite Euler correction or change of normalization is hidden inside this predicate.

**Checks.** For `ε=1` and `c=1/2` the balanced equation is symmetric under `s↦1−s`. Replacing ε by its negative fails for a nonzero completion with the original N. The completed zeta function, and its imaginary norm translates, have poles and fail the entire hypothesis. Removing a finite factor changes the reflected equation by the ratio of the removed primal and dual polynomials; niceness for the original data cannot be reused with unchanged ε and N without restoring those factors.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §1 Theorem 1.1, §2 and §3 Theorems 3.1, 3.3, pp.5–9; [The normalized-distribution epsilon comparison](#global-epsilon-factor) for the conductor and root-number normalization.)

*Needs:* [L-function data and derived products](#l-function-datum); [Boundedness on finite vertical strips](#bounded-on-strips); [The local Rankin–Selberg functional equation](#rs-local-functional-equation); Mathlib's identity theorem for holomorphic functions.

<a id="automorphic-l-data"></a>

**Hecke, eigensystem and Rankin–Selberg data.** Construct the following instances and their local-factor comparisons; every niceness theorem identifies its ε and N with the specified local constants, rather than merely asserting their existence.

- For a continuous unitary idele-class character ω, the Hecke datum has degree 1, unramified polynomial `1−ω_v(ϖ_v)T`, polynomial 1 at ramified finite places, and the actual archimedean character shifts and inverse-character duals. Take `c=1/2`, `N=|D_K| Norm(𝔣(ω))`, and `ε=W_H(ω)`. Prove `IsNicePinned` when ω is nontrivial on the norm-one idele-class subgroup, using [Hecke continuation and functional equation](#hecke-l-functional-equation) and the strip estimates for its Godement–Jacquet realization. Complex norm twists use translated primal and inverse-translated dual factors, with their corresponding local epsilon constants. Norm characters still define data and meromorphic completions, but are outside this entire niceness theorem.
- For a complex GL₂ eigensystem of AutomorphicFormsOnReductiveGroups §§5.8 and 7.3, together with specified archimedean parameters, admissible local representation factors at the omitted finite places and the arithmetic-to-unitary normalization exponent h, construct its character-twisted datum. In arithmetic coordinates the good-place polynomial is `1−a_vχ_v(ϖ_v)T+q_vs_vχ_v(ϖ_v)²T²`. If its arithmetic roots are α,β, the unitary roots are `q_v^(−h)α,q_v^(−h)β`; the dual roots are their inverses. Thus the datum's good polynomial is `1−a_vq_v^(−h)χ_v(ϖ_v)T+q_v^(1−2h)s_vχ_v(ϖ_v)²T²`; the dual uses the inverse character and the inverse normalization twist on the reciprocal arithmetic roots. Assign centre `1/2` after this conversion. At a good place where χ is ramified the polynomial is 1. Prove agreement with the full standard datum and `IsNicePinned` from an actual cuspidal automorphic realization, with `N=|D_K|² Norm(𝔣(Π⊗χ))` and ε the product of the standard local epsilon constants at `1/2`. An abstract eigensystem alone provides no continuation theorem; converse applications carry the pinned predicate as a hypothesis. At spherical places genericity is [the Hecke-coordinate criterion](#gl2-unramified-genericity).
- For unitary cuspidal `π,τ` of ranks n,m, the Rankin–Selberg datum `rsDatum π τ` has degree bound nm, unramified polynomial `∏_(i,j)(1−α_iβ_jT)`, all ramified local denominators, and the gamma shifts of the tensor archimedean parameter. Its dual uses `π∨,τ∨`. Take `c=1/2`, `N=|D_K|^(nm) Norm(𝔣(π×τ))`, and ε the product of pair epsilon constants at `1/2`. Prove `IsNicePinned` outside the contragredient norm-twist pole case of [Continuation and the Rankin–Selberg pole criterion](#rs-global-poles). Prove the needed strip bounds for all ranks by extending the global integral estimates to the smooth completed tensor cusp space in [Restricted tensor realizations](#restricted-tensor-realizations), then applying the local archimedean realization. These are bounds for the completed pair L-function, as in Gelbart–Shahidi; a pointwise meromorphic functional equation alone supplies no bound. This completed function, fixed by its full Euler product in a right half-plane and unique meromorphic continuation, is the canonical scalar endpoint for all-rank strip bounds. An Eisenstein/intertwining construction must identify every local normalizing factor with these integral factors and its continued scalar with this same function before transporting its estimates. The smooth completed-tensor integral estimates remain a target here for all rank gaps; their local realization uses only local gamma estimates. With poles present the bounds hold outside fixed neighborhoods of the polar points. The same datum construction applies to the generic restricted-tensor candidates in the converse theorems, where niceness is a hypothesis.

**Checks.** An odd finite-order Hecke character has its odd gamma shift and the root number fixed by the supplied Gauss-sum formula; a nonzero imaginary norm character is nontrivial but still fails entire niceness. For arithmetic GL₂ roots α,β with `a=α+β`, `qs=αβ`, the untwisted unitary dual polynomial is `1−a q^h/(qs) T+q^(2h)/(qs) T²`; at `h=1/2` this becomes `1−a/(√q s) T+s⁻¹T²`. Inverting coefficients term by term, or applying the primal normalization twist to reciprocal roots, gives the wrong polynomial. For a spherical GL₂ representation twisted by a ramified character, both finite Euler polynomials become 1 and the conductor changes. A self-pair `π×π∨` has a pole and supplies data but no `IsNicePinned`; a cuspidal pair of unequal ranks has no such pole obstruction. Equal or adjacent ranks use finite K-finite test realization, while a `GL₄×GL₂` pair uses the completed tensor realization and the same canonical completed Euler product; replacing it by the finite Dirichlet series loses the completed-function strip bound.

(Source: [Hecke continuation and functional equation](#hecke-l-functional-equation), the `n=1` case of Godement–Jacquet, for the character instance; [Cogdell, Fields lectures](#ref-cogdellfields), §§7–9, especially Lecture 9 §5, pp.72–73, for the completed-tensor integral estimates; Gelbart–Shahidi, [*Boundedness of automorphic L-functions in vertical strips*](https://doi.org/10.1090/S0894-0347-00-00351-9), JAMS 14 (2001), Theorem 4.1 and Corollary 4.2, pp.87–88; [Humphries](#ref-humphriesarch), §2.4; AutomorphicFormsOnReductiveGroups §§5.8 and 7.3 for eigensystems and normalization.)

*Needs:* [Niceness with specified root number and conductor](#pinned-niceness); [GL₂ parameter coordinates and archimedean factors](#gl2-archimedean-parameter-factors); [Hecke continuation and functional equation](#hecke-l-functional-equation); [The global standard L-function](#global-godement-jacquet); [The global Rankin–Selberg functional equation](#rs-global-functional-equation); [Archimedean realization](#rs-archimedean-realization); AutomorphicFormsOnReductiveGroups §§5.8 and 7.3; ArithmeticGaloisRepresentations §2.7 for the finite-order Hecke normalization and Gauss-sum root-number comparisons.


<a id="gln-converse-full-rank"></a>

**The `GL(n)` converse theorem with twists through rank `n−1`.** For `n≥2`, assume `IsNicePinned` with the specified local root number and conductor for every cuspidal automorphic twist of each rank `1≤m≤n−1`. Then Π is cuspidal automorphic. At `n=2` the twisting family consists of all idele-class quasicharacters. The predicate retains both the growth and archimedean hypotheses.

Work under the following hypotheses. F is a number field; `Π` is an irreducible admissible generic restricted tensor representation of `GL_n(𝔸_F)`, spherical almost everywhere, with idele-class central character and Euler products convergent in a right half-plane. Local factors, duals, additive character and archimedean conventions are fixed by AL.2–AL.3. For every indicated cuspidal twist τ require `IsNicePinned (rsDatum Π τ) ε_(Π,τ) N_(Π,τ)`, where the datum includes all places, `c=1/2`, and the specified local epsilon product is `ε_(Π,τ) N_(Π,τ)^(1/2−s)`. These are hypotheses, not consequences of automorphy of τ alone; the root number and conductor are fixed by the candidate's local factors.

**Checks.** A determinant character of `GL₃` is admissible and irreducible but nongeneric, so it is excluded. At `n=2` the entire twisting family is all idele-class quasicharacters, with completed dual entireness, vertical-strip bounds and the matching functional equation. At `n=3` the full-rank theorem requires both `GL₁` and `GL₂` cuspidal twists; dropping rank two is the separately proved reduced-rank theorem. A twist with an uncancelled pole violates niceness and cannot be passed to this converse theorem.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §2; §3 Theorem3.1, pp.5–8.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Rankin–Selberg functional equation](#rs-local-functional-equation); [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion); [Niceness with specified root number and conductor](#pinned-niceness); [Hecke, eigensystem and Rankin–Selberg data](#automorphic-l-data).


<a id="gln-converse-reduced-rank"></a>

**The `GL(n)` converse theorem with twists through rank `n−2`.** For `n≥3` and a finite set S of finite places, assume `IsNicePinned` with the specified local root number and conductor for every cuspidal twist of rank `1≤m≤n−2` unramified at S. If S is empty, `Π` is cuspidal automorphic; otherwise an automorphic representation agrees with `Π` outside S. For `n=3` these are `GL₁` twists. This theorem gives no rank-two conclusion and no highly ramified-twist variant.

Work under the following hypotheses. F is a number field; `Π` is an irreducible admissible generic restricted tensor representation of `GL_n(𝔸_F)`, spherical almost everywhere, with idele-class central character and Euler products convergent in a right half-plane. Local factors, duals, additive character and archimedean conventions are fixed by AL.2–AL.3. For every indicated cuspidal twist τ require `IsNicePinned (rsDatum Π τ) ε_(Π,τ) N_(Π,τ)`, where the datum includes all places, `c=1/2`, and the specified local epsilon product is `ε_(Π,τ) N_(Π,τ)^(1/2−s)`. These are hypotheses, not consequences of automorphy of τ alone; the root number and conductor are fixed by the candidate's local factors.

**Checks.** A determinant character of `GL₃` is excluded by genericity; it supplies no Whittaker input. At `n=3` and `S=∅` all `GL₁` twists satisfying niceness give cuspidal automorphy. Twists unramified at nonempty finite S give an automorphic representation matching outside S; neither cuspidality nor equality at S follows from this contract. `n=2` is outside the hypotheses, so an empty range `1≤m≤0` yields no `GL₂` theorem. Characters unramified at S are not the highly ramified T-family of Gelbart–Jacquet §9.2; that variant remains a separate proof obligation.

(Source: [Cogdell, converse theorems](#ref-cogdellconverse), §2; §3 Theorem3.3, pp.5–6,9.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Rankin–Selberg functional equation](#rs-local-functional-equation); [The GL(n) cuspidal Fourier expansion](#gln-fourier-expansion); [Niceness with specified root number and conductor](#pinned-niceness); [Hecke, eigensystem and Rankin–Selberg data](#automorphic-l-data).

### Curve arithmetic and the unramified pure realization

The following inputs precede the polynomial theorems. They are separate mathematical results: the formal Euler product does not entail rationality, purity or its degree formula.

<a id="curve-additive-analysis"></a>

**Curve additive analysis.** Take `K=𝔽_q(X)`, places, completions, differential residues and canonical divisors from Tau Ceti's **AlgebraicCurves**, layers 0, 4, 5, 9 and 12. Construct the completion-valued restricted-product adeles with integral local subrings, their topology and integral-volume-one product Haar measure; distinguish them from layer 4’s K-valued repartitions. Identify the curve places, completions and local units with those of ArithmeticGaloisDuality §R02.3.2. Prove the coordinate map `𝔸_Kˣ ≃ₜ* GlobalFunctionField.ideles K`, with Mathlib’s topology on units controlling both a unit and its inverse, and compatibility with local embeddings, the rational diagonal `K×` and the idele-class quotients. The valuation divisor `Σ_v ord_v(a_v)[v]` has degree equal to the supplied `ideleDegree`; its quotient by principal divisors identifies `C_K/∏_v O_v×` with `Pic(X)`, respecting degree. Use the supplied degree-surjectivity and compact degree-zero class theorems. From the principal-parts exact sequence and Riemann–Roch prove the rational diagonal is discrete and cocompact and its quotient has volume `q^(g−1)`. Use successive additive root coordinates to construct compact rational unipotent quotients and prove integration in stages, with the invariant quotient measure independent of coordinates. For nonzero `ω` and a nontrivial `ψ₀:𝔽_q→Circle`, define `ψ_v(a)=ψ₀(Tr_(k(v)/𝔽_q) res_v(aω))`. The residue theorem makes its product trivial on diagonal K. Prove its conductor is `P_v^(−n_v), n_v=ord_v(ω)`; the existing canonical-divisor degree gives `Σ_v n_v deg(v)=2g−2`. Apply the finite-level Fourier proof to these completions and prove the self-dual normalization and Schwartz/Poisson comparisons from this adelic topology and existing Riemann–Roch quotient identities. Compare the integral local Haar measures and quotient volume with these self-dual measures. The self-dual measures and global character are compatible with `ω↦aω, a∈K×`.

The `CurveAdditiveAnalysis` API supplies `residueCharacter_scale`, `fractionalIdeal_annihilator`, `conductor_degree`, `global_residue_product` and `poisson`. **Checks.** on `ℙ¹, dt` has divisor `−2∞` and the conductor-degree sum is `−2`; two simple poles have opposite traced residues, giving a trivial product phase on diagonal constants; `ω↦tω` changes each `n_v` by `ord_v(t)`, whose weighted sum is zero; a uniformizer idele at a degree-d point maps to `[v]` and has supplied degree d; a rational unit maps to a principal divisor and has degree zero; `∏_v O_v×` is the kernel of the valuation-divisor map. Prerequisites: ArithmeticGaloisDuality §R02.3.2 for the multiplicative carriers, degree and compact degree-zero quotient; AdelicAlgebraicGroups §§0.1–0.4 and 2.2–2.3 for restricted Haar products and quotient measures, AlgebraicCurves’s cited layers, SchemeAndStackFoundations, layer 3, the existing restricted-product APIs, and AL.0's compact-open Fourier proof specialized to residue characters. Sources: Lafforgue, VI §1a–§1b, pp.152–157, Theorems VI.1, VI.2, VI.6 and VI.8; Yu, §5.3.1, pp.36–38; Conrad, §§2–3, pp.2–4, divisor/Picard and class-field comparison.

<a id="rank-one-unramified-reciprocity"></a>

**Rank-one unramified reciprocity.** Finite-order unramified characters of ArithmeticGaloisDuality §R02.3.2’s idele-class group factor through the `Pic(X)` comparison of [Curve additive analysis](#curve-additive-analysis); identify them with rank-one finite-order lisse `π₁(X)`-representations with prescribed geometric-Frobenius values. Use **JacobianChallenge** A, D–F for the Picard scheme, Jacobian and Abel map `X→Pic¹`. Prove the unramified finite-cover comparison: an abelian étale covering of X comes from the compatible finite cover of `Pic¹` under that map, retaining the constant-field component. For `J=Pic⁰, Fr_q−Id` is a finite étale isogeny with kernel `J(𝔽_q)`: its differential is `−Id`, and properness and connectedness give finiteness and surjectivity. Its torsor yields the degree-zero characters; the arithmetic constant-field quotient supplies degree characters. `Pic¹` rather than a chosen rational point keeps the construction valid when `X(𝔽_q)` is empty. For the supplied arithmetic Artin map `Art_ar:C_K→G_K^ab`, require `χ(a)=ρ(Art_ar(a)⁻¹)` for every idele class a. In particular `χ(ϖ_v)=ρ(Frob_v,geom)` at each unramified place. Prove this comparison by the divisor/Abel map and local reciprocity, including the constant-field quotient; the divisor classes of closed points generate `Pic(X)`, so these local comparisons determine the unramified idele-class character globally. These identifications are inverse and commute with tensor products, duals and finite-order degree twists. This is the unramified `GLₙ` base case.

The `UnramifiedRankOneReciprocity` API gives `localPolynomial`, `tensor`, `dual`, `degreeTwist` and inverse maps. **Checks.** the trivial character gives the constant line; `λ^deg(v)` rotates the eigenvalue by `λ^deg(v)`; inverse characters give dual lines; For a nontrivial cube root of unity ζ, the degree character `χ(a)=ζ^deg(a)` has geometric-Frobenius value ζ at a degree-one place of `ℙ¹`, arithmetic-Frobenius value `ζ⁻¹`, and polynomial `1−ζT`, distinct from `1−ζ⁻¹T`. Prerequisites: ArithmeticGaloisDuality §R02.3.2’s ideles, degree and arithmetic reciprocity with local compatibility; [Curve additive analysis](#curve-additive-analysis) for the idele/divisor/Picard comparison; the cited JacobianChallenge layers, SchemeAndStackFoundations, layers 0–2 finite-étale torsors; **SchemeAndStackFoundations**, §0.29, `qPowerFrobenius` and `iteratedSchemeFrobenius` over `𝔽_q`, SchemeAndStackFoundations layer 3's Picard comparison, and the curve idele/divisor-class adapter. Sources: [Conrad, geometric class field theory](#ref-conradgeomcft), §3, Theorem 3.2, pp.3–4, specialized to zero modulus, with the `Pic¹` distinction in §2, pp.2–3; Lafforgue, Theorem VI.9, pp.158–160. General ramified class field theory is outside this construction.

<a id="function-field-analytic-converse"></a>

**Function-field local factors, multiplicity one and converse theorem.** For `K=𝔽_q(X)` and `ℓ≠char(𝔽_q)`, construct the generic smooth complex local `GLₙ` factors at every completion, including ramified inputs, using Whittaker uniqueness, the principal ideal of pair integrals and the local functional equation in Lafforgue Appendix B §1. Compare unramified Satake factors and prove normalized-induction multiplicativity. Construct the equal-characteristic local Galois-to-Weil/inertia/monodromy adapter and matching `ℓ`-adic local factors and epsilon constants, with the same residue character, geometric Frobenius and local measure. For a continuous finite-dimensional local Galois representation `ρ` over a finite extension of `ℚ_ℓ` (or `Q̄_ℓ`), with finite wild image and quasi-unipotent inertia for the Weil–Deligne adapter, use ArithmeticGaloisRepresentations §§3.1–3.3 and 3.5’s `Conductor.artinConductor ρ` and `Conductor.artinConductorNat ρ`. Prove the adapter identifies this invariant with `a(r,N)=Sw(r)+dim V−dim (ker N)^I`, using that supplier’s ramification filtration and invariant. Prove the epsilon norm-twist law `ε(D⊗|·|^s,ψ,dx)=q_v^(−(a(D)+n(ψ)dim V)s)ε(D,ψ,dx)` with this same integer, and the product formula and highly ramified-twist identities of VI.4/VI.7 and B.3. The equal-characteristic local-constant construction is a target here; ArithmeticGaloisRepresentations §2.7’s p-adic epsilon theorem is not an equal-characteristic input. In rank one prove agreement with the analytic epsilon exponent directly by local reciprocity; in higher rank the identification with an analytic conductor carries the local L/epsilon compatibility hypothesis, discharged by the ramified rank induction below. For cuspidal automorphic inputs, prove rational continuation, the pole criterion and strong multiplicity one over K from these factors and unfolding, independently of purity and the correspondence. Prove B.13: for an irreducible admissible generic restricted tensor of rank `r≥2` with central character trivial on `K×`, if its pair and dual pair L-series are polynomials satisfying the matching functional equation for every cuspidal twist of every rank `1≤r′<r` unramified at a fixed finite S, there is an automorphic representation matching it outside S; for `S=∅ it` is cuspidal. Twists can be ramified away from S. Use Fourier reconstruction in the function-field automorphic carrier, not the number-field converse targets.

**Checks.** At `r=2,S=∅` the twists are all idele-class quasicharacters; at `S≠∅` the conclusion fixes no local component at S; a nonpolynomial twist with an uncancelled pole fails B.13; a rank-two twist ramified outside S is included when `r≥3`. The zero representation has `a=0` and epsilon constant 1; the trivial line has `a=0` and norm-twist exponent `n(ψ)`. A nontrivial tame rank-one character has `Sw=0`, supplied Artin conductor and least unit modulus 1, and epsilon exponent `1+n(ψ)`. Over `𝔽_p((t))`, a nontrivial character of the Artin–Schreier extension `y^p−y=t^(−m)`, with `m>0` and p prime to m, has `Sw=m`, supplied Artin conductor and least modulus `m+1`, and epsilon exponent `m+1+n(ψ)`. These comparisons use local reciprocity and the same conductor on both sides.

(Source: Deligne, *Les constantes des équations fonctionnelles des fonctions L*, §4.5, pp.537–539, and §8.12, p.572, conductor and norm twist; Serre, *Local Fields*, Ch. IV §2 and Ch. XV §2, ramification and unit filtration; Lafforgue, VI §1a–§1c, Theorems VI.1–VI.2, Lemmas VI.4 and VI.7, pp.152–157; Appendix B, Lemma B.3, Theorems B.8–B.10 and B.13 and proof, pp.221–241; VI §1e, p.159, strong multiplicity one.)

*Needs:* ArithmeticGaloisRepresentations Layer 3, especially §§3.1–3.3 and 3.5, for the equal-characteristic Artin/Swan invariant and its integrality; ArithmeticGaloisDuality §R02.3.2 for function-field ideles, idele classes, degree and local-compatible arithmetic reciprocity; [Curve additive analysis](#curve-additive-analysis); the function-field part of [Restricted tensor realizations](#restricted-tensor-realizations); SR.1–SR.4 for smooth representations, induction and spherical parameters; EtaleCohomologyFoundations §§F.0–F.6, F.10.1–F.10.5 for scheme cohomology and local/global traces. Ramified local factor and twist comparisons are constructed before the global converse proof and before rank induction.

<a id="ramified-rank-one-reciprocity"></a>

**Ramified rank-one curve reciprocity.** For `ℓ≠char(𝔽_q)` and an effective divisor D on X, construct the generalized Picard torsor `Pic¹_D` and Jacobian `Pic⁰_D`, classifying line bundles with D-trivialization and the corresponding degree data. Construct its Abel map from X minus `supp(D)`, Lang isogeny and finite-cover comparison. For `U_D=∏_v U_v^(D_v)` with `U_v^0=O_v×`, identify the quotient of the supplied idele-class group `C_K/U_D` with the generalized divisor/Picard group, compatibly with its degree, Abel map and increase of modulus. Prove the character dictionary between its finite-order characters and rank-one finite-order `ℓ`-adic local systems on that open curve whose Artin conductor divisor is bounded by D. Require the same equation `χ(a)=ρ(Art_ar(a)⁻¹)` with ArithmeticGaloisDuality §R02.3.2’s arithmetic reciprocity, at ramified as well as unramified places. The least admissible modulus is `Σ_v Conductor.artinConductorNat(ρ_v)[v]`, using ArithmeticGaloisRepresentations Layer 3 and its unit-filtration comparison; prove agreement with the least geometric modulus. Retain the constant-field quotient, duals, all local L factors and epsilon constants from the equal-characteristic local-factor prefix. Increasing D and taking the union gives the ramified rank-one base case; its `D=0` specialization is the unramified reciprocity target.

**Checks.** `D=0` recovers `Pic¹` and the unramified character dictionary; a character nontrivial on a local principal-unit group requires a positive conductor modulus; inverse characters correspond to dual local systems, with inverse geometric-Frobenius eigenvalues; a non-real finite constant-field character retains the unramified target’s arithmetic/geometric inversion at every modulus; the wild Artin–Schreier character with break m has least coefficient `m+1` in D, so a modulus with coefficient m excludes it.

(Source: Conrad, *Geometric global class field theory*, §§1–3, Theorem 3.2, pp.1–4, arbitrary modulus and its least conductor; Lafforgue, VI.9 and proof of VI.11, pp.158–160, rank-one L/epsilon compatibility.)

*Needs:* ArithmeticGaloisDuality §R02.3.2 for the canonical idele-class quotient, degree and arithmetic reciprocity; ArithmeticGaloisRepresentations §§3.1–3.3 and 3.5 for Artin conductors and the rank-one unit-filtration comparison; [Curve additive analysis](#curve-additive-analysis) and [Rank-one unramified reciprocity](#rank-one-unramified-reciprocity) for the carrier and zero-modulus comparisons; JacobianChallenge A and D–F for the `D=0` Picard/Jacobian; SchemeAndStackFoundations finite-cover descent and AlgebraicModuliForArithmeticGeometry layers 2–5 for rigidified line bundles; SchemeAndStackFoundations §0.29 for q-power Frobenius; [Function-field local factors, multiplicity one and converse theorem](#function-field-analytic-converse), its local rank-one and product-formula prefix. Construct the generalized Jacobian and modulus conductor comparison here; ClassFieldTheory's number-field global existence theorem is not a function-field supplier.

<a id="curve-bundle-slopes"></a>

**Curve bundle slopes and Harder–Narasimhan filtrations.** For a smooth projective geometrically connected curve X over `𝔽_q`, use SchemeAndStackFoundations §3.3’s vector-bundle degree, its determinant comparison `deg(E)=deg(det E)` and exact-sequence/twist identities. Construct slope `deg(E)/rank(E)` for nonzero bundles and semistability by slopes of nonzero proper saturated subbundles. Derive the line-twist slope formula from that degree API, and prove existence and uniqueness of the saturated filtration with semistable graded bundles and strictly decreasing slopes. Its polygon joins the cumulative ranks and degrees; the truncation polygon subtracts the straight line between its endpoints.

**Checks.** A line bundle has a one-step filtration; `O(a)⊕O(b)` on `ℙ¹` with `a>b` has successive slopes a,b; `O(a)⊕O(a)` is semistable and has no canonical splitting into two line factors.

(Source: Shatz, *The decomposition and specialization of algebraic families of vector bundles*, Compositio Math.35 (1977), §§1–3, Proposition 6 and Theorem 1, pp.165–173; Lafforgue, I §1d, pp.20–21, centered polygon.)

*Needs:* AlgebraicVectorBundles L0B/L2B; AlgebraicCurves layers 5 and 9 for divisors; SchemeAndStackFoundations §3.3 for bundle degree, determinant comparison, Riemann–Roch and curve Serre duality; AlgebraicModuliForArithmeticGeometry layers 1–2.

<a id="hn-polygon-semicontinuity"></a>

**Harder–Narasimhan polygon semicontinuity.** For a vector bundle on `X×S` with S noetherian over `𝔽_q`, use the geometric fibre polygons and prove that the fibre polygon rises under specialization, takes only finitely many values locally on a finite-type parameter scheme, and is upper semicontinuous. With fixed rank and degree, the locus whose polygon lies below a prescribed bound is open. Require the vector-bundle/flat-family hypothesis, rather than applying this to arbitrary jumping-rank coherent sheaves.

**Checks.** A constant family has constant polygon; a specialization from `O⊕O` to `O(1)⊕O(−1)` raises the rank-one vertex from 0 to 1; the semistable locus is open for the straight-line bound, and need not be closed.

(Source: Shatz, §4, Theorem 3 and §5, Proposition 10 and its Corollary, pp.178–183; Lafforgue, Proposition I.3, p.21.)

*Needs:* [Curve bundle slopes and Harder–Narasimhan filtrations](#curve-bundle-slopes); SchemeAndStackFoundations flat families and relative Quot; AlgebraicModuliForArithmeticGeometry layers 1–2.

<a id="hn-bounded-truncations"></a>

**Bounded curve-bundle loci and shtuka truncations.** For fixed rank `r≥1`, degree d and a fixed upper HN polygon on X, prove boundedness of the vector bundles with that polygon bound: they occur in a finite-type family, so their open substack of `Bun_(r,d)` is of finite type. Derive a uniform lower slope bound, then a twist making every such bundle globally generated with vanishing `H¹`; present them using one finite-type Quot scheme. For shtukas use the modified-bundle degree of index `α` and its canonical polygon as in Lafforgue I §1d, prove the analogous openness and fixed-degree boundedness, then the finite-type truncation after central degree quotient. Bound the full degree/polygon data; rank alone does not imply boundedness.

**Checks.** Degree-d line bundles form the bounded `Pic^d` family; rank-two bundles `O(a)⊕O(−a)` with unbounded a escape every fixed polygon; enlarging the polygon gives an open inclusion between finite-type fixed-degree truncations, compatible with legs.

(Source: Lafforgue, I §1d, Proposition I.3 and the following fixed-degree finiteness statement, pp.20–22; Shatz, §5, pp.182–184, polygon strata; the uniform Quot presentation follows from the slope bound, curve Riemann–Roch and Serre duality.)

*Needs:* The preceding two HN targets; SchemeAndStackFoundations §3.3’s vector-bundle Riemann–Roch and curve Serre duality; SchemeAndStackFoundations §4.14, projective Quot and its universal quotient; AlgebraicModuliForArithmeticGeometry layers 1–2 and 4–5 for parameter/descent and central quotients. Construct the relative Bun stack from these Quot charts here, with its bundle-isomorphism descent.

**Two-leg unramified shtukas.** For `r≥1` and an `𝔽_q`-scheme S, the object consists of rank-r vector bundles E,E′,E″ on `X×S`, injections `E→E′` and `E″→E′` with line cokernels on the graphs of the pole and zero `S→X`, and an isomorphism `(Id_X×Frob_{q,S})*E≅E″`, using the q-power scheme Frobenius of S. Morphisms preserve this entire diagram. Construct the moduli stack and its Hecke correspondences. Its map to `X×X` is smooth of relative dimension `2r−2`. Construct the two commuting partial Frobenius maps and their total-Frobenius composition; fixed-point comparisons use legs in distinct Frobenius orbits. Quotient by the central action of a degree-one idele, then use a sufficiently convex Harder–Narasimhan polygon to obtain finite-type truncations. Construct the specific no-level compactifications, smooth and proper over `X×X` with relative normal-crossing boundary.

The `TwoLegShtuka` API includes bundle/leg projections, diagram-preserving isomorphisms, `baseChange`, central degree translation, `partialFrobenius_commute`, `hecke_comp`, `truncation_inclusion` and `boundary_rank_partition`. **Checks.** rank one has relative dimension zero and determinant recovers its moduli problem; a rank-two boundary has rank-one graded pieces; enlarging a polygon gives an open inclusion preserving leg projections. Construct the no-level compactification by iterated-bundle degeneration. Prerequisites: [HN bounded truncations](#hn-bounded-truncations); **SchemeAndStackFoundations**, §0.29, `qPowerFrobenius`, `relativeFrobenius` and `iteratedSchemeFrobenius` with their twists; **AlgebraicVectorBundles**, L0B and L2B (finite locally free sheaves and geometric bundles), SchemeAndStackFoundations, layers 1 and 3, **AlgebraicModuliForArithmeticGeometry**, layers 2–5, and IntegralHeckeAndGaloisDeterminants §3a.1 with SR.4 spherical representations and the function-field restricted tensor prerequisite for the unramified Hecke parameters. Sources: Lafforgue, Definitions I.1–I.2, pp.17–18, I §1c–§2, pp.19–27, and the no-level compactification on pp.4–6.

<a id="shtuka-leg-level-counting"></a>

**Lower-rank shtuka counting with a leg in the level.** Fix `ℓ≠char(𝔽_q)`, a rank `k≥1`, effective level divisor D and a closed point 0 in `supp(D)`. Construct Lafforgue Chapter II §1’s local-model stack of restricted shtukas with no pole on D, its models with zero at 0, and their automorphism stratification, retaining the multiplicity of 0 in D and local height `1≤h₀≤k`. For a chosen model construct the HN-truncated shtuka spaces with naïve level structures containing the zero, and the dual construction containing the pole. Quotient the model automorphisms by their connected component as prescribed there, retain the finite automorphism action, and form the central quotient by a fixed idele of nonzero degree. Construct their rational `ℓ`-adic cohomology and prove the stack-weighted fixed-point/cohomological trace calculations for the other leg outside D and Frobenius powers divisible by the closed-leg degrees and the local model height. Use these rank-k inputs, for `k<r`, for rank-r boundary strata whose degenerators meet D. Ordinary D-trivializations with both legs outside D do not provide these spaces.

**Checks.** A level supported at 0 allows the zero at 0 while the pole lies outside D; exchanging zero and pole requires the dual local model; a rank-two boundary with a rank-one degenerator in D uses the rank-one leg-in-level count rather than the ordinary off-level count.

(Source: Lafforgue, Introduction, pp.6–7; Chapter II §1, pp.33–43, especially Proposition II.4 and the following fixed-point calculation, pp.38–43.)

*Needs:* The HN targets and two-leg shtuka construction; AlgebraicModuliForArithmeticGeometry layers 2–5 for model automorphism quotients; EtaleCohomologyFoundations §§F.0–F.6, F.10.1–F.10.5 for scheme-chart cohomology and traces, with rational finite-stabilizer descent as in essential shtuka cohomology. The counting comparison uses the function-field analytic/converse prefix and the rank-k ramified correspondence when `k<r` in the induction.

<a id="normalized-scheme-ic-purity"></a>

**Normalized scheme intersection-complex purity.** Let Y be a separated finite-type scheme of pure dimension d over `𝔽_q`, let `j:U→Y` be a dense smooth open, fix `ℓ∤q` and rational `Q̄_ℓ` coefficients, and let L be a lisse sheaf on U punctually pure of integer weight w. Construct `IC⁰_Y(L)=(j_!*(L[d]))[−d]`, independently of shrinking U and restricting L. Prove that `j_!*(L[d])` is perverse and pure of weight `w+d`, and hence `IC⁰_Y(L)` is pure of weight w. For Y proper, `IHⁱ(Ȳ,L)=Hⁱ(Ȳ,IC⁰_Y(L))` is pure of weight `w+i`. For several irreducible components use the direct sum of their intermediate extensions. There is no Tate half-twist in this normalization.

Establish the mixed-perverse affine cohomology criterion and stability of each directional weight bound under perverse subquotients used in BBD §§5.2–5.3, with exact external products for the subquotient argument. Affine vanishing passes the lower bound to quotients; for subobjects the first estimate loses one weight, and the external square and integrality recover the original bound. Verdier duality supplies the upper-bound statement. After shrinking U to a dense affine open, its immersion into separated Y is affine. Apply the directional bounds to `j_!` and `Rj_*`, their perverse image and its dual, then transport back by independence of the dense open. The shift by `−d` changes weight `w+d` to w. Proper purity gives the cohomological conclusion. These scheme results precede the local-model and finite-stabilizer descent below.

**Checks.**

- For smooth proper Y and constant L, `IC⁰_Y=Q̄_ℓ` has weight zero, and `IHⁱ=Hⁱ` has weight i.
- For an irreducible proper curve with normalization `ν:ℙ¹→Y` and one split rational ordinary node, `IC⁰_Y=ν_*Q̄_ℓ` has weight zero and `IH¹=0`; ordinary `H¹=Q̄_ℓ` has weight zero and does not satisfy the weight-one conclusion.
- For a pure lisse L of weight w on a smooth curve, its perverse shift has weight `w+1`, and shifting the intermediate extension back gives weight w, including odd w without a half-twist.
- On `Spec 𝔽_q`, a two-dimensional unipotent Frobenius block with eigenvalue 1 is pure of weight zero; its invariant line and quotient have the same weight without a Frobenius-semisimplicity hypothesis.

(Source: [BBD](#ref-bbd1982), §5.2, Theorem 5.2.1 and its proof, pp.129–134; Proposition 5.3.1 and Corollary 5.3.2 with its first proof, pp.134–135; [Weil II](#ref-deligne1980), (6.2.5) b) and (6.2.6), pp.247–248.)

*Needs:* EtaleCohomologyFoundations §F.8 for perverse intermediate extension, its boundary characterization and affine vanishing, and §§F.0–F.6 for rational adic operations, duality and Künneth; DeligneWeightsAndPurity §§8.1–8.2, 8.9 and 8.11–8.12 for mixed/pure complexes, shifts, directional bounds and proper purity. The affine weight criterion, mixed-perverse subquotient bounds and exact external products needed for this proof are part of this target. For separated finite-type schemes over `𝔽_q` with rational `Q̄_ℓ` coefficients these three statements are exported from here as standalone results, so that later perverse-sheaf roadmaps consume them rather than reprove this specialization.


<a id="shtuka-intersection-comparison"></a>

**Shtuka intersection cohomology and essential comparison.** Fix `r≥1`, an effective level divisor D of arbitrary multiplicities, `ℓ≠char(𝔽_q)`, rational `ℓ`-adic coefficients and a finite-order central character. Write B=(X minus supp(D))² and `Z_p` for the proper normalized compactification of a sufficiently convex HN truncation after central degree quotient. Construct the normalized Lang-cover local model `C_D` of Lafforgue III.3a, its enlarged smooth open `C′_D` of III.3b, and the cartesian restriction diagram over the unnormalized local model. Prove that `Z_p→C_D×B` is smooth as in III.7–III.8. On each separated finite-type pure-dimensional scheme chart Y, with dense smooth open `j:Y°→Y` and dimension d, apply [Normalized scheme intersection-complex purity](#normalized-scheme-ic-purity) with constant L and `w=0`: `IC⁰_Y=(j_!*Q̄_ℓ[d])[−d]`, equal to `Q̄_ℓ` on Y° and pure of weight zero. Construct its independence of the smooth open and its descent to these local models and finite-stabilizer compactifications. Prove the smooth-pullback comparison, including dimension shifts before the normalization is removed, giving `IC⁰_(Z_p)=res*IC⁰_(C_D)`. Prove compatibility with change of scheme chart, rational finite-group invariants and the base changes of this local-model diagram; in particular identify its restriction to each geometric B-fibre with that fibre's normalized intersection complex. This asserts no arbitrary-base-change invariance of intersection complexes.

Transport the scheme theorem's weight-zero purity through these specified local-model pullback and descent comparisons. DeligneWeightsAndPurity §8.12 then gives purity of weight i of `IHⁱ(Z_(p,b))` at each closed b of B. Construct the lisse relative intersection-cohomology sheaves with these fibres and weights. The additional targets are the local-model normalization, smooth pullback, fibre identification and finite-stabilizer descent; generic scheme middle-extension purity is the preceding target. Ordinary proper cohomology and an upper weight bound alone do not supply these comparisons.

Let `U_p⊂V_p⊂Z_p` be the truncated shtuka open and the enlarged smooth open pulled back from `C′_D`. Construct the maps `Rf_(U_p)!Q̄_ℓ→Rf_(V_p)!Q̄_ℓ→Rf_(Z_p)*IC⁰_(Z_p)` by extension by zero and its adjunction map to `IC⁰_(Z_p)`. Assuming the full ramified correspondence and boundary-counting inputs in ranks strictly below r, prove that the boundary complexes in these localization triangles have r-negligible cohomology in the constituent sense specified below. Thus the kernels and cokernels of the induced degree-i maps are r-negligible, and the essential semisimplifications of `Hⁱ_c(U_p), Hⁱ_c(V_p)` and `IHⁱ(Z_p)` are identified. Prove the same negligible-kernel/cokernel assertion for truncation transitions and comparison with the limit `Hⁱ_c(Cht_D/a^ℤ)`. Construct the Hecke and partial-Frobenius cohomological correspondences on the smooth opens and prove that these identifications intertwine their actions on essential parts. The degree `2r−2` essential summand used for traces thereby inherits the intersection-cohomology purity; its concentration in that degree is proved by the counting and rank-induction argument below.

The `ShtukaIntersectionComparison` API includes `middleExtension`, `localModel_pullback`, `pure`, `essential_comp` and `equivariant` with the preceding hypotheses and normalization.

**Checks.**

- On a smooth proper fibre, the normalized scheme purity theorem gives constant `IC⁰`, so `IHⁱ` equals ordinary `Hⁱ` and has weight i.
- On an irreducible proper curve with normalization `ℙ¹` and exactly one split rational ordinary node, the normalized scheme theorem gives pure weight-zero `IC⁰`, the pushforward of the constant sheaf on `ℙ¹`, and `IH¹=0`; ordinary `H¹=Q̄_ℓ` has weight zero from its dual graph. Finite stabilizers and properness do not make its ordinary `H¹` pure of weight one.
- On a quotient chart by a finite group, rational invariants preserve the comparison and its negligible kernels and cokernels; this uses rational coefficients, including when `ℓ` divides the group order.
- A divisor with a point of multiplicity greater than one uses the normalized local model and its intersection complex without assuming a smooth resolution at that level.

(Source: Lafforgue, Introduction, pp.6–7; III.3a–III.3b, Proposition III.7, Definition III.8 and Proposition III.11, pp.72–79; VI §2a, pp.164–166, VI.15 and VI.20–VI.22, pp.168 and 175–182; Appendix A §1, pp.203–213, especially Theorem A.9, pp.212–213.)

*Needs:* [Normalized scheme intersection-complex purity](#normalized-scheme-ic-purity); the HN and two-leg shtuka targets; EtaleCohomologyFoundations §§F.0–F.6 and F.8 for rational adic operations, duality and middle extension; DeligneWeightsAndPurity §§8.11–8.12 for the weight bounds and proper purity; AlgebraicModuliForArithmeticGeometry layers 2–5 for the local-model and central quotients; [Lower-rank shtuka counting with a leg in the level](#shtuka-leg-level-counting). The lower-rank correspondence is the rank-induction hypothesis below; this comparison precedes the rank-r purity conclusion.

<a id="leveled-shtuka-rank-induction"></a>

**Leveled shtukas and ramified rank induction.** Fix `ℓ≠char(𝔽_q)` and a finite-order central character. For every `r≥1` and effective level divisor D, construct rank-r two-leg shtukas with compatible D-trivializations, legs outside `supp(D)`, their HN truncations, compactifications, boundary strata and rational `ℓ`-adic cohomology/trace descent. Retain the singular strata and use [Shtuka intersection cohomology and essential comparison](#shtuka-intersection-comparison) at arbitrary level; the smooth proper no-level compactification is not a general-level assertion. Prove the essential-cohomology and truncated counting comparisons of VI.15–VI.27 for this level, assuming the full ramified correspondence, L/epsilon compatibility and temperedness in ranks strictly below r. The resulting rank-r automorphic-to-Galois construction gives an irreducible local system on X minus `supp(D)`, finite-order determinant and weight zero, with ramification exactly at the ramified automorphic places. Apply VI.11 and B.13, together with ramified-twist stability and the `ℓ`-adic trace/product formula, to construct the reverse correspondence; prove its uniqueness using function-field strong multiplicity one and finite-cover Frobenius density. Complete the local L/epsilon comparisons of VI.9(ii) before using this rank as the input to the next rank. Induct from ramified rank one, permitting every finite level at every smaller rank and the [leg-in-level spaces and counts](#shtuka-leg-level-counting) for boundary degenerators in D, then specialize the rank-r conclusion to `D=0`. None of the induction assumptions is drawn from the later unramified polynomial conclusions.

**Checks.** Rank one at arbitrary D recovers modulus reciprocity; a lower-rank twist ramified at a place away from the two legs belongs to the induction family; `D=0` specializes to an everywhere-lisse sheaf, whereas positive-level local systems need not extend across `supp(D)`.

(Source: Lafforgue, I.13, pp.31–32; IV.7, pp.97–99, V.14/V.19, pp.133–134 and 142–150; VI.9–VI.11, pp.158–162, VI.15–VI.27, pp.168–191.)

*Needs:* The preceding function-field analytic/converse and ramified rank-one targets; [Lower-rank shtuka counting with a leg in the level](#shtuka-leg-level-counting); HN targets and two-leg shtuka construction; [Shtuka intersection cohomology and essential comparison](#shtuka-intersection-comparison) and the rational finite-stabilizer descent and essential-cohomology construction below at the stated level; EtaleCohomologyFoundations §§F.0–F.6, F.10.1–F.10.5, DeligneWeightsAndPurity DWP.0–DWP.1/DWP.5–DWP.7 and Frobenius density for finite covers from ArithmeticGaloisRepresentations §5.13. Construct every level and all lower-rank ramified inputs as part of this induction.

**Essential cohomology and local factors.** Fix `ℓ≠char(𝔽_q)`, an identification of algebraic coefficient fields in `ℂ` and `Q̄_ℓ`, and finite-order central character. Construct the rational `ℓ`-adic cohomology of these particular finite-stabilizer compactifications by descent from scheme charts; prove compatibility with finite-group invariants, Künneth, proper base change and trace. Use [Shtuka intersection cohomology and essential comparison](#shtuka-intersection-comparison) for the intersection complexes, their purity and the identification of essential parts. The rational-coefficient hypothesis makes finite-group invariants exact; ordinary cohomology of a singular proper compactification is not asserted pure. A constituent on the two-leg base is r-negligible when it is a direct summand of an external tensor product of lisse irreducibles of ranks strictly below r; retain its complement in the semisimplification.

The `EssentialShtukaCohomology` API includes the negligible summand criterion,
its stability under the commuting correspondences, the essential semisimplified
quotient, truncation comparison and boundary trace decomposition.

**Checks.**

- At `r=1` no nonzero irreducible lisse sheaf has positive rank below r, so the negligible summand is zero.
- At `r=2` an external tensor product of two rank-one lisse sheaves is negligible.
- The external tensor product of two geometrically absolutely irreducible rank-two local systems has rank four and irreducible factors of rank two in both directions, so it cannot be `r=2`-negligible. The criterion tests constituent ranks, rather than the total cohomological dimension.


Prove the proper unstable-open fixed-point comparison for these compactifications: for a correspondence generated by its dense Deligne–Mumford open part, étale first projection there and preservation of the open near its fixed points, sufficiently large compatible Frobenius iterates have stack-weighted fixed-point count equal to the alternating cohomological trace plus signed boundary-stratum traces. Local stabilization verifies the open-preservation hypothesis for the Hecke correspondences. Source: Lafforgue, Theorem IV.7, pp.97–99 and Theorem V.19, p.142 and proof pp.142–150; the no-level proper case in the remark on pp.188–189 uses this route.

Boundary strata whose degenerators meet D use the [lower-rank leg-in-level fixed-point calculations](#shtuka-leg-level-counting), together with the full ramified lower-rank correspondence. The geometric targets are negligible boundary contributions, essential cohomology concentrated in degree `2r−2` and negligible kernels/cokernels under truncation change. Its weight `2r−2` purity follows from the specified essential comparison with intersection cohomology, not from ordinary proper cohomology. Its finite-dimensional summand carries commuting Hecke and partial-Frobenius actions. Compute traces with the unramified `t=0` truncated fixed-point formula: for distinct closed legs and sufficiently large equal total Frobenius degrees S, the cuspidal term is `q^((r−1)S)` times the sum over compatible cuspidal `π` of the Hecke trace, the inverse Satake power sum at the pole and the Satake power sum at the zero. Remaining terms are lower-rank products. Construct this counting comparison by double-coset/fixed-point and parabolic constant-term calculations before the purity conclusion. Hecke traces isolate the summand. Rank induction uses the full ramified lower-rank inputs of [Leveled shtukas and ramified rank induction](#leveled-shtuka-rank-induction), the function-field converse and strong multiplicity one, local/adelic zeta analysis and this counting formula. Complete the arbitrary-level induction before specializing to no level; the later polynomial/Riemann-hypothesis conclusions supply none of these inputs.

<a id="unramified-pure-realization"></a>

The `D=0` specialization of that induction yields the **unramified pure realization theorem**: for an everywhere-unramified cuspidal `π` of `GLₙ(𝔸_K)` with finite-order central character, there is an irreducible rank-n lisse `Q̄_ℓ`-sheaf `V_π` on X, with finite-order determinant, pure of weight zero, such that its geometric-Frobenius characteristic polynomial at every closed point agrees with the unitary Satake polynomial under the chosen coefficient identification. Conversely such irreducible lisse sheaves give the corresponding unramified cusp representation; uniqueness fixes dual and degree-character comparisons, and matching Frobenius polynomials identifies tensor local factors. Tensor products need not be irreducible and no cuspidal tensor transfer is asserted. For a general unitary central character, first remove a unitary degree character to reduce to finite order, then restore that character as a Weil-sheaf twist. An arbitrary unitary complex degree character is not silently treated as a continuous `ℓ`-adic Galois character.

The `UnramifiedPureRealization` API provides `rank`, `determinant_finiteOrder`, `pure_weight_zero`, `localPolynomial`, isomorphism invariance, `dual` and `degreeTwist`. **Checks.** rank one recovers reciprocity; the trivial line gives curve zeta factors; a self-pair with one degree self-twist has `H⁰` eigenvalue 1 and `H²` eigenvalue q, while non-inertially-equivalent inputs have neither extreme group. Prerequisites: [Leveled shtukas and ramified rank induction](#leveled-shtuka-rank-induction), [Function-field local factors, multiplicity one and converse theorem](#function-field-analytic-converse), and [Shtuka intersection cohomology and essential comparison](#shtuka-intersection-comparison) with the preceding geometric constructions; SchemeAndStackFoundations layer 2 scheme cohomology, EtaleCohomologyFoundations §§F.0–F.6 and F.10.1–F.10.5 and EtaleCohomologyFoundations §0.11 (smooth trace and curve duality), with §§0.9–0.10 for cycle classes and smooth-boundary purity, all with their invertible finite coefficients, stated compactifications and rational `ℓ`-adic realization, DeligneWeightsAndPurity DWP.0–DWP.1/DWP.5–DWP.7, and the function-field automorphic realization and SR.4/IHG §3a.1 Hecke parameters. Sources: Lafforgue, Theorem I.13, pp.31–32; VI.15–VI.22, pp.168–182; VI.24–VI.27, pp.184–191; Theorems VI.9–VI.10, pp.158–159.

**Tensor cohomological determinant.** For `V=V_(π₁)⊗V_(π₂)∨`, the formal Euler series equals `∏_(i=0)^2 det(1−z Fr_q|Hⁱ(X̄,V))^((−1)^(i+1))`. The dimensions of `H⁰` and `H²` and their Frobenius eigenvalues are computed from geometric invariants, not from an assertion of rationality alone. Poincaré duality identifies `H²` with the dual invariant space twisted by `(−1)`. If `π₁` and `π₂` are not related by a unitary degree character, both extremes vanish; for a self-pair with d degree-character self-twists they give the two cyclic factors `1−zᵈ` and 1−(qz)ᵈ. The unramified Euler characteristic is `(2−2g)n₁n₂`, and purity places all `H¹` roots at `|z|=q⁻¹ᐟ²`. This proves the rationality, degree and root location used below. **Checks.** For the constant line, `H⁰` and `H²` give `1−z` and 1−qz; for two inputs unrelated by a degree character the extreme groups vanish; for d degree self-twists the extreme determinants are `1−zᵈ` and 1−(qz)ᵈ, and have different radii. Prerequisites: the pure realization, SchemeAndStackFoundations, layer 2, EtaleCohomologyFoundations §§F.4–F.6 and F.10.1–F.10.5, EtaleCohomologyFoundations §0.11 (smooth trace and curve duality), with §§0.9–0.10 for cycle classes and smooth-boundary purity, DeligneWeightsAndPurity DWP.6.4/DWP.7.8 (`ℓ≠char(𝔽_q)`, rational adic coefficients) and the native reversed characteristic polynomial. Sources: Lafforgue, Theorems VI.1–VI.2, p.153; Yu, Proposition 6.1.1, pp.42–43.


<a id="weight-facing-acceptance-suite"></a>

### The weight-facing acceptance suite

Work over `𝔽_q` with `q>1` and `ℓ≠char(𝔽_q)`, using rational `ℓ`-adic coefficients,
geometric Frobenius and the Tate convention in which `ℚ_ℓ(−1)` has weight 2.
For projective space take `N≥0`; for curve cohomology take a smooth projective
geometrically connected genus-g curve. For the semistable case take a proper
semistable curve over a trait with finite residue field. For all-extension point
counts retain the Frobenius permutation of geometric components and the pure
dimension hypothesis of DeligneWeightsAndPurity §10.2. In the cuspidal case
fix the coefficient identification and embedding `ι` of the preceding
[unramified pure realization](#unramified-pure-realization), distinguishing
finite-order central characters from general unitary degree-character twists.

The common predicates and transports must reproduce: for `0≤r≤N, H^(2r)(ℙᴺ)=ℚ_ℓ(−r)` of weight 2r, with all odd cohomology and all degrees above 2N zero (in particular `H²(ℙ⁰)=0`); `H⁰(𝔾_m)=ℚ_ℓ` of weight `0, H¹(𝔾_m)=ℚ_ℓ(−1)` of weight `2, H¹_c(𝔾_m)=ℚ_ℓ` of weight 0 and `H²_c(𝔾_m)=ℚ_ℓ(−1)` of weight 2; `H¹` of a smooth projective genus-g curve of weight 1 with reciprocal pairs `α_iα_(i+g)=q`; the finite-residue-field semistable graded weights 0,1,2; and the component-aware all-extension point count. For Yu's everywhere-unramified unitary cuspidal Rankin–Selberg inputs on a
smooth projective geometrically connected curve, use
[the unramified pure realization](#unramified-pure-realization):
finite-order central characters give integer-pure weight-zero étale lisse
realizations, using its `pure_weight_zero` API and dual/local tensor-factor compatibility.
General unitary central characters use its explicit degree-character Weil
twists and give fixed-ι weight-zero purity. Thus `ℱ₁⊗ℱ₂∨` is integer-pure of
weight zero in the finite-order case and `ι`-pure of weight zero in the general
unitary case. Apply the corresponding version of DeligneWeightsAndPurity §7.15(i) to get curve factors
of weights 0,1,2 for that embedding, which cannot cancel; a transcendental
unitary degree twist need not have algebraic eigenvalues. The correspondence, automorphic poles and functional equations are specified by their separate targets in AL.3.

**Checks.**

- For `N=0, H⁰(ℙ⁰)=ℚ_ℓ` and `H²(ℙ⁰)=0`; substituting `r=1` in the Tate-line
  identity violates its range. For every `N, H^(2N+2)(ℙᴺ)=0`.
- For `ℙ¹`, the only nonzero groups are the weight-zero constant line in degree
  zero and the weight-two line `ℚ_ℓ(−1)` in degree two.
- An unramified rank-one unitary degree character with a transcendental scalar
  b and `|ιb|=1` gives `ι`-purity of weight zero, but no integer Weil purity. Its
  curve factors still have `ι`-weights 0,1,2, so their zeros cannot cancel across degrees.
- For `𝔾_m`, ordinary `H¹` and compactly supported `H²` are `ℚ_ℓ(−1)` of
  weight 2, while ordinary `H⁰` and compactly supported `H¹` have weight 0;
  compact support changes which degree contains the constant line.
- For a smooth projective genus-g curve, `H¹` has 2g roots in reciprocal
  pairs `α_iα_(i+g)=q`, all of weight 1; for `g=0` this group is zero.
- In the semistable curve filtration, the graph, normalized-component and
  Tate-twisted graph-homology pieces have weights 0,1,2 respectively,
  including the signed Frobenius permutations on components and branches.
- For Spec `𝔽_(q²)`, the all-extension point count is two for even extension
  degree and zero for odd extension degree, retaining the component factor.

*Needs:* [DeligneWeightsAndPurity §1.7](../DeligneWeightsAndPurity/README.md#target-1-7), [DeligneWeightsAndPurity §6.4](../DeligneWeightsAndPurity/README.md#target-6-4), [DeligneWeightsAndPurity §10.1](../DeligneWeightsAndPurity/README.md#target-10-1), [DeligneWeightsAndPurity §10.3](../DeligneWeightsAndPurity/README.md#target-10-3), [DeligneWeightsAndPurity §10.2](../DeligneWeightsAndPurity/README.md#target-10-2), [EtaleCohomologyFoundations §§F.6–F.7 (cycle classes and projective-space cohomology)](../EtaleCohomologyFoundations/README.md#f6-smooth-purity-gysin-maps-and-cycle-classes), [DeligneWeightsAndPurity §1.10](../DeligneWeightsAndPurity/README.md#target-1-10), [EtaleCohomologyFoundations §§F.5–F.6 (lisse tensor–Hom and curve duality)](../EtaleCohomologyFoundations/README.md#f5-exceptional-inverse-image-and-duality), [DeligneWeightsAndPurity §7.15](../DeligneWeightsAndPurity/README.md#target-7-15), [The unramified pure realization](#unramified-pure-realization) (everywhere-unramified unitary cuspidal realizations, degree twists and tensor factors), [DeligneWeightsAndPurity §0.17](../DeligneWeightsAndPurity/README.md#target-0-17).

(Sources: [Yu](#ref-yu2023), §1 pp. 2–3, Proposition 6.1.1 pp. 42–43, §7.1 p. 64; [Weil II](#ref-deligne1980), (3.2.3), p.200.)

### Cuspidal polynomials and self-pair reciprocity


<a id="function-field-rs-euler-product"></a>

**The function-field pair Euler product.** For everywhere-unramified discrete `Π₁,Π₂` over the function field of a smooth geometrically connected projective curve `X/F_q`, define `L(Π₁×Π₂∨,z)=∏_v∏_{i,j}(1−α_{v,i}β_{v,j}^(−1)z^(deg v))^(−1)` first as a formal series with constant term1. Its rationality follows after the cuspidal/residual comparisons, rather than being part of a formal infinite-product definition.

Work under the following hypotheses. Finite field `q>1`; finite number of points of each degree; `β` nonzero.

Require the following API.

- The formal series has constant term1.
- The v factor is the determinant for `α_v⊗β_v^(−1)`, with z raised to deg v.
- For unitary `Π₂` replace inverse Satake roots by conjugates as multisets.

**Checks.**

- At degree d with `α=2,β=3` the factor is `(1−(2/3)z^d)^(−1)`.
- A degree2 place contributes first in `z²`, not z. Degree zero is excluded: `α=2, β=3, d=0` would give the constant series 3, whose constant term is not 1.
- A rank-one self-pair has local factor `(1−z^d)^(−1)`.

On native `PowerSeries ℂ`, the local product has constant coefficient 1 for positive d.
Prove its matrix-determinant comparison and the inverse-root/conjugate-root identity
when the root multisets agree. Given finiteness of the places of degree at most k,
define the global coefficient of degree k using their finite product. Prove independence
from every finite truncation containing those places and the local-to-global comparison.


(Source: [Yu](#ref-yu2023), §5.1.2 p.30, §6.1.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); AL.3 unramified pure realization and its local-factor comparison; [Restricted tensor realizations](#restricted-tensor-realizations), its finite-place function-field branch.


<a id="function-field-cuspidal-polynomial"></a>

**Cuspidal pair degrees and poles over a function field.** Let `π₁,π₂` be unitary everywhere-unramified cuspidal of ranks `n₁,n₂, g=genus X`, and write `L=P/Q` with `P(0)=Q(0)=1` and P,Q coprime. If ranks differ or `π₁,π₂` are not inertially equivalent then `Q=1` and `deg P=(2g−2)n₁n₂`. In the self-pair rank n case, with `d=|Fix(π)|`, `Q=(1−z^d)(1−(qz)^d)` and `deg P=(2g−2)n²+2d`; `ε=q^((g−1)n²)`. Unit-modulus inertial twists rotate z.

Work under the following hypotheses. Inertial equivalence means twisting by an unramified degree character; not literal equality.

(Source: [Yu](#ref-yu2023), Proposition6.1.1 and proof pp.42–43.)

*Needs:* [The function-field pair Euler product](#function-field-rs-euler-product); AL.3 unramified pure realization; AL.3 unramified pure realization and its local-factor comparison; AL.3 tensor cohomological determinant theorem.


<a id="function-field-self-pair-reflection"></a>

**The self-pair polynomial reflection.** For the self-pair numerator P above, `D=(2g−2)n²+2d, P(z)=q^(D/2)z^D` P(1/(qz)); every root has modulus `q^(−1/2)`. The `H¹` alternating pairing has similitude q and pairs Frobenius eigenvalues with product q.

Derive the reciprocal identity from the nondegenerate alternating pairing of
similitude q on `H¹`, and transport weight-one eigenvalue norms to roots of the
native reversed characteristic polynomial.

Work under the following hypotheses. Use AL.3’s unramified pure realization and tensor cohomological determinant, geometric Poincaré duality and the chosen complex embedding.

**Checks.**

- A zero-dimensional `H¹` has numerator 1 and satisfies the reciprocal identity.
- In dimension two, `P(z)=1−az+qz²` has the factor `qz²` in its reflection; replacing it by `z²` loses the pairing similitude.
- Weight-one eigenvalues give roots strictly inside the unit disc for `q>1`; weight zero would instead put the roots on its boundary.

(Source: [Yu](#ref-yu2023), Proposition6.1.1 proof p.43 and (6.2.5) p.46.)

*Needs:* [Cuspidal pair degrees and poles over a function field](#function-field-cuspidal-polynomial); AL.3 unramified pure realization and its local-factor comparison; AL.3 tensor cohomological determinant theorem.


### Open-disc indices


<a id="open-disc-zero-pole-index"></a>

**The open-disc zero–pole index.** For nonzero `P,Q∈ℂ[z]`, define `I(P/Q)=Σ_{a∈P.roots, |a|<1}1−Σ_{b∈Q.roots, |b|<1}1`, counting multiplicities. This is independent of the rational presentation, since common roots cancel. It is `N(f)−P(f)` in the open unit disc; boundary roots are excluded. Use native meromorphic divisor/order APIs for the comparison.

Work under the following hypotheses. P,Q are nonzero; the zero function is excluded and roots carry multiplicity.

Require the following API.

- PQ′=P′Q implies equal indices for nonzero denominators.
- I(fg)=I(f)+I(g) for nonzero rational functions.
- `I(1/f)=−I(f)`.
- `I(f)` equals the sum of its finite native divisor in `|z|<1`.

**Checks.**

- `I(z)=1`.
- `I(1/z)=−1`.
- `I(z−1)=0` since1 lies on the boundary.
- `I(z/z)=0`, despite a zero in each presentation polynomial.

(Source: [Yu](#ref-yu2023), Corollary6.1.2, p.43.)

*Needs:* Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicOn.divisor_fun_mul`; Mathlib `MeromorphicOn.divisor_fun_inv`.


### Whittaker conductor shifts


<a id="whittaker-conductor-shift"></a>

**Spherical Whittaker normalization at nonzero conductor.** Let `ψ_v` be trivial on `P_v^(−n_v)` but not `P_v^(−n_v−1)`, and `t_v=diag(ϖ_v^(−(n−1)n_v),…,ϖ_v^(−n_v),1)`. Then `W↦(g↦W(t_vg))` identifies the spherical `ψ_v` model with the conductor-zero `ψ_v(ϖ_v^(−n_v)·)` model. For a nonzero spherical `W, W(t_v)≠0`. For the differential-defined global character, `Σ_v n_v deg v=2g−2`.

Work under the following hypotheses. Use AL.3’s curve additive character and the canonical divisor from AlgebraicCurves, layer 12. The differential theory is supplied by AlgebraicCurves, layer 12.

(Source: [Yu](#ref-yu2023), Lemma5.3.3 proof pp.37–38.)

*Needs:* [The Whittaker realization](#whittaker-model); [The unramified Rankin–Selberg test](#rs-unramified-test); AL.3 curve additive analysis.


### Whittaker/cohomological rational comparison


<a id="rational-period-comparison"></a>

**The rational-period comparison after choosing structures.** Given the specified Whittaker and cohomological E-rational structures for a cohomological cuspidal `Π` and a permissible real-place signature `ε`, and a fixed nonzero infinity cohomology vector defining `F_Π^ε`, normalize `F_Π^ε` by `p^ε(Π)^(−1)` to preserve those structures. The period is in `C×/E×`. Scaling the infinity vector by c scales the comparison and period by c; changing rational bases changes a representative by `E×`. Write the period as `p^ε(Π,w∞)`, retaining the generator as part of its datum. For an algebraic twist `ξ` let `T_(ξ,∞)` be the cohomology isomorphism induced by Whittaker twisting and the inverse infinity coefficient twist of Raghuram–Shahidi Proposition 2.3.7. If `w_(ξ,∞)=T_(ξ,∞)w∞`, then `[p^(ε·ε_ξ)(Π⊗ξ,w_(ξ,∞))]=[G(ξ_f)^(n(n−1)/2)p^ε(Π,w∞)]`. For an independently chosen `w′_(ξ,∞)`, define the unique `a∞∈ℂ×` by `w′_(ξ,∞)=a∞T_(ξ,∞)w∞`; the right side acquires the factor `[a∞]`.

Work under the following hypotheses. Use Raghuram §2.5.2: `Π∈Coh(G_n,μ∨)` is regular algebraic cuspidal over a number field with the stated strongly pure weight. The permissible signature `ε` cuts out the one-dimensional bottom-degree archimedean cohomology line. E contains `Q(μ)` and `Q(Π_f)`; for the twist comparison enlarge E to contain the character rationality field as well. Construct the comparison and Gauss twisting theorem from the finite-part rationality target here and the ALS.5b Betti/cohomological realizations. Require their actual E-structures and both specified nonzero infinity vectors; the formula without `a∞` requires the displayed transport equality. Construct a family of nonzero generators compatible with the twisting isomorphisms and their composition, and with coefficient conjugation, for the Galois-equivariant relation. Normalize the norm-character and coefficient twists together; the algebraic unitary character comparison is that of Raghuram–Shahidi Definition 2.2.5 and Proposition 2.3.7. This conditional comparison proves no critical-value algebraicity theorem. Under `σ∈Aut(ℂ)`, use the corrected signature convention of Raghuram §2.5.2.5, not an undefined `σ ε`.

Prove that the class lies in `ℂ×/E×`, that rescaling an infinity vector rescales
a representative, and that rational changes of basis preserve the class. Construct
the unique scalar relating the chosen twisted vector to its transported generator.
Prove the algebraic twisting relation with the stated Gauss exponent and signature,
with `a∞=1` for transported generators and the explicit `a∞` factor for independent choices. Construct the quotient group of `ℂ×` by the image of `E×` and realize the following class Checks as equalities or inequalities in that group.

**Checks.**

- Over `E=ℚ`, rescaling the infinity vector by i multiplies the representative by i and changes its class; no canonical representative can ignore this choice.
- Independently rescaling only `w_(ξ,∞)` by `c∉E×` multiplies the twisted period class by [c], while `Π, ξ` and the Gauss sum stay fixed; the formula requires `a∞=c`. For `E=ℚ` and `c=i` the extra class is nontrivial.
- A rational basis rescaling by 2 changes the representative by an E-unit and preserves its class.
- At `n=1` the Gauss exponent `n(n−1)/2` is zero; at `n=2 it` is one. Squaring the Gauss sum at rank two gives the wrong twist comparison.


(Source: [Raghuram](#ref-raghuram2016), §2.5.2 pp.24–25 (2.37)–(2.39), including the signature correction in §2.5.2.5; [Raghuram–Shahidi, *On certain period relations for cusp forms on GL_n*](https://arxiv.org/abs/0707.1708), Definition 2.2.5 and its following generator convention, p.10, Proposition 2.3.7 and (2.3.8), pp.17–18.)

*Needs:* [The Whittaker realization](#whittaker-model); [The local Gauss sum 𝔤(ω, ψ)](#local-gauss-sum); [Finite-part rationality](#finite-part-rationality); **ArithmeticLocallySymmetricSpaces**, ALS.F.7, *Algebraic weights and cohomological representations at infinity*; **ArithmeticLocallySymmetricSpaces**, ALS.5b.1, *Betti, de Rham and relative Lie algebra cohomology in characteristic zero*; **ArithmeticLocallySymmetricSpaces**, ALS.5b.4, *The automorphic comparison and Franke's input*; **ArithmeticLocallySymmetricSpaces**, ALS.5b.5, *Cuspidal cohomology*.


### Examples

For `GL₂×GL₁` the exponent is `s−1/2`; in equal rank one the product-character Tate integral also needs the Schwartz factor. A degree-two place with roots 2 and 3 contributes 2/3 to the coefficient of `z²` and zero to that of z. The quotient s/s continues to 1 at zero even though totalized 0/0 equals zero.

### Dependencies

AL.0–AL.1 and the local AL.2 prefix; AL.4's determinant interpretation before the function-field suffix; SmoothRepresentationsOfLocalGroups SR.2–SR.5; the representation prerequisites here and ArithmeticLocallySymmetricSpaces ALS.F.6–F.7; AdelicAlgebraicGroups §§2.2–2.3; ArithmeticLocallySymmetricSpaces ALS.5b; AlgebraicCurves layers 0, 4, 5, 9 and 12; JacobianChallenge A and D–F; SchemeAndStackFoundations layers 0–3; AlgebraicVectorBundles L0B and L2B; AlgebraicModuliForArithmeticGeometry layers 1–5; SchemeAndStackFoundations §0.29 (scheme Frobenius); EtaleCohomologyFoundations §§F.0–F.6 and F.10.1–F.10.5; EtaleCohomologyFoundations §0.11 (smooth trace and curve duality), with §§0.9–0.10 for cycle classes and smooth-boundary purity; DeligneWeightsAndPurity DWP.0–DWP.1 and DWP.5–DWP.7, with §§0.17, 1.7, 1.10, 6.4, 7.15 and 10.1–10.3 for the weight-facing acceptance suite; EtaleCohomologyFoundations §§F.5–F.7 for that suite's duality, cycle classes and projective-space cohomology.


## Layer AL.4: Parameters and local determinant comparisons


### Satake factors and convergence


<a id="l-group-local-factor"></a>

**The unramified L-group Euler factor.** Given unramified G/F, use ReductiveGroupsPartII RG2.5.2’s Weil L-group and factor its inertia-trivial action through `W_F/I_F` to form `Ĝ ⋊ (W_F/I_F)` here. Its fibre over geometric Frobenius `Frob_v` is the Frobenius coset `Ĝ ⋊ Frob_v`. For a semisimple Satake conjugacy class t in that coset and a finite-dimensional complex representation r of this unramified L-group, `P_{t,r}(T)=det(1−T r(t))` and `L(s,t,r)=P_{t,r}(q^(−s))^(−1)`. Use native Matrix.charpolyRev for the polynomial; this target adds independence and the Satake normalization interface.

Work under the following hypotheses. Finite residue cardinality `q>1`; `r(t)` acts on a finite-dimensional space.

Require the following API.

- Conjugate Satake parameters give the same polynomial.
- `P_{r⊕r′}=P_r P_{r′}`.
- For `GL_n` standard `r, P=∏(1−α_iT)`.

**Checks.**

- The zero representation gives `P=1` and `L=1`.
- `r(t)=a` gives P=1−aT.
- Scalars `a=2,b=3` give tensor `P=1−6T`, whereas the direct sum gives `1−5T+6T²`.
- Integral Hecke roots are `q^(1/2)` times the unitary `GL₂` Satake roots.

(Source: [Borel](#ref-borel1979), §13.1 pp.49–50.)

*Needs:* **IntegralHeckeAndGaloisDeterminants**, §3a.1, Normalized Satake coefficients for GLn; Mathlib `Matrix.charpolyRev`; the conjugacy and direct-sum forms are one-line corollaries of Mathlib `Matrix.reverse_charpoly`, `Matrix.charpoly_units_conj` and `Matrix.charpoly_fromBlocks_zero₁₂` (with polynomial product reversal); **ReductiveGroupsPartII**, RG2.5.2, for the L-group whose Frobenius coset is formed here; **SmoothRepresentationsOfLocalGroups**, SR.4.


<a id="partial-l-product-convergence"></a>

**Convergence of partial automorphic Euler products.** For a unitarizable automorphic `π` and finite-dimensional r as in Borel13.2, excluding ramified places gives `L^S(s,π,r)=∏_{v∉S}P_{t_v,r}(q_v^(−s))^(−1)`, absolutely convergent for `Re(s)>c(π,r)`. No general continuation or functional equation follows for arbitrary r.

Work under the following hypotheses. Use a uniform Satake eigenvalue bound `|eigenvalue r(t_v)|≤q_v^a` and `sum_v q_v^(−σ)<∞` for `σ>1`.

(Source: [Borel](#ref-borel1979), Theorem13.2 pp.50–51.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); Tau Ceti **ArithmeticDirichletSeries**, layer 3 local factors and euler products; **SmoothRepresentationsOfLocalGroups**, SR.4.


### Weil–Deligne normalization and factor operations


<a id="local-parameter-comparison"></a>

**Transport of supplied local parameter comparisons.** For `GL_n` standard factors and `GL_n×GL_m` tensor factors, prove the unramified determinant comparison `P=det(1−T Fr)`. Use supplied ramified analytic/Weil–Deligne L- and epsilon-factor equalities as inputs and transport them through duals, arithmetic/geometric Frobenius conversion and the explicitly stated classical/Hilbert normalization shifts. For a general L-group r, retain an actual parameter and supplied ramified factor equalities; a spherical class supplies only unramified factors.

Work under the following hypotheses. At infinity use the archimedean `GLₙ` parameter target here; at finite places take the stated ramified L/epsilon equalities as hypotheses. ArithmeticGaloisRepresentations §§2.4–2.7 supplies finite-extension-of-ℚₚ factors with geometric Frobenius, reciprocity and monodromy invariants. The classical and Hilbert `GL₂` comparisons here take an actually compatible arithmetic realization, away from the coefficient prime, as an input; they neither construct that realization nor assert general finite-place compatibility. Preserve the arithmetic normalization dictionary: the classical weight-k Euler factor uses `M=ρ_f^∨` with geometric Frobenius and converts to unitary normalization by the `(k−1)/2` shift. In the cited Hilbert instance `WD(ρ_π)` corresponds to `Rec(π⊗|·|^(−1/2))`, hence `L(WD(ρ_π),s)=L(s−1/2,π)`. Neither input asserts an unshifted equality for `ρ` itself.

**Checks.** A one-dimensional unramified parameter gives `1−αT`; replacing arithmetic Frobenius by its inverse requires the corresponding eigenvalue conversion; the supplied classical weight-k comparison has the `(k−1)/2` shift, while the cited Hilbert realization has the `−1/2` shift.

(Source: [Borel](#ref-borel1979), §12.1–12.2, p.48 (conditional general parametrization; established GL_n cases distinguished).)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); [The standard local L-factor](#standard-local-l-factor); [The Rankin–Selberg local L-factor](#rs-local-factor); [Archimedean GLₙ parameters](#archimedean-gln-parameters); **ArithmeticGaloisRepresentations**, §2.4, Arithmetic Weil–Deligne adapter; **ArithmeticGaloisRepresentations**, §2.5, Local factors; **ArithmeticGaloisRepresentations**, §2.7, Local constants; AL.4 conditional classical weight-k normalization comparison; AL.4 conditional Hilbert normalization comparison.


<a id="satake-factor-operations"></a>

**Functorial operations on unramified factors.** For invertible semisimple Satake operators with eigenvalues `α_i` and `β_j`, direct sum multiplies P, tensor product has `P(T)=∏_(i,j)(1−α_iβ_jT)`, dual has `P(T)=∏_i(1−α_i^(−1)T)`, and scalar twist c has `P_c(T)=P(cT)`. Coefficient embeddings commute with these polynomial identities. State these comparisons on the native matrix and polynomial carriers. The tensor formula applies to arbitrary complex
matrices and counts eigenvalues with multiplicity; duality requires invertibility. These are factor comparisons, not
assertions of automorphic transfers.

Work under the following hypotheses. Actual L-group representations and normalized Satake classes are supplied; dual requires invertibility.

**Checks.**

- Tensoring by a line multiplies every Satake root by its scalar.
- Dualizing twice recovers the original factor for an invertible parameter.
- A zero root gives a constant factor one and cannot be inverted without the invertibility hypothesis.

(Source: [Borel](#ref-borel1979), §13.1 pp.49–50, local representation factor.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); Mathlib `Matrix.charpolyRev`.


<a id="exterior-power-transfer-comparison"></a>

**Exterior-power factors after an established transfer.** Given an established exterior-power transfer `Π^(j)` of `Π` with unramified parameter `wedge^j(t_v)`, its partial standard factor equals `∏_v∏_(I⊂{1,…,n},|I|=j)(1−(∏_(i∈I)α_(v,i))q_v^(−s))^(−1)`. For BCGP’s `H¹` decomposition into `GL_(n_i)` constituents, arithmetic shifts `are(1−n_i)/2` separately on each constituent; their exterior-power decompositions inherit those shifts.

Work under the following hypotheses. The actual exterior-square/symmetric-square transfers and any tensor transfer used must be imported from their owners; no all-rank exterior transfer is assumed.

(Source: [Borel](#ref-borel1979), §16.1, p.55, displayed L/epsilon-factor comparison; [Boxer–Calegari–Gee–Pilloni](#ref-bcgp2025), §1.8.25, p.16.)

*Needs:* [Functorial operations on unramified factors](#satake-factor-operations); [Transport of supplied local parameter comparisons](#local-parameter-comparison).


<a id="motivic-unitary-shift"></a>

**The motivic versus unitary Rankin–Selberg centre.** For pure realizations of weights `w₀,w₁` whose unramified eigenvalues are `q^(w_i/2)` times the unitary Satake roots, the motivic tensor factor at s equals the unitary Rankin–Selberg factor at `s−(w₀+w₁)/2`. In Liu’s `Sym^(n−1)H¹⊗Sym^nH¹` case the tensor weight is2n−1 and the motivic central point n corresponds to unitary1/2.

Work under the following hypotheses. Require the actual local-global identification at every place compared; do not infer motivic purity or Galois compatibility from the analytic factor.

(Source: [Liu–Tian–Xiao–Zhang–Zhu](#ref-liu2022), §1.1 pp.109–112, Rankin–Selberg motive normalization.)

*Needs:* [The unramified Rankin–Selberg test](#rs-unramified-test); [Transport of supplied local parameter comparisons](#local-parameter-comparison).


### Examples

The one-dimensional operators 2 and 3 give tensor polynomial `1−6T`; their direct sum gives `1−5T+6T²`. In rank two the integral Hecke roots are `sqrt(q)` times the unitary roots, so the linear coefficient becomes `−sqrt(q)(α₁+α₂)`. For total motivic weight `2n−1` the arithmetic centre n maps to 1/2.

### Dependencies

AL.2–AL.3 local factors; ReductiveGroupsPartII RG2.5.2 for the L-group, with its unramified Frobenius coset formed in [The unramified L-group Euler factor](#l-group-local-factor); SmoothRepresentationsOfLocalGroups SR.4; IntegralHeckeAndGaloisDeterminants §3a.1; ArithmeticGaloisRepresentations §§2.4–2.7; the archimedean representation/parameter and restricted tensor prerequisites here; completed ArithmeticDirichletSeries layer 3.


## Layer AL.5: Values, signs and finite corrections


### Imprimitive functions and leading terms


<a id="finite-euler-correction"></a>

**Finite Euler corrections at critical points.** For a finite set S and local polynomials `P_v(T)`, define `E_S(s)=∏_{v∈S}P_v(q_v^(−s))`. The imprimitive value is `L^S(s)=E_S(s)L(s)` as a meromorphic identity. It can be evaluated at `s₀` only with the relevant holomorphy/limit hypotheses.

Work under the following hypotheses. `q_v>1, P_v(0)=1`; L includes the specified archimedean normalization.

Require the following API.

- `E_∅=1`.
- For disjoint `S,T, E_{S∪T}=E_S E_T`.
- If both terms are holomorphic at `s₀, L^S(s₀)=E_S(s₀)L(s₀)`.
- `ord_{s₀}(L^S)=ord_{s₀}(E_S)+ord_{s₀}(L)`.

**Checks.**

- Removing no places preserves the value.
- If `E=1−p^(−s)`, then `E(0)=0`; division by `E(0)` cannot recover `L(0)`.
- `E=(1−p^(−s))²` has order2 at0 and `E″(0)=2(log p)²`.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §7, pp.74–75, finite-product comparison and its analytic value consequence.)

*Needs:* [The unramified L-group Euler factor](#l-group-local-factor); [Hecke continuation and functional equation](#hecke-l-functional-equation); [The Rankin–Selberg local L-factor](#rs-local-factor); Mathlib `meromorphicOrderAt_mul`.


<a id="euler-correction-leading-term"></a>

**The leading term of a finite Euler correction.** Let E and L be holomorphic near `s₀, E` have finite vanishing order m and L have finite order r. Then EL has order `m+r` and leading Taylor coefficient the product of the two leading coefficients. In particular if `E(s₀)=0, E′(s₀)≠0` and `L(s₀)≠0`, (EL)′(s₀)=E′(s₀)L(s₀). For `E(s)=1−a q^(−s)` with a `q^(−s₀)=1, E′(s₀)=log q`.

Express the finite-order conclusion through vanishing lower derivatives and the first nonzero factorial-normalized derivative, and prove the displayed logarithmic derivative of a removed Euler zero.

Work under the following hypotheses. `q>1`; zero functions require separate infinite-order cases. This is complex analytic comparison, not a p-adic exceptional-zero formula.

**Checks.**

- A simple correction zero times a nonzero L-value gives a simple product zero.
- Two simple zeros give a double zero with leading coefficient the product of the first derivatives.
- An identically zero factor has infinite vanishing order and fails the finite-order hypotheses.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §7, pp.74–75, finite-factor identity; leading term follows by analytic multiplication.)

*Needs:* [Finite Euler corrections at critical points](#finite-euler-correction); Mathlib `MeromorphicOn.divisor_fun_mul`; Mathlib `meromorphicOrderAt_mul`.

### Complex period and stabilization dictionary

The local `GL₂` comparison takes an actual holomorphic newform f over `ℚ` of weight `k+2`, a complex embedding of its coefficient field, nonzero periods `Ω⁺` and `Ω⁻` and its proved critical-value algebraicity theorem. For a primitive finite-order character `χ`, fix the convention that the analytic twist is `f⊗χ⁻¹` and the normalized value uses its primitive Gauss sum and sign `χ(−1)(−1)^j`. At `s=j+1, 0≤j≤k`, put `N=(2πi)^(j+1)Ω^sign/(G(χ)j!)`, with all factors nonzero, and require `L(f⊗χ⁻¹,j+1)/N` to belong to the chosen coefficient field enlarged by the character values. The completed value is `Γ∞(j+1)L(f⊗χ⁻¹,j+1)`, so division by `Γ∞(j+1)N` gives the same algebraic value. Conjugation acts on all coefficients, character values, Gauss sum and period representative together. This is a conditional comparison of actual complex values; it does not construct the periods or deduce algebraicity from a scalar division identity. Its critical-value hypotheses and rational period line are stated explicitly, with the classical finite and completed L-series supplied by Tau Ceti's modular L-function API. Source: Rodrigues Jacinto–Williams, Appendix B, Theorem B.1, pp.208–209, for the character, sign and conductor dictionary; the algebraicity theorem is an input. AL.3's rational-period comparison provides the cohomological period class with its specified infinity generator when those rational structures have been identified; any use of its Gauss twisting relation carries the transported-generator hypothesis or the explicit infinity comparison scalar.

For `p∤level(f)`, choose a nonzero root `α` of `X²−a(p)X+ε(p)p^(k+1)`, and put `β=ε(p)p^(k+1)/α`. Thus `α+β=a(p)` and `αβ=ε(p)p^(k+1)`. Define `a_α`, the **complex stabilization coefficient**, `a_α(n)=a(n)−β·1_(p|n)a(n/p)`, the coefficient formula for `f_α=f−βf(pz)`. Prove the coefficient identities at indices prime to p and at multiples of p, the `U_p` eigenrelation, and the factor relation

`L(f_α,χ⁻¹,s)=(1−βχ⁻¹(p)p⁻ˢ)L(f,χ⁻¹,s)`

in the absolute-convergence half-plane and then meromorphically, and compatibility with the chosen complex embedding. The coefficient adapter and its L-series reindexing identity are defined for arbitrary `β`; the `U_p`-eigenform assertion requires the Hecke-polynomial root condition above. Prove `U_p f_α=α f_α` from the good-prime Hecke recurrence. The relation uses multiplicativity of the character and absolute summability to reindex the L-series. **Checks.** `a_α(1)=a(1)` for `p>1`; at a normalized eigenform and an actual root, `a_α(p)=α`; for the weight-two level-32 form of `y²=x³−x, a(3)=0` and `ε(3)=1`: `α=1,β=3` satisfies only the product condition and gives `a_β(3)=−3`, so it is not the `α=1` refinement; if `χ` has p-power conductor greater than one, its zero-extended value at p is zero and the twisted correction equals 1. Its normalization is fixed independently of any construction of a p-adic distribution. The ordinary interpretation additionally requires `α` to be a p-adic unit; the complex formula itself is defined for any nonzero refinement. Prerequisites: the native `LSeries`/`LSeriesSummable` APIs, the modular coefficient and Hecke relations already in Tau Ceti, and AL.5's finite Euler correction. Source: Rodrigues Jacinto–Williams, Appendix B, pp.207–209, together with this coefficient reindexing argument. Substituting `s=j+1` supplies exactly the second factor of `E_p(χ,j)`; the p-level interpolation expression supplies the first.


### Critical-value and sign interfaces


<a id="critical-value-period-interface"></a>

**The critical-value and period interface.** For a holomorphic `GL₂/ℚ` cohomological cusp representation, take the nonzero period line and actual critical-value algebraicity theorem specified in the complex dictionary. At a critical point with nonzero finite archimedean gamma value, write `C=γF` and use the full nonzero normalization N from the dictionary. Given `F/N∈E`, the comparison gives `C/(γN)=F/N∈E`. Transport the identity through the chosen coefficient embedding with the primitive-character, Gauss-sum, sign and motivic/unitary conventions fixed. This conditional comparison transports the normalized value’s membership in the supplied coefficient field; the algebraicity theorem is an input.

Work under the following hypotheses. `γ≠0, N≠0, C=γF` and the actual input theorem `F/N∈E`; the critical point avoids gamma poles. The `GL₂/ℚ` algebraicity theorem fixes parity, primitive characters and Gauss sums as in the complex period dictionary above. The stated `ℚ` theorem has no general-number-field conclusion.

**Checks.** Weight two with trivial χ and `j=0` uses `N=2πiΩ⁺`; an odd χ at `j=0` uses `Ω⁻` and requires its values in the coefficient field; a zero critical L-value gives zero in both normalizations, while N and the finite gamma value remain nonzero.

(Source: [Rodrigues Jacinto–Williams](#ref-rodriguesjacintowilliams2025), AppendixB TheoremB.1 pp.207–209.)

*Needs:* [The global standard L-function](#global-godement-jacquet); [The Rankin–Selberg local L-factor](#rs-local-factor); AL.5 complex period and character dictionary.


<a id="central-sign-vanishing"></a>

**The functional-equation sign at the centre.** If the conductor-balanced completed L-function is holomorphic at1/2, self-dual, and satisfies `Λ(s)=−Λ(1−s)`, then `Λ(1/2)=0`. More generally its first nonzero Taylor term at the centre has parity determined by the root number. If the gamma value is finite and nonzero, the same vanishing order holds for the finite L-function.

Work under the following hypotheses. Self-duality identifies both sides without an extra conjugation or twisting; the root number is ±1.

(Source: [Cogdell, Fields lectures](#ref-cogdellfields), Lecture 9 §4, pp.71–72, functional equation and its central-value consequence.)

*Needs:* [Hecke continuation and functional equation](#hecke-l-functional-equation); [The global standard L-function](#global-godement-jacquet); [The local Rankin–Selberg functional equation](#rs-local-functional-equation).


### Refined GL₂ Euler factors and conductor tests


<a id="ordinary-gl2-euler-factor"></a>

**The ordinary `GL₂` interpolation factor.** For a good prime p, weight `k+2`, nebentypus `ε` and chosen nonzero refinement `α` with `β=ε(p)p^(k+1)/α`, define `E_p(χ,j)=(1−χ(p)p^j/α)(1−χ^(−1)(p)ε(p)p^(k−j)/α)`. Use the integer exponent `k−j` for every natural k,j; interpolation uses `0≤j≤k`. A ramified p-power character is extended by`χ(p)=χ^(−1)(p)=0`, so `E_p=1`. The conductor-normalized prefactor `α^(−ν)` for `condχ=p^ν` is separate.

Work under the following hypotheses. Use the complex character/period/Gauss dictionary stated in AL.5; the two-factor expression uses the good-prime newform, whereas the p-level eigenform has the first factor only.

Require the following API.

- For `ν>0` both local character values are0 and `E_p=1`.
- For `χ=1` use the displayed two-factor product.
- Changing `α` changes `β` and the Euler correction; the unrefined form alone does not determine `E_p`.
- The p-level eigenform formula has only the first factor; the primitive newform adds the second factor after the character dictionary.

**Checks.**

- `k=j=0,χ=1,ε(p)=1 gives(1−1/α)²`.
- A conductor-p character gives `E_p=1`, with the separate prefactor`α^(−1)`.
- `α=1,k=j=0` gives `E_p=0`; it cannot be canceled.
- Outside the critical range, `p=3,k=0,j=1,α=χ(p)=χ⁻¹(p)=ε(p)=1` gives `(1−3)(1−1/3)=−4/3`; truncating `k−j` to a natural number would give zero.
- For `p=3,k=j=0, ε(p)=1` and Hecke polynomial `X²+3`, the refinements `α=±i√3` are both valid roots and give distinct corrections `(1−1/α)²`.

(Source: [Rodrigues Jacinto–Williams](#ref-rodriguesjacintowilliams2025), Appendix B TheoremB.1 p.208, with input newform comparison.)

*Needs:* [Finite Euler corrections at critical points](#finite-euler-correction); AL.5 complex period and character dictionary; AL.5 complex stabilization coefficient comparison.


<a id="local-conductor-test-vector-comparison"></a>

**Conductor and test-vector compatibility.** For generic irreducible `π` of `GL_n(F)` with conductor-zero `ψ`, the degree in `q^(−s)` of the standard epsilon monomial is `c_π`, the imported generic newform conductor. The GJ normalized newform integral realizes `L(s,π)`. At a good `GL₂` place, twisting an unramified `π` by a ramified character `χ` of conductorν>0 gives `L(s,π⊗χ)=1` and conductor2ν. At rank1 it gives `L=1` and conductorν.

Work under the following hypotheses. The `GL₂` twist assertion uses an unramified generic representation; it is not a formula for arbitrary already-ramified `π`. Nonzero newform normalization and compatible measures are required.

(Source: [Atobe–Kondo–Yasuda](#ref-atobekondoyasuda2022), Introduction pp.2–3 epsilon conductor; generic-newform application.)

*Needs:* [A ramified Godement–Jacquet test vector](#godement-jacquet-newform-test); [The local Gauss sum 𝔤(ω, ψ)](#local-gauss-sum); [Transport of supplied local parameter comparisons](#local-parameter-comparison); [Generic finite-place newforms](#generic-local-newforms).


### Examples

At `s=0, 1−p^(−s)` has derivative `log(p)`, and its square has second derivative `2(log p)²`. At weight two the trivial-character correction is `(1−1/α)²`, which vanishes at `α=1`. A ramified character has zero-extended value zero at p and leaves the separate conductor factor `α^(−ν)`.

### Dependencies

AL.1–AL.4; the generic finite-place newform target; Tau Ceti's modular coefficient and L-function APIs; the actual critical-value algebraicity input with nonzero period and Gauss sum specified in AL.5.


## References

<a id="ref-bbd1982"></a>

[Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), A. A. Beilinson, J. Bernstein and P. Deligne. Astérisque 100 (1982), 5–171; §§5.2–5.3, pp.129–135.

<a id="ref-bushnellhenniart2006"></a>

The Local Langlands Conjecture for GL(2), Colin J. Bushnell and Guy Henniart. Grundlehren 335, Springer, 2006; §7.2, pp.50–51, and §9.11, p.69.

<a id="ref-casselman1973"></a>

- William Casselman, *On some results of Atkin and Lehner*, Mathematische Annalen 201 (1973), 301–314. Theorem 1, p.302; proof and Kirillov construction, pp.303–306; epsilon remark, p.307.

<a id="ref-jacquetlanglands1970"></a>

- Hervé Jacquet and Robert P. Langlands, *Automorphic Forms on `GL(2)*`, Lecture Notes in Mathematics 114 (1970), §11 following Proposition 11.1.1, p.183.


Locators above refer to these editions. Physical thesis pages and preprint page numbers are distinguished from published pagination.


<a id="ref-atobekondoyasuda2022"></a>

[Local newforms for the general linear groups over a non-archimedean local field](https://arxiv.org/pdf/2110.09070v4), Hiraku Atobe, Satoshi Kondo and Seidai Yasuda. arXiv:2110.09070v4; Forum Math.Pi10 (2022),e22.


<a id="ref-borel1979"></a>

Automorphic L-functions, Armand Borel. Corvallis II, PSPM33 (1979), 27–61; printed pagination.


<a id="ref-bcgp2025"></a>

[Modularity theorems for abelian surfaces](https://math.uchicago.edu/~fcale/papers/Modular.pdf), George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. Author manuscript corresponding to arXiv2502.20645v1.


<a id="ref-cheneviertaibi2020"></a>

[Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), Gaëtan Chenevier, Olivier Taïbi. Publ. Math. IHÉS 131 (2020), 261–323 (published online 5 March 2020); published PDF.


<a id="ref-cogdellintegrals"></a>

[L-functions and converse theorems for GL(n)](https://people.math.osu.edu/cogdell.1/columbia-www.pdf), James W. Cogdell. Author Columbia lecture notes.


<a id="ref-cogdellfields"></a>

[Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), James W. Cogdell. Author Fields Institute lecture notes, 2004.


<a id="ref-cogdellconverse"></a>

[Piatetski-Shapiro’s Work on Converse Theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), James W. Cogdell. Contemporary Mathematics survey, author PDF.


<a id="ref-dukeimamoglutoth2016"></a>

[Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), William Duke, Özlem Imamoğlu and Árpád Tóth. Annals184 (2016),949–990; published PDF.


<a id="ref-grosszagier1986"></a>

[Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Benedict H. Gross and Don B. Zagier. Inventiones84 (1986),225–320; published scan.


<a id="ref-humphriesgj"></a>

[Test vectors for nonarchimedean Godement–Jacquet zeta integrals](https://arxiv.org/pdf/1903.02031v2), Peter Humphries. arXiv:1903.02031v2.


<a id="ref-humphriesarch"></a>

[Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), Peter Humphries. arXiv:2008.12406v2.


<a id="ref-humphriesnordentoft"></a>

[Sparse equidistribution of geometric invariants of real quadratic fields](https://arxiv.org/pdf/2211.05890v2), Peter Humphries and Asbjørn Christian Nordentoft. arXiv:2211.05890v2.


<a id="ref-jacquetarch"></a>

[Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), Hervé Jacquet. Contemporary Mathematics 489 (2009), 57–172, author manuscript.


<a id="ref-kudla2004"></a>

Tate’s Thesis, Stephen S. Kudla. Chapter 6, An Introduction to the Langlands Program, Birkhäuser 2004, pp.109–131.


<a id="ref-langlands1979"></a>

[On the notion of an automorphic representation. A supplement to the preceding paper](https://doi.org/10.1090/pspum/033.1/9811), Robert P. Langlands. Corvallis I, PSPM33 (1979), 203–207; Propositions 1–2.


<a id="ref-leslie2025"></a>

[The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/pdf/1911.07907v3), Spencer Leslie. arXiv:1911.07907v3; published Annals201 (2025).


<a id="ref-liu2022"></a>

[On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu. Inventiones mathematicae 228 (2022), 107–375; published PDF.


<a id="ref-raghuram2016"></a>

[Critical values of Rankin–Selberg L-functions for GL_n×GL_(n−1) and the symmetric cube L-functions for GL₂](https://repository.ias.ac.in/105986/1/GL%28n%29xGL%28n-1%29-revised.pdf), A. Raghuram. Author revised manuscript; Forum Mathematicum28 (2016),457–489.


<a id="ref-rodriguesjacintowilliams2025"></a>

[An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Joaquín Rodrigues Jacinto and Chris Williams. Essential Number Theory4 (2025),101–216; published PDF.


<a id="ref-sarnak2004"></a>

[Nonvanishing of L-functions on Re(s)=1](https://web.math.princeton.edu/sarnak/ShalikaBday2002.pdf), Peter Sarnak. Author manuscript dated January21,2004.


<a id="ref-tate1950"></a>

[Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), John Tate. Princeton doctoral thesis, May 1950; original thesis scan, not the 1967 reprint.


<a id="ref-thornerzaman2017"></a>

[An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), Jesse Thorner and Asif Zaman. Algebra & Number Theory11 (2017), 1135–1197.


<a id="ref-yu2023"></a>

[Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Hongjie Yu. arXiv:1807.04659v5, 18 July2022.


<a id="ref-yuanzhang2018"></a>

[On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Xinyi Yuan and Shou-Wu Zhang. Annals187 (2018),533–638; published PDF.


<a id="ref-yunzhang2017"></a>

[Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), Zhiwei Yun and Wei Zhang. Annals186 (2017), 767–911; published author PDF.


<a id="ref-zhang2021"></a>

[Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), Wei Zhang. Annals 193 (2021), 863–978; published PDF.


<a id="ref-lafforgue2002"></a>

[Laurent Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands*](https://www.laurentlafforgue.org/math/fulltext.pdf), Inventiones Mathematicae 147 (2002), 1–241. The unramified pure realization uses the explicit no-level geometry, the essential-cohomology comparison and Theorems VI.9–VI.10; the curve determinant and epsilon conventions are Theorems VI.1, VI.2, VI.6 and VI.8.


<a id="ref-conradgeomcft"></a>

[Brian Conrad, *Geometric global class field theory*](https://math.stanford.edu/~conrad/249BW09Page/handouts/geomcft.pdf), Math 249B handout, pp.1–4. The zero-modulus finite-cover classification is Theorem 3.2; Pic¹ retains curves without a rational point.


<a id="ref-deligne1980"></a>

[La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Pierre Deligne. Publ. Math. IHÉS 52 (1980), 137–252; printed pagination.
