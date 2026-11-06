# Roadmap: exotic monoidal structures and abstract automorphicity

**Summary.** Build the triality kernel for GL₂ over every nonarchimedean local field of characteristic different from two, identify its Kirillov spectral action, and construct an exotic symmetric monoidal product on smooth complex representations. Whittaker and determinant-twisted spherical generators determine the unit and associator. Over a global function field of odd characteristic, rational theta summation produces a compact automorphic algebra I. Its modules form a fully faithful abelian category of abstractly automorphic representations, with cuspidal and Eisenstein components, the classical irreducibles, and finite-length automorphic parabolic restriction. The library also constructs spin-dependent spherical convolution and normalization-aware induction and intertwining.

## Scope and ownership

This roadmap owns the GL₂-specific triality representation, spectral rigidification, exotic product, Whittaker-unit centre calculation, associator, categorical trace, theta multiplication, automorphic ideal I, its module category, spin spherical coalgebra and convolution, and the normalization-aware induction and component comparisons. The scalar metaplectic extension is imported; the rigidified lift of the specific triple GL₂ action is owned here. The matrix determinant pairing is a particular quadratic polarization, rather than a new theory of bilinear forms. The unit-free idempotent theorem is owned here because the categorical and monoidal roadmaps state neither its defect-intertwining hypotheses nor its conclusion. The smooth Eilenberg–Watts coevaluation and triangle identities of §5.3, the spherical counit transports of §9.2, and the spin-section and inverse-transpose transport computations of §9.4 are targets of this roadmap.

General smooth representations, their abelian and derived categories, compact induction, Jacquet and Whittaker functors, locally unital Hecke modules, averaging, Bernstein decomposition and the centre belong to SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4, SR.0d.1–SR.0d.2, SR.1.1–SR.1.3, SR.2.1–SR.2.3 and SR.3.2. Jacquet subrepresentation and countable Schur belong to its §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles. The unnormalized mirabolic functors and their exact adjunction sequence belong to its §SR.5.1, mirabolic-derivatives and derivative-exactness; the two segment orientations belong to its §SR.5.2, segment-representations. Their constructions are not targets here. Section 3.2 only specializes the supplied module theory to the Bernstein direct sum and distinguishes full from finite-support Hom. The compact-projective and endomorphism calculation for compact induction from SL₂(O) is supplied there under the exact extension below; §4.3 owns the exotic coalgebra equivalence that uses it. Ordinary K-spherical Satake, owned by its §SR.4.1, does not identify this larger generator. The determinant/trace identities and abstract coinvariant, symmetric-category, algebra-object and module-object carriers are consumed from the pinned Mathlib declarations in Exact supplier contracts. The native smooth discrete dictionary and type-D₄ triality are separate from the analytic triality kernel constructed here.

MetaplecticAutomorphicForms §§0.15–0.18, 1.1–1.4, 2.4b–2.7, 4.1, 4.1a and 4.2–4.4 own the local oscillator representation, generator relations, scalar extension, function-field vector-space Poisson adapter and rational symplectic splitting. This roadmap's §§6.1 and 6.3 own the restricted tensor triality kernel and its rational theta invariance. Fourier analysis and scalar zeta theory belong to AutomorphicLFunctionsAndLocalFactors AL.0–AL.3. Its AL.3, Curve additive analysis, owns the completion-valued adeles, residue characters and Poisson summation; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, 4.8–4.10, 5.8 and 6.1–6.4 own arithmetic degrees, divisor lattices, ray classes, degree-sensitive Chebotarev, adelic groups, central-lattice automorphic modules, constant terms and cusp finiteness. Section 6.2 forms compact and unrestricted smooth functions on the quotient of §6.1 using SmoothRepresentationsOfLocalGroups §SR.1.1, then compares the transpose dual. Local classification and generic models belong to GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with the separate odd equal-characteristic classification and all-generic Kirillov extensions in Exact supplier contracts; function-field cuspidal factorization belongs to AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, Restricted tensor realizations, and cuspidal multiplicity one to its AL.3 with the extension below.

AlgebraicVectorBundles §§L0B–L0C own line bundles and their tensor products. Completed/RestrictedProducts, Scope and ownership and Layers 1–2, owns coordinate maps, finite change of reference, reindexing (Layer 1) and the away-S decomposition (Layer 2) of topological restricted products; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners, owns the algebraic restricted tensor product of complex vector spaces with nonzero reference vectors, its finite-stage maps, functoriality for reference-preserving families and reference rescaling. Neither generic construction is rebuilt; the triality action on the restricted tensor and its coherence maps are constructed in §6.1. EnhancedDerivedSheaves §E5:presentability.2 owns presentable categorical tensors and their universal properties; the ordinary complex-linear extension below supplies the abelian version used in §5.3. Mathlib supplies matrix determinant and trace, algebraic coinvariants, native functors/isomorphisms, symmetric categories, commutative monoid objects and module objects.

## Conventions

**Local context L.** F is a nonarchimedean local field, char F ≠ 2, O its integer ring, π a uniformizer and q its residue cardinality; G = GL₂(F). Characteristic zero includes dyadic F. Fix a nontrivial continuous additive character e:F → ℂ×. Write U = {u(b) = [[1,b],[0,1]]} and θ(u(b)) = e(b). The complex coefficients have their usual algebra and topology for integration; smooth representations have open stabilizers. S(X) denotes locally constant compactly supported functions on a locally profinite Hausdorff space X. A point mass δₐ on the nondiscrete group F× is a distribution in a roughening, never a Schwartz–Bruhat function.

All balanced tensors are smooth relative tensors with their residual actions. Ordinary Jacquet coinvariants and induction from the upper Borel are unnormalized. V(t) = V ⊗ |det|ᵗ. The multiplicative measures give GL₂(O) and O× volume one; additive measures are self-dual for the indicated character and bilinear pairing. The conductor ν is the largest integer with e(π⁻νO) = 1. It describes a lattice of triviality, not the whole kernel of e. Every division by q, a determinant, y, a nonzero section or a unit scalar uses its stated nonvanishing: q ≥ 2, invertible matrices, y ∈ F×, s ≠ 0 and c ∈ ℂ×. No q = 1 local field or characteristic-two field is admitted to L.

For a left action ρ, IRL gives the right action v·g = ρ(gᵀ)v. On the regular bimodule use (gL·f·gR)(h) = f(gR h gL). The ordinary smooth contragredient is D(V); in the spectral comparison Ṽ is that dual as a right module. In the left exotic category use Dτ(V) = D(V) ∘ τ, τ(g) = g⁻ᵀ. Thus the global function dual S̃ is Dτ(S), and its bilinear Petersson pairing is balanced on IRL(S) ⊗G S. No complex conjugation enters this bilinear pairing. Statements about arbitrary limits mean limits in the smooth category, with smoothing where required.

Let Z = ⊕c Zc be the direct sum of the unital Bernstein block centres. A firm Z-module has an invertible multiplication Z ⊗Z M → M, equivalently every vector is fixed by a finite sum of block idempotents. For an idempotented algebra this is the nondegenerate module of SmoothRepresentationsOfLocalGroups §SR.1.3: HM = M, equivalently every vector is fixed by an algebra idempotent. Full central endomorphisms form ∏c Zc. Underlined Hom means ⊕c Hom(Mc,Nc); full Hom allows all block supports. Roughening means the nonsmooth Hecke module HomG(S(G),V), whose smooth part recovers V.

**Global context A.** F is the function field of a smooth proper geometrically connected curve over its full finite constant field of odd characteristic; A is its completed projective adele ring, G = GL₂(A) and Γ = GL₂(F). Fix e on A/F, local self-dual measures and vol(U(F)\U(A)) = 1. Write Iunit,A, YA and EA when distinguishing local and global objects. S = S(Γ\G) has compact quotient support, whereas S̃ has unrestricted support and is smooth. Integrals on automorphic functions use Γ\G. The theta multiplication initially has target S̃; its compact restriction is a theorem. Idele degrees follow FunctionFieldArithmetic §0.1: a uniformizer at a degree-d place has degree d and norm q⁻ᵈ, while a rational idele has degree zero and norm one.

All categories have fixed object and morphism universes and all colimits are small in those universes; presentable-category tensors live in a larger universe. The tensor category of pairs has objects (M,N) of firm Z- and Zsph-modules, product (M⊗Z M′, (M⊗Z N′) ⊕ (N⊗Z M′) ⊕ (N⊗Zsph N′)), and unit (Z,0), using the natural Z-action on Zsph. Its representation functor is faithful; mixed-map naturality is an independent obligation.

**Normalisation witnesses.** For the matrix pairing, B(E₀₀,E₁₁) = 1 and B(E₀₁,E₁₀) = −1. Negative Fourier transform squared reflects a test function, and w² = −I. IRL sends diag(a,1) to the same operator and u(b) to the lower unipotent; using inverse transpose would change both tests. For ν = 1, h = diag(1,−π) gives hKh⁻¹ ∩ U = u(π⁻¹O), q⁻ν = q⁻¹ and determinant mass δπ⁻¹. The norm-twisted Weyl action squares with scalar |a/d||d/a| = 1. Sections using these conventions repeat the corresponding witness.

## Exact supplier contracts

### From Mathlib

Use `Matrix.det_fin_two` in Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean, line 809, over a commutative ring, and `Matrix.trace` in Mathlib/LinearAlgebra/Matrix/Trace.lean, line 43. `Matrix.trace_transpose` and `Matrix.trace_mul_comm` give the native transpose and cyclic trace identities. These do not construct the GL₂ kernel. `Rep.coinvariantsTensor` in Mathlib/RepresentationTheory/Coinvariants.lean, line 410, supplies algebraic diagonal coinvariants, with no smoothness or residual smooth-action assertion. `CategoryTheory.SymmetricCategory` in Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean, line 365, assumes a monoidal category with an associator. `CategoryTheory.CommMon` in Mathlib/CategoryTheory/Monoidal/CommMon_.lean, line 26, and `CategoryTheory.Mod` in Mathlib/CategoryTheory/Monoidal/Mod.lean, line 227, supply genuine algebra and module-object carriers once the exotic category exists. `CategoryTheory.Category`, `CategoryTheory.CategoryStruct.comp` and `CategoryTheory.Iso` supply the morphisms, composition and isomorphisms of the unit-free tensor data of §5.1; `CategoryTheory.Functor` and product categories give the equivalent bifunctor formulation.

### From Tau Ceti

The native smooth discrete representation carrier is `TauCeti.DiscreteRep`, and `TauCeti.SmoothDiscreteTopRep` is the full subcategory of topological representations satisfying `TauCeti.IsSmoothDiscrete`; the latter requires discrete coefficient-module topology and open stabilizers. The additional scalar-continuity field requires the coefficient ring to have the discrete topology when this dictionary is used for arbitrary smooth complex representations; this is separate from the usual complex topology used for integration. For a topological group G, the equivalence `TauCeti.discreteRepEquivSmoothTopRep` identifies these presentations (TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean, lines 256, 601, 615 and 816). The generic restricted-product coordinate and reference transports are consumed through Completed/RestrictedProducts, Layer 1, and the arithmetic specializations below. Suggested.lean imports Mathlib alone: the constructed triality kernel, its smooth balanced products, and the actual exotic automorphic algebra required by the headlines are not among these native carriers. The pinned type-D₄ diagram triality `TauCeti.D4Tripled.trialityAutomorphism` (TauCeti/Algebra/Lie/D4/Tripled/Triality.lean, line 142) is distinct from the S₃ action on the triple GL₂ matrix kernel.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §§SR.0.1–SR.0.4 for smoothness, abelian structure, compact averaging and smooth duals; §SR.0d.1 for the derived smooth category and Ext; §§SR.1.1–SR.1.3 for the actual compact-support function carrier, convolution, locally unital modules and the Hecke equivalence; §§SR.2.1–SR.2.3 for compact induction in stages, adjunctions, Jacquet modules and Whittaker exactness; §SR.3.2 for Bernstein blocks and centres. Use §SR.3a.1, jacquet-subrepresentation, for embedding irreducibles into normalized induction from cuspidal data, and admissibility-of-irreducibles for countable Schur: an irreducible smooth complex representation of a locally profinite group countable at infinity has EndG(V) = ℂ. Use §SR.5.2, segment-representations, for the two Steinberg/character subquotient orientations. Use §SR.5.1, mirabolic-derivatives and derivative-exactness, on P₂ = F×⋉F with coefficients ℂ and the chosen nontrivial smooth θ: Φ⁻ takes θ-coinvariants, Φ⁺ is its compact-induction left adjoint, and Ψ⁻ and Ψ⁺ are ordinary coinvariants and inflation. These are the unnormalized functors, with Φ⁻Φ⁺ ≅ Id and exact sequence 0 → Φ⁺Φ⁻ → Id → Ψ⁺Ψ⁻ → 0. The residue characteristic p is invertible in ℂ and every nonzero character difference is a unit, as required by the supplier's generic-character specialization. Use the nonarchimedean field scope stated there. The ordinary Satake theorem in §SR.4.1 supplies only its stated spherical corner.

The following contracts isolate the additional smooth and centre inputs. Compact averaging uses normalized Haar over ℂ: on C₂, averaging (x,y) gives ((x+y)/2,(x+y)/2); the corresponding coinvariant class is the same class, while unnormalized averaging doubles an invariant vector.

What SmoothRepresentationsOfLocalGroups must provide (gap:smooth-balanced-tensor): Supply the smooth balanced tensor for commuting multi-actions with its residual smooth action, separate cocontinuity, right exactness and the regular-bimodule unit comparison.

What SmoothRepresentationsOfLocalGroups must provide (gap:smooth-tor-residual-action): Supply derived smooth balanced tensor and its two-group Tor spectral sequence with functorial residual commuting actions, including identity-action descent.

What SmoothRepresentationsOfLocalGroups must provide (gap:firm-centre-enrichment): Supply the closed tensor–Hom structure for firm modules over commutative locally unital algebras, roughening/smoothing and finite-Bernstein-support enrichment with its tensor–Hom adjunction.

What SmoothRepresentationsOfLocalGroups must provide (gap:transpose-central-distributions): Supply the invariant-distribution realization of the complex GL₂ Bernstein centre and invariance under matrix transpose over every nonarchimedean field of characteristic different from two.

What SmoothRepresentationsOfLocalGroups must provide (gap:twisted-spherical-centre): Supply projectivity and blockwise compactness of compact induction from SL₂(O), and identify its finite-support endomorphism algebra with the direct sum of the centres of determinant-character Bernstein blocks.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, for the compact-open Fourier model and self-dual inversion; AL.2, Godement–Jacquet standard functions, for local integrals, convergence and continuation; AL.3, Function-field local factors, multiplicity one and converse theorem, for Whittaker integrals and normalization conversion. Representation prerequisites, Restricted tensor realizations, supplies the function-field cuspidal restricted tensor factorization. AL.3, Curve additive analysis, supplies completion-valued adeles, residue characters, quotient measures, product formula and scalar Poisson summation, with finite-dimensional Poisson supplied by the metaplectic adapter. Use the negative kernel e(−xy); on the cyclic group of order three its normalized transform sends δ₁ to 3⁻¹ᐟ²(1,ζ⁻¹,ζ⁻²), and its square is δ₂. The zeta exponents are s+1/2 on det and s−1/2 on the Kirillov variable.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:equal-characteristic-fourier): Supply finite-dimensional Fourier transforms for perfect pairings and their partial-transform compatibilities over every nonarchimedean local field of characteristic different from two and every nontrivial continuous additive character, extending the scalar residue-character normalization of AL.3, Curve additive analysis.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:normalization-module-freeness): Supply the invertible firm convolution module S(F) over S(F×), with a noncanonical generator sending the unit-indicator on O× to that on O, and its torus-coordinate pullbacks and character twists.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:compact-data-global-zeta): For each φ, φ′ ∈ C_c^∞(Γ\GL₂(A)) and Φ ∈ S(M₂(A)), supply a right half-plane of absolute convergence for the double Godement–Jacquet integral ∫GL₂(A) c(g)Φ(g)|det g|ˢ⁺¹ᐟ² d×g, where c(g)=∫Γ\GL₂(A) φ′(h⁻ᵀ)φ(hg)dh and Γ=GL₂(F) over a global function field.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:function-field-cuspidal-multiplicity-one): Supply ordinary cuspidal multiplicity one for each fixed smooth central character in the smooth complex GL₂ cusp space over a global function field, with the quotient measures of Representation prerequisites, Restricted tensor realizations.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §§0.15–0.18, 1.1, 1.3–1.4 for the smooth Schrödinger model and scalar intertwiner extension; §§2.4b–2.7 for Weil operators, relations, unramified splitting and character change; §§4.1, 4.1a and 4.2–4.4 for good lattices, function-field vector-space Poisson, the adelic cover, product formula and rational symplectic splitting. Use the ℂ× scalar pushout of the normalizer extension, rather than claiming the whole triple GL₂ group splits the double cover. The negative B-Fourier operator squared sends Ψ(m,y) to Ψ(−m,y), with |y|² on each four-dimensional transform. This is the same w² witness as §0.4. Rational invariance uses the specified rational lift, never an arbitrary central scalar multiple.

### From TauCetiRoadmap.FunctionFieldArithmetic

Consume §§0.1–0.3 for degrees, degree-one divisors and Picard points; §§2.1–2.3 for completed adelic divisor lattices, self-dual measure and lattice transforms; §§4.8–4.10 for finite degree-zero ray classes and ray class fields; §5.8 for quantitative Chebotarev in each admissible degree; §6.1 for the locally profinite adelic group and its closed discrete rational subgroup; §§6.2–6.4 for central-lattice automorphic modules, constant terms and cusp finiteness with their Ξ-quotient conventions. The compact-support carrier on Γ\G comes from SmoothRepresentationsOfLocalGroups §SR.1.1; the unrestricted carrier is its smooth function dual as in §6.2 below. Its exact supplier contracts for ArithmeticGaloisDuality §R02.3.2 and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis, carry the canonical idele and residue interfaces. A degree-one divisor may be a difference of effective divisors; it is not a rational point. Degrees 2 and 3 give the degree-one idele combination 3−2 = 1 without a degree-one place. For two opposite traced residues r and −r the product phase is e₀(r)e₀(−r) = 1. For ω of order 2k, the scalar lattice is π⁻ᵏO, equal to its annihilator.

