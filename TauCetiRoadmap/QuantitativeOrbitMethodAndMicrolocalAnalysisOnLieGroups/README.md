# Roadmap: the quantitative orbit method and microlocal analysis on Lie groups

**Summary.** This roadmap builds a microlocal calculus on unitary representations of Lie groups, uniform in the representation, and carries it through to the smoothly weighted asymptotic formula for Gan–Gross–Prasad periods of Nelson and Venkatesh. Symbols live on the imaginary dual of the Lie algebra and are quantized by integrating the representation against their inverse Fourier transforms in an exponential chart; operators are measured on the Sobolev scales of the Nelson Laplacian. From the uniform composition calculus and its uniform L² bound (Layers 0–1), localization at infinitesimal characters (Layer 2) and Rossmann's character formula (Layer 3) give the Kirillov-type trace asymptotics `h^d tr Op_h(a) → ∫_O a` with uniform trace-ideal bounds. Uniform Plancherel estimates and local relative characters (Layer 4), the stable invariant theory and volume forms of orthogonal and unitary GGP pairs (Layer 5) and the stable relative-character expansion (Layer 6) compare restriction to a subgroup with integration over stable Hamiltonian fibres. Positive inverse-branching tests (Layer 7), semiclassical limit states and their equidistribution by Ratner's theorem (Layer 8) and a microlocally truncated period Parseval identity (Layer 9) then give the end theorem: for an anisotropic orthogonal or unitary GGP pair over a number field and a fixed automorphic representation Π of the larger group, `h^d Σ_Σ L(Π,Σ) k(hλ_σ) k′(σ′) → (τ(H)/τ(G)) ∫k ∫k′`, the source's Theorem 30.1 with the binary orthogonal self-twist excluded.

## Scope and ownership

This roadmap owns: the representation-theoretic symbol and operator calculus (Sobolev scales indexed by all integers, commutator operator classes, symbol families with a semiclassical parameter, the quantization map and its star product, the order-zero bound and the rescaled composition calculus); the real infinitesimal quotient of the imaginary dual and the localization theorems for eigenfunctionals; normalized regular coadjoint multiorbits, their weak topology, Rossmann's character formula and the uniform orbit trace expansion; the representation-smooth refinement of the Schatten ideals; the uniform K-type, Plancherel–Sobolev and Ξ-integrable extensions of the Plancherel formula; local relative characters of GGP pairs and their Plancherel disintegration; stability, torsors and volume forms for the coadjoint action of a GGP subgroup; the stable relative-character expansion; positive inverse branching at archimedean and p-adic places; smooth operator states, semiclassical limit states and their equidistribution; and the truncated period identity with the weighted asymptotic formula; and the lattice form of the Borel density theorem that the measure classification of §8.6 uses. Every one of these is a statement about general Lie groups, real reductive groups or GGP pairs; no target is restricted to a particular group beyond what its source theorem states.

It consumes, and does not plan again: the exponential map, adjoint actions, Baker–Campbell–Hausdorff, real forms and the Cartan/Iwasawa/KAK decompositions (RepresentationTheory/LieGroups Layers 0, 1, 3, 5, 7 and 9, realized at the pin by Tau Ceti `mulInvariantExp` and `lieExp`); PBW, the symmetrization isomorphism, the Casimir, the Weyl dimension formula and, for Killing-semisimple Lie algebras, the Harish-Chandra and Chevalley isomorphisms (RepresentationTheory/LieHighestWeight Layers 3, 5, 6 and 7); the reductive invariant quotient with its central affine factors and its Chevalley restriction, the principal slice of the adjoint quotient and its differential at regular elements (FormalConnectionsOpers F4.3); reductive infinitesimal characters (AutomorphicFormsOnReductiveGroups §2.2); normalized Haar measure, Peter–Weyl and characters of compact groups (RepresentationTheory/CompactGroups Layers 0, 5 and 6); the adjoint quotient map, Jacobson–Morozov, finiteness of nilpotent orbits and the regular nilpotent orbit over ℂ (NilpotentOrbits N1–N2); moment maps, the Kirillov–Kostant–Souriau form on coadjoint orbits and symplectic reduction (SymplecticGeometry/HamiltonianReduction R1–R3) and the Liouville measure (SymplecticGeometry/ConvexityToric T4); Schatten ideals (OperatorTheory/OperatorIdeals Parts B–C), the Hilbert-space trace (VonNeumannAlgebras V4.Core) and the trace-norm bound of a Hilbert–Schmidt product (AutomorphicSpectralTheory §0.9); densities and the coarea formula (DifferentialGeometry Layer 5, GeometricMeasureTheory G2); spinor norms and their local images (OrthogonalSpinGroups Layers 1–3). The Gårding space, the differentiated representation, essential self-adjointness of the Nelson operator `N = 1 − Σ dπ(X_i)²` and its power cores are NoncompactQuantumSymmetry M0; they are not stated again here. The countable almost-orthogonality (Cotlar–Stein) lemma and the Schwartz kernel theorem are PseudodifferentialOperators P5 and P3. Unbounded functional calculus is UnboundedOperators Part A. Admissible (𝔤,K)-modules, infinitesimal characters and the real Langlands classification are AutomorphicFormsOnReductiveGroups §§2.1–2.4; integrability of negative powers of an algebraic height, and the polynomial volume growth of its balls, on the archimedean points of a reductive group are AutomorphicFormsOnReductiveGroups §0.3. The smooth category, Hecke algebras, induction, Jacquet modules, the Bernstein centre, uniform admissibility and the tempered support theorem at p-adic places are SmoothRepresentationsOfLocalGroups SR.0–SR.3a; the unitary dual is SmoothRepresentationsOfLocalGroupsPartII §§0.6, 2.6 and 2.7. Good compact open subgroups are ReductiveGroupsPartII RG2.3–RG2.4. Adelic measures, compactness of anisotropic quotients and strong approximation are AdelicAlgebraicGroups §§2–4. Ratner's measure classification and the ergodic component kernel are GeometryOfNumbersAndQuadraticArithmetic §4.2; the lattice form of the Borel density theorem that §8.6 uses (every unipotent element of a closed linear group lies in the Zariski closure of any lattice of that group) is stated in §8.6, because GeometryOfNumbersAndQuadraticArithmetic §4.2 states Borel density only for algebraic groups generated by unipotent one-parameter subgroups. Compact-quotient automorphic spectra are AutomorphicSpectralTheory §4.7. Trace-class convolution operators and Harish-Chandra's locally integrable distribution characters of finite-length admissible representations of real reductive groups are EndoscopicTransferAndUnitaryTraceComparison §2.3(a)–(b). Local multiplicity one, tempered integrability, local relative forms and the factorization of global periods for unitary pairs are GanGrossPrasadUnitaryGroups §§2.6, 2.7, 3.3 and 4.2. The local relative character of a unitary pair as a distribution on test functions of G × H, `J_{σ_v}(f_v) = ∫_{H_v} tr(σ_v(t) σ_v(f_v)) dt`, is GanGrossPrasadUnitaryGroups §6.2; §4.5 here keeps only its operator form `H_σ`, a functional on the smoothing operators of π whose H-side argument is the conjugate representation σ̄ itself, summed over an orthonormal basis, rather than a test function on H, extended uniformly in (π, σ) to `Ψ^{−N}(π)` so that the operator calculus of Layers 2–3 can act on it.

The following inputs are stated by no roadmap at the pins or heads read here and are requested from their natural owners as supplier gaps (see the contracts): the real and p-adic Plancherel formulas and the Cowling–Haagerup–Howe bound with the Ξ-function (AutomorphicSpectralTheory); the Hilbert–Mumford criterion for linear actions of reductive groups and the principal-bundle structure of free stable affine quotients (AlgebraicModuliForArithmeticGeometry); uniform exponents and minimal K-types of unitary representations (AutomorphicFormsOnReductiveGroups); the kernel expansion, polynomial eigenvalue count and restriction Sobolev bound on compact automorphic quotients (AutomorphicSpectralTheory); the countable strong-convergence form of almost orthogonality (PseudodifferentialOperators); the orthogonal counterparts of local multiplicity one, Ξ-integrability, local period forms and period factorization, the polynomially weighted Ξ-integrability of codimension-one unitary and orthogonal pairs over ℝ and ℂ, and the positivity, strong multiplicity one and semicontinuity of local relative characters (GanGrossPrasadUnitaryGroups, whose Part II owns the orthogonal endpoints); and Kneser's global spinor image together with the anisotropic local spinor images over finite extensions of ℚ_p (OrthogonalSpinGroups).

The normalized unweighted asymptotic formula of the source's §31 (Theorem 31.11, dividing by the family size and passing to central L-values) is QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, Part II; it begins where Layer 9 here ends, from the smoothly weighted formula of §9.5. The analytic GGP period identities themselves, Ichino–Ikeda normalizations and the L-function theory are not planned here.

## Conventions

**Groups and representations.** In Layers 0–1, G is a finite-dimensional unimodular real Lie group, realized as a Lie group modeled on its Lie algebra 𝔤: 𝔤 is the model space E, a finite-dimensional real inner-product space, and exp is Tau Ceti `mulInvariantExp`. A representation is a Mathlib `ContRepresentation ℂ G V` on a complex Hilbert space V that is unitary (`ContRepresentation.IsUnitary`) and strongly continuous, the latter an explicit hypothesis `∀ v, Continuous (fun g ↦ π g v)` since the native structure does not include it. Irreducibility is imposed only from Layer 3 on. A real reductive group is the group of real points of a connected reductive algebraic group over ℝ with its Lie topology; it need not be connected. A complex reductive group is regarded as a real Lie group by restriction of scalars. Nonarchimedean local fields have characteristic zero and every residue characteristic, including 2 and 3, is allowed.

**Imaginary dual and Fourier normalization.** Put `𝔤^∧ = Hom_ℝ(𝔤, iℝ)` and write `xξ = ξ(x) ∈ iℝ`; `𝔤^∧` is identified with the Pontryagin dual of 𝔤 by `ξ ↦ (x ↦ e^{xξ})`. The forward and inverse transforms are `φ^∧(ξ) = ∫ φ(x) e^{xξ} dx` and `a^∨(x) = ∫ a(ξ) e^{−xξ} dξ`, with dx and dξ mutually dual so that they are inverse to each other (NV21 §2.1, p. 25). Using the inner product, write `ξ = 2πi⟨η, ·⟩` with `η ∈ 𝔤`; then dx is the inner-product Lebesgue measure, dξ corresponds to dη, the forward transform is Mathlib's inverse transform `𝓕⁻` and `a^∨ = 𝓕 b` for `b(η) = a(2πi⟨η,·⟩)`, where Mathlib's `𝓕 f (w) = ∫ 𝐞(−⟨v,w⟩) f(v) dv` (`Real.fourier_eq`). Lean statements take symbols in this η-coordinate. The orbit measures of Layer 3 carry the factor `(2π)^{−d}` in `σ^d/(d!(2π)^d)`; at the real measure interface of Layer 5 each real coordinate differential carries Lebesgue measure divided by `√(2π)`. These are separate normalizations of the same convention, each pinned by a Check.

**Cutoffs and densities.** A cutoff is a smooth, compactly supported, even function χ on a small neighbourhood of 0 in 𝔤 with values in [0,1], equal to 1 near 0 (`IsQuantizationCutoff`). Write `dg(exp x) = j(x) dx` near 0 with `j(0) = 1`; the group test function attached to a Lie-algebra density `χ a^∨` is `χ a^∨ / j` in exponential coordinates.

**Semiclassical conventions.** The parameter h ranges over an arbitrary subset of (0,1] accumulating at 0; families of symbols, representations and operators carry no measurability or continuity in h. A uniform estimate bounds each output seminorm by finitely many input seminorms with a constant independent of h and of the representation. A negligible remainder lies in `h^N Ψ^{−N}` for every N, written `h^∞Ψ^{−∞}`. Write `⟨ξ⟩ = (1 + |ξ|²)^{1/2}`. Symbol orders are real; operator orders and Sobolev indices are integers. The letter d always denotes half the maximal real dimension of a coadjoint orbit of the group in question; it keeps this value when a limiting regular multiorbit is empty, and for the product group of §6.1 it equals dim S.

**GGP pairs.** k is a field of characteristic zero and k₁ is k, a quadratic field extension of k, or k × k, with involution ι fixing k. V is a k₁-module with a nondegenerate ι-linear symmetric (Hermitian) form, e ∈ V spans a nondegenerate rank-one k₁-line, `V_H = (k₁e)^⊥`, and `H = Aut(V_H)^0 ⊂ G = Aut(V)^0` (NV21 §§13.1–13.2, pp. 91–92). After extending scalars to an algebraic closure, `V^+` is one standard summand in the unitary case and V itself in the orthogonal case. The multiset ev(x) of `x ∈ 𝔤` is the root multiset of the characteristic polynomial of x on `V^+`, omitting exactly one forced root 0 in odd orthogonal dimension (NV21 §13.4.1, p. 93). For x ∈ End(V), x_H is the restriction to V_H of `E x E`, E the orthogonal projection onto V_H; the trace pairing identifies `x ↦ x_H` with restriction `𝔤^* → 𝔥^*` (NV21 §14.2, p. 97). Over an algebraically closed field every GGP pair is isometric to a standard model: in the orthogonal case `V = k^ι ⊕ k` with the dot product and e the last basis vector, and in the unitary case `V^+ = k^ι ⊕ k e^+` with `H = GL(k^ι)` acting through `h ↦ diag(h, 1)`; in both, x_H is the upper-left block (`ggpBlock`, `Matrix.toBlocks₁₁`).

**Relative characters.** Inner products are linear in the first variable. On a rank-one operator `v₁ ⊗ v̄₂` the relative character uses `⟨Π(s)v₁, v₂⟩⟨u, σ(s)u⟩`, the second factor conjugated relative to the first. For compact H with probability Haar measure the Plancherel mass of σ is dim σ and its relative character is `(dim σ)^{−1}` times the trace on the σ-isotypic part.

**Checks.**

- On ℝ with `Π_t(x) = e^{itx}`, ξ = i·η has `e^{xξ} = e^{ixη}`; at η = t this is the representation itself, so the forward transform pairs Π_t with the point it, and a sign error would pair it with `−it`.
- With `ξ = 2πi⟨η,·⟩` on ℝ, `a^∨(x) = ∫ a(2πiη) e^{−2πiηx} dη = 𝓕 b(x)`. For the shifted Gaussian `b(η) = e^{−π(η−1)²}` this gives `a^∨(x) = e^{−2πix} e^{−πx²}`, which at x = 1/4 is `−i e^{−π/16}`; using `𝓕⁻` gives `+i e^{−π/16}` there, and omitting the factor 2π gives `e^{−ix} e^{−x²/(4π)}`, of the wrong width. (A centred Gaussian would not separate `𝓕` from `𝓕⁻`, since it is even.)
- For a two-dimensional coadjoint orbit `σ/(2π)` is the normalized measure; for SO(3) with its dot-product normalization the orbit through the vector of length r has normalized mass `4πr/(2π) = 2r`, which equals `2l + 1 = dim π` for `r = l + 1/2`, the Rossmann parameter of the spin-l representation.
- One coordinate of the Layer 5 real measure is `dx_Leb/√(2π)`; on a symplectic plane the two factors give `dx dy/(2π)`, agreeing with the Layer 3 orbit normalization.

## Exact supplier contracts

A contract marked `gap:` is mathematics the named supplier must provide; it is not available at the pins, and no target here assumes its conclusion as a hypothesis.

### From Mathlib

- `SchwartzMap` (`Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean`): smooth functions all of whose polynomially weighted iterated Fréchet derivatives are bounded. The symbol classes of §0.4 are new; their intersection over orders is compared with this space.
- The Fourier transform on a finite-dimensional real inner-product space: the `FourierTransform` instance with `Real.fourier_eq` (`𝓕 f w = ∫ 𝐞(−⟨v,w⟩) f v`, `Mathlib/Analysis/Fourier/FourierTransform.lean`) and its Schwartz-space form `SchwartzMap.fourierTransformCLM` (`Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean`), with Fourier inversion on Schwartz space. The negative-sign 2π convention is transported in Conventions.
- `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean`): a monoid homomorphism `G →* (V →L[R] V)`. It asserts continuity of each operator, not of orbit maps; strong continuity is always an explicit hypothesis here.
- `UniversalEnvelopingAlgebra` (`Mathlib/Algebra/Lie/UniversalEnveloping.lean`): the enveloping algebra and its universal property. PBW and symmetrization come from LieHighestWeight.
- `RealRMK.integral_rieszMeasure` (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`): a positive linear functional on compactly supported continuous real functions on a locally compact Hausdorff space is integration against its Riesz measure. Used in §8.3.
- `MeasureTheory.norm_integral_le_integral_norm` (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`): the Bochner norm bound, giving the L¹ estimate of §0.5.
- `MeasureTheory.Measure.IsHaarMeasure` and `MeasureTheory.Measure.IsMulRightInvariant`: unimodularity of G is the existence of a right-invariant Haar measure.
- `MvPolynomial.zeroLocus` (`Mathlib/RingTheory/Nullstellensatz.lean`), `Matrix.charpoly`, `Matrix.fromBlocks`, `Matrix.toBlocks₁₁`, `Matrix.GeneralLinearGroup`, `IsCoprime` and `Polynomial.divByMonic`: the carriers of the matrix models of §§5.2–5.3.
- `KaehlerDifferential` with `KaehlerDifferential.exact_mapBaseChange_map` (`Mathlib/RingTheory/Kaehler/Basic.lean`: for algebras R → A → B, `B ⊗_A Ω_{A/R} → Ω_{B/R} → Ω_{B/A} → 0` is exact), `Algebra.H1Cotangent.exact_δ_mapBaseChange` (`Mathlib/RingTheory/Kaehler/JacobiZariski.lean`: the Jacobi–Zariski sequence `H₁(L_{B/A}) → B ⊗_A Ω_{A/R} → Ω_{B/R}` is exact), `Algebra.FormallySmooth.subsingleton_h1Cotangent` (`Mathlib/RingTheory/Smooth/Basic.lean`: `H₁` of the cotangent complex vanishes for formally smooth algebras, a field of the class `Algebra.FormallySmooth` registered as an instance, so the first map of the cotangent sequence of a smooth morphism is injective) and `exteriorPower` (`Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`): the algebraic cotangent sequence of a smooth morphism and its top exterior powers, used in §5.4. None of these asserts the determinant-line identification of a short exact sequence; that identification is part of §5.4.
- `AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization` (`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`): Zariski's main theorem in the form that a separated quasi-finite morphism is, over an open set, an open immersion into the normalization. Used in §5.3.
- `Matrix.specialOrthogonalGroup` with `Matrix.mem_specialOrthogonalGroup_iff` and `Matrix.mem_orthogonalGroup_iff'` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`): for any commutative ring R, the submonoid of square matrices h with `hᵀh = 1` and det h = 1. It is defined through the trivial star `starRingOfComm`, not through the ring's own star, so over ℂ it is SO_n(ℂ) and not the special unitary group; its docstring records that it is the intended group only when 2 is invertible, which holds in characteristic zero. It is the group H of the orthogonal standard model of §5.2.

### From Tau Ceti

- `mulInvariantExp` (`TauCeti/Geometry/Lie/Exponential/Basic.lean`): the exponential of a finite-dimensional real Lie group on the tangent space at 1, the time-one value of the invariant one-parameter subgroup, together with `lieExp` on left-invariant derivations and the one-parameter subgroup laws. It needs the `C³` regularity supplied by `LieGroup.minSmoothnessThree` (`TauCeti/Geometry/Lie/Basic.lean`), a local instance in Suggested.lean.
- `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`, declared in the root namespace `ContRepresentation`, not under `TauCeti`): every operator of the representation preserves the inner product.
- `CliffordAlgebra.spinorNorm` and `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`): the spinor norm `SO(Q) → K^×/K^{×2}` (valued in `Multiplicative (SquareClassGroup K)`) of a nondegenerate quadratic form Q on a finite-dimensional vector space V over a field K in which 2 is invertible (`[FiniteDimensional K V] [Invertible (2 : K)]`, `hQ : Q.Nondegenerate`), and the identification of the image of Spin with its kernel. Used in §8.7.
- The quadratic-form Witt extension and cancellation theorems (`TauCeti/LinearAlgebra/QuadraticForm/Witt/`), used in §5.3 for real points of orthogonal fibres.
- `CliffordAlgebra.spinorNorm_surjective_of_not_anisotropic` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Isotropic.lean`): over any field with 2 invertible, the spinor norm of a nondegenerate isotropic finite-dimensional quadratic space is surjective on SO. This covers every isotropic local case, all of ℂ in dimension ≥ 2 and every nonarchimedean quadratic space of dimension ≥ 5. Used in §8.7.
- `CliffordAlgebra.spinorNorm_eq_one_of_posDef`, `CliffordAlgebra.spinorNorm_eq_one_of_negDef` and `CliffordAlgebra.spinorNorm_surjective_of_indefinite` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/SpinorNorm.lean`): over ℝ the spinor norm is trivial on SO for definite forms of either sign and surjective onto `ℝ^×/ℝ^{×2}` for indefinite nondegenerate forms. Used in §8.7.

### From TauCetiRoadmap.RepresentationTheory.LieGroups

Layer 0 (the exponential map, local diffeomorphism at 0, one-parameter subgroups), Layer 1 (`Ad`, `ad = d(Ad)`, `Ad(exp X) = exp(ad X)` and the derivative of exp, which gives the Haar density j of §0.1), Layer 3 (the Lie functor and Baker–Campbell–Hausdorff: the local logarithm `bch` of the exponential chart with `exp x exp y = exp(bch(x,y))` near 0 and its first-order term), Layer 5 (universal covers and U(𝔤) as left-invariant differential operators), Layer 7 (complexification and real forms) and Layer 9 (Cartan, Iwasawa and KAK decompositions of real reductive groups). Layer 9 is structure only; the polynomial volume growth of an algebraic norm is AutomorphicFormsOnReductiveGroups §0.3.

### From TauCetiRoadmap.RepresentationTheory.LieHighestWeight

Layer 3 (PBW filtration and basis), Layer 5 (the Casimir and its eigenvalue on L(λ)), Layer 6 (the Weyl dimension formula) and Layer 7 (the symmetrization isomorphism `pbwSymmetrization : S(L) ≃ U(L)`, stated there for every Lie algebra over a field of characteristic zero, and the Harish-Chandra and Chevalley restriction isomorphisms, which that layer states only for finite-dimensional Killing-semisimple L over an algebraically closed field of characteristic zero). The reductive forms used in §§2.1, 5.3 and 5.5, with the centre as additional affine coordinates, are FormalConnectionsOpers F4.3 (invariant quotient and Chevalley restriction) and AutomorphicFormsOnReductiveGroups §2.2 (infinitesimal characters); for 𝔤𝔩₁ the Killing form is zero, the semisimple statement says nothing, and the quotient is the affine line with its coordinate retained, not a point. Symmetrization is linear, not multiplicative; §1.10 relies on exactly this.

### From TauCetiRoadmap.RepresentationTheory.CompactGroups

Layer 0 (normalized Haar probability measure), Layer 5 (Peter–Weyl) and Layer 6 (characters). Used for K-type expansions in §4.1 and compact restriction in §4.5.

### From TauCetiRoadmap.NilpotentOrbits

N1.1 (the adjoint quotient map `χ : 𝔤 → 𝔤//G` and the nilpotent cone `χ^{−1}(0)`; it says nothing about the orbits in a fibre of χ over a nonzero point, which §3.2 obtains from Kostant and Whitney) and N2 (N2.1 Jacobson–Morozov; N2.2 finiteness of the nilpotent orbits; N2.3 the regular nilpotent orbit, open and dense in the nilcone, with centralizer of dimension equal to the rank, compared with the nonzero simple-root coefficients in a Borel nilradical), for complex semisimple Lie algebras. The real-form statements of §8.4 are targets here.

### From TauCetiRoadmap.FormalConnectionsOpers

F4.3 (the finite invariant and slice theorems): for a reductive Lie algebra 𝔤 over a field of characteristic zero, with its central affine factors retained, the Chevalley restriction `S(𝔤^*)^G ≃ S(𝔥^*)^W`, built as the Killing-semisimple restriction isomorphism of LieHighestWeight Layer 7 on the derived algebra tensored with the identity on the centre, on which W acts trivially, together with the agreement of group and Lie-algebra invariants; so `𝔤//G` is an affine space whose coordinates are the central coordinates and the semisimple generators. Further, the principal slice `f + V_can` maps isomorphically onto the adjoint quotient and meets every regular orbit exactly once, the restriction to the slice has invertible differential, and the regular locus is defined by minimal centralizer dimension. By equivariance the differential of the adjoint quotient map is surjective at every regular element, semisimple or not; §3.5 uses exactly this, after complexification. §§2.1, 5.3 and 5.5 use the reductive restriction theorem; the groups there (`GL_n`, `U(V)` over an algebraic closure) have nontrivial centres, so the Killing-semisimple statement alone would not cover them.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§2.3(a)–(b): for a real reductive group in the sense of AutomorphicSpectralTheory §0.48 and a finite-length admissible representation π (an admissible (𝔤,K)-module with its Casselman–Wallach globalization), `π(f)` is trace class for smooth compactly supported f, and `tr π(f) = ∫ Θ_π f` for a conjugation-invariant locally integrable function Θ_π that is real analytic on the strongly regular set. An irreducible tempered unitary representation qualifies through its admissible Harish-Chandra module (AutomorphicFormsOnReductiveGroups §2.2), and its Hilbert-space and smooth traces agree. Used in §3.3.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

What AlgebraicModuliForArithmeticGeometry must provide (gap:hilbert-mumford-linear): for a reductive group H over an algebraically closed field of characteristic zero acting linearly on a finite-dimensional vector space M, a point x ∈ M fails to be H-stable (its stabilizer is infinite or its orbit is not closed) if and only if some nontrivial cocharacter γ of H has only nonnegative weights on x, that is, `lim_{t→0} γ(t)·x` exists.

What AlgebraicModuliForArithmeticGeometry must provide (gap:free-stable-quotient-bundle): for a reductive group H over an algebraically closed field of characteristic zero acting on an affine variety M, the invariant ring is finitely generated, the affine quotient `M → M//H` is surjective and universal for H-invariant morphisms, the H-stable locus `M^s` and its image are open, and when every point of `M^s` has trivial stabilizer the map `M^s → M^s//H` is a principal H-bundle, locally trivial in the étale topology.

### From TauCetiRoadmap.SymplecticGeometry

HamiltonianReduction R1 (equivariant moment maps), R2 (coadjoint orbits of any finite-dimensional Lie group with the Kirillov–Kostant–Souriau form `ω_ν(ξ_O, η_O) = ν([ξ,η])`, its invariance, closedness and nondegeneracy) and R3 (regular symplectic reduction and the reduced form); ConvexityToric T4 (the Liouville measure `ω^n/n!`). Under `ξ = iν` the source's form `σ_ξ(ad*_x ξ, ad*_y ξ) = [x,y]ξ / i` is R2's `ν([x,y])`.

### From TauCetiRoadmap.OperatorTheory.OperatorIdeals

Parts B and C: Hilbert–Schmidt energy and its basis independence (`hilbertSchmidtEnergy`, `hilbertSchmidtEnergy_indep`), the nuclear norm, the Schatten families (`schattenFamily`) and the trace-class and Hilbert–Schmidt endpoints. §3.8 refines these by commutators; it builds no second singular-value or trace construction.

### From TauCetiRoadmap.VonNeumannAlgebras

V4.Core: the trace `Tr(x) = Σ_i ⟨b_i, x b_i⟩` on the trace-class operators of a Hilbert space, on the trace-class and Hilbert–Schmidt carriers of OperatorIdeals; its independence of the orthonormal basis, its cyclicity `Tr(xh) = Tr(hx)` for trace-class h and bounded x and for pairs of Hilbert–Schmidt operators, the norm identity `‖φ_h‖ = ‖h‖₁` for `φ_h(x) = Tr(xh)` and the pairing of bounded operators with the trace class. This is the Hilbert-space trace of §§3.7–3.9 and 8.1 and the one that AutomorphicSpectralTheory §0.9 itself consumes; the trace-norm bound `‖BC‖₁ ≤ ‖B‖_HS ‖C‖_HS` of a product of two Hilbert–Schmidt operators is cited to AutomorphicSpectralTheory §0.9, which states it.

### From TauCetiRoadmap.DifferentialGeometry and TauCetiRoadmap.GeometricMeasureTheory

DifferentialGeometry Layer 5 (integration of top forms, 5.2, and densities, 5.5) and GeometricMeasureTheory G2 (the coarea formula for Lipschitz maps between Euclidean spaces). §§5.7 and 5.9 apply them in charts to smooth submersions.

### From TauCetiRoadmap.OrthogonalSpinGroups

Layer 1 (1D the spinor norm; 1E the image of Spin is the spinor kernel), Layer 2 (2F the local spinor-image table over ℚ_p, including the binary anisotropic row with image the norm subgroup of index 2, and its real rows: trivial image of SO for definite forms of either sign and all square classes for indefinite ones; 2G compactness of Spin at the real place; 2H localization) and Layer 3 (3C–3F local and adelic spinor norms).

What OrthogonalSpinGroups must provide (gap:local-spinor-images): for an anisotropic nondegenerate quadratic space V over a finite extension F_v of ℚ_p (so dim V ≤ 4), the image `θ_v(SO(V)(F_v)) ⊆ F_v^×/F_v^{×2}` of the spinor norm: the image of the norm group of `F_v(√(−disc V))`, of index 2, when dim V = 2, and all square classes when dim V is 3 or 4.

The isotropic cases over every field, hence every nonarchimedean space of dimension at least 5 and every complex space of dimension at least 2, and the real place are the pinned Tau Ceti theorems `CliffordAlgebra.spinorNorm_surjective_of_not_anisotropic`, `CliffordAlgebra.spinorNorm_eq_one_of_posDef`, `CliffordAlgebra.spinorNorm_eq_one_of_negDef` and `CliffordAlgebra.spinorNorm_surjective_of_indefinite` (From Tau Ceti); they are not requested.

What OrthogonalSpinGroups must provide (gap:global-spinor-image): for a nondegenerate quadratic space V of dimension at least 3 over a number field F, Kneser's theorem that `θ(SO(V)(F))` consists of the classes of `c ∈ F^×` with `c ∈ θ_v(SO(V)(F_v))` for every place v.

### From TauCetiRoadmap.NoncompactQuantumSymmetry

M0, item 1: for a strongly continuous unitary representation of a finite-dimensional Lie group, the Gårding space, the smooth-vector submodule, the derived Lie and enveloping-algebra actions with `X* = −X` on real elements, the positive Nelson operator `N = 1 − Σ dπ(X_i)²` with its essential self-adjointness on the Gårding space, graph cores for its powers, the enveloping-operator Sobolev bounds and the representation-vector elliptic regularity adapters. The Laplacian Δ of §0.2 is this N for the fixed basis. M0, item 2 (Harish-Chandra admissibility with finite K-multiplicities for connected semisimple groups with finite centre) is consistent with, and not needed beyond, AutomorphicFormsOnReductiveGroups §2.2.

### From TauCetiRoadmap.SmoothBanachRepresentations

Layer 2, §2.1 (smooth vectors defined by smooth orbit maps, with the word-seminorm Fréchet topology), Layer 3, §§3.1 and 3.4 (the differentiated action and integration by parts) and Layer 6, §6.1 (Dixmier–Malliavin: smooth vectors are the span of `π(f)v`). Used in §0.6 for integrated test functions.

### From TauCetiRoadmap.UnboundedOperators

Part A (UO-A01–A03: the Borel functional calculus of an unbounded self-adjoint operator with its domains, giving the powers `Δ^{s/2}`, s ∈ ℤ, of §0.2) and Part E (UO-E01: graph cores).

### From TauCetiRoadmap.PseudodifferentialOperators

P3 (the Schwartz kernel theorem for continuous maps `C_c^∞(N;E) → D′(M;F)`, used in §8.3 on `𝔤^∧ × X`) and P5 (Calderón–Vaillancourt with its almost-orthogonality lemma).

