# Roadmap: nahm series, asymptotics and Habiro integrality

**Summary.** Build the arithmetic of Nahm equations, the radial asymptotics of convergent Nahm sums, and the integrality of the formal collections attached to their signed counterparts. The analytic summit is modularity implying torsion of the distinguished Bloch class. The formal summit is membership in a specified K₃-indexed Habiro module, with its coefficient extension, Frobenius action and excluded orders visible. The two routes meet through Gaussian expansions and cyclic dilogarithms, but have different input data. Explicit cubic and quartic calculations test their normalisations; comparison maps then carry actual Habiro elements to degree-zero Habiro cohomology.

## Scope and ownership

This roadmap owns Nahm-specific equations and arithmetic, convergent sums, controlled radial expansions, the modularity implication, the signed formal series, finite support of their product exponents, and their Gaussian and Habiro membership comparisons. It also owns the explicit examples and the compatibility statements that export these constructions.

The arithmetic endpoints require the HabiroNumberFields finite-Chern/cyclic and global-module contracts and the PadicHodgeRegulators local-K₃ lattice contract below. Those contracts are prerequisites, not constructions supplied by this roadmap: analytic convergence and formal admissibility are independent of them, whereas arithmetic descent, membership and cohomological exports retain them as hypotheses.

The following foundations have other owners. HabiroCyclotomicCompletions §1.1 supplies the finite and formal q-Pochhammer toolkit. GeometryOfNumbersAndQuadraticArithmetic §4.3 owns the analytic product, shift and zero divisor. QSeriesPartitionsAndMockModularForms §1.6 supplies finite-prefix limits and the finite/infinite identity, and §§2.4 and 3.3 supplies analytic evaluation and Rogers–Ramanujan identities, and §5.2 supplies the eta multiplier. PolylogarithmFunctions §§1.1–1.7 and 3.1–3.6 supplies analytic Li₂, §§5.1–5.8 supplies Bloch–Wigner values and relations, and §§6.1–6.5 supplies the interval Rogers function. K3BlochGroups §§3.1, 3.3–3.5 owns the shared integral pre-Bloch carrier, antisymmetric tensor cokernel and boundary; ColemanIntegration Layer L2 supplies their local polylogarithmic evaluation and §L2.Fb consumes those carriers; GeneralAlgebraicKTheory §§2.5–2.6 and 3.2 supplies the K-theory carriers and KTheoryFiniteLocalFields §§1.8 and 7.4 supplies finite-coefficient Chern and local reduction inputs. The integral Bloch comparisons, finite-Chern injectivity, number-field Habiro modules and local K₃ regulator lattice use the required arithmetic contracts below. HabiroCohomologyFoundations §4.21 supplies the étale Habiro–Hodge object; its q=1 completion is the q-Hodge complex. Polylogarithms §§2.1 and 2.3 owns algebraic embedding-regulator descent and its Borel normalization; HabiroRings §5.9 and §§6.1–6.6 owns the relative ring comparison, completed scalar extension and transported-line completion. K3BlochGroups §5.8 supplies the real Suslin Rogers detector. This roadmap owns its complementary projective-convention adapter in §1.5 and the Nahm trigonometric application in §2.7.

Finite-index arithmetic subgroups, rational cusps and strict widths are already available in Mathlib and Tau Ceti. The `FuchsianOrbifolds` roadmap, Layers 3–5, owns cusp charts, meromorphic descent and extension across a cusp. The `ModularForms` roadmap owns general-level modular-form geometry. Layer 3 below consumes these constructions and proves only the scalar growth comparisons needed here. It does not construct another modular curve. Gaussian measures, densities and polynomial integrability are also existing objects; `StandardDistributions`, Layers 1 and 5, owns their moment and covariance interfaces. The additions here are the algebraic Wick functional and its comparison with those measures, together with the lattice estimates specific to Nahm sums. Poisson summation for a full-rank ℤ-lattice, with the Gaussian Fourier transform it is applied to, belongs to the `ThetaSeries` roadmap (Layer 1); §2.4 consumes it and proves only the polynomial-Gaussian lattice estimate. Gauss sums of finite quadratic modules belong to Tau Ceti; §7.5 consumes them. QuantumEnvelopingAlgebras §QEA6 owns the integer upper-index symmetric Gaussian polynomial; §7.1 uses its q=v² specialisation and owns only the Nahm product identity. The shifted finite Euler–Maclaurin theorem in §2.2 allows arbitrary C^J functions and real shifts, unlike ComputationalNumberTheory §4.19a’s Hurwitz-power remainder. The ring-map reduction condition in §6.1 retains its kernel and product-algebra hypotheses, unlike the additive-subgroup p-saturation criterion in ComputationalNumberTheory §3.22.

The downstream ArithmeticQuantumTopology application owns the passage from a triangulation or knot to its topological and Chern–Simons invariants, including presentation independence. A matrix with a knot's name does not establish that passage. Neither quantum modularity nor a knot-invariant theorem is a prerequisite for the formal constructions here. The geometric Habiro cohomology application in §7.7 specifies gap:higher-habiro-comparison against the algebraic object of HabiroCohomologyFoundations §5.13; its §§6.1–6.3 delimit the analytic comparison problem and §§8.1–8.18 supply the named algebraic comparison squares; higher cohomology, analytic convergence and crystalline or prismatic comparisons remain separate interfaces.

## Conventions

Every p in a Frobenius or p-complete assertion denotes a rational prime. Root orders m are positive unless an empty finite product or the total scalar formula is explicitly being discussed. Let the coordinate set be `Fin N`; empty products and determinants are one, and empty sums are zero. An **analytic datum** consists of a symmetric positive definite real matrix A, a real vector B and a real number C. A **rational analytic datum** has rational entries in A, B and C; algebraicity, nontrivial-root phase reduction and arithmetic descent below impose this extra condition. Put

```text
Q(n) = ½ nᵀAn + B·n + C,
e(s) = exp(2πis),       q = e(τ),       Im τ > 0.
```

Every real power q^r in an analytic sum means e(rτ). It need not be a single-valued function of q. A **formal datum** is only a symmetric integral matrix A. Negative entries and singular matrices are allowed. Its coefficient field is ℚ(q), with q an indeterminate, and its augmentation variables are t₁,…,t_N. Formal assertions never acquire positivity assumptions merely to imitate an analytic integral.

Unsigned analytic equations are `1−x_i = ∏_j x_j^(A_ij)` on the open real cube. Their powers are positive real powers. Signed equations use units and integral powers, with sign `ε_i`; the formal convention is `ε_i=(−1)^(A_ii)`. For A=(3), these give respectively `x³+x−1=0` and `z³−z+1=0`, with field discriminants −31 and −23. The distinction persists throughout.

For m>0 and a fixed integer a with gcd(a,m)=1, set ζ=e(a/m). Radial analytic expansions use `τ=a/m+iε/(2πm)` and `q=ζ exp(−ε/m)`, ε→0⁺. The integer representative a is retained when Q is not integer-valued; the root ζ alone does not specify the branch. Formal expansions use `q=ζ+x=ζ exp(h)`, `h=log(1+x/ζ)`. Thus `h=−ε/m` on the radial path. Asymptotic series are interpreted additively: after removing the dominant exponential, truncation before degree K has error O(ε^K). This remains meaningful when every displayed coefficient vanishes. A normalised Gaussian bracket has value one on the constant polynomial; its covariance is the inverse of its stated quadratic matrix.

Write B_CGZ(F)=B_old(F) of K3BlochGroups §3.13: the image of the exterior-boundary cycles in the projective five-term quotient, equivalently A(F)/(A(F)∩C_ext). The intersection is essential because not every extended five-term element is an exterior-boundary cycle. Use its symbol-preserving comparison κ_old from the antisymmetric-tensor Bloch kernel, with the 2-primary kernel and cokernel of §§3.13 and 3.16; the published negative-unit convention B_new of §§3.14–3.16 is a different integral group. For |F|≥4 all three agree rationally and modulo positive odd n, with those specified comparison maps; the small-field exceptions remain those of the owner. For rational A the distinguished class is a rationalised class over F=ℚ(x); an integral class over F requires multiplication by a denominator. A coherent root field may carry an unmultiplied integral class. No operation of reducing `B(F)⊗ℚ` modulo n is used: that quotient is zero and cannot detect torsion.

For a number field K choose a nonzero positive integer Δ divisible by 6, the field discriminant, all denominators of the chosen coordinates and discriminant, and the exceptional primes required by the finite-Chern comparison. Put `R=𝒪_K[1/Δ]`. Require each z_i, 1−z_i and δ to be a unit. The square-root coefficient algebra is the full algebra

```text
B = R[T]/(δT²−1).
```

It may be a product, rather than a field. Its involution sends T to −T. A chosen component, embedding or formal branch is additional data. A theorem over B must hold on every component. The notation `H_{B,ξ}|_Δ` restricts orders to those prime to Δ; it does not silently extend the collection to all orders.

## Exact supplier contracts

The required arithmetic contracts specify the full interfaces consumed below. They are prerequisites of the build, with their hypotheses retained at each application; a contract does not assert the existence of a declaration with an invented name. The étale cohomological comparison uses the Habiro–Hodge object H(R,F), whose completion at q=1 is qHdg(R,F).

### From Mathlib

Use `Matrix.PosDef`, its Hermitian condition and `Matrix.PosDef.add_posSemidef`, positive definite diagonal matrices, and `Matrix.det`. In finite dimension `Matrix.posDef_iff_dotProduct_mulVec` identifies the matrix predicate with the strictly positive quadratic form. Use these actual carriers for analytic data and Hessians. The generated fields are `IntermediateField.adjoin`; `IntermediateField.fg_adjoin_of_finite` and `IntermediateField.essFiniteType_iff` give essential finite type for finitely generated coordinate fields. The differential argument consumes `KaehlerDifferential.D`, `KaehlerDifferential.span_range_derivation`, and `Algebra.FormallyUnramified.finite_of_free` under its essential-finite-type and formal-unramified hypotheses. Module finiteness over a field then gives algebraicity. A finite transcendence basis is not assumed to consist of the original coordinates.

Use `MvPolynomial`, its partial derivatives and `MvPolynomial.aeval`; `MvPowerSeries`, its coefficient maps and `MvPowerSeries.rescale`; `PowerSeries`, Laurent series, `RatFunc`, Laurent polynomials, cyclotomic polynomials and Möbius inversion. The multivariate logarithm and plethystic transform needed below are new augmentation-complete operations, not already supplied merely by the existence of one-variable `PowerSeries.log`.

For convergence use the generic summability and infinite-product APIs and the existing Euler function. `ModularForm.eta`, `ModularForm.multipliableLocallyUniformlyOn_eta` and `ModularForm.eta_ne_zero` provide the Euler-product bridge on the upper half-plane. Lattice sums of polynomial-Gaussian functions consume Poisson summation for a full-rank ℤ-lattice in a real inner product space, stated for Schwartz functions in Layer 1 of the `ThetaSeries` roadmap. For the coordinate lattice hℤ^N the same identity also follows from Mathlib's one-dimensional `SchwartzMap.tsum_eq_tsum_fourier`, iterated over coordinates after a justified Fubini argument. No arbitrary smooth decaying function is asserted to have an exponentially decaying Fourier transform; polynomial times Gaussian functions have the required stronger property.

`Subgroup.isArithmetic_iff_finiteIndex` applies to Γ≤SL₂(ℤ) without a congruence hypothesis. Use Mathlib `IsCusp`, `isCusp_SL2Z_iff`, `OnePoint.exists_mem_SL2`, `CuspOrbits`, and `Subgroup.strictWidthInfty`. Tau Ceti's `TauCeti.ModularForm.cuspTranslationOrbitWidth`, in `NumberTheory/ModularForms/Norm/Cusps`, is the strict T-orbit period and has a representative formula and divisibility characterisation. When −I is absent this may be twice the projective width. Weight-zero invariant functions factor through the group with −I adjoined, and that choice must be made before calling the width the local parameter's period. Use Mathlib `MeromorphicOn` and `meromorphicOrderAt` for scalar functions, not the holomorphic `ModularForm` carrier as a carrier for meromorphic functions.

### From Tau Ceti

Use Mathlib's multivariate Gaussian carrier, Tau Ceti's `TauCeti.Probability.multivariateGaussianPDFReal` and `TauCeti.Probability.multivariateGaussian_eq_withDensity` in `Probability/Distributions/Gaussian/Density`, and `TauCeti.integrable_pow_gaussianReal` and `TauCeti.integrable_eval_mul_gaussianEnvelope` in `Probability/Distributions/Gaussian/PolynomialMemLp`. The latter envelope theorem requires nonzero variance; the multivariate density theorem requires a positive definite covariance matrix. Consume `StandardDistributions` Layer 1's even central moments and vanishing odd moments and Layer 5's covariance and affine-map theorems. The Wick comparison must identify its covariance with those existing objects; it does not re-found probability theory. Finally, use the structure theorem for finitely generated abelian groups for the divisibility argument in Layer 4. For the quadratic Gauss evaluations of §7.5 use the pinned Tau Ceti library's `TauCeti.FiniteQuadraticModule.gaussSum` with `TauCeti.FiniteQuadraticModule.IsNondegenerate.gaussSum_mul_conj` (|G|²=#A for a nondegenerate module) and `TauCeti.FiniteQuadraticModule.gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical` (G=#K·G(q/K) for K in the quadratic radical), in `LinearAlgebra/FiniteBilinearModule/GaussSum`; these are present at the pinned Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

### From TauCetiRoadmap.ThetaSeries

ThetaSeries Layer 1 supplies lattice Poisson summation and the Gaussian Fourier transform for a full-rank ℤ-lattice in a finite-dimensional real inner product space, with its Haar measure and covolume.

### From TauCetiRoadmap.FuchsianOrbifolds

FuchsianOrbifolds Layers 3–5 supply quotient cusp charts and meromorphic compactification for cofinite Fuchsian groups, including the periodic holomorphic finite-principal-part criterion.

### From TauCetiRoadmap.ModularForms

ModularForms, Standing hypotheses and conventions and Layer 10A, supplies the modular-function conventions used by those charts. The scalar functions here use the native meromorphic predicates rather than a new modular-curve carrier.

### From TauCetiRoadmap.StandardDistributions

StandardDistributions Layer 1 supplies scalar Gaussian moments, and Layer 5 supplies multivariate covariance, affine transport and Wick–Isserlis moments for positive semidefinite covariance; density arguments below impose positive definiteness. The algebraic weighted Gaussian functional below extends polynomial Wick contraction to a specified filtered domain and arbitrary invertible symmetric quadratic matrices over a ℚ-algebra.

### From TauCetiRoadmap.K3BlochGroups

Consume K3BlochGroups §§3.1, 3.3–3.5 for the shared pre-Bloch carrier, antisymmetric tensor cokernel and boundary; §§3.13–3.16 for B_CGZ=B_old, B_new and their exact integral convention maps; Layer 4 for the Suslin comparison; and §6.1 for finite relation witnesses. ColemanIntegration §L2.Fb evaluates on these supplied carriers. The additional arithmetic comparison contract (gap:integral-bloch-comparisons) requires rational restriction injectivity and rational regulator injectivity modulo torsion, retaining the 2- and 6-primary convention errors (CGZ §§1–2). GeneralAlgebraicKTheory §§2.5–2.6 and 3.2 supplies the K-theory carrier. PolylogarithmFunctions §§5.1–5.8 supplies the analytic five-term relations. From Polylogarithms §2.1 consume blochWignerDesc and weightTwoRegulator, and from §2.3 their Borel-normalisation comparison weightTwoRegulator_borel. The additional rational injectivity assertions remain in this gap; the normalization comparison alone does not imply injectivity.

### From TauCetiRoadmap.PolylogarithmFunctions

PolylogarithmFunctions §§1.1–1.7 and 3.1–3.6 supplies analytic Li₂ and distribution, §§5.1–5.8 supplies Bloch–Wigner values and relations, and §§6.1–6.5 supplies the interval Rogers function. The Rogers convention used here is the complementary one:

```text
L_CGZ(x) = π²/6 − Li₂(x) − ½ log(x)log(1−x),   0<x<1.
```

Use the real detector of K3BlochGroups §5.8, its negation and reduction of the period to π²/2 for the projective adapter in §1.5 using CGZ (42); prove the trigonometric sum in §2.7. PolylogarithmFunctions supplies only the interval Rogers function, with the increasing convention. A real-valued expression cannot be divided by a rational denominator in a circle-valued target without an additional lift.

### From TauCetiRoadmap.Polylogarithms

From Polylogarithms §2.1 consume blochWignerDesc and weightTwoRegulator, and from §2.3 weightTwoRegulator_borel, with its Borel normalisation. Section 1.5 evaluates that supplied descended regulator on the Nahm class. Rational injectivity and integral convention transport retain the integral-comparison contract; the Borel-normalisation comparison alone does not imply injectivity.

### From TauCetiRoadmap.HabiroNumberFields

The finite-Chern and cyclic-dilogarithm contract (gap:finite-chern-cyclic) has two distinct arithmetic interfaces. Generic finite-Chern injectivity requires a good-order integer `M_K=6|disc K|·|K₂(𝒪_K)|`, or the precisely equivalent exceptional integer furnished there, and an injective finite Chern map on integral K₃/Bloch classes modulo n when n is prime to M_K. Keep any roots-of-unity restriction in its statement. The same contract requires the cyclic product

```text
D_ζ(w) = ∏_{r=1}^{m−1}(1−ζ^r w)^r,
D_ζ(ζw)/D_ζ(w) = (1−w)^m/(1−w^m),
```

its distribution and root-change identities, the cyclic five-term relation and its comparison with finite Chern classes. The fractional-power product sometimes also denoted D is `D_ζ(w)^(1/m)` with specified factor logarithms. These two meanings must not be interchanged. The Kashaev–Mangazeev–Stroganov identity is required from that owner with a proof independent of this roadmap. Cyclic descent and the five-term map R_ζ instead require gcd(n,w_F)=1 and n invertible in F, where w_F is the number of roots of unity in F; they do not require gcd(n,M_F)=1 (CGZ Proposition 2.5, Theorem 2.11, pp. 11–15). The special cyclotomic torsion interface additionally requires the prime-power reduction and injectivity on the relevant n-primary cyclotomic torsion used in CGZ Lemmas 5.1 and 5.3 and Theorem 5.2, pp. 26–28, with the K3BlochGroups §§3.13–3.16 convention maps. Section 2.7 defines the particular trigonometric class and proves its scaling and Nahm-class identities using this interface. Its analytic acceptance calculation is an application here and supplies no reverse dependency.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

From GeometryOfNumbersAndQuadraticArithmetic §4.3 consume qPochhammer, its analytic shift and zero divisor.

### From TauCetiRoadmap.HabiroCyclotomicCompletions

From HabiroCyclotomicCompletions §1.1 consume QToolkit.pochhammer, pochhammerInf, reciprocalPochhammer, qBinomialSeries and integralPochhammerInf, with their finite shift, scalar-change, Euler and formal binomial identities.

### From TauCetiRoadmap.QSeriesPartitionsAndMockModularForms

From QSeriesPartitionsAndMockModularForms §1.6 consume locally uniform finite-prefix convergence on ℂ×{|q|<1} and the finite-prefix/tail identity, dividing only by a nonzero tail. Consume §2.4 for analytic binomial/Euler evaluation, §3.3 for Rogers–Ramanujan and §5.2 for the normalized eta multiplier, and §3.1 for the signed lower-index Gaussian adapter. This adapter does not include negative upper indices.

What QSeriesPartitionsAndMockModularForms must provide (gap:qseries-root-modularity): extensions of §§3.1, 3.3 and 5.2 giving general q-Lucas evaluation, the Andrews–Gordon identities in the Nahm-matrix normalisation of §2.7, and all-cusp modular theta-quotient transformations of the normalized Rogers–Ramanujan functions. These are additional contracts, not assertions that those sections state them. The root-of-unity applications are CGZ §7.2 and GSWZ Example 4.5. QuantumEnvelopingAlgebras §QEA6 supplies the integer upper-index Laurent-polynomial extension in its symmetric parameter; §7.1 uses its standard Gaussian normalisation.

### From TauCetiRoadmap.QuantumEnvelopingAlgebras

From QuantumEnvelopingAlgebras §QEA6 consume the Laurent-polynomial extension of the symmetric Gaussian binomial to integer upper index r and natural lower index k. In the Laurent indeterminate v, q=v² and the standard Gaussian coefficient is v^(k(r−k)) times the symmetric one. This injective change of parameter identifies the quotient in §7.1 and its Laurent integrality, including negative upper indices. Its root-of-unity Lucas theorem retains the stated odd-order hypotheses; the all-order standard-parameter extension remains in gap:qseries-root-modularity. No quantum group or quantum Frobenius theorem is an input.

### Number-field module contract

The HabiroNumberFields module contract (gap:habiro-modules-descent) requires Taylor maps at roots of unity, Frobenius-twisted p-adic gluing, restriction to good orders, local principal modules with their regulator exponential, multiplication, inversion of q, and the tensor isomorphism `H_ξ⊗H_η≃H_{ξ+η}`. HabiroRings §§6.1–6.2 transports these supplied lines along R→B and its full p-completion, including all components. Coherent pullback along the involution T↦−T supplies its compatibility, since this involution fixes R; replacing B by a preferred square root is not a substitute. The local generator criterion must impose integrality of its linear coefficient as well as its constant unit. Constant terms can cancel in sums of local generators, so an arbitrary module element need not be a generator.

### From TauCetiRoadmap.QWittVectors

From QWittVectors §6.1, Completed étale Frobenius, consume the unique continuous ψ_p-semilinear lift, its reduction law and naturality for maps of étale algebras over a fixed perfectly covered Λ-base. For a change f:A→A′ of base, require f∘ψ_p=ψ′_p∘f on p-completions; formal étale uniqueness then gives the coefficient-algebra square. This is the completed-frobenius-base-naturality contract required by HabiroRings, Exact supplier contracts, rather than naturality for an arbitrary specialisation. For the Laurent base with ψ_p(t_i^(1/m))=t_i^(p/m), verify perfect coverage using its Layer 1 and §2.4; §6.2 supplies only the cyclotomic completed overlaps.

### From TauCetiRoadmap.HabiroRings

From HabiroRings §5.9 consume the ℤ[q]-algebra comparison `κ_R:H_{R/ℤ}≃H_R`, preserving root values, Taylor expansions and completed Frobenius. From §§6.1–6.2 consume completed scalar extension along morphisms of pairs and transport of the supplied K₃-indexed lines; from §§6.3–6.6 the q−1 completion map and triviality of the completed Picard class, with their global descent, tensor and integral first-fibre hypotheses. Arithmetic Frobenius prevents an untwisted R-algebra interpretation.

### From TauCetiRoadmap.HabiroCohomologyFoundations

From HabiroCohomologyFoundations §4.21 consume the natural equivalence `d_R:H(R,F)≃H_{R/ℤ}` for an étale algebra R over the perfectly covered base ℤ and its empty-frame q-Hodge pair F. Both objects are concentrated in degree zero. The equivalence preserves the unit and every cyclotomic partial-completion projection and identifies their q=1 completion maps to R[[q-1]]. The completed object is qHdg(R,F)=R[[q-1]]; it is distinct from H(R,F). For R=𝒪_K[1/Δ] and finite étale coefficient algebras B/R, use HabiroRings §5.9 to identify the relative ring with the arithmetic ring, retaining all root factors (Wagner Corollary 3.13, printed p. 41).

### From TauCetiRoadmap.ColemanIntegration

From ColemanIntegration Layer L2 consume Coleman Li₂, the Iwasawa logarithm with log(−1)=0, reflection and distribution identities and integral modified polylogarithms. Its §L2.Fb evaluates on K3BlochGroups §§3.1, 3.3–3.5’s pre-Bloch carrier and boundary, with their aliases and field maps; it supplies no second algebraic carrier.

### From TauCetiRoadmap.PadicHodgeRegulators

What PadicHodgeRegulators must provide (gap:local-k3-regulator): the integral local K₃ regulator lattice at unramified p>3, its comparison with that Bloch presentation and its root-of-unity generation (GSWZ Lemma 3.1 and Theorem 9, pp. 37–39). In particular the convention must give `Li₂(z)+Li₂(1−z)=−log z log(1−z)` and the sign in Layer 6. These are local regulator inputs. No global p-adic Hodge comparison or higher cohomology theorem is used to prove membership of a scalar Nahm collection.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

From GeneralAlgebraicKTheory §§2.5–2.6 and 3.2, the exact-category K-theory and field K-group constructions are used without a second carrier.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

From KTheoryFiniteLocalFields §§1.8 and 7.4 consume the finite-coefficient Chern and local reduction inputs with their coefficient restrictions.

### From TauCetiRoadmap.ArithmeticKTheory

From ArithmeticKTheory §3.4 consume finiteness of K₂(𝒪_K) for every number field K and define k_K as its finite cardinality. The finite-Chern exceptional integer using this input belongs to the HabiroNumberFields finite-Chern contract (CGZ Theorem 1.2 and Remark 1.4, p. 3; CGZ line 112). No numerical tame-kernel order is assumed in §7.3.

### Higher cohomological comparison

The comparison target of §7.7 (gap:higher-habiro-comparison) uses the algebraic object of HabiroCohomologyFoundations §5.13 and the particular comparison squares of §§8.1–8.18 to construct the map from GW’s affine top-form classes in their actual degree, with the root completions, Frobenius, analytic-radius and base-change hypotheses of §7.7 (GW Theorem 1.18). This is not an input to scalar membership.

## How to read the build

Layer 1 builds the equations, fields and classes. Layer 2 supplies analytic radial expansions, distinguishing the analytic estimate from its arithmetic descent. Layer 3 isolates the small amount of cusp analysis needed by Layer 4, which proves modularity implies torsion. Layer 5 starts independently from an integral symmetric matrix and constructs admissible formal series and Gaussian comparisons. Layer 6 proves their Frobenius and Habiro membership assertions, including the full coefficient-algebra and gluing requirements. Layer 7 computes examples and states exact exports. A named comparison with an additional arithmetic or small-prime hypothesis is used only with that hypothesis; neither finite coefficient checks nor a formal branch are replacements for it.

## Layer 1: Nahm equations, fields and Bloch classes

### 1.1 Analytic and formal data

Define `NahmDatum`, the formal datum and `quadraticExponent` by the conventions above. Supply extensionality by matrix, vector and constant entries, simultaneous permutation of coordinates, and block-diagonal sum. A positive definite formal matrix gives an analytic datum with B=C=0; the map is injective on such matrices, and there is no coercion for a singular formal matrix. Real analytic data and their rational specialization are distinguished in GZ Remark 3.2, p. 6; the rational/formal distinction is CGZ §7.1, pp. 34–35 and GSWZ §1.6, pp. 11–12. *Needs:* Mathlib matrices and positive definiteness.

For rational analytic data define the denominator predicate on Q,d by `d>0` and `dQ(ℤ^N)⊂ℤ`. Define the strong-period predicate on Q,D by `D>0` and invariance of Q modulo ℤ under coordinatewise congruence modulo D. Prove existence and stability under positive multiples. For every rational matrix A, without symmetry, 2d is a strong period when d is a denominator of its quadratic function; the function depends only on (A+Aᵀ)/2. The constant C does not affect the strong-period condition. The Gauss-sum construction later additionally requires D to be divisible by a denominator, since it reduces rational numbers modulo D. A strong period alone does not imply this divisibility (GZ §3, before (16), p. 5). These predicates have membership, multiple, permutation and block-sum APIs.

For the analytic data, use the following API (GZ Remark 3.2, p. 6).

- Equality is entrywise equality of A, B and C; simultaneous coordinate permutations preserve symmetry and positivity.
- Block sum adds the two quadratic exponents, and its matrix is positive definite precisely when both blocks are.

**Checks.**

- A=1, B=C=0 gives Q(0)=0 and Q(2)=2; changing C to 3 gives Q(0)=3 and Q(2)=5, so C is retained.
- A=√2 gives Q(1)=1/√2>0 and is accepted over ℝ; a rational-only carrier rejects this datum.
- The all-ones 2×2 matrix gives (1,−1)ᵀA(1,−1)=0 and is rejected, while the 2×2 identity gives 2 and is accepted.

For the formal data, use the following API (GSWZ (31), p. 12).

- Every symmetric integral matrix is admitted, including negative and singular matrices; coordinate permutations and block sums preserve this condition.
- For a positive definite formal matrix the analytic interpretation with B=C=0 recovers the same matrix.

**Checks.**

- A=−1 is symmetric and is accepted; its value at n=2 is nᵀAn=−4, so positivity is not imposed.
- The all-ones 2×2 matrix is symmetric with determinant 0 and remains valid formal data.
- The matrix ((0,1),(0,0)) differs from its transpose at (1,2), and its exponent numerator at (1,1) is 1; it is rejected.

For the quadratic exponent, use the following API (CGZ (40), p. 34).

- For integer n the value is half the quadratic term plus B·n+C, with the constant and linear shifts explicit.
- Simultaneous permutations preserve the value; a block sum gives the sum of the two exponents.

**Checks.**

- A=2, B=1, C=11/60 gives Q(0)=11/60 and Q(1)=131/60; omitting B gives 71/60 at one.
- With no coordinates and C=3/2, the value is 3/2; an empty-sum convention that loses C gives zero.
- A=((0,1),(0,0)), B=C=0 and n=(1,2) give Q=1; its symmetrisation gives the same 1, while A+Aᵀ gives 2.

For the quadratic denominator, use the following API (GZ §3 before (16), p. 5).

- A denominator d is positive and makes dQ integer-valued on every integer tuple; a positive multiple of d is a denominator.
- Coordinate permutations preserve denominators; a common denominator works for a block sum.