What FunctionFieldArithmetic must provide (gap:determinant-pushforward): Supply determinant pushforward C_c^∞(GL₂(F)\GL₂(A)) → C_c^∞(F×\A×) by integration on SL₂ quotient fibres, with compatible Haar disintegration.

What FunctionFieldArithmetic must provide (gap:sl2-rational-unipotent-generation): Supply the inclusion SL₂(A) ⊆ ⟨U(A), GL₂(F)⟩ inside GL₂(A), where U is the upper unipotent subgroup and F is a global function field.

What FunctionFieldArithmetic must provide (gap:eisenstein-constituent-automorphicity): Supply classical automorphicity, as subquotients of unrestricted smooth functions on GL₂(F)\GL₂(A), of every irreducible constituent of global parabolic induction from a smooth character of T(F)\T(A).

What FunctionFieldArithmetic must provide (gap:rational-theta-characteristic): Supply existence of a rational theta characteristic on a smooth proper geometrically connected curve over a finite field of odd characteristic, using the line-bundle tensor carriers of AlgebraicVectorBundles (Dor23, Remark A.2, p. 50, citing Armitage 1967, pp. 238–246; Dor23 line 2512).

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Consume §§R16.2.1 and R16.2.8 for the explicit classification and supercuspidal Kirillov comparison over characteristic-zero local fields, with the two separate extensions below. The classification uses normalized induction I(χ₁,χ₂), with upper-Borel covariance δB¹ᐟ²χ₁χ₂ and right translation; put χ₁χ₂⁻¹ in that order and write ν = |·|F. This normalization is separate from the unnormalized functors in the conventions. SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations, supply the existing subrepresentation, admissibility and segment-orientation inputs, rather than an unconditional classification at this scope. A supercuspidal has compact Kirillov functions and zero Jacquet boundary; a principal series has boundary and must not be assigned the same compact carrier. The trivial determinant character has zero nontrivial Whittaker quotient; Steinberg has Whittaker dimension one. These distinguish the extension contracts from a classification only by central character.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:odd-equal-characteristic-gl2-classification): Extend §R16.2.1 to every nonarchimedean local field F of positive odd characteristic with ν = |·|F, complex coefficients and smooth quasicharacters χ₁,χ₂: normalized I(χ₁,χ₂) is irreducible exactly when χ₁χ₂⁻¹ ∉ {ν,ν⁻¹}, and every irreducible smooth GL₂(F)-representation is a determinant character, an irreducible principal series, an essentially Steinberg representation or a supercuspidal representation, the last three classes being generic and the first nongeneric, using the existing SmoothRepresentationsOfLocalGroups §SR.3a.1 and §SR.5.2 inputs.

What GL2AutomorphicRepresentationsAndTransfer must provide (gap:all-generic-kirillov): Supply the full uniformly smooth Kirillov realization and Jacquet boundary for every generic complex irreducible GL₂ representation over any nonarchimedean field of characteristic different from two.

### From TauCetiRoadmap.AlgebraicVectorBundles

Consume §§L0B–L0C: invertible sheaves and their tensor products, duals, sections and tensor functoriality on the curve. A spin datum uses an actual line bundle L and an isomorphism L⊗L ≅ Ω, not merely equality of divisor degrees. On the projective line L = O(−1) has square O(−2) = Ω; O has square O and fails this condition.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §3.4, Restricted tensor products and finite corners: for a countable index set, complex vector spaces W_v and nonzero reference vectors w_v⁰ outside a finite exceptional set, the restricted tensor product as the filtered colimit of finite tensor products, its finite-stage inclusions, elementary tensors of families equal to the reference almost everywhere, functoriality for families of linear maps preserving the references almost everywhere, and the isomorphism induced by specified nonzero rescalings of the references. Its empty finite stage is ℂ and, for a finite index set, the restricted tensor is the ordinary tensor product. The nonzero-reference hypothesis is required: a zero reference lets a transition kill a nonzero tensor. The smooth group actions, the triality kernel factors and their coherence maps are not supplied there and are constructed in §§6.1, 9.2 and 11.2.

### From Completed/RestrictedProducts

Consume Scope and ownership, Layer 1, Layer 2 and Change of family and double cosets: maps from eventually integral coordinates, finite changes of reference and reindexing (Layer 1), and the finite exceptional-set decomposition (Layer 2). Inserting a reference vector at one extra unramified place changes no restricted tensor; changing reference data at infinitely many places is not a finite-change transport. These topological contracts are distinct from the restricted tensor of representation spaces, which is consumed from AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; its triality specialization is constructed in §6.1.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Consume §E5:presentability.2, Tensor products of presentable categories and module base change, for the categorical tensor universal property, with the following ordinary linear extension. Its stable tensor is not silently applied to a smooth abelian category.

What EnhancedDerivedSheaves must provide (gap:ordinary-presentable-linear-tensor): Supply the ordinary presentable complex-linear categorical tensor representing separately cocontinuous complex-bilinear functors and its comparison with the corresponding module-category universal property, without replacing smooth abelian categories by stable derived categories.

## How to read the build

Layers 0–1 construct and identify the local triality kernel. Layers 2–4 supply its weak tensor structure, Whittaker centre and the two generating subcategories; Layer 5 proves coherence and the trace. Layers 6–8 globalize the construction and build I and its fully faithful module category. Layer 9 is the spin spherical branch, including its counit and transport calculations. Layer 10 develops local normalization-aware induction independently of that spin branch. Layer 11 uses Layer 10 and the automorphic algebra to prove Weyl lifting, components and the irreducible comparison. A Needs line lists the statement carriers and the inputs of the indicated proof route; a different proof may use fewer route inputs.

## Layer 0: Triality kernel and explicit Weil operators

Work in L. Begin with the specific matrix quadratic form, then lift its triple-tensor symmetries and induce the determinant coordinate. The ordinary transpose symmetry and the middle negative Fourier operator are fixed before any tensor product is formed.

### 0.1 Determinant pairing

For a commutative ring R and m,n ∈ M₂(R), put B(m,n)=tr(m)tr(n)−tr(mn). This is the symmetric nondegenerate bilinear polarization det(m+n)−det(m)−det(n). The pairing identifies the free rank-four R-module with its dual, including in characteristic two. This does not identify a quadratic form with half its polarization in characteristic two. In L specialize R = F and on M₂(F)⊗F² use B(m,n)·(v∧v′) as the alternating form.

(Dor23, Construction 2.7 and Remark 2.8, p. 11 (Dor23 line 491; Dor23 line 496).)

A proof route is as follows. Expand the 2×2 determinant and trace over R, then specialize to F for the alternating tensor form. Identify M₂ with F⁴; the Gram matrix pairs E₀₀ with E₁₁ and E₀₁ with −E₁₀, so is invertible. Tensor a symmetric form with the standard alternating form.

The required interface has the following properties.

- The pairing evaluates to tr(m)tr(n)−tr(mn), and is bilinear in each input.
- Its value equals det(m+n)−det(m)−det(n).
- The induced map M₂(R) → M₂(R)∨ is a linear isomorphism over every commutative R; its Gram matrix has determinant one.
- Simultaneous transpose leaves the pairing unchanged.

**Checks.**

- B(E₀₀,E₁₁)=1 and B(E₀₁,E₁₀)=−1. These distinguish determinant polarization from the trace-product pairing and fix the off-diagonal minus sign.
- B(m,m)=2det(m), including singular nonzero matrices. For E₀₁ both sides are zero although the matrix is nonzero, excluding a positive-definite interpretation.
- B([[a,b],[c,d]],[[r,s],[t,u]])=au+dr−bt−cs. At (a,b,c,d) = (1,2,3,4) and (r,s,t,u) = (5,6,7,8), the value is −4 on both sides; a positive cross-term convention gives 60.

**Checks of coefficient generality.**

- Over the zero ring the free module and its dual both have one element; the pairing-induced map is their unique isomorphism.
- Over 𝔽₂, B(E₀₀,E₁₁) = 1 while B(m,m) = 0; perfectness survives but division by two does not reconstruct the quadratic form.
- Over R = ℤ[ε]/(ε²), B(εE₀₀,E₁₁) = ε and the Gram determinant remains one, excluding an unnecessary reducedness or domain hypothesis.

*Needs:* Mathlib `Matrix.det_fin_two`; Mathlib `Matrix.trace`.

### 0.2 Triality symplectic action

Let H={(g₁,g₂,g₃)∈G³ | det(g₁)det(g₂)det(g₃)=1}. On M₂(F)⊗F² let H act by m⊗v↦g₁mg₃ᵀ⊗g₂v. The identification with a triple tensor of two-dimensional spaces extends this to a symplectic action of S₃⋉H; (13) sends m⊗v to mᵀ⊗v.

(Dor23, Constructions 2.7 and 2.9, p. 11 (Dor23 line 496; Dor23 line 509).)

A proof route is as follows. The determinant pairing scales by det(g₁g₃), while the wedge scales by det(g₂). Use the standard symplectic identification of a two-dimensional space with its dual to permute the three tensor factors; check the semidirect relations.

The required interface has the following properties.

- H is the kernel of the product determinant homomorphism G³→F×.
- The action on pure tensors is g₁mg₃ᵀ⊗g₂v.
- Permutation conjugation permutes the three G factors.
- Every element preserves B⊗∧.

**Checks.**

- A triple of scalar matrices lies in H precisely when the product of their determinants is 1. For scalar factors aI,bI,cI this reads (abc)² = 1; demanding abc = 1 would lose valid triples.
- The transposition (13) acts twice as the identity on every m⊗v. For E₀₁ it gives E₁₀ and then E₀₁, excluding inverse-transpose on the matrix carrier.
- For diag(a,1),diag(b,1),diag(c,1), preservation requires abc=1; without this condition the form scales by abc. Taking a = π, b = π⁻¹, c = 1 gives multiplier one; (π,1,1) gives π and fails.

*Needs:* §0.1.

### 0.3 Rigidified triality lift

There is exactly one lift of the preceding S₃⋉H action to the scalar ℂ× metaplectic extension whose operator for (13) on S(M₂(F)) is transpose. Its restriction to SL₂(F)³ is the Weil lift; the determinant-one torus and the order-three permutation obey the semidirect relations.

(Dor23, Proposition 2.12, pp. 12–14 (Dor23 line 546).)

A proof route is as follows. Use the supplied scalar metaplectic extension and Schrödinger model over every F in L. Use perfectness of the SL₂ factors for uniqueness. Split the torus abc=1 by change of variables. Compute the order-three operator by two-dimensional partial Fourier transform and check its cube and conjugation relations.

**Checks.**

- The identity triple has identity operator; multiplying its lift by a scalar c ≠ 1 fails this law.
- For (13), E₀₁ is sent to E₁₀ and then back to E₀₁; its operator is exactly transpose.
- An order-three permutation cubed is identity, and its conjugation sends each SL₂ factor to the indicated other factor.

*Needs:* §0.2; MetaplecticAutomorphicForms §§0.15–0.18, 1.1, 1.3–1.4; MetaplecticAutomorphicForms §§2.4b–2.7.

### 0.4 Triality kernel

Construct the smooth S₃⋉G³-module Y=S(M₂(F)×F×) by induction of the lifted H action. With D=det(g₁g₂g₃), its action on Φ(m)f(y) is |D| times the H-operator (g₁,diag(y,1)g₂diag(y⁻¹D⁻¹,1),g₃) on Φ, multiplied by f(yD). In particular outer actions give Ψ(g₁⁻¹mg₃⁻ᵀ,y det(g₁g₃)); middle [[a,b],[0,1]] gives |a|e(by det m)Ψ(m,ay); middle w=[[0,−1],[1,0]] gives |y|²∫Ψ(n,y)e(−yB(m,n))dn.

(Dor23, Construction 2.13, Examples 2.14–2.15 and Remark 2.16, pp. 12–13; Remark 2.24, p. 17 (Dor23 line 557).)

A proof route is as follows. Identify the induced space using the determinant coordinate and include the modulus twist. Derive the three displayed generator formulas with the additive Haar measure self-dual for e and B. Verify compact support, local constancy and the group relations; transport S₃ rather than inferring an action from commuting generators.

The required interface has the following properties.

- The induced representation is identified with S(M₂(F)×F×).
- The two outer actions are Ψ(g₁⁻¹mg₃⁻ᵀ,y det(g₁g₃)).
- The middle mirabolic action is |a|e(by det m)Ψ(m,ay).
- The middle Weyl operator is the negative B-Fourier transform with factor |y|².
- All three G actions commute, and permutation conjugation permutes them.

**Checks.**

- At m=0 the middle unipotent has phase 1, while at det m≠0 its phase depends on y. For m = I₂ the phase is e(by), which can be nontrivial; declaring the middle unipotent trivial is false.
- Applying middle w twice agrees with middle −I, including the Fourier reflection and determinant scaling. The two |y|² factors cancel the scaled self-dual volume and leave m ↦ −m; omitting them leaves |y|⁻⁴.
- Transposing m interchanges the two outer actions without introducing an inverse in y. For E₀₁ the transpose is E₁₀ and the determinant coordinate keeps its indicated product, excluding a hidden reciprocal.

*Needs:* §0.3; AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts.

### 0.5 Open triality kernel

Let Y°=S(G×F×), embedded in Y by extension by zero. It is stable under the two outer copies of G and the middle mirabolic subgroup, and generates Y under the middle G action. It is not asserted to be a middle G submodule.

(Dor23, §2.1, equations (2.1)–(2.2), p. 8; Lemma 2.19, p. 15; Remark 2.22, p. 17 (Dor23 line 768).)

A proof route is as follows. Use openness of det≠0 to extend compactly supported locally constant functions. For generation apply the unnormalized exact mirabolic functors Φ⁺Φ⁻ from SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness: their image in Y is exactly the functions supported on invertible matrices, and use the Weyl element.

The required interface has the following properties.

- Extension by zero Y°→Y is injective and outer equivariant.
- The middle mirabolic action restricts to Y°.
- The middle G-submodule generated by Y° is Y.
- The image of Φ⁺Φ⁻Y→Y is Y°.

**Checks.**

- A function supported on det m≠0 remains there under the middle unipotent. The coordinate change (m,y) ↦ (m,y·det m) of §1.3 sends (I₂,y) to (I₂,y) and (diag(π,1),y) to (diag(π,1),yπ); reciprocal scaling fails the second value.
- The function Ψ(m,y) = 1M₂(O)(m)·1O×(y) belongs to Y. Over F = 𝔽₃((t)), Ψ(0,1) = Ψ(I₂,1) = 1 and Ψ(t⁻¹I₂,1) = 0. Every extension by zero from Y° vanishes at (0,1), so Ψ is not in its image; taking Y° = Y fails this Check.
- On the inflated trivial mirabolic line, Φ⁻ = 0 because 1−θ(u) is a nonzero complex unit for some u. On Φ⁺(ℂ), Φ⁻ returns ℂ, so Φ⁺Φ⁻ is zero on the trivial orbit and the identity on the nontrivial character orbit.
- A middle Fourier transform can acquire values at m=0; Y° must not be packaged with a full restricted middle G action. A Fourier transform of a small open compact ball around I₂ may have value at m = 0, detecting the failure of middle-G stability.

*Needs:* §0.4; AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness.

### Examples

For m = E₀₁ and n = E₁₀, B(m,n) = −1 and B(m,m) = 0. With g₁ = diag(π,1), g₂ = diag(π⁻¹,1), g₃ = 1 the alternating-form multiplier is one. The negative Fourier square gives reflection m ↦ −m, agreeing with w² = −I.

### Dependencies

Mathlib `Matrix.det_fin_two`; Mathlib `Matrix.trace`; MetaplecticAutomorphicForms §§0.15–0.18, 1.1, 1.3–1.4; MetaplecticAutomorphicForms §§2.4b–2.7; AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness. The within-layer dependencies are the Needs lines above.

## Layer 1: Spectral rigidification and local zeta integrals

Work in L. The three Bernstein actions must agree before spectral contraction is used. The singular rank filtration is controlled by smooth Tor; the open integral then fixes the full Kirillov comparison and both zeta exponents.

### 1.1 Threefold Bernstein balance

Every element of the Bernstein centre of SmoothRepℂ(G) acts identically through each of the three G actions on Y. The resulting equality also holds after applying smooth balanced tensor products.

(Dor23, Lemma 2.17 and Remark 2.18, pp. 14–15 (Dor23 line 748).)

A proof route is as follows. Realize central operators as conjugation-invariant distributions with transpose invariance (supplied by SmoothRepresentationsOfLocalGroups SR.3). Pair S(M₂(F)) with S(G), use density of the invertible locus to compare the two outer actions, then conjugate by S₃.

**Checks.**

- For z = 1 the three actions are idY; for z = 0 they are zero.
- For an idempotent e_c, applying it through any two factors gives e_c² = e_c.
- A pairing between distinct blocks is zero after balancing; equal central scalars alone without transpose invariance do not establish the three-action theorem.

*Needs:* §0.4; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts.

### 1.2 Singular orbit comparison

For a smooth V such that neither V nor its smooth contragredient Ṽ admits an SL₂(F)-invariant linear functional, the singular quotient satisfies Ṽ⊗G S({det m=0}×F×)⊗G V ≅ Jac(Ṽ)⊗T Jac(V), with T=F××F× and unnormalized Jacquet functors.

(Dor23, Lemma 2.20 and proof, pp. 16–17 (Dor23 line 825).)

A proof route is as follows. Separate the rank-zero and rank-one strata. The zero stratum is Q=S(F×), on which each outer G acts through determinant; the hypotheses imply V_SL₂=Ṽ_SL₂=0. Apply the smooth two-group spectral sequence E²_i,j=Tor^G_i(Ṽ,Tor^G_j(V,Q))⇒Tor^(G×G)_(i+j)(Ṽ⊗V,Q). Since Tor^G_0(V,Q)=0, the terms (0,0) and (1,0) vanish. The residual outer action on Tor^G_1(V,Q) still factors through determinant: every SL₂ element induces the identity on Q, hence the identity on its derived tensor by functoriality. Thus E²_0,1=Ṽ⊗G Tor^G_1(V,Q)=0, using Ṽ_SL₂=0. This proves the required total-degree-one vanishing without flatness. The long exact sequence now identifies the rank-one balanced tensor with the full singular quotient. Compute its stabilizer and use induction/coinvariant adjunctions to obtain the two unnormalized Jacquet modules balanced over T.