What PseudodifferentialOperators must provide (gap:cotlar-stein-strong): for a countable family of bounded operators `T_j : V₁ → V₂` between Hilbert spaces with `sup_j Σ_k ‖T_j* T_k‖^{1/2} ≤ C` and `sup_j Σ_k ‖T_j T_k*‖^{1/2} ≤ C`, the finite partial sums converge in the strong operator topology, in any enumeration, to an operator of norm at most C; norm convergence is not part of the conclusion.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§2.1 (compact-finite vectors, admissible and Harish-Chandra modules), §2.2 (infinitesimal characters: the centre acts through the Harish-Chandra isomorphism with ρ-shift, and irreducible unitary representations have admissible Harish-Chandra modules with `dim Hom_K(τ, π) ≤ dim τ` on connected linear groups, proved in §2.3), §2.4 (temperedness, discrete series and the Langlands classification) and §2.7 (smooth Fréchet globalizations and Sobolev seminorms); §0.3 (`integrable_height_rpow_neg`: for the archimedean points `G∞` of a connected reductive group over a number field, with a Haar measure, there is `r₀ ≥ 0` with `∫_{G∞} H(g)^{−r} dg < ∞` for every `r > r₀`, hence `vol{H ≤ T} ≤ C T^{r₀+1}` for T ≥ 1, where H is the dual-augmented algebraic height of AdelicAlgebraicGroups §3.5, polynomially equivalent to the algebraic norm of any faithful representation defined over the number field by the local polynomial comparison of AdelicAlgebraicGroups §3.5).

What AutomorphicFormsOnReductiveGroups must provide (gap:unitary-exponent-bound): for a real reductive group G, a bound, depending only on G, on the real parts of the Langlands exponents of all irreducible unitary representations.

What AutomorphicFormsOnReductiveGroups must provide (gap:vogan-minimal-ktype): for a real reductive group G with maximal compact K, Vogan's minimal K-type estimate: every irreducible unitary π has a K-type τ with `|τ|² ≤ C(1 + |λ_π|²)` for the Casimir norm, C depending only on G.

### From TauCetiRoadmap.AutomorphicSpectralTheory

§0.9 (only the trace-norm bound `‖BC‖₁ ≤ ‖B‖_HS ‖C‖_HS` for Hilbert–Schmidt B and C, which it states; the trace itself, its basis independence and its cyclicity are consumed from their owner, VonNeumannAlgebras V4.Core), §0.13 (the nuclear LF kernel theorem), §0.14 (vector-valued Schwartz spaces), §4.5 (finite multiplicity of the discrete spectrum) and §4.7 (for a cocompact lattice, `L²(Γ\G)` is a Hilbert direct sum of irreducibles with finite multiplicities and smooth compactly supported convolution operators are trace class with smooth kernels).

What AutomorphicSpectralTheory must provide (gap:local-plancherel): for a reductive group over ℝ, ℂ or a nonarchimedean local field of characteristic zero with a fixed Haar measure, the Plancherel measure μ on the tempered dual with `f(1) = ∫ tr π(f) dμ(π)` for every smooth compactly supported f.

What AutomorphicSpectralTheory must provide (gap:padic-plancherel-density): for a reductive group over a nonarchimedean local field of characteristic zero with a fixed Haar measure, on each component of the tempered dual induced from a square-integrable datum, the Plancherel measure of gap:local-plancherel is a bounded continuous density with respect to Haar measure on the compact torus of unitary unramified twists, divided by the finite stabilizer.

What AutomorphicSpectralTheory must provide (gap:tempered-xi-bounds): for a reductive group over ℝ, ℂ or a nonarchimedean local field of characteristic zero, with a maximal compact subgroup K (special maximal compact in the nonarchimedean case), Harish-Chandra's function Ξ and the Cowling–Haagerup–Howe bound `|⟨π(g)u, v⟩| ≤ Ξ(g) (dim K·u)^{1/2} (dim K·v)^{1/2} ‖u‖ ‖v‖` for K-finite vectors u, v of every tempered irreducible unitary π.

What AutomorphicSpectralTheory must provide (gap:kernel-spectral-expansion): for the compact quotients of §4.7 at a fixed central quotient and fixed finite level, every smooth two-variable kernel on the quotient has an absolutely convergent spectral expansion over the irreducible constituents of the discrete spectrum, convergent with all derivatives.

What AutomorphicSpectralTheory must provide (gap:polynomial-eigenvalue-count): for the compact quotients of §4.7 at a fixed central quotient and fixed finite level, `#{π : |λ_π| ≤ x} ≪ (1 + x)^A` for the irreducible constituents π counted with multiplicity, A depending on the group and the level.

What AutomorphicSpectralTheory must provide (gap:orbit-restriction-sobolev): for the compact quotients of §4.7 and a closed subgroup H whose orbit `[H]` in the quotient is closed, the restriction of smooth automorphic functions to `[H]` is bounded from a fixed Sobolev norm on the quotient to `L²([H])`, compatibly with differentiation along H.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.0.3–SR.0.4 (compact open invariants, admissibility, smooth duals), SR.1.1 (Hecke algebras and the idempotent `e_U = vol(U)^{−1} 1_U` with `e_U V = V^U`), SR.1.4 (Iwahori decompositions), SR.2.2 (normalized parabolic induction and Jacquet modules), SR.2.3 (Jacquet's lemma on invariants and Casselman's canonical lifting for subgroups with Iwahori decomposition), SR.3.1 (unramified characters, cuspidal support, finite length), SR.3.2 (the Bernstein decomposition, the centre `Z_s ≅ ℂ[D_s]^{W_s}` and finiteness of the inertial classes with nonzero K-invariants), SR.3.3 (square-integrable and tempered representations and the Harish-Chandra tempered support theorem: every irreducible tempered representation is a direct summand of normalized induction from a square-integrable representation of a Levi, unique up to conjugacy) and SR.3a.2 (uniform admissibility `dim V^K ≤ c(G,K)`).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

§0.6 (the unitary dual), §2.6 (irreducible unitary representations are admissible) and §2.7 (the unitary dual as the set of unitarizable irreducible smooth representations). The allowability clauses of §7.6 quantify over this whole unitary dual.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.3.6 (Moy–Prasad subgroups `G_{x,r}`, r > 0, normal in `G_{x,0}`, pro-p and cofinal), RG2.4.2 (their Iwahori factorization with respect to every parabolic containing the minimal Levi) and RG2.4.4 (the Cartan decomposition). For a special vertex x these give the good compact open subgroups of §7.4: normal in a special maximal compact and with Iwahori decompositions for every standard parabolic, forming a neighbourhood basis of 1.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§2.2 (invariant quotient measures), §2.4 (Tamagawa measures and Tamagawa numbers), §3.4 (anisotropic groups have compact quotients; finiteness of class numbers and the component decomposition of a level quotient), §3.5 (the dual-augmented algebraic height and the local polynomial comparison: for closed immersions σ, τ of an affine group over a number field, `‖τ(g)‖_v ≤ c_v ‖σ(g)‖_v^N` for the dual-augmented local norms at every place) and §4.2 (strong approximation for simply connected semisimple groups with every simple factor noncompact at the chosen places).

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§4.2: Ratner's measure classification (item 4.2.5, `ratner_measure_classification`: for a connected linear semisimple real group, a lattice Γ and a connected subgroup generated by one-parameter unipotent subgroups, every ergodic invariant probability measure on G/Γ is the homogeneous measure of a closed finite-volume orbit of a subgroup containing it) and the ergodic component kernel (`ActionErgodicKernel` with `exists_actionErgodicKernel`: for a locally compact second-countable group U acting continuously on a standard Borel probability space with a U-invariant probability measure μ, a measurable probability kernel whose values are U-invariant and U-ergodic probability measures almost everywhere, whose integral is μ, and with `κ(x, A) = 1_A(x)` for almost every x, for every μ-essentially U-invariant measurable set A). Its Borel density statement, `borel_density_unipotent_generated` for a connected real algebraic group generated by unipotent one-parameter subgroups, is narrower than the lattice form that §8.6 needs, which is stated there.

### From TauCetiRoadmap.GanGrossPrasadUnitaryGroups

§2.6 (local multiplicity one for unitary pairs, for all irreducible smooth representations, tempered or not), §2.7 (absolute convergence of tempered matrix coefficients over U(W) and `∫ Ξ_{U(V)} Ξ_{U(W)} (1 + log‖t‖)^d < ∞`), §3.3 (regularized tempered Bessel forms for nonsplit pairs, E/F a quadratic field extension; in codimension one the local period `∫_H ⟨π(h)v,v′⟩⟨σ(h)w,w′⟩ dh`, nonzero exactly when `Hom_H(π ⊗ σ̄, ℂ) ≠ 0`; the split model is excluded there), §5.1a (the split adjacent Whittaker identity: for `E = F × F`, so that `(G, H) = (GL_{n+1}(F), GL_n(F))` with F nonarchimedean, ℝ or ℂ and tempered irreducible unitary π, σ, the H-integral of matrix coefficients equals `λ(W) conj(λ(W′))` for the Rankin–Selberg Whittaker functional λ, is nonzero, and takes a positive value on some smooth tensor), §5.2 (the normalized local period form `α_v` and its nonvanishing criterion, nonzero exactly when the local Bessel model is nonzero, in the nonsplit case through §3.3 and in the split case through §5.1a, up to the nonzero normalizing factor `C_v`), and §4.2 (factorization of global periods through local forms, using local multiplicity one). The local period form at a place is therefore §3.3 when E is a field there and §5.1a when E splits there; when `V_H = 0` the group H is trivial and the form is the Hilbert pairing times the Haar mass of the trivial group, with no supplier. §6.2 (the local relative character `J_{σ_v}(f_v) = ∫_{H_v} tr(σ_v(t) σ_v(f_v)) dt` of a unitary pair on test functions of G × H, absolutely convergent, basis independent and continuous) is the distribution form of the relative character; §4.5 and §6.1 record how the operator form used here relates to it.

What GanGrossPrasadUnitaryGroups must provide (gap:unitary-xi-polynomial-tail): over ℝ or ℂ, for a codimension-one unitary pair H = U(W) ⊂ G = U(V) (split or nonsplit), there is η > 0 depending only on the pair with `∫_H Ξ_G(h) Ξ_H(h) |h|^η dh < ∞`, `|h| = max(‖R(h)‖, ‖R(h^{−1})‖)` the algebraic norm of §5.8.

This is the polynomially weighted form of §2.7; equivalently `∫_{|h| > X} Ξ_G Ξ_H dh ≪ X^{−η}` for X ≥ 1. The log-weighted estimate of §2.7 does not imply it, since it bounds this tail only by `(1 + log X)^{−d}`.

The orthogonal counterparts below are assigned by the scope of GanGrossPrasadUnitaryGroups to GanGrossPrasadUnitaryGroups, Part II; each concerns a codimension-one special orthogonal pair `H = SO(V_H) ⊂ G = SO(V)`.

What GanGrossPrasadUnitaryGroups must provide (gap:orthogonal-multiplicity-one): the counterpart of §2.6: over a local field of characteristic zero, for irreducible smooth representations π of G and σ of H (Casselman–Wallach at archimedean places), `dim Hom_H(π ⊗ σ̄, ℂ) ≤ 1`.

What GanGrossPrasadUnitaryGroups must provide (gap:orthogonal-xi-integrability): the counterpart of §2.7: over a local field of characteristic zero, `∫_H Ξ_G(h) Ξ_H(h) (1 + log‖h‖)^d dh < ∞` for every d ≥ 0, so that `∫_H ⟨π(h)v, v′⟩⟨σ(h)w, w′⟩ dh` converges absolutely for smooth vectors of tempered irreducible unitary π of G and σ of H.

What GanGrossPrasadUnitaryGroups must provide (gap:orthogonal-xi-polynomial-tail): the counterpart of gap:unitary-xi-polynomial-tail: over ℝ or ℂ, for a codimension-one special orthogonal pair H ⊂ G, there is η > 0 depending only on the pair with `∫_H Ξ_G(h) Ξ_H(h) |h|^η dh < ∞`, `|h|` the algebraic norm of §5.8.

What GanGrossPrasadUnitaryGroups must provide (gap:orthogonal-local-period-form): the counterpart of §3.3 in codimension one: over a local field of characteristic zero, for tempered irreducible unitary π of G and σ of H, the absolutely convergent integral `∫_H ⟨π(h)v, v′⟩⟨w, σ(h)w′⟩ dh` defines a continuous Hermitian form on `π^∞ ⊗ σ̄^∞`, invariant under H in each variable, which is nonzero exactly when `Hom_H(π ⊗ σ̄, ℂ) ≠ 0`.

What GanGrossPrasadUnitaryGroups must provide (gap:orthogonal-period-factorization): the counterpart of §4.2: over a number field, for irreducible cuspidal automorphic representations Π of G and Σ of H with restricted tensor factorizations and nonzero period `∫_{[H]} φ ψ̄`, the period factors as a nonzero constant times a product over places of local H-invariant functionals, through multiplicity one at every place.

What GanGrossPrasadUnitaryGroups must provide (gap:induced-multiplicity-one): for codimension-one unitary and orthogonal pairs (G, H) over a p-adic field, a tempered irreducible π of G and a square-integrable representation τ of a Levi subgroup M = M_P of H, the full normalized induction `I = Ind_P^H τ` satisfies `dim Hom_H(π ⊗ Ī, ℂ) ≤ 1`, so each fibre of the inducing-datum map contains at most one π-distinguished tempered representation.

What GanGrossPrasadUnitaryGroups must provide (gap:distinction-upper-semicontinuity): for codimension-one unitary and orthogonal pairs over a p-adic field and fixed tempered π of G, `σ ↦ dim Hom_H(π ⊗ σ̄, ℂ)` is upper semicontinuous on each family of tempered representations of H normally induced from unitary unramified twists of one square-integrable datum.

What GanGrossPrasadUnitaryGroups must provide (gap:relative-character-positivity): for codimension-one unitary and orthogonal pairs over a p-adic field and tempered irreducible unitary π of G and σ of H, the local relative character `H_σ(v₁ ⊗ v̄₂) = Σ_{u ∈ B(σ)} ∫_H ⟨π(s)v₁, v₂⟩⟨u, σ(s)u⟩ ds` (B(σ) an orthonormal basis of σ consisting of vectors fixed by compact open subgroups, inner products linear in the first variable), extended linearly to finite-rank smooth operators, is nonnegative on positive operators, and nonzero on some rank-one positive operator whenever σ is π-distinguished.

## How to read the build

Layers 0–1 are the general calculus: for any unimodular Lie group and any strongly continuous unitary representation they define Sobolev scales, operator and symbol classes and the quantization map, and prove the star-product expansion, the uniform order-zero bound and the rescaled composition calculus, all uniform in the representation. Layer 2 specializes to real reductive groups and localizes eigenfunctionals at infinitesimal characters. Layer 3 adds coadjoint multiorbits and Rossmann's formula and proves the uniform trace asymptotics and trace-ideal bounds for tempered representations. Layer 4 makes the Plancherel formula uniform and constructs local relative characters for GGP pairs. Layer 5 is the algebraic and measure-theoretic geometry of stable coadjoint fibres of GGP pairs; it uses Layers 0–3 only for normalizations and orbital measures. Layer 6 compares relative characters with stable fibre integrals. Layer 7 constructs positive test operators and Hecke functions that pick out families of representations of the smaller group. Layer 8 passes to automorphic quotients: limit states, their disintegration and their equidistribution. Layer 9 combines Layers 7 and 8 with a truncated period identity into the weighted asymptotic formula. Each target's *Needs* line lists exactly the inputs of its statement and proof route; the layer numbering is not itself a dependency.

## Layer 0: Fourier conventions, Sobolev scales and the quantization map

The basic objects: the imaginary dual and its Fourier normalization, the Sobolev scale of a unitary representation built from the Nelson operator, the commutator operator classes Ψ^m, the symbol classes S^m_δ with a semiclassical parameter, and the quantization map Op. Every estimate here is uniform in the representation.

### 0.1 The imaginary dual, Fourier normalization and the exponential density

For a finite-dimensional real Lie algebra 𝔤 with a fixed inner product, define the imaginary dual `𝔤^∧ = Hom_ℝ(𝔤, iℝ)` with the pairing `xξ = ξ(x)`, the transforms `φ^∧(ξ) = ∫ φ(x) e^{xξ} dx` and `a^∨(x) = ∫ a(ξ) e^{−xξ} dξ` with Fourier-dual measures, and the coordinate `ξ = 2πi⟨η,·⟩` in which dξ is Lebesgue measure dη and `a^∨ = 𝓕 b` for `b(η) = a(2πi⟨η,·⟩)`. Define the exponential density j by `dg(exp x) = j(x) dx` on a neighbourhood of 0 where exp is a diffeomorphism, normalized by `j(0) = 1`, and attach to a Lie-algebra density `χ a^∨` the group test function `χ a^∨ / j` in exponential coordinates (NV21 §§2.1–2.2, p. 25; §1.14.2–1.14.6, pp. 19–22; §4.1, p. 31). The Lie-algebra Haar measure dx and the group Haar measure dg are compatible exactly through j.

- The pairing `x ↦ xξ` is real bilinear with values in iℝ, and `ξ ↦ (x ↦ e^{xξ})` identifies 𝔤^∧ with the Pontryagin dual.
- The two transforms are mutually inverse continuous linear maps between the Schwartz spaces of 𝔤 and 𝔤^∧.
- In the coordinate η, the forward transform is Mathlib's inverse transform `𝓕⁻` and the inverse transform is `𝓕`, both with Lebesgue measure.
- In exponential coordinates `j(x) = |det((1 − e^{−ad x})/ad x)|` for left Haar measure; for unimodular G it is even, `j(−x) = j(x)`.

*Needs:* Mathlib `SchwartzMap`, `SchwartzMap.fourierTransformCLM`, `Real.fourier_eq`; LieGroups Layer 0 (exponential map) and Layer 1 (derivative of exp, for j).

**Checks.**

- On ℝ, ξ = 2πiη gives `e^{xξ} = e^{2πixη}`: this is the positive-sign character, whereas Mathlib's forward kernel is `e^{−2πixη}`; the forward transform of the indicator of [0,1] at η = 1 is `∫₀¹ e^{2πix} dx = 0`, and at η = 1/2 it is `2i/π`, while Mathlib's forward transform gives `−2i/π` there.
- For 𝔤 = 0 both measures are the unit point mass and both transforms are the identity on ℂ.
- On SU(2) with basis `−iσ_a/2`, `ad x` has eigenvalues `0, ±i|x|`, so `j(x) = (sin(|x|/2)/(|x|/2))²`: even, equal to 1 at 0 and nonconstant. Taking the group test function `f(exp x) = χ(x)a^∨(x)` without dividing by j gives `π(f) = ∫ χ a^∨ j π(exp x) dx`, which differs from `Op(a, χ)`.
- On the ax+b group, which is not unimodular, `j(x) = |(1 − e^{−x₁})/x₁|` in the coordinate x₁ of the diagonal direction and `j(−x) = e^{x₁} j(x)`: evenness of j is exactly unimodularity.
- On any abelian group j ≡ 1 and the group test function is `χ a^∨` itself.

### 0.2 Representation Sobolev scales

For a strongly continuous unitary representation π of G and a fixed basis B of 𝔤, let Δ be the closure of `1 − Σ_{x∈B} dπ(x)²` on smooth vectors, the self-adjoint Nelson operator with `Δ ≥ 1` and `‖Δ^{−1}‖ ≤ 1` (NV21 §3.1, p. 28). For every integer s define `π^s` as the Hilbert completion of the smooth vectors `π^∞` in the norm `‖v‖_s = ‖Δ^{s/2} v‖`, with the inclusions `π^t → π^s` for t ≥ s; put `π^{∞} = ⋂ π^s` and `π^{−∞} = ⋃ π^s` with the projective and inductive limit topologies, and identify `π^{−s}` with the continuous anti-dual of `π^s` through the Hilbert pairing (NV21 §§3.1–3.2, pp. 28–29; §8.5, pp. 59–61).

- For t ≥ s the inclusions `π^t → π^s` are continuous, injective and compose.
- The Hilbert pairing identifies `π^{−s}` with the continuous anti-dual of `π^s`.
- An enveloping word of length r acts continuously `π^s → π^{s−r}` for every s, with a norm bounded in terms of B alone, not of π; equivalently `c_s‖v‖²_s ≤ Σ_{r ≤ s} Σ_{x₁,…,x_r ∈ B} ‖x₁⋯x_r v‖² ≤ C_s‖v‖²_s` for s ≥ 0 (NV21 (3.1), p. 29).
- `⋂_s π^s` is exactly the space of smooth vectors with its Fréchet topology; equivalently, smooth vectors are the vectors in the domain of every power of Δ (NV21 §3.1(ii), p. 28).
- For each integer r, `Δ^r` is an isomorphism `π^s → π^{s−2r}`.

*Needs:* NoncompactQuantumSymmetry M0, item 1 (Nelson operator, power cores, enveloping Sobolev bounds and elliptic regularity adapters); UnboundedOperators UO-A01 (powers of Δ); SmoothBanachRepresentations Layer 2, §2.1 (smooth vectors and their topology).

**Checks.**

- For the trivial representation Δ = 1 and every `‖·‖_s` is the Hilbert norm.
- For the character `Π_t(x) = e^{itx}` of ℝ with basis {∂_x}, `dπ(∂_x) = it`, so Δ acts by `1 + t²` and `‖v‖_s = (1 + t²)^{s/2}‖v‖`; the sign convention `1 + Σ dπ(x)²` would give `1 − t²`, which is not positive.
- For the regular representation of ℝ on L², `π^{−1}` contains the point mass δ₀ (its Fourier transform is in `L²(⟨t⟩^{−2} dt)`), which lies in no `π^s` with s ≥ 0; negative spaces cannot be defined as subspaces of the Hilbert space.
- For the regular representation of ℝ, `π^1` is the Sobolev space `H¹(ℝ)` with norm `(∫ (1 + t²)|f̂|²)^{1/2}` in angular frequency; a basis vector scaled by 2 changes Δ to `1 − 4∂²` and the norm by a bounded factor only.

### 0.3 Commutator operator classes

An operator on π is a linear map `π^∞ → π^{−∞}`. For x ∈ 𝔤 let `θ_x(T) = [dπ(x), T]` and extend to `θ_u` for u ∈ U(𝔤_ℂ). For an integer m, T has order ≤ m, written `T ∈ Ψ^m`, if every `θ_u(T)` extends to a bounded map `π^s → π^{s−m}` for every integer s; the seminorms `‖θ_u(T)‖_{π^s → π^{s−m}}` define its topology. Put `Ψ^{−∞} = ⋂ Ψ^m` (smoothing operators) and `Ψ^∞ = ⋃ Ψ^m` (NV21 Definition 3.1, §3.3, pp. 29–30). For an h-dependent representation and 0 ≤ δ < 1, a family T lies in `Ψ^m_δ` if `h^{δ r}‖θ_{x₁⋯x_r}(T)‖_{π^s → π^{s−m}}` is bounded uniformly in h for every word and every s; `h^N Ψ^m_δ` is defined by multiplication, and `h^∞ Ψ^{−∞}` is the class of families lying in `h^N Ψ^{−N}` for every N (NV21 Definition 5.2 and Lemma 5.3, pp. 37–39).

- `Ψ^m ⊆ Ψ^n` continuously for m ≤ n.
- Two operators agreeing on smooth vectors have the same Sobolev extensions.
- `θ_x` preserves `Ψ^m`, and on families sends `Ψ^m_δ` to `h^{−δ}Ψ^m_δ`.
- A continuous seminorm on unscaled `Ψ^m` is bounded on a bounded family in `Ψ^m_δ` by `h^{−δ r}`, r the length of the longest commutator word it uses (so uniformly in h when δ = 0).
- `h^∞Ψ^{−∞}` does not depend on δ.
- For N ≥ 0, a linear functional on `Ψ^{−N}` that is h-uniformly continuous is, for some N′ ≥ N depending only on its finitely many controlling seminorms, h-uniformly continuous on `Ψ^{−N′}_δ`: the extra negative order absorbs the commutators.

*Needs:* §0.2; Mathlib `UniversalEnvelopingAlgebra`.

**Checks.**

- The identity has order 0 and all its commutators vanish.
- On the regular representation of ℝ, dπ(∂_x) is differentiation, of order 1 and not of order 0; its Fourier multiplier is it.
- On the regular representation of ℝ, multiplication by `e^{ix²}` is unitary but does not map `H¹` to itself boundedly in a way commuting to order 0 with ∂_x: `[∂_x, M] = M · 2ix` is unbounded on L², so a bounded operator need not lie in `Ψ^0`.
- The family `h^{−1}·1` lies in `h^{−1}Ψ^0_δ` and not in `Ψ^0_δ` for any δ, while the h-independent operator `dπ(x)` lies in `Ψ^1_δ` for every δ; on the Heisenberg group `θ_X(dπ(Y)) = dπ(Z)`, so commutators of first-order operators are again first order.

### 0.4 Uniform symbol classes

For real m, `S^m` is the space of smooth `a : 𝔤^∧ → ℂ` with `sup_ξ ⟨ξ⟩^{−m+|α|}|∂^α a(ξ)| < ∞` for every multi-index α, with these seminorms; `S^{−∞} = ⋂ S^m` is the Schwartz space. For 0 ≤ δ < 1 an h-dependent family lies in `S^m_δ` if `h^{δ|α|}⟨ξ⟩^{−m+|α|}|∂^α a(ξ)|` is bounded uniformly in h and ξ for every α; `h^η S^m_δ` is defined by multiplication. The rescaled symbol is `a_h(ξ) = a(hξ)` (NV21 Definitions 4.1 and 4.3, §§4.3–4.5, pp. 33–35; the decay exponent subtracts |α| from the order, correcting a misprint after Definition 4.3, p. 34).

- `S^m_δ ⊆ S^n_ε` for m ≤ n and δ ≤ ε.
- A derivative of degree r maps `S^m_δ` to `h^{−δ r} S^{m−r}_δ`.
- Pointwise multiplication maps `S^m × S^n` to `S^{m+n}` continuously.
- `⋂_m S^m` equals Mathlib's Schwartz space with the same topology.
- Rescaling `a ↦ a_h` with h ∈ (0,1] maps `S^0` into `S^0` with no larger seminorms, because `h⟨hξ⟩^{−1} ≤ ⟨ξ⟩^{−1}`.

*Needs:* Mathlib `SchwartzMap`.

**Checks.**

- The constant 1 lies in `S^0` and not in `S^{−1}` when 𝔤 ≠ 0.
- `1 + |ξ|²` lies in `S^2`; its first derivatives are linear and lie in `S^1`.
- The moving bump `φ((ξ − ω)/h^δ)` lies in `S^0_δ` with derivative losses exactly `h^{−δ r}` and does not lie in `S^0_0` uniformly when δ > 0.
- For 𝔤 = 0 a symbol is a complex number and every condition of positive degree is empty.

### 0.5 The quantization map `quantize`

Fix a symmetric neighbourhood 𝒢 of 0 in 𝔤 on which exp is a diffeomorphism onto its image, small enough for the composition law of §1.1. A cutoff in 𝒢 is a function χ satisfying `IsQuantizationCutoff 𝒢 χ`: smooth, compactly supported, supported in 𝒢, even, valued in [0,1] and equal to 1 near 0 (NV21 §2.2, p. 25).

- For every neighbourhood 𝒢 of 0 there is a cutoff in 𝒢, a smooth radial bump equal to 1 near 0.
- A cutoff in 𝒢 is a cutoff in every 𝒢′ ⊇ 𝒢.
- The product of two cutoffs in 𝒢 is a cutoff in 𝒢, and so is every convex combination of two cutoffs in 𝒢.

**Checks.**

- For 𝔤 ≠ 0 the constant function 1 is not a cutoff, since it does not have compact support.
- A smooth compactly supported function with `χ(0) = 1/2` is not a cutoff, and `Op(1, χ)` would then be half the identity.
- A bump `χ(x) = ψ(x − x₀)` with x₀ ≠ 0 small and ψ = 1 near 0 equals 1 near 0 only if `|x₀|` is inside the plateau, and is not even; evenness is what gives the adjoint formula below.
- For 𝔤 = 0 the only cutoff is the constant 1, provided 0 ∈ 𝒢.

For a Schwartz symbol a define `Op(a, χ : π) v = ∫_𝔤 χ(x) a^∨(x) π(exp x) v dx` as a Bochner integral, and `Op_h(a, χ) = Op(a_h, χ) = ∫ χ(hx) a^∨(x) π(exp(hx)) dx` (NV21 (2.1)–(2.2), pp. 25–26). In the coordinate η this is `quantize π χ b` with `b(η) = a(2πi⟨η,·⟩)`, and Op_h is `quantize π χ (fun η ↦ b (h • η))`. The extension to finite-order symbols, as maps `π^∞ → π^{−∞}` defined distributionally against smooth matrix coefficients, is §1.12.

- For fixed π and χ, `quantize π χ` is complex linear in the symbol.
- `‖Op(a, χ)‖ ≤ ‖χ a^∨‖_{L¹}`, by `MeasureTheory.norm_integral_le_integral_norm` and unitarity (NV21 Lemma 8.8, p. 61).
- `Op(a, χ)* = Op(ā, χ)`, using that χ is even and real and that `conj(a^∨(−x)) = (ā)^∨(x)` (NV21 §2.3, p. 26).
- `Op_h(a, χ) = Op(a(h ·), χ)`.
- If `Ad(g) supp χ ⊆ 𝒢`, then `π(g) Op(a, χ) π(g)^{−1} = Op(g·a, g·χ)`, the cutoff being transported together with the symbol (NV21 §2.4, p. 26).

*Needs:* §0.1, §0.2, §0.4; Tau Ceti `mulInvariantExp`, `ContRepresentation.IsUnitary`; Mathlib `ContRepresentation`, `MeasureTheory.norm_integral_le_integral_norm`; LieGroups Layer 1 (`Ad` and conjugation of exp).

**Checks.**

- For the character `Π_t(x) = e^{itx}` of ℝ and a Schwartz b with `𝓕 b` supported where χ = 1, `quantize Π_t χ b = b(t/(2π))` by Fourier inversion, which is `a(it)` for `a(2πiη) = b(η)`; the opposite sign convention would give `b(−t/(2π))`. For a Gaussian symbol, whose inverse transform is not compactly supported, `Op_h(a)` differs from `a(iht)` by `O(h^N)` for every N.
- The constant symbol 1 quantizes, in the distributional extension of §1.12, to the identity, since `1^∨` is the point mass at 0 and `χ(0) = 1`; the Bochner formula itself is meant for Schwartz symbols, and on a symbol that is not integrable the transform `𝓕 b`, hence `quantize`, is 0 by Mathlib's convention for non-integrable functions.
- On ℝⁿ with cutoffs equal to 1 on the relevant supports, `Op(a)Op(b) = Op(ab)`: the abelian group has trivial star product.
- Keeping the cutoff fixed under a large `Ad(g)` is not the covariance identity: on SL₂(ℝ), `Ad(diag(t, t^{−1}))` multiplies the upper-triangular coordinate by t², so for large t it carries supp χ outside 𝒢, and only the transported cutoff `g·χ` gives an exact identity.

### 0.6 The Sobolev operator algebra

Composition maps `Ψ^{m₁} × Ψ^{m₂}` continuously to `Ψ^{m₁+m₂}`, with `∞ + (−∞) = −∞`. An enveloping word of degree r has order r and `Δ^r` has order 2r for every integer r. An operator T is smoothing if and only if `Δ^N T Δ^N` is bounded on π for every N ≥ 0, and these seminorms define the topology of `Ψ^{−∞}`. For f smooth and compactly supported on G, `π(f) = ∫ f(g) π(g) dg` lies in `Ψ^{−∞}` and depends continuously on f (NV21 Lemmas 3.3–3.6, pp. 30–31; Proposition 8.6, pp. 60–61).

*Needs:* §0.2, §0.3; SmoothBanachRepresentations Layer 3, §3.4 (integration by parts for `π(f)`).