**Checks.**

- For Q=n²/4 and n=1, 4Q=1 is integral whereas 2Q=1/2 is not; 4 is accepted and 2 rejected.
- For Q=n², d=1 and d=2 give values 1 and 2 at n=1; both are accepted, so minimality is not required.
- For rank zero Q=3/2, d=2 gives 3 and d=1 gives 3/2; d=0 is rejected despite 0Q=0.

For the strong period, use the following API (GZ §3 before (16), p. 5).

- A strong period D is positive and makes Q(n+Du)−Q(n) integral for all integer n,u; positive multiples and coordinate permutations preserve it.
- If d is a denominator, 2d is a strong period; the conclusion uses only the symmetric part of A.

**Checks.**

- For Q=n²/4, Q(n+2)−Q(n)=n+1 is integral, while Q(1)−Q(0)=1/4 is not; period 2 is accepted and 1 rejected.
- For Q=n/2, a shift by 2 gives difference 1 and a shift by 1 gives 1/2; the constant C cancels.
- For constant Q=1/2, period 1 gives difference 0 although it does not clear Q; period 0 is excluded by positivity.

**Checks.**

- Computes `60Q(n)=60n²−1` for A=2, B=0, C=−1/60; the second datum has `60Q(n)=60n²+60n+11`. Changing C changes the series.
- Accepts the 2×2 all-ones matrix as formal data and rejects it as analytic data: the vector (1,−1) has quadratic value zero.
- Accepts A=√2, B=C=0 as analytic data: Q(n)=n²/√2 and Q(1)=1/√2. It is outside rational analytic data and carries no rational-denominator assertion.
- Accepts A=(3/2) and `A=((3/2,1/2),(1/2,3/2))`, whose eigenvalues are 1 and 2, and does not identify either with an integral formal datum.
- Uses Q(n)=n²/4. Its least denominator is 4, while `Q(n+2)−Q(n)=n+1`, so 2 is strong. This rejects a Gauss-sum reduction justified only by strong periodicity.
- Accepts d=4 and rejects d=2 for Q=n²/4, rejects d=0 for every Q, and accepts both d=1 and d=2 for Q=n². For the strong-period predicate Q=n/2 has period 2 and not 1; D=0 is excluded even for a constant.
- Gives Q=C in rank zero: C=3/2 has denominator 2, while C=1/2 admits strong period 1. Thus a strong period need not clear the constant.
- The integral matrix ((0,1),(0,0)) is not formal data. Symmetry fails, and at n=(1,1) the numerator nᵀAn+diag(A)·n equals 1, so the formal exponent of §5.2 would not be an integer.

### 1.2 Equations, solutions and the discriminant

Define `NahmEq A x` on the open real cube and the signed Nahm predicate A ε z on `(Rˣ)^N` for a commutative ring R. The latter is the equality `1−z_i=ε_i∏z_j^(A_ij)` in R, with ε_i∈{1,−1}; an arbitrary unit vector is harmless for the functorial predicate, while assertions about the formal convention specialise it to `(−1)^(A_ii)`. Prove permutation covariance of NahmEq, coefficient-map naturality of the signed Nahm predicate, identity and composition laws, and agreement with positive real integer powers when ε=1. Even diagonal entries make the formal and unsigned systems agree. Unit coordinates force 1−z_i to be a unit. Negative exponents are legitimate only on units (CGZ (41), p. 35; GSWZ (34), (41), pp. 13–14).

For a signed solution define the Nahm discriminant by

```text
δ_A(z) = (∏_j z_j^(−A_jj)) det(diag(1−z) A + diag(z)).
```

Over a field this formula defines the Nahm discriminant on arbitrary coordinate tuples using totalised integer powers; its arithmetic uses require units. Over a commutative ring use the inverses of the given unit coordinates for the corresponding ring-valued discriminant. Define NondegenerateNahmSolution to bundle the solution and the assertion that δ is a unit, or nonzero over a field. Supply the coordinate ring obtained by adjoining z_i and their inverses and inverting δ, its evaluation homomorphism at each solution, base change, and compatibility with coordinate permutations. The square-root extension belongs to Layer 6. Prove that δ differs from the Laurent Jacobian determinant by an explicit product of units; this is the nondegeneracy criterion, not an assumption that an algebraic zero is automatically simple (GSWZ (36), p. 13, and the hypotheses before Theorem 5, p. 14).

For real positive definite A prove `existsUnique_nahmEq`. One route minimises
`½sᵀAs+∑Li₂(exp(−s_i))` on the closed positive orthant. It is coercive; the inward derivative at a zero coordinate is −∞, so a minimum is interior. Its Hessian `A+diag(1/(exp(s_i)−1))` is positive definite, and strict convexity gives uniqueness. Establish the required multivariate strict-convexity consequence on this convex domain rather than citing an unavailable generic Hessian theorem. At the solution set `H=A+diag(x/(1−x))`; prove H positive definite and det H>0 (Vlasenko–Zwegers, Lemma 2.1, p. 2; CGZ §7.1(ii), pp. 35–36). Existence is valid for real A; only algebraicity requires rational entries.

For the unsigned Nahm equations, use the following API (VZ Lemma 2.1, p. 2; CGZ (41), p. 35).

- The predicate includes every open-cube inequality and uses positive real powers; it is covariant under simultaneous coordinate permutations.
- For positive definite real A there is exactly one solution, and its H has positive determinant.

**Checks.**

- A=1, x=1/2 gives 1−x=1/2=x; x=0 gives 1≠0, and x=1 gives 0≠1.
- A=2 and x=(√5−1)/2 give both sides (3−√5)/2; reversing the complement would give x instead.
- The empty tuple satisfies every equation and inequality, and the empty H has determinant 1; no coordinate is invented.

For the signed Nahm equations, use the following API (GSWZ (34), (41), pp. 13–14).

- Coordinates and signs are units, so every integer power and every 1−z coordinate is a unit.
- Unital coefficient maps preserve the equations, with identity and composition laws; even diagonal entries give the unsigned sign.

**Checks.**

- For A=3 over 𝔽₅, z=3 gives 1−3=3 and −3³=3; using the unsigned sign gives 2 and fails.
- For A=2 over 𝔽₅, z=2 gives 1−2=4=2²; odd-diagonal sign reversal would give 1.
- For A=−1 and z=2 in ℚ, 1−z=−1 whereas −z⁻¹=−1/2; this unit tuple is a non-example. In the zero ring the unique tuple satisfies the equality 0=0.

For the Nahm discriminant and nondegenerate solution, use the following API (GSWZ (36), p. 13).

- The discriminant uses the displayed determinant and unit coordinate powers; it commutes with coefficient maps and permutations.
- A nondegenerate solution requires this element to be a unit; evaluation of the localised coordinate ring exists exactly with the stated inverse images.

**Checks.**

- For A=2,z=2 over 𝔽₅, δ=z⁻²(2−z)=0, so a solution can fail nondegeneracy.
- For A=2 at the golden real solution, δ=(5+√5)/2>0; replacing δ by det A=2 gives a different value.
- In rank zero the determinant and coordinate product are 1, hence δ=1; over the zero ring 0=1 is a unit, while a field-valued δ=0 is rejected.

**Checks.**

- Has A=2 and x=(√5−1)/2, with `1−x=x²` and 0<x<1. At A=1 the unsigned solution is 1/2.
- Compares the two cubics for A=3. Over 𝔽₅ the unsigned A=2 equation has the unit root 2, whereas the signed A=3 equation has the unit root 3. Neither statement identifies their characteristic-zero fields.
- Rejects x_i=0 or 1 in `NahmEq`. The formal signed equation at A=1 and t=1 has no solution over a nonzero ring; its formal deformation does have a solution near t=0.
- Gives `δ=z^(−3)(3−2z)` for A=3. For the 2×2 all-ones matrix and z₁=z₂=z it gives `(2−z)/z`.
- Gives the unique empty tuple, H of size zero, determinant one and δ=1. Thus positivity of the critical value later requires N>0.
- At A=2,z=2 over 𝔽₅ satisfies the equation but has δ=z⁻²(2−z)=0. Thus an algebraic solution need not be nondegenerate, especially after reduction.
- For the deformed A=3 equation has t=4/27, z=3/2 and δ=0. It must disappear after δ is inverted.
- At A=2 and the golden solution, δ=x^(−2)(2−x)=(5+√5)/2≠0, so NondegenerateNahmSolution accepts the distinguished solution, while it rejects the two preceding degenerate data.

### 1.3 Clearing powers and proving algebraicity

For rational A let d>0, `M=dA` integral and ε a rational sign vector. Define the polynomial system clearingPolynomial in variables Y by

```text
P_i(Y) = (1−Y_i^d) ∏_j Y_j^max(−M_ij,0)
                         − ε_i ∏_j Y_j^max(M_ij,0).
```

For unit y set x_i=y_i^d. Prove clearingPolynomial_zero_iff with the coherent-power equations, its base-change law, and invariance under increasing a compatible denominator with coherently chosen roots. The polynomial zero locus can have extra points on coordinate hyperplanes; the equivalence is on the torus, not on the entire affine space. At a zero with x_i and 1−x_i nonzero put

```text
c_i = (1−x_i)∏_j y_j^max(−M_ij,0),
B_d = M + d diag(x_i/(1−x_i)).
J = −diag(c) B_d diag(y_i^(−1)),
det J = (−1)^N (∏c_i)(∏y_i^(−1)) det B_d.
```

Prove clearedJacobian including this determinant sign. At a positive real solution `B_d=dH`, so it is invertible. This derives the cleared-Jacobian formula from the Nahm equations; the formula is not printed in the cited source (Zagier, *The Dilogarithm Function*, II.3A, (25), p. 43; GSWZ (36), p. 13). *Needs:* §1.2, polynomial differentiation, and matrices.

Prove coordinateField_differential_bridge over any field k. Let `L=k(y₁,…,y_N)`, let N polynomials over k vanish at y, and assume their evaluated square Jacobian is invertible. Differentiation kills all dy_i, and these differentials generate `Ω_{L/k}`; hence `Ω_{L/k}`=0. The field is essentially of finite type and free as a k-module, so the pinned unramified-finiteness theorem gives `[L:k]<∞`. State `nondegenerate_zero_isAlgebraic` for rational polynomial systems in ℂ. Finiteness of the coordinate field is its corollary by Mathlib `IsAlgebraic.isIntegral` and `IntermediateField.finiteDimensional_adjoin`, applied to the finite coordinate range. The theorem does not need a global zero-dimensionality hypothesis on every component (CGZ §7.1(i), p. 35; Stacks Project, Lemma 10.148.3, tag 00UO, for Ω=0 iff formal unramifiedness, followed by the pinned `Algebra.FormallyUnramified.finite_of_free`).

For the positive solution of rational A choose `positiveRootLift_d(x)_i=x_i^(1/d)>0`. Prove its d-th power, uniqueness among positive lifts, and compatibility under multiplying denominators. Define `nahmField=ℚ(x_i)` and `coherentNahmField=ℚ(y_i)` as generated intermediate fields in ℂ. Prove finite-dimensionality of the latter by the cleared Jacobian, inclusion of the former, and algebraicity of every x_i. Field embeddings preserve the integer-power relations y_i^d=x_i; they do not in general send y_i to a newly chosen principal root of the embedded x_i (CGZ after (42), p. 36; Zagier II.3A, p. 43).

For the clearing polynomial, use the following API (Zagier II.3A (25), p. 43; GSWZ (36), p. 13).

- For positive d with integral M=dA the displayed polynomials encode the coherent equations on unit tuples, and commute with coefficient maps.
- At a zero with x and 1−x nonzero their Jacobian is −diag(c)B_d diag(y⁻¹), including determinant sign (−1)^N.

**Checks.**

- d=1,M=2 gives P=1−Y−Y² and P′=−1−2Y; a missing minus sign reverses the derivative.
- d=1,M=−1 gives P=Y−Y²−1, with P(0)=−1; using no negative-power clearing factor gives a different constant.
- For M=((-1,1),(1,−1)), d=1, the origin makes both cleared polynomials 0, but is outside the unit torus.

For the positive root lift, use the following API (CGZ after (42), p. 36).

- The positive d-th root of each positive coordinate has d-th power that coordinate and is the unique positive lift.
- For positive e, the e-th power of the de-th root is the d-th root; generated coordinate fields contain the original tuple.

**Checks.**

- x=1/4,d=2 gives y=1/2 and y²=1/4; −1/2 has the same square but fails y>0.
- x=1/16,d=4 gives y=1/2, and y²=1/4 is its d=2 lift; choosing the negative fourth root fails compatibility.
- d=1 gives y=x, including x=1/2; d=0 would give y⁰=1≠1/2 and is excluded.

For the Nahm coordinate fields, use the following API (CGZ §7.1(i), p. 35).

- The generated intermediate fields contain every specified coordinate and are minimal with that property.
- For rational positive definite A the cleared Jacobian gives finite dimension; y_i^d=x_i gives inclusion of the x-field into the coherent field.

**Checks.**

- A=1 gives x=1/2 and both fields ℚ of degree 1, so no unnecessary extension is made.
- A=1/2,d=2 gives x=(3−√5)/2,y=(√5−1)/2 with y=1−x and x=y²; both fields have degree 2.
- With no coordinates the generated field is ℚ and degree 1, while a free transcendental coordinate would generate infinite degree and is outside the algebraicity theorem.

**Checks.**

- At d=1, M=2 gives `1−Y−Y²`; at M=−1 it gives `(1−Y)Y−1`. Clearing only the positive exponents fails the second test.
- Rejects d=0; the displayed expression then becomes a different constant/monomial relation and encodes no root lift.
- Uses a matrix with diagonal −1 and off-diagonal 1: the origin can solve cleared equations but cannot be a Laurent solution. Unit localisation is essential.
- Gives `P′(y)=−c(dA+d x/(1−x))/y`; at d=1, A=2 this reduces to −1−2y at a root. The sign (−1)^N is visible.
- At A=1/2 has `x=(3−√5)/2` and `y=(√5−1)/2`, satisfying y²=x and `1−x=y`. Replacing y by −y violates the chosen coherent equation.
- For P=X²−2 at x=√2, the Jacobian is 2√2≠0 and the generated field has degree two over ℚ; the finite-adjoin corollary applies.
- Gives L=k and Ω=0 in rank zero. A single repeated polynomial with a singular Jacobian is outside the theorem even if its zero is algebraic.
- At d=1 the lift is x itself. For x=1/4 and d=2 it is 1/2; the root −1/2 also squares to 1/4 and is rejected by positivity. For x=1/16 the d=4 lift 1/2 squares to the d=2 lift 1/4, as compatibility under multiplying denominators requires.

### 1.4 Boundary calculations and integral conventions

For integral symmetric A and an unsigned solution in a field F, form the pre-Bloch sum `∑[x_i]`. In the exterior-square convention its boundary vanishes: `∑_{i,j}A_ij x_i∧x_j=0`. For rational A with dA integral, define the integral class `c_d=d∑[x_i]` and the rationalised class `ξ_A=c_d/d∈B_CGZ(F)⊗ℚ`; prove independence of d and compatibility with field extensions. Over the coherent field E with y_i^d=x_i, symmetry and the coherent equations give an unmultiplied integral class `β=∑[x_i]`. Prove that restriction sends c_d to dβ. These are distinct statements over F and E, not an assertion that a rational exponent is an exponent in Fˣ (CGZ §7.1(i), p. 35; Zagier II.3A, p. 43).

For the formal signed convention calculate instead

```text
∂(∑[z_i]) = ∑_i A_ii z_i ∧ (−1).
```

This boundary is killed by 2. Name signedNahm_class_after_two for the resulting doubled integral class and its rational class. An unmultiplied class in the chosen integral convention requires the supplier's additional lift or convention comparison; it is not furnished by symmetry alone. In the antisymmetric-tensor convention even the unsigned boundary can retain the diagonal term `y⊗y`, `y=∏x_i^(A_ii)`, which is 2-primary. Even diagonal entries are a sufficient condition for this obstruction to vanish. Supply explicit maps between the convention-specific classes and record their bounded-primary errors (CGZ Definition 2.1 and Lemma 2.2, pp. 8–9; GSWZ after (41), p. 14, read with this boundary calculation). *Needs:* the Bloch-group supplier contracts, not a second construction of their relation subgroup.

Define nahmIntegralModel by adjoining the solution coordinates and inverses and inverting the exact δ and arithmetic denominators. Its API includes evaluation, minimality among rings containing these elements, localisation in a larger Δ, and transport of the class under base change. A K₃ index for membership is an explicitly supplied lift compatible with the Bloch class. A rational class alone does not choose such a lift (GSWZ (35), (40)–(42), pp. 13–14; the K3BlochGroups integral-comparison contract).

For the Nahm Bloch classes, use the following API (CGZ §7.1(i), p. 35; Definition 2.1, pp. 8–9).

- For rational A the classes c_d/d agree after rationalisation for every compatible positive denominator d.
- On a coherent root field restriction sends c_d to dβ; the signed class is doubled before an integral exterior-square assertion.

**Checks.**

- A=2 gives boundary x∧x²=2(x∧x)=0; a boundary convention retaining self-tensors needs its separate comparison.
- A=1/2,x=y² gives 2(x∧(1−x))=0 and res(c₂)=2β; the coordinate relation 1−x=y is essential.
- A=3 with the signed convention leaves z∧(−1); doubling gives z∧1=0, so dropping the factor 2 loses a possible obstruction.

For the integral Nahm model, use the following API (GSWZ (35), (40)–(42), pp. 13–14).

- The localised ring is initial among coefficient rings containing the coordinates and their required inverses.
- Further localisation and field embeddings commute with evaluation and transport of the chosen class.

**Checks.**

- For z³−z+1=0, z(1−z²)=1 and δ(2z²+3z−9)/23=1; the model with 23 inverted evaluates.
- Further inverting 5 sends z and δ⁻¹ to the same elements, and both composites still multiply to 1.
- For A=2,z=2 over 𝔽₅, δ=0 and δ·b=0≠1 for every b, so no such evaluation exists.

**Checks.**

- For A=2 has `x∧x²=0`; its class is in the exterior-square kernel without multiplying by d.
- Checks A=1/2 with the positive lift above. The relation is `1−x=y`, x=y²; the boundary vanishes over E using `y²∧y=0`, and the restriction identity is `res(c₂)=2β`.
- At A=3 leaves `z∧(−1)` before multiplication by 2. No unmultiplied integral-class assertion is inferred from the symmetric 1×1 matrix.
- For `A=((8,5),(5,4))` has no signed contribution; this is the quartic example's convenient convention, but does not canonically choose a K₃ lift.
- Retains the diagonal self-tensor in the antisymmetric quotient. Replacing that quotient by the exterior square before the comparison would erase the test.
- The signed cubic over ℤ[z,1/Δ], with z³−z+1=0 and 138 dividing Δ together with the stated arithmetic exclusions, gives a valid evaluation: z⁻¹=1−z² and δ⁻¹=(2z²+3z−9)/23 multiply their denominators to one.
- Localising that cubic model further at 5 gives ℤ[z,1/(5Δ)]; the two coordinate evaluations agree on z and δ⁻¹, so evaluation and class transport commute with localisation.
- Excludes a localisation where δ has a nonunit image; adjoining a formal symbol δ⁻¹ does not define an evaluation there.

### 1.5 Embeddings and regulators

For a number field F, let nahmEmbeddingRegulator be the value of Polylogarithms §2.1’s descended embedding regulator on the Nahm class, written on every embedding σ:F→ℂ as `∑D(σx_i)`, with the factor d for c_d and its rational normalisation for ξ_A. Prove compatibility with restriction to E, complex conjugation, permutations, and the supplied K₃ regulator. The distinguished real embedding has value zero, while nonreal embeddings can have nonzero values. With the rational Borel comparison prove nahmClass_torsion_iff_regulators_zero for integral classes and nahmClass_zero_iff_regulators_zero after tensoring with ℚ. It is essential to quantify over all embeddings (CGZ §7.1(i), p. 35; Polylogarithms §§2.1 and 2.3; gap:integral-bloch-comparisons).

State nahmClass_qbar_vanishing: the distinguished rational class vanishes after extension to the algebraic closure exactly when it vanishes over F, using rational restriction injectivity. The uniquely divisible Bloch group of the algebraic closure has no torsion, but this fact alone is not the injectivity argument. For integral classes, torsion is equivalent to vanishing after this comparison with the bounded-primary conventions correctly related (CGZ §1.3, p. 6).

Use the supplied real Suslin detector ρ of K3BlochGroups §5.8 as the comparison on the Suslin carrier. Construct the complementary projective Rogers extension with representative rules L_CGZ(x)=−L_CGZ(1/x) for x>1 and L_CGZ(x)=π²/6−L_CGZ(1−x) for x<0, starting from the supplied interval function. Its target is ℝ/(π²/2)ℤ. Prove that this adapter agrees with the three representative rules and descends to B_CGZ=B_old, including the degenerate symbols, using the supplied five-term identity and gap:integral-bloch-comparisons; its pullback along κ_old must equal −ρ reduced modulo π²/2. The representative construction, including the degenerate symbols, is required rather than an assumed inverse of κ_old (CGZ (42), p. 36). Supply coefficient-class additivity, field-embedding compatibility and agreement with the interval representative.

The real regulator used in the analytic critical value is `Λ=∑L_CGZ(x_i)`. Prove `L_CGZ(0)=π²/6`, `L_CGZ(1)=0` and the specified extension `L_CGZ(∞)=−π²/6`; relate it to the owner's standard increasing Rogers function. Its circle-valued version is applied to integral classes only, unless a compatible rational lift has been supplied. Prove nahmRogersValue_rat_of_torsion in its two integral forms: if rβ=0 for the coherent unmultiplied class β=∑[x_i] and r>0, then rΛ∈(π²/2)ℤ; if rc_d=0 for c_d=d∑[x_i] with d>0, then rdΛ∈(π²/2)ℤ. Both imply Λ/π²∈ℚ. The regulator of c_d is dΛ, not Λ. A rational Rogers value alone is not a witness of torsion (CGZ (42), p. 36; Zagier II.1A, pp. 23–24).

For the embedding regulator value, use the following API (CGZ §7.1(i), p. 35; Polylogarithms §§2.1, 2.3).

- The supplied regulator is evaluated on the specified Nahm class; restriction, permutation and conjugation follow its functorial maps.
- The integral class has torsion precisely when all its embedding values vanish, with rational injectivity from the integral-comparison contract.

**Checks.**

- A=1 and x=1/2 give D(x)=0 at the real embedding; this single zero does not test all embeddings of a larger field.
- For x³+x−1 the real value is 0 and the two nonreal values are approximately ±0.79158333; an all-real-only test misclassifies this class.
- At the figure-eight class 2[ζ₆], the value is approximately 2.0298832128 and the conjugate value its negative; the zero class has all values 0.

For the projective complementary Rogers function, use the following API (CGZ (42), p. 36).

- The extension agrees with the supplied complementary interval representative and descends additively to ℝ/(π²/2)ℤ.
- Its projective five-term relation includes 0,1,∞; rβ=0 gives rΛ∈(π²/2)ℤ, and rc_d=0 gives rdΛ∈(π²/2)ℤ for d>0.

**Checks.**

- L(1/2)=π²/12 gives L(2)=−π²/12 and L(−1)=π²/4; their sum is π²/6, not 0.
- L(0)=π²/6, L(1)=0 and L(∞)=−π²/6; three copies of L(0) give π²/2, zero in the circle.
- At the golden point L=π²/15 and the increasing interval value is π²/10; their sum is π²/6.

**Checks.**

- At x=2 and x=−1 the projective Rogers extension rules give −π²/12 and π²/4. Their sum is π²/6, the value of [0], as [2]+[−1]=[0] requires. The inversion pair 2,1/2 instead has values −π²/12,π²/12 and sum zero.
- At x=0,1,∞ the projective values are π²/6,0,−π²/6. A constant-zero extension cannot agree at zero.
- Multiplying the class of [0] by 3 gives π²/2=0 in the circle target. The same value is nonzero in ℝ, so an unquotiented real map does not descend through that relation.
- Gives `L_CGZ((√5−1)/2)=π²/15`; the increasing convention gives π²/10. Their sum is π²/6.
- Uses the unsigned cubic `x³+x−1=0`. Its real embedding has Bloch–Wigner value zero; the conjugate nonreal embeddings give opposite nonzero values, approximately ±0.79158. A real-only torsion test fails.
- Changes the sign of D, while the rational Rogers expression at the distinguished positive root is real and positive. These are different regulator coordinates.
- Has Λ=0 and zero class in rank zero. `Λ>0` is asserted only for N>0.
- For A=1,x=1/2,d=2, c₂=2[1/2]=[0] and 3c₂=0. Here Λ=π²/12, so 3Λ=π²/4 is not a period, while 3·2Λ=π²/2 is. With d=1 both torsion formulas coincide.
- At x=1/2 the supplied detector is −π²/12 modulo π²; negation and period reduction give +π²/12. On c its value −π²/6 becomes +π²/6, of order three modulo π²/2, matching [0].

### Examples

The two rank-one analytic data with A=2 lead to the same positive critical point and Λ, but have different B,C and therefore different first radial coefficients. The formal A=3 datum leads to the signed cubic of discriminant −23; applying the unsigned analytic equation to that matrix would instead produce the field of discriminant −31. The A=1/2 example tests a coherent choice of root with ℚ(y)=ℚ(x)=ℚ(√5). The strict extension in coherentRadicalExtension (§2.6) tests enlargement of the coefficient field.

### Dependencies

Mathlib finite-dimensional linear algebra, real powers, polynomial differentiation, generated fields, Kähler differentials and unramified finiteness; HabiroCyclotomicCompletions §1.1; the K3BlochGroups integral-comparison contract; PolylogarithmFunctions §§1.1–1.7, 3.1–3.6, 5.1–5.8 and 6.1–6.5; Polylogarithms §§2.1 and 2.3; gap:integral-bloch-comparisons. The signed K₃ index additionally uses the HabiroNumberFields integral convention comparison. No later layer is needed for the existence or algebraicity of a positive solution.

## Layer 2: convergent sums and radial expansions

### 2.1 Analytic evaluation and the branch of the sum

Consume the analytic qPochhammer, shift and zero-divisor theorems from GeometryOfNumbersAndQuadraticArithmetic §4.3, and the locally uniform finite-prefix limit and finite/infinite identity from QSeriesPartitionsAndMockModularForms §1.6. Compare their finite symbols with `(w;q)_n=∏_{r=0}^{n−1}(1−wq^r)` and `(q)_n=(q;q)_n`. For the logarithmic branch use the open set Ω of pairs with |q|<1 and every 1−wq^r outside the nonpositive real axis. Define its value by the sum of principal factor logarithms; its exponential equals the imported product. On compact subsets of Ω the tail logarithms and their derivatives converge uniformly, so logarithmic differentiation is valid there. At |w|<1 every factor lies in the right half-plane, fixing the branch needed by §2.2. This branch identification and the radial remainders of §2.2 are the additions here (GSWZ §2.1, (46), (59)–(60), pp. 18–19; GZ Lemma 2.1, p. 3). *Needs:* the two named analytic-product suppliers and the principal complex logarithm.

Define `nahmSummand` and `analyticNahmSum` by

```text
f_{A,B,C}(τ) = ∑_{n∈ℕ^N} exp(2πiτQ(n))/∏_i(q)_{n_i}.
```

For real analytic data prove `nahmSummand_summable`, normal convergence on compact subsets of the upper half-plane, and `analyticNahmSum_holomorphic`. Positive definiteness dominates the linear term and the denominator products on each compact set. Prove the constant-shift formula:
`f_{A,B,C}(τ)=e(Cτ)f_{A,B,0}(τ)`. For rational analytic data a denominator gives a convergent Laurent–Puiseux expansion on a finite cover of the punctured disc; it need not descend to an ordinary function of q (GZ (12), p. 4; CGZ (40), pp. 34–35). Permutation, block-product and direct-sum APIs should identify both the summand and the sum, with convergence justifying rearrangement.

For the factor-log branch, use the following API (GZ Lemma 2.1, p. 3; GSWZ (59)–(60), p. 19).

- On Ω the sum of principal factor logarithms exponentiates to the supplied Pochhammer product.
- On compact subsets of Ω its tails and differentiated tails converge uniformly, permitting logarithmic differentiation.

**Checks.**

- w=0 gives log 1=0 for every factor and total logarithm 0.
- w=q=1/2 gives factors 1/2,3/4,…, with first two logarithms summing to log(3/8); using factors starting at one gives log(21/32) instead.
- w=3,q=1/2 gives initial factors −2,−1/2 and is outside Ω even though their product is 1 and neither is zero.

For the analytic summand and sum, use the following API (GZ (12), p. 4).

- Positive definite real data give absolute and locally uniform convergence on Im τ>0 and a holomorphic sum.
- Constant shifts multiply by e(Cτ); permutations preserve the sum and block sums multiply after summable rearrangement.

**Checks.**

- In rank zero, C=0 gives sum 1 and C=1/2,τ=i gives exp(−π); translating τ by one changes the latter by −1.
- A=2,B=C=0,q=1/2 gives summands 1,1,1/6 at n=0,1,2; dropping the quadratic half changes these values.
- A=√2,B=C=0,τ=i/(2π) gives numerator ratio at n=0 equal to exp(−1/√2); τ=0 is excluded since the n=1 denominator is 0.

**Checks.**