**Checks.**

- For Q = S(F×), every outer SL₂ element acts as idQ. Thus Tor⁰(V,Q) = 0 and E²₁,₀ = 0 under the stated functional hypothesis.
- The same identity action on Tor¹ gives E²₀,₁ = 0 after tensoring with Ṽ; this is a functorial calculation, not a flatness claim.
- For V = 1G the hypothesis fails and the zero stratum has nonzero balanced quotient; omitting the hypothesis loses that term.

*Needs:* §0.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.0d.1 and the smooth-Tor contract in Exact supplier contracts; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts.

### 1.3 Open spectral integral

For generic irreducible V and β(g)=⟨ṽ,π(g)v⟩, the formula μ(β⊗Ψ)(y)=∫G β(g)Ψ(g,y/det g)d×g descends to an isomorphism Ṽ⊗G Y°⊗G V→S(F×). The Haar measure gives GL₂(O) volume 1.

(Dor23, Equation (2.2), p. 8; Remark 2.21, p. 17 (Dor23 line 358; Dor23 line 854).)

A proof route is as follows. Use the regular bimodule identification for S(G), countable Schur from SmoothRepresentationsOfLocalGroups §SR.3a.1, admissibility-of-irreducibles, for irreducible V (G is countable at infinity), and change of variables to prove balancing. Integrate the compact g-support; establish the inverse using a matrix coefficient pairing normalized to 1.

The required interface has the following properties.

- The integral μ on pure tensors descends to a linear map.
- For the stated irreducible V, μ is invertible.
- μ intertwines the twisted mirabolic action dictated by K(V(−1))(1).

**Checks.**

- On Ψ(g,y)=Φ(g)f(y det g), μ gives (∫β(g)Φ(g)d×g)f(y). Normalize the coefficient integral to one to obtain f(y); using y/det g twice gives a different Mellin power.
- Changing a representative by an outer balanced relation leaves μ unchanged. For a translated compact indicator the change of variable restores exactly the same value and Haar factor.
- A direct sum V₁⊕V₂ must not be given the same irreducible-isomorphism theorem. For a character line ℂχ, EndG(ℂχ) = ℂ has dimension one; two identical copies have EndG(ℂχ⊕ℂχ) = M₂(ℂ) of dimension four, hence four coefficient copies instead of one.

*Needs:* §0.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; SmoothRepresentationsOfLocalGroups §SR.3a.1, admissibility-of-irreducibles (countable Schur).

### 1.4 Kirillov spectral extension

For every generic irreducible V, μ extends uniquely to a middle G-equivariant isomorphism ν:Ṽ⊗G Y⊗G V≅K(V(−1))(1). Here V(t)=V⊗|det|ᵗ and K denotes the Kirillov realization with its full G action. The uniqueness of the middle action is relative to this open-part rigidification for all such V.

(Dor23, Theorem 2.2 and Remarks 2.3–2.4, p. 9; proof pp. 15–17 (Dor23 line 416).)

A proof route is as follows. Use Y° generation for uniqueness. Compare its quotient by the open part with the Jacquet boundary in the Kirillov model. For supercuspidal V the boundary vanishes; for principal series and Steinberg constituents compute the torus boundary and its extension class. Check the mirabolic scaling and Weyl transform with the fixed twists, then use generic classification to obtain the spectral characterization.

**Checks.**

- For a supercuspidal, Jac(V) = 0 and the full target equals compact Kirillov functions.
- A principal series has a nonzero torus boundary, so compact support alone is too small.
- Over F = 𝔽₃((t)), ν(t) = 1/3 and ν⁻¹(t) = 3, the two excluded inducing-character ratios. Normalized I(ν¹ᐟ²,ν⁻¹ᐟ²) has Steinberg subobject and trivial quotient, with Whittaker dimensions 1 and 0; swapping the characters reverses the subobject and quotient. The ratio 1 is neither excluded value, so I(1,1) is irreducible and generic. These cases use the classification extension and the supplied segment orientations separately.
- Replacing the middle action by a free action agreeing only on zero functions fails the open-part rigidification for a coefficient integral equal to one.

*Needs:* §1.3; §1.2; §1.1; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations.

### 1.5 Local zeta comparison

Let Ψ(m,y)=Φ(m)f(y), with Φ∈S(M₂(F)), f∈S(F×), and β a matrix coefficient of generic irreducible V. With j the natural identification of K(V(−1))(1) with the underlying Kirillov-function space of V, ZJL(jν(β⊗Ψ),s)=ZGJ(β,Φ,s)·∫F×f(y)|y|ˢ⁺¹ᐟ²d×y. ZGJ uses |det g|ˢ⁺¹ᐟ² and ZJL uses |y|ˢ⁻¹ᐟ²; initially take a common domain of absolute convergence and then the supplied meromorphic extensions.

(Dor23, Proposition 2.5, p. 10; Remark 2.21, p. 17 (Dor23 line 453).)

A proof route is as follows. Substitute the open integral and change y to y det g. Use the precise Kirillov twist identification in Proposition 2.5; check powers before invoking analytic continuation.

**Checks.**

- On a uniformizer shell, the product of powers is |π|^(s+1/2); the two exponents differ by one.
- At y ∈ O× the extra Mellin factor is one and the remaining coefficient integral has the stated group measure.
- Zero Φ or zero f makes both sides zero; analytic continuation is used only after equality in a common convergence region.

*Needs:* §1.4; AutomorphicLFunctionsAndLocalFactors AL.2, Godement–Jacquet standard functions; AutomorphicLFunctionsAndLocalFactors AL.3, Function-field local factors, multiplicity one and converse theorem.

### Examples

For supercuspidal V, Jac(V) = 0 and the singular contraction vanishes. For generic principal series the Jacquet boundary survives. A coefficient normalized to have integral one sends the separated open-kernel representative exactly to f(y).

### Dependencies

§0.4; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §0.5; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.0d.1 and the smooth-Tor contract in Exact supplier contracts; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; AutomorphicLFunctionsAndLocalFactors AL.2, Godement–Jacquet standard functions; AutomorphicLFunctionsAndLocalFactors AL.3, Function-field local factors, multiplicity one and converse theorem; SmoothRepresentationsOfLocalGroups §SR.3a.1, admissibility-of-irreducibles (countable Schur); SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations. The within-layer dependencies are the Needs lines above.

## Layer 2: Exotic product and Whittaker unit

Work in L, except that weak tensor data are defined for arbitrary categories in fixed universes. The transpose convention converts the two input actions, balancing keeps the middle action, and exact Whittaker coinvariants identify the unit and trace.

### 2.1 Transpose right action

For a smooth left G-module (V,ρ), define IRL(V) as the right module v·g=ρ(gᵀ)v. Its inverse uses transpose again. This is an equivalence between the left and right smooth representation categories, not the contragredient functor.

(Dor23, equation (3.2) and Definition 3.2, p. 19 (Dor23 line 969; Dor23 line 976).)

A proof route is as follows. Transpose reverses multiplication and is continuous and involutive on GL₂(F). Keep the module and all linear morphisms unchanged and check the right action law.

The required interface has the following properties.

- v·g=ρ(gᵀ)v.
- (v·g)·h=v·(gh).
- IRL and ILR are mutually inverse equivalences.
- The underlying map of IRL(f) is f.

**Checks.**

- For diagonal g, the right action is ρ(g), not ρ(g⁻¹). At a = π it acts by ρ(diag(π,1)), whereas inverse transpose acts by ρ(diag(π⁻¹,1)).
- For upper unipotent u(b), the right operator is the lower unipotent ρ(u(b)ᵀ). As a matrix identity on F², the lower unipotent sends e₁ to e₁+be₂, excluding the unchanged upper matrix; this is a test of transpose, not a smooth complex representation model.
- Applying the left/right conversion twice restores the original action. The double transpose has no determinant character factor.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; Mathlib `Matrix.det_fin_two`.

### 2.2 Exotic tensor product

For smooth left modules M,N define M⊛N=(IRL(M)⊗ℂ IRL(N))⊗G×G Y using the first and third kernel actions, retaining the middle action. For morphisms use the descended tensor map. Transpose of m defines a natural involutive symmetry; the product preserves colimits separately and is right exact. The ordinary tensor product of G representations is not used as the output product.

(Dor23, Definition 3.2 and Construction 3.3, pp. 19–20 (Dor23 line 976).)

A proof route is as follows. Form smooth balanced coinvariants with commuting residual action; invoke the supplier contract, not just algebraic Rep.coinvariantsTensor. Descend the transpose map and check the symmetry square. Colimit preservation follows from the balanced quotient construction.

The required interface has the following properties.

- The displayed balanced quotient with its middle G action.
- Pure tensor representatives map by f⊗g⊗idY.
- Transpose yields M⊛N≅N⊛M and its square is identity.
- Each argument preserves small colimits and cokernels.
- The two input centre actions and output centre action agree.

**Checks.**

- If M=0, then M⊛N=0. Balancing a zero input leaves the zero vector space.
- Swapping inputs twice fixes every class [m⊗n⊗Ψ]. Every representative returns exactly itself, excluding a determinant-scaled flip.
- The unit comparison in §2.4 gives Iunit⊛N≅N, while ordinary tensor with Iunit would not. The induced Whittaker object has dimension larger than one; its usual tensor cannot serve as a unit on every N.

*Needs:* §2.1; §0.4; §1.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; Mathlib `Rep.coinvariantsTensor`.

### 2.3 Weak symmetric tensor data

A weak symmetric tensor structure consists of a bifunctor, an object Iunit, a natural involutive symmetry s, and natural left unit isomorphisms λ:Iunit⊛X≅X, with λIunit compatible with sIunit,Iunit. It contains no associator. A weak symmetric monoidal functor carries product and unit isomorphisms compatible with s and λ, without asserting pentagon or hexagon axioms.

(Dor23, Definitions 3.7–3.8 and Remark 3.9, pp. 20–21 (Dor23 line 1021).)

A proof route is as follows. Specify the two functors and natural isomorphisms with the stated equations. Define functor morphisms by the two compatibility squares. A monoidal category forgets to these data.

The required interface has the following properties.

- Bifunctor, unit, symmetry and unitor with the involution and unit equations.
- Forget a Mathlib SymmetricCategory to the data above.
- Compose the product and unit comparisons; identity is compatible.
- Equality is determined by the bifunctor, unit, symmetry and unitor data.

**Checks.**

- The usual tensor of complex vector spaces supplies such data. The unit component is scalar multiplication with flip on ℂ⊗ℂ.
- For every c∈ℂ×, replacing the usual vector-space left unitor by cλ while retaining the usual tensor and flip still satisfies both weak symmetry equations, including λI∘sI,I=λI. Taking c = 2 gives both unit-symmetry composites equal to 2λ; the weak data do not force a chosen unitor scale.
- From the usual vector-space weak structure to the one with unitor cλ, the identity functor with identity product comparison satisfies the unit square with unit comparison c·idℂ. Keeping its unit comparison equal to idℂ fails that square when c≠1. For c = 2 the incorrect identity unit comparison gives 2λ on one path and λ on the other.

*Needs:* Mathlib `CategoryTheory.SymmetricCategory`.

### 2.4 Whittaker unit

For U={u(b)} and θ(u(b))=e(b), let Iunit be the quotient of S(G) by the span of f(u·)−θ(u)f, with G acting by right translation. Identify it with c-IndU^G θ. There is a natural isomorphism λV:Iunit⊛V≅V, obtained from the middle θ-coinvariants of Y≅S(G). The comparison φ:IRL(Iunit)⊗G Y → S(G), balancing the middle action, has representative formula φ(f⊗Ψ)(g)=∫G f(h)(w h⁻ᵀ·Ψ)(g⁻¹,−det g)d×h.

(Dor23, Constructions 3.10 and 3.16; Remarks 3.11–3.17; equation (3.3), pp. 22–23 (Dor23 line 1090).)

A proof route is as follows. Apply exact θ-coinvariants to the middle kernel action. Compute the remaining outer regular bimodule and its normalization. Use S(G)⊗G V≅V from SmoothRepresentationsOfLocalGroups SR.2 and prove naturality. Compare quotient and compact-induction realizations with the same Haar normalization.

The required interface has the following properties.

- The right-U θ-coinvariant quotient of S(G), as specified.
- Iunit≅c-IndU^G θ with compact support modulo U.
- λV:Iunit⊛V≅V, natural in V.
- Maps Iunit→V are exactly G-linear maps S(G)→V killing f(u·)−θ(u)f. The identification with Φ⁻V uses finite-central-support Hom and is the target §3.4.

**Checks.**

- The compact-induction representative satisfies W(ug)=θ(u)W(g). Choose u with θ(u) ≠ 1; the values W(ug) and W(g) differ by θ(u), excluding an untwisted induction.
- Over F = 𝔽₃((t)) with e(Σ aᵢtⁱ) = ζ^(a₋₁) for a primitive cube root of unity ζ and a₋₁ ∈ 𝔽₃, so that e(t⁻¹) = ζ, e is trivial on O and the conductor is ν = 0, take vol(U ∩ GL₂(O)) = 1 and f = 1_GL₂(O). Its image W(g) = ∫U θ(u)⁻¹f(ug)du has W(1) = 1, W(u(t⁻¹)) = ζ and W(diag(t⁻¹,1)) = 0, since [[t⁻¹,b],[0,1]] is never integral. The inverse character would give ζ² at u(t⁻¹), and a zero or rescaled model would give W(1) ≠ 1.
- In the same setting the comparison φ sends the class of 1_GL₂(O) tensored with the reference vector 1M₂(O)(m)1O×(y) to 1_GL₂(O): for h ∈ GL₂(O) the middle action of wh⁻ᵀ fixes the reference vector (its mirabolic phase is e(b y det m) = 1 on integral data and its Weyl transform reproduces 1M₂(O) for the self-dual measure), so φ(f⊗Ψ)(g) = 1M₂(O)(g⁻¹)1O×(−det g), which is 1 exactly when g ∈ GL₂(O). A model missing the self-dual normalization multiplies this value by a power of q.

*Needs:* §2.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 2.5 Whittaker trace and symmetry

Transpose is the identity on the double θ-coinvariants of Y for its outer actions. Consequently the braiding on Iunit⊛Iunit is identity and the preceding data define a weak symmetric tensor structure. Moreover Φ⁻(M⊛N)≅IRL(M)⊗G N naturally and EndG(Iunit) is commutative.

(Dor23, Remark 3.17, p. 23; Claim 3.18, p. 24; Corollaries 3.20–3.21, p. 25 (Dor23 line 1178; Dor23 line 1199; Dor23 line 1258).)

A proof route is as follows. Compute the double θ-coinvariants by rank-two Bruhat cells, rank one and rank zero; check transpose on each surviving orbit. Use the kernel-unit comparison to identify the trace and to verify the unit symmetry axiom. Apply the unit/symmetry Eckmann–Hilton argument without assuming an associator.

**Checks.**

- Transposition acts by +1 on the surviving double θ-coinvariant generator; a minus sign would give a nonidentity unit symmetry.
- For M = Iunit the trace identity is the ordinary Whittaker functor on N.
- For two endomorphisms f,g of Iunit the unit-symmetry square identifies fg and gf, without an associator hypothesis.

*Needs:* §2.4; §2.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### Examples

On complex vector spaces, rescaling λ by 2 preserves the weak unit-symmetry equation, but the identity functor needs unit comparison 2·id. In the underlying GL₂(F) matrix calculation, u(1)ᵀ sends e₁ to e₁+e₂ through the lower unipotent. These are independent unit and action-direction witnesses.

### Dependencies

SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; Mathlib `Matrix.det_fin_two`; §0.4; §1.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; Mathlib `Rep.coinvariantsTensor`; Mathlib `CategoryTheory.SymmetricCategory`. The within-layer dependencies are the Needs lines above.

## Layer 3: Degeneracy-free representations and the centre

Work in L. Apply the imported Bernstein and firm-module theory to the Whittaker object. The unit-endomorphism isomorphism is proved before it is used to construct the fully faithful enhanced Whittaker adjunction.

### 3.1 Degeneracy-free representations

A representation D is degenerate if Φ⁻D=0. A representation N is degeneracy-free if HomG(N,D)=0 and Ext¹G(N,D)=0 for every degenerate D. This quantifies over all degenerate objects, not just irreducible ones.

(Dor23, Definitions 3.22–3.23, Warning 3.25, p. 25 (Dor23 line 1275).)

A proof route is as follows. Use the smooth abelian category and its Ext¹, with Φ⁻ as an exact functor. Define the full subcategory by the simultaneous left-orthogonality conditions HomG(N,D)=Ext¹G(N,D)=0 for every degenerate D, and establish invariance under isomorphism.

The required interface has the following properties.

- IsDegenerate D ↔ Φ⁻D=0.
- The two vanishing conditions for every degenerate D.
- Both predicates are preserved by representation isomorphisms.
- The essential-image theorem §3.5 supplies closure under colimits.

**Checks.**

- A nonzero determinant character is degenerate. For 1G, u−θ(u) acts by 1−θ(u), an invertible scalar for some u, so the quotient is zero.
- Steinberg is generic but is not degeneracy-free. The nonsplit extension gives Ext¹G(St,1G) ≠ 0, distinguishing generic from degeneracy-free.
- The nonsplit extension 0→1G→Eext→St→0 is degeneracy-free. Reversing the Hom/Ext arguments would wrongly exclude this object.
- The product 1G⊛1G has a Steinberg subobject, so the degenerate subcategory is not a tensor ideal. Its Whittaker quotient is nonzero, contradicting tensor-ideal closure.

*Needs:* §2.5; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; SmoothRepresentationsOfLocalGroups §SR.0d.1 and the smooth-Tor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness.

