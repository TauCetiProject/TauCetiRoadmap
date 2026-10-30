# Roadmap: metaplectic groups, Weil representations and automorphic theta kernels

**Summary.** This roadmap builds the oscillator (Weil) representation and its metaplectic double cover over local fields and adeles, and from them the local theta correspondence, global theta kernels and lifts, the regularized Siegel–Weil and Rallis inner-product identities, half-integral-weight Maass forms with the Kohnen plus space and the Shimura lift, and the genus-two Jacobi–Eisenstein analysis of Bump–Friedberg–Hoffstein. It starts from bilinear Heisenberg extensions built on Tau Ceti's factor sets, Mathlib's bilinear forms, Schwartz spaces and measures, and the Schwartz–Bruhat, adelic-measure, smooth-representation, automorphic-form and spectral roadmaps of TauCetiRoadmap. Its end theorems are Howe duality, the conservation relations and the see-saw identities in the generality the sources prove them (Layer 3), the Weil product formula and the global Weil representation (Layer 4), theta lifts and their convergence (Layer 5), the Siegel–Weil, Rallis inner-product and theta nonvanishing theorems (Layer 6), the Duke–Imamoḡlu–Tóth trace identities and the Shimura bijection in weight one half (Layer 7), and the genus-two coefficient and local-test export used for quadratic-twist nonvanishing (Layer 8).

## Scope and ownership

This roadmap owns the oscillator side of the theory: bilinear Heisenberg extensions and Schrödinger models, the oscillator normalizer and the metaplectic double cover of `Sp(W)` over every local field, the Weil index, Leray invariant and Rao cocycle, the operator formulas, dual pairs with their splittings and local theta modules, the adelic cover and global Weil representation, theta kernels, genuine automorphic forms and theta lifts on covering groups, the Siegel–Weil, doubling and Rallis comparisons, half-integral-weight Maass forms with their plus space and Shimura lift, and the genus-two Jacobi analysis of Bump–Friedberg–Hoffstein. It uses smooth representation categories, induction and Jacquet functors from SmoothRepresentationsOfLocalGroups; local and vector-space Schwartz–Bruhat analysis and number-field Poisson summation from AutomorphicLFunctionsAndLocalFactors AL.0, with the scalar number-field adelic theory from ArithmeticGaloisRepresentations §2.7, *Global inputs*, and function-field completion-valued adeles and scalar Poisson summation from AutomorphicLFunctionsAndLocalFactors AL.3, *Curve additive analysis*; adelic, quotient and Tamagawa measures from AdelicAlgebraicGroups; growth, constant terms and real representations from AutomorphicFormsOnReductiveGroups; and Eisenstein, intertwining and special-function analysis for linear groups from AutomorphicSpectralTheory. The arithmetic Waldspurger identities belong to GrossZagierAndArithmeticHeights and the final quadratic-twist nonvanishing argument to RankZeroOneBSD; both consume this roadmap.

### Prerequisites and boundaries

The ordinary classical groups and their standard representations belong to `TauCetiRoadmap.RepresentationTheory.ClassicalGroups`, Layer 0, and `OrthogonalSpinGroups`. Finite quadratic modules, discriminant forms and Gauss invariants belong to `IntegralLattices`, Layer 1G–1H. This roadmap adds oscillator operators on those objects. Positive-definite lattice theta series and their coefficients belong to GeometryOfNumbersAndQuadraticArithmetic §3.4; the automorphic theta kernels and indefinite Siegel–Weil comparisons here use different carriers and measures. The Hermite basis and harmonic-oscillator eigen-equation are supplied by OrthogonalL2Bases, Part A §§A2–A3 (in `Completed/OrthogonalL2Bases`).

Symplectic bases over every field and the even dimension of a nondegenerate alternating space are supplied by `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank` in `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis`. The supplied basis has matrix `Matrix.J`, with pairing `ω(b(inr i), b(inl j)) = δᵢⱼ`; interchanging the two blocks gives the convention `ω(eᵢ, fⱼ) = δᵢⱼ`. The real Lagrangian predicate and dimension theorem are `TauCeti.SymplecticForm.IsLagrangian` and `TauCeti.SymplecticForm.IsLagrangian.two_mul_finrank` in `TauCeti.Geometry.Symplectic.Lagrangian.Basic`. §0.9a adds the prescribed-Lagrangian comparison over arbitrary fields. Mathlib supplies the tensor-product bilinear form `LinearMap.BilinForm.tmul`, with pure-tensor evaluation from `LinearMap.BilinForm.tensorDistrib_tmul`; §3.1 adds its alternating, nondegeneracy and dual-pair assertions without a second form definition.

`TauCeti.HeisenbergGroup`, its group law, `equivProd` and `commutatorElement_eq` supply the three-coordinate ring model. `ProfiniteArithmetic`, 3.4, supplies its product topology and pro-p detecting example. The retained bilinear construction allows arbitrary coefficient modules and forms and compares their polarization-dependent oscillator actions.

`TauCeti.Topology.Algebra.GroupExtension.FactorSet` supplies `TauCeti.FactorSet.Extension.instTopologicalSpace`, `homeomorphProd`, `isTopologicalGroup`, and `TauCeti.FactorSet.isClosedEmbedding_inl` and `isOpenMap_rightHom`. These native constructions supply the extension topology at the pin; §0.13 adds the joint-continuity comparison for the oscillator isometry action. Its boundary checks are: the zero vector module leaves the additive coefficient group; a continuous bilinear cocycle gives continuous multiplication in product coordinates; and in Hausdorff coordinates the central injection is closed while the projection is continuous, open and surjective.

Mathlib's `MonoidHom.ker` and `Subgroup.subtype` supply kernels and inclusions, `MonoidHom.comp` restricts a representation, `Submodule.mkQ_surjective` and `Submodule.liftQ` supply quotient maps and their universal property, and `QuotientGroup.mk'` and `QuotientGroup.lift` supply group quotients. Mathlib's `Representation.Coinvariants.mk`, `lift`, `lift_comp_mk` and `mk_surjective` also supply algebraic tensor coinvariants. `SemidirectProduct` supplies the abstract semidirect group and its multiplication; `MonoidHom.comp_apply` supplies character composition. These are used directly. An arbitrary character kernel does not determine the normalized metaplectic cover, an arbitrary submodule quotient does not determine the small theta lift, and an arbitrary normal subgroup quotient does not determine the adelic restricted-product cover. Those identifications are the targets 2.4b, 3.5 and 4.2.

GL2AutomorphicRepresentationsAndTransfer R17.4.13a owns the number-field rank-one package: the local and adelic circle extension of `SL₂`, its Schwartz Weil action, rational and unipotent splittings, theta sum, genuine sections and Eisenstein series. In that scope the rank-one instances here are abbreviations of those supplied carriers and definitions. The normalizer description in 1.3 and the general-rank constructions in Layers 2, 4 and 5 provide structure and comparison theorems on that same rank-one package; they introduce no second rank-one circle cover, action, splitting or Eisenstein definition. In particular 2.4b constructs its normalized double subcover, and 4.2, 4.4, 4.5, 5.1, 5.4 and 5.16 transport their general formulas to the imported objects. R17.4.13a also owns its Gelbart–Jacquet normalization, integral, unfolding and analytic estimates. The order is the rank-one package and adjoint lift there, then the general-rank comparisons here, then the adjoint applications 8.73–8.85. Its lower local Langlands and Jacquet–Langlands inputs remain separate prerequisites.

Layer 0 owns the arbitrary bilinear extension and isometry action, including the real specialization `B((a,b),(a′,b′))=(η(a,b′)−η(a′,b))/2`. NoncompactQuantumSymmetry M5.AffineG5 is a consumer of 0.1–0.13 for its one-dimensional scalar center; it owns the shear/Lorentz action, affine semidirect product and resulting cocycle. Its `η`-Heisenberg law is this specialization, rather than a vector-valued-center Heisenberg group.

GeometryOfNumbersAndQuadraticArithmetic §4.3 owns the holomorphic theta multiplier on `Γ₀(4)`, the nonvanishing of `θ` and the half-integral Kloosterman sums `halfIntegralKloosterman`. Here 7.1 uses the multiplier in the unitary normalization, and 7.12 identifies `K_{1/2}` with its odd-ℓ case. AutomorphicFormsOnReductiveGroups §6.4 owns `GSp₄⁺(ℝ)` (`positiveSimilitude`), which 8.11 writes in BFH's coordinates. AutomorphicSpectralTheory owns the Bessel functions J and I (§0.25), the Whittaker functions `M` and `W` (§§0.26–0.28), Kloosterman sums and the weight-k Laplacian (§1.16), and the weight-zero resolvent, Poincaré and Eisenstein theory for linear groups (Layers 1–2). Layer 7 and 8.76–8.80 adapt them to the theta multiplier and to the double cover.

Local Langlands inputs are taken from the roadmaps that state them: GL2AutomorphicRepresentationsAndTransfer R16.0.1 and R17.1.1 (`GL₂` and quaternionic Jacquet–Langlands) and EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3 (tempered unitary packets, conditional on its classification inputs). No TauCetiRoadmap roadmap constructs the local Langlands correspondence for `Sp₆`, so 3.41 states it as a hypothesis. The function-field programme 4.8 takes its factorization gerbe, metaplectic geometric Satake equivalence and global excursion operators as hypotheses; SmoothRepresentationsOfLocalGroups §SR.6.3 supplies only the local excursion algebra.

## Conventions

Write `e(t)=exp(2πit)` (`expTwoPi`) and `Z[w]=wᵀZw` (`quad`). Heisenberg extensions use coefficient-first coordinates (t,w), with law `(t,w)(s,v)=(t+s+B(w,v),w+v)`; the symplectic model has `B=ω/2`. BFH’s space-first convention is obtained by interchanging coordinates. QuadraticFormInvariants §6C supplies nonarchimedean Hilbert symbols, and GlobalQuadraticForms Layer 4 the real one. Local fields have characteristic different from two where stated; dyadic residue characteristic remains allowed. Use nontrivial continuous unitary `ψ` and self-dual additive measures. Left actions correspond to Kudla’s right action through inversion. Operator comparisons specify Fourier signs and root branches.

Distinguish the scalar-circle extension from its normalized `μ₂` subcover. A genuine representation sends the latter’s central `−1` to `−Id`. For an orthogonal–symplectic pair this sign acts on the oscillator by `(−1)^dim V`; theta inputs carry that matching character, so even-dimensional V uses representations of `Sp(W)` and odd-dimensional V uses genuine representations of `Mp(W)`. Fix q’s polar form as `q(x+y)−q(x)−q(y)`; its determinant differs from the quadratic determinant by `2^dimV`. In 5.7–6.9 GQT's split space is `W_n=Y_n⊕Y_n*`, with `dim_E W_n=2n` and `dim_E Y_n=n`. Its parameters are `m=m₀+2r`, `d(n)=n+ε₀`, `s₀=(m−d(n))/2` and `ρ_H=(m−r−ε₀)/2`. In 6.10–6.14 n is instead the dimension of the undoubled `U_n`; its double has Lagrangian dimension n, so the same d(n) and s₀ apply to the doubled section. Section 6.16 returns to the split Siegel–Weil convention with `dim W_n=2n`. The half-weight parameter is r/2 and the paired weight-zero parameter r. Petersson products use unnormalized hyperbolic area. In BFH, the original newform conductor is `M`, the auxiliary level `N`, and the normalized Siegel parameter `s−2`.

The degree-two theta pairing uses ordinary Lebesgue measure on `C²`. With `W=Zλ+ρ` this is `det(Im Z)dλdρ`. Its diagonal norm is `√det(Im Z)/(4a)`; the Gaussian calculation in 8.21 fixes this normalization. The finite S-transform still has factor 1/(2a), the reciprocal square root of the number of residue classes, and the real Gaussian Fourier integral in `W` has factor `√(−det Z)/(2m)` (8.62). The three factors serve different operations.

## Exact supplier contracts

The library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The contracts below use those declarations and the named roadmap sections directly.

### From Mathlib and Tau Ceti

Mathlib supplies the native groups, modules, matrices, quadratic maps, Schwartz and `L²` carriers, measures and analytic predicates. The consumed interfaces are `ArithmeticFunction.moebius`, `Complex.Gamma`, `CongruenceSubgroup.Gamma0`, `ContRepresentation`, `ContRepresentation.toRepresentation`, `Int.ModEq`, `Int.modEq_iff_dvd`, `IsArtinian`, `LinearMap.BilinForm.IsAlt`, `LinearMap.BilinForm.IsAlt.neg_eq`, `LinearMap.BilinForm.IsometryEquiv`, `LinearMap.BilinForm.IsometryEquiv.map_app`, `LinearMap.BilinForm.IsometryEquiv.symm`, `LinearMap.BilinForm.Nondegenerate`, `LinearMap.flip`, `LinearMap.BilinForm.flip_apply`, `LinearMap.BilinMap`, `LinearMap.map_add₂`, `Matrix.PosDef`, `Matrix.symplecticGroup`, `Matrix.toLin'`, `Matrix.unitaryGroup`, `MeasureTheory.Lp`, `MeasureTheory.Measure.IsAddLeftInvariant`, `MeasureTheory.integral_prod`, `MeasureTheory.integral_prod_symm`, `MeromorphicOn`, `Multiplicative`, `QuadraticForm`, `QuadraticMap.congr_fun`, `QuadraticMap.ext`, `QuadraticMap.linMulLin`, `QuadraticMap.linMulLin_apply`, `QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`, `QuadraticMap.toQuadraticMap_toBilin`, `QuotientGroup.rightRel`, `Representation.Coinvariants`, `Representation.Coinvariants.lift`, `Representation.Coinvariants.mk`, `Representation.Equiv`, `Representation.IntertwiningMap`, `SchwartzMap`, `SchwartzMap.coeFn_toLp`, `SchwartzMap.toLp`, `SemidirectProduct`, `Subgroup.mem_center_iff`, `Submodule.exists_smith_normal_form_of_le`, `dotProductBilin`, `groupCohomology.IsMulCocycle₂`, `integrable_exp_neg_mul_sq`, `integral_gaussian`, `invOf_mul_self`, `jacobiTheta₂`, `mul_left_cancel₀`, `rootsOfUnity`. They supply the underlying operations; local-field smoothness, induced covariance and automorphic growth require the supplier contracts below.

Tau Ceti supplies `TauCeti.BilinForm.isometryGroup`, `TauCeti.BilinForm.isometryGroupEquivIsometryEquiv`, `TauCeti.BilinForm.mem_isometryGroup`, `TauCeti.FactorSet`, `TauCeti.FactorSet.Extension`, `TauCeti.FactorSet.Extension.inv_left`, `TauCeti.FactorSet.Extension.inv_right`, `TauCeti.FactorSet.Extension.mul_left`, `TauCeti.FactorSet.Extension.mul_right`, `TauCeti.FactorSet.canonicalSection`, `TauCeti.FactorSet.groupExtension`, `TauCeti.FactorSet.inl`, `TauCeti.FactorSet.inl_injective`, `TauCeti.FactorSet.inl_mul_canonicalSection`, `TauCeti.FactorSet.inl_range_le_center`, `TauCeti.FactorSet.rescaleEquiv`, `TauCeti.FactorSet.rescaleEquiv_apply`, `TauCeti.FactorSet.rescaleEquiv_symm_apply`, `TauCeti.choleskyEquiv`, `TauCeti.trivialMulDistribMulAction`, `TauCeti.trivialMulDistribMulAction_smul`. Bilinear isometries act on the native factor-set extension; their continuity requires the stated topology and evaluation hypothesis.

The topological extension contracts are `TauCeti.FactorSet.Extension.instTopologicalSpace`, `TauCeti.FactorSet.Extension.homeomorphProd`, `TauCeti.FactorSet.Extension.isTopologicalGroup`, `TauCeti.FactorSet.continuous_inl`, `TauCeti.FactorSet.continuous_rightHom`, `TauCeti.FactorSet.isClosedEmbedding_inl` and `TauCeti.FactorSet.isOpenMap_rightHom` from `TauCeti.Topology.Algebra.GroupExtension.FactorSet`: the coefficient and quotient groups are topological groups, the coefficient action is continuous, and the factor set is continuous; the closed-embedding clause requires a `T₁` quotient group. General-field symplectic bases and even dimension use `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank` under finite dimensionality, alternation and nondegeneracy. Tensor forms use Mathlib `LinearMap.BilinForm.tmul` and `LinearMap.BilinForm.tensorDistrib_tmul`.

### From TauCetiRoadmap

The following roadmap sections supply the classical and quadratic foundations: IntegralLattices Layer 1 (finite quadratic modules, discriminant forms and Gauss invariants) and Layer `B` (B2, binary forms and ideal classes); FuchsianOrbifolds Layer 6 (the level-one modular quotient); GlobalQuadraticForms Layers 3, 4, 7 and 8 (admissible local invariants, the real Hilbert symbol, existence and classification); ModularForms Layers 0, 2, 4, 6 and 7 (nebentypus, Hecke operators, newforms and conductors, Atkin–Lehner and Fricke operators, L-functions); QuadraticFormInvariants §6C (Hilbert symbol and Hasse invariant, dyadic fields included); RepresentationTheory/ClassicalGroups Layer 0; RepresentationTheory/CompactGroups Layer 5 (Peter–Weyl); OrthogonalSpinGroups Layer 0 (orthogonal groups and their bilinear-form realization); ProfiniteArithmetic §3.4; OrthogonalL2Bases Part A §§A2–A3, under `Completed/OrthogonalL2Bases` (Hermite functions and the oscillator eigen-equation).

The analytic and representation-theoretic supplier contracts are:

| Roadmap | Sections used and contract |
| --- | --- |
| AdelicAlgebraicGroups | §§0.2–0.4 restricted products of Haar measures and integrals of factorizable functions; §1.2 adelic points as restricted products; §1.5 compact open subgroups; §§2.2–2.4 quotient measures, the automorphic quotient, Tamagawa measures and numbers; §§3.4–3.5 Siegel sets, finite volume and heights; §§4.4–4.5 level indices and volumes |
| AutomorphicFormsOnReductiveGroups | §0.1 smooth finite-level functions; §§0.3–0.4 Schwartz functions on the group and uniform moderate growth; §§2.1, 2.4, 2.7 admissible `(𝔤,K)-modules`, discrete series and Langlands quotients, smooth Fréchet globalizations; §§3.1–3.2 smooth automorphic forms and central characters; §§4.1–4.2 constant terms and cuspidal occurrence; §4.5 Maass forms and their Fourier expansion; §§5.4, 6.8 Vogan–Zuckerman modules and holomorphic discrete series; §6.4 `GSp₄⁺(ℝ)`, its `positiveSimilitude` carrier and multiplier (8.11 supplies only the BFH coordinate comparison); §§7.2–7.3 `GL₂` adelization and Hecke normalization. Genuine forms on covering groups (Layers 5 and 8) follow the same definitions with a genuine central character |
| ArithmeticGaloisRepresentations | §2.7, *Global inputs*: the common number-field adelic Schwartz–Bruhat space, restricted/completed tensor realization, self-dual Fourier transform and scalar Poisson summation |
| AutomorphicLFunctionsAndLocalFactors | AL.0, *Characters, trace duality and self-dual measures*, *Local Schwartz–Bruhat spaces and finite Fourier levels*, *Adelic Schwartz spaces, Poisson summation and partial transforms*, and *Bessel transforms*: local self-dual measures and Schwartz spaces, the vector-space and partial-transform extensions of the supplied scalar adelic theory, local Fourier inversion and the K-Bessel kernel; AL.1 Tate theory, archimedean and epsilon factors, ramified local theory; AL.2 Godement–Jacquet factors, `GL₂` newvectors and test vectors; AL.3 Rankin–Selberg factors and *Curve additive analysis* (completion-valued function-field adeles, residue characters, self-dual measures and scalar Poisson summation); 4.1a supplies the function-field vector-space adapter |
| AutomorphicSpectralTheory | §§0.6–0.7 spectral theorem; §0.25 Bessel J and I; §§0.26–0.28 Whittaker `M` and `W`; §1.16 Kloosterman sums and the weight-k Laplacian; §§1.1–1.3, 1.12–1.13 normalized induction and convergent Eisenstein series; §§1.20–1.21 weight-two Poincaré one-forms; §§2.1–2.6, 2.17, 2.19 intertwining operators, continuation, residues and the resolvent; §4.17a genus characters and real-quadratic surfaces |
| EndoscopicTransferAndUnitaryTraceComparison | §§11.2–11.3 tempered and extended local unitary packets with their pairings, conditional on its classification inputs |
| GL2AutomorphicRepresentationsAndTransfer | R16.0.1 finite-place local Langlands for `GL₂`; R17.1.1 quaternionic local Jacquet–Langlands; R17.4.13a the number-field rank-one circle cover, Weil action, splittings, theta and genuine Eisenstein definitions; R17.4.13 the adjoint lift |
| GeometryOfNumbersAndQuadraticArithmetic | §2.9 signed Hermitian spaces over fields, their adjoint and trace transfer; the split étale carrier is constructed in 3.2a; §3.4 lattice theta series (boundary); §4.3, in the paragraphs *Half-integral cusp forms and the ternary specialization* and *Half-integral coefficient estimate*, the theta multiplier on `Γ₀(4)`, nonvanishing of `θ` and `halfIntegralKloosterman` |
| SmoothRepresentationsOfLocalGroups | §SR.0.2 the smooth category; §§SR.2.1–SR.2.3 smooth and compact induction, Jacquet functors, the geometric lemma and Whittaker functionals; §SR.3a.1 Schur's lemma (node *admissibility-of-irreducibles*); §§SR.3.1, SR.3.3 finite length on reductive rational-point groups, cuspidal support and the Langlands classification; §§SR.4.1–SR.4.4 Satake transforms and spherical parameters; §SR.5.2, the paragraph defining the radical as the intersection of maximal proper invariant submodules and the cosocle as its quotient, supplies these generic definitions |

Every use keeps the local field, representation category, normalization and convergence hypotheses of its supplier. The remaining constructions this roadmap needs and no supplier provides (the oscillator normalizer and its character `λ₂`, the genuine adelic induced spaces, the BFH datum and its Eisenstein family) are targets here.

## How to read the build

`Suggested.lean` states smooth Stone–von Neumann (§1.1), the unitary classification and its Hilbert multiplicity theorem (§1.2), and the genus-two theta inversion formula (§8.24), against the pinned APIs. Its definitions supply the Heisenberg group, the locally constant compactly supported Schrödinger carrier and the explicit theta series needed for those statements. Its module docstring identifies the missing mathematical carriers for the other headline signatures. This README specifies every target and its basic theory; names in its other targets describe the intended library declarations.

Layer 0 fixes bilinear Heisenberg coordinates, Lagrangian polarizations and the Schrödinger models. Layer 1 proves Stone–von Neumann and builds the oscillator normalizer, an extension of `Sp(W)` by the circle. Layer 2 computes the Weil index and the Leray invariant, uses them to build the Rao cocycle, the character `λ₂` and the metaplectic double cover with its genuine Weil representation, and then gives the operator formulas and the local compact splitting of 2.6a. Layer 3 builds dual pairs, their splittings (with the Hermitian normalizations of 3.3a–3.3b) and the local theta correspondence. The Jacquet and doubling filtrations 3.12–3.13 and the type-II and MVW inputs 3.14–3.15 are built before the nonquaternionic part of 3.7. The finite-length result 3.6 precedes the instantiation of the small quotient 3.5 on big theta modules. Quaternionic conservation in 3.16 uses 3.3c independently of Howe duality and precedes the quaternionic Howe theorem in 3.7; section numbers identify the targets throughout. Layer 4 assembles the adelic cover and the global Weil representation. Layers 5 and 6 construct global theta kernels, lifts and their integral comparisons; 5.14a supplies the Poisson comparison that 5.15 uses. Layer 7 matches the classical half-integral-weight conventions and spectral transforms; 7.49 and the global companion construction 7.29a precede the normalized-series automorphy theorem 7.33. Layer 8 supplies the genus-two two-cusp analysis built from one BFH datum (8.28a) and ends with the exports 8.85–8.87. Every target needs only preceding construction stages in its layer and earlier layers; each subsection states its hypotheses, interfaces, source locator and direct prerequisites, and the examples at the end of each layer collect the convention witnesses.

## Layer 0: Symplectic and Heisenberg groups with topology

### 0.1 Bilinear Heisenberg factor set

Define `bilinearFactorSet` as follows. Construct `α_B(x,y)=B(x,y)`, viewed multiplicatively, as a normalized factor set on Multiplicative `W` with coefficients Multiplicative `C` and trivial action. Its existing extension `E_B` has multiplication `(t,x)(s,y)=(t+s+B(x,y),x+y)`. The maps `t↦(t,0)` and `(t,x)↦x` and their exactness are the native inl, rightHom and groupExtension.

`R` is a commutative ring; `W` and `C` are additive commutative groups and R-modules. `B:W×W→C` is a native R-bilinear map. Write `E_B` for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

(Kudla96, I.1, p.3).

- The additive value of `α_B(x,y)` is `B(x,y)`.
- The coefficient coordinate of pq is `t+s+B(x,y)`.
- The quotient coordinate of pq is `x+y`.

**Checks.**

- `B=0` on `Z`: `(pq).left=t+s`.
- `B(x,y)=x₀y₁` on `Z²`: `α_B(e₀,e₁)=1` additively.
- For that `B`, `α_B(e₁,e₀)=0`.

### 0.2 Inverse in the bilinear extension

Prove the inverse formula: for `p=(t,x)` in `E_B`, `p⁻¹=(−t+B(x,x),−x)`.

`R` is a commutative ring; `W` and `C` are additive commutative groups and R-modules. `B:W×W→C` is a native R-bilinear map. Write `E_B` for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

(Kudla96, I.1, p.3). *Needs:* 0.1.

### 0.3 Commutator in a bilinear central extension

Prove the commutator formula: for `p=(t,x),q=(s,y)`, with commutator convention `pqp⁻¹q⁻¹`, the commutator is `inl(B(x,y)−B(y,x))`.

`R` is a commutative ring; `W` and `C` are additive commutative groups and R-modules. `B:W×W→C` is a native R-bilinear map. Write `E_B` for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

(Kudla96, I.1, p.3). *Needs:* 0.1, 0.2.

### 0.4 Center criterion for a bilinear extension

Prove the center criterion: an element (t,x) belongs to the center of `E_B` iff `B(x,y)=B(y,x)` for every `y∈W`.

`R` is a commutative ring; `W` and `C` are additive commutative groups and R-modules. `B:W×W→C` is a native R-bilinear map. Write `E_B` for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

(Kudla96, I.1, p.3). *Needs:* 0.1.

### 0.5 Commutator for the half-alternating convention

Prove `halfForm_commutator`: Let `ω` be alternating and let 2 be invertible in `R`. In `E_{½ω}`, `pqp⁻¹q⁻¹=inl(ω(x,y))`.

`R` is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. `E_B` denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. `ω` is alternating; 2 is invertible in `R`.

(Kudla96, I.1, p.3). *Needs:* 0.1, 0.3.

### 0.6 Center of the Heisenberg group

Prove `halfForm_center`: If `ω` is alternating and nondegenerate and 2 is invertible in `R`, the center of `E_{½ω}` is exactly the range of its native coefficient injection.

`R` is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. `E_B` denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. `ω` is alternating and nondegenerate; 2 is invertible in `R`.

(Kudla96, I.1, p.3). *Needs:* 0.1, 0.5.

### 0.7 Extension isomorphism induced by an isometry

Define `extensionIsometry` as follows. For scalar forms `B` on `W` and `D` on W′ and a native isometry e:B≃D, construct the group isomorphism `E_B≃E_D` sending (t,x) to `(t,e(x))`.

`R` is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. `E_B` denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

(Kudla96, I.1, p.3). *Needs:* 0.1.

- `extensionIsometry_apply`: The coordinate formula is `(t,x)↦(t,e(x))`.
- `extensionIsometry_refl`: The identity native isometry gives the identity group isomorphism.
- `extensionIsometry_trans`: Extension of the composite f∘e is extension of f composed with extension of e, with the same order as native IsometryEquiv.trans.
- `extensionIsometry_inl`: Extension of e sends `inl_B(t)` to `inl_D(t)`.

**Checks.**

- For `B=0` on `Z`, extension of id fixes (3,4).
- Extension of negation sends (3,4) to `(3,−4)`.
- Extension of `e⁻¹` inverts extension of e, also between different modules.

### 0.8 Isometry action on the Heisenberg group

Define `extensionIsometryAction` as follows. For a scalar form `B`, construct a group homomorphism from the native TauCeti.BilinForm.isometryGroup `B` to automorphisms of `E_B`, sending e to `(t,x)↦(t,e(x))`.

`R` is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. `E_B` denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

(Kudla96, I.1, p.3). *Needs:* 0.1, 0.7.

- `extensionIsometryAction_apply`: The group element e acts by `(t,x)↦(t,e(x))`.
- `extensionIsometryAction_inl`: Every e fixes each `inl(t)`.
- `extensionIsometryAction_injective`: The action homomorphism is injective: evaluation on all (0,x) determines e.

**Checks.**

- For `B=0` on `Z`, the group identity fixes (3,4).
- Negation acts by `(3,4)↦(3,−4)`.
- Every isometry fixes `inl(t)` for all t.

### 0.9 Quadratic correction between Heisenberg cocycles

Prove `polarization_cocycle`: For scalar `B` and invertible 2, put `q(x)=½B(x,x)` and `ω=B−Bᵀ`. Then `½ω(x,y)+q(x+y)=B(x,y)+q(x)+q(y)`.

`R` is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. `E_B` denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. 2 is invertible in `R`.

(Weil64, I.§3 equation (3), printed148, PDF6). *Needs:* 0.1.

### 0.9a Lagrangian complements and adapted bases

Prove `exists_lagrangianComplement`. Let `F` be a field and `ω` a nondegenerate alternating form on a finite-dimensional F-space `W`. Write `dim W=2n`. Every Lagrangian `X` (an isotropic subspace of dimension n, equivalently `X^⊥=X`) extends to a symplectic basis `e₁,…,eₙ,f₁,…,fₙ` with `ω(eᵢ,eⱼ)=ω(fᵢ,fⱼ)=0`, `ω(eᵢ,fⱼ)=δᵢⱼ` and `X=span(eᵢ)`, so `Y=span(fᵢ)` is a Lagrangian complement and `y↦ω(·,y)|_X` is an isomorphism `Y≅X^∨`; any two Lagrangians are exchanged by an element of `Sp(W)`. When char `F≠2` the complement can be chosen canonically from any vector-space complement `V` of `X`, as the graph `{v+Av : v∈V}` of the linear map `A:V→X` determined by `ω(Av,v′)=−½ω(v,v′)` for `v,v′∈V`; A exists and is unique because `ω` pairs `X` with `V` perfectly, and isotropy of the graph is the identity `ω(v₁,v₂)+ω(Av₁,v₂)−ω(Av₂,v₁)=0`.

The adapted-basis and complement statements hold over every field, because `ω` is alternating, not merely skew; the graph correction needs ½. This target adds adaptation to a prescribed Lagrangian, its perfect pairing with a complement and transitivity on Lagrangians to the supplied symplectic-basis theorem. It is used by the polarizations of 0.10, 0.15–0.16 and 2.3.

(Cannas da Silva, *Lectures on Symplectic Geometry*, §1.1 Theorem 1.1, p.3, standard form of a skew-symmetric bilinear map, and §8.2 Proposition 8.2, pp.46–47, Lagrangian complements; both arguments are stated over `ℝ` and use only linear algebra, with the ½ of Proposition 8.2 as the one characteristic restriction. Kudla96, I.1, complete polarizations.) *Needs:* Mathlib `LinearMap.BilinForm.IsAlt`, `LinearMap.BilinForm.Nondegenerate`, `LinearMap.BilinForm.orthogonal`.

**Checks.**

- On `F²` with `ω((a,b),(c,d))=ad−bc`, `e₁=(1,0)`, `f₁=(0,1)` is a symplectic basis and `X=F·e₁` has complement `Y=F·f₁`.
- A one-dimensional space carries no nondegenerate alternating form, since `ω(v,v)=0` forces `ω=0`; odd dimension is excluded.
- Over `𝔽₂`, `ad+bc` on `𝔽₂²` is alternating and nondegenerate and has the same basis; the symmetric form `ac+bd` on `𝔽₂²` is not alternating `(ω(e₁,e₁)=1)` and has no symplectic basis.

### 0.10 Polarized Heisenberg coordinates

Define `polarizationEquiv` as follows. For scalar `B` and invertible 2, construct `E_{½(B−Bᵀ)}≃E_B` by `(t,x)↦(t+½B(x,x),x)`, with inverse `(t,x)↦(t−½B(x,x),x)`. This is a specialization of the native equivalence of rescaled extensions.

`R` is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. `E_B` denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. 2 is invertible in `R`.

(Weil64, I.§3 equation (3), printed148, PDF6; comparison with Kudla I.2 Lemma2.2 PDF7). *Needs:* 0.1, 0.9.

- `polarizationEquiv_apply`: The forward coefficient is `t+½B(x,x)`, and the quotient coordinate remains x.
- `polarizationEquiv_symm_apply`: The inverse coefficient is `t−½B(x,x)`, and the quotient coordinate remains x.
- `polarizationEquiv_inl`: The equivalence fixes the native coefficient injection.

**Checks.**

- For `B=0` on `Q`, (3,4) is fixed.
- For `B(x,y)=x₀y₁` on `Q²`, `(0,(2,3))↦(3,(2,3))`.
- The inverse sends (0,(2,3)) to `(−3,(2,3))`.

### 0.11 Criterion for the section-trivial central character

Prove `centralCharacter_multiplicative_iff`: For any group A and homomorphism `χ:Multiplicative C→A`, the function `E_B→A` given by `(t,x)↦χ(t)` preserves multiplication iff `χ(B(x,y))=1` for every `x,y∈W`.

`R` is a commutative ring; `W` and `C` are additive commutative groups and R-modules. `B:W×W→C` is a native R-bilinear map. Write `E_B` for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action. A is any group; `χ` is a group homomorphism from Multiplicative `C` to A.

(Kudla96, I.2, p.6, the asserted extension `ψ_Y`; section-trivial multiplicativity criterion). *Needs:* 0.1.

### 0.12 Section-trivial extension of a central character

Define `centralCharacter` as follows. Given `χ:Multiplicative C→A` with `χ(B(x,y))=1` for all x,y, construct the group homomorphism `E_B→A`, `(t,x)↦χ(t)`. It extends `χ` on native inl and is trivial on the native canonical section.

`R` is a commutative ring; `W` and `C` are additive commutative groups and R-modules. `B:W×W→C` is a native R-bilinear map. Write `E_B` for the existing FactorSet.Extension of the bilinear factor set.  Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action. A is any group; `χ:Multiplicative C→A` is a group homomorphism, and `χ(B(x,y))=1` for every x,y.

(Kudla96, I.2, p.6, extension `ψ_Y`; section-trivial normalization and multiplicativity hypothesis). *Needs:* 0.1, 0.11.

- `centralCharacter_apply`: At (t,x) the homomorphism evaluates to `χ(t)`.
- `centralCharacter_inl`: Its restriction along native inl is `χ`.
- `centralCharacter_canonicalSection`: Its value on each native `canonicalSection(x)` is one.
- `centralCharacter_unique`: If `ρ:E_B→A` agrees with `χ` on native inl and is one on every native `canonicalSection(x)`, then `ρ` equals centralCharacter `B χ`. Both conditions are required.

**Checks.**

- `B=0` on `Z`, `χ=id` of Multiplicative `Z`: (3,4) has additive value 3.
- Trivial `χ` gives the trivial homomorphism for every `B`.
- For `R=W=C=ℤ`, `B(x,y)=2xy` and `χ(n)=(−1)^n∈ℂˣ`, χ kills every value of the nonzero cocycle and `centralCharacter` sends `(3,4)` to `−1`.

### 0.13 Joint continuity of the oscillator isometry action

On the native topological extension `E_B`, prove that the isometry action `extensionIsometryAction` is jointly continuous when evaluation `(e,x)↦e(x)` is jointly continuous. For finite-dimensional spaces over a nondiscrete local field, give the isometry group its subspace topology inside `GL(W)` and establish that evaluation hypothesis. This action comparison is additional to the native factor-set topology.

The local field has characteristic different from two, `W` is finite dimensional, `B` is continuous and alternating in the half-form specialization, and the coefficient and vector additive groups are Hausdorff.

(Kudla96, I.1 pp.3–4; I.2 p.6). *Needs:* 0.1, 0.8.

- `heisenberg_continuous_action`: The isometry action is jointly continuous under the evaluation hypothesis.
- `extensionIsometry_inl`: Every isometry fixes the continuous central inclusion.
- `extensionIsometry_trans`: The action of e.trans f applies e first and f second. In the isometry group, e*f applies f first and e second.

**Checks.**

- The identity isometry fixes (3,4) in the zero-form real model.
- Negation sends (3,4) to `(3,−4)` and fixes every central coordinate.
- Two negations compose to the identity action.

**Additional check.** For `B=0` on `Q²`, let `e(x,y)=(2x,y)`, `f(x,y)=(y,x)`. Then `e(f(1,1))=(2,1)`, while `f(e(1,1))=(1,2)`. This distinguishes group multiplication from `IsometryEquiv.trans`.

### 0.14 Product Haar measure on the Heisenberg group

Prove `heisenberg_haar`: For `C=F`, `W=F^{2n}`, `B` continuous bilinear, the product of additive Haar measures `μ_F` and `μ_W` transported to `E_B` is both left and right Haar measure. With self-dual measures for `ψ` and `ω`, every symplectic automorphism preserves it; rescaling the central or vector measure rescales their product.

`F` is a nondiscrete local field; for symplectic invariance `ω` is nondegenerate.

(Kudla96, I.2 pp.6–10). *Needs:* 0.13; AutomorphicLFunctionsAndLocalFactors AL.0 (self-dual Haar measure, local Fourier inversion); AutomorphicLFunctionsAndLocalFactors AL.0 (self-dual Haar measures).

### 0.15 Schrödinger representation

Define `schroedinger` as follows. For `W=X⊕Y` with X,Y Lagrangian, define on `S(X)` the representation `ρψ(x+y,t)φ(u)=ψ(t+ω(u,y)+½ω(x,y))φ(u+x)`. Here `S(X)` is the actual locally constant compactly supported space at nonarchimedean places and the joint real Schwartz space at archimedean places. The formula preserves `S(X)` and gives central character `ψ`.

`F` is a nondiscrete local field of characteristic different from two; `ψ` is nontrivial continuous unitary; the polarization identifies `Y` with the algebraic dual of `X` by `ω`.

(Kudla96, I.2 Lemma2.2, PDF7, translation and phase action). *Needs:* 0.13, 0.5, 0.9a; AutomorphicLFunctionsAndLocalFactors AL.0 (local Schwartz–Bruhat space, self-dual measures).

- `schroedinger_apply`: Evaluation is the displayed translation and modulation formula.
- `schroedinger_center`: `ρψ(0,t)φ=ψ(t)φ`.
- `schroedinger_mul`: `ρψ(hh′)=ρψ(h)ρψ(h′)`.
- `schroedinger_isUnitary`: For the displayed phase/translation operator, a unit-norm character and an additive invariant measure give equality of the squared-norm integrals. `L²` descent is supplied separately.

**Checks.**

- `X=Y=0`: `ρψ(t)` is scalar `ψ(t)` on `C`.
- `ρψ(x,0)φ(u)=φ(u+x)`.
- `ρψ(y,0)φ(u)=ψ(ω(u,y))φ(u)`.
- `ρ(x)ρ(y)=ψ(ω(x,y))ρ(y)ρ(x)`.

### 0.16 Induced and coordinate Schrödinger models

Define `inducedSchroedingerEquiv` as follows. Identify `S(X)` with the smooth functions f on `H(W)` satisfying `f(h_Yh)=ψ_Y(h_Y)f(h)`, whose support is compact modulo `H(Y)`, by evaluation on the `X` section; here `H(Y)=Y×F` and `ψ_Y(y,t)=ψ(t)`. The inverse is the extension determined by covariance. Right translation gives exactly the Schrödinger formula.

`F` is nonarchimedean; `ψ` is continuous nontrivial unitary; `Y` is an isotropic F-subspace, not merely a character-self-dual lattice.

(Kudla96, I.2 Lemma2.2, PDF7, polarization realization). *Needs:* 0.15; SmoothRepresentationsOfLocalGroups §SR.2.1.

- `inducedSchroedingerEquiv_apply`: The coordinate map is `f↦(u↦f(u,0))`.
- `inducedSchroedingerEquiv_covariance`: The inverse section-evaluation map satisfies `f(t,u)=ψ(t)φ(u)`; smoothness and compact support are proved separately in 0.16.
- `inducedSchroedingerEquiv_intertwines`: The explicitly constructed coordinate translation intertwines section evaluation with the same Schrödinger phase/translation operator.

**Checks.**

- The covariant inverse of `φ` has value `φ(0)` at (0,0).
- Evaluation recovers an indicator from its inverse; local compact-open support is an additional assertion.
- An additive `Q` character taking 1/2 to `−1` cannot take it to 1; `Q₂` conductor data require the local supplier.

### 0.17 Hilbert Schrödinger model

Define `hilbertSchroedinger` as follows. Extend translation and modulation to unitary operators on the actual Hilbert space `L²(X,μselfdual)`, using almost-everywhere classes. This is a strongly continuous unitary representation of `H(W)`; its dense Schwartz subspace carries the preceding formula.

`F` is a local field of characteristic different from two; `X` is finite dimensional; `ψ` is continuous unitary.

(Weil64, I.§4, printed149, PDF7; I.§10 Théorème1, printed157, PDF15). *Needs:* 0.15, 0.14; AutomorphicLFunctionsAndLocalFactors AL.0 (local Schwartz–Bruhat space); AutomorphicLFunctionsAndLocalFactors AL.0.

- `hilbertSchroedinger_norm`: Every `ρψ(h)` preserves the `L²` norm.
- `hilbertSchroedinger_schwartz`: The `Schwartz-to-L²` dense inclusion intertwines the two actions.
- `hilbertSchroedinger_stronglyContinuous`: For every `ξ∈L²`, `h↦ρψ(h)ξ` is continuous.
- `hilbertSchroedinger_aeFormula`: The representative of the constructed `L²` isometry equals `ψ(t+uy+xy/2)` times the translated representative almost everywhere for Lebesgue measure.
- `hilbertSchroedinger_realSchwartz`: Construct the real-line Schwartz phase/translation operator.
- `hilbertSchroedinger_realSchwartz_apply`: Evaluate the real-line Schwartz operator by the same phase/translation formula.

**Checks.**

- Real-line central (t,0,0) acts by `ψ(t)`.
- Translating `exp(−πu²)` gives `exp(−π(u+x)²)` with the same `L²` norm.
- Changing a representative on a null set preserves the `L²` vector.
- In the real `L²` model, translation by one takes `exp(−πu²)` to `exp(−π(u+1)²)`; an identity operator fails this check.
- Modulation by one takes that Gaussian to `ψ(u)exp(−πu²)`, fixing the positive character sign in the real model.

### 0.18 Smooth vectors of the oscillator model

Prove `oscillator_smoothVectors`: At nonarchimedean places the smooth vectors of the Hilbert oscillator model are precisely `S(X)`. Over `R`, and over `C` viewed as a real field, the C∞ vectors for the Heisenberg group action are precisely the Schwartz functions on the underlying real `X`, with their Schwartz Fréchet topology.

The local unitary model has nontrivial central character. Archimedean smoothness means all orbit derivatives for the full Heisenberg group, not just smooth pointwise representatives.

(Kudla96, I.2 p.10). *Needs:* 0.17, 0.15; AutomorphicFormsOnReductiveGroups §2.7; SmoothRepresentationsOfLocalGroups §SR.0.2.

### Examples

For the integer bilinear form `B(x,y)=x₀y₁`, the two orders give `B(e₀,e₁)=1` and `B(e₁,e₀)=0`, so the commutator has central coordinate 1. With `B=0` the extension is additive product coordinates. Polarization uses the plus correction `t↦t+B(x,x)/2`; the inverse uses the minus correction.

### Dependencies

Within this roadmap: none. From other roadmaps: AutomorphicLFunctionsAndLocalFactors AL.0 (self-dual Haar measures, local Schwartz–Bruhat spaces, local Fourier inversion); SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.2.1; AutomorphicFormsOnReductiveGroups §2.7. Mathlib and Tau Ceti as in the supplier contracts.

## Layer 1: Stone–von Neumann and the oscillator normalizer

### 1.1 Smooth Stone–von Neumann theorem

Prove `StoneVonNeumann.smooth_stoneVonNeumann`: For a finite-dimensional symplectic space over a nonarchimedean local field of characteristic different from two and a nontrivial continuous unitary `ψ`, every irreducible smooth complex representation of `H(W)` with central character `ψ` is isomorphic to the Schrödinger model. Its Heisenberg intertwining endomorphism algebra is `C`.

No odd-residue-characteristic assumption is imposed. For the use of Sun–Zhu’s formulation restrict to characteristic zero; Kudla’s statement allows characteristic different from two. In `Suggested.lean`, the model is `StoneVonNeumann.schwartzBruhat`, the compactly supported submodule of Mathlib's `LocallyConstant`, and smoothness is the open-stabilizer condition on `Representation`; the classification includes the explicit Schrödinger formula.

(Kudla96, I.1 Theorem1.1 p.3). *Needs:* 0.16; SmoothRepresentationsOfLocalGroups §SR.0.2; SmoothRepresentationsOfLocalGroups §SR.3a.1 (Schur’s lemma).

*Proof input.* Kudla96 I.1 and Sun–Zhu refer the smooth uniqueness to Mœglin–Vignéras–Waldspurger, chapitre 2, I.2. The two steps it needs are the uniqueness of the induced model with central character `ψ` (0.16) and the scalar Schur lemma for irreducible smooth representations of the Heisenberg group over nonarchimedean `F`, a locally profinite group countable at infinity; SmoothRepresentationsOfLocalGroups §SR.3a.1 supplies the latter in exactly that generality.

### 1.2 Unitary Stone–von Neumann theorem

Prove `StoneVonNeumann.unitary_stoneVonNeumann` and `StoneVonNeumann.unitary_stoneVonNeumann_multiplicity`: Every irreducible strongly continuous unitary representation of the real Heisenberg group with nontrivial unitary central character is unitarily equivalent to `L²(X)`; all unitary representations with that character are Hilbert multiplicities of it. The complex local-field Heisenberg statement is obtained by viewing its alternating pairing and character on the underlying real group.

Finite-dimensional real symplectic space and nontrivial central character; strong continuity is required. In `Suggested.lean`, `StoneVonNeumann.halfPairing` gives the half-alternating form in an arbitrary complete polarization, and the conclusions identify the representation with the explicit almost-everywhere Schrödinger action on `MeasureTheory.Lp` or its Hilbert `lp` sum. Irreducibility means absence of a proper nonzero closed invariant subspace.

(Weil64, I.§10 Théorème1, printed157, PDF15 (scalar commutant); classification proof is Garrett20; Garrett20, Author notes23March2020, Claims0.1–0.7, PDF1–4). *Needs:* 0.17.

### 1.3 Unitary normalizer extension

Define `scalarNormalizer` as follows. Inside `Sp(W)×U(L²(X))`, take pairs (g,A) satisfying `Aρ(h)A⁻¹=ρ(g·h)` for every h. Composition gives the scalar extension `Sψ`, with kernel `z↦(1,z·id)`, `z∈U(1)`. Equip the unitary group with strong operator topology and `Sψ` with the subspace topology. Its oscillator action is the second projection.

The Hilbert Schrödinger model is strongly continuous; g acts by the inherited center-fixing Heisenberg automorphism.

(Weil64, I.§10 Théorème1, printed157, PDF15; III.§§31–36, PDF39–45). *Needs:* 0.17, 0.8, 1.2, 1.1.

*Construction.* The extension is built on the irreducible Schrödinger model of 1.2, with the strong operator topology on its unitary group. Schur's lemma for that irreducible model identifies the kernel of `S_ψ→Sp(W)` with the scalar circle; covariance under an arbitrary representation of the Heisenberg group does not give this.

- `scalarNormalizer_projection`: The covariance subgroup projects by a group homomorphism to `G`; openness, surjectivity, continuity and its scalar kernel require the actual irreducible model.
- `scalarNormalizer_covariance`: `Aρ(h)=ρ(g·h)A`.
- `scalarNormalizer_oscillator`: The covariance subgroup acts by its unitary-operator projection.

**Checks.**

- `G=1,H=C`: every unitary normalizer is a unique norm-one scalar.
- Every pair above `g=1` is uniquely `z·id`, `|z|=1`.
- For `W≠0` over `ℝ` the extension has no continuous splitting; otherwise the `μ₂` subcover of 2.4b would split as well.

### 1.4 Scalar ambiguity and composition of intertwiners

Prove `intertwinerLine_dim`: For each `g∈Sp(W)`, the smooth intertwiner space between `ρ` and its g-twist is a one-dimensional `C` vector space; its nonzero operators are invertible. Choosing `A_g` with `A_1=1` yields `A_gA_h=c(g,h)A_{gh}`, where c is a normalized scalar factor set. Rescaling `A_g` by `b(g)` changes c by `b(g)b(h)/b(gh)`. If the chosen `A_g` are unitary operators, the resulting cocycle scalars have norm one; arbitrary nonzero intertwiners need not have that normalization.

Nontrivial `ψ`; the exact smooth or strongly continuous unitary category is fixed. No global continuity of the chosen `A_g` is assumed.

(Kudla96, I.1, PDF3–5, irreducibility and intertwiners). *Needs:* 1.3, 1.1, 1.2.

### Examples

For `W=0` the Heisenberg group is its center, the Schrödinger model is `ψ` on `ℂ` and the oscillator normalizer is the circle `U(1)`, so 1.3 is the trivial extension. For `W≠0` a unitary normalizing the Schrödinger model is determined up to a scalar of modulus one (1.4); removing that circle ambiguity is the work of Layer 2.

### Dependencies

Within this roadmap: Layer 0. From other roadmaps: SmoothRepresentationsOfLocalGroups §SR.0.2 and §SR.3a.1 (Schur's lemma).

## Layer 2: Weil index, Rao cocycle, metaplectic cover and explicit operators

### 2.1 Weil index

Define `weilIndex` as follows. For a nondegenerate quadratic form q on `F^d`, define `γψ(q)∈U(1)` as the scalar in the Fourier transform of the oscillatory distribution `ψ∘q`: with positive Fourier kernel `ψ(x·y)` and coordinate self-dual Haar, its transform at y is `γψ(q)|det Bq|⁻¹/²ψ(−q(Bq⁻¹y))`, where `Bq(x,y)=q(x+y)−q(x)−q(y)`. In the Bq-self-dual measure this is `γψ(q)ψ(−q(y))`. This is not an absolutely convergent integral over `F^d`.

`F` is a nondiscrete local field of characteristic different from two, `ψ` continuous nontrivial unitary, q nondegenerate, Bq its full polar form.

(Weil64, I.§14 Théorème2, printed161–162, PDF19–20; II.§§24–28). *Needs:* AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion); AutomorphicLFunctionsAndLocalFactors AL.0.

- `weilIndex_distribution`: The Fourier transform identity above characterizes `γψ(q)`.
- `weilIndex_norm`: `|γψ(q)|=1`.
- `weilIndex_isometry`: Isometric quadratic forms have equal Weil index.
- `weilIndex_gaussSum`: For `ψq-trivial` L, `γ` is the unit normalization of `vol(L)Σ_{L′/L}ψ(q(x))`.

**Checks.**

- Dimension zero: `γ=1`.
- Over `R` with `ψ(t)=exp(2πit)`, `γ(ax²)=exp(πi sgn(a)/4)`, `a≠0`.
- For `ψ₂(t)=exp(−2πi frac₂(t))` on `Q₂`, `γ(x²)=(1−i)/√2` from `(½Z₂)/Z₂`.
- `γ(xy)=1`.

### 2.2 Weil index and Hilbert symbol

Prove `weilIndex_hilbertSymbol`: The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with `γψ(−q)=γψ(q)⁻¹`. For `η=ψ/2` define `γ(a,η)=γ(η a x²)/γ(η x²)`. Then `γ(ab,η)=(a,b)F γ(a,η)γ(b,η)`, `γ(a,ηb)=(a,b)F γ(a,η)`, `γ(a,η)²=(−1,a)F` and `γ(a,η)⁴=1`. If `q=Σa_ix_i²`, `γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F`; `det q` means `∏a_i`, not `det Bq=2^d∏a_i`.

`F` is a local field of characteristic different from two, including `Q₂` and `R`; all `a_i` and a,b are nonzero. At nonarchimedean `F`, dyadic fields included, the Hilbert symbol and local Hasse invariant are those of QuadraticFormInvariants 6C. At `F=ℝ` the same norm-equation symbol is used with the archimedean computation of GlobalQuadraticForms Layer 4.4 (`(a,b)_ℝ=−1` exactly when `a<0` and `b<0`), from which the real symmetry, bimultiplicativity and Hasse product are read off; 6C's theorems, which assume a nonarchimedean local field, are not applied at `ℝ`.

(Kudla96, I.4 pp.17–18 Lemmas4.1–4.2). *Needs:* 2.1; QuadraticFormInvariants §6C; GlobalQuadraticForms Layer 4.

### 2.3 Leray quadratic form

Define `lerayForm` as follows. For Lagrangians `L₀,L₁,L₂` in a symplectic `W`, form the nondegenerate Leray quadratic space after quotienting by `R=(L₀∩L₁)+(L₁∩L₂)+(L₂∩L₀)`. The reduced Lagrangians are the images `((L_i∩R⊥)+R)/R` in `R⊥/R`. For transverse pairs, express `L₂` as the graph of `T:L₁→L₀` and use `q_T(y)=½ω(y,Ty)`, with the sign chosen to match Kudla’s cocycle formula.

Characteristic different from two; use the symplectic quotient by the isotropic `R` and quotient out the radical of the resulting quadratic form if needed.

(Kudla96, I.3 pp.11–13). *Needs:* 0.9a, 2.1.

- `lerayForm_graph`: On the transverse graph model its quadratic value is `½ω(y,Ty)`.
- `lerayForm_isometry`: A common symplectic isometry induces an isometry of Leray forms.
- `lerayForm_reduction`: The general triple is the transverse construction on its reduced symplectic quotient.

**Checks.**

- `L₀=L₁`: the Leray form is zero.
- `ω(e₀,e₁)=1`, `L₀=Fe₀,L₁=Fe₁,L₂=F(e₀+e₁)`: `q(y)=−y²/2`.
- `L₀=L₁` transverse to `L₂`: `R=L₀` is not contained in `L₂`, so `(L₂∩R⊥)/R` is undefined.

The graph expression `ω(y,Ty)/2` (`lerayGraphForm`) is the Leray form only for a transverse pair; the full `lerayForm` on a triple needs the isotropic reduction and the radical quotient above.

### 2.4 Leray cocycle of intertwiners

Prove `leray_cocycle`: For the unitary normalized integral operators `r_Y(g)`, their factor set is `c_Y(g₁,g₂)=γψ(L(Y,Yg₁⁻¹,Yg₂⁻¹g₁⁻¹))=γψ(L(Y,Yg₂⁻¹,Yg₁))`. This obeys normalization and the two-cocycle identity because it computes actual operator composition.

Use Kudla’s right action on `W` and the same q-versus-polar-form convention as the index and Leray targets; source convention conversion is explicit.

(Kudla96, I.3 Theorem3.1 p.13). *Needs:* 0.15, 1.3, 2.1, 2.3.

### 2.4a Rao factor set

Define `raoFactorSet` as follows. Relative to `Y`, write `j(g)=rank(c_g)` and `x(g)∈F×/(F×)²` for the Bruhat square class. For `q=L(Y,Yg₂⁻¹,Yg₁)`, let `t=(j(g₁)+j(g₂)−j(g₁g₂)−dim q)/2`. Define the `μ₂-valued` Rao factor set by `(x₁,x₂)(−x₁x₂,x₁₂)(−1,det(2q))^t(−1,−1)^{t(t−1)/2}Hasse(2q)`. Its normalization and cocycle equation make a native FactorSet with trivial `μ₂` action.

`F` is nonarchimedean of characteristic different from two; the Bruhat representatives, j,x and the nonsingular Leray quotient use Kudla I.4’s normalization. Rank-zero determinants equal one. Put `η(t)=ψ(t/2)` and define `β(g)=γ(x(g),η)⁻¹γ(η)^(−j(g))`, where `γ(a,η)=γ(η_a)/γ(η)` is the normalized one-dimensional index. Prove the oriented identity `c_Y(g,h)=β(gh)β(g)⁻¹β(h)⁻¹c_Rao(g,h)`; hence the operator `β(g)r_Y(g)` has factor set `c_Rao`.

(Kudla96, I.4 pp.19–22 Proposition4.3 and Theorem4.5). *Needs:* 2.4, 2.2; QuadraticFormInvariants §6C.

- `raoFactorSet_values`: Its values lie in `μ₂`.
- `raoFactorSet_cocycle`: `c(g,h)c(gh,k)=c(g,hk)c(h,k)`.
- `raoFactorSet_beta`: The cochain just defined satisfies `c_Y(g,h)=β(gh)β(g)⁻¹β(h)⁻¹c_Rao(g,h)`.

**Checks.**

- `c(1,g)=c(g,1)=1`.
- In `SL₂`, `x(g)=c` when `c≠0`, otherwise d; `c(g₁,g₂)=(x₁,x₂)(−x₁x₂,x₁₂)`.
- On rank-one diagonal matrices the factor is `(a,b)_F`, so the full Levi need not split.

### 2.4b Metaplectic double cover

Define `metaplecticCover` as follows. For nonarchimedean `F` take the native extension `E_{c_Rao}` and identify `(g,ε)` with `(T_g,εβ(g)r_Y(g))` in `Sψ`, where `T_g(w)=wg⁻¹` converts Kudla’s right matrix action to the native left action. Give it the topology of ker `λ₂⊂Sψ`, where `λ₂` is the continuous character restricting to `z↦z²` on the scalar circle. Over `R` use the same kernel construction. Over `C Sψ≃Sp(W)×U(1)`, and the double cover is `Sp(W)×μ₂`. It is a topological central extension by `μ₂`, nonsplit when `W≠0` and `F≠C`.

Local field characteristic different from two, finite-dimensional symplectic `W`. The zero-dimensional cover is `μ₂`. The discontinuous global Bruhat section does not define a product topology on `Sp×μ₂`.

(Weil64, IV.§§42–44, printed194–199, PDF52–57). *Needs:* 1.3, 2.4a, 2.4.

*Construction of λ₂.* For nonarchimedean F, 2.4a first gives an algebraic identification `(g,z)↦(T_g,zβ(g)r_Y(g))` of the Rao circle extension with `S_ψ`. The formula `λ₂(g,z)=z²` is an algebraic homomorphism. Establish its continuity in the strong-operator/subspace topology by constructing an open identity neighborhood U and a strongly continuous normalized operator section `A:U→S_ψ`, whose Rao scalar is in `μ₂`. Use local Gauss decomposition and the normalized unipotent and Levi operators of I.2 and I.4; prove their strong continuity and the scalar comparison with `β(g)r_Y(g)`, including across changes of Bruhat rank. Prove `(g,z)↦zA(g)` is a homeomorphism `U×U(1)→p⁻¹(U)`. In this chart λ₂ is z². Translating these charts proves continuity on all of `S_ψ`, and the kernel with its subspace topology is a twofold topological cover. This supplies the topological comparison, without assigning product topology to the global Rao coordinates. Over `ℝ`, compare Weil's topological double cover and its circle pushout with the normalizer; over `ℂ` use `S_ψ≃Sp(W)×U(1)`. In every case λ₂ is the only continuous character restricting to z² on the circle, since `Sp(W)` is perfect.

The local-chart assertion is part of `metaplecticCover`, with the hypotheses of this subsection. Its sources are Kudla96 I.2 Proposition2.3, I.4 Theorem4.5 and Corollaries4.8–4.9, and Weil64 IV.§§42–44; it is proved before taking the topological kernel.

- `lambdaTwo`: the continuous character `λ₂:S_ψ→U(1)` above.
- `lambdaTwo_center`: `λ₂(z)=z²` on the central circle.
- `lambdaTwo_unique`: a continuous character of `S_ψ` that is `z↦z²` on the center equals `λ₂`.
- `metaplecticCover_center`: the kernel of `Mp(W)→Sp(W)` is `{±1}`, central, and acts by `±id` in 2.4c.
- `metaplecticCover_nonsplit`: for `W≠0` and `F≠ℂ` there is no continuous splitting `Sp(W)→Mp(W)`.
- `metaplecticCover_complex`: over `ℂ`, `Mp(W)≃Sp(W)×μ₂`.

**Checks.**

- For `W=0` the normalizer is `U(1)` and `Mp(W)=μ₂`, the kernel of `z↦z²`.
- For `W=ℝ²`, the preimage of the rotation group `SO(2)` in `Mp(W)` is connected (the double cover of the circle), so no continuous section exists; an extension by the trivial cocycle would split.
- Replacing `λ₂` by `z↦z⁴` gives a kernel with fibre `μ₄` over `Sp(W)`: the normalization of 2.4a is what cuts the circle extension down to `μ₂`.
- On `n(t)` as `t→0`, the normalized multiplication operators tend strongly to the identity by dominated convergence; conjugation by the Fourier operator gives the same check for opposite unipotents across the Bruhat-rank jump at t=0.

### 2.4c Genuine Weil representation

Define `weilRepresentation` as follows. Restrict the normalizer’s second projection to `Mp(W)=ker λ₂`. This gives the unitary Weil representation `ωψ` on `L²(X)` and its smooth/Schwartz subrepresentation; the nontrivial central element acts as `−id`. With the Rao coordinates `ωψ(g,ε)=εβ(g)r_Y(g)`.

The local-field cover and actual Schrödinger model are fixed.

(Kudla96, I.5 pp.23–24; II.4 pp.37–39). *Needs:* 2.4b, 1.3, 0.18.

- `MonoidHom.comp_apply`: The action on ker lambda2 is the restriction of the supplied normalizer oscillator; identification with `εβ(g)rY(g)` is separate.
- `weilRepresentation_central`: `ωψ(1,−1)=−id`.
- `weilRepresentation_modelChange`: A unitary Heisenberg model intertwiner conjugates the intrinsic cover action; changing its scalar leaves this equivalence unchanged.

**Checks.**

- At `W=0`, `μ₂` acts on `C` by sign.
- The two lifts of g give opposite operators in a nonzero model.
- The identity lift acts as the identity linear isometry.

### 2.5 Weil operators on generators

Prove `weil_generators`: In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy `r(m(a))φ(x)=|det a|^{1/2}φ(xa)`, `r(n(b))φ(x)=ψ(½x bᵗx)φ(x)`, and `r(w)` is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is `εβ(g)r(g)`, hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space `V` of dimension m, `ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa)`, `ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x)`, and `ω(w)φ=γ(ψ∘V)^{−n}` times the negative-kernel Fourier transform for Kudla’s w.

`F` is nonarchimedean, `char≠2`, b symmetric; the self-dual measure is fixed. `χV,ψ` depends on m parity and the signed discriminant. Source right-action matrices are used consistently.

(Kudla96, I.2 pp.8–10; II.4 pp.35–39). *Needs:* 2.4c, 2.1, 2.2; AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion).

### 2.6 Generator relations and intrinsic comparison

Prove `weil_generatorRelations`: The unipotent, Levi and Fourier operators satisfy their presentation relations with exactly the Rao central factors; their action is the intrinsic genuine representation obtained from the normalizer. In particular Fourier squared is reflection times its Weil scalar, and conjugating a unipotent by Fourier gives the opposite unipotent with its prescribed phase.

Use the same Weyl element, Haar measure, q and character as the generator theorem; the cover lift is part of the data.

(Weil64, I.§13, printed160, PDF18; I.§14 `relation(9)`, PDF19). *Needs:* 2.5, 2.4b, 2.2, 1.4.

### 2.6a Local unramified compact splitting

Prove `metaplectic_compactSplitting`: For a nonarchimedean odd-residue local field, conductor-zero `ψ` and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of `Sp(W)(O)` into `Mp(W)`, fixing the lattice indicator in its Schrödinger model.

The lattice is integral self-dual for the specified `ψ-pairing`; no assertion of this splitting over every dyadic maximal compact.

(Weil64, III.§36, printed186–187, PDF44–45). *Needs:* 2.4b, 2.5; AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion).

**Checks.**

- On the identity compact element the distinguished lift fixes the lattice indicator.
- For a standard self-dual lattice over `ℚ₃` and conductor-zero `ψ`, the integral unipotents preserve its indicator.
- Over `ℚ₂` this odd-residue assertion supplies no splitting of the full maximal compact.

### 2.7 Character change and dual Weil models

Prove `weil_characterChange`: For `ψa(t)=ψ(at)`, compare the oscillator model with the one for the scaled symplectic form `aω`; if `a=b²` the coordinate scaling by b gives an intertwiner and theta modules are unchanged up to the stated group conjugation. Complex conjugation changes `ψ` to `ψ⁻¹`; the contragredient Weil action is the `ψ⁻¹` action. On scalar-circle covers, the tensor product of two weight-one models needs `λ₂⁻¹`, and the dual model needs `λ₂`, to give scalar weight zero for the descended tensor and scalar weight one for the normalized dual.

`a∈F×`; for unitary models use continuous `ψ` and Hilbert dual/conjugate. The `μ₂` cover and scalar-circle cover are distinguished.

(Kudla96, I.1 p.5; II.4 Remark4.1 p.37). *Needs:* 2.4c, 2.5, 2.2.

### 2.8 Quadratic uncertainty principle

Prove `weil_quadraticUncertainty`: Let (V,q) be a positive-dimensional nondegenerate quadratic space over nonarchimedean `F`, char `F≠2`, with conductor-zero `ψ` and self-dual Fourier transform. If `φ∈S(V)` has support in `{q>0 in valuation, i.e. q∈p_F}` and its Fourier transform has support in `{q∈O_F}`, then `φ=0` identically. Corollary8.1.4 says that supp `φ⊂{val q>0}` and a scalar-multiple Fourier eigenfunction condition also force `φ=0`.

`dim_F V>0`. Let `q(x)=(x,x)/2`, `V^int={x | val_F(q(x))≥0}` and `V^int_+={x | val_F(q(x))>0}`, with `val_F(0)=∞`. `F` is nonarchimedean of characteristic `≠2` (residue characteristic 2 is allowed); `ψ` has conductor `O_F` and the Fourier kernel is `ψ((x,y))` with self-dual measure. `φ` is locally constant and compactly supported, supp `φ⊆V^int_+`, supp `φ̂⊆V^int`. Positive dimension is necessary for the null cone to have empty interior; the zero space is excluded.

(LZ22, Proposition8.1.2, Corollary8.1.4 PDF56–57). *Needs:* 2.5, 2.6; AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion).

### Examples

For `W=0` the metaplectic cover is `μ₂`, the kernel of `z↦z²` on the circle; the character `z↦z⁴` would leave `μ₄`. Changing `ψ` to `ψ⁻¹` conjugates the Fourier phase. On a rank-one graph with pairing `−xy`, the Leray quadratic value is `−x²/2`, fixing the graph convention. In characteristic two the division by 2 requires the explicit invertibility hypothesis.

### Dependencies

Within this roadmap: Layers 0 and 1. From other roadmaps: AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion) and AL.1 (local epsilon factors); QuadraticFormInvariants §6C; GlobalQuadraticForms Layer 4.

## Layer 3: Dual pairs and local theta modules

### 3.1 Orthogonal–symplectic dual pair

Define `orthogonalSymplecticEmbedding` as follows. Equip `V⊗_F W` with `b⊗ω` and map `O(V)×Sp(W)` to its isometry group by tensor action. The images commute. Over a nondiscrete local field, for nonzero factors they are full mutual centralizers in the ambient symplectic group. Compute the product map’s scalar kernel; for a zero factor retain the map and actual kernel without an injectivity assertion.

char `F≠2`; finite-dimensional spaces; b and `ω` nondegenerate. The tensor-product map can have diagonal scalar kernel, so injectivity of the product map is not asserted.

(Kudla96, II.1, PDF29–30, tensor orthogonal–symplectic pair). *Needs:* 0.8; Tau Ceti `TauCeti.BilinForm.isometryGroup`; Mathlib `LinearMap.BilinForm.tmul`; RepresentationTheory/ClassicalGroups Layer 0 (the complex groups, for comparison).

- `tensorSymplecticForm_isAlt`: For symmetric b and alternating `ω`, `b⊗ω` is alternating; this holds in every characteristic.
- `tensorSymplecticForm_nondegenerate`: For finite-dimensional `V`, `W`, nondegenerate b and `ω` give a nondegenerate `b⊗ω`.
- `orthogonalSymplecticEmbedding_isometry`: Each `g⊗h` preserves `b⊗ω`, so the tensor action lands in the isometry group of 0.8.
- `dualPair_commute`: The `O(V)` and `Sp(W)` actions commute on `V⊗W`.
- `dualPair_kernel`: For nonzero factors the kernel is the simultaneous scalar pairs `(aI,a⁻¹I)` admitted by the two groups.

**Checks.**

- `V=F`: `Sp(W)` acts by its defining representation.
- `V=0`: the target and its isometry group are trivial; the product map need not be injective.
- `(−I,−I)` acts trivially on `V⊗W`.
- Over `𝔽₃`, for a hyperbolic plane `V`, `O(V)={±I,±s}` with s interchanging its isotropic basis. Then `s⊗I` centralizes `O(V)` but is not `I⊗h`; full mutual centralizers require the local-field hypothesis.
- Two alternating factors do not give a symplectic form: for `ω` the standard form on `ℚ²`, `ω⊗ω` is symmetric and pairs `e₀⊗e₁−e₁⊗e₀` with itself to 2.

### 3.2 Cover over orthogonal–symplectic pairs

Prove `orthogonalCover_parity`: The scalar cover pulls back to `O(V)×Sp(W)`. `O(V)` has the Schrödinger splitting `h↦[φ(x)↦φ(h⁻¹x)]`. The restriction over `Sp(W)` of the `μ₂` cover is trivial when `m=dim V` is even and is the metaplectic cover of `W` when m is odd. The tensor Weil representation consequently descends to `O(V)×Sp(W)` for even m and is genuine on `O(V)×Mp(W)` for odd m.

`F` is a characteristic-not-two local field; a nontrivial continuous `ψ` and compatible Haar measures are fixed. The orthogonal action is the specified splitting, not a uniqueness claim.

(Kudla96, II.3 Corollary3.3, PDF36; cocycle comparison Proposition3.2 PDF35). *Needs:* 3.1, 2.4c, 2.2.

### 3.2a Split étale Hermitian spaces and oscillator comparison

Construct `splitHermitianOscillator`. For a field `F` of characteristic `≠2` and `E=F×F` with the exchange involution, use finite projective E-modules with perfect ε-Hermitian pairings, ε=±1. The two idempotents identify every such space with `A⊕A∨`; in the convention conjugate-linear in the first variable its pairing is `h((x,ℓ),(y,k))=(ℓ(y),εk(x))`. Identify its isometry group with `GL(A)`, acting by `(g,(g⁻¹)∨)`. Construct the trace-symplectic tensor for opposite signs using `Tr(a,b)=a+b`. Over nondiscrete local F, identify its polarized Schrödinger action with the oriented type-II matrix model used in 3.14, including determinant magnitudes, the Fourier sign and the characters obtained from continuous unitary `χV,χW:E×→U(1)` with the prescribed dimension restrictions on F×. Prove that this identification transports the split unitary splitting cochains and their character-change formula.

(GanTakeda16, §1 Remark(2), PDF3, and §2.8, PDF6; GQT, §§2.1–2.2, 2.9, split unitary datum and oscillator.) *Needs:* 0.15, 2.5, 2.7.

**Checks.**

- For `A=F`, the perfect pairing is `(ℓy,εkx)` and an isometry acts as `(ax,a⁻¹ℓ)`; independent scalings fail to preserve it unless their product is one.
- The idempotents `(1,0),(0,1)` are nonzero with product zero, so this E cannot instantiate a field-valued Hermitian carrier.
- For `A=0` the trace-symplectic space is zero; the split oscillator line still carries the character prescribed by `χV`, agreeing with the zero-rank case of 3.3.

### 3.3 Unitary dual-pair splittings

Define `unitaryWeilRepresentation` as follows. On the trace-symplectic tensor of `ε-Hermitian V` and `−ε-Hermitian W` over E/F, construct compatible scalar-cover splittings from continuous unitary characters `χV,χW:E×→U(1)` with `χV|F×=ωE/F^dimV` and `χW|F×=ωE/F^dimW`. Obtain `ωψ,χV,χW`, track character and `ψ` dependence, and prove independence of the auxiliary trace-zero `δ` for the fixed trace pairing.

Nonarchimedean local `F` of characteristic `≠2`, or archimedean `F=ℝ,ℂ`; E/F quadratic field or split étale algebra. Hermitian forms are nondegenerate. Each splitting uses the matching dimension and character restriction. For a quadratic field E, use GeometryOfNumbersAndQuadraticArithmetic §2.9's `SignedHermitianSpace E V ε`, its adjoint isometry group and `signedHermitianTransfer` along the trace on `V⊗_E W`, normalized as in GanIchino16 §4. For `E=F×F`, use the split carrier and trace-symplectic comparison of 3.2a; a product algebra does not satisfy the field hypotheses of that supplier.

(GanIchino16, §4 local theta setup, arXiv-v2 PDF11–12; GanTakeda16, §§2.1, 2.8, PDF4,6, characteristic-not-two splittings; GQT, §2.9, `equation(2.2)`, PDF13). *Needs:* 1.3, 2.2, 3.2a; GeometryOfNumbersAndQuadraticArithmetic §2.9 (`SignedHermitianSpace`, `signedHermitianAdjoint`, `signedHermitianTransfer`).

- `unitarySplitting_cocycle`: Each splitting cochain cancels the pulled-back scalar cocycle.
- `unitarySplitting_character_change`: If `χ` is replaced by `χη` with continuous unitary `η:E×→U(1)` and `η|F×=1`, transport `η` to the continuous unitary `η̃:E¹→U(1)` by `η̃(x/xᶜ)=η(x)`. Changing `χV` twists the W-factor by `η̃∘det`; changing `χW` twists the V-factor by `η̃∘det`.
- `unitarySplitting_delta`: For the fixed trace symplectic space and `ψ,χV,χW`, changing the auxiliary trace-zero `δ` leaves the splitting unchanged.

**Checks.**

- `V=0`: the oscillator line on `U(W)` has character `χV∘ι⁻¹∘det`; `χV=1` gives the trivial line, while valid nontrivial `χV` can act nontrivially.
- Over `F=𝔽₃((t))` the same splitting construction applies for quadratic E/F; no characteristic-zero hypothesis is needed.
- Reject `χV` unless `χV|F×=ωE/F^dimV`.
- Changing valid splitting characters by continuous unitary `η|F×=1` twists by `η̃∘det`, with `η̃(x/xᶜ)=η(x)`.
- For `F=ℚ₃,E=F×F,V=0`, the character `χV(a,b)=|a/b|` satisfies the restriction condition but is excluded by unitarity: on determinant `(3,3⁻¹)` it would give scalar 1/3 outside `U(1)`.

### 3.3a Hermitian uncertainty principle

Prove `weil_hermitianUncertainty`: For a positive-dimensional nondegenerate Hermitian space `V` over E/F with conjugation c, set `q(x)=½Tr_E/F⟨x,x⟩=⟨x,x⟩∈F`. Use the Fourier kernel `ψ(Tr_E/F⟨x,y⟩)` and its self-dual measure. If `supp φ⊆{x | val_F⟨x,x⟩>0}` and `supp φ̂⊆{x | val_F⟨x,x⟩≥0}`, then `φ=0` by the quadratic uncertainty principle. The half-trace form is the Hermitian norm, not its unscaled trace 2⟨x,x⟩.

`dim_E V>0`; nonarchimedean `F` of characteristic `≠2` and the quadratic Hermitian extension/datum of Li–Zhang §8.1. Conductor-zero `ψ`, locally constant compactly supported `φ`, `val_F(0)=∞` and exactly the strict/non-strict support cones above.

(LZ22, Proposition8.1.6 PDF57–58). *Needs:* 2.8, 3.3; AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion).

### 3.3b Hermitian oscillator normalizations

Prove `weil_hermitianNormalizations`: Compare the Hermitian Weil operators in Li–Liu22, Li–Zhang22B, Disegni–Liu24 and Zhang21 with Layer 2: `m(a)` has the specified character and `|det a|_E^{dim_E V/2}`, `n(b)` has `ψ(tr bT(x))`, and w has `γ_V^{rank}` times the positive Fourier transform for the source’s chosen trace pairing. Zhang’s even quadratic formula uses `χV(a)=(a,(−1)^{dim V/2}det q)_F`. His AppendixA gives `γ_V=η(det Hermitian V)ε(η,1/2,ψ)^{dim_E V}` and the hyperbolic constant1.

Even dimension where descent is asserted; exact quadratic determinant versus polar determinant; each source’s w and group action converted before comparing signs.

(LL22, §§2.1,3.1 PDF11,43–44; LZ22, §§1.7,8.1,12.3 PDF8–9,56,78–79; DL24, §4.1 H7. PDF40–41; Z21, §11.1 PDF70–71 and AppendixA PDF108–109). *Needs:* 2.5, 2.2, 3.3; AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion); AutomorphicLFunctionsAndLocalFactors AL.1 (local epsilon factors and Gauss sums).

### 3.3c Quaternionic type-I oscillator and doubling inputs

Construct `quaternionicTypeIOscillator` over a characteristic-zero local field F. For a quaternion division algebra B/F with its main involution, let U be any finite-dimensional nondegenerate right ε-Hermitian B-space and V any finite-dimensional nondegenerate left −ε-Hermitian B-space. On `U⊗_B V` use the symplectic pairing `ω(u⊗v,u′⊗v′)=½Trd_B/F(⟨u,u′⟩_U⟨v,v′⟩_V^ι)`. Prove balancedness, alternation and nondegeneracy, construct both topological isometry groups and their commuting tensor actions, and pull back the oscillator extension. Construct the Sun–Zhu modified groups and oscillator representations of their Jacobi group, with the character twists defining enhanced Witt towers. In the quaternionic case the modified groups are the isometry groups themselves. Compare Sun–Zhu's Heisenberg law with 0.5 by using `2ω` in the half-form convention. Over real F include the Harish-Chandra module and its smooth globalization.

For nonarchimedean F construct the quaternionic conservation inputs `quaternionicDoublingInputs`: the Siegel evaluation image `Q_σ⊂I(χ_σ)` and its identification with oscillator coinvariants (Sun–Zhu Proposition 5.1); the quotient `I(χ_σ₁)/Q_σ₁≃Q_σ₂` when `σ₁−σ₂` is anti-split, `dim σ₁+dim σ₂=dim U+d−2` and `dim σ₁≥dim σ₂` for split U (Proposition 5.2); and the doubled restriction and nonvanishing Hom statements of Lemmas 5.3–5.5. Lemma 5.5 retains anisotropy of the enhanced V and trivial Kudla character on the doubled group. Supply the quaternionic Jacquet and null-cone restrictions in §6 used with these inputs. These quaternionic conservation inputs use neither a quaternionic MVW involution nor an implicit extension of the nonquaternionic filtration of 3.13.

(SunZhu15, §§1.1–1.4, equation (1), Lemmas3.4–3.5, §5 Propositions5.1–5.2 and Lemmas5.3–5.5, §6; archimedean §7.) *Needs:* Layers 0–2; SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.2.2, SR.3.1; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

**Checks.**

- For `U=B²,V=B²`, the tensor has F-dimension 16; neither factor is restricted to a quaternionic line.
- If either factor is zero, the tensor is zero and the Heisenberg representation is its central-character line; its extensions retain the specified enhancement characters.
- For `F=ℝ,B=ℍ`, the two signs give the quaternionic symplectic and quaternionic orthogonal groups, with commuting symplectic tensor actions.
- Lemma 5.5 applies to anisotropic enhanced V with trivial doubled Kudla character; deleting anisotropy does not supply a quaternionic MVW argument.

### 3.4 Big theta module

Define `bigTheta` as follows. For commuting oscillator actions of `G×H`, define `Θ(π)=(S⊗π∨)_G` using smooth algebraic coinvariants. Admissibility and Schur’s lemma identify the maximal `π-isotypic` quotient with `π⊗Θ(π)`. The commuting `H` action descends; `π∨` is the smooth contragredient and central characters must match.

Nonarchimedean local field and the specified dual pair/splittings. `π∨` is the smooth contragredient, not the full algebraic dual. The maximal-isotypic comparison uses admissibility and Schur’s lemma.

(Kudla96, II.2, PDF32–33, maximal isotypic quotient and its theta factor; SunZhu15 §1.2 for quaternionic pairs). *Needs:* 3.2, 3.3, 3.3c; SmoothRepresentationsOfLocalGroups §SR.0.2; SmoothRepresentationsOfLocalGroups §SR.2.2.

- `bigTheta_hom`: For the supplied smooth dual and admissible irreducible `π`, identify the smooth `G×H` Hom space with the H-Hom space from `Θ(π)`; retain the matching central character and maximal-isotypic comparison.
- `bigTheta_equivariant`: If the `H` action commutes with the `G` tensor action, it sends each coinvariant relation into the coinvariant kernel.
- `bigTheta_isotypic`: The maximal `π-isotypic` quotient of `S` is `π⊗Θ(π)`.

**Checks.**

- Opposite common central actions on `S` and `π` give zero coinvariants.
- `G=1,π=C`: the quotient is `S` with its `H` action.
- Every equivariant `S→π⊗σ` factors uniquely through the maximal `π-isotypic` quotient.

A commuting H-action preserves the coinvariant relations (`thetaCoinvariantRelation_eq_zero`), which is the algebraic part of `bigTheta`; the smooth big theta module and its Hom comparison also need the smooth contragredient and the maximal isotypic quotient.

### 3.5 Small theta quotient

Define `smallTheta` as follows. Define `θ(π)` as the maximal semisimple quotient of the finite-length big theta module in the source category. Under a stated Howe theorem, it is zero or irreducible. Define no arbitrary chosen irreducible summand when Howe duality has not been established.

For any finite-length smooth module M, use the generic radical and cosocle definitions of SmoothRepresentationsOfLocalGroups §SR.5.2, the radical/cosocle paragraph, independently of its co-Whittaker applications. Prove here that this quotient is semisimple and universal among semisimple quotients in the finite-length category. Instantiate it with M=Θ(π) only after 3.6. Archimedean variants use AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

(GanTakeda16, §1 PDF1–2). *Needs:* 3.4, 3.6 for the theta instantiation; SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.5.2 (generic radical/cosocle definitions).

- `Submodule.mkQ_surjective`: The natural `Θ(π)→θ(π)` is surjective.
- `smallTheta_semisimple`: `θ(π)` is semisimple in the supplied smooth category.
- `Submodule.liftQ`: Every linear map killing the chosen quotient submodule factors uniquely through the native quotient. That this submodule is the radical of the maximal semisimple quotient is part of this target.

**Checks.**

- The radical quotient of zero is zero.
- An irreducible big lift projects isomorphically.
- For a nonsplit `0→A→M→B→0` with unique simple quotient `B`, the semisimple quotient is `B`.

### 3.6 Finite length of theta modules

Prove `bigTheta_finiteLength`: For a nonarchimedean characteristic-not-two orthogonal–symplectic or unitary pair, and for a characteristic-zero quaternionic pair of 3.3c, prove `Θ(π)` admissible and finite length for irreducible admissible `π`. Supply separately the archimedean finitely generated admissible (g,K)-module analogue on the oscillator Harish-Chandra module, using Howe's theorem in the category of AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

The matched central character and source splittings are fixed. Jacquet exactness and the rational-point finite-length criterion belong to SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.3.1; Harish-Chandra modules to AutomorphicFormsOnReductiveGroups §2.1. For the metaplectic factors prove the theta-specific admissibility and finite-length assertion directly on the genuine finite-central-cover category, using the split unipotents and covered Levi actions. This covered-group assertion is part of this target and does not instantiate the rational-point criterion on a covering group.

(Kudla96, II.2 pp31–33, isotypic quotient and admissibility; GanTakeda16, §1 PDF1–2, finite length over characteristic-not-two F; Gan–Sun, arXiv:1507.04551v1, §1 PDF2, finite-length assertion for all reductive dual pairs). *Needs:* 3.4, 3.3c; SmoothRepresentationsOfLocalGroups §SR.0.2; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

**Checks.**

- For `F=𝔽₃((t))`, irreducible admissible orthogonal–symplectic and unitary inputs have finite-length big lifts.
- For `F=ℚ₂`, dyadic residue characteristic does not exclude admissibility or finite length.
- With the trivial source group and its trivial representation, the big lift is the oscillator; at the zero-dimensional pair it is a one-dimensional finite-length module.
- For odd-dimensional V the metaplectic target is a genuine covered-group module; its finite length is the covered theta assertion here, rather than an instance of the reductive rational-point criterion.

### 3.14 Type-II theta input

Prove `typeII_theta`: For the oriented split pair `GL_m×GL_n`, prove small theta zero or irreducible and injective on its nonzero domain. The unequal-rank parameter formula is an additional Mínguez input; it implies no general `n<m` vanishing.

Smooth irreducible representations; the pair orientation and normalized action are those of Gan–Takeda’s cited Mínguez theorem.

(GanTakeda16, §3 proof strategy, PDF9, cited general-linear Howe input; original Mínguez theorem required). *Needs:* 3.2a; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1.

*Proof input.* GanTakeda16 §3 uses Mínguez's explicit type-II correspondence for `(GL_n, GL_m)`, including the unequal-rank parameter formula; this target is that statement, and it is the only input of 3.7 from outside Layers 0–3.

### 3.15 MVW involution and metaplectic induction

Prove `mvw_coverInduction`: Transport smooth duals and normalized induction through the split Mp unipotents. The exact covariant MVW involution agrees with `π∨` for irreducible `π`. On Levi `GL_k×Mp_{2n−2k}`, use `τ̃ψ=(τ∘projection)⊗χψ`, with central sign `−1`, as the genuine inducing datum. Archimedean variants use AutomorphicFormsOnReductiveGroups §2.7 and need their own comparison.

Nonarchimedean characteristic-not-two `F` for the orthogonal, symplectic and unitary smooth comparison; real Lie-group variants use AutomorphicFormsOnReductiveGroups §2.7 and need their own proof. `χψ` is the Weil-index genuine character on the covered GL factor.

(GanTakeda16, §§2.1, 2.5–2.8, PDF4–6; MVW87 p.91, covariant involution; GI18, §5.2–5.3 PDF18–20, Lemma5.2, characteristic-zero metaplectic comparison). *Needs:* 3.2, 2.2; SmoothRepresentationsOfLocalGroups §SR.0.2; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

**Checks.**

- For `F=𝔽₃((t))`, the MVW involution on an irreducible smooth classical representation gives its smooth contragredient.
- On a covered GL Levi, `τ̃ψ` sends the central sign to `−Id`; omitting `χψ` would give `+Id`.
- On a split unipotent subgroup, induction and dual transport use the canonical lift with no freely chosen central sign.

### 3.7 Howe duality

Prove `howeDuality`: For a nonarchimedean orthogonal–symplectic or unitary type-I pair in characteristic `≠2`, prove `θ(π)` zero or irreducible and nonzero `θ(π)≃θ(π′)` implies `π≃π′`, including dyadic residue fields. Quaternionic full duality requires its additional theorem beyond Gan–Takeda’s partial result. Over `R` or `C` use the separate original archimedean Howe theorem in the specified Harish-Chandra/globalization category.

The smooth representations are irreducible admissible and genuine where required. Gan–Takeda Theorem1.2 is the full orthogonal/symplectic/unitary theorem; its Theorem1.3 only gives scoped quaternionic conclusions. Archimedean Harish-Chandra modules/globalizations and Howe’s original theorem require AutomorphicFormsOnReductiveGroups §§2.1, 2.7 and Howe's archimedean theorem; no extension to arbitrary algebraic representations is asserted.

(GanTakeda16, Theorem1.2 and (HD), PDF2; proof §§4–6 PDF9 onward; GI18, §2.2, arXiv-v3 PDF8; GS23a, §14.1–14.3, arXiv-v1 PDF50–51). *Needs:* 3.5, 3.6, 3.12, 3.13, 3.14, 3.15, 3.3c; 3.16 for the quaternionic case; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

*Proof input.* For nonarchimedean orthogonal–symplectic and unitary pairs the proof is GanTakeda16 §§4–6 (PDF9–21), whose inputs include the oscillator Jacquet filtration of 3.12, doubling principal-series filtration of 3.13, type-II correspondence of 3.14 and MVW involution of 3.15. For quaternionic pairs, first prove the conservation input of 3.16 using 3.3c, and then use Gan–Sun Theorem1.2 (arXiv:1507.04551v1, §1, PDF2–3), which avoids MVW. Real and complex `F` need Howe's archimedean theorem, which Gan–Ichino18 §2.2 and Gan–Savin23 §14.1 quote; in the archimedean case the statement is made for Casselman–Wallach representations (AutomorphicFormsOnReductiveGroups §2.7), and the comparison between Harish-Chandra modules and their globalizations is part of this target.

### 3.8 Local see-saw identity

Prove `localSeeSaw`: For dual pairs `(G₁,H₁)` and `(G₂,H₂)` with `G₂⊂H₁`, `G₁⊂H₂` and compatible restrictions of one oscillator S, identify `Hom_G₂(Θ_S^{G₁}(π₁)|G₂,π₂)` with `Hom_G₁(Θ_S^{G₂}(π₂)|G₁,π₁)`. Both identify with `Hom_{G₁×G₂}(S,π₁⊗π₂)` in the maximal-isotypic convention of 3.4. This concerns big coinvariants; passage to small lifts requires semisimplicity and Howe hypotheses.

Irreducible admissible smooth π₁,π₂ with matching central characters; compatible restrictions of the same oscillator representation; archimedean version in the category of AutomorphicFormsOnReductiveGroups §2.7.

(Kudla96, IV.1 pp59–66, see-saw examples and oscillator Hom route). *Needs:* 3.4, 2.7; SmoothRepresentationsOfLocalGroups §SR.0.2; SmoothRepresentationsOfLocalGroups §SR.2.2; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

**Checks.**

- For `G₁=H₂=1`, `G₂=H₁=U(1)` and oscillator line a nonquadratic character η, `π₁=1,π₂=η` give a one-dimensional Hom on both sides. Replacing only `π₂` by `η⁻¹` on the right gives zero.
- For both groups trivial, the two Hom spaces are the same linear Hom from S to `π₁⊗π₂`, with the tensor factors interchanged.
- Contragredient transport changes S to `S∨`, hence `ψ` to `ψ⁻¹` and both splitting characters to their transported duals; retaining S while dualizing only the inputs fails the η test.

### 3.9 Persistence and stable range

Prove `theta_persistence_stableRange`: In a fixed orthogonal Witt tower `V_r=V_0⊕H^r` paired with `Sp(W)`, `dim W=2n`, a nonzero theta lift persists for larger r. Every irreducible admissible `π` with the oscillator central character has nonzero theta lift in stable range `r≥2n`: use `Sp(W)` when `dim V₀` is even, and genuine `Mp(W)` when it is odd; in the reverse direction a fixed `O(V)-representation` has nonzero lift when `n≥dim V`. These are sufficient bounds, not minimal first-occurrence formulas.

Nonarchimedean local `F` in Kudla’s stated odd-residue range; broader fields use the separately qualified nonvanishing sources.

(Kudla96, III.4 Propositions4.1,4.3–4.5, PDF44–49). *Needs:* 3.4, 3.6; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1.

The matching-character condition is retained in every persistence, first-occurrence finiteness and stable-range export. Prove `thetaCoinvariants_scalarMismatch`: for a representation ρ over a field, if some group element acts by scalar c with `c≠1`, every vector maps to zero in its native coinvariants. Apply this to `S⊗π∨`; a mismatch of common central characters supplies such a c.

**Checks.**

- For `F=ℚ₃,dim W=2,V_r=H^r`, a genuine Mp₂ input gives zero for every r, including `r≥2`, since the oscillator sign is +1 and the tensor sign is −1.
- In the same even tower a representation of Sp₂ inflated to Mp₂ has matching sign +1 and the sufficient bound is `r≥2`.
- An odd-dimensional tower has oscillator sign −1 and accepts genuine Mp₂ inputs with that same bound; in the reverse direction the target symplectic representation has the parity of the fixed V.

### 3.10 First occurrence in a Witt tower

Define `firstOccurrence` as follows. For a supplied tower `V_r` and `π` define the first-occurrence rank as the least r with `ΘV_r(π)≠0`, in WithTop `N` before nonvanishing is proved. Define the dimension index `m_0+2r` separately. Record the tower’s discriminant, Hasse invariant, anisotropic kernel and auxiliary splitting characters.

Tower supplied by QuadraticFormInvariants and classical groups; nonvanishing at a finite rank is a theorem input, not part of the definition. Persistence and finite stable-range bounds use 3.9 with the matching oscillator central character. The abstract least-index definition also applies to mismatched inputs, for which all lifts vanish and the index is ⊤.

(SunZhu15, §1.5 PDF5–8). *Needs:* 3.4, 3.9; QuadraticFormInvariants §6C.

- `firstOccurrence_eq_top_iff`: The first occurrence is ∞ exactly when every member of the tower is zero.
- `firstOccurrence_nonzero`: For finite first occurrence `r₀`, `ΘV_r₀(π)` is nonzero.
- `firstOccurrence_vanishing`: For `r<r₀` the big lift is zero.
- `firstOccurrence_dimension`: The dimension index is `m_0+2r₀` when `r₀` is finite.

**Checks.**

- `ΘV₀(π)≠0` gives rank index 0 and dimension index `m₀`.
- All lifts zero gives index ⊤.
- Equal rank indices in towers of different anisotropic dimensions need not give equal dimension indices.
- The genuine Mp₂ input in the even split tower over ℚ₃ has first occurrence ⊤; no finite bound is asserted for that mismatch.

### 3.11 Supercuspidal first occurrence

Prove `supercuspidal_firstOccurrence`: For supercuspidal `π`, at first occurrence the theta lift is supercuspidal; above it the big lift is irreducible admissible, equals the small lift and is not supercuspidal. Embed it in the normalized induction of the first lift with the tower characters of Kudla III.6 Theorems 6.1–6.2. The assertion does not extend to arbitrary `π`.

Nonarchimedean odd residue characteristic as in Kudla III; `π` irreducible supercuspidal with the matching oscillator central character of 3.9, fixed tower and splittings.

(Kudla96, III.6 Theorems6.1–6.2 pp52–53; proof sketch IV.3 pp70–74). *Needs:* 3.10, 3.7; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1.

### 3.12 Kudla’s Jacquet filtration

Prove `oscillator_jacquetFiltration`: For `Q(X_a)⊂G(W_n)`, the normalized Jacquet module of `ω` has a finite filtration with kth quotient, `0≤k≤min(a,q_V)`, equal to normalized induction from `Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k)` of `χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}`. Here `s_{m,n}=(m−n−ε₀)/2` and (b,c) acts on `f(g)` by `χV(det b)χW(det c)f(c⁻¹gb)`.

(Gan–Takeda §2 conventions; normalized induction/Jacquet functor and modulus characters; the metaplectic Levi has its genuine `χψ` factor. Unipotent radicals split canonically).

(GanTakeda16, Lemma3.1 PDF7–8). *Needs:* 3.4, 3.2, 3.3; SmoothRepresentationsOfLocalGroups §SR.0.2; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1.

### 3.13 Doubling principal-series filtration

Prove `doubling_rankFiltration`: For `I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s`, its restriction to `G(W)×G(W)` has rank-t quotients induced from `Q_t×Q_t` with characters `χV|det X_t|^{s+t/2}` on both `GL_t` factors and `χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t}))` on the remaining factors. The open-orbit quotient `R_0=χV(det W⁻)⊗Cc∞G(W)` is independent of s.

(Gan–Takeda normalized induction conventions; actual group dimensions and `ε-Hermitian` type fixed).

(GanTakeda16, Lemma3.2, PDF7–8, filtration of degenerate principal series). *Needs:* 3.3, 3.2; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1.

### 3.16 Nonarchimedean conservation relations

Prove `theta_conservation`: For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy `n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}`. Here d is classified by the complementary tower space `V`, of sign `−ε`: it is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic V. Thus symplectic U has orthogonal V and d=4. In particular an `Sp_{2n}` representation in the two even-orthogonal towers has dimension sum `4n+4`, and for `O(V)` the symplectic rank indices of `π` and `π⊗det` sum `dim V`.

Characteristic-zero nonarchimedean `F`, including residue characteristic two; towers enhanced by their oscillator character; `π` has the central character prescribed by that enhancement as in Theorem1.10. In the even-orthogonal specialization it descends to Sp; in the odd-orthogonal specialization it is genuine on Mp.

(SunZhu15, Proposition1.6 PDF5 and Theorem1.10 PDF8–10; §§5–6). *Needs:* 3.10, 3.3c; 3.12–3.13 and 3.15 in the nonquaternionic cases; QuadraticFormInvariants §6C; SmoothRepresentationsOfLocalGroups §SR.3.1.

**Checks.**

- For `U=0` and orthogonal V, the two dimension indices sum to 4, the maximal anisotropic orthogonal dimension.
- For `Sp₂`, `dim U=2` and d=4 give dimension sum 8, rather than 4.
- For orthogonal U the complementary spaces are symplectic, so d=0 and conversion from dimensions to symplectic ranks gives the sum `dim U` for π and `π⊗det`.

### 3.17 Archimedean first-occurrence cases

Prove `theta_archimedeanFirstOccurrence`: For real/complex orthogonal `U`, the sign-related towers have first-occurrence dimension sum 2 dimU. For complex symplectic or real quaternionic Hermitian `U`, parity-compatible occurrence is `≤dimU` or `dimU+1`, without a two-tower relation. For real symplectic, complex unitary or real quaternionic skew-Hermitian `U`, each `K_U-coset` has a distinct pair with sum 2 `dimU+d`; other pairs have sum `≥2 dimU+d|t₃−t₄|`, and the two minima modulo `2K_U` sum 2 `dimU+d`.

Irreducible admissible Harish-Chandra/smooth representations with the central character prescribed by the enhancement of Sun–Zhu §7; no claim across inequivalent oscillator cosets.

(SunZhu15, §7.2 Theorems7.1,7.3,7.6 PDF43–46). *Needs:* 3.10, 3.3c; 3.15 in its nonquaternionic scope; AutomorphicFormsOnReductiveGroups §2.4.

### 3.18 Unitary equal and almost equal rank

Prove `unitaryTheta_equalAlmostEqualRank`: For tempered `π` of `U(W_n)` over a nonarchimedean characteristic-zero `F`, equal-rank theta to `U(V_n^ε)` is nonzero in exactly one sign, determined by `ε(1/2,φπχV⁻¹,ψ₂^E)=εε′`, and its parameter is `φπχV⁻¹χW`. For rank `n+1`, if `χV` is absent from `φπ` both signs are nonzero, while if `χV` occurs exactly one sign is nonzero; the lifted parameter is `(φπχV⁻¹χW)⊕χW`. In these stated tempered ranges the big nonzero lift is irreducible.

Hypotheses: `F` nonarchimedean of characteristic zero, E/F a nonsplit quadratic field and `n>0`; auxiliary characters `χ_V`, `χ_W` and `ψ₂^E` as in Gan–Ichino; the tempered local Langlands correspondence for `U(W_n)` and `U(V)` with its component-group characters and the root-number description of Vogan packets. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3 supplies these tempered unitary packets and pairings, conditional on its own classification inputs; this target inherits that condition and states it as a hypothesis.

For split `E=F×F`, use 3.2a and the oriented GL type-II correspondence of 3.14; each fixed Hermitian rank has one isometry class. In rank zero use the unique zero Hermitian space and its oscillator line with the prescribed splitting characters, without a negative-sign zero space.

**Checks.**

- A split Hermitian line has only one isometry class, since the norm `(x,y)↦xy` is surjective.
- At `n=0` there is one zero Hermitian space; no `V₀⁻` is introduced.
- For nonsplit E/F and `n=1`, the two norm classes exist and the equal-rank root number selects exactly one.

(GanIchino16, Theorems4.1 and4.4 PDF11–15). *Needs:* 3.3, 3.7, 3.12, 3.16; SmoothRepresentationsOfLocalGroups §SR.3.3; EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3.

### 3.19 Unitary doubling multiplicity and dichotomy

Prove `unitaryTheta_doublingDichotomy`: For Li–Liu Assumption 3.1’s rank-2r skew-Hermitian datum with `r>0`, prove the equal-rank two-choice dichotomy at nonsplit quadratic-field places. At split places use the unique Hermitian isometry class and the GL type-II correspondence of 3.2a and 3.14. Prove the doubling Hom multiplicity `≤1` separately at every finite place covered by LL21 Proposition3.6(1), including split places. Establish the required semisimplicity of the relevant big theta module separately; the scoped Gan–Ichino irreducibility result does not suffice.

Characteristic zero local fields, the exact relevant tempered representation and splitting data of Li–Liu; archimedean case uses AutomorphicFormsOnReductiveGroups §§2.4, 2.7.

The rank-zero boundary has the unique zero Hermitian space and its oscillator line; it is outside Li–Liu's positive-rank Assumption3.1 and has no two-choice dichotomy.

**Checks.**

- At a split finite place the equal-rank Hermitian space is unique and the source doubling Hom still has dimension 1.
- At nonsplit finite places in the source nonvanishing range, exactly one of the two positive-rank isometry classes has nonzero lift.
- For `r=0` only the zero space occurs, so the two-sign formulation does not apply.

(LL21, Notation2.2, Assumption3.1 and Proposition3.6 PDF15–17). *Needs:* 3.13, 3.7, 3.3, 3.2a, 3.14; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

### 3.20 Unramified metaplectic theta and induction

Prove `mpTheta_unramifiedInduction`: For a characteristic-zero odd-residue local field F and conductor-zero ψ, use the local compact splitting of 2.6a. Every unramified irreducible genuine `Mp₂n` representation is the unique unramified subquotient of the normalized principal series induced from `χψ|·|^{s_i}`, with ψ-relative parameter `⊕ᵢ(|·|^{s_i}⊕|·|^{−s_i})`. If every `|Re s_i|<1/2`, this entire principal series is irreducible. Character change uses the square class and orthogonal-space scaling of 2.7.

(GI18, §5.3 Lemma5.2 and Remark5.3, (5.5), PDF18–20). *Needs:* 3.7, 3.15, 2.7, 2.6a; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.2.

**Checks.**

- For `n=1,s₁=0`, the normalized genuine principal series is irreducible and its parameter is `1⊕1`.
- `Re s₁=1/2` lies outside the irreducibility assertion.
- At a dyadic place this odd-residue compact-splitting statement supplies no spherical parameter comparison.

### 3.21 Rallis unramified theta parameters

Prove `theta_unramifiedSatake`: Relate the spherical Hecke parameters of a nonzero theta lift by Rallis’s L-group map, including the dimension-dependent `SL₂/principal-series` segment. For Chenevier–Taïbi’s orthogonal–symplectic examples, distinguish this local relation from the global level-one multiplicity computation.

Unramified local datum, compatible integral lattices, `ψ` conductor zero, compact splitting and the exact source dimension/parity.

(CT20, §5.3.2 PDF50; §5.4 PDF54–55). *Needs:* 3.2, 2.5, 2.6a; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4; AdelicAlgebraicGroups §§1.1, 1.5.

### 3.22 Unitary theta Hecke compatibility

Prove `unitaryTheta_hecke`: Construct Li–Liu’s surjective spherical Hecke map `θ^R:H^R_W→T^R` and factor the `π` character through it; the output character is `χπ(s)^c`. At their ramified odd places use `K_r` and the trace-self-dual lattice indicator, retaining the source compact and splitting conventions.

Exact Assumption3.1 and compact subgroups; rank2r Hermitian target. Ramified E/F has odd residue characteristic, `ψ` conductor `O_F` and the source’s trivial splitting characters.

(LL21, Definition6.8, Proposition6.10 PDF31–32; Lemma11.1 PDF49–50; LL22, Definition3.2, Lemma3.3, Proposition3.4 PDF43–45). *Needs:* 3.3, 3.4, 2.6a; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4; AdelicAlgebraicGroups §§1.1, 1.5.

### 3.23 Quaternionic similitude dual pair

Define `quaternionSimilitudeEmbedding` as follows. For `B=E⊕Ej`, `i²=u,j²=J`, take right skew-Hermitian `V` with diagonal `κ_i` i and left Hermitian `W=B`. Give `V⊗_B W` its half-trace symplectic pairing. The subgroup `ν(g)=ν(h)∈N(E×)` in `GU(V)^0×B×` acts by `g⁻¹v⊗wh`. Use `X` with bases `e_i⊗1,e_i⊗j` and `Y` with `e_i⊗i,e_i⊗ij`.

Characteristic-zero local or global `F`; E embedded in `B`; nondegenerate forms; connected similitude factor and norm-image condition retained.

(IP23, AppendixA.1, (A.1)–(A.2), arXiv-v2 PDF87–89). *Needs:* 3.1, 3.3c; QuadraticFormInvariants §6C; Mathlib `QuaternionAlgebra`. The similitude group `GU(V)` and its norm-image subgroup are defined here. For division B, its isometry restriction is the `W=B` specialization of 3.3c, with the stated left/right and inverse-action conventions; for split B the coordinate construction remains the one specified here.

- `quaternionTensor_pairing`: The pairing is half the reduced trace.
- `quaternionSimilitude_invariant`: Matched multipliers preserve the tensor pairing.
- `quaternionPolarization`: X,Y span complementary Lagrangians.

**Checks.**

- `m=1`: each Lagrangian has F-dimension 2.
- `m=0`: the tensor space is zero.
- Unequal multipliers rescale the pairing and fail symplectic isometry.

### 3.24 Quaternionic similitude splitting

Define `quaternionSplitting` as follows. Construct `s_v:G_v→C¹` with `z_Y(g₁,g₂)=s_v(g₁g₂)/(s_v(g₁)s_v(g₂))`. It obeys `s_v(zg)=ξE_v(z)^m s_v(g)`, agrees with the standard compact splitting almost everywhere, and ∏v `s_v(γ)=1` for `γ∈G(F)`. This splits the scalar-circle cover on the norm-image subgroup; no `μ₂` splitting is inferred.

AppendixA.1 datum; global `ψ` trivial on `F` for the product assertion; compatible local measures.

(IP23, PropositionA.1, PDF88; §§A.2–A.7, PDF88–96). *Needs:* 3.23, 1.3, 2.2; QuadraticFormInvariants §6C.

- `quaternionSplitting_cocycle`: The cochain cancels `z_Y` in the stated quotient direction.
- `quaternionSplitting_central`: Central scalars give `ξE(z)^m`.
- `quaternionSplitting_auxiliary`: The result is independent of `α` and auxiliary `χ`.

**Checks.**

- `s_v(1)=1`.
- Odd rank and `ξE(z)=−1` give scalar action `−1`.
- Rational `γ` gives product of local values 1.

### 3.25 First doubled quaternionic splitting

Prove `quaternionSplitting_firstDoubled`: On `U(V⊕V⁻)`, `ŝ₁` is1 for split `B` and `(−1)^j` on a Bruhat stratum for division `B`. It cancels `z_{V△}`, is invariant under `E×` conjugation, and on the norm-one scalar embedding `α` has value1 if `α=1` and `(−1)^m` otherwise in the division case.

AppendixA.2–A.3 bases and Bruhat index; `α∈E¹`.

(IP23, AppendixA LemmasA.3–A.4, PDF90). *Needs:* 3.23, 2.4; QuadraticFormInvariants §6C.

### 3.26 Second doubled quaternionic splitting

Prove `quaternionSplitting_secondDoubled`: For the doubled unitary W-model, `ŝ₂(h)=χ(x(h))^mγ^{−j(h)}`, `γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}`. It is invariant under `E×` conjugation. The diagonal norm-one scalar gives `χ(α)^{−2m}`; the mixed embedding of A.7 gives `χ(α)^{−m}` times 1 if B is split or `α=1`, and times `(−1)^m` if B is division and `α≠1`.

Exact embeddings `ι` and bases of §§A.4–A.5; `χ|F×=ξE`, `α∈E¹`.

(IP23, AppendixA LemmasA.5–A.7, PDF92). *Needs:* 3.3, 3.23, 2.2.

**Checks.**

- For division B, `m=1,α=1`, the mixed embedding is the identity and its splitting value is 1.
- For division B, `m=1,α≠1`, its value is `−χ(α)⁻¹`.
- For split B, `m=1,α≠1`, its value is `χ(α)⁻¹`, distinguishing the two algebras.

### 3.27 Sharp splitting and norm-one descent

Prove `quaternionSplitting_sharpDescent`: On `G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}`, set `ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹,1))ŝ₂(ι(hα⁻¹,1))z_{V△}(ι(gα⁻¹,1),ι(hα⁻¹,1))`. Define `μ(σ)=z_{Y□}(σ₀,σ)⁻¹z_{Y□}(σ₀σσ₀⁻¹,σ₀)`, so `z_{Y□}=z_{V△}δμ`. Put `s^sharp=ŝ^sharp·μ` and `s₂=ŝ₂·μ` on their respective embedded groups. Descend `s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α]))`. LemmaA.10 proves independence of the norm lift using LemmaA.9; LemmaA.12 cancels auxiliary `χ`.

Exact `α` lift of the common norm multiplier and polarization `σ₀`.

(IP23, AppendixA LemmasA.8–A.12, PDF93–96). *Needs:* 3.25, 3.26, 2.4.

### 3.28 Quaternionic see-saw and Periods-II comparison

Prove `quaternionSplitting_seeSaw`: For an orthogonal sum `V=V′⊕V″` with matched similitude triple, `s=s′s″` on the see-saw restriction. In rank-one Periods-II conventions, `s^natural(α,h)=s(α,h)χ(α)⁻¹`.

Compatible polarizations, `ψ` and `χ`; exact norm-image subgroups and components.

(IP23, AppendixA.8, PDF96, and §A.9 LemmaA.13, PDF97). *Needs:* 3.24, 3.27, 3.8.

### 3.30 First scalar splitting calculation

Prove `quaternionSplitting_scalarA9`: For `α=a+bi` with `a,b≠0`, tilde `s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F`; `ŝ₂(ι([α,α],1))=χ(α)⁻²(u,J₁)_F`; `μ` on that matrix is `γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F`. Together these give `s=tilde` s on the first `E×` embedding.

Rank-two Periods-I datum and exact embeddings.

(IP23, AppendixA LemmasA.15–A.17, PDF100–104). *Needs:* 3.27, 2.2, 3.24, 3.25, 3.26.

### 3.31 Second scalar splitting calculation

Prove `quaternionSplitting_scalarA10`: For `α=a+bi` with `a,b≠0`, tilde `s(α,α⁻¹,1)=γ_F(J,ψ/2)(−2abJ₁,J)_F`; `ŝ₁(ι([α,α⁻¹],1))=(u,J)_F`; `μ` is `γ_F(J,ψ/2)(−2abuJ₁,J)_F`. Together these give `s=tilde` s on the second `E×` embedding.

Rank-two datum; both a,b nonzero before continuous extension.

(IP23, AppendixA LemmasA.18–A.20, PDF104–106). *Needs:* 3.27, 2.2, 3.24, 3.25, 3.26.

### 3.32 Square quaternion splitting calculation

Prove `quaternionSplitting_scalarA11`: When `J_i=t_i²`, the normalized generators `j_i^natural=j_i/t_i` have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11).

Specified square roots and the global real-place argument of A.14.

(IP23, AppendixA LemmasA.21–A.23, PDF106–108). *Needs:* 3.27, 3.24, 3.25, 3.26.

### 3.32a Periods-I splitting comparison

Prove `quaternionSplitting_periodsI`: For `m=2`, `V=B₁⊗E B₂`, `J₁J₂=J`, `κ₁=1`, `κ₂=−J₁`, the ratio `ζ=tilde` s/s is an automorphic character. If `F` is totally real, E totally imaginary and `B₁,B₂` split at one common real place, `ζ=1` at every local place.

All global hypotheses of A.14, including the common split real place.

(IP23, AppendixA PropositionA.14, `equations(A.9)–(A.11)`, PDF98–99). *Needs:* 3.24, 3.25, 3.26, 3.30, 3.31, 3.32; QuadraticFormInvariants §6C.

### 3.33 Harris–Kudla splitting comparison

Prove `quaternionSplitting_harrisKudla`: For split `B` and idempotent e, `V†=Ve,W†=eW` have dimensions 2m,2 and V† diagonal (`κ_i u/2,−κ_i/2`). Set `s†(h)=ξE(x(h))^m(γ′)^−j(h)`, with `γ′=γ_F(ψ/2)^{2m}γ_F(detV†,ψ/2)Hasse(V†)`. Extend via h `d(ν(h))⁻¹`; the polarization correction gives `s₀=s†μ₀=s`.

Exact split quaternion idempotent and bases; norm-image multipliers; source quadratic determinant.

(IP23, AppendixA LemmasA.24–A.27, PDF108–115). *Needs:* 3.24, 3.27, 2.2, 3.1.

### 3.34 Similitude theta correspondence

Prove `similitudeTheta_howe`: For the matched multiplier subgroup `R⊂G×H⁺`, compactly induce the extended oscillator to `Ω=c-Ind_R^{G×H⁺}ω`. Prove finite-length big quotients, and, for Ichino–Prasanna’s classical pairs, small theta zero or irreducible and injective on its nonzero domain. `H⁺` is the multiplier-image subgroup.

Characteristic-zero local `F`; isometry-group Howe, Clifford and compact-induction inputs; AutomorphicFormsOnReductiveGroups §§2.4, 6.8 at infinity.

(IP23, §7.2 and Lemma9.3 arXiv PDF41–42,50–52). *Needs:* 3.7, 3.16, 3.24; SmoothRepresentationsOfLocalGroups §SR.2.2; SmoothRepresentationsOfLocalGroups §SR.3.1; AutomorphicFormsOnReductiveGroups §§2.1, 2.7.

### 3.35 Real discrete-series theta lifts

Prove `theta_realDiscreteSeries`: For `ψ_R(t)=exp(2πit)`, `k≥2` and holomorphic `SL₂(R)` discrete series π of weight `k+1`, use the maximal π-isotypic convention of 3.4: `θ(π∨)|G⁰=A_q₀(0,0,k−2)` and `θ(π)|G⁰=A_q₁(k−2,0,0)`. `q₀` has Levi `so(4)+so(2)`; `q₁` has Levi `so(2)+so(2,2)` and minimal `K-type(k,0,0)`. To `O(0,6)`, `θ(π∨)|G⁰` has highest weight `(k−2,0,0)`, and `θ(π)=0`. IP23 defines its theta functor using the maximal π∨-isotypic quotient, so its input label is the dual of the input here.

Positive `ψ`; exact root basis, components and cohomological induction conventions of the source.

(IP23, §7.2.1–7.2.2 arXiv PDF41–42). *Needs:* 2.7, 3.7, 3.10; AutomorphicFormsOnReductiveGroups §§2.4, 5.4, 6.8.

**Checks.**

- At `k=2`, the lift of `π∨` to `O(0,6)` restricts to the trivial representation; the lift of π is zero.
- At `k=3`, that compact lift has highest weight `(1,0,0)`.
- To `O(4,2)`, the lift of π has minimal K-type `(k,0,0)` in the q₁ case; its dual input gives the q₀ case.

### 3.36 Quaternionic unramified theta lift

Prove `theta_quaternionUnramified`: In Lemma9.4’s odd-residue unramified E/F, split `B`, self-dual `V^dagger` and conductor-zero `ψ` setup, an unramified `H^+` constituent of normalized `GL₂` induction `χ₁⊗χ₂` lifts to the `GSO(3,3)-form` constituent induced from `(χ₁χ₂⁻¹ξE)⊗|·|⊗((χ₂|·|⁻¹/²)∘N_{E/F})`, on the source’s torus coordinates.

Norm-image subgroup, exact Borel and integral splitting.

(IP23, Lemma9.4 arXiv PDF53). *Needs:* 3.33, 2.6a; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.3; AdelicAlgebraicGroups §§1.1, 1.5.

### 3.37 Rank-one oscillator constituents

Prove `theta_rankOneConstituents`: Split the rank-one oscillator on `S(F)` into even and odd parts `ρψ⁺,ρψ⁻`. In the split `O₃` normalization use the conjugate oscillator: `Θ(ρ̄ψ⁻)=St⁻` and `0→St⁺→Θ(ρ̄ψ⁺)→1→0`. The even big lift is this extension; its small lift is 1.

Characteristic-zero nonarchimedean `F` and Gan–Savin’s `ψ` and `O₃` extensions of the Steinberg representation.

(GS23a, §8.4 PDF26–28; §11.4 with conjugate-oscillator normalization). *Needs:* 3.4, 3.5, 3.12, 2.7.

### 3.38 GL₂–GSO₄ theta correspondence

Prove `theta_gl2Gso4`: For irreducible generic `π` of `GL₂(F)`, the similitude theta lift of `π∨` to `GSO₄≃(GL₂×GL₂)/{(zI,z⁻¹I):z∈F×}` in the tensor action convention is `π⊗π`, and theta back from `π⊗π` is `π∨`, in Gan–Savin Lemma13.2’s action convention.

Characteristic-zero nonarchimedean `F`, generic irreducible `π` and compatible similitude oscillator action.

(GS23a, Lemma13.2 PDF40–41). *Needs:* 3.7, 3.12, 3.34; SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.1.

**Checks.**

- `(zI,z⁻¹I)` acts on `π⊗π` by `ωπ(z)ωπ(z⁻¹)=1`, so the tensor descends.
- `(zI,zI)` acts by `ωπ(z)²`; a generic π with nonquadratic central character need not descend through that subgroup.
- The descended representation has similitude theta lift back to `π∨`, with the same oscillator as in the forward direction.

### 3.38a Restricted SO₇ oscillator and cuspidal injectivity

Construct `g2RestrictedOscillator` over a nonarchimedean characteristic-zero field F: restrict the split seven-dimensional quadratic oscillator from `Mp₂×SO₇` along the standard `G₂→SO₇` embedding. Fix ψ and the splitting of 3.2, and form its big theta coinvariants in the convention of 3.4. Prove the Jacquet exact sequence of GG06 Proposition 8.1 for the trivial character of the upper unipotent N of Mp₂. As G₂-modules it is `0→Ind_Q^{G₂} Cc∞(F×)→Ω_N→ℂ→0`, with Q the stabilizer of an isotropic line and its Levi `GL₂` acting on `F×` through det; induction here is the unnormalized smooth induction. Construct the maps by restriction to the nonzero null cone and evaluation at zero. Retain the covered-torus action inherited from the oscillator, including its Weil character and `|a|^(7/2)` scaling, when using the sequence to prove finite length of a theta Jacquet module.

Prove `g2CuspidalTheta_injective`: for nonisomorphic genuine supercuspidals `σ₁,σ₂` of Mp₂, their nonzero small G₂ lifts are nonisomorphic, with the nonvanishing and irreducibility assertions of GG06 Theorem 9.1(c,d). Use this assertion and the Jacquet sequence to prove the restricted big lift of a tempered G₂ representation has finite length. This restricted oscillator is not a type-I dual pair.

(GG06, §8 Proposition 8.1 and §9 Theorem 9.1(c,d); GS23a, §14.2 Proposition14.2 proof, PDF50–51, including (14.3).) *Needs:* 3.2, 3.4, 3.8; SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.3.1.

**Checks.**

- Evaluation at zero in `Ω_N` has trivial G₂ action; its covered-torus action retains `χψ,V(a)|a|^(7/2)`, rather than the trivial torus character.
- A locally constant compactly supported function on the nonzero null cone lies in the kernel of evaluation at zero; extension through that cone gives the induced term in the exact sequence.
- Distinct genuine supercuspidals with nonzero G₂ lifts cannot occur in the cuspidal part of the same restricted lift; this is the injectivity input making that part zero or irreducible.

### 3.39 Minimal orthogonal theta lift

Prove `theta_minimalOrthogonal`: For split `SO₂n`, `n=5,6`, the trivial `SL₂` big lift is the minimal `Π_n`, with irreducibility supplied by Yamana. The `Π_n` lift of tempered `G₂` representations has finite length. Under `Sp(V₂)×Sp(V₆)→SO(V₂⊗V₆)`, the specified see-saw Hom module is `Hom_{Sp(V₂′)}(Θ′(σ),1)`, finite length as an `Sp(V₂)-module`. This is not finite-dimensionality of the entire Hom space.

Characteristic-zero nonarchimedean `F`, split forms `n=5,6` and the exact minimal-representation realization. `π` is tempered where Proposition14.2 requires it; `σ` is the stated irreducible `Sp(V₆)` representation. The restricted `Mp₂×G₂` oscillator, Jacquet sequence and cuspidal injectivity are supplied by 3.38a.

(GS23a, §14.2 Proposition14.2 and §14.3, arXiv-v1 PDF50–51). *Needs:* 3.6, 3.7, 3.8, 3.38a; SmoothRepresentationsOfLocalGroups §SR.3.1.

### 3.40 Division ternary theta lift

Prove `theta_divisionTernary`: For supercuspidal `ρ` of `PGL₂(F)` and division `B`, take `JL(ρ)` on `PB×≃SO(B₀,N)`. Its rank-one lift `θψ(JL(ρ))` is nonzero irreducible genuine supercuspidal, with the source `ψ` and splitting. The exceptional `G₂` lift belongs elsewhere.

`ρ` is supercuspidal on `PGL₂`, and the exact `ψ` and splitting normalization in §15.1 is used. No claim is made for all irreducible representations of `PB×`.

(GS23a, §15.1 preceding Lemma15.4, arXiv-v1 PDF54). *Needs:* 3.7, 3.10; QuadraticFormInvariants §6C; GL2AutomorphicRepresentationsAndTransfer R17.1.1 (quaternionic local Jacquet–Langlands).

### 3.41 PGSp₆–PGSO₈ similitude theta

Prove `theta_pgsp6Pgso8`: For generic irreducible `σ` of `PGSp₆`, prove its `PGSO₈` similitude lift nonzero. If `σ_b` occurs on `Sp₆`, its `SO₈` lift occurs in the restriction with standard parameter `φ_b⊕1`. Unramified Satake uses `Spin₇→Spin₈` and `std₈|Spin₇=1⊕std₇`, together with the spin restrictions.

Characteristic-zero nonarchimedean `F`; generic `σ`; the multiplier subgroup of GS23b §4.2. The second sentence assumes a local Langlands parametrization of generic representations of `Sp₆(F)` by standard parameters into `SO₇(ℂ)` with the properties GS23b §4.2 uses (Arthur's parametrization). No TauCetiRoadmap roadmap constructs it, so it is a hypothesis of this target, and a roadmap that constructs it instantiates the statement; the first sentence and the unramified Satake statement need no such input.

(GS23b, §4.2 PDF17–18). *Needs:* 3.7, 3.21, 3.34; SmoothRepresentationsOfLocalGroups §§SR.3.1, SR.4.1–SR.4.2.

### 3.42 PGSp₆ theta dichotomy

Prove `theta_pgsp6Dichotomy`: Every irreducible `σ` of `PGSp₆(F)` has nonzero theta lift to exactly one of `PGO₈` and `PGO_{5,1}` in Gan–Savin’s two matched towers. Some representations already occur at `PGO₆≃PGL₄⋊{±1}`; first occurrence determines this case.

Characteristic-zero nonarchimedean `F`, the source’s two discriminant-compatible orthogonal towers.

(GS23b, §12.2 PDF34–35). *Needs:* 3.16, 3.10, 3.34.

### 3.43 Relevant unitary local dichotomy

Prove `theta_relevantDichotomy`: For a relevant tempered L-representation `π_v` in Disegni–Liu’s rank `n=2r` setting, there is a unique rank-n Hermitian space `V_πv` for which theta is nonzero, for every embedding `L→C`. Its lift is tempered irreducible admissible and the double-theta Hom recovers `π_v`. Keep the stated semisimplicity/irreducibility reference gate separate from Howe duality.

Nonarchimedean places, exact relevance and coefficient-field hypotheses of §4.1; specified `ψ,χ` and Hermitian invariant.

(DL24, Lemma4.1 arXiv PDF41). *Needs:* 3.3, 3.7, 3.18, 3.19.

### 3.44 Rationality of local theta lifting

Prove `theta_coefficientRationality`: For relevant `π`, let `U_π` be the finite set of places where `π_v` is not fixed by every similitude conjugation †a. Define `Q_π` from `{a∈Ẑ×:a_v∈N(E_v×) for v∈U_π}`. For `σ∈Aut(C/Q_π)`, prove `θ(σιπ_v)≃σθ(ιπ_v)`; changing `ψ` to `ψ_a` changes `π` to `π^{†a}`, removed by the norm/symmetry condition.

Exact coefficient field L and embeddings; finite nonsymmetric set so the subgroup is open; class-field construction is imported.

(DL24, Lemma4.5 and (4.2) arXiv PDF42). *Needs:* 3.43, 2.7; AutomorphicLFunctionsAndLocalFactors AL.0 (change of additive character).

### Examples

A zero tensor factor enlarges the dual-pair kernel, so both factors are nonzero in its scalar-kernel theorem. A tower with every space zero has first occurrence ∞; a nonzero rank-zero member has first occurrence 0. Dimension and Witt rank remain different quantities.

### Dependencies

Within this roadmap: Layers 0–2. From other roadmaps: RepresentationTheory/ClassicalGroups Layer 0; GeometryOfNumbersAndQuadraticArithmetic §2.9; QuadraticFormInvariants §6C; AutomorphicLFunctionsAndLocalFactors AL.0–AL.1 (local Fourier inversion, change of additive character, local epsilon factors and Gauss sums); SmoothRepresentationsOfLocalGroups §§SR.0.2, SR.2.1–SR.2.3, SR.3.1, SR.3.3, SR.4.1–SR.4.4; AutomorphicFormsOnReductiveGroups §§2.1, 2.4, 2.7, 5.4, 6.8; AdelicAlgebraicGroups §§1.1, 1.5; GL2AutomorphicRepresentationsAndTransfer R17.1.1; EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3.

## Layer 4: Adelic metaplectic covers and finite Weil representations

### 4.1 Unramified compact splittings

Prove `metaplectic_goodLattices`: For a symplectic datum over a global field of characteristic different from two and a nontrivial adelic additive character, choose integral lattices whose localizations are self-dual with conductor-zero character and odd residue characteristic at all but finitely many places. At these places use the distinguished local splitting of 2.6a in the restricted product.

(Weil64, III.§36, printed186–187, PDF44–45). *Needs:* 2.6a; AdelicAlgebraicGroups §§1.2, 1.5; AutomorphicLFunctionsAndLocalFactors AL.0 and AL.3, *Curve additive analysis*.

**Checks.**

- For the standard symplectic space over `ℚ`, the standard lattice is self-dual at every odd prime where the chosen character has conductor zero.
- Changing a rational basis introduces only finitely many additional bad primes, dividing its denominators or determinant.
- Dyadic places belong to the finite exceptional set.

### 4.1a Function-field vector-space Fourier and Poisson adapter

Construct `functionFieldVectorPoisson`. For `F=𝔽_q(X)`, `char F≠2`, take the completion-valued adeles, residue character associated to a nonzero rational differential, local Schwartz–Bruhat spaces and scalar self-dual measures and Poisson theorem from AutomorphicLFunctionsAndLocalFactors AL.3, *Curve additive analysis*. For every finite-dimensional rational space A, construct `S(A(𝔸_F))` as the locally constant compactly supported carrier, its coordinatewise Fourier transform into the dual space, and its restricted tensor realization with good lattice indicators. Prove basis independence, Fourier inversion, rational-lattice covolume one for the self-dual measures, and vector-space Poisson summation. Extend the scalar theorem by finite products, using that locally constant compactly supported functions on the finite product are finite sums of product functions. Transport it to a specified perfect rational pairing and prove compatibility with partial Fourier transforms and rational linear changes of variables. Use these adelic and measure carriers in 4.2–4.4 for function fields; AL.0 supplies the number-field versions.

(Weil64, II.§30 Proposition5 and III.§§37–40; AutomorphicLFunctionsAndLocalFactors AL.3, *Curve additive analysis*, its residue-character and Poisson normalization.) *Needs:* AutomorphicLFunctionsAndLocalFactors AL.3, *Curve additive analysis*; AdelicAlgebraicGroups §§0.2–0.3.

**Checks.**

- For `F=𝔽₃(t)` and `dim A=1`, the transform and Poisson formula are the supplied scalar formulas with the differential `dt`, including its conductor at infinity.
- For `A=F²` and a product of two scalar test functions, both Fourier transform and Poisson sum are the products of the scalar identities.
- For `A=0`, the rational sum consists of one term and its self-dual quotient volume is 1; no archimedean Schwartz factor occurs.

### 4.2 Adelic metaplectic cover

Define `adelicMetaplectic` as follows. Take the restricted product `∏′_v Mp(W_v)` relative to the distinguished integral splittings at good finite places. Its central restricted subgroup is the finite-support product `⊕_v μ₂`. Quotient by the subgroup `{ε:∏_v ε_v=1}` to obtain `Mp(W)(A)`, with exact projection to `Sp(W)(A)` and a single `μ₂` kernel. Equip it with the quotient topology and local compactness inherited from the restricted product.

Global field `char≠2` with the characteristic-zero source used for number-field assertions; finitely many bad places retained; topological restricted-product input from AdelicAlgebraicGroups §1.2.

(Weil64, III.§§37–38, printed187–189, PDF45–47; IV.§42 for the twofold reduction). *Needs:* 4.1, 4.1a for function fields, 2.4b; AdelicAlgebraicGroups §1.2.

- `QuotientGroup.lift`: A supplied group projection descends through the native quotient when the quotient subgroup lies in its kernel. The restricted-product topology and `μ₂` kernel require source data.
- `QuotientGroup.mk'`: A specified homomorphism into the group followed by the native quotient map gives the local-to-global adapter.
- `MonoidHom.map_list_prod`: A finite collection of local central signs has global value their product.

**Checks.**

- Two local central `−1` signs give the global identity.
- One local central `−1` remains nontrivial.
- Every central representative equals a single-place sign modulo the product-one subgroup.

### 4.3 Weil product formula

Prove `weilIndex_productFormula`: For a nondegenerate quadratic form q over a global field `F` and the factorizable additive character `ψ` of A/F with compatible self-dual measures, `γψ_v(q_v)=1` almost everywhere and `∏_vγψ_v(q_v)=1`. This is the analytic Weil-index product formula; local Hilbert/Hasse formulas are its local adapters.

`F` has `char≠2`; every dyadic and archimedean factor included. Character is trivial on `F` and Haar measures are globally compatible.

(Weil64, II.§30 Proposition5, printed179–180). *Needs:* 2.1, 4.1a for function fields; AutomorphicLFunctionsAndLocalFactors AL.0 (number-field vector-space Poisson summation) and AL.3, *Curve additive analysis* (function-field scalar Poisson); QuadraticFormInvariants §6C.

### 4.4 Rational symplectic splitting

Define `rationalMetaplecticSplitting` as follows. The product formula gives a canonical homomorphism `Sp(W)(F)→Mp(W)(A)` splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization.

Global `ψ` trivial on `F`; rational symplectic space and a compatible adelic Schrödinger realization.

(Weil64, III.§40, printed190–193, PDF48–51; §41 rational invariance). *Needs:* 4.2, 4.3, 2.4, 4.1a for function fields; AutomorphicLFunctionsAndLocalFactors AL.0 (number-field vector-space Poisson summation) and AL.3, *Curve additive analysis* (function-field scalar Poisson).

- `rationalSplitting_projection`: Projection of the rational lift is the diagonal adelic symplectic element.
- `rationalSplitting_mul`: The rational lift is a group homomorphism.
- `rationalSplitting_polarization`: Changing rational polarization conjugates the model and preserves the lift.

**Checks.**

- Rational identity maps to adelic identity.
- Rational Fourier generator preserves theta summation by Poisson.
- A single-place sign change generally breaks theta preservation.

### 4.5 Adelic Weil representation

Define `adelicWeil` as follows. Construct the global oscillator action on `S(X(A))=S(X_∞)⊗(∏′_{v finite}S(X_v))`, the algebraic finite-place restricted tensor product with standard lattice indicators and the full joint archimedean Schwartz space. Pure tensor operators use the product of local Weil actions; the product-one central subgroup acts trivially, so the action descends to `Mp(W)(A)`.

Number field, global `ψ`, finite-dimensional rational `X` and compatible polarizations/measures. The archimedean space is the joint Schwartz space, not merely the span of products over individual real/complex places.

(Weil64, III.§§38–39, printed188–190, PDF46–48). *Needs:* 4.2, 4.4, 2.4c; ArithmeticGaloisRepresentations §2.7, *Global inputs* (adelic Schwartz–Bruhat space), with AutomorphicLFunctionsAndLocalFactors AL.0 (vector-space and partial Fourier transforms); AutomorphicLFunctionsAndLocalFactors AL.0 (local Schwartz–Bruhat space).

- `adelicWeil_pureTensor`: On a factorizable vector, each local operator acts on its own factor.
- `adelicWeil_central`: The single adelic central `−1` acts as scalar `−1`.
- `adelicWeil_characterChange`: Changing the global additive character gives the scaled quadratic/symplectic datum with compatible local operators.

**Checks.**

- At good places, the integral compact splitting fixes the standard indicator.
- Two local central `−1` operators cancel on pure tensors.
- The archimedean carrier includes joint Schwartz functions outside finite sums of one-coordinate products.

### 4.6 Adelic choice compatibility

Prove `adelicWeil_choiceCompatibility`: Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing `ψ` to `ψ_a`, `a∈F×`, is the scaled rational datum and respects the product formula.

The changed local choices agree at almost all places or have explicitly transported reference compacts; no unrestricted infinite rescaling.

(Weil64, III.§§38–40, printed188–193, PDF46–51). *Needs:* 4.2, 4.5, 4.4, 2.7.

### 4.7 Finite Weil representation

Define `finiteWeil` as follows. For an even integral lattice L with discriminant module `D=L∨/L`, realize C[D] as the finite adelic Schwartz subspace `S_L` supported on Lhat∨ and periodic under Lhat. Restrict the adelic Weil action along the rational lift whose real component is `γ̃∈Mp₂(Z)`. In the AGHMP convention this is `ω_L`, while the frequently cited `ρ_L` is its complex conjugate. Since `ψ_Q` is trivial on `Q` and `ψ_Q,∞(q)=exp(2πiq)`, `ψ_Q,f(q)=exp(−2πiq)`. Thus `T` in `ω_L` multiplies `e_μ` by `exp(−2πiq(μ))`; in `ρ_L` it multiplies by `exp(2πiq(μ))`. `S` in `ω_L` has the positive discriminant-pairing exponential and the conjugate of the usual `ρ_L` Weil phase, namely it is the discriminant-pairing finite Fourier transform with the signature/Weil phase dictated by `ψ`.

Nondegenerate even lattice, `ψ_Q` with positive real exponential and globally compatible finite character; discriminant form and signature imported from IntegralLattices.

(AGHMP18, §4.7 published452–453, PDF62–63). *Needs:* 4.5, 4.4, 2.5; IntegralLattices Layer 1.

- `finiteWeil_T`: `T e_μ=exp(−2πiq(μ))e_μ` in `ω_L`; `ρ_L` has the positive exponent.
- `finiteWeil_S`: In `ω_L`, `S` uses `exp(2πi(μ,ν))/sqrt(|D|)`, multiplied by its specified Weil phase. Conjugation gives the negative pairing exponential and conjugate phase in `ρ_L`.
- `finiteWeil_conjugate`: `ρ_L` is the complex conjugate of `ω_L`; `T` exponents change sign.
- `finiteWeil_TOperator`: Construct the diagonal native linear operator with negative quadratic exponential on `D→ℂ`.
- `finiteWeil_SOperator`: Construct the native finite Fourier linear operator with positive pairing exponential and specified Weil phase.
- `finiteWeil_SOperator_sq`: For a symmetric nondegenerate discriminant pairing, `(S²φ)(ν)=c²φ(−ν)`, where c is the Weil phase.

**Checks.**

- On a singleton with `q=0`, `T=id`; retain the `S` signature phase.
- `q(μ)=1/4`: `T eμ=−i eμ` in `ω_L` and `+i eμ` in `ρ_L`.
- On Unit with zero pairing and phase 1, `S=id`.

### 4.8 Function-field metaplectic programme

State `metaplectic_functionFieldProgramme` as a conditional statement. Let `F` be a global function field over `𝔽_q`, `G` a split reductive group over F and `N>0` with `N|q−1`. Fix a prime `ℓ∤qN`, coefficients `Q̄_ℓ`, a finite compact level K with its specified cover splitting, a genuine central character ζ, and a lattice `Ξ⊂Z_G(F)\Z_G(𝔸_F)` with a compatible lift to the cover and compatible ζ. Use the resulting finite-dimensional space `C_c^cusp(G(F)\G̃(𝔸_F)/(KΞ),ζ)`.

Assume (i) a factorization `μ_N`-gerbe on `Bun_G` defined over `𝔽_q`; (ii) its metaplectic geometric Satake equivalence with fusion and commutativity, together with an arithmetic metaplectic L-group extension `1→Ĝ_N→ᴸG_N→Gal(F̄/F)→1` and the Galois-compatible arithmetic Satake functor of Laf18 §14, with the properties of its Theorem12.16; (iii) global Hecke and excursion constructions on this same finite-dimensional cusp space satisfying the fusion, composition, continuity and Satake relations of Laf18. Then the space decomposes into generalized excursion eigenspaces indexed by `Ĝ_N`-conjugacy classes of continuous semisimple parameters `σ:Gal(F̄/F)→ᴸG_N` projecting to the identity, defined over a finite coefficient extension and unramified away from the fixed level and cover ramification. A formulation by `Ĝ_N`-valued homomorphisms additionally requires a chosen compatible splitting with trivial Galois action; a geometric dual group alone supplies no such splitting.

The global operators `S_(I,f,(γᵢ))` use an arbitrary finite set I and a tuple of global Galois elements. In the split arithmetic specialization, f is a regular function on `Ĝ_N\Ĝ_N^I/Ĝ_N`; in general use the invariant tensors in representations of `ᴸG_N^I` from the arithmetic Satake hypothesis, with their specified Galois components. Frobenius-at-place tuples are specializations of this family. The adelic cover of 4.2 supplies the analogous `N=2` construction. No TauCetiRoadmap roadmap supplies hypotheses (i)–(iii); SmoothRepresentationsOfLocalGroups §SR.6.3 supplies only local excursion operators.

(Laf18, Théorème0.1, Définition0.29, §14, Remarques14.1–14.2 and (14.1)–(14.5), arXiv-v10 PDF169–173). *Needs:* 4.2.

**Checks.**

- At `N=1`, the trivial gerbe, ordinary arithmetic Satake and split ordinary L-group give Laf18 Théorème0.1 on the same fixed `K,Ξ,Q̄_ℓ` cusp space.
- For `G=Gₘ,F=𝔽_q(t)` at maximal compact level without Ξ, the space is `C_c(ℤ)` and degree-one translation has no nonzero generalized eigenvectors of finite support. Quotienting by a degree lattice removes this obstruction.
- The restriction `N|q−1` fixes split roots of unity and is stronger than existence of a factorization gerbe: the neutral `Bμ₃` factorization gerbe exists over `𝔽₅` although `μ₃` is nonconstant.
- A two-element I permits arbitrary two global Galois elements, without choosing two places; the local excursion algebra does not supply this family.

### Examples

Two local central signs multiply to `+1` in the product-one quotient, whereas a single sign outside the quotient subgroup survives. On a finite quadratic module with `q(μ)=1/4`, `T` acts by `−i` and conjugation acts by `+i`; the finite `S` operator retains the source signature phase.

### Dependencies

Within this roadmap: Layers 0–3 (directly Layer 2). From other roadmaps: ArithmeticGaloisRepresentations §2.7, *Global inputs* (number-field scalar adelic Schwartz–Bruhat space and Poisson summation); AutomorphicLFunctionsAndLocalFactors AL.0 (number-field local Schwartz–Bruhat spaces, local Fourier inversion, vector-space Poisson summation) and AL.3, *Curve additive analysis* (function-field completion-valued adeles, residue characters, local Fourier theory and scalar Poisson); AdelicAlgebraicGroups §1.2; QuadraticFormInvariants §6C; IntegralLattices Layer 1.

## Layer 5: Global theta kernels and genuine automorphic forms

### 5.1 Theta kernel

Define `thetaKernel` as follows. For a rational polarized symplectic space `W` with configuration space `X`, define `θφ(g)=Σx∈X(F)(ωψ(g)φ)(x)`, `φ∈S(X(A))`. For a split dual-pair realization write `θ(g,h;φ)` for its pullback. This is a genuine function on `Sp(W)(F)\Mp(W)(A)`, with the rational subgroup embedded by the canonical splitting; the nontrivial global central sign acts by `−1`. On an even orthogonal dual pair the pulled-back kernel is linear in the symplectic factor.

Number field, characteristic-zero source, compatible `ψ` and self-dual measures; actual joint archimedean Schwartz functions. For a dual pair its splitting characters are fixed.

(Weil64, III.§41 Théorème6, printed193–194, PDF51–52). *Needs:* 4.5, 4.4; AutomorphicLFunctionsAndLocalFactors AL.0 (vector-space Poisson summation).

- `thetaKernel_apply`: The kernel is the rational sum of the transformed Schwartz function.
- `thetaKernel_rational`: The sum is invariant under an element whose action on the same function representation reindexes by an explicit bijection; the canonical rational lift must be identified with this action.
- `thetaKernel_central`: `θφ(zg)=−θφ(g)` for the global central `z=−1`.

**Checks.**

- `X=0`: the rational sum has one term.
- Rational Fourier generator preserves the sum with covolume 1.
- Nonzero genuine `θφ` cannot descend to `Sp(W)(A)`.

### 5.2 Theta smoothness and growth transfer

Prove `theta_uniformModerateGrowth`: The theta kernel is smooth at infinity, locally constant at finite places, and every archimedean differential operator can be applied termwise on compact subsets. On the specified adelic Siegel sets its derivatives satisfy a common polynomial height bound for each finite Schwartz seminorm family. With fixed finite level and finite K-type this gives uniform moderate growth in the sense of AutomorphicFormsOnReductiveGroups §0.4, after comparison of the cover height with the base-group height.

Number field; finite-dimensional quadratic/symplectic datum; fixed finite-level vector and K-type where an automorphic-form space requires them. The height, central-character restriction and Schwartz seminorms must be matched to the supplier.

(Weil64, III.§41 Lemmas4–5 and compact normal convergence, printed193–194, PDF51–52). *Needs:* 5.1; AdelicAlgebraicGroups §3.4 (adelic Siegel sets); AdelicAlgebraicGroups §3.4 (Siegel covering); AdelicAlgebraicGroups §3.5 (heights on Siegel sets); AutomorphicFormsOnReductiveGroups §0.4.

*Proof input.* Weil's lemmas give continuity and normal convergence on compacta. The uniform derivative and polynomial height bounds are part of this target: differentiate under the sum using the smooth vectors of 0.18, and bound on Siegel sets with AdelicAlgebraicGroups §§3.4–3.5 and the moderate-growth seminorms of AutomorphicFormsOnReductiveGroups §0.4. Convergence on compacta alone does not give them.

### 5.3 Genuine automorphic spaces

Define `genuineAutomorphic` as follows. Inside smooth finite-level functions on `Sp(W)(F)\Mp(W)(A)`, take the subspace of infinitesimal-character-finite, uniformly moderate-growth functions f with `f(zg)=−f(g)`, using the central-character convention of AutomorphicFormsOnReductiveGroups §3.2. Its cuspidal subspace has vanishing constant term along every proper rational parabolic, computed through the canonical unipotent splitting. Following GQT §2.10, this smooth space imposes no K-finiteness and carries the full right `G(A)-action`. Its K-finite part is instead a (g,K)-module with the finite-adelic action; full real-group translation is not claimed to preserve K-finiteness.

Use the actual adelic cover, rational splitting and the analytic conventions of AutomorphicFormsOnReductiveGroups Layers 0–4; require the same split-center/central-character normalization as the base automorphic space.

(Weil64, III.§41 Théorème6, printed193, PDF51; AutomorphicFormsOnReductiveGroups §§0.4, 3.1 supply finiteness and growth conditions; GQT, §2.10, arXiv-v3 PDF13). *Needs:* 4.2, 4.4, 5.2; AutomorphicFormsOnReductiveGroups §0.1; AutomorphicFormsOnReductiveGroups §§3.1–3.2; AutomorphicFormsOnReductiveGroups §§4.1–4.2.

- `genuineAutomorphic_eval`: Elements evaluate as functions on the actual cover quotient.
- `genuineAutomorphic_right`: Right translation preserves the smooth genuine automorphic and cusp subspaces. The K-finite part is stable under its (g,K) and finite-adelic actions.
- `genuineCusp_iff`: Membership in the cusp subspace is the vanishing of all proper parabolic constant terms.

**Checks.**

- Zero belongs to the automorphic and cusp spaces.
- A genuine function descending to the base group is zero.
- Translation preserves the central sign equation.

The central sign equation `f(zg)=−f(g)` (`centralSignFunctions`) gives neither automorphy nor smoothness, finiteness, cusp conditions or growth; the carrier `genuineAutomorphic` imposes all of them.

### 5.4 Unipotent splittings

Prove `metaplectic_unipotentSplitting`: Each rational unipotent subgroup `U` of `Sp(W)` has the canonical continuous splitting in the local and adelic metaplectic double cover, compatible with conjugation and the rational splitting. On the Siegel unipotent this is the phase-multiplication operator. Uniqueness is in the characteristic-zero unipotent setting and follows from absence of nontrivial continuous `μ₂-valued` characters.

Characteristic zero; the unipotent subgroup and cover topology are fixed.

(Kudla96, I.6 Lemma6.3, PDF25–26 (unique unipotent lift); compare I.6 formulas PDF26–27). *Needs:* 2.4b, 2.5, 4.4.

### 5.5 Metaplectic constant terms and Whittaker coefficients

Define `metaplecticWhittaker` as follows. For a continuous genuine automorphic f, a rational unipotent `U`, and a unitary character `η` on `U(F)\U(A)`, define `W_U,η(f)(g)=∫U(F)\U(A) f(ũg)η(u)⁻¹du` using the canonical splitting and probability quotient Haar. The trivial `η` gives the constant term. Right translation and differentiation commute with the integral under the regularity hypotheses of AutomorphicFormsOnReductiveGroups §4.1; central genuineness is retained.

`U(F)\U(A)` compact; `η` trivial on rational points; f smooth for derivative assertions. Fourier expansion requires the appropriate abelian `U` and the supplier’s convergence topology.

(Weil64, III.§41 Théorème6, printed193, PDF51 (theta realization); AdelicAlgebraicGroups §§2.2–2.3 and AutomorphicFormsOnReductiveGroups §4.1 supply the quotient integrals). *Needs:* 5.3, 5.4; AutomorphicFormsOnReductiveGroups §4.1; AdelicAlgebraicGroups §§2.2–2.3; AutomorphicLFunctionsAndLocalFactors AL.0 (standard additive character).

- `metaplecticWhittaker_trivial`: The trivial-character coefficient equals the constant term.
- `metaplecticWhittaker_right`: Coefficient extraction commutes with right translation.
- `metaplecticWhittaker_central`: The coefficient is genuine in its remaining cover variable.

**Checks.**

- `U=1`: the coefficient is `f(g)`.
- On compact abelian `U` with probability measure, `f=η` has `η` coefficient 1.
- A distinct unitary character has `η` coefficient 0.

### 5.6 Global theta lift

Define `globalThetaLift` as follows. For a dual pair G,H, define `θφ(f)(g)=∫[H] θ(g,h;φ) conjugate(f(h))dh` whenever the displayed product is absolutely integrable. Its span is the global theta-lift module; the oscillator splitting fixes its central character and equivariance. If f is cuspidal with the required unitary central character, the rapid decay of cusp forms (AutomorphicFormsOnReductiveGroups §4.2) combined with the theta-growth estimate supplies convergence in the source’s permitted range.

Quotient and measure normalized as in GQT; use either anisotropic `H`, the convergent range, or a cusp/decay bound proved sufficient. No arbitrary regularized value is substituted for a divergent integral.

(GQT, §11.1, PDF52, cuspidal theta lift; §2.11 PDF13 gives the kernel). *Needs:* 5.1, 5.2, 5.3; AutomorphicFormsOnReductiveGroups §4.2; AdelicAlgebraicGroups §3.4.

- `globalThetaLift_apply`: The lift evaluates by the integrable theta pairing.
- `globalThetaLift_equivariant`: Right translation acts through the kernel’s two commuting actions.
- `globalThetaLift_central`: The output central character is determined by the chosen oscillator splitting and input character.

**Checks.**

- Zero input or Schwartz vector gives zero lift.
- Unit with Dirac measure gives `θ(g,())conj(f(()))`.
- A nonintegrable native Bochner integral defaults to zero but fails the theta-lift integrability contract.

### 5.7 Weil convergence criterion

Prove `thetaIntegral_converges`: For the GQT type-I datum with `dim_E V=m=m₀+2r`, `W_n=Y_n⊕Y_n*` split with `dim_E W_n=2n`, `dim_E Y_n=n`, `ε₀∈{−1,0,1}`, `d(n)=n+ε₀`, the theta integral of every Schwartz vector over `H(V)(F)\H(V)(A)` converges absolutely if `r=0` or `m−r>d(n)`. The borderline and second-term cases require the regularized construction. This is a criterion for the theta integral, not for the pointwise rational theta sum.

Number field; GQT §2 groups, splitting characters and Tamagawa measure; the exceptional split `O(1,1)` normalization is retained.

(GQT, §3.1, PDF14, Weil convergent range). *Needs:* 5.1, 5.2; AdelicAlgebraicGroups §3.4; AdelicAlgebraicGroups §§2.3–2.4.

**Checks.**

- Binary anisotropic V has `m=2,r=0`; with `dim W_n=2,n=1` it is convergent and `s₀=0`.
- Split binary V has `m=2,r=1,n=1,ε₀=1`; the strict inequality fails and the exceptional regularization applies.
- Split ternary V has `m=3,r=1,n=1`; `m−r=d(n)=2`, so it is outside the strict convergent range.

### 5.8 Regularized theta integral

Define `regularizedTheta` as follows. In the GQT nonconvergent range `r>0`, `m−r≤d(n)`, `r≤n`, choose a compatible regularizing Hecke/central operator z making `ω(z)φ` rapidly decreasing and acting on the normalized auxiliary H-Eisenstein series `E_H(s,h)` by `P_z(s)`. Define `B_{n,r}(s,φ)=1/(τ(H)κ_r P_z(s)) ∫[H] θ(g,h;ω(z)φ)E_H(s,h)dh`. It is independent of the admissible regularizer, meromorphic, and satisfies the source functional equation. Laurent coefficients `B_k` at `ρ_H=(m−r−ε₀)/2` retain the source’s indexing.

(GQT datum; `E_H` normalized from the parabolic `|det|^s`; `κ_r` its residue/constant normalization. For split `O(1,1)`, `κ_r=2` and `ρ_H=0`).

(GQT, §§3.2–3.7, PDF14–18; definition §3.5 and functional `equation(3.7)`). *Needs:* 5.7, 5.1; AutomorphicSpectralTheory §§1.1–1.3; AutomorphicSpectralTheory §§2.4, 2.6; AdelicAlgebraicGroups §2.4.

- `regularizedTheta_regularizer`: The meromorphic family is independent of the admissible z.
- `regularizedTheta_convergent`: In a matched convergent case its specified coefficient equals the ordinary theta integral.
- `regularizedTheta_laurent`: `B_k` is the coefficient of `(s−ρ_H)^k` with no reindexing.

**Checks.**

- Zero Schwartz vector gives zero family.
- Scaling z by a nonzero scalar scales numerator and `P_z` equally.
- Split `O(1,1)`: `κ_r=2` at `ρ_H=0`.

### 5.9 Extended Schwartz Weil action

Define `extendedSchwartzWeil` as follows. For totally real F and even-dimensional positive-definite (V,q), use the extended oscillator action on functions in `(x,u)∈V(A)×A×`. At finite places take the locally constant compactly supported space. At a real place first construct the smooth Schwartz-section space `C∞(ℝ×,S(V(ℝ)))`, with Schwartz seminorms and their u-derivatives bounded on compact u-sets. Define the `GL₂(ℝ)×GO(V)(ℝ)` action by the extended oscillator formulas, with transport of u by the source similitude convention, and prove it preserves this ambient space. Inside it distinguish the YZ test vectors
`(P₁(uq(x))+sgn(u)P₂(uq(x)))exp(−2π|u|q(x))`, `P₁,P₂∈ℂ[t]`. Take their linear span of full-group translates as the real factor used in the adelic test representation. This span is group stable; the displayed exact polynomial-Gaussian class itself is only a set of test vectors. Prove smoothness of the action and locally uniform Schwartz-seminorm bounds for its translates on compact group and u-sets. Use these bounds in 5.10 and the distinguished tensor vectors in 5.11.

The finite-place restricted tensor product and the joint archimedean span use the same scalar measures and unitary splitting data as 4.5. No decay in u at zero is inferred from Schwartz decay in x.

(YZ18, Published §6.1, printed578–579, PDF46–47; extended formulas recalled from YZZ13 §§2.1.3,4.1; ambient Schwartz action from 2.5 and 4.5.) *Needs:* 4.5, 3.2, 2.5; AutomorphicLFunctionsAndLocalFactors AL.0 (local and vector-space Schwartz theory); AutomorphicFormsOnReductiveGroups §2.7 (smooth representations).

- `extendedSchwartzWeil_similitude`: A similitude transports u with the source multiplier convention.
- `extendedSchwartzWeil_restrict`: At `u=1` in the isometry subgroup, recover the usual even oscillator action in the ambient Schwartz space.
- `extendedSchwartzWeil_real`: The displayed YZ vectors embed in the real representation, and their full-group translates span its chosen test carrier.

**Checks.**

- Zero polynomial data give zero vector, and `u<0` reverses the P₂ contribution.
- For `F=ℚ,V=ℚ²,q=x₁²+x₂²`, the translate of `exp(−2π|u|q(x))` by `n(1)` at u=1 is `e(q(x))exp(−2πq(x))`. It is an ambient Schwartz vector, but cannot equal a polynomial in q times the original Gaussian: its quotient has modulus 1 and is nonconstant on `q≥0`.
- A noncompact diagonal element changes the Gaussian width; its translate lies in the group-stable carrier even when it leaves the exact YZ class.

### 5.10 Unit-quotiented theta series

Define `unitTheta` as follows. For extended `φ` invariant under a finite-index unit subgroup `μ` via `(x,u)↦(αx,α⁻²u)`, define `θ_μ(g,φ)=Σu∈μ²\F× Σx∈V(F) r(g)φ(x,u)`. The `±1` stabilizer normalization is `w_K=|{±1}∩K|`. For the group-stable test carrier of 5.9, prove normal convergence, including derivatives, locally uniformly in g, and the unit-reindexing identity. At finite level the compact support in u leaves finitely many u-classes modulo μ²; on each representative the uniform Schwartz bounds of 5.9 control the rational x-sum. The series transforms under `GL₂(F)` and the prescribed finite-level GO action as in YZ published §6.1.

(YZ totally real positive-definite even `V`; finite-index unit subgroup preserving `φ`; compact level `K`; retain u-orbits and `w_K`).

(YZ18, Published §6.1, printed578–579, PDF46–47). *Needs:* 5.9, 5.1; AdelicAlgebraicGroups §§3.4, 4.4.

- `unitTheta_representative`: The term is independent of the `μ²-orbit` representative after the simultaneous x substitution.
- `unitTheta_rational`: The series satisfies the stated `GL₂(F)` transformation.
- `unitTheta_multiplicity`: `w_K` is1 or2 according to `−1∈K`.

**Checks.**

- Zero test function gives zero series.
- A level containing `−1` has `w_K=2`.
- The constant sequence 1 indexed by `Z` is not summable; unit orbits must be quotiented.

### 5.11 Extended restriction comparison

Prove `extendedWeil_restriction`: For `V₁⊂V` nondegenerate even-dimensional spaces of dimensions `d₁,d`, restrict a distinguished standard tensor test vector of 5.9 along `V₁` in the ambient Schwartz-section spaces and compare its transformed restrictions. The restriction map and the full-group translates use those ambient spaces; no stability of the exact polynomial-Gaussian class is assumed. In the finite-place normalized model the modulus ratio is `δ(g)^((d−d₁)/2)`, where `δ(diag(a,d))=|a/d|^{1/2}`; at infinity include the prescribed `ρ(g)` power. The quadratic-character/Weil-index ratio must also be retained unless the two splitting characters agree.

(YZ published §6.2 standard complementary Gaussian/indicator; explicit common splitting characters for any statement containing only the modulus factor).

(YZ18, Published §6.2, printed580–581, PDF48–49, restriction formula `preceding(6.2.1)`). *Needs:* 5.9, 2.5, 2.2.

### 5.12 Ideal-class theta series

Define `idealClassTheta` as follows. For `K=Q(√D)`, negative fundamental discriminant `D`, ideal class A and `w=|O_K×|`, define `θ_A(z)=1/w+Σn≥1 r_A(n)exp(2πinz)`. Equivalently, for an integral ideal `a∈A`, `θ_A(z)=(1/w)Σλ∈a exp(2πiN(λ)z/N(a))`; the latter first counts `A⁻¹`, and conjugation identifies its coefficients with A. The series is independent of a and normally convergent on the upper half plane.

`D<0` fundamental; z in the upper half plane. Ideal classes, norms and the dictionary between binary quadratic forms and ideal classes come from IntegralLattices Layer `B` (B2, forms and ideal classes) and GlobalNumberFields.

(GZ86, I.§5(5.2), printed229, PDF6; IV.§1(1.1), printed270, PDF47). *Needs:* 5.1; IntegralLattices Layer 1.

- `idealClassTheta_coeff`: The positive n coefficient is `r_A(n)`.
- `idealClassTheta_constant`: The constant coefficient is1/w.
- `idealClassTheta_lattice`: The w-normalized lattice sum equals the ideal-count series.

**Checks.**

- `K=Q(i)`: `w=4`, constant coefficient 1/4.
- A and `A⁻¹` give equal series.
- For the principal class in `ℚ(i)`, `r_A(1)=r_A(2)=1` and `r_A(3)=0`: `(1)` and `(1+i)` give the first two ideals, while 3 is inert and has no ideal of norm 3.

### 5.13 Ideal-class theta modularity

Prove `idealClassTheta_modular`: `θ_A` is holomorphic of weight1 on `Γ₀(|D|)` with Nebentypus `ε_D`: `θ_A(γz)=ε_D(d)(cz+d)θ_A(z)`, and it is holomorphic at every cusp. This holds for every negative fundamental `D`; the explicit `all-SL₂(Z)` transformation target below is restricted to odd `D`.

Negative fundamental `D`; `γ∈Γ₀(|D|)`; source lattice and character conventions.

(GZ86, IV.§1 `after(1.1)`, printed270, PDF47). *Needs:* 5.12, 2.5, 4.4; ModularForms Layer 0.

### 5.14 Ideal-class theta conjugation

Prove `idealClassTheta_conjugation`: For every ideal class A and `n≥1`, conjugation gives `r_A(n)=r_{A⁻¹}(n)`, hence `θ_A=θ_{A⁻¹}`. For the ramified ideal `d₁` in an odd-discriminant factorization, `d₁²=(D₁)`, so its class `D₁` has square1; consequently `θ_{A⁻¹D₁⁻¹}=θ_{AD₁}`.

Imaginary quadratic `K`; the ramified ideal is the one in GZ Lemma2.3.

(GZ86, IV.§2 proof of `Lemma(2.3)`, printed275, PDF52). *Needs:* 5.12.

### 5.14a Ideal-lattice Poisson comparison

Prove `idealLattice_poisson`: For an imaginary quadratic `K`, fractional ideal b, `λ∈C` and `z∈H`, `Σμ∈b exp(2πiN(λ+μ)z)=i/(sqrt(|D|)N(b)z) Σν∈b⁻¹d⁻¹ exp(−2πiN(ν)/z)exp(2πiTr(λν))`. The trace-dual ideal is `b⁻¹d⁻¹`, and the additive measure is matched to its discriminant covolume. This is an adapter of the supplied finite-dimensional Poisson theorem.

`D<0` fundamental; d the different, `N(d)=|D|`; the complex norm and trace conventions fixed.

(GZ86, IV.§2 proof of `Lemma(2.3)`, printed274–275, PDF51–52). *Needs:* 5.12; AutomorphicLFunctionsAndLocalFactors AL.0 (vector-space Poisson summation); AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion).

### 5.15 Ideal-class theta transformation

Prove `idealClassTheta_transform`: For odd negative fundamental `D=D₁D₂`, `δ_i=|D_i|`, `γ=[[a,b],[c,d]]∈SL₂(Z)` with `gcd(c,|D|)=δ₂`, and c* inverse to c modulo `δ₁` chosen0 modulo `δ₂`, `(θ_A|₁γ)(z)=ε_{D₁}(c/δ₂)ε_{D₂}(d)κ(D₁)⁻¹δ₁⁻¹/²χ_{D₁,D₂}(A)θ_{A D₁}((z+c*d)/δ₁)`. Here `κ(D₁)=1` or i by its sign, and `D₁` also denotes the class of the ideal of `normδ₁` only in the last subscript. Use `SL₂`, correcting the printed `PSL₂` because weight1 detects `−I`.

`D` odd squarefree, `D≡1` mod4; `D_i` fundamental with1 allowed; c* convention and exact genus character; no even-discriminant extension asserted.

(GZ86, IV.§2 `Lemma(2.3)`, printed274, PDF51; proof275, PDF52). *Needs:* 5.12, 5.14, 5.14a; QuadraticFormInvariants §6C.

### 5.16 Genuine Eisenstein families

Define `genuineEisenstein` as follows. For a rational parabolic of `Mp(W)`, an actual genuine Levi cuspidal datum and a normalized section in its covered induced representation, define `E(g,s,F)=Σγ∈P(F)\Sp(W)(F)F_s(γg)` in a proved absolute-convergence chamber. The rational/unipotent splittings are canonical; the covered Levi and genuine inducing character are retained. The span of the continued families/residues is an Eisenstein space only after the cover-specific intertwining/constant-term comparison is established.

Specified covered parabolic, genuine Levi representation, actual section and source-qualified convergence chamber; no automatic linear reductive-group continuation theorem.

(GQT, §§5.3,6.1–6.2, PDF25,28; pole statement Proposition6.1 excludes `O(1,1)`). *Needs:* 5.3, 5.4, 3.15, 4.4; AutomorphicSpectralTheory §§1.1–1.3; AutomorphicSpectralTheory §§2.4, 2.6.

- `genuineEisenstein_sum`: In the verified chamber the value is the rational coset sum.
- `genuineEisenstein_central`: The inducing central sign is retained in E.
- `genuineEisenstein_constantTerm`: Its constant term is expressed by the specified normalized cover intertwiners.

**Checks.**

- Zero section gives zero family.
- Nonzero genuine family does not descend.
- A singleton coset sum of value 3 is 3; the actual section supplies its Siegel parameter.

### Examples

The rational theta sum on a zero-dimensional configuration has one term. If a local theta lift vanishes, factorization forces the corresponding factorizable global pairing to vanish. Neither totalized infinite sums nor zero Schwartz input certify analytic convergence.

### Dependencies

Within this roadmap: Layers 2–4. From other roadmaps: AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups §§2.2–2.4, 3.4–3.5, 4.4; AutomorphicFormsOnReductiveGroups §§0.1, 0.4, 3.1–3.2, 4.1–4.2; AutomorphicSpectralTheory §§1.1–1.3, 2.4, 2.6; IntegralLattices Layers 1 and `B`; ModularForms Layer 0; QuadraticFormInvariants §6C.

## Layer 6: Siegel–Weil, Rallis, see-saw and Jacobi interfaces

### 6.1 Theta measure conventions

Prove `theta_measureComparison`: Match self-dual additive, restricted-product and quotient measures; write `I=τ(H)⁻¹∫[H]θ` and `π* dĝ=dg` for the stipulated covering comparison. Orthogonal `τ=1` except `O(1)` and split `O(1,1)`, where `τ=1/2`; unitary `τ=2` for `dim_E V>0`; for the rank-zero trivial group `τ(1)=1`. Supply disconnected component and GL/GO central-quotient normalizations explicitly.

(GQT §2 exact groups and quotient conventions; GL/GO central quotient data where used).

**Checks.**

- For `U(0)=1`, the quotient is a singleton with Tamagawa volume 1.
- For a positive-rank unitary group the stipulated Tamagawa number is 2.
- The disconnected `O(1)` and split `O(1,1)` normalizations remain `1/2`.

(GQT, §2.5, PDF11, cover pushforward measure and orthogonal exceptions; singleton Haar measure for rank zero). *Needs:* 0.14; AdelicAlgebraicGroups §§0.2, 2.3; AdelicAlgebraicGroups §§0.2–0.4; AdelicAlgebraicGroups §2.4 (Tamagawa measure); AdelicAlgebraicGroups §§2.4, 3.4 (Tamagawa number).

### 6.2 Siegel–Weil section

Define `siegelWeilSection` as follows. For the split type-I datum `W_n=Y_n⊕Y_n*`, `dim_E Y_n=n`, send `φ∈S(Y_n*⊗_E V)(A)` to `Φφ(g)=(ω(g)φ)(0)` in the normalized Siegel degenerate principal series `I_n(s₀,χV)`, `s₀=(m−d(n))/2`. Extend by the source’s standard flat section to a meromorphic Eisenstein family `E(g,s,Φφ)`, and write `A_k(φ)` for its Laurent coefficients at `s₀`. The inducing cover and `χV` depend on orthogonal parity and the chosen splitting characters.

Number field GQT datum of 5.7, `dim_E V=m` and Siegel Levi `GL(Y_n)`; normalized induction `δ_P^{1/2}|det|^s`, compatible measures and oscillator convention.

(GQT, §§5.3–5.4, PDF25; global §6.2 PDF28). *Needs:* 2.5, 4.5, 6.1; AutomorphicSpectralTheory §§1.1–1.3; AutomorphicSpectralTheory §§2.4, 2.6.

- `siegelWeilSection_apply`: `Φφ(g)=ω(g)φ(0)`.
- `siegelWeilSection_covariance`: Its Levi covariance has the normalized parameter `s₀`.
- `siegelWeilSection_laurent`: `A_k` is indexed by powers of `s−s₀`.

**Checks.**

- Zero vector gives zero section.
- `Φφ(1)=φ(0)`.
- Binary orthogonal/rank-one case: `s₀=0`.

### 6.3 Ikeda map

Define `ikedaMap` as follows. For `V=H^{r−r′}⊕V′` in the same Witt tower, define `Ik_{r,r′}φ(a)=∫ φ(x,a,0)dx` in the corresponding polarized configuration coordinates. The self-dual measures and splitting-character twists are fixed. The map preserves Schwartz functions, is equivariant for the smaller dual pair, and composes as `Ik_{r′,r″}∘Ik_{r,r′}=Ik_{r,r″}`.

`0≤r″≤r′≤r`; fixed isotropic splitting and source measures.

(GQT, §2.7 `equation(2.1)`, PDF12; equivariance PDF13). *Needs:* 4.5, 6.2; AutomorphicLFunctionsAndLocalFactors AL.0 (local Fourier inversion); ArithmeticGaloisRepresentations §2.7, *Global inputs* (adelic Schwartz–Bruhat space), with AutomorphicLFunctionsAndLocalFactors AL.0 (vector-space and partial Fourier transforms).

- `ikedaMap_apply`: The map integrates `φ(x,a,0)` in x.
- `ikedaMap_comp`: Fubini identifies successive integrals with the product-measure integral under SFinite and joint Integrable hypotheses for the displayed function.
- `ikedaMap_equivariant`: The smaller dual-pair action intertwines with its prescribed character.

**Checks.**

- Removing no hyperbolic planes gives id.
- `φ=φ₁(x)φ₂(a)φ₃(y)` maps to `(∫φ₁)φ₂(a)φ₃(0)`.
- Scaling dx scales the Ikeda map.

### 6.4 Anisotropic Siegel–Weil formula

Prove `siegelWeil_anisotropic`: For `m>0` and anisotropic `H(V)`, `E(g,s₀,Φφ)=c_{m,n} τ(H)/[E:F]·I_{n,0}(φ)`, with the source’s definition of I and its measure comparison, `c=1` for `s₀>0` and `c=2` for `s₀≤0`. Retain the split exceptional-group normalization wherever it enters a boundary comparison; do not transfer this anisotropic formula to a split divergent norm form.

For `m=0`, construct the comparison directly on the trivial configuration space: Schwartz functions are a line, the theta integral is `I(g,φ)=ω(g)φ(0)` with `τ(H)=1`, and the associated scalar standard section and its Eisenstein continuation are those of 6.2. Determine its value at `s₀` from this actual scalar Eisenstein family, rather than substituting in the positive-m constant formula. At `m=n=0`, both the Eisenstein sum and the normalized theta integral equal `φ(0)`.

(GQT Theorem7.1 hypotheses with `m>0,r=0`; section and normalized quotient measure fixed; 6.2's scalar section for `m=0`).

**Checks.**

- Over `ℚ`, for `V=W=0,φ=1`, both sums/integrals equal 1, although `s₀=−1/2` in the orthogonal convention.
- For `m=0`, the normalized theta integral is the actual oscillator-line value with singleton quotient measure 1.
- For positive anisotropic m at `s₀=0`, the GQT constant remains 2; the zero-rank boundary does not change it.

(GQT, Theorem7.1, PDF33–34). *Needs:* 6.2, 5.7, 6.1.

### 6.5 Regularized first-term identity

Prove `siegelWeil_firstTerm`: For `r>0` and `0<m≤d(n)`, the GQT normalized Laurent coefficients satisfy `A₀(φ)=2B₋₁(φ)`, both in the strict first-term range `0<m<d(n)` (Theorem7.4) and at the boundary `m=d(n)` (Theorem7.3(ii)). In the split `O(1,1)` exception in either range, `A₀=B₋₁=0` and `A₁=B₀`. All coefficients are evaluated at their respective `s₀` and `ρ_H`. The `r=0` anisotropic identity is the separate Theorem7.1 node.

(GQT number-field type-I datum, `r>0` and `0<m≤d(n)`; retain the exceptional split `O(1,1)` group and the source `κ` and `τ`).

(GQT, Theorems7.3(ii) and7.4, §7.2, PDF34–35). *Needs:* 5.8, 6.2, 6.1.

### 6.6 Regularized second-term identity

Prove `siegelWeil_secondTerm`: In `d(n)<m≤d(n)+r` with `r≤n`, let `m+m′=2d(n)`, V′ the complementary Witt-tower space of index r′. Then `A₋₁(φ)=B₋₂(φ)`, and `A₀(φ)=B₋₁(φ)−κ_{r,r′}B₀(Ik_{r,r′}(π_KHφ))` modulo `Im A₋₁`. The correction is zero for `r′=0` or `H(V′)=O(1,1)`, with the source’s stipulated interpretation. Equality of `A₀` and `B₋₁` is only a quotient identity unless the residual image vanishes.

(GQT Theorems1.2/8.1 exact range, compact averaging `π_KH` and coefficient/measure normalizations).

(GQT, Theorem1.2, PDF5–6, quotient-valued second-term identity; including its quotient-valued correction term). *Needs:* 5.8, 6.2, 6.3, 6.1; AutomorphicSpectralTheory §§2.4, 2.6.

### 6.7 Coherent and incoherent sections

Define `thetaSectionCollection` as follows. A local quadratic/Hermitian collection with fixed dimension/discriminant and good-place lattices gives tensor evaluation sections. Coherence means localization of a global space, with every real signature and invariant-product constraint matched. Incoherent sections lie in the same induced representation without a global rational theta sum. Export their normalization and functional equation to GZ.6.

Number-field local collection, common inducing character, matching archimedean data. For quadratic spaces, admissible invariant systems, global existence and classification come from GlobalQuadraticForms Layers3,7,8; QuadraticFormInvariants §6C supplies only local Hilbert/Hasse invariants and its cohomological comparison. The global Hermitian analogue requires a separate source-qualified extension, not an assumed consequence of local theta nonvanishing.

(AGHMP18, Published §6.1 `equations(6.1.1)–(6.1.2)`, printed466–467, PDF76–77). *Needs:* 6.2, 4.3; QuadraticFormInvariants §6C; AutomorphicSpectralTheory §§2.4, 2.6; GlobalQuadraticForms Layer 3; GlobalQuadraticForms Layer 7; GlobalQuadraticForms Layer 8.

- `thetaSectionCollection_tensor`: Almost-everywhere standard local sections give the restricted tensor section.
- `thetaSectionCollection_global`: For a coherent datum the section equals that of the global Schwartz vector.
- `thetaSectionCollection_incoherent`: When global localizations satisfy the explicit invariant product constraint, a finite-support sign system with product `−1` cannot be such a localization. This is a necessary obstruction, not the global classification theorem.

**Checks.**

- Finite-support invariant system all equal to 1 has product 1; actual localization requires the global supplier.
- One incompatible Hasse invariant fails the product constraint.
- Good-place spherical section has value 1 at identity.

### 6.8 Unitary Siegel–Weil measure

Prove `unitary_siegelWeilMeasure`: For DL’s rank `n=2r` unitary local datum and a nonsingular moment matrix `T`, use the unique rationally normalized `H(F_v)-Haar` measure stipulated in §4.1(H9): `I_T(φ)=b_{2r,v}(1)·W_T(SW(φ))`, with the source Whittaker character and local standard section. At an unramified hyperspecial place the designated compact subgroup has volume1. This equality specifies a normalization; it is not an arbitrary Haar choice.

(DL §4.1(H1.)–(H9.); the local Fourier character and the source’s `b_{2r,v}` factor; nonsingular `T` in the indicated orbit).

(DL24, §4.1(H9), PDF41–42). *Needs:* 6.2, 6.1, 3.3b; AdelicAlgebraicGroups §§0.2, 1.5.

### 6.9 Unitary theta coherence parity

Prove `unitaryTheta_coherenceParity`: For DL’s tempered relevant `π` with rank `n=2r`, prescribed infinity signature `(n−1,1)` at one place and (n,0) elsewhere, the locally distinguished finite Hermitian spaces `V_{π_v}` form a coherent global collection exactly when `∏_{v finite}η_v((−1)^r det V_{π_v})=−(−1)^{r[F:Q]}`. Retain the ordinary norm-character conventions at every v. This global form-existence test is distinct from the local theta dichotomy.

(DL Assumption3.2 and §4.1, `F` totally real, E/F CM; relevant tempered local representations and the stated archimedean signatures).

(DL24, Definition4.2 and Remark4.3, PDF41–42). *Needs:* 3.43, 6.7; QuadraticFormInvariants §6C.

### 6.10 Doubling Schwartz map

Define `doublingSchwartz` as follows. Let `dim_E U_n=n` and choose a polarization `U_n⊗_E V=X⊕X*` of the underlying symplectic F-space. Form `W_n=U_n⊕U_n⁻=Y_n⊕Y_n*`, with diagonal and anti-diagonal isotropic summands of E-dimension n. Identify the doubled oscillator with the tensor of the ψ and ψ⁻¹ models, and define `δ:S(X)⊗conjugate(S(X))→S(Y_n*⊗_E V)` by the partial Fourier/polarization transform. Coordinate choices identify the target with `S(V^n)`. Normalize `δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩`. Under `G(U_n)×G(U_n)` retain the explicit `χV` determinant twist on the second factor.

Here and in 6.10a–6.14 n means `dim_E U_n`, while `dim_E W_n=2n` and `dim_E Y_n=n`. Thus the doubled section has `s_{m,n}=(m−n−ε₀)/2`, and its factor is `L(s+1/2,π⊗χV)`, evaluated at `s=(m−n−ε₀)/2`. The ranges `d(n)<m≤2d(n)` and `r≤n` use this undoubled dimension n. Compatible self-dual measures, doubled polarization and GQT §11.3 splitting convention are fixed.

(GQT, §11.3, unnumbered doubled-space and `δ` displays, PDF52). *Needs:* 4.5, 2.7, 6.2; AutomorphicLFunctionsAndLocalFactors AL.0 (partial Fourier transform).

- `doublingSchwartz_eval_zero`: `δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩`.
- `doublingSchwartz_equivariant`: `δ` intertwines the doubled action with the stipulated `χV` determinant twist.
- `doublingSchwartz_pureTensor`: `δ` is the source partial Fourier transform of a pure tensor.

**Checks.**

- A zero factor maps to zero.
- Equal `φ` give value `‖φ‖²_L²` at 0.
- Omitting conjugation changes the Hermitian pairing into a bilinear one.
- For symplectic `dim U_n=n=2`, an input model is `S(V)` and the doubled target is `S(V²)`; it is not `S(V²)⊗conjugate(S(V²))` on the input side.

### 6.10a Standard doubling factors and global product

Construct `standardDoublingFactors` for the GQT datum of §§2.1–2.2: orthogonal, symplectic and unitary groups, and the genuine metaplectic group when the orthogonal dimension is odd. Over characteristic-zero local fields let π_v be irreducible admissible, smooth at finite places and Casselman–Wallach at infinity, and genuine in the Mp case. Fix nontrivial unitary ψ, the compatible unitary splitting characters, the normalized doubled induction and the local Haar and matrix-coefficient pairings of 6.10. Construct the local doubling integrals in their convergence chamber and their meromorphic continuations. Define the standard local factors through the normalized doubling functional equation, using Lapid–Rallis for the linear groups and Gan12 for Mp; in the metaplectic case retain the dependence on ψ. Prove that over a nonarchimedean field the ideal generated by integrals over good sections has normalized generator `L_v(s+1/2,π_v⊗χV,v)`, with numerator 1 as a rational function of `q_v^(−s)`. Include Yamana's comparison of good and holomorphic sections on `Re s≥0`. At archimedean places construct the corresponding factors and prove the entire normalized-quotient and nonzero-test assertions used by GQT §11.6.

Compute the unramified denominator `d_v(s,χV,v)` as the explicit product of Hecke factors of Lapid–Rallis p.334 Remark3, so a standard spherical section gives `Z_v=L_v/d_v`. For a number-field cuspidal π construct the partial Euler product, the ramified and infinity factors and the completed standard L-function; prove convergence in a right half-plane and meromorphic continuation from the global doubling integral and its functional equation. With the same unscaled spherical sections prove the convergence of `∏_v Z_v*` on `Re s>0` used in 6.12–6.13, with GQT's good-section and factorizability hypotheses. AL.1–AL.2 supply the Hecke and `GLₙ` factors in the denominators and Levi/rank-one comparisons; the classical and metaplectic standard factors are constructed here.

(GQT, §11.6 PDF54, local GCD, normalized quotients and (11.3); LapidRallis05, Theorem4 and p.334 Remark3; Yamana14, local good-section GCD theorem cited in GQT §11.6; Gan12, §§5–6, pp.76–80, metaplectic factors and unramified comparison.) *Needs:* 5.16, 6.2, 6.10; AutomorphicLFunctionsAndLocalFactors AL.1–AL.2 (Hecke and `GLₙ` comparisons); SmoothRepresentationsOfLocalGroups §SR.2.2; AutomorphicSpectralTheory §§2.1–2.6.

**Checks.**

- With normalized spherical vectors and the unscaled good section, `Z_v*=1/d_v`; it need not be 1.
- Multiplying that section by `d_v` gives normalized value 1 where the factor is finite, recording the change of section rather than changing the definition of `Z_v*`.
- Replacing ψ by `ψ_a` in the Mp case transports the factor with the associated quadratic character; ψ-independence for the linear groups does not extend to Mp.

### 6.11 Local doubling zeta integral

Define `localDoublingZeta` as follows. For local `π` and a section `Φ_s` of the doubled normalized induced representation, define `Z_v(s,Φ_s,f₁,f₂)=∫G(F_v)Φ_s((g,1))⟨π(g)f₁,f₂⟩dg` in its absolute-convergence chamber. Its meromorphic continuation is the local doubling functional. Define `Z_v*=Z_v/L_v(s+1/2,π⊗χV)` using the GQT normalization; for the standard good-place section `Z_v=L_v/d_v`, hence `Z_v*=d_v⁻¹`. Do not silently multiply the local section by `d_v`.

Generic good section in the source’s normalized induction, compatible Haar and matrix-coefficient pairing; L/d convention fixed.

(GQT, §11.6, local integral and normalized unramified displays, PDF54; global factorization (11.3), PDF53). *Needs:* 6.10, 6.10a, 6.2, 6.1; SmoothRepresentationsOfLocalGroups §SR.2.2.

- `localDoublingZeta_integral`: In absolute convergence `Z` is the displayed group integral.
- `localDoublingZeta_unramified`: The designated spherical data give `L_v/d_v`.
- `localDoublingZeta_normalized`: `Z_v*=Z_v/L_v(s+1/2,π⊗χV)`.

**Checks.**

- Zero vector or section gives zero.
- Unit, trivial representation, Dirac measure, section and vectors 1 give integral 1.
- Changing Haar without renormalizing rescales `Z_v`.

### 6.12 Factorization of theta pairings

Prove `thetaPairing_factorization`: In a proved convergence chamber, unfold a pure-tensor doubled theta pairing into normalized local integrals times the specified global/partial L-factor and good-place denominators. Apply the restricted-product Fubini theorem of AdelicAlgebraicGroups §0.3 with its countability, second-countability, open compact and cofinite-indicator hypotheses; compute ramified and real factors separately. The rational theta sum itself need not factor.

Pure-tensor input; all integrability/unfolding hypotheses proved; compatible local measures and good-place reference vectors.

(GQT, Proposition11.1 and §11.3, PDF52–54). *Needs:* 5.6, 6.10, 6.11; AdelicAlgebraicGroups §0.3; ArithmeticGaloisRepresentations §2.7, *Global inputs* (pure tensors in the scalar adelic Schwartz–Bruhat space), with AutomorphicLFunctionsAndLocalFactors AL.0 (vector-space partial Fourier transforms).

### 6.13 Rallis inner product formula

Prove `rallis_innerProduct`: In `d(n)<m≤2d(n)`, `r≤n`, for cuspidal `π` with vanishing lower theta lifts, prove the inner product equals `[E:F]·Valₛ₌ₛₘ,ₙL(s+1/2,π⊗χV)·Z*(s,Φ,f₁,f₂)`, with the normalized doubled section and measures. When all relevant local lifts are nonzero the L-factor is holomorphic there. Lower-lift vanishing removes residual terms and ensures cuspidality.

(GQT Theorem11.4 hypotheses; first-occurrence theta lift; `s_{m,n}=(m−d(n))/2>0`; good sections and local/global normalization).

(GQT, Theorem11.4, PDF54). *Needs:* 6.6, 6.10, 6.10a, 6.11, 6.12, 5.6.

### 6.14 Global theta nonvanishing criterion

Prove `globalTheta_nonvanishing`: In the first-occurrence range, prove global nonvanishing equivalent to nonvanishing of the normalized local functionals and special L-value. Replace the local-functionals condition by local-theta nonvanishing only if `ε₀=−1`, all unitary archimedean places split, orthogonal `F` is totally complex, or `m=d(n)+1`. Otherwise retain the source’s possible modification of real signatures.

(GQT Theorem11.7 and Proposition11.6; the exact local-functional hypotheses and first-occurrence cuspidality).

(GQT, §§11.8–11.9, Proposition11.6 and Theorem11.7, PDF55–57). *Needs:* 6.13, 6.11, 3.10.

### 6.15 Global see-saw and spectral projection

Prove `globalTheta_seeSaw`: For a compatible global see-saw, equate the iterated theta pairings under absolute integrability. A regularized version requires its independently proved identity and Laurent convention. Projection onto a specified closed discrete cuspidal eigenspace commutes with the lift under its Hilbert-domain and integrability hypotheses.

Compatible see-saw characters; cusp/decay or compact-source estimates sufficient for Fubini; actual closed Hilbert subspace for projection.

(IP23, §§7–9, PDF41–42,50–53). *Needs:* 3.8, 5.6, 6.12, 5.8; AutomorphicSpectralTheory §§0.6–0.7; AutomorphicFormsOnReductiveGroups §4.2.

### 6.16 Norm-form theta integrals

Prove `normTheta_integralRange`: Export to GrossZagierAndArithmeticHeights the rank-one theta kernel for the binary quadratic norm of E/F and the ternary trace-zero quaternion norm. For anisotropic binary `(m=2,r=0,n=1)` and division ternary `(m=3,r=0)`, the ordinary integral converges. Split binary `(m=2,r=1)` lies at the exceptional boundary `A₁=B₀`. Split ternary `(m=3,r=1)` lies in the second-term range and uses `A₋₁=B₋₂` and `A₀=B₋₁` modulo `Im A₋₁`, with the anisotropic complementary correction zero. Export explicit Haar/splitting factors, not the Waldspurger identity itself.

Orthogonal `ε₀=1,d(1)=2`; nondegenerate norm/trace-zero forms; exact GQT convention and source’s quaternion split/division cases.

(GQT, §3.1, PDF14; anisotropic Theorem7.1 PDF33; exceptional boundary Theorem7.3(ii) PDF34; second-term Theorem1.2 PDF5–6 and Theorem8.1 PDF35). *Needs:* 5.7, 6.4, 6.5, 6.6, 6.1; QuadraticFormInvariants §6C.

### 6.17 Jacobi group

Define `jacobiGroup` as follows. Construct `J(W)=H(W)⋊Mp(W)` using the native center-fixing action induced by `Mp(W)→Sp(W)`. The central `H(F)` embeds as the additive center, while the metaplectic sign is the second factor. The Schrödinger–Weil representation is `(h,g)↦ρψ(h)ωψ(g)`, with multiplication `(h,g)(h′,g′)=(h(g·h′),gg′)`. A positive similitude transports the Heisenberg central character/index; it is not an action preserving a fixed `ψ` without that transport.

Characteristic-zero local/adelic symplectic datum; chosen genuine oscillator model and its covariance.

(BFH90, §1 `equations(1.1)–(1.5)`, printed547, PDF6). *Needs:* 0.13, 2.4c, 1.3, 0.8.

- `jacobiGroup_mul`: Multiplication uses `h(g·h′),gg′`.
- `schroedingerWeil_apply`: The action is `ρψ(h)ωψ(g)`.
- `jacobiGroup_similitude`: A similitude transports the central character by its multiplier.

**Checks.**

- `W=0`: `H=F`, cover `μ₂`, and the center action is trivial; the generic semidirect-product test assumes `act=1`.
- Restriction to `H` is the native Schrödinger action.
- A direct product incorrectly forces Heisenberg and symplectic operators to commute.

The covariance hypothesis is `ω(g)ρ(h)=ρ(g·h)ω(g)`. With it, `schroedingerWeil` is a representation of the semidirect group.

**Additional check.** For the trivial action on `C₂×C₂`, let `A=diag(1,−1)` and `B=[[0,1],[1,0]]`. Each squares to 1, but `(AB)₀₁=1` and `(BA)₀₁=−1`. Two independent representations do not define the asserted product representation.

### 6.18 Jacobi spaces

Define `jacobiSpace` as follows. For a Jacobi arithmetic lattice, integral central index m and finite-dimensional weight/multiplier, define smooth automorphic sections of central character `ψ_m`, holomorphic in the complex Heisenberg variable, with the specified symplectic and elliptic covariance. Impose the appropriate Fourier growth and cusp holomorphy for the holomorphic/cuspidal subspaces. Layer 8 supplies the BFH coordinate specialization.

A fixed Jacobi lattice and compatible central index; exact weight and multiplier, not inferred from the lattice equations alone.

(BFH90, §1 `equations(1.6)–(1.9)`, printed547, PDF6). *Needs:* 6.17, 5.3; AutomorphicFormsOnReductiveGroups §3.1.

- `jacobiSpace_central`: The additive center acts by `ψ_m`.
- `jacobiSpace_elliptic`: The coordinate elliptic law has the prescribed quadratic phase.
- `jacobiSpace_weight`: The symplectic covariance agrees with the specified weight/multiplier.

**Checks.**

- Zero belongs to each Jacobi space.
- A nonzero section with different central character is excluded.
- BFH translation periods are `Z²` and `N⁻¹Z²`.

### 6.19 Fourier–Jacobi extraction

Define `fourierJacobi` as follows. Extract a Fourier–Jacobi coefficient of a smooth automorphic form by integration over the compact rational center of the relevant Heisenberg unipotent against `ψ_m⁻¹`. Its remaining transformation is the Jacobi action of index m, with the inherited weight/multiplier. The coefficient of a normally convergent Fourier family is recovered termwise; further Fourier extraction in the elliptic variable uses its designated compact torus and probability/Lebesgue normalization.

Compact central quotient; actual unipotent splitting; smoothness and normal convergence for termwise extraction.

(BFH90, §2 `equations(2.2)–(2.3)`, printed551–552, PDF10–11). *Needs:* 5.5, 6.17, 6.18; AutomorphicFormsOnReductiveGroups §4.1.

- `fourierJacobi_index`: The coefficient has `ψ_m` central character.
- `fourierJacobi_equivariant`: It transforms under the common Jacobi action.
- `fourierJacobi_coefficient`: A character term of matching index is recovered by compact orthogonality.

**Checks.**

- Zero input gives zero coefficient.
- Integrating `ψ_mψ_m⁻¹` over the probability center gives 1.
- Distinct central characters give coefficient 0.

### 6.20 Jacobi theta decomposition interface

Prove `jacobi_thetaDecomposition`: For positive index and a normally convergent Jacobi section, prove elliptic invariance gives finitely many discriminant residues and unique theta components transforming through the finite Weil module. Use compact-torus orthogonality and supplied Poisson summation. Layer 8 specializes this interface to BFH, including its positive-on-iY root; the general proof does not depend on that specialization.

Positive index; compatible integral lattice; normal Fourier convergence and all weight/multiplier data fixed. The generic lattice/discriminant carrier is imported from IntegralLattices.

(BFH90, §2 Proposition2.2, `equations(2.4)–(2.10)`, printed552–553, PDF11–12). *Needs:* 6.19, 6.18, 4.7; AutomorphicLFunctionsAndLocalFactors AL.0 (vector-space Poisson summation); IntegralLattices Layer 1.

### 6.22 Toric theta pairing interface

Prove `toricTheta_pairingComparison`: For an anisotropic norm torus `T`, unfold its compatible quadratic/quaternionic theta pairing into local oscillator/orbital integrals after proving product integrability on [T] and on the corresponding quaternionic quotient. Match character, rational splitting and Haar data, and export the factors and see-saw to GrossZagierAndArithmeticHeights, which owns the Waldspurger identity and arithmetic comparison.

Actual anisotropic torus and unitary character trivial on `T(F)`; cusp or compactness/decay bound; ramified test functions and source parity fixed. For a quadratic field K/F its binary norm remains anisotropic even if the containing quaternion algebra is split. A split-quaternion Shimizu/Petersson comparison requires the separate source-qualified factorization with the exact toric normalization; a GQT residual-image identity alone is insufficient.

(GZ86, I.§5(5.2), printed229, PDF6; IV.§2 printed273–275, PDF50–52; YZZ11, 6 November 2011 draft, §2.2.1 Proposition2.2.1 and proof pp.48–50; §§2.3–2.4 pp.51–55). *Needs:* 6.16, 6.15, 6.1, 6.12; AdelicAlgebraicGroups §§2.3, 3.4.

*Proof input.* The nonsplit toric Shimizu contraction, the toric unfolding and their normalization are Yuan–Zhang–Zhang's (2011 author draft, §2.2.1 Proposition 2.2.1 and §§2.3–2.4, pp.48–55), where the split quaternion case is reduced to Waldspurger's argument instead of the Siegel–Weil formula. GZ86's theta and Rankin identities give only the ideal-theta part, so the quaternionic toric pairing itself is constructed in this target.

### Examples

The GQT second-term equality holds modulo the image of `A₋₁`; at `r′=0` its correction is zero under the source interpretation. One incompatible local invariant has product `−1` and cannot be a global localization. For `W=0` the Heisenberg oscillator is a line and its central coefficient character still acts by `ψ`.

### Dependencies

Within this roadmap: Layers 0–5. From other roadmaps: AdelicAlgebraicGroups §§0.2–0.4, 1.5, 2.3–2.4, 3.4; AutomorphicLFunctionsAndLocalFactors AL.0–AL.2; AutomorphicSpectralTheory §§0.6–0.7, 1.1–1.3, 2.4, 2.6; AutomorphicFormsOnReductiveGroups §§3.1, 4.1–4.2; SmoothRepresentationsOfLocalGroups §SR.2.2; QuadraticFormInvariants §6C; GlobalQuadraticForms Layers 3, 7 and 8; IntegralLattices Layer 1.

## Layer 7: Half-integral weight, plus spaces and Shimura lifting

Standing hypotheses for this layer: functions live on the upper half-plane and transform under `Γ₀(4)` by the unitary theta multiplier J of 7.1; the normalizations are those of DIT16 and DIT11, with every numerical range stated in a target; spectral residue formulas take `r>0` and an orthonormal Petersson basis; and boundary conditions are imposed at all three cusps ∞, 0 and 1/2 of `Γ₀(4)`.

### 7.1 Theta multiplier

Define `thetaMultiplier` as follows. GeometryOfNumbersAndQuadraticArithmetic §4.3 supplies the holomorphic theta multiplier `j(γ,z)=θ₀(γz)/θ₀(z)` on `Γ₀(4)`, `θ₀(z)=Σ_ne(n²z)`, the nonvanishing of `θ₀` and its identification with the square-root and Kronecker-symbol multiplier. Here use the unitary normalization `θ=y^(1/4)θ₀` and put `J(γ,z)=θ(γz)/θ(z)=j(γ,z)|cz+d|^(−1/2)` for `γ=[[a,b],[c,d]]`. Prove `|J|=1` and the cocycle law.

(DIT16, §5, (5.14) and the next display, p964). *Needs:* 5.5; GeometryOfNumbersAndQuadraticArithmetic §4.3 (theta multiplier, nonvanishing of `θ`).

- `thetaMultiplier_thetaRatio`: Form J from the nonvanishing theta seed.
- `thetaMultiplier_cocycle`: `J(γδ, z)=J(γ,δz)J(δ, z)`.
- `thetaMultiplier_unitary`: `|J(γ, z)|=1`, with the precise branch giving the `Γ₀(4)theta` multiplier.

**Checks.**

- `J(1,z)=1`.
- A constant phase change of the theta seed leaves J unchanged.
- Independent local square-root choices can break the cocycle law.

### 7.2 Weight-one-half Maass space

Define `halfWeightMaass` as follows. For `Δ₁/₂=−y²(∂ₓ²+∂ᵧ²)+(i/2)y∂ₓ`, prove covariance under J. Define `V_r` as the smooth weight-one-half eigenfunctions with eigenvalue `1/4+(r/2)²`, square-integrable on `Γ₀(4)\H` and with zero constant term at all three cusps. Their Fourier expansion is the Whittaker expansion in 7.3.

(DIT16, §8, printed975, PDF27). *Needs:* 7.1, 5.5; AutomorphicSpectralTheory §1.16 (weight-k Laplacian).

- `halfWeightMaass_automorphy`: `F(γz)=J(γ, z)F(z)`.
- `halfWeightMaass_allCusps`: Cuspidality means zero constant term at each of ∞,0,1/2, in normalized cusp coordinates.
- `halfWeightMaass_eigenParameter`: Weight-one-half eigenvalue is `1/4+(r/2)²` when its Shimura lift has `1/4+r²`.

**Checks.**

- Vanishing only at infinity does not establish cuspidality without the plus-space cusp comparison.
- Ordinary `Γ` invariance does not establish genuineness.
- Using r rather than r/2 in `W` gives the wrong eigenvalue.

Multiplier covariance and an eigenvalue equation (`halfWeightEigenfunctions`) do not define the space: the operator is `Δ₁/₂`, and smoothness, `L²` membership and the conditions at all three cusps are part of `halfWeightMaass`.

### 7.3 Whittaker Fourier expansion

Prove `halfWeight_fourierExpansion`: A cuspidal weight-one-half eigenform has `F(z)=Σ_{n≠0}b(n)W_{sgn(n)/4,ir/2}(4π|n|y)e(nx)`, with convergence and coefficient recovery. The spectral parameter is r/2 here, versus r in weight zero.

(DIT16, Theorem 4, p965 (display before (5.16)); (8.8), p976; (10.1), p981). *Needs:* 7.2, 5.5; AutomorphicSpectralTheory §§0.26, 0.28 (Whittaker functions).

### 7.4 Completed half-weight Eisenstein family

Define `halfWeightEisenstein` as follows. Construct `E*_{1/2}(z,s)` with constant term `Λ(2s)2^s y^(s/2+1/4)+Λ(2−2s)2^(1−s)y^(3/4−s/2)` and Whittaker parameter `s/2−1/4`. Prove automorphy and meromorphic continuation; its parameter differs from that in `F_{1/2,n}(z,w)`.

(DIT16, §5, unnumbered display after (5.14) and the Shimura relation, p964, quoting [16, Prop. 2 p. 959] (coefficient evaluation from [16, Lemma 4, (2.23)–(2.25), pp. 961–962]); PDF p.16). *Needs:* 7.1, 7.3, 5.5; AutomorphicSpectralTheory §§1.1–1.3.

- `halfWeightEisenstein_initialSeries`: Construct the Eisenstein family on `Γ₀(4)` with the theta multiplier and its prescribed cusp data.
- `halfWeightEisenstein_constantTerms`: Expose both powers `y^(s/2+1/4)` and `y^(3/4−s/2)`, with `2^s` and `2^(1−s)`.
- `halfWeightEisenstein_fourierTransport`: Its `W` parameter `s/2−1/4` equals `w−1/2` under `w=s/2+1/4`.

**Checks.**

- At `s=3/2` the constant term is `2^(3/2)Λ(3)y+2^(−1/2)Λ(−1)`.
- The actual family has residue `θ/2` at `s=1`, with the unitary theta function of 7.1.
- Its coefficients at `n=2` and `n=3` vanish, as required by the `0,1 mod 4` Fourier support.

### 7.5 Fundamental-discriminant Eisenstein coefficient

Define `fundamentalEisensteinCoefficient` as follows. For fundamental d, `b(d,s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d)`, where `Λ(s,χ_d)=π^(−s/2)Γ((s+α)/2)|d|^(s/2)L(s,χ_d)`, `α=(1−sgn d)/2`. Compare with Mathlib’s gamma normalization, including its `π^(−α/2)` difference.

(DIT16, §5, (5.13) `(Λ(s,χ_d))` and the unnumbered definition of `b(d,s)`, p964). *Needs:* 5.5; AutomorphicLFunctionsAndLocalFactors AL.1 (archimedean factors, completed Hecke L-functions).

- `fundamentalEisensteinCoefficient_fundamentalValue`: `b(d, s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d)`.
- `fundamentalEisensteinCoefficient_parityFactor`: The paper completion is `|d|^(s/2)π^(α/2)` times Mathlib completed L.
- `fundamentalEisensteinCoefficient_product`: The product of two such coefficients has factor `(4π)^(−1/2)|D|^(−3/4)`.

**Checks.**

- `d=1` gives completed zeta.
- `d=−3` uses `3^(-3/4)`.
- At `d=d′=1`, `2√π` times the coefficient product is `Λ(1,s)²`.

### 7.6 Half-weight Eisenstein coefficient expansion

Prove `halfWeightEisenstein_coefficients`: The nonconstant coefficients of `E*_{1/2}` are `b(n,s)`, supported on `n≡0,1` mod4. For fundamental d and `m>0`, `mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s)`.

(DIT16, §5, the two unnumbered displays after (5.14) (Shimura relation for `b(dm²,s)` and `E*_{1/2}`), p964). *Needs:* 7.4, 7.5, 5.5.

### 7.7 Eisenstein product normalization

Prove `halfWeightEisenstein_product`: For coprime fundamental d,d′ and `D=d′d`, `Λ(s,χ_{d′})Λ(s,χ_d)=2√π|D|^(3/4)b(d′,s)b(d,s)`. This is a bilinear product without complex conjugation, unlike Theorem4.

(DIT16, §5 (5.15), p964). *Needs:* 7.5, 5.5.

### 7.8 Theta residue and Petersson normalization

Prove `halfWeightEisenstein_thetaResidue`: `Resₛ₌₁ E*₁/₂=θ/2`. For the unnormalized hyperbolic Petersson product, `||θ||²=2π=area(Γ₀(4)\H)`, so `||θ/2||²=π/2`. The number 6 instead equals `(3/π)||θ||²`, the norm after normalization by `area(PSL₂(Z)\H)=π/3`. Rescaling a vector from norm squared 1 to 6 changes the coefficient 12 in the bilinear formula to 2; this normalization remark supplies no proof of that formula.

(DIT16, Remarks after Theorem4, p965). *Needs:* 7.4, 5.5; AdelicAlgebraicGroups §4.5; GeometryOfNumbersAndQuadraticArithmetic §4.3 (theta multiplier, nonvanishing of `θ`).

### 7.9 Kohnen plus subspace

Define `kohnenPlus` as follows. `V_r^+` is the subspace of the weight-one-half cuspidal eigenspace `V_r` whose Fourier coefficients vanish outside `n≡0,1` mod4. It is a linear subspace defined by coefficient kernels, not by a chosen basis.

(DIT16, §8, p976). *Needs:* 7.2, 7.3, 5.5.

- `kohnenPlus_coefficientKernels`: Intersect kernels of `b(n)` for `n≡2,3 mod 4`.
- `kohnenPlus_membership`: Membership means exactly the forbidden coefficients vanish, together with the ambient cusp/eigen conditions.
- `kohnenPlus_linearStructure`: The common kernel of forbidden coefficient maps is closed under addition and complex scalar multiplication. Actual Hecke preservation requires the source ambient space.

**Checks.**

- The zero cusp eigenform in the actual ambient `V_r` belongs to `kohnenPlus`.
- For an actual `f∈V_r`, `b_f(−1)≠0` excludes membership because `−1≡3 mod4`.
- For an actual `f∈V_r`, vanishing of every `b_f(n)` at `n≡2,3 mod4` gives membership; the all-cusp condition is inherited from `V_r`. The completed Eisenstein family of 7.4 cannot enter this test as a cusp eigenform merely from its Fourier support.

### 7.10 Plus projection operators

Define `plusOperators` as follows. On the unitary-weight space set `UF(z)=(√2/4)Σ_{ν=0}^3F((z+ν)/4)`, `WF(z)=exp(iπ/4)(z/|z|)^(−1/2)F(−1/(4z))`, and `pr⁺=(2/3)WU+1/3`. Record operator composition order and the factor `√2` caused by `y^(1/4)`.

(DIT16, §8, printed976, PDF28, U,W and footnote6). *Needs:* 7.1, 7.2, 7.9, 5.5.

- `plusU`: `UF(z) = (√2/4) Σ_{ν mod 4} F (shiftFour ν z)`, with `shiftFour ν z = (z+ν)/4`, in the unitary normalization.
- `plusW`: `WF(z) = exp(iπ/4)(z/|z|)^(−1/2) F (invertFour z)`, with `invertFour z = −1/(4z)` and the principal power.
- `plusProjector`: `pr⁺=(2/3)WU+(1/3)id` on functions on the upper half-plane; that it is the orthogonal projection onto the plus space is 7.11.

**Checks.**

- Omitting `√2` changes `U` conjugated by `y^(1/4)`.
- On 1, `pr⁺` gives `(2/3)phaseW(z)√2+1/3`, which at i differs from 1.
- Compare WU and UW outside the plus space; they are not assumed equal.

### 7.11 Plus projection and old normalization bridge

Prove `kohnenPlus_projection`: Prove `pr⁺` is the orthogonal projection onto `V_r⁺` and extends to the relevant Poincaré families. The DIT11 family satisfies `P_d⁺=(3/2)pr⁺P_d`, as corrected by DIT16 footnote 7. Thus `pr⁺F₁/₂,d` has principal-term factor 2/3.

(DIT16, §8 `equation(8.10)` and footnote7, printed977, PDF29; projection definition printed976 PDF28). *Needs:* 7.10, 5.5.

*Proof input.* DIT16 footnote 7 fixes only the factor between the DIT11 projector and `pr⁺`. That `pr⁺` is the orthogonal projection onto `V_r⁺` on the full three-cusp domain is part of this target, proved from the formulas for `U` and `W` in 7.10 on the multiplier space of 7.2.

### 7.12 Half-weight Kloosterman sum

Define `halfWeightKloosterman` as follows. For `c>0` divisible by4, `K_{1/2}(m,n;c)=Σ_{a mod c,(a,c)=1}(c/a)ε_a e((m a+n ā)/c)`, where `aā≡1` modc and `ε_a=1` or i according as `a≡1` or3 mod4. This is GeometryOfNumbersAndQuadraticArithmetic §4.3's `halfIntegralKloosterman ℓ m n c` for odd ℓ. There the sum is `Σ_dε_d^(−(2ℓ+1))(c/d)e((m d̄+n d)/c)`, and `ε_d^(−(2ℓ+1))=ε_d` for odd ℓ; the substitution `d↦d̄` preserves `ε_d` and (c/d), because `d̄≡d mod 4` and `(c/·)` is a quadratic character `mod c` when `4|c`, so the two index orders agree. Prove `halfWeightKloosterman_eq_halfIntegral`: `K_{1/2}(m,n;c)=``halfIntegralKloosterman 1 m n c`; for even ℓ GN's sum is instead the complex conjugate of `K_{1/2}(−m,−n;c)`.

(DIT16, §8, p.976; DIT11 p.964 (unnumbered display just before (3.4)); DIT11 (3.4), p.965, is `K⁺`).

- `halfWeightKloosterman_unitSum`: Sum over units `mod c` with a chosen inverse and the extended Kronecker symbol.
- `halfWeightKloosterman_inverseIndependence`: Changing the integer lift of `a⁻¹` by c does not change the phase.
- `halfWeightKloosterman_modulusData`: Require `4|c` and distinguish `ε_a` for a residue 1 or 3 `mod 4`.

**Checks.**

- `K_{1/2}(0,0;4)=1+i`.
- Adding c to either index leaves `K` unchanged.
- Omitting `ε_a` gives 2 instead of `1+i` at zero `indices,c=4`.
- `K_{1/2}(m,n;c)=K_{1/2}(n,m;c)` by `a↦ā`; for example `K_{1/2}(1,0;4)=K_{1/2}(0,1;4)=e(1/4)+i·e(3/4)=i+1`.

### 7.13 Modified plus Kloosterman sum

Define `plusKloosterman` as follows. `K⁺(m,n;c)=(1−i)K_{1/2}(m,n;c)` times1 `if8|c`, and times2 `ifc≡4` mod8. Only the discriminant-indexed symmetry statement is used.

(DIT16, §8, p976). *Needs:* 7.12.

- `plusKloosterman_dyadicFactor`: Use 2 when `c≡4 mod 8` and 1 when `8|c`.
- `plusKloosterman_weightHalfComparison`: `K⁺/(1−i)` equals the dyadic multiple of `K_{1/2}`.
- `plusKloosterman_discriminantSymmetry`: For allowed indices, `K⁺` is real and symmetric.

**Checks.**

- `K+(0,0;4)=4`.
- `K+(1,1;4)=−4`.
- Omitting the `c≡4` mod8 factor gives 2 at zero `indices,c=4`.

### 7.14 Reality and symmetry of plus sums

Prove `plusKloosterman_symmetry`: For `c>0` with `4|c` and all `m,n∈ℤ`, `K⁺(m,n;c)=K⁺(n,m;c)=conj(K⁺(n,m;c))`. This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5).

(DIT16, §8 (8.9), p976). *Needs:* 7.13.

### 7.15 Half-weight resolvent kernel

Define `halfWeightResolvent` as follows. Construct the resolvent `G_{1/2}(z,z′;s)` on the `Γ₀(4)` unitary-multiplier `L²` space, with its three-cusp domain, hermitian kernel symmetry and discrete polar projectors. This is a cover-specific adaptation of AutomorphicSpectralTheory §§1.16a, 2.19, not an ordinary scalar kernel on `Γ\H`.

(DIT16, §8 (8.5), p975). *Needs:* 7.2, 5.5; AutomorphicSpectralTheory §§1.16a, 2.19.

*Proof input.* The resolvent of the weight-one-half Laplacian with the theta multiplier, and its self-adjoint domain with conditions at the three cusps, are Fay's construction (Fay, Theorem 3.1 and Corollary 3.6, p.178), which DIT16 §8 quotes for the formula used here. This target constructs them, following the weight-zero resolvent of AutomorphicSpectralTheory §§1.16a and 2.19 with the multiplier J in place of the trivial one.

- `halfWeightResolvent_weightedDomain`: Use functions with J automorphy and all three cusps in the self-adjoint domain.
- `halfWeightResolvent_covariance`: Transform each kernel variable with its J or conjugate J factor.
- `halfWeightResolvent_polarProjection`: The residue is the orthogonal projector onto the weighted eigenspace, before plus projection.

**Checks.**

- The kernel is not an ordinary invariant scalar in both variables.
- A basis-vector phase change preserves its rank-one projector.
- Project to `V⁺` before taking the basis sum in the coefficient residue identity in 7.20.

### 7.16 Half-weight Poincaré family

Define `halfWeightPoincare` as follows. For `n≠0`, `Re(s)>1`, `F_{1/2,n}(z,s)=Γ(s−sgn(n)/4)/(4π|n|Γ(2s))` times `Σ_{Γ∞\Γ₀(4)}J(γ,z)⁻¹ M_{sgn(n)/4,s−1/2}(4π|n|Imγz)e(n Reγz)`.

(DIT16, §8 (8.6), p975). *Needs:* 7.1, 5.5; AutomorphicSpectralTheory §§0.26, 0.28 (Whittaker functions).

- `halfWeightPoincare_seedNormalization`: The prefactor is `Γ(s−sgn n/4)/(4π|n|Γ(2 s))`.
- `halfWeightPoincare_multiplierInverse`: `J(γ, z)⁻¹` in the coset sum gives the correct automorphy.
- `halfWeightPoincare_parameter`: The Whittaker parameter is `s−1/2`. Comparing with weight zero requires the substitution `w=s/2+1/4`.

**Checks.**

- `n=1` and `n=−3` have different gamma arguments.
- `n=0` is excluded from the prefactor.
- Omitting `4π|n|` changes residues and the constant 12; cancel `Γ(2s)` only where nonzero, in `Re s>1`.

### 7.17 Half-weight Poincaré residues

Prove `halfWeightPoincare_residue`: At `s₀=1/2+ir/2`, `r>0`, `Res[(2s−1)F_{1/2,n}(z,s)]=Σ_ψ conj(b_ψ(n))ψ(z)` over an orthonormal cuspidal eigenbasis, in the kernel convention verified from Fay. Preserve conjugation; raw PDF text drops bars.

(DIT16, §8 `equation(8.7)`, printed976, PDF28). *Needs:* 7.3, 7.15, 7.16, 5.5.

*Proof input.* The residue formula is DIT16 (8.7); the comparison between the Poincaré family and the resolvent uses the resolvent of 7.15 with its cusp-domain hypotheses.

### 7.18 Plus Bessel coefficient family

Define `plusBesselCoefficient` as follows. For nonzero discriminant indices n,d and `Re(s)>1`, `Φ⁺(n,d;s)` equals `[Γ(s−sgn n/4)Γ(s−sgn d/4)/(3√π·2^(2−2s)Γ(2s−1/2)√|nd|)] Σ_{c>0,4|c}K⁺(n,d;c)c⁻¹ B_{2s−1}(4π√|nd|/c)`, with I for `nd<0`, J for `nd>0`.

(DIT16, §8 `equation(8.11)`, printed977, PDF29). *Needs:* 7.13, 5.5; AutomorphicSpectralTheory §0.25 (Bessel I); AutomorphicSpectralTheory §0.25 (Bessel J).

- `plusBesselCoefficient_besselSeries`: Use the explicit prefactor and `K⁺` series displayed in 7.18 in `Re(s)>1`.
- `plusBesselCoefficient_signs`: Each gamma factor uses its own index sign; the Bessel function depends on the product sign.
- `plusBesselCoefficient_continuation`: Extend using the projected resolvent coefficient, preserving its initial series.

**Checks.**

- For `n=−3,d=−4`, the actual `c=4` term has `K⁺(−3,−4;4)=4` and is the displayed prefactor, with gamma numerator `Γ(s+1/4)²`, times `J_(2s−1)(π√12)`.
- For `n=1,d=−3`, `K⁺(1,−3;4)=−4`; its `c=4` term is minus the displayed prefactor, with numerator `Γ(s−1/4)Γ(s+1/4)`, times `I_(2s−1)(π√3)`.
- For `n=d=1`, `K⁺(1,1;4)=−4`; its `c=4` term is minus the displayed prefactor, with numerator `Γ(s−1/4)²`, times `J_(2s−1)(π)`. These are summands of the actual series, not replacements of its remaining moduli.

### 7.19 Projected Fourier expansion

Prove `plusPoincare_expansion`: For `Re s>1` and nonzero `d≡0,1` mod4, `pr⁺F₁/₂,d` equals `(2/3)Γ(s−sgn d/4)M_{sgn d/4,s−1/2}(4π|d|y)e(dx)/(4π|d|Γ(2s))`, plus `Σ_{n≠0,n≡0,1(4)} Φ⁺(n,d;s)W_{sgn n/4,s−1/2}(4π|n|y)e(nx)`, plus a separate constant term. Use `Φ⁺` from 7.18; the Whittaker expression cannot be evaluated at `n=0`.

(DIT16, §8 `equations(8.10)–(8.11)`, printed977, PDF29). *Needs:* 7.11, 7.16, 7.18, 5.5.

### 7.20 Plus coefficient residue theorem

Prove `plusBesselCoefficient_residue`: `Φ⁺(d′,d;s)` continues meromorphically to `Re(s)>0` and `Res_{s=1/2+ir/2}[(2s−1)Φ⁺(d′,d;s)]=Σ_ψ b_ψ(d′)conj(b_ψ(d))`, for an orthonormal basis of `V_r^+`.

(DIT16, Proposition4, p977). *Needs:* 7.9, 7.17, 7.19, 5.5.

*Proof input.* The meromorphic continuation of the coefficient family uses the resolvent of 7.15 and the spectral projector onto `V_r⁺` of 7.11; DIT16 Proposition 4 fixes the normalization.

### 7.20a Arithmetic carriers for CM and cycle traces

Construct `quadraticTraceData`. For fundamental d, a discriminant d′ and nonsquare `D=dd′`, define `Q_D` as the integral binary quadratic forms of discriminant D, positive definite if `D<0`, with its finite `PSL₂(ℤ)`-orbit set, including imprimitive forms. Define `χ_d([a,b,c])=0` if `gcd(a,b,c,d)>1`, and otherwise as `(d/r)` for any represented integer r coprime to d. Prove existence of r, independence of its choice and proper-representative invariance. For negative D construct `z_Q=(−b+√D)/(2a)` and the finite stabilizer order `ω_Q` in `PSL₂(ℤ)`. For positive nonsquare D construct the oriented closed cycle of the primitive form underlying Q; scaling by a positive content leaves the cycle and its primitive stabilizer unchanged. Orient from z to `γ_Q z` as in DIT16 (2.11), clockwise for `a>0`. Fix hyperbolic length `y⁻¹|dz|`, weight-two differential `i∂_zφ dz`, and their representative transport. Prove the reflection laws under `[a,b,c]↦[a,−b,c]` and `z↦−conj(z)` used for odd-trace cancellation. Identify the positive fundamental specialization with AutomorphicSpectralTheory §4.17a, including its narrow-class and surface conventions; construct the negative and nonfundamental branches here from IntegralLattices Layer B's form-class foundations.

(DIT16, §7 genus characters, §9 before Proposition5 and (9.1), §10 trace preceding Proposition6, pp.968,977–982; DIT11 §4 for primitive cycles and orientation.) *Needs:* IntegralLattices Layer B; GlobalNumberFields; FuchsianOrbifolds Layer 6; AutomorphicSpectralTheory §4.17a.

**Checks.**

- For `d=−4,d′=5,D=−20`, the positive forms `[1,0,5]` and `[2,2,3]` have genus characters 1 and −1 and stabilizer orders 1 in `PSL₂(ℤ)`.
- For `d=−3,d′=−16,D=48`, `[1,0,−12]` has character 1; the imprimitive form `[2,0,−6]` has character `(−3/2)=−1` and the same cycle as `[1,0,−3]`.
- For `d=1,d′=5`, the character is 1 on every form and the closed-cycle data agree with the positive fundamental narrow-class construction.

### 7.21 Quadratic-root Weyl sum

Define `quadraticRootWeylSum` as follows. For `c>0` divisible by4, `S_m(d′,d;c)=Σ_{b mod c,b²≡D modc}χ_d([c/4,b,(b²−D)/c])e(2mb/c)`. Prove representative independence, reality and `S_{−m}=S_m` using the exact factor2 in the exponential.

(DIT16, §9 (9.1), p978). *Needs:* 7.20a.

- `quadraticRootWeylSum_rootIndex`: Sum over b `mod c` with `b²≡d′d mod` c.
- `quadraticRootWeylSum_formEvaluation`: Associate `[c/4, b,(b²−D)/c]` of discriminant `D`.
- `quadraticRootWeylSum_evenness`: `S_{−m}=S_m=conj(S_m)` under the stated genus character convention.

**Checks.**

- For `d=1,d′=5,c=4,m=0`, the roots `b=1,3` both have `χ₁=1`, so `S₀(5,1;4)=2`.
- For the same d,d′,c and `m=1`, both phases are −1 and `S₁(5,1;4)=−2`; at `m=2` both are 1 and `S₂(5,1;4)=2`.
- With this data and `a=c/4=1`, the root sum modulo `2a=2` has one representative `b=1` and value `(−1)^m`; the sum modulo `4a=4` has two representatives and value `2(−1)^m`. Thus the conversion from the latter sum to the former requires 1/2.

### 7.22 Kohnen–Salié divisor identity

Prove `kohnenSalie_identity`: For `c>0` divisible by4, d fundamental, `d′≡0,1` mod4 and integer m, `S_m(d′,d;c)=Σ_{n|gcd(m,c/4),n>0}(d/n)√(n/c)K⁺(d′,m²d/n²;c/n)`. Include even-prime factors and the `c≡4` mod8 multiplier.

(DIT16, Lemma 8, p.980; the same as DIT11 Proposition 3, p.965, with DIT11's (d,D) renamed (d′,d)). *Needs:* 7.20a, 7.13, 7.21.

*Proof input.* DIT11 Proposition 3, p.965, states the identity and refers its proof to Kohnen's Proposition 5, p.259, a finite computation with Salié sums; that computation is part of this target.

### 7.23 Weight-two cycle unfolding

Prove `halfWeight_cycleUnfolding`: Let d be fundamental, `d,d′<0` and `D=dd′` nonsquare. For the supplied weight-two Poincaré seed `φ`, put `Φ_m(t)=−it∫₀^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ`. In a proved convergence range, `Σ_Qχ(Q)∫_{C_Q}P_m(τ,φ)dτ=εΣ_{c>0,4|c}S_m(d′,d;c)Φ_m(2√D/c)`, for every integer m. Here `ε=1` for `z→γ_Qz`, clockwise when `a>0`, and `ε=−1` for `z→γ_Q⁻¹z`. This uses the negative kernel sign; the printed positive sign requires the opposite overall sign. Supply the actual decay estimate, possibly `O(y^ε)`, rather than inferring a stronger bound from `Re s>1`.

(DIT16, §9 Lemma6, (9.3), pp979–980; DIT11 §4 Lemmas6–8, pp966–969). *Needs:* 7.20a, 7.21, 5.5; AutomorphicSpectralTheory §§1.20–1.21.

### 7.24 CM Poincaré sum

Prove `poincare_cmSum`: For `m≠0`, `Re(s)>1` and `d′d=D<0`, `Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c)`. The square root is of `|D|`.

(DIT16, Lemma3, p978; DIT11 Proposition4). *Needs:* 7.20a, 7.21, 5.5; AutomorphicSpectralTheory §§1.20–1.21.

### 7.25 Positive cycle Poincaré sum

Prove `poincare_positiveCycle`: For `m≠0`, `Re(s)>1` and `d,d′>0`, `D` nonsquare, `Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s)` times `Σ_{c>0,4|c}S_m(d′,d;c)c^(−1/2)J_{s−1/2}(4π|m|√D/c)`.

(DIT16, Lemma4, p979). *Needs:* 7.20a, 7.21, 5.5; AutomorphicSpectralTheory §§1.20–1.21.

### 7.26 Negative-factor cycle Poincaré sum

Prove `poincare_negativeCycle`: Let `m≠0`, `Re(s)>1`, d fundamental, `d′,d<0` and `D=d′d` nonsquare. Orient `C_Q` from z to `γ_Qz`, with `γ_Q` from (2.11); this is clockwise on `S_Q` when `a>0` and is the orientation of `C_A` in §2. Then `Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}i∂_zF_m(z,s)dz=2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}Σ_{0<c≡0(4)}S_m(d′,d;c)c^{−1/2}J_{s−1/2}(4π|m|√D/c)`. With DIT11's orientation (z to `γ_Q⁻¹z`) the right side changes sign.

(DIT16, Lemma5, p979). *Needs:* 7.20a, 7.23, 5.5; AutomorphicSpectralTheory §0.25 (Bessel J).

### 7.27 Exact three-case Poincaré identity

Prove `halfWeight_threeCasePoincare`: Let `m≠0` and `Re(s)>1`, let d be a fundamental discriminant and d′ a discriminant with `D=d′d` nonsquare. Then `6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²;s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q`, where `X_Q=2√πω_Q⁻¹F_m(z_Q,s)` if `d′d<0`, `X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz|` if `d′,d>0`, and `X_Q=∫_{C_Q}i∂_zF_m(z,s)dz` if `d′,d<0`. In the third case `C_Q` runs from z to `γ_Qz`, with the orientation fixed above.

(DIT16, Proposition5, p978). *Needs:* 7.20a, 7.18, 7.22, 7.24, 7.25, 7.26, 5.5.

### 7.28 Plus Hecke eigenbasis

Prove `kohnenPlus_heckeBasis`: Construct an orthonormal simultaneous Hecke eigenbasis `B_r` of `V_r⁺`. Include the specified plus-space `T₄` operator together with `T_{p²}` for odd p; diagonalization away from 2 alone supplies no all-prime Euler product.

(DIT16, §10, pp980–981; Katok–Sarnak[34]). *Needs:* 7.20a, 7.9, 7.10, 5.5.

*Proof input.* The eigenbasis needs the Hecke operators `T(p²)` for all p, including the plus-space operator at `p=2`, on the self-adjoint domain of 7.15; simultaneous diagonalization away from 2 does not give an eigenbasis for the Euler product. The operator at 2 and its self-adjointness are part of this target (DIT16 §10, Katok–Sarnak).

### 7.28a Shimura coefficient relation

Prove `shimura_coefficientRelation`: For `m>0` and fundamental d, `mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d)`. Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones.

(DIT16, Theorem4; §10, pp981–982). *Needs:* 7.20a, 7.3, 7.28, 5.5.

### 7.29 Shimura lift from an eigenline

Define `shimuraEigenlineLift` as follows. For `ψ∈B_r`, choose a fundamental d with `b_ψ(d)≠0`, define `a_ψ(n)` from the Hecke Euler factors, and form `Shim(ψ)(z)=2√yΣ_{n≠0}a_ψ(|n|)K_ir(2π|n|y)e(nx)`. Prove independence from the selected d and from scaling `ψ`; define it first on the eigenline.

(DIT16, §10 (10.1)–(10.3), p981). *Needs:* 7.20a, 7.3, 7.28, 5.5, 7.28a; AutomorphicFormsOnReductiveGroups §4.5.

- `shimuraEigenlineLift_heckeSeries`: Form the even K-Bessel series from the Hecke eigenvalues.
- `shimuraEigenlineLift_scaleIndependence`: Multiplying `ψ` by a nonzero scalar leaves all `a_ψ(n)` and `Shim(ψ)` unchanged.
- `shimuraEigenlineLift_fundamentalChoice`: Different nonzero fundamental coefficients produce the same `a_ψ(n)`, using the Hecke relations.

**Checks.**

- `ψ` and `−ψ` give the same lift.
- `b(d)=0` cannot serve as denominator.
- The `p=2` factor requires its own plus-space convention.

### 7.29a Automorphic companion from global theta correspondence

Prove `maassTheta_automorphicCompanion`: let `M>0`, χ be an even Dirichlet character modulo 4M and g a weight ±1/2 Maass cusp form on `Γ₀(4M)` with character χ, generating a genuine irreducible cuspidal metaplectic summand. In the principal or complementary series range, with half-weight eigenvalue `1/4+t²`, t real or purely imaginary with `|Im t|<1/4`, construct its actual cuspidal PGL₂ automorphic companion of weight-zero eigenvalue `1/4+(2t)²`. Exclude the one-variable Weil spectrum, meaning the automorphic theta representations from one-dimensional quadratic spaces. Construct this through global theta correspondence with quadratic-character transport using any nonzero Fourier coefficient; prove nonvanishing, cuspidality and the unramified Hecke comparison. The construction includes the local theta-packet selection, the real principal or complementary series parameter and the finite newvector types. For odd squarefree companion conductor N, let T be its prime divisors and let χ be the even character of `(ℤ/4Nℤ)×` with `χ_(p)=1` at every `p∈T` for which `χ_(p)(−1)=1` (condition (C0)). Retain their minimal half-weight level `4N(χ)`, where `N(χ)=N∏_{p∈T′χ}p`, `T′χ={p|N:χ_(p)(−1)=−1}`. Here `f(−conj z)=η_f f(z)`, `η_f∈{±1}`, the half-weight is `η_f/2`, and at `p∤4M` the Hecke comparison is `λ_g(p)=χ(p)a_f(p)`. The minimal-level plus subspace defined by `c(n)=0` unless `χ_(2)(−1)n≡0,1 (mod 4)` (condition (C2)) is one dimensional. These are the hypotheses and local types of BaruchMao10 Theorems1.1–1.2, rather than an assertion for every level or character.

For the level-four plus eigenline of 7.28 with `r>0`, prove its finite types give a companion unramified at every finite prime, including the dyadic plus type, and its weight +1/2 real type gives even parity and weight-zero parameter r. Thus this companion is an even level-one cusp form. Match its normalized Hecke coefficients with `a_ψ(p)` for every p. The one-variable Weil spectrum is excluded here by the archimedean parameter; no positive fundamental coefficient is presumed nonzero. Construct these global and local comparisons here, before using the companion to identify the normalized series of 7.29.

(BaruchMao10, §§2.1–2.3 classical/adelic correspondence, §5 proofs of Theorems1.1–1.2 and the opening of the proof of Theorem1.5, where a nonzero coefficient supplies the companion; DIT16 §10 Proposition6 for the level-one specialization.) *Needs:* 7.28, 7.28a, 7.49, 3.7, 5.6; GL2AutomorphicRepresentationsAndTransfer R16.0.1 (local GL₂ parameters); AutomorphicFormsOnReductiveGroups §§7.2–7.3 (classical/adelic newvectors).

**Checks.**

- A nonzero negative fundamental coefficient is admissible for constructing the companion; it need not be replaced by an unproved positive one.
- At `M=1,χ=1`, the finite type at 2 is the plus vector, and the companion has level one; omitting that type gives no such conductor conclusion.
- In the odd squarefree case a prime in `T′χ` contributes its square to `N(χ)`; the minimal level is not always 4N. The one-variable theta spectrum is outside the cuspidal-companion assertion.

### 7.31 Spectral substitution residue factor four

Prove `spectralResidue_substitution`: Set `w=s/2+1/4`, `s₀=1/2+ir` and `w₀=1/2+ir/2`, `r>0`. Then `Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)]` for `H` with a simple pole at `w₀`. One factor2 is the derivative of the coordinate change, the other the linear spectral factor.

(DIT16, §10, p982).

### 7.31a Geometric trace

Define `geometricTrace` as follows. For an even Hecke–Maass cusp form `φ`, fundamental d, discriminant d′ and nonsquare `D=d′d`, define `T(φ,χ)=||φ||⁻²Σ_{Q∈Γ\Q_D}χ(Q)Y_Q`. Here `Y_Q=2sqrt(π)ω_Q⁻¹φ(z_Q)` for `D<0`, `∫C_Qφ y⁻¹|dz|` for `d,d′>0`, and `∫C_Q i∂_zφ` dz for `d,d′<0`, with the corrected `z→γ_Qz` orientation. The forms, genus characters, CM stabilizers and cycles are those of 7.20a; for odd `φ` the paired trace vanishes.

Nonzero actual cusp eigenform so `||φ||²>0`; the genus character on possibly imprimitive forms; invariant cycle/stabilizer conventions.

(DIT16, §10 geometric trace display preceding Proposition6, printed981, PDF33). *Needs:* 7.20a, 7.27; AutomorphicSpectralTheory §4.17a.

- `geometricTrace_cm`: The negative-D branch is the inverse-stabilizer weighted CM value sum.
- `geometricTrace_cycle`: The two positive-D branches use scalar length integration or the oriented weight-two differential.
- `geometricTrace_odd`: A finite involution preserving trace weights and negating paired function values forces the normalized weighted trace to vanish. Actual source CM/cycle reflection must instantiate these data.

**Checks.**

- `a≠0`: `T(aφ)=T(φ)/conj(a)`.
- Equal-weight paired points with `φ(q)=−φ(p)` cancel in the weighted trace.
- The denominator is 1 at Petersson norm 1, and is retained at other norms.

### 7.32 Spectral trace identity before multiplicity one

Prove `halfWeight_spectralTrace`: Taking residues of the three-case identity and using the Fourier residues, Shimura coefficient relation and factor-four change of variable gives `12√π|D|³/⁴Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φ a_φ(m)T(φ,χ)`. Here `T` is the norm-divided three-case geometric trace of 7.31a. Retain both finite eigenspace sums until the Shimura bijection is proved.

(DIT16, §10 (10.4)–(10.6), pp981–982). *Needs:* 7.20a, 7.20, 7.27, 7.28a, 7.31, 5.5, 7.31a; AutomorphicSpectralTheory §4.17a.

### 7.32-raw General-level Biró spaces and raw series

Construct `biroLevelSpaces` for every `N>0`. Restrict 7.1's unitary theta multiplier to `Γ₀(4N)`, and construct Biró's `L²` Maass space `V₁/₂(4N)` with the negative Laplacian, Fourier coefficients at every cusp and finite-dimensional fixed-eigenvalue cusp spaces. For odd N define `V⁺` by the forbidden coefficient kernels and prove it is the eigenvalue-one space of Biró's operator `L_(4N)f=[2(1+i)]⁻¹Σ_{w=0}³(f|[[1,1/4],[0,1]])|[[1,0],[4Nw,1]]`. Set `V*=V⁺` for odd N and `V*=V` for even N. At eigenvalue `λ=−1/4−t²<−3/16`, including purely imaginary t in the complementary range, these eigenfunctions are cuspidal.

Define the raw series `biroLift` on this fixed-eigenvalue space by `Sh_D f=Σ_{k≠0}a_Sh(k)W_(1/2+2it)(kz)` for positive fundamental D, where `a_Sh(k)=Σ_{PQ=k,P>0,(N,P)=1}|Q|^(1/2)P⁻¹(D/P)b_f(DQ²)`. Use Biró's Whittaker normalization, including its `|k|^(1/2)` factor relative to the K-Bessel series. This definition precedes its automorphy theorem.

(Biro00, §2, printed104–106, definition of `V*`, operator L and raw Shimura series; Theorem1.) *Needs:* 7.1, 7.3, 7.9; AutomorphicSpectralTheory §§0.26–0.27, 1.16; AutomorphicFormsOnReductiveGroups §4.5.

**Checks.**

- At `N=1`, `V*` is the plus space of 7.9, with the stated Laplacian sign conversion.
- At `N=2`, `V*=V₁/₂(8)` without an extra plus-space hypothesis.
- For `λ=−7/32`, `t²=−1/32`; this complementary eigenvalue satisfies the hypotheses and cannot be modeled with real t alone.
- At `N=1,k=2`, the divisor formula is `√2 b_f(4D)+(D/2)b_f(D)/2`.

### 7.32-trace General-level Biró trace identity and convergence

Construct `biroArithmeticTraceData` at every level: for positive `s≡0,1 mod4`, form `Q_(N,s)={[A,B,C]:N|A,B²−4AC=s}`, its finite `Γ₀(N)`-class set `Λ_(N,s)` and the genus character `ω_D` when D is fundamental and `s/D` is a positive discriminant. Construct `C_(Q,N)` as the geodesic modulo the endpoint-fixing stabilizer, with Biró's measure `dS`. For nonsquare s it is closed; for square s use the geodesic between rational cusps and prove convergence of cusp periods. Prove representative invariance and compatibility under the level-divisor maps and the `N=1` nonsquare specialization of 7.20a.

Prove `biro_traceIdentity`: the raw series of 7.32-raw converges locally uniformly with the differentiations used in the Laplace equation, and Biró's Lemma10 and equation (14) hold throughout `λ<−3/16`. For every positive fundamental D and positive s with `s/D≡0,1 mod4` integral, write `τ=2t`, `p_N=1` for even N and `p_N=3/2` for odd N. For orthonormal half-weight eigenbasis `(f_j)` and orthonormal weight-zero cusp eigenbases `U_(N/L)` at eigenvalue `−1/4−τ²`, the identity is
`8p_N√π s^(3/4) Σ_j conj(b_j(s/D)) Sh_D f_j(z) = Σ_{L|N}(D/L)μ(L)/L Σ_{u∈U_(N/L)}(Σ_{Q∈Λ_(N/L,s)}ω_D(Q)∫_{C_(Q,N/L)}conj(u) dS)u(Lz)`.
Prove the Kuznetsov and period identities used in Lemma10 with the specified level multiplier and plus projection (Biró §§5–7 and Appendix), and justify summation over the nonzero Fourier index to obtain (14) before applying finite separation. Retain the complex spectral parameter and the residue argument for exceptional eigenvalues. The right side is a finite sum of actual lower-level cusp forms transported by `z↦Lz`.

(Biro00, §2 arithmetic forms/cycles, Lemma10 printed128, proof of Theorem1 and (14) printed128–129, §§5–7 and Appendix.) *Needs:* 7.32-raw, 7.20a; AutomorphicSpectralTheory §§0.25–0.28, 2.17; FuchsianOrbifolds Layer 6; IntegralLattices Layer B.

**Checks.**

- At `N=1`, only `L=1` occurs and the left prefactor is `12√π s^(3/4)`.
- At `N=2`, `p_N=1` and both `L=1,2` occur, with factors 1 and `−(D/2)/2`.
- For `D=s=1`, the trace uses cusp-to-cusp geodesics; no closed real-quadratic cycle is asserted.
- For `λ=−7/32`, `0<iτ<1/2` after the source choice of sign, so Lemma10's exceptional residue argument supplies the same identity.

### 7.32a Positive Fourier kernel and orthogonal complement

Define `positiveFourierKernel` as follows. In the finite-dimensional fixed-eigenvalue cusp space `W⊂V*₁/₂(4N)` of 7.32-raw for any `N>0`, let `W₀=⋂_{n>0,n≡0,1(4)}ker(b_n)` and `W₁=W₀⊥`. Use `W=W₀⊕W₁` with the inherited Petersson inner product. No hypothesis or conclusion `W₀=0` is imposed.

(Biro00, Proof of Theorem1, printed128–129, PDF26–27). *Needs:* 7.20a, 7.32-raw.

- `positiveFourierKernel_memKernel`: Membership in `W₀` means every positive admissible Fourier coefficient vanishes.
- `positiveFourierKernel_orthogonalSplit`: Choose an orthonormal basis adapted to `W₀⊕W₁` using finite dimensionality.
- `positiveFourierKernel_liftZero`: For positive fundamental `D`, the Biró lift is zero on `W₀` because every `DQ²` index is positive and admissible.

**Checks.**

- Identity positive-coefficient maps on `C` exclude nonzero vectors.
- Full positive kernel forces all positive coefficients to vanish.
- A sole negative-index identity map leaves the positive kernel full.

### 7.32b Finite Fourier separation with conjugated trace coefficients

Prove `positiveFourier_finiteSeparation`: For an orthonormal basis `f₁,…,f_m` of `W₁`, there exist m positive admissible indices `n_i` for which the matrix `(conj(b_{f_j}(n_i)))` is invertible. This uses all positive admissible coefficients, not only fundamental indices.

(Biro00, Proof of Theorem1, printed128–129, PDF26–27). *Needs:* 7.20a, 7.32a.

### 7.32c Automorphy from finite Fourier separation

Prove `shimura_finiteFourierAutomorphy`: For every `N>0` and positive fundamental D, apply the proved convergence and equation (14) of 7.32-trace for every positive admissible `n=s/D`. Finite Fourier separation on 7.32a's `W₁` proves each raw `Sh_D f` is a possibly zero `Γ₀(N)` cusp eigenform with eigenvalue `−1/4−(2t)²`. The `W₀` lift is zero. The coefficients are even because D is positive and the divisor expression depends on `Q²` and `|Q|`. At `N=1`, convert to 7.29's normalization.

(Biro00, Proof of Theorem1, printed128–129, PDF26–27). *Needs:* 7.20a, 7.32-raw, 7.32-trace, 7.32a, 7.32b.

### 7.33 Automorphy of the Shimura series

Prove `shimura_automorphy`: For every eigenline of 7.28 with `r>0`, normalize the actual even level-one companion of 7.29a to `a(1)=1`. Its Hecke coefficients equal those defining 7.29 at every prime, hence at every positive integer, so its convergent K-Bessel expansion is `Shim(ψ)`. This proves automorphy and cuspidality even if every positive fundamental coefficient of ψ vanishes. Biró's 7.32c independently proves automorphy of possibly zero raw lifts; it is not used to divide by a positive coefficient. The nonsquare all-sign trace identity of 7.32 is used after this identification, without an unstated separation assertion.

(DIT16, §10 p982; BaruchMao10 §§2,5 and Theorems1.1–1.2, with the companion and type comparisons of 7.29a.) *Needs:* 7.29, 7.29a, 5.5.

**Checks.**

- A zero positive-D raw lift supplies no denominator; the automorphic companion still identifies the normalized Hecke series.
- A nonzero negative fundamental coefficient suffices for 7.29a and does not enter the normalization `a(1)=1`.
- For `d=d′=1`, the nonsquare trace family excludes the pair; the companion argument does not use it as a separating row.

### 7.34 Shimura bijection of eigenlines

Prove `shimura_eigenlineBijection`: The weight-one-half Kohnen-plus Hecke eigenlines at parameter r/2 correspond bijectively to normalized even level-one Hecke–Maass forms at parameter r. On a previously chosen orthonormal basis `B_r` this gives one selected vector for each line; it does not produce a phase-independent unit vector.

(DIT16, §10 Proposition6 proof, pp981–982, [1]Theorem1.2). *Needs:* 7.20a, 7.28, 7.33, 5.5.

*Proof input.* Use the global companion and minimal-level one-dimensionality of 7.29a, established before 7.33, for both existence and uniqueness. BaruchMao10 Theorems1.1–1.2 at N=1 supply the inverse eigenline, with the dyadic plus type and even real type retained. This does not require the positive-coefficient kernel of the general-level Biró space to vanish.

### 7.35 Extended trace formula for all discriminants

Prove `shimura_extendedTrace`: For a normalized even `φ` and a unit `ψ` on its corresponding plus eigenline, `T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d))` for fundamental d, discriminant d′, `D=d′d` nonsquare. General negative `D` requires `|D|^(3/4)`.

(DIT16, Proposition6, pp981–982). *Needs:* 7.20a, 7.32, 7.34, 5.5, 7.31a.

### 7.36 Theorem4 negative factors

Prove `shimura_negativeTrace`: Let `φ` be the even level-one form of 7.29 with `a(1)=1`, `λ=1/4+r²`, and let `F` be the corresponding half-weight eigenline vector with unnormalized Petersson norm 1 and the coefficient relation of 7.28a. For coprime negative fundamental d,d′, `D=dd′>0`, prove `12√πD³/⁴ b(d′)conj(b(d))=||φ||⁻²(λ/2)Σ_{A∈Cl⁺(K)}χ(A)∫_{F_A}φdμ`. `F` remains determined only up to unit phase.

(DIT16, §5 Theorem4, (5.16) first branch, p965). *Needs:* 7.20a, 7.35, 5.5, 7.31a; FuchsianOrbifolds Layer 6.

### 7.37 Theorem4 positive factors

Prove `shimura_positiveTrace`: For coprime positive fundamental d,d′ with `D=dd′>1` (equivalently D nonsquare), `12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds`, with the same normalized `φ` and unit half-weight eigenline.

**Checks.**

- `d=d′=1` gives square `D=1` and is excluded.
- `d=1,d′=5` is admitted and uses the closed cycles for `ℚ(√5)`.
- `d=5,d′=8` is admitted with `D=40`; both positive factors and the length measure are retained.

(DIT16, §5 Theorem4, (5.16) second branch, p965). *Needs:* 7.20a, 7.35, 5.5, 7.31a.

### 7.38 Theorem4 CM factors

Prove `shimura_cmTrace`: For coprime fundamental d,d′ of opposite sign, `12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A)`. Keep both `2√π` and `ω_D`; the paper explicitly corrects the earlier CM constant.

(DIT16, §5 Theorem4, (5.16) third branch and footnote4, p965). *Needs:* 7.20a, 7.35, 5.5, 7.31a.

### 7.39 Duke coefficient estimate with spectral factor

Prove `halfWeight_dukeBound`: For an `L²-unit` weight-one-half cusp form on `Γ₀(4)` with eigenvalue `1/4+t²` for real t, and nonzero fundamental n, prove `|b(n)|≪_ε(1+|t|)^C cosh(πt/2)|n|^(−2/7+ε)`. For the paired lift `t=r/2`. Conversion to the `a(1)=1` weight-zero form retains its Petersson norm and the spectral factor; it requires no unproved symmetric-square `r^ε` estimate.

(DIT16, §6, (6.6), printed968–969/PDF20–21; Duke88, §2 spectral normalization, printed77–78/PDF5–6; Theorem5 printed85–86/PDF16–17). *Needs:* 7.3, 7.12, 7.28, 5.5.

The statement and spectral normalization are Duke88 Theorem 5, printed pp.85–86; the bound is stated for the Fourier coefficients of the weight-one-half Maass forms of 7.2.

### 7.40 Exact conjugation of the two U and W normalizations

Prove `plusOperators_conjugation`: On functions on `H` let `C f(z)=Im(z)^(1/4)f(z)`, `U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4)`, `W₄f(z)=(2z/i)^(−1/2)f(−1/(4z))` with the principal square root. Then `CU₄C⁻¹=U` and `CW₄C⁻¹=W` for the U,W displayed in DIT16 p976, and `C(U₄∘W₄)C⁻¹=U∘W`. This calculation alone does not identify U∘W with W∘U on the automorphic subspace.

(DIT16, §8, printed976, PDF28, U,W and footnote6; DIT11 §2, printed959, PDF13).

### 7.44 Coefficients of the weight-1/2 plus-space Eisenstein series

Prove `halfWeightEisenstein_dit11`: For positive m and fundamental `D`, prove `Σ_{n|m}(D/n)b₀(Dm²/n²,s)=2^(2−4s)π^(s+1/4)m^(3/2−2s)|D|^(s−1/4)σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1)`, and `b₀(0,s)=√π2^(5/2−6s)Γ(2s)ζ(4s−2)/ζ(4s−1)`, for the DIT11 `P₀⁺` coefficients. Consequently `E*₁/₂(z,s)=2^sΛ(2s)y¹/⁴P₀⁺(z,s/2+1/4)`, recovering the constant term, fundamental coefficients and Shimura relation above.

(DIT16, DIT11 Lemma 4, (2.23)–(2.25), pp961–962; used for the `E*_{1/2}` display, DIT16 p964, which cites only [16, Prop. 2 p. 959]). *Needs:* 5.5, 7.4, 7.3, 7.40.

### 7.45 Fourier expansion and residues of the weight-1/2 resolvent

Prove `halfWeightResolvent_fourier`: For `Re s>1`, reduced z and `Im z′>Im` z, expand `G₁/₂(z′,z;s)` as `Σ_{n≠0}F₁/₂,n(z,s)W_{sgn n/4,s−1/2}(4π|n|y′)e(−nx′)` plus its separate Eisenstein term. Continue meromorphically and prove `Resₛ₌₁/₂₊ᵢᵣ/₂(2s−1)G₁/₂=Σ_ψ conj(ψ(z′))ψ(z)`, using an orthonormal basis of `V_r`. Fay’s resolvent input also gives meromorphic continuation of `Φ⁺` to all s.

(DIT16, §8, pp.975–977, citing Fay [20, Thm 3.1] and footnote 5; Fay Cor. 3.6 p.178). *Needs:* 5.5, 7.15, 7.16, 7.17.

*Proof input.* DIT16 §8 records the Fourier formula and refers to Fay, Theorem 3.1 and Corollary 3.6, p.178; the resolvent itself is the one constructed in 7.15.

### 7.46 Shimura Dirichlet-series identity for ψ∈B_r

Prove `shimura_dirichletSeries`: For `ψ∈B_r` and fundamental d, prove `L_d(s+1/2)Σ_{n≥1}b(dn²)n^(1−s)=b(d)∏_p(1−a_ψ(p)p^−s+p^−2s)^−1`. Here `L_d=L(−,χ_d)`, and `a_ψ(2)` uses the specified plus-space Hecke operator. Coefficient comparison gives 7.28a.

Use the all-prime simultaneous eigenbasis, including the separately supplied plus-space operator at2; an odd-prime eigenbasis does not define the displayed Euler product.

(DIT16, §10, p.981 (display after (10.1))). *Needs:* 5.5, 7.3, 7.28, 7.28a.

### 7.48 Biró lift

Prove `biroLift_automorphic`: For `N>0`, positive fundamental D and `f∈V*₁/₂(4N)` with `λ=−1/4−t²<−3/16`, the raw series `biroLift` of 7.32-raw is a `Γ₀(N)` cusp form with eigenvalue `−1/4−(2t)²`. Apply 7.32c with the spaces, arithmetic trace carriers, convergence and identity (14) constructed in 7.32-raw and 7.32-trace. The spectral parameter t may be real or purely imaginary; the complementary range `−1/4<λ<−3/16` is included.

(Biro00, §1 and Theorem1, printed105–106, PDF3–4; proof128–129, PDF26–27). *Needs:* 7.32-raw, 7.32-trace, 7.32a, 7.32b, 7.32c; AutomorphicSpectralTheory §§0.26–0.27; AutomorphicFormsOnReductiveGroups §4.5; AutomorphicLFunctionsAndLocalFactors AL.0 (K-Bessel kernel).

- `biroLift_coeff`: The source-normalized divisor expression is used in the series over all `k≠0`, with positive-D inputs `b_f(DQ²)`; actual Fourier coefficient extraction requires the analytic carrier.
- `biroLift_spectral`: Half-weight parameter t gives weight-zero parameter2t in the negative Laplacian convention.
- `biroLift_kernel`: The positive-coefficient common kernel maps to zero for positive `D`.

**Checks.**

- Zero input gives zero lift.
- A nonzero `W₀` vector is invisible to positive-D lifts.
- Output spectral term is `(2t)²`.
- At `N=2,k=2`, the coprimality condition removes `P=2`, leaving `a_Sh(2)=√2 b_f(4D)`.

### 7.49 Adelic and classical half-weight comparison

Prove `halfWeight_adelicClassical`: For the actual rank-one adelic cover and a specified finite-level genuine vector, evaluate along the real Iwasawa section over `H` to obtain a classical half-integral-weight form with its theta multiplier. Conversely adelize a classical form with the compatible congruence/character and cusp conditions. The comparison intertwines right Hecke actions and matches the positive Fourier `e(nx)`, chosen Whittaker normalization, and the `y^{k/2}` holomorphic-to-unitary weight change. At weight1/2 the conjugated Laplacian is `Δ_unit,1/2=y^{1/4}Δ_hol,1/2 y^{−1/4}+3/16`.

Rank-one genuine central sign, specified K-weight and finite-level splitting; exact classical multiplier/character; archimedean and all-cusp growth conditions.

(DIT16, §5(5.14)–(5.16), PDF16–17; §8, PDF27–29). *Needs:* 5.3, 5.5, 7.1, 7.2; AutomorphicFormsOnReductiveGroups §7.2; AutomorphicFormsOnReductiveGroups §7.3; AutomorphicSpectralTheory §1.16 (weight-k Laplacian); ModularForms Layer 0.

### Examples

The half-weight spectral eigenvalue is `1/4+(r/2)²`, while the corresponding weight-zero eigenvalue is `1/4+r²`. At modulus 4, `K₁/₂(0,0;4)=1+i` and the plus normalization gives 4. The negative-factor trace includes `λ/2` times its area integral and the stated Petersson norm; source normalization cannot be inferred from a generic coefficient sequence.

### Dependencies

Within this roadmap: Layers 2 and 5. From other roadmaps: GeometryOfNumbersAndQuadraticArithmetic §4.3; AutomorphicSpectralTheory §§0.25–0.28, 1.1–1.3, 1.16, 1.16a, 1.20–1.21, 2.19, 4.17a; AutomorphicLFunctionsAndLocalFactors AL.0–AL.1; AutomorphicFormsOnReductiveGroups §§4.5, 7.2–7.3; AdelicAlgebraicGroups §4.5; FuchsianOrbifolds Layer 6; ModularForms Layer 0.

## Layer 8: Genus-two Jacobi and Eisenstein analysis

### 8.1 Integral genus-two Fourier-index shift

Define `fourierShift` as follows. Define `S_{a,c,ℓ}(Q,R)=(Q+c(a(ℓ·−)²−(R·−)(ℓ·−)),R−2aℓ)`. Build its quadratic-form component from products of the coordinate linear forms, addition and integer scalar multiplication.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`.

(BFH90, (2.9), printed p.552; lattice parameter in the proof on p.553).

- `fourierShift_fst_apply`: For `x∈V`, the first projection evaluates to `Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x))`; this is an equality in `Z` with the native quadratic-map evaluation.
- `fourierShift_snd`: The vector projection is `R−2aℓ`.
- `fourierShift_zero`: `S_{a,c,0}(p)=p`.
- `fourierShift_add`: `S_{a,c,ℓ+k}(p)=S_{a,c,k}(S_{a,c,ℓ}(p))` for all ℓ,k,p.
- `fourierShift_neg`: `S_{a,c,−ℓ}(S_{a,c,ℓ}(p))=p`, including `a=0` and `c=0`.

**Checks.**

- For `a=1,c=8`, `p=(0,0)` and `ℓ=e₀`, the output is `(8x₀²,−2e₀)`, with `x₀²` the native coordinate quadratic form.
- For `a=1,c=1` and the same zero data and shift, the output is `(x₀²,−2e₀)`. This detects using `c=N` at both cusps.
- For `a=c=1`, `Q=x₀x₁`, `R=e₀` and `ℓ=e₁`, the output is `(x₁²,e₀−2e₁)`. Here `Q` has symmetric matrix off-diagonal entries 1/2, not 1.

### 8.2 Discriminant quadratic form of a Fourier index

Define `fourierDiscriminant` as follows. Set `Δ_{a,c}(Q,R)=4aQ−c(R·−)²`. This invariant is a quadratic form, rather than its determinant. In BFH coordinates its matrix is `4aT−cRRᵀ`; multiplying by `N` gives `U=4mT−N^(2−j)RRᵀ`.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`.

(BFH90, (2.6), p.552, and (2.10), p.553).

- `fourierDiscriminant_apply`: `Δ_{a,c}(Q,R)(x)=4aQ(x)−c(R·x)²` as an equality in `Z` under native quadratic-map evaluation.
- `fourierDiscriminant_zero`: `Δ_{a,c}(0,0)=0` for all integers a,c.
- `fourierDiscriminant_zero_vector`: `Δ_{a,c}(Q,0)=4a·Q` in the native Z-module of quadratic forms.

**Checks.**

- For `a=c=1,Q=x₀x₁,R=0` and `x=e₀+e₁`, `Δ(Q,R)(x)=4`.
- For `a=1,c=8,Q=0,R=e₀`, `Δ(Q,R)(e₀)=−8`; positive definiteness is not part of the index type.
- At `a=0,c=1`, `Δ(x₀²,0)=Δ(0,0)`; this boundary case is excluded from orbit classification by `a≠0`.

### 8.3 Discriminant invariance under an integral shift

Prove `fourierDiscriminant_shift`: For every `a,c∈Z`, `ℓ∈V` and p, `Δ_{a,c}(S_{a,c,ℓ}(p))=Δ_{a,c}(p)`.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553). *Needs:* 8.1, 8.2.

### 8.4 Residue invariance of the vector index

Prove `fourierShift_modEq`: For all `a,c∈Z`, p, ℓ and `i∈{0,1}`, the vector coordinate of `S_{a,c,ℓ}(p)` is congruent to `R_i` modulo 2a.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553). *Needs:* 8.1.

### 8.5 Recovery from a discriminant and fixed vector

Prove `eq_of_fourierDiscriminant_eq`: Assume `a≠0`. If `p=(Q,R)` and `q=(Q′,R′)` satisfy `R=R′` and `Δ_{a,c}(p)=Δ_{a,c}(q)`, then `p=q`.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`. `a≠0`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553). *Needs:* 8.2.

### 8.6 Uniqueness of the integral shift parameter

Prove `fourierShift_injective`: Assume `a≠0`. For a fixed p, the map `ℓ↦S_{a,c,ℓ}(p)` is injective.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`. `a≠0`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553). *Needs:* 8.1.

### 8.7 Classification of genus-two Fourier-index orbits

Prove `exists_fourierShift_iff`: Assume `a≠0`. For `p=(Q,R)` and `q=(Q′,R′)`, there exists `ℓ∈V` with `S_{a,c,ℓ}(p)=q` if and only if `Δ_{a,c}(p)=Δ_{a,c}(q)` and `R_i≡R′_i` modulo 2a for both coordinates.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`. `a≠0`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553). *Needs:* 8.1, 8.2, 8.3, 8.4, 8.5.

### 8.8 Unique Fourier index with a prescribed residue lift

Prove `existsUnique_fourierRepresentative`: Assume `a≠0`. Given `p=(Q,R)` and `ν∈V` with `ν_i≡R_i` modulo 2a, there exists exactly one integral quadratic form `Q_ν` such that `Δ_{a,c}(Q_ν,ν)=Δ_{a,c}(p)`.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`. `a≠0`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553). *Needs:* 8.1, 8.2, 8.3, 8.5.

### 8.9 Coefficient equality from shift invariance

Prove `coefficient_eq_of_fourierInvariants`: Assume `a≠0`. Let A be any type and `B` a function from the native Fourier data pairs to A. Assume explicitly `B(S_{a,c,ℓ}(p))=B(p)` for every ℓ,p. If p and q have equal discriminant forms and coordinatewise congruent vector indices modulo 2a, then `B(p)=B(q)`.

`V=Z²` with its ordered coordinate basis and ordinary dot product; data are native pairs `p=(Q,R)`, `Q` a Z-valued quadratic form on `V` and `R∈V`. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, `a=m/N>0` and `c=N` for `j=0` or `c=1` for `j=1`. No positivity or nondegeneracy is imposed on `Q`. `a≠0`.

(BFH90, Proposition 2.2 proof, (2.9)–(2.10) and the paragraph defining `C_j`, pp.552–553). *Needs:* 8.1, 8.2, 8.7.

### 8.10 Siegel upper half-space of degree two

Define `SiegelSpace` as follows. `H₂` is the subtype of complex symmetric `2×2` matrices `Z` with native positive-definite real matrix `Im Z`. It has the induced topology and the complex-manifold structure on the three independent symmetric coordinates. The positivity condition is strict.

(BFH90, §1, p.546, definition of `H₂`).

- `SiegelSpace`: the subtype of complex symmetric `Z` with (`Im` Z).PosDef.
- The imaginary part `Y` of `Z`, a positive-definite real matrix.
- The base point `iI₂`.

**Checks.**

- `diag(i,2i)` belongs to `H₂`.
- `I₂` is not in `H₂`.
- [[i,1],[0,i]] is not in `H₂`.

### 8.11 Positive genus-two symplectic similitudes

Prove `positiveSimilitude_bfhCoordinates`, the coordinate dictionary for the supplied positive-similitude group in BFH's conventions: pairs `(g,μ)`, `g∈GL₄(ℝ)`, `μ>0`, with `gᵀJg=μJ` for `J=[[0,−I],[I,0]]`; multiplication multiplies both components and `μ=ν(g)` is determined by g. On `H₂`, `gZ=(AZ+B)(CZ+D)⁻¹`, `CZ+D` is invertible and `Im(gZ)=μ(C conjugate(Z)+D)⁻ᵀ Im(Z)(CZ+D)⁻¹`.

(BFH90, §1, pp.545–546, unnumbered `GSp⁺` definition and fractional-linear action). *Needs:* 8.10; AutomorphicFormsOnReductiveGroups §6.4.

- `positiveSimilitude_bfhCoordinates`: The supplied group has exactly the displayed BFH matrix relation; the BFH multiplier is the supplied multiplier and multiplies under products.
- `positiveSimilitude_bfhSymplectic`: The `μ=1` matrix relation agrees with `SymplecticGroup.mem_iff'`.

**Checks.**

- `2I₄` satisfies the relation with `μ=4`.
- `diag(I₂,−I₂)` has `μ=−1` and is excluded.
- `fractional(2I₄,iI₂)=iI₂`.

### 8.12 Positive similitude action on Siegel space

Define `siegelAction` as follows. Define the continuous left action of `GSp₄⁺(R)` on `H₂` by the fractional formula. The factor `d(g,Z)=det(CZ+D)/μ(g)` is nonzero, holomorphic in `Z`, satisfies `d(gh,Z)=d(g,hZ)d(h,Z)`, and equals 1 for positive scalar matrices.

(BFH90, §1, p.546, unnumbered fractional-linear action; §2, p.552, (2.7)). *Needs:* 8.11.

- `siegelAction_one`: 1 acts identically.
- `siegelAction_mul`: `(gh)Z=g(hZ)`.
- `siegelFactor_cocycle`: `d(gh,Z)=d(g,hZ)d(h,Z)`.
- `siegelAction_apply`: The underlying matrix of the native Siegel-space action is `(AZ+B)(CZ+D)⁻¹`, matching the raw block formula.

**Checks.**

- `2I₄` fixes `iI₂`.
- `n(I₂)` sends `iI₂` to `(1+i)I₂`.
- J sends `iI₂` to `iI₂ (JZ=−Z⁻¹)`.

### 8.13 Genus-two square-root double cover

Define `similitudeCover` as follows. The positive real cover consists of (g,h), `g∈GSp₄⁺(R)`, `h:H₂→C` continuous with `h(Z)²=d(g,Z)`. Multiplication is `(g,h)(g',h')=(gg',Z↦h(g'Z)h'(Z))`. Its projection is a continuous surjective homomorphism with kernel `{(1,1),(1,−1)}`. On `μ=1` compare it with the 2.4b intrinsic metaplectic double cover, preserving the central sign; positive scalars split by `h=1`.

(BFH90, §2, pp.552–554, (2.7)–(2.14); §8, p.601). *Needs:* 8.12; 2.4b.

- `similitudeCover_square`: `h(Z)²=d(g,Z)`.
- `similitudeCover_mul_root`: The root of the product at `Z` is `h(g'Z)h'(Z)`.
- `similitudeCover_kernel`: For `g=1`, the root is identically 1 or identically `−1`.

**Checks.**

- The constant roots 1 and `−1` are distinct lifts of the identity.
- `√(−det(iI₂))=1`.
- `√(−det(2iI₂))=2`, detecting the determinant rather than entrywise square root.

### 8.14 Compact stabilizer and positive scalar factor

Prove `compact_stabilizer`: Let `K=Sp₄(R)∩O₄(R)`. The stabilizer of `iI₂` in `Sp₄(R)` is `K`, `K≅U(2)` by `A+iB↦[[A,B],[−B,A]]`, and the stabilizer in `GSp₄⁺(R)` is `R_{>0}·K`. The Iwasawa representation `g=t n(X)diag(Q,Q⁻ᵀ)κ` with `t>0`, `Q` upper triangular with positive diagonal, `κ∈K` is unique.

(BFH90, §1, pp.548–549, (1.12)–(1.17)). *Needs:* 8.12.

### 8.15 BFH arithmetic subgroup

Define `arithmeticGamma` as follows. For `N>0`, `Γ_N` is the subgroup of `Sp₄(Z)` with `C≡0 mod N`, `A₂₁≡D₁₂≡0 mod N`. Conjugate by J to obtain the second cusp group. The elliptic lattices are `(λ,ρ)∈Z²×N⁻¹Z²` at cusp zero and `N⁻¹Z²×Z²` at cusp one; the center is fixed by `ψ_m(t)=e(mt)`.

(BFH90, §1, p.547, (1.6)–(1.9)). *Needs:* Layer 6.

- `arithmeticGamma_mem`: Membership has exactly the three printed block congruences.
- `arithmeticGamma_one`: Identity is a member for every `N`.
- `arithmeticGamma_upper`: `n(X)` is a member for each integral symmetric `X`.

**Checks.**

- `n([[0,1],[1,0]])∈Γ₈`.
- [[I,0],[I,I]] is not in `Γ₈`.
- `Γ₁` equals the native `Sp₄(Z)`.

### 8.16 BFH symplectic Jacobi slash operator

Define `bfhSlash` as follows. For `m∈Z` and `γ∈Sp₄(R)`, on functions `Φ(g,W)` define `(Φ|γ)(g,W)=e(−m Wᵀ(CZ_g+D)⁻¹CW) Φ(γg,(CZ_g+D)⁻ᵀW)`. This is the coordinate realization of the imported Layer 6 Jacobi action with central character `ψ_m`. The operator is restricted to the symplectic factor; extending it to similitudes requires scaling the central character.

(BFH90, §1, p.547, (1.1)). *Needs:* 8.12; Layer 6.

- `bfhSlash_one`: `Φ|1=Φ` on positive-similitude arguments.
- `bfhSlash_mul`: `(Φ|γ)|γ'=Φ|(γγ')`.
- `bfhSlash_fourier`: `Φ|J=e(−m Z_g⁻¹[W])Φ(Jg,Z_g⁻¹W)`.

**Checks.**

- The slash of the zero function is zero.
- At `γ=n(B)`, symmetric `B`, there is no quadratic multiplier and `W` is unchanged.
- At `g=I` and `γ=J`, the `W` argument is `−iW` and the multiplier is `e(mi WᵀW)`.

### 8.17 BFH elliptic translation operator

Define `bfhTranslate` as follows. Define `(Φ||[λ;ρ])(g,W)=e(m Z_g[λ]+2m Wᵀλ) Φ(g,W+Z_gλ+ρ)`, for real `λ,ρ`. For the order `(Φ||[λ;ρ])||[κ;ν]`, the operator at `[λ+κ;ρ+ν]` is multiplied by `e(2mνᵀλ)`. The lattice used by BFH kills this scalar because `N|m`. This is an explicit specialization of the Layer 6 Heisenberg central character, not a commutative translation action over arbitrary reals.

(BFH90, §1, p.547, (1.2)–(1.5)). *Needs:* 8.16; Layer 6.

- `bfhTranslate_zero`: Translation by [0;0] is identity.
- `bfhTranslate_comp`: The order `(Φ||[λ;ρ])||[κ;ν]` has central phase `e(2mνᵀλ)`.
- `bfhTranslate_linear`: Translation preserves pointwise addition.

**Checks.**

- At `m=8`, `ν=e₀/8`, `λ=e₀` the phase is `e(2)=1`.
- At `m=1`, `ν=e₀/4`, `λ=e₀` the phase is `−1`.
- At `m=1`, `λ=e₀`, `ρ=0`, `g=I`, `W=0`, translation of constant 1 is `exp(−2π)`.

### 8.18 BFH genus-two theta series

Define `genusTwoTheta` as follows. For positive integer a and `ν∈Z²`, specialize the Layer 6 theta kernel to `θᵃ_ν(Z,W)=Σ_{R∈Z², R≡ν mod 2a} e(Z[R]/(4a)+RᵀW)`. The series is normally convergent on `H₂×C²`. Its finite residue set is `(Z/(2a)Z)²`, of size `(2a)²`. No rank-one Jacobi-form definition is introduced here.

(BFH90, §2, p.551, (2.1)). *Needs:* 8.10; Layer 6.

- Residue invariance: `θᵃ_{ν+2aℓ}=θᵃ_ν`.
- Elliptic covariance: `θ(Z,W)=e(aZ[λ]+2aWᵀλ)θ(Z,W+Zλ+ρ)` for integral `λ,ρ`.
- Diagonal factorization: At `ν=0` and diagonal `Z`, `θ=∏i jacobiTheta₂(2aW_i,2aZ_ii)`.

**Checks.**

- `θᵃ_{−ν}(Z,−W)=θᵃ_ν(Z,W)`.
- `θ¹_(2,0)=θ¹_(0,0)`.
- `θ¹_0(iI₂,0)=jacobiTheta₂(0,2i)²`.

### 8.19 Half-integral matrix dictionary

Define `quadraticMatrix` as follows. For native Q:QuadraticForm `Z Z²`, put `A=Q(e₀)`, `C=Q(e₁)`, `B=Q(e₀+e₁)−A−C`. Define `T(Q)=[[A,B/2],[B/2,C]]` in `M₂(Q)`. This identifies native integral quadratic forms with symmetric rational matrices having integral diagonal and twice-integral off-diagonal. `Q(x)=xᵀT(Q)x` for integral x.

(BFH90, §2, pp.551–553, (2.2),(2.9)).

- `quadraticMatrix_symmetric`: `T(Q)` is symmetric.
- `quadraticMatrix_eval`: For integral x, `xᵀT(Q)x=Q(x)`.
- `quadraticMatrix_injective`: The matrix dictionary is injective.

**Checks.**

- `T(x₀x₁)=[[0,1/2],[1/2,0]]`.
- `T(x₀²)=diag(1,0)`.
- `T(−x₀²)=diag(−1,0)`; no positivity condition is included.

### 8.20 BFH Fourier coefficient extraction

Define `fourierCoefficient` as follows. For `j=0` or 1, define `B_j(g;T,R)=N^(−3j)∫_{[0,N^j)^3}∫_{[0,1)^2} Φ_j(n(X)g,W)e(−N^(−j)tr(T(Z_g+X))−N^(1−j)RᵀW)dW dX`. `X=[[x₄,x₃],[x₃,x₁]]`, `T` is the half-integral matrix of `Q`, `R∈Z²`, and both measures are coordinate Lebesgue measures. The coefficient excludes the exponential in `Z_g`; it is not the unnormalized torus Fourier integral.

(BFH90, §2, pp.551–553, (2.2)–(2.3)). *Needs:* 8.19, 8.16, 8.17.

- `fourierCoefficient_zero`: The zero function has every coefficient zero.
- `fourierCoefficient_add`: Extraction is additive for integrable summands on the boxes.
- `fourierCoefficient_scalar`: Extraction commutes with complex scalar multiplication.

**Checks.**

- For constant 1, the coefficient at `Q=0,R=0` is 1 at both cusps.
- For `Φ(g,W)=e(N^(1−j)RᵀW)`, `Q=0` and matching `R`, the coefficient is 1.
- For constant 1 and nonzero `R`, the coefficient at `Q=0` is 0 `(N>0)`.

### 8.20a Genus-two theta normal convergence

Prove `theta_normal_convergence`: For `a>0`, on every compact subset of `H₂×C²` the `θ_{a,ν}` series and all coordinate derivatives converge absolutely and uniformly. Hence `θ` is jointly holomorphic and termwise differentiation, residue-class regrouping and compact-torus integration are valid. The bound uses the least eigenvalue of `Im Z` uniformly bounded below and bounded `Im W`.

(BFH90, §2, pp.551–553, definition of `θ` and Proposition 2.1). *Needs:* 8.18, 8.10; Layer 2.

### 8.21 Gaussian orthogonality of genus-two theta series

Prove `theta_pairing`: For `a>0`, `Z=X+iY∈H₂` and `μ,ν∈Z²`, the Lebesgue integral over `C²/(Z Z²+Z²)` of `θᵃ_μ(Z,W) conjugate(θᵃ_ν(Z,W)) exp(−4πa Y⁻¹[Im W])` is `√det(Y)/(4a)` if `μ≡ν mod 2a`, and zero otherwise. In `W=Zλ+ρ` coordinates the measure is `det(Y)dλdρ` on `[0,1)^4`.

(BFH90, Proposition 2.1, p.551). *Needs:* 8.18, 8.20a.

Integrating first in `ρ` eliminates unequal lattice indices. For equal residues the remaining translates of `λ` tile `R²`, and the integrand is `exp(−4πa λᵀYλ)`. Its integral is `1/(4a√det Y)`; multiplication by the Jacobian `det Y` gives the stated norm. This computation corrects the displayed factor in BFH Proposition 2.1 for the stated Lebesgue measure.

**Checks.**

- At `a=1,Z=iI₂` the diagonal norm is 1/4; a denominator 2a would give the wrong value 1/2.
- At `a=2,Z=iI₂` the diagonal norm is 1/8, detecting the index scaling.
- At `a=1,Z=iI₂`, `μ=(0,0),ν=(1,0)`, the pairing is zero.

### 8.21a BFH Jacobi coordinate space

Define `bfhJacobiFunctions` as follows. Specialize the Layer 6 Jacobi space to smooth `Φ_j:GSp₄⁺(R)×C²→C`, holomorphic in `W`, invariant under `Γ_N` for `j=0` or `J⁻¹Γ_NJ` for `j=1`, and under `||[N^−jℓ;N^(j−1)r]` for integral ℓ,r. For vector values impose these conditions after every continuous linear functional. Supply the Layer 6 weight and multiplier separately; lattice invariance does not determine them.

(BFH90, §1, p.547, (1.6)–(1.9)). *Needs:* 8.15, 8.16, 8.17; Layer 6.

- `bfhJacobiFunctions_zero`: The zero coordinate function belongs.
- `bfhJacobiFunctions_translation`: Every member satisfies its scaled elliptic lattice law.
- `bfhJacobiFunctions_fourier_cusp`: Slash by J transports cusp zero to cusp one.

**Checks.**

- Zero belongs for `N=8,m=16` at each cusp.
- Constant 1 belongs at index `m=0`.
- Constant 1 is excluded at `N=8,m=16`.

### 8.22 Holomorphic contour shift for Fourier coefficients

Prove `coefficient_shift_analytic`: If `Φ_j` is continuous, smooth in g, holomorphic in `W`, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys `B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ)`, `λ∈N^(−j)Z²`. Hence the retained coefficient-invariants theorem applies with `a=m/N` and `c=N^(1−j)`.

(BFH90, §2, pp.552–553, (2.9)). *Needs:* 8.20, 8.17, 8.1, 8.9, 8.21a.

### 8.22a BFH theta component projection

Define `thetaComponent` as follows. For `a=m/N>0`, define `E_j(g;ν)` by the orthogonal projection of the coordinate function onto `θᵃ_ν` at `Z′=N^(1−2j)Z_g`, `W′=N^(1−j)W`, divided by its norm `√det(Im Z′)/(4a)`. Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition theorem.

(BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6)). *Needs:* 8.21, 8.18.

- `thetaComponent_zero`: Zero function has component zero.
- `thetaComponent_residue`: Components only depend on `ν mod` 2a.
- `thetaComponent_scalar`: Scaling the Jacobi coordinate function scales its Gaussian component projection.

**Checks.**

- Projecting `θᵃ_μ` yields 1 at congruent `ν` and 0 otherwise.
- The component of the zero coordinate function is zero.
- At `N=8,a=2,j=1`, the residue vectors (0,5) and (0,1) give the same component.

### 8.22b Theta-component Fourier coefficients

Define `thetaCoefficient` as follows. `C_j(g;U,ν)` is the Fourier coefficient `B_j(g;T,ν)` with `T=(U+N^(2−j)ννᵀ)/(4m)`; set it to zero if this is not an integral quadratic form, equivalently a half-integral symmetric matrix. This coefficient is defined before imposing Jacobi invariance. For the actual BFH family, the shift theorem makes the residue choice independent.

(BFH90, §2, pp.552–553, before Proposition 2.2). *Needs:* 8.19, 8.20, 8.22.

- `thetaCoefficient_recovered`: If `U=4mT−N^(2−j)ννᵀ`, recover `B_j(g;T,ν)`.
- `thetaCoefficient_zero`: The zero coordinate function has zero `C_j`.
- `thetaCoefficient_scalar`: `C_j(cΦ)=cC_j(Φ)`.

**Checks.**

- All theta Fourier coefficients of zero vanish.
- For `N=8,m=16,j=1,U=I,ν=0` the coefficient is zero for any coordinate function.
- At `N=8,m=16,j=1,U=diag(0,56),ν=(0,1)`, the recovered index is `T=diag(0,1)`.

### 8.23 BFH two-cusp theta decomposition

Prove `theta_decomposition`: Under the Jacobi regularity and lattice hypotheses above, there are unique components `E_j(g;ν)`, `ν mod` 2a, satisfying `Φ_j(g,W)=Σν E_j(g;ν) θᵃ_ν(N^(1−2j)Z_g,N^(1−j)W)`. Put `C_j(g;U,ν)=B_j(g;T,ν)` if `T=(U+N^(2−j)ννᵀ)/(4m)` is half-integral, and 0 otherwise. Then `E_j(g;ν)=Σ_{U integral symmetric} C_j(g;U,ν)e(tr(UZ_g)/(4mN^j))`, with the convergence inherited from the Fourier expansion.

(BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6)). *Needs:* 8.21, 8.22, 8.7, 8.8, 8.22a, 8.22b, 8.21a, 8.20a; Layer 6.

### 8.24 Genus-two theta Fourier transform

Prove `GenusTwo.theta_fourier_transform`: For `a>0` and `Z∈H₂`, `θᵃ_ν(−Z⁻¹,Z⁻¹W)=e(aZ⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod2a} e(−νᵀμ/(2a))θᵃ_μ(Z,W)`. The holomorphic branch `√(−det Z)` is positive when `Z=iY`. The finite Fourier matrix has square equal to residue negation after normalization by 1/(2a).

(BFH90, §2, p.554, (2.12)–(2.13)). *Needs:* 8.18; Layer 2; Layer 6.

**Checks.**

- At `Z=iI₂`, `a=1`, `W=0`, `ν=0` the left side is `θ(2i)²` and the right side is `½Σ_{μ mod2}θ¹_μ(iI₂,0)=½θ(i/2)²`, where `θ` is Mathlib's `jacobiTheta`; they agree by the one-variable inversion `θ(i/2)=√2θ(2i)`. A factor 1/a in place of 1/(2a) doubles the right side.
- The Fourier matrix `(2a)⁻¹(e(−νᵀμ/(2a)))` squared is the permutation `ν↦−ν` of `(ℤ/2aℤ)²`; at `a=1` it fixes every residue, since `−ν≡ν mod 2`.
- With `W` replaced by `Z⁻¹W` but without the factor `e(aZ⁻¹[W])`, the two sides differ already at `Z=iI₂`, `a=1`, `W=(1,0)`, where `Z⁻¹[W]=−i` and that factor is `e(−i)=e^{2π}≠1`.

### 8.25 Fourier law for BFH theta components

Prove `theta_component_fourier_law`: For `Φ₁=Φ₀|J` and `a=m/N`, `E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ)`, and `E₀(g;ν)=N²√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ)`. Both sums are over `(Z/(2a)Z)²`. The forward rescaling `Z↦Z/N` contributes `N⁻¹` relative to the normalized finite theta transform; the reverse rescaling `Z↦NZ` contributes N. The opposite finite Fourier signs are inverse transforms, and the fixed root branches satisfy `√(−det Z)√(−det(−Z⁻¹))=1`. With `J²=−I`, the double slash sends `(g,W)` to `(−g,−W)`; transport `θ_ν(Z,−W)=θ_{−ν}(Z,W)` when identifying the components. The BFH K-type is trivial on `−I`, so the resulting action on its component family agrees with this central and residue transport.

(BFH90, Proposition 2.2, p.552, (2.7)–(2.8)). *Needs:* 8.23, 8.24, 8.16, 8.22a, 8.21a.

**Checks.**

- At `g=1,Z=iI₂,N=8,m=16`, the forward factor is `1/32`, the reverse factor is 2, and the Fourier product contributes 16; their composite is 1.
- With both prefactors `1/(2m)`, the same composite is `1/64`, contradicting any nonzero component.
- The unnormalized finite transform with the same negative sign twice gives `(2a)²` times residue negation; with opposite signs it gives `(2a)²` times the identity. These match the two identifications of the `J²` action above.

### 8.28a BFH arithmetic datum

Define `BFHDatum` as the structure bundling: positive integers `N`, m, `M` and an even integer `k≥2` with 8M∣N, N∣m and `4m∣N²`; a normalized holomorphic newform f of weight k, trivial character and conductor `M`, with Fourier coefficients `a(n)`; its Fricke transform `f̂(τ)=τ^(−k)f(−1/(Nτ))` at the auxiliary level `N`; a continuous finite-dimensional representation `σ` of `K=U(2)`, trivial on `−I`, with a vector v satisfying `vσ(κ)=ρ_k(κ)v` for `κ∈SO(2)`; and, for scalar statements, a continuous linear functional `T` on the space of `σ`. The seed (8.29), the section family (8.30), the Jacobi Eisenstein series (8.31), its Fourier coefficients (8.20, 8.22b) and theta components (8.22a), the Dirichlet series (8.66–8.67) and the Whittaker expansions (8.68–8.69) are all built from one BFH datum, and the theorems of 8.63–8.87 are statements about those objects, not about independent functions of the displayed variables. The newform's own completion uses its conductor `M`; the Fricke transform uses `N`.

(BFH90, §1, pp.547–550, (1.11)–(1.16), and the standing assumptions of §§5–7). *Needs:* 8.14; ModularForms Layer 4; ModularForms Layer 6; AutomorphicLFunctionsAndLocalFactors AL.2 (`GL₂` newvectors).

- `BFHDatum.level_dvd`: 8M∣N, N∣m and `4m∣N²`.
- `BFHDatum.newform`: f is a normalized newform of weight k, trivial character and conductor `M`.
- `BFHDatum.ktype`: v transforms under `SO(2)` by `ρ_k`, and `σ` is trivial on `−I`.

**Checks.**

- `M=1`, `N=8`, `m=16`, `k=12` with `f=Δ` is a datum: 8∣8, 8∣16 and 64∣64.
- `N=8`, `m=24` is not: N∣m holds but `4m=96` does not divide `N²=64`.
- `k=3` admits no datum: on `Γ₀(M)` with trivial character, `−I` acts on weight-k forms by `(−1)^k`, so every odd-weight form is zero and no normalized newform exists.

### 8.29 Elliptic-newform section on genus-two similitudes

Define `bfhSeed` as follows. For the normalized even-weight `k≥2` newform f of level `M`, `8M|N`, put `f̂(τ)=τ^−k f(−1/(Nτ))` and `F(Q)=f̂(Qi)(ci+d)^−k det(Q)^(k/2)`. Given continuous finite-dimensional right K-type `σ` trivial on `−I` and `vσ(κ)=ρ_k(κ)v` on `SO(2)`, define `I(t n(X)diag(Q,Q^−ᵀ)κ)=F(Q)vσ(κ)`. Iwasawa uniqueness makes this well defined; positive scalars act trivially. The original newform’s completion uses conductor `M`.

(BFH90, §1, pp.547–550, (1.11)–(1.16)). *Needs:* 8.14; AutomorphicFormsOnReductiveGroups §§7.2–7.3; ModularForms Layer 4; ModularForms Layer 6; AutomorphicLFunctionsAndLocalFactors AL.2 (`GL₂` newvectors).

- `bfhSeed_identity`: `I(I₄)=F(I₂)v`.
- `bfhSeed_zero`: `F=0` gives `I=0`.
- `bfhSeed_scalar`: Scaling `F` scales I.

**Checks.**

- `F(I₂)=1` implies `I(I₄)=v`.
- `v=0` gives `I=0`.
- `I(2I₄)=I(I₄)`.

### 8.30 BFH normalized section family

Define `inducedSeedFamily` as follows. For the seed I, set `I_s(g)=det(Im Z_g)^(s/2) I(g)`, using the positive-real logarithm, `g∈GSp₄⁺(R)`. This is the precise BFH parameter s; no shift to a generic spectral parameter is implicit. The Levi exponent and positive-scalar behavior determine the comparison with normalized induced spaces.

(BFH90, §1, p.549, (1.17)). *Needs:* 8.29, 8.12.

- `inducedSeedFamily_zero`: `I₀=I`.
- `inducedSeedFamily_add`: `I_(s+t)=det(Y)^(t/2) I_s`.
- `inducedSeedFamily_holomorphic`: For each positive g the section is entire in s.

**Checks.**

- At `g=I₄` the section is `I(I₄)` for every s.
- At `diag(2I₂,(1/2)I₂)` the scalar is `4^s`.
- A zero seed yields the zero family.

### 8.31 Genus-two Jacobi Eisenstein series

Define `jacobiEisenstein` as follows. For the genuine elliptic-newform seed, define `E_s(g,W)=Σ_{γ∈(P∩Γ_N)\Γ_N} Σ_{λ∈Z²} (I_s||[λ;0])|γ(g,W)`, where P consists of `n(X)diag(Q,Q⁻ᵀ)` with `detQ>0`. The sum is initially defined in a right half-plane of s. For finite-dimensional vector values use the original seed, not a scalar replacement; continuous linear functionals commute with convergent sums. Its theta components are genuine half-integral-weight automorphic forms on the double cover.

All objects here are built from one BFH datum (8.28a).

(BFH90, §1, p.549, definition of `E_s`). *Needs:* 8.30, 8.15, 8.16, 8.17, 8.28a; Layer 6.

- `jacobiEisenstein_zero`: Zero seed gives zero series.
- `jacobiEisenstein_scalar`: Scaling the seed scales the series.
- `jacobiEisenstein_summand`: The identity `coset,λ=0` summand is `I_s(g)`.

**Checks.**

- Every coefficient of the zero-seed `E_s` is zero.
- At `g=I,W=0` the `identity-coset,λ=0` summand is `I(I)`.
- At `g=I,W=0,m=1,λ=e₀` the identity-coset summand is `exp(−2π)I(I)`.

### 8.32 Genus-two archimedean Whittaker functions

Define `whittakerFunction` as follows. For `k≥2` even and a continuous finite-dimensional complex right K-representation σ with weight-k vector v, define the vector-valued `W^ε(y₁,y₂;s)=(y₁y₂)^(4−s)y₂^(k/2)∫_{R³} √(−det(X+iI))/|det(X+iI)|^s e(εy₁x₁)e(y₂(x₂'+iy₂'))(y₂')^(k/2)vσ(κ(X))dX`. Here `ε=+1,−1` or 0, `X=[[x₄,x₃],[x₃,x₁]]`, `x₂'=−x₃(x₁+x₄)/(1+x₁²+x₃²)`, `y₂'=√(1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)²)/(1+x₁²+x₃²)>0`. `κ(X)` is uniquely specified by (3.2) with Q' positive triangular and the root is 1 at `X=0`. `ε=0` is the degenerate `W⁰`. All these W-functions take values in the representation space of σ. For a continuous linear functional T define the scalar function `W_T^ε=T(W^ε)` and `φ(κ)=T(vσ(κ))`. Actions such as `W^εσ(κ₀)` occur before T; its scalarization is the integral with `φ(κ(X)κ₀)`, rather than the scalar W acted on by σ. Continuous linear functionals commute with the convergent integrals and sums, and these equalities persist under unique analytic or meromorphic continuation. Use the same vector-first convention for the two-parameter V and W, F, τ, M and M̃; a subscript T always denotes their scalarization.

(BFH90, §3, pp.557–559, (3.1)–(3.8)). *Needs:* 8.14, 8.29, 8.13.

- `whittakerFunction_zero`: `v=0` implies `W=0`; `φ=0` implies `W_T=0`.
- `whittakerFunction_scalar`: Scaling v scales W, and scaling T scales `W_T`.
- `whittakerFunction_degenerate_scale`: `W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s)`.

**Checks.**

- `W_T^+` of the zero matrix coefficient is zero.
- At `X=0` the vector kernel is `exp(−2πy₂)v`; applying T with `T(v)=1` gives the scalar `exp(−2πy₂)` for every sign.
- `W⁰(2,y₂;s)=2^(4−s)W⁰(1,y₂;s)`.

The scalarization checks also distinguish the order of operations: on `Sym²(ℂ²)`, let T extract the `e₁²` coefficient. Then `T(e₂²)=0`, whereas applying the compact swap before T gives `T(e₁²)=1`. The scalar 0 cannot carry the missing compact action. For `T=0` every scalar transform is zero while its vector transform need not vanish; applying T to the two-parameter specialization gives exactly `W_T(s,k/2)=W_T(s)`.

### 8.33 Three-variable Whittaker majorant

Prove `whittaker_majorant`: Put `D(X)=1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)²`. The positive function `D(X)^−α(1+x₁²+x₃²)^−β(1+x₁²)^−γ` is integrable on `R³` if `α>1/2`, `2α+β>3/2` and `α+β+γ>1`. These are sufficient conditions; no necessity assertion is made.

(BFH90, §3, p.559, Proposition 3.1). *Needs:* 8.32.

### 8.34 Whittaker integral convergence

Prove `whittaker_initial_convergence`: For `k≥2` even, a continuous finite-dimensional BFH K-type `σ`, weight-k v, `ε∈{−1,0,1}`, `y₁,y₂>0`, the vector integral defining `W^ε` is absolutely convergent for `Re s>2`, locally uniformly with derivatives in s on compact subsets of that half-plane. Every continuous linear T commutes with it and its parameter derivatives, giving the scalar kernel with `φ(κ)=T(vσ(κ))`.

(BFH90, §3, p.559, Proposition 3.2). *Needs:* 8.33, 8.29.

### 8.35 Two-parameter Jacquet integral

Define `jacquetTwoParameter` as follows. For the BFH K-type, let `F_v(n(E(x₂))m(Y)κ)=|det Y|^s y₂^r vσ(κ)`, `Y=√y₁ diag(y₂,1)`. Define `V^ε(y₁,y₂;s,r)= (−1)^(k/2)y₁^(4−s)y₂^(5−r−s)∫_{R×R³} F_v(Jm(E(x₂))n(X))√(−det(X+iI))e(εy₁x₁)e(y₂x₂)dX dx₂`. Set `W^ε(s,r)=π^−r Γ(r+k/2)V^ε(s,r)`. The section is homogeneous exactly as (3.11); both integrals are initially interpreted in their absolute-convergence chamber.

(BFH90, §3, pp.559–561, (3.11)–(3.15)). *Needs:* 8.32, 8.29.

*Proof input.* BFH quote Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent integrals. The facts used are the Euler tail-integral representation of `W_{κ,μ}`, its order symmetry `W_{κ,−μ}=W_{κ,μ}` and its decaying normalization, all on the positive real axis; AutomorphicSpectralTheory §0.26 supplies them (`eulerIntegral`, `whittaker_w_order_symm`, `decayingNormalization`), with the asymptotics of §0.28, after the substitution that brings the integral here to the Euler form.

- `jacquetTwoParameter_linear`: Scaling v scales the vector V and W; scaling T scales only their scalarizations; additive linearity is asserted in a common convergence chamber and then by analytic continuation.
- `jacquetTwoParameter_normalization`: `W(s,r)=π^−r Γ(r+k/2)V(s,r)`.
- `jacquetTwoParameter_specialize`: For `Re s>(3+k)/2` and `r=k/2`, `W(s,r)=W(s)`.

**Checks.**

- `v=0` gives `V=W=0`.
- At `k=2,r=1` the normalizing factor is `π^−1 Γ(2)=π^−1`.
- The special-function factor becomes `y^(k/2)e^−y/2` at `r=k/2`, retaining the k/2 exponent.

### 8.36 Jacquet reflection in the auxiliary parameter

Prove `jacquet_r_reflection`: The V-family continues analytically to `Re(s+r)>5/2` and `Re(s−r)>3/2`. Its gamma-normalized W-family satisfies `W^ε(s,r)=W^ε(s,1−r)`. At `r=k/2` and `Re s>(3+k)/2` this is the original Whittaker function. This uses the classical identity `W_{κ,μ}=W_{κ,−μ}` and its specialization `W_{k/2,(1−k)/2}(y)=y^(k/2)e^−y/2`.

(BFH90, §3, pp.560–561, Proposition 3.3). *Needs:* 8.35.

*Proof input.* BFH quote Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent integrals. The facts used are the Euler tail-integral representation of `W_{κ,μ}`, its order symmetry `W_{κ,−μ}=W_{κ,μ}` and its decaying normalization, all on the positive real axis; AutomorphicSpectralTheory §0.26 supplies them (`eulerIntegral`, `whittaker_w_order_symm`, `decayingNormalization`), with the asymptotics of §0.28, after the substitution that brings the integral here to the Euler form.

### 8.37 Gamma-normalized Jacquet Weyl relation

Prove `jacquet_weyl_reflection`: On a torus weight-n component, or after scalarization with `φ(θ_tκ)=e^−intφ(κ)`, put `V̂^ε=2^−sπ^−sΓ(A_ε)Γ(B_ε)V^ε`, with `A_ε=(s−r+εn+(ε−1)/2)/2` and `B_ε=(s+r+εn+(ε+1)/2)/2`. Use these gamma factors from the explicit evaluations (3.26)–(3.27). Prove `V̂^ε(s,r)=V̂^ε(r+3/2,s−3/2)`, meromorphically at gamma poles. `V` continues analytically for `Re r>1/2`, `Re s>2`. Torus decomposition can change the `SO(2)` weight.

(BFH90, §3, p.562, Proposition 3.4, (3.18)–(3.19); pp.563–565, (3.26)–(3.27) and explicit V̂ displays). *Needs:* 8.36.

*Proof input.* BFH quote Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent integrals. The facts used are the Euler tail-integral representation of `W_{κ,μ}`, its order symmetry `W_{κ,−μ}=W_{κ,μ}` and its decaying normalization, all on the positive real axis; AutomorphicSpectralTheory §0.26 supplies them (`eulerIntegral`, `whittaker_w_order_symm`, `decayingNormalization`), with the asymptotics of §0.28, after the substitution that brings the integral here to the Euler form.

### 8.38 Whittaker holomorphy beyond convergence

Prove `whittaker_continuation`: For the BFH weight-k matrix coefficients and either `ε=±1`, `W^ε(y₁,y₂;s)` has a holomorphic continuation to `Re s>3/2`. Its initial integral need not be absolutely convergent throughout this domain. At `s=2` the apparent gamma singularities from the two-parameter reflections cancel.

(BFH90, §3, pp.565–566, Proposition 3.5). *Needs:* 8.34, 8.36, 8.37.

### 8.39 Whittaker decay in both positive variables

Prove `whittaker_rapid_decay`: On compact parameter sets in `Re s>3/2`, for `ε=±1` there are `C` and a Schwartz function `ξ` on `R²` with `||W^ε(y₁,y₂;s)||≤(y₁y₂)^−C ξ(y₁,y₂)`, `y₁,y₂>0`; the corresponding differentiated estimates hold where the convolution argument applies. The degenerate `W⁰` does not have this two-variable decay conclusion.

(BFH90, §3, pp.566–567, Proposition 3.6). *Needs:* 8.38; AutomorphicSpectralTheory §1.3; AutomorphicFormsOnReductiveGroups §§0.3–0.4.

*Proof input.* BFH Propositions 3.5–3.6 take the rapid decay of nondegenerate Whittaker functions of compact convolutions, and the polynomial bound in the degenerate case, from Jacquet–Piatetski-Shapiro–Shalika §8.3.3. The specialization to the K-type of 8.32, with derivatives in both variables, is part of this target.

### 8.40 Degenerate Whittaker continuation and decay

Prove `degenerate_whittaker_continuation`: `W⁰` continues holomorphically to `Re s>3/2`. For each fixed `y₁>0` and compact parameter sets it decreases rapidly as `y₂→∞`, with polynomial control at `y₂→0`; `W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s)`. No rapid decay in `y₁` follows, because its `x₁` character is trivial.

(BFH90, §3, pp.574–576, Proposition 3.14, (3.46)–(3.47)). *Needs:* 8.34, 8.35.

### 8.41 Whittaker test coefficient algebra

Define `testCoefficientAlgebra` as follows. Let `R_k` span the finite `U(2)` matrix coefficients of `SO(2)` weight k and trivial `−I` action, with uniform-topology closure. The weight-zero coefficients `φ₁=detB=|det(X+iI)|⁻¹`, `φ₂=(det(X)²−1)x₁/|det(X+iI)|⁴`, `φ₃=x₃(1−detX)/|det(X+iI)|²` preserve `R_k` by multiplication. They extend globally as compact-group coefficients. In the `U(2)` model `φ₁(q)=det(Im q)` can change sign; `φ=φ₁ψ` must hold on all `K`, including the chart boundary.

(BFH90, §3, pp.567–569, Propositions 3.7–3.8). *Needs:* 8.32; RepresentationTheory/CompactGroups Layer 5.

- `testCoefficientAlgebra_mul`: `R₀R_k⊆R_k` via tensor product of K-types.
- `testCoefficientAlgebra_dense`: `R_k` is dense in continuous weight-k compact-group functions.
- `testCoefficientAlgebra_chart`: The three global coefficients have the displayed chart formulas.
- `globalTestPhi1_chart`: The global polynomial `det(Im q)` restricts to the positive testPhi1(X) on `κ(X)`.
- `globalTestPhi1_rotated`: The right-rotated global value is `(1+zx₁)φ₁(X)/Δ_z`, retaining its sign on both branches.

**Checks.**

- The chart values at zero are (1,0,0).
- At `(x₁,x₃,x₄)=(1,0,0)`, `φ₂=−1/4`.
- At (0,1,0), `φ₃=1/2`.
- For `X=diag(0,−2),z=1`, the global coefficient at `κ(X)κ_z` is `−1/√10`, whereas the positive chart coefficient at `X(z)=diag(0,3)` is `+1/√10`. They cannot be identified without the compact transition.

### 8.42 Bounded holomorphic strip for test coefficients

Prove `test_coefficient_strip`: Every finite matrix coefficient h, including its right translate by `κ₀∈K`, admits a bounded holomorphic extension in `x₁` on `|Im x₁|≤ε`, uniformly for real `x₃,x₄` and `κ₀`, for each `0<ε<1`. This includes polynomials in `φ₁,φ₂,φ₃` and suffices for the upward contour shift in (3.41). The printed one-sided region includes the singularity `−i` and is false.

(BFH90, §3, p.568, Proposition 3.9; p.571, (3.41)). *Needs:* 8.41.

### 8.43 Rotated Whittaker scalar estimate

Prove `rotated_whittaker_bound`: Let `κ_z` correspond to `diag(1,(1−iz)/Δ_z)`, `Δ_z=√(1+z²)`, and let `φ∈R_k` be globally divisible by `φ₁`. Use `φ(κ(X)κ_z)` and the full `(y₁y₂)^(4−s)y₂^(k/2)` prefactor in (3.38). Prove absolute convergence for `Re s>3/2` and the bound `C′y₁^(4−Re s)` for `y₂>C,y₁>0,z∈R`, locally uniformly in s. The global divisor vanishes at `1+zx₁=0`. Elsewhere `φ₁(κ(X)κ_z)=(1+zx₁)φ₁(X)/Δ_z`, whereas `φ₁(X(z))=|1+zx₁|φ₁(X)/Δ_z`. Establish the compact transition on both signs; the blanket chart equality (3.31) does not supply this proof.

(BFH90, §3, pp.569–571, Proposition 3.10, (3.31)–(3.39)). *Needs:* 8.42, 8.38.

*Proof input.* The bound must hold across the boundary `1+zx₁=0` between the two charts: write the rotation as one compact-valued function of `(z,x₁)` on all of `ℝ²` before estimating, since the formula on the chart `1+zx₁>0` alone does not give the bound on the other side.

### 8.44 Novodvorsky Mellin transform

Define `novodvorskyTransform` as follows. For `ε=±1` in a proved initial convergence chamber for the vector kernel, first define the vector-valued `F^ε(u,s;y₂)=∫_{y₁>0}∫_{z∈R} W^ε(Δ_z^−2 y₁,Δ_z y₂;s)σ(κ_z) e(−ε y₁z/(1+z²)) y₁^(u−3/2)√(1+iz)` dz `dy₁/y₁`, with the continuous root equal to 1 at `z=0`. Define `F_T^ε=T(F^ε)` in the initial chamber. All continuation and nonvanishing assertions with a specified test coefficient concern this scalarization; apply T exactly once, after the compact action. This is an iterated integral in that order; substituting the `R³` kernel does not give a jointly absolutely convergent integral.

(BFH90, §3, p.570, (3.37); pp.571–574, Propositions 3.11–3.12). *Needs:* 8.43.

- `novodvorskyTransform_zero`: A zero vector gives F=0; the zero matrix coefficient gives `F_T=0`.
- `novodvorskyTransform_scalar`: The vector F is linear in v, and `F_T` is linear in the matrix coefficient.
- `novodvorskyTransform_sign`: The `+` Whittaker function uses `e(−y₁z/(1+z²))`; the `−` one uses its inverse.

**Checks.**

- `F` of zero vanishes for both signs.
- At `z=0` the extra square-root factor is 1.
- At `y₁=z=1`, the two oscillatory factors both equal `−1`.

### 8.45 Novodvorsky analytic continuation

Prove `novodvorsky_continuation`: For `φ(κ)=T(vσ(κ))` globally divisible by `φ₁`, the scalar Novodvorsky transforms `F_T^ε` continue holomorphically for `Re s>3/2` and `Re(u−s+5/2)>0`, initially agreeing with the iterated integral for `Re u` large. The `large-y₁` tail uses nondegenerate rapid decay and the `small-y₁` tail uses Proposition 3.10. This assertion is not joint absolute convergence of the expanded `R³×R×R₊` kernel.

(BFH90, §3, pp.571–574, Propositions 3.11–3.12). *Needs:* 8.44, 8.43, 8.39.

### 8.46 Rank-zero Laplace coefficient

Define `tauTransform` as follows. Define `τ(s,y₂;v,σ)=∫_R Δ_z^(−s+k/2)e^(−2πy₂Δ_z)√(1+iz)vσ(ηw^−1κ_z wJ)dz`, where `η,w,J` are exactly the compact matrices in §1 and (3.40). It is the rank-zero boundary contribution, distinct from the degenerate `W⁰` term. Apply `T` only after forming the vector-valued integral.

(BFH90, §3, p.571, (3.39)–(3.41)). *Needs:* 8.29, 8.44.

- `tauTransform_zero`: Zero v gives `τ=0`.
- `tauTransform_scalar`: Scaling v scales τ; scaling T scales its scalarization `τ_T=Tτ`.
- `tauTransform_holomorphic`: For `y₂>0` the coefficient is entire in s.

**Checks.**

- `τ` of the zero coefficient is zero.
- The scalar integrand factor at `z=0` is `e^−2πy₂`.
- For `k=2,s=1` the `Δ_z` power is zero.

### 8.47 Degenerate boundary Mellin coefficients

Define `degenerateMellinCoefficients` as follows. Define `M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz` and `M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz`. Both use exponent `2s−8` in (3.48)–(3.49), and converge for `Re s>3/2` by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.

(BFH90, §3, p.576, (3.48)–(3.49)). *Needs:* 8.40, 8.44, 8.41.

- `degenerateMellinCoefficients_linear`: M and M̃ are vector-valued and linear in v; `M_T=TM` and `M̃_T=TM̃` are linear in T as well.
- `degenerateMellinCoefficients_holomorphic`: Both are holomorphic for `Re s>3/2` at fixed `y₂>0`.
- `degenerateMellinCoefficients_kernel`: The multiplier is `Δ_z^(2s−8)√(1+iz)`.

**Checks.**

- Zero v gives `M=M̃=0`.
- At `s=2` the `Δ_z` multiplier is `(1+z²)^−2`.
- At `z=0` the additional multiplier is 1.

### 8.48 Nonzero Novodvorsky tests with vanishing rank zero

Prove `local_test_nonzero_f`: For each even `k≥2` and (u,s) with `Re s>3/2`, `Re(u−s+5/2)>0`, construct finite-dimensional `σ`, weight-k v and `T` with continued `TF⁺,TF⁻` analytic on that domain and `Tτ≡0`. For each sign separately find `y₂^ε>0` with `TF^ε(u,s,y₂^ε)≠0`. A coefficient divisible by `φ₁φ₂` suffices; the two `y₂` need not agree.

(BFH90, §3, pp.573–574, Proposition 3.12). *Needs:* 8.45, 8.46, 8.41.

### 8.49 Nonzero rank-zero test

Prove `local_test_nonzero_tau`: For each `Re s>3/2` there exist actual finite-dimensional `σ`, weight-k v, `T` and `y₂>0` with `Tτ(s,y₂)≠0`, while both `TF^±` have the continuation domain of Proposition 3.12. Choose `φ` divisible by `φ₁` and nonzero on the rank-zero chart. No simultaneous F-nonvanishing is asserted in this proposition.

(BFH90, §3, p.574, Proposition 3.13). *Needs:* 8.45, 8.46, 8.41.

### 8.50 Nonzero degenerate residue test

Prove `local_test_nonzero_m`: There exist finite-dimensional `σ`, weight-k v, `T` and `y₂>0` such that `TF^±` have the Novodvorsky continuation, `TM(2,y₂)≠0` and `Tτ` is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.

(BFH90, §3, p.577, Proposition 3.15). *Needs:* 8.47, 8.45, 8.46, 8.41.

*Proof input.* BFH Proposition 3.15 is stated without proof; this target supplies it by exhibiting a matrix coefficient in the algebra of 8.41 whose degenerate residue is a nonzero Bessel transform, evaluated through AutomorphicSpectralTheory §0.27.

### 8.51 Similitude action on the Jacobi group

Prove `similitude_heisenberg_comparison`: On `H(W)=W×R` with central term `ω(w,w′)/2`, define the `GSp₄` action `(w,t)↦(gw,μ(g)t)`. Pull back to the double cover and form `H(W)⋊G̃Sp₄`. The character `e(mt)` is fixed only when `μ=1`; a positive similitude transports m to `μm`. Specialize to the BFH slash lattices with their central phases and index m/N.

(BFH90, §1, pp.546–549, (1.4)–(1.9)). *Needs:* 8.11, 8.13, 8.16, 8.17; Layer 6.

### 8.52 Full real similitude extension

Define `fullRealCover` as follows. With `r=diag(I₂,−I₂)`, each negative similitude is uniquely g₊r. Set `c(Z)=−conj Z`. The involution `(g,ρ)↦(rgr,conj(ρ∘c))` of the positive cover follows from `d(rgr,Z)=conj d(g,c(Z))`. Form `G̃Sp₄(R)=G̃Sp₄⁺(R)⋊C₂`; its projection has kernel `{±1}` and r has an order-two lift. Comparison with a specified adelic extension requires an additional input; BFH uses the positive component.

(BFH90, §1, pp.545–546, definition of `GSp⁺(4,R)`). *Needs:* 8.13; Layer 4.

- `fullRealCover_positive`: The positive cover embeds as the identity-component subgroup.
- `fullRealCover_kernel`: The projection kernel is exactly `{±1}`.
- `fullRealCover_reflection`: The chosen lift of r has square 1 and conjugates by the stated involution.

**Checks.**

- `μ(r)=−1` and `r²=I₄`.
- `c(iI₂)=iI₂`.
- The involution fixes both kernel elements.

### 8.53 Arithmetic and adelic cover compatibility

Prove `arithmetic_adelic_comparison`: From Layer 4’s normalized rank-two restricted-product cover and rational `Sp₄(Q)` splitting, construct the BFH real arithmetic lift into the adelic quotient with its Schrödinger lattice vector fixed at finite level. Match the real theta multiplier and the J change of cusp. Explicitly specify the finite multiplier, dyadic splitting for `8M|N` and the extension to Qˣ similitudes before using the comparison.

(BFH90, §1, pp.545–549; §2, p.553, (2.6)). *Needs:* 8.52, 8.15, 8.24; 2.4b; Layer 2; Layer 4.

*Proof input.* The comparison is stated for the extension of the adelic metaplectic cover of 4.2 to rank-two similitudes, with the splitting over the dyadic lattice of 4.1 and the identification of its real positive component with the cover of 8.13; those three constructions are part of this target.

### 8.54 Theta component Levi transformations

Prove `theta_levi_transform`: Let `E(n)=[[1,n],[0,1]]`, `N|n`. Then `E₁(m(E(n))g;ν)=E₁(g;E(n)ᵀν)`, and `E₀(m(E(n)ᵀ)g;μ)=E₀(g;E(n)μ)`. For `ν=(0,r)`, the first component and the finite Fourier combination `Σμ e(−Nν·μ/(2m))E₀(g;μ)` are invariant under the relevant `E(n)` action. This is Proposition 2.3 and its Corollary 2.4, with the transpose on the correct cusp.

(BFH90, §2, pp.554–555, Proposition 2.3, Corollary 2.4). *Needs:* 8.23, 8.25.

### 8.55 Theta component unipotent transformations

Prove `theta_unipotent_transforms`: For `ν=(0,r)`, `E₁(n(V)g;ν)=E₁(g;ν)` if `V` is integral symmetric, `N|V₁₁,V₁₂` and `4m|V₂₂`. `E₀(n(V)g;μ)=E₀(g;μ)` for every integral symmetric `V` and every `μ`. For `N|n` the lower-unipotent laws are `√det(I+U₁(n)Z_g)E₁(lower(U₁(n))g;ν)=E₁(g;ν)` and `√det(I+U₀(n)Z_g)Σμ e(−Nν·μ/(2m))E₀(lower(U₀(n))g;μ)=Σμ e(−Nν·μ/(2m))E₀(g;μ)`, `U₁(n)=diag(0,n)`, `U₀(n)=diag(n,0)`. Roots are the cover lifts continued from `n=0`.

(BFH90, §2, pp.555–556, Propositions 2.5–2.6). *Needs:* 8.54, 8.25.

### 8.56 Fourier coefficient Levi covariance

Prove `coefficient_levi_transform`: For `y∈Γ⁰(N)` at cusp `j=1` and `y∈Γ₀(N)` at `j=0`, `B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR)` and `C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR)`, with the corresponding residue reduction. Corollary 2.8 specializes `ν=(0,r)` and the diagonal `U₁(−ND),U₀(−D)` to the invariances required for §6–8 Fourier extraction.

(BFH90, §2, pp.556–557, Proposition 2.7, Corollary 2.8). *Needs:* 8.20, 8.23, 8.54, 8.22b.

### 8.57 Matrix Möbius function

Define `matrixMobius` as follows. For nonsingular integral `H` with positive Smith invariants `a|b`, define `μ₂(H)=gcd(a,b)μ(a)μ(b)`. Prove independence of the Smith presentation and left/right `GL₂(Z)` invariance. `H|C` means `H⁻¹C` integral, modulo right `GL₂(Z)` on `H`. Set `μ₂=0` on singular matrices; divisor theorems require nonsingular `C` and full-rank `H`.

(BFH90, §4, pp.577–578, definition before Proposition 4.1).

- `matrixMobius_unimodular`: A unimodular `H` has `μ₂(H)=1`.
- `matrixMobius_smith`: On Smith diagonal `a|b`, `μ₂=gcd(a,b)μ(a)μ(b)`.
- `matrixMobius_equiv`: `μ₂(UHV)=μ₂(H)` for U,V unimodular.

**Checks.**

- `μ₂(I₂)=1`.
- `μ₂(pI₂)=p` for a prime p.
- `μ₂(diag(p²,1))=0`.

### 8.58 Primitive symmetric pairs and symplectic completion

Prove `primitive_symplectic_pairs`: A full-row-rank symmetric integral pair (C,D), `CDᵀ=DCᵀ`, is primitive when GC,GD integral implies rational `G` integral. Prove equivalence with being a bottom row in `Sp₄(Z)`, and factor `(C,D)=H(C₀,D₀)` with `H` nonsingular integral and the pair primitive. Common matrix divisors are exactly divisors of `H`; primitivity is equivalent to `H` unimodular.

(BFH90, §4, pp.577–578, paragraph before Proposition 4.1 and Proposition 4.2). *Needs:* 8.57.

*Proof input.* BFH p.577 cites Maass, §11, for completing a primitive symmetric pair (C,D) of full row rank with `CDᵀ=DCᵀ` to an element of `Sp₄(ℤ)`, and p.587 cites Maass p.160 for the rank-one normal form; both are integral linear algebra and are proved in this target by elementary divisors.

### 8.59 Matrix Möbius divisor identity

Prove `matrix_mobius_divisor_identity`: For nonsingular `C∈M₂(Z)`, the finite sum `Σ_{H|C / right GL₂(Z)} μ₂(H)` is 1 if `C` is unimodular and 0 otherwise.

(BFH90, §4, p.578, Proposition 4.1). *Needs:* 8.57.

### 8.60 Primitive matrix Möbius inversion

Prove `matrix_mobius_inversion`: For h on rational symmetric matrices, periodic under integral symmetric translations, put `S_h(C)=Σ_{D mod C,CDᵀ=DCᵀ}h(C⁻¹D)`. Its primitive version satisfies `S_h#(C)=Σ_{H|C}μ₂(H)S_h(H⁻¹C)`, for nonsingular `C`. If `C≡0` modN, also impose `gcd(detD,N)=1,D₁₂≡0` modN and restrict `H` to `gcd(detH,N)=1`. Choose N-adapted Hermite `H=[[r,s],[0,t]]`, `s≡0` modN: the ordinary class s modr has a representative in NZ, unique modulo Nr. Then `H` is diagonal modN and division preserves the `D₁₂` condition; arbitrary representatives need not.

(BFH90, §4, p.579, Propositions 4.3–4.4). *Needs:* 8.58, 8.59.

### 8.61 Genus-two finite exponential sums

Define `finiteExponentialSums` as follows. For `det C≠0`, `T` half integral symmetric and `R∈Z²`, define `S₁(C;T,R)=Σ_{D mod NC,CDᵀ=DCᵀ, primitive(C,D),D≡0 mod N} Σ_{λ∈Z²/CᵀZ²} e(−RᵀC⁻¹Dλ+m(C⁻¹D)[λ]+N⁻¹tr(TC⁻¹D))`. Define `S₀` by `D mod C`, `D₁₂≡0N` and the phase `−NRᵀC⁻¹Dλ+m(C⁻¹D)[λ]+tr(TC⁻¹D)`, requiring `C≡0N`. Here `D mod` LC means `D'=D+LC S` for an integral symmetric `S`. The quotient is taken inside the symmetric pairs; the second quotient is the image lattice `CᵀZ²`. Phases must descend before summing.

(BFH90, §5, p.580, (5.2); p.582, (5.4)). *Needs:* 8.58, 8.15, 8.60.

- `finiteExponentialSums_well_defined`: Changing either representative leaves the character and sum unchanged under the stated conditions.
- `finiteExponentialSums_identity`: `S₁(I₂;T,R)=1`.
- `finiteExponentialSums_bad_determinant`: If `gcd(det C,N)>1` then `S₁(C;T,R)=0`.

**Checks.**

- `S₁(I₂;0,0)=1`.
- For `p|N`, `S₁(pI₂;T,R)=0`.
- For `N=1,m=1,C=diag(1,3),T=R=0`, `S₁=0`: the two primitive `D₂₂` classes yield opposite quadratic Gauss phases.

### 8.62 Genus-two Fourier unfolding kernel

Define `fourierUnfoldingKernel` as follows. For `Y=QQᵀ` positive definite, `Z=X+iY`, `detC≠0`, define `H(Q,s;C,T,R)=(2mN³)^−1∫_{R³}√(−detZ)(detY/|detZ|²)^(s/2) I([[0,−C⁻ᵀ],[C,0]][[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]) e(Z[R]/(4m)−N⁻¹tr(TZ))dX`. The positive-base power is `exp((s/2)log(detY/|detZ|²))`. Its quadratic shift identity is `H(Q,s;C,N^(1−j)T,N^(1−j)R)=H(Q,s;C,N^(1−j)U/(4m),0)` when `T=(U+N^(2−j)RRᵀ)/(4m)`.

(BFH90, §5, p.580, definition of `H` before Proposition 5.1). *Needs:* 8.29, 8.61, 8.19.

- `fourierUnfoldingKernel_zero`: A zero seed gives `H=0`.
- `fourierUnfoldingKernel_linear`: `H` is linear in the seed and commutes with continuous linear functionals in its convergence chamber.
- `fourierUnfoldingKernel_discriminant`: Substituting `T=(U+N^(2−j)RRᵀ)/(4m)` gives the stated `R=0` kernel.

**Checks.**

- `H` of zero is zero.
- At `X=0,Y=I₂` the root factor is 1.
- `N=8,m=16,j=1,R=(0,1),U=0` gives `T=diag(0,1/8)`; its two exponent terms cancel.
- At `Z=iI₂`, `R=0` the Gaussian integral is 1/2 for `m=1` and 1/4 for `m=2`; a prefactor 1/m would give 1 and 1/2, and the theta-pairing denominator 4a has no role here.

*Where the prefactor comes from.* Unfolding `B₁` (8.20, with its factor `N⁻³`) along the coset sum of 8.31 replaces the W-integral over `[0,1)²` by an integral over `ℝ²`, and translating `X` by `−C⁻¹D` turns the X-integral into one over `ℝ³` (BFH90 pp.580–582). The only W-integral is the real Gaussian Fourier transform

```text
∫_{ℝ²} e(−m Z⁻¹[W] − RᵀW) dW = √(−det Z)/(2m) · e(Z[R]/(4m)),
```

for `Z∈H₂` and `m>0`, with the principal root (positive at `Z=iY`; `det(Z/i)` never meets `(−∞,0]` on `H₂` in degree two), which is a Gaussian integral with matrix `2πimZ⁻¹` (BFH90 p.581). Hence `(2mN³)⁻¹=N⁻³·(2m)⁻¹`. The theta pairing of 8.21 and the projection of 8.22a do not enter this kernel or 8.63–8.69; they enter only through the theta components, whose expansion 8.23 is read off from Fourier coefficients and does not depend on the pairing's norm. Prove `gaussianFourier_genusTwo` (the display).

### 8.63 Cusp-one full-rank Fourier unfolding

Prove `cusp_one_unfolding`: For `Re s` large and `g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]`, `B₁(g;T,R)=Σ_{detC≠0,C₁₂≡0(N)/left Γ⁰(N)}S₁(C;T,R)|detC|^−sH(Q,s;C,T,R)`. Primitivity and `D≡0` modN force full rank in this cusp. The condition is `C₁₂≡0` modN.

All objects here are built from one BFH datum (8.28a).

(BFH90, §5, pp.580–582, Proposition 5.1). *Needs:* 8.20, 8.61, 8.62, 8.31, 8.28a.

### 8.64 Cusp-zero Fourier rank expansion

Prove `cusp_zero_rank_expansion`: For `Re s` sufficiently large, `B₀` is the full-rank sum `Σ_{C nonsingular,C≡0N / left Γ₀(N)}S₀(C;T,R)|detC|^−s N³H(Q,s;C,NT,NR)`, plus the rank-one coset contribution, plus `δ_{NR/(2m)∈Z²}detY^(s/2)∫_{X mod integral symmetric} [I(g)+I(m(η)g)]e(N²Z[R]/(4m)−tr(TZ))dX`. The rank-one term is the original coset sum with rank `C=1`, before its cuspidal Whittaker cancellation.

All objects here are built from one BFH datum (8.28a).

(BFH90, §5, pp.582–583, Proposition 5.2). *Needs:* 8.63, 8.58, 8.28a.

### 8.65 Genus-two Whittaker coefficient extraction

Define `whittakerCoefficientExtraction` as follows. For `ν=(0,r)`, `D∈Z`, `n₂=q/N>0` and `n₁=N(r²−D)/(4m)` integral, define `C₁(s;D,n₂,r;y₁,y₂)=N⁻¹∫₀ᴺ C₁(m(E(x₂))m(√y₁diag(y₂,1));U₁(−ND),ν)e(−n₂x₂)dx₂`. Define `C₀` by the finite Fourier sum `Σμ e(−Nν·μ/(2m))` of `C₀` at `m(E(−x₂)ᵀ)m(√y₁diag(y₂,1))`, index `U₀(−D)`, and the same normalized `x₂` integral. The latter vanishes unless `4m|D`; both are well defined by the coefficient covariance and periods. At cusp zero extend the extracted function by zero outside `4m|D` before using its parity API.

(BFH90, §6, pp.583,585–586, definitions before Propositions 6.1–6.2). *Needs:* 8.56, 8.55, 8.22a, 8.22b.

- `whittakerCoefficientExtraction_linear`: Extraction is linear in the theta-component family.
- `whittakerCoefficientExtraction_period`: The value is independent of the interval representative of length `N` under the proven period law.
- `whittakerCoefficientExtraction_parity`: The cusp-zero coefficient is zero if 4m does not divide `D`.

**Checks.**

- The zero component has zero extraction.
- A component `e(qx₂/N)c` extracts c at frequency q/N.
- A component `e(qx₂/N)c` extracts zero at a distinct integral frequency q'/N.

### 8.66 BFH first-cusp Dirichlet series

Define `bfhLDirichletSeries` as follows. For the preceding parameters and the original normalized newform f with Fourier coefficients `a(n)`, set `L(s,D,n₂)=Σ_{α,δ>0; β mod Nδ;N|β;α|Nn₂δ} S₁([[α,β],[0,δ]];U₁(n₁),ν)(αδ)^−s(α/δ)^(k/2)a(Nn₂δ/α)e(n₂β/α)`. Put `L(s,D)=L(s,D,N⁻¹)`. Positive real powers use the real logarithm. The congruence and divisibility constraints are part of the actual summation set.

All objects here are built from one BFH datum (8.28a).

(BFH90, §6, pp.583–584; §7, p.589, (7.1)). *Needs:* 8.61, 8.65, 8.28a; ModularForms Layer 2; ModularForms Layer 4.

- `bfhLDirichletSeries_scalar`: Scaling a scales L.
- `bfhLDirichletSeries_identity_term`: The `α=δ=1,β=0` term is `a(q)` when `n₂=q/N`.
- `bfhLDirichletSeries_specialize`: `L(s,D)=L(s,D,N⁻¹)`.

**Checks.**

- For `M=1,N=8,m=16,f=Δ,D=r=0,n₂=1/8`, the `α=δ=1,β=0` identity term is `a_Δ(1)=1`.
- For the same datum and `q=1,α=2,δ=1`, the divisibility `α|qδ` fails, so there is no summand.
- For the same datum and `q=2,α=δ=1,β=0`, the identity term is `a_Δ(2)=−24`.

### 8.67 BFH opposite-cusp Dirichlet series

Define `bfhPDirichletSeries` as follows. For `4m|D`, set `P(s,D,n₂,r)=Σ_{μ mod 2m/N}e(−Nν·μ/(2m))Σ_{γ∈Γ₀(N)\SL₂(Z)}Σ_{αδ>0;β mod δ;α|Nn₂δ} S₀(Nγ⁻ᵀCw;T,μ)(N²αδ)^−s(α/δ)^(k/2)a_γ(Nn₂δ/α)e(n₂β/α)`, `C=[[α,β],[0,δ]]`, `T=(U₀(−D)+N²μμᵀ)/(4m)`, and omit a term when `T` is not half integral. The `a_γ` are the Fourier coefficients of the actual transformed elliptic seed at the indicated cusp; `w=[[0,−1],[1,0]]`. Put `P(s,D,r)=P(s,D,N⁻¹,r)`. Extend P by zero outside its allowed condition `4m|D`; this convention makes the non-integral-index tests unambiguous.

All objects here are built from one BFH datum (8.28a).

(BFH90, §6, pp.585–586, definition of P). *Needs:* 8.61, 8.66, 8.28a; ModularForms Layer 6.

- `bfhPDirichletSeries_scalar`: P is linear in all the transformed cusp coefficient sequences.
- `bfhPDirichletSeries_residue`: P is periodic in r modulo 2m/N.
- `bfhPDirichletSeries_parity`: Non-half-integral `T` contributes zero.

**Checks.**

- For `M=1,N=8,m=16,f=Δ`, `P(s,1,1/8,r)=0` by the extension outside `64|D`; it does not require vanishing newform coefficients.
- For the same datum, replacing r by `r+4` leaves P unchanged.
- For this datum at `D=0,μ=(1,0)`, `T=diag(1,0)` is admitted; `μ=(1,1)` gives off-diagonal 1 and is also admitted. At `D=64,μ=0`, the diagonal entry `−D/(4m)=−1` is integral, whereas `D=1,μ=0` gives `−1/64` and is excluded.

### 8.68 First-cusp Whittaker expansion

Prove `first_cusp_whittaker_expansion`: In the common initial convergence chamber, for `D≠0` the extracted coefficient is `(2mN³)⁻¹(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m)) L(s,D,n₂) W^{sgn D}(|D|y₁/(4m),n₂y₂;s)`. For `D=0` it is `(2mN³)⁻¹n₂^(s−4−k/2)L(s,0,n₂)W⁰(y₁,n₂y₂;s)`. These are vector identities, and applying `T` preserves them under convergence.

All objects here are built from one BFH datum (8.28a).

(BFH90, §6, pp.584–585, Proposition 6.1). *Needs:* 8.63, 8.66, 8.32, 8.28a.

*Normalization.* In (6.2), the already normalized x₂ integration contributes no extra N: extraction of `e(qx₂/N)` returns its coefficient. The X substitution `X=YᵀX′Y`, `Y=√y₁diag(y₂,1)`, contributes `(det Y)³=(y₁y₂)³`; the root contributes `y₁y₂`, and the induced power contributes `(y₁y₂)^(−s)`. These are precisely the `(y₁y₂)^(4−s)` in 8.32. The subsequent rescalings producing `|D|/(4m)` and n₂ account for the displayed powers but leave the kernel factor `(2mN³)⁻¹` untouched, also at D=0.

**Checks.**

- Fix `f=Δ,k=12,M=1,N=16,D=r=0,n₂=1/16` and the same `(σ,v,T)`. Both `m=16` and `m=64` are admitted. Every surviving determinant is odd; doubling λ permutes its residue quotient, so `S₁` and L are equal for these two m. The actual first-cusp coefficient at m=64 is one quarter of that at m=16.
- Its determinant-one L-series term is `a_Δ(1)=1`; in the right half-plane L tends to 1 as real s tends to infinity. With a nonzero degenerate test from 8.50, this scaling is detected by a nonzero coefficient.
- At `N=8,m=16`, the surviving common full-rank factor is `1/16384`; normalizing the x₂ interval does not multiply it by N or by the inverse theta norm.

### 8.69 Opposite-cusp Whittaker rank expansion

Prove `opposite_cusp_whittaker_expansion`: For `D≠0`, `C₀=(2m)⁻¹(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m))P(s,D,n₂,r)W^{sgn D}(|D|y₁/(4m),n₂y₂;s)σ(w)`. For `D=0`, `C₀=(2m)⁻¹n₂^(s−k/2−4)P(s,0,n₂,r)W⁰(y₁,n₂y₂;s)σ(w)+(y₁y₂)^s y₂^(k/2)a(Nn₂)e(in₂y₂)vσ(η)`. The rank-one contribution to this extracted Whittaker coefficient is zero by cuspidality.

All objects here are built from one BFH datum (8.28a).

(BFH90, §6, pp.586–588, Proposition 6.2). *Needs:* 8.64, 8.67, 8.68, 8.28a.

**Checks.**

- The cusp-zero full-rank factor is `N³/(2mN³)=1/(2m)`; at `N=8,m=16` it is `1/32`.
- The rank-zero summand comes from rank(C)=0 before the W-Gaussian transform and has no `1/(2m)` factor.
- If `4m∤D`, the extended cusp-zero coefficient vanishes; multiplying the allowed full-rank terms by `1/(2m)` does not remove this condition.

### 8.70 Prime-power congruence counts

Define `localPrimeRootCounts` as follows. For p prime, `p∤2mN`, put `b≥0` and `a,d≥0`. In cases `Σ₁:a≤d,a≤b` and `Σ₂:a>d,a≤b`, `N₁₂` is the number of (`λ₁ mod p^a,λ₂ mod p^d`) satisfying `mλ₁²≡0 mod p^a`, `2mλ₁λ₂−rλ₁≡0 mod p^min(a,d)`, `mλ₂²−rλ₂+n₁/N≡0 mod p^d`. For `Σ₃:a>b`, `N₃` counts (`λ₁ mod p^b,λ₂ mod p^(a+d−b)`) satisfying `mλ₁²+rλ₁+n₁/N≡0 mod p^b`, `2mλ₁λ₂+rλ₂−rp^(a−b)λ₁−2p^(a−b)n₁/N≡0 mod p^b`, `mλ₂²−rp^(a−b)λ₂+p^(2(a−b))n₁/N≡0 mod p^(a+d−b)`. Interpret `N⁻¹` in these finite rings, since `p∤N`.

(BFH90, §7, pp.592–593, (7.10)–(7.11)). *Needs:* 8.61.

- `localPrimeRootCounts_zero_exponents`: `N₁₂(p,0,b,0)=1`.
- `localPrimeRootCounts_finite`: The counts are cardinalities of finite congruence solution sets.
- `localPrimeRootCounts_quadratic`: At `a=0`, `N₁₂` counts the quadratic roots `mλ₂²−rλ₂+n₁/N` modulo `p^d`.

**Checks.**

- `N₁₂(3,0,0,0;1,1,0,0)=1`.
- For `p=3,m=N=1,r=0,n₁=−1,a=0,d=1` there are two roots `λ₂=±1`, so the count is 2.
- For `p=3,m=N=1,r=0,n₁=1,a=0,d=1` the count is 0.
- For `p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1` there are six solutions: `λ₁∈{0,3,6},λ₂∈{0,1}`. The printed `min(a,b)` modulus leaves only two.

### 8.71 Prime-power root-count evaluation

Prove `local_root_count_table`: Write `D=D'p^(2h)`, `p²∤D'`, `χ=χ_{D'}(p)`, `ε(t)=t mod 2`, `p∤2mN`. For `i=1,2` and `a≤d+1`, the count `N_i` is: `p^((a−ε(a)+d−ε(d))/2)` if `d≤2h`; for `d≥2h+1` and `χ=1`, `N₁=2p^(h+min((a−ε(a))/2,h))`, `N₂=2p^(2h+1)`; for `d=2h+1` and `χ=0`, `N₁=p^(h+(a−ε(a))/2)`, `N₂=p^(2h+1)`; otherwise 0. Here `i=1` uses `a≤d` and `i=2` uses `a>d`, so the two identical defining congruence systems have different permitted a,d ranges. For `N₃` at `a=b+1,b≤d−1,d≥1`: `p^((d+ε(d)+b−ε(b))/2)` if `d≤2h+1,b≤2h`; `2p^(h+1+(b−ε(b))/2)` if `χ=1,d≥2h+2,b≤2h`; `p^(h+1+(b−ε(b))/2)` if `χ=0,d=2h+2,b≤2h`; `4p^(2h+1)` if `χ=1,d≥2h+2,b=2h+1`; `2p^(2h+1)` if `χ=1,d≥2h+2,b≥2h+2`; `p^(2h+1)` if `χ=0,d=2h+2,b=2h+1`; otherwise 0.

(BFH90, §7, pp.595–597, Lemma 7.3). *Needs:* 8.70.

### 8.72 Local primitive exponential factors

Prove `local_mobius_factors`: For upper triangular `C=[[p^a,p^b],[0,p^d]]`, `d≥1`, define `S_p` by `μ₂-inversion` of the unrestricted local `S`. If `a=0` or `b=0`, `S_p=S(a,b,d)−pS(a,b,d−1)`. If `a,b≥1`, `S_p=S(a,b,d)−p²S(a−1,b−1,d)−pS(a,b,d−1)+p³S(a−1,b−1,d−1)`. The `S` terms are `p^(2a+d)N₁`, `p^(a+2d)N₂` or `p^(a+b+d)N₃` according to `Σ₁,Σ₂,Σ₃`; absent divisors contribute zero. For coprime determinant factors `S` is multiplicative, and `S₁(C)=∏_{p|δ}S_p(C_p)` in the `α|δ` series.

(BFH90, §7, pp.590–594, Lemma 7.2, (7.9),(7.12)–(7.16)). *Needs:* 8.60, 8.71, 8.66.

### 8.73 Unramified genus-two Euler factors

Prove `unramified_euler_factors`: For `n₂=N⁻¹` and `p∤N`, the factor is `L_p(s,D)=1+Σ_{d≥1,0≤a≤d}p^(d−a)[S_p([[p^a,p^a],[0,p^d]],D)−S_p([[p^a,p^(a−1)],[0,p^d]],D)]p^(−(a+d)s−(d−a)k/2)a(p^(d−a))`, with the second `S_p` term absent when `a=0`. At fundamental `D₀`, let `a(p)=σ_p+σ_p'` and `σ_pσ_p'=p^(k−1)`. Then `L_p=(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))/[(1−χ_{D₀}(p)σ_pp^(2−k/2−s))(1−χ_{D₀}(p)σ_p'p^(2−k/2−s))]`. At `D=0` it is `[(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))]/[(1−σ_p²p^(5−k−2s))(1−σ_p'²p^(5−k−2s))(1−p^(4−2s))]`. These are meromorphic identities, first proved in absolute convergence.

All objects here are built from one BFH datum (8.28a).

(BFH90, §7, pp.594–599, (7.20),(7.33)–(7.34), and the unnumbered `D=0` formulas on p.599). *Needs:* 8.72, 8.28a; GL2AutomorphicRepresentationsAndTransfer R17.4.13 (adjoint lift) and AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg factors); ModularForms Layer 2; ModularForms Layer 7.

**Checks.**

- With independent exponential factors `S_p=0`, the formal `unramifiedLocalSeries` equals 1.
- At `p=3`, `k=2`, `s=3`, `σ=3`, `σ′=1` and `χ=1`, the displayed fundamental-discriminant rational expression equals 1040/729. Thus independent `S_p` and Satake data cannot satisfy this identity; `S_p` must be the actual arithmetic count.

### 8.74 Square-discriminant local polynomial and growth

Prove `squarefactor_polynomial_bound`: For `D=D₀D₁²`, `D₀` fundamental, `L(s,D)=L(s,D₀)b(s,D₁)`, with b a finite Dirichlet polynomial supported on `p|D₁`, obtained by summing the same explicit (7.20) local counts. Equivalently factor out the unramified `L_p` for `p∤ND₁`, leaving the polynomial `d(s,D₁)` of (7.35). For real `s≥2` its coefficients have `|b(s,D₁)|≪_{f,N,ε}D₁^(1/2+ε)`, using the weak normalized bound `p^(−j(k−1)/2)|a(p^j)|≤C_{f,ε}p^(j/4+ε)` for every good prime p and `j≥0`, for each `ε>0`, with one constant independent of p,j. Thus `Σ_{D₁≥1}L(s,D₀D₁²)D₁^−2u` converges for `Re u>3/4`; if `L(2,D₀)=0` the analogous series of s-derivatives at 2 has the same convergence.

All objects here are built from one BFH datum (8.28a).

(BFH90, §7, pp.588–589, Proposition 7.1; pp.599–600, (7.35)). *Needs:* 8.73, 8.28a; ModularForms Layer 2; ModularForms Layer 7.

**Checks.**

- For the normalized weight-20 level-one newform `E₈Δ`, `a(3)=50652`; at `j=1,ε=0.01` its normalized magnitude exceeds `3^0.26`. The constant cannot be fixed to 1, also for auxiliary `N=8,m=16`.
- At `j=0`, normalization gives `a(1)=1`, so the uniform constant must be at least 1.
- Taking an independent coefficient `b(s,1)=s` makes its norm unbounded on real `s≥2`. The finite polynomial and its newform bound are construction hypotheses, not consequences for arbitrary coefficient functions.

### 8.74a Ramified opposite-cusp local sums

Construct `ramifiedOppositeCuspFactors` for every `p|N` and the fixed BFH datum, including `p=2`. Localize the actual `S₀` sums of 8.61 and the level-adapted primitive inversion of 8.60, keeping the integer conditions `C≡0 mod N`, `D₁₂≡0 mod N` and primitivity. Evaluate the resulting finite sums and their generating series in `p^(−s)` for the p-parts of `P(s,D,n₂,r)` in 8.67. Define phases in `ℚ/ℤ`, or with the local additive character on `ℚ_p`, before taking residue classes; no inverse of N in `ℤ/p^eℤ` is used. At `D=0`, identify the quotient by the corresponding `L(s,0)` factor as an explicit rational function `A_p(p^(−s))/B_p(p^(−s))` in reduced form, and prove `B_p(p^(−2))≠0`. Keep all r, conductor and cusp-vector dependence. The calculation is independent of Eisenstein continuation.

(BFH90, §4 Proposition4.4, p.579; §5 (5.4), p.582; §7 Remark after Proposition7.1, p.589, ramified rational-factor assertion.) *Needs:* 8.60, 8.61, 8.66, 8.67, 8.74, 8.28a.

**Checks.**

- At `N=8,m=16,C=8I₂,T=R=0`, `S₀=1024`: there are 16 permitted diagonal D classes with odd diagonal entries and 64 λ classes, all with phase 1. This is a dyadic ramified calculation.
- For the same datum `S₁(2I₂;T,R)=0` by primitivity and the first-cusp level condition; this vanishing does not evaluate the opposite-cusp `S₀` sum.
- The `p=2` reduced rational factor is evaluated at `2^(−2)=1/4` with nonzero denominator; substituting a residue-ring inverse of 8 is undefined and cannot supply this value.

### 8.76 Genuine normalized induced-section comparison

Prove `genuine_induced_comparison`: First theta-decompose the Jacobi seed `I_s(g)Σ_{λ∈ℤ²}e(mZ_g[λ]+2mWᵀλ)` before summing over parabolic cosets. At cusp zero it is `I_s(g)θ^{m/N}_0(NZ_g,NW)`. Lift its component sections to the cover using `h(iI₂)` and adelize with the fixed finite vectors. Prove their left Siegel-unipotent invariance and Levi covariance. On the positive Siegel Levi the root magnitude `|detQ|⁻¹/²` changes the `I_s` exponent to `s−1/2`; division by `δ_P¹/²=|detQ|³/²` gives normalized parameter `ν=s−2`. Identify these genuine sections with vectors in `Ind_{P̃}^{G̃}(π̃_f⊗|det|^(s−2))`, where `π̃_f` is `π_f` twisted by the Weil determinant phase. In the initial absolute-convergence chamber prove that `ℰ_j(g,h)=h(iI₂)E_j(g)` for the actual components of 8.22a are the Eisenstein sums of these sections, using the opposite-cusp transform of 8.25. Retain the finite vectors and Haar measures in both identifications.

All objects here are built from one BFH datum (8.28a).

(BFH90, §1, p.549, `I_s`; §2, pp.553–554; §8, pp.601–602). *Needs:* 8.29, 8.30, 8.31, 8.23, 8.25, 8.13, 8.53, 8.28a; AutomorphicSpectralTheory §§1.12–1.13; ModularForms Layer 4; ModularForms Layer 6; AutomorphicLFunctionsAndLocalFactors AL.2 (`GL₂` newvectors).

The induced covariance is a property of the seed sections. The actual `ℰ_j` are automorphic Eisenstein sums and have the nonconstant Siegel-unipotent Fourier coefficients of 8.23 and 8.68.

**Checks.**

- Before the parabolic sum, the cusp-zero seed has only residue-zero component `I_s`; its other components vanish.
- At `diag(2I₂,(1/2)I₂)`, the lifted seed has magnitude factor `4^(s−1/2)`, and removing the normalized modulus `4^(3/2)` leaves `4^(s−2)`.
- A nonzero nonconstant U-Fourier coefficient of an actual `ℰ_j` prevents left U-invariance; such an Eisenstein sum is not itself an inducing section.

### 8.77 Genuine Eisenstein initial convergence and growth

Prove `genuine_eisenstein_initial_convergence`: For the specified BFH K-type, newform, finite vector and cover measures, prove the Jacobi `E_s` and the genuine Eisenstein sums of the sections of 8.76 converge absolutely and locally uniformly with all required derivatives for `Re s>S₀`, for some real `S₀`. Compare their absolute-value and Sobolev bounds with the Siegel-section estimates of AutomorphicSpectralTheory §1.3 at `ν=s−2` after Gaussian `λ` summation. The finite-cover identification must establish this comparison.

All objects here are built from one BFH datum (8.28a).

(BFH90, §1, p.549, definition of `E_s`; §5, p.580, Proposition 5.1). *Needs:* 8.76, 8.20a, 8.28a; AutomorphicSpectralTheory §1.3.

### 8.78 Genuine Siegel intertwining operators

Define `genuineIntertwiner` as follows. Define the raw Siegel intertwiner `M(w,s)F(g)=∫_{N_w(A)}F(w⁻¹ng)dn` in its convergence chamber, with fixed Weyl lift and self-dual root measures. It maps to `Ind(π̃_f∨⊗|det|^(2−s))`, hence BFH parameter `4−s`. Continue between these genuine smooth spaces and compute all scalar normalizers and ramified pole divisors. Keep `M` in the constant term and unnormalized Eisenstein equation; replacing it by `R=c(s)⁻¹M` also requires renormalizing the Eisenstein family.

All objects here are built from one BFH datum (8.28a).

(BFH90, §8, pp.601–602, continuation and constant-term discussion). *Needs:* 8.76, 8.77, 8.28a; AutomorphicSpectralTheory §§2.1–2.5.

- `genuineIntertwiner_equivariant`: `M` is G̃-equivariant between the stated induced spaces.
- `genuineIntertwiner_integral`: In the convergence chamber `M` is exactly the root-group integral with the chosen Weyl lift.
- `genuineIntertwiner_composition`: For `R=c(s)⁻¹M` with the specified scalar factors and contragredient identification, `R(w,4−s)R(w,s)=id` meromorphically away from operator poles. This API is for `R`; `M` remains the raw integral operator in the standard constant term and Weyl equation.

**Checks.**

- Zero section maps to zero.
- The output remains genuine under the cover kernel.
- The parameter map `4−s` is an involution and fixes `s=2`.

### 8.79 Genuine Eisenstein constant-term formula

Prove `genuine_constant_term`: Along the Siegel unipotent radical, the genuine Eisenstein constant term is the identity section plus `M(w,s)` applied to the inducing section, initially in the common convergence chamber and then meromorphically. The intermediate rank-one Bruhat contribution vanishes by elliptic cuspidality. The theta/Fourier specialization recovers exactly the three boundary contributions `L(s,0)M`, `P(s,0,r)M̃` and `τ` in Proposition 8.1, with the exact factors of 8.68–8.69 and 8.84, including the relative rank-zero normalization.

All objects here are built from one BFH datum (8.28a).

(BFH90, §8, pp.601–602; pp.611–614, (8.10)–(8.16)). *Needs:* 8.78, 8.64, 8.69, 8.28a.

**Checks.**

- The real-box `genuineConstantTerm` of `E=0` is 0.
- The totalized real integral `genuineIntertwiner` of the nonintegrable constant `F=1` is 0, while `F(g)=1`. Hence `0≠1+0`: an independent pair E,F fails the proposed formula. The actual induced section and its Eisenstein sum, with convergence, are required.

### 8.79a Opposite-cusp zero coefficient regularity

Prove `opposite_cusp_zero_regularity`: For the fixed BFH arithmetic data and r, prove `P(s,0,r)` holomorphic near `s=2` and polynomial D-growth of `P(s,D,r)`, uniformly on compact pole-free parameter sets. Compute ramified cusp factors as `L(s,0)` times rational functions of `p^−s`, `p|N`, with denominators nonzero at 2. Obtain growth from the actual cover-compatible Whittaker estimates. Establish this arithmetic result independently of Eisenstein continuation.

All objects here are built from one BFH datum (8.28a).

(BFH90, §7, p.589, Remark following Proposition 7.1). *Needs:* 8.67, 8.60, 8.74a, 8.28a; GL2AutomorphicRepresentationsAndTransfer R17.4.13 (adjoint lift) and AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg factors); AutomorphicSpectralTheory §§1.3, 2.17.

*Proof route.* BFH p.589 states the regularity without the ramified calculation, and this target includes it: for each `p|N` use the ramified sums and reduced rational factors of 8.74a, whose denominators are nonzero at `s=2`; the good-prime counts of 8.70–8.72 apply only to `p∤2mN`; the polynomial D-growth then follows from 8.39–8.40 uniformly on compact pole-free sets.

### 8.80 Genuine Eisenstein continuation and Weyl equation

Prove `genuine_eisenstein_continuation`: Prove meromorphic continuation of the genuine BFH family and `E(s,F)=E(4−s,M(w,s)F)`, with the raw intertwiner and contragredient cusp identification. Poles come from the proved genuine constant terms. Near `s=2`, regularity is equivalent to regularity of those coefficients; intertwiner residues give genuine automorphic residues. Supply the cover-specific adaptation of AutomorphicSpectralTheory §§2.4–2.6 and the original Fricke conductor `M`.

All objects here are built from one BFH datum (8.28a).

(BFH90, §8, pp.601–602, continuation and pole discussion; §1, pp.550–551, newform L-functions). *Needs:* 8.79, 8.79a, 8.28a; AutomorphicSpectralTheory §§2.4–2.4a; GL2AutomorphicRepresentationsAndTransfer R17.4.13 (adjoint lift) and AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg factors).

### 8.82 Fourier and residue interchange for genuine families

Prove `fourier_residue_interchanges`: For the continued genuine family with locally finite pole divisor, clear a local holomorphic denominator. Prove locally uniform holomorphy of compact-torus Fourier integrals, the finite theta transform and the absolutely convergent nonzero-discriminant Whittaker/Mellin tails. These operations then commute with s-residues and derivatives. Infinite theta or `D` sums require their Gaussian/rapid-decay bounds; this gives no joint Fubini theorem for the expanded Novodvorsky kernel.

Fix `y₂>0`. The scalar coefficient `φ(κ)=T(vσ(κ))` is globally divisible by `φ₁` in `R_k`: there exists `ψ∈R_k` with `φ(κ)=φ₁(κ)ψ(κ)` for every `κ∈K`. This is the standing hypothesis on printed p.601 before Proposition 8.1, not merely divisibility in the positive `κ(X)` chart.

(BFH90, §8, pp.601–614, proof of Proposition 8.1). *Needs:* 8.80, 8.20a, 8.39, 8.45, 8.79a.

### 8.83 BFH two-variable twist series

Define `twoVariableTwistSeries` as follows. Define `Z^±(u,s;r)=Σ_{D∈Z,±D>0,D≡r² mod 4m/N} L(s,D)|D|^(s−u−5/2)`, initially for `Re u` sufficiently large and `Re s` in the L-series convergence chamber. The integer modulus 4m/N uses `N|m` and `4m|N²`. The coefficient L includes the actual first-cusp exponential sums and the original normalized newform f, not an arbitrary list of central L-values.

(BFH90, §8, p.601, definition before Proposition 8.1). *Needs:* 8.66, 8.74.

- `twoVariableTwistSeries_scalar`: Scaling the elliptic seed scales both `Z` series.
- `twoVariableTwistSeries_congruence`: Only `D≡r²` modulo 4m/N occurs.
- `twoVariableTwistSeries_sign`: The plus and minus supports are disjoint and exclude `D=0`.

**Checks.**

- The zero coefficient family gives `Z⁺=Z⁻=0`.
- `N=8,m=16,r=1` permits `D≡1` mod8; `D=1` and `−7` occur in opposite signs.
- For that datum `D=0,2,−1` are all excluded.

### 8.84 BFH two-variable polar combination

Prove `two_variable_polar_combination`: Put `A=(4m)^(−s+u+5/2)N^(−s+4+k/2)[Z⁺ TF⁺(u,s;N⁻¹y₂)+Z⁻ TF⁻(u,s;N⁻¹y₂)]`. It continues meromorphically to `Re s>3/2`, `Re u>0` and `Re u>Re s−5/2`. Near `(u,s)=(1/2,2)`, A minus the following sum is jointly holomorphic: `−N^(−s+4+k/2)L(s,0)TM(s,N⁻¹y₂)/(u−s+5/2) + N^(7−s−k/2)P(s,0,r)y₂^(2s−5)TM̃(s,N⁻¹y₂)/(u+s−5/2) + 2mN^(3−s) y₂^(3−s+k/2)Tτ(s,N⁻¹y₂)/(u−s+3/2)`. Every term uses the continued scalar transforms `TF^ε`, `TM`, `TM̃` and `Tτ` and fixed BFH test vector. The first-cusp full-rank coefficient has common factor `(2mN³)⁻¹`; division by that factor in solving for A leaves the two full-rank polar coefficients unchanged and multiplies the rank-zero τ contribution by `2mN³`. This is joint holomorphy in two complex variables, not a collection of separate one-variable statements.

All objects here are built from one BFH datum (8.28a). Fix `y₂>0`. The scalar coefficient `φ(κ)=T(vσ(κ))` is globally divisible by `φ₁` in `R_k`: there exists `ψ∈R_k` with `φ(κ)=φ₁(κ)ψ(κ)` for every `κ∈K`. This is the standing hypothesis on printed p.601 before Proposition 8.1, not merely divisibility in the positive `κ(X)` chart.

(BFH90, §8, pp.601–614, Proposition 8.1). *Needs:* 8.83, 8.68, 8.69, 8.47, 8.46, 8.82, 8.79a, 8.41, 8.45, 8.28a.

**Checks.**

- At `M=1,N=8,m=16`, multiplying the coefficient identity by `2mN³=16384` to solve for A multiplies its rank-zero term by 16384, while both full-rank boundary terms have the same factor on the two sides.
- A test with `Tτ=0` keeps exactly the two full-rank polar contributions, with the same relative constants as their Whittaker expansions.
- A nonzero rank-zero test of 8.49 detects the factor `2mN³` in the τ pole; it cannot be absorbed into L or P, whose definitions are fixed.

### 8.85 Genus-two coefficient and local-test export

Prove `bsd2_export`: Export the first-cusp coefficients with factor `(2mN³)⁻¹`, the opposite-cusp full-rank coefficients with factor `(2m)⁻¹` and their unscaled rank-zero term, the unramified factor ratio, squarefactor bound, joint polar continuation, valid residue/derivative interchanges and three finite K-type existence tests. AL.3 identifies `L(s,D₀)=L_N(s+k/2−2,f⊗χ_{D₀})/L_N(2s+k−4,Sym²f)` for fundamental `D₀` and `L(s,0)=L_N(2s+k−5,Sym²f)/L_N(2s+k−4,Sym²f)`. At `m=N rad(N),r=1` these supply RankZeroOneBSD. That roadmap owns twist residues, positivity, noncancellation, simultaneous local conditions and infinitude.

All objects here are built from one BFH datum (8.28a).

(BFH90, §7, pp.588–589, Proposition 7.1; §9, pp.614–617). *Needs:* 8.73, 8.74, 8.84, 8.48, 8.49, 8.50, 8.28a; GL2AutomorphicRepresentationsAndTransfer R17.4.13 (adjoint lift) and AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg factors).

### 8.86 BFH metaplectic kernel interface

Prove `bfh_halfWeightKernelComparison`: For one BFH datum (8.28a), identify the classical genus-two theta components of 8.23 with the real-Iwasawa evaluations of the rank-two genuine adelic Eisenstein sums constructed from the theta-decomposed seed in 8.76. Use the arithmetic/adelic comparison of 8.53 to match the finite splitting and its compact type with the auxiliary subgroup `Γ_N` of 8.15. The archimedean vector is the specified BFH K-type; apply the square-root cover comparison of 8.13 to its automorphy factor. Match the residue-vector transformation by the finite Weil phases of 4.7 and 8.24, and prove equality of the two-cusp Fourier–Whittaker coefficients of 8.68–8.69, including `(2mN³)⁻¹` at cusp one, `(2m)⁻¹` in cusp zero full rank and the unscaled rank-zero contribution. Retain the normalized Siegel parameter `s−2`, original newform conductor M and auxiliary level N throughout. Transport the local tests and Euler-factor ratio through this rank-two identification for RankZeroOneBSD.

Hypotheses: one BFH datum, `k≥2` even, trivial character, `8M|N,N|m,4m|N²`, the specified finite type and real K-type, and initially the common convergence chamber; continuation uses 8.80.

(BFH90, §1 printed549, §2 Proposition2.2 printed552–554; §8 printed601.) *Needs:* 4.7, 8.13, 8.15, 8.24, 8.28a, 8.31, 8.23, 8.53, 8.76, 8.68, 8.69, 8.80, 8.85.

**Checks.**

- For `M=1,N=8,m=16`, both sides have four residue classes in each coordinate and the same rank-two finite Fourier phase.
- The covariance parameter is `(s−1/2)−3/2=s−2`, using the Siegel modulus exponent `3/2`.
- Changing auxiliary N within the divisibility hypotheses preserves the conductor M of f and changes the compact type and residue set on both sides.

### 8.87 Ramified quadratic-twist kernel inputs

Prove `quadraticTwist_kernelInputs`: For the BFH datum, export the actual ramified local character/test-vector integrals, the opposite-cusp factors of 8.74a and the nonzero finite K-type tests of 8.48–8.50 together with the normalized Euler factors of 8.73 and the kernel comparison of 8.86. Keep the ramified and dyadic character, conductor, Haar and finite-vector data in every comparison.

Hypotheses: one BFH datum (8.28a) with its newform and local vectors, and the character and conductor conditions of BFH90 §1. No nonvanishing theorem under all local conditions is concluded here.

(BFH90, §1 quadratic-twist completion, printed551, PDF10; §5 (5.2),(5.4), pp.580,582; §7 p.589; §8 p.601). *Needs:* 8.28a, 8.74a, 8.85, 8.86, 8.48, 8.49, 8.50; AutomorphicLFunctionsAndLocalFactors AL.1–AL.2 (ramified local theory, test vectors).

**Checks.**

- For `M=1,N=8,m=16`, the export includes the dyadic factor at 2; good-prime factors do not determine it.
- Scaling the finite test vector scales its local integral, so the export includes that vector and its normalization.
- Each finite K-type test retains its global divisibility hypothesis from 8.48–8.50; a local positive-chart representative alone does not meet it.

### Examples

At `a=1` and `Z=iI₂` the diagonal theta pairing is 1/4, and at `a=2` it is 1/8; different residue classes are orthogonal. At `Z=iI₂` and `R=0` the real Gaussian Fourier integral of 8.62 is 1/2 for `m=1` and 1/4 for `m=2`. The S-transform factors are 1/2 and 1/4 respectively. At `a=0` discriminant recovery fails. At `p=3,a=b=2,d=1,m=16,N=8,r=1,n₁=0` the corrected congruence system has six solutions. At the compact chart boundary the global `φ₁` keeps its sign, unlike the positive chart representative.

### Dependencies

Within this roadmap: Layers 2, 4, 6 and 7. From other roadmaps: AutomorphicFormsOnReductiveGroups §§0.3–0.4, 6.4, 7.2–7.3; ModularForms Layers 2, 4, 6 and 7; AutomorphicLFunctionsAndLocalFactors AL.1–AL.3 (`GL₂` newvectors, ramified test vectors, Rankin–Selberg factors); GL2AutomorphicRepresentationsAndTransfer R17.4.13; AutomorphicSpectralTheory §§0.26–0.28, 1.3, 1.12–1.13, 2.1–2.5, 2.4a, 2.17; RepresentationTheory/CompactGroups Layer 5.

## Downstream consumers

GrossZagierAndArithmeticHeights consumes the analytic toric and Waldspurger interfaces (6.22) and the coherent and incoherent sections with the arithmetic theta normalizations (6.7–6.9). RankZeroOneBSD consumes 8.85–8.87 and owns the final quadratic-twist nonvanishing argument. ModularityAndLanglandsExtensions consumes the local theta correspondence of Layer 3 for its theta-based local Langlands constructions, and a local Langlands parametrization it constructs for `Sp₆` instantiates the hypothesis of 3.41. QSeriesPartitionsAndMockModularForms uses the classical multiplier and Fourier conventions of Layer 7. A function-field roadmap that constructs factorization gerbes, metaplectic geometric Satake and global excursion operators instantiates 4.8.

## References

Page numbers refer to the linked version. “PDF” denotes a physical page and “printed” denotes the number on the page. In the BFH scan, the first physical page is a cover sheet; the printed article begins at page 543.

**Kudla96.** Stephen S. Kudla, [Notes on the local theta correspondence](https://www.math.toronto.edu/skudla/castle.pdf). Unpublished author notes; introduction dated July 6, 1996; 110-page author copy.

**Weil64.** André Weil, [Sur certains groupes d’opérateurs unitaires](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf). Acta Mathematica 111 (1964), 143–211; published scan, DOI 10.1007/BF02391012.

**Garrett20.** Paul Garrett, [Stone–von Neumann theorem](https://www-users.cse.umn.edu/~garrett/m/mfms/SSW/06_svn_theorem.pdf). Author notes dated23March2020;5pages.

**GQT.** Wee Teck Gan, Yannan Qiu and Shuichiro Takeda, [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3). arXiv:1207.4709v3,21January2014.

**LapidRallis05.** Erez Lapid and Stephen Rallis, *On the local factors of representations of classical groups*. In *Automorphic representations, L-functions and applications: progress and prospects*, Ohio State University Mathematical Research Institute Publications 11 (2005), 309–359.

**Yamana14.** Shunsuke Yamana, *L-functions and theta correspondence for classical groups*. Inventiones mathematicae 196 (2014), 651–732, DOI 10.1007/s00222-013-0476-x.

**Gan12.** Wee Teck Gan, [Doubling zeta integrals and local factors for metaplectic groups](https://doi.org/10.1017/S002776300001059X). Nagoya Mathematical Journal 208 (2012), 67–95, §§5–6.

**GanTakeda16.** Wee Teck Gan and Shuichiro Takeda, [A proof of the Howe duality conjecture](https://arxiv.org/pdf/1407.1995v4). arXiv:1407.1995v4,15June2015;21-page PDF.

**GanIchino16.** Wee Teck Gan and Atsushi Ichino, [The Gross–Prasad conjecture and local theta correspondence](https://arxiv.org/pdf/1409.6824v2). arXiv:1409.6824v2,17July2015;62-page PDF.

**SunZhu15.** Binyong Sun and Chen-Bo Zhu, [Conservation relations for local theta correspondence](https://arxiv.org/pdf/1204.2969v3). arXiv:1204.2969v3,2June2014;50-page PDF.

**DIT11.** W. Duke, Ö. Imamoḡlu and Á. Tóth, [Cycle integrals of the j-function and mock modular forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf). Annals of Mathematics173(2011),947–981;published35-page PDF.

**Biro00.** András Biró, [Cycle integrals of Maass forms of weight0 and Fourier coefficients of Maass forms of weight1/2](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf). Acta Arithmetica94(2000),103–152;50-page published scan.

**BFH90.** Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein, [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf). Inventiones mathematicae102(1990),543–618;77-page published scan.

**AGHMP18.** Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Annals of Mathematics 187 (2018), no. 2, 391–531.

**CT20.** Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/pdf/1907.08783v1). arXiv:1907.08783v1.

**DL24.** Daniel Disegni and Yifeng Liu, [A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3). arXiv:2204.09239v3.

**DIT16.** W. Duke, Ö. Imamoḡlu, Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Annals of Mathematics 184 (2016), 949–990.

**GI18.** Wee Teck Gan and Atsushi Ichino, [The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3). arXiv:1705.10106v3.

**GS23a.** Wee Teck Gan and Gordan Savin, [Howe duality and dichotomy for exceptional theta correspondences](https://arxiv.org/pdf/2102.00372v1). arXiv:2102.00372v1.

**GG06.** Wee Teck Gan and Nadya Gurevich, *Nontempered A-packets of G₂: liftings from the metaplectic SL₂*. American Journal of Mathematics 128 (2006), 1105–1185, DOI 10.1353/ajm.2006.0040, §8 Proposition 8.1 and §9 Theorem 9.1(c,d).

**GS23b.** Wee Teck Gan and Gordan Savin, [The Local Langlands Conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf). Forum of Mathematics, Pi 11 (2023), e28, 1–42.

**GZ86.** Benedict H. Gross, Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Inventiones mathematicae 84 (1986), no. 2, 225–320.

**IP23.** Atsushi Ichino and Kartik Prasanna, [Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2). arXiv:1806.10563v2.

**Laf18.** Vincent Lafforgue, [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10). arXiv:1209.5352v10.

**LL21.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Annals of Mathematics (2) 194 (2021), no. 3, 817–901.

**LL22.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II](https://arxiv.org/pdf/2101.09485v2). arXiv:2101.09485v2.

**LZ22.** Chao Li and Wei Zhang, [Kudla–Rapoport cycles and derivatives of local densities](https://arxiv.org/pdf/1908.01701v3). arXiv:1908.01701v3.

**YZ18.** Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals of Mathematics187(2018),533–638; erratum198(2023),867–878.

**Z21.** Wei Zhang, [Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf). Annals of Mathematics 193 (2021), no. 3, 863–978.

**YZZ11.** Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail). Author draft dated 6 November 2011, 266 PDF pages; author-uploaded public copy. Distinct from the 2013 published book.

**Duke88.** William Duke, [Hyperbolic distribution problems and half-integral weight Maass forms](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf). Inventiones Mathematicae 92 (1988), 73–90; public scan on the author’s UCLA page.

**CdS.** Ana Cannas da Silva, [Lectures on Symplectic Geometry](https://people.math.ethz.ch/~acannas/Papers/lsg.pdf). Lecture Notes in Mathematics 1764, Springer, 2001; author's corrected version. §1.1 Theorem 1.1, p.3; §8.2 Proposition 8.2, pp.46–47.

**MVW87.** Colette Mœglin, Marie-France Vignéras and Jean-Loup Waldspurger, *Correspondances de Howe sur un corps p-adique*. Lecture Notes in Mathematics 1291, Springer, 1987.

**Minguez08.** Alberto Mínguez, *Correspondance de Howe explicite : paires duales de type II*. Annales scientifiques de l'École normale supérieure (4) 41 (2008), 717–741.

**Fay77.** John D. Fay, *Fourier coefficients of the resolvent for a Fuchsian group*. Journal für die reine und angewandte Mathematik 293/294 (1977), 143–203.

**Kohnen85.** Winfried Kohnen, *Fourier coefficients of modular forms of half-integral weight*. Mathematische Annalen 271 (1985), 237–268.

**BaruchMao10.** Ehud Moshe Baruch and Zhengyu Mao, [A generalized Kohnen–Zagier formula for Maass forms](https://doi.org/10.1112/jlms/jdq009). Journal of the London Mathematical Society 82 (2010), 1–16, Theorem 1.2.

**KatokSarnak93.** Svetlana Katok and Peter Sarnak, *Heegner points, cycles and Maass forms*. Israel Journal of Mathematics 84 (1993), 193–227.

**Maass71.** Hans Maass, *Siegel's Modular Forms and Dirichlet Series*. Lecture Notes in Mathematics 216, Springer, 1971.