- Gives `(0;q)_∞=1` and `(1;q)_∞=0`. The latter is not a zero-free logarithm input.
- At q=1/2,w=1/2 every factor lies in (0,1), so the factor-log sum is real and exponentiates to the positive product. At w=3,q=1/2 the first two factors are −2 and −1/2 and no factor is zero, but Ω excludes the pair: nonvanishing alone does not specify this logarithm branch.
- Gives `(w;q)_2=(1−w)(1−qw)` and `(q)_0=1`; replacing the starting index by one changes the first formula.
- At C=1/2 changes the rank-zero sum by −1 when τ is replaced by τ+1, although q is unchanged.
- Is exactly e(Cτ), and equals one only when C=0. In particular the constant shift cannot be omitted in rank zero.
- At A=√2,B=C=0 and τ=i/(2π), the numerator is exp(−n²/√2). Its ratio at n=0 is exp(−1/√2), and the quadratic decay dominates every linear exponential; rationality plays no role.
- Rejects applying the convergence theorem to the singular figure-eight matrix merely because its formal series exists.

### 2.2 Bernoulli remainders and the Euler factor

Establish shiftedEulerMaclaurin_remainder: for J≥2, M≥0 an integer, a∈ℝ, θ∈[0,1], and a complex-valued C^J function f on [a,a+M],

```text
∑_{k=0}^{M−1}f(a+k+θ)
 =∫_a^(a+M)f(s)ds
  +∑_{r=1}^J B_r(θ)/r! ·(f^(r−1)(a+M)−f^(r−1)(a)) + R_J,
|R_J|≤(sup_{v∈[0,1]}|B_J(v)|/J!)∫_a^(a+M)|f^(J)(s)|ds.
```

The bound is uniform in θ; the endpoint value B₁(0)=−1/2 gives left-endpoint sampling, while B₁(1)=1/2 gives right-endpoint sampling. Scale the interval for a nonunit mesh before applying it to the logarithmic product. Apply it to logarithms only on a compact zero-free domain. An asymptotic formal substitution is not a replacement for this estimate (GZ §4.1, pp. 6–7; Vlasenko–Zwegers, Lemma 2.2 and (2.3)–(2.4), pp. 2–3).

For m≥1, ζ primitive of order m, |w|≤ρ<1 and real ν satisfying
`|ν|ε/m≤−log(ρ)/2`, define the factor-log remainder pochhammerRadialPsi by

```text
log(qw exp(−νε/m);q)_∞
 = −Li₂(w^m)/(mε) − (ν/m−½)log(1−w^m)
   − ε ν² w^m/(2m(1−w^m))
   − (1/m)log D_ζ(w) − log(1−w) + ψ_{w,ζ}(ν,ε),
q = ζ exp(−ε/m).
```

Here `log D_ζ` is the weighted sum of the individual factor logarithms. Its expansion is

```text
ψ_{w,ζ}(ν,ε) ∼ −∑_{r≥2} ε^(r−1)/r!
  ∑_{a=1}^m [B_r(1−(a+ν)/m)−1_{r=2}ν²/m²] Li_{2−r}(ζ^a w).
```

Prove compactPochhammerRemainder: truncating the Bernoulli expansion through r=J≥1 gives an absolute remainder at most
`C_{J,ρ,m} ε^(−1)[ε(1+|ν|)]^(J+1)` for sufficiently small ε. The displacement guard prevents a shifted factor from crossing zero. The API includes the w=0 value, the polynomial dependence on ν of every coefficient, compatibility with cyclic root shifts, and a complex-shift version on compact zero-free sets. The radial theorem uses only the real-shift version (GZ Lemma 2.1, (4)–(5), p. 3, proof §4.1; Vlasenko–Zwegers Lemma 2.2, pp. 2–3).

Define the Dedekind phase without an ambiguous root choice:

```text
χ_{a,m} = m^(−1/2) exp((1/m)∑_{r=1}^{m−1}r Log(1−ζ^r))
        = exp(πi s(a,m)),
s(a,m) = ∑_{r=1}^{m−1} ((r/m)) ((ar/m)).
```

The sawtooth is x−⌊x⌋−1/2 off integers and zero at integers. Prove its modulus is one and the Euler-product expansion

```text
(q;q)_∞ ∼ χ_{a,m}^(−1) (2π/ε)^(1/2)
              exp(−π²/(6mε)+ε/(24m)).
```

After this exponential and square root are removed, the remaining error is flat to every order. The phase is fixed by the factor logs, including m=1. GZ (23), p. 7, gives the m=1 calculation; the general phase follows by the root-of-unity splitting and the eta multiplier of QSeriesPartitionsAndMockModularForms §5.2 with gap:qseries-root-modularity, as in CGZ (48)–(49), p. 38. The often used printed phase `ν_{a,m}=e(N(m−1)(m−2)a/(24m))` need not equal `χ_{a,m}^N`. Any series normalised with ν must be multiplied by `ν/χ^N` before using the normalisation below.

For the radial Pochhammer remainder, use the following API (GZ (4)–(5), p. 3).

- For |w|≤ρ<1 and the displacement guard, truncation through r=J has the stated uniform absolute bound.
- Each coefficient is polynomial in ν, transforms under cyclic root shifts, and is zero for w=0.

**Checks.**

- w=0 gives Li_s(0)=0, log(1)=0 and ψ=0, so both sides of the defining expansion vanish.
- m=1,ν=0 gives the ε coefficient −Li₀(w)/12; w=1/2 gives −1/12, while omitting B₂ gives 0.
- m=1,ν=−2 and w=exp(−ε) give qw exp(−νε)=1, so the initial product factor vanishes; the displacement guard fails.

For the Dedekind phase, use the following API (CGZ (48)–(49), p. 38).

- The weighted principal factor logs define a unit-modulus phase, equal to exp(πi s(a,m)).
- The phase fixes the constant of the root Euler expansion; the postnormalisation error is flat to all orders.

**Checks.**

- m=1 gives an empty log sum and phase 1, with Euler correction exp(ε/24).
- a=1,m=3 gives s=1/18 and χ=exp(πi/18); its modulus is 1.
- a=2,m=5 gives s=0 and χ=1; the binomial phase e(1/5) is different.

**Checks.**

- At a=0,M=1,f(s)=s gives θ exactly: the integral is 1/2 and the B₁ correction is θ−1/2. For a constant f all derivative corrections vanish; at M=0 every term is zero. The left/right endpoint tests θ=0,1 reject a wrong B₁ sign.
- At w=0 is identically zero. At m=1 the cyclic product is the empty product one.
- With positive w and ν sufficiently negative can force a factor to vanish. A bound such as `|ν|ε≤1` without a relation to w is insufficient.
- At `ν=x/√ε`, `|x|≤ε^(−1/12)`, gives `ε(1+|ν|)=O(ε^(5/12))`, allowing arbitrarily accurate truncation.
- At m=1 has inverse Euler factor `exp(−ε/24)` after the dominant exponential and square root; a missing 1/24 changes the first Nahm coefficient.
- At a=1,m=3 gives χ=exp(πi/18). At a=2,m=5 the Dedekind sum is zero, so χ=1, whereas `e((m−1)(m−2)a/(24m))=e(1/5)`. This separates the two phase conventions.

### 2.3 The saddle, local expansion and global tails

Let x be the positive solution, write `s_i=−log x_i`, `θ_i=x_i^(1/m)>0`, `H=A+diag(x/(1−x))` and `Λ=∑L_CGZ(x_i)`. The solution and positive determinant branch come from Layer 1. In a residue class n≡k mod m use
`n_i=s_i/ε+v_i/√ε`. Derive the saddle expansion by expanding Q and the finite/infinite product quotient. The Gaussian is
`exp(−vᵀHv/(2m))`, the linear B term is `−(B·v)√ε/m`, and the Euler contribution is `−Nε/(24m)`. If C is retained the scalar exponent is `−Cε/m`. The remaining exponential is therefore

```text
R_k(v,t) = exp(−(B·v)t/m − (C+N/24)t²/m
                   +∑_i ψ_{ζ^{k_i}θ_i,ζ}(v_i/t,t²)),  t=√ε.
```

Its coefficient `P_{k,p}(v)` has degree at most 3p and parity p; `P_{k,0}=1`. Prove uniformLocalSaddleRemainder: for every requested K, choose enough Bernoulli and exponential terms so that, on `max|v_i|≤ε^(−1/12)`, the error multiplied by the Gaussian is bounded by `C_K ε^K(1+|v|^M)e^(−c|v|²)`, with the lattice-scaled absolute sum O(ε^K). For example one can choose Bernoulli depth 12(K+1) and exponential depth 4(K+1), increasing them if a later differentiation requires it. Odd polynomial terms integrate to zero. These targets correct the B sign, the Gaussian factor 1/2 and the Euler term in the printed GZ Proposition 2.2, (10)–(11), p. 4; the proof route is §4.2, p. 7, and Vlasenko–Zwegers Theorem 2.3, pp. 4–7.

Prove finiteEulerProduct_modulus: for all n≥0, uniformly as ε→0⁺,

```text
log |(ζe^(−ε/m);ζe^(−ε/m))_n|
 = [Li₂(e^(−εn))−π²/6]/(mε) + O(1+|log ε|).
```

Split the finite product into m-blocks, estimate the slowly varying radial factors and handle the incomplete block separately. This is a modulus estimate; individual terms retain complex phases. Apply it with the globally strictly concave saddle potential to prove the following global domination bound:

```text
|e^(−Λ/(mε)) e^(−εQ(n)/m)/∏_i(q)_{n_i}|
 ≤ M ε^(−L) exp(−c∑_i[√ε(n_i−s_i/ε)]²)
```

for constants c,M,L>0, all n and small ε. Consequently the sum outside the stated window is O(ε^K) for every K, including each congruence subsum. The quadratic part of A provides global domination; no positivity of a complex summand is claimed. This supplies the rigorous tail step behind GZ §4.3 Claims 2–3, pp. 9–10, using Vlasenko–Zwegers Lemma 2.2(i) and Theorem 2.3, pp. 3–7. *Needs:* §§2.1–2.2 and the Layer 1 critical point.

For the saddle polynomials, use the following API (GZ Proposition 2.2, p. 4; VZ Theorem 2.3, pp. 4–7).

- The coefficient at order t^p has degree at most 3p and parity p; its zeroth coefficient is one.
- With H positive definite, local remainders and the outside-window lattice sum have every requested power bound.

**Checks.**

- The linear B term at n=s/ε+v/√ε is −Bs/m−Bv√ε/m, fixing its negative v sign.
- A cubic v³√ε is odd and integrates to 0; its square contributes v⁶ε/2 and has nonzero moment 15ε/(2M³).
- For A=2,B=C=0,m=1 the first relative coefficient is −1/60; deleting the Euler term adds 1/24 and gives 1/40.

**Checks.**

- In one dimension has exponent `−Hv²/(2m)`, and its normalised second moment is m/H. Dropping 1/2 changes that moment by a factor of two.
- Expands `−εB(s/ε+v/√ε)/m=−Bs/m−Bv√ε/m`; the coefficient of Bv is negative.
- At A=2, B=C=0, m=1 gives the first normalised coefficient −1/60. Omitting the Euler correction gives +1/40.
- At n=0 gives zero on both sides of the modulus main term. At n→∞ its main term agrees with the Euler exponential in §2.2.
- At m=3 retains a complex denominator. A positivity assertion for the whole summand is rejected even though its absolute value obeys the estimate.
- Applies equally when the Gauss factor in §2.5 vanishes; it never divides by that factor.

### 2.4 Gaussian brackets and the lattice covolume

For an invertible symmetric matrix M over a characteristic-zero field define formalGaussian first on polynomials by Wick contraction, equivalently
`[exp(½∑(M⁻¹)_ij∂_i∂_j)P]_{v=0}`. Extend it to series only with a complete filtration for which each coefficient has finitely many contractions. Specify that filtration as part of the input; an arbitrary infinite series in v is not automatically integrable. Supply linearity, value on one, odd-parity vanishing, Wick's pairing formula, direct sums, linear changes of coordinates and affine completion of the square. In the h-scaled convention replace the differential operator by h/2 times it (GZ (13)–(14), p. 4; GSWZ (110)–(111), p. 28; Garoufalidis–Storzer–Wheeler Lemmas 3.1–3.2, pp. 9–10). The h-scaled weighted completion in Layer 5 is a particular valid domain.

Prove formalGaussian_eq_normalisedIntegral for complex polynomials and a real symmetric positive definite M, using the existing Gaussian measure of covariance M⁻¹ and its supplied moments. The integral denominator is positive. Its one-dimensional value on `v^(2r)` is `(2r−1)!! M^(−r)` and its value on odd powers is zero. In several variables the covariance entries, rather than just diagonal entries, determine contractions. This is a bridge to the Gaussian owner, not another construction of that owner's moments.

Prove shiftedGaussianLattice for h=m√ε and every complex polynomial P:

```text
h^N ∑_{v∈b+hℤ^N} P(v)e^(−vᵀHv/(2m))
 = ∫ P(v)e^(−vᵀHv/(2m))dv + O(ε^K)
```

for every K, uniformly in b modulo hℤ^N. Truncating at `max|v_i|≤ε^(−1/12)` preserves the assertion. Fourier transforms of polynomial Gaussians have polynomial-Gaussian bounds; apply lattice Poisson summation (`ThetaSeries` Layer 1) to the Schwartz function v↦P(b+v)e^(−(b+v)ᵀH(b+v)/(2m)) on the lattice hℤ^N and control the entire nonzero-frequency sum. The unscaled lattice factor is `m^(−N)ε^(−N/2)`. Together with the integral `(2πm)^(N/2)/√det H` and the summand factor `(ε/(2π))^(N/2)`, it produces `m^(−N/2)`. This is the covolume correction to GZ §4.3 Claim 4, (34)–(37), pp. 9–10.

For the algebraic Gaussian functional, use the following API (GZ (13)–(14), p. 4; GSWZ (110), p. 28).

- For invertible symmetric M, contraction is linear, takes 1 to 1 and kills odd monomials.
- It obeys Wick pairing, direct sums, coordinate changes and affine completion of the square; filtered extension requires finitely many contractions in every coefficient.

**Checks.**

- M=1 gives moments of 1,v,v²,v⁴ equal to 1,0,1,3, respectively.
- Covariance ((2,1),(1,2)) gives ⟨v₁v₂⟩=1 and ⟨v₁²v₂²⟩=2·2+2·1²=6; ignoring cross pairings gives 4.
- M=0 is excluded since M⁻¹ does not exist; an infinite constant-weight sum of even powers would contribute 1+3+15+… to one coefficient and is excluded.

**Checks.**

- Gives bracket 1=1 and bracket v_i=0. A putative linear functional assigning one to every monomial fails.
- In rank one gives `⟨v²⟩=1/M` and `⟨v⁴⟩=3/M²`; at M=H/m the values are m/H and 3m²/H².
- In rank two gives `⟨v₁v₂⟩=(M⁻¹)₁₂` and `⟨v₁²v₂²⟩=(M⁻¹)₁₁(M⁻¹)₂₂+2(M⁻¹)₁₂²`.
- At N=1,P=1,H=1 has unscaled sum `√(2πm)/(m√ε)` to leading order. Spacing mD√ε inserts exactly an additional factor D⁻¹, not D or D⁻¹/².
- Rejects assigning a bracket to an unfiltered sum whose constant h-coefficient receives infinitely many nonzero moments.

### 2.5 Congruence splitting and the analytic theorem

At order one take τ=iε/(2π), ζ=1 and C=0, allowing all real analytic data. In the formulas below m=1,k=0, G=χ=1, and no denominator or phase reduction is used. Prove nahmRadialExpansion in this case from §§2.1–2.4; for real C multiply by exp(−Cε). This is the real generality of GZ Remark 3.2, p. 6.

For the nontrivial-root and arithmetic assertions take rational analytic data and C=0, choose a denominator d clearing Q and, when powers occur, A and B, and choose a strong denominator D divisible by a denominator of Q. Assume m is odd and prime to Dd. Let `ā=a m⁻¹ mod D`; define

```text
G(Q,a/m) = D^(−N)∑_{r mod D} e(ā Q(r)).
```

Its value is independent of compatible refinements of D. Rational exponents modulo m use the inverse of their denominator modulo m. Establish the exact Chinese-remainder phase split, keeping the residual Q values modulo D separate from Q modulo m. The phase-free congruence subsums still have complex Euler denominators (GZ (16), p. 5, and (25)–(31), pp. 8–9).

Prove congruenceRemainder_difference: after removing `e^(Λ/(mε))`, the difference of a fixed class modulo mD and D⁻ᴺ times the corresponding class modulo m is O(ε^K) for every K. Uniformity over the finite classes follows from §§2.3–2.4. This difference formulation survives exact cancellation of leading terms and fixes the use of asymptotic division in the printed Claim 1.

For k∈{0,…,m−1}^N put

```text
I_k(ε) = formalGaussian_{H/m}
  [exp(−(B·v)√ε/m−Nε/(24m)
                      +∑_iψ_{ζ^{k_i}θ_i,ζ}(v_i/√ε,ε))],
S(ε) = ∏_i D_ζ(ζθ_i)^(−1/m)
       ∑_k ζ^{Q(k)} ∏_i θ_i^((Ak)_i)/(ζθ_i;ζ)_{k_i} · I_k(ε),
c(Q) = (det H)^(−1/2)∏_i θ_i^(B_i)(1−x_i)^(1/2−1/m).
```

All roots of positive numbers are positive, and cyclic roots use the factor logarithms of §2.2. The denominators are nonzero since 0<θ_i<1. The expression I_k has only integral powers of ε by parity. Name nahmRadialExpansion for

```text
e^(−Λ/(mε)) f_{A,B,0}(a/m+iε/(2πm))
 ∼ χ_{a,m}^N m^(−N/2)c(Q)G(Q,a/m)S(ε).
```

For each K this means the difference from the coefficient polynomial of degree <K is O(ε^K). For general rational C multiply that polynomial series by `e(aC/m)exp(−Cε/m)`. This is the corrected analytic content of GZ Theorem 3.1, (18)–(20), pp. 5–6, and CGZ Theorem 7.1, (43), p. 36. It is radial, not sectorial; its order-one form admits real positive definite data, while the phase-reduced formula at nontrivial roots requires rational data. Neither form applies to arbitrary signed knot matrices. The proof closes by summing the uniform local errors and global tails, without division by G or S(0).

For the phase-splitting Gauss factor, use the following API (GZ (16), p. 5).

- For the stated rational datum, odd m prime to dD and a strong denominator D clearing Q, compatible refinements of D give the same normalised sum.
- The exact Chinese-remainder split retains a modulo Dm and does not divide by the resulting Gauss factor.

**Checks.**

- Integer-valued Q with D=1 gives the single phase 1, hence G=1.
- Q=n²/2,m=3,a=1 gives terms 1,−1 for D=2 and 1,−1,1,−1 for D=4; both averages are 0.
- The same Q,m with a=2 or 4 gives average 1; a=4 and a=1 have the same root but distinct branch data.

For the radial coefficient series, use the following API (GZ (18)–(21), pp. 5–6).

- Each I_k has only integral ε-powers after Gaussian contraction, and S has the displayed finite cyclic prefactor.
- For every truncation order the normalised analytic sum differs from χ^N m^(−N/2)cG times that polynomial by O(ε^K), including when G=0.

**Checks.**

- m=1,A=2,B=C=0 gives constant (2−x)^(−1/2)≈0.8506508084 and first relative coefficient −1/60.
- N=0,C=0 gives I=S=c=G=1 and exponent 0; C=2 multiplies by 1−2ε+2ε²+… at order one.
- A=1,m=3,a=1 gives G=0 and every displayed dominant coefficient 0, so normalising by G would be undefined.

**Checks.**

- Allows D=1 for integer-valued Q and gives G=1.
- At A=1,B=0,m=3,a=1 has Q(n)=n²/2, D=2, ā=1 and G=(1−1)/2=0. The normalised full expansion is flat; this is not a unit-series input.
- Recomputes vanishingGauss with the strong denominator D=4. With a=1, ā=1·3⁻¹=3 mod 4 and the terms e(3r²/2), r=0,…,3, are 1,−1,1,−1, so G=0 again, as independence of compatible refinements of D requires.
- At A=1,B=0,m=3,a=2, ā=0 mod 2 gives G=1; a=4 also gives G=1 at the same q-root as a=1. The radial datum retains a modulo Dm when Q is not integer-valued.
- At A=√2,B=C=0,m=1 the critical point solves 1−x=x^(√2), H=√2+x/(1−x)>0, and the leading constant is [H(1−x)]^(−1/2). There is no Gauss denominator to choose.
- At A=2,B=0,m=1 has leading value `[H(1−x)]^(−1/2)` and first relative coefficient −1/60.
- Multiplies the C=0 answer by the nontrivial phase e(aC/m) and the series `1−Cε/m+…`.
- Gives m⁰=1 and no Gaussian integration. The only remaining series is the C factor, as in §2.1.

### 2.6 Coherent coefficient fields and arithmetic descent

For rational analytic data and d,m>0 define the following generated fields from nonzero algebraic coordinates with specified coherent roots. In the analytic application use the positive solution and its positive roots: `y_i=x_i^(1/d)`, `η_i=x_i^(1/(dm))`, `θ_i=η_i^d`, and set

```text
E = ℚ(y_i,ζ),       H_rad = E(η_i),
F_G = ℚ(y_i,ζ_D),   K = F_G(ζ).
```

Define radialBaseField and radialKummerField as the corresponding generated intermediate fields in ℂ. Their API gives membership of the generators, inclusion and minimality, and `η_i^m=y_i`, `η_i^d=θ_i`. If gcd(d,m)=1, Bézout gives `H_rad=E(θ_i)`. In every case H_rad/E is finite Galois because E contains the m-th roots of unity. Every actual E-automorphism sends η_i to `ζ^(s_i)η_i` and θ_i to `ζ^(ds_i)θ_i`; not every vector s need occur. Interpret `θ_i^(A_ij)` and `θ_i^(B_i)` as integer powers `η_i^(dA_ij)` and `η_i^(dB_i)` (GZ §3 and (21), pp. 5–6).

Define the finite sum T by omitting the cyclic-dilogarithm prefactor from S, and `C_θ=∏D_ζ(ζθ_i)`. The exact target radialKummer_descent is

```text
σ(C_θ^(−1) T(η,ε)^m) = C_θ^(−1) T(η,ε)^m
```

coefficient by coefficient for every σ∈Aut_E(H_rad). It implies `S^m∈E[[ε]]`. Prove this identity at all coefficients by the root-change recurrence and Gaussian change of variables; a calculation of its constant term is insufficient. This is the arithmetic assertion of GZ (21), p. 6, beyond the analytic remainder argument. The coherent-power automorphism identity is a separate proof obligation, radialKummerCoefficientIdentity, and may not be replaced by freely changing θ while holding its rational powers fixed.

Put

```text
ω = m^(−N/2)(det H)^(−1/2)∏(1−x_i)^(1/2),
Φ = G(Q,a/m) ∏θ_i^(B_i)(1−x_i)^(−1/m) S.
```

Then ω>0 and `ω²∈ℚ(x)ˣ`, and the analytic expansion is `χ^N ω e^(Λ/(mε))Φ`. Subject to radialKummerCoefficientIdentity, prove `Φ^m∈K[[ε]]`. Name radialChernConstantComparison for the further assertion, when Φ₀≠0, that its constant Kummer class is the inverse of
`P_ζ(β)D_ζ(1)^N`, in the explicitly enlarged field containing the coherent radicals. Here β is the integral class over ℚ(y), and P_ζ is the cyclic-dilogarithm map of the owner. Name radialCyclotomicEquivariance for the inverse-cyclotomic eigenspace law of `[Φ₀^m]∈Kˣ/Kˣᵐ` under `Aut_{F_G}(K),` and the corresponding coefficient transformation. The rational-data comparison including the Gauss field is an additional arithmetic target, not a consequence of normal convergence (CGZ Theorem 7.1, (43)–(44), p. 36; GZ (21), p. 6).

For integral A with even diagonal and integral B the convenient choice d=D=1 gives K=ℚ(x,ζ). Other normalisations require their larger fields explicitly. If a series was written with the printed phase ν rather than χᴺ, use `Φ_Dedekind=(ν/χᴺ)Φ_printed` before the Kummer comparison; a phase change can change an m-th-power class.

Prove unitSeries_descent for characteristic-zero fields K⊂L: if m>0, Φ₀≠0 and `Φ^m∈K[[ε]]`, then `U=Φ/Φ₀∈1+εK[[ε]]`, by uniqueness of an m-th root with constant one. If an owner-compatible representative ε_β and chosen m-th root satisfy `ε_β^(1/m)Φ₀∈Kˣ`, obtain `ε_β^(1/m)Φ∈K[[ε]]`. Include all good-order and roots-of-unity hypotheses of that owner. This is the exact nonvanishing form of CGZ Corollary 7.2 and Remark 7.3, pp. 36–37. The m-th root of a quotient class is not itself a chosen field element.

For the radial base and Kummer fields, use the following API (GZ §3, (21), pp. 5–6).

- The generated fields contain their specified roots, are minimal with that property and satisfy η^m=y, η^d=θ.
- The extension H_rad/E is finite Galois; its actual automorphisms rotate η and θ coherently, with H_rad=E(θ) when gcd(d,m)=1.

**Checks.**

- d=m=1 gives η=θ=y=x and both fields ℚ(x); an empty coordinate set gives ℚ(ζ).
- d=2,m=3,x=1/4 gives E=ℚ(ζ₃) of degree 2 and η³=1/2 of degree 3 over ℚ, hence a strict extension.
- d=2 sends η↦ζη and θ=η²↦ζ²θ; keeping θ fixed would give η²↦ζ²η²≠η² for m=3.

**Checks.**

- Has H_rad=E at m=1; at d=m=1 both are ℚ(x). If all coordinates are one, both fields are ℚ(ζ).
- At d=2,m=3,x=1/4 has E=ℚ(ζ₃), while H_rad contains the positive cube root of 1/2 and is strictly larger.
- At A=1,B=1/4,m=1 has leading coefficient 2^(−1/4), whose square is not in ℚ(x)=ℚ. Even integer-valued Q can retain a B-root: A=1,B=1/2 has integral Q but the displayed Φ₀ is √2.
- Sends η to ζη and θ to ζ^dθ. Sending θ to ζθ with every θ^(A_ij) unchanged violates the rational-power convention.
- Rejects Φ=0 and Φ=ε as normalisable by Φ₀. The analytic theorem remains applicable when G=0.
- Requires the invariance of the ε and ε² coefficients as separate checks; verifying only `[Φ₀^m]` proves neither.

### 2.7 Andrews–Gordon acceptance

Consume the owner's Andrews–Gordon identity for n=2r+3 odd, `A_ij=2min(i,j)`, B=0. Its product excludes the classes `k≡0,±(r+1) mod n`, equivalently `2k≡0,±1`. Identify the critical tuple with `(X₂,…,X_{r+1})`,
`X_j=1−[sin(π/n)/sin(πj/n)]²`. Prove the Rogers trigonometric identity for this tuple, `∑_{j=2}^{r+1}L_CGZ(X_j)=(n−3)π²/(6n)`, from the supplied interval pentagon and the sine relations (CGZ Theorem 7.4, (46)–(47), p. 37; CGZ line 1763). Thus Λ=(n−3)π²/(6n). The modular transformation and radial phase are separate inputs (48)–(49), p. 38.

For a primitive odd-order root ζ with n≥3, let F=ℚ(ζ+ζ⁻¹), and define the cyclotomic class in the owner's projective presentation by

```text
η_ζ=∑_{k mod n}[1−((ζ−ζ⁻¹)/(ζ^k−ζ^(−k)))²] ∈ B_CGZ(F).
```

At k=0 the symbol is [∞], and at k=±1 it is [0]; ζ−ζ⁻¹≠0 since n≥3 is odd, and no 0/0 is used. Prove that these free symbols have zero exterior boundary and nη_ζ=0. Prove the root-change law η_(ζ^a)=a²η_ζ for every integer a coprime to n, using the special cyclotomic torsion interface, prime-power reduction and the cyclic root-change maps, without generic good-order finite-Chern injectivity (CGZ (34), pp. 26–27 and proof of Theorem 7.4, p. 39; CGZ lines 1202 and 1912). This Nahm trigonometric class uses the supplied Bloch carrier and cyclic maps rather than constructing them again.

Let ξ_ζ be the sum of [X_j] for 2≤j≤r+1, and take ρ=ζ^((n+1)/2), the unique square root of ζ in μ_n. Prove 2ξ_ζ=η_ρ−[0] (CGZ (52), p. 39; CGZ line 1887). Compare the product's radial constant with §2.5 at ζ=e(1/n), retaining the phase e(n/24−1/8+1/(12n)−1/(4n²)). The cyclic descent map exists here because F is totally real, w_F=2 and gcd(n,2)=1; n need not be prime to M_F. Prove R_ζ(ξ_ζ)^4=ζ for 3∤n and ζe(−1/3) for 3|n. Retain R_ζ([0])^(−2)=1 in the first case and e(2/3) in the second; the scaling law and 2ξ identity then give R_ζ(η_ζ)=ζ² (CGZ (49)–(52), pp. 38–39; CGZ line 1880). Generic good-order injectivity is reserved for §4.4. *Needs:* the Andrews–Gordon supplier, the interval pentagon and sine relations, K3BlochGroups §§3.13–3.16, §2.6's radial constant comparison, and the distinct cyclic descent and special cyclotomic torsion contracts.

For the cyclotomic class use the following API (CGZ (34), pp. 26–27; (51)–(52), p. 39).

- The projective symbols define a class killed by n and commute with field embeddings and primitive-root changes, with η_(ζ^a)=a²η_ζ.
- Its half-root version satisfies 2ξ_ζ=η_ρ−[0]; applying the cyclic map retains the displayed 3-primary correction before giving ζ².

**Checks.**