### 3.2 Locally unital Bernstein modules

Specialize the supplied firm-module and finite-support enrichment to Z = ⊕c Zc, the direct sum of Bernstein block centres. Use underlineHom(M,N) = ⊕c HomG(Mc,Nc) with blockwise composition and evaluation. Full Hom is the product over blocks. The substantive Whittaker-unit endomorphism identification is §3.3, not a definition of Z.

(Dor23, §3.4 and Remark 3.29, pp. 25–27 (Dor23 line 1344; Dor23 line 1360).)

A proof route is as follows. Import locally unital algebra modules from SmoothRepresentationsOfLocalGroups SR.1; specialize to the block-centre direct sum. Use Bernstein block decompositions to compare firm modules with block families and construct finite-support Hom.

The required interface has the following properties.

- The supplied firm condition reads Z⊗Z M ≅ M for this Bernstein direct sum.
- Finite-support Hom is the direct sum of the within-block morphism spaces; the source and target of evaluation are underlineHom(M,N)⊗Z M and N.
- The underlying vector space of a block family is its direct sum, and full morphisms form a product over blocks.
- Composition and evaluation are blockwise and cross-block morphisms vanish.

**Checks.**

- For finitely many blocks Z is unital and firm modules are ordinary unital modules. For two blocks, e₁+e₂ is an actual identity.
- For infinitely many nonzero blocks, a vector with infinitely many nonzero coordinates in ∏c Zc is not fixed by a finite block idempotent. For Z = ⊕n ℂ, the vector (1,1,…) is unchanged on no finite support, so belongs only to the product.
- A map supported on one block belongs to underlineHom; the identity of Iunit need not belong to it. A one-block identity has finite support; the identity on infinitely many nonzero blocks does not.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §1.1.

### 3.3 Whittaker unit and Bernstein centre

Evaluation of a natural central transformation on Iunit gives an isomorphism ∏c Zc≅EndG(Iunit). On each block it is Zc≅EndG(Iunit,c); consequently finite-support underlineEndG(Iunit)≅⊕c Zc=Z. These are algebra isomorphisms with the stated evaluation and composition, rather than a definition of either centre.

(Dor23, Claim 3.32 proof, p. 29; Remark 3.29, p. 27; Lemma 2.17, pp. 14–15 (Dor23 line 1372).)

A proof route is as follows. A central natural transformation z acts on Iunit. For f∈EndG(Iunit), define ψ(f)_X=λX∘(f⊛idX)∘λX⁻¹. Bifunctoriality makes ψ(f) natural in X and makes ψ an algebra homomorphism. The symmetry sIunit,Iunit is the identity because λIunit∘sIunit,Iunit=λIunit. Symmetry naturality and unitor naturality therefore give ψ(f)_Iunit=f, proving surjectivity of central evaluation. Central balance gives zIunit⊛idX=idIunit⊛zX. Conjugating by λX identifies both with zX. Thus zIunit=0 forces zX=0 for every X, proving injectivity. Restrict the algebra isomorphism to each block. Bernstein orthogonality identifies full endomorphisms with the product and the finite-support enrichment with the direct sum.

The required interface has the following properties.

- underlineEnd(Iunit)=Z, whereas full End(Iunit)=∏c Zc.

**Checks.**

- For f = id, the inverse construction gives idX for every X, hence evaluates to id on Iunit.
- For z = 0, its inverse evaluation is zero on each X; central balance excludes a transformation invisible only on the unit.
- For two nonzero blocks, (e₁,e₂) evaluates blockwise, while the infinite all-one family lies in full End and outside finite-support End.

*Needs:* §3.2; §2.4; §2.5; §1.1.

### 3.4 Enhanced Whittaker adjunction

The Whittaker functor refines to Φ⁻enh:Mod(G)→Modfirm(Z), and F(N)=N⊗Z Iunit is its left adjoint. The unit N→Φ⁻enhF(N) is invertible; thus F is fully faithful. The tensor and unit comparisons make F weak symmetric monoidal.

(Dor23, Claims 3.30, 3.32–3.33 and Lemma 3.35, pp. 27–29 (Dor23 line 1360).)

A proof route is as follows. Prove the blockwise roughening/smoothing comparison of Lemma 3.35, using compact projective generators from the exact supplier contracts and the unnormalized mirabolic adjunction of SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness (Dor23 line 1425). Use §3.3 to identify underlineEndG(Iunit) with Z. Construct the adjunction by the enriched tensor-Hom correspondence. Compute the unit and the product comparison on Z and extend by colimits.

The required interface has the following properties.

- Φ⁻ with its smooth Z action and action compatibility.
- N↦N⊗Z Iunit.
- HomG(N⊗Z Iunit,V)≅HomZ(N,Φ⁻enhV).
- The adjunction unit is an isomorphism.
- F(N⊗Z M)≅F(N)⊛F(M), compatibly with symmetry and unit.

**Checks.**

- F(Z)=Iunit with the specified unit comparison. The unit object is the actual Whittaker compact induction.
- For N supported on a single block the construction has no other block component. For e_cN = N and d ≠ c, e_dF(N) = 0.
- For any firm N, applying Φ⁻enh to N⊗Z Iunit returns N, including infinite direct sums. For ⊕n Nn the returned vector has finite support, excluding a product in place of the colimit.

*Needs:* §3.2; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; §3.3; SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness.

### 3.5 Degeneracy-free equivalence

F gives an equivalence Modfirm(Z)≅Moddf(G). Its image is also the smallest full subcategory containing Iunit and closed under colimits. The usual symmetric monoidal structure on firm Z-modules transfers to a uniquely compatible symmetric monoidal structure on this image.

(Dor23, Theorem 3.26, Corollary 3.27 and Remark 3.28, p. 26 (Dor23 line 1318).)

A proof route is as follows. Use the adjunction to identify Hom/Ext orthogonality to degenerate representations. Compare a projective presentation by sums of block pieces of Iunit with the counit; both its kernel and cokernel are degenerate and the orthogonality conditions force them to vanish. Transport associativity inside the fully faithful image; this does not yet provide an associator on all representations.

**Checks.**

- F(0) = 0 and F(Z) = Iunit.
- For the Steinberg quotient, Ext¹(St,1G) ≠ 0; genericity alone cannot put it in the image.
- For a coproduct ⊕i Ni, applying enhanced Whittaker gives ⊕i Ni, with each vector of finite block support.

*Needs:* §3.4; §3.1.

### Examples

The trivial representation has Φ⁻ = 0. Steinberg has Φ⁻ of dimension one but Ext¹(St,1G) ≠ 0, whereas the extension with 1G as subobject is degeneracy-free. For Z = ⊕n ℂ, every vector of a firm module is supported on finitely many blocks; (1,1,…) belongs only to the product centre.

### Dependencies

§2.5; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; SmoothRepresentationsOfLocalGroups §SR.0d.1 and the smooth-Tor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §1.1; §2.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.5.1, mirabolic-derivatives and derivative-exactness. The within-layer dependencies are the Needs lines above.

## Layer 4: Spherical generator and centre equivalence

Work in L. The spherical generator retains every smooth determinant twist, including ramified ones. Its explicitly normalized counit and comultiplication give a second fully faithful image; together with the Whittaker image it generates all representations.

### 4.1 Spherical generator

Set K=GL₂(O) and E=c-IndK^G S(O×), where K acts on S(O×) through determinant and translation. Equivalently E=c-IndSL₂(O)^G 1. Define Modsph(G) as the full colimit closure of E, and Zsph as the direct sum of Bernstein centres of blocks containing a one-dimensional representation.

(Dor23, Definition 3.36 and Remarks 3.37–3.41, pp. 30–31 (Dor23 line 1501).)

A proof route is as follows. Use compact induction in stages and the determinant quotient K/SL₂(O)=O×. Form the full colimit-generated subcategory and select the indicated blocks; do not replace the generator by c-IndK^G1.

The required interface has the following properties.

- E=c-IndK^G S(O×), with the regular determinant action.
- Induction in stages gives E≅c-IndSL₂(O)^G1.
- The smallest full colimit-closed subcategory containing E.
- HomG(E,V)≅HomG(S(G),V)^SL₂(O), using the nonsmooth Hecke-module roughening. Its finite-Bernstein-support part identifies with V^SL₂(O).
- Zsph=⊕c Zc over blocks containing a determinant character.

**Checks.**

- Every smooth determinant character χ∘det is generated by SL₂(O)-fixed vectors, including ramified χ. For k ∈ SL₂(O), χ(det k) = χ(1) = 1.
- A ramified χ∘det has no K-fixed vector, so the K-spherical definition would be too small. Choose u ∈ O× with χ(u) ≠ 1; diag(u,1) rules out a K-fixed vector.
- Finite-support underlineHomG(E,V) is V^SL₂(O), whereas full HomG(E,V) uses the roughening; replacing it by V^K loses ramified determinant vectors. The determinant direction is smoothened with the block support, not erased by averaging over all K.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts.

### 4.2 Spherical counit and comultiplication

Let ν be the largest integer with e(π⁻νO)=1, q=|O/πO|, h=diag(1,−π^ν). Define ε:E→Iunit from the rough distribution f(u(b)hk)=e(b)δ1(det k), k∈K, zero off UhK. Define Δ:E→E⊛E from q⁻ν·1M₂(O)(m)δπ⁻ν(y), interpreted in the roughening of Y. Both maps are specified as equivariant maps out of compact induction, with exact normalization fixed by ε and the two unit equations.

(Dor23, Constructions 3.44–3.45 and Remarks 3.46–3.48, pp. 31–33 (Dor23 line 1554).)

A proof route is as follows. Compute the relevant invariance under K and SL₂(O). Delta at a point of F× is a distribution, not a locally constant compactly supported function. Use the compact-induction/roughening adjunction to obtain maps. Check the conductor lattice hKh⁻¹∩U=u(π⁻νO). A general h with that lattice condition transports the construction.

The required interface has the following properties.

- The map ε:E→Iunit from the θ-equivariant UhK distribution.
- The map Δ from q⁻ν1M₂(O)δπ⁻ν in the rough kernel.
- (ε⊛id)Δ and (id⊛ε)Δ are inverse unitors.
- An admissible h with the conductor-lattice condition gives the transported maps.

**Checks.**

- For ν=0, q⁻ν=1 and the determinant distribution is δ1. For ν = 1 the data are q⁻¹ and δπ⁻¹; setting both to one gives different distributions.
- For a ramified character, replacing δπ⁻ν by δ1 without transporting the lattice fails the unit normalization. The conductor lattice is π⁻νO, and the determinant mass must transform with it.
- Over a positive-characteristic local field, ker e need not equal π⁻νO, and must not replace the conductor lattice. For F = 𝔽₃((t)) and the coefficient-of-t⁻¹ character, e(t⁻²) = 1 although t⁻² ∉ O.

*Needs:* §4.1; §2.4; §0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts.

### 4.3 Spherical centre equivalence

The maps ε and Δ satisfy both counit equations, and Δ is an isomorphism. Using the supplied projectivity, blockwise compactness and identification underlineEnd(E) = Zsph, prove the following equivalence. The functor N↦N⊗Zsph E is fully faithful with image Modsph(G) and preserves tensor products and symmetry. Its domain unit Zsph maps to E, so the comparison is not a unit-preserving functor to the ambient category with unit Iunit.

(Dor23, Claim 3.49, pp. 33–34; Theorem 3.42 and Remark 3.43, p. 31 (Dor23 line 1538).)

A proof route is as follows. Use the supplied compact-projective and twisted-spherical-centre computations. Apply Φ⁻ to Δ and use ε to split it. Work blockwise and exclude a nontrivial idempotent retract of E. For the cokernel, use split degeneracy and the absence of a degenerate subrepresentation in the relevant kernel. Use enriched tensor-Hom and colimit presentations to identify the image and product comparison.

**Checks.**

- After the left counit, Δ sends the generator back to itself; the right counit gives the same value.
- The unit Zsph maps to E, whereas the ambient unit is Iunit; claiming an ambient unit-preserving functor identifies distinct objects.
- A ramified determinant character lies in the image but has K-fixed space zero, detecting replacement of SL₂(O) by K.

*Needs:* §4.2; §3.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.4.1 and its twisted-spherical-centre contract in Exact supplier contracts.

### 4.4 Whittaker and spherical generation

The functor Modfirm(Z)×Modfirm(Zsph)→Mod(G), (M,N)↦M⊗Z Iunit⊕N⊗Zsph E, is faithful and weak symmetric monoidal for the pair-category tensor used in Layer 5. Its image generates Mod(G) under Z-linear colimits. This assertion is joint generation; it does not place every generic irreducible in the degeneracy-free subcategory.

(Dor23, Corollary 3.51, p. 34; proof of Theorem 3.52, p. 37 (Dor23 line 1700).)

A proof route is as follows. Combine the two fully faithful component functors and the product comparisons to construct the faithful pair functor. Use blockwise smooth projective presentations and the local GL₂ classification to prove Z-linear colimit generation; include mixed maps between Iunit and E.

**Checks.**

- The pair (Z,0) maps to Iunit and (0,Zsph) maps to E.
- The mixed product (Z,0)⊗(0,Zsph) is (0,Zsph), matching Iunit⊛E = E.
- A mixed map E → Iunit such as ε is absent from the product category; faithfulness therefore must not be promoted to fullness.

*Needs:* §3.5; §4.3; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations.

### Examples

Choose a ramified χ:F× → ℂ×. Then χ∘det has an SL₂(O)-fixed vector and no K-fixed vector. At ν = 1 the counit matrix diag(1,−π) gives the conductor lattice π⁻¹O, while Δ uses q⁻¹δπ⁻¹. Both counit composites, rather than just their Whittaker images, return the generator.

### Dependencies

SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §2.4; §0.4; AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts; §3.2; SmoothRepresentationsOfLocalGroups §SR.4.1 and its twisted-spherical-centre contract in Exact supplier contracts; §3.5; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations. The within-layer dependencies are the Needs lines above.

## Layer 5: Associativity, trace and local convolution

Work in L for the exotic applications. The idempotent theorem itself concerns an arbitrary category with a tensor bifunctor and a pentagon associator, without a unit. Coherence descends only after checking mixed morphisms between the two generating pieces.

### 5.1 Idempotent coherence theorem

Define a unit-free tensor category structure on a category C as a tensor product of objects and of pairs of morphisms preserving identities and composition, an associator α:(X⊗Y)⊗Z≅X⊗(Y⊗Z) natural in all three variables, and the pentagon identity; no unit, unitor or symmetry is part of the data.

- The tensor of identities is the identity, and the tensor of two composites is the composite of the tensors.
- The associator has source (X⊗Y)⊗Z and target X⊗(Y⊗Z) and is natural in all three variables.
- The two paths around the five-vertex pentagon are equal: (α⊗id)≫α≫(id⊗α) = α≫α on ((W⊗X)⊗Y)⊗Z.
- Categorical equivalences transport these data and equations without introducing a tensor unit.

**Checks.**

- Forgetting the unit and unitors of a Mathlib monoidal category gives such a structure, with the pentagon of `CategoryTheory.MonoidalCategory`; the structure does not require a unit object to exist.
- On the discrete category of ℕ, addition with identity associators is a unit-free tensor structure; Cantor pairing θ(x,y) = (x+y)(x+y+1)/2+y is not, because θ(θ(0,0),1) = 2 and θ(0,θ(0,1)) = 5 are distinct objects, so no associator exists between them.
- On the category of complex vector spaces, the usual tensor product with the associator rescaled by c ∈ ℂ× is natural, but its pentagon reads c² = c³, so it is a unit-free tensor structure only for c = 1.

Prove the idempotent coherence theorem: for a unit-free tensor category structure on C, an object P and an isomorphism θ:P⊗P≅P, let a:P≅P satisfy a∘θ∘(θ⊗id)=θ∘(id⊗θ)∘α. If θ∘(a⊗id)=a∘θ=θ∘(id⊗a), then a=id. The dual form applies to an invertible comultiplication after its compatibility equations have been proved from the two counit laws.

(GH11, Theorem 3.1.2, pp. 10–11; Appendix A, p. 15 (GH11 line 481; GH11 line 705).)

A proof route is as follows. Use naturality and the two intertwining equations to identify all five pentagon vertices with P. The short and long routes become a² and a³ after composing with the fourfold product θ∘(θ∘(θ⊗id)⊗id), which is invertible because the tensor of isomorphisms is an isomorphism; cancellation is then valid because a is an automorphism. For the counital coalgebra application, derive the intertwining equations from the counit and naturality, rather than asserting every invertible binary map is associative.

**Checks.**

- For a one-dimensional complex tensor object and multiplication θ(x⊗y) = cxy with c ≠ 0, both triple products have coefficient c² and a = 1; the pentagon has values a² = a³ = 1.
- For the zero tensor object, its unique endomorphism is its identity and a = id; zero as an endomorphism of a nonzero object also satisfies a² = a³ but is not invertible.
- On sets use Cantor pairing θ(x,y) = (x+y)(x+y+1)/2+y on ℕ. At (0,0,1), the two triple products are 2 and 5; the defect has a(0) = 0 and a(2) = 5. At (x,y) = (0,1), θ(a(0),1) = 2 whereas a(θ(0,1)) = 5, so left intertwining fails. Thus an arbitrary invertible multiplication is insufficient.

*Needs:* Mathlib `CategoryTheory.Category`; Mathlib `CategoryTheory.Iso`; Mathlib `CategoryTheory.Functor` and product categories for the bifunctor formulation.

### 5.2 Exotic symmetric monoidal structure

There exists exactly one associator on ⊛ making the given symmetry and unit into a symmetric monoidal structure and making Modfirm(Z)→Mod(G) weak symmetric monoidal with its specified comparisons. It restricts to the ordinary tensor associators on the Iunit- and E-generated parts under their respective comparisons.

(Dor23, Theorem 3.52, p. 35; Claim 3.58 and proof, pp. 36–38 (Dor23 line 1721).)

