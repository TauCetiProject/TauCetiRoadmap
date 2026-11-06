# Roadmap: automorphic bundles and classical automorphic forms, part II

**Summary.** This extends AutomorphicBundles Layers 0–12, whose endpoint is the coefficient bundle and its section Hecke operators, to integral coherent cohomology, equivariant perfect complexes and Hecke operators in every degree. It proves integral small-weight vanishing for Siegel threefolds, compares canonical and interior coherent cohomology with automorphic forms, and derives non-Eisenstein boundary vanishing and multiplicity-counted cuspidal decompositions. Over ℚ the boundary result holds in every degree; over a totally real field the boundary input is in degree zero. Conditional hypotheses on packets give the final degree-one/degree-zero dimension comparison. The coefficient, support, compact-group and arithmetic normalizations are part of these statements.

## Scope and ownership

The roadmap extends the good-prime integral Levi realization of AutomorphicBundles 5.10 to normalized deep-level models and the integral dual-Weyl lattice of ReductiveGroups §10B, and owns finite-coefficient coherent homology, group-ring perfect models, higher cohomological Hecke comparisons, integral EO detection of relations, coherent automorphic image comparisons and the localized boundary and cuspidal conclusions. It imports VStackSheavesAndLisseCategories VS2.1’s solidification and VS2.2’s analytic-ring interface and supplies the (A,A)■ solid/discrete scheme interface and Hilbert–Siegel EO geometry used by those constructions. It includes arbitrary complete DVR coefficients where the statement is coefficient algebra, and states every geometric reduction and logarithmic lifting hypothesis separately.

AutomorphicBundles Layers 0–12 owns associated bundles, coefficient tensor operations, canonical and subcanonical extensions and section Hecke convolution; its 5.10 owns the good-prime integral Levi torsor, associated locally free coefficients and their formal canonical/subcanonical expansions, and its Layer 9 owns the dual BGG construction. AlgebraicVectorBundles L0A–L0C owns the generic vector-bundle operations. SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21 and 4.8–4.10 owns generic Čech, Cousin, relative duality and formal functions. EnhancedDerivedSheaves E1.9 owns perfectness of proper-support pushforward and its arbitrary base change. DerivedModuleAlgebra §§1.3–1.5, 1.E.0–1.E.1 and 1.M.1–1.M.2 owns object completion, perfectness/retracts, effectivity and Matlis duality, and DeformationAndDerivedPatchingAlgebra §§7.5–7.10 owns nilpotent lifting, dual complexes, strict tower actions, finite derived Hom completion, isolated derived-action blocks and coefficient spectral sequences. Here the perfectness and localization targets identify the actual geometric complexes and operators with those constructions.

ShimuraCompactifications Layers 4, 6 and 7 (refinements and Hecke maps; degenerations of polarized abelian schemes; integral PEL compactifications) own fans, toroidal/minimal models, refinements, polarized degenerations and normalized deeper-level models, in particular 7.19–7.21 and 7.31; 6.16 owns the rational compactified Klingen span. Its 7.21 owns the formally canonical definition and its verification on its stated models. Section 5.1 here verifies its additional quotient and p-level applications. Its 7.29 owns the logarithmic canonical-bundle formula; §5.7 applies it to the actual Serre-dual coefficient.

Tau Ceti’s divisor-sheaf Serre duality for a curve over a field is in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean`, with `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`. SchemeAndStackFoundations §2.20's `cm_serre_duality` is Serre duality for a proper Cohen–Macaulay scheme over a field. Section 1.6 instead treats arbitrary relative dimension over a finite DVR quotient, with its Matlis comparison and equivariance; over a field it specializes to the curve statement and to `cm_serre_duality`. The generic existence and uniqueness-up-to-homotopy of lifts are already in the library as Mathlib's K-projective theorems. AutomorphicFormsOnReductiveGroups §§6.3–6.7 states the closed chambers, infinitesimal characters, Kostant representatives, component transport and local coherent classifications; these are imported rather than defined again. The geometric tempered-image restriction in Layer 7 applies those results to the images constructed in Layer 6. IntegralHeckeAndGaloisDeterminants §§3a–3b owns spin polynomials and residual predicates; §4.3 identifies the geometric generators, and §5.15 applies the predicates to their coherent action. SmoothRepresentationsOfLocalGroups SR.4 owns normalized Satake. Its local Klingen restriction is an explicit supplier contract below; §8.4 identifies the geometric boundary coefficient.

The scheme solid six operations and their discrete comparison are §3.0a. IgusaVarietiesAndTorsionConcentration §§2.12–2.13 owns the G-zip Ekedahl–Oort stratification, its Hasse sections and the affineness of partial minimal EO strata for its unitary PEL datum; the genus-two Hilbert–Siegel EO geometry of §5.0 is the type-C case for Res_(F/ℚ)GSp₄, with its codimension filtration, Cohen–Macaulay thickenings and boundary regularity, and is not deduced from the unitary case. The Hilbert–Siegel EO geometry and quotient descent are §5.0, and the application of EndoscopicTransferAndUnitaryTraceComparison §11.1’s conditional comparison of GSp₄ L-packets and of the supplied lower-rank Galois polynomials is §7.0. Locally analytic weights, ordinary projectors and p-adic families belong to OverconvergentAutomorphicForms; no such projector enters the classical comparison here.

## Conventions

O is a complete discrete valuation ring, ϖ a fixed uniformizer, E its fraction field, k its residue field of characteristic p, and Aₙ=O/ϖⁿ for n≥1. The abbreviation `dvrCoefficientRing` of `Suggested.lean` is O/(ϖⁿ); it is also defined at n=0, where it is the zero ring. The duality theorem is stated for every n and an irreducible uniformizer, and is vacuous at n=0; it does not use the completeness of O. Coherent homology uses O-linear Matlis duality into E/O. On an Aₙ-module, the identification Aₙ≃(E/O)[ϖⁿ] sends x to x/ϖⁿ modulo O; use this when comparing an Aₙ-linear dual complex with Matlis homology. An unqualified Pontryagin dual into Qₚ/Zₚ is not the same datum over a ramified coefficient ring.

A supplied toroidal model has its chosen polarization, dual degeneration and logarithmic Hodge factors. Smoothness, properness and flatness are imposed in each theorem that uses them; a normalized bad-level model is not declared smooth merely because the generic fibre is smooth. D is the boundary, F_can the canonical extension, and F_sub=F_can⊗I_D the subcanonical extension. At a smooth Cartier boundary I_D=O(−D). H̄ⁱ always denotes the image of Hⁱ_sub→Hⁱ_can. Tensor products and coefficient reductions in a derived statement are derived unless the specified flatness removes higher Tor.

For genus two, ω(a,b)=Sym^(a−b)(E_Hdg)⊗det(E_Hdg)^b, with a≥b; Pilloni’s Ω^(k,r) is ω(k+r,r). The natural W coefficient has central coordinate −a−b. The arithmetic action twists by ν⁻³, giving W_(a,b;3−a−b) and V_(−b,−a;6−a−b); a scalar xI₄ acts by x^(a+b−6). These identify underlying bundles only after the Hecke linearization has been recorded. For a unit shift of the central coordinate, the W/V comparison uses the adelic central correction `sgn(nu(x)) * abs(nu(h))_f^(-1)`, with x and h the real and finite components; the finite norm must not be suppressed. Frobenius is geometric, so ε(Frob_v)=q_v⁻¹.

In CG20 the torus ordering is the one used by its matrices; diagonal tuples imported from another source are compared after the corresponding symplectic-basis permutation. The geometric Frobenius convention concerns Galois polynomials; normalized Satake uses the declared q powers. The compact parameter of AutomorphicFormsOnReductiveGroups §6.3 is balanced against its chosen coefficient. Its central coordinate is transported through the actual coefficient intertwiner of §6.7 and §7.0, never identified with the CG20 coordinate by matching labels.

For a cohomological correspondence the legs are p₁,p₂:C⇒X and the coefficient arrow is Lp₂*F→p₁!G, where the exclamation mark denotes **upper shriek**. Its adjoint under proper p₁ is Rp₁*Lp₂*F→G. In a general six-operation setting its adjoint instead uses **lower shriek** (p₁)!. Properness of the joint map to X×X alone does not justify using Rp₁* on unrestricted global cohomology. The global action targets below explicitly require proper p₁. Discrete coherent base change has Tor-independence and boundedness hypotheses; it is not inferred from finiteness of the base change. BP26 §2.6.12 itself assumes Tor-independence of X and S′ and flatness of F.

The integral construction first supplies individual Hecke endomorphisms in Layer 3 and their normalization and lifts in Layer 4. Layer 5 proves the hyperspecial integral convolution relations before constructing local perfect factors and residual or complex congruence localization. Agreement on H⁰ or after inverting p alone does not supply those relations.

The Q and totally real boundary arguments have different ranges. Over Q, CG20’s characteristic-zero nerve argument applies at neat prime-to-p level to all weights and all degrees, as stated immediately before Lemma 7.10 (pp. 52–53). Over a general totally real F, BCGP21 proves the degree-zero boundary vanishing used here. Its “reasonable” level means K=K^p∏_(v|p)K_v, with K^p neat and K_v hyperspecial, paramodular, Siegel parahoric, Klingen parahoric or Iwahori (Definition 3.3.3, pp. 204–205). The integral EO relation theorem additionally requires hyperspecial p-level. When passing from the G model to its G₁ quotient, use the compactified direct-factor descent of §5.0; it holds at every reasonable level with no hypothesis on p, because the component stabilizer Δ(Π₀) acts freely on the compactified G model (BCGP21 Lemma 3.5.3) and the splitting of a finite étale Galois cover through the augmentation ideal needs no averaging. Freeness on the open model alone does not prove freeness on the compactified boundary.

Su’s comparison uses a connected reductive algebraic group over ℚ, a neat level, a smooth toroidal fan and the condition that the maximal Q-split central torus A_G is also maximal R-split in the centre. Its relative pair is (p_o,K_o), formed after the central split factor is removed, with p_o=Lie(P_h)∩m_G. It is not the unrestricted (g,K) pair. The tower coefficient V_o carries the inverse action of the removed central factor. Harris’s separate cusp/subcanonical map is needed to compare cusp and interior cohomology; Su’s canonical-extension theorem does not assert that comparison.

Every final cuspidal sum includes the actual spectral multiplicity space, the fixed central character, level invariants and residual congruence condition. The global classification and full compact-group statements for packets are explicit conditional inputs. The solid scheme enhancement and Hilbert–Siegel geometry are constructed in §§3.0a and 5.0. The full-group coherent convention is that of AutomorphicFormsOnReductiveGroups §§6.4–6.6.

For §3.0a, affine coordinate rings A, including O, carry the discrete analytic ring (A,A)■ defined after CS19 Definition 9.1 (p. 62) as the filtered colimit over finitely generated discrete Huber pairs. Every solid category here is the κ-condensed abelian category D((A,A)■) of CS19; no light-condensed or spectral carrier is used. The geometric scheme category is glued from D((A,A)■). VStackSheavesAndLisseCategories VS2.2’s integer-solid (A,ℤ)■ is a different analytic structure: its principal localization is a closed immersion, whereas Spec A[1/f] is open in the scheme formalism here. No p-adic topology is imposed before the separate completion construction.

Complexes use integer cohomological degrees; a sheaf has no negative cohomology, and the subtraction d−i in duality is integer subtraction.

All schemes, sites, modules and index sets lie in fixed universes, enlarged together for sheaf and derived constructions. Covers used for bounded Čech models are finite affine covers of quasi-compact separated schemes. A DVR is a nonzero domain of dimension one; neither the zero ring nor a field is treated as a DVR. Rank-zero coefficients and empty boundaries are allowed. No claim with a divided factor is evaluated where that factor is zero.

## Exact supplier contracts

### From Mathlib

Use `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Scheme.Modules`, `SheafOfModules.IsLocallyFree`, `SheafOfModules.IsFinitePresentation`, `CategoryTheory.DerivedCategory` and native module/group-ring carriers. In `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean`, `CochainComplex.isKProjective_of_projective` assumes an upper degree bound and projective terms. In `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean`, `CochainComplex.IsKProjective.Qh_map_bijective` assumes a K-projective source and a derived-category instance. Apply the bijection to the actual geometric endomorphisms, including equalities of their homotopy classes.

### From Tau Ceti

`TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`, `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv` and `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv_naturality`, in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, supply underlying additive sheaf cohomology, coefficient functoriality and natural identification of H⁰ with sections. The underlying construction uses abelian sheaves. For a commutative base ring R and X over Spec R, `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule`, `AlgebraicGeometry.Scheme.Modules.cohomologyMapBaseLinear`, `AlgebraicGeometry.Scheme.Modules.cohomologyZeroBaseLinearEquiv` and `AlgebraicGeometry.Scheme.Modules.cohomologyZeroBaseLinearEquiv_naturality`, in `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean` (lines 45, 57, 110, 127), supply the R-module structures, linear coefficient maps and natural linear H⁰/sections identification. For a short exact coefficient sequence, `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδBaseLinear`, in `TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean` (line 242), supplies the R-linear connecting map. These declarations impose no properness or finite-dimensionality; identification with scalar-linear derived global sections and equivariant perfectness are separate inputs.

`SheafOfModules.exteriorPower` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean` (line 60) sheafifies the sectionwise exterior power and supplies det Ω in arbitrary relative dimension. `AlgebraicGeometry.Scheme.relativeDifferentials` in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean` (line 85) is the sheaf of relative Kähler differentials. `AlgebraicGeometry.Scheme.Modules.instMonoidalClosed` in `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean` (line 66) supplies internal Hom. These are carriers for §1.6, not a coherent Serre-duality theorem.

The field-valued curve sanity check uses `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero` in `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean`: an integral separated Noetherian curve over a field, DVR codimension-one stalks, the valuative existence condition, coheight at most one, the function-field and constant-field hypotheses, and a canonical divisor determined by a nonzero Weil differential. It compares the dual of H¹ of a divisor sheaf with H⁰ of the complementary canonical divisor. It is not used to infer relative finite-coefficient duality.

### From TauCetiRoadmap.AutomorphicBundles

Layers 0–12, in particular 5.10 (`integralLeviCoefficient`), 9.2–9.3 and 12.11 (`ClassicalHecke.operator`): associated coefficients and frame functors (Layer 0); canonical principal bundles (Layer 1); associated bundles and realizations (Layer 3); canonical and boundary-ideal extensions (Layer 5); integral good-prime coefficients (5.10); the Siegel dual BGG complex and its coefficient convention (Layer 9); classical forms and explicit weights (Layer 11); section Hecke operators, convolution and logarithmic Kodaira–Spencer (Layer 12).

What AutomorphicBundles must provide (the integral small-weight dual BGG contract): Extend the coefficient dual BGG graded comparison to the integral p-small Lan–Suh weights, with the correct Weyl or dual-Weyl lattice, cohomological length shifts and canonical/subcanonical boundary twists, and identify its characteristic-zero specialization. The supplying section is 9.2–9.3 (`siegelDualBGGComplex`, `siegelBGGGradedComparison`).

### From TauCetiRoadmap.AlgebraicVectorBundles

L0A–L0C: The scheme-module tensor, dual, pullback, determinant and finite locally free operations, with their coherence and affine comparisons.

### From TauCetiRoadmap.SchemeAndStackFoundations

§§0.18, 1.1, 2.6–2.8, 2.18–2.21, 2.23, 4.8–4.10: Scheme-theoretic support and Cohen–Macaulay schemes (§0.18), quasi-coherent fpqc descent (§1.1), equivariant cohomological descent (§2.23), affine Čech comparison, scalar-linear derived cohomology, ordinary support triangles and Cousin resolutions, depth vanishing, proper coherent upper shriek, the lci upper-shriek identification `upperShriek_lci` (§2.19) consumed by AlgebraicModuliForArithmeticGeometry §7.5's fundamental class, smooth-proper duality and formal functions; use the Noetherian, Tor-independence, perfectness and boundedness conditions stated in those sections.

What SchemeAndStackFoundations must provide (the coefficient-linear coherent comparison contract): Identify Hⁱ of the scalar-linear RΓ(X,F) in D(O) of §2.18 with Tau Ceti’s base-linear scheme-module cohomology, compatibly with cohomologyMapBaseLinear, cohomologyδBaseLinear and the natural linear H⁰/global-sections equivalence. The supplying section is §2.18.

### From TauCetiRoadmap.DerivedModuleAlgebra

§§0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1: Native module-derived tensor and Hom, perfect objects and retracts, object completion (§§1.3–1.5) and perfect inverse-system effectivity (§1.E.1), Matlis duality with its chosen injective hull and signed spectral sequences; arbitrary residue fields use §1.M.2.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§§7.1, 7.3–7.10: Infinite-rank nilpotent lifting and local freeness (§7.5), signed coefficient duality (§7.6), compatible strict coefficient-tower actions (§7.7), completion of finite derived Hom (§7.8), isolated finite derived-action blocks (§7.9), and coefficient/hyper-Tor spectral sequences with finite filtrations on the actual abutment (§7.10). Object completion and effectivity use DerivedModuleAlgebra §§1.3–1.5 and §1.E.1.

### From TauCetiRoadmap.ShimuraCompactifications

4.3–4.10, 6.1–6.11, 6.16–6.17, 7.3–7.17, 7.19–7.31: Toroidal models and polarized degeneration data; common refinements; boundary ideals and fan-independent cohomology; minimal contractions and ample Hodge powers; finite-normalization and normalized-blow-up models with their lattice collections; formally canonical coefficients (7.21); the rational Klingen span (6.16). Normalized models carry no automatic smoothness assertion.

### From TauCetiRoadmap.ReductiveGroups

§§9A, 10B: the induced module ∇(λ)=Ind_(B⁻)^G k_λ of a split connected reductive group over a field, with f(gb)=λ(b)⁻¹f(g) and left translation a·f(g)=f(a⁻¹g), the Weyl module Δ(λ)=∇(−w₀λ)*, their highest-weight and dominance theory, their arbitrary-field base change, and the integral Weyl lattices with their freeness, action equations and the perfect integral evaluation pairing with the dual (§10B); the finite free admissible ℤ-lattice generated from the highest line by divided powers, for every dominant weight (§9A). The integral induced (dual-Weyl) lattice in its function realization is the contract below.

What ReductiveGroups must provide (the integral dual-Weyl lattice contract): Construct the integral induced (dual-Weyl) lattice ∇(λ)_ℤ as the ℤ-dual of the Weyl lattice Δ(−w₀λ)_ℤ in the right-B function realization f(gb)=λ(b)⁻¹f(g) with left translation, for every dominant weight of the split Siegel Levi GL_g×G_m over ℤ, with the symmetric-power versus divided-power identification in residue characteristic and the base-change comparison to the field modules ∇(λ) and Δ(λ) of §10B. The supplying section is §10B.

### From TauCetiRoadmap.ComplexComparisonPartII

C1.9, C2, C3.3: Projective and proper coherent GAGA and derived GAGA for proper algebraic spaces, with the coefficient, pullback and proper-pushforward comparisons. Trace compatibility is specified below.

What ComplexComparisonPartII must provide (the GAGA duality trace contract): Make projective/proper coherent GAGA compatible with the proper duality counit and the actual coherent trace, coefficient twists and boundary-ideal arrows in the toroidal Hecke spans. The supplying section is C1.9, C3.3.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.0, SR.1, SR.2, SR.3, SR.4.1, SR.4.5: Smooth towers, characteristic-zero exact finite invariants, integral convolution and opposite-algebra conventions, parabolic induction and admissibility, normalized Satake and the GSp₄ generator comparison.

What SmoothRepresentationsOfLocalGroups must provide (the boundary spin Satake contract): Prove the local normalized Klingen-Levi GL₂×GL₁ Satake identity P_spin(X)=P₂(X)(X²−uAX+u²D) over coefficient rings with q invertible, where P₂(X)=X²−AX+D has roots α,β, the four spin roots are α,β,uα,uβ, u is the unit value of the unramified GL₁ character at the uniformizer, and q³T₀=uD (equivalently q³T₀=uqS when D=qS); retain the four distinct spin monomials and use X⁴P_spin(1/X) for det(1−X·spin). The supplying section is SR.4.5.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§§2.2–2.3, 3a.1–3a.2, 3b.1–3b.2: Finite integral derived Hecke images and block localization; the spherical spin polynomial and multiplier; residual Galois-type and non-Eisenstein predicates; dual and character-twist transport of full characteristic polynomials.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§§1.1–1.3, 4.1–4.2, 5.5, 6.1–6.7: Relative Lie cochains with their Koszul signs, fixed Hermitian pair, central balancing and actual automorphic occurrences; cuspidal GLₙ purity `clozelPurity` (§5.5) for algebraic cuspidal representations in its fixed Clozel normalization, used for the GL₄ transfer in §8.7; closed GSp₄ chambers (§6.3), component transport (§6.4), coherent discrete-series and limit calculations (§6.5), large-weight and lowest-weight classifications (§6.6), and higher-rank Kostant representatives (§6.7). Its first, global assertion of §6.6 fixes F before its root-separation constant; §8.8 uses the uniform form specified below, in the |·|² central normalization. Its separate negative-parameter singular bound R_sing is used only in §7.3.

What AutomorphicFormsOnReductiveGroups must provide (the uniform global GSp₄ separation contract): Strengthen the first global assertion of §6.6 to: there is R_sep>2 such that for every totally real F, every discrete occurrence and every admissible coefficient in the fixed |·|² central normalization, root separation at every real place implies essential temperedness, with R_sep independent of F, level, coefficient, occurrence and degree. The supplying section is §6.6 (BCGP21 Theorem 3.10.1(2), p. 236).

### From TauCetiRoadmap.AutomorphicSpectralTheory

§§4.1–4.5, 4.10, 5.1–5.8: Multiplicity-counted discrete cuspidal and L² spectra; Petersson adjoints; Wallach’s semisimple arithmetic tempered cuspidality criterion (§4.10); fixed-weight de Rham regularization for the full (m_G,K_∞) pair (§5.2); derived finite-character comparisons (§§5.3–5.4); logarithmically weighted core acyclicity (§5.7a); and uniform-moderate-growth Fin_J acyclicity (§5.8). Su’s parabolic-pair regularization is the separate contract below.

What AutomorphicSpectralTheory must provide (the Su parabolic regularization contract): For a Shimura datum with connected reductive G over ℚ, maximal ℚ-split central torus A_G also maximal ℝ-split in the centre, neat finite level K and finite-dimensional holomorphic P_h-coefficient V, prove that C∞_umg(G)^K→C∞_dmg(G)^K induces isomorphisms on H^i(p_o,K_o;−⊗V) for every i, naturally in V and finite Hecke maps, with G(A_f)-equivariance on the tower after the inverse central action on V_o. The supplying section is §5.2 (Su24 Proposition 4.1, p. 38; coefficient action in §1.1).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§11.1, under the symplectic classification contract of its §§11.0g–11.0h and its fixed unitary normalization: general-type GSp₄ transfer, cuspidality and local-parameter comparison, with every permitted member of its global L-packets automorphic of multiplicity one. Apply this after the stated norm twist to the unitary normalization and transport back. Section 7.0 supplies the geometric application and exclusion of nongeneral types.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§§1.1–1.2, 1.7–1.12; Layer 5: Continuous residual representations, coefficient extension and semisimplification; §1.12’s induction from an open subgroup, for the dihedral summand of §7.0 case (c); recognition from full Frobenius polynomials by Chebotarev and Brauer–Nesbitt, including characteristic two. Retain the symplectic form and its multiplier.

### From TauCetiRoadmap.WeightsInEtaleCohomology

R34.5–R34.6: the classical rank-two eigensummand, its normalized good-prime Frobenius polynomial and every-coefficient-field comparison; R34.6’s Hilbert eigensummands and source-qualified coefficient descent. The underlying continuous representation and geometric/arithmetic Frobenius transport are ArithmeticGaloisRepresentations §§1.1–1.12, 2.2 and 5.1–5.3.

Classical weights at least two use R34.5–R34.6 with ModularCurvesPartII §§14.1–14.4a. Stable lattices, reduction, contragredients and character twists use ArithmeticGaloisRepresentations §§1.1–1.2, 1.7–1.11 and IntegralHeckeAndGaloisDeterminants §§3a–3b.

What WeightsInEtaleCohomology must provide (the classical weight-one realization contract): Supply the continuous rank-two realization of every normalized classical cuspidal weight-one Hecke eigenform, with its full unramified Hecke polynomial outside the level and coefficient characteristic, in the geometric-Frobenius normalization of §7.0; it is consumed by the weight-one Klingen boundary terms of §8.2 through §7.0’s boundary inputs. The supplying section is R34.6.

### From TauCetiRoadmap.ModularCurvesPartII

§§14.1–14.4a: Classical parabolic coefficient realizations and their Hecke and level transport for weights at least two, consumed through WeightsInEtaleCohomology R34.5–R34.6.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

R18.3.29(a): Rank-two realizations for every totally real field and parallel weight k≥2, with unramified polynomial X²−T_vX+q_vS_v at every v outside the level and coefficient characteristic. Its existence branch includes the even-degree case without a finite discrete-series place. Its arithmetic-Frobenius representation is the contragredient of the geometric-Frobenius realization used here; transport the polynomial and central character by that dual, as specified in R18.3.29's Normalization paragraph.

What HilbertModularVarietiesAndShimuraCurves must provide (the non-parallel Hilbert realization contract): Extend the good-prime rank-two realization of R18.3.29 to every non-parallel algebraic Hilbert cusp eigenpacket of weights (k_v) with k_v≥2 and common parity, over every totally real field, without a finite discrete-series-place restriction on its unramified Hecke polynomial. The supplying section is R18.3.29.

### From TauCetiRoadmap.CrystallineCohomology

CR.5.1–CR.5.4, CR.DDR.6.11–CR.DDR.6.14: Logarithmic structures, Cartier-type differentials, exactification and logarithmic PD envelopes (CR.5.2), and logarithmic crystalline/de Rham comparisons with their lifts and residue conditions. The relative logarithmic vanishing needed for the integral vanishing theorem is specified below.

What CrystallineCohomology must provide (the coefficient logarithmic splitting contract): Supply the relative logarithmic vanishing of Lan–Suh Theorem 3.24, pp. 20–21, as verified for PEL pairs in Proposition 7.21, pp. 41–42: a proper log-smooth log-integral morphism of relative dimension n between proper smooth SNC pairs over perfect k, with target dimension e, admits a W(k)-lifting satisfying Assumption 1.4, the coefficient has nilpotent residues and degree m<p−e (or its dual degree 2n−m<p−e with Proposition 1.7), and the line bundle satisfies ampleness condition (3.25). The supplying section is CR.5.4.

### From TauCetiRoadmap.EnhancedDerivedSheaves

§§0.1–0.3, E1.3, E2:towers, E3.2–E3.3, E5:abstract: Stable enhanced sheaf categories, coherent filtered diagrams, derived limits, tensor/Hom, localization and descent on small ringed sites. A triangulated category alone does not supply functorial cones.

E1.9 (`perfect_proper_pushforward`): for a finitely presented morphism f, a perfect complex E and a bounded complex G• of finitely presented modules, termwise flat over the target with proper support, Rf_*(E⊗ᴸG•) is perfect and commutes with arbitrary derived base change. It is used here with G•=O_X[0] for a proper, flat, finitely presented model; target flatness is not dropped.

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

VS2.1 (solidification, the solid abelian subcategory and its closed derived tensor on the compact-Hausdorff site) and VS2.2, analytic measures: the general analytic-ring axiom, complete modules with their reflection, the enhanced complete tensor/Hom and coefficient extension and restriction along morphisms of analytic rings, all on the κ-condensed site. Its integer-solid spectrum is used only to distinguish conventions; the scheme construction here uses (A,A)■ and the scheme Zariski opens.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§7.5: Fundamental classes and the boundary-twisted trace construction on the admitted projectively embeddable correspondences, retaining the relative Cartier and inverse-image boundary hypotheses.

## How to read the build

Layers 1 and 2 construct integral coefficients, duality and equivariant perfect models. Layer 3 constructs the permitted correspondences and separates completion/compact-support filtrations from ordinary local cohomology. Layer 4 fixes normalization and compares geometric operators with the tower. Layer 5 proves vanishing, then the integral convolution relations, then Hecke localization. Layer 6 constructs the distinct automorphic images. Layer 7 applies the supplied local coherent calculations and the explicit conditional global contract. Layer 8 computes the two boundary problems in their separate degree ranges and obtains the cuspidal and dimension conclusions. The roadmap is this README; `Suggested.lean` documents which genuine headline carriers exist at the pins.

## Layer 1: integral coefficients and coherent duality

### 1.1 The integral de Rham Levi torsor

Extend AutomorphicBundles 5.10’s good-prime torsor to the normalized deep-level models of ShimuraCompactifications 7.19–7.31. On such a supplied toroidal Siegel model over O with finite locally free logarithmic Hodge factors and its polarized degenerating abelian family and logarithmic Hodge sequence, let M_dR be the torsor of triples (ψ₁,ψ₂,c), with ψ₁:O^g≃Lie(A), ψ₂:O^g≃ω_(Aᵗ), c a unit, and ψ₂=c(ψ₁ᵗ)⁻¹ after the polarization identifies the Hodge factors. It is a right torsor under the Siegel Levi M≃GL_g×G_m. The family, its dual and polarization are the extensions supplied by the compactification model; arbitrary semi-abelian schemes are not asserted to admit this datum.

(BP26, §4.3.1, p. 46).

A proof route is to use the extended logarithmic Hodge sequence and polarization from ShimuraCompactifications Layers 6 and 7 and the deep-level models from 7.19–7.31. Trivialize Lie(A) locally and construct ψ₂ from ψ₁ and c; verify the Levi change-of-frame law. Identify the generic fibre with the parent principal bundle reduced to its Hodge Levi.

Its API is:

- Specify the right GL_g×G_m action, including the multiplier on ψ₂.
- A local basis of Lie(A) gives an M-equivariant trivialization of the torsor.
- After inverting p, the associated bundles agree with AutomorphicBundles Layers 1–5 through the Hodge filtration.
- The frame action preserves ψ₂=c(ψ₁ᵗ)⁻¹ and obeys identity and multiplication laws.
- Pulling back the model and polarization pulls back this torsor with its action and frame trivializations.

*Needs:* AutomorphicBundles 5.10; AutomorphicBundles Layer 1; ShimuraCompactifications 6.1–6.11; ShimuraCompactifications 4.3–4.10 and Layer 7; ShimuraCompactifications 7.19–7.21, 7.31.

**Checks.**

- For g=1, scaling the Lie frame by a unit u scales the dual frame by u⁻¹; with Lie frame u the dual frame is c/u. At ψ₁=4 and c=3 the dual frame is 3/4, half of the value 3/2 at ψ₁=2; the factor c/u would give 9/4 and ψ₁ψ₂=9≠c.
- A rank-zero graded Hodge bundle leaves exactly the multiplier G_m torsor.
- Changing ψ₂ independently of ψ₁ and c does not define a point of M_dR.
- On a split rank-one chart over ℚ, ψ₁=2 and c=3 force ψ₂=3/2, giving ψ₁ψ₂=3. Taking ψ₂=2 instead gives 4 and fails the polarization law.

### 1.2 Integral dual-Weyl automorphic coefficients

Extend AutomorphicBundles 5.10’s associated coefficients on those normalized deep-level models, using the integral dual-Weyl lattice of ReductiveGroups §10B (the integral dual-Weyl lattice contract). For a dominant Levi weight κ and an integral dual-Weyl module V_κ imported from ReductiveGroups §10B, define ω^κ=M_dR×^M V_κ using AutomorphicBundles Layer 0’s associated-bundle functor. With right B-equivariance f(mb)=(w₀,Mκ)(b⁻¹)f(m), left translation is (m′f)(m)=f(m′⁻¹m). Thus ω^κ is π_*O_(M_dR)[−w₀,Mκ], with this action. Use its canonical and boundary-ideal subcanonical extensions on the supplied integral model; do not replace an integral dual-Weyl module by its characteristic-zero semisimplification.

(BP26, §4.3.1 and Remark 4.3.2, pp. 46–47).

A proof route is to import the integral induced representation and its base-change API from ReductiveGroups §10B. Apply AutomorphicBundles Layer 0’s associated-bundle functor to M_dR and compare local equivariant functions. Identify extensions through their toroidal charts and boundary ideal; preserve the left action order.

Its API is:

- In a frame, ω^κ identifies with O⊗V_κ with the stated transition law.
- Allowed coefficient base change commutes with the associated bundle and with its integral lattice.
- The boundary ideal inclusion gives ω^κ_sub→ω^κ_can, functorially in the coefficient.
- An M-equivariant integral module map induces a bundle map; identities and composites are preserved.
- Use AutomorphicBundles Layer 0’s tensor/dual comparisons with the integral representation maps and boundary twists; do not identify a dual-Weyl dual with the same weight in positive characteristic.

*Needs:* AutomorphicBundles 5.10; §1.1; AutomorphicBundles Layer 0; AutomorphicBundles Layer 5; ReductiveGroups §10B (the integral dual-Weyl lattice contract).

**Checks.**

- Weight zero gives O and its subcanonical counterpart I_D.
- In characteristic zero the construction agrees with AutomorphicBundles Layer 5’s automorphic extension.
- The formula f(m⁻¹m′) for left translation fails even the identity law: with m′=1, m the permutation matrix of (123) in GL₃ and the regular function f(m)=m₂₁, it gives 0 instead of 1. For the upper Borel this coordinate has right character b₁₁, so the failure also occurs in an induced weight space.
- The left translation is a representation and commutes with the right B law.

### 1.3 The Siegel weight dictionary

For g=2 and integers a≥b, set ω(a,b)=Sym^(a−b)(E)⊗det(E)^b, E the rank-two Hodge bundle. Pilloni’s Ω^(k,r) is ω(k+r,r). In CG20’s Levi coordinates the natural coefficient is W_(a,b;−a−b); changing the central coordinate preserves the underlying bundle and changes its Hecke linearization. In BP26’s coordinates Lie(A) has weight ((0,…,−1);1) and ω_A weight ((1,0,…);−1). The dictionary identifies the actual multiplier characters rather than identify differently named central coordinates by notation. In the parent W/V realizations, W_(a,b;c) corresponds to V_(−b,−a;a+b+2c). For x≠0, the natural coefficient W_(a,b;−a−b) has scalar action x^(a+b); since ν(xI₄)=x², twisting its Hecke linearization by ν⁻³ multiplies this by x⁻⁶ and changes c to 3−a−b. This coefficient-character calculation precedes the archimedean and Galois comparisons of §7.0.

(CG20, §5.3, pp. 23, 26–27; compare BP26 Remark 4.3.3, p. 47 and P20 §5.3, p. 24; coefficient comparison in Lemma 5.4, p. 27).

A proof route is to evaluate the standard, dual and determinant representations on the diagonal Levi. Use the logarithmic sequence 0→W_(1,0;0)→H¹_dR→W_(0,−1;1)→0 and O(1)=W_(0,0;1). Compare on a frame; record the change of central linearization separately from the underlying sheaf isomorphism.

Its API is:

- The standard coefficient is E, the determinant coefficient is det(E), and the trivial coefficient is O.
- The equality Ω^(k,r)=ω(k+r,r) respects coefficient morphisms and scalar extension.
- The Lie/Hodge duality reverses both the GL₂ highest weight and multiplier; central twists record their Hecke action.
- A ν^t twist multiplies the scalar character by x^(2t) and changes the W central coordinate by −t; the W/V relation retains a+b+2c.

*Needs:* §1.2; AutomorphicBundles Layer 11; AutomorphicBundles Layer 3.

**Checks.**

- At (a,b)=(1,0), ω(1,0)=E has rank 2; at (0,0), it is O of rank 1.
- At (1,1), ω(1,1)=det(E) has rank 1, rather than Sym²(E) of rank 3.
- At (k,r)=(0,2), Ω^(0,2)=ω(2,2)=det(E)²; it is not ω(0,2).
- Lie(A) has weight ((0,−1);1), while ω_A has ((1,0);−1). Dualizing the latter gives the former, with multiplier −1 becoming 1.
- At (a,b)=(5,2) and x=2, the natural scalar is 2⁷=128, ν(2I₄)=4, and the ν⁻³ factor is 4⁻³=1/64; the normalized scalar is 2. Using ν³ instead gives 8192.

### 1.4 Integral coherent cohomology complexes

For a proper toroidal O-model X and finite locally free F, let C_can(F)=RΓ(X,F_can) and C_sub(F)=RΓ(X,F_sub) in D(O); their reductions are derived coefficient tensors. Retain the canonical arrow C_sub→C_can. Under proper flat finite-presentation and perfect-coefficient hypotheses these objects are perfect over O. They are not automatically perfect over a deck-group ring.

(BP26, §1.1, p. 2; CG18 §7.2, pp. 395–398).

A proof route is to use native derived sheaf cohomology and the boundary ideal inclusion. Apply EnhancedDerivedSheaves E1.9 (`perfect_proper_pushforward`) to the structure morphism X→Spec O, with E=F_can or F_sub perfect and G•=O_X[0], under the proper, flat, finite-presentation hypotheses; the same target gives the base change to A_n. Identify its cohomology with Tau Ceti’s base-linear scheme-module cohomology through the derived comparison contract.

Its API is:

- H^i(C_*(F)) is the base-linear H^i(X,F_*); its coefficient maps and connecting maps agree with the pinned base-linear maps.
- Derived base change to A_n gives RΓ(X_(A_n),F_*(A_n)) under the proper perfect base-change hypotheses.
- Coefficient morphisms commute with C_sub→C_can.
- RΓ sends identity and composite coefficient maps to identity and composites, additively and O-linearly.
- The boundary ideal sequence gives the full derived triangle and long exact cohomology sequence, naturally for coefficient maps.

*Needs:* §1.2; AlgebraicModuliForArithmeticGeometry §7.5 (the boundary fundamental-class contract); DeformationAndDerivedPatchingAlgebra §§7.1–7.9; EnhancedDerivedSheaves E1.9 (perfect proper-support pushforward and its base change); SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`.