- r=1,n=5 gives the first Rogers–Ramanujan identity and Λ=π²/15.
- r=2,n=7 gives `A=((2,2),(2,4))` and fixes the ordering X₂,X₃.
- r=0,n=3 gives the empty sum one and Λ=0. Here ξ=0, η_ρ=[0], and R_ζ([0])^(−2)=ζ², so discarding [0] would replace ζ² by 1.
- At n=5, F=ℚ(√5) has discriminant 5, so gcd(n,M_F)=5, while gcd(n,w_F)=gcd(5,2)=1; cyclic descent applies although generic good-order injectivity does not.
- For n=5,a=2 the scaling factor is 4 modulo 5; conjugation a=−1 gives factor 1. At n=3 the factor 6 in M_F excludes generic injectivity despite the valid cyclic descent.

### Examples

The A=2, B=C=0 radial expansion at one has a positive leading constant and first relative coefficient −1/60; changing C to −1/60 makes that first relative coefficient zero, as expected for the normalised modular Rogers–Ramanujan function. At τ=1/3+iε/(6π) for A=1,B=0 the Gauss factor vanishes and the entire dominant expansion cancels. These examples distinguish a robust additive asymptotic theorem from a quotient statement that would be undefined in the second case.

### Dependencies

Layer 1; GeometryOfNumbersAndQuadraticArithmetic §4.3, HabiroCyclotomicCompletions §1.1 and QSeriesPartitionsAndMockModularForms §§1.6, 2.4, 3.3, 5.2 with gap:qseries-root-modularity; PolylogarithmFunctions §§1.1–1.7 and 3.1–3.6 for Li₂ and distribution; the HabiroNumberFields arithmetic contract only for the arithmetic coefficient and finite-Chern comparisons. The analytic proof uses existing eta, Gaussian and Fourier foundations, StandardDistributions Layers 1 and 5, and lattice Poisson summation from ThetaSeries Layer 1. radialKummerCoefficientIdentity and radialChernConstantComparison are explicit arithmetic proof obligations. No knot or Habiro module theorem is needed for the analytic estimate.

## Layer 3: finite-index cusps and scalar growth

### 3.1 Width-normalised orders

Consume `FuchsianOrbifolds` Layers 3–5 for cusp quotient charts, compactification, meromorphic descent and the finite-principal-part criterion. The extra interface here is the scalar estimate in the upper-half-plane coordinate used by a Nahm sum. Fix Γ≤SL₂(ℤ) of finite index, replace it by ⟨Γ,−I⟩ for weight-zero functions, and choose σ∈SL₂(ℤ) with σ∞=P. Let w be the positive projective cusp width. Define the normalised cusp order by k/w when

```text
f(στ)=∑_{n≥k} a_n exp(2πinτ/w),     a_k≠0.
```

The identically zero function has order +∞. Define cuspLeadingCoefficient relative to σ and w, not merely to P. Its API gives independence of the order from σ, multiplication and inversion of nonzero meromorphic germs, order of a sum with possible leading cancellation, and invariance of k/w under replacing the period w by rw. Changing σ to ±σT^ℓ multiplies a_k by `e(kℓ/w)`. A strict orbit period is converted to the projective period before making these statements. These contracts refine GZ §7, (50)–(54), pp. 13–14, and CGZ §7.3, p. 40. *Needs:* the supplier's Laurent expansion in the cusp chart and Layer 2's holomorphic scalar function.

For the normalised cusp order, use the following API (GZ (50)–(54), pp. 13–14).

- The nonzero meromorphic germ has order k/w, independent of the admissible chart and period refinement; zero has order +∞.
- Orders add under products, negate under inversion and satisfy the minimum bound under sums, with possible strict increase after cancellation.

**Checks.**

- Width 3 and germ 7q_w²+3q_w³ give 2/3; expressing it at width 6 gives first index 4 and the same 4/6.
- The unit has order 0 and its inverse has 0; q_w⁻¹ has order −1/3 and inverse order 1/3.
- Adding −7q_w²+2q_w³ gives 5q_w³, with order 1>2/3; zero has +∞ rather than 0.

For the cusp leading coefficient, use the following API (GZ (50)–(54), pp. 13–14).

- The coefficient is relative to the chosen σ,w and is the coefficient of the first nonzero Fourier term.
- Replacing σ by ±σT^ℓ multiplies it by e(kℓ/w); multiplication of nonzero germs multiplies their leading coefficients.

**Checks.**

- At width 3, 7q_w²+3q_w³ has leading coefficient 7, excluding a constant-one definition.
- Translating the chart by T changes that value to 7ζ₃², excluding chart invariance.
- Adding the cancelling germ above leaves leading coefficient 5; multiplying by 2 gives 14 before cancellation.

**Checks.**

- At width 3 the germ 7q_w²+3q_w³ has order 2/3 and leading coefficient 7. Under σ↦σT its leading coefficient is 7ζ₃², which distinguishes it from the invariant order.
- Adding −7q_w²+2q_w³ to that germ gives 5q_w³, of order 1 and leading coefficient 5; leading coefficients need not be one and cancellation changes both data.
- The constant function one has k=0 and order zero; zero has infinite order and no nonzero leading coefficient.
- At infinity the classical j function has k=−1 at width one. In a parameter of period r its first index is −r, while its normalised order stays −1.
- The two standard Γ₀(p) cusps have projective widths 1 and p. The order is divided by the appropriate width, rather than always being the integer Laurent index.
- Γ(3) has projective index 12 and four projective cusp widths 3. Using its SL₂ index 24 in that sum would count the central sign twice.
- `σ=((2,1),(5,3))` has determinant one and sends infinity to 2/5. Its lower row, rather than the numerator of the cusp, controls the radial scale below.

### 3.2 The radial Laurent estimate

Prove cuspLaurent_uniformRemainder: for a nonzero meromorphic cusp germ and Y→∞, uniformly in real X in a fixed period interval,

```text
f(σ(X+iY)) = a_k exp(2πik(X+iY)/w)
             (1+O(exp(−2πY/w))).
```

The bound follows from convergence on a smaller punctured chart, including when k is negative. For σ with first column (a,c), c>0, the exact identity
`σ⁻¹(a/c+iy)=−d/c+i/(c²y)` yields cuspLaurent_radial:

```text
f(a/c+iy)=a_k e(−vd/c) exp(−2πv/(c²y))
         (1+O(exp(−2π/(wc²y)))),    v=k/w.
```

Treat infinity in its own chart. Prove also the comparison rule: an upper bound `|f(a/c+iy)|=O(exp(M/y))` forces `−2πv/c²≤M`. The converse cusp criterion used here is the supplier theorem that a periodic holomorphic function with at most exponential growth in Y has only a finite pole at the puncture; its proof is not rebuilt in this layer. No radial estimate alone is asserted to imply meromorphicity without periodic holomorphy. Sources: CGZ proof of Theorem 7.5, p. 40; GZ proof of Proposition 7.1, pp. 13–14. *Needs:* §3.1 and the meromorphic descent supplier.

**Checks.**

- At P=0 take σ=S, c=1,d=0: a pole of normalised order −λ gives growth `exp(2πλ/y)` with positive sign.
- For the cusp 2/5 and the preceding σ the leading phase is `e(−3v/5)` and the exponential scale uses 25y.
- A zero of positive order decays; a pole grows. Reversing these signs fails already for the germs q and q⁻¹.
- If the first two Fourier coefficients vanish, k is the first nonzero index, not a preset index zero. A cancellation can increase the order of a sum.

### Examples

For a Γ-invariant Nahm sum, a local expansion in the width parameter can have a fractional normalised order. Writing `v=k/w` first makes the comparison with the exponent Λ in Layer 4 independent of the chosen subgroup. At zero, substituting y=t/(2π) in the displayed radial formula gives `exp(4π²λ/t)`, which fixes the conversion Λ=4π²λ used there.

### Dependencies

FuchsianOrbifolds Layers 3–5 and the pinned cusp APIs listed above. Layer 2 is needed only for the Nahm application. This layer adds scalar estimates to existing cusp geometry; it does not construct another modular curve or another cusp equivalence relation.

## Layer 4: modularity forces Bloch torsion

### 4.1 A majorant at every root

For orientation, distinguish three properties of A: some rational B,C give a modular Nahm sum; the distinguished positive solution has torsion rational Bloch class; every algebraic solution has the corresponding torsion class. The endpoint here proves the first implies the second. It neither proves the third nor the converse, and it makes no assertion that the two latter properties are equivalent. Counterexamples to broader formulations do not invalidate this implication (CGZ §7.1, pp. 34–36; Vlasenko–Zwegers §4, pp. 15–18).

For analytic data, m≥1 and t>0 define the positive residueMajorant

```text
M_{A,B,C;m}(t)=∑_{n∈ℕ^N} exp(−tQ(n)) /
                 ∏_i (exp(−m²t);exp(−m²t))_{⌊n_i/m⌋}.
```

Prove summability, positivity, `M_{C+u}=exp(−ut)M_C`, the rank-zero value exp(−Ct), and the exact finite split

```text
M_{A,B,C;m}(t)=∑_{s∈{0,…,m−1}^N} exp(−tQ(s))
                 f_{A,(As+B)/m,0}(im²t/(2π)).
```

Its proof uses `Q(mℓ+s)=m²[ℓᵀAℓ/2+((As+B)/m)ᵀℓ]+Q(s)`. In particular A is unchanged. For every m prove finiteEuler_blockLowerBound: there is c_m>0, uniform in primitive m-th roots ζ, t∈(0,1] and n≥0, with

```text
|(ζe⁻ᵗ;ζe⁻ᵗ)_n| ≥ c_m (e^(−m²t);e^(−m²t))_{⌊n/m⌋}.
```

Take c₁=c₂=1. Bound the accumulated block error by a convergent estimate; paying a fixed loss for every block would not prove this inequality. Consequently, with Λ from Layer 2,

```text
|f(a/m+it/(2π))| ≤ c_m^(−N) M_{A,B,C;m}(t)
                = O(exp(Λ/(m²t))).
```

More precisely `M=exp(Λ/(m²t))(∑_s K_{A,(As+B)/m}+O(t))`, where each K is the positive order-one leading constant. This covers even m and orders sharing primes with a quadratic denominator; it uses no nonvanishing at the original root. Sources: GZ §4.1, proof of Lemma 2.1, and §4.3, (24)–(25), pp. 7–8; Zagier II.3B, (28)–(30), pp. 46–48 and II.3C, pp. 55–56. *Needs:* §2.1, §2.5 at order one, and finite Euler products.

For the residue majorant, use the following API (GZ §4.3, (24)–(25), pp. 7–8).

- For analytic data and t>0 the positive sum converges, and a C-shift multiplies it by exp(−ut).
- Its exact m-residue split keeps A fixed and uses linear terms (As+B)/m; its exponential bound is valid at every root order.

**Checks.**

- A=2,B=1,C=11/60,m=2 gives shifted B=1/2,3/2 and Q(0)=11/60,Q(1)=131/60.
- N=0,C=7,t=log 2 gives 1/128 at every m; replacing m²t by t in a nonexistent denominator changes nothing here.
- m=2,n=1 gives |1+e^(−t)|≥1 and an empty lower-bound denominator 1; m=1 recovers the positive imaginary-axis sum.

**Checks.**

- At m=1 the majorant is exactly the original positive imaginary-axis sum.
- At A=2,B=1,C=11/60,m=2 the two shifted B's are 1/2 and 3/2; their prefactors are `exp(−11t/60)` and `exp(−131t/60)`, and the base is e^(−4t).
- At rank zero, C=7,t=log 2, the value is 1/128 for every m.
- At m=2,n=1 the lower bound is `1+e⁻ᵗ≥1`. This case cannot be obtained by imposing an odd-order restriction.
- For A=2 the second-root growth bound is `O(exp(π²/(60t)))`.

### 4.2 Cusp valuations and the order-one modular expansion

Assume only that `f=f_{A,B,C}` is invariant under some finite-index Γ≤SL₂(ℤ). Apply §4.1, periodicity and the supplier's puncture criterion to show it is meromorphic at every cusp. Prove nahm_cuspOrder_bound, with `λ=Λ/(4π²)`,

```text
v_P(f) ≥ −λ for every rational cusp P,
v_0(f)=−λ,          v_∞(f)=min_{n∈ℕ^N}Q(n) ≥ −λ,
C≥−λ.
```

The minimum exists by positive definiteness; positivity of imaginary-axis coefficients prevents cancellation at that exponent. If Q(n)≥C for every n, then v_∞=C. There is no equivalence between equality in this bound and B=0. Meromorphicity at zero makes λ rational. At order one, periodic meromorphicity improves the full expansion to

```text
f(it/(2π))=K exp(Λ/t)(1+O(exp(−c/t))),
K=(det H)^(−1/2)∏_i x_i^(B_i)(1−x_i)^(−1/2)>0,
```

for some c>0. Every positive power of t in the relative radial expansion vanishes. For a modular transformation law of rational weight with finite-order multiplier, fixed automorphy-factor branches and meromorphic cusp expansions, prove the weight is zero by comparing its t-power with this nonzero constant. Sources: GZ §7, Proposition 7.1, pp. 13–14; CGZ (53), Theorem 7.5 and Remark 7.7, pp. 40–41; Vlasenko–Zwegers Theorem 2.3, pp. 4–5. *Needs:* Layers 2–3 and §4.1.

**Checks.**

- The first normalised Rogers–Ramanujan function has λ=1/60 and v₀=−1/60.
- For A=2,B=−3,C=5, the infinity series starts `2q³+…`, since Q(1)=Q(2)=3. This computation tests the minimum formula without asserting that this datum is modular.
- Rank zero has Λ=λ=0. Invariance under a finite-index group forces exp(2πiCτ) to be constant, hence C=0.
- At A=2,B=0,C=−1/60 the coefficient −1/60 from §2.5 is cancelled by exp(t/60). This is necessary for the exponentially small modular remainder.

### 4.3 Fixed fields, multipliers and bounded powers

Fix rational analytic data and D divisible by 24, clearing A and B and all denominators and strong periods used in §2.6. With F=ℚ(x), put `E=F(x_i^(1/D),ζ_D)` once and for all; this is independent of the varying order n. The class `η_E=∑[x_i]` is integral in the owner's CGZ group because the x_i are D-th powers in E and the cleared boundary vanishes there. For n prime to `6D M_E`, let ζ be primitive of order n and E_n=E(ζ). The corrected fixedExtensionChernLift target is conditional on the three arithmetic identities of §2.6: its Dedekind-normalised constant u is nonzero in the modular application, satisfies `u^n∈E_nˣ`, and

```text
[u^n]=R_ζ(η_E)^(−1) in E_nˣ/(E_nˣ)^n.
```

Use the field E's exceptional integer, not F's. Keep the inverse-cyclotomic eigenspace restriction and every roots-of-unity condition of the finite Chern supplier. This is the rational-data form of CGZ Corollary 7.2, pp. 36–37; it requires the all-coefficient and constant-term arithmetic comparisons, not just the analytic expansion.

For γ=((a,b),(c,d))∈Γ, d>0 a good odd order, put ζ=e(b/d),
`μ=e(Ns(b,d)/2)` and `ω_d=d^(−N/2)(det H)^(−1/2)∏(1−x_i)^(1/2)`.
Using the same Dedekind normalisation as §2.6, prove modularConstant_boundedPower from

```text
u=μ⁻¹ω_d⁻¹ e(−Cb/d)e(−λc/d) K.
```

The sign of the λ phase follows by taking the inverse transformation at `b/d+ih/(2πd)`: its imaginary-axis exponent is evaluated at `ε=dh/(1−ich/(2π))`, so `Λ/ε=Λ/(dh)−2πiλc/d`. Choose one positive integer s divisible by 24, 2den(B), den(C) and den(λ). Then `u^s∈F(ζ)ˣ⊂E_dˣ` for every such d. The Gauss factor stays inside u. When using the printed binomial phase of GZ instead of μ, rescale u by that phase quotient before invoking the Chern comparison. Source: CGZ proof of Theorem 7.5, p. 40 (with the inverse-transformation sign and the displayed prefactors retained); GZ Theorem 3.1, pp. 5–6. *Needs:* §§2.6, 4.2, the fixed integral lift and the eta multiplier of QSeriesPartitionsAndMockModularForms §5.2 with gap:qseries-root-modularity.

There are unbounded good d without a congruence assumption on Γ. Choose L divisible by the excluded primes such that T^L and the lower unipotent of entry L lie in Γ. Their products `((1,Lk),(L,1+L²k))` lie in Γ for k≥1, and d=1+L²k is prime to every excluded prime. No claim that these d are prime is needed.

**Checks.**

- For the first Rogers–Ramanujan datum s=120 works and the phase is e(−c/(60d)).
- If A,B have denominators, the radicals in E and the Gauss field cannot be omitted. A=2/3,B=1/3 is covered with those fields retained.
- At n=1 the Kummer quotient is trivial. At general n the comparison concerns u^n, while the independent modular bound is u^s with s fixed.
- Enlarging E separately for each d is rejected: it would change M_E and break the unbounded-order argument.

### 4.4 The integral arithmetic bridge and the endpoint

Prove the elementary divisibility criterion: in a finitely generated abelian group, an element lying in nG for an unbounded set of positive n is torsion. In a decomposition into free and finite parts, a nonzero free coordinate cannot be divisible by unbounded n. Apply this through the owner's Suslin comparison and its finitely generated quotient; the CGZ convention may retain additional 2-primary ambiguity, which is torsion. Do not assert finite generation of that entire convention without the comparison.

Combine `u^s∈E_nˣ` with `[u^n]=R_ζ(η_E)⁻¹`: the s-th power of this Kummer class is trivial, so injectivity of the finite Chern map makes sη_E divisible by n for unbounded good n. Conclude η_E is torsion. Rational restriction from F to the fixed finite extension E is injective by restriction–corestriction, so the rational class `ξ_F` of §1.4 is zero. State modularity_implies_blochTorsion as follows: for symmetric positive definite rational A and rational B,C, finite-index invariance of the analytic Nahm sum implies `ξ_F=0` in `B_CGZ(F)⊗ℚ`; for integral A the original integral class is torsion. In an algebraically closed torsion-free Bloch target its image is zero. This last assertion uses torsion-freeness, not a false finite-generation assertion for the algebraic closure. Source: CGZ Theorem 7.5 and Remarks 7.6–7.7, pp. 40–41, together with its Theorem 1.2, Proposition 2.5 and Remark 2.6 for the arithmetic conventions. *Needs:* §§4.1–4.3, the HabiroNumberFields arithmetic contract and the K3BlochGroups integral-comparison contract.

For rational A only the integral lift η_E is reduced modulo n. The rational vector space `B(F)⊗ℚ` is divisible; reducing it modulo n would give no information. Record the endpoint as requiring radialKummerCoefficientIdentity, radialChernConstantComparison and radialCyclotomicEquivariance from §2.6. Their exact statements are part of the build, so the theorem does not silently assume the arithmetic part of a radial estimate.

**Checks.**

- A nonzero element of ℤ fails unbounded divisibility; a torsion element can satisfy it along integers prime to its order.
- A single n, or arbitrarily many repetitions of a fixed n, is insufficient.
- Passing from E back to F is performed after rationalisation. Integral restriction need not be injective on torsion.
- The theorem concerns the distinguished positive solution. It does not assert that every algebraic solution has torsion Bloch class, nor the converse implication from torsion to modularity.

### Examples

The two Rogers–Ramanujan data in §1.1 satisfy the modular order-one cancellation and have the same distinguished Bloch class; their different B,C still change the radial constants and phases. The unipotent product above produces enough good orders even for a noncongruence finite-index subgroup. This is why imposing a principal congruence subgroup at the start would unnecessarily weaken the endpoint.

### Dependencies

Layers 1–3; the K3BlochGroups integral-comparison contract; the HabiroNumberFields arithmetic contract; QSeriesPartitionsAndMockModularForms §5.2 with gap:qseries-root-modularity; the finite-generation and restriction–corestriction supplier contracts stated above. The precise rational-data bridge uses a fixed radical field and the corrected arithmetic radial comparisons. No formal Gaussian integrality or Habiro module membership from Layers 5–7 is a prerequisite.

## Layer 5: formal admissibility and Gaussian comparison

### 5.1 Plethystic coefficients and root expansions

Use the owner's formal Pochhammer symbol in `ℚ(q)[[T]]`, its Euler coefficients and the embedding in `ℤ((q))[[T]]`. In particular `(T;q⁻¹)_∞=(qT;q)_∞⁻¹` is an identity obtained by the rational-function automorphism q↦q⁻¹. It is not a product converging q-adically with base q⁻¹. Supply the augmentation-complete multivariate mvLog and mvExp, with inverse laws over a ℚ-algebra, the coefficient formula and their product/sum laws. All substitutions have zero augmentation. This is the local interface to the supplier's one-variable identities (GSWZ §2.1, (46)–(59), pp. 18–20).

Define the plethystic coefficient family L(F) for `F∈1+(t)ℚ(q)[[t]]` as the unique rational functions L_n, n≠0, such that

```text
log F(t,q)=−∑_{n≠0}∑_{ℓ≥1} L_n(q^ℓ)t^(ℓn)/(ℓ(1−q^ℓ)).
```

The sum contributing to any fixed nonzero multi-index is finite. Define admissibility of F by `L_n∈ℤ[q,q⁻¹]` for every n. Its API includes uniqueness, a triangular coefficient recursion, invariance under permutation and adjoining unused variables, closure under multiplication and inversion, and the unique product
`F=∏_{n≠0,i∈ℤ}(q^it^n;q)_∞^(c_{n,i})`, where `L_n=∑_i c_{n,i}q^i`. For admissibility there are finitely many i for each fixed n. An unrestricted product with coefficients merely bounded below in i is a different, weaker property (GSWZ Definition 1.7 and (27)–(28), pp. 11–12; §2.2, (60)–(64), pp. 19–20). *Needs:* the formal Pochhammer supplier and augmentation operations just stated.

For an algebraic primitive m-th root ζ, define the injective coefficientwise Laurent expansion from ℚ(q) to ℚ(ζ)((x)) by q=ζ+x. It preserves sums, products and substitutions into rational functions; a pole is allowed. The augmentation logarithm is taken coefficientwise before root expansion. Define the invariants

```text
V_F(t)=∑_{n≠0}L_n(1)Li₂(t^n),
log δ_F(t)=∑_{n≠0}(L_n(1)−2L'_n(1))Li₁(t^n),
```

and, writing T for the variables before the m-th-power substitution,

```text
u_{F,m}(T)= (m−1)/(2m) ∑_n L_n(1)Li₁(T^(mn))
          + (1−m)/m ∑_n L'_n(1)Li₁(T^(mn))
          − ∑_{j=1}^{m−1}∑_n L_n(ζ^j)/(1−ζ^j)
               ·(1/m)∑_{k mod m}ζ^(−kj)Li₁(ζ^kT^n),
U_{F,m}=exp u_{F,m}.
```

Here V has augmentation zero and δ,U have constant one. Define their composition, coefficient extraction and base-change APIs. Prove the root expansion

```text
F(T,ζ+x)=exp(V_F(T^m)/(m²h)) δ_F(T^m)^(−1/2) U_{F,m}(T)
          ·(1+x (T)ℚ(ζ)[[T,x]]),   h=log(1+x/ζ),
log F(T,ζ+x)=ζ V_F(T^m)/(m²x)+V_F(T^m)/(2m²)
             −½log δ_F(T^m)+u_{F,m}(T)+O(x).
```

Fractional powers of units use the unique constant-one binomial series. The first coefficient in u is **+(m−1)/(2m)**: expanding `−L(q^ℓ)/(ℓ(1−q^ℓ))` for m|ℓ and then removing `−½log δ` gives this sign. This repairs the corresponding sign in GSWZ (67). Prove the recognition targets: V equality is equivalent to equality of all L_n(1); equality of V,δ and every U_m determines F; one entire Laurent expansion at one root also determines F by injectivity. V alone does not determine an arbitrary admissible series. Sources: GSWZ Lemma 2.3, (65)–(73), pp. 20–21, and Corollary 2.4, pp. 21–22. *Needs:* admissibility, rational Laurent expansions and formal polylogarithms.

For the augmentation logarithm and exponential, use the following API (GSWZ (46)–(59), pp. 18–20).

- Over a ℚ-algebra the augmentation logarithm and exponential are inverse maps between constant-one and zero-constant series.
- Products map to sums and sums to products; coefficientwise finite substitution requires zero augmentation.

**Checks.**

- log(1+t)=t−t²/2+t³/3+… and exp(log(1+t))=1+t; the opposite quadratic sign fails.
- log(1+t₁t₂) has mixed coefficients 1,−1/2,1/3 in degrees (1,1),(2,2),(3,3).
- log 1=0 and exp 0=1; constant series 2 is outside the augmentation logarithm domain.

For the plethystic coefficient family and admissibility, use the following API (GSWZ Definition 1.7, pp. 11–12; (60)–(64), pp. 19–20).

- The triangular identity uniquely determines each L_n; product and inverse of constant-one series add and negate the families.
- Admissibility means every L_n is an integral Laurent polynomial; this gives finite product-exponent support at each n and is preserved by products, inverses and reindexing.

**Checks.**

- For (T;q)_∞ the family is L₁=1,L₂=0; its inverse has L₁=−1,L₂=0, and both are admissible.
- For (T;q⁻¹)_∞ the first family member is −q; for (−T;q)_∞ the second is 1/(1+q), which is not a Laurent polynomial.
- For exp(−T/(1−q)²), L₁=1/(1−q) has a pole at 1 and admissibility fails; F=1 has every L_n=0.

For the root Laurent expansion, use the following API (GSWZ Lemma 2.3, pp. 20–21).

- Expansion q=ζ+x is an injective field map into Laurent series and preserves sum and product.
- Poles are retained; taking augmentation logarithms coefficientwise precedes this expansion.

**Checks.**

- At ζ=1, 1/(1−q)=−x⁻¹, excluding evaluation as a regular power series.
- At ζ=−1 the same rational function gives 1/2+x/4+x²/8+…; its value at zero is 1/2.
- At ζ=1 the rational functions q−1 and 1 have expansions x and 1, both nonzero; setting x=0 first would destroy injectivity.

For the potential, discriminant and root units of an admissible series, use the following API (GSWZ (65)–(73), pp. 20–21).

- The potential has augmentation zero, and the discriminant and root units have constant one; they commute with coefficient maps.
- The displayed root factorisation fixes the positive sign (m−1)/(2m); all these invariants together determine the series.

**Checks.**

- For (T;q)_∞, V=T+T²/4+…, δ=(1−T)⁻¹=1+T+T²+… and U₁=1.
- At m=2, U₂=(1+T)⁻¹/²=1−T/2+3T²/8+…; the opposite sign gives +T/2.
- For F=1 all invariants are V=0,δ=1,U_m=1; replacing δ by 0 violates its required constant.

**Checks.**

- For `(T;q)_∞`, L₁=1, all other L_n=0, V=Li₂(T), δ=(1−T)⁻¹ and U₁=1. The T² Euler coefficient is `q/((1−q)(1−q²))`.
- At m=2 for the same series, `U₂(T)=(1+T)^(−1/2)`. Its linear coefficient −1/2 and quadratic coefficient 3/8 detect the sign in u and the square-root factor.
- `(T;q⁻¹)_∞` has L₁=−q. The wrong-sign series `(-T;q)_∞` has `L₂=1/(1+q)` and is not admissible.
- `exp(−T/(1−q)²)` has L₁=1/(1−q), so allowing rational L without the Laurent integrality condition would admit a false example.
- The Laurent expansion of 1/(1−q) at one is −x⁻¹. Evaluation at x=0 is undefined.
- At ζ=−1 the same function expands as 1/2+x/4+x²/8+… with no pole, so rootExpansion depends on the root and not only on q.
- MvLog(1+t₁t₂)=t₁t₂−t₁²t₂²/2+t₁³t₂³/3−…, mvExp∘mvLog is the identity on (1−t₁)⁻¹, and a series with constant coefficient 2 lies outside the domain of mvLog.
- In rank zero F=1, V=0, δ=U_m=1 and every product is empty. In mixed variables divisibility ℓ|n means divisibility of every coordinate, including its zero coordinates.

### 5.2 The formal Nahm series and its defining equations

For every symmetric integral A, with no positivity restriction, define `formalExponent A n=(nᵀAn+diag(A)·n)/2∈ℤ`. Prove that twice formalExponent equals its numerator, including evenness of that numerator, by separating diagonal and paired off-diagonal terms. Define `formalNahmSeries A`, written F_A, by

```text
F_A(t,q)=∑_{n∈ℕ^N} (−1)^(diag(A)·n) q^((nᵀAn+diag(A)·n)/2)
                       t^n /∏_j(q;q)_{n_j}.
```

It lies in `1+(t)ℚ(q)[[t]]`; negative exponents of q are permitted. Define σ^a by `(σ^at)_i=q^(a_i)t_i` for a∈ℤ^N. Prove `formalNahmSeries_qDifference`, the exact system

```text
F_A−σ_jF_A=(−q)^(A_jj)t_j σ^(A_{*,j})F_A.
```

Together with constant coefficient one it determines F_A uniquely over ℚ(q), by recursion on a positive coordinate of n. Prove the block-sum formula, permutation covariance, the inversion identity formalNahmSeries_qInv, `F_A(t,q)=F_{I−A}(t,q⁻¹)` and compatibility with the q-adic Euler products when available. These are GSWZ (31)–(33), pp. 12–13, (78), p. 23, and Theorem 6, pp. 24–25. *Needs:* §5.1 and finite Euler products; no analytic convergence or positive solution.

Define the deformed Nahm solution z_A as the unique tuple `z∈(1+(t)ℤ[[t]])^N` satisfying

