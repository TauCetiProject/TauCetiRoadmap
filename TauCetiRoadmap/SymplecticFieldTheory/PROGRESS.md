# Progress log: SymplecticFieldTheory

An append-only record of what landed on the SymplecticFieldTheory roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"80b20e70d219092cb9b8d010c8f4bb45f5feb4bb","prs":[28580,28775,30600],"roadmap":"SymplecticFieldTheory","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
## SymplecticFieldTheory: 2026-11-06 to 2026-11-09 (`80b20e7` to `7ca783d`)

The first piece of this roadmap's Layer 0 algebra has landed: the free supercommutative algebra on an integer-graded module, [`SignedSym`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym). It is the tensor algebra modulo the Koszul relation xy = (−1)^{pq} yx on homogeneous generators. It will carry the contact differential once orbits and counts exist. Its generators [supercommute with the Koszul sign](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym.generator_mul_generator), and it has the universal property as an [equivalence](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Basic.html#TauCeti.SignedSym.liftEquiv) between sign-compatible linear maps and algebra maps. It also comes with functoriality in degree-preserving maps and an augmentation, which shows the coefficient ring embeds (TauCeti#28580).

The algebra is now [internally ℤ-graded by input degree](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Grading.html#TauCeti.instGradedAlgebraIntSignedSymSignedSymPiece), with a [graded universal extension](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SignedSymmetricAlgebra/Grading.html#TauCeti.SignedSym.gradedLift) that is unique among graded maps (TauCeti#30600). The route is the one the roadmap prescribes. First the tensor algebra gets its own [input-degree grading](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/TensorAlgebra/Grading.html#TauCeti.instGradedAlgebraIntTensorAlgebraTensorAlgebraPiece) induced from a grading of the generators. Then the Koszul relation ideal is shown to be homogeneous, using a general fact that the kernel of a [relation quotient is spanned by the differences of related elements](https://taucetiproject.org/docs/TauCeti/Algebra/RingQuot.html#RingQuot.ker_mkRingHom_eq_span).

Still missing from Layer 0: the comparison with Sym(V_even) ⊗ Λ(V_odd), the tensor-product splitting of A(V ⊕ W), the parity reduction, and the odd-derivation theorems. Nothing has landed yet on Reeb orbit multiplicities, orientation lines or good and bad orbits.