**Checks.**

- For empty D, the boundary arrow is the identity.
- On Spec O with F=O and empty D, both complexes are O in degree zero.
- For O→O in degrees 0,1 with differential ϖ, H⁰=0 and H¹=k; derived reduction has zero differential and H⁰=H¹=k. Thus reduction of H⁰ alone misses k.
- Target flatness is needed: for Spec k→Spec A with A=k[ε]/(ε²), the structure sheaf is perfect on Spec k but its pushforward k has Tor_j^A(k,k)=k for every j≥0, so it is not perfect over A. A flat proper model such as ℙ¹_O with F=O(−2) gives RΓ=O[−1], and base change to A₂ gives A₂[−1].
- Over k of characteristic p with Δ=Cₚ, the trivial module k[0] is perfect over k and over O, but Tor_j^(k[Cₚ])(k,k)=k in every j≥0, so it is not perfect over k[Cₚ].

The coefficient abbreviation `dvrCoefficientRing` of Conventions has its native quotient ring structure. Its API is:

- The quotient map O→Aₙ kills ϖⁿ and has kernel (ϖⁿ).
- For 1≤m≤n, quotient reduction gives Aₙ→Aₘ, preserving composites of reductions.
- For a uniformizer and n>0, multiplication x↦x/ϖⁿ modulo O identifies Aₙ with the ϖⁿ-torsion in E/O, as in §1.5.

**Checks.**

- For O=ℤ₃, ϖ=3 and n=1, the quotient is 𝔽₃ and 3 maps to zero.
- For n=2, the quotient is ℤ/9; 3 is nonzero and 3²=0. Reduction to n=1 sends its class to zero.
- At n=0 the ideal is (1), giving the zero ring; the duality headline admits this input, where both sides are the zero module.

For the duality signature define `integerCoherentCohomology` as the base-linear module H^i(X,F) for i≥0 and the zero module for i<0. It is a ModuleCat object on the native scheme-module cohomology, with no properness or finiteness assumption. Its API is:

- In nonnegative degrees it agrees with the pinned base-linear cohomology, including coefficient maps.
- In negative degrees it is the zero module, so the extension is compatible with the cohomology of a sheaf placed in degree zero.
- Coefficient identities, composites and scalar actions extend by the unique maps between zero modules in negative degrees.

**Checks.**

- For Spec Aₙ and F=O, degrees −1,0,1 give 0,Aₙ,0; replacing a negative integer by its natural part would incorrectly give Aₙ at −1.
- For F=0 all integer degrees give the zero module.
- For multiplication by ϖ on O in degree zero, the coefficient map is multiplication by ϖ; in negative degree it is the sole map 0→0.

### 1.5 Coherent homology over a DVR

Let O be a complete DVR with uniformizer ϖ, fraction field E, residue characteristic p, A_n=O/ϖ^n with n≥1, and Y/O smooth proper of pure relative dimension d. For finite locally free F define H_i(Y,F⊗A_n)=Hom_O(H^i(Y,F^∨⊗ω_(Y/O)⊗A_n),E/O). Deck transformations act contragrediently. The coefficient dual is Matlis dual over O; identifying it with Z_p-Pontryagin dual requires a chosen character and the inverse different.

(CG18, §7.2, pp. 395–396; CG20 §7.2, p. 51).

A proof route is to form the coherent dual coefficient F^∨⊗ω and take its cohomology. Apply Hom_O(−,E/O), using injectivity over a DVR and inverse deck action. Construct comparison maps under finite étale pullback by dualizing trace.

Its API is:

- Specify evaluation into E/O and its functorial O-linear duality.
- On a functional λ, δ acts by λ∘δ⁻¹.
- A_n≃Hom_O(A_n,E/O) through a↦(b↦ab/ϖ^n mod O), with the chosen uniformizer.
- A map F→G induces H_i(F)→H_i(G) by dualizing the contravariant dual-coefficient map; identity and composition are preserved.
- Evaluation satisfies ⟨δλ,δx⟩=⟨λ,x⟩ and is O-balanced; finite étale pullback and trace are adjoint under it.

*Needs:* DeformationAndDerivedPatchingAlgebra §§7.1–7.9; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; §1.4.

**Checks.**

- For Y=Spec O and F=O, H_0(Y,A_n)≃A_n.
- H_i is zero when the defining coherent cohomology group is zero.
- For p odd, O=Z_p[ϖ] with ϖ²=p has different (2ϖ). The trace character identifies the Z_p-dual lattice with (2ϖ)⁻¹O, whereas the definition evaluates in E/O. A claimed canonical identification using O itself and no inverse different fails this ramified example.
- Over 𝔽₅ let δ act on a coefficient line by 2 and let λ(1)=1. Then (δλ)(1)=3 and ⟨δλ,δ·1⟩=3·2=1. Using δ instead of δ⁻¹ on λ gives 2·2=4≠1.

### 1.6 Finite-coefficient Serre duality

The headline `finiteCoefficientSerreDuality` applies to a smooth proper scheme X over Aₙ of pure relative dimension d and a finite locally free coefficient F, for every integer i: Hom_(Aₙ)(H^i(X,Hom(F,det Ω¹_(X/Aₙ))),Aₙ)≃H^(d−i)(X,F), with the negative-degree extension of §1.4. Its explicit hypotheses are a DVR O and an irreducible uniformizer ϖ; it is stated for every n≥0. The Conventions' completeness is not used, since O/ϖⁿ≅Ô/ϖⁿÔ, and at n=0 the coefficient ring is zero and both sides vanish. No lifting of X to O is required for this Gorenstein-base duality, and no residue-characteristic restriction is imposed. Mixed characteristic, equal characteristic and residue characteristic zero are included. For Y/O and F as in §1.5, take X=Y_(Aₙ); duality over A_n then identifies H_i(Y,F⊗A_n) with H^(d−i)(Y_(A_n),F⊗A_n), using the self-duality A_n→Hom_O(A_n,E/O). The perfect derived pairing over A_n is RΓ(Y_(A_n),F_(A_n))⊗^L_(A_n)RΓ(Y_(A_n),F_(A_n)^∨⊗ω_(Y_(A_n)/A_n))[d]→A_n. Its trace is a morphism; it is not an isomorphism RΓ(ω)[d]≃A_n. Deck and coefficient maps are adjoint with the inverse-action convention.

(CG18, §7.2, pp. 395–396, 398–400).

A proof route is to use the smooth dualizing identification f!A_n=ω[d] and proper coherent duality. Apply the chosen self-duality of the Artinian Gorenstein coefficient ring and exact Matlis duality. Check the evaluation trace on Čech representatives and the inverse deck action.

*Needs:* §1.5; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; DeformationAndDerivedPatchingAlgebra §§7.1–7.9.

**Checks.**

- For Spec Aₙ, d=0 and F=O, the degree-zero duality is Hom_(Aₙ)(Aₙ,Aₙ)≃Aₙ; in degrees i=−1 and 1 both sides are zero.
- For a genus-one curve over k=A₁, RΓ(ω)[1] has H⁻¹=k and H⁰=k. Thus the trace is not an isomorphism with k[0].
- At n=0, the coefficient quotient is O/(1)=0, Spec of it is empty and both sides are 0; at O=ℤ₃, ϖ=3 and n=2 it is ℤ/9. The theorem admits both inputs; on Spec of ℤ/9 with d=0 and F=O the degree-zero sides are Hom(ℤ/9,ℤ/9)≅ℤ/9 and ℤ/9.
- Dropping both the finite-local-freeness and DVR-quotient restrictions fails: for B=k[ε,δ]/(ε,δ)² and F=k, Hom_B(k,B) has k-dimension 2 and its B-dual has dimension 4, while F has dimension 1. Such F is not locally free; both the coefficient and base hypotheses are retained.

### Examples

For a rank-two Hodge bundle E, the weights (1,0), (1,1), (2,2) give ranks 2,1,1 and coefficients E, det(E), det(E)². Over ℚ, for g=1, Lie frame 2 and c=3 give dual frame 3/2; replacing it by 2/3 reverses the prescribed polarization relation.

### Dependencies