```text
1−z_j=(−1)^(A_jj)t_j∏_i z_i^(A_ij).
```

Construct it by augmentation-degree recursion; every negative power is a power of a constant-one unit. Supply constant term, coefficient recursion, uniqueness over any commutative coefficient ring, permutation and block-sum naturality. Define deformedDiscriminant by §1.2's determinant at z(t); it has constant one. The factor z_j on the left must not be counted again inside the right-hand product (GSWZ (34), p. 13 and (76)–(77), p. 23).

For the formal exponent and formal Nahm series, use the following API (GSWZ (31)–(33), pp. 12–13).

- For symmetric integral A, twice the exponent is its numerator, and the formal series has constant one.
- The full-column q-difference system, permutation and block-product laws hold without positivity; q-inversion exchanges A with I−A.

**Checks.**

- A=−1,n=2 gives exponent −3; truncating negative powers of q would lose this coefficient.
- A=3,q=2 gives coefficients 1,8,512/3 in t-degrees 0,1,2; its first q-difference is (1−2)8=−8=(−2)³.
- For the empty matrix the only coefficient is 1; for nonsymmetric ((0,1),(0,0)) at (1,1) the numerator is 1 and integer division returns 0, so symmetry is essential for the exponent identity.

For the deformed Nahm solution and discriminant, use the following API (GSWZ (34), p. 13; (76)–(77), p. 23).

- The constant-one solution exists uniquely over every commutative coefficient ring and commutes with coefficient maps and permutations.
- Its discriminant is the same determinant expression and has constant one; block sums give the componentwise solution and product discriminant.

**Checks.**

- A=0 gives z=1−t and δ=z; at t=0 both equal 1, whereas z=1 is not a solution for nonzero t.
- A=1 gives z=(1−t)⁻¹=1+t+t²+… and δ=z⁻¹=1−t; the unsigned deformation gives (1+t)⁻¹ instead.
- A=3 gives z=1+t+3t²+12t³+… and δ=1−5t−3t²−10t³+…; counting an extra z on the right changes the t² coefficient.

**Checks.**

- A=0 gives `F_0=∏_j(t_j;q)_∞⁻¹` and z_j=1−t_j. A=1 gives `F_1=(qt;q)_∞` and z=(1−t)⁻¹.
- A=3 has `F−F(qt)+q³tF(q³t)=0`; its t coefficient is `−q³/(1−q)` and its t² coefficient is `q⁹/((1−q)(1−q²))`.
- At A=3, `z=1+t+3t²+12t³+55t⁴+273t⁵+…` and `δ=1−5t−3t²−10t³−42t⁴+…`.
- For `A=((2,1),(1,1))`, the first equation shifts both variables. Replacing its column by only A₁₁ loses the mixed coefficient.
- A=−1 has formal exponent −3 at n=2. The 2×2 all-ones matrix is valid although singular.
- The empty matrix gives F=1 and δ=1. An odd diagonal uses the signed equations, not the positive unsigned system of Layer 1.

### 5.3 Integral shifts, root orbits and the potential

Define the shift ratio R_a=σ^aF_A/F_A for a∈ℤ^N and `G_j=R_{e_j}`. Prove integrality `R_a∈1+(t)ℤ[q,q⁻¹][[t]]`, including negative a; prove the cocycle law
`R_{a+b}=R_a σ^aR_b`, R₀=1, and
`1−G_j=(−q)^(A_jj)t_j R_{A_{*,j}}`.
Use coordinate telescoping and inverse units for negative shifts; a product indexed from zero to a negative A_jj is not a definition. For m≥0 define the finite orbitRatio

```text
U_{j,m}=∏_{s=0}^{m−1}σ_j^sG_j=R_{me_j}.
```

It has `U_{j,m+n}=U_{j,m}σ_j^mU_{j,n}`. Coefficientwise evaluation at primitive ζ_m is legitimate on U even when it is not legitimate on either F in its quotient. Prove orbitRatio_rootNahm:
`U_{j,m}(t,ζ_m)=z_j(t_1^m,…,t_N^m)` for m≥1. Its proof derives the signed deformed Nahm equations for the orbit products and uses constant-one uniqueness. Sources: GSWZ proof of Theorem 6, (83)–(89), pp. 24–25, with the full column shifts retained. *Needs:* §5.2 and augmentation recursion.

Define the residue potential V_A before proving admissibility: take the coefficient of (q−1)⁻¹ in log F_A, coefficientwise in t. Prove absence of higher poles in that logarithm, and `Θ_jV_A=log z_j`, where Θ_j=t_j∂/∂t_j. This uniquely determines V_A with V_A(0)=0; for n_j>0 its t^n coefficient is `[t^n]log z_j/n_j`. Prove, independently of Gaussian integration, the all-root identity

```text
log F_A(t,ζ_m+x)=ζ_m V_A(t^m)/(m²x)+O(x⁰).
```

Use the integral orbit ratios and the q-difference equations to rule out higher negative Laurent terms and identify the residue. This is the orbit route to GSWZ Lemma 2.6, (79), p. 23; it does not assume the Gaussian identification of §5.6.

Prove the critical-value formula

```text
V_A=−∑_jLi₂(1−z_j)−½∑_{i,j}A_ij log z_i log z_j.
```

All compositions are formal: 1−z_j has zero augmentation. Differentiating the Nahm equations proves the same Euler derivatives and zero constant term. Put `Λ_A=−A−diag(z/(1−z))`, in the Laurent localisation where the indicated coordinates are invertible. Then the logarithmic Hessian is `Θ_iΘ_j V_A=(Λ_A⁻¹)_ij`; this is not the ordinary Hessian with respect to z. In particular its inverse, together with z, recovers A, so V determines A within this family. Sources: GSWZ (116), p. 29 and (168), p. 36. *Needs:* the deformed solution, formal polylog derivatives and matrix inversion.

For the shift ratios and finite root orbits, use the following API (GSWZ (83)–(89), pp. 24–25).

- Every integral shift ratio is a constant-one integral Laurent-coefficient series and satisfies the cocycle law.
- The length-m orbit telescopes to the m-shift ratio and at a primitive m-th root equals the deformed solution in t^m.

**Checks.**

- A=0 gives R₁=1−t and R₋₁=(1−q⁻¹t)⁻¹; R₁σR₋₁=1, retaining inverse shifts.
- A=0,m=2,q=−1 gives (1−t)(1+t)=1−t²=z(t²).
- A=1,m=2 gives the reciprocal (1−t²)⁻¹, whereas at m=0 the empty orbit is 1 and is not z(t⁰).

For the Nahm residue potential and logarithmic Hessian, use the following API (GSWZ (79), p. 23; (116), p. 29; (168), p. 36).

- The logarithm has at most simple poles, and the residue potential is fixed by Θ_jV=log z_j and V(0)=0.
- Its root residue is ζV(t^m)/m² and its logarithmic Hessian is Λ_A⁻¹ on the indicated localisation; the critical-value expression has zero constant.

**Checks.**

- A=0 gives V=−Li₂(t)=−t−t²/4−… and Θ²V=−t/(1−t)=Λ⁻¹; at t=1/2 both equal −1.
- A=3 gives V=t+5t²/4+28t³/9+… and ΘV=t+5t²/2+28t³/3+…=log z.
- m=2 gives residues +t²/4+… for A=0 and −t²/4−5t⁴/16+… for A=3; a wrong ζ sign reverses both.

**Checks.**

- At A=0, G_j=1−t_j and `R_{−e_j}=(1−q⁻¹t_j)⁻¹`. Here `U_{j,2}=(1−t_j)(1−qt_j)` and its ζ_m value is 1−t_j^m.
- For A=1 the orbit value is `(1−t^m)⁻¹`. For A=3,m=2 its t² coefficient is +1.
- For `A=((2,1),(1,1))`, `[t₁t₂]G₁=−q³` and `[t₁t₂]V_A=−1`. The diagonal-only recurrence fails both.
- `V_0=−∑Li₂(t_j)`, `V_1=Li₂(t)` and `V_3=t+5t²/4+28t³/9+165t⁴/16+…`.
- `V_{−1}=t−3t²/4+10t³/9−35t⁴/16+…`; the statement is not restricted to nonnegative A.
- At m=2 the A=0 residue is +t_j²/4+… and the A=3 residue is `−t²/4−5t⁴/16+…`. A coordinate not divisible by m contributes zero residue.

### 5.4 Finite support and the elementary Dwork identity

Prove admissibility of the formal Nahm series for every symmetric integral A. From integral shift ratios derive
`L_n(q)[n_j]_q∈ℤ[q,q⁻¹]` for every j, where `[r]_q=(1−q^r)/(1−q)`. Thus a possible non-Laurent denominator is a simple cyclotomic factor whose order divides every nonzero coordinate of n. Induct on total degree. At each such order use §5.3's all-root residue identity, subtracting the already known proper-divisor contributions; a remaining pole would change a forbidden or already prescribed residue. Monic cyclotomic division preserves integral Laurent coefficients. This proves finite support of `c_{n,i},` not just the existence of an infinite Euler product. Source: GSWZ Theorem 6, (81)–(89), pp. 24–25. *Needs:* §§5.1–5.3. The orbit proof makes this theorem independent of the Gaussian regularity obligations below.

For an admissible F prove admissible_dworkLog directly from its plethystic sum:

```text
log F(t^p,q^p)−p log F(t,q)
 =p ∑_{n≠0}∑_{ℓ≥1,(ℓ,p)=1} L_n(q^ℓ)t^(ℓn)/(ℓ(1−q^ℓ)).
```

At q=ζ_m+x, p∤m, this belongs to `(p/x)ℤ_(p)[ζ_m][[t,x]]` coefficientwise. Passing to t^(1/m) gives the corresponding ramified-variable assertion. A simple pole is allowed; this is not an assertion that the regularised local series has every coefficient divisible by p. Source: GSWZ Lemma 2.5, (74)–(75), p. 22. *Needs:* admissibility and Laurent expansion.

**Checks.**

- A=1 has L₁=q and L_n=0 for n>1; A=0 has `L_{e_j}`=−1 and no other nonzero L_n.
- At A=3, `L₁=q³`, `L₂=q⁷` and `L₃=q¹⁰+q¹¹+q¹³`.
- For `A=((2,1),(1,1))`, L_(1,1)=−q³; a product of independent rank-one answers would give zero.
- The wrong-sign version of A=1 gives `L₂=q²/(1+q)`, which is excluded by the root residue calculation.
- The Dwork logarithm at m=1 can have a pole at x=0. Requiring it to lie in pℤ_p[[x]] would erase the regulator term needed in §6.3.

### 5.5 Congruence sums and the level-admissibility definition

For m≥1 and 0≤k_j<m define the normalised congruenceNahmSeries

```text
F_{A,m,k}(t,q)=∑_{n≡k mod m}
 (−1)^(diag(A)·(n−k))
 q^((nᵀAn−kᵀAk+diag(A)·(n−k))/2)
 t^(n−k) ∏_j(q;q)_{k_j}/(q;q)_{n_j}.
```

Its constant term is one and its support is `mℕ^N`. Supply decomposition of F_A into residue classes with the removed k-th summand restored, block and permutation laws, and the m=1 recovery. Put `H=t^kF_{A,m,k}.` Prove the corrected order-m system

```text
∏_{s=0}^{m−1}(1−q^(−s)σ_j)H
 = (−1)^(mA_jj) q^(A_jj m(m+1)/2)t_j^m σ^(mA_{*,j})H.
```

Over ℚ(q), and after its injective embedding into ℚ(ζ)((x)), this system has a unique solution supported on k+`mℕ^N` with t^k coefficient one. The recursion divides by `∏_{s=0}^{m−1}(1−q^(n_j−s))` when n_j≥m; it is nonzero in that field. It is not inverted after evaluating x=0. Sources: GSWZ (32), p. 12, (93)–(95), p. 26 and Theorem 8, (165)–(166), p. 35, with the corrected parity factor. *Needs:* §5.2 and finite Euler recursion.

Define the restricted Adams coefficient family at level m, L₀=0, by

```text
log F=−∑_{n≠0}∑_{ℓ≥1,(ℓ,m)=1}
           L_n(q^ℓ)t^(ℓn)/(ℓ(1−q^(mℓ))).
```

For a constant-one F over ℤ[1/m]((q)) this is a unique family over that ring; rational-function F gives rational-function L_n. The ℓ=1 term makes its recursion triangular. Supply uniqueness, recursion, multiplication-to-addition and m=1 compatibility. Define the coefficient ring

```text
R_m=ℤ[1/m,q,q⁻¹, Φ_d(q)⁻¹ :
            m∤d, or (m|d and gcd(d/m,m)>1)].
```

Define level-m admissibility of F by all L_n∈R_m and `L_n(ζ_m)∈ℤ[1/m]`, where this value lies in the rational subring, not merely in all of ℤ[ζ_m,1/m]. The permitted denominators do not vanish at a primitive m-th root, so this evaluation is defined. Its API includes closure under product and inverse, base change and the restricted Dwork logarithm at roots of order mm′ with gcd(m,m′)=1 and p∤mm′. The same cancellation as in §5.4 gives a `(p/x)` bound. Source: GSWZ Lemma 2.7, (92), pp. 25–26, Definition 2.8 and (93), p. 26, and Lemma 2.10, (108)–(109), p. 28, with the ring enlarged as above.

For the normalised congruence series, use the following API (GSWZ (32), p. 12; (93)–(95), p. 26).

- Each allowed residue k gives constant one and support mℕ^N; restoring the k-th summand reconstructs the residue decomposition of F_A.
- The restored H has t^k coefficient one and satisfies the corrected order-m system, whose Laurent-field solution on that support is unique.

**Checks.**

- m=1,k=0 gives F_A itself, with initial coefficient 1.
- m=2,k=1 gives H=t+O(t³); its left operator (1−σ)(1−q⁻¹σ) kills the initial term since 1−q⁰=0.
- A=1,m=3 gives the right sign (−1)³=−1, while m=2 gives +1 and q-exponent 3.

For the restricted Adams coefficients and level admissibility, use the following API (GSWZ (92)–(93), pp. 25–26; (108)–(109), p. 28).

- The restricted triangular identity gives unique L_n and sends products to sums; m=1 agrees with ordinary plethystic coefficients.
- Level admissibility imposes the stated localisation and rational values in ℤ[1/m]; products and inverses preserve it.

**Checks.**

- F=1+t₁t₂,m=2 gives L_(1,1)=−(1−q²), L_(2,2)=(1−q²)/2; at q=−1 both evaluate to 0.
- For (t;q²)_∞, the second restricted coefficient is 1/(2(1+q²)), giving 1/4 at q=−1; it lies in ℤ[1/2].
- For F_(0,2,0)(s^(1/2),q) the restricted coefficient at s-degree two has a genuine pole at Φ₄=1+q², but Φ₄(−1)=2≠0; the ring R₂ allows it.

**Checks.**

- m=1,k=0 recovers F_A and §5.4. At A=1,m=3 the order-m system has sign −1, not +1.
- For m=2,k_j=1 its initial term is killed by the left operator, as required.
- For F=1+t₁t₂, `L_(1,1)=−(1−q^m)`. At m=2, `L_(2,2)=(1−q²)/2`; at m=1 it is 1−q.
- For A=0,m=2,k=0, in the ordinary-variable series F_(A,2,0)(s^(1/2),q), the restricted coefficient at s-degree two is
  `−(q³+2q−1)/(2(q−1)³(1+q²)(1+q+q²))`. Its Φ₄ pole is allowed by R₂ and contradicts the smaller localisation.
- For `(t;q^m)_∞`, the coefficients at m-smooth positive s are `(1−q^m)/(s(1−q^(ms)))`. At m=2,s=2 this is `1/(2(1+q²))`.
- At A=0,m=2,c=2 the residue's t² coefficient is 1/4. The order c=4 is outside the restricted residue assertion and cannot be used to discard its Φ₄ pole.

### 5.6 Formal Gaussian integration and its comparison obligations

Extend §2.4's formalGaussian to the following h-scaled weighted domain, for an invertible symmetric Λ over a ℚ-algebra:

```text
⟨P(w,h)⟩_Λ = [ exp((h/2)∑_{i,j}(Λ⁻¹)_ij ∂_{w_i}∂_{w_j})P ]_{w=0}.
```

Its domain is the positive-weight completion generated by w_i, h and cubic monomials divided by h, with weight(w_i)=1/2 and weight(h)=1. At each resulting h-degree only finitely many contractions contribute. Supply linearity, Wick's pairing formula, tensor factorisation, change of basis, and the affine-shift identity with its exponential factor. For Λ=((A,B),(Bᵀ,C)), the iterated Fubini formula requires A and C−BᵀA⁻¹B invertible, equivalently A and Λ invertible; invertibility of Λ alone defines only the full integral. Analytic Gaussian moments, when Λ is positive real, agree with this functional by the supplier moments in StandardDistributions; algebraic continuation supplies the rational identities for arbitrary invertible Λ. Sources: GSWZ (110)–(111), p. 28; GSW Lemmas 3.1–3.2, (23)–(25), p. 10; Aarhus II, Proposition 2.13, pp. 8–9. *Needs:* the Gaussian supplier, formal weighted completion and finite polynomial differentiation.

For q=ζ_m e^h, integer k and y_a=ζ_m^(k+a+1)u, s_a=(k+a+1)/m, Z=u^m, define the corrected local remainder by

```text
log ψ = log(uq^(k+1)e^w;q)_∞ −Li₂(Z)/(m²h)
        −Li₁(Z)w/(mh)−Li₀(Z)w²/(2h)
        +∑_{a=0}^{m−1}(s_a−½)log(1−y_a).
```

The Pochhammer logarithm here is its Bernoulli expansion, not an analytic product at a root. The remaining terms have positive weight in the completion just defined. There is generally a w³/h term, so the stronger ideal x times that whole completion is incorrect. The linear subtraction has denominator m and the quadratic subtraction has coefficient 1/2. Supply coefficient bounds, change of representative k, root change, and the h↔x conversion. This repairs GSWZ (114), p. 29, using (59), p. 19.

Write T=(T₁,…,T_N) for the augmentation variable before the level substitution, distinct from the determinant generator in §5.7. Define I_(A,m,k)(T,x) by stationary expansion of the following phase integrand, separately for each k∈(ℤ/m)^N:

```text
 (q;q)_∞^(−N) (−1)^(diag(A)·k)
 q^((kᵀAk+diag(A)·k)/2)T^k
 ·∏_j(q^(k_j+1)e^(w_j);q)_∞
 ·exp((πi diag(A)·w/m +wᵀAw/2+w·log T)/h
       +(diag(A)/2+Ak)·w) dw/(mh)^N.
```

This is a recipe for a formal stationary expansion of GSWZ (112), pp. 28–29, with all its displayed factors retained; it is not an assertion of convergence of this integral. The stationary equations are 1−exp(mw_j)=(−1)^(A_jj)T_j^m∏_i exp(mA_ijw_i). Thus shift to w_j=log(z_j(T^m))/m, use the potential V_A(T^m) with polar factor exp(V_A(T^m)/(m²h)), and covariance Λ_A(T^m)⁻¹ for the centred variables. Fix determinant roots by the constant-one T-branch and use the corrected ψ above with u_j=z_j(T^m)^(1/m). Euler normalisation contributes exp(Nh/24). Define the level collection only after substituting T_j=t_j^(1/m): F̂_(A,m)(t,x)=∑_k I_(A,m,k)(t^(1/m),x). Its stationary tuple, potential and covariance are then z(t), V_A(t) and Λ_A(t)⁻¹ (GSWZ Definition 2.11, (117)–(118), pp. 29–30; GSWZ line 1506). For comparison with §5.5 fix a congruence modulus m, a root order d=ma with gcd(a,m)=1, and 0≤k_j<m. Define the refined congruence expression by

```text
S_k(T,q)=(−1)^(diag(A)·k)q^formalExponent(A,k)T^k/∏_j(q;q)_(k_j),
Ω_(A,m,k)(T,x)=S_k(T,q)⁻¹∑_(ℓ mod d, ℓ≡k mod m) I_(A,d,ℓ)(T,x),
q=ζ_d+x.
```

The quotient removes the k-th summand exactly as §5.5; regularity below must prove cancellation of its apparent negative T-powers. After T=t^(1/m), its stationary tuple is z(t^a), agreeing with z(t) when a=1 (GSWZ (126), p. 31; GSWZ line 1598). A source formula with the old ψ cannot simply be reused as its prefactor.

Three precise comparisons must be proved:

- Name gaussianGlobalNormalisation for the following target: derive every determinant, cyclic product, root and h/x prefactor from this integrand after the correction to ψ. Establish periodicity of the refined index, its root-action covariance and
  `I_ℓ(T)−I_ℓ(σ_jT)=(−1)^(A_jj)T_jq^(A_jj)I_{ℓ−e_j}(σ^(A_{*,j})T)`, where σ_j multiplies T_j by q. On the level variable t=T^m this sends t_j to q^m t_j, not q t_j.
  The affine Gaussian shift contributes its scalar exponential; omitting it is not translation invariance. These identities imply §5.5's corrected order-m equation (GSWZ Lemma 2.15, (137)–(139), p. 32).
- Name gaussianMixedRegularity for the following target: after the exact normalisation, each refined congruence expression Ω_(A,m,k)(T,x), with its specified residue-class sum and k-th summand removed, is supported on mℕ^N in T and has constant coefficient one, with coefficients in ℚ(ζ)((x)); restoring T^k gives support k+mℕ^N and initial coefficient one in the §5.5 normalisation. After T=t^(1/m), the normalised congruence series has ordinary nonnegative t-indices. Control negative powers of every T_j, including mixed poles. The identity
  `Λ_A⁻¹=−(I+DA)⁻¹D`, D=diag((1−z)/z), helps, but does not by itself prove cancellation in a normalised integral. Even a separate term `h Li₀(1−t)/12` has a t⁻¹ pole.
- Once those two targets hold, §5.5's uniqueness over the Laurent field identifies Ω_(A,m,k)(T,x) with F_(A,m,k)(T,q), and in t with F_(A,m,k)(t^(1/m),q), at orders mm′ with gcd(m,m′)=1, and at m=1 identifies the full Gaussian collection with F_A. It identifies V,δ,U and the regulator-exponential normalisation with §5.1's invariants. This identification precedes the level-cancellation target below and does not consume it. The uniqueness step is a proof, not an additional regularity assumption (GSWZ Theorem 8, (163)–(168), pp. 35–36).

These are explicit mathematical targets of the roadmap. The local repair of (114), the independent all-root residue proof and the uniqueness argument do not establish the two global Gaussian comparisons automatically.

Prove levelAdmissibilityCancellation for §5.5’s congruence series. Its residue input is only

```text
log F_{A,m,k}(t,ζ_c+x)=ζ_c V_A(t^c)/(c²x)+O(x⁰),
c=ma, gcd(a,m)=1.
```

This target combines the restricted residue comparison and pole cancellation, using gaussianGlobalNormalisation, gaussianMixedRegularity and the refined-piece identification just proved. They are the corrected content of GSWZ Theorem 7 and Lemma 2.9, (95)–(104), pp. 26–27. The theorem with the smaller printed localisation is false: orders c=ma with gcd(a,m)>1 cannot be used to remove all those cyclotomic poles. A proof must handle nonzero k as well as k=0. Deduce congruenceNahmSeries_levelAdmissible for the ordinary-variable series `F_{A,m,k}(s^(1/m),q)` with §5.5’s definition. *Needs:* §5.5’s restricted Adams coefficients and order-m system, gaussianGlobalNormalisation, gaussianMixedRegularity, the refined-piece identification and cyclotomic pole cancellation.

For the weighted Gaussian completion, use the following API (GSWZ (110)–(111), p. 28; Aarhus II Proposition 2.13, pp. 8–9).

- The positive-weight completion makes Wick contraction finite in each h-degree, with weight(w)=1/2 and weight(h)=1.
- Affine shifts carry the completion-of-square scalar; iterated block contraction requires the first block and its Schur complement invertible.

**Checks.**

- In one coordinate with covariance C=1, ⟨w⁶⟩=15h³ and ⟨w³⟩=0.
- The monomial w³/h has weight 1/2 and is admitted, while w²/h has weight 0 and is not a positive-weight generator.
- Λ=((0,1),(1,0)) has determinant −1 but first block 0, so full contraction exists and the first-variable iterated formula is excluded.

For the formal local remainder and Gaussian collection, use the following API (GSWZ (112)–(118), pp. 28–30; (137)–(139), p. 32).

- The corrected local remainder removes its displayed polar, linear and quadratic terms and respects root changes and representative changes.
- The stationary expression retains every phase factor; global normalisation and mixed regularity identify its refined pieces with the congruence series.

**Checks.**

- m=1,k=0 gives cancelled w²/h coefficient 1/2−1/2=0 and cancelled constant log term −log(1−u)/2+log(1−u)/2=0.
- m=2 gives linear subtraction Li₁(u²)w/(2h); replacing 2 by 4 leaves Li₁(u²)w/(4h) uncancelled.
- N=0 gives the empty Gaussian collection 1; for A=0 in two variables it gives the product of reciprocal Pochhammers, with no negative t-indices.
- A=0,m=2 requires exp(2w)=1−T². At T=1/2 it is 3/4, whereas z(T)=1/2 is wrong; after T=t^(1/2), both the stationary equation and z(t) give 1−t.
- For m=2,k=1 the restored support is T^(1+2n), while the normalised support is T^(2n)=t^n. The shift T↦qT sends t to q²t.
- For m=2,a=3,d=6,k=1 the refined sum uses ℓ=1,3,5; after T=t^(1/2), all three use z(T⁶)=z(t³). At a=1 the sum has only ℓ=1 and uses z(t).

**Checks.**

- The functional gives ⟨1⟩=1, ⟨w_iw_j⟩=h(Λ⁻¹)_ij and all odd monomials zero. In one variable ⟨w⁶⟩=15h³C³, not 9h³C³.
- For Λ=((0,1),(1,0)), det Λ=−1 but A=(0) is singular. The full Wick functional exists and the proposed integration of the first variable does not.
- With m=1,k=0, the corrected ψ has no residual w²/h or constant h⁰w⁰ term. The uncorrected expression has both.
- With m=2 its linear subtraction is `Li₁(u²)w/(2h)`. A denominator 4 fails the stationary equation.
- A constant integrand under affine shift acquires the scalar exponential. For `A=((2,1),(1,1))`, the shift moves both Gaussian coordinates.
- For A=0 the final two-variable collection factors into reciprocal Pochhammer series. Its regularity must be coefficientwise in each variable, not merely in total degree.
- At A=1,m=3 the refined recurrence's sign is negative. Inverting its recursion factor before taking x=0 is essential.

### 5.7 The coefficient scheme and rank-one WKB structure

Define the nondegenerate deformed solution algebra

```text
S_A=ℤ[t_i,t_i⁻¹,z_i,z_i⁻¹,T] /
       (1−z_j−(−1)^(A_jj)t_j∏_i z_i^(A_ij), δ_A T²−1),
S_A^(m)=S_A[1/m,ζ_m,t_i^(±1/m)].
```

The equations are interpreted after clearing the displayed Laurent monomials by units. Prove the universal evaluation property, permutation/base-change laws, all constant-one formal branch evaluations where defined, and étaleness of S_A[1/2] over `ℤ[1/2,t_i^±1]`. The Jacobian of the z-equations is invertible after δ, and the derivative 2δT is invertible after 2. The localisation by t_i⁻¹ must not be described as an étale map over all of ℤ[t] without its localisation. Apply this étaleness result on p-completions only for p≠2. Root variables w_i with w_i^m=z_i form a further Kummer étale extension after m; they are not already in S_A^(m). Sources: GSWZ (36)–(37), pp. 13–14 and the coefficient-ring discussion in §2.7, pp. 35–37. *Needs:* §1.2, §5.2, Laurent polynomial rings, localisations and the étale Jacobian criterion.

For rank one define a separate WKB normalisation

```text
W_A(t,h)=F_A((−1)^A exp(−Ah)t,exp h),
W_A(t,h)−W_A(exp(h)t,h)=t W_A(exp(Ah)t,h),    W_A(0,h)=1,
G_A=W_A(exp(h)t,h)/W_A(t,h)
   =z₀(t)exp(∑_{k≥1}b_k(t)h^k),
log W_A=∑_{k≥−1}c_k(t)h^k,                 c_k(0)=0.
```

Here z₀ is the unique constant-one solution of the **unsigned deformation** `1−z₀=tz₀^A`; it is not the signed z(t) at the same t when A is odd. Put `X=(t/z₀)z₀'` and `Δ_X=X(AX+1)((A−1)X+1)`. Prove `t∂_t=Δ_X∂_X` on rational functions of X and the WKB recursions: `b₁=A(A−1)X²/2`, `b_k∈XΔ_X·ℚ[X]` for k≥2, and `c_k∈Xℚ[X]` for k≥1. The definitions and q-system fix these sequences and their zero constants; they are not arbitrary coefficients. For negative A derive the quotient recurrence by signed telescoping, rather than reading a product with negative length. This is the rank-one algebraicity route of GSWZ (140)–(162), Lemma 2.16 and Corollary 2.17, printed pp. 33–35. It is independent of the Gaussian comparison. No arbitrary-rank polynomial WKB theorem is inferred. *Needs:* §5.2's exact rank-one q-system, the exponential substitution and formal differentiation.

For the nondegenerate coefficient algebra, use the following API (GSWZ (36)–(37), pp. 13–14; §2.7, pp. 35–37).

- It represents the signed equations with unit t,z,δ,T, and maps to each coefficient algebra preserving those units.
- After 2 it is étale over the Laurent t-base; the level extension adjoins t-roots, while roots of z require the separate Kummer extension.