**Checks.**

- Orders add under composition: `dπ(x) ∘ dπ(y)` has order 2, and `Δ^{−1}` composed with `Δ` has order 0.
- For f smooth and compactly supported, `Δ^N π(f) Δ^N = π(Δ^N ∗ f ∗ Δ^N)` has operator norm at most `‖Δ^N ∗ f ∗ Δ^N‖_{L¹}`, a bound independent of π.
- On the regular representation of ℝ the identity is not smoothing: `Δ^N` acts as the Fourier multiplier `(1 + t²)^N`, which is unbounded. On the trivial representation on an infinite-dimensional Hilbert space, `Δ = 1` and the identity is smoothing, so infinite dimension alone does not prevent smoothing.

### Examples

On ℝ with `Π_t(x) = e^{itx}`: the parameter is it, `Δ = 1 + t²`, `‖v‖_s = (1 + t²)^{s/2}‖v‖`, and with an inactive cutoff `Op_h(a) = a(iht)`. On a compact group every irreducible representation is finite-dimensional, `π^s = π` for every s with equivalent norms, and every operator lies in `Ψ^{−∞}`.

### Dependencies

Mathlib `SchwartzMap`, `SchwartzMap.fourierTransformCLM`, `Real.fourier_eq`, `ContRepresentation`, `UniversalEnvelopingAlgebra`, `MeasureTheory.norm_integral_le_integral_norm`; Tau Ceti `mulInvariantExp`, `ContRepresentation.IsUnitary`; LieGroups Layers 0–1; NoncompactQuantumSymmetry M0; UnboundedOperators UO-A01; SmoothBanachRepresentations Layers 2–3 (§§2.1, 3.4).

## Layer 1: The uniform symbol and operator calculus

The star product of symbols, its Baker–Campbell–Hausdorff expansion with remainder bounds, the Planck-scale localization and the almost-orthogonality argument give the uniform order-zero bound, the polynomial quantization identity, cutoff independence and near covariance, and the rescaled composition calculus with every power of h controlled.

### 1.1 The cutoff star product

Let 𝒢 ⊂ 𝒢′ be neighbourhoods of 0 with `exp(𝒢)exp(𝒢) ⊆ exp(𝒢′)`, write `x ∗ y = log(exp x exp y)` for x, y ∈ 𝒢 (the local BCH logarithm), and let χ, χ′ be cutoffs on 𝒢, 𝒢′ with `χ′(x ∗ y) = 1` for x, y ∈ supp χ. For Schwartz a, b define `a ⋆ b` by `(a ⋆ b)(ζ) = ∫∫ a^∨(x) b^∨(y) χ(x) χ(y) e^{(x∗y)ζ} dx dy`, the Fourier transform of the pull-back to 𝔤 of the group convolution of the densities `χa^∨` and `χb^∨` (NV21 (2.4) and Lemma 2.1, pp. 26–27; (4.2), p. 32). Define `a ⋆_h b` by `(a ⋆_h b)_h = a_h ⋆ b_h`.

- `Op(a, χ) Op(b, χ) = Op(a ⋆ b, χ′)` for Schwartz a, b, by `π(f₁)π(f₂) = π(f₁ ∗ f₂)` and Fubini (NV21 Lemma 2.1, p. 27).
- `Op_h(a, χ) Op_h(b, χ) = Op_h(a ⋆_h b, χ′)`, both factors and the output rescaled (correcting the mixed rescaled/unscaled notation of NV21 §2.5, p. 28, and the proof of Proposition 8.7, p. 62).
- ⋆ is a continuous bilinear map on Schwartz symbols.
- On an abelian Lie algebra, with χ = 1 on the supports of `a^∨` and `b^∨`, `a ⋆ b = ab`.

*Needs:* §0.1, §0.5; LieGroups Layer 3 (`bch`, the local logarithm of the exponential chart).

**Checks.**

- If either input is 0, the product is 0.
- On ℝⁿ, for symbols whose inverse transforms are supported where the cutoffs equal 1, `a ⋆ b = ab`; on a nonabelian group the same symbols give `a ⋆ b = ab + C_1(a,b) + …`. The first coefficient is antisymmetric, so `C_1(a,a) = 0` for every a; on the Heisenberg algebra with `[X, Y] = Z`, a depending only on `ξ(X)` and b only on `ξ(Y)`, `C_1(a,b) = ½ ξ(Z) ∂_X a ∂_Y b`, nonzero wherever ξ(Z) and both derivatives are nonzero.
- On the character `Π_t` of ℝ, replacing one rescaled Op_h in the composition identity by an unscaled Op gives `a(it) b(iht)` instead of `a(iht) b(iht)`, already wrong for a nonconstant symbol.
- Finite-cutoff multiplication is not associative: with fixed χ, `(a ⋆ b) ⋆ c` uses the cutoff on the intermediate support of `x ∗ y`, which `a ⋆ (b ⋆ c)` truncates differently; only the formal expansion of §1.2 is associative.

### 1.2 The BCH bidifferential coefficients

Write `{x, y} = x ∗ y − x − y` and expand the analytic function `e^{{x,y}ζ} = Σ c_{αβγ} x^α y^β ζ^γ`. For each j ≥ 0 define the bidifferential operator `C_j(a, b)(ζ) = Σ c_{αβγ} ζ^γ ∂^α a(ζ) ∂^β b(ζ)`, the sum over `|α| + |β| − |γ| = j`, with `|γ| ≤ min(|α|,|β|)` and `max(|α|,|β|) ≤ j`, where `(∂^α a)^∨(x) = x^α a^∨(x)` (NV21 (4.3)–(4.5), p. 32). The formal series `a ⋆ b ∼ Σ_j C_j(a,b)` and `a ⋆_h b ∼ Σ_j h^j C_j(a,b)` are the star-product expansions (NV21 (4.4), (4.6), p. 32).

- `C_0(a, b) = ab`.
- C_j maps `S^{m₁} × S^{m₂}` continuously to `S^{m₁+m₂−j}` and `S^{m₁}_δ × S^{m₂}_δ` to `h^{−2δj} S^{m₁+m₂−j}_δ` (NV21 (4.10)–(4.11), p. 35).
- `C_1(a, b)(ζ) = ½ Σ_{i,k} ζ([e_i, e_k]) ∂_i a(ζ) ∂_k b(ζ)`, one half of the Lie–Poisson bracket in the imaginary-dual derivative convention, since `{x, y} = ½[x, y] + O(|x||y|(|x| + |y|))`.
- `C_j(a_h, b_h) = h^j (C_j(a,b))_h`.
- The formal series is associative: the coefficient of each power of h in `(a ⋆ b) ⋆ c` equals that in `a ⋆ (b ⋆ c)`, by associativity of BCH.

*Needs:* §0.1, §0.4; LieGroups Layer 3.

**Checks.**

- On an abelian Lie algebra `{x,y} = 0`, so `C_j = 0` for every j ≥ 1.
- For linear symbols `a = ξ(x₀)`, `b = ξ(y₀)`, `C_1(a,b) − C_1(b,a) = ξ([x₀, y₀])`, which quantizes to `dπ([x₀,y₀]) = [dπ(x₀), dπ(y₀)]`; a coefficient with the factor 1 in place of ½ would give twice the commutator.
- If either input is constant, every C_j with j ≥ 1 vanishes, since every term carries a derivative of each input.
- On the Heisenberg algebra with `[X, Y] = Z`, BCH terminates, `{x,y} = ½[x,y]`, and `e^{{x,y}ζ}` contains only monomials `x^α y^β ζ^γ` with `|α| = |β| = |γ| = j`: C_j applies exactly j derivatives to each input and multiplies by `ζ(Z)^j`, so `C_2 ≠ 0` although the series of `{x,y}` stops after its quadratic term.

### 1.3 Nonstationary phase and BCH Taylor remainders

(i) For an imaginary-valued smooth phase φ on a fixed open set with `|∇φ| ≥ ε > 0` near the compact support of the amplitude f and with bounded derivatives up to order N + 1, `∫ f e^{tφ} = O(t^{−N} Σ_{|α| ≤ N} ‖∂^α f‖_{L¹})`, with constants controlled by ε and the derivative bounds. (ii) For the BCH exponential `Ω(x,y,ζ) = e^{{x,y}ζ}`, with `Ω_j` the sum of the monomials `c_{αβγ} x^α y^β ζ^γ` of its expansion with `|α| + |β| − |γ| = j` (the coefficients of §1.2), every fixed ζ-derivative of `Ω − Σ_{j<J} Ω_j` is `O(ρ^J)` on the chart, with `ρ = max(|x|, |y|, |x||y||ζ|)`, and polynomial in ρ for ρ ≥ 1. (iii) For subalgebras `𝔤₁ + 𝔤₂ = 𝔤` and `F(ξ, η, ζ) = ∫∫ χ₁(x) χ₂(y) e^{xξ + yη + {x,y}ζ} dx dy` (x ∈ 𝔤₁, y ∈ 𝔤₂), with cutoffs supported close enough to 0: for every N ≥ 0 and multi-index γ, `|∂_ζ^γ F(ξ, η, ζ)| ≤ C_{N,γ} ⟨(ξ,η)⟩^{−N}` whenever `|(ξ,η)| ≥ |ζ|/2`, uniformly in all three variables (NV21 Lemmas 7.6–7.8, pp. 48–51).

The integration by parts uses `L = t^{−1}|∇φ|^{−2} Σ_j conj(∂_jφ) ∂_j`, which satisfies `L e^{tφ} = e^{tφ}`, iterated through its formal adjoint; this corrects the iteration of a variable-coefficient Laplacian in the proof of NV21 Lemma 7.8, p. 50. In (ii), differentiating r times in ζ gives the intermediate bound `ρ^{j−r}`, and `|x||y| ≤ ρ²` on the small chart recovers `ρ^j` (correcting the intermediate estimate in the proof of NV21 Lemma 7.6, p. 49).

*Needs:* §1.2.

**Checks.**

- For φ(x) = ix on ℝ and f a fixed bump, `∫ f e^{itx} dx` is a Fourier transform of a test function and decays faster than every power of t, as (i) predicts; for `φ(x) = ix²` and f(0) ≠ 0 the gradient vanishes at 0 and the integral has size `t^{−1/2}`, so the hypothesis `|∇φ| ≥ ε` cannot be dropped.
- L applied to `e^{tφ}` returns `e^{tφ}` exactly: `L e^{tφ} = t^{−1}|∇φ|^{−2} Σ conj(∂_jφ) t ∂_jφ e^{tφ} = e^{tφ}`.
- On an abelian algebra `Ω = 1 = Ω_0` and (ii) holds with every J.
- On the Heisenberg algebra `{x,y}ζ = ½ζ([x,y])` is homogeneous of degree 1, so a remainder estimate for the phase itself would be empty for J = 2; the exponential has `Ω − Ω_0 − Ω_1 = e^z − 1 − z` with `z = ½ζ([x,y])`, which at `z = iε` is `−ε²/2 + O(ε³)`, of size `O(ρ²)` as (ii) asserts. This quadratic term is what produces `C_2 ≠ 0` in §1.2.

### 1.4 Dyadic Planck localization

For 0 ≤ δ ≤ 1 and h ∈ (0,1], cover 𝔤^∧ by balls `U_ω` of radius `h^δ⟨ω⟩/2` centred at a countable set `Ω = Ω_{δ,h}`, with overlap bounded independently of h, comparable weights `⟨ω⟩ ≍ ⟨ω′⟩` on intersecting balls and at most `h^{−O(1)} R^{O(1)}` centres in a ball of radius R, polynomially many in R and in `h^{−1}`. A subordinate smooth partition writes every `a ∈ S^m_δ` as `a = Σ_ω ⟨ω⟩^m a_ω` with `a_ω` supported in `U_ω` and with uniformly bounded `S^0_δ` seminorms; such a piece is localized at ω, and for it `(a_ω)_h^∨(x) = e^{−ωx/h} A^n φ_ω^∨(Ax)` with `A = h^{δ−1}⟨ω⟩` and φ_ω in a bounded set of compactly supported smooth functions; the weighted summand `⟨ω⟩^m a_ω` carries the additional factor `⟨ω⟩^m` (NV21 Definition 7.9, Lemmas 7.10–7.12, pp. 51–53; δ = 0 is included, and for a localized symbol of order m, as in (7.9), the moment bound carries the weight `⟨ω⟩^m`, which the printed (7.10), p. 51, omits).

- Each `a_ω` is supported in `U_ω`.
- The modulation, the Jacobian `A^n` and the moment bounds `∫ |x|^r |(a_ω)_h^∨| ≪ A^{−r}` for the normalized pieces, and `≪ A^{−r}⟨ω⟩^m` for the weighted summands, are explicit.
- The locally finite sum converges to a pointwise and in `C^∞` on compact sets, with uniform weighted derivative bounds for the sum and for the pieces; finite partial sums need not converge in the `S^m_δ` topology.
- The overlap and weight constants depend only on dim 𝔤 and the fixed partition.

*Needs:* §0.1, §0.4.

**Checks.**

- At δ = 0 the radius is `⟨ω⟩/2`, comparable to ⟨ω⟩, not `h⟨ω⟩`.
- At ω = 0 the inverse-transform width is `h^{1−δ}` and the amplitude scales by `h^{−n(1−δ)}`, n = dim 𝔤.
- For δ > 0 and n ≥ 1, covering a fixed ball needs `≍ h^{−nδ}` centres, which is unbounded as h → 0; at δ = 0 a bounded number suffices.
- For a = 1, any finite sum of pieces vanishes far out, so its `S^0` distance from 1 is at least 1: the partition converges locally, not in the symbol topology.
- For m = −2, h = 1, ω = R and a fixed nonzero φ, the normalized piece `φ((ξ − R)/⟨R⟩)` has `‖(a_ω)^∨‖_{L¹} = ‖φ^∨‖_{L¹}`, independent of R; a moment bound `≪ ⟨R⟩^{−2}` at r = 0 for the normalized piece would force this to tend to 0.

### 1.5 Localized star-product remainders

Let `𝔤₁ + 𝔤₂ = 𝔤` be subalgebras, 0 ≤ δ₁, δ₂ < 1 with δ₁ + δ₂ < 1, and let `a ∈ S^0_{δ₁}(𝔤₁^∧)`, `b ∈ S^0_{δ₂}(𝔤₂^∧)` be localized at ω₁, ω₂. For every N ≥ 0 and multi-index γ there are J and M such that `r = a ⋆_h b − Σ_{j<J} h^j C_j(a,b)` satisfies `|∂^γ r(ζ)| ≤ C h^N ⟨ζ⟩^{−N} ⟨ω₁⟩^M ⟨ω₂⟩^M`; if 𝔤₁ = 𝔤 the factor `⟨ω₂⟩^M` improves to `⟨ω₂⟩^{−N}`, if 𝔤₂ = 𝔤 the factor `⟨ω₁⟩^M` improves to `⟨ω₁⟩^{−N}`, and if both equal 𝔤 both weights are negative powers. C depends on finitely many localized seminorms of a and b and not on h, ζ, ω₁, ω₂ (NV21 Proposition 7.13 (a)–(d), pp. 53–56).

*Proof route.* Insert the localized Fourier formulas of §1.4 and treat the four cases separately. For comparable centres use the Taylor remainder of §1.3(ii), spending `h^{−δ₁}` and `h^{−δ₂}` per derivative; for separated centres use §1.3(i) and (iii). Choose J from the required N and γ before estimating the centre weights.

*Needs:* §1.3, §1.4.

### 1.6 The mixed-subalgebra symbol calculus

For subalgebras `𝔤₁ + 𝔤₂ = 𝔤` of unimodular subgroups, the star product extends continuously to `S^{m₁}(𝔤₁^∧) × S^{m₂}(𝔤₂^∧) → S^{m₁+m₂}(𝔤^∧)` for admissible pairs, where a proper 𝔤₁ forces m₂ = −∞ and a proper 𝔤₂ forces m₁ = −∞; its leading term is the product of the pull-backs to 𝔤^∧. For δ₁ + δ₂ < 1, the remainder after J terms lies in `h^{(1−δ₁−δ₂)J} S^{m₁+m₂−J}_{max(δ₁,δ₂)}`. In particular the equal-algebra calculus works for δ < 1/2 (NV21 Definition 7.2, Lemma 7.3, Theorem 7.4, pp. 47–48; Theorem 4.5, pp. 35–36; Example 7.1).

*Proof route.* Define the mixed product through the inclusion distributions of the subalgebras, apply §1.5 to the Planck pieces and sum in every seminorm, using the order conditions to obtain decay in the directions missing from the other factor. For two full algebras sum case (d); for one proper algebra use the negative order of the full-algebra input; for two proper algebras both orders are −∞.

*Needs:* §1.1, §1.2, §1.5.

**Checks.**

- Pull-backs from a proper subalgebra are not symbols on 𝔤^∧: for 𝔤 = ℝ², 𝔤₂ the first axis and `b(ξ₁) = e^{−ξ₁²}` (a Schwartz symbol on 𝔤₂^∧), the pull-back has `∂₁b(1, R) = −2e^{−1}` for every R, while S⁰ on ℝ² requires `|∂₁b| ≪ ⟨ξ⟩^{−1}`; so for a = 1 on 𝔤^∧ the product is not in S⁰, and a must supply the decay in the directions transverse to 𝔤₂, which is why a proper 𝔤₂ forces m₁ = −∞.
- With δ₁ = δ₂ = δ the remainder gain is `h^{(1−2δ)J}`, positive exactly for δ < 1/2; with δ₁ = 0 and δ₂ = 0.9 the mixed exponent `1 − δ₁ − δ₂ = 0.1` is still positive although δ₂ > 1/2.
- For the two coordinate axes 𝔤₁, 𝔤₂ of the abelian algebra ℝ², both proper with sum ℝ², take `a(ξ₁) = e^{−ξ₁²}` and `b(ξ₂) = e^{−ξ₂²}`, both of order −∞: the leading product `e^{−ξ₁²−ξ₂²}` is Schwartz on ℝ². Replacing b by 1 gives the product `e^{−ξ₁²}`, equal to 1 at (0, R) for every R and not a symbol of any negative order, so the order condition on the second factor cannot be dropped.

### 1.7 Fourier cutoff asymptotics

Let ψ be smooth and compactly supported on 𝔤 and `a ∈ S^m_δ`. If `b_h^∨ = ψ a_h^∨`, then `b ∈ S^m_δ` and for every J, `b = Σ_{j<J} h^j Σ_{|α| = j} (∂^αψ(0)/α!) ∂^α a` modulo `h^{(1−δ)J} S^{m−J}_δ`, with the positive power `h^j` and the derivative convention of §1.2. Away from 0, `|∂^α a_h^∨(x)| ≤ C h^{−n−|α|} (|x|/h^{1−δ})^{−N}` for every N with `|α| + m − N ≤ −n − 1`; the unscaled transform `a^∨` is `C^k` at 0 when `m ≤ −n − 1 − k` (NV21 Lemma 7.14, p. 56, whose printed `(−h)^j` is corrected to `h^j`; Lemma 8.1, pp. 57–58, whose derivative estimate (8.3) lacks the factor `h^{−|α|}`).

*Needs:* §0.1, §0.4, §1.4.

**Checks.**

- On ℝ, differentiating `h^{−1} a^∨(x/h)` once produces `h^{−2}(a^∨)′(x/h)`: the extra `h^{−1}` is the corrected factor.
- For ψ(x) = x near 0 the first term is `h ∂a` with a positive sign; with `(∂a)^∨ = x a^∨` this is forced, and a sign `−h` contradicts `(ψ a_h^∨)` for ψ linear.

### 1.8 The Sobolev order criterion

For an integer m ≥ 0, `T ∈ Ψ^m` if and only if for every enveloping word u there is C_u with `‖θ_u(T) v‖² ≤ C_u ⟨Δ^m v, v⟩` for all smooth v. For m ≤ 0, `T ∈ Ψ^m` if and only if `θ_u(T)` followed by every word of length −m in B ∪ {1} is bounded. Consequently every localized enveloping element of order ≤ m in `U(𝔤_ℂ)[Δ^{−1}]` acts in `Ψ^m` (NV21 Proposition 8.2, Definition 8.3, Lemma 8.4 and Proposition 8.6, pp. 59–61).

*Proof route.* Commute T past words, compare even powers of Δ with sums of squared word norms (§0.2), and induct on commutator length, passing between positive and negative orders with `Δ^{−1}` of order −2. Both directions are proved before symbols are quantized.

*Needs:* §0.3, §0.6.

**Checks.**

- At m = 0 the criterion is boundedness of every commutator `θ_u(T)`.
- At m = −2 the test admits `Δ^{−1}`: `Δ^{−1}` followed by any word of length 2 is bounded by (3.1).
- On the regular representation of ℝ, `T = ∂_x` satisfies `‖Tv‖² ≤ ⟨Δv, v⟩` and is of order 1 but fails the m = 0 test.

### 1.9 Uniform boundedness of order-zero quantization: `exists_norm_quantize_le`

**Theorem.** Let G be a unimodular finite-dimensional real Lie group and 0 ≤ δ < 1/2. There is a neighbourhood 𝒢 of 0 in 𝔤 such that for every cutoff χ supported in 𝒢 there are C and N with the following property: for every strongly continuous unitary representation π of G on a complex Hilbert space, every h ∈ (0,1] and every Schwartz symbol a whose derivatives of order j ≤ N satisfy `h^{δj}⟨ξ⟩^j |∂^j a(ξ)| ≤ M`, the operator `Op_h(a, χ : π)` has norm at most C·M. In particular Op maps `S^0` to bounded operators and Op_h maps bounded families in `S^0_δ` to uniformly bounded families, with bounds by finitely many symbol seminorms independent of π and h; no irreducibility is assumed (NV21 Proposition 8.7, p. 61). The Lean statement `exists_norm_quantize_le` takes the symbol in the coordinate η and the weight `(1 + ‖η‖)^j`, which define the same class with equivalent seminorms.

*Proof route.* Decompose a by §1.4 into pieces localized at ω ∈ Ω; each piece satisfies the L¹ bound of §0.5 uniformly (NV21 Lemmas 8.8–8.9, p. 61). The adjoint formula of §0.5 and §1.1 give `Op_h(a_{ω₁})* Op_h(a_{ω₂}) = Op_h(ā_{ω₁} ⋆_h a_{ω₂}, χ′)`; expand by §1.5, so that only O(1) pairs have nonnegligible products for fixed ω₁ and the remainders are summable. The square-root row sums are then bounded, and the countable almost-orthogonality lemma (PseudodifferentialOperators P5, gap:cotlar-stein-strong) gives strong convergence of `Σ_ω Op_h(a_ω)` to `Op_h(a)` with the norm bound. The source's Lemma 8.10 asserts operator-norm convergence of the sum; only strong convergence holds, as the orthogonal rank-one projections on ℓ² show (both row sums equal 1, the partial sums converge strongly to the identity and every tail has norm 1), and only strong convergence is used.

*Needs:* §0.5, §1.4, §1.5, §1.6; PseudodifferentialOperators P5 (gap:cotlar-stein-strong); Tau Ceti `mulInvariantExp`, `ContRepresentation.IsUnitary`.

**Checks.**

- For a = 1 (approximated by Schwartz symbols equal to 1 on large balls) the quantization tends strongly to the identity and the bound is 1.
- On ℝ let θ be smooth and odd with θ(ξ) = sign ξ for |ξ| ≥ 1, and ψ an even bump equal to 1 near 0. The symbols `a_K(ξ) = θ(ξ)ψ(2^{−K}ξ)` have S⁰ seminorms bounded independently of K, while `a_K^∨` is the kernel of the Hilbert transform, of size `≍ 1/|x|`, smoothed at scale `2^{−K}`, so `‖a_K^∨‖_{L¹} ≍ K`; the theorem gives a bound independent of K, which the L¹ estimate of §0.5 does not. Growth is not automatic for dyadic sums: with `φ(ξ) = ψ(ξ/2) − ψ(ξ)` the all-plus sum `Σ_{k=0}^{K} φ(2^{−k}ξ)` telescopes to `ψ(2^{−K−1}ξ) − ψ(ξ)`, whose inverse transform has L¹ norm at most `2‖ψ^∨‖_{L¹}`.
- At δ = 1/2 the expansion of §1.2 loses `h^{(1−2δ)j} = 1` per term, and the proof gives nothing; the hypothesis δ < 1/2 is sharp for this argument.

### 1.10 Polynomial quantization

For a polynomial p on 𝔤^∧, `Op(p, χ) = dπ(sym p)`, independently of χ, where `sym : S(𝔤_ℂ) → U(𝔤_ℂ)` is the symmetrization isomorphism and a linear symbol `ξ ↦ ξ(x)` corresponds to x. A linear symbol `ξ(x)` quantizes to `dπ(x)`. When `|ξ|` is the dual norm of the basis B, `1 + |ξ|² = 1 − Σ_{x∈B} ξ(x)²` quantizes to Δ. Higher powers do not in general quantize to powers of Δ: `Op((1 + |ξ|²)^N)` differs from `Δ^N` by lower-order terms, and the identification needed in the proof of the order inclusions is the symmetrization preimage of `Δ^N`, which agrees with `(1 + |ξ|²)^N` modulo lower degree (NV21 Lemma 5.1, p. 37, proved in §8.1; the identification of `⟨ξ⟩^{2N}` with `Δ^N` in §8.7, p. 63, is corrected in this way).

*Proof route.* The inverse Fourier transform of a polynomial is a derivative of the point mass at 0; evaluate against smooth matrix coefficients, use χ = 1 near 0, and polarize monomials into symmetrized products.

*Needs:* §0.5; LieHighestWeight Layer 3 (PBW) and Layer 7 (`pbwSymmetrization`); Mathlib `UniversalEnvelopingAlgebra`.

**Checks.**

- For `Π_t` on ℝ, `ξ(∂_x)` quantizes to it and `1 + |ξ|²` to `1 + t²`.
- On the Heisenberg algebra with `[X, Y] = Z` and orthonormal basis X, Y, Z, `sym((1 + |ξ|²)²) = Δ² − Z²` in U(𝔤): the pair (X, Y) contributes `X²Y² + Y²X² − 2 sym(X²Y²) = Z²` and the commuting pairs contribute 0. Since `dπ(Z) ≠ 0` on infinite-dimensional irreducibles, `Op(⟨ξ⟩⁴) ≠ Δ²` there.
- On an abelian group `Op(p) = p(dπ)` for every polynomial, and `Op(⟨ξ⟩^{2N}) = Δ^N`.

### 1.11 Cutoff independence and near covariance

For two cutoffs, `Op(a, χ₁) − Op(a, χ₂)` is smoothing for `a ∈ S^m`, and for `a ∈ S^m_δ` with δ < 1 the rescaled difference lies in `h^∞Ψ^{−∞}`. If `‖Ad(g)‖ ≤ C h^{−1+δ+ε}` for some ε > 0, then `Op_h(g·a) − π(g) Op_h(a) π(g)^{−1} ∈ h^∞Ψ^{−∞}` with the cutoff fixed, with constants controlled by the symbol seminorms, C and ε (NV21 Lemmas 5.4–5.5, p. 39; §§8.3–8.4, pp. 57–59).

*Proof route.* A cutoff difference vanishes near 0, and `a_h^∨` decays rapidly away from 0 by §1.7. For the moving group element compare with the exactly transported cutoff of §0.5, whose inner radius is at least `‖Ad(g)‖^{−1} ≫ h^{1−δ−ε}`; ε pays for every polynomial Sobolev and group loss.

*Needs:* §0.3, §0.5, §1.7; LieGroups Layer 1.

**Checks.**

- Exact covariance transports both a and χ; with χ fixed and g = 1 the difference is 0.
- For two cutoffs equal to 1 on `|x| ≤ c`, `Op_h(a,χ₁) − Op_h(a,χ₂) = ∫ (χ₁ − χ₂)(hx) a^∨(x) π(exp hx) dx` only sees `a^∨` on `|x| ≥ c/h`, where a Schwartz `a^∨` is `O(h^N)` for every N: the mechanism of the first assertion.
- For g independent of h the hypothesis holds with every ε < 1 − δ.

### 1.12 The uniform rescaled operator calculus

For integral m, Op extends continuously from Schwartz symbols to `S^m → Ψ^m`, defined on smooth vectors distributionally against smooth matrix coefficients. For 0 ≤ δ < 1/2, `Op_h(S^m_δ) ⊆ h^{min(0,m)} Ψ^m_δ`. For `a ∈ S^{m₁}_δ`, `b ∈ S^{m₂}_δ` and every M, N there is J, depending only on (m₁, m₂, M, N, δ), with `Op_h(a) Op_h(b) − Σ_{j<J} h^j Op_h(C_j(a,b)) ∈ h^N Ψ^{−M}_δ`; unscaled, the error after J terms has order `m₁ + m₂ − J`. The same holds for admissible mixed-subalgebra orders, and if the preimages in 𝔤^∧ of the supports of a and b are disjoint the product is in `h^∞Ψ^{−∞}` (NV21 Theorems 5.6, 5.8 and Corollaries 5.7, 5.9, p. 40; §§8.7–8.10, Theorem 8.11 and Lemma 8.12, pp. 62–72).

*Proof route.* Combine §1.10 and §1.8 with the order-zero bound §1.9, lowering orders with an elliptic approximate inverse of `⟨ξ⟩^2`; control iterated commutators through symbol derivatives and the weights `h^δ`; apply §1.6 and §1.11, choosing J large enough for both the negative order M and the power N. For disjoint supports every coefficient `C_j(a,b)` vanishes.

*Needs:* §1.6, §1.8, §1.9, §1.10, §1.11.

**Checks.**

- The remainder after J terms lies in `h^{(1−2δ)J} S^{m₁+m₂−J}_δ ⊆ h^{(1−2δ)J} S^{−M}_δ` once `J ≥ m₁ + m₂ + M`, and quantizes into `h^{(1−2δ)J − M} Ψ^{−M}_δ`; for M = 3, N = 5 and δ = 1/4 this needs `J ≥ (N + M)/(1 − 2δ) = 16`. Using `h^{min(0,m)}` with the order `m₁ + m₂ − J` itself would give `h^{m₁+m₂−2δJ}`, a growing loss.
- For a = 1 the composition is exact: `Op_h(1)Op_h(b) = Op_h(b)` modulo `h^∞Ψ^{−∞}`, and every `C_j(1,b)` with j ≥ 1 vanishes.
- If a is supported in `|ξ| ≤ 1` and b in `|ξ| ≥ 2`, every `C_j(a,b)` vanishes and `Op_h(a)Op_h(b) ∈ h^∞Ψ^{−∞}`; on a character of ℝ this is `a(iht)b(iht) = 0` up to `O(h^∞)`.
- `Op_h(⟨ξ⟩^{−2})` behaves like `(1 − h²Σ dπ(x)²)^{−1}`, whose norm `π^s → π^{s+2}` is of size `h^{−2}`: the factor `h^{min(0,m)}` in the inclusion is attained.

### Examples

On ℝⁿ every C_j with j ≥ 1 vanishes and the calculus is the multiplier calculus of the Fourier transform: `Op_h(a)` acts on `Π_t` by `a(iht)` up to `O(h^∞)`. On the Heisenberg group the calculus is the semiclassical Weyl-type calculus in each infinite-dimensional representation, and §1.10 shows that the quadratic symbol quantizes to Δ while its square does not quantize to Δ².

### Dependencies

Layer 0; LieGroups Layers 1 and 3; LieHighestWeight Layers 3 and 7; Mathlib `UniversalEnvelopingAlgebra`; PseudodifferentialOperators P5 (gap:cotlar-stein-strong); Tau Ceti `mulInvariantExp`, `ContRepresentation.IsUnitary`.

## Layer 2: Infinitesimal characters and localization

From here to Layer 4, G is a real reductive group. This layer fixes the real invariant quotient of the imaginary dual and the infinitesimal character, proves the temperedness criterion and the Laplacian bound, and localizes eigenfunctionals and restriction functionals near the joint infinitesimal-character locus with arbitrary decay in both spectral parameters.