AlgebraicModuliForArithmeticGeometry §7.5 (the boundary fundamental-class contract); AutomorphicBundles Layer 0; AutomorphicBundles Layer 1; AutomorphicBundles Layer 3; AutomorphicBundles Layer 5; AutomorphicBundles Layer 11; DeformationAndDerivedPatchingAlgebra §§7.1–7.9; EnhancedDerivedSheaves E1.9; ReductiveGroups §10B; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; ShimuraCompactifications 4.3–4.10 and Layer 7; ShimuraCompactifications 6.1–6.11; ShimuraCompactifications 7.19–7.21, 7.31; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`. Earlier in this layer use the individual prerequisites displayed above.

## Layer 2: equivariant coherent perfect complexes

### 2.1 The equivariant Čech model

Let f:Y→X be a finite étale Galois cover of smooth proper O-schemes with finite abelian p-group Δ, and let F be finite locally free on X. Choose a finite affine cover of separated X; its inverse-image cover gives a bounded alternating Čech complex for f*F⊗A_n with its actual Δ action, computing RΓ(Y,f*F⊗A_n). Its terms may have infinite rank over A_n[Δ]. Refinements give the same derived object.

(CG18, §7.2, pp. 397–398).

A proof route is to pull back the affine cover; finite étale maps and finite intersections preserve affineness. Apply affine quasi-coherent acyclicity and Čech comparison. Write each coefficient term as N⊗_A B and preserve all deck operators in the differentials.

Its API is:

- Build the complex with alternating restrictions and the natural deck action.
- Identify its cohomology with coherent cohomology naturally in F and n.
- Cover refinement induces the canonical derived isomorphism compatible with Δ and coefficient reduction.
- A coefficient map induces the termwise Δ-equivariant cochain map, preserving identity and composition.
- Derived A_n→A_m reduction, m≤n, agrees with the corresponding geometric derived coefficient comparison and commutes with cover refinement.

*Needs:* §1.4; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21.

**Checks.**

- For a trivial Δ-torsor over an affine X with the single-open cover, the degree-zero term is (Γ(X,F)⊗_O A_n)⊗_(A_n) A_n[Δ], with the regular deck action; no integral O[Δ] coefficient remains.
- For Δ=1 this is the ordinary affine Čech construction.
- Replacing the group-ring terms by their Δ-invariants loses the upstairs cohomology object.
- The model is equivariant before passing to cohomology, and no finite-generation claim is made for its terms.

### 2.2 Étale Galois projectivity

For a finite étale Galois cover f:Y→X with finite group Δ, f_*O_Y is locally projective as an O_X[Δ]-module. If X is flat over A, it is A[Δ]-flat. For a Δ-pulled-back finite locally free coefficient the same flatness holds. For an affine torsor in characteristic p with Δ a p-group, its coefficient module is free over k[Δ], possibly of infinite rank; local projectivity does not in general give a global integral normal basis over O_X[Δ].

(BP26, Lemma 2.6.11, p. 22; CG18 proof of Lemma 7.7, p. 398).

A proof route is to trivialize the torsor étale locally, where its algebra is the free regular O_X[Δ]-module. Descend finite projectivity and use flatness of the base algebra over A. For the affine characteristic-p assertion use Nakajima’s theorem and the local Artinian structure of k[Δ], not averaging by |Δ|.

*Needs:* §2.1; SchemeAndStackFoundations §§1.1, 2.23; SmoothRepresentationsOfLocalGroups SR.1.

**Checks.**

- For the trivial C₂-torsor over 𝔽₂, the algebra 𝔽₂×𝔽₂ is free of rank one over 𝔽₂[C₂], with basis vector (1,0) and its translate (0,1). The trace sends (1,0) to 1 although the group order is 0 in 𝔽₂.

### 2.3 Integral Čech freeness

Let O be a complete DVR with residue characteristic p and let Δ be a finite abelian p-group. For a finite étale Δ-torsor Spec B→Spec A with A flat over O and an A-module N flat over O, the module (N⊗_A B)/ϖ^n is free over A_n[Δ] for each n≥1. This allows infinite rank. O-flatness of N⊗_A B, characteristic-p Galois projectivity and the nilpotent coefficient-lifting criterion are essential.

(CG18, Lemmas 7.5–7.7, pp. 396–398).

A proof route is to use O-torsion-freeness to identify successive ϖ-adic quotients. Apply the characteristic-p affine projectivity theorem to reduction modulo ϖ. Lift a free k[Δ]-basis through the nilpotent ideal (ϖ), using CG18 Lemmas 7.5–7.6; the module-lifting interface is DeformationAndDerivedPatchingAlgebra §7.5.

*Needs:* §2.2; DeformationAndDerivedPatchingAlgebra §§7.1–7.9.

**Checks.**

- For A=O and N=O with the trivial Δ-torsor, the quotient is A_n[Δ], free of rank one; finite projective coefficients recover the geometric case.
- For N=⊕_(j≥0)O, it is ⊕_(j≥0)A_n[Δ], of infinite rank.
- For Δ=1 and N=O/ϖ, which is not O-flat, n=2 gives k, not free over O/ϖ²; the flatness hypothesis excludes it.

### 2.4 Perfect models for coherent cohomology and homology

For the cover and coefficient of §2.1, there is a bounded finite projective A_n[Δ]-complex representing RΓ(Y,f*F⊗A_n). Apply this to f*F^∨⊗ω_(Y/O) to obtain C_n^∨. Its A_n-linear derived dual, with inverse Δ action, gives C_n with H_i(C_n)=H_i(Y,f*F⊗A_n), after the Serre-dual coefficient is used on the cochain side. Choose the convention C_n^∨ represents RΓ(F^∨⊗ω), so C_n is its coefficient-dual chain model. Group-ring coefficient reduction means A_m[Δ]⊗^L_(A_n[Δ])C_n^∨, equivalently derived reduction of its termwise A_n-free model. Models and Hecke lifts are canonical only in the derived category or up to homotopy.

(CG18, §7.2, p. 398 and pp. 399–400).

A proof route is to deduce finite Tor amplitude over the Noetherian ring A_n[Δ] from the bounded free Čech model. Properness gives finite cohomology over A_n and hence A_n[Δ]; apply the Noetherian perfectness criterion. Take the imported finite-projective dual model and use evaluation to identify its chain homology.

Its API is:

- C_n^∨ identifies with the specified coherent dual-coefficient complex.
- C_n computes the coherent homology defined in Layer 1, with inverse deck action.
- Two finite projective models carry a homotopy equivalence inducing the same derived identification.
- Transport geometric morphisms through the chosen derived identifications, independent up to homotopy of projective representatives.
- The model comparisons commute with derived deck coinvariants and coefficient reduction as proved by §2.5.

*Needs:* §2.3; §1.6; DeformationAndDerivedPatchingAlgebra §§7.1–7.9.

**Checks.**

- For the trivial torsor over Spec O, the model is A_n[Δ] in degree zero.
- For Δ=1 the conclusion reduces to proper perfect coherent pushforward.
- A bounded complex of infinitely generated free Čech terms is not itself a finite perfect representative.
- On ℙ¹_k with F=O, H⁰(F)=k and H¹(F)=0, whereas H⁰(F∨⊗ω)=0 and H¹(F∨⊗ω)=k. The unshifted dual reverses the degree; it cannot represent the same cochain coefficient.

### 2.5 Derived coefficient change and deck descent

The equivariant models have derived coefficient compatibility A_m⊗^L_(A_n)C_n^∨≃C_m^∨ for 1≤m≤n, and homological deck descent C_n⊗^L_(A_n[Δ])A_n≃C_n(X,F). Thus Tor_i^(A_n[Δ])(H_j(C_n),A_n)⇒H_(i+j)(X,F⊗A_n). In degree zero H_0(Y,F)_Δ≃H_0(X,F); the five-term edge sequence includes Tor₂(H_0(Y,F),A_n)→H_1(Y,F)_Δ→H_1(X,F)→Tor₁(H_0(Y,F),A_n)→0. No injectivity of the second arrow is asserted without extra Tor vanishing.

(CG20, §7.2, proof of Theorem 7.11, p. 53; CG18 §7.2, pp. 398–400).

A proof route is to use the affine torsor descent equivalence and the termwise free group-ring Čech model. Apply derived tensor and its hyper-Tor spectral sequence with homological indexing. Read the low-degree filtration before imposing any concentration or projectivity of homology groups.

*Needs:* SchemeAndStackFoundations §2.23; §2.4; §2.2; DeformationAndDerivedPatchingAlgebra §§7.1–7.10.

**Checks.**

- In the algebraic descent model R=𝔽₂[C₂]=𝔽₂[t]/(t²), take C=[R → R] in homological degrees 1,0 with differential t. Both homology groups are k=𝔽₂, and C⊗_R k has zero differential. The edge Tor₂^R(k,k)=k→H₁(C)⊗_R k=k is an isomorphism, while the next map to H₁(C⊗_R k)=k is zero because t maps to 0. Deleting Tor₂ would falsely make that zero map injective.
- For [O → O] in cohomological degrees 0,1 with differential ϖ, H⁰=0 and H¹=k; after derived reduction both groups are k. In the §7.10 coefficient spectral sequence the new H⁰ is Tor₁^O(k,k)=k, not H⁰(C)⊗k=0.

### Examples

For the trivial C₂-torsor over Spec O and N=⊕_(j≥0)O, the affine term modulo ϖ² is ⊕_(j≥0)(O/ϖ²)[C₂]. Its deck-invariant module has one coefficient per copy, while the upstairs module has two. In characteristic two these conclusions still hold although |C₂|=0 in the field.

### Dependencies

DeformationAndDerivedPatchingAlgebra §§7.1–7.10; SchemeAndStackFoundations §§1.1, 2.23; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; SmoothRepresentationsOfLocalGroups SR.1. Earlier in this layer use the individual prerequisites displayed above.

## Layer 3: cohomological correspondences and filtrations

### 3.0a Solid coefficients on schemes

For a qcqs Noetherian scheme X over the fixed coefficient base O, construct the stable enhanced category by gluing D((A,A)■) on affine Zariski charts Spec A. Here A is discrete, (A,A)■ is the analytic ring defined after CS19 Definition 9.1 (p. 62) as the filtered colimit over finitely generated discrete Huber pairs, and the global category is D((O_(X^ad),O⁺_(X^ad))■) on X^ad, with X^ad=Spa(A,A) on an affine chart. The analytic-ring/measure interface is imported from VStackSheavesAndLisseCategories VS2.2; the scheme gluing, six operations and coherent comparison are the targets here. The coefficients and all covers lie in fixed universes. Every solid category here is the κ-condensed abelian category D((A,A)■) of CS19; no light-condensed or spectral carrier is used, and prime-adic completion is the derived completion of §3.11. Restriction along affine maps is the supplied solid scalar extension; Zariski descent identifies affine restrictions and their tensor/Hom. For separated finite-presentation morphisms with an open-immersion/proper compactification, construct lower shriek and its right adjoint upper shriek, independent of compactification, together with pullback and direct image. Prove composition, tensor projection, Tor-independent classical base change and the compactification comparison; for a non-Tor-independent square use a derived fibre product, not its ordinary scheme fibre product. Construct the discrete-coefficient functor from bounded coherent complexes, with a natural comparison of upper shriek for proper maps in the Noetherian coherent-duality regime; prove the natural comparison is an isomorphism on the proper bounded perfect coherent inputs of §§3.1–3.13, under the stated finite-Tor and pseudo-coherence hypotheses. Constructing this comparison is part of this target. Prime-adic completion of solid objects is not identified with an uncompleted discrete coefficient.

For an ideal I defining Z construct the closed locale with its completed solid algebra and the two localization triangles of §3.11. Its restriction and support functors must form coherent filtered diagrams, so that the maps of §3.12 act on the actual spectral sequence, not a family of unrelated pages. CS19 Theorem 9.8, pp. 65–70, gives the gluing for arbitrary discrete Huber pairs; Lecture XI, Proposition 11.2 and Definition 11.3, pp. 73–74, constructs the operations for separated finite-type maps of qcqs schemes over arbitrary discrete rings. CS19 Proposition 11.4, p. 74, supplies the finite-Tor comparison regime and flat base change. BP26 §2.2, p. 12, restricts its schemes to finite type over ℤ; its completion and filtration arguments in §§2.6–2.9 are extended here using the explicit ring formalism, retaining their boundedness and pseudo-coherence assumptions (BP26 Lemma 2.9.3, pp. 27–28; Theorem 2.9.7 and Proposition 2.9.9, pp. 28–29).

The API supplies:

- the source, target, unit and counit of each adjunction and their identity/composition coherences;
- descent comparisons on overlaps, with compatibility for tensor and scalar extension;
- the discrete comparison on proper coherent inputs and its trace compatibility;
- the completed-locale algebra, completion unit and open-complement maps with both localization triangles;
- natural maps of complete filtered objects, compatible with their graded terms, spectral differentials and abutment.

*Needs:* VStackSheavesAndLisseCategories VS2.1 (solidification, the solid abelian subcategory and its closed derived tensor); VStackSheavesAndLisseCategories VS2.2 (analytic measures: complete modules, reflection, complete tensor and scalar extension); EnhancedDerivedSheaves §§0.1–0.3, E1.3, E2:towers and E3.2–E3.3; SchemeAndStackFoundations §§2.18–2.21, 4.8–4.9; Layer 1. No automorphic spectral comparison is an input.

**Checks.**

- For X=Spec O with O=W(𝔽̄_p) or ℂ[[t]], the analytic ring is (O,O)■ formed with O discrete; for the identity map, all four operations are identity, and the adjunction composite sends 1 to 1. A zero counit fails this test.
- For I=(0), completion is the identity and the open complement is empty; for I=(1), the completion is zero and the open complement is X. Ordinary local cohomology with support agrees with completion at both endpoints (A in the first case, 0 in the second), so these endpoints separate completion from the open-complement term but not from local cohomology; the k[x] Check below separates those two.
- For the discrete O-complex O→O with differential ϖ, derived reduction has k in degrees zero and one, whereas underived reduction of its cohomology loses degree zero. The discrete comparison must preserve this triangle.
- On Spec k[x], localization at x is the open Spec k[x,x⁻¹] in this convention; the integer-solid convention instead makes principal localization closed. Local cohomology at (x) has H¹=k[x,x⁻¹]/k[x], while completion is k[[x]] in degree zero. The two localization triangles cannot be identified.

### 3.0b The additional compactified p-level spans

Construct the characteristic-zero paramodular and Siegel/Klingen/Iwahori p-level coefficient spans needed in §4.2 on the normalized models of ShimuraCompactifications 7.19–7.31, retaining their lattice collections and polarization multipliers. The rational Klingen span is ShimuraCompactifications 6.16. Extend the generic isogeny to the chosen toroidal charts after a common refinement and give proper first legs and the reduced-boundary fundamental classes required for §3.4; no finite-flatness or smoothness of a normalized bad-level model follows from its generic fibre. The integral divisibility statement remains §4.2. (P20 §4.3, p. 19 and §§14.8–14.9, pp. 101–105; BP26 §4.3.1, pp. 46–47.)

Its API is:

- identify the open correspondence and the source and target of both coefficient pullbacks;
- compare the spans and their coefficient maps under common fan refinements;
- multiply the specified polarization multipliers under composition;
- give the proper trace on the admitted coefficient complex, naturally in its maps;
- identify the generic coefficient transport with AutomorphicBundles Layer 12’s operator.

*Needs:* ShimuraCompactifications 4.3–4.10, 6.11, 6.16, 7.19–7.31; AlgebraicModuliForArithmeticGeometry §7.5; §§3.1–3.8 for the resulting coefficient maps. This geometry is used only after the general correspondence formalism has been constructed.

**Checks.**

- For the identity isogeny, both legs and its multiplier are identity, so the operator is 1.
- Multiplication by p on a Hodge line gives multiplication by p on the integral lattice and is invertible after 1/p; its inverse is not integral.
- The normalization chart q=tᵖ is ramified at t=0, since dq=p t^(p−1)dt. It does not justify a finite-étale boundary trace by its open description alone.

### 3.1 Cohomological correspondences

For separated finite-type S-schemes C,X with (p₁,p₂):C→X×_S X proper, and coefficient complexes F,G on X, a cohomological correspondence is a morphism T:Lp₂*F→p₁!G in the coherent/discrete derived category when the indicated operations and boundedness exist. When p₁ is proper its adjoint is Rp₁*Lp₂*F→G; in the solid six-operation setting the general adjoint uses lower shriek (p₁)!, not unrestricted Rp₁*. The solid version uses the stable solid O-module category and upper shriek constructed in §3.0a, with its specified discrete comparison.

(BP26, §2.1.7, Definition 2.1.8, p. 7; §2.2.9, p. 14; §2.3.12, p. 17; P20 Definition 4.3.1, p. 19).

A proof route is to use the imported coherent pullback/upper-shriek adjunction in its permitted derived categories. Specify the coefficient morphism and the proper support of the geometric correspondence. Compare the discrete embedding with the solid envelope only after the six-operation comparison of §3.0a is supplied.

Its API is:

- For proper p₁ identify T with Rp₁*Lp₂*F→G by coherent duality.
- The diagonal correspondence and identity coefficient morphism give the identity correspondence.
- Precomposition in F and postcomposition in G act functorially on correspondences.
- On fixed legs two correspondences agree exactly when their coefficient arrows Lp₂*F→p₁!G agree.
- For fixed legs the coefficient arrows form an O-module; coefficient pre/postcomposition is O-linear.

*Needs:* SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; §3.0a for the solid branch.

**Checks.**

- For p₁=p₂=id the correspondence is exactly a morphism F→G.
- For finite étale p₁ the standard trace turns a coefficient isomorphism into the AutomorphicBundles Layer 12 degree-zero pull–trace map.
- Reversing p₁ and p₂ without dualizing coefficients does not define the same adjoint morphism.
- For C=X, p₁=p₂=id and F=G=O, coefficient multiplication by 2 gives the endomorphism 1↦2 under adjunction; the zero coefficient map gives 1↦0.

### 3.2 The map on derived global sections

If p₁ is proper and T:Lp₂*F→p₁!G, define RΓ(T) as RΓ(X,F)→RΓ(C,Lp₂*F)→RΓ(C,p₁!G)→RΓ(X,G), using the pullback unit, T and the proper trace counit. It induces all degree-i maps. Proper support alone is insufficient for this unqualified global formula unless an appropriate supported pushforward is used.

(P20, Definition 4.3.1 and Remark 4.3.2, p. 19; BP26 §§2.2.9, 2.3.12, pp. 14, 17).

A proof route is to form the unit for p₂ and the adjoint of T under proper p₁ duality. Apply derived global sections and the trace counit. Compare degree zero with the existing section operator when p₁ is finite locally free.

Its API is:

- Extract H^i(T) from the single derived operator.
- The identity correspondence acts by the identity on RΓ.
- For the AutomorphicBundles Layer 12 finite-flat correspondence and its trace, H⁰(T) is AutomorphicBundles 12.11 `ClassicalHecke.operator`.
- The global-action map for fixed legs preserves zero, addition and O-scaling of coefficient arrows.
- With the properness and base-change assumptions of §3.3, convolution acts by composition of the two derived global maps.

*Needs:* §3.1; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`.

**Checks.**

- For a finite étale degree-r map f and trivial coefficient, f_*f* acts by r on H⁰(O).
- The zero coefficient correspondence acts by zero in all degrees.
- A morphism of coefficient short exact sequences gives a commuting long exact cohomology diagram.
- Every degree is induced by one derived morphism, so coefficient exact sequences are respected.

### 3.3 Composition of cohomological correspondences

For two correspondences with proper first legs and coefficient morphisms T,S, form their fibre-product composition using proper upper-shriek base change and the projection formula. In a derived enhancement the composite acts on RΓ by RΓ(S)∘RΓ(T). In the discrete coherent category impose the required Tor-independence/perfectness hypotheses. This is a statement about the actual six-operation composition, not arbitrary chosen maps between cones.

(BP26, §2.2.9 and §2.3.12, pp. 14, 17; P20 §4.3, p. 19).

A proof route is to use the fibre-product correspondence and the base-change transformation for the middle legs. Compose the coefficient morphisms through the upper-shriek projection formula. Use adjunction coherence to identify global actions; use the solid coherence constructed in §3.0a.

*Needs:* §3.2; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; §3.0a for the solid branch.

**Checks.**

- On Spec ℚ[x], take identity first legs and second-leg pullbacks x↦x+1 and x↦2x. Applying the first operator and then the second sends x to 2x+1. Reversing the order gives 2x+2; these proper first-leg correspondences distinguish the composition order.

### 3.4 Correspondences from a fundamental class

Let C and X be S-schemes of the same pure relative dimension, p₁,p₂:C⇒X, with p₁ projectively embeddable and satisfying the AlgebraicModuliForArithmeticGeometry §7.5 fundamental-class hypotheses. Fix the resulting degree-zero class O_C→p₁!O_X. For perfect G (in particular finite locally free G) and a coefficient arrow Lp₂*F→Lp₁*G, tensoring this class with G and using the projection formula defines Lp₂*F→p₁!G. Equal dimensions alone do not supply the class. For finite locally free p₁ its adjoint is the algebra trace. Boundary twists use the reduced-relative-Cartier and inverse-image boundary hypotheses of AlgebraicModuliForArithmeticGeometry §7.5; its determinant route additionally retains the normal/smooth dense-open and relative normal-crossings hypotheses of P20 Lemma 4.2.4.1(1).

(P20, §4.3.1, p. 19; BCGP21 Definitions 3.9.1–3.9.2, p. 226).

A proof route is to import the fundamental class and its transitivity/base-change statements from AlgebraicModuliForArithmeticGeometry §7.5. Tensor the class with the coefficient map under the allowed projection formula. Check the boundary ideal map using the exact Cartier hypotheses, before applying RΓ.

Its API is:

- Compose the sheaf coefficient map with the pulled-back fundamental class.
- For finite locally free p₁, the adjoint uses the trace from the finite-duality algebra.
- Under the AlgebraicModuliForArithmeticGeometry §7.5 boundary hypotheses the same construction sends subcanonical coefficients to subcanonical coefficients.
- Perfect coefficient maps commute with tensoring the fixed fundamental class; zero and sums of input coefficient arrows are preserved.
- The boundary class commutes with open base change, and in the finite-flat case with base changes retaining the Cartier conditions, exactly as in AlgebraicModuliForArithmeticGeometry §7.5.

*Needs:* §3.1; AlgebraicModuliForArithmeticGeometry §7.5 (the boundary fundamental-class contract); SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21.

**Checks.**

- For identity maps with identity coefficient morphism the fundamental class is identity.
- For a finite étale cover this construction recovers the standard trace.
- A boundary divisor whose inverse-image supports differ on the two legs is not accepted by the subcanonical construction.
- For the identity chart the class sends 1 to 1 and its determinant is 1. For q=tᵖ with p≥2, the relative differential is p t^(p−1)dt, whose value at t=0 is 0 even in characteristic zero. Equal relative dimensions do not make this ramified chart étale or its determinant class invertible; the finite-flat fundamental class still exists.

### 3.5 Tensor coefficients and deck coinvariants

For a correspondence over Spec A with F A-flat, a finitely generated A-module M gives the base-changed operator T⊗^L1 on F⊗^L_A M, by projection formula and upper-shriek comparison. Ordinary tensors agree only under the stated flatness. If a finite abelian group Δ acts equivariantly and F is A[Δ]-flat, derived coinvariants produce a correspondence on F⊗^L_(A[Δ])A, agreeing with ordinary coinvariants in this flat case. No averaging projector is used when |Δ| is not invertible.

(BP26, §2.6.1 and §2.6.9, pp. 21–22).

A proof route is to apply derived tensor in the coefficient variable and use the upper-shriek projection formula. View coinvariants as derived tensor with A over A[Δ]. Use the group-ring flatness statement to compare ordinary and derived coefficients.

Its API is:

- The induced global morphism is RΓ(T)⊗^L1 whenever coherent derived base change applies.
- An equivariant T induces T_Δ on derived deck coinvariants.
- For A[Δ]-flat F the derived coinvariant coefficient equals its ordinary quotient.
- Iterated derived scalar extension agrees with extension along the composite coefficient map, with the same T action.
- The A[Δ]→A augmentation comparison is compatible with coefficient reduction and subgroup descent, using derived coinvariants throughout.

*Needs:* §3.3; §2.2; DeformationAndDerivedPatchingAlgebra §§7.1–7.9.

**Checks.**

- M=A leaves T unchanged.
- For F=A[Δ], coinvariants give A and the identity endomorphism descends to identity.
- For the trivial F_p[C_p]-module F_p, higher derived coinvariants are nonzero, so ordinary coinvariants cannot replace them.
- For k=𝔽₂ and Δ=C₂, k[Δ]⊗^L_(k[Δ])k=k[0], but k⊗^L_(k[Δ])k has homology k in every nonnegative homological degree. The flat and nonflat coefficients give different answers without an averaging denominator.

### 3.6 Base change for cohomological correspondences

Under a base change S′→S, coherent upper-shriek base change transports T if the relevant Cartesian squares are Tor-independent and the imported duality hypotheses hold. A flat base change satisfies these conditions. Finiteness of S′→S alone is not sufficient. The derived solid version has its own base-change theorem and must be compared with this coherent statement before applying it to ordinary coefficient reduction.

(BP26, §2.6.12, pp. 22–23).

A proof route is to write both base-change squares, including the one for C and p₁, and impose Tor-independence. Use the coherent base-change transformation for upper shriek and pullback. Identify global operators by proper base change, separately from underived sheaf base change.

*Needs:* §3.1; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; §3.0a for solid base change and its discrete comparison.

**Checks.**

- For O=ℤ₃ and k=𝔽₃, k⊗^L_O k has k in degrees −1 and 0, whereas k⊗_O k has only degree 0. The square obtained by pulling Spec k→Spec O back along itself is not Tor-independent; identity base change has Tor₁=0 and is admitted.

### 3.7 Twisting by an automorphic coefficient

For finite locally free E on X and a coefficient transport α:p₂*E→p₁*E, tensor a correspondence T:F→G with α to obtain T_E:p₂*(F⊗E)→p₁!(G⊗E). The isomorphism p₁!G⊗p₁*E≃p₁!(G⊗E) is the finite-perfect projection formula. α need not be invertible; invertibility is proved separately for a rational isogeny transport.

(BP26 Propositions 4.3.9 and 4.3.11, p. 48; P20 §4.3.1, p. 19. BP26 §2.6.1, p. 21, supplies the scalar-module projection-formula step.)

A proof route is to use the imported coefficient tensor structure and the projection formula for locally free E. Compose T⊗α with this comparison. Check identity and transitivity using the coefficient cocycle.

Its API is:

- Construct the coefficient morphism T_E.
- Twisting by O with identity transport returns T.
- Successive twists agree with the tensor product transport.
- A map between coefficient transports commuting with the two legs intertwines the twisted correspondences.
- A transport satisfying the cocycle law for composed correspondences makes twisting commute with convolution.