A proof route is as follows. Use the category of pairs (M,N) of firm Z and Zsph modules with product (M⊗M′, M⊗N′⊕N⊗M′⊕N⊗N′) and unit (Z,0). The functor (M,N)↦M⊗Iunit⊕N⊗E is faithful and weak symmetric monoidal. It is not full. Construct the associator on finite sums of generators, checking naturality for mixed maps Iunit↔E as well as centre endomorphisms. Extend by colimits using presentations/Kan extension. Apply the idempotent coherence calculation to the E terms, then establish pentagon, triangle and both hexagons on generators and extend.

**Checks.**

- On three Whittaker generators the transported associator is the ordinary relative-tensor associator.
- On three E generators, the two pentagon paths give a² and a³; idempotent coherence forces a = 1.
- For a mixed map ε:E → Iunit, both naturality paths use the same counit composite; faithfulness alone cannot supply that equation.

*Needs:* §4.4; §5.1; §3.4; §4.3; §2.3.

### 5.3 Frobenius category trace

In the symmetric monoidal 2-category of presentable ℂ-linear categories with colimit-preserving functors and its relative tensor product, (Mod(G),⊛,Iunit) is a commutative algebra whose trace is Φ⁻. The pairing (M,N)↦Φ⁻(M⊛N)≅IRL(M)⊗G N is a categorical self-duality.

The evaluation has source Mod(G) ⊗ℂ Mod(G) and target Vectℂ. The coevaluation has source Vectℂ and target that categorical tensor, taking ℂ to the smooth regular bimodule under the Eilenberg–Watts comparison. Construct both maps and their left and right triangle natural isomorphisms. This is an ordinary presentable linear categorical self-duality; it is not a claim about dualizability of every representation.

(Dor23, Remark 3.54, p. 35 (Dor23 line 1730).)

A proof route is as follows. Use the universal property for separately cocontinuous ℂ-bilinear functors. Exhibit evaluation by smooth balanced tensor and a coevaluation from the regular bimodule; check the two triangle identities. The categorical tensor is supplied by the ordinary linear contract; construct the smooth Eilenberg–Watts coevaluation from the regular bimodule and prove its two triangle identities.

**Checks.**

- For the identity regular bimodule, composing coevaluation and evaluation gives the identity smooth functor on either side, not an endofunctor merely isomorphic on irreducibles.
- The zero object pairs to the zero vector space; tensor-unit contraction returns the original module.
- The ordinary category of complex vector spaces has evaluation M⊗ℂ N and regular coevaluation; replacing it by its stable derived category changes the object being asserted self-dual.

*Needs:* §5.2; §2.5; EnhancedDerivedSheaves §E5:presentability.2 and its ordinary linear tensor contract in Exact supplier contracts; smooth Eilenberg–Watts for the regular bimodule, constructed in this section.

### 5.4 Generic idempotent algebras

For generic irreducible V, choose a nonzero generator of its one-dimensional Whittaker multiplicity space and the resulting epimorphism Iunit→V. There is a unique commutative unital ⊛-algebra on V with this unit, and its multiplication V⊛V→V is invertible. Without choosing a generator there is instead a canonical isomorphism V⊛V≅V⊗ℂ HomG(Iunit,V).

(Dor23, Example 3.55, p. 35; Remark 2.6, p. 10 (Dor23 line 1741).)

A proof route is as follows. Use right exactness and the unit quotient to descend the algebra structure. Apply the Kirillov spectral identity from §1.4 to identify V⊛V with the single copy of V selected by the unit quotient. If that quotient is scaled by c, multiplication scales by c⁻¹, so the tensor of the multiplication with its generator gives the canonical multiplicity-line-valued comparison.

The required interface has the following properties.

- The unital algebra associated with a specified nonzero Iunit→V.
- Every unital multiplication with that unit is this multiplication.
- Its multiplication V⊛V→V is invertible.
- Scaling the unit by c rescales multiplication by c⁻¹; the line-valued canonical statement is unchanged.

**Checks.**

- For a generic supercuspidal V the product is idempotent. The chosen unit fixes the multiplication, rather than a choice of vector in V.
- For Steinberg the conclusion holds although Steinberg is not degeneracy-free. Its nonzero Whittaker line supplies the unit quotient despite Ext¹(St,1G) ≠ 0.
- For a determinant character there is no nonzero map Iunit→V, so this construction cannot be applied. The Whittaker quotient is zero, so a putative nonzero unit quotient would contradict exactness.

*Needs:* §5.2; §2.5; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; Mathlib `CategoryTheory.CommMon`; §1.4.

### 5.5 Spherical algebra of invariants

After §5.2, (E,Δ,ε) is a cocommutative counital coalgebra. For any commutative ⊛-algebra A, the finite-support Hom underlineHom(E,A), identified with the firm part of A^SL₂(O) and with compact coinvariants by averaging, is an ordinary quasi-unital commutative Zsph-algebra: f⋆g=mA∘(f⊛g)∘Δ. Enhanced Φ⁻A is a firm Z-algebra and composition with ε relates the two.

(Dor23, Remarks 3.56–3.57, pp. 35–36 (Dor23 line 1758).)

A proof route is as follows. Apply the idempotent theorem to Δ after verifying its compatibility hypotheses. Define convolution of Hom maps, and derive associativity, commutativity and local units from the coalgebra/algebra laws and blockwise identity. Use normalized compact averaging over SL₂(O) for the invariants–coinvariants comparison.

The required interface has the following properties.

- f⋆g=mA(f⊛g)Δ.
- The value of f⋆g on an induced generator is computed by Δ.
- A morphism of ⊛-algebras induces a morphism of the ordinary firm algebras.
- The algebra is firm over Zsph; it need not have a single global identity.

**Checks.**

- For A=Iunit, composition with ε agrees with the canonical map from the Whittaker-side algebra. The counit equations give the comparison on each block.
- Swapping f and g leaves f⋆g unchanged. Cocommutativity of Δ and commutativity of m give the identical map.
- An algebra with infinitely many nonzero blocks must not be assigned an element consisting of all block units inside a direct sum. For ⊕n ℂ, every element has finite support while (1,1,…) does not.

*Needs:* §5.2; §4.2; §4.3; §5.1; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts.

### Examples

On a complex line, θ(x⊗y) = cxy has the two triple products c²xyz, and rescaling the chosen unit by c rescales the algebra multiplication by c⁻¹. The pair-category product (0,Zsph)⊗(0,Zsph) = (0,Zsph) corresponds to E⊛E ≅ E. Infinite block units do not define an element of the finite-support convolution algebra.

### Dependencies

Mathlib `CategoryTheory.Category`, `CategoryTheory.Functor`, `CategoryTheory.Iso` and product categories; §4.4; §3.4; §4.3; §2.3; §2.5; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; Mathlib `CategoryTheory.CommMon`; §1.4; §4.2; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; EnhancedDerivedSheaves §E5:presentability.2 with its ordinary linear tensor contract. The within-layer dependencies are the Needs lines above.

## Layer 6: Adelic product and theta multiplication

Work in A. Restricted reference data globalize every local coherence map. Rational theta invariance yields a multiplication into unrestricted smooth quotient functions, with compact output established in Layer 7.

### 6.1 Adelic exotic tensor product

Form YA=⊗′vYv with reference vector yv=1M₂(Ov)·1Ov×. The local products, symmetry, unitors and associators respect the reference data outside finitely many v, giving a colimit-preserving symmetric monoidal product on smooth GL₂(A)-modules and unit IunitA=c-IndU(A)^G θ.

(Dor23, §4.2, pp. 40–41; Claim 4.3 and Corollary 4.4, p. 41 (Dor23 line 1991; Dor23 line 2025; Dor23 line 2039).)

A proof route is as follows. Import the algebraic restricted tensor, its finite-stage maps and reference-vector transports from AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; topological restricted-product transports from Completed/RestrictedProducts Layer 1; and divisor-lattice and Fourier comparisons from FunctionFieldArithmetic §§2.1–2.3. At unramified v compare yv with the local spherical coalgebra; verify the unit reference is [1GL₂(Ov)], not a characteristic function of the noncompact whole group. Descend the restricted tensor of the kernel action and verify coherence maps on elementary tensors.

The required interface has the following properties.

- YA is the restricted tensor product with the specified yv.
- Use balanced tensor against YA for the two outer adelic actions.
- A finite set of exceptional places gives the product of those kernels and the reference tail.
- Local braidings, unitors and associators descend to a symmetric monoidal structure.

**Checks.**

- Enlarging the finite exceptional set by an unramified place inserts yv and changes no element. A two-place elementary tensor with a third reference factor is the same colimit class.
- The unramified unit vector is the class of 1GL₂(Ov), which has compact support. The whole Gv indicator would be noncompact and cannot represent this class.
- At a ramified additive character the local reference data may change, but only finitely many such places occur. A character ramified at one place changes one factor; an infinite exceptional family is outside the restricted product contract.

*Needs:* §5.2; §4.2; §5.5; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; Completed/RestrictedProducts Layer 1; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; MetaplecticAutomorphicForms §§4.1, 4.1a and 4.2–4.4.

### 6.2 Compact automorphic function space

Form S = C_c^∞(Γ\G) using SmoothRepresentationsOfLocalGroups §SR.1.1 on the l-space Γ\G of FunctionFieldArithmetic §6.1, with right translation. Form the unrestricted carrier from functions fixed by some compact open subgroup of G; no central-lattice invariance is imposed. Its transpose dual S̃=Dτ(S), where Dτ(V)=D(V)∘τ, D is the ordinary smooth contragredient and τ(g)=g⁻ᵀ, identifies with all smooth functions on Γ\G via the bilinear pairing B(f,f′)=∫Γ\G f(g)f′(g⁻ᵀ)d×g and a fixed quotient Haar measure. The inclusion S→S̃ is injective, not claimed to be surjective. The pairing is balanced on IRL(S)⊗G S and realizes the right-regular function model of Dτ(S).

(Dor23, §4.1, pp. 38–39; §4.3, p. 41; Construction 4.15, p. 45 (Dor23 line 1915).)

A proof route is as follows. Use the closed discrete rational subgroup to form the locally profinite quotient and its quotient measure. Apply the compact-support function carrier and smooth the algebraic dual and identify distributions against a compactly supported function with smooth quotient functions under the transpose convention.

The required interface has the following properties.

- S consists of compactly supported locally constant quotient functions.
- S̃ is the space of smooth, unrestricted-support quotient functions.
- B(f,f′)=∫Γ\G f(g)f′(g⁻ᵀ)d×g.
- Compact functions embed equivariantly into the smooth dual by B.

**Checks.**

- The pairing is bilinear over ℂ; complex conjugation is not inserted. For scalar i the value scales by i, not by −i as a Hermitian convention would.
- The integration domain is Γ\G; integrating over G would count rational translates repeatedly. For a compact quotient indicator, a rational translate represents the same summand, so counting all translates gives repeated mass.
- Compact support is imposed on S, while a constant smooth quotient function belongs to S̃ even when its support is not compact. The constant function has value one everywhere and tests the support distinction.

*Needs:* FunctionFieldArithmetic §6.1; SmoothRepresentationsOfLocalGroups §SR.1.1; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 6.3 Triality theta functional

For Ψ∈YA define Θ(Ψ)=Σξ∈M₂(F),q∈F× Ψ(ξ,q). This finite sum is invariant under S₃⋉Γ³. Invariance of the middle Weyl action uses self-dual Poisson summation on M₂(A), rationality of q, and the product formula.

(Dor23, Definition 4.5, Remarks 4.6–4.8 and Proposition 4.9, pp. 42–43 (Dor23 line 2078).)

A proof route is as follows. Discreteness and compact support make the rational sum finite. Outer Γ actions and transpose reindex it. For middle [[a,b],[0,1]] with a ∈ F× and b ∈ F, the phase e(bq det ξ) and norm |a| are one, and q ↦ aq reindexes the sum. For middle w use MetaplecticAutomorphicForms §4.1a on M₂(A) with pairing −qB and |q|² = 1; the Fourier integral is adelic. For the remaining triality permutations identify the rational lifts of §0.3 with the theta-preserving splitting of MetaplecticAutomorphicForms §4.4, using its §4.3 product formula and §4.1a partial Fourier comparison.

The required interface has the following properties.

- The rational matrix/determinant-coordinate sum on YA.
- Only finitely many summands are nonzero on each Ψ.
- Θ is invariant under each rational G action.
- Θ is invariant under all three-factor permutations.

**Checks.**

- An elementary tensor integral at all but finitely many v reduces to a finite rational sum. On a support meeting one rational pair the sum is its single value, not an Euler product of unrelated sums.
- Changing Ψ by transpose does not change Θ. The pair (E₀₁,1) is exchanged with (E₁₀,1), preserving the two-term sum.
- For rational q, |q|² = 1; in particular q = 1 and q = a² give the same global factor one. The phase e(bq det ξ) is one for rational b, q and ξ. With pairing −qB, self-dual Poisson equates the two rational sums with covolume one and integral over A⁴; an integral over M₂(F) gives no such identity.

*Needs:* §6.1; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; MetaplecticAutomorphicForms §§4.1a, 4.3–4.4.

### 6.4 Theta multiplication

The rational invariance of Θ induces m:S⊛S→S̃, characterized by evaluation at the identity quotient using Θ and equivariance; at g its value is the corresponding middle translate Θ(g·Ψ). The output is initially the smooth dual, without a compact-support claim.

(Dor23, Construction 4.10 and Remark 4.11, pp. 43–44 (Dor23 line 2170).)

A proof route is as follows. Use the compact induction realization of S and balance against the two outer G actions. Use middle equivariance to recover a smooth quotient function from its value at identity. Record the symmetry in all three inputs of the resulting trilinear pairing.

The required interface has the following properties.

- m:S⊛S→S̃ is induced by Θ.
- Its value on the identity quotient is Θ on kernel representatives.
- Middle right translation corresponds to translation of the output function.
- The paired trilinear form is S₃-invariant.

**Checks.**

- Realize S⊛S as the coinvariants of YA under the two outer Γ actions and write [Ψ] for the class of Ψ. Rational discreteness gives a compact open product set, equal to M₂(Ov)×Ov× at almost all v, meeting M₂(F)×F× only at (0,1); for its indicator Ψ, m([Ψ])(Γ·1)=Θ(Ψ)=1. The zero map gives 0, and c·m gives c, so the value pins the normalization.
- Choose disjoint such neighbourhoods meeting the rational pairs only at (E₀₁,1) and (E₁₀,1), and let Ψ be their indicators with coefficients 1 and 2. Then m([Ψ])(Γ·1)=1+2=3, and after transposing the matrix variable (the symmetry of S⊛S) the two contributions are exchanged and the value is still 3. The antisymmetric sum Σ(Ψ(ξ,q)−Ψ(ξᵀ,q)) gives (1−2)+(2−1) = 0 before and after transpose, so it fails the required value 3.
- Over F=𝔽₃(t), take e the residue character of dt with value ζ=exp(2πi/3) on residue 1, and b∈A with component t⁻¹ at t=0 and 0 elsewhere, so e(b)=ζ. For Ψ the indicator of a neighbourhood isolating (I₂,1), m([Ψ])(Γ·1)=1 and m([Ψ])(Γ·u(b))=Θ(u(b)·Ψ)=e(b·1·det I₂)=ζ by the middle unipotent formula of §0.4. A constant output gives 1 at the second point and the inverse character gives ζ². The codomain remains S̃; compact support is only established on the ideal I.

*Needs:* §6.3; §6.2; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 6.5 Function-field zeta comparison

For φ,φ′∈S and Ψ(m,y)=Φ(m)f(y)∈YA, put φ′′=m(φ′⊗Ψ⊗φ)∈S̃. Then ZJL(φ′′,s)=ZGJ(φ′,φ,Φ,s)·∫A×f(y)|y|ˢ⁺¹ᐟ²d×y. Here ZGJ=∫G(∫Γ\G φ′(h⁻ᵀ)φ(hg)dh)Φ(g)|det g|ˢ⁺¹ᐟ²d×g, and ZJL=∫A×Wφ′′(diag(y,1))|y|ˢ⁻¹ᐟ²d×y, with Wφ′′(g)=∫U(F)\U(A)φ′′(ug)θ(u)du and quotient volume 1. Interpret equality first on the common absolute-convergence domain and then wherever the supplied continuations are defined; the multiplicative integrals run over A×.

(Dor23, §4.1, pp. 38–39; Remark 4.11, p. 44 (Dor23 line 1915; Dor23 line 2181).)

A proof route is as follows. Use the compact-data global zeta contract only for absolute convergence of the Godement–Jacquet double integral. In this section construct the Whittaker coefficient of the theta product, unfold its rational sum by compact-support exhaustion, and bound the unfolded absolute integral by the absolute-value Godement–Jacquet double integral times ∫A× |f(y)|·|y|ᴿᵉ⁽ˢ⁾⁺¹ᐟ² d×y. This gives convergence of the theta side on the same half-plane and justifies Fubini there. Apply the local comparison, tracking transpose, Whittaker sign and both determinant exponents. Continue only where both sides have defined continuations.

**Checks.**

- The Whittaker coefficient of zero input is zero and both zeta integrals vanish.
- Two unit-volume disjoint compact patches with integrand values 1 and −1 have signed integral 0 and absolute integral 2. The convergence bound uses the absolute double integral and ∫|f|, so cancellation cannot supply its majorant.
- For a rational scalar idele a, |a| = 1; replacing A× by F×\A× in the displayed Mellin factor changes the specified integral.
- At one local uniformizer shell, combining the Kirillov power s−1/2 with its extra y factor gives s+1/2; all but finitely many unit-shell factors have weight one.

*Needs:* §1.5; §6.4; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; AutomorphicLFunctionsAndLocalFactors AL.3, Function-field local factors, multiplicity one and converse theorem, and its compact-data zeta contract in Exact supplier contracts; FunctionFieldArithmetic §6.1.

### Examples

Choose disjoint compact open neighbourhoods U₁ and U₂ whose union meets the rational locus precisely at (E₀₁,1) and (E₁₀,1), respectively. Rational discreteness supplies them. For Ψ = 2·1U₁ + 3·1U₂, the theta sum is 2+3 = 5; after transposing the matrix coordinate it is 3+2 = 5. The support consists of neighbourhoods, rather than two adelic points. At almost every place the reference vector is an actual compact indicator; w² acts by the same negative-Fourier reflection as locally.