### 2.1 The real infinitesimal quotient

Let `[𝔤_ℂ^*] = 𝔤_ℂ^*//G` be the spectrum of the G-invariant polynomials on `𝔤_ℂ^*`, a complex affine space by Chevalley's theorem, and `[i𝔤^*]` its real form defined by the invariants that are real on `i𝔤^*`; equivalently `[i𝔤^*] = {λ : λ̄ = −λ}`, the bar being complex conjugation (NV21 §§9.1–9.2, pp. 72–73, (9.3)). Write `ξ ↦ [ξ]` for the quotient maps. For homogeneous generators `p₁, …, p_n` of degrees d_j put `|λ| = max_j |p_j(λ)|^{1/d_j}`. For a representation on which the centre `Z(U(𝔤_ℂ))` acts by scalars, the infinitesimal character `λ_π ∈ [𝔤_ℂ^*]` is the point at which every `z ∈ Z` acts by `γ(z)(λ_π)`, γ the Harish-Chandra isomorphism with its ρ-shift (NV21 §§9.4–9.5, pp. 74–75; §9.8, pp. 77–78).

- Each z ∈ Z acts on π by `γ(z)(λ_π)`.
- `λ ∈ [i𝔤^*]` if and only if `λ̄ = −λ`.
- `|tλ| = |t| |λ|` for real t.
- The image of `i𝔤^* → [i𝔤^*]` lies in the real form and is Zariski dense; surjectivity is a separate condition and fails in general.
- A homogeneous invariant of degree d satisfies `p(hλ) = h^d p(λ)`.

*Needs:* AutomorphicFormsOnReductiveGroups §2.2 (infinitesimal characters through the reductive Harish-Chandra isomorphism, with ρ extended by zero on the centre); FormalConnectionsOpers F4.3 (the reductive invariant quotient and its Chevalley restriction, central affine factors included); LieHighestWeight Layer 7 (the Killing-semisimple restriction theorem underlying both); Mathlib `UniversalEnvelopingAlgebra`.

**Checks.**

- For the one-dimensional abelian Lie algebra the quotient is the imaginary line and `|λ|` is homogeneous of degree one; the character `e^{itx}` has `λ = it`. The Killing form of 𝔤𝔩₁ is zero, so the Killing-semisimple restriction theorem says nothing here; the reductive statement keeps the central coordinate, and a quotient that discarded the centre would be a point and could not carry the parameter it.
- For 𝔤 = 𝔰𝔬(3), `[i𝔤^*] ≅ ℝ` through the invariant `p(ξ) = ξ(X₁)² + ξ(X₂)² + ξ(X₃)²`, which is `≤ 0` on `i𝔤^*`; the real points with `p > 0` are not in the image of the imaginary dual, and replacing the quotient by that image loses the parameters `λ = [ξ]` with ξ in `𝔤^*` itself.
- For `GL_n(ℝ)` the quotient is the space of monic polynomials of `ξ/i` (NV21 Example 9.1, p. 72); a quadratic invariant scales by `h²`, while its contribution to `|λ|` scales by `|h|`.

### 2.2 Dual and conjugate infinitesimal characters

For U(𝔤_ℂ)-modules on which Z acts by scalars, `λ_{π*} = −λ_π`, `λ_{π̄} = λ̄_π` and `λ_{π⁺} = −λ̄_π` for the conjugate dual `π⁺ = π̄^*`. An irreducible unitary representation therefore has `λ_π ∈ [i𝔤^*]` (NV21 Lemma 9.2 and Corollary 9.3, p. 75).

*Proof route.* Reduce to principal series of a split form with given infinitesimal character, whose dual and conjugate are principal series with parameters −λ and λ̄; then apply (9.3) of §2.1.

*Needs:* §2.1; AutomorphicFormsOnReductiveGroups §2.1 and §2.3 (admissible modules and normalized induction).

**Checks.**

- For `e^{itx}` on ℝ the dual and the conjugate both have parameter `−it`, and the Hermitian dual has parameter it, consistent with unitarity.
- For the normalized principal series `I(ν)` of SL₂(ℝ), with dual `I(−ν)`, the ρ-shifted parameters are ν and −ν, as the lemma requires. Without the ρ-shift the parameters would be `ν − ρ` and `−ν − ρ` modulo the dot action, and `−(ν − ρ) = ρ − ν` lies in neither class for generic ν.

### 2.3 The regular spectral temperedness criterion

For every compact subset Ω of the regular part `[i𝔤^*]_reg` there is `h₀ > 0` such that every irreducible unitary π with `hλ_π ∈ Ω` for some `0 < h < h₀` is tempered. The constant is uniform over all π; no assertion is made for compact sets meeting the discriminant (NV21 Lemma 9.4, pp. 76–77).

*Proof route.* By the Langlands classification a nontempered irreducible unitary π is a quotient of an induced representation with a nonzero real exponent; real parts of unitary exponents are bounded in terms of G alone, and the Hermitian structure forces a Weyl symmetry of the parameter. If h → 0 with `hλ_π` in Ω, the bounded real parts force a nontrivial Weyl stabilizer at the limit, contradicting regularity.

*Needs:* §2.2; AutomorphicFormsOnReductiveGroups §2.4 (Langlands classification) and gap:unitary-exponent-bound.

**Checks.**

- For SL₂(ℝ), with λ evaluated at `H = diag(1, −1)` (so ρ(H) = 1), the complementary series have `λ(H) ∈ (0, 1)`, real and bounded by 1, so `hλ → 0`, the irregular point; a compact Ω in the regular set excludes them for small h.
- Ω must have positive distance from the discriminant; for Ω containing 0 the trivial representation, with `hλ → 0`, gives a counterexample.

### 2.4 The spectral Laplacian bound and central leading symbols

(i) For every irreducible unitary representation π of G, Δ has an eigenvalue at most `C(1 + |λ_π|²)`, C depending only on G and B. (ii) For an invariant polynomial p of degree ≤ r, `γ(sym p) − p` has degree ≤ r − 1. These are independent statements (NV21 Lemmas 9.5–9.6, pp. 77–78).

*Proof route.* (i) In a Cartan-compatible orthonormal basis `Δ = 2Δ_K − 1 − C_𝔤`, with `Δ_K = 1 − Σ_{x ∈ B(𝔨)} x²` and `C_𝔤 = −Σ_{x ∈ B(𝔨)} x² + Σ_{y ∈ B(𝔭)} y²` the Casimir of the Cartan-signed invariant form, which acts by a quadratic expression in λ_π; a minimal K-type gives the eigenvalue bound. (ii) Use PBW and the ρ-translation: the top homogeneous component of `γ(sym p)` is p.

*Needs:* NoncompactQuantumSymmetry M0 (Nelson operator); §2.1; LieHighestWeight Layers 3, 5 and 7; gap:vogan-minimal-ktype.

**Checks.**

- For `e^{itx}` on ℝ the eigenvalue is exactly `1 + t²` and `|λ_π| = |t|`.
- For p the quadratic Casimir polynomial, `γ(sym p) − p` is a constant (the ρ-shift `−|ρ|²`), of degree 0 ≤ 1.

### 2.5 Approximate noncommutative division

Let `0 ≤ δ₁, δ₂ < 1/2`, δ = max(δ₁, δ₂), `a ∈ S^{−∞}_{δ₁}` and `q ∈ S^m_0` with `|q| ≥ h^{δ₂}` on supp a, with uniform seminorm bounds. For all M, N there are `b, b′ ∈ h^{−δ₂} S^{−∞}_δ` with `Op_h(a) − Op_h(q) Op_h(b)` and `Op_h(a) − Op_h(b′) Op_h(q)` in `h^N Ψ^{−M}_δ`; their supports lie in a fixed enlargement of supp a on which the lower bound persists (NV21 Lemma 10.1 and Remark 10.2, pp. 79–80).

*Proof route.* Set `b₀ = a/q` on the support and recursively `b_j = −q^{−1} Σ_{l<j} C_{j−l}(q, b_l)`, summing over all earlier l; the right quotient uses `q′₀ = a/q` and `q′_j = −q^{−1} Σ_{l<j} C_{j−l}(q′_l, q)`. Differentiate inverses using the lower bound, assigning losses `h^{−δ₂}`, and truncate where the gain `h^{(1−2δ)j}` exceeds the required N and M. Using only `C_j(q, b₀)` fails from the second step on.

*Needs:* §1.2, §1.12.

**Checks.**

- `b₀ = a/q`, `b₁ = −C₁(q,b₀)/q`, `b₂ = −(C₂(q,b₀) + C₁(q,b₁))/q`; the source's sign on the C₁ term of b₂ (proof of Lemma 10.1, p. 79) and its right-division recursion (§8.8.6, p. 69) are corrected to these.
- On an abelian group `b = a/q` exactly and every correction vanishes.

### 2.6 Eigenfunctional localization

Let `p ∈ S^m_0` be a symbol family of fixed finite order, 0 ≤ δ < 1/2, and L an h-uniformly continuous linear functional on `Ψ^{−∞}` with `L(Op_h(p) T) = λ L(T)` for all T (or the analogous right identity). For `a ∈ S^{−∞}_δ`, `L(Op_h(a))` is bounded by a fixed negative power of h times `⟨λ⟩^{−N}` for every N; if `|p − λ| ≥ h^δ` on supp a for some δ < 1/2, then `L(Op_h(a)) = O(h^N ⟨λ⟩^{−N})` for every N, with finitely many symbol seminorms controlling each estimate (NV21 Lemma 10.3, pp. 80–81).

*Proof route.* Divide a by high powers of `p − λ` on the separated support (§2.5); the eigenidentity annihilates the principal term, and enough powers of h overcome the polynomial loss of L (§0.3). For large λ the same division carries the weight `⟨λ⟩^{−N}`.

*Needs:* §0.3, §2.5.

### 2.7 Joint infinitesimal-character localization

Fix 0 ≤ δ < 1/2 and a bounded family `a ∈ S^{−∞}_δ`. Let H ⊂ G be reductive, let π and σ be irreducible unitary representations of G and H, possibly depending on h, and let ℓ be a linear functional on `Ψ^{−∞}(π)` that factors through an H × H-equivariant map `Ψ^{−∞}(π) → Ψ^{−∞}(σ)` followed by the trace, with `|ℓ| ≤ ν` for a fixed h-uniformly continuous seminorm ν on `Ψ^{−∞}(π)`. Then for every N there is M, depending on ν, such that `|ℓ(Op_h(a))| ≤ C_N h^{−M} ⟨hλ_π⟩^{−N} ⟨hλ_σ⟩^{−N}`, with C_N controlled by ν and by finitely many `S^{−∞}_δ` seminorms of the family a; if every ξ ∈ supp a satisfies `dist([ξ], hλ_π) ≥ h^δ` or `dist([ξ|_𝔥], hλ_σ) ≥ h^δ`, distances being taken in the fixed generator coordinates of `[𝔤^∧]` and `[𝔥^∧]` of §2.1, the bound improves to `C_N h^N ⟨hλ_π⟩^{−N} ⟨hλ_σ⟩^{−N}` for every N. The condition is on the invariant coordinates, not on the ambient distance of ξ from the joint fibre. G-invariants are evaluated at `hλ_π` and H-invariants at `hλ_σ` (NV21 Lemma 10.4 and (10.7)–(10.14), pp. 81–82, where the source evaluates both at `hλ_σ`; the G-invariants are corrected to `hλ_π`). Without the symbol-class hypothesis on the family a neither estimate holds (Checks).

*Proof route.* Cover the support by finitely many regions where one invariant coordinate difference is large; the central action of G and the H-equivariant factorization give eigenidentities whose leading symbols are the invariant polynomials up to lower degree (§2.4(ii)); apply §2.6 and iterate the lower-degree errors.

*Needs:* §2.1, §2.4, §2.6.

**Checks.**

- For G = H = ℝ and characters `e^{itx}`, `e^{isx}`, a functional factoring through both vanishes unless t = s; the bound with both weights is consistent with this.
- Ambient distance is not enough: for an invariant `q(x) = x²` and the fibre `q = 0`, the point `x = h^δ` has distance `h^δ` from the fibre but invariant difference `h^{2δ} < h^δ`, so the division of §2.6 by `q − 0` gains nothing there; the stated condition excludes this point and admits `x = h^{δ/2}`.
- The family must be bounded in `S^{−∞}_δ`: for G = H = {1}, π = σ = ℂ and ℓ the identity on the scalars, the family `a(h) = e^{1/h}` consists of Schwartz functions on the zero-dimensional dual, and `ℓ(Op_h(a)) = e^{1/h}` exceeds every `h^{−M}`; the bounded family a = 1 gives the value 1, which is O(1) as the a-priori estimate requires.

### Examples

For G = SL₂(ℝ) the quotient `[i𝔤^*]` is a line with parameter `λ² ∈ ℝ`; evaluate λ at `H = diag(1, −1)`, so that ρ(H) = 1 and the normalized principal series `I(s)` has `λ(H) = ±s`. Unitary principal series have `λ(H) ∈ iℝ`, complementary series real `λ(H) ∈ (0, 1)`, and the discrete series `D_k` of lowest weight k ≥ 2 has the infinitesimal character of the (k − 1)-dimensional representation, `λ(H) = k − 1 ∈ {1, 2, 3, …}`. Halving λ(H) would put the complementary series in (0, 1/2) and the discrete series at half-integers; the two ranges belong to one normalization only together. §2.3 says that for small h only tempered representations have `hλ` in a fixed compact set avoiding 0.

### Dependencies

Layers 0–1; AutomorphicFormsOnReductiveGroups §§2.1–2.4; FormalConnectionsOpers F4.3; LieHighestWeight Layers 3, 5 and 7; NoncompactQuantumSymmetry M0; gap:unitary-exponent-bound; gap:vogan-minimal-ktype.

## Layer 3: Coadjoint multiorbits and trace asymptotics

Normalized regular coadjoint multiorbits and their weak topology, Rossmann's character formula, uniform orbital decay, the Kirillov-type trace expansion and the uniform trace-ideal estimates for tempered representations of real reductive groups.

### 3.1 Normalized regular multiorbits

On a coadjoint orbit O ⊂ 𝔤^∧ put `σ_ξ(ad*_x ξ, ad*_y ξ) = [x,y]ξ / i`; under ξ = iν this is the Kirillov–Kostant–Souriau form `ν([x,y])` of HamiltonianReduction R2. For dim O = 2d let `ω_O = σ^d/(d!(2π)^d)`, the normalized symplectic measure, with the symplectic orientation; it is `(2π)^{−d}` times the Liouville measure of ConvexityToric T4 (NV21 §6.1, pp. 41–42). An orbit is regular if it has maximal dimension among coadjoint orbits; its parameter need not be regular semisimple. A regular multiorbit is a finite union of regular orbits in one fibre of `𝔤^∧ → [𝔤^∧]`; the empty union is allowed, and its measure is the sum of the orbit measures (NV21 §6.1, p. 42; §11.1, p. 83).

- For t > 0 and the dilation `m_t(ξ) = tξ`, `(m_t)_* ω_O = t^{−d} ω_{tO}`, equivalently `∫_O f(x) dω_O = t^{−d} ∫_{tO} f(t^{−1}x) dω_{tO}` for compactly supported f on 𝔤^∧ (NV21 (6.1), p. 42; the test function there lives on 𝔤^∧, correcting the printed domain 𝔤).
- `ω_O` is invariant under the coadjoint action.
- The measure of a disjoint union of regular orbits in one fibre is the sum of their measures.
- The number of regular orbits in one fibre of `𝔤^∧ → [𝔤^∧]` is bounded by a constant depending only on G (NV21 §6.1, p. 42).
- `ω_O` extends to a Radon measure on 𝔤^∧ (§3.2).

*Needs:* §0.1, §2.1; SymplecticGeometry HamiltonianReduction R2 (KKS form) and ConvexityToric T4 (Liouville measure); LieGroups Layer 1.

**Checks.**

- An abelian coadjoint orbit is a point, d = 0, and its measure is the unit point mass.
- In 𝔰𝔩₂(ℝ), identified with its dual by the trace form, the nilcone `a² + bc = 0` minus 0 has two components; each is a regular nilpotent orbit of dimension 2, regular although its parameter [0] is not regular semisimple.
- For a two-dimensional orbit, the pushforward of `ω_O` under dilation by t is `t^{−1} ω_{tO}`: the exponent is d = 1, not dim O = 2. For the SO(3) sphere of radius r, `ω_O` has mass 2r and the dilated sphere has mass `2tr = t^d · 2r`.
- The empty multiorbit has measure 0, and is the vague limit of the point orbits `{in}` of ℝ as n → ∞.

### 3.2 Local finiteness of orbital measures

For a real reductive group, the normalized measure of every coadjoint orbit is locally finite on 𝔤^∧: every compact set has finite mass, so every compactly supported continuous function is absolutely integrable. Each fibre of `𝔤^∧ → [𝔤^∧]` is a union of finitely many coadjoint orbits, their number bounded independently of the fibre (NV21 §6.1, p. 42, and §11.1, p. 83, attributing local finiteness to Ranga Rao and the uniform finiteness to Kostant and Whitney).

*Proof route.* Transport by an invariant nondegenerate form to adjoint orbits and apply Ranga Rao's theorem on orbital integrals (rangarao72), converting its invariant measure to the KKS normalization of §3.1. The fibre count has two inputs, both background cited by locator. Over ℂ: by Jordan decomposition, the fibre of the adjoint quotient χ over λ consists of the elements whose semisimple part lies in the closed orbit of one semisimple element s and whose nilpotent part is a nilpotent element of the reductive centralizer `𝔤^s`; its `G(ℂ)`-orbits correspond to the nilpotent orbits of that centralizer, which are finite in number, and only finitely many centralizers `𝔤^s` occur up to conjugacy, so every fibre is a finite union of `G(ℂ)`-orbits with a bound depending only on G (kostant63, Theorem 3 and Remark 16, as cited at NV21 §6.1, p. 42). Over ℝ: the real points of a complex orbit O meeting 𝔤 form a semialgebraic set on which the `G(ℝ)`-orbits are open, hence unions of its connected components, and a real algebraic set has finitely many connected components, their number bounded in terms of its degree data; so the real fibre is a finite union of `G(ℝ)`-orbits with a bound depending only on G (whitney57, §3, as cited at NV21 §6.1, p. 42). For one fixed fibre, finiteness of the components alone is at the pin: a cylindrical algebraic decomposition on whose cells the defining polynomials are sign-invariant exists (`TauCeti.exists_isCAD_signInvariant`), has finitely many cells (`TauCeti.IsCAD.finite`), each connected (`TauCeti.IsCAD.isConnected`), and a set defined by sign conditions on those polynomials is a union of its cells; the bound uniform in the fibre is Whitney's.

*Needs:* §3.1; NilpotentOrbits N1.1 (the quotient map χ) and N2.2 (finiteness of the nilpotent orbits of a complex semisimple Lie algebra, applied to the derived algebra of each centralizer); kostant63, Theorem 3 and Remark 16, and whitney57, §3 (background, cited by locator); Tau Ceti `TauCeti.exists_isCAD_signInvariant`, `TauCeti.IsCAD.finite`, `TauCeti.IsCAD.isConnected` (`TauCeti/Geometry/RealAlgebraic/CAD/`).

**Checks.**

- For an abelian group every orbit is a point of mass 1.
- The regular nilpotent orbit of SL₂(ℝ) is not closed (its closure contains 0) and has infinite total mass, but finite mass on every compact set: local finiteness, not finite volume, is the assertion.
- For 𝔰𝔩₂ with the quotient `q(a, b, c) = a² + bc` on `[[a, b], [c, −a]]`: over ℂ the fibre over 0 is {0} together with the regular nilpotent orbit, two orbits, and the fibres over 1 and over −1 are one orbit each. Over ℝ the fibre over 0 is {0} and the two real regular nilpotent orbits, three `SL₂(ℝ)`-orbits, since the `GL₂(ℝ)`-centralizer `{a + bE₁₂}` of `E₁₂` has determinant `a² > 0`; the fibre over 1 is one orbit, since the centralizer of diag(1, −1) contains diag(1, −1) of determinant −1; and the fibre over −1 is two orbits, since J = `[[0, 1], [−1, 0]]` and −J are conjugate only through determinant −1 (the centralizer `{a + bJ}` has determinant `a² + b² > 0`). The uniform bounds are 2 over ℂ and 3 over ℝ; a count read off from the complex fibre alone would miss the real splitting, and a statement about the nilcone alone would say nothing about the fibres over ±1.

### 3.3 Rossmann's character formula

For an irreducible tempered representation π of a real reductive group G there is a unique nonempty regular coadjoint multiorbit `O_π` with `[O_π] = λ_π` such that, on a fixed neighbourhood of 0 in 𝔤 independent of π, `θ_π(exp x) j(x)^{1/2} = ∫_{O_π} e^{xξ} dω(ξ)` as distributions, θ_π the Harish-Chandra character. If λ_π is regular, `O_π` is a single orbit. The identity is independent of the choice of Haar measures, and the orbital Fourier transform is understood distributionally (NV21 Theorem 6.1 and Remark 6.2, pp. 43–44, citing Rossmann).

*Proof route.* Rossmann's theorem (rossmann78) with the KKS normalization of §3.1 and the Harish-Chandra ρ-normalization of §2.1; the single-orbit assertion uses the regular-character classification.

*Needs:* §2.1, §3.1, §3.2; EndoscopicTransferAndUnitaryTraceComparison §2.3(a)–(b) (trace-class convolution and the locally integrable character Θ_π = θ_π); AutomorphicFormsOnReductiveGroups §2.4 (tempered representations).

**Checks.**

- For ℝ and `e^{itx}`, `O_π = {it}` and the formula reads `e^{itx} = e^{x·it}`: the character is the Fourier transform of the unit point mass at it.
- At x = 0 the formula gives `dim π = ω(O_π)` for compact G; for the spin-l representation of SO(3) this is `2l + 1 = 2r` with `r = l + 1/2`, so the orbit is the sphere through `λ + ρ`, not through the highest weight λ, whose sphere has mass 2l.
- Omitting `j^{1/2}` changes the second-order term: for SU(2), `j(x)^{1/2} = sin(|x|/2)/(|x|/2)`, and `θ_π(exp x)` is `sin((2l+1)|x|/2)/sin(|x|/2)` while `∫_{O} e^{xξ}dω = sin(r|x|)·2/|x|` with r = l + 1/2; the two sides agree only with the factor.

### 3.4 The weak topology of regular multiorbits

Topologize the set of regular multiorbits, including the empty one, by `O ↦ ω_O` into the locally finite Radon measures on 𝔤^∧ with the weak-∗ topology against compactly supported continuous functions. For an h-dependent family π(h) of tempered representations, a limit orbit is a regular multiorbit O with `hO_{π(h)} → O` in this topology; it is not defined by choosing representatives `ξ_h`. For λ ∈ [𝔤^∧] the full regular-fibre measure `ω_λ` is the sum of the measures of all regular orbits in the fibre over λ, and 0 if there are none (NV21 §11.2, pp. 83–84; §11.4, pp. 85–86).

- O_j → O if and only if `∫ f dω_{O_j} → ∫ f dω_O` for every compactly supported continuous f.
- `ω_λ` is a finite sum, by the uniform fibre count of §3.2.
- A family has limit O exactly when its rescaled orbital measures converge weakly to ω_O; the topology is Hausdorff, so a limit orbit is unique.
- Mass escaping every compact set gives the empty limit, of measure 0.

*Needs:* §3.2.

**Checks.**

- For a fixed spin-l representation of SU(2), `hO_π` is the sphere of radius `h(l + 1/2)` with mass `h(2l + 1)`, which tends to 0 as h → 0: the family converges to the empty multiorbit. For the character `e^{imθ}` of U(1), `hO_π = {ihm}` has mass 1 for every h and converges to the point orbit {0}, of mass 1. Both parameter families tend to 0 in the quotient, and the limits differ: the topology is on the measures, and a topology through the parameters alone could not separate them.
- The point masses at `in ∈ i ℝ = (ℝ)^∧`, n → ∞, converge to 0, the empty multiorbit; excluding the empty multiorbit would leave this sequence without a limit.
- Point masses alternating between i and `2i` have no limit along the full sequence, while each parity converges.

### 3.5 Regular orbit continuity

Let O_j be regular multiorbits and O the set of limits of sequences `ξ_j ∈ O_j` that are regular. (i) If O_j has a nonempty limit, that limit is O. (ii) If O is nonempty and contains every regular subsequential limit, then O is a regular multiorbit and `O_j → O`. The full-fibre measures `ω_λ` depend continuously on λ, and near a regular point `ξ₀` the restriction of `ω_{G·ξ}` to a small neighbourhood varies continuously with ξ (NV21 Theorem 11.1 and Lemmas 11.2–11.3, pp. 83–85).

*Proof route.* Continuity of `ω_λ` is Rossmann's (NV21 Lemma 11.2, citing Rossmann's lemma D and Harish-Chandra); the differential of `𝔤^∧_reg → [𝔤^∧]` is surjective at every regular element (Kostant): over ℂ this is the principal slice of FormalConnectionsOpers F4.3 transported by equivariance, and over ℝ surjectivity of the real differential is equivalent to that of its complexification, central affine factors included; this gives local orbit charts; positivity and `ω_{O_j} ≤ ω_{λ_j}` control the mass outside the regular set.

*Needs:* §2.1, §3.4; FormalConnectionsOpers F4.3 (principal slice and the differential of the adjoint quotient at regular elements).

**Checks.**

- Alternating sequences: each parity has its own limit and the full sequence has none, so (ii) does not apply.
- If some subsequence has a regular limit point outside O, the hypothesis of (ii) fails, and indeed the limit measure would carry that extra point.
- For 𝔰𝔩₂ the quotient map is `q(a, b, c) = a² + bc` with differential `(2a, c, b)`; it is nonzero at the regular semisimple point diag(1, −1) and at the regular nilpotent `E₁₂`, and vanishes only at 0, the one nonregular element. A supplier statement limited to regular nilpotent elements would not cover diag(1, −1).

### 3.6 Uniform orbital decay and nilpotent limits

For every ε > 0, `sup_O ⟨[O]⟩^ε ∫_O ⟨ξ⟩^{−d−ε} dω_O < ∞` over nonempty regular multiorbits O, 2d the regular orbit dimension. For every compactly supported continuous f, `sup_O |∫_O f dω_O| ≤ C_f`; this is uniform local mass control, not a bound on total volume. For a fixed tempered π, `hO_π` converges to a regular nilpotent multiorbit, possibly empty; it is nonempty exactly when π has maximal Gelfand–Kirillov dimension, and, for quasi-split G, exactly when π is generic (NV21 Lemmas 11.4–11.6, pp. 85–86).

*Proof route.* Uniform local mass from continuity of `ω_λ` on the compact image of supp f (§3.5); dyadic shells and the dilation law of §3.1 give the weighted bound with exponent d. The nilpotent limit and its characterization use Barbasch–Vogan and Rossmann on asymptotic cycles of characters and Kostant on Whittaker models (barbasch-vogan80, rossmann78, kostant78), with Casselman's comparison of smooth vectors.

*Needs:* §3.1, §3.5; AutomorphicFormsOnReductiveGroups §2.4 and §2.7.

**Checks.**

- For a point orbit at it, the bound is `⟨t⟩^{−ε}` up to the constant.
- In dimension 2d the dyadic shell `A ≤ |ξ| ≤ 2A` has mass `O(A^d)` uniformly over regular multiorbits, by the dilation law and uniform local mass; the shell can be empty, as for the SO(3) sphere of radius r and A > r. The integrand `⟨ξ⟩^{−d−ε}` then contributes `O(A^{−ε})` per shell, while with 2d in place of d the bound per shell would be `O(A^{d−ε})`, and the dyadic sum would not converge.
- For compact SU(2) and a fixed spin-l representation, `hO_π` is the sphere of radius `h(l + 1/2)` with mass `h(2l + 1) → 0`: the limit is the empty multiorbit, as it must be since a compact group has no regular nilpotent elements. For the quasi-split group Sp₄(ℝ), a holomorphic discrete series has Gelfand–Kirillov dimension 3 < 4, is not generic, and also has the empty limit; every infinite-dimensional irreducible of SL₂(ℝ), by contrast, is generic.

### 3.7 The uniform orbit trace expansion

Let π be an irreducible tempered representation of G, possibly depending on h, 2d the regular orbit dimension, N > d even, 0 ≤ δ < 1 and `a ∈ S^{−N}_δ`. Then `|tr Op_h(a)| ≤ C h^{−d}⟨hλ_π⟩^{d−N}` and `h^d tr Op_h(a) = ∫_{hO_π} a dω + O(h^{1−δ}⟨hλ_π⟩^{d−N−1})`. For Schwartz symbols there are constant-coefficient differential operators D_j on 𝔤^∧, homogeneous of degree j with `D_0 = 1`, such that `h^d tr Op_h(a) = Σ_{j<J} h^j ∫_{hO_π} D_j a dω + O(h^{(1−δ)J}⟨hλ_π⟩^{−L})` for every J and L. If a is fixed and `hO_π → O`, then `h^d tr Op_h(a) → ∫_O a dω`. Constants are uniform in π and h and depend continuously on a (NV21 Theorem 6.3, pp. 44–45; Theorem 12.2 and §12.3, pp. 88–90; the exponent d is half the maximal orbit dimension, correcting the wording on p. 43).

*Proof route.* By §3.3, `tr Op(a) = ∫_{O_π} (j^{−1/2} χ a^∨)^∧ dω`, and by homogeneity `tr Op_h(a) = h^{−d} ∫_{hO_π} (j_h^{−1/2} χ_h a^∨)^∧ dω` (NV21 (6.3)–(6.4), p. 44): the multiplier is `χ/√j`, not χ. Expand it by §1.7, giving the D_j; bound remainders by §3.6, keeping the weight `⟨hλ_π⟩`; for the limit use §3.4 with the uniform tails.

*Needs:* §1.7, §1.10, §3.3, §3.4, §3.6; VonNeumannAlgebras V4.Core (trace).

**Checks.**

- For a character of ℝ, d = 0 and `tr Op_h(a) = a(iht) + O(h^∞)`.
- The D_j have pure degree j, so `D_j(a_h) = h^j (D_j a)_h`; an inhomogeneous `D_1 = ∂ + 1` would break the scaling.
- For the spin-l representation of SU(2) and a fixed a, `h^1 tr Op_h(a)` with h = 1/(l + 1/2) tends to the integral over the unit sphere with mass 2, consistent with `dim π · h = 2r h = 2`.

### 3.8 Smooth trace ideals

For p = 1, 2, ∞ let `T_p(π)` be the space of operators T on π such that every iterated commutator `θ_u(T)` is bounded on π and lies in the Schatten class S_p (trace class, Hilbert–Schmidt, bounded), with the seminorms `‖θ_u(T)‖_p` (NV21 §12.1, p. 87). `T_∞ = Ψ^0`. These refine the Schatten families of OperatorIdeals by commutators; no singular-value or trace construction is repeated.

- Forgetting commutators gives a continuous inclusion into S_p.
- The word-u seminorm is `‖θ_u(T)‖_p`.
- Adjunction preserves T_p continuously.
- On T_1 the trace is the Hilbert-space trace of VonNeumannAlgebras V4.Core.
- Finite-rank operators built from smooth vectors lie in every T_p.

*Needs:* §0.3; OperatorIdeals Parts B–C; VonNeumannAlgebras V4.Core.

**Checks.**

- For smooth u, v the rank-one operator `w ↦ ⟨w, v⟩u` has trace `⟨u, v⟩` and trace norm `‖u‖‖v‖`, and its commutators are again finite rank with smooth vectors.
- The identity on an infinite-dimensional π has all commutators 0 but lies in neither T_1 nor T_2.
- For a finite-dimensional trivial representation T_p is the whole finite-dimensional Schatten class.

### 3.9 Uniform smoothing trace-ideal estimates