*Needs:* §3.1; §1.2; AutomorphicBundles Layer 3.

**Checks.**

- A rank-one scalar transport u multiplies the global operator by u.
- A zero transport gives a zero twisted operator.
- An isogeny with p-power degree need not give an integral isomorphism of Hodge lattices.
- On the O-line, transport 1↦p is an integral map and its rational inverse sends 1 to 1/p. The reverse integral transport 1↦1/p does not exist, while scalar transport 1↦1 gives the identity twist.

### 3.8 Rational isogeny transport of weight sheaves

A polarized quasi-isogeny along a toroidal Siegel correspondence, with its specified multiplier, induces p₂*ω^κ[1/p]≃p₁*ω^κ[1/p], compatible with composition and the generic parent Hecke pullback. Invertibility comes from the rational logarithmic Hodge isogeny. The integral map and any divisibility bound must be proved independently.

(BP26, §4.3.1, paragraph after Remark 4.3.3, p. 47).

A proof route is to apply the quasi-isogeny to both graded logarithmic Hodge factors and its polarization multiplier. Invert p to obtain the Levi frame torsor isomorphism. Apply the parent associated-coefficient functor and check composition.

*Needs:* §1.1; §3.7; AutomorphicBundles Layer 1; ShimuraCompactifications 7.19–7.21, 7.31.

**Checks.**

- For multiplication by p, the rational transport is invertible while its Hodge-lattice map need not be an integral isomorphism.

### 3.9 The transpose correspondence

Let S be Noetherian and f:X→S and c:C→S smooth separated finite-type morphisms. For a correspondence of §3.1 and perfect coefficients F,G in Dᵇ_coh(X), coherent duality transposes T:Lp₂*F→p₁!G into Tᵗ:Lp₁*D_XG→p₂!D_XF, where D_X=RHom(−,f!O_S) and D_C=RHom(−,c!O_S). Use the bounded coherent-duality categories of SchemeAndStackFoundations §§2.18–2.21, with their finite-Tor and perfectness hypotheses; the smooth structural morphisms give invertible relative dualizing objects, and each leg is lci. No finiteness or flatness of the legs is required. When the legs are proper, §3.0a transports this statement to the solid category on the same bounded perfect inputs.

For the two global actions require both p₁ and p₂ proper. If f is proper, joint properness in §3.1 ensures this, and the induced maps Rf_*F→Rf_*G and Rf_*D_XG→Rf_*D_XF are adjoint under relative coherent duality. Over S=Spec A the identity reads ⟨RΓ(T)x,y⟩_G=⟨x,RΓ(Tᵗ)y⟩_F for the derived A-valued evaluation pairings. Finite-flat trace is a specialization. Swapping the legs also swaps and dualizes the coefficient; a Hecke double coset need not be self-adjoint.

(BP26, Proposition 2.7.3 and proof, pp. 23–24; extension from finite locally free sheaves to perfect complexes uses the same tensor-duality identities; CG20 Appendix A.3.2, pp. 86–88.)

A proof route is to apply D_C to the coefficient morphism. The lci formula pᵢ!K≃Lpᵢ*K⊗pᵢ!O_X and the invertibility of pᵢ!O_X identify D_C(p₁!G)≃Lp₁*D_XG and D_C(Lp₂*F)≃p₂!D_XF. Perfectness supplies tensor duality and biduality. Apply proper relative duality and its counit to obtain adjointness; evaluate the inverse double coset and central character separately.

*Needs:* §3.1; §3.2; §3.0a for the solid comparison; SchemeAndStackFoundations §§2.18–2.21.

**Checks.**

- On three points over ℚ with the sum pairing, let σ cycle the basis e₁→e₂→e₃→e₁. The transpose sends e₁ to e₃, whereas σ sends e₁ to e₂: ⟨σe₁,e₂⟩=1=⟨e₁,σ⁻¹e₂⟩ and ⟨e₁,σe₂⟩=0.
- Let both legs be b:C=Bl_point(ℙ²_k)→X=ℙ²_k, with exceptional divisor E and F=G=O_X. Then b!O_X=O_C(E), and use the fundamental class O_C→O_C(E). The cokernel is O_E(−1), with H⁰=H¹=0; together with Rb_*O_C=O_X this identifies Rb_*O_C→Rb_*O_C(E) with id on O_X. The trace is identity off E and hence everywhere. The action on H⁰(O_X)=k and its transpose on H²(ω_X)=k are both 1; evaluation gives 1=1. The fibre E≃ℙ¹ has dimension one, so these proper legs are not finite.
- For the closed point i:Spec k→X=𝔸¹_k, take p₁=p₂=i, F=O_X and G=O_X[1]. Here i!O_X=k[−1], D_XF=O_X[1] and D_XG=O_X. The coefficient arrow k→i!G=k and its transpose k→i!D_XF=k are both identity. The shift −1 is necessary even though both schemes are smooth; the proper-X global pairing assertion does not apply to this X.
- For the split degree-two cover of Spec k, the unit coefficient arrow and finite-flat trace give global scalar 2 and transpose scalar 2. The pairing on (1,1) gives 2=2, including 0=0 in characteristic two; when 2 is invertible, replacing the trace by an averaged trace would instead give 1 and fail.

### 3.10 Contracted support filtrations

For a correspondence (C,X,p₁,p₂), a closed subset Z is contracted when p₁⁻¹Z⊆p₂⁻¹Z, and expanded when the reverse inclusion holds. These are set-theoretic conditions. A finite increasing closed filtration (Z_l) is contracted when every Z_l is contracted, with strata U_l=Z_l∖Z_(l−1). The resulting maps of support objects are constructed as a coherent filtered diagram in a stable enhancement; no functorial cone in a bare triangulated category is assumed.

(BP26, Definition 2.1.19 and Remark 2.1.20, p. 9; §2.9.8, p. 28).

A proof route is to read inverse images as subsets, independently of scheme multiplicities. Pass to the complementary inclusion p₂⁻¹U⊆p₁⁻¹U. Separate this set-theoretic definition from the completion/compact-support filtered construction, whose solid enhancement is §3.0a.

Its API is:

- Contraction of Z is equivalent to p₂⁻¹(X∖Z)⊆p₁⁻¹(X∖Z).
- Specify a finite indexed filtration and contraction proofs for every closed term.
- Changing the closed subscheme structure without changing its support preserves contraction.
- Intersecting each Z_l with a correspondence-stable open preserves contraction.
- Transposing the legs exchanges contracted and expanded filtrations, including the empty and total closed sets.

*Needs:* §3.1; §3.0a for the enhanced support diagrams.

**Checks.**

- The empty set and X are contracted.
- For p₁=id and p₂=Frobenius over F_p every closed subset is contracted.
- On {0,1}, p₁=id, p₂ constant 0 and Z={1} is not contracted; this distinguishes the two orientations.
- On Spec k[t], with p₁=id, p₂:t↦t² and Z=V(t), both inverse-image supports are {0}, so contraction holds. Their ideals are (t) and (t²); the containment (t)⊆(t²) fails, while for the identity pair the ideals are equal.

### 3.11 Derived formal completion of coherent coefficients

For a qcqs Noetherian model X, a coherent ideal I defining Z, and a pseudo-coherent solid coefficient F in the BP26 setting, the completion locale î:Ẑ→X satisfies î_*î*F≃Rlim_n(F⊗^L_(O_X)O_X/Iⁿ), and RΓ(X,î_*î*F)≃Rlim_n RΓ(X,F⊗^L O_X/Iⁿ). The I=(p) case is the p-adic specialization. For discrete coefficients, object completion is imported from DerivedModuleAlgebra §§1.3–1.5, perfect-system effectivity from §1.E.1, and proper coherent formal functions from SchemeAndStackFoundations §4.9, with their Noetherian, properness and boundedness hypotheses. Completion of morphism modules, when the base is complete Noetherian local and the complexes are bounded finite free, uses DeformationAndDerivedPatchingAlgebra §7.8. Integral correspondence maps and traces extending to the completion must commute with these comparison maps; the solid/discrete identification remains §3.0a.

(BP26, Lemma 2.9.3 and proof, pp. 27–28 (solid completion); DerivedModuleAlgebra §§1.3–1.5 and §1.E.1 supply discrete object completion and perfect-system effectivity; SchemeAndStackFoundations §4.9 supplies proper formal functions).

A proof route is to apply BP26 Lemma 2.9.3 to the closed locale and its solid completed algebra; use pseudo-coherence in commuting tensor with the inverse limit. For the discrete proper model use DerivedModuleAlgebra §§1.3–1.5 for derived completion and its ordinary quotient tower over Noetherian rings, §1.E.1 for perfect-system effectivity, and SchemeAndStackFoundations §4.9 for proper formal functions. Use DeformationAndDerivedPatchingAlgebra §7.8 only for the finite derived Hom comparison under its complete-local hypotheses; the coefficient-category comparison remains §3.0a. Compare the extended integral coefficient morphism, projection formula and trace before taking the inverse limit.

*Needs:* §3.6; §1.4; §3.0a; DerivedModuleAlgebra §§1.3–1.5, 1.E.1; DeformationAndDerivedPatchingAlgebra §7.8; SchemeAndStackFoundations §4.9.

**Checks.**

- For O=ℤ₃ and F=k=𝔽₃, derived reduction k⊗^L_O k has k in degrees −1,0; ordinary reduction has only degree 0. The complete torsion module itself has completion k.
- For A=k[x], I=(x) and F=A[0], object completion has H⁰=k[[x]] and no other cohomology; the completion unit sends x to x. At I=(0) it gives A, and at I=(1) it gives zero. A theorem only about Hom modules cannot identify this object.

### 3.12 Equivariance of the completion and compact-support filtration

Let X be qcqs over the fixed base, F∈D⁻(O_(X,solid)), and ∅=Z_(−1)⊆Z₀⊆⋯⊆Z_d=X a finite closed filtration contracted by a cohomological correspondence T with proper p₁. Write U_l=X∖Z_l and Ẑ_l for the closed locale with I_l-adically completed algebra. The triangles RΓ_c(U_l,F)→RΓ(X,F)→RΓ(Ẑ_l,F) form a T-equivariant filtered object, with graded terms RΓ_c(Ẑ_l∖Ẑ_(l−1),F). Thus E₁^(s,t)=H_c^(s+t)(Ẑ_s∖Ẑ_(s−1),F)⇒H^(s+t)(X,F) is T-equivariant on every page. Its j! term belongs to the completion triangle j!j*F→F→î_*î*F. Ordinary local cohomology instead uses î_*î!F→F→Rj_*j*F; identifying these two filtrations is not asserted.

(BP26, §2.9.1, Lemmas 2.9.3 and 2.9.6, Theorem 2.9.7 and Proposition 2.9.9, pp. 27–29).

A proof route is to use the complementary inclusion of inverse-image opens to construct the j! transformation through unit, T and the shriek counit. Use the solid completion localization triangles to assemble one filtered transformation; retain §3.0a for the stable enhancement and its coherences. Apply the filtered-complex spectral-sequence construction of BP26 Theorem 2.9.7; this is the completion/compact-support spectral sequence, rather than the ordinary Kempf resolution.

*Needs:* §3.10; §3.2; §3.11; §3.0a for the solid filtered coherence.

**Checks.**

- For the identity correspondence on Spec k[x] and the filtration ∅⊂V(x)⊂X, the filtered action is identity and sends 1 in H⁰(X,O) to 1. Multiplication by 2 scales every term and differential by 2. Completion has H⁰=k[[x]], whereas ordinary local cohomology has H¹=k[x,x⁻¹]/k[x], containing x⁻¹≠0; substituting their triangles changes the degrees.

### 3.13 Coherent Hecke operators in every degree

For the toroidal Hecke correspondence at neat tame level with a common fan refinement, compatible coefficient transport and fundamental class, define [KgK] on RΓ(F_can) and RΓ(F_sub) using §3.2. Prime-to-p integral operators require the geometric smoothness/boundary hypotheses. At this stage construct the individual double-coset endomorphisms and their fan comparisons. They form an algebra action only after the integral convolution relations of Layer 5 (or a separately supplied characteristic-zero convolution proof) are verified. Degree zero agrees with AutomorphicBundles Layer 12. The operators are derived morphisms, without a chosen strict chain action.

(BCGP21, §3.9.3 and Remark 3.9.4, pp. 226–227; CG18 §7.2, pp. 398–400; P20 §5.3, p. 24).

A proof route is to extend the geometric correspondence on a common fan refinement with its coefficient map. Use the fundamental class and trace to obtain a derived endomorphism. Compare compositions using the fibre-product decomposition and prove fan independence before declaring the algebra action.

Its API is:

- Construct the endomorphism for a double coset with its chosen coefficient normalization.
- Common refinements give the same RΓ morphism through the toroidal cohomology comparisons.
- The induced H⁰ action equals the parent AutomorphicBundles Layer 12 pull–trace/convolution action.
- Maps of Hecke-linearized coefficients intertwine the individual derived operators and the boundary arrow.
- The degree-zero comparison does not assert higher integral convolution; use §5.13 for the hyperspecial integral algebra action.

*Needs:* §3.4; §3.8; §3.3; AutomorphicBundles Layer 12; ShimuraCompactifications 4.3–4.10 and Layer 7.

**Checks.**

- The unit double coset acts by identity.
- For a central scalar double coset, the action is the scalar of the declared central coefficient character.
- Equality of operators after inverting p does not imply equality of integral derived morphisms without a torsion-detection argument.
- On C=O[0]⊕O[−1], the projector onto the degree-one summand has H⁰=0 and H¹=id, just as the zero map has H⁰=0 but H¹=0. Degree-zero agreement alone cannot establish a derived operator relation.

### Examples

On Spec k[x] with boundary x=0, the completion is k[[x]] in degree zero, whereas H¹_(x)(k[x])=k[x,x⁻¹]/k[x] contains the nonzero class x⁻¹. A scalar coefficient twist by 3 sends the identity correspondence to multiplication by 3; a zero twist gives zero. These computations distinguish completion, support and coefficient transport.

### Dependencies