### Dependencies

§5.2; §4.2; §5.5; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; Completed/RestrictedProducts Layer 1; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; MetaplecticAutomorphicForms §§4.1, 4.1a and 4.2–4.4; FunctionFieldArithmetic §6.1; SmoothRepresentationsOfLocalGroups §SR.1.1; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; MetaplecticAutomorphicForms §§4.1a, 4.3–4.4; §1.5; AutomorphicLFunctionsAndLocalFactors AL.3, Function-field local factors, multiplicity one and converse theorem, and its compact-data zeta contract in Exact supplier contracts. The within-layer dependencies are the Needs lines above.

## Layer 7: The compact automorphic algebra

Work in A. The Poincaré map and Petersson unit identity identify its image with the determinant-pushforward kernel. Its epimorphic unit forces compact multiplication, associativity and the ambient actions.

### 7.1 Poincaré unit map

Define eA:IunitA→S by eA(W)(g)=Σγ∈U(F)\Γ W(γg). This is a finite sum on compact-mod-U representatives and gives a smooth function compact modulo Γ. Its smooth dual is the Whittaker map S̃→IunitÃ with the specified θ convention.

(Dor23, Construction 4.13, Claim 4.14 and Construction 4.15, p. 45 (Dor23 line 2236).)

A proof route is as follows. Prove local finiteness from rational discreteness and compact support modulo U. Show compactness of the image support modulo Γ. Change variables to compute the dual and normalize vol(U(F)\U(A))=1.

The required interface has the following properties.

- The displayed sum from c-IndU(A)^Gθ into S.
- eA respects the adelic G action.
- Its smooth dual is the Whittaker integral.
- Its output has compact quotient support.

**Checks.**

- For u∈U(F), θ(u)=1, so the summand is independent of the coset representative. For a rational b, e(b) = 1, so the two representatives have identical values.
- The sum runs over U(F)\Γ rather than U(A)\G. The rational cosets are discrete summation indices; replacing them by the adelic quotient changes the operation to integration.
- Translating W on the right translates its Poincaré sum by the same element. For g0, both sides evaluate Σγ W(γgg0).

*Needs:* §6.2; §6.1; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 7.2 Petersson unit identity

The theta product satisfies m∘(eA⊛idS):IunitA⊛S→S̃ equal to the unitor λS:IunitA⊛S→S followed by the Petersson inclusion S→S̃. Equivalently the theta trilinear pairing with one Poincaré input gives B on the other two inputs.

(Dor23, Proposition 4.16 and Corollary 4.18, p. 46 (Dor23 line 2284).)

A proof route is as follows. Unfold the Poincaré sum and integrate the rational unipotent variable over A/F. Fourier orthogonality imposes q det ξ=1. Use the quotient pairing and local unit normalization to identify the remaining integral.

**Checks.**

- With a Poincaré input, additive orthogonality selects q det ξ = 1; det ξ = 0 contributes zero.
- For q det ξ = 1 the quotient unipotent integral is one because its volume is one.
- The resulting map on S is its Petersson inclusion, with compact inputs and unrestricted target; replacing the bilinear pairing by a Hermitian one changes scalar i to −i.

*Needs:* §7.1; §6.4; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis.

### 7.3 Automorphic ideal

Let p:S(Γ\G)→S(F×\A×) be the pushforward along determinant, integrating over the SL₂ quotient fibres with the compatible quotient measures. Define I=ker p. Then im(eA)=I, so IunitA↠I→S→S(F×\A×)→0 is exact at S and I is orthogonal under the quotient pairing to determinant characters. I includes noncuspidal functions.

(Dor23, Proposition 4.19, p. 46; Remark 4.20, p. 47; proof p. 48 (Dor23 line 2350; Dor23 line 2411).)

A proof route is as follows. Define the determinant pushforward and prove that it preserves compact quotient support. The Poincaré image has zero determinant pushforward. For the reverse inclusion, dualize: vanishing of all nontrivial unipotent Fourier coefficients forces U(A)-invariance. Together with Γ this forces SL₂(A)-invariance and hence determinant factorization.

The required interface has the following properties.

- The quotient-fibre integral p, with its measure normalization.
- I is the kernel subrepresentation of p.
- im(eA)=I.
- I is the compact subspace orthogonal to all determinant characters.

**Checks.**

- Every Poincaré sum from IunitA has p=0. Fourier averaging of θ over U(F)\U(A) is zero.
- A nonzero nonnegative locally constant function supported in a compact open subset of Γ\G has a nonzero determinant pushforward: it is not in I. A determinant pullback need not have compact quotient support and is not used as a test element of S. With unit fibre volume and a product indicator, the fibre integral is one on its determinant patch, giving a concrete nonmember.
- In the Eisenstein summand IEis, choose a nonzero compact function with nonzero constant term; its determinant pushforward is nevertheless zero. Thus I is larger than the cuspidal constant-term kernel. Its constant term is nonzero while p = 0, separating the two kernels.

*Needs:* §7.1; §7.2; FunctionFieldArithmetic §6.2 with gap:determinant-pushforward and §6.1 with gap:sl2-rational-unipotent-generation in Exact supplier contracts; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis.

### 7.4 Automorphic commutative algebra

The theta product restricts to mI:I⊛I→I, with unit the epimorphism IunitA↠I. It is a commutative unital associative algebra in the exotic category. The restricted Petersson pairing obeys B(x,mI(y,z))=B(mI(x,y),z); this invariance does not assert I≅Ĩ.

(Dor23, Corollaries 4.21–4.22 and Remarks 4.23–4.24, p. 47 (Dor23 line 2359).)

A proof route is as follows. Use the surjective unit and the Petersson identity to prove the output lies in I⊂S, not merely S̃. Precompose associativity with the epi IunitA⊛I⊛I→I⊛I⊛I, using right exactness. Reduce to unit equations. Use theta symmetry for commutativity and pairing invariance.

The required interface has the following properties.

- The commutative algebra with carrier I and unit eA.
- Its unit map is an epimorphism.
- mI followed by I→S̃ agrees with the theta product.
- B is invariant under multiplication.

**Checks.**

- Multiplying by eA after the unitor gives the identity on I. The composite is idI, not a scalar multiple of idI.
- The two iterated triple products agree after precomposition by the epimorphic unit. Both precomposed products are the same binary product, and epi cancellation is essential.
- The target must not claim that the smooth dual inclusion I→Ĩ is an isomorphism. A compact function carrier and its unrestricted smooth dual have different support conditions.

*Needs:* §7.3; §7.2; §6.4; Mathlib `CategoryTheory.CommMon`.

### 7.5 Automorphic ambient module

S carries a canonical I-module structure induced by theta multiplication. The map IunitA→I determines every I-module action uniquely, and the theta trilinear pairing is balanced for this action; the smooth dual of S inherits the dual action.

(Dor23, Corollaries 4.25–4.26 and Remark 4.27, pp. 47–48 (Dor23 line 2395; Dor23 line 2400; Dor23 line 2402).)

A proof route is as follows. Use the Petersson unit identity and epi of the unit to descend I⊛S→S. Prove the action laws by epi cancellation. Transfer to the smooth dual using the balanced pairing, not an identification of compact and all smooth functions.

The required interface has the following properties.

- The I action on S is the descended theta product.
- Its action restricted along eA is the left unitor.
- The smooth dual S̃ has the contragredient I action.
- The theta trilinear form is balanced over I.

**Checks.**

- The inclusion I→S is I-linear. For x ∈ I both actions evaluate to mI on x.
- The Petersson embedding S→S̃ is compatible with the I actions. On two compact indicators the bilinear integral is the same through either map.
- Any two actions on S restricting to the same unit action coincide by epimorphicity. Precomposition makes their difference zero, and the epi implies the difference is zero.

*Needs:* §7.4; §6.2; Mathlib `CategoryTheory.Mod`.

### Examples

A compact nonnegative indicator in a product chart of the determinant map has positive fibre integral, so is outside I. Every Poincaré image has fibre integral zero. A noncuspidal vector in the Eisenstein ideal can have nonzero constant term despite determinant pushforward zero.

### Dependencies

§6.2; §6.1; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; §6.4; FunctionFieldArithmetic §6.2 with gap:determinant-pushforward and §6.1 with gap:sl2-rational-unipotent-generation in Exact supplier contracts; Mathlib `CategoryTheory.CommMon`; Mathlib `CategoryTheory.Mod`. The within-layer dependencies are the Needs lines above.

## Layer 8: Abstract automorphic modules

Work in A. Abstract automorphicity means an actual I-module structure in the exotic category. The epimorphic unit makes realization fully faithful and supplies the factorization and closure theorems.

### 8.1 Abstractly automorphic representations

Define Modaut(G)=ModI(Mod(G)) using the exotic commutative algebra I. Its realization functor forgets the I action. A smooth G-module V lies in its image exactly when the unitor IunitA⊛V→V factors through eA⊛id:IunitA⊛V↠I⊛V; the descended action is then unique.

(Dor23, Claim 4.28 and Definition 4.29, pp. 48–49; Remark 4.30, p. 49 (Dor23 line 2436).)

A proof route is as follows. Use Mathlib module objects once the ambient smooth exotic monoidal category has been built. The factorization is unique by the epi unit. Check the action axioms by precomposing with that epi in each input.

The required interface has the following properties.

- Module objects over I in the exotic category.
- Forget the action to obtain a smooth G-module.
- The displayed factorization through eA⊛id is necessary and sufficient.
- Any such factorization is the unique module action.

**Checks.**

- I with its regular action is abstractly automorphic. Multiplication mI gives the required factorization and unit composite idI.
- S and S̃ satisfy the factorization criterion by §7.5. The factorization is the actual theta action, with no compact/unrestricted identification.
- The criterion is about eA⊛V, not about V having a Whittaker model; determinant constituents are allowed. An automorphic determinant character can be a module although its nontrivial Whittaker quotient is zero.

*Needs:* §7.4; Mathlib `CategoryTheory.Mod`.

### 8.2 Fully faithful automorphic realization

The realization Modaut(G)→Mod(G) is fully faithful; its essential image is closed under subobjects, quotients, arbitrary limits and colimits, and the smooth transpose dual Dτ. It contains every irreducible classically automorphic representation, meaning a smooth irreducible subquotient of S̃. Extension closure is not asserted.

(Dor23, Claim 4.28, p. 48; Proposition 4.32 and Remarks 4.33–4.34, p. 49 (Dor23 line 2451); Dor21, Theorem A.1.1 and Warning A.1.2, pp. 4–5 (Dor21 line 157).)

A proof route is as follows. Any G-linear map between modules commutes with the actions after precomposing with the epi unit, hence is I-linear. Use right exactness of ⊛ for subquotients and the factorization criterion; use the smooth-dual pairing to transfer the action. For limits, apply uniqueness of compatible action maps and their universal properties; colimits follow from cocontinuity. Apply closure under subquotients to S̃.

**Checks.**

- The underlying identity of an I-module is I-linear and has exactly one lift.
- A subquotient of S̃ carries the unique descended action, including a determinant-character constituent with Whittaker quotient zero.
- For an infinite family, the smooth limit need not be the entire vector-space product; the common-open-stabilizer condition excludes nonsmooth tuples.

*Needs:* §8.1; §7.5; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 8.3 Automorphic matrix Schwartz module

Let S(M₂(A))Γ be the coinvariants of S(M₂(A)) under the rational action (γ·Φ)(m)=Φ(γ⁻¹m), with GL₂(A) acting on the quotient by (g·Φ)(m)=|det g|⁻¹Φ(mg⁻ᵀ). This smooth module is abstractly automorphic. More precisely, let T={diag(a,1):a∈A×}; after exchanging the second and third triality factors by the rigidified lift of §0.3, the map QΨ(m)=∫A× Ψ(m,y)|y|d×y identifies the T-coinvariants of the middle action on YA with S(M₂(A)), carrying the third outer action to the displayed weighted action and the rational first outer action to left translation, so S⊛S(T\G) ≅ S(M₂(A))Γ equivariantly; the balanced S action factors through I.

(Dor23, Example 4.35, p. 49 (Dor23 line 2477).)

A proof route is as follows. Balancing IRL(S(T\G)) against the middle factor takes coinvariants for |a|Ψ(m,ay), a∈A×; the functional Q is invariant exactly because of the weight |y|, and Q is surjective with kernel the span of these relations. The third outer action Ψ(mg⁻ᵀ,y det g) becomes |det g|⁻¹QΨ(mg⁻ᵀ), and the first outer action of γ∈Γ becomes Φ(γ⁻¹m) because |det γ|=1 by the product formula. Transport the I action on S through this product and use the module laws.

**Checks.**

- For Ψ(m,y)=1M₂(Ô)(m)1Ô×(y), with Ô the integral adeles and vol(Ô×)=1, QΨ(0)=1. At g = diag(π_v,1) at one place, Q(g·Ψ)(0)=∫1Ô×(yπ_v)|y|d×y=q_v, which equals |det g|⁻¹QΨ(0); the unweighted residual translation Φ(mg⁻ᵀ) would give 1.
- For m = E₀₁ and the nonsymmetric g = u(π_v⁻¹) at one place, with Φ the indicator of E₀₁+M₂(Ô), (g·Φ)(E₀₁)=Φ([[−π_v⁻¹,1],[0,0]])=0, whereas the untransposed right translation Φ(E₀₁g⁻¹)=Φ(E₀₁)=1; here |det g|=1, so the test isolates the transpose.
- A rational γ has |det γ|=1, so the rational coinvariant relation Φ(γ⁻¹m)∼Φ(m) carries no weight; replacing it by an arbitrary GL₂(A)-action on the underlying vector space does not give a factorization through I.

*Needs:* §8.2; §6.1; §7.5; §0.3; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### Examples

The regular I-module, S and S̃ realize as abstractly automorphic objects with unique actions. A classically automorphic determinant character has Whittaker quotient zero but still lies in this category. The matrix Schwartz application uses the rational left action and the weighted residual action |det g|⁻¹Φ(mg⁻ᵀ), not an arbitrary action on its underlying vector space.

### Dependencies

§7.4; Mathlib `CategoryTheory.Mod`; §7.5; SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; §6.1. The within-layer dependencies are the Needs lines above.

## Layer 9: Spin structures and spherical convolution

Work in A with an actual theta characteristic (L,η) and a nonzero rational section as specified below. The coalgebra counit, local transports and inverse-transpose compatibility are all construction and proof targets of this layer.

### 9.1 Unramified spin structure

On the smooth proper curve C of F, an unramified spin structure is a line bundle L with an isomorphism η:L⊗L≅ΩC. For a nonzero rational section s, set ω=η(s⊗s), use its residue character eω on A/F, and define the O_A-lattice Λω by self-duality under eω. Every local order of ω is even; this gives a unique such fractional O_A-lattice. The lattice is the compact-open decomposable fractional O_A-lattice ∏v πv⁻ᵒʳᵈᵛ⁽ω⁾ᐟ²Ov. Line bundles, tensor and canonical-sheaf carriers are supplied by the exact contracts.

(Dor23, Definition A.1 and Remarks A.2–A.3, p. 50 (Dor23 line 2507).)

A proof route is as follows. Use the actual line bundles and tensors of AlgebraicVectorBundles §§L0B–L0C, with differential and residue data from AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis. In a local trivialization write ω=u t² times a local differential generator; compute the local annihilator of a fractional O lattice. Even order makes the equation Λ=Λ⊥ have a unique integral-exponent solution.

The required interface has the following properties.

- A line bundle L and specified η:L⊗L≅ΩC.
- The residue character of ω=η(s²), trivial on F.
- Λω is the unique O_A-fractional lattice equal to its annihilator.
- Replacing s by a·s replaces ω by a²ω and Λω by a⁻¹Λω for a∈F×.

**Checks.**

- If s is replaced by a·s, all differential orders change by 2ordv(a). On ℙ¹, O(−1) squared is O(−2); degree zero would give the wrong canonical degree.
- At a place with an odd differential order there is no self-dual fractional O_v ideal, so the spin condition cannot be omitted. If ordv(ω) = 2k then Λv = π⁻ᵏO; an odd order such as one cannot have an integer half-lattice exponent.
- For ω locally with conductor exponent zero, the self-dual fractional ideal is O_v. For s ↦ as, the new lattice is a⁻¹Λ, detecting the inverse direction.

*Needs:* FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; AlgebraicVectorBundles §§L0B–L0C and FunctionFieldArithmetic §0.3 with the theta-characteristic contract in Exact supplier contracts.

### 9.2 Global spherical coalgebra

For fixed spin data and rational s, let EA=c-IndSL₂(O_A)^G1. The distribution 1M₂(Λω)(m)δ1(y) defines ΔA:EA→EA⊛EA. Construct εA:EA→IunitA as the restricted tensor of transported local counits, with local h_v satisfying h_vK_vh_v⁻¹∩U_v=u(π_v⁻ν_vO_v) and the lattice transport required by Λω. Prove both counit identities, ΔA invertible, symmetry and coassociativity.

For each place choose a lattice-adapted local comparison from §4.2 whose conductor intersection is u(π⁻νvOv). Transport εv and Δv, including the qv⁻νv and determinant-coordinate factors, to Λω,v. Prove reference-vector preservation at almost every place, define εA:EA → Iunit,A by their restricted tensor, and prove both counit equations and invertibility of ΔA on elementary tensors. These are construction targets in this section, not consequences of the existence of local maps alone.

(Dor23, Definition A.4, Construction A.5 and Claim A.6, p. 51; Remark 3.47, p. 33 (Dor23 line 2535; Dor23 line 1620).)

A proof route is as follows. Choose the local lattice-adapted h_v and compute how their middle actions transport the local rough distributions, including all scalar factors. Check that ε_v and Δ_v preserve the chosen reference vectors almost everywhere, so their restricted tensors exist. Check both adelic counit equations on elementary tensors and ΔA invertibility before applying idempotent coherence. The lattice-adapted counit and reference transports are part of this construction, including their exact local modulus factors.

The required interface has the following properties.