For N even and large enough in terms of G: `Ψ^{−N}(π)` maps continuously into `⟨λ_π⟩^{d−N} T_1` uniformly over tempered π, with `‖T‖₁ ≤ C⟨λ_π⟩^{d−N}‖T‖_{π^0 → π^N}`. For `Δ_h = 1 − h²Σ dπ(x)²`, `‖Δ_h^{−1}‖ ≤ 1` and `tr Δ_h^{−N/2} ≤ C h^{−d}⟨hλ_π⟩^{d−N}`. For `a ∈ S^{−N}_0`, `Op_h(a)` has trace norm `≪ h^{−d}⟨hλ_π⟩^{d−N}` and Hilbert–Schmidt norm `≪ h^{−d/2}⟨hλ_π⟩^{(d−N)/2}`. For each 0 ≤ δ < 1/2 and N large, `‖Op_h(a)‖₁ ≤ C h^{−d}` for bounded families in `S^{−N}_δ`. For bounded Schwartz tuples, `h^d Op_h(a₁)⋯Op_h(a_k) ∈ ⟨hλ_π⟩^{d−N} T_1` and differs from `h^d Op_h(a₁⋯a_k)` by an element of `h⟨hλ_π⟩^{d−N} T_1`. If `‖Ad(g)‖ ≤ h^{−1+ε}`, then `h^d Op_h(g·a) − h^d π(g)Op_h(a)π(g)^{−1} ∈ h^∞⟨hλ_π⟩^{d−N} T_1` for bounded `S^m_0` families of fixed finite order. Sufficiently negative orders are trace class for nontempered irreducible representations too, without the tempered weights (NV21 Theorem 6.3(ii)–(iii) and Remark 6.4, pp. 44–45; Lemma 12.1 and Theorem 12.2(ii)–(vii), §§12.2–12.3, pp. 87–90).

*Proof route.* For N even, build an approximate inverse of `Δ_h^N`, an operator of order 2N, from the square of the quantized order −N symbol: `Δ_h^N Op_h(⟨ξ⟩^{−N})² ∈ 1 + hΨ^{−1}`, with inverse of operator norm O(1) for small h (NV21 Lemma 12.1, p. 87); the same composition formula gives `Δ_h^{N/2} Op_h(⟨ξ⟩^{−N/2})² ∈ 1 + hΨ^{−1}`, the form used for `tr Δ_h^{−N/2}` (proof of NV21 Theorem 12.2(ii), p. 89). Invert the bounded `1 + O(h)` error and bound `tr Δ_h^{−N/2}` by positivity and §3.7. Factor order −N operators through `Δ^{−N/2}` and use `|tr(AB)| ≤ ‖A‖‖B‖₁`; Hilbert–Schmidt bounds come from `T*T`. Products and near-covariance use §1.12 and §1.11 with one more order and enough powers of h.

*Needs:* §1.11, §1.12, §3.7, §3.8; §0.6; VonNeumannAlgebras V4.Core (trace); AutomorphicSpectralTheory §0.9 (the Hilbert–Schmidt product bound).

**Checks.**

- `‖Δ_h^{−1}‖ ≤ 1` since `Δ_h ≥ 1`; trace growth is `h^{−d}` and Hilbert–Schmidt growth `h^{−d/2}`, the Weyl-law count of states in a fixed region of a 2d-dimensional orbit at scale h.
- The identity on an infinite-dimensional irreducible tempered π has vanishing commutators and is not trace class, so by the first assertion it is not in any `Ψ^{−N}` with N large: it has order 0 and is not smoothing.
- For G = ℝ, N = 2 and the character of frequency t = 1/h: `Δ_h^N = (1 + h²t²)² = 4` and `Op_h(⟨ξ⟩^{−N})² = ⟨ht⟩^{−4} = 1/4`, product 1, as membership in `1 + hΨ^{−1}` requires; the half-order form gives `Δ_h^{N/2} Op_h(⟨ξ⟩^{−N/2})² = 2 · 1/2 = 1` as well; dropping the square, `Δ_h^N Op_h(⟨ξ⟩^{−N}) = 4 · 1/2 = 2`, which is not `1 + O(h)`: the orders `2N − 2N = 0` and `N − N = 0` both close, and the square is what the lemma uses.

### Examples

For SU(2), `O_π` for the spin-l representation is the sphere of radius `l + 1/2` with mass `2l + 1 = dim π`, and `h^d tr Op_h(a)` with `h = (l + 1/2)^{−1}` and d = 1 converges to the integral of a over the unit sphere. For ℝ, point orbits at it with ht fixed converge to a point, while with t fixed they converge to the point 0 and with `ht → ∞` to the empty multiorbit.

### Dependencies

Layers 0–2; SymplecticGeometry HamiltonianReduction R2 and ConvexityToric T4; NilpotentOrbits N1.1 and N2.2; FormalConnectionsOpers F4.3; OperatorIdeals Parts B–C; VonNeumannAlgebras V4.Core; AutomorphicSpectralTheory §0.9; EndoscopicTransferAndUnitaryTraceComparison §2.3; AutomorphicFormsOnReductiveGroups §§2.4 and 2.7; Tau Ceti `TauCeti.exists_isCAD_signInvariant`, `TauCeti.IsCAD.finite`, `TauCeti.IsCAD.isConnected`; kostant63 and whitney57 by locator.

## Layer 4: Uniform Plancherel bounds and local relative characters

Uniform K-type and matrix-coefficient bounds, uniform Sobolev summability of the Plancherel formula, its extension to Ξ-integrable test functions, and the local relative characters of GGP pairs with their Plancherel disintegration and joint spectral localization. In this layer G is a reductive group over a local field F of characteristic zero; archimedean statements use the Lie-group notation of Layers 0–3.

### 4.1 Uniform K-type and matrix-coefficient bounds