AlgebraicModuliForArithmeticGeometry §7.5 (the boundary fundamental-class contract); AutomorphicBundles Layer 1; AutomorphicBundles Layer 3; AutomorphicBundles Layer 12; DerivedModuleAlgebra §§1.3–1.5, 1.E.1; DeformationAndDerivedPatchingAlgebra §§7.1–7.9; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; SchemeAndStackFoundations §§4.8–4.10; ShimuraCompactifications 4.3–4.10 and Layer 7; ShimuraCompactifications 7.19–7.21, 7.31; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`. Earlier in this layer use the individual prerequisites displayed above.

## Layer 4: Hecke lifts, normalization and comparison

Apply the K-projective bijection in the Mathlib supplier contract to the bounded finite-projective models of §2.4 and the geometric endomorphisms of §3.13. This gives chain representatives unique up to homotopy. Equality or commutation of derived operators becomes a homotopy between the corresponding composites; a strict chain algebra action is not inferred. (CG18 §7.2, pp. 399–400.)

### 4.1 The arithmetic normalization of the Siegel Hecke action

For a Siegel threefold, replace the natural Hecke action on ω(a,b) by its ν⁻³ twist. The coefficient is then W_(a,b;3−a−b), whose analytic counterpart is V_(−b,−a;6−a−b). A central element xI₄ acts by x^(a+b−6). With geometric Frobenius, ε(Frob_ℓ)=ℓ⁻¹. If T′_(ℓ,i) are the geometric operators, set T_(ℓ,2)=ℓ⁻³T′_(ℓ,2) and T_(ℓ,i)=ℓ⁻⁶T′_(ℓ,i) for i=0,1, in P20’s labelling (P20 §5.3, p. 25). P20’s T_(ℓ,2), of similitude ℓ, is CG20’s T_(ℓ,1); CG20’s T_(ℓ,2) has similitude ℓ² and factor ℓ⁻⁶.

(CG20, Remark 5.10 and Remark 5.12, pp. 33–34; P20 §5.3, pp. 24–25).

A proof route is to calculate the multiplier on each chosen Hecke matrix. Twist the actual geometric action by ν⁻³ and compare its coefficient characters. Compare the central scalar and Frobenius conventions before passing to Hecke polynomials.

Its API is:

- The normalized action of xI₄ is x^(a+b−6).
- The three normalized geometric generators obey the displayed ℓ-power formulas.
- The normalized W and V realizations agree with their stated central parameters.
- Successive multiplier twists add their exponents and transport composite coefficient correspondences compatibly.
- The ν⁻³ twist uses the same scalar on canonical and subcanonical coefficients, so their comparison arrow remains equivariant.

*Needs:* §1.3; §3.13.

**Checks.**

- Weight (a,b)=(4,2) has trivial normalized central scalar.
- At ℓ=2, P20’s T_(2,2)=CG20’s T_(2,1) has similitude 2 and factor 1/8; CG20’s T_(2,2) has similitude 4 and factor 1/64.
- Twisting by ν³ reverses both normalizing exponents and fails the central-scalar test.
- At weight (5,2) and x=2, the untwisted scalar 128 times the multiplier twist 4⁻³=1/64 gives the normalized scalar 2, agreeing with §1.3. At weight (4,2) the same product is 64/64=1.

### 4.2 Integral divisibility and rational p-operators

For an integer k≥0, let the correspondence be given at the sheaf level: locally free coefficients F and G on the model, C flat over O, and an actual morphism of sheaves t:p₂*F→p₁*G between the pullbacks, from which the coefficient arrow T:Lp₂*F→p₁!G of §3.1 is obtained by composing with the fundamental-class map p₁*G→p₁!G of AlgebraicModuliForArithmeticGeometry §7.5. Since C is flat over O and G is locally free, p₁*G is ϖ-torsion-free, so multiplication by ϖ^k is injective on the O-module Hom(p₂*F,p₁*G). When t factors through the subsheaf ϖ^k·p₁*G, that is t=ϖ^k·u for a sheaf morphism u:p₂*F→p₁*G, u is unique; define the normalized integral correspondence ϖ⁻kT as the correspondence obtained from u by the same fundamental-class construction, so that T=ϖ^k·ϖ⁻kT. The division is performed on the sheaf morphism before the fundamental-class and derived-global-section constructions are applied. For an arbitrary derived coefficient arrow T:Lp₂*F→p₁!G, a factorization T=ϖ^k·U determines U only when multiplication by ϖ^k is injective on the O-module Hom_D(Lp₂*F,p₁!G); ϖ-torsion-freeness of the cohomology sheaves of the target does not imply this, and no division of a derived arrow is asserted without that injectivity. When p₁!G is itself a ϖ-torsion-free sheaf, as in P20's flat setting, the injectivity holds and the factorization of P20 Remark 4.3.3 on the target p₁!G also divides uniquely. A rational operator alone supplies no integral division. At Klingen and paramodular level the geometric T_(p,2) and U_(Kli(p),2) are defined with p⁻³ after inverting p, using the p-level spans of §3.0b; no integral p-operator or ordinary projector is asserted here.

(P20, §4.3.1 and Remark 4.3.3, p. 19; §14.9.1–14.9.2, pp. 102–105).

A proof route is to state the actual integral divisibility of the sheaf morphism t, rather than divide a cohomology class or a derived arrow. Use the ϖ-torsion-freeness of p₁*G to make u unique, then apply the fundamental-class and derived-global-section constructions to u. For p-level correspondences invert p first, apply rational isogeny transport and the declared p⁻³ normalization.

Its API is:

- Construct u from the sheaf-level divisibility and the ϖ-torsion-freeness of p₁*G, and ϖ⁻kT from u by the fundamental-class construction.
- Two sheaf morphisms into the ϖ-torsion-free p₁*G with the same ϖ^k multiple coincide. Two derived arrows Lp₂*F→p₁!G with the same ϖ^k multiple coincide when multiplication by ϖ^k is injective on Hom_D(Lp₂*F,p₁!G), and need not coincide otherwise.
- After inverting ϖ the integral ϖ⁻kT equals ϖ⁻k·T in the rational Hom; the p-level operators use only this rational formula.
- Maps between sheaf-level factorizations intertwine their divided morphisms, by uniqueness after multiplication by ϖ^k into a ϖ-torsion-free target.
- A flat coefficient extension preserving the sheaf-level factorization carries u to the normalized extended morphism; arbitrary torsion reduction is not a uniqueness argument.

*Needs:* §3.1; §3.4; §4.1; AlgebraicModuliForArithmeticGeometry §7.5 (the fundamental-class map); ShimuraCompactifications 7.19–7.21, 7.31; §3.0b.

**Checks.**

- On the rank-one O-module, T=ϖ^k·id normalizes to id.
- For k>0, multiplication by ϖ^k on O/ϖ is zero. On 𝔽₃, the maps U=0 and U=id both satisfy 3^kU=0, so division is not unique. For k=0 multiplication by 3⁰ is identity, with kernel zero.
- When k=0 the construction returns the original correspondence.
- For multiplication by p on the O-lattice O, the rational inverse sends 1 to 1/p∉O; on E it is an endomorphism. Thus this rational inverse supplies no integral map O→O.
- With actual sheaves F=G=O on Spec O and identity legs, Hom(O,O)=O and multiplication by ϖ^k is injective on it, so ϖ^k·u=ϖ^k·u′ forces u=u′: the sheaf-level division is unique.
- Negative control for derived arrows: on Spec O with identity legs, F=(O/ϖ)[−1] and G=O give Hom_D(F,G)=Ext¹_O(O/ϖ,O)≃O/ϖ, on which ϖ acts as zero, although the target O is ϖ-torsion-free. With k=1 and T=0, both U=0 and U=the class of 1 satisfy ϖ·U=T. A rule that divided derived arrows by torsion-freeness of the target alone would produce two different normalizations; here F is not a sheaf, so the sheaf-level normalization does not apply, and the injectivity required of ϖ on Hom_D fails.

### 4.3 Geometric Hecke generators and the spin polynomial

Set β_(x,0)=diag(x,x,x,x), β_(x,1)=diag(1,1,x,x), β_(x,2)=diag(1,x,x,x²), and S_x=T_(x,0) in CG20’s convention. P20’s T_(ℓ,2),T_(ℓ,1),T_(ℓ,0) correspond to CG20’s T_(x,1),T_(x,2),S_x after the declared normalization. Identify these with the normalized spherical generators in IntegralHeckeAndGaloisDeterminants §§3a–3b, preserving coefficient central character and opposite-algebra convention. For BCGP21, T_(v,1),T_(v,2),T_(v,0) correspond to T_(ℓ,2),T_(ℓ,1),T_(ℓ,0). The resulting characteristic polynomial is X⁴−T_(v,1)X³+(q_vT_(v,2)+(q_v³+q_v)T_(v,0))X²−q_v³T_(v,0)T_(v,1)X+q_v⁶T_(v,0)². Import its generic spin-polynomial API from IntegralHeckeAndGaloisDeterminants §§3a–3b/SmoothRepresentationsOfLocalGroups SR.4, rather than re-own it.

(BCGP21, §3.10, p. 236; CG20 §5.5, p. 33; P20 §5.3, pp. 24–25).

A proof route is to read the actual diagonal matrices and double-coset measures in each source. Compare their similitude twists and opposite-algebra actions using the normalized coefficient. Evaluate the imported spin polynomial on the identified generators; distinguish det(X−ρ) from det(1−Xρ).

Its API is:

- Identify each normalized geometric generator with the spherical generator in the displayed source dictionaries.
- Evaluation on a spherical eigensystem gives the displayed monic polynomial, retaining the central generator.
- The fixed-degree reciprocal X⁴P(1/X) is the det(1−Xρ) convention, and both comparisons preserve coefficient scalar extension.

*Needs:* §4.1; IntegralHeckeAndGaloisDeterminants §§3a.1–3a.2, 3b.1–3b.2; SmoothRepresentationsOfLocalGroups SR.4.

**Checks.**

- The similitudes of β_(x,0), β_(x,1), β_(x,2) are x², x, x²: in each matrix the two symplectic diagonal products have that value.
- At q=2 and (T_(v,0),T_(v,1),T_(v,2))=(1,3,2), P(X)=X⁴−3X³+14X²−24X+64, and X⁴P(1/X)=1−3X+14X²−24X³+64X⁴.
- At q=1 and (1,4,4), P(X)=X⁴−4X³+6X²−4X+1=(X−1)⁴; this is a formal specialization, not a residue-field size.

### 4.4 GAGA and the coherent tower

For proper toroidal complex models, algebraic coherent cohomology agrees with analytic coherent cohomology in all degrees, naturally for Hecke pullback, trace, coefficient maps and boundary arrows. At characteristic-zero neat finite levels, passage to the direct-limit tower gives a smooth representation whose K-invariants recover finite-level cohomology under finite-level étale descent; finite-dimensional finite-level cohomology implies admissibility. The invariant functor used for descent is exact over characteristic zero. No analogous integral invariant equality is claimed when deck-group order is divisible by p.

(CG20, §5.3, pp. 24–25; BP26 §1.1, p. 2).

A proof route is to apply proper/projective GAGA on the actual compactification and coherent sheaves. Check compatibility of the duality counit as well as pullback and the boundary map. Use finite étale characteristic-zero descent, exact finite-group invariants and the finite-level/tower action.

*Needs:* §3.13; ComplexComparisonPartII C1.9 and C2; ComplexComparisonPartII C3.3; SmoothRepresentationsOfLocalGroups SR.0; ShimuraCompactifications 4.3–4.10 and Layer 7.

**Checks.**

- The trivial C₂-action on k=𝔽₂ has H¹(C₂,k)=k, while H¹(C₂,ℚ)=0. On k[C₂], invariants are spanned by 1+σ, and augmentation sends this invariant vector to 0, so invariants do not preserve the augmentation surjection to k.

### Examples

At q=2, (T₀,T₁,T₂)=(1,2,3) in the spherical supplier’s order gives 1−3X+14X²−24X³+64X⁴. In the BCGP order the same eigensystem is (1,3,2), and the monic polynomial is X⁴−3X³+14X²−24X+64. The fixed-degree reciprocal carries constant 64 to leading coefficient 64.

### Dependencies

AlgebraicModuliForArithmeticGeometry §7.5 (the fundamental-class map for §4.2); ComplexComparisonPartII C1.9 and C2; ComplexComparisonPartII C3.3; IntegralHeckeAndGaloisDeterminants §§3a.1–3a.2, 3b.1–3b.2; Mathlib `CochainComplex.IsKProjective.Qh_map_bijective`; Mathlib `CochainComplex.isKProjective_of_projective`; ShimuraCompactifications 4.3–4.10 and Layer 7; ShimuraCompactifications 7.19–7.21, 7.31; §3.0b; SmoothRepresentationsOfLocalGroups SR.0; SmoothRepresentationsOfLocalGroups SR.4. Earlier in this layer use the individual prerequisites displayed above.

## Layer 5: integral vanishing, Hecke relations and localization

### 5.0 Hilbert–Siegel geometry, EO strata and the boundary regularity input

For a totally real field F, the genus-two PEL datum for Res_(F/ℚ)GSp₄, a neat prime-to-p level and the rational polarization data, specialize ShimuraCompactifications 7.3, 7.16 and 7.25–7.26 to BCGP21’s PEL group G, and construct the G₁ quotient. Identify the open moduli problem, universal polarized degenerating family and the two maps to the supplied PEL compactifications; on normalized p-level models retain the lattice collection and do not assert smoothness. At hyperspecial p-level with p totally split, the integral model is smooth of relative dimension 3[F:ℚ]. Define the finite groups Δ(Π₀), the stabilizer in Δ=(O_F)^(×,+)_((p))/O_F^(×,+)(Kᵖ) of a connected component, and Δ(Kᵖ), the stabilizer of a geometrically connected component (BCGP21 (3.3.14)–(3.3.16)). Prove that Δ acts freely on the compactified G model, boundary strata included (BCGP21 Lemma 3.5.3), so that each component map X_(K,c)→X^(G₁)_(K,π(c)) is a finite étale Galois cover f with group Δ(Π₀). Prove the compactified direct-factor comparison at every reasonable level, with no hypothesis on p: for F=ω^κ or ω^κ(−D) on the G₁ model, the augmentation-ideal splitting f_*O_T≅O_S⊕(I_(Δ(Π₀))⊗_(ℤ[Δ(Π₀)])f_*O_T) of the cover, checked étale-locally where f_*O_T is the regular module O_S[Δ(Π₀)], exhibits RΓ(X^(G₁),F) as a Hecke-stable direct summand of RΓ(X_K,f^*F) in D(ℤ_p) (BCGP21 Proposition 3.8.3 and Lemma 3.8.5). An action free only on the open part is insufficient. The field F=ℚ is its Siegel specialization, not a genus-one Hilbert modular substitute. (BCGP21 §§3.3–3.8, Definition 3.3.3, pp. 204–205, (3.3.14)–(3.3.16), p. 210, Lemma 3.5.3, pp. 214–215, Proposition 3.8.3 and Lemma 3.8.5, pp. 219–221.)

Its API is:

- identify the open G and G₁ moduli models and their finite quotient comparison;
- supply the polarized logarithmic Hodge factors and their change of level;
- preserve automorphic coefficients under finite-level maps;
- compare boundary ideals and the toroidal-to-minimal contractions;
- split the canonical and subcanonical G₁ cohomology as direct summands of the G-model cohomology at every reasonable level, through the augmentation-ideal splitting of the finite étale cover, with no hypothesis on p.

*Needs:* ShimuraCompactifications Layer 1 and Layers 4, 6 and 7; AutomorphicBundles Layers 0–11; SchemeAndStackFoundations §§1.1, 2.6, 2.23; no later theorem on EO strata or packets is used.

**Checks.**

- For [F:ℚ]=1, dimensions are 3 for the open model, 2 for a toroidal boundary component and at most 1 for a minimal boundary stratum; genus-one geometry would give 1 instead of 3.
- For the split C_p-torsor ∐_(g∈C_p)Spec 𝔽_p→Spec 𝔽_p, the function ring is the regular module 𝔽_p[C_p], which splits as 𝔽_p·1⊕(I_(C_p)⊗𝔽_p), the second summand spanned by the elements g−1, although p=#C_p; so the direct summand exists where an averaging projector (1/p)Σ_g g does not. A definition that imposed p∤#Δ would reject this cover, and one that split by averaging would need 1/p.
- The involution t↦−t acts freely on the punctured affine line in characteristic zero and fixes t=0 in its compactification. Thus open freeness does not certify the boundary descent.

Construct the hyperspecial EO filtration by closures of strata of codimension at least i, for i=0,…,3[F:ℚ], with finite closure incidence and Hecke stability. Prove that the minimal images of the relevant strata are affine, and construct cofinal Cohen–Macaulay thickenings cut out by regular sequences on which local Ext/Koszul systems compute the ordinary Cousin terms. These statements concern the compactified PEL strata and their images, not affineness of every toroidal stratum. (BCGP21 §3.9, pp. 229–231.)

Its API is:

- identify the codimension and closure incidence of each EO stratum;
- pull back its regular-sequence thickenings along the admitted prime-to-p Hecke maps;
- give the affine minimal image and its toroidal inverse image;
- compare the cofinal regular thickenings and their transition maps;
- identify the coefficient and dual-coefficient local Ext systems with their ordinary support objects.

*Needs:* the model above; SchemeAndStackFoundations §§0.18, 2.7–2.8; ShimuraCompactifications Layer 7. The cohomological acyclicity is proved in §5.10 using §5.2.

**Checks.**

- Over F=ℚ the filtration has codimensions 0,1,2,3; a codimension-four nonempty term would contradict relative dimension 3.
- For a regular chart k[x,y] and ideal (x), the quotients k[x,y]/(xⁿ) are Cohen–Macaulay of dimension one. The length-one Koszul complex has H⁰ equal to that quotient and no negative homology.
- An affine minimal image does not make its proper toroidal fibre affine: ℙ¹ has H⁰(O)=k but is not affine. Relative subcanonical vanishing is needed in §5.10.

For every EO component in these charts prove that it meets the interior, and show that a local boundary equation is a non-zero-divisor on every chosen cofinal regular-sequence quotient. A proof route is to identify the associated primes of each complete-intersection quotient with its components and use geometric noncontainment in the boundary; verify this on the supplied thickenings rather than on the reduced stratum alone. This gives exactly the localization injections needed in §5.11. (BCGP21 Lemma 3.9.12, p. 230, proof: the regularity used in its localization step.)

**Checks.**

- On k[x,y]/(xⁿ), multiplication by y is injective: y·∑_(j<n)a_j(y)xʲ=0 forces every a_j=0. Inverting y therefore preserves a nonzero class.
- On k[x,y]/(xy,x²), x is nonzero but yx=0; localization at y kills x. Reduced noncontainment without a Cohen–Macaulay/associated-prime argument cannot replace the hypothesis.
- On k[x,y]/(xⁿ), the equation x is a zero-divisor, since x·x^(n−1)=0. A component contained in the boundary must be rejected.

### 5.1 Formally canonical and subcanonical coefficients

Apply the formally canonical and formally subcanonical conditions of ShimuraCompactifications 7.21 to the coefficients of §1.2 on the additional compactified p-level spans of §3.0b and the G₁ quotient of §5.0. On every boundary chart identify the completed monomial module and exhibit the finite filtration of the boundary-base coefficient by pullbacks of finite base modules. The canonical monoid is σ∨; the subcanonical monoid is the intersection of τ∨_0 over nonzero faces τ of σ, including σ. For the zero cone this is an empty intersection, hence imposes no condition. Verify the reduced boundary-ideal identification on the relevant chart, using refinement pushforward when the model is singular. On a quotient apply the compactified direct-factor comparison of §5.0 to the completed coefficient. These are model-specific verifications of the supplied condition.

(Lan17, Definition 8.5, p. 34, with Propositions 7.5 and 7.15, pp. 28–32).

A proof route is to import the formal boundary charts and monomial indexing from the compactification owner. Specify the completed expansion and finite base-module filtration from §7. Verify the condition for canonical and boundary-ideal subcanonical automorphic coefficients on each required model.

Its API is:

- Give the chartwise completed expansion with its exact monoid.
- The boundary-ideal twist replaces σ∨ by the positive submonoid in the permitted charts.
- The specified finite filtrations and monomial expansions commute with the base changes allowed in Lan17.
- Restriction to a boundary chart and an allowed fan refinement preserves the completed expansion and its finite filtration.
- A coefficient isomorphism carrying the chart filtrations and monomial expansions transports the formally canonical property.

*Needs:* AutomorphicBundles 5.10; §1.2; ShimuraCompactifications 6.1–6.11; ShimuraCompactifications 7.19–7.21, 7.31; §3.0b; §5.0 for quotient descent.

**Checks.**

- On an empty-boundary chart the canonical and subcanonical conditions coincide.
- On a one-dimensional toric chart, canonical expansions permit the constant term while subcanonical expansions have positive exponent.
- An arbitrary bundle on the boundary abelian base without the prescribed finite filtration is not accepted as formally canonical.
- For q=t² in characteristic zero, the pullback of the boundary ideal (q) is (t²), while the reduced boundary ideal is (t). The class t lies in the latter but not the former. For the identity chart both ideals are (t), so agreement there alone misses ramification.

### 5.2 Toroidal-to-minimal relative vanishing

For a Lan17 normalized PEL toroidal-to-minimal map π over an allowed O_(F₀,(p))-algebra R, and a quasi-coherent extension E satisfying the formal criterion of ShimuraCompactifications 7.21, R^iπ_*(E(−nD′))=0 for i>0 and n>0 in the formally canonical case, and for i>0 and n≥0 in the formally subcanonical case. Here D′ is the effective Cartier divisor supported on the boundary supplied by Lan17 Corollary 6.7, with O(−D′) relatively ample over the minimal model; D′ itself is not relatively ample. In particular subcanonical automorphic coefficients have no positive higher direct images once the chart criterion is verified; canonical coefficients at n=0 are not included. The same assertion holds over an open U of the minimal model for a coefficient defined on π⁻¹U with the chart criterion there; it also applies over finite coefficient algebras after verifying that criterion under base change. Analytic adic generic-fibre comparisons are imported by the higher-Hida consumer from its adic-space owner, rather than asserted as algebraic base change here.

(Lan17, Theorem 8.6 and Remark 8.9, pp. 34–35; P20 Theorem 6.2.2.1, p. 30; BP26 proof of Proposition 5.6.3, p. 58).

A proof route is to reduce locally on the minimal compactification to the formal chart calculation of Lan17 §7. Apply the positive-monomial argument and the relatively ample invertible sheaf O(−D′) with the indicated range of n. Use formal functions and refinement descent; verify separately the ramified/quotient model inputs requested below.

*Needs:* §5.1; ShimuraCompactifications 4.3–4.10 and Layer 7; ShimuraCompactifications 7.19–7.21, 7.31; §3.0b.

**Checks.**

- A canonical sheaf without the positive twist is outside the theorem; a subcanonical coefficient at n=0 is inside.
- On a contracted exceptional curve E with O(D′)|_E=O_E(−1), the twist O(−nD′)|_E has degree n, positive for n≥1, as relative ampleness of O(−D′) requires; reading D′ itself as ample would give degree −n.

### 5.3 Lan–Suh’s general PEL small-weight vanishing

Let X=M^tor_(H,Σ,k₁) be a smooth proper good-prime PEL toroidal model of ShimuraCompactifications Layer 7, with neat prime-to-p level, smooth projective fan and boundary D, over the perfect residue field k₁ of characteristic p. Write d=dim X, G₁ and M₁ for the source’s reductive group and Hodge Levi, and W^(M₁) for its Kostant representatives. For every representation-small dominant weight μ∈X_G₁^(+,<rep), with max(2,r_τ)<p for each self-conjugate embedding τ, every positive parallel ν∈X_M₁^(+,<p), every w∈W^(M₁), and every integer i, prove both vanishings:

- H^(i−ℓ(w))(X,(W^∨_(w·[μ]+ν))_can)=0 for i<d.
- H^(i−ℓ(w))(X,(W^∨_(w·[μ]−ν))_sub)=0 for i>d.

Use Lan–Suh’s weight sets and coefficient conventions of §7; representation-smallness means μ∈X_G₁^(+,<p) and |μ|_L+d<p, with |μ|_L the tensor-realization degree of Lan–Suh’s coefficient, as in LanSuh Proposition 7.21 and CG20’s explanation in the proof of Theorem 5.1, pp. 22–24. Here X_G₁^(+,<p) imposes ⟨μ+ρ,α∨⟩≤p for every positive coroot; X_M₁^(+,<p) imposes the same Levi-root condition. Positive parallel ν means its rank-one coefficient is positive as in §7.1, and satisfies the boundary-adjusted ampleness condition (3.25) via Corollary 7.14. The Kuga family realization has a W(k₁)-lifting with Assumption 1.4, nilpotent residues and realization degree m<p−d (or the dual degree under Proposition 1.7). These are the logarithmic input and coefficient realization verified in Lan–Suh Proposition 7.21; the integral dual BGG comparison is the separate AutomorphicBundles contract.

(LanSuh Corollary 7.24(1)–(2), p. 43; Proposition 7.21, pp. 41–42; Theorem 7.22, p. 42.)

A proof route is to realize the coefficient as a horizontal summand of the logarithmic cohomology of the lifted PEL family. Apply the relative logarithmic vanishing supplied by CrystallineCohomology and split the associated graded using the integral dual BGG comparison. The length shift gives the two ranges. For the GSp₄ specialization of CG20 Theorem 5.1 take μ=(α,β;c), α≥β≥0, α+β<p−3, and ν=(t,t;0), t>0; the length-one, length-two and length-three subcanonical weights are (β+2+t,−α+t), (α+3+t,1−β+t), (α+3+t,β+3+t). The extra rank condition is 2<p, and the Levi bound a−b+1≤p holds in the stated ranges (CG20 proof of Theorem 5.1, pp. 22–24).

*Needs:* AutomorphicBundles 5.10 and 9.2–9.3 (the integral small-weight dual BGG contract); CrystallineCohomology CR.5.4 (the coefficient logarithmic splitting contract), CR.5.1–CR.5.3; ShimuraCompactifications 7.3–7.17; ReductiveGroups §10B; §1.2.

**Checks.**

- For GSp₄, p=7, μ=(0,0;c) and t=2, the length-one, length-two and length-three subcanonical weights are (4,2), (5,3), (5,5). Their vanishings begin respectively above degrees 2, 1 and 0.
- The same μ with t=1 gives (3,1), (4,2), (4,4); at t=0 positivity fails, so these substitutions supply no vanishing at (2,0), (3,1), (3,3).
- For w=1, ℓ(w)=0: the canonical assertion is below d and the subcanonical assertion above d. In the GSp₄ length-three case, i>3 becomes i−3>0; omitting the shift would miss every asserted positive-degree vanishing.

### 5.4 Vanishing above degree two

On the smooth hyperspecial integral Siegel threefold with residue field k of characteristic p, if a≥3 and 2≤a−b≤p−2, then H^i(X_k,ω(a,b)(−D))=0 for i>2. The lower boundary of each displayed weight range is included. The level is neat and prime to p, and the finite field may be extended without changing the conclusion.

(CG20, Theorem 5.1(1) and proof, pp. 22–24).

A proof route is to use the length-1 Lan–Suh representative and its explicit weight formula. Choose integral α,β,t realizing (a,b) and check dominance, positivity and p-smallness. Translate W into ω and read the cohomological shift i−ℓ(w).

*Needs:* AutomorphicBundles 5.10; §5.3.

**Checks.**

- At p=7, (a,b)=(3,1) has a−b=2 and length-one parameters (α,β,t)=(0,0,1), yielding H^j_sub=0 for j>2. At (6,1), a−b=5=p−2 gives α+β=3<p−3=4. At (7,1), α+β=4 fails the strict bound; no nonvanishing assertion follows.

### 5.5 Vanishing above degree one

On the smooth hyperspecial integral Siegel threefold with residue field k of characteristic p, if a+b≥6 and 2≤a−b≤p−2, then H^i(X_k,ω(a,b)(−D))=0 for i>1. The lower boundary of each displayed weight range is included. The level is neat and prime to p, and the finite field may be extended without changing the conclusion.

(CG20, Theorem 5.1(2) and proof, pp. 22–24).

A proof route is to use the length-2 Lan–Suh representative and its explicit weight formula. Choose integral α,β,t realizing (a,b) and check dominance, positivity and p-smallness. Translate W into ω and read the cohomological shift i−ℓ(w).

*Needs:* AutomorphicBundles 5.10; §5.3.

**Checks.**

- At p=7, (4,2) has a+b=6 and a−b=2; (α,β,t)=(0,0,1) yields H^j_sub=0 for j>1. At (6,1), t=1 gives (α,β)=(2,1), with sum 3<4. At (7,1), the sum is 4 and the method’s strict bound fails, without predicting nonvanishing.

### 5.6 Positive-degree vanishing

On the smooth hyperspecial integral Siegel threefold with residue field k of characteristic p, if b≥4 and 0≤a−b≤p−4, then H^i(X_k,ω(a,b)(−D))=0 for i>0. The lower boundary of each displayed weight range is included. The level is neat and prime to p, and the finite field may be extended without changing the conclusion.

(CG20, Theorem 5.1(3) and proof, pp. 22–24).

A proof route is to use the length-3 Lan–Suh representative and its explicit weight formula. Choose integral α,β,t realizing (a,b) and check dominance, positivity and p-smallness. Translate W into ω and read the cohomological shift i−ℓ(w).

*Needs:* AutomorphicBundles 5.10; §5.3.

**Checks.**

- At p=7, (4,4) has (α,β,t)=(0,0,1) and yields vanishing for every j>0. At (7,4), (3,0,1) has α+β=3<4. At (8,4), α+β=4 fails the bound; the theorem makes no claim there.

### 5.7 Serre duality and the dual Siegel weight

For a smooth proper toroidal Siegel threefold in characteristic zero, or in characteristic p with 0≤a−b≤p−1 so the symmetric-power dual identification is valid, the Serre dual of ω(a,b) is ω(3−b,3−a)(−D), and H^i_can(ω(a,b))^∨≃H^(3−i)_sub(ω(3−b,3−a)). The normalized Hecke equivariance includes inverse double cosets and the determinant/cyclotomic twist from CG20 Appendix A.3.2. For larger weights use the actual divided-power dual rather than this symmetric-power formula.

(CG20, §5.3, pp. 30–31; Appendix A.3.2, pp. 86–88).

A proof route is to use the logarithmic Kodaira–Spencer formula ω_X≃det(E)³(−D). Dualize Sym^(a−b) only under the indicated factorial-invertibility bound. Apply coherent Serre duality and transpose the geometric normalized correspondence, retaining its twist.

*Needs:* AutomorphicBundles 5.10; §1.6; §3.9; §4.1; AutomorphicBundles Layer 11.

**Checks.**

- The dual weight transformation is involutive; the same symmetric-power formula is not accepted beyond the small-weight range.

### 5.8 Mod-p singular-weight vanishing

On the hyperspecial Siegel threefold over k, H²_sub(ω(a,2))=H³_sub(ω(a,2))=0 for 4≤a≤p. For 3≤a≤(p+1)/2, H⁰_can(ω(a,3−a))=H³_sub(ω(a,3−a))=0. The canonical/subcanonical tags in the second assertion are different and essential.

(CG20, Corollary 5.8 and proof, pp. 30–31).

A proof route is to substitute the first weight into Theorem 5.1(2) and check its p-small inequalities. Use Serre duality and Theorem 5.1 on the transformed singular weight for the second range. Keep the cohomological degree and boundary twist through each duality.

*Needs:* AutomorphicBundles 5.10; §5.5; §5.7.

**Checks.**

- At p=5, a=4 satisfies 4≤a≤p, so weight (4,2) has subcanonical vanishing in degrees 2,3. At a=3, the second range is 3≤a≤(p+1)/2=3 and the coefficient is ω(3,0), with canonical H⁰=0 and subcanonical H³=0; no equality of the two degree-zero spaces follows. At a=6 neither displayed range applies.

### 5.9 Large parallel twists and reduction of sections

Fix a dominant weight μ and a finite set of neat toroidal levels among X,X₀(Q),X₁(Q) for which relative subcanonical vanishing and an ample Hodge line on the minimal model hold. There is N(μ,levels) such that every parallel twist μ+t with t≥N has H^i_sub(X_k,ω_(μ+t))=0 for i>0. Consequently reduction H⁰_sub(O)→H⁰_sub(k) and the quotient map H⁰_sub(E)→H⁰_sub(E/O) are surjective, with their coefficient exact-sequence interpretation. No bound uniform over all levels is asserted.

(CG20, §6.1, p. 36; proof of Theorem 6.13, p. 43).

A proof route is to push subcanonical coefficients to the minimal model using relative vanishing. Use Serre vanishing after ample Hodge twisting, and take the maximum bound over the fixed finite set of levels. Use the ϖ-adic and E/O coefficient long exact sequences, proper finite cohomology and Nakayama to get the two surjections.

*Needs:* AutomorphicBundles 5.10; §5.2; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; §1.4.

**Checks.**

- For [O → O] in degrees 0,1 with differential ϖ, H⁰=0 but after reduction H⁰=k; the map 0→k is not surjective because H¹=k has ϖ-torsion. For the degree-zero stalk O, H¹=0 and O→k is surjective. These compute the obstruction removed by the large-twist hypothesis.

### 5.10 The EO Cousin computation

At hyperspecial p-level on the smooth Hilbert–Siegel toroidal model, filter by closures of Ekedahl–Oort strata of codimension at least i. For subcanonical locally free automorphic coefficients modulo pⁿ, n≥1, the Kempf Cousin resolution computes the sheaf, and its global-section complex computes RΓ once the following acyclicity is proved. The canonical-coefficient algebra action is obtained separately by coherent duality, not by assuming the same untwisted canonical Cousin acyclicity. Prove acyclicity using the affine stratum image on the minimal compactification, cofinal regular-sequence thickenings, Koszul resolutions and Lan relative vanishing. Affineness of the stratum itself is not assumed in place of this argument.

(BCGP21, Proposition 3.9.11, pp. 229–230).

A proof route is to use the EO codimension, affine-image and regular-thickening results of §5.0. Apply the general Kempf resolution to the MCM coefficient and identify the support terms by cofinal Koszul thickenings. Use relative vanishing over the affine minimal stratum image to prove the required term acyclicity.

*Needs:* §5.0 for the EO geometry and regular thickenings; AutomorphicBundles 5.10; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; §5.2; ShimuraCompactifications 4.3–4.10 and Layer 7.

**Checks.**

- On k[x,y], the sequence (x,y) is regular and its Koszul complex has only H⁰=k. In k[x,y]/(xy), x is a zero-divisor with xy=0 and y≠0, so the one-element Koszul complex has nonzero H⁻¹=(y); a codimension assertion cannot replace regularity.

### 5.11 Injecting the Cousin complex into the interior

For the preceding EO filtration, restriction of every Cousin term of a subcanonical coefficient to the open Shimura variety is injective, provided the boundary equation is a non-zero-divisor on every relevant regular-sequence quotient. Verify this using that no associated component of any chosen Cohen–Macaulay regular-sequence thickening is contained in the boundary and the Cohen–Macaulay thickening argument. Section 5.0 proves the required geometric boundary regularity. This is a termwise detection statement, not an assertion that global coherent cohomology injects into open cohomology in every degree.

(BCGP21, Lemma 3.9.12 and its proof, p. 230).

A proof route is to express the Cousin term as the filtered colimit of Ext groups for the regular thickenings. Prove boundary regularity on each quotient from the geometric non-containment and CM hypotheses. Localize at the boundary equation and use the resulting injection in every term.

*Needs:* §5.0 for boundary regularity; AutomorphicBundles 5.10; §5.10; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21.

**Checks.**

- On k[x,y]/(x²), localization at y is injective since y is a non-zero-divisor; on k[x,y]/(xy,x²), it kills the nonzero class x. These are termwise tests before taking cohomology.

### 5.12 Hecke maps on the EO Cousin complex

For a prime-to-p Hecke correspondence preserving each EO stratum, coherent pullback and finite-duality upper shriek induce compatible maps on the Ext systems defining the Cousin terms, hence a map of Cousin complexes. Use pulled-back regular sequences, the explicit finite duality formula and cofinal systems of powers to obtain compatibility with the Cousin differential. These maps agree with the derived global Hecke action on the interior.

(BCGP21, Lemma 3.9.13 and Remark 3.9.14, pp. 230–231).

A proof route is to pull back the EO regular sequences and check the finite-flat or duality hypotheses for both legs. Construct the maps on local Ext/Koszul representatives, with cofinal powers when generators change. Use the natural maps of ordinary local-cohomology support sequences and their Ext/Koszul representatives to prove compatibility with incidence differentials and augmentation; compare on the interior. BP26’s completion/compact-support filtration is a separate construction.

*Needs:* AutomorphicBundles 5.10; §5.10; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; AlgebraicModuliForArithmeticGeometry §7.5 (the boundary fundamental-class contract).

**Checks.**

- On the two-term complex k → k with differential id, the term maps (id,id) commute with the differential and induce a chain map. The pair (id,0) gives d·id=id but 0·d=0 and is rejected.

### 5.13 Integral prime-to-p Hecke relations at hyperspecial level

For the BCGP21 Hilbert–Siegel models with p split completely in F and K_p=∏_(v|p)GSp₄(O_(F_v)), prime-to-p Hecke operators act through the abstract integral Hecke algebra on RΓ of canonical and subcanonical automorphic coefficients. For the G₁ quotient model use the compactified direct-factor descent of §5.0, which needs no hypothesis on p. The integral algebra relations are detected termwise on the EO Cousin complex by restriction to the interior. Arbitrary p-level integral relations are outside this statement.

(BCGP21, Proposition 3.9.15 and Remark 3.9.16, pp. 231–232).

A proof route is to establish the convolution relations on the open Shimura variety using its finite étale correspondences. Use termwise interior injection to prove those same relations on the integral Cousin complex. Pass from the modulo-pⁿ models through derived formal completion to RΓ. Obtain the canonical-coefficient result by duality using the actual integral dual coefficient (divided powers where required), and descend to G₁ along the Hecke-stable direct summand of §5.0.

*Needs:* §5.0 for compactified quotient descent; AutomorphicBundles 5.10; §5.12; §5.11; §3.13; §3.11; SmoothRepresentationsOfLocalGroups SR.1; SchemeAndStackFoundations §§4.8–4.10; DeformationAndDerivedPatchingAlgebra §§7.1–7.9.

**Checks.**

- On k[0] for k=O/ϖ, id and zero become equal after tensoring with E, but their integral H⁰ maps send 1 to 1 and 0. The analogous torsion-detection step for the stated hyperspecial model therefore cannot be replaced by generic-fibre agreement.

### 5.14 Localized coherent perfect complexes

Assume a commuting Hecke-algebra action on C_n^∨ has been supplied (for the integral geometric application use §5.13, not merely the individual Layer 3 operators). Let T_n be its finite A_n-algebra image in End_D(C_n^∨). For a maximal ideal m, its Artinian local-factor idempotent splits C_n^∨ into a perfect summand C_(n,m)^∨ and its complement, with H^i(C_(n,m)^∨)=H^i(C_n^∨)_m. The dual chain summand localizes at the transposed Hecke ideal, with character twists transported explicitly. This is not localization at an arbitrary prime by an idempotent over an arbitrary base.

(CG18, §7.2, p. 400).

A proof route is to use finiteness of derived endomorphism groups of a perfect finite-coefficient complex to get finite T_n. Apply the imported Artinian idempotent decomposition and perfect retract theorem. Identify cohomology and transport the dual action via the transpose pairing.

Its API is:

- Produce the local-factor idempotent and its perfect image.
- Cohomology of the summand is the ordinary T_n-localized cohomology.
- The dual summand uses the ideal pulled back by transpose and the specified central twist.
- Local-factor projectors sum to identity and are mutually orthogonal; the resulting perfect decomposition is functorial for maps commuting with T_n.
- A Hecke-equivariant derived equivalence of perfect models identifies their local factors and the §2.5 comparisons whenever the idempotents correspond.

*Needs:* Mathlib `CochainComplex.isKProjective_of_projective` and `CochainComplex.IsKProjective.Qh_map_bijective`; DerivedModuleAlgebra §§1.3–1.5, 1.E.1; DeformationAndDerivedPatchingAlgebra §§7.1–7.9; IntegralHeckeAndGaloisDeterminants §§2.2–2.3; §5.13.

**Checks.**

- For T_n=A_n×A_n acting on C⊕D, the first maximal factor selects C.
- An ideal outside the support gives the zero perfect complex.
- Over Z, localization at (p) is not in general obtained from an idempotent in Z.
- For T_n=A_n×A_n, the two projectors (1,0),(0,1) square to themselves, have product 0 and sum (1,1); a scalar (1,1) cannot select C alone.

### 5.15 Non-Eisenstein coherent localization

Use IntegralHeckeAndGaloisDeterminants §§3a–3b’s Galois-type/non-Eisenstein predicates for the normalized geometric Hecke algebra: after finite residue-field extension the spherical degree-four polynomials agree with a continuous absolutely irreducible residual representation. When the application requires a representation into GSp₄ with specified multiplier, retain its alternating form and multiplier as additional hypotheses. Transport residual systems through the actual coefficient-normalization algebra map and transpose involution; generic residual polynomial transport is imported from IntegralHeckeAndGaloisDeterminants §§3a–3b.

(BCGP21, §3.10, p. 236; CG20 §7.2, pp. 52–55).

A proof route is to pull the imported residual polynomial system through the geometric algebra identification. Extend the residue field when needed and retain absolute irreducibility and the symplectic multiplier. Compare ideals on dual cohomology via the transposed geometric operators and their cyclotomic twist.

*Needs:* §4.3; §5.14; IntegralHeckeAndGaloisDeterminants §§3a.1–3a.2, 3b.1–3b.2; ArithmeticGaloisRepresentations §§1.1–1.2, 1.7–1.11.

**Checks.**

- An arbitrary GL₄ residual witness does not itself supply a symplectic form or a GSp₄ multiplier.

### 5.16 Congruence localization of complex coherent cohomology

Assume O has characteristic-zero fraction field E, fix a finite commutative O-Hecke image T acting on a finite O-module lattice M_O, and choose a field embedding E→ℂ. Put M_C=M_O⊗_Oℂ through this embedding. For a residual maximal ideal m, define M_(m,C) as the sum of the generalized characteristic-zero Hecke eigenspaces whose integral characters reduce to m after passing to a common finite coefficient extension. This is (M_O)_m⊗_O C for a finite integral lattice with that action, through the product decomposition of T⊗E. A maximal ideal of T⊗C alone does not encode residual congruence.

(P20, §15.2.3, p. 108).

A proof route is to use the finite integral algebra and its local factor at m. Decompose its generic fibre into generalized character factors, allowing finite field extension. Compare with localization of the integral lattice and scalar extension to C.

Its API is:

- A characteristic-zero eigenspace lies in M_(m,C) exactly when its integral character reduces to m.
- Compatible finite stable lattices give the same generic localized summand.
- Finite extension of O and compatible embeddings transport the congruence summand as expected.
- A map commuting with the fixed finite integral Hecke image preserves each residual congruence summand and respects identity and composition.
- The residual local-factor projectors are orthogonal and sum to identity; retain generalized generic eigenspaces without assuming semisimplicity.

*Needs:* §5.14; §5.15; IntegralHeckeAndGaloisDeterminants §§2.2–2.3.

**Checks.**

- Take T=O[t]/(t(t−ϖ)), with generic characters t↦0 and t↦ϖ acting on E⊕E. Both reduce to m=(ϖ,t); hence M_(m,C)=C⊕C, although T⊗C has two distinct maximal ideals.
- If no character reduces to m the complex localized space is zero.
- Localizing only at one maximal ideal of T⊗C can discard a second congruent characteristic-zero character.
- For T=O×O acting on O², residual localization at m=(ϖO)×O gives ℂ×0 of dimension 1; at m′=O×(ϖO) it gives 0×ℂ. The two ideals select different subspaces of the same generic space.

### Examples

For p=7 and weight (4,2), the length-one substitution t=2, α=β=0 gives vanishing above degree two, and the length-two substitution t=1, α=β=0 gives vanishing above degree one. Weight (4,4) uses length three with t=1 and gives vanishing above degree zero. At the first allowed i=4, the shifted degrees i−ℓ(w) are 3,2,1. Each has α+β=0<4; the different cohomological cutoffs come from lengths 1,2,3, not from a changed prime.

### Dependencies

AlgebraicModuliForArithmeticGeometry §7.5 (the boundary fundamental-class contract); ArithmeticGaloisRepresentations §§1.1–1.2, 1.7–1.11; AutomorphicBundles Layer 11; CrystallineCohomology CR.5.1–CR.5.4; AutomorphicBundles Layer 9 (the coefficient splitting contracts); DerivedModuleAlgebra §§1.3–1.5, 1.E.1; DeformationAndDerivedPatchingAlgebra §§7.1–7.9; IntegralHeckeAndGaloisDeterminants §§2.2–2.3; IntegralHeckeAndGaloisDeterminants §§3a.1–3a.2, 3b.1–3b.2; ReductiveGroups §10B; SchemeAndStackFoundations §§2.6–2.8, 2.18–2.21; SchemeAndStackFoundations §§4.8–4.10; ShimuraCompactifications 4.3–4.10 and Layer 7; ShimuraCompactifications 6.1–6.11; ShimuraCompactifications 7.19–7.21, 7.31; SchemeAndStackFoundations §§0.18, 1.1, 2.23; §3.0b; SmoothRepresentationsOfLocalGroups SR.1. Earlier in this layer use the individual prerequisites displayed above.

## Layer 6: coherent cohomology and automorphic forms

### 6.1 Interior coherent cohomology and towers

For a canonical coefficient F_can with subcanonical F_sub=F_can⊗I_D, define H̄^i(X,F)=im(H^i(X,F_sub)→H^i(X,F_can)). Define H̃^i_* as the filtered colimit over neat levels and compatible fans, with pullback transition maps. This is the image of the boundary-ideal map; it is not defined as compactly supported topological cohomology. The underlying additive image uses the pinned Scheme.Modules.cohomologyFunctor.

(CG20, §5.3, pp. 24–25; P20 §15.2.3, p. 108).

A proof route is to apply the existing cohomology functor to the boundary ideal inclusion. Take its image as a coefficient submodule; on underlying additive groups use Tau Ceti’s cohomology functor. Use Hecke compatibility and exact filtered colimits to give the image tower its action.

Its API is:

- A canonical class is interior exactly when it has a subcanonical lift.
- Level pullbacks preserve the image and give the direct-limit action.
- Commuting coefficient Hecke squares induce endomorphisms of H̄^i.
- The image is an O-submodule (or complex subspace), with its canonical inclusion; it is the range rather than the source modulo an unspecified kernel.
- A commuting canonical/subcanonical square induces a unique image map; these maps preserve identity, composition, addition and scalars.

*Needs:* §1.4; §4.4; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`.