- EA is compact induction from SL₂(O_A).
- The map from 1M₂(Λω)δ1 interpreted in the rough kernel.
- The restricted tensor of the lattice-adapted local ε_v.
- Counit, cocommutativity and coassociativity, with invertible ΔA.

**Checks.**

- At an unramified place with Λv=O_v the local distribution is 1M₂(O_v)δ1. Both the coefficient and mass are one there.
- Both unit composites must be identity; checking only Φ⁻ of one composite is insufficient. The two composites have the same identity value on the compact-induction generator.
- A family of local maps that changes the distinguished vector at infinitely many places must be rejected as a restricted tensor map. A restricted tensor exists only with almost-everywhere reference preservation; pointwise local existence is insufficient.

*Needs:* §9.1; §6.1; §4.2; §5.1; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis.

### 9.3 Spin spherical convolution

Put H=SL₂(O_A) and C=I_H≅I^H, using compact averaging over ℂ. Identify C with the smooth part underlineHomG(EA,I): inside full Hom, take the union of the images of precomposition by the normalized averaging idempotents eJ, for compact open J containing H. For the corresponding maps f,g define f⋆g=mI(f⊛g)ΔA. This preserves C and makes it a commutative quasi-unital algebra for ordinary tensor: multiplication induces C⊗C C≅C. The scalar centre is explicitly ZG=End(IdMod(G)); z acts by zI∘f. No identification with a spectral function space is required.

(Dor23, Construction A.7, p. 51; §1.3, p. 6 (Dor23 line 2550).)

A proof route is as follows. Use the compact-induction/roughening adjunction and the eJ images to identify the smooth Hom carrier with I^H; compact averaging identifies invariants with coinvariants. Apply the coalgebra and algebra laws to convolution, verifying that the output remains in the smooth Hom carrier. Use finite-level local centre units and restricted tensor reference compatibility to prove quasi-unitality. Central balance of the kernel gives (z f)⋆g=z(f⋆g)=f⋆(z g), for z∈ZG.

The required interface has the following properties.

- The convolution on C=I_H≅I^H, identified with the smooth averaging-idempotent part of HomG(EA,I).
- It agrees with composition using ΔA and mI.
- Multiplication induces C⊗C C≅C. The full centre ZG=End(IdMod(G)) acts by postcomposition and the product is ZG-balanced.
- f⋆g=g⋆f for f,g∈C.

**Checks.**

- The displayed formula makes sense on all of HomG(EA,I). For u = ηI∘εA, with ηI:IunitA↠I the unit of §7.4, the unit law of mI, naturality of the unitor and the counit law of ΔA give u⋆f = f for every f ∈ C. Replacing ⋆ by 2⋆ satisfies closure, commutativity and quasi-unitality but gives u⋆f = 2f.
- Finite local Bernstein components orthogonal under a central idempotent multiply to zero; full Hom elements outside the union of the eJ images must not be admitted as smooth spherical functions. For orthogonal central projectors e and 1−e, the mixed product is e(1−e)(f⋆g) = 0.
- The product is not the pointwise product of quotient functions. Take disjoint compact open H-invariant subsets A and B of Γ\G with the same determinant image D and constant fibre volumes a, b > 0 (for instance the images of two distinct double cosets ΓxJ and Γx′J with det x′ = det x, for a compact open subgroup J of GL₂(Ô) containing H; right translation by J preserves the fibre measure, so the fibre volumes are constant on D), and put f = 1_A/a − 1_B/b. Then p(f) = 0, so f ∈ C, and f⋆f ∈ C ⊆ I has p(f⋆f) = 0, whereas the pointwise square has p(f²) = (1/a+1/b)·1_D ≠ 0; for a = b = 1 the two pushforwards are 0 and 2·1_D.

*Needs:* §9.2; §7.4; §5.5; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts.

### 9.4 Spin convolution invariance

For a fixed spin structure, changing the nonzero rational section s leaves the spherical convolution unchanged after the canonical transport of additive-character data. The map ι(f)(g)=|det g|⁻² f(g⁻ᵀ) is an involutive algebra automorphism of this convolution.

Construct the comparison for each a ∈ F× from the character eω to ea²ω and its kernel/coalgebra action; its source and target are the two products on the same space I^SL₂(OA). Prove transport of ΔA and mI before comparing their convolution composites. The assertion of multiplicativity requires this calculation in addition to the readily computed identity ι² = id.

(Dor23, Construction A.7 and Remark A.8, p. 51 (Dor23 line 2557).)

A proof route is as follows. For s↦a·s use ω↦a²ω, Λ↦a⁻¹Λ and rational middle/outer action to compare the two distributions; the product formula cancels the global modulus. Compute the transpose-inverse action on the theta multiplication and coalgebra with the factor |det|⁻². Compare the products on the same smooth spherical carrier by the explicit character-change and coalgebra transports.

**Checks.**

- Replacing s by as sends ω to a²ω and Λ to a⁻¹Λ; for a local uniformizer the lattice exponent changes by −1.
- For rational a, the global scale is ∏v |a|v = 1, so the transported product is the same map on C.
- At g = diag(π,1), ι multiplies by q² and the second application at g⁻ᵀ by q⁻², so ι²f(g) = f(g). Multiplicativity is the separate product-transport calculation.

*Needs:* §9.3; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis.

### Examples

On ℙ¹, L = O(−1) and Ω = O(−2). For dt at infinity, ord∞(dt) = −2 and Λ∞ = πO∞. Replacing a local section by π times itself changes ω by π² and Λ by π⁻¹. For rational changes the global norm product is one. The weighted inverse-transpose square has factors q² and q⁻² at diag(π,1).

### Dependencies

FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; AlgebraicVectorBundles §§L0B–L0C and FunctionFieldArithmetic §0.3 with the theta-characteristic contract in Exact supplier contracts; §6.1; §4.2; §5.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; §7.4; §5.5; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts. The within-layer dependencies are the Needs lines above.

## Layer 10: Normalized parabolic induction

Work in L. The normalization uses an invertible firm torus module with an additive first coordinate. Its unit injection is not invertible before localization, and every intertwining formula retains its normalization factors.

### 10.1 Parabolic normalization module

For local F as in L, T=F××F×, let Lnorm=S(F × F×), with first coordinate additive and including 0. Set ((a,d)·f)(λ,y)=|a/d| f(d⁻¹λ,ady). The torus tensor unit is 1T=S(T), with T acting by ((a,d)·f)(x,y)=f(ax,dy). There is a canonical injection η:1T→Lnorm defined for λ≠0 by (ηf)(λ,y)=|λ²y|⁻¹ f(λy,λ⁻¹), extended by zero at λ=0. The normalized Weyl twist is V(w)(a,d)=|a/d|·V(d,a).

(Dor21, Definitions B.2.8 and B.3.1, pp. 18, 20; Proposition B.5.4 and proof, pp. 25–28 (Dor21 line 742; Dor21 line 832); Dor20Z, Appendix A, Claim A.3 and proof, p. 26 (Dor20Z line 1060).)

A proof route is as follows. Use pullback and extension by zero to define the displayed smooth T action and η; compact support in T makes the extension vanish near λ=0. Prove η injective and T-equivariant for this action on 1T: both ((a,d)·ηf)(λ,y) and η((a,d)·f)(λ,y) equal |λ²y|⁻¹f(aλy,dλ⁻¹). Import invertibility of Lnorm as a firm convolution module from AutomorphicLFunctionsAndLocalFactors AL.1; no trivialization is declared canonical.

The required interface has the following properties.

- S(F × F×) with the stated weighted action.
- The canonical injection η with its exact coordinate formula, T-equivariant for the action ((a,d)·f)(x,y)=f(ax,dy) on 1T.
- The twist (a,d)↦|a/d|ρ(d,a) is involutive.
- Lnorm is an invertible firm T-module, isomorphic to 1T after a noncanonical choice.

**Checks.**

- At λ=0 the η image is zero, while Lnorm permits nonzero values there. A function equal to one near λ = 0 lies outside the image, although it belongs to Lnorm.
- The Weyl twist squared is identity because |a/d|·|d/a|=1. At (π,1) and then (1,π), the weights q⁻¹ and q multiply to one.
- Replacing η by unweighted extension from (λ,y) misses the |λ²y|⁻¹ normalization and fails T-equivariance. Choose f with f(π,1) = 1. At (a,d) = (π,1), (λ,y) = (1,1), weighted equivariance gives |π|·|π|⁻¹f(π,1) = q⁻¹·q = 1 on one path and ((π,1)·f)(1,1) = f(π,1) = 1 on the other; unweighted extension gives q⁻¹ against 1. Under the inverse translation action f(a⁻¹x,d⁻¹y) on 1T the second path is f(π⁻¹,1) instead, which is 0 for f the indicator of a small neighbourhood of (π,1), so η would not be equivariant.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; AutomorphicLFunctionsAndLocalFactors AL.1 and its normalization-module contract in Exact supplier contracts.

### 10.2 Normalized induction and restriction

Let i be unnormalized smooth parabolic induction from the upper Borel, r its left adjoint of U-coinvariants. Define î(V)=i(underlineHomT(Lnorm,V)) and r̂(W)=Lnorm⊗T r(W), so r̂⊣î. The output category uses ⊛ and the input firm torus category uses ⊗T. This normalization is different from multiplying induction by δB¹ᐟ².

(Dor21, Definition B.4.1 and Remarks B.4.2–B.4.3, p. 23 (Dor21 line 973).)

A proof route is as follows. Use the closed tensor-Hom adjunction for firm torus modules, supplied by SmoothRepresentationsOfLocalGroups SR.1. Compose that adjunction with r⊣i; prove the displayed formula for r̂. Record the noncanonical comparison î≅i only after choosing a trivialization Lnorm≅1T.

The required interface has the following properties.

- î=i∘underlineHomT(Lnorm,−).
- r̂=Lnorm⊗T r(−).
- HomT(r̂W,V)≅HomG(W,îV).
- A chosen trivialization Lnorm≅1T induces î≅i.

**Checks.**

- The defining adjunction has r̂ on the left and î on the right. Reversing HomG(W,îV) to HomG(îV,W) gives the wrong adjunction.
- For a torus character, the comparison with ordinary induction depends on the chosen normalization line trivialization. Rescaling the trivialization by c rescales the comparison by its corresponding nontrivial scalar.
- No square root of q is an input of this normalization. At q = 3 the normalization is defined without choosing √3.

*Needs:* §10.1; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; §5.2.

### 10.3 Rank-one induction multiplication

Restriction Ψ↦((λ,y)↦Ψ(diag(0,λ),y)) identifies the quotient of Uᵀ×U×Uᵀ-coinvariants of Y, twisted by ((1,−1),(0,0),(1,−1)) and then balanced to identify the three T actions, with Lnorm. Consequently there is a universal natural map i(A)⊛i(B)→i(Lnorm⊗T A⊗T B), and evaluation of Lnorm against its internal Hom yields î(A)⊛î(B)→î(A⊗T B).

(Dor21, Construction B.3.4, Claim B.3.5, Proposition B.3.6 and Corollary B.3.7, pp. 21–22; Claim B.4.4, p. 23 (Dor21 line 858).)

A proof route is as follows. Take the middle ordinary U-coinvariants, which retain the singular determinant locus. Filter by lower-Borel rank-one orbits; wrong torus weights remove all but the diag(0,λ) stratum. Prove the resulting map invertible and apply induction/Jacquet adjunction, then internal-Hom evaluation.

**Checks.**

- At diag(0,λ), determinant is zero and the middle U-character is one; the surviving λ variable is additive and includes zero.
- The discarded rank-two cell has nontrivial middle-unipotent character and its ordinary coinvariant contribution is zero.
- For a torus diagonal (π,1), the surviving action has scalar q⁻¹, agreeing with Lnorm rather than an untwisted Schwartz module.

*Needs:* §10.2; §0.4; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 10.4 Lax symmetric induction

The canonical multiplication on î is associative and symmetric, making î nonunital lax symmetric monoidal. After the tensor-compatible localization inverting η:1T→Lnorm, it has a canonical unit and is lax symmetric monoidal. Before localization no such unit structure exists in general.

The localization is universal among cocontinuous tensor functors that invert every tensor translate of η. Its objects remain actual firm modules under the resulting localization; a formal predicate naming invertibility without constructing the localization does not supply the unit.

(Dor21, Proposition B.5.4, pp. 25–29; Theorem B.6.1 and Corollary B.6.2, pp. 30–33 (Dor21 line 1067; Dor21 line 1368).)

A proof route is as follows. Compute the almost-unit square of Proposition B.5.4 using the partial Fourier transform F(f)(λ,y)=|y|∫f(α,y)e(−αλy)dα. For associativity compare the two triple products under Φ⁻ using the universal three-input orbit quotient. Its target is Lnorm⊗T Lnorm, realized as the convolution image allowing the double-pole boundary. The image of the difference is degenerate and vanishes since î(1T) has no SL₂(F)-fixed vectors. Construct localization by inverting tensor translates of η and verify the unit there. The reducible induction in Example B.5.1 gives the obstruction before localization.

**Checks.**

- The two triple products have target Lnorm⊗T Lnorm before evaluation; dropping one factor changes the boundary order.
- The reducible i(|a/d|) with trivial quotient cannot acquire the proposed unlocalized unit.
- After η is inverted, its image is the identity unit comparison and both unitality paths coincide; invertibility is used at exactly this step.

*Needs:* §10.3; §10.1; §5.2.

### 10.5 Normalization-aware intertwiner

The trace Φ⁻î(A)=underlineHomT(Lnorm,A) and multiplication define M:î(A)→î(Lnorm⊗T A(w)). Its double composite equals the map induced by η⊗η(w), it preserves the trace and the unit image, and is multiplicative with the extra normalization factor. After inverting both η and η(w), M gives an involutive algebra-compatible self-duality.

(Dor21, Construction B.7.7, Theorem B.7.8, Claim B.7.9 and Proposition B.7.10, pp. 35–40 (Dor21 line 1649).)

A proof route is as follows. Use the induction–restriction dual pairing to transpose the trace of multiplication. Compute M on the regular induced generator as the Fourier transform of the usual unipotent intertwining integral. Prove the universal binary quotient map is invertible (Proposition B.7.10), then verify the trace square on small compact-open indicators. Deduce unit invariance, multiplicativity and the double-composite identity; retain all Lnorm factors before localization.

The required interface has the following properties.

- M:î(A)→î(Lnorm⊗T A(w)).
- The double composite is η⊗η(w), with the indicated identifications.
- M respects the trace square of Theorem B.7.8(2).
- M commutes with multiplication after inserting the second normalization factor.
- With η and η(w) invertible, M is an involution between the corresponding twists.

**Checks.**

- Before localization the double composite is not asserted to be identity. It equals the map from η⊗η(w), which can fail to be invertible before localization.
- The unit image is fixed by M after the specified η(w) insertion. The same normalized unit vector occurs on the two sides of the trace square.
- At an unramified place, small principal-congruence indicators give the Fourier-normalized intertwining formula with the same Haar measure. At conductor zero Fourier reflection and the factor |y| reproduce w² = −I.

*Needs:* §10.4; §2.5.

### Examples

At λ = 0, ηf is zero, while a Schwartz function supported near (0,1) need not vanish. At (a,d) = (π,1) the torus action contributes q⁻¹ and the injection contributes q, giving the equivariance scalar one. The normalized Weyl square has factors q⁻¹ and q, so is the identity; the intertwiner square remains η⊗η(w) before localization.

### Dependencies

AutomorphicLFunctionsAndLocalFactors AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels, with its equal-characteristic contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; AutomorphicLFunctionsAndLocalFactors AL.1 and its normalization-module contract in Exact supplier contracts; §5.2; §0.4; §2.5. The within-layer dependencies are the Needs lines above.

## Layer 11: Automorphic adjunctions and components

Work in A, using the local normalization of Layer 10. Prove Weyl lifting before constructing Eisenstein component projections. The degree argument uses large positive ray classes and a degree-generating idele, without a rational-point hypothesis.

### 11.1 Automorphic torus category

Let T=T(A) and T(F) its rational subgroup. Modaut(T) is the category of smooth T/T(F)-modules, equivalently modules over IT=S(T(F)\T) with convolution inside smooth T-modules. The realization is inflation and is fully faithful. Its monoidal product is the smooth relative tensor over T/T(F), equivalently the IT-module relative tensor.

(Dor21, Definition C.3.1 and Remark C.3.2, p. 44 (Dor21 line 2090).)

A proof route is as follows. Use the abelian quotient topology and the rational-invariance descent of representations. Construct IT by quotient convolution and prove the action/quotient equivalence through compactly supported functions and local units.

The required interface has the following properties.

- Smooth representations of T/T(F).
- Inflation along T→T/T(F), fully faithful.
- The category is Mod(IT) in the smooth relative-tensor category.
- The product agrees with ⊗T/T(F) and the unit with IT.

**Checks.**

- A smooth T-module descends exactly when every rational t∈T(F) acts trivially. For a rational t with ρ(t) ≠ id, the representation cannot inflate from the quotient.
- A character of T trivial on T(F) defines an object. The trivial character has value one on all rational t, giving a nonzero example.
- The monoidal unit is IT, not S(T) inflated from a nonexistent identification T=T/T(F). At any nontrivial rational element the quotient map identifies two distinct elements of T.

*Needs:* FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 11.2 Automorphic induction adjunction

Globalize Lnorm and î using S(A×A×) where the first A is additive, with reference vector 1Ov(λ)1Ov×(y) at every place. Invert the local maps ηv by tensor-compatible localization; there is no assumed global η respecting reference vectors. Then î maps Modaut(T) into Modaut(G), and its restriction îaut has left adjoint r̂aut(V)=(r̂V)T(F). The unit-factorization map I→î(IT[ηv⁻¹]) is the constant term. Choosing a trivialization of Lnorm also gives ordinary iaut; the canonical normalization remains îaut.

(Dor21, Theorems C.2.1 and C.2.3, Warnings C.2.2 and C.2.4, pp. 42–43; Theorem C.3.3, Remark C.3.5 and Claim C.3.7, pp. 45–47 (Dor21 line 2035).)