**Checks.**

- In rank zero it is ℤ[T]/(T²−1); at p=2 its derivative 2T is 0, while after 2 it splits into two étale factors.
- A=3,t=1 gives δ=−z²−z−2 of norm −23; omitting inversion of 23 prevents the required integral evaluation.
- For w^m=z with z a unit, m=3 at p=5 gives derivative 3w² a unit; m=p=5 gives derivative 0 modulo 5 and is excluded.

For the rank-one WKB normalisation, use the following API (GSWZ (140)–(162), pp. 33–35).

- The change of variables fixes the unsigned deformation, the q-system and the constants c_k(0)=0.
- The Euler derivative equals Δ_X∂_X; the recursions give the displayed b₁ and the polynomial divisibilities for higher coefficients.

**Checks.**

- A=0 gives z₀=1−t, X=−t/(1−t), Δ_X=X(1−X), and b₁=0.
- A=1 gives z₀=(1+t)⁻¹ and b₁=0; the signed z=(1−t)⁻¹ is a different branch.
- A=3 gives z₀=1−t+3t²−12t³+…, X=−t+5t²−28t³+… and b₁=3X²; forgetting the sign substitution reverses the first z coefficient.

**Checks.**

- T is a unit and encodes a chosen square root of δ⁻¹. Adjoining T does not identify its two components.
- At rank zero S=ℤ[T]/(T²−1); after 2 this is étale with two components. The formal branch T=1 loses the other component.
- At A=3,t=1, `δ=−z²−z−2`; the primes dividing its norm 23 must be inverted for the nondegenerate specialisation.
- At A=0 or A=1 the displayed b₁ is zero. At A=3 its coefficient is 3X², with z₀=1−t+3t²−12t³+… and X=−t+5t²−28t³+…. The signed branch instead has z=1+t+3t²+12t³+…; using it without the change of variable fails the q-system.
- Substituting a ramified or δ=0 solution is excluded even if it satisfies the undeleted Nahm equations.

### Examples

A=3 simultaneously checks the sign of the difference equation, the finite-support polynomials q³,q⁷,q¹⁰+q¹¹+q¹³, the coefficients of z and V, and the negative residue at the second root. The two-variable matrix `((2,1),(1,1))` is a second essential test: its mixed coefficients cannot be reconstructed from diagonal rank-one computations. The A=0,m=2 congruence series is the boundary example that forces the enlarged level coefficient ring.

### Dependencies

Layer 1 only for shared equations and discriminants; HabiroCyclotomicCompletions §1.1, PolylogarithmFunctions §§1.1–1.7 and 3.1–3.6, StandardDistributions Layers 1 and 5, and pinned formal-series and matrix carriers. Formal admissibility uses the orbit proof and is independent of gaussianGlobalNormalisation and gaussianMixedRegularity. The refined level theorem and the Gaussian route to arithmetic membership explicitly require those comparisons and the corrected level cancellation.

## Layer 6: Frobenius and Habiro module membership

### 6.1 Full coefficient algebras and divisibility transfer

For a prime p with p∤2m use the unique Frobenius lift on the p-completion of S_A^(m), and on its Kummer extension w_j^m=z_j. It covers `t_j^(1/m)↦t_j^(p/m)` and ζ_m↦ζ_m^p, lifts z_j↦z_j^p modulo p, and acts on the square-root generator T on every component. Prove functoriality for maps over the fixed Laurent Λ-base and for changes of base whose p-complete base maps satisfy f∘ψ_p=ψ′_p∘f. Under this hypothesis prove the coefficient-algebra square by uniqueness of the étale Frobenius lift. Root-coordinate substitutions and nondegenerate specialisations are compatible only when they satisfy this base square; existence of a map on p-completions alone is insufficient. These are applications of QWittVectors §6.1’s Completed étale Frobenius theorem on the perfectly covered Laurent Λ-base specified above, with the coefficient algebra of §5.7, rather than a new construction of Witt Frobenius. Source: GSWZ §2.7, (169)–(170), pp. 36–37. *Needs:* §5.7 and the étale Frobenius supplier.

Define p-saturation of ι for a commutative-ring homomorphism ι:S→T by the condition that `ι(a)∈pT` implies a∈pS. Its API includes composition and the transfer of p^n-divisibility for every n when p is a non-zero-divisor in T. Prove it by division at one power and induction. When p is a non-zero-divisor in T and ι is injective, equivalently the image of S[1/p] intersects T in the image of S. For a product target, require jointly faithful reduction modulo p on all factors. Injectivity after inverting p is insufficient. The comparison fullCoefficientDivisibilityTransfer must establish this condition for the actual coefficient algebra, or replace the branch argument by an intrinsic proof of the Frobenius congruence on that algebra. This is an independent target in the passage from formal admissibility to GSWZ Theorem 4, (39), p. 14 and its proof (170), pp. 36–37.

A chosen formal branch is not in general faithful. At A=5,p=5, the relation is `t=(z−1)z⁻⁵` and `δ=z⁻⁵(5−4z)`. Modulo 5 the square-root extension has `T²=z⁴`, with maps T↦±z². The normalised branch has T=z². Thus T−z² vanishes there but is nonzero on the other component, where its value is −2z². The inverted t variable makes the branch a Laurent-series map; this does not remove the second component. This counterexample prevents using étaleness alone to infer the required reduction injectivity.

Name gaussianCoefficients_fullAlgebra for the coefficient-localisation theorem: after removing the displayed volume, determinant and cyclic factors, every Gaussian coefficient lies in the stated S_A^(m) Kummer localisation, with only its explicit rational denominators before the p-integrality argument. Prove this by finite Wick contraction at each weight, retaining all components and proving descent for the finite refined sum (GSWZ Lemmas 2.12–2.13, (125)–(129), pp. 30–31). *Needs:* §5.6’s finite Wick contractions and gaussianGlobalNormalisation, with the coefficient algebra of §5.7. This localization target does not use the Frobenius congruence.

For the p-saturation, use the following API (GSWZ (39), p. 14; (170), pp. 36–37, with the full-algebra condition stated here).

- The condition is preserved by composition and, with p regular in the target, transfers every p^n-divisibility.
- For an injective map with p regular in the target it is equivalent to the displayed intersection condition after inverting p; product targets require jointly faithful reduction.

**Checks.**

- The identity on ℤ₅ sends 25 to 25 and transfers valuations 1 and 2 unchanged.
- ℤ₅[u]/(u²−1)→ℤ₅, u↦1 sends u−1 to 0; the other component gives −2, a unit modulo 5, so saturation fails.
- For A=5 at p=5, δ=z⁻⁴ and T=±z² give δT²=1; T−z² evaluates to 0 and −2z², so one branch is insufficient.

**Checks.**

- The identity ℤ_p→ℤ_p is p-saturated; induction transfers all powers.
- The map `ℤ_p[u]/(u²−1)→ℤ_p`, u↦1, loses u−1 and fails the reduction hypothesis for odd p.
- For A=5,p=5 both maps T↦±z² satisfy δT²=1. The negative component detects the nonzero element that the normalised branch loses.
- A split quadratic coefficient algebra keeps both factors; Frobenius and gluing cannot be checked only on the positive square-root branch.
- In rank zero the z-equations disappear but the two square-root components still remain after 2 is inverted.
- For A=0,m=1,t=2,z=−1,δ=−1 in ℤ[1/6,T]/(T²+1), the p=5 base square compares 2⁵=32 with 2; its difference 30 is nonzero in the 5-completion, so this étale specialisation is excluded from Frobenius naturality. At t=1 the base square instead compares 1 with 1.

### 6.2 A first-jet integrality calculation

Define the polynomial Jet(C,b,Q,T₃,U₄,c) over a characteristic-zero field, for a finite coordinate set, by

```text
c +½∑_iQ_iC_ii +½∑_{i,j}b_i b_j C_ij
  +½∑_{i,j}T₃,i b_j C_ii C_ij +⅛∑_iU₄,i C_ii²
  +⅛∑_{i,j}T₃,i T₃,j C_ii C_jj C_ij
  +1/12∑_{i,j}T₃,i T₃,j C_ij³.
```

For symmetric C this is the coefficient of h in the Gaussian integral of
`exp(∑b_iw_i+½∑Q_iw_i²+∑T₃,iw_i³/(6h)+∑U₄,iw_i⁴/(24h)+hc)`.
Prove the identity by Wick contractions, its naturality under coefficient maps and coordinate permutations, its value c for zero covariance, and integrality in any subring containing 1/2 and 1/3 and all displayed inputs. This finite polynomial also makes sense for nonsymmetric C, but the Gaussian interpretation requires symmetry. Source: GSWZ (110), (114), (118), pp. 28–30 with the corrected remainder in §5.6. *Needs:* §5.6's Wick formula; the polynomial itself uses only finite sums.

For a nondegenerate solution over a number field K, choose Δ divisible by 6, disc K, M_K and all denominators required for z_i,z_i⁻¹,(1−z_i)⁻¹,δ⁻¹. For a prime p with p∤Δm and m prime to Δ take the full finite étale algebra
`O=R̂_p[ζ_m,T,w]/(δT²−1,w_j^m−z_j)`, R=𝒪_K[1/Δ]. For 0≤k_j<m put C=Λ_A⁻¹, `y_{j,a}=ζ_m^(k_j+1+a)w_j` and `s_{j,a}=(k_j+1+a)/m`. The regularised single refined piece has first relative x coefficient `ζ_m⁻¹ Jet(C,b,Q,T₃,U₄,c)`, where

```text
b_j=(Ak)_j+A_jj/2+∑_a B₁(s_{j,a})Li₀(y_{j,a}),
Q_j=∑_a B₁(s_{j,a})Li_(-1)(y_{j,a}),
T₃,j=mLi_(-1)(z_j),       U₄,j=m²Li_(-2)(z_j),
c=N/24+∑_j(m/2)∑_a B₂(s_{j,a})Li₀(y_{j,a})
        −∑_j∑_{r=1}^{k_j} rζ_m^r/(1−ζ_m^r).
```

Prove this coefficient lies in O. This local calculation assumes p∤m; it supplies no reexpansion theorem at orders divisible by p. The product over the m conjugate denominators is 1−z_j, a unit, and 1−ζ_m^r is a unit at p∤m for 0<r<m. The Hessian inverse is integral because δ is inverted. The term N/24 comes from Euler normalisation; the last finite sum comes from the restored `(q;q)_{k_j}` factor. Divide only by an individual refined leading constant, after adjoining its finite roots; a sum of such constants may be zero. This gives refinedLinearCoefficient_integral, the local linear-coefficient input to the owner's Dwork generator criterion (GSWZ §3.2, (184)–(195), pp. 39–41). *Needs:* gaussianGlobalNormalisation, the explicit single-piece prefactor and §6.1's full coefficient algebra.

For the Gaussian first jet, use the following API (GSWZ (110), (114), (118), pp. 28–30).

- The displayed polynomial is natural under coefficient maps and permutations; for symmetric covariance it is the relative h coefficient of the specified Gaussian exponential.
- It takes value c at zero covariance and is integral in every subring containing 1/2,1/3 and all inputs.

**Checks.**

- C=T₃=1, other inputs 0 give 1/8+1/12=5/24, using ⟨w⁶⟩=15h³.
- C=b=T₃=1, other inputs 0 give 1/2+1/2+5/24=29/24; omitting the mixed term gives 17/24.
- C=U₄=1 alone gives 1/8, C=b=1 alone gives 1/2, and an empty coordinate set gives c.

**Checks.**

- In rank one, C=T₃=1 and all other inputs zero give 5/24, using the sixth Gaussian moment.
- C=b=T₃=1 and the other inputs zero give 29/24. Omitting the mixed linear-cubic contraction gives 17/24.
- C=U₄=1 alone gives 1/8; C=b=1 alone gives 1/2. The empty-coordinate case gives c.
- At A=3,m=1 the jet is `−(z−1)(28z²−99z+108)/(12(2z−3)³)`. Substituting `t=(z−1)z⁻³` in the rational first correction of GSWZ (242), p. 49, gives exactly this expression. The exponential in this comparison is exp(V/h), h=log(1+x); retaining a literal exp(V/x) instead introduces exp(V/2) into the leading factor and −V/12 into the first relative coefficient. Removing N/24 changes the jet by −1/24.
- Changing the w_j roots permutes the coefficient components. Vanishing of the total constant does not invalidate membership in their local span, but does prevent normalising that sum by its constant.

### 6.3 The modified potential and the local regulator

Require through the PadicHodgeRegulators local-K₃ contract (gap:local-k3-regulator) the unramified p>3 isomorphism
`D_p:K₃(K_p;ℤ_p)≃p²𝒪_{K_p}`, its compatibility with the Bloch presentation, and generation by root-of-unity classes; from ColemanIntegration Layer L2 consume the reflection identity and integral modified polylogarithms. This is the exact local input of GSWZ Lemma 3.1, Propositions 3.2–3.3 and Theorem 9, (174)–(183), pp. 37–39. The lattice and comparison are supplier targets, not established merely by having a function named Li₂.

Write `φ_p(z_i)=z_i^p exp(pη_i)`, where η_i is defined by the convergent logarithm on 1+pŜ_p, and β_j=∑_iA_ijη_i. Put y_j=1−z_j. Define the algebraic p-adic expression

```text
W_p=p∑_jℓ₂(y_j)+p∑_jβ_jℓ₁(y_j)−(p/2)∑_{i,j}A_ijη_iη_j
    −∑_j∑_{r≥2} p^(r−1)β_j^r Li_(2−r)(y_j^p)/r!.
```

The ℓ_s are the supplier's integral modified polylogarithms; for s≤0, Li_s is its rational function on units with 1−y invertible. Prove convergence, W_p∈pŜ_p and equality with `V_A(t^p)/p−pV_A(t)` on the normalised formal branch. Supply coefficient-map naturality and compatibility with all components, using the intrinsic formula rather than a logarithm of arbitrary z-units. This is the corrected target replacing GSWZ Lemma 2.13, (130), (132)–(135), pp. 31–32. If every η_i=0 its value is p∑ℓ₂(y_i); the sign of the linear ℓ₁ term is positive. *Needs:* étale Frobenius, modified-polylogarithm integrality and §5.3's critical formula.

At t=1, the Iwasawa branch has log(−1)=0, so
`log(1−z_j)=∑_i A_ij log z_i`. The reflection identity gives

```text
−∑Li₂(1−z_j)−½∑A_ij log z_i log z_j
 =∑(Li₂(z_j)+½log z_j log(1−z_j))=D_p(ξ).
```

This has positive D_p sign and no complex ζ(2) constant. Prove modifiedPotential_regulatorSpecialisation: the actual map of p-complete coefficient algebras at the nondegenerate t=1 point sends W_p to
`φ_p(D_pξ)/p−pD_pξ∈pB̂_p`, B=R[T]/(δT²−1). This uses Coleman continuation in each punctured-line variable y_j and the explicit expression above. It never evaluates an arbitrary formal series V_A(t) at t=1. *Needs:* the intrinsic W_p formula, étale specialisation, and the local regulator supplier.

It identifies the principal part of the local section
`f̂=exp(D_pξ/(m²log(q/ζ_m)))f` with the Frobenius logarithmic defect. Prove independently the refined constant-unit congruence
`log φ_p(δ⁻¹U_{m,k}²)−p log(δ⁻¹U_{m,k}²)∈pŜ_p^(m)[w]`, using the quotient of a unit and its p-th power to define the logarithm. Source: GSWZ (130)–(136), pp. 31–32 and §3.1, (174), p. 37. *Needs:* étale Frobenius, gaussianCoefficients_fullAlgebra, the refined unit constants from gaussianGlobalNormalisation and the cyclic-product identities. Neither this congruence nor the intrinsic W_p theorem consumes fullCoefficientFrobeniusCongruence.

The fullCoefficientFrobeniusCongruence target is, for p>3, p∤m and every permitted k,

```text
log F_{A,m,k}(t^(p/m),q^p)−p log F_{A,m,k}(t^(1/m),q)
                  ∈ (p/x) Ŝ_A,p^(m)[w][[x]],  q=ζ_m+x,
```

interpreted through the corrected Gaussian comparison and with coefficient Frobenius on the first term. Its coefficients, including the polar and constant terms, lie on the full algebra. Before this transfer, the Dwork identities of Layer 5 only prove the statement after the appropriate formal expansion. The p=2,3 assertions in the unrestricted version of GSWZ Theorem 4 are separate small-prime targets; the arguments here use 1/2,1/3 and establish neither by omission. *Needs:* §5.5–§5.7, gaussianCoefficients_fullAlgebra, fullCoefficientDivisibilityTransfer, the regular-part Dwork estimate of §5.5 and the independently proved potential and refined constant-unit congruences above.

For the intrinsic modified potential, use the following API (GSWZ (130), (132)–(135), pp. 31–32).

- The convergent expression W_p lies in p times the complete coefficient algebra and commutes with coefficient maps on every component.
- On the formal branch it equals V(t^p)/p−pV(t); at a nondegenerate t=1 point it specialises to φ(D_pξ)/p−pD_pξ.

**Checks.**

- All η_i=0 give W_p=p∑ℓ₂(1−z_i), with every β term and quadratic η term equal to 0.
- ξ=0 gives D_pξ=0 and regulator defect 0/p−p·0=0, excluding a complex π²/6 constant.
- For A=((2,1),(1,1)) and η=(a,b), the quadratic expression is 2a²+2ab+b²; omitting one off-diagonal occurrence changes its ab coefficient from 2 to 1.

**Checks.**

- With ξ=0 the regulator defect is zero. A complex reflection identity with π²/6 is inapplicable to this computation.
- For a coupled 2×2 A the off-diagonal logarithmic term occurs twice before multiplication by 1/2.
- A formal t-series can diverge at t=1 even if each coefficient is algebraic. W_p's convergent p-adic formula is the object specialised.
- The regulator sign does not determine whether a finite Chern class or its inverse indexes the Kummer torsor. That comparison is required separately next.

### 6.4 Kummer orientation, coefficient extension and membership

Let ξ be the integral Bloch/K₃ class of a nondegenerate signed solution over K, retaining the convention-change choices from Layer 1. Let `ε_m(ξ)=c_{ζ_m}(ξ)²` denote the exact finite Chern class exported by the HabiroNumberFields arithmetic contract. Prove nahmConstant_kummerOrientation on the universal Kummer algebra. The full cyclic product and fractional product satisfy `D_fractional(w)^m=D_ζ(w)`; the product `∏D_ζ(w_j)/D_ζ(1)` is P_ζ(ξ) modulo m-th powers. The cyclic factor appearing in the corrected U_m has the inverse P class. Track the additional z-powers, square-root determinant, finite k-sum and normalisation to identify its class with ε_m, including whether the supplier's Chern map agrees with R_ζ or its inverse. The module index cannot be chosen merely to make this identity hold.

The precise constant targets are: each individual refined constant is a unit in its ε_m^(1/m) torsor after the required finite-root scalar extension, and the full constant lies in
`δ⁻¹/² ε_m(ξ)^(1/m) K[ζ_m]`. The full constant may be zero. Changing representatives of ε_m changes the chosen root by the corresponding unit and preserves the torsor. Source: GSWZ corrected (121)–(124), pp. 30–31 and proof of Theorem 5, p. 43; CGZ (7)–(8), p. 3 and (20)–(21), pp. 10–11. *Needs:* gaussianGlobalNormalisation and the supplier's actual finite-Chern orientation theorem; the regulator calculation alone is insufficient.

Define nahmSpecialisationAtOne on the finite presented coefficient algebra S_A by t_j↦1, z_j↦the specified signed solution coordinate and T↦the corresponding generator of B. Its level-m extension sends t_j^(1/m)↦1 and w_j↦a specified m-th root of z_j in the Kummer extension of B. Prove the equations and localised units are preserved, uniqueness on these generators, naturality under field maps and root changes, and commutation with Frobenius when p∤2mΔ. On the base this is 1^p=1 and ζ_m↦ζ_m^p; uniqueness of the étale lift then proves the completed coefficient square. General nondegenerate specialisations require §6.1’s base compatibility condition as well as a map on completions. This is an algebra map on a finite presentation; it is not evaluation of an arbitrary t-adic power series at t=1. Its source and target retain every square-root component. Source: GSWZ §2.7, (169)–(170), pp. 36–37 and Theorem 5, p. 43. *Needs:* §5.7, the chosen solution, Kummer roots and the unit conditions of the conventions.

Use the full finite étale coefficient algebra B=R[T]/(δT²−1), including the split case. Enlarge Δ to include the exceptional integers for its number-field factors. Require through gap:habiro-modules-descent from the HabiroNumberFields arithmetic contract the local generator criterion, Kummer descent, tensor products, inversion and effective global module descent for `H_{R,ξ}`. Consume HabiroRings §§6.1–6.2 for its pullback to B on every factor; the involution compatibility is the composition law for pullback along an R-automorphism of B. The local form of a generator includes
`δ⁻¹/²ε_m^(1/m)(Oˣ+xO+x²K[[x]])`, so its linear coefficient is integral. A general element is a local span of generators and can have zero constant. This is a supplier extension of the module, not a second definition of one (GSWZ Definitions 1.3–1.4, pp. 9–10).

Define the regular Nahm collection by removing the common polar exponential from the universal Gaussian expression before specialising its regular coefficients:

```text
F̂_(A,m)(t,x) = exp(V_A(t)/(m²h)) · Freg_(A,m)(t,x),
f_(A,z,m)(x) = ev_z(Freg_(A,m)(t,x)),    h=log(1+x/ζ_m).
```

The finite-presentation map of this section applies coefficientwise to Freg, after the localisation and descent targets of §6.1. It does not evaluate V_A as a t-adic series at t=1. The completed p-adic expression is then f̂_(A,z,m)=exp(D_pξ/(m²h))f_(A,z,m), with the positive sign of §6.3. Thus the completed Gaussian expression contains a polar exponential, whereas the Habiro-module section is an ordinary power series with its Kummer leading factor (GSWZ paragraph after (41) and Theorem 5, p. 14; Definition 1.3, (22), p. 9).

For the regular Nahm collection use the following API (GSWZ (22), (41)–(42), pp. 9, 14).

- Removing and reinstating the specified exponential are inverse operations on the completed Gaussian expression, and the regular coefficients commute with the permitted coefficient maps.
- The regular leading constants, determinant algebra and Kummer root action are those in this section; the module criterion is applied to the regular collection and its specified completion.

**Checks.**

- In rank zero V=0 and the Gaussian expression 1 remains the regular collection 1; adjoining the determinant algebra still retains both square-root components.
- Formally at A=0,m=1, log F starts −t/h+t/2+…; multiplication by exp(Li₂(t)/h) removes the coefficient −1 of t/h and leaves +1/2 at degree t in the regular logarithm. Removing with the opposite sign would leave −2t/h.
- In the local regulator convention, if D_pξ=d≠0 then log f̂−log f=d/(m²h), whose pole coefficient in x is ζ_m d/m². For m=1 and d=p² this is p²≠0; the completed expression is not an ordinary power series. For d=0 that pole is 0.

State nondegenerateNahm_habiroMembership: for symmetric integral A, a signed solution with δ≠0, R=𝒪_K[1/Δ] as above, and the K₃ lift fixed by the supplier, the regular Nahm collection f_(A,z) at that solution is an element of `H_{B,ξ|B}`, on orders prime to Δ. Its proof must verify all of the following: the corrected full Gaussian comparison, fullCoefficientDivisibilityTransfer and the full Frobenius defect, the first-jet calculation, modifiedPotential_regulatorSpecialisation, nahmConstant_kummerOrientation, the finite étale module extension, and §6.5’s unpoweredProduct_integralDescent and product-gluing equations also at p-divisible orders. This is the precise content sought from GSWZ Theorem 5 and Corollary 1.11, pp. 14–15. The supplier descent and Gaussian comparisons are inputs to this theorem. Neither δ≠0 nor an integral-looking constant term alone proves membership. *Needs:* §§6.1–6.3 and the explicitly listed comparisons.

For the finite-presentation specialisation, use the following API (GSWZ (169)–(170), pp. 36–37).

- The map sends t to 1, z to the given signed solution and T to the full determinant-algebra generator, preserving every relation and inverted element.
- Its level extension sends t-roots to 1 and w-roots to the specified roots; coefficient maps and allowed p-complete Frobenius commute with this map.

**Checks.**

- A=3,t=1 sends the relation to 1−z+z³=0, precisely z³−z+1=0.
- A=2,z=2 over 𝔽₅ makes δ=0, so the proposed map cannot send δ⁻¹ to an inverse: 0·b≠1.
- For split B=R×R the two values of T are a⁻¹ and −a⁻¹ when δ=a²; preserving the algebra retains both, while projecting to one loses (0,1).

**Checks.**

- If δ=a²∈Kˣ, B⊗ℚ is K×K; picking T=a⁻¹ is one factor, not an embedding of the entire B.
- For the figure-eight embedding z=(1+i√3)/2 and r²=i√3, the canonical leading constant is i/r, with δ(i/r)²=1. The scalar 1/r instead gives −1 in that equation and belongs to the separate knot normalisation of §7.4.
- The order m must be prime to Δ; p|m is outside the local generator test but remains in §6.5’s integral descent and reexpansion targets for p∤Δγ. Primes dividing Δ give zero completions and supply no such local test.
- A sum with cancelling constants can belong to the module without being a generator. Membership must not be phrased as nonvanishing at every root.
- A signed knot matrix can be singular or indefinite. Positivity of the analytic datum is not a hypothesis of this endpoint.
- Specialising the signed cubic sends its defining equation to z³−z+1=0. Rotating an m-th root changes the level map by the corresponding Kummer automorphism.
- A proposed specialisation with z=0 or δ=0 cannot preserve the localised units. Evaluating the infinite series ∑tⁿ at t=1 is undefined and is not this finite-presentation map.

### 6.5 Auxiliary systems and the all-order gluing target

For a unit q, γ≥1, arbitrary signed shifts μ=(μ₁,…,μ_γ),ν and arbitrary formal series F⁺,F⁻ over a commutative coefficient ring, define two auxiliary products:

```text
Ψ_{μ,ν}(t)=∏_{i=1}^γ F⁺(q^(γμ_i)t^γ) F⁻(q^(−ν)t),
P_{μ,ν}(t)=∏_{i=1}^γ F⁺(q^(γμ_i)t)   F⁻(q^(−ν)t).
```

Their constant coefficient is `F⁺(0)^γF⁻(0)`; supply coefficient-map naturality and the signed rescaling API. With `R_aF(t)=F(q^a t)` and `S_γF(t)=F(t^γ)`, the positive factors of Ψ are `S_γ(R_{γμ_i}F⁺)`. The reversed composition `R_{γμ_i}(S_γF⁺)` gives q^(γ²μ_i), so the order of these operations matters. In the Nahm application `F⁺=F_A(−,q^γ)`, `F⁻=F_A(−,q⁻¹)`. Write E_ij for an increment of μ_i at coordinate j and A_j for column j. Then prove

```text
P_{μ,ν}−P_{μ+E_ij,ν}
 =(−1)^(A_jj)q^(γ(A_jj+μ_ij))t_j P_{μ+e_i⊗A_j,ν},
P_{μ,ν}−P_{μ,ν+e_j}
 =(−1)^(A_jj)q^(−A_jj−ν_j)t_j P_{μ,ν+A_j},
P_{μ,ν}(…,q^γt_j,…)=P_{μ+1⊗e_j,ν−γe_j}.
```

For Ψ the first t_j is t_j^γ and its covariance is instead
`Ψ(…,qt_j,…)=Ψ_{μ+1⊗e_j,ν−e_j}`; the second equation is unchanged. Prove uniqueness of either complete parameter family with constant one over a commutative coefficient ring when every q^n−1, n>0, is a non-zero-divisor; over a field this is exactly q^n≠1. Mere nonvanishing in a product ring is insufficient. For the difference of two families, induction on total degree makes the first two equations remove parameter dependence at that degree, and covariance forces `(q^(γα_j)−1)c_α=0` for P, or `(q^α_j−1)c_α=0` for Ψ. This works in ℚ(ζ_m)((x)) with q=ζ_m+x; its constant ζ_m having finite order is irrelevant. Sources: GSWZ proof of Theorem 5, (211)–(214), pp. 43–44, with the appropriate covariance for each product. *Needs:* §5.2's exact full-column system.

The unpoweredProduct_integralGluing target concerns P, not Ψ. At gcd(m,γ)=1 take root expansions using
`x↦(ζ_m+x)^γ−ζ_m^γ` and `x↦(ζ_m+x)⁻¹−ζ_m⁻¹`, with coefficient-root transport. After level substitution t↦t^(1/m), establish the Gaussian comparison in S_A^(m)[1/(Δγ)][[x]]. In addition prove unpoweredProduct_integralDescent after each permitted nondegenerate arithmetic specialisation: its zero-shift regular component P_m has coefficients in C_m=B[1/γ]⊗_ℤℤ[ζ_m] for every m>0 coprime to γ, without inverting m. Retain the full tensor algebra on all factors. Descent and scalar-change maps must identify this integral series with the comparison in C_m[1/m][[x]]; existence only in that latter ring is insufficient. For every prime p∤Δγ and every such m, including p|m, prove the reexpansion equation

```text
P_m(X+ζ_(pm)−ζ_m)=φ_p(P_(pm))(X)
                 in (B[1/γ]⊗_ℤℤ[ζ_(pm)])̂_p[[X]].
```