**Checks.**

- If D is empty, H̄^i=H^i_can.
- If the degree-i boundary-ideal map is zero, its interior image is zero.
- In degree zero, cohomologyZeroEquiv identifies the image with sections admitting a subcanonical lift.
- For the boundary-ideal inclusion (t)→k[t], the degree-zero image contains t but not 1. For empty boundary the image is all k[t]. Replacing the image by all canonical sections would incorrectly include 1 in the first case.

### 6.2 The canonical-extension growth resolution

Let (G,X) be a Shimura datum with G connected as an algebraic group over ℚ, satisfying Su’s condition that the maximal Q-split central torus A_G is also maximal R-split in Z_G, K neat, Σ a smooth toroidal fan and V a finite-dimensional holomorphic P_h-representation. The logarithmic differentiably-moderate-growth Dolbeault complex is a fine resolution of V_can on the toroidal compactification; its global sections identify with the relative (p_o,K_o) Chevalley–Eilenberg complex of C∞_dmg(G)^K⊗V. The central A_G factor and the finite-adelic action on V_o are retained.

(Su24, Propositions 3.14 and 3.16, pp. 36–38; conventions §1.1, pp. 6–10).

A proof route is to identify the canonical coefficient on a toroidal chart using its holomorphic frame and logarithmic boundary coordinates. Prove the growth Dolbeault lemma and fine-sheaf resolution on those geometric charts as in Su24 Propositions 3.14 and 3.16; AutomorphicSpectralTheory §5.2’s full-pair weighted de Rham comparison does not replace this construction. Compare the Dolbeault differential with the imported relative Chevalley–Eilenberg differential and track finite-adelic coefficient transport.

*Needs:* §4.4; AutomorphicFormsOnReductiveGroups §§1.1–1.3, 6.1–6.2; AutomorphicBundles Layer 5.

**Checks.**

- For sl₂ with trivial coefficient, dim(sl₂/so₂)=2 and the relative degree-two invariant space is ℂ. The brackets land in so₂, so the relative differential is zero and H²=ℂ. The parabolic quotient p_o/k_o has dimension 1, so its degree-two complex and H² are zero. These relative complexes cannot replace each other.
- On a smooth complete modular curve with nonempty cusp divisor D, the trivial canonical extension has constant section 1, whose restriction to D is 1; it is not a section of O(−D). This distinguishes the canonical growth resolution from its subcanonical variant.

### 6.3 Su’s automorphic comparison

Under the preceding Su hypotheses, H^i(X_(K,Σ),V_can)≃H^i(p_o,K_o;A(G)^(A_G(R)^0K)⊗V), naturally in V and finite-level Hecke operators. At the tower level the isomorphism is G(A_f)-equivariant with the modified coefficient V_o on which the central A_G component acts inversely. The map is induced by inclusion of automorphic forms into uniformly moderate growth functions. This theorem does not identify all canonical cohomology with cusp cohomology.

(Su24, Proposition 4.1, p. 38; Theorem 5.7 and proof, pp. 54–55).

A proof route is to use the parabolic relative-cochain inclusion C∞_umg→C∞_dmg requested in the Su parabolic regularization contract at AutomorphicSpectralTheory §5.2. Import uniform-moderate-growth Fin_J acyclicity from its §5.8; §5.7a concerns only the logarithmically weighted core. For the given holomorphic V, prove the finite-codimension-ideal and restriction-of-pairs comparison from (m_G,K_o) to (p_o,K_o), as in Su24 Lemmas 5.1–5.5 and Corollary 5.3, pp. 53–55; local central finiteness supplies acyclicity on the automorphic module. The coefficient need only be a P_h-representation, so the full-pair comparison for an m_G-coefficient is not substituted here. Compose with the canonical-extension growth resolution and check the tower action on V_o.

*Needs:* §6.2; AutomorphicSpectralTheory §5.2 (the Su parabolic regularization contract), §§5.3–5.4, 5.8; AutomorphicFormsOnReductiveGroups §§1.1–1.3.

**Checks.**

- For the trivial coefficient on a connected complete modular curve with cusps, the canonical constant class 1 maps to the constant automorphic form, whose constant term is 1. The cuspidal source has constant term 0 and cannot replace the automorphic source.
- With V=0, both parabolic relative complexes are zero in every degree and the regularization comparison is the unique isomorphism 0→0. For the trivial SL₂ coefficient the parabolic quotient has dimension 1 and degree-two cochains are zero; the full relative H² is ℂ as in §6.2.
- If a removed central factor acts on a coefficient line by 2, the V_o correction acts by 1/2 and the balanced product is 1. Using the same action rather than its inverse gives 4 and breaks the tower transport.
- On the modular cusp with measure dy/y², f(y)=y has uniform polynomial growth: every power of y∂/∂y sends f to y. For every n, its logarithmically weighted squared norm has tail integral ∫(log y)^(−2n)dy=∞. Thus the logarithmically weighted core and uniform moderate growth have different vectors, and core acyclicity alone does not supply §5.8.

### 6.4 Harris’s cusp and interior comparison

In the characteristic-zero toroidal Siegel setting, relative (p^−,K_h)-cohomology of cuspidal automorphic forms maps injectively into interior coherent cohomology, and interior cohomology lies in the image of the L² automorphic comparison in canonical cohomology. The cusp map is an isomorphism in degrees 0 and 3 for the Siegel threefold. The totally real product version gives cusp→interior→L²-image inclusions, with central character and multiplicities retained. The comparison diagram uses a separate cusp/subcanonical map; Su’s theorem alone does not supply it.

(CG20, Theorem 5.2, p. 25; BCGP21 proof of Theorem 3.10.1, pp. 239–240; H90, Theorems 2.4.4 and 2.7, pp. 57–58; Proposition 2.7.2 and (3.0.1), p. 59).

A proof route is to construct the rapid-decay and slow-growth Dolbeault comparisons using H90 Theorems 2.4.1 and 2.4.4, pp. 56–57. Use H90 Theorem 2.7, p. 58, and the harmonic/relative-cohomology identification (3.0.1), p. 59, for the injection and L²-image containment. Apply Proposition 2.7.2, p. 59, in end degrees; retain the precise full-group and product conventions as AutomorphicFormsOnReductiveGroups §§6.4–6.6.

*Needs:* §6.3; §6.1; AutomorphicSpectralTheory §§4.1–4.5; AutomorphicFormsOnReductiveGroups §§1.1–1.3, 6.1–6.2.

**Checks.**

- For the trivial coefficient on a connected complete modular curve with cusps, the canonical constant section restricts to 1 on D and has no subcanonical lift. The cusp/interior degree-zero space excludes it, while canonical H⁰ contains it.

### 6.5 Cuspidal, L² and tempered image subspaces

Define H^i_cusp and H^i_(2) inside canonical coherent cohomology as images of the corresponding relative-cohomology maps. Define the tempered part by first summing the relevant cuspidal or discrete L² irreducible automorphic summands whose archimedean factors are essentially tempered, then applying the comparison map. Keep these images distinct from the source relative cohomology and from H̄^i; a quotient map can have a kernel.

(CG20, §5.3, pp. 25–26).

A proof route is to use the spectral owner’s discrete automorphic summands with their finite multiplicities. Form the specified relative cohomology and image in canonical cohomology. Select essentially tempered archimedean factors before mapping; compare nested image subspaces.

Its API is:

- A class belongs exactly when it is the image of a relative class in the specified automorphic source.
- Cusp images lie in L² images, and tempered cusp images lie in tempered L² images.
- Each image is stable under the compatible finite Hecke action.
- Use the linear range of the named relative-cohomology comparison map with its kernel quotient; finite sums and scalars stay in the image.
- Compatible level changes preserve each cusp, L² and tempered image and commute with inclusion into canonical cohomology.

*Needs:* §6.4; AutomorphicSpectralTheory §§4.1–4.5; AutomorphicFormsOnReductiveGroups §§1.1–1.3, 6.1–6.2.

**Checks.**

- The zero automorphic source has zero image.
- A kernel element of the comparison source is not a nonzero canonical coherent class.
- In end degrees the cusp image agrees with interior cohomology by Harris’s comparison, without asserting it equals all canonical cohomology.
- For a comparison C²→C, (x,y)↦x, the source has dimension 2 and its image dimension 1; the kernel vector (0,1) contributes no coherent class.

### 6.6 Isotypic contribution to coherent cohomology

For a full discrete automorphic representation π=π_∞⊗π_f in the discrete automorphic source, with its actual occurrence (multiplicity) space M_disc(π), define its degree-i coherent contribution as the image of M_disc(π)⊗H^i(p^−,K_h;π_∞⊗V)⊗π_f in the specified coherent image. Say π contributes when this image is nonzero. For a fixed irreducible finite-adelic representation σ, define the σ-isotypic degree-i contribution as the image of the sum of these source spaces over all full π with π_f≃σ, followed by the comparison map; a finite part alone does not determine π_∞ or its multiplicity. At a finite level replace each π_f by π_f^K. A spectral isotypic multiplicity is counted explicitly; it is not silently set to one.

(CG20, Proof of Theorem 5.5, p. 28; Theorem 5.6, p. 29; BCGP21 Theorem 3.10.1, p. 236).

A proof route is to decompose the discrete source with its actual multiplicity spaces. Apply relative cohomology on each admissible coefficient summand and the coherent comparison map. Define contribution using its image and prove the finite-level invariant formula under characteristic-zero descent.

Its API is:

- The finite-level contribution has π_f^K in place of π_f.
- Retain the spectral multiplicity space in every summand.
- Contribution is equivalent to nonzero image, not merely occurrence in the spectral decomposition.
- Its image is the source summand divided by the actual comparison kernel; the dimension equals the source dimension only if that restriction is injective.
- Finite-level maps and Hecke operators preserve the contribution and its multiplicity space through the same spectral comparison.

*Needs:* §6.5; AutomorphicSpectralTheory §§4.1–4.5; SmoothRepresentationsOfLocalGroups SR.3.

**Checks.**

- If π_f^K=0 the finite-level contribution is zero.
- A one-dimensional relative cohomology and multiplicity m give m copies of π_f^K before any comparison kernel.
- A spectral summand with zero relative cohomology in degree i has zero degree-i contribution.
- A representation present in L² with zero relative cohomology does not contribute.
- For a finite part σ with dim σ^K=d shared by a holomorphic and a generic member of multiplicity one at weight (4,2), the holomorphic and generic full representations contribute (d,0) and (0,d) respectively in degrees (0,1); the σ-isotypic contribution is (d,d). A definition from σ alone would have to choose one archimedean factor and would give (d,0) or (0,d).

### 6.7 Algebraic and analytic coefficient conventions

For GSp₄, W_(a,b;c)≃V_(−b,−a;a+b+2c) as Hecke-linearized coefficient bundles over C, with the declared finite-adelic central transport. Changing the central parameter preserves the underlying holomorphic bundle but not its full Hecke linearization. The comparison is made on G(R)×G(A_f) with the correcting central factor; the naive compact-dual G(Q)-equivariant multiplication by ν(g)⁻¹ is not valid without this correction.

(CG20, Definition 5.3 and Lemma 5.4, pp. 26–27).

A proof route is to compute the rank-two standard and determinant coefficients from the de Rham homology sequence. Compare the highest weights on the compact dual. Insert the finite-adelic norm/sign factor that corrects the rational central action, and verify the Hecke cocycle.

*Needs:* §1.3; §4.4; AutomorphicBundles Layer 3.

**Checks.**

- At (a,b)=(5,2), the natural W central coordinate −7 changes to −4 after the ν⁻³ twist, and V_(−2,−5;−1) is the new coefficient. At 2I₄ the scalar changes from 128 to 2 although the underlying bundle is unchanged; ignoring the finite Hecke linearization would give 128 in both cases.

### 6.8 Holomorphic cusp eigensystems