Globalize the trace and the intertwiner of §10.5 as follows. For a smooth T(A)-module A write A[η⁻¹] for the tensor-compatible localization inverting every ηv, and A[η(w)⁻¹] for the one inverting every Weyl-twisted map ηv(w):1T,v(w)→Lnorm,v(w). At each place the local trace Φ⁻v îv(V)≅underlineHomTv(Lnorm,v,V) has a unique completion through ηv(w) to underlineHomTv(Lnorm,v⊗Tv Lnorm,v(w),V[ηv(w)⁻¹]); prove that these completions, unlike the local traces, preserve the reference vectors at almost every place. Construct the resulting natural maps Φ⁻î(A)→underlineHomT(Lnorm⊗T Lnorm(w),A[η(w)⁻¹]) and M_A:î(A)→î(A(w)[η⁻¹]). No restricted tensor of the unlocalized local traces or intertwiners is asserted. Since |a/d| is trivial on T(F), multiplication by it identifies IT(w) with IT. Prove that the image of the unit 1→î(IT[η⁻¹]) is invariant under M:î(IT[η⁻¹])→î(IT[η⁻¹,η(w)⁻¹]).

(Dor21, Remark C.2.5, pp. 43–44; Remark C.3.9, p. 46 (Dor21 line 2066; Dor21 line 2156).)

A proof route is as follows. Verify that the local multiplication respects distinguished vectors. For units invert each ηv; the unlocalized local units do not form a restricted tensor map. Identify the resulting unit map with the constant-term unfolding and factor it through I using the Poincaré sum. Exactness and colimit preservation, with the inclusion IT→IT[ηv⁻¹], extend automorphicity to every torus object. Compose the reflector to rational coinvariants with the normalized Jacquet adjunction to obtain r̂aut⊣îaut.

The required interface has the following properties.

- Restriction of î to abstractly automorphic torus modules.
- V↦(r̂V)T(F), with quotient torus action.
- r̂aut⊣îaut, with the inherited unit and counit.
- The factorization I→î(IT[ηv⁻¹]) agrees with the usual constant-term map.
- Natural maps Φ⁻î(A)→underlineHomT(Lnorm⊗T Lnorm(w),A[η(w)⁻¹]) and M_A:î(A)→î(A(w)[η⁻¹]) for every smooth T(A)-module A, with exactly these localized targets.
- The constant-term image I→î(IT[η⁻¹]) is invariant under M:î(IT[η⁻¹])→î(IT[η⁻¹,η(w)⁻¹]).

**Checks.**

- At every place ηv(1Ov×(x)1Ov×(y)) is 1Ov×(λ)1Ov×(y), whose value at (λ,y)=(0,1) is 0, while the Lnorm reference 1Ov(λ)1Ov×(y) has value 1 there. So the family ηv changes the reference vector at every place and is not a global map 1T→Lnorm. The Weyl twist changes only the action, not the underlying linear map, so ηv(w) shows the same values 0 and 1: the raw local traces and intertwiners do not assemble, and reference preservation is checked only after the ηv(w) insertion.
- On an automorphic torus character, îaut realizes as normalized smooth parabolic induction. Its rational torus action is trivial, and the realization has the specified induction direction.
- Applying r̂aut to a cuspidal object gives zero; the converse is excluded by the anomalous example below. The Eisenstein quotient in §11.4 supplies a nonzero object with zero restriction.

*Needs:* §11.1; §10.5; §8.2; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts.

### 11.3 Local Weyl invariant lifting

Periodization S(T(A))→S(T(F)\T(A)) maps the subspace invariant under every separate local normalized Weyl involution onto the subspace invariant under the simultaneous global normalized Weyl involution.

(Dor21, Lemma C.4.9 and Remark C.4.10, pp. 51–52 (Dor21 line 2421).)

A proof route is as follows. Choose a compact open unit level K for the target and refine to a ray level stable under swapping the two coordinates. Put C=F×\A×/K. Multiplication by the character |a/d|⁻¹ᐟ², that is h(a,d) = |a/d|⁻¹ᐟ²f(a,d), changes normalized Weyl symmetry to ordinary swap and commutes with periodization and convolution. Use Haar-normalized coset functions, so the fixed-level quotient algebra is ℂ[C×C]. Let R be the image of the separately local-swap-invariant compact functions. It is a convolution subalgebra. Write D(u,v)=[u]⊗[v] and S(u,v)=D(u,v)+D(v,u). The diagonals D(z,z), including D(z⁻¹,z⁻¹), lie in R. If u/v is represented by a single prime away from the modulus, S(u,v) lies in R: choose identical local representatives outside that prime and symmetrize the two cosets there. Normalize by the finite rational stabilizer when periodizing. Use finiteness of C⁰ and a degree-splitting idele from FunctionFieldArithmetic §§0.1–0.3, 4.8. Its finite quotient by the degree generator has a class field by FunctionFieldArithmetic §§4.9–4.10. Apply degree-sensitive Chebotarev to this finite extension: every ray class of sufficiently large positive degree contains a prime away from the modulus, with the constant-field condition retained. The bound is uniform over the finite degree-zero classes. For arbitrary u,v choose z of sufficiently large degree that z, uz/v and uz²/v all have such prime representatives. The already lifted functions satisfy S(uz,v)S(1,z)=D(z,z)S(u,v)+S(uz²,v). Hence S(u,v)=D(z⁻¹,z⁻¹)(S(uz,v)S(1,z)−S(uz²,v)) lies in R. These generators span all swap invariants, with diagonal generators divided by 2 over ℂ. Undo the character conjugation to restore the |a/d| weight. The argument covers u/v of degree zero or negative without requiring a prime in that original class.

**Checks.**

- In the group algebra, the four products of S(uz,v)S(1,z) are D(uz,vz), D(uz²,v), D(v,uz²), D(vz,uz); the right side has those same four terms.
- For u/v of degree zero and deg z = N, the three needed prime degrees are N,N,2N, all large positive; no prime of degree zero is requested.
- For deg(u/v) = −m and N > m plus the uniform threshold, the three degrees are N,N−m,2N−m; the original negative class is recovered by subtraction.
- At u = v, S(u,u) = 2D(u,u), so division by two is legitimate over ℂ and would fail over characteristic-two coefficients.
- If f(1,π) = 1 and f(π,1) = q⁻¹, the conjugated function has value q⁻¹ᐟ² at both pairs; multiplying by the positive half-power instead gives unequal values.
- At full unit level over 𝔽₃, the rational stabilizer has two elements per coordinate, so periodizing a torus coset indicator gives coefficient 4; dividing by 4 gives a unit basis element.

*Needs:* §11.1; §10.1; FunctionFieldArithmetic §5.8; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; FunctionFieldArithmetic §§4.8–4.10.

### 11.4 Cuspidal and Eisenstein components

Let Icusp be the kernel of the constant term on I and IEis its Petersson orthogonal complement inside I. They are complementary ideals, I≅Icusp×IEis. Define Ccusp as cuspidal automorphic irreducibles modulo unramified norm twists and CEis as automorphic torus characters modulo independent norm twists and the normalized global Weyl action. For each c∈CEis, define Ic as the pullback of the c component of î(IT[ηv⁻¹]) along IEis→î(IT[ηv⁻¹]); use the induced cuspidal family algebra for c∈Ccusp.

The invariant pairing defining the algebra and the positive Hermitian Petersson orthogonality used to split the cuspidal spectrum have different roles. For the latter use the usual conjugate-linear second factor and the involution/duality comparison to identify the complementary ideals. Fixed level and bounded determinant degree give finite-dimensional cusp spaces, so the orthogonal projection preserves compact quotient support.

(Dor21, Proposition C.4.1, pp. 47–48; Proposition C.4.6 and Remark C.4.5, p. 49; Proposition C.4.8, pp. 50–51 (Dor21 line 2254).)

A proof route is as follows. Use finite dimensionality of cusp forms with fixed compact level and bounded determinant norm to prove the Petersson decomposition inside compact functions. Construct cuspidal family algebras by induction from G¹={|det|=1}; choose an idele generating the image of the norm, not an assumed degree-one place. Construct the Eisenstein pieces as actual pullbacks and use the local Weyl-invariant centre lifting target §11.3 to prove they sum to IEis.

The required interface has the following properties.

- The constant-term kernel inside I.
- The Petersson orthogonal complement inside I.
- Ccusp ⊔ CEis with the specified norm-twist and Weyl identifications.
- Cuspidal family algebras and the Eisenstein pullback ideals.
- I≅Icusp×IEis as exotic commutative algebras.

**Checks.**

- A cuspidal function belongs to the constant-term kernel. Its constant term is the zero function.
- Let trivT be the one-dimensional trivial automorphic torus representation, distinct from the convolution tensor unit IT. The quotient of iaut(trivT) by its unique trivial irreducible subobject has raut=0 while belonging to the Eisenstein side (Dor21, Warning A.1.19, p. 9; Dor21 line 324). The displayed object has restriction zero and cuspidal projection zero; a kernel-only definition of the cuspidal component fails.
- The argument must work for curves without a rational point; a place of degree one cannot be a general input. Places of degrees 2 and 3 produce a degree-one idele as their difference without producing a rational point.

*Needs:* §11.2; §7.4; FunctionFieldArithmetic §§6.3–6.4 with their central-lattice and fixed-central-degree conventions; AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, Restricted tensor realizations, and AL.3, Function-field local factors, multiplicity one and converse theorem, with gap:function-field-cuspidal-multiplicity-one in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §11.3; FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis.

### 11.5 Automorphic component decomposition

The component ideals yield a canonical symmetric monoidal equivalence Modaut(G)≅∏c∈Ccusp⊔CEis Modautc(G). Cuspidal components are killed by r̂aut, while some nonzero Eisenstein objects are killed as well. The key lifting statement is surjectivity from compact torus functions invariant under each separate local normalized Weyl involution to automorphic torus functions invariant under the simultaneous global Weyl involution.

(Dor21, Lemma C.4.9 and Remark C.4.10, pp. 51–52; Theorem C.4.12, p. 52; Warning A.1.19, p. 9 (Dor21 line 2467).)

A proof route is as follows. Apply §11.3, including its large-degree convolution argument, to the two-coset symmetric generators. A prime in an arbitrary fixed-degree ray class cannot be assumed. Use the lifting to realize Eisenstein projections by the smooth Bernstein centre, so the image IEis is stable under each projection. Use local finiteness at fixed level and bounded norm on the cuspidal side to obtain the algebra decomposition. Interpret products in the smooth category; do not identify all underlying vector-space products with direct sums. Pass from complementary locally unital ideals to module categories and check the relative monoidal product.

**Checks.**

- For a component idempotent e, e(1−e) = 0 and e² = e, giving zero mixed products and the identity component projection.
- A tuple in the categorical product need only give a smooth object after the specified smooth reconstruction; a vector-space product with arbitrary nonsmooth stabilizers is too large.
- A nonzero anomalous Eisenstein object has restriction zero while its cuspidal projector is zero, disproving the converse to cuspidal vanishing.

*Needs:* §11.4; FunctionFieldArithmetic §5.8; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §11.3.

### 11.6 Irreducible automorphic equivalence

Realization induces a bijection between irreducible objects of Modaut(G) and irreducible classically automorphic smooth G-modules, understood as subquotients of S̃. For a local generic irreducible W with a specified unit quotient Iunit↠W, every irreducible W-module is isomorphic to W; this includes Steinberg and is stronger than agreement of central characters.

(Dor21, Theorem C.5.1 and Lemma C.5.2, pp. 53–54; Remark C.5.3, p. 54 (Dor21 line 2486).)

A proof route is as follows. For Eisenstein components import automorphicity of all constituents of parabolic inductions from automorphic characters (FunctionFieldArithmetic §6.3 with gap:eisenstein-constituent-automorphicity in Exact supplier contracts). For cuspidal components use the local W-module lemma. In the Steinberg block compute products with both nonsplit extensions of 1G and St; identify all St-modules as sums of St. Use the component-centre action to reduce an irreducible to these cases. Agreement of the Bernstein centre alone is insufficient.

**Checks.**

- A cuspidal irreducible occurs with its classical multiplicity-one realization; its abstract action is unique.
- For a local Steinberg unit quotient, a Steinberg algebra module is a sum of Steinberg copies; a determinant character in the same Bernstein block is not such a module.
- An automorphic determinant constituent of an induced torus character is included, although its nontrivial Whittaker quotient is zero.

*Needs:* §11.5; §5.4; §8.2; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; FunctionFieldArithmetic §6.3 with gap:eisenstein-constituent-automorphicity in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations.

### 11.7 Finite-length automorphic restriction

The normalized automorphic parabolic restriction r̂aut sends finite-length objects to finite-length objects. On an irreducible Eisenstein object its underlying torus module is a quotient of an extension of an automorphic character χ by χ(w), hence has dimension at most two. It is zero on cuspidal components.

(Dor21, Theorem C.5.4 and Remark C.5.5, pp. 54–55 (Dor21 line 2554).)

A proof route is as follows. Use right exactness to reduce to an irreducible object. Describe the local Jacquet modules and their distinguished cyclic vectors; their restricted tensor is covered by the torus module induced from the separately Weyl-invariant Hecke algebra. Use the lifting theorem to pass to the global Weyl-invariant algebra, and its rank-two quotient bound. Apply rational coinvariants to get dimension at most two.

**Checks.**

- A cuspidal irreducible has zero torus restriction, of length zero.
- An irreducible Eisenstein object has a torus quotient of an extension of χ by χ(w), hence dimension at most 1+1 = 2, including χ = χ(w).
- For an object of length n, right exactness gives a filtration of the restriction with at most n such quotient pieces; the length is at most 2n.

*Needs:* §11.5; §11.6; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; §11.3.

### Examples

For an idele ratio of degree −m, choose z of degree N so that N, N−m and 2N−m are all beyond the prime threshold. Expanding S(uz,v)S(1,z) gives the same four terms as D(z,z)S(u,v)+S(uz²,v), recovering the negative-degree generator. An irreducible Eisenstein restriction has dimension at most two; a cuspidal restriction has dimension zero.

### Dependencies

FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, and AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; AutomorphicFormsOnReductiveGroups §3.4, Restricted tensor products and finite corners; SmoothRepresentationsOfLocalGroups §§SR.1.1–SR.1.3 and its firm-enrichment contract in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 and its smooth-balanced-tensor contract in Exact supplier contracts; §10.5; §8.2; §10.1; FunctionFieldArithmetic §5.8; FunctionFieldArithmetic §§4.8–4.10; §7.4; FunctionFieldArithmetic §§6.3–6.4 with their central-lattice conventions and gap:eisenstein-constituent-automorphicity in Exact supplier contracts; AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, Restricted tensor realizations, and AL.3 with gap:function-field-cuspidal-multiplicity-one in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3.2 and its transpose-distribution contract in Exact supplier contracts; §5.4; GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 with gap:odd-equal-characteristic-gl2-classification and gap:all-generic-kirillov in Exact supplier contracts; SmoothRepresentationsOfLocalGroups §SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles, and §SR.5.2, segment-representations. The within-layer dependencies are the Needs lines above.

## Downstream consumers

The output is a general library of smooth exotic tensor products, theta algebras and abstract automorphic modules. It supplies ordinary spherical algebras from exotic algebra objects, categorical forms of constant terms and induction, and a component decomposition compatible with classical irreducibles. The trace and module interfaces support reducible and infinite-length representations as well as irreducibles. The spin product depends on the chosen theta characteristic and is independent of its nonzero rational section. The local normalization and automorphic adjunction do not depend on a spin choice.

## Worked examples

The matrix and Fourier examples in Layers 0–1 determine the triality normalization, including dyadic characteristic-zero fields. The two extension orientations and ramified determinant character in Layers 3–4 distinguish the generating subcategories. Layers 6–8 distinguish compact support, determinant pushforward, constant terms and unrestricted dual functions. Layer 9 uses the projective-line spin datum to determine the lattice exponent. Layer 11 expands the four-term convolution identity and recovers both degree-zero and negative-degree ray classes; it never asks for a prime in one of those classes. Each example is a mathematical test of the general construction, not a restriction of its scope.

## References

All statements are written in this roadmap's own words. Page numbers are the printed pages of the indicated versions; line locators use the source IDs and versions listed below.

- **Dor23.** Gal Dor, [Exotic Monoidal Structures and Abstractly Automorphic Representations for GL(2)](https://doi.org/10.1017/fmp.2023.18), Forum of Mathematics, Pi 11 (2023), e20, pp. 1–52, version of record. §§2–4 and Appendix A. The local conductor intersection is a conductor lattice, the Weyl Fourier integral is adelic in the global proof, and Petersson integration is on the rational quotient. The spin coalgebra includes the explicit counit and transport targets of §9.2.
- **Dor21.** Gal Dor, [Global Parabolic Induction and Abstract Automorphicity](https://arxiv.org/abs/2102.11820v1), arXiv:2102.11820v1 (2021), §§B.2–B.7 and C.2–C.5. Induction has direction from torus modules to group modules. Degree-generating ideles and the four-term convolution argument give the degree-uniform component proof in §§11.3–11.5.
- **GH11.** Shamgar Gurevich and Ronny Hadani, [The categorical Weil representation](https://arxiv.org/abs/1108.0351v1), arXiv:1108.0351v1 (2011), Theorem 3.1.2, pp. 10–11, and Appendix A, p. 15 (GH11 line 481; GH11 line 705). Both defect-intertwining equations and invertibility are retained.
- **Arm67.** J. V. Armitage, [On a theorem of Hecke in number fields and function fields](https://doi.org/10.1007/BF01425516), Inventiones mathematicae 2 (1967), pp. 238–246. Cited by Dor23 Remark A.2, p. 50, for existence of a rational theta characteristic; the text is uncertified and cited by locator alone.
- **Dor20Z.** Gal Dor, [Modules of Zeta Integrals for GL(1)](https://arxiv.org/abs/2012.03068v1), arXiv:2012.03068v1 (2020), Appendix A, Theorem A.1 and Claims A.2–A.3, pp. 25–26 (Dor20Z line 1054; Dor20Z line 1060). Only the nonarchimedean local module-freeness result is consumed here; its torus pullback is the exact normalization-module contract.