Choose the compatible root systems of HabiroRings §5.2, so ζ_(pm)−ζ_m is p-adically topologically nilpotent; coefficient Frobenius acts on B̂_p and fixes the cyclotomic factor and X. Prove convergence of reexpansion coefficientwise in this completed tensor algebra, and its compatibility with the root relabellings and specialisation maps. These rings do not invert p when p|m. At zero shifts the principal parts cancel. The integral descent and these all-order equations give f(q^γ)^γ f(q⁻¹)∈H_(B[1/γ]) on the stated orders (GSWZ Definition 1.1, (13), p. 7; GSWZ line 260; HabiroRings §§5.2–5.3). Uniqueness identifies two already constructed expressions; it proves no integrality estimate on its own. A proof of all-order coefficient integrality and compatibility with the completed coefficient algebra is a separate required target.

The powered product is a valid auxiliary q-system, but its principal part at zero shifts is `(V_A(t^γ)−V_A(t))/(m²h)`, generally nonzero. It cannot supply this gluing theorem. Inverting γ in the conclusion is essential; integral coefficients at p|γ are false. These corrected contracts replace an inference from formal q-difference uniqueness to integral Habiro gluing in the proof of GSWZ Theorem 5.

For the powered auxiliary product, use the following API (GSWZ (211)–(214), pp. 43–44, with the displayed substitution convention).

- For unit q its coefficient maps commute with all signed rescalings; its constant is F⁺(0)^γF⁻(0).
- Its first difference equation uses t_j^γ, and its covariance shifts μ by one and ν by one at t_j↦qt_j.

**Checks.**

- γ=2,q=2,F⁺=t,F⁻=1,μ=(1,1) give 16t⁴; reversing substitution and rescaling gives 256t⁴.
- γ=1,q=2,F⁺=1,F⁻=t,ν=1 gives t/2, retaining the negative shift.
- With A=0,γ=2 the principal part has t coefficient 1 in −Li₂(t²)+Li₂(t); it is not zero.

For the unpowered auxiliary product, use the following API (GSWZ (211)–(214), pp. 43–44, with the displayed substitution convention).

- The unpowered factors obey the two full-column difference equations and covariance at t_j↦q^γt_j; the constant is F⁺(0)^γF⁻(0).
- Uniqueness of the complete family requires every q^n−1 regular; its zero-shift principal parts cancel, with integral gluing after γ is inverted.

**Checks.**

- γ=2,q=2,F⁺=t,F⁻=1,μ=(1,1) give 16t², different from the powered product 16t⁴.
- In K×K, q=(2,1) gives q−1=(1,0), which annihilates (0,1); nonzero alone does not give uniqueness.
- A=0,γ=5,q=1+x gives t coefficient 3−2x+x²+x³/5+…; 1/5 is needed at degree three.
- For p=5,m=5,γ=1 the value 1/5 belongs to C₅[1/5] but has 5-adic valuation −1 and is excluded from C₅; completion after inverting 5 is zero and would miss this obstruction.
- At the p=5 edge 5→25, the constant families 1 and 1 reexpand to 1=φ₅(1). Assigning P₅=1,P₂₅=0 instead gives 1≠0 in the nonzero completed ring.
- At m=1 the comparison localisation inverts no extra prime; the descent target still imposes the equations on every p→p² edge.

**Checks.**

- At γ=2,q=2,F⁺=t,F⁻=1,μ₁=μ₂=1,ν=0, Ψ=16t⁴ and P=16t². The reversed rescaling error gives 256t⁴.
- At γ=1,q=2,F⁺=1,F⁻=t,ν=1 either product is t/2. Negative shifts are allowed.
- At γ=1,q=2,F⁺=t₁+t₂ and μ=(1,−1), the positive factor is 2t₁+t₂/2.
- For `A=((2,−1),(−1,3))` and `A=((0,1),(1,−2))`, use nonzero signed μ,ν to test all three equations. A diagonal-only shift fails in degree t₁t₂.
- Over K×K, q=(2,1) is not a root of unity but q−1 kills the second component. The uniqueness proof requires regularity, not mere nonvanishing.
- With A=0,γ=2 the powered principal part is `−Li₂(t²)+Li₂(t)`, which is nonzero.
- With A=0,m=1,γ=5, the t coefficient of the unpowered product is
  `5/(1−q⁵)+q/(q−1)=3−2x+x²+x³/5+…`, q=1+x. At A=3 its analogous x³ coefficient is 3224/5. The p=5 integrality assertion requires 1/γ.

### 6.6 Descendants, powers and the converse

For ν∈ℤ^N and q=ζ_m+x define the descendant curve by `t_j^(1/m)=q^(ν_j)`, hence `t_j=q^(mν_j)`. It has t(0)=1. Define descendantPullback by formal étale lifting from a chosen nondegenerate t=1 point, giving z_j(x),δ(x),T(x),w_j(x) with the prescribed constants. Supply uniqueness, ν=0 recovery, signed-shift compatibility and root-coordinate functoriality. Pull back the entire Gaussian expression, including its varying determinant/cyclic prefactor and principal part. This is not a constant map S_A→B, and it is not the same t=q^ν convention at every level. Prove descendantFrobeniusTransport and descendantProductTransport at all orders before asserting membership in the corresponding module; for scalar products the latter includes §6.5’s integral descent before inverting m and its equations when p|m, rather than merely transport in S_A^(m). Source: GSWZ Remark 3.11, p. 44 and (222), p. 46. *Needs:* δ invertible, the formal étale lifting supplier, §6.4 and §6.5.

Using the owner's tensor product law, prove torsionPower_goodOrders: if nξ=0 with its integral convention and lift specified, then f^n belongs to the good-order Habiro ring over the determinant coefficient algebra. An unrestricted all-root power theorem needs the cyclic five-term identity and all-root gluing, including orders dividing the torsion order; give that extension as torsionPower_allRoots, with those additional targets. It is not formal scalar extension from the restricted collection. Symmetrisation at γ=1 is a separate route to an all-root element, developed in Layer 7; its determinant factor δ⁻¹ is already in R.

Prove powerMembership_implies_torsion: if a fixed positive power f^n belongs to the specified ring and the relevant root constants are nonzero at an unbounded set of good orders, use their Kummer classes and finite Chern injectivity to force ξ torsion through the same finitely generated quotient as §4.4. A zero collection or vanishing constants do not imply torsion. Sources: GSWZ Corollary 1.11 and Remark 1.12, p. 15; CGZ Corollary 7.2 and Theorem 7.5, pp. 36–40. *Needs:* the constant orientation, the owner's tensor law and finite Chern injectivity.

For the descendant curve and pullback, use the following API (GSWZ Remark 3.11, p. 44; (222), p. 46).

- The curve has t_j=q^(mν_j) and begins at t=1; formal étaleness gives the unique lifted coordinates from their prescribed constants.
- Zero shifts recover the original collection, and signed shifts, root changes and every varying prefactor are transported before gluing.

**Checks.**

- m=2,q=−1+x,ν=1 gives t=q²=1−2x+x², while t=q begins at −1 and is rejected.
- m=1,ν=−1 gives 1−x+x²−…, a valid unit curve; ν=0 gives exactly t=1.
- For a prefactor t itself the first two curves have linear coefficients −2 and −1, whereas retaining only its constant gives 0 in both cases.

**Checks.**

- ν=0 gives the original collection. At m=2,q=−1+x,ν=1 the curve is `t=q²=1−2x+x²`; using t=q starts at the wrong point −1.
- At m=1,ν=−1 gives `(1+x)⁻¹=1−x+x²−…`, a valid curve.
- Knowing only the value of a prefactor at x=0 misses its linear coefficient under this curve.
- A torsion statement in the rational Bloch group does not choose an integral K₃ lift or trivialise its small-primary ambiguity.
- The zero series belongs to every ring but supplies no nonzero Kummer class for the converse.

### Examples

The A=5,p=5 square-root calculation is a necessary counterexample in the transfer proof. The first-jet formula is an explicit independent test of the corrected Gaussian normalisation. The γ=5 calculation shows why the global product condition takes values over B[1/γ]. Together they separate three requirements: a formal identity, integral coefficients on every coefficient component, and arithmetic gluing across root coordinates.

### Dependencies

Layer 5; QWittVectors §6.1; the HabiroNumberFields arithmetic contract, with the full finite étale extension and effective descent specified; ColemanIntegration Layer L2; the PadicHodgeRegulators local-K₃ contract. Membership and descendant membership retain all stated normalisation, mixed-regularity, level-cancellation, full-algebra transfer, Kummer-orientation, product-gluing and pullback obligations. Small-prime improvements and unrestricted torsion powers require their additional proofs.

## Layer 7: explicit collections and exports

### 7.1 Symmetrisation and residues

For a symmetric integral A define the rational summation kernel

```text
J_A(t,w,q)=∑_{n∈ℕ^N}(−1)^(diag(A)·n)
           q^((nᵀAn+diag(A)·n)/2) w^(An)t^n
           /∏_j(qw_j;q)_{n_j},
P_i(Z)=(−1)^(A_ii)(1−Z_i)⁻¹∏_j Z_j^(A_ij).
```

Its expansion at q=ζ_m+x has coefficients in the explicit ambient localisation `ℤ[ζ_m,t_i,w_i^±1,(1−w_i^m)⁻¹,(1−t_i^mP_i(w^m))⁻¹]`. Any smaller ring for a residue requires a separate cancellation proof. Prove this by splitting each summation index into a residue and a multiple of m and summing the resulting geometric-polynomial series. Supply permutation, block-sum, root-change and coefficient recursion APIs for J; it is a Nahm-specific rational kernel, not a new general q-binomial object (GSWZ §4.1, (215)–(217), pp. 44–45).

Fix T_i^m=t_i and the constant-one solution z(t). Put β_i=A_ii−∑_j A_ij and `c_A=∑_{i<j}A_ij`. Define nahmSymmetrisation at order m as the sum of the ordinary ordered multivariate residues at w^m=z(t) of

```text
(−1)^(N+tr A) q^(−c_A) (∏_i T_i⁻¹ w_i^β_i) J_A(T,w,ζ_m+x) ∏_i dw_i/w_i.
```

The residues are taken coefficientwise in x along this one nondegenerate branch. For independent μ,ν∈ℤ^N, insert `q^(∑ν_i)w^(μ+ν)` and replace J_A(T,w,q) by J_A(q^μT,w,q). Their product counterpart is `F_A(q^μT,q)F_A(q^(−ν)T,q⁻¹)`. Supply linearity, Kummer-root permutation, branch evaluation and base-change APIs.

Prove `formalNahmSeries_symmetrisation_qBinomial`, the general formal product formula for every symmetric integral A,

```text
F_A(T,q)F_A(T,q⁻¹)
 = ∑_{k∈ℕ^N} (−1)^(diag(A−I)·k)
     q^(−(kᵀ(A−I)k+diag(A−I)·k)/2)
     ∏_j [(Ak)_j+A_jj−1 choose k_j]_q T^k.
```

Define `generalizedQBinomial` for an integer upper index r and k≥0 by the bracket `(q^(r−k+1);q)_k/(q;q)_k` in ℚ(q). It is the standard-parameter specialisation of QuantumEnvelopingAlgebras §QEA6’s integral Laurent polynomial, also when r<0; do not replace negative upper indices by zero. In Suggested.lean the second factor is formalNahmSeries (I−A), which equals F_A(T,q⁻¹) by the finite Euler-factor inversion identity of §5.2; the signature states this formula at every multivariate coefficient. This is the general theorem of GW Proposition 1.14, (47), p. 11, proved using (173), p. 30. The cubic formula in §7.2 is its specialisation. *Needs:* §5.2, the supplied finite q-binomial identity and QuantumEnvelopingAlgebras §QEA6’s integer upper-index Laurent polynomial with the parameter conversion below.

Prove nahmSymmetrisation_product by taking, at each T-degree, the residues of the finite rational coefficient before coalescing its poles at q=ζ_m+x. The factor w^β changes the exponent in that coefficient to `Ak+diag(A)` at n=k+1; the rational residue calculation yields exactly the preceding generalized q-binomial coefficient. For n=k+1, the one-variable residue sum is `(−1)^n q^(−nr+n(n−1)/2)[r−1 choose n−1]_q` with r=(Ak)_i+A_ii. Combining all exponents leaves the extra scalar q^c_A; the factor q^(−c_A) cancels it, and the displayed sign fixes the augmentation at +1. This also proves the shifted comparison and its complete two-parameter recurrence; a q-difference uniqueness argument uses the recurrence of §6.5 with γ=1. No arbitrary choice of a normalising scalar is permitted. *Needs:* the general product formula, rational residues and §6.5’s uniqueness.

At x=0 the logarithmic pole Jacobian is mΛ_A. Its inverse determinant is
`(−1)^(N+tr A)∏_i t_i z_i^(−β_i)/(m^Nδ_A(t))`.
Consequently the corrected finite sum is

```text
ζ_m^(−c_A)(∏_i T_i^(m−1))/(m^Nδ_A(t))
  ∑_{w^m=z(t)} w^((1−m)β)
  ∑_{0≤n_i<m} (−1)^(diag(A)·n) ζ_m^formalExponent(A,n)
        w^(An) T^n /∏_j(ζ_m w_j;ζ_m)_{n_j}.
```

All powers and the Jacobian factor are retained. At m=1 this is δ_A(t)⁻¹. The apparent negative T-powers cancel in the summed expression by the product formula. The all-order coefficients have their rational algebraic continuation on the nondegenerate solution scheme. Prove residueDescendant_habiro: for a reduced zero-dimensional t=1 solution algebra, with 6, its discriminant and δ inverted, the specialised shifted residue collection belongs to the number-field Habiro ring. This gives an all-root symmetrisation and its descendants without choosing δ⁻¹/². It requires §6.5’s unpoweredProduct_integralDescent at γ=1 over B. Prove symmetrisationDeterminantDescent: the scalar product is invariant under T↦−T and descends along the faithfully flat finite étale algebra B/R; hence every root coefficient is in R⊗_ℤℤ[ζ_m] before inverting m, and its reexpansion equations also hold when p|m. Descent applies to the full cyclotomic tensor algebras and their completed comparison maps. Its shifted variants additionally require descendantProductTransport with the same integral coefficient rings. It uses the corrected Frobenius and product compatibilities of Layer 6 and the owner's ring gluing; a rational residue at each root alone does not prove that compatibility. Sources: GSWZ Theorems 11–12, (218)–(231), pp. 45–47. *Needs:* §§5.2–5.3, §§6.1–6.6 and finite residue algebra; no topological invariant theorem.

For the rational Nahm kernel, use the following API (GSWZ (215)–(217), pp. 44–45).

- The root expansion takes values in the stated localisation, commutes with coordinate permutations, coefficient maps and root changes, and factors on blocks.
- Its finite rational coefficients obey the summand recursion; all indicated denominators are retained until a separate residue cancellation.

**Checks.**

- A=0,N=m=1 gives J=(1−w)/(1−w−t), with t=0 value 1 and t coefficient 1/(1−w).
- Its first x coefficient at t=u,w=1−2u is 2/u−4; excluding (1−w)⁻¹ would falsely predict regularity at u=0.
- N=0 gives J=1; at w+t=1 in the rank-one example the denominator is 0, so this point is excluded.

For the ordered Nahm symmetrisation, use the following API (GSWZ (218)–(231), pp. 45–47; GW (47), p. 11).

- The ordered residue is linear and invariant under permutations of the Kummer roots, with the sign, coordinate weight and q^(−c_A) fixed as displayed.
- It equals the general formal product and its shifted variant; after nondegenerate arithmetic specialisation it has the stated all-root membership.

**Checks.**

- A=0,N=m=1 gives raw residue −1/(1−t) and normalised residue +1/(1−t).
- A=0,N=1,m=2,T=3/5 gives inner sum 16/3 and normalised value (3/5)(16/3)/(2(16/25))=5/2=1/(1−T).
- A=((0,1),(1,0)),m=2,T₁=T₂=1/3 gives (1+T)/(1−T)=2; omitting ζ^(−c_A) gives −2.

For the generalised Gaussian binomial, use the following API (GW Proposition 1.14, (47), p. 11).

- The rational quotient is a Laurent polynomial for every integer upper index; for nonnegative upper indices it agrees with the supplied Gaussian polynomial.
- The empty lower index gives 1, and the negative-upper identity is [−r choose k]_q=(−1)^k q^(−rk−k(k−1)/2)[r+k−1 choose k]_q for r>0.

**Checks.**

- r=−1,k=2,q=2 gives 1/8, in agreement with (−1)²2^(−3); replacing negative upper indices by zero gives 0.
- r=−4,k=2,q=2 gives 155/512; r=2,k=1 gives 3, agreeing with the native Gaussian polynomial.
- Every r with k=0 gives 1; r=0,k=1 gives 0, so the empty case cannot be merged with vanishing above the upper index.

**Checks.**

- At rank zero J=1 and the residue in zero variables is 1. The empty determinant contributes no extra scalar.
- For δ=a² and B=R×R the scalar symmetrisation has the same value δ⁻¹ on T=±a⁻¹, so it descends to R; the element (1,−1) is not invariant and would not descend. For the figure-eight determinant, (±i/r)²=δ⁻¹ gives the same test.
- For A=0,N=m=1, J=(1−w)/(1−w−t) and its raw t⁻¹dw/w residue at w=1−t is −1/(1−t). The sign in the defined form changes this to +1/(1−t), in agreement with Euler’s two identities.
- For A=0,N=1,m=2,T²=t, the unnormalised finite inner sum is 2+2/T. The corrected value is T(2+2/T)/(2(1−T²))=1/(1−T); dropping T gives a pole at augmentation zero.
- For A=0,N=m=1, the kernel’s first x coefficient is wt(1−w)/(1−w−t)³. At t=u,w=1−2u this is 2/u−4. The old generators alone are regular at u=0; the required inverse of 1−w has a pole there.
- For A=0 and general k, the product formula uses [−1 choose k]_q=(−1)^kq^(−k(k+1)/2) and gives coefficient one. Replacing negative upper indices by zero fails.
- For A=I it uses [k choose k]_q=1 and again gives coefficient one. Both the rank-zero product and a bracket with k=0 are one.
- At q=2, [−4 choose 2]_q=155/512; the A=−1 symmetrised coefficient at degree two is 155/8. The negative-upper-index quotient therefore gives a Laurent value rather than zero.
- For A=((0,1),(1,0)), β=(−1,−1), c_A=1. At q=−1 and T₁=T₂=T the finite formula is (1+T)/(1−T); omitting ζ_m^(−c_A) gives its negative. At augmentation zero the uncorrected residue is q and q^(−c_A) changes it to one for every q.
- For A=3,m=1, the residue is δ⁻¹∈1+tℤ[[t]]. Summing the residues at all three Nahm roots instead gives −1/t and fails this constant-one test.
- Changing the order of Kummer roots leaves the finite sum unchanged. Dropping the factor m^N fails already for m=2 in rank one.
- μ=ν=0 gives ordinary symmetrisation. The shifted identity retains both parameter families; collapsing them loses a q-shift equation.

### 7.2 The signed cubic and its small primes

Take A=3, z³−z+1=0 and K=ℚ(z). The discriminant is −23 and 𝒪_K=ℤ[z]. Prove the exact identities

```text
δ=−z²−z−2,      δ⁻¹=(2z²+3z−9)/23.
```

Apply the general residue theorem over `R₆=ℤ[z,1/138]`. At order one the unshifted collection begins

```text
Ψ₁(x)=(2z²+3z−9)/23
       +0x+(−6477z²−5311z+4318)x²/23⁴+O(x³).
```

Compute the coefficients by exact polynomial reduction, not numerical recognition. For the ratio G=F_3(qt,q)/F_3(t,q), prove that its x-expansion `∑g_k(t)x^k` satisfies g₀=z(t) and `δ(t)^(3k)g_k(t)∈ℤ[t^±1,z]`, using the Riccati equation `1−G+q³tG(t)G(qt)G(q²t)=0`. For its product exponents prove
`z(t)=∏_{n≥1}(1−t^n)^(−n s_n)`, with `s_n=∑_i c_{n,i}` and initial values `1,1,3,10,40,171`. Also prove cubicDT_nonnegative and cubicDT_support: `c_{n,i}≥0`, and for n≥2 the support lies in `3n+1≤i≤n²+n+1`, with `c_{1,3}=1` as the exception. These require a positive coefficient or combinatorial recursion for the cubic series; they do not follow merely from finite support for an arbitrary A. The n=3 row is 1,1,0,1 in degrees 10 through 13. These are targeted rank-one integral recursions, not a claim of arbitrary-rank WKB polynomiality. Sources: GSWZ Example 4.1, (231), p. 47 and §4.2, (234)–(249), pp. 48–50. *Needs:* §§5.2–5.4 and §7.1.

Prove the useful formal identity

```text
F_3(t,q)F_3(t,q⁻¹)=∑_{k≥0}q^(−k(k+1))[3k+2 choose k]_q t^k
                       ∈ℤ[q,q⁻¹][[t]].
```

This follows from the general product formula of §7.1, with upper index 3k+2 and exponent −k(k+1) (GW Proposition 1.14, (47), p. 11). It does not justify summing the t-series at t=1. Use q-Lucas from the q-series supplier to evaluate its constant term at a root. Write T^m=t, `a_ℓ=⌊(3ℓ+2)/m⌋`, `b_ℓ=(3ℓ+2) mod m`. The finite numerator is

```text
δ(t)⁻¹ ∑_{ℓ=0}^{m−1} z(t)^(a_ℓ−2) ζ_m^(−ℓ(ℓ+1))
                              [b_ℓ choose ℓ]_{ζ_m} T^ℓ.
```

For m=2 this is `(z(t)⁻¹+T)/δ(t)`, with z=1+tz³. The missing z⁻¹ in the numerator of Garoufalidis–Wheeler (182), p. 31, must be repaired before using that proof of its Theorem 1.13.

State cubicSmallPrimeDescent: the residue descendants descend from `H_{R₆}` to `H_{ℤ[z,1/23]}` if every coefficient of every root component lies in that smaller ring and the Frobenius reexpansion equations hold at p=2 and p=3 for every m, including orders divisible by those primes. These are two additional all-order local targets. The first few coefficients and the corrected m=2 constant do not establish them. The unshifted route through Garoufalidis–Wheeler Theorem 1.13, pp. 11 and 30–31, requires the corrected numerator and its own complete integrality/gluing argument. *Needs:* §7.1 over R₆, q-Lucas and the stated small-prime inputs.

**Checks.**

- The cubic polynomial has discriminant −23; the unsigned analytic A=3 polynomial instead has discriminant −31.
- The t coefficient of the formal symmetrisation is `q⁻²+q⁻¹+1+q+q²`; it evaluates to 5 at q=1 and 1 at q=−1.
- At q=−1 the t² coefficient is 4. The corrected numerator expands as `1+T+4T²+5T³+21T⁴+28T⁵+…`; `(1+T)/δ(t)` incorrectly gives 5 at T².
- At m=1 the finite numerator is δ(t)⁻¹. At m=2,t=1 it is `(z⁻¹+1)/δ`.
- The first three order-one coefficients lie in ℤ[z,1/23], but this checks neither higher coefficients nor the p=2,3 equations at other roots.
- The product with s₁,…,s₆ above gives `1+t+3t²+12t³+55t⁴+273t⁵+1428t⁶+…`, checking the sign −ns_n.

### 7.3 A nonabelian quartic and its arithmetic

Let `A=((8,5),(5,4))`. Prove that the complete torus-solution algebra is the product of two quartic factors: eliminating the second coordinate gives the two polynomials in GSWZ (257)–(258), with any coordinate-hyperplane factor discarded only after unit localisation. The second factor has `u⁴−u³+3u²−3u+1=0`, `v=u³+3u`, field discriminant 229 and S₄ normal closure. Prove these finite algebraic claims and nonvanishing of a Bloch–Wigner regulator for its class by a proved nonzero bound at one complex embedding. Its non-torsion does not follow from merely comparing discriminants. For the other factor choose a root u of `u⁴+u³+3u²−3u−1=0` and define
the quartic coordinate pair (u,v), where `v=(−9u³−6u²−25u+37)/5`.
This is the degree-four orbit with D₄ normal closure, not the other S₄ orbit in GSWZ (258). For the distinguished real example choose the embedding whose coordinates lie in (0,1). Supply coordinate extensionality, field-map naturality and exact quotient-polynomial witnesses for

```text
1−u=u⁸v⁵,                    1−v=u⁵v⁴,
δ=(753−505u−124u²−186u³)/5,
δ⁻¹=(18+45u−44u²+9u³)/475.
```

Prove u,v,1−u,1−v are units and the determinant definition gives this δ, rather than det A=7. Sources: GSWZ §4.3, (256)–(262), pp. 51–52. *Needs:* §1.2, polynomial quotients and the explicitly specified quartic root.

Put `e=(u³−u²+2)/5`. Prove e²−3e+1=0 and that `(1,u,u²,e)` is an integral basis of 𝒪_K for K=ℚ(u). Its trace Gram matrix is

```text
 4  −1   −5    6
−1  −5   17   −4
−5  17   −1  −15
 6  −4  −15   14
```

with determinant −475. Prove polynomial discriminant −11875, index `[𝒪_K:ℤ[u]]=5`, and `v=−9e−3u²−5u+11`. Norms of u,v,1−u,1−v are −1,1,1,−1; norm δ=9025=5²19². The basis theorem requires maximality, not just the displayed determinant: combine integrality, degree four and the field-discriminant witness, or give the local maximality checks at 5 and 19. This separates exact finite computations from an assumed implementation of computational number theory (GSWZ (257), p. 51, and (261)–(263), pp. 52–53).

Let `k_K=|K₂(𝒪_K)|` and choose Δ divisible by `6·475·k_K`, enlarging it for any scalar factors required by §6.4. The prime ledger is `{2,3,5,19}∪{prime divisors of k_K}`. It is not known to be exactly the first four primes without a tame-kernel witness. The module export uses R=𝒪_K[1/Δ], B=R[T]/(δT²−1) and a specified K₃ lift ξ of [u]+[v], conditional on every membership input of Layer 6. For the displayed real expansion put ε=log(1+x)>0, q=(1+x)⁻¹ and define
the normalised quartic sum `u^4 v^2 f_(A,0,0)(i epsilon/(2 pi))`, denoted quarticNormalisedSum(x).
Here the analytic sum has zero linear and constant terms. Prove quarticNormalisationComparison: its unscaled sum equals `F_A((q⁻⁴,q⁻²),q)`, with the analytic evaluation justified by convergence. The canonical formal series at t=(1,1) instead has linear term (4,2). The leading analytic factor is `det(H)⁻¹/²((1−u)(1−v))⁻¹/²`; multiplying by u⁴v² gives δ⁻¹/². With positive real square roots at the distinguished real embedding, establish

```text
quarticNormalisedSum(x) ∼ exp(π²/(15log(1+x))) δ⁻¹/² (1+a₁x+a₂x²+a₃x³+…)
a₁=(−1284u³+384u²−5520u+2047)/(12·25·19²),
a₂=(−3084024u³−11262336u²−1073760u+17201653)/(32·9·25·19⁴),
a₃=(−1185017476284u³+1129707725184u²−5869777630320u+1818824190547)
                                      /(128·81·625·19⁶),
```

Prove the first three coefficients from the corrected Gaussian formula and the Rogers identity giving π²/15. If its ε-series has coefficients c₁,c₂,c₃, the change of variable gives a₁=c₁, a₂=c₂−c₁/2 and a₃=c₃−c₂+c₁/3. These are coefficients of this specified normalised analytic factor. Transfer to the formal Habiro collection must track the integral shift (−4,−2), q-inversion and the scalar u⁴v² through the module operations of Layer 6; it cannot identify the coefficients with F_A(1,1,q) without those operations. The exact relation 60ξ=0 is a separate quarticBlochTorsion target: require the owner's explicit integral five-term and convention-change witness, including a K₃ lift if a K₃ power statement is desired. Regulator numerics and a circle-valued Rogers value do not prove its exact order. Retain quarticDescendantDimension: exhibit eight descendant indices, exact q-difference reductions spanning the descendant module over ℚ(q), and a rank witness giving dimension eight. The source’s degree-27 denominator bounds `2⁷⁷3⁴⁰5³⁴19⁵²` and, after the stated 60th power, `5³³19⁵⁴` are finite coefficient data; they do not establish all-order membership or the torsion witness. Source: GSWZ (259)–(263), pp. 52–53. *Needs:* Layers 1,5–6, the indicated finite arithmetic witnesses, the K3BlochGroups integral-comparison contract for the five-term and Suslin-lift witnesses, and ArithmeticKTheory §3.4 for finiteness of K₂(𝒪_K), whose order enters Δ.

For the quartic coordinates and normalised sum, use the following API (GSWZ (256)–(263), pp. 51–53).

- The coordinate formula commutes with field embeddings and satisfies both Nahm equations and the determinant discriminant formula.
- The specified analytic normalisation uses zero B,C and multiplies by u⁴v²; its formal interpretation retains t=(q⁻⁴,q⁻²).

**Checks.**

- Modulo u⁴+u³+3u²−3u−1 the two differences 1−u−u⁸v⁵ and 1−v−u⁵v⁴ reduce to 0; using 5v instead does not.
- The displayed δδ⁻¹ reduces to 1 and norm δ=9025; det A=7 has a different norm and is not the discriminant.
- At the positive embedding u≈0.8848290126,v≈0.7893936913, the specified a₁≈−0.03163535; the canonical unshifted formal coefficient is approximately −0.82468690.

**Checks.**