Let F be archimedean with maximal compact K. Choose an Ad(K)-invariant positive definite inner product on 𝔨 and let B(𝔨) be an orthonormal basis for it; for L large put `κ = (1 − Σ_{x∈B(𝔨)} x²)^L ∈ U(𝔨)`, which is then Ad(K)-invariant. The basis B of the Nelson operator in §0.2 stays arbitrary; changing it changes the Sobolev norms by bounded factors only. Then κ acts on each irreducible K-type τ by a scalar `κ_τ ≥ 1` with `dim τ ≤ κ_τ^{1/2}` and `Σ_τ κ_τ^{−1} < ∞`. For every irreducible admissible π, `π(κ)` is positive and invertible and `tr π(κ)^{−2} ≤ C` with C depending only on G; a τ-isotypic vector v satisfies `dim(K·v)^{1/2} ‖v‖ ≤ ‖π(κ)v‖`, the dimension of the K-span counting multiplicity. For tempered π and smooth u, v, `|⟨π(g)u, v⟩| ≤ c Ξ_G(g) ‖u‖_s ‖v‖_s` with c and s depending only on G (NV21 Lemmas A.1–A.2 and §A.2, pp. 136–138; the source's explicit κ = −c Σ x², a positive multiple of the K-Casimir, vanishes on the trivial K-type, so π(κ) is not invertible on representations with K-fixed vectors; moreover, when K has rank ≥ 2 the sum `Σ_τ κ_τ^{−1}` diverges for it, and when K has two or more positive roots `κ_τ^{1/2}` does not dominate dim τ for any c; a high power of `1 − Σx²` has all three properties).

*Proof route.* The highest-weight dimension formula and the Casimir eigenvalue give `dim τ ≪ |μ_τ + ρ_K|^{dim n}` and `κ_τ ≍ (1 + |μ_τ + ρ_K|²)^L`; choose L so that both domination and summability hold. Uniform admissibility `dim Hom_K(τ, π) ≤ C dim τ`, with C depending only on the component group of G, bounds the K-span. Expand K-finite vectors in K-types, apply the Cowling–Haagerup–Howe bound to each pair and sum by weighted Cauchy–Schwarz; pass to smooth vectors by continuity and the Sobolev comparison of §0.2.

*Needs:* §0.2; CompactGroups Layers 5–6; LieHighestWeight Layers 5–6; AutomorphicFormsOnReductiveGroups §§2.2–2.3 (uniform admissibility); AutomorphicSpectralTheory gap:tempered-xi-bounds.

**Checks.**

- The trivial K-type has `κ_τ = 1 > 0`, whereas a positive multiple of the K-Casimir `−c Σ x²` vanishes on it, so `π(κ)` would not be invertible on representations with K-fixed vectors.
- For K = SO(3) with an orthonormal basis, `κ_τ = (1 + l(l+1))^L` on the type of dimension 2l + 1. L = 1 fails `dim τ ≤ κ_τ^{1/2}` already at l = 1 (`3 > √3`); L = 2 gives `(1 + l + l²)² ≥ (2l + 1)²` for every integer l ≥ 0, with equality at l = 0, 1, and `Σ_l (1 + l + l²)^{−2} < ∞`.
- For K a torus of rank r the types are characters with `dim τ = 1` and summability needs `2L > r`.
- The invariant inner product is needed: for K = SO(3) on its standard representation, the rotation basis `(X₁, X₂, X₃)` gives `1 − ΣX_i² = 3·1`, while the rescaled basis `(2X₁, X₂, X₃)` gives `diag(3, 6, 6)`, not a scalar on this irreducible K-type, so its powers do not act by scalars on K-types.

### 4.2 Uniform Plancherel–Sobolev summability

There is N, depending only on the real reductive group G, with `sup_π tr π(Δ^{−N}) < ∞` over all irreducible unitary π, tempered or not, and `∫ tr π(Δ^{−N}) dμ(π) < ∞` over the tempered dual with Plancherel measure μ. For a p-adic group and compact open U, `∫ dim π^U dμ(π) = vol(U)^{−1}`, in particular finite (NV21 Lemma A.3 and §A.4, pp. 138–139).

*Proof route.* Compare `Δ^{−N}` with `π(κ)^{−2}` through the bounded operator `π(κ)²π(Δ^{−N})` for N above twice the degree of κ (§4.1). For the integral, put `b = ⟨ξ⟩^{−N}` and `T_π = Op_h(b)* Op_h(b) = Op_h(b)²` (b is real and the cutoff even, §0.5); this square, not `Op_h(b)` itself, is positive. By §1.12 it is elliptic of order −2N, so `tr π(Δ_h^{−N}) ≪ tr T_π` uniformly in tempered π for h small (the printed proof of NV21 Lemma A.3, p. 139, compares with `Δ^{−2N}`; the orders give `Δ^{−N}`), and by §1.12 and §0.6 `T_π = π(f* ∗ f)` with f compactly supported and n times differentiable. Apply the Plancherel formula, which extends to such functions, to `f* ∗ f`: `∫ tr π(f* ∗ f) dμ(π) = (f* ∗ f)(1) = ‖f‖²_{L²}`. At p-adic places apply the Plancherel formula to `vol(U)^{−1}1_U`, whose integrated action is the orthogonal projection onto `π^U`.

*Needs:* §0.6, §1.12, §4.1; AutomorphicSpectralTheory gap:local-plancherel; SmoothRepresentationsOfLocalGroups SR.1.1 (the idempotent e_U).

**Checks.**

- For a compact group with probability Haar measure the Plancherel measure gives mass dim π to π, and `∫ dim π^U dμ = Σ_π dim π · dim π^U = vol(U)^{−1}` is the count of `L²(G/U)`, e.g. `|G/U|` for finite G.
- Rescaling Haar measure by c > 0 divides μ by c and multiplies `vol(U)^{−1}` by `c^{−1}`: both sides scale alike.
- The supremum over the whole unitary dual and the integral over the tempered dual are different statements: the trivial representation contributes `tr π(Δ^{−N}) = 1` to the first and has Plancherel measure 0 for noncompact G.
- A positive symbol need not quantize to a positive operator: on the characters of ℝ, `Op_h(b)` acts by the scalar `∫ χ(hx) b^∨(x) e^{ihtx} dx`, and for an admissible cutoff with a narrow plateau at 0 and most of its mass where `cos(htx) < 0` this real scalar can be negative although `b > 0` and `b^∨ > 0`; its square, the scalar of `Op_h(b)²`, is nonnegative.

### 4.3 The Ξ-integrable test space

For archimedean F, `F_Ξ(G)` is the space of smooth f on G with `∫_G |D_L D_R f(g)| Ξ_G(g) dg < ∞` for all left- and right-invariant differential operators `D_L, D_R`, with these seminorms. For p-adic F, `F_Ξ(G)` is the union over compact open U of the bi-U-invariant f with `∫ |f| Ξ_G < ∞`, with the inductive limit topology (NV21 §A.5 and (A.5), pp. 139–140).

- Left and right differentiation act continuously on `F_Ξ`.
- Smooth compactly supported functions are dense in `F_Ξ`.
- Evaluation at each point of G is continuous.
- For tempered π and smooth u, v, `∫ f(g)⟨π(g)u, v⟩ dg` converges absolutely: at archimedean places by the final assertion of §4.1, and at nonarchimedean places by gap:tempered-xi-bounds, since smooth vectors are K-finite and, at a fixed level U, `dim K·u` and `dim K·v` are bounded, so the integral is at most a constant times `∫ |f| Ξ_G`.
- At a fixed p-adic level U, `F_Ξ` is the weighted ℓ¹ space on `U\G/U` with weight Ξ times the double-coset volume.

*Needs:* §0.2, §4.1; AutomorphicSpectralTheory §0.14 (vector-valued Schwartz spaces) and gap:tempered-xi-bounds (Ξ and the coefficient bound, archimedean and nonarchimedean).

**Checks.**

- Every smooth compactly supported function lies in `F_Ξ` and has its usual integrated action.
- On ℝ (Ξ = 1) membership requires integrability of every derivative, not only `f ∈ L¹`: `f(x) = (1 + x²)^{−1} sin(x³)` is integrable with a nonintegrable derivative.
- Bounds on f alone do not control the right derivatives needed to move powers of Δ from both vectors in §4.4.
- For a finite group at singleton level, `F_Ξ` is the whole space of functions.

### 4.4 The Plancherel formula for Ξ-integrable functions

For tempered irreducible π and `f ∈ F_Ξ(G)` there is a unique continuous `π(f) : π^∞ → π^∞` with `⟨π(f)u, v⟩ = ∫ f(g)⟨π(g)u, v⟩ dg`; `f ↦ π(f)` is continuous into the trace class; `f ↦ ∫ ‖π(f)‖₁ dμ(π)` over the tempered dual is finite and continuous; and `f(1) = ∫ tr π(f) dμ(π)` holds for all `f ∈ F_Ξ` (NV21 Lemma A.4, pp. 140–141).

*Proof route.* Move `Δ^{2N}` onto f from both sides (`f ↦ Δ^{2N} ∗ f ∗ Δ^{2N}`) to bound the pairing by a continuous seminorm of f times `‖Δ^{−N}u‖ ‖Δ^{−N}v‖`; sum over an orthonormal basis using §4.2; repeat after differentiating to obtain smooth outputs. Pass the Plancherel identity to the limit from compactly supported f using integrated trace-norm continuity; weak convergence of coefficients alone does not suffice.

*Needs:* §4.2, §4.3; VonNeumannAlgebras V4.Core (trace) and gap:local-plancherel.

### 4.5 Local relative characters

Let (G, H) be a GGP pair over F with Haar measures fixed, and π, σ tempered irreducible unitary representations of G and H. Define `H_σ(v₁ ⊗ v̄₂) = Σ_{u ∈ B(σ)} ∫_H ⟨π(s)v₁, v₂⟩⟨u, σ(s)u⟩ ds` for smooth v₁, v₂, B(σ) an orthonormal basis of K_H-isotypic vectors (NV21 Lemma 18.1(i), p. 121). The integrals converge absolutely because `∫_H Ξ_G|_H Ξ_H < ∞` (NV21 (18.1), p. 121).

- On rank-one operators, `H_σ(v₁ ⊗ v̄₂) = tr σ̄(f) = tr σ(f ∘ inv)` for `f(s) = ⟨π(s)v₁, v₂⟩`, which lies in `F_Ξ(H)`, σ̄ being the conjugate representation: the definition pairs f with `⟨u, σ(s)u⟩ = conj⟨σ(s)u, u⟩ = ⟨σ(s^{−1})u, u⟩` (correcting `tr σ(f)` in NV21 (18.6), p. 122).
- `H_σ` is independent of the orthonormal basis.
- `H_σ` is invariant under conjugation by H, `H_σ(π(s)Tπ(s)^{−1}) = H_σ(T)`, and on smoothing operators it factors through an H × H-equivariant map `Ψ^{−∞}(π) → Ψ^{−∞}(σ)` followed by the trace, which is invariant under the diagonal conjugation action. It is not invariant under independent left and right translations.
- For F archimedean and N large in terms of G, `H_σ` extends to `Ψ^{−N}(π)` continuously, uniformly in π and σ, by `H_σ(T) = Σ_u ∫_H tr(π(s)T)⟨u, σ(s)u⟩ ds` (NV21 Lemma 18.1(iii), p. 121).
- `H_σ(T*) = conj(H_σ(T))`: the form is Hermitian. Its nonnegativity on positive operators is not part of the construction; at p-adic places it is the input gap:relative-character-positivity, and at archimedean places it is not used (NV21 Remark 18.2, p. 122).
- The rank-one value `H_σ(v₁ ⊗ v̄₂)` is, up to the sum over the basis, the local period form of the supplier: GanGrossPrasadUnitaryGroups §3.3 at a place where E is a field, §5.1a at a place where E splits (there `(G, H) = (GL_{n+1}, GL_n)`), gap:orthogonal-local-period-form for orthogonal pairs. In each case the form is nonzero exactly when `Hom_H(π ⊗ σ̄, ℂ) ≠ 0`.
- For a unitary pair, the local relative character `J_{σ_v}(f₁ ⊗ f₂) = ∫_H tr(π(s)π(f₁)) tr(σ(s)σ(f₂)) ds` of GanGrossPrasadUnitaryGroups §6.2 evaluates the σ-side on `σ(f₂)` for a test function f₂ on H; `H_σ(π(f₁))` evaluates it on the conjugate representation itself, `Σ_u ⟨u, σ(s)u⟩ = tr σ̄(s)` summed over an orthonormal basis, which no test function f₂ realizes. The two are different functionals with the same H-integral, and §4.5 states only the operator form.

**Nontempered σ.** For a nontempered irreducible unitary σ of H the integral need not converge, and `H_σ` is instead the auxiliary form `H_σ(v₁ ⊗ v̄₂) = ⟨ℓ_σ(v₁), ℓ_σ(v₂)⟩` for a continuous H-intertwiner `ℓ_σ : π^∞ → σ^∞`, chosen nonzero whenever a nonzero one exists; by local multiplicity one such an `ℓ_σ` is unique up to a scalar, so `H_σ` is zero exactly when `Hom_H(π^∞, σ^∞) = 0` and is otherwise determined up to a positive real factor (NV21 §20, pp. 142–143). Extended linearly to finite-rank smooth operators it is Hermitian, nonnegative on positive operators, invariant under conjugation by H, and factors through the H × H-equivariant map `T ↦ ℓ_σ T ℓ_σ^*` into `Ψ^{−∞}(σ)` followed by the trace; each use (§§7.2, 7.6, 9.1, 9.5) fixes its scale so that this factorization is h-uniformly continuous, and every statement made about it is homogeneous in that scale. It is an auxiliary normalization, not the tempered integral, and no expansion of Layer 6 applies to it.

*Needs:* §3.9, §4.3, §4.4; GanGrossPrasadUnitaryGroups §2.6 (multiplicity one, for the uniqueness of `ℓ_σ`), §2.7 (unitary convergence), §3.3 and §5.1a (the local period form at nonsplit and at split places); gap:orthogonal-multiplicity-one, gap:orthogonal-xi-integrability and gap:orthogonal-local-period-form (orthogonal multiplicity one, convergence and form).

**Checks.**

- For compact H with probability Haar measure, `H_σ(T) = (dim σ)^{−1} tr(T|_{π[σ]})`, where `π[σ]` is the σ-isotypic part of π, multiplicity included; for an irreducible σ of dimension 2 occurring once, a projection onto one vector of `π[σ]` has `H_σ = 1/2`, and a convention without the factor would give 1.
- For trivial H with mass 1 and its trivial σ, `H_σ(T) = tr T`.
- Multiplying the Haar measure of H by c multiplies `H_σ` by c and divides the Plancherel measure of H by c, leaving §4.6 unchanged.
- Hermitian symmetry alone does not imply nonnegativity: the form `(z₁, z₂) ↦ z₁ z̄₂ + z₂ z̄₁` on ℂ² is Hermitian and takes the value −2 at (1, −1).
- For SO(3) ⊃ SO(2) with probability Haar measure, v a unit weight-one vector of the spin-1 representation and `σ(θ) = e^{iθ}`: `f(θ) = e^{iθ}`, the definition gives `∫ e^{iθ} e^{−iθ} dθ = 1`, `tr σ̄(f) = 1`, while `tr σ(f) = ∫ e^{2iθ} dθ = 0`. For T = v ⊗ v̄, left translation alone gives `H_σ(π(θ)T) = e^{iθ}`, equal to −1 at θ = π, while conjugation leaves the value 1.
- For nontempered σ, scaling a nonzero `ℓ_σ` by c > 0 scales the auxiliary form by c²; choosing `ℓ_σ = 0` although a nonzero intertwiner exists is excluded, since the period `P_Σ(− ⊗ T′)` of §9.1 is then a nonnegative multiple of `H_σ` by multiplicity one and could not be nonzero. For SO(3) ⊃ SO(2), where every σ is tempered, the auxiliary form is never used, and the tempered definition gives `H_σ = 1` on the weight-one projector above.

### 4.6 Relative Plancherel disintegration

For tempered π and finite-rank smooth T, and for every `T ∈ Ψ^{−N}(π)` with N large in the archimedean case, `tr T = ∫ H_σ(T) dμ_H(σ)` over the tempered dual of H, with absolute convergence and uniform continuous bounds. In the archimedean case `H_σ(Op_h(a))` for `a ∈ S^{−∞}_δ`, δ < 1/2, has polynomial h-loss and arbitrary decay in `⟨hλ_π⟩` and `⟨hλ_σ⟩`, and is `O(h^N⟨hλ_π⟩^{−N}⟨hλ_σ⟩^{−N})` when every ξ ∈ supp a has `dist([ξ], hλ_π) ≥ h^δ` or `dist([ξ|_𝔥], hλ_σ) ≥ h^δ` in the generator coordinates of §2.1 (NV21 Lemma 18.1(ii)–(iii), pp. 121–122; Lemma 19.1, p. 123; §A.6, pp. 141–142).

*Proof route.* Apply §4.4 on H to `f ∘ inv` for the restricted coefficients f of finite-rank T, which has the same value `f(1) = tr T` at the identity (§4.5); extend to smoothing T by the continuous map `Ψ^{−∞}(π) → F_Ξ(H)` (NV21 §A.6), controlled by `‖Δ^N T Δ^N‖₂` and §3.9; apply §2.7 to the H × H-equivariant factorization.

*Needs:* §2.7, §4.4, §4.5.

**Checks.**

- For compact H with probability Haar measure the Plancherel mass of σ is dim σ, and `Σ_σ dim σ · (dim σ)^{−1} tr(T|_{π[σ]}) = tr T`.
- The absolute integral is bounded before sums and integrals are exchanged; for T the identity on an infinite-dimensional π neither side is defined.

### Examples

For the compact GGP pair SO(3) ⊃ SO(2) with π the spin-l representation, `H_σ` for the character `e^{imθ}` of SO(2) is the trace on the one-dimensional weight-m space, nonzero exactly for |m| ≤ l, and §4.6 is the weight decomposition `tr T = Σ_{|m| ≤ l} tr(T|_{weight m})`.

### Dependencies

Layers 0–3; CompactGroups Layers 5–6; LieHighestWeight Layers 5–6; AutomorphicFormsOnReductiveGroups §§2.2–2.3; VonNeumannAlgebras V4.Core; AutomorphicSpectralTheory §0.14, gap:local-plancherel and gap:tempered-xi-bounds; SmoothRepresentationsOfLocalGroups SR.1.1; GanGrossPrasadUnitaryGroups §§2.6, 2.7, 3.3 and 5.1a; gap:orthogonal-multiplicity-one; gap:orthogonal-xi-integrability; gap:orthogonal-local-period-form; gap:relative-character-positivity.

## Layer 5: Stable Hamiltonian reduction for GGP pairs

For orthogonal and unitary GGP pairs: the joint fibres of the coadjoint quotient, the disjoint-spectrum criterion for stability, the torsor theorem, the three compatible volume forms on stable fibres, their real normalization, uniform properness of stable orbits, the stable orbital disintegration and the scaling of complex Plancherel measure. §§5.1–5.6 are algebraic and work over an algebraically closed field k of characteristic zero; §§5.7–5.10 work over ℝ or ℂ.

### 5.1 Joint and relative coadjoint fibres

For a GGP pair define the joint quotient map `q(ξ) = ([ξ], [ξ|_𝔥])` on 𝔤^* and `O_{λ,µ} = q^{−1}(λ, µ)`, a subset of 𝔤^* with one ambient variable ξ. Over ℝ, for tempered π, σ put `O_{π,σ} = {ξ ∈ O_π : ξ|_𝔥 ∈ O_σ}` (NV21 §14.3, p. 99; §16.5, pp. 110–111, where the ambient space is printed as `𝔤^* × 𝔥^*`; §17.3, pp. 116–117). Integration over `O_{λ,µ}` is defined to be 0 unless (λ, µ) is stable (§5.2) and the fibre is nonempty; then it is the pushforward of the fixed Haar measure of H along an orbit map `s ↦ s·ξ_{λ,µ}` (NV21 §17.3.2, pp. 117–118).

- `ξ ∈ O_{λ,µ}` if and only if `[ξ] = λ` and `[ξ|_𝔥] = µ`.
- `ξ ∈ O_{π,σ}` if and only if ξ ∈ O_π and `ξ|_𝔥 ∈ O_σ`; `O_{π,σ} ⊆ O_π(λ_σ) ⊆ O_{λ_π, λ_σ}`, with equality throughout when `(λ_π, λ_σ)` is stable and `O_{π,σ}` is nonempty (NV21 (17.3), p. 117).
- H acts on both fibres by the coadjoint action.
- On a nonempty stable fibre the transported Haar measure does not depend on the base point, since H is unimodular.
- Rescaling ξ by h maps `O_{π,σ}` onto `hO_{π,σ}` and scales both parameters homogeneously.

*Needs:* §2.1, §3.1.

**Checks.**

- In the model `q(x) = x²`, `r(x) = x` on ℝ, the joint fibre over (4, 2) is {2} and over (1, 2) is empty; for the two coordinate projections of ℝ² the fibre over (3, 5) is the point (3, 5). Using independent variables for the two conditions would give the product of the separate fibres, of twice the expected dimension.
- A geometric stable fibre with no real point has relative integral 0, not the Haar mass of H.
- For SO(3) ⊃ SO(2) with V definite, the joint fibre over a stable pair with a real point is a circle, a torsor of SO(2); imposing `[ξ] = λ` and `[η] = µ` on independent variables ξ ∈ 𝔤^*, η ∈ 𝔥^* would give the whole sphere `[ξ] = λ` times points of 𝔰𝔬(2)^*, of dimension 2 rather than 1.

### 5.2 Disjoint-spectrum stability: `isStable_iff_isCoprime_orthogonal`, `isStable_iff_isCoprime_unitary`

**Theorem.** For a GGP pair over an algebraically closed field of characteristic zero and x ∈ 𝔤, the following are equivalent: (i) x is H-stable, that is, its H-orbit is closed and its stabilizer in H is finite; (ii) `ev(x) ∩ ev(x_H) = ∅` (NV21 Theorem 14.2 and Definition 14.3, p. 97). Moreover: in the stable locus the stabilizer is trivial; c ∈ ev(x) ∩ ev(x_H) if and only if x has an isotropic eigenvector in `V_H^+` with eigenvalue c or in `V_H^−` with eigenvalue −c (NV21 Lemma 14.4, p. 97); x is stable if and only if `k₁[x]e` is all of V in the unitary case and a nondegenerate subspace of codimension at most one in the orthogonal case (NV21 Lemma 14.8, p. 100); and stable pairs (λ, µ) form a dense open subset of `[𝔤] × [𝔥]`, with dense open µ-section for each λ (NV21 p. 97). The pair `(λ, µ)` is stable when `ev(λ) ∩ ev(µ) = ∅`.

On the standard models the theorem is `isStable_iff_isCoprime_orthogonal` and `isStable_iff_isCoprime_unitary`: for x skew-symmetric of size `ι ⊕ Unit` (orthogonal case), respectively an arbitrary square matrix of that size (unitary case, `H = GL_ι`), the H-orbit `{ggpBlock h · x · ggpBlock h^{−1}}` is Zariski closed and the stabilizer is finite if and only if the spectral polynomials of x and of its upper-left block are coprime. Rallis and Schiffmann proved a related equivalence (rallis-schiffmann; NV21 Remark 14.9, p. 100, which notes that their orthogonal statement needs the correction that the orthogonal Lie algebra of a one-dimensional space is 0).

*Proof route.* By the Hilbert–Mumford criterion for the linear action of H on 𝔤 (gap:hilbert-mumford-linear; NV21 p. 98 recalls it) x is unstable if and only if a nontrivial cocharacter of H has only nonnegative weights on x. An isotropic eigenvector `v ∈ V_H^+` gives such a cocharacter after completing v to a hyperbolic pair in V_H (Witt). Conversely the positive and negative weight spaces of a destabilizing cocharacter are isotropic, in duality and x-stable, giving an isotropic eigenvector. For the cyclicity criterion, `(k₁[x]e)^⊥` is a k₁[x]-stable subspace of V_H that is nondegenerate exactly when `k₁[x]e` is.

*Needs:* §2.1, §5.1; AlgebraicModuliForArithmeticGeometry gap:hilbert-mumford-linear; Tau Ceti quadratic-form Witt theorems; Mathlib `Matrix.charpoly`, `MvPolynomial.zeroLocus`, `Matrix.specialOrthogonalGroup`.

The matrix models use the following definitions.

**`IsZariskiClosedMatrixSet`.** A set of n × n matrices over k is Zariski closed if it is the common zero set of an ideal of polynomials in the entries, through Mathlib's `MvPolynomial.zeroLocus`.

- The empty set, the whole space and every finite set are Zariski closed; finite unions and arbitrary intersections of Zariski closed sets are Zariski closed.
- Preimages of Zariski closed sets under conjugation by a fixed invertible matrix are Zariski closed.
- For k = ℂ a Zariski closed set is closed in the Euclidean topology.

**Checks.**

- `{x : x₁₂ x₂₁ = 1}` is Zariski closed.
- For infinite k and n ≥ 2, `{x : x₁₂ ≠ 0}` is not Zariski closed: a polynomial vanishing on it vanishes everywhere.
- The integers, as 1 × 1 matrices over ℂ, form a Euclidean-closed set that is not Zariski closed, since a nonzero polynomial in one variable has finitely many roots.

The orthogonal model uses Mathlib's transpose-defined `Matrix.specialOrthogonalGroup` for H = SO(k^ι) and for SO(k^ι ⊕ k) (Exact supplier contracts); `ggpBlock` maps the first into the second, since `ggpBlock h` has determinant det h and `(ggpBlock h)ᵀ = ggpBlock hᵀ`.

**Checks.**

- Over ℂ, `h = [[√2, i], [−i, √2]]` has `hᵀh = 1` and det h = 2 − 1 = 1, so it lies in `Matrix.specialOrthogonalGroup` although `h*h = h² ≠ 1`; a star-based special unitary group would exclude it.
- `diag(i, −i)` is special unitary, but `hᵀh = diag(−1, −1) ≠ 1`, so it is not in the group; a star-based reading would include it.
- −1 lies in the group for size 2 and not for size 3, where det(−1) = −1; for the empty index type the group is {1}.

**`ggpBlock`.** For an ι × ι matrix h, `ggpBlock h = fromBlocks h 0 0 1`, the endomorphism of `k^ι ⊕ k` acting by h on `V_H = k^ι` and fixing the last basis vector e.

- `ggpBlock 1 = 1` and `ggpBlock (h h′) = ggpBlock h · ggpBlock h′`; its determinant is det h and it commutes with transpose.
- `(ggpBlock h · x · ggpBlock h^{−1}).toBlocks₁₁ = h · x.toBlocks₁₁ · h^{−1}`: restriction to the upper-left block intertwines the two conjugation actions, which is the statement that `x ↦ x_H` is H-equivariant.
- `ggpBlock h` fixes e and preserves V_H.

**Checks.**

- For ι empty, `ggpBlock h` is the 1 × 1 identity and H is trivial.
- For ι = Unit and h = (c) with `c ∈ k^×`, conjugating `[[a, b], [c′, d]]` by `ggpBlock h` gives `[[a, cb], [c′/c, d]]` (for c = 0 the matrix h is not invertible and there is no conjugation): the upper-left entry a is fixed and bc′ is invariant, the GL₂ example of NV21 p. 97.
- Embedding by `diag(1, h)` instead fixes the first basis vector and makes x_H the lower-right block; with the upper-left block `toBlocks₁₁` of the theorem this convention gives the wrong subgroup.

**`ggpSpectralPolynomial`.** For a square matrix x of size m, the characteristic polynomial if m is even and the characteristic polynomial divided by X if m is odd. Its roots are ev(x) in the orthogonal case.

- For skew-symmetric x of odd size, X divides `charpoly x`, so `charpoly x = X · ggpSpectralPolynomial x`.
- It is monic of degree `2⌊m/2⌋` and invariant under conjugation.
- Over an algebraically closed field, coprimality of two spectral polynomials is disjointness of their root sets.

**Checks.**

- For m = 1 and x = 0 the value is `X/X = 1`; for m = 0 it is 1.
- For `x = [[0, a], [−a, 0]]` the value is `X² + a²`; for x ∈ 𝔰𝔬₃ with off-diagonal entries a, b, c above the diagonal it is `X² + a² + b² + c²`.
- For x ∈ 𝔰𝔬₄ with vanishing Pfaffian, `charpoly x` has the root 0 while the block `x_H ∈ 𝔰𝔬₃` has the forced root 0; without removing that forced root every singular x would be declared unstable, although such x are stable as soon as the remaining eigenvalues of x_H avoid ev(x).

**Checks for the theorem.**

- For SO(3) ⊃ SO(2), with x the skew matrix with entries a (in x_H) and b, c (last column), stability is `b² + c² ≠ 0`: if `(b, c)` is a nonzero isotropic vector the orbit `{t·(b,c)}` of SO(2) ≅ G_m has 0 in its closure, and if `b = c = 0` the stabilizer is all of SO(2).
- For GL₂ ⊃ GL₁, `x = [[a, b], [c, d]]` is stable exactly when bc ≠ 0: then the orbit is the closed hyperbola `{(hb, c/h)}` with trivial stabilizer; if b = 0 ≠ c the orbit is not closed; if b = c = 0 the stabilizer is all of GL₁.
- For x = 0 and the forced zero roots: `ggpSpectralPolynomial 0 = X²` on 𝔰𝔬₃ and on 𝔰𝔬₂, not coprime, matching the infinite stabilizer.

### 5.3 Stable fibres are torsors: `stableFibre_isTorsor_orthogonal`, `stableFibre_isTorsor_unitary`

**Theorem.** Over an algebraically closed field of characteristic zero, the map `x ↦ ([x], [x_H])` from H-stable elements of 𝔤 to stable pairs is a principal H-bundle. For every stable pair (λ, µ) the fibre `O_{λ,µ}` is nonempty and is a single H-orbit with trivial stabilizers; its elements are H-stable and both x and x_H are regular. The unrestricted map `x ↦ ([x], [x_H])` is surjective, including over unstable pairs (NV21 Theorem 14.5 and Lemmas 14.6–14.7, pp. 99–100). The route to surjectivity uses the following geometric input, which is proved here: H has an open orbit with trivial stabilizer on the flag variety of G × H, equivalently a Borel subgroup of G × H acts simply transitively on an open subset of `X = (G × H)/diag H` (NV21 Lemma 13.3, p. 95, recorded there as well known). Over ℝ, for stable (λ, µ), either `O_{λ,µ}(ℝ)` is empty or it is a single H(ℝ)-orbit on which H(ℝ) acts simply transitively, consisting of H-stable regular elements; the same holds for `O(µ) = {ξ ∈ O : [ξ|_𝔥] = µ}` for a regular multiorbit O (NV21 Theorem 17.1, p. 117).

On the standard models the algebraically closed statement is `stableFibre_isTorsor_orthogonal` and `stableFibre_isTorsor_unitary`: given y of size `ι ⊕ Unit` and z of size ι (both skew-symmetric in the orthogonal case) whose spectral polynomials are coprime, the set of x (skew-symmetric in the orthogonal case) that are invariantly equivalent to y under the big group and whose upper-left block is invariantly equivalent to z under H is nonempty, stable under the H-action, and H acts simply transitively on it. Surjectivity is `jointFibre_nonempty_orthogonal` and `jointFibre_nonempty_unitary`: for arbitrary such y and z, with no coprimality hypothesis, the same set is nonempty.

*Proof route.* Open orbit: for the standard models compute the stabilizer in H of a generic pair of flags and check that the dimensions match, `dim B_G + dim B_H = dim G` (the source cites Beuzart-Plessis for this standard fact). Surjectivity (NV21 Lemma 14.6, pp. 99–100): choose a Borel B of G × H whose open orbit on X, on which it acts simply transitively, contains the base point x₀ = diag H; the fibre `T*_{x₀}X` is mapped by the moment map onto the annihilator `(diag 𝔥)^⊥ = {(ξ, −ξ_H) : ξ ∈ 𝔤^*}`, and restriction to 𝔟 is an isomorphism of this annihilator onto 𝔟^*, since `𝔟 + diag 𝔥 = 𝔤 ⊕ 𝔥` and the dimensions agree. Every functional λ on 𝔟 vanishing on its nilradical has extensions to 𝔤^* ⊕ 𝔥^* that all have the same invariants, namely the Weyl class of λ restricted to the Cartan (Chevalley restriction), so every point of `[𝔤] × [𝔥]` is attained as `([ξ], [−ξ_H])`; negate the second coordinate. An open orbit alone is not enough: the trivial stabilizer is what makes the restriction to 𝔟 bijective. For stable x the cyclicity criterion of §5.2 shows that the two characteristic polynomials determine the moments `⟨x^j e, e⟩` (Cramer's identities), so two points of one fibre have isometric cyclic spans; Witt's theorem extends the isometry, and in even orthogonal dimension the Pfaffian fixes the orientation. The induced morphism from the quotient of the stable locus to the stable pairs is surjective by Lemma 14.6 and injective by the torsor property, hence an isomorphism onto the normal variety of stable pairs by Zariski's main theorem (Mathlib `AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization`, characteristic zero); trivial stabilizers and gap:free-stable-quotient-bundle then give the principal bundle structure. Over ℝ the unique conjugator of two real points of a geometric fibre is fixed by complex conjugation.

*Needs:* §5.1, §5.2; AlgebraicModuliForArithmeticGeometry gap:free-stable-quotient-bundle; Mathlib `AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization`; Tau Ceti quadratic-form Witt theorems; NilpotentOrbits N1.1 (the quotient map `𝔤 → 𝔤//G`); FormalConnectionsOpers F4.3 (Chevalley restriction for the reductive groups G × H, central factors included).

**`InvariantlyEquivalent`.** For a set A of matrices and a set Γ of invertible matrices, x and y are invariantly equivalent if every polynomial in the entries whose restriction to A is invariant under conjugation by Γ takes the same value at x and y. With A the skew-symmetric matrices and Γ = `Matrix.specialOrthogonalGroup`, or A all matrices and Γ the invertible ones, this is `[x] = [y]` in the GIT quotient over an algebraically closed field.

- It is an equivalence relation.
- For g ∈ Γ and x ∈ A, x is invariantly equivalent to `g x g^{−1}`.
- For A all n × n matrices and Γ the invertible ones over an infinite field, x and y are invariantly equivalent if and only if they have the same characteristic polynomial.

**Checks.**

- On 𝔰𝔬₂ the group SO₂ acts trivially by conjugation, so every polynomial is invariant and x is invariantly equivalent to y only if x = y; in particular `[[0, a], [−a, 0]]` and its negative are not equivalent although they have the same characteristic polynomial. This is the role of the Pfaffian, and characteristic polynomials alone would give fibres of two points over a trivial H.
- `[[0, 1], [0, 0]]` and 0 are invariantly equivalent under GL₂: the relation is equality in the quotient, not conjugacy.
- For Γ = {1} every polynomial is invariant, and the relation is equality.

**Checks for the theorem.**

- For SO(3) ⊃ SO(2), the fibre over a stable pair is `{(b, c) : b² + c² = s}` with `s ≠ 0` at fixed a, an SO(2) ≅ G_m-torsor; over ℝ with V definite it is a circle when s > 0 and empty when s < 0.
- For GL₂ ⊃ GL₁ the fibre over a stable pair is `{(b, c) : bc = p}`, p ≠ 0, at fixed a and d, a G_m-torsor.
- Over ℝ a stable fibre can be empty: for SO(3) ⊃ SO(2) definite and s < 0 there is no real point, although the geometric fibre is a torsor.
- Over unstable pairs the fibre is nonempty but not a torsor: for GL₂ ⊃ GL₁ and y = z = 0 the fibre contains x = 0, with stabilizer all of GL₁, and the non-closed orbit of `[[0, 1], [0, 0]]`; for SO(3) ⊃ SO(2) over the pair with s = 0 the fibre `{b² + c² = 0}` at fixed a is the union of two lines through 0.
- Sphericity without the trivial stabilizer does not give surjectivity: SL₂ acting on ℙ¹ has a Borel with an open orbit, but its stabilizer there is a torus, and the moment map of `T^*ℙ¹` takes values in the nilpotent cone, so the invariant `det` takes only the value 0.

### 5.4 Fibral and invariant volume forms

For a smooth morphism f: Y → Z of smooth varieties over k and a regular value z with fibre X, nowhere-vanishing top forms β on Y and γ on Z determine the fibral form `α = β/γ` on X, the unique form with `β = α ⊗ γ` under `det(T_x^*Y) ≅ det(T_x^*X) ⊗ det(T_z^*Z)` (NV21 §16.1, p. 108). Here forms are algebraic: sections of top exterior powers of Kähler differentials, and the determinant identification comes from the exact cotangent sequence `0 → f^*Ω¹_Z → Ω¹_Y → Ω¹_{Y/Z} → 0` of the smooth morphism, restricted to X where `Ω¹_{Y/Z}` restricts to `Ω¹_X`; this identification, compatible with base change and composition up to the stated sign, is part of the target. A Haar form on a vector space is a translation-invariant top form and determines a dual form on the dual space; the algebraic symplectic volume on a regular orbit is `σ^d/d!`; an affine form on `[𝔥^*]` is a nonzero multiple of `dp₁ ∧ … ∧ dp_r` for homogeneous generators (NV21 §§16.2–16.4, pp. 109–110). Real measures are attached in §5.7.

- The fibral form is unique for the given order of the exact sequence.
- Successive fibrations give the fibral form of the composite up to the sign of the permutation reordering the sequences.
- Rescaling a Haar form by c rescales its dual form by `c^{−1}`.
- Changing invariant generators multiplies an affine form by the Jacobian determinant, an invertible function.

*Needs:* §5.3; LieGroups Layer 1; Mathlib `KaehlerDifferential`, `KaehlerDifferential.exact_mapBaseChange_map`, `Algebra.H1Cotangent.exact_δ_mapBaseChange`, `Algebra.FormallySmooth.subsingleton_h1Cotangent` and `exteriorPower` (the cotangent sequence of a smooth morphism and its determinant). Real measures, which use DifferentialGeometry Layer 5, enter only in §5.7.

**Checks.**

- For the projection `k^{r+s} → k^s` onto the last s coordinates with standard forms, the fibral form is `dx₁ ∧ … ∧ dx_r`.
- Multiplying the base form by c with the total form fixed multiplies the fibral form by `c^{−1}`.
- For a zero-dimensional fibre the fibral form is the scalar ratio of determinants, not a positive-dimensional form.
- Over k = ℚ̄, for the projection `A² → A¹`, `(x, y) ↦ y`, the cotangent sequence `0 → k·dy → k·dx ⊕ k·dy → k·dx → 0` gives `(dx ∧ dy)/dy = dx` with no real topology involved; the reversed factor order gives `−dx`, the sign of the stated convention.

### 5.5 The normalized affine quotient form

For a reductive Lie algebra 𝔥 and a Haar form `β_H` on 𝔥^*, there is a unique affine form `γ_H` on `[𝔥^*]` such that, for every µ, the fibral form of `O^µ_reg → 𝔥^* → [𝔥^*]` is the symplectic volume form. Its pull-back to a Cartan subalgebra at regular µ is `Π_{α>0} ⟨µ, α^∨⟩ · ∧_i H_i`, the scalar fixed by `β_H` through a Chevalley basis (NV21 Lemma 16.4, Definition 16.5, Remark 16.6 and (16.3), p. 110, citing Rossmann's Lemma C).

*Proof route.* Compute the Jacobian of the tangent splitting into root spaces and the Cartan in a Chevalley basis at regular semisimple points, where the root factors give the discriminant; extend the identity of regular forms across the regular non-semisimple locus by Rossmann's normalization lemma (rossmann78).

*Needs:* §2.1, §5.4; FormalConnectionsOpers F4.3 (Chevalley restriction and homogeneous invariant generators for reductive 𝔥, central factors included; for 𝔤𝔩₁ the single generator is the central coordinate).

**Checks.**

- For 𝔥 = 𝔤𝔩₁, `[𝔥^*] = 𝔥^*`, orbits are points and `γ_H` is `β_H` itself.
- For 𝔰𝔩₂ the pull-back is `⟨µ, α^∨⟩ dH` with a single positive root, vanishing exactly at the irregular point µ = 0.
- Rescaling `β_H` by c rescales `γ_H` by c, since the fibral form is the fixed symplectic volume form and `β_H` is its product with `γ_H`; the dual-form convention, which would rescale `γ_H` by `c^{−1}`, contradicts `γ_H = β_H` for 𝔤𝔩₁.

### 5.6 Stable fibre volume compatibility

Fix Haar forms `β_G`, `β_H` on 𝔤^*, 𝔥^* with normalized affine forms `γ_G`, `γ_H` (§5.5), and let (λ, µ) be stable. On the H-torsor `O_{λ,µ}`, the three sequences `O_{λ,µ} → O^λ_reg × O^{−µ}_reg → 𝔥^*` (via `ξ ↦ (ξ, −ξ|_𝔥)` and `(ξ, η) ↦ ξ|_𝔥 + η`), `O_{λ,µ} → O^λ_reg → [𝔥^*]` and `O_{λ,µ} → 𝔤^*_reg → [𝔤^*] × [𝔥^*]` each have fibral form ±α, where α is the transport of the Haar form dual to `β_H` along an orbit map `H → O_{λ,µ}`; no undetermined scalar remains (NV21 Theorem 16.7 and §§16.5.1–16.5.2, pp. 111–114).

*Proof route.* Compare the determinant sequences of the quotient taken in two steps using §5.5; in the first sequence use the Lagrangian tangent subspace to compare the symplectic determinant with the Haar determinant; in the third choose a spherical complementary nilpotent tangent space, where the Chevalley root factors cancel.

*Needs:* §5.3, §5.4, §5.5; SymplecticGeometry HamiltonianReduction R3 (symplectic reduction at the regular value 0).

**Checks.**

- The three sequences have the same fibre and the same forms up to sign; a factor 2 between them would change the main term of §9.5 by 2.
- At regular values: 0 ∈ 𝔥^* for the first sequence by trivial stabilizers, µ for the second because stable implies regular, and (λ, µ) for the third.

### 5.7 Normalized real measures

For an ℝ-rational top form, the attached measure gives each real coordinate differential `Lebesgue/√(2π)`, so `|dx₁ ∧ … ∧ dx_n| = Lebesgue/(2π)^{n/2}`, self-dual for the character `e^{ix}`; dual algebraic forms on V and V^* then give Fourier-dual measures. The algebraic symplectic volume `σ^d/d!` on a real 2d-dimensional orbit gives `σ^d/(d!(2π)^d)`, the measure of §3.1. Affine measures on `[𝔥^∧]` are normalized through §5.5, and Haar rescaling of H is paired with the reciprocal rescaling of Plancherel measure (NV21 §§17.1–17.2, pp. 115–116, including (17.2)).

- A coordinate r-form has measure `|det| (2π)^{−r/2}` Lebesgue.
- The real measure of the algebraic orbit form equals the KKS normalization of §3.1.
- For smooth fibrations with compatible forms, the measures disintegrate by Fubini in charts (GeometricMeasureTheory G2 coarea, DifferentialGeometry 5.5 densities).
- Integration over an empty real stable fibre is 0.

*Needs:* §0.1, §3.1, §5.6; DifferentialGeometry Layer 5; GeometricMeasureTheory G2.

**Checks.**

- The form dx on ℝ has measure `dx_Leb/√(2π)`.
- For σ = dx ∧ dy, the orbit measure is `dx dy/(2π)`, agreeing with §3.1.
- Replacing a top form by its negative leaves its measure unchanged.
- A geometric torsor with no real point contributes 0, not one Haar mass.

### 5.8 Uniform stable orbit properness

For a compact subset C of the H-stable locus in 𝔤^∧ there are c, ε > 0 with `|s·η| ≥ c|s|^ε` for η ∈ C and s ∈ H, with the algebraic norm `|s| = max(‖R(s)‖, ‖R(s^{−1})‖)` of the defining representation R of H on `V_H` and after adding a constant to the norm on 𝔤^∧; any norm polynomially equivalent to it, such as the dual-augmented height of AdelicAlgebraicGroups §3.5 for a form of the pair over ℚ or ℚ(i), changes c and ε only. Consequently stable orbital integrals of Schwartz functions converge absolutely, uniformly on C, with finitely many Schwartz seminorms (NV21 Lemma 17.3, pp. 118–119).

*Proof route.* The stable locus is the nonvanishing locus of a resultant (§5.2); the orbit map `H × Z → Z × Z` is a closed immersion by §5.3, so the coordinates of s are polynomials in z and s·z, with denominators bounded on C; then `|a(s·η)| ≪ ⟨s·η⟩^{−N} ≪ |s|^{−εN}` for Schwartz a, and `∫_H |s|^{−r} ds < ∞` for large r absorbs it. For the last step realize H as `G∞` for a connected reductive group over ℚ (k = ℝ: a real quadratic or Hermitian space is diagonal with entries ±1, so the pair has a ℚ-form, using ℚ(i)/ℚ in the Hermitian case and `GL_n` for k₁ = k × k) or over ℚ(i) with its one complex place (k = ℂ), and apply the integrability of negative powers of the height of AutomorphicFormsOnReductiveGroups §0.3 together with the comparison of the height with `|s|` of AdelicAlgebraicGroups §3.5.

*Needs:* §5.2, §5.3; AutomorphicFormsOnReductiveGroups §0.3; AdelicAlgebraicGroups §3.5 (local polynomial comparison of algebraic heights).

**Checks.**

- On C the resultant is bounded below; at an unstable limit point the inequality fails, since a destabilizing cocharacter `t ↦ γ(t)` keeps `γ(t)·η` bounded while `|γ(t)| → ∞`.
- For GL₂ ⊃ GL₁ at `(b, c)` with `bc = p ≠ 0`, `|h·(b,c)| = |(hb, c/h)| ≍ max(|h|, |h|^{−1})`, so ε = 1 works.

### 5.9 Stable orbital disintegration

For a Schwartz symbol a supported in the stable locus, `∫_{O^λ_reg} a dω = ∫_{[𝔥^∧]} (∫_{O_{λ,µ}} a) dµ` with the normalized affine measure, and more generally `∫_O a dω = ∫ (∫_{O(µ)} a) dµ` for a regular multiorbit O; `∫_{𝔤^∧} a = ∫_{[𝔤^∧]} ∫_{O^λ_reg} a dω dλ`. Empty real fibres contribute 0. Stable fibre integrals depend continuously on the stable pair and on a, with uniform seminorm bounds on compact sets of stable pairs (NV21 Theorem 17.2 and (17.2)–(17.5), pp. 116–118).

*Proof route.* Use the single real H-orbit description of nonempty stable fibres (§5.3) and the three compatible forms (§5.6); apply the coarea formula in charts with the normalized densities (§5.7); use §5.8 for absolute convergence and dominated continuity, patching compact parameter neighbourhoods.

*Needs:* §3.5, §5.3, §5.6, §5.7, §5.8; GeometricMeasureTheory G2.

**Checks.**

- For a symbol supported in one chart of a nonempty real stable torsor, the disintegration is Fubini in coordinates with the Haar factor of H.
- An empty real fibre contributes 0, and the formula remains correct because `ω` has no mass there.

### 5.10 Complex Plancherel affine scaling

Let H be a complex reductive group regarded as a real group, and U a nonempty bounded open subset of `[𝔥^∧]` whose boundary has measure zero. Then the Plancherel measure of `{σ tempered : hλ_σ ∈ U}` divided by the normalized affine measure of `h^{−1}U` tends to 1 as h → 0 (NV21 Lemma 17.4, p. 120). The statement is restricted to complex groups, where for tempered σ the multiorbit `O_σ` is the full regular fibre `O^{λ_σ}_reg`.

*Proof route.* For compactly supported a, `∫_{[𝔥^∧]} ∫_{O^µ} a_h = ∫ a_h = f(1)` with `Op_h(a) = σ(f)` (§0.5 with χ(0) = j(0) = 1), and by the Plancherel formula and §3.7 this is `∫ ∫_{O_σ} a_h dω dµ(σ)` up to errors controlled uniformly. Complete the source's sketch by a positive sandwich: choose nonnegative `a^±` whose fibre integrals bracket `1_U` from above and below within ε away from a neighbourhood of ∂U of affine measure ε, bound the spectral tails by §3.9 and the Plancherel–Sobolev bound §4.2, let h → 0 and then ε → 0 using that ∂U is null.

*Needs:* §3.7, §3.9, §4.2, §5.9; AutomorphicSpectralTheory gap:local-plancherel.

**Checks.**

- For H = ℂ^× regarded as a real group, the unitary characters `z ↦ |z|^{2it}(z/|z|)^n` have parameters on ℤ × ℝ, Plancherel measure is counting measure in n times Lebesgue measure in t, and the affine measure of `h^{−1}U` is Lebesgue measure in both coordinates; the ratio is a Riemann-sum ratio, not 1 for fixed h, and tends to 1 because ∂U is null.
- For a real group such as SL₂(ℝ) a single tempered σ sees only one of the regular orbits in its fibre (a holomorphic discrete series sees one sheet of a two-sheeted hyperboloid); the source states and sketches the lemma only for complex groups, where `O_σ` is the full regular fibre, and no statement is made here for real groups.

### Examples

For SO(3) ⊃ SO(2) over ℝ with V definite, `𝔤^∧ ≅ ℝ³`, a stable fibre over (λ, µ) is the circle of radius `(s)^{1/2}`, `s = λ − µ²` in suitable units, when s > 0 and is empty when s < 0; its Haar measure has total mass vol(SO(2)). For GL₂ ⊃ GL₁ the stable fibres are hyperbolas `bc = p ≠ 0` and the unstable ones `bc = 0` contain non-closed orbits.

### Dependencies

Layers 0–3; AlgebraicModuliForArithmeticGeometry gap:hilbert-mumford-linear and gap:free-stable-quotient-bundle; Tau Ceti quadratic-form Witt theorems; Mathlib `Matrix.charpoly`, `Matrix.fromBlocks`, `Matrix.toBlocks₁₁`, `MvPolynomial.zeroLocus`, `Matrix.GeneralLinearGroup`, `Matrix.specialOrthogonalGroup`, `KaehlerDifferential`, `AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization`; LieGroups Layer 1; FormalConnectionsOpers F4.3; NilpotentOrbits N1.1; SymplecticGeometry HamiltonianReduction R3; DifferentialGeometry Layer 5; GeometricMeasureTheory G2; AutomorphicSpectralTheory gap:local-plancherel; AutomorphicFormsOnReductiveGroups §0.3; AdelicAlgebraicGroups §3.5.

## Layer 6: Stable relative trace asymptotics

The relative character of §4.5 has an asymptotic expansion, uniform in the tempered pair, whose terms are integrals over the stable fibres of Layer 5. The proof reduces to a diagonal subgroup of a product group and splits the group integral by the distance from the identity. Throughout, (G, H) is a GGP pair over ℝ or ℂ regarded as real groups.

### 6.1 Diagonal subgroup reduction

Put M = G × H, S = diag(H) and τ = π ⊗ σ̄. The relative character becomes `L(T) = ∫_S tr(τ(s)T) ds` on `Ψ^{−∞}(τ)`. On `T = τ(f)` for a test function f on M and a unitary pair, `L(τ(f))` is the local relative character `J_{σ_v}(f)` of GanGrossPrasadUnitaryGroups §6.2, whose absolute convergence is proved there; the extension of L to all of `Ψ^{−∞}(τ)` with bounds uniform in τ is §4.6. Fattening a stable symbol a on 𝔤^∧ by a compactly supported b on 𝔰^∧ equal to 1 near 0, the mixed calculus (§1.6, with 𝔤 + 𝔰 = 𝔪) gives a compactly supported S-stable symbol a′ on 𝔪^∧ with `H_σ(Op_h(a)) = L(Op_h(a′))` up to `O(h^∞)`. The identification `𝔰^⊥ = {(ξ, −ξ|_𝔥)}` identifies `hO_τ ∩ 𝔰^⊥` with `hO_{π,σ}`, where `O_τ = O_π × O_{σ̄} = {(ξ, −η) : ξ ∈ O_π, η ∈ O_σ}`, preserving the transported Haar measures, and carries homogeneous differential operators on 𝔪^∧ to operators on 𝔤^∧ of the same homogeneity and no larger order (NV21 §19.4, (19.12)–(19.15), pp. 126–128).

*Proof route.* Insert the auxiliary quantization by Haar invariance (its scalar is `1 + O(h^∞)`); use the mixed calculus with both inputs Schwartz; choose the auxiliary support small, using openness of stability; identify orbital measures through the contragredient sign and the forms of §5.6.

*Needs:* §1.6, §1.12, §2.2, §4.5, §5.1, §5.9.

**Checks.**

- The second factor of `O_τ` is `−O_σ`, the coadjoint multiorbit of the conjugate σ̄, and the moment equation is `ξ|_𝔥 + η = 0`.
- The fattening b must be ≡ 1 near 0 and of small support; a b with `b(0) = 1/2` halves the main term.

### 6.2 The small-element expansion

For a compact S-stable support in 𝔪^∧, `δ < δ′ < 1/2` and a fixed Θ ∈ `C_c^∞(𝔰)` equal to 1 near 0, `∫_𝔰 Θ(y/h^{δ′}) j_S(y) tr(τ(exp y) Op_h(a)) dy = Σ_{j<J} h^j ∫_{hO_τ ∩ 𝔰^⊥} D_j a + O(h^{(1−2δ)J})`, with `D_0 = 1`, D_j of order ≤ 2j and homogeneous of degree j, `D_j(a_h) = h^j (D_j a)_h`. The narrow auxiliary symbol produced by the cutoff has total mass `h^{dim S}`, which cancels the factor `h^{−d_M}` of §3.7 because `d_M = dim S` (NV21 Lemma 19.5 and (19.18)–(19.23), pp. 129–131; the proof there assigns the narrow symbol unit mass and drops the trace prefactor, and the two corrections cancel).

*Proof route.* Write the small-element integral as a trace of Op_h of a symbol in `h^{δ′ dim S} S^{−∞}_{1−δ′}`; since `δ + (1 − δ′) < 1`, apply §1.6 and then §3.7; disintegrate along the moment map, integrate the narrow symbol and its moments keeping `h^{dim S}`, and expand the Jacobian into homogeneous operators.

*Needs:* §1.6, §3.7, §5.9, §6.1.

**Checks.**

- Changing variables in the narrow symbol `b(ξ_𝔰/h^{1−δ′})` scaled to height `h^{δ′ dim S}` gives mass `h^{dim S}`; with unit mass the main term would be off by `h^{−dim S}`.
- At J = 1 the main term is the transported Haar integral; at J = 2 the correction carries one power of h.

### 6.3 Intermediate and large elements

Outside a neighbourhood of the identity of radius `h^{1/2−η}` (η > 0 fixed in the proof) the integral of `tr(τ(s)Op_h(a))` over S, for a with compact stable support, is `O(h^∞)`. For moderate `Ad(s)` this follows from stable support separation and near covariance; for larger `Ad(s)`, one-parameter averaging in an expanding direction and integration by parts give rapid decay of the trace; in the huge range the Ξ-bounds and negative-order trace estimates make the integrated tail negligible (NV21 §§19.6–19.7, (19.25)–(19.27), Lemmas 19.6–19.8, pp. 131–135; at the end of §19, p. 136, the main term comes from the complementary small-distance region, not the large-distance one).

*Proof route.* The whole support is not separated from its translates (Checks), so first partition a by §1.4 into polynomially many pieces, each supported in a ball of radius `h^{δ′}` with `max(δ, 1/2 − η/2) < δ′ < 1/2` (the statement is monotone in the symbol class, so the class exponent may be raised to δ′), and surround each ball by an envelope symbol ψ equal to 1 on the ball of twice and 0 off the ball of three times that radius; split `tr(τ(s)Op_h(a)) = tr(τ(s)Op_h(a)Op_h(1 − ψ)) + tr(Op_h(ψ)τ(s)Op_h(a))`, the first term negligible by the disjoint-support case of §1.12 and §3.9. In the moderate range `h^{δ′−η/2} ≤ ‖s − 1‖ ≤ h^{−ε}` replace `τ(s)Op_h(ψ)τ(s)^{−1}` by `Op_h(s·ψ)` through near covariance (§1.11), and show that `s·ψ` and the piece have disjoint supports: every ξ in the triple ball is moved by at least `h^{δ′−ε}`, from the uniform properness of §5.8 when `‖s − 1‖ ≥ h^ε` and from the triviality of the stabilizer of ξ (§5.3) when `h^ε > ‖s − 1‖ ≥ h^{δ′−η/2}`; the disjoint-support case of §1.12 then applies piecewise. Beyond near covariance, for `‖s − 1‖ > h^{−ε}`, insert a one-parameter convolution along a direction expanded by s and integrate by parts; cut off at `|s| ≤ h^{−N′}` for the algebraic norm of §5.8 and bound the tail by the polynomially weighted `Ξ_G Ξ_H`-integrability (gap:unitary-xi-polynomial-tail, gap:orthogonal-xi-polynomial-tail) and §3.9: the integrand is `≪ h^{−A} Ξ_G Ξ_H` for a fixed A from §4.1 and §3.9, and the tail is `≪ h^{N′η}`, so it is `O(h^N)` once `N′η > N + A`. The negligible power is chosen before the polynomially many pieces are summed (NV21 Lemma 19.8 and (19.26)–(19.27), pp. 133–134).

*Needs:* §1.4, §1.11, §1.12, §3.9, §4.1, §5.3, §5.8, §6.1; GanGrossPrasadUnitaryGroups §2.7 and gap:orthogonal-xi-integrability (`Ξ_G Ξ_H`-integrability); gap:unitary-xi-polynomial-tail and gap:orthogonal-xi-polynomial-tail (its polynomially weighted form).

**Checks.**

- Separation needs the partition: for GL₂ ⊃ GL₁ acting by `(b, c) ↦ (tb, c/t)` on the stable coordinates, a compact stable set containing (1, 1) and (2, 1/2) meets its translate by t = 2 at the point (2, 1/2), although every stabilizer is trivial; the ball of radius r < 1/3 about (1, 1) is disjoint from its translate, which lies within distance 2r of (2, 1/2), at distance √5/2 from (1, 1).
- The bound is for the integral over each range, not only the integrand: the huge range has infinite volume and is controlled by the integrable weight `Ξ_G Ξ_H`.
- The tail needs a power of the norm, not of its logarithm: for GL₂ ⊃ GL₁ over ℝ, `Ξ_{GL₂}(diag(t, 1)) ≍ |t|^{−1/2}(1 + log|t|)` for |t| ≥ 1 and `Ξ_{GL₁} = 1`, so the tail beyond X is `∫_{|t| > X} |t|^{−3/2}(1 + log|t|) dt ≍ X^{−1/2} log X`, and every η < 1/2 works; a log-weighted bound gives only `(1 + log X)^{−d}`, and `h^{−A}(N′ log(1/h))^{−d}` is not `O(h^N)`.
- The small-element computation of §6.2 is applied to the complementary region where the cutoff is 1.

### 6.4 The stable relative character expansion

Let U ⊂ 𝔤^∧ be compact and consist of H-stable elements, 0 ≤ δ < 1/2, `a ∈ S^{−∞}_δ` with supp a ⊆ U, and π, σ tempered irreducible unitary representations of G and H, possibly depending on h. Then there are differential operators D_j on 𝔤^∧ with `D_0 = 1`, order ≤ 2j and `D_j(a_h) = h^j(D_j a)_h` such that for every J, `H_σ(Op_h(a)) = Σ_{j<J} h^j ∫_{hO_{π,σ}} D_j a + O(h^{(1−2δ)J})`, the error bounded by `C ν(a)` with C depending on U and δ and ν a continuous seminorm depending on J, uniformly in π and σ. The integral over `hO_{π,σ}` uses the transported Haar measure if the fibre is nonempty and is 0 otherwise. For k fixed factors, `H_σ(Op_h(a₁)⋯Op_h(a_k)) = ∫_{hO_{π,σ}} a₁⋯a_k + O(h^{1−2δ})`, and the full expansion follows by composition (NV21 Theorem 19.3 and (19.7)–(19.11), pp. 125–126; Theorem 19.4 and (19.16), p. 128, where the printed expansion lacks the factors `h^j`).

*Proof route.* Restrict to a compact stable range of parameters by §2.7 and §4.6; apply §6.1, take the main term from §6.2 and discard §6.3; transport D_j to 𝔤^∧. For products expand by §1.12 with enough terms to absorb the polynomial loss of `H_σ`.

*Needs:* §1.12, §4.6, §6.1, §6.2, §6.3.

**Checks.**

- At J = 1 the main term is the stable Haar integral with error `O(h^{1−2δ})`; since D_j has order ≤ 2j, `h^j ∫ D_j a_h ≪ h^{(1−2δ)j}` for `a ∈ S_δ`, consistent as J varies (NV21 (19.9), p. 125).

### Examples

For SO(3) ⊃ SO(2), the spin-l representation π and the character `e^{imθ}` σ, with h = 1/(l + 1/2) and a fixed stable symbol, `hO_{π,σ}` is a circle of latitude `m h` on the unit sphere and `H_σ(Op_h(a))` is the average of a over that circle up to `O(h)`: the quantization of the moment map of the rotation about the axis.

### Dependencies

Layers 0–5; GanGrossPrasadUnitaryGroups §2.7; gap:orthogonal-xi-integrability; gap:unitary-xi-polynomial-tail; gap:orthogonal-xi-polynomial-tail.

## Layer 7: Positive inverse branching

Positive test operators whose relative characters approximate a prescribed weight on the representations of the smaller group, with positive error majorants, at the distinguished archimedean place and at auxiliary p-adic places. The weights are evaluated on the whole unitary dual, with the nontempered representations controlled separately.

### 7.1 Orbit distinction and spectral weights

For tempered π, σ, σ is orbit-distinguished by π if `O_{π,σ} ≠ ∅` (NV21 §22.2, p. 145). Given k ∈ `C_c^∞([𝔥^∧] ∩ image(O_stab))`, k ≥ 0, where O_stab is the set of H-stable points of the limit orbit O of an h-dependent tempered π, define `k_h(σ) = k(hλ_σ)` for tempered orbit-distinguished σ and `k_h(σ) = 0` for every other irreducible unitary σ (NV21 (22.1), p. 145). Choose precompact open U ⊂ `[𝔥^∧]` and V ⊂ 𝔤^∧ with V stable, `supp k ⊆ image(V)`, `closure(image(V)) ⊆ U` and `closure(U) ⊆ image(O_stab)` (NV21 (22.2)–(22.4), pp. 145–146). Orbit distinction is a geometric condition, distinct from `Hom_H(π, σ) ≠ 0`.

- σ is orbit-distinguished exactly when the intersection is nonempty.
- On tempered orbit-distinguished σ, `k_h(σ) = k(hλ_σ)`; on nontempered or non-orbit-distinguished σ, `k_h(σ) = 0`.
- `k_h(σ) ≠ 0` forces `hλ_σ ∈ supp k`.
- For `hλ_σ` in a fixed compact stable region and h small, orbit distinction implies distinction, by §6.4 applied to a positive bump (NV21 Remark 22.1, p. 145); the converse is not used.

*Needs:* §3.4, §5.3, §6.4.

**Checks.**

- For SO(3) ⊃ SO(2) take the spin-l representations with `h_l = (3/4)/(l + 1/2)`, so that every `hO_π` and the limit O is the sphere of radius 3/4, and the characters `e^{imθ}` of SO(2), whose parameter `hλ_σ = hm` is the height coordinate on the sphere. At l = 1, h = 1/2, the weights m = 0, 1, 2 have `hλ_σ = 0, 1/2, 1`, and the fibres of the height are a circle of radius 3/4, a circle of radius `√5/4` (since `(3/4)² − (1/2)² = 5/16`) and the empty set. For k supported in (−3/4, 3/4) with k(0) = 1 and k(1/2) = 2 the weights are `k_h(σ) = 1, 2, 0`: the third is 0 because its fibre is empty, with `hλ_σ = 1` outside supp k as well. Evaluating k at the unscaled parameter `λ_σ = m` would give the weights 1, 0, 0, since 1 ∉ supp k; an orbit of the wrong radius, say 1 instead of 3/4, would make the m = 2 fibre a circle of radius 0 and could give it a nonzero weight.
- For `H = SO(2,1)^0 ≅ PSL₂(ℝ)` with the parameter `λ²` of the Layer 2 Examples and k supported in the regular window `λ² ∈ (1/4, 1)`: a complementary-series σ has `λ_σ(H)² ∈ (0, 1)`, so `h²λ_σ² < h²` lies outside supp k once h < 1/2, and its weight is 0 by both clauses; at h = 1/10 the discrete series `D_k`, k even, with `h²(k − 1)² ∈ (1/4, 1)` are `D_8` and `D_{10}`, with `h²(k − 1)² = 49/100` and `81/100`, tempered with parameter in supp k, and their weight is `k(h²(k − 1)²)` or 0 according as `O_{π,σ}` is nonempty or empty. The nontempered clause is therefore only visible near the irregular point 0, which a window in the regular set excludes for small h; a window containing 0 would admit complementary series with parameter in supp k, all of weight 0.
- Defining the weight through `Hom_H(π, σ) ≠ 0` would assert the converse of the last API fact, which is not supplied.

### 7.2 Positive archimedean inverse branching

Let k, U, V be as in §7.1 with k ≥ 0. For every ε > 0 and N ≥ 0 there are nonnegative `a, a₁, a₂, a_nt ∈ C_c^∞(V)` with: `∫_O a₁² dω` bounded in terms of k and V, `∫_O a₂² dω ≤ ε`, `∫_O a_nt² dω ≤ ε`, and `|∫ k − ∫_O a² dω| ≤ ε`; and for h small, (i) for tempered σ with `hλ_σ ∈ U` and `O_{π,σ} ≠ ∅`, `|k_h(σ)| ≤ |H_σ(Op_h(a₁)²)|` and `|k_h(σ) − H_σ(Op_h(a)²)| ≤ |H_σ(Op_h(a₂)²)| + O(h^N)`; (ii) for nontempered σ with `hλ_σ ∈ U`, `H_σ(Op_h(a)²) = H_σ(Op_h(a_nt)²) + O(h^N)`, where `H_σ` on nontempered σ is the auxiliary form of §4.5, scaled so that its factorization through `Ψ^{−∞}(σ)` and the trace is h-uniformly continuous; the identity is homogeneous in that scale and holds for every nonnegative multiple of the form (NV21 Theorem 22.2, (22.8)–(22.11), pp. 146–148; the second inequality in (i) is printed without `O(h^N)`, which is needed outside the region where a₂ has positive fibre mass, and the image of supp a is chosen inside that region).

*Proof route.* Lift k to squared symbols by a partition of unity on the stable bundle; choose a₂ with positive fibre integral on a compact neighbourhood of the image of supp a and small total mass; choose a_nt equal to a near the preimage of the irregular H-parameters, a null compact set; apply §6.4 inside, §2.7 outside, and §2.3 to show that σ with parameter near regular points are tempered.

*Needs:* §2.3, §2.7, §5.9, §6.4, §7.1.

**Checks.**

- `Op_h(a_j)²` is positive, so `H_σ(Op_h(a_j)²) ≥ 0` wherever `H_σ` is positive; the absolute values are kept because archimedean positivity is not assumed.
- Without `O(h^N)`, the second inequality fails for σ with `hλ_σ ∈ U` near the boundary of the region where `∫ a₂² > 0`, where `H_σ(Op_h(a)²)` is `O(h^N)` but not 0.

### 7.3 Positive Weyl-law test functions

For k and U as above, ε > 0 and N ≥ 0, for h small there are positive-definite smooth compactly supported functions f, f₁ on H, supported in a neighbourhood of 1 shrinking with h, with `|∫ k − h^d f(1)| ≤ ε`, `h^d f₁(1) ≤ ε` and `|k_h(σ) − tr σ(f)| ≤ tr σ(f₁) + O(h^N⟨hλ_σ⟩^{−N})` for every irreducible unitary σ of H, tempered or not, d being half the regular G-orbit dimension of the limit setup (NV21 Lemma 22.4 and its proof, pp. 148–151).

*Proof route.* Start from the positive `Op_h(a)²` and its restricted matrix coefficient `s ↦ tr(π(s)Op_h(a)²)` composed with inversion, so that its σ-trace is `H_σ(Op_h(a)²)` (§4.5); truncate by a convolution square to keep positive definiteness; control the truncation by §§6.2–6.3 and §2.7 for tempered and nontempered σ; normalize f and f₁ at 1 by §3.7.

*Needs:* §2.7, §3.7, §6.2, §6.3, §7.2.

**Checks.**

- A truncation `φ · χ` of a positive-definite φ is not positive definite in general; `ψ ∗ ψ*` is.
- On a complementary-series σ, `k_h(σ) = 0` and the inequality says `|tr σ(f)| ≤ tr σ(f₁) + O(h^N⟨hλ_σ⟩^{−N})`, a positivity statement that a bound on the tempered dual alone does not give.

### 7.4 The good-level invariant-vector criterion

Let H be reductive over a nonarchimedean local field, J a good compact open subgroup (normal in a special maximal compact K with Iwahori decompositions for every standard parabolic), P = MN a standard parabolic and τ an irreducible supercuspidal representation of M. Then `τ^{J∩M} ≠ 0` if and only if the normalized induction `Ind_P^H τ` has nonzero J-fixed vectors, if and only if some irreducible constituent has, if and only if every irreducible constituent has (NV21 Lemma 23.2 and §§23.1–23.3, pp. 152–154).

*Proof route.* The Iwahori factorization realizes induced J-fixed vectors from `(J∩M)`-fixed vectors of τ; Casselman's canonical lifting identifies J-invariants of each constituent with Jacquet-module invariants, and the common cuspidal support with normality of J in K gives the statement for every constituent; exactness of invariants alone does not.

*Needs:* SmoothRepresentationsOfLocalGroups SR.1.4, SR.2.2, SR.2.3, SR.3.1; ReductiveGroupsPartII RG2.3.6, RG2.4.2 (good subgroups).

**Checks.**

- For H = GL₂ over ℚ_p, the reducible unramified principal series has the trivial and Steinberg constituents. With the good subgroup `J = ker(GL₂(ℤ_p) → GL₂(𝔽_p))` both constituents have J-fixed vectors; with `GL₂(ℤ_p)`, which has no Iwahori factorization with respect to the Borel, the trivial constituent has fixed vectors and the Steinberg constituent has none, so the every-constituent clause fails.

### 7.5 Tempered l-components

For a p-adic reductive H let l send a tempered irreducible σ to the conjugacy class of its square-integrable inducing datum (M, τ) (SmoothRepresentationsOfLocalGroups SR.3.3). The parameter space is the disjoint union of l-components D, each the quotient of the compact torus of unitary unramified twists of a fixed datum by its finite stabilizer; l has finite fibres. There are countably many components and finitely many contain a datum with J-fixed vectors for a fixed good J (NV21 §§23.7–23.8, pp. 156–157). For fixed tempered π of a GGP pair (G, H), the set Ω of π-distinguished tempered σ maps injectively by l, its image is a union of l-components, and Ω carries the transported topology, in which `σ ↦ H_σ` is continuous and the J-visible part of Ω is compact (NV21 Lemmas 24.1–24.2 and §24.2, pp. 157–159). This topology is not asserted to coincide with the Fell topology.

- Each component is a compact torus quotient, and each fibre of l is finite.
- Only finitely many components contain a J-fixed representation, for a fixed good J.
- Each component is clopen; on Ω the relative characters vary continuously, by the finite expansion `H_σ = Σ_u ∫ ⟨s v₁, v₂⟩⟨u, s u⟩` over a basis of the induced space (NV21 (24.1), p. 158).
- l is injective on Ω (strong multiplicity one for full inductions of square-integrable representations).
- The J-visible part of Ω is compact.

*Needs:* §4.5, §7.4; SmoothRepresentationsOfLocalGroups SR.3.1–SR.3.3, SR.3a.2; gap:induced-multiplicity-one and gap:distinction-upper-semicontinuity.

**Checks.**

- For `H = F^×` a fixed inertial class is a circle of unitary unramified twists, not the full complex torus `ℂ^×`.
- At a reducible unitary induction (for SL₂, the induction from the quadratic unramified character), two constituents share one l-parameter and must not be identified.
- For a fixed good J finitely many inertial families survive, each still containing infinitely many representations.

### 7.6 Allowable components and weights

Fix tempered π over a p-adic field and a distinguished l-component D. D is allowable if there is a good J, with D in the J-visible part, such that every nonnegative continuous k on D, extended by 0 to the whole unitary dual of H, admits for every ε > 0: (i) positive finite-rank T, T₊ built from J-fixed smooth vectors of π with `tr T₊ ≤ ε` and `|k(σ) − H_σ(T)| ≤ H_σ(T₊)` for every irreducible unitary σ; and (ii) bi-J-invariant Hecke functions φ, φ₊ with φ₊ positive definite, `φ₊(1) ≤ ε` and `|k(σ) − tr σ(φ)| ≤ tr σ(φ₊)` for every irreducible unitary σ. On nontempered σ, `H_σ` is the auxiliary form of §4.5, zero exactly when `Hom_H(π, σ) = 0` and otherwise fixed up to a positive scale. An allowable weight is a finite linear combination of continuous nonnegative weights supported on allowable components (NV21 Definition 24.3 and §24.2, pp. 159–160; §20, pp. 142–143).

- Every nonnegative continuous weight on D has the finite-rank approximation with trace-small positive error.
- It has the Hecke approximation with positive error of small value at 1.
- Finite sums of allowable weights satisfy both clauses after splitting ε.
- The fixed forms on nontempered σ enter both inequalities unchanged.
- Tensor products over finitely many places preserve both clauses after assigning small local errors.

*Needs:* §4.5, §7.5; SmoothRepresentationsOfLocalGroups SR.1.1; SmoothRepresentationsOfLocalGroupsPartII §0.6, §2.7 (the unitary dual).

**Checks.**

- The zero weight is approximated by zero operators and zero Hecke functions.
- An approximation valid only on the tempered dual does not establish allowability.
- A small operator norm of T₊ is not enough: its trace must be small, as `φ₊(1)` and not its supremum is the Hecke error mass.
- Scaling k by c > 0 scales the approximants and requires tolerance `ε/c`.

### 7.7 Uniform distinction and central approximation

(i) On the compact distinguished J-visible part of Ω there is a positive finite-rank T₀ with `H_σ(T₀) ≥ 1` uniformly. (ii) For a cuspidal-type l-component, with Bernstein-variety domain Θ, compact unitary part `Θ_unit` and compact unitary supercuspidal-support locus `Θ₀`, the closure of the nontempered locus `Θ_nt` meets `Θ₀` in a Haar-null set; real regular central functions separate the relevant points; and for every ε > 0 there is a real regular f with `|f| ≤ 2` on `Θ_unit`, `f ≥ 1` on `Θ_nt` and `∫_{Θ₀} f² ≤ ε` for the induced Haar measure, hence small in Plancherel measure by its bounded continuous density (NV21 §§24.5.1–24.5.3, Lemmas 24.6 and 24.8–24.10, pp. 164–167).

*Proof route.* (i) Cover the compact set by neighbourhoods where a positive rank-one relative character is nonzero (gap:relative-character-positivity) and sum. (ii) Construct the antiholomorphic involution of the Bernstein variety induced by the Hermitian contragredient from SR.0.4 and SR.3.2, whose fixed points contain the unitary locus; a nontrivial effective stabilizer has a lower-dimensional fixed subtorus and there are finitely many, so after removing Weyl elements acting trivially the nontempered closure is null; apply real Stone–Weierstrass with a small cutoff around that null set. No explicit Laurent polynomial is needed.

*Needs:* §7.4, §7.5; SmoothRepresentationsOfLocalGroups SR.0.4, SR.3.1–SR.3.3; AutomorphicSpectralTheory gap:padic-plancherel-density; gap:relative-character-positivity.

**Checks.**

- For the unramified component of PGL₂ over ℚ_p, with q = p, the Satake parameter α ranges over the unit circle (tempered) and the two complementary intervals `(q^{−1/2}, q^{1/2})` and `(−q^{1/2}, −q^{−1/2})` of real parameters; f must satisfy `|f| ≤ 2` on the whole unitary locus, intervals included, and `f ≥ 1` on both intervals. The polynomial `f_n(α) = n^{−1} Σ_{j=0}^{n} α^{−n+2j}` printed after NV21 Lemma 24.10, p. 166, satisfies the bound on the unit circle, where `f_n(e^{iθ}) = sin((n+1)θ)/(n sin θ)` has absolute value at most `(n + 1)/n ≤ 2` (`f_4(1) = 5/4`), but fails it on the complementary intervals: for q = 5, α = 2 and n = 4, `f_4(2) = (1/16 + 1/4 + 1 + 4 + 16)/4 = 341/64 > 2`, and for every fixed α > 1 in the interval `f_n(α) ≥ α^n/n` grows without bound; for odd n every exponent is odd, so `f_n < 0` on the negative interval (`f_1(−2) = −5/2`), violating `f ≥ 1` there. The Stone–Weierstrass construction of the proof is what is used.
- A Weyl element acting trivially on a component has the whole component as fixed set; it is discarded before the lower-dimensional fixed-subtorus argument.

### 7.8 Cuspidal-type allowability

Every distinguished l-component whose square-integrable inducing datum is supercuspidal is allowable, in both the finite-rank and the Hecke sense, with the approximations valid on the whole unitary dual including complementary series (NV21 Theorem 24.5 and §§24.4–24.5.3, pp. 160–167). The theorem is not stated for other components.

*Proof route.* Approximate k on the compact component by §7.7 and annihilate other supercuspidal supports by central projectors; square central multipliers and sandwich the finite-rank tests, the small `L²` cutoff near the nontempered boundary making the error trace small. For the Hecke clause truncate the matrix coefficient, add a small fixed-level idempotent error on tempered representations, and control ranks by uniform admissibility; handle nontempered σ with `|c| ≤ ε^{−1}|c|² + ε` and a central convolution square, choosing the auxiliary tolerance after its ℓ¹ bound is known.

*Needs:* §4.2, §7.6, §7.7; SmoothRepresentationsOfLocalGroups SR.3a.2.

**Checks.**

- Both clauses are checked on nontempered σ as well as tempered ones.
- The tolerance of the central approximation is chosen after the ℓ¹ norm of the central multiplier and the fixed-level rank bound are known; choosing it first leaves an uncontrolled product.

### Examples

For H anisotropic, hence compact, over a p-adic field, every irreducible σ is finite-dimensional, tempered and isolated, a weight is a finitely supported function, and for J small enough `T = Σ_σ k(σ) P_σ` with `P_σ` the σ-isotypic projectors of π gives clause (i) of §7.6 exactly with `T₊ = 0`, since `H_σ(P_σ) = 1` for distinguished σ by multiplicity one.

### Dependencies

Layers 0–6; SmoothRepresentationsOfLocalGroups SR.0.4, SR.1.1, SR.1.4, SR.2.2–SR.2.3, SR.3.1–SR.3.3, SR.3a.2; SmoothRepresentationsOfLocalGroupsPartII §0.6, §2.7; ReductiveGroupsPartII RG2.3.6, RG2.4.2; AutomorphicSpectralTheory gap:local-plancherel and gap:padic-plancherel-density; gap:induced-multiplicity-one; gap:distinction-upper-semicontinuity; gap:relative-character-positivity.

## Layer 8: Limit states and arithmetic equidistribution

Smooth operator states on compact automorphic quotients, their semiclassical limits along a fixed representation, the equivariant disintegration over the limit orbit, and the equidistribution theorem obtained from Ratner's classification and the spinor and determinant component comparison.

**Global setting.** F is a number field, (G, H) an anisotropic GGP pair over F, either `U(n+1) ⊃ U(n)` with n ≥ 1 or `SO(n+1) ⊃ SO(n)` with n ≥ 2; R is a finite set of places containing the archimedean ones and q ∈ R an archimedean place with G_q quasi-split; G_p is compact for every other archimedean p. Π is an automorphic representation of G, unramified outside R, with `π = Π_q` and `π′ = ⊗_{p ∈ R∖{q}} Π_p` tempered and π generic. With `G = G(F_q)`, `G′ = Π_{p ∈ R∖{q}} G(F_p)`, a level K away from R and representatives `g_1, …, g_r` of the finite set `G(F)\G(𝔸^R)/K` (AdelicAlgebraicGroups §3.4), put `Γ_j = G(F) ∩ g_j K g_j^{−1}`, embedded in G × G′; then `X = [G]/K = G(F)\G(𝔸)/K` is the finite disjoint union of the compact quotients `Γ_j∖(G × G′)`, and Tamagawa measures give `vol[G] = τ(G)`, `vol[H] = τ(H)`, X carrying the induced measure of total mass τ(G); the same holds for H with its own level and lattices `Γ_{H,j}` (NV21 §§25.6–25.7, pp. 170–172; for these pairs `τ(G) = τ(H) = 2`). The source chooses R so large that `G(F)G_R K = G(𝔸)`, so that r = 1 there; no such choice is made here, and every statement below is made on the full union. `Π_R = π ⊗ π′` embeds isometrically in `L²(X)` with a unitary adelic central character.

### 8.1 Smooth operator states

Fix a positive finite-rank smooth operator T′ of trace 1 on π′ at a fixed finite level J′. For finite-rank smooth T on π define `[T] ∈ C^∞(X)` as the restriction to the diagonal of the kernel of `T ⊗ T′` acting through the embedding into `L²(X)`: for `T = v ⊗ v̄` and `T′ = w ⊗ w̄`, `[T](x) = |(v ⊗ w)(x)|²`. The map extends continuously and G-equivariantly from finite rank to the smooth trace class `T_1(π)` of §3.8, with `‖[T]‖_{L¹} ≤ ‖T‖₁`, `∫_X [T] = tr T`, `[T] ≥ 0` for T ≥ 0, and `[T]` invariant under the adelic centre (NV21 §§26.1–26.3 and Lemma 26.2, pp. 172–176).

- For rank-one `T = u₁ ⊗ ū₂` the state is `(u₁ ⊗ w)(x) conj((u₂ ⊗ w)(x))` summed over the auxiliary decomposition of T′.
- `∫_X [T] = tr T` because `tr T′ = 1`.
- T ≥ 0 gives `[T] ≥ 0`.
- Each `C^∞(X)` seminorm of `[T]` is bounded by finitely many T_1 seminorms of T, uniformly in π.
- The central character and its conjugate cancel on the diagonal, so `[T]` is invariant under the centre.

*Needs:* §3.8, §3.9; AdelicAlgebraicGroups §3.4 (compactness); VonNeumannAlgebras V4.Core (trace).

**Checks.**

- For unit vectors v, w with `T = v ⊗ v̄`, `T′ = w ⊗ w̄`, the state is `|(v ⊗ w)(x)|²` with integral 1.
- An auxiliary T′ of trace c gives total mass `c · tr T`; the trace-one normalization cannot be dropped.
- The map is linear in T, while its value on `v ⊗ v̄` is quadratic in v: `[2v ⊗ 2v̄] = 4[v ⊗ v̄]`.
- With the finite level allowed to vary, the quotients X change and no fixed compact manifold carries all states; the fixed level J′ is what gives compactness in `C^∞(X)`.
- X can have several components: for a unitary group whose determinant torus at level K has several classes, the components `Γ_j∖(G × G′)` are indexed by those classes, and a state supported on one lattice quotient would miss the mass of the others; the total mass identity `∫_X [T] = tr T` is over the full union.

### 8.2 Semiclassical limit states

For h → 0 along a sequence with `hO_π` converging to the limit orbit O, set `[a₁, …, a_k]_h = h^d [Op_h(a₁)⋯Op_h(a_k)]`, d half the maximal coadjoint orbit dimension of G (its value also when O is empty). Along a single subsequence, simultaneously for every k and every tuple of Schwartz symbols, `[a₁, …, a_k]_h` converges in `C^∞(X)` at the fixed level to a continuous k-multilinear map whose value is `[a₁⋯a_k]`, the one-symbol limit of the pointwise product. The one-symbol limit `a ↦ [a]` is linear, positive and G-equivariant with `∫_X [a] = ∫_O a dω` (NV21 Theorem 26.4 and Lemma 26.3, pp. 176–178; the k-symbol maps are multilinear on the product of symbol spaces, not linear on it).

- Each output `C^∞` seminorm is bounded by a product of finitely many Schwartz seminorms of the inputs.
- `[a₁, …, a_k] = [a₁⋯a_k]`.
- a ≥ 0 gives `[a] ≥ 0`.
- `[g·a](x) = [a](xg)` for g ∈ G.
- `∫_X [a] = ∫_O a dω`.

*Needs:* §1.11, §3.4, §3.9, §8.1.

**Checks.**

- If O is empty, positivity and total mass 0 force `[a] = 0` for every a.
- `[a, ā] = [|a|²] ≥ 0`, which differs from `[a] · conj([a])`.
- For a fixed compact symbol with nonzero orbit integral, `h^d tr Op_h(a)` has a finite nonzero limit; normalizing by `h^{2d}` would lose all mass.
- Taking a separate subsequence for each symbol does not define a single linear map; one diagonal subsequence over a countable dense set of tuples does.

### 8.3 Equivariant disintegration of limit states

There is a weakly continuous G-equivariant assignment `ξ ↦ δ_ξ` from O to probability measures on X such that `∫_X [a] Ψ = ∫_O a(ξ) δ_ξ(Ψ) dω(ξ)` for compactly supported smooth a and continuous Ψ on X. Each `δ_ξ` is invariant under the full centralizer `G_ξ` of ξ in G and under the adelic centre. The assignment is not a linear map out of O (NV21 Theorem 26.5 and (26.8)–(26.12), pp. 178–179; (26.7) calls it linear, which only the induced map on test functions is).

*Proof route.* The bilinear functional `(a, Ψ) ↦ ∫_X [a]Ψ` is given by a distribution kernel on `𝔤^∧ × X` (PseudodifferentialOperators P3); it is positive on all nonnegative product-space tests, by positive partitions, not only on pure tensors; Riesz representation (Mathlib `RealRMK.integral_rieszMeasure`) gives a measure whose marginal on O is ω by §8.2; Radon–Nikodym gives `f_Ψ ∈ L^∞(O)` with `‖f_Ψ‖_∞ ≤ ‖Ψ‖_∞`, and convolution in G with openness of each regular orbit in O gives continuous representatives; evaluate at each ξ and apply Riesz again. Equivariance gives centralizer invariance.

*Needs:* §3.2, §8.2; PseudodifferentialOperators P3; AutomorphicSpectralTheory §0.14; Mathlib `RealRMK.integral_rieszMeasure`.

**Checks.**

- Positivity is required on nonnegative functions on the product, which are not all sums of nonnegative pure tensors.
- Each `δ_ξ` has mass 1, by the marginal identity applied to Ψ = 1 and the mass identity of §8.2.
- Invariance is under the full centralizer `G_ξ`, including its centre, not only a one-parameter unipotent subgroup.

### 8.4 Regular nilpotent centralizer rigidity

For a quasi-split real reductive group G, a nilpotent element in the nilradical of a Borel subalgebra is regular if and only if all its simple-root components are nonzero (NV21 Lemma 27.5, p. 183, citing Kostant). The full Lie centralizer `𝔤_ξ` of a regular nilpotent ξ is abelian of dimension rank G and contains the centre. If S is a connected reductive algebraic subgroup of G whose Lie algebra contains `𝔤_ξ`, then S = G (NV21 Lemma 27.12, p. 186).

*Proof route.* Complexify and use NilpotentOrbits N2.1 (Jacobson–Morozov) and N2.3 (the regular orbit and its centralizer dimension, compared with simple-root coefficients); a real Borel exists by quasi-splitness and Kostant's criterion descends (kostant59, Theorem 5.3). For rigidity, containing the full centralizer forces equal rank and the centre; choose a compatible Cartan and positive system for S, compare simple-root components and the regular centralizer dimension, and conclude that every root space of G lies in S.

*Needs:* §3.1; LieGroups Layer 1; NilpotentOrbits N2.1, N2.3.

**Checks.**

- The full centralizer, including the centre, is needed for equal rank: in SL₃ the principal SL₂ contains a regular nilpotent but not its full centralizer and is a proper reductive subgroup.
- For `GL_n(ℝ)` the regular nilpotents are the conjugates of a single nilpotent Jordan block, and the centralizer of the upper-triangular Jordan block is the algebra of polynomials in it, of dimension n.

### 8.5 Connectedness of real points of simply connected groups

If G̃ is a simply connected semisimple algebraic group over ℝ, then G̃(ℝ) is connected in its Lie topology, and the same holds over ℂ. Hence the image of G̃ at the archimedean places lies in, and generates the derived part of, the identity component (NV21 proof of Lemma 27.11, p. 185, citing É. Cartan). Algebraic simple connectedness is the hypothesis; it differs from topological simple connectedness of a Lie group.

*Proof route.* Reduce to almost simple factors; for a real form use the Cartan decomposition (LieGroups Layer 9) and the comparison of the algebraic fundamental group with that of the maximal compact subgroup of the complex group, whose fixed points under the Cartan involution are connected when the complex group is simply connected.

*Needs:* LieGroups Layers 5, 7 and 9.

**Checks.**

- `SL₂(ℝ)` is connected and SL₂ is algebraically simply connected.
- `PGL₂(ℝ)` is disconnected, and PGL₂ is not simply connected; `SO(2)` is connected but is a torus, outside the semisimple hypothesis; for p, q ≥ 1 with p + q ≥ 3, `SO(p, q)` is disconnected, and SO(p,q) is semisimple but not simply connected, its simply connected cover being Spin(p,q). For p = q = 1, SO(1,1) and Spin(1,1) are one-dimensional split tori, outside the semisimple hypothesis.

### 8.6 Centralizer-invariant measure classification

Prove first the lattice form of the Borel density theorem: for a closed subgroup S of `GL_ℓ(ℝ)` and a lattice `Γ_S` in S, every unipotent element u of S lies in the Zariski closure of `Γ_S` in `GL_ℓ(ℝ)`, that is, every polynomial in the matrix entries and the inverse determinant vanishing on `Γ_S` vanishes at u (morris05, Proposition 4.7.1, p. 139; its hyperbolic part is not used). Two steps. First, for a finite-dimensional rational representation ρ of `GL_ℓ`, a `Γ_S`-invariant subspace W of dimension k and a unipotent u ∈ S, W is ρ(u)-invariant: push the S-invariant probability measure on `S/Γ_S` forward under `sΓ_S ↦ [Λ^k ρ(s) W]` into the projective space of `Λ^k ρ`, where it is ρ(u)-invariant; writing `ρ(u) = 1 + N` and taking a vector v with `N^r v ≠ 0 = N^{r+1} v`, the lines `[ρ(u)^n v] = [Σ_{j ≤ r} C(n, j) N^j v]` converge to the fixed line `[N^r v]`, so Poincaré recurrence puts the pushed-forward measure on the fixed lines of ρ(u); the set of s ∈ S for which `ρ(s)W` is ρ(u)-invariant is closed, right-`Γ_S`-invariant and conull, hence all of S because the invariant probability has full support, and s = 1 gives the claim (morris05, Lemmas 4.7.3 and 4.7.5, pp. 140–141). Second, apply the first step to right translation on the finite-dimensional space `V_d` of products of `det^{−d}` with polynomials of degree at most d in the entries, which right translation preserves, and to the subspace W of `V_d` vanishing on `Γ_S`, which is `Γ_S`-invariant because `Γ_S` is a group; for p ∈ W, `p(u) = (R_u p)(1) = 0` since `R_u p ∈ W` and `1 ∈ Γ_S`.

*Needs:* Mathlib `MeasureTheory.MeasurePreserving.conservative` and `MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds` (Poincaré recurrence for a measure-preserving map of a finite measure on a second-countable space); AdelicAlgebraicGroups §2.2 (the invariant probability measure of a lattice quotient).

**Checks.**

- In the unipotent group `{[[1, t], [0, 1]] : t ∈ ℝ}` the lattice ℤ has Zariski closure the whole group, since a one-variable polynomial vanishing on ℤ is zero; the trivial subgroup is not a lattice, and its Zariski closure {1} misses `t = 1`, so the lattice hypothesis is needed.
- For `S = SO(2)` the trivial subgroup is a lattice, and its Zariski closure {1} contains every unipotent element of S, because a rotation by θ has eigenvalues `e^{±iθ}` and is unipotent only for θ ∈ 2πℤ; Zariski density of the lattice in S, the conclusion of `borel_density_unipotent_generated`, fails here, so the lattice form places only the unipotent elements in the closure.
- For `u = [[1, 1], [0, 1]]` and `v = (0, 1)ᵀ`, `N = u − 1` has `Nv = (1, 0)ᵀ` and `N²v = 0`, and `[uⁿv] = [(n, 1)ᵀ] = [(1, 1/n)ᵀ]` converges to `[(1, 0)ᵀ]`, the unique fixed line of u; the only u-invariant probability measure on ℝP¹ is the point mass there, and the rotation-invariant probability measure on ℝP¹ is not u-invariant.

In the global setting, let ξ be regular nilpotent in `𝔤 = Lie G(F_q)` and U the connected subgroup generated by `exp(𝔤_ξ)`. Every probability measure on X that is invariant under U and the adelic centre is invariant under `G_∞^+`, the identity component of `Π_{v | ∞} G(F_v)`; the fixed finite auxiliary level is kept throughout (NV21 Theorem 27.7 and Lemmas 27.8–27.11, pp. 183–186; the last containment in the proof of Lemma 27.10, p. 185, is reversed in print: the homogeneous Lie algebra contains 𝔤 at q).

*Proof route.* Reduce at fixed level to finitely many compact real lattice quotients, modulo the centre; decompose into ergodic components by the ergodic component kernel; apply Ratner's classification to each component, obtaining a closed connected subgroup S ⊇ U whose lattice `Γ_S = S ∩ Γ` satisfies, by ergodicity, that `Γ_S s U` is dense in S for some s; the lattice form of Borel density then places `sUs^{−1}`, hence S, in the real points of the Zariski closure of `Γ_S`, which is reductive by anisotropy (NV21 Lemma 27.8) and contains `𝔤_ξ`, so §8.4 gives `S ⊇ G`; pass from q to `G_∞^+` by the normal Lie ideal argument, §8.5 and strong approximation for the simply connected cover.

*Needs:* §8.4, §8.5, the lattice form of Borel density above; GeometryOfNumbersAndQuadraticArithmetic §4.2 (Ratner's measure classification 4.2.5 and the ergodic component kernel `exists_actionErgodicKernel`); AdelicAlgebraicGroups §§2.2, 3.4 and 4.2.

**Checks.**

- Each ergodic component lives on a compact real lattice quotient at the fixed level, where Ratner's hypotheses hold; varying the level would leave that setting.
- For `G_q = GL₃(ℝ)` the identity component of the centralizer of the Jordan block is `{[[a, b, c], [0, a, b], [0, 0, a]] : a > 0}` (NV21 Example 27.6, p. 183), whose unipotent part generates the subgroup to which Ratner applies; the full centralizer allows a ≠ 0 and contains −1, which lies outside the identity component.

### 8.7 Spinor and determinant component comparison

In the global setting, for a compact open level U the set `ε = G(F)G_∞^+U\G(𝔸)` of `G_∞^+`-orbits on `[G]/U` is a finite abelian group, all orbits have equal measure, and `H(𝔸) → ε` is surjective except in one case. For unitary groups the determinant identifies `G(F_v)/G(F_v)^+` with the norm-one elements of `(E ⊗ F_v)^×`, and H already surjects onto it through an anisotropic line. For orthogonal groups the spinor norm identifies `G(F_v)/G(F_v)^+` with its image in `F_v^×/F_v^{×2}`, by the identification of the image of Spin with the spinor kernel; for dim V_H ≥ 3 surjectivity of `G(F)H(𝔸) → G(𝔸)/G(𝔸)^+` follows from the local images of H and Kneser's global spinor image together with weak approximation of signs at real places; for `SO(3) ⊃ SO(2)` the spinor image of the binary H is the norm group of `K = F(√(−disc V_H))` and the cokernel is detected by the quadratic character `χ = η_{K/F} ∘ θ` of `G(𝔸)` (NV21 Lemmas 27.3–27.4 and their proofs, pp. 181–182; the printed proof asserts local spinor surjectivity of H, which fails for binary H and at real places where V_H is definite and V is not).

*Proof route.* Strong approximation for the simply connected cover makes `G(𝔸)^+ ⊆ G(F)G_∞^+U` and the quotient abelian, so conjugate levels have equal image and all orbits equal measure (NV21 (27.2) and Lemma 27.4). For U(V) realize every norm-one determinant on a nondegenerate line of V_H and identify the kernel with the SU image. For SO(V) use the spinor kernel theorem, the local spinor tables and the global spinor image.

*Needs:* §8.5; AdelicAlgebraicGroups §4.2; OrthogonalSpinGroups Layers 1–3, gap:local-spinor-images and gap:global-spinor-image; Tau Ceti `CliffordAlgebra.spinorNorm`, `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`, `CliffordAlgebra.spinorNorm_surjective_of_not_anisotropic`, `CliffordAlgebra.spinorNorm_eq_one_of_posDef`, `CliffordAlgebra.spinorNorm_eq_one_of_negDef`, `CliffordAlgebra.spinorNorm_surjective_of_indefinite`.

**Checks.**

- For a definite real quadratic space the spinor image of SO is trivial; for an indefinite one it is `ℝ^×/ℝ^{×2} = {±1}`; a definite binary V_H inside an indefinite V therefore has trivial local image where G has image {±1}.
- For a binary anisotropic V_H over ℚ_p the spinor image of SO(V_H) is the norm subgroup of index 2 (OrthogonalSpinGroups 2F), so `χ` is a nontrivial character trivial on `G(F)`, `H(𝔸)` and `G(𝔸)^+`.
- If `Π ≅ Π ⊗ χ`, then for φ ∈ Π the function `φχ` lies in Π, `∫_{[G]} |φ|² χ` need not vanish, and the H-average and the G-average of `|φ|²` can differ: the exclusion in §8.8 is necessary for the argument.

### 8.8 Arithmetic equidistribution of limit states

In the global setting, with good auxiliary levels, and assuming `Π ≇ Π ⊗ (η_{K/F} ∘ θ)` when (G, H) = (SO(3), SO(2)), every limit state satisfies `τ(H)^{−1} ∫_{[H]} [a] = τ(G)^{−1} ∫_{[G]} [a]` for every Schwartz symbol a (NV21 Theorem 27.1, p. 181, with the self-twist exclusion of the binary orthogonal case added; §25.7, pp. 171–172).

*Proof route.* Fixed generic π has a nonempty regular nilpotent limit orbit (§3.6), and the measures `δ_ξ` of §8.3 are invariant under `G_ξ` and the centre; §8.6 makes them `G_∞^+`-invariant; §8.7 equates the normalized H- and G-averages of `G_∞^+`-invariant functions, the χ-component vanishing because `[a]` is built from `|φ|²` with φ ∈ Π and `Π ⊗ χ ≇ Π`; integrate the disintegration over O.

*Needs:* §3.6, §8.3, §8.6, §8.7; AdelicAlgebraicGroups §§2.4 and 3.4.

**Checks.**

- Genericity of π at q is what makes O nonempty; for nongeneric π both sides are 0 by §8.2.
- Both averages are normalized by their own Tamagawa volumes; with `τ(G) = τ(H) = 2` an unnormalized comparison would agree here by accident and fail under a rescaling of the H measure.

### Examples

For `SO(3) ⊃ SO(2)` with V anisotropic over a totally real F, definite at every archimedean place except q, the limit states of a fixed principal series Π_q are equidistributed on [G] in the sense of §8.8 provided Π is not its own twist by the quadratic character attached to `F(√(−disc V_H))`.

### Dependencies

Layers 0–3; NilpotentOrbits N2; LieGroups Layers 1, 5, 7, 9; GeometryOfNumbersAndQuadraticArithmetic §4.2; AdelicAlgebraicGroups §§2.2, 2.4, 3.4, 4.2; OrthogonalSpinGroups Layers 1–3, gap:local-spinor-images and gap:global-spinor-image; PseudodifferentialOperators P3; AutomorphicSpectralTheory §0.14; VonNeumannAlgebras V4.Core; Mathlib `RealRMK.integral_rieszMeasure`, `MeasureTheory.MeasurePreserving.conservative`, `MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds`; Tau Ceti `CliffordAlgebra.spinorNorm`, `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`, `CliffordAlgebra.spinorNorm_surjective_of_not_anisotropic`, `CliffordAlgebra.spinorNorm_eq_one_of_posDef`, `CliffordAlgebra.spinorNorm_eq_one_of_negDef`, `CliffordAlgebra.spinorNorm_surjective_of_indefinite`.

## Layer 9: Truncated periods and the weighted asymptotic formula

The positive period functional and its factorization, the smooth period Parseval identity with a weak Weyl bound, the microlocal truncation of the spectral sum, the stable neighbourhoods that make the truncated family orbit-distinguished, and the smoothly weighted asymptotic formula.

### 9.1 The positive period functional and local factors

Fix once and for all an orthogonal decomposition of `L²([H])` into irreducible automorphic subrepresentations Σ, unramified outside R as in the global setting; a Σ is a summand of this decomposition, so an isomorphism class of global multiplicity m contributes m summands (NV21 §25.3, p. 168). For the fixed Π and every such Σ, define `P_Σ(T, S′)` for positive finite-rank smooth T on π and S′ on π′ by summing, over a decomposition of `T ⊗ S′` into rank-one terms `v ⊗ v̄`, the squared norm of the orthogonal projection of `v|_{[H]}` onto the summand Σ, and extend linearly; put `P_Σ(T) = P_Σ(T, T′)` for the fixed auxiliary T′. When σ and σ′ are tempered, `H_σ` and `H_{σ′}` are the tempered relative characters of §4.5 and the branching coefficient is defined as follows. If the product functional `(T, S′) ↦ H_σ(T) H_{σ′}(S′)` is nonzero, `L(Π, Σ)` is the unique scalar with `P_Σ(T, S′) = L(Π, Σ) H_σ(T) H_{σ′}(S′)` for all T and S′, which exists by the global period factorization; if it vanishes identically, put `L(Π, Σ) = 0`, and then `P_Σ = 0` as well: the tempered local period form is nonzero exactly when the local intertwining space is nonzero (GanGrossPrasadUnitaryGroups §3.3 at the places where E is a field, §5.1a at the places where E splits, gap:orthogonal-local-period-form for orthogonal pairs), so a nonzero global period, which factors through nonzero local intertwining spaces, would give nonzero `H_σ` and `H_{σ′}` (NV21 §25.4, pp. 168–169; §§28.1–28.2 and (28.1)–(28.6), pp. 187–189). In particular `P_Σ(T) = L(Π, Σ) H_σ(T) H_{σ′}(T′)` for every T, also when `H_{σ′}(T′) = 0`. When σ or σ′ is nontempered, no `L(Π, Σ)` is defined and `P_Σ` is kept as it is: it enters the Parseval identity of §9.2 and the truncation of §9.3 as a summand, and it is bounded in §9.5 through the nontempered clause of §7.2 and the auxiliary majorants of §7.6, using that `P_Σ(− ⊗ T′)` is an H-invariant nonnegative Hermitian form on π and hence, by multiplicity one, a nonnegative multiple of the auxiliary form `H_σ` of §4.5, whose normalization makes it nonzero whenever `P_Σ(− ⊗ T′)` is (NV21 §28.2, p. 188, cases (i)–(ii)). The factorization and the local period forms are supplier inputs, not consequences of the definition.

- For `T = v ⊗ v̄`, `P_Σ(T)` is the squared norm of the Σ-projection of the restriction of the automorphic vector.
- `P_Σ(T) ≥ 0` for T ≥ 0.
- `P_Σ` extends by polarization to a linear functional on smooth finite-rank operators.
- With the supplied normalization, `P_Σ = L(Π, Σ) H_σ ⊗ H_{σ′}` on operators `T ⊗ S′` whenever σ and σ′ are tempered; for nontempered σ, `P_Σ(− ⊗ T′) = c H_σ` with c ≥ 0 and the auxiliary `H_σ` of §4.5, and no coefficient L is attached.
- For summands Σ₁, Σ₂ of the decomposition that are isomorphic, `P_{Σ₁} + P_{Σ₂}` is the squared norm of the projection onto `Σ₁ ⊕ Σ₂` and `L(Π, Σ₁) + L(Π, Σ₂)` its coefficient; these sums do not depend on how the isotypic part is split into summands.

*Needs:* §4.5, §8.1; AutomorphicSpectralTheory §§4.5, 4.7; GanGrossPrasadUnitaryGroups §§2.6, 3.3, 4.2, 5.1a (unitary multiplicity one, the local period forms at nonsplit and at split places, factorization); gap:orthogonal-multiplicity-one; gap:orthogonal-local-period-form; gap:orthogonal-period-factorization.

**Checks.**

- If the restriction of v is orthogonal to Σ, the period is 0.
- Replacing v by cv multiplies the period by `|c|²`, not c.
- Two orthogonal copies Σ₁, Σ₂ of one isomorphism class, onto each of which v projects with squared norm 1 and with local factors normalized to 1, give `P_{Σ₁} = P_{Σ₂} = 1`, summing to 2 as Parseval requires; projecting each summand onto the whole isotypic part would give 2 for each and a total of 4.
- At a compact SO(2) auxiliary factor with σ′ of weight 1 and T′ the projection onto weight 0, `H_{σ′}(T′) = 0` and `P_Σ(T) = 0` for every T, so `P_Σ(T) = L H_σ(T) H_{σ′}(T′)` alone determines no L; with S′ variable, the weight-one projection has `H_{σ′}(S′) = 1` and determines L.
- If σ and σ′ are tempered and one of them is not locally distinguished, `L(Π, Σ) = 0` by convention and `P_Σ = 0`.
- The equation `P = L · 0` with P ≠ 0 cannot arise: for tempered σ, `H_σ = 0` forces `Hom_H(π, σ) = 0` and hence a zero period; for nontempered σ the normalization of §4.5 makes `H_σ` nonzero whenever a nonzero intertwiner exists, so `P_Σ(− ⊗ T′) = c H_σ` with `c ≥ 0`, and `P_Σ(− ⊗ T′) ≠ 0` forces `c > 0`. A convention allowing `H_σ = 0` on a nontempered σ with `Hom_H(π, σ) ≠ 0` would leave a nonzero `P_Σ` undetected by every local form, which is why the auxiliary form is normalized as it is. At a split place of a unitary pair the local form is the one of §5.1a, nonzero on some smooth tensor for every tempered pair: with `GL₂(F) ⊃ GL₁(F)` and nonzero Whittaker test vectors it has the positive diagonal value `ab |λ(W)|²` for positive measure constants a, b, so a citation of §3.3 alone, which excludes `E = F × F`, would leave that place without a form.

### 9.2 Smooth period Parseval and the weak Weyl bound

For T ∈ `Ψ^{−∞}(π)`, `∫_{[H]} [T] = Σ_Σ P_Σ(T)`, the sum over the summands of the fixed decomposition of §9.1, absolutely convergent and compatible with differentiation at the fixed auxiliary level. The number of summands Σ with nonzero period and `|λ_σ| ≤ x` is `O((1 + x)^C)` with C depending on the groups and the level (NV21 §28.1, (28.3), p. 187; §29.2 and (29.2), p. 190).

*Proof route.* For positive finite-rank T apply Parseval in `L²([H])` to each restricted vector and sum the auxiliary decomposition; for general smoothing T use the smooth two-variable kernel and its absolutely convergent spectral expansion, with high elliptic Sobolev powers dominating the tail (smoothness of the diagonal alone does not suffice); count with the polynomial eigenvalue bound.

*Needs:* §8.1, §9.1; AutomorphicSpectralTheory §4.7, gap:kernel-spectral-expansion, gap:polynomial-eigenvalue-count and gap:orbit-restriction-sobolev (restriction to `[H]`).

**Checks.**

- For positive finite-rank T both sides are sums of nonnegative terms and Parseval is monotone.
- Multiplicities count: an isomorphism class occurring twice contributes two summands, both to the Parseval sum, where each carries only its own projection, and to the Weyl bound.

### 9.3 Microlocal period truncation

Let W ⊆ 𝔥^∧ be open and U ⊆ `[𝔥^∧]` an open set containing the image of W, and let compactly supported symbols `a₁, …, a_k` have supports lying over W. Call σ good if `hλ_σ ∈ U` and either σ is nontempered or `hO_σ` meets W. Then `∫_{[H]} [a₁⋯a_k] = lim_{h → 0} h^d Σ_{Σ : σ good} P_Σ(Op_h(a₁)⋯Op_h(a_k))`, the sum running over the summands of the fixed decomposition of §9.1 (so an isomorphism class of multiplicity m contributes m terms, each with its own projection) and including the auxiliary factor; the discarded large-parameter terms and the tempered terms missing W each contribute 0 in the limit (NV21 Theorem 29.1 and §§29.2–29.3, pp. 190–193).

*Proof route.* Choose a relatively compact U₀ ⊆ U containing the parameters of the projected supports; outside U₀ apply §2.7 with strong spectral decay and sum with §9.2, which is valid also for unbounded U. For tempered σ with `hO_σ ∩ W = ∅`, factor the relative operator through σ-quantizations with b = 1 on the projected support and supported in W, and use `|tr(T₁T₂)|² ≤ tr(T₁*T₁) tr(T₂*T₂)` with the first factor negligible by §3.7 (correcting the mixed factor `tr(T₁*T₂)` printed in the proof, p. 191). Inside U₀, §9.2 gives polynomially many terms, beaten by the h-gain.

*Needs:* §2.7, §3.7, §8.2, §9.2.

**Checks.**

- The large-parameter tail and the tempered orbit-missing tail are separate estimates.
- In the Hilbert–Schmidt Cauchy–Schwarz inequality the negligible factor is `tr(T₁*T₁)`.

### 9.4 Stable neighbourhoods for truncation

For k ≥ 0 compactly supported in `[𝔥^∧] ∩ image(O_stab)` and a limit `hO_π → O`, there are precompact open V ⊆ 𝔤^∧, W ⊆ 𝔥^∧ and U ⊆ `[𝔥^∧]` with: closure(V) stable; supp k inside the interior of the image of V; closure of the restriction of V inside W; image of closure(W) inside U; closure(U) inside the image of O_stab; and, for all small h, every tempered σ with `O_{π,σ} = ∅` has `hO_σ ∩ W = ∅`. Thus the good tempered summands of §9.3 selected by W are orbit-distinguished (NV21 Lemma 30.3 and Definition 30.2, p. 195; the conditions are stated with explicit closures and interiors because the source's relation ≺ is not transitive).

*Proof route.* Cover a compact set of stable limit-orbit points whose image covers supp k; at a stable point the restriction map from the G-orbit to 𝔥^∧ is a submersion (trivial stabilizer); §3.5 provides nearby points of `hO_π` for small h and the submersion theorem gives uniform image neighbourhoods; take nested finite unions.

*Needs:* §3.5, §5.3, §7.1.

**Checks.**

- The restriction differential is onto at stable points because the 𝔥-stabilizer is trivial; at an unstable point it can fail.
- Each closure is taken in the space where the next set lives; `A ≺ B ≺ C` does not imply `A ≺ C`.

### 9.5 The smoothly weighted period asymptotic

In the global setting of Layer 8, including the exclusion `Π ≇ Π ⊗ (η_{K/F} ∘ θ)` for SO(3) ⊃ SO(2), fix k ∈ `C_c^∞([𝔥^∧] ∩ image(O_stab))` and an auxiliary weight k′ on the tempered π′-distinguished dual of `H′`: a finite linear combination of products of finitely supported weights at the compact archimedean places and allowable weights (§7.6) at the finite places of R ∖ {q}. Then `h^d Σ_Σ L(Π, Σ) k_h(σ) k′(σ′) → (τ(H)/τ(G)) ∫ k ∫ k′`, the sum over the summands Σ of the fixed decomposition of §9.1 with σ, σ′ tempered and `O_{π,σ} ≠ ∅` (an isomorphism class of multiplicity m contributes m terms, each with its own `L(Π, Σ)` as in §9.1, so multiplicity is counted once), ∫k for the normalized affine measure on `[𝔥^∧]` and ∫k′ for the Plancherel measure of `H′` (NV21 Theorem 30.1, Definition 30.2 and Lemmas 30.3–30.6, pp. 194–200).

*Proof route.* Choose V, W, U by §9.4. By linearity reduce to nonnegative product weights. Build tensor-product tests from §7.2 at q and §§7.6–7.8 at the auxiliary places, with trace-small positive majorants; apply §9.2, §9.3 and §8.8: the main mass is the normalized affine integral of k (§5.9, §7.2) times the auxiliary Plancherel mass. Control nontempered terms by the small-mass test a_nt and the all-unitary auxiliary majorants: for nontempered σ the form `P_Σ(− ⊗ T′)` is a nonnegative multiple of the auxiliary `H_σ` of §4.5 (§9.1), so the nontempered clause of §7.2 gives `P_Σ(Op_h(a)² ⊗ T′) = P_Σ(Op_h(a_nt)² ⊗ T′) + O(h^N)` without any coefficient `L(Π, Σ)`; sum residual `O(h^N)` terms by §9.2. Let h → 0 before the tolerance ε → 0; every subsequence has a further subsequence with the same limit, giving the full limit.

*Needs:* §5.9, §7.2, §7.3, §7.6, §7.8, §8.8, §9.1, §9.2, §9.3, §9.4.

**Checks.**

- Rescaling the Haar measure of H_q by c > 0, with the global measure on [H] fixed, multiplies each `H_σ` by c and hence `L(Π, Σ)` by `c^{−1}`; it multiplies the measure on 𝔥, divides the dual measure on 𝔥^∧ by c and so multiplies the normalized affine measure on `[𝔥^∧]` by `c^{−1}`. Both sides scale by `c^{−1}`.
- The self-twist exclusion is carried into the statement; without it the binary orthogonal case can have an extra contribution `∫_{[G]} [a] χ`.

### Examples

For `U(2) ⊃ U(1)` with `G_q = U(1,1)`, d = 1 and Σ runs through automorphic characters of the anisotropic U(1); about `h^{−1}` of them have `hλ_σ` in supp k, and §9.5 says that their coefficients `L(Π, Σ)`, weighted by `k(hλ_σ)k′(σ′)`, have average `(τ(H)/τ(G)) ∫k ∫k′` against that count.

### Dependencies

Layers 0–8; AutomorphicSpectralTheory §§4.5, 4.7, gap:kernel-spectral-expansion, gap:polynomial-eigenvalue-count and gap:orbit-restriction-sobolev; GanGrossPrasadUnitaryGroups §§2.6, 3.3, 4.2, 5.1a; gap:orthogonal-multiplicity-one; gap:orthogonal-local-period-form; gap:orthogonal-period-factorization.

## Downstream consumers

QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, Part II starts from §9.5: it passes from smooth weights to the indicator functions of nice sets, divides by the size of the family and expresses the result through central L-values (the source's §31, Theorem 31.11). Within this roadmap, Layers 0–3 are the general microlocal calculus that any later microlocal application to representations of Lie groups consumes, and Layer 5 is the GGP invariant theory consumed by any relative-trace comparison of stable orbits.

## Worked examples

**The additive line.** Take G = ℝ and `Π_t(x) = e^{itx}`. With ξ = iη its parameter is it, its coadjoint orbit is the point {it}, d = 0 and the orbit measure has mass 1. The rescaled operator is `Op_h(a) = ∫ χ(hx) a^∨(x) e^{ihtx} dx`; if the cutoff is inactive on the inverse-transform support it equals `a(iht)`, and for Schwartz symbols the cutoff changes it by `O(h^∞)`. The constant symbol quantizes to 1, the linear symbol `ξ(∂_x)` to it, and `1 + |ξ|²` to `1 + t²`, so `‖v‖_s = (1 + t²)^{s/2}‖v‖`. All BCH coefficients after C_0 vanish. In the η-coordinate of the Lean statements, `quantize Π_t χ b = b(t/(2π))` when χ = 1 on supp `𝓕 b`. These computations together pin the Fourier sign, the semiclassical parameter, the sign of the quadratic symbol, the Sobolev exponent and the trace exponent.

**Orbit scaling and an empty limit.** For a two-dimensional orbit the normalized measure is `σ/(2π)` and dilation by t > 0 pushes `ω_O` forward to `t^{−1}ω_{tO}`: the exponent is half the dimension. On ℝ the point masses at in converge vaguely to 0 on compact tests, so the empty multiorbit is needed as a limit, and its zero measure does not contradict the unit mass of each point orbit. For a fixed representation of a compact group with d > 0, `hO_π` shrinks to the origin with mass `O(h^d)`, again with empty limit. For a compact torus d = 0: the character `e^{imθ}` of U(1) has `hO_π = {ihm} → {0}` with mass 1 throughout, and the limit is the point orbit {0}, which is nonempty and regular nilpotent.

**Compact restriction and its constants.** Let H be compact with Haar mass 1. If T has trace c on the σ-isotypic part of π, then `H_σ(T) = c/dim σ`; multiplying by the Plancherel atom dim σ recovers c, and summing over σ recovers tr T. Replacing the factor `1/dim σ` by 1 fails already for an irreducible σ of dimension 2. Multiplying the Haar measure by b > 0 multiplies the relative character by b and divides the Plancherel measure by b.

**A stable fibre uses one ambient point.** The joint fibre is `{x : q(x) = λ, r(x) = µ}` in one variable x. For `q(x) = x²` and `r(x) = x` on ℝ the fibre over (4, 2) is {2} and over (1, 2) is empty; for the two coordinate projections of ℝ² the fibre over (3, 5) is {(3, 5)}. For a GGP pair a nonempty stable real fibre is an H-torsor with transported Haar measure, and the algebraic torsor statement does not make a real fibre nonempty. On 𝔰𝔬₂ ⊃ 𝔰𝔬₁ the fibre over a point of the quotient is a single matrix, while equal characteristic polynomials allow two; the quotient includes the Pfaffian, which `InvariantlyEquivalent` encodes.

**Almost orthogonality and positive states.** Let P_j be the orthogonal projections onto the coordinate lines of ℓ². Both Cotlar row sums equal 1, the partial sums converge strongly to the identity and every nonempty tail has norm 1: strong, not norm, convergence. A finite diagonal state `F(x) = Σ_i w_i |v_i(x)|²` is nonnegative when the w_i are, and has integral `Σ_i w_i` when each v_i has unit L² norm; one index of weight 3 with `|v(x)|² = 4` gives the value 12 at x, the empty index set gives 0. The operator states of §8.1 extend this model through smooth trace ideals with the trace-one auxiliary normalization.

**The binary orthogonal component.** For an anisotropic binary V_H the spinor image of `SO(V_H)` is the norm group of `K = F(√(−disc V_H))`, whose annihilator gives `χ = η_{K/F} ∘ θ` on `G(𝔸)`. If `Π ≅ Π ⊗ χ`, the equality of component averages of §8.8 does not follow from the argument, and the global theorems exclude this self-twist for SO(3) ⊃ SO(2). An assertion that every local spinor norm of H is surjective would also fail at real places where V_H is definite and V is not.

## References

- nv21: Paul D. Nelson and Akshay Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Mathematica 226 (2021), 1–209, doi:10.4310/ACTA.2021.v226.n1.a1 (publisher open access). All page numbers are the printed pages.
- rossmann78: Wulf Rossmann, *Kirillov's character formula for reductive Lie groups*, Inventiones Mathematicae 48 (1978), 207–220, doi:10.1007/BF01390244 (paywalled; cited by its locator); cited for the route of §3.3 and Lemma C used in §5.5.
- rangarao72: R. Ranga Rao, *Orbital integrals in reductive groups*, Annals of Mathematics 96 (1972), 505–510, doi:10.2307/1970822 (paywalled; cited by its locator); cited for the route of §3.2.
- barbasch-vogan80: Dan Barbasch and David A. Vogan, Jr., *The local structure of characters*, Journal of Functional Analysis 37 (1980), 27–55, doi:10.1016/0022-1236(80)90026-9 (paywalled; cited by its locator); cited for the route of §3.6.
- kostant63: Bertram Kostant, *Lie group representations on polynomial rings*, American Journal of Mathematics 85 (1963), 327–404, doi:10.2307/2373130 (paywalled; cited by its locator); cited for the fibre count of §3.2 (Theorem 3 and Remark 16, as cited in NV21 §6.1).
- kostant59: Bertram Kostant, *The principal three-dimensional subgroup and the Betti numbers of a complex simple Lie group*, American Journal of Mathematics 81 (1959), 973–1032, doi:10.2307/2372999 (paywalled; cited by its locator); cited for the route of §8.4 (Theorem 5.3, the regular-nilpotent criterion, as cited in NV21 Lemma 27.5).
- whitney57: Hassler Whitney, *Elementary structure of real algebraic varieties*, Annals of Mathematics 66 (1957), 545–556, doi:10.2307/1969908 (paywalled; cited by its locator); cited for the finiteness of connected components of real algebraic sets in §3.2 (§3, as cited in NV21 §6.1).
- kostant78: Bertram Kostant, *On Whittaker vectors and representation theory*, Inventiones Mathematicae 48 (1978), 101–184, doi:10.1007/BF01390249 (paywalled; cited by its locator); cited for the genericity criterion in §3.6 (Theorem 6.7.2, as cited in NV21 Lemma 11.6).
- rallis-schiffmann: Stephen Rallis and Gérard Schiffmann, *Multiplicity one conjectures*, arXiv:0705.2168; cited in §5.2 for the related stability equivalence (Theorems 6.1 and 17.1, as cited in NV21 Remark 14.9).
- morris05: Dave Witte Morris, *Ratner's Theorems on Unipotent Flows*, Chicago Lectures in Mathematics, University of Chicago Press, 2005; read in the author's arXiv text, arXiv:math/0310402v5, whose page numbers are cited; cited in §8.6 for the lattice form of the Borel density theorem (Proposition 4.7.1) and its recurrence lemmas (Lemmas 4.7.3 and 4.7.5).