For Ω^(k,r)=ω(k+r,r), k≥0 and r≥2 over C, subcanonical H⁰ is the multiplicity-counted sum of cuspidal finite-adelic representations with holomorphic discrete-series or holomorphic-limit archimedean factor. In P20’s coordinates the factor has parameter (1−k−r,2−r;k+2r). A simultaneous unramified Hecke eigencharacter determines a cuspidal automorphic summand after choosing a nonzero spectral projection; it need not determine a unique global representation before multiplicity-one input. In Scholze’s symplectic/unitary scalar-weight setting, with k>n in the totally real symplectic case and k≥n in the CM unitary case of Corollary V.1.7, the Petersson adjoint relation makes the commuting spherical Hecke image a product of copies of C.

(P20, §5.3, pp. 24–25; CG20 proof of Proposition 6.8, p. 39; Sch15 Corollary V.1.7, manuscript p. 83 (published pp. 1035–1036)).

A proof route is to identify holomorphic cusp functions with subcanonical sections by the degree-zero cusp comparison. Use the spectral decomposition with the holomorphic archimedean coefficient and its multiplicity. For scalar weights use the positive Petersson pairing, closure of adjoints in the Hecke algebra and simultaneous diagonalization; project an eigencharacter to a cuspidal summand.

*Needs:* §6.4; §6.6; §6.7; AutomorphicSpectralTheory §§4.1–4.5; AutomorphicFormsOnReductiveGroups §§6.3–6.7.

**Checks.**

- The r=2 limit case uses the same holomorphic cusp dictionary, and no global multiplicity-one conclusion is inferred merely from an eigenform.

### 6.9 Products and relative-cohomology degree counts

For the finite product of archimedean pairs of Res_(F/Q)GSp₄ and tensor-product coefficient V, relative cohomology of a discrete automorphic tensor factor decomposes by the Künneth sum over tuples of nonnegative degrees with total i. When each local factor has a single one-dimensional coherent group in degree 0 or 1, the global degree-i multiplicity counts exactly those i-element subsets of the degree-one choices. Retain full compact-group component actions before taking invariants.

(BCGP21, Proof of Theorem 3.10.1, pp. 239–240).

A proof route is to identify the product relative cochain complex with the tensor product of the local complexes over C. Apply the field Künneth theorem and the imported local coherent-degree calculation. Take the actual compact component-group invariants; use the specified full-group calculation of AutomorphicFormsOnReductiveGroups §§6.4–6.6.

*Needs:* AutomorphicFormsOnReductiveGroups §§1.1–1.3, 6.1–6.2; AutomorphicFormsOnReductiveGroups §§6.3–6.7; §6.6.

**Checks.**

- For d factors with two choices in their respective packets, degree one counts d local changes only when the component-group constraints permit all those changes.

### Examples

For the trivial coefficient in degree zero on a connected proper toroidal model, canonical cohomology contains the constant section 1. If the boundary is nonempty, that section restricts to 1 and is not subcanonical. Thus the automorphic comparison includes a noncuspidal constant contribution while the interior image in that eigenspace is zero.

### Dependencies