- Omitting the denominator 5 replaces v by 5v and fails the Nahm equations. u=0 is not an admitted root.
- Multiplication of the displayed δ and δ⁻¹ reduces to 1 modulo the quartic; det A=7 does not satisfy this inverse formula.
- The integral e contains a written denominator 5. Confusing the polynomial and field discriminants loses the index-five overorder.
- The four coordinate norms are units in ℤ, while norm δ is not. Inverting only coordinate denominators does not make the solution nondegenerate integrally.
- The selected D₄ orbit and the separate S₄ orbit cannot be interchanged by reusing the same primitive-element formula.
- At the positive real embedding, the displayed a₁ is approximately −0.03163535, whereas the formal h-coefficient of the canonical t=(1,1) sum is approximately −0.82468690. The shift and q-direction distinguish these two expansions; the three displayed coefficients satisfy the exact ε-to-x conversion.
- The complex embedding and its conjugate give opposite regulator values, one dependent pair for this signature (2,1), through Layer 1. A small computed value is neither their exact vanishing nor an exact 60-torsion witness.

### 7.4 Knot data, figure-eight and the cubic pair

Record the three formal matrices

```text
A_(4₁)=((1,1),(1,1)),
A_(5₂)=((2,1,1),(1,1,0),(1,0,1)),
A_((-2,3,7))=((1,0,1),(0,1,2),(1,2,4)).
```

For a Neumann–Zagier pair (𝒜,ℬ) with ℬ invertible over ℚ and `ℬ⁻¹𝒜` integral, the matrix dictionary is `A=I−ℬ⁻¹𝒜`, with the remaining flattening/linear shifts retained. Supply this algebraic change-of-data comparison and its hypothesis checks. Presentation independence, triangulation invariance, identification with Kashaev or Chern–Simons invariants, and the volume theorem belong to downstream topological applications in ArithmeticQuantumTopology, for its topological invariant comparisons; these matrix calculations require none of them. Sources: GSWZ Remark 4.2, (233), p. 48; GZ §5, (39)–(42), pp. 10–11. *Needs:* signed formal data and the displayed invertibility, symmetry and integrality hypotheses on the Neumann–Zagier pair. A topological application separately needs its own triangulation interface.

For the figure-eight matrix, prove z₁=z₂=z, z²−z+1=0, K=ℚ(√−3), disc K=−3 and δ=(2−z)/z=−s, where z=ζ₆=(1+i√3)/2 and s=2z−1=i√3. Its norm is 3. The class is ξ=2[ζ₆], whose Bloch–Wigner value is approximately 2.0298832128 and is nonzero by the positive tetrahedron-volume formula; hence it is not torsion. The geometric equality with a knot-complement volume belongs to ArithmeticQuantumTopology, for its volume comparison.

Put r=3^(1/4)exp(πi/4), so r²=s, and work in the common coefficient field E=K(r,i). Choose the determinant-algebra embedding into E by T↦i/r: δ(i/r)²=1. On this component the canonical regular collection f_can=f_(A,z,1) of §6.4 has, for h=log q,

```text
f_can(h)=(i/r)(1+a h+b h²+O(h³)),
a=−1/24+11/(72s)=(1−11z)/108,
b=−335/15552+11s/5184,
f_can(q)f_can(q⁻¹)=δ⁻¹(1−(q−1)²/27+O((q−1)³)).
```

Prove these coefficients from §6.2’s Wick formula and its next weight: C₁₁=C₂₂=s/3, C₁₂=C₂₁=−(z+1)/3, b_j=z/2, Q_j=−1/2, T₃,j=−1, U₄,j=−s and c=s/12 give the displayed a. These are coefficients of the canonical collection, with both determinant components retained until the embedding is specified.

Define the separate knot-normalised order-one series g(h)=−i exp(h/24)f_can(h). Prove its comparison with the perturbative normalisation in GSWZ (1) and (276), keeping the field embedding, q-direction and fractional q-factor explicit. Its coefficients are

```text
g(h)=r⁻¹(1+11h/(72s)+697h²/(1152(3s)²)+O(h³)),
f_can(h)=i exp(−h/24)g(h),
g(q)g(q⁻¹)=r⁻²(1−(q−1)²/27+O((q−1)³)).
```

Thus the canonical symmetrisation is −1 times the knot-normalised one, and has leading scalar δ⁻¹=−r⁻². The factor exp(−h/24) cancels under q inversion but changes the single-series first jet. The scalar i requires the stated common coefficient extension E; it is not in K and is not assumed to lie in the canonical determinant algebra; no identification of K₃ indices is inferred from this change of normalisation.

To express the Pochhammer comparison of GSWZ (278), put h=log(1+x) and φ(h)=r g(h). Conjugation below acts on coefficients and fixes h. Define the completed knot comparison series by

```text
ĝ(x)=r⁻¹ exp((3/2)(Log(1−z)−Log(1−z²)))
       exp(−3Li₂(z²)/h) · conjugate(φ(h)).
```

The factor logarithms are principal and Li₂ is their radial continuation. Interpret the Pochhammer factor by its Bernoulli expansion, so polar exponentials cancel before any power-series assertion. Name figureEightPochhammerTransport for this change from g, together with its explicit transport from f_can through g=−i exp(h/24)f_can. Obtain the transport from the factor-log expansion in GSWZ (59)–(60), pp. 19–20, and prove

```text
r ĝ(x)(1+x)^(−1/24)(z²;1+x)_∞³(1−z)^(−3/2)
 =1+(5z−7)x/27+O(x²).
```

Each fractional power uses the specified logarithm. This is a formal comparison. Membership on the specified orders is asserted for the canonical collection through §6.4, and all-root membership for its scalar symmetrisation through §7.1 and §6.5’s integral descent, with the specified K₃ lift and all their hypotheses. Extending the knot-normalised order-one comparison to a module comparison requires compatible fractional q-branches at every root, coefficient extension, scalar transport and the owner's K₃-index comparison; the displayed first jet supplies none of those. All-order integrality away from 3 remains the coefficient and reexpansion target in those integral root rings. Retain inverse Frobenius in the HabiroNumberFields abelian scalar convention. Sources: GSWZ (1)–(2), p. 3 and §4.5, (276)–(278), pp. 54–55; GSWZ lines 2718–2741. *Needs:* §§5.6, 6.2, 6.4–6.5, 7.1 and the cyclic-product supplier.

For the other two knots choose the common cubic trace-field factor K=ℚ(α), α³−α²+1=0, disc K=−23. The 5₂ solution also has a primitive element satisfying u³−u²+2u−1=0. The pretzel solution algebra has another component in ℚ(2cos(2π/7)), so the complete algebras and complete collections differ. Their selected Bloch classes agree modulo the stated 6-primary ambiguity; matching K₃ indices still requires a choice and a comparison. Their q-inverted product in the selected factor has leading scalar

```text
c=(−6α²+10α−4)⁻¹/² (−24α²+32α−26)⁻¹/².
```

Retain both square roots, and prove `−24α²+32α−26=−2(2α²−2α+3)²`. The further simplification printed in GSWZ (280) is not this product. A transported tensor-product statement requires matching module indices and the needed scalar extensions. The source records denominator `2^1997·23^581` for its degree-400 coefficient data. This finite denominator bound is background for the all-order integrality target. Sources: GSWZ §4.6, (279)–(288), pp. 55–57. *Needs:* the selected field factors, Layers 1,5–6 and the supplier tensor law.

For the figure-eight completed transport, use the following API (GSWZ (276)–(278), pp. 54–55).

- The canonical determinant root is i/r; g=−i exp(h/24)f_can fixes the separate knot normalisation before the completed transport uses coefficient conjugation and the specified logarithmic scalars.
- Polar exponentials cancel before power-series expansion, yielding the displayed normalised comparison and its root-branch convention.

**Checks.**

- The two polar terms are −3Li₂(z²)/h and +3Li₂(z²)/h, whose sum is 0; the constant log terms likewise sum to 0.
- With z=(1+i√3)/2 the first coefficient is −1/6+5i√3/54=(5z−7)/27.
- Omitting conjugation gives −1/6−i√3/108, different from the required first coefficient; the second coefficient with conjugation is (16−15i√3)/243.

**Checks.**

- A_(4₁) is singular and accepted as formal data; its vector (1,−1) excludes analytic positivity.
- For the canonical coefficients a,b above, 2b−a²=−1/27; for g, a_g=−11s/216 and b_g=−697/31104 give the same −1/27. Their leading squares differ: (i/r)²=δ⁻¹ and r⁻²=−δ⁻¹.
- At m=1 the canonical first jet is −1/24−11s/216, and multiplication by exp(h/24) gives −11s/216=11/(72s). The difference −1/24 persists independently of any level substitution.
- At the conjugate embedding s↦−s both first jets conjugate, while changing only the sign of 1/r leaves δ(±1/r)²=−1 and cannot correct the determinant equation.
- Its leading fourth root is outside K although its square lies there. The determinant extension cannot be discarded. The two scalars i/r and 1/r have ratio i∉K; comparing them uses E=K(r,i), not an unproved scalar operation over K.
- In the completed Pochhammer comparison, the polar exponents −3Li₂(z²)/h and +3Li₂(z²)/h add to zero. The two constant log factors cancel as well, giving constant coefficient one.
- At z=(1+i√3)/2 the x coefficient is (5z−7)/27=(−9+5i√3)/54. Its log coefficient is conjugate(11/(72i√3))−1/24+Li₀(z²)/4, the same number; h=x+O(x²). The second coefficient is (16−15i√3)/243=(−30z+31)/243, matching (278) as well.
- Using φ instead of its conjugate gives −1/6−i√3/108 for that coefficient. The scalar normalization alone cannot correct this different first jet.
- Squaring the displayed scalar c tests the product. Replacing it by `1/(√2(2α²−2α+3))` gives the wrong square.
- Equality of selected trace-field factors is weaker than equality of full solution algebras. The degree-three real pretzel component survives separately.
- Equality modulo 6-torsion of Bloch classes does not canonically identify integral K₃ lifts or global module generators.

### 7.5 p-adic calculations and modular examples

Use Mathlib `HenselianRing.is_henselian` and `IsAdicComplete.henselianRing` for simple-root lifting in general complete coefficient rings; hensels_lemma in the p-adic integer file is specifically over ℤ_p and is not used as a theorem over every DVR. For a finite étale ℤ_p-algebra with a specified integral monic monogenic presentation P whose power-basis index is prime to p, identify its unique continuous Frobenius lift with the unique roots of P congruent to the p-th powers of the residue generators. Prove preservation of P, reduction compatibility and functoriality of evaluations of the Nahm coordinates and δ, using the generic Hensel theorem and QWittVectors §6.1. A presentation with bad index at p does not identify the field’s étale decomposition from its polynomial reduction. Source: GSWZ §4.4, (264)–(275), pp. 53–54. *Needs:* the finite field presentation and Hensel hypotheses as explicit inputs.

Define the scalar `rationalGaussTaylor(m)=a_m` by a_m=1 for m odd, 0 for m≡2 mod4 and 2 for m≡0 mod4; the formula also assigns 2 at m=0, which is excluded from root-indexed assertions. Its associated constant series is `PowerSeries.C a_m`. Prove naturality of that series under coefficient maps, vanishing of every positive-degree coefficient, and `rationalGaussTaylor_eq_gaussSum`: for m>0,

```text
a_m=(1/m)(∑_{k mod m}ζ_m^(k²))(∑_{k mod m}ζ_m^(−k²)).
```

It is independent of the primitive root. For every odd natural number p and every natural number m, a_(pm)=a_m, including m=0. This follows from coprimality with 2 and 4; it is an API fact for the displayed scalar formula. In particular, for odd primes the constant reexpansions satisfy all gluing equations over ℤ[1/2]. At p=2,m=1 they fail over ℤ. Hence the family is in `H_{ℤ[1/2]}` and not H_ℤ. Define the square companion `a_m_prime = (i/m)(sum_(k mod m) zeta_m^(k^2))^2`, using ζ_m=exp(2πi/m). Its four values are i,0,−i,**−2**. The polynomial `½(1+i^m)²` instead gives i,0,−i,**+2**; the two are different at m divisible by 4, so the equality printed in GSWZ (290) must not be used there. Prove that the corrected companion satisfies odd-prime Frobenius gluing over ℤ[i,1/2], with conjugation at p≡3 mod4, and that all its positive-degree coefficients vanish. Sources: GSWZ Example 4.4, (289)–(290), p. 57. *Needs:* the Tau Ceti Gauss sums of finite quadratic modules named in the supplier contracts, applied to ℤ/m with k↦k²/m (nondegenerate for odd m; for 4|m quotient by the quadratic radical {0,m/2}; for m≡2 mod 4 the shift k↦k+m/2 changes each term by −1, so the sum vanishes), and the HabiroNumberFields arithmetic contract's gluing criterion.

For a modular Rogers–Ramanujan test define the rational kernel
`J(z,q)=∑_{k≥0}q^(k(k+1))z^(2k)/(qz;q)_k` and its residue family at w^m=ξ, where ξ²+ξ−1=0. Here F_m is the sum of the raw residues of J(w,q)dw/w at the specified roots. At A=2,t=1 this is the negative of the normalized symmetrisation in §7.1, whose prefactor is −1. Use the same local variable u in q=ζ_m(1−u), then convert to x=−ζ_mu when comparing other sections. Prove rational expansion with denominator `1−z^m−z^(2m)` and constancy of the residues in u. For ξ=(−1−√5)/2 the first residues are
`F₁=−1/2−√5/10`, `F₂=F₃=−1/2+√5/10`, `F₄=F₁`; F₅ depends on the compatible embedding and is 0 or −1. Prove the exact identity
`−5F_m²−5F_m=1` for gcd(m,5)=1 and 0 otherwise, with the resulting collection in `H_{ℤ[1/5]}`. These facts use the Rogers–Ramanujan modularity of QSeriesPartitionsAndMockModularForms §5.2 with gap:qseries-root-modularity and the cusp expansion, not merely the field being abelian. Source: GSWZ Example 4.5, (291)–(295), pp. 57–58. *Needs:* the q-series/modular supplier and the residue comparison.

For the rational Gauss scalar and constant family, use the following API (GSWZ (289), p. 57).

- The scalar has the displayed parity values, and its constant Taylor series commutes with coefficient maps with every positive-degree coefficient zero.
- For positive order it is the normalised squared Gauss modulus; odd multiplication preserves it and yields gluing after 2 is inverted.

**Checks.**

- m=1,2,4 give 1,0,2; for m=4 the sums 2+2i and 2−2i have product 8, divided by 4 gives 2.
- m=0 gives scalar 2, while the empty Gauss sum divided by 0 has totalised value 0; the theorem explicitly excludes this order.
- The edge 1→2 compares 1 and 0 and fails integral 2-adic gluing; multiplication by 3 compares values 1,0,2 with the same 1,0,2.

For the square Gauss companion, use the following API (GSWZ (290), p. 57, with the displayed corrected sign).

- For positive m use ζ_m=exp(2πi/m); the associated constant Taylor family has zero higher coefficients.
- Odd-prime Frobenius gluing uses conjugation on ℤ[i] when p≡3 mod4 and requires 2 inverted.

**Checks.**

- m=1 gives i; m=2 gives 0 from 1+(−1)=0; m=3 gives (i/3)(i√3)²=−i.
- m=4 gives (i/4)(2+2i)²=−2, whereas (1+i⁴)²/2=2.
- The p=3 edge from m=1 to m=3 sends i to −i by conjugation; keeping coefficients fixed would compare i with −i and fail.

For the Rogers–Ramanujan residue kernel and family, use the following API (GSWZ (291)–(295), pp. 57–58).

- The root expansion has denominator 1−z^m−z^(2m), and the specified raw residues are constant in u.
- The family obeys the displayed quadratic identity with its compatible embeddings; the normalised residue has the opposite sign.

**Checks.**

- At the negative golden root the raw value is −1/2−√5/10 and −5F²−5F=1.
- Its conjugate −1/2+√5/10 has the same polynomial value 1 but differs from the first by √5/5.
- At order 5 the two permitted values 0 and −1 both give polynomial value 0; substituting the normalised −F₁ into the raw polynomial gives −4−√5, not 1.

**Checks.**

- For z³−z+1 at p=2, the reduction z³+z+1 is irreducible and separable; Frobenius sends z to z² modulo 2, with a unique lift at every precision.
- The quartic polynomial has index 5, so its mod-5 factorisation is not by itself the field's étale decomposition.
- For the rational Gauss family, m=1,2,4 give 1,0,2. At ζ₄=i the two sums are 2+2i and 2−2i, whose normalised product is 2. The square companion gives i at m=1, −i at m=3, and `(i/4)(2+2i)²=−2` at m=4.
- Multiplying the order by 3 preserves both the zero at m=2 and the two at m=4. The edge 1→2 fails the ℤ₂ gluing equation 1=0.
- The q=1 completion of this family is one, although other root components differ. Order-one data do not determine the collection after 2 is inverted.
- At the specified negative quadratic root, the raw Rogers–Ramanujan residue is F₁=−1/2−√5/10. The normalized §7.1 residue is −F₁=1/2+√5/10=δ⁻¹ and satisfies −5(−F₁)²+5(−F₁)=1; using the raw polynomial with that normalized value gives the wrong sign.
- The Rogers–Ramanujan F₁ and F₂ are conjugate and distinct. At m=5, choosing a compatible embedding is essential for the value 0 or −1.

### 7.6 Degree-zero cohomology and coefficient lines

For a number field K and R=𝒪_K[1/Δ] étale over ℤ after the stated localisation, use the exact supplier comparisons with the direction fixed in the introduction:

```text
κ_R:H_{R/ℤ}≃H_R,       d_R:H(R,F)≃H_{R/ℤ},
η_R=H⁰(d_R)⁻¹∘κ_R⁻¹ : H_R≃H⁰(H(R,F)).
```

The Habiro–Hodge object H(R,F) of the empty-frame pair is concentrated in degree zero; qHdg(R,F) is its q=1 completion. Prove nahmDegreeZeroExport: for each symmetrisation whose actual H_R membership is supplied, η_R gives its degree-zero class, preserving every cyclotomic Taylor expansion, Frobenius reexpansion and q=1 completion. Give the commuting square with H_R→R[[q−1]] and the completed Habiro–Hodge object qHdg(R,F). Supply preservation of one and multiplication and compatibility with permitted localisation in R. This is a ℤ[q]-algebra comparison. An arbitrary element of R does not give an untwisted constant family compatible with arithmetic Frobenius, so no such R-algebra structure is used. Sources: Wagner, Corollaries 2.13 and 3.13, printed pp. 33 and 41. *Needs:* HabiroRings §5.9, HabiroCohomologyFoundations §4.21 and actual membership from §§7.1–7.5.

The rational example is `η_{ℤ[1/2]}(a)`, retaining constants 1,0,2 at orders 1,2,4 and zero higher coefficients. The cubic example over R₆ has the three coefficients in §7.2; descent of that class to ℤ[z,1/23] requires cubicSmallPrimeDescent. The quartic Gaussian collection is first a section of the restricted K₃ module over B, subject to Layer 6's obligations; it is not thereby an element of H_R or an unrestricted degree-zero cohomology class.

For a specified ξ and a supplied global invertible module `L_ξ=H_{B,ξ}`, transport L_ξ along κ and d to an invertible module over `H⁰(H(B,F_B))`. With the owner's tensor theorem this gives `ξ↦[L_ξ]` in its Picard group. Prove compatibility with tensor addition and finite étale scalar extension: an actual morphism of relative pairs induces pullback on the Picard groups by tensoring along its Habiro-ring map, as in HabiroRings §6.1. A collection known only on good orders requires a global extension before it supplies a section of this global line. Freeness after q=1 completion consumes HabiroRings §§6.3–6.6, with the global descent and integral first-fibre hypotheses; the ring comparison and tensor law alone do not prove it. The real regulator tuple from Layer 1 is a different additive invariant; membership gives no comparison isomorphism from that tuple to this Picard class or to crystalline or étale cohomology. Sources: GSWZ Theorem 2, (25)–(26), pp. 10–11 and §3.3, p. 43; Wagner Corollary 3.13, p. 41. *Needs:* the global effective module descent and tensor supplier contracts, HabiroRings §§5.9 and 6.1–6.6, and HabiroCohomologyFoundations §4.21 for B.

For the degree-zero export and transported line, use the following API (Wagner Corollary 3.13, p. 41; HabiroCohomologyFoundations §4.21; HabiroRings §§5.9, 6.1–6.6).

- The inverse of the supplied equivalence sends an actual arithmetic Habiro element to H⁰(H(R,F)), preserving multiplication, root projections and completion.
- Invertible modules are transported along this algebra equivalence and actual scalar-extension maps; tensor addition and completion retain the suppliers’ global hypotheses.

**Checks.**

- The Gauss class has values 1,0,2 at orders 1,2,4; its difference from 1 has 0,−1,1, so its q=1 completion is 0 despite being nonzero globally.
- Along R→R×R, tensor extension of R has component ranks (1,1); restriction of the same module has R-rank 2 and cannot give that Picard map.
- Completed bases 1 and 1+h both have value 1 modulo h and differ by a unit; trivial Picard class does not choose a unique basis.

**Checks.**

- η sends one to one and preserves the zero component of the rational Gauss family at order two.
- The q=1 completion of the rational class is one; the entire class still retains its even-order components. The difference from the unit has values 0,−1,1 at orders 1,2,4 and becomes zero at q=1. Thus replacing H(R,F) by qHdg(R,F) would lose a nonzero class.
- The cubic class has zero linear coefficient over R₆. Its displayed smaller denominators do not prove descent of the class.
- A free completed line can have nontrivial global Picard class. A local nonzero section need not be a global generator.
- For R→B=R×R, scalar extension sends the trivial R-line to the trivial B-line. Its two components have rank one, whereas restricting the B-line to R gives R⊕R of rank two and defines no Picard pullback in that direction.
- The involution of split B exchanges its two trivial-line components; composing that pullback twice is the identity.
- If B splits, the comparison and Picard statements act on every factor, not only a chosen embedding.

### 7.7 The precise higher-cohomology interface

The type of the preceding export is degree zero for Spec R, étale of relative dimension zero over Spec ℤ[1/Δ]. State higherHabiroComparison as a separate geometric comparison target at the full generality of the intended cohomology theory. Garoufalidis–Wheeler Definition 1.2, p. 5, defines H(V) for an R-module with compatible p-adic Frobenius automorphisms at all but finitely many primes, R étale over ℤ[λ]. The rational series at every root must converge on the **whole** open p-adic unit disc and satisfy Frobenius reexpansion for every m at almost every p. In the smooth proper setting of (13)–(14), pp. 5–6, take every degree n and V=Hⁿ_dR(X/B) modulo torsion; no degree-zero restriction is imposed on that construction.

Keep the affine push-forward theorem distinct. Garoufalidis–Wheeler Theorem 1.18, (50)–(53), pp. 12–13, starts with an étale map ℤ[x,λ]→R′, X=Spec R′ over `B′=Spec ℤ[λ,1/Δ(λ)]`, an analytic relative Habiro element f whose Taylor series have positive radius at every prime-ideal completion, and a relative top form ω fixed by the p-Frobenius for almost all p. Its map is
`f↦[fω]∈H_naive^N(X/B′)`, N the number of x variables. Positive radius in this analytic input and whole-unit-disc convergence in H(V) are separate conditions whose preservation is part of the theorem; they must not be interchanged in a comparison.

To export such a class here, specify the family X/B′, its form, its base and exceptional primes, and construct a comparison from that H_naive^N to `H^N(RΓ_Hab(X/B′))` in HabiroCohomologyFoundations §5.13. Require compatibility with all root completions, Frobenius and de Rham specialisation. Any analytic realisation must specify the analytic model and completed localisation of HabiroCohomologyFoundations §§6.1–6.3; those sections pose a comparison problem and supply no analytic equivalence. Crystalline and prismatic applications use the particular squares and hypotheses of its §§8.1–8.18. Supply functoriality under base change only with the corresponding completed comparison theorem. This is the exact higher-cohomology obligation; an arbitrary K₃-indexed scalar section supplies neither X,ω nor such a comparison. *Needs:* the cohomology owners' constructions and an actual geometric input, not an extra premise for scalar Habiro membership.

**Checks.**

- For Spec R étale and n=0 this interface agrees with η_R, including all root components.
- A series with only some positive p-adic radius need not converge on the whole unit disc.
- An affine top-form construction is not silently a smooth proper family theorem. A higher-degree class must carry its actual degree N.
- A regulator-valued real tuple alone has no specified Frobenius, root expansions or geometric form and fails these inputs.

### Examples

The cubic root numerator and the quartic integral basis give exact algebraic tests; the rational Gauss family tests gluing that no order-one expansion can detect. The figure-eight example tests a genuinely non-torsion class and the determinant-root extension. Applying η only after membership is known gives degree-zero classes over the same coefficient rings, while the higher-cohomology comparison keeps its geometric data and analytic hypotheses explicit.

### Dependencies

Layers 1–6; the q-binomial, q-Lucas and Rogers–Ramanujan results of HabiroCyclotomicCompletions §1.1 and QSeriesPartitionsAndMockModularForms §§2.4, 3.3, 5.2 with gap:qseries-root-modularity; the HabiroNumberFields arithmetic contract; HabiroRings §5.9 and §§6.1–6.6, with HabiroCohomologyFoundations §4.21. Topological identifications are downstream uses in ArithmeticQuantumTopology, for its topological invariant comparisons. Higher cohomology and its analytic realisations use gap:higher-habiro-comparison from HabiroCohomologyFoundations §§5.13, 6.1 and 8.1–8.18; they are separate from the algebraic scalar statements here.

## Downstream consumers

`ArithmeticQuantumTopology` consumes the signed Nahm equations, the coherent Gaussian normalisation, selected number-field factors, coefficient extensions and classes with exact relation witnesses to compare triangulation series with its invariants. The Neumann–Zagier dictionary exports its invertibility and integrality hypotheses; it does not export presentation independence or quantum modularity.

The analytic cyclic-dilogarithm acceptance calculation, explicit Nahm examples, signed and unsigned boundary calculations and quartic basis are applications owned here. HabiroNumberFields and K3BlochGroups supply the arithmetic contracts above; these applications impose no reverse prerequisite on their general constructions. The full finite étale coefficient extension and global module descent include the split determinant case.

The geometric application of Habiro cohomology uses actual symmetrised Habiro elements, their degree-zero comparison and conditional coefficient-line transport. Its higher-dimensional form requires gap:higher-habiro-comparison and the data of §7.7; no real regulator tuple is identified with a global Picard class.

## References

Page numbers above are the printed page numbers of the indicated versions; equation and theorem numbers disambiguate different published pagination. All statements are in the conventions fixed here.

- F. Calegari, S. Garoufalidis and D. Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, [arXiv:1712.04887v3](https://arxiv.org/abs/1712.04887v3). The Bloch conventions and finite-Chern comparisons are in §§1–2; the arithmetic radial applications and modularity implication are in §7, pp. 34–41.
- S. Garoufalidis and D. Zagier, *Asymptotics of Nahm sums at roots of unity*, [arXiv:1812.07690v1](https://arxiv.org/abs/1812.07690v1). Lemma 2.1 and Theorem 3.1 provide the radial building blocks; §§4–7 give estimates, data comparisons and modular applications.
- S. Garoufalidis, P. Scholze, C. Wheeler and D. Zagier, *The Habiro ring of a number field*, [arXiv:2412.04241v2](https://arxiv.org/abs/2412.04241v2). The formal-series and Gaussian inputs are in §2, pp. 18–37; the regulator and membership arguments in §3, pp. 37–44; the examples and residues in §4, pp. 44–58. The corrected targets above retain the normalisation, level-ring, coefficient-transfer and gluing requirements.
- M. Vlasenko and S. Zwegers, *Nahm's conjecture: asymptotic computations and counterexamples*, [arXiv:1104.4008](https://arxiv.org/abs/1104.4008). Lemmas 2.1–2.2 and Theorem 2.3, pp. 2–5, give positive critical points and order-one asymptotics.
- D. Zagier, *The dilogarithm function*, [freely readable text](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), II.1A, pp. 23–24, for the increasing Rogers dilogarithm, of which CGZ (42), p. 36, takes the complement; II.3A–C, pp. 41–58, for Nahm’s equations (25) in II.3A, p. 43, the saddle constants (28)–(30) in II.3B, pp. 46–48 and the modularity tests. General analytic dilogarithms remain with PolylogarithmFunctions.
- S. Garoufalidis, M. Storzer and C. Wheeler, *Perturbative invariants of cusped hyperbolic 3-manifolds*, [arXiv:2305.14884v2](https://arxiv.org/abs/2305.14884v2), Lemmas 3.1–3.2, p. 10, for affine shifts and change of variables. These identities are used only after fixing the covariance and its exponential factor.
- D. Bar-Natan, S. Garoufalidis, L. Rozansky and D. Thurston, *The Århus integral of rational homology 3-spheres II: Invariance and universality*, [arXiv:math/9801049v4](https://arxiv.org/abs/math/9801049v4), Proposition 2.13, pp. 8–9, for algebraic Gaussian Fubini.
- S. Garoufalidis and C. Wheeler, *Explicit classes in Habiro cohomology*, [arXiv:2505.19885v1](https://arxiv.org/abs/2505.19885v1). Definition 1.2, p. 5, Theorems 1.13 and 1.18, pp. 11–13, and Proposition 1.14, p. 11, supply the precise comparison questions and the general symmetric-matrix q-binomial product identity; the root numerator in (182), p. 31, is corrected in §7.2.
- F. Wagner, [*q-Hodge filtrations, Habiro cohomology, and ku*](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf), Corollaries 2.13 and 3.13, printed pp. 33 and 41, for the étale number-field/relative Habiro comparison and the degree-zero Habiro–Hodge equivalence.

- The Stacks Project, [Lemma 10.148.3, tag 00UO](https://stacks.math.columbia.edu/tag/00UO), for the equivalence of formal unramifiedness and vanishing Kähler differentials used with the pinned field-finiteness theorem in §1.3.