AutomorphicBundles Layer 3; AutomorphicBundles Layer 5; AutomorphicFormsOnReductiveGroups §§1.1–1.3, 6.1–6.2; AutomorphicFormsOnReductiveGroups §§6.3–6.7; AutomorphicSpectralTheory §§4.1–4.5; AutomorphicSpectralTheory §5.2 (the Su parabolic regularization contract), §§5.3–5.4, 5.8; SmoothRepresentationsOfLocalGroups SR.3; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`. Earlier in this layer use the individual prerequisites displayed above.

## Layer 7: Siegel chambers and singular weights

### 7.0 Coefficient transport, transfer and the conditional contract for packets

Apply AutomorphicFormsOnReductiveGroups §§6.3–6.7 on the actual coefficient realization of §6.7. Its balanced compact coordinates and the CG20 W/V coordinates are related by the coefficient intertwiner, the chosen dual and the central Hecke twist. With W_(a,b;c) and w=−(a+b+2c), the coefficient has central weight −w, so the contributing representation π_∞ in AutomorphicFormsOnReductiveGroups §6.3 has balanced parameter (a−1,b−2;w). Its contragredient has parameter (2−b,1−a;−w); up to the full Sp₄ Weyl group its semisimple coordinates equal (a−1,b−2). Read CG20 Theorem 5.6’s coordinate (a−1,b−2;−w) and its displayed spin orbit in this contragredient convention. Thus the following is the spin-transfer orbit of π_∞^∨:

    ((a+b−3−w)/2, (a−b+1−w)/2, (−a+b−1−w)/2, (−a−b+3−w)/2).

For c=3−a−b this is (3/2,3/2−(b−2),3/2−(a−1),3/2−(a+b−3)). Negating all four entries gives the spin-transfer orbit of the balanced π_∞. The two maps have source the indicated representation or its contragredient and target its GL₄ spin infinitesimal-character orbit; this does not claim a new construction of local Langlands. The coefficient has central weight −w and π_∞ has weight w, so their tensor has central weight zero. Keeping CG20’s central sign for π_∞ would instead give −2w. (CG20 Theorem 5.6(1)–(2), p. 29; Remark 5.12, p. 34.)

For the conditional global conclusions fix a residual symplectic degree-four system and excluded places. The geometric exclusion runs in two steps. (a) Let π be any discrete automorphic representation whose coherent cohomology with the given coefficient is nonzero. The coefficient transport above, with AutomorphicFormsOnReductiveGroups §§6.3–6.5, shows that π_∞ has the infinitesimal character shared by the specified holomorphic and generic limits. No temperedness of π_∞ and no membership of π_∞ in the holomorphic or generic limits is assumed at this step. (b) A π not of general type lies in one of Arthur's alternatives (b)–(f), and each alternative carries a compatible system of spin Galois representations that is reducible and has the same multiplier and the same normalized Frobenius characteristic polynomials as π; this is established separately in the two weight families. For the totally real weights of §8.8, with k_v≥l_v≥2 and k_v≡l_v modulo 2 at every real place, transport to BCGP21's central normalization and apply BCGP21 Lemma 2.9.1, whose hypotheses are exactly this infinitesimal character and this parity. For the rational family (a,2), for every integer a≥2, the parity hypothesis fails for odd a and the lemma is not invoked; prove the reducible systems in the arithmetic normalization by the case analysis of CG20's proof of Theorem 7.11, with the GL₄ infinitesimal character (3/2,3/2,5/2−a,5/2−a) of the contragredient orbit above: in cases (e) and (f) the transfer is an isobaric sum of four algebraic idèle class characters; in case (d), λ|·|^(1/2)⊞λ|·|^(−1/2)⊞μ, the two character entries differ by 1, which forces a=2 and μ a classical cuspidal eigenform of weight 2; in case (c), μ|·|^(1/2)⊞μ|·|^(−1/2) with μ cuspidal of orthogonal type, hence the automorphic induction of a Hecke character ψ of a quadratic field K, the same comparison forces a=2 and μ of infinitesimal character (1,1), so μ⊗|·|^(−1) has infinitesimal character (0,0) and ψ⊗|N_(K/ℚ)|^(−1) has finite order: μ⊗|·|^(−1) is a holomorphic weight-one dihedral form when K is imaginary quadratic or K is real quadratic with ψ_∞ of mixed sign, and a dihedral Maass form of Laplace eigenvalue 1/4 when K is real quadratic with ψ_∞∈{(1,1),(sgn,sgn)}; in both subcases the compatible system of μ is Ind_(G_K)^(G_ℚ) of the finite-order character that class field theory attaches to ψ⊗|N_(K/ℚ)|^(−1), twisted by the class-field character of |·| in the geometric-Frobenius normalization of this section, and no modular realization of μ is used; in case (b), μ₁⊞μ₂ with equal central characters, both μ_i are classical cuspidal eigenforms of weight a, since the alternative with one of them of infinitesimal character (3/2,3/2) and the other of (5/2−a,5/2−a) has unequal central characters for a≥2. Construct these reducible spin systems from the realization inputs below (WeightsInEtaleCohomology R34.5–R34.6 with ModularCurvesPartII §§14.1–14.4a for the weight-a and weight-two eigenforms of cases (b) and (d), class-field characters for the character summands, and in case (c) the induced class-field character, with ArithmeticGaloisRepresentations §1.12 for induction), and transport their normalized Frobenius polynomials and multipliers. In both families, comparing these polynomials with those of the absolutely irreducible residual system rules out every alternative, the character and induced cases as well as the Yoshida and Saito–Kurokawa cases. (BCGP21 Lemma 2.9.1 and proof, pp. 197–198, with its parity hypothesis; CG20 proof of Theorem 7.11, pp. 54–55.)

For the surviving general-type occurrences import EndoscopicTransferAndUnitaryTraceComparison §11.1 under the symplectic classification contract of its §§11.0g–11.0h, after transport to its unitary normalization. Its local-parameter comparison and cuspidality conclusion, with AutomorphicFormsOnReductiveGroups §§6.3–6.7’s full-group coherent calculation, identify the relevant archimedean members. Its multiplicity-one theorem supplies the pairing: retaining the same finite part and changing one allowed holomorphic limit to the generic limit gives another automorphic member with the same multiplicity one. Over a totally real field use that supplier on the full global L-packets, not a new component-group formula here. These conditional supplier hypotheses remain on every conclusion that uses the pairing. (BCGP21 Theorem 2.9.3, p. 198; P20 Proposition 15.2.4.1, p. 109; BCGP21 Corollary 3.10.5, p. 237.)

For the boundary proof use WeightsInEtaleCohomology R34.5–R34.6 and ModularCurvesPartII §§14.1–14.4a for classical weights at least two, and HilbertModularVarietiesAndShimuraCurves R18.3.29(a) for parallel Hilbert weights. The remaining weight-one classical realizations, which the boundary terms of §8.2 need (a Klingen term whose GL₂ factor is a weight-one bundle on the modular curve, as at the scalar weight (1,1)), and the non-parallel Hilbert realizations are the two separate supplier gaps above. Transport the arithmetic Hilbert realization to its contragredient to use geometric Frobenius with the same polynomial; do not invert Frobenius while keeping the representation fixed. Stable lattices and reduction/dual transport come from ArithmeticGaloisRepresentations and IntegralHeckeAndGaloisDeterminants. Compare the lower-rank polynomial and central character with SmoothRepresentationsOfLocalGroups SR.4.5 and §6.7 before forming the boundary direct sum. For an Eisenstein eigensystem use its two actual class-field characters. (BCGP21 proof of Lemma 3.10.7, p. 238; CG20 Lemma 7.10, pp. 52–53.)

*Needs:* Layers 4–6; AutomorphicFormsOnReductiveGroups §§6.3–6.7; EndoscopicTransferAndUnitaryTraceComparison §11.1 under the symplectic classification contract of its §§11.0g–11.0h; IntegralHeckeAndGaloisDeterminants §§3a–3b; SmoothRepresentationsOfLocalGroups SR.4.5; ArithmeticGaloisRepresentations §§1.7–1.12 and 5.1–5.3; WeightsInEtaleCohomology R34.5–R34.6 (the classical weight-one realization contract, for the boundary terms of §8.2); ModularCurvesPartII §§14.1–14.4a; HilbertModularVarietiesAndShimuraCurves R18.3.29 (the non-parallel Hilbert realization contract).

**Checks.**

- At (a,b)=(4,2), c=−3 and w=0, the transfer multiset is {3/2,3/2,−3/2,−3/2}, with sum 0. At (5,2), w=1, it is {3/2,3/2,−5/2,−5/2}, with sum −2; these are the contragredient orbits. The balanced π_∞ orbits have sums 0 and 2, respectively.
- At split weight (3,2;0), the coefficient is (−2,−3;5), the balanced parameter is (2,0;−5), its dual is (0,−2;5), and CG20 gives (2,0;5). Its central coordinate 5 agrees with the dual, whose semisimple coordinates are Weyl-conjugate. The balanced tensor weight is 5−5=0; using CG20’s sign for the same representation gives 5+5=10. The displayed spin orbit is {7/2,7/2,3/2,3/2}, of sum 10, for π_∞^∨; π_∞ has the negated orbit, of sum −10.
- The supplied closed chambers give memberships {0,1} at (a−1,b−2)=(3,0), {1,2} at (1,−1), and all four at (0,0). The last parameter is compact-singular and cannot define a nondegenerate limit by membership alone.
- The type-(d) alternative λ|·|^(1/2)⊞λ|·|^(−1/2)⊞μ has spin roots from two characters and one rank-two system, hence a proper invariant line and degrees 1+1+2; it is excluded against an absolutely irreducible residual degree-four system using only its infinitesimal character, before any statement about its archimedean factor being a limit.
- At (a,b)=(3,2) the parity hypothesis of BCGP21 Lemma 2.9.1 fails, since 3≢2 modulo 2, and a central twist changes only the central coordinate, leaving the semisimple pair (2,0) and the parity unchanged; so the lemma does not apply and the rational case analysis is used. There the character entries 3/2 and 5/2−3=−1/2 differ by 2, not 1, so cases (c) and (d) are empty, and case (b) is a pair of weight-3 classical eigenforms with equal central character, whose spin system is reducible of type 2+2. A route that invoked the lemma for every a≥2 would have no source for odd a.
- At a=2 the character entries 3/2 and 1/2 differ by 1, so case (d) (type 1+1+2, with μ of weight 2) and case (c) (a dihedral μ of infinitesimal character (1,1), whose |·|^(−1)-twist is a holomorphic weight-one or an eigenvalue-1/4 Maass dihedral form, type 2+2) both occur and are excluded by their reducible systems; at a=4 the entries 3/2 and −3/2 differ by 3, so both cases are empty and only (b), (e) and (f) remain.
- For K real quadratic and ψ of finite order with ψ_∞=(1,1), the automorphic induction μ=AI(ψ) is an even Maass form of Laplace eigenvalue 1/4 with infinitesimal character (0,0), not a holomorphic weight-one form, so a case (c) route through weight-one realizations alone misses it. Ind_(G_K)^(G_ℚ)ψ covers both subcases: at a prime p inert in K its Frobenius has trace 0 and determinant −ψ(pO_K), matching the vanishing Hecke eigenvalue of a dihedral form at an inert prime, whereas a model with trace ψ(pO_K) there is wrong.
- A direct sum of two nonzero two-dimensional representations has a proper two-dimensional invariant subspace. Its full degree-four characteristic polynomial cannot be that of an absolutely irreducible residual representation on every Frobenius after semisimplification, including in characteristic two.
- For two permitted real places with equal multiplicity m and finite invariant dimension d, the holomorphic contribution is md and the two single changes contribute 2md. Under the imported general-type theorem m=1. Over ℚ at weight (4,2), the holomorphic and generic archimedean members each have the same finite-level dimension d, giving h¹=h⁰=d.

### 7.1 Tempered coherent chamber vanishing

The tempered L²-image part of H^i_can(X_C,ω(a,b)) is zero unless (a−1,b−2;c) lies in C_i with the central coordinate ignored by the chamber inequalities. A tempered archimedean contributor is the discrete-series or limit representation π((a−1,b−2;w),C_i). This constrains the tempered image, and does not assert the vanishing of arbitrary canonical coherent cohomology. This degree restriction uses the fixed Siegel Hodge pair and its specified extension across components, as in AutomorphicFormsOnReductiveGroups §6.6; it is conditional on that full-group transport and is not deduced from the general other-degree vanishing assertion in H90 Theorem 3.4.

(CG20, Theorem 5.5 and Theorem 5.6(3), pp. 28–29; GK19, Remark 10.1.3, p. 962).

A proof route is to use the discrete L² decomposition and the imported local tempered coherent-cohomology calculation. Use the chamber condition to select the possible coherent degree. Apply the comparison map to obtain image vanishing; carry compact components as required by AutomorphicFormsOnReductiveGroups §§6.3–6.7.

*Needs:* §6.5; AutomorphicFormsOnReductiveGroups §§6.3–6.7.

**Checks.**

- At a singular wall more than one degree can occur; tempered image is not replaced by the full coherent group.
- For the trivial SL₂ representation with trivial coefficient, full relative H²(sl₂,SO₂;ℂ)=ℂ but parabolic relative H²(p_o,K_o;ℂ)=0, since its quotient has dimension one. A full-pair vanishing assertion cannot be deduced from the parabolic degree range.

### 7.2 Characteristic-zero singular-weight ranges

For the essentially tempered L²-image in characteristic zero, the limit families (a,2), a≥2; (a,3−a), a≥2; and (1,b), b≤1 have possible degrees given by their closed chamber memberships. Thus (a,2) allows degrees 0 and 1, while (a,3−a) allows degrees 1 and 2. The family (1,b), b≤1, allows degrees 2 and 3. Serre duality exchanges the first and third families. Any claim for full subcanonical or interior groups needs the corresponding cusp/interior or non-Eisenstein argument.

(CG20, §5.3, discussion after Theorem 5.6, p. 30).

A proof route is to substitute the shifted weights into all four closed-chamber predicates. Retain all chambers containing a wall point. Translate through Serre duality and retain the specified automorphic image.

*Needs:* §7.1; §5.7.

**Checks.**

- At (a,b)=(2,1), the shifted pair (1,−1) belongs to C₁ and C₂, as the full family predicts.

### 7.3 Large singular-weight interior decomposition

For the Siegel threefold, choose R_sing>0 from the AutomorphicFormsOnReductiveGroups §6.6 singular classification and let k≥R_sing−1 with parameter λ₁=−k−1<0, c=k+4. The interior H⁰ and H¹ for Ω^(k,2) decompose into holomorphic and generic archimedean-limit contributions, respectively, with their actual cuspidal multiplicities and a fixed central character. The local one-dimensionality in these two degrees is imported from AutomorphicFormsOnReductiveGroups §§6.3–6.7; the large-weight bound is −λ₁≥R_sing. The full compact-group convention must be verified before asserting vanishing in every other degree.

(P20, §15.2.2.1–15.2.3.1, p. 108).

A proof route is to use the AutomorphicFormsOnReductiveGroups §§6.3–6.7 singular large-weight contract as reported in P20 Theorem 15.2.2.1; retain −λ₁≥R_sing. H90’s regular all-root criterion is not this result. Use Harris’s interior comparison and the local holomorphic/generic one-dimensional groups. Keep the spectral multiplicity and compact component actions; only assert the two checked degrees.

*Needs:* §6.4; §6.9; AutomorphicFormsOnReductiveGroups §§6.3–6.7.

**Checks.**

- At a test bound R_sing=5, k=4 gives λ₁=−5 and −λ₁=5, meeting the threshold, whereas k=3 gives −λ₁=4 and fails it. The reversed condition λ₁≥5 rejects both and every λ₁<0.

### Examples

At (2,1), (2,−1), (1,−2) and (−1,−2), the supplied chamber memberships are respectively C₀, C₁, C₂ and C₃. At (0,0) all four hold. On y=0 and x>0, both C₀ and C₁ hold; in particular (2,0) cannot be assigned a unique closed chamber.

For normalized coefficients w=a+b−6, the balanced central infinitesimal character is a+b−6; its contragredient has 6−a−b. At (5,2) these are 1 and −1, respectively.

For a=4,b=2 the normalized entries are the multiset {3/2,3/2,−3/2,−3/2}; switching Frobenius convention must be accompanied by the corresponding dual shift.

The dimension conclusions assume the classification contract of EndoscopicTransferAndUnitaryTraceComparison §11.1 and the full-group coherent calculations of AutomorphicFormsOnReductiveGroups §§6.4–6.6.

### Dependencies

AutomorphicFormsOnReductiveGroups §§6.3–6.7; SmoothRepresentationsOfLocalGroups SR.4; §7.0. Earlier in this layer use the individual prerequisites displayed above.

## Layer 8: boundary localization and cuspidal decomposition

### 8.1 The Siegel boundary nerve calculation

For the GSp₄/Q toroidal boundary in characteristic zero, specialize the Harris–Zucker nerve spectral sequence E₁^(r,s)=⊕_(rank(R)=r+1)H^s(Z(R),F|Z(R))⇒H^(r+s)(D,F|D). Its adelic E₁ terms are parabolically induced from products of lower-rank coherent cohomology and cohomology of the associated Levi locally symmetric spaces, with the finite component corrections and Kostant shifts of HZ01 (3.2.8)–Corollary 3.2.9. Use this geometry only for the Q case; the HZ hypotheses used here do not automatically extend to Res_(F/Q)GSp₄ for F≠Q.

(HZ01, §3.2, (3.2.4)–(3.2.8) and Corollary 3.2.9, pp. 62–63; CG20 Lemma 7.10 proof, pp. 52–53).

A proof route is to use the finite closed cover of the boundary by maximal-parabolic strata and its alternating restriction complex. Specialize the HZ induced-term formula, including Δ₀,R and Δ₁,R corrections. Identify the GL₂ and GL₁ factors controlling the unramified Hecke eigensystems; the induced-term comparison is proved on these strata using SmoothRepresentationsOfLocalGroups SR.2 and the lower-rank attachment of §7.0.

*Needs:* §4.4; §7.0; ShimuraCompactifications 4.3–4.10 and Layer 7; AutomorphicFormsOnReductiveGroups §4.1; SmoothRepresentationsOfLocalGroups SR.2.

**Checks.**

- In the two-term nerve of a two-set cover, the constant pair (1,1) restricts to 1−1=0 on the intersection, whereas (1,0) restricts to −1. This tests the alternating restriction sign used in the Q-boundary calculation.

### 8.2 Non-Eisenstein boundary vanishing over Q

For the Siegel threefold over Q and a non-Eisenstein residual maximal ideal in the normalized degree-four Hecke convention, H^i(D_C,ω(a,b)|D)_m=0 for every i, for any dominant (a,b) with its canonical coefficient at a neat prime-to-p level, as stated immediately before CG20 Lemma 7.10. The boundary nerve terms give only reducible four-dimensional residual polynomial systems built from GL₂/GL₁ data, contradicting the absolutely irreducible witness; the GL₂ data are realized through §7.0’s boundary inputs, and a Klingen term whose GL₂ factor is a weight-one bundle on the modular curve uses the weight-one realization contract of WeightsInEtaleCohomology R34.6. Consequently H^i_sub→H^i_can is an isomorphism at m in every degree.

(CG20, Lemma 7.10 and proof, pp. 52–53).

A proof route is to compute the Hecke polynomial on every boundary E₁ term from its parabolic Levi factors. Use the compatible GL₂/GL₁ Galois systems and Frobenius recognition to show residual reducibility. Localize the nerve spectral sequence and then the boundary ideal long exact sequence.

*Needs:* §8.1; §5.15; ArithmeticGaloisRepresentations §1.8 and Layer 5; §7.0.

**Checks.**

- The Siegel Φ-operator takes a scalar Siegel form of weight k to an elliptic form of weight k on the Klingen boundary curve, so the scalar weight (1,1) has a weight-one boundary term and the weight-at-least-two realizations alone do not cover every dominant (a,b); at (a,2) with a≥2 the degree-zero Klingen terms have weight a≥2.
- In an exact cohomology segment with H⁰(D)=0, H¹_sub=0 and H¹_can=H¹(D)=ℂ, the map H¹_can→H¹(D) can be identity. Thus degree-zero boundary vanishing alone permits a cokernel of dimension 1; all-degree boundary vanishing forces that cokernel to be zero.

### 8.3 The genus-two boundary Φ calculation

For Ω^(k,2) on a characteristic-zero Siegel toroidal compactification, push its boundary restriction to the compactified modular-curve boundary. For k>0 this is the elliptic coefficient ω^(k+2)(−cusps); for k=0 it is ω² without the cusp twist. In P20’s normalized Hecke convention the claimed boundary identity is T_(ℓ,2)=2T_ℓ. Prove the coefficient pushforward and compute the vector-weight Hecke normalization directly on the constant-term correspondence; the displayed scalar identity is a target of that calculation, not an input to residual recognition.

(P20, Proof of Corollary 15.2.3.1, pp. 108–109).

A proof route is to use the boundary Fourier–Jacobi constant term and identify the compactified elliptic coefficient. Distinguish the k=0 constant-term case from k>0. Compute the Hecke pull–trace on the boundary or verify a source with exactly this vector-valued normalization; the source of the numerical assertion is P20 p. 109.

*Needs:* §1.3; §4.1; ShimuraCompactifications 4.3–4.10 and Layer 7; AutomorphicBundles Layer 12.

**Checks.**

- At k=0 the boundary coefficient is ω²; at k=1 it is ω³(−cusps). On a cusp chart with local parameter q, 1 belongs to O but not (q), whereas q belongs to (q). For a boundary T_ℓ eigenvalue 1, the displayed scalar relation gives 2 over ℂ and 0 modulo 2, so division by 2 is unavailable in characteristic 2.

### 8.4 The boundary Satake polynomial factorization

On a Hilbert modular boundary component, the normalized degree-four spherical Hecke polynomial factors as the characteristic polynomial of ρ₂⊕(ρ₂⊗χ), for the appropriate boundary two-dimensional Galois representation and normalized character χ; include the Eisenstein decomposition into characters when the Hilbert form is Eisenstein. The four spin monomials must be distinct: diag(1,1,ϖ,ϖ), diag(1,ϖ,1,ϖ), diag(ϖ,1,ϖ,1), diag(ϖ,ϖ,1,1). For each unramified v, write P₂(X)=X²−A_vX+D_v with D_v=q_vS_v for the boundary GL₂ coefficient. The local restriction has roots α_v,β_v,u_vα_v,u_vβ_v with u_vD_v=q_v³T_(v,0). Identify the GL₁ factor of the boundary constant term, including its modulus character, so that its geometric-reciprocity character χ satisfies χ(Frob_v)=u_v; equivalently u_vq_vS_v=q_v³T_(v,0), with no further q-power suppressed in χ. Thus P_spin(X)=P₂(X)(X²−u_vA_vX+u_v²D_v). This boundary-coefficient and class-field identification is a target here; the supplier gap requests only the local Satake identity. Absolute irreducibility of the residual degree-four witness contradicts this full-polynomial equality by Chebotarev and Brauer–Nesbitt; a trace identity alone is not substituted in small characteristic.

(BCGP21, Proof of Lemma 3.10.7, pp. 238–239; P20 pp. 108–109).

A proof route is to compute the Satake restriction to the Klingen Levi with the corrected four monomials. Match the lower-rank Hecke polynomial and central character, including normalized q-powers, to the Galois direct sum. Compare full characteristic polynomials on a dense Frobenius set and use semisimple recognition after residue-field extension.

*Needs:* §4.3; §7.0’s separate classical/Hilbert polynomial suppliers; SmoothRepresentationsOfLocalGroups SR.4; §7.0; ArithmeticGaloisRepresentations §1.8 and Layer 5.

**Checks.**

- At q=2, α=1, β=2, u=4, D=2 and T₀=1, the roots 1,2,4,8 give P(X)=(X²−3X+2)(X²−12X+32)=X⁴−15X³+70X²−120X+64. The normalized geometric generators have T_(v,1)=15 and T_(v,2)=30, since 2·30+10=70.
- For u=1 and α=β=1, P=(X−1)⁴; the four torus monomials remain distinct even though their evaluations coincide. No division by 2 or by α−β is used.
- For antidiagonal symplectic form, each of the four displayed diagonal tuples has similitude ϖ; repeating one tuple drops a distinct character before specialization.

### 8.5 Degree-zero Hilbert–Siegel boundary vanishing

Let F be totally real, p totally split, K=K^p∏_(v|p)K_v with K^p neat and K_v hyperspecial, paramodular, Siegel parahoric, Klingen parahoric or Iwahori (BCGP21 Definition 3.3.3, pp. 204–205), κ=(k_v,l_v)_v with k_v≥l_v≥2 and k_v≡l_v mod 2, and normalized central diamond |·|². For a non-Eisenstein residual ideal, H⁰(D_C,ω_κ|D)_m=0. Decompose the minimal boundary into zero-dimensional and Hilbert modular pieces. The point contribution vanishes unless k_v=l_v=k is independent of v (the scalar-parallel case); the curve-type contribution vanishes unless the l_v are parallel, then has Hilbert weight (k_v). In the parallel scalar case use π_*O_D=O_∂ via π_*I_D=I_∂ and R¹π_*I_D=0. No positive-degree boundary vanishing is asserted.

(BCGP21, Lemma 3.10.7 and Remark 3.10.6, pp. 237–239; BR16 Theorem 1.12 and Proposition 1.14, pp. 10–12).

A proof route is to compute the boundary coefficient pushforward by Fourier–Jacobi expansion, using the exact characteristic-zero weight restriction. Handle the scalar parallel case with the projection formula and the boundary ideal exact sequence. Use the boundary Satake reducibility statement to eliminate every residual eigensystem at m.

*Needs:* §5.2; §5.15; §8.4; ShimuraCompactifications 4.3–4.10 and Layer 7.

**Checks.**

- The output is H⁰ boundary vanishing over C; it does not supply integral or all-degree vanishing.

### 8.6 Localized degrees zero and one

In the totally real setting of §8.5, H⁰_sub→H⁰_can is an isomorphism after localization, and H¹_sub→H¹_can is injective with image H̄¹. Thus H^i_sub,m≃H̄^i_m for i=0,1. This does not identify H¹_sub,m with all H¹_can,m. For the Q case, all-degree boundary vanishing gives H^i_sub,m≃H^i_can,m in every degree. Apply these statements also to P20’s large Ω^(k,2) range with the corrected localized H¹ notation.

(BCGP21, Proof of Theorem 3.10.1, p. 239; P20 Corollary 15.2.3.1 and proof, pp. 108–109).

A proof route is to localize the long exact sequence for 0→F_sub→F_can→F|D→0. Use only the vanishing degrees actually proved; at H¹ the missing H¹(D) remains on the right. Identify the injection image with the defining interior image and compose with the automorphic comparison.

*Needs:* §8.5; §8.2; §6.1; §5.16.

**Checks.**

- A nonzero H¹ boundary class is consistent with the totally real conclusion; surjectivity onto all H¹_can is not inferred.

### 8.7 Cuspidal exhaustion for all rational singular weights

For GSp₄/Q, weight (a,2) with a≥2, neat prime-to-p level and a non-Eisenstein residual ideal, assume EndoscopicTransferAndUnitaryTraceComparison §11.1 under the symplectic classification contract of its §§11.0g–11.0h, the nongeneral-type exclusion of §7.0 and the full-group local coherent calculation of AutomorphicFormsOnReductiveGroups §§6.3–6.7. In degrees j=0,1, localized interior cohomology is exactly the multiplicity-counted cuspidal sum with the holomorphic (j=0) or generic (j=1) archimedean limit and the same finite level and residual congruence. Boundary vanishing identifies this with localized subcanonical cohomology. No large-weight lower bound on a is required for this conditional rational result.

(CG20, Proof of Theorem 7.11, pp. 54–55, using Theorem 5.2 and Theorem 5.6).

A proof route is to place interior cohomology between the injective cusp image and the L² relative-cohomology source. First apply §7.0(a) and the rational case analysis of §7.0(b), which follows CG20's proof of Theorem 7.11 and not BCGP21 Lemma 2.9.1 (whose parity hypothesis fails for odd a), to every L² occurrence with nonzero coherent cohomology at this coefficient, excluding the nongeneral types with the residual Galois witness before any temperedness is known. For a surviving general-type occurrence use the §7.0 spin orbit to verify Clozel algebraicity of its cuspidal GL₄ transfer after the dimension-four shift by 3/2, apply AutomorphicFormsOnReductiveGroups §5.5's cuspidal purity theorem `clozelPurity` to that transfer, and transport essential temperedness back along the supplied local-parameter comparison; Wallach then makes the global representation cuspidal. The same cuspidal sum bounds both sides. Use the full compact-group degree calculation and actual multiplicity spaces to identify degrees zero and one.

*Needs:* §8.2; §6.4; §7.1; §7.0 (nongeneral-type exclusion, rational case analysis); EndoscopicTransferAndUnitaryTraceComparison §11.1 under the symplectic classification contract of its §§11.0g–11.0h; AutomorphicFormsOnReductiveGroups §5.5 (`clozelPurity`, for algebraic cuspidal GL₄ representations in its fixed Clozel normalization); AutomorphicFormsOnReductiveGroups §§6.3–6.7; AutomorphicSpectralTheory §4.10.

**Checks.**

- At a=2 the shifted weight is (1,0), with memberships C₀,C₁ and neither C₂ nor C₃. Under §7.0’s classification and multiplicity-one hypotheses, a fixed finite representation σ occurring in this cuspidal sum with dim_C σ^K=d has σ-isotypic contribution (§6.6) d in degree zero and d in degree one, the sum of its holomorphic and generic full members. For d=1 these contributions are 1,1; omitting its generic archimedean partner would incorrectly give 1,0 (CG20, proof of Theorem 7.11, pp. 54–55).
- At (a,2) the contragredient spin orbit of §7.0 is (3/2,3/2,5/2−a,5/2−a); subtracting 3/2 gives (0,0,1−a,1−a), integral, so the GL₄ transfer is algebraic in the Clozel convention even with repeated entries (at a=2, (0,0,−1,−1)). Purity is invoked through the algebraic cuspidal theorem, not a regular-weight or large-gap theorem; an integral orbit such as (0,0,1,1) would shift to half-integers and fail algebraicity.

### 8.8 Localized coherent cohomology and cuspidal representations

There is an absolute real constant R_gap>4, independent of the totally real field, the totally split prime, the reasonable level, the coefficient field and the residual ideal, in the fixed |·|² central normalization, with the following property for every weight, automorphic occurrence and degree i∈{0,1}. Let F be totally real and let p be totally split. Use the model and reasonable level of §8.5, weights κ=(k_v,l_v) with k_v≥l_v≥2 and k_v≡l_v modulo 2, the |·|² central-diamond subspace and a non-Eisenstein residual ideal as in §5.15. Then for i=0,1 there is a Hecke-equivariant injection from the multiplicity-counted sum of π_f^K into H^i_sub(X_C,ω_κ)_m, where π is cuspidal, congruent to m, holomorphic at real v with l_v>2 and nonholomorphic at exactly i places among those with l_v=2. For degree zero the holomorphic cusp dictionary gives equality. For degrees zero and one, the large-gap assumptions k_v−l_v>R_gap and either l_v=2 or l_v>R_gap at every real v give equality with the stated cuspidal sum. Multiplicity-free indexing additionally uses the conditional classification package; no unconditional multiplicity-one statement is claimed.

(BCGP21, Theorem 3.10.1 and Remark 3.10.4, pp. 236–237; proof pp. 239–240).

A proof route is to use the cusp→interior comparison and the localized subcanonical/interior identification. Apply local coherent-degree calculations and Künneth with finite-level invariant spaces. Use the uniform global separation theorem of AutomorphicFormsOnReductiveGroups §6.6 (the uniform global GSp₄ separation contract) in BCGP21’s |·|² central normalization. Choose its absolute root-separation constant R_sep>2 before F, level, weights, occurrences and degrees, then enlarge R_gap so that R_gap≥R_sep+2. At λ_(κ_v)=(k_v−1,l_v−2), the four coroot values are k_v−l_v+1, k_v−1, k_v+l_v−3 and l_v−2; the elementary gaps make each nonzero value greater than R_sep. The global theorem makes the actual L² occurrences essentially tempered. Prove the central reduction for these occurrences: twisting by |ν|⁻¹ cancels the |·|² central character because ν(zI₄)=z², and converts the weighted square-integrable realization to the unitary central quotient. Apply AutomorphicSpectralTheory §4.10 on the corresponding semisimple arithmetic quotient, then transport cuspidality back; the twist is trivial on every unipotent radical, so constant-term vanishing is preserved. Use the local calculation and Künneth for surjectivity, preserving multiplicity spaces until the separate classification input is imposed. Section 7.3’s R_sing is a different, local bound.

*Needs:* §8.6; §6.4; §6.9; §5.16; AutomorphicFormsOnReductiveGroups §6.6 (the uniform global GSp₄ separation contract and the elementary-gap comparison); AutomorphicSpectralTheory §4.10.

**Checks.**

- For a test separation threshold R_sep=3 choose R_gap=5. Weight (8,4) has gaps 4 and 4 but pairings 5,7,9,2, so it fails separation and the new gap hypotheses. Weight (12,6) has gaps 6 and 6 and pairings 7,11,15,4, all greater than 3. These values test the conversion of thresholds, without claiming an effective analytic constant.
- A field-dependent bound R_F=2+[F:ℚ] satisfies the quantifier order with F fixed first, but has no upper bound as [F:ℚ] grows, so no single R_gap≥R_F+2 serves every F; the absolute R_gap of this section needs R_sep chosen before F.
- At (8,2), the gaps 6 and the allowed l=2 give pairings 7,7,7,0; the zero wall is permitted by separation, and a regularity condition forbidding it would lose this singular case.
- At (10,6), k−l=4≤5 rejects the weight although l>5; both elementary inequalities are required.
- In the central reduction, take z=2 at one real place and identity elsewhere: |z|²=4 and |ν(2I₄)|⁻¹=1/4, giving central value 1; the positive twist would give 16. On a unipotent element ν=1, so the twist factor is 1 and a zero constant term stays zero; for the identity scalar it is also 1.

### 8.9 Conditional coherent dimension equality

Choose the absolute R_gap of §8.8 before F, level, weights, occurrences and degrees. For every datum satisfying that section’s hypotheses and k_v−l_v>R_gap, with l_v=2 or l_v>R_gap at every real place, assume EndoscopicTransferAndUnitaryTraceComparison §11.1’s general-type comparison of L-packets under the symplectic classification contract of its §§11.0g–11.0h. Let l₀ be the number of real places with l_v=2. Then dim_C H¹_sub(X_C,ω_κ)_m=l₀·dim_C H⁰_sub(X_C,ω_κ)_m. Independently, over Q the conditional all-weight exhaustion and pairing within packets give h¹=h⁰ for every a≥2 in weight (a,2), with no large-gap hypothesis, at neat prime-to-p level and non-Eisenstein localization. The factor l₀ counts permitted single archimedean changes within each of the packets with the same finite part.

(BCGP21, Corollary 3.10.5, p. 237; CG20 proof of Theorem 7.11, pp. 54–55; P20 Proposition 15.2.4.1, p. 109).

A proof route is to group the multiplicity-counted cuspidal summands by their finite part and global parameter. Use EndoscopicTransferAndUnitaryTraceComparison §11.1’s conditional general-type multiplicity-one comparison to pair holomorphic with each permitted single generic archimedean change. Multiply the equal finite-level dimensions by l₀ and sum over the residual congruence summand.

*Needs:* §8.8; §8.7; §7.0 (nongeneral-type exclusion); EndoscopicTransferAndUnitaryTraceComparison §11.1 under the symplectic classification contract of its §§11.0g–11.0h; §6.9.

**Checks.**

- If l₀=0 the formula predicts zero degree-one cohomology under the same large-weight and classification hypotheses.

### Examples

For a totally real field with two real places, both with l_v=2, a permitted general-type finite part σ with dim σ^K=d has σ-isotypic contribution (§6.6) d in degree zero and 2d in degree one under the imported multiplicity-one theorem. With only one such place the contributions are d,d; with none they are d,0. These counts retain the global hypothesis on L-packets.

### Dependencies

ArithmeticGaloisRepresentations §1.8 and Layer 5; AutomorphicBundles Layer 12; AutomorphicFormsOnReductiveGroups §4.1; AutomorphicFormsOnReductiveGroups §5.5; AutomorphicFormsOnReductiveGroups §§6.3–6.7 (with the uniform global GSp₄ separation contract); AutomorphicSpectralTheory §4.10; ShimuraCompactifications 4.3–4.10 and Layer 7; SmoothRepresentationsOfLocalGroups SR.2; SmoothRepresentationsOfLocalGroups SR.4; §7.0. Earlier in this layer use the individual prerequisites displayed above.

## Worked examples

**Finite coefficient duality and reduction.** For the trivial Δ-torsor over Spec O and coefficient O, the cochain model is Aₙ[Δ] in degree zero, with the regular deck action. Its Aₙ-linear dual has the inverse deck action and identifies with the Matlis-dual chain model using x↦x/ϖⁿ. Derived coinvariants give Aₙ in degree zero. This test simultaneously checks the group ring, the dual action and the downstairs coefficient. In contrast, the trivial Fₚ[Cₚ]-module Fₚ has higher Tor; substituting its ordinary coinvariants for derived descent discards information. In the Hochschild–Serre edge sequence the possible Tor₂(H₀) contribution must remain until an actual vanishing theorem removes it.

For another reduction check, take the two-term O-complex O→O in cohomological degrees 0 and 1 with differential multiplication by ϖ. Its H⁰ is zero and H¹ is k. Derived reduction to k has zero differential, hence H⁰=k as well as H¹=k. Thus H⁰(C)⊗k→H⁰(C⊗ᴸk) is not an isomorphism. The coherent base-change theorem is a theorem about derived complexes, not an automatic termwise statement about cohomology modules.

**Small weights at the endpoint.** Set p=7 and (a,b)=(4,2). The hypotheses a≥3 and 2≤a−b≤p−2 hold, giving subcanonical vanishing above degree two. Since a+b=6, the second range applies at its lower endpoint and gives vanishing above degree one. The third range does not apply because b<4. The dual weight is (1,−1). The shifted characteristic is (3,0), lying in both C₀ and C₁, and the normalized scalar exponent a+b−6 is zero. The GL₄ transfer has entries {3/2,3/2,−3/2,−3/2}. These checks keep the mod-p theorem, characteristic-zero chamber statement and arithmetic normalization distinct.

The explicit Lan–Suh substitutions can be used to discharge the integer-range proof step. For the length-one weight choose t=max(1,b,ceil((a+b−2)/2)), α=t−b, β=a−2−t. For length two choose t=max(1,b−1), α=a−3−t, β=1+t−b. For length three choose t=b−3, α=a−b, β=0. In the respective displayed ranges, verify α≥β≥0, t>0 and α+β<p−3. The first two have α+β=a−b−2; the third has α+β=a−b. The exact smallness and logarithmic lifting assumptions remain supplier obligations; solving the arithmetic does not prove the integral BGG theorem.

**Chamber walls.** For (a,2) with a≥2 the shifted pair is (a−1,0), so C₀ and C₁ both hold, and C₂,C₃ fail. For (a,3−a) with a≥2 it is (a−1,1−a), so C₁ and C₂ both hold, including a=2. There is no extra C₀ contribution at that endpoint. The origin belongs to all four closed chambers. A definition that assigns a unique chamber to every singular parameter fails these tests.

**Boundary exactness and counts of members of packets.** Localizing the long exact sequence of 0→F_sub→F_can→F|D→0 after proving only H⁰(D,F|D)_m=0 gives an H⁰ isomorphism and an H¹ injection. Its image is H̄¹_m; H¹(D,F|D)_m can still obstruct surjectivity. Over Q the all-degree boundary theorem removes that obstruction in every degree. The all-weight Q cuspidal exhaustion and dimension equality are conditional on the exact classification and multiplicity input for packets and include a=2; they do not rely on the separate large-weight theorem.

For a totally real field with two real places, fix R_gap as in §8.8 and suppose both weights have l_v=2 and k_v−2>R_gap, and assume EndoscopicTransferAndUnitaryTraceComparison §11.1’s general-type theorem on L-packets under the symplectic classification contract of its §§11.0g–11.0h. Each finite part has one holomorphic choice contributing to H⁰ and two permitted single generic changes contributing to H¹. With equal multiplicities this gives h¹=2h⁰. If instead exactly one l_v is 2 and the other is >R_gap, retaining all the gap conditions, the count is h¹=h⁰. This counts permitted members of global packets, not a formal tensor-product dimension without component-group constraints.

## Downstream consumers

GSp4NonregularModularityLifting uses the integral coherent complexes, duality and equivariant perfect models of Layers 1–2, the correspondences and normalized Hecke operators of Layers 3–4, the vanishing, relations and localizations of Layer 5 and the boundary and cuspidal conclusions of Layers 6–8. Higher Hida theory and p-adic families of singular-weight forms use the integral derived Hecke maps, normalization and support comparisons of Layers 1–5. Automorphic Galois constructions use the actual normalized polynomial dictionary and residual localizations in Layers 4–5. Congruence and patching constructions use the equivariant perfect complexes of Layer 2 and their localized summands in Layer 5. Classical singular-weight applications use the precise boundary and multiplicity-counted statements of Layers 6–8. Each consumer retains the model, degree, coefficient and conditional hypotheses on packets of the result it uses.

## References

- **CG18.** F. Calegari and D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. Invent. Math. 211 (2018), 297–433; author PDF, 137 pages. [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf).
- **CG20.** F. Calegari and D. Geraghty, *Minimal modularity lifting for non-regular symplectic representations*. Duke Math. J. 169 (2020), 801–896; author manuscript, 96 pages. Locators here use manuscript pages 22–55 and 86–88, with theorem numbering as in that copy. [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf).
- **P20.** V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*. Duke Math. J. 169 (2020), 1647–1807; author manuscript, 17 June 2019, 113 pages. Locators below use manuscript pagination. [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).
- **BP26.** G. Boxer and V. Pilloni, *Higher Hida theory for Siegel modular forms*. Invent. Math. 244 (2026), 45–141; author manuscript dated 5 November 2025, 65 pages; locators use manuscript pages. [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
- **BCGP21.** G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*. Publ. Math. IHÉS 134 (2021), 153–501; publisher PDF; locators use printed pagination. [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf).
- **Sch15.** P. Scholze, *On torsion in the cohomology of locally symmetric varieties*. Ann. of Math. 182 (2015), 945–1066; arXiv manuscript uses chapter V and Corollary V.1.7, p. 83; published §5.1, pp. 1035–1036. [Sch15](https://arxiv.org/abs/1306.2070v2).
- **Su24.** J. Su, *Coherent cohomology of Shimura varieties and automorphic forms*. Ann. Sci. ENS 57 (2024), 1039–1099; arXiv:1810.12056v2, 29 July 2024; locators use preprint pages. [Su24](https://arxiv.org/abs/1810.12056).
- **Lan17.** K.-W. Lan, *Integral models of toroidal compactifications with projective cone decompositions*. Int. Math. Res. Not. 2017, no. 11, 3237–3280; corrected author manuscript, 35 pages; with the published errata. [Lan17](https://www.kwlan.org/articles/cpt-ram-nbl.pdf).
- **LanSuh.** K.-W. Lan and J. Suh, *Vanishing theorems for torsion automorphic sheaves on general PEL-type Shimura varieties*. Adv. Math. 242 (2013), 228–286; author manuscript, 57 pages. [LanSuh](https://www.kwlan.org/articles/van-tor-aut-gen.pdf).
- **HZ01.** M. Harris and S. Zucker, *Boundary cohomology of Shimura varieties, III: coherent cohomology on higher-rank boundary strata and applications to Hodge theory*. Mém. Soc. Math. France (N.S.) 85 (2001); doi:10.24033/msmf.398. [HZ01](https://numdam.org/item/MSMF_2001_2_85__1_0/).
- **BR16.** R. Brasca and G. Rosso, *Eigenvarieties for non-cuspidal modular forms over certain PEL Shimura varieties*. arXiv:1605.05065v1, 17 May 2016; Proposition 1.14 is numbered 1.5.8 in the version cited by BCGP21. [BR16](https://arxiv.org/abs/1605.05065v1).
- **Lan17err.** K.-W. Lan, *Errata to Integral models of toroidal compactifications with projective cone decompositions*. Author’s one-page published errata, linked from the author publication list. [Lan17err](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf).
- **LanSuhErr.** K.-W. Lan and J. Suh, *Errata to Vanishing theorems for torsion automorphic sheaves on general PEL-type Shimura varieties*. Authors’ two-page published errata, linked from the author publication list. [LanSuhErr](https://www.kwlan.org/articles/van-tor-aut-gen-err.pdf).
- **H90.** M. Harris, *Automorphic forms and the cohomology of vector bundles on Shimura varieties*. Automorphic Forms, Shimura Varieties, and L-functions II, Perspectives in Mathematics 11 (1990), pp. 41–91; public scan hosted by J. S. Milne; printed pagination. [H90](https://www.jmilne.org/math/Books/AA1988b.pdf).
- **GK19.** W. Goldring and J.-S. Koskivirta, *Strata Hasse invariants, Hecke algebras and Galois representations*. Invent. Math. 217 (2019), 887–984; cited by published locator. [GK19](https://link.springer.com/article/10.1007/s00222-019-00882-5).
- **CS19.** P. Scholze (joint work with D. Clausen), *Lectures on condensed mathematics* (2019), Definition 9.1 and the following paragraph, p. 62; Theorem 9.8, pp. 65–70; Lecture XI, pp. 71–75, especially Proposition 11.2, Definition 11.3 and Proposition 11.4. [CS19](https://www.math.uni-bonn.de/people/scholze/Condensed.pdf).
